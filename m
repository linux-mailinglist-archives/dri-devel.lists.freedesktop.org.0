Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E34D57B773
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15CC38B410;
	Wed, 20 Jul 2022 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986868B3B0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HT8NZrD1nNwbS5gwsuj1LsW1Zo8PIy3JRlNd/+istdc=;
 b=e58dSLquHj45axAkherFpVfxxB5Ff6q1Etx9OcUme9ltpzt6OtY6kf9VTKwGTqyAeO6E1+
 NiD2u7ctt+B8V6TR14YE675WBRI110RWCsqkDcP+nNi0cu0oWThsjQZoMfKprl+ZPs/zW8
 ciMD68peWAnYrg0rw/7mvubLlEe1myg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-3gDlVkPtN-WP0kBIRNgGzA-1; Wed, 20 Jul 2022 09:28:45 -0400
X-MC-Unique: 3gDlVkPtN-WP0kBIRNgGzA-1
Received: by mail-ej1-f70.google.com with SMTP id
 s4-20020a170906500400b006feaccb3a0eso4080796ejj.11
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HT8NZrD1nNwbS5gwsuj1LsW1Zo8PIy3JRlNd/+istdc=;
 b=vlj9L8m3PB84/ZMbtHnAs8RS86y5Q92Q9P0pNilB+bWeBxFzdbjSaS9ocvIAzyj0MF
 SARST6EvK8+SvnxN6WupmolYiPGAsFBSjSoRYYGCdD2s6stS28E/MMsU0NRXqoRA+wCg
 KiaLNtMxXKPBoWMwkb60jkeqbvGrWswlyD3m4D2GGGQ+/UmfgBffsh2kzkMZH9jCaL0c
 hN4y+UBJZVd0gN9w2RRCB+tZwzRttyiRcpix+ijXJ/QiEQ7it3O0lhXPg4g2gH2wsH2k
 wq2MKgkziFFGu0V0IIZ/jiFH7SZ4aAcU/NjD4tLOGpKyzj1Ao6VszE87YnypbrQK0X7f
 RGPw==
X-Gm-Message-State: AJIora8FhGxUNF358Tp6TAEzUpmV6dz5M+etAGvUYzfvQq2zR0SIuY/y
 bqzfiVkt5wYvSA1r2jLOSsOCqX8qOX5xdQ/8dbou9aEfQ+AClYEDdWv1gnHxltyc3mT6f785Ocy
 gEGxY+P2tWTakPYsvcWetQN4noRM5
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id
 er11-20020a056402448b00b0043b5ec68863mr23093206edb.377.1658323724422; 
 Wed, 20 Jul 2022 06:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sL0huhxDNzivABMSLHJOkvQvPhq+NEIJUtv2pSgx9lvIUBoWWPk+tq72bF8qSorQ5UBbg3qw==
X-Received: by 2002:a05:6402:448b:b0:43b:5ec6:8863 with SMTP id
 er11-20020a056402448b00b0043b5ec68863mr23093183edb.377.1658323724236; 
 Wed, 20 Jul 2022 06:28:44 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:43 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 09/10] drm/via: use idr_init_base() to initialize
 dev_priv->object_idr
Date: Wed, 20 Jul 2022 15:28:29 +0200
Message-Id: <20220720132830.193747-10-dakr@redhat.com>
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
 drivers/gpu/drm/via/via_map.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/via/via_map.c b/drivers/gpu/drm/via/via_map.c
index a9f6b0c11966..c20bb20c0e09 100644
--- a/drivers/gpu/drm/via/via_map.c
+++ b/drivers/gpu/drm/via/via_map.c
@@ -106,7 +106,7 @@ int via_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (dev_priv == NULL)
 		return -ENOMEM;
 
-	idr_init(&dev_priv->object_idr);
+	idr_init_base(&dev_priv->object_idr, 1);
 	dev->dev_private = (void *)dev_priv;
 
 	dev_priv->chipset = chipset;
-- 
2.36.1

