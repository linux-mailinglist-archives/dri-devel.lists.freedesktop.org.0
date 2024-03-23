Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 811C1887A54
	for <lists+dri-devel@lfdr.de>; Sat, 23 Mar 2024 21:43:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B4A510E5A5;
	Sat, 23 Mar 2024 20:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="aZaIhBrj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1826810E5A5
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Mar 2024 20:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fCPVmTKTDT9EyIJ0uHfdJM731Jbw/NCBwbfsJq5CekM=; b=aZaIhBrjz22jMwp0SM08sH/hLU
 1bFkboFc7sPTz8pg01jpLcH5dV8yN9VUI+ED0rTwa813vL3E/n5erXdu09eINZ7/sN8zweecNHRzX
 mvSjZ2NFZWrUBHnJjqaNglpLOnWma6AITNJSydKL2hT9QVZBHwUmyw1/oJl8VhsEYF1cFpTw/cUK8
 eWQ8GLG+ijPEnmz/l5eObr1eLnwYTivbg4BBp8gCRK8XGaEGgL6fWJzVdeeFM7iRndcWMQABZ76Ub
 xmJblPfdQBu/K9WUwJ4iseww5L9rgeOemIlHaK8XLugINBZGqTAQq89K6AIj56PiTs0c+kryHhLym
 useNT0sQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1ro8DJ-0000000CWBj-2jRk;
 Sat, 23 Mar 2024 20:43:37 +0000
Date: Sat, 23 Mar 2024 20:43:37 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, corbet@lwn.net,
 javier.carrasco.cruz@gmail.com, skhan@linuxfoundation.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Fix duplicate C declaration warnings
Message-ID: <Zf8--QSkEMDe9zyp@casper.infradead.org>
References: <20240323163148.23497-1-amogh.linux.kernel.dev@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323163148.23497-1-amogh.linux.kernel.dev@gmail.com>
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

On Sat, Mar 23, 2024 at 10:01:47PM +0530, Amogh Cheluvaraj wrote:
> Fix duplicate C declaration warnings at
> Documentation/gpu/drm-kms.rst that was found by
> compiling htmldocs

I'm sure this removes the warning, but it removes all kernel-doc
which exists in drivers/gpu/drm/drm_fourcc.c.  Isn't there a more
granular fix than this?

> /home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
> kms:360: ./drivers/gpu/drm/drm_fourcc.c:344: WARNING: Duplicate C
> declaration, also defined at gpu/drm-kms:39.
> Declaration is '.. c:function:: const struct drm_format_info *
> drm_format_info (u32 format)'.
> /home/amogh/Linux_Kernel_Workspace/linux-next/Documentation/gpu/drm-
> kms:461: ./drivers/gpu/drm/drm_modeset_lock.c:392: WARNING: Duplicate C
> declaration, also defined at gpu/drm-kms:49.
> Declaration is '.. c:function:: int drm_modeset_lock (struct
> drm_modeset_lock *lock, struct drm_modeset_acquire_ctx *ctx)'.
> 
> Signed-off-by: Amogh Cheluvaraj <amogh.linux.kernel.dev@gmail.com>
> ---
> 
> changes in v2
> - add warnings found after compilation
> - fix grammar in commit description
> 
> ---
>  Documentation/gpu/drm-kms.rst | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
> index 13d3627d8bc0..a4145f391e43 100644
> --- a/Documentation/gpu/drm-kms.rst
> +++ b/Documentation/gpu/drm-kms.rst
> @@ -357,9 +357,6 @@ Format Functions Reference
>  .. kernel-doc:: include/drm/drm_fourcc.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_fourcc.c
> -   :export:
> -
>  .. _kms_dumb_buffer_objects:
>  
>  Dumb Buffer Objects
> @@ -458,9 +455,6 @@ KMS Locking
>  .. kernel-doc:: include/drm/drm_modeset_lock.h
>     :internal:
>  
> -.. kernel-doc:: drivers/gpu/drm/drm_modeset_lock.c
> -   :export:
> -
>  KMS Properties
>  ==============
>  
> -- 
> 2.44.0
> 
> 
