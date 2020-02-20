Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127D41669C4
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 22:24:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD6F6EE61;
	Thu, 20 Feb 2020 21:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC5B46EE61
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 21:24:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582233845; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=fg3kAN+btK1HFqzDfNp+bSiNmd2DKAYfPHz8AZvd0VA=;
 b=SDCqDYRsTy5F3DzdyQmm6JwPI85CZIWszvOgqGZVQo7TdYlHN+7qj7U5liLGGzIhlMh30Cwt
 roLGczLH5acTk9FfXc4yDdzk47/GI/WqbHp8sjDSLCCjCJKHOR11476998RFadYPcj8b3FvZ
 GNAqfVFsB+Rgwvs9CRdM6Raz3CY=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4ef8f0.7f59f49b2c70-smtp-out-n02;
 Thu, 20 Feb 2020 21:24:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BDD8FC4479D; Thu, 20 Feb 2020 21:24:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: jsanka)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 603C2C43383;
 Thu, 20 Feb 2020 21:24:00 +0000 (UTC)
MIME-Version: 1.0
Date: Thu, 20 Feb 2020 13:24:00 -0800
From: jsanka@codeaurora.org
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: Support for early wakeup in DRM
In-Reply-To: <20200220201458.GB2363188@phenom.ffwll.local>
References: <00e901d5e81d$fd609ac0$f821d040$@codeaurora.org>
 <20200220201458.GB2363188@phenom.ffwll.local>
Message-ID: <f4f899ae9b035e2eb5ddc89e3c1a120b@codeaurora.org>
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

On 2020-02-20 12:14, Daniel Vetter wrote:
> On Thu, Feb 20, 2020 at 10:45:57AM -0800, jsanka@codeaurora.org wrote:
>> Hello All,
>> 
>> I am seeking recommendations for DRM compatible methods of updating 
>> the
> HW
>> other than frame commit path. When exiting idle/runtime_suspend, the
> driver
>> votes for a bunch of resources including power/clk/bandwidth as a part
> of
>> first commit handling. This usually adds a few millisecond delay 
>> before
>> processing the frame. The requirement is to find possible ways to 
>> reduce
>> this delay by providing an early intimation to the framework to
> "prepare"
>> the HW by voting for the resources and keep the HW ready to process an
>> imminent frame commit. Especially in performance oriented Automotive
> world,
>> these delays are very time critical and we are working on ways to
> mitigate
>> them.
>> 
>> 
>> 
>> DRM framework converges all the parameters affecting the HW in terms 
>> of
> DRM
>> properties in a single COMMIT call. To address the above issue, we 
>> need
> a
>> parallel channel which should allow the framework to make necessary
> changes
>> to the HW without violating the master access privileges.
>> 
>> 
>> 
>> Before resorting to custom downstream ways, I want to check with the
>> community for folks who might have encountered and resolved such 
>> issues.
> 
> Just enable the display, which will grab all the clocks and everything?
> Once the display is on a commit should be possible on the next frame, 
> at
> least for well-working drivers.
> -Daniel
> 
I believe even to turn on the display, DRM will need an explicit commit 
(probably without any planes/pixel buffers). For cases like smart 
panels, where we can keep the panel on(panel internal RAM refresh) and 
power collapse the display HW, resuming back with an explicit commit 
will push a black (or default color programmed in the HW) frame causing 
a glitch.

Thanks and Regards,
Jeykumar S.
>> 
>> 
>> 
>> Thanks and Regards,
>> 
>> Jeykumar S
>> 
>> Qualcomm Inc.
>> 
>> 
>> 
> 
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
