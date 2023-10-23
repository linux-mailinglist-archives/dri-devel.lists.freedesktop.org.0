Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A43A7D372A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 14:49:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48EC210E1D2;
	Mon, 23 Oct 2023 12:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DDD10E1D2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 12:49:13 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c50d1b9f22so42996331fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 05:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698065351; x=1698670151; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=5F2/b6x1LCbJBCL/hGp4wgBjwVGE9CeqqG2gwc9QLwU=;
 b=mUF8Ig1FLECCw8LjBI0iB1uNWZLHRfIUj3SN8gHqkHkyIU69rQdlYn9ZToIJdpltvh
 u2oevTQUo7xSwPdC4ImO49VdGcjomoIsA04A2rTeCsl683Xt8deu7XxH0REAen2cyMoU
 0AAmKbofIiHWF7mpRlzKfQM417wg0jNC+KbXLP5KsbQVV6/WzmTZMfyceiwtOyy2NCUN
 iM68DNHJvvf/9vU1POV0kQV+Zz68K8mLN7sCTelhbjV8knGQ5tjwaZZmmkP9mvaB2Ytl
 Yn/l/FYOWD0GBJtG12glsCZmJWbopNQJlPatJ9/cO/jPpBi0Djn5oQCcrHA+7L+i58fP
 HFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698065351; x=1698670151;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5F2/b6x1LCbJBCL/hGp4wgBjwVGE9CeqqG2gwc9QLwU=;
 b=qdGjiSWr6ZP7c+SKxnz8mJRQwIm+DAFBFKabA5mae9jqn3e5BHNCKRu5d1o8mmzDKH
 tAholMbYqAwVSASUiYv6DAtYoR6Ys9GXaFeUNgvruJ+Bcbi+i6AIsLqmOi4R6fVIz9lF
 87qUVWcEobA8UQFBT2cU267DR2ncMtUE42vFDDSr9dKOa9CIHddq0hmbsYjD1SOmceYH
 2qiWa7kiR36ObOk5+ZY2LjTBaiJuNNeaMFtqpydfYQuwfTKAZPIz15szp3QowYSkWWzT
 HDkTXYb9djYErt1jSHLSgMrLpUdJpgIIfb+OaG2FKMf2wEAUf3JDpDUjbUcVHZpjgFu5
 R6dQ==
X-Gm-Message-State: AOJu0YyIab0xhXBei5SGB1FkzpBdLmbKsU5Vle0N9WJ3/2c5qfEGjZz9
 zd9092Xe1zUu6+Vfw2ccgL3uvA==
X-Google-Smtp-Source: AGHT+IGaTg0NdwZ2awpa8SRAqNobR151fbJLl50rAUDEuxtz05JE5xRAXwVriQOeZMaE926br6ZqKw==
X-Received: by 2002:a2e:7c15:0:b0:2c5:5926:de52 with SMTP id
 x21-20020a2e7c15000000b002c55926de52mr6031556ljc.53.1698065351491; 
 Mon, 23 Oct 2023 05:49:11 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 j6-20020a05600c488600b004080f0376a0sm9320997wmp.42.2023.10.23.05.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 05:49:11 -0700 (PDT)
Date: Mon, 23 Oct 2023 13:49:09 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH] backlight: pwm_bl: Avoid backlight flicker applying
 initial PWM state
Message-ID: <20231023124909.GC49511@aspen.lan>
References: <20230608-backlight-pwm-avoid-flicker-v1-1-afd380d50174@pengutronix.de>
 <20231018210741.6t3yfj6qgmpwhhlo@pengutronix.de>
 <20231020112727.GF23755@aspen.lan>
 <20231020121148.3g6t3v5uuyubifpb@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020121148.3g6t3v5uuyubifpb@pengutronix.de>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 kernel@pengutronix.de, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 20, 2023 at 02:11:48PM +0200, Uwe Kleine-König wrote:
> Hello Daniel,
>
> On Fri, Oct 20, 2023 at 12:27:27PM +0100, Daniel Thompson wrote:
> > On Wed, Oct 18, 2023 at 11:07:41PM +0200, Uwe Kleine-König wrote:
> > > Hello Philipp,
> > >
> > > On Thu, Jun 08, 2023 at 04:11:14PM +0200, Philipp Zabel wrote:
> > > > The initial PWM state returned by pwm_init_state() has a duty cycle
> > > > of 0 ns.
> > >
> > > This is only true for drivers without a .get_state() callback, isn't it?
> >
> > pwm_init_state() explicitly zeros the duty-cycle in order to avoid
> > problems when the default args have a different period to the currently
> > applied config:
> > https://elixir.bootlin.com/linux/latest/source/include/linux/pwm.h#L174
>
> Ah right, pwm_init_state() is strange in a different way than I
> remembered :-) pwm_get_state() is only called to get .enabled set
> appropriately.
>
> Looking at the callers:
>
>  <snip>

>  - drivers/video/backlight/lm3630a_bl.c
>    explictily sets .enabled before calling pwm_apply_state()
>
>  - drivers/video/backlight/lp855x_bl.c
>    explictily sets .enabled before calling pwm_apply_state()
>
>  - drivers/video/backlight/pwm_bl.c
>    This is the one we currently discuss. I think even with the patch
>    applied it uses the .enabled value returned by pwm_init_state() but
>    it shouldn't.

Agreed.

> So all consumers using pwm_init_state() either don't use the .enabled
> value returned by pwm_init_state() or at least shouldn't do that.

Looking a little deeper in the PWM code, it looks to me like pwm_bl.c
could just use pwm_adjust_config() during probe to transition between
bootloader settings and kernel settings!


Daniel.
