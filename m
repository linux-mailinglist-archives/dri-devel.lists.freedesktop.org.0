Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F69257A2C
	for <lists+dri-devel@lfdr.de>; Mon, 31 Aug 2020 15:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3AC86E25E;
	Mon, 31 Aug 2020 13:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FC36E25E;
 Mon, 31 Aug 2020 13:15:37 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p9so2709792ejf.6;
 Mon, 31 Aug 2020 06:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ZN+h3DvckVB0R7Miee9OkAe5hHTT1PL9GADo84XwD34=;
 b=nI/6zGeXnPbMXWQ2/5R2OyDMxsBXBFaLc5VpXRmiw3zxHbY+fKmZW4RF5J0kw7VkuE
 sIYnxnS9IpLMlPhKo7ZTgVTE5N3MO8Y1CdVjQsbROLDA+LZHRHQcQ15CclTY5laQF3Au
 bkrQ2+fVhFslIpcaIeF7e/IyMJHVPol0XIE+qgJAN8R9pSakC9KTKzKrymSOACkYcRM7
 b4+LpZMHSHM+WQpF0TH6TG0pfaA20ej70+gn5kDO7SztdK2886M3PplxXM5JwS6s0F5u
 luZ+X+xPw+o5rNm3jPfhSFVd8IDk2uGNco439LIWpTGeq1NKdx2VwkZTOG8rGS37Wxg9
 QV3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ZN+h3DvckVB0R7Miee9OkAe5hHTT1PL9GADo84XwD34=;
 b=dcfuj4As48kEzuKPPO+1YxSLz4nALhNAVHKrmxgFuL9bVpFCyt7VZJVXUrRnH9Du0E
 Ctli/trl0XugpizEEappkJJGR5vSZMD3gLypy7EUSt9Bpfg+FrQNIyW7ok084Mj2pdmj
 41tRCUW7puologFgmD/isp65WvxO2FGigxA79/xDuwGMblZRg/HrJ2bmGtV5pc61XJ9P
 DBLOMGrB6SmnMbxw1Z9ipglI2Xmp6odkteqWpNKg8sAWu/OxW/b3vWBVjTnuWDG4o8zj
 J7W6lXko9MCFHpGXDGp8Hztoqe16VKxlgEfX2DCFvp01aFCz5UURjzWssnAVmy88I7fJ
 thRw==
X-Gm-Message-State: AOAM533+Jmm8AgQSLqeSxNQDKf2gjNU2vMX4BGPP/ZBcmwNpgQoeXrP9
 GdIepCy28c5FUvaHw+RnmoE=
X-Google-Smtp-Source: ABdhPJxjahfl9XxyTAunK8pqkuFaj9sl8K8muHe4E9rhOUMfHucL1KmAZz1uY7PN+gNwyd60GFumFw==
X-Received: by 2002:a17:906:1c4f:: with SMTP id
 l15mr1087611ejg.419.1598879736290; 
 Mon, 31 Aug 2020 06:15:36 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id v4sm8176493ejq.91.2020.08.31.06.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 06:15:34 -0700 (PDT)
Date: Mon, 31 Aug 2020 15:15:33 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v8 06/17] pwm: lpss: Use pwm_lpss_restore() when
 restoring state on resume
Message-ID: <20200831131533.GI1689119@ulmo>
References: <20200830125753.230420-1-hdegoede@redhat.com>
 <20200830125753.230420-7-hdegoede@redhat.com>
 <20200831111006.GD1688464@ulmo>
 <d63a89d2-84e5-ca05-aa96-a06291503c5f@redhat.com>
MIME-Version: 1.0
In-Reply-To: <d63a89d2-84e5-ca05-aa96-a06291503c5f@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
Cc: linux-pwm@vger.kernel.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>, Len Brown <lenb@kernel.org>
Content-Type: multipart/mixed; boundary="===============0204104121=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0204104121==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vs0rQTeTompTJjtd"
Content-Disposition: inline


--vs0rQTeTompTJjtd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2020 at 01:46:28PM +0200, Hans de Goede wrote:
> Hi,
>=20
> On 8/31/20 1:10 PM, Thierry Reding wrote:
> > On Sun, Aug 30, 2020 at 02:57:42PM +0200, Hans de Goede wrote:
> > > Before this commit a suspend + resume of the LPSS PWM controller
> > > would result in the controller being reset to its defaults of
> > > output-freq =3D clock/256, duty-cycle=3D100%, until someone changes
> > > to the output-freq and/or duty-cycle are made.
> > >=20
> > > This problem has been masked so far because the main consumer
> > > (the i915 driver) was always making duty-cycle changes on resume.
> > > With the conversion of the i915 driver to the atomic PWM API the
> > > driver now only disables/enables the PWM on suspend/resume leaving
> > > the output-freq and duty as is, triggering this problem.
> >=20
> > Doesn't this imply that there's another bug at play here? At the PWM API
> > level you're applying a state and it's up to the driver to ensure that
> > the hardware state after ->apply() is what the software has requested.
> >=20
> > If you only switch the enable state and that doesn't cause period and
> > duty cycle to be updated it means that your driver isn't writing those
> > registers when it should be.
>=20
> Right, the driver was not committing those as it should *on resume*,
> that and it skips setting the update bit on the subsequent enable,
> which is an optimization which gets removed in 7/17.
>=20
> Before switching the i915 driver over to atomic, when the LPSS-PWM
> was used for the backlight we got the following order on suspend/resume
>=20
> 1. Set duty-cycle to 0%
> 2. Set enabled to 0
> 3. Save ctrl reg
> 4. Power-off PWM controller, it now looses all its state
> 5. Power-on PWM ctrl
> 6. Restore ctrl reg (as a single reg write)
> 7. Set enabled to 1, at this point one would expect the
> duty/freq from the restored ctrl-reg to apply, but:
> a) The resume code never sets the update bit (which this commit fixes); a=
nd
> b) On applying the pwm_state with enabled=3D1 the code applying the
> state does this (before setting the enabled bit in the ctrl reg):
>=20
> 	if (orig_ctrl !=3D ctrl) {
> 		pwm_lpss_write(pwm, ctrl);
> 		pwm_lpss_write(pwm, ctrl | PWM_SW_UPDATE);
> 	}
> and since the restore of the ctrl reg set the old duty/freq the
> writes are skipped, so the update bit never gets set.
>=20
> 8. Set duty-cycle to the pre-suspend value (which is not 0)
> this does cause a change in the ctrl-reg, so now the update flag
> does get set.
>=20
> Note that 1-2 and 7-8 are both done by the non atomic i915 code,
> when moving the i915 code to atomic I decided that having these
> 2 separate steps here is non-sense, so the new i915 code just
> toggles the enable bit. So in essence the new atomic PWM
> i915 code drops step 1 and 8.
>=20
> Dropping steps 8 means that the update bit never gets set and we
> end up with the PWM running at its power-on-reset duty cycle.
>=20
> You are correct in your remark to patch 7/17 that since that removes
> the if (orig_ctrl !=3D ctrl) for the writes that now step 7 will be
> sufficient to get the PWM to work again. But that only takes the i915
> usage into account.
>=20
> What if the PWM is used through the sysfs userspace API?
> Then only steps 3-6 will happen on suspend-resume and without
> fixing step 6 to properly restore the PWM controller in its
> pre-resume state (this patch) it will once again be running at
> its power-on-reset defaults instead of the values from the
> restored control register.

Actually PWM's sysfs code has suspend/resume callbacks that basically
make sysfs just a regular consumer of PWMs. So they do end up doing a
pwm_apply_state() on the PWM as well on suspend and restore the state
=66rom before suspend on resume.

This was done very specifically because the suspend/resume order can be
unexpected under some circumstances, so for PWM we really want for the
consumer to always have ultimate control over when precisely the PWM is
restored on resume.

The reason why we did this was because people observed weird glitches on
suspend/resume with different severity. In some cases a backlight would
be resumed before the display controller had had a chance to start
sending frames, causing on-screen corruption in some cases (such as
smart displays) and in other cases a PWM-controller regulator would be
resumed too late or too early, which I think was causing some issue with
the CPUs not working properly on resume.

So I'd prefer not to have any PWM driver save and restore its own
context on suspend/resume, because that's inevitably going to cause
unexpected behaviour at some point. If it's absolutely necessary we can
of course still do that, but I think in that case we need to at least
add a comment in the code about why context save/restore is needed in
this particular case and make it clear that this is not something that
other drivers should copy because they most likely won't be needing it.

Given the above it also doesn't sound to me like there's a real problem,
or at least that the bug is somewhere else. A consumer should always be
responsible for applying the pre-suspend state upon resume and it sounds
like that would be true after patch 7. Since sysfs is just a regular
consumer, the same should apply for sysfs-controlled PWMs as well.

> So at step 6, if the PWM was enabled before, we must set the update
> bit, and then wait for it to clear again so the controller is
> ready for subsequent updates. The waiting for it to clear again
> needs to happen before or after setting the enable bit depending
> on the hw generation, which leads to this patch.

But all of that should be happening as part of the call to
pwm_apply_state(), right? That path should be taken for all consumers on
resume, including sysfs.

> I hope that helps explain why this patch is the correct thing
> to do.
>=20
>=20
> > > The LPSS PWM controller has a mechanism where the ctrl register value
> > > and the actual base-unit and on-time-div values used are latched. When
> > > software sets the SW_UPDATE bit then at the end of the current PWM cy=
cle,
> > > the new values from the ctrl-register will be latched into the actual
> > > registers, and the SW_UPDATE bit will be cleared.
> > >=20
> > > The problem is that before this commit our suspend/resume handling
> > > consisted of simply saving the PWM ctrl register on suspend and
> > > restoring it on resume, without setting the PWM_SW_UPDATE bit.
> > > When the controller has lost its state over a suspend/resume and thus
> > > has been reset to the defaults, just restoring the register is not
> > > enough. We must also set the SW_UPDATE bit to tell the controller to
> > > latch the restored values into the actual registers.
> > >=20
> > > Fixing this problem is not as simple as just or-ing in the value which
> > > is being restored with SW_UPDATE. If the PWM was enabled before we mu=
st
> > > write the new settings + PWM_SW_UPDATE before setting PWM_ENABLE.
> > > We must also wait for PWM_SW_UPDATE to become 0 again and depending o=
n the
> > > model we must do this either before or after the setting of PWM_ENABL=
E.
> > >=20
> > > All the necessary logic for doing this is already present inside
> > > pwm_lpss_apply(), so instead of duplicating this inside the resume
> > > handler, this commit adds a new pwm_lpss_restore() helper which mirro=
rs
> > > pwm_lpss_apply() minus the runtime-pm reference handling (which we sh=
ould
> > > not change on resume).
> >=20
> > If this is all already implemented in pwm_lpss_apply(), why isn't it
> > working for the suspend/resume case? It shouldn't matter that the
> > consumer only changes the enable/disable state. After ->apply()
> > successfully returns your hardware should be programmed with exactly
> > the state that the consumer requested.
>=20
> See above, apply() was trying to be smart but the restore of ctrl
> on resume without setting the update bit was tricking it. That
> being too smart for its own good is removed in 7/16 as you
> rightfully point out. But this patch is still necessary for the
> PWM controller to be in the expected state between resume and the
> first apply() after resume (which may be quite a long time in
> the future when using e.g. the sysfs API).

Like I said, the sysfs code should be resuming any exported PWMs on
resume just like any other consumer.

Obviously it's always up to the consumer to call pwm_apply_state() at
the right time. If that's "too late" for some reason, then that's a bug
in the consumer driver. But as I explained above there are a number of
cases where restoring context in the PWM driver itself doesn't work
because it can cause sequencing issues.

Thierry

--vs0rQTeTompTJjtd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9M9/MACgkQ3SOs138+
s6FoLxAApO88jDIMkfnsdmzPxilvpIXX7GyY3K49Atgw7o6+82FIjm+qwyu1/qz7
S1uSc8MeZyg5WwfaP/5Q6DlCKanzfBOmXxrY4AbFm7jU1kDx9xrrl6XbE8M2rmH2
e1UcBuMgcIJZKQyLCWViEYJQQ4euMnc3hhyBH7cd0iuu1XvEteBASXJ/Zst+kMN4
uYjGQX1ch37/XQSBdaYX94O/pWir8/HVHvdwCLQY0gcvzBXwa/dIVlXgU9luA7cn
jP66AgRHNvn5ZHeBSdD3ab+tGX8tnG5jI+KU1Ztg2cvKxPKOgmh0S3aPitRwO3md
DYgh1z0QMgByZnbuROJLcLIUxRTjGQ1oy5irC0OEsYjtDIuXyYApi3BiSyZFK8Sy
jrJr/UxjorbSvEnq18rHSRMghO67Kwzfka+xlflasZddf1YMJjQhW1ChVd6po4i2
awom7Lo0b+Yv7sKLARpWWYoccJqHk7uMFfgv/7+PkLmnKVByHP2tCGckTZjqn1zt
Sp3BJJcpsctgIZ8Q33tTg0mceET7GQOiyHO+IqOwKrlbBVVRCAyZob6KC+RVgofW
yUVQLJXova1+uwrNLF7jbHcgIRkdl2LvB2LpKaeEMjkt+tokd+9XzT+XlTkhW4dD
9uXPlXR4jLXrkN85HWpIXZ4AqI1XOh01i14XQeQ1ONtJNB1DDjM=
=FvFd
-----END PGP SIGNATURE-----

--vs0rQTeTompTJjtd--

--===============0204104121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0204104121==--
