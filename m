Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E20247E7BC6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Nov 2023 12:20:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EA0A10E98F;
	Fri, 10 Nov 2023 11:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9A110E98F;
 Fri, 10 Nov 2023 11:20:21 +0000 (UTC)
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 586F866073F2;
 Fri, 10 Nov 2023 11:20:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699615220;
 bh=Z0zorD13MGeP3kyTlELN9r96mOGvi5sP1bTmMJl3V4o=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ayk/AVHym2BJgJbGvk/B2iVIKqZoHSp62m9kRA+hn5j+rwB2IV55McLc9c0VWlAWo
 dD5jmFoXQaIrzNvBN35Oe3PsYBJcIw8R3ZzP4butquqKM+6ckE+58/ScivbRIXP7r7
 wXmNHKYwXuGnamuWXXHLvUDLFPHIiD3JBLW32An/JuDQovM1XlNM8jcUrkR/nXnqkN
 plfCe7TpYvyrWDOEa2dtUzQLvaLrq1dZ8mJLOHVpxwT4KCjaCw+9aQTyYe+J2UHw8W
 KZxAWMUpYB8NwHp5LzFuvL1x+DbqN0bNuzA+fIbxmRi8NmdAasUACTsGXAD3wnUAXu
 0UJYD6bWU7aDA==
Date: Fri, 10 Nov 2023 12:20:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v9 03/12] drm/gpuvm: export
 drm_gpuvm_range_valid()
Message-ID: <20231110122015.69636459@collabora.com>
In-Reply-To: <20231108001259.15123-4-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
 <20231108001259.15123-4-dakr@redhat.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 faith@gfxstrand.net, donald.robson@imgtec.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed,  8 Nov 2023 01:12:33 +0100
Danilo Krummrich <dakr@redhat.com> wrote:

> Drivers may use this function to validate userspace requests in advance,
> hence export it.
>=20
> Reviewed-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/drm_gpuvm.c | 14 +++++++++++++-
>  include/drm/drm_gpuvm.h     |  1 +
>  2 files changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 445767f8fbc4..2669f9bbc377 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -649,7 +649,18 @@ drm_gpuvm_in_kernel_node(struct drm_gpuvm *gpuvm, u6=
4 addr, u64 range)
>  	return krange && addr < kend && kstart < end;
>  }
> =20
> -static bool
> +/**
> + * drm_gpuvm_range_valid() - checks whether the given range is valid for=
 the
> + * given &drm_gpuvm
> + * @gpuvm: the GPUVM to check the range for
> + * @addr: the base address
> + * @range: the range starting from the base address
> + *
> + * Checks whether the range is within the GPUVM's managed boundaries.
> + *
> + * Returns: true for a valid range, false otherwise
> + */
> +bool
>  drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>  		      u64 addr, u64 range)
>  {
> @@ -657,6 +668,7 @@ drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm,
>  	       drm_gpuvm_in_mm_range(gpuvm, addr, range) &&
>  	       !drm_gpuvm_in_kernel_node(gpuvm, addr, range);
>  }
> +EXPORT_SYMBOL_GPL(drm_gpuvm_range_valid);
> =20
>  /**
>   * drm_gpuvm_init() - initialize a &drm_gpuvm
> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> index 687fd5893624..13eac6f70061 100644
> --- a/include/drm/drm_gpuvm.h
> +++ b/include/drm/drm_gpuvm.h
> @@ -253,6 +253,7 @@ void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const ch=
ar *name,
>  		    const struct drm_gpuvm_ops *ops);
>  void drm_gpuvm_destroy(struct drm_gpuvm *gpuvm);
> =20
> +bool drm_gpuvm_range_valid(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
>  bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 ran=
ge);
> =20
>  static inline struct drm_gpuva *

