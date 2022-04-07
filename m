Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382B64F7785
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6702410E572;
	Thu,  7 Apr 2022 07:32:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AFDE10E572
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 07:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649316743; x=1680852743;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=J8FZb1pAYjiPBp+ILZb3KYteq3AkCkVei0icA2kGojQ=;
 b=HJ8B25sAEx4diUrMyhTwD1i1m9AW+qfRYDjK0BYaoPAlKOHl1UPRBvmL
 +nbrWegUbnwNAKHv2q+EXxyyH4VbN4vh3VmTSOj5gLpR99CkBt/b+Oi1r
 BPPxBfECR8tzAYCiMJfMw1/+cvUaICWOcwfA+PrVnAUgtKwn0uGkEh5H4
 L+bg4yP9rSTv1CwDKiNfxYlkafXvVvTIdN7o8Tcykjg5Na4cBnB/rnsO3
 bQfGaVAlQ+jXJT/86Mh9acQwv4Q/z5uy2YKeHuWawWT9VSUmUrPDMtik2
 oeVHl8fd9FoF4hlEO9QxIDHlXg8tC9+JPITDVJ8N4QR0y6QJaWSzeNcQJ Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="261246077"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="261246077"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:32:22 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="549903492"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:32:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
In-Reply-To: <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
 <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de>
Date: Thu, 07 Apr 2022 10:32:17 +0300
Message-ID: <871qy973i6.fsf@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 06 Apr 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Hi
>
> Am 30.03.22 um 12:35 schrieb Jani Nikula:
>> On Tue, 22 Mar 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>> index 144c495b99c4..e6e9e4557067 100644
>>> --- a/include/drm/drm_edid.h
>>> +++ b/include/drm/drm_edid.h
>>> @@ -391,33 +391,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
>>>   
>>>   bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
>>>   
>>> -int
>>> -drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
>>> -					 const struct drm_connector *connector,
>>> -					 const struct drm_display_mode *mode);
>>> -int
>>> -drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
>>> -					    const struct drm_connector *connector,
>>> -					    const struct drm_display_mode *mode);
>>> -
>>> -void
>>> -drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
>>> -				   const struct drm_connector_state *conn_state);
>>> -
>>> -void
>>> -drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
>>> -			    const struct drm_connector_state *conn_state);
>>> -
>>> -void
>>> -drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
>>> -				   const struct drm_connector *connector,
>>> -				   const struct drm_display_mode *mode,
>>> -				   enum hdmi_quantization_range rgb_quant_range);
>>> -
>>> -int
>>> -drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
>>> -				    const struct drm_connector_state *conn_state);
>>> -
>>>   /**
>>>    * drm_eld_mnl - Get ELD monitor name length in bytes.
>>>    * @eld: pointer to an eld memory structure with mnl set
>>> @@ -587,6 +560,10 @@ void drm_edid_get_monitor_name(struct edid *edid, char *name,
>>>   struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>>>   					   int hsize, int vsize, int fresh,
>>>   					   bool rb);
>>> +
>>> +u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match);
>>> +enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code);
>>> +enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code);
>> 
>> I think these were fine as static, but not really great interfaces to
>> export. There's zero input checking on the vic in the latter, because
>> internally we could be sure they were fine.
>
> I see. If nothing else, HDMI could be removed from the patchset. OTOH 
> having these HDMI functions as part of the edid code doesn't seem right 
> either.
>
>> 
>> I also wish we could limit the usage to the module you're adding; this
>> is now available to all drivers which should be discouraged.
>
> Why is that discouraged? Quite a few drivers use these interfaces.

No driver needed to directly use the functions you're now additionally
exporting from drm_edid.c. I'd hope no driver starts to use them either.

BR,
Jani.



>
> Best regards
> Thomas
>> 
>> 
>> BR,
>> Jani.
>> 
>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
