Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A96E55BE7C2
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 15:56:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA5CA10E1B1;
	Tue, 20 Sep 2022 13:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE8E10E1BB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 13:56:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B9D31F898;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663682181; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WGPfSAmRy04Au8IewrR4ldkQ2SgfLFLFJlT0w6ex/T0=;
 b=0lxamr5wnZo+2cAMaJM7bztJtrvdsV8oAzsm05dmKu4ANC/Kx1zyjxZMMOeRQjXFSF90ng
 GYEUA0ZivcGdY85r6OWpeJLGHfrS3I7oF+N18CVJH6GdAsmyv5wYjp4TYQO5HKGhE2HyK5
 fhztSrMR45K3KNJnnVrNXZBO2WMR4e0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663682181;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=WGPfSAmRy04Au8IewrR4ldkQ2SgfLFLFJlT0w6ex/T0=;
 b=h8Qct2yXHXydFLkkNowOhHYaKfpbzRvJMV21ibaOHFTlrxnHlLuWv6awKIWBxGm/U6B9Gt
 eI8ozsK5kMfb3RCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 390121346B;
 Tue, 20 Sep 2022 13:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BfQ0DYXGKWO9BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Sep 2022 13:56:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, robdclark@gmail.com, drawat.floss@gmail.com
Subject: [PATCH 0/5] drm/damage-helper: Improve damage-clipping heuristics
Date: Tue, 20 Sep 2022 15:56:14 +0200
Message-Id: <20220920135619.9209-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM Drivers can minimize a plane update by looking at damage clipping
information provided by userspace. So far, not having damage information
starts a full-plane update. Improve the heuristics for detecting partial
and full-plane updates by looking at the various state variables of a
plane update.

The current scheme of interpreting 'no damage information' as 'do full
update' works for hardware with a single primary plane. For hardware with
multiple planes, missing damage information can generate significant
overhead. For example, ast supports a primary plane and a cursor plane.
DRM performs an atomic update when the cursor plane is being updated in
some way (e.g., moved). The lack of damage information on the primary
plane results in a full-plane update of the primary plane as well. Using
shadow planes that need to be memcpy'd to video memory creates a full
redraw of the entire primary plane whenever the user moves the mouse
cursor.

The patchset improves the current heuristics by looking at various
state variables to detect whether a full update is necessary.

Patch #2 decouples full-plane updates from the (non-)existence of
damage information. Full-plane updates are still the default, but
the dedicated flag in the plane state allows for more fine-grained
control.

Patches #3 to #5 enable partial plane updates on various conditions.

The patchset has been tested by converting ast to SHMEM and running
Gnome on X11, Gnome in Wayland mode, and Weston. The new heuristics
reduce each environment's unnecessary updates of the primary plane to
no-ops: DRM still invokes the primary plane's atomic_update, but the
costly memcpy to video memory is being avoided.

Thomas Zimmermann (5):
  drm/damage-helper: Style changes
  drm/damage-helper: Decouple partial plane updates from damage clipping
  drm/damage-helper: Do partial updates on legacy cursor changes
  drm/damage-helper: Do partial updates if framebuffer has not been
    changed
  drm/damage-helper: Avoid partial updates for DIRTYFB without damage

 drivers/gpu/drm/drm_atomic_helper.c       |  3 +
 drivers/gpu/drm/drm_atomic_state_helper.c |  3 +
 drivers/gpu/drm/drm_damage_helper.c       | 99 +++++++++++++++++------
 include/drm/drm_plane.h                   | 23 ++++++
 4 files changed, 105 insertions(+), 23 deletions(-)


base-commit: d8deedaa0fcd8192715a052a0239bee3f74a8fb1
-- 
2.37.3

