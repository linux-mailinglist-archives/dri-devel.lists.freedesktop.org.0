Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766D16EFCB2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 23:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3672610E344;
	Wed, 26 Apr 2023 21:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF41C10E344;
 Wed, 26 Apr 2023 21:59:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F07E762F19;
 Wed, 26 Apr 2023 21:59:12 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.51])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id C659DC4339B;
 Wed, 26 Apr 2023 21:59:10 +0000 (UTC)
Date: Wed, 26 Apr 2023 17:59:02 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [Intel-xe] [PATCH 01/14] drm/xe: Fix print of
 RING_EXECLIST_SQ_CONTENTS_HI
Message-ID: <ZEmepmUsgpXvW63X@rdvivi-mobl4>
References: <20230426205713.512695-1-rodrigo.vivi@intel.com>
 <20230426205713.512695-2-rodrigo.vivi@intel.com>
 <vc7t6mi62cd5hchta6zm2swt7o32tjt3cisgcpev7ct6niy7s6@4xkq6hqya2pw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vc7t6mi62cd5hchta6zm2swt7o32tjt3cisgcpev7ct6niy7s6@4xkq6hqya2pw>
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
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 26, 2023 at 02:40:18PM -0700, Lucas De Marchi wrote:
> On Wed, Apr 26, 2023 at 04:57:00PM -0400, Rodrigo Vivi wrote:
> > On xe_hw_engine_print_state we were printing:
> > value_of(0x510) + 4 instead of
> > value_of(0x514) as desired.
> > 
> > So, let's properly define a RING_EXECLIST_SQ_CONTENTS_HI
> > register to fix the issue and also to avoid other issues
> > like that.
> > 
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_engine_regs.h | 3 ++-
> > drivers/gpu/drm/xe/xe_execlist.c         | 4 ++--
> > drivers/gpu/drm/xe/xe_hw_engine.c        | 4 ++--
> > 3 files changed, 6 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > index 2aa67d001c34..a1e1d1c206fa 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
> > @@ -84,7 +84,8 @@
> > 						 RING_FORCE_TO_NONPRIV_DENY)
> > #define   RING_MAX_NONPRIV_SLOTS  12
> > 
> > -#define RING_EXECLIST_SQ_CONTENTS(base)		_MMIO((base) + 0x510)
> > +#define RING_EXECLIST_SQ_CONTENTS_LO(base)	_MMIO((base) + 0x510)
> > +#define RING_EXECLIST_SQ_CONTENTS_HI(base)	_MMIO((base) + 0x510 + 4)
> > 
> > #define RING_EXECLIST_CONTROL(base)		_MMIO((base) + 0x550)
> > #define	  EL_CTRL_LOAD				REG_BIT(0)
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> > index 02021457b1f0..37ac6473195e 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -84,9 +84,9 @@ static void __start_lrc(struct xe_hw_engine *hwe, struct xe_lrc *lrc,
> > 	xe_mmio_write32(gt, RING_MODE_GEN7(hwe->mmio_base).reg,
> > 			_MASKED_BIT_ENABLE(GEN11_GFX_DISABLE_LEGACY_MODE));
> > 
> > -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 0,
> > +	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_LO(hwe->mmio_base).reg,
> > 			lower_32_bits(lrc_desc));
> > -	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS(hwe->mmio_base).reg + 4,
> > +	xe_mmio_write32(gt, RING_EXECLIST_SQ_CONTENTS_HI(hwe->mmio_base).reg,
> > 			upper_32_bits(lrc_desc));
> > 	xe_mmio_write32(gt, RING_EXECLIST_CONTROL(hwe->mmio_base).reg,
> > 			EL_CTRL_LOAD);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index 4b56c35b988d..23b9f120c258 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -528,10 +528,10 @@ void xe_hw_engine_print_state(struct xe_hw_engine *hwe, struct drm_printer *p)
> > 		hw_engine_mmio_read32(hwe, RING_EXECLIST_STATUS_HI(0).reg));
> > 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_LO: 0x%08x\n",
> > 		hw_engine_mmio_read32(hwe,
> 
> after this series and mine about register refactor we should probably go
> and fix the coding style in this function.

indeed

> 
> ... thankfully it was just this print that was wrong and the rest was
> correct.
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thank you!
Since this was a small but needed fix I went already and merged this
patch individually already.

> 
> thanks
> Lucas De Marchi
> 
> > -					 RING_EXECLIST_SQ_CONTENTS(0).reg));
> > +					 RING_EXECLIST_SQ_CONTENTS_LO(0).reg));
> > 	drm_printf(p, "\tRING_EXECLIST_SQ_CONTENTS_HI: 0x%08x\n",
> > 		hw_engine_mmio_read32(hwe,
> > -					 RING_EXECLIST_SQ_CONTENTS(0).reg) + 4);
> > +					 RING_EXECLIST_SQ_CONTENTS_HI(0).reg));
> > 	drm_printf(p, "\tRING_EXECLIST_CONTROL: 0x%08x\n",
> > 		hw_engine_mmio_read32(hwe, RING_EXECLIST_CONTROL(0).reg));
> > 
> > -- 
> > 2.39.2
> > 
