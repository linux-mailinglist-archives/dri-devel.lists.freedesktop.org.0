Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374D2AD389D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 15:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7810E551;
	Tue, 10 Jun 2025 13:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="s9c9j/v4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07D610E54C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 13:16:12 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-60727e46168so9376167a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 06:16:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749561371; x=1750166171; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TwRNOajLkzXuoIoSvOb0sMcJ5JYpDgqSwK+meAAojhU=;
 b=s9c9j/v4WWqCK+vR1hRzGCYhvX5ltRmyiAh9c7uvA8u2i6R+/UQTnaD9e6l2vIxU1Q
 0nccWAeuQFJ9ZS0H76h7uX/XZqfd8tHp+PVGz+UkurvW9m0erCw9ADkYy8dVsycwyIHd
 TjH/0R/El8rBnuel85BoAc0G9xX9zFz0/ZxrSnBPV+YDCXU4DI/AjIk/tX9K3OSVXaqX
 AO4w4MuvswCTGgH3JuuHol1Ca7yYD9BMX+9hQZuYIruPa7B3d0E2nU8lKBfNgmCNMULS
 ZqV74XlXYGN0ALzxLhD9SLbgwrXUph6eCfPCMOmc0tzv9y4y9athFkHf5m709gPEDrdj
 lLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749561371; x=1750166171;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TwRNOajLkzXuoIoSvOb0sMcJ5JYpDgqSwK+meAAojhU=;
 b=gQLqXxi58r0CKYPT+pHiR3FtPyzzSqCpa/P8pjpqJV6zEJwbUUrQUzIpbXiUe/6SQc
 0iiDKQfa6in1kmjqpMn75ADxWRg55W3Jlk4p1C39ZRrcWOm5+2mGO/IusQ+poEUAIBlH
 6rQePlMlNlenSK4ymSLE3zxhi+BYPa0NRd2TK0Dm64PHAjersfOsdjcxjdvh8rVToiJi
 ZyPo1iWp76LO+bXPfGqckuimKYZuSCKq9zm6EZHsdl8J/ofKPmjmocvGR4InZLdtKt64
 W7VhDngrELNt1O0swAMYJoB9q64xYQyI16YbU1+oYNzUL+Q/8SwKPgBcY5lKxt6dPQhq
 R0DQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq/84pXdYa095UapyaJjNzIorw/kDDd/q39+WLvfx1UOBmkW7DgrtGAsI+YiaYuOvWfVvkK/VGCeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1dykvCiDsbJeesstEiTsD8IkV+Lyh8leiC7Y+n2Vz5GV1RaeA
 JUTktg+pn2aQ2M4bbPq8skEsdNMf8llCNAe3zSsDjvNGSrXc1IdUYkxfJAwD0FF3SUA=
X-Gm-Gg: ASbGncuh5KaDfTZHDkk/pVw5bQ8sL7ZQH0fBkkJTajTEXq8SoCxNviJHzuYIrtcuxNY
 HEuEwH5a2IwX3BW10bavgvAojYQ13zjyQaONZkFX87LqScEEKqUaZGglQ7oGdJHMi6QeKVHIIqm
 UEK/qOMD8IuXfa41cVto38z58Eg1KeJOo7JNRIyhCFfK210TgNgghl6B487kJL5sv8ZzD0YSxhj
 ym6ftBXvCgGyBdrOysgEW4Adhb09ouXCfsolyAjRKEJMRPXi0BmKWsnvwLuNmhm+5wAWnxRGsik
 Pqkz2hmcrwiAzZYMNifgNgN08Toy62rAtiskz1FrLyxo34BBP1M+tQ3UMWGvRuVgCI/JQ7BElBS
 yOY1B4IUIw2DEagW0wTNMW0svfTbhzt5Ko0vOLrI=
X-Google-Smtp-Source: AGHT+IE4tGpdwpiGwe2u99gj0fkoT3yu8C53t7q6L6t4zUj8d2zFc8aAdOmqs6iHIakYPQ4UE4uvUg==
X-Received: by 2002:a17:907:3c8c:b0:ad5:1bfd:30d2 with SMTP id
 a640c23a62f3a-ade1ab326e2mr1577814266b.55.1749561370961; 
 Tue, 10 Jun 2025 06:16:10 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jun 2025 06:16:10 -0700 (PDT)
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
 Rouven Czerwinski <rouven.czerwinski@linaro.org>, robin.murphy@arm.com,
 Jens Wiklander <jens.wiklander@linaro.org>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v10 1/9] optee: sync secure world ABI headers
Date: Tue, 10 Jun 2025 15:13:45 +0200
Message-ID: <20250610131600.2972232-2-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
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

Update the header files describing the secure world ABI, both with and
without FF-A. The ABI is extended to deal with protected memory, but as
usual backward compatible.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/optee_ffa.h | 27 ++++++++---
 drivers/tee/optee/optee_msg.h | 84 ++++++++++++++++++++++++++++++-----
 drivers/tee/optee/optee_smc.h | 37 ++++++++++++++-
 3 files changed, 130 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/optee_ffa.h b/drivers/tee/optee/optee_ffa.h
index 257735ae5b56..cc257e7956a3 100644
--- a/drivers/tee/optee/optee_ffa.h
+++ b/drivers/tee/optee/optee_ffa.h
@@ -81,7 +81,7 @@
  *                   as the second MSG arg struct for
  *                   OPTEE_FFA_YIELDING_CALL_WITH_ARG.
  *        Bit[31:8]: Reserved (MBZ)
- * w5:	  Bitfield of secure world capabilities OPTEE_FFA_SEC_CAP_* below,
+ * w5:	  Bitfield of OP-TEE capabilities OPTEE_FFA_SEC_CAP_*
  * w6:	  The maximum secure world notification number
  * w7:	  Not used (MBZ)
  */
@@ -94,6 +94,8 @@
 #define OPTEE_FFA_SEC_CAP_ASYNC_NOTIF	BIT(1)
 /* OP-TEE supports probing for RPMB device if needed */
 #define OPTEE_FFA_SEC_CAP_RPMB_PROBE	BIT(2)
+/* OP-TEE supports Protected Memory for secure data path */
+#define OPTEE_FFA_SEC_CAP_PROTMEM	BIT(3)
 
 #define OPTEE_FFA_EXCHANGE_CAPABILITIES OPTEE_FFA_BLOCKING_CALL(2)
 
@@ -108,7 +110,7 @@
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_UNREGISTER_SHM	OPTEE_FFA_BLOCKING_CALL(3)
 
@@ -119,16 +121,31 @@
  * Call register usage:
  * w3:    Service ID, OPTEE_FFA_ENABLE_ASYNC_NOTIF
  * w4:	  Notification value to request bottom half processing, should be
- *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE.
+ *	  less than OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE
  * w5-w7: Not used (MBZ)
  *
  * Return register usage:
  * w3:    Error code, 0 on success
- * w4-w7: Note used (MBZ)
+ * w4-w7: Not used (MBZ)
  */
 #define OPTEE_FFA_ENABLE_ASYNC_NOTIF	OPTEE_FFA_BLOCKING_CALL(5)
 
-#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE 64
+#define OPTEE_FFA_MAX_ASYNC_NOTIF_VALUE	64
+
+/*
+ * Release Protected memory
+ *
+ * Call register usage:
+ * w3:    Service ID, OPTEE_FFA_RECLAIM_PROTMEM
+ * w4:    Shared memory handle, lower bits
+ * w5:    Shared memory handle, higher bits
+ * w6-w7: Not used (MBZ)
+ *
+ * Return register usage:
+ * w3:    Error code, 0 on success
+ * w4-w7: Note used (MBZ)
+ */
+#define OPTEE_FFA_RELEASE_PROTMEM	OPTEE_FFA_BLOCKING_CALL(8)
 
 /*
  * Call with struct optee_msg_arg as argument in the supplied shared memory
diff --git a/drivers/tee/optee/optee_msg.h b/drivers/tee/optee/optee_msg.h
index e8840a82b983..22130e967dc5 100644
--- a/drivers/tee/optee/optee_msg.h
+++ b/drivers/tee/optee/optee_msg.h
@@ -133,13 +133,13 @@ struct optee_msg_param_rmem {
 };
 
 /**
- * struct optee_msg_param_fmem - ffa memory reference parameter
+ * struct optee_msg_param_fmem - FF-A memory reference parameter
  * @offs_lower:	   Lower bits of offset into shared memory reference
  * @offs_upper:	   Upper bits of offset into shared memory reference
  * @internal_offs: Internal offset into the first page of shared memory
  *		   reference
  * @size:	   Size of the buffer
- * @global_id:	   Global identifier of Shared memory
+ * @global_id:	   Global identifier of the shared memory
  */
 struct optee_msg_param_fmem {
 	u32 offs_low;
@@ -165,7 +165,7 @@ struct optee_msg_param_value {
  * @attr:	attributes
  * @tmem:	parameter by temporary memory reference
  * @rmem:	parameter by registered memory reference
- * @fmem:	parameter by ffa registered memory reference
+ * @fmem:	parameter by FF-A registered memory reference
  * @value:	parameter by opaque value
  * @octets:	parameter by octet string
  *
@@ -296,6 +296,18 @@ struct optee_msg_arg {
  */
 #define OPTEE_MSG_FUNCID_GET_OS_REVISION	0x0001
 
+/*
+ * Values used in OPTEE_MSG_CMD_LEND_PROTMEM below
+ * OPTEE_MSG_PROTMEM_RESERVED		Reserved
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	Secure Video Playback
+ * OPTEE_MSG_PROTMEM_TRUSTED_UI		Trused UI
+ * OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	Secure Video Recording
+ */
+#define OPTEE_MSG_PROTMEM_RESERVED		0
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_PLAY	1
+#define OPTEE_MSG_PROTMEM_TRUSTED_UI		2
+#define OPTEE_MSG_PROTMEM_SECURE_VIDEO_RECORD	3
+
 /*
  * Do a secure call with struct optee_msg_arg as argument
  * The OPTEE_MSG_CMD_* below defines what goes in struct optee_msg_arg::cmd
@@ -337,15 +349,63 @@ struct optee_msg_arg {
  * OPTEE_MSG_CMD_STOP_ASYNC_NOTIF informs secure world that from now is
  * normal world unable to process asynchronous notifications. Typically
  * used when the driver is shut down.
+ *
+ * OPTEE_MSG_CMD_LEND_PROTMEM lends protected memory. The passed normal
+ * physical memory is protected from normal world access. The memory
+ * should be unmapped prior to this call since it becomes inaccessible
+ * during the request.
+ * Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		OPTEE_MSG_PROTMEM_* defined above
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_TMEM_INPUT
+ * [in] param[1].u.tmem.buf_ptr		physical address
+ * [in] param[1].u.tmem.size		size
+ * [in] param[1].u.tmem.shm_ref		holds protected memory reference
+ *
+ * OPTEE_MSG_CMD_RECLAIM_PROTMEM reclaims a previously lent protected
+ * memory reference. The physical memory is accessible by the normal world
+ * after this function has return and can be mapped again. The information
+ * is passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ *
+ * OPTEE_MSG_CMD_GET_PROTMEM_CONFIG get configuration for a specific
+ * protected memory use case. Parameters are passed as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INOUT
+ * [in] param[0].value.a		OPTEE_MSG_PROTMEM_*
+ * [in] param[1].attr			OPTEE_MSG_ATTR_TYPE_{R,F}MEM_OUTPUT
+ * [in] param[1].u.{r,f}mem		Buffer or NULL
+ * [in] param[1].u.{r,f}mem.size	Provided size of buffer or 0 for query
+ * output for the protected use case:
+ * [out] param[0].value.a		Minimal size of protected memory
+ * [out] param[0].value.b		Required alignment of size and start of
+ *					protected memory
+ * [out] param[0].value.c               PA width, max 64
+ * [out] param[1].{r,f}mem.size		Size of output data
+ * [out] param[1].{r,f}mem		If non-NULL, contains an array of
+ *					uint16_t holding endpoints that
+ *					must be included when lending
+ *					memory for this use case
+ *
+ * OPTEE_MSG_CMD_ASSIGN_PROTMEM assigns use-case to protected memory
+ * previously lent using the FFA_LEND framework ABI. Parameters are passed
+ * as:
+ * [in] param[0].attr			OPTEE_MSG_ATTR_TYPE_VALUE_INPUT
+ * [in] param[0].u.value.a		holds protected memory cookie
+ * [in] param[0].u.value.b		OPTEE_MSG_PROTMEM_* defined above
  */
-#define OPTEE_MSG_CMD_OPEN_SESSION	0
-#define OPTEE_MSG_CMD_INVOKE_COMMAND	1
-#define OPTEE_MSG_CMD_CLOSE_SESSION	2
-#define OPTEE_MSG_CMD_CANCEL		3
-#define OPTEE_MSG_CMD_REGISTER_SHM	4
-#define OPTEE_MSG_CMD_UNREGISTER_SHM	5
-#define OPTEE_MSG_CMD_DO_BOTTOM_HALF	6
-#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF	7
-#define OPTEE_MSG_FUNCID_CALL_WITH_ARG	0x0004
+#define OPTEE_MSG_CMD_OPEN_SESSION		0
+#define OPTEE_MSG_CMD_INVOKE_COMMAND		1
+#define OPTEE_MSG_CMD_CLOSE_SESSION		2
+#define OPTEE_MSG_CMD_CANCEL			3
+#define OPTEE_MSG_CMD_REGISTER_SHM		4
+#define OPTEE_MSG_CMD_UNREGISTER_SHM		5
+#define OPTEE_MSG_CMD_DO_BOTTOM_HALF		6
+#define OPTEE_MSG_CMD_STOP_ASYNC_NOTIF		7
+#define OPTEE_MSG_CMD_LEND_PROTMEM		8
+#define OPTEE_MSG_CMD_RECLAIM_PROTMEM		9
+#define OPTEE_MSG_CMD_GET_PROTMEM_CONFIG	10
+#define OPTEE_MSG_CMD_ASSIGN_PROTMEM		11
+#define OPTEE_MSG_FUNCID_CALL_WITH_ARG		0x0004
 
 #endif /* _OPTEE_MSG_H */
diff --git a/drivers/tee/optee/optee_smc.h b/drivers/tee/optee/optee_smc.h
index 879426300821..accf76a99288 100644
--- a/drivers/tee/optee/optee_smc.h
+++ b/drivers/tee/optee/optee_smc.h
@@ -264,7 +264,6 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_HAVE_RESERVED_SHM	BIT(0)
 /* Secure world can communicate via previously unregistered shared memory */
 #define OPTEE_SMC_SEC_CAP_UNREGISTERED_SHM	BIT(1)
-
 /*
  * Secure world supports commands "register/unregister shared memory",
  * secure world accepts command buffers located in any parts of non-secure RAM
@@ -280,6 +279,10 @@ struct optee_smc_get_shm_config_result {
 #define OPTEE_SMC_SEC_CAP_RPC_ARG		BIT(6)
 /* Secure world supports probing for RPMB device if needed */
 #define OPTEE_SMC_SEC_CAP_RPMB_PROBE		BIT(7)
+/* Secure world supports protected memory */
+#define OPTEE_SMC_SEC_CAP_PROTMEM		BIT(8)
+/* Secure world supports dynamic protected memory */
+#define OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM	BIT(9)
 
 #define OPTEE_SMC_FUNCID_EXCHANGE_CAPABILITIES	9
 #define OPTEE_SMC_EXCHANGE_CAPABILITIES \
@@ -451,6 +454,38 @@ struct optee_smc_disable_shm_cache_result {
 
 /* See OPTEE_SMC_CALL_WITH_REGD_ARG above */
 #define OPTEE_SMC_FUNCID_CALL_WITH_REGD_ARG	19
+/*
+ * Get protected memory config
+ *
+ * Returns the protected memory config.
+ *
+ * Call register usage:
+ * a0   SMC Function ID, OPTEE_SMC_GET_PROTMEM_CONFIG
+ * a2-6	Not used, must be zero
+ * a7	Hypervisor Client ID register
+ *
+ * Have config return register usage:
+ * a0	OPTEE_SMC_RETURN_OK
+ * a1	Physical address of start of protected memory
+ * a2	Size of protected memory
+ * a3	PA width, max 64
+ * a4-7	Preserved
+ *
+ * Not available register usage:
+ * a0	OPTEE_SMC_RETURN_ENOTAVAIL
+ * a1-3 Not used
+ * a4-7	Preserved
+ */
+#define OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG		20
+#define OPTEE_SMC_GET_PROTMEM_CONFIG \
+	OPTEE_SMC_FAST_CALL_VAL(OPTEE_SMC_FUNCID_GET_PROTMEM_CONFIG)
+
+struct optee_smc_get_protmem_config_result {
+	unsigned long status;
+	unsigned long start;
+	unsigned long size;
+	unsigned long pa_width;
+};
 
 /*
  * Resume from RPC (for example after processing a foreign interrupt)
-- 
2.43.0

