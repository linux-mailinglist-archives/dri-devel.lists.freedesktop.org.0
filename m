Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AFA3B5AB8
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F4FA89F45;
	Mon, 28 Jun 2021 08:50:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8A7989F45
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 08:50:54 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id g7so15633347wri.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Jun 2021 01:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
 b=U5RttCDInB3rDob0B5Dcq6/Xyhvc9wz8sZ8N+wWaNMXZOvdChN7mX6a/FDT7jGGO5B
 Km08kaThC7gGa7Q83XjZak1i6z/RUGIPGFY6Et94LmQhCb/TH3SyeqANgL3dLiju9Gb0
 oSy9HN6XaHnxH34/zes1RTu2PV04E6PCf+iVrePfIvhosLHN4um3c6ZNYTUzQIJ8EOTR
 6VLle0zILlHPxBxIVW6mNzi7UdE4lqdQd/NkPjeOKZvE5y4huA81pvsVgRCU00UEsFow
 +NVfKlCppBxpRDEcNt9jpnTQ7XpYM9ZVZPcJESh+dYu/1GpjO6hLNa3Qs9nkbVwhsbj1
 EQQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ivMWyakmLeaYuI23t/O2pRde3mjJQDvPIshj9I2/bxk=;
 b=uap6kfrU6In8QL7W4x3EIIMCrWDho08lNwpjBVlqMSEs9rwrZNQDDFvRQpVVKq8poh
 Nf9uZ8FG7p2kNUJp+ZPvX8DGAglVEL0zBBZYM7HvK2kn7HIGUjafUt3NKqPVyPgWVQhk
 XjmpRDCHRymCWKiaTwdElmbgMDpuU/lTRu+ORMXCoktSett68mGu6S54AZR0Y2yBR5UF
 /XIinkwr39pYaxtqku5u7+pgrefLasAbIiZktw8cGSHMQoXGJdcidcyxuAbrSVkM8BwI
 5RBHpZftYVbb6u0fsL8lLisOY1CmiBDsKu10oys99oaxVe3W8Tewy33axyCJih1Wls9q
 9iQg==
X-Gm-Message-State: AOAM532PLhshqPEDErChGwgSXR7N6ZMNQIfrfqDxSb/hcpTzHozHi99c
 xQxQBarfrLHHgyomUeRlGAaNAA==
X-Google-Smtp-Source: ABdhPJx5O2B7LqCOPQfcupkEEJVd6rGqE+bx5F0HEMmyXyLyhRTJwjgwPYZa2H8Ud0EveatM7tT/kQ==
X-Received: by 2002:adf:f384:: with SMTP id m4mr25707885wro.12.1624870253640; 
 Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:b773:c98e:f11:e83f])
 by smtp.gmail.com with ESMTPSA id j35sm7379565wms.7.2021.06.28.01.50.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 01:50:53 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 jonathan@marek.ca, dmitry.baryshkov@linaro.org,
 angelogioacchino.delregno@somainline.org, lee.jones@linaro.org,
 kalyan_t@codeaurora.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1] drm/msm/dpu: Fix sm8250_mdp register length
Date: Mon, 28 Jun 2021 10:50:33 +0200
Message-Id: <20210628085033.9905-1-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The downstream dts lists this value as 0x494, and not
0x45c.

Fixes: af776a3e1c30 ("drm/msm/dpu: add SM8250 to hw catalog")
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..5d30c7f33930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -244,7 +244,7 @@ static const struct dpu_mdp_cfg sc7180_mdp[] = {
 static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	{
 	.name = "top_0", .id = MDP_TOP,
-	.base = 0x0, .len = 0x45C,
+	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
-- 
2.30.2

