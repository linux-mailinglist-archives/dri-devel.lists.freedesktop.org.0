Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB15A2BE09
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2025 09:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1EB10EA56;
	Fri,  7 Feb 2025 08:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="LPmRIDn9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571210E113
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 16:18:05 +0000 (UTC)
Received: from [192.168.42.116] (pd9e59260.dip0.t-ipconnect.de
 [217.229.146.96]) (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 98AAA2FC004D;
 Thu,  6 Feb 2025 17:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1738858683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n6LU6zxKiKUC5NfzSCWaT/v4KeZZVvnTobPxq3yz3vM=;
 b=LPmRIDn9W4tGg1fEFn+ROJWLxSSh+TZN9vt2CnIdSvbBRMmqhjaMuH0z/Tm54i8YWPCDuN
 rqVshu/6BwtWCL795QIhsVpaePiRc3gEyqinXdHw5IZvVqPG0p58QhvHG/FkGUnL//9V4G
 YdU62clPVHUamV8z8BoKV/RACAXahVA=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <b69e2766-2238-4913-ae2d-21d8716f2eef@tuxedocomputers.com>
Date: Thu, 6 Feb 2025 17:18:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Armin Wolf <W_Armin@gmx.de>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, bentiss@kernel.org,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, cs@tuxedo.de,
 platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org
References: <20250121225510.751444-1-wse@tuxedocomputers.com>
 <aa91e17f-0ea8-4645-a0f9-57c016e36a9e@gmx.de> <Z53f7VNIgUWWFn9l@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Z53f7VNIgUWWFn9l@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 07 Feb 2025 08:32:02 +0000
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

Am 01.02.25 um 09:48 schrieb Pavel Machek:
> Hi!
>
>>> I now got my feet a little wet with hid-bpf regarding something else, and
>>> with that knowledge I would leave the long arrays in the beginning in the
>>> kernel code for the time being:
>>>
>>> sirius_16_ansii_kbl_mapping and sirius_16_iso_kbl_mapping are required
>>> during initialization so they have to exist in the kernel code anyway.
>>>
>>> report_descriptor will most likly not change even for future models and
>>> afaik having report_descriptors in kernel drivers is not unheard of.
>>>
>>> So the only things that could be meaningfully moved to a hid-bpf program
>>> are the sirius_16_*_kbl_mapping_pos_* arrays. But for these is have to give
>>> out some fallback value anyway for the case where a hid-bpf file is missing
>>> or fails to load. So why not use real world values from my test device for
>>> these values?
>>>
>>> As soon as there is a future device that can use the same driver with just
>>> these pos arrays different, then I would implement that change via a bpf
>>> program instead of a change to the kernel driver.
>>>
>>> Let me know if you too think this is a sensefull approach?
>>>
>>>
>>> Another question: Would this patch need to wait for a userspace
>>> implementation of lamp array before it can get accepted?
>> It would be nice if you could test the LampArray implementation. But other than that
>> userspace can catch up later.
>>
>> Still, i am interested in the opinion of the LED maintainers
>> regarding the fake HID interface.
> Comments from previous review were not addressed.
>
> Most importantly, this is not a way to do kernel interface. We want
> reasonable interface that can be documented and modified as needed. We
> want to pass /dev/input to userspace, not raw HID. This is not ok.

There are already 2 endless discussions about this:

https://lore.kernel.org/all/1fb08a74-62c7-4d0c-ba5d-648e23082dcb@tuxedocomputers.com/

https://lore.kernel.org/all/73c36418-34d6-46cf-9f10-6ca5e569274f@tuxedocomputers.com/

And a shorter one before that:

https://lore.kernel.org/all/30cbbf20-08cf-a69b-4f58-359a9802e86f@tuxedocomputers.com/

The brief:

- LampArray is a standard that will hit the Linux world anyway.

- The alternative proposal via a led matrix does not even really fit keyboards, 
and does not at all fit all other device types.

Hans and Benjamin already agree with me that LampArray is the way to go.

So after over 2 years can I please have a final decision on how to implement this?

Regards,

Werner

>
> Best regards,
> 								Pavel
