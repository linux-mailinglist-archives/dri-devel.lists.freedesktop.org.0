Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 006593C9F7A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 15:29:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794FA6E851;
	Thu, 15 Jul 2021 13:29:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0936E851;
 Thu, 15 Jul 2021 13:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C1fM//49DoJiK6F8PZH6aVsAmJfIs+Krg49nH7HkYmFO8vr1oar1F86ECOQyMgqGrqP9KWVLe8NBBTPP4gIiX60Rspd5J1rV4wKbf5swZBR/0kW9+8Ms007GgpZB1qm5bF3bze9pI+206r4SYdW4gLW9BhMZ1Mn7XsgVnKSw3B2/pDUKfSvFehVwMn8NHQ2M3SL9vGBh1vKOJjQPmDowvx3pyNpqtGPSyktdXkIND1prdrqWJ8ByomBr1W4knJ2F4rWaEn/86BdAURRMF4OIDyxBG+gq+WqyQ+ACC8dA5uN05fWofHZulKYinwWV4CgX6iMHzf41niNe6KhdY1NWPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf0cYvUfkQHZe1ox9dAKWC9ViRnGRvsvRKpLWwVzJ98=;
 b=Vy2bHnjuob/Pv0T046lsbuzw/tjPTBASMImqTjhbd0uxzwgDkthfuHTvXeUvL/sh80k04Qf+lTA/HJMcOPNk0NP2pW47tApfLhpXNrbWRTA/958g23sHHvCkgRH+MjTR+n10WH9iXt41wG+e7vgPTu6XqfcAPwYzrG+YnaUkD1RYFRu9P34JNjcquif6OG0rymMtHaaN/7xRBqoKoDcTyR3dr45g/689egKkyWiOT0xziVVBipYTEKhUfZNXif1+Eb+gmUtXIMMs68c0zHiMH7S/EzATknk80kW/HjM0hJzBc4dSXVxmDgufGvUDmy4/m3dKEb9HEJiNUyiEq7YRTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mf0cYvUfkQHZe1ox9dAKWC9ViRnGRvsvRKpLWwVzJ98=;
 b=lyIXnDQuE9+gTqXb/KGbfaIiqjMpaLFpbl0CgmyholSKTxRBUzc63RGt2lSacSAYu+WyRHtjcHEXaxSTOKJ9i0+BDl8616H+3ycWpOJ5YDOjvmRzi7Ev1/7NIZ7QdKdFfw4qYS28YgiXHrCvfp9pZcXk7MDFy0VwgYMyy/M5wEOESgBZzat0suT1RjaQYhvsFrYdDyWExUg1yv4RVR2g2fP36dSlpniMRK/9pR1NNXerqFr19sgBlS0VrshGpzIM3YgTJC6WkfePaWmo2Stk8IMEHbampL9c5m7POAi4krU4HSGYNU4QxJdvJ9w22TF2N0EKNKLUhtc8I7lJhT5pXw==
Received: from DM5PR18CA0087.namprd18.prod.outlook.com (2603:10b6:3:3::25) by
 BYAPR12MB2728.namprd12.prod.outlook.com (2603:10b6:a03:61::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.26; Thu, 15 Jul 2021 13:29:00 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::4e) by DM5PR18CA0087.outlook.office365.com
 (2603:10b6:3:3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 13:28:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; linux.ibm.com; dkim=none (message not signed)
 header.d=none;linux.ibm.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 13:28:59 +0000
Received: from [10.40.102.146] (172.20.187.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 13:28:35 +0000
Subject: Re: [PATCH 00/13] Provide core infrastructure for managing
 open/release
To: Jason Gunthorpe <jgg@nvidia.com>, David Airlie <airlied@linux.ie>, "Tony
 Krowiak" <akrowiak@linux.ibm.com>, Alex Williamson
 <alex.williamson@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>, 
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>, "Daniel
 Vetter" <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 <dri-devel@lists.freedesktop.org>, Eric Auger <eric.auger@redhat.com>, "Eric
 Farman" <farman@linux.ibm.com>, Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 <intel-gfx@lists.freedesktop.org>, <intel-gvt-dev@lists.freedesktop.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jason Herne
 <jjherne@linux.ibm.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 <kvm@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-s390@vger.kernel.org>, Matthew Rosato <mjrosato@linux.ibm.com>, "Peter
 Oberparleiter" <oberpar@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Vineeth Vijayan
 <vneethv@linux.ibm.com>, Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang
 <zhi.a.wang@intel.com>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
X-Nvconfidentiality: public
From: Kirti Wankhede <kwankhede@nvidia.com>
Message-ID: <862e9ad9-e1f8-4179-4809-9b5b2743e640@nvidia.com>
Date: Thu, 15 Jul 2021 18:58:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.187.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e4580cd-12bf-41ea-6436-08d94794812c
X-MS-TrafficTypeDiagnostic: BYAPR12MB2728:
X-Microsoft-Antispam-PRVS: <BYAPR12MB27287B674779581AFD834915DC129@BYAPR12MB2728.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 280SWfZXn+Bgu9Ux5mhCqtwQOxRZf6xUlvKL8y06d+EByphs6AuCF+ewQOceWFlSUso1/HSoelgSiJO7kkF7UfaHPCNgOTt5FzpuCGvtlghrBgXLqPFWD1wlGpWyYMdimCDvZz0arox3ygxf+CdPPv1GsmTdKmebfh2LApERHLK+A21fTDe0s/mU4iMi1L5VsapxFXtZEF+1qpLwmp1UlI4YfqZ5+DuaOOBuwrFra8ch+GV1qN9/NDhA2xr0PBL3oGgWonKxADVx38ECWfgcvB6vrgUHTFv9XnPoDOkMbNUARojWi7hYldT8tmRYicD+WNsagP5nAdbSW7peD2VULG57worjeaSaNyyQ2dxCUamUcgrtOOf5tHUsh+EM2buIoWvBVpLtXoRGRP3p7BLCCZvZiTeM/zVgeq2fibsqif2G9eKX7UQQzWKHbPIY001/+5BxCnmlgZKxZL2ArPutFm12z8DJ78lPLK+/awJKxAerXuoqri1nfdWaVk/vKC8EEwlNJhNyC5L2rgeTye0qJ1jdeKcpEzwkNQj48t/xc3r2Z3kkozIQKiXpeb2G5M7L2Q3970qiHGJ8I8GoKLda5xoIGAwbbBmWVMXLun8JzJS1A3Bo4PGu5bYa9zBLHWTmGAlfEYqlnu5BEsVeCNleetjdByS3CqnnrWKobDl0AUqfhaJZ4muy3u5Js/SjJsAlDW7TITPqFl27Oxf/XvDKRfhEDWE1ijVSVedT/H7zsPTvezatnLxOTvsYTvT4SdM1yN89vcEQv0jSBlDEIwwsAZuRfWBrhopdduYh/sR73zaxXF7dlEMQvnhkpS3bWoREcfTUdP+1e4ew7UbPb3BNZYUFJjTRNTv1+fdYD60cDLrH7kfsakAiM70XpRKCd5SRIy/Drxmvyg56MmQBvYveNUJLrImVWVaR0ElydhckwTE=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(7636003)(86362001)(26005)(53546011)(36756003)(356005)(186003)(478600001)(16526019)(5660300002)(31696002)(6666004)(36860700001)(966005)(4326008)(31686004)(107886003)(47076005)(7406005)(82310400003)(110136005)(921005)(2906002)(34020700004)(83380400001)(336012)(16576012)(8936002)(426003)(8676002)(7416002)(70206006)(70586007)(54906003)(36906005)(2616005)(316002)(43740500002)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 13:28:59.5988 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e4580cd-12bf-41ea-6436-08d94794812c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2728
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai
 Hadas <yishaih@nvidia.com>, Leon
 Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 7/15/2021 5:50 AM, Jason Gunthorpe wrote:
> Prologue:
> 
> This is the first series of three to send the "mlx5_vfio_pci" driver that has
> been discussed on the list for a while now.
>   - Reorganize reflck to support splitting vfio_pci
>   - Split vfio_pci into vfio_pci/vfio_pci_core and provide infrastructure
>     for non-generic VFIO PCI drivers
>   - The new driver mlx5_vfio_pci that is a full implementation of
>     suspend/resume functionality for mlx5 devices.
> 
> A preview of all the patches can be seen here:
> 
> https://github.com/jgunthorpe/linux/commits/mlx5_vfio_pci
> 
> ===============
> 
> This is in support of Max's series to split vfio-pci. For that to work the
> reflck concept embedded in vfio-pci needs to be sharable across all of the
> new VFIO PCI drivers which motivated re-examining how this is
> implemented.
> 
> Another significant issue is how the VFIO PCI core includes code like:
> 
>     if (pci_dev_driver(pdev) != &vfio_pci_driver)
> 
> Which is not scalable if there are going to be multiple different driver
> types.
> 
> This series takes the approach of moving the "reflck" mechanism into the
> core code as a "device set". Each vfio_device driver can specify how
> vfio_devices are grouped into the set using a key and the set comes along
> with a set-global mutex. The core code manages creating per-device set
> memory and associating it with each vfio_device.
> 
> In turn this allows the core code to provide an open/close_device()
> operation that is called only for the first/last FD, and is called under
> the global device set lock.
> 
> Review of all the drivers show that they are either already open coding
> the first/last semantic or are buggy and missing it. All drivers are
> migrated/fixed to the new open/close_device ops and the unused per-FD
> open()/release() ops are deleted.
> 

Why can't open()/release() ops be reused instead of adding 
open_device()/close_device().

Thanks,
Kirti
