Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93900AF83AD
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 00:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0568A10E916;
	Thu,  3 Jul 2025 22:42:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bx3fpcHK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF5710E916
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 22:42:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 172685C482F;
 Thu,  3 Jul 2025 22:42:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD1FC4CEE3;
 Thu,  3 Jul 2025 22:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751582572;
 bh=Kre+RqDlY7Qcvkm7QilmpLAdUpMv/U3UnwEhm/7wzLc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bx3fpcHKJCdnLE4fop7ZJtWgkDv9gJu2+/yEPATM+TLSMwJ8/XqOi7AYkl9GFn/MA
 ZEnnke7S9pEieglbkPAN7WMcmwH0lujyqU/a7L64H0OuSHhNTFHysYOwkSjQ69oFWL
 p0g1yRYMGE0X64+IG+2qBhe139rbgEM3s720ibr8IXg1kSL7zkApHV70/91pLp9mrr
 a4Z/7VVvhjQguhHImWvNnA7ia7hfGJfcC+H0u/nwZMLV3xVhRcQkjpmJt8kZIY2w/T
 tKmc1++aZSu0h3hMcIGB7gy4IoPZ5+Cmnl4KARwIKYtRamV93W+hexUIy796dN359P
 mvd81/KXASwIQ==
Date: Fri, 4 Jul 2025 00:42:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, acourbot@nvidia.com, alyssa@rosenzweig.io,
 lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] rust: drm: device: drop_in_place() the drm::Device in
 release()
Message-ID: <aGcHZtAGnnJBanRy@pollux>
References: <20250629153747.72536-1-dakr@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250629153747.72536-1-dakr@kernel.org>
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

On Sun, Jun 29, 2025 at 05:37:42PM +0200, Danilo Krummrich wrote:
> In drm::Device::new() we allocate with __drm_dev_alloc() and return an
> ARef<drm::Device>.
> 
> When the reference count of the drm::Device falls to zero, the C code
> automatically calls drm_dev_release(), which eventually frees the memory
> allocated in drm::Device::new().
> 
> However, due to that, drm::Device::drop() is never called. As a result
> the destructor of the user's private data, i.e. drm::Device::data is
> never called. Hence, fix this by calling drop_in_place() from the DRM
> device's release callback.
> 
> Fixes: 1e4b8896c0f3 ("rust: drm: add device abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-misc-fixes, thanks!
