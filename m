Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD68329591F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539A6F3ED;
	Thu, 22 Oct 2020 07:28:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A986EB0C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 12:51:35 +0000 (UTC)
Received: from HKMAIL104.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f902ed00001>; Wed, 21 Oct 2020 20:51:28 +0800
Received: from HKMAIL102.nvidia.com (10.18.16.11) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 21 Oct
 2020 12:51:28 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by HKMAIL102.nvidia.com (10.18.16.11) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 21 Oct 2020 12:51:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FRw8/EytkfcUBldJuP/BUuxxIDH9Cjfkp7Nmm09svP82seUUZfOU/ahD2Ulz4L2wWbcVan/0CdFMo6RobnpIzM27wU2MFgf3UZNaFMDAqPgUzu2xEisqqJiXSZxE4/RdsmqwQcsSpZ8B1Rd/qPPrQ5JuL/7rotO1Z38dlgYW0XBnhzqD02IOt67LgNrMdo07HikgJ298nvGqMcHoDGbwSDMF6E54RLYQnEjjTeGkeYscYrmTL2ImCgq3KPEZx6eOpBYeBO1VO73nlTHK3vTTcwDa+vjSVtO8l3Obv+UKChkK7HgpAhty9SbHgUzvWKb9ijXIetg/l+t9+zATfsE6Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yh/1ZhTxXHD1YXbmPcINfY1BXvQtNEnRPtNoRP9PEH4=;
 b=MeXBi/FsegQ4Ozc+o9nqHqApf9xo37Zq7fkpRtw8dnhIsQf/36ff6syWd4R3od1pGpPh/H3vP/RuPutpklaZoDu3aBKB8c2rys5z9vLqvptYiP63DDyWBOjniy46NJjGgep0pKrZ3QyLnxznLFlDP/PqxAs1iGAME1qzEQqfVJra/s8urs/k+BUxQp+uLasxIQjPMPRm+bciVVfol61EgyKjQOkBPk0GLtsTvHaz0GXmnD/T9n54Eeor/x+Qprk0olGD2IK2LFtyCdXevIy4b8X05lIdUSJroNjV49dy81c/1pyr9TtkkrEwEr1Ra/rlitUC0mY3whPauKPOIqSrag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4498.namprd12.prod.outlook.com (2603:10b6:5:2a2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20; Wed, 21 Oct
 2020 12:51:26 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3477.028; Wed, 21 Oct 2020
 12:51:26 +0000
Date: Wed, 21 Oct 2020 09:51:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH v3 00/16] follow_pfn and other iomap races
Message-ID: <20201021125124.GA827089@nvidia.com>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
Content-Disposition: inline
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
X-ClientProxiedBy: MN2PR08CA0025.namprd08.prod.outlook.com
 (2603:10b6:208:239::30) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR08CA0025.namprd08.prod.outlook.com (2603:10b6:208:239::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.24 via Frontend
 Transport; Wed, 21 Oct 2020 12:51:25 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kVDaO-003UBS-Qb; Wed, 21 Oct 2020 09:51:24 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603284689; bh=yh/1ZhTxXHD1YXbmPcINfY1BXvQtNEnRPtNoRP9PEH4=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=C7xYU0fDsha18ThIXlmRE40GkYuRAFPxCvdB3o1nMvhmU+vNu/rWItr/hyVsI9JH9
 fOswYgLrZ1ZCdIq3o74WRdiiwn36I+f089K2bd5TwpCAN88YO70quRsJez5AumELr1
 rUSxhC1RAFOXp/GeUnJ89506tos7uvcJw1UAIv6ruwvgDQgeI9UdjilJv1BO6pVzHs
 voW1qRPuxMuaDc5hOEpSvzFbPi+5E52IQsBge0a0DfxAsa6VhbITJG8CQ4ZD4w6A0O
 0U0LE7MYwwqgIITuqPz4Q6uMmb+s1eOV3pscqtu/o7GoBFJpxWCQpWJhazPnrKwrXa
 XsZ5x/vGm+/Rg==
X-Mailman-Approved-At: Thu, 22 Oct 2020 07:27:48 +0000
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 kvm@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 21, 2020 at 10:56:39AM +0200, Daniel Vetter wrote:
> Hi all,
> 
> Round 3 of my patch series to clamp down a bunch of races and gaps
> around follow_pfn and other access to iomem mmaps. Previous version:
> 
> v1: https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> v2: https://lore.kernel.org/dri-devel/20201009075934.3509076-1-daniel.vetter@ffwll.ch
> 
> And the discussion that sparked this journey:
> 
> https://lore.kernel.org/dri-devel/20201007164426.1812530-1-daniel.vetter@ffwll.ch/
> 
> I was waiting for the testing result for habanalabs from Oded, but I guess
> Oded was waiting for my v3.
> 
> Changes in v3:
> - Bunch of polish all over, no functional changes aside from one barrier
>   in the resource code, for consistency.
> - A few more r-b tags.
> 
> Changes in v2:
> - tons of small polish&fixes all over, thanks to all the reviewers who
>   spotted issues
> - I managed to test at least the generic_access_phys and pci mmap revoke
>   stuff with a few gdb sessions using our i915 debug tools (hence now also
>   the drm/i915 patch to properly request all the pci bar regions)
> - reworked approach for the pci mmap revoke: Infrastructure moved into
>   kernel/resource.c, address_space mapping is now set up at open time for
>   everyone (which required some sysfs changes). Does indeed look a lot
>   cleaner and a lot less invasive than I feared at first.
> 
> The big thing I can't test are all the frame_vector changes in habanalbas,
> exynos and media. Gerald has given the s390 patch a spin already.
> 
> Review, testing, feedback all very much welcome.
> 
> Daniel Vetter (16):
>   drm/exynos: Stop using frame_vector helpers
>   drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
>   misc/habana: Stop using frame_vector helpers
>   misc/habana: Use FOLL_LONGTERM for userptr
>   mm/frame-vector: Use FOLL_LONGTERM
>   media: videobuf2: Move frame_vector into media subsystem
>   mm: Close race in generic_access_phys
>   s390/pci: Remove races against pte updates
>   mm: Add unsafe_follow_pfn
>   media/videbuf1|2: Mark follow_pfn usage as unsafe
>   vfio/type1: Mark follow_pfn as unsafe
>   PCI: Obey iomem restrictions for procfs mmap
>   /dev/mem: Only set filp->f_mapping
>   resource: Move devmem revoke code to resource framework
>   sysfs: Support zapping of binary attr mmaps
>   PCI: Revoke mappings like devmem

The whole thing looks like a great improvement!

Thanks,
Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
