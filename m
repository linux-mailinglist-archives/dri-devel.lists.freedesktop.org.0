Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB81BE0937
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 22:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 486A910E8D7;
	Wed, 15 Oct 2025 20:04:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="G3zkL1SR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62310E279;
 Wed, 15 Oct 2025 20:04:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3EAFB60140;
 Wed, 15 Oct 2025 20:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9FAC4CEF8;
 Wed, 15 Oct 2025 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760558675;
 bh=cyqnG9m8jI8VahDq8BIoiXhfaLpfWMHxWNT4baxcHG0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=G3zkL1SRn1gY62J1obluivrTEiJWWoCBDVoDCDgyxSUyE/6aEpGvGj71GzyRDeE/e
 jvP6DbfHUOEipUR7/uQNUfm27cAyZ2BlLBq6p/5AxzCp7mOSFwzk9T8XEt/fpy2Ewk
 nBuZxzrVgXNVbp7xTU5ConkKncp3w+OcTIJ3uAyeFtkpdyDH/Y5VnUd/VJh9cK40FO
 CWrF4jP0Vv/aIyL0TmicuR3vDdavkMy+as+9VUIXjQKkH8MEV2FFn2mweEPie6PibP
 SKpRMgR+yiYZJurZOJcHpA8yO584g4JTlD+Cth0uBZaR74KUpdoJ9uWE8PFS2Fbt60
 oT7JDz0qiR81g==
Message-ID: <409f2f03-2bc2-4cb8-9ca7-4e30f82077ff@kernel.org>
Date: Wed, 15 Oct 2025 22:04:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Solve mentions of `CoherentAllocation`
 improvements [COHA]
To: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org
References: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20251015194936.121586-1-delcastillodelarosadaniel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Daniel,

On 10/15/25 9:49 PM, Daniel del Castillo wrote:
> This patch solves the existing mentions of COHA, a task
> in the Nova task list about improving the `CoherentAllocation` API.
> I confirmed by talking to Alexandre Courbot, that the reading/writing
> methods in `CoherentAllocation` can never be safe, so
> this patch doesn't actually change `CoherentAllocation`, but rather
> tries to solve the existing references to [COHA].

This patch seems to address two different TODOs. Please split up the patch
accordingly.

> Signed-off-by: Daniel del Castillo <delcastillodelarosadaniel@gmail.com>
> ---
>  drivers/gpu/nova-core/dma.rs            |  20 ++---
>  drivers/gpu/nova-core/firmware/fwsec.rs | 104 ++++++++++--------------
>  2 files changed, 50 insertions(+), 74 deletions(-)
> 
> diff --git a/drivers/gpu/nova-core/dma.rs b/drivers/gpu/nova-core/dma.rs
> index 94f44bcfd748..639a99cf72c4 100644
> --- a/drivers/gpu/nova-core/dma.rs
> +++ b/drivers/gpu/nova-core/dma.rs
> @@ -25,21 +25,11 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, len: usize) -> Result<Sel
>      }
>  
>      pub(crate) fn from_data(dev: &device::Device<device::Bound>, data: &[u8]) -> Result<Self> {
> -        Self::new(dev, data.len()).map(|mut dma_obj| {
> -            // TODO[COHA]: replace with `CoherentAllocation::write()` once available.
> -            // SAFETY:
> -            // - `dma_obj`'s size is at least `data.len()`.
> -            // - We have just created this object and there is no other user at this stage.
> -            unsafe {
> -                core::ptr::copy_nonoverlapping(
> -                    data.as_ptr(),
> -                    dma_obj.dma.start_ptr_mut(),
> -                    data.len(),
> -                );
> -            }
> -
> -            dma_obj
> -        })
> +        let mut dma_obj = Self::new(dev, data.len())?;
> +        // SAFETY: We have just created this object and there is no other user at this stage.

The safety comment should rather confirm that it is guaranteed that the device
won't access this memory concurrently.

> +        unsafe { dma_obj.write(data, 0)? };
> +
> +        Ok(dma_obj)
>      }
>  }
>  
> diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
> index 8edbb5c0572c..cc5a6200d0de 100644
> --- a/drivers/gpu/nova-core/firmware/fwsec.rs
> +++ b/drivers/gpu/nova-core/firmware/fwsec.rs
> @@ -11,12 +11,12 @@
>  //! - The ucode signature, so the GSP falcon can run FWSEC in HS mode.
>  
>  use core::marker::PhantomData;
> -use core::mem::{align_of, size_of};
> +use core::mem::size_of;
>  use core::ops::Deref;
>  
>  use kernel::device::{self, Device};
>  use kernel::prelude::*;
> -use kernel::transmute::FromBytes;
> +use kernel::transmute::{AsBytes, FromBytes};
>  
>  use crate::dma::DmaObject;
>  use crate::driver::Bar0;
> @@ -70,6 +70,8 @@ struct FalconAppifDmemmapperV3 {
>  }
>  // SAFETY: any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FalconAppifDmemmapperV3 {}
> +// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
> +unsafe impl AsBytes for FalconAppifDmemmapperV3 {}
>  
>  #[derive(Debug)]
>  #[repr(C, packed)]
> @@ -82,6 +84,8 @@ struct ReadVbios {
>  }
>  // SAFETY: any byte sequence is valid for this struct.
>  unsafe impl FromBytes for ReadVbios {}
> +// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.

The full safety requirement is "Values of this type may not contain any
uninitialized bytes. This type must not have interior mutability.

Additional NIT: Please start sentences with a capital letter (Unfortunately the
comment above missed this as well).

Same for the cases below.

> +unsafe impl AsBytes for ReadVbios {}
>  
>  #[derive(Debug)]
>  #[repr(C, packed)]
> @@ -94,6 +98,8 @@ struct FrtsRegion {
>  }
>  // SAFETY: any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FrtsRegion {}
> +// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
> +unsafe impl AsBytes for FrtsRegion {}
>  
>  const NVFW_FRTS_CMD_REGION_TYPE_FB: u32 = 2;
>  
> @@ -104,6 +110,8 @@ struct FrtsCmd {
>  }
>  // SAFETY: any byte sequence is valid for this struct.
>  unsafe impl FromBytes for FrtsCmd {}
> +// SAFETY: any byte sequence is valid and it contains no padding nor kernel pointers.
> +unsafe impl AsBytes for FrtsCmd {}
>  
>  const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_FRTS: u32 = 0x15;
>  const NVFW_FALCON_APPIF_DMEMMAPPER_CMD_SB: u32 = 0x19;
> @@ -149,24 +157,9 @@ impl FirmwareSignature<FwsecFirmware> for Bcrt30Rsa3kSignature {}
>  ///
>  /// Callers must ensure that the region of memory returned is not written for as long as the
>  /// returned reference is alive.
> -///
> -/// TODO[TRSM][COHA]: Remove this and `transmute_mut` once `CoherentAllocation::as_slice` is
> -/// available and we have a way to transmute objects implementing FromBytes, e.g.:
> -/// https://lore.kernel.org/lkml/20250330234039.29814-1-christiansantoslima21@gmail.com/
> -unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
> -    fw: &'a DmaObject,
> -    offset: usize,
> -) -> Result<&'b T> {
> -    if offset + size_of::<T>() > fw.size() {
> -        return Err(EINVAL);
> -    }
> -    if (fw.start_ptr() as usize + offset) % align_of::<T>() != 0 {
> -        return Err(EINVAL);
> -    }
> -
> -    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
> -    // large enough the contains an instance of `T`, which implements `FromBytes`.
> -    Ok(unsafe { &*(fw.start_ptr().add(offset).cast::<T>()) })
> +unsafe fn transmute<T: Sized + FromBytes>(fw: &DmaObject, offset: usize) -> Result<&T> {
> +    // SAFETY: Guaranteed by the safety requirements of the function.

Please mention what is guaranteed and how it is guaranteed by the safety
requirements of the function (even if it seems trivial).

> +    T::from_bytes(unsafe { fw.as_slice(offset, size_of::<T>())? }).ok_or(EINVAL)
>  }
>  
>  /// Reinterpret the area starting from `offset` in `fw` as a mutable instance of `T` (which must
> @@ -176,20 +169,12 @@ unsafe fn transmute<'a, 'b, T: Sized + FromBytes>(
>  ///
>  /// Callers must ensure that the region of memory returned is not read or written for as long as
>  /// the returned reference is alive.
> -unsafe fn transmute_mut<'a, 'b, T: Sized + FromBytes>(
> -    fw: &'a mut DmaObject,
> +unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
> +    fw: &mut DmaObject,
>      offset: usize,
> -) -> Result<&'b mut T> {
> -    if offset + size_of::<T>() > fw.size() {
> -        return Err(EINVAL);
> -    }
> -    if (fw.start_ptr_mut() as usize + offset) % align_of::<T>() != 0 {
> -        return Err(EINVAL);
> -    }
> -
> -    // SAFETY: we have checked that the pointer is properly aligned that its pointed memory is
> -    // large enough the contains an instance of `T`, which implements `FromBytes`.
> -    Ok(unsafe { &mut *(fw.start_ptr_mut().add(offset).cast::<T>()) })
> +) -> Result<&mut T> {
> +    // SAFETY: Guaranteed by the safety requirements of the function.

Same here.

> +    T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
>  }
