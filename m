Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D60D339B49D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:08:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 091636F5D5;
	Fri,  4 Jun 2021 08:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC566F5D5;
 Fri,  4 Jun 2021 08:08:29 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id og14so7857986ejc.5;
 Fri, 04 Jun 2021 01:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=x1leB78G46naHPzZJQXi/DCDYCAszkWEJfdXDpTHiWk=;
 b=arlNWd6gloEwocm2HbsItwvL1nS9tcJVgvXvPIOMAiWKxtomOtF1q98J+CYx9r9bgl
 VzfYndH/HnOWNbBdnVgVBnOTg3HWlBmMzDul5bJhJ0TA2inT9M8aYTC/ZMAofPoiycAg
 r025XB4KsguNwMsqdHrB6XA+HQZOBkTreC3C38qBqzygKATTqCoUbhfgSfhHx6gX2yfl
 ylJpKtnS6Skc1I9pgbeAckmnQulBudEf6lvjhPnbWHYn09XAi1fTmMSzCTkOJ7dmHJVt
 YPe/fbGJbIU9OMsCrGAOez42AlqgFKOB/mVrui9+vDadL/Fs5beVrkVMFi37SsQetsyP
 pwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=x1leB78G46naHPzZJQXi/DCDYCAszkWEJfdXDpTHiWk=;
 b=WKBbc0Xrqs6thXdsIw5DSyZ3JbbnQB5Gq2P1QYQkkt/KO8fN0ufp7CTsoEBPUnd8nu
 oTYwcx4o5mSXBPbuyT/eiwlrL/wLFKYJ4HKnTM428U+NMk32iar1Rt6ECmvGWpWvLtcq
 0PfdXxPFs+6pae8/10wiFtp2vbSF4ozZWY6iVEjgMkLI6FkRbaKEhxdRUInXWNWrGjKQ
 UK/ZIQByR3e4yZgjJTEQsmoOW84vmlArjPS1nz1dPaNp1Wsp9O/5kI6uqzFWz2C20IfW
 zbpHtkIE5UdQUX+1LbiIvOU45MQxE+So5vIrFEs6Kej7mD8Ollsz/eqfdtB+xgYQu0n2
 s2wA==
X-Gm-Message-State: AOAM533bq5fpg6NMir5T0L4bMzDETz3JzzNbfcAAwnRZ/F7LkYSO+2N9
 0Bey5HOtQsfuUCB4WN+Gt+giiDfeGFg=
X-Google-Smtp-Source: ABdhPJw6hx3rF9XTeQTb6a6rLhWG+YpMeSd9gPcge8+kszFV+U+TsxRIrbvzO8SdE98hT9vtTTqS3w==
X-Received: by 2002:a17:906:b191:: with SMTP id
 w17mr3111041ejy.200.1622794108428; 
 Fri, 04 Jun 2021 01:08:28 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:7b4b:873a:17b5:b581?
 ([2a02:908:1252:fb60:7b4b:873a:17b5:b581])
 by smtp.gmail.com with ESMTPSA id di16sm2812246edb.62.2021.06.04.01.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 01:08:27 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] radeon: use memcpy_to/fromio for UVD fw upload
To: Chen Li <chenli@uniontech.com>
References: <87o8cnfr3s.wl-chenli@uniontech.com>
 <87im2ufhyz.wl-chenli@uniontech.com>
 <0689a006-a0a2-698a-12d8-cb11156e469a@gmail.com>
 <877djacbfx.wl-chenli@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <c4941cb6-8c40-aad1-e61a-2786ba1ab225@gmail.com>
Date: Fri, 4 Jun 2021 10:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <877djacbfx.wl-chenli@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 04.06.21 um 09:53 schrieb Chen Li:
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
> index 85a1f2c31749..55abf9a9623b 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -288,7 +288,9 @@ int radeon_uvd_resume(struct radeon_device *rdev)
>   	if (rdev->uvd.vcpu_bo == NULL)
>   		return -EINVAL;
>   
> -	memcpy(rdev->uvd.cpu_addr, rdev->uvd_fw->data, rdev->uvd_fw->size);
> +	memcpy_toio((void __iomem *)rdev->uvd.cpu_addr,
> +				rdev->uvd_fw->data,
> +				rdev->uvd_fw->size);

The coding style still looks wrong here, e.g. it is indented to far to 
the right and data/size can be on one line.

Apart from that the patch is Reviewed-by: Christian König 
<christian.koenig@amd.com>

Regards,
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

