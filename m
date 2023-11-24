Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4917F751B
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 14:31:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C0910E7F5;
	Fri, 24 Nov 2023 13:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7036A10E7F9;
 Fri, 24 Nov 2023 13:31:23 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-9fa2714e828so265504466b.1; 
 Fri, 24 Nov 2023 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700832682; x=1701437482; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xqoNh8/DGOCDjWGBAsyHy8zDaolvBGz6WR/aPalN8vA=;
 b=QAVG8yJMQzJ6QBYJJBwssQ8P2t99Pvyle9PL0cqtH5MRsbbIZxFE29AoKDrecW2mqu
 oIxez7ZGfHf1uIwY7sw266suAQi5xaj0nAjP/zWrp98u8Ek9c1bi1m1uR4ZgQx+4+QGu
 vwwhxzuBrs5NxzXDU7aSxWRFvqx+/ZTrflmwM7n8OEkC7LZxq46BqQkv76Kt/QbU+CO3
 20BDQfZhcH3usk0lhEIrFsGZ9d65edSmzD6d4v7LQXBhPCKAlSHg1EHFOhm5hRCwRlLN
 JF3nxxfSFSXF/NHbRYrtqhbdG7dx4CjWFVWCLn2FNezwOKUQBWooDwyfcLEu4PQvpysh
 nXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700832682; x=1701437482;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xqoNh8/DGOCDjWGBAsyHy8zDaolvBGz6WR/aPalN8vA=;
 b=wHhTLd5zz9Hb3nroK/Q6KtRAcQmxkmR44KFJdd/45yxpfkmF8rj9Ic0XvOsljONqF+
 y1LOZh4J5yH6C+XnkztV+M+7nDFSM0d5N8Zf1zUqy8AbtMwerjcg+YKsbq5zhUIRo5H4
 lyDgNTeS0imTvvp7qPfXjPxAoqYJyks3BQ0OyuJpkDh6znvOywH82IrJS1SmExPmRo+E
 SMQq+OKU3xmGAutTYTdMDUJpHdDePl/PilvnLNOlSlA3Gb2f5IkLeytxZ8S0Gta9ezaE
 xLzjSYP+s/WIK6YuxTb7wEKuBOlPx216QlCXLOPqGebCMhGkIuU72xa05eVdIOyPYgmw
 SvUw==
X-Gm-Message-State: AOJu0YxUATBpmLJfxqNwpaXhaoii1U332tW/C6XQitxjGg1i88RWVbFa
 +B9Ho8lyKuvBkJ0G//YsdaU=
X-Google-Smtp-Source: AGHT+IF2CMWqW6QgTEUE8dPizHd4yGlrN9Vk/VgdOvaxxbdjXw50mDYgNNx7FjDnvVExXduvtyJWvw==
X-Received: by 2002:a17:906:5da:b0:a03:a857:c6e0 with SMTP id
 t26-20020a17090605da00b00a03a857c6e0mr1663923ejt.77.1700832681495; 
 Fri, 24 Nov 2023 05:31:21 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 c24-20020a170906529800b009fe2f96ee9bsm2064075ejm.8.2023.11.24.05.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 05:31:21 -0800 (PST)
Date: Fri, 24 Nov 2023 14:31:18 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Sean Young <sean@mess.org>
Subject: Re: [PATCH v5 1/4] pwm: rename pwm_apply_state() to
 pwm_apply_cansleep()
Message-ID: <ZWClpnMRg_vjuI_R@orome.fritz.box>
References: <cover.1700323916.git.sean@mess.org>
 <2b973840d800ffb71c2683c37bc996e0cf90a140.1700323916.git.sean@mess.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="mURPCj0PduVIws0V"
Content-Disposition: inline
In-Reply-To: <2b973840d800ffb71c2683c37bc996e0cf90a140.1700323916.git.sean@mess.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
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
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
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


--mURPCj0PduVIws0V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 18, 2023 at 04:16:17PM +0000, Sean Young wrote:
> In order to introduce a pwm api which can be used from atomic context,
> we will need two functions for applying pwm changes:
>=20
> 	int pwm_apply_cansleep(struct pwm *, struct pwm_state *);
> 	int pwm_apply_atomic(struct pwm *, struct pwm_state *);
>=20
> This commit just deals with renaming pwm_apply_state(), a following
> commit will introduce the pwm_apply_atomic() function.

Sorry, I still don't agree with that _cansleep suffix. I think it's the
wrong terminology. Just because something can sleep doesn't mean that it
ever will. "Might sleep" is much more accurate because it says exactly
what might happen and indicates what we're guarding against.

Thierry

--mURPCj0PduVIws0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVgpaQACgkQ3SOs138+
s6HS8A/7BjtLlUH5CMfFlBTprZQsDfOXKtQTFT7vSIrS5EOAuemIkCNWaesc5juC
gFpHk93q2Y8+pTg499tii+Ztr7m6Z00sAA8fpGEFwUn03iU9qrrC6/7gwVu8Dsjv
m326JeQsUo8SL3s5JqH7vKQDUU0agG/rMAFwo5nIzD5xRGmtg1VB+Vg57/T0K4a4
W99vEqpxwYAZLNQeId2ZTCZHREypDELrwcq0l0JYOOXdsvYa4r34dPep1KDfTvxK
p6fGafsCc1qJ8S9ygxlTGPv/5+56JXyOEB75XXxBK2QaqEz9iHPxgfJsHz7K3DFx
cpZtcEd899PpMbAiW5fag0BJcnUNffFf4CoZU34H8MPsp4DzKs7UvJlbQ79KNz6N
VIjXUsk876G5NuLjwomvkmaxx1cQPbom4YknTav6Zm5dloV36kppnYuZ9+PV8NlW
uudn06BsR8Yp7d2hpCHK6Vou1zbJtQHxQosq3e4e11mnMXxpnftSCuWZCeUedAhG
zufpjdOkX1q24J9odZWGWz8rhGWgJUwtIpF8SOkPromrYAxZK+yJAb7AvepYNQNh
i3X0j8HUnYCWUx7ty20NjF5rVY/GJh5DXncoB5cQqVlLCr8YUvFsOQ9YaUuFa/J5
M/YrTcS9Bi0p3ps9qE3ec5+WY2E85s4+KeG0Z0/GD1ifS+r4fls=
=1cUS
-----END PGP SIGNATURE-----

--mURPCj0PduVIws0V--
