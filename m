Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFA892D13
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FBC10E6AF;
	Sat, 30 Mar 2024 20:34:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HgLLDOsi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF1FE10E4BD
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:33:31 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so1991018f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711830810; x=1712435610; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fgns3X2e/mAj3G7mz+2KMufeaerrm3z0CsboO9ch+As=;
 b=HgLLDOsi/SVcSIJGLdQLQTW+3s+AEhll8TV/591fWljgiMs3Jm6KWSanfiYP8HL0SY
 X9I86RhXROJfhOLsih4DBzFDFW8X6ct4uIEpw+ucO8mEzP8hcbTVTolXd39o14fwmyWn
 188Lruq0LBuaYMTBSrMPQtmPjizDIZD0tGeSML1RReLL8JxgorjN2pAPan/EYswAUL/i
 0bcnVxhfosfxNrt6TSh2Pzh1N+nSBsRSABMpEQgna6Z7vukIfctFJ0JmNQcL2myb2GfH
 2KXnW7IRDLZzVHU7Dvz1iwUg7KQ+ODHGO2kZECfjk1d5URzNSvl/j5gCtsjh9da+1Ut6
 Y/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711830810; x=1712435610;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fgns3X2e/mAj3G7mz+2KMufeaerrm3z0CsboO9ch+As=;
 b=G3HMy3KBWxU1X80eBSKgh8JZhXGo9IsAPnS6E+KfC/YwBXyJNS6auCnUazQxISEiSq
 m0JwQzvV9qxYZ34IiVbQSmqgp9W1BA+O4V8bMTHA+9PRBxdSCylhZ4cFLFWShucnxvOd
 kiRX6SGMDx9+ayz3O2TbiWQagz25403aW1dTI+te8shbezZSMPCdMui0lVQ5O90SFKx4
 /AwTKgZrr/eknWTnx6ZysEtVxShWq7oKC2gAk20wiN5k+0WxqidmzGIIYisaycOQEVOt
 MgWBsQdqhcZ+zgeeNgzZ0QM7i7kke/FtJAEyUzzMAQ7E2P7HNx3AKXo8HlFX684IyxeW
 84Fg==
X-Gm-Message-State: AOJu0Yw6WyHqSg7sa7yyt6lLDbPzVLvi0QQ9W1TKp9oYgXeRyNejbcH6
 S3p3F239bAgQ6CeeKGvNFwuSGS22LwY5JBfFlS71x7L09ExQ71BoUFQPEEMYLS8=
X-Google-Smtp-Source: AGHT+IFLrQkDU/bMLyABLBx+NeiC4mD9du/wlWOPvKy6LIBGYBVwN0Wlbkn6XEeyvwFsLpS/wKix4A==
X-Received: by 2002:adf:f805:0:b0:343:3bb1:f527 with SMTP id
 s5-20020adff805000000b003433bb1f527mr3666695wrp.23.1711830810154; 
 Sat, 30 Mar 2024 13:33:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 f14-20020adfc98e000000b0033b48190e5esm7209315wrh.67.2024.03.30.13.33.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:33:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:33:11 +0100
Subject: [PATCH 07/11] drm/exynos: rotator: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-exynos-v1-7-3fa30e2c7e5a@linaro.org>
References: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-exynos-v1-0-3fa30e2c7e5a@linaro.org>
To: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=868;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=b7itDapuTbhKWEZ7+JJg1uQGCmSRTmhv8Q+INR1UhUo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHcJNBhLmfYjCszx+Ztm/tnXD/cwyaCqhecaf
 tNisLnBM0iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh3CQAKCRDBN2bmhouD
 175fD/9C1HU4uO8YaIAZY2YmDOs0uEKnc4s1i5hi6P2V8IoJQuV9WkQqXv1df18GkcjIPCoqC4s
 nmG29x/Tcq8Lv0wAEgNjPq1ba74J8tsnHsflYYCvxbqwX8CV+2Vm/xVjBuTfgwgtCyc6JvNHwx2
 AM2pEuHcS0QM0VvvsAA8EwjO7fZT52NKDJlOyo4YxcPt3oI+f3AvNwrgwD1hKFrMeACAGS0PlYZ
 dDvY5v5Ey2+oUyOb2mgithXQ9kFYFE8/q9AGxv9bpPNzmMxnbSa08PgJ60Mb6c3R8kckYQOWWXm
 4a4bVKyPpLN6vjA/P5MjQDYKqtwOqoUWEYKx5L8HwBDwRRmTjwXF+QB/3/pzPfWVQpuaf+UacPJ
 53vUK6bIXoSC/Dtd38JN/QgufoHStGBfew5ovwaSZrl0X+KVg7UNrHjP3KXga/Ehj5G+OGV5a6M
 Kjuwf0seNbCTUOrNd25s9nUNx+RHXZmyFu/ODEddzxrq3BwKbp+extr7IgccBkK2ufR1Iuk9+W2
 0b944jKcCA9gBBvjBzO7KT7H+jJ/C9v4uO303lYm/DsA/4MSV/Ab93SSr4lOp+f5XY+wkrodfG3
 ijnEuKiyhA6kxmn+raTly5nBhm04FgFaVsbfstJlX3sc6IKtNaApmHY/oiB+5CMy749zEVPbMfM
 sKC5tYVAimQnslg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/exynos/exynos_drm_rotator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_rotator.c b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
index 5f7516655b08..2eb0b701672f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_rotator.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_rotator.c
@@ -454,7 +454,6 @@ struct platform_driver rotator_driver = {
 	.remove_new	= rotator_remove,
 	.driver		= {
 		.name	= "exynos-rotator",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&rotator_pm_ops),
 		.of_match_table = exynos_rotator_match,
 	},

-- 
2.34.1

