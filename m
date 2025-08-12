Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E892BB23A18
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 22:36:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464E10E63F;
	Tue, 12 Aug 2025 20:36:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cc8mOwnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 711AF10E63F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:35:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F4EE5C56BC;
 Tue, 12 Aug 2025 20:35:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2625AC4CEF0;
 Tue, 12 Aug 2025 20:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755030958;
 bh=+StpLUbIz4Cn8lrRgBX1tOfusvqJ9s3Ec800QrIyjPA=;
 h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
 b=cc8mOwnQMZouqZAXTEyb1qgwlK4LxASLn1WbYrTamO5NeyoXsjkgs45NM5Ncb6WeX
 lfrGeYSoJyYaUu/mwqNs4aR/NSPzwj/E20p6IlE4JbfJNUgnneyAPDcBuctVUNO/Ci
 zBjbIwiEwiuAnUOPIfRZ4Bmrk/Ay921LRP8MnzaYyx9tmeg/gqA7fMzyVWQICn+6D1
 L8HGJLEpqgdHcDZIUrsq+IidnYyDtSaa2AEd5sNgWED626W6EsGp6f62fb1l8IDodX
 H9awiY1T72RF14BTyzbL1DxAJBwy3wM1jGHCRtUxIitVHNvFxKZkDLkJ4lB9W4sVmB
 3kgHgKcu0V+aw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 22:35:52 +0200
Message-Id: <DC0QJT650CI5.268HLIHWB4L8I@kernel.org>
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
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 1/4] rust: alloc: replace aligned_size() with
 Kmalloc::aligned_layout()
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
 <CANiq72mWVmso1yMYGYih-NDwjB9E1iVE=_oSpPiSvqTu5mkE0g@mail.gmail.com>
 <DC0PSDBCPGVO.38EGYXRFQVM8N@kernel.org>
 <CANiq72nfpecn3qQqNJiXGDX_Veg1Q9yQF0BZzCk68Ue_i3qtVg@mail.gmail.com>
In-Reply-To: <CANiq72nfpecn3qQqNJiXGDX_Veg1Q9yQF0BZzCk68Ue_i3qtVg@mail.gmail.com>
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

On Tue Aug 12, 2025 at 10:12 PM CEST, Miguel Ojeda wrote:
> On Tue, Aug 12, 2025 at 10:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.or=
g> wrote:
>>
>> I don't think so, it just lead to pad to the alignment for Vmalloc too.
>>
>> Technically, this makes no difference, since Vmalloc is always PAGE_SIZE=
 aligned
>> and the size always a multiple of PAGE_SIZE.
>
> Got it, thanks for the quick reply! Then I guess we could have skipped
> the Fixes in this one, but it is not a big deal and as usual it
> depends on how one defines "fix".

Yeah, in the past I was more on the "'Fixes:' for actual bugs only" side of
things, but I changed my mind a bit; I find it useful to have this as a
reference even for minor issues that might not be actual bugs, such as this
one.
