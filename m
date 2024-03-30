Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41254892D44
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2FA810E5B3;
	Sat, 30 Mar 2024 20:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KoqSV+QN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DEA10E4FB
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:41 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-33ed7ef0ae8so2005340f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831420; x=1712436220; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=7VY3Dmu4EorH40eckWnwkm3etCmE+/q9rUNJeyLZY5c=;
 b=KoqSV+QNu86QTsSPXex04DTFW4WqYYF7V/hjpUhe+71A7QrJ7ThW8clrdrCXY/0lXK
 gdBCY7hnTKp/dljsjvEFCIA/SR905+iLzI3zRQBMFfi60Q3vaEKcmCqW40hejJCQALlm
 efs/1vodeLhSooDYaplSMn2xtuzOwRAM6UBHcP9wbGQGJ/pSibL8fHwCAti1GTxtK9br
 uAd3ElDASMTKYO83xhwf2Y88NkzNCnzaoCEZISKp804cUOcPTYIw8Fpo/JXlJWrRU6VY
 zrtS5eIt7OKby2/eH2aDU97Sb7a5phjcz1AJvGlyoxEFPmH3bg8JhthscN0f9EeomdaS
 lsCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831420; x=1712436220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7VY3Dmu4EorH40eckWnwkm3etCmE+/q9rUNJeyLZY5c=;
 b=LBYNpacVYzSAHa+18oKHOqnAYKOlr8YEwmvyV2XYuFrlMPgE77cSM3yyTJI4zNlbHX
 TUEM33bAWEKumJQXVATGp2fGMlIlGOjGQqh3u/aLxfQKDVzyj7PpiOrmOnvq+tlvaKDp
 eqAvT2uxKX7J8uHgPI+DxjvFposLi9cBpoZZOqDL32NeiuJC08GBLRDQtKqDg+7ks6MX
 rhTBnShV0pYB6pVTK8ozGV8WQCoGMDOSzA+alGroqEXuFCp56IoPzkiNxrcYZRGhnyJt
 /qTi1YFjB1fhRfOAnnHCGK5peY881I/4IvWPpks1TZiyjsS0MWFAMtuhSBbMaiZvrd0L
 vlnA==
X-Gm-Message-State: AOJu0YwRSJtkxbnspUm7BP+iAqE6/lQML4LODABXlijHEnFDCb/KcCSy
 VhMfBe/RHaiAlHfiukYX8pEEaC4hmMkUouyjJwuHl1ZW1hpOhy2GPwwWKXymFt8=
X-Google-Smtp-Source: AGHT+IFbOCs9TFu+n2kbIFtRw36Yy/n4grYGsiHavju/CpmA97FWAH4OFTc4Ow13LOgAlK4kyeKMcQ==
X-Received: by 2002:adf:a38b:0:b0:343:30a2:3a3d with SMTP id
 l11-20020adfa38b000000b0034330a23a3dmr3563635wrb.62.1711831419771; 
 Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:19 +0100
Subject: [PATCH 08/11] drm/mediatek: rdma: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-8-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=848;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uAy7H4eGCdk2E7sc7F+qp9jeOr5X36oynpik4Iml/WI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlrb77pr3hI7+1RouTIhAWQ+29VPx2IGr5m0
 aF4RIu/KVOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5awAKCRDBN2bmhouD
 1yUMEACHHdY0DRk43LPsx8K5J8nDnUK18mFIQbvuGtiJzvZikxyF3zwRok38O2UNaH5BC8WnRL9
 SknXjkKjO47v/ExyECq7PZCAlGbVP1UUOGZPOmLwqprakytYugm/F8warYH7pyWbJlpyL6LMKb9
 /7xmg/t2T7chRpKnRpchAm/6nmdpeInomU/50jeYZOSz5GHq0jQA3a94tyyOoojAXTpWGxhtpSJ
 LAqhvP33/QUq7MMfF2fbdorclE3UW7iUM/gmzGrUnQsrnl5SmBzGsspbn18ewr54P4a/UdyyTm/
 q1w4UxOuC27FK9XMWFNjt3m/gRfTfEA69wJlVIqa8Ea7xjQeGkt3YBw8M2wg44Om97ykwxhCeRv
 CkNA/cTN/sMne1Et/eyRcUgT+nxHgVSgEMjQwYWHd8Jqxzu3G8P/oW1ZADpufAeMJg+aW0oqh/Q
 FBmIDXT2H6rCIR5w4SYctLhfgUp8C8AiTCUYlCxvZaQZY/QU7znvAbdRXQvafwNfzCkZ8fAQEP+
 sAbxYfedxBQ4IPQTuaRa0/efLUFzBkkftsZOXfC01j8UqCg1N7DN7Es8A+TOsEasn83a5pqHTOG
 FgNcwKOb7b7dJqQopW9HrzSoDWRDhAf8RT8t+OQnWbEOGoYwQa2pBMMhNQKCBq+aFrD1c6Lg/xW
 1XF3oPaEZT3NTlA==
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
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index faa907f2f443..844f5c2b56b6 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -428,7 +428,6 @@ struct platform_driver mtk_disp_rdma_driver = {
 	.remove_new	= mtk_disp_rdma_remove,
 	.driver		= {
 		.name	= "mediatek-disp-rdma",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_disp_rdma_driver_dt_match,
 	},
 };

-- 
2.34.1

