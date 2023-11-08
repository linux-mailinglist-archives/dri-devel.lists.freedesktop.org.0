Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F0A7E4DCA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD42510E6DB;
	Wed,  8 Nov 2023 00:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D2E10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699402393;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4ctUbNYpz6tzYpOeogS+HZIyW2krgJWmH5IZy1f/TTs=;
 b=UTVAWsKTyd0S0AIS1Cq/2T7F1Cmfyc5iF7g/+LLdp5G9dRAqMIgBoNq7qKY7lNeRmuxwU1
 wLXLkBded5aK2R5G18SwcmJaHLzzeZPPRCEeRrId1bRUO72g6T8UO+dX/EigYy/FE79yEy
 E639w81uHOiUuQCGN4CaW1hHh6e08fY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-dqhjiiwQPBCWe5RDFfWfHA-1; Tue, 07 Nov 2023 19:13:12 -0500
X-MC-Unique: dqhjiiwQPBCWe5RDFfWfHA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-9de267de2a0so273020866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 16:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402391; x=1700007191;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4ctUbNYpz6tzYpOeogS+HZIyW2krgJWmH5IZy1f/TTs=;
 b=SOyao4gvsKFRGY6olqj1RwYO+0nZmE832G+WclLhyYvyFzLhQp+WnfWnuMabV8M/5c
 e6HN+jHUmLBd4llDRMT64mruHHC67yPT4D458h4xvgFU3yxKVyTqTfnRfCKdaXI159oT
 KZzkfDkv/e6TLABEPTrVRMVnNJgzRQypNBiEfJonYbCE3q3fK+pYeP2R8h69bNO4WPNl
 zBctdsvuhkqX5RdUaaxaTaMWco2DvN5KmQXMKdNg8Cwl0UlQv9fz0CN9f//b8EPDckqF
 hTTxWslA8ewHfDmgRUS3mtuyT1ybdNdtXexnUEVPhHgbfgsnhEN1FrpZt8zOAKB/zpLI
 B3DQ==
X-Gm-Message-State: AOJu0YyexU4u3C1beudO5JNNaanEiTNmueQOLkE27oyzCxYam0lzGuTP
 k0kEaYjDzjFOUq2hp+zR9LAxLih7UHbZOrMbW5U0CR0lLrcA7hSWQ6+7FXwh5173L5PhgbhE1p+
 GXHx/hE3nmx4lOpEKSJteBx9pM0iHN712tYnv
X-Received: by 2002:a17:907:72c2:b0:9b2:6d09:847c with SMTP id
 du2-20020a17090772c200b009b26d09847cmr128985ejc.10.1699402391135; 
 Tue, 07 Nov 2023 16:13:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF5mZIJaXlXK5+6Ct9x6+zYmd4wQssrYGMVAP+petiYpgw5Audt1XmkpV1U3GDZmm9qpuS4MA==
X-Received: by 2002:a17:907:72c2:b0:9b2:6d09:847c with SMTP id
 du2-20020a17090772c200b009b26d09847cmr128975ejc.10.1699402390838; 
 Tue, 07 Nov 2023 16:13:10 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a170906048400b00988e953a586sm177311eja.61.2023.11.07.16.13.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 16:13:10 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v9 02/12] drm/gpuvm: don't always WARN in
 drm_gpuvm_check_overflow()
Date: Wed,  8 Nov 2023 01:12:32 +0100
Message-ID: <20231108001259.15123-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231108001259.15123-1-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't always WARN in drm_gpuvm_check_overflow() and separate it into a
drm_gpuvm_check_overflow() and a dedicated
drm_gpuvm_warn_check_overflow() variant.

This avoids printing warnings due to invalid userspace requests.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index d7367a202fee..445767f8fbc4 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -614,12 +614,18 @@ static int __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 static void __drm_gpuva_remove(struct drm_gpuva *va);
 
 static bool
-drm_gpuvm_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+drm_gpuvm_check_overflow(u64 addr, u64 range)
 {
 	u64 end;
 
-	return drm_WARN(gpuvm->drm, check_add_overflow(addr, range, &end),
-			"GPUVA address limited to %zu bytes.\n", sizeof(end));
+	return check_add_overflow(addr, range, &end);
+}
+
+static bool
+drm_gpuvm_warn_check_overflow(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
+{
+	return drm_WARN(gpuvm->drm, drm_gpuvm_check_overflow(addr, range),
+			"GPUVA address limited to %zu bytes.\n", sizeof(addr));
 }
 
 static bool
@@ -647,7 +653,7 @@ static bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
-	return !drm_gpuvm_check_overflow(gpuvm, addr, range) &&
+	return !drm_gpuvm_check_overflow(addr, range) &&
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
@@ -682,7 +688,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 
-	drm_gpuvm_check_overflow(gpuvm, start_offset, range);
+	drm_gpuvm_warn_check_overflow(gpuvm, start_offset, range);
 	gpuvm->mm_start = start_offset;
 	gpuvm->mm_range = range;
 
@@ -691,8 +697,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		gpuvm->kernel_alloc_node.va.addr = reserve_offset;
 		gpuvm->kernel_alloc_node.va.range = reserve_range;
 
-		if (likely(!drm_gpuvm_check_overflow(gpuvm, reserve_offset,
-						     reserve_range)))
+		if (likely(!drm_gpuvm_warn_check_overflow(gpuvm, reserve_offset,
+							  reserve_range)))
 			__drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
 	}
 }
-- 
2.41.0

