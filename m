Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC913C9252B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 15:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E2310E8E5;
	Fri, 28 Nov 2025 14:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="VWeWGmEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A99610E8E5;
 Fri, 28 Nov 2025 14:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1764340038;
 bh=MCNZ7/JOKVOKMS2Ye0Z5CGLQlCRGTTYsDLTxzMvltaE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VWeWGmEYeGIgOvnLOSv8vEZiGfLixdNRBrF3Bgr0AQUVMMk6cw7rC3fmfJScOHhk0
 dq3yDCG0wySHJ0aZbKRoxq0re1kYfYMGz3whg8KFAuKb5XNE9DLT5nB71E51SK/Cf2
 nU88JdaCMFOf/JFtsbIkvVK/L4VXruBPjCG4JH+y31ngZIHhAqW8x/WXC5RaGIiwIz
 ys2oaPzY/4viwi7a5+jNUkoheY6zfcvJSf+O49BorhP0pEa/0c+Mp/VcXdioCRFuRR
 zAelT7RVIaYa9P/7f4yeLE3FDFRXQD8ExFh2rZc7tqfsDgRgBQiJBEP2wg5bE0Nm1G
 S3cnWYoaDhB2g==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A7BC717E0EDB;
 Fri, 28 Nov 2025 15:27:16 +0100 (CET)
Date: Fri, 28 Nov 2025 15:27:13 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Matthew Brost <matthew.brost@intel.com>,
 "Thomas =?UTF-8?B?SGVsbHN0csO2bQ==?=" <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Miguel Ojeda
 <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, "=?UTF-8?B?QmrDtnJu?= Roy Baron"
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Andreas
 Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Frank
 Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, Rob
 Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang
 <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, Marijn
 Suijten <marijn.suijten@somainline.org>, Lyude Paul <lyude@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 "Christian =?UTF-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH 3/4] drm/gpuvm: use const for drm_gpuva_op_* ptrs
Message-ID: <20251128152713.15bf1c37@fedora>
In-Reply-To: <20251128-gpuvm-rust-v1-3-ebf66bf234e0@google.com>
References: <20251128-gpuvm-rust-v1-0-ebf66bf234e0@google.com>
 <20251128-gpuvm-rust-v1-3-ebf66bf234e0@google.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 28 Nov 2025 14:14:17 +0000
Alice Ryhl <aliceryhl@google.com> wrote:

> These methods just read the values stored in the op pointers without
> modifying them, so it is appropriate to use const ptrs here.
> 
> This allows us to avoid const -> mut pointer casts in Rust.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 6 +++---
>  include/drm/drm_gpuvm.h     | 8 ++++----
>  2 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 9cd06c7600dc32ceee0f0beb5e3daf31698a66b3..e06b58aabb8ea6ebd92c625583ae2852c9d2caf1 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2283,7 +2283,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_interval_empty);
>  void
>  drm_gpuva_map(struct drm_gpuvm *gpuvm,
>  	      struct drm_gpuva *va,
> -	      struct drm_gpuva_op_map *op)
> +	      const struct drm_gpuva_op_map *op)
>  {
>  	drm_gpuva_init_from_op(va, op);
>  	drm_gpuva_insert(gpuvm, va);
> @@ -2303,7 +2303,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_map);
>  void
>  drm_gpuva_remap(struct drm_gpuva *prev,
>  		struct drm_gpuva *next,
> -		struct drm_gpuva_op_remap *op)
> +		const struct drm_gpuva_op_remap *op)
>  {
>  	struct drm_gpuva *va = op->unmap->va;
>  	struct drm_gpuvm *gpuvm = va->vm;
> @@ -2330,7 +2330,7 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remap);
>   * Removes the &drm_gpuva associated with the &drm_gpuva_op_unmap.
>   */
>  void
> -drm_gpuva_unmap(struct drm_gpuva_op_unmap *op)
> +drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op)
>  {
>  	drm_gpuva_remove(op->va);
>  }
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96..655bd9104ffb24170fca14dfa034ee79f5400930 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -1121,7 +1121,7 @@ void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
>  			struct drm_gpuva_ops *ops);
>  
>  static inline void drm_gpuva_init_from_op(struct drm_gpuva *va,
> -					  struct drm_gpuva_op_map *op)
> +					  const struct drm_gpuva_op_map *op)
>  {
>  	va->va.addr = op->va.addr;
>  	va->va.range = op->va.range;
> @@ -1265,13 +1265,13 @@ int drm_gpuvm_sm_unmap_exec_lock(struct drm_gpuvm *gpuvm, struct drm_exec *exec,
>  
>  void drm_gpuva_map(struct drm_gpuvm *gpuvm,
>  		   struct drm_gpuva *va,
> -		   struct drm_gpuva_op_map *op);
> +		   const struct drm_gpuva_op_map *op);
>  
>  void drm_gpuva_remap(struct drm_gpuva *prev,
>  		     struct drm_gpuva *next,
> -		     struct drm_gpuva_op_remap *op);
> +		     const struct drm_gpuva_op_remap *op);
>  
> -void drm_gpuva_unmap(struct drm_gpuva_op_unmap *op);
> +void drm_gpuva_unmap(const struct drm_gpuva_op_unmap *op);
>  
>  /**
>   * drm_gpuva_op_remap_to_unmap_range() - Helper to get the start and range of
> 

