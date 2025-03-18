Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9CDA67CFB
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 20:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1642D10E4BB;
	Tue, 18 Mar 2025 19:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="j0NKxYto";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B6510E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 19:23:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742325786; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=fTdHk+BytT5+tAfwi7NcvHNxKZFG7p+KIUnxtgXU3T/DlcR2ZeGWPktNW5VlRhEI4Hm3lOUQ4DcyP81f+uWv0UDjsimPdAr91zt1W12fq0N3P0BzJRjMwmw7+RRcgZ3NIXY7HUMaaEwM7A3W1Ki+DG+H7TnDKaP9Ul+gUl6a20Y=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742325786;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=MY7Cl7jgPAQV9jp81m1D78HRv5kJV8iHLNLGSHsiP00=; 
 b=MCDYFck2oN7OEXdxsFORYj7U87GQoCGW8rjafARpC9bteeZJ8vw2hWbMqVl3TE1TcMWJ2LZVtFxu10pTw5SYLO+tXf8XUXMScuuqeCDubVDXOG2Vi7MlxRYPVlZmist+sSQq12kN1+qoyWEhq22qXzfpkhIJQwbh/Qlgciq5774=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742325786; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
 bh=MY7Cl7jgPAQV9jp81m1D78HRv5kJV8iHLNLGSHsiP00=;
 b=j0NKxYtoLRK6J9dsv6r263wIo/zx8c8wsaCLzwTIzs5F7SJSLBtcm8NAxekvIX6l
 8VeMNTGEzqU3ohwb9zUXq6Bt28ME1A94gtWyYk9mas2HBIzrK7B3ClU4sdTaJJN3lBH
 JHAQN87PPmKvEptO8IbMmyDPaeskki/cBJN7mK98=
Received: by mx.zohomail.com with SMTPS id 1742325785766934.6166976605112;
 Tue, 18 Mar 2025 12:23:05 -0700 (PDT)
From: Daniel Almeida <daniel.almeida@collabora.com>
Date: Tue, 18 Mar 2025 16:22:36 -0300
Subject: [PATCH 2/7] drm/gem-shmem: Export VM ops functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-drm-gem-shmem-v1-2-64b96511a84f@collabora.com>
References: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
In-Reply-To: <20250318-drm-gem-shmem-v1-0-64b96511a84f@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
 Asahi Lina <lina@asahilina.net>, 
 Daniel Almeida <daniel.almeida@collabora.com>
X-Mailer: b4 0.14.2
X-ZohoMailClient: External
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Asahi Lina <lina@asahilina.net>

There doesn't seem to be a way for the Rust bindings to get a
compile-time constant reference to drm_gem_shmem_vm_ops, so we need to
duplicate that structure in Rust... this isn't nice...

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 9 ++++++---
 include/drm/drm_gem_shmem_helper.h     | 3 +++
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index ec89e9499f5f02a2a35713669bf649dd2abb9938..be310db5863871604f3502ad1f419937d4c20a84 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -535,7 +535,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_dumb_create);
 
-static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
+vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -564,8 +564,9 @@ static vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf)
 
 	return ret;
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_fault);
 
-static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
+void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
@@ -586,8 +587,9 @@ static void drm_gem_shmem_vm_open(struct vm_area_struct *vma)
 
 	drm_gem_vm_open(vma);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_open);
 
-static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
+void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = vma->vm_private_data;
 	struct drm_gem_shmem_object *shmem = to_drm_gem_shmem_obj(obj);
@@ -598,6 +600,7 @@ static void drm_gem_shmem_vm_close(struct vm_area_struct *vma)
 
 	drm_gem_vm_close(vma);
 }
+EXPORT_SYMBOL_GPL(drm_gem_shmem_vm_close);
 
 const struct vm_operations_struct drm_gem_shmem_vm_ops = {
 	.fault = drm_gem_shmem_fault,
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index d22e3fb53631ab655748d7f6c628ffdb402f6324..b70d3cc35bd194e7cd718bee220408b5dda568bf 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -132,6 +132,9 @@ void drm_gem_shmem_print_info(const struct drm_gem_shmem_object *shmem,
 			      struct drm_printer *p, unsigned int indent);
 
 extern const struct vm_operations_struct drm_gem_shmem_vm_ops;
+vm_fault_t drm_gem_shmem_fault(struct vm_fault *vmf);
+void drm_gem_shmem_vm_open(struct vm_area_struct *vma);
+void drm_gem_shmem_vm_close(struct vm_area_struct *vma);
 
 /*
  * GEM object functions

-- 
2.48.1

