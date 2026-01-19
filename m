Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F32AD3B2D6
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1B7A10E4D1;
	Mon, 19 Jan 2026 16:58:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Jema+que";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00CDD10E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:58:45 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id
 6a1803df08f44-88a3d2f3299so46752226d6.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768841925; x=1769446725; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ljxKTxaVdu8I0ces4FnKFMKgo+H8JcchtOlXOe2X8IE=;
 b=Jema+queIL0hQwAtJFjPoQTtTKh/xtjTGhoD6njed7GJWMUrzhR5YhlssnJTF/XK7O
 /Kqf8kWiuvM3qijCCiQi+t+km8lLR1/23sLOL2S3FsC3tMOschYF7BJViBdeVSxsK/Ot
 9LKl7P0z65DxYczWufYFxOmYVUpxfAu1tThZdxyYnGuiIkjt/PrYCwIXFmDM8VQ79f9n
 KeXlchhlcqnbyWlWjpLviRLXM30BxaJ9kpuIXl1IVQh6ifwGCM5iDmqXT6BFY25y650q
 LP0U+NdWcqlupLjL/1Es5zwZtgGhSC9INZXGwSQa7UOPL77rsXQ94kMZwW3OGlyZBiz9
 2vcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768841925; x=1769446725;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ljxKTxaVdu8I0ces4FnKFMKgo+H8JcchtOlXOe2X8IE=;
 b=In3EgEYv5PUGvPL7cmYQHjsP5nez2u7cgVCYZIoiEFyBl3+k/82xOSpxdMuKA7GBBk
 d/Xu/Hyc10RnWzCLtR6F5bXsBgJGAr7mSydEUsvegwwLOm6mUyzUuStIPC7j1eVJIR33
 WdBC0a7WBx64vJoKFYqwoWcPVUSXQmlZcYN7U0YDLDhkiyNPP/Q02fVCcmqq/BXyiTxk
 fpYif9U0bJQvxyCtwGhPIMy7L1yRI86lsjdUoDAO8bMS9LYsl4gIFdvOHl06OhxL2kci
 Z4AZFmy6umvC5NyILLJGJ9p2duUSUQ2O8QfYwairSjiS4r40CLuQoklWkcFuYSYabxtf
 aeXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUJle0g3d5PqaIWKOqkkIQBhEO6YyjcXgvNcuTbxwFZXpPOH+/7Q5aAWaK7YafLX1o0IlXIrHydxPk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxhZZWNNqJircN3ZnWDPn0gGY3QTV9iPE0+TeOKYiqj8Hw0asN
 QBnIYaUIa32EKzJ/0b7oVRmSfRHryiC955pHszHYc4Z27vDDJqyeKYdJcgvpEcgAxQU=
X-Gm-Gg: AZuq6aIXSOn0DBpMSozl5WloUzmTLb7DzzCRcpYOMC6qGcg/HZ7baz7VmtxLfU/Lu9J
 pEoJ+ZpE1OpUE9Mv+V2sif88rwl7T34dUpwW0KN68utbALg2rLkib1W2rKCwoLci23f/FuUS5z9
 QG/fTu9KSzlWdRu/kPxAjkzNbYTkbh5kPmj2ovlM23NIHStDI3eKY5ni+L+1AUbZajWaBj4Nck9
 Djuv/MMugWkAQnaJSoy9mme2IMORVc0PwNQPb0BC35UXO7jSRotPGEzCULPA/KGUg28fU5bGzd9
 hkAZWw+nDzsb71Glk5ZgHmGnR8ZpaVkqdTewmgyKMt3aNXHmy82aE12yur+uiW5fruiQxjf/wBH
 G6WJbwOc5jUk/AvkgUii/NtRSTR+Y/0tmxSBgC83shKgQPa6yX9TpGjA5PiGA/lLxJSjDThwaKn
 8HWMXVPyjq2I4MoxW9uoklI4NDPhSKivsFx1KzkBKb7AKamOki9RaVzgs10vYJJ6/l7SUJoMtTT
 haV1g==
X-Received: by 2002:a05:6214:2523:b0:88a:2e39:957e with SMTP id
 6a1803df08f44-8942dd9e90fmr129930286d6.57.1768841924690; 
 Mon, 19 Jan 2026 08:58:44 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8942e5e526dsm87021366d6.12.2026.01.19.08.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:58:44 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhsaR-00000005IQb-2Wqn;
 Mon, 19 Jan 2026 12:58:43 -0400
Date: Mon, 19 Jan 2026 12:58:43 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Alex Williamson <alex@shazbot.org>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux.dev, intel-xe@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, iommu@lists.linux.dev, kvm@vger.kernel.org
Subject: Re: [PATCH v2 0/4] dma-buf: document revoke mechanism to invalidate
 shared buffers
Message-ID: <20260119165843.GH961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
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

On Sun, Jan 18, 2026 at 02:08:44PM +0200, Leon Romanovsky wrote:
> Changelog:
> v2:
>  * Changed series to document the revoke semantics instead of
>    implementing it.
> v1: https://patch.msgid.link/20260111-dmabuf-revoke-v1-0-fb4bcc8c259b@nvidia.com
> 
> -------------------------------------------------------------------------
> This series documents a dma-buf “revoke” mechanism: to allow a dma-buf
> exporter to explicitly invalidate (“kill”) a shared buffer after it has
> been distributed to importers, so that further CPU and device access is
> prevented and importers reliably observe failure.
> 
> The change in this series is to properly document and use existing core
> “revoked” state on the dma-buf object and a corresponding exporter-triggered
> revoke operation. Once a dma-buf is revoked, new access paths are blocked so
> that attempts to DMA-map, vmap, or mmap the buffer fail in a consistent way.

I think it would help to explain the bigger picture in the cover letter:


DMABUF has quietly allowed calling move_notify on pinned DMABUFs, even
though legacy importers using dma_buf_attach() would simply ignore
these calls.

RDMA saw this and needed to use allow_peer2peer=true, so implemented a
new-style pinned importer with an explicitly non-working move_notify()
callback.

This has been tolerable because the existing exporters are thought to
only call move_notify() on a pinned DMABUF under RAS events and we
have been willing to tolerate the UAF that results by allowing the
importer to continue to use the mapping in this rare case.

VFIO wants to implement a pin supporting exporter that will issue a
revoking move_notify() around FLRs and a few other user triggerable
operations. Since this is much more common we are not willing to
tolerate the security UAF caused by interworking with
non-move_notify() supporting drivers. Thus till now VFIO has required
dynamic importers, even though it never actually moves the buffer
location.

To allow VFIO to work with pinned importers, according to how DMABUF
was intended, we need to allow VFIO to detect if an importer is legacy
or RDMA and does not actually implement move_notify().

Introduce a new function that exporters can call to detect these less
capable importers. VFIO can then refuse to accept them during attach.

In theory all exporters that call move_notify() on pinned DMABUF's
should call this function, however that would break a number of widely
used NIC/GPU flows. Thus for now do not spread this further than VFIO
until we can understand how much of RDMA can implement the full
semantic.

In the process clarify how move_notify is intended to be used with
pinned DMABUFs.

Jason
