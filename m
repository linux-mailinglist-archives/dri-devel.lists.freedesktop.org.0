Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A140C7DF310
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 14:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C01A10E871;
	Thu,  2 Nov 2023 13:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86DE10E87D;
 Thu,  2 Nov 2023 13:00:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB6421F8C8;
 Thu,  2 Nov 2023 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698930002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oGfP7JxMoxVg3I2CyDHRkHzhR9ppHJenaxjMVcrJan8=;
 b=B1rkXyyp0UUlsUjGqavTwu1H+65lGHj1KK+DaiNjRUKH5X7eBBX2pMYpQGNA2aiPPp41ou
 3U6CfHY0Mo2MjpBNETfR2HnNqOmZOTKCFD9G5BYwO981QlbqoJoT0rlX5yE2sW6rsoq7gU
 n6CJ3+ysDYvCxgtYU8IhiEPrQ/j9WHg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698930002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type;
 bh=oGfP7JxMoxVg3I2CyDHRkHzhR9ppHJenaxjMVcrJan8=;
 b=PpSDI1FLRHw2p8aNoHwntAlqrNTt0kCsQBXJKHuRWL3eLtUN4PpTegvS5oXvxYFk+SXYfK
 o9uqpc+Pa/L5fyAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A127D13A8C;
 Thu,  2 Nov 2023 13:00:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4vttJVKdQ2W3WQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 02 Nov 2023 13:00:02 +0000
Date: Thu, 2 Nov 2023 14:00:00 +0100
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-misc-fixes
Message-ID: <20231102130000.GA6353@linux-uq9g>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is the PR for drm-misc-fixes.

Best regards
Thomas

drm-misc-fixes-2023-11-02:
Short summary of fixes pull:

syncobj:
- Fix waiting for DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

vc4:
- Fix UAF in mock helpers
The following changes since commit b132ac51d7a50c37683be56c96ff64f8c887930f:

  accel/ivpu/37xx: Fix missing VPUIP interrupts (2023-10-26 07:43:28 +0200)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-misc tags/drm-misc-fixes-2023-11-02

for you to fetch changes up to 101c9f637efa1655f55876644d4439e552267527:

  drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE (2023-10-26 21:20:25 +0200)

----------------------------------------------------------------
Short summary of fixes pull:

syncobj:
- Fix waiting for DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

vc4:
- Fix UAF in mock helpers

----------------------------------------------------------------
Erik Kurzinger (1):
      drm/syncobj: fix DRM_SYNCOBJ_WAIT_FLAGS_WAIT_AVAILABLE

Maxime Ripard (1):
      drm/vc4: tests: Fix UAF in the mock helpers

 drivers/gpu/drm/drm_syncobj.c               | 3 ++-
 drivers/gpu/drm/vc4/tests/vc4_mock_crtc.c   | 2 +-
 drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

-- 
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)
