Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501B0B53457
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 15:50:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7DB410EB32;
	Thu, 11 Sep 2025 13:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HF1aSsI/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5FA610EB32
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 13:50:37 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-72ce9790aceso5397017b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 06:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757598637; x=1758203437; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
 b=HF1aSsI/Zsx5Ra+G/FSAQYomqGsJVj0GoJNbOomd7D0e9PFcmqgL2b5gSd1J4bB/pM
 jgGnp7ZxY+TtyL5Nm+IezONypH7iNcgWNazMJdtp2m5H8m3hNpiFX8RVMCd/jQcTQXkE
 9Lz6Mc/woMOy762TXMwFOj4SUDAg1UpxR/rT8BtODqkb5IIC+HADVhZoiQjWRaDwicQW
 TvzGahE/HVarR8DfycCoSfL03PVjDHmDayojtys0Oc1Ir391/CJ3BfLRaqeKV1SE5vq5
 98I8D6uDmvgHM9zH+zBB22YU7tz3j+mtZBJI0hjFKxU0g4CpMpQ7lV4Rp/UHrxjmqh4z
 mB/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757598637; x=1758203437;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yi0r5nq64oj31QVOjln422OWaHa6DWnYy7B2T1z3rUg=;
 b=Pd5j648clxQTfQxdDfs6HWoQDv1LbFxP76zvvTyWyVveCWquNrEWLA8edobl20gOaZ
 isIEi8aG07aJeYn+fmlVKGt4zwXPbwVDnVz4iJDERBr9436G5FsIe28witpxi+05QnLb
 eMo7hz5aqS1DQJqBtUeFzpBzOrll94t+fZvDkLSxVyXCIhBmhqlVaAcFBpL+m9iqs/G/
 7IA90TyBGJG2MNAD96qHdf6B5jkbp+IiA1iE7ddvplo9PXOJ+5i9zsxDk6kFmTdyC++L
 LLsBHn1OxLxJprbcQ1OFbymPMAHvqOmAQsfOHJZCW5olmzFuPbanEs3NUTJoOMh7RqmH
 JRyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDEmLFbHZ9+ydDD+UwfK/xZPsfnQhJMGHKSJZPtWw329Jr0Ertoj4LYs1+g1batpvFe/HeVogUM0I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrMUc4RFaG63pth3h6SazY9LOOj25lfGCxjBTjkzvq4fhLVU3g
 uftoJcGJhITUH1s2OxkeXOXkwwr5IUjMwEbzTo7fJPB2gsUc+b2e74faljEmEDvbwf4=
X-Gm-Gg: ASbGnctYM4j+xna2Vk1f74CZvhHtLYt/SW8f05fxCUmSiyO/bomk69ng5wq53/eT1sS
 VuLE91LmFi7eteQ9oP4TfZyGA3+si/vUvIjaCelk1zeUSUlhgHr+tM5eRcLugjJJXID0qYeQtCF
 3i7GWG9lBUZ47X9zjm8Xun78GQq4K6DEvI9EjKbBsajuFV66zwgeCfZ/jJLa49KzL0oQY9Me6EU
 yzId9KUQEgHifJ4CSZZz1QJKO6vmHM2yZBdcxYeYK9jYLw9wVUxt/TphVrKZ6IVtFbqTMmmv9/M
 WtYVrmV2HcSw54cbPvuPEiLh1G2NHRh7bYQEwno7xCEldU0pHyTWvhoCCgtQYMrydasvR3qFKHJ
 SJgZbQwqhPQX9+AhZRTru8TqgBDYnNZV9724SKwc0cmTb4s2S/Hj/TQyvfwFDNmgw0eBkgSezV5
 TgSpkKIYvM1w==
X-Google-Smtp-Source: AGHT+IFhFq5K/L+li5E/fnG6u0IEPzqvQNG67ywCbR49sqE1DlYxZ0kS6UjsMtnPo2ezjd7bDqomGA==
X-Received: by 2002:a05:690c:62c1:b0:726:76f0:4b89 with SMTP id
 00721157ae682-727f505434fmr181457897b3.22.1757598636586; 
 Thu, 11 Sep 2025 06:50:36 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se.
 [37.123.177.177]) by smtp.gmail.com with ESMTPSA id
 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 06:50:35 -0700 (PDT)
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
Subject: [PATCH v12 4/9] tee: refactor params_from_user()
Date: Thu, 11 Sep 2025 15:49:45 +0200
Message-ID: <20250911135007.1275833-5-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
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

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_core.c | 94 ++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 40 deletions(-)

diff --git a/drivers/tee/tee_core.c b/drivers/tee/tee_core.c
index 2411d1e2aa7a..4996f194cd9e 100644
--- a/drivers/tee/tee_core.c
+++ b/drivers/tee/tee_core.c
@@ -354,6 +354,55 @@ tee_ioctl_shm_register(struct tee_context *ctx,
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
@@ -361,8 +410,8 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
 	size_t n;
 
 	for (n = 0; n < num_params; n++) {
-		struct tee_shm *shm;
 		struct tee_ioctl_param ip;
+		int rc;
 
 		if (copy_from_user(&ip, uparams + n, sizeof(ip)))
 			return -EFAULT;
@@ -385,45 +434,10 @@ static int params_from_user(struct tee_context *ctx, struct tee_param *params,
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

