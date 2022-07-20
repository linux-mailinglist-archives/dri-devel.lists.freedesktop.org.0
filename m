Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD07357B76F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB0E88B3A4;
	Wed, 20 Jul 2022 13:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E19558B39D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gkqfIGU1jFp3Ya/5fwJtXiMW+j3VZbkqa61u3PfPfGg=;
 b=hoPkCNbcHMQzr2U69upI6iZctOnJhEM36zeE95M4qzlxF580Jnq3AHcI+JqlOGKnbJFE7A
 2P36eg0SN8JowwOeAmPiggDTAv6uVm4BlRX0zIHQIJV1KK0vluGRFFfMAGKz4ZZd11T+RY
 r1JMx6w4i8uTUBuJurlR/hTP3OfPg1c=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-qc0RHQjxOzO0TwgoquUSYw-1; Wed, 20 Jul 2022 09:28:38 -0400
X-MC-Unique: qc0RHQjxOzO0TwgoquUSYw-1
Received: by mail-ed1-f71.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso12051298edx.19
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gkqfIGU1jFp3Ya/5fwJtXiMW+j3VZbkqa61u3PfPfGg=;
 b=CDtEH0IEnsW/YTowtQDj6enUy9yoUw+DqYHaufZ1MHYzW+5PZAXpRJyx+PMkuICPDx
 s9iw/b98JRtMSLxPwSu1085M1nZYdCC9Ap6Q7jV2oVxjHvo21fTBqU1Ent2UM0hmsEfR
 j4qYfr2xwTIjf7Xj+Ln/Q7u4qHaGoDS0rBovUgv/E2KO0uEtPhZzArSuriTqg7TwQbaT
 o4D55kAdLSxVIw+l90qaY5mfsyhkIquBEb1S0Iox5tV+ibmW4LWiXeymoLCO+mM7SDSE
 H93pfH/F5+5sxtcq/Qdpf5I2NId9gVwFQW5FNQXibEKNO26zKFZ2evYPywlbMn8V5gfn
 6QyQ==
X-Gm-Message-State: AJIora8acskwkTZ+pH39CMuwKEU3Cj9xQ07FsFgccS4CuQY1zpR/sxEP
 LQuLda6Ek3a2XW2ul+A4GHOzuwvhFmOE8KHhHqFpzpCIJJl82U9C4UrFOZOJ4/apKQmL06dGEkU
 eIpBeGs8Vd5ze8C4ruwH2XFF0sLsT
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id
 et15-20020a056402378f00b0043ad3f579f2mr51775757edb.338.1658323717204; 
 Wed, 20 Jul 2022 06:28:37 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t3fSyGyUhItvWNAfzBrVUs5sXM+vSZQoJwXk+V++H1tUF1Sa+Sg+abJ9GPTpm2/Ve6F4StiQ==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id
 et15-20020a056402378f00b0043ad3f579f2mr51775750edb.338.1658323717069; 
 Wed, 20 Jul 2022 06:28:37 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:36 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 03/10] drm: use idr_init_base() to initialize
 master->magic_map
Date: Wed, 20 Jul 2022 15:28:23 +0200
Message-Id: <20220720132830.193747-4-dakr@redhat.com>
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
 drivers/gpu/drm/drm_auth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index 6e433d465f41..63395bebaa6b 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -140,7 +140,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 
 	kref_init(&master->refcount);
 	drm_master_legacy_init(master);
-	idr_init(&master->magic_map);
+	idr_init_base(&master->magic_map, 1);
 	master->dev = dev;
 
 	/* initialize the tree of output resource lessees */
-- 
2.36.1

