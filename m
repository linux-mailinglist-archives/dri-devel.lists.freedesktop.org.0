Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C3983CD56
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 21:23:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEA1210E89B;
	Thu, 25 Jan 2024 20:23:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6318C10E206
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 20:23:39 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-55d000834dcso212094a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 12:23:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706214157; x=1706818957; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cgx7mklBpB9KounVQy5eGpWd3i905pv75d99Q4ggPTM=;
 b=PJySQyfNCVRA4Omtaw+hiu1F7krvJ3vZ8JhsHvT44Ju6CfGVR9ryEebpn0EBVsW7ol
 q+FHcQs+6BS6Yli+DYzopEmnYxcifqv5RCqfJm7IEjHoIOtGPJf75YItMus4/U4oDl1j
 /luBnlQqQ4SFeY81gTjmO7RrZ9yoKDIpQ8pm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706214157; x=1706818957;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cgx7mklBpB9KounVQy5eGpWd3i905pv75d99Q4ggPTM=;
 b=e5QRkIzFyhRygX8pVdd8SVctXJT6wUZu1iyrAXbfSFKAggfX/nMkXZFFvf1AQ5p/OZ
 eXTCb+T8yAywkeEVtQqsLLpY7HeQPFUIubt5NGqNrZ7bfnAuEEavFsOpEd8+KBQOZqBa
 ElkcGne8x1IMgLYwSg1HlA+IuuTQNsPL3zab3gPIemhBttoFjXmj5I645ZtjQCpaFJTJ
 WPgMm4oNjQUgygf6Zv44bIAJcM1XczZQvOSlGhaVHBAA4ET/moDQAJpX/rQCWVB0D3nA
 NpIr0ey2NP4zM6nf2HgE1wYnC9702ymM9eQ2ilv6UlxGA4PqlXhtHGCG1Gf6EULbiUe1
 ClYA==
X-Forwarded-Encrypted: i=0;
 AJvYcCV8DtwmQ61gxf1VLYB0oUYkQSfE3vUkqFOspWlkEE2Lsf7w9J/a14tq1cTWxMeBIMudbp2DCkmI9ETrQu3FO7tOM/zkJ0lKSJ1kilLC0mfP
X-Gm-Message-State: AOJu0YwiY3oFdIyYDLHw6Xfx/cACH1png8DI4D74vypRJGF6R/NpXU1W
 uWVRXUuwsPk74IYDo4IoTq9OztPKGc4g7hxQyoc0Xar2xRfqRu7IUdnwI19PxXg=
X-Google-Smtp-Source: AGHT+IFaTRwxaZ3kossB3H1YRQdr9l0tTF1yAxPBdIIOdK1uRobh4zyGMgDW9fgGjUXK1GGr2MpHAQ==
X-Received: by 2002:a17:906:f804:b0:a30:ff7f:e583 with SMTP id
 kh4-20020a170906f80400b00a30ff7fe583mr148157ejb.2.1706214157490; 
 Thu, 25 Jan 2024 12:22:37 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ps12-20020a170906bf4c00b00a31225fed97sm1372278ejb.104.2024.01.25.12.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 12:22:36 -0800 (PST)
Date: Thu, 25 Jan 2024 21:22:34 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: fb_defio and page->mapping
Message-ID: <ZbLDCkpq9zxkdyLt@phenom.ffwll.local>
Mail-Followup-To: Matthew Wilcox <willy@infradead.org>,
 Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jaya Kumar <jayalk@intworks.biz>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
References: <Za_1d4MVxKeQOP9B@casper.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Za_1d4MVxKeQOP9B@casper.infradead.org>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Daniel Vetter <daniel@ffwll.ch>,
 Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jan 23, 2024 at 05:20:55PM +0000, Matthew Wilcox wrote:
> We're currently trying to remove page->mapping from the entire kernel.
> This has me interested in fb_defio and since I made such a mess of it
> with commits ccf953d8f3d6 / 0b78f8bcf495, I'd like to discuss what to
> do before diving in.
> 
> Folios continue to have a mapping.  So we can effectively do
> page_folio(page)->mapping (today that's calling compound_head() to get
> to the head page; eventually it's a separate allocation).
> 
> But now I look at commit 56c134f7f1b5, I'm a little scared.
> Apparently pages are being allocated from shmem and being mapped by
> fb_deferred_io_fault()?  This line:
> 
>                 page->mapping = vmf->vma->vm_file->f_mapping;
> 
> initially appears harmless for shmem files (because that's presumably
> a noop), but it's only a noop for head pages.  If shmem allocates a
> compound page (ie a 2MB THP today), you'll overlay some information
> stored in the second and third pages; looks like _entire_mapcount
> and _deferred_list.prev (but we do shift those fields around without
> regard to what the fb_defio driver is doing).  Even if you've disabled
> THP today, setting page->mapping to NULL in fb_deferred_io_lastclose()
> for a shmem page is a really bad idea.
> 
> I'd like to avoid fb_defio playing with page->mapping at all.
> As I understand it, the only reason to set page->mapping is so that
> page_mkclean() works.  But there are all kinds of assumptions in
> page_mkclean() (now essentially folio_mkclean()) that we're dealing with
> file-backed or anonymous memory.  I wonder if we might be better off
> calling pfn_mkclean_range() for each VMA which maps these allocations?
> You'd have to keep track of each VMA yourself (I think?)  but it would
> avoid messing with page->mapping.
> 
> Anyway, I don't know enough about DRM.  There might be something
> unutterably obvious we could do to fix this.

It's just really old code that's been barely touched to keep it going.

The issue is that the entire defio stuff is pretty bad layering violation.
Not sure what the cleanest way to do this really would be if it only
touches the ptes and nothing else. Not sure what's the right function for
a bit of pte walking for that.

That would still potentially mess with the mapping by the gpu memory
allocator in bad ways, but I think at least for all current ones it should
avoid problems.

Definitely agree that messing with struct page in any way is really bad,
we simply didn't get that far yet.

I think the cleanest way would be if we have a fb_mmap only for drm
drivers in drm_fbdev_generic.c and sunset fb_deferred_io_mmap and use that
to just replicate the ptes from the kernel's vmap into one that is ok for
userspace. The fbdev implementation in drm_fbdev_generic.c is the only one
left in drm that supports fb_defio, so that would catch all of them. To my
knowledge all the other defio implementations in native fbdev drivers
aren't problematic since none use shmem.

For I while we pondered with proxying the vma to the driver's drm native
mmap implementation, but that gets real messy plus there's no benefit
because fbdev assumes a bit too much that the memory is permanently
pinned. So we need the pinned kernel vmap anyway.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
