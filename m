Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D81F9D52BA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:46:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F42E10EA1C;
	Thu, 21 Nov 2024 18:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NeuqIOrF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6358210EA1C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:46:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-53d9ff8ef3aso1459340e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 10:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732214762; x=1732819562; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=CnablajdzkJVJy6Wp4cRfkLe1DSYH+fJmZ0JrWl5Hcs=;
 b=NeuqIOrF3KMZHRqEsKBkWtBTgmYDjeTvtL0nyR+bSOgWtpLnGv1NUm4sCFVHNdfkAp
 KfhozwAzJcgqHMZRTWFZH7bPjMw/1saH0YUdCLzyXVpR//B7tvcv1j7XJ90g+Z2HsTkj
 7CC+cdtQdGOzPiDrlJ5dwJnNtMRyNaTSPrFP/+z/ivGak6tGBM/NkH5WPkzJZYXrVgSL
 7NpzVSW2zbC1cWKF2uC4gWYNxer84aZAoLYNhm2u70UZ/4PRhQQcrlUepUWQJ87kUGAw
 QdyLou8nfvaOmuHEbggEcFriELfSC0jZR9uJXonCE4o9AxKX/8MVpCNJzEqBQsp4fQFN
 DUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732214762; x=1732819562;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CnablajdzkJVJy6Wp4cRfkLe1DSYH+fJmZ0JrWl5Hcs=;
 b=GUEoBxfuWEqFkMhuLFlKRdBJ6YD/zwY0cAJRvrkuxKDLtOPTG2cZiC5hEq70s1gmdQ
 0tHx9gxeFdTnxg4MoBCsBTFEoYttogeTBA+CsjP2XGgnQsy+/KgEvqncszm3lkqOaUUT
 gE6mSMSv3MGrGXQagCyVWnmxKhQC1PSnbV4bN31GnAPIb4dReVizK9DtzwmXa4gSxxf6
 t8dGUmkuBn2RHU0TLFjt6a2IV/vDYRVtLca0E0FKCU4ikLjn4PoR5WBuMPOZEKQUcOGQ
 R1UgxCNGGQhTqHFkOpQgu9W9abtKHzxNsSpO66qIj16fnWiwjE+KM9eBCe23N5JF71bM
 MYdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzlgF1bNYVi+b4qVi35xSzP0x7TnahfUWUl7dqVKJiN9qEruM8fgyB8eDxcX97V+NXbrg2kAZzXh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxbsTdrXLoUhXfLWP0vKjZsUnpvn0MkGPROAYPllpGbUwdwYz5v
 YQMGiZnz/FzuBkxsPEunXs/hDVylBxZqO1JL/gFcdwFJ+OKugAaJJtLCcCuG6A0=
X-Gm-Gg: ASbGncvv+XgyTXiZiCAc6XdfjR9v4R7xHEHMpb8SLDVuBUbwaAeu8k5OKLtzccQkFrz
 Bjnq2rObUkLcWNPcgGm63N5qYmKj/o4mAb8qC1+6448c6ZEHrlfZDQj8JqsxNL9nSbXHTSR2htP
 /IYIpoG5PfM0SgZYt5ccOBbBWbYMoSXfV3ycPT9ky4DQAbhrs4xNOFl2ZvkVUDh3Wic6Y3+2jSq
 7Sr7aG8gXw8SlOIbXmyQn3N14V1s6Nh0GsI2Y9H+BDFU0/+AlRtNTX5T/OaVL6DUJKXhgm7Az+I
 8gumA01kjjO+N9w5Mrb33aJLweUDXQ==
X-Google-Smtp-Source: AGHT+IEFMJhZvAQ6Q6Wl16HShSZo5FGRcfel9GsUflAZEQIhYBQDxaV99Gquo8VIj1VgFnA8lOzrRw==
X-Received: by 2002:a05:6512:2383:b0:52f:c13f:23d2 with SMTP id
 2adb3069b0e04-53dc13417b0mr3615259e87.25.1732214762476; 
 Thu, 21 Nov 2024 10:46:02 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53dd2497dbfsm44161e87.244.2024.11.21.10.45.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2024 10:46:00 -0800 (PST)
Date: Thu, 21 Nov 2024 20:45:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 05/11] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
Message-ID: <yo7silisbeesgdn54x7wsy2tgqw5wcjzdbm7ay7htajk3k6xib@v45gfvdtlaie>
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-5-4deb87be2498@linaro.org>
 <stifp2gtqxmegysrewfuwdsxpqin6zznvqndw7rj5nysi6rq4g@543stomenpvf>
 <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1aa497f-3be9-4870-a09a-d91f10091308@linaro.org>
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

On Wed, Nov 20, 2024 at 01:37:16PM +0100, Neil Armstrong wrote:
> On 20/11/2024 12:42, Dmitry Baryshkov wrote:
> > On Tue, Nov 19, 2024 at 06:56:40PM +0100, Neil Armstrong wrote:
> > > The Adreno GMU Management Unit (GMU) can also scale DDR Bandwidth along
> > > the Frequency and Power Domain level, but by default we leave the
> > > OPP core scale the interconnect ddr path.
> > > 
> > > In order to calculate vote values used by the GPU Management
> > > Unit (GMU), we need to parse all the possible OPP Bandwidths and
> > > create a vote value to be sent to the appropriate Bus Control
> > > Modules (BCMs) declared in the GPU info struct.
> > > 
> > > The vote array will then be used to dynamically generate the GMU
> > > bw_table sent during the GMU power-up.
> > > 
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> > 
> > LGTM, two minor nits below.
> > 

[...]

> > > @@ -82,6 +92,10 @@ struct a6xx_gmu {
> > >   	unsigned long gpu_freqs[16];
> > >   	u32 gx_arc_votes[16];
> > > +	int nr_gpu_bws;
> > > +	unsigned long gpu_bw_table[16];
> > > +	u32 gpu_bw_votes[16][GMU_MAX_BCMS];
> > 
> > We still have magic 16 here. GPU_MAX_FREQUENCIES? GPU_FREQ_TABLE_SIZE?
> 
> Yeah it would be max frequencies.
> 
> I tried to replace this 16, but it's used as ARRAY_SIZE(gmu->gpu_bw_table)
> like the other gx_arc_votes & gpu_freqs.
> 
> So I don't know what do define and where, and how, a separate patch ?
> 
> The define would only be used in the struct, not in the code, or whould I
> drop the ARRAY_SIZE and use this define ?

I'd say, define in struct, ARRAY_SIZE in code. And yes a separate patch
changing gpu_freqs / gx_arc_votes would be beneficial.

> 
> > 
> > > +
> > >   	int nr_gmu_freqs;
> > >   	unsigned long gmu_freqs[4];
> > >   	u32 cx_arc_votes[4];
> > > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..5b80919e595fa1ba0a3afcca55feb89e60870cb1 100644
> > > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> > > @@ -44,6 +44,7 @@ struct a6xx_info {
> > >   	u32 gmu_chipid;
> > >   	u32 gmu_cgc_mode;
> > >   	u32 prim_fifo_threshold;
> > > +	const struct a6xx_bcm bcm[GMU_MAX_BCMS];
> > >   };
> > >   struct a6xx_gpu {
> > > 
> > > -- 
> > > 2.34.1
> > > 
> > 
> 
> Thanks,
> Neil
> 

-- 
With best wishes
Dmitry
