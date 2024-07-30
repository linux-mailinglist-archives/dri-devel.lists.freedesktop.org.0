Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1432940BD8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2024 10:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66ECB10E4F5;
	Tue, 30 Jul 2024 08:39:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NqmBM/iF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D240610E4F5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 08:39:43 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-427d71e746aso497735e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 01:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1722328782; x=1722933582; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mMbXMLPxdHgp8aCQRIwbUSynHwaJsa3HFc5CrwRM3iA=;
 b=NqmBM/iF2ThW1NVosYzki4VJHWAQPKVnlHMJIQ0JpTpPsAfJBZdmM8V63RE+5efgTo
 eqWckzIncZZh4f7EddyiF8/0CWDcF7Z5vote7LzBhteTcBYa3h5DgWn1bTw65IswxW2m
 H4A8trEc2WYNHYujrvkNnapqEu/ESc167qpE0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722328782; x=1722933582;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mMbXMLPxdHgp8aCQRIwbUSynHwaJsa3HFc5CrwRM3iA=;
 b=p1YVApyRkqOSqZy9C7Xqx8eQJeQO8kysmZKV9fVswuxNTNOokr19axmFq+OLUpOx7g
 iWwFeBB+BonbdzvMlrsnjCb1JpCi/OdsXfWl7iCd6sd+mtNDQg+Vihws8Zp4dqvNsZ/J
 YmOtlAu1WmcZ6KMg2a6jNfInUqfGhSWYJHf2o21ijmWrx3scqKZc490osvgDx4PMfcyy
 FbW1hIi8YkVocioyGmTI8c+VkEi2+4jvPQWxKc/dqx+ktb+7XJbBLSb4jEO+Vrj3d537
 Czh9tH94b99BiF2PhUE3i4PW3ALFYlCFDkDdge1CyOaFiKcGXrp3W3gHetUfrF+Zocbi
 D7FA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZU3MtFirXcwTIiBJisf+faH+HeMa/5wCYPxbhIcTOmixNyGEXetT48pSCGqu4efNWWdv+SpYotp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzds9hScpbPFskYodwDaOa1rO5VKgr/pzWtudoKKj5fF5DioxFl
 3OBZM17/9rxIQvUYAt/K6wCmEDIzkEFooZbd5uP5Ik85LtBu13rHHbRMFBSHG5k=
X-Google-Smtp-Source: AGHT+IGdFjY0cCQvq3hH977T/VIttQHVhMME0vlMsCLSRfvyDCHXoJ2M6IjFVm/zP4wBbIdXQrKJMQ==
X-Received: by 2002:a05:600c:1387:b0:426:6fc0:5910 with SMTP id
 5b1f17b1804b1-428054feb50mr74046665e9.1.1722328782058; 
 Tue, 30 Jul 2024 01:39:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4281a5d10acsm79712725e9.24.2024.07.30.01.39.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 01:39:41 -0700 (PDT)
Date: Tue, 30 Jul 2024 10:39:39 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
 daniel.vetter@ffwll.ch, wanghaibin.wang@huawei.com
Subject: Re: [PATCH] MAINTAINERS: Add selftests to DMA-BUF HEAPS FRAMEWORK
 entry
Message-ID: <Zqimyx_jEi5ne6GB@phenom.ffwll.local>
Mail-Followup-To: Zenghui Yu <yuzenghui@huawei.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, sumit.semwal@linaro.org,
 benjamin.gaignard@collabora.com, Brian.Starkey@arm.com,
 jstultz@google.com, tjmercier@google.com, shuah@kernel.org,
 wanghaibin.wang@huawei.com
References: <20240729081202.937-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729081202.937-1-yuzenghui@huawei.com>
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

On Mon, Jul 29, 2024 at 04:12:02PM +0800, Zenghui Yu wrote:
> Include dmabuf-heaps selftests in the correct entry so that updates to it
> can be sent to the right place.
> 
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>

Applied to drm-misc-next, thanks for your patch.
-Sima

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 42decde38320..b7f24c9fb0e2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6660,6 +6660,7 @@ F:	drivers/dma-buf/dma-heap.c
>  F:	drivers/dma-buf/heaps/*
>  F:	include/linux/dma-heap.h
>  F:	include/uapi/linux/dma-heap.h
> +F:	tools/testing/selftests/dmabuf-heaps/
>  
>  DMC FREQUENCY DRIVER FOR SAMSUNG EXYNOS5422
>  M:	Lukasz Luba <lukasz.luba@arm.com>
> -- 
> 2.33.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
