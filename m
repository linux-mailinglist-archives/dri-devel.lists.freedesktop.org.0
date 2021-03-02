Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D609329EDD
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 13:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFDC46E14D;
	Tue,  2 Mar 2021 12:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C76736E14D;
 Tue,  2 Mar 2021 12:41:58 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B603e32960000>; Tue, 02 Mar 2021 04:41:58 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 12:41:57 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by HQMAIL109.nvidia.com (172.20.187.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Tue, 2 Mar 2021 12:41:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krA99G49gRreljlKnK0aS7mxZ7LlG+Ie6zX++/BaLGR8IVZ2rACMD3perTBfdZeKJNwNPv2B/qg7aDWJK/ECQOvAUMX11b6ZH/JIw8b8Q4vOGJRqQBJ4kxutBukAm45pTiSAsRWR+WKHRv1XrnJZMEK9q7cUcY4yK8tcv0zXdVvvKGscZqRiFh2BBNTA2J0iM6hLviWYVoOQ9Jtgvnpl2J56M/IuxOHnavUvxN4P9bPevR1pYIIuAUMVjb0TePnxgIEkiDzHLmM6Grz95ZWZzSwWCxB3NOus6ZxtFtNoj8EGleLaUR5kO259yA9NVT6g3G/Q9XS0Hz1mFR8OzNqrRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oE+KS2DDNZXXTciEYWOFI2+Rv0T7GevVzlHvgXrL1vk=;
 b=Cpob7Z6LjeMafeO1X3g9tmDrZSYJZRWzkeQvw+/vfl+L9NBvUyNv42P8vtOWjF4jd3qHcfMvVu/IaDRKIUak3Sdd/KJdSFjhYIkUEOpJdWZuxF7TQzrfr2NStXg3A6rtyQot4M30+D7Hynnjw+QEmqzp/NDX3XMCwGrUXEBHoOalvSCtcnK7/5rObPVDcO2Du4fva4PVsJkHB6aduNt0vIL8sFxdFbU0w1L2POULgYQVAUX/p+gj1kICvEes47Ak3XJGKpq+Nq3zm8AYqJT40DrooGR3NWcF2qY+W32nihdri0QQXbVkt9FHsh6CqreHXHiVXLA/7CeY2ysFUwaiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB2486.namprd12.prod.outlook.com (2603:10b6:4:b2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 12:41:54 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3912.017; Tue, 2 Mar 2021
 12:41:54 +0000
Date: Tue, 2 Mar 2021 08:41:52 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH v3 5/8] mm: Device exclusive memory access
Message-ID: <20210302124152.GF4247@nvidia.com>
References: <20210226071832.31547-1-apopple@nvidia.com>
 <20210226071832.31547-6-apopple@nvidia.com>
 <20210302000559.GA763995@nvidia.com> <2758096.Z30Q8iEM0t@nvdebian>
Content-Disposition: inline
In-Reply-To: <2758096.Z30Q8iEM0t@nvdebian>
X-ClientProxiedBy: BL0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:208:91::28) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BL0PR05CA0018.namprd05.prod.outlook.com (2603:10b6:208:91::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.16 via Frontend Transport; Tue, 2 Mar 2021 12:41:53 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lH4LY-0049UW-8j; Tue, 02 Mar 2021 08:41:52 -0400
X-Header: ProcessedBy-CMR-outbound
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614688918; bh=oE+KS2DDNZXXTciEYWOFI2+Rv0T7GevVzlHvgXrL1vk=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:Date:
 From:To:CC:Subject:Message-ID:References:Content-Type:
 Content-Disposition:In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Header;
 b=Bw0nEP7xQqtv/nLkS6v87rsYK4W26pKht7z811sA9bGQ3XHCUEIfPvhuuBMUKZcRU
 pAJq9hfH1SoA0dHn+aJGBP04I4M2L2qPJE1TygCDd5kzCoIOQcGEMPS/NNNxZnLCke
 x8ntsVBil6b42sWjx7HjnuKjj1uzGa9TYXcyj0X/7S44f25X84ctGNS+nO9EP8gULV
 /Hvqqk8TbzX0WaGb91HnEorl8EjdWgaz+/iBNcbX+JKwJ1TwXI1wXq0m50R+r4U6o+
 2nrlhXmgtatriXc63+cNtMOVqtHh2T5ak/Hbdu27vvIMlE5M13UxGUGX5Ah8HiurSt
 x1cR2frsdzj6g==
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jhubbard@nvidia.com,
 akpm@linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 02, 2021 at 07:57:58PM +1100, Alistair Popple wrote:

> The intent was a driver could use HMM or some other mechanism to keep PTEs 
> synchronised if required. However I just looked at patch 8 in the series again 
> and it appears I got this wrong when converting from the old migration 
> approach:
> 
> +               mutex_unlock(&svmm->mutex);
> +               ret = nouveau_atomic_range_fault(svmm, drm, args,
> +                                               size, hmm_flags, mm);
> 
> The mutex needs to be unlocked after the range fault to ensure the PTE hasn't 
> changed. But this ends up being a problem because try_to_protect() calls 
> notifiers which need to take that mutex and hence deadlocks.

you have to check the notifier sequence under the mutex and loop
again. The mutex should only cover programming the HW to use the
pages, nothing else.

> However try_to_protect() scans the PTEs again under the PTL so checking the 
> mapping of interest actually gets replaced during the rmap walk seems like a 
> reasonable solution. Thanks for the comments.

It does seem cleaner if you can manage it, the notifier will still be
needd to program the HW though

Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
