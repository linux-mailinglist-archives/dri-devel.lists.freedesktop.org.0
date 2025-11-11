Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F483C4C7E9
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 09:57:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C239310E51F;
	Tue, 11 Nov 2025 08:57:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fw1WMMyE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F5410E51D;
 Tue, 11 Nov 2025 08:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762851419; x=1794387419;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=HTEmhdFJ+rUJlnS17ycVCj916TLWNWBPgq0iBkIyQVQ=;
 b=fw1WMMyEwhxt5ooYUKVNYR8nxgHoCACXtyI23tgg7i0zxsjEZ6NTZY9M
 AlHrVdaTPHryfvT2fasAlrt9YZg+Ckxgv8X/TG+Y5TKsL1mb/xp06hst8
 Ai/PNbxsMrLGCEQHstFvPodSVDiVBE4mOkPlt1VS2k5CHV+pdSKD99NKu
 kX9+rQOMNWk421srab9SIutRawSZoRmUGge4yisedc4V+12cOsEPG+/VD
 q8PQIhODIeCjnkxLQf01aZ+lFmodYMyKKJYN85W/VczKuWLTaDcfigUbv
 YToGMtbkyDoD0KfKm/jp4Zuc5dtAZInsgrxv4wgv5kUIO6xL8vcoAj9vC Q==;
X-CSE-ConnectionGUID: aDRw4e7JRzy6/ohB3lgKmg==
X-CSE-MsgGUID: grqMHIvmQG6L0ZcSljfSyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64946252"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64946252"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:56:56 -0800
X-CSE-ConnectionGUID: YP0FqPY8T6ix5PeesNhSBA==
X-CSE-MsgGUID: 2jXVqgMeQx+e0GO+TeBI1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="188171972"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 00:56:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 23/24] drm/vblank: reduce pipe checks
In-Reply-To: <aRIk1Q6ivG6temIY@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1762791343.git.jani.nikula@intel.com>
 <472777431de3c0f8a8d43e2ee7a55b3a170d138c.1762791343.git.jani.nikula@intel.com>
 <aRIk1Q6ivG6temIY@intel.com>
Date: Tue, 11 Nov 2025 10:56:51 +0200
Message-ID: <2a50f09057ac709a360bfbf042a2398d0d1763b1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 10 Nov 2025, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Mon, Nov 10, 2025 at 06:17:41PM +0200, Jani Nikula wrote:
>> Now that drm_vblank_crtc() is the only place that indexes dev->vblank[],
>> and its usage has reduced considerably, add the primary pipe
>> out-of-bounds check there, and return NULL. Expect callers to check it
>> and act accordingly.
>>=20
>> In drm_crtc_vblank_crtc(), warn and return NULL, and let it go boom. If
>> the crtc->pipe is out of bounds, it's a driver error that needs to be
>> fixed.
>>=20
>> Remove superfluous pipe checks all around.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 36 +++++++++++++++---------------------
>>  1 file changed, 15 insertions(+), 21 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
>> index 44fb8d225485..7829e64e42b4 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -177,13 +177,22 @@ MODULE_PARM_DESC(timestamp_precision_usec, "Max. e=
rror on timestamps [usecs]");
>>  static struct drm_vblank_crtc *
>>  drm_vblank_crtc(struct drm_device *dev, unsigned int pipe)
>>  {
>> +	if (pipe >=3D dev->num_crtcs)
>> +		return NULL;
>> +
>>  	return &dev->vblank[pipe];
>>  }
>>=20=20
>>  struct drm_vblank_crtc *
>>  drm_crtc_vblank_crtc(struct drm_crtc *crtc)
>>  {
>> -	return drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
>> +	struct drm_vblank_crtc *vblank;
>> +
>> +	vblank =3D drm_vblank_crtc(crtc->dev, drm_crtc_index(crtc));
>> +	if (drm_WARN_ON(crtc->dev, !vblank))
>> +		return NULL;
>> +
>> +	return vblank;
>>  }
>>  EXPORT_SYMBOL(drm_crtc_vblank_crtc);
>>=20=20
>> @@ -631,7 +640,6 @@ void drm_calc_timestamping_constants(struct drm_crtc=
 *crtc,
>>  				     const struct drm_display_mode *mode)
>>  {
>>  	struct drm_device *dev =3D crtc->dev;
>> -	unsigned int pipe =3D drm_crtc_index(crtc);
>>  	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>>  	int linedur_ns =3D 0, framedur_ns =3D 0;
>>  	int dotclock =3D mode->crtc_clock;
>> @@ -639,9 +647,6 @@ void drm_calc_timestamping_constants(struct drm_crtc=
 *crtc,
>>  	if (!drm_dev_has_vblank(dev))
>>  		return;
>
> I belive this at least gets called from the atomic helpers even
> for drivers that don't have vblank support. In which case the
> drm_crtc_vblank_crtc() call would have to be done after the
> drm_dev_has_vblank() check or else you'll get spurious WARNs.
>
> I don't remember if there are other cases like this as well.

Good catch! Yeah, not all places can be converted to struct
drm_vblank_crtc. I need to go through these.

There are a handful of places now that grab the vblank pointer (even
with NULL dev->vblank) and check has vblank afterwards, which is a bit
iffy. And actually mislead me here.

BR,
Jani.

>
>>=20=20
>> -	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>> -		return;
>> -
>>  	/* Valid dotclock? */
>>  	if (dotclock > 0) {
>>  		int frame_size =3D mode->crtc_htotal * mode->crtc_vtotal;
>> @@ -724,11 +729,6 @@ drm_crtc_vblank_helper_get_vblank_timestamp_interna=
l(
>>  	int vpos, hpos, i;
>>  	int delta_ns, duration_ns;
>>=20=20
>> -	if (pipe >=3D dev->num_crtcs) {
>> -		drm_err(dev, "Invalid crtc %u\n", pipe);
>> -		return false;
>> -	}
>> -
>>  	/* Scanout position query not supported? Should not happen. */
>>  	if (!get_scanout_position) {
>>  		drm_err(dev, "Called from CRTC w/o get_scanout_position()!?\n");
>> @@ -1339,9 +1339,6 @@ void drm_crtc_vblank_off(struct drm_crtc *crtc)
>>  	ktime_t now;
>>  	u64 seq;
>>=20=20
>> -	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>> -		return;
>> -
>>  	/*
>>  	 * Grab event_lock early to prevent vblank work from being scheduled
>>  	 * while we're in the middle of shutting down vblank interrupts
>> @@ -1480,9 +1477,6 @@ void drm_crtc_vblank_on_config(struct drm_crtc *cr=
tc,
>>  	unsigned int pipe =3D drm_crtc_index(crtc);
>>  	struct drm_vblank_crtc *vblank =3D drm_crtc_vblank_crtc(crtc);
>>=20=20
>> -	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>> -		return;
>> -
>>  	spin_lock_irq(&dev->vbl_lock);
>>  	drm_dbg_vbl(dev, "crtc %d, vblank enabled %d, inmodeset %d\n",
>>  		    pipe, vblank->enabled, vblank->inmodeset);
>> @@ -1764,10 +1758,9 @@ int drm_wait_vblank_ioctl(struct drm_device *dev,=
 void *data,
>>  		pipe =3D pipe_index;
>>  	}
>>=20=20
>> -	if (pipe >=3D dev->num_crtcs)
>> -		return -EINVAL;
>> -
>>  	vblank =3D drm_vblank_crtc(dev, pipe);
>> +	if (!vblank)
>> +		return -EINVAL;
>>=20=20
>>  	/* If the counter is currently enabled and accurate, short-circuit
>>  	 * queries to return the cached timestamp of the last vblank.
>> @@ -1902,14 +1895,15 @@ static void drm_handle_vblank_events(struct drm_=
vblank_crtc *vblank)
>>   */
>>  bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
>>  {
>> -	struct drm_vblank_crtc *vblank =3D drm_vblank_crtc(dev, pipe);
>> +	struct drm_vblank_crtc *vblank;
>>  	unsigned long irqflags;
>>  	bool disable_irq;
>>=20=20
>>  	if (drm_WARN_ON_ONCE(dev, !drm_dev_has_vblank(dev)))
>>  		return false;
>>=20=20
>> -	if (drm_WARN_ON(dev, pipe >=3D dev->num_crtcs))
>> +	vblank =3D drm_vblank_crtc(dev, pipe);
>> +	if (drm_WARN_ON(dev, !vblank))
>>  		return false;
>>=20=20
>>  	spin_lock_irqsave(&dev->event_lock, irqflags);
>> --=20
>> 2.47.3

--=20
Jani Nikula, Intel
