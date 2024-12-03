Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A409E1DA6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 14:34:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BFC610E43D;
	Tue,  3 Dec 2024 13:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cWT1ksCY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE5B10E43D
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 13:34:45 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-53de5ec22adso6977242e87.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2024 05:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733232883; x=1733837683; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TBpETyWtaH5hjNXKFB/Kh92OXacxlpBmB/QG8QR8dOA=;
 b=cWT1ksCYwNcsIX0oWgRhj8YxRk7GNg1uEpIT4+aCyPxI5JqjNZAR9s612OhvzXTkRG
 GeFWArM5mJJTc4+1qwmqplbqkzWtGWUVyd3bt7qh1cs9DW5Jhfnjs8wVzNyNo5ek014f
 RWAKxxFWcwRvqsQ76P+cVrnMMzolcQGzZS0kvR/lW+ge74kQn/XZXX2kOWK6howDXh+T
 FCDjq0Am1x+KWKX6BSUCnKaKoDDoqVxBL7zbhoN5lOOhZFmrFqBtoLrzwj+wXYwy8kMi
 7woXOWUnRgOVodIFkBU/QzyBAnCCOS1CQCi4apiDxSB92wZb98T+vNgK1dJ/W3reI5mh
 Oj9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733232883; x=1733837683;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TBpETyWtaH5hjNXKFB/Kh92OXacxlpBmB/QG8QR8dOA=;
 b=jYbkL1ZV9Vb9R0EDZhZVkF9rC6KpGr+5WJv9lctf1T3pBuA/nMU7ErPqSqL10SN0W1
 1RcfGCxckHPGIr5vRLjtp8rEEJjYqOh7xfnDXo+0hJhaJoIURv/Y4t5RRCTTKkBWcSje
 fHgL7ah6aMfOaDny4/dR6Jl2q1VQUzgIabaGcBOEitSNRuyzYLfh5wC++DTpCK6teqfb
 PPJbBmIbnd+0vA+k/Ke1Q1k8e1Ox+M+wZRI+cMASgWeUma4AfDmUuwPPSawwnXdrbBiR
 2Yf0gg5jaPhI/xC/tz8q0RMHcQaIkzKc5JXa1F1dWp7nrSmgdYMqXdvojNUnAVQrFZyY
 9HPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV43cN7TsqdDQnISeLa2e7XXttxvJXGUxlsRq8JnHhySYYV3IZs8UhK4ttbr00a0gvJfdjWpMhYtcA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8x3BbwRqMHTaWFVlDuI1Ofp3z1Q9q6R/v/huvcERy24Um3PZg
 F2v5rl2A/cee6S0xKwbRYOTvEQwwpVumeDVmM+UcjEeydvkebwPeXhje1maX+gU=
X-Gm-Gg: ASbGncv6ajULBs2rwJbCQHbJFWBfcLDNIEss9pGxxySGxcdp0FQ8RTT79Eg5Y3n989x
 SXoA0Gx9v1ogCFEpC+7sCOQheqgkSUK8lYupPi7kWUbhahG+chBTBdNTknUOZLKf2dod41UqgOd
 B895BUS/59yJOL4QLEWv+DDOT8VdR+ydfmpG3FwUIeCHgtmss2OkHLkP30L1xAwTkEP2WN03LgE
 g2pPp3S4TKpcnGTwa+02opy3Bgq+PHo6ZrmffdkOVUQRsISgBKgHDre4kx/4UcHA1G43FHdtl02
 luTGwrXe5BuPlbKuv5j1qVKNyQpg8A==
X-Google-Smtp-Source: AGHT+IGFqWTL3NSebafXIiM6jlWgs0XqsSuiChd/2GQ18tCxiiLy3l5igvVydxIWkI+HSvdata9kjA==
X-Received: by 2002:a05:6512:3a8f:b0:53d:ede4:35ff with SMTP id
 2adb3069b0e04-53e12a216bdmr1770050e87.38.1733232883111; 
 Tue, 03 Dec 2024 05:34:43 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f2dasm1872112e87.158.2024.12.03.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 05:34:42 -0800 (PST)
Date: Tue, 3 Dec 2024 15:34:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Danylo <danylo.piliaiev@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Message-ID: <s6yaog7kffvbfzz3uhwvkfzxxe2n32sdefia3g75gffqhgjcjw@6fbifjd36yr7>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203095920.505018-2-dpiliaiev@igalia.com>
 <lhi5ni5i4kuwzu2627nf5pnhhzcx7rglza5lxeadpkdekwtisj@3cacpo2r3tzx>
 <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b63d73ce-0845-4c0b-a110-4e10b8f587eb@gmail.com>
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

On Tue, Dec 03, 2024 at 02:09:59PM +0100, Danylo wrote:
> 
> 
> 
> On 12/3/24 13:52, Dmitry Baryshkov wrote:
> > On Tue, Dec 03, 2024 at 10:59:20AM +0100, Danylo Piliaiev wrote:
> > > This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
> > > implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.
> > Could you please spend more words, describing what it is and why is it
> > necessary for those extensions. For a5xx+ it looks like some kind of an
> > internal address (what kind of?). For a4xx I'm completely lost.
> Yes, my bad. On at least a6xx+, shader could read 64b ALWAYSON counter
> from UCHE_TRAP_BASE+0 address. We use it to implement VK_KHR_shader_clock:
>  "This extension advertises the SPIR-V ShaderClockKHR capability for Vulkan,
> which
>   allows a shader to query a real-time or monotonically incrementing counter
> at
>   the subgroup level or across the device level."
> And there is no other proper way to get such counter. Same with
> GL_ARB_shader_clock.

Yes, please add this to the commit message.

> 
> Not sure what's there on older gens, I exposed the value on them for the
> completeness sake. But I don't know whether it is desired or not (I don't
> expect
> the value being read and used on a4xx/a5xx in Mesa).

Do you know if there is anything interesting in that region on a4xx /
a5xx (or at least if it's a region on a4xx?) Also how will that
GET_PARAM behave on a2xx-a3xx? Will it return 0 or some -EINVAL?

> 
> > > Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
> > > ---
> > >   drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
> > >   drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
> > >   drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
> > >   drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
> > >   include/uapi/drm/msm_drm.h              |  1 +
> > >   6 files changed, 23 insertions(+), 11 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > index 50c490b492f0..f1b18a6663f7 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
> > > @@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
> > >   		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
> > >   	/* Disable L2 bypass to avoid UCHE out of bounds errors */
> > > -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
> > > -	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
> > > +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > +	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > >   	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
> > >   			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
> > > @@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
> > >   	if (ret)
> > >   		goto fail;
> > > +	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
> > > +
> > >   	if (!gpu->aspace) {
> > >   		/* TODO we think it is possible to configure the GPU to
> > >   		 * restrict access to VRAM carveout.  But the required
> > > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > index ee89db72e36e..caf2c0a7a29f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > > @@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
> > >   	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
> > >   	/* Disable L2 bypass in the UCHE */
> > > -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
> > > -	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
> > > -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
> > > -	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
> > > +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > +	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > > +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
> > > +	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
> > >   	/* Set the GMEM VA range (0 to gpu->gmem) */
> > >   	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
> > > @@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
> > >   	adreno_gpu->ubwc_config.macrotile_mode = 0;
> > >   	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
> > > +	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
> > > +
> > >   	return gpu;
> > >   }
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > index 019610341df1..0ae29a7c8a4d 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > > @@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
> > >   	/* Disable L2 bypass in the UCHE */
> > >   	if (adreno_is_a7xx(adreno_gpu)) {
> > > -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> > > +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
> > >   	} else {
> > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
> > > -		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
> > > -		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
> > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
> > > +		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
> > > +		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
> > >   	}
> > >   	if (!(adreno_is_a650_family(adreno_gpu) ||
> > > @@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
> > >   		}
> > >   	}
> > > +	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
> > > +
> > >   	if (gpu->aspace)
> > >   		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
> > >   				a6xx_fault_handler);
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > index 076be0473eb5..774ff6eacb9f 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> > > @@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
> > >   	case MSM_PARAM_MACROTILE_MODE:
> > >   		*value = adreno_gpu->ubwc_config.macrotile_mode;
> > >   		return 0;
> > > +	case MSM_PARAM_UCHE_TRAP_BASE:
> > > +		*value = adreno_gpu->uche_trap_base;
> > > +		return 0;
> > >   	default:
> > >   		DBG("%s: invalid param: %u", gpu->name, param);
> > >   		return -EINVAL;
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > index e71f420f8b3a..9bd38dda4308 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > > @@ -253,6 +253,8 @@ struct adreno_gpu {
> > >   	bool gmu_is_wrapper;
> > >   	bool has_ray_tracing;
> > > +
> > > +	u64 uche_trap_base;
> > >   };
> > >   #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
> > > diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
> > > index b916aab80dde..2342cb90857e 100644
> > > --- a/include/uapi/drm/msm_drm.h
> > > +++ b/include/uapi/drm/msm_drm.h
> > > @@ -90,6 +90,7 @@ struct drm_msm_timespec {
> > >   #define MSM_PARAM_RAYTRACING 0x11 /* RO */
> > >   #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
> > >   #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
> > > +#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
> > >   /* For backwards compat.  The original support for preemption was based on
> > >    * a single ring per priority level so # of priority levels equals the #
> > > -- 
> > > 2.46.2
> > > 
> 

-- 
With best wishes
Dmitry
