Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E5C48084A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 11:14:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B3710E161;
	Tue, 28 Dec 2021 10:14:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B387B10E161
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 10:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640686454; x=1672222454;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=jtOHu217uhRk7zRRyENCgBd2gvN750ns1EuHAv3eZKk=;
 b=YYlCFcDMWA71sd4QFZdgFI5hCpHEYZfGtY0L/W0R4YlnEJHEy8s8TyKP
 bVh8XYMbb73JFYorMotRHRhrXbJO3UHDoPqqnGT8VeKAi5rFgmMFsPBx0
 aO0BG2QpCj43Q9NIELjZcCYTQ0VAyQF6ZvGVWCnlI0gjRYof6xszJsxEs
 jgUxfZdRc3LJqwiTI+xFG07kxszvvxXpJ/eG9sHIjEyTuOLG5h4BRlPty
 7s0KAIrPVQSk3hIqcF8N45hpbCd5pFwdUaKjuiZR+053o3W91DhrOIOq7
 lA4tXSuFLDUh1jVP4t/luWsTW742xFoLrTYgwO2pZVExsquB6sVSho5ZM w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="302100567"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="302100567"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 02:14:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="523589393"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.10.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 02:14:12 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Philipp Zabel <philipp.zabel@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: support Microsoft extension for HMDs and
 specialized monitors
In-Reply-To: <87zgoljb36.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20211213184706.5776-1-philipp.zabel@gmail.com>
 <87zgoljb36.fsf@intel.com>
Date: Tue, 28 Dec 2021 12:14:09 +0200
Message-ID: <87wnjpjatq.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jakob Bornecrantz <jakob@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Dec 2021, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Mon, 13 Dec 2021, Philipp Zabel <philipp.zabel@gmail.com> wrote:
>> Add minimal support for parsing VSDBs documented in Microsoft's "EDID
>> extension for head-mounted and specialized monitors" [1]. The version
>> field and the desktop usage flag can be used to set the non_desktop
>> connector property.
>>
>> Remove the non-desktop quirk for devices that are verified to contain
>> the VSDB: HPN-3515 and LEN-B800. Presumably most of the other Windows
>> Mixed Reality headsets contain it as well, but there are ACR-7FCE and
>> SEC-5194 devices without it.
>>
>> [1] https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
>>
>> Tested with HPN-36C1 and LEN-B800.
>>
>> Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 36 ++++++++++++++++++++++++++++++++++--
>>  1 file changed, 34 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index 12893e7be89b..baea65dfff7d 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -93,6 +93,8 @@ static int oui(u8 first, u8 second, u8 third)
>>  /* Non desktop display (i.e. HMD) */
>>  #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
>>  
>> +#define MICROSOFT_IEEE_OUI	0xca125c
>> +
>>  struct detailed_mode_closure {
>>  	struct drm_connector *connector;
>>  	struct edid *edid;
>> @@ -212,9 +214,7 @@ static const struct edid_quirk {
>>  
>>  	/* Windows Mixed Reality Headsets */
>>  	EDID_QUIRK('A', 'C', 'R', 0x7fce, EDID_QUIRK_NON_DESKTOP),
>> -	EDID_QUIRK('H', 'P', 'N', 0x3515, EDID_QUIRK_NON_DESKTOP),
>>  	EDID_QUIRK('L', 'E', 'N', 0x0408, EDID_QUIRK_NON_DESKTOP),
>> -	EDID_QUIRK('L', 'E', 'N', 0xb800, EDID_QUIRK_NON_DESKTOP),
>
> Nitpick, in general I'd prefer the quirk removal to be a separate patch,
> but not a big issue here.
>
>>  	EDID_QUIRK('F', 'U', 'J', 0x1970, EDID_QUIRK_NON_DESKTOP),
>>  	EDID_QUIRK('D', 'E', 'L', 0x7fce, EDID_QUIRK_NON_DESKTOP),
>>  	EDID_QUIRK('S', 'E', 'C', 0x144a, EDID_QUIRK_NON_DESKTOP),
>> @@ -4222,6 +4222,17 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
>>  	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
>>  }
>>  
>> +static bool cea_db_is_microsoft_vsdb(const u8 *db)
>> +{
>> +	if (cea_db_tag(db) != VENDOR_BLOCK)
>> +		return false;
>> +
>> +	if (cea_db_payload_len(db) != 21)
>> +		return false;
>> +
>> +	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
>> +}
>> +
>>  static bool cea_db_is_vcdb(const u8 *db)
>>  {
>>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
>> @@ -5149,6 +5160,25 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>>  	drm_parse_hdmi_deep_color_info(connector, db);
>>  }
>>  
>> +/*
>> + * See EDID extension for head-mounted and specialized monitors, specified at:
>> + * https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
>> + */
>> +static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
>> +				     const u8 *db)
>> +{
>> +	struct drm_display_info *info = &connector->display_info;
>> +	u8 version = db[4];
>> +	bool desktop_usage = db[5] & BIT(6);
>> +
>> +	/* Version 1 and 2 for HMDs, version 3 flags desktop usage explicitly */
>> +	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
>> +		info->non_desktop = 1;
>
> Nitpick, bool should be set to true instead of 1.
>
> With this one fixed,
>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
>
> I'll also reply with a follow-up patch that I think improves the logging
> between this and the quirk.

To elaborate, after your patch, the log will contain:

non_desktop set to 0
HMD or specialized display VSDB version ...

And it will be non-desktop.

I don't know, maybe you want to improve on my patch further, but you get
the idea.


BR,
Jani.


>
>
> BR,
> Jani.
>
>
>> +
>> +	drm_dbg_kms(connector->dev, "HMD or specialized display VSDB version %u: 0x%02x\n",
>> +		    version, db[5]);
>> +}
>> +
>>  static void drm_parse_cea_ext(struct drm_connector *connector,
>>  			      const struct edid *edid)
>>  {
>> @@ -5179,6 +5209,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>>  			drm_parse_hdmi_vsdb_video(connector, db);
>>  		if (cea_db_is_hdmi_forum_vsdb(db))
>>  			drm_parse_hdmi_forum_vsdb(connector, db);
>> +		if (cea_db_is_microsoft_vsdb(db))
>> +			drm_parse_microsoft_vsdb(connector, db);
>>  		if (cea_db_is_y420cmdb(db))
>>  			drm_parse_y420cmdb_bitmap(connector, db);
>>  		if (cea_db_is_vcdb(db))
>>
>> base-commit: fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf

-- 
Jani Nikula, Intel Open Source Graphics Center
