Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A769B9AD2
	for <lists+dri-devel@lfdr.de>; Fri,  1 Nov 2024 23:26:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62F2E10E1B0;
	Fri,  1 Nov 2024 22:26:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LyI7rF9x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E74F10E058
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Nov 2024 22:26:50 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e0875f1e9edso3220144276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Nov 2024 15:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730500009; x=1731104809; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
 b=LyI7rF9xn6c8shnt4/PQ5gYTS1LzWgZyuRLVPWcZwVET2lL8IN8PN7h0ciy+lsEtj5
 Wp9BaYqBwxKtfuS7skL4x0xHY9APaaY/vxNLT4BafoOsx11ONb9zco2rQHMZSpaFxpIs
 /0NkrCEPD/g/HdspWTWdXt1MFOr6Suf0SOsobNMEH/zAsYxV0xWYKeL834Y8ntDHRgaR
 HgW9vNO9Aa++i9G+uKVSKgVv0gohq3KZAxMM8wRnUQlSoXQKY88oGCuSAcOjTb+cWlc2
 priGNADiOysVS0BSNUmc+l/zmEixMV4bLLjNYgTctDkHCk35KRWSu5oa8fFSv2yeXidg
 K4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730500009; x=1731104809;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZudTzd0+bQI8YAgJ9zoL8NILhzadYVubfY3jlJ2hS3Y=;
 b=pNOcbQR6fdgbpNr6ZO5l5sovcnSHnPOJV7+8OL2XF8ea6V8oJgou/kWrW1Ux1kDpT6
 VS4m/Ambnw2e+HDLIu4TPNoiQDSzvWjKFuyuo/Rv8phuSzO4WretRCm0/LhBp9Ld82c2
 y193d4STFa9NB65wUKdy7lBJY4OjoFBK2HGPcwC0kYfWA6rb3Z3iBGHCuyw3V06CovDO
 4cC5T2IqVckyqNrfxTHamlNCxlWckRTrWC68bkKIwbsYoQm2y+beABl2ZeZy5zkTf8N0
 GTgZwFGBD4XV1ouq4xmSo/tOXefDma5R2D/J4vbbWYtdB/dEr3uWqMkX/MpBMUuNObwC
 D+YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0YxMA7AiIHFC7VJqbBUlptPbjbBDTACFi6u83FvlNZW0/0pEJYKA1sYL3CkwyPTbR2tOM6uZMZIo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmEOa7oOHJIi7AzShFlKZyJYHVAsDT7RTS4eYtAA84rL59HSm7
 9T4SubmUdi2ULwfdTv6L10EQoLfmu3Jw49bv3tYRx90dq+spvUD3XMNRCAac47PJ1mFYc9ZzGd1
 Dotx6gIebq7pBOa2e+BJWGD5Z6nNs6eJF0tNLVg==
X-Google-Smtp-Source: AGHT+IGtriCDF4xwF2pEv4oKmK1IxTM5b7GjmdDA6xwQNU8GyukANzaIo/LVK5L70uLC6wImMimFPrxbBm/wgfMeDA8=
X-Received: by 2002:a05:6902:2182:b0:e2e:46e5:c2ca with SMTP id
 3f1490d57ef6-e3087a599c7mr22672334276.14.1730500009290; Fri, 01 Nov 2024
 15:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20241019-msm-hdmi-interlaced-v1-1-03bf85133445@linaro.org>
 <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
In-Reply-To: <52229a96-64b0-48d0-9868-31be42b12db1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 2 Nov 2024 00:26:38 +0200
Message-ID: <CAA8EJpps+spdowEbDoO2zNfyn+DnWwPgnZiFMw13ZE=iAnJEnA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/hdmi: mark interlace_allowed as true
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 1 Nov 2024 at 23:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/18/2024 2:10 PM, Dmitry Baryshkov wrote:
> > The MSM HDMI driver supports interlaced modes. Set the corresponding
> > flag to allow interlaced modes on the corresponding connectors.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > index 4a5b5112227f..643c152e6380 100644
> > --- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > +++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
> > @@ -336,6 +336,7 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi)
> >       bridge->funcs = &msm_hdmi_bridge_funcs;
> >       bridge->ddc = hdmi->i2c;
> >       bridge->type = DRM_MODE_CONNECTOR_HDMIA;
> > +     bridge->interlace_allowed = true;
> >       bridge->ops = DRM_BRIDGE_OP_HPD |
> >               DRM_BRIDGE_OP_DETECT |
> >               DRM_BRIDGE_OP_EDID;
> >
>
> I had quite a bit of discussion on this internally because this spans
> quite a few generations of chipsets.
>
> On very old hardware, even before msm8996, there was dedicated hardware
> de-interlacer. But even on msm8996 or other HDMI supported chipsets
> where the handling of if (mode->flags & DRM_MODE_FLAG_INTERLACE) is
> present, these were because its carry forward of older interface code.
>
> The way we handle interlaced formats today, is software needs to handle
> the part of dividing height / 2 and width * 2 and adjust the source crop
> if necessary. This part has moved to userspace for recent chips.
>
> Othwerise, we will need to add this part in the dpu driver to adjust
> this. I am not seeing this part there yet. So may I know how you
> validated this change? Something similar to :
>
> https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/LE.UM.1.3.r3.25/drivers/gpu/drm/msm/sde/sde_plane.c#L1340
>
> If we add this part first to dpu code, then we can mark interlace_allowed.

I think you are mixing the interlaced formats and interlaced output.
The code that you have pointed to is related to hardware deinterlacing
- in other words taking the interlaced framebuffer and outputting it
to the progressive display.

The interlace_allowed flag controls a different feature - filtering of
the internalced modes (aka 576i, 1080i, etc). In this case we are
using progressive frames, but the HDMI outputs a picture as two
separate fields. I have validated this by outputting image (modetest)
to the external HDMI display on IFC6410 and on DB820c boards.

-- 
With best wishes
Dmitry
