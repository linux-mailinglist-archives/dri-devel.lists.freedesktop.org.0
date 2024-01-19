Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0096C83297F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 13:30:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E9FB10E9E9;
	Fri, 19 Jan 2024 12:30:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BEC10EA0B
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:30:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi
 [89.27.53.110])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4A59512;
 Fri, 19 Jan 2024 13:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1705667320;
 bh=LNk3nH8fFJa5teGVSdqfmDXLmD5Kzly/lQCrOP+9xSA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TgVqGdpd0PjcqnI+5ZdE4TirX1GZMiqRURSHbIrnOvmb3U4wz7ivFGH4QLQ2YkyEU
 7E3qebfIF4ueQvoPe/kHQVatuRrQiKawtM1iaAojL04vEqV7QopT2rDh1ceYoFuH+S
 cPkyKziReuVVz0OaXT2w5JZk29VjmX/L02qkwcJ4=
Date: Fri, 19 Jan 2024 14:29:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Klymenko, Anatoliy" <Anatoliy.Klymenko@amd.com>
Subject: Re: [PATCH 3/4] drm: xlnx: zynqmp_dpsub: Don't generate vblank in
 live mode
Message-ID: <20240119122954.GA13388@pendragon.ideasonboard.com>
References: <mailman.1660.1705501214.2415.dri-devel@lists.freedesktop.org>
 <MW4PR12MB7165B7BEA23F4C4185A48EE9E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <MW4PR12MB7165B7BEA23F4C4185A48EE9E6702@MW4PR12MB7165.namprd12.prod.outlook.com>
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
Cc: "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "aarten.lankhorst@linux.intel.com" <aarten.lankhorst@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "Simek, Michal" <michal.simek@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Anatoliy,

On Fri, Jan 19, 2024 at 05:53:30AM +0000, Klymenko, Anatoliy wrote:
> On Wed, 17 Jan 2024 16:20:10 +0200, Tomi Valkeinen wrote:
> > On 13/01/2024 01:42, Anatoliy Klymenko wrote:
> > > Filter out status register against interrupts' mask.
> > > Some events are being reported via DP status register, even if
> > > corresponding interrupts have been disabled. Avoid processing of such
> > > events in interrupt handler context.
> > 
> > The subject talks about vblank and live mode, the the description doesn't. Can
> > you elaborate in the desc a bit about when this is an issue and why it wasn't
> > before?
> 
> Yes, I should make patch comment more consistent and elaborate. I will fix it in the next version. Thank you.
> 
> > 
> > > Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
> > > ---
> > >   drivers/gpu/drm/xlnx/zynqmp_dp.c | 11 +++++++++--
> > >   1 file changed, 9 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > index d60b7431603f..571c5dbc97e5 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
> > > @@ -1624,8 +1624,16 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
> > >       u32 status, mask;
> > >
> > >       status = zynqmp_dp_read(dp, ZYNQMP_DP_INT_STATUS);
> > > +     zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> > >       mask = zynqmp_dp_read(dp, ZYNQMP_DP_INT_MASK);
> > > -     if (!(status & ~mask))
> > > +
> > > +     /*
> > > +      * Status register may report some events, which corresponding interrupts
> > > +      * have been disabled. Filter out those events against interrupts' mask.
> > > +      */
> > > +     status &= ~mask;
> > > +
> > > +     if (!status)
> > >               return IRQ_NONE;
> > >
> > >       /* dbg for diagnostic, but not much that the driver can do */
> > > @@ -1634,7 +1642,6 @@ static irqreturn_t zynqmp_dp_irq_handler(int irq, void *data)
> > >       if (status & ZYNQMP_DP_INT_CHBUF_OVERFLW_MASK)
> > >               dev_dbg_ratelimited(dp->dev, "overflow interrupt\n");
> > >
> > > -     zynqmp_dp_write(dp, ZYNQMP_DP_INT_STATUS, status);
> > >
> > >       if (status & ZYNQMP_DP_INT_VBLANK_START)
> > >               zynqmp_dpsub_drm_handle_vblank(dp->dpsub);
> > 
> > Moving the zynqmp_dp_write() is not related to this fix, is it? I think it should be in
> > a separate patch.
> 
> The sole purpose of zynqmp_dp_write() is to clear status register. The
> sooner we do it the better (after reading status in the local variable
> of course).

No disagreement about that. Tomi's point is that it's a good change, but
it should be done in a separate patch, by itself, not bundled with other
changes. The usual rule in the kernel is "one change, one commit".

> We can also reuse status variable for in-place filtering
> against the interrupt mask, which makes this change dependent on
> zynqmp_dp_write() reordering. I will add a comment explaining this. Is
> it ok?

-- 
Regards,

Laurent Pinchart
