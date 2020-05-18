Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A511D7B76
	for <lists+dri-devel@lfdr.de>; Mon, 18 May 2020 16:40:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 377BE6E212;
	Mon, 18 May 2020 14:40:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03F06E212
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 14:40:38 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h17so12139272wrc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 18 May 2020 07:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=upylutkiKti3lDLmYcIR/RPiLHE1kV4VVOWxpoqQSFQ=;
 b=hHxwVq8DfIKZnvjC6oO+KgVGc3HeE8WmpDa+4Gu+WPtlkzGN2HvNxtXhomgzYKGCEO
 6pyCaJK7gH+6yCB2Dxyut7thurRgR/8KVjYpxtyT3yythnQBhiOKe+NVLLNWax/8q1bZ
 5qQiqiw35PlJmFu91d2SMeUTZIdM08gvWDhRM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=upylutkiKti3lDLmYcIR/RPiLHE1kV4VVOWxpoqQSFQ=;
 b=m4Bo1Egqccu+g+GlNTJBVQrLOdntwA7J/DHT0OHwdBDluZ0MPIRrdM5diKJ8qoQx5b
 dnVLQH7OQCcOVTkkTSq9a6zd9P5C27H59YUnIB5aQvDT5Zo1TdErVL6ULUmQrzPvq0CV
 AEw+HbGjZuPHgBTe6C7IEA9F0FbLhgBOoxHTRX2BoaHvwvXqfmI9LqTYFva/FTx7H+rl
 t0GFAqEDEv/rvZfT/WJnkiz6t6Zj8RIcbPi3w0SfWF69lT7AwCCOTsgvdo1NO8iclfRP
 CzzNwknXrhnBSQBeqFAT8RPk8did8oawtTyoQUrpjrAYq9PEHjSJe50lWqVh0qj9Mmmx
 zyCA==
X-Gm-Message-State: AOAM533roYx9leejfxL2GavIncn7Ygk+Xqrl0wS/EdXWr6XuL6Wt3YM+
 obT+ottNPlmz2F2amwwiMBrj+Q==
X-Google-Smtp-Source: ABdhPJwxwzMCX9ZRalWpp6YbR4lf/bqklrUVpTwkhmVC8QicZZePXHar2e0mJ+rP7k2DwKKzYrXOJQ==
X-Received: by 2002:a05:6000:8:: with SMTP id
 h8mr21328512wrx.372.1589812837672; 
 Mon, 18 May 2020 07:40:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l1sm17146590wrc.24.2020.05.18.07.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 May 2020 07:40:36 -0700 (PDT)
Date: Mon, 18 May 2020 16:40:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 1/2] drm/shmem: Use cached mappings by default
Message-ID: <20200518144034.GN206103@phenom.ffwll.local>
References: <20200513150312.21421-1-tzimmermann@suse.de>
 <20200513150312.21421-2-tzimmermann@suse.de>
 <20200514124050.GV206103@phenom.ffwll.local>
 <CAL_JsqK5J78PS_miF8QmfcLJOiESV-f=hXB_CanFqK9yBgJ=6Q@mail.gmail.com>
 <6cec8a8a-d642-cd93-906a-eafab49a12d7@suse.de>
 <20200515141044.GH206103@phenom.ffwll.local>
 <3e09cc7d-c609-e10a-3fe9-f40f3bbfaeaf@suse.de>
 <20200518082354.jeuyt7uzek73pjkp@sirius.home.kraxel.org>
 <3bc1a032-2e7a-d7a8-e5e6-8d53a9e9bd3a@suse.de>
 <20200518101132.ves2qswskaiajh2y@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518101132.ves2qswskaiajh2y@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: David Airlie <airlied@linux.ie>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 18, 2020 at 12:11:32PM +0200, Gerd Hoffmann wrote:
> On Mon, May 18, 2020 at 10:50:15AM +0200, Thomas Zimmermann wrote:
> > Hi Gerd
> > 
> > Am 18.05.20 um 10:23 schrieb Gerd Hoffmann:
> > >>> $ git grep drm_gem_shmem_mmap
> > >>>
> > >>> We also need correct access from userspace, otherwise the gpu is going to
> > >>> be sad.
> > >>
> > >> I've been thinking about this, and I think it means that we can never
> > >> have cached mappings anywhere. Even if shmem supports it internally for
> > >> most drivers, as soon as the page are exported, the importer could
> > >> expect uncached memory.
> > > 
> > > The importer should not expect anything but call dma-buf ops so the
> > > exporter has a chance to handle this correctly.
> > 
> > I have the following case in mind: Suppose the exporter maps cached
> > pages and the importer expects uncached pages for DMA. There is
> > map_dma_buf/unmap_dma_buf, which can implement a cache flush for the
> > cached pages. Is it guaranteed that the importer calls this around each
> > DMA operation?
> 
> I think the importer is supposed to do that, but I wouldn't surprised if
> there are cases in tree where this isn't implemented correctly ...

Yup, this is very much a case of "supposed to" but "in practice, many
actually dont". The reason is that setting up mappings is expensive, so
best avoid.

We filled that gap a few years after dma-buf landed with the
begin/end_cpu_access hooks, which allow the exporter to do cache flushing
(using something like dma_sync_sg_for_device/cpu) and for this to all work
properly. We even added ioctl so that the mmap on the dma-buf works
correctly.

But most importers still ignore this, so it's all fail :-/ But in theory
the pieces to make cached mappings work over dma-buf, even for importers
that need uncached, are all there.

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
