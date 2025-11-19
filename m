Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1584C70D58
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 20:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE11F10E265;
	Wed, 19 Nov 2025 19:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="mHhbBhpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612C610E265
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 19:36:40 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id
 d75a77b69052e-4ee158187aaso1122501cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 11:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763580999; x=1764185799; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
 b=mHhbBhpeJEjpNyB93tCUejTbGeehqwkjVpXE0S0ji2DMbWvSQyhcqWNOaRZtTCYWdN
 fcCEJsYm7kM34+Y1pmouvzRu9Z1TPCSrk0DWYmnBI4/MlNG6saBoBQH78c4B0HEOmnDR
 rOJAHl7kQ+iIeN/rKppKoZuoxUpqSvnRgjevnVE19aiCrKhNx/Lo6fctOO33W8tHVcz9
 RYHwEAWe0BzXgg21FoNo1XZBw9MSq8JI/jTQ+WGXX6WxzA8CJSzAUVhMa1+EBvX7YSSY
 h/zqEWs5RF4G1eO4HrklRIcw+EaB9A1xEkMjkDdXxwfAR0cJN8p2Xt7KxYjQpjoGQ81i
 MOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763580999; x=1764185799;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sztelLlBrONBmM282viGyh6kz65i94yYxCWrYWozdqM=;
 b=ZktV5OJgrBDCoj4ZEvm1L7fCiX1bL5afrwmVDasKk3QiZ8HH/MEPobs37JY9b8vd62
 OxhCqOnBY1e/0ApTue6dQ70RZ0mMIARSfxvvrCKjCUxiajo9FieviyipCiiegGwvVpXp
 BvYwjuAE60hL0wDLliuPcoDHoZ1BnV0qMoPPfVcwnOj0LLYhH8Q8pEso61xpg0TxxBon
 OwvE6gLHU1tPXyAhEPVL4WeYxmIowKvNuPaaemXQGIUyzucnIDnh8OgdDUD1gW/59TmJ
 WsPeA5wON8jTUCpjlLAj/WIkGqY4MSFhQDVdRKOFz2yQ0tTISRzdUHsxj+emW8inqXVO
 7O5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUx6ZbJRjvYfB1m3E7rFzTONRMa2Sh5+tD+OmZ7QzCQRcc3TdS7zVUaYl4QHPO1+GvNpS+LY+kgwmM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsZUmN7mPto8TGaumJiNPmYgnkDKWltcNByty0gQi9+XXkc+I/
 xLxDPdm8VW0nYD1pHUdUmimLHphooPlkfj7aRIa/ouzZUAKBbqbO5zdVPa82ZUiNKrc=
X-Gm-Gg: ASbGnctE2kbJjgASFSqgooVsHyi+pFMMdZBSQmxZsHFj6n1vPrj6t2uzjQ9pBYtXEgg
 O20uVZEtop4vNbuqdLjvs3SCd1udhNqY63f4fCbMIvin4S6x5aQkMrKo5nBfYimWc9DPx6o0FHZ
 MhrGp2fsKgPXwSSZ9e/FKMvJGkFUcF0Z5bspEfF9n58R+VPg/Zqk2RT+DTylf95BMoOq6asuJTD
 r590pWi5QKQtJx43ijt/zFI4mKSQKSsMSo3gMozPZWyg9sxZbyVdqsugdCS38U4pZJvx9kQpDWU
 8ZZQDurmZXWL/npwdrD2z3BN+8JrZDs8dTCcpKh18vO2xvmDgFrsmzEWANmZ3rz402SpH5Pk7Gg
 ST/YmeBuNb7U6PWss3+dE0mLg7V0Erwgyyqm9rKWX+FSTe2K4sUmPKjQL8ivN3OVNx3Kgi+6Hfd
 Ueb6s7mgpdOqaaIDn0xsA7JdM6OMA+Noigbkw7+/FfmdHz01/pl6RNCJHO
X-Google-Smtp-Source: AGHT+IEogkhlTHFcyAE9/u1UuBQV+X3tukog/nHIoHavB/ndnYOWZGPWrkYoYNh/EOln2cA+Kp4KoA==
X-Received: by 2002:a05:622a:310:b0:4ee:1d84:3068 with SMTP id
 d75a77b69052e-4ee4971a985mr8236121cf.76.1763580999342; 
 Wed, 19 Nov 2025 11:36:39 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48d64503sm3117901cf.13.2025.11.19.11.36.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Nov 2025 11:36:38 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vLnyo-00000000bYz-0lQx;
 Wed, 19 Nov 2025 15:36:38 -0400
Date: Wed, 19 Nov 2025 15:36:38 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Sumit Semwal <sumit.semwal@linaro.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org, Alex Mastro <amastro@fb.com>,
 Nicolin Chen <nicolinc@nvidia.com>
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
Message-ID: <20251119193638.GQ17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
 <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
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

On Wed, Nov 19, 2025 at 03:11:01PM +0100, Christian König wrote:

> I miss interpreted the call to pci_p2pdma_map_type() here in that
> now the DMA-buf code decides if transactions go over the root
> complex or not.

Oh, that's not it at all. I think you get it, but just to be really
clear:

This code is taking a physical address from the exporter and
determining how it MUST route inside the fabric. There is only one
single choice with no optionality.

The exporter already decided if it will go over the host bridge by
providing an address that must use a host bridge path.

> But the exporter can call pci_p2pdma_map_type() even before calling
> this function, so that looks fine to me.

Yes, the exporter needs to decide where the data is placed before it
tries to map it into the SGT.

Jason
