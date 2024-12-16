Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 454299F323E
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:07:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEDFD10E69C;
	Mon, 16 Dec 2024 14:07:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bfnpS8kf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF5710E69A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 14:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734358032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Vx9u29TJnDx+NQoG8CYOpQFQkYPuT5i21NbIJ3rQxpI=;
 b=bfnpS8kfi5ykgZAlfo5rPgxRphMY/dMO7o3tPF0+szbtViFeNsRmSa9badb47uzHJ4Vgiw
 gVd9BeQeJb7Mhzfj0YpKDifbVXr/HSMQDsX5UpXvzTD4HTo9mL3PxnVH+XUXg8f2WjNug2
 4fWuS/66cEJTNV4R1a/PSBPF17uTUVo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-396-OQYJE26UNmG_tU0gzLXG6w-1; Mon, 16 Dec 2024 09:07:11 -0500
X-MC-Unique: OQYJE26UNmG_tU0gzLXG6w-1
X-Mimecast-MFC-AGG-ID: OQYJE26UNmG_tU0gzLXG6w
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3862a49fbdaso1180469f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 06:07:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734358030; x=1734962830;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vx9u29TJnDx+NQoG8CYOpQFQkYPuT5i21NbIJ3rQxpI=;
 b=BSxsYPO2gyTajCCNHkpfZ70wVaMrlRmI+ejirpo37Waimkzq6mTuPxAEo/suyrD6O2
 d42w0ZnwXEtr5tiOys+r7DjOfeckB2KmzrYQBi7SD5b10rz3Lkda2hXVb+toOfQvcWKC
 wKN8Chdq1fUkIqmFq45d7CDutghoVMi4EwB2rtF5p1bvbz7t6jAxjKI27yi/xrTW3xin
 zKSYJNuxqi8nvhlmbB4qgSn8tfyJkrNqUzxXKvvsdn8x2AClPE/DLhpaeyBEXNx5Sij/
 Zl0I29LLVQd+vwvsZDvWfAjZajNdla0xYpbgK22Isoh07HyXaQBIe6h32JJXyIbj/4Dk
 vp9Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsmvMqoqfwqj8ubdnwWhOVB19e1RJNqK8iSpp99EwbhJmoEIXUg7i89eiL5pLUfBu/eo4mFE4Debs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaPnfmvmmPNaYWXQzfgdMQV0VwlIeFs3ZPZJb9aE4keiLXXfY4
 Lsv69UnuB0YQJr4tOEURvt2TZL1t4wcswRXVGLlOST1VSaqFBnZbp3XmE7+CJ/T1XD+ShnCOilg
 6LlLZJbdqlsbxa2Wk+I/cbanLDnFGoBDfv/TDNig+N/kRq7Cy0CnRc+I5yCgwZTN4aw==
X-Gm-Gg: ASbGncu68BX01MUv119YcGQqjAXSw4nCdSHYsC7kIZJcfjtnKmyEwc1RNFAvKxSV0ib
 C7AZb65E7kJrWsWzyLDEY0MfmcGTpH/D1JF/4duMPd6WR03YK88licfg3g2+KC0HCAAJ2fYOKLl
 5tjk4DevSQoFbfy9z1eAavz1q4Lc1mVlOpbpz49ivMyxb87CHzbjZTqMS5K2QgrL6tMtwuFhu69
 /FrLVr0/ENixLmimXutsaV5NWq+LJ+/ac+Gd2LlHwI5/+EhvrUZ
X-Received: by 2002:a05:6000:400b:b0:385:f398:3e2 with SMTP id
 ffacd0b85a97d-3888e0b8ac2mr10303695f8f.37.1734358029444; 
 Mon, 16 Dec 2024 06:07:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyZ0+O4kIxKWHQmAwP9mPVHk0LghHzqDQ6QyhAYSUm6qYdEdlC5E3x4M+gkrrJ6yoDU0YReQ==
X-Received: by 2002:a05:6000:400b:b0:385:f398:3e2 with SMTP id
 ffacd0b85a97d-3888e0b8ac2mr10303638f8f.37.1734358028978; 
 Mon, 16 Dec 2024 06:07:08 -0800 (PST)
Received: from cassiopeiae ([2a00:79c0:644:6900:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80613a9sm8199671f8f.101.2024.12.16.06.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 06:07:08 -0800 (PST)
Date: Mon, 16 Dec 2024 15:07:06 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Zhanxin Qi <zhanxin@nfschina.com>
Cc: kherbst@redhat.com, lyude@redhat.com, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Duanjun Li <duanjun@nfschina.com>
Subject: Re: [PATCH v1 v1] drm/nouveau: Fix memory leak in
 nvbios_iccsense_parse
Message-ID: <Z2A0CuGRJD-asF3y@cassiopeiae>
References: <Z1_2sugsla44LgIz@cassiopeiae>
 <20241216130303.246223-1-zhanxin@nfschina.com>
MIME-Version: 1.0
In-Reply-To: <20241216130303.246223-1-zhanxin@nfschina.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cmFHt3B0xXVEQMo_4sqXmD-puNZzctYFNPjnIFuItkI_1734358030
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

The version after the inital one should be "v2". You can use

git format-patch -v{VERSION_NUMBER} for this.

On Mon, Dec 16, 2024 at 09:03:03PM +0800, Zhanxin Qi wrote:
> The nvbios_iccsense_parse function allocates memory for sensor data
> but fails to free it when the function exits, leading to a memory
> leak. Add proper cleanup to free the allocated memory.
> 
> Fixes: 39b7e6e547ff ("drm/nouveau/nvbios/iccsense: add parsing of the SENSE table")

This should be

Fixes: b71c0892631a ("drm/nouveau/iccsense: implement for ina209, ina219 and ina3221")

instead.

The function introduced by 39b7e6e547ff ("drm/nouveau/nvbios/iccsense: add
parsing of the SENSE table") is correct, but the other commit did not clean up
after using it.

> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhanxin Qi <zhanxin@nfschina.com>
> Signed-off-by: Duanjun Li <duanjun@nfschina.com>

Why is there also Duanjun's SOB? If there is a co-author, this should be
indicated with a "Co-developed-by" tag. Adding the SOB only is not sufficient,
please see [1].

> Signed-off-by: Danilo Krummrich <dakr@redhat.com>

Please don't add my SOB to your commits -- I'll add it when I apply the patch.
Please also see [1].

[1] https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> ---
>  .../include/nvkm/subdev/bios/iccsense.h       |  2 ++
>  .../drm/nouveau/nvkm/subdev/bios/iccsense.c   | 20 +++++++++++++++++++
>  .../drm/nouveau/nvkm/subdev/iccsense/base.c   |  3 +++
>  3 files changed, 25 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
> index 4c108fd2c805..8bfc28c3f7a7 100644
> --- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
> +++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/bios/iccsense.h
> @@ -20,4 +20,6 @@ struct nvbios_iccsense {
>  };
>  
>  int nvbios_iccsense_parse(struct nvkm_bios *, struct nvbios_iccsense *);
> +
> +void nvbios_iccsense_cleanup(struct nvbios_iccsense *iccsense);
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
> index dea444d48f94..38fcc91ffea6 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/iccsense.c
> @@ -56,6 +56,19 @@ nvbios_iccsense_table(struct nvkm_bios *bios, u8 *ver, u8 *hdr, u8 *cnt,
>  	return 0;
>  }
>  
> +/**
> + * nvbios_iccsense_parse - Parse ICCSENSE table from VBIOS
> + * @bios: VBIOS base pointer
> + * @iccsense: ICCSENSE table structure to fill
> + *
> + * Parses the ICCSENSE table from VBIOS and fills the provided structure.
> + * The caller must invoke nvbios_iccsense_cleanup() after successful parsing
> + * to free the allocated rail resources.
> + *
> + * Returns:
> + *   0        - Success
> + *   -ENODEV  - Table not found
> + */

Looks good, thanks for adding this!

>  int
>  nvbios_iccsense_parse(struct nvkm_bios *bios, struct nvbios_iccsense *iccsense)
>  {
> @@ -127,3 +140,10 @@ nvbios_iccsense_parse(struct nvkm_bios *bios, struct nvbios_iccsense *iccsense)
>  
>  	return 0;
>  }
> +
> +void
> +nvbios_iccsense_cleanup(struct nvbios_iccsense *iccsense)
> +{
> +	kfree(iccsense->rail);
> +	iccsense->rail = NULL;
> +}
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> index 8f0ccd3664eb..4c1759ecce38 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> @@ -291,6 +291,9 @@ nvkm_iccsense_oneinit(struct nvkm_subdev *subdev)
>  			list_add_tail(&rail->head, &iccsense->rails);
>  		}
>  	}
> +
> +	nvbios_iccsense_cleanup(&stbl);
> +
>  	return 0;
>  }
>  
> -- 
> 2.30.2
> 

