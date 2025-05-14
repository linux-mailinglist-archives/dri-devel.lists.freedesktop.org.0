Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A578BAB7678
	for <lists+dri-devel@lfdr.de>; Wed, 14 May 2025 22:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 021D510E701;
	Wed, 14 May 2025 20:12:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="EZyuNKoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A8110E701
 for <dri-devel@lists.freedesktop.org>; Wed, 14 May 2025 20:12:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1747253530; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=QYA8Eg75yzMjCYAfrcL0IA+RNeOuU419/PpIjASU2DH9m07g2U84mJUk/hxcRsyTH1FHHbp9xg9Xy0TakuIA1ELRLLP2OHYtak/mF3f2OQ+lC1yWRp1vbZLbdbSLLm5L/WIUMjOF8gFyKA0p45n7KCR2pLcbxnDcesgsMHQ1ndM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1747253530;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=e1XTWQTONEKrdp5HpcuF1hY26M4jNPKA5Df1xgJ7H3s=; 
 b=mjrW4oOlEe544byYcZHUNxy9Uk+bbzJiCfZFvp6aEg7Wr9f/6hQGv679yAHgTJE7pOpNRFq0FYsoXwxFN6MUkEYhZdtmz3YFwOz8q/nZ1VrkuxTCvPC8ohhKdbF4LvXjJskGMgalPZmA+OZFeBF7DJKooBmb+jKTcphuT8SfZ90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
 dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1747253529; 
 s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
 h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:References:To:To:Reply-To;
 bh=e1XTWQTONEKrdp5HpcuF1hY26M4jNPKA5Df1xgJ7H3s=;
 b=EZyuNKoB6X7+qoRRAJ9YGB/ng6DQs5X9zFdtARXDD2PbZy0+thtG7aiJ1eNToluL
 ZCDVMRa6h6y8/cWWmy5+WBFjEE+JcDN0rI3wuD55I85jzI48dIWvoeJru3t5EUr2ob4
 GlGT2YRvbs5yzpLWgca9IdAhX3v5VchZ02HZisIM=
Received: by mx.zohomail.com with SMTPS id 1747253527937960.6041502544936;
 Wed, 14 May 2025 13:12:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH v2 2/2] rust: drm: Add GPUVM abstraction
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <aAj7gAzFVRX3dN7L@pollux>
Date: Wed, 14 May 2025 17:11:50 -0300
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Asahi Lina <lina@asahilina.net>
Content-Transfer-Encoding: quoted-printable
Message-Id: <AEB7ACF6-EF2A-4F7B-A7E2-8E4B2A0B7EC8@collabora.com>
References: <20250422-gpuvm-v2-0-44d4fc25e411@collabora.com>
 <20250422-gpuvm-v2-2-44d4fc25e411@collabora.com>
 <aAgHGuzCZzh7YPz2@cassiopeiae>
 <DBB3E8CE-19AA-437D-AF54-BF23763B254F@collabora.com>
 <aAj7gAzFVRX3dN7L@pollux>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-ZohoMailClient: External
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


>=20
> The lock might be held already by the driver or by TTM when things are =
called
> from TTM callbacks.
>=20
> This is why GPUVM never takes locks by itself, but asserts that the =
correct lock
> is held.
>=20
> I think we really want to get proof by the driver by providing lock =
guard
> references.
>=20
>> See my comment about =E2=80=9C[..] a new type for GEM objects which =
are known to be locked"
>> below.
>=20
> <snip>
>=20
>>>> +
>>>> +    /// Obtains the [`GpuVmBo`] object that connects `obj` to this =
VM.
>>>> +    ///
>>>> +    /// This connection is unique, so an instane of [`GpuVmBo`] =
will be
>>>> +    /// allocated for `obj` once, and that instance will be =
returned from that
>>>> +    /// point forward.
>>>> +    pub fn obtain_bo(&mut self, obj: &DriverObject<T>) -> =
Result<ARef<GpuVmBo<T>>> {
>>>> +        // SAFETY: LockedGpuVm implies the right locks are held.
>>>=20
>>> No, this must be locked by the dma-resv or the GEM gpuva lock, not =
by the
>>> GPUVM lock that protects the interval tree.
>>=20
>> By =E2=80=9CGEM gpuva lock=E2=80=9D you=E2=80=99re referring to the =
custom lock which we
>> currently do not support, right?
>=20
> Yes.
>=20
>> This series currently rely on manual calls to dma_resv_{lock,unlock}, =
I wonder
>> if we should ditch that in favor of something written in Rust =
directly. This
>> would let us introduce a new type for GEM objects which are known to =
have
>> `resv` locked. WDYT?
>=20
> Not all functions that require the dma-resv lock to be held are called =
with a
> GEM object parameter, it could also be a struct drm_gpuvm_bo, struct =
drm_gpuva
> or struct drm_gpuvm, since they all carry GEM object pointers.
>=20
> For reference, you can look for "_held" in =
drivers/gpu/drm/drm_gpuvm.c.
>=20

Looking at Lyude=E2=80=99s (excellent) KMS series, one thing that comes =
to mind is
using Lock::from_raw() on the dma-resv lock. This will build a rust =
Mutex that
we can then assert to be locked (or fail with an Error otherwise).

See [0] for the specific patch whose idea I want to copy.

Can I get a +1 on this idea before pursuing it?

-- Daniel

[0] =
https://lore.kernel.org/rust-for-linux/20250305230406.567126-10-lyude@redh=
at.com/

