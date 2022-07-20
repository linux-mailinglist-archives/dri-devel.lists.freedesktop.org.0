Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431C57B775
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5388B41E;
	Wed, 20 Jul 2022 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 532448B3A4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9VV2A0xt4iWoClogWKWNXWu4TrFupjD6pG6MWFdRlyI=;
 b=FnAnwwwzxQ8UhK8XKpBB0Gwvlqbm4M5jNT0XZC9TGi287Pw72gQ+pxg/Jv0o8DkAdglP0T
 icSJtE0S3j6a0SKUH0yDRfXURuDAuwoug06kyGOGYVdWhg/YWVDJPZyB0rZWLgSs3YBhBT
 ne+gi4WfKZpWHwbngbai9rmZdJaunGE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-82HkAMhqPoOQeIZfEADKYw-1; Wed, 20 Jul 2022 09:28:42 -0400
X-MC-Unique: 82HkAMhqPoOQeIZfEADKYw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t5-20020a056402524500b0043a923324b2so12242750edd.22
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9VV2A0xt4iWoClogWKWNXWu4TrFupjD6pG6MWFdRlyI=;
 b=bdB2szIoEcOGqV0C3Sfcl31SjrzYhzt4e6xx6nuxqAOisPB1H1FLMhibFnxVy0G4Gb
 /xzdYumxBNjiPORQ1Dyk2eW4jIpTCoCk67vBmnWa8VBFUEAUhZs67dy1RrJ28aE3cGAK
 8sKy4nOrB3BKX858gUt9MLGBDUVlOepB4O2TNJ5l1l0Fr/Au9Vsv9IvckrU/GJsU0wI4
 9KXaTjeosEIhzS7YEWlVte39cXIzBXr4L/7k0bnbSkypVEfRZGCWOTv/fBNishgp2STW
 QelTDG/8Y79HecRlcn3iBsR6degDsXGy+XIQaxgIslZ8XdOSNZeDeVEob/+sUk3o9X4F
 Du+Q==
X-Gm-Message-State: AJIora/EynAxWW2bo+/4FcvgAC/NYX8byv7kRpf94AsazoZI3eQ8djBf
 zXKs0uy7NDSJ03bMYUPjFi0zg//InItHbhZCLsMiOhuBK7Wsd9XRd4ryBuotQakOXEPDSkHJXtN
 STDY3+YOTKVtFIh8ucTPabrRcWaRM
X-Received: by 2002:a17:907:3f07:b0:72b:54b2:f57f with SMTP id
 hq7-20020a1709073f0700b0072b54b2f57fmr34761345ejc.502.1658323720507; 
 Wed, 20 Jul 2022 06:28:40 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uo8j6q388d7B1LrZ24MTAZEsBiw/LrA6Unb/g8/2liHXECnlfsKgcPxbProCFsFD4KKLtndQ==
X-Received: by 2002:a17:907:3f07:b0:72b:54b2:f57f with SMTP id
 hq7-20020a1709073f0700b0072b54b2f57fmr34761333ejc.502.1658323720343; 
 Wed, 20 Jul 2022 06:28:40 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:40 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 06/10] drm: use idr_init_base() to initialize
 mode_config.tile_idr
Date: Wed, 20 Jul 2022 15:28:26 +0200
Message-Id: <20220720132830.193747-7-dakr@redhat.com>
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

