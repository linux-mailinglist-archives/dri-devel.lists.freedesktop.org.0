Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A9E94DD9B
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2024 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B515810E133;
	Sat, 10 Aug 2024 16:26:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=t-8ch.de header.i=@t-8ch.de header.b="ZraDnMHz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051AC10E133
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Aug 2024 16:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1723307178; bh=Vpxk8JuF4KOoq7Cw89uDOviY/FT/Ljoz6ZcVe3LqKrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZraDnMHzno/ehMraVX+6/Fsi1XXHephdQUw+OX5DePD+3zDFRaJ17dDeGzhTKzt2f
 4b/4QzFGfwD2NURzlMehHl7Pt0Pe4ch0goBYXv/JJZsohK7krZ3G20/NFkd95JpwzY
 IApjZDTT3MHu28ja03VPYupMYDdHsBTNOWmQoE38=
Date: Sat, 10 Aug 2024 18:26:18 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Aditya Garg <gargaditya08@live.com>
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>, 
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, 
 "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>, 
 Jiri Kosina <jikos@kernel.org>, "bentiss@kernel.org" <bentiss@kernel.org>, 
 Orlando Chamberlain <orlandoch.dev@gmail.com>, Kerem Karabay <kekrby@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/9] HID: hid-appletb-bl: add driver for the backlight
 of Apple Touch Bars
Message-ID: <1166bdaa-ea14-430a-be2e-9593cc08491a@t-8ch.de>
References: <1368FEE8-58BB-41C9-B9AD-7F2F68FF1D53@live.com>
 <0DDD5C22-A42A-49F2-984C-F3595F71AB1C@live.com>
 <9e398f1b-05c2-4dd3-bc56-2b61c6784aef@t-8ch.de>
 <79DB1D9D-8D32-474F-972F-F82C818AF38F@live.com>
 <375d99a9-5516-4a39-a912-1961b3dd725d@t-8ch.de>
 <6340DD46-4537-434E-9E14-EEFE7E04AAD0@live.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6340DD46-4537-434E-9E14-EEFE7E04AAD0@live.com>
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

On 2024-08-10 15:30:58+0000, Aditya Garg wrote:
> 
> > 
> > Also include linux/device.h as you are using functions from there.
> > Like devm_kcalloc().
> 
> Alright, I’ll add that
> > 
> >>> 
> >>>> +#include <linux/hid.h>
> >>>> +#include <linux/backlight.h>
> >>>> +
> >>>> +#include "hid-ids.h"
> >>>> +
> >>>> +#define APPLETB_BL_ON 1
> >>>> +#define APPLETB_BL_DIM 3
> >>>> +#define APPLETB_BL_OFF 4
> >>>> +
> >>>> +#define HID_UP_APPLEVENDOR_TB_BL 0xff120000
> >>>> +
> >>>> +#define HID_VD_APPLE_TB_BRIGHTNESS 0xff120001
> >>>> +#define HID_USAGE_AUX1 0xff120020
> >>>> +#define HID_USAGE_BRIGHTNESS 0xff120021
> >>>> +
> >>>> +static int appletb_bl_def_brightness = 2;
> >>>> +module_param_named(brightness, appletb_bl_def_brightness, int, 0444);
> >>>> +MODULE_PARM_DESC(brightness, "Default brightness:\n"
> >>>> +  "    0 - Touchbar is off\n"
> >>>> +  "    1 - Dim brightness\n"
> >>>> +  "    [2] - Full brightness");
> >>>> +
> >>>> +struct appletb_bl {
> >>>> + struct hid_field *aux1_field, *brightness_field;
> >>>> + struct backlight_device *bdev;
> >>>> +
> >>>> + bool full_on;
> >>>> +};
> >>>> +
> >>>> +const u8 appletb_bl_brightness_map[] = {
> >>> 
> >>> static?
> >>> 
> >>>> + APPLETB_BL_OFF,
> >>>> + APPLETB_BL_DIM,
> >>>> + APPLETB_BL_ON
> >>> 
> >>> The last element is not a sentinel element, so it should have comma.
> >> 
> >> static const u8 appletb_bl_brightness_map[] = {
> >> APPLETB_BL_OFF,
> >> APPLETB_BL_DIM,
> >> APPLETB_BL_ON,
> >> };
> >> 
> >> This?
> > 
> > Yes.
> > 
> >>> 
> >>>> +};
> >>>> +
> >>>> +static int appletb_bl_set_brightness(struct appletb_bl *bl, u8 brightness)
> >>>> +{
> >>>> + struct hid_report *report = bl->brightness_field->report;
> >>>> + struct hid_device *hdev = report->device;
> >>>> + int ret;
> >>>> +
> >>>> + ret = hid_set_field(bl->aux1_field, 0, 1);
> >>>> + if (ret) {
> >>>> + hid_err(hdev, "Failed to set auxiliary field (%pe)\n", ERR_PTR(ret));
> >>>> + return ret;
> >>>> + }
> >>>> +
> >>>> + ret = hid_set_field(bl->brightness_field, 0, brightness);
> >>>> + if (ret) {
> >>>> + hid_err(hdev, "Failed to set brightness field (%pe)\n", ERR_PTR(ret));
> >>>> + return ret;
> >>>> + }
> >>>> +
> >>>> + if (!bl->full_on) {
> >>>> + ret = hid_hw_power(hdev, PM_HINT_FULLON);
> >>>> + if (ret < 0) {
> >>>> + hid_err(hdev, "Device didn't power on (%pe)\n", ERR_PTR(ret));
> >>>> + return ret;
> >>>> + }
> >>>> +
> >>>> + bl->full_on = true;
> >>>> + }
> >>>> +
> >>>> + hid_hw_request(hdev, report, HID_REQ_SET_REPORT);
> >>>> +
> >>>> + if (brightness == APPLETB_BL_OFF) {
> >>>> + hid_hw_power(hdev, PM_HINT_NORMAL);
> >>>> + bl->full_on = false;
> >>>> + }
> >>>> +
> >>>> + return 0;
> >>>> +}
> >>>> +
> >>>> +static int appletb_bl_update_status(struct backlight_device *bdev)
> >>>> +{
> >>>> + struct appletb_bl *bl = bl_get_data(bdev);
> >>>> + u16 brightness;
> >>>> +
> >>>> + if (bdev->props.state & BL_CORE_SUSPENDED)
> >>>> + brightness = 0;
> >>> 
> >>> From backlight.h:
> >>> 
> >>> * backlight drivers are expected to use backlight_is_blank()
> >>> * in their update_status() operation rather than reading the
> >>> * state property.
> >>> 
> >>> Seems to be applicable here.
> >>> 
> >>> Also the hardcoded "0" as index into appletb_bl_brightness_map could be
> >>> avoided by some restructuring.
> >> 
> >> static int appletb_bl_update_status(struct backlight_device *bdev)
> >> {
> >> struct appletb_bl *bl = bl_get_data(bdev);
> >> u16 brightness;
> >> 
> >> if (backlight_is_blank(bdev))
> >> brightness = APPLETB_BL_OFF;
> >> else
> >> brightness = backlight_get_brightness(bdev);
> >> 
> >> return appletb_bl_set_brightness(bl, appletb_bl_brightness_map[brightness]);
> >> }
> >> 
> >> This?
> > 
> > This now looks to be a different logic than before.
> > Below should be the same as in the original patch.
> > 
> > static int appletb_bl_update_status(struct backlight_device *bdev)
> > {
> > struct appletb_bl *bl = bl_get_data(bdev);
> > u8 brightness;
> > 
> > if (backlight_is_blank(bdev))
> > brightness = APPLETB_BL_OFF;
> > else
> > brightness = appletb_bl_brightness_map[backlight_get_brightness(bdev)]);
> > 
> > return appletb_bl_set_brightness(bl, brightness);
> > }
> 
> I’ll replace the original code with this
> 
> > 
> > Maybe it's worth to make APPLETB_BL_* an enum for more clarity.
> 
> I don’t think there is a specific need for an enum here
> 
> If you are fine with these changes, I’ll send a v5

Sounds good.

FYI I'll also review the other patches soonish.
So sending a v5 right away is not necessary.
