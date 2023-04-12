Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BE56DFF5E
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 22:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1952610E952;
	Wed, 12 Apr 2023 20:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F091210E952
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 20:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1681329912; i=deller@gmx.de;
 bh=DhiBhSI+RKwKHjN5fzhNl0KOn0kW2D3gA0VJTq059aw=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=llgcc53DMxxE6lpZd5HyuAX1EYgvG3AyV0ww1S/ozYH6kLhL7wp+j6n2wNq0+3W4L
 vCQWpBCwaYbW4CD1LZO7ws9qHj5VSjkjO8gu0CMR4DAzp0xsf7qgpdfUlocN0FdbhT
 PdEcuQuawOnPFSr/GtELlAw/i5neuudZC6PRAsf6AX5aDBkYUgsU+xLo7EpDAbYplL
 CiO5l0DaYU0VPZTRFo/kckeeVV27/WbQAwtYp4i9NZNY0fa8Ud0zdfmHQQTk02BKRy
 +8MsVFODiP6amZKil2Z1Z6LiE6N2T3dXIBppyGDG2DLqKy1rUBju61fNz2/+ri9aHB
 ZNgAmGyrN8W1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.156.74]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MMofc-1q3Fd61ygm-00ImUk; Wed, 12
 Apr 2023 22:05:12 +0200
Message-ID: <9d0c09c0-73ff-d655-d5d2-17c90b3e69ec@gmx.de>
Date: Wed, 12 Apr 2023 22:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: modedb: Fix kernel crash in fb_videomode_to_var()
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <ZB4GS3zT3oh/afkf@ls3530> <ZDb6IF6Jj0xtVlme@phenom.ffwll.local>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <ZDb6IF6Jj0xtVlme@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3jgaTRHzRGNrj0o+HV3TGa0EqKAIuiqEQiypQJXVw2r6YHDpUjN
 5IqVgbeqHbvWMGCsU8CiZkS6uCydMwnV2LuikyGBKTR8J6azhwPiQPL9a63g49T9ldT+tPy
 kNXwZdrPGXnGXQd5c+u+nuEN21SoPi491Y1sFrZY96rm/gubGYjzYWxqtOvi4rBwpXw565M
 jz8L9HmaIymVrTYPwGvnw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fTaMX4pGaiQ=;GlzweesCCZ9Rclzl/v7IJobYtvL
 SRDIN3kr7Y18uN/DgIuCcKJl9BEmECkMd31L4jGx7ICRDCeva3ouZjpajYcZKXHVJ69QoiKO5
 z/lgijr1ytdwOfDgHuIGpvQ3RfG1m+c09CAMoF6J57jJJWSYb3zVjFFlfh81wgs1RVj4xKTE4
 LAOblf8ENfgxrloggfD/nsUmahonIkMq626q5FtK5qwROmJVxUevTsvkA9Vri0HvnLgodIitq
 oK42O120SA0iBHFU+dn5YOstXQghZSoOC4CzZDUoA8WfvUrRUYiqJfaJUWEN28b/gIEn+v7sT
 s45YJfxEX7OHi4RvI1W6G1a+EH0hmgQgouVsCF3/NMmoWcP/yRvmtHtYG2spZPr8fvqrz6P+O
 K3/T20BEB9A51Ub+Qv99WjZ8fynodtFe5CUCrhQxyQXy562sdXj7NnixFGfpPpgIak/EXZL0I
 A9n+wHYembAjfdh4eHcqtmmPGZHs6Bs8m4cVXoUjI1Gy8/Ba4qETcl8hEhvGRFOvFZ1zPWywk
 A8V/GMjSEh2VIEbkkWk8ZaHt1p32tcLLnpueencVzk8bmWhosPNqiimz+ZQ9bxbQQMTWU3cJe
 67qf3fyxdvWkDlDhqNtUI6B54DPU0uHcHWTUCBOzbK/UMR80/42tUpr2Jpd8J77MPKzHU2rFB
 Yow2h/XHevAkkUPGrhWZnrh3vkW9PW+jhc8tuRBKsSHNqVOvyIXfu2Z8wEAgEIQjFv/ngbiyM
 Ulr0ykrWxb06KTOXlNIlVX664nTxvWm336oepLakr1sQ7GEVLj2fu1d0LFrvkYoIvK68fZL+p
 1ba+YdsFxzZJimuXVKDKmj6ZNcSoHq70dysRfW5VRAo1gLZPTjwY8NMQkjpczz2CnF4AqgIyo
 6Zo2tYMQWYCvE9uMer8P9bwTwImnp/XntVn0hDDiKeO50cXFJg5JDwyfdAajPAve7+CQrz2sg
 oFrqoQ==
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
Cc: linux-fbdev@vger.kernel.org, linux-parisc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/12/23 20:36, Daniel Vetter wrote:
> On Fri, Mar 24, 2023 at 09:21:31PM +0100, Helge Deller wrote:
>> Fix a kernel crash in the fbdev modedb code which can happen if you boo=
t
>> a system without any graphic card driver, in which case the dummycon
>> driver takes the console. If you then load a fbdev graphics driver and
>> start a the X11-fbdev the kernel will crash with a backtrace:
>>
>>    IAOQ[0]: fb_videomode_to_var+0xc/0x88
>>   Backtrace:
>>    [<10582ff8>] display_to_var+0x28/0xe8
>>    [<1058584c>] fbcon_switch+0x15c/0x55c
>>    [<105a8a1c>] redraw_screen+0xdc/0x228
>>    [<1059d6f8>] complete_change_console+0x50/0x140
>>    [<1059eae0>] change_console+0x6c/0xdc
>>    [<105ab4f4>] console_callback+0x1a0/0x1a8
>>    [<101cb5e8>] process_one_work+0x1c4/0x3cc
>>    [<101cb978>] worker_thread+0x188/0x4b4
>>    [<101d5a94>] kthread+0xec/0xf4
>>    [<1018801c>] ret_from_kernel_thread+0x1c/0x24
>>
>> The problem is, that the dummycon driver may not have a valid monitor
>> mode defined (which is ok for that driver), so the mode field in
>> fbcon_display can be NULL.
>>
>> Fix the crash by simply returning from fb_var_to_videomode()
>> if the video mode field is NULL.
>>
>> Signed-off-by: Helge Deller <deller@gmx.de>
>> Cc: stable <stable@kernel.org>
>
> Also here since the other thread is private: I don't think this makes
> sense, and it shouldn't happen that disp->mode is bogus when we have an
> fbdev bound for that vc.
>
> I think the below might work, I spotted this while auditing code around
> this (but it turned out to be a dead-end for the bug I was chasing):
>
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core=
/fbcon.c
> index eb565a10e5cd..1f2ab00ec6d4 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2684,8 +2684,8 @@ static void fbcon_modechanged(struct fb_info *info=
)
>   	p =3D &fb_display[vc->vc_num];
>   	set_blitting_type(vc, info);
>
> +	var_to_display(p, &info->var, info);
>   	if (con_is_visible(vc)) {
> -		var_to_display(p, &info->var, info);
>   		cols =3D FBCON_SWAP(ops->rotate, info->var.xres, info->var.yres);
>   		rows =3D FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
>   		cols /=3D vc->vc_font.width;
>
> If this works I can bake it into a real patch.

Daniel, thanks for your suggested patch!
Actually I currently can't reproduce my original problem any longer.
It happened with a specific fbdev driver which I'm currenlty working on, a=
nd
in which I probably missed to set a valid video mode, which then led to th=
e patch
I originally sent.
So, for now just ignore my patch.

If it happens again I'll test your patch and report back.

Thanks!
Helge
