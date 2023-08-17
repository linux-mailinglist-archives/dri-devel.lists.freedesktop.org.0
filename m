Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD4F77F685
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 14:40:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D784010E473;
	Thu, 17 Aug 2023 12:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B49910E470;
 Thu, 17 Aug 2023 12:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692276007; x=1723812007;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=zM8RnN99n0BSrCuxy2qnwMFhVWY3WXOLfkYZSHOWqQc=;
 b=UJzyp9tZzhwxZr/AeKOcBuHTu2HL9MXXS6wgVW/DWgslHczzRwLTL23R
 mwwCQGrZM58jm6PY6oceiGj1rUTfBpbSvReuGTugxXcouge6GoKsl8A4T
 xCm13GGDEmCLHe6XFgaHEhAXb8NxRFhxR8OVJ0TFiqwjAdexcha4WQoR6
 GJ5XTr7b5OO3CxNAqKRkj4D/9L6ojhO7PdJQ1xct40RRwc5RzWpN/Ayck
 77Ir5/nC6TGfDdUN0s9K1AINqkWI0euZDJ3BIOk7K//PlCQkbcDe8KQRQ
 qL0lxDO9PV1BuyXptwM8uO96feWnNgVcVvDHhwBGf9PXsvO9cjKPAtkKw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="353113373"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="353113373"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 05:40:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="684410460"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; d="scan'208";a="684410460"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.162])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2023 05:40:03 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH] Revert "drm/edid: Fix csync detailed mode parsing"
In-Reply-To: <ZN4GBQCtIi6v0D28@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230815101907.2900768-1-jani.nikula@intel.com>
 <ZN4GBQCtIi6v0D28@intel.com>
Date: Thu, 17 Aug 2023 15:40:00 +0300
Message-ID: <87r0o1971b.fsf@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 17 Aug 2023, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Tue, Aug 15, 2023 at 01:19:07PM +0300, Jani Nikula wrote:
>> This reverts commit ca62297b2085b5b3168bd891ca24862242c635a1.
>>=20
>> Commit ca62297b2085 ("drm/edid: Fix csync detailed mode parsing") fixed
>> EDID detailed mode sync parsing. Unfortunately, there are quite a few
>> displays out there that have bogus (zero) sync field that are broken by
>> the change. Zero means analog composite sync, which is not right for
>> digital displays, and the modes get rejected. Regardless, it used to
>> work, and it needs to continue to work. Revert the change.
>
> Bah. I guess one option would be to quirk the bogus EDIDs, or maybe just
> ignore bogus sync flags for the eDP preferred mode. But maybe needs a
> bit more thinking, so
>
> Acked-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>

Thanks, pushed to drm-misc-fixes.

BR,
Jani.


>
>>=20
>> Rejecting modes with analog composite sync was the part that fixed the
>> gitlab issue 8146 [1]. We'll need to get back to the drawing board with
>> that.
>>=20
>> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/8146
>>=20
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8789
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/8930
>> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/9044
>> Fixes: ca62297b2085 ("drm/edid: Fix csync detailed mode parsing")
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v6.4+
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 29 ++++++++---------------------
>>  include/drm/drm_edid.h     | 12 +++---------
>>  2 files changed, 11 insertions(+), 30 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index f95152fac427..340da8257b51 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3457,6 +3457,10 @@ static struct drm_display_mode *drm_mode_detailed=
(struct drm_connector *connecto
>>  			    connector->base.id, connector->name);
>>  		return NULL;
>>  	}
>> +	if (!(pt->misc & DRM_EDID_PT_SEPARATE_SYNC)) {
>> +		drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Composite sync not supported\n",
>> +			    connector->base.id, connector->name);
>> +	}
>>=20=20
>>  	/* it is incorrect if hsync/vsync width is zero */
>>  	if (!hsync_pulse_width || !vsync_pulse_width) {
>> @@ -3503,27 +3507,10 @@ static struct drm_display_mode *drm_mode_detaile=
d(struct drm_connector *connecto
>>  	if (info->quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
>>  		mode->flags |=3D DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
>>  	} else {
>> -		switch (pt->misc & DRM_EDID_PT_SYNC_MASK) {
>> -		case DRM_EDID_PT_ANALOG_CSYNC:
>> -		case DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC:
>> -			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Analog composite sync!\n",
>> -				    connector->base.id, connector->name);
>> -			mode->flags |=3D DRM_MODE_FLAG_CSYNC | DRM_MODE_FLAG_NCSYNC;
>> -			break;
>> -		case DRM_EDID_PT_DIGITAL_CSYNC:
>> -			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] Digital composite sync!\n",
>> -				    connector->base.id, connector->name);
>> -			mode->flags |=3D DRM_MODE_FLAG_CSYNC;
>> -			mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> -				DRM_MODE_FLAG_PCSYNC : DRM_MODE_FLAG_NCSYNC;
>> -			break;
>> -		case DRM_EDID_PT_DIGITAL_SEPARATE_SYNC:
>> -			mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> -				DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
>> -			mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
>> -				DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
>> -			break;
>> -		}
>> +		mode->flags |=3D (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
>> +			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
>> +		mode->flags |=3D (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
>> +			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
>>  	}
>>=20=20
>>  set_size:
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 169755d3de19..48e93f909ef6 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -61,15 +61,9 @@ struct std_timing {
>>  	u8 vfreq_aspect;
>>  } __attribute__((packed));
>>=20=20
>> -#define DRM_EDID_PT_SYNC_MASK              (3 << 3)
>> -# define DRM_EDID_PT_ANALOG_CSYNC          (0 << 3)
>> -# define DRM_EDID_PT_BIPOLAR_ANALOG_CSYNC  (1 << 3)
>> -# define DRM_EDID_PT_DIGITAL_CSYNC         (2 << 3)
>> -#  define DRM_EDID_PT_CSYNC_ON_RGB         (1 << 1) /* analog csync onl=
y */
>> -#  define DRM_EDID_PT_CSYNC_SERRATE        (1 << 2)
>> -# define DRM_EDID_PT_DIGITAL_SEPARATE_SYNC (3 << 3)
>> -#  define DRM_EDID_PT_HSYNC_POSITIVE       (1 << 1) /* also digital csy=
nc */
>> -#  define DRM_EDID_PT_VSYNC_POSITIVE       (1 << 2)
>> +#define DRM_EDID_PT_HSYNC_POSITIVE (1 << 1)
>> +#define DRM_EDID_PT_VSYNC_POSITIVE (1 << 2)
>> +#define DRM_EDID_PT_SEPARATE_SYNC  (3 << 3)
>>  #define DRM_EDID_PT_STEREO         (1 << 5)
>>  #define DRM_EDID_PT_INTERLACED     (1 << 7)
>>=20=20
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel Open Source Graphics Center
