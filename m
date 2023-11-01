Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E1A7DE8E9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:31:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB3C10E7E2;
	Wed,  1 Nov 2023 23:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4052B10E7E1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881492;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B/VNYdgSll2ACKqst9EYQmPz34iqqPWKPy+dBFz8o6o=;
 b=YQRhEbsn9DX1gpBm9FGF/Fc1x6MBmYIqygdYVqIDtcbzYYYCptOSWcsN4vyqhf7G18JuyC
 qlLeIJmMm8gj58mE9B/b4Ca601GXAI9GTG2XzCiwFaSHh4caZn1S6TLQrqelACqlxNoKea
 RwFilGYNJEn/bWXshj7HecAZ76q0Jjk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-161-3XlnWvy6Nl-X_NnqZbEMfg-1; Wed, 01 Nov 2023 19:31:31 -0400
X-MC-Unique: 3XlnWvy6Nl-X_NnqZbEMfg-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-54366567af4so358107a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881490; x=1699486290;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/VNYdgSll2ACKqst9EYQmPz34iqqPWKPy+dBFz8o6o=;
 b=GjZh8P0vf17Xvu/A0VO4J3IwRNF97OJ5Ta7FgzhdR5PHanwizYpiADwES1/4pRnp6w
 z/TMUpZLcbwzx6kghysU64y/zSulUwIFMfM2HPIGJoSTqSqB2hQev8Sob/dCnlTaPoji
 NxoimDwNOkZCoEJ3E4A65XPe9fNcw0luwr5tkjyy16esSuah5n+napWBox3uBwofrHHo
 G+2kwGEr8Q7j+XtnIddBNePfS5ivxQH1qoMn7gB8KMvqqonRVYAbVuCOt1jWIlfK3U8t
 dnwVpLnulNT6jTIV4q7atUr9V/V9bsnq28deHTcrjdd90lHkXYL4kbXazZ97MrmvtNNt
 KA4g==
X-Gm-Message-State: AOJu0YynrVGjdOzB1xVvH9Q2OmOV7JIA1vPwZ6zXB4lE3s5vCl564Bg5
 UXw+mKa2JOLiJ0iOuKC6E55fbd22MBBHRs/Ny/pfBEyLNHd4M73BSowTdJyJwTplF44J5bTEVb9
 lIyFxCN6dLLfgx9rcazAnaPAJ2tRn
X-Received: by 2002:aa7:d6c4:0:b0:543:42ac:c9f3 with SMTP id
 x4-20020aa7d6c4000000b0054342acc9f3mr3612982edr.19.1698881490024; 
 Wed, 01 Nov 2023 16:31:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRYXLwVkzVGPU7LguN6QpCv28Yb/7P5U0T7qrfr5WzCGdt3zscx7X5wozPytxOnq0whY0MOA==
X-Received: by 2002:aa7:d6c4:0:b0:543:42ac:c9f3 with SMTP id
 x4-20020aa7d6c4000000b0054342acc9f3mr3612974edr.19.1698881489858; 
 Wed, 01 Nov 2023 16:31:29 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a50d642000000b0053635409213sm1641016edj.34.2023.11.01.16.31.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:29 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 03/12] drm/gpuvm: export
 drm_gpuvm_range_valid()
Date: Thu,  2 Nov 2023 00:30:55 +0100
Message-ID: <20231101233113.8059-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
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
Cc: nouveau@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers may use this function to validate userspace requests in advance,
hence export it.

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

