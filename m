Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82309B9BC7
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2024 02:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E1510E225;
	Sat,  2 Nov 2024 01:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="x176JOo6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 092AF10E225
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2024 01:04:44 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-539e3f35268so3240530e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 18:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730509483; x=1731114283; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=sqErCMUF8gr+Z0iKwC2J15lI04+BWiUakafnHcS72HQ=;
 b=x176JOo62Cd/tpRrgb/QmQf4O0TGuxmhklU6xuKR4y1OHhVYyk4OAEhYvNrfMMr7OR
 KTL8XkyInDN6p0PMnRn2ICwprJNVmXpc0EPNj4qTdK55SeaL1oJVBFRJorGoRrmbG1jd
 t6lFS46c0dbGL0WnqKnkoUTerE8JGK7UX2kvMmDi2MA3Lk/q4+AbgMKJ+PaJ83Ls3SM9
 D0ntP+wYwb7di6SD37jKiT2c81f7+PAzmNeVdCkQCqoKdSBcmWwiD1qRvo1CrVGNkIID
 6e1GsOW8bV9XQnB3MV9icoVlGJhTnvLDximg3yQ3doG+IyHZBu/E9nRGvHHcuA0h5wxy
 Kkdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730509483; x=1731114283;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sqErCMUF8gr+Z0iKwC2J15lI04+BWiUakafnHcS72HQ=;
 b=tdm/5Ph4M2y7RCO4cDRcn+0apfjVAWAvv1Y0w8SRCHfInhXLdFUzvxg0Zhk5iUke5H
 KN3gbysxr/0C0VamIUeE5itr8QvuqpYTWjyqcI4HS+ukEtVTOYCSZTDUOQaCpkKq/K2u
 KvkkFvrkd+F3y97zrT6cOGpM5n4GZytHfhEcwXLvYmbjHiaib9R40lbenZmI/FXWn6KU
 KhikWUh1RYZrIdfU4V/3Sd7Xa9Jm+vgZ9di0YlyAcOdFcijX0DpNYNGHfyZrsIrvmdHX
 l2eS9u5k3VGBaGZUZ/I7k8ngsi1fhABjfaRkAIUrKUNRliiBxHnIFqsI2RmWPlcig8tm
 7DlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXlsZfmITwc5EfaGzOZD7Y9JXaUzy+8oGLEXH9Lp3qg77b5wbRaCfSYQzsZxzgFWzj9RauJna7Q59k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxPc9ueUERPbQuIb2ODSV/4sqj8suconGeZCEdwFP+vtUg3476O
 bXGfOsgpbBGv/3xIwVncvuCsISv/l7X4IGoaGo4gQRAjI+EKglVEtqcCIyNLBJg=
X-Google-Smtp-Source: AGHT+IHprjXq36nNEExyCP3aSwaMNPwiLueb3h6RaUfM0RL73CJVzxQCx4hYdyGZXzORZZQQIB9mRA==
X-Received: by 2002:a05:6512:3d05:b0:536:55cf:3148 with SMTP id
 2adb3069b0e04-53d65df8d2bmr2881920e87.31.1730509482550; 
 Fri, 01 Nov 2024 18:04:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53c7bcce3a9sm713069e87.150.2024.11.01.18.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Nov 2024 18:04:41 -0700 (PDT)
Date: Sat, 2 Nov 2024 03:04:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
Message-ID: <ut5jr7chk7ea2szrar7vyj7dfo3uww4ac3m3xs3wioznrhwbzv@co6wovw5dphu>
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
 <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
 <CAA8EJpps+spdowEbDoO2zNfyn+DnWwPgnZiFMw13ZE=iAnJEnA@mail.gmail.com>
 <bb5bd688-34dc-4c9e-8abf-d1395f3a385e@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bb5bd688-34dc-4c9e-8abf-d1395f3a385e@quicinc.com>
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

On Fri, Nov 01, 2024 at 05:40:46PM -0700, Abhinav Kumar wrote:
> 
> 
> On 11/1/2024 3:26 PM, Dmitry Baryshkov wrote:
> > On Fri, 1 Nov 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> > > > The MSM HDMI driver supports interlaced modes. Set the corresponding
> > > > flag to allow interlaced modes on the corresponding connectors.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >    drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > index 4a5b5112227f..643c152e6380 100644
> > > > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > > > @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> > > >        bridge->funcs = &msm_hdmi_bridge_funcs;
> > > >        bridge->ddc = hdmi->i2c;
> > > >        bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > > > +     bridge->interlace_allowed = true;
> > > >        bridge->ops = DRM_BRIDGE_OP_HPD |
> > > >                DRM_BRIDGE_OP_DETECT |
> > > >                DRM_BRIDGE_OP_EDID;
> > > > 
> > > 
> > > I had quite a bit of discussion on this internally because this spans
> > > quite a few generations of chipsets.
> > > 
> > > On very old hardware, even before msm8996, there was dedicated hardware
> > > de-interlacer. But even on msm8996 or other HDMI supported chipsets
> > > where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is
> > > present, these were because its carry forward of older interface code.
> > > 
> > > The way we handle interlaced formats today, is software needs to handle
> > > the part of dividing height / 2 and width * 2 and adjust the source crop
> > > if necessary. This part has moved to userspace for recent chips.
> > > 
> > > Othwerise, we will need to add this part in the dpu driver to adjust
> > > this. I am not seeing this part there yet. So may I know how you
> > > validated this change? Something similar to :
> > > 
> > > https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340
> > > 
> > > If we add this part first to dpu code, then we can mark interlace_allowed.
> > 
> > I think you are mixing the interlaced formats and interlaced output.
> > The code that you have pointed to is related to hardware deinterlacing
> > - in other words taking the interlaced framebuffer and outputting it
> > to the progressive display.
> > 
> > The interlace_allowed flag controls a different feature - filtering of
> > the internalced modes (aka 576i, 1080i, etc). In this case we are
> > using progressive frames, but the HDMI outputs a picture as two
> > separate fields. I have validated this by outputting image (modetest)
> > to the external HDMI display on IFC6410 and on DB820c boards.
> > 
> 
> Yes I did think that this was to show interlaced content but that being
> said, I traced through the HDMI code a bit, it does have support for
> changing the HDMI timing but without the support of dpu, progressive content
> really cannot be converted to interlaced. So I think the HDMI pieces there
> were supposed to go along with the rest of the dpu pipeline that is the
> entire pipeline shows out interlaced content. But dpu support for giving out
> interlaced content is not there, so this hdmi piece by itself is not
> complete enough to mark interlace_allowed as true.

I could not find corresponding bits in the original fbdev or SDE
drivers. My quick tests showed the correct context, but most likely I
need to revertify that. Unfortunately next week I won't be able to run
the tests, so this gets into the 6.14 area.

-- 
With best wishes
Dmitry
