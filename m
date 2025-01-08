Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCE9A05564
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 09:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A635C10E800;
	Wed,  8 Jan 2025 08:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ykq6Cp9P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B010E800
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736325092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fks1UfnnGNBzCgUEzb4PWr1+Sb20YtGUZyEpXGI0Ohc=;
 b=Ykq6Cp9PJju2dwG6XssV2uFitoFwLzsFmer7fq6BCJd5r/pjKqzp8DTA2FZP9VrSMZ/jPH
 E+ziwUr6AGAPVwpeW5dnJbR8BWqmKZT0rcHVeHsjRb7JI3RMQw4ogaGhnKeepK/CISrN/2
 UKhn+Rt1JkD/0ijWkpBGY9VXLoz74pI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-2hVhwM39OXmisSHBTukYEw-1; Wed, 08 Jan 2025 03:31:30 -0500
X-MC-Unique: 2hVhwM39OXmisSHBTukYEw-1
X-Mimecast-MFC-AGG-ID: 2hVhwM39OXmisSHBTukYEw
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43631d8d9c7so2712065e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jan 2025 00:31:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736325089; x=1736929889;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fks1UfnnGNBzCgUEzb4PWr1+Sb20YtGUZyEpXGI0Ohc=;
 b=LioTnGS0NdswhXOiBJbk2NQEyB1i/ojP5k5dUbHnqohc3eGD9Shea9exjIq5QfrSIs
 Nifs7d3rtKTCIXhx6bzcmxVy8fDeHRMWMSYyAnpPJOQlht9qAvRSFZ29nXjFfc9dNDhb
 l9CAPZeKI2lxhXw+ZwHZqWQJaBJs4lalroS53ctZbFilLwJqqTDeYCvxob/tYF4pOYy1
 l2Is9qSlu4mYnFTOb0fmxx2yHXsWrjnjNQizez99uqDnBpoHIbYV0MvGY1/LyBbVqmyz
 OW1K7ysudD97ctkIbERm1blt9nuPRrCcvOdMEURm3L49dY6iImB3s9M015K/J1LA5lYB
 jerw==
X-Gm-Message-State: AOJu0Yy9QIo9lVkFkzyvMXMGmWk3sj+Igt4vFByJhVw0WnCyloN/XUEF
 jUy+685KQDnEbYIEQ7rb7MuCUXiLCDA/+Xi8Um7N/l0V7qsksijNb701waMQljKpeIVU05hE4z3
 DPdGKuGdRjayuhUMtVcQiESO6I18c3HHCEuBkXDNJ+Brs+mmWTYcMM+ySy7b5e+1LFSaRDfQhwm
 mP
X-Gm-Gg: ASbGnctXK0lJ+Eo1WQoQ6oWI7x2nrmCVc3prHk4QcLS6doDD5yiBoReGlTWRweCB05/
 vecU0vqYP3kY9m4FonduVxps1gbTEa3TdweCHFg500/coa9J5JY8HqmeOwKqVKh/KhttE8uPihH
 XZoQRb/skqJGJxupxgrkZokDTeH4hOADxad9glB24wLwzQlpmhC5/eo7Z9fjEbIlaI8FawqM0pF
 VKeo8FqrPzs692dDq98yOxl3O1RN7y4qRUziMe3Zy+tJQ==
X-Received: by 2002:a05:600c:5252:b0:436:e3ea:64dd with SMTP id
 5b1f17b1804b1-436e3ea65a1mr7360715e9.11.1736325088802; 
 Wed, 08 Jan 2025 00:31:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHhi1SveHp3/ZITh9gcTIxVdbqQ7lLSxpVDJC2N5yckAdKNwqhKUJfPy1anow95GcyOyyNNPg==
X-Received: by 2002:a05:600c:5252:b0:436:e3ea:64dd with SMTP id
 5b1f17b1804b1-436e3ea65a1mr7360375e9.11.1736325088320; 
 Wed, 08 Jan 2025 00:31:28 -0800 (PST)
Received: from pollux ([2a00:79c0:618:8300:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828a8dsm52698628f8f.2.2025.01.08.00.31.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 00:31:27 -0800 (PST)
Date: Wed, 8 Jan 2025 09:31:24 +0100
From: Danilo Krummrich <dakr@redhat.com>
To: Tvrtko Ursulin <tursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: Re: [RFC 00/14] Deadline scheduler and other ideas
Message-ID: <Z3433G3-_aIMqJbt@pollux>
References: <20241230165259.95855-1-tursulin@igalia.com>
MIME-Version: 1.0
In-Reply-To: <20241230165259.95855-1-tursulin@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AvKiUyKgkikgMSrZo3b-0dUQe6HnMyAxFyIr_8sRSt0_1736325089
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

On Mon, Dec 30, 2024 at 04:52:45PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

"Deadline scheduler and other ideas"

There's a few patches that could be sent outside the scope of this series, e.g.
the first one.

I think it would make sense to do so.

> 
> <tldr>
> Replacing FIFO with a flavour of deadline driven scheduling and removing round-
> robin. Connecting the scheduler with dma-fence deadlines. First draft and
> testing by different drivers and feedback would be nice. I was only able to test
> it with amdgpu. Other drivers may not even compile.

What are the results from your tests with amdgpu? Do you have some measurements?

> </tldr>
> 
> If I remember correctly Christian mentioned recently (give or take) that maybe
> round-robin could be removed. That got me thinking how and what could be
> improved and simplified. So I played a bit in the scheduler code and came up
> with something which appears to not crash at least. Whether or not there are
> significant advantages apart from maybe code consolidation and reduction is the
> main thing to be determined.
> 
> One big question is whether round-robin can really be removed. Does anyone use
> it, rely on it, or what are even use cases where it is much better than FIFO.
> 
> See "drm/sched: Add deadline policy" commit message for a short description on
> what flavour of deadline scheduling it is. But in essence it should a more fair
> FIFO where higher priority can not forever starve lower priorities.
> 
> "drm/sched: Connect with dma-fence deadlines" wires up dma-fence deadlines to
> the scheduler because it is easy and makes logical sense with this. And I
> noticed userspace already uses it so why not wire it up fully.
> 
> Otherwise the series is a bit of progression from consolidating RR into FIFO
> code paths and going from there to deadline and then to a change in how
> dependencies are handled. And code simplification to 1:1 run queue to scheduler
> relationship, because deadline does not need per priority run queues.
> 
> There is quite a bit of code to go throught here so I think it could be even
> better if other drivers could give it a spin as is and see if some improvements
> can be detected. Or at least no regressions.

Are there improvements with amdgpu?

> 
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> 
> Tvrtko Ursulin (14):
>   drm/sched: Delete unused update_job_credits
>   drm/sched: Remove idle entity from tree
>   drm/sched: Implement RR via FIFO
>   drm/sched: Consolidate entity run queue management
>   drm/sched: Move run queue related code into a separate file
>   drm/sched: Ignore own fence earlier
>   drm/sched: Resolve same scheduler dependencies earlier
>   drm/sched: Add deadline policy
>   drm/sched: Remove FIFO and RR and simplify to a single run queue
>   drm/sched: Queue all free credits in one worker invocation
>   drm/sched: Connect with dma-fence deadlines
>   drm/sched: Embed run queue singleton into the scheduler
>   dma-fence: Add helper for custom fence context when merging fences
>   drm/sched: Resolve all job dependencies in one go
> 
>  drivers/dma-buf/dma-fence-unwrap.c          |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c     |  27 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.h     |   5 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h   |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c |   8 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c     |   8 +-
>  drivers/gpu/drm/scheduler/Makefile          |   2 +-
>  drivers/gpu/drm/scheduler/sched_entity.c    | 316 ++++++-----
>  drivers/gpu/drm/scheduler/sched_fence.c     |   5 +-
>  drivers/gpu/drm/scheduler/sched_main.c      | 587 +++++---------------
>  drivers/gpu/drm/scheduler/sched_rq.c        | 199 +++++++
>  include/drm/gpu_scheduler.h                 |  74 ++-
>  include/linux/dma-fence-unwrap.h            |  31 +-
>  14 files changed, 606 insertions(+), 678 deletions(-)
>  create mode 100644 drivers/gpu/drm/scheduler/sched_rq.c
> 
> -- 
> 2.47.1
> 

