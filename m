Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4BC7E4DCB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 01:13:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A85C10E6D7;
	Wed,  8 Nov 2023 00:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 269CB10E6D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 00:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699402397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8SDnTCCAUagBqwFi699zbRWD/Ita66vYyPOS4r45G4=;
 b=LRspZPh1oxjDfNPES0hD1UQ2+ZNdkRcC+xu7YdS7eB1JgDDnO4wCS72c+4Re8o+ODOLDhe
 NmFwrR49+X9qsjvURyhtpNRwA4Ypf/bQmvYw0InmuH+QK7HhWDabBPEv2itrxhGxob84BG
 1jTKjkjqQ8MGcQ8RRyESxh4pqr9tVQg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-clAV5G4EOom4VVDlLFKUhA-1; Tue, 07 Nov 2023 19:13:15 -0500
X-MC-Unique: clAV5G4EOom4VVDlLFKUhA-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9c15543088aso26038166b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 16:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402394; x=1700007194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o8SDnTCCAUagBqwFi699zbRWD/Ita66vYyPOS4r45G4=;
 b=VfqDTJcm1Makje0YQEpZmkIPYwlBL5NCAcX4Nv97Wsp014MrJ2v7bZYUxrGSfTkcnA
 UUWEo8HiAE8NeT+LqZwKyxGdhH5vIXkjVLCRo5VxG8i8FZtKXaLJTBZpTVqCAU293L7g
 BuZawD1QHYpiJsS+wlJAVtygxt5pZOnfwVyo1WrdbNgnGHCzAkEBAOI7sosWGW0Y5ORX
 DIYUva8KfRLoIrPY5LyhCaG3H6w0Hesa4A61dU5t1EYX1m+zTYpYLG6kgV+tzQuVULSH
 dDeBt9JHqOINniEE+ZcOTBzAgBCWdmXDRb3hx3s+0nK/nImnodnqufv1NMMRJweoph+T
 bIVQ==
X-Gm-Message-State: AOJu0YyR84RhHS53JI+k/mujo7B5XfvqCtXn3nywPoqTSFHaVS9iAV4o
 sN/PCpgQPNNcPCKCk70ZFIiFE61LRGxjdA/A+7Y6RogWhWfQs3m09onIzEMgv8sVmCNpZHxS1OR
 +QuwEx0+OozZHdQXo9L6Tn83oI4Vp
X-Received: by 2002:a17:906:2258:b0:9a5:c38d:6b75 with SMTP id
 24-20020a170906225800b009a5c38d6b75mr4113009ejr.15.1699402394479; 
 Tue, 07 Nov 2023 16:13:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGRmvK8nA/uEcCB9cIfOPEZPKuXcT5Nc6lJ5Zp5gtTkKr1sxSbHkWwmpuv2Jl1wMWCa5deuAg==
X-Received: by 2002:a17:906:2258:b0:9a5:c38d:6b75 with SMTP id
 24-20020a170906225800b009a5c38d6b75mr4112996ejr.15.1699402394324; 
 Tue, 07 Nov 2023 16:13:14 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ba26-20020a0564021ada00b00533dad8a9c5sm5885593edb.38.2023.11.07.16.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 16:13:14 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v9 03/12] drm/gpuvm: export
 drm_gpuvm_range_valid()
Date: Wed,  8 Nov 2023 01:12:33 +0100
Message-ID: <20231108001259.15123-4-dakr@redhat.com>
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

Drivers may use this function to validate userspace requests in advance,
hence export it.

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
 include/drm/drm_gpuvm.h     |  1 +
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 445767f8fbc4..2669f9bbc377 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u64 addr, u64 range)
 	return krange && addr < kend && kstart < end;
 }
 
-static bool
+/**
+ * drm_gpuvm_range_valid() - checks whether the given range is valid for the
+ * given &drm_gpuvm
+ * @gpuvm: the GPUVM to check the range for
+ * @addr: the base address
+ * @range: the range starting from the base address
+ *
+ * Checks whether the range is within the GPUVM's managed boundaries.
+ *
+ * Returns: true for a valid range, false otherwise
+ */
+bool
 drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 		      u64 addr, u64 range)
 {
@@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
 	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
 	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
 }
+EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
 
 /**
  * drm_gpuvm_init() - initialize a &drm_gpuvm
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 687fd5893624..13eac6f70061 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 		    const struct drm_gpuvm_ops *ops);
 void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
 
+bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 
 static inline struct drm_gpuva *
-- 
2.41.0

