Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C72A57EB7D
	for <lists+dri-devel@lfdr.de>; Sat, 23 Jul 2022 04:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A6612BC82;
	Sat, 23 Jul 2022 02:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2049.outbound.protection.outlook.com [40.107.244.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C6911A2F5;
 Sat, 23 Jul 2022 02:11:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jmOM9rhu89OCTAj9iwXnaed1XvgTBZbLKOgJoLtWpxlvQyqBEe1b8z8XXbaH4N+OuCWwTDeCF8xUm/1MQ2C1X1AjJpWFDttE0ZFozZYxhA68OvOditqBzPH+nBM/LhDhCywDpPuOHh2WwDsA7YOd+AhVBNvbCf9RLc2AtHIaF5tlY6v0AtBftv620Ak/GUH/B+95t+lsHaC9NjJ/9+o4pZwGfc/0nSMolSNXiWaUyMtht+tip8mD11ebiAAeE9enW0b3CznQyMLXVm5DxNsp2I6AIzOQUSFuYtVc6x56rPkdLxHM6iC9WlZ+yMs+tXWkyl7MUcGOEem4xbxPIhV/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TY575vzFQFXTMHwI7BldBhG4flA4mttfKtr6gENEj7Q=;
 b=jPpnql7ODmhL6bLeF+xyW8FxYCbp+cFTvKBKIFKOUqAQ/A0i8QuNApcZEC771PGl4g85MmkjhsadAGnL3nS1si8T4qVOJfPUHI2K2odVh8iy7C37ArSrGQMv27trsprqYqOMZZW3tozEjLFf0MrGXPU+CIhhdKkUWd/FPGqZflSZcz1qYn3Jn9PdiltH/xcUJjlnP01e1O88j3FXmQCvki0zU5P/xqDhgOTnW8KAqxbVstKvqj+e0UlLWynlaGChI5jPpkeFWOVLNGa56FP97cWp2smzqlhf/3FECqumOH+6QOqi2sqrlp+wppBJLY4AXx8425E0a6Hc/k9hqqwKcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=linux.ibm.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TY575vzFQFXTMHwI7BldBhG4flA4mttfKtr6gENEj7Q=;
 b=MRZ5fD7lH9k1+CTokdu7Y0GYfP9vVHLY7cuHWBoeEvia4rcOyTViZP2E+OXUX2ZHwLAfhm0ncDeUoc7F0vJpcevzn0qAA6DJvdg9XEKZrPTpH6GJgheMSmcYobktGgfqYWsm8ReH9vGppPijvpPUFYQqUUYmyBkhlmHj4D3Q9sn3T8s2giKQMTTpZw1sroeYEP/yzPZJKgA3Qvskgc7K+/7xIRki7Wqhxzf2bXTuwuBWIiUtEWDSX9UD8aWC75+fKExxVsZ0A7xHvcTiQt9Pto/8nsu0KiZmNiPeoZ19exl9os5QJkXE1UfSMzhqbp+lgwDnBwD9Y8gL8ov/XmPGlA==
Received: from DM6PR13CA0071.namprd13.prod.outlook.com (2603:10b6:5:134::48)
 by MN2PR12MB3133.namprd12.prod.outlook.com (2603:10b6:208:c7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.20; Sat, 23 Jul
 2022 02:11:00 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::8c) by DM6PR13CA0071.outlook.office365.com
 (2603:10b6:5:134::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5482.2 via Frontend
 Transport; Sat, 23 Jul 2022 02:11:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (12.22.5.236) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5458.17 via Frontend Transport; Sat, 23 Jul 2022 02:10:59 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 DRHQMAIL109.nvidia.com (10.27.9.19) with Microsoft SMTP Server (TLS) id
 15.0.1497.32; Sat, 23 Jul 2022 02:10:59 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.26; Fri, 22 Jul 2022 19:10:58 -0700
Received: from Asurada-Nvidia (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26 via Frontend
 Transport; Fri, 22 Jul 2022 19:10:57 -0700
Date: Fri, 22 Jul 2022 19:10:56 -0700
From: Nicolin Chen <nicolinc@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>
Subject: Re: [PATCH v3 00/10] Update vfio_pin/unpin_pages API
Message-ID: <YttYsIS34sSrYC2T@Asurada-Nvidia>
References: <20220708224427.1245-1-nicolinc@nvidia.com>
 <20220722161129.21059262.alex.williamson@redhat.com>
 <Ytsu07eGHS9B7HY8@Asurada-Nvidia>
 <20220722181800.56093444.alex.williamson@redhat.com>
 <YttDAfDEnrlhcZix@Asurada-Nvidia>
 <20220722190901.262a1978.alex.williamson@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220722190901.262a1978.alex.williamson@redhat.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 683b32bb-f04d-4164-c7bf-08da6c50963e
X-MS-TrafficTypeDiagnostic: MN2PR12MB3133:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: skcMmkHis/56Vvc11wM70RZP8aaykckCteE8rW6HKrvXs9sCA7Jm0H2c0/OtusJuHiT0zalLu8Z1zdAeCVZmrhqWb7LsDGDFX5AEP9S8QZwkfqN6TrG8cjyPWbyW6HiwfI7Q4TUcIQ3CiS9Xmb4iuXmavFkUknpBKViY+wGeo5ZdTXqtT+rktePIOL5rpAG4M8Cb9Rij8iA45E0tS4M2e2gYB5IhkFVU1Fz8s1z61eyAQnRzjO6htKP+AvgCUhWFiVPSijYXo65CIq79nPdqVFT5Ie+4HpnpfBqdtMRe4Z6T5AAfVzmn8++uWVsr3HvJJmlLMpIeGtjwXp7EyJ5yWL4V5EL+jdD8XfKYed/sMe45b+pqACa8UdDp6+HSS5TDQV6974tHt16geHrG97BcsOLZwfRwQjXWRRQbxa+W4/PAvxKRqb8aVUKnGTUa687Z9DjaNe5c737VDTVYp3p3S/WZLpEora+TNRAz0oIrZ73qDW/vPed0jNVmBiB7st/xAoRpB851Mfgqu6MzTrLExJPZqkjjZf/9706+fbIv3ak5p2zXtHmvCfzlnsNI8eKCYKehKB8npzbT5saLwtK3aZdb7Fl0egaz4z0d+pptW7D3Y3K6bHC5FuMKDZNmT58dQwLavOHkb2QHxfc2qku71wc1y5W/MgDe0jFRF3TyyC+gA8lhlCtJS9ewPZlBX6/L8uul34RrGp07TJ54bONxKyXLb0/mm9dDpe27tXqMA1/z2xhaXYEQT28pUWyTAp8tltpZPuX9nPHwKRaqNFAPxdNxVv69vvQaEUZW8/6z0I9G0pC+jtCU1OATjkkjYqJ4ggmzkV/HeRfpJvaLB31cS+V/u5Buh8sjXVN7IHDa8yg04Dv7cJVLFuCrvLIQLkluyGyfetevElzk3erf1ezVqvDX9IECe75NQ1P8gQgDykY=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(40470700004)(186003)(5660300002)(7406005)(966005)(6916009)(54906003)(478600001)(81166007)(8936002)(82740400003)(356005)(7416002)(70586007)(8676002)(316002)(86362001)(40460700003)(70206006)(47076005)(426003)(4326008)(336012)(36860700001)(9686003)(26005)(33716001)(41300700001)(2906002)(4744005)(82310400005)(55016003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2022 02:10:59.8976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 683b32bb-f04d-4164-c7bf-08da6c50963e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3133
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
 kevin.tian@intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kwankhede@nvidia.com, vneethv@linux.ibm.com,
 agordeev@linux.ibm.com, hch@infradead.org, kvm@vger.kernel.org, corbet@lwn.net,
 pasic@linux.ibm.com, jgg@nvidia.com, borntraeger@linux.ibm.com,
 intel-gfx@lists.freedesktop.org, zhi.a.wang@intel.com, jjherne@linux.ibm.com,
 farman@linux.ibm.com, jchrist@linux.ibm.com, gor@linux.ibm.com,
 linux-s390@vger.kernel.org, hca@linux.ibm.com, freude@linux.ibm.com,
 rodrigo.vivi@intel.com, intel-gvt-dev@lists.freedesktop.org,
 akrowiak@linux.ibm.com, tvrtko.ursulin@linux.intel.com, cohuck@redhat.com,
 oberpar@linux.ibm.com, svens@linux.ibm.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 07:09:01PM -0600, Alex Williamson wrote:

> > So, I think that I should send a v4, given that the patches aren't
> > officially applied?
> 
> Yep, please rebase on current vfio next branch.  Thanks,

Sent. And they are on Github, basing on linux-vfio next too:
https://github.com/nicolinc/iommufd/commits/vfio_pin_pages-v4

Thanks!
Nic
