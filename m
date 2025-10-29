Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F73C17897
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 01:27:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB8810E6C6;
	Wed, 29 Oct 2025 00:27:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="e7Ad3NZ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010051.outbound.protection.outlook.com [52.101.56.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A586C10E6C3;
 Wed, 29 Oct 2025 00:27:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVA5Y/fG6B7eNOlipbW/Afu25MRptEUMXvL96emfsUmF8mnIJ+BOMiBKa3pyL3A2EFOaMUSokgyk+YnkwuGB3v3YsbLiXIxMa8nv16Y6tOXVN7npzbrI7G5H6tkFkWfoYbr5zx8b8n4XMNf7VXswPCUDh+nHNWskyEPuvRht4zR5Y4rPC5W1kRIuhD5Ub6zV5k43GrsaqnYDBBdSWevuQQs/YTlQ+WRU2+CJsUCT0rQM2XDdGsS8sUjES8xa/TgDKSaogDBlvoEyCSjG6+wXIhOHPXSXB6/1pZUAYQJ1t41WtVP5yJfSkZP66r40ATYlLr76yP+/zN/Bxg46pG20XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uWARp0Kxq1lfTEtY8GKa32bfRZolasl7gj6wyYdEqV8=;
 b=TuSThWAvvTFnT1+z4TjOqnqVkR2ooYuZ0S5ArC06eqEclc1vopLq28KEpRuzA1MKlWkL9uPHf2W1V8WXp/+yAKEz+eTfPA2q5iPFwGVJUiV5gP4PlQgx6bT7iW7ikSq6Xta7PkGlKnXIeflZ2HAgRS7UBIGtIgc1aRNF5QB7BJlTh4fz03gCg7e/iS9/ruHxvxv8iTUMkaAJho0eUILhdbkvyzt5QLB5CXgf3yiDibBfFYvtU6JaggmkZwo3ehJXWsSVdNqxMkGymGogJoqVeMFKdZtjATlwE/SnyUZk7nSIv2Wf2vgGZltrtyjP1g2bobPM0tO05RJ1PQxrSssEfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uWARp0Kxq1lfTEtY8GKa32bfRZolasl7gj6wyYdEqV8=;
 b=e7Ad3NZ3imQyU/PoowXCwEIb8rrgF6omphEbcbPnvNBMe8MezeMeF4u3svbWknANRoC5lxiSoC77izUORlJkkSvvhPTRP4ifhm2QsesXRNFI7xIjHhUlRK2sQcelMomYselpGshMrpIdVsy9FAMyU0FU1FrVdp7d5huYibklsjJbSeHnpb5kpnQrOrdsgesbrjPvHrrNOLh5d/tS04vumhV9VcCGg8K0bGXXUqqhqRmapxyDw9Ba+UPht6ztONvXEWqPfYBJ2NMvaaz4WDuk0JX5S5Hp0expgtruebt/sN/VALJdL7zCIJeAU18ppIiJBdqGTbWex3edO+5H/q/HxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB6657.namprd12.prod.outlook.com (2603:10b6:510:1fe::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Wed, 29 Oct
 2025 00:27:28 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 00:27:28 +0000
Date: Tue, 28 Oct 2025 21:27:26 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 Leon Romanovsky <leonro@nvidia.com>,
 Christian Koenig <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
Message-ID: <20251029002726.GA1092494@nvidia.com>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
X-ClientProxiedBy: BLAPR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:208:32d::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB6657:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c9c275b-35ba-4448-2505-08de1681f0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SR7dguIbE/5C/9AkzsHhTykK+Nh6fxNpGo24WiKh/n/xte1XevD5B+CiYyTn?=
 =?us-ascii?Q?dxdabWGjxa44rYnFjO62tqHHTnDUzRKnfqL/EPV01gZiG/hp4q6nCLtVaStu?=
 =?us-ascii?Q?rUxDv15pgIM0pfbMUF2d9z3EpfPTdz6wa0lhwgmVBmI74xBGr6UyDPDbbs96?=
 =?us-ascii?Q?1a+UJJuAI6aEijX0GcXP2vT3y10KzZ0NNPQQUqvnllfemdywNeCSs5MFo/1D?=
 =?us-ascii?Q?4nZzeCK+4As4DhW0hKpGdfW6maej3NRRXtzqoINWoDK8mZXD4FZ0SCHqd/k9?=
 =?us-ascii?Q?pYscMzkbUd528NxYB0q6R8n40A/6/4iz46q/TLhq2SDlpKce8MNkmNTr3AB+?=
 =?us-ascii?Q?arv7nRB1Re6ao0ftTBXQWBi2/Rrvvtjbx5CZpZDCJpGRCubvZrNzYlOiRPMG?=
 =?us-ascii?Q?pInuOnOCU/o0/+sB/P1G2XE2fZLgELL0l6nBXjAAX7zP7PHz+Na+z1hE+KHb?=
 =?us-ascii?Q?d2pGTYrwajzjxwD43lvEscyIE8m3vT3/NQwXLgDffFUJdZ/mQcNNrlTMVE7K?=
 =?us-ascii?Q?lixZ2e311sphyHvbV1EuSiofpLA8gsWtnl4watOEDgGx8oRHtwzQ1Ns6G+AQ?=
 =?us-ascii?Q?3l0EycfB9iadj9ACMwXCSvAUZtXuH5yXqhxjbRR486vmF35Qahw92oaC3gRl?=
 =?us-ascii?Q?vWtBrb5JQcoQVG5lYKPcIFG1J5keEX2Wi+P9oz9aJDoc8vJMcb4io0mvojB1?=
 =?us-ascii?Q?uAfaw3QS1FQXrthcvQswrVoywNXAQDny/mfjQ21z8Q+rYCB6FQg9YK4EGyDb?=
 =?us-ascii?Q?6OXo+3B7kaU2XpR/sxiKp+7V6SyM2G2E7JKck7pRA1FlGitc/UyvwD5/3hz7?=
 =?us-ascii?Q?La1FU30qfO3J2xYBYhnITbUsQMjgK8SQTh8oPpKS2DHqp1qI/RjotbB7e5XY?=
 =?us-ascii?Q?PshJzPZPbkV69IrOuHBXewWJ82QUCXBubgInPFjOI6U3VpYUvEh+nVhWjZEH?=
 =?us-ascii?Q?vIDzyD+W8cIoh3EGpKkYNJwmuQPc0OS3Zsb8f65eN8k1RQAQaQCTu9TTFNmB?=
 =?us-ascii?Q?vEVv5eOf/LNWm57iYgcfhToSvP5YTDAl47aSmw0vKCaotb1mqZba6d5kGkep?=
 =?us-ascii?Q?A0EC25RcRvIUbyhXQY5fjnskhM4HXdZvWksIS6fChMfYWfgbDGR9NuWLWC9A?=
 =?us-ascii?Q?oybwjGnqz4fjrPbmBa8zpeSRkYcTg16yUJRAL0C5mk/VueZZzv2BrPYdo65e?=
 =?us-ascii?Q?atDEb8kpczt7QvH6kwReg1o5/xzICbkSNdU9lKvXshX9wj2ZoqN80dCUk90+?=
 =?us-ascii?Q?fE5vUout2GhiAwnBbdv8HvzAAPI7X3oj1jmxZLMKTcsBXBOtuO1RZ7n6MbEN?=
 =?us-ascii?Q?1pG//vrvZ8AATGXDmC47pGCo8+E26lDYNY86JMzpjLQKOThWJdp8l+IOzj2u?=
 =?us-ascii?Q?T4O4ib0t49SKNpd51dEPlNZISg3ioLJpUI6o2Yj4I6HiBm1lnUc9Lg/2YDJJ?=
 =?us-ascii?Q?I6yvdmjYKEM5EP6j8Nt5TgJp6mdSD6Awvzy5Vf5jxCMTiP5K/i637g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LJiW14z0g1F4+O7xV63TbG/RhJCVj+d92R+RxR2WkDIlCzhJW7LsKfpMAbBF?=
 =?us-ascii?Q?oJFNelXM3oyI3mxbDcVf1qVFeuyyPZy+sz2SW54uYPpyWTjDGsDKGCFcn3B/?=
 =?us-ascii?Q?FGPffZn+vUB2zNfabKz2uM4c3Dpqybwt0ZeHlafZYLv6gduEh46qbvrIAeCJ?=
 =?us-ascii?Q?OU8GuT23A6vBgYEtu6N8SiUHPT999BRtn0gy5ZMLyjjk6o7V/0GFkBSd/L5W?=
 =?us-ascii?Q?VJTnM8CKjasB+KdQH74/juP/k95BjaoEpSDiRSm4PFJC87ITp/Bs1C/s5ykO?=
 =?us-ascii?Q?6lCLygOU+2wuNJBWvgOsTJ+FlH5/rOpVHgJIFvddAsS6aAsFSDj6FjynYq8O?=
 =?us-ascii?Q?AJA08dv6i0QVSYgbkHla3RLEl2V31zL63EZyWEsrTbZ5OY4MUyQyfMEC1OjE?=
 =?us-ascii?Q?2SgMNX7IMBgmbSjm6K+GD5fj70/dx2TV9DMR5UyZfxc+a2G7AQKEdfSZIXyr?=
 =?us-ascii?Q?k8QwHGsGv5mlOZQX+FnDMUPMR6lkjc2JkQK0ELcq6Q8HpUxQHXnqLKSnWy4I?=
 =?us-ascii?Q?GQ5O/ZAyedbB3fZlyhilH9J3CS89/S/tXtSnZKNqenXY9WrPh4Y/4N067b4Y?=
 =?us-ascii?Q?4mgH9flP+T0WKGsb4oG1BgDUshZ8aT4Y3LakSa0kkz1led1e9GXhG2nCVyfv?=
 =?us-ascii?Q?8jhWN7ci3BQL5hwMQIQop9so6T0pHnSi9mwTE5167e86X9T7tb8F7Lr2O3lB?=
 =?us-ascii?Q?IL49vthHC61pWVQhYc7QsoGXjGFqo3a4RL78oBUFbGabNgXToPP+68/dxC1+?=
 =?us-ascii?Q?VAvBz0pbPoRM/rzTlZts/VGXnWtC0WhfqoUbs8rHhlwA2+fDOY7YG7Oulc+F?=
 =?us-ascii?Q?Ap3e109DLizRL0SrTFG3ULfOPiM5ZsqwK66ehzvHBZjls/0A9WJJAdEBWrC0?=
 =?us-ascii?Q?9yXDjrNk5kSJpazK1kY7iIwCwuos2K4vT8cRyK2RsEnb53C7zVuaDC3scW2u?=
 =?us-ascii?Q?qsR/rDjE0XfK73vELwFjwsgqz04K9nm01Wo7jhNuCbkuZ/1L9flBO4JMAdt5?=
 =?us-ascii?Q?1HJ+m902hCLOQBZORmlLMHoOJ1F60GFs0gucIuCM3kQ6Bs3Ih9sJhEx1R7de?=
 =?us-ascii?Q?5I+c5Cyudo8gnfMzlK96B6IjzDsYl7NJrK6aVsbRW0e7vma2NmyC4ffWwOz7?=
 =?us-ascii?Q?2ZscvIBtAayF8lfTN4dWJrI5NrkcGyPtD3+F8tsV3cTMaKGhF0UAs+Akpuhi?=
 =?us-ascii?Q?A/jXSec1k/ynqasmgDYKpG91yXe+TmwehoNdaWCFN0X5xcu3cysjhyzZ80zZ?=
 =?us-ascii?Q?KS4f1sNnaMJMSl0nsOoQawR9y8MHWjuZUDJXY67o2J/RAvGInm81cwpXD8EX?=
 =?us-ascii?Q?ujoUHnYnQztMjVPohCiIeZRAJEZzpD17dkBiRqoNDyk8P4fYogGEue7AdXhd?=
 =?us-ascii?Q?aBM4vmGPF7Imy1xUgpSIjQjqFtfJlgP2Y2K6MU7ZETGoUW5I4ZuWelQlA6k7?=
 =?us-ascii?Q?Tit1Rr+o01y8fCuM4vWKK+C3+sezmLglkoCTdz1iucN6LJCHfVAV55TLfGLu?=
 =?us-ascii?Q?ffJJcJ2cXrCwz7v5cskznzQRfvPyt5FRZZI1pkSKxe+Kw4U53mtof81JHR7u?=
 =?us-ascii?Q?xIinAMpOXwgJ3URRAP4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c9c275b-35ba-4448-2505-08de1681f0c3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 00:27:28.2198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i/xBDGl51ckJVvVgm9Ju2h3dijS9stPkIuMIs3F2tSKXbEn/1VsAID+c6k/DCGPy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6657
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

On Sun, Oct 26, 2025 at 09:44:12PM -0700, Vivek Kasireddy wrote:
> In a typical dma-buf use case, a dmabuf exporter makes its buffer
> buffer available to an importer by mapping it using DMA APIs
> such as dma_map_sgtable() or dma_map_resource(). However, this
> is not desirable in some cases where the exporter and importer
> are directly connected via a physical or virtual link (or
> interconnect) and the importer can access the buffer without
> having it DMA mapped.

I think my explanation was not so clear, I spent a few hours and typed
in what I was thinking about here:

https://github.com/jgunthorpe/linux/commits/dmabuf_map_type

I didn't type in the last patch for iommufd side, hopefully it is
clear enough. Adding iov should follow the pattern of the "physical
address list" patch.

I think the use of EXPORT_SYMBOL_FOR_MODULES() to lock down the
physical addres list mapping type to iommufd is clever and I'm hoping
addresses Chrsitian's concerns about abuse.

Single GPU drivers can easilly declare their own mapping type for
their own private interconnect without needing to change the core
code.

This seems to be fairly straightforward and reasonably type safe..

What do you think?

Jason
