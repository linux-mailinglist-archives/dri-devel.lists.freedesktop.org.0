Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE23C2E81B
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 01:06:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C221B10E4F3;
	Tue,  4 Nov 2025 00:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="a0kb7eDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164A910E4F3
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 00:06:22 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-87a092251eeso79541706d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Nov 2025 16:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1762214781; x=1762819581; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=q7OiTJylN5oi1hTg8WqhFTipXs7uLO/TT2JZJ2yqlyQ=;
 b=a0kb7eDTRGAJ0T43dWEsPTgZR4M4sQOEvaDOMEacYs5A0y/M2k+R1Q2BdtDhrIelUI
 nZKtHecIOfQXAYvIgkN2hVZ+w1WOrEBCAIOA0KZmP3v8jpVlEqVMGbuiIXf2HdABNmT4
 JeLDPvo5fbj87uONoXdTyWqvBxhgDtCCcTJOaREA+M8YAoG2/mg7iMieXsGW9uzkeOku
 cquASEyp6o7NdK/wSnAiWFuqV9jKwo9bgWaz5SRquzTufAvpJ3ReoXAzKo6c6lMe+7dr
 rnfy3O9qFeX2oJRgAYo8IkkxJd+J2dZ8xFgFzxr5nKfPaV4GjDaJll2i61GcozaEGXnh
 sqEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762214781; x=1762819581;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7OiTJylN5oi1hTg8WqhFTipXs7uLO/TT2JZJ2yqlyQ=;
 b=qWpM9Fw8WiiwDILePQFmKpmzLnOL6nt8LiSc47D7D/CZ8mkZuAzeypaCnUccNmKdaQ
 jmXx/PKivBIrXyI3ZUbewUKrh0SFKi+7uYU0Ksb3bsL9bktiQM78zMnE8la923GKaW2C
 QWRncoxUc7dUZ7gIl9501kG1rO9k4DLNiLY1Fm7efhiZRZZPC81FLpoaF9EUGgkP0++2
 bQqEhzW2MI9SZ+bInSsKYOQx4UsZeYWkTchhaGPWhADMa9wk86kPz/Y+l69HTw+Too+s
 ioPkkNCQLkGny3HDO0PvUqjpN5AgyuNnmDLo6Tv8TO6KA74vC6akWO3pKFU2cdOXHZ7Y
 Z9EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAjN0xUedTdfclyTdmeTBMi2zpEMaGvjp5R/UHVjVFf4h2B2KCHLg+HAFpdseguHgjEAlcoHgAk3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYEMhvxZG0XDaryOsWfiGbhYZ3X+BAoONHossE3FbmWeq+pa0b
 7SVCDBtL4FyB9k6JXOsYq4uCnTi5LnjZBVOHt13H0QmG0n4Ih+AsBXL8KVLr7N6pJIE=
X-Gm-Gg: ASbGncsLUun9vBBSmF5IYPQ/1YiWbTO+wiWCoZxH08onlR+jmQDntQoIYCelZX/Dn0+
 SbMzVNjR/Zl5hOykM4V8L9sU/XfiHVzR4T3pwDCO/NMnI0dzcJ5v6cU0LLmK0OrYaDVPO1406KT
 T54vXBQaZTGCzjzqMahdrgBcD4nfTllIjnrSKGEcVHR/vkYGiPhZ0lmlXWWRYdXTcaAMATKmbNI
 1f62fLGoRCLv8lTt5i/tFPpHAtumt7THWqWuSuSBEwjK81gAzz40rhkPBxQXDqVBQXJ23/7YjOH
 q6f1iGWXDFP9P7knxAme44EvQ5ItqAtsGm5+xyg2HSgHBmNmh4U7EeOkks0rikH0DRur8HRumOa
 0jQAsA6xEYQ55z6A6g/CXJlSg8GQBuoXh8kBBYkRX9QAqfhU9/EhMIpRfsyBZwJkNhPoDnlw+vO
 eict5q2ztbzndwYvwhEWI84g7YYuwxLAO2bQ1plNZnO1+pkZk9NJ08pG4R
X-Google-Smtp-Source: AGHT+IHFK/K4+Si4Ey1hcSvTZvkQdBHi3cl9Mtxmbm7oCurYD+QrPfezppoNLd/K4DVB+Xp/dYAQ0Q==
X-Received: by 2002:a05:6214:f22:b0:87c:270b:aadb with SMTP id
 6a1803df08f44-880623a4a0emr16632746d6.16.1762214780972; 
 Mon, 03 Nov 2025 16:06:20 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88060de9b44sm10817116d6.20.2025.11.03.16.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 16:06:19 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vG4Z1-00000006cRs-0csK;
 Mon, 03 Nov 2025 20:06:19 -0400
Date: Mon, 3 Nov 2025 20:06:19 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Mastro <amastro@fb.com>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Alex Williamson <alex.williamson@redhat.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev,
 linux-mm@kvack.org, linux-doc@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, kvm@vger.kernel.org,
 linux-hardening@vger.kernel.org,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v6 00/11] vfio/pci: Allow MMIO regions to be exported
 through dma-buf
Message-ID: <20251104000619.GG1204670@ziepe.ca>
References: <20251102-dmabuf-vfio-v6-0-d773cff0db9f@nvidia.com>
 <aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQkLcAxEn4qmF3c4@devgpu015.cco6.facebook.com>
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

On Mon, Nov 03, 2025 at 12:07:12PM -0800, Alex Mastro wrote:
> On Sun, Nov 02, 2025 at 10:00:48AM +0200, Leon Romanovsky wrote:
> > Changelog:
> > v6:
> >  * Fixed wrong error check from pcim_p2pdma_init().
> >  * Documented pcim_p2pdma_provider() function.
> >  * Improved commit messages.
> >  * Added VFIO DMA-BUF selftest.
> >  * Added __counted_by(nr_ranges) annotation to struct vfio_device_feature_dma_buf.
> >  * Fixed error unwind when dma_buf_fd() fails.
> >  * Document latest changes to p2pmem.
> >  * Removed EXPORT_SYMBOL_GPL from pci_p2pdma_map_type.
> >  * Moved DMA mapping logic to DMA-BUF.
> >  * Removed types patch to avoid dependencies between subsystems.
> >  * Moved vfio_pci_dma_buf_move() in err_undo block.
> >  * Added nvgrace patch.
> 
> Thanks Leon. Attaching a toy program which sanity tests the dma-buf export UAPI
> by feeding the allocated dma-buf into an dma-buf importer (libibverbs + CX-7).

Oh! Here is my toy program to do the same with iommufd as the importer:

#define _GNU_SOURCE
#define __user
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/ioctl.h>
#include <unistd.h>
#include "include/uapi/linux/vfio.h"
#include "include/uapi/linux/iommufd.h"
#include <string.h>
#include <sys/mman.h>
#include <errno.h>

int main(int argc, const char *argv[])
{
	int vfio_dev_fd, iommufd_fd, ret;

	// Open the per-device VFIO file (e.g., /dev/vfio/devices/vfio3)
	vfio_dev_fd = open("/dev/vfio/devices/vfio0", O_RDWR);
	if (vfio_dev_fd < 0) {
		perror("Failed to open VFIO per-device file");
		return 1;
	}

	// Open /dev/iommu for iommufd
	iommufd_fd = open("/dev/iommu", O_RDWR);
	if (iommufd_fd < 0) {
		perror("Failed to open /dev/iommu");
		close(vfio_dev_fd);
		return 1;
	}

	// Bind device FD to iommufd
	struct vfio_device_bind_iommufd bind = {
		.argsz = sizeof(bind),
		.flags = 0,
		.iommufd = iommufd_fd,
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_BIND_IOMMUFD, &bind);
	if (ret < 0) {
		perror("VFIO_DEVICE_BIND_IOMMUFD failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

	// Allocate an IOAS (I/O address space)
	struct iommu_ioas_alloc alloc_data = {
		.size = sizeof(alloc_data),
		.flags = 0,
	};
	ret = ioctl(iommufd_fd, IOMMU_IOAS_ALLOC, &alloc_data);
	if (ret < 0) {
		perror("IOMMU_IOAS_ALLOC failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

	// Attach the device to the IOAS
	struct vfio_device_attach_iommufd_pt attach_data = {
		.argsz = sizeof(attach_data),
		.flags = 0,
		.pt_id = alloc_data.out_ioas_id,
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_ATTACH_IOMMUFD_PT, &attach_data);
	if (ret < 0) {
		perror("VFIO_DEVICE_ATTACH_IOMMUFD_PT failed");
		close(vfio_dev_fd);
		close(iommufd_fd);
		return 1;
	}

#if 0
	int mapfd = memfd_create("test", MFD_CLOEXEC);
	if (mapfd == -1) {
		perror("memfd_create failed");
		return 1;
	}
	ftruncate(mapfd, 4096);
#else
	struct dmabuf_arg {
		struct vfio_device_feature hdr;
		struct vfio_device_feature_dma_buf dma_buf;
		struct vfio_region_dma_range range;
	} dma_buf_feature = {
		.hdr = { .argsz = sizeof(dma_buf_feature),
			 .flags = VFIO_DEVICE_FEATURE_GET |
				  VFIO_DEVICE_FEATURE_DMA_BUF },
		.dma_buf = { .region_index = VFIO_PCI_BAR0_REGION_INDEX,
			     .open_flags = O_CLOEXEC,
			     .nr_ranges = 1 },
		.range = { .length = 4096 },
	};
	ret = ioctl(vfio_dev_fd, VFIO_DEVICE_FEATURE, &dma_buf_feature);
	if (ret < 0) {
		perror("VFIO_DEVICE_FEATURE_GET failed");
		return 1;
	}
	int mapfd = ret;
#endif

	struct iommu_ioas_map_file map_file = {
		.size = sizeof(map_file),
		.flags = IOMMU_IOAS_MAP_WRITEABLE | IOMMU_IOAS_MAP_READABLE,
		.ioas_id = alloc_data.out_ioas_id,
		.fd = mapfd,
		.start = 0,
		.length = 4096,
	};
	ret = ioctl(iommufd_fd, IOMMU_IOAS_MAP_FILE, &map_file);
	if (ret < 0) {
		perror("IOMMU_IOAS_MAP_FILE failed");
		return 1;
	}

	printf("Successfully attached device to IOAS ID: %u\n",
	       alloc_data.out_ioas_id);

	close(vfio_dev_fd);
	close(iommufd_fd);

	return 0;
}
