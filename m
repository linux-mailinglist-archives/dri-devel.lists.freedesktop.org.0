Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 444991691B5
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2020 21:10:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 099BD6E0FC;
	Sat, 22 Feb 2020 20:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail27.static.mailgun.info (mail27.static.mailgun.info
 [104.130.122.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 320B66E0FC
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2020 20:10:40 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582402240; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iG2jrwDbtGUA5S6usoYXE9DxxAXtYIcnxCaCERIz/Lk=;
 b=xV7+puK+IM2BQ0/+QnzIE/ekRxoatO4RMKVa41a+Aryv+xULrj4QAvbHc81BLanl+kN2BeeE
 ohYjpnM7H4rpVBR40wTb7cD5/HrkSeh1IjnToprw+0SWzy3GNhuCwpBUu7yary4sWybH9Vmo
 jzp8l+aiFsDfWbExVcGM9l8DVwk=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e518abf.7fc04e0d2490-smtp-out-n01;
 Sat, 22 Feb 2020 20:10:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 26562C4479C; Sat, 22 Feb 2020 20:10:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jsanka)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 72CDDC433A2;
 Sat, 22 Feb 2020 20:10:37 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 22 Feb 2020 12:10:37 -0800
From: jsanka@codeaurora.org
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Support for early wakeup in DRM
In-Reply-To: <20200221172022.GF2363188@phenom.ffwll.local>
References: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
 <20200220201458.GB2363188@phenom.ffwll.local>
 <f4f899ae9b035e2eb5ddc89e3c1a120b@codeaurora.org>
 <20200221172022.GF2363188@phenom.ffwll.local>
Message-ID: <a72999e6205eb85608c55908d84c5317@codeaurora.org>
X-Sender: jsanka@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: 'Sean Paul' <seanpaul@chromium.org>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-02-21 09:20, Daniel Vetter wrote:
> On Thu, Feb 20, 2020 at 01:24:00PM -0800, jsanka@codeaurora.org wrote:
>> On 2020-02-20 12:14, Daniel Vetter wrote:
>> > On Thu, Feb 20, 2020 at 10:45:57AM -0800, jsanka@codeaurora.org wrote:
>> > > Hello All,
>> > >
>> > > I am seeking recommendations for DRM compatible methods of updating
>> > > the
>> > HW
>> > > other than frame commit path. When exiting idle/runtime_suspend, the
>> > driver
>> > > votes for a bunch of resources including power/clk/bandwidth as a
> part
>> > of
>> > > first commit handling. This usually adds a few millisecond delay
>> > > before
>> > > processing the frame. The requirement is to find possible ways to
>> > > reduce
>> > > this delay by providing an early intimation to the framework to
>> > "prepare"
>> > > the HW by voting for the resources and keep the HW ready to process
> an
>> > > imminent frame commit. Especially in performance oriented Automotive
>> > world,
>> > > these delays are very time critical and we are working on ways to
>> > mitigate
>> > > them.
>> > >
>> > >
>> > >
>> > > DRM framework converges all the parameters affecting the HW in terms
>> > > of
>> > DRM
>> > > properties in a single COMMIT call. To address the above issue, we
>> > > need
>> > a
>> > > parallel channel which should allow the framework to make necessary
>> > changes
>> > > to the HW without violating the master access privileges.
>> > >
>> > >
>> > >
>> > > Before resorting to custom downstream ways, I want to check with the
>> > > community for folks who might have encountered and resolved such
>> > > issues.
>> >
>> > Just enable the display, which will grab all the clocks and
> everything?
>> > Once the display is on a commit should be possible on the next frame,
> at
>> > least for well-working drivers.
>> > -Daniel
>> >
>> I believe even to turn on the display, DRM will need an explicit 
>> commit
>> (probably without any planes/pixel buffers). For cases like smart
> panels,
>> where we can keep the panel on(panel internal RAM refresh) and power
>> collapse the display HW, resuming back with an explicit commit will 
>> push
> a
>> black (or default color programmed in the HW) frame causing a glitch.
> 
> Uh, you might want to look into the self-refresh helpers, which do this
> without black frames and stuff.
> 

I believe you are referring to Sean's PSR changes: 
https://patchwork.freedesktop.org/series/57366/
Will take a look.

Thanks and Regards,
Jeykumar S.

> But yeah if there's really a gap here (and not just you folks 
> creatively
> abusing atomic kms in ways that it was not meant to be used) then we 
> can
> add a property that forbids power optimization and guarantee that you 
> can
> do the next screen update immediately. And then we can merge that with 
> all
> the usual requirements (driver implementation that works, open source
> userspace, igt testcase, the full deal).
> 
> But it still feels like you're trying to do something automatically 
> that's
> not meant to work like this.
> 
> Cheers, Daniel
> 
>> 
>> Thanks and Regards,
>> Jeykumar S.
>> > >
>> > >
>> > >
>> > > Thanks and Regards,
>> > >
>> > > Jeykumar S
>> > >
>> > > Qualcomm Inc.
>> > >
>> > >
>> > >
>> >
>> > > _______________________________________________
>> > > dri-devel mailing list
>> > > dri-devel@lists.freedesktop.org
>> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
