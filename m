Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44663BBDE96
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 13:50:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C1E410E349;
	Mon,  6 Oct 2025 11:50:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="3a+q5koT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D61D10E349
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 11:50:06 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so3232035f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Oct 2025 04:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1759751405; x=1760356205;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UyBasw6oNk2zpnfotHn17QmW8sov2N1oJVYn9mrVizM=;
 b=3a+q5koTSDRqdFasypq+taY3TYFa9iUHJTatn29hqZbK4Itq2RGBQ3sDO02OyCReYi
 bT2+ze7H4v7WcQ1itNg8ScuBMo0KSAjTvqQeY6jccxtLo80h9vHJWaDTPrAR/pa1lerH
 AhroBQxLR/TMP5Dp4j7Kkq15sjS9JvewI7ndk1njMogKXU6rXJGZS/jYcjXWgifRPo1u
 bb4ASzU+kDPOUn8Ao8Dja4Xi3m8i3Q4DXmst+WtQjYswBo79MLkF6rN42y/4Ffnr8iyC
 PWVDhOAF3AVHRlg1/vWV4QzrDt/ElvHRA16Zk+Lf4FqeTVeA6x6SuTdSZv2LnBTh1n14
 vmng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759751405; x=1760356205;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UyBasw6oNk2zpnfotHn17QmW8sov2N1oJVYn9mrVizM=;
 b=Ah3wE9mEW4x7vazoW8oBG8n9Ut8dg7MUFo/afF1P5rSBBy92Tfxi0qKu5bUeEfz6+7
 XuuobHlGHZGXU5OoptZJPyfbXTsqIZcc+PZ0+vyN9Y9yaYylvhh6D2wnXUzmKAlt5gSJ
 vyjLaRYael9MnAaaS2RkPSHeVYMITG6JVGzrlPYvuSDo7NSsuBsYjA0qsIsfIPnZrLZ3
 0Echn5Cl00nXxwIkFd4XZ2utbowiyLc5OT43PcFcXpNBx+xZkUbjaaYY0qRVpYSKza6d
 plXgyXvVK6ojvzxUCVVo5Fcbe+nnsZ04xLhvZy8wTK9LIdx2pNJxQJLRfIz0nTX6bOsG
 Hzhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0I08vjEkouJ9gBpsuF/p1xeTrZngUc2iYduLcIU/P4hyA3o2EhyaU5qFlOiH96kXMLJkqAIf1aEE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyItLEdnbsn4ofQiwLP8hWkXnnJVvUH3r6nrmwnZ6PefoocoeZD
 +A8bqkdNpKatjR6b8ZZbdYviQUxBudHgnru4H4fSm8su4kWPjDUBK0x5JNGS6MvZGIxuAC6njL+
 tHkzLhBSV+ZTEC3Y3uMtZ4NahbaEQGMR9sp4OkScX
X-Gm-Gg: ASbGncs/siLsCX1HqK2vd4GvNKo0JN4/givLdDDSTdYYm3bKW8ZhZmiU/WbT5jo2756
 Iu6zozTCSdTC4JYMeZdtBFduuZ7vqX34lyxloQlKnZakoD/DY0lnOv0hI4WRwLCySvES2leA8Q4
 SI/1QJxg0xONzs+bGF1IX13mdwTWaB/+H/Rh1v3Ino5hwnY3uYndA2Hxz07RXhw2Q1m+9N1mNVD
 Q/Q49rXFTpBWFngxhLW0OHpBmK5YHWutb4pZNMNBdy+5cwvx/aBUX3iUbKRx3RAizyY
X-Google-Smtp-Source: AGHT+IGdp16P4q3VGxgx4jyAAd2iLI6qXsHfTNaFHR/GVV+aLzAEqlqtmbDJfQnsohQ/UjB+WbHSm9RuxOZuBjPKnec=
X-Received: by 2002:a05:6000:186e:b0:408:ffd8:2742 with SMTP id
 ffacd0b85a97d-4256719e408mr8952972f8f.33.1759751404729; Mon, 06 Oct 2025
 04:50:04 -0700 (PDT)
MIME-Version: 1.0
References: <20251001-vmbo-defer-v3-0-a3fe6b6ae185@google.com>
 <20251001-vmbo-defer-v3-1-a3fe6b6ae185@google.com>
 <DD71GUKZKFPR.2OVPQ9KOI89YG@kernel.org>
 <CAH5fLghM_fmaHn561_e7StHAwdV=8gPxAwUToDxPQiBY8E+aVA@mail.gmail.com>
 <20251001171346.482142eb@fedora>
 <CAH5fLgjteqdWVBfzU_2iq2v=9MV9rD+s3z6i2ZjrmqBUq6_byQ@mail.gmail.com>
 <20251006134108.6a5cdcb7@fedora>
In-Reply-To: <20251006134108.6a5cdcb7@fedora>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Oct 2025 13:49:52 +0200
X-Gm-Features: AS18NWC8HPIggNn6cfh3OrVUBPpfb3xMvycWVOnJhKokRI560k6qhwtD5DdKd4M
Message-ID: <CAH5fLghbbybzaQx0kwoEU9aCew8RAMyzVcO7JXytWPUseHvHaA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drm/gpuvm: add deferred vm_bo cleanup
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Steven Price <steven.price@arm.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
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

On Mon, Oct 6, 2025 at 1:41=E2=80=AFPM Boris Brezillon
<boris.brezillon@collabora.com> wrote:
>
> On Mon, 6 Oct 2025 13:31:51 +0200
> Alice Ryhl <aliceryhl@google.com> wrote:
>
> > On Wed, Oct 1, 2025 at 5:13=E2=80=AFPM Boris Brezillon
> > <boris.brezillon@collabora.com> wrote:
> > >
> > > On Wed, 1 Oct 2025 16:42:35 +0200
> > > Alice Ryhl <aliceryhl@google.com> wrote:
> > >
> > > > On Wed, Oct 1, 2025 at 4:01=E2=80=AFPM Danilo Krummrich <dakr@kerne=
l.org> wrote:
> > > > >
> > > > > On Wed Oct 1, 2025 at 12:41 PM CEST, Alice Ryhl wrote:
> > > > > > +/*
> > > > > > + * Must be called with GEM mutex held. After releasing GEM mut=
ex,
> > > > > > + * drm_gpuvm_bo_defer_free_unlocked() must be called.
> > > > > > + */
> > > > > > +static void
> > > > > > +drm_gpuvm_bo_defer_free_locked(struct kref *kref)
> > > > > > +{
> > > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct =
drm_gpuvm_bo,
> > > > > > +                                               kref);
> > > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > > +
> > > > > > +     if (!drm_gpuvm_resv_protected(gpuvm)) {
> > > > > > +             drm_gpuvm_bo_list_del(vm_bo, extobj, true);
> > > > > > +             drm_gpuvm_bo_list_del(vm_bo, evict, true);
> > > > > > +     }
> > > > > > +
> > > > > > +     list_del(&vm_bo->list.entry.gem);
> > > > > > +}
> > > > > > +
> > > > > > +/*
> > > > > > + * GEM mutex must not be held. Called after drm_gpuvm_bo_defer=
_free_locked().
> > > > > > + */
> > > > > > +static void
> > > > > > +drm_gpuvm_bo_defer_free_unlocked(struct drm_gpuvm_bo *vm_bo)
> > > > > > +{
> > > > > > +     struct drm_gpuvm *gpuvm =3D vm_bo->vm;
> > > > > > +
> > > > > > +     llist_add(&vm_bo->list.entry.bo_defer, &gpuvm->bo_defer);
> > > > > > +}
> > > > > > +
> > > > > > +static void
> > > > > > +drm_gpuvm_bo_defer_free(struct kref *kref)
> > > > > > +{
> > > > > > +     struct drm_gpuvm_bo *vm_bo =3D container_of(kref, struct =
drm_gpuvm_bo,
> > > > > > +                                               kref);
> > > > > > +
> > > > > > +     mutex_lock(&vm_bo->obj->gpuva.lock);
> > > > > > +     drm_gpuvm_bo_defer_free_locked(kref);
> > > > > > +     mutex_unlock(&vm_bo->obj->gpuva.lock);
> > > > > > +
> > > > > > +     /*
> > > > > > +      * It's important that the GEM stays alive for the durati=
on in which we
> > > > > > +      * hold the mutex, but the instant we add the vm_bo to bo=
_defer,
> > > > > > +      * another thread might call drm_gpuvm_bo_deferred_cleanu=
p() and put
> > > > > > +      * the GEM. Therefore, to avoid kfreeing a mutex we are h=
olding, we add
> > > > > > +      * the vm_bo to bo_defer *after* releasing the GEM's mute=
x.
> > > > > > +      */
> > > > > > +     drm_gpuvm_bo_defer_free_unlocked(vm_bo);
> > > > > > +}
> > > > >
> > > > > So, you're splitting drm_gpuvm_bo_defer_free() into two functions=
, one doing the
> > > > > work that is required to be called with the gpuva lock held and o=
ne that does
> > > > > the work that does not require a lock, which makes perfect sense.
> > > > >
> > > > > However, the naming chosen for the two functions, i.e.
> > > > > drm_gpuvm_bo_defer_free_unlocked() and drm_gpuvm_bo_defer_free_lo=
cked() is
> > > > > confusing:
> > > > >
> > > > > What you mean semantically mean is "do part 1 with lock held" and=
 "do part 2
> > > > > without lock held", but the the chosen names suggest that both fu=
nctions are
> > > > > identical, with the only difference that one takes the lock inter=
nally and the
> > > > > other one requires the caller to take the lock.
> > > > >
> > > > > It's probably better to name them after what they do and not what=
 they're part
> > > > > of. If you prefer the latter, that's fine with me too, but please=
 choose a name
> > > > > that makes this circumstance obvious.
> > > >
> > > > Fair point. Do you have naming suggestions? Otherwise I can name th=
em
> > > > drm_gpuvm_bo_defer_free_part1() and drm_gpuvm_bo_defer_free_part2()=
.
> > > > :)
> > >
> > > drm_gpuvm_bo_free_deferral_extract_locked() and
> > > drm_gpuvm_bo_free_deferral_enqueue()? Definitely not short names thou=
gh.
> >
> > With those names I have to do some additional line breaks. How about:
> >
> > drm_gpuvm_bo_into_zombie()
> > drm_gpuvm_bo_defer_zombie()
>
> Sounds good. I think I'd prefer if the second one was called
> drm_gpuvm_bo_defer_zombie_cleanup() to make clear what the deferral is
> about, but feel free to ignore this if you think it's too long.

Sounds good. It's more the first one that I want to keep short because
it's used with kref_put().

Alice
