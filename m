Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CD5904615
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2024 23:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6610210E031;
	Tue, 11 Jun 2024 21:10:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mjGctw54";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E98610E031
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 21:10:17 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-52c84a21b8cso228050e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 14:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718140215; x=1718745015; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vvb72CkTXBjOFPbVlT36y7EQaQLAOeTkMGyEG4xcuiM=;
 b=mjGctw54o7glhIaXDCCA6JGBEPJIHJwHVA5N+Jw0EOfa4EZgNHGAcaQwqD/XWnpSCX
 lBXC6j1a6P5J+VnyBfT9ANyD5t6xWUAznlmvNE2yw//MzwPbd5SC7M0Ca6Kz4izexgK8
 GNI/pQz5vIJFlZj/xa/cuMA9BVKKJJ12Pbib9F2yQ3erkY/FGfvUDOcGhokD7goVsVbn
 DUVk18OTMTvsEbZpzyWULjaElXwvXblgkw8xPZvzEgYmnqzTVocvkCN6dJrMcHVpC+Ef
 xDsutnunSZrITgUgdmFDfhKumvDbnHwdMkUBu4t6kdzUAkwv3pb5i39j+L9Sg+p1OUdV
 S5mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718140215; x=1718745015;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vvb72CkTXBjOFPbVlT36y7EQaQLAOeTkMGyEG4xcuiM=;
 b=v1+OjDR7/7pILcMXwiY0ZtXJQBSz57Vm1h8yoBZZ9y5kM8CGIBrmz5hswbXqBe1YmE
 0YmRBWbf6ty9SUG6puvrdYoEeqEox4iUfyLL3zP58arNPvZf7BeAf985JQjGJQCnDR0K
 3oTHstEe45iouXKYBfZTx0cnjGyn2RNkEyBE8nfk9lIPb0DYNoxUFAt3IUO3e/Uk8Dzv
 YgVH+0GLptfCCG2N/bd+yQ3W65USjvOWvBWpjBBsE9hU8qEgW8NeJUiIngC4BEHfJrq9
 VVRm+aq8kv3Tq9MDv2nNMt5kcG4PMm2rBYxU5vw1tjvx0IK4pwPEI1LfuTBkFHQsviZt
 AvHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJwY07MCjERIYtvAQv5HlxkOTRu0NhYKPror0b60Myhyehi1veaYIRwvDzP6Q7NvU9cwFKEtefkJXbbVCBPPQ7JtFrSPfFSLR4NyUExwj
X-Gm-Message-State: AOJu0YwzY+wPIWG1AzP0UmztWo11Or/bsYARORuZi1fBclH8EgJS9eJo
 wfrntiXx0hj3SK0UwuxwavQhph83RVeTCvj5mjDFog0C4KROm7NgU2JamACS8PM=
X-Google-Smtp-Source: AGHT+IHqsaavvJAW1+fikYT/YA1pmPPdv6h5QRKcLuBt8Q4exkTuAhKfJX1A7n0hfkuySR9Qi31/2A==
X-Received: by 2002:ac2:43ab:0:b0:52b:92b0:8015 with SMTP id
 2adb3069b0e04-52c9a0c59cdmr28658e87.9.1718140215393; 
 Tue, 11 Jun 2024 14:10:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52c8ebd0572sm899430e87.166.2024.06.11.14.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 14:10:14 -0700 (PDT)
Date: Wed, 12 Jun 2024 00:10:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>, neil.armstrong@linaro.org, 
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/panel : truly-nt35521: transition to mipi_dsi
 wrapped functions
Message-ID: <uhnjrzii3ydzdsnhc54sbglpy46drzwg2m6if5ymid7gjabcvd@ppzdg6xz4xx7>
References: <3288287d-8344-4b37-a333-722cf12fef13@gmail.com>
 <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=XRuU=eh0HzbDCwFrr5h9s-rOdB5dbANAd-BmMhiHR6Ww@mail.gmail.com>
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

On Tue, Jun 11, 2024 at 08:57:48AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Jun 11, 2024 at 7:44 AM Tejas Vipin <tejasvipin76@gmail.com> wrote:
> >
> > Use functions introduced in commit 966e397e4f60 ("drm/mipi-dsi: Introduce
> > mipi_dsi_*_write_seq_multi()") and commit f79d6d28d8fe
> > ("drm/mipi-dsi: wrap more functions for streamline handling") for the
> > sony tulip truly nt35521 panel.
> >
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >
> > Changes in v2:
> >     - Fix patch format
> >     - Fix code style
> >
> > v1: https://lore.kernel.org/all/485eef24-ddad-466a-a89f-f9f226801bb7@gmail.com/
> >
> > ---
> >  .../panel/panel-sony-tulip-truly-nt35521.c    | 435 +++++++++---------
> >  1 file changed, 209 insertions(+), 226 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > index 6d44970dccd9..5a050352c207 100644
> > --- a/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > +++ b/drivers/gpu/drm/panel/panel-sony-tulip-truly-nt35521.c
> > @@ -44,248 +44,231 @@ static void truly_nt35521_reset(struct truly_nt35521 *ctx)
> >  static int truly_nt35521_on(struct truly_nt35521 *ctx)
> >  {
> >         struct mipi_dsi_device *dsi = ctx->dsi;
> > -       struct device *dev = &dsi->dev;
> > -       int ret;
> > +
> > +       struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
> 
> It's not a huge deal, but normally in the kernel all the variable
> declarations are cuddled together. AKA no blank line between the
> declaration of "dsi" and the declaration of "dsi_ctx". It would be
> awesome if you could send a v3 fixing that. When you send v3, feel
> free to add this above your own Signed-off-by:
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...with that, the patch will probably sit on the mailing lists for a
> week or two and then get applied. Neil may want to apply it, but if
> he's busy I can do it too.
> 
> I believe you were planning on tackling some more of the panels. Since
> you're still getting started sending patches, maybe keep it to a
> smaller batch for now and send another 10 or so? Probably best to keep
> it as one panel driver per patch.
> 
> -Doug

Do we want to delay this until the mipi_dsi_msleep() is fixed?


-- 
With best wishes
Dmitry
