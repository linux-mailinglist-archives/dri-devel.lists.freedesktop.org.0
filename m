Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3DB723B2A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 10:18:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A56910E219;
	Tue,  6 Jun 2023 08:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D97910E05A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 08:18:00 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30aeee7c8a0so4151042f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jun 2023 01:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686039477; x=1688631477;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=cSpRJEPqPVqhoSAFcxKLrdKHmoUN6BNCQfphia1KCDc=;
 b=Mpc+MQI1MneytiHZlBGaFATUvZ2D7UN1Dd8CesjFWTyP49rsZyjD8jnaaR2NWOdDYa
 ipHtgV6xxEWHjDPiqr2vBbciA3+K0fJJ7K1xXjC7+LEEVocVIIUJi94ZOqHXXoTSgzrG
 mxeqOJel8vvWWKD6+i5csIDgelH/jVykDsjgcbudQFFfZ7CAf/f920BH4IoknBSQ53hq
 hYHtrf7a3GRFH2D0iZ/WCyHV6yJHs8gv/lj4ehZmceJwESSII8vcD1ixg8gZhNul0KKy
 68n7AIGGrWW/DnIWzedWWopU6PP+9paqpLoKdw2Qdi7FG3cHOBeBfAZJZ1pCvU6/Hl6d
 tABg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686039477; x=1688631477;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cSpRJEPqPVqhoSAFcxKLrdKHmoUN6BNCQfphia1KCDc=;
 b=eMZ3lCro4otylDKd28D34iYQ5nAuu+gfCWn8d8FMYjixX9/ddFya3NIvRivSw4UeZy
 hxgAbCTJilK3D6a7RyKoP2scNKznwlp5tCC6qG65GN7Mevca5sgGe4GNiz7QQ1ySnrZB
 bCXdU+cp6+e/U0gVaIy1hukhNMGM18Czacti4kvBMcUMZIff9uNTsWFPNRiXnGHxq/1s
 eHxsUWTvTlxn+N2wfAr7wxvydsI/LsKySdZ9KPNb1pTIwWWzMQ3wyaF9Y9eH8UJMn1Os
 mH8oF+NsrHbngIZ9hFZDqgQ9quKAvl3k1Xe5/yc1avpOqxdaeVagw4cQy16LAcagwnEe
 geDw==
X-Gm-Message-State: AC+VfDztyiQhoIv0072z33rlvnufNVBh2S7H22RziaEy6zgGapjzSq21
 1qv2VOefq5r3ABtve2EUGxrmUg==
X-Google-Smtp-Source: ACHHUZ7IXBOZigfcocE6Us3xOMsMk/mjRsDKCskt5eDsJGA9seSXJvit+vkIb+CpvRFtcFD997m2jg==
X-Received: by 2002:adf:e446:0:b0:2fe:e455:666c with SMTP id
 t6-20020adfe446000000b002fee455666cmr8811328wrm.33.1686039476965; 
 Tue, 06 Jun 2023 01:17:56 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 c1-20020a5d4cc1000000b002fda1b12a0bsm11907760wrt.2.2023.06.06.01.17.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 01:17:56 -0700 (PDT)
Date: Tue, 6 Jun 2023 09:17:54 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
Message-ID: <20230606081754.GA218497@aspen.lan>
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
 <ZBhJctqSkdtoUmBi@smile.fi.intel.com>
 <ZH4IPJuPoX3gi5Ga@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZH4IPJuPoX3gi5Ga@smile.fi.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-gpio@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 05, 2023 at 07:07:24PM +0300, Andy Shevchenko wrote:
> On Mon, Mar 20, 2023 at 01:54:26PM +0200, Andy Shevchenko wrote:
> > On Fri, Mar 17, 2023 at 09:53:40PM +0100, Linus Walleij wrote:
> > > On Fri, Mar 17, 2023 at 7:51 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > > The of_gpio.h is going to be removed. In preparation of that convert
> > > > the driver to the agnostic API.
> > > >
> > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > >
> > > Thanks for fixing this Andy!
> > >
> > > > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > > > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> > > >                 /*
> > > >                  * Himax LCD controllers used incorrectly named
> > > >                  * "gpios-reset" property and also specified wrong
> > > > @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct device_node *np,
> > > >                  */
> > > >                 const char *compatible;
> > > >         } gpios[] = {
> > > > -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> > > > +#if IS_ENABLED(CONFIG_LCD_HX8357)
> > > >                 /* Himax LCD controllers used "gpios-reset" */
> > > >                 { "reset",      "gpios-reset",  "himax,hx8357" },
> > > >                 { "reset",      "gpios-reset",  "himax,hx8369" },
> > >
> > > Eh what happened here .. it's even intuitively wrong.
> >
> > I believe it had to be something  like
> >
> > 	#if 0 && IS_ENABLED()
> >
> > to show that this change is for the future.
> > Currently it does something unneeded for the kernels with that option off.
> >
> > > I would add
> > > Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
> > > with legacy bindings")
> >
> > I'm not sure. But it's fine, I can add it. Just want to double confirm
> > you really want this Fixes tag.
> >
> > > It wasn't used until now it seems so not a regression and no
> > > need for a separate patch.
> >
> > Exactly why I'm not sure about the tag :-)
> >
> > > Other than that it looks correct.
> > > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Thank you!
>
> Lee, is anything I can do here to move this forward?

Backlight code looks OK to me (although I might regard the Fixes:
discussion as unresolved)there is an unresolved):
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
