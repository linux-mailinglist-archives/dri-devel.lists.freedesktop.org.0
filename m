Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CAB93EDCC
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 09:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1F7710E083;
	Mon, 29 Jul 2024 07:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="dxvtq3WZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD4D10E083
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 07:02:01 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-428032ed83cso2449515e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2024 00:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722236520; x=1722841320; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Jiq86OgV8aN77ZK3gSdcC84nDSEMhthS0/eJkO/i+l0=;
 b=dxvtq3WZDeGWMlwsXPcS9on7yHGlaNXodMiYzDfXZt40vo44Do5PCryJ9AQ3zd9tme
 RhDVK+FeY+8C435uozeHwwZ0FKHpwNZBStj/o6oQIrGa5Lw1qSpcwgULV/NN1wyv+1V7
 ifKUUJAao3EL8N/AsLtt6bsZu2mLf5EdWOmsw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722236520; x=1722841320;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Jiq86OgV8aN77ZK3gSdcC84nDSEMhthS0/eJkO/i+l0=;
 b=DxdOvk7WmdY1jue+Gc8moJKbWwcCjg0bMEKmsorLm1io3H5UGR9I6v/nNqXJTo+wCx
 fOAgo79NgqqBhgZhpkdvjHGU6odiiely84uI7VSAa3FoJr+ycsZvTAg0PmZaH7+0dJeT
 wOlB7ZiQWq9i7vdSCujf1j1ak3RPjpbdcZWWa8MkRz5gRyACpVtCIpuJQmadn/TbaNzV
 ewK62Y3fsbuIooN82gd9nKH2sAaSGbRC2TEcwH2W2ZdGXRottZ36BBbSJskagNn8A+Hx
 eP8PxxPBNitcKrRvtWAVflPz6w0KzBmwGV8UbI4eHM4bYMJDaiHtTccKewpehYxFveDY
 cC4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBVokzdDa889WJU1peFpZ/p20v6BWZGnUhbSCAOCH3qy07Hmj8nSLgXOmoswJGZC4iCbj/0k3WGdAZVLgHyYfcRgg4mDC5YxUOb8xRXsgP
X-Gm-Message-State: AOJu0YxBNO1Jdhbjn8nQ6BkXNPK/TohxDhfYlpIO9l0+jpMBVXR+cujz
 NBc+P8USPrYkKPhBiZKDtid+0QOujno9CQZOIqMG8qi/VE5cAh0pL3sEGrnGSuI=
X-Google-Smtp-Source: AGHT+IEiT+O8ufmV6ZCYKgzAur7uD7ABX1l7m8G+4knDu8SiWra9FtLVycZ8kwh2N41DGIzudaMzfQ==
X-Received: by 2002:a05:600c:4511:b0:425:65b1:abb4 with SMTP id
 5b1f17b1804b1-428053beee0mr56974615e9.0.1722236519848; 
 Mon, 29 Jul 2024 00:01:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281225141dsm83180525e9.45.2024.07.29.00.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jul 2024 00:01:59 -0700 (PDT)
Date: Mon, 29 Jul 2024 09:01:57 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
 wanghaibin.wang@huawei.com
Subject: Re: [PATCH v2] kselftests: dmabuf-heaps: Ensure the driver name is
 null-terminated
Message-ID: <Zqc-ZWlTYwnKHoQK@phenom.ffwll.local>
Mail-Followup-To: Zenghui Yu <yuzenghui@huawei.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
 wanghaibin.wang@huawei.com
References: <20240729024604.2046-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729024604.2046-1-yuzenghui@huawei.com>
X-Operating-System: Linux phenom 6.9.7-amd64 
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

On Mon, Jul 29, 2024 at 10:46:04AM +0800, Zenghui Yu wrote:
> Even if a vgem device is configured in, we will skip the import_vgem_fd()
> test almost every time.
> 
>   TAP version 13
>   1..11
>   # Testing heap: system
>   # =======================================
>   # Testing allocation and importing:
>   ok 1 # SKIP Could not open vgem -1
> 
> The problem is that we use the DRM_IOCTL_VERSION ioctl to query the driver
> version information but leave the name field a non-null-terminated string.
> Terminate it properly to actually test against the vgem device.
> 
> While at it, let's check the length of the driver name is exactly 4 bytes
> and return early otherwise (in case there is a name like "vgemfoo" that
> gets converted to "vgem\0" unexpectedly).
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
> * From v1 [1]:
>   - Check version.name_len is exactly 4 bytes and return early otherwise
> 
> [1] https://lore.kernel.org/r/20240708134654.1725-1-yuzenghui@huawei.com

Thanks for your patch, I'll push it to drm-misc-next-fixes.

> P.S., Maybe worth including the kselftests file into "DMA-BUF HEAPS
> FRAMEWORK" MAINTAINERS entry?

Good idea, want to do the patch for that too?

Cheers, Sima


> 
>  tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> index 5f541522364f..5d0a809dc2df 100644
> --- a/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> +++ b/tools/testing/selftests/dmabuf-heaps/dmabuf-heap.c
> @@ -29,9 +29,11 @@ static int check_vgem(int fd)
>  	version.name = name;
>  
>  	ret = ioctl(fd, DRM_IOCTL_VERSION, &version);
> -	if (ret)
> +	if (ret || version.name_len != 4)
>  		return 0;
>  
> +	name[4] = '\0';
> +
>  	return !strcmp(name, "vgem");
>  }
>  
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
