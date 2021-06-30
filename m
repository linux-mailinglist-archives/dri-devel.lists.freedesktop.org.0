Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A618C3B84EF
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 16:18:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CF0F6E9EA;
	Wed, 30 Jun 2021 14:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36DE6E9EA;
 Wed, 30 Jun 2021 14:18:17 +0000 (UTC)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6B1D41FEAE;
 Wed, 30 Jun 2021 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uB2cL7pxHguFx0of0kEY0Ut1RSooggjmTGSffUI/v7o=;
 b=kLmCZ0vOozafGq9bnz2dweQUtCcIvWUdo2GnBMtD1AdtjX/Kn9YoL1OB9juzdn1uiGm9QV
 k/A4kBHXG8Xfubff9NLLAE/I2FAeoGfIY06hdifialu2UD/oCORC4EyHmK8H8zdJznUEav
 yCY1GwAGWLdJGpy9e5zFOYiiL6lUEj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uB2cL7pxHguFx0of0kEY0Ut1RSooggjmTGSffUI/v7o=;
 b=oVI/xyinfTAoOvDhmidgxH4EkL7dT0F6GP8uFBmSWB89gWUstpIHnaheRNJxtqIL4ZB4Gi
 Dn0vETqMLiu/2KCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 34FBC118DD;
 Wed, 30 Jun 2021 14:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625062696; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uB2cL7pxHguFx0of0kEY0Ut1RSooggjmTGSffUI/v7o=;
 b=kLmCZ0vOozafGq9bnz2dweQUtCcIvWUdo2GnBMtD1AdtjX/Kn9YoL1OB9juzdn1uiGm9QV
 k/A4kBHXG8Xfubff9NLLAE/I2FAeoGfIY06hdifialu2UD/oCORC4EyHmK8H8zdJznUEav
 yCY1GwAGWLdJGpy9e5zFOYiiL6lUEj8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625062696;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uB2cL7pxHguFx0of0kEY0Ut1RSooggjmTGSffUI/v7o=;
 b=oVI/xyinfTAoOvDhmidgxH4EkL7dT0F6GP8uFBmSWB89gWUstpIHnaheRNJxtqIL4ZB4Gi
 Dn0vETqMLiu/2KCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id KR0ADCh93GBYFAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 30 Jun 2021 14:18:16 +0000
Subject: Re: [PATCH v3 1/2] drm/i915: Use the correct IRQ during resume
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210630095228.6665-1-tzimmermann@suse.de>
 <20210630095228.6665-2-tzimmermann@suse.de>
 <YNxMLb60vNDuTcdM@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ce44caf4-1823-121b-5db4-61eaa9827327@suse.de>
Date: Wed, 30 Jun 2021 16:18:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNxMLb60vNDuTcdM@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="a30RO2t3JXHEiirTgF6hZ3eL9QhW3hHFz"
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
Cc: matthew.brost@intel.com, airlied@linux.ie,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 mika.kuoppala@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--a30RO2t3JXHEiirTgF6hZ3eL9QhW3hHFz
Content-Type: multipart/mixed; boundary="r5rQSf3n0gVOq0ugtBXSd8ar4zo1cOaYe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: matthew.brost@intel.com, airlied@linux.ie, mika.kuoppala@linux.intel.com,
 intel-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, lucas.demarchi@intel.com
Message-ID: <ce44caf4-1823-121b-5db4-61eaa9827327@suse.de>
Subject: Re: [PATCH v3 1/2] drm/i915: Use the correct IRQ during resume
References: <20210630095228.6665-1-tzimmermann@suse.de>
 <20210630095228.6665-2-tzimmermann@suse.de>
 <YNxMLb60vNDuTcdM@phenom.ffwll.local>
In-Reply-To: <YNxMLb60vNDuTcdM@phenom.ffwll.local>

--r5rQSf3n0gVOq0ugtBXSd8ar4zo1cOaYe
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.06.21 um 12:49 schrieb Daniel Vetter:
> On Wed, Jun 30, 2021 at 11:52:27AM +0200, Thomas Zimmermann wrote:
>> The code in xcs_resume() probably didn't work as intended. It uses
>> struct drm_device.irq, which is allocated to 0, but never initialized
>> by i915 to the device's interrupt number.
>>
>> v3:
>> 	* also use intel_synchronize_hardirq() at another callsite
>> v2:
>> 	* wrap irq code in intel_synchronize_hardirq() (Ville)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Fixes: 536f77b1caa0 ("drm/i915/gt: Call stop_ring() from ring resume, =
again")
>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/intel_engine_cs.c       | 2 +-
>>   drivers/gpu/drm/i915/gt/intel_ring_submission.c | 2 +-
>>   drivers/gpu/drm/i915/i915_irq.c                 | 5 +++++
>>   drivers/gpu/drm/i915/i915_irq.h                 | 1 +
>>   4 files changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/d=
rm/i915/gt/intel_engine_cs.c
>> index 88694822716a..5ca3d1664335 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
>> @@ -1229,7 +1229,7 @@ bool intel_engine_is_idle(struct intel_engine_cs=
 *engine)
>>   		return true;
>>  =20
>>   	/* Waiting to drain ELSP? */
>> -	synchronize_hardirq(to_pci_dev(engine->i915->drm.dev)->irq);
>> +	intel_synchronize_hardirq(engine->i915);
>>   	intel_engine_flush_submission(engine);
>>  =20
>>   	/* ELSP is empty, but there are ready requests? E.g. after reset */=

>> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers=
/gpu/drm/i915/gt/intel_ring_submission.c
>> index 5d42a12ef3d6..1b5a22a83db6 100644
>> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
>> @@ -185,7 +185,7 @@ static int xcs_resume(struct intel_engine_cs *engi=
ne)
>>   		     ring->head, ring->tail);
>>  =20
>>   	/* Double check the ring is empty & disabled before we resume */
>> -	synchronize_hardirq(engine->i915->drm.irq);
>> +	intel_synchronize_hardirq(engine->i915);
>>   	if (!stop_ring(engine))
>>   		goto err;
>>  =20
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i9=
15_irq.c
>> index 7d0ce8b9f8ed..2203dca19895 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -4575,3 +4575,8 @@ void intel_synchronize_irq(struct drm_i915_priva=
te *i915)
>>   {
>>   	synchronize_irq(to_pci_dev(i915->drm.dev)->irq);
>>   }
>> +
>> +void intel_synchronize_hardirq(struct drm_i915_private *i915)
>> +{
>> +	synchronize_hardirq(to_pci_dev(i915->drm.dev)->irq);
>=20
> I honestly think the hardirq here is about as much cargo-culted as usin=
g
> the wrong irq number.
>=20
> I'd just use intel_synchronize_irq in both places and see whether CI
> complains, then go with that.

Well, ok. I don't think I have Sandybridge HW available. Would the Intel =

CI infrastructure catch any problems with such a change?

Best regards
Thomas

> -Daniel
>=20
>> +}
>> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i9=
15_irq.h
>> index db34d5dbe402..e43b6734f21b 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.h
>> +++ b/drivers/gpu/drm/i915/i915_irq.h
>> @@ -94,6 +94,7 @@ void intel_runtime_pm_disable_interrupts(struct drm_=
i915_private *dev_priv);
>>   void intel_runtime_pm_enable_interrupts(struct drm_i915_private *dev=
_priv);
>>   bool intel_irqs_enabled(struct drm_i915_private *dev_priv);
>>   void intel_synchronize_irq(struct drm_i915_private *i915);
>> +void intel_synchronize_hardirq(struct drm_i915_private *i915);
>>  =20
>>   int intel_get_crtc_scanline(struct intel_crtc *crtc);
>>   void gen8_irq_power_well_post_enable(struct drm_i915_private *dev_pr=
iv,
>> --=20
>> 2.32.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--r5rQSf3n0gVOq0ugtBXSd8ar4zo1cOaYe--

--a30RO2t3JXHEiirTgF6hZ3eL9QhW3hHFz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDcfScFAwAAAAAACgkQlh/E3EQov+C5
xg/+KhqHd3uPCVG77kDRARlJ0YJ0NkwnqvwS6cm2Ysjkho1aFCUR3KZ7lp7nvwB4Z2THvQaTnKHG
Y28G3CBK4gay1m6P22ntYq8wLKx/2zQUC8vtLasMSnoOxNELRYgTOoIrnAnSEopSdQsAxFtNGIR8
xdm8cnvSKE18AmWYUzaPCoZrOP3OY2bZlIKJpRQfOHo6s0JfCXyhmW0v3QMLUqIKqUVXs0oIXx3F
/AmseHy3oT0HTbOH3SChHg1Fe/rJ+V4fyNyHVDjJHWvpxYCqE+Dkd1n8YdQAE7GnLuUaJYpNVf4q
3kAyTy+2o/H1jefUFRA1OzfVG6vLLSsBpM2r4MwBGU0nhPSLhutScAUZHPsZ524b9gsqKDak9ckJ
xlX4EEX/LyA097Pi3JC/jiLUQcoDlimfnF6LfQVUtZSfuIg8djm8VRF8lgN31v51TAdOUCnBBglS
XmLRY6kRbBYfJezZtBDtiSS5ZqEFPdDHKP6xNCqr/VwDOS9ymsNuwbqnUBLjl+fmSFBtHKyfcmgV
Hypk7S6guxaV+KQT6VpeKpXT3D9iyXcLthLqo8zyXstEoy3Q6+z9pb4pbkxxK3+6BAyqz0SvjNv/
L2Y9Q5g3t9UC7yRVdoqblInvhIfi/Y/MmU+KbdcaW9cWaQC3NLKd3w8Nf2FWBLj6A6qsvcLmZmp9
QII=
=atNS
-----END PGP SIGNATURE-----

--a30RO2t3JXHEiirTgF6hZ3eL9QhW3hHFz--
