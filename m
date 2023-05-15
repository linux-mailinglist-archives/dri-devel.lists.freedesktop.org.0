Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 007047040F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 00:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E110E2AD;
	Mon, 15 May 2023 22:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9980210E2AD;
 Mon, 15 May 2023 22:27:35 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-51b33c72686so9261332a12.1; 
 Mon, 15 May 2023 15:27:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684189655; x=1686781655;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=c63nnhTmzNCcDDPrXmodqbHJR7oOiORNS/8H1q+iK6g=;
 b=GYI58VNxjemFw6YIPeQ95YRFBqCxJo12Fqc/Sr7wf0Zz0bd+TcuVn4Xx2k8XTK6AJn
 0/Rv4TqrHoFSwNURAPDIafARYcNA1woYbasq2mTHX5Mvb68kzDUj5hHSaGtqFh9zttF2
 rMZxg2A2M8+h1R7lEE4YnhUUNyOnJBjOkkjG+zfQmCdxTSFHyJfUH/uCyc1qv/hVoA26
 WMwK/GDfo8ToNLdP/pZmSAe9+8iiYgKUH38lxDS4z/iJA5SROvUwvyAmiu476riCZVxh
 LZvjHxbDLuTWwxeAVnX1d/sSJcnUy1nDBkeE72lHePCOp3eZnizBkPVSA7SsZVHL/8zc
 WPww==
X-Gm-Message-State: AC+VfDzg+Ny9uYoX9CZp6lSXZBOstjvWhkdRCL6Q6LzNZgBWFW0LKQLu
 CSKMls12Xx76/+r5I4dC2jI=
X-Google-Smtp-Source: ACHHUZ654Qpgl50uQ0TTsz+Sm+yXhr0g/S0spaoX5NDpQanCAD2nDXcpydjHPB8lZdE6LMp1HwPPLA==
X-Received: by 2002:a05:6a20:54a4:b0:101:1951:d491 with SMTP id
 i36-20020a056a2054a400b001011951d491mr32720818pzk.6.1684189654681; 
 Mon, 15 May 2023 15:27:34 -0700 (PDT)
Received: from [192.168.86.26] (cpe-70-95-21-110.san.res.rr.com.
 [70.95.21.110]) by smtp.gmail.com with ESMTPSA id
 l23-20020a62be17000000b006460751222asm8024272pff.38.2023.05.15.15.27.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 May 2023 15:27:34 -0700 (PDT)
Message-ID: <0df418ad-3492-4241-1837-55ed89b77e10@linux.com>
Date: Mon, 15 May 2023 15:27:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm:amd:amdgpu: Fix missing buffer object unlock in
 failure path
Content-Language: en-US
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, Xinhui.Pan@amd.com
References: <20230503231507.279172-1-sukrut.bellary@linux.com>
From: Sukrut Bellary <sukrut.bellary@linux.com>
In-Reply-To: <20230503231507.279172-1-sukrut.bellary@linux.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, ray.huang@amd.com,
 amd-gfx@lists.freedesktop.org, Jiadong.Zhu@amd.com, sumit.semwal@linaro.org,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/3/23 16:15, Sukrut Bellary wrote:
> smatch warning -
> 1) drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c:3615 gfx_v9_0_kiq_resume()
> warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> 
> 2) drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c:6901 gfx_v10_0_kiq_resume()
> warn: inconsistent returns 'ring->mqd_obj->tbo.base.resv'.
> 
> Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c | 4 +++-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c  | 4 +++-
>  2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index 8bd07ff59671..66d5c5d68454 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -6891,8 +6891,10 @@ static int gfx_v10_0_kiq_resume(struct amdgpu_device *adev)
>  		return r;
>  
>  	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> -	if (unlikely(r != 0))
> +	if (unlikely(r != 0)) {
> +		amdgpu_bo_unreserve(ring->mqd_obj);
>  		return r;
> +	}
>  
>  	gfx_v10_0_kiq_init_queue(ring);
>  	amdgpu_bo_kunmap(ring->mqd_obj);
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index bce6919d666a..d5715d8a4128 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -3617,8 +3617,10 @@ static int gfx_v9_0_kiq_resume(struct amdgpu_device *adev)
>  		return r;
>  
>  	r = amdgpu_bo_kmap(ring->mqd_obj, (void **)&ring->mqd_ptr);
> -	if (unlikely(r != 0))
> +	if (unlikely(r != 0)) {
> +		amdgpu_bo_unreserve(ring->mqd_obj);
>  		return r;
> +	}
>  
>  	gfx_v9_0_kiq_init_queue(ring);
>  	amdgpu_bo_kunmap(ring->mqd_obj);

Follow-up.
Could you please review this patch?


--
Regards,
Sukrut
