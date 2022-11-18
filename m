Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F5662F648
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 14:35:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3B610E739;
	Fri, 18 Nov 2022 13:35:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3613510E739
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 13:35:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ED4731FA6D;
 Fri, 18 Nov 2022 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668778537; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RXC3tHru6KeDpfkCmImRBQj04iF/0nJ9blI9FXr3EN8=;
 b=RxxiU1zDZZoqoal+5G4/wINJfxHZdRoc19FpHAseiEtQRya+sDEuhNN159Uph8bhOD6rAb
 xqGx2pSCiGcL7spuasBSSWmVOsOi4dOzsH1Phdot8YXQJL+qJanpyeH59QNMnyNQpIe6m8
 f7hG3kbybfn3E3dhCw72Cg1WlnDdeoY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668778537;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RXC3tHru6KeDpfkCmImRBQj04iF/0nJ9blI9FXr3EN8=;
 b=uEOojezaSV8rju2PiyyRRVtHHpXPB/SOH+GZeQ1gHu+Tg7H3s/k4N2UbsZX9sOY7XdM+dv
 CQq+Iub9fqcy+WDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C6F1F13A66;
 Fri, 18 Nov 2022 13:35:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XcOILymKd2PHLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 18 Nov 2022 13:35:37 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 0/3] drm/fb-helper: Restore damage worker
Date: Fri, 18 Nov 2022 14:35:32 +0100
Message-Id: <20221118133535.9739-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.1
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

It turns out that the removal of the damage worker can lead to
locking cycles. The display update now runs while holding the
fbdefio lock, which conflicts with locks in the modesetting code
that updates the display. There's no easy fix for this, so let's
restore the damage worker. The display update will then again run
outside of the fbdefio lock.

See [1] for bug reports.

[1] https://intel-gfx-ci.01.org/tree/drm-tip/fi-kbl-8809g.html

Thomas Zimmermann (3):
  Revert "drm/fb-helper: Remove damage worker"
  Revert "drm/fb-helper: Schedule deferred-I/O worker after writing to
    framebuffer"
  Revert "drm/fb-helper: Perform damage handling in deferred-I/O helper"

 drivers/gpu/drm/drm_fb_helper.c     | 30 +++++++++++++----------------
 drivers/video/fbdev/core/fb_defio.c | 16 ---------------
 include/drm/drm_fb_helper.h         |  2 ++
 include/linux/fb.h                  |  1 -
 4 files changed, 15 insertions(+), 34 deletions(-)

-- 
2.38.1

