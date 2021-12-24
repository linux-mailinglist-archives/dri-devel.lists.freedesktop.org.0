Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A20547EF6C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 15:12:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EF8F10E466;
	Fri, 24 Dec 2021 14:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D3D10E466
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 14:12:44 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 f18-20020a17090aa79200b001ad9cb23022so8499626pjq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Dec 2021 06:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LKtQV5KTRsG9IHxm4FJ8noeMZxbwDc6IHyeC+WfY/3c=;
 b=DOT5KFFjCWbDDy6H/GZFBUsGa3dz2hC7lZ8IKarFYPUHQ31k8cjnbIyjeAL/l0rufw
 ZmjgZvi1UVw7zXFVPSRV5Ov9viyJVT/FSQU3zrh07RzGit/ITcDnAjVeV/730uTizIhi
 XMHg/0zL+tKPfY2Z/Yqbi3ONp3LeL/DGYJDIwnloo/D4J76szcbBqFJSx/cj05ZLfp4I
 2U6QXtr6udQVy8304kBPQhLqJ7nT39eY27Qt/ubmh60/C4xc5nM9L/x+86lY3BXikp27
 Sv81vhP/56kDSmPm+We2kN0a0o076Td9DH8wsbp6xcgpgElKpy4xjlYAYtWdjgmIx7Gj
 Uz1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LKtQV5KTRsG9IHxm4FJ8noeMZxbwDc6IHyeC+WfY/3c=;
 b=6F0hkx5ZpOT0nun09BWV2hYe4X9++BnzLqGL3tU2rZhyjuNX0pOotz2VJ1armByMd4
 Kz5OYvDIXqKFMv6z3hdJci5CQ7K4cRiqySEW92195FjSaKAgw6NqFij5E+2KWeYAqLgO
 m5ZXGOVZHItAh7/1kkuRVdKCODcBFsr4zpBVEKvbdiHyRcVIwhNagBKfjLz8l93HaDGb
 M9cwld4OHBH4C5xUXYyKio2J+3gmRXwzO0ZypfKgsQeK7JgO/aFegz2BkBXwMz7t6RLY
 BZfbuFdxwOUiSt95xv5Qww8I340mIZrtUPrT2Jsvnv78CfQmRVyjdS3rH3qg0l7cviUx
 UIpQ==
X-Gm-Message-State: AOAM531uBk5gu+MhJUgW6CPKNPx80EjBmvjjnmAoe8MyqNvbDJTgVBwd
 Kx+FUyQkBGMzdtFgSEnRv/Q=
X-Google-Smtp-Source: ABdhPJybx5hHsfhWlT1HsaOLuNvrZcxSGTni5JZ12FBvhaUDzheqGWOdte4SVFVxdXW4UpeapPdsDQ==
X-Received: by 2002:a17:90b:3b92:: with SMTP id
 pc18mr4228293pjb.213.1640355164338; 
 Fri, 24 Dec 2021 06:12:44 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:800:94db:99e3:c3c:2dfc:8554])
 by smtp.gmail.com with ESMTPSA id h7sm9919140pfv.35.2021.12.24.06.12.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 Dec 2021 06:12:44 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org, mark.rutland@arm.com
Subject: [PATCH v1 2/2] drm/sprd: fix potential NULL dereference
Date: Fri, 24 Dec 2021 22:12:13 +0800
Message-Id: <20211224141213.27612-3-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20211224141213.27612-1-kevin3.tang@gmail.com>
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
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
 lukas.bulwahn@gmail.com, orsonzhai@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

platform_get_resource() may fail and return NULL, so check it's value
before using it.

'drm' could be null in sprd_drm_shutdown, and drm_warn maybe dereference
it, remove this warning log.

Cc: Orson Zhai <orsonzhai@gmail.com>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>
Signed-off-by: Kevin Tang <kevin.tang@unisoc.com>
---
 drivers/gpu/drm/sprd/sprd_dpu.c | 3 +++
 drivers/gpu/drm/sprd/sprd_drm.c | 8 ++------
 drivers/gpu/drm/sprd/sprd_dsi.c | 3 +++
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 06a3414ee..69683b7ba 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -790,6 +790,9 @@ static int sprd_dpu_context_init(struct sprd_dpu *dpu,
 	int ret;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		dev_err(dev, "failed to map dpu registers\n");
diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d..54030839e 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -154,12 +154,8 @@ static void sprd_drm_shutdown(struct platform_device *pdev)
 {
 	struct drm_device *drm = platform_get_drvdata(pdev);
 
-	if (!drm) {
-		drm_warn(drm, "drm device is not available, no shutdown\n");
-		return;
-	}
-
-	drm_atomic_helper_shutdown(drm);
+	if (drm)
+		drm_atomic_helper_shutdown(drm);
 }
 
 static const struct of_device_id drm_match_table[] = {
diff --git a/drivers/gpu/drm/sprd/sprd_dsi.c b/drivers/gpu/drm/sprd/sprd_dsi.c
index 911b3cddc..955c5995a 100644
--- a/drivers/gpu/drm/sprd/sprd_dsi.c
+++ b/drivers/gpu/drm/sprd/sprd_dsi.c
@@ -907,6 +907,9 @@ static int sprd_dsi_context_init(struct sprd_dsi *dsi,
 	struct resource *res;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
 	ctx->base = devm_ioremap(dev, res->start, resource_size(res));
 	if (!ctx->base) {
 		drm_err(dsi->drm, "failed to map dsi host registers\n");
-- 
2.29.0

