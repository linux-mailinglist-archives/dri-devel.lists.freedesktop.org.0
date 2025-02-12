Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACD1A31BFD
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 03:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8E010E081;
	Wed, 12 Feb 2025 02:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="AgN9z1y/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0010E081
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Feb 2025 02:27:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1DD625C5A5D;
 Wed, 12 Feb 2025 02:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 335CBC4CEDD;
 Wed, 12 Feb 2025 02:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739327249;
 bh=ZYzY4+l+dFRYzltNbW6pH6aQvA9KFT1LHvoYLNAw0oQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AgN9z1y/SGiCZfh4jONXnZe7Z3FTeK+evpamez7ckDebJkMxbSk6RtQEAHifX7y+t
 TYFG/MSCvMj9hM1QSBuMMcNivVAv2+SoNklsUbU7RnUjW/IKx8PcppLe+uq3OwIYQU
 AaSbXGe6qdG4u5NkzU9iATBqIRGx0AWMSnY4QYCAFvgWdMQ+uOpXfxOOWq9Cn9Qx5l
 58ZAdicfJ8mHP9XeQ7QTC0WhB7bheyIOoPYAJROSQQNGmqT6B99rM/phRsM943C3nk
 BkPudRTFvQx3eLJHokmwbC8L5D5kvnaPy5VIDAtJd5OOAx1K8+tlSjIBh8uET4lIBl
 hUvo3w0qKI4dg==
Date: Wed, 12 Feb 2025 02:27:27 +0000
From: Wei Liu <wei.liu@kernel.org>
To: mhklinux@outlook.com
Cc: haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 deller@gmx.de, weh@microsoft.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
Subject: Re: [PATCH 1/1] fbdev: hyperv_fb: iounmap() the correct memory when
 removing a device
Message-ID: <Z6wHDw8BssJyQHiM@liuwe-devbox-debian-v2>
References: <20250209235252.2987-1-mhklinux@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209235252.2987-1-mhklinux@outlook.com>
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

On Sun, Feb 09, 2025 at 03:52:52PM -0800, mhkelley58@gmail.com wrote:
> From: Michael Kelley <mhklinux@outlook.com>
> 
> When a Hyper-V framebuffer device is removed, or the driver is unbound
> from a device, any allocated and/or mapped memory must be released. In
> particular, MMIO address space that was mapped to the framebuffer must
> be unmapped. Current code unmaps the wrong address, resulting in an
> error like:
> 
> [ 4093.980597] iounmap: bad address 00000000c936c05c
> 
> followed by a stack dump.
> 
> Commit d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for
> Hyper-V frame buffer driver") changed the kind of address stored in
> info->screen_base, and the iounmap() call in hvfb_putmem() was not
> updated accordingly.
> 
> Fix this by updating hvfb_putmem() to unmap the correct address.
> 
> Fixes: d21987d709e8 ("video: hyperv: hyperv_fb: Support deferred IO for Hyper-V frame buffer driver")
> Signed-off-by: Michael Kelley <mhklinux@outlook.com>

Applied to hyperv-fixes. Thanks.
