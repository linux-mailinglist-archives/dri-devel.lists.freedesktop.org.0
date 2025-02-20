Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BF4A3DF78
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 16:55:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19ABA10E1C8;
	Thu, 20 Feb 2025 15:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UMTbEhMM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E8F10E161
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 15:55:36 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5439a6179a7so1254598e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 07:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740066934; x=1740671734; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
 b=UMTbEhMMUHZ7XKF0R3pF2rA8k5p/7G+quKMJC67geDVIoiV024c/LSv7Q/+0CtNlws
 aZbvzNcMfin4EKm8cVwUiZKzo211e8qVUY+G1mnc5d5oI+yfQsxef89BITK+/UFqChwj
 /e3iXbvr96HlUBvqcjbyw1d8U8O5kTGuZ3SmGVL0jUq6mo0d75oh5QuEMTSryR55zHOE
 iP7g0RtIF0SfMMIiyXPjYMKJRZcboT3d5AcuwQ0dW1IXvtqH2fOC8cZvVKmWnD+FQ396
 CqbY2I4nogqbG2u/HcKKUyWS7rN3ER7zT453+4g7z5JQK2s7XtV8QS0MPzBYksKFR+Ok
 X27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740066934; x=1740671734;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5uYsXTWYRSMPSzYeuorstCzH5NUmzaHqKU5zOS+Htmw=;
 b=LdBgAcRVEyahwjatTHy4b0iCfjfVgF2ipIdiawXoxRaXsgmOQRNuC8w8NqL/EZqfhx
 uHkyAqu6BGTw7ZlpV8MbracOI/7DEGD99ENF0u6dUGS5YJrvw9w5DItq7iAnXKfbWJ+p
 6pXjtVvfyrhSLA65Tsi6kurtZfxBivb0OtX/Z1hjg5p6h79fmR0s4UZe9XjkpCgSowZc
 8S3IwsvspPwBbIrh7txM5d+j3a0GYvW4aza/PtGFgGGheHTy8qf7ZqbAEbqz4Jk00Q1R
 PiZDgokcJ3AKGTOoY94CfYd8VPBkjcz876tphS8x/VUs6tDuh0pX27Ixa+pZC60iTdw6
 Aszg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+7sim02o0TsdTZDfJgPyoO5d4lEJKBUdLbUIZI4oneXvugKlfmV0rLiXN6Z6p8LIq97gB+KINL3Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUtkRhC9R55KuOtcwl9fQ5r9ON6NukPuWC9O5MM5Dr1uzDBzM0
 zc0S7vlbLSry4PwyXJNrhCCja50EcPaFcrNeJN1PNR++mUN8H26eZ9Z6tvtMieE=
X-Gm-Gg: ASbGnct4Cg4ZuGrPU02QptvnEYXDp7742GtHBGECTPrvoyDAhv8h9zVf4bU0fjMFrig
 CgQdKCWKIqXmuyJaeEW3scaE+TLfYvLm59y7x4YFQ9iueNB8HpmCHD7yn+QMxLBSxjT+KKezhm7
 HQzsppTmubM0cNzUMnUxjc2IWWUq8xNEGEihxOPS+blSAEFMl69gSvO0rMIXFm6bRy2eiiBtyKw
 8/9eEfgyQbrnZLzptRsazegxytDWIgQjBo1Q8qjUgRPk9rNwVSHZvZ7CQIZdKb4KpydtylxPYKz
 JEc+KhOd3kPDTHRo2SkFo3ete42mnWFb2KwQRxLjVe7oPJfQNWPwvhCWK0EWloFQC1Xi5u0=
X-Google-Smtp-Source: AGHT+IEtf97SsjRtuL6d8IE3D1pgFUBRXbcvvxV4g3GwdxhA+EzzwQ1kj3+RIrBDm6cRLGQC3ggahA==
X-Received: by 2002:a05:6512:a90:b0:545:fdd:9ef4 with SMTP id
 2adb3069b0e04-546e4569f20mr1523857e87.8.1740066934306; 
 Thu, 20 Feb 2025 07:55:34 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5461f6448adsm1414735e87.70.2025.02.20.07.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 07:55:33 -0800 (PST)
Date: Thu, 20 Feb 2025 17:55:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
Message-ID: <xmamjbm67hxxmzwnilqwlb6esbpf3rtxayitzln4lvwfl4ok3c@7g6gsyp36f6y>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
 <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
 <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCNYypP9h+r1mPhxtmJsFTfXW1DzvwRLk=6p+9qmY5ofFQ@mail.gmail.com>
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

On Thu, Feb 20, 2025 at 11:45:18PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> 于2025年2月20日周四 18:27写道：
> >
> > On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> > > This change originates from the Qualcomm Android Linux driver. It is
> > > essential to support a dual-DSI configuration with two panels in
> > > some circumstances per testing. As the name suggests, this modification
> > > may enhance the bandwidth robustness of a bus.
> >
> > Please start by describing the problem and the result of the changes.
> > Otherwise it reads as it "may enhance or may worsen" the robustness.
> 
> OK, will re-test it with older branch. I remember it cause LCD to go
> to black without
> this patch, but not fully confident with my memory. With latest code,
> there is no
> difference to have this patch or not.

For the reference, this is the description from the display drivers
techpack:

    disp: msm: dsi: Adjust DSI priority level

    Sets DSI priority level to 7 before any commands are triggered.
    This DSI priority setting is recommended by systems team as DSI
    and Lutdma uses same Xin for fetch.

Maybe Abhinav can help with the proper problem description.

Also, see below.

> >
> > >
> > > Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
> > >  1 file changed, 10 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > > @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
> > >       return ret;
> > >  }
> > >
> > > +#define DSI_VBIF_CTRL                        (0x01CC - 4)

Register definition should go to the dsi.xml file. And anyway it should
have used lower case hex.

> > > +#define DSI_VBIF_CTRL_PRIORITY               0x07
> > > +
> > >  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
> > >                                 u32 len)
> > >  {
> > >       struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> > > +     const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> > > +     u32 reg;
> > >
> > >       dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
> > >       dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> > > +     if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> > > +             reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> > > +             reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> > > +             dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> > > +     }
> > >       dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
> > >
> > >       /* Make sure trigger happens */
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry
