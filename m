Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63ABD1EF959
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jun 2020 15:35:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9986E8E8;
	Fri,  5 Jun 2020 13:35:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow2.mail.gandi.net (mslow2.mail.gandi.net [217.70.178.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A0626E8E8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:35:03 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow2.mail.gandi.net (Postfix) with ESMTP id C34DE3AA83B
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jun 2020 13:26:09 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it
 [93.34.118.233]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id E7135C0008;
 Fri,  5 Jun 2020 13:25:39 +0000 (UTC)
Date: Fri, 5 Jun 2020 15:29:00 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200605132900.on527xcggg6f6pil@uno.localdomain>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200527071555.GA23912@lxhi-065.adit-jv.com>
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
 dri-devel@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
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

Hello Eugeniu,
   sorry for the late reply

On Wed, May 27, 2020 at 09:15:55AM +0200, Eugeniu Rosca wrote:
> Hi Jacopo,
>
> On Tue, Oct 15, 2019 at 12:46:13PM +0200, Jacopo Mondi wrote:
>  ----8<---
>
> > * Testing
> > I have tested by injecting a color inversion LUT table and enabling/disabling it
> > every 50 displayed frames:
> > https://jmondi.org/cgit/kmsxx/log/?h=gamma_lut
>
> Could you kindly share the cross compilation steps for your kmsxx fork?
>

I usually build it on the target :)

> Just out of curiosity, have you ever tried to pull the display's HDMI
> cable while reading from CM2_LUT_TBL?

Ahem, not really :) Did I get you right, you mean disconnecting the
HDMI cable from the board ?

>
> At least with the out-of-tree CMM implementation [*], this sends the
> R-Car3 reference targets into an unrecoverable freeze, with no lockup
> reported by the kernel (i.e. looks like an serious HW issue).
>
> >
> > CMM functionalities are retained between suspend/resume cycles (tested with
> > suspend-to-idle) without requiring a re-programming of the LUT tables.
>
> Hmm. Is this backed up by any statement in the HW User's manual?
> This comes in contrast with the original Renesas CMM implementation [**]
> which does make use of suspend (where the freeze actually happens).
>
> Can we infer, based on your statement, that we could also get rid of
> the suspend callback in [**]?

As Geert (thanks) explained what I've tested with is suspend-to-idle,
which retains the state of the LUT tables (and I assume other
not-yet-implemented CMM features, like CLU). I recall the out-of-tree
driver has suspend/resume routines but I never really tested that.

Thanks
   j

>
> [*] https://github.com/renesas-rcar/du_cmm
> [**] https://github.com/renesas-rcar/du_cmm/blob/c393ed49834bdbc/meta-rcar-gen3/recipes-kernel/linux/linux-renesas/0001-drm-rcar-du-Add-DU-CMM-support.patch#L1912
>
> --
> Best regards,
> Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
