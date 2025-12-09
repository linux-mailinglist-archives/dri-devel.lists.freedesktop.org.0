Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0C6CAFC9F
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 12:37:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADFCD10E52F;
	Tue,  9 Dec 2025 11:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dej/Q17M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBDEC10E52F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Dec 2025 11:37:15 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-4eda77e2358so47038781cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Dec 2025 03:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765280235; x=1765885035; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9bV6BUSUnHPWqxSVdvnJzA7cFI5OKa6pmer3aetETyA=;
 b=dej/Q17MFTuU/iHxIs3bNaip83YpyWcf2Aiuezks6VRBrYdq7iW1v47b8KPF7VI5Sn
 T2t8f39CiS1O4KjTtCyxxZXxOwU6io4oP6h98GFSMBa6TOs6NT6+ozTcuNALeSpa7a9+
 KD76cy0A82Hi66XfwAvz7v6mLVVvNPPH6dtP7hesZSpNp/5alX/1bsUaBQZaMSyNNePA
 jyMWzDeuQey65HpKURiL27Y1vyhBEM24fp+2roAL45zQCQhRSKwW9wrlpXGiBMhbHHRj
 h5BYcnlVNsPWTXfhAKE6PBGE5gn9uG57Kj3b6zje/r+ZF5364zKA2Ejwd0/ez4aQ0veC
 qPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765280235; x=1765885035;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9bV6BUSUnHPWqxSVdvnJzA7cFI5OKa6pmer3aetETyA=;
 b=n0oi/kSFpcXKKrxSV4g0LegvSnC4r3KPVZB39vjYbjqDECc4LYnFQKRp26D5zoUAIV
 NcYJuSvO1vibf5wMDm+PZsMlwob/irwQeyM6njbyfxnI3mOS2eXYBl5pj1c1itMMi32I
 yV3A+epan1v/NeXaMTt16UqUCdIC7p/4/h2/3/NuCBhiKU2q7p0sjuDtSvI7CXde8BkS
 PsZ4ea+V+/xopNu0242zi+pk9dJkCsjAHq0smMig6ntLDhjYKPi0xwd5OQ/uQYL0Ljt8
 +KseH9P+Y7jfTXzpK0c1MgwJwTn7y8jHQIViGVcu3eYbXpfTCyWW09Wi4tp5/FCWXUBU
 t35A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuOJ2VbWYomW2DKULyR47IB5UzkECYuBcRIoxCzfnODHSanlzvNVg4MpFzry44DHZZFu1PPFwudho=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDB86BmaETNrom5ZBW55erH0c4fYWFSRqmrOpXOzf/S6UfkwM6
 v6JELvTted8BfQviYCAY89HXQZ76Gtlc3XQfvQLERSc2HrWlCudbBVXlQKg9ReW8xD+fGoRUZOK
 lOsNEbKPaVd86gz+zqmztIiekKG/fNe4=
X-Gm-Gg: ASbGnctLI1U5reTRwXifILDgKKA6QTyQPp6lfBKfjDVP4aV7yQsY12NxECrQXH7NqI/
 9XdmOsbhnZ+DCSHIPUGjY3H5jUdMHMosY3z/NJfzpkptbpL7LmQ/yVRdh9uKrFGJJLZaR6Tzf4q
 PtQ2YEjUW4yWuZdKziBU7WoEzxhpKbYdOUGkBbuyQlXLibnA/t0wksbejbxr52z0/DcobSjHhu6
 cEW4OlyVlBZrXfMhR/Ehh3jDBl9YL6dlLQCaalO/73eEGZXTzTlI0yeP5DfpXyLX5wGD5OP2Uc7
 fIc/SqR8
X-Google-Smtp-Source: AGHT+IEgbsVwagKy3txxv1x4OgD1iaDpms/Rm9Y2qf5oR10n0oOAuFdSPhVPEDts3ojZlS6ZhGmu+kq1Qgj4bmperDM=
X-Received: by 2002:a05:622a:5147:b0:4eb:a10c:de05 with SMTP id
 d75a77b69052e-4f03ff1d52cmr163023291cf.55.1765280234537; Tue, 09 Dec 2025
 03:37:14 -0800 (PST)
MIME-Version: 1.0
References: <3da6a916cd6d489690b05d2bd64a2b3a@honor.com>
 <CAGsJ_4w-XtJ8zzc8H4OwW4XV21T8FWGxeoMnfAxmAgBhzrvxWQ@mail.gmail.com>
 <6f891b70-7ee9-44a3-92a1-bbeb4d2b9fee@arm.com>
In-Reply-To: <6f891b70-7ee9-44a3-92a1-bbeb4d2b9fee@arm.com>
From: Barry Song <21cnbao@gmail.com>
Date: Tue, 9 Dec 2025 19:37:03 +0800
X-Gm-Features: AQt7F2oS6lqTycELkQSIDw5s74y2U5FK96sITwzfzf6-Pu3qUIktYbBDSrphSI4
Message-ID: <CAGsJ_4xb--mwsPHVFXzcpnZ29Wh8N-OTZNyNVW2CZd-U00A_ww@mail.gmail.com>
Subject: Re: [RFC] dma-buf: system_heap: add PTE_CONT for larger contiguous
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: gao xu <gaoxu2@honor.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "surenb@google.com" <surenb@google.com>, 
 zhouxiaolong <zhouxiaolong9@honor.com>
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

On Mon, Dec 8, 2025 at 6:38=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.com> =
wrote:
>
> On 08/12/2025 09:52, Barry Song wrote:
> > On Mon, Dec 8, 2025 at 5:41=E2=80=AFPM gao xu <gaoxu2@honor.com> wrote:
> >>
> >> commit 04c7adb5871a ("dma-buf: system_heap: use larger contiguous mapp=
ings
> >> instead of per-page mmap") facilitates the use of PTE_CONT. The system=
_heap
> >> allocates pages of order 4 and 8 that meet the alignment requirements =
for
> >> PTE_CONT. enabling PTE_CONT for larger contiguous mappings.
> >
> > Unfortunately, we don't have pte_cont for architectures other than
> > AArch64. On the other hand, AArch64 isn't automatically mapping
> > cont_pte for mmap. It might be better if this were done
> > automatically by the ARM code.
>
> Yes indeed; CONT_PTE_MASK and PTE_CONT are arm64-specific macros that can=
not be
> used outside of the arm64 arch code.
>
> >
> > Ryan(Cced) is the expert on automatically setting cont_pte for
> > contiguous mapping, so let's ask for some advice from Ryan.
>
> arm64 arch code will automatically and transparently apply PTE_CONT whene=
ver it
> detects suitable conditions. Those suitable conditions include:
>
>   - physically contiguous block of 64K, aligned to 64K
>   - virtually contiguous block of 64K, aligned to 64K
>   - 64K block has the same access permissions
>   - 64K block all belongs to the same folio
>   - not a special mapping
>
> The last 2 requirements are the tricky ones here: We require that every p=
age in
> the block belongs to the same folio because a contigous mapping only main=
tains a
> single access and dirty bit for the whole 64K block, so we are losing fid=
elity
> vs per-page mappings. But the kernel tracks access/dirty per folio, so th=
e extra
> fidelity we get for per-page mappings is ingored by the kernel anyway if =
the
> contiguous mapping only maps pages from a single folio. We reject special
> mappings because they are not backed by a folio at all.
>
> For your case, remap_pfn_range() will create special mappings so we will =
never
> set the PTE_CONT bit.
>
> Likely we are being a bit too conservative here and we may be able to rel=
ax this
> requirement if we know that nothing will ever consume the access/dirty
> information for special mappings? I'm not if that is the case in general =
though
> - it would need some investigation.
>
> With that issue resolved, there is still a second issue; there are 2 ways=
 the
> arm64 arch code detects suitable contiguous mappings. The primary way is =
via a
> call to set_ptes(). This part of the "PTE batching" API and explicitly te=
lls the
> implementaiton that all the conditions are met (including the memory bein=
g
> backed by a folio). This is the most efficient approach. See contpte_set_=
ptes().
>
> There is a second (hacky) approach which attempts to recognise when the l=
ast PTE
> of a contiguous block is set and automatically "fold" the mapping. See
> contpte_try_fold(). This approach has a cost because (for systems without
> BBML2_NOABORT) we have to issue a TLBI when we fold the range.
>
> For remap_pfn_range(), we would be relying on the second approach since i=
t is
> not currently batched (and could not use set_ptes() as currently spec'ed =
due to
> there being no folio). If we are going to add support for contiguous pfn-=
mapped
> PTEs, it would be preferable to add equivalent batching APIs (or relax se=
t_ptes()).
>

Thanks a lot, Ryan. It seems quite tricky to support automatic cont_pte.

> I think this would be a useful improvement, but it's not as straightforwa=
rd as
> adding PTE_CONT in system_heap_mmap().

Since it's just a driver, I'm not sure if it's acceptable to use CONFIG_ARM=
64.
However, I can find many instances of it in drivers.
drivers % git grep CONFIG_ARM64 | wc -l
     127

On the other hand, a corner case is when the dma-buf is partially unmapped.
I assume cont_pte can still be automatically unfolded, even for
special mappings?

Thanks
Barry
