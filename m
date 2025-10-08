Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD85BC60EF
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:42:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EB2F10E86B;
	Wed,  8 Oct 2025 16:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b8bh0ChY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E81E510E868;
 Wed,  8 Oct 2025 16:41:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D9FFD620D1;
 Wed,  8 Oct 2025 16:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBED0C4CEE7;
 Wed,  8 Oct 2025 16:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759941706;
 bh=ZCuUWIclcqNJeWG599oCSgcV0BgUA7XbogaaKwuAE0s=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=b8bh0ChYn7uLF6+StVjoNP6k6GjQ4TRvai01V+kzmJ78GsrtGlYD+nMocmA6FKeFQ
 cc8HO/9hHgRAQ+kI5s9dLQEim77ZsWvnlFLXWXwkAB5yPDleY154E3GYoI8twI+Lnb
 M4UekNe7DZTxV7WTL1XvoRNK/oX0OAdkQtqL5ZjkEKuG0asIUzab/poxdeXZHV+Vdf
 G0bP6np4YmpDUxqYy6CJrNP8I2tcCG/BBDua+zvWr520Y7CPx7A4v7heMNQM3nl1tB
 aU/0lhthbdAH1ngVw4GvwuKAP6L2ibOt/uoUu4ZEMCJ/EqcixOp5RerkhMQhRSTam2
 skK2CVxaRDDPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Oct 2025 18:41:40 +0200
Message-Id: <DDD39JHAI4ED.2BGLWYNIRA987@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Cc: <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <acourbot@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, "Lyude Paul" <lyude@redhat.com>
To: "Alistair Popple" <apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-5-apopple@nvidia.com>
In-Reply-To: <20251008001253.437911-5-apopple@nvidia.com>
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

On Wed Oct 8, 2025 at 2:12 AM CEST, Alistair Popple wrote:
> diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbu=
ffer.rs
> new file mode 100644
> index 000000000000..e82f9d97ad21
> --- /dev/null
> +++ b/drivers/gpu/nova-core/sbuffer.rs
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +use core::ops::Deref;
> +
> +use kernel::alloc::KVec;
> +use kernel::error::code::*;
> +use kernel::prelude::*;
> +
> +/// A buffer abstraction for discontiguous byte slices.
> +///
> +/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
> +/// as a single stream-like read/write buffer.
> +///
> +/// Example:
> +///
> +/// let mut buf1 =3D [0u8; 3];
> +/// let mut buf2 =3D [0u8; 5];
> +/// let mut sbuffer =3D SWriteBuffer::new([&buf1, &buf2]);
> +///
> +/// let data =3D b"hellowo";

Not that it matters, but "hellowo"? :)

> +/// let result =3D sbuffer.write_all(0, data);
> +///
> +/// A sliding window of slices to proceed.
> +///
> +/// Both read and write buffers are implemented in terms of operating on=
 slices of a requested
> +/// size. This base class implements logic that can be shared between th=
e two to support that.
> +///
> +/// `S` is a slice type, `I` is an iterator yielding `S`.
> +pub(crate) struct SBuffer<I: Iterator> {
> +    /// `Some` if we are not at the end of the data yet.
> +    cur_slice: Option<I::Item>,
> +    /// All the slices remaining after `cur_slice`.
> +    slices: I,
> +}

Does it make sense to split SBuffer into itself and a separate SBufferIter =
that
keeps a reference to the SBuffer? If not, I'd rename it to SBufferIter to m=
ake
it obvious to the user that it is an iterator type.

> +impl<'a, I> SBuffer<I>
> +where
> +    I: Iterator,
> +{
> +    #[expect(unused)]
> +    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter =3D I>) =
-> Self
> +    where
> +        I: Iterator<Item =3D &'a [u8]>,
> +    {
> +        Self::new(slices)
> +    }
> +
> +    #[expect(unused)]
> +    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter =3D I>) =
-> Self
> +    where
> +        I: Iterator<Item =3D &'a mut [u8]>,
> +    {
> +        Self::new(slices)
> +    }

Please add some documentation for the constructors.

> +    fn new(slices: impl IntoIterator<IntoIter =3D I>) -> Self
> +    where
> +        I::Item: Deref<Target =3D [u8]>,
> +    {
> +        let mut slices =3D slices.into_iter();
> +
> +        Self {
> +            // Skip empty slices to avoid trouble down the road.
> +            cur_slice: slices.find(|s| !s.deref().is_empty()),
> +            slices,
> +        }
> +    }
> +
> +    fn get_slice_internal(
> +        &mut self,
> +        len: usize,
> +        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
> +    ) -> Option<I::Item>
> +    where
> +        I::Item: Deref<Target =3D [u8]>,
> +    {
> +        match self.cur_slice.take() {
> +            None =3D> None,
> +            Some(cur_slice) =3D> {
> +                if len >=3D cur_slice.len() {
> +                    // Caller requested more data than is in the current=
 slice, return it entirely
> +                    // and prepare the following slice for being used. S=
kip empty slices to avoid
> +                    // trouble.
> +                    self.cur_slice =3D self.slices.find(|s| !s.is_empty(=
));
> +
> +                    Some(cur_slice)
> +                } else {
> +                    // The current slice can satisfy the request, split =
it and return a slice of
> +                    // the requested size.
> +                    let (ret, next) =3D f(cur_slice, len);
> +                    self.cur_slice =3D Some(next);
> +
> +                    Some(ret)
> +                }
> +            }
> +        }
> +    }
> +}
> +
> +/// Provides a way to get non-mutable slices of data to read from.
> +impl<'a, I> SBuffer<I>
> +where
> +    I: Iterator<Item =3D &'a [u8]>,
> +{
> +    /// Returns a slice of at most `len` bytes, or `None` if we are at t=
he end of the data.
> +    ///
> +    /// If a slice shorter than `len` bytes has been returned, the calle=
r can call this method
> +    /// again until it returns `None` to try and obtain the remainder of=
 the data.
> +    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
> +        self.get_slice_internal(len, |s, pos| s.split_at(pos))
> +    }
> +
> +    /// Ideally we would implement `Read`, but it is not available in `c=
ore`.
> +    /// So mimic `std::io::Read::read_exact`.
> +    #[expect(unused)]
> +    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
> +        while !dst.is_empty() {
> +            match self.get_slice(dst.len()) {
> +                None =3D> return Err(ETOOSMALL),

ETOOSMALL is an NFS error code (it should also never be exposed to userspac=
e). I
suggest to implement a custom error type instead and make it resolve to ENO=
SPC
or probably just EINVAL instead.

> +                Some(src) =3D> {
> +                    let dst_slice;
> +                    (dst_slice, dst) =3D dst.split_at_mut(src.len());
> +                    dst_slice.copy_from_slice(src);
> +                }
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Read all the remaining data into a `KVec`.
> +    ///
> +    /// `self` will be empty after this operation.
> +    #[expect(unused)]
> +    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags)=
 -> Result<KVec<u8>> {
> +        let mut buf =3D KVec::<u8>::new();
> +
> +        if let Some(slice) =3D core::mem::take(&mut self.cur_slice) {
> +            buf.extend_from_slice(slice, flags)?;
> +        }
> +        for slice in &mut self.slices {
> +            buf.extend_from_slice(slice, flags)?;
> +        }
> +
> +        Ok(buf)
> +    }
> +}
> +
> +/// Provides a way to get mutable slices of data to write into.
> +impl<'a, I> SBuffer<I>
> +where
> +    I: Iterator<Item =3D &'a mut [u8]>,
> +{
> +    /// Returns a mutable slice of at most `len` bytes, or `None` if we =
are at the end of the data.
> +    ///
> +    /// If a slice shorter than `len` bytes has been returned, the calle=
r can call this method
> +    /// again until it returns `None` to try and obtain the remainder of=
 the data.
> +    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
> +        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
> +    }
> +
> +    /// Ideally we would implement `Write`, but it is not available in `=
core`.
> +    /// So mimic `std::io::Write::write_all`.
> +    #[expect(unused)]
> +    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
> +        while !src.is_empty() {
> +            match self.get_slice_mut(src.len()) {
> +                None =3D> return Err(ETOOSMALL),
> +                Some(dst) =3D> {
> +                    let src_slice;
> +                    (src_slice, src) =3D src.split_at(dst.len());
> +                    dst.copy_from_slice(src_slice);
> +                }
> +            }
> +        }
> +
> +        Ok(())
> +    }
> +}
> +
> +impl<'a, I> Iterator for SBuffer<I>
> +where
> +    I: Iterator<Item =3D &'a [u8]>,
> +{
> +    type Item =3D u8;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Returned slices are guaranteed to not be empty so we can safe=
ly index the first entry.
> +        self.get_slice(1).map(|s| s[0])
> +    }
> +}
> --=20
> 2.50.1

