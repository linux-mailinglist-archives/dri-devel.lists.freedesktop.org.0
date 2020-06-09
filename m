Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF7A1F4F27
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jun 2020 09:36:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819736E3BB;
	Wed, 10 Jun 2020 07:36:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.de.adit-jv.com (smtp1.de.adit-jv.com [93.241.18.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA93389262
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 14:30:14 +0000 (UTC)
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
 by smtp1.de.adit-jv.com (Postfix) with ESMTP id 737B73C0579;
 Tue,  9 Jun 2020 16:30:09 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
 by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KG_Oi9lxvAa8; Tue,  9 Jun 2020 16:30:04 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 6D0653C00BB;
 Tue,  9 Jun 2020 16:30:04 +0200 (CEST)
Received: from lxhi-065.adit-jv.com (10.72.94.5) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 9 Jun 2020
 16:30:03 +0200
Date: Tue, 9 Jun 2020 16:29:59 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v5 0/8] drm: rcar-du: Add Color Management Module (CMM)
Message-ID: <20200609142959.GA621@lxhi-065.adit-jv.com>
References: <20191015104621.62514-1-jacopo+renesas@jmondi.org>
 <20200527071555.GA23912@lxhi-065.adit-jv.com>
 <20200605132900.on527xcggg6f6pil@uno.localdomain>
 <20200605134124.GA28734@lxhi-065.adit-jv.com>
 <20200605135315.xlph44pl7kvmt23a@uno.localdomain>
 <20200607024158.GD7339@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200607024158.GD7339@pendragon.ideasonboard.com>
X-Originating-IP: [10.72.94.5]
X-Mailman-Approved-At: Wed, 10 Jun 2020 07:35:32 +0000
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
 dri-devel@lists.freedesktop.org, Eugeniu Rosca <erosca@de.adit-jv.com>,
 Eugeniu Rosca <roscaeugeniu@gmail.com>,
 kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
 Jacopo Mondi <jacopo@jmondi.org>, gotthard.voellmeke@renesas.com,
 koji.matsuoka.xm@renesas.com, horms@verge.net.au, seanpaul@chromium.org,
 michael.dege@renesas.com, Harsha.ManjulaMallikarjun@in.bosch.com,
 ezequiel@collabora.com, efriedrich@de.adit-jv.com,
 ChaitanyaKumar.Borah@in.bosch.com, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, uli+renesas@fpond.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sun, Jun 07, 2020 at 05:41:58AM +0300, Laurent Pinchart wrote:
> Note that the CMM driver is controlled by the DU driver. As the DU
> driver will reenable the display during resume, it will call
> rcar_du_cmm_setup() at resume time, which will reprogram the CMM. There
> should thus be no need for manual suspend/resume handling in the CMM as
> far as I can tell, but we need to ensure that the CMM is suspended
> before and resumed after the DU. I believe this could be implemented
> using device links.

Based on below quote [*] from Jacopo's commit [**], isn't the device
link relationship already in place?

[*] Quote from commit [**]
   Enforce the probe and suspend/resume ordering of DU and CMM by
   creating a stateless device link between the two.

[**] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8de707aeb45241
    ("drm: rcar-du: kms: Initialize CMM instances")

-- 
Best regards,
Eugeniu Rosca
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
