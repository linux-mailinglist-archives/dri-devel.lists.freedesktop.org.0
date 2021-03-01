Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 318FC3293E3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 22:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 996846E090;
	Mon,  1 Mar 2021 21:41:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9F76E090
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 21:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIEioxonGdYkFJL2jpzvEspFQ4lE+vhMcySaclXKTGg=; b=gKWmdv6CAnsHi3rB6LBqmrXmeD
 5RUpndMmgfbZqlrPlGKpQmfuperzX7g8ZTOf2+RZj7n9SGnZjTUJ9lC97K4Z+qx/6JZp8MOgSsJ6x
 mflDGXFjf96b2mM0kUNDZYzmdMAMsSSib0Z366QgomtAm9MJkVwImYLgTOFHfXjgld2V3fNi9ziD5
 HlqLaRDa/orh0+zimHsvwRh0fI5wIfL4+Sbi//FZ1vKDm8Y0WSApTC5YooiJoM8Q8CjkBsoYOOQOy
 s0T//ndVSGGUAzpUF9vrfL8BPYr5Dcv6Jn75AfE3PL0Rd4tALlR1FW/slCnfORi/z/+7OzvM83Civ
 nx03HqZw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60058
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1lGqIS-0006Q1-Vh; Mon, 01 Mar 2021 22:41:45 +0100
Subject: Re: [PATCH v6 3/3] drm: Add GUD USB Display driver
To: Peter Stuge <peter@stuge.se>
References: <20210219121702.50964-1-noralf@tronnes.org>
 <20210219121702.50964-4-noralf@tronnes.org>
 <20210225095825.6196.qmail@stuge.se>
 <ecd868f9-5877-63ea-7d3b-504147489b61@tronnes.org>
 <20210225213729.GG20076@stuge.se> <20210301183158.6090.qmail@stuge.se>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <14e6587d-5efc-4b90-6f0e-793c721997b5@tronnes.org>
Date: Mon, 1 Mar 2021 22:41:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210301183158.6090.qmail@stuge.se>
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
Cc: hudson@trmm.net, markus@raatikainen.cc,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 01.03.2021 19.31, skrev Peter Stuge:
> Hi Noralf,
> 
> Peter Stuge wrote:
>> I'll prepare a test setup for the RGB-TFT on the weekend.
> 
> So implementing a GUD and looking at the protocol from yet another
> angle gives more new insights - surprise. :)
> 

Yep, my Raspberry Pi Pico implementation discovered a bug in the
compression code. Running X on a 240x135 display produced some 2x2
buffer rectangles which was so small that they failed to compress.

> Here are some thoughts so far:
> 
> * GUD_REQ_SET_VERSION does still rub me wrong; it seems potentially
>   quite complex to maintain compatibility in two places; both for host
>   and device. I don't want to insist on removing it, but at a minimum
>   it's quite unusual.
>   Part of the idea in USB is that host software updates are easy if
>   not fully automated but device firmware updates less so, thus
>   complexity is rather placed in the host.
> 

Alright, I'll remove it :) This can also be accomplished in the device
by having a switch that turns it into a version 1 device.

> * It's unclear to me from reading the header files in this v6 patch set
>   which GUD_REQ:s and which properties are actually mandatory in devices.
>   I'm getting hints from your STM32 device and reading the driver code in
>   detail, but what do you think is a good way to document what's required
>   vs. optional?
> 

The device must respond to all requests, but can return zero on some
like the property requests. I intend to do a writeup on the wiki later
with some more details around the protocol and how DRM works for this
usecase.

My RPi Pico implementation will also serve as a guide. I've put the
protocol handling in one file for possible reuse:
- gud.h: https://gist.github.com/notro/26bbf918fa59fb89caf155d51d57a40f
- gud.c: https://gist.github.com/notro/c1b32cea591f84d3d1c94f30812c1ba6

I will publish it when I have cleaned up the rest of the code.

> * GUD_REQ_SET_BUFFER my old nemesis. :) It's great that it's optional!
>   But do you see any way to turn it into a bulk message, in order to
>   remove the memory barrier effect of a control transfer before bulk?
> 

On a 1920x1080 RGB565 full update (4MB), the control request is
negligible. I did measure it (USB 2.0), but I don't remember the
numbers, a few milliseconds.

> I think it would be possible to noticeably improve performance later,
> by changing the host driver to submit asynchronous bulk transfers for
> frame data rather than waiting for each transfer to finish; bulk
> transfers will then pack optimally on the wire - but with a control
> transfer in between there's no chance of achieving that.
> 
> Having only one kind of transfer in the hot path would also simplify
> canceling still pending transfers (when using async later) if new data
> gets flushed before the previous frame is completely transfered.
> 

The device is the bottle neck (unless it's powerful like a Pi4):

Host: compresses buffer
Host: sends ctrl transfer
Host: sends bulk transfer
Device: Decompresses buffer, much slower than a desktop CPU
Host: compresses buffer
Host: sends ctrl transfer, waits for device to respond
Device: Has decompressed, and is ready
Host: sends bulk transfer

I would have preferred to do a test on a USB 3.0 device which would put
more stress on the host, but I couldn't find an affordable one with
mainline Linux support.

As you say this can be optimized later. By using double buffering it's
possible to compress the next buffer while the previous is in transit.

lz4 compression has worked really well in my testing, always 2x or better.

I will reconsider the ctrl req if you provide me with numbers that show
it's a performance problem.

> * A fair bit of the EDID isn't used or has dummy values. Have you already
>   considered and dismissed some other ways of accomplishing the same?
> 

EDID is optional (return zero in v7), but useful if you want userspace
to give a name to the monitor in the GUI for instance.

This comment will be present in version 7:

/*
 * Display modes can be fetched as either EDID data or an array of
&gud_display_mode_req.
 *
 * If GUD_REQ_GET_CONNECTOR_MODES returns zero, EDID is used to create
display modes.
 * If both display modes and EDID are returned, EDID is just passed on
to userspace
 * in the EDID connector property.
 */

> * Sorry if I've asked before - but what's the purpose of
>   GUD_REQ_SET_STATE_CHECK and GUD_REQ_SET_STATE_COMMIT? Why/when does
>   drm do pipe check vs. update?
> 

DRM atomic mode setting has 2 stages:
- Check to see if the mode is supported, return -EINVAL if not
- Commit the mode, this is not allowed to fail.

Userspace can also do just the check phase when figuring out which
combination of options that is supported.

> * How do you feel about passing the parameters for
>   GUD_REQ_SET_CONTROLLER_ENABLE and GUD_REQ_SET_DISPLAY_ENABLE in wValue?
>   It would save the transfer data stage.
> 

That would make the request different form the others, wValue is only
used by the connector requests for the index. I prefer to use the data
stage for data. If there was any performance gain I would have looked
into it, but these requests are only used on init and when turning
on/off the display.

Noralf.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
