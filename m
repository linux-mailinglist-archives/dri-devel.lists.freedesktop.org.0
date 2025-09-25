Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 175DABA1087
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 20:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 847C810E9A1;
	Thu, 25 Sep 2025 18:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="mYzfNO0N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F8610E9A1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Sep 2025 18:32:56 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58PIWcmG1982853;
 Thu, 25 Sep 2025 13:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1758825158;
 bh=YLhrPrJ/nxo/JR0QIrb3ulTfkmpHmQZXFDh+6QpJP+Y=;
 h=Date:To:CC:Subject:From:References:In-Reply-To;
 b=mYzfNO0NcLI02J71eFtQCotuLVhjtjaITQ1N4lrLwB6x2aQSYNwoqLLTCb8P5i4bg
 cZv9s/7o4VOR/0hcRC0Yn+BGQ/J+VPFQHzWAfeovWwWKLkKNIx6DPqNqCknC137cZt
 thznWX/1Eh2RDnpG3fwOY8W2rzLOK7/mxp9wVPrI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58PIWbXk3402736
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Thu, 25 Sep 2025 13:32:37 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 25
 Sep 2025 13:32:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 25 Sep 2025 13:32:37 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.144])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58PIWb6h001964;
 Thu, 25 Sep 2025 13:32:37 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 25 Sep 2025 13:32:37 -0500
Message-ID: <DD23HER39PNM.O17TMFNNWD37@ti.com>
To: Maxime Ripard <mripard@kernel.org>, Randolph Sapp <rs@ti.com>
CC: Kevin Hilman <khilman@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Nishanth Menon"
 <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
 <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Andrew Davis <afd@ti.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/3] clk: keystone: don't cache clock rate
From: Randolph Sapp <rs@ti.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250915143440.2362812-1-mwalle@kernel.org>
 <20250915143440.2362812-3-mwalle@kernel.org> <7hv7lhp0e8.fsf@baylibre.com>
 <DD1IXJDTBQ72.2XIEIIN0YA713@ti.com>
 <20250925-elephant-of-absolute-prowess-a97fcd@penduick>
In-Reply-To: <20250925-elephant-of-absolute-prowess-a97fcd@penduick>
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

On Thu Sep 25, 2025 at 6:43 AM CDT, Maxime Ripard wrote:
> On Wed, Sep 24, 2025 at 09:26:17PM -0500, Randolph Sapp wrote:
>> On Wed Sep 17, 2025 at 10:24 AM CDT, Kevin Hilman wrote:
>> > Michael Walle <mwalle@kernel.org> writes:
>> >
>> >> The TISCI firmware will return 0 if the clock or consumer is not
>> >> enabled although there is a stored value in the firmware. IOW a call =
to
>> >> set rate will work but at get rate will always return 0 if the clock =
is
>> >> disabled.
>> >> The clk framework will try to cache the clock rate when it's requeste=
d
>> >> by a consumer. If the clock or consumer is not enabled at that point,
>> >> the cached value is 0, which is wrong.
>> >
>> > Hmm, it also seems wrong to me that the clock framework would cache a
>> > clock rate when it's disabled.  On platforms with clocks that may have
>> > shared management (eg. TISCI or other platforms using SCMI) it's
>> > entirely possible that when Linux has disabled a clock, some other
>> > entity may have changed it.
>> >
>> > Could another solution here be to have the clk framework only cache wh=
en
>> > clocks are enabled?
>>=20
>> So I looked into that. There are still about 34 clock operations that ar=
e
>> functionally uncached, but it does seem more logical than treating every=
thing as
>> uncached.
>>=20
>> Side note, why would someone even want to read the rate of an unprepared=
 clock?
>> I dumped some debug info for all the clocks tripping this new uncached p=
ath.
>> Seems weird that it's even happening this often. Even weirder that it's
>> apparently happening 3 times to cpu0's core clock on the board I'm curre=
ntly
>> testing.
>
> The short, unsatisfying, answer is that the API explicitly allowed it so =
far.
>
> It's also somewhat natural when you have a functional rate to set it up
> before enabling it and the logic driven by it so that you would avoid a
> rate change, or something like a cycle where you would enable, shut
> down, reparent, enable the clock again.
>
> In such a case, we would either need the cache, or to read the rate, to
> know if we have to change the clock rate in the first place.
>
> Maxime

Thanks Maxime. I'll take this as a hint to stop digging for the moment. Rig=
ht
now, treating unprepared clocks as untrusted / uncached makes sense and
shouldn't be too much of a performance issue.

- Randolph
