Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E333EAA6E98
	for <lists+dri-devel@lfdr.de>; Fri,  2 May 2025 12:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA69610E174;
	Fri,  2 May 2025 10:01:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XJ6riUER";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360D210E07E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 May 2025 10:00:58 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-ac28e66c0e1so195827466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 02 May 2025 03:00:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746180057; x=1746784857; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
 b=XJ6riUERSQ3zAdkZ/Q+9Im5+dx2XqLzjXllsVTkAv1BNM2yb4/6s/Ig82+s0XM/9UI
 bpAEypW3DbfnXRwmm52cMNlewfvnyW1uCnEra7V6GxDup9N9ShpMx49b8Os1qNBOEr4u
 +Uir6qEfQKbN29zvWuaSBvdnZT0n0uUwr5LVlZTMqNdU51twfUVsMXY5mKy+wXgKzwN6
 Gd2wgNKfmDOCJl9GqwdFu5sAc5dh53N/LrIChLsOSP+Ygm01K4zB1WG28Z2MDDr4+dq3
 R/zEWCDRvWKE281iZMX6bX9+ee4BSWC4jdM9JkV1PdcRxla/hbTihzn5R2i4y/DQzKyp
 5gIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746180057; x=1746784857;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5X2I1MlNrc8OtxTMPdYsTmJ1JjM0sba198ISiH4P8wU=;
 b=eI5MSaa74w3p7T/6T3DRFgulFTfP8ZdbRWthy7ws5dOMffKk6DHw9QLqbgVwCdtgu7
 hY1zeMoNU29PTynq/eNHtYTtHFELC2Uwuu5wieveU8TKmbXrylEqU4N2oPFl98TdMwZv
 SrIY1fs4znUHxNux1yl0RozTaBQYqzdED7/eKPRq30LdfNuHla/D9L77Y2mSlk7z5Emg
 enuxloWj71ALXk07uBFLpHtLySbSTOxm9Rlt/r3lQ/Y9IqJXbcGOAydjv4PU+P4OFAg/
 hZNPk/0QfcVivcEJ4Z+/eqjAgy3izz4vbu0SLQEsQupGkrXmkxikVmK2HSMJb0A+/nox
 xQAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrNkYsELW1W/0eKakX6sXHuIO47zaSURdH9mruXv2fXHfz9SgPnnSB5AfWSWniT6nLYPgr8tEu5iM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxVg8gllvwEMdx5l4lCXy4dHhL0Wkk0MRVT5Jf+kQ/XbZYnE3Vx
 cm2ZtuJcqrw/Pwdf5dIc3tzRcFEjbxrTuqnuzaEMYUQRYJ+K7GlLj0DZHMdK76g=
X-Gm-Gg: ASbGncv9DYOj9aMqhZQGLEKUYPumCERbVCTMnIU1R+n4gi1tyXIHav1SuOlUYYGd+o7
 /oBGeTTQ3bihVFsL6ZISHncJ2GTnyvYK6PO4n7y1e5a5SxGcZo8Sjzu0SygH3Qdsj9FyxSB3gwZ
 NKa5Dm3jHjZ78XwG8Dh7lj4RfQqs1gyRz3hHbs3U/HYLy8x7IxtJMrTqrG6KeCCw4EpMQxTsQQ2
 o3bKu3jIsdDlMiUFvyyfomDPqquikiXPInrpVXwAp5Zv5PWumUp/DhxPkfaKmF4tgJN1DlfWtRp
 5w4BZv7vxQt3ObE6hpAgeUKNemi18gcMpRkEFmsBD2QhONG++Froz9xQZ26DhJ8hA+Py4+X0Tuy
 AHaBcuxJtjzyd5CeozQ==
X-Google-Smtp-Source: AGHT+IExOoNljerMnP1yPtzh01rTrQJbnwgTFzxXZMgDFfUCD64SgckGTYoDWopJzNJPBPdV4tUdDA==
X-Received: by 2002:a17:906:6a23:b0:ace:ed3b:285e with SMTP id
 a640c23a62f3a-ad17af80380mr236112866b.56.1746180056392; 
 Fri, 02 May 2025 03:00:56 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 May 2025 03:00:55 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>,
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v8 02/14] optee: pass parent device to tee_device_alloc()
Date: Fri,  2 May 2025 11:59:16 +0200
Message-ID: <20250502100049.1746335-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
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

