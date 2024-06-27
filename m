Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270BF91A011
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 09:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D3F310EA2E;
	Thu, 27 Jun 2024 07:11:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R6tU1xUC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1266C10EA2E
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2024 07:11:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hgq0IKieOE1edTdbVmg0dj0EPDAceEIKP+W1LXFqmQaCCLlrLEbh3qqWXO5O9swu+fQ6I/hbgcw4qfpoVE//UX1utseqX3G+c5Uj+PobFW/eoN9lB85KjMy9MXwZHNgPDI9AK7NkfFqcCm8c9K6HMs9X8KXQwHR267mwOoxhyjepY/lWwF3Pwlh/2ZSGwCQnBoe3XEPnQmDnIDvSwIedgVmmkb+QFDVgZkCCQJkbJeAf1AMbZ77g74T43KK0xMQArLKSZXewHQKQRaMbixKnXCIiE2+bOGU2RVxE0RDDAqCsGS3FnAjnzyquXrVa2nfxqcFhu0M+zbzefoJJjIloxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CztptI/xkJ2TaoI86f5/LNk2GFu0OQecBsT3kIhtUws=;
 b=ULS9ugtDHNOxJN5abCcd34t+947yoBj8c5Xv3U71bPOCjZIxbWTW6m/0MRKUgfN/XxMbdxfd4EBsOQx8z5lJ1VZOMuWxPi2X0zz4sBw2IiuMDZtWHk8VYKdeoto8Q4MjexVhXuVNFQYauCmzVidNQ2l9/w8wCbnwFX31oiA1FMylBpe6A7jhXYsXttrF1D5ZNFgSHI0Cg9+MGd8VhqXPNUr0+pVBqzSCggXkhL832A6vrykww2WTS2SDK859JaS2LLib7i7zByHCDPjia7sGfs6gKryjYzRPswQAomi9lMOTm1YDfZ4uPQn1hubIW+rE8/1La0QVtL2z+nXyBhEsMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CztptI/xkJ2TaoI86f5/LNk2GFu0OQecBsT3kIhtUws=;
 b=R6tU1xUCmreqvJm3GIdJ6iMmsu5gTy3emrFP4lwOLzRJ6KPLOeTdN5MvIqKQeaFhShUoSRNcqzPxi9xuUi7URTMeIPzf17h8pewAsg+B2TyqScupbWEH3PX+1lQp27tff+QhJeX+Px4L1wjm71AJL1t7IcdWDBeXTHu08deaaBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS7PR12MB6048.namprd12.prod.outlook.com (2603:10b6:8:9f::5) by
 SJ2PR12MB8719.namprd12.prod.outlook.com (2603:10b6:a03:543::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.34; Thu, 27 Jun 2024 07:11:03 +0000
Received: from DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5]) by DS7PR12MB6048.namprd12.prod.outlook.com
 ([fe80::6318:26e5:357a:74a5%7]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 07:11:03 +0000
Message-ID: <00722289-a327-4522-9a85-2f6ee5b4df95@amd.com>
Date: Thu, 27 Jun 2024 12:40:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/21] iommu: Add iommu_paging_domain_alloc() interface
To: Lu Baolu <baolu.lu@linux.intel.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: Yi Liu <yi.l.liu@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kalle Valo <kvalo@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Alex Williamson <alex.williamson@redhat.com>, mst@redhat.com,
 Jason Wang <jasowang@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, iommu@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240610085555.88197-1-baolu.lu@linux.intel.com>
 <20240610085555.88197-2-baolu.lu@linux.intel.com>
Content-Language: en-US
From: Vasant Hegde <vasant.hegde@amd.com>
In-Reply-To: <20240610085555.88197-2-baolu.lu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0166.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::36) To DS7PR12MB6048.namprd12.prod.outlook.com
 (2603:10b6:8:9f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB6048:EE_|SJ2PR12MB8719:EE_
X-MS-Office365-Filtering-Correlation-Id: 3926dbe8-9cb9-425a-ceb6-08dc96784e25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjB1SW9yNkdYQ1M0QmFXZEVDemZZbXBFVTVxUjVrajQyZXBEdW5XdE5ZeFhW?=
 =?utf-8?B?Wlc0ZER1WkRXRi9BRGhCSGJkeG5LK1l4RHJyWXFVbnpYUlcxeGdXZFdrYzZn?=
 =?utf-8?B?dWpzcVVoUUdPektJQURZOVpTZUxEMFFzc1MxZjNTVW1UZDZSVk9acU5TNFU5?=
 =?utf-8?B?eDdVOGFoazZhU2c3V2tlckxMazRWRHNxcjlteTc5YW96YnBSVUhqdXF2dHhK?=
 =?utf-8?B?UlRoYXk3Tm16VEJuek5RTUtRUTcvdk42bStPU2h1cVNKamN5VnJGT2cyUGg0?=
 =?utf-8?B?YllrOUpKdy9Na3lwVk5tR0lMQUhNTWsrV3REbkM1MUpCVlVRUUVDaXFGQlhL?=
 =?utf-8?B?R0xMNlNQUTdVaFo5SnpuNm02cGNUaSt1dTFIYU5wU0lFWVlSTzRxbmdyY2pl?=
 =?utf-8?B?bjk5R1lFSkUrL2xsc1VpYi9kZkRHejlPRWpiTFl0bkZsRzJoYmxFVkRKR0Mr?=
 =?utf-8?B?QVpRUlcyd0FqdTAzMjV3Y2FVWmhoZVR2eEdnQkxONVNxVE9vNWtaU0NsOUhS?=
 =?utf-8?B?NEMya05NUDd1djYvWHNtT1ZBTEZzMkl6dUtjR1kwOFo0WDF2NVFQc0Z5eEli?=
 =?utf-8?B?R3BUQ245ZEh0My85QkN5VGozakhYc3ZJcE1URmVVSnRtVFFPT0x5UldROWND?=
 =?utf-8?B?Vjg5Y0QvVGtlTzlSN2tIOHBnYmk1K2hpcFhocnpkV004WnNIRkxHUy9QZGFT?=
 =?utf-8?B?bzhZNTNiekUrOXhSZE5tZW9Ga1ViRmpQVXRrMVB6SGplMkd6bmFIOVBNdUhj?=
 =?utf-8?B?c3JIK2J5K213Y09PTWM2dUJvMzc0VVdIS21PMy9HS3RKb1lFQm5BZ3loWFMx?=
 =?utf-8?B?N1ZmYTNsc2RmT1I3Z2VHM1RkNzI5TU9kR1RIWVU5TUk4dG15QVlJRHpZOUdU?=
 =?utf-8?B?UlhWNE1IZXpaM3VRaUFvbjlJWXVCVTFBbGdRc2ZTdEwzYUpyTDZaSUpVOVEy?=
 =?utf-8?B?YzVhL0hoZWVYZmNoS1lUcjgwcm9uNWVTQ0FvTGdCQWhPUVFRRTZHaVJxTmRk?=
 =?utf-8?B?MFl1Wkd1VlNJYW01TEh0aWNHWnQyS1IxUGVYVHVLQUJkaXpNanBTbjN3akZ5?=
 =?utf-8?B?c3FhNnZTbExhQ3ZRcXVTV2paOVczWkZ0NlhYYkxWSUVMREhMZWIwTDJhYlFD?=
 =?utf-8?B?cGN0R1dMSHpXcnJIem1qR2paMmh5RjdlZFFpeDlremtzQThDcXk5UEMycGlm?=
 =?utf-8?B?SytiYTNINnhXTGZoZHBycVZrRkFQNk5IK1JvQUZ0VExXa0thOHp2VjBrTi8z?=
 =?utf-8?B?ajdtNjRmRFVJeFFvMkE2MmVUWURsYmpLYzV0OW9oRGNvMVBOUm00QUdIb3Bz?=
 =?utf-8?B?VWZ1eGhzYk1uZmJtLzN1ei94bXlsK2RHa2JFWmwycFRBNmk4Y1VLVlVyL1lK?=
 =?utf-8?B?aDZIaGFZY2lGSFRGRnFnVDhhbkpFa0ZIMzAxcWQ1OGE0VUtMbDM5RUNPUkhG?=
 =?utf-8?B?UlM3SGMvaWNhQmU4ZFpsV0l4R0xwN0MydWR6UW5UaW9Oc1Noa0duRC9LV0p6?=
 =?utf-8?B?dzN6dmd0WTBPVTE5V0VBbWl6c3pwajlqVTcyMWlJbll2ZTFYcmpFcjd0RlpF?=
 =?utf-8?B?Y0lHbGRPZHlwdlIram83UEdzSkt2MDJZbUNOd05semJDSTFha2FRSUVhalp2?=
 =?utf-8?B?cmV3SGVpMk9nR2J5Q3VDeFg3WnFNMWp2a3BzSnJ4Z0kwZXlWdlZaK3VJYU5n?=
 =?utf-8?B?YkFIQzdBbGt4dU8zT0RGNUllZERwaTVrelZpalM3RjM4Qk4zOURHcFhIanRH?=
 =?utf-8?B?K1BDckZJQ3NIMlppTVE0MXZoVmVVOFB6Vm01MFJEOWhzYnRzeFFjeXNjajVx?=
 =?utf-8?B?T05JM1hHckVtOFdnT1hvdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB6048.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFFFWFNkWWJ3cEFWQ0RvRVVGc0ZkekxVQTEzUE1LdFAwSWh6aExCamlVWjA0?=
 =?utf-8?B?eE8wRXkySWNnV3BwQi8rMzlqV2xYTEZwMlVjZHpmTU8xUHFwMDVuek5KSFp5?=
 =?utf-8?B?VUpVR1RZVndtOGk1L25uNDlVVzBYVFY0aW5GR0gvNTFSNkZMM3BEUUczbjQ2?=
 =?utf-8?B?d2FMSXVxZ3k5Q0VIUjNoQ0ptd201UVA5NnVGZHFOcnNhblhnd2RiTTNSNm5J?=
 =?utf-8?B?OE1IdGt1LysyOHk2SUd2aURabzNVcGh5SWgzK21Nak43SkFWK1RPWE1tN1ZU?=
 =?utf-8?B?aTA1dHB1RklsZWdrNEUwTzU2TEdkajZHdTJrUTU4U0J1bVNoS2ZlcVZzZi9r?=
 =?utf-8?B?QzJaZ1hLOXRpWGFtSi9wNW5tYXBYc3hmTXRTRGVwV0daMCtSRFZ3QnBsR2dZ?=
 =?utf-8?B?UGpHanphWWpOS0J0UUd6QkJ4d3RyNkRIaDRvMGRzSHM2ZExqN3UybjVwbGZZ?=
 =?utf-8?B?bTI2SWdwRUs0a0pyd1N6R1U4NWZ6TVFKV295RXRaZC9aMjNhS3BGKys2YU93?=
 =?utf-8?B?M2k5WkxyYU5PeHp4QWhwRVl1VXJUOVd1TVJxWnFNREtuQi9MUGNML2dKdHB3?=
 =?utf-8?B?RkgwSEdXTERnSkEvVzZNcm9oQlNxRjIrLy95WXZpekUrVFl6bllkektKRitk?=
 =?utf-8?B?TlBtWFlNLzRKcnMrSHNtNVNHTzhTUFFQdXY0TkVLYTdHNHdkYitBVVB0b3N4?=
 =?utf-8?B?T3UvUEFBOFlBZmtoVDVDMG5FQ2laczVzcjlWTks4OXJqZ3hlNmd0TG9lK1BP?=
 =?utf-8?B?Y2FYNEN1Y1cwNWZWTnE5Y2c4NStPUWVKZ1huNis5aW83bzZKM0ZyUmVUMXlt?=
 =?utf-8?B?RzZBM2Z5R1d5cUs3T0FBM3dnVmRyQTdZRzd0Nkg5WGVNQzFpODB0R2FqNHF2?=
 =?utf-8?B?RjlINFB1ejBCYkttYUhmQ2doUFhWQU1weVFJRGwxL0ZkbStZUEs0TkwycVkw?=
 =?utf-8?B?NmhJRzEzaFVWMnJpYlMzSUIzcXJ3dmdIZkExdThBN1ROTTdkVG1qN1M0RUlL?=
 =?utf-8?B?Ums0RWQ0WlZGdXl6a0RhcUdSejZtWW5lQ2F4SjgvSUxZQk52eVFsTkcySnor?=
 =?utf-8?B?YVBXQ3FZYTVWRHZwYUVsd1JIMnhaK0lCMEdPZktqYXE4NEluT24yZDEvWGxy?=
 =?utf-8?B?ZDVEMDZiaTlyWitOR3loVE55T25DK1FvZmVxV3UvZjdKaGVONWljWVJ2elhz?=
 =?utf-8?B?Szh6RE5oNzI3UzN2QVU0VndCS3ZJRXlFemhIMGYzWklsa1NIRjFEZmxlSVhU?=
 =?utf-8?B?Ukdhd05RQnNpZjNKM2VNVDRySjNZM1BLcWVIU3FuL1lWUDN0RmFEelBZQXZ6?=
 =?utf-8?B?NkFMOVpZU29hLzAyYzVoWFZOK0lRZ0NJVXBMVWR5Z3RHeTdqUGZNTVBucjlt?=
 =?utf-8?B?c0FFWGZwN1BFVkN0N1g0Nkg0dWNKZWlFRU5LS051RlR1cHpOZEd2dFNTQzR5?=
 =?utf-8?B?clM2c3E0eUZUR3hBTk03UnNWTHJBZUFnZjdxamsxRm5zYUhNWjZSL0Jad2NY?=
 =?utf-8?B?VlZ2ZDNCKzRBQUd6L0I4bWtMcVpZbEVXUHpvWEt5NHUyTlhTYkZGNFFLbnkr?=
 =?utf-8?B?RHV2RERFUW9PUWpDMzJVK2tDYm1Vd2YvdHJjR0VZU0NXcTVicWJ4ektFUU5s?=
 =?utf-8?B?cml3MERFL0ttVUNBSHRFUFZJbXNsWnUxQVRZV2dzSXpDSmZsMzZlWWlIL1B0?=
 =?utf-8?B?VnJ3NGVFaEQwVDRWSjBUZGdrbUJONWtUNFEySkVQOWhYb1JTT3p1Y0FBT05L?=
 =?utf-8?B?aUhWV2xUeit2N3FaV2RMVjBqaW0yNjR0cys1bndHNER0R2FzWG50Y2szVHl6?=
 =?utf-8?B?SXFxaVBYL0lsRlIzamoyVU9kV29yc3E2aHJGeGpiekdtejZqcDNKaXdPdHk3?=
 =?utf-8?B?Ni9veHlQSUxkczlvRElhaXE1cjU3UmY3TTFOdGVXUy9lUWF4T1FuVlRhakxB?=
 =?utf-8?B?NU5qaVdFbld6bGFDU2hoNmY3T2ljWmtoUXhoZTEzM09Yb3NhenJneDVoa1lX?=
 =?utf-8?B?ZmdUbmU3bUVSUFpZd09WOEJKTHBWQ1NJYzhONmk3cm9lOXdvelkxQkpQR3FV?=
 =?utf-8?B?Vy9KMTBBVjAwQ2NOUDdYMEprU3JBUXg5enRFY0Y5dUU2NHhNd0xUZ2xqY1U2?=
 =?utf-8?Q?Cup2xMoff6EGOfYqJDqHcPkOS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3926dbe8-9cb9-425a-ceb6-08dc96784e25
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB6048.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:11:03.4608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvS57TKZYAPWrZOXFMswS00sUgSyirVzLpslocJXh7s3kuyvZzWD2h+APK3PotCN8jDrfQZ0MUp9gQTS7rOqAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8719
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

On 6/10/2024 2:25 PM, Lu Baolu wrote:
> Commit <17de3f5fdd35> ("iommu: Retire bus ops") removes iommu ops from
> bus. The iommu subsystem no longer relies on bus for operations. So the
> bus parameter in iommu_domain_alloc() is no longer relevant.
> 
> Add a new interface named iommu_paging_domain_alloc(), which explicitly
> indicates the allocation of a paging domain for DMA managed by a kernel
> driver. The new interface takes a device pointer as its parameter, that
> better aligns with the current iommu subsystem.
> 
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>

Reviewed-by: Vasant Hegde <vasant.hegde@amd.com>

-Vasant

> ---
>  include/linux/iommu.h |  6 ++++++
>  drivers/iommu/iommu.c | 20 ++++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 7bc8dff7cf6d..46f1348f1f0a 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -780,6 +780,7 @@ extern bool iommu_present(const struct bus_type *bus);
>  extern bool device_iommu_capable(struct device *dev, enum iommu_cap cap);
>  extern bool iommu_group_has_isolated_msi(struct iommu_group *group);
>  extern struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus);
> +struct iommu_domain *iommu_paging_domain_alloc(struct device *dev);
>  extern void iommu_domain_free(struct iommu_domain *domain);
>  extern int iommu_attach_device(struct iommu_domain *domain,
>  			       struct device *dev);
> @@ -1086,6 +1087,11 @@ static inline struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus
>  	return NULL;
>  }
>  
> +static inline struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
> +{
> +	return ERR_PTR(-ENODEV);
> +}
> +
>  static inline void iommu_domain_free(struct iommu_domain *domain)
>  {
>  }
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 9df7cc75c1bc..e03c71a34347 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2016,6 +2016,10 @@ static int __iommu_domain_alloc_dev(struct device *dev, void *data)
>  	return 0;
>  }
>  
> +/*
> + * The iommu ops in bus has been retired. Do not use this interface in
> + * new drivers.
> + */
>  struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>  {
>  	const struct iommu_ops *ops = NULL;
> @@ -2032,6 +2036,22 @@ struct iommu_domain *iommu_domain_alloc(const struct bus_type *bus)
>  }
>  EXPORT_SYMBOL_GPL(iommu_domain_alloc);
>  
> +/**
> + * iommu_paging_domain_alloc() - Allocate a paging domain
> + * @dev: device for which the domain is allocated
> + *
> + * Allocate a paging domain which will be managed by a kernel driver. Return
> + * allocated domain if successful, or a ERR pointer for failure.
> + */
> +struct iommu_domain *iommu_paging_domain_alloc(struct device *dev)
> +{
> +	if (!dev_has_iommu(dev))
> +		return ERR_PTR(-ENODEV);
> +
> +	return __iommu_domain_alloc(dev_iommu_ops(dev), dev, IOMMU_DOMAIN_UNMANAGED);
> +}
> +EXPORT_SYMBOL_GPL(iommu_paging_domain_alloc);
> +
>  void iommu_domain_free(struct iommu_domain *domain)
>  {
>  	if (domain->type == IOMMU_DOMAIN_SVA)

