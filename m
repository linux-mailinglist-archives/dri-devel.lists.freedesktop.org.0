Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD929A198DE
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 19:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F7110E73F;
	Wed, 22 Jan 2025 18:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="a+zrWEbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A5AA10E73F
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 18:56:20 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso478041fa.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 10:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737572179; x=1738176979; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ucEtL2vpaDXIcOOJNCX2jaEjGKELSNePIN/Dbu21H78=;
 b=a+zrWEbSuJMqv0cQzF68z3QHXP+QGua3ZfxVTitJlcH0OWUfcI1egdd+mWdnZkx1r3
 +Y2thBfvVA+tKLnoHMwfilp32Ny96F3I2fw/Jb04nOl7Gz1Edx+kGz93HyZkP08qjHk8
 iYT9CgimdeQzCbkJCcIKzK2Ft5xHxtfs7afS5MAudyUSWvWsN0Iczwrf1Kw9WZSeTgON
 nKi22KoGL5I0/HHGeM5dnNfnMsKAQdq4s01WBYE+fLzlFOowDRvCCt7grHYKJNhVQNzP
 4Un0GWCeBuhH5umnFbWSGSWpF4Hdez2O7Xcu6ljUKn5jGyglOg+f8TWR1qW/530OGU4Z
 gBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737572179; x=1738176979;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ucEtL2vpaDXIcOOJNCX2jaEjGKELSNePIN/Dbu21H78=;
 b=RNoW7mQbvaoYxOUOvC9f/7qZS7bj7TArtZPqwtKfGSs+T5aWqZxG5N50EMekricxbA
 CUMZkC0z68aFz9enCB8YYmiQ7JrGbhIQhAbI4ofGCIjRi3hvYJrmLP/G8bqMRb0WYzyQ
 oQyaqSPECMNQaF2Um2FWX6lSsy62B3TytfN3y7HHvyfJ9iFMHgLfcGoWXclVhK4f/EBm
 b96bBEx3UZ0wT6BMZk5JAhKArZqJuKFenAoN21uFQW3tBeQi0QzOB6VDiixh0T52UF2E
 PvzUvrGLVhNojRD+Tdf2E0dGIbZq5rRaYcj2NzS9x52djPpTAadjDThK3cpRv+ffct/1
 g1hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV07XXdlTtXGOvyTaHxtVqQsiAKO5ZDB/eD+6EzqbBacU8/pC1WtSw6+9ouxIR5kfS2TqPVZl0fCFM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKqdmy+f7IwebqVmLlwOMLEJrwKt9ZOBFT2tawApflgrwacY5Z
 SAbZx/uHEfSw2cYnnE+080MpMYeNLBoQUJI9eGvgzPKlv4uKed00R9ePmxFiQWM=
X-Gm-Gg: ASbGncsvdbRi6uozZc5gSOKrNFefCMQqAHxXXn6zYMRentFY60JJOlTVMq2GgsNk4zQ
 +3ZFY9KOl1p6SoumSCqWuMB1zfbMWgwug5+RWwV8FthcGSEBs8aZ2sapv4GRm9GsG74lqf8IDTR
 iFR4PslWDzIRCRjnd/GTYVLriCzY1IpGSGKVRp0HcGjkSdEyCUrb2qfw4HzTtvBoiomyhcK7S0A
 E1vj9VH9p11oz64MKL4zpf3uu8Ra156CoegteolCRnWyccL3lVNhHmePD0+hPlgNge5AVoBL9fm
 wy1ySHE4p6SDs/gdZoZyOi67ZLtMSax2cj8ml5KN7tUIwgcR3A==
X-Google-Smtp-Source: AGHT+IH1Num8sybuVWGX6lQCu41xk40pAQuzRF+kjqRrF1p7We/fl/ksVQE0dG+SV6CSYwqD02NYlQ==
X-Received: by 2002:a05:651c:1713:b0:300:7f87:a6a with SMTP id
 38308e7fff4ca-3072cab0c95mr63866951fa.7.1737572178788; 
 Wed, 22 Jan 2025 10:56:18 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a35acb6sm26558281fa.62.2025.01.22.10.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 10:56:17 -0800 (PST)
Date: Wed, 22 Jan 2025 20:56:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, rfoss@kernel.org, vkoul@kernel.org, 
 sebastian.reichel@collabora.com, cristian.ciocaltea@collabora.com,
 l.stach@pengutronix.de, 
 andy.yan@rock-chips.com, hjc@rock-chips.com, algea.cao@rock-chips.com, 
 kever.yang@rock-chips.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v5 12/20] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
Message-ID: <qrtcanwfokvc5x6xtgxhi2fs6fcibhnnhenegrdialx7cgy7u3@ea4v3woh5gki>
References: <20250109032725.1102465-1-damon.ding@rock-chips.com>
 <20250109032725.1102465-13-damon.ding@rock-chips.com>
 <d7zpv6qt52mhny54dejw4yqlp2k2c437op7qmepqe27pufplqk@64xvohrz7h2q>
 <330041c4-aaee-4b41-8ccd-e2807415c709@rock-chips.com>
 <ba369b98-9a2a-421a-9251-4db3c1dcedd9@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba369b98-9a2a-421a-9251-4db3c1dcedd9@rock-chips.com>
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

On Wed, Jan 22, 2025 at 05:37:53PM +0800, Damon Ding wrote:
> Hi Dmitry,
> 
> On 2025/1/22 16:17, Damon Ding wrote:
> > Hi Dmitry,
> > 
> > On 2025/1/9 20:48, Dmitry Baryshkov wrote:
> > > On Thu, Jan 09, 2025 at 11:27:17AM +0800, Damon Ding wrote:
> > > > Move drm_of_find_panel_or_bridge() a little later and combine it with
> > > > component_add() into a new function rockchip_dp_link_panel().
> > > > The function
> > > > will serve as done_probing() callback of devm_of_dp_aux_populate_bus(),
> > > > aiding to support for obtaining the eDP panel via the DP AUX bus.
> > > > 
> > > > If failed to get the panel from the DP AUX bus, it will then try
> > > > the other
> > > > way to get panel information through the platform bus.
> > > > 
> > > > In addition, use dev_err() instead of drm_err() in rockchip_dp_poweron()
> > > > , which will be called before rockchip_dp_bind().
> > > > 
> > > > Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> > > > 
> > > > ---
> > > > 
> > > > Changes in v4:
> > > > - Use done_probing() to call drm_of_find_panel_or_bridge() and
> > > >    component_add() when getting panel from the DP AUX bus
> > > > 
> > > > Changes in v5:
> > > > - Use the functions exported by the Analogix side to get the pointers of
> > > >    struct analogix_dp_plat_data and struct drm_dp_aux.
> > > > - Use dev_err() instead of drm_err() in rockchip_dp_poweron().
> > > > 
> > > > ---
> > > >   .../gpu/drm/rockchip/analogix_dp-rockchip.c   | 41 ++++++++++++++-----
> > > >   1 file changed, 30 insertions(+), 11 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c b/
> > > > drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > index 0957d3c5d31d..3ae01b870f49 100644
> > > > --- a/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > +++ b/drivers/gpu/drm/rockchip/analogix_dp-rockchip.c
> > > > @@ -124,13 +124,13 @@ static int rockchip_dp_poweron(struct
> > > > analogix_dp_plat_data *plat_data)
> > > >       ret = clk_prepare_enable(dp->pclk);
> > > >       if (ret < 0) {
> > > > -        drm_err(dp->drm_dev, "failed to enable pclk %d\n", ret);
> > > > +        dev_err(dp->dev, "failed to enable pclk %d\n", ret);
> > > 
> > > 
> > > why?
> > > 
> > 
> > The &rockchip_dp_device.drm_dev will be assigned in rockchip_dp_bind(),
> > which is called after probing process. The PM operations have been
> > advanced to the probing for the AUX transmission, so the dev_err() may
> > be better than drm_err().
> > 
> 
> Using drm_...() uniformly may be better [0].

Yes

> 
> > > >           return ret;
> > > >       }
> > > >       ret = rockchip_dp_pre_init(dp);
> > > >       if (ret < 0) {
> > > > -        drm_err(dp->drm_dev, "failed to dp pre init %d\n", ret);
> > > > +        dev_err(dp->dev, "failed to dp pre init %d\n", ret);
> > > >           clk_disable_unprepare(dp->pclk);
> > > >           return ret;
> > > >       }
> > > 
> 
> Best regards,
> Damon
> 
> [0]https://patchwork.kernel.org/project/linux-rockchip/patch/20250109032725.1102465-6-damon.ding@rock-chips.com/#26209891
> 

-- 
With best wishes
Dmitry
