Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D2A7FD1BA
	for <lists+dri-devel@lfdr.de>; Wed, 29 Nov 2023 10:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DCD410E18D;
	Wed, 29 Nov 2023 09:08:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9F610E18D;
 Wed, 29 Nov 2023 09:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1701248932; bh=Xv3LVDjykwD/IOkFuRPxIVNxFelutLAZSXS7jeSQqIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BAZ/6qGNguReQ4NFwPXT8Bi2uaQNZ0Q93gRgXJPFRYxINiE+0NAHwqYEo8gcRktTI
 g5OWo09C5jJHok3S1c3vfX72MgTtnOlRCfK/TqM9Rhw5IHY9zlrMU0Lm6ESMeYefR5
 o0o+IWUBwaImm3Ew7Uz5W7jNB5PpjVR/Xzp9G3VEMAH3MPFJnFwTN5A/JF0jvSM53H
 TD72MGqWdop+SC6I4X83nrxxAJKPcPymeSSvEn8ptLrmEICedV7+oDpdhH/aFgVPau
 +Aaz/bRn6yA421udzBxvVtiTPtc21WHM3jUynkqXosp+xZ5HbIh4FPd2hzKqYs08uU
 fPTAj/lk7FXSA==
Received: by gofer.mess.org (Postfix, from userid 1000)
 id CB5B0100100; Wed, 29 Nov 2023 09:08:52 +0000 (GMT)
Date: Wed, 29 Nov 2023 09:08:52 +0000
From: Sean Young <sean@mess.org>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH v5 1/4] pwm: rename pwm_apply_state() to
 pwm_apply_cansleep()
Message-ID: <ZWb_pEixK07cRlnr@gofer.mess.org>
References: <cover.1700323916.git.sean@mess.org>
 <2b973840d800ffb71c2683c37bc996e0cf90a140.1700323916.git.sean@mess.org>
 <ZWClpnMRg_vjuI_R@orome.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZWClpnMRg_vjuI_R@orome.fritz.box>
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
 Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, linux-input@vger.kernel.org,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 24, 2023 at 02:31:18PM +0100, Thierry Reding wrote:
> On Sat, Nov 18, 2023 at 04:16:17PM +0000, Sean Young wrote:
> > In order to introduce a pwm api which can be used from atomic context,
> > we will need two functions for applying pwm changes:
> > 
> > 	int pwm_apply_cansleep(struct pwm *, struct pwm_state *);
> > 	int pwm_apply_atomic(struct pwm *, struct pwm_state *);
> > 
> > This commit just deals with renaming pwm_apply_state(), a following
> > commit will introduce the pwm_apply_atomic() function.
> 
> Sorry, I still don't agree with that _cansleep suffix. I think it's the
> wrong terminology. Just because something can sleep doesn't mean that it
> ever will. "Might sleep" is much more accurate because it says exactly
> what might happen and indicates what we're guarding against.

Sorry, I forgot about this in the last round. I've renamed it _might_sleep
in v6 which I'll post shortly.


Sean
