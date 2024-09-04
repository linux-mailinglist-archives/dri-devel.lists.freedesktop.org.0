Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D5E96BB44
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 13:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0F10E53E;
	Wed,  4 Sep 2024 11:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=tq-group.com header.i=@tq-group.com header.b="ieiD/Cmw";
	dkim=fail reason="key not found in DNS" (0-bit key; unprotected) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H8m7fNcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389A810E53E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1725450707; x=1756986707;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9bZTQfFErD83ZpeUe8f6tUjcWK8u+2HNM0QEJ6Cyo2s=;
 b=ieiD/Cmw/JUkiM7mdqL2miv3qSU6BbkdUw+V9fsuEuAf/ZYohJ3Q82Cw
 rw9r9QM2/KTKjoWR5X60leVPZN7rc12X446WVFfFRTfmsSnx2B8wpIazT
 PhNRvY6PlqmJxQv5a+KDmmOeCwmF11DvBenUkTe4iLTfpJ3+DEJIqiW1x
 DweGcHeln7BGWZ8G5YbFCy49011CN+PkNHqAUUMG245jaQh6HNwVbd+mp
 /4hKnRJN8JhpGs33ZcxhDsYBOVOHeQ53tzs+D5xZF2+cG3YzsfpaRQ8zM
 7KwC02Q6kWg5sPI62QhP10yIfmCm4Is9w6r04GdmRHYlPmv8CparR6I0q g==;
X-CSE-ConnectionGUID: IW9Wr4ScQwiKaAfT2Jmmfw==
X-CSE-MsgGUID: x6T6SRwUTl6+Zhy7GadJsw==
X-IronPort-AV: E=Sophos;i="6.10,201,1719871200"; d="scan'208";a="38762014"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
 by mx1.tq-group.com with ESMTP; 04 Sep 2024 13:51:45 +0200
X-CheckPoint: {66D849D1-3-5FF8EC80-F6CEE9F8}
X-MAIL-CPID: 99D071542BF70ABE41EF222ECB70A02A_0
X-Control-Analysis: str=0001.0A782F21.66D849D1.009F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BB6F4160CE2; Wed,  4 Sep 2024 13:51:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
 s=dkim; t=1725450700; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=9bZTQfFErD83ZpeUe8f6tUjcWK8u+2HNM0QEJ6Cyo2s=;
 b=H8m7fNcDNEbr2UgXpYCbXLE6+bcLeWCbZZz7su+xMjkRotOqFgAhEmikqiKKJx+5XT1oYE
 bjjSyD4RShMLwboAMSKRUApxwGEuX1enHfHrZSjsHpAQIjZrGVgMhmXPpQjKISoE1hJdrx
 ag7k0gVjL+0HiAzQIDBltjQLPnL7wb7XbzCvRTVyViWFkDzehQufnXrEXcTHwA9IAT6LuA
 jMF867Ugo9ASI6NiSii4EyPKf8yJyYSUWlYZNmuUbcswdq6ipgaH62zeeZbQlO8udLagLz
 Cje9rXlMHttAuEPhCkqcEYzixcRmGLx8r0VMG5Pp4Eusv+wn9KkJ0LO9KyVGAQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [RESEND 1/2] drm: fsl-dcu: Use dev_err_probe
Date: Wed,  4 Sep 2024 13:51:34 +0200
Message-Id: <20240904115135.1843274-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

fsl_dcu_drm_modeset_init can return -EPROBE_DEFER, so use dev_err_probe
to remove an invalid error message and add it to deferral description.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index a395f93449f3..90cbd18f096d 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -103,10 +103,8 @@ static int fsl_dcu_load(struct drm_device *dev, unsigned long flags)
 	int ret;
 
 	ret = fsl_dcu_drm_modeset_init(fsl_dev);
-	if (ret < 0) {
-		dev_err(dev->dev, "failed to initialize mode setting\n");
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(dev->dev, ret, "failed to initialize mode setting\n");
 
 	ret = drm_vblank_init(dev, dev->mode_config.num_crtc);
 	if (ret < 0) {
-- 
2.34.1

