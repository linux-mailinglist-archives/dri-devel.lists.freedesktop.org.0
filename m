Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F3080CC1E
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 14:57:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1CE710E43B;
	Mon, 11 Dec 2023 13:57:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D56A10E43B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 13:57:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 75DA7CE12A3;
 Mon, 11 Dec 2023 13:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33DDAC433CA;
 Mon, 11 Dec 2023 13:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702303045;
 bh=mVATHGkj2IODGubr45CT5oHwTG1yNk//Ea4XEK18KC0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DrjbSt2JXQI2VczF70QlOvIBlBo/EiNINzLt0eV5atNP4ZSddkzgECGHL7oU6nfbA
 tQ29ZcdjgozVGTRSmEVZhH/5lQVybOUgAUYiaBfUwlKYbmROxnnWX29zDLNbtRBliL
 8QE2hzpcouy2npcqplT/GIbXOPMa0k7pRZIlIomRbxl9NPfjn/IsqovQ0hfy9Nj+7K
 FpYM5CLOM0NRo28a5fWxLTLzsD0PGrHKYRBxB7ODLMBLJTSG4PnbfMY0/r2/rphOtT
 3nNFusECHK3nvRKhPTCm+ewv4P6t0wOUkCPWPIrYxGsPX9xxWKh29qv/Vpjoox4+9w
 mllnodSxHqk2g==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 26/29] drm/exynos: fix a potential error pointer
 dereference
Date: Mon, 11 Dec 2023 08:54:10 -0500
Message-ID: <20231211135457.381397-26-sashal@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211135457.381397-1-sashal@kernel.org>
References: <20231211135457.381397-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.66
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
Cc: Sasha Levin <sashal@kernel.org>, linux-samsung-soc@vger.kernel.org,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 dri-devel@lists.freedesktop.org, krzysztof.kozlowski@linaro.org,
 Xiang Yang <xiangyang3@huawei.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiang Yang <xiangyang3@huawei.com>

[ Upstream commit 73bf1c9ae6c054c53b8e84452c5e46f86dd28246 ]

Smatch reports the warning below:
drivers/gpu/drm/exynos/exynos_hdmi.c:1864 hdmi_bind()
error: 'crtc' dereferencing possible ERR_PTR()

The return value of exynos_drm_crtc_get_by_type maybe ERR_PTR(-ENODEV),
which can not be used directly. Fix this by checking the return value
before using it.

Signed-off-by: Xiang Yang <xiangyang3@huawei.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index b7c11bdce2c89..1a7194a653ae5 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1861,6 +1861,8 @@ static int hdmi_bind(struct device *dev, struct device *master, void *data)
 		return ret;
 
 	crtc = exynos_drm_crtc_get_by_type(drm_dev, EXYNOS_DISPLAY_TYPE_HDMI);
+	if (IS_ERR(crtc))
+		return PTR_ERR(crtc);
 	crtc->pipe_clk = &hdata->phy_clk;
 
 	ret = hdmi_create_connector(encoder);
-- 
2.42.0

