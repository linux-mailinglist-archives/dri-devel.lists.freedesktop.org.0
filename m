Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615C29C39A2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 09:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4472F10E433;
	Mon, 11 Nov 2024 08:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="mDaQJ8P0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 178E010E03B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 08:27:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c93e9e701fso7086a12.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 00:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1731313652; x=1731918452;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=oTlZ4xJedYzVMnb4atsTXhQWqyB2ECChSFkUmRbl3i0=;
 b=mDaQJ8P0K3Y0BBBfemBmTfgcs3fct0EtJmBONhnLaWN4++fD6c/cq2uMv44e2Lde2q
 egSX/7yl2CsnnbfNHu9YfDU1Jz4CR+438dYvaz9eyGWA6OG06KaU1+86bzs3qK8kcCwk
 sRhhzayg4t3F4fRriZYwsxxSnKVRf4Faa10r9j1Bz55BoGFSMRKiEXdFIvXvtZdw4VMW
 BeUowd0Otud74LSAyDpypk1JZR+estH4YpXwbzu6xVXCQdVGVPiApHFKCP5L8FPpNKRI
 ga9MHWSFI+SjHWbtFitWt8khMZjMZlcSgez4PVH6C7gmsSJLnAQBlwE2mAu+LP9S+qiV
 NzKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731313652; x=1731918452;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oTlZ4xJedYzVMnb4atsTXhQWqyB2ECChSFkUmRbl3i0=;
 b=QRvO9bV1YYHGAa5W6vcU5lUxvtVoZTjuWr7Q7142wwSHKztv/Q56gCVUldpRfLaFJW
 s9Thh3yfY/W41orDf4bWGmYzF1T2hbbuNj+yO4lRwVBCcndHzULS6jY+CRg7IJcnhsXY
 090ovsm5AyngZR9qh13+TAXO/Q6qQfL2MvxYJYQ7hig9OnBU6KcPq6xrtJL+/2t0CPsT
 ZrWv8qZFLC0C0N+VGF4KBW6fF0/aX7HEffBgpfTMdeVDDh/yduHI7ChDWEQ4ZVqud2ZJ
 BsIeyVDmN779nwYs0UY/mjoCJaLD9lG87s6x/PHD2Uiz3k2D4zLV3K+g1GYQQqxLSDe+
 flAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUxE0lQm3eK9g0wrxb7S9wwd7lp7ThlquHRItgOgNVoKhzHDxYYO/yv45ZmFg4U4paJvlSgTOGWQoo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzzCKv1JnNlCPG3ti1meIdC7JPnE6ovpDBgS8eQ/6LwMg7M1m4/
 iI74iZnHR+4fepATy3hFy01k0n2aNMNFg4H5YQMRLt49j/+BnPOds8gYijENYP3nS/MCMpcLlpp
 MGVKcBF4f6vHa2EHdSj8NAECNGhUlkSNoy+cY
X-Gm-Gg: ASbGncuKh9y5P0knadLmq8Z3gT8aKaK5Wcl1dcXwfGCzEZEJA9veMp0wXmgDyppFaUo
 9FskVS/pAnKAQ7qB1p9vS2puHWBOaZA==
X-Google-Smtp-Source: AGHT+IEsLtD4/gOd20okj8nZ9YDzz7v0ASgpzD8te1wJetCOEqNBZw2DVQaobhIGcOfsx2LNSc32Qzn/r3Tf8+lUjc0=
X-Received: by 2002:a50:999e:0:b0:5ca:18ba:4a79 with SMTP id
 4fb4d7f45d1cf-5cf2273ee9fmr135365a12.7.1731313650537; Mon, 11 Nov 2024
 00:27:30 -0800 (PST)
MIME-Version: 1.0
References: <20241108162040.159038-1-tabba@google.com>
 <20241108170501.GI539304@nvidia.com>
 <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
In-Reply-To: <9dc212ac-c4c3-40f2-9feb-a8bcf71a1246@redhat.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 11 Nov 2024 08:26:54 +0000
Message-ID: <CA+EHjTy3kNdg7pfN9HufgibE7qY1S+WdMZfRFRiF5sHtMzo64w@mail.gmail.com>
Subject: Re: [RFC PATCH v1 00/10] mm: Introduce and use folio_owner_ops
To: David Hildenbrand <david@redhat.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, linux-mm@kvack.org, kvm@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rppt@kernel.org, jglisse@redhat.com, akpm@linux-foundation.org, 
 muchun.song@linux.dev, simona@ffwll.ch, airlied@gmail.com, 
 pbonzini@redhat.com, seanjc@google.com, willy@infradead.org, 
 jhubbard@nvidia.com, ackerleytng@google.com, vannapurve@google.com, 
 mail@maciej.szmigiero.name, kirill.shutemov@linux.intel.com, 
 quic_eberman@quicinc.com, maz@kernel.org, will@kernel.org, qperret@google.com, 
 keirf@google.com, roypat@amazon.co.uk
Content-Type: text/plain; charset="UTF-8"
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

Hi Jason and David,

On Fri, 8 Nov 2024 at 19:33, David Hildenbrand <david@redhat.com> wrote:
>
> On 08.11.24 18:05, Jason Gunthorpe wrote:
> > On Fri, Nov 08, 2024 at 04:20:30PM +0000, Fuad Tabba wrote:
> >> Some folios, such as hugetlb folios and zone device folios,
> >> require special handling when the folio's reference count reaches
> >> 0, before being freed. Moreover, guest_memfd folios will likely
> >> require special handling to notify it once a folio's reference
> >> count reaches 0, to facilitate shared to private folio conversion
> >> [*]. Currently, each usecase has a dedicated callback when the
> >> folio refcount reaches 0 to that effect. Adding yet more
> >> callbacks is not ideal.
> >
>
> Thanks for having a look!
>
> Replying to clarify some things. Fuad, feel free to add additional
> information.

Thanks for your comments Jason, and for clarifying my cover letter
David. I think David has covered everything, and I'll make sure to
clarify this in the cover letter when I respin.

Cheers,
/fuad

>
> > Honestly, I question this thesis. How complex would it be to have 'yet
> > more callbacks'? Is the challenge really that the mm can't detect when
> > guestmemfd is the owner of the page because the page will be
> > ZONE_NORMAL?
>
> Fuad might have been a bit imprecise here: We don't want an ever growing
> list of checks+callbacks on the page freeing fast path.
>
> This series replaces the two cases we have by a single generic one,
> which is nice independent of guest_memfd I think.
>
> >
> > So the point of this is really to allow ZONE_NORMAL pages to have a
> > per-allocator callback?
>
> To intercept the refcount going to zero independent of any zones or
> magic page types, without as little overhead in the common page freeing
> path.
>
> It can be used to implement custom allocators, like factored out for
> hugetlb in this series. It's not necessarily limited to that, though. It
> can be used as a form of "asynchronous page ref freezing", where you get
> notified once all references are gone.
>
> (I might have another use case with PageOffline, where we want to
> prevent virtio-mem ones of them from getting accidentally leaked into
> the buddy during memory offlining with speculative references --
> virtio_mem_fake_offline_going_offline() contains the interesting bits.
> But I did not look into the dirty details yet, just some thought where
> we'd want to intercept the refcount going to 0.)
>
> >
> > But this is also why I suggested to shift them to ZONE_DEVICE for
> > guestmemfd, because then you get these things for free from the pgmap.
>
> With this series even hugetlb gets it for "free", and hugetlb is not
> quite the nail for the ZONE_DEVICE hammer IMHO :)
>
> For things we can statically set aside early during boot and never
> really want to return to the buddy/another allocator, I would agree that
> static ZONE_DEVICE would have possible.
>
> Whenever the buddy or other allocators are involved, and we might have
> granularity as a handful of pages (e.g., taken from the buddy), getting
> ZONE_DEVICE involved is not a good (or even feasible) approach.
>
> After all, all we want is intercept the refcount going to 0.
>
> --
> Cheers,
>
> David / dhildenb
>
