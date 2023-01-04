Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7CB65D098
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DB0110E117;
	Wed,  4 Jan 2023 10:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95E10E117
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Jan 2023 10:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672827961; x=1704363961;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=oDQiSmQz32bE9m/txPPTPG+m+a0NhSrdTGiZxxiTnVg=;
 b=EuOEPlGJjoNK9X5wGOt3UNsOS8BKf3tQrqCswhao7A8r1PC6H5dxIopk
 kjl/FWuapFPFYa7BZHQHyqHofedI0Dy526a/kBjeyQGTBzoxllcked5Q4
 TB2gKXtoOi0eRSWWUyXnoIHsfgyBA85fGidOq3F7CN5NFz/nYv0OvRNXr
 cg/1aYO/84VyPRXHXB0ONJS1MThdNFs9qENBBj3I/DqrCOjy4PoRTL24w
 MnIWvGrhaij1GvuN6yzz9VR28VUbSEmQKke57p5tDeWrn0b1DmBFVBzvM
 wYynCjAYeFV7hFgdaBLf75HHPTjI14mlFMp2FjjGAXtZR0dnjG/68gfVL g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="386337465"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="386337465"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:25:59 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="718405565"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="718405565"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:25:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: "20220920062316.43162-1-william.tseng@intel.com"
 <20220920062316.43162-1-william.tseng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA-861-D
In-Reply-To: <SJ0PR11MB58946275D10EBF8AED8A14C5F11B9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220613122655.12432-1-william.tseng@intel.com>
 <20220920062316.43162-1-william.tseng@intel.com>
 <878rmepmko.fsf@intel.com>
 <SJ0PR11MB58944CA27943062C69693C62F14C9@SJ0PR11MB5894.namprd11.prod.outlook.com>
 <SJ0PR11MB58946275D10EBF8AED8A14C5F11B9@SJ0PR11MB5894.namprd11.prod.outlook.com>
Date: Wed, 04 Jan 2023 12:25:55 +0200
Message-ID: <87bkney4ss.fsf@intel.com>
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
Cc: "Lee, Shawn C" <shawn.c.lee@intel.com>, Wayne Lin <waynelin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 06 Dec 2022, "Tseng, William" <william.tseng@intel.com> wrote:
> Hi Jani
>
> May I have your comment about this patch?
> BTW, this is the link to the binary EDID,  https://gitlab.freedesktop.org=
/drm/intel/-/issues/6153#note_1558419.
> Thank you.

I must admit I didn't initially understand what the root cause here was.

I was looking at this again in the context of other EDID parsing
changes, and took the liberty of fixing this in a slightly different,
and more compact, way [1].

Later in the same series, I also opt to send the actual VIC in the AVI
infoframe if the sink lists the VIC in the CTA VDB [2].

Testing of [1] would be appreciated, and if it isn't too much trouble,
also patches 1-5 in the series to see if [2] is a reasonable choice.

Thanks,
Jani.


[1] https://patchwork.freedesktop.org/patch/msgid/c3e78cc6d01ed237f71ad0038=
826b08d83d75eef.1672826282.git.jani.nikula@intel.com
[2] https://patchwork.freedesktop.org/patch/msgid/775124fd07a5b7892e869becc=
3dd8dadb328ae5f.1672826282.git.jani.nikula@intel.com


>
>
> Regards
> William
>
> -----Original Message-----
> From: Tseng, William=20
> Sent: Tuesday, September 20, 2022 4:23 PM
> To: Jani Nikula <jani.nikula@linux.intel.com>; dri-devel@lists.freedeskto=
p.org
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>; Wayne Lin <w=
aynelin@amd.com>; Lee, Shawn C <shawn.c.lee@intel.com>
> Subject: RE: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA=
-861-D
>
> For EDID, please refer to the attachment on the link.
> https://gitlab.freedesktop.org/drm/intel/-/issues/6153#note_1558419
>
>
> Regards
> William
>
> -----Original Message-----
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: Tuesday, September 20, 2022 2:49 PM
> To: Tseng, William <william.tseng@intel.com>; dri-devel@lists.freedesktop=
.org
> Cc: Tseng, William <william.tseng@intel.com>; Ville Syrj=C3=A4l=C3=A4 <vi=
lle.syrjala@linux.intel.com>; Wayne Lin <waynelin@amd.com>; Lee, Shawn C <s=
hawn.c.lee@intel.com>
> Subject: Re: [PATCH v4] drm/edid: ignore the CEA modes not defined in CEA=
-861-D
>
> On Tue, 20 Sep 2022, William Tseng <william.tseng@intel.com> wrote:
>> This is a workaround for HDMI 1.4 sink which has a CEA mode with=20
>> higher vic than what is defined in CEA-861-D.
>>
>> As an example, a HDMI 1.4 sink has the video format 2560x1080p to be=20
>> displayed and the video format is indicated by both SVD (with vic 90=20
>> and picture aspect ratio 64:27) and DTD.  When connecting to such=20
>> sink, source can't output the video format in SVD because an error is=20
>> returned by drm_hdmi_avi_infoframe_from_display_mode(), which can't=20
>> fill the infoframe with picture aspect ratio 64:27 and the vic, which=20
>> is originally 90 and is changed to 0 by drm_mode_cea_vic().
>>
>> To work around it, do not set the vic 0 so the corresponding mode may=20
>> be accepted in drm_hdmi_avi_infoframe_from_display_mode() and be dispaly=
ed.
>>
>> v1: initial version.
>> v2: change the logic in drm_hdmi_avi_infoframe_from_display_mode().
>> v3: fix typo.
>> v4: add revision history.
>>
>> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>> Cc: Jani Nikula <jani.nikula@linux.intel.com>
>> Cc: Wayne Lin <waynelin@amd.com>
>> Cc: Lee Shawn C <shawn.c.lee@intel.com>
>> Signed-off-by: William Tseng <william.tseng@intel.com>
>
> Please attach the offending EDID to the bug [1]. I won't ack this before =
we see the EDID in question.
>
>
> BR,
> Jani.
>
>
> [1] https://gitlab.freedesktop.org/drm/intel/-/issues/6153
>
>> ---
>>  drivers/gpu/drm/drm_edid.c | 10 ++++++----
>>  1 file changed, 6 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c=20
>> index eaa819381281..3c6a4e09b2d6 100644
>> --- a/drivers/gpu/drm/drm_edid.c
>> +++ b/drivers/gpu/drm/drm_edid.c
>> @@ -6640,7 +6640,8 @@ static u8 drm_mode_hdmi_vic(const struct=20
>> drm_connector *connector,  }
>>=20=20
>>  static u8 drm_mode_cea_vic(const struct drm_connector *connector,
>> -			   const struct drm_display_mode *mode)
>> +			   const struct drm_display_mode *mode,
>> +			   bool is_hdmi2_sink)
>>  {
>>  	u8 vic;
>>=20=20
>> @@ -6660,7 +6661,7 @@ static u8 drm_mode_cea_vic(const struct drm_connec=
tor *connector,
>>  	 * HDMI 2.0 VIC range: 1 <=3D VIC <=3D 107 (CEA-861-F). So we
>>  	 * have to make sure we dont break HDMI 1.4 sinks.
>>  	 */
>> -	if (!is_hdmi2_sink(connector) && vic > 64)
>> +	if (!is_hdmi2_sink && vic > 64)
>>  		return 0;
>>=20=20
>>  	return vic;
>> @@ -6691,7 +6692,7 @@ drm_hdmi_avi_infoframe_from_display_mode(struct hd=
mi_avi_infoframe *frame,
>>  	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
>>  		frame->pixel_repeat =3D 1;
>>=20=20
>> -	vic =3D drm_mode_cea_vic(connector, mode);
>> +	vic =3D drm_mode_cea_vic(connector, mode, true);
>>  	hdmi_vic =3D drm_mode_hdmi_vic(connector, mode);
>>=20=20
>>  	frame->picture_aspect =3D HDMI_PICTURE_ASPECT_NONE; @@ -6735,7 +6736,8=
=20
>> @@ drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *f=
rame,
>>  		picture_aspect =3D HDMI_PICTURE_ASPECT_NONE;
>>  	}
>>=20=20
>> -	frame->video_code =3D vic;
>> +	frame->video_code =3D drm_mode_cea_vic(connector, mode,
>> +						is_hdmi2_sink(connector));
>>  	frame->picture_aspect =3D picture_aspect;
>>  	frame->active_aspect =3D HDMI_ACTIVE_ASPECT_PICTURE;
>>  	frame->scan_mode =3D HDMI_SCAN_MODE_UNDERSCAN;
>
> --
> Jani Nikula, Intel Open Source Graphics Center

--=20
Jani Nikula, Intel Open Source Graphics Center
