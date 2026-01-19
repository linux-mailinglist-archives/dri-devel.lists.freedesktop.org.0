Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B480D3B05E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B1CB10E4C6;
	Mon, 19 Jan 2026 16:20:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="HFsDn4Ir";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D5410E4DA
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 16:20:29 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id
 af79cd13be357-8c6a50c17fdso349575385a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 08:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1768839629; x=1769444429; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=8e3LOQmDLtNbqPr2ZRZYrAEb0+eSE57gTBol5BlL7sE=;
 b=HFsDn4IrZolA0+dw7D1dnQ4l+xDV2raTFFdCABhXzH5wVXyuKmY37SjxAtspPq9Or+
 96hCzkbmQakIGjhAc3Z3N2RQ1TO5l8kV3HB6B5tc0Nd91TwDKvE+z39uiU+Z41rIiGEH
 qsqMY4aWS8q1gnVeNNJmHWl2wdrTVjdtL1EqQhxXA/vO6MbG1BZxNGGXMrJpnK+1eCm8
 b0SlgCTfDuG6keYxx70LhGx7E9xxPaMsr2gxPHDrAdNMxaG17FQPVuRTYR92rdlyTZDm
 ynmPkG/8i24flf3EHFI4d6Z+Lepo9pBKCLThERDHClX2zBL29tM8U4ehGv94WnfSfuTx
 2Ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768839629; x=1769444429;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8e3LOQmDLtNbqPr2ZRZYrAEb0+eSE57gTBol5BlL7sE=;
 b=B2THBxiOzpugG6wrSLqMVDYPDa/BDYmjmk9Kx7++2txz9LcZx/HrSKGp/8fAO75AA/
 Sjo2LW16CHDpFEmxJ2n+JoUAmwjfROUhYa8v+9fgQVV83E5Yp8VqDFXystjpuidWHbXQ
 yy/OnVrgzBOEtU9f4dIUWryrgFI9pVwtPGP8nG4ykIK++B5lZNYrE1u0JwtZom9ZkOUs
 fmUgqvzUfvdvJiEOx1hEKHW702qwclBh35Ry39O+1hv+oOk4UL6EB7i1oV6TjFp/OpLg
 YDdjcehKpZBJ8Hdl1Kz/XEuPjnSSXLtJ7ljf1/0E57VfnOqRMe9fyhurlPXnkyofSUmm
 rcEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0JV06QAl2fOvgPAlQc7Ui6z03/O6TWfH0XTOqx6cy8sO1aozw6WVEfB29+BfYLwPf/9mpsrqBpQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl6CD3In8roATariJHj61E3OwVloVuu8HuP5//IFukZexduPQB
 PfcxpqRgEenR9vz+LC7ZJXJQhYlem/cgsoRI+3OAEMX+DeONQ0n8k6LxEpDHd+rSDic=
X-Gm-Gg: AY/fxX7Vu1mLKK1Yw8jY9Kmo0BfnDl5oXPU+1XN3WkYm/iQWsCgUbI8Bc65+vXCz+hP
 OGF6ymmQFmuCOJkGovN0xxKwt7zOF8uf4959qnVbqAGCDuvBg9A4h8vOIbcxIJ3eLHQ3LOp6u9X
 hcpAaPyOTMPqKYOoYQ7++Yb2+r2opCtFMZzOoQt6kqjWeqmLVMOuPdNa1VjdO91AFiuSRCJEsXN
 eRqNfojzCHxUolQ6KLOLeYy5YdBByTnphoMY40AuNQX5bkFVMAWn9mArDYMiN5dfQATZ0Thqlk7
 67Zv9675oblkiFk2VWrPIbmWcpv0za30rD5jq/EmzguHBV4tENn0iH9eRCDljk37xWm32Z8Zfpj
 +vdGHZv4Mte5zz3HW5esoSG0rM9bK5sg2/CMCOa+on3Kuk7vcsdVsnLgzFStjnIRqbjJdtXLND3
 CfG9MwnV60zHES/NncS7Hd3Wcji2hyHIw3/ntrUCJMCodC/8PekNRFy1WrwckNLQr+dv/8EGu5s
 rZKIQ==
X-Received: by 2002:a05:620a:7102:b0:8b2:7679:4d2d with SMTP id
 af79cd13be357-8c6a6948169mr1559881085a.63.1768839628533; 
 Mon, 19 Jan 2026 08:20:28 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8c6af506829sm597447585a.37.2026.01.19.08.20.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jan 2026 08:20:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vhrzP-00000005HvQ-0mnE;
 Mon, 19 Jan 2026 12:20:27 -0400
Date: Mon, 19 Jan 2026 12:20:27 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Leon Romanovsky <leon@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
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
Message-ID: <20260119162027.GD961572@ziepe.ca>
References: <20260118-dmabuf-revoke-v2-0-a03bb27c0875@nvidia.com>
 <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f115c91bbc9c6087d8b32917b9e24e3363a91f33.camel@linux.intel.com>
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

On Sun, Jan 18, 2026 at 03:16:25PM +0100, Thomas Hellström wrote:
> > core
> > “revoked” state on the dma-buf object and a corresponding exporter-
> > triggered
> > revoke operation. Once a dma-buf is revoked, new access paths are
> > blocked so
> > that attempts to DMA-map, vmap, or mmap the buffer fail in a
> > consistent way.
> 
> This sounds like it does not match how many GPU-drivers use the
> move_notify() callback.
> 
> move_notify() would typically invalidate any device maps and any
> asynchronous part of that invalidation would be complete when the dma-
> buf's reservation object becomes idle WRT DMA_RESV_USAGE_BOOKKEEP
> fences.
> 
> However, the importer could, after obtaining the resv lock, obtain a
> new map using dma_buf_map_attachment(), and I'd assume the CPU maps
> work in the same way, I.E. move_notify() does not *permanently* revoke
> importer access.

I think this was explained a bit in this thread, but I wanted to
repeat the explanation to be really clear..

If the attachment is not pinned than calling move_notify() is as you
say. The importer should expect multiple move_notify() calls and
handle all of them. The exporter can move the location around and make
it revoked/unrevoked at will. If it is revoked then
dma_buf_map_attachment() fails, the importer could cache this and fail
DMAs until the next move_notify().

If the attachment is *pinned* then we propose to allow the importer to
revoke only and not require restoration. IOW a later move_notify()
that signals a previously failing dma_buf_map_attachment() is no
longer failing can be igmored by a pinned importer.

This at least matches what iommufd is able to do right now.

IOW, calling move_notify() on a pinned DMABUF is a special operationg
we are calling "revoke" and means that the exporter accepts that the
mapping is potentially gone from pinned importers forever. ie don't
use it lightly.

Jason
