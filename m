Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25A93E28D5
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 12:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08246E828;
	Fri,  6 Aug 2021 10:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3077F6E828
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Aug 2021 10:43:53 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 070B64FB;
 Fri,  6 Aug 2021 12:43:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628246631;
 bh=RKzilY57EhrbC4I4R8TbW1muRU/5HGcmZ+6oW6fCDL4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O73LL5TtntX68qiwrKwSSvdHEfSCRscRR2OLhZNXzRiTf6TXBcLyDFfZq8LyGvCHa
 xQWPpLiOR3qodAhCjMObzZ+75SDb4+9hmF06wEgJlEFycFJ/Z+k1AAFRYKHs/SwNRY
 6JkXU/Icmv0aMYIA689lpV0Lg+TsB+VKCtSnj7CY=
Date: Fri, 6 Aug 2021 13:43:37 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Michal Simek <monstr@monstr.eu>
Cc: Quanyang Wang <quanyang.wang@windriver.com>,
 Hyun Kwon <hyun.kwon@xilinx.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: Re: [V2][PATCH] drm: xlnx: zynqmp: release reset to DP controller
 before accessing DP registers
Message-ID: <YQ0SWXvWZ5THf+vM@pendragon.ideasonboard.com>
References: <20210323025501.1568039-1-quanyang.wang@windriver.com>
 <YFquZaW4JTTM7ogS@pendragon.ideasonboard.com>
 <CAHTX3d+uZsqevn0+7Lo+z62mk-1+S7n7VuO-QU8Q1Y-gP0Ugyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHTX3d+uZsqevn0+7Lo+z62mk-1+S7n7VuO-QU8Q1Y-gP0Ugyw@mail.gmail.com>
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

Hi Michale,

On Fri, Aug 06, 2021 at 12:37:07PM +0200, Michal Simek wrote:
> st 24. 3. 2021 v 4:15 odesílatel Laurent Pinchart napsal:
> > On Tue, Mar 23, 2021 at 10:55:01AM +0800, quanyang.wang@windriver.com wrote:
> > > From: Quanyang Wang <quanyang.wang@windriver.com>
> > >
> > > When insmod zynqmp-dpsub.ko after rmmod it, system will hang with the
> > > error log as below:
> > >
> > > root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> > > [   88.391289] [drm] Initialized zynqmp-dpsub 1.0.0 20130509 for fd4a0000.display on minor 0
> > > [   88.529906] Console: switching to colour frame buffer device 128x48
> > > [   88.549402] zynqmp-dpsub fd4a0000.display: [drm] fb0: zynqmp-dpsubdrm frame buffer device
> > > [   88.571624] zynqmp-dpsub fd4a0000.display: ZynqMP DisplayPort Subsystem driver probed
> > > root@xilinx-zynqmp:~# rmmod zynqmp_dpsub
> > > [   94.023404] Console: switching to colour dummy device 80x25
> > > root@xilinx-zynqmp:~# insmod zynqmp-dpsub.ko
> > >       <hang here>
> > >
> > > This is because that in zynqmp_dp_probe it tries to access some DP
> > > registers while the DP controller is still in the reset state. When
> > > running "rmmod zynqmp_dpsub", zynqmp_dp_reset(dp, true) in
> > > zynqmp_dp_phy_exit is called to force the DP controller into the reset
> > > state. Then insmod will call zynqmp_dp_probe to program the DP registers,
> > > but at this moment the DP controller hasn't been brought out of the reset
> > > state yet since the function zynqmp_dp_reset(dp, false) is called later and
> > > this will result the system hang.
> > >
> > > Releasing the reset to DP controller before any read/write operation to it
> > > will fix this issue. And for symmetry, move zynqmp_dp_reset() call from
> > > zynqmp_dp_phy_exit() to zynqmp_dp_remove().
> > >
> > > Signed-off-by: Quanyang Wang <quanyang.wang@windriver.com>
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Can someone pick this patch?

I have it in my tree with a set of other changes, I intend to send a
pull request today.

-- 
Regards,

Laurent Pinchart
