Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4F0798459A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 14:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5D4E10E8A1;
	Tue, 24 Sep 2024 12:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aGbd0FLy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B2510E8A1;
 Tue, 24 Sep 2024 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727179877; x=1758715877;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dTad2rqpcko2TGpyvtRSd9oTstyIASGq7zS6vS0Dg9U=;
 b=aGbd0FLytC5WcM9SqO3ccj7M+6q1um/CHrhIMG0YlLXyjgFPMhW6AkIQ
 wGmt6aD1j2WtrsezoMuedBHAmT/2CWB48mUaWG8ckNc2vt4vdA87jPVqR
 fkTdAZariqXuty9xQPhg5D4oE9m6/3jqshqm6XgoFHj4Mn1TqYXfctrdY
 CFKa5bcNSl61GyVuJj7sIhvVQrICVWn0uSbLJh8bH6V5NPqd6qL6Dyt71
 yguKarOfuP3dtnU/Yze+tmhUk+6VCPQlJuO2lKE+dXElTw3IV9iXyqOkj
 EcCT5a2Icp9N9rW22FlQURIlbL8tSjqVdvR7SF0tCpIpn1LmkoETtRS5R w==;
X-CSE-ConnectionGUID: 0GZurNZJR6SVz3vM3uXfBw==
X-CSE-MsgGUID: oCkS9kDuTpCVLVUx9F0aNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26265036"
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="26265036"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 05:11:17 -0700
X-CSE-ConnectionGUID: H3KdpKbwRua8SWIdpicqLQ==
X-CSE-MsgGUID: M3YEhQRFSpKiwBoJ2gYEMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,254,1719903600"; d="scan'208";a="75790881"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.183])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 05:11:12 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: George Rurikov <g.ryurikov@securitycode.ru>
Cc: George Rurikov <g.ryurikov@securitycode.ru>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH] drm: Add check for encoder in intel_get_crtc_new_encoder()
In-Reply-To: <87tte545pc.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240924114004.1084283-1-g.ryurikov@securitycode.ru>
 <87tte545pc.fsf@intel.com>
Date: Tue, 24 Sep 2024 15:11:08 +0300
Message-ID: <87o74d45gj.fsf@intel.com>
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

On Tue, 24 Sep 2024, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 24 Sep 2024, George Rurikov <g.ryurikov@securitycode.ru> wrote:
>> If the video card driver could not find the connector assigned to the
>> current video controller, or if the hardware status has changed so that
>> a pre-existing connector is no longer active, none of the state
>> connectors will meet the assignment criteria for the current crtc video
>> controller.
>>
>> In the drm_WARN function, encoder->base.dev is called, so
>> '&encoder->base.dev' will be dereferenced since encoder will still be
>> initialized NULL.
>
> encoder is not dereferenced there.

Looks like the issue was there ages ago, and was fixed in v6.5 by commit
3b6692357f70 ("drm/i915: Make intel_get_crtc_new_encoder() less oopsy").

Please run your analysis on recent kernels.

BR,
Jani.


>
>> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>>
>> Fixes: e12d6218fda2 ("drm/i915: Reduce bigjoiner special casing")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: George Rurikov <g.ryurikov@securitycode.ru>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/=
drm/i915/display/intel_display.c
>> index b4ef4d59da1a..1f25b12e5f67 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -819,9 +819,11 @@ intel_get_crtc_new_encoder(const struct intel_atomi=
c_state *state,
>>                 num_encoders++;
>>         }
>>
>> -       drm_WARN(state->base.dev, num_encoders !=3D 1,
>> +       if (encoder) {
>> +               drm_WARN(state->base.dev, num_encoders !=3D 1,
>>                  "%d encoders for pipe %c\n",
>>                  num_encoders, pipe_name(primary_crtc->pipe));
>> +       }
>>
>>         return encoder;
>>  }
>> --
>> 2.34.1
>>
>> =D0=97=D0=B0=D1=8F=D0=B2=D0=BB=D0=B5=D0=BD=D0=B8=D0=B5 =D0=BE =D0=BA=D0=
=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=
=D0=BE=D1=81=D1=82=D0=B8
>>
>> =D0=94=D0=B0=D0=BD=D0=BD=D0=BE=D0=B5 =D1=8D=D0=BB=D0=B5=D0=BA=D1=82=D1=
=80=D0=BE=D0=BD=D0=BD=D0=BE=D0=B5 =D0=BF=D0=B8=D1=81=D1=8C=D0=BC=D0=BE =D0=
=B8 =D0=BB=D1=8E=D0=B1=D1=8B=D0=B5 =D0=BF=D1=80=D0=B8=D0=BB=D0=BE=D0=B6=D0=
=B5=D0=BD=D0=B8=D1=8F =D0=BA =D0=BD=D0=B5=D0=BC=D1=83 =D1=8F=D0=B2=D0=BB=D1=
=8F=D1=8E=D1=82=D1=81=D1=8F =D0=BA=D0=BE=D0=BD=D1=84=D0=B8=D0=B4=D0=B5=D0=
=BD=D1=86=D0=B8=D0=B0=D0=BB=D1=8C=D0=BD=D1=8B=D0=BC=D0=B8 =D0=B8 =D0=BF=D1=
=80=D0=B5=D0=B4=D0=BD=D0=B0=D0=B7=D0=BD=D0=B0=D1=87=D0=B5=D0=BD=D1=8B =D0=
=B8=D1=81=D0=BA=D0=BB=D1=8E=D1=87=D0=B8=D1=82=D0=B5=D0=BB=D1=8C=D0=BD=D0=BE=
 =D0=B4=D0=BB=D1=8F =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=B0=D1=82=D0=B0. =D0=
=95=D1=81=D0=BB=D0=B8 =D0=92=D1=8B =D0=BD=D0=B5 =D1=8F=D0=B2=D0=BB=D1=8F=D0=
=B5=D1=82=D0=B5=D1=81=D1=8C =D0=B0=D0=B4=D1=80=D0=B5=D1=81=D0=B0=D1=82=D0=
=BE=D0=BC =D0=B4=D0=B0=D0=BD=D0=BD=D0=BE=D0=B3=D0=BE =D0=BF=D0=B8=D1=81=D1=
=8C=D0=BC=D0=B0, =D0=BF=D0=BE=D0=B6=D0=B0=D0=BB=D1=83=D0=B9=D1=81=D1=82=D0=
=B0, =D1=83=D0=B2=D0=B5=D0=B4=D0=BE=D0=BC=D0=B8=D1=82=D0=B5 =D0=BD=D0=B5=D0=
=BC=D0=B5=D0=B4=D0=BB=D0=B5=D0=BD=D0=BD=D0=BE =D0=BE=D1=82=D0=BF=D1=80=D0=
=B0=D0=B2=D0=B8=D1=82=D0=B5=D0=BB=D1=8F, =D0=BD=D0=B5 =D1=80=D0=B0=D1=81=D0=
=BA=D1=80=D1=8B=D0=B2=D0=B0=D0=B9=D1=82=D0=B5 =D1=81=D0=BE=D0=B4=D0=B5=D1=
=80=D0=B6=D0=B0=D0=BD=D0=B8=D0=B5 =D0=B4=D1=80=D1=83=D0=B3=D0=B8=D0=BC =D0=
=BB=D0=B8=D1=86=D0=B0=D0=BC, =D0=BD=D0=B5 =D0=B8=D1=81=D0=BF=D0=BE=D0=BB=D1=
=8C=D0=B7=D1=83=D0=B9=D1=82=D0=B5 =D0=B5=D0=B3=D0=BE =D0=B2 =D0=BA=D0=B0=D0=
=BA=D0=B8=D1=85-=D0=BB=D0=B8=D0=B1=D0=BE =D1=86=D0=B5=D0=BB=D1=8F=D1=85, =
=D0=BD=D0=B5 =D1=85=D1=80=D0=B0=D0=BD=D0=B8=D1=82=D0=B5 =D0=B8 =D0=BD=D0=B5=
 =D0=BA=D0=BE=D0=BF=D0=B8=D1=80=D1=83=D0=B9=D1=82=D0=B5 =D0=B8=D0=BD=D1=84=
=D0=BE=D1=80=D0=BC=D0=B0=D1=86=D0=B8=D1=8E =D0=BB=D1=8E=D0=B1=D1=8B=D0=BC =
=D1=81=D0=BF=D0=BE=D1=81=D0=BE=D0=B1=D0=BE=D0=BC.
>
> Sorry, we can't accept patches with that boilerplate anyway.
>
> BR,
> Jani.

--=20
Jani Nikula, Intel
