Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555197D22B9
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 12:46:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B703410E0A2;
	Sun, 22 Oct 2023 10:46:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 856D210E0A2;
 Sun, 22 Oct 2023 10:46:25 +0000 (UTC)
Received: by gofer.mess.org (Postfix, from userid 1000)
 id D8A1B1000C2; Sun, 22 Oct 2023 11:46:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1697971582; bh=M7VN2YhQWSJtc+cSbcBrFFqz4ksGBErewDtODBR+VmQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PnkeoM8N5hx3qaBdVrilN+IynCjwmnKapSBqWSB45BWsAOSWpe9KHkQL7YRUItROr
 uFFPdvWk5lPhVQZxkVPRIaXgmqXs5imsVOrfbNzr5SBcKWaRO5NjsdhW+dKKt0doQr
 3DAVaG99NhZHD/hnZrszsAFvfJtR67PqtTFmJoYnWTftElP9OkThhD2tWRha7fvs8a
 uxartmlQT+FrRCB22IFFzoAVGTPJxSFN0LoAu+pErhIX/fOe4iEuwaiS1+SInLIjX5
 FNm6tT+kFdl8LjG7e2h3VQmVvNxQ5cWMhDZanSX1IXvB61OLWDZ1uWOfUk78WcLfaV
 kudis//kekD/A==
Date: Sun, 22 Oct 2023 11:46:22 +0100
From: Sean Young <sean@mess.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 1/3] pwm: make it possible to apply pwm changes in
 atomic context
Message-ID: <ZTT9fvEF+lqfzGJ/@gofer.mess.org>
References: <cover.1697534024.git.sean@mess.org>
 <a7fcd19938d5422abc59c968ff7b3d5c275577ed.1697534024.git.sean@mess.org>
 <90728c06-4c6c-b3d2-4723-c24711be2fa5@redhat.com>
 <20231019105118.64gdzzixwqrztjir@pengutronix.de>
 <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <01a505ac-320f-3819-a58d-2b82c1bf2a86@redhat.com>
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
 linux-leds@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, intel-gfx@lists.freedesktop.org,
 linux-input@vger.kernel.org, Mark Gross <markgross@kernel.org>,
 Mark Brown <broonie@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Sat, Oct 21, 2023 at 11:08:22AM +0200, Hans de Goede wrote:
> On 10/19/23 12:51, Uwe Kleine-König wrote:
> > On Wed, Oct 18, 2023 at 03:57:48PM +0200, Hans de Goede wrote:
> >> On 10/17/23 11:17, Sean Young wrote:
> >>> Some drivers require sleeping, for example if the pwm device is connected
> >>> over i2c. The pwm-ir-tx requires precise timing, and sleeping causes havoc
> >>> with the generated IR signal when sleeping occurs.
> >>>
> >>> This patch makes it possible to use pwm when the driver does not sleep,
> >>> by introducing the pwm_can_sleep() function.
> >>>
> >>> Signed-off-by: Sean Young <sean@mess.org>
> >>
> >> I have no objection to this patch by itself, but it seems a bit
> >> of unnecessary churn to change all current callers of pwm_apply_state()
> >> to a new API.
> > 
> > The idea is to improve the semantic of the function name, see
> > https://lore.kernel.org/linux-pwm/20231013180449.mcdmklbsz2rlymzz@pengutronix.de
> > for more context.
> 
> Hmm, so the argument here is that the GPIO API has this, but GPIOs
> generally speaking can be set atomically, so there not being able
> to set it atomically is special.
> 
> OTOH we have many many many other kernel functions which may sleep
> and we don't all postfix them with _can_sleep.
> 
> And for PWM controllers pwm_apply_state is IMHO sorta expected to
> sleep. Many of these are attached over I2C so things will sleep,
> others have a handshake to wait for the current dutycycle to
> end before you can apply a second change on top of an earlier
> change during the current dutycycle which often also involves
> sleeping.
> 
> So the natural/expeected thing for pwm_apply_state() is to sleep
> and thus it does not need a postfix for this IMHO.

Most pwm drivers look like they can be made to work in atomic context,
I think. Like you say this is not the case for all of them. Whatever
we choose to be the default for pwm_apply_state(), we should have a
clear function name for the alternative. This is essentially why
pam_apply_cansleep() was picked.

The alternative to pwm_apply_cansleep() is to have a function name
which implies it can be used from atomic context. However, 
pwm_apply_atomic() is not great because the "atomic" could be
confused with the PWM atomic API, not the kernel process/atomic
context.

So what should the non-sleeping function be called then? 
 - pwm_apply_cannotsleep() 
 - pwm_apply_nosleep()
 - pwm_apply_nonsleeping()
 - pwm_apply_atomic_context()

> > I think it's very subjective if you consider this
> > churn or not.
> 
> I consider it churn because I don't think adding a postfix
> for what is the default/expected behavior is a good idea
> (with GPIOs not sleeping is the expected behavior).
> 
> I agree that this is very subjective and very much goes
> into the territory of bikeshedding. So please consider
> the above my 2 cents on this and lets leave it at that.

You have a valid point. Let's focus on having descriptive function names.

> > While it's nice to have every caller converted in a single
> > step, I'd go for
> > 
> > 	#define pwm_apply_state(pwm, state) pwm_apply_cansleep(pwm, state)
> > 
> > , keep that macro for a while and convert all users step by step. This
> > way we don't needlessly break oot code and the changes to convert to the
> > new API can go via their usual trees without time pressure.
> 
> I don't think there are enough users of pwm_apply_state() to warrant
> such an exercise.
> 
> So if people want to move ahead with the _can_sleep postfix addition
> (still not a fan) here is my acked-by for the drivers/platform/x86
> changes, for merging this through the PWM tree in a single commit:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>

Thanks,

Sean
