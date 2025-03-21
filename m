Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947EDA6B62B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 09:44:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB87E10E10B;
	Fri, 21 Mar 2025 08:43:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="as1rQeXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DD210E10B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1742546635;
 bh=ZdMfirDqSxAiPoPdpxSL5z49ZYOXEt3ILIkDPg+hh20=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=as1rQeXYhMnRaCsPd82RZzQU24/nZIXzO2nWZ38SWBHexkWFTP7YGf+rzmQ6F5bhk
 XzGjRo2wCg7bndfyV2H/qCXP/UH3Z9P/IM+sNDbkNfpTomHk7MDNKvEr+oe22NR2+C
 Cm+K/shgkc30CRv+54GeWItwZLYcJdXRXIPdPbCAEw4sq5cdy/Mfmfrti9RLJw3AZ/
 ubgjrfISesgmRAxqrfayIYQINo60GkcCZtncqDaz5grVFi+dNTYP6EOM8uvbKACCsd
 b2ExAGklSfxooLTk04H+HbjhEPT6bv+qk4k/WBLVmwMNx1VIK5XeQwKqopIUoaAAuG
 4D1XNzd+TFqsw==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E158717E0EA9;
 Fri, 21 Mar 2025 09:43:54 +0100 (CET)
Date: Fri, 21 Mar 2025 09:43:51 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Karunika Choo <karunika.choo@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, Steven Price
 <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] drm/panthor: Move GPU info initialization into
 panthor_hw.c
Message-ID: <20250321094351.537c768c@collabora.com>
In-Reply-To: <20250321091645.0edec07a@collabora.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
 <20250320111741.1937892-5-karunika.choo@arm.com>
 <20250321091645.0edec07a@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Fri, 21 Mar 2025 09:16:45 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 20 Mar 2025 11:17:36 +0000
> Karunika Choo <karunika.choo@arm.com> wrote:
> 
> > This patch moves GPU info initialization into panthor_hw.c in
> > preparation of handling GPU register changes. The GPU register reading
> > operations to populate gpu_info are separated into an architecture
> > specific arch_*_gpu_info_init() function and is called via the new
> > function pointer abstraction under hw.ops.gpu_info_init().
> > 
> > Future GPU support will be performed by implementing a *_gpu_info_init()
> > function specific to that architecture version. It can call any existing
> > *_gpu_info_init() and extend it with additional register reads or
> > provide an entirely different implementation.  
> 
> Could you give us an insight into what the reg layout changes are? So
> far, they were mostly unchanged between GPU gens, and I'd really
> prefer we could keep the majority of them unchanged part of the commo 
> discovery, and only add the missing reads in the ->gpu_info_init()
> callback.
> 
> Note that I'm also working on abstracting mali device operations to add
> JM support to panthor, and the only things I had to specialize are:
> 
> - CSF ID for CSF
> - JS features/present masks for JM
> 
> The rest is just common. So what I have is a common gpu_init_info()
> helper that reads all the regs excepts those two, and after that, I
> have a device ops selection based on the arch major of the GPU ID [1].
> The device-specific GPU info are then read as part of the
> panthor_device_ops::init().

With the link this time :-).

[1]https://gitlab.freedesktop.org/bbrezillon/linux/-/blob/panthor-jm/drivers/gpu/drm/panthor/panthor_device.c?ref_type=heads#L359
