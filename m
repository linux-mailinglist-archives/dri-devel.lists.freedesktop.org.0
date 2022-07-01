Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D5256395A
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 20:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EC3D18ACA0;
	Fri,  1 Jul 2022 18:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8442F18ACA9
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 18:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656701592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/eGVHzjhye4tUiS8VCyJS+YtTUEyz7/sK1IBUUWWhM=;
 b=eBc/wSJhnIrqprJs//KLUu4iyxDowJ+iJbomoal+AyTUyApzrZQgde0rYvymxhHcCcyIRG
 hnXDyS7gDi3hTvGqVlxTAUmXFp0GHQxu2HKJX6TDPrsAJh7xiO+eQWyFUaYeUOKRjwslHb
 z8ovWG1Se8mjIb5to3jLCFI2YQsuaXE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-yMAXBnsuN7-pfcmMdRpwBA-1; Fri, 01 Jul 2022 14:53:11 -0400
X-MC-Unique: yMAXBnsuN7-pfcmMdRpwBA-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a05640242c900b004373cd1c4d5so2302191edc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Jul 2022 11:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=h/eGVHzjhye4tUiS8VCyJS+YtTUEyz7/sK1IBUUWWhM=;
 b=oLkhlkKT3abVr/vGiUsud6aOAppBpxRlw8qvyapIc6Y5UlPgegYHjtqVnPWpZb6/oN
 vTmi+Zv3MEjw/Pq4dnu2tnMb8Yia+ZOJpMEowrBAOBIdRVfxtKYQ00C6g2uLXG9n6G8v
 yhcOu1B+p6QEb7AHIzydhQpWARz9sNHo1KK6Nj+KMuPLtwNQ/Fk8b4rPlzOc271fuERd
 Hw9jVXo5zEyB/CP4ZAaQklZDWWlPj+J2jrrSGdmHXc9wJnV+aI2WoqMkn0Z52ADQpcJX
 aNW6A7gTO1cO4e/07xsSWZiwR0SCvwpn50kjB88/Wq6YzlhJDDSO6zwESgjBBTuH+xQc
 A+LQ==
X-Gm-Message-State: AJIora+y2wsxR3tkP1Gn3fpO2kdRXvEjpsvETOkmHdVjrqWPOvYZkI8K
 5k/ZJDeZJc3KUe7+G/LfbgsWNtCm7cV0SNArtxv8CqEDZp7yMXO16fl1bJ9kMSt/mm/AOih1zFj
 Yk1SlvzGarjBaEwx+6yctyrkHJKRe
X-Received: by 2002:a17:907:9488:b0:722:e5c8:c647 with SMTP id
 dm8-20020a170907948800b00722e5c8c647mr15451430ejc.291.1656701590532; 
 Fri, 01 Jul 2022 11:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1twrosMg5ykAMCjALhx0tb7xsAbjXTCVpYQRYG7l64S4JJBJdRhEr/kbxeM0Y3ZOyHI+W5ZJQ==
X-Received: by 2002:a17:907:9488:b0:722:e5c8:c647 with SMTP id
 dm8-20020a170907948800b00722e5c8c647mr15451417ejc.291.1656701590372; 
 Fri, 01 Jul 2022 11:53:10 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a0564020b7900b004359dafe822sm15406658edb.29.2022.07.01.11.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 11:53:10 -0700 (PDT)
From: dakr@redhat.com
To: airlied@linux.ie, daniel@ffwll.ch, christian.koenig@amd.com,
 emma@anholt.net
Subject: [PATCH 01/10] drm/amdgpu: use idr_init_base() to initialize
 mgr->ctx_handles
Date: Fri,  1 Jul 2022 20:52:54 +0200
Message-Id: <20220701185303.284082-2-dakr@redhat.com>
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

Since, for this IDR, no ID < 1 is ever requested, using
idr_init_base(&idr, 1) avoids unnecessary tree walks.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
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

