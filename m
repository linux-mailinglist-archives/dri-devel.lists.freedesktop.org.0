Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8D039B3B1
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 09:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B4B26F5B3;
	Fri,  4 Jun 2021 07:18:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A416F5B4;
 Fri,  4 Jun 2021 07:18:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id b11so9983673edy.4;
 Fri, 04 Jun 2021 00:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=pl6qt2ubZWvYegR+sWqM/hSP31FbHp4AK/meVAiq6MI=;
 b=igrOdsevhxrTX6UnKbn/q/E67HP4NTpQLpzojPez02dpZaQUemsKccInGU9YLJEzZu
 iwsbvaN195TW4273KBgQdC8HVsj5Ap53q6Fl4l7700Z1C5jZd0Gn/+hm3NfWKFw0556K
 n4hfz/OECkllSsaPqS66SrMjMVRLuId0yoKtETV2TOxGF9BoQXv63g2OjQ8Ny8lyj+yy
 CrPrLcpVUkQyht+Yj+RBD94h6OlFd5TYrHIUEUMeAjsWX7NgMcT/JeG624nUGJFXfSVb
 kqAI2lirXqT0bpFNIcIG/uo6FyB4nPrMrySsnGsKpplcQw1sLEAVqp9tgiO/VqVF3b8X
 f1pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=pl6qt2ubZWvYegR+sWqM/hSP31FbHp4AK/meVAiq6MI=;
 b=UbGNtCWFxukxqWFp/FuS3YQDiM84U57J7xqzIr/M9C5B3NEvegB7V8YnYsKcT4LAZO
 7t+re4PiUEOaiqXfstMzPQtaHW6FdkH5yAQp6Q3AsVvcYt7qwkN5ApZ1CRXA8DLbvYY0
 XsSsisu6TxauU3um2umKG0/MevwDLVF4yZbZMQiBq46/+CxrDo5u8LnbS+zofg1+jmWd
 FBpxYNA+YVVnnaWuE0ZMwLqQAjtS3IYm9hl5gDmiRJlBhJOqGM/ja8LpPK0yOe/Wm6cB
 ci5dOHWM1mJ9QMCREkYn4XT4Y4kWiqViGUBXLwEWqQrLFl2slH3+cU2yMv3ey6i2nC5H
 1LbA==
X-Gm-Message-State: AOAM531eS5Z6+aNY+xEhfQ6LAqcazDkYbh4U6pSphhZLBBysdZxnD9/Y
 5O5t3BXF6L0T/bTrZolFesBXKHxt3qQ=
X-Google-Smtp-Source: ABdhPJxIgxR2MZvCJqAhch/9xcxSykZKwni4GtLqZ1Xg7Mg00Nju0E35L8OWkCT3EXQiuTO2QwaJGg==
X-Received: by 2002:a05:6402:101a:: with SMTP id
 c26mr3347449edu.19.1622791109067; 
 Fri, 04 Jun 2021 00:18:29 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id h22sm2790682edv.0.2021.06.04.00.18.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 00:18:28 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>, Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
Date: Fri, 4 Jun 2021 09:18:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87im2ufhyz.wl-chenli@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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



Am 04.06.21 um 05:04 schrieb Chen Li:
> I met a gpu addr bug recently and the kernel log
> tells me the pc is memcpy/memset and link register is
> radeon_uvd_resume.
>
> As we know, in some architectures, optimized memcpy/memset
> may not work well on device memory. Trival memcpy_toio/memset_io
> can fix this problem.
>
> BTW, amdgpu has already done it in:
> commit ba0b2275a678 ("drm/amdgpu: use memcpy_to/fromio for UVD fw upload"),
> that's why it has no this issue on the same gpu and platform.
>
> Signed-off-by: Chen Li <chenli@uniontech.com>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 85a1f2c31749..0d6a5cfa2abf 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -288,7 +288,9 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>   	if (rdev->uvd.vcpu_bo == NULL)
>   		return -EINVAL;
>   
> -	memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
> +	memcpy_toio((void __iomem *)rdev->uvd.cpu_addr,
> +				rdev->uvd_fw->data,
> +				le32_to_cpu((__force __le32)rdev->uvd_fw->size));

The le32_to_cpu and coding style looks wrong here. The uvd_fw->size is 
always in CPU byte order and is used as such.

And please keep in mind that architectures where memcpy() on MMIO 
doesn't work in the kernel usually doesn't work in userspace as well.

So this is actually now necessary a valid workaround.

Christian.

>   
>   	size = radeon_bo_size(rdev->uvd.vcpu_bo);
>   	size -= rdev->uvd_fw->size;
> @@ -296,7 +298,7 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>   	ptr = rdev->uvd.cpu_addr;
>   	ptr += rdev->uvd_fw->size;
>   
> -	memset(ptr, 0, size);
> +	memset_io((void __iomem *)ptr, 0, size);
>   
>   	return 0;
>   }

