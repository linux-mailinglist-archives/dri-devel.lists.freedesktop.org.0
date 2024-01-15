Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8CB82D34D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 04:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC33110E174;
	Mon, 15 Jan 2024 03:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4357010E174
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 03:24:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 731D7CE0A19;
 Mon, 15 Jan 2024 03:24:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 817DDC433C7;
 Mon, 15 Jan 2024 03:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705289090;
 bh=mo76Nukq1W2YdcLMIvym+hHc0dhnYF0ZzSC0le28VnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FBYUsvo0XHkzqVRKkeZu9QuGyxEdZTZEIgkUT2atkEStyBstrXRoCv84LXOliWvVs
 cliKqsVslsAazoPzFIZ3vHKIhBh2Nyd2kvF3atNT0uasFEx56sW/tvt5Ov/RJNXEQ3
 3bHaG1DSmTdyVTHjiT+axC/q891hn9HKnQF+ZTospsYDu9Ni4Rmc4f2E+dDfrfz/fM
 FEf3mKVswtOp5dxJ/mGMbXyEOVZE8D/nO65MtJS6dMqnrL6QUHhQRctiHzzk+yIuQG
 F4yszopL0vNniBhZHNo5qLwSPiGikBU7NQUMCFzk7BSmWtN12ijgEiLpH9VoIRVmUu
 gc7+cnHApoxzQ==
Date: Sun, 14 Jan 2024 22:24:49 -0500
From: Sasha Levin <sashal@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>
Subject: Re: [PATCH AUTOSEL 4.14 3/6] drm/crtc: Fix uninit-value bug in
 drm_mode_setcrtc
Message-ID: <ZaSlgTAz7vdk97JJ@sashalap>
References: <20231218124725.1382738-1-sashal@kernel.org>
 <20231218124725.1382738-3-sashal@kernel.org>
 <87bkamvay5.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <87bkamvay5.fsf@intel.com>
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
Cc: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 Ziqi Zhao <astrajoan@yahoo.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, stable@vger.kernel.org,
 syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 19, 2023 at 10:44:02AM +0200, Jani Nikula wrote:
>On Mon, 18 Dec 2023, Sasha Levin <sashal@kernel.org> wrote:
>> From: Ziqi Zhao <astrajoan@yahoo.com>
>>
>> [ Upstream commit 3823119b9c2b5f9e9b760336f75bc989b805cde6 ]
>>
>> The connector_set contains uninitialized values when allocated with
>> kmalloc_array. However, in the "out" branch, the logic assumes that any
>> element in connector_set would be equal to NULL if failed to
>> initialize, which causes the bug reported by Syzbot. The fix is to use
>> an extra variable to keep track of how many connectors are initialized
>> indeed, and use that variable to decrease any refcounts in the "out"
>> branch.
>>
>> Reported-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
>> Signed-off-by: Ziqi Zhao <astrajoan@yahoo.com>
>> Reported-and-tested-by: syzbot+4fad2e57beb6397ab2fc@syzkaller.appspotmail.com
>> Tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
>> Link: https://lore.kernel.org/r/20230721161446.8602-1-astrajoan@yahoo.com
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>
>This commit fixes an uninitialized value, but introduces a new
>one. Please backport 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable
>use") from v6.7-rc6 to go with it.

I'll take 6e455f5dcdd1 too, thanks!

-- 
Thanks,
Sasha
