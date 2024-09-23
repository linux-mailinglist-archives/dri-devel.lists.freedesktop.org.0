Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6098393B
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 23:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE6610E0A0;
	Mon, 23 Sep 2024 21:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=deller@gmx.de header.b="dllmxYKC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0753210E0A0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 21:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1727128240; x=1727733040; i=deller@gmx.de;
 bh=iRUBPvhBC7A2RDrVOOsf/4seYxW5iayugJENP87Gzjw=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dllmxYKC3Z8b7VVZ/hNZC1v8r+XSY9jTBaCwZOt839ECCZOTptkqhsXgWpuqL86G
 LMZdIfYvp/H7nOCwDJymgxIdZY9rNnhOEcez5ZJHlhjgZMVfR/ZKICJmLGxUpGYd5
 q5QM+K6MMlW0I+qzN2iH33oa4ypTmedL4FadGLCUPMt6imEL6IkFD0fOyRHbDPf/m
 JbrGDD96M4ZpMn5RBbNCywOeQoIM0ZeHg8f0N28NUi8fQI8t79nwCnX7uFn+KoAyT
 CCLuYHvocroA8Du/KMEu9Fz/EKjpjJqgR49RBfklyrhxZZ6ZcWGm6DuP7UM2OF1vN
 0SuCkXIknr1j9Qwj0Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.55] ([109.250.63.79]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MrQEn-1s7g9f2vSR-00hhlF; Mon, 23
 Sep 2024 23:50:40 +0200
Message-ID: <93c63567-d183-402e-82e0-f64b97b74ba8@gmx.de>
Date: Mon, 23 Sep 2024 23:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] fbcon: Make cursor_blink=0 work when configured
 before fb devices appear
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: linux-fbdev@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
References: <20240923155749.30846-1-ville.syrjala@linux.intel.com>
 <20240923155749.30846-2-ville.syrjala@linux.intel.com>
 <3e3fac51-ee46-462e-9418-095845b18ccb@gmx.de> <ZvHd8VV6MO4kfLcL@intel.com>
Content-Language: en-US
From: Helge Deller <deller@gmx.de>
Autocrypt: addr=deller@gmx.de; keydata=
 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
In-Reply-To: <ZvHd8VV6MO4kfLcL@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dcy73ESDp7DkAzpekWv4EW7lQC/rE4vyS3MZRNIBpfZ5yZ6XqPX
 TFhSJLV6zY55tvM8EzDO9fgx43sVocwpTiRd/Lzk/bfhiaf40rMMEpok0bjVUR5+qv4X2FN
 XOhR/Tf/VOIm9JMrCDWXe6LjU8U/p2cAlBahCh/L3Q9bk8CFNWz+/k+Ch+0oonurRC2bYP/
 fqOxjRHykV/xS4O+KyAQQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:lXOLXcdZNmY=;3mygNrUNnMNgzcEPYLo+Tmqa1qW
 oyEgiR5p0avLOob+vO81J4MBkSJjnbCLDkLFn+AUtjrRd5hoJ22cRyVg8h7mBoFEa+iTFRGoY
 KesrXNRhfOVRQQqQCr8HWE5HSg29Zq4X7sM54VS7oyzodAx793Y1zXSCAvA9VE0W1gybfwof2
 LCaGZ0N89wQPJBi2SspFbmESq/AxhlpjKwao6BkCFWn7GyFLzbIuelss5ReE94hAJewnnKZbj
 sYup1pXcraKRSj2x5RCQZxdUOIysgKV1ijmLIDElbs4s5mtygZrsSCrV9MsgiJe3BZAzzXzYc
 fla35pb9mJHTOJt2w+QVwsyH6VJmI3J05Zc8yj2tqNCVY4ibHtNAtQy6NrZ7X541Qb/3PsHwu
 NaMR6EJh0qzHLFsEnn1w1Va3vrHkBYKwI1DuF3x8612BG16NxUrApvMnAfMJR6jAB5SRZHNH4
 CWzbAIx4hEDo77n0cGxBcVYuZP5lHLWSLt4EqE8/D4uBrz6Q/8Ls/i8cVnhkHT0AJfrnUW5Cx
 FEw97pudJZdLM60Qm15lp9ZFyJwWnS+o8AS9a+Pu67fze8wtGTTFYriFSoJL/73e7cfUc5/0u
 JUqwmf/VcmjzQrbicnBAHAPujnbhR0dGw9D3eRUH4b9XVEp1Q5W/N0Q64OwfWDhkrnSOc2kP5
 3QAm6gcYCJThjAR5EnjDYCDw8JhJg65eALnq3/yIDNXxkSFeVKORLZpB35MVtcjgQMON8vQOQ
 I2y7rdr9wz3rTbSbnXf+EUff/ZQORXTCk6H6jhPKvAjU+SK7Aq2mONvQaRNxXTYxgyPHeZVAA
 5PAdZuxfs1HJsRVOvOIpD6/Q==
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

On 9/23/24 23:30, Ville Syrj=C3=A4l=C3=A4 wrote:
> On Mon, Sep 23, 2024 at 11:04:55PM +0200, Helge Deller wrote:
>> On 9/23/24 17:57, Ville Syrjala wrote:
>>> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>>
>>> Currently setting cursor_blink attribute to 0 before any fb
>>> devices are around does absolutely nothing. When fb devices appear
>>> and fbcon becomes active the cursor starts blinking. Fix the problem
>>> by recoding the desired state of the attribute even if no fb devices
>>> are present at the time.
>>>
>>> Also adjust the show() method such that it shows the current
>>> state of the attribute even when no fb devices are in use.
>>>
>>> Note that store_cursor_blink() is still a bit dodgy:
>>> - seems to be missing some of the other checks that we do
>>>     elsewhere when deciding whether the cursor should be
>>>     blinking or not
>>> - when set to 0 when the cursor is currently invisible due
>>>     to blinking, the cursor will remains invisible. We should
>>>     either explicitly make it visible here, or wait until the
>>>     full blink cycle has finished.
>>>
>>> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>>> ---
>>>    drivers/video/fbdev/core/fbcon.c | 34 +++++++----------------------=
---
>>>    1 file changed, 7 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/co=
re/fbcon.c
>>> index 2e093535884b..8936fa79b9e0 100644
>>> --- a/drivers/video/fbdev/core/fbcon.c
>>> +++ b/drivers/video/fbdev/core/fbcon.c
>>> @@ -3217,26 +3217,7 @@ static ssize_t show_rotate(struct device *devic=
e,
>>>    static ssize_t show_cursor_blink(struct device *device,
>>>    				 struct device_attribute *attr, char *buf)
>>>    {
>>> -	struct fb_info *info;
>>> -	struct fbcon_ops *ops;
>>> -	int idx, blink =3D -1;
>>> -
>>> -	console_lock();
>>> -	idx =3D con2fb_map[fg_console];
>>> -
>>> -	if (idx =3D=3D -1 || fbcon_registered_fb[idx] =3D=3D NULL)
>>> -		goto err;
>>> -
>>> -	info =3D fbcon_registered_fb[idx];
>>> -	ops =3D info->fbcon_par;
>>> -
>>> -	if (!ops)
>>> -		goto err;
>>> -
>>> -	blink =3D delayed_work_pending(&ops->cursor_work);
>>> -err:
>>> -	console_unlock();
>>> -	return sysfs_emit(buf, "%d\n", blink);
>>> +	return sysfs_emit(buf, "%d\n", !fbcon_cursor_noblink);
>>
>> I might be wrong and mix up things, but I think the previous code allow=
ed
>> to show/set the blink value *per* registered framebuffer console,
>> while now you generally enable/disable blinking for all
>> framebuffer drivers at once?
>> Just thinking of a multiseat setup with different fb drivers
>> attached to different monitors with own mouse/keyboards...?!?
>
> There is just a single fbcon device in sysfs, so not really.
> It's true that it only ever operated on the fg_console, so
> on a first glane it may look like it might be some kind of
> per-fb thing. But the state was only recorded in the
> fbcon_cursor_noblink singleton, so when another vt becomes
> active it'll look at that an not start the blinker.

True.

> So I think the per-fb aspect was just an illusion.

No, I think in the past it worked, but I assume the per-fb
think got lost in all recent fbcon changes....
So, it's not a problem of your patch series.

> The whole interface is a bit of a mess. But I don't
> really see why anyone would want to use this on a
> per-fb device basis anyway. Either you want blinking
> stuff and extra power draw, or you don't.
>
> I think there are ways to turn of blinking via some escape
> sequences or something as well, so those could probably
> be used on a per-console basis. But I like to use this
> sysfs instead because it can't accidentally be re-enabled
> when random programs mess around with ttys.

I've added your patch series to the fbdev for-next git tree
to get some feedback from the autobuilders and testsuites.
I had to manually adjust patch #4 and #6 (after applying your v2
patches), so maybe you send a v3 of your whole series at some point.
Let's see what we get ...

Helge
