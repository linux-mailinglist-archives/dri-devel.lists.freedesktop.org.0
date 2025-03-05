Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9A0A4FF85
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A3A10E76A;
	Wed,  5 Mar 2025 13:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i2o2xG9C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B4A10E75F
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 13:06:46 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e5b572e45cso573571a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 05:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741180005; x=1741784805; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g64carhpN86lM7kPnuUc7tjq3kR3ZxlKeoOmJi6Slgs=;
 b=i2o2xG9CiaKAWlk7DZAfn69CJJOyMv47IppijuBHp6U3BLLvwnzvrcxWdEBPiKz6mH
 u5IMiaoivTX/ktUH/JTmOxLEvQpCECUdhJbIsvzplnqN7IRhQ9rL76FqA1wXjwJpSaSN
 aWxnX3wmWrLxp4S7oPhPNHWAcoHR0NMgryQdiNSyoJ2WJXtf6RBq9w39oPJhRRofmXmU
 UFw5IWk0jggk58FqhzQZaWFAX3oCbeDLWSDQHP0BBqnX5mBYdnBjMYiMG97hKrWlj47Q
 UROsVUbXhUDOyOKzgwXeG1gph/+DOX/OlnLFuGXFRtanH5i6FUJkh9UNMbP/hWyWBgET
 jYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741180005; x=1741784805;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g64carhpN86lM7kPnuUc7tjq3kR3ZxlKeoOmJi6Slgs=;
 b=YmPs370yZ1cDSgL7tg5gBsqqxmiMaT1wy/HdmUlvbhO2q5Xg1ez/iqCRWEHJrWutX1
 P2MaZocp3pwcT+6emH/Z2UakNl9MrEOazS3xkR4Le+TCfRzRwRBiIl72cos5znYdFQsy
 xpQXAXA4QYLFRgxEncHJ75N3pbTsvFEmwxOOd3u3h/JjVK+4GEFyzi+BugxaJNc3IHx0
 tNUaDAZ2ewohWuNEWXZLUyvX1JFltFwW8yaOPbuDJTAzTA89aHrmTEEUXEziNFkjOrO9
 x+Srafw/7d1piI0BY1qXnLeO11NGSGIgU6RB+s/Rb+87cs+JpfKFq/Lc6/LDNybN3Uu9
 zOsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaZR/tphM/qx03qtr/8Xvniqm7se/j92n2OeGF/b++uLxrMd3/Ci/JsXTJZVP+UD3rFQOQXxFf8kI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXS8n67bfQ3Sm0A6AQ1cw4895Y4W9W4OAOKfl9uHKC4Mj9AXGv
 IP05B/yEuCrnRrf6oP58FHhbh6pniNyDfIWjg52WMGR7JPppDhgUv6tIq1+A+A1fm/+WsZupktH
 XO1Y=
X-Gm-Gg: ASbGncsOv6c6gWh1GHKGULnY/91Awcie8PjfbNd0FqIQ3Z3v/56KOyssc03leeYnk+u
 zmlzxSb8B3XlMKuPli2vGOR9BV0c8ugqz/60akQBIKVuehN/Q4V4YkTH1O5aYrtuGbHi31k9bLA
 zdYHwJ+nzFyIsT5kgaW6iEpNYEPbS5Cn7WvJ4ZkxZo+cFbSTtpFlZ8P/6yoo8NQIenUHDLUJSTG
 UX8dEI0mwAado4RMD2TTgGg4UXEkELdVW8By2Vsb2JVzxHVHkg3Xezpt/Ab9pdUPPeKfnqm7VeG
 HNHIp69q9ueeuWiLF6k3D8T4s8f2aSthMImB/rMmfeygtr4rp1sxjICdjTGZ4kMlMq/oe3HZud2
 SMQwITPYuHasSM/89ZjBMPQ==
X-Google-Smtp-Source: AGHT+IHAJQdH7f8KJt+R2ffDvxbc7sUQ+b3jomBMCSiokLRmAxj8briZ+1p+KDuEOOHd7BerJyZSMw==
X-Received: by 2002:a05:6402:5203:b0:5e1:9725:bb3e with SMTP id
 4fb4d7f45d1cf-5e59f4869femr3345168a12.28.1741180005006; 
 Wed, 05 Mar 2025 05:06:45 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 05:06:44 -0800 (PST)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 op-tee@lists.trustedfirmware.org, linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
 Thierry Reding <thierry.reding@gmail.com>, Yong Wu <yong.wu@mediatek.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T . J . Mercier" <tjmercier@google.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Sumit Garg <sumit.garg@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 02/10] optee: pass parent device to tee_device_alloc()
Date: Wed,  5 Mar 2025 14:04:08 +0100
Message-ID: <20250305130634.1850178-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

During probing of the OP-TEE driver, pass the parent device to
tee_device_alloc() so the dma_mask of the new devices can be updated
accordingly.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/ffa_abi.c | 8 ++++----
 drivers/tee/optee/smc_abi.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index f3af5666bb11..4ca1d5161b82 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -914,16 +914,16 @@ static int optee_ffa_probe(struct ffa_device *ffa_dev)
 	    (sec_caps & OPTEE_FFA_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_ffa_clnt_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_clnt_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_pool;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_ffa_supp_desc, NULL, optee->pool,
-				  optee);
+	teedev = tee_device_alloc(&optee_ffa_supp_desc, &ffa_dev->dev,
+				  optee->pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..165fadd9abc9 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1691,14 +1691,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
-- 
2.43.0

