Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A9B8CC459
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 17:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5EE10E33E;
	Wed, 22 May 2024 15:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uLwquy6H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BFE10E33E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:46:22 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D0ADFC67;
 Wed, 22 May 2024 17:46:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716392769;
 bh=m5IRUcHKz6e88TJmUQOvC2AcC0A8I/DAAbwMO2bG0QE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uLwquy6HMmuiD24COtyH6xSjv/kXtcgWiBMQBEv+U7HSfTSW1VYqGfrEaKEq8qbzQ
 BpJnOb+XzfoXL3IXqwq2OFJKqdM3gt9BAtiBsTw3SDBqpqcMmWnrs0YdXqzjmLznj9
 RN7mA8sJdeNGC2oVNTSnwxnXhJtWJT3I3CfcM6J4=
Date: Wed, 22 May 2024 18:46:12 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, michal.simek@amd.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: Re: [PATCH] drm: xlnx: zynqmp_disp: Fix WARN_ON build warning
Message-ID: <20240522154612.GB15832@pendragon.ideasonboard.com>
References: <20240521142814.32145-2-palmer@rivosinc.com>
 <20240522144401.GA9789@pendragon.ideasonboard.com>
 <20240522154528.GA15832@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240522154528.GA15832@pendragon.ideasonboard.com>
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

On Wed, May 22, 2024 at 06:45:29PM +0300, Laurent Pinchart wrote:
> On Wed, May 22, 2024 at 05:44:02PM +0300, Laurent Pinchart wrote:
> > Hi Palmer,
> > 
> > (CC'ing Anatoliy)
> > 
> > Thank you for the patch.
> > 
> > On Tue, May 21, 2024 at 07:28:15AM -0700, Palmer Dabbelt wrote:
> > > From: Palmer Dabbelt <palmer@rivosinc.com>
> > > 
> > > Without this I get warnings along the lines of
> > > 
> > >     drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: error: logical not is only applied to the left hand side of this comparison [-Werror,-Wlogical-not-parentheses]
> > >       949 |         if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
> > >           |                     ^            ~~
> > >     arch/s390/include/asm/bug.h:54:25: note: expanded from macro 'WARN_ON'
> > >        54 |         int __ret_warn_on = !!(x);                      \
> > >           |                                ^
> > >     drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses after the '!' to evaluate the comparison first
> > >     drivers/gpu/drm/xlnx/zynqmp_disp.c:949:14: note: add parentheses around left hand side expression to silence this warning
> > > 
> > > which get promoted to errors in my test builds.  Adding the suggested
> > > parens elides those warnings.
> > 
> > I think this should have
> > 
> > Fixes: b0f0469ab662 ("drm: xlnx: zynqmp_dpsub: Anounce supported input formats")
> > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Closes: https://lore.kernel.org/oe-kbuild-all/202405080553.tfH9EmS8-lkp@intel.com/
> > > Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> > > ---
> > > I couldn't find a patch for this in Linus' tree or on the lists, sorry
> > > if someone's already fixed it.  No rush on my end, I'll just stash this
> > > in a local branch for the tester.
> > > ---
> > >  drivers/gpu/drm/xlnx/zynqmp_disp.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > index 13157da0089e..d37b4a9c99ea 100644
> > > --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> > > @@ -981,7 +981,7 @@ u32 *zynqmp_disp_layer_drm_formats(struct zynqmp_disp_layer *layer,
> > >  	unsigned int i;
> > >  	u32 *formats;
> > >  
> > > -	if (WARN_ON(!layer->mode == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
> > > +	if (WARN_ON((!layer->mode) == ZYNQMP_DPSUB_LAYER_NONLIVE)) {
> > 
> > That doesn't seem right. layer->mode isn't a boolean, it's an enum. The
> > right fix seems to be
> > 
> > 	if (WARN_ON(layer->mode != ZYNQMP_DPSUB_LAYER_NONLIVE)) {
> > 
> > Anatoliy, could you check this ? Palmer, do you plan to submit a new
> > version of the patch, or should I send the right fix separately ?
> 
> I see a fix is already present in the drm-misc-fixes branch. Please
> ignore my previous e-mail.

I meant drm-misc-next-fixes.

> > >  		*num_formats = 0;
> > >  		return NULL;
> > >  	}

-- 
Regards,

Laurent Pinchart
