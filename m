Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA275CACD
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 16:58:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 535BF10E69A;
	Fri, 21 Jul 2023 14:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411F110E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 14:57:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3142a9ffa89so1755611f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689951474; x=1690556274;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pPQpaJOnqLf9UDb4uXUGcUWJo8wk2AIw2cPDMM0EptM=;
 b=vOR6lvAGYSRM+b/6mY6rDgti9+yZEIUSxHTyBgCB5+fkizJoa2AuQmN7tIm3tkw1wB
 hrW/sHNJz1G7mgKNnBfgtvLVRxil7QsFjWUnUWHk1ZO72bcDHTovup5mLFBwC2OpyjXv
 IMTQpUId6n/F3B8sbmnyb2Upbjly3l/qq6C6NrKrf3O4jPrQ8gpqylzLbl7PvzvDv4dK
 DV4zwC9IKyctFV3+nGCXcJ27Fm/XbQvMh72lpFJ8mVTdR5ukWOpZAZzWFGQ+1DNWmJo4
 NzH2esTrV2ZhipnkOWQRxIwU3OvaYtPUKMSnDAOP1MoYCdWBFS/6IzdDbK4vsTaZ2mbs
 3IfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689951474; x=1690556274;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pPQpaJOnqLf9UDb4uXUGcUWJo8wk2AIw2cPDMM0EptM=;
 b=BsFiGTX3REuxxpbl+SvcM0/BYxmPzHw7P7qhuwlmu7NQyurzAurbo09oh5GDfO0BXF
 Y/UG/WvhCzply/kRMZP1a6AeJ9H2s5z0vUau05lDXaoV6w2OYtIf6vCE6oRJWNXdmni8
 1gdpgE1gXkqHADjMXy3uenDks5WwmB67J3JuKU7qj89TV/8NKsp9VagRTDEo4EXCG6im
 6k9V4Bfe7yMwxVImdu1ZJQVwPyTXb/tid1XDnhado+HocFkMFatsU2AIwN+Z0k9Jczvq
 G1ZerXMVgpEZ2s02LfCBsFu5X8aCFBESI9hQ8e0JDKZPWM1Q9FyO4YdGNYdgBwZIWMQX
 8pcw==
X-Gm-Message-State: ABy/qLY+PGTFflUEWCkZPU0F396zH9IgdQFDeX9AMQGlcD/bjI5tpfAk
 F448s9J55T4qEwh9+eRodJj6cA==
X-Google-Smtp-Source: APBJJlHf12iTj2XIZFYCHGgNNJK1PIyLvIRCwMsa3dnbCrEmbtJZgPtVxnTebkbq8CGmJvu9kzFw7A==
X-Received: by 2002:a5d:51cb:0:b0:314:f18:bc58 with SMTP id
 n11-20020a5d51cb000000b003140f18bc58mr1552225wrv.58.1689951474654; 
 Fri, 21 Jul 2023 07:57:54 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 q4-20020adfdfc4000000b0031134bcdacdsm4437126wrn.42.2023.07.21.07.57.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jul 2023 07:57:53 -0700 (PDT)
Date: Fri, 21 Jul 2023 17:57:49 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/managed: Clean up GFP_ flag usage in drmm_kmalloc()
Message-ID: <ddf86b59-696a-45f0-96dd-b87aa7b9ab2e@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This code is not using the correct gfp flags which were passed in.
However, this does not affect runtime because kstrdup_const() is a
no-op in this context.  (It just returns the "kmalloc" string literal
without doing an allocation.)

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/drm_managed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_managed.c b/drivers/gpu/drm/drm_managed.c
index 5423ad883729..bcd111404b12 100644
--- a/drivers/gpu/drm/drm_managed.c
+++ b/drivers/gpu/drm/drm_managed.c
@@ -196,7 +196,7 @@ void *drmm_kmalloc(struct drm_device *dev, size_t size, gfp_t gfp)
 			       size, gfp);
 		return NULL;
 	}
-	dr->node.name = kstrdup_const("kmalloc", GFP_KERNEL);
+	dr->node.name = kstrdup_const("kmalloc", gfp);
 
 	add_dr(dev, dr);
 
-- 
2.39.2

