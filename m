Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2DC57B777
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5E8B8B438;
	Wed, 20 Jul 2022 13:28:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47FD8B3A2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g0aUb76AKpcqinp04UULk4k3wJtOXAh9lLl0DFNwwBk=;
 b=KwKaohK1F7H4PEgQlfw0vKlmaZWE0nqDiQ+HBL1DLeer2i8qLS4WSP9AC8igI0/zsP2JKN
 UlMQEYNpuotXdMPA/QSX5ljn4682SljP6R9wPE4z2gxim6t4ehgeUBozJqepaLOb5x75uk
 WR1GUNoRO5Rg7sLsi7J09y0aQ13w7Uo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-X1uUU8QtO6eohqAVhZbn5w-1; Wed, 20 Jul 2022 09:28:38 -0400
X-MC-Unique: X1uUU8QtO6eohqAVhZbn5w-1
Received: by mail-ej1-f70.google.com with SMTP id
 x2-20020a1709065ac200b006d9b316257fso4045503ejs.12
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g0aUb76AKpcqinp04UULk4k3wJtOXAh9lLl0DFNwwBk=;
 b=JNFcoDdSnhnbFOrAfBn42hTPSiHCidGHZYU7I7Rocb+21IxY7ePCZtG4SXRzWSoSTz
 vHuHQqH2NNtbU38uJWBbx/sM1aQGc4sEYzl1SH5+ouCDpl31nw3XJcD9JIUQBigJU9aA
 2MdhBx6eyFN6gneusv8p2JZ1LDCetT1XYunnxeMY0FWJBSVpAuNQRAPrEJWU3VgfIUHg
 x0mszu4WOTZxl2SdIK6+19/qyJA558l4o9d6VL78kNDl9zbMESrj4iVln6wYUN0BTvKx
 AhXoFA/NkVv7GIgkV7XyN23NM6dOJjL+aUO4otwJ7AV4T/ilfqUhxF08adMd79k4nlX9
 9fSw==
X-Gm-Message-State: AJIora8TqPtWX/GxlMzg/x5zTkj41spfOmFibJVkYaEV2302pw6DRIT5
 ODObb0YDr/urzOnYw1k4K92u86Sp51oV0Ji7jDzA+zhDDRz8HnJQaSd2d/GN7TbH4FrYV82QCpZ
 nFi1cDJl1skjBmNKxqTNXxH+tnteu
X-Received: by 2002:a05:6402:4007:b0:43a:7de8:2802 with SMTP id
 d7-20020a056402400700b0043a7de82802mr50665919eda.13.1658323716139; 
 Wed, 20 Jul 2022 06:28:36 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vd+mjGZZnD1P3oypeeTfNuxLWMjp+6F8sRSDwHasiOupx08H4bDmLgynZ4GDTntTb+QIUyRQ==
X-Received: by 2002:a05:6402:4007:b0:43a:7de8:2802 with SMTP id
 d7-20020a056402400700b0043a7de82802mr50665895eda.13.1658323715953; 
 Wed, 20 Jul 2022 06:28:35 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 02/10] drm/amdgpu: use idr_init_base() to initialize
 fpriv->bo_list_handles
Date: Wed, 20 Jul 2022 15:28:22 +0200
Message-Id: <20220720132830.193747-3-dakr@redhat.com>
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
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
index 6de63ea6687e..103927c48d05 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
@@ -1148,7 +1148,7 @@ int amdgpu_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 	}
 
 	mutex_init(&fpriv->bo_list_lock);
-	idr_init(&fpriv->bo_list_handles);
+	idr_init_base(&fpriv->bo_list_handles, 1);
 
 	amdgpu_ctx_mgr_init(&fpriv->ctx_mgr, adev);
 
-- 
2.36.1

