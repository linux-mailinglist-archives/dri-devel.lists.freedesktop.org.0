Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FBB586C74
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 15:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 470E414BB3C;
	Mon,  1 Aug 2022 13:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A7EC18F5
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 13:50:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4E71C4DF17;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659361831; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iP6rdSRnlCLFbNRs7RkXjAAiUsiwAfmsLbjbP2Idve4=;
 b=aH8poV0H9aTESUg0QbngItfUpXQs3ZDPmkmaKDAEB/X3qw+UpRhYZpvTwb2JjN6iRtQA16
 d4OZ205cpCwe4uN5xCfnnBtGrNQ8WkB3ruVE6DiU3N8vMikq+z8+Jls+1cRKMF0MCQ90vb
 rbGdWFe9JI2veRzCwDoQRphVWKatPVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659361831;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=iP6rdSRnlCLFbNRs7RkXjAAiUsiwAfmsLbjbP2Idve4=;
 b=Ka30Ho22ZDj+ma81wCzlKGfEC5lQAQOWRrS054dK3L5/x8n1wyCjCu93o6uxSwuuX+IJjY
 ikXXYmH1DIK0IsBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A3D413A72;
 Mon,  1 Aug 2022 13:50:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JKthCSfa52IDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 13:50:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, geert@linux-m68k.org, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v3 0/5] drm/simpledrm: Various improvements
Date: Mon,  1 Aug 2022 15:50:23 +0200
Message-Id: <20220801135028.30647-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.1
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

Patchset contains various improvements for simpledrm that were
implemented in preparation of adding another firmware graphics
driver. [1] Javier and Geert already reviewed the changes and
it was agreed that they could be merged independently.

We start with v3, as that's were we branch of the original
patches.

v3:
	* branch from ofdrm patches
	* fix stride calculation
	* fix usage of drm_atomic_helper_check_plane_state()
	* remove empty CRTC atomic_{enable,disable}

[1] https://patchwork.freedesktop.org/series/106538/

Thomas Zimmermann (5):
  drm/simpledrm: Remove mem field from device structure
  drm/simpledrm: Inline device-init helpers
  drm/simpledrm: Remove pdev field from device structure
  drm/simpledrm: Compute framebuffer stride if not set
  drm/simpledrm: Convert to atomic helpers

 drivers/gpu/drm/tiny/simpledrm.c | 559 ++++++++++++++++---------------
 1 file changed, 293 insertions(+), 266 deletions(-)


base-commit: 06ec37c2c220f7213b91af6148dbd5d772a171b1
-- 
2.37.1

