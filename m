Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21892A7BF53
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF3F10EBD3;
	Fri,  4 Apr 2025 14:32:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mP4gg2pI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CAB10EBD3
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:29 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-5e677f59438so3334750a12.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777148; x=1744381948; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
 b=mP4gg2pIJRLyEF5mqj9ATbQmE5EX1NeJriwY57L/JwCWMtg9Gw/TA781AQj6kojnWx
 HuDB7BUCsDPs5LpZIMaJRXEYINLHSTV7HpWJr4f72XY0LOPPXMFS8H5cf14M67TOMto2
 fHXm+Am+3rWTQVgufBiPNB+RxRZgoSeRmAVqqj4O32mmoambTtLZY70EU94VHDvLlPmJ
 Pp0oY4GXIBfwLHON/9Zmn3t82PK8lhH0q19DAu3OAVDxeZWU5ICv3m6FjcrlMjt5eemg
 Ibwd9x/K/LHx8/y/LR6t8Y6kgXFRT+eE7ewvRg3NfAP66uByI/rvDePZGJnJvGNqhLWs
 F6lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777148; x=1744381948;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
 b=beFHYc05xz9N892fnoMjKVqwR9QJ4ZSbW7jE2QOi7F8ApwGZhyz031XAArQ+3+rfWs
 SNssGC+dQMeoyvGZo11h7SNpjex22F4YOPvdcL1OXlr+Yh20IPwsNiZaICX4jgwA9a4a
 TaM1uygWpvyNQ0z/5+oKJPToocjiyNuAMuUc+vGH93rsYyL5l0RdyWNNQg5smCAJn3d8
 cpnMJ179QV549HhuuXMDXxFip4uyUuu/gaYLPsffzSCBIQryti5PCBB+lRbGjXMtyR3w
 HVtT8mpkxPEWTk3N+NN3WF0AeFXdpRcJgOCx7VCwrWTPqqSDWb5zvdNNZDN6YGes3pqB
 +1jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU8EvDJqLhvdWAjJyXHR7vOiSyLejvzJccVMTpqfXuu51uSt0MBFEgYoyfoILXGiX8EUxwR2c7T8E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmJyDj88BkE4enj5ZWxXWSRjvsad87SBF+m4xNVzjFDPaoUUwF
 r998USGQR/DjduC1gEIOtzgj51wb/FWd77KhNCkdlnp1UsQ4qPV9P/FMrZWAUiw=
X-Gm-Gg: ASbGnctoZxm84KwTQ7wEsjLEa+ZlPwNsEJQth5y07Np2XUT3lVMwq3KZPudzXNl/Iyu
 odCglASSDkGC2BAN+ZcujcT4AjhzYQ5o5l0h/kmvd5VLMQZ5sOHsLkHHDxt3Dd7+SkfccOlMLeS
 iI0nPv77jLMpnBT71UihKEP9t0HD/TqSGE9odVSg8I35PTpEwysJcCNBsf1M5VzEMmRuLdbjZGm
 mqggv8JY4aZn5zbUcnIfp7kbwFSsHRiEq4KzPwPCh5X9mHXRWwTkRPBW5C8Zc7TAK2uQ3K4UtX8
 gQ40hOx4SQQ9FFSNjYVCMm5w3f57d0XMPvHXUB4Fcj9KIDbtV94ASUvDFi4tuoVCesitQ4Lz3x0
 zaeKqPzd7kV0WX0xB3EKv2w==
X-Google-Smtp-Source: AGHT+IFkJLuZYKHkFqitQEQ3Yg1FLEq81E4C9if1/VM+Yaec4v2BrToG7RwujiSsE0q6nDmGLkPdOA==
X-Received: by 2002:a05:6402:4415:b0:5e5:e396:3f6e with SMTP id
 4fb4d7f45d1cf-5f0b661aaebmr2120030a12.26.1743777148470; 
 Fri, 04 Apr 2025 07:32:28 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:27 -0700 (PDT)
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
 Sumit Garg <sumit.garg@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 azarrabi@qti.qualcomm.com, Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 02/11] optee: pass parent device to tee_device_alloc()
Date: Fri,  4 Apr 2025 16:31:25 +0200
Message-ID: <20250404143215.2281034-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
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
Reviewed-by: Sumit Garg <sumit.garg@kernel.org>
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

