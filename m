Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4246C25D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 19:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8395E2A850;
	Tue,  7 Dec 2021 18:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56742A850
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 18:08:51 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id a18so31281470wrn.6
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 10:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=h+jbopFqRqjE8xr5JlCXkaufEvl1DrYRIg7SvlSAnHs=;
 b=RfQcBeDswiNUMuB4FRqLVvJcct/aMrI+YthuSgwBS7/Ya+6GxravUTBk3tW/LCn2Rw
 W0RtcWeV9A8MGMw7lX4M3wErSuKRtnwUsmgpoBadt8hQZLvwvOAlc5rodqx/HjzHJmnx
 9P9pRtHNK4wi3wLEx1lBP4Ju2bkC7nTXp+BAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=h+jbopFqRqjE8xr5JlCXkaufEvl1DrYRIg7SvlSAnHs=;
 b=oif8WCM/KRVPnIB8zrXvJH/P6BFh4GM7yidDzJ2fkKF0YcnCZw/bEpp445Z2vJYamL
 aqLEHqvdMKe5SR+kZ+gXQciAKyC3ePUu7hpCe2rW2VGpxVxyhy5QEYNGzh2FcH2+TTfp
 aothQSlFvde2zZPdB8FzH8xZm20tf1VBHl333+oH3ojozJHs+T62XL9jG/flS7l48a9S
 3t2Uau1vZ3ex1wof8fiktIoF9+ncPUL/M3u/3FUzkBWUsEVT321KnZAMNAcS+3Nr/tuR
 rcPq/Yem+nKtDojLK3Er/ByOBHC4CriUmTdRaw3OfLuwyAK3qT8Z2vtAPpZAtR8uQ+jg
 nPrg==
X-Gm-Message-State: AOAM5326n7TcAqMlpoz+hSuPAQt701cID48di2KQJ9vaKrBUYOH9eRrp
 ttsY15F9/9hfq4z9bE/zboO6VQ==
X-Google-Smtp-Source: ABdhPJxnnkrRGJ/bEpSzncF6pFNCbwwY0S88ZT7VEpHx3UgGXlihBhIPwgou9L7fIMeAjA4IdZohcg==
X-Received: by 2002:adf:f911:: with SMTP id b17mr54492042wrr.611.1638900530235; 
 Tue, 07 Dec 2021 10:08:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a10sm3360646wmq.27.2021.12.07.10.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 10:08:49 -0800 (PST)
Date: Tue, 7 Dec 2021 19:08:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid
 establishing a locking order between fence classes
Message-ID: <Ya+jL+SBTqdwqBeI@phenom.ffwll.local>
References: <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
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

Once more an entire week behind on mails, but this looked interesting
enough.

On Fri, Dec 03, 2021 at 03:18:01PM +0100, Thomas Hellström wrote:
> On Fri, 2021-12-03 at 14:08 +0100, Christian König wrote:
> > Am 01.12.21 um 13:16 schrieb Thomas Hellström (Intel):
> > > 
> > > On 12/1/21 12:25, Christian König wrote:
> > > > And why do you use dma_fence_chain to generate a timeline for
> > > > TTM? 
> > > > That should come naturally because all the moves must be ordered.
> > > 
> > > Oh, in this case because we're looking at adding stuff at the end
> > > of 
> > > migration (like coalescing object shared fences and / or async
> > > unbind 
> > > fences), which may not complete in order.
> > 
> > Well that's ok as well. My question is why does this single dma_fence
> > then shows up in the dma_fence_chain representing the whole
> > migration?
> 
> What we'd like to happen during eviction is that we
> 
> 1) await any exclusive- or moving fences, then schedule the migration
> blit. The blit manages its own GPU ptes. Results in a single fence.
> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
> fences.

This sounds like over-optimizing for nothing. We only really care about
pipeling moves on dgpu, and on dgpu we only care about modern userspace
(because even gl moves in that direction).

And modern means that usually even write access is only setting a read
fence, because in vk/compute we only set write fences for object which
need implicit sync, and _only_ when actually needed.

So ignoring read fences for movings "because it's only reads" is actually
busted.

I think for buffer moves we should document and enforce (in review) the
rule that you have to wait for all fences, otherwise boom. Same really
like before freeing backing storage. Otherwise there's just too many gaps
and surprises.

And yes with Christian's rework of dma_resv this will change, and we'll
allow multiple write fences (because that's what amdgpu encoded into their
uapi). Still means that you cannot move a buffer without waiting for read
fences (or kernel fences or anything really).

The other thing is this entire spinlock recursion topic for dma_fence, and
I'm deeply unhappy about the truckload of tricks i915 plays and hence in
favour of avoiding recursion in this area as much as possible.

If we really can't avoid it then irq_work to get a new clean context gets
the job done. Making this messy and work is imo a feature, lock nesting of
same level locks is just not a good&robust engineering idea.

/me back to being completely burried

I do hope I can find some more time to review a few more of Christian's
patches this week though :-/

Cheers, Daniel

> 3) Most but not all of the remaining resv shared fences will have been
> finished in 2) We can't easily tell which so we have a couple of shared
> fences left.
> 4) Add all fences resulting from 1) 2) and 3) into the per-memory-type
> dma-fence-chain. 
> 5) hand the resulting dma-fence-chain representing the end of migration
> over to ttm's resource manager. 
> 
> Now this means we have a dma-fence-chain disguised as a dma-fence out
> in the wild, and it could in theory reappear as a 3) fence for another
> migration unless a very careful audit is done, or as an input to the
> dma-fence-array used for that single dependency.
> 
> > 
> > That somehow doesn't seem to make sense because each individual step
> > of 
> > the migration needs to wait for those dependencies as well even when
> > it 
> > runs in parallel.
> > 
> > > But that's not really the point, the point was that an (at least to
> > > me) seemingly harmless usage pattern, be it real or fictious, ends
> > > up 
> > > giving you severe internal- or cross-driver headaches.
> > 
> > Yeah, we probably should document that better. But in general I don't
> > see much reason to allow mixing containers. The dma_fence_array and 
> > dma_fence_chain objects have some distinct use cases and and using
> > them 
> > to build up larger dependency structures sounds really questionable.
> 
> Yes, I tend to agree to some extent here. Perhaps add warnings when
> adding a chain or array as an input to array and when accidently
> joining chains, and provide helpers for flattening if needed.
> 
> /Thomas
> 
> 
> > 
> > Christian.
> > 
> > > 
> > > /Thomas
> > > 
> > > 
> > > > 
> > > > Regards,
> > > > Christian.
> > > > 
> > > > 
> > 
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
