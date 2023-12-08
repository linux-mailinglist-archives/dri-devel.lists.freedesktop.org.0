Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B52EA80A7B5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Dec 2023 16:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B70210E291;
	Fri,  8 Dec 2023 15:41:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C6A10E291
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Dec 2023 15:41:43 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-50bffb64178so2613929e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Dec 2023 07:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702050102; x=1702654902; darn=lists.freedesktop.org;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRlnGJEkFIcfd0ts9iL+JgmFXWbUsRLWy8OoDP8slcg=;
 b=RoYcujtkO1jt7d6rKtS83oKtLnhwR93x4AYYMXxC00eswjJwUPNBNhQXIjPhEyfHrz
 b0c89aGTe9nFV87giWWiNiXbtkypKKk7aeOPqE4XbkOwUU8cGgkuwtFFW9la2KjSTX85
 mG/2GnEtwJlRtSkSBH+uNtZ5Z7swYasHtWXo/julA83UtD/fvoFyTjcF078PVgD2ukTh
 fkmZcTSyKKXpduv31ryN7j+OpBldL9lLYlmfMB5w+Ie529jFEqa+oWxwzmC87VXcUArB
 oI9T79Q53LT3DFWyz8NCWgLjiqdcw2yxodRtkLgxpUaRobyudsLBCypR6FmbAdXZfSkY
 z/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702050102; x=1702654902;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cRlnGJEkFIcfd0ts9iL+JgmFXWbUsRLWy8OoDP8slcg=;
 b=u/Aa+Hykn7dXV9eU4O+ozhlbUbCsWGv8pKOxoTfy2qw3x0gdiuiTN7O8yIdJhPKc/n
 G4ZTo7uAxN75R34DJXeYgFGnhX0xDWIOhDcgxj0MWJIC9CMaUCl64qlapY8iWnOGzwI6
 2RWxe8rblOGdEOSID6P9ZnLuOYTXpV4hRP5pStEdXqEY5NUtG1j1Jm8bsxzIWh/yFsPe
 ZSghBtRcXPk9PvoEEXqkC3QutPrZvYrL3iqat+MxXq/NbYaFL3P/PDWGHqs2QUr3INDr
 LEEqp0/2CPXhdFgWSAken7TgeVLSGiS6XtNTqXfsFppG+BR3qfK0ZpFdhEq6aLj0XY5g
 3GeQ==
X-Gm-Message-State: AOJu0YyQ5MqQzgTf4ljM7MlDm17jO9NZAgCC3bAiw84C5kouOEChPSUv
 B0jTOJHE3YtzUSPOMZ1T63k=
X-Google-Smtp-Source: AGHT+IEHvvivMrMEsqaadjTEm0jRz5FdwBxUwTyoy0Lb+gicVsDBp5J9v9Xf1tREIFC1dohGsxxhnw==
X-Received: by 2002:ac2:5f8a:0:b0:50b:f2fb:6cd1 with SMTP id
 r10-20020ac25f8a000000b0050bf2fb6cd1mr56655lfe.85.1702050101442; 
 Fri, 08 Dec 2023 07:41:41 -0800 (PST)
Received: from orome.fritz.box
 (p200300e41f0fa600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f0f:a600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 ry9-20020a1709068d8900b00a1f7470ba93sm484392ejc.200.2023.12.08.07.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Dec 2023 07:41:40 -0800 (PST)
Date: Fri, 8 Dec 2023 16:41:39 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
Message-ID: <ZXM4CdJxg-XrYhkn@orome.fritz.box>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="LrjlwOpGpnIWr8uG"
Content-Disposition: inline
In-Reply-To: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
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
Cc: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org,
 greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 asahi@lists.linux.dev, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--LrjlwOpGpnIWr8uG
Content-Type: multipart/mixed; boundary="c3LD4v5RpdMiGBYB"
Content-Disposition: inline


--c3LD4v5RpdMiGBYB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 06, 2023 at 12:43:14PM +0100, Uwe Kleine-K=C3=B6nig wrote:
> Hello,
>=20
> This series is based on Thierry's for-next.
>=20
> It starts with some cleanups that were all sent out separately already:
>=20
>  - "pwm: Reduce number of pointer dereferences in pwm_device_request()"
>    https://lore.kernel.org/linux-pwm/20231130072105.966848-1-u.kleine-koe=
nig@pengutronix.de
>  - "pwm: crc: Use consistent variable naming for driver data"
>    https://lore.kernel.org/linux-pwm/20231130074133.969806-1-u.kleine-koe=
nig@pengutronix.de
>  - Two leds/qcom-lpg patches
>    https://lore.kernel.org/linux-leds/20231126095230.683204-1-u.kleine-ko=
enig@pengutronix.de
>    Lee already claimed to have taken the series already, but it's not yet=
 in
>    next.
>  - "leds: qcom-lpg: Introduce a wrapper for getting driver data from a pw=
m chip"
>    https://lore.kernel.org/linux-leds/20231124215208.616551-3-u.kleine-ko=
enig@pengutronix.de
>=20
> In the following patches I changed:
>=20
>  - "pwm: cros-ec: Change prototype of helper to prepare further changes" +
>    This was simplified in response to feedback by Tzung-Bi Shih
>  - Make pwmchip_priv() static (and don't export it), let drivers use a new
>    pwmchip_get_drvdata() instead.
>  - For drm/ti-sn65dsi86.c and leds/qcom-lpg make use of
>    pwmchip_set_drvdata() which makes the conversion to
>    devm_pwmchip_alloc() much prettier.
>  - Some cleanups here and there
>  - Add review tags received in v3
>    I kept all tags even though the pwmchip_alloc() patches changed
>    slightly. Most of the time that's only
>    s/pwmchip_priv/pwmchip_get_drvdata/ though. Still, if you object,
>    just tell me. (This affects Paul Cercueil on patch #68, Conor Dooley
>    on patch #76 and Greg for patch #109.)
>=20
> I kept the pwmchip_alloc() + pwmchip_register() approach despite Bart
> not liking it. To balance that out I don't like Bart's alternative
> approach. There are no technically relevant differences between the two
> approaches and no benchmarks that show either of the two to be better
> than the other. Conceptually the design ideas around pwmchip_alloc() +
> pwmchip_register() are used in several other subsystems, so it's a
> proven way to do things.

[Trimming the recipients, keeping only Bart and the mailing lists.]

I do think there are technically relevant differences. For one, the
better we isolate the internal data structure, the easier this becomes
to manage. I'm attaching a patch that I've prototyped which should
basically get us to somewhere around patch 110 of this series but with
something like 1/8th of the changes. It doesn't need every driver to
change and (mostly) decouples driver code from the core code.

Now, I know that you think this is all bad because it's not a single
allocation, but I much prefer the end result because it's got the driver
and internals much more cleanly separated. Going forward I think it
would be easier to apply all the ref-counting on top of that because we
only need to keep the PWM framework-internal data structure alive after
a PWM chip has gone away.

Thierry

--c3LD4v5RpdMiGBYB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline;
	filename="0001-pwm-Isolate-internal-data-into-a-separate-structure.patch"
Content-Transfer-Encoding: quoted-printable

=46rom 72ea79887d96850f9ccc832ce52b907ca276c940 Mon Sep 17 00:00:00 2001
=46rom: Thierry Reding <thierry.reding@gmail.com>
Date: Tue, 28 Nov 2023 15:42:39 +0100
Subject: [PATCH] pwm: Isolate internal data into a separate structure

In order to prepare for proper reference counting of PWM chips and PWM
devices, move the internal data from the public PWM chip to a private
PWM chip structure. This ensures that the data that the subsystem core
may need to reference later on can stick around beyond the lifetime of
the driver-private data.

Signed-off-by: Thierry Reding <thierry.reding@gmail.com>
---
 drivers/pwm/core.c            | 185 +++++++++++++++++++++-------------
 drivers/pwm/internal.h        |  38 +++++++
 drivers/pwm/pwm-atmel-hlcdc.c |   8 +-
 drivers/pwm/pwm-fsl-ftm.c     |   6 +-
 drivers/pwm/pwm-lpc18xx-sct.c |   4 +-
 drivers/pwm/pwm-lpss.c        |  14 +--
 drivers/pwm/pwm-pca9685.c     |   6 +-
 drivers/pwm/pwm-samsung.c     |   6 +-
 drivers/pwm/pwm-sifive.c      |   4 +-
 drivers/pwm/pwm-stm32-lp.c    |   6 +-
 drivers/pwm/pwm-stm32.c       |   6 +-
 drivers/pwm/pwm-tiecap.c      |   6 +-
 drivers/pwm/pwm-tiehrpwm.c    |   6 +-
 drivers/pwm/sysfs.c           |  48 ++++-----
 include/linux/pwm.h           |  26 +----
 15 files changed, 228 insertions(+), 141 deletions(-)
 create mode 100644 drivers/pwm/internal.h

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index f60b715abe62..54d57dec6dce 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -24,17 +24,19 @@
 #define CREATE_TRACE_POINTS
 #include <trace/events/pwm.h>
=20
+#include "internal.h"
+
 static DEFINE_MUTEX(pwm_lookup_lock);
 static LIST_HEAD(pwm_lookup_list);
=20
-/* protects access to pwmchip_idr */
+/* protects access to pwm_chips */
 static DEFINE_MUTEX(pwm_lock);
=20
-static DEFINE_IDR(pwmchip_idr);
+static DEFINE_IDR(pwm_chips);
=20
 static struct pwm_chip *pwmchip_find_by_name(const char *name)
 {
-	struct pwm_chip *chip;
+	struct pwm_chip_private *priv;
 	unsigned long id, tmp;
=20
 	if (!name)
@@ -42,12 +44,12 @@ static struct pwm_chip *pwmchip_find_by_name(const char=
 *name)
=20
 	mutex_lock(&pwm_lock);
=20
-	idr_for_each_entry_ul(&pwmchip_idr, chip, tmp, id) {
-		const char *chip_name =3D dev_name(chip->dev);
+	idr_for_each_entry_ul(&pwm_chips, priv, tmp, id) {
+		const char *chip_name =3D dev_name(priv->chip->dev);
=20
 		if (chip_name && strcmp(chip_name, name) =3D=3D 0) {
 			mutex_unlock(&pwm_lock);
-			return chip;
+			return priv->chip;
 		}
 	}
=20
@@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(const char=
 *name)
=20
 static int pwm_device_request(struct pwm_device *pwm, const char *label)
 {
+	struct pwm_chip *chip =3D pwm->priv->chip;
 	int err;
=20
 	if (test_bit(PWMF_REQUESTED, &pwm->flags))
 		return -EBUSY;
=20
-	if (!try_module_get(pwm->chip->owner))
+	if (!try_module_get(pwm->priv->owner))
 		return -ENODEV;
=20
-	if (pwm->chip->ops->request) {
-		err =3D pwm->chip->ops->request(pwm->chip, pwm);
+	if (chip->ops->request) {
+		err =3D chip->ops->request(chip, pwm);
 		if (err) {
-			module_put(pwm->chip->owner);
+			module_put(pwm->priv->owner);
 			return err;
 		}
 	}
=20
-	if (pwm->chip->ops->get_state) {
+	if (chip->ops->get_state) {
 		/*
 		 * Zero-initialize state because most drivers are unaware of
 		 * .usage_power. The other members of state are supposed to be
@@ -84,7 +87,7 @@ static int pwm_device_request(struct pwm_device *pwm, con=
st char *label)
 		 */
 		struct pwm_state state =3D { 0, };
=20
-		err =3D pwm->chip->ops->get_state(pwm->chip, pwm, &state);
+		err =3D chip->ops->get_state(chip, pwm, &state);
 		trace_pwm_get(pwm, &state, err);
=20
 		if (!err)
@@ -196,6 +199,64 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
 	return true;
 }
=20
+static struct pwm_chip_private *pwmchip_alloc(struct pwm_chip *chip,
+					      struct module *owner)
+{
+	struct pwm_chip_private *priv;
+	struct pwm_device *pwm;
+	unsigned int i;
+	int err;
+
+	priv =3D kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return ERR_PTR(-ENOMEM);
+
+	priv->pwms =3D kcalloc(chip->npwm, sizeof(*pwm), GFP_KERNEL);
+	if (!priv->pwms) {
+		err =3D -ENOMEM;
+		goto free;
+	}
+
+	priv->owner =3D owner;
+	priv->chip =3D chip;
+
+	for (i =3D 0; i < chip->npwm; i++) {
+		struct pwm_device *pwm =3D &priv->pwms[i];
+
+		pwm->priv =3D priv;
+		pwm->hwpwm =3D i;
+	}
+
+	mutex_lock(&pwm_lock);
+
+	err =3D idr_alloc(&pwm_chips, priv, 0, 0, GFP_KERNEL);
+	if (err < 0) {
+		mutex_unlock(&pwm_lock);
+		goto free;
+	}
+
+	mutex_unlock(&pwm_lock);
+
+	priv->id =3D err;
+
+	return priv;
+
+free:
+	kfree(priv->pwms);
+	kfree(priv);
+	return ERR_PTR(err);
+}
+
+static void pwmchip_free(struct pwm_chip_private *priv)
+{
+	mutex_lock(&pwm_lock);
+	idr_remove(&pwm_chips, priv->id);
+	mutex_unlock(&pwm_lock);
+
+	kfree(priv->pwms);
+	kfree(priv);
+}
+
 /**
  * __pwmchip_add() - register a new PWM chip
  * @chip: the PWM chip to add
@@ -208,8 +269,7 @@ static bool pwm_ops_check(const struct pwm_chip *chip)
  */
 int __pwmchip_add(struct pwm_chip *chip, struct module *owner)
 {
-	unsigned int i;
-	int ret;
+	struct pwm_chip_private *priv;
=20
 	if (!chip || !chip->dev || !chip->ops || !chip->npwm)
 		return -EINVAL;
@@ -217,36 +277,16 @@ int __pwmchip_add(struct pwm_chip *chip, struct modul=
e *owner)
 	if (!pwm_ops_check(chip))
 		return -EINVAL;
=20
-	chip->owner =3D owner;
-
-	chip->pwms =3D kcalloc(chip->npwm, sizeof(*chip->pwms), GFP_KERNEL);
-	if (!chip->pwms)
+	priv =3D pwmchip_alloc(chip, owner);
+	if (!priv)
 		return -ENOMEM;
=20
-	mutex_lock(&pwm_lock);
-
-	ret =3D idr_alloc(&pwmchip_idr, chip, 0, 0, GFP_KERNEL);
-	if (ret < 0) {
-		mutex_unlock(&pwm_lock);
-		kfree(chip->pwms);
-		return ret;
-	}
-
-	chip->id =3D ret;
-
-	for (i =3D 0; i < chip->npwm; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
-
-		pwm->chip =3D chip;
-		pwm->hwpwm =3D i;
-	}
-
-	mutex_unlock(&pwm_lock);
+	chip->priv =3D priv;
=20
 	if (IS_ENABLED(CONFIG_OF))
 		of_pwmchip_add(chip);
=20
-	pwmchip_sysfs_export(chip);
+	pwmchip_sysfs_export(priv);
=20
 	return 0;
 }
@@ -260,18 +300,14 @@ EXPORT_SYMBOL_GPL(__pwmchip_add);
  */
 void pwmchip_remove(struct pwm_chip *chip)
 {
-	pwmchip_sysfs_unexport(chip);
-
-	if (IS_ENABLED(CONFIG_OF))
-		of_pwmchip_remove(chip);
-
 	mutex_lock(&pwm_lock);
=20
-	idr_remove(&pwmchip_idr, chip->id);
+	pwmchip_sysfs_unexport(chip->priv);
=20
-	mutex_unlock(&pwm_lock);
+	if (IS_ENABLED(CONFIG_OF))
+		of_pwmchip_remove(chip);
=20
-	kfree(chip->pwms);
+	pwmchip_free(chip->priv);
 }
 EXPORT_SYMBOL_GPL(pwmchip_remove);
=20
@@ -315,7 +351,7 @@ struct pwm_device *pwm_request_from_chip(struct pwm_chi=
p *chip,
 		return ERR_PTR(-EINVAL);
=20
 	mutex_lock(&pwm_lock);
-	pwm =3D &chip->pwms[index];
+	pwm =3D &chip->priv->pwms[index];
=20
 	err =3D pwm_device_request(pwm, label);
 	if (err < 0)
@@ -329,9 +365,9 @@ EXPORT_SYMBOL_GPL(pwm_request_from_chip);
 static void pwm_apply_state_debug(struct pwm_device *pwm,
 				  const struct pwm_state *state)
 {
-	struct pwm_state *last =3D &pwm->last;
-	struct pwm_chip *chip =3D pwm->chip;
+	struct pwm_chip *chip =3D pwm->priv->chip;
 	struct pwm_state s1 =3D { 0 }, s2 =3D { 0 };
+	struct pwm_state *last =3D &pwm->last;
 	int err;
=20
 	if (!IS_ENABLED(CONFIG_PWM_DEBUG))
@@ -439,7 +475,6 @@ static void pwm_apply_state_debug(struct pwm_device *pw=
m,
  */
 int pwm_apply_state(struct pwm_device *pwm, const struct pwm_state *state)
 {
-	struct pwm_chip *chip;
 	int err;
=20
 	/*
@@ -455,8 +490,6 @@ int pwm_apply_state(struct pwm_device *pwm, const struc=
t pwm_state *state)
 	    state->duty_cycle > state->period)
 		return -EINVAL;
=20
-	chip =3D pwm->chip;
-
 	if (state->period =3D=3D pwm->state.period &&
 	    state->duty_cycle =3D=3D pwm->state.duty_cycle &&
 	    state->polarity =3D=3D pwm->state.polarity &&
@@ -464,7 +497,7 @@ int pwm_apply_state(struct pwm_device *pwm, const struc=
t pwm_state *state)
 	    state->usage_power =3D=3D pwm->state.usage_power)
 		return 0;
=20
-	err =3D chip->ops->apply(chip, pwm, state);
+	err =3D pwm->priv->chip->ops->apply(pwm->priv->chip, pwm, state);
 	trace_pwm_apply(pwm, state, err);
 	if (err)
 		return err;
@@ -492,16 +525,19 @@ EXPORT_SYMBOL_GPL(pwm_apply_state);
 int pwm_capture(struct pwm_device *pwm, struct pwm_capture *result,
 		unsigned long timeout)
 {
+	struct pwm_chip *chip;
 	int err;
=20
-	if (!pwm || !pwm->chip->ops)
+	if (!pwm)
 		return -EINVAL;
=20
-	if (!pwm->chip->ops->capture)
+	chip =3D pwm->priv->chip;
+
+	if (!chip || !chip->ops || !chip->ops->capture)
 		return -ENOSYS;
=20
 	mutex_lock(&pwm_lock);
-	err =3D pwm->chip->ops->capture(pwm->chip, pwm, result, timeout);
+	err =3D chip->ops->capture(chip, pwm, result, timeout);
 	mutex_unlock(&pwm_lock);
=20
 	return err;
@@ -566,16 +602,19 @@ EXPORT_SYMBOL_GPL(pwm_adjust_config);
=20
 static struct pwm_chip *fwnode_to_pwmchip(struct fwnode_handle *fwnode)
 {
-	struct pwm_chip *chip;
+	struct pwm_chip_private *priv;
 	unsigned long id, tmp;
=20
 	mutex_lock(&pwm_lock);
=20
-	idr_for_each_entry_ul(&pwmchip_idr, chip, tmp, id)
+	idr_for_each_entry_ul(&pwm_chips, priv, tmp, id) {
+		struct pwm_chip *chip =3D priv->chip;
+
 		if (chip->dev && device_match_fwnode(chip->dev, fwnode)) {
 			mutex_unlock(&pwm_lock);
 			return chip;
 		}
+	}
=20
 	mutex_unlock(&pwm_lock);
=20
@@ -585,6 +624,7 @@ static struct pwm_chip *fwnode_to_pwmchip(struct fwnode=
_handle *fwnode)
 static struct device_link *pwm_device_link_add(struct device *dev,
 					       struct pwm_device *pwm)
 {
+	struct pwm_chip *chip =3D pwm->priv->chip;
 	struct device_link *dl;
=20
 	if (!dev) {
@@ -593,15 +633,15 @@ static struct device_link *pwm_device_link_add(struct=
 device *dev,
 		 * impact the PM sequence ordering: the PWM supplier may get
 		 * suspended before the consumer.
 		 */
-		dev_warn(pwm->chip->dev,
+		dev_warn(chip->dev,
 			 "No consumer device specified to create a link to\n");
 		return NULL;
 	}
=20
-	dl =3D device_link_add(dev, pwm->chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
+	dl =3D device_link_add(dev, chip->dev, DL_FLAG_AUTOREMOVE_CONSUMER);
 	if (!dl) {
 		dev_err(dev, "failed to create device link to %s\n",
-			dev_name(pwm->chip->dev));
+			dev_name(chip->dev));
 		return ERR_PTR(-EINVAL);
 	}
=20
@@ -918,12 +958,12 @@ void pwm_put(struct pwm_device *pwm)
 		goto out;
 	}
=20
-	if (pwm->chip->ops->free)
-		pwm->chip->ops->free(pwm->chip, pwm);
+	if (pwm->priv->chip->ops->free)
+		pwm->priv->chip->ops->free(pwm->priv->chip, pwm);
=20
 	pwm->label =3D NULL;
=20
-	module_put(pwm->chip->owner);
+	module_put(pwm->priv->owner);
 out:
 	mutex_unlock(&pwm_lock);
 }
@@ -997,12 +1037,12 @@ struct pwm_device *devm_fwnode_pwm_get(struct device=
 *dev,
 EXPORT_SYMBOL_GPL(devm_fwnode_pwm_get);
=20
 #ifdef CONFIG_DEBUG_FS
-static void pwm_dbg_show(struct pwm_chip *chip, struct seq_file *s)
+static void pwm_dbg_show(struct pwm_chip_private *priv, struct seq_file *s)
 {
 	unsigned int i;
=20
-	for (i =3D 0; i < chip->npwm; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
+	for (i =3D 0; i < priv->chip->npwm; i++) {
+		struct pwm_device *pwm =3D &priv->pwms[i];
 		struct pwm_state state;
=20
 		pwm_get_state(pwm, &state);
@@ -1035,7 +1075,7 @@ static void *pwm_seq_start(struct seq_file *s, loff_t=
 *pos)
 	mutex_lock(&pwm_lock);
 	s->private =3D "";
=20
-	ret =3D idr_get_next_ul(&pwmchip_idr, &id);
+	ret =3D idr_get_next_ul(&pwm_chips, &id);
 	*pos =3D id;
 	return ret;
 }
@@ -1047,7 +1087,7 @@ static void *pwm_seq_next(struct seq_file *s, void *v=
, loff_t *pos)
=20
 	s->private =3D "\n";
=20
-	ret =3D idr_get_next_ul(&pwmchip_idr, &id);
+	ret =3D idr_get_next_ul(&pwm_chips, &id);
 	*pos =3D id;
 	return ret;
 }
@@ -1059,15 +1099,16 @@ static void pwm_seq_stop(struct seq_file *s, void *=
v)
=20
 static int pwm_seq_show(struct seq_file *s, void *v)
 {
-	struct pwm_chip *chip =3D v;
+	struct pwm_chip_private *priv =3D v;
+	struct pwm_chip *chip =3D priv->chip;
=20
 	seq_printf(s, "%s%d: %s/%s, %d PWM device%s\n",
-		   (char *)s->private, chip->id,
+		   (char *)s->private, priv->id,
 		   chip->dev->bus ? chip->dev->bus->name : "no-bus",
 		   dev_name(chip->dev), chip->npwm,
 		   (chip->npwm !=3D 1) ? "s" : "");
=20
-	pwm_dbg_show(chip, s);
+	pwm_dbg_show(priv, s);
=20
 	return 0;
 }
diff --git a/drivers/pwm/internal.h b/drivers/pwm/internal.h
new file mode 100644
index 000000000000..44fffd3b6744
--- /dev/null
+++ b/drivers/pwm/internal.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef PWM_INTERNAL_H
+#define PWM_INTERNAL_H
+
+#include <linux/list.h>
+
+struct pwm_chip;
+struct pwm_device;
+
+/**
+ * struct pwm_chip_private - subsystem-private PWM chip data
+ * @chip: driver-private PWM chip data
+ * @owner: module providing the chip
+ * @pwms: array of PWM devices allocated by the framework
+ * @base: number of first PWM controlled by this chip
+ */
+struct pwm_chip_private {
+	struct pwm_chip *chip;
+	struct module *owner;
+	struct pwm_device *pwms;
+	unsigned int id;
+};
+
+#ifdef CONFIG_PWM_SYSFS
+void pwmchip_sysfs_export(struct pwm_chip_private *priv);
+void pwmchip_sysfs_unexport(struct pwm_chip_private *priv);
+#else
+static inline void pwmchip_sysfs_export(struct pwm_chip_private *priv)
+{
+}
+
+static inline void pwmchip_sysfs_unexport(struct pwm_chip_private *priv)
+{
+}
+#endif /* CONFIG_PWM_SYSFS */
+
+#endif /* PWM_INTERNAL_H */
diff --git a/drivers/pwm/pwm-atmel-hlcdc.c b/drivers/pwm/pwm-atmel-hlcdc.c
index 3f2c5031a3ba..6bbbfaa582c1 100644
--- a/drivers/pwm/pwm-atmel-hlcdc.c
+++ b/drivers/pwm/pwm-atmel-hlcdc.c
@@ -15,6 +15,8 @@
 #include <linux/pwm.h>
 #include <linux/regmap.h>
=20
+#include "internal.h"
+
 #define ATMEL_HLCDC_PWMCVAL_MASK	GENMASK(15, 8)
 #define ATMEL_HLCDC_PWMCVAL(x)		(((x) << 8) & ATMEL_HLCDC_PWMCVAL_MASK)
 #define ATMEL_HLCDC_PWMPOL		BIT(4)
@@ -185,7 +187,7 @@ static int atmel_hlcdc_pwm_suspend(struct device *dev)
 	struct atmel_hlcdc_pwm *atmel =3D dev_get_drvdata(dev);
=20
 	/* Keep the periph clock enabled if the PWM is still running. */
-	if (pwm_is_enabled(&atmel->chip.pwms[0]))
+	if (pwm_is_enabled(&atmel->chip.priv->pwms[0]))
 		clk_disable_unprepare(atmel->hlcdc->periph_clk);
=20
 	return 0;
@@ -197,7 +199,7 @@ static int atmel_hlcdc_pwm_resume(struct device *dev)
 	struct pwm_state state;
 	int ret;
=20
-	pwm_get_state(&atmel->chip.pwms[0], &state);
+	pwm_get_state(&atmel->chip.priv->pwms[0], &state);
=20
 	/* Re-enable the periph clock it was stopped during suspend. */
 	if (!state.enabled) {
@@ -206,7 +208,7 @@ static int atmel_hlcdc_pwm_resume(struct device *dev)
 			return ret;
 	}
=20
-	return atmel_hlcdc_pwm_apply(&atmel->chip, &atmel->chip.pwms[0],
+	return atmel_hlcdc_pwm_apply(&atmel->chip, &atmel->chip.priv->pwms[0],
 				     &state);
 }
=20
diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
index d1b6d1aa4773..72467d620a90 100644
--- a/drivers/pwm/pwm-fsl-ftm.c
+++ b/drivers/pwm/pwm-fsl-ftm.c
@@ -19,6 +19,8 @@
 #include <linux/slab.h>
 #include <linux/fsl/ftm.h>
=20
+#include "internal.h"
+
 #define FTM_SC_CLK(c)	(((c) + 1) << FTM_SC_CLK_MASK_SHIFT)
=20
 enum fsl_pwm_clk {
@@ -468,7 +470,7 @@ static int fsl_pwm_suspend(struct device *dev)
 	regcache_mark_dirty(fpc->regmap);
=20
 	for (i =3D 0; i < fpc->chip.npwm; i++) {
-		struct pwm_device *pwm =3D &fpc->chip.pwms[i];
+		struct pwm_device *pwm =3D &fpc->chip.priv->pwms[i];
=20
 		if (!test_bit(PWMF_REQUESTED, &pwm->flags))
 			continue;
@@ -491,7 +493,7 @@ static int fsl_pwm_resume(struct device *dev)
 	int i;
=20
 	for (i =3D 0; i < fpc->chip.npwm; i++) {
-		struct pwm_device *pwm =3D &fpc->chip.pwms[i];
+		struct pwm_device *pwm =3D &fpc->chip.priv->pwms[i];
=20
 		if (!test_bit(PWMF_REQUESTED, &pwm->flags))
 			continue;
diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
index b3d4a955aa31..80f89ad2bc8f 100644
--- a/drivers/pwm/pwm-lpc18xx-sct.c
+++ b/drivers/pwm/pwm-lpc18xx-sct.c
@@ -27,6 +27,8 @@
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
=20
+#include "internal.h"
+
 /* LPC18xx SCT registers */
 #define LPC18XX_PWM_CONFIG		0x000
 #define LPC18XX_PWM_CONFIG_UNIFY	BIT(0)
@@ -224,7 +226,7 @@ static int lpc18xx_pwm_config(struct pwm_chip *chip, st=
ruct pwm_device *pwm,
 	    !lpc18xx_pwm->period_ns) {
 		lpc18xx_pwm->period_ns =3D period_ns;
 		for (i =3D 0; i < chip->npwm; i++)
-			pwm_set_period(&chip->pwms[i], period_ns);
+			pwm_set_period(&chip->priv->pwms[i], period_ns);
 		lpc18xx_pwm_config_period(chip, period_ns);
 	}
=20
diff --git a/drivers/pwm/pwm-lpss.c b/drivers/pwm/pwm-lpss.c
index a6ea3ce7e019..085d3c17f96b 100644
--- a/drivers/pwm/pwm-lpss.c
+++ b/drivers/pwm/pwm-lpss.c
@@ -19,6 +19,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/time.h>
=20
+#include "internal.h"
+
 #define DEFAULT_SYMBOL_NAMESPACE PWM_LPSS
=20
 #include "pwm-lpss.h"
@@ -73,21 +75,21 @@ static inline struct pwm_lpss_chip *to_lpwm(struct pwm_=
chip *chip)
=20
 static inline u32 pwm_lpss_read(const struct pwm_device *pwm)
 {
-	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->chip);
+	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->priv->chip);
=20
 	return readl(lpwm->regs + pwm->hwpwm * PWM_SIZE + PWM);
 }
=20
 static inline void pwm_lpss_write(const struct pwm_device *pwm, u32 value)
 {
-	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->chip);
+	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->priv->chip);
=20
 	writel(value, lpwm->regs + pwm->hwpwm * PWM_SIZE + PWM);
 }
=20
 static int pwm_lpss_wait_for_update(struct pwm_device *pwm)
 {
-	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->chip);
+	struct pwm_lpss_chip *lpwm =3D to_lpwm(pwm->priv->chip);
 	const void __iomem *addr =3D lpwm->regs + pwm->hwpwm * PWM_SIZE + PWM;
 	const unsigned int ms =3D 500 * USEC_PER_MSEC;
 	u32 val;
@@ -106,7 +108,7 @@ static int pwm_lpss_wait_for_update(struct pwm_device *=
pwm)
 	 */
 	err =3D readl_poll_timeout(addr, val, !(val & PWM_SW_UPDATE), 40, ms);
 	if (err)
-		dev_err(pwm->chip->dev, "PWM_SW_UPDATE was not cleared\n");
+		dev_err(pwm->priv->chip->dev, "PWM_SW_UPDATE was not cleared\n");
=20
 	return err;
 }
@@ -114,7 +116,7 @@ static int pwm_lpss_wait_for_update(struct pwm_device *=
pwm)
 static inline int pwm_lpss_is_updating(struct pwm_device *pwm)
 {
 	if (pwm_lpss_read(pwm) & PWM_SW_UPDATE) {
-		dev_err(pwm->chip->dev, "PWM_SW_UPDATE is still set, skipping update\n");
+		dev_err(pwm->priv->chip->dev, "PWM_SW_UPDATE is still set, skipping upda=
te\n");
 		return -EBUSY;
 	}
=20
@@ -278,7 +280,7 @@ struct pwm_lpss_chip *devm_pwm_lpss_probe(struct device=
 *dev, void __iomem *base
 	}
=20
 	for (i =3D 0; i < lpwm->info->npwm; i++) {
-		ctrl =3D pwm_lpss_read(&lpwm->chip.pwms[i]);
+		ctrl =3D pwm_lpss_read(&lpwm->chip.priv->pwms[i]);
 		if (ctrl & PWM_ENABLE)
 			pm_runtime_get(dev);
 	}
diff --git a/drivers/pwm/pwm-pca9685.c b/drivers/pwm/pwm-pca9685.c
index e79b1de8c4d8..d82cca90dba9 100644
--- a/drivers/pwm/pwm-pca9685.c
+++ b/drivers/pwm/pwm-pca9685.c
@@ -22,6 +22,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/bitmap.h>
=20
+#include "internal.h"
+
 /*
  * Because the PCA9685 has only one prescaler per chip, only the first cha=
nnel
  * that is enabled is allowed to change the prescale register.
@@ -134,7 +136,7 @@ static int pca9685_write_reg(struct pca9685 *pca, unsig=
ned int reg, unsigned int
 /* Helper function to set the duty cycle ratio to duty/4096 (e.g. duty=3D2=
048 -> 50%) */
 static void pca9685_pwm_set_duty(struct pca9685 *pca, int channel, unsigne=
d int duty)
 {
-	struct pwm_device *pwm =3D &pca->chip.pwms[channel];
+	struct pwm_device *pwm =3D &pca->chip.priv->pwms[channel];
 	unsigned int on, off;
=20
 	if (duty =3D=3D 0) {
@@ -173,7 +175,7 @@ static void pca9685_pwm_set_duty(struct pca9685 *pca, i=
nt channel, unsigned int
=20
 static unsigned int pca9685_pwm_get_duty(struct pca9685 *pca, int channel)
 {
-	struct pwm_device *pwm =3D &pca->chip.pwms[channel];
+	struct pwm_device *pwm =3D &pca->chip.priv->pwms[channel];
 	unsigned int off =3D 0, on =3D 0, val =3D 0;
=20
 	if (WARN_ON(channel >=3D PCA9685_MAXCHAN)) {
diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 6e77302f7368..e1baede405bc 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -26,6 +26,8 @@
 /* For struct samsung_timer_variant and samsung_pwm_lock. */
 #include <clocksource/samsung_pwm.h>
=20
+#include "internal.h"
+
 #define REG_TCFG0			0x00
 #define REG_TCFG1			0x04
 #define REG_TCON			0x08
@@ -627,10 +629,10 @@ static int pwm_samsung_resume(struct device *dev)
 	unsigned int i;
=20
 	for (i =3D 0; i < SAMSUNG_PWM_NUM; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
+		struct pwm_device *pwm =3D &chip->priv->pwms[i];
 		struct samsung_pwm_channel *chan =3D &our_chip->channel[i];
=20
-		if (!test_bit(PWMF_REQUESTED, &pwm->flags))
+		if (WARN_ON(!pwm) || !test_bit(PWMF_REQUESTED, &pwm->flags))
 			continue;
=20
 		if (our_chip->variant.output_mask & BIT(i))
diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index 089e50bdbbf0..e1dccaf33398 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -20,6 +20,8 @@
 #include <linux/slab.h>
 #include <linux/bitfield.h>
=20
+#include "internal.h"
+
 /* Register offsets */
 #define PWM_SIFIVE_PWMCFG		0x0
 #define PWM_SIFIVE_PWMCOUNT		0x8
@@ -322,7 +324,7 @@ static void pwm_sifive_remove(struct platform_device *d=
ev)
 	clk_notifier_unregister(ddata->clk, &ddata->notifier);
=20
 	for (ch =3D 0; ch < ddata->chip.npwm; ch++) {
-		pwm =3D &ddata->chip.pwms[ch];
+		pwm =3D &ddata->chip.priv->pwms[ch];
 		if (pwm->state.enabled)
 			clk_disable(ddata->clk);
 	}
diff --git a/drivers/pwm/pwm-stm32-lp.c b/drivers/pwm/pwm-stm32-lp.c
index 439068f3eca1..cb32caf5368a 100644
--- a/drivers/pwm/pwm-stm32-lp.c
+++ b/drivers/pwm/pwm-stm32-lp.c
@@ -17,6 +17,8 @@
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
=20
+#include "internal.h"
+
 struct stm32_pwm_lp {
 	struct pwm_chip chip;
 	struct clk *clk;
@@ -223,10 +225,10 @@ static int stm32_pwm_lp_suspend(struct device *dev)
 	struct stm32_pwm_lp *priv =3D dev_get_drvdata(dev);
 	struct pwm_state state;
=20
-	pwm_get_state(&priv->chip.pwms[0], &state);
+	pwm_get_state(&priv->chip.priv->pwms[0], &state);
 	if (state.enabled) {
 		dev_err(dev, "The consumer didn't stop us (%s)\n",
-			priv->chip.pwms[0].label);
+			priv->chip.priv->pwms[0].label);
 		return -EBUSY;
 	}
=20
diff --git a/drivers/pwm/pwm-stm32.c b/drivers/pwm/pwm-stm32.c
index 5f10cba492ec..81933df80768 100644
--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -16,6 +16,8 @@
 #include <linux/platform_device.h>
 #include <linux/pwm.h>
=20
+#include "internal.h"
+
 #define CCMR_CHANNEL_SHIFT 8
 #define CCMR_CHANNEL_MASK  0xFF
 #define MAX_BREAKINPUT 2
@@ -127,7 +129,7 @@ static int stm32_pwm_raw_capture(struct stm32_pwm *priv=
, struct pwm_device *pwm,
 		*raw_prd =3D priv->max_arr - priv->capture[0] + priv->capture[2];
=20
 	/* Duty cycle capture requires at least two capture units */
-	if (pwm->chip->npwm < 2)
+	if (priv->chip.npwm < 2)
 		*raw_dty =3D 0;
 	else if (priv->capture[0] <=3D priv->capture[3])
 		*raw_dty =3D priv->capture[3] - priv->capture[0];
@@ -682,7 +684,7 @@ static int stm32_pwm_suspend(struct device *dev)
 		mask =3D TIM_CCER_CC1E << (i * 4);
 		if (ccer & mask) {
 			dev_err(dev, "PWM %u still in use by consumer %s\n",
-				i, priv->chip.pwms[i].label);
+				i, priv->chip.priv->pwms[i].label);
 			return -EBUSY;
 		}
 	}
diff --git a/drivers/pwm/pwm-tiecap.c b/drivers/pwm/pwm-tiecap.c
index d974f4414ac9..f089257051d1 100644
--- a/drivers/pwm/pwm-tiecap.c
+++ b/drivers/pwm/pwm-tiecap.c
@@ -14,6 +14,8 @@
 #include <linux/pwm.h>
 #include <linux/of.h>
=20
+#include "internal.h"
+
 /* ECAP registers and bits definitions */
 #define CAP1			0x08
 #define CAP2			0x0C
@@ -288,7 +290,7 @@ static void ecap_pwm_restore_context(struct ecap_pwm_ch=
ip *pc)
 static int ecap_pwm_suspend(struct device *dev)
 {
 	struct ecap_pwm_chip *pc =3D dev_get_drvdata(dev);
-	struct pwm_device *pwm =3D pc->chip.pwms;
+	struct pwm_device *pwm =3D pc->chip.priv->pwms;
=20
 	ecap_pwm_save_context(pc);
=20
@@ -302,7 +304,7 @@ static int ecap_pwm_suspend(struct device *dev)
 static int ecap_pwm_resume(struct device *dev)
 {
 	struct ecap_pwm_chip *pc =3D dev_get_drvdata(dev);
-	struct pwm_device *pwm =3D pc->chip.pwms;
+	struct pwm_device *pwm =3D pc->chip.priv->pwms;
=20
 	/* Enable explicitly if PWM was running */
 	if (pwm_is_enabled(pwm))
diff --git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c
index af231fa74fa9..0d137100b040 100644
--- a/drivers/pwm/pwm-tiehrpwm.c
+++ b/drivers/pwm/pwm-tiehrpwm.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
=20
+#include "internal.h"
+
 /* EHRPWM registers and bits definitions */
=20
 /* Time base module registers */
@@ -557,7 +559,7 @@ static int ehrpwm_pwm_suspend(struct device *dev)
 	ehrpwm_pwm_save_context(pc);
=20
 	for (i =3D 0; i < pc->chip.npwm; i++) {
-		struct pwm_device *pwm =3D &pc->chip.pwms[i];
+		struct pwm_device *pwm =3D &pc->chip.priv->pwms[i];
=20
 		if (!pwm_is_enabled(pwm))
 			continue;
@@ -575,7 +577,7 @@ static int ehrpwm_pwm_resume(struct device *dev)
 	unsigned int i;
=20
 	for (i =3D 0; i < pc->chip.npwm; i++) {
-		struct pwm_device *pwm =3D &pc->chip.pwms[i];
+		struct pwm_device *pwm =3D &pc->chip.priv->pwms[i];
=20
 		if (!pwm_is_enabled(pwm))
 			continue;
diff --git a/drivers/pwm/sysfs.c b/drivers/pwm/sysfs.c
index 4edb994fa2e1..653df20afe1c 100644
--- a/drivers/pwm/sysfs.c
+++ b/drivers/pwm/sysfs.c
@@ -14,6 +14,8 @@
 #include <linux/kdev_t.h>
 #include <linux/pwm.h>
=20
+#include "internal.h"
+
 struct pwm_export {
 	struct device child;
 	struct pwm_device *pwm;
@@ -311,7 +313,7 @@ static ssize_t export_store(struct device *parent,
 			    struct device_attribute *attr,
 			    const char *buf, size_t len)
 {
-	struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
 	struct pwm_device *pwm;
 	unsigned int hwpwm;
 	int ret;
@@ -320,10 +322,10 @@ static ssize_t export_store(struct device *parent,
 	if (ret < 0)
 		return ret;
=20
-	if (hwpwm >=3D chip->npwm)
+	if (hwpwm >=3D priv->chip->npwm)
 		return -ENODEV;
=20
-	pwm =3D pwm_request_from_chip(chip, hwpwm, "sysfs");
+	pwm =3D pwm_request_from_chip(priv->chip, hwpwm, "sysfs");
 	if (IS_ERR(pwm))
 		return PTR_ERR(pwm);
=20
@@ -339,7 +341,7 @@ static ssize_t unexport_store(struct device *parent,
 			      struct device_attribute *attr,
 			      const char *buf, size_t len)
 {
-	struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
 	unsigned int hwpwm;
 	int ret;
=20
@@ -347,10 +349,10 @@ static ssize_t unexport_store(struct device *parent,
 	if (ret < 0)
 		return ret;
=20
-	if (hwpwm >=3D chip->npwm)
+	if (hwpwm >=3D priv->chip->npwm)
 		return -ENODEV;
=20
-	ret =3D pwm_unexport_child(parent, &chip->pwms[hwpwm]);
+	ret =3D pwm_unexport_child(parent, &priv->pwms[hwpwm]);
=20
 	return ret ? : len;
 }
@@ -359,9 +361,9 @@ static DEVICE_ATTR_WO(unexport);
 static ssize_t npwm_show(struct device *parent, struct device_attribute *a=
ttr,
 			 char *buf)
 {
-	const struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	const struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
=20
-	return sysfs_emit(buf, "%u\n", chip->npwm);
+	return sysfs_emit(buf, "%u\n", priv->chip->npwm);
 }
 static DEVICE_ATTR_RO(npwm);
=20
@@ -411,12 +413,12 @@ static int pwm_class_apply_state(struct pwm_export *e=
xport,
=20
 static int pwm_class_resume_npwm(struct device *parent, unsigned int npwm)
 {
-	struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
 	unsigned int i;
 	int ret =3D 0;
=20
 	for (i =3D 0; i < npwm; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
+		struct pwm_device *pwm =3D &priv->pwms[i];
 		struct pwm_state state;
 		struct pwm_export *export;
=20
@@ -442,12 +444,12 @@ static int pwm_class_resume_npwm(struct device *paren=
t, unsigned int npwm)
=20
 static int pwm_class_suspend(struct device *parent)
 {
-	struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
 	unsigned int i;
 	int ret =3D 0;
=20
-	for (i =3D 0; i < chip->npwm; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
+	for (i =3D 0; i < priv->chip->npwm; i++) {
+		struct pwm_device *pwm =3D &priv->pwms[i];
 		struct pwm_state state;
 		struct pwm_export *export;
=20
@@ -483,9 +485,9 @@ static int pwm_class_suspend(struct device *parent)
=20
 static int pwm_class_resume(struct device *parent)
 {
-	struct pwm_chip *chip =3D dev_get_drvdata(parent);
+	struct pwm_chip_private *priv =3D dev_get_drvdata(parent);
=20
-	return pwm_class_resume_npwm(parent, chip->npwm);
+	return pwm_class_resume_npwm(parent, priv->chip->npwm);
 }
=20
 static DEFINE_SIMPLE_DEV_PM_OPS(pwm_class_pm_ops, pwm_class_suspend, pwm_c=
lass_resume);
@@ -501,7 +503,7 @@ static int pwmchip_sysfs_match(struct device *parent, c=
onst void *data)
 	return dev_get_drvdata(parent) =3D=3D data;
 }
=20
-void pwmchip_sysfs_export(struct pwm_chip *chip)
+void pwmchip_sysfs_export(struct pwm_chip_private *priv)
 {
 	struct device *parent;
=20
@@ -509,26 +511,26 @@ void pwmchip_sysfs_export(struct pwm_chip *chip)
 	 * If device_create() fails the pwm_chip is still usable by
 	 * the kernel it's just not exported.
 	 */
-	parent =3D device_create(&pwm_class, chip->dev, MKDEV(0, 0), chip,
-			       "pwmchip%d", chip->id);
+	parent =3D device_create(&pwm_class, priv->chip->dev, MKDEV(0, 0), priv,
+			       "pwmchip%d", priv->id);
 	if (IS_ERR(parent)) {
-		dev_warn(chip->dev,
+		dev_warn(priv->chip->dev,
 			 "device_create failed for pwm_chip sysfs export\n");
 	}
 }
=20
-void pwmchip_sysfs_unexport(struct pwm_chip *chip)
+void pwmchip_sysfs_unexport(struct pwm_chip_private *priv)
 {
 	struct device *parent;
 	unsigned int i;
=20
-	parent =3D class_find_device(&pwm_class, NULL, chip,
+	parent =3D class_find_device(&pwm_class, NULL, priv,
 				   pwmchip_sysfs_match);
 	if (!parent)
 		return;
=20
-	for (i =3D 0; i < chip->npwm; i++) {
-		struct pwm_device *pwm =3D &chip->pwms[i];
+	for (i =3D 0; i < priv->chip->npwm; i++) {
+		struct pwm_device *pwm =3D &priv->pwms[i];
=20
 		if (test_bit(PWMF_EXPORTED, &pwm->flags))
 			pwm_unexport_child(parent, pwm);
diff --git a/include/linux/pwm.h b/include/linux/pwm.h
index f87655c06c82..5c478cd592d7 100644
--- a/include/linux/pwm.h
+++ b/include/linux/pwm.h
@@ -6,6 +6,7 @@
 #include <linux/mutex.h>
 #include <linux/of.h>
=20
+struct pwm_chip_private;
 struct pwm_chip;
=20
 /**
@@ -79,11 +80,12 @@ struct pwm_device {
 	const char *label;
 	unsigned long flags;
 	unsigned int hwpwm;
-	struct pwm_chip *chip;
=20
 	struct pwm_args args;
 	struct pwm_state state;
 	struct pwm_state last;
+
+	struct pwm_chip_private *priv;
 };
=20
 /**
@@ -280,26 +282,21 @@ struct pwm_ops {
  * struct pwm_chip - abstract a PWM controller
  * @dev: device providing the PWMs
  * @ops: callbacks for this PWM controller
- * @owner: module providing this chip
- * @id: unique number of this PWM chip
  * @npwm: number of PWMs controlled by this chip
  * @of_xlate: request a PWM device given a device tree PWM specifier
  * @of_pwm_n_cells: number of cells expected in the device tree PWM specif=
ier
- * @pwms: array of PWM devices allocated by the framework
+ * @priv: subsystem internal chip data
  */
 struct pwm_chip {
 	struct device *dev;
 	const struct pwm_ops *ops;
-	struct module *owner;
-	unsigned int id;
 	unsigned int npwm;
=20
 	struct pwm_device * (*of_xlate)(struct pwm_chip *chip,
 					const struct of_phandle_args *args);
 	unsigned int of_pwm_n_cells;
=20
-	/* only used internally by the PWM framework */
-	struct pwm_device *pwms;
+	struct pwm_chip_private *priv;
 };
=20
 #if IS_ENABLED(CONFIG_PWM)
@@ -564,17 +561,4 @@ static inline void pwm_remove_table(struct pwm_lookup =
*table, size_t num)
 }
 #endif
=20
-#ifdef CONFIG_PWM_SYSFS
-void pwmchip_sysfs_export(struct pwm_chip *chip);
-void pwmchip_sysfs_unexport(struct pwm_chip *chip);
-#else
-static inline void pwmchip_sysfs_export(struct pwm_chip *chip)
-{
-}
-
-static inline void pwmchip_sysfs_unexport(struct pwm_chip *chip)
-{
-}
-#endif /* CONFIG_PWM_SYSFS */
-
 #endif /* __LINUX_PWM_H */
--=20
2.43.0


--c3LD4v5RpdMiGBYB--

--LrjlwOpGpnIWr8uG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmVzOTMACgkQ3SOs138+
s6H4qhAAsW+7rczRFTk5lBTEsBoY7XOSlqQ/ApN5vMJ0Xwg2IFlxDQk6h7MncqKa
RKt0Gbs+U7Wk1OgnduUF7rCfMGNPxsipYNmXRfQnUkMGphvJApBjHgMhwMx3kXA5
/4SOKrIU9hsWAQwubTZflAHLs9G6Ve0zbcNX3aj42ert30RQBx8xx+nrmBEnoF1H
QBV/pjCCOEV+Eym5ceokQoeQboXGIbkE6b8LQH17yASfPVslr88qcQxpkeRF/YWx
rb7nDO1FFBD/KVhSvdGtxG6KpZG8w1HmXQHaVEl4dr+VfBbXB9chJE/xUSAQObcD
vR84igFC5MJhNXcBrScGwykaMzy/5nbXsyreL2mBXf7Wst4RTT8MPxyDKnk+7WTG
kek/X61ThZ8hdukx0QNISAGR/qfSHXpIa1I9/2IafFTsWWHsDWTZc2eQU0Ze3j9d
K1pZoGmWri/l8BER5YIq/o9ss1WAXPuT/ck3IR68QuzXzJR8hWryrW9oGQn3h8nb
R+jIkmtdMdwIH0oWaGHygarQoqfSBVcza0ivKOdWLWApogQmQXzDRPMFCsQv+184
2XKJZEqY7n4Boaq66ipx1gfVzE/xCutZ+FgksyXl+k+5A7GtY3FRVY+hoYhRd4bf
lWz69bdLp3Fyhdv9a5QDi6Bi6Uq600kFjbhzrNtf9e0kW3WUHUM=
=vVV7
-----END PGP SIGNATURE-----

--LrjlwOpGpnIWr8uG--
