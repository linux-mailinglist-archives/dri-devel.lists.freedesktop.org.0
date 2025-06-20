Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A40AE2117
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 19:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1135B10EBA9;
	Fri, 20 Jun 2025 17:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id EBAA510E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 12:25:34 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF4FE16F2;
 Fri, 20 Jun 2025 05:25:14 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B8D043F58B;
 Fri, 20 Jun 2025 05:25:30 -0700 (PDT)
Date: Fri, 20 Jun 2025 14:25:26 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
 Danilo Krummrich <dakr@kernel.org>, ojeda@kernel.org,
 alex.gaynor@gmail.com, aliceryhl@google.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 tmgross@umich.edu, alyssa@rosenzweig.io, lyude@redhat.com,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: Drop the use of Opaque for ioctl arguments
Message-ID: <aFRi8cqkIzOAIbeR@arm.com>
References: <20250619102102.750668-1-beata.michalska@arm.com>
 <aFPsjIFIC1J2qtdc@pollux> <DAQGIG20TJV6.3O4G0F4O72327@kernel.org>
 <6DB37626-8817-4939-AE8E-6A463186A550@collabora.com>
 <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DAQJERHUYQF0.2SVXG825J6Q9N@kernel.org>
X-Mailman-Approved-At: Fri, 20 Jun 2025 17:39:34 +0000
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

On Thu, Jun 19, 2025 at 03:17:31PM +0200, Benno Lossin wrote:
> On Thu Jun 19, 2025 at 2:26 PM CEST, Daniel Almeida wrote:
> > Hi Benno,
> >
> >> On 19 Jun 2025, at 08:01, Benno Lossin <lossin@kernel.org> wrote:
> >> 
> >> On Thu Jun 19, 2025 at 12:55 PM CEST, Danilo Krummrich wrote:
> >>> On Thu, Jun 19, 2025 at 12:21:02PM +0200, Beata Michalska wrote:
> >>>> diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
> >>>> index 445639404fb7..12b296131672 100644
> >>>> --- a/rust/kernel/drm/ioctl.rs
> >>>> +++ b/rust/kernel/drm/ioctl.rs
> >>>> @@ -139,7 +139,7 @@ pub mod internal {
> >>>>                             // asserted above matches the size of this type, and all bit patterns of
> >>>>                             // UAPI structs must be valid.
> >>>>                             let data = unsafe {
> >>>> -                                &*(raw_data as *const $crate::types::Opaque<$crate::uapi::$struct>)
> >>>> +                                &mut *(raw_data as *mut $crate::uapi::$struct)
> >>> 
> >>> I think we have to document the guarantees we rely on to create this mutable
> >>> reference.
> >> 
> >> If the C side is using pointers to read/write the value concurrently,
> >> this is wrong, it needs to be wrapped in Opaque.
> >> 
> >> ---
> >> Cheers,
> >> Benno
> >
> > How can this happen, exactly? Can you provide an example that corroborates it?
> 
> I don't have the context on this, I only saw a raw pointer being turned
> into a mutable reference and that's only possible if there are no shared
> or other exclusive references for the duration of its existence and no
> raw pointers are being used to access the value.

In this particular case, that conversion should be sound, as the raw pointer
originates from kernel's drm_ioctl(). The memory is being either allocated
dynamically or provided on the kernel stack for the sole purpose of serving
the handler. It's being exclusively owned by the handler for the duration of
the call. There is no concurrent access nor shared references, unless the
handler decides otherwise, but I do not see the reason why it would.
Within this strict scope, it should be safe to assume exclusive access to the
memory. This should align with Rust's aliasing rules ?

---
BR
Beata
> 
> ---
> Cheers,
> Benno
> 
> > The general pattern for drivers is to fill an uapi type and then wait on an
> > ioctl. The kernel then copies that using copy_from_user, so we're safe from
> > that perspective (i.e.: from the perspective of concurrent access from
> > userspace).
> >
> > In kernelspace, we usually extract arguments from the uapi types to then
> > dictate further processing inside drivers. In what way are these shared with
> > "the C side" ?
> >
> > If the result of this discussion is that we agree that this Opaque is not
> > needed, then we definitely need this patch, because using Opaque<T> complicates
> > all ioctls implementations by making it harder to get to the inner T in the
> > first place. We would have to needlessly add a lot of unsafe blocks for drivers
> > that wouldn't otherwise be there.
> >
> >
> > -- Daniel
> 
