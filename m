Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059B042C091
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 14:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06A4B6EA55;
	Wed, 13 Oct 2021 12:50:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B26EA53
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 12:50:34 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m22so8208723wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 05:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=P91GxCOY9td4bh4dBCuD2QlgDMfIIdgE/OSvJJRfbr4=;
 b=X/uAwOavo91IVX7bOdpXIT91t+wUmVwCVmXnLA7Mc/4iHFbztEMGQJ8mSV4pbPCkv7
 3twrFbfSgATAgza5IrKAgjdQl0CAtu68+IBwv/ENB3mJFcRLmRx0kPymr47XRwc1WA+W
 vM69MRQ511eqE3B28qo1LHBHmXHv0yZ4oznoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=P91GxCOY9td4bh4dBCuD2QlgDMfIIdgE/OSvJJRfbr4=;
 b=Z+dRF5BF5co/QlDNG9BpJnwPW4n+3d9vk8bq2O/ztKPjBG45rnPDC0EAaEHKPczZ5V
 UcKxEuY4I16Nx6Ga2/O8w+1N8Ydqin6n9SGGOnU8hkTH9LqbA/2bPeCd4pP0jB3OEUpv
 hFO5CKUonopm0HBS8uPhSOdvPSHnTUa/JqvENYsLVsmQkAK+yiPdnTCUxG5qqakxhuFN
 P6Bk3q4wjTUalKWigRs5OhdahKpDGFKiUCz/yKz4DsSx+FCgJHpa9Gv7q6vUCT6VOzjC
 zEONfTLwMzXwbMQU2inC9EQdxFr+v7G4aar02TquG6gB5oXkB/32BcRyfXpxpcbIs3Ky
 XVUQ==
X-Gm-Message-State: AOAM532FtECFfJYGabvHUXZ9yuM4r0BfJwH3YHYT9yeki9WQ2BHfH+Ur
 t7UUd80OQlbksZjByOP+a3cAIA==
X-Google-Smtp-Source: ABdhPJxivtWakZDNY6FBHMXu5knGmK1GehS1GdsO2HiicxNKDwP8jf7FHydtCm/Poi5eIO4pubo/9g==
X-Received: by 2002:a5d:47c3:: with SMTP id o3mr40563828wrc.25.1634129432892; 
 Wed, 13 Oct 2021 05:50:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n17sm12211804wrq.11.2021.10.13.05.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 05:50:32 -0700 (PDT)
Date: Wed, 13 Oct 2021 14:50:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Zack Rusin <zackr@vmware.com>
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 0/5] drm/vmwgfx: Support module unload and hotunplug
Message-ID: <YWbWFtg0FARHcjf1@phenom.ffwll.local>
References: <20211008173146.645127-1-zackr@vmware.com>
 <7abe3906a814e40786da5cd5d45a7b826e262d8e.camel@linux.intel.com>
 <dbfb505f1034a2d725d76e30a26d2da0a850dd41.camel@vmware.com>
 <96a89fdb5a10141e87d7283720b4088461db722b.camel@linux.intel.com>
 <232f45e9-8748-1243-09bf-56763e6668b3@amd.com>
 <4041c72ff1d3d149437cedbcf3c598ae2238519d.camel@linux.intel.com>
 <1b80b739-3d7e-1228-03d5-eba11f58dbe0@amd.com>
 <02f01e6df6c1a55e7444926d06cc0239001bfd91.camel@linux.intel.com>
 <cbfa8b5a879975e45d490b009d17e5b229cf3de4.camel@vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cbfa8b5a879975e45d490b009d17e5b229cf3de4.camel@vmware.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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

On Tue, Oct 12, 2021 at 05:34:50PM +0000, Zack Rusin wrote:
> On Tue, 2021-10-12 at 11:10 +0200, Thomas Hellström wrote:
> > On Tue, 2021-10-12 at 10:27 +0200, Christian König wrote:
> > > Am 11.10.21 um 14:04 schrieb Thomas Hellström:
> > > 
> > > > > 
> > 
> > > > So now if this is going to be changed, I think we need to
> > > > understand
> > > > why and think this through really thoroughly:
> > > > 
> > > > * What is not working and why (the teardown seems to be a trivial
> > > > fix).
> > > > * How did we end up here,
> > > > * What's the cost of fixing that up compared to refactoring the
> > > > drivers
> > > > that rely on bindable system memory,
> > > > * What's the justification of a system type at all if it's not
> > > > GPU-
> > > > bindable, meaning it's basically equivalent to swapped-out shmem
> > > > with
> > > > the exception that it's mappable?
> > > 
> > > Well, once more that isn't correct. This is nothing new and as far
> > > as
> > > I 
> > > know that behavior existing as long as TTM existed.
> > 
> > I'm not sure whats incorrect? I'm trying to explain what the initial
> > design was, and it may of course have been bad and the one you
> > propose
> > a better one and if required we certainly need to fix i915 to align
> > with a new one.
> > 
> > What worries me though, that if you perceive the design differently
> > and
> > change things in TTM according to that perception that breaks drivers
> > that rely on the initial design and then force drivers to change
> > claiming they are incorrect without a thorough discussion on dri-
> > devel,
> > that's IMHO not good.
> 
> We should probably do that in a seperate thread so that this,
> fundametally important, discussion is easier to find and reference in
> the future. It looks like we're settling on a decision here so I'd
> appreciate an Acked-by for the patch 4/5 just so it doesn't look like I
> was making things up to someone looking at git history in the future.

Jumping in sidesways and late, and also without real context on the
decision itself:

The way to properly formalize this is
- type a kerneldoc patch which writes down the rules we agree on, whether
  that's uapi, or internal helper api like for ttm, or on types or
  whatever
- get acks from everyone who participated + everyone who might care
- merge it

> It seems that in general TTM was designed to be able to handle an
> amazing number of special/corner cases at a cost of complexity which
> meant that over the years very few people understood it and the code
> handling those cases sometimes broke. It sounds like Christian is now
> trying to reign it in and make the code a lot more focused.
> 
> Working on other OS'es for the last few years, certainly made me
> appreciate simple frameworks that move complexity towards drivers that
> actually need them, e.g. it's of course anecdotal but I found wddm gpu
> virtual addressing models (iommu/gpummu) a lot easier to grok.
> 
> On the flip side that does mean that vmwgfx and i915 need to redo some
> code. For vmwgfx it's probably a net positive anyway as we've been
> using TTM for, what is really nowadays, an integrated GPU so maybe it's
> time for us to think about transition to gem.

Aside, but we're looking at adopting ttm for integrated gpu too. The
execbuf utils and dynamic memory management helpers for pure gem just
aren't quite there yet, and improving ttm a bit in this area looks
reasonable (like adding a unified memory aware shrinker like we have in
i915-gem).

Also I thought vmwgfx is using ttm to also manage some id spaces, you'd
have to hand-roll that.

Anyway entirely orthogonal.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
