Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FB949040B
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 09:41:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 352AF10E3F2;
	Mon, 17 Jan 2022 08:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5802710E3D0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 08:41:02 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c3so20546044pls.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 00:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEtzxmnMM6Tm4aFw5dyzl7Dg82zrHDn+xLKCSqcIoYA=;
 b=BZoX3xjzmctBGdLOcR11a7mx2a7G4JSQKkCEsd1DEAWP237u5GCSv9nlsVkLCatXR0
 5CQmYevH5xmHtOf9XE9BOJJZU0R1WNFSlKLue7aU+bHtIozo34kbZ5jp62JAUooIOCE+
 mvB5bGwdlLyAmazE6sCyNOsSoIqH8KCD7OBHTlxZtqeY2/wVZBlY6mkdko+QMWTviSns
 1HXzL9gP+EnsuY6dbKFhtQqit01ts+nIGF+aa954ja2A1kDb6krSsMlEGGmaDAvYXAE/
 F5j8iaN8yaDAL9mqsG9bUE7Ksp52819NVVF//7rt/q0PAp+xGQONraWH6UQpW1bNoFdU
 YxBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BEtzxmnMM6Tm4aFw5dyzl7Dg82zrHDn+xLKCSqcIoYA=;
 b=Rd/YM+je4mkoc6xJkk6E8DwKwUYP3+OZe2fpWnj6MdXzshBI3Mx10A3WaVeMAcMQoF
 UcfY86FRHpMRdLWpp7fP9BYrb3N1EopxSnzqNczBLJpSl3tvdqVHjsHvcRxA9mFDmX4j
 22Ri9mpT9QpT2FOWkXF7/AHFdF4db43CdaNwnlDvwsReuIiab8aSUWITKDoRRhycZBBf
 nc0UzbEwepIxTy3GL83KP32aJau7mf0rxNuJin736LieOB7dBDdR1KqEfVnj72WR+RdS
 W+2l8O91MPwxbWdEH7pGUA/rh3mrCZIZZq7aQT49a2YcgUeRk4IP1XvtqBj1iQsgFxjk
 o5nw==
X-Gm-Message-State: AOAM5328l2fYYx8QA0RWhrMj3pgVhGeShl5hPHAr7aq0H4W2gj/M5rLf
 HusYoUV1g6dDq8uUm8HfdQw=
X-Google-Smtp-Source: ABdhPJyKUf4iLLOgGSynqegS/pHGDCtLdascpbGORC9N0SwxRb5unf7azIBgzWg08E/buvKorUGnBw==
X-Received: by 2002:a17:90b:3884:: with SMTP id
 mu4mr16707808pjb.82.1642408862007; 
 Mon, 17 Jan 2022 00:41:02 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47b:800:d5d1:d9c9:3c3f:6ba3:517a])
 by smtp.gmail.com with ESMTPSA id a9sm12673695pfo.169.2022.01.17.00.40.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 17 Jan 2022 00:41:01 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, mark.rutland@arm.com, javierm@redhat.com,
 tzimmermann@suse.de, lukas.bulwahn@gmail.com
Subject: [PATCH v2 2/3] drm/sprd: fix potential NULL dereference
Date: Mon, 17 Jan 2022 16:40:44 +0800
Message-Id: <20220117084044.9210-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
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
Cc: devicetree@vger.kernel.org, kevin3.tang@gmail.com, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, zou_wei@huawei.com, pony1.wu@gmail.com,
 dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

'drm' could be null in sprd_drm_shutdown, and drm_warn maybe dereference
it, remove this warning log.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

v1 -> v2:
- Split checking platform_get_resource() return value to a separate patch
- Use dev_warn() instead of removing the warning log
---
 drivers/gpu/drm/sprd/sprd_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d..af2be97d5 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -155,7 +155,7 @@ static void sprd_drm_shutdown(struct platform_device *pdev)
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
 	if (!drm) {
-		drm_warn(drm, "drm device is not available, no shutdown\n");
+		dev_warn(&pdev->dev, "drm device is not available, no shutdown\n");
 		return;
 	}
 
-- 
2.29.0

