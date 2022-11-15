Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C516C6297D6
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 12:58:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F35E10E135;
	Tue, 15 Nov 2022 11:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B24E510E135
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 11:58:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 707F222D99;
 Tue, 15 Nov 2022 11:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668513502; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wfFkXa0/7Q8T8Vm84nbiUSI4s83PWGXr96YOdYWJ1UE=;
 b=YuacsXxF0kY77yAjjotlEVoGcRW9A70waKfx7sGtDsPhM7WCmYigi2/x4nXf3WcN5C2Azk
 I57/8NmJ8szQmjOXjosBq4YEJYdFXhPOM7sV0BJo9IQp6Eo+S5FbcZukqMx/YpMJw4JWjN
 ZNkKfFvgzqy0vQs0PnlGxMvXKKZkkOg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668513502;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=wfFkXa0/7Q8T8Vm84nbiUSI4s83PWGXr96YOdYWJ1UE=;
 b=r9BtRjfeXmrK2ULPpVLZbmPcvr7Ex/MChHEdZZ55hsCAjKf7PanvUAU88ZKZ9N9I9g5dtW
 NAj8QtwYPCdaNHCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4779413273;
 Tue, 15 Nov 2022 11:58:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Oy+mEN5+c2OELgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 15 Nov 2022 11:58:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH v2 0/6] drm/fb-helper: Remove damage worker
Date: Tue, 15 Nov 2022 12:58:13 +0100
Message-Id: <20221115115819.23088-1-tzimmermann@suse.de>
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

The fbdev emulation runs a separate worker that collects all changes
to the framebuffer and runs DRM damage handling. But this can also be
performed by the worker of fbdev's deferred-I/O code. Move damage
handling there, remove the damage worker and reduce the latency.

I ran a simple benchmark with mplayer and Big Buck Bunny [1] on the
console to look for any changes in performance.

  mplayer -nosound -vo fbdev -benchmark big_buck_bunny_1080p_surround.avi

On my test system (i7-4790, simpledrm, 1024x768), this command always
takes around 95 seconds (57% VC, 36% VO, 7% sys). The difference in
internal scheduling appears to have no impact on performance.

v2:
	* keep drm_fb_helper_damage() (Daniel)
	* fix function names (Daniel)
	* clarify comments (Daniel)
	* split patch #3 (Daniel)

[1] https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi

Thomas Zimmermann (6):
  drm/fb-helper: Set damage-clip area in helper
  drm/fb-helper: Move dirty-fb update into helper function
  drm/fb-helper: Remove test for fb_dirty callback from deferred-I/O
    helper
  drm/fb-helper: Perform damage handling in deferred-I/O helper
  drm/fb-helper: Schedule deferred-I/O worker after writing to
    framebuffer
  drm/fb-helper: Remove damage worker

 drivers/gpu/drm/drm_fb_helper.c     | 53 ++++++++++++++++++-----------
 drivers/video/fbdev/core/fb_defio.c | 16 +++++++++
 include/drm/drm_fb_helper.h         |  2 --
 include/linux/fb.h                  |  1 +
 4 files changed, 51 insertions(+), 21 deletions(-)


base-commit: 2cc304afd4967ceffd14940ff73a8beb31778f90
-- 
2.38.1

