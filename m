Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A38716D44B5
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 14:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645A110E46F;
	Mon,  3 Apr 2023 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E67F10E456;
 Mon,  3 Apr 2023 12:45:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1F6C1FF3D;
 Mon,  3 Apr 2023 12:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680525941; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hpiFlTmrji3Q9ytRoYjAuJC+JpPwu81VCde8xwkls0Q=;
 b=VwCWKEwxgqq0kM3hkVRD4H2LOOp47q3JJUh3yjKNCKB6Ls3uG0n3qZNMB/I4veMmZQtMHc
 rJr1eqL9/+mn7HKQ2wVPnvllua57+VwePV8iOJjX2xbYgKQ2i/ZciXDYfg0M3KFO6Bxsxx
 T8zr6guG6HpShafTnFwoFrVy2gzEflM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680525941;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=hpiFlTmrji3Q9ytRoYjAuJC+JpPwu81VCde8xwkls0Q=;
 b=1HJJWi1SYkw16PESCnrSbLoTKAF7Af9DvHH+gEBEmUDjzh/nYleHLUXs231P8AMdWazLu+
 ED+rwzIVGmvHp1Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B62551331A;
 Mon,  3 Apr 2023 12:45:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sim1KnTKKmTRVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 12:45:40 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 0/8] drm/msm: Convert fbdev to DRM client
Date: Mon,  3 Apr 2023 14:45:30 +0200
Message-Id: <20230403124538.8497-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert msm' fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in msm is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

v2:
	* handle 'fbdev' module parameter in fbdev code
	* add missing kfree()
	* minor fixes

Thomas Zimmermann (8):
  drm/msm: Include <linux/io.h>
  drm/msm: Clear aperture ownership outside of fbdev code
  drm/msm: Remove fb from struct msm_fbdev
  drm/msm: Remove struct msm_fbdev
  drm/msm: Remove fbdev from struct msm_drm_private
  drm/msm: Move module parameter 'fbdev' to fbdev code
  drm/msm: Initialize fbdev DRM client
  drm/msm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/msm/msm_debugfs.c  |   6 +-
 drivers/gpu/drm/msm/msm_drv.c      |  27 ++---
 drivers/gpu/drm/msm/msm_drv.h      |  12 +-
 drivers/gpu/drm/msm/msm_fbdev.c    | 173 +++++++++++++++++------------
 drivers/gpu/drm/msm/msm_io_utils.c |   1 +
 5 files changed, 125 insertions(+), 94 deletions(-)


base-commit: a7180debb9c631375684f4d717466cfb9f238660
-- 
2.40.0

