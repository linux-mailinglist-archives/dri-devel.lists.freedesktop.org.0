Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77BFF3992A8
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 20:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51986E529;
	Wed,  2 Jun 2021 18:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0856E529
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 18:36:06 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so2271537wmq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Jun 2021 11:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TPWNGlfiskK3hgafibVRsq0PiD04XT0ORRAhfLIQuw0=;
 b=U6GdnpAAn3JL0L9bI+szFM+LGrJwtDLovbQkDRbWjOh0S7h42F3xHJYjZe4XKk4ikh
 SwycQboV16S1D0ivfQnc3uYkfu2k8gObTSNmF+TVZC2SShNQm5oQXSBpZBcJDMukxiug
 y8McPna9cqWuDcHlSiptQhnZJMHknCT7BTLjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TPWNGlfiskK3hgafibVRsq0PiD04XT0ORRAhfLIQuw0=;
 b=f6EfJ0EisK5Ctk7KtI0Le++RRox6sB4svaV1IU1sbmoA7OLJdswRDiIaFrjd/lVQmt
 UMXFnHtmJn7q4nFVhX5pGMeASl3mJ3MF0PEbRISmP3mjuhurgrLEYFxS0RX7OEKE6bK2
 3IeX63yHaA00nLnab4NfO/J13eAnZh4huLGiD9mmFHgPQWrkXnFNZCyIZgJ3oMxdGjmS
 4kn6MqOro+upHoQUT1SeFlnAA5PN2/wd68E2fUzUPeMarUPans89F9KSXmTh0b2J2T9V
 jK/GqFCJAZt0PKI7zsf3sy/6288N+iyChv4rA73ZI5QHzFIcO1bnY5ZTlmjs7Egqdmtx
 Wj/Q==
X-Gm-Message-State: AOAM530mNYFwfq8Gb/gKxUTVUW6bp24Ccv2drRADIgnuS7Y5Hl+lGO7U
 8Kes2l3L48pYf2zAn9Xc1Uejng==
X-Google-Smtp-Source: ABdhPJxDRHthdvL3MascZoXDaa9G+wYwsf8kMbsaQh3L9aGnk89sdtNVsthBK4Mbu00GxhOIbjQwww==
X-Received: by 2002:a7b:c4d0:: with SMTP id g16mr15961497wmk.181.1622658965596; 
 Wed, 02 Jun 2021 11:36:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 11sm491926wmo.24.2021.06.02.11.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 11:36:04 -0700 (PDT)
Date: Wed, 2 Jun 2021 20:36:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/ttm: nuke VM_MIXEDMAP on BO mappings
Message-ID: <YLfPk+7NHrc3I9MQ@phenom.ffwll.local>
References: <20210602083013.1561-1-christian.koenig@amd.com>
 <54c5dc94-b367-70dd-ca8f-afcbda7598c6@shipmail.org>
 <001df485-eed3-3638-0464-9a2ab67ac73f@gmail.com>
 <32d661ae-1eab-918d-cd98-40109e6073df@shipmail.org>
 <37a0336b-48d6-67bb-6a71-bba4daef6aa6@gmail.com>
 <eac33818-b266-e973-f811-ba2ffbcd0a2f@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eac33818-b266-e973-f811-ba2ffbcd0a2f@linux.intel.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, jgg@ziepe.ca
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 02:21:17PM +0200, Thomas Hellström wrote:
> 
> On 6/2/21 2:04 PM, Christian König wrote:
> > 
> > 
> > Am 02.06.21 um 13:24 schrieb Thomas Hellström (Intel):
> > > [SNIP]
> > > > > > @@ -576,14 +565,10 @@ static void
> > > > > > ttm_bo_mmap_vma_setup(struct ttm_buffer_object *bo,
> > > > > > struct vm_area_s
> > > > > >         vma->vm_private_data = bo;
> > > > > >   -    /*
> > > > > > -     * We'd like to use VM_PFNMAP on shared mappings, where
> > > > > > -     * (vma->vm_flags & VM_SHARED) != 0, for performance reasons,
> > > > > > -     * but for some reason VM_PFNMAP + x86 PAT +
> > > > > > write-combine is very
> > > > > > -     * bad for performance. Until that has been sorted out, use
> > > > > > -     * VM_MIXEDMAP on all mappings. See freedesktop.org bug #75719
> > > > > > +    /* Enforce VM_SHARED here since no driver backend
> > > > > > actually supports COW
> > > > > > +     * on TTM buffer object mappings.
> > > > > 
> > > > > I think by default all TTM drivers support COW mappings in
> > > > > the sense that written data never makes it to the bo but
> > > > > stays in anonymous pages, although I can't find a single
> > > > > usecase. So comment should be changed to state that they are
> > > > > useless for us and that we can't support COW mappings with
> > > > > VM_PFNMAP.
> > > > 
> > > > Well the problem I see with that is that it only works as long
> > > > as the BO is in system memory. When it then suddenly migrates to
> > > > VRAM everybody sees the same content again and the COW pages are
> > > > dropped. That is really inconsistent and I can't see why we
> > > > would want to do that.
> > > Hmm, yes, that's actually a bug in drm_vma_manager().
> > 
> > Hui? How is that related to drm_vma_manager() ?
> > 
> Last argument of "unmap_mapping_range()" is "even_cows".
> > > > 
> > > > Additionally to that when you allow COW mappings you need to
> > > > make sure your COWed pages have the right caching attribute and
> > > > that the reference count is initialized and taken into account
> > > > properly. Not driver actually gets that right at the moment.
> > > 
> > > I was under the impression that COW'ed pages were handled
> > > transparently by the vm, you'd always get cached properly refcounted
> > > COW'ed pages but anyway since we're going to ditch support for them,
> > > doesn't really matter.
> > 
> > Yeah, but I would have expected that the new COWed page should have the
> > same caching attributes as the old one and that is not really the case.
> > 
> > > 
> > > > 
> > > > > 
> > > > > >        */
> > > > > > -    vma->vm_flags |= VM_MIXEDMAP;
> > > > > > +    vma->vm_flags |= VM_PFNMAP | VM_SHARED;
> > > > > 
> > > > > Hmm, shouldn't we refuse COW mappings instead, like my old
> > > > > patch on this subject did? In theory someone could be
> > > > > setting up what she thinks is a private mapping to a shared
> > > > > buffer object, and write sensitive data to it, which will
> > > > > immediately leak. It's a simple check, could open-code if
> > > > > necessary.
> > > > 
> > > > Yeah, though about that as well. Rejecting things would mean we
> > > > potentially break userspace which just happened to work by
> > > > coincident previously. Not totally evil, but not nice either.
> > > > 
> > > > How about we do a WARN_ON_ONCE(!(vma->vm_flags & VM_SHARED)); instead?
> > > 
> > > Umm, yes but that wouldn't notify the user, and would be triggerable
> > > from user-space. But you can also set up legal non-COW mappings
> > > without the VM_SHARED flag, IIRC, see is_cow_mapping(). I think when
> > > this was up for discussion last time we arrived in a
> > > vma_is_cow_mapping() utility...
> > 
> > Well userspace could trigger that only once, so no spamming of the log
> > can be expected here. And extra warnings in the logs are usually
> > reported by people rather quickly.
> 
> OK, I'm mostly worried about adding a security flaw that we know about from
> the start.

VM_SHARED is already cleared in vma_set_page_prot() due to the VM_PFNMAP
check in vma_wants_writenotify.

I'm honestly not sure whether userspace then even can notice this or
anything, so might be worth a quick testcase.

Even if I'm wrong here we shouldn't allow cow mappings of gem_bo, that
just seems too nasty with all the side-effects.
-Daniel

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
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
