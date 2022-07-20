Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B4457B778
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17F38B404;
	Wed, 20 Jul 2022 13:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94FB18B39D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D5ddLIULHU4lCGQd0NSPYCIu5p1tGKAtdnoOfURMriM=;
 b=c1M2DmaX8lEV+hHA8wtN1LbIcfg+/d7vKSkD3MG6z60ety/dMe3CQipmSd/6jjs+IgtAuf
 FEZeQ1ZeiuZLTlZndgA9Gz7XE5DQwGf9D6Bfcff5MGUmQrUhEy8IjTqJV3UxyrqdIc6vgY
 tVb8/V0pUitNh94xDo5f4OmIxPSLanU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-T85jZHK9POGbIp9xhc91bg-1; Wed, 20 Jul 2022 09:28:39 -0400
X-MC-Unique: T85jZHK9POGbIp9xhc91bg-1
Received: by mail-ej1-f72.google.com with SMTP id
 sb15-20020a1709076d8f00b0072b692d938cso4045551ejc.10
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D5ddLIULHU4lCGQd0NSPYCIu5p1tGKAtdnoOfURMriM=;
 b=basUyHaQcjm2Dfe4qiVv1d1PyV1ySAlD6GYe0T/vPnH1wn3o0EXfwuBBkF5ZMK9/T4
 IMISd1AZGACWd+md8quRpGhYONcgR+KtlGxxr1x2nAI9lwZaurVCrLlWa3iiaEdP1LVO
 kMGzCAQ2pt35MYUU/5BvdnloWUvsTVL96FcMJMyktL+1huJDOFgDgnAAeJNKaZ1uadlm
 D2z9hUw9jJsP1CaVWs8fgmnHsvZBAruiXcl+pBWUS4smJU6L3dR6J3vISIoDTeRnNWDF
 mcTm23uzfyAiUv3U/ZYQgfWE/wGPQro+yFJsV+7gC/gCfP8VH+FlJ4zZiVpiDrzduop+
 +Gww==
X-Gm-Message-State: AJIora+Rycw4N0m34McaiTFxntP9gxQbPfERNtxVGPDYO2hJVSVHrWmP
 6kv5ZpWKbLH8xjAjGXFmOijF22BYaIfcIeLsBWU4KmYRk+W4y4M0jbt0tGVNqhb7wM7bgofWPKf
 LfqhyxkDwlnitV4R/agEKSLaIpIhy
X-Received: by 2002:a17:906:844d:b0:72b:307d:fb52 with SMTP id
 e13-20020a170906844d00b0072b307dfb52mr36174061ejy.182.1658323718290; 
 Wed, 20 Jul 2022 06:28:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sY/1Zm6BfoPARI1YbiV4ibajD1bahl1m6CRJ1x477gp7Vj0dinJMpAeZDF8tcyy5jgf5+z8Q==
X-Received: by 2002:a17:906:844d:b0:72b:307d:fb52 with SMTP id
 e13-20020a170906844d00b0072b307dfb52mr36174049ejy.182.1658323718132; 
 Wed, 20 Jul 2022 06:28:38 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:37 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 04/10] drm: use idr_init_base() to initialize
 master->lessee_idr
Date: Wed, 20 Jul 2022 15:28:24 +0200
Message-Id: <20220720132830.193747-5-dakr@redhat.com>
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
index 63395bebaa6b..cf92a9ae8034 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -147,7 +147,7 @@ struct drm_master *drm_master_create(struct drm_device *dev)
 	INIT_LIST_HEAD(&master->lessees);
 	INIT_LIST_HEAD(&master->lessee_list);
 	idr_init(&master->leases);
-	idr_init(&master->lessee_idr);
+	idr_init_base(&master->lessee_idr, 1);
 
 	return master;
 }
-- 
2.36.1

