Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EAAA58171
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD5010E21C;
	Sun,  9 Mar 2025 08:08:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SbNsWys8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2F110E21C
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 08:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741507694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VMLbs4g+4S3w8PTcwZhqCiZ4jHgvhgmMpYzifm6s+EY=;
 b=SbNsWys8uYmuQELkadRLZhHt2ajZxt53tjndRg5kh2twPvKMzb43TO8NCsZSiSZ7Qiux6d
 ZTpV/GWIqq94nOI2WRno+sdIl1GqzNeKv5FLd77JY5YdPDo2y47UkU3uy15vEvoTcsllBz
 20UgQqlt4TCc3CZdCmNaSeN+e9aoqWM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-634-YDwsFhRLMZ2D9XrzH2OdBA-1; Sun, 09 Mar 2025 04:08:12 -0400
X-MC-Unique: YDwsFhRLMZ2D9XrzH2OdBA-1
X-Mimecast-MFC-AGG-ID: YDwsFhRLMZ2D9XrzH2OdBA_1741507691
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-ac297c7a0c2so8948566b.3
 for <dri-devel@lists.freedesktop.org>; Sun, 09 Mar 2025 00:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741507691; x=1742112491;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VMLbs4g+4S3w8PTcwZhqCiZ4jHgvhgmMpYzifm6s+EY=;
 b=IV1IB8HjuxECpc/t+eSoZtpyHGVSbPiCQHT3CbOHrXLjevzeLkcXt1Z8vczHPqcRHX
 yhFXZhITZRW2S6sceGN1GGFd09KiAYGm/TLKoomF6ZtzEalPjWAExjLrTn5SqS/HFuTX
 oS0aZ1CQvZRKySEtma7xSKJRCMUhjrfEVuo7DGDk8Bhov8wrRW4Qell6eUu5dWsdPn4d
 GIugwaalFojzf7Rrhv+M8dJpsAqxj3lPX4Vsqh7OBw90u/e+NgIcx6MwYj1j6HJXjFVt
 IF437JnP7x11zjzwsFt2iFq7C4C+yd8zVQuh6QF8gOMHlQlViAAu56UiGHJvALDqVucK
 elSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsYDgbX7SNGkEvFx/8aPho8W5LKc7J5qj7MwlybcMZdSudQrCCk9uTPu8e2gf+nMsPG7eK+ynvArE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuayD/nJego/qKiWsLFUDS9UG3/TpKyYxm+5vLCQOrAqc/5VeV
 +6i2U8DMIy4DVg4vCWb5c0WZTfEQw9J6+Yi5AU88FrtftBkGNRchop34HVPUFnTdNc5f9CwkvK4
 LOgQGrUJvllVMmnOYwyF+Fp0rJE1y2w7F0SngE3Le+wqsN0xc0GO6sPy4K9whhzUmWlc2daPSoD
 O3iQK3g4KYukThSHyyG4hBJNXPZbKJS7//w0Y8wztP
X-Gm-Gg: ASbGncsQTI/IgcfWTl9SKTtC0PmRJEGBKomEtH9mkvIFEWBhv80Ynqkv7AfT7SvWK3a
 9fjfT3IfIq6Q0SpIpXC3Y+5rhMhjp3U7MDVlITQNvDFOV/QidlRRGo/kBw1sYekbO3ltoTAlpDT
 EDE9e6k2lfC0R1ieDaK5uMLo2onbyW
X-Received: by 2002:a17:907:c99b:b0:abf:5778:f949 with SMTP id
 a640c23a62f3a-ac252e9ebd1mr767362966b.42.1741507690643; 
 Sun, 09 Mar 2025 00:08:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7U1iyGgohuKugYCzgXBl6WixJZcBRcoUmHFNJf08mvE/aZ1aJlHcdE0jtRjcmbMxi9Sw/rCbNZ3E/zzGi4b0=
X-Received: by 2002:a17:907:c99b:b0:abf:5778:f949 with SMTP id
 a640c23a62f3a-ac252e9ebd1mr767360566b.42.1741507690308; Sun, 09 Mar 2025
 00:08:10 -0800 (PST)
MIME-Version: 1.0
References: <20250305152555.318159-1-ryasuoka@redhat.com>
 <20250305152555.318159-2-ryasuoka@redhat.com>
 <Z8kp9Z9VgTpQmV9d@casper.infradead.org>
 <3bfd4238-6954-41a3-a5a3-8515a3ac9dce@redhat.com>
 <Z8nEqDQhjU-Ly8Js@phenom.ffwll.local>
 <51c11147-4927-4ebc-9737-fd1eebe4e0bd@redhat.com>
In-Reply-To: <51c11147-4927-4ebc-9737-fd1eebe4e0bd@redhat.com>
From: Ryosuke Yasuoka <ryasuoka@redhat.com>
Date: Sun, 9 Mar 2025 17:07:59 +0900
X-Gm-Features: AQ5f1Jom-CKnJdgtaquTd67G5uzgxxqs44dKctiQ9yfQQxkLNniKi8t6ppg6oo4
Message-ID: <CAHpthZqn7ZZW1ekFQe7nN0+xfsNvMQMKhjMNcB3EyQ18yfQhiA@mail.gmail.com>
Subject: Re: [PATCH drm-next 1/2] vmalloc: Add atomic_vmap
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Matthew Wilcox <willy@infradead.org>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com, 
 akpm@linux-foundation.org, urezki@gmail.com, hch@infradead.org, 
 dmitry.osipenko@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-mm@kvack.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VB_wnYO41PN5wVouFsdOwqFkMhwjmp5yYIHYeqVl3bQ_1741507691
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

On Fri, Mar 7, 2025 at 4:55=E2=80=AFPM Jocelyn Falempe <jfalempe@redhat.com=
> wrote:
>
> On 06/03/2025 16:52, Simona Vetter wrote:
> > On Thu, Mar 06, 2025 at 02:24:51PM +0100, Jocelyn Falempe wrote:
> >> On 06/03/2025 05:52, Matthew Wilcox wrote:
> >>> On Thu, Mar 06, 2025 at 12:25:53AM +0900, Ryosuke Yasuoka wrote:
> >>>> Some drivers can use vmap in drm_panic, however, vmap is sleepable a=
nd
> >>>> takes locks. Since drm_panic will vmap in panic handler, atomic_vmap
> >>>> requests pages with GFP_ATOMIC and maps KVA without locks and sleep.
> >>>
> >>> In addition to the implicit GFP_KERNEL allocations Vlad mentioned, ho=
w
> >>> is this supposed to work?
> >>>
> >>>> +  vn =3D addr_to_node(va->va_start);
> >>>> +
> >>>> +  insert_vmap_area(va, &vn->busy.root, &vn->busy.head);
> >>>
> >>> If someone else is holding the vn->busy.lock because they're modifyin=
g the
> >>> busy tree, you'll corrupt the tree.  You can't just say "I can't take=
 a
> >>> lock here, so I won't bother".  You need to figure out how to do some=
thing
> >>> safe without taking the lock.  For example, you could preallocate the
> >>> page tables and reserve a vmap area when the driver loads that would
> >>> then be usable for the panic situation.  I don't know that we have AP=
Is
> >>> to let you do that today, but it's something that could be added.
> >>>
> >> Regarding the lock, it should be possible to use the trylock() variant=
, and
> >> fail if the lock is already taken. (In the panic handler, only 1 CPU r=
emain
> >> active, so it's unlikely the lock would be released anyway).
> >>
> >> If we need to pre-allocate the page table and reserve the vmap area, m=
aybe
> >> it would be easier to just always vmap() the primary framebuffer, so i=
t can
> >> be used in the panic handler?
> >
> > Yeah I really don't like the idea of creating some really brittle one-o=
ff
> > core mm code just so we don't have to vmap a buffer unconditionally. I
> > think even better would be if drm_panic can cope with non-linear buffer=
s,
> > it's entirely fine if the drawing function absolutely crawls and sets e=
ach
> > individual byte ...
>
> It already supports some non-linear buffer, like Nvidia block-linear:
> https://elixir.bootlin.com/linux/v6.13.5/source/drivers/gpu/drm/nouveau/d=
ispnv50/wndw.c#L606
>
> And I've also sent some patches to support Intel's 4-tile and Y-tile form=
at:
> https://patchwork.freedesktop.org/patch/637200/?series=3D141936&rev=3D5
> https://patchwork.freedesktop.org/patch/637202/?series=3D141936&rev=3D5
>
> Hopefully Color Compression can be disabled on intel's GPU, otherwise
> that would be a bit harder to implement than tiling.
>
> >
> > The only thing you're allowed to do in panic is try_lock on a raw spinl=
ock
> > (plus some really scare lockless tricks), imposing that on core mm soun=
ds
> > like a non-starter to me.
> >
> > Cheers, Sima
>

Thank you all for your comments.
I understand adding atomic_vmap is not possible as vmalloc is not compatibl=
e
with GFP_ATOMIC. I'll re-implement this by pre-allocating the page table an=
d
reserve the vmap area while the kernel is alive. It'll might be
allocated in driver
codes so maybe I don't need to add any features in core mm code.

Best regards,
Ryosuke

