Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB86A965AA0
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BAC610E85C;
	Fri, 30 Aug 2024 08:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="qP8dd8v7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D11610E85C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1725007450; x=1725612250; i=deller@gmx.de;
 bh=aSOFcQ9mNY2G8yraHCG3PXqH/Av6bV+gKpHSyyMmSOw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=qP8dd8v7bocDxP3C+rBerpfLJhdSR5WrH2o5HBqhaBkdDp7tSuXN7I8GRQn3Z+YY
 QXLERWXcfOo+SXLArOU+hQRm9IrMnWRICbk865KqGHx1bKLTINStE9sspgO/A1Zq8
 Di7oNcJGlm831GPptJdRbo1PUQbtti2+YR2uDrKRuG1x3uxN/9bXzuWw/UCKx+hWe
 KpMHQr+rQnbQW60sIpaQ3ROoHkr5YnVfyQkOu6x3HOJl6fp9RdjK6Bw3M+km6D2tz
 61v5ueknJNJA7R5+Y5nlnRFJYhtRW5zDMrXRzGvbuZviRLIjDwXRgoBhLNL0VgzyT
 UFf6K5HWGpNwZOLf/w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.126]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNcA-1sAcUE0W00-00fslE; Fri, 30
 Aug 2024 10:44:10 +0200
Message-ID: <72396a87-bc41-4b15-924b-7bcd6851bed9@gmx.de>
Date: Fri, 30 Aug 2024 10:44:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] fbdev: Introduce devm_register_framebuffer()
To: Bert Karwatzki <spasswolf@web.de>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?=
 <linux@weissschuh.net>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 Peter Jones <pjones@redhat.com>
References: <20240827-efifb-sysfs-v1-0-c9cc3e052180@weissschuh.net>
 <20240827-efifb-sysfs-v1-3-c9cc3e052180@weissschuh.net>
 <8b52669c-4c99-45e2-8b5e-9348e5e00f70@t-8ch.de>
 <7fec4df2e44ea2b11ac617d1a4ed5cbb49214f7b.camel@web.de>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <7fec4df2e44ea2b11ac617d1a4ed5cbb49214f7b.camel@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hngS1JXrPj/9htsgwIquLsRFYuB5Hf1vJt3rU6gnfiHS/enuoNy
 +diz/OCKx2Hu2r6QAD/QgQfDzoAhrDIciJBgLIPVR0BGKm7+Ai/HTJ3WXp5jVnaHK9sVB2J
 u9QZfTzcJFihG/oBVmXCGzTsoJDVd/F1Rn81wUiKdYhl8nC7x1NF8JsJe85VM4MPlSvq7oK
 5+Rbr/1J0/GbO/TCzYIXQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:98pAO8mO7IY=;88wlBK4YOwUq3AiS/SleQQaZwBO
 IU4+tmVeP1yAc3WzZqvOx5jk104a34FrWjxLlPdStEjxAr1MchzywH+CcPF9RXZaEnQcw5vxO
 N0VYozJULHLa1j3/4xPOCHVsYTYJOniS6TPbm4bQIUCJAC82oFnNUx56dv0Syy8lS6x4s42a6
 +YzHMOg0dADIZaMNk95qBFquwWyRVjKRQ5WwoW7GL+f0yFVjUFEWTtGyFSW7nMOx6wC0BLKbD
 4xNWeGOFJJkTrrW1JqXmSes4TRnUVDy6v4DTRzJZZiplQs+Yj//HkvMX039/QNkNgoTa+0VdA
 /cx8UaCyPpQ7fzFHMFvNhUIS5cW1BAHGrSw6rAHNOAzkC9RW39DMdWUCGOdV6SDIuL1hqYE1d
 8PtFvAOEXZ88rPxhRukp/pK8Ol4EdtRj8L1NzcaQ+6d6kfu2f0GefuI595WmQF71rueQ/OiAd
 6A7OS0bROTbEs803lWLWYTAOFUr4aN/Cdo7S17kyumRogiCxCZZXaiGSLV5urDTxXuzmSsmCd
 7uVR6FeBzYVFGlSaZDAojJ4zIuA9wKhVA0fi0gzbtfRypTGVXYmuWekcFX1jq+xhM8p3sS2i0
 axqxcqPrMV1gCFh445p9E3VD9gx3umFxS+LfmTKCJCAjBH8+++sDri7mv5w9JMI/A3F+NUAiT
 XHqOJbbSI3pELFHZ6/YmAXCBQIcBXJ3AyivP7JpiSy78SNHtfzQK8UfJbLb2NtxZFfhvTuXcO
 r+ZBdqsVcCPTeHRSMqBGAl9fQiW50yDmIIS9L80ETvjRHAreyg9lG/Az+7WOubiifXNgq8Vfa
 Abph6iIT2ys0UR1WHEi4tQng==
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

On 8/30/24 10:25, Bert Karwatzki wrote:
> Am Freitag, dem 30.08.2024 um 09:17 +0200 schrieb Thomas Wei=C3=9Fschuh:
>> Hi everybody,
>>
>> On 2024-08-27 17:25:14+0000, Thomas Wei=C3=9Fschuh wrote:
>>> Introduce a device-managed variant of register_framebuffer() which
>>> automatically unregisters the framebuffer on device destruction.
>>> This can simplify the error handling and resource management in driver=
s.
>>
>> Bert reported that this series broke his framebuffer ([0], [1]).
>>
>> [0] https://lore.kernel.org/lkml/20240829224124.2978-1-spasswolf@web.de=
/
>> [1] https://lore.kernel.org/lkml/20240829230438.3226-1-spasswolf@web.de=
/
>>
>>> Signed-off-by: Thomas Wei=C3=9Fschuh <linux@weissschuh.net>
>>> ---
>>>   drivers/video/fbdev/core/fbmem.c | 24 ++++++++++++++++++++++++
>>>   include/linux/fb.h               |  1 +
>>>   2 files changed, 25 insertions(+)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/co=
re/fbmem.c
>>> index 4c4ad0a86a50..d17a2daa2483 100644
>>> --- a/drivers/video/fbdev/core/fbmem.c
>>> +++ b/drivers/video/fbdev/core/fbmem.c
>>> @@ -544,6 +544,30 @@ unregister_framebuffer(struct fb_info *fb_info)
>>
>> [..]
>>
>>> +/**
>>> + *	devm_register_framebuffer - resource-managed frame buffer device r=
egistration
>>> + *	@dev: device the framebuffer belongs to
>>> + *	@fb_info: frame buffer info structure
>>> + *
>>> + *	Registers a frame buffer device @fb_info to device @dev.
>>> + *
>>> + *	Returns negative errno on error, or zero for success.
>>> + *
>>> + */
>>> +int
>>> +devm_register_framebuffer(struct device *dev, struct fb_info *fb_info=
)
>>> +{
>>> +	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb=
_info);
>>> +}
>>> +EXPORT_SYMBOL(devm_register_framebuffer);
>>
>> This implementation is wrong, it never actually registers the
>> framebuffer. It should look like this:
>>
>> int
>> devm_register_framebuffer(struct device *dev, struct fb_info *fb_info)
>> {
>> 	int ret;
>>
>> 	ret =3D register_framebuffer(fb_info);
>> 	if (ret)
>> 		return ret;
>>
>> 	return devm_add_action_or_reset(dev, devm_unregister_framebuffer, fb_i=
nfo);
>> }
>> EXPORT_SYMBOL(devm_register_framebuffer);
>>
>> Bert, could you test this?
>> Helge, do you want me to resend the series, minus the original patch 1?
>
> Yes, this works for me. Thanks!

Good.

Thomas, please just resend the fixed patch #3 (this one).
And maybe you want to document devm_unregister_framebuffer()
similiar to what you added for devm_register_framebuffer() ?

Helge
