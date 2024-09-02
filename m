Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A42FA968E7A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 21:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824A10E3B7;
	Mon,  2 Sep 2024 19:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fdrLS3+P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B908E10E3B7
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2024 19:37:55 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-5334c4cc17fso6410660e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 12:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1725305873; x=1725910673;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8kTkaMtZbTOFi94WeEiiNkDEjcRyVv3G+OkzuX2Kg7Q=;
 b=fdrLS3+Pw62NyKMGVvbw5l1Mnc2adsMu4bCyXvP52gT5VejATOSotynuGSAe/4cHYx
 8y2mVC0ChhoTcZe8o7io2mI78Qx07BdXxGLultKuEpqqVYQAfLLBE8IfxO7jU9PZ3AuK
 Uph1NwDVdeM/oMMLgxjKJZx7kxxQl2j+9ZsPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725305873; x=1725910673;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8kTkaMtZbTOFi94WeEiiNkDEjcRyVv3G+OkzuX2Kg7Q=;
 b=Z8KVNrsfK6lmDYlDqMfA+RiiIfBWXoiCIdV8k8AHm77Yt5EJUMuaeYWCMSrQKfSm/m
 obg6nqWKGEJp9jF09rSFQuWRL7fgPcZwrivj6p15fpMF36VxByvhH13+25RHpcfrvq2y
 RCa73CaZNZzFcylaRXZBJovsA5V7fIwaWGukH7e9X0m3Ft9eSAkSaAYdidTuvxlyzsu3
 Rwx3yNFYRjD1HJoVcjVwSRkrXkuVPe7Jvn+2nPzUm7rF3TlQFt7w5TMRTP+eGGmDAFtA
 O8zWeVPqnvYWB2phaIvqxOzJkBCLJ11yOvU7Ij0b5FBl6ttTqDJFL4lptQ4tnleCcSHt
 Hxnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/5IewFK8aD2QTA4vmWNjBk8a7SMcJtVNpPSETGhz28401bGowzgJc6D+T5qaIWAUjTJlegpN7daY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV3XhnL+wnlrxbNGZ0SKSS97AwG6YYJO8eas86wetLx4oeZe16
 4+ZDr3IzbOMWzilxq+row+k8DWWV0t1k52HZ24Xi+o9mwhrLe94UcYg4XSCSZF+PaM7XzyBl7oJ
 CdoMhAg==
X-Google-Smtp-Source: AGHT+IEF9CDikq/N6MM6kMzBiWMiHGhtwNTvEldu9LhjkwuTHGL+clJ4fNTRvgAknF1laYxJlRalkA==
X-Received: by 2002:a05:6512:31d4:b0:52c:90b6:170f with SMTP id
 2adb3069b0e04-53546b3e37cmr9627394e87.29.1725305872512; 
 Mon, 02 Sep 2024 12:37:52 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com.
 [209.85.208.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a898900f6b9sm593033666b.76.2024.09.02.12.37.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Sep 2024 12:37:51 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5c26852af8fso816334a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2024 12:37:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXOmYDTxKJl4EsavAE+riJm7cit772hNfrnzkaIK5Imr3O/3bpJhGwPPTgERBr+DLFbu2c3ZBShAAw=@lists.freedesktop.org
X-Received: by 2002:a05:6402:348f:b0:5be:ed8c:de7 with SMTP id
 4fb4d7f45d1cf-5c21ed3e14bmr12483998a12.11.1725305871261; Mon, 02 Sep 2024
 12:37:51 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tzX71UKndfu8JECMOzc9kf4s4pp9cWTMWwE476cQXt_Yw@mail.gmail.com>
 <CAHk-=wijFJM9MHvwGSS4ADs8ncRagrXYi2E9SvhK8coMH32D7A@mail.gmail.com>
 <CAPM=9txF4+rC_CXQTftPctUd0N37t306YKcV3oKPjz+_zQGqag@mail.gmail.com>
 <440d041982f7f232f0ce3284bed4db391adb05c1.camel@linux.intel.com>
 <5c493bd5-e657-4241-81d7-19ccd380b379@amd.com>
In-Reply-To: <5c493bd5-e657-4241-81d7-19ccd380b379@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Sep 2024 12:37:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wivPvBbaTnKgdH84gtWD-VXUD529L8t8-BxhPEwJvY+4w@mail.gmail.com>
Message-ID: <CAHk-=wivPvBbaTnKgdH84gtWD-VXUD529L8t8-BxhPEwJvY+4w@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.11-rc6
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Alex Deucher <alexdeucher@gmail.com>, 
 lingshan.zhu@amd.com, Matthew Brost <matthew.brost@intel.com>
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

On Mon, 2 Sept 2024 at 03:34, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
>
> Am 02.09.24 um 11:32 schrieb Thomas Hellstr=C3=B6m:
> >
> > The remap_pfn_range was last tried, at least in the context of the i915
> > driver IIRC by Christoph Hellwig but had to be ripped out since it
> > requires the mmap_lock in write mode. Here we have it only in read
> > mode.

Yeah, that does make things much more fragile. The "fill in multiple
pages" helpers are really meant to be used at mmap() time, not as some
kind of fault-around.

So remap_pfn_range() sets the vma flags etc, but it also depends on
being the only one to fill in the ptes, and will be *very* unhappy if
it finds something that has already been filled in.

And fault-around is *much* more fragile because unlike the mmap time
thing, it can happen concurrently with other faults, and you cannot
make assumptions about existing page table layout etc.

> The pre-faulting was increased because of virtualization. When KVM/XEN
> is mapping a BO into a guest the switching overhead for each fault is so
> high that mapping a lot of PFNs at the same time becomes beneficial.

Honestly, from a pure performance standpoint, if you can just do all
the page mapping at mmap() time, that would be *much* much better.

Then you can easily use that remap_pfn_range() function, and latencies
are much less of an issue in general (not because it would be any
faster, but simply because people don't tend to use mmap() in
latency-critical code - but taking a page fault is *easily* very
critical indeed).

                Linus
