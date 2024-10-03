Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C772298F306
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 17:45:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3821110E898;
	Thu,  3 Oct 2024 15:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nKRgWD+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com
 [209.85.222.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D3D410E899
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 15:45:57 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id
 af79cd13be357-7a9a7bea3cfso76129185a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 08:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727970356; x=1728575156; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=L2nFqSHnerYWNOViSxQusgw7yMTCBN7rx6/Qgg/L014=;
 b=nKRgWD+GUDOAOiHS8PMlE0hvvM5fgaVD+sbDdfXjwGBHYgGPrUy5db88NEaHqt5MQT
 wI4DDIe1lI2yktii2xZdp2oQFgFyb8rgXbAuIxdBY5YK9fB7nmsLpoWInP/YBIXyw/0k
 S7nXeCNJbQFrIBHP9mFy4fT/CaKUYIzKhdc7HvmtgAIRcKMvlwx685MMW+t43E/4uRNL
 b3IPggP5F/RKzayqAZpI+AzAvPWp7bfhub/YWoFTKYI836h6GxSY/D1Ygiv0J/6QefBK
 N7E5jPmcoAlDr1LJsow4rQfftjYgE7Oluzjhyx4duzQf0b6e+wZS5O1Dc0sbaFsKpaqm
 rahw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727970356; x=1728575156;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L2nFqSHnerYWNOViSxQusgw7yMTCBN7rx6/Qgg/L014=;
 b=khQSriIvCZBiRhP9T7IctJqFXXZ7hqnjdMInN0UktM3bR6ZYRW+Umntk2yX5SwPo8H
 PwTisoOInnDae4m0g8OZaQOJz/4HIw4o7QADxeeaYT3X4K99BDUObfemvj7G/G5OH6i2
 QaX40DXwWqigXbkmr0b60Z6DSQhMO93n6U8GCUXqzj//a5NKJMI9i+OkLvRXHqqHkZ6R
 t9+Wn437ce2695WGDYjG1a7KmiaYeFbuOuYc1IOI3ge1XpB5m2EEo8L9pBQUCzL4TZc9
 cxn1UIdW1krrA//qOS7oUC01Fr4EtuFFWOFm/XHUDXrE7NQdqjYztwbkZNwgQH6k/W5I
 xYZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgKj/jpDNDNZAzRVeW7vl6zpFNkqRpgeajwGIxwtoc3vsmVUMHX8fSa5N1E3ndHgJv2eg1cqbn26o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxwVEbqoQI8mnBJFvJ34y7DOoYj/wXusiC8nQhUYHElbQ0pmcZB
 um0YuYeNgJb10L0achR3EeKCRm1NRNfoToNJdZGoDGpY5zl/a+YO
X-Google-Smtp-Source: AGHT+IHZBTbeMUL5KqSIdlIsTi4jsvld9rbEJPgXHMZ4S9+FWr6RXYwMwnLXLpDeQReSAPIV3rqe0w==
X-Received: by 2002:a05:620a:470f:b0:7a3:785a:dc1c with SMTP id
 af79cd13be357-7ae62727a6amr1128481685a.50.1727970355946; 
 Thu, 03 Oct 2024 08:45:55 -0700 (PDT)
Received: from VM-Arch ([2600:1001:b14f:5ed5:a130:4dde:abcd:f635])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7ae6b1409dbsm61011385a.0.2024.10.03.08.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Oct 2024 08:45:55 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:45:51 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v8 0/2] Add driver for Sharp Memory LCD
Message-ID: <seex6vou5hig2qguejt7hfi5s5muikxch64f2d5fh2kcbs4tau@332xy75kvobl>
References: <20241002033807.682177-1-lanzano.alex@gmail.com>
 <t4lefcykpoe5i36wb4x5u23sseh6drnphtivuqc3mjviat2vvc@7hg4jyhxvpye>
 <ees3m2qmazah2547ys62zvbrvo4dsgki2z2jwulwz4dfjtm4hk@kpmlapv6occv>
 <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <q53inyaxyvfib7okxzazepxzarqmq4rubbasumvvx2woioyp42@fbtn4poujsyh>
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

On Thu, Oct 03, 2024 at 11:27:43AM GMT, Uwe Kleine-König wrote:
> Hello Alex,
> 
> On Wed, Oct 02, 2024 at 10:33:13PM -0400, Alex Lanzano wrote:
> > On Wed, Oct 02, 2024 at 09:56:38AM GMT, Uwe Kleine-König wrote:
> > > On Tue, Oct 01, 2024 at 11:37:35PM -0400, Alex Lanzano wrote:
> > > > Changes in v8:
> > > > - Addressed review comments from Uwe
> > > >     - Replace pwm_get_state with pwm_init_state
> > > >     - Use pwm_set_relative_duty_cycle instead of manually setting period and duty cycle
> > > 
> > > You didn't explicitly mention that it's fine if the PWM doesn't emit the
> > > inactive state when you call pwm_disable(). You're code should continue
> > > to work if you drop all calls to pwm_disable().
> > > 
> > > Ideally you mention that in a code comment to make others reading your
> > > code understand that.
> > 
> > Sorry about that! The intent of the code is to stop the pwm from outputing
> > when the display is disabled since the signal is no longer needed. If
> > it's best to emit the inactive state rather than calling pwm_disable()
> > I'm fine with making that change.
> 
> Calling pwm_disable() is best iff you don't care about the output any
> more. If however you rely on it to emit the inactive level,
> pwm_disable() is wrong. I don't know enough about your display to judge
> from here.
> 
> The code to disable the display looks (simplified) as follows:
> 
> 	if (smd->enable_gpio)
> 		gpiod_set_value(smd->enable_gpio, 0);
> 
> 	pwm_disable(smd->pwm_vcom_signal);
> 
> so maybe the logic you need is:
> 
> 	if (smd->enable_gpio) {
> 		gpiod_set_value(smd->enable_gpio, 0);
> 
> 		/*
> 		 * In the presence of a GPIO to disable the display the
> 		 * behaviour of the PWM doesn't matter and we can
> 		 * just disable it.
> 		 */
> 		pwm_disable(smd->pwm_vcom_signal);
> 	} else {
> 		struct pwm_state state;
> 
> 		/*
> 		 * However without a GPIO driving the display's output
> 		 * enable pin the PWM must emit the inactive level,
> 		 * which isn't guaranteed when calling pwm_disable(), so
> 		 * configure it for duty_cycle = 0.
> 		 */
> 		 pwm_init_state(smd->pwm_vcom_signal, &state);
> 		 state.duty_cycle = 0;
> 		 state.enabled = true;
> 		 pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);
> 	}
> 

Ahh, understood. I looked over the datasheet again. It looks like in the
case where no enable gpio pin is defined we'll need to keep the pwm pulsing
since display hardware would still be enabled.

I'll fix this up in the disable and probe functions.

Best regards,
Alex

