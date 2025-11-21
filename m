Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 138B5C76C23
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 01:23:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B1A10E7D9;
	Fri, 21 Nov 2025 00:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ud5vFMpb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FEF310E7D9
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 00:23:47 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id
 6a1803df08f44-88242fc32c9so17085766d6.1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 16:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763684626; x=1764289426; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HeoQ6A9zQA47pPVQ4WN0R1Mr0WB5BGBDvzJz+/SIjn4=;
 b=Ud5vFMpbkmvebD4N7TzpDqLSiJleVyNGlnUm4Q+gVQc9O5CFaa5Ho1swd/Q3/FJSdu
 Z+2EXnZ8y5/7jb6etWynXqMjyxlwVMv5YbN8QfZ+uFj6RmertlmTaH2CwtFesz0CsEvk
 HO6lR2RZNieNc4BfOebKgqlNDPdpVELO189XDtGYrMNFd2fGk2bXeq1TH+1FG2JuIXHT
 GyTWL9VuGZ6NilBXZXCPOlcc50IiyLdI6+n857t4Bu9/o/ecf3+CC5DWH0tMYbLkKa9F
 mkXWP78VV6sphQUiJrGzNZ8qi+fHevVNpIWrCTFMZOBI96BnqNQPu4aaao/UNRTLUvVX
 VweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763684626; x=1764289426;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HeoQ6A9zQA47pPVQ4WN0R1Mr0WB5BGBDvzJz+/SIjn4=;
 b=cS9bv+u/Pg+cnZU3DLsye0MbvOu+O2GGc98fRcS7SHGM0Kgmihwlde47En/jDSeR1U
 jEzm/aGe0jWJdRQ4Y1rr8mglDs93FqAP9wAnDrlSbjw8kVTmymbvoNkRxbX1gtIQGJVI
 hdgXF03X5yFwSnMGINjDQqyOLOTlyCKNpluoL/M3r5xh05Wh0xzTpTcYq4st7wYqyxuk
 Bdk0yWjc5ahQdwVAMQWQgvpzxUZcBCfogbSbpG4Are5i2yx0sQxVzY29iIJT0MbN0Pf+
 D4yxM5Fe0rt/CzjERf95i3ZwZv3U8ch+6a0rcS+Y/ZA5gILo48KzX1Kx0nlJZ5ysTQFn
 4WAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWs5PjMBurQoowqiLcwiwgoG48SFEe411lJPRqOHiMPu8TDPjt5u5aEm8f/Lv5iD+Kgy1DudSy763I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUWzeJFhjGmePgnACaOVedwHEJJHg4moz9pa0f/vPSqfCmzZIW
 GeIrf9uo2DhM50Z46JPhQML/LrGUcYRpgDaKZboNufEmuy+TzlOmo5m0QVtdfSL6VGw=
X-Gm-Gg: ASbGnctKRKeaze4FmdstclkSNSYtxH8+ZfxsmZVwUJcSA6G0SZMdeoPmGRMvH4Q2ZoO
 Yev/27XPb2loCUiHSePg5j5E5jC7D7phOyaODQnvuI8Ni8Aaoi8hBVWzFZ1vFaewvXfdi09f1Qi
 wOuJk7VIWO7MGnhKkJMl4ZyinUiV/F7Y8ATfaB2tuK6HMTtu2n4PEyOaB/WlKIvPWjyOJnWxh0I
 IfXoPVnlAWh8tagheDmOLCfpf0huL22z6CKU5pXD5EjpsbjvlC+205hYkfcGH8fYfwg906ND7s+
 gwY3EA0vR5LZmWL1m/nxV2uSfuFA6Z9hsVbozKts17PiUKEuc55Fu3EWiv7EJ1FZfbCaSzhFy6K
 ZsnsHswl2CzbvQXRWLxpgvyExsip5q6lHJ2QgDP811CbxCfpu0R1Xcn+d7m7xNmwwLwSgoTneom
 oBehC2zVYk8SWDWCt9DnfGS+4g3Q3Zdxcg6Xa5t+AjX6tIHGfm+yjVcMT0
X-Google-Smtp-Source: AGHT+IF9fpUZC0KSEi60qYSTXqU5TN/0kv3Br6v+7st2smYcT5XQOEwOWy/F2amvDq4QuChbOli5Vg==
X-Received: by 2002:ad4:5d42:0:b0:880:2c08:88e with SMTP id
 6a1803df08f44-8847c5206f8mr8425876d6.45.1763684625945; 
 Thu, 20 Nov 2025 16:23:45 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8846e472ae1sm27645766d6.22.2025.11.20.16.23.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 16:23:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vMEwC-000000016i7-2ZE0;
 Thu, 20 Nov 2025 20:23:44 -0400
Date: Thu, 20 Nov 2025 20:23:44 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alex Williamson <alex@shazbot.org>
Cc: Leon Romanovsky <leon@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
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
Subject: Re: [PATCH v9 10/11] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20251121002344.GC233636@ziepe.ca>
References: <20251120-dmabuf-vfio-v9-0-d7f71607f371@nvidia.com>
 <20251120-dmabuf-vfio-v9-10-d7f71607f371@nvidia.com>
 <20251120170413.050ccbb5.alex@shazbot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120170413.050ccbb5.alex@shazbot.org>
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

On Thu, Nov 20, 2025 at 05:04:13PM -0700, Alex Williamson wrote:

> @@ -2501,7 +2501,7 @@ static int vfio_pci_dev_set_hot_reset(struct vfio_device_set *dev_set,
>  err_undo:
>         list_for_each_entry_from_reverse(vdev, &dev_set->device_list,
>                                          vdev.dev_set_list) {
> -               if (__vfio_pci_memory_enabled(vdev))
> +               if (vdev->vdev.open_count && __vfio_pci_memory_enabled(vdev))
>                         vfio_pci_dma_buf_move(vdev, false);
>                 up_write(&vdev->memory_lock);
>         }
> 
> Any other suggestions?  This should be the only reset path with this
> nuance of affecting non-opened devices.  Thanks,

Seems reasonable, but should it be in __vfio_pci_memory_enabled() just
to be robust?

Jason
