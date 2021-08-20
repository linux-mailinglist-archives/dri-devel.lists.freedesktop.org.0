Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1571A3F27C8
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 09:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FC86EA32;
	Fri, 20 Aug 2021 07:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97D3D6EA23;
 Fri, 20 Aug 2021 07:17:54 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x11so18360030ejv.0;
 Fri, 20 Aug 2021 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=FkiVLWYWrBqL1Memnyb13KpmfhQX2FN/YeCrSAlOrd4=;
 b=uPjbdGFxHGbxZUwmoBbJB+HWctueRcCzvhrnNVMEbC8m69bgxs51qlGRpuj279z1ct
 wTy7wozH6wGq6FZJsIR0QGVfG/Y0HcVnaGnw5TpGJCnW9Xc7x60lM71ZZxicbfGLxL70
 tkSVBAq/Qnohbv4yI5mC0yJZWiEtQZ7TuMLOx8XWiGYcA9TJNLrW2X2NLuFEbaA7sDtD
 edErn0Asyj/dByyoa2Y+UWWhTkgMOlbc4oVFJ0QU1zT6pbEvfrWEg7CSCV8oshKvmvDO
 0+qHKvhk2aDZWVXA0UjKCWOPU8HkA6+9bGiqustxer0CMJr5W/PUdFKXgohbtPtmEd9C
 c7ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=FkiVLWYWrBqL1Memnyb13KpmfhQX2FN/YeCrSAlOrd4=;
 b=BTsQHAG30TatN03SQ5oPGMj79CFj/RbDLWtlFRwYRrhDTFhRAYzXAoxvhvrzcjif/+
 nWHq8EHu2xDElAhNFf0b8kPU02UgDgR7NTEEImmauSgMmWn5uaeo0P0BsH9oqkkKWB6P
 XS2CY7mMsnsM9tgUetMtdKq7g3JA7XAR95rV9OGCCy/JpobKftl5sJUMtkOM4wi60VVt
 vUV2iDZBIIO9EamzpobSlK0Qh8FpsNMyX/nAqopT3x/OkjDokgQUVSuACTIO9AazU5ib
 yJJs18nq8gvmzF6cAuqmiSsOV23atsHUkpZwh6+ellgvRepBOVJav832pHgh1t0oIoPJ
 +bWw==
X-Gm-Message-State: AOAM530fb4rQgxc3ddmXS/WCZNpklUM/gclrXn4stwPuPi3w3OJb8Mel
 dNUk1DQ18r1e1ncbxJ4diBFgznhNvroArL0Es4g=
X-Google-Smtp-Source: ABdhPJzX7jyjOzBEJRpJvnOPInODsnwLI7SVM7uU+q3qTBEjVEtfewXVVEJbYan7Ve+YHNjpZ4/BfSh33Q/emtfKFzw=
X-Received: by 2002:a17:907:3d93:: with SMTP id
 he19mr20752980ejc.179.1629443873210; 
 Fri, 20 Aug 2021 00:17:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210813063150.2938-1-alex.sierra@amd.com>
 <20210813063150.2938-3-alex.sierra@amd.com>
 <7b821150-af18-f786-e419-ec245b8cfb1e@nvidia.com>
 <393e9815-838d-5fe6-d6ab-bfe7b543fef6@amd.com>
 <e155ed59-8c3c-4046-e731-f082ee4b10bb@nvidia.com>
 <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
In-Reply-To: <600a4c43-271d-df98-d3e0-301af0e8d0fe@amd.com>
From: Jerome Glisse <j.glisse@gmail.com>
Date: Fri, 20 Aug 2021 00:17:41 -0700
Message-ID: <CAH3drwZLwhi9B2tt-HHSE6pxdse7ZVmOoCk=UM7LWA2BOqmi7Q@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] mm: remove extra ZONE_DEVICE struct page refcount
To: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Felix Kuehling <felix.kuehling@amd.com>, 
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org, 
 linux-xfs@vger.kernel.org, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Christoph Hellwig <hch@lst.de>, jgg@nvidia.com, 
 Jerome Glisse <jglisse@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 20 Aug 2021 07:45:11 +0000
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
Reply-To: j.glisse@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 11:00 AM Sierra Guiza, Alejandro (Alex)
<alex.sierra@amd.com> wrote:
>
>
> On 8/18/2021 2:28 PM, Ralph Campbell wrote:
> > On 8/17/21 5:35 PM, Felix Kuehling wrote:
> >> Am 2021-08-17 um 8:01 p.m. schrieb Ralph Campbell:
> >>> On 8/12/21 11:31 PM, Alex Sierra wrote:
> >>>> From: Ralph Campbell <rcampbell@nvidia.com>
> >>>>
> >>>> ZONE_DEVICE struct pages have an extra reference count that
> >>>> complicates the
> >>>> code for put_page() and several places in the kernel that need to
> >>>> check the
> >>>> reference count to see that a page is not being used (gup, compactio=
n,
> >>>> migration, etc.). Clean up the code so the reference count doesn't
> >>>> need to
> >>>> be treated specially for ZONE_DEVICE.
> >>>>
> >>>> v2:
> >>>> AS: merged this patch in linux 5.11 version
> >>>>
> >>>> v5:
> >>>> AS: add condition at try_grab_page to check for the zone device type=
,
> >>>> while
> >>>> page ref counter is checked less/equal to zero. In case of device
> >>>> zone, pages
> >>>> ref counter are initialized to zero.
> >>>>
> >>>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> >>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
> >>>> ---
> >>>>    arch/powerpc/kvm/book3s_hv_uvmem.c     |  2 +-
> >>>>    drivers/gpu/drm/nouveau/nouveau_dmem.c |  2 +-
> >>>>    fs/dax.c                               |  4 +-
> >>>>    include/linux/dax.h                    |  2 +-
> >>>>    include/linux/memremap.h               |  7 +--
> >>>>    include/linux/mm.h                     | 13 +----
> >>>>    lib/test_hmm.c                         |  2 +-
> >>>>    mm/internal.h                          |  8 +++
> >>>>    mm/memremap.c                          | 68
> >>>> +++++++-------------------
> >>>>    mm/migrate.c                           |  5 --
> >>>>    mm/page_alloc.c                        |  3 ++
> >>>>    mm/swap.c                              | 45 ++---------------
> >>>>    12 files changed, 46 insertions(+), 115 deletions(-)
> >>>>
> >>> I haven't seen a response to the issues I raised back at v3 of this
> >>> series.
> >>> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ore.kernel.org%2Flinux-mm%2F4f6dd918-d79b-1aa7-3a4c-caa67ddc29bc%40nvidia.c=
om%2F&amp;data=3D04%7C01%7Calex.sierra%40amd.com%7Cd2bd2d4fbf764528540908d9=
627e5dcd%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637649117156919772%7C=
Unknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL=
CJXVCI6Mn0%3D%7C1000&amp;sdata=3DP7FxYm%2BkJaCkMFa3OHtuKrPOn7SvytFRmYQdIzq7=
rN4%3D&amp;reserved=3D0
> >>>
> >>>
> >>>
> >>> Did I miss something?
> >> I think part of the response was that we did more testing. Alex added
> >> support for DEVICE_GENERIC pages to test_hmm and he ran DAX tests
> >> recommended by Theodore Tso. In that testing he ran into a WARN_ON_ONC=
E
> >> about a zero page refcount in try_get_page. The fix is in the latest
> >> version of patch 2. But it's already obsolete because John Hubbard is
> >> about to remove that function altogether.
> >>
> >> I think the issues you raised were more uncertainty than known bugs. I=
t
> >> seems the fact that you can have DAX pages with 0 refcount is a featur=
e
> >> more than a bug.
> >>
> >> Regards,
> >>    Felix
> >
> > Did you test on a system without CONFIG_ARCH_HAS_PTE_SPECIAL defined?
> > In that case, mmap() of a DAX device will call insert_page() which call=
s
> > get_page() which would trigger VM_BUG_ON_PAGE().
> >
> > I can believe it is OK for PTE_SPECIAL page table entries to have no
> > struct page or that MEMORY_DEVICE_GENERIC struct pages be mapped with
> > a zero reference count using insert_pfn().
> Hi Ralph,
> We have tried the DAX tests with and without CONFIG_ARCH_HAS_PTE_SPECIAL
> defined.
> Apparently none of the tests touches that condition for a DAX device. Of
> course,
> that doesn't mean it could happen.
>
> Regards,
> Alex S.
>
> >
> >
> > I find it hard to believe that other MM developers don't see an issue
> > with a struct page with refcount =3D=3D 0 and mapcount =3D=3D 1.
> >
> > I don't see where init_page_count() is being called for the
> > MEMORY_DEVICE_GENERIC or MEMORY_DEVICE_PRIVATE struct pages the AMD
> > driver allocates and passes to migrate_vma_setup().
> > Looks like svm_migrate_get_vram_page() needs to call init_page_count()
> > instead of get_page(). (I'm looking at branch
> > origin/alexsierrag/device_generic
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit=
hub.com%2FRadeonOpenCompute%2FROCK-Kernel-Driver.git&amp;data=3D04%7C01%7Ca=
lex.sierra%40amd.com%7Cd2bd2d4fbf764528540908d9627e5dcd%7C3dd8961fe4884e608=
e11a82d994e183d%7C0%7C0%7C637649117156919772%7CUnknown%7CTWFpbGZsb3d8eyJWIj=
oiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sda=
ta=3DIXe8HP2s8x5OdJdERBkGOYJCQk3iqCu5AYkwpDL8zec%3D&amp;reserved=3D0)
> Yes, you're right. My bad. Thanks for catching this up. I didn't realize
> I was missing
> to define CONFIG_DEBUG_VM on my build. Therefore this BUG was never caugh=
t.
> It worked after I replaced get_pages by init_page_count at
> svm_migrate_get_vram_page. However, I don't think this is the best way
> to fix it.

You definitly don't want to do that. reiniting the page refcounter is
wrong it should be done once. Nouveau is not a good example here.

> Ideally, get_pages call should work for device pages with ref count
> equal to 0
> too. Otherwise, we could overwrite refcounter if someone else is
> grabbing the page
> concurrently.
> I was thinking to add a special condition in get_pages for dev pages.
> This could
> also fix the insert_page -> get_page call from a DAX device.

What is the issue here exactly ?

>
> Regards,
> Alex S.
> >
> >
> > Also, what about the other places where is_device_private_page() is
> > called?
> > Don't they need to be updated to call is_device_page() instead?
> > One of my goals for this patch was to remove special casing reference
> > counts
> > for ZONE_DEVICE pages in rmap.c, etc.
> Correct, is_device_private_page is still used in rmap, memcontrol and
> migrate.c files
> Looks like rmap and memcontrol should be replaced by is_device_page
> function.

No you do not want to do that. The private case is special case for a reaso=
n.

Jerome
