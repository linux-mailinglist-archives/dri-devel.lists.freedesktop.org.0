Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC123AE58FF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 03:13:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8640810E1FE;
	Tue, 24 Jun 2025 01:13:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="J9duUTUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6967C10E1FE
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 01:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750727591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N2tGbCUo/DT98ekW0QzjXKAmpAyFNKjENuliAc3v0g4=;
 b=J9duUTUtNVKyvFhU1TnrdtSb3C0TnsqAZyHyKw3EyfmjNrYD/pVA93Ix4vPjoVc+0nIH7V
 sIQx9oFzJPvnuxCmYgr5MhZW8oYWYR9037DIKVvMJq1mjIGOWICq4dLr9vmvsQ2Qa1zROU
 VCgf4axUB8LS/HuJQKCwEkJkvmfT3Ew=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-455-IlEQQzHJMSmy4l2wC7HuOw-1; Mon, 23 Jun 2025 21:13:09 -0400
X-MC-Unique: IlEQQzHJMSmy4l2wC7HuOw-1
X-Mimecast-MFC-AGG-ID: IlEQQzHJMSmy4l2wC7HuOw_1750727589
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-312df02acf5so3514747a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jun 2025 18:13:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750727588; x=1751332388;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=N2tGbCUo/DT98ekW0QzjXKAmpAyFNKjENuliAc3v0g4=;
 b=biwRC2MxIkwSX3me25LTYgN9MG8lrylwA4DfO2V6oAm9jv4uZ7xImxqDgm6tYS0VvE
 Ku/noJxt/DFSzz635OIIqDdliDfRD6L2gxIkCHcfLnRF3LnuVeMZlAJoLQP6TFMXyqHy
 mW/JtifFZeEBoCwAcnInFZs17XL+7DwQ9uvV1cI4oZUManIaKeucbulDKqAeqEfZYAqY
 v+wL8AQX7AROQskGTDHK6AZJB9LkK7XMuhBceNdtfBokwi2cxxVX3+tyEdA8MVRL+Uv4
 Gq2ASaNvtdOQjxg1i8Gxj8nhbB6GMRST1sNRm9AnSXYy9wYZtwM27TaZ0Mynd7dnExMj
 rkAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPaJPGuTcegqQxKnD6VhoMYFQaCQ9cY1M2KeKntIAg5FTHlVj+0V4ctONjLOxA6tfO+wT58d59WZ0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYPOHDVetHll+KFWZ6Zc9mRjZ7HDeK3kkZNQcOzXlJk414Z7sV
 17bPoJP4cP0Y3fjZM2fQfg6vVf+nEOfXveYnUY0oURIUM4m23G6J3Q4N7P+3WAupZjYHK6b24oq
 TnJ78txNViJS5XUsjFW+waHjpQrekH9JlW+6DIWmqtynXRw99JNiDC75lIEIgdpitR3kKq8jWIs
 N8aW3XEhFI/QkKu7Mk4aN4lAWMnyVTqPpYpwBXPi9yiJxq
X-Gm-Gg: ASbGncsnrEJxIrzXDupR4yZbU5HOuxCXDhqbA5ekXUKZD3r4WmAMDnJ/Pik/l/DU863
 ROIyBf3fdyhD+iMQi42cKHJWwVca4+5BL9iiwrbexfEKGcsdZE9KnqMmDW+3B+Vw+fIFjHwEMII
 mCbA==
X-Received: by 2002:a17:90b:35c3:b0:313:d361:73d7 with SMTP id
 98e67ed59e1d1-315cccecb18mr2164207a91.13.1750727588632; 
 Mon, 23 Jun 2025 18:13:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsQNmhJBSGFRuS8o5jd1MRwK+2/7DeMzdFr6CGPS/Bmy9Yrf4+E7T7zDcaY+RjQfxGcisrAhQnQhUcHJ3ztJc=
X-Received: by 2002:a17:90b:35c3:b0:313:d361:73d7 with SMTP id
 98e67ed59e1d1-315cccecb18mr2164175a91.13.1750727588183; Mon, 23 Jun 2025
 18:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250619072026.635133-1-airlied@gmail.com>
 <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
In-Reply-To: <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 24 Jun 2025 11:12:56 +1000
X-Gm-Features: AX0GCFsc9jtESfggHiHxBG7I-UMTYHnzmvg1EjimOYK8Axjo4b-BQw1Xp5GOM5s
Message-ID: <CAMwc25ruHtW165VRuDv5_tjaZGcL5H9CWeTjcCstXK09bDPhdw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Matthew Brost <matthew.brost@intel.com>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NnCRvRHMIANSVaQ6yukWkT6KuAaLiAD6NAvfF7nPnk4_1750727589
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Jun 23, 2025 at 6:54=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 6/19/25 09:20, Dave Airlie wrote:
> > From: Dave Airlie <airlied@redhat.com>
> >
> > While discussing memcg intergration with gpu memory allocations,
> > it was pointed out that there was no numa/system counters for
> > GPU memory allocations.
> >
> > With more integrated memory GPU server systems turning up, and
> > more requirements for memory tracking it seems we should start
> > closing the gap.
> >
> > Add two counters to track GPU per-node system memory allocations.
> >
> > The first is currently allocated to GPU objects, and the second
> > is for memory that is stored in GPU page pools that can be reclaimed,
> > by the shrinker.
> >
> > Cc: Christian Koenig <christian.koenig@amd.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > Cc: linux-mm@kvack.org
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Dave Airlie <airlied@redhat.com>
> >
> > ---
> >
> > v2: add more info to the documentation on this memory.
> >
> > I'd like to get acks to merge this via the drm tree, if possible,
> >
> > Dave.
> > ---
> >  Documentation/filesystems/proc.rst | 8 ++++++++
> >  drivers/base/node.c                | 5 +++++
> >  fs/proc/meminfo.c                  | 6 ++++++
> >  include/linux/mmzone.h             | 2 ++
> >  mm/show_mem.c                      | 9 +++++++--
> >  mm/vmstat.c                        | 2 ++
> >  6 files changed, 30 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesys=
tems/proc.rst
> > index 5236cb52e357..7cc5a9185190 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fie=
lds.
> >      CmaFree:               0 kB
> >      Unaccepted:            0 kB
> >      Balloon:               0 kB
> > +    GPUActive:             0 kB
> > +    GPUReclaim:            0 kB
>
> Active certainly makes sense, but I think we should rather disable the po=
ol on newer CPUs than adding reclaimable memory here.

I'm not just concerned about newer platforms though, even on Fedora 42
on my test ryzen1+7900xt machine, with a desktop session running

nr_gpu_active 7473
nr_gpu_reclaim 6656

It's not an insignificant amount of memory. I also think if we get to
some sort of discardable GTT objects with a shrinker they should
probably be accounted in reclaim.

Dave.

