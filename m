Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F90B290FD
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 01:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 526AA10E309;
	Sat, 16 Aug 2025 23:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QlOSUaad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE1F10E309
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 23:44:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EC6E25C4A70;
 Sat, 16 Aug 2025 23:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F91C4CEEF;
 Sat, 16 Aug 2025 23:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755387887;
 bh=Y2IR6l2xgHEwLKnQTmYLs6uvEGbn+JQI/rGwjQ/51pw=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=QlOSUaadKyFgKRVb2Cn92dQSeIR2FylNjXVpuV2hE1jnFOW0kDWQVOFWhhWJvkGsZ
 R8tQBGcrSZnsPNquiolfAslZiVBgKAbgIhFtt13sfsi4nwpT2WkpTC9NTNlBHRu1jo
 mEfCMqg/OmVMInxSFUV3DEgRTfe890VrWs8JPRC3ptYUsOT8i1QmDF3+IpvsEbWnB+
 a3s7F/vHEBz+u025pi+Mnsa2s+Croe+50shAWTIOpl9K665tkp0j2kUklxr2XJ3tCA
 4f8oEE1j6AqHqfxlPjIGZVC5mnEq2kaHEDFaAxCoKk7BJQ7ptNCZVRte+hXxeRPbZX
 v6ATu4mbrtvPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 Aug 2025 01:44:41 +0200
Message-Id: <DC492K7AA12K.2K9H9SPMPI2Y8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
Cc: <lorenzo.stoakes@oracle.com>, <vbabka@suse.cz>,
 <Liam.Howlett@oracle.com>, <urezki@gmail.com>, <ojeda@kernel.org>,
 <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
 <CANiq72mUXy6AYkwCW_kO3ikjNBc5pLzXw0+fXFGmYum0tGmw1g@mail.gmail.com>
In-Reply-To: <CANiq72mUXy6AYkwCW_kO3ikjNBc5pLzXw0+fXFGmYum0tGmw1g@mail.gmail.com>
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

On Sat Aug 16, 2025 at 10:40 PM CEST, Miguel Ojeda wrote:
> On Thu, Jul 31, 2025 at 5:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> +impl Kmalloc {
>> +    /// Returns a [`Layout`] that makes [`Kmalloc`] fulfill the request=
ed size and alignment of
>> +    /// `layout`.
>> +    pub const fn aligned_layout(layout: Layout) -> Layout {
>
> I think this `const fn` here was removed when applying to make it work
> with older compilers, right?

Yes, that's correct.

> I was fixing another `rusttest` thing and noticed while applying
> these. I had a patch to fix it, since we can actually just use the
> feature, and then I noticed it wasn't in the tree. Since I have it, I
> am attaching it for reference in case the now-stable feature is
> needed, e.g. if you want to make that `const fn` again.

I think it doesn't add much value for this to be a const function anyways, =
but
maybe it is more useful elsewhere? In that case, I think it also doesn't hu=
rt
to Kmalloc::aligned_layout() const again.
