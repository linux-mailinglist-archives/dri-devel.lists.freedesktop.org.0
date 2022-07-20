Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1D257B779
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4338B42F;
	Wed, 20 Jul 2022 13:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BACC58B3BA
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Rk9AhtZmor412ab1pdm8kQawl+ZyAY1dgO0bYINvs54=;
 b=Q7RAPYOLrf8ZAVEjqHTOSb+kqfoWHpomEYS5MPOusV6JyjVz36TFHp5U0m8eAz9KHczu4q
 b35pRjn79r2TSeW+bjy8cf8Xtrv5zPhti1Od2XRbQGxn71c+qVLxzSWbD6RZ7sr1B7T2E3
 g9AAcXTTbDnRlre65VKZxxmLAUoQfqE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-tIRCQOFNN827Ou-xI_DrSQ-1; Wed, 20 Jul 2022 09:28:42 -0400
X-MC-Unique: tIRCQOFNN827Ou-xI_DrSQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 b15-20020a056402278f00b0043acaf76f8dso12235405ede.21
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Rk9AhtZmor412ab1pdm8kQawl+ZyAY1dgO0bYINvs54=;
 b=h80r5rU/kdNsmtY8SpkBM+JiK9A62ZtpGyTH8rWXuZ/XKVHGnYGyyzpRCK8PZ8U3iM
 zqBetIwffiC3fx/inF+3VJrXmnuUYN1JWQbkYwmerP2J0JNtefN486Kzykc0eIKkFro0
 UAF0RfAGIWTo5vF+IfjedL3UYswl5KCWsLnQV+HAyIdNlrSLyp6IfYTo6rCIdWaVVuai
 +cIxTeghiz0WUkTOfnjUGNicEJwcZBHdO4NVFJa2O8sC9eg/cmkluZzd0+mheZFeuQBf
 UY4SKIEh7FF67hbF3bh8N/6zF0WDReQhDMypo5Bt4WdmIIvYYYxynRcVf9h5b1wH3l2i
 qwJg==
X-Gm-Message-State: AJIora9/Y0+7hGpoST/kZ2AIMw+jmTqkvkBd2/Us0i6yBkygpuJXWnW8
 FKf4Zd+udsBIstQFo78jUji3TwKw/21fDcLOeHrjxkXL0UK6P9IaHnhTOicvwLG8QDjhBdmtjiw
 jgjGp9guSiDTeEKtvft27BArrWHpK
X-Received: by 2002:a17:907:72d2:b0:72b:d238:4e81 with SMTP id
 du18-20020a17090772d200b0072bd2384e81mr34316147ejc.104.1658323721573; 
 Wed, 20 Jul 2022 06:28:41 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1thris3Hs7kI1+V5PiU8wpgCAuZjyMTOSv7gtwkI3GRkFHOAUXOMZoByN9Z0aScoROqDsYNwA==
X-Received: by 2002:a17:907:72d2:b0:72b:d238:4e81 with SMTP id
 du18-20020a17090772d200b0072bd2384e81mr34316128ejc.104.1658323721356; 
 Wed, 20 Jul 2022 06:28:41 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:41 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 07/10] drm/sis: use idr_init_base() to initialize
 dev_priv->object_idr
Date: Wed, 20 Jul 2022 15:28:27 +0200
Message-Id: <20220720132830.193747-8-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220720132830.193747-1-dakr@redhat.com>
References: <20220720132830.193747-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/sis/sis_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sis/sis_drv.c b/drivers/gpu/drm/sis/sis_drv.c
index e35e719cf315..6173020a9bf5 100644
--- a/drivers/gpu/drm/sis/sis_drv.c
+++ b/drivers/gpu/drm/sis/sis_drv.c
@@ -50,7 +50,7 @@ static int sis_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv == NULL)
 		return -ENOMEM;
 
-	idr_init(&dev_priv->object_idr);
+	idr_init_base(&dev_priv->object_idr, 1);
 	dev->dev_private = (void *)dev_priv;
 	dev_priv->chipset = chipset;
 
-- 
2.36.1

