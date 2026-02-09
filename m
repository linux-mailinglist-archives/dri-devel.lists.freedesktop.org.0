Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id II5gChdeimkWJwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 23:22:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB94115096
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 23:22:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3871210E106;
	Mon,  9 Feb 2026 22:22:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="c9aPMa/w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468E610E106;
 Mon,  9 Feb 2026 22:22:09 +0000 (UTC)
Received: from [192.168.178.24] (i5C75F6C0.versanet.de [92.117.246.192])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id BB0D32FC0061;
 Mon,  9 Feb 2026 23:22:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1770675727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9UQ3B7W/cx4yivTTdMfnQWuYxY1YQbuzbQqMSYQKC7U=;
 b=c9aPMa/w3aAfc3aoiwZ8rF93IIW3TdWbI6+rVETGE+o0bglVOJ42a65aHF0mEd+fMbjt4Q
 b1RkDHbfu6CZ6KsJGqX8yAqT8RR/JoS8Z+td31zsljH1Q7CVLR6Nz3YdEItTBktWgoHJ2T
 89XnEhYIdsR5m7maqEi40RGEO5hlNko=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f0028617-3d82-4d03-9ed1-4722b2e30bec@tuxedocomputers.com>
Date: Mon, 9 Feb 2026 23:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/i915/display: Add quirk to force backlight type on
 some TUXEDO devices
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260121223944.1104951-1-wse@tuxedocomputers.com>
 <DM3PPF208195D8D575D7D0E044CAC4955D4E39EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <DM3PPF208195D8D575D7D0E044CAC4955D4E39EA@DM3PPF208195D8D.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[tuxedocomputers.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[tuxedocomputers.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,ursulin.net,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wse@tuxedocomputers.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[tuxedocomputers.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url,pages.freedesktop.org:url]
X-Rspamd-Queue-Id: 3BB94115096
X-Rspamd-Action: no action

Hi Suraj,

Am 29.01.26 um 05:23 schrieb Kandpal, Suraj:
>> Subject: [PATCH v2] drm/i915/display: Add quirk to force backlight type on
>> some TUXEDO devices
>>
>> The display backlight on TUXEDO DX1708 and InsanityBook 15 v1 with panels
>> AUO 12701 and AUO 12701 must be forced to
>> INTEL_DP_AUX_BACKLIGHT_ON to be able to control the brightness.
>>
>> This could already be archived via a module parameter, but this patch adds a
>> quirk to apply this by default on the mentioned devices.
>>
>> This patch does not actually test for the exact panels as the id that is used in
>> the intel_dpcd_quirks list is sadly zeroed on the devices, but afaik all these
>> devices use try_intel_interface first anyway so all the quirk does is to add the
>> fallback to try_vesa_interface, so the behaviour on the devices not needing
>> the quirk and fallback should functionally stay the same.
> Hi Sembach,
>
> Thanks for the patch. I would recommend opening a gitlab issue with all the details
> (platform, edp version etc), Along with dmesg logs with drm.debug set to 0x10e and kernel
> Version mentioned . So we can root cause this properly and determine is an actual quirk is required or not.
> Use can use this as a guide https://drm.pages.freedesktop.org/intel-docs/how-to-file-i915-bugs.html

Done: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/15679

Best Regards,

Werner

>
> Regards,
> Suraj Kandpal
>
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   .../drm/i915/display/intel_dp_aux_backlight.c |  9 ++++++-
>>   drivers/gpu/drm/i915/display/intel_quirks.c   | 25 ++++++++++++++++++-
>>   drivers/gpu/drm/i915/display/intel_quirks.h   |  1 +
>>   3 files changed, 33 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> index 0a3a3f6a5f9d8..bbdfa142d084d 100644
>> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
>> @@ -41,6 +41,7 @@
>>   #include "intel_display_types.h"
>>   #include "intel_dp.h"
>>   #include "intel_dp_aux_backlight.h"
>> +#include "intel_quirks.h"
>>
>>   /*
>>    * DP AUX registers for Intel's proprietary HDR backlight interface. We define
>> @@ -661,11 +662,17 @@ int intel_dp_aux_init_backlight_funcs(struct
>> intel_connector *connector)
>>   	struct drm_device *dev = connector->base.dev;
>>   	struct intel_panel *panel = &connector->panel;
>>   	bool try_intel_interface = false, try_vesa_interface = false;
>> +	int enable_dpcd_backlight;
>>
>>   	/* Check the VBT and user's module parameters to figure out which
>>   	 * interfaces to probe
>>   	 */
>> -	switch (display->params.enable_dpcd_backlight) {
>> +	enable_dpcd_backlight = display->params.enable_dpcd_backlight;
>> +	if (enable_dpcd_backlight == INTEL_DP_AUX_BACKLIGHT_AUTO &&
>> +	    intel_has_dpcd_quirk(intel_dp,
>> QUIRK_ENABLE_DPCD_BACKLIGHT))
>> +		enable_dpcd_backlight = INTEL_DP_AUX_BACKLIGHT_ON;
>> +
>> +	switch (enable_dpcd_backlight) {
>>   	case INTEL_DP_AUX_BACKLIGHT_OFF:
>>   		return -ENODEV;
>>   	case INTEL_DP_AUX_BACKLIGHT_AUTO:
>> diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c
>> b/drivers/gpu/drm/i915/display/intel_quirks.c
>> index d2e16b79d6be1..df20930f73f75 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.c
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.c
>> @@ -86,6 +86,14 @@ static void quirk_edp_limit_rate_hbr2(struct
>> intel_display *display)
>>   	drm_info(display->drm, "Applying eDP Limit rate to HBR2 quirk\n");  }
>>
>> +static void quirk_enable_dpcd_backlight(struct intel_dp *intel_dp) {
>> +	struct intel_display *display = to_intel_display(intel_dp);
>> +
>> +	intel_set_dpcd_quirk(intel_dp, QUIRK_ENABLE_DPCD_BACKLIGHT);
>> +	drm_info(display->drm, "Applying Enable DPCD Backlight quirk\n"); }
>> +
>>   struct intel_quirk {
>>   	int device;
>>   	int subsystem_vendor;
>> @@ -251,7 +259,22 @@ static const struct intel_dpcd_quirk
>> intel_dpcd_quirks[] = {
>>   		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
>>   		.hook = quirk_fw_sync_len,
>>   	},
>> -
>> +	/* TUXEDO InsanityBook 15 v1 */
>> +	{
>> +		.device = 0x591b,
>> +		.subsystem_vendor = 0x1558,
>> +		.subsystem_device = 0x9501,
>> +		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
>> +		.hook = quirk_enable_dpcd_backlight,
>> +	},
>> +	/* TUXEDO DX1708 */
>> +	{
>> +		.device = 0x3e9b,
>> +		.subsystem_vendor = 0x1558,
>> +		.subsystem_device = 0x8500,
>> +		.sink_oui = SINK_OUI(0x38, 0xec, 0x11),
>> +		.hook = quirk_enable_dpcd_backlight,
>> +	},
>>   };
>>
>>   void intel_init_quirks(struct intel_display *display) diff --git
>> a/drivers/gpu/drm/i915/display/intel_quirks.h
>> b/drivers/gpu/drm/i915/display/intel_quirks.h
>> index 06da0e286c67c..686f306ab4472 100644
>> --- a/drivers/gpu/drm/i915/display/intel_quirks.h
>> +++ b/drivers/gpu/drm/i915/display/intel_quirks.h
>> @@ -21,6 +21,7 @@ enum intel_quirk_id {
>>   	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
>>   	QUIRK_FW_SYNC_LEN,
>>   	QUIRK_EDP_LIMIT_RATE_HBR2,
>> +	QUIRK_ENABLE_DPCD_BACKLIGHT,
>>   };
>>
>>   void intel_init_quirks(struct intel_display *display);
>> --
>> 2.43.0
