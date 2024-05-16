Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB808C74C4
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:44:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790C210EC50;
	Thu, 16 May 2024 10:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.b="HUOVXTOh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 609 seconds by postgrey-1.36 at gabe;
 Thu, 16 May 2024 10:44:00 UTC
Received: from mail-m3286.qiye.163.com (mail-m3286.qiye.163.com
 [220.197.32.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC7110EC50
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:43:59 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=HUOVXTOhDEeRoAbLXp9xVWYofVGhTVUHtnOxMnvAipShFmrsma7JMdMqHWSj/KaKeW7qBpEz67x0/FOYI+ZPgoEniDaFgnpxEiTa5JHFBf//ZtBP9/rvoRyfOeQIhkgu0j9/epx8h1jWrC/HIdReVLJYRK+ZRb2sqSpzNQVBnRI=;
 c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
 bh=FCf697ScC6sIyRLE5i+Ck7uK+89BCHdyga0CnUWyIk4=;
 h=date:mime-version:subject:message-id:from;
Received: from [172.16.12.141] (unknown [58.22.7.114])
 by smtp.qiye.163.com (Hmail) with ESMTPA id 91FA284060B;
 Thu, 16 May 2024 18:33:31 +0800 (CST)
Message-ID: <d0757dd6-ec00-407b-af53-f60f34cf0580@rock-chips.com>
Date: Thu, 16 May 2024 18:33:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 15/28] drm/connector: hdmi: Compute bpc and format
 automatically
To: Maxime Ripard <mripard@kernel.org>, Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20240507-kms-hdmi-connector-state-v13-0-8fafc5efe8be@kernel.org>
 <20240507-kms-hdmi-connector-state-v13-15-8fafc5efe8be@kernel.org>
 <73944574.1631.18f6be1e78f.Coremail.andyshrk@163.com>
 <20240516-lean-smooth-bonobo-d7e198@penduick>
Content-Language: en-US
From: Andy Yan <andy.yan@rock-chips.com>
In-Reply-To: <20240516-lean-smooth-bonobo-d7e198@penduick>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQx4fTVYfTUsaHkNISkofGkpVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
 tLWQY+
X-HM-Tid: 0a8f80f6df0c03a4kunm91fa284060b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhA6Eio4PDNNFzE3NiIOOSET
 A1YwCj1VSlVKTEpOQ05OTUpPSUhPVTMWGhIXVRoVHwJVAhoVOwkUGBBWGBMSCwhVGBQWRVlXWRIL
 WUFZTkNVSUlVTFVKSk9ZV1kIAVlBSktPQ0g3Bg++
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

Hi Maxime,

On 5/16/24 17:45, Maxime Ripard wrote:
> Hi again,
> 
> On Sun, May 12, 2024 at 04:18:38PM +0800, Andy Yan wrote:
>> 在 2024-05-07 21:17:33，"Maxime Ripard" <mripard@kernel.org> 写道：
>>> Now that we have all the infrastructure needed, we can add some code
>>> that will, for a given connector state and mode, compute the best output
>>> format and bpc.
>>>
>>> The algorithm is equivalent to the one already found in i915 and vc4.
>>>
>>> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>> drivers/gpu/drm/display/drm_hdmi_state_helper.c    | 199 ++++++++++++++++++++-
>>> drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c |  25 ++-
>>> 2 files changed, 212 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> index 063421835dba..f20dcfecb6b8 100644
>>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>>> @@ -1,9 +1,11 @@
>>> // SPDX-License-Identifier: MIT
>>>
>>> #include <drm/drm_atomic.h>
>>> #include <drm/drm_connector.h>
>>> +#include <drm/drm_edid.h>
>>> +#include <drm/drm_print.h>
>>>
>>> #include <drm/display/drm_hdmi_helper.h>
>>> #include <drm/display/drm_hdmi_state_helper.h>
>>>
>>> /**
>>> @@ -46,10 +48,112 @@ connector_state_get_mode(const struct drm_connector_state *conn_state)
>>> 		return NULL;
>>>
>>> 	return &crtc_state->mode;
>>> }
>>>
>>> +static bool
>>> +sink_supports_format_bpc(const struct drm_connector *connector,
>>> +			 const struct drm_display_info *info,
>>> +			 const struct drm_display_mode *mode,
>>> +			 unsigned int format, unsigned int bpc)
>>> +{
>>> +	struct drm_device *dev = connector->dev;
>>> +	u8 vic = drm_match_cea_mode(mode);
>>> +
>>> +	/*
>>> +	 * CTA-861-F, section 5.4 - Color Coding & Quantization states
>>> +	 * that the bpc must be 8, 10, 12 or 16 except for the default
>>> +	 * 640x480 VIC1 where the value must be 8.
>>> +	 *
>>> +	 * The definition of default here is ambiguous but the spec
>>> +	 * refers to VIC1 being the default timing in several occasions
>>> +	 * so our understanding is that for the default timing (ie,
>>> +	 * VIC1), the bpc must be 8.
>>> +	 */
>>> +	if (vic == 1 && bpc != 8) {
>>> +		drm_dbg_kms(dev, "VIC1 requires a bpc of 8, got %u\n", bpc);
>>> +		return false;
>>> +	}
>>> +
>>> +	if (!info->is_hdmi &&
>>> +	    (format != HDMI_COLORSPACE_RGB || bpc != 8)) {
>>> +		drm_dbg_kms(dev, "DVI Monitors require an RGB output at 8 bpc\n");
>>> +		return false;
>>> +	}
>>> +
>>> +	if (!(connector->hdmi.supported_formats & BIT(format))) {
>>> +		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
>>> +			    drm_hdmi_connector_get_output_format_name(format));
>>> +		return false;
>>> +	}
>>> +
>>> +	switch (format) {
>>> +	case HDMI_COLORSPACE_RGB:
>>> +		drm_dbg_kms(dev, "RGB Format, checking the constraints.\n");
>>> +
>>> +		if (!(info->color_formats & DRM_COLOR_FORMAT_RGB444)) {
>>> +			drm_dbg_kms(dev, "Sink doesn't support RGB.\n");
>>> +			return false;
>>> +		}
>>> +
>> As I reported in V12,  the HDMI output on my rk3036-kylin was lost after apply this series.
>> This is because there is something wrong with the DDC on my board, the edid read always failed
>> on first bootup. That means inno_hdmi_connector_get_modes will return 0.
>>
>> and in function drm_helper_probe_single_connector_modes:
>>
>>           count = drm_helper_probe_get_modes(connector);
>>
>>           if (count == 0 && (connector->status == connector_status_connected ||
>>                              connector->status == connector_status_unknown)) {
>>                   count = drm_add_modes_noedid(connector, 1024, 768);
>>
>>                   /*
>>                    * Section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a
>>                    * Link CTS specifies that 640x480 (the official "failsafe"
>>                    * mode) needs to be the default if there's no EDID.
>>                    */
>>                   if (connector->connector_type == DRM_MODE_CONNECTOR_DisplayPort)
>>                           drm_set_preferred_mode(connector, 640, 480);
>>           }
>> drm_add_modes_noedid will not initialize display_info. So the check about display info will always failed here:
>>
>> [    4.205368] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] checking (ptrval)
>> [    4.205410] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] mode changed
>> [    4.205439] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] enable changed
>> [    4.205464] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CRTC:35:crtc-0] active changed
>> [    4.205490] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] Updating routing for [CONNECTOR:37:HDMI-A-1]
>> [    4.205517] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] using [ENCODER:36:TMDS-36] on [CRTC:35:crtc-0]
>> [    4.205545] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying with a 8 bpc output
>> [    4.205575] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Trying RGB output format
>> [    4.205670] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB Format, checking the constraints.
>> [    4.205696] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Sink doesn't support RGB.
>> [    4.205720] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] RGB output format not supported with 8 bpc
>> [    4.205747] rockchip-drm display-subsystem: [drm:drm_atomic_helper_connector_hdmi_check] Failed. No Format Supported for that bpc count.
>> [    4.205772] rockchip-drm display-subsystem: [drm:drm_atomic_helper_check_modeset] [CONNECTOR:37:HDMI-A-1] driver check failed
>> [    4.205796] rockchip-drm display-subsystem: [drm:drm_atomic_check_only] atomic driver check for (ptrval) failed: -22
>>
>> My reply for your email in V12[0] was bounced, so I think you didn't read it.
>>
>> [0]https://patchwork.kernel.org/project/linux-rockchip/patch/20240423-kms-hdmi-connector-state-v12-27-3338e4c0b189@kernel.org/
> 
> Indeed, I never received it, sorry.
> 
> Thanks for looking into it, it's very valuable.
> 
> I can see several things that interact and could go wrong:
> 
> * The DDC readout should not fail like that. From a quick look at the
>    driver, I'm wondering if it's not due to the fact that the DDC
>    controller isn't powered until the first modeset happens. Since the
>    first get_modes call is done with the controller disabled, it's
>    probably not initialized enough yet. The first modeset then comes and
>    will initialize the controller enough for the subsequent get_modes to
>    work. Is it something you could look into?

I have a same feeling about it. I will check it later.
> 
> * drm_display_info not being filled to some sane default when there's no
>    EDID is indeed an issue. I can't be made generic, but the HDMI spec
>    provides us with some minimum requirements we can probably set in this
>    case (RGB supported, 8bpc supported, etc.) I'll work on that.

Thanks.
> 
> Thanks again,
> Maxime
