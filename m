Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB17CC0910
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 03:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F8F10E281;
	Tue, 16 Dec 2025 02:08:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ePlFYnDB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7643B10E281
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Dec 2025 02:08:22 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47a95a96d42so10115e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 18:08:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1765850901; cv=none;
 d=google.com; s=arc-20240605;
 b=IhebBzjekoTu3I20/b5PvGLcDwUEg//OZ5O5DJXxCuyDRxaQXv2QiNnBOk3GCT82At
 kGzI8TJhGeNveuVsppwDB3asxHhN0pmWiC31uYRCKmusrt0ZgWL5u//N7aISwFlXWRwI
 3jeIevnpgVZ0hK+m0gEjJVjZ1U/0U5NdTmFRjM/Qrqkbj2U2V+4rjit7RbPqCkZ2MaeR
 sE1lZ7QTFgcDp1lqBfavFbZyoUrJ3GoqGBAlFFs7kl7XUwUVj0klpeUP/Nf/ywViTBR4
 yxS1MdPNp3FbTyO9PDzG9Brb+DH1BJOjHaGN6tLiSJt+nZ8F+TNg57cmm5vpoRTK5o1p
 Fxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
 fh=SeM3TvBit4dvHzh/4TWvKiRzdcU4mXYmPbkvm8UgHlo=;
 b=VxkWJV47pByy1bSghT6SQSQnMsGy+hh7I4Fu+ljbtG99c5A4bXWYMVi3PI5WaQneCu
 cvrL3Bgx/iMNleSRdSG59gGxdXBHlz7MS0qRUgCtF3osG7QFs2eBLX6JdjYBKERoWz28
 57XOGiVfAxhgT3/mEQmGo3rQqYBz1D/hOAGZ4LeWXlVOJsI8khEiMkkr0h2yo934AwiH
 53TVQKdNSeCQiMUyV0MNU6vCXDAHEU4i+pgiw5/u8D4zplQlziNJ9cLPbY6bpHMl5MlA
 xn7XcpNTdGZsExA5zrqLdkWc/5dlXnwjyllEKfxC30n/j7vp2vggoIbGDGhl/s8iXRDf
 KoBA==; darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1765850901; x=1766455701;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
 b=ePlFYnDB66Ce5d3tuj7EnwKDJzgYS1nq9bXa+TQJOAkP+irfxBQ8pj9Mtzez0cuCaq
 eBLIrdvPlhbNMyK45enbNo/3uQJhq6X06UBbDade2snFBMur51qTZxcW43JYSeuRIAuu
 h6ojh9wGwwxqowrGCfJboloJvQ4582jXFqeqHiP8cTbiPYkgjmNuggLCTfdGthTJ5QOm
 0QxDFakmBHaJaQiXOY4WELG5T3Cq64a/UKkz9vXh/5KomynM8wqJzikvMwwK5hTI7oxi
 iFCs3VJUA9hDnty+M/CkIbuP2eQLg+SUw8KOW9CXYhl5K9G33stbdNJ8A3HnRgdREzmG
 O5Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765850901; x=1766455701;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=X5bsBULlMz6QGKo15fJSSkYOWsdYZVhr1CJojovu2xo=;
 b=V5+aOLzkGVCOBjx7pov9OOFCF4UJDEiKIcP6hcPHiNlLvNZD0jLcxQAjARvg/LlYV3
 /ueZkClgl/edf/knWctjAOF+ySu55KuRdf1o/InEkTNTM6XnO0gw0WPwZ+ulXHpoDAOl
 /2jAtDptJYw6wrtb9IWi5c8qMXNz1MQqLcetXTZdB/s5MAMQEqMvb8aEvkKRQE6ygTel
 i/izK/4Gd7QGukpyR7DoPsmTtZ9T20Q+LDU6bBen9CWgr9rRXCs6XEdRQbZR0PeRTdPe
 dPK653Gwd7VjQnlbsYfqMsODN5CyrfOMq6reHOyhTQ0OaNt7qG78SfSIrDcV7VawwyZL
 o/HQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWam2Gbf2kzpUjsRW9sE9KNj9uLWZJbrLMApz5v6NP0D1OK7qqSDfbGjrBbsVl33E1I0FF0Oh7iDwU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCDApqYP5yPpkLLaHeVrKD45tF2n9cVh4jqtzn+PPZFrFQ9xGM
 +ByKh5QCn32FMf2jI/H97ifTdOYFwk+hLSFfZhKIhLIyAj+7jZIwRWPg18WrVXnak+SS2ucebhC
 33VxTpa9TtKje+ti1Ay89qRE3/LCqE3yA8pw7Vdfr
X-Gm-Gg: AY/fxX50j2fDpgB0D1yRZ6nVeEPK6KuLDQztYGeaiDA2Yb0Gq/UJNJ53EmcIew5COYp
 AIxn9sBpkoruINqT1J4PiEUf6xj1fu+T+XioQH60tMf5joyLZ8bv1ZWCvvP/Bcc4XR2w/tzDxUz
 obq+W3zHmveHp5lXr7gVdlL9VnWXAUuPHPvCVPTbYbucmZLF1Zw3SUflFLOCBifODnC8PBmqXv3
 AFj4zpogsi5ljh6YPvMx4SXgQhbBvy1hp5yqMbS02CfSABKhFNgZybIkUc4h4kJxqTUYWPDRFNK
 TuDXBlHlPlpiIA6rA7hp/GYq5V7P
X-Google-Smtp-Source: AGHT+IFy6wLOsC060mVmB9YoWUm0Z5j4XnF5LngURno1tGmqsHKnjp9hIaHtC1jrdIxRXLXpgf9/cJDauopceh8NjdU=
X-Received: by 2002:a05:600c:8a0d:10b0:477:779a:67fc with SMTP id
 5b1f17b1804b1-47bd797450emr116845e9.5.1765850900900; Mon, 15 Dec 2025
 18:08:20 -0800 (PST)
MIME-Version: 1.0
References: <20251211193106.755485-2-echanude@redhat.com>
 <CABdmKX2MPhw121ZG8V+f-XoOReUsCdmcug-cWDg=3WZcJ=NHHA@mail.gmail.com>
 <20251215-sepia-husky-of-eternity-ecf0ce@penduick>
 <07cdcce2-7724-4fe9-8032-258f6161e71d@amd.com>
 <20251215-garnet-cheetah-of-adventure-ca6fdc@penduick>
 <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
In-Reply-To: <ef52d9e9-6abe-421a-98f8-f96353652e1e@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 16 Dec 2025 11:08:09 +0900
X-Gm-Features: AQt7F2ou8MoET7GIPVWKsZ-i26gYeKvHlpUnDll8hGkIZCEC5OR1rT4MBoIc71U
Message-ID: <CABdmKX1XE5dzB9go1AStRY4B5-TrFF4pvCR+JLxPeOahso+ePQ@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: system_heap: account for system heap allocation
 in memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Maxime Ripard <mripard@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, 
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>
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

On Mon, Dec 15, 2025 at 11:53=E2=80=AFPM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 12/15/25 14:59, Maxime Ripard wrote:
> > On Mon, Dec 15, 2025 at 02:30:47PM +0100, Christian K=C3=B6nig wrote:
> >> On 12/15/25 11:51, Maxime Ripard wrote:
> >>> Hi TJ,
> >>>
> >>> On Fri, Dec 12, 2025 at 08:25:19AM +0900, T.J. Mercier wrote:
> >>>> On Fri, Dec 12, 2025 at 4:31=E2=80=AFAM Eric Chanudet <echanude@redh=
at.com> wrote:
> >>>>>
> >>>>> The system dma-buf heap lets userspace allocate buffers from the pa=
ge
> >>>>> allocator. However, these allocations are not accounted for in memc=
g,
> >>>>> allowing processes to escape limits that may be configured.
> >>>>>
> >>>>> Pass the __GFP_ACCOUNT for our allocations to account them into mem=
cg.
> >>>>
> >>>> We had a discussion just last night in the MM track at LPC about how
> >>>> shared memory accounted in memcg is pretty broken. Without a way to
> >>>> identify (and possibly transfer) ownership of a shared buffer, this
> >>>> makes the accounting of shared memory, and zombie memcg problems
> >>>> worse. :\
> >>>
> >>> Are there notes or a report from that discussion anywhere?
> >>>
> >>> The way I see it, the dma-buf heaps *trivial* case is non-existent at
> >>> the moment and that's definitely broken. Any application can bypass i=
ts
> >>> cgroups limits trivially, and that's a pretty big hole in the system.
> >>
> >> Well, that is just the tip of the iceberg.
> >>
> >> Pretty much all driver interfaces doesn't account to memcg at the
> >> moment, all the way from alsa, over GPUs (both TTM and SHM-GEM) to
> >> V4L2.
> >
> > Yes, I know, and step 1 of the plan we discussed earlier this year is t=
o
> > fix the heaps.
> >
> >>> The shared ownership is indeed broken, but it's not more or less brok=
en
> >>> than, say, memfd + udmabuf, and I'm sure plenty of others.
> >>>
> >>> So we really improve the common case, but only make the "advanced"
> >>> slightly more broken than it already is.
> >>>
> >>> Would you disagree?
> >>
> >> I strongly disagree. As far as I can see there is a huge chance we
> >> break existing use cases with that.
> >
> > Which ones? And what about the ones that are already broken?
>
> Well everybody that expects that driver resources are *not* accounted to =
memcg.
>
> >> There has been some work on TTM by Dave but I still haven't found time
> >> to wrap my head around all possible side effects such a change can
> >> have.
> >>
> >> The fundamental problem is that neither memcg nor the classic resource
> >> tracking (e.g. the OOM killer) has a good understanding of shared
> >> resources.
> >
> > And yet heap allocations don't necessarily have to be shared. But they
> > all have to be allocated.
> >
> >> For example you can use memfd to basically kill any process in the
> >> system because the OOM killer can't identify the process which holds
> >> the reference to the memory in question. And that is a *MUCH* bigger
> >> problem than just inaccurate memcg accounting.
> >
> > When you frame it like that, sure. Also, you can use the system heap to
> > DoS any process in the system. I'm not saying that what you're concerne=
d
> > about isn't an issue, but let's not brush off other people legitimate
> > issues as well.
>
> Completely agree, but we should prioritize.
>
> That driver allocated memory is not memcg accounted is actually uAPI, e.g=
. that is not something which can easily change.
>
> While fixing the OOM killer looks perfectly doable and will then most lik=
ely also show a better path how to fix the memcg accounting.

You think so? I can see how the OOM killer could identify that a
process is using a dmabuf and include that memory use for its decision
making, but the memory for it won't be reclaimed unless *all* users
get killed, which isn't easily known right now.

> Christian.
>
> >
> > Maxime
>
