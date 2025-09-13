Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF1DB5611C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 15:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A87E210E1CF;
	Sat, 13 Sep 2025 13:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HEGru90Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDAB410E035;
 Sat, 13 Sep 2025 13:30:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2D2454194A;
 Sat, 13 Sep 2025 13:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C946C4CEF4;
 Sat, 13 Sep 2025 13:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757770244;
 bh=uV6AIY3tX6ZFbEbK51nPPUHpEf3Vl5idHgfbQrj2RXs=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=HEGru90QW4kc+aEL2YYRxXYkaCbmNxKMtYkOHgKiH/LaRkWhOjikL2I21k3MEhhWE
 w6k97DXeAQZ20nIexQdiEnhyxWzyox46F0JEDtqeTThu347OfGa96ORNp7h3TCYYQW
 weR8QKgDRRahKjU+kRdVLw2DLI3efPoLoX29RTgETFLorDFx0TB4lvMt4+15mIxsQn
 NMTQyzDWGSBoeUOaXOCBly0alT3C20yHjA3Gag40OIPoiufLibtm9MeuHyd6Iqay9O
 dnrFoDPTTYMIPfJ38pD3yEO3/EV0YRWx1H/lgF1aM3tNjcy/porZoJ46J3jk44wEOZ
 QZpSGK4696qnw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Sep 2025 15:30:31 +0200
Message-Id: <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250911-nova_firmware-v5-0-5a8a33bddca1@nvidia.com>
 <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
In-Reply-To: <20250913010226.GA1478480@joelbox2>
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

On Sat Sep 13, 2025 at 3:02 AM CEST, Joel Fernandes wrote:
> Any chance we can initialize the locks later? We don't need locking until
> after the boot process is completed, and if there's a way we can dynamica=
lly
> "pin", where we hypothetically pin after the boot process completed, that
> might also work. Though I am not sure if that's something possible in
> Rust/rust4linux or if it makes sense.

We can't partially initialize structures and then rely on accessing initial=
ized
data only. This is one of the sources for memory bugs that Rust tries to so=
lve.

You can wrap fields into Option types and initialize them later, which woul=
d
defer pin-init calls for the price of having Option fields around.

However, we should never do such things. If there's the necessity to do
something like that, it indicates a design issue.

In this case, there's no problem, we can use pin-init without any issues ri=
ght
away, and should do so.

pin-init is going to be an essential part of *every* Rust driver given that=
 a
lot of the C infrastruture that we abstract requires pinned initialization,=
 such
as locks and other synchronization primitives.
