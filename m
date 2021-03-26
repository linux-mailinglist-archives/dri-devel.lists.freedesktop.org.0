Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBD834A75C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 13:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE276E1D6;
	Fri, 26 Mar 2021 12:34:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623406E1D6
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:34:06 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887A4443;
 Fri, 26 Mar 2021 13:34:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616762043;
 bh=Wnf40Ilesv1yHntQYZH9xGeKUiM63iXI4OOt7UXGriA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=N19BgQ+y34gTobz0y8SX952bZejm/cW901muu15cBrrAR7L6iNnHaEOgAol/FmB+y
 aGz5s4MzfIxq24J+TcL5Ok4GOjiARRH0C2ti22QkWeasRyqXWi1d/A9zkwajcHOrOS
 ng4Bgkkf1q6YXwWhF9Kc8pA+BrrjSnsjXDjqK5z0=
Date: Fri, 26 Mar 2021 14:33:19 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: [PATCH] drm/bridge: adv7511: fix support for large EDIDs
Message-ID: <YF3Ujx+FxeL2eZbA@pendragon.ideasonboard.com>
References: <904185be-19ea-a321-a227-d4e659fe1b68@xs4all.nl>
 <YF0yIDWC+7HtMBLb@pendragon.ideasonboard.com>
 <712f7355-482c-b8e3-701b-5a19774aeb5c@xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <712f7355-482c-b8e3-701b-5a19774aeb5c@xs4all.nl>
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
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Archit Taneja <architt@codeaurora.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On Fri, Mar 26, 2021 at 07:31:09AM +0100, Hans Verkuil wrote:
> On 26/03/2021 02:00, Laurent Pinchart wrote:
> > On Wed, Mar 24, 2021 at 09:53:32AM +0100, Hans Verkuil wrote:
> >> While testing support for large (> 256 bytes) EDIDs on the Renesas
> >> Koelsch board I noticed that the adv7511 bridge driver only read the
> >> first two blocks.
> >>
> >> The media V4L2 version for the adv7511 (drivers/media/i2c/adv7511-v4l2.c)
> >> handled this correctly.
> >>
> >> Besides a simple bug when setting the segment register (it was set to the
> >> block number instead of block / 2), the logic of the code was also weird.
> >> In particular reading the DDC_STATUS is odd: this is unrelated to EDID
> >> reading.
> > 
> > Bits 3:0 of DDC_STATUS report the DDC controller state, which can be
> > used to wait until the DDC controller is idle (it reports, among other
> > possible states, if an EDID read is in progress). Other options are
> > possible of course, including waiting for ADV7511_INT0_EDID_READY as
> > done in adv7511_wait_for_edid(), but I wonder if the !irq case in
> > adv7511_wait_for_edid() wouldn't be better of busy-looping on the DDC
> > status instead of running the interrupt handler manually. That's
> > unrelated to this patch though.
> 
> The DDC status tests for other things as well, including HDCP.

I haven't read the chip's documentation in details, but if HDCP
negotiation is in progress, doesn't that keep the DDC bus busy,
preventing an EDID read ?

> I think it is pure luck that this code even worked:
> 
>         if (adv7511->current_edid_segment != block / 2) {
>                 unsigned int status;
> 
>                 ret = regmap_read(adv7511->regmap, ADV7511_REG_DDC_STATUS,
>                                   &status);
>                 if (ret < 0)
>                         return ret;
> 
>                 if (status != 2) {
>                         adv7511->edid_read = false;
>                         regmap_write(adv7511->regmap, ADV7511_REG_EDID_SEGMENT,
>                                      block);
>                         ret = adv7511_wait_for_edid(adv7511, 200);
>                         if (ret < 0)
>                                 return ret;
>                 }
> 
> What happens on power on is that the adv7511 starts reading the EDID.
> So the DDC_STATUS is 1 (Reading EDID). This code is called, it falls
> in the status != 2 block, it writes the EDID_SEGMENT with 0 (it already
> is 0 after a power on), then waits for the EDID read to finish.
> 
> The only reason this works is that this code is called fast enough
> after the device is powered on that it is still reading the EDID.

Yes, I agree with you. Luck is nice, except when it makes us merge
incorrect code :-)

> It fails if you want to read the next segment, since in that case the
> status is 2 (IDLE) and it will never write the new segment to the
> EDID_SEGMENT register.
> 
> And besides, status wasn't ANDed with 0xf either, and HDCP might
> also be ongoing (should that be enabled in the future).

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
