Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D318D1125
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 02:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 219AB10FDA7;
	Tue, 28 May 2024 00:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="P8VwQtOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CD910FDA7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2024 00:51:44 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52961b77655so331323e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716857503; x=1717462303; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6Jvp+hZYFfhzystmOitlp42k6Z90166BIGS6uqP4gWo=;
 b=P8VwQtOwxeJtvfZNtNYkSqH3REcvAEO/VMw87OHKT4me/0BB0bfZW5IvLNDS3um6Ye
 q8/CE8jiwSQWOcMddGZUXANJELcoK8VCxKlqrvQWvH/4vIfRjtCN24DQeskD/TLMhY0C
 zm7WlilfhwHUNO1qTg5VLuvG7cNg1oWaFa78QPOUGeVpxqcrdzLpocOaA1kNrVuBJ8n2
 1gt9AmH6Evk6IkJtnUC2H4dHABmTEz8shE5zMaxjUH03Q8AoCb/RgMJNBblKwxY2SZcG
 GNLxrBc1iT6ww07x91cLK5wrBqskL87hkpSI7bH9Z7UKY78TwUHqyIb6bgFWABwF/2Kj
 hZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716857503; x=1717462303;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6Jvp+hZYFfhzystmOitlp42k6Z90166BIGS6uqP4gWo=;
 b=lvu5YvfSayErosYzgTdoPW9QTm7ZIFQxdkGzc4AEI7dnSTD6VB26hlxMrEaYT6BK+N
 ao3PDlgwo6TXwpG6ivwStNwduKY6YlIM1tE6rf4Y0a37VirY/906j/5FnY/J3DgXdBkd
 aLfN0J3JSQrt5ipmDSpcFjrPXSTMumyiR+xi9QoVu5x7beVdUC0PG0jMn0aFnPVPSORX
 Q431sxH4HgBBgCF9i7xJZXMFsp04S/iEF+TDf0HQe7soUUxABDBNGpe72wrZkqe4pksT
 shw8Is6Hjo0dhBvIXkzR0/n347AocA5AJnhOrAycHOB8p7mXx/atrfA6uzuOwhJIqt9d
 +/Fw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSvNwtb8bYsSWwB5eJpVw9cA7zTnkvlNyiNnVem9Heje3dPbW0JCae4buF9RKR+uTdgjoj7axGIikb3e8NmZQMNLWYPjfVzoWjoU/aBu71
X-Gm-Message-State: AOJu0YxProrjhiovJMKqQRPJgWJNkSWS5bMyK4kZMw4WixSjcm2GPy+S
 N0ySuUV8lBiIey4Z5Ow4MLAILf+4Q74Mxg7PexBEbGy5okMsNhGuVAol9QxFjU0=
X-Google-Smtp-Source: AGHT+IGcWgwBgUcaN0cfQnKSG/Vltpwn7liri5wS72ChHP41TsGxpMvTPSgmLVdzeboS4ZHat/qOWQ==
X-Received: by 2002:a05:6512:5cb:b0:523:72b8:8002 with SMTP id
 2adb3069b0e04-52965198b89mr5807900e87.30.1716857502311; 
 Mon, 27 May 2024 17:51:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-529a9c25e98sm511225e87.278.2024.05.27.17.51.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 17:51:41 -0700 (PDT)
Date: Tue, 28 May 2024 03:51:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 Chris Healy <cphealy@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 00/12] drm/imx/ipuv3: switch LDB and parallel-display
 driver to use drm_bridge_connector
Message-ID: <l2y5jntbmrfard2h6napw27ngdsndvt64vb5xwz5ydmvoham6u@h6xgmmwbakss>
References: <20240331-drm-imx-cleanup-v2-0-d81c1d1c1026@linaro.org>
 <yh4r2pgdl2m5wp627r35zse3obacmeanin5rjo34f7tctgpix2@dme3vwzaivag>
 <fbb666b99104241aae09fc5b2ae72433e1249c23.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fbb666b99104241aae09fc5b2ae72433e1249c23.camel@pengutronix.de>
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

On Mon, May 27, 2024 at 05:40:03PM +0200, Philipp Zabel wrote:
> Hi Dmitry,
> 
> On Mi, 2024-04-17 at 00:58 +0300, Dmitry Baryshkov wrote:
> > On Sun, Mar 31, 2024 at 11:28:57PM +0300, Dmitry Baryshkov wrote:
> > > The IPUv3 DRM i.MX driver contains several codepaths for different
> > > usescases: both LDB and paralllel-display drivers handle next-bridge,
> > > panel and the legacy display-timings DT node on their own.
> > > 
> > > Drop unused ddc-i2c-bus and edid handling (none of the DT files merged
> > > upstream ever used these features), switch to panel-bridge driver,
> > > removing the need to handle drm_panel codepaths separately and finally
> > > switch to drm_bridge_connector, removing requirement for the downstream
> > > bridges to create drm_connector on their own.
> > > 
> > > This has been tested on the iMX53 with the DPI panel attached to LDB via
> > > LVDS decoder, using all possible usecases (lvds-codec + panel, panel
> > > linked directly to LDB node and the display-timings node).
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > > Changes in v2:
> > > - Fixed drm_bridge_attach flags in imx/parallel-display driver.
> > > - Moved the legacy bridge to drivers/gpu/drm/bridge
> > > - Added missing EXPORT_SYMBOL_GPL to the iMX legacy bridge
> > > - Link to v1: https://lore.kernel.org/r/20240311-drm-imx-cleanup-v1-0-e104f05caa51@linaro.org
> > 
> > Phillip, Shawn, Sascha, any comments on this patchset?
> 
> Sorry for the delay, this all looks sane to me. I can't find any users
> of the "edid" and "ddc-i2c-bus" properties either. But let me test on
> i.MX6 and with parallel-display as well.

At some point Chris dropped me a note that he had issues with i.MX5 /
sii902x driver, but because of the Connect I wasn't able to fully triage
it. I hope to have time this week.

-- 
With best wishes
Dmitry
