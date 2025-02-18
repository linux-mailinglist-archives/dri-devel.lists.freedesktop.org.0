Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CE0A39FFD
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 15:35:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA9010E0A3;
	Tue, 18 Feb 2025 14:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jq4JNSyD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D4910E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 14:35:41 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-545284eac3bso4737150e87.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 06:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739889340; x=1740494140; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
 b=jq4JNSyDEVZEvCQ52RNh6fL1cjDqhp8slmKFubsl0Qx4PJQebeR+snaLWKqWWgqgsC
 x75XCPB39L5qNWZrF/v1/kYrcrQRRaVAvjpJHr1dH7vVrfoKkwCOA3e1fl7W50gN/eOj
 g4WOVngqdD5ugBZjO+HewlKwUb20Wep+xgm0dxzuCODlVYcbU5NULnLnuI49bHOd6JgK
 9qTjYV5SW08DeD2eVYrEAUINj7s/viFngwlLGwEPUs/bSEkTxEnP3lH3BYlwWy9dc0As
 sf8rCXNgTPj7OqD2dSNvNfzhRqV+05Fe1Pq+Eo/cAxMl3GcZlwHv8oUiHcOTbg1YsulA
 pLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739889340; x=1740494140;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5crKMExrr5c3Q5dXwzY6LzWcqdtMg4U+Mqhx5XRVtIk=;
 b=n3pCr1bjMqWwkL1oGUL1y00koChkR6WovSs0YUi+n4p7XKO3jRSr8/80vTw2Lx6bqN
 n5UeSrAadSB0JAANUxOZGZ/gNfldmsibrDTf5nV02QmWIX6zBHIY/LlARxYmfoHzAVLD
 qNTOEtNyqWzyjMW6x0FDBCAIV4NWxmU5ex6zi/Zfsiuv6DDNmHED1dUH0fML72ojbXIY
 4i3GWxrMXbwe0vHqS34wwtZ24pd/nbMJI9k/0hRQhuaOQMQQBam2+qBctLaqH3u755R2
 Rzj5hcOblYfduOw8ZacqkkJ/V936kQsSPCGYYh3kWcwTrnW+RxCE6CKxdgMA7e10cYAG
 mlbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYzX2CZMGL852+NuxXZGF9uUul2q6lHLC2PHbf4/S9jwJ280uDSMp4/TBczOG7FP6s3B0ptDqqFzI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3SfuV9fRfWiVSjwalHYXCxVIqvCDa+GPq4ToexBNUPTExeV0k
 t3FJh3efByTjDRArWfNYwtjUbFt/xQKViv7OhiOzXT9yXROUHRTbcVcNLvwyu6I=
X-Gm-Gg: ASbGnctL8al8Pgk981GQepn+jWSFd+iSQs9SpUHZnbYjOIZbAOgdSi9XuRdwKj64ZI3
 OEmdCBDiFz5Vy7k5/lF09Xoy/6AL2cCHUVOj+LyFQvrTHiWlabbttoMsEEnu04tbCYGeoIS169/
 NMpiSrQA8sMPSaESCUEKIHn3GzsrmXcnfVDinzzpEvVtgAkGfyX0/5f3bR9aIV4xLaivkeIWBz5
 x1ScTM6KIxmUTCwYW0nEeTpJkeOvnOj1Gg8BQfd3wPTOfoALRqPCEXO+btadM3PnbZlwK2L099e
 nPVam5BVKNosGamDTm6f8xnpLKeOr3EHcmdICH9XcSuiRq/WXEwfkURaW3VLJsfOQmTy
X-Google-Smtp-Source: AGHT+IGHuwCuQFYm4XQIVFkYY86WrwdSnRz+8agLRLCIecYLWINXh1qm1vFaOFrES19B9Zbg/l5wSA==
X-Received: by 2002:a05:6512:1092:b0:545:a1a:556b with SMTP id
 2adb3069b0e04-5452fdb9988mr5179716e87.0.1739889339564; 
 Tue, 18 Feb 2025 06:35:39 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 06:35:38 -0800 (PST)
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
 Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 2/7] tee: add TEE_IOC_RSTMEM_FD_INFO
Date: Tue, 18 Feb 2025 15:34:51 +0100
Message-ID: <20250218143527.1236668-3-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
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

Add TEE_IOC_RSTMEM_FD_INFO to retrieve information about a previously
allocated restricted memory dma-buf file descriptor. This is needed if
the file descriptor from a restricted memory allocation has been saved
due to limitations in the application.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c    | 31 +++++++++++++++++++++++++++++++
 drivers/tee/tee_private.h |  2 ++
 drivers/tee/tee_rstmem.c  |  8 ++++++++
 include/uapi/linux/tee.h  | 27 +++++++++++++++++++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index f4a45b77753b..01a2a9513578 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -848,6 +848,35 @@ tee_ioctl_rstmem_alloc(struct tee_context *ctx,
 	return fd;
 }
 
+static int
+tee_ioctl_rstmem_fd_info(struct tee_context *ctx,
+			 struct tee_ioctl_rstmem_fd_info __user *udata)
+{
+	struct tee_ioctl_rstmem_fd_info data;
+	struct dma_buf *dmabuf;
+	struct tee_shm *shm;
+
+	if (copy_from_user(&data, udata, sizeof(data)))
+		return -EFAULT;
+
+	dmabuf = dma_buf_get(data.fd);
+	if (IS_ERR(dmabuf))
+		return PTR_ERR(dmabuf);
+	shm = tee_rstmem_dmabuf_to_shm(ctx, dmabuf);
+	if (!IS_ERR(shm)) {
+		data.flags = 0;
+		data.use_case = shm->use_case;
+		data.id = shm->id;
+		data.size = shm->size;
+	}
+	dma_buf_put(dmabuf);
+	if (IS_ERR(shm))
+		return PTR_ERR(shm);
+	if (copy_to_user(udata, &data, sizeof(data)))
+		return -EFAULT;
+	return 0;
+}
+
 static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	struct tee_context *ctx = filp->private_data;
@@ -874,6 +903,8 @@ static long tee_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return tee_ioctl_supp_send(ctx, uarg);
 	case TEE_IOC_RSTMEM_ALLOC:
 		return tee_ioctl_rstmem_alloc(ctx, uarg);
+	case TEE_IOC_RSTMEM_FD_INFO:
+		return tee_ioctl_rstmem_fd_info(ctx, uarg);
 	default:
 		return -EINVAL;
 	}
diff --git a/drivers/tee/tee_private.h b/drivers/tee/tee_private.h
index bf97796909c0..b076089b2512 100644
--- a/drivers/tee/tee_private.h
+++ b/drivers/tee/tee_private.h
@@ -25,5 +25,7 @@ struct tee_shm *tee_shm_register_user_buf(struct tee_context *ctx,
 					  unsigned long addr, size_t length);
 struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 				 u32 use_case, size_t size, int *shm_id);
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf);
 
 #endif /*TEE_PRIVATE_H*/
diff --git a/drivers/tee/tee_rstmem.c b/drivers/tee/tee_rstmem.c
index 3b27594ec30b..5108772f3ca0 100644
--- a/drivers/tee/tee_rstmem.c
+++ b/drivers/tee/tee_rstmem.c
@@ -178,3 +178,11 @@ struct dma_buf *tee_rstmem_alloc(struct tee_context *ctx, u32 flags,
 	tee_device_put(teedev);
 	return dmabuf;
 }
+
+struct tee_shm *tee_rstmem_dmabuf_to_shm(struct tee_context *ctx,
+					 struct dma_buf *dmabuf)
+{
+	if (dmabuf->ops != &rstmem_generic_buf_ops)
+		return ERR_PTR(-EINVAL);
+	return dmabuf->priv;
+}
diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 88834448debb..30ab5bd80a55 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -431,6 +431,33 @@ struct tee_ioctl_rstmem_alloc_data {
 #define TEE_IOC_RSTMEM_ALLOC     _IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 10, \
 				       struct tee_ioctl_rstmem_alloc_data)
 
+/**
+ * struct tee_ioctl_rstmem_fd_info - Restricted memory information
+ * @fd:		[in] File descriptor returned from the previous allocation
+ * @flags:	[out] Flags from the allocation
+ * @use_case:	[out] Restricted memory use case, TEE_IOC_UC_*
+ * @id:		[out] Identifier of the restricted memory
+ * @size:	[out] Size of the restricted memory
+ */
+struct tee_ioctl_rstmem_fd_info {
+	__s32 fd;
+	__u32 flags;
+	__u32 use_case;
+	__s32 id;
+	__u64 size;
+};
+
+/**
+ * TEE_IOC_RSTMEM_FD_INFO - get restricted memory information from an fd
+ *
+ * Returns information about a previously allocated restricted memory
+ * dma-buf file descriptor.
+ *
+ * Returns 0 on success or < 0 on failure
+ */
+#define TEE_IOC_RSTMEM_FD_INFO	_IOWR(TEE_IOC_MAGIC, TEE_IOC_BASE + 11, \
+				      struct tee_ioctl_rstmem_fd_info)
+
 /*
  * Five syscalls are used when communicating with the TEE driver.
  * open(): opens the device associated with the driver
-- 
2.43.0

