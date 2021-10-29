Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B643FFA1
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 17:33:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57A56E15A;
	Fri, 29 Oct 2021 15:33:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14446E15A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 15:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=In-Reply-To:Content-Type:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description; bh=F6H2c8H2AxY3gkuNZc3pwN2LaMrim+BCPLUjZC6OLqw=; b=Pw4/2
 qkDgX1X5Z9mFEY/si2m2m1hjrlCtuf0mlYliRQ0pMAVceRdUxCt/DnroW2Afr9ivC+vzm4Io89es8
 ch+eB/b5HbBEB3lGKv4uV9LD037I3fUB/U+5FcDcyCT6tIzlvTV/j0K5B//RDhIGjP4g6OTa0pe18
 UsafG6JvE+Wa7HfDoqGAwctjN5xDq22gsQ9NVNGCIOcjFHuI3ZUBo5Sytz4RNm6McemQrzi6I1gFw
 Eb0DXEJKlvATD0V6q6mO3uwVchjjtnRvUzNp9+hXyjealk8B+EesnRdZfxxQX6C3slD9jne3MuJBT
 CO4hajKNnfC7x6JL28PfJJPq6NXTg==;
Received: from [81.174.171.191] (helo=donbot)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mgTsx-0005kF-MS; Fri, 29 Oct 2021 16:33:39 +0100
Date: Fri, 29 Oct 2021 16:33:32 +0100
From: John Keeping <john@metanate.com>
To: Bert Schiettecatte <bert@noisetron.com>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Subject: Re: dri/drm/kms question with regards to minor faults
Message-ID: <YXwUTPBPlgwj5NdA@donbot>
References: <e9e2bbf8-daa3-48f0-b875-f7487b64d57c@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e2bbf8-daa3-48f0-b875-f7487b64d57c@www.fastmail.com>
X-Authenticated: YES
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Bert,

On Tue, Oct 26, 2021 at 05:18:47PM -0700, Bert Schiettecatte wrote:
> I have an application I'm working on where I'm using OpenGLES / EGL
> and dri/drm/kms. The main loop of my application looks like the code
> below. When running htop, I see that the number of minor faults
> (memory) are increasing over time at a rate of about 500 per second,
> due to the code below. Is this normal and something to worry about,
> and is there a way to get rid of the minor faults? I'm on the rockchip
> rk3288 platform. The faults do not come from my OpenGLES code. 

Coincidentally, I've been looking at Panfrost on RK3288 this week as
well!  I'm testing it with a project that has been using the binary blob
driver for several years and unfortunately Panfrost seems to use ~15%
more CPU.

Like you, I see a huge number of minor faults (~500/second compared with
~3/second on libmali).  It seems that Panfrost is mmap'ing and
munmap'ing buffers on every frame which doesn't happen when the same
application is using the binary driver.

I've testing Linux 5.10.76 and 5.15-rc7 along with Mesa 20.3.5, 21.1.8
and main (as of 704340f0f67) and there's no real difference in
performance across any of those.

Panfrost experts, is there a missed opportunity for optimisation here?
Or is there something applications should be doing differently to avoid
repeatedly mapping & unmapping the same buffers?


Thanks,
John
