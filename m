Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77090BAD32F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C86E610E5E5;
	Tue, 30 Sep 2025 14:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lpGrvc3+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013006.outbound.protection.outlook.com
 [40.93.196.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA3510E5E5
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 14:34:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HUS0E9qByJJgu09puVh6qbCm++TXjkVVyNyVVzNz43JI5FpNEc6MWX/qnTirGVZSP9zg/ejciJ3KBPSqzpNMJx5dHSUcJg0w0+brolMBUCVZGBFLMykMWhLDTLqrnrm6kYjkH3CSGkXPh1cyd3kc9n60m8o443Fzlt1Jut+iR7fTzRMn9ia5MWjHP3Vis9RZzDgmZLu/gMOdHxdwIfz0dJ5OU4LCsIaG07t7KCM7MoqqqWBv0HcCBiU6baJsC1JZ4qY2tZqhTTPaIgWp1gZ6I7Px8bRDgodlK6bO+yH3cSzAXvXnWDatMBlZ0ci1kEPgqyhJQ1EhAOWlyed59/1t4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BWb85YI1VAI1u57e9BaSuKn7OX//onhqU/j1fE+iGeM=;
 b=A+EAhyD+O/+HkBRFsYTO68DLec9DLNSZObaUI6eFhvCT4VamfxMqFUVweF37yOjSYagbn1NJwSaK3TPTiVbD9z9EUvS6qXjXlM2aHrugOOpbouEgq2wFnDbu0tqp8CEEJM5pYiDMdZ28keiCtsqOAVBm0CwzehRwVmHqavuY4yckubRN89WPbu62OVnd/RzBaXEbYk4pdKSCtnykAfWfbRX83tF1it7W6wzRYRzEQZcdi1NJr25GdnCt3RwtS/1/NqYld6OvojabJMHYSJWrsa9aLov1CBzsENtK8BGeZ4V9laJib+VnCLyPxV6e1KfGJwTsnbCFAmDyY90zOFSt8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BWb85YI1VAI1u57e9BaSuKn7OX//onhqU/j1fE+iGeM=;
 b=lpGrvc3+bXWKdknypUgMPCr4E8wu8pALBeiQyMaUdKTIaNXe9GhLaEkPbUZ5anVNdQbo6UvY+ewOfTdRZmNWX3lwvnmhEQB56oc6MDUQWhI4HBw1eMhMJBR/nC6fOV3WdaKToUYAMz39jwopjmWTFdvC8BCf+L2LnmwR8Zn5WD0BaQq0E0F+A17xgKnOO/A7CJERQ4jXHNvkDRwdMW17KTZBRXIALzsmmT3oryrG9yG4ZKQEkcnY75J7oa2Uvth9Fj9Jvl+47mVNcoPGpbdkpO9OR5Ou53FI/bxBvdUl9HnLl82bFDkmXQhJm5X6jIS9C1o0rK6w8Wej7PeDpJiPKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by PH7PR12MB8425.namprd12.prod.outlook.com (2603:10b6:510:240::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:34:11 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 14:34:11 +0000
Date: Tue, 30 Sep 2025 11:34:08 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Shameer Kolothum <skolothumtho@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v4 10/10] vfio/pci: Add dma-buf export support for MMIO
 regions
Message-ID: <20250930143408.GI2942991@nvidia.com>
References: <cover.1759070796.git.leon@kernel.org>
 <53f3ea1947919a5e657b4f83e74ca53aa45814d4.1759070796.git.leon@kernel.org>
 <20250929151749.2007b192.alex.williamson@redhat.com>
 <20250930090048.GG324804@unreal>
 <CH3PR12MB754801DC65227CC39A3CB1F3AB1AA@CH3PR12MB7548.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CH3PR12MB754801DC65227CC39A3CB1F3AB1AA@CH3PR12MB7548.namprd12.prod.outlook.com>
X-ClientProxiedBy: BN0PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:408:141::25) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|PH7PR12MB8425:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abc86bf-36ec-4831-a421-08de002e6ba8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zk5++mRU27edAOeAL7UL+yNfoW6jFDjhMWcRzDoBxseHJGKdBHcdeq8r+sM2?=
 =?us-ascii?Q?EPp4MO5DSMLEi3+cythe/dhtKyob2vluNTgxX6+TBDEXepGiYJ3ggjEvNQBZ?=
 =?us-ascii?Q?58M9uegDlFxbR6zs0IfAMgVqT4d7bPbknEop7Yw1LQNvit663CgYSquKF76u?=
 =?us-ascii?Q?K++zGodYxKgb//TkNzayMAYru3iCxwlaGNJNCeWtQziiNJtCFvh0QaAFck/G?=
 =?us-ascii?Q?+ksakBqG3GsQjIPAuasCRU5+RWaLRPML4hvG8LsNeJdf7GLqc6n7J8SEqZF9?=
 =?us-ascii?Q?rwBA8ANzJBgUg/wdAXo88ZXVDb5R7i50DqDlHjFVU+QZP5gzvtL2InCihBFp?=
 =?us-ascii?Q?ks3muR1h0yfLaScny7yLSkveMj+CyD0zYeMjssGuBFkeA6NKcexWICJdoG+z?=
 =?us-ascii?Q?hc4/J/fcCY5qqhEVVGJT5Uxr2GuA0rWjUFPlDv5DJGHypklgL23m0uWyZcA9?=
 =?us-ascii?Q?rp+5kxSByjRS16imbuJ75PzRxo+SADjXClLW0vcWFSUfQ70LmvUcqzjVZnd2?=
 =?us-ascii?Q?1jTsU1AqLf1anNKsvt2YdEkALahgDBzh/RrJmYeiIrxrXazuYid8+u9w4+R/?=
 =?us-ascii?Q?zVnIJqZJFtq75C6HIKltfAG43/Whuf2nN0DF6EKUlMVdfwxrVAMEjdsiKjLP?=
 =?us-ascii?Q?MAK8zgf57HfuDL29QDZRrOtctOsu4lHQkLmyU6MrYgmLk1pAoutFe03xZJzK?=
 =?us-ascii?Q?cgSbJQeA49KoEA5EwNBKNMeh4d4dZsIbR+FUxgh5CodsvywpwINYyl0ycXbD?=
 =?us-ascii?Q?Mas2V+iXEXUyjb5aVQrSlhOiEctd9TZ+1D040xswi2q39r9eSYRxoL3mgPH6?=
 =?us-ascii?Q?EqBh6rE8ycBuu6VoEj8Yd2opuXYec0NehZPzXqp3c193nIbBr+rCq/26wbmc?=
 =?us-ascii?Q?yb8vRBQsSViAoXP6UWm8mpgwaFKHgZN0w4mGtImBO6AzkSUALvE/WRnR4dP+?=
 =?us-ascii?Q?EF6/FN/G2S9/db492yeEPDrZgoqoO/kzGAvYVqnL3UV+73vyfpgpDYCOqlYm?=
 =?us-ascii?Q?mq4nxqIWfdJw9z6oWCXJ4EEliiZWDNsdU+qrc57hdoxUrC1CjWhTo4PIOf/+?=
 =?us-ascii?Q?4LGJuTGSh+4Pq/Pmk3ggP5bv5kKBDUB/4EPZos3tDWeJpiPOv1Mn8az7i8+S?=
 =?us-ascii?Q?lpdfOi9yC6YDhf1c6+MFWzHbP5n2UxXt9bOs+WOTJGSNO1hIeFhQ7rRdVLFv?=
 =?us-ascii?Q?A6KNM7J6gBxMYJx7kFDpXZHVouCBBtl1bHoJyp+odsO1QVxVJO+PErJjdrFE?=
 =?us-ascii?Q?Oz9H8MAXiKY9Ql05L9ex3xpUamfTpczDFhq+cZBJeQuSj34dDoZmKar3oveg?=
 =?us-ascii?Q?VoY4z404gdnJkhK45CaZrMm0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJRHN8vE2WuQYNc6WJirOIQRQ5M3gyPrSil1VVJLK44jOYf6fAoMhcO8VFWo?=
 =?us-ascii?Q?vS4ncEdMq9rfS6jTy31HtJ/kr03ZoLQSNqVwPgXV4YWJf0T3NQr91koFCwnT?=
 =?us-ascii?Q?l6nzhYCOcCfA7kbG/8YCul9qr+KoVAdveG+bBkiz11jZ93QRC1djb4LqsMfw?=
 =?us-ascii?Q?4U2MP6ArnqiyxMrlmnclMRUYLHkKlTzgkQm60QjzoYCg2L6cs+o6fMIL/0Yf?=
 =?us-ascii?Q?ALc3d+DQjz1kU37xFSOE3NxHsUKBYs5lAiO642J+uMBAAcyKWbXxyfi6RXre?=
 =?us-ascii?Q?BHG/r2L2vkVIPVPAX++TkPSbsMEYnZgOkNXnVspFRG06kJ2cweNeivUPF/F6?=
 =?us-ascii?Q?CXS7HeWbJ5yMJPX4vtMIW5I4PxnXZSS4HYVmThulnVKBKpEqTkL/N4t6XehR?=
 =?us-ascii?Q?vNUpjl3tzHXdGOL8ysprtGje8vyzd04DFXdnxvwWLBvOnuH3x/SADKtdaqRY?=
 =?us-ascii?Q?c5Somy2qNQcCuZ3Z1Pw3ZFSlbrONpSKrpNSC+smVDpC+zL22PjFH77jhIGwY?=
 =?us-ascii?Q?pPYjW/1dh2lqKnBDtDrz+w/0pBiLQjyuZYNQkZEBLiq/6+Mk3U/dTb2+Kf2A?=
 =?us-ascii?Q?gdozRUEqhWSdGDPEYJbt7iry5J3PEZDNSEofC37WH9XZqsAHzmiRW9HsrMm0?=
 =?us-ascii?Q?FeR7D2oSk8KAH4bGQT/yXDhEEW2LESlT9UpODKOu63CBBGDQ9Za01wc9bJ9H?=
 =?us-ascii?Q?dKZCQ8rFW4Cieg0i1XoFrLX8cMMjo3UW8c9C1379ESHiSQ54Qups/tcMAgsm?=
 =?us-ascii?Q?fpGSUaZ6w1bH8XVLruLy7phGPWyYgWFrMf59YDx9o3gOaITkFX0e8loVjN8Y?=
 =?us-ascii?Q?ZJj92hnm5pmigdkSosrgRyTS7gHx1X79dy/weLUbIbx6BRunEsppbGFBNB1d?=
 =?us-ascii?Q?Xa7Z8vWq+K51od7rZLD5udhJkaxQNtJgqYbXLsGA8Fn9vB9W+FiQ8FpqilMu?=
 =?us-ascii?Q?yBd2OYH/mTF/e8TGdhvQbiD+B6kyx/N6PU2OY1XaWcavBuYIO4BZkiKICTX4?=
 =?us-ascii?Q?dH6YG3TofNXqbyaMpkXuHcJSO8W8YJQak7OBsD5HW1/1PGRU++ucAP3N2t3W?=
 =?us-ascii?Q?7fhVXAsUEnfxkzuYJfTlwOHgCvrSy81ws2YQ/6UfG9Y4VF45/T/k4OzSeLbf?=
 =?us-ascii?Q?ti9dG+EqNgSZD4NlT489Ri6/j+KQiT1qxzzLh8ozE9V4h3BGyro0sc83OyYK?=
 =?us-ascii?Q?7jxCXV5yN6ENmWsLclJpLVWSBoBudPyZNGNvEwxDWcQwa/oCmT7uAwfouV+y?=
 =?us-ascii?Q?0u6C5TIaP1X48Y7k+MwEhdhttZ0ZaTD/ItwNUrllUZrghymTIE2qnhhw2ffo?=
 =?us-ascii?Q?qdGGeEvnaFdQ/FqA6w7c2EoEvSjTwK+OTNbINzdNYhOg05o1ms/cGs0ET0G9?=
 =?us-ascii?Q?AQ8cIMpNKMJDnyW6QdMViOmJRv/FK93rkvwj9Yg3CXaZMfy7ANRgJj4o8bIL?=
 =?us-ascii?Q?k4+Y5MxkMXg6YUKa/kzNjNtr5/HFVgdn3wkQMQ0MgHcNya81navQJ7glK1rn?=
 =?us-ascii?Q?/kbg9sqlo3Vsz7ZSeYy5m1GAfgkQi4yEahTKIWCKmpsHPE65MnB9LsVJHBEv?=
 =?us-ascii?Q?cPpeQRT8+s44eW2MddIJH1igmTSp7SvFwOWj9vwB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abc86bf-36ec-4831-a421-08de002e6ba8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:34:11.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fD2nX+HNIxtPpBPldMJ+Uhjb+M9Ymg6B4Brli66rjds5EqfKQELgyMBIfmUlBatL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8425
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

On Tue, Sep 30, 2025 at 12:50:47PM +0000, Shameer Kolothum wrote:

> This is where hisi_acc reports a different BAR size as it tries to hide
> the migration control region from Guest access.

I think for now we should disable DMABUF for any PCI driver that
implements a VFIO_DEVICE_GET_REGION_INFO

For a while I've wanted to further reduce the use of the ioctl
multiplexer, so maybe this series:

https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op/

And then the dmabuf code can check if the ops are set to the generic
or not and disable itself automatically.

Otherwise perhaps route the dmabuf through an op and deliberately omit
it (with a comment!) from hisi, virtio, nvgrace.

We need to route it through an op anyhow as those three drivers will
probably eventually want to implement their own version.

Jason
