Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8IDuJ7EsoWk/qwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF6D1B2E4B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 06:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172F10E61B;
	Fri, 27 Feb 2026 05:33:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RVBZZtd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74B0A10E61C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 05:33:30 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-824c9da9928so956034b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 21:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772170410; x=1772775210; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
 b=RVBZZtd6V49T9RJqteIxHp+Q5wIWHXnR8gj9MTLQ6Xbo01uyTMkCV9SVcfubylm2OJ
 tncJMUQv71i7dCjztOjhChfLaF9uR7wrrkyqqVr+Rht2Lr9Nsxx9wq4hkJecNqbAu3qo
 HtYZ3UZgrM3vGqNQnthGK2wCtTTE94uznUMNRK2yYp29mNJqM+BU/VN/N3Iszw57lFmi
 //VV2+oWWV8w+aeVqoWkDKmNtMgx6s045MmxvJeT/us34epjPrDzsrnvPjWMScAP9cdO
 a+LsPVRXwOo8PuPetjNEDQp90XUzMiroa5CC7vPa8JpYtY9m9nMmLp7wyh9kLpU/P8Hy
 v0Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772170410; x=1772775210;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=feZZgyhgnxd2MB3vtB7LaA+CWft2WYSV7ZFSVYTIeiU=;
 b=hnxX8lOFxVgXUPf4jBX65fOOeVe3fTqPrKtub7CZJJVkSJfSbp8s0HDlI4LqzZn80R
 K/X1A+FdYQVQJT+bOKV1EtWMaJTn5mKAw9ujK6JDAMo4sqKw+x/VR804NHkGEXdUziQM
 8Doa1r0KzxgDQaYsmI7iFx725lNOfmBqGfze8UHFkSIt2YaYa3ZPdP7yoofKmoaPhNpp
 oMqNSNn6CIPFV3bHy3dYiE6mzP+giViUB5Od2xwR+y9Qjpw/zF/PFSlqLB/p6RNNswCM
 nIMsMHpCKP/Nyt+DfhilDeMwPX8uS+8OVUU4GWpUOtX5b7k+giMYLgoJKOVSTIrwiQ4t
 tbTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKTBWkSe9JF+k3QQWd9fT351SPcpM5kk3W9qQpMy1ZcLthwCPDDnbvGhDfSGv6g94jFKMFKt95TY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOQ5uLHIF6yS8GvWQpgWkIcmleZ2qdr3SRp1Ti2gt5mSmcSHrm
 PQqfWEbBh42qiocd6JzEplRIImf09yIRrOyLh5ms+UkBwUf1SL/Qok8D
X-Gm-Gg: ATEYQzxZWImhos7r2CDMTBYDkxs/FalK2Gh43H89lYA8rIMLGrQ2HqMWVIgRl7d7Da6
 BIzY3M3IL+NqO4Wo6J8ZbwE5iZ1y4HMy10oy7T7Qy3i3PpjKIMej7E5qVcrGdmk8v6BwpVI33rw
 fODaGxi5bhoFfkVsH0aaTibm2hEaqgaUji1maJf6V+2jJqBl5C75m2TRvum5fVtf3ZKYaDVJRSB
 GZhKSPJh1BHbjsixpUp/wIQUJ0oljuO4NV/OAEAPiB/xqKbCxKUEEkGh0HDmmQHEqJb6kcjvCSh
 sBKdTMDzHA2Fjyq++am4iR33V82zDOvOLHr83GFLog+5pxLxsuYVEDZave8q+Ew52i1IXcQ+bSt
 FXRC4BL6Dn+ZsJ6u4i0ZH8U5OIGS8SIZqAgdJ4iNzFkjKWSYYniFEV4peC8uOiEdm6+a0qN0Aky
 3HreBF1ypV+x7SDDy7rFiMUqqk2rdmMUTAo89kHZ2NkdyykD8s/w==
X-Received: by 2002:a05:6a00:4c84:b0:824:9451:c1e2 with SMTP id
 d2e1a72fcca58-8274da275b4mr1328637b3a.59.1772170409864; 
 Thu, 26 Feb 2026 21:33:29 -0800 (PST)
Received: from name2965-Precision-7820-Tower.. ([175.201.112.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8273a048615sm3815828b3a.52.2026.02.26.21.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 21:33:29 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH 6.1.y 5.15.y 5.10.y 3/3] drm/exynos: vidi: use ctx->lock to
 protect struct vidi_context member variables related to memory alloc/free
Date: Fri, 27 Feb 2026 14:33:17 +0900
Message-Id: <20260227053317.426000-4-aha310510@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260227053317.426000-1-aha310510@gmail.com>
References: <20260227053317.426000-1-aha310510@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,samsung.com,gmail.com,ffwll.ch,kernel.org,lists.freedesktop.org,lists.infradead.org,vger.kernel.org];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:stable@vger.kernel.org,m:gregkh@linuxfoundation.org,m:inki.dae@samsung.com,m:sw0312.kim@samsung.com,m:kyungmin.park@samsung.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:krzk@kernel.org,m:alim.akhtar@samsung.com,m:linux-arm-kernel@lists.infradead.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:aha310510@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aha310510@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2DF6D1B2E4B
X-Rspamd-Action: no action

[ Upstream commit 52b330799e2d6f825ae2bb74662ec1b10eb954bb ]

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 43 +++++++++++++++++++-----
 1 file changed, 35 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 576d79ebe9a8..b7eae2469b31 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,15 +186,17 @@ static ssize_t vidi_store_connection(struct device *dev,
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
 
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/* use fake edid data for test. */
 	if (!ctx->raw_edid)
 		ctx->raw_edid = (struct edid *)fake_edid_info;
@@ -202,14 +204,21 @@ static ssize_t vidi_store_connection(struct device *dev,
 	/* if raw_edid isn't same as fake data then it can't be tested. */
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -244,11 +253,14 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
@@ -271,20 +283,27 @@ int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = raw_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
 		 * only if raw edid data isn't same as fake data.
 		 */
+		mutex_lock(&ctx->lock);
 		if (ctx->raw_edid && ctx->raw_edid !=
 				(struct edid *)fake_edid_info) {
 			kfree(ctx->raw_edid);
 			ctx->raw_edid = NULL;
 		}
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -299,7 +318,7 @@ static enum drm_connector_status vidi_detect(struct drm_connector *connector,
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -321,22 +340,24 @@ static int vidi_get_modes(struct drm_connector *connector)
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
 	int edid_len;
-	int count;
+	int count = 0;
 
 	/*
 	 * the edid data comes from user side and it would be set
 	 * to ctx->raw_edid through specific ioctl.
 	 */
+
+	mutex_lock(&ctx->lock);
 	if (!ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
+		goto fail;
 	}
 
 	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
 	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
 	if (!edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
-		return 0;
+		goto fail;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
@@ -345,6 +366,8 @@ static int vidi_get_modes(struct drm_connector *connector)
 
 	kfree(edid);
 
+fail:
+	mutex_unlock(&ctx->lock);
 	return count;
 }
 
@@ -490,11 +513,15 @@ static int vidi_remove(struct platform_device *pdev)
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
 	}
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 
 	return 0;
--
