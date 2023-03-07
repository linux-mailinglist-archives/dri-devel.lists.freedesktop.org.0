Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947D6AE24C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 15:27:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233C10E4AE;
	Tue,  7 Mar 2023 14:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.marcansoft.com (marcansoft.com [212.63.210.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC2210E4AE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Mar 2023 14:27:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: linasend@asahilina.net)
 by mail.marcansoft.com (Postfix) with ESMTPSA id C587C424CD;
 Tue,  7 Mar 2023 14:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=asahilina.net;
 s=default; t=1678199237;
 bh=BAqN8OMTaXAhucXUriExOzQpMpPUhvwTh5OsDzrSkpo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc;
 b=sdJUn/+TKQ7o8T8HGDCq3r2jd7AAtYK04d56jZmlkVNBzcSniG/yHCP6fDIbG9ehZ
 kSFIfPufTMbHtE461pYVmVq6FGQDfJAAWzZ+90gdyChquINRMvLM7Mg7xqF3pK2ikK
 qiAnhXlPguV04IZom9jBVBQYf/B2wNZqnpf4IeV4QUImr7ycS2rQu7K+yITkcDLmhI
 VqIH6ZmHfnCKkRScdcKV56rpQVzl1pvVoqyVKpWimedHzo3r7Xioq4dddbVh9q9+4x
 X/8VYqv9CrMVzNN3zky2OB830unrsw9d1jxOn5VWOFJIiSIKvp0HQl9KEC13yFGfV1
 vfcseqiRi4TEw==
From: Asahi Lina <lina@asahilina.net>
Date: Tue, 07 Mar 2023 23:25:30 +0900
Subject: [PATCH RFC 05/18] drm/gem-shmem: Export VM ops functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-rust-drm-v1-5-917ff5bc80a8@asahilina.net>
References: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
In-Reply-To: <20230307-rust-drm-v1-0-917ff5bc80a8@asahilina.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Wedson Almeida Filho <wedsonaf@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Luben Tuikov <luben.tuikov@amd.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678199191; l=2745;
 i=lina@asahilina.net; s=20230221; h=from:subject:message-id;
 bh=BAqN8OMTaXAhucXUriExOzQpMpPUhvwTh5OsDzrSkpo=;
 b=g9pqskVqJS3ljWoohfpCNH4NDQdA/LBauCNqtM+x0fz44GOfEY/N8GW4sqZzjgPhnydgE4j/x
 Si9bKq4ETQwDZpvyu6TbEWKU1rzJi6sGVUQQEwWgtVhiU5HoHMICe3I
X-Developer-Key: i=lina@asahilina.net; a=ed25519;
 pk=Qn8jZuOtR1m5GaiDfTrAoQ4NE1XoYVZ/wmt5YtXWFC4=
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
Cc: linaro-mm-sig@lists.linaro.org, rust-for-linux@vger.kernel.org,
 Karol Herbst <kherbst@redhat.com>, asahi@lists.linux.dev,
 Asahi Lina <lina@asahilina.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mary <mary@mary.zone>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, linux-sgx@vger.kernel.org,
 Ella Stanforth <ella@iglunix.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There doesn't seem to be a way for the Rust bindings to get a
compile-time constant reference to drm_gem_shmem_vm_ops, so we need to
duplicate that structure in Rust... this isn't nice...

Signed-off-by: Asahi Lina <lina@asahilina.net>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
 include/drm/drm_gem_shmem_helper.h     | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 75185a960fc4..10c09819410e 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -534,7 +534,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
+vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -563,8 +563,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_fault);
 
-static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
+void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
@@ -585,8 +586,9 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 
 	drm_gem_vm_open(vma);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_open);
 
-static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
+void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
@@ -594,6 +596,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 	drm_gem_shmem_put_pages(shmem);
 	drm_gem_vm_close(vma);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_close);
 
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 	.fault = drm_gem_shmem_fault,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index a2201b2488c5..b9f349b3ed76 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -138,6 +138,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
 
 extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
+vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf);
+void drm_gem_shmem_vm_open(struct vm_area_struct *vma);
+void drm_gem_shmem_vm_close(struct vm_area_struct *vma);
 
 /*
  * GEM object functions

-- 
2.35.1

