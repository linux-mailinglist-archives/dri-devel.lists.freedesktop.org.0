Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3697B8BB517
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 22:58:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDEBD1129D1;
	Fri,  3 May 2024 20:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nCoLsdvE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C249E1129D0
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 20:58:33 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id
 2adb3069b0e04-51f45104ef0so68096e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 13:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714769912; x=1715374712; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AGCcksotH+kok5NpboUKTIlKHpdUeNSbaWOxB4FkSPs=;
 b=nCoLsdvE/nVL7p9UIvG/9PYOH5MJd9QhjJEWDSEJU+XU3PNb9dGPDk4K19UOSd5wnp
 VvTbClxZZkDbtwSDKeq6aW8G9KW3sesXzCQu24F65AHb5gmER3eemkhgjuAUzT/icyxt
 qtBX7uL8BC6Ts+df/vNNb3nWQ12Gasu4WBZI/zKMuSAuWA5pNqGT7JoDrSfH5ol3pOoB
 J7vF9tyU3LjR8vRozcmhhQRaUkQnujsOQOKqM3+gmKLCsRft/42hmefb9RcLwusrADL7
 WNsZiwC0ekjJANd8Ep8C5n/04m0dxlyz+jQijRqaf7QX439NIWG01DCCd8y+ox5mkFuf
 pTkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714769912; x=1715374712;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGCcksotH+kok5NpboUKTIlKHpdUeNSbaWOxB4FkSPs=;
 b=HJkBl2DI7KfaNCMkHitG26aktcE8MaIcanZ10AgSevAnSb9FZN0d06RbiBEseezYMC
 XAhN/XSXTT/A7c/hfzeCd5Nkg1TY82da2tzMq/PyzGTzaPl5wt3GCI9GTCvsM1rVXi7j
 FerZmcB3FgqgPN9WE/AVslSY9r0GW9Dvw+BwuCZOiad9GAZHrWADN9/eMQGCH1O2x7iy
 c29PXMlY8smbX/1xIHYJIgCd9PodumRJLn0dNB654PJUOLuyPWes39f63Wh+Lbra/mcX
 Goof+OgoPOSllZJhBaXvtEyNdtEZKGJgaMfNBjRpfqjLNpyRRqEuLRT814CfFmXY0ebo
 vAtw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB+OqJGAj5stz8UNUnX4W09w2INE/739vO5RzkQBjyHZOab3Gwma572c5eEK8vrsDBI2qHq19R97/eCRio8bZVUvY28Nu6apn7ekkPBKhE
X-Gm-Message-State: AOJu0YxfkABCUZhd4kQGaqut7EonfVpF+66fLMEvdl5pgWQiTcemBp3/
 jSHFWUw/4tiOfDGlY5kkp/9SJz4Kw3TKeh9kXzZ/iTFb9prV57Hoo5aqoYwFh0Q=
X-Google-Smtp-Source: AGHT+IGh163oqin4GlmPqJK3PbLBLGdZ4e4w6rDs1lNIuIE6Lk/Bcocl9QGPInbpoBXNrBomjORIHQ==
X-Received: by 2002:a05:6512:b18:b0:51b:fcfe:ed with SMTP id
 w24-20020a0565120b1800b0051bfcfe00edmr3062478lfu.25.1714769911856; 
 Fri, 03 May 2024 13:58:31 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 o29-20020ac25b9d000000b0051da1d9e51dsm653034lfn.289.2024.05.03.13.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 13:58:31 -0700 (PDT)
Date: Fri, 3 May 2024 23:58:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] drm/msm/gen_header: allow skipping the validation
Message-ID: <xtnfj6foaxy6upqydlozrm4bbg4cawjecuuud6szbgtpjitvag@fpc5bmpptelk>
References: <20240409-fd-fix-lxml-v1-1-e5c300d6c1c8@linaro.org>
 <20240503164812.GA4153965@thelio-3990X>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503164812.GA4153965@thelio-3990X>
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

On Fri, May 03, 2024 at 09:48:12AM -0700, Nathan Chancellor wrote:
> Hi Dmitry,
> 
> On Tue, Apr 09, 2024 at 05:22:54PM +0300, Dmitry Baryshkov wrote:
> > We don't need to run the validation of the XML files if we are just
> > compiling the kernel. Skip the validation unless the user enables
> > corresponding Kconfig option. This removes a warning from gen_header.py
> > about lxml being not installed.
> > 
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/all/20240409120108.2303d0bd@canb.auug.org.au/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/Kconfig                 |  8 ++++++++
> >  drivers/gpu/drm/msm/Makefile                |  9 ++++++++-
> >  drivers/gpu/drm/msm/registers/gen_header.py | 14 +++++++++++---
> >  3 files changed, 27 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> > index f202f26adab2..4c9bf237d4a2 100644
> > --- a/drivers/gpu/drm/msm/Kconfig
> > +++ b/drivers/gpu/drm/msm/Kconfig
> > @@ -54,6 +54,14 @@ config DRM_MSM_GPU_SUDO
> >  	  Only use this if you are a driver developer.  This should *not*
> >  	  be enabled for production kernels.  If unsure, say N.
> >  
> > +config DRM_MSM_VALIDATE_XML
> > +	bool "Validate XML register files against schema"
> > +	depends on DRM_MSM && EXPERT
> > +	depends on $(success,$(PYTHON3) -c "import lxml")
> > +	help
> > +	  Validate XML files with register definitions against rules-fd schema.
> > +	  This option is mostly targeting DRM MSM developers. If unsure, say N.
> 
> Is this change going to be applied? I have gotten a little tired of
> seeing "lxml not found, skipping validation" in all of my builds :)
> 
I've posted v2, including CI changes. The plan is to get it merged
before the drm/msm pull request.

-- 
With best wishes
Dmitry
