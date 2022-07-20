Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E1957B76E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:28:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53F88B3BC;
	Wed, 20 Jul 2022 13:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 314968B3A3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323722;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1+PcLE/VWZKE0O75uq+LhMOqrtDlyMvhqIp9miCLrKk=;
 b=iPoZodHAclOfTcXZlndh+c8nSlQrPsBKFSJIv9KUsQ0at3xMacFEBUB1kb6x5WQb8hvZB6
 McMr8ZQGzbzXLCuJXtKJ/QyZ9KaqmVPXAZBArEYVL140jimCoG1SRSZ26AbO4BbD8piAvy
 IFIzSElzNYuuirsDHgn0S2W4UZSyljk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-570-qL3h1g5ENRKEg9uEOS56UA-1; Wed, 20 Jul 2022 09:28:40 -0400
X-MC-Unique: qL3h1g5ENRKEg9uEOS56UA-1
Received: by mail-ed1-f70.google.com with SMTP id
 w13-20020a05640234cd00b0043a991fb3f3so12027696edc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1+PcLE/VWZKE0O75uq+LhMOqrtDlyMvhqIp9miCLrKk=;
 b=BuAiAtbbEJhT0o6pUTOXofdtBm/4zz5kS0GFrPvpezyJp3TDO8zTFLVOxagZRX+gXL
 0vU1W0NYzX+qyzMIfs/+6NLKsEwgiaznSPNzf6JeZpzIXDzr1pDp0vpnApRBZq9Sypbx
 XWwQOlWd4GzT48AZ+ZjsPq7xPxbPGWzf3Y4ChrTFuo2FgiM+tjJm3/Oj0/3KQqfmMTt7
 5j7xWpxw3lnY74/2FZChslDYQ36RrPbttGSbfLjTGBd69ZlDpmnu/nMILYaahektBtqs
 TMe94GoHXAi6iwP+Rc6tcAUPNeAZZR0zvJmQ8RCiiarV/TIBhu8ARr8QRpQ7KaT7MLGf
 YRLg==
X-Gm-Message-State: AJIora/GegzYY++tyHVtC9sA2WsOStIMKXhUbSb0mqQ5w07KC0Jj5TyX
 SK3KglzEInSszoIfS06ON3zHF14F4YzrDlemCYU4Y4d6+TtKdRiXhajzW68k5OJG+aOXnocFFO5
 LtFiJMMY8G9EG8GWSMhCm0PU4YxaS
X-Received: by 2002:aa7:c9d3:0:b0:43a:67b9:6eea with SMTP id
 i19-20020aa7c9d3000000b0043a67b96eeamr49930814edt.94.1658323719488; 
 Wed, 20 Jul 2022 06:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vEyOQrCfAYTR3roW2kvuyG5vM8MOGEzRZ+5S4xhOeQcoo4SnmiDYQWkH0qb2zNTJLilpgqgg==
X-Received: by 2002:aa7:c9d3:0:b0:43a:67b9:6eea with SMTP id
 i19-20020aa7c9d3000000b0043a67b96eeamr49930796edt.94.1658323719350; 
 Wed, 20 Jul 2022 06:28:39 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 05/10] drm: use idr_init_base() to initialize
 mode_config.object_idr
Date: Wed, 20 Jul 2022 15:28:25 +0200
Message-Id: <20220720132830.193747-6-dakr@redhat.com>
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
index 37b4b9f0e468..e2a295a4ee0b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -411,7 +411,7 @@ int drmm_mode_config_init(struct drm_device *dev)
 	INIT_LIST_HEAD(&dev->mode_config.property_blob_list);
 	INIT_LIST_HEAD(&dev->mode_config.plane_list);
 	INIT_LIST_HEAD(&dev->mode_config.privobj_list);
-	idr_init(&dev->mode_config.object_idr);
+	idr_init_base(&dev->mode_config.object_idr, 1);
 	idr_init(&dev->mode_config.tile_idr);
 	ida_init(&dev->mode_config.connector_ida);
 	spin_lock_init(&dev->mode_config.connector_list_lock);
-- 
2.36.1

