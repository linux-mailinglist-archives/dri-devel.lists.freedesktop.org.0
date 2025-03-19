Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B31A681AD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 01:50:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1479010E284;
	Wed, 19 Mar 2025 00:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=proton.me header.i=@proton.me header.b="OuvlnTKG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B755010E4D8
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 00:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=6jba5to2fzf2tmn4smqyqpdmoq.protonmail; t=1742345439; x=1742604639;
 bh=VkL2Mxif+LYFPEMvRY4YuHUJQ31AetP3+c0xD9LJp+0=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
 b=OuvlnTKGDYLlG88upDBw7wr7g3AGCYM0aTNk3kRAoVprUuW+CF/kqquXw1cSicdLT
 uVn/H329nesx/xyayy2Fazl1UVyHZV/K9jTFAG2dKFAG0dRAq2X9EKmPTvy44/LhqH
 UHiRD60+7g1KXwgS4aJRWHPWE1eO7El1z6MIJnTGMDd/5NPPy77oQsWCNSa40MHR0S
 +WoI4I0EQk/x2iIHvxkVkXQ4zY4IbT36G7wYMVsFjOsIpmc8INPwpP/zzcrIZZVBJD
 ylra/qToQwv/F1EBGmh2weZubQEmvOe9vyQrqoJEt34Dm4R4WYR1Ork8tDUjgM+Fbl
 mmXzZ4qWCyItw==
Date: Wed, 19 Mar 2025 00:50:29 +0000
To: Tamir Duberstein <tamird@gmail.com>,
 Andrew Ballance <andrewjballance@gmail.com>
From: Benno Lossin <benno.lossin@proton.me>
Cc: dakr@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 corbet@lwn.net, ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, acourbot@nvidia.com,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 2/3] rust: alloc: add Vec::resize method
Message-ID: <D8JTWL8JY7DM.3IVH6FZ4M49CB@proton.me>
In-Reply-To: <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
References: <20250316111644.154602-1-andrewjballance@gmail.com>
 <20250316111644.154602-3-andrewjballance@gmail.com>
 <CAJ-ks9kAROOfyPtxMe6LE4-UPsvXca2sQ2VDjhRchZp3HLddGg@mail.gmail.com>
Feedback-ID: 71780778:user:proton
X-Pm-Message-ID: 124220e04b60981fd23d64c8176e2b18357079aa
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

On Tue Mar 18, 2025 at 9:12 PM CET, Tamir Duberstein wrote:
> On Sun, Mar 16, 2025 at 7:17=E2=80=AFAM Andrew Ballance
> <andrewjballance@gmail.com> wrote:
>> +    pub fn resize(&mut self, new_len: usize, value: T, flags: Flags) ->=
 Result<(), AllocError> {
>> +        if new_len > self.len() {
>> +            self.extend_with(new_len - self.len(), value, flags)
>> +        } else {
>> +            self.truncate(new_len);
>> +            Ok(())
>> +        }
>> +    }
>
> You can avoid underflow checking in debug builds by using `checked_sub`:

`checked_sub` doesn't only avoid underflow in debug builds, but rather
in all builds. But the code below is a good suggestion.

---
Cheers,
Benno

>         match new_len.checked_sub(self.len()) {
>             Some(n) =3D> self.extend_with(n, value, flags),
>             None =3D> {
>                 self.truncate(new_len);
>                 Ok(())
>             }
>         }
>
>>  }
>>
>>  impl<T, A> Drop for Vec<T, A>
>> --
>> 2.48.1
>>
>>
>
> Either way:
>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>


