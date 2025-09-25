Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F620B9D237
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 04:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B347610E823;
	Thu, 25 Sep 2025 02:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ij/PIj8U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 216CA10E823
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 02:26:38 +0000 (UTC)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58P2QJxI1799988;
 Wed, 24 Sep 2025 21:26:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758767179;
 bh=Ls9j3ehev03+/T3e7eCjckf/cKK1mjKSxTbjZU7yHko=;
 h=Date:Subject:From:To:CC:References:In-Reply-To;
 b=ij/PIj8UccGFJ7MtcytPs4WJyZsF6uzCdNN0Z28H3V55N5fvGL7G4jkSAVtCZ5gD6
 e20BhlrEH7snCwah3nHrtT1T2aoL9J9WHvoJtIdWkKWBa0ye2fHIrKnX0Qj2EqHfo8
 nEVjIrMff8N08aipOCtJBRA11+PZ2oG+jgM1LWSY=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58P2QIaK4027010
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 24 Sep 2025 21:26:18 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 24
 Sep 2025 21:26:17 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 24 Sep 2025 21:26:17 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58P2QHDi2737277;
 Wed, 24 Sep 2025 21:26:17 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 24 Sep 2025 21:26:17 -0500
Message-ID: <DD1IXJDTBQ72.2XIEIIN0YA713@ti.com>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
From: Randolph Sapp <rs@ti.com>
To: Kevin Hilman <khilman@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, "Santosh Shilimkar"
 <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>
CC: Andrew Davis <afd@ti.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org> <7hv7lhp0e8.fsf@baylibre.com>
In-Reply-To: <7hv7lhp0e8.fsf@baylibre.com>
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

On Wed Sep 17, 2025 at 10:24 AM CDT, Kevin Hilman wrote:
> Michael Walle <mwalle@kernel.org> writes:
>
>> The TISCI firmware will return 0 if the clock or consumer is not
>> enabled although there is a stored value in the firmware. IOW a call to
>> set rate will work but at get rate will always return 0 if the clock is
>> disabled.
>> The clk framework will try to cache the clock rate when it's requested
>> by a consumer. If the clock or consumer is not enabled at that point,
>> the cached value is 0, which is wrong.
>
> Hmm, it also seems wrong to me that the clock framework would cache a
> clock rate when it's disabled.  On platforms with clocks that may have
> shared management (eg. TISCI or other platforms using SCMI) it's
> entirely possible that when Linux has disabled a clock, some other
> entity may have changed it.
>
> Could another solution here be to have the clk framework only cache when
> clocks are enabled?

So I looked into that. There are still about 34 clock operations that are
functionally uncached, but it does seem more logical than treating everythi=
ng as
uncached.

Side note, why would someone even want to read the rate of an unprepared cl=
ock?
I dumped some debug info for all the clocks tripping this new uncached path=
.
Seems weird that it's even happening this often. Even weirder that it's
apparently happening 3 times to cpu0's core clock on the board I'm currentl=
y
testing.

Some devices it only happens once, others get it two or three times. Most o=
f
them seem to be obvious - someone trying to read a rate before the clock wa=
s
prepared as part of a probe sequence. One seemed to be happening directly a=
fter
a clk_prepare_enable call that completed successfully. Not sure how that co=
uld
happen.

>> Thus, disable the cache altogether.
>>
>> Signed-off-by: Michael Walle <mwalle@kernel.org>
>> ---
>> I guess to make it work correctly with the caching of the linux
>> subsystem a new flag to query the real clock rate is needed. That
>> way, one could also query the default value without having to turn
>> the clock and consumer on first. That can be retrofitted later and
>> the driver could query the firmware capabilities.
>>
>> Regarding a Fixes: tag. I didn't include one because it might have a
>> slight performance impact because the firmware has to be queried
>> every time now and it doesn't have been a problem for now. OTOH I've
>> enabled tracing during boot and there were just a handful
>> clock_{get/set}_rate() calls.
>
> The performance hit is not just about boot time, it's for *every*
> [get|set]_rate call.  Since TISCI is relatively slow (involves RPC,
> mailbox, etc. to remote core), this may have a performance impact
> elsewhere too.  That being said, I'm hoping it's unlikely that
> [get|set]_rate calls are in the fast path.
>
> All of that being said, I think the impacts of this patch are pretty
> minimal, so I don't have any real objections.
>
> Reviewed-by: Kevin Hilman <khilman@baylibre.com>
>
>> ---
>>  drivers/clk/keystone/sci-clk.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-c=
lk.c
>> index c5894fc9395e..d73858b5ca7a 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -333,6 +333,14 @@ static int _sci_clk_build(struct sci_clk_provider *=
provider,
>> =20
>>  	init.ops =3D &sci_clk_ops;
>>  	init.num_parents =3D sci_clk->num_parents;
>> +
>> +	/*
>> +	 * A clock rate query to the SCI firmware will return 0 if either the
>> +	 * clock itself is disabled or the attached device/consumer is disable=
d.
>> +	 * This makes it inherently unsuitable for the caching of the clk
>> +	 * framework.
>> +	 */
>> +	init.flags =3D CLK_GET_RATE_NOCACHE;
>>  	sci_clk->hw.init =3D &init;
>> =20
>>  	ret =3D devm_clk_hw_register(provider->dev, &sci_clk->hw);
>> --=20
>> 2.39.5

