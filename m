Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C058B391147
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 09:17:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 255916EC16;
	Wed, 26 May 2021 07:17:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C1706EC16;
 Wed, 26 May 2021 07:17:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jToHS8iJJDZCJFjUUPDRYvnNTZOAAPajj0zXvheeyWwvRrxNW3yXrlKL0Ah03yZwnO+u9noJJwQ4rDuq3G09TRBugJzsWzNt/K8e+XNKzwzELjAJN6n+1s9n4G5JUGXLGfU/JK6axTEXJxlDBNcodNDxc7+GGXxQs523He9PIFFOdISqWpW/kAISGNwrSvu0+khxyifAMEyfa04R/3p8xC4W0IyGz0zaYDdfmpwqFZMwrRNX1FYxvHwyhAj9ECasmisqXX7QnGh6RyhVLKOKdg6J6/Hrk8n002SQk1TPg759ZsHBnjYPMxZ43xU4/oNyOe/zKIP1CS9qIE3Y7popDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh8rmQEzaA+mHnWGWWAn9Tu+1Nzmr2FR4YAnqwaF59s=;
 b=eBpKAnxDSAInNYt1IUkuFD5AUifxaDtbtOQr0aNOCn8N0TciuULjYDD3U0KSBfoQqQAxr6PY/TaPepjQDbcoGN9LGbVufbuhM7eTdNYGu2rY8YH9cpieTAphqdnIOXhOA4ROh1ZxQ/SMqoTvEqeOsRgH3AeqwVRmJEY7hZRBIeUZTH6Fn8dUWkjdWsDh52KkVsfAaW4wuv0kb6vlOpMiVIe33WPLANkIxMdMPxGs+MZ/qzkI9+AtkgUFkVoyMPj/+kWpAfxU02AHM1Y3eNDIBXBe5kDushlR6ji+CU0vjKxyExz9xDhBnzea+WwVsuJoGPT9P4NRwndsmevYXco53w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qh8rmQEzaA+mHnWGWWAn9Tu+1Nzmr2FR4YAnqwaF59s=;
 b=SQdzpc7GYiDjUOx4nPHeOFBE7swjunXHRT5SeYH/5hyxKX8i7ahJy+o++7gtZprX1jV+9Qctuqh3djlctoeDgLCV52uzQHOar9wTFy8uMq8HWEdNby3dlkkB1fApbdYZeHjPmoxIu9mP+C/xrtKRLGC1x1raFBrY34Kxqi7cS9Li6uqROXhiUvOm8dERONOiHTW5x0f4dSjSMuJ4L5vTDsQ+KWb6i4m37Pq0HEPww0/u14PTQP/4wH/vur9P8gI/SrIchLhqSk84eC0WsW3+Y7Iq3u2Hocfxjv42gq7Hb0tlqyETvHXERLZS8I9yMtPkGkE7RJj5S1Iy/RiC+tvS9g==
Received: from MW2PR2101CA0016.namprd21.prod.outlook.com (2603:10b6:302:1::29)
 by DM6PR12MB5006.namprd12.prod.outlook.com (2603:10b6:5:1b8::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.23; Wed, 26 May
 2021 07:17:19 +0000
Received: from CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::a3) by MW2PR2101CA0016.outlook.office365.com
 (2603:10b6:302:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.2 via Frontend
 Transport; Wed, 26 May 2021 07:17:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 CO1NAM11FT035.mail.protection.outlook.com (10.13.175.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 26 May 2021 07:17:19 +0000
Received: from [10.2.60.51] (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 26 May
 2021 07:17:18 +0000
Subject: Re: [PATCH v9 07/10] mm: Device exclusive memory access
To: Balbir Singh <bsingharora@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20210524132725.12697-1-apopple@nvidia.com>
 <20210524132725.12697-8-apopple@nvidia.com>
 <20210524151157.2dc5d2bb510ff86dc449bf0c@linux-foundation.org>
 <YKzk0ILRsyazMs2W@balbir-desktop>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <8844f8c1-d78c-e0f9-c046-592bd75d4c07@nvidia.com>
Date: Wed, 26 May 2021 00:17:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <YKzk0ILRsyazMs2W@balbir-desktop>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4d5531b0-d882-4dc7-4f54-08d920164c72
X-MS-TrafficTypeDiagnostic: DM6PR12MB5006:
X-Microsoft-Antispam-PRVS: <DM6PR12MB50067B8CF1D6FC9ACAE0E043A8249@DM6PR12MB5006.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Mhq3zHxQlei2c8oC2ecPMzHFoEYn5qvjm6Nw5+iMoDD/yBY2OoZtubSD5mVcQE4l3XYdfkxfgaOeGwHkEsUXv3+Xl4lxRZXRL04D+yzXHsll9eBJ2Ixv5dHy/OxQwby/c2Z/PPFCKBjbauNpzc9h91843e4SlQpRjY1abIDBVF+zwVi99swwAasXakDrkPOAvfk93EZn35LvUhv1YU1FB6139NzjDRV0ET5rC8p+Gr1syMX2kCDtN+B5C/Ukw+s0fDaTpdecHt8p2bpc1RUAWs6h1jtx5WPcLql1hjp+5SnbX3dqvMPKwPsuHwIZ0e9+rrxuTQG0YPSzO6YOeJMmHId1iDB/yF3ZH/+7jLcdamKeNUciq8XE5v7xpdJ3Dcbf5j3Xx8KADaiKoRTDbxmsgCKN3bI0oX4cTDuO85Icf+nmyF5p/kOHnF7eci+VZPOgOe621M2w6t80A3KfORdhWd+n5ju1tCWZuqWw1++4WDE7aHa7kYF4aeTjQ5noy357BIoO0Px2iPsvKDSiaWPItnBFTmu4BeS82kkF3RTjUeeM/GikfVeQF8boVTqd63lbqMSF9aXatF9P8mnSU08IrHGWTNo888SU2IbSsIKZPVI3wgspyHfnDzMgnrWDl+dQk0ZPyNFrZg+lMERp5T3W6CS3UH/WR+AqE4dwwXCzBYElMfBTqRCpV69sAew++2Jd2N72B0MUXZe22JV299NAdNmVLkngNtulpAQ+D4fK5O0ClSU6LPOWtJwbfqYPzxATXqqeTTp5HeDdqpXbCAuCi8agcVxYNwwhvb92tTsYeaUzrqP6Dl2/zKLYPR+5z5u0
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(39860400002)(396003)(376002)(136003)(346002)(36840700001)(46966006)(316002)(26005)(336012)(31686004)(8936002)(8676002)(16526019)(426003)(82740400003)(478600001)(70586007)(36756003)(70206006)(2616005)(110136005)(53546011)(16576012)(186003)(5660300002)(7636003)(966005)(31696002)(356005)(4326008)(47076005)(86362001)(36860700001)(82310400003)(83380400001)(36906005)(7416002)(2906002)(54906003)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 07:17:19.2575 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5531b0-d882-4dc7-4f54-08d920164c72
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT035.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB5006
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
Cc: rcampbell@nvidia.com, willy@infradead.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 hughd@google.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, hch@infradead.org, linux-mm@kvack.org,
 jglisse@redhat.com, bskeggs@redhat.com, jgg@nvidia.com, peterx@redhat.com,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 5/25/21 4:51 AM, Balbir Singh wrote:
...
>> How beneficial is this code to nouveau users?  I see that it permits a
>> part of OpenCL to be implemented, but how useful/important is this in
>> the real world?
> 
> That is a very good question! I've not reviewed the code, but a sample
> program with the described use case would make things easy to parse.
> I suspect that is not easy to build at the moment?
> 

The cover letter says this:

This has been tested with upstream Mesa 21.1.0 and a simple OpenCL program
which checks that GPU atomic accesses to system memory are atomic. Without
this series the test fails as there is no way of write-protecting the page
mapping which results in the device clobbering CPU writes. For reference
the test is available at https://ozlabs.org/~apopple/opencl_svm_atomics/

Further testing has been performed by adding support for testing exclusive
access to the hmm-tests kselftests.

...so that seems to cover the "sample program" request, at least.

> I wonder how we co-ordinate all the work the mm is doing, page migration,
> reclaim with device exclusive access? Do we have any numbers for the worst
> case page fault latency when something is marked away for exclusive access?

CPU page fault latency is approximately "terrible", if a page is resident on
the GPU. We have to spin up a DMA engine on the GPU and have it copy the page
over the PCIe bus, after all.

> I presume for now this is anonymous memory only? SWP_DEVICE_EXCLUSIVE would

Yes, for now.

> only impact the address space of programs using the GPU. Should the exclusively
> marked range live in the unreclaimable list and recycled back to active/in-active
> to account for the fact that
> 
> 1. It is not reclaimable and reclaim will only hurt via page faults?
> 2. It ages the page correctly or at-least allows for that possibility when the
>     page is used by the GPU.

I'm not sure that that is *necessarily* something we can conclude. It depends upon
access patterns of each program. For example, a "reduction" parallel program sends
over lots of data to the GPU, and only a tiny bit of (reduced!) data comes back
to the CPU. In that case, freeing the physical page on the CPU is actually the
best decision for the OS to make (if the OS is sufficiently prescient).

thanks,
-- 
John Hubbard
NVIDIA
