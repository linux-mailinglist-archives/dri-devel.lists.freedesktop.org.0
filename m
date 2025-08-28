Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F613B39873
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 11:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2EB10E1C3;
	Thu, 28 Aug 2025 09:39:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="OGTKor8h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B61410E14F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 09:39:11 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-3ceb830dd58so3786f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 02:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1756373949; x=1756978749;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hzbPaZibccHjU0FoSS1gsWi6heTM3EUmA3XuL3SLQ94=;
 b=OGTKor8hDh2KLlZPYCIjMhCz1dSAGpQ4bc5q6KeSwzwGkaQOYcDDsmSJ/sZ2IJkcDY
 Z8FAM3P8CdhOwkTCFrfAycFKymJmb1d2RyhfmJxNFVhSAKT1eZFMJ0dIMnWqy4LcUlzs
 eXPE/EFrWXx0AIHfwgf6ea55/ztk7g+xmjWO4F4V3fppqO0bJRZZkz1xFZ9G78m2tdTJ
 HHIhnYU1smomSToTDa0PQIAf8jcKDgng0AwzgXnP8fwUiIt7BiyQ4ulEWUWm5BIYWvDb
 LfE1wHmai/uaGhbVzKKmHfDBwNTbTnrEY3OIoW6t4Th+U9CkKWsoZu9zoPrICAHtyzP+
 1Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756373949; x=1756978749;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hzbPaZibccHjU0FoSS1gsWi6heTM3EUmA3XuL3SLQ94=;
 b=jsS6j2UfMD5grfdoEYjVJsWQxkyXa9n5vHGgCcWYZDebtHxBUMySXM8QSm+opeBsWE
 4iFMSSsIs5X8RjJ9QB7lxw3Q56sWI8YqVbPZFBwhgZkRBmmtBZr1H0iG891TeNSNR9Zx
 SvYdPBtvtlvMVkiX6r52Yjprecs0TJvx+V2MTIKV6M2KV/OJIq/+JHfAQvBvQecwdf5b
 Rpsaz00PqocrN2QTp41BB179ermlC9ZPYUbi/FpBQnx9an5cYlxKgrSALovSzvaR9++n
 aCMJ1HNcBPssS9U9NT1/WLuFoeLgMtaa2Kp53RoRjd8HntOqQfqxgzUNTv0BOFHNndyR
 OE8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/Tez8WytLOcnu1w6wPv6aCeyvaP2amb7e5Go+QcXJEoiS4SZwEKVXlRBpmJIsReynyX3qCr5lXk4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwL786VCDGIaNksFtMDnmH39wd5W+AX35SVzz045mXVoaI5pk1a
 9v9N2ISNWPev66pAgQTw4tC1142QGY18TtSbFmiRPIIqlk9uJlE4JsNbyFP8TAE2BYuOIaCbzzv
 1TR1VzQ3Vr6f8/xI1FhttAkYDhHppc8vnRPHKtUNy
X-Gm-Gg: ASbGnctnLef/e0U/HpvI5MAFDCbEnIwk4d3ELeP+8cKkLTuEJiuEpPHh6BYn5onsyz/
 tz+H1G0FEv6pRekvq3tFHT2E0yhYHC4MZqPuW7QqboesgXFiPKDIC4kSv4L9JbSBNlN+y/8pg31
 Ifo5Uqzfcy4DY77eoixDUI5C3s+tAkgdXvY+H9afxhZjF/1PpAKhVuUCB07i3WIvk/IvYWnQrpt
 51mNU0vzCs750LO7+hY4ZGd98L8iFLPgHrDu0dvj9nCekq2MQnRmwXWkMga7gNUAytgUEqzRKI=
X-Google-Smtp-Source: AGHT+IFlktDkaWiKRUo1z5/QhTcPRf5IjIBVdJ474S3mSdXUJtSFTm3Jsl9elK6Srq7Fmm/7XEbe55lLoaf2t8fE14g=
X-Received: by 2002:a5d:5f43:0:b0:3c6:e655:e878 with SMTP id
 ffacd0b85a97d-3cbb15ca65amr7606825f8f.31.1756373949317; Thu, 28 Aug 2025
 02:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
 <20250827-gpuva-mutex-in-gem-v3-3-bd89f5a82c0d@google.com>
 <DCDYCT8QSYGM.XIKU6FJ1ESAQ@kernel.org>
In-Reply-To: <DCDYCT8QSYGM.XIKU6FJ1ESAQ@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 28 Aug 2025 11:38:57 +0200
X-Gm-Features: Ac12FXyFqot6FQ7A-cFSBHp_abEIYrxD9hUKRbVhXYWKrC9K5-tovvApSPC6tSM
Message-ID: <CAH5fLggJViOUQGB-oK764PdL37LioFWt3gNpYijq_Q8Cmi8mjw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] gpuvm: remove gem.gpuva.lock_dep_map
To: Danilo Krummrich <dakr@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Rob Herring <robh@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, dri-devel@lists.freedesktop.org, 
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

On Thu, Aug 28, 2025 at 11:27=E2=80=AFAM Danilo Krummrich <dakr@kernel.org>=
 wrote:
>
> On Wed Aug 27, 2025 at 3:38 PM CEST, Alice Ryhl wrote:
> >  #ifdef CONFIG_LOCKDEP
> > -/**
> > - * drm_gem_gpuva_set_lock() - Set the lock protecting accesses to the =
gpuva list.
> > - * @obj: the &drm_gem_object
> > - * @lock: the lock used to protect the gpuva list. The locking primiti=
ve
> > - * must contain a dep_map field.
> > - *
> > - * Call this if you're not proctecting access to the gpuva list with t=
he
> > - * dma-resv lock, but with a custom lock.
> > - */
> > -#define drm_gem_gpuva_set_lock(obj, lock) \
> > -     if (!WARN((obj)->gpuva.lock_dep_map, \
> > -               "GEM GPUVA lock should be set only once.")) \
> > -             (obj)->gpuva.lock_dep_map =3D &(lock)->dep_map
> > -#define drm_gem_gpuva_assert_lock_held(obj) \
> > -     lockdep_assert((obj)->gpuva.lock_dep_map ? \
> > -                    lock_is_held((obj)->gpuva.lock_dep_map) : \
> > +#define drm_gem_gpuva_assert_lock_held(gpuvm, obj) \
> > +     lockdep_assert(drm_gpuvm_immediate_mode(gpuvm) ? \
> > +                    lock_is_held(&(obj)->gpuva.lock.dep_map) : \
>
> NIT: I think this can just be:
>
>         lockdep_is_held(&(obj)->gpuva.lock)
>
> If you want I can fix it up on apply.

IF that works, then sure.

Alice
