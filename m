Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC8B9BD453
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 19:14:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD84B10E41D;
	Tue,  5 Nov 2024 18:14:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iWWtJIw5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D24B210E41D
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 18:14:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szwICDRD1K8d5mblymqUsVJ1WWcw/22BwjssjAzQ7cfR6qCxO59P/6sTnFDUlLKozKmumumJuzGdMmwS1/wiYi1/+/GocR1UTdZI3EwZw51SPDus3PDKhtaQfXnGOmWEsQJM4nV1J6VSgrmitZithvAGt+CLOh8zXLhT8/GGxfhXgr/klKt1IxdgvkHAn8mzdwMoTdGQn1UJzH59ZHVEwvzi4pZXAo+vutvtaKHnImHyw+pQhPKd4NXPd9jdYn9Ebw/9Ut2SViBHt6T5+tSlUdUxZpqL7ozneDV0da4TlT4xQDcpXvi5d+O+sYG8YZIZ8SdViofNEE7hiAwdg2IWfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ba2ruC0I9kodvIkVGDgELdqKrtG3OCBw2QTqZjaMAcA=;
 b=lCASXe6RKLJtzVylSjm93HuYwvLsA7FJvGw0+tA3NsTvflL08H83tODUxEB4sTF2/HNteqNHYWAFvlLnpUNswXWe6fyh/TmQy7icRt/BELDPENOEiZyPCs+gC9QgRr2RVc6ytDeXJ2s/Or+V3ecoOgFoJUtWjU2emKkdppjC3nFNXfoNLogbpKXKz3z5e4PkuNKqBe31amAnAyuz0JfioBmeJG24b+aOwn+vh5/QxVpNjOYtZiacXaj3ZbaO01LapuLATOJhgISMn4JgJIYeUEgcRxMOhIV7UTt7rcxU+vJ4PiaKFvVKgRrtWD0eK5yPuZYg06QLbFNnwojKfTgu4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ba2ruC0I9kodvIkVGDgELdqKrtG3OCBw2QTqZjaMAcA=;
 b=iWWtJIw5t7/wbZHMEGpJUt1anBxRlsDjMV5aFTsr1BglX56pu+LuusRC9E6gOgKqnYpoKj1f8AQk+al7FfOMFGT6LXbm8zA7Zh5zRyXkZKT6xQaANok5XnkXGkW7W4vzHEwhADbXbC1pQmQKKTInbpe/OhooA9yHaNE0OcPamyn/E4IcaYX+YV7H0DSzGrS9zSiXjL9G3V7FARDMkGkoMG9gzkDrT1BgARMq2yByEeC6N17yzwvcUpndiRNXW09x9/ANzVrzhPgZmnV2rtneDyVEMviap/QGczeNTag1YcryGdeKVAsqZQcC+BKV0V+vKgISMzy0D2/kL3NmC+nmdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA0PR12MB7508.namprd12.prod.outlook.com (2603:10b6:208:440::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.18; Tue, 5 Nov
 2024 18:14:28 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8137.018; Tue, 5 Nov 2024
 18:14:27 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>,
 Will Deacon <will@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: [PATCH v3 3/3] iommu: Add a kdoc to iommu_unmap()
Date: Tue,  5 Nov 2024 14:14:26 -0400
Message-ID: <3-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
In-Reply-To: <0-v3-b3a5b5937f56+7bb-arm_no_split_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0382.namprd03.prod.outlook.com
 (2603:10b6:408:f7::27) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA0PR12MB7508:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a28bfd6-0570-4e5c-7320-08dcfdc5af86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+rtGmT8+v47bhLSYwH24vCw24W5dHHronzdwdPueGflipYkAvN4JzNFdA1nU?=
 =?us-ascii?Q?y7o8wtYwTjM3Ks/MU+fgmIOVWaIVh3ju62GeB4XlcTSNYHW9yXtYneD7VhgP?=
 =?us-ascii?Q?NN1IE/gXSDKTIuHVtfotjuzFgsaw7iF3FY/TYoKFM82L1g3oKbXsPNHzy2nH?=
 =?us-ascii?Q?MbOjlFNrxcE6KfQqsVpuU3mFZZIeQ7i1jWf2N79uE7jut70XNfoQsgpS3IiW?=
 =?us-ascii?Q?MrEJO+orKYQJ5rnAgQplayYgvswrss7l3RJvaX26hkENTI9bK6SVTVImz9QI?=
 =?us-ascii?Q?n+bIAzUsi+gWu9PWUMitAs9BS9PBag2NB7OXFzjfCGg/Qm1WdrolOgx7Adcr?=
 =?us-ascii?Q?P4ecIHU/TFPlRy6T420uKzl06csfjQRGswf9y0KK/GONbYN0N1odZL7n6Z9l?=
 =?us-ascii?Q?mlT02vx5GZmeSsaHQAHgfdRRrx3LEqKeEXap4y76SsH8YYg/4VULiknppM2l?=
 =?us-ascii?Q?P8wLgaKW1T8RvJTWPYr9/HUHfoiGP1xLSieQVR4keRQCzeARwzSSQ4a6d1Jp?=
 =?us-ascii?Q?5aXYjTHdj3+cj9/wtjqLzDOvhg6+F+Uj4z/pgSV1+d40sl/ejDX4EZu55RYl?=
 =?us-ascii?Q?CKkO3RKeHoJIJvydIyNMdI3nlUdM4pkgKb27PW/0cEBPa3M9F60ALd5AAb+J?=
 =?us-ascii?Q?QYqqePk4XfAIb7ISCOYXL4n5h2YvUCJUuS5kkDRGgUOEXZZBpyt+p3Cx+YbG?=
 =?us-ascii?Q?Xc6GtHcl9o9xSKjHVzQGnA3Z3G7eqs50SlLynRoB2/y6xOSn9fkBys93rPxD?=
 =?us-ascii?Q?IvuxgxJ8iiIhua1xNY2SOzKjL3bHYUZOY+FEa7AsksaWABAJasm9kUX4tvI+?=
 =?us-ascii?Q?+mruWPcdvFQt/lkwWMqeEvVE1CwinsGXgb66SH+iblfHTUfecAZj1uF0nPhY?=
 =?us-ascii?Q?Xizh8QeAgFxR5/zu5Ghm/X0iVedge6Kg4VpJK4plylF7d1Yy1bQVbCHuXcD4?=
 =?us-ascii?Q?zw6BFJEWl8kwT3oZUSI1TloUhsO0P5FUKBiuul2zz9UvTyFcJgIHY4QmwagM?=
 =?us-ascii?Q?4p6ZSvXgL3Hr7nCjN1Eh93grKdsy6EyyzzI+61jByMT03iFh3kLooS2x9HWg?=
 =?us-ascii?Q?zT9InHoKdeLffc95/7O2Hhlxvsu5dnS9yBHjBVzQLZRLl0PJn3YwHy+4NxBE?=
 =?us-ascii?Q?bSSBScf2HbipYPU5X9LxlxKSaQtKRKHrRskAaZTNirHap2jceX+CrkuFWCbM?=
 =?us-ascii?Q?eBPp6wIOJBu19YJkAsfsurhpYHUarmSEWOJgayq3+fZR0ytbYjv5kFWoZotd?=
 =?us-ascii?Q?0IRDu13ZwjHW2aqbT/22RnwQgqsCa1Df5zmVzfA9vENO3bGTfCqcfedjRdDv?=
 =?us-ascii?Q?sD+/A2n6tIVny4wih9znSiQR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9S3Aav1NVnPjIlk6GgEXzAEe9gMxRVwbIftDEYY8y6QJpjnd+bdX8siNOnfs?=
 =?us-ascii?Q?NgqyiSps2l60LX+JzlhVV5LA9m/kbF0XWfmdILcYjc8d9zvN6ZRljhzzzeve?=
 =?us-ascii?Q?pS1k/uXZpFvu9+tzjqq+Kbe9tqfH+L/OaF6hqNbLUcBgNlIz1e/6IQeJHtNI?=
 =?us-ascii?Q?Pv7WcEja/2koptX0fAVJZa4him1+FSb2XIDNqfHIGVi3X6HlUsSxgIkqHcvt?=
 =?us-ascii?Q?soJ/KmjqTpaOKRpdiuzQe9B7aecxc6fITCgLr0FkH+v7CZzHJFQbCB81YuB6?=
 =?us-ascii?Q?OtXlUcif4DOQ1YkO09HHLsTmmB5Cr1UPGBN8stWQzwfXl6gXIXPC7BQqlHPc?=
 =?us-ascii?Q?p5F5KfYtI58p8QnYLKiKmkyh+Ja1COpk1aX3HNIckp3ElASCvGjxQAwUAa/k?=
 =?us-ascii?Q?Y3gN/2PZRyJ/XYGKulN5pZPhxGiSQNopJ/LW6WMk6JPljDq8OiNO8JhIQQXu?=
 =?us-ascii?Q?lc7usI1VqzYeomLwlZCRoFEge4xXOzblC+dXZYoqoq+scwJxAYqeHLuR8F6M?=
 =?us-ascii?Q?rM8u1F7hj+aKahGckSeuEakOWYy2nMtZXINodjptPFkPJnx3s5XBXf3qUJjP?=
 =?us-ascii?Q?Zog5aSSadvCtGbzOsFv+XK+HePjn0bgb93Jc7lvMBHfHbOmoSV2BSCUWGCMn?=
 =?us-ascii?Q?pt6DsaaKospTVlLQeVXIc2osJ6Tw9SnbHpWArAcx0cxf8L+Swo4N48M1k1ds?=
 =?us-ascii?Q?eLV9+UR967rKzvej0bHs2QTOw91dlVmCvsbqkw7eybwZeHe8vwmcYcNna82A?=
 =?us-ascii?Q?PePm8ASp0xtNkyxSIWo6gYZHxEd3J00nlq0lr2tdXQi5iFWTI7n4j7d7fZW8?=
 =?us-ascii?Q?lknRiqk0hiZzIYaQ4oeTsDmrsRSciLGeBLHkSNE1F1LcCoOKxAT5R+qtNDyJ?=
 =?us-ascii?Q?e/zIMyFPOSsOcVq/E0sNP9jqqSZdVAU/2c2hxq4Tf+zrpFZ01VEjGidLU6aj?=
 =?us-ascii?Q?V2aydd72DPFI1lxBi0W1ZkyqRKv5J84Qaz6BWP8Nek4QqJfU44J/IyMxt+Pt?=
 =?us-ascii?Q?pz2c9AZVnGiBqxzJ8U1UMHyqoadfgspT0DT3OKavaTJkt+x3zv9++4Cbp60k?=
 =?us-ascii?Q?rci7/+XLmMZxatzq960+R895Op1SNDWKB/pqaRv47lPmhvhtmfOVNE5vVXaj?=
 =?us-ascii?Q?aMp8yFF7cyDI1cEMq8QZ9Gm1iPa+LohyrFHBVz4ukfbhJnHQklbBhuxiIaMu?=
 =?us-ascii?Q?gAXIeCLLsHsnQua4VBdpA446jwNJYKVhSdNp89fz6BzbtGiB4ZAc1DkXeOlp?=
 =?us-ascii?Q?1Go53ANq5XnKMgslmT+ND+3xjp1kp/6v1JtG8wZDNM/hA1vlkL07yPvie6PC?=
 =?us-ascii?Q?1EUNk1eBiJ0siTDXDn1z62FzrlKnf+4Mda1lvJOcTYqJXt2im5LUZ21Juygy?=
 =?us-ascii?Q?EgGubvxK7Fk3RTzlkL7bQnv9V++nSAqnB2WATzFkqHAtKucWuMxPOBBtQx8o?=
 =?us-ascii?Q?by7SsSaEPd9vLjbO7hmVq4B/9cAqXYE/AmzRoqcLDvH8J8Sk5IeEYSJolV96?=
 =?us-ascii?Q?Uq+0HN4zDu67L4b4Cf8dfBQFMQBZJgWKqKzURaV5PV3MaitQKK//dRFVff45?=
 =?us-ascii?Q?A4RDL+ZlTWjKbwqaHfVcSDepSGilaXU0wWADiLJk?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a28bfd6-0570-4e5c-7320-08dcfdc5af86
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 18:14:27.6290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CIIhoFEp5BgQAd8qQQPV0h8GYX0p047ZMQqOE8ZsdUEtPXMO296SfnclL+hAeKzq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7508
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

Describe the most conservative version of the driver implementations.
All drivers should support this.

Many drivers support extending the range if a large page is hit, but
let's not make that officially approved API. The main point is to
document explicitly that split is not supported.

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/iommu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 83c8e617a2c588..19b177720d3aca 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2586,6 +2586,20 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
 	return unmapped;
 }
 
+/**
+ * iommu_unmap() - Remove mappings from a range of IOVA
+ * @domain: Domain to manipulate
+ * @iova: IO virtual address to start
+ * @size: Length of the range starting from @iova
+ *
+ * iommu_unmap() will remove a translation created by iommu_map(). It cannot
+ * subdivide a mapping created by iommu_map(), so it should be called with IOVA
+ * ranges that match what was passed to iommu_map(). The range can aggregate
+ * contiguous iommu_map() calls so long as no individual range is split.
+ *
+ * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
+ * unmapping stopped.
+ */
 size_t iommu_unmap(struct iommu_domain *domain,
 		   unsigned long iova, size_t size)
 {
-- 
2.43.0

