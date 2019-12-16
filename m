Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4426D12016C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 10:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E0F89FA6;
	Mon, 16 Dec 2019 09:47:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59DBD89FA6
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 09:47:48 +0000 (UTC)
Received: from [192.168.0.20]
 (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 96377A34;
 Mon, 16 Dec 2019 10:47:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576489664;
 bh=Oa2zjAy88eEZOO6lAfiyhi8EQOZLEhABzdV73KDcbSo=;
 h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=u5Sd0JwcfaKKAWiiHOfo9Y0ljJZxXVVEKOyGXV4p+8uAdJ4tkN8gPDvs8Dmy/ltlQ
 XOiR+yl24p4SaLgMZ9y0EgeC3CL57IlIt2C9aP7FBkARsYEZC1TN+twDUrpbSd6TLW
 UXv/PJu9IA+G/QNetGj32u7vGrHB8DfF6ysO5860=
Subject: Re: [PATCH] drm: rcar-du: Add r8a77980 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20190911192502.16609-1-kieran.bingham+renesas@ideasonboard.com>
 <70b94265-69f3-d18f-1b67-b5b814723b1b@cogentembedded.com>
 <20190913082129.lvusbp6pbcayqh5r@verge.net.au>
 <20190913090359.GC29992@pendragon.ideasonboard.com>
 <2eeacacc-f190-4ba8-32bc-b4103b41db46@ideasonboard.com>
 <20191213004812.GA27328@pendragon.ideasonboard.com>
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <19cb3d1c-6910-4bec-13bb-adb875ddd077@ideasonboard.com>
Date: Mon, 16 Dec 2019 09:47:40 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191213004812.GA27328@pendragon.ideasonboard.com>
Content-Language: en-GB
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
Reply-To: kieran.bingham+renesas@ideasonboard.com
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR RENESAS" <dri-devel@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On 13/12/2019 00:48, Laurent Pinchart wrote:
> Hi Kieran,
> 
> On Mon, Dec 09, 2019 at 12:41:07PM +0000, Kieran Bingham wrote:
>> On 13/09/2019 10:03, Laurent Pinchart wrote:
>>> On Fri, Sep 13, 2019 at 10:21:29AM +0200, Simon Horman wrote:
>>>> On Thu, Sep 12, 2019 at 01:00:41PM +0300, Sergei Shtylyov wrote:
>>>>> On 11.09.2019 22:25, Kieran Bingham wrote:
>>>>>
>>>>>> Add direct support for the r8a77980 (V3H).
>>>>>>
>>>>>> The V3H shares a common, compatible configuration with the r8a77970
>>>>>> (V3M) so that device info structure is reused.
>>>>>
>>>>>    Do we really need to add yet another compatible in this case?
>>>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
>>>>> a patch like this one didn't get posted by me.
>>>>
>>>> The reason for having per-SoC compat strings is that the IP blocks
>>>> are not versioned and while we can observe that there are similarities
>>>> between, f.e. the DU on the r8a77970 and r8a77980, we can't be certain that
>>>> differences may not emerge at some point. By having per-SoC compat strings
>>>> we have the flexibility for the driver to address any such differences as
>>>> the need arises.
>>>>
>>>> My recollection is that this scheme has been adopted for non-versioned
>>>> Renesas IP blocks since June 2015 and uses of this scheme well before that.
>>>
>>> Sure, but we could use
>>>
>>> 	compatible = "renesas,du-r8a77980", "renesas,du-r8a77970";

We already do in arch/arm64/boot/dts/renesas/r8a77980.dtsi.

However that is the *only* non r8a77980 reference in the file so it,
itself looks *very* much out of place.


Furthermore, the main purpose of this patch is that we clearly document
the driver as supporting the r8a77980 in the bindings (No mention that
you must use the ..970 binding), yet in actual fact - the driver could
not currently support loading a device with the following compatible:

	compatible = "renesas,du-r8a77980";


>>> in DT without updating the driver. If the r8a77980 turns out to be
>>> different, we'll then update the driver without a need to modify DT. I'm
>>> fine either way, so
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Thanks,
>>
>> This patch has an RB tag from you, and Simon, but alas I don't believe
>> it has been picked up in your drm/du/next branch.
>>
>> Is this patch acceptable? Or do I need to repost?
> 
> Could you just confirm I should apply this patch, and not go for the
> alternative proposal above ?

I believe the alternative proposal above is what we have today isn't it?


Yes, I do believe we should apply this patch.


I'm going to assume you haven't read the other arguments on this thread
so I'll paste them here:

>>> <Sergei>
>>>    Do we really need to add yet another compatible in this case?
>>> I just added r8a77970 to the compatible prop in the r8a77980 DT. That's why
>>> a patch like this one didn't get posted by me.
>>
>> <Kieran>
>> It's not just about the compatible string for me here,
>>
>> There is no indication in the driver that it supports the r8a77980, and
>> no comment in the driver to explain that the r8a77980 is shared by the
>> r8a77970.
>>
>> This patch makes that explicit at the driver.
>>
>> Also - I am considering sending a patch (that I've already created
>> anyway) to remove the r8a77970 reference from the
>>
>>   arch/arm64/boot/dts/renesas/r8a77980.dtsi file.
>>
>> This is the *only* non r8a77980 reference in this file, so it seems very
>> out of place.
> 
> <Geert>
> Agreed.
> 
>> In fact more so than that - except for a seemingly glaring typo, that
>> I'll investigate and send a patch for next, this is the *only* cross-soc
>> compatible reference:
>>
>> #!/bin/sh
>>
>> files=r8a77*.dtsi
>>
>> for f in $files;
>> do
>>         soc=`basename $f .dtsi | sed 's/-.*//'`
>>         echo "F: $f soc: $soc";
>>
>>         # Find all references to all socs, then hide 'this' soc
>>         grep r8a77 $f | grep -v $soc
> 
> This hides the complete line.  So you better use e.g.
> 
>     sed -e "s/$soc/soc/ig" $f | grep -i r8a
> 
> instead.  No new offenders, though.
> 
>> done;
> 
> Gr{oetje,eeting}s,
> 
>                         Geert


This is the only occurrence within *all* of our compatibles where we do
not reference the compatible string of the device, and we require
specifying 'another compatible'.

This is not documented anywhere, and doesn't seem to follow
{best,any}-practices. That's why I'm trying to fix it up.

--
Regards

Kieran

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
