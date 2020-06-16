Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8F91FB1E7
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 15:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1726E17E;
	Tue, 16 Jun 2020 13:21:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD496E17E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 13:21:32 +0000 (UTC)
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1472D206F1;
 Tue, 16 Jun 2020 13:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592313692;
 bh=NzmkbhpV6gQ0cqf7U1NrQrUNv6zLElTT90CV/gT2kXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ofTlfOUw8BPhx2Iu5uPfykNaA7iGUrhxxKy/hPpiDlwfnFVJh00fKYFJlUK9WaU7g
 wWH/Kw5fsg5b0N0Iee63zhTBNEd4mQraUaXU3u+9ASbhkS64YuHwRgqAi0NryX6IRJ
 YgEi0dom95iZDI/5Z8TMtN4r7+AjR9G/CHQGGiOM=
Date: Tue, 16 Jun 2020 09:21:30 -0400
From: Sasha Levin <sashal@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Subject: Re: [RFC PATCH 0/4] DirectX on Linux
Message-ID: <20200616132130.GO1931@sasha-vm>
References: <20200519163234.226513-1-sashal@kernel.org>
 <CAPM=9txZpiCGkv3jiBC1F8pTe4A2pqWpQDyjRBXk2roFqw+0+Q@mail.gmail.com>
 <CAPM=9tx4wh-Lk6Dffsdh-7mYvXx+GX2AxhrGqFgyN8-AWJvP6A@mail.gmail.com>
 <20200616105156.GE1718@bug>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200616105156.GE1718@bug>
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
Cc: linux-hyperv@vger.kernel.org, sthemmin@microsoft.com, "Ursulin,
 Tvrtko" <tvrtko.ursulin@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, haiyangz@microsoft.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, spronovo@microsoft.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 iourit@microsoft.com, "Deucher, Alexander" <alexander.deucher@amd.com>,
 kys@microsoft.com, wei.liu@kernel.org, Hawking Zhang <Hawking.Zhang@amd.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 16, 2020 at 12:51:56PM +0200, Pavel Machek wrote:
>> > Having said that, I hit one stumbling block:
>> > "Further, at this time there are no presentation integration. "
>> >
>> > If we upstream this driver as-is into some hyperv specific place, and
>> > you decide to add presentation integration this is more than likely
>> > going to mean you will want to interact with dma-bufs and dma-fences.
>> > If the driver is hidden away in a hyperv place it's likely we won't
>> > even notice that feature landing until it's too late.
>> >
>> > I would like to see a coherent plan for presentation support (not
>> > code, just an architectural diagram), because I think when you
>> > contemplate how that works it will change the picture of how this
>> > driver looks and intergrates into the rest of the Linux graphics
>> > ecosystem.
>> >
>> > As-is I'd rather this didn't land under my purview, since I don't see
>> > the value this adds to the Linux ecosystem at all, and I think it's
>> > important when putting a burden on upstream that you provide some
>> > value.
>>
>> I also have another concern from a legal standpoint I'd rather not
>> review the ioctl part of this. I'd probably request under DRI
>> developers abstain as well.
>>
>> This is a Windows kernel API being smashed into a Linux driver. I don't want to be
>> tainted by knowledge of an API that I've no idea of the legal status of derived works.
>> (it this all covered patent wise under OIN?)
>
>If you can't look onto it, perhaps it is not suitable to merge into kernel...?
>
>What would be legal requirements so this is "safe to look at"? We should really
>require submitter to meet them...

Could you walk me through your view on what the function of the
"Signed-off-by" tag is?

-- 
Thanks,
Sasha
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
