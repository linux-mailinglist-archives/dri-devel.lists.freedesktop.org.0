Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D943F4F77A2
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00EF510E55A;
	Thu,  7 Apr 2022 07:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD9E310E55A
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 07:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649316887; x=1680852887;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=RWgELCyWrl+lCylDiA14En8+ave8Qq1B7Aatr3tB0Ts=;
 b=B7GcfBDH+QHZfwSKO8tqrBQYnmDv9zGAmZv9cM6l3U9TIGOhJqr3jBYY
 IB8eLVN7MacwuVJUgQ4Kk60Vq8KPxWhKpN9RbL7KX5geJK6QshRloWJlj
 pXhnMVCcyJC/4/C6QnXe8JBDfyWTjupAenkA14kKsrSLHIiJewkhK1LW9
 Z7hadOxGtemHjMVY0T9jwCdnwnh5nsPamClIJGTxcTZrx6BkZvKHw2IeE
 4u6TkUbf7h+ygcGXFwWRlDo07NQ8jakxhqcR6Ka++J+CJEsZBOTObNIqa
 2l/8/D9FbACpgI0wENGpOaCKdhbRaAsFlru9lY62MZXvDueEU6zGHVQGz Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="286232400"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="286232400"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:34:47 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="570935709"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 00:34:43 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 lyude@redhat.com
Subject: Re: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper
 module
In-Reply-To: <871qy973i6.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-8-tzimmermann@suse.de> <87wngbbue8.fsf@intel.com>
 <3be7b84e-b28e-e8d0-f6ec-90142b9ecb21@suse.de> <871qy973i6.fsf@intel.com>
Date: Thu, 07 Apr 2022 10:34:40 +0300
Message-ID: <87wng15otr.fsf@intel.com>
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

On Thu, 07 Apr 2022, Jani Nikula <jani.nikula@linux.intel.com> wrote:
> On Wed, 06 Apr 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> Hi
>>
>> Am 30.03.22 um 12:35 schrieb Jani Nikula:
>>> On Tue, 22 Mar 2022, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>> diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
>>>> index 144c495b99c4..e6e9e4557067 100644
>>>> --- a/include/drm/drm_edid.h
>>>> +++ b/include/drm/drm_edid.h
>>>> @@ -391,33 +391,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
>>>>   
>>>>   bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
>>>>   
>>>> -int
>>>> -drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
>>>> -					 const struct drm_connector *connector,
>>>> -					 const struct drm_display_mode *mode);
>>>> -int
>>>> -drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
>>>> -					    const struct drm_connector *connector,
>>>> -					    const struct drm_display_mode *mode);
>>>> -
>>>> -void
>>>> -drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
>>>> -				   const struct drm_connector_state *conn_state);
>>>> -
>>>> -void
>>>> -drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
>>>> -			    const struct drm_connector_state *conn_state);
>>>> -
>>>> -void
>>>> -drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
>>>> -				   const struct drm_connector *connector,
>>>> -				   const struct drm_display_mode *mode,
>>>> -				   enum hdmi_quantization_range rgb_quant_range);
>>>> -
>>>> -int
>>>> -drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
>>>> -				    const struct drm_connector_state *conn_state);
>>>> -
>>>>   /**
>>>>    * drm_eld_mnl - Get ELD monitor name length in bytes.
>>>>    * @eld: pointer to an eld memory structure with mnl set
>>>> @@ -587,6 +560,10 @@ void drm_edid_get_monitor_name(struct edid *edid, char *name,
>>>>   struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
>>>>   					   int hsize, int vsize, int fresh,
>>>>   					   bool rb);
>>>> +
>>>> +u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match);
>>>> +enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code);
>>>> +enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code);
>>> 
>>> I think these were fine as static, but not really great interfaces to
>>> export. There's zero input checking on the vic in the latter, because
>>> internally we could be sure they were fine.
>>
>> I see. If nothing else, HDMI could be removed from the patchset. OTOH 
>> having these HDMI functions as part of the edid code doesn't seem right 
>> either.

To clarify, I think the HDMI functionality should probably be
moved. It's just the new interfaces I'm worried about.

BR,
Jani.


>>
>>> 
>>> I also wish we could limit the usage to the module you're adding; this
>>> is now available to all drivers which should be discouraged.
>>
>> Why is that discouraged? Quite a few drivers use these interfaces.
>
> No driver needed to directly use the functions you're now additionally
> exporting from drm_edid.c. I'd hope no driver starts to use them either.
>
> BR,
> Jani.
>
>
>
>>
>> Best regards
>> Thomas
>>> 
>>> 
>>> BR,
>>> Jani.
>>> 
>>> 

-- 
Jani Nikula, Intel Open Source Graphics Center
