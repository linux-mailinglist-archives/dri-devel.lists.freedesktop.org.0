Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 234C67135E4
	for <lists+dri-devel@lfdr.de>; Sat, 27 May 2023 19:27:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6396310E14B;
	Sat, 27 May 2023 17:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4921710E14B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 May 2023 17:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1685208412; i=deller@gmx.de;
 bh=MP+V7n8HZDO6zeXPSrSzsBRBz9rwIYjzdbH3Nohh+ek=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=rXkVL3srN4037ZtImgjIDhULRJgc8FRC0Y6jgnnFaSGJmqcIxK60jH9LIAAAm72Wd
 M0m1FN+7RZU9RtCzGuupRcXd0qKIfrbv9PqoRIgTqMu1C/sxukwLUVeQ0fjExbvrBZ
 4ToSlnCOS8gxAVgL6JUE6yTWC72DvRnRf8+ZMZtxG4Jm53Mtcpzfx3AFlpjaXh3Rq1
 XvtTivD72BU/bvjojq6aXzDfYWcCk97iv8a6GcpsHJWrybmEmN31FwMXiWgJwKCsgn
 a9rXy9rHbdDs6IneDfz4bEWCzx3kZkvpyzddxrObluTblTPpmDeoa0A4+7ROe47gfx
 HU9JdEi86hQww==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.159.182]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UUy-1q2Pj43BWk-000d7n; Sat, 27
 May 2023 19:26:52 +0200
Message-ID: <ffe2dc05-b099-107b-adf0-593f2df12bea@gmx.de>
Date: Sat, 27 May 2023 19:26:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] fbcon: Avoid showing softcursor if font not available
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <ZHHLBpGkHBmIpGT9@ls3530> <20230527101807.GA1101718@ravnborg.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230527101807.GA1101718@ravnborg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9kuJ2lJp6Y5s4hBiZvOIPkQTq4FR+BogjUd5bYXwn2eiAHoHmtK
 jvKZFs/Bk113Jg3x8tDj4zQD4g4c279PTSXlq/WXUT3XK2MpifLrzYDebmKFqh+zdmAg+/L
 3KySMC0QjkxrVhOYSwuPT7Qv5UyjLvq9qqcm8Vwc2ZXCrmjVAYjbxCALFIqRSiHD/7utAeZ
 MtFHItGUpHQOZDp2k0K3g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:beMtHZ4I0Gc=;swyUAfsrnpVng0SlwH8uA0JrLsJ
 +VJgzdCXmq0Fd1QtAfRffJ9VhMNBGUy4TGbfIMB+Yw+1SzHNP1OYTfUxQzInP7JEaGyplXTtr
 nHv4uL7RdSRGMFfb4cS0XtpXV7jHIARJkadEvVth6zDI281mmDpsTtOpOP96DU6ofnv0l1ga6
 Fzc2hqk1o7BDfYjDlqiLVVxQPuUxRhg9bdYsCgWuIdsm13z2AOr9kQBH05s1k5LduAo5ttaeZ
 HfambOirdEYOu9tA+4XKvL3GmIBLPaBwrFraC5295OJOn3fBSQDeWI2iv+TMFvsmtPxG8tarn
 QemkHNiQnx2I16fg4TStun1S1D44I02OfnK+CVnCONa/pstAW2QOU1+zkeHzGRVdoxZgkwUUl
 E0FEQKhzu6F+KmVX/KU9bDsMF4cxd/uzXJ16xPtF1dtFa9Ai20kGGuppyUOI+NBhrf86wc/ep
 wbtbISaandz31S2ZOweBRkwIbl93kqcRRcQBHFM6em0kEOmbR8IRXl4FMNBfCJPlH1bh6pUC0
 DYGi2I5fdtVgNIUQ6o9uc2EKYvc2n8qHLg0Vw9Nr74KJ+HN/0vobWq+sP+UPrJbMHSpkZIbML
 ZWbpVKc5Jgk4CPWWkRoC5W54EEMoY64XHzkHQEp26F4N/TgQLbYHMMEDAXr6KGVxg32u3Qz5F
 3H7fVmf4QNV7kUbcAajGHFBNPLYL5G5tk5ULWInqrVPcA/nHrfrJ2gHEXRmhlNDKVC92pnljf
 Xp8gwHc2OSk38ZQoPdSMGbkjPrY6VVJDks7tbXdPqVd+dBZE6o6fAoklrOl7AdEZLgAjs6eSL
 +/l84xnwdWix0EsGu/Sf7ETgwT/YdVliEfV1X4ccEqnIJ/PWGeCy4fGqGmZbq0lhUivN/OimZ
 GZwVZ+AThqk5YIMa+97TBASt74u2Q7IqCnZk48OhdYrx3W7iLEcHwnLvVhAixPn+CX07zeAAx
 cW0aXg==
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/27/23 12:18, Sam Ravnborg wrote:
> Hi Helge,
>
> On Sat, May 27, 2023 at 11:19:02AM +0200, Helge Deller wrote:
>> syzbot repored this bug in the softcursor code:
>>
>> BUG: KASAN: null-ptr-deref in soft_cursor+0x384/0x6b4 drivers/video/fbd=
ev/core/softcursor.c:70
>> Read of size 16 at addr 0000000000000200 by task kworker/u4:1/12
>>
>> CPU: 0 PID: 12 Comm: kworker/u4:1 Not tainted 6.4.0-rc3-syzkaller-geb0f=
1697d729 #0
>> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS=
 Google 04/28/2023
>> Workqueue: events_power_efficient fb_flashcursor
>> Call trace:
>>   dump_backtrace+0x1b8/0x1e4 arch/arm64/kernel/stacktrace.c:233
>>   show_stack+0x2c/0x44 arch/arm64/kernel/stacktrace.c:240
>>   __dump_stack lib/dump_stack.c:88 [inline]
>>   dump_stack_lvl+0xd0/0x124 lib/dump_stack.c:106
>>   print_report+0xe4/0x514 mm/kasan/report.c:465
>>   kasan_report+0xd4/0x130 mm/kasan/report.c:572
>>   kasan_check_range+0x264/0x2a4 mm/kasan/generic.c:187
>>   __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>>   soft_cursor+0x384/0x6b4 drivers/video/fbdev/core/softcursor.c:70
>>   bit_cursor+0x113c/0x1a64 drivers/video/fbdev/core/bitblit.c:377
>>   fb_flashcursor+0x35c/0x54c drivers/video/fbdev/core/fbcon.c:380
>>   process_one_work+0x788/0x12d4 kernel/workqueue.c:2405
>>   worker_thread+0x8e0/0xfe8 kernel/workqueue.c:2552
>>   kthread+0x288/0x310 kernel/kthread.c:379
>>   ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:853
>>
>> This fix let bit_cursor() bail out early when a font bitmap
>> isn't available yet.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable@kernel.org
>> Reported-by: syzbot+d910bd780e6efac35869@syzkaller.appspotmail.com
>> ---
>>   drivers/video/fbdev/core/bitblit.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/c=
ore/bitblit.c
>> index f98e8f298bc1..8587c9da0670 100644
>> --- a/drivers/video/fbdev/core/bitblit.c
>> +++ b/drivers/video/fbdev/core/bitblit.c
>> @@ -247,6 +247,9 @@ static void bit_cursor(struct vc_data *vc, struct f=
b_info *info, int mode,
>>
>>   	cursor.set =3D 0;
>>
>> +	if (!vc->vc_font.data)
>> +		return;
>> +
>>    	c =3D scr_readw((u16 *) vc->vc_pos);
>>   	attribute =3D get_attribute(info, c);
>>   	src =3D vc->vc_font.data + ((c & charmask) * (w * vc->vc_font.height=
));
>
> When browsing the code I noticed another use of vc->vc_font.data.
>
> bit_putcs_{un}aligned() access vc->vc_font.data too, so I wonder if
> bit_putcs() should also check for vc->vc_font.data?
> bit_putcs() is the only user of bit_putcs_{un}aligned.

I think the font is set before any char is printed, so we should
probably be safe there.

> The actual patch here looks good from a quick browsing around, but I
> cannot claim I did a review. But you have my:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thank you!
Helge
