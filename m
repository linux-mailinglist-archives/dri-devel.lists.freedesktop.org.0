Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249C4A68F32
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 15:34:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C9010E23D;
	Wed, 19 Mar 2025 14:34:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8016310E23D;
 Wed, 19 Mar 2025 14:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1742394858; x=1742654058;
 bh=1z4dJFA1oF0CRRS/sExQ1v3obrgN9+5/FwLBH297BOY=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=XMoYDFA9E4VJhCiq6RWj9hUWXDW1RXu5dTWuuMTLu2ZXX1uQosPiLRnfED+LRlnrK
 7jTWKnnGyl7rs4+AKxtswN5p3jlJxLvD2e5zyFI2EeVYZYtzN+eqwb6eeuuPvG+j4y
 TyG9DOFNa8InpV9OEOZbDn6dz4Lzokya8A6WViRztDXVOvjPMskM3cgfztWmXD+fon
 GmHnTgLNARNkMKInCTT8z2hy3tdCSjRJ8phuKFfRHHgGwfZgZYIxtNA+O36/+FHXNy
 XDNTdzW5j8zdLOoaLpL+VNm211+4QtNxZeaLCsfytlTJYUEDkfduqkED6y4VVZ2VJy
 Ravj30YhjkgwA==
Date: Wed, 19 Mar 2025 14:34:13 +0000
To: Tamir Duberstein <tamird@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: Andrew Ballance <andrewjballance@gmail.com>, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
Message-ID: <D8KBFC9M74H5.4ZJ2SJK06SGR@proton.me>
In-Reply-To: <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
 <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
 <CAJ-ks9k+A1+0CWXZmD2m0+jRqTRTNFn-=d9VXqytiOqvn4BR0w@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 7359374f116b2f0b801718ab9a5a44bdad44f80a
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

On Wed Mar 19, 2025 at 2:42 PM CET, Tamir Duberstein wrote:
> On Tue, Mar 18, 2025 at 8:50=E2=80=AFPM Benno Lossin <benno.lossin@proton=
.me> wrote:
>>
>> On Tue Mar 18, 2025 at 9:12 PM CET, Tamir Duberstein wrote:
>> > On Sun, Mar 16, 2025 at 7:17=E2=80=AFAM Andrew Ballance
>> > <andrewjballance@gmail.com> wrote:
>> >> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags)=
 -> Result<(), AllocError> {
>> >> +        if new_len > self.len() {
>> >> +            self.extend_with(new_len - self.len(), value, flags)
>> >> +        } else {
>> >> +            self.truncate(new_len);
>> >> +            Ok(())
>> >> +        }
>> >> +    }
>> >
>> > You can avoid underflow checking in debug builds by using `checked_sub=
`:
>>
>> `checked_sub` doesn't only avoid underflow in debug builds, but rather
>> in all builds. But the code below is a good suggestion.
>
> Yes, I know :)
>
> I included that language because the underflow check is likely
> optimized away in release builds.

If the function is inlined and the compiler can argue that `new_len >
self.len()`, then yes, but otherwise I'm pretty sure it won't be
optimized away.

Also if it is optimized away, then the check was still "executed", so I
find it a bit misleading to say "in debug builds" (making it sound like
it wouldn't do it in non-debug builds).

---
Cheers,
Benno

