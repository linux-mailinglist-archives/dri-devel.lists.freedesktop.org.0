Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EA03A7E15
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56B7C89A59;
	Tue, 15 Jun 2021 12:19:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE05189A59
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 12:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QNziebe8Y94Sh+1HnjQCQQoFGIa0YEDQRAW1FBqop1s=; b=XoE4xZMokB7evRqfEtOGhtMbCz
 oaCfa33CWbHuvAX3GIfVm58vN55c14PtJlEzIFijByAqP+5Njxuef+Vyrx4dyPG65IN+yDbRIIVVh
 OFdxYXigVcYPxB1vsHG4sbuh9rP7BSRgC0nrs30exvPSPuik3cBLyuZoeTkJFVtgwtKeSkTWc23z2
 PnI42sxkPEvZR0ayPc2IOhockpccgI0SAHnyCM8f9b6zktrn1rZZgb2bDatiHx2GjytvCnPeXVin+
 ZIbwZ531OmtAfiBulwjxN6UlAkjINYTMwqTWK6xgyrN1GWWoky4D561CsuKLOW4yHQzStu3M+Sey3
 JLSXniUQ==;
Received: from [2a01:799:95f:4600:cca0:57ac:c55d:a485] (port=56466)
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lt82f-0006xj-9g; Tue, 15 Jun 2021 14:19:41 +0200
Subject: Re: [PATCH 2/2] drm/gud: Use scatter-gather USB bulk transfer
To: Peter Stuge <peter@stuge.se>
References: <20210329180120.27380-1-noralf@tronnes.org>
 <20210329180120.27380-2-noralf@tronnes.org>
 <CACRpkda6K59aVCDwKmy1AJ2z+nq2-pjvCWFFn8Yd1aUFAGfsgg@mail.gmail.com>
 <0c688720-08d5-452a-31d1-db5020075d23@tronnes.org>
 <20210615091751.27367.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6d19359d-f0c0-57db-20b8-eec967c92b3f@tronnes.org>
Date: Tue, 15 Jun 2021 14:19:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210615091751.27367.qmail@stuge.se>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 15.06.2021 11.17, skrev Peter Stuge:
> Hi Noralf,
> 
> Noralf Trønnes wrote:
>>>> +static int gud_usb_bulk(struct gud_device *gdrm, size_t len)
> ..
>>>> +       timer_setup_on_stack(&ctx.timer, gud_usb_bulk_timeout, 0);
>>>> +       mod_timer(&ctx.timer, jiffies + msecs_to_jiffies(3000));
>>>> +
>>>> +       usb_sg_wait(&ctx.sgr);
>>>> +
>>>> +       if (!del_timer_sync(&ctx.timer))
>>>> +               ret = -ETIMEDOUT;
> ..
>>> Mention in the commit message that sending USB bulk transfers with
>>> an sglist could be unstable
> 
> Can you explain a bit about /how/ it is unstable?
> 
> As you write, usb_bulk_msg() (as used before) has a timeout which is
> passed to the host controller hardware and implemented there.
> 
> I haven't used SG with kernel USB but I would expect such a timeout
> to still be available with SG?
> 

I have taken a closer look and usb_bulk_msg() calls usb_start_wait_urb()
which uses wait_for_completion_timeout() so the timeout isn't handled by
the hardware.

usb_sg_wait() on the other hand uses plain wait_for_completion() without
the timeout. So ideally usb_sg_wait() should have had a timeout
parameter and used wait_for_completion_timeout().

> 
>> usb_bulk_msg() has builtin timeout handling and during development of
>> a microcontroller gadget implementation I've triggered this timeout
>> several times when the uC usb interrupts stopped firing.
> 
> The device not responding to bulk packets scheduled and sent by the host
> is a real error /in the device/ and thus not neccessarily something the
> kernel must handle gracefully.. I think it's quite nice to do so, but
> one can argue that it's not strictly required.
> 
> But more importantly: Remember that bulk transfer has no delivery time
> guarantee. It can take indefinitely long until a bulk transfer is
> scheduled by the host on a busy bus which is starved with more
> important things (control, interrupt, iso transfers) - that's not
> an error at all, and may be indistinguishable from the device not
> responding to packets actually sent by the host.
> 
> Having a timeout is important, I just expect the USB SG interface to
> support it since it is the hardware that times out in the non-SG case.
> 
> 
> And since this is essentially real time data maybe a shorter timeout
> is better? 3 seconds seems really long.
> 

I have looked at what the others are using:
- rtsx_usb uses 10 seconds in one place
- vub300 uses 2 seconds plus a length based addition
- usbtest uses 10 seconds.

The other USB DRM driver gm12u320 uses a 1 second timeout per block, so
a worst case timeout of 20 seconds per frame.

3 seconds is a "long time", but compared to the default control request
timeout USB_CTRL_GET_TIMEOUT which is 5 seconds, and which gud uses,
it's not that long. I don't want to put too much limitation on the
device, but ofc can't allow it to hang the driver.

And a timeout is an exception so hitting that probably means something
is seriously wrong. I though of adding some kind of usb bus reset
handling to the driver that kicks in after the device has been
unresponsive for some time, but dropped that since I have so limited
understanding of things USB.

Noralf.

> The timeout must include all latency for a frame, so e.g. 16ms (60 Hz)
> is too short for sure. But maybe something like 500ms?
> 
> 
> //Peter
> 
