Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF25AC74265
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 14:20:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768C110E067;
	Thu, 20 Nov 2025 13:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="YhGV907y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E9B10E067
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 13:20:48 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id
 af79cd13be357-8b2dcdde698so117000085a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ziepe.ca; s=google; t=1763644847; x=1764249647; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
 b=YhGV907y5Mev24aO17izBi17MMcGra0glhfdrwIwogR+bkmI7uJQwV5uS3DN5wpgSc
 hFEWixAnVQOWD3UOMthTzyXX71lCNlHbYOEqFUJIiYp/yrVtlB998CVyBOIS4gG4zhfV
 dpj7r4mpblPPBL66POU+5LGrKzJwKaTCVT7xPx8VZ2QKLBsipmE/dU1fkjGlMCxcDK42
 XnhnuEyKm+KNtpwqYSxbEU+jZrPN9ZeW/DtlkPuEy9u5Sbc5ULKBcHUX5B1dhTLOVJdY
 oioAmSjm7dXBdO+H3sJ6vQLCAXksypgAvAC7q4vbOZANN2030HvOVypm74J6IyEmMksB
 rDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763644847; x=1764249647;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GaI8T1P9V7HUSR5GC1P83jhUObFww+4fRanAKkUJgJM=;
 b=tI7/41GmcJn7S+DP1bJP5LIemUtMMG32RTxaGAx6VXlF+cUUsOEjLW4nlOL70uleUG
 3TaHUYbZJYnbaNFHJwrtTT+GmloWhWOOP9iCGo76+9BHBMbQYBXfdaLDpszFsztESMGP
 Ij3EhIceTQeON8W5p8KqnI6QalAj0dbeg2x051ul4Wk8ZSS84FC+QEWjWpnyrZNMmArr
 OvCTLpQAWKW3ShOaq84jZ151DPNWf0CDvx2bHofFvDmPRwkiT/l0dLyaTFpiXagvWhU5
 7i4sOTJk9DzCXqsatHBWEY76q1TapuoSGDqJMSV9xqSsyA7+XJ559zHdVnEGqzaqt6iv
 GFtg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPX8fjXIMulvsax0qpjXIV3Bhj6FS3vOwiQjZXg6a+dgC+yvnxQdeX8kcmB+6fzPb5xCAOo1l22oc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmC0SqkHE92pc7tA9EgdqUjCu2o4ecKrsVbRR2Y1MCrf4TT3X2
 diFyBMeoaY7VBfisi1hG01UCCpB7i48fljyx80ZHOVE3Rx1GJSlnq5tWSFiGqTj7f0A=
X-Gm-Gg: ASbGncvhq73EPsRzhXbvAnCVu/KCu0VGwX95hpJyrTxGmDwips+lN1pKrQzpc33/cK4
 kMPEcKBdkmDCOSAPcMboMc3CwTeGufzuvyvsz0K8I6uVYi0k0DUImtmnu/l3SYQ6ueNXE8qEO+H
 GyGtS+VisT0xTPrn+GAvQZxnuiX9oDaMvYpoRHNixjLHIqCt0G2iZGu5HOiCGoI4twaBYmlnZM2
 yO10DwQ3b/CvVYtZ5FG94VmLHo3JsGagwKrdIwhqWfuobRJytsNR54eNqcDW56LWN5SpfcBGQbH
 uZXEjTpQ3POk2GowBvHxHxYJJ0DZS/1ebJDikkVbw3MGc5J4mnHR7JQp8NMYlZC/LYe1K+eb0B9
 NrwvYmjUgErjMYx5+rmg6UsGFGbEuSWr2SK0X41Og3RNob2VMVciMEN/XKmq7/ZJQs4EFY3mIyD
 BShDySRPAeR4TYa47jJTD+VoRS6gdBm2bdbH1NP/ms8IMWxfRdv9r8pKXR
X-Google-Smtp-Source: AGHT+IHQ4fmxCAI4/D2tK1B8sYqUFbudidu6PckWMercsX/iRS90WBjHNHkg95yPWC8b179KW1QKQA==
X-Received: by 2002:a05:620a:318a:b0:89f:27dc:6536 with SMTP id
 af79cd13be357-8b32a193b85mr303322785a.54.1763644847316; 
 Thu, 20 Nov 2025 05:20:47 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.120.4]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8b3295c13ccsm148498285a.26.2025.11.20.05.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 05:20:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
 (envelope-from <jgg@ziepe.ca>) id 1vM4ac-00000000gLM-0tBz;
 Thu, 20 Nov 2025 09:20:46 -0400
Date: Thu, 20 Nov 2025 09:20:46 -0400
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
Message-ID: <20251120132046.GU17968@ziepe.ca>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119132511.GK17968@ziepe.ca>
 <69436b2a-108d-4a5a-8025-c94348b74db6@amd.com>
 <20251119193114.GP17968@ziepe.ca>
 <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c115432c-b63d-4b99-be18-0bf96398e153@amd.com>
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

On Thu, Nov 20, 2025 at 08:08:27AM +0100, Christian König wrote:
> >> The exporter should be able to decide if it actually wants to use
> >> P2P when the transfer has to go through the host bridge (e.g. when
> >> IOMMU/bridge routing bits are enabled).
> > 
> > Sure, but this is a simplified helper for exporters that don't have
> > choices where the memory comes from.
> 
> That is extremely questionable as justification to put that in common DMA-buf code.

FWIW we already have patches for a RDMA exporter lined up to use it as
well. That's two users already...

Jason
