Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA384CD926F
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 12:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF883892ED;
	Tue, 23 Dec 2025 11:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vCdYhugs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F023892ED
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 11:51:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6750F6013A;
 Tue, 23 Dec 2025 11:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98972C113D0;
 Tue, 23 Dec 2025 11:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766490712;
 bh=9c54YY9A7fGSiQz1lBbQ3+lG4ROy8cLRKijs0mc7nRg=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=vCdYhugsA51y3Xv3I5SsRmT40oMcTlg73frEpLNzvad/5rNy6Lcjmz2FV0LP6Hbnd
 DiDlS4q3U0P5sV8F2BFUtN9WIfynjQ/4J4nQtFPJOgdyD4lapPSBIXuX0hs2d03BSP
 Tr9R5OlRl+Cz+8BVQ4o4FeWWuVEsfDrjUouGexSun2Shp4++LnVxVYJ1WvLyYH8NcK
 cD1j/uvxpUv6WmqWPxHEfw13gLwP+W3kEpWWUgQzCUbp3yU8Q3nc4P6FjsJLQdCKrJ
 /U9C5mJ3DTYW27Zmc0FDH2p9X9IMEp+NtntB5fspwji7OSRY+gM1NsDP4GT+i2gQQ6
 Us1LiryAihrgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Dec 2025 12:51:46 +0100
Message-Id: <DF5KOZNXCR2G.72954E5A5R9Q@kernel.org>
Subject: Re: [PATCH] rust: drm: replace `kernel::c_str!` with C-Strings
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Tamir Duberstein" <tamird@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20251222-cstr-tyr-v1-1-d88ff1a54ae9@gmail.com>
 <8ED64170-53CC-4D03-BAC3-682ACF273ADF@collabora.com>
 <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
In-Reply-To: <CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com>
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

On Tue Dec 23, 2025 at 8:48 AM CET, Tamir Duberstein wrote:
> @Danilo is the overlap between the entries intended?

Yes, the overlap is intended. In DRM we have a common tree for Rust
infrastructure and Rust drivers. Therefore one entry refects the maintainer=
s of
the driver, the other entry reflects the maintainers of the tree the driver
patches flow through.

In terms of scripts/get_maintainer.pl not picking up the TYR entry, but onl=
y the
DRM RUST entry, I had a quick look and found a typo in the entry which does
prevent scripts/get_maintainer.pl to pick it up.

I will send a fix for this.

--

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fe1e8da6c2bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2158,7 +2158,7 @@ M:        Alice Ryhl <aliceryhl@google.com>
 L:     dri-devel@lists.freedesktop.org
 S:     Supported
 W:     https://rust-for-linux.com/tyr-gpu-driver
-W      https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
+W:     https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 B:     https://gitlab.freedesktop.org/panfrost/linux/-/issues
 T:     git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:     Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml

