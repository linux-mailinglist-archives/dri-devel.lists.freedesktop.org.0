Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AED412AD6E6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 13:55:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E858F895C8;
	Tue, 10 Nov 2020 12:54:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC7AC895C8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 12:54:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id d12so11038708wrr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 04:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=21NUxsor7hHh3PxftuxZky4lFBsZ7ois+WrBZ+IPnLY=;
 b=E4HkumvRbwuhozffvJJYhcXQ+VtG4Q5s+Lzoafw7cM2EbsdrTNVYk1kPivb8pbY7c+
 I3kjvimorLUFRT9npgGtOPRUW7SmX6WyqftC9yyMCGkX+bhVlGtQOJkJpmTW1UQKJfWV
 ARuzsuE6jBqPKwT7KHW/FpzfKGO1l7WHVK6XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=21NUxsor7hHh3PxftuxZky4lFBsZ7ois+WrBZ+IPnLY=;
 b=IkeyKlIO+WNSQ5ASV9ZJFsblmxzZdAZuMDH0etCQ1fOR7U52G5uo2nrq4+lIoL/xMj
 thiTThYe1xD78tbOHHuaC5vLjCJHfZZ7H46HCSupgPcybTUWcwCzqZ62cx71FMWKNpGL
 PlhrK2pAH6OeKOWTXyALUthmblnwOUd41qkYds0wgJ/KSklQ1fOyf47urGEUnWXKZZdJ
 uOrTaZlV05EcyxEgGDsE5kidI2TLmUkgILISZMwYYG1MhZEaEFmJHkO7avYMnF2tkUSA
 L2Up2SObn2wFNGXrLIijCDjJujC8IyzIJUkF4BbzP8NkVlZhbG1PO7ryVwrVkFn12ua6
 XPsA==
X-Gm-Message-State: AOAM532uAyH2ILo+EV+W2AdVC0HQ23HInQJI07GVHTPUVrWqrdEl2t4e
 PjGGahCJc9RtGeAAV8OlfYkdUA==
X-Google-Smtp-Source: ABdhPJzT5dC6ywnGl2kTD3cDLIqcnE5q/gaqRflUh5l8yTN1U1ZZN6jf0KEM1LgGEsdInku+ZwePhw==
X-Received: by 2002:adf:f546:: with SMTP id j6mr10751487wrp.219.1605012895642; 
 Tue, 10 Nov 2020 04:54:55 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 71sm17578577wrm.20.2020.11.10.04.54.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 04:54:54 -0800 (PST)
Date: Tue, 10 Nov 2020 13:54:52 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH] drm: remove pgprot_decrypted() before calls to
 io_remap_pfn_range()
Message-ID: <20201110125452.GG401619@phenom.ffwll.local>
References: <0-v1-2e6a0db57868+166-drm_sme_clean_jgg@nvidia.com>
 <20201105191746.GC401619@phenom.ffwll.local>
 <20201105193554.GP2620339@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105193554.GP2620339@nvidia.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 03:35:54PM -0400, Jason Gunthorpe wrote:
> On Thu, Nov 05, 2020 at 08:17:46PM +0100, Daniel Vetter wrote:
> > On Thu, Nov 05, 2020 at 01:00:19PM -0400, Jason Gunthorpe wrote:
> > > commit f8f6ae5d077a ("mm: always have io_remap_pfn_range() set
> > > pgprot_decrypted()") moves the pgprot_decrypted() into
> > > io_remap_pfn_range(). Delete any, now confusing, open coded calls that
> > > directly precede io_remap_pfn_range():
> > > 
> > > - drm_io_prot() is only in drm_mmap_locked() to call io_remap_pfn_range()
> > > 
> > > - fb_mmap() immediately calls vm_iomap_memory() which is a convenience
> > >   wrapper for io_remap_pfn_range()
> > > 
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > >  drivers/gpu/drm/drm_vm.c         | 3 ---
> > >  drivers/video/fbdev/core/fbmem.c | 5 -----
> > >  2 files changed, 8 deletions(-)
> > > 
> > > rc3 will have the dependent patch, this should not be merged to DRM until it
> > > has the rc3 commits.
> > > 
> > > There are three other pgprot_decrypted() calls in DRM, I could not figure out
> > > what was what there, but other than very special cases I would expect code to
> > > use io_remap_pfn_range() instead.
> > 
> > There's 4 now, I think linux-next added one. It's another io_remap_pfn
> > 
> > Of the three you mentioned we have:
> > - ttm and i915 use vm_insert_pfn (and ttm also can do also do pud_mkhuge
> >   entries)
> 
> You can't insert IO memory with vmf_insert_pfn_pmd_prot() (it
> doesn't set the special flag) so why does it need decrypted?

Well, see the other thread, we do ... :-/
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
