Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C103A795A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 10:48:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B83189826;
	Tue, 15 Jun 2021 08:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEACE89826
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 08:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TOAKpARVZ/W5sw6vyY8enrWkycIjNeHGafTd3a3wxxI=; b=WOaEaIVkr6sIpHEGUt+W6OeVak
 7AJRwy1SuofiJsWC9UKAn0Dm7cgk9BbCrK/Mx2cy1Iiw8oLOjRpUTozAIFllnF78iW6DzPB1hk1br
 rT43wFHT9muWXRM9Weygco4TiHvl6ETb3vp5hP/JWj/b+8VHuth6HNVI7X4Z/rn1PXKwHIWPbOb5R
 aC046Uxg/VCX59d2dwpT84dKEyGO+YNaPDNhHOfRKl3gLRVReSTJ8i7TfXiKbHCbBDubVbW/y2psh
 NhWeWiMNnp88tdf6LkSvizAClnMd2TrYiZznYvnasIY8KtK9235/t99idQhH6GAFkcyPSdYyJWGEj
 y6zHoDdg==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=56665)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lt4kK-0006g6-J9; Tue, 15 Jun 2021 10:48:32 +0200
Subject: Re: [PATCH 2/2] drm/gud: Use scatter-gather USB bulk transfer
To: Linus Walleij <linus.walleij@linaro.org>
References: <20210329180120.27380-1-noralf@tronnes.org>
 <20210329180120.27380-2-noralf@tronnes.org>
 <CACRpkda6K59aVCDwKmy1AJ2z+nq2-pjvCWFFn8Yd1aUFAGfsgg@mail.gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <0c688720-08d5-452a-31d1-db5020075d23@tronnes.org>
Date: Tue, 15 Jun 2021 10:48:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CACRpkda6K59aVCDwKmy1AJ2z+nq2-pjvCWFFn8Yd1aUFAGfsgg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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
Cc: Peter Stuge <peter@stuge.se>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 14.06.2021 22.54, skrev Linus Walleij:
> Hi Noralf,
> 
> On Mon, Mar 29, 2021 at 8:01 PM Noralf Trønnes <noralf@tronnes.org> wrote:
> 
>> There'a limit to how big a kmalloc buffer can be, and as memory gets
>> fragmented it becomes more difficult to get big buffers. The downside of
>> smaller buffers is that the driver has to split the transfer up which
>> hampers performance. Compression might also take a hit because of the
>> splitting.
>>
>> Solve this by allocating the transfer buffer using vmalloc and create a
>> SG table to be passed on to the USB subsystem. vmalloc_32() is used to
>> avoid DMA bounce buffers on USB controllers that can only access 32-bit
>> addresses.
>>
>> This also solves the problem that split transfers can give host side
>> tearing since flushing is decoupled from rendering.
>>
>> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> 
>> +       num_pages = PAGE_ALIGN(gdrm->bulk_len) >> PAGE_SHIFT;
> 
> Isn't it the same to write:
> 
> num_pages = round_up(gdrm->bulk_len, PAGE_SIZE)?
> 
> Slightly easier to read IMO.
> 

Yes it's the same, I just copied this from elsewhere in the kernel where
a vmalloc buffer is turned into an sg list. I can change that.

>> +       if (max_buffer_size > SZ_64M)
>> +               max_buffer_size = SZ_64M; /* safeguard */
> 
> Explain this choice of max buffer in the commit message
> or as a comment please because I don't get why this size
> is the roof.
> 
>> +struct gud_usb_bulk_context {
>> +       struct timer_list timer;
>> +       struct usb_sg_request sgr;
>> +};
>> +
>> +static void gud_usb_bulk_timeout(struct timer_list *t)
>> +{
>> +       struct gud_usb_bulk_context *timer = from_timer(timer, t, timer);
>> +
>> +       usb_sg_cancel(&timer->sgr);
> 
> Error message here? "Timeout on sg bulk transfer".
> 

A timeout is detected in gud_usb_bulk() which will return -ETIMEDOUT if
the timer did fire. gud_flush_work() will print an error message.

>> +}
>> +
>> +static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
>> +{
>> +       struct gud_usb_bulk_context ctx;
>> +       int ret;
>> +
>> +       ret = usb_sg_init(&ctx.sgr, gud_to_usb_device(gdrm), gdrm->bulk_pipe, 0,
>> +                         gdrm->bulk_sgt.sgl, gdrm->bulk_sgt.nents, len, GFP_KERNEL);
>> +       if (ret)
>> +               return ret;
>> +
>> +       timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
>> +       mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
>> +
>> +       usb_sg_wait(&ctx.sgr);
>> +
>> +       if (!del_timer_sync(&ctx.timer))
>> +               ret = -ETIMEDOUT;
>> +       else if (ctx.sgr.status < 0)
>> +               ret = ctx.sgr.status;
>> +       else if (ctx.sgr.bytes != len)
>> +               ret = -EIO;
>> +
>> +       destroy_timer_on_stack(&ctx.timer);
>> +
>> +       return ret;
>> +}
> 
> Mention in the commit message that sending USB bulk transfers with
> an sglist could be unstable so you set up a timeout around
> usb_sg_wait() (did this happen to you? then write that)
> 
> The other users of usb_sg_wait() in the kernel do not have these
> timeout wrappers, I suspect the reasoning is something like
> "it's graphics, not storage, so if we timeout and lose an update,
> too bad but let's just continue hoping the lost graphics will be
> less than noticeable" so then we should write that as a comment
> about that in the code or something.
> 

There are 5 users of usb_sg_wait() in the kernel:
drivers/input/touchscreen/sur40.c
drivers/misc/cardreader/rtsx_usb.c
drivers/mmc/host/vub300.c
drivers/usb/misc/usbtest.c
drivers/usb/storage/transport.c

3 of those wrap it in a timer:
drivers/misc/cardreader/rtsx_usb.c: rtsx_usb_bulk_transfer_sglist()
drivers/mmc/host/vub300.c: __command_write_data()
drivers/usb/misc/usbtest.c: perform_sglist()

And it looks to me like usb/storage has some timeout handling through
the scsi layer:
/drivers/usb/storage/scsiglue.c: command_abort() ->
usb_stor_stop_transport() -> usb_sg_cancel()

This leaves 1 out of 5 users without timeout handling?

usb_bulk_msg() has builtin timeout handling and during development of a
microcontroller gadget implementation I've triggered this timeout
several times when the uC usb interrupts stopped firing.

I can add a comment in the commit message about the timer.

Noralf.

> With these comments fixed up:
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Yours,
> Linus Walleij
> 
