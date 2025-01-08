Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18087A054FB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D9F10E7FD;
	Wed,  8 Jan 2025 08:07:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O1SASSYX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485CE10E7FD
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736323676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MCwHwvtMpXS9EE3ZLwnNwv3ME4DplE3ZRbnA+3shlo4=;
 b=O1SASSYXrPAGyKRProFAdxy5u0e2QIJYV7DYzAoEwHWpib4PoWCm/xrEWiyxbwYRLTpr8o
 raHJHWmPBf+XBb1iYc2OBo1bhIxVZ+jHvIqgVwOXQG8fomA9ZlAJr9PDu+4ip7lG8bQIuV
 ZTQFiqOyke+onmFBo+VrzNptvoegbLs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-HRyjr_E2N8WDHV1XEF_KLQ-1; Wed, 08 Jan 2025 03:07:55 -0500
X-MC-Unique: HRyjr_E2N8WDHV1XEF_KLQ-1
X-Mimecast-MFC-AGG-ID: HRyjr_E2N8WDHV1XEF_KLQ
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2163dc0f5dbso212127565ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 00:07:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736323674; x=1736928474;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MCwHwvtMpXS9EE3ZLwnNwv3ME4DplE3ZRbnA+3shlo4=;
 b=FU7V3Yf1b1qPE7EVG6WsoeuHPCNDOKCfdMqd7KpQVaJrBDrcfqSzXG2kbbrjhU7Ais
 fUJUpW3J+surZqceH9UP7m/AqvgCRk4/zGdoC/K273YvBr4+yiQWiA6Uc0HSd3PYBwOm
 1ktafJgHT/KGGDEmJms/ZgeHZotmFT0J/PHeHIACIon7tVoQPwhuTSv5scJS6t5WxiOk
 5gMyJJYJMKAQc83zNJJ64fZCZRd7Mj4HTa6akCmFwH0TP9CVfCa57DHh0PPu9i3qbK43
 eidUBOGFuQkhTbFMMwk+dNiF0LDDTdXdTMXePcVhY6wvp+AHnB7abLetybB+8zaXryuv
 qsoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU07Cy/LGemLBwUH/qjXq1Mqb4VaPktyBwIBLi7hiMx3Kp3JIcQptWqKCOorDECG+yU0/uernXWNbA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzucgXnFpF2iSAwfTjxQ7WgI/46hszlXUPP1WdVSfOgGL5FdsE3
 t2or6sM7inHw965A0zcGas+5I5o0KI/K5yVTz9cWquIFpY/ii3Sl9z8gCSvMsHgt0omNTTaAAzE
 CaCREYgBsXi8SJ/32SVG12mGReIB6cjrpIUfmQ5+JlhMEXfOshT+d8uC+gM7ENiw5tjiLhFDVew
 ==
X-Gm-Gg: ASbGnctpkIaiUCDtVurK6QJzBD6UluVuQQ5//2huyYBzIxwd/iFMNwvMW57GeVoJIa/
 hLs0D4ZRaghboAQfsPGTJFv2tPAqe4RyKiXFOeJmc0KM8WDn1iCuV8Ba0Bj+14WwNfhmQFNLIsN
 neiWxfWk5gmu0L/I2fOe6SqaaycZHso/QiznHJn01hIeQT/T+Y6MZYxn8O2AG3VUPa3RcJqye2x
 tm0bysUGCXrPJXFMF7TNJ/nZLa424w3V2oiLRgirymwmnQp8wBum5zTQ8mAlXhUjHp1yZ57ijjP
 8rMOga0=
X-Received: by 2002:a05:6a21:339b:b0:1e0:c432:32fe with SMTP id
 adf61e73a8af0-1e88cff3d1amr3098032637.26.1736323674165; 
 Wed, 08 Jan 2025 00:07:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGguCyuY8btQkuTStOqdGx6Fb/eUpOBysrSgiyaCZksx59BRnjLQvaID3nSrjIo6OX4Ogi7aQ==
X-Received: by 2002:a05:6a21:339b:b0:1e0:c432:32fe with SMTP id
 adf61e73a8af0-1e88cff3d1amr3098007637.26.1736323673820; 
 Wed, 08 Jan 2025 00:07:53 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8361b7sm34552765b3a.74.2025.01.08.00.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:07:53 -0800 (PST)
Message-ID: <9ba4f8b8d400d937bff1f4019df68a7625408993.camel@redhat.com>
Subject: Re: AW: [RFC 00/14] Deadline scheduler and other ideas
From: Philipp Stanner <pstanner@redhat.com>
To: Simona Vetter <simona.vetter@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Cc: Tvrtko Ursulin <tursulin@igalia.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Danilo
 Krummrich <dakr@redhat.com>, Matthew Brost <matthew.brost@intel.com>
Date: Wed, 08 Jan 2025 09:07:44 +0100
In-Reply-To: <Z3vfDWrQUYV7k7VJ@phenom.ffwll.local>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <PH7PR12MB568508440AB661A0B168721A83152@PH7PR12MB5685.namprd12.prod.outlook.com>
 <Z3vfDWrQUYV7k7VJ@phenom.ffwll.local>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: d_lYkToR9sQJy1B9gVJQQjVmoUBs-vUSratGnbI5ONA_1736323674
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

On Mon, 2025-01-06 at 14:47 +0100, Simona Vetter wrote:
> On Fri, Jan 03, 2025 at 03:16:56PM +0000, Koenig, Christian wrote:
> > [AMD Official Use Only - AMD Internal Distribution Only]
> >=20
> > Could you send that whole patch set to me once more?
> >=20
> > The AMD mails servers seem to have had a hickup over the holidays
> > and
> > all mails received between ~25.12.2024 and 1.1.2025 are somehow
> > mangled.
>=20
> I seem to have the same issue with fetching from lore.o.k, despite
> that
> the archives seem to be complete. No idea what's happened.

I could pull it just fine with b4

P.

> -Sima
>=20
> >=20
> > Thanks in advance,
> > Christian.
> >=20
> > ________________________________________
> > Von: Tvrtko Ursulin <tursulin@igalia.com>
> > Gesendet: Montag, 30. Dezember 2024 17:52
> > An: dri-devel@lists.freedesktop.org
> > Cc: kernel-dev@igalia.com; Tvrtko Ursulin; Koenig, Christian;
> > Danilo Krummrich; Matthew Brost; Philipp Stanner
> > Betreff: [RFC 00/14] Deadline scheduler and other ideas
> >=20
> > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> >=20
> > <tldr>
> > Replacing FIFO with a flavour of deadline driven scheduling and
> > removing round-
> > robin. Connecting the scheduler with dma-fence deadlines. First
> > draft and
> > testing by different drivers and feedback would be nice. I was only
> > able to test
> > it with amdgpu. Other drivers may not even compile.
> > </tldr>
> >=20
> > If I remember correctly Christian mentioned recently (give or take)
> > that maybe
> > round-robin could be removed. That got me thinking how and what
> > could be
> > improved and simplified. So I played a bit in the scheduler code
> > and came up
> > with something which appears to not crash at least. Whether or not
> > there are
> > significant advantages apart from maybe code consolidation and
> > reduction is the
> > main thing to be determined.
> >=20
> > One big question is whether round-robin can really be removed. Does
> > anyone use
> > it, rely on it, or what are even use cases where it is much better
> > than FIFO.
> >=20
> > See "drm/sched: Add deadline policy" commit message for a short
> > description on
> > what flavour of deadline scheduling it is. But in essence it should
> > a more fair
> > FIFO where higher priority can not forever starve lower priorities.
> >=20
> > "drm/sched: Connect with dma-fence deadlines" wires up dma-fence
> > deadlines to
> > the scheduler because it is easy and makes logical sense with this.
> > And I
> > noticed userspace already uses it so why not wire it up fully.
> >=20
> > Otherwise the series is a bit of progression from consolidating RR
> > into FIFO
> > code paths and going from there to deadline and then to a change in
> > how
> > dependencies are handled. And code simplification to 1:1 run queue
> > to scheduler
> > relationship, because deadline does not need per priority run
> > queues.
> >=20
> > There is quite a bit of code to go throught here so I think it
> > could be even
> > better if other drivers could give it a spin as is and see if some
> > improvements
> > can be detected. Or at least no regressions.
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Danilo Krummrich <dakr@redhat.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Philipp Stanner <pstanner@redhat.com>
> >=20
> > Tvrtko Ursulin (14):
> > =C2=A0 drm/sched: Delete unused update_job_credits
> > =C2=A0 drm/sched: Remove idle entity from tree
> > =C2=A0 drm/sched: Implement RR via FIFO
> > =C2=A0 drm/sched: Consolidate entity run queue management
> > =C2=A0 drm/sched: Move run queue related code into a separate file
> > =C2=A0 drm/sched: Ignore own fence earlier
> > =C2=A0 drm/sched: Resolve same scheduler dependencies earlier
> > =C2=A0 drm/sched: Add deadline policy
> > =C2=A0 drm/sched: Remove FIFO and RR and simplify to a single run queue
> > =C2=A0 drm/sched: Queue all free credits in one worker invocation
> > =C2=A0 drm/sched: Connect with dma-fence deadlines
> > =C2=A0 drm/sched: Embed run queue singleton into the scheduler
> > =C2=A0 dma-fence: Add helper for custom fence context when merging
> > fences
> > =C2=A0 drm/sched: Resolve all job dependencies in one go
> >=20
> > =C2=A0drivers/dma-buf/dma-fence-unwrap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 6 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 27 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_job.h=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h=C2=A0=C2=A0 |=C2=A0=C2=
=A0 8 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 8 +-
> > =C2=A0drivers/gpu/drm/scheduler/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +-
> > =C2=A0drivers/gpu/drm/scheduler/sched_entity.c=C2=A0=C2=A0=C2=A0 | 316 =
++++++-----
> > =C2=A0drivers/gpu/drm/scheduler/sched_fence.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0=C2=A0 5 +-
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 587 +++++-----------
> > ----
> > =C2=A0drivers/gpu/drm/scheduler/sched_rq.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 199 +++++++
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 74 ++-
> > =C2=A0include/linux/dma-fence-unwrap.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 31 +-
> > =C2=A014 files changed, 606 insertions(+), 678 deletions(-)
> > =C2=A0create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> >=20
> > --
> > 2.47.1
> >=20
>=20

