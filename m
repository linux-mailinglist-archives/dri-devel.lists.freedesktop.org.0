Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E82B85A68
	for <lists+dri-devel@lfdr.de>; Thu, 18 Sep 2025 17:35:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBEB710E1F0;
	Thu, 18 Sep 2025 15:35:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=hugovil.com header.i=@hugovil.com header.b="vOB2VMKe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C823410E1F0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Sep 2025 15:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
 ; s=x;
 h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
 :Date:subject:date:message-id:reply-to;
 bh=ktV39ZW891V7Z77BCOOj+b74VuWUKu/l31kKWMEBxlg=; b=vOB2VMKees5K/QqAbrhyk+sYbE
 UMAhvmeFX7FnsTo2TrjTUStadkx9yxEVBhirMGT6AmNFS5cnHYNF5rp20RxqykorQpk0PJPY2l1Fi
 SBBLMrF72znIqFijKvC5fUPRhnhr+4mXaNEFbsIEbhDQFEwK218NqtuMCqHchuWdWy/c=;
Received: from [184.161.19.61] (port=56528 helo=pettiford)
 by mail.hugovil.com with esmtpa (Exim 4.92)
 (envelope-from <hugo@hugovil.com>)
 id 1uzGej-0002kk-CN; Thu, 18 Sep 2025 11:34:46 -0400
Date: Thu, 18 Sep 2025 11:34:44 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Biju Das
 <biju.das.jz@bp.renesas.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Hien Huynh <hien.huynh.px@renesas.com>,
 Nghia Vo <nghia.vo.zn@renesas.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Message-Id: <20250918113444.65155654f1e16416a492273f@hugovil.com>
In-Reply-To: <OS3PR01MB831915ED0F0E2452BEBC37098A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250912142056.2123725-1-chris.brandt@renesas.com>
 <20250912142056.2123725-3-chris.brandt@renesas.com>
 <20250917162832.02100f4bbe896c878eccca8e@hugovil.com>
 <OS3PR01MB831915ED0F0E2452BEBC37098A17A@OS3PR01MB8319.jpnprd01.prod.outlook.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on mail.hugovil.com
X-Spam-Level: 
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 * -2.8 NICE_REPLY_A Looks like a legit reply (A)
X-Spam-Status: No, score=-3.8 required=5.0 tests=ALL_TRUSTED,NICE_REPLY_A
 autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on
 target MIPI device
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
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

On Wed, 17 Sep 2025 21:45:55 +0000
Chris Brandt <Chris.Brandt@renesas.com> wrote:

> Hi Hugo,
> 
> Thank you for your review.
> 
> > > +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> > > +t) / dsi->lanes, 1);
> >
> > What is this "1" value meaning? This is hard to decipher.
> 
> That is true (unless you know to look in the other file)
> 
> > If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros should be added to the renesas.h header file and used here.
> 
> I was not clear how much I should be adding to that renesas.h file. But like you said, it would make the code
> easier to read.
> 
> I was also waiting to hear what Geert thought about adding a new API to the clock driver.

Hi Chris,
no problem.

Just to let you know, I tested your 2 patches on our custom board
and the panel is still working well.

Hugo.


> -----Original Message-----
> From: Hugo Villeneuve <hugo@hugovil.com> 
> Sent: Wednesday, September 17, 2025 4:29 PM
> To: Chris Brandt <Chris.Brandt@renesas.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Michael Turquette <mturquette@baylibre.com>; Stephen Boyd <sboyd@kernel.org>; Biju Das <biju.das.jz@bp.renesas.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Hien Huynh <hien.huynh.px@renesas.com>; Nghia Vo <nghia.vo.zn@renesas.com>; linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH v2 2/2] drm: renesas: rz-du: Set DSI divider based on target MIPI device
> 
> On Fri, 12 Sep 2025 10:20:56 -0400
> Chris Brandt <chris.brandt@renesas.com> wrote:
> 
> > Before the MIPI DSI clock source can be configured, the target divide 
> > ratio needs to be known.
> > 
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> > 
> > ---
> > v1->v2:
> > - Add spaces around '/' in comments
> > - Add target argument in new API
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 18 
> > ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c 
> > b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > index f87337c3cbb5..ca0de93d5a1a 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -7,6 +7,7 @@
> >  
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas.h>
> >  #include <linux/delay.h>
> >  #include <linux/dma-mapping.h>
> >  #include <linux/io.h>
> > @@ -732,6 +733,23 @@ static int rzg2l_mipi_dsi_host_attach(struct 
> > mipi_dsi_host *host,
> >  
> >  	drm_bridge_add(&dsi->bridge);
> >  
> > +	/*
> > +	 * Report required division ratio setting for the MIPI clock 
> > +dividers
> 
> Add missing dot at end of sentence.
> 
> > +	 * Assume the default clock source is FOUTPOSTDIV (PLL/2) being fed to the DSI-PHY, but also
> > +	 * the DSI-PHY must be 16x the MIPI-DSI HS clock.
> > +	 *
> > +	 * pllclk / 2 = vclk * DSI divider
> > +	 * pllclk = vclk * DSI divider * 2
> > +	 *
> > +	 * hsclk = (vclk * DSI divider * 2) / 16
> > +	 *
> > +	 * vclk * bpp = hsclk * 8 * num_lanes
> > +	 * vclk * bpp = ((vclk * DSI divider * 2) / 16) * 8 * num_lanes
> > +	 *   which simplifies to...
> > +	 * DSI divider = bpp / num_lanes
> > +	 */
> > +	
> > +rzg2l_cpg_dsi_div_set_divider(mipi_dsi_pixel_format_to_bpp(dsi->forma
> > +t) / dsi->lanes, 1);
> 
> What is this "1" value meaning? This is hard to decipher.
> 
> If it is related to PLL5_TARGET_DSI, then these PLL5_TARGET_* macros should be added to the renesas.h header file and used here.
> 
> > +
> >  	return 0;
> >  }
> >  
> > --
> > 2.50.1
> > 
> > 
> 
> 
> --
> Hugo Villeneuve
> 


-- 
Hugo Villeneuve
