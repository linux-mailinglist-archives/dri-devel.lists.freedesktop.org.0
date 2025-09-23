Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E95B97081
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 19:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281CF10E323;
	Tue, 23 Sep 2025 17:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DVmPXYJC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 145E610E323
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758648649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OFNQwbdODcls1yBrLTyCkOTsxOyxsNLxzpt49nq+oT4=;
 b=DVmPXYJCsw5x2qWcRlbjf0ZS1qW3vZPfBBFT9998srRv63PUqQm/yN/a2BMor0eDIqsJMu
 xe3sP9qojs/+iu6OGWjjOBDjylWt7JssdgsQor5zu+44g+TgQH5Axhkw6UjdNXmLaEnV4J
 nCLBRnzTgNUJNIPOt8As5FSsmfk3b68=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-qsZUIxGwMai0JAit6VE27A-1; Tue, 23 Sep 2025 13:30:45 -0400
X-MC-Unique: qsZUIxGwMai0JAit6VE27A-1
X-Mimecast-MFC-AGG-ID: qsZUIxGwMai0JAit6VE27A_1758648645
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-4258981d664so516315ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 10:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758648644; x=1759253444;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OFNQwbdODcls1yBrLTyCkOTsxOyxsNLxzpt49nq+oT4=;
 b=Gj3XML6ZwWJ3hTXCGSzPAwND8VGoBdfoWs3saCGPQVVKiHS6tlO4Bz0g3QbRi3/5a9
 ABlO0ke8zRUGsRcqyb3urFI5sAUSBmDBDJC7car9PDU4bVk/b1jC7eMAw8LbDyeiFaJi
 aDJaat96QpZBnoGkfO3dV5pE9gQbzhLBIBKDaQty19mb5W7aZc2IG8hmVppp2uzFBzJ0
 kwGZ77Vte9WzRoAI/qAr69VSe1h2Dop1UYDwz4AJ2jZAlsNNmAdlTy0FeRMc7O6OsYos
 hTiYPcur95+Hx562OeG253zQ4OQ5SyZMvq3yM2BjUhQgaZmI3pnlt1FvuCqVYMcu6VJ1
 J6cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUssw73Dip+wrB3h30TmSUmrKvVkRT5cCjtzs4aCRn1aKz28xl9hja+NqI1Lsp8g5LO0tX3Ju5uxlE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz154vgBwtrSsC75lzwb4Bfq3R/WLD2DkNULQ77WrdgQEmn1vyx
 lNqVqi+CzeAjwhD94lvSCMa+GbU3JUKWjcLzbLxS+ec1drypFMRhMqeReXMgIwjJE3tDksYLG8Y
 vKkAzZijEPqmBhOStO9jjz744PL1taniXlZjmY9JPwenfRgPQBDz0y8vVbJO6cs/x2rj45Q==
X-Gm-Gg: ASbGncuaKx3uopnV3kxcfxzw9MpqNnd9PrPdEkKZPBiQnShfRT28HOgAfJdBCUXQhuL
 UM6gWz3LMlc7emQ/wh+JM2JIzPMb5jUaQ/sRAN/hdZnVUOVmZABSk293XHfYB6E3D/uT300h1Dh
 Dh4z7XJv3SK7t4oSVo3wwXcp0m4ZLWGycs1YNjEBhtcePEvDoVGIrs96sweO3YImgtXGVROHgN/
 dx3HTZW/ZWJCfBkQG69wOOAH/6DsZmuicg9fsuZqJP4A6YYtrXAdSM4fmjlUVRIbzyB9jrUmD5a
 /t9QgSbf8DJwF6DniiKTSiophFMPuLFAD5bduHeregc=
X-Received: by 2002:a05:6e02:164d:b0:400:7d06:dd6d with SMTP id
 e9e14a558f8ab-42581e09c50mr18781065ab.1.1758648644615; 
 Tue, 23 Sep 2025 10:30:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGNobmhXZYu8wcE6bAQtE0C6wCF0m0+GFNpZFLyv2Bpb6JP547FE77pkIiIGw0EG9S0P84Gyw==
X-Received: by 2002:a05:6e02:164d:b0:400:7d06:dd6d with SMTP id
 e9e14a558f8ab-42581e09c50mr18780695ab.1.1758648644175; 
 Tue, 23 Sep 2025 10:30:44 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-566127693e0sm275326173.30.2025.09.23.10.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Sep 2025 10:30:43 -0700 (PDT)
Date: Tue, 23 Sep 2025 11:30:41 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
 <joro@8bytes.org>, kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Marek Szyprowski
 <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, Sumit
 Semwal <sumit.semwal@linaro.org>, Vivek Kasireddy
 <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 03/10] PCI/P2PDMA: Refactor to separate core P2P
 functionality from memory allocation
Message-ID: <20250923113041.38bee711.alex.williamson@redhat.com>
In-Reply-To: <20250923150414.GA2608121@nvidia.com>
References: <cover.1757589589.git.leon@kernel.org>
 <1e2cb89ea76a92949d06a804e3ab97478e7cacbb.1757589589.git.leon@kernel.org>
 <20250922150032.3e3da410.alex.williamson@redhat.com>
 <20250923150414.GA2608121@nvidia.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QYrytSUTyKzHd5V0_d_lbpHvGndDK7m9cM5gbpTLsJo_1758648645
X-Mimecast-Originator: redhat.com
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

On Tue, 23 Sep 2025 12:04:14 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> On Mon, Sep 22, 2025 at 03:00:32PM -0600, Alex Williamson wrote:
> > But then later in patch 8/ and again in 10/ why exactly do we cache
> > the provider on the vfio_pci_core_device rather than ask for it on
> > demand from the p2pdma?  
> 
> It makes the most sense if the P2P is activated once during probe(),
> it is just a cheap memory allocation, so no reason not to.
> 
> If you try to do it on-demand then it will require more locking.

I'm only wondering about splitting to an "initialize/setup" function
where providers for each BAR are setup, and a "get provider" interface,
which doesn't really seem to be a hot path anyway.  Batching could
still be done to setup all BAR providers at once.

However, the setup isn't really once per probe(), even in the case of a
new driver probing we re-use the previously setup providers.  Doesn't
that introduce a problem that the provider bus_offset can be stale if
something like a BAR resize has occurred between drivers?

Possibly the providers should be setup in PCI core, a re-init triggered
for resource updates, and the driver interface is only to get the
provider.  Thanks,

Alex

