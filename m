Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE67DE8E7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 00:31:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10DEC10E7E0;
	Wed,  1 Nov 2023 23:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0810E7E0
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHqLLAc60dwamxaygC2L/egQsbDCJ0kydHBon+KAuxI=;
 b=LE2aXS3yJz/jbOT1G6MqN0lQaKURyAatshqediycRnXT3xI+tUprzPfkFudAairjRSlYsk
 i0kd9qZfLItGghJ6geNRtCAA5YIyv4qEmn5xPYiAH++gJex7oQWmK6D7gvvIWKWg+/Hcdb
 1dGtFDX/2WuRL1T90h2u8xB0vUJEh90=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-zNqZy1JbOeqSwo3tuXJ57w-1; Wed, 01 Nov 2023 19:31:27 -0400
X-MC-Unique: zNqZy1JbOeqSwo3tuXJ57w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-9d223144f23so19840366b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881486; x=1699486286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HHqLLAc60dwamxaygC2L/egQsbDCJ0kydHBon+KAuxI=;
 b=vQPfHMN94ZKMhmofnIP9Ajkp2ZAeCMSs0t/3jQup0KhM1G1/qfLT+dXagEVkSWwSlI
 uqiigwxxx7woFSspRMliFz83n8vDt9oeZgKiKrCIuhyfcwb+9xnNKHfivYgmlju1OtNe
 IwI/5CiEdA7W/XE1O3cgNjJVS/6my7jGFK8/mtdKavUl1B2XdEaZ4W4mZg2JjRp5Q+H5
 6NrbhXZ9WkMCToQWGb6/viAcnW6VsV4lfjpDPxEByH2Ab7Qyt1QBMZiQp0kakVBF+JyE
 jKxrYoTCZbR4/cwd4AZSyr0+8xP9XOZk/G5WTw5fAfX5DDFq0/VXr8z4IGGuB6VY3Xi4
 qVqA==
X-Gm-Message-State: AOJu0Yx5nJxX0rSgmYckoB3JYURydz2vLHzBwudUqVqmlvg2lOYN1SEp
 fSw/K9Nt0yPHUvK6UzZdiJ22E4hAJNggiYNi84VVuYXLv5VZ1EQdiA2ISXdcDPBo/ZbzV1uL0P5
 HgRGCAAzKsrx+XqOCto9EMSrUeBsG
X-Received: by 2002:a17:907:31c3:b0:9bf:122a:7db2 with SMTP id
 xf3-20020a17090731c300b009bf122a7db2mr3474703ejb.66.1698881486562; 
 Wed, 01 Nov 2023 16:31:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/5E8sRENo9jAXHprVwNPsovyn+OIgRlppVqqGsSqi1Rdc/suX6QYRwvYBLU9eNRAS4LTetg==
X-Received: by 2002:a17:907:31c3:b0:9bf:122a:7db2 with SMTP id
 xf3-20020a17090731c300b009bf122a7db2mr3474685ejb.66.1698881486291; 
 Wed, 01 Nov 2023 16:31:26 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a170906718400b00997e99a662bsm463484ejk.20.2023.11.01.16.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:25 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Subject: [PATCH drm-misc-next v8 02/12] drm/gpuvm: don't always WARN in
 drm_gpuvm_check_overflow()
Date: Thu,  2 Nov 2023 00:30:54 +0100
Message-ID: <20231101233113.8059-3-dakr@redhat.com>
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

Don't always WARN in drm_gpuvm_check_overflow() and separate it into a
drm_gpuvm_check_overflow() and a dedicated
drm_gpuvm_warn_check_overflow() variant.

This avoids printing warnings due to invalid userspace requests.

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

