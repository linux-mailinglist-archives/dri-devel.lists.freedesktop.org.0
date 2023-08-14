Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3840677B454
	for <lists+dri-devel@lfdr.de>; Mon, 14 Aug 2023 10:41:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37A2D10E14B;
	Mon, 14 Aug 2023 08:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891D710E14B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 08:41:21 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fe426b86a8so37554855e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Aug 2023 01:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692002480; x=1692607280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=D5aLdYoDzonLAxZ5PSMomSbWxhFnGKGGnvbysSjVTVc=;
 b=nofShKkvBm0DO7xSJvOuELrwERW3RQEALYLWsAtldEaPqBHXOHp5mq6q4Z+IIwAeGI
 YFH55cFn6nnypFsgmDfbucGvylbLdOgahjrrmYN9y0rYFtqHwd9Vc6HaqtOwFVf5b5la
 H370hVR3iiSCbWVK9CKhDvQAjetELuWJC6hTyXN2gjmnJVIPeK32XDAW5R9WmU9Q7FGh
 XWsZ9+Pgg4E/iu3mQUwWrDEPePMo5MatDfAbZsOc674cSBUbaA0nH5R/pjzziJ8ZOBI6
 ho5ASHWnT19j1Cqq5skAl8fPpQydUAX4YW4HK2V3M1SLuQjTjsUNm6QzqpXRoZbUsaQ3
 ODxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692002480; x=1692607280;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D5aLdYoDzonLAxZ5PSMomSbWxhFnGKGGnvbysSjVTVc=;
 b=iWQN6kAEvNnuMIZgmtm0Yw8ITqFDLEJcym8CfMSiHphdm+G5WXDQ4AO+qCQd3R4M/Q
 Gu//k5kAOaGQEmAqpFhzTeBLm5CbspoV8RJtzofvWLtkSNH6cUDNDfQs3HwlM2DQ7BDg
 gwNEge9fe8MQ4KwzyvyMrk8SLXAILSyviIxFm8bk1wnm7Q2fcRI36DkfHEsdgHQ1B4gK
 nPrru8xHDu3ST1clwkHANJ7rwxqzHHlaRKxXCZ92RIHzjFDr+D+ChCeHD6fs8+skA372
 Zg4GgUMcFElPuBDVK834FPC541y0qyvIwCW39jfsJEZfF/vfIsqnkIh8+I2A7nKIIgDb
 XS6g==
X-Gm-Message-State: AOJu0YzfgYl8ZJoR8I+4jRoPvFHeEir/cXf1k9FYFz5aHw8Ejuo5UfmA
 5rh9L7D/KF7981Bc1mjdoEYRvA==
X-Google-Smtp-Source: AGHT+IEjqxBt+uF9fAJFXmoE7E2jsAgWdkYg6ku2TUxOU9VSoYR5tHOmsX19STi7JTMgtzI/v48xfg==
X-Received: by 2002:a7b:c045:0:b0:3fb:e054:903f with SMTP id
 u5-20020a7bc045000000b003fbe054903fmr6941460wmc.36.1692002479946; 
 Mon, 14 Aug 2023 01:41:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a05600c215700b003fe1ddd6ac0sm16527413wml.35.2023.08.14.01.41.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Aug 2023 01:41:19 -0700 (PDT)
Date: Mon, 14 Aug 2023 09:41:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: [PATCH] backlight: lp855x: fix unintialized function return
Message-ID: <20230814084117.GD5056@aspen.lan>
References: <20230811131600.2380519-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230811131600.2380519-1-arnd@kernel.org>
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
Cc: Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Artur Weber <aweber.kernel@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 03:15:53PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The function now returns an error code in some cases, but fails to initialize
> it in others:
>
> drivers/video/backlight/lp855x_bl.c:252:11: error: variable 'ret' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         else if (lp->mode == REGISTER_BASED)
>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/video/backlight/lp855x_bl.c:256:9: note: uninitialized use occurs here
>         return ret;
>                ^~~
> drivers/video/backlight/lp855x_bl.c:252:7: note: remove the 'if' if its condition is always true
>         else if (lp->mode == REGISTER_BASED)
>              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Since this case should not actually happen, return the -EINVAL code.
>
> Fixes: 5145531be5fba ("backlight: lp855x: Catch errors when changing brightness")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think we already received a patch for this:
https://lore.kernel.org/lkml/20230809163825.GA5056@aspen.lan/T/


Daniel.
