Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE32023332E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jul 2020 15:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A896E901;
	Thu, 30 Jul 2020 13:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFDD26E901
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 13:38:09 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id v22so9190687edy.0
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jul 2020 06:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sb67XdiMNKw4kLYECvn8kVzTIpC9oxQwoKlyPT/fqdw=;
 b=KmxFjAe7aZbmjZBxeSSin2JTRrtUWASZtFPD7BWaP8Pyfe6v1Xn4RkkqTbHVIKTiJF
 A4+YAcKAT+em2dTVzKl8QEmnZDx+N4ZqBUKpFfR+5Z0stACE7kvsqM1XRJWH/abj31yi
 FOWq2OEP+fMGLWgWGB3MDNlAP5P3rnvxYh4VC/oH83rf23z3j8xVaCEiaCRZYYezswOW
 DMa8w24P3fQoErqiXkBG2yKuVNEzMY+egrKzCSSfvlnUbqx/0+noOzKGeIP3DdeQ/W5+
 s5CBzneQPPZFTB1lSmZO/rm6S7WwarorObVQnSv4VD1OVO6VBzg67gYTrFCY6J5+Haa/
 lL5Q==
X-Gm-Message-State: AOAM531cdmwoJyj3IbHavDU1wLWs+GYYLiFTwU1mnBGZaZoHjhF1O2y7
 bcyyk/d42c85cEvQokCcAhY=
X-Google-Smtp-Source: ABdhPJyDNlt4vhhufMGcGCRB1ChSoyT2AlgoK32HQNBg6TqRjcXaQWvxk2/Mqe03QNCpFJZG0Sml5Q==
X-Received: by 2002:a50:da05:: with SMTP id z5mr2585340edj.207.1596116288537; 
 Thu, 30 Jul 2020 06:38:08 -0700 (PDT)
Received: from ?IPv6:2a0b:e7c0:0:107::49? ([2a0b:e7c0:0:107::49])
 by smtp.gmail.com with ESMTPSA id qk30sm4393503ejb.125.2020.07.30.06.38.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jul 2020 06:38:07 -0700 (PDT)
Subject: Re: [PATCH] vgacon: Fix an out-of-bounds in vgacon_scrollback_update()
To: Yang Yingliang <yangyingliang@huawei.com>, b.zolnierkie@samsung.com
References: <20200713105730.550334-1-yangyingliang@huawei.com>
 <220220f1-48f7-46f6-952f-ab41fa57d6a1@kernel.org>
 <c3714d73-d5fe-c77a-e554-bb1ff4fd6980@huawei.com>
From: Jiri Slaby <jirislaby@kernel.org>
Message-ID: <9aecd7ac-5060-6b8d-61f8-393431eb243f@kernel.org>
Date: Thu, 30 Jul 2020 15:38:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <c3714d73-d5fe-c77a-e554-bb1ff4fd6980@huawei.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?5byg5LqR5rW3?= <zhangyunhai@nsfocus.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30. 07. 20, 15:24, Yang Yingliang wrote:
> =

> On 2020/7/30 19:04, Jiri Slaby wrote:
>> On 13. 07. 20, 12:57, Yang Yingliang wrote:
>>> I got a slab-out-of-bounds report when I doing fuzz test.
>>>
>>> [=A0 334.989515]
>>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>>> [=A0 334.989577] BUG: KASAN: slab-out-of-bounds in
>>> vgacon_scroll+0x57a/0x8ed
>>> [=A0 334.989588] Write of size 1766 at addr ffff8883de69ff3e by task
>>> test/2658
>>> [=A0 334.989593]
>>> [=A0 334.989608] CPU: 3 PID: 2658 Comm: test Not tainted
>>> 5.7.0-rc5-00005-g152036d1379f #789
>>> [=A0 334.989617] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
>>> BIOS rel-1.12.1-0-ga5cab58e9a3f-prebuilt.qemu.org 04/01/2014
>>> [=A0 334.989624] Call Trace:
>>> [=A0 334.989646]=A0 dump_stack+0xe4/0x14e
>>> [=A0 334.989676]=A0 print_address_description.constprop.5+0x3f/0x60
>>> [=A0 334.989699]=A0 ? vgacon_scroll+0x57a/0x8ed
>>> [=A0 334.989710]=A0 __kasan_report.cold.8+0x92/0xaf
>>> [=A0 334.989735]=A0 ? vgacon_scroll+0x57a/0x8ed
>>> [=A0 334.989761]=A0 kasan_report+0x37/0x50
>>> [=A0 334.989789]=A0 check_memory_region+0x1c1/0x1e0
>>> [=A0 334.989806]=A0 memcpy+0x38/0x60
>>> [=A0 334.989824]=A0 vgacon_scroll+0x57a/0x8ed
>>> [=A0 334.989876]=A0 con_scroll+0x4ef/0x5e0
>> ...
>>> Because vgacon_scrollback_cur->tail plus memcpy size is greater than
>>> vgacon_scrollback_cur->size. Fix this by checking the memcpy size.
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
>>> ---
>>> =A0 drivers/video/console/vgacon.c | 11 ++++++++---
>>> =A0 1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/video/console/vgacon.c
>>> b/drivers/video/console/vgacon.c
>>> index 998b0de1812f..b51ffb9a208d 100644
>>> --- a/drivers/video/console/vgacon.c
>>> +++ b/drivers/video/console/vgacon.c
>>> @@ -243,6 +243,7 @@ static void vgacon_scrollback_startup(void)
>>> =A0 static void vgacon_scrollback_update(struct vc_data *c, int t, int
>>> count)
>>> =A0 {
>>> =A0=A0=A0=A0=A0 void *p;
>>> +=A0=A0=A0 int size;
>>> =A0 =A0=A0=A0=A0=A0 if (!vgacon_scrollback_cur->data ||
>>> !vgacon_scrollback_cur->size ||
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 c->vc_num !=3D fg_console)
>>> @@ -251,13 +252,17 @@ static void vgacon_scrollback_update(struct
>>> vc_data *c, int t, int count)
>>> =A0=A0=A0=A0=A0 p =3D (void *) (c->vc_origin + t * c->vc_size_row);
>>> =A0 =A0=A0=A0=A0=A0 while (count--) {
>>> +=A0=A0=A0=A0=A0=A0=A0 size =3D vgacon_scrollback_cur->size -
>>> vgacon_scrollback_cur->tail;
>>> +=A0=A0=A0=A0=A0=A0=A0 if (size > c->vc_size_row)
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 size =3D c->vc_size_row;
>>> +
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0 scr_memcpyw(vgacon_scrollback_cur->data +
>>> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 vgacon_scrollback_c=
ur->tail,
>>> -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p, c->vc_size_row);
>>> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 p, size);
>> Are you sure the consumer can handle split lines? As vgacon_scrolldelta
>> (soff in particular) looks to me like it doesn't.
>>
>> Have you tested you patch? I mean with soft scrollback on the vga
>> console?
> =

> I only test the patch with the reproduce program.

Out of curiosity, what is it doing? Resize and then scroll by \n (line
feed)? Can you share it?

thanks,
-- =

js
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
