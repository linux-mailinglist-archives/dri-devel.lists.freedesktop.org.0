Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EFB46CFE50
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 10:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F69610E20D;
	Thu, 30 Mar 2023 08:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCE8C10E1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 08:32:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9054D1FEA4;
 Thu, 30 Mar 2023 08:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680165127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=erz4jcfE0i3ogqVfA3e84Ce+sGUmg5Rq1WWVBc20V40=;
 b=roiBHS4WpakTor2yBdpSNcqnIOGnsiyPPf3pmX+9ah7AxLCYLd1Qu3uY3vobOwBUah/3oR
 pzCxd5KYIm9HD++yR/2w2S1Y6mTB1VIr8MPAG0kr5F9VSiGgxjYTShh2+bcBVqpIXRnVnx
 GB2zNqBrMknn2mc//TCy7txvHkVYA1s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680165127;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=erz4jcfE0i3ogqVfA3e84Ce+sGUmg5Rq1WWVBc20V40=;
 b=b+HiM6FAD0vtrzdPUyPYHQEgUCz7CsmktWHeyrnBKRD+TlJICXZBu7Giy1Z8saLENqthpV
 R5mZXQCLML7bj2DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63BAD138FF;
 Thu, 30 Mar 2023 08:32:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5I9mFwdJJWTlGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:32:07 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: tomba@kernel.org, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH 0/6] drm/omapdrm: Convert fbdev to DRM client
Date: Thu, 30 Mar 2023 10:31:59 +0200
Message-Id: <20230330083205.12621-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert omapdrm's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. As
with most other drivers' fbdev emulation, fbdev in omapdrm is now just
another DRM client that runs after the DRM device has been registered.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

I did the conversion from similar experience with other drivers. But I
don't have the hardware to test this. Any testing is welcome.

Thomas Zimmermann (6):
  drm/omapdrm: Include <linux/of.h>
  drm/omapdrm: Remove fb from struct omap_fbdev
  drm/omapdrm: Remove bo from struct omap_fbdev
  drm/omapdrm: Remove fbdev from struct omap_drm_private
  drm/omapdrm: Initialize fbdev DRM client
  drm/omapdrm: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/omapdrm/omap_debugfs.c |   6 +-
 drivers/gpu/drm/omapdrm/omap_drv.c     |  13 +-
 drivers/gpu/drm/omapdrm/omap_drv.h     |   3 -
 drivers/gpu/drm/omapdrm/omap_fbdev.c   | 165 ++++++++++++++++---------
 drivers/gpu/drm/omapdrm/omap_fbdev.h   |   9 +-
 5 files changed, 114 insertions(+), 82 deletions(-)

-- 
2.40.0

