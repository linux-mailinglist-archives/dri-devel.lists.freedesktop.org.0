Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794DB57B76A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 15:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7A28B1AD;
	Wed, 20 Jul 2022 13:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507888B219
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658323717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+f2U5Jo1TdZSY11r/ueBE+7GgJruty1MjYryFBsUD7o=;
 b=YRJqxRa7z507ulCpkXTQOQrXCwY2iZFRZ1W4z1dz2CnMYAya2sus376GWg7xyuWa7NkTrE
 b09yM2HX4DRfw2PJXxIwrxcoW0PbVux2aXuAAXcR5Mr7NAuwXY5Y9LtCdDUnR+Wap8j/vs
 CZKbXoXRPal9468jlGKIMkhXUokk8C4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-TjxiZZJYMiGvxbtbgDfDyQ-1; Wed, 20 Jul 2022 09:28:36 -0400
X-MC-Unique: TjxiZZJYMiGvxbtbgDfDyQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 nb10-20020a1709071c8a00b006e8f89863ceso4078434ejc.18
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jul 2022 06:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+f2U5Jo1TdZSY11r/ueBE+7GgJruty1MjYryFBsUD7o=;
 b=i/f3sc5H+25XvV70hSHTbdapGfZbR8YxaveW8qxWTQm1Ork77LAU5qsJ9edUzc8rtm
 Xf3hX2IVyNM+M2QiTqOBCwc2iC1lsq9tHV4W33hhHrZjW5AnX22QrRQFH3AI5zzbTW6E
 KtRNWpQ4lhBLwPofY3gZsucBJ+VxzTMe9B+ZUNqUYvbNp59W0sGLfUNNWh0e6zmfvCd2
 VTo6kT1J8hpQZKm1Y+ovtwGjs4zLPEpNK3HCdsSNbeNMuq4jEveVEx3huZXPa0iKAvDw
 tzPucxwOLJYu8cWSi9ETQNm8R8KV6bIsf4+w1S1pVhLc/bNXLTHncDk/+GUGfgR7hwp3
 U2dA==
X-Gm-Message-State: AJIora/JuKhtbetLbaxryg4LQKKbFDOoNZw0Y+F5JBnCIspYL7vxVn8D
 F+oNW+k4iSFl4TC6OgIV/CiG9UMoWTm4Pa9y2Nl4mKI46BmeQTHbPnU1UzpFUFUEfYF3GiH6CEo
 nmIKL1gfxIwPeJpNaDAfSRgLFOGta
X-Received: by 2002:aa7:df83:0:b0:43a:4b96:f126 with SMTP id
 b3-20020aa7df83000000b0043a4b96f126mr4357272edy.309.1658323714995; 
 Wed, 20 Jul 2022 06:28:34 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vLFazpLitgbJcdGubIMhTG6WFsmdCd40ex9BK/SES/RtLtw9an98NNGQ71I0eglmrGe8zNyw==
X-Received: by 2002:aa7:df83:0:b0:43a:4b96:f126 with SMTP id
 b3-20020aa7df83000000b0043a4b96f126mr4357256edy.309.1658323714847; 
 Wed, 20 Jul 2022 06:28:34 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a05640225c700b0043ac761db43sm12220687edb.55.2022.07.20.06.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jul 2022 06:28:34 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@linux.ie, daniel@ffwll.ch, mripard@kernel.org,
 christian.koenig@amd.com, emma@anholt.net
Subject: [PATCH RESEND 01/10] drm/amdgpu: use idr_init_base() to initialize
 mgr->ctx_handles
Date: Wed, 20 Jul 2022 15:28:21 +0200
Message-Id: <20220720132830.193747-2-dakr@redhat.com>
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

Since, for this IDR, no ID < 1 is ever requested, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
index 7dc92ef36b2b..cc87c3809a8d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
@@ -841,7 +841,7 @@ void amdgpu_ctx_mgr_init(struct amdgpu_ctx_mgr *mgr,
 
 	mgr->adev = adev;
 	mutex_init(&mgr->lock);
-	idr_init(&mgr->ctx_handles);
+	idr_init_base(&mgr->ctx_handles, 1);
 
 	for (i = 0; i < AMDGPU_HW_IP_NUM; ++i)
 		atomic64_set(&mgr->time_spend[i], 0);
-- 
2.36.1

