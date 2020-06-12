Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336E91F7A58
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 17:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71AEB6E989;
	Fri, 12 Jun 2020 15:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ED156E984
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 15:08:56 +0000 (UTC)
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C68123B7002
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 14:57:39 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id 9DDD9100009;
 Fri, 12 Jun 2020 14:57:08 +0000 (UTC)
Date: Fri, 12 Jun 2020 17:00:32 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200612150032.pnqaqip54qfrbqst@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
 <20200609142959.GA621@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200609142959.GA621@lxhi-065.adit-jv.com>
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, mrodin@de.adit-jv.com,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 gotthard.voellmeke@renesas.com, koji.matsuoka.xm@renesas.com,
 horms@verge.net.au, seanpaul@chromium.org, michael.dege@renesas.com,
 Harsha.ManjulaMallikarjun@in.bosch.com, ezequiel@collabora.com,
 efriedrich@de.adit-jv.com, ChaitanyaKumar.Borah@in.bosch.com,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, uli+renesas@fpond.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Eugeniu,

On Tue, Jun 09, 2020 at 04:29:59PM +0200, Eugeniu Rosca wrote:
> Hi Laurent,
>
> On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> > Note that the CMM driver is controlled by the DU driver. As the DU
> > driver will reenable the display during resume, it will call
> > rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> > should thus be no need for manual suspend/resume handling in the CMM as
> > far as I can tell, but we need to ensure that the CMM is suspended
> > before and resumed after the DU. I believe this could be implemented
> > using device links.
>
> Based on below quote [*] from Jacopo's commit [**], isn't the device
> link relationship already in place?

Yes, it's in place already.

I added pm_ops to cmm just to be able to printout when suspend/resume
happens and the sequence is what comment [*] reports

[  222.909002] rcar_du_pm_suspend:505
[  223.145497] rcar_cmm_pm_suspend:193

[  223.208053] rcar_cmm_pm_resume:200
[  223.460094] rcar_du_pm_resume:513

However, Laurent mentioned that in his comment here that he expects
the opposite sequence to happen (CMM to suspend before and resume after
DU).

I still think what is implemented is correct:
- CMM is suspended after DU: when CMM is suspended, DU is not feeding
  it with data
- CMM is resumed before: once DU restart operations CMM is ready to
  receive data.

Laurent, what do you think ?

Thanks
  j

>
> [*] Quote from commit [**]
>    Enforce the probe and suspend/resume ordering of DU and CMM by
>    creating a stateless device link between the two.
>
> [**] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8de707aeb45241
>     ("drm: rcar-du: kms: Initialize CMM instances")
>
> --
> Best regards,
> Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
