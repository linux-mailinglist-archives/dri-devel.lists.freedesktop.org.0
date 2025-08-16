Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F432B290F9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 01:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2132F10E18F;
	Sat, 16 Aug 2025 23:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RjOTL/Cg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AEBC10E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 23:37:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2751060051;
 Sat, 16 Aug 2025 23:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F72BC4CEEF;
 Sat, 16 Aug 2025 23:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755387470;
 bh=n0Ug3xm97yHJIp9hnivwulo49/WkJhxthMq+zEpRlDU=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=RjOTL/CgXh7QEa1CPQmdNA/AiakjbtR6aWhcRkgaaQzVSUnXZz50KwC4Pzxd1Z5XO
 wK5dacrWZGYi4ZtT5vxh1E/JeYxpAOmFohF2EZFtMsC1aSh99JT0JsEj/T46+JkHv5
 YqZc64DjrvIGBIlh4MupDoBC6upfUDjA522/e8wiZ7i+6rZapv0f8s0WX+X6nLTXPP
 +W0eZcUShOYnccB32zZ4fqV6CUF10GDk/bG1vP8Zr+FcxXpk4ITw1hP9edMtUH/kOH
 W6vVHgAJHuTK05j9ew3vZIvD/m4vA0QW37v8Yqs4FHVHKGkm8ITPu8Zt82pEL/5z1I
 hpJUho5enQAPw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 Aug 2025 01:37:44 +0200
Message-Id: <DC48X8GV4JAW.1S68E9ZZHD9ZY@kernel.org>
Subject: Re: [PATCH] rust: alloc: fix `rusttest` by providing
 `Cmalloc::aligned_layout` too
Cc: "Alex Gaynor" <alex.gaynor@gmail.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Lorenzo Stoakes"
 <lorenzo.stoakes@oracle.com>, "Vlastimil Babka" <vbabka@suse.cz>, "Liam R .
 Howlett" <Liam.Howlett@oracle.com>, "Uladzislau Rezki" <urezki@gmail.com>,
 <rust-for-linux@vger.kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <patches@lists.linux.dev>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250816204215.2719559-1-ojeda@kernel.org>
In-Reply-To: <20250816204215.2719559-1-ojeda@kernel.org>
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

On Sat Aug 16, 2025 at 10:42 PM CEST, Miguel Ojeda wrote:
> Commit fde578c86281 ("rust: alloc: replace aligned_size() with
> Kmalloc::aligned_layout()") provides a public `aligned_layout` function
> in `Kamlloc`, but not in `Cmalloc`, and thus uses of it will trigger an
> error in `rusttest`.

Good catch, thanks! -- Applied to drm-misc-fixes.
