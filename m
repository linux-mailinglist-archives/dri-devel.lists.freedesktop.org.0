Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B98D3498302
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 16:05:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D99AB10E3FD;
	Mon, 24 Jan 2022 15:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1404810E3FD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643036756; x=1674572756;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DtfD42EIIauGdswnOegCdP+L5Ndj1hsm8lMtlZGkNi4=;
 b=G1w9HBB/0P7GQ9rm5AiF5WUYab705PWlw01Wfos79wHMCrQZUbbFjINS
 pKumw5vgk9wTocWhPumj8vXAn6WPpgSalpCwJrijJ8pGxK2R/V9qiBndb
 fx+9vKMf7ml9PHRd0RqP0QTniXy8mWiCUgyprv+MxaDxZnsUu+IwQInYz
 kt13DIkxM3jri6xf1QYSP7MdvXyLCAME32zxcdWN9o0d/auC2XscTYVDU
 pVSiagTSs8vz6Grkz8xqel7UbQzz83UynuzMLeH/x+uO/7rA6c8WQDIJs
 WLemN7U/5qmHE2nuDvGzmF5cpxZiPZqGQc4mdhht6omO9EJTH70PXB18/ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="243661095"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="243661095"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:05:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="534256306"
Received: from epreiss-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.54.23])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 07:05:51 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <philipp.zabel@gmail.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/edid: support Microsoft extension for HMDs
 and specialized monitors
In-Reply-To: <20220123101653.147333-1-philipp.zabel@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220123101653.147333-1-philipp.zabel@gmail.com>
Date: Mon, 24 Jan 2022 17:05:38 +0200
Message-ID: <87fspd2myl.fsf@intel.com>
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

On Sun, 23 Jan 2022, Philipp Zabel <philipp.zabel@gmail.com> wrote:
> Add minimal support for parsing VSDBs documented in Microsoft's "EDID
> extension for head-mounted and specialized monitors" [1]. The version
> field and the desktop usage flag can be used to set the non_desktop
> connector property.
>
> [1] https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
>
> Tested with HPN-36C1 and LEN-B800.
>
> Signed-off-by: Philipp Zabel <philipp.zabel@gmail.com>
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>

Thanks for the patches, both pushed to drm-misc-next.

BR,
Jani.


> ---
> Changes since v1 [2]:
>  - Split out quirk removal into a separate patch.
>  - Set non_desktop to true instead of 1.
>
> [2] https://lore.kernel.org/all/20211213184706.5776-1-philipp.zabel@gmail.com/
> ---
>  drivers/gpu/drm/drm_edid.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 12893e7be89b..271b5616cfaf 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -93,6 +93,8 @@ static int oui(u8 first, u8 second, u8 third)
>  /* Non desktop display (i.e. HMD) */
>  #define EDID_QUIRK_NON_DESKTOP			(1 << 12)
>  
> +#define MICROSOFT_IEEE_OUI	0xca125c
> +
>  struct detailed_mode_closure {
>  	struct drm_connector *connector;
>  	struct edid *edid;
> @@ -4222,6 +4224,17 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
>  	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
>  }
>  
> +static bool cea_db_is_microsoft_vsdb(const u8 *db)
> +{
> +	if (cea_db_tag(db) != VENDOR_BLOCK)
> +		return false;
> +
> +	if (cea_db_payload_len(db) != 21)
> +		return false;
> +
> +	return oui(db[3], db[2], db[1]) == MICROSOFT_IEEE_OUI;
> +}
> +
>  static bool cea_db_is_vcdb(const u8 *db)
>  {
>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> @@ -5149,6 +5162,25 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
>  	drm_parse_hdmi_deep_color_info(connector, db);
>  }
>  
> +/*
> + * See EDID extension for head-mounted and specialized monitors, specified at:
> + * https://docs.microsoft.com/en-us/windows-hardware/drivers/display/specialized-monitors-edid-extension
> + */
> +static void drm_parse_microsoft_vsdb(struct drm_connector *connector,
> +				     const u8 *db)
> +{
> +	struct drm_display_info *info = &connector->display_info;
> +	u8 version = db[4];
> +	bool desktop_usage = db[5] & BIT(6);
> +
> +	/* Version 1 and 2 for HMDs, version 3 flags desktop usage explicitly */
> +	if (version == 1 || version == 2 || (version == 3 && !desktop_usage))
> +		info->non_desktop = true;
> +
> +	drm_dbg_kms(connector->dev, "HMD or specialized display VSDB version %u: 0x%02x\n",
> +		    version, db[5]);
> +}
> +
>  static void drm_parse_cea_ext(struct drm_connector *connector,
>  			      const struct edid *edid)
>  {
> @@ -5179,6 +5211,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
>  			drm_parse_hdmi_vsdb_video(connector, db);
>  		if (cea_db_is_hdmi_forum_vsdb(db))
>  			drm_parse_hdmi_forum_vsdb(connector, db);
> +		if (cea_db_is_microsoft_vsdb(db))
> +			drm_parse_microsoft_vsdb(connector, db);
>  		if (cea_db_is_y420cmdb(db))
>  			drm_parse_y420cmdb_bitmap(connector, db);
>  		if (cea_db_is_vcdb(db))
>
> base-commit: e783362eb54cd99b2cac8b3a9aeac942e6f6ac07

-- 
Jani Nikula, Intel Open Source Graphics Center
