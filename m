Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BB9FCCCCE8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 17:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6815610EA84;
	Thu, 18 Dec 2025 16:35:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kyVC97uO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29C10EA85;
 Thu, 18 Dec 2025 16:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6825B443D2;
 Thu, 18 Dec 2025 16:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A36FC4CEFB;
 Thu, 18 Dec 2025 16:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766075721;
 bh=NwliGA6POZUo0NrUjyXl5fIIG/7Xk3vSI0rDYbtTwr4=;
 h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
 b=kyVC97uOZEKzMdf67qIWldq8zHvQOoggsAKMh3mRCsmbVOs1IOjzfhcdapISY2SLQ
 u2uYBgNI7yYNvMol3FW3OU52sAgU259IW5xXGk1xHMsFjLD6tRPtDyUZuBkzIF16IO
 woNrUzAV25gkhsdSwvj8dfZvcKUc3lB+pSHF8CFbmIgk5TAsqaCKYusu1CD7UrNk8P
 a/YEcnhWlvht4VtGc4JJnzQpHR1CLe4pwAUTFf0Ol97OMGHBkln2nXNex9fYkf9lkB
 kH5gFtkIJnS5Pj5aqqXJ2LqOoTm/I9Dqps+mbXkB7NcE9UrPip0NBYXPW7l4Y+7E4H
 WCLDHRZ/s8jeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2025 17:35:13 +0100
Message-Id: <DF1HLAAHBNUF.3H9QT3WIINRR@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 00/10] rust: refactor ARef and AlwaysRefCounted imports
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>, "Todd Kjos"
 <tkjos@android.com>, "Martijn Coenen" <maco@android.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Christian Brauner" <brauner@kernel.org>, "Carlos
 Llamas" <cmllamas@google.com>, "Suren Baghdasaryan" <surenb@google.com>,
 "Alice Ryhl" <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Igor
 Korotin" <igor.korotin.linux@gmail.com>, "Michal Wilczynski"
 <m.wilczynski@samsung.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Robin Murphy" <robin.murphy@arm.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-pwm@vger.kernel.org>
To: "Shankari Anand" <shankari.ak0208@gmail.com>
References: <20251123092438.182251-1-shankari.ak0208@gmail.com>
In-Reply-To: <20251123092438.182251-1-shankari.ak0208@gmail.com>
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

On Sun Nov 23, 2025 at 10:24 AM CET, Shankari Anand wrote:

Applied to driver-core-testing, thanks!

> Shankari Anand (10):
>   rust: device: Update ARef and AlwaysRefCounted imports from sync::aref
>   rust: kernel: Update ARef imports to use sync::aref

    [ Change subject prefix to from 'kernel' to 'scatterlist'. - Danilo ]

>   samples: rust: Update ARef imports to use sync::aref

    [ Add 'debugfs' to the commit subject; be consistent with the existing
      import style for now. - Danilo ]
