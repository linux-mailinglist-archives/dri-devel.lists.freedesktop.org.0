Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E394272D5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 23:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283B76E1BD;
	Fri,  8 Oct 2021 21:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 33561 seconds by postgrey-1.36 at gabe;
 Fri, 08 Oct 2021 21:06:34 UTC
Received: from 7.mo561.mail-out.ovh.net (7.mo561.mail-out.ovh.net
 [46.105.57.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643656E1BD
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 21:06:34 +0000 (UTC)
Received: from player693.ha.ovh.net (unknown [10.108.16.60])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 6F74A28887
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Oct 2021 20:46:35 +0000 (UTC)
Received: from etezian.org (unknown [31.22.59.2])
 (Authenticated sender: andi@etezian.org)
 by player693.ha.ovh.net (Postfix) with ESMTPSA id 5F3E822FDEEE8;
 Fri,  8 Oct 2021 20:46:25 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001159410ab-ac47-493b-bfac-d2758c534f7e,
 8790DCEDFF6AD8C831A06EBEA49B55E03DAFB6BE) smtp.auth=andi@etezian.org
X-OVh-ClientIp: 31.22.59.2
Date: Fri, 8 Oct 2021 22:46:25 +0200
From: Andi Shyti <andi@etezian.org>
To: Ville =?iso-8859-15?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Andi Shyti <andi@etezian.org>, Intel GFX <intel-gfx@lists.freedesktop.org>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@intel.com>
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915/gt: move remaining debugfs
 interfaces into gt
Message-ID: <YWCuIb1wZU6+e57D@jack.zhora.eu>
References: <20211008112733.3600-1-andi@etezian.org>
 <YWB0+Bls9kvUUk9z@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWB0+Bls9kvUUk9z@intel.com>
X-Ovh-Tracer-Id: 12550124786722671168
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvtddrvddttddgudehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehnughiucfuhhihthhiuceorghnughisegvthgviihirghnrdhorhhgqeenucggtffrrghtthgvrhhnpedtgfduudfhfeeuueejfeeihedtfeetgfegveehgfeuleelhfduteegieekudeifeenucfkpheptddrtddrtddrtddpfedurddvvddrheelrddvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelfedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegrnhguihesvghtvgiiihgrnhdrohhrghdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
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

Hi Ville,

> > +	if (IS_CHERRYVIEW(i915)) {
> > +		seq_printf(m, "Master Interrupt Control:\t%08x\n",
> > +			   intel_uncore_read(uncore, GEN8_MASTER_IRQ));
> > +
> > +		for (i = 0; i < 4; i++) {
> > +			seq_printf(m, "GT Interrupt IMR %d:\t%08x\n",
> > +				   i, intel_uncore_read(uncore,
> > +							GEN8_GT_IMR(i)));
> > +			seq_printf(m, "GT Interrupt IIR %d:\t%08x\n",
> > +				   i, intel_uncore_read(uncore,
> > +							GEN8_GT_IIR(i)));
> > +			seq_printf(m, "GT Interrupt IER %d:\t%08x\n",
> > +				   i, intel_uncore_read(uncore,
> > +							GEN8_GT_IER(i)));
> > +		}
> > +
> 
> Why does chv get its own block? Looks identical to the bdw block.

[...]

> > +	} else if (!HAS_PCH_SPLIT(i915)) {
> 
> HAS_PCH_SPLIT in gt code looks a bit out of place.
> 
> > +		seq_printf(m, "Interrupt enable:    %08x\n",
> > +			   intel_uncore_read(uncore, GEN2_IER));
> > +		seq_printf(m, "Interrupt identity:  %08x\n",
> > +			   intel_uncore_read(uncore, GEN2_IIR));
> > +		seq_printf(m, "Interrupt mask:      %08x\n",
> > +			   intel_uncore_read(uncore, GEN2_IMR));
> 
> Technically on gen2 these are 16 bits, on gen3+ 32 bits. I don't
> quite remember now what happens when you read them as 32bit on gen2.
> Might be the msbs just come out all zeroes.
> 
> > +	} else {
> > +		seq_printf(m, "Graphics Interrupt enable:		%08x\n",
> > +			   intel_uncore_read(uncore, GTIER));
> > +		seq_printf(m, "Graphics Interrupt identity:		%08x\n",
> > +			   intel_uncore_read(uncore, GTIIR));
> > +		seq_printf(m, "Graphics Interrupt mask:		%08x\n",
> > +			   intel_uncore_read(uncore, GTIMR));
> 
> Probably this should be before the previous block to keep things in
> order. Also missing GEN6_PM stuff for snb+, and the master interrupt
> stuff for ilk+.

[...]

thanks for your input. Actually I'm not even sure this part of
the patch is required anymore. It was originally a copy paste of
the parts of the 'i915_interrupt_info' functions in the
'i915_gem_interrupt' debugfs file.

This file was removed here by Chris:

	cf977e18610e6 ("drm/i915/gem: Spring clean debugfs")

I have reproposed it in this patch seeking for comments because I
wanted to understand after all this time it might be needed or
not. If not I was going to remove it in my last version.

I haven't received any comments and therefore I am going to
remove it in v4.

Thank you,
Andi
