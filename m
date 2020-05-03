Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBCB01C3384
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 09:17:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A9C6E32B;
	Mon,  4 May 2020 07:17:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 607316E255
 for <dri-devel@lists.freedesktop.org>; Sun,  3 May 2020 15:01:49 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 5955480BF;
 Sun,  3 May 2020 15:02:34 +0000 (UTC)
Date: Sun, 3 May 2020 08:01:43 -0700
From: Tony Lindgren <tony@atomide.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 01/12] dt-bindings: add img,pvrsgx.yaml for
 Imagination GPUs
Message-ID: <20200503150143.GG37466@atomide.com>
References: <cover.1587760454.git.hns@goldelico.com>
 <3a451e360fed84bc40287678b4d6be13821cfbc0.1587760454.git.hns@goldelico.com>
 <NMCE9Q.LWG45P20NBVJ@crapouillou.net>
 <28138EC0-0FA5-4F97-B528-3442BF087C7A@goldelico.com>
 <TEAR9Q.6HI5DFRO5U0I3@crapouillou.net>
 <3D8B59D6-83E3-4FE6-9C99-E2E5616A8139@goldelico.com>
 <8EER9Q.C206SXNSICP7@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8EER9Q.C206SXNSICP7@crapouillou.net>
X-Mailman-Approved-At: Mon, 04 May 2020 07:17:19 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Airlie <airlied@linux.ie>,
 "H. Nikolaus Schaller" <hns@goldelico.com>,
 Jonathan Bakker <xc-racer2@live.ca>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, letux-kernel@openphoenux.org,
 Paul Burton <paulburton@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, James Hogan <jhogan@kernel.org>,
 devicetree@vger.kernel.org,
 =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Philipp Rossak <embed3d@gmail.com>, openpvrsgx-devgroup@letux.org,
 linux-kernel@vger.kernel.org, Ralf Baechle <ralf@linux-mips.org>,
 kernel@pyra-handheld.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Paul Cercueil <paul@crapouillou.net> [200503 14:19]:
> You have a new SoC with a SGX, and you only need to enable one clock to get
> it to work. So you create a devicetree node which receives only one clock.
> 
> Turns out, that the bootloader was enabling the other 3 clocks, and since
> the last release, it doesn't anymore. You're left with having to support a
> broken devicetree.
> 
> That's the kind of problem that can be easily avoided by enforcing the
> number of clocks that have to be provided.

The number of clocks depends on how it's wired for the SoC.

On omaps, there's are no controls for additinoal SGX clocks. Sure some
of the clocks may be routed to multple places internally by the wrapper
module. But we have no control over that.

If we wanted to specify just the "fck" clock on omaps, then we can
do it with something like this:

allOf:
  - if:
    properites:
      compatible:
        enum:
	  - "ti,omap4-sgx544-112"
	  - "ti,omap5-sgx544-116"
	  - "ti,dra7-sgx544-116"
    then:
      properties:
        clocks:
	  minItems: 1
	  maxItems: 1

        clock-names:
	  const: fck

    required:
      - clocks
      - clock-names

There's no need for the SGX driver to toggle the "fck" here, it's
all done by PM runtime alreaedy so we would be just tweaking
the usage count for it. But hey, showing the clock rate might
be nice. Or maybe we want to at some point scale it, so no problem
specifying it.

For omap3, we should then specify "fck" and "ick". On omap4 and
later, there's no separate control over the "ick".

Then for the other SoCs, you can specify whatever clocks you need
there.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
