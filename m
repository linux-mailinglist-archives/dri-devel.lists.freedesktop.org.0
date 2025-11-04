Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BEDC32972
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659C410E089;
	Tue,  4 Nov 2025 18:18:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GUv3mfeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643AC10E089;
 Tue,  4 Nov 2025 18:18:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0C68A44391;
 Tue,  4 Nov 2025 18:18:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB74CC4CEF7;
 Tue,  4 Nov 2025 18:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762280319;
 bh=yGRnsBbb5Du0szO4BPlFV4TodS9lEiUCQrYF+bOx4vY=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=GUv3mfeOHDGSrgJUzJs9qVbo0p0dJU6bJ3d3FdiooDni+U0RK+SDizQkkR9iEsSc2
 yCiee8rVDxAfRAfRW5Hm8VU2YE5P9inYoRB5EG7J/FKeaV+b2ZFQTQoWKzwj07brWW
 6QWyCshNGNYEMeiORj+FIlUjyuAsxUntV0cubbpDUQaqwoNKwN2s8UZ5MZbLpTtqzn
 1GOXMpZAKrIM/LwmqTa7Jr4kIh6cVFQcXtG0YrykfLfO5wj69GR9nIUApG0KZHxjsT
 lDopn9GkN8ubdtA7/UWqCtz6V/pNRrW0HLhqs1e0sj2IL6Acu93MGyZfC5laBz4Dxv
 GBd7KsinxeLvA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Nov 2025 19:18:32 +0100
Message-Id: <DE048FD96PHV.2SXSVEHPD9ZOP@kernel.org>
Subject: Re: [PATCH 7/7] nova-core: mm: Add data structures for page table
 management
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <acourbot@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
 <20251020185539.49986-8-joelagnelf@nvidia.com>
 <CANiq72=SSQ5nSjt9yzX_A3Tgo2ByGM5CV0VqFnF1cTOzrZ-pbg@mail.gmail.com>
 <226d7dcb-26c3-4477-b1e9-2b837dc17cd1@nvidia.com>
 <CANiq72mqDWrLp9EjXHUgeODh1zh-9XaUnmgHWGgX2Awqs4G=cw@mail.gmail.com>
In-Reply-To: <CANiq72mqDWrLp9EjXHUgeODh1zh-9XaUnmgHWGgX2Awqs4G=cw@mail.gmail.com>
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

On Tue Nov 4, 2025 at 6:54 PM CET, Miguel Ojeda wrote:
> On Mon, Nov 3, 2025 at 8:21=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.=
com> wrote:
>> Also a lot of your suggestions are related to how it looks it rustdoc, s=
o I will
>> try to build rustdoc and see what it looks like as well, to get an idea =
of when
>> things in my patches could be improved.

For the drm-rust tree we also have a summary [1] of things committers are
expected to check (including a link to the generic kernel and Rust checklis=
t).

> Definitely, please do!

@Joel: Just be aware that for leaf crates no documentation is built yet, on=
ly
the kernel crate is built.

[1] https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-rust.html#submit-checklist
