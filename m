Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95887892D45
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:44:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2458910E5F1;
	Sat, 30 Mar 2024 20:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="AhwjF26m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A62C410E5EE
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-341cf28e013so1995549f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831423; x=1712436223; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=;
 b=AhwjF26mduhscif7Vhc0eM+6aUBvoqX62b5gNACZ5xPm4Gi/Zf98HTQalNckItZzt5
 vPS1zE+SRdszjufNPFop//NM5vZF4VBiJqYgTjEMr+ACOKA3prmhNovhMtAn8lsA4W4W
 1l/IQL2usdyVSUDlh0eSFdzsXXC0SNwCjmVuh2tSnr7FsJbFlfXsd2SMvCa+uyDEPmWj
 VpM0Gd0+w4zSYJ30xqBvQs7bTULnYFOYGAWfarFiXcVuJo7SQMOSIQwjZH+ZZUCLjq9w
 Abna1Wo3UyoNy7DyMn2G0FbIxyBdbbVtwek9atrNOmnJg8emGFy4a9pNz48THOPixcro
 x+mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831423; x=1712436223;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tE55+oHy1SdFZMDti49ppLTo/iHekalp6UeR7soZNdc=;
 b=xPR2xXx9wlyd21hkVFyDQR7U1OYsSBaH3Hm0C+MjxNpy5JH42YSP/pUW+lNpAET2c1
 5A6vF1OuzbbWZ8jl9MG5Du153fyq2UnY70OL0tSlRISTcaMgkDWG9KSsPrFWonRCRtoo
 bX5kybX0CQbEhv0rWMCoUkP2rtYFjP13gBiBxv97gZknPM63RsmVZwgDuTeawkzJuIP9
 /LkrKfXMu0ZDM2/yNPBNXMAiJ2k2qMZduZ2an9KmOPy4+DVVQvdt0XQ8BNxD/gCaIuNW
 8qE51jcSewZtOtT2VSowc7kg2I0jspTk22PxbttETUAY8Y0bYSgHwWc0meQazDBicvLk
 0kZw==
X-Gm-Message-State: AOJu0YygNkoVmCSR2g4orDIbSF2wBsmIB+cMUqhyj6d3QGGhW8VcA4cq
 fWQ4EtwUZVL9bxwQWRgZ7c7Y5kcD0Bkw2CUiCm0rZhaFizDMVXo17n3nJd55k08=
X-Google-Smtp-Source: AGHT+IGhj6aUvEDGcPyq+BIjFVcHMWr4SCkwY++xRHGQ99myAD65Sbm7IyItf+0BA4rNbjIYqK9HxA==
X-Received: by 2002:a5d:526d:0:b0:343:3ede:c166 with SMTP id
 l13-20020a5d526d000000b003433edec166mr2587207wrc.68.1711831423068; 
 Sat, 30 Mar 2024 13:43:43 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:21 +0100
Subject: [PATCH 10/11] drm/mediatek: mdp_rdma: drop driver owner initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-10-fd5c4b8d633e@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=838;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rma3zTFbs+wEApKyePcrne7HCkkuvoEKS0IhtWThFuA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlsrCBkLAni5OwOGut1qOb6HE9LI4wMpnfhf
 n1aFWutFbiJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5bAAKCRDBN2bmhouD
 18TRD/4hW6BmN4P/LbhIRVJSb1k9TFXOIB9cs6FIcrKfP12OOg96bu9RGCDfqrgclJKkoX37g6a
 L9PgCn4kK+nn0LNe36FCIyVvSuEcjJN9+L8BKV4//9XSt2e51YTTAOftpHQiSmCZIqthA04LBlc
 AC0gnGoXRcbX3fcdFkDgX6hFf6ToGnJoRu6/X4PyBokuQQ8BR+Ur7uZam2g4en+JI/+7IfgMC1d
 k6yLqsyKDM88+tu3blzU62agRcLDQPd5grNTqJuucWoZst5v9o1yITxlmCGUiNjks5psg/+9d2V
 QV/tG0gWaqr88RwaN6qOg+vH3uaZNIJMs3PtxnwJXDsXeBTmOornUfpNoex/3dWoXvjvZKZLLk0
 Hue2CNIzFX+YU72PMe3ISgRSb/IOl6Lcu0olEd0sHM/LOLM9kPAdXXwtFq19NBm+wGRZYlVDODp
 CcvzB6XhOHLs1favpokkW40O8N65NbEoElIHQcLVdNkdHglONyHACxOBTOjuB/1/ngkKDuji04h
 Uymh1ShYQZme+rKTAAPwB1fR7C7ngwGJSPo0hFr2z8tGWoQ+XK0sBiXPdJe8AnhkX9QvYEgoNdx
 qbJ8kojb6R3jVRU6pNebLl/QZn92wtkY/TvwuQFFjVmWgfj84VPb0dKfvozoOeHomg/XMHSqhiJ
 UB1nDx7vuAY2Q6g==
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
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
index ee9ce9b6d078..925cbb7471ec 100644
--- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
@@ -346,7 +346,6 @@ struct platform_driver mtk_mdp_rdma_driver = {
 	.remove_new = mtk_mdp_rdma_remove,
 	.driver = {
 		.name = "mediatek-mdp-rdma",
-		.owner = THIS_MODULE,
 		.of_match_table = mtk_mdp_rdma_driver_dt_match,
 	},
 };

-- 
2.34.1

