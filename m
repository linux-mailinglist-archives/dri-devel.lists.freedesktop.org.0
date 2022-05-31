Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D03BC538F6F
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 13:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABA0810FEC2;
	Tue, 31 May 2022 11:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8A410FEC2
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 11:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653995195; x=1685531195;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=YXDcSYnLS76U7hYsIeYu6Q7o0oFcGm6+5LGSb2lxc6M=;
 b=ImlRFL9wsV4jwOC9PW+eNsWvfBrDzmjsq/+Bc3RXr4Mq8JbxO3HYMQ4S
 SgMcfapTJPqwREWJfuhEPfVzN86IgGFOyhR4HblsmD5TEqX6xNu84H7JB
 Ud6u6MglpiB9oyCLu0zX0tG+9NaGZ7y8rQUaR8CE7WN6i/3E08oKCI1W8
 lswxCzSdkNb/zKTLYq83OYTAYNNiyUpPhXrn2wmbIh+meU5jQf4EoSEWl
 Lk3thL7y7puLo5fDPHhqihud/XSjo458OX0F1Yk+4KRvUpH8gAvFfbi5v
 1U1iSyiFMGskoY6b8aG/tE2gr6SEzWGhhNOENYAnHOmK8xy+KW1IMrp+M w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10363"; a="338263416"
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="338263416"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 04:06:34 -0700
X-IronPort-AV: E=Sophos;i="5.91,265,1647327600"; d="scan'208";a="754924740"
Received: from rrudnick-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.138.37])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 04:06:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: William Tseng <william.tseng@intel.com>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/edid: ignore the CEA modes not defined in CEA-861-D
In-Reply-To: <87y1yiq8ce.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220531103421.11363-1-william.tseng@intel.com>
 <87y1yiq8ce.fsf@intel.com>
Date: Tue, 31 May 2022 14:06:30 +0300
Message-ID: <87r14aq7ux.fsf@intel.com>
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
Cc: Wayne Lin <waynelin@amd.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 William Tseng <william.tseng@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 31 May 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Tue, 31 May 2022, William Tseng <william.tseng@intel.com> wrote:
>> This is a workaround for HDMI 1.4 sink which has a CEA mode with higher =
vic
>> than what is defined in CEA-861-D.
>>
>> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be
>> displayed and the video format is indicated by both SVD (with vic 90 and
>> pictuure aspect ratio 64:27) and DTD.  When connecting to such sink,
>> source can't output the video format in SVD because an error is returned=
 by
>> drm_hdmi_avi_infoframe_from_display_mode(), which can't fill the infofra=
me
>> with pictuure aspect ratio 64:27 and the vic, which is originally 90 and=
 is
>> changed to 0 by drm_mode_cea_vic().
>>
>> To work around it, this patch ignores such CEA modes in do_cea_modes() so
>> the modes won't be processed in drm_hdmi_avi_infoframe_from_display_mode=
().
>> And only the video format in DTD can be dispalyed.

I think we should also have a bug filed on this, with the offending EDID
attached for posterity.

BR,
Jani.


>>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: Wayne Lin <waynelin@amd.com>
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: William Tseng <william.tseng@intel.com>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 39 +++++++++++++++++++++++++-------------
>>  1 file changed, 26 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
>> index bc43e1b32092..a93f68878bfd 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -3982,6 +3982,19 @@ drm_display_mode_from_cea_vic(struct drm_device *=
dev,
>>  }
>>  EXPORT_SYMBOL(drm_display_mode_from_cea_vic);
>>=20=20
>> +static bool is_hdmi2_sink(const struct drm_connector *connector)
>> +{
>> +	/*
>> +	 * FIXME: sil-sii8620 doesn't have a connector around when
>> +	 * we need one, so we have to be prepared for a NULL connector.
>> +	 */
>> +	if (!connector)
>> +		return true;
>> +
>> +	return connector->display_info.hdmi.scdc.supported ||
>> +		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
>> +}
>> +
>>  static int
>>  do_cea_modes(struct drm_connector *connector, const u8 *db, u8 len)
>>  {
>> @@ -3993,6 +4006,19 @@ do_cea_modes(struct drm_connector *connector, con=
st u8 *db, u8 len)
>>=20=20
>>  		mode =3D drm_display_mode_from_vic_index(connector, db, len, i);
>>  		if (mode) {
>> +			u8 vic =3D svd_to_vic(db[i]);
>> +
>> +			if (!drm_valid_cea_vic(vic))
>> +				continue;
>
> drm_display_mode_from_vic_index() returns NULL in this case.
>
>> +
>> +			/*
>> +			 * HDMI 1.4 VIC range: 1 <=3D VIC <=3D 64 (CEA-861-D) but
>> +			 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>> +			 * have to make sure we dont break HDMI 1.4 sinks.
>> +			 */
>> +			if (!is_hdmi2_sink(connector) && vic > 64)
>> +				continue;
>
> I'll need to double check if this is the right thing to do... but I
> guess the question becomes if this shouldn't be within
> drm_display_mode_from_vic_index().
>
> Duplicating the condition from drm_mode_cea_vic() is probably not a good
> idea.
>
> The continues in both above branches leak the mode.
>
>
> BR,
> Jani.
>
>
>> +
>>  			/*
>>  			 * YCBCR420 capability block contains a bitmap which
>>  			 * gives the index of CEA modes from CEA VDB, which
>> @@ -5846,19 +5872,6 @@ void drm_set_preferred_mode(struct drm_connector =
*connector,
>>  }
>>  EXPORT_SYMBOL(drm_set_preferred_mode);
>>=20=20
>> -static bool is_hdmi2_sink(const struct drm_connector *connector)
>> -{
>> -	/*
>> -	 * FIXME: sil-sii8620 doesn't have a connector around when
>> -	 * we need one, so we have to be prepared for a NULL connector.
>> -	 */
>> -	if (!connector)
>> -		return true;
>> -
>> -	return connector->display_info.hdmi.scdc.supported ||
>> -		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
>> -}
>> -
>>  static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
>>  			    const struct drm_display_mode *mode)
>>  {

--=20
Jani Nikula, Intel Open Source Graphics Center
