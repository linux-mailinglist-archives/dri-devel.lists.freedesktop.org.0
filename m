Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A19BBE99
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 21:10:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E494E10E4BC;
	Mon,  4 Nov 2024 20:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AkSAEiXq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 709C210E4BC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 20:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJj4luLHSG5q2M+6Ve3J8al1wiUDrntv24hASx30BZ7Ip+oc7bZE4jsflqgs/BbSRd8tU1RsBm9N0WZ4Yk2SmNnPWMhgxiWHFSZNN/I7tMwviscJCmP7FvuzqJ+F8PGuwZe/I5h83cwKj0R4Q/5zfW6Z9ryg0qVFmJCWrBFoCsVxD8R+NAIQr7U55Rjo0Ci+0kigLl7Gmsgv8UZeb8O7S9TU7Tj85uyJLo4HddKOIxmZXC6GTw/VLDrgsUqbFmeGlSBb7p6jV8M3Ai/NBGA/cPRUqVywqXKLltFzHRp1wGPaeR44cmzew+rZjfxmuwOvsC7V17Fsd21nKCZidPClEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kPLWgQ2yDRzMkV6OcgVMVP0RLZWjivp2NnMBne+OR54=;
 b=cvRxPfpB/XIMX0oyn+z8uhfWUuZXL9hYhj66c5/tsewEY5N8Qb6mIBmzTVjyIjd6/Q+ydFYIHqprzA+TdqpJEENHKB9zddi+bjWZ2qR0xKhteBpPwbO0wt1gcAc8ETE++FGDrBEEWkzeIWyWYTVw/dDY9mvNXgSdbGhVRg6FNegcUV99vhhh67eHim9/lgsfkJUn/bNla8C1tLJOZILM4bJLP8CquvyTTYJy2mkCNpWC5J2kMlfT3YhKP/TETXzCJYOuzlMFIat/+EeG6r8UPNdUlGO66h8lqjl8a5cAeUDr0tf4c2YHR0MrLxHhkjTlga0NBRxDCXkhQMIHaLOrqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kPLWgQ2yDRzMkV6OcgVMVP0RLZWjivp2NnMBne+OR54=;
 b=AkSAEiXqJWJq+BDVqlJUj6qB7rbrEhq/dx/wtnnoeOfI5SNzTcLCoGdu3lQ68i3ZwGgx7kb7sHhzAHxLp0MOPoCIptRDITKiCD98bVIsWE+EDMGQQJGBw5edOvb6oA5TjXkHvSQMadwEVRfEkIsdPoaybwmyXPYLjmSwr7qi6xusmgugfvQh/32ALxG+jfiEpuea1zpjZrHnai2l5Wmbel56LqY7EaYwEnSsxgFHjSKVzR5i2UDwORVpw89977Hz1mjbDz3nexb+e7KIV4w/cKKm6qXKg+a3+W+XhZEgiGxItB4FUXtP5gOjLhUU+94WVQyaI7u6TtcFc3nJETW3BA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 20:09:53 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8114.015; Mon, 4 Nov 2024
 20:09:52 +0000
Date: Mon, 4 Nov 2024 16:09:51 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 patches@lists.linux.dev, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 2/3] iommu/io-pgtable-arm-v7s: Remove split on unmap
 behavior
Message-ID: <20241104200951.GE10193@nvidia.com>
References: <2-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cf17dc41-f72a-4d90-a78d-2d90fa0ac243@arm.com>
X-ClientProxiedBy: BL1PR13CA0440.namprd13.prod.outlook.com
 (2603:10b6:208:2c3::25) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: eca2d32c-a0ec-425f-543c-08dcfd0ca4b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Akl7Qp7VQI8Sdlogde5qkZ2j13Y5vKVi4Jez5AWTjYwuFL5TKbH695dz9Fhb?=
 =?us-ascii?Q?1GPod08c750Fe6tsTwcUPZobfOy5dDiwVUlHl6WqmVuwFOVyT7q4UVan3S3T?=
 =?us-ascii?Q?JH6KoyYtgkRoR5c/hrqVPYyQAQ+j3Jd/4hoVRbtwOslzFWda3L/2yytKa+DZ?=
 =?us-ascii?Q?3nbySuj7CKCeUPuN4lFdl0HbMXhnutd6bI/rGV7GVk7llEhj2kAWypa0RB20?=
 =?us-ascii?Q?vCnZC8U4K9ySEKWtjcIW++ACEtuNGY7hDoqRi00nR9CA7/d/4RRY1TLGbZjF?=
 =?us-ascii?Q?j390aUww2pg1AdmcwwYhAYLrhpIqfaLaQQlKDF9ejz+NqND9oSvO0wxeUOlI?=
 =?us-ascii?Q?kZWkYwKMQAKYyP7ChtbxGfwAJ3r2JZO7WNXYYu/TlLGJs7mQNxAcouOsVib4?=
 =?us-ascii?Q?qBwgOFhgYVJc4YSCCxk5Wqj5VKFPl4rlA12UC4TlWdW2KT0l56dHRkVhU/OX?=
 =?us-ascii?Q?CUS+kVqa3+5TUU1xijvbG42sju2cfW8fkK+Kr4lYoQp4vx5Ih8XoVz/xiUuG?=
 =?us-ascii?Q?Cv0CxMGoEJSNFnOS9+UG2anY0pxCDphkOlXqB72Za+R5+vQFC5fJSsNX8EV8?=
 =?us-ascii?Q?oMcAVB6NlkU3HrZjwGcPK4SFSKVfHxWs6x9TgF5v3ah216h/k/ZFwQ44grb8?=
 =?us-ascii?Q?yXIwyGl3p5VESAx7g8J8LSzn4n2AtN+tCdYWZh6CHdOC0iaceVNKT6QlV4mY?=
 =?us-ascii?Q?lFE/fdXHliGPBvb/bpVQYlc/l++tYrgyB1pEdPRfwvhTDuIHBhl3VQV0rmHl?=
 =?us-ascii?Q?+MoXfFsyfZ1JjkKjaQ2v9IDEBtQvaMtL16gkXWo8B4YGi0HfaBkgcYKozyyo?=
 =?us-ascii?Q?SQ7TYh/P7cA4TQrrgB8s4lycYLuImgsAi/jVD5Rro9Tg76snj4Viwvp8RyKd?=
 =?us-ascii?Q?vVMt8wFflhljSDRSd+ZFW7NgoHz0WJVzcLZRjyfMvZ22SiQWXIncUbhorjN2?=
 =?us-ascii?Q?68UsKIa7pZtIgtjgIXNCNQOGeAIwUlt3DGx0sgtmmeJEjoGL86pfJU7vCVHl?=
 =?us-ascii?Q?UVKfx7YmQe/CPDvqsbf4o4HCixjmDVXFFb5OMMj98mY4ReS76E6FNN1UgK8B?=
 =?us-ascii?Q?m8U7x6Wv9d6Uk2nV2gvpMUK3sK/yo647Ufw5HkUGtOoCKRMAOc7QXwTRX/Uc?=
 =?us-ascii?Q?9s7wbnKPubTrFlDW0q8uVczNqqDsurmdYS9PhfOaF5yvouzhpxvfHFTJ3FM4?=
 =?us-ascii?Q?3zw8iis7Bdh1TyeQZXph2VcVIP/CXhNmM2Zbyqyg+T+NrqUYSjFqqpy9xgDR?=
 =?us-ascii?Q?BxIjEy4IvivcBQTfbzjmLkLp0y8OK/8dXdSlZqxevXzO0Xmcxku7eow6Jzla?=
 =?us-ascii?Q?EeKr2uAErwBEVxPh2DCfk8/n?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BQ1YSiScQn6k2AKS7LhGX/LG+X5fT5aq4sHMod9BHDnnYE+Xk7/AnHLzfczP?=
 =?us-ascii?Q?4Xgy7RRtHMYnlBM+GSHLNmLWCyhYf3q/u0ExoX+q1en1tgce4iEWlLEv/Em+?=
 =?us-ascii?Q?acvT+8LDcjKvHPcXzyITU7wj7k1xesBMb6js+HWwv1G6Z35fxYzbAxb1R3OR?=
 =?us-ascii?Q?CCgr1lvK0pu5t/yW4vWNpPG3UUABAd9FQlG11HLvjgRhxwc6Lqfg+X8lTIqc?=
 =?us-ascii?Q?XFW+JOvOUDTqGn04BCcZ9PciXQXBQvm61Szv3LLDAvAD/fWbZ7aYGwkRQLhq?=
 =?us-ascii?Q?qWt+6uLNKvppQLEpH9AANPNlfTrls1MhnEAvcnknyW8dNkOwFryun/cgUQ6m?=
 =?us-ascii?Q?c1ntcqHCcxGtAtJNk0Pa8W5nRruyzfoas9d6RGbStuTO5qc4h2xQbISYfUyz?=
 =?us-ascii?Q?N8DyilJauc+0KL90bm2iq9m9vU4Sf60zHd5VxDvfAU+ohIkKbxDj/JQLF6Q+?=
 =?us-ascii?Q?djL4HjCfh51tS4URXNPeMbhc9DssrnJWLbzgp6wQ0UBvxJQoi38MWg75JIWM?=
 =?us-ascii?Q?2Ey90cNFaYTkQ/vs/adUc58muU6UA5vj2izFLI/narP6K+6DK/TemEzIN/TU?=
 =?us-ascii?Q?PkdHUJaX9FnGq0IxAS1+ioKlkkJhAYFyxQixIoQX32NZBqGu+H5zJG17P79I?=
 =?us-ascii?Q?bJz8skia7kVZh9xvDChrlSyULFYCuw0Sr1IO03q37vpCvH6lFdsjGk8AKNbf?=
 =?us-ascii?Q?YZolwm2t87smelGxeiixWSWzGQbJLIMqfmV4WfMpQwuE3ZzlHBR21RleUs7a?=
 =?us-ascii?Q?9dzex/SFfFi3VMEzaxRRAbVVgCcpQjhtKNX1A3N+7gyBqs0WG3iyUVPfrMMT?=
 =?us-ascii?Q?xSOFaK+Qbrn/kjWBnlcSbt5SaKno3oil+gV9AQnge9MJ48UFneUoEG7tZuK5?=
 =?us-ascii?Q?jJZTVaWh9+JADpDqhqMpjlQpeW7mjxxpl2/SuFmxpoNNgB7DPifuIny7laO3?=
 =?us-ascii?Q?GJy1JwBABaMSXvARBH2rjNrVkh13Gg6OoEVfCCxq3MTWZ2uWGhwNvM8l/iyQ?=
 =?us-ascii?Q?CjRG7pYs9xPhVAj0fAAI6TaFN9PPJwka4TMYqs/S5tYTTLFcH7xXkJyH71tk?=
 =?us-ascii?Q?F/jIRrRYcPxCnPqFqz6aMdNuyRVNWF4AA8R+ICqavwlk5xX+D2JFto+PpuEZ?=
 =?us-ascii?Q?GNk+KykHmLGKCZoG4THXukMGnJzTlt8AVmrJjPkzyRiyRnx6Tmh284NS5/q8?=
 =?us-ascii?Q?l5JiQoJ6FTbTSSRz4LgAXRVe1E4jPZaLdCJFXjSb4+WIX0bAIO11eMUwaJvF?=
 =?us-ascii?Q?zSNc1j3MeWReSlQvKwyAzMyu42vxiT+i1OsdmxehDsR3u0EP0AaF1Ev9xEcV?=
 =?us-ascii?Q?jeh/MWs3xrbk60YSQPyWimr9xTeQVMvTXhDq4hyO01eIGRi/5lwqNyxDLFUJ?=
 =?us-ascii?Q?y9/+rPmJd/6w4u6AVEfo8ZPl/zAUdqtgUCwAD13+05If0Qr9QoXTrTpQEim4?=
 =?us-ascii?Q?fhWeIOpdyFTjtE/L6A+nFRvEPqrmHZ72SN1fxmMhiOBOS0FKgAi6K0gtL3jD?=
 =?us-ascii?Q?2if8d65ZN3g0aPpfYFgC8MtYuAIPphwjeFrR3GhWPyxoGangaTBipxX7OldJ?=
 =?us-ascii?Q?pQQ6AmkdX7vBLZWx3Ds=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca2d32c-a0ec-425f-543c-08dcfd0ca4b8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 20:09:52.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtL5rPJZt7n4NBK0pAhz4iB9d+eqUD4ElapXaUgjs+77HYmrws+jT+qlaIDGAZt+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524
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

On Mon, Nov 04, 2024 at 07:53:46PM +0000, Robin Murphy wrote:
> On 2024-11-04 5:41 pm, Jason Gunthorpe wrote:
> > A minority of page table implementations (arm_lpae, armv7) are unique in
> > how they handle partial unmap of large IOPTEs.
> > 
> > Other implementations will unmap the large IOPTE and return it's
> > length. For example if a 2M IOPTE is present and the first 4K is requested
> > to be unmapped then unmap will remove the whole 2M and report 2M as the
> > result.
> > 
> > armv7 instead will break up contiguous entries and replace an entry with a
> > whole table so it can unmap the requested 4k.
> > 
> > This seems copied from the arm_lpae implementation, which was analyzed
> > here:
> > 
> >   https://lore.kernel.org/all/20241024134411.GA6956@nvidia.com/
> > 
> > Bring consistency to the implementations and remove this unused
> > functionality.
> > 
> > There are no uses outside iommu, this effects the ARM_V7S drivers
> > msm_iommu, mtk_iommu, and arm-smmmu.
> > 
> > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >   drivers/iommu/io-pgtable-arm-v7s.c | 125 +----------------------------
> >   1 file changed, 4 insertions(+), 121 deletions(-)
> 
> Yikes, I'd forgotten quite how much horribleness was devoted to this,
> despite it being the "simpler" non-recursive one...

Yes, it is the contiguous page support that makes it so complex..

> However, there are also "partial unmap" cases in both sets of selftests, so
> I think there's still a bit more to remove yet :)

Sneaky, I got it thanks

Runs OK now:

arm-v7s io-pgtable: self test ok
arm-lpae io-pgtable: selftest: pgsize_bitmap 0x40201000, IAS 32

Jason

--- a/drivers/iommu/io-pgtable-arm-v7s.c
+++ b/drivers/iommu/io-pgtable-arm-v7s.c
@@ -819,7 +819,7 @@ static int __init arm_v7s_do_selftests(void)
 		.quirks = IO_PGTABLE_QUIRK_ARM_NS,
 		.pgsize_bitmap = SZ_4K | SZ_64K | SZ_1M | SZ_16M,
 	};
-	unsigned int iova, size, iova_start;
+	unsigned int iova, size;
 	unsigned int i, loopnr = 0;
 	size_t mapped;
 
@@ -871,25 +871,6 @@ static int __init arm_v7s_do_selftests(void)
 		loopnr++;
 	}
 
-	/* Partial unmap */
-	i = 1;
-	size = 1UL << __ffs(cfg.pgsize_bitmap);
-	while (i < loopnr) {
-		iova_start = i * SZ_16M;
-		if (ops->unmap_pages(ops, iova_start + size, size, 1, NULL) != size)
-			return __FAIL(ops);
-
-		/* Remap of partial unmap */
-		if (ops->map_pages(ops, iova_start + size, size, size, 1,
-				   IOMMU_READ, GFP_KERNEL, &mapped))
-			return __FAIL(ops);
-
-		if (ops->iova_to_phys(ops, iova_start + size + 42)
-		    != (size + 42))
-			return __FAIL(ops);
-		i++;
-	}
-
 	/* Full unmap */
 	iova = 0;
 	for_each_set_bit(i, &cfg.pgsize_bitmap, BITS_PER_LONG) {
