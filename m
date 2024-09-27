Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3763598833F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 13:24:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6304010E1B1;
	Fri, 27 Sep 2024 11:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="tcY4Yqa0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1221310E1B1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Sep 2024 11:24:23 +0000 (UTC)
Received: from [192.168.42.96] (pd9e59da1.dip0.t-ipconnect.de
 [217.229.157.161]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AA3E82FC0061;
 Fri, 27 Sep 2024 13:24:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1727436262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DAi+nOTb+bbbLQwPejLIuSdwe5JN3cnBuPh5p/YroY=;
 b=tcY4Yqa0NIh35E1D/4SVY+SOn6qchI9BV15XOfXVfeWEw+Sb8JCVPLYk01d98X3LshAF5z
 fuW+d1xvrdIu81KuKywgvyyCVStSObV0xdI+jp8xHvkGh7lSIgyizlSo2LJMuKb7vGFIZm
 wjAcRU9a90DJv/4/e4x3N5EjmvokDcE=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <3e5630c0-2ab4-49fc-8b91-988b327bdcf8@tuxedocomputers.com>
Date: Fri, 27 Sep 2024 13:24:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
From: Werner Sembach <wse@tuxedocomputers.com>
To: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: bentiss@kernel.org, dri-devel@lists.freedesktop.org, jelle@vdwaa.nl,
 jikos@kernel.org, lee@kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com,
 pavel@ucw.cz, platform-driver-x86@vger.kernel.org
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ad01bc38-3834-44c9-a5e3-540a09a20643@gmx.de>
 <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <3dde4572-78a0-4a93-916a-563b7150f078@tuxedocomputers.com>
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

Hi,

an additional question below

Am 27.09.24 um 08:59 schrieb Werner Sembach:
> Hi,
>
> Am 26.09.24 um 20:39 schrieb Armin Wolf:
>> Am 26.09.24 um 19:44 schrieb Werner Sembach:
>>
>>> [...]
>>> +// We don't know if the WMI API is stable and how unique the GUID is for 
>>> this ODM. To be on the safe
>>> +// side we therefore only run this driver on tested devices defined by this 
>>> list.
>>> +static const struct dmi_system_id tested_devices_dmi_table[] = {
>>> +    {
>>> +        // TUXEDO Sirius 16 Gen1
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "APX958"),
>>> +        },
>>> +    },
>>> +    {
>>> +        // TUXEDO Sirius 16 Gen2
>>> +        .matches = {
>>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>>> +            DMI_EXACT_MATCH(DMI_BOARD_NAME, "AHP958"),
>>> +        },
>>> +    },
>>> +    { }
>>> +};
>>> +
>>> +static int probe(struct wmi_device *wdev, const void __always_unused *context)
>>> +{
>>> +    struct tuxedo_nb04_wmi_driver_data_t *driver_data;
>>> +
>>> +    if (dmi_check_system(tested_devices_dmi_table))
>>> +        return -ENODEV;
>>
>> Hi,
>>
>> please do this DMI check during module initialization. This avoids having an 
>> useless WMI driver
>> on unsupported machines and allows for marking tested_devices_dmi_table as 
>> __initconst.
I wonder how to do it since I don't use module_init manually but 
module_wmi_driver to register the module.
>>
>> Besides that, maybe a "force" module parameter for overriding the DMI 
>> checking could be
>> useful?

Considering the bricking potential i somewhat want for people to look in the 
source first, so i would not implementen a force module parameter.

Kind regards,

Werner


