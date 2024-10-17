Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E95D9A30D2
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 00:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCD5010E0FE;
	Thu, 17 Oct 2024 22:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zslali07";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A837410E064
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 22:36:36 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539f7606199so1800744e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 15:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729204595; x=1729809395; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cwAXFmWCXX0r1pv8K+QO23GJE7b+Aos8jpne2JMdjEc=;
 b=Zslali07SbaQA1voQc+0KV8WEpdm+zNnD3mc2eg0OojAKJO5ZY+DQW0xmWMYzg61pM
 yz+38Mf9MkpKkeHrwaV88L1XrXAIYQ0PtVRpO02z68tw9lhv/ntDcthdeOAxPXWv3/Rf
 4p5OtzQgt5QDc5n5borZob7isqiEt/PNVipIGE4QYOnExBWCr5xcNQ6+B4DBkaUQXrKA
 S2f+1ydRNlN2R31JSyYnNZuzzkT4UtOLsOaFXyXMqSkF47gijUSdpbVCwnDBRyMSNYO6
 mRp9w9dGlszDpsDy5o9jUUYgSOMiUOAfBnmiWfjXKaM23wddUgtAM4tjKqPcWfS459PS
 Dn0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729204595; x=1729809395;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cwAXFmWCXX0r1pv8K+QO23GJE7b+Aos8jpne2JMdjEc=;
 b=VyXtEyzZ89DOEE3SfVYG0iip3PhtpE87FhjzABxfexX27gMKGSmQpxfbknj8thqrks
 XcRaAvQQJnfiLmEyDgnsZg7Ko1Jeu6wlUjJRW2bfyf4719DHX4zYayNW5A5j8SnNO/oB
 gKdNXcR2D7MhoZykaZgRSK5vtOj3oF2tHFafrKKlI9sZ+5T8FwW2h6Y99tGfWomrvOXj
 LCpQf0ohX6hIjS0tkF+sK5COOfZXGGl1lVWJliNhz7IE9J2udOGozuzBGkKh2IbB5a7I
 3ATW9pTR58HQabf52USaKBb23xXpuZ814+XN8z1M5YfrbUid6DQPYI0tw3JqhYXR5PfQ
 7Pow==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8k4NoVWMMbseFzB9zCGCKk6k6YXTwTjEQM1qyBwn73BijROiAYEFzVCpOm0mZERmFODFmAup9IYs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YycC49hXRbCSEwHduh1/9zJbCalHf4pM7mWGW8PfEGjakWiF5Oq
 FW1/9cJ6luOuZJ9UWnrc7P3B2P+6LALZq3H97oRuC8IOAc9zuyuWHomXte+XHA4=
X-Google-Smtp-Source: AGHT+IF1I4kSsNnrKhsbvznyz4HHMXNbr14OcwbceyeuR4/kwFXejHD9xQxDdafw6ngrjvMnsFbQAQ==
X-Received: by 2002:a05:6512:3b2a:b0:539:da76:4832 with SMTP id
 2adb3069b0e04-53a15443901mr211178e87.37.1729204594652; 
 Thu, 17 Oct 2024 15:36:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a15211c32sm46086e87.273.2024.10.17.15.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 15:36:32 -0700 (PDT)
Date: Fri, 18 Oct 2024 01:36:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Jean Delvare <jdelvare@suse.de>, dri-devel@lists.freedesktop.org, 
 LKML <linux-kernel@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 YueHaibing <yuehaibing@huawei.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 freedreno <freedreno@lists.freedesktop.org>
Subject: Re: [PATCH v3] drm/display: Drop obsolete dependency on COMPILE_TEST
Message-ID: <zcwax3drscm2btazw3xc3i2lck62vzolg47cmsggkv4da23itw@w527axovqksz>
References: <20241015134606.5b87093e@endymion.delvare>
 <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=WhVWswn28hbxNDLDhMeiZOpsWzsx8OkORniOxWVx_4Gg@mail.gmail.com>
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

On Tue, Oct 15, 2024 at 09:06:04AM -0700, Doug Anderson wrote:
> Hi,
> 
> On Tue, Oct 15, 2024 at 4:46 AM Jean Delvare <jdelvare@suse.de> wrote:
> >
> > Since commit 0166dc11be91 ("of: make CONFIG_OF user selectable"), it
> > is possible to test-build any driver which depends on OF on any
> > architecture by explicitly selecting OF. Therefore depending on
> > COMPILE_TEST as an alternative is no longer needed.
> >
> > To avoid reintroducing the randconfig bug originally fixed by commit
> > 876271118aa4 ("drm/display: Fix build error without CONFIG_OF"),
> > DRM_MSM which selects DRM_DISPLAY_DP_HELPER must explicitly depend
> > on OF. This is consistent with what all other DRM drivers are doing.
> >
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
> > Cc: David Airlie <airlied@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> > For regular builds, this is a no-op, as OF is always enabled on
> > ARCH_QCOM and SOC_IMX5. So this change only affects test builds. As
> > explained before, allowing test builds only when OF is enabled
> > improves the quality of these test builds, as the result is then
> > closer to how the code is built on its intended targets.
> >
> > Changes in v3:
> > * Rebase on top of kernel v6.11.
> > Changes in v2:
> > * Let DRM_MSM depend on OF so that random test builds won't break.
> >
> >  drivers/gpu/drm/display/Kconfig |    2 +-
> >  drivers/gpu/drm/msm/Kconfig     |    1 +
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > --- linux-6.11.orig/drivers/gpu/drm/display/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/display/Kconfig
> > @@ -3,7 +3,7 @@
> >  config DRM_DISPLAY_DP_AUX_BUS
> >         tristate
> >         depends on DRM
> > -       depends on OF || COMPILE_TEST
> > +       depends on OF
> >
> >  config DRM_DISPLAY_HELPER
> >         tristate
> > --- linux-6.11.orig/drivers/gpu/drm/msm/Kconfig
> > +++ linux-6.11/drivers/gpu/drm/msm/Kconfig
> > @@ -6,6 +6,7 @@ config DRM_MSM
> >         depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> >         depends on COMMON_CLK
> >         depends on IOMMU_SUPPORT
> > +       depends on OF
> 
> Perhaps nobody landed this because you're missing the msm maintainers
> as specified by `./scripts/get_maintainer.pl -f
> drivers/gpu/drm/msm/Kconfig` ? I've added them here. It seems like
> we'd at least need an Ack by those guys since this modified the
> msm/Kconfig...
> 
> FWIW I haven't spent massive time studying this, but what you have
> here looks reasonable. I'm happy at least with this from a DP AUX bus
> perspective:
> 
> Acked-by: Douglas Anderson <dianders@chromium.org>
> 
> Presumably landing this via drm-misc makes the most sense after MSM
> guys give it an Ack.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
