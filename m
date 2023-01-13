Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A724669316
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 10:38:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DC410E9D8;
	Fri, 13 Jan 2023 09:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03E510E9D7;
 Fri, 13 Jan 2023 09:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9uJB8KmSAwmxdAm/NZCVQ1XJFzOi2vXsrpLkW8hp5vI9hwXq2XaUd9UVTKbje0CY78fJ2d4W4EFhVXKpyZkeMQaE9cUp1Ln8Zd6aejehV+TYzcAc3kjZUjeiZm4maygcV/wZ3on1Lz3MqXxWGynwpFuRmqmB9/921CI0Sq9/I4mxkDZv+HcIR5OQm5Mfgqzg6kcAaBfZrHX7SzF5YUpUIacXzg968y/hJqMQC1UB3eUhEGVkHG11w8HYxuTlYBRSn86BkqvhjOp/Ck/XjbHpRqk/XXFAbFaUxhExQUVTOrNPyudshEYb77X79WYCEYTmyeulHHQMUVnArGlTN+KZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymRvYlYZEMYHWO4DSp6qP0kumojEZ0DYy6iHKCK4E7o=;
 b=NogwNLw2QpsjUA7Uhzj//brzOZDhgUVqDz7mHRd1Jw/Ye1O6qwPjon6rZnHm5ZlH59aQSMMNql3oa2uRNB/qm9vPvNHORfn8Wy5TDLdggOI2rkEdaP8NW6CUD9ghW75LcU3AbW5+w3Mz1CCB90dCs0fuoLBVs0EDgTs8BzMrwV2VWqD3EH9NZiKQJoht7OPd2yHpGX3EWGRSN/eZmik0JwM6N7KZg8GfR8Wo5jP2wJsYA1VMSDHD+kDDwyLu6GJAH3cX1yV39jFsFJ2kYM3afydBkq0SfiG6rnNurUmJbT0peeQss/ASpEJpTwaBA6TFCUx8UCfFeTuGOsro0+uFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymRvYlYZEMYHWO4DSp6qP0kumojEZ0DYy6iHKCK4E7o=;
 b=lWH3Izyb5WSzDHH7lHHA/+O944vGtlH42v4AWHshlt4jaOcKaTuqs5SVjP14HcIs73JhJw0NRtPMOIMNuRfGR22O9Gxv8kLwR5p2AV7BNS9avZ4UTouh8p3dbmhLIFlYhNo1f4Alszv0pM/MGzPmmxRe3W+VPZS+AGVBnIR7U4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by LV2PR12MB5752.namprd12.prod.outlook.com (2603:10b6:408:14d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 09:38:35 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::80d8:934f:caa7:67b0%3]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 09:38:35 +0000
Message-ID: <7cafcbb2-f2bf-b7f8-8627-acdcaea258c1@amd.com>
Date: Fri, 13 Jan 2023 10:38:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/2] drm/ttm: Use debugfs_remove_recursive to remove ttm
 directory
Content-Language: en-US
To: Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
 <20230113053416.2175988-2-Jun.Ma2@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230113053416.2175988-2-Jun.Ma2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0016.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|LV2PR12MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b85b6b8-e3fb-4f49-c683-08daf549f0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: af0I6ywFF3Zp6FZJhCLv1YSODPWaJSUdhnyA1bvGJBRQpVBt7i1goSpYK/vT724jI8uGastT1iEwzWN01h3L6GQ5ENU5l4Nqf/zqWztvClMnqCBSwlINUQbDCfi9jpr+WBidyxNxs75oELe6+Mi7MPGhzQqtsPUsXvcTWJ0aWREL/o16OqO2bG5U7S7zJ1pzuVF9LsulhqL8DeS0Yr9sgMzfdCLGX9venJBezgfJPUGFZYTZJH2g7PcQ+XC+sUzA/27VCbCboYFplJd/io/kaM/5WNq3lE/ruogXdbeQAAnm1L7zhWOy4D+MX3E6VjLhMON1h7HKtTVNmoz+//7q9tjdFqHINOEht21+V229WPavOg4jxeb+CglcCmL3I8qmPOYBGUIXn2tkEBd7qO4zMvHGGL7ai3uWLBvGdGzoELhEWakZ2ZIv1PHm/C4OI7Yh6x5Uo5JOiRZC19Wm16OLzmSuKLhJeRpJRNTU/tCqsw4B686DQEaf9H8PyKAVNn2wZmU5nQcylcWwxuIbrOVrfJoXMOaJKh7Krbni8dpPF1vI3xWUEBlAZD1IjRCZYTUbrGbJJUHtkSfShamXxyH2Q1nbDGcwSB1XeF6fzU7Kx/nQ3YSyH8IUmWJeAq3joS8QzQRz1uKtXETMTpH4y+gVwBdBMbm0Cwn9z5NDMqjNMOLGsqJzS21jOdFxMdfzVEs+cNx+lHYzCEi22xioqPabBhqXMoQJPTTNX3hPIbS+Hz4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199015)(86362001)(31696002)(38100700002)(83380400001)(66476007)(4326008)(6486002)(4744005)(66946007)(5660300002)(2906002)(8676002)(8936002)(6512007)(186003)(450100002)(2616005)(6506007)(6666004)(316002)(41300700001)(478600001)(66556008)(36756003)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JLZm5YQVoyQU5Ld09VOWZWWkFLTmY3NTlmanFoQlRudG0xamxuUGtZWndG?=
 =?utf-8?B?bFVqaklDTlQrSEZvenJEbmxXMk9nT09va0dIQnB4V1AxY1RoWEtQMXcrT0Ju?=
 =?utf-8?B?UTdWZU12clNtYTZ2SGlIbTNjcGY5Q2RRNXlaT2pOQkduV3FkTHR6c3Y3VUFl?=
 =?utf-8?B?QVBHc3o0VmJkQTNHOGRhbXlkdGtCaXZGaEJ4OWdWem42VEhMR0JQRUY4YW82?=
 =?utf-8?B?dllCci96azV4di9HOUh2bDVvdE80QTRWdnRvQ1BWUWFSQVBSOENCVXpJNlVq?=
 =?utf-8?B?bHVWaHV5ZkpQTE1ZOG55aUU2WUlpN0k2dk9ka1htN2c3RVZBSUNJT1dsSnkw?=
 =?utf-8?B?U29LNlVuQzVkWUlhajQzejMrK0VpMGZ5R0dkbVJKMmNMV1l1bWR2YWxTY2Jj?=
 =?utf-8?B?TkhXZ3BpREFMa0ViQzRHRUZyQ3BndWxrN0l5amFTZmtBL3lLZ05FdWZ2bkpt?=
 =?utf-8?B?bnNJTFNvM1MyWm0yNXNhQ0E2bWFqb3ZUb0VxemZ6K0JIb3Ftc0pVNmR4Sjcr?=
 =?utf-8?B?azdyZnI1ejlaV1RmZnFGQTVHWmZLdmJTZ3Y0Y3FzVmY3ZkUzTVVKeWlTc3Zi?=
 =?utf-8?B?Y1NUcXRjdHJJRG9GM1ZDMkQvVWlIVUVFb3d1U2hyNllNSlNlellha2pBWVJQ?=
 =?utf-8?B?YTBJRzRhV242VkwyN1E2bC9YRHd6SmZnWmorSlR1RHV3K3NlS2Y2T2J1NkpY?=
 =?utf-8?B?OVFQSDNYWlhOSUFjU0MrRVljbkhpRjJOWmpKdmh2bjBPbGhNbnBXQkpESTNM?=
 =?utf-8?B?R0JGa08wdnRMV2dBVzE3WUV0NHV1cGdvVWVOVnAxUGhWaWFPMjlyMlQ1ckJS?=
 =?utf-8?B?d1JFc0JuU1VZbWIrK2o2UnYrQldESjhwUnpsSVNTSTIrc0ZrbTIwWXBOeFJS?=
 =?utf-8?B?cG42cE91SmJlUkxteUd6QUQzMEcvdGs4VTR3WmdnSldwMjQ5bWR6TDh4Mm15?=
 =?utf-8?B?dUIxNmllcDB0VW83OTZmNmdjL3Z1L09Tb1ZnYlFRUVliTDQzWWxoa25GSkxx?=
 =?utf-8?B?WTg1eWZhVXQ5UWN1WUp3Z2gxcjM0MENZUHoraUNMaVpYNC8vdmdoeVhyOTl4?=
 =?utf-8?B?bUxhb0pSMnAvQ0F5NDQ5aEVWWk9jc1RYQVArRUVQMGt3TmFSRWVvUmtTdmRK?=
 =?utf-8?B?Y2pSZjg0YkVxOVFCL3NMODhPb2lxZkRxd2hxYnN4bTk2YkxvcW8zb3VzeExT?=
 =?utf-8?B?WW9Pd1pMcTJ4OXBCSlZrS2ExTk5qVHRRMkdxSnNRN05MdUtTZG4rL05uaDdE?=
 =?utf-8?B?QmNxTHpqYkNMak56bUhqMTU3M0ltazRiTjJVdVdnYVBuWER5T21YazFZajZR?=
 =?utf-8?B?Y003Z01WaGFLdloyb0g2KzNwYm9RL0NsMzZKTHJyaWFoYzlsVEpTMkhCTWZR?=
 =?utf-8?B?cmRnV1FjNXVQMS9ZYkhBMEdBVTRjYzBVekZVK1lzOUZSUUZSLzdJdXg2WXFT?=
 =?utf-8?B?Q1lkOHgvVVBZRHMxWW85a2FjaGRaS0xpS0NlME5SZ2kyR0dqbitjQkRxVHFp?=
 =?utf-8?B?RExVQkhuaGpIbGtvYzIvdGVmd01sczJhdVI5b2J2aGpsclE2TFNoNm0xMXQ1?=
 =?utf-8?B?a01XdWlLWTQ1a25XV0psRnBQSE9kWFhmWUl6TFN0MXkwMEFHUUY5ZzY0NjdP?=
 =?utf-8?B?anVWZnpYS2g2Y29NdVIybHRUTHNSTmxJd0dGbmJ6M2VtT1UvNUpKOFFSWTBo?=
 =?utf-8?B?Skh6OC9kbG05MmRwcXVSNGthWEhicHNOcGJsNXZiU0I5bnZja3E2cjc0TE80?=
 =?utf-8?B?R215NTRjRURlREh0QkNUOEI2S3RqMUN4eEFHYnBwZXFSTUc3a3BTTmtJL1hS?=
 =?utf-8?B?NGxXYzB2c3dlcnFwcHladTFkR2RmTkJpdS9nclBBcWwyV1NHc2dnWWloSlZ4?=
 =?utf-8?B?ZVFrWUdjZmpLaWZyWEtKdE5zTVZBemhwbFE0TGRVNVIyR2lUL2FJTVhBSldS?=
 =?utf-8?B?VkVTWHZZdCtPSDltU0k4d21hYWFVUzlFWjZ4OW1xRWlkL08xVlNkdnpvUU1K?=
 =?utf-8?B?bzc1dEV1Nzd6cWxWVGJpM0p1Zk5Sa1BiZGx1R1JFRFN2bEFlYU11QkZSZHdI?=
 =?utf-8?B?dGFNRWpYVUVTWFF2aHFCeVdSUHNKend6eWt0SG02dW9naDBjS3AzaEUzQU9X?=
 =?utf-8?B?Q3dRb3JwRjI3VHd3eFBEUFhIR3BoOTFXOTNpOGlZNm5sWDI5SVkyL3JJbXdh?=
 =?utf-8?Q?e6NBRYSkXcDljBaOJJ2gd12qiZJ8Ok8bR2t1HHx7ySMN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b85b6b8-e3fb-4f49-c683-08daf549f0d1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 09:38:35.0231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: slnCOYupaEa84zvoAHO5jwEmfIC3DCIrp4iZW9HyFPfIxVTIvLWJsFN6Ck8+pZmN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5752
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 13.01.23 um 06:34 schrieb Ma Jun:
> Use debugfs_remove_recursive to remove the /sys/kernel/debug/ttm
> directory for better compatibility. Becuase debugfs_remove fails
> on older kernel.

Again NAK for upstreaming.

The upstream kernel is made for the newest kernel version and should not 
contain any compatibility handling for older kernels.

Christian.

>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 967bc2244df3..590297123bb2 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -55,7 +55,7 @@ static void ttm_global_release(void)
>   		goto out;
>   
>   	ttm_pool_mgr_fini();
> -	debugfs_remove(ttm_debugfs_root);
> +	debugfs_remove_recursive(ttm_debugfs_root);
>   
>   	__free_page(glob->dummy_read_page);
>   	memset(glob, 0, sizeof(*glob));

