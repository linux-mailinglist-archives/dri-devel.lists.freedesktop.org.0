Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C816243AC
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 14:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A543310E7CA;
	Thu, 10 Nov 2022 13:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B255810E7CA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:55:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7468E22A83;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1668088521; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ccay7hIydCw9RjSQemH6gV8Vbm1e4kl6H52Pk4hX0Qw=;
 b=WHvwScZ1GQlhzItrvL6RfvwSxK9Xvz2cWX+fvhK1B3sxwzTWA7ZRHth8rsQaEGdicK5+gk
 wZgBg++QbejlKmNgGk6kjlhkSGbUYt96wabTe44GPdrgG3wScP68oo32TCtzvF70Py0Znt
 cV9wn30gDeJq2nyYJlW1tRNZt7CiJiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1668088521;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Ccay7hIydCw9RjSQemH6gV8Vbm1e4kl6H52Pk4hX0Qw=;
 b=3zKCclwJ4aDqmJxiS3zjAZ5w9WPjhOOBYs8FXEFji4yZ+73NktDad8pzeEv2l5M0+Yp+QM
 QJvvaLH/tBv/DpCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 531E81332F;
 Thu, 10 Nov 2022 13:55:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id STKFE8kCbWP/DAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 10 Nov 2022 13:55:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH 0/5] drm/fb-helper: Remove damage worker
Date: Thu, 10 Nov 2022 14:55:14 +0100
Message-Id: <20221110135519.30029-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
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
console to look for any changes to performance.

  mplayer -nosound -vo fbdev -benchmark big_buck_bunny_1080p_surround.avi

On my test system (i7-4790, simpledrm, 1024x768), this command always
takes around 95 seconds (57% VC, 36% VO, 7% sys). The difference in
internal scheduling appears to have no impact on performance.

[1] https://download.blender.org/peach/bigbuckbunny_movies/big_buck_bunny_1080p_surround.avi

Thomas Zimmermann (5):
  drm/fb-helper: Set damage-clip area in helper
  drm/fb-helper: Move dirty-fb update into helper function
  drm/fb-helper: Perform damage handling in deferred-I/O helper
  drm/fb-helper: Schedule deferred-I/O worker after writing to
    framebuffer
  drm/fb-helper: Remove damage worker

 drivers/gpu/drm/drm_fb_helper.c     | 116 +++++++++++++++++++---------
 drivers/video/fbdev/core/fb_defio.c |  16 ++++
 include/drm/drm_fb_helper.h         |   2 -
 include/linux/fb.h                  |   1 +
 4 files changed, 95 insertions(+), 40 deletions(-)


base-commit: 3aa97a74d622aa26fe79cf4bd819b6a4fd176e90
-- 
2.38.0

