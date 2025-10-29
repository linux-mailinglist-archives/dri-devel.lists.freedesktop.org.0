Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD8C195D4
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 10:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64F7510E18B;
	Wed, 29 Oct 2025 09:27:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q73AY/iJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010050.outbound.protection.outlook.com
 [40.93.198.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFCB10E18B;
 Wed, 29 Oct 2025 09:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ugsA56NmRYydxF5IJZxdxeAHzw4s8yCqWNC2khSFVXr4FBR9APVlgu6vOQFCG1YxkZ2yy3VAF8sWClD6mEj6y223MEkUobwrzh4mQtGft/efPdplMLd8mxlaXG59cK+OxWSwOI/9sJJgSQsx6d8wBCwV6ZS+qvcKS/k4WHLIW5RLbVZYFXf6jfLWALqKM0LNZpUk6Xb91r4hJkKunAP0d/q3i8K98zorD/TnnIF8cbWvZyBTlRIXbtieoOjeqyatsflHg/csdmI2CR3zx7ynl4cWKSnHrmzZzKzvEMDOfzahRLhZ9r/4063bGanMpssfTXRVOpQ0p7Z7awZI1m4Jiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xz6a3ozz4aSvRNROJz/OvlvZWPYRHeII2UMRvcKmH2Q=;
 b=Up7SvPMpIGtANrUHuIbLTnmU2aGm2g4HAsgZ2q9U5pqo9jittAq2Ba5hDENz2aLbbdXO7zOvBFGG0lGhpDMpfl0ftMTbnDr/lR6kngNwt4hGgqBzUiQwK6/9WxzbdbATkdGR9XyT4ln7dGGJGtCRGRdkvTuf1LYU8puBeAKdT6SnmBBUNLHIr2DCirXh0tdMYov05SS0moywrFwTb5Zi+9ShsG2mk/c80DpHHWS/9RphMBlZHoCHJY85NSum38o/6MtqVcGfPGsGj53dpbrrlgiAjLid83wnEWobbf7gcGRrBOUSLLrMrxZrTuIsvrH+bx2x/NPXaCdQaUnSMyY8fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz6a3ozz4aSvRNROJz/OvlvZWPYRHeII2UMRvcKmH2Q=;
 b=Q73AY/iJTJLdPZ1VvrZzeeFLpZVmI8PXrocF/LqbeV4Rfa8mBTCX4jiiiCZZkj9Zr4o7ttQhZXZTsZYuRRMNOi6X6kmRZwS1O0/LwFqDwKdLLe9Ee/dtMdVtoC6y+pNvKZ6eb+9QTLuxyZuzorILF2j++htRlk6FR+B2Ph340LCIrTex97mgC39cDWy5Gi67AdXwr6m1+qIhKqhQFUxHo6CEdMcHjJzcwOjRAuIENLYpDbQxvnTvYvAvRCCT6W6p/+qVEACEFki3h7s1aF4v4mt7q2V8v4LTBnuDroU/Oan/brneWAkl6Z4OT7MGb7Jq07DR9VmOe5vz8mP0kUas2Q==
Received: from BL1PR13CA0017.namprd13.prod.outlook.com (2603:10b6:208:256::22)
 by IA1PR12MB6530.namprd12.prod.outlook.com (2603:10b6:208:3a5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 09:26:54 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::6e) by BL1PR13CA0017.outlook.office365.com
 (2603:10b6:208:256::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 09:26:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 09:26:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.34; Wed, 29 Oct
 2025 02:26:41 -0700
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Oct
 2025 02:26:40 -0700
Date: Wed, 29 Oct 2025 11:25:34 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
CC: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 <dri-devel@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Christian
 Koenig" <christian.koenig@amd.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>, Matthew Brost
 <matthew.brost@intel.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Message-ID: <20251029092534.GA11622@unreal>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251029002726.GA1092494@nvidia.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|IA1PR12MB6530:EE_
X-MS-Office365-Filtering-Correlation-Id: d3a6868b-c28c-4f75-6bd9-08de16cd4cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|36860700013|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NVngunuNT47NQo84KAxs+T4FBFstm9ZqvyHhe6Y7o1ytajs0tghCGyc7lkp5?=
 =?us-ascii?Q?eft2oivsF9N4t0Jr0GTCwBYCltU2H3osfOOEttSVNQPDcXvv6Z06bIxD60dl?=
 =?us-ascii?Q?rS8tUNdNlqg4GaLFPoi/EvR+cGXAYV9HaPCEph88viM5IvrRfHi3tfcGMIlC?=
 =?us-ascii?Q?vkFXuxdvjCw0tL5Bb4uBwnfLUQcERgCQkwQjiJKPlDxMYmurRlqPOqxBpf1M?=
 =?us-ascii?Q?t/eRezZxLIKMLc4yDyxUQ5k2O4jzDjjXNuFhR/RW03uZtX3Ezha8od/STgNt?=
 =?us-ascii?Q?0Fp2YCZcBSpMqTOsvXL+Zj6ZOrYsTP9acG3TJVs/gCSU9G2TrYKEDNs88s3q?=
 =?us-ascii?Q?hfOojya9f/MhpJ8cf01NYjaeXMA7LB+stNzkbKYFZfby3Fts7hw4oKQFOmMu?=
 =?us-ascii?Q?Gsq/ERoHZ08vEAoYdH3ahN4YV3mBPxZm99yKGQCOizHrNxuuVXqdchbb2B0/?=
 =?us-ascii?Q?qCY9KFSqTu3nDXorLjBVFg7ShHrqqFWGi2g6OW3nD3cn2f1ImCt+ICfRQAV0?=
 =?us-ascii?Q?EGIlOrN4HFYymHmdkB0wdDBfnJeM7tPcleIgRzkSn3Ivok9EFBgy3kqQ+2xD?=
 =?us-ascii?Q?tumZrTNMGHaqwbCLDyBoOs6p3jOOoR4IWUJnAbRdPXuE/PpaO5nEICVy/1sp?=
 =?us-ascii?Q?qQk92PX5vs/ljT3K4u/PqbNfPX3Lsb0OZuii9f1qi7gqwhfk8pBDykz4H6y7?=
 =?us-ascii?Q?hQRay8LU2dnspn9ylmANZA5QPUrbR6YSGTaw+SV2O6gOPJGO1LmEMDO4NbWv?=
 =?us-ascii?Q?nXNUG8k2QKU1Bf/K/6kXw9dCjCB8+VmOiPGkcPORCR7rmrIGC7KO4pPSGSBl?=
 =?us-ascii?Q?L7jdm/8K2UoxXCQH94uboE86UWpraK+bJQ3bHNOe2hunSjzjE6ItiTGJ+gwW?=
 =?us-ascii?Q?1IC5jco/4YX1fVMZhECgPat8N8lcilzMa0yuDAa18X5i6QJiPI8wgMSPe42m?=
 =?us-ascii?Q?iq50OBnQZBcqbXSVc6MyWSjFGq9bxS+hXX+w5TGM2XFfAiXWcouFrZqWyfUL?=
 =?us-ascii?Q?i+rVOt5YLJeM7tnKS/NiLdvV4T6GTYNytBvcdloyX0VQKx0c9FPztgaZORHp?=
 =?us-ascii?Q?KF/WIRpmQDdYwb3HwSBpbqcAqnxfnqTXYvMDBSGJXA4VWutp9ohELv7t/+wy?=
 =?us-ascii?Q?MyPPEfqXhaiYYQylMfw52M/wA2S+KeitsfAawwzxKAxI0AUdWuPclZTocxv1?=
 =?us-ascii?Q?1NByaTK8zUPF47GZGltD1LRBEIKShWaxAHjAaR9anSfx/51jIRe0O9mxe8KM?=
 =?us-ascii?Q?EixkW8hTk0eHDqVtdwl64PJrfR6t/DJhr6jpNyu5xQct5NqEB4kEsaf0wryO?=
 =?us-ascii?Q?5QpANNRuC4N3RLALs8v0G9jdlKtg2kFiDV64G6jsiyYoJ9gDG7Z7LBDh6V6b?=
 =?us-ascii?Q?vMSm0qvgYPJXAi2ArbPYqP/MhfyYtqQuZbMrXtBMKV+rPqD1+Cy7LUAQVGBz?=
 =?us-ascii?Q?+pVlvyWbRlvEzSlpL3AN2ZfHyeo+ONuRD/axGIPXq+lNq+HDqEa7+hbtC9HJ?=
 =?us-ascii?Q?chj9LrUH4kpF2JHeaGxg02rQTZ0odC/Kjl3la6XHfhStxWb4uKWQpbD89KiS?=
 =?us-ascii?Q?JS++JcUjML30ZVvUSjctSz0NOneKI03kr2PACE/7?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(36860700013)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 09:26:54.6379 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a6868b-c28c-4f75-6bd9-08de16cd4cf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6530
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

On Tue, Oct 28, 2025 at 09:27:26PM -0300, Jason Gunthorpe wrote:
> On Sun, Oct 26, 2025 at 09:44:12PM -0700, Vivek Kasireddy wrote:
> > In a typical dma-buf use case, a dmabuf exporter makes its buffer
> > buffer available to an importer by mapping it using DMA APIs
> > such as dma_map_sgtable() or dma_map_resource(). However, this
> > is not desirable in some cases where the exporter and importer
> > are directly connected via a physical or virtual link (or
> > interconnect) and the importer can access the buffer without
> > having it DMA mapped.
> 
> I think my explanation was not so clear, I spent a few hours and typed
> in what I was thinking about here:
> 
> https://github.com/jgunthorpe/linux/commits/dmabuf_map_type
> 
> I didn't type in the last patch for iommufd side, hopefully it is
> clear enough. Adding iov should follow the pattern of the "physical
> address list" patch.
> 
> I think the use of EXPORT_SYMBOL_FOR_MODULES() to lock down the
> physical addres list mapping type to iommufd is clever and I'm hoping
> addresses Chrsitian's concerns about abuse.
> 
> Single GPU drivers can easilly declare their own mapping type for
> their own private interconnect without needing to change the core
> code.
> 
> This seems to be fairly straightforward and reasonably type safe..

It makes me wonder what am I supposed to do with my series now [1]?
How do you see submission plan now?

[1] https://lore.kernel.org/all/cover.1760368250.git.leon@kernel.org/


> 
> What do you think?
> 
> Jason
