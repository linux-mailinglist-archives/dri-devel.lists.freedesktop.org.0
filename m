Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A16745B669
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 09:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 538E46EC33;
	Wed, 24 Nov 2021 08:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2078.outbound.protection.outlook.com [40.107.236.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6F66EC33
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 08:22:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kldRSfPY1gFr66gsVhBO0lGB1KQhhLx3QHBPGhSN+F+WzT2cu37zvJ8Ui02BnCsPBC51yMyhWfXcg1JSzs3gemyopVAW9TCcPvwaaqF2wSwLnd6hitVkZiBzuIP0apYdlNlM0Qd4x39hiyFu3A/6cksQoBGi2dfzxjWjRcT+suv6EOmhzavWLYQlkYddPCmdiUPdMyeRQUh+GOK7HM2jNizBsIZO+0q37smkXF3XtTM2FnugnlX6i6JDsuvF4aS5EkCymDxRrpVujXsG2RsPgT1MYbaZ/2eiAZYCztr87hlLgHQ4siikdA01RtaZ2bFDVrtENcspv02ucFiDU6BxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eHWTILNAn2bxadkvUs+QbeRh5W2EYWXKeq3Vr38b88U=;
 b=XUUjjF/1BXhyucmCRGxXUDPF6YKL8bGbcjYOko37E1F8Nj8+s3nSOb2hqh9jXVot+d7ghJEYlUvMMq5kx9poMqS62iU3sRTQ4amw7JG4KwTfvhxQeqNctOfyBugDsz/gT1EBJdjmgknlm69/PDIAPl6lYbututNPjD0XMAQVRd0s+R0EkOdADbNDAIT0/69f7FHHt7kK7HFLYfzHikqmkjCgp4Lz3GdYj10NPM9qj4MpK8QvEmiIoOkYMtJ0CJ1qqjtgXrumBvUG2wvNypat1PjiqPXE5OUNFdaMYFlQlE5ayS9ji71z28Jp6DyakltiSZP+1YYrNbzhHrzrZP2o1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHWTILNAn2bxadkvUs+QbeRh5W2EYWXKeq3Vr38b88U=;
 b=hBzINs6r913T2Z4t12tRy/wE7GlNIXmF/a6LJC6CXsgCN//Rw5hWBYgEiXJJixChJXDLUOAPPr7h4viBgDWMoBRJkQ18sYVzb90MrZEN1wiDV+gKKd4kaWzJZUJERjjDqeTHrLDFUCTRMSEkba0OsjZiDEywGBWLbPA8bgAx9q8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1614.namprd12.prod.outlook.com
 (2603:10b6:301:f::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 08:22:48 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::2d02:26e7:a2d0:3769%5]) with mapi id 15.20.4713.026; Wed, 24 Nov 2021
 08:22:48 +0000
Subject: Re: [PATCH v4] drm/ttm: Clarify that the TTM_PL_SYSTEM is under TTMs
 control
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <3687c5f0-edb9-3cdb-2bb7-e45549a1cfb8@amd.com>
 <20211110145034.487512-1-zackr@vmware.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <afea62fa-c5e4-8821-b387-11b1983b0c58@amd.com>
Date: Wed, 24 Nov 2021 09:22:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211110145034.487512-1-zackr@vmware.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AS9PR07CA0024.eurprd07.prod.outlook.com
 (2603:10a6:20b:46c::33) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [192.168.178.21] (87.176.183.123) by
 AS9PR07CA0024.eurprd07.prod.outlook.com (2603:10a6:20b:46c::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Wed, 24 Nov 2021 08:22:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f3c773d3-10c5-4919-62a7-08d9af23995f
X-MS-TrafficTypeDiagnostic: MWHPR12MB1614:
X-Microsoft-Antispam-PRVS: <MWHPR12MB16146F102CD85AA41FC618D683619@MWHPR12MB1614.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GdpuX40IJB+QhKVO+kyeV5UKCKRBzaWwr5H2/2ypjePn4osjRrJ6n0d6i4hRvpt7FYSJT8pZk97H0BB1zshLR6HiQraqqTprayD+A4RTfD+EAE/Hz+9mxgaKeaUXXk6kybwBDVMxBB5VJK+uoS2hfTGq6cZo6dtXJ1ViOTX43ChCsSNgaaEXoZeas5ZBp6xZmDpEefVUCyxGAd2d1kWUbI4CSJfndRdXysdHWdik7DJQX9uGLlSxoVOxIumnGgho1yp9CMvhrr6s9JvFDcpWu7ys8YUVbMD7qABCWSTSUcJ91UHLS2X5DI9iDjwAnRVYRQVtBkhhqUr80o8WZ2H98YfbXc4/0mTx6RmZ2svYM7t3EMjcS3LMl8unoTljy6D6CLJl77ipFI+KdNGa+M9kaTNdUklUmu55QuAqWINNPPQJNUa6n+NaKFd0Asw3sHGv1LxjVCBPDpmroC/HkKKG1VODnqqgpCh0O3Ogzucc8//BwJJKBf8bmHIV93HWklcapcVRSqdKC8k20ySUUiqewD01Ih1+D/rP3hBnKPbZ6uEcoLO4Ma1y+pTAz1Ww9ECgJCu+4fSk8d00TQ/5WNTRSD/sEI3Vgw3Zg3ugNNENOAgDulvSj8OCgn5ExLJGldHKarJm4sp4Rrrv8VNYAf/FvShlEEmKYyrzpCAScg5U74WAkc+td448EPz2qgOfb3Z1somEAprisXs4xVFV0RHQkIN+8YbTigJIwVg9ff817NVMzQZE5DZf2LSuNzQXaK8VnNNkyLZxGtCjgWPaIqjK6AfWpYLKZO39WvXxA3HtRg/W9/I+T90RL7y4YqWMDWsEuJoB2UdAObTxGwCECx2MEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(45080400002)(6486002)(2616005)(66574015)(8936002)(5660300002)(86362001)(186003)(16576012)(8676002)(4326008)(31696002)(956004)(26005)(6666004)(66946007)(316002)(36756003)(966005)(38100700002)(2906002)(66556008)(83380400001)(66476007)(31686004)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tk9nRXhPaGQwcjNqM1Z3ZUFiMXhlTXFMa1RKVFBTRTA0MlJreUxqdEgxY0l0?=
 =?utf-8?B?aDk3U0x6Rlh1c0JtSWtIaXlTN2NVb2N1Ylg2SkUvMXRDSllpeFNBQ3JsYnNr?=
 =?utf-8?B?VHBhM3ZhS0Y0di9xRWFpVFZjTFVwb21iN1NyNzlDN3hHdEhFMmhMOGxHNTBT?=
 =?utf-8?B?RXJNdXZTUzV5TCtBdXczUzg2UFVZMlNyY3N4YU9HL2FjeXN3UWlmZkRnbUJC?=
 =?utf-8?B?enRiUHVqZkpIMmdoRDYweUd6VWE0QzQ2UEtBei85RGxlL0tKRVBLOGJtQi8y?=
 =?utf-8?B?bGZvVENGZm1QUUdRMUkxVEp1MW12b0RnbUVXRTVJNnI4TTlwZlFTbzcwS2E0?=
 =?utf-8?B?OHV0T3kwczFTSGdETmZqQ0M2dXpkRTUwVHltVGtmSGkzVUJmaHVQWHhmRWFY?=
 =?utf-8?B?VFF6ekIvS25jWHU2S1BDZnJMY3FFeEZZRnZYTm5XSE55NVhkMVJMUlJDWHc2?=
 =?utf-8?B?aVZvTlUvN0piZDBRb0VPbEFIbTJQVGhnY0k5cVFLRFVVK24wUlNWeWhtbVUy?=
 =?utf-8?B?VGcrOEdsbFcxZlhXUThYNlpRTXZJRGgvU0duUTFXTlZIRjZKMENFWklmY1RL?=
 =?utf-8?B?VFIzVFN6eStxSXhmRW5TTVJYL2pHREs4SEk0NjhQbWVYNXpVY2VWYnMvY1Ra?=
 =?utf-8?B?aWZGWXU0VnI0TUdSUTBMNkU2RThuWFc0ZXdFclU5VHdVTFZEN215UFhSeVcw?=
 =?utf-8?B?K1lMN3FXdWRGS2hXY2ZDZzUxYStTZytUZi94aFJtZFZGQ29tbFJuMldSdlk0?=
 =?utf-8?B?N2Jab1ZoVnJGY2NRQzJoREFveEFZTFdTN3dhNldsb0grSHBYVU1nbTJDUEQ2?=
 =?utf-8?B?YTA1YTY5WE9OTDM5TnRTRkFnQVlpcG16V0ZuL0Z5QlBPeGFFc2k5d2JzMGVX?=
 =?utf-8?B?aHZiVG1LeGtEVjM0WThzT2JaYWh4NmE0OTNtUlhPRVh0N1RCV3V2M2c5VlB0?=
 =?utf-8?B?MGNEb2JXbEFEMkRnbUI1eXRuazBac3RBT1FHc1lLOHVTdUN2bkg0VG9PRzNC?=
 =?utf-8?B?VWZxNGNLR3UzTjJuSXN2eDdmQWJ2SHlHZkdwSFF6bzVVcndEQlN6Mjc5a095?=
 =?utf-8?B?andlMWhHUGMrei9EVVJCalgzaFdab09HZklwVk91cEZPUnNTOFl1dVRKbk8r?=
 =?utf-8?B?VHovenVjTFpzclVtQkRjWWpKeVFLTUwyOEV2YURMd1NyM3lCUjM2SjRzTXZo?=
 =?utf-8?B?SWNudVI0ZkFxWjhrN3FjZEJXcmZUZVVMQ2ZSWFJZR1ZvUklRcmRKc2FLTVlD?=
 =?utf-8?B?NS9qOHVsNmo0YnNSaWxXajV4V1NUYVlveDgzMkErT0cyN2pxa2dRbk9IQWFa?=
 =?utf-8?B?S3B6eWFUamJVSWVMLzFSYUwwOC9vRVdLZzY4N3U4TDRCZUZCenVWZ2NtRUNS?=
 =?utf-8?B?RU12OS8rMXg2U1hETytHVHFHYWl6dzJUODJUa3VFUTJCcFBJVnNQeEd6dWZs?=
 =?utf-8?B?MkRTajl2NWFCVmJ5RGhGdTdGOENtYjVNTjROSEFVV0xVWGlPWW5jd3ZjcHBv?=
 =?utf-8?B?dVQweUtBNThMb25jMFlDWURkNWRmbUxSWmhLVXY5VGpXd0dmYnRYam9rR2pj?=
 =?utf-8?B?enVNd0syekkwN25nMU5lN01rMmJKUmIyTDRoVjVaa05HRkRISEhUYWxyditH?=
 =?utf-8?B?U1Y3STFBYjBSOHI0R0lUKzY0b0pMSHJOejg4NzlSQnlBbW5jTWorMVVhTVNL?=
 =?utf-8?B?Q0k3b0s0NW5Qa29WRW50czZ0RG9iSS9JR21KRUtPR3VYcmcwTm1GVGpQK2dP?=
 =?utf-8?B?SU9PL1N1S1ZyUXh1MWtuWENjaExTcFZ6bExaSUFzelJpYWF0ajdieWxxRDN4?=
 =?utf-8?B?eFBJRzY0UWxkOGFyNW1WWmE1QUpVMmJUQnZ0OVg1L1BKRXAwd1ExN0VKblhp?=
 =?utf-8?B?Mm9pNEVqZXNDT0sxREw4NmhQdWEwcXNlSHVhR1JYdUswajlTczgvZndZZmwz?=
 =?utf-8?B?c1pRdWtHcVdhbHEvai9IZ3VpYkdYQTJoWWhPVEJiL2RjbGs3dVN6aVhXUk5S?=
 =?utf-8?B?bGdlYXM2cklDOVdvUDhKNk1aN3dnbUxDWitSZEgraGNrdWp5Z0psdytGNzhS?=
 =?utf-8?B?WkJCVVJ4cFpwdjZ3QVVRRFpxRmptNHgzdXA5OUFJNjAyR3ZTclpMZXF0SEJD?=
 =?utf-8?Q?hs0k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3c773d3-10c5-4919-62a7-08d9af23995f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:22:48.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t3JFDtgQnIET012RgskIUORHjIdHfoDiW7cp10y0KJekkZL0HD7IgBrWK0yCBere
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1614
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 10.11.21 um 15:50 schrieb Zack Rusin:
> TTM takes full control over TTM_PL_SYSTEM placed buffers. This makes
> driver internal usage of TTM_PL_SYSTEM prone to errors because it
> requires the drivers to manually handle all interactions between TTM
> which can swap out those buffers whenever it thinks it's the right
> thing to do and driver.
>
> CPU buffers which need to be fenced and shared with accelerators should
> be placed in driver specific placements that can explicitly handle
> CPU/accelerator buffer fencing.
> Currently, apart, from things silently failing nothing is enforcing
> that requirement which means that it's easy for drivers and new
> developers to get this wrong. To avoid the confusion we can document
> this requirement and clarify the solution.
>
> This came up during a discussion on dri-devel:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F232f45e9-8748-1243-09bf-56763e6668b3%40amd.com&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7Cbcf8d8977e68448fa20808d9a4597927%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637721526467013347%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3pldUWJ8u7AEDxtG0vQBINIL7%2FQE4HiE%2FQ7x8fi0MK8%3D&amp;reserved=0
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/drm/ttm/ttm_placement.h | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index 76d1b9119a2b..8074d0f6cae5 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -35,6 +35,17 @@
>   
>   /*
>    * Memory regions for data placement.
> + *
> + * Buffers placed in TTM_PL_SYSTEM are considered under TTMs control and can
> + * be swapped out whenever TTMs thinks it is a good idea.
> + * In cases where drivers would like to use TTM_PL_SYSTEM as a valid
> + * placement they need to be able to handle the issues that arise due to the
> + * above manually.
> + *
> + * For BO's which reside in system memory but for which the accelerator
> + * requires direct access (i.e. their usage needs to be synchronized
> + * between the CPU and accelerator via fences) a new, driver private
> + * placement that can handle such scenarios is a good idea.
>    */
>   
>   #define TTM_PL_SYSTEM           0

