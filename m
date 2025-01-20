Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D377EA17472
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 23:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CC610E49D;
	Mon, 20 Jan 2025 22:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CjPELwAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B2C310E49B;
 Mon, 20 Jan 2025 22:00:20 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BAF6B594;
 Mon, 20 Jan 2025 22:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1737410357;
 bh=4XrqcEbW71Czb8WPSWBZWhYHXYSDv7Iu7hlgRwLE5ck=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CjPELwAyFsImYHaH+oaMo3+NqQtIPN0ItlaBERMmhbs2huZ+Ps7PmJeojaGbVyLIf
 4f7rY1TKa+xSBv6VX9j7dbBaJPx6y0kY81GlHG+6GBbr3bpHXOmf7g7FP/OwhqNjv3
 dOCLJGoL7lj6MExCd8qi6/35kPcefbrZeSqpdEZE=
Date: Tue, 21 Jan 2025 00:00:11 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: James Jones <jajones@nvidia.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>,
 Daniel Stone <daniel@fooishbar.org>, Brian Starkey <brian.starkey@arm.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>,
 ML Mesa-dev <mesa-dev@lists.freedesktop.org>, nd@arm.com
Subject: Re: [PATCH] drm/fourcc: add LINEAR modifiers with an exact pitch
 alignment
Message-ID: <20250120220011.GJ9249@pendragon.ideasonboard.com>
References: <CAAxE2A5BkF13bFt8_UnuiqPM8W-ZESgmKEjqqGfv=DGzSfJ7aQ@mail.gmail.com>
 <uffsfaps6a75zmkyshkwfxgybcslqrnfqqtjzekegdptvwpugc@2ndpcuxyfp3f>
 <c64cb9d8-5ea7-4644-93c8-04a97b758fa0@mailbox.org>
 <h26quuebhpxwkc3fl4vtfteoqyvingnddgxbnzptfnxfg6xgkd@kkkmeqwplomv>
 <8dae97c9-9286-451a-8122-b309eb21b2f4@mailbox.org>
 <Z2Ki-lQH4Fbch6RO@phenom.ffwll.local>
 <q45c43j5kwwvemec7mcs4kqzt54pa3nz3jlhkcky2v63s2vfie@him4q253uw4p>
 <CAPj87rMFJ0JRvsKqZUsw_EGrFWr1VLO4Ne2w_bZ5cH+gs_d=og@mail.gmail.com>
 <Z2Rf7mpSuzZ0ObmT@phenom.ffwll.local>
 <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <07d08a42-c44a-477e-8057-721b270310cf@nvidia.com>
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

On Fri, Jan 10, 2025 at 01:23:40PM -0800, James Jones wrote:
> On 12/19/24 10:03, Simona Vetter wrote:
> > On Thu, Dec 19, 2024 at 09:02:27AM +0000, Daniel Stone wrote:
> >> On Wed, 18 Dec 2024 at 10:32, Brian Starkey <brian.starkey@arm.com> wrote:
> >>> On Wed, Dec 18, 2024 at 11:24:58AM +0000, Simona Vetter wrote:
> >>>> For that reason I think linear modifiers with explicit pitch/size
> >>>> alignment constraints is a sound concept and fits into how modifiers work
> >>>> overall.
> >>>
> >>> Could we make it (more) clear that pitch alignment is a "special"
> >>> constraint (in that it's really a description of the buffer layout),
> >>> and that constraints in-general shouldn't be exposed via modifiers?
> >>
> >> It's still worryingly common to see requirements for contiguous
> >> allocation, if for no other reason than we'll all be stuck with
> >> Freescale/NXP i.MX6 for a long time to come. Would that be in scope
> >> for expressing constraints via modifiers as well, and if so, should we
> >> be trying to use feature bits to express this?
> >>
> >> How this would be used in practice is also way too underdocumented. We
> >> need to document that exact-round-up 64b is more restrictive than
> >> any-multiple-of 64b is more restrictive than 'classic' linear. We need
> >> to document what people should advertise - if we were starting from
> >> scratch, the clear answer would be that anything which doesn't care
> >> should advertise all three, anything advertising any-multiple-of
> >> should also advertise exact-round-up, etc.
> >>
> >> But we're not starting from scratch, and since linear is 'special',
> >> userspace already has explicit knowledge of it. So AMD is going to
> >> have to advertise LINEAR forever, because media frameworks know about
> >> DRM_FORMAT_MOD_LINEAR and pass that around explicitly when they know
> >> that the buffer is linear. That and not breaking older userspace
> >> running in containers or as part of a bisect or whatever.
> >>
> >> There's also the question of what e.g. gbm_bo_get_modifier() should
> >> return. Again, if we were starting from scratch, most restrictive
> >> would make sense. But we're not, so I think it has to return LINEAR
> >> for maximum compatibility (because modifiers can't be morphed into
> >> other ones for fun), which further cements that we're not removing
> >> LINEAR.
> >>
> >> And how should allocators determine what to go for? Given that, I
> >> think the only sensible semantics are, when only LINEAR has been
> >> passed, to pick the most restrictive set possible; when LINEAR
> >> variants have been passed as well as LINEAR, to act as if LINEAR were
> >> not passed at all.
> > 
> > Yeah I think this makes sense, and we'd need to add that to the kerneldoc
> > about how drivers/apps/frameworks need to work with variants of LINEAR.
> > 
> > Just deprecating LINEAR does indeed not work. The same way it was really
> > hard slow crawl (and we're still not there everywhere, if you include
> > stuff like bare metal Xorg) trying to retire the implied modifier. Maybe,
> > in an extremely bright future were all relevant drivers advertise a full
> > set of LINEAR variants, and all frameworks understand them, we'll get
> > there. But if AMD is the one special case that really needs this I don't
> > think it's realistic to plan for that, and what Daniel describe above
> > looks like the future we're stuck to.
> > -Sima
> 
> I spent some time thinking about this over the break, because on a venn 
> diagram it does overlap a sliver of the work we've done to define the 
> differences between the concepts of constraints Vs. capabilities in the 
> smorgasbord of unified memory allocator talks/workshops/prototypes/etc. 
> over the years. I'm not that worried about some overlap being 
> introduced, because every reasonable rule deserves an exception here and 
> there, but I have concerns similar to Daniel's and Brian's.
> 
> Once you start adding more than one special modifier, some things in the 
> existing usage start to break down. Right now you can naively pass 
> around modifiers, then somewhere either before or just after allocation 
> depending on your usage, check if LINEAR is available and take your 
> special "I can parse this thing" path, for whatever that means in your 
> special use case. Modifying all those paths to include one variant of 
> linear is probably OK-but-not-great. Modifying all those paths to 
> include <N> variants of linear is probably unrealistic, and I do worry 
> about slippery slopes here.
> 
> ---
> 
> What got me more interested though was this led to another thought. At 
> first I didn't notice that this was an exact-match constraint and 
> thought it meant the usual alignment constraint of >=, and I was 
> concerned about how future variants would interact poorly. It could 
> still be a concern if things progress down this route, and we have 
> vendor A requiring >= 32B alignment and vendor B requiring == 64B 
> alignment. They're compatible, but modifiers expressing this would 
> naively cancel each-other out unless vendor A proactively advertised == 
> 64B linear modifiers too. This isn't a huge deal at that scale, but it 
> could get worse, and it got me thinking about a way to solve the problem 
> of a less naive way to merge modifier lists.
> 
> As a background, the two hard problems left with implementing a 
> constraint system to sit alongside the format modifier system are:
> 
> 1) A way to name special heaps (E.g., local vidmem on device A) in the 
> constraints in a way that spans process boundaries using some sort of 
> identifier. There are various ways to solve this. Lately the thinking is 
> something around dma heaps, but no one's fleshed it out yet that I'm aware.
> 
> 2) A transport that doesn't require us to revise every userspace API, 
> kernel API, and protocol that got revised to support DRM format 
> modifiers, and every API/protocol introduced since.
> 
> I haven't seen any great ideas for the latter problem yet, but what if 
> we did this:
> 
> - Introduced a new DRM format modifier vendor that was actually 
> vendor-agnostic, but implied the format modifier was a constraint 
> definition fragment instead of an actual modifier.
> 
> - Constraint-aware code could tack on its constraints (The ones it 
> requires and/or the ones it can support allocating) as a series of 
> additional modifiers using this vendor code. A given constraint might be 
> fragmented into multiple modifiers, but their definition and 
> serialization/deserialization mechanism could be defined in drm_fourcc.h 
> as macros all the clients could use.
> 
> - Existing non-constraint-aware code in a modifier usage chain might 
> filter these modifiers out using the existing strict intersection logic. 
> Hence, any link in the chain not aware of constraints would likely block 
> their use, but that's OK. We're muddling along without them now. It 
> wouldn't make those situations any worse.
> 
> - New code would be required to use some minimal library (Header-only 
> perhaps, as Simon and I proposed a few years ago) to intersect format 
> modifier lists instead, and this code would parse out the constraint 
> modifiers from each input list and use the envisioned per-constraint 
> logic to merge them. It would result in yet another merged 
> modifier+constraint list encoded as a list of modifiers that could be 
> passed along through any format-modifier-aware API.
> 
> - One consideration that would be sort of tricky is that constraints are 
> supposed to be advertised per-modifier, so you'd have to have a way to 
> associate constraint modifiers in a given set with real modifiers in 
> that set or in general. This is easily solved though. Some bits of the 
> constraint modifiers would already need to be used to associate and 
> order constraint fragments during deserialization, since modifier lists 
> aren't strictly ordered.
> 
> This effectively allows you to use format modifiers to encode 
> arbitrarily complex constraint mechanisms by piggybacking on the 
> existing format modifier definition and transport mechanisms without 
> breaking backwards compatibility. It's a little dirty, because modifiers 
> are being abused to implement a raw bitstream, but modifiers and 
> constraints are related concepts, so it's not a complete hack. It still 
> requires modifying all the implementations in the system to fully make 
> use of constraints, but doesn't require e.g. revising X11 DRI3 protocol 
> again to tunnel them through Xwayland, and in situations where the 
> constraint-aware thing sits downstream of the non-constraint-aware thing 
> in the allocation pipeline, you could get some benefit even when all the 
> upstream things aren't updated yet, because it could still merge in its 
> local constraints before allocating or passing the modifier list down 
> the chain.
> 
> Does this seem like something worth pursuing to others? I've been trying 
> to decide how to best move the allocation constraints efforts forward, 
> so it's potentially something I could put some time into this year.

It's a fairly interesting idea I hadn't thought of.

My limited experience with all the graphics protocols and their history
means I have had limited exposure to the pain that communicating
modifiers everywhere has generated. As a result, I would have (perhaps
naively) tried to design a new mechanism. Using modifiers as a transport
mechanism is clearly a hack, but it may be a clever one. It seems worth
experimenting with it at least.

After reading the whole thread, I however wonder if this will be
backward compatible. If two devices expose a constraint that ends up
being encoded in the same binary form in a modifier (let's say for
instance the same pitch alignment), isn't there a risk that an
application not aware of this new scheme will pick that common modifier
when intersecting the modifiers list as done today, without realizing
it's not a real modifier ?

-- 
Regards,

Laurent Pinchart
