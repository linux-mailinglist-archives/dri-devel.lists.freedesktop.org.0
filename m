Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 085CF14F38D
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 22:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6036F6E24D;
	Fri, 31 Jan 2020 21:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 949176E24B
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2020 21:07:11 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1580504832; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2o/MGv2EXSkD4CZhOwtBopRl7G1ZLM64R+tPgX8YM3c=;
 b=ZQ/8UkPQjSHAY+qgKireqIov+TfTj7hROprzk4w/CoE1UWkd2eu7FAopGs4wEaeucoNdL7RE
 J2Z9GyZdGBCUd0dnYus3ALUTcKFahZAvi6pMJDgYsZPRcRCCyhWNKqAkszpLbsdekMBGRKuk
 wPqR7ng2IhO/fcBrPC+7RrYCjIo=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3495b3.7f95a249d030-smtp-out-n03;
 Fri, 31 Jan 2020 21:01:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 38BB4C43383; Fri, 31 Jan 2020 21:01:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5CFE2C433CB;
 Fri, 31 Jan 2020 21:01:38 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 31 Jan 2020 13:01:38 -0800
From: abhinavk@codeaurora.org
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm: Parse Colorimetry data block from EDID
In-Reply-To: <1580168406-23808-1-git-send-email-abhinavk@codeaurora.org>
References: <1580168406-23808-1-git-send-email-abhinavk@codeaurora.org>
Message-ID: <90542e32913e315bae02865e1d18a622@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: adelva@google.com, linux-arm-msm@vger.kernel.org, swboyd@chromium.org,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org,
 aravindh@codeaurora.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven

Any further comments on this change?

Thanks

Abhinav
On 2020-01-27 15:40, Abhinav Kumar wrote:
> From: Uma Shankar <uma.shankar@intel.com>
> 
> CEA 861.3 spec adds colorimetry data block for HDMI.
> Parsing the block to get the colorimetry data from
> panel.
> 
> This was posted by Uma Shankar at
> https://patchwork.kernel.org/patch/10861327/
> 
> Modified by Abhinav Kumar:
> - Use macros to distinguish the bit fields for clarity
> 
> Changes in v2:
> - Use the drm_edid.h macros in drm_edid.c (Stephen Boyd)
> 
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/drm_edid.c  | 45 
> +++++++++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_connector.h |  3 +++
>  include/drm/drm_edid.h      | 14 ++++++++++++++
>  3 files changed, 62 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 99769d6..9a82fb8 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -3136,6 +3136,7 @@ static int drm_cvt_modes(struct drm_connector 
> *connector,
>  #define VIDEO_BLOCK     0x02
>  #define VENDOR_BLOCK    0x03
>  #define SPEAKER_BLOCK	0x04
> +#define COLORIMETRY_DATA_BLOCK		0x5
>  #define HDR_STATIC_METADATA_BLOCK	0x6
>  #define USE_EXTENDED_TAG 0x07
>  #define EXT_VIDEO_CAPABILITY_BLOCK 0x00
> @@ -4199,6 +4200,48 @@ static void
> fixup_detailed_cea_mode_clock(struct drm_display_mode *mode)
>  	mode->clock = clock;
>  }
> 
> +static bool cea_db_is_hdmi_colorimetry_data_block(const u8 *db)
> +{
> +	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> +		return false;
> +
> +	if (db[1] != COLORIMETRY_DATA_BLOCK)
> +		return false;
> +
> +	if (cea_db_payload_len(db) < 2)
> +		return false;
> +
> +	return true;
> +}
> +
> +static void
> +drm_parse_colorimetry_data_block(struct drm_connector *connector, 
> const u8 *db)
> +{
> +	struct drm_hdmi_info *info = &connector->display_info.hdmi;
> +
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_601)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_xvYCC_709)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_xvYCC_709;
> +	if (db[2] & DRM_EDID_CLRMETRY_sYCC_601)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_sYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADBYCC_601)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_ADBYCC_601;
> +	if (db[2] & DRM_EDID_CLRMETRY_ADB_RGB)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_ADB_RGB;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_CYCC)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_CYCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_YCC)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_YCC;
> +	if (db[2] & DRM_EDID_CLRMETRY_BT2020_RGB)
> +		info->colorimetry |= DRM_EDID_CLRMETRY_BT2020_RGB;
> +	/* Byte 4 Bit 7: DCI-P3 */
> +	if (db[3] & BIT(7))
> +		info->colorimetry |= DRM_EDID_CLRMETRY_DCI_P3;
> +
> +	DRM_DEBUG_KMS("Supported Colorimetry 0x%x\n", info->colorimetry);
> +}
> +
>  static bool cea_db_is_hdmi_hdr_metadata_block(const u8 *db)
>  {
>  	if (cea_db_tag(db) != USE_EXTENDED_TAG)
> @@ -4877,6 +4920,8 @@ static void drm_parse_cea_ext(struct
> drm_connector *connector,
>  			drm_parse_vcdb(connector, db);
>  		if (cea_db_is_hdmi_hdr_metadata_block(db))
>  			drm_parse_hdr_metadata_block(connector, db);
> +		if (cea_db_is_hdmi_colorimetry_data_block(db))
> +			drm_parse_colorimetry_data_block(connector, db);
>  	}
>  }
> 
> diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
> index 2219109..a996ee3 100644
> --- a/include/drm/drm_connector.h
> +++ b/include/drm/drm_connector.h
> @@ -207,6 +207,9 @@ struct drm_hdmi_info {
> 
>  	/** @y420_dc_modes: bitmap of deep color support index */
>  	u8 y420_dc_modes;
> +
> +	/* @colorimetry: bitmap of supported colorimetry modes */
> +	u16 colorimetry;
>  };
> 
>  /**
> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
> index f0b03d4..4f22f22 100644
> --- a/include/drm/drm_edid.h
> +++ b/include/drm/drm_edid.h
> @@ -224,6 +224,20 @@ struct detailed_timing {
>  				    DRM_EDID_YCBCR420_DC_36 | \
>  				    DRM_EDID_YCBCR420_DC_30)
> 
> +/*
> + * Supported Colorimetry from colorimetry data block
> + * as per CEA 861-G spec
> + */
> +#define DRM_EDID_CLRMETRY_xvYCC_601   (1 << 0)
> +#define DRM_EDID_CLRMETRY_xvYCC_709   (1 << 1)
> +#define DRM_EDID_CLRMETRY_sYCC_601    (1 << 2)
> +#define DRM_EDID_CLRMETRY_ADBYCC_601  (1 << 3)
> +#define DRM_EDID_CLRMETRY_ADB_RGB     (1 << 4)
> +#define DRM_EDID_CLRMETRY_BT2020_CYCC (1 << 5)
> +#define DRM_EDID_CLRMETRY_BT2020_YCC  (1 << 6)
> +#define DRM_EDID_CLRMETRY_BT2020_RGB  (1 << 7)
> +#define DRM_EDID_CLRMETRY_DCI_P3      (1 << 15)
> +
>  /* ELD Header Block */
>  #define DRM_ELD_HEADER_BLOCK_SIZE	4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
