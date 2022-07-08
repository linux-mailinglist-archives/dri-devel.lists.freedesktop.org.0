Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7983256C151
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:31:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 480C310E869;
	Fri,  8 Jul 2022 20:31:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060.outbound.protection.outlook.com [40.107.93.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606B910E869;
 Fri,  8 Jul 2022 20:31:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TCEcmAW2eBwnsIcN211V0sQRKkJUPlLO9fn5aV8UFS5ix/+WK4kXdk3NAPUpdreAaT15ivJLk6K/9pCGvMf1GYptai0WJlAdLUNDFaWfmM0gx3culTKK3O9rOwiJaCvrHvA59FB39kZA6sZvlvtu08ddzDORR+qUBagkC9eGgoNfDMNdqzMKuMY/HIGn23nhQnzRDfzLtilCBCp7PLKF/aIHKcdLGiIFGhZLZp0Ftz1NxgLf1cCEQE4QAQ8p2omIrEosIr9d3tUCVXnCj/UP9uCvmBeWCA96XyXtKx5FamFkyMlXiYJlyBTo+EJYAM6kQbA5eVjUtVTiKb1vbdXNiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AROgJCrFKTNh8ss+sbPa16c6l7f8KipxpiVwS66Cg2Y=;
 b=JJecR0pW2EDiGWyZ3P5IQYU6bJXcZn+ZPe4wJ0HrWAoobg4hBPSRyKiM4fPRXRbIkJn9duP/13+BnJPhnAWpct4to/DSCY7pSE4e4TEiTC7vheOZgIvOLIA1mK04c38RGThEenr6PY3Z92/C4oqwUz1ytwPatL7RVL3cAU+Y9DtEk672G7Z21wk+OaLyiiHQhCvzH8nR5kcwfryOSQmV+faQfWqmW5PW91nEoBe9olkiJe2rkVvCtCBRA5V4WgXKCAdbZ5h90JC7ja0jZJ6h+K5h09oILQrn8JGD6ncBdRjihOVxCfEixgssIWYFWNQGOvNgivHa7kEM6V9tRAF8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AROgJCrFKTNh8ss+sbPa16c6l7f8KipxpiVwS66Cg2Y=;
 b=IuSQPvNvmhJgM1h70m2jYzxPyL0miuLUNsmAkiRq1EDLlj8A3cf4SbFwGrKTiNfjlMexXUAa3st1ggBSwgwzVP9DOc9sDCQLDctTLYFLNP1syhnLpy+dKLs9MDPpxklt/Aq8375GSzSp3ie5qK3/A/T0kYWCNQrbBNK92KnzPsPM35wuspoDqvRB56Wuen5c6dMWUjpDddoyv4/khMFJBWFAitToOlKzryUr+fkTgrQaIkRkl3sciBxvlhEfGZpvC3+jCAs5M9/ZQc6FxjeZ/pux0g4F6xR46JbC/kxnufK5/LsatqqZt3sk6aFuL8e55Gzp42Y2KdwGTy4B0XDJhg==
Received: from BN9PR03CA0951.namprd03.prod.outlook.com (2603:10b6:408:108::26)
 by CY4PR1201MB2551.namprd12.prod.outlook.com (2603:10b6:903:d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.17; Fri, 8 Jul
 2022 20:31:51 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::1c) by BN9PR03CA0951.outlook.office365.com
 (2603:10b6:408:108::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16 via Frontend
 Transport; Fri, 8 Jul 2022 20:31:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.235) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5417.15 via Frontend Transport; Fri, 8 Jul 2022 20:31:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 DRHQMAIL107.nvidia.com (10.27.9.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Fri, 8 Jul 2022 20:31:50 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 8 Jul 2022 13:31:49 -0700
Received: from Asurada-Nvidia (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 8 Jul 2022 13:31:48 -0700
Date: Fri, 8 Jul 2022 13:31:47 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Eric Farman <farman@linux.ibm.com>
Subject: Re: [RFT][PATCH v2 0/9] Update vfio_pin/unpin_pages API
Message-ID: <YsiUM/xxymScErv4@Asurada-Nvidia>
References: <20220706062759.24946-1-nicolinc@nvidia.com>
 <73ba16703b8b6f6b4bf37a55ab011324b5affa38.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <73ba16703b8b6f6b4bf37a55ab011324b5affa38.camel@linux.ibm.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b5bf56d-ad64-4dac-e8d9-08da6120e3a6
X-MS-TrafficTypeDiagnostic: CY4PR1201MB2551:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l99dB0Cc6MZXc+9IXm7iDcDwRQWn7fyWP1+8eEuOJILlkkL/Dstv1mluBZ5fEVMa4bYuKCF4ZrIyrN4QtRUZu0iNMv5aFlpu7ld/L4F/D17PIJxUC7okvFdp12DyZzWFyvzahyfHD4PS+XA+zU5HNtEyXPBReLnB7rsJVT09Jg5K4lso2SVC2ZEaDOT6BPXEbKqOd6nfrbEoItZKdsquYC7V8PRnlvpEBvsdpzYJOMblS6A0R8QmhehjJpxhwcoxIc8/sPbWe0Qz46ItFZR0OhCxu56Y8HQlnJAOM679y2pIgh3T0bL2JYEgYLkL7SsXKjQUdwmLnt++9G40VsILMkvWlzG9V2zKx9sCKXYLj2lGVWeAusB23jMwh6KMrvka9sXYPGH6uPWI0hmcm00VQ3/03h/JDboi04l9wOLLGT/uaJFwrWiVkElLHhczqwSzX4kJB0yTh1CyI3Q6SWV7mM1dTcpYu3h6z02Fko0bkZyvvKtVckE7R0hL8DTkFQNKdWR6EotPZxC5dURj5FBSq0U9tNIc2FoDkU8OeuiqBGfbMISuC1zOGS8bLi8ulRYNfHeOoPOodqwknlHyS1eurYv69vkTJwtmPYb0hFZfdb4kxHDjMW4a/wimLLT78PP7wZQzG9KMtpN3lqKBxCQfnn5gfnKLG+NXuH9+GZOiRzhRBJeN9EuqTAQXVNvKZrrpoMgJmcbr52pee5AW70FZPLeNY50Ya5aCYL/tpTmXAkUQg5WxakhXrZ4tCD7qqGsXh1SwFrBG3F7bZBkItGsHfE28g1W+eGOdJsNBhIG2ApGSBn+MYA4jQeOLiJMgQxzWFt+9tpM5ntE3iy2E95xxUeQNKWtiOFtq8yWzgl76D4b1qALvHaWtLK0L7xLaOHrKPSvuGsFRBuyYx8tzH4umqWLHVQHwf71denGKmtfCnSrAj4wXWHHrxwWdGZbwUiRL
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(40470700004)(70586007)(478600001)(2906002)(8676002)(5660300002)(82740400003)(4326008)(15650500001)(70206006)(55016003)(86362001)(356005)(40480700001)(7406005)(81166007)(966005)(7416002)(54906003)(41300700001)(426003)(82310400005)(336012)(40460700003)(8936002)(33716001)(6916009)(316002)(186003)(83380400001)(9686003)(26005)(36860700001)(47076005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2022 20:31:51.0686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5bf56d-ad64-4dac-e8d9-08da6120e3a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB2551
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
Cc: mjrosato@linux.ibm.com, linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kwankhede@nvidia.com, vneethv@linux.ibm.com, agordeev@linux.ibm.com,
 hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net, pasic@linux.ibm.com,
 jgg@nvidia.com, borntraeger@linux.ibm.com, intel-gfx@lists.freedesktop.org,
 zhi.a.wang@intel.com, akrowiak@linux.ibm.com, kevin.tian@intel.com,
 jchrist@linux.ibm.com, gor@linux.ibm.com, linux-s390@vger.kernel.org,
 hca@linux.ibm.com, alex.williamson@redhat.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 jjherne@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 08, 2022 at 04:30:32PM -0400, Eric Farman wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Tue, 2022-07-05 at 23:27 -0700, Nicolin Chen wrote:
> > This is a preparatory series for IOMMUFD v2 patches. It prepares for
> > replacing vfio_iommu_type1 implementations of vfio_pin/unpin_pages()
> > with IOMMUFD version.
> >
> > There's a gap between these two versions: the vfio_iommu_type1
> > version
> > inputs a non-contiguous PFN list and outputs another PFN list for the
> > pinned physical page list, while the IOMMUFD version only supports a
> > contiguous address input by accepting the starting IO virtual address
> > of a set of pages to pin and by outputting to a physical page list.
> >
> > The nature of existing callers mostly aligns with the IOMMUFD
> > version,
> > except s390's vfio_ccw_cp code where some additional change is needed
> > along with this series. Overall, updating to "iova" and "phys_page"
> > does improve the caller side to some extent.
> >
> > Also fix a misuse of physical address and virtual address in the
> > s390's
> > crypto code. And update the input naming at the adjacent
> > vfio_dma_rw().
> >
> > This is on github:
> > https://github.com/nicolinc/iommufd/commits/vfio_pin_pages
> >
> > Request for testing: I only did build for s390 and i915 code, so it'd
> > be nice to have people who have environment to run sanity
> > accordingly.
> 
> Tested-by: Eric Farman <farman@linux.ibm.com>   # s390

Thank you for the review and test!
