Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C2B4B0B0F
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060D710E7E4;
	Thu, 10 Feb 2022 10:43:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D94E10E7E3;
 Thu, 10 Feb 2022 10:43:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MEut1zlV83+H/97P0gfDeatNk4+yDEYt3VUhScDRTRMs0fET35u/E0EzweH90uHe/oWj+Qpdus6LkZK92Uc2NHjyB0DGKBj3nt08DP2THXcydsCI0lQW3RFmp4hWSN2uZbDkhcbbKTQW8CJ/VhFVJd9raQdvtnwR5aS5x8xCq7l8RTl+b4syHU7T12fzeZiiocnxNNEo+T4fsUVmcGJ43Gm8B+ghTpHtb8j8nTP5LCNRuFjo+FmhDwqNWL/Ym44WdMCtny//uOw6CnZR1vPiCWjWdPjev74Rs4f+5bRUB//nhbhUQZ+Eab/y3slFJU2tK4XHT7HRIUDv5gQboXjdlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gt5y+G3jXi4QoiXNDAK+IF+bBdK0OirEVIl/ENMjaQU=;
 b=mZTtqDeNr4MAjfTKnnM6MTStKMY4AYjwxUt/f17fCR86X59CohWQwjkRojlUb4snoR+A9zrZtK/kDAMdlsn86nkRjPZtH4F5yqV6mqLxQdLjc3K7NQuLRu6cCi9wveA7I5F4N6SF+o2s3FLMklXtk1mhubRLflNy8WVCz0mmkNPwTOhmgqpFdkGIXDD/LVWjUgKeNhuhExeFXsHU92t/viFeoNQs55F7cOeKQHVD5SV21MhUYU2P474zFtPrVa3Hq5UlzAIsK9SOB588kGLYzdGrbIoyQSLc1fGjTQSTo5c5MZ9lT2EgTQrl+7kpkPXic3g7yH4uHJC5FeXxm7CafA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.235) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gt5y+G3jXi4QoiXNDAK+IF+bBdK0OirEVIl/ENMjaQU=;
 b=P4QK3nDVN8fUZqRFV4XelJrZCmFDiERZxi0yGJn3NdPlexsuy6ZIhLvb4WoV1j7jUrA1x5M4Jd4Kl8Nc6agbbHKNptQn08tGbgvirGvRCpSXHJhgqCbA4/uqFSnfzorbgPbr2gMfPhVjyYy6ueM5RjNDOGZaBWizYZD9B3L577YMSdqNlNZzj7VZZfuI+Yx+tUpELhAEKHOd3Oj1uppr1SfbVz1aXi6SmdjeU2VSSmjTmwticeesLwEp+rQFYUUwHxzLV8V8INCQCW3FGZi3hj6rCWsePyP3Ig9FSWpFpK2Oy5XAyRL9Fd9t9GVX2uCTlQknc7T47yxuStQBK9ZxoA==
Received: from DM6PR14CA0050.namprd14.prod.outlook.com (2603:10b6:5:18f::27)
 by SJ0PR12MB5421.namprd12.prod.outlook.com (2603:10b6:a03:3bb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 10:43:10 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::56) by DM6PR14CA0050.outlook.office365.com
 (2603:10b6:5:18f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 10:43:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.235)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.235 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.235; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.235) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 10:43:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 10:43:09 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 02:43:04 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams
 <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 14/27] mm: build migrate_vma_* for all configs with
 ZONE_DEVICE support
Date: Thu, 10 Feb 2022 21:43:02 +1100
Message-ID: <2318365.zqT5ATe7uM@nvdebian>
In-Reply-To: <20220210072828.2930359-15-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-15-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c64cce41-c517-42bd-b7e7-08d9ec822147
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5421:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR12MB54219AF0E7E764D9254951E6DF2F9@SJ0PR12MB5421.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uJ7CDXq9nW/H8ZdjJtz9XeXLbMQGgxY48mRY7WWT3M1QJcXSH4AM9nY8J2Qh5tvLEjatPB+Zpgmdz/QN3J0GaEzijNI3KJSfHOxPqO/vklbUmHKsmw7WnkJfdQ0VnZ02+ppH75GrRIi6WCcoAuZXC4Iyd7x4pr0rsXccqlzrNQrUHyVlzKeg7agZqn6kZNEv8ESqQ03rPbakRB3FEMO9nJbi99/+1gGC7rXOCmI0Y4uxMCwAQfe034bYu4VaIJOJu5IMbBblGgVgK38xZ1WEY9jK8uhs8T92Q1PX5tJ6HARmqGf/oU/Gc+4u42Dw0Nh3LBQQda172e+5aKn5c64x32odaw8fG2ThI06V8kp2D5GUGynnhkREt7fq09CS+0IIkp2qauMVtbTpI4HdqZul7izJcd6xN8tC4RgwjYsoJ/8SPE42A6EAKQi1gpfkbix+iccv25SqXhXSzRxqkozXTFPUaHslqzUUzv9oY2a+dL2hksOtE8dingpfZuSp+pmtzDZcDcFqLkN3jVPUQbiUAfSAFPFe23MfAUAjTmNQYIGdFiQcPKdnUXOa63mnPx9iUHxevbiP5m8uT9AiXLMR7xIXQS1WoPyufvQ7qrF2ntQEd1dIv/FqDNhxBi3yj4OtMdTGLj7qVWBGDFfxRNHlVpyqb8SCxFH8nUz/x/9+HcODuh8RbJnyMMIuB8G8DbnV3Wail655O1V93WKyidEE8XuEmFzILbAR29vldbste0+nIedHfoXdViX8Uwmsqfng
X-Forefront-Antispam-Report: CIP:12.22.5.235; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(26005)(186003)(81166007)(2906002)(5660300002)(316002)(16526019)(426003)(40460700003)(7416002)(36860700001)(4744005)(356005)(54906003)(110136005)(9576002)(9686003)(70206006)(4326008)(47076005)(83380400001)(33716001)(8936002)(8676002)(508600001)(70586007)(86362001)(82310400004)(39026012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:43:09.6481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c64cce41-c517-42bd-b7e7-08d9ec822147
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.235];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5421
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks, it's also better than more stubbed functions.

Reviewed-by: Alistair Popple <apopple@nvidia.com>

On Thursday, 10 February 2022 6:28:15 PM AEDT Christoph Hellwig wrote:
> This code will be used for device coherent memory as well in a bit,
> so relax the ifdef a bit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/Kconfig b/mm/Kconfig
> index 6391d8d3a616f3..95d4aa3acaefe0 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -250,7 +250,7 @@ config MIGRATION
>  	  allocation instead of reclaiming.
>  
>  config DEVICE_MIGRATION
> -	def_bool MIGRATION && DEVICE_PRIVATE
> +	def_bool MIGRATION && ZONE_DEVICE
>  
>  config ARCH_ENABLE_HUGEPAGE_MIGRATION
>  	bool
> 




