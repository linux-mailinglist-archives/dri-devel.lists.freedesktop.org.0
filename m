Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EC4A4CB39
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 19:48:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319D510E4C9;
	Mon,  3 Mar 2025 18:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S97TeUIc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2DD710E4D7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 18:48:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3871F5C5ADE;
 Mon,  3 Mar 2025 18:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA237C4CED6;
 Mon,  3 Mar 2025 18:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741027679;
 bh=5oWRROZqGFHuAlhA/NK9lyi0GVa5LcWNwWWm2UXCBq4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=S97TeUIcJ8hwHDjxj8fX2DZzbpz/OFG/6qUrnIOhgE8d3DpEZOattu+XViC3jiwdj
 sUEJZig/GdL6quDxN/QJpPn9WRIbzpQ4zIGOy+aD3P6OwCeS1OzZxbpoBBZZkdaRNT
 GwBtz695kfJjufCJLAzUdPyASyLRSQ9ThXAY92kDyAJHNyIiMrqc8+E48cwa5bDKsp
 rUSbKvL4NlB81s2gGhwm54LRWClRIl0QW58sot0qWbIDjiTkk1oYIqWNNp1XOjbMGq
 pBvxaqxzU7rb3RwplSbkFV9MJ30y6+/9G8er3F+51tS3tI9ge7p+Ln5nQjvCw0gxzF
 4BfgvdEzyaFbw==
Date: Mon, 3 Mar 2025 10:47:56 -0800
From: Kees Cook <kees@kernel.org>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/gma500: Replace deprecated strncpy() with strscpy()
Message-ID: <202503031047.E80BD9D83@keescook>
References: <20250225203932.334123-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250225203932.334123-1-thorsten.blum@linux.dev>
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

On Tue, Feb 25, 2025 at 09:39:32PM +0100, Thorsten Blum wrote:
> strncpy() is deprecated for NUL-terminated destination buffers. Use
> strscpy() instead and remove the manual NUL-termination.
> 
> Compile-tested only.
> 
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Yup, the adapter var is already zeroed out, so even if NUL padding is
needed, it is already present.

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
