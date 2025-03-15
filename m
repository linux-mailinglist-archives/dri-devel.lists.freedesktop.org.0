Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1759AA6313B
	for <lists+dri-devel@lfdr.de>; Sat, 15 Mar 2025 19:04:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EAE110E00A;
	Sat, 15 Mar 2025 18:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="lJDu4Gvz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D571C10E00A;
 Sat, 15 Mar 2025 18:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742061868; x=1742321068;
 bh=zMY+WAQc14J08GzAX+iNlnPGPVWT6EmF6qM4eIj0Zkk=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=lJDu4GvzZ4aGl5Gi3KECAOdZAhaYWikwvEsa/1w3x+kkD5sUxdgBBatmGwC0Zy8jN
 y/pmmeai818LZuGBiJPjcUIjxbaX+g+7lY7AKCtQlU4Sqet6mLm0cv8dOjJfIYbGqy
 M/76mNE2QIaPKKN7fQ+6Gd8uCdbMSnv99XT5MdIqOjqMIl+Pz0e8KhMSkwnX3nJ8+J
 yF8rzrSoe5YMVDuK2JDWqsSx/ARgssu2v+wb8AG6vo57mwbupaC2y+5fVm296mguMV
 64dLoyl9Buu5HF8TTROOpJKwUBGLJilGagdyBF8OIp6/EO8iRL5J5PH4E0ByM8Pszh
 RpxA7KwT1Mk4A==
Date: Sat, 15 Mar 2025 18:04:20 +0000
To: Andrew Ballance <andrewjballance@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: a.hindborg@kernel.org, acourbot@nvidia.com, airlied@gmail.com,
 alex.gaynor@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, corbet@lwn.net, dakr@kernel.org,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu,
 tzimmermann@suse.de
Subject: Re: [PATCH 1/3] rust: alloc: add Vec::truncate method
Message-ID: <D8H1DYGA2P3U.1PHDBOU2YOBS3@proton.me>
In-Reply-To: <20250315111511.107047-1-andrewjballance@gmail.com>
References: <D8GRAC8YQIVC.2LS1EIIIRZU3I@proton.me>
 <20250315111511.107047-1-andrewjballance@gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 2f9f513866f9fb231af860e3cf39013bf22ca7b9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

On Sat Mar 15, 2025 at 12:15 PM CET, Andrew Ballance wrote:
> On Sat, Mar 15, 2025 at 10:09:26AM +0000, Benno Lossin wrote:
>> On Sat Mar 15, 2025 at 3:42 AM CET, Andrew Ballance wrote:
>> > implements the equivalent to the std's Vec::truncate
>> > on the kernel's Vec type.
>> >
>> > Signed-off-by: Andrew Ballance <andrewjballance@gmail.com>
>> > ---
>> >  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
>> >  1 file changed, 36 insertions(+)
>> >
>> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
>> > index ae9d072741ce..75e9feebb81f 100644
>> > --- a/rust/kernel/alloc/kvec.rs
>> > +++ b/rust/kernel/alloc/kvec.rs
>> > @@ -452,6 +452,42 @@ pub fn reserve(&mut self, additional: usize, flag=
s: Flags) -> Result<(), AllocEr
>> > =20
>> >          Ok(())
>> >      }
>> > +
>> > +    /// Shortens the vector, setting the length to `len` and drops th=
e removed values.
>> > +    /// If `len` is greater than or equal to the current length, this=
 does nothing.
>> > +    ///
>> > +    /// This has no effect on the capacity and will not allocate.
>> > +    /// # Examples
>> > +    /// ```
>> > +    /// let mut v =3D kernel::kvec![1, 2, 3]?;
>> > +    /// v.truncate(1);
>> > +    /// assert_eq!(v.len(), 1);
>> > +    /// assert_eq!(&v, &[1]);
>> > +    ///
>> > +    /// # Ok::<(), Error>(())
>> > +    /// ```
>> > +    pub fn truncate(&mut self, len: usize) {
>> > +        if len >=3D self.len() {
>> > +            return;
>> > +        }
>> > +
>> > +        // [new_len, len) is guaranteed to be valid because [0, len) =
is guaranteed to be valid
>> > +        let drop_range =3D len..self.len();
>> > +
>> > +        // SAFETY:
>> > +        // we can safely ignore the bounds check because we already d=
id our own check
>> > +        let ptr: *mut [T] =3D unsafe { self.get_unchecked_mut(drop_ra=
nge) };
>>=20
>> What's this `get_unchecked_mut` method, I don't see it in `rust-next` or
>> `alloc-next`.
>
> Vec derefs into a slice which implements get_uncheked_mut
> https://rust.docs.kernel.org/next/kernel/alloc/kvec/struct.Vec.html#metho=
d.get_unchecked_mut

Ah, I forgot about that... Can you change the safety comment to:

    // SAFETY: `drop_range` is a subrange of `[0, len)` by the bounds check=
 above.

---
Cheers,
Benno

