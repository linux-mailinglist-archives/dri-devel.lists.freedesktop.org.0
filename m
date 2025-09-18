Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ED5B869F0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 21:08:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E66810E8E9;
	Thu, 18 Sep 2025 19:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="r6kG6ZGg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 3863 seconds by postgrey-1.36 at gabe;
 Thu, 18 Sep 2025 19:08:02 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309FD10E8E9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 19:08:02 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58II3JWD065125;
 Thu, 18 Sep 2025 13:03:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758218599;
 bh=t4/cCa5+Es3PK/YLYFtiDyhJrzARI0WStMwJlXvT8cw=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=r6kG6ZGg/ftlCggJnQ2jFUaA93cbiozpp4y5+kEMJ4pzrj78W3ZiPUtuS+pD61doL
 0gGfb8CNDDqIxpCpmvTZBobGnNwrl4zExEOebcL5sAhzVcp6VvfAIwMo7anYcYDA4a
 f9RzW5MQ/5+obpjSjsJ2R3n5YP0A2z85goCW0ww4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58II3Ilj1732106
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 18 Sep 2025 13:03:18 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 18
 Sep 2025 13:03:18 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 18 Sep 2025 13:03:18 -0500
Received: from localhost (lcpd911.dhcp.ti.com [172.24.233.130])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58II3HEI1277187;
 Thu, 18 Sep 2025 13:03:17 -0500
Date: Thu, 18 Sep 2025 23:33:16 +0530
From: Dhruva Gole <d-gole@ti.com>
To: Michael Walle <mwalle@kernel.org>
CC: Kevin Hilman <khilman@kernel.org>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
Message-ID: <20250918180316.nze5ak3m5pde44uz@lcpd911>
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org>
 <7hv7lhp0e8.fsf@baylibre.com>
 <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <DCVTYCVUCXWH.LAMARC8K4UNU@kernel.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Michael,

On Sep 18, 2025 at 11:48:34 +0200, Michael Walle wrote:
> On Wed Sep 17, 2025 at 5:24 PM CEST, Kevin Hilman wrote:
> > Michael Walle <mwalle@kernel.org> writes:
> >
> > > The TISCI firmware will return 0 if the clock or consumer is not
> > > enabled although there is a stored value in the firmware. IOW a call to
> > > set rate will work but at get rate will always return 0 if the clock is
> > > disabled.
> > > The clk framework will try to cache the clock rate when it's requested
> > > by a consumer. If the clock or consumer is not enabled at that point,
> > > the cached value is 0, which is wrong.
> >
> > Hmm, it also seems wrong to me that the clock framework would cache a
> > clock rate when it's disabled.  On platforms with clocks that may have
> > shared management (eg. TISCI or other platforms using SCMI) it's
> > entirely possible that when Linux has disabled a clock, some other
> > entity may have changed it.
> >
> > Could another solution here be to have the clk framework only cache when
> > clocks are enabled?
> 
> It's not just the clock which has to be enabled, but also it's
> consumer. I.e. for this case, the GPU has to be enabled, until that
> is the case the get_rate always returns 0. The clk framework already
> has support for the runtime power management of the clock itself,
> see for example clk_recalc().

Why did we move away from the earlier approach [1] again?
[1] https://lore.kernel.org/all/20250716134717.4085567-3-mwalle@kernel.org/


> 
> > > Thus, disable the cache altogether.
> > >
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > ---
> > > I guess to make it work correctly with the caching of the linux
> > > subsystem a new flag to query the real clock rate is needed. That
> > > way, one could also query the default value without having to turn
> > > the clock and consumer on first. That can be retrofitted later and
> > > the driver could query the firmware capabilities.
> > >
> > > Regarding a Fixes: tag. I didn't include one because it might have a
> > > slight performance impact because the firmware has to be queried
> > > every time now and it doesn't have been a problem for now. OTOH I've
> > > enabled tracing during boot and there were just a handful
> > > clock_{get/set}_rate() calls.
> >
> > The performance hit is not just about boot time, it's for *every*
> > [get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
> > mailbox, etc. to remote core), this may have a performance impact
> > elsewhere too.
> 
> Yes of course. I have just looked what happened during boot and
> (short) after the boot. I haven't had any real application running,
> though, so that's not representative.

I am not sure what cpufreq governor you had running, but depending on the governor,
filesystem, etc. cpufreq can end up potentially doing a lot more of
the clk_get|set_rates which could have some series performance degradation
is what I'm worried about. Earlier maybe the clk_get_rate part was
returning the cached CPU freqs, but now it will each time go query the
firmware for it (unnecessarily)

I currently don't have any solid data to say how much of an impact
for sure but I can run some tests locally and find out...

> 
> > That being said, I'm hoping it's unlikely that
> > [get|set]_rate calls are in the fast path.
> >
> > All of that being said, I think the impacts of this patch are pretty
> > minimal, so I don't have any real objections.
> >
> > Reviewed-by: Kevin Hilman <khilman@baylibre.com>
> 
> Thanks!
> 
> -michael



-- 
Best regards,
Dhruva Gole
Texas Instruments Incorporated
