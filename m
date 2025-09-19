Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4179B888B8
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 11:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BF510E971;
	Fri, 19 Sep 2025 09:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p3Ji3x3B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914D010E971
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 09:26:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 33060406D8;
 Fri, 19 Sep 2025 09:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B31BC4CEF0;
 Fri, 19 Sep 2025 09:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758273989;
 bh=QTRMRYKX0MaFllq/94rkyUi9FFuz1LfmIJpbHiO/UfY=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=p3Ji3x3BbitPt4pji1kyRyxpk/wbcoaw+nG5MoR8+52rV0fmB2Sad3fYUpl1kcrTK
 q3BDoxHY1UYqIg5ZzNwuVlFEaMyplB1QUSb7XbSAwmymH2bXFbCi/I7E6Sw0W9qJZ1
 AJBJnFLh1hasSGZiZIIgYrExMcpiNgo1R6E3+6CmbpjnbsgYWD1rF+0fYUNljoGm5w
 1IwLK/xvfJ4cwdHnzENrcBE2ZHIaiWj2Ws3LCiPLyxSg+GuBrlC0JIV+5cqoEiU4BQ
 ybyJvWMhRGsePrNznQ2K4xDlunk/lMNk4ZyV+0UAsXciPZQ+4QOv3UrJyzL1n+TGoT
 bCmD9UksQfT0Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Sep 2025 11:26:19 +0200
Message-Id: <DCWO3V7WQP0G.127BYBORGE85H@kernel.org>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
From: "Benno Lossin" <lossin@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.21.0
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2> <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
 <752F0825-6F2E-4AC0-BEBD-2E285A521A22@nvidia.com>
In-Reply-To: <752F0825-6F2E-4AC0-BEBD-2E285A521A22@nvidia.com>
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

On Fri Sep 19, 2025 at 9:59 AM CEST, Joel Fernandes wrote:
> Hello, Danilo,
>
>> On Sep 19, 2025, at 1:26=E2=80=AFAM, Danilo Krummrich <dakr@kernel.org> =
wrote:
>>=20
>> =EF=BB=BFOn Thu Sep 18, 2025 at 8:13 PM CEST, Joel Fernandes wrote:
>>>> On Thu, Sep 18, 2025 at 03:02:11PM +0000, Alice Ryhl wrote:
>>>> Using build_assert! to assert that offsets are in bounds is really
>>>> fragile and likely to result in spurious and hard-to-debug build
>>>> failures. Therefore, build_assert! should be avoided for this case.
>>>> Thus, update the code to perform the check in const evaluation instead=
.
>>>=20
>>> I really don't think this patch is a good idea (and nobody I spoke to t=
hinks
>>> so). Not only does it mess up the user's caller syntax completely, it i=
s also
>>=20
>> I appreacite you raising the concern,
>> but I rather have other people speak up
>> themselves.
>
> I did not mean to speak for others, sorry it came across like that
> (and that is certainly not what I normally do). But I discussed the
> patch in person since we are at a conference and discussing it in
> person, and I did not get a lot of consensus on this. That is what I
> was trying to say. If it was a brilliant or great idea, I would have
> hoped for at least one person to tell me that this is exactly how we
> should do it.

I'm also not really thrilled to see lots more turbofish syntax. However,
if we can avoid the nasty build_assert errors then in my opinion it's
better. (yes we do have Gary's cool klint tool to handle them correctly,
but not every user will be aware of that tool).

Maybe we should ask Rust about adding `const` arguments in their normal
position again :)

---
Cheers,
Benno
