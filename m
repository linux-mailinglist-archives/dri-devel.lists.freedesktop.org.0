Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F871554AD8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 15:23:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA7110FAC6;
	Wed, 22 Jun 2022 13:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96E10FD30
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 13:22:57 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=[IPv6:::1])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1o40Jq-0005KL-Ta; Wed, 22 Jun 2022 15:22:54 +0200
Message-ID: <e7f68d8dedd1f6783f28c2cdb90622be322c0da4.camel@pengutronix.de>
Subject: Re: [PATCH v2 1/1] drm/panfrost: Add support for devcoredump
From: Lucas Stach <l.stach@pengutronix.de>
To: Adri??n Larumbe <adrian.larumbe@collabora.com>, Alyssa Rosenzweig
 <alyssa@collabora.com>
Date: Wed, 22 Jun 2022 15:22:54 +0200
In-Reply-To: <20220622015455.pqiiqevouh7udj7y@sobremesa>
References: <20220621023204.94179-1-adrian.larumbe@collabora.com>
 <20220621023204.94179-2-adrian.larumbe@collabora.com>
 <YrHBs+u9gAbOAAxT@maud> <20220622015455.pqiiqevouh7udj7y@sobremesa>
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
Cc: tomeu.vizoso@collabora.com, alyssa.rosenzweig@collabora.com,
 dri-devel@lists.freedesktop.org, steven.price@arm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, dem 22.06.2022 um 02:54 +0100 schrieb Adri??n Larumbe:
> Hi Alyssa, thanks for the feedback.
> 
> If I don't answer directly to any of your concerns in this message, it's because
> I applied your suggestions in v3 of the patch straight away.
> 
> On 21.06.2022 09:03, Alyssa Rosenzweig wrote:
> > Hi Adrian,
> > 
> > Great work on the devcoredump support! This is really cool to see coming
> > along, thank you! I've left a few notes below:
> > 
> > > +		if (panfrost_dump_registers[i] >= JS_HEAD_LO(0) &&
> > > +		    panfrost_dump_registers[i] <= JS_CONFIG_NEXT(0))
> > > +			js_as_offset = slot * 0x80;
> > > +		else if (panfrost_dump_registers[i] >= AS_TRANSTAB_LO(0) &&
> > > +			 panfrost_dump_registers[i] <= AS_STATUS(0))
> > > +			js_as_offset = ((as_nr) << 6);
> > 
> > I'm not a fan of the magic numbers. Do you think it makes sense to add
> > 
> > 	#define JS_SLOT_STRIDE 0x80
> > 	#define MMU_AS_SHIFT 0x6
> > 
> > in the appropriate places in panfrost_regs.h, reexpress the existing
> > #defines in terms of those
> > 
> > 	#define JS_HEAD_LO(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x00)
> > 	...
> > 	#define JS_FLUSH_ID_NEXT(n) (JS_BASE + ((n) * JS_SLOT_STRIDE) + 0x70)
> > 	...
> > 	#define MM_AS(as) (0x2400 + ((as) << MMU_AS_SHIFT)
> > 
> > and then use those here?
> > 
> > Also, drop the parans around (as_nr), this isn't a macro.
> > 
> > > +	/* Add in the active buffer objects */
> > > +	for (i = 0; i < job->bo_count; i++) {
> > > +		dbo = job->bos[i];
> > > +		file_size += dbo->size;
> > > +		n_bomap_pages += dbo->size >> PAGE_SHIFT;
> > > +		n_obj++;
> > > +	}
> > 
> > Strictly, I don't think this is right -- what happens if the CPU is
> > configured to use 16K or 64K pages? -- however, that mistake is pretty
> > well entrenched in panfrost.ko right now and it doesn't seem to bother
> > anyone (non-4K pages on arm64 are pretty rare outside of fruit
> > computers).
> > 
> > That said, out-of-context there looks like an alignment question. Could
> > we add an assert for that, documenting the invariant:
> > 
> > 	WARN_ON(!IS_ALIGNED(dbo->size, PAGE_SIZE));
> > 
> > > +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> > > +			__GFP_NORETRY);
> > > +	if (!iter.start) {
> > > +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> > > +		return;
> > > +	}
> > > ...
> > > +	memset(iter.hdr, 0, iter.data - iter.start);
> > 
> > Why are we using __GFP_NOWARN and __GFP_NORETRY? Why not plain vmalloc?
> > 
> > Also, why vmalloc instead of vzalloc? (Or adding __GFP_ZERO to the list
> > of __vmalloc flags if __GFP_NOWARN/__GFP_NORETRY are really needed?) Are
> > there relevant performance or security considerations?
> 
> I borrowed this code from Etnaviv a while ago and the same doubt struck me
> then. My understanding of its intended behaviour is that because the dump file
> might be huge, we don't want the memory manager to trigger the OOM killer and
> annoy quite a few running processes because of a debug feature. Also since the
> code already handles the situation when an allocation fails by refusing to
> generate a dump, there's no need for the allocator to generate specific error
> messages.

Yes, that's exactly the reasoning behind those flags. Without the
__GFP_NORETRY the devcoredump might not only trigger reclaim, but also
the OOM killer. People might see it as suboptimal user experience when
their favorite app gets killed just to make space for a devcoredump,
which they might not even be interested in. As the code is dealing
properly with allocation failure, we also don't want to print a warning
in the kernel log.

Regards,
Lucas

