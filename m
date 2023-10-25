Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7917D6791
	for <lists+dri-devel@lfdr.de>; Wed, 25 Oct 2023 11:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F7010E58F;
	Wed, 25 Oct 2023 09:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E0810E62F;
 Wed, 25 Oct 2023 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1698227607; bh=H1wJkMmM3RLGtqBxcD2SkPsFMAkzEk6Lnx1q4pd00ZY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Dp64/GGqXplxAhkDT3gedu+Sab+eb/+Hyj0bIZlSKcMYYtDGIKUDEQN6fzQa/xlWi
 o9URUD2793P3Pd8XVPtqKqWTRAWhOiLBqiz+Xj3KOS85yfdWFhDot+7gzeuGebU2Zt
 /vOhlmP3zxX9lj7KLBn6IJmZx0z20dln14S9n2x6Yzk09UxcjqI8woHLHXZemEA+ms
 G8jMY417JT8CLRviQBvZbEnnBRm31/RRtknULdvrSajNWMWruQnWO0D1WntEXQ4bp8
 kXnb1OiHoBPIJf1LDgFRQcbonrgHZyPUe6PZDp5u9XAfU2Yp3uI/3Mm8Uw7e0+5TWN
 CKIORt/Tz/lNg==
Received: by gofer.mess.org (Postfix, from userid 1000)
 id DD4071000FC; Wed, 25 Oct 2023 10:53:27 +0100 (BST)
Date: Wed, 25 Oct 2023 10:53:27 +0100
From: Sean Young <sean@mess.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Message-ID: <ZTjll7oTNVWqygbD@gofer.mess.org>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
 <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
 <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
 <20231023133417.GE49511@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023133417.GE49511@aspen.lan>
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

On Mon, Oct 23, 2023 at 02:34:17PM +0100, Daniel Thompson wrote:
> On Sun, Oct 22, 2023 at 11:46:22AM +0100, Sean Young wrote:
> > On Sat, Oct 21, 2023 at 11:08:22AM +0200, Hans de Goede wrote:
> > > On 10/19/23 12:51, Uwe Kleine-König wrote:
> > > > On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
> > > >> On 10/17/23 11:17, Sean Young wrote:
> > > > I think it's very subjective if you consider this
> > > > churn or not.
> > >
> > > I consider it churn because I don't think adding a postfix
> > > for what is the default/expected behavior is a good idea
> > > (with GPIOs not sleeping is the expected behavior).
> > >
> > > I agree that this is very subjective and very much goes
> > > into the territory of bikeshedding. So please consider
> > > the above my 2 cents on this and lets leave it at that.
> >
> > You have a valid point. Let's focus on having descriptive function names.
> 
> For a couple of days I've been trying to resist the bikeshedding (esp.
> given the changes to backlight are tiny) so I'll try to keep it as
> brief as I can:
> 
> 1. I dislike the do_it() and do_it_cansleep() pairing. It is
>    difficult to detect when a client driver calls do_it() by mistake.
>    In fact a latent bug of this nature can only be detected by runtime
>    testing with the small number of PWMs that do not support
>    configuration from an atomic context.
> 
>    In contrast do_it() and do_it_atomic()[*] means that although
>    incorrectly calling do_it() from an atomic context can be pretty
>    catastrophic it is also trivially detected (with any PWM driver)
>    simply by running with CONFIG_DEBUG_ATOMIC_SLEEP.
> 
>    No objections (beyond churn) to fully spelt out pairings such as
>    do_it_cansleep() and do_it_atomic()[*]!

I must say I do like the look of this. Uwe, how do you feel about:
pwm_apply_cansleep() and pwm_apply_atomic()? I know we've talked about
pwm_apply_atomic in the past, however I think this this the best 
option I've seen so far.

> 2. If there is an API rename can we make sure the patch contains no
>    other changes (e.g. don't introduce any new API in the same patch).
>    Seperating renames makes the patches easier to review!
>    It makes each one smaller and easier to review!

Yes, this should have been separated out. Will fix for next version.

Thanks,

Sean
