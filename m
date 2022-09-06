Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 391A45AE224
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 10:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41DAB10E5E0;
	Tue,  6 Sep 2022 08:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C255410E5E0
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 08:12:35 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1oVThB-00024J-JH; Tue, 06 Sep 2022 10:12:33 +0200
Message-ID: <d3522c37bbd789d4f2276e9acdb56a06985e0039.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] drm/etnaviv: fix power register offset on GC300
From: Lucas Stach <l.stach@pengutronix.de>
To: Doug Brown <doug@schmorgal.com>, Christian Gmeiner
 <christian.gmeiner@gmail.com>
Date: Tue, 06 Sep 2022 10:12:31 +0200
In-Reply-To: <6e97587f-e101-13cd-0d40-fa3dc4c625c9@schmorgal.com>
References: <20220903060558.55167-1-doug@schmorgal.com>
 <20220903060558.55167-3-doug@schmorgal.com>
 <CAH9NwWd1Q6iGUZoB7j3zAd-Pj_vq4WueguyfhKeWdWo6SPJ+PQ@mail.gmail.com>
 <6e97587f-e101-13cd-0d40-fa3dc4c625c9@schmorgal.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Am Montag, dem 05.09.2022 um 14:05 -0700 schrieb Doug Brown:
> Hi Christian,
> 
> On 9/3/2022 4:49 AM, Christian Gmeiner wrote:
> 
> > I had a quick look at what vivantes kernel driver did. It uses a per
> > gpu instance variable powerBaseAddress
> > that gets set accordingly. I am not sure if I really like the
> > gpu_fix_reg_address(..) idea, as it gets called on every
> > register read and write. For me I see two other possible solutions:
> > 
> > 1) Add two seperate helpers ala gpu_read_power() and gpu_write_power()
> > where we do the if beast.
> > 2) Add a power register offset variable to etnaviv_gpu and explicitly
> > use it on for reads and writes - like the Vivante driver does.
> > 
> > But that's just my personal opinion. Can't wait to hear what Lucas thinks.
> > 
> 
> Thanks for reviewing so fast! I honestly agree. It felt kind of dirty
> modifying gpu_write and gpu_read. The reason I went for it is I was
> thinking that in most cases the compiler is going to optimize the ugly
> "if" out.
> 
> The two solutions listed above both sound good. They would need a
> special case in etnaviv_core_dump_registers, but that's probably much
> less nasty than modifying gpu_read and gpu_write. Any preferences from
> everyone on which of the other two options I should do? The
> gpu_read_power and gpu_write_power approach sounds pretty clean to me.

Yes, please add a specialized wrapper for the power register accesses.

Regards,
Lucas

