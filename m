Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5218FAFBC
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 12:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFFF110E352;
	Tue,  4 Jun 2024 10:19:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TZ4jZ9Ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0209F10E352
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jun 2024 10:19:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXmKxtIt1SZaA239uz4zzzg4uHlet3007rZtNy8XJCG9tMSkJDVhueIMiZoPCdaOfR6pA8J1rWLiSwUsEwiwo59lqJtHhBM7tWIBDRk2EiTwYN8WSuX0mFgb1nyQTsAgOfvHoEbr1h9z+GOwlgJBn2pIK0AlZZ4xTeaAYjxicQQ19sxjuqEoravv2xKai8nx0hbwekd7ALZlODXc7afCYkbh1F1lwHi3r9z3GuuooyhmJhYzH7Haoxo/Rlz671vtQOpA4wkq+HIoY71woC16Yv/m5yiIPOk8e7uDOtSHzA+itvb/NpcdNmRWq1bzjP9Wien7AttmkOdmk86SBddruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2K2JyUKKMgSaISA5zivkZreRowiBnNKsws5/8/ppS2U=;
 b=Iykz1nMOvtvsofss7m5xmkiFo/fRKmzMoCl2kI4MsW6jNUTFbPLdmsUOEAkiAoYyECJ7JVIBJUsjdUybPywcl1NrDRsEZfWvmhlNfH7ieEyHogZeaQtpzu0sh9Yz7bs5xz6SujuW0Cdn8bALN64TM2D4f7vT9IoK/1TbB+/zBzHft638V+iurDqeEjjdB6mpmC/Ft8T1Ij/Q7MFtke/0S89NIwgjRYS03ueQuhL7yH423RGivl2Dls76aq67nB6x8kCw5H6KYlh4YBHOlhHP94g6SaiHw33uKuo+B/D4/ZpQRHAiyW+f/nD6FA587/1lO2VRbyeIgvfJ4+q9pxo6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2K2JyUKKMgSaISA5zivkZreRowiBnNKsws5/8/ppS2U=;
 b=TZ4jZ9NsyCyrAswBYTSCjkvyPjPiN2mjbKdlc4R6f5kjdjyS0FwDdV6YfcxMvBU/YHRYjY/DOrRIOp0tZZUYJF0TrwAKlD3x32+A1DcvnedlqXMekkpnZb4OtL8MlWP9aPLMNgFN4fNYlIRL8zTkNhn4teS6pkcX+A86IDFyB9Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
 by CY8PR12MB7659.namprd12.prod.outlook.com (2603:10b6:930:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Tue, 4 Jun
 2024 10:19:05 +0000
Received: from SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::966e:5ccf:b22b:d972]) by SJ2PR12MB8690.namprd12.prod.outlook.com
 ([fe80::966e:5ccf:b22b:d972%6]) with mapi id 15.20.7611.025; Tue, 4 Jun 2024
 10:19:05 +0000
Date: Tue, 4 Jun 2024 18:18:47 +0800
From: Huang Rui <ray.huang@amd.com>
To: "Zhu, Lingshan" <Lingshan.Zhu@amd.com>
Cc: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Li Jingxiang <jingxiang.li@ecarxgroup.com>
Subject: Re: [PATCH V2] drm/ttm: increase ttm pre-fault value to PMD size
Message-ID: <Zl7qB1YmMSd43hZB@amd.com>
References: <20240604084934.225738-1-lingshan.zhu@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240604084934.225738-1-lingshan.zhu@amd.com>
X-ClientProxiedBy: TYAPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::23) To SJ2PR12MB8690.namprd12.prod.outlook.com
 (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|CY8PR12MB7659:EE_
X-MS-Office365-Filtering-Correlation-Id: 85270f9c-b43b-49bc-e68b-08dc847fc30c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fKteNJ9z4tHghWBUUam5VcgG1R+nX3ETpUuGB2s5gCqdN2NiBN5EymQAGimt?=
 =?us-ascii?Q?pXIMDihxFe/nN/xxAxcau5TuF7wcnUxQerQFA2HIm58VGIRelelgV4an60d9?=
 =?us-ascii?Q?WVinw5aOW05/ieSeh+KZwOzlWlFJ9oDRZOo4mtCQ2G+A7t1Vg07dRa1xcBrE?=
 =?us-ascii?Q?zn4p7qouOqCdlgTDHRBcx50SnBrMXduzabbzPCV0Up2eIZj0SQQ+cVY2Iq4i?=
 =?us-ascii?Q?9TSqantyuMuQLaaruNZkmW+d+o3YVahXPQo1N3tGToIk3C6PvQ6E4tXC1P+a?=
 =?us-ascii?Q?DM/FtNaQpNcdqGwh1HPNC49p8JwxfwjRBuOLu1IcedhMDqz8/cKAL/wfd6wJ?=
 =?us-ascii?Q?5wHVupuEmL6opyZj0967ytjiKUZARcq+uF35t/tHeZFtPyC0vxmLGWVodxCc?=
 =?us-ascii?Q?uTl2tcMgV8KfgZ1N0cdsIFpaU90svetJJeTpp+B+I/uW8AGoc+5IUeQ1hE5Z?=
 =?us-ascii?Q?ztP5eNHCLFt1StEWKw9Emo6X2zUGA/fmFIW1MEc+MU56xKL1VjDaOuhbBW6K?=
 =?us-ascii?Q?ME5E2F3QIeuOl75AQR3LhHxWyfAH4E4lCR23xV8mdKvIY5Z29NMmm0NGNznQ?=
 =?us-ascii?Q?/9Wlpzf37oFdGARbOt4Zo0y0c8Psn4CUOlwTt5PEhonDrEREuZ6DMSEu9/cn?=
 =?us-ascii?Q?L6s+kJsiy6y9LNCqBbW3yiaEzf1szLagSsk4Ygv9rZJBwDJgmwcR6ICHeLq4?=
 =?us-ascii?Q?zD5tJcHRjPUHCJFXBpKXpERmLr7On+Tli+lHbUDizW0OoUwh624r7pGQJsc6?=
 =?us-ascii?Q?lRgG/xE2sFqhtg9cZ8Lo91lD0Jt5MhC/potvcIJcFGDQMjsOs3u0Vgqpld2g?=
 =?us-ascii?Q?AFKO69OVJwCJKC0aPZcd+tL0SdxRkvpCPdg40jONaI24TSCUECVtv+8vNDmg?=
 =?us-ascii?Q?lOA+DGcNUEwZydZ9/pVLH6wsExt6ZaQYiDdhQ+epIupNIbPGod9nyxvL+IeS?=
 =?us-ascii?Q?axQTJO2+C+shUPEO1X0xCavHMZI6ZN1Dj6DOimuzLlaIWaX1izcUzgXOMoFd?=
 =?us-ascii?Q?TShf3OHVu7/peylja/gQbzGPFw4NNeUBVmUHfepML0N/zsvZLeAH66Vit1xB?=
 =?us-ascii?Q?g+pPUSgkJTQv2UcmUtsapG+D3/gIt/RFqRsBOd4KdpPyrhr5X4VXKnG3XDNf?=
 =?us-ascii?Q?3rHrMW5yl2YNtsA3+E1buH4iA6cSMDqpw3wYk4Lft3G773SDhmJrS0ki1Z9+?=
 =?us-ascii?Q?AavEy+vN7XQmiDxIdepDPdOvUMwSzWLymr8nM2LiTrpW7SLf7VnYl4lpMoYE?=
 =?us-ascii?Q?dHS2L+EpIbDf1OogVajDO9oPeQGnFa9mrGiGV8FHCg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB8690.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ZYhK2ksY05Jav2fB5hPyKECPw6efKC6kj4VQo+rV842OaUmlKv45KgTtKRV?=
 =?us-ascii?Q?EmDlYS8U0XyzNNMehOAbhd46DtINHUXD2ufX5hzSjAxrqSKrlU+yrlL8bLIx?=
 =?us-ascii?Q?eC302ATnDmcF6fzgteIRk5FxlCYGAHxn/hl87L36c9bwtdgYrGOBogtDJZnG?=
 =?us-ascii?Q?MW+UVa+UtCi4QBa8twXRMmpbABJOfW6B7uAr59/lrloduNmBymuYSOxe7Hj6?=
 =?us-ascii?Q?8lu03quY4DUY8tRb0BAF2TdswIC9lFuZ0VwIqcoC+7d3E3M1PENo1GbZX8gw?=
 =?us-ascii?Q?xCcJ8YaWDtfFNvFcWlRjMEUAp069Nz4YmdXRTz7XRTN2bVpodhskR3Gx5bK5?=
 =?us-ascii?Q?h5vCAT/ZMjPai1YUmvI0U5pR4KJ9NHCWEzIL/doS5r2Ew+fXDdWn/pkX+KnY?=
 =?us-ascii?Q?pTplrhtLDdZAQNn56GNdusr3ZYj6CbXJN1i+/73rTvBTjlClXr9EcRf/oWcf?=
 =?us-ascii?Q?gorTaSUyNzjuomKDiy95BmrvRleXsdolDelCUkk9J/xNGp+UZsRauhVgL+Lh?=
 =?us-ascii?Q?hKEpXAKCYszTrTCV4wkSRgkXbf+J4ACN8ghXgDkhpWwhWbhRPbW9yzOL7VKX?=
 =?us-ascii?Q?cTeMxTAlYj/Ma0sLtVw/JC2aToP/vT7PyAfqduNQHafva8s1Ho+QieGAQ6B1?=
 =?us-ascii?Q?5DhR/H9rGBeooo5DLGnFCJLe9W2AVoRrN/5bD/Gs/thQG/kT08CRBqv2RlId?=
 =?us-ascii?Q?x0tCIrj9E84s3XCh9o7S+LTE+1X6ypNMkeX2MYuT08l3yCcLV4uP8hEW8ady?=
 =?us-ascii?Q?i8pvTAKmCBF7kO6XPwFxdRMk/9LHwxTjWlAMNnPL11a4ODBx8JFqUl4RFErg?=
 =?us-ascii?Q?Ew7p757YvtgJECP98go35lhyW6962Lqg/yF2BTe336JZCLpgVWLBkM+yMrzT?=
 =?us-ascii?Q?vg6eCY+uVoanyPCM23AIu+y2DoRaFXuu6WVxBEQqXnDRHT9Hu3Ge074JGxFc?=
 =?us-ascii?Q?FS3Hu/iKjpt2Bi86xouthEspn9aeeSXmlxJ5XoR2Csm8IDhjPek9LrPvjLRK?=
 =?us-ascii?Q?ub3MbnIACoV4TG491kwWQIaTVycidiQt0Rb+39jeZz0HNt2sE1I4rkroI1g1?=
 =?us-ascii?Q?WvhqD3m4y1TDzFJ9+Arn7LWojm/2S416dw9Cr2F6UDHajewwXFZsXPp6lIAg?=
 =?us-ascii?Q?UzniYiD93cn48iq5PngY0swqL68Q/uUY13NNT17O6A/oZUe6JWEVmz0JRhPg?=
 =?us-ascii?Q?WfxRO8tYs6lDtoC2ap00IKnZVQM7BU6JD3cfOiRqje3KKzhVMqwXGnnaasUI?=
 =?us-ascii?Q?oEYMTtNTyFW9Zni2nwl+XSn6t419l1WKjhLZkezsJ7tBqNHQXCUa0qgDxmE6?=
 =?us-ascii?Q?XT9DGqEu39gDAS2zljBxHP0++6xxoSvoRdlY6MGp5WYkxqRtfh+qMt5iY3Io?=
 =?us-ascii?Q?cjjepBlphX0Ku/HTH4k6Bv4xbfppaGW6CbJFlNfsEyF0CDHLYmJqiTSxJVHv?=
 =?us-ascii?Q?6K+5O/9qRMsI5cuRBwm/afegnwhVvBA3H2ysHUOu+zK8dhr1zx/ZkEHHdjva?=
 =?us-ascii?Q?gyp59MmJ8qVnog5Cg2kYGTU3ju+F+NDWBSg29V7njiymK7CxtZ4bjbRz0fFc?=
 =?us-ascii?Q?MiIgC0M/L1CEiFs2lg3uUTXDrbM1j1akB5SduCnG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85270f9c-b43b-49bc-e68b-08dc847fc30c
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 10:19:04.9832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oPS1GQ6Ybgznhr1IyLZEvQWG63uk58Z3W28YzijuWgs+wDBjNDGU5KRBCRwsGZCQ0amwggTfZvF0eRcP9nxfew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7659
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

On Tue, Jun 04, 2024 at 04:49:34PM +0800, Zhu, Lingshan wrote:
> ttm page fault handler ttm_bo_vm_fault_reserved() maps
> TTM_BO_VM_NUM_PREFAULT more pages beforehand
> due to the principle of locality.
> 
> However, on some platform the page faults are more costly, this
> patch intends to increase the number of ttm pre-fault to relieve
> the number of page faults.
> 
> When multiple levels of page table is supported, the new default
> value would be the PMD size, similar to huge page.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Reported-and-tested-by: Li Jingxiang <jingxiang.li@ecarxgroup.com>

Acked-by: Huang Rui <ray.huang@amd.com>

> ---
>  include/drm/ttm/ttm_bo.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 6ccf96c91f3a..ef0f52f56ebc 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -39,7 +39,11 @@
>  #include "ttm_device.h"
>  
>  /* Default number of pre-faulted pages in the TTM fault handler */
> +#if CONFIG_PGTABLE_LEVELS > 2
> +#define TTM_BO_VM_NUM_PREFAULT (1 << (PMD_SHIFT - PAGE_SHIFT))
> +#else
>  #define TTM_BO_VM_NUM_PREFAULT 16
> +#endif
>  
>  struct iosys_map;
>  
> -- 
> 2.45.1
> 
