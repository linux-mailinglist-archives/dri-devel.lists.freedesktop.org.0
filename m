Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 486FDC0F629
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:41:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE4110E517;
	Mon, 27 Oct 2025 16:41:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jyIJ2kiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B11110E517
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:41:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 73AF960539;
 Mon, 27 Oct 2025 16:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC23C4CEFD;
 Mon, 27 Oct 2025 16:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761583267;
 bh=YvO3EjSKrMULU4MU7n6apNKpcUJ205zLnvXrEAqn5rI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=jyIJ2kiAogOLX8i/NYhD7/KSkrZa/7Dl/4JnqQCG0wbkW8JkOpJ0399YbBT+e5bgh
 sxKqSnX0EklHI/SURIyAu3FPx8xvl4T105n94+bglWtBaudmMGFyk5QEiFOtaSF8L2
 zcO3TRHXiPQ+XoP2PKyI4Zt9hJqaDUfKNoEfpawoV/Dzd6Wx0saA5OWNPQiJIO9elU
 VoQZGb9THsu9D/uVQ35QVhoqk1dwlOTpmsLmhrMaU5TM3Ij3K2pBEgMPVzQegh+kpf
 x56bRGBxJozYgYTakX2KZwaK+NvFxxxbR6RlvAwhYVkD/bSneEHRXX84pxeYakQR4S
 6v8GAudwoNIUQ==
Date: Mon, 27 Oct 2025 10:41:01 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>
cc: Icenowy Zheng <uwu@icenowy.me>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Han Gao <rabenda.cn@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Inochi Amaoto <inochiama@gmail.com>, Yao Zi <ziyao@disroot.org>
Subject: Re: [PATCH v2] drm/ttm: add pgprot handling for RISC-V
In-Reply-To: <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
Message-ID: <5fed2297-4e51-6aa9-464a-6f8a2cf8fcc6@kernel.org>
References: <20251020053523.731353-1-uwu@icenowy.me>
 <dff6216d-b4a4-4d5d-89e3-e393dc018dec@amd.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-798525650-1761583098=:20800"
Content-ID: <d1ca5497-3239-01f3-606c-51cfffc22eec@kernel.org>
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-798525650-1761583098=:20800
Content-Type: text/plain; CHARSET=ISO-8859-15
Content-Transfer-Encoding: 8BIT
Content-ID: <e4c53a36-2fe4-7c79-5307-a54b036b1dd4@kernel.org>

On Mon, 27 Oct 2025, Christian König wrote:

> On 10/20/25 07:35, Icenowy Zheng wrote:
> > The RISC-V Svpbmt privileged extension provides support for overriding
> > page memory coherency attributes, and, along with vendor extensions like
> > Xtheadmae, supports pgprot_{writecombine,noncached} on RISC-V.
> > 
> > Adapt the codepath that maps ttm_write_combined to pgprot_writecombine
> > and ttm_noncached to pgprot_noncached to RISC-V, to allow proper page
> > access attributes.

[ ... ]

> > diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
> > index b3fffe7b5062a..aa137ead5cc59 100644
> > --- a/drivers/gpu/drm/ttm/ttm_module.c
> > +++ b/drivers/gpu/drm/ttm/ttm_module.c
> > @@ -74,7 +74,8 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
> >  #endif /* CONFIG_UML */
> >  #endif /* __i386__ || __x86_64__ */
> >  #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
> > -	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__)
> > +	defined(__powerpc__) || defined(__mips__) || defined(__loongarch__) || \
> > +	defined(__riscv)
> 
> Looks reasonable, but does that work on all RISC-V variants?

From an RISC-V architectural perspective, yes.

Of course there might be a hardware bug in some given manufacturer's 
implementation, but then again, that could happen on the other 
architectures as well.  


- Paul
--8323329-798525650-1761583098=:20800--
