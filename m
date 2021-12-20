Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C663147A73A
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 10:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F30110ECFC;
	Mon, 20 Dec 2021 09:37:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD07210ECFC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 09:37:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so18776689wrb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=7tPXF+9eqxH0VrjIFJXikF3YUlncb+6bNDGNk1kLWrs=;
 b=kfDwp5nMvLzbIXS3wqK1Y2Hr8jbTm1PvVEfEuNPy6qPI5E30FfoeKnB8DIQ7bDoPBE
 5LEZUPhpckKGGV9t3LitFylVtnXYi4IiMOHuu+t19qv87ZHVPP/S+9QyXw7lUlUo2RTf
 H6riIEuXlYoMbtvkS0/DEvYwF3r/sQTuzHq8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7tPXF+9eqxH0VrjIFJXikF3YUlncb+6bNDGNk1kLWrs=;
 b=Y5WJjLL3gNj7TwseJbAKTqDRvi+J1dBD8e+t7d7zc2ATm8zPlouTznRsLpJj+8mnln
 pejgPufFUwdT76hgblUsqBzmhpk+nnix3LlteVqOR+8tdGhzvzEMNCo/D8HTDcnPeg7F
 e8IbzOx1B6yDebF8RXtTLxDUU+RUIJiRPrefi94SUFHP145CGkiSrkyNFKx+DT7DZnCS
 yJLMiTsVEHgRKR9H95pJ+Fl54GAwqRC6xcQZSvGJzDkUJ+ErYf0IplXsW13SqnaRHqKL
 He/HtjZcFXstYZ1jFIFmj14ZzTaM8YNB+Ve2xeoVETRDEqxPvEg9MElxmGo4g9qLHBTx
 vpRw==
X-Gm-Message-State: AOAM531FqeNIuXj0gXja4TvPp0H1xNVYFdcE+1P9PgXQ4ikafv80Hnb9
 jF2hLKoYEGms8BXJTnKeo2JMr1FZeQamvA==
X-Google-Smtp-Source: ABdhPJyHCDu/beGTAhbKS7XRGOoGT8NNBV9wvUisadPjj3r+S79/q0rfIn6NB0tlpT1J6NZkkkLNjQ==
X-Received: by 2002:a5d:4b0a:: with SMTP id v10mr11845177wrq.294.1639993043246; 
 Mon, 20 Dec 2021 01:37:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j16sm4537709wmq.3.2021.12.20.01.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 01:37:22 -0800 (PST)
Date: Mon, 20 Dec 2021 10:37:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid
 establishing a locking order between fence classes
Message-ID: <YcBO0ANh7zh5Drif@phenom.ffwll.local>
References: <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
 <Ya+jL+SBTqdwqBeI@phenom.ffwll.local>
 <ef823120-ecdc-24c7-b9e2-33303c47d171@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef823120-ecdc-24c7-b9e2-33303c47d171@linux.intel.com>
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 matthew.auld@intel.com, intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 09:46:47PM +0100, Thomas Hellström wrote:
> 
> On 12/7/21 19:08, Daniel Vetter wrote:
> > Once more an entire week behind on mails, but this looked interesting
> > enough.
> > 
> > On Fri, Dec 03, 2021 at 03:18:01PM +0100, Thomas Hellström wrote:
> > > On Fri, 2021-12-03 at 14:08 +0100, Christian König wrote:
> > > > Am 01.12.21 um 13:16 schrieb Thomas Hellström (Intel):
> > > > > On 12/1/21 12:25, Christian König wrote:
> > > > > > And why do you use dma_fence_chain to generate a timeline for
> > > > > > TTM?
> > > > > > That should come naturally because all the moves must be ordered.
> > > > > Oh, in this case because we're looking at adding stuff at the end
> > > > > of
> > > > > migration (like coalescing object shared fences and / or async
> > > > > unbind
> > > > > fences), which may not complete in order.
> > > > Well that's ok as well. My question is why does this single dma_fence
> > > > then shows up in the dma_fence_chain representing the whole
> > > > migration?
> > > What we'd like to happen during eviction is that we
> > > 
> > > 1) await any exclusive- or moving fences, then schedule the migration
> > > blit. The blit manages its own GPU ptes. Results in a single fence.
> > > 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
> > > fences.
> > This sounds like over-optimizing for nothing. We only really care about
> > pipeling moves on dgpu, and on dgpu we only care about modern userspace
> > (because even gl moves in that direction).
> Hmm. It's not totally clear what you mean with over-optimizing for nothing,
> is it the fact that we want to start the blit before all shared fences have
> signaled or the fact that we're doing async unbinding to avoid a
> synchronization point that stops us from fully pipelining evictions?

Yup. Least because that breaks vulkan, so you really can't do this
optimizations :-)

In general I meant that unless you really, really understand everything
all the time (which frankly no one does), then trying to be clever just
isn't worth it. We have access pending in the dma_resv, we wait for it is
dumb, simple, no surprises.

> > And modern means that usually even write access is only setting a read
> > fence, because in vk/compute we only set write fences for object which
> > need implicit sync, and _only_ when actually needed.
> > 
> > So ignoring read fences for movings "because it's only reads" is actually
> > busted.
> 
> I'm fine with awaiting also shared fences before we start the blit, as
> mentioned also later in the thread, but that is just a matter of when we
> coalesce the shared fences. So since difference in complexity is minimal,
> what's viewed as optimizing for nothing can also be conversely be viewed as
> unneccesarily waiting for nothing, blocking the migration context timeline
> from progressing with unrelated blits. (Unless there are correctness issues
> of course, see below).
> 
> But not setting a write fence after write seems to conflict with dma-buf
> rules as also discussed later in the thread. Perhaps some clarity is needed
> here. How would a writer or reader that implicitly *wants* to wait for
> previous writers go about doing that?
> 
> Note that what we're doing is not "moving" in the sense that we're giving up
> or modifying the old storage but rather start a blit assuming that the
> contents of the old storage is stable, or the writer doesn't care.

Yeah that's not how dma-buf works, and which is what Christian is trying
to rectify with his huge refactoring/doc series to give a bit clearer
meaning to what a fence in a dma_resv means.

> > I think for buffer moves we should document and enforce (in review) the
> > rule that you have to wait for all fences, otherwise boom. Same really
> > like before freeing backing storage. Otherwise there's just too many gaps
> > and surprises.
> > 
> > And yes with Christian's rework of dma_resv this will change, and we'll
> > allow multiple write fences (because that's what amdgpu encoded into their
> > uapi). Still means that you cannot move a buffer without waiting for read
> > fences (or kernel fences or anything really).
> 
> Sounds like some agreement is needed here what rules we actually should
> obey. As mentioned above I'm fine with either.

I think it would be good to comment on the doc patch in Christian's series
for that. But essentially read/write don't mean actual read/write to
memory, but only read/write access in terms of implicit sync. Buffers
which do not partake in implicit sync (driver internal stuff) or access
which is not implicitly synced (anything vk does) do _not_ need to set a
write fence. They will (except amdgpu, until they fix their CS uapi)
_only_ set a read fence.

Christian and me had a multi-month discussion on this, so it's a bit
tricky.

> > The other thing is this entire spinlock recursion topic for dma_fence, and
> > I'm deeply unhappy about the truckload of tricks i915 plays and hence in
> > favour of avoiding recursion in this area as much as possible.
> 
> TBH I think the i915 corresponding container manages to avoid both the deep
> recursive calls and lock nesting simply by early enable_signaling() and not
> storing the fence pointers of the array fences, which to me appears to be a
> simple and clean approach. No tricks there.
> 
> > 
> > If we really can't avoid it then irq_work to get a new clean context gets
> > the job done. Making this messy and work is imo a feature, lock nesting of
> > same level locks is just not a good&robust engineering idea.
> 
> For the dma-fence-chain and dma-fence-array there are four possibilities
> moving forward:
> 
> 1) Keeping the current same-level locking nesting order of container-first
> containee later. This is fully annotated, but fragile and blows up if users
> attempt to nest containers in different orders.
> 
> 2) Establishing a reverse-signaling locking order. Not annotatable. blows up
> on signal-on-any.
> 
> 3) Early enable-signaling, no lock nesting, low latency but possibly
> unnecessary enable_signaling calls.
> 
> 4) irq_work in enable_signaling(). High latency.
> 
> The tread finally agreed the solution would be to keep 1), add early
> warnings for the pitfalls and if possible provide helpers to flatten to
> avoid container recursion.

Hm ok seems ok. It's definitely an area where we don't have great
solutions :-/
-Daniel

> 
> /Thomas
> 
> 
> > 
> > /me back to being completely burried
> > 
> > I do hope I can find some more time to review a few more of Christian's
> > patches this week though :-/
> > 
> > Cheers, Daniel
> > 
> > > 3) Most but not all of the remaining resv shared fences will have been
> > > finished in 2) We can't easily tell which so we have a couple of shared
> > > fences left.
> > > 4) Add all fences resulting from 1) 2) and 3) into the per-memory-type
> > > dma-fence-chain.
> > > 5) hand the resulting dma-fence-chain representing the end of migration
> > > over to ttm's resource manager.
> > > 
> > > Now this means we have a dma-fence-chain disguised as a dma-fence out
> > > in the wild, and it could in theory reappear as a 3) fence for another
> > > migration unless a very careful audit is done, or as an input to the
> > > dma-fence-array used for that single dependency.
> > > 
> > > > That somehow doesn't seem to make sense because each individual step
> > > > of
> > > > the migration needs to wait for those dependencies as well even when
> > > > it
> > > > runs in parallel.
> > > > 
> > > > > But that's not really the point, the point was that an (at least to
> > > > > me) seemingly harmless usage pattern, be it real or fictious, ends
> > > > > up
> > > > > giving you severe internal- or cross-driver headaches.
> > > > Yeah, we probably should document that better. But in general I don't
> > > > see much reason to allow mixing containers. The dma_fence_array and
> > > > dma_fence_chain objects have some distinct use cases and and using
> > > > them
> > > > to build up larger dependency structures sounds really questionable.
> > > Yes, I tend to agree to some extent here. Perhaps add warnings when
> > > adding a chain or array as an input to array and when accidently
> > > joining chains, and provide helpers for flattening if needed.
> > > 
> > > /Thomas
> > > 
> > > 
> > > > Christian.
> > > > 
> > > > > /Thomas
> > > > > 
> > > > > 
> > > > > > Regards,
> > > > > > Christian.
> > > > > > 
> > > > > > 
> > > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
