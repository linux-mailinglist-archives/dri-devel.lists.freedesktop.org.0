Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A78023B4
	for <lists+dri-devel@lfdr.de>; Sun,  3 Dec 2023 13:21:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA4510E2CD;
	Sun,  3 Dec 2023 12:21:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com
 [IPv6:2607:f8b0:4864:20::933])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BE810E1EB;
 Sat,  2 Dec 2023 14:50:49 +0000 (UTC)
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-7c46c7bc538so985252241.3; 
 Sat, 02 Dec 2023 06:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701528648; x=1702133448; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1ixg28vCNyeYFge8+qwTnb3fR5Cn16tF+NefpRupJIo=;
 b=k1tbGjKJFz72vQQSJHBuAK1MdahleUWjkfNmYUmMZWuVK4Vaw18cJ2aauuXJZD7XTi
 iw6qORjLv71LdYiFdGXLUZDE8G95yWqpY6icntieVTQa89gIAm1ra5WszR3oI0l4Jxti
 NtwvC0k9TcP84OruN1D13i4KeWqrG8VufYshRF9i1S+MdoYyXBkCVtByj5Vpzh/yHAKK
 mr6cC+I3V5mZ4fQ8UMO6kjYGNVHWhueJnfyboKoFFqTtSV++tInsdrAk/jPBrhKjlH9R
 Hi7NP6cFsNqteRNNXC9vp45llDJAzd8yBdQhIXrzmAT474SwLIm9h1EvANCfdKRSRAiK
 kQAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701528648; x=1702133448;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1ixg28vCNyeYFge8+qwTnb3fR5Cn16tF+NefpRupJIo=;
 b=CA39W95puG/uUxIlDtq0EAZuYHvVrRQnN5M/P7ooj8LlfWAfHRQkj/jy2Lg3HnKtTm
 V1xWAeW8UuFrl4VK51kt0rlERDrCMOIlta7KiWMvnSrFveD/2rhb6mwZyg4lEaHmUyfB
 JUADlamoeJrU+IzwQO4uv48eFv6E9+JRtyfssV7nLNNz1x4kz/0JaO8glgpsi9bplSI0
 yi2JuXZn/DumO87s8Y913cLLx8LWkExlmzl9V0jAGWzqf3KbYGX084tZ3bNmavHgZcjV
 ZixBtkCFvATQI625fshfjXwJFBcZbOWCFuoy3+tirzAxUz2Z67IJUPJ3T68W+sC3tBo9
 F/Ng==
X-Gm-Message-State: AOJu0YwI2QDsNWEATAzefolpctxmOsMtVqRRX0prTc08DLxWWjqae/At
 KuXJDf2Ejs4NamJwvExxrJ5oJh1xcfVN8D3hqSU=
X-Google-Smtp-Source: AGHT+IE8qec2C6k83JGXnys0GKx41rq3i+6tLZnIp70pSrjs+tyidT8f0JZ+1VYuv6XjXPDL9j5GVHRqH6qDQRBzggY=
X-Received: by 2002:a67:e989:0:b0:464:4aca:51e8 with SMTP id
 b9-20020a67e989000000b004644aca51e8mr431734vso.35.1701528648668; Sat, 02 Dec
 2023 06:50:48 -0800 (PST)
MIME-Version: 1.0
References: <20231128125025.4449-1-weixi.zhu@huawei.com>
 <20231128125025.4449-3-weixi.zhu@huawei.com>
 <e4eb5a24-e9cf-4944-9614-df5f5f3a7163@redhat.com>
In-Reply-To: <e4eb5a24-e9cf-4944-9614-df5f5f3a7163@redhat.com>
From: Pedro Falcato <pedro.falcato@gmail.com>
Date: Sat, 2 Dec 2023 14:50:37 +0000
Message-ID: <CAKbZUD25mwVXowDcN1Cj5Op9wRAopYhYZcesR0tk2r_Wn-d95g@mail.gmail.com>
Subject: Re: [RFC PATCH 2/6] mm/gmem: add arch-independent abstraction to
 track address mapping status
To: David Hildenbrand <david@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Sun, 03 Dec 2023 12:21:37 +0000
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
Cc: dri-devel@lists.freedesktop.org, linux-mm@kvack.org, leonro@nvidia.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, mgorman@suse.de,
 ziy@nvidia.com, zhi.a.wang@intel.com, rcampbell@nvidia.com, jgg@nvidia.com,
 weixi.zhu@openeuler.sh, jhubbard@nvidia.com, intel-gfx@lists.freedesktop.org,
 mhairgrove@nvidia.com, jglisse@redhat.com, Weixi Zhu <weixi.zhu@huawei.com>,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 tvrtko.ursulin@linux.intel.com, Felix.Kuehling@amd.com, Xinhui.Pan@amd.com,
 linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 alexander.deucher@amd.com, akpm@linux-foundation.org, ogabbay@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 1, 2023 at 9:23=E2=80=AFAM David Hildenbrand <david@redhat.com>=
 wrote:
>
> On 28.11.23 13:50, Weixi Zhu wrote:
> > This patch adds an abstraction layer, struct vm_object, that maintains
> > per-process virtual-to-physical mapping status stored in struct gm_mapp=
ing.
> > For example, a virtual page may be mapped to a CPU physical page or to =
a
> > device physical page. Struct vm_object effectively maintains an
> > arch-independent page table, which is defined as a "logical page table"=
.
> > While arch-dependent page table used by a real MMU is named a "physical
> > page table". The logical page table is useful if Linux core MM is exten=
ded
> > to handle a unified virtual address space with external accelerators us=
ing
> > customized MMUs.
>
> Which raises the question why we are dealing with anonymous memory at
> all? Why not go for shmem if you are already only special-casing VMAs
> with a MMAP flag right now?
>
> That would maybe avoid having to introduce controversial BSD design
> concepts into Linux, that feel like going a step backwards in time to me
> and adding *more* MM complexity.
>
> >
> > In this patch, struct vm_object utilizes a radix
> > tree (xarray) to track where a virtual page is mapped to. This adds ext=
ra
> > memory consumption from xarray, but provides a nice abstraction to isol=
ate
> > mapping status from the machine-dependent layer (PTEs). Besides support=
ing
> > accelerators with external MMUs, struct vm_object is planned to further
> > union with i_pages in struct address_mapping for file-backed memory.
>
> A file already has a tree structure (pagecache) to manage the pages that
> are theoretically mapped. It's easy to translate from a VMA to a page
> inside that tree structure that is currently not present in page tables.
>
> Why the need for that tree structure if you can just remove anon memory
> from the picture?
>
> >
> > The idea of struct vm_object is originated from FreeBSD VM design, whic=
h
> > provides a unified abstraction for anonymous memory, file-backed memory=
,
> > page cache and etc[1].
>
> :/
>
> > Currently, Linux utilizes a set of hierarchical page walk functions to
> > abstract page table manipulations of different CPU architecture. The
> > problem happens when a device wants to reuse Linux MM code to manage it=
s
> > page table -- the device page table may not be accessible to the CPU.
> > Existing solution like Linux HMM utilizes the MMU notifier mechanisms t=
o
> > invoke device-specific MMU functions, but relies on encoding the mappin=
g
> > status on the CPU page table entries. This entangles machine-independen=
t
> > code with machine-dependent code, and also brings unnecessary restricti=
ons.
>
> Why? we have primitives to walk arch page tables in a non-arch specific
> fashion and are using them all over the place.
>
> We even have various mechanisms to map something into the page tables
> and get the CPU to fault on it, as if it is inaccessible (PROT_NONE as
> used for NUMA balancing, fake swap entries).
>
> > The PTE size and format vary arch by arch, which harms the extensibilit=
y.
>
> Not really.
>
> We might have some features limited to some architectures because of the
> lack of PTE bits. And usually the problem is that people don't care
> enough about enabling these features on older architectures.
>
> If we ever *really* need more space for sw-defined data, it would be
> possible to allocate auxiliary data for page tables only where required
> (where the features apply), instead of crafting a completely new,
> auxiliary datastructure with it's own locking.
>
> So far it was not required to enable the feature we need on the
> architectures we care about.
>
> >
> > [1] https://docs.freebsd.org/en/articles/vm-design/
>
> In the cover letter you have:
>
> "The future plan of logical page table is to provide a generic
> abstraction layer that support common anonymous memory (I am looking at
> you, transparent huge pages) and file-backed memory."
>
> Which I doubt will happen; there is little interest in making anonymous
> memory management slower, more serialized, and wasting more memory on
> metadata.

Also worth noting that:

1) Mach VM (which FreeBSD inherited, from the old BSD) vm_objects
aren't quite what's being stated here, rather they are somewhat
replacements for both anon_vma and address_space[1]. Very similarly to
Linux, they take pages from vm_objects and map them in page tables
using pmap (the big difference is anon memory, which has its
bookkeeping in page tables, on Linux)

2) These vm_objects were a horrendous mistake (see CoW chaining) and
FreeBSD has to go to horrendous lengths to make them tolerable. The
UVM paper/dissertation (by Charles Cranor) talks about these issues at
length, and 20 years later it's still true.

3) Despite Linux MM having its warts, it's probably correct to
consider it a solid improvement over FreeBSD MM or NetBSD UVM

And, finally, randomly tacking on core MM concepts from other systems
is at best a *really weird* idea. Particularly when they aren't even
what was stated!

[1] If you really can't use PTEs, I don't see how you can't use file
mappings and/or some vm_operations_struct workarounds, when the
patch's vm_object is literally just an xarray with a different name

--=20
Pedro
