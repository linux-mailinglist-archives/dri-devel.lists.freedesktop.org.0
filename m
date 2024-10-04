Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23BD990617
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 16:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A327510E1E0;
	Fri,  4 Oct 2024 14:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="L5ENU0kF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1BD10E1E0
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 14:30:30 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 311CE2FC0050;
 Fri,  4 Oct 2024 16:30:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1728052228;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zWhiu9HmAK5yu0/waH3EhWv2Ey1oKKRMKlYiIb1EjTw=;
 b=L5ENU0kFrEppD7W4v6+Xhbr8abFljlfNaltOsQ4Ea8uLJdqMh6bTmFQRQh0JllXqwUdQ+o
 k4D6uAtUKY4o2vcHMgAAlMxRoDm5teQU4oLALFTyIiPEzI6Z/BULTBGGmViWzB6g5hPbXp
 R/l8KJ8/Gp5yeUex4fo9bKzSKh+KvSU=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <98883fb1-c895-4aad-842b-ed525d4c42f6@tuxedocomputers.com>
Date: Fri, 4 Oct 2024 16:30:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, cs@tuxedo.de, platform-driver-x86@vger.kernel.org
References: <20241001180658.76396-1-wse@tuxedocomputers.com>
 <20241001180658.76396-2-wse@tuxedocomputers.com>
 <bc3f5f2b-252e-0a66-df0f-f01197a5a17d@linux.intel.com>
 <fdfaaad5-59e7-4825-bc06-db44831ac741@tuxedocomputers.com>
 <49beebf1-db73-a3a1-3376-e1822ce2e569@linux.intel.com>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <49beebf1-db73-a3a1-3376-e1822ce2e569@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Ilpo,

Am 03.10.24 um 12:54 schrieb Ilpo Järvinen:
> On Wed, 2 Oct 2024, Werner Sembach wrote:
>> Am 02.10.24 um 11:52 schrieb Ilpo Järvinen:
>>> On Tue, 1 Oct 2024, Werner Sembach wrote:
>>>
>>>> The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
>>>> controllable RGB keyboard backlight. The firmware API for it is
>>>> implemented
>>>> via WMI.
>>>>
>>>> To make the backlight userspace configurable this driver emulates a
>>>> LampArray HID device and translates the input from hidraw to the
>>>> corresponding WMI calls. This is a new approach as the leds subsystem
>>>> lacks
>>>> a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
>>>> needs to be established.
>>>>
>>>> v2: Integrated Armins feedback and fixed kernel test robot warnings.
>>>> v3: Fixed borked subject line of v2.
>>>> v4: Remove unrequired WMI mutex.
>>>>       Move device checking from probe to init.
>>>>       Fix device checking working exactly reverse as it should.
>>>>       Fix null pointer dereference because, hdev->driver_data !=
>>>> hdev->dev.driver_data.
>>>>
>>>> Co-developed-by: Christoffer Sandberg <cs@tuxedo.de>
>>>> Signed-off-by: Christoffer Sandberg <cs@tuxedo.de>
>>>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>>>> Link:
>>>> https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/
>>>> ---
> I came across few new things that I didn't notice previously while
> writing this reply. I tried to cut the reply size down so hopefully they
> don't get lost as easily.


Thanks for the additional feedback.

>
>>>> +	0x29, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x41, 0x42,
>>>> +	0x43, 0x44, 0x45, 0xf1, 0x46, 0x4c,   0x4a, 0x4d, 0x4b, 0x4e,
>>>> +	0x35, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
>>>> +	0x27, 0x2d, 0x2e, 0x2a,               0x53, 0x55, 0x54, 0x56,
>>>> +	0x2b, 0x14, 0x1a, 0x08, 0x15, 0x17, 0x1c, 0x18, 0x0c, 0x12,
>>>> +	0x13, 0x2f, 0x30, 0x31,               0x5f, 0x60, 0x61,
>>>> +	0x39, 0x04, 0x16, 0x07, 0x09, 0x0a, 0x0b, 0x0d, 0x0e, 0x0f,
>>>> +	0x33, 0x34, 0x28,                     0x5c, 0x5d, 0x5e, 0x57,
>>>> +	0xe1, 0x1d, 0x1b, 0x06, 0x19, 0x05, 0x11, 0x10, 0x36, 0x37,
>>>> +	0x38, 0xe5, 0x52,                     0x59, 0x5a, 0x5b,
>>>> +	0xe0, 0xfe, 0xe3, 0xe2, 0x2c, 0xe6, 0x65, 0xe4, 0x50, 0x51,
>>>> +	0x4f,                                 0x62, 0x63, 0x58
>>> Why are these aligned in the odd way?
>> to see where the numpad begin to have some kind of orientation
>>
>> 2 rows here are one physical row with the gap in front of the numpad
> Okay, thanks.
>
>>>> +static int handle_lamp_array_attributes_report(struct hid_device *hdev,
>>>> +					       struct
>>>> lamp_array_attributes_report_t *rep)
>>>> +{
>>>> +	struct driver_data_t *driver_data = hdev->driver_data;
>>>> +
>>>> +	rep->lamp_count = driver_data->lamp_count;
>>>> +	rep->bounding_box_width_in_micrometers = 368000;
>>>> +	rep->bounding_box_height_in_micrometers = 266000;
>>>> +	rep->bounding_box_depth_in_micrometers = 30000;
>>>> +	// LampArrayKindKeyboard, see "26.2.1 LampArrayKind Values" of "HID
>>>> Usage Tables v1.5"
>>> Limit length to 80 chars.
>> is this just for comments or also code?
>>
>> because checkpatch explicitly allows 100 chars
> For comments. For code you can use longer line lengths where they make
> sense (doesn't mean that all lines should be tempting that limit which
> is usually an indication that code should be structured differently).
Ack
>
>>>> +		}
>>>> +
>>>> +		for (int j = i + 1; j < rep->lamp_count; ++j) {
> The convention these days is to use unsigned int for loop variables that
> are never supposed to be negative.
Ack
>
>>>> +			if (rep->lamp_id[i] == rep->lamp_id[j]) {
>>>> +				pr_debug("Duplicate lamp_id in
>>>> lamp_multi_update_report. Skippng whole report!\n");
> Skipping
>
>>>> +				return sizeof(struct
>>>> lamp_multi_update_report_t);
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	for (int i = 0; i < rep->lamp_count; ++i) {
>>>> +		if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
>>>> +			key_id = sirius_16_ansii_kbl_mapping[rep->lamp_id[i]];
>>>> +		else if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
>>>> +			key_id = sirius_16_iso_kbl_mapping[rep->lamp_id[i]];
>>>> +
>>>> +		for (int j = 0; j <
>>>> WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX; ++j) {
>>>> +			key_id_j =
>>>> next->kbl_set_multiple_keys_input.lighting_settings[j].key_id;
>>>> +			if (key_id_j == 0x00 || key_id_j == key_id) {
>>> Reverse condition and use continue to lower the indentation level of the
>>> main loop body.
>> Not sure if this helps with readability, at least for me i think that would
>> take more time to parse the reversed condition.
> ?
>
> 			if (key_id_j != 0x00 && key_id_j != key_id)
> 				continue;
>
> The problem is not the condition itself but the indentation level in what
> follows. Lowering that is going to be overall beneficial.
>
>>>> +				if (key_id_j == 0x00)
>>>> +
>>>> next->kbl_set_multiple_keys_input.lighting_setting_count =
>>>> +						j + 1;
> But now that I think of it more, you could also do:
> 			if (key_id_j == 0x00)
> 				next->... = j+1;
> 			else if (key_id_j != key_id)
> 				continue;
Will look into it.
>
>>>> +
>>>> next->kbl_set_multiple_keys_input.lighting_settings[j].key_id =
>>>> +					key_id;
> You could also create local variable for
> next->kbl_set_multiple_keys_input.lighting_settings[j]
> to make this loop body more readable.
>
> Similar local vars might help elsewhere in your code too if you need to do
> repeated accesses deep into the same structure.
Ack
>
>>>> +				// While this driver respects
>>>> +				// intensity_update_channel according to "HID
>>>> +				// Usage Tables v1.5" also on RGB leds, the
>>>> +				// Microsoft MacroPad reference implementation
>>>> +				//
>>>> (https://github.com/microsoft/RP2040MacropadHidSample
>>>> +				// 1d6c3ad) does not and ignores it. If it
>>>> turns
>>>> +				// out that Windows writes intensity = 0 for
>>>> RGB
>>>> +				// leds instead of intensity = 255, this
>>>> driver
>>>> +				// should also irgnore the
> ignore
Ack
>
>>>> +				// intensity_update_channel.
>>>> +
>>>> next->kbl_set_multiple_keys_input.lighting_settings[j].red =
>>>> +					rep->update_channels[i].red
>>>> +						*
>>>> rep->update_channels[i].intensity / 0xff;
>>>> +
>>>> next->kbl_set_multiple_keys_input.lighting_settings[j].green =
>>>> +					rep->update_channels[i].green
>>>> +						*
>>>> rep->update_channels[i].intensity / 0xff;
>>>> +
>>>> next->kbl_set_multiple_keys_input.lighting_settings[j].blue =
>>>> +					rep->update_channels[i].blue
>>>> +						*
>>>> rep->update_channels[i].intensity / 0xff;
>>>> +
>>>> +				break;
>>>> +			}
>>>> +		}
>>>> +	}
>>>> +
>>>> +	if (rep->lamp_update_flags & LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE) {
>>>> +		ret = tuxedo_nb04_wmi_496_b_in_80_b_out(wdev,
>>>> WMI_AB_KBL_SET_MULTIPLE_KEYS, next,
>>>> +							&output);
>>>> +		memset(next, 0, sizeof(union
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_input));
>>>> +		if (ret)
>>>> +			return ret;
>>>> +	}
>>>> +
>>>> +	return sizeof(struct lamp_multi_update_report_t);
>>>> +}
>>>> +
>>>> +
>>>> +struct __packed lamp_range_update_report_t {
>>>> +	const uint8_t report_id;
>>>> +	uint8_t lamp_update_flags;
>>>> +	uint16_t lamp_id_start;
>>>> +	uint16_t lamp_id_end;
>>>> +	uint8_t red_update_channel;
>>>> +	uint8_t green_update_channel;
>>>> +	uint8_t blue_update_channel;
>>>> +	uint8_t intensity_update_channel;
>>>> +};
>>>> +
>>>> +static int handle_lamp_range_update_report(struct hid_device *hdev,
>>>> +					   struct lamp_range_update_report_t
>>>> *report)
>>>> +{
>>>> +	struct driver_data_t *driver_data = hdev->driver_data;
>>>> +	int ret;
>>>> +	uint8_t lamp_count;
>>>> +	struct lamp_multi_update_report_t lamp_multi_update_report = {
> No idea why chose to you make the local variable this long as you seem to
> be fine using just "report" for naming the function parameter.
Because i didn't thought to much about this variable name.
>
> How about taking e.g., the first chars from the words of the time, i.e.,
> lmur or some similar convention for local names? The type is there close
> by for the code reader if one needs to know what the chars mean.
tbh I realy don't like acronym variable names, will see if i find a better short 
name
>
>>>> +		.report_id = LAMP_MULTI_UPDATE_REPORT_ID
>>>> +	};
>>>> +
>>>> +	// Catching missformated lamp_range_update_report and fail silently
>>>> according to
>>>> +	// "HID Usage Tables v1.5"
>>>> +	if (report->lamp_id_start > report->lamp_id_end) {
>>>> +		pr_debug("lamp_id_start > lamp_id_end in
>>>> lamp_range_update_report. Skippng whole report!\n");
>>>> +		return sizeof(struct lamp_range_update_report_t);
>>>> +	}
>>>> +
>>>> +	if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII)
>>>> +		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
>>>> +	else if (driver_data->keyboard_type ==
>>>> WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO)
>>>> +		lamp_count = sizeof(sirius_16_ansii_kbl_mapping);
>>>> +
>>>> +	if (report->lamp_id_end > lamp_count - 1) {
>>>> +		pr_debug("Out of bounds lamp_id_* in lamp_range_update_report.
>>>> Skippng whole report!\n");
>>>> +		return sizeof(struct lamp_range_update_report_t);
>>>> +	}
>>>> +
>>>> +	// Break handle_lamp_range_update_report call down to multiple
>>>> +	// handle_lamp_multi_update_report calls to easily ensure that mixing
>>>> +	// handle_lamp_range_update_report and handle_lamp_multi_update_report
>>>> +	// does not break things.
>>>> +	for (int i = report->lamp_id_start; i < report->lamp_id_end + 1; i = i
>>>> + 8) {
>>>> +		lamp_multi_update_report.lamp_count = MIN(report->lamp_id_end
>>>> + 1 - i, 8);
> Please use min() or min_t() instead of MIN().
ack
>
>>>> +		if (i + lamp_multi_update_report.lamp_count ==
>>>> report->lamp_id_end + 1)
>>>> +			lamp_multi_update_report.lamp_update_flags |=
>>>> +				LAMP_UPDATE_FLAGS_LAMP_UPDATE_COMPLETE;
>>>> +
>>>> +		for (int j = 0; j < lamp_multi_update_report.lamp_count; ++j)
>>>> {
>>>> +			lamp_multi_update_report.lamp_id[j] = i + j;
>>>> +			lamp_multi_update_report.update_channels[j].red =
>>>> +				report->red_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].green =
>>>> +				report->green_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].blue =
>>>> +				report->blue_update_channel;
>>>> +			lamp_multi_update_report.update_channels[j].intensity
>>>> =
>>>> +				report->intensity_update_channel;
> Shorter local var name would help here to stay on a single line. If that's
> not enough, local var for lmur->update_channels[j] would help further.
will look into it
>
>>>> +		}
>>>> +
>>>> +		ret = handle_lamp_multi_update_report(hdev,
>>>> &lamp_multi_update_report);
>>>> +		if (ret < 0)
>>>> +			return ret;
>>>> +		else if (ret != sizeof(struct lamp_multi_update_report_t))
>>>> +			return -EIO;
>>>> +	}
>>>> +
>>>> +	return sizeof(struct lamp_range_update_report_t);
>>>> +}
>>>> +
>>>> +
>>>> +struct __packed lamp_array_control_report_t {
>>>> +	const uint8_t report_id;
>>>> +	uint8_t autonomous_mode;
>>>> +};
>>>> +
>>>> +static int handle_lamp_array_control_report(struct hid_device
>>>> __always_unused *hdev,
>>>> +					    struct lamp_array_control_report_t
>>>> __always_unused *rep)
>>>> +{
>>>> +	// The keyboard firmware doesn't have any built in effects or controls
>>>> +	// so this is a NOOP.
>>>> +	// According to the HID Documentation (HID Usage Tables v1.5) this
>>>> +	// function is optional and can be removed from the HID Report
>>>> +	// Descriptor, but it should first be confirmed that userspace
>>>> respects
>>>> +	// this possibility too. The Microsoft MacroPad reference
>>>> implementation
>>>> +	// (https://github.com/microsoft/RP2040MacropadHidSample 1d6c3ad)
>>>> +	// already deviates from the spec at another point, see
>>>> +	// handle_lamp_*_update_report.
>>>> +
>>>> +	return sizeof(struct lamp_array_control_report_t);
>>>> +}
>>>> +
>>>> +
>>>> +static int ll_raw_request(struct hid_device *hdev, unsigned char
>>>> reportnum, __u8 *buf, size_t len,
>>>> +			   unsigned char rtype, int reqtype)
>>>> +{
>>>> +	int ret;
>>>> +
>>>> +	ret = -EINVAL;
>>>> +	if (rtype == HID_FEATURE_REPORT) {
>>> No, reverse the logic in the condition and return -EINVAL explicitly.
>>> It lets you lower the indentation level of the normal path.
>> I don't quite get what you mean, i have to check 3 levels:
>>
>> Feature Report?
>>
>> Get or Set Report?
>>
>> Report ID?
>>
>> I don't see how i can do this without code duplication or 3 levels of
>> indendation?
> 	if (rtype != HID_FEATURE_REPORT)
> 		return -EINVAL;
Sorry was a slowpoke on this one
>
> This already brings you down one indentation level and simplifies things
> as you don't need to do ret = -EINVAL + return at the end.
>
>>>> +		if (reqtype == HID_REQ_GET_REPORT) {
>>>> +			if (reportnum == LAMP_ARRAY_ATTRIBUTES_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_array_attributes_report_t))
>>>> +				ret = handle_lamp_array_attributes_report(
>>>> +					hdev, (struct
>>>> lamp_array_attributes_report_t *)buf);
>>>> +			else if (reportnum ==
>>>> LAMP_ATTRIBUTES_RESPONSE_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_attributes_response_report_t))
>>>> +				ret = handle_lamp_attributes_response_report(
>>>> +					hdev, (struct
>>>> lamp_attributes_response_report_t *)buf);
>>>> +		} else if (reqtype == HID_REQ_SET_REPORT) {
>>>> +			if (reportnum == LAMP_ATTRIBUTES_REQUEST_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_attributes_request_report_t))
>>>> +				ret = handle_lamp_attributes_request_report(
>>>> +					hdev, (struct
>>>> lamp_attributes_request_report_t *)buf);
>>>> +			else if (reportnum == LAMP_MULTI_UPDATE_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_multi_update_report_t))
>>>> +				ret = handle_lamp_multi_update_report(
>>>> +					hdev, (struct
>>>> lamp_multi_update_report_t *)buf);
>>>> +			else if (reportnum == LAMP_RANGE_UPDATE_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_range_update_report_t))
>>>> +				ret = handle_lamp_range_update_report(
>>>> +					hdev, (struct
>>>> lamp_range_update_report_t *)buf);
>>>> +			else if (reportnum == LAMP_ARRAY_CONTROL_REPORT_ID
>>>> +			    && len == sizeof(struct
>>>> lamp_array_control_report_t))
>>>> +				ret = handle_lamp_array_control_report(
>>>> +					hdev, (struct
>>>> lamp_array_control_report_t *)buf);
>>>> +		}
>>> This is very messy, and should IMHO use switch&case and directly return
>>> -EINVAL on every len check inside the case blocks.
>> Wouldn't that mean more intendation? One for the switch case and another one
>> for the now seperate len check?
> No it doesn't add indentation level compared with yours and this is also
> way easier to read:
>
> 	switch (reqtype) {
> 	case HID_REQ_GET_REPORT:
> 		switch (reportnum) {
> 		case LAMP_ATTRIBUTES_REQUEST_REPORT_ID:
> 			if (len != sizeof(struct lamp_array_attributes_report_t))
> 				return -EINVAL;
>
> 			return handle_lamp_array_attributes_report(hdev, (struct lamp_array_attributes_report_t *)buf);
> 		case ...:
> 			if (len != ...)
> 				return -EINVAL;
>
> 			return ...;
> 		default:
> 			return -EINVAL;
> 		}
>
> 	case HID_REQ_SET_REPORT:
> 		switch (reportnum) {
> 		case:
> 			...
> 		default:
> 			return -EINVAL;
> 		}
> 	default:
> 		return -EINVAL;
> 	}
> }
>
> Compiler might be stupid enough to require a few additional breaks that
> will never be reachable + return to the end of function so make those
> tweaks as needed.
Will look into it
>
> I'm sorry if I copy-pasted something from a wrong place in above but I
> believe you get the point. The error handling is now clearly visible
> instead of being build inside a complex if condition and returns
> immediately to clearly show it's really doing error handling.
>
>>>> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_ab_virtual_lamp_array.h
>>>> @@ -0,0 +1,18 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * This code gives the built in RGB lighting of the TUXEDO NB04 devices a
>>>> + * standardised interface, namely HID LampArray.
>>>> + *
>>>> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
>>>> + */
>>>> +
>>>> +#ifndef TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
>>>> +#define TUXEDO_NB04_WMI_AB_VIRTUAL_LAMP_ARRAY_H
>>>> +
>>>> +#include <linux/wmi.h>
>>>> +#include <linux/hid.h>
>>>> +
>>>> +int tuxedo_nb04_virtual_lamp_array_add_device(struct wmi_device *wdev,
>>>> +					      struct hid_device **hdev_out);
>>>> +
>>>> +#endif
>>>> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
>>>> b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
>>>> new file mode 100644
>>>> index 0000000000000..a61b59d225f9f
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.c
>>>> @@ -0,0 +1,82 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + * This code gives functions to avoid code duplication while interacting
>>>> with
>>>> + * the TUXEDO NB04 wmi interfaces.
>>>> + *
>>>> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
>>> The usual custom is to put <> around email addresses.
>> ok
>>>> + */
>>>> +
>>>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>>> Add all includes for the stuff you use below.
>> also linux/wmi.h? or it it enough that that is in the directly associated .h
>> file?
> I'd prefer to see tham all here even if some "xx.h" does need them itself.
> Only if some <yy.h> includes <zz.h> and that dependency is something that
> is pretty much cast into stone, then including just yy.h is enough.
>
> Sadly the include-what-you-use clang tool is not there yet for the kernel
> so it's all manual process currently depending on reviewers paying
> attention to what headers are missing and which are extra.
ack
>
>>>> +#include "tuxedo_nb04_wmi_ab_init.h"
>>>> +
>>>> +#include "tuxedo_nb04_wmi_util.h"
>>>> +
>>>> +static int __wmi_method_acpi_object_out(struct wmi_device *wdev, uint32_t
>>>> wmi_method_id,
>>>> +					uint8_t *in, acpi_size in_len, union
>>>> acpi_object **out)
>>>> +{
>>>> +	struct acpi_buffer acpi_buffer_in = { in_len, in };
>>>> +	struct acpi_buffer acpi_buffer_out = { ACPI_ALLOCATE_BUFFER, NULL };
>>>> +
>>>> +	pr_debug("Evaluate WMI method: %u in:\n", wmi_method_id);
>>>> +	print_hex_dump_bytes("", DUMP_PREFIX_OFFSET, in, in_len);
>>>> +
>>>> +	acpi_status status = wmidev_evaluate_method(wdev, 0, wmi_method_id,
>>>> &acpi_buffer_in,
>>>> +						    &acpi_buffer_out);
>>>> +	if (ACPI_FAILURE(status)) {
>>>> +		pr_err("Failed to evaluate WMI method.\n");
>>> You should use dev_err() instead of pr_err().
>> ok
>>>> +		return -EIO;
>>>> +	}
>>>> +	if (!acpi_buffer_out.pointer) {
>>>> +		pr_err("Unexpected empty out buffer.\n");
>>>> +		return -ENODATA;
>>>> +	}
>>>> +
>>>> +	*out = acpi_buffer_out.pointer;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int __wmi_method_buffer_out(struct wmi_device *wdev, uint32_t
>>>> wmi_method_id, uint8_t *in,
>>>> +				   acpi_size in_len, uint8_t *out, acpi_size
>>>> out_len)
>>>> +{
>>>> +	int ret;
>>>> +	union acpi_object *acpi_object_out = NULL;
>>> Reverse xmas tree order.
>> ok
>>>> +
>>>> +	ret = __wmi_method_acpi_object_out(wdev, wmi_method_id, in, in_len,
>>>> &acpi_object_out);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	if (acpi_object_out->type != ACPI_TYPE_BUFFER) {
>>>> +		pr_err("Unexpected out buffer type. Expected: %u Got: %u\n",
>>>> ACPI_TYPE_BUFFER,
>>>> +		       acpi_object_out->type);
>>>> +		kfree(acpi_object_out);
>>>> +		return -EIO;
>>>> +	}
>>>> +	if (acpi_object_out->buffer.length < out_len) {
>>>> +		pr_err("Unexpected out buffer length.\n");
>>>> +		kfree(acpi_object_out);
>>>> +		return -EIO;
>>> Duplicated error paths should use goto to handle rollback.
>> ok
>>>> +	}
>>>> +
>>>> +	memcpy(out, acpi_object_out->buffer.pointer, out_len);
>>>> +	kfree(acpi_object_out);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
>>>> +				    enum
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
>>>> +				    union
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
>>>> +				    union
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_output *output)
>>>> +{
>>>> +	return __wmi_method_buffer_out(wdev, method, input->raw, 8,
>>>> output->raw, 80);
>>>> +}
>>>> +
>>>> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
>>>> +				      enum
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
>>>> +				      union
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
>>>> +				      union
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_output *output)
>>>> +{
>>>> +	return __wmi_method_buffer_out(wdev, method, input->raw, 496,
>>>> output->raw, 80);
>>>> +}
>>>> diff --git a/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>>>> b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>>>> new file mode 100644
>>>> index 0000000000000..2765cbe9fcfef
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/tuxedo/tuxedo_nb04_wmi_util.h
>>>> @@ -0,0 +1,112 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +/*
>>>> + * This code gives functions to avoid code duplication while interacting
>>>> with
>>>> + * the TUXEDO NB04 wmi interfaces.
>>>> + *
>>>> + * Copyright (C) 2024 Werner Sembach wse@tuxedocomputers.com
>>>> + */
>>>> +
>>>> +#ifndef TUXEDO_NB04_WMI_UTIL_H
>>>> +#define TUXEDO_NB04_WMI_UTIL_H
>>>> +
>>>> +#include <linux/wmi.h>
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_TOUCHPAD	1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_KEYBOARD	2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_DEVICE_ID_APP_PAGES	3
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_NONE		0
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_PER_KEY	1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_FOUR_ZONE	2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KBL_TYPE_WHITE_ONLY	3
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ANSII	0
>>>> +#define WMI_AB_GET_DEVICE_STATUS_KEYBOARD_LAYOUT_ISO	1
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_RED		1
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_GREEN		2
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_YELLOW	3
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_BLUE		4
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_PURPLE	5
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_INDIGO	6
>>>> +#define WMI_AB_GET_DEVICE_STATUS_COLOR_ID_WHITE		7
>>>> +
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_DASHBOARD	BIT(0)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_SYSTEMINFOS	BIT(1)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_KBL		BIT(2)
>>>> +#define WMI_AB_GET_DEVICE_STATUS_APP_PAGES_HOTKEYS	BIT(3)
>>> All these are quite long, I'd consider ways to make them shorter such as:
>>>
>>> DEVICE -> DEV
>>> COLOR_ID -> COLOR
>>> STATUS -> STS ?
>>> KEYBOARD_LAYOUT -> KEY_LAYOUT or KEYBOARD -> KEYB (in general)
>> These names match directly internal documentation, if it's no major problem i
>> would like to keep the names for future reference.
> I kind of assumed it might be the case, won't force you to do the
> shortening but please realize it will make the code look more messy
> because of the long line lengths, very long name are harder to read.
>
>>>> +	struct __packed {
>>> Unnecessary packed.
>> if it's not harmfull i would like to keep it so I don't forget it when the
>> reserved byts might be used sometime int the future
> Packed has code generation impact so it is harmful at times.
>
>>>> +		uint8_t device_type;
>>>> +		uint8_t reserved_0[7];
>>> Why isn't this just reserved[7] ?
>> to match the name scheme of the other structs
> Does it have to match? These are supposed to be dummy names that just
> tell don't use/touch this field?
yeah you might be right and that was just ocd talking or something xD
>
>>>> +	} get_device_status_input;
>>>> +};
>>>> +
>>>> +union tuxedo_nb04_wmi_8_b_in_80_b_out_output {
>>>> +	uint8_t raw[80];
>>>> +	struct __packed {
>>> This too looks naturally aligned so packet is unnecessary.
>> see above
>>>> +		uint16_t return_status;
>>>> +		uint8_t device_enabled;
>>>> +		uint8_t kbl_type;
>>>> +		uint8_t kbl_side_bar_supported;
>>>> +		uint8_t keyboard_physical_layout;
>>>> +		uint8_t app_pages;
>>>> +		uint8_t per_key_kbl_default_color;
>>>> +		uint8_t four_zone_kbl_default_color_1;
>>>> +		uint8_t four_zone_kbl_default_color_2;
>>>> +		uint8_t four_zone_kbl_default_color_3;
>>>> +		uint8_t four_zone_kbl_default_color_4;
>>>> +		uint8_t light_bar_kbl_default_color;
>>>> +		uint8_t reserved_0[1];
>>>> +		uint16_t dedicated_gpu_id;
>>>> +		uint8_t reserved_1[64];
>>>> +	} get_device_status_output;
>>>> +};
>>>> +
>>>> +enum tuxedo_nb04_wmi_8_b_in_80_b_out_methods {
>>>> +	WMI_AB_GET_DEVICE_STATUS	= 2,
>>>> +};
>>>> +
>>>> +
>>>> +#define WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX	120
>>>> +
>>>> +union tuxedo_nb04_wmi_496_b_in_80_b_out_input {
>>>> +	uint8_t raw[496];
>>>> +	struct __packed {
>>>> +		uint8_t reserved_0[15];
>>> reserved[15] ?
>> see above
>>>> +		uint8_t lighting_setting_count;
>>>> +		struct {
>>>> +			uint8_t key_id;
>>>> +			uint8_t red;
>>>> +			uint8_t green;
>>>> +			uint8_t blue;
>>>> +		}
>>>> lighting_settings[WMI_AB_KBL_SET_MULTIPLE_KEYS_LIGHTING_SETTINGS_COUNT_MAX];
>>>> +	}  kbl_set_multiple_keys_input;
>>>> +};
>>>> +
>>>> +union tuxedo_nb04_wmi_496_b_in_80_b_out_output {
>>>> +	uint8_t raw[80];
>>>> +	struct __packed {
>>>> +		uint8_t return_value;
>>>> +		uint8_t reserved_0[79];
>>> reserved[79] ?
>> see above
>>>> +	} kbl_set_multiple_keys_output;
>>>> +};
>>>> +
>>>> +enum tuxedo_nb04_wmi_496_b_in_80_b_out_methods {
>>>> +	WMI_AB_KBL_SET_MULTIPLE_KEYS	= 6,
>>>> +};
>>>> +
>>>> +
>>>> +int tuxedo_nb04_wmi_8_b_in_80_b_out(struct wmi_device *wdev,
>>>> +				    enum
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_methods method,
>>>> +				    union
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_input *input,
>>>> +				    union
>>>> tuxedo_nb04_wmi_8_b_in_80_b_out_output *output);
>>>> +int tuxedo_nb04_wmi_496_b_in_80_b_out(struct wmi_device *wdev,
>>>> +				      enum
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_methods method,
>>>> +				      union
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_input *input,
>>>> +				      union
>>>> tuxedo_nb04_wmi_496_b_in_80_b_out_output *output);
>>>> +
>>>> +#endif
>>> There are number of similar cases beyond those I've marked. Please go
>>> through all the cases, not just the ones I marked for you.
>>>
>>> My general feel is that this driver is quite heavy to read which is likely
>>> because of what feels excessively long naming used. I'm not convinved
>>> being _that verbose_ adds enough value.
>> When it comes down to the wmi structs I named stuff after the internal
>> documentation for easy future reference. Everywhere else I shortened the names
>> for everything that is static, but i can do a second pass.
>>> E.g., right above you have tuxedo_nb04_wmi_8_b_in_80_b_out_methods which
>>> mostly contains what looks prefix and some sizes. What is the value of
>>> having those sizes in the name? It would be much more useful to name
>>> things by functionality rather than sizes.
>>>
>> While i currently only implement 2 functions of that wmi api there are more
>> and this interface is written with the intend to be easily expandable to the
>> other functions in the future.
>>
>> That why i choose the rather generic names of just the input and output length
>> because there is no semantic connection between the wmi methods in
>> tuxedo_nb04_wmi_8_b_in_80_b_out and tuxedo_nb04_wmi_496_b_in_80_b_out
>> respectively that would make for a good name.
> So the only valuable characters are prefix + 8/496/80 the rest doesn't
> really tell much despite all its characters :-). Details like which of the
> numbers is in/out and that the numbers are in bytes could IMO be left to
> struct's comment without loss of much information value.
>
tuxedo_nb04_wmi_8_80 kinda looks strange to me, what about 
tuxedo_nb04_wmi_8_in_80_out? but that's on 4 chars shorter.
