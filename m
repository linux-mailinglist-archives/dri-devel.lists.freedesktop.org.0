Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A6B26AA9
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 17:18:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D9E10E1FA;
	Thu, 14 Aug 2025 15:18:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IAe1z4KE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB5810E1FA
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 15:18:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54A8A601E0;
 Thu, 14 Aug 2025 15:18:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD719C4CEED;
 Thu, 14 Aug 2025 15:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755184700;
 bh=4p74E7bNCFHspyPHVUwYdRfNg1qoS7STRMQynF0Lho0=;
 h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
 b=IAe1z4KEpVoRwonxyQu3SDapDiUfj+I7Y3wzNpOUQtCnn7AcFZxUHBsy6g4xDKwRD
 DmX3DDIP+F0Y2/QVNt7aBy6vE2Wt8hWaSKi0EJawm5txPLIk/UaYaQ+DJazN1L2vf0
 WjV5hQYyhDWB65jj26THxzCzRYpDszyzgK9I4ocTTTGW+0fZ2G7u0bCF7Q9Vx24/L4
 fXYb7n1exYqiC8EDVcJqW25Kmy0RA5oZxdzi9ux8pp7mjyhjumr9dzYH4NXmoCgwNP
 eJ9GJ0Ven8n7uvz0Mra8TV5YzwRaCSz5RrZL6WY4QKm5+cj0mFQgXwsirW3h2MVnCm
 YN7wcxsljF1vg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 Aug 2025 17:18:14 +0200
Message-Id: <DC291P4PSHFC.OEKNWCGDFOJN@kernel.org>
Subject: Re: [PATCH 1/2] drm_gem: add mutex to drm_gem_object.gpuva
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Boris
 Brezillon" <boris.brezillon@collabora.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Steven Price" <steven.price@arm.com>,
 "Liviu Dudau" <liviu.dudau@arm.com>, "Rob Clark"
 <robin.clark@oss.qualcomm.com>, "Rob Herring" <robh@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250814-gpuva-mutex-in-gem-v1-0-e202cbfe6d77@google.com>
 <20250814-gpuva-mutex-in-gem-v1-1-e202cbfe6d77@google.com>
 <DC28NIMIPF5I.2P17OZFA06GXL@kernel.org>
 <CAH5fLgiYqQA-jcz=S_u8EjHkpr65m6nU9DHRkRWs3js8v3Uadg@mail.gmail.com>
In-Reply-To: <CAH5fLgiYqQA-jcz=S_u8EjHkpr65m6nU9DHRkRWs3js8v3Uadg@mail.gmail.com>
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

On Thu Aug 14, 2025 at 5:01 PM CEST, Alice Ryhl wrote:
> I had wanted to move it below free(), but we can't do that since
> free() also performs the kfree() call.

Actually, I think it belongs in drm_gem_private_object_fini(), where also c=
all
dma_resv_fini() for the GEM owned dma-resv lock.

Any cleanup should be done from where a driver calls drm_gem_object_release=
().
