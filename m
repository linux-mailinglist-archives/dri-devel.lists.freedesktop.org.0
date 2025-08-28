Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF00B39A79
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 12:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 069AE10E1BE;
	Thu, 28 Aug 2025 10:42:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pBQ20whM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A28C10E1BE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 10:42:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 12754600AA;
 Thu, 28 Aug 2025 10:42:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C3AC4CEEB;
 Thu, 28 Aug 2025 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756377768;
 bh=ypxh1ppNtcbAwO5q5dht/FXyUWQup2iODRBHMyFnsuI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pBQ20whM5pgyxCfxv7buCvl7QI+5Bl+QJZKLx5VW7m9hrqs/hGicgawAEvLDFRFXR
 2QDYiLzeYdcgx4Hl+QWtpLaHiN0GbRxcKZW1+asbca55p+EfcJhHONly/GvpJ91x44
 AHx2+kKUp+6R/sQOuO5evCtMlkj7RShI0TmLToz5ShRjsjCF7Dz0wa5ezmr6Kj/Qc5
 VeFYW2NFj/5IZJJwtIeIAC0WGiANCKzT+NzrmweEHyVHbPCmZX5jvEYWOGIIMveXrl
 GkoqVdjPPsRROrUqkivc92g5pHwTWnrrtuQ/+Q8H9XUYRqgm+al18HKfQ0e798mSWx
 51fw3Z8fW0Ndw==
Message-ID: <3fabc3b4-a592-419e-a3f1-b13c40f3644e@kernel.org>
Date: Thu, 28 Aug 2025 12:42:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add mutex to drm_gem_object.gpuva list
To: Alice Ryhl <aliceryhl@google.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Rob Herring <robh@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
References: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250827-gpuva-mutex-in-gem-v3-0-bd89f5a82c0d@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 8/27/25 3:38 PM, Alice Ryhl wrote:
> Alice Ryhl (3):

Applied to drm-misc-next, thanks!

>        drm_gem: add mutex to drm_gem_object.gpuva
>        panthor: use drm_gem_object.gpuva.lock instead of gpuva_list_lock
>        gpuvm: remove gem.gpuva.lock_dep_map

     [ Use lockdep_is_held() instead of lock_is_held(). - Danilo ]

