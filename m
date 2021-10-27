Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5212943CCC6
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E58389BF0;
	Wed, 27 Oct 2021 14:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4828689BF0
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 14:52:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRkdjb0Fgl0DvMbTa3P7kJ85NM/khZ7fXkN52BD2JcGXDAgeT5j7G5kH5odkmHHsW6o1P3w5tGmdWWsCMge70l3LuFTSObndtZnRHWtiLTjowKstsCwZNpzBeNJ5lRdsNIZcb5bCtBWDN8hOpBhIxFGxXteMF/LJEH2YwnjNh8udmxqwv/oFLh0N4m42M9nn+TGuJKj0dt3QOqVAW9zRQsMTtKeHhxg1/IQxfZyi9T4lWwVCAj25xOGTcZe3aT7eSC5lIZjsAhAIk0o9dVixcfYkGr8F6Oh15oXI/PoUNfEzW2FFYRoJoABJssz4qnwZ8K5RiHGpPMGBND6VKOZlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lr17/Xmkl+D9MgkydyAXVHwFxPKLQ6cFOiRjL+coaRs=;
 b=fOM5XGi3KmSRpjyOgfoFQOw2SN2uvQRvyVCjkGGNmESqt9YkhX8rcBJaO5rYUW+t3yt3FynnLp+AT925JAeybi1Zc/Tt2dyNQIK7aai2En9roaXXoUW3WKO56fXmdIAI7SwWQhm6BOZZse71d5ZK/7thxp2bDLwiXOUrB/PVaTU2/fVHwNPTKYOFGh/ho1aKioaxXYVgf6SbBEwJwf0QWbXJMxhzTlH7+MP2WE8VjA0ixWvvJ0sIGvO0JyTGFpDy2tqyTUocxQsdUBkruOAu4XVIxQn8pXtgApFy60igo8JX77wf//CCpGZEVBzX5HY5KmTd9FR3ung61IzYlTg1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr17/Xmkl+D9MgkydyAXVHwFxPKLQ6cFOiRjL+coaRs=;
 b=uIY30DrNAl9QAxegYf+zyDKwtkFRdtyAB61z0KlBOrlDBTD0HIQoSBZSBEYui4kJYiGeePE3Nu1fHSZEl9G8a7MQ+OlcaYU1BL+XPC0SjizJLHfq9jy8abJI4+i4iU+FaCA35vGb+j8WTuJAYq0gGa8v/1wDnX2UHiVIzmCLZfoWjrom5ewTG4rNiLAzcCUkJkLOYjRWZLFbcNZ4vu4oS0n04hwp935l8k6yIEQCjeu0Drh+HZCTortcBqSi3k5FHN4fonVnTKqUNs+x5ipJ5mfuNylK6MB6gYYfprLUsw4cb8J1gLuD7R35MkEw+7mgKeGRsAXfr1Sw3Wapk6oS8Q==
Authentication-Results: amazon.com; dkim=none (message not signed)
 header.d=none;amazon.com; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5540.namprd12.prod.outlook.com (2603:10b6:208:1cb::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 27 Oct
 2021 14:52:24 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::e8af:232:915e:2f95%8]) with mapi id 15.20.4649.015; Wed, 27 Oct 2021
 14:52:23 +0000
Date: Wed, 27 Oct 2021 11:52:21 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Gal Pressman <galpress@amazon.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Doug Ledford <dledford@redhat.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rdma@vger.kernel.org, Oded Gabbay <ogabbay@habana.ai>,
 Tomer Tayar <ttayar@habana.ai>, Yossi Leybovich <sleybo@amazon.com>,
 Alexander Matushevsky <matua@amazon.com>,
 Leon Romanovsky <leonro@nvidia.com>,
 Jianxin Xiong <jianxin.xiong@intel.com>, Firas Jahjah <firasj@amazon.com>
Subject: Re: [PATCH for-next 0/3] EFA dmabuf memory regions
Message-ID: <20211027145221.GA621785@nvidia.com>
References: <20211012120903.96933-1-galpress@amazon.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211012120903.96933-1-galpress@amazon.com>
X-ClientProxiedBy: CH2PR20CA0007.namprd20.prod.outlook.com
 (2603:10b6:610:58::17) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH2PR20CA0007.namprd20.prod.outlook.com (2603:10b6:610:58::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Wed, 27 Oct 2021 14:52:23 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mfkHt-002ble-Up; Wed, 27 Oct 2021 11:52:21 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0e7d51d-8f90-46d9-c9e8-08d999596266
X-MS-TrafficTypeDiagnostic: BL0PR12MB5540:
X-Microsoft-Antispam-PRVS: <BL0PR12MB554062B764798470E0D46C80C2859@BL0PR12MB5540.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tVviCsK2gJJbX+zX3RFPdz7isprmcKNyxXMYZKThIhmoZLz3Q5K5VD0wXMB3kEpYV8GmfsOVLSnwTWBms84krmfIiRA4tKb62X5SPIB+mMQ2HUVHkBV8gKwHhmbvHW8tsTSjZCw6uvxF2ERUZJ9FU7WbGcaXOajIOlZVWGV4y4g27da7wMy/eijpkpuy3yYE4FVQ0RqTyJGn67d5lMJWYTXptL4uZLeq1bKUTLEPri1dPJQnY/uv9r7+WITk4FeOqMrgtS3dmFA/xARjw7LOGulVB5PUC0N+fgC8EIovMmhISzCnbeHIXqIdw3e0HhximoLcaKEj8Zj8a/BzscvZqGCgsCKpOYyD2CyiiTfzwvu5Fon4fbwtONCQBmQ+Tr2IdXDe8OuNeMRKU+CBdqXFN8TI3hNa6DXseE2EHFsvmAyD5avpZmqJYzMWW4YAw0S8gj6s9UJelfFxteHUGMPj19gh0R+9EjeSi0Xq/EeImtWThSMEQVl8OdLIrBZXa6PbA3pxJH0DMHagQoUlzXyM1l1A1LmXlh+BcoSVHNoFTH/6l1kiqNMLocuO4BZESflazNTguR5aT+4Mh/utxC3Y7ZPuuiKlM647hrOTEU3TzFM04BA2qhcFpG6brZNr/5iSUdTTyg5eilqI/ZayMxi4wY6G7vX4k9nJlZxqAzihzbbtQ2YfgnO4DtP4FD1xmDb1ez1lmovxvs4yNNjvKnSWGCvpUdOeYaXE4ceByJDkXKoLXbpAUUZLpQJqkrxomn5Z5NwNVRVbJyzlMoa50NLmF+INGAm1hfjGe6GRnaq0pgMDbnTTdiX9NuYmAxZHDYeyhusxNArZKISfVAww+KBe+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(33656002)(66476007)(6916009)(9746002)(36756003)(66946007)(5660300002)(8676002)(8936002)(2616005)(426003)(26005)(186003)(38100700002)(316002)(83380400001)(1076003)(966005)(4326008)(2906002)(86362001)(7416002)(54906003)(9786002)(508600001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dggeUZbTBrnk3lTrbh2/ocnfCa+LDybP+FZnxNP5CD4HQDvPC1ZVmCm4N72p?=
 =?us-ascii?Q?C6Xh+YoTBIGhFWk0dSthrPCu3TVT6i8+NyWTXseg17GWKsxsh5+tj8aO99rC?=
 =?us-ascii?Q?MeOl/MmCyfygT3kdXREDGEeEkmPa510jwvguSjW3t99si7dAPnqLyUwuCQVy?=
 =?us-ascii?Q?tsxufz3mL1ph1E58IzJc2r7qZ44fT5AC6cxzRUQGk5KA01Ski2ROaFMV479O?=
 =?us-ascii?Q?oF74Eq3WvjVhlxmu8sBMxY7MdzKlSx8Ofw6XnUBaVSgfUiQb/BjeP6LsVQp2?=
 =?us-ascii?Q?V1umAqIcLpfPBknsrSo9vgTaTP23oBiR/omj29eGHekvKHG4eXXCSkRjdVQV?=
 =?us-ascii?Q?z17dWuG0IRSW0KNSQo92JZ9IyDCEea5iWqOKdK21oC+a/9H8JmxcM3foafm9?=
 =?us-ascii?Q?Dt0+6DABJhRoU7u5hazOmKcFIFvFXMmrvc1ml/kgfWQNbziX3pgEtMJveb6C?=
 =?us-ascii?Q?A/zOWdLO2HTt8vstZ48Ewko8CAOBTML8tD9HZehgNadszF5/T/Db/ZPXqjTK?=
 =?us-ascii?Q?I5CR1mPvtJ6kdD98ZrSoScu9Hh9GuNt+Q9KaB9NCYeLHsgwPmbnc0l0x8KVZ?=
 =?us-ascii?Q?oKhZo39r0K7MQbI9P9RnwwzJ0rg/uYFXPeCvZ3bFAysAipWvtS9Jl3KYq29A?=
 =?us-ascii?Q?JEhPuglvLgy/efwY9THmcB3Nso0KrpZBhs4CtNvbLLHt91VjLQnBPmlC3vnp?=
 =?us-ascii?Q?hD98Nl7aouqC7LZjHC8I/hbKVtX+O/kYrQyIn75nwTrXm4ng5NFC2Ujwxy8k?=
 =?us-ascii?Q?PAbQQjxAXeJWzEroT7esmqmanqAL8z/Q6ZvRxAX97FpdaPEJhOGee28oF+h8?=
 =?us-ascii?Q?u8YGoeN8bWDPzwuyZV2865CtHcRX17qejdWYXoGi3T06aWk6e3/0IeZcq0OG?=
 =?us-ascii?Q?on8uwn0kowfbEte3LniI8qPnaDKm+1s2MI0QCcdIHp5U8W4DN0/99iUziMio?=
 =?us-ascii?Q?CWMkNvlVA8i+pEh7JK/w/pTiZs61UxCgOF76VmRebpbSFd96ukA/+E6q6dex?=
 =?us-ascii?Q?4d8RPrpnEnQTaqjdWZKtKuNTpxdCNK0zVo9M+ALcOOvk8gSWXduHpQSKxRhR?=
 =?us-ascii?Q?ilFZPj3QhrMMzFlURP5Mu91NbfP+vdv4xww/bFKvp0yFWs8/jgYqsAbcv8lh?=
 =?us-ascii?Q?F6d1E0fE80EclILOmG65UaA9BdgpdkVIBwSdINJHetY5GuYU01WA4wVA4CA9?=
 =?us-ascii?Q?xhnCSvRVH9AbUIPrnJ5fcW/63YrTpPWedJTHsAXoLXgAjQGV7JxQy4udqaIE?=
 =?us-ascii?Q?CSPMLS6fp3e+pJdLeCwWRHYGng0xfkSXiG92Ia8XXFE9iEliEi+jcNTkn2Ar?=
 =?us-ascii?Q?kbFew969BpAJpmn+0HV973N1MyyWkYylBCJ2j3nlTDmRpiBGmWZ7K6tge7k+?=
 =?us-ascii?Q?8iTU9VdpJTp4yji422faFFnkTrzoQM9fg5+ay/kKsjQYQOLjUsmADuA+7Rbl?=
 =?us-ascii?Q?BW/soODG446h8Lg8Zbw8Hb1e/gg1Sc9OPNvjXQ5BwzWH+0+HbdmXWbSIwxAg?=
 =?us-ascii?Q?C+U0zP5BVUrfwSeeyhivGSVO4TzqaEB5gsaAme9NfFcQUrOkYjfrffvTDlt2?=
 =?us-ascii?Q?9XW931lLny0M5SECzto=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0e7d51d-8f90-46d9-c9e8-08d999596266
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:52:23.8448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EYnl2Eu9LAc0QfcnP0GlD8oTTpSMll+xXtTx/1yvgq70WGvW8DQ/nYsRtLkILFLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5540
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

On Tue, Oct 12, 2021 at 03:09:00PM +0300, Gal Pressman wrote:
> Hey all,
> 
> This is a followup to my previous RFCs [1][2], which now adds a new api
> to the RDMA subsystem that allows drivers to get a pinned dmabuf memory
> region without requiring an implementation of the move_notify callback.
> The new api makes use of the dynamic attachment api implemented in the
> RDMA subsystem, but calls dma_buf_pin() in order to make sure that the
> callback will not be called, as suggested by Christian.
> 
> As explained in the previous RFC, move_notify requires the RDMA device
> to support on-demand-paging (ODP) which is not common on most devices
> (only supported by mlx5).
> 
> While the dynamic requirement makes sense for certain GPUs, some devices
> (such as habanalabs) have device memory that is always "pinned" and do
> not need/use the move_notify operation.
> 
> Patch #1 changes the dmabuf documentation to make it clear that pinning
> does not necessarily mean the memory must be moved to system memory, it
> is up to the exporter to decide.
> Patch #2 adds the RDMA api that allows drivers to get pinned dmabuf
> memory regions.
> Patch #3 adds the EFA implementation of the dmabuf importer.
> 
> The motivation of this submission is to use habanalabs as the dmabuf
> exporter, and EFA as the importer to allow for peer2peer access through
> libibverbs.
> 
> [1] https://lore.kernel.org/linux-rdma/20210818074352.29950-1-galpress@amazon.com/
> [2] https://lore.kernel.org/linux-rdma/20211007104301.76693-1-galpress@amazon.com/
> 
> Thanks
> 
> Gal Pressman (3):
>   dma-buf: Fix pin callback comment
>   RDMA/umem: Allow pinned dmabuf umem usage
>   RDMA/efa: Add support for dmabuf memory regions

Applied to for-next, thanks

Jason
