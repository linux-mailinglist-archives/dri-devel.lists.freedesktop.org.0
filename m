Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B34789D375
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 09:42:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D42112B53;
	Tue,  9 Apr 2024 07:42:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bQhyXTqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C0A89ECB;
 Tue,  9 Apr 2024 07:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712648542; x=1744184542;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dkM6AkjxMeMMcKvqKEVEDQXhXQeWLDtTegYd2iWnrg0=;
 b=bQhyXTqThZ/dFWwQbj4/2Myagah3g1U94dPaJJ7UfwcmjGKDaHms6hXr
 mQkJvEHcqnmQL6nyyIj3ww7aCdoomyEb8Q1CLyaHYwqfDDBy3FhDOsTg3
 A79kg8l7lCjnANeZ96jJJltC7fqHQTPAsENnJ0gxBL+LrGvndBolliKOx
 zSIVyI43awpUhdS3KPhTwyXPiiwJIVx1XRqNDa39SLmz/I8nwqjt5u35i
 7aQadQgG4dn5OAJQJwawlBJj42rKFpyRk2B5pKIpDrXpeehSjybm+uvBR
 fOuxqik97Xq95C7yFBsmwhwHQx7RR4z7MD80uc6ZppHmHNWT7/Q4u5Lv6 Q==;
X-CSE-ConnectionGUID: GmiOYHUTR7ybszN7CTj2hg==
X-CSE-MsgGUID: DemzfDWaSQmPNDHK+//jeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="8129469"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="8129469"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:42:20 -0700
X-CSE-ConnectionGUID: lqfPiZ3dTGGcfwYdQ5UMhQ==
X-CSE-MsgGUID: muRuVoRoRWGkjdxRL6ctog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="20193058"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 00:42:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH 1/4] drm/edid: add drm_edid_get_product_id()
In-Reply-To: <ZhQzM2bCCKDr0IsY@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <cover.1711015462.git.jani.nikula@intel.com>
 <e3e7194ae72190a48916defa77b0a4de2fc87086.1711015462.git.jani.nikula@intel.com>
 <ZhQzM2bCCKDr0IsY@intel.com>
Date: Tue, 09 Apr 2024 10:42:15 +0300
Message-ID: <871q7f9e3s.fsf@intel.com>
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

On Mon, 08 Apr 2024, Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com=
> wrote:
> On Thu, Mar 21, 2024 at 12:05:09PM +0200, Jani Nikula wrote:
>> Add a struct drm_edid based function to get the vendor and product ID
>> from an EDID. Add a separate struct for defining this part of the EDID,
>> with defined byte order for product code and serial number.
>>=20
>> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 15 +++++++++++++++
>>  include/drm/drm_edid.h     | 25 ++++++++++++++++++++-----
>>  2 files changed, 35 insertions(+), 5 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index ea77577a3786..626a0e24e66a 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -2756,6 +2756,21 @@ const struct drm_edid *drm_edid_read(struct drm_c=
onnector *connector)
>>  }
>>  EXPORT_SYMBOL(drm_edid_read);
>>=20=20
>> +/**
>> + * drm_edid_get_product_id - Get the vendor and product identification
>> + * @drm_edid: EDID
>> + * @id: Where to place the product id
>> + */
>> +void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>> +			     struct drm_edid_product_id *id)
>> +{
>> +	if (drm_edid && drm_edid->edid && drm_edid->size >=3D EDID_LENGTH)
>> +		memcpy(id, &drm_edid->edid->product_id, sizeof(*id));
>> +	else
>> +		memset(id, 0, sizeof(*id));
>> +}
>> +EXPORT_SYMBOL(drm_edid_get_product_id);
>> +
>>  /**
>>   * drm_edid_get_panel_id - Get a panel's ID from EDID
>>   * @drm_edid: EDID that contains panel ID.
>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>> index 6f65bbf655a1..7911a2f8a672 100644
>> --- a/include/drm/drm_edid.h
>> +++ b/include/drm/drm_edid.h
>> @@ -272,14 +272,27 @@ struct detailed_timing {
>>  #define DRM_EDID_DSC_MAX_SLICES			0xf
>>  #define DRM_EDID_DSC_TOTAL_CHUNK_KBYTES		0x3f
>>=20=20
>> +struct drm_edid_product_id {
>> +	u8 manufacturer_name[2];
>
> __be16?

Yeah, why not.

BR,
Jani.

>
>> +	__le16 product_code;
>> +	__le32 serial_number;
>> +	u8 week_of_manufacture;
>> +	u8 year_of_manufacture;
>> +} __packed;
>> +
>>  struct edid {
>>  	u8 header[8];
>>  	/* Vendor & product info */
>> -	u8 mfg_id[2];
>> -	u8 prod_code[2];
>> -	u32 serial; /* FIXME: byte order */
>> -	u8 mfg_week;
>> -	u8 mfg_year;
>> +	union {
>> +		struct drm_edid_product_id product_id;
>> +		struct {
>> +			u8 mfg_id[2];
>> +			u8 prod_code[2];
>> +			u32 serial; /* FIXME: byte order */
>> +			u8 mfg_week;
>> +			u8 mfg_year;
>> +		} __packed;
>> +	} __packed;
>>  	/* EDID version */
>>  	u8 version;
>>  	u8 revision;
>> @@ -466,6 +479,8 @@ int drm_edid_connector_update(struct drm_connector *=
connector,
>>  			      const struct drm_edid *edid);
>>  int drm_edid_connector_add_modes(struct drm_connector *connector);
>>  bool drm_edid_is_digital(const struct drm_edid *drm_edid);
>> +void drm_edid_get_product_id(const struct drm_edid *drm_edid,
>> +			     struct drm_edid_product_id *id);
>>=20=20
>>  const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
>>  				  int ext_id, int *ext_index);
>> --=20
>> 2.39.2

--=20
Jani Nikula, Intel
