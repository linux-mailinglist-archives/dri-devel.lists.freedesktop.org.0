Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10990494EE8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 14:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A14FF10E7FC;
	Thu, 20 Jan 2022 13:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8888110E7FC
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 13:27:52 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 q9-20020a7bce89000000b00349e697f2fbso21977764wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=h31cjV/G3NiOKdHvCZshrAV0bv4jMAoTVAYHVRjcuKk=;
 b=WnbqVfwzb4DPoRFDhQ9/ICG9WTPbw7OBhn0HLKpmPR/WnX6hjSExc4wBC5WXWZZEQG
 eP22+9nEUkH63Iyqek68ocIhQ6pCcP0cZZJbPFhXmdWCx4Vc0XCDRBY2k0/5NAyMIzKf
 4QXgu+BPUO2UC6rDU6cXiibusrHEXg7zaYc1VpX0RJs0IdUYyTrsrFc5WZMPh/jzh3/n
 05IFWTH4hffpALS/ZvFxVF+OCJyTev8sjceYDW6eAA2wYtVd5AksMlL+LVTzJiMuNsZt
 vEFpGgkpokQBL4JxQNOvky0c+m+QZgFy6bwB8e7RUDeUfH4YlE1Td7PcSf3FD29Bs2kr
 WEIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h31cjV/G3NiOKdHvCZshrAV0bv4jMAoTVAYHVRjcuKk=;
 b=SUvhDVPEgOdO1dNhDobEG+F7aVublyCFLx28dXkZCiirT0fm74rcSdBK375Qcm3rDs
 7Y2noBo1fwlZXnsX+nET/T4nT1uelEiSqf/jWWnN9Y9F/Ptquf5lxt/XA4qdtxJLaEMJ
 THm3IYMjEEEsq7gOdZy0nPPie2gBwcIP28cMXWdWjDIv/SU5ALpglsj7Op2DvOGH2Z3Z
 HHZvxaJHO1+I21zp1wEJI3z9CrIcE7m8HgrCUkOAF4i5z3c/bvO9g7mxMSYlKu0dFuHp
 zmDIeSBmDnkAyBxcdbA7zI1IEIVu3UC9tccHzRJuK2mvvduC6mBr45n06SaNUZyAHIGD
 txQQ==
X-Gm-Message-State: AOAM530c/vlF0ivbwWI3BYahztbe++rbhI6s98yKXOdKAItVp5v8moDE
 67WazOR/Cr9Tzvw3zhFJb2M=
X-Google-Smtp-Source: ABdhPJy5EXLfElgIsYt5n+gjzWUyHJ0xgsDXAnXo7PfLLlJTqgMkEsQTYg+RB0XoOGHW5TGs5+SiwQ==
X-Received: by 2002:adf:fb4f:: with SMTP id c15mr32600110wrs.509.1642685271160; 
 Thu, 20 Jan 2022 05:27:51 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id a9sm2658454wmm.32.2022.01.20.05.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 05:27:50 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: warn about dma_fence_array container rules
Date: Thu, 20 Jan 2022 14:27:40 +0100
Message-Id: <20220120132747.2348-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220120132747.2348-1-christian.koenig@amd.com>
References: <20220120132747.2348-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It's not allowed to nest another dma_fence container into a dma_fence_array
or otherwise we can run into recursion.

Warn about that when we create a dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-fence-array.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 3e07f961e2f3..4bfbcb885bbc 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -176,6 +176,19 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 
 	array->base.error = PENDING_ERROR;
 
+	/* dma_fence_array objects should never contain any other fence
+	 * containers or otherwise we run into recursion and potential kernel
+	 * stack overflow on operations on the dma_fence_array.
+	 *
+	 * The correct way of handling this is to flatten out the array by the
+	 * caller instead.
+	 *
+	 * Enforce this here by checking that we don't create a dma_fence_array
+	 * with any container inside.
+	 */
+	while (seqno--)
+		WARN_ON(dma_fence_is_container(fences[seqno]));
+
 	return array;
 }
 EXPORT_SYMBOL(dma_fence_array_create);
-- 
2.25.1

