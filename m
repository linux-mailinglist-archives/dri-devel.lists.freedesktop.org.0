Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9966A919A56
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 00:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FB0C10E165;
	Wed, 26 Jun 2024 22:05:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pGcgJLy/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B365210E165
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 22:05:02 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-52cdebf9f6fso6100975e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719439501; x=1720044301; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=siK38QYXuo8QNnveIrzt0+xpEIskBwlCTEZPBZd1FIQ=;
 b=pGcgJLy/B6URmhHfvhVYT/990mtpafw9uXcMdEWPnUAVoSvXCVtR+oeYMntFiUIRXC
 DHNgzTL0wICjAYZDx1RsK0EtNmN9R4uP5IAeVEFDrutIo+pqRy6vo6i4J8lgLBpmZlpq
 BriloIsr8icBGfmFRB3gN0B/lCD9U1YAQf1W7+2zJNPAE2+IWbq6SGm2a5rFTaM6sfS8
 UBJAqfSDtnAvYlbxuDzk8+P8g34yqRohb48aJM12eCXH02UZND7xqHjLi3LYmxtlpjjT
 s63j8l3jaPt+6NBPrBrHkQ7HVdyrL4GVRKcbhPkL54xZYsZFqRw6A+rW5jbP0PwnHuh2
 klGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719439501; x=1720044301;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=siK38QYXuo8QNnveIrzt0+xpEIskBwlCTEZPBZd1FIQ=;
 b=YSK+ecDAjLpJ5qR5oXDWByJuiskn2itNRg/xhSMTmj9lss3hqOSu5wZORqV8ETRKnH
 obav0oAOqPw8T4rflf7ceYJUdV8wYBPNUI7uhPqsWNDDA+/1EsZtQc7Zhdw9ntOxy644
 GuWylHTbX2Ekkw7JKjmwwEcOFv8jSQSYOK502MZyqxM8NS1nUP3GzB3zzyC6yB1Gy3xW
 XcUlXY0M/NuE04zsTea993dXfvejWzOOhoEAZ6VP5r/WHhFpGkzZjtK/S1xBBgC6R86u
 PqOsVT2/HTwnm7RG6n22hpeoXn1TXyT0s0FS//v8d8MbMCfQW6AO4MVTlqz22KURT26H
 u3lw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP5B8IrfLbkEnx02nT0veL73F0D9TcTRvF6K34M2vofHDEo3CYcHWyGSOMa20UV/iS7ASz2eps57qsA3F3iPN5QeiuXTm6suJ+NAuS9ugj
X-Gm-Message-State: AOJu0YyNptu/lQzbtHsGgwOjicq/wWvRRgvDxN345Yt0ZggXsDcYIKmd
 jOfCmdOyzvmo7EWEEnhD7c0HQJfRXAXz1LRlQSPhLetkZXHHQhPw3KEunWTCw/w=
X-Google-Smtp-Source: AGHT+IEwz/vaLu2uYxfyNR2muYajgJEh9jDVu49ZK0TTgw/DHg5lzlZe+ZG9e4AsahaK9vSkvoqmxQ==
X-Received: by 2002:a05:6512:220c:b0:52c:d70d:5ff8 with SMTP id
 2adb3069b0e04-52ce1832692mr11205312e87.1.1719439500695; 
 Wed, 26 Jun 2024 15:05:00 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cf2e734aesm643291e87.18.2024.06.26.15.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 15:05:00 -0700 (PDT)
Date: Thu, 27 Jun 2024 01:04:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Kiarash Hajian <kiarash8112hajian@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a6xx: request memory region
Message-ID: <btcidskycmlkylupz6qup7z4yyh4obzibcjy2ii2biqu64vqw2@5ellx6lt6m2k>
References: <20240608-adreno-v1-1-2e470480eee7@gmail.com>
 <CAF6AEGsd6jfDqV-EOWr+oMjPpVr2S+71VYmp1JoY8xU51eeEEw@mail.gmail.com>
 <20240625175926.4xyzwjyx7oxcwnzx@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGt5=bcni0K1ysot3-hVj9gWECJ5qP=M-sEDkRrAmEHFGg@mail.gmail.com>
 <20240625202308.prg72urp4mvtxzax@hu-akhilpo-hyd.qualcomm.com>
 <CAF6AEGs4i4mM9dpD3weG8GunHHfM0JESkzgX1Wd4PBDYatbQqg@mail.gmail.com>
 <20240626215218.pnbzy25c74c7a22a@hu-akhilpo-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240626215218.pnbzy25c74c7a22a@hu-akhilpo-hyd.qualcomm.com>
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

On Thu, Jun 27, 2024 at 03:22:18AM GMT, Akhil P Oommen wrote:
> << snip >>
> 
> > > > > > > @@ -1503,7 +1497,7 @@ static void __iomem *a6xx_gmu_get_mmio(struct platform_device *pdev,
> > > > > > >                 return ERR_PTR(-EINVAL);
> > > > > > >         }
> > > > > > >
> > > > > > > -       ret = ioremap(res->start, resource_size(res));
> > > > > > > +       ret = devm_ioremap_resource(&pdev->dev, res);
> > > > > >
> > > > > > So, this doesn't actually work, failing in __request_region_locked(),
> > > > > > because the gmu region partially overlaps with the gpucc region (which
> > > > > > is busy).  I think this is intentional, since gmu is controlling the
> > > > > > gpu clocks, etc.  In particular REG_A6XX_GPU_CC_GX_GDSCR is in this
> > > > > > overlapping region.  Maybe Akhil knows more about GMU.
> > > > >
> > > > > We don't really need to map gpucc region from driver on behalf of gmu.
> > > > > Since we don't access any gpucc register from drm-msm driver, we can
> > > > > update the range size to correct this. But due to backward compatibility
> > > > > requirement with older dt, can we still enable region locking? I prefer
> > > > > it if that is possible.
> > > >
> > > > Actually, when I reduced the region size to not overlap with gpucc,
> > > > the region is smaller than REG_A6XX_GPU_CC_GX_GDSCR * 4.
> > > >
> > > > So I guess that register is actually part of gpucc?
> > >
> > > Yes. It has *GPU_CC* in its name. :P
> > >
> > > I just saw that we program this register on legacy a6xx targets to
> > > ensure retention is really ON before collapsing gdsc. So we can't
> > > avoid mapping gpucc region in legacy a6xx GPUs. That is unfortunate!
> > 
> > I guess we could still use devm_ioremap().. idk if there is a better
> > way to solve this
> 
> Can we do it without breaking backward compatibility with dt?

I think a proper way would be to use devm_ioremap in the gpucc driver,
then the GPU driver can use devm_platform_ioremap_resource().

I'll take a look at sketching the gpucc patches in one of the next few
days.

> 
> -Akhil
> 
> > 
> > BR,
> > -R
> > 
> > > -Akhil.
> > >
> > > >
> > > > BR,
> > > > -R

-- 
With best wishes
Dmitry
