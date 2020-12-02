Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C672CD0E8
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3383A6E0C1;
	Thu,  3 Dec 2020 08:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3D2CC6EA18
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Dec 2020 11:49:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3C03101E;
 Wed,  2 Dec 2020 03:49:11 -0800 (PST)
Received: from localhost (unknown [10.1.198.32])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64CC13F718;
 Wed,  2 Dec 2020 03:49:11 -0800 (PST)
Date: Wed, 2 Dec 2020 11:49:10 +0000
From: Ionela Voinescu <ionela.voinescu@arm.com>
To: Lukasz Luba <lukasz.luba@arm.com>
Subject: Re: [PATCH v2 3/5] thermal: devfreq_cooling: add new registration
 functions with Energy Model
Message-ID: <20201202114909.GA1198@arm.com>
References: <20201118120358.17150-1-lukasz.luba@arm.com>
 <20201118120358.17150-4-lukasz.luba@arm.com>
 <20201202102439.GA1639@arm.com>
 <ef641466-cf86-85aa-925a-3de9e1eed501@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef641466-cf86-85aa-925a-3de9e1eed501@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
Cc: amit.kucheria@verdurent.com, linux-pm@vger.kernel.org, airlied@linux.ie,
 daniel.lezcano@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com,
 alyssa.rosenzweig@collabora.com, rui.zhang@intel.com, orjan.eide@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wednesday 02 Dec 2020 at 11:14:02 (+0000), Lukasz Luba wrote:
> Hi Ionela,
> 
> On 12/2/20 10:24 AM, Ionela Voinescu wrote:
> > Hi Lukasz,
> > 
> > On Wednesday 18 Nov 2020 at 12:03:56 (+0000), Lukasz Luba wrote:
> 
> [snip]
> 
> > > +	struct device_node *np = NULL;
> 
> [snip]
> 
> > > +
> > > +	if (dev->of_node)
> > > +		np = of_node_get(dev->of_node);
> > > +
> > 
> > Should np be checked before use? I'm not sure if it's better to do the
> > assign first and then the check on np before use. It depends on the
> > consequences of passing a NULL node pointer later on.
> 
> The np is actually dev->of_node (or left NULL, as set at the begging).
> The only meaning of the line above is to increment the counter and then
> decrement if CONFIG_OF_DYNAMIC was used.
> The devfreq_cooling_register() has np = NULL and the registration can
> handle it, so we should be OK here as well.
> 

Yes, I just wanted to make sure later registration can handle np = NULL,
or whether we need to bail out.

In this case, you can drop both ifs - for (dev->of_node) before get and
for np before put below, as of_node_get/of_node_put can handle NULL
pointers themselves.

Thanks,
Ionela.

> > 
> > > +	cdev = of_devfreq_cooling_register_power(np, df, dfc_power);
> > > +
> > > +	if (np)
> > > +		of_node_put(np);
> > > +
> 
> [snip]
> 
> > > 
> > 
> > Otherwise it looks good to me:
> > 
> > Reviewed-by: Ionela Voinescu <ionela.voinescu@arm.com>
> 
> Thank you for the review.
> 
> Regards,
> Lukasz
> 
> > 
> > Ionela.
> > 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
