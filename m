Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5097D382A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 15:34:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F90910E0D4;
	Mon, 23 Oct 2023 13:34:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85D710E0D4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 13:34:21 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40837ebba42so24381525e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 06:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698068060; x=1698672860; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ufOU/q/Ep1kAY17X99uhm7aprCNDlkkpHRrj3TivtTs=;
 b=H7WvVF75IM5WPe+q3Tb5+oThUtgadDKn6Bk3uy7WYZvpyTRccbT9J9J77UrvGvL+dy
 gvT8O420safmOda7ILkDkWzAo7c7loO5ZV8Jyrn0AFsnDdGQJ+hkjpb4p8zj+UvRuvXo
 X4QRYICeWK8GGi6luiuE0cMJf5mu/XEF8+5CD2KGfQfWAkO3t4/ywL0noIPuri+F0yfN
 FV1aXeUnTB1iXXcStB+bK4OtW7hqHAIpitUMTL5vwWDoNJ+6MiBgEdV1guwZHE31q8p3
 LAgViSIplfnCHqMBk/vz5mwzb9mbkl7Yb9BV56YDP554bThDJBRS4FaM/dqCe6QaZxy/
 hXQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698068060; x=1698672860;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ufOU/q/Ep1kAY17X99uhm7aprCNDlkkpHRrj3TivtTs=;
 b=LIiY4SytQsTNv3CPMKs2xbWXlq6Ln5TsWROFT3zh+HE9ZaTdJW24GtFT3Eo8u0yaZU
 guzb+7iebLVTQI0MUqJFBthEvxlwjGDIC2ZiZUJm5ZWr7qUN1LXMs4pmDWlBwtu/TmTA
 LI97E9y/tp43lrRWFlzBcceHxWHLrCwGb1PEBgLEurz7juETJ/giPtKgCm6f4PB+WoOZ
 vWLRkSkPseWu7dq70OA/5KyiZO0dlR0G3KGf0Njj4qSg/U6wLb9A/YaPNRYHsqKSUn5T
 Vo6oz8T2m9omvxjx3Aw/wr7tDD6wg7AXrr0Qg4Z+e9Oo5iu4p7KEFZwpMMxcT7OrBBlT
 +PDA==
X-Gm-Message-State: AOJu0YyEmBHK03wh6KX4v1Rquk+74x29G3DwFywmN4F94C0RNuNH1Esg
 D6xtJusYX5S8VyMBqGkkooFTVg==
X-Google-Smtp-Source: AGHT+IHwl+E4YFajmY7IWxRpWgtSmDl22RT8PM7nnOAmIYDUhgS2AbK4FuptOkLbmHVvg59kegsf/Q==
X-Received: by 2002:a05:600c:35c5:b0:405:4002:825a with SMTP id
 r5-20020a05600c35c500b004054002825amr7494266wmq.13.1698068059941; 
 Mon, 23 Oct 2023 06:34:19 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 1-20020a05600c028100b004077219aed5sm14125564wmk.6.2023.10.23.06.34.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 06:34:19 -0700 (PDT)
Date: Mon, 23 Oct 2023 14:34:17 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Message-ID: <20231023133417.GE49511@aspen.lan>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
 <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
 <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
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
Cc: linux-fbdev@vger.kernel.org, linux-doc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 linux-leds@vger.kernel.org, Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, intel-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 22, 2023 at 11:46:22AM +0100, Sean Young wrote:
> Hi Hans,
>
> On Sat, Oct 21, 2023 at 11:08:22AM +0200, Hans de Goede wrote:
> > On 10/19/23 12:51, Uwe Kleine-König wrote:
> > > On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
> > >> On 10/17/23 11:17, Sean Young wrote:
> > > I think it's very subjective if you consider this
> > > churn or not.
> >
> > I consider it churn because I don't think adding a postfix
> > for what is the default/expected behavior is a good idea
> > (with GPIOs not sleeping is the expected behavior).
> >
> > I agree that this is very subjective and very much goes
> > into the territory of bikeshedding. So please consider
> > the above my 2 cents on this and lets leave it at that.
>
> You have a valid point. Let's focus on having descriptive function names.

For a couple of days I've been trying to resist the bikeshedding (esp.
given the changes to backlight are tiny) so I'll try to keep it as
brief as I can:

1. I dislike the do_it() and do_it_cansleep() pairing. It is
   difficult to detect when a client driver calls do_it() by mistake.
   In fact a latent bug of this nature can only be detected by runtime
   testing with the small number of PWMs that do not support
   configuration from an atomic context.

   In contrast do_it() and do_it_atomic()[*] means that although
   incorrectly calling do_it() from an atomic context can be pretty
   catastrophic it is also trivially detected (with any PWM driver)
   simply by running with CONFIG_DEBUG_ATOMIC_SLEEP.

   No objections (beyond churn) to fully spelt out pairings such as
   do_it_cansleep() and do_it_atomic()[*]!


2. If there is an API rename can we make sure the patch contains no
   other changes (e.g. don't introduce any new API in the same patch).
   Seperating renames makes the patches easier to review!
   It makes each one smaller and easier to review!


Daniel.


[*] or do_it_nosleep()... etc.
