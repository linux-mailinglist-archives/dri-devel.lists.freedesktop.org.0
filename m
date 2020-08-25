Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB546251482
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 10:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3656E88F;
	Tue, 25 Aug 2020 08:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [85.220.165.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306546E88F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Aug 2020 08:44:13 +0000 (UTC)
Received: from [2001:67c:670:201:5054:ff:fe8d:eefb] (helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1kAUYp-0003Hn-EZ; Tue, 25 Aug 2020 10:44:07 +0200
Message-ID: <4137268a3f49e6bbcdc7da1bdbd10d768632ed17.camel@pengutronix.de>
Subject: Re: [PATCH] drm/etnaviv: always start/stop scheduler in timeout
 processing
From: Lucas Stach <l.stach@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Date: Tue, 25 Aug 2020 10:44:05 +0200
In-Reply-To: <CAOMZO5DM+1CyHMhT1fq88b79Jz7FKvFLyJBG1Rz4GHZJbk6ytA@mail.gmail.com>
References: <20200824110248.5998-1-l.stach@pengutronix.de>
 <CAOMZO5DM+1CyHMhT1fq88b79Jz7FKvFLyJBG1Rz4GHZJbk6ytA@mail.gmail.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 patchwork-lst@pengutronix.de, Sascha Hauer <kernel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Am Montag, den 24.08.2020, 11:11 -0300 schrieb Fabio Estevam:
> Hi Lucas,
> 
> On Mon, Aug 24, 2020 at 8:02 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > The drm scheduler currently expects that the stop/start sequence is always
> > executed in the timeout handling, as the job at the head of the hardware
> > execution list is always removed from the ring mirror before the driver
> > function is called and only inserted back into the list when starting the
> > scheduler.
> > 
> > This adds some unnecessary overhead if the timeout handler determines
> > that the GPU is still executing jobs normally and just wished to extend
> > the timeout, but a better solution requires a major rearchitecture of the
> > scheduler, which is not applicable as a fix.
> > 
> > Fixes: 135517d3565b drm/scheduler: Avoid accessing freed bad job.)
> 
> Just a nit: the correct syntax for the Fixes line is:
> 
> Fixes: 135517d3565b ("drm/scheduler: Avoid accessing freed bad job.")

I've added this patch with the above fixed and Russell's T-b to my
etnaviv/fixes branch.

Regards,
Lucas

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
