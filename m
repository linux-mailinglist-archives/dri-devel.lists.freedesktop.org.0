Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A23B23974
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 22:00:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB5210E638;
	Tue, 12 Aug 2025 20:00:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uYnrnmDQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3FA110E638
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 20:00:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 524D35C6812;
 Tue, 12 Aug 2025 20:00:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD53DC4CEF0;
 Tue, 12 Aug 2025 20:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755028808;
 bh=GzE/fgPQej2FTmYMnJMsxMATwFl8iRmRP2ZrYIoscBQ=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=uYnrnmDQdTRfYQS5s+Yv0cTOYj1BGESpyMf7SD6LHeuKVczrf7ExRQpGCqJU9Kf12
 eKvPh6g8EOFWn2tg7cKLYqxYc9vI7YKea9V2kzWHR6UBNUE8Xv/FbMdTWETMNZSXqh
 x4JjU1NOFU8uiLlKsRscwlQhw+gcVQPUhOCYCxkOqtwOXkLDF1ciDE1yVPJ2rv9/t8
 Uk2qjD1Qlf+8XLQ84nX5Onkb9NmxqzN7311GXijvWcyil3W132u8CBvj5m4ji7C4ho
 47yQUdx3szHLbLIhhzkbptTIQcDsElGctKMQQB4Icv1mDcJJ8wqP0t6fYbQIlhO49y
 vHqJJgj8kGuOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Aug 2025 22:00:02 +0200
Message-Id: <DC0PSDBCPGVO.38EGYXRFQVM8N@kernel.org>
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
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250731154919.4132-1-dakr@kernel.org>
 <20250731154919.4132-2-dakr@kernel.org>
 <CANiq72mWVmso1yMYGYih-NDwjB9E1iVE=_oSpPiSvqTu5mkE0g@mail.gmail.com>
In-Reply-To: <CANiq72mWVmso1yMYGYih-NDwjB9E1iVE=_oSpPiSvqTu5mkE0g@mail.gmail.com>
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

On Tue Aug 12, 2025 at 9:52 PM CEST, Miguel Ojeda wrote:
> Did this need Cc: stable or was it skipped since it is just extra padding=
?

I don't think so, it just lead to pad to the alignment for Vmalloc too.

Technically, this makes no difference, since Vmalloc is always PAGE_SIZE al=
igned
and the size always a multiple of PAGE_SIZE.

However, the patch is a prerequisite for the DRM device fix in patch 2.

- Danilo
