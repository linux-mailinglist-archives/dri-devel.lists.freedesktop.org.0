Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 374F7A7BF58
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 16:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FAFD10EBDA;
	Fri,  4 Apr 2025 14:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cotJRqUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B0710EBDA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Apr 2025 14:32:37 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-5efe8d9eb12so3151324a12.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Apr 2025 07:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1743777156; x=1744381956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
 b=cotJRqUnoIF++Ct1z9maUWxo64NI1355lM7p0ThXen7WnGatqKOphyCRC6lIn5TnY+
 i6RVKbm1HvEqCXRY87wqQrGEravBnNKAFNWjDDe7626jpgAnILlQRWMOkTDvtbTVIwRT
 ns8pA9/8I/F/pwfkHjOT/3kmb/6PRvMzRQwy7spr//lczZGsGSh6QdwD5NQcKq+qZCG6
 x9k0SYLVbhkUPnwmWZeMSReFRSR5wCjU8ffBebOwTdizFallywMG3mp6q3cJxmrX23e3
 dBfTaciwCRMgH4O2OwZOoiag5keYOf09GvmcHH8dmC2S1nSOi/eS8bpKrQwrd51tBZVW
 btJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743777156; x=1744381956;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fs7nqD12lkBPC3o5IKJmDFRrEPWNWVuJ0deEV/XnG9g=;
 b=Z2iwPaP4EoDTcDcQ6oAmnlfoIO9GU6KZoF0i4NFMKTofE+lTpXBnKs9nml9uvwzivI
 sJQ9r1gbOA+hl9l52dFegPzK6dR+6Saq0f0BBXUnqSlh8yErElG6Du8pkGGFy/p2HK2/
 o9hYZ1p+3VylqRf3DfAiJG0kLEVvyolSxoV6YN/8AY8NmqeN9PpYFlcJ3pfOTr9jZ2bj
 b+Nvg+MG4k2otL23tMjA4iTpQZEzxxmOqf2UubgpROhJXDTkBKV77NM3ZHe2L3GffEiP
 qIoZrb/Mu3pFejV2mcFEwOp//hdbNtmNWtE+pR4umjT55GoAQ2HaLIfNZH0n9YOpjVF5
 ATOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTRa8rxE8Xr+okmHxZeRVjxXYuDsLT7IL9pVBM+atywGx2hfZcSzNgSpgT/5SScVo/XVSUh5+GL5k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzLzjcR+APChuS86KmIVr+jehKoXy2ZOAunghoo10n26420k32l
 RE1hXAjVn2D/L9Kgf6p1tNDH9Uv/dOxCqjlWaFa9CxDmxKwhs8IehUBYc4rxQck=
X-Gm-Gg: ASbGncsRCE2Pl7vvkRNMW5ZlK/f9RzyjvK2qPbKuJoiLzQwheM9oO8DvXWrb3lIvbVQ
 WuyHPLfIw53WeQx3wUYuDNO6cwpN9Po+b8oZQgcejpGx3/q/SXep9uMwxBcd/8r5F5Etpy0dux4
 rBDl4hY/csE4vInKo5R2f7TiTSn/o17mQzjAdIE5jGNMKJXsfsrw9WVMqlpBBYh56OVijgYFLJw
 HlJIN2qQdrvNuXY3DhMw3YVOgubTe9m6jfZLus8HID/iumf7gJNEFuqQBMbQRiYBMEMygfpnpQU
 qjsHeicyCRL45twC+rDdT30NeSPMIhTElS62RIJnEnrhSI/hrLynQnYzNrt6+35FSvIUrG+j/I8
 r2s/0fcKwOpNILyKeJs2mcA==
X-Google-Smtp-Source: AGHT+IFs+Hyg3/qgGfM04VQJy6hexkwcypVkkd955EopjzAxNOwVqKRSb29t6l7fEI6wJVCNyo9dwQ==
X-Received: by 2002:a05:6402:42c7:b0:5ec:958b:6f5a with SMTP id
 4fb4d7f45d1cf-5f0b4711e42mr2859878a12.28.1743777156026; 
 Fri, 04 Apr 2025 07:32:36 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se.
 [98.128.140.123]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Apr 2025 07:32:35 -0700 (PDT)
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
Subject: [PATCH v7 06/11] tee: refactor params_from_user()
Date: Fri,  4 Apr 2025 16:31:29 +0200
Message-ID: <20250404143215.2281034-7-jens.wiklander@linaro.org>
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

Break out the memref handling into a separate helper function.
No change in behavior.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 685afcaa3ea1..820e394b9054 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -353,6 +353,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
 	return ret;
 }
 
+static int param_from_user_memref(struct tee_context *ctx,
+				  struct tee_param_memref *memref,
+				  struct tee_ioctl_param *ip)
+{
+	struct tee_shm *shm;
+
+	/*
+	 * If a NULL pointer is passed to a TA in the TEE,
+	 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
+	 * indicating a NULL memory reference.
+	 */
+	if (ip->c != TEE_MEMREF_NULL) {
+		/*
+		 * If we fail to get a pointer to a shared
+		 * memory object (and increase the ref count)
+		 * from an identifier we return an error. All
+		 * pointers that has been added in params have
+		 * an increased ref count. It's the callers
+		 * responibility to do tee_shm_put() on all
+		 * resolved pointers.
+		 */
+		shm = tee_shm_get_from_id(ctx, ip->c);
+		if (IS_ERR(shm))
+			return PTR_ERR(shm);
+
+		/*
+		 * Ensure offset + size does not overflow
+		 * offset and does not overflow the size of
+		 * the referred shared memory object.
+		 */
+		if ((ip->a + ip->b) < ip->a ||
+		    (ip->a + ip->b) > shm->size) {
+			tee_shm_put(shm);
+			return -EINVAL;
+		}
+	} else if (ctx->cap_memref_null) {
+		/* Pass NULL pointer to OP-TEE */
+		shm = NULL;
+	} else {
+		return -EINVAL;
+	}
+
+	memref->shm_offs = ip->a;
+	memref->size = ip->b;
+	memref->shm = shm;
+
+	return 0;
+}
+
 static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 			    size_t num_params,
 			    struct tee_ioctl_param __user *uparams)
@@ -360,8 +409,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -384,45 +433,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_OUTPUT:
 		case TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT:
-			/*
-			 * If a NULL pointer is passed to a TA in the TEE,
-			 * the ip.c IOCTL parameters is set to TEE_MEMREF_NULL
-			 * indicating a NULL memory reference.
-			 */
-			if (ip.c != TEE_MEMREF_NULL) {
-				/*
-				 * If we fail to get a pointer to a shared
-				 * memory object (and increase the ref count)
-				 * from an identifier we return an error. All
-				 * pointers that has been added in params have
-				 * an increased ref count. It's the callers
-				 * responibility to do tee_shm_put() on all
-				 * resolved pointers.
-				 */
-				shm = tee_shm_get_from_id(ctx, ip.c);
-				if (IS_ERR(shm))
-					return PTR_ERR(shm);
-
-				/*
-				 * Ensure offset + size does not overflow
-				 * offset and does not overflow the size of
-				 * the referred shared memory object.
-				 */
-				if ((ip.a + ip.b) < ip.a ||
-				    (ip.a + ip.b) > shm->size) {
-					tee_shm_put(shm);
-					return -EINVAL;
-				}
-			} else if (ctx->cap_memref_null) {
-				/* Pass NULL pointer to OP-TEE */
-				shm = NULL;
-			} else {
-				return -EINVAL;
-			}
-
-			params[n].u.memref.shm_offs = ip.a;
-			params[n].u.memref.size = ip.b;
-			params[n].u.memref.shm = shm;
+			rc = param_from_user_memref(ctx, &params[n].u.memref,
+						    &ip);
+			if (rc)
+				return rc;
 			break;
 		default:
 			/* Unknown attribute */
-- 
2.43.0

