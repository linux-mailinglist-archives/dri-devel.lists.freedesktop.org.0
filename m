Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C5156395E
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2C218ACC3;
	Fri,  1 Jul 2022 18:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F5418ACC3
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=63rX3ptgchfOBbW8BmUq0MeFehoHIgkdOiFcVPPOAq4=;
 b=JvY8vEY94MlXRj02Cl3xeIR0nMzmkIu5UOQ8nEv2WuFu2PdP99BL9hCRrmKSJ80r3eFjGW
 qC84SUXM9A/ju9qcxDLtrVNVai+9aBivH09EqlVBuaHKYUBpX+CdZA2BKKRkuxeqYhCPlJ
 28usOWeuo5hEMVtXGwUs6Sg8zb7w5nM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-448-pMmPVl2-P0elFkYBdkOUFA-1; Fri, 01 Jul 2022 14:53:13 -0400
X-MC-Unique: pMmPVl2-P0elFkYBdkOUFA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h16-20020a05640250d000b00435bab1a7b4so2305094edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63rX3ptgchfOBbW8BmUq0MeFehoHIgkdOiFcVPPOAq4=;
 b=kE9TTJo5DFwQPJNwh9QGkCSabiaUSDucutKvmFz5gfxG9Ypo2FrULqDcIibVF6DtcA
 ouTDeFd9x611ki9JmYXNc5nnqfJjRyeCYcRin+bFfk/rYb87Il1RWA6uubyQSjInVq89
 mF6oZT0FpX5ZEuv53i/9IgsArK37Ayeyaoq29EShUNCT5jsAOoQtxBMMJ9M4fGQiVfgQ
 ByEuce906jTMZVArrE7Hf3VS+oUNY58nlK74RK0n4OCACdFwhPlwVIXuVqul2vtsSKVl
 YB0y3JIqzYpDlckZR3MQPJCaPJM/Hvc9gcZ37ZMLrVmhN4/DAZkdx4RmzdqhLFjF9bim
 ahMQ==
X-Gm-Message-State: AJIora979/vGJhQN6ZWQD9o0uBxIbH4hu3JIbHYEEgHqgUihJgL1CdoZ
 oNFk6AUxgx8X4DqUpxDOm5bDQjCjQNYlcHP2FuE3KrDFqRT1k8PjgBD/QOXjqDnalABb4uZ6p4Q
 GMN400sNtnotYmOGRyLA4jS1idr0p
X-Received: by 2002:a17:907:3e82:b0:6ff:1e04:a365 with SMTP id
 hs2-20020a1709073e8200b006ff1e04a365mr15143277ejc.617.1656701591431; 
 Fri, 01 Jul 2022 11:53:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t2CRyy1sngD6eC2nYuVt9TTA6P9z7wTWn5nnIISMwguXpv2JkANsqjZQx9hF16u8hYh17A3A==
X-Received: by 2002:a17:907:3e82:b0:6ff:1e04:a365 with SMTP id
 hs2-20020a1709073e8200b006ff1e04a365mr15143268ejc.617.1656701591277; 
 Fri, 01 Jul 2022 11:53:11 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:10 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 02/10] drm/amdgpu: use idr_init_base() to initialize
 fpriv->bo_list_handles
Date: Fri,  1 Jul 2022 20:52:55 +0200
Message-Id: <20220701185303.284082-3-dakr@redhat.com>
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

