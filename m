Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B35D3B2E5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:59:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC510E4CF;
	Mon, 19 Jan 2026 16:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Q62jz8uV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7A410E4D2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:59:53 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-50146483bf9so59740671cf.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:59:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768841992; x=1769446792; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TPsA7s1a/5IQbuetD0KLnhoW9jbCMPzN3lJpfuVRncw=;
 b=Q62jz8uV0DbYXz1eUwSSsgNGb8yJitOTmzwFBHjedovTKxO9kptsWTHf7cOYlL30lA
 ZkNVS/v3U0sEym6GEKnApPKdXSsDXUfIY/puyE2doNQQO5LZGKzL/mjj28BQYQlySSy1
 xBz8RjzqWLW3dRd6nAbi4aTIZvKJkhbhVFxUUOBBDDXlm4MsBdVkEd4Sr4UBZtc0T4T2
 YUdh/dOS9L2wcduPAp3CS/SWIoqaTzaeK/IqxcTLrctYqi/fwkOGU+N4b6ImnBCYjztK
 h71QJ2PcMee3vqoexpfK2k09a5W4l74AVYTziQdiKTKNCDdLL8F8qK8Ef+QeANaJS32x
 RgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841992; x=1769446792;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPsA7s1a/5IQbuetD0KLnhoW9jbCMPzN3lJpfuVRncw=;
 b=lfsxEOhUxiFt6tMG/WIeUlq16iFJIENHZa3op3DEmn2qz90XK84XlBMJj/IUfz8USO
 4nC4+fnNlynekPIh2PkaN8t7uXR3hQl5JQrAiQ7arv/TtG3cx3ZnUjs4qtxxUGx94gBG
 fakyF+92wiOamDwMpFbNS73oZBYXtdu3k9XP61Z3VghvG4Xs0WHu4u9z9/C087exAtGk
 FEngPnCeUSRT44DTCU/TB2sa5p924qzI1jtXT8cHBWxrSZ6NCFC8U0R/IVTxyNmi02u0
 OQ5SD0YS9hAaFE8eLBsm2omy9/IONpNWYZ6s5Pk3JRLK4MkMa4uDYu5myIjgxULfBkwU
 rmCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUu/n/j+x44ftQPi8/8bhXmmATZCQQiJdWDRAiGRA4PUJq1zPugVkNF9GxwSvDWC8bNm3vXrYyddM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYAJUAbHMawBT+V6iKkd6VqD+qk5JaIjyqUlPxyUjEA+rBhbfx
 Li6MuVWqFIPm2vT6l3En5rfC04qKD0kYRYb37JpOB2PgxaPC6c3M6aK+tPFwKmj3sCI=
X-Gm-Gg: AY/fxX7B6nGGDAV3YBBXlWLZN4RhO0W5pxZRnpZpZMd1AcAuHmmtoIKQDICSRJihMrs
 mtycG5qdEuwHJq9xNzx5jAUB8iAIjhV/4RbIeUY+jQuF56mN6B8tO2iui2TeXqu0QHePI7x0kdS
 jAmr+uqPpLFfp8oMC0LushxoeXMx8h+Oy0ikHJ/pVQIoqv8j0Wn0TC/80EFtY4tegluiA0rKoBe
 ob973R6h9sEn20mQKrhASHkZgz+66gnxuDtgrSJgCW43NRz7gZtVg5E6+sFzNMVfDY+1VFjvYof
 LVQ0hi1TR193Yzc60maoLK8MlZqXXYOQYFjFv6eXwn2vign/k0uFahdwc0NzHabgwo5Y8Z50BMI
 OY6kNVKk0fdV5sYyHMkWRz8SU6zLNEQ0G8sOZcpgKxV1xMjmo1Y8LIaIbLz0Nfb23Gd8jNLth93
 BD5lR2MGJ8h56/C+OWsbOvzS8ptgzfb3ZMO7YWkh/4aGpdNrNqOYC5CnV7BQ/vf/9ZCaA=
X-Received: by 2002:ac8:7f56:0:b0:501:50cd:cd3a with SMTP id
 d75a77b69052e-502a16b363amr184663241cf.43.1768841992288; 
 Mon, 19 Jan 2026 08:59:52 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e5e4d79sm93947786d6.2.2026.01.19.08.59.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:59:51 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhsbX-00000005IQz-1QSu;
 Mon, 19 Jan 2026 12:59:51 -0400
Date: Mon, 19 Jan 2026 12:59:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] iommufd: Require DMABUF revoke semantics
Message-ID: <20260119165951.GI961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-dmabuf-revoke-v2-3-a03bb27c0875@nvidia.com>
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

On Sun, Jan 18, 2026 at 02:08:47PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> IOMMUFD does not support page fault handling, and after a call to
> .invalidate_mappings() all mappings become invalid. Ensure that
> the IOMMUFD DMABUF importer is bound to a revoke‑aware DMABUF exporter
> (for example, VFIO).
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/iommu/iommufd/pages.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
> index 76f900fa1687..a5eb2bc4ef48 100644
> --- a/drivers/iommu/iommufd/pages.c
> +++ b/drivers/iommu/iommufd/pages.c
> @@ -1501,16 +1501,22 @@ static int iopt_map_dmabuf(struct iommufd_ctx *ictx, struct iopt_pages *pages,
>  		mutex_unlock(&pages->mutex);
>  	}
>  
> -	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> +	rc = dma_buf_pin(attach);
>  	if (rc)
>  		goto err_detach;
>  
> +	rc = sym_vfio_pci_dma_buf_iommufd_map(attach, &pages->dmabuf.phys);
> +	if (rc)
> +		goto err_unpin;
> +
>  	dma_resv_unlock(dmabuf->resv);
>  
>  	/* On success iopt_release_pages() will detach and put the dmabuf. */
>  	pages->dmabuf.attach = attach;
>  	return 0;

Don't we need an explicit unpin after unmapping?

Jason
