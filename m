Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 234E5CCCD15
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:38:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C80E10E80A;
	Thu, 18 Dec 2025 16:37:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rmtKthG4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE72810E80A;
 Thu, 18 Dec 2025 16:37:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F242660010;
 Thu, 18 Dec 2025 16:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31901C116C6;
 Thu, 18 Dec 2025 16:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766075875;
 bh=ixJO0hu3i8cJobG3c4G/ECbCHJ9nWmL7QeH2/4xi6PA=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=rmtKthG4N75e7AtksrHk8MSlRGJ5S3zbRUQIQKN3ChxSzzwZmbTM5vghy6k/uqhT8
 7u/QOGX3h6jlBm7TTNis2wHRwnoQfOHhbvQ/AlfDdkuRXr8gEwuEjN4DVex09gDzCb
 pBYbnIP1nePsyj1v9XJOM+vHPwr5jjx6a9Ti2pEpPXDj5U8thW9sCbQKn34Pn4coQN
 oSBwEldbgTPWal2DuI6OII4H1P9CKnbECHAiUgRvS3YXb5iD5ygNQIaDwFF289J4sV
 s8/cwe1HNHvx0VydgWR2fhSMbHI8zyghZDq/xVEzQLup5rlwVAptrNbfVOI6dayFhy
 l8LPGvL4BcIEg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 17:37:47 +0100
Message-Id: <DF1HN90AG0R2.3TQDS8IQ6ZP0R@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 05/10] rust: kernel: Update ARef and AlwaysRefCounted
 imports to use sync::aref
Cc: "Igor Korotin" <igor.korotin.linux@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?=
 <arve@android.com>, "Todd Kjos" <tkjos@android.com>, "Martijn Coenen"
 <maco@android.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Christian
 Brauner" <brauner@kernel.org>, "Carlos Llamas" <cmllamas@google.com>,
 "Suren Baghdasaryan" <surenb@google.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Michal
 Wilczynski" <m.wilczynski@samsung.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
To: "Shankari Anand" <shankari.ak0208@gmail.com>
References: <1b7408c5-64a8-42f1-92ab-dd90a883c1a4@gmail.com>
 <20251205184023.7230-1-shankari.ak0208@gmail.com>
In-Reply-To: <20251205184023.7230-1-shankari.ak0208@gmail.com>
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

On Fri Dec 5, 2025 at 7:40 PM CET, Shankari Anand wrote:
> As this patch is part of a series, am I supposed to send all the patches =
with a v2,=20
> some have been acked by already, hence I had the question?

I suggest to resend the series without the patches that have been picked up=
 in
the meantime.

Also, I suggest to change the prefix in the patch subjects according to the
subsystem they target. For instance, you patch updating the USB stuff is na=
med
"rust: kernel: Update AlwaysRefCounted imports to use sync::aref", which ma=
y be
overlooked by maintainers.
