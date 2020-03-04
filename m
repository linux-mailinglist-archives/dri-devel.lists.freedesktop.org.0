Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6011B17931C
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 16:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9903D6E1A5;
	Wed,  4 Mar 2020 15:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A9456E1A5;
 Wed,  4 Mar 2020 15:15:33 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 07:15:19 -0800
X-IronPort-AV: E=Sophos;i="5.70,514,1574150400"; d="scan'208";a="234063946"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Mar 2020 07:15:16 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH resend 1/2] drm/i915: panel: Use
 intel_panel_compute_brightness() from pwm_setup_backlight()
In-Reply-To: <895e4a40-2c3f-b964-102d-13eff5b3c268@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200221172927.510027-1-hdegoede@redhat.com>
 <895e4a40-2c3f-b964-102d-13eff5b3c268@redhat.com>
Date: Wed, 04 Mar 2020 17:15:13 +0200
Message-ID: <874kv4p2wu.fsf@intel.com>
MIME-Version: 1.0
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
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 03 Mar 2020, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi All,
>
> On 2/21/20 6:29 PM, Hans de Goede wrote:
>> Use intel_panel_compute_brightness() from pwm_setup_backlight() so that
>> we correctly take i915_modparams.invert_brightness and/or
>> QUIRK_INVERT_BRIGHTNESS into account when setting + getting the initial
>> brightness value.
>> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>
> ping? Any chance I can get a review from someone on this series?
>
> Both patches are pretty trivial really...

For both,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

And sad trombone, I was hoping I could nuke the whole module parameter
one of these days. It used to be something associated with gen4 only.

BR,
Jani.


>
> Regards,
>
> Hans
>
>
>
>> ---
>>   drivers/gpu/drm/i915/display/intel_panel.c | 18 +++++++++++-------
>>   1 file changed, 11 insertions(+), 7 deletions(-)
>> 
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
>> index 7b3ec6eb3382..9ebee7d93414 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>> @@ -1843,6 +1843,7 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>>   	struct drm_i915_private *dev_priv = to_i915(dev);
>>   	struct intel_panel *panel = &connector->panel;
>>   	const char *desc;
>> +	u32 level, ns;
>>   	int retval;
>>   
>>   	/* Get the right PWM chip for DSI backlight according to VBT */
>> @@ -1866,8 +1867,12 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>>   	 */
>>   	pwm_apply_args(panel->backlight.pwm);
>>   
>> -	retval = pwm_config(panel->backlight.pwm, CRC_PMIC_PWM_PERIOD_NS,
>> -			    CRC_PMIC_PWM_PERIOD_NS);
>> +	panel->backlight.min = 0; /* 0% */
>> +	panel->backlight.max = 100; /* 100% */
>> +	level = intel_panel_compute_brightness(connector, 100);
>> +	ns = DIV_ROUND_UP(level * CRC_PMIC_PWM_PERIOD_NS, 100);
>> +
>> +	retval = pwm_config(panel->backlight.pwm, ns, CRC_PMIC_PWM_PERIOD_NS);
>>   	if (retval < 0) {
>>   		DRM_ERROR("Failed to configure the pwm chip\n");
>>   		pwm_put(panel->backlight.pwm);
>> @@ -1875,11 +1880,10 @@ static int pwm_setup_backlight(struct intel_connector *connector,
>>   		return retval;
>>   	}
>>   
>> -	panel->backlight.min = 0; /* 0% */
>> -	panel->backlight.max = 100; /* 100% */
>> -	panel->backlight.level = DIV_ROUND_UP(
>> -				 pwm_get_duty_cycle(panel->backlight.pwm) * 100,
>> -				 CRC_PMIC_PWM_PERIOD_NS);
>> +	level = DIV_ROUND_UP(pwm_get_duty_cycle(panel->backlight.pwm) * 100,
>> +			     CRC_PMIC_PWM_PERIOD_NS);
>> +	panel->backlight.level =
>> +		intel_panel_compute_brightness(connector, level);
>>   	panel->backlight.enabled = panel->backlight.level != 0;
>>   
>>   	DRM_INFO("Using %s PWM for LCD backlight control\n", desc);
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
