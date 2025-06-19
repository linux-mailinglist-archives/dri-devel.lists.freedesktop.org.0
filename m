Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15D99ADFA56
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 02:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B6A10E4E8;
	Thu, 19 Jun 2025 00:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hcccCpbK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E087E10E4E8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 00:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750293772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Pe2k0icdwqpd4w/wA67sebAWmODKh8BWDjcuUYYdUoQ=;
 b=hcccCpbKR6qUoy7Bh4Kx7HqDWcgzjOoLVcKH91UrNFrOoGkba2zX388GHPwf416BetXkGw
 4FdgTh4lbz517aMj0KtYZFRNmnCvqsM2KlLBtlzeEDperbVqvFQF4Qm38AEH76BECqh9E8
 9qs5/ovHDiDt/SW1dGCDN0dk8gT20Zc=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-iwq2awKXPauL--9FTOYJ6Q-1; Wed, 18 Jun 2025 20:42:50 -0400
X-MC-Unique: iwq2awKXPauL--9FTOYJ6Q-1
X-Mimecast-MFC-AGG-ID: iwq2awKXPauL--9FTOYJ6Q_1750293770
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3138e65efe2so134517a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 17:42:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750293769; x=1750898569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Pe2k0icdwqpd4w/wA67sebAWmODKh8BWDjcuUYYdUoQ=;
 b=MMzqyfXIunyktpUTtfnEKPoxs+qYjssr4hDwTLqgqjPtV4S4JRMRP3A9N2988/pB+K
 54jzIO8eudwUChVxp2ZnebTymWtrRFBeu3bsyd9npdjW0soTiMMVAbEEEmQP78Fk084f
 prCg3M0IrJxGegRzZ2N1cCQXK4Iz8OMQ22speb4lEggHKvQxv+OlfaPjleArPnr8Dpri
 X0Fh1ynAcxNz/7MpuFcooi6oX2l4hV791zIAtB8ztWThJq+gejIpwbRuA4fELNZIXaXF
 wJCxrC0sSpFTNLN2+Z0bZ0oKX2rbAEEzVBw5UlJ7UZhUrqJkOIRr73Y90ahJKnbUfvWS
 OUcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkdFhMeA2Fh0XmUSKMeCVkdQFC0IxltoW9slUU+gyYGvcAJv9ELGogmejh+KoZFS6DJrjVJqPan0Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyowl34hJ/c9zbh3tHtwEQsfzHnCoYQJIgUPsZ+mzA8ABeTROiq
 UnipLY3/27arbrAfgzXJzHSPi+xMnY9FpvtH7Bu+LlKft+pMKnvCgV9nUTJKi1e9d9fF+0w8wTs
 hj/MXZaWAHne4P41qzaAIOW7PCVBvWDTPUYTSAO/2mrj/SA5n5PG32fVsO0S1fFpe7Bq4YcRwIf
 Qz0UOBucC90Lmu2tZQe2UbMDpR3t3nAGL0R48oJZ/OiCnN
X-Gm-Gg: ASbGncteEgLrGsccaAQp3YKxpyuLYTlxO1pRwdhjUIPqb6cLAeJV/GUOIxrjy0hC538
 qJpuTvbQ7WiuaXOSt3LZIIe05tH9eP+UdjwiXcZ67wv6DLIf/691+44wIiaWYJ20uvDz+qn9ZA9
 uyNQ==
X-Received: by 2002:a17:90b:3143:b0:311:c596:5c6f with SMTP id
 98e67ed59e1d1-313f1d5efd9mr32256520a91.17.1750293769501; 
 Wed, 18 Jun 2025 17:42:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIIlFuzoH/5qCUw2+angE5OPLXFvYSG3YUBq+YUMApbItuXGjmzNmKE5PwmZXsw8dCzGlzAruYOOBot7UeVb8=
X-Received: by 2002:a17:90b:3143:b0:311:c596:5c6f with SMTP id
 98e67ed59e1d1-313f1d5efd9mr32256493a91.17.1750293769067; Wed, 18 Jun 2025
 17:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250618040618.564650-1-airlied@gmail.com>
 <6yxpihotsrg73dmlr2fajga2b7qbdnsroi2tq7alohrqt56dx3@sjyoy4yg2ck7>
In-Reply-To: <6yxpihotsrg73dmlr2fajga2b7qbdnsroi2tq7alohrqt56dx3@sjyoy4yg2ck7>
From: David Airlie <airlied@redhat.com>
Date: Thu, 19 Jun 2025 10:42:37 +1000
X-Gm-Features: AX0GCFuJhXX4C_1px9RQtna8BYsmm3A0K_QbTxFUqdVZfCNxrpaTdYIrldCVZjI
Message-ID: <CAMwc25rd7Tgvmdm4b3HeEqi1Nw+NDSc1d6wQX4hrNVsQD-OQPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 Christian Koenig <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org, 
 Andrew Morton <akpm@linux-foundation.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6CJC7EdK_5BNmKfIi9FwYqe4Off6ISgUeh7j6N4Iy2U_1750293770
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

On Thu, Jun 19, 2025 at 10:33=E2=80=AFAM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> On Wed, Jun 18, 2025 at 02:06:17PM +1000, Dave Airlie wrote:
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
> > I'd like to get acks to merge this via the drm tree, if possible,
> >
> > Dave.
> > ---
> >  Documentation/filesystems/proc.rst | 6 ++++++
> >  drivers/base/node.c                | 5 +++++
> >  fs/proc/meminfo.c                  | 6 ++++++
> >  include/linux/mmzone.h             | 2 ++
> >  mm/show_mem.c                      | 9 +++++++--
> >  mm/vmstat.c                        | 2 ++
> >  6 files changed, 28 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesys=
tems/proc.rst
> > index 5236cb52e357..45f61a19a790 100644
> > --- a/Documentation/filesystems/proc.rst
> > +++ b/Documentation/filesystems/proc.rst
> > @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fie=
lds.
> >      CmaFree:               0 kB
> >      Unaccepted:            0 kB
> >      Balloon:               0 kB
> > +    GPUActive:             0 kB
> > +    GPUReclaim:            0 kB
> >      HugePages_Total:       0
> >      HugePages_Free:        0
> >      HugePages_Rsvd:        0
> > @@ -1273,6 +1275,10 @@ Unaccepted
> >                Memory that has not been accepted by the guest
> >  Balloon
> >                Memory returned to Host by VM Balloon Drivers
> > +GPUActive
> > +              Memory allocated to GPU objects
> > +GPUReclaim
> > +              Memory in GPU allocator pools that is reclaimable
>
> Can you please explain a bit more about these GPUActive & GPUReclaim?
> Please correct me if I am wrong, GPUActive is the total memory used by
> GPU objects and GPUReclaim is the subset of GPUActive which is
> reclaimable (possibly through shrinkers).

Currently,
GPUActive is total memory used by active GPU objects.
GPUReclaim is the amount of memory (not a subset of Active) that is
being stored in GPU reusable pools, that can be retrieved via a simple
shrinker. (this memory usually has different page table attributes,
uncached or writecombined).

Example workflow:
User allocates cached system RAM for GPU object:
Active increases,
Free cached system RAM,
Active decreases.

User allocates write combined system RAM for GPU object:
Active increases
Free write combined system RAM
Active decreases,
Reclaim increases
User allocates another WC system RAM object:
Reclaim decreases
Active increases
Shrinker shrinks the pool:
Reclaim decreases.

There could be in the future a 3rd type of memory which I'm not sure
it if necessary to account at this level, but it would be Active
memory that the driver considers discardable, and could be shrunk
easily, but I'm not seeing much consistency on usage in drivers for
this, or even what use case it is needed for, so I'm not going to
address it yet. This could end up in Reclaim, but I'd need to see the
use cases for it.

Dave.

