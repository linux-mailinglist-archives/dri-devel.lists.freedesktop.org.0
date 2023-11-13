Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A67EA158
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 17:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D65E10E170;
	Mon, 13 Nov 2023 16:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B877810E3C5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 16:37:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A144FB80D27;
 Mon, 13 Nov 2023 16:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C187DC433C8;
 Mon, 13 Nov 2023 16:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1699893447;
 bh=MS6OK3Y9zr6NroPi54QBhTFjm/3rXWVuwNhqgxT80rs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NuVtMTkKIcxY12QgKlUgvvEIdmu5R03mehE2D8ykODRAe6jpXB/Wbe7/QiWZQoJOS
 FcC6WqWPeyzM50wqIQHxoc+GlMx7wFRld2aIALSOQen2w2c9ggQP3dWt52apcaon0F
 Lnb4g+aU6CFOG+AUv7rCIxY1WlhzzZlSNahodRl+5rz9NzLAbdEbCPAN1TwXffnteP
 Pm+IWB3o3uuub9xYtN1tCfR9HkjtR6F6ZtIk3sEc8Q6HXp+ElDOV2LY9Hfs6phMSqP
 sNptxw2Fsxiv3j3fir6sqZnrCh2tVgAdLZ2S9UOejaG2rBtAabf/+Z26TLwgmHKbfB
 mxwAFobtfX8tg==
Date: Mon, 13 Nov 2023 11:37:25 -0500
From: Sasha Levin <sashal@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: Incomplete stable drm/ast backport - screen freeze on boot
Message-ID: <ZVJQxS6h_K73fMfQ@sashalap>
References: <CABV8kRwx=92ntPW155ef=72z6gtS_NPQ9bRD=R1q_hx1p7wy=g@mail.gmail.com>
 <32a25774-440c-4de3-8836-01d46718b4f8@redhat.com>
 <9dc39636-ff41-44d7-96cb-f954008bfc9d@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <9dc39636-ff41-44d7-96cb-f954008bfc9d@suse.de>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, regressions@lists.linux.dev,
 Keno Fischer <keno@juliahub.com>, Greg KH <gregkh@linuxfoundation.org>,
 dri-devel@lists.freedesktop.org, stable@vger.kernel.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 13, 2023 at 10:49:01AM +0100, Thomas Zimmermann wrote:
>(cc: gregkh)
>
>Hi Jocelyn
>
>Am 13.11.23 um 10:36 schrieb Jocelyn Falempe:
>>On 13/11/2023 09:34, Keno Fischer wrote:
>>>Greetings,
>>>
>>>When connected to a remote machine via the BMC KVM functionality,
>>>I am experiencing screen freezes on boot when using 6.5 stable,
>>>but not master.
>>>
>>>The BMC on the machine in question is an ASpeed AST2600.
>>>A quick bisect shows the problematic commit to be 2fb9667
>>>("drm/ast: report connection status on Display Port.").
>>>This is commit f81bb0ac upstream.
>>>
>>>I believe the problem is that the previous commit in the series
>>>e329cb5 ("drm/ast: Add BMC virtual connector")
>>>was not backported to the stable branch.
>>>As a consequence, it appears that the more accurate DP state detection
>>>is causing the kernel to believe that no display is connected,
>>>even when the BMC's virtual display is in fact in use.
>>>A cherry-pick of e329cb5 onto the stable branch resolves the issue.
>>
>>Yes, you're right this two patches must be backported together.
>>
>>I'm sorry I didn't pay enough attention, that only one of the two 
>>was picked up for the stable branch.
>>
>>Is it possible to backport e329cb5 to the stable branch, or should I 
>>push it to drm-misc-fixes ?
>
>I think stable, which is in cc, will pick up commit e329cb5 
>semi-automatically now. Otherwise, maybe ping gregkh in a few days 
>about it.

I thikn it would be more appropriate to revert 2fb9667, as e329cb5
doesn't look like -stable material. I'll go ahead and do that.

-- 
Thanks,
Sasha
