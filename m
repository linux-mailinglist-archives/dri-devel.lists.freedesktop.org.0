Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6339529D2D
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 11:03:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C59310E06F;
	Tue, 17 May 2022 09:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E5DD10E0A2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 May 2022 09:03:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dmitry.osipenko) with ESMTPSA id E6B331F4439C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652778223;
 bh=UYubMcn9ZLqkxXynnDr3S5Ixi/XQwp/zcG8Jzl6yAGY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nsd51A3QHf00rG6Hi57mYXcMCohcrFDwfxP2vm41heblBqYqP8pdbTedoIPenjYQg
 mbQs94iUCp2qwefb47xG401nrdU2yt+Rl+winnnME+eFXM/JThc01Nnazdb30flLt5
 XBQJtCZRigSTDLWb0i8lZAU8dxwVCkcGHPpnnJWxpRXXH/CvT0e65pnL1AOhyyxbaV
 UGu92yeY7/xGcFT9j0CZtSm1lM9cXCpZebKiLCHAs+utdb0q4mWslt+1OPZaqRzDli
 qOPYmdS5+29ArJIlZ9xwgkIkD0IJdXpkSA2njVHjVL41vHJRs1tE2FhBs46O8X/XRL
 LHWsl9p/kuutA==
Message-ID: <ef88ec2c-77b5-fa0d-49d1-fdd2451713b7@collabora.com>
Date: Tue, 17 May 2022 12:03:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v1] drm/scheduler: Don't kill jobs in interrupt context
Content-Language: en-US
To: Erico Nunes <nunes.erico@gmail.com>, Steven Price <steven.price@arm.com>
References: <20220411221536.283312-1-dmitry.osipenko@collabora.com>
 <a78343c8-2a6d-b223-4219-6b6b0a4fcb1f@arm.com>
 <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <CAK4VdL2hCEoshWZbCh5mkHuS6wYMiPFR3v4MWTnrEKM9zyv6Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/17/22 10:40, Erico Nunes wrote:
> On Wed, Apr 13, 2022 at 12:05 PM Steven Price <steven.price@arm.com> wrote:
>>
>> On 11/04/2022 23:15, Dmitry Osipenko wrote:
>>> Interrupt context can't sleep. Drivers like Panfrost and MSM are taking
>>> mutex when job is released, and thus, that code can sleep. This results
>>> into "BUG: scheduling while atomic" if locks are contented while job is
>>> freed. There is no good reason for releasing scheduler's jobs in IRQ
>>> context, hence use normal context to fix the trouble.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 542cff7893a3 ("drm/sched: Avoid lockdep spalt on killing a processes")
>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
>>
>> Reviewed-by: Steven Price <steven.price@arm.com>
> 
> Is there something blocking this patch?
> Mesa CI is still hitting the issue and I have been waiting for it to
> be applied/backported to update CI with it.
> Thanks

If this patch won't be picked up anytime soon, then I'll include it into
my "memory shrinker" patchset together with the rest of the fixes, so it
won't get lost.

-- 
Best regards,
Dmitry
