Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E499572F324
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 05:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C36010E002;
	Wed, 14 Jun 2023 03:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com
 [IPv6:2607:f8b0:4864:20::1136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D7E610E002
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 03:41:11 +0000 (UTC)
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-56d304e5f83so2661557b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 20:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1686714070; x=1689306070;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=89E/vNm15KXI4BNl5Qj1rAiYLsSjfnECEfyhr24KnlQ=;
 b=vKTCEq/gV+PVeQNXgMkpr+n7v5Y/DXhSWm8RnVXfDxcCC+faivAk0lNIjtdHQFn8Sa
 BgWYqlj92ejqHVkr5i/UNnuCNju9kW52golDDRmlzB4jLuwh8zjt7CQofNLG+RhgD9FS
 x2io964yVNzQHIQprnB67rxEXKMUPeUAvM32bdh8zZcn3rxYJsLwEDgwkJIzFwtn9DQr
 pzIQ3oOLP1aaCBfAQ00kOxXpp68UriNs3EjF+FUBbb5pls3Z2TJMn+e9hmzPr2pKjffK
 JGuQhr4vY87GLfRZ92kpYzlDA2SL93gxuxlDYkT2a5N5IptTgXwoAd0wICSLzPvzIKuU
 WI1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686714070; x=1689306070;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=89E/vNm15KXI4BNl5Qj1rAiYLsSjfnECEfyhr24KnlQ=;
 b=VTxs42YvZsgTgFnsSRy3gZcUqc3Y+OjHPr89hhrLHjajwPyTjj6Wkxm0EhJU02KDbW
 HMNonXe4Ooe5Gb93KajyZ+WF2TZSG63h8cIcUcnkf21+b1sTgW+h6c+stPSBvR+m9+sW
 soRIS2ALvLq28oEvf+/j0JoAoVkOVawpJzWE+Vr2WmcQv0jdg9+7y6KEyms0V5HdU9gg
 kkMEa5rwkHBFyiBVaYgqLUrHUNFaH65EesMFwQAkExpyYKltYJv2TV8V7v0ghXqsb3Dq
 CGAKn109r2K9kQKgAYk8L0AJB/Y7ahMFn9bXNTct7hBTdakX1u+aHy6hEnMRtv182m59
 fDcg==
X-Gm-Message-State: AC+VfDwpUxh8jUPekNbT4JEeAyDlBudx3Q2lxBBoylcZ015g9AsKJGNe
 IwP7RTQKfCYffe+SdVdeQnfOIg==
X-Google-Smtp-Source: ACHHUZ5XIq5blHpZPaXxTMKFfNHRQa1tcMVkEWdNxYUmPW3WiJJjwg4PcLqdZC9W6ULm6CU+iXKYfg==
X-Received: by 2002:a0d:d6d5:0:b0:55d:626c:b62f with SMTP id
 y204-20020a0dd6d5000000b0055d626cb62fmr563052ywd.51.1686714069952; 
 Tue, 13 Jun 2023 20:41:09 -0700 (PDT)
Received: from ripple.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a816a09000000b00545dc7c4a9esm38074ywc.111.2023.06.13.20.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 20:41:09 -0700 (PDT)
Date: Tue, 13 Jun 2023 20:40:58 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] udmabuf: revert 'Add support for mapping hugepages (v4)'
In-Reply-To: <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
Message-ID: <5dd5b94c-7bf-4de-40db-aeea8aa7b45e@google.com>
References: <20230608204927.88711-1-mike.kravetz@oracle.com>
 <IA0PR11MB71851B64A5E7062E3BDD8D2FF854A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <281caf4f-25da-3a73-554b-4fb252963035@redhat.com>
 <IA0PR11MB71852D6B27C83658670CBFBDF855A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <676ee47d-8ca0-94c4-7454-46e9915ea36a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: "stable@vger.kernel.org" <stable@vger.kernel.org>, "Hocko,
 Michal" <mhocko@suse.com>, "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>, "Chang,
 Junxiao" <junxiao.chang@intel.com>,
 "muchun.song@linux.dev" <muchun.song@linux.dev>,
 Hugh Dickins <hughd@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 James Houghton <jthoughton@google.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "jmarchan@redhat.com" <jmarchan@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023, David Hildenbrand wrote:
> On 13.06.23 10:26, Kasireddy, Vivek wrote:
> >> On 12.06.23 09:10, Kasireddy, Vivek wrote:
> >>> Sorry for the late reply; I just got back from vacation.
> >>> If it is unsafe to directly use the subpages of a hugetlb page, then
> >>> reverting
> >>> this patch seems like the only option for addressing this issue
> >>> immediately.
> >>> So, this patch is
> >>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> >>>
> >>> As far as the use-case is concerned, there are two main users of the
> >> udmabuf
> >>> driver: Qemu and CrosVM VMMs. However, it appears Qemu is the only
> >> one
> >>> that uses hugetlb pages (when hugetlb=on is set) as the backing store for
> >>> Guest (Linux, Android and Windows) system memory. The main goal is to
> >>> share the pages associated with the Guest allocated framebuffer (FB) with
> >>> the Host GPU driver and other components in a zero-copy way. To that
> >> end,
> >>> the guest GPU driver (virtio-gpu) allocates 4k size pages (associated with
> >>> the FB) and pins them before sharing the (guest) physical (or dma)
> >> addresses
> >>> (and lengths) with Qemu. Qemu then translates the addresses into file
> >>> offsets and shares these offsets with udmabuf.
> >>
> >> Is my understanding correct, that we can effectively long-term pin
> >> (worse than mlock) 64 MiB per UDMABUF_CREATE, allowing eventually !root
> > The 64 MiB limit is the theoretical upper bound that we have not seen hit in
> > practice. Typically, for a 1920x1080 resolution (commonly used in Guests),
> > the size of the FB is ~8 MB (1920x1080x4). And, most modern Graphics
> > compositors flip between two FBs.
> > 
> 
> Okay, but users with privileges to open that file can just create as many as
> they want? I think I'll have to play with it.
> 
> >> users
> >>
> >> ll /dev/udmabuf
> >> crw-rw---- 1 root kvm 10, 125 12. Jun 08:12 /dev/udmabuf
> >>
> >> to bypass there effective MEMLOCK limit, fragmenting physical memory and
> >> breaking swap?
> > Right, it does not look like the mlock limits are honored.
> > 
> 
> That should be added.

Agreed.

> 
> >>
> >> Regarding the udmabuf_vm_fault(), I assume we're mapping pages we
> >> obtained from the memfd ourselves into a special VMA (mmap() of the
> > mmap operation is really needed only if any component on the Host needs
> > CPU access to the buffer. But in most scenarios, we try to ensure direct GPU
> > access (h/w acceleration via gl) to these pages.
> > 
> >> udmabuf). I'm not sure how well shmem pages are prepared for getting
> >> mapped by someone else into an arbitrary VMA (page->index?).
> > Most drm/gpu drivers use shmem pages as the backing store for FBs and
> > other buffers and also provide mmap capability. What concerns do you see
> > with this approach?
> 
> Are these mmaping the pages the way udmabuf maps these pages (IOW, on-demand
> fault where we core-mm will adjust the mapcount etc)?
> 
> Skimming over at shmem_read_mapping_page() users, I assume most of them use a
> VM_PFNMAP mapping (or don't mmap them at all), where we won't be messing with
> the struct page at all.
> 
> (That might even allow you to mmap hugetlb sub-pages, because the struct page
> -- and mapcount -- will be ignored completely and not touched.)

You're well ahead of me: I didn't reach an understanding of whether or not
mapcount would get manipulated here - though if Junxiao's original patch
did fix the immediate hugetlb symptoms, presumably it is (and without much
point, since udmabuf holds on to that extra reference which pins each
page for the duration).

> 
> > 
> >>
> >> ... also, just imagine someone doing FALLOC_FL_PUNCH_HOLE / ftruncate()
> >> on the memfd. What's mapped into the memfd no longer corresponds to
> >> what's pinned / mapped into the VMA.
> > IIUC, making use of the DMA_BUF_IOCTL_SYNC ioctl would help with any
> > coherency issues:
> > https://www.kernel.org/doc/html/v6.2/driver-api/dma-buf.html#c.dma_buf_sync
> > 
> 
> Would it as of now? udmabuf_create() pulls the shmem pages out of the memfd,
> not sure how DMA_BUF_IOCTL_SYNC would help to update that whenever the pages
> inside the memfd would change (e.g., FALLOC_FL_PUNCH_HOLE + realloc).
> 
> But that's most probably simply "not supported".

Yes, the pages which udmabuf is holding would be the originals: they will
then be detached from the hole-punched file, and subsequent faults or writes
to that backing file (through shmem, rather than through udmabuf) can fill
in the holes with new, different pages.  So long as that's well understood,
then it's not necessarily a disaster.

I see udmabuf asks for SEAL_SHRINK (I guess to keep away from SIGBUS),
but refuses SEAL_WRITE - so hole-punching remains permitted.

> 
> >>
> >>
> >> Was linux-mm (and especially shmem maintainers, ccing Hugh) involved in
> >> the upstreaming of udmabuf?

Thanks for the Cc, David.  No, I wasn't involved at all; but I probably
would not have understood their needs much better then than now.

I don't see anything obviously wrong with its use of shmem, aside from
the unlimited pinning of pages which you pointed out; and I'll tend to
assume that it's okay, from its five years of use.  But certainly the
more recent addition of hugetlb was mistaken, and needs to be reverted.

> > It does not appear so from the link below although other key lists were
> > cc'd:
> > https://patchwork.freedesktop.org/patch/246100/?series=39879&rev=7

The i915 folks (looks like Daniel Vetter was involved there) have been
using shmem_read_mapping_page() for a very long time: but they take care
to register a shrinker and swap out under pressure, rather than holding
pins indefinitely.

I wonder, if we're taking MFD_HUGETLB away from them, whether this
would be another call for MFD_HUGEPAGE (shmem memfd using THPs):
https://lore.kernel.org/linux-mm/c140f56a-1aa3-f7ae-b7d1-93da7d5a3572@google.com/

And that series did also support F_MEM_LOCK, which could be used to
help with the accounting of the locked pages.  (But IIRC the necessary
way of accounting changed just afterwards - or was it just before? -
so that old series may not show what's needed today.)

I was happy with using fcntls in that series; but could not decide the
right restrictionss for F_MEM_UNLOCK (how assured is a memlock if anyone
can unlock it?) - maybe F_MEM_UNLOCK should be refused while pins are
outstanding.

But I digress.  Yes, please do revert that hugetlb usage from udmabuf.

Hugh

> 
> That's unfortunate :(
> 
> -- 
> Cheers,
> 
> David / dhildenb
