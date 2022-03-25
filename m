Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA464E782B
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:43:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF8A10E76D;
	Fri, 25 Mar 2022 15:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE62910E76D;
 Fri, 25 Mar 2022 15:43:27 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id h1so9743042edj.1;
 Fri, 25 Mar 2022 08:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP4oquXI/E3mtdW950mzpwsU3zSTx1OYvcht8inS1yQ=;
 b=lZZDUTz79zDw3QYJiXP15xKVaJZLoUdcKasNVnNzVkhiYpSRANlH6yrHPIk0D0fF57
 6armA0Dn1otC3IA3Jz1L8T9mXPwoBI+A5NwUfGvg6CNe/+y51it2bxHbUpYoYrgnpbbA
 4p/JAfYBRo8+eq+wefQa7M1wgoPp1OepEj4RcxuoIwFBtVFYDUk0oH/dEpmTdq+MBDYV
 2z305zdugDZFq+8FnIZ0HlAB7etMX72TvJVFj1NQ78r+xuG54pLlSJccxtQ37ykX8isY
 S53fl9wIBozfXdx13wJqUfjl8Xt3FIbDgpe7D1YPvf5KiiuXdawN0kpQ37xLn+BooCk3
 HhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP4oquXI/E3mtdW950mzpwsU3zSTx1OYvcht8inS1yQ=;
 b=zdgZi4FSMsLDE4Lp7KIJrdM1d9IN2zQMIeeOUvZZEZgLBIuWKQH/Ts5eo3RD+dF0Ai
 dCTY6HfoU+sHgHP42lgVtzVxsQQolDIDPAQK1OW0ZiO27EzYvtIOL33CPY8AgBnRbSXM
 Km+WOb52+R57ZVQ3Ma7GIvFCXzXuyFxbOYM4hfC3droiSpOXP3FCeKvCV6TZT5i01cuI
 TuljEK6pwTWaks4NFjqvonSrgLo7mpqCkF1967qIf0nDHS6CHr+ipp+DeSLQynJQhP3S
 rjAYREn+wBXjn5TkMfO1P8vW7xSYmMIJVFWbWgJLcoVp1J56tXJPsB7G4sWGoXrH3ctL
 GyGA==
X-Gm-Message-State: AOAM530rDv1Nhx7Z3OZYFskuX/wKbwWtZkH0nq7DR4HItFMXzuj88Sa6
 sZI48pCdblHT+5ySP9C0UwU4tlydAi4=
X-Google-Smtp-Source: ABdhPJzycRLB4TnsWMwakRM/fgWS7O99ZGSgmT5FuDWQeIKDN8+qshW2+aLHqHXTeUlq69ucfM4bjA==
X-Received: by 2002:a05:6402:4247:b0:419:3c6e:b0bf with SMTP id
 g7-20020a056402424700b004193c6eb0bfmr13539604edb.374.1648223006327; 
 Fri, 25 Mar 2022 08:43:26 -0700 (PDT)
Received: from EliteBook.fritz.box ([2a02:908:1252:fb60:17b5:736b:9621:3369])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd8074d27sm2439558ejc.79.2022.03.25.08.43.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 08:43:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH] dma-buf: WIP dma_fence_array_first fix
Date: Fri, 25 Mar 2022 16:43:23 +0100
Message-Id: <20220325154323.221765-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Looks like somebody is creating an empty dma_fence_array.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-array.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-buf/dma-fence-array.c
index 52b85d292383..5c8a7084577b 100644
--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -159,6 +159,8 @@ struct dma_fence_array *dma_fence_array_create(int num_fences,
 	struct dma_fence_array *array;
 	size_t size = sizeof(*array);
 
+	WARN_ON(!num_fences || !fences);
+
 	/* Allocate the callback structures behind the array. */
 	size += num_fences * sizeof(struct dma_fence_array_cb);
 	array = kzalloc(size, GFP_KERNEL);
@@ -231,6 +233,9 @@ struct dma_fence *dma_fence_array_first(struct dma_fence *head)
 	if (!array)
 		return head;
 
+	if (!array->num_fences)
+		return NULL;
+
 	return array->fences[0];
 }
 EXPORT_SYMBOL(dma_fence_array_first);
-- 
2.25.1

