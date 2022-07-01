Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7954563960
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D901318ACA8;
	Fri,  1 Jul 2022 18:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC54318ACC3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UvErFdRb+yQ6d7xkP3vZiS7WsAN0qxK+4nKZEOvYY58=;
 b=g9F7jGqCUiFMh0RfUN5QtxwBFTIRvJCdbOP0U2S4Kkn10gQ5iZBUqSJbiNj+JMZSQCxdmF
 dLEDpRR2WmXgkOqJC014GuAftc6tzvOTEyBnudY5Yqbbp7KnqNQVKKl91o5DyaZR44Pjn4
 +DQQKRph4mhK8PzBbaZWzh9+IE+JkAE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-645-1I7sbil8NA66gt8uOElCbQ-1; Fri, 01 Jul 2022 14:53:17 -0400
X-MC-Unique: 1I7sbil8NA66gt8uOElCbQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 m8-20020a056402430800b00435cfa7c6d1so2298233edc.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UvErFdRb+yQ6d7xkP3vZiS7WsAN0qxK+4nKZEOvYY58=;
 b=yfp3EHgEO7UCnLJ3kkxNeoQCkh1zr1nP/0ds9zUlsTGpv+atITUPlsSdEqQoE8xVrZ
 HnSGIK4whJNtIqQI4iTLkYkFQ/qE/kPJ0jwgk2CHep2JHZd13S0ajTCejbzNclhOmGLY
 eOF5dSA9FeWlYCDN+oe1+rdoKga3eMsUnG2sDgvceTaiG7x4SbXacyGoax3fL+dfDke8
 KrRPYsh3ZDyonK+7Bxu6Sx4qwCV40n2j4GbquB4Rz5QCZCROkJactw5m+f3tLIuWLTgy
 1leaioag1SS0GG8DF/Gcdhl3lt2Pnxp84QVUA9lQRoccvbcATx9dS6DIWmVlxfuRxoHL
 XUmg==
X-Gm-Message-State: AJIora9jumyh9kQFm6UU01sLx5X2z1i8glb4S5GqjKP9e2y2cDXTNNuD
 c8FbOB2mFWV7+kYxo4jHbT6Rs+TcLIsV1W8ZsyLq7AGv5NA6joIpdkgu5hWKpv8YeALTDmV55DI
 lrMYxCz/A8l2EqSjAs91CBqhHqp0l
X-Received: by 2002:a17:907:75ee:b0:72a:a01c:b33e with SMTP id
 jz14-20020a17090775ee00b0072aa01cb33emr188077ejc.357.1656701596074; 
 Fri, 01 Jul 2022 11:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1veRfvTxLKnAHR14bR+YyLNsxQ1zyfx/tMaPFdQz2XxgjELs/czmewOir+5HUN/vin0c0W+zw==
X-Received: by 2002:a17:907:75ee:b0:72a:a01c:b33e with SMTP id
 jz14-20020a17090775ee00b0072aa01cb33emr188064ejc.357.1656701595883; 
 Fri, 01 Jul 2022 11:53:15 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:15 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 06/10] drm: use idr_init_base() to initialize
 mode_config.tile_idr
Date: Fri,  1 Jul 2022 20:52:59 +0200
Message-Id: <20220701185303.284082-7-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701185303.284082-1-dakr@redhat.com>
References: <20220701185303.284082-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

From: Danilo Krummrich <dakr@redhat.com>

idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
IDRs more efficient"), let us set an arbitrary base other than
idr_init(), which uses base 0.

Since, for this IDR, no ID < 1 is ever requested/allocated, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_mode_config.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index e2a295a4ee0b..3d1c1ade5a25 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -412,7 +412,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
 	idr_init_base(&dev->mode_config.object_idr, 1);
-	idr_init(&dev->mode_config.tile_idr);
+	idr_init_base(&dev->mode_config.tile_idr, 1);
 	ida_init(&dev->mode_config.connector_ida);
 	spin_lock_init(&dev->mode_config.connector_list_lock);
 
-- 
2.36.1

