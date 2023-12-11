Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAC880C332
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:30:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AFE210E35D;
	Mon, 11 Dec 2023 08:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C66010E35D;
 Mon, 11 Dec 2023 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
 t=1702283410; bh=bMk50ArkFZn/A6zyDTd+gORFOrRBh0Vv7u/HdHRDSdQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GlrMhEoMcOOmT9hZVPZID5jh68eRiPW06fPO3FGYZ1O+ZkJhZ5iYrEyZli7NmY3Jb
 mP6E5Y/RsBzD8XmsI0DeRez1i3fS5OY4s4i3iL5i3Up4IhuIph5zCkc2KO42esii6L
 vIeS7eQJwbupke3WsUAoWi+TWJnbLT2PFJXpTGsgmlofKXYcdyDgLVwZv2+PY2kBQP
 EhFFrETlCgHvrzyXGKVjF/TNO3GPfFI0OhBjaAdUZb7jPqcgSAXUyBNLE6S6OIMLF9
 sOuJCffDus+Qy6X/clIMoJnbtuOg5ihgJL7dWMQOPy0Jk4c0FuC3BPGCYpx36iuzpm
 xfRjdtTrrqIKA==
Received: by gofer.mess.org (Postfix, from userid 1000)
 id 9DCBD10008F; Mon, 11 Dec 2023 08:30:10 +0000 (GMT)
Date: Mon, 11 Dec 2023 08:30:10 +0000
From: Sean Young <sean@mess.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 1/4] pwm: rename pwm_apply_state() to
 pwm_apply_might_sleep()
Message-ID: <ZXbIknpNVxb5Mh2B@gofer.mess.org>
References: <cover.1701248996.git.sean@mess.org>
 <37090c1d8d8f42f1e12fa84942027d995189a99e.1701248996.git.sean@mess.org>
 <20231209135742.3ieusuq3h3xlvjfn@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231209135742.3ieusuq3h3xlvjfn@pengutronix.de>
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
 linux-input@vger.kernel.org,
 Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Guenter Roeck <linux@roeck-us.net>, linux-media@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx@lists.freedesktop.org, Mark Gross <markgross@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Jingoo Han <jingoohan1@gmail.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 09, 2023 at 02:57:42PM +0100, Uwe Kleine-König wrote:
> On Wed, Nov 29, 2023 at 09:13:34AM +0000, Sean Young wrote:
> > In order to introduce a pwm api which can be used from atomic context,
> > we will need two functions for applying pwm changes:
> > 
> > 	int pwm_apply_might_sleep(struct pwm *, struct pwm_state *);
> > 	int pwm_apply_atomic(struct pwm *, struct pwm_state *);
> > 
> > This commit just deals with renaming pwm_apply_state(), a following
> > commit will introduce the pwm_apply_atomic() function.
> > 
> > Acked-by: Hans de Goede <hdegoede@redhat.com>
> > Acked-by: Jani Nikula <jani.nikula@intel.com>
> > Acked-by: Lee Jones <lee@kernel.org>
> > Signed-off-by: Sean Young <sean@mess.org>
> 
> Not a in-detail-review, but I just noticed again, that we have
> 
> 	K:      pwm_(config|apply_state|ops)
> 
> in MAINTAINERS. That one needs adaption, too.

Fixed in v7.

Thanks,

Sean
