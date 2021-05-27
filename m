Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C6AE392D03
	for <lists+dri-devel@lfdr.de>; Thu, 27 May 2021 13:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D7D6EE8B;
	Thu, 27 May 2021 11:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2067.outbound.protection.outlook.com [40.107.236.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4B86E463;
 Thu, 27 May 2021 11:46:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hizBucA18MZ9n3n+64C91Gr+Rutdma7Tgp8DfuBw73xxBDp3oTs0DOl1wZgkQy0Ym9kRXh1OJ6s5ug5G6fDgZSTFXdj3H6WHZbZBEXu26N8mLo5tRwPf1kK4wFqQWudls/xLNhwoJXHo86sKpO6THbeLE2szxi9E8RKiUgB2FdHFmG6yp/7+ro5i50BLU6DKbMl4kf14R20f74HG89pE2hs/eEcCB26JBtX5fMP2ZRRKtqBpUgs3VMQGnFBWtVkn+Anns9Y7iZ+zH+4WGyAIkvLCFDIbzbuIAVJ17lZzcb3V9yCVAxSzWKuIMxhj2EkvSBMRF4X6Fpg3oqYrRHz79A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhWECOThKnAxTcW7ozZ2IsYs7GNtFFbbGhz9WqxDIk4=;
 b=lPvRSGnVipYGJmZ/OtbfEmfU7JHmFlUTri+00ygdPVr9dK2eMpHsfnlwgvEK+Rgumct3w1Gkwo/kV642JOLgpj7PhweEOomLvBpO2psfjEnACqWAn4+3WTGSCxC7DToynBAnkWex0G8wPvtuMQd3GJTjyEzArZ7eMB0mhBqG1tKd1lR5ILw1P6n7Fpqq/LiB1HBRW4u7vEE5RkFS+aUWOPUa/To7azfH3H5deo5Jvqi8HEThCn49jteZoCAc7XRecCLHc0fS9nro0LPfiMbVOOJ6siHJlG57BoIcd1q+eYKbs7VBb11KgYJpmoKx4c6IFRYBtak2ooS5quGYtVbdfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fhWECOThKnAxTcW7ozZ2IsYs7GNtFFbbGhz9WqxDIk4=;
 b=q8yQf5A0D4p94fWSlKBsHMREku3BhAGfOzbnQXL/I2oJnmG0s3rIE1zUdkWS6mjNe+jTempvsQPJqDy6bZlI7maYk/kqWgODy9SwyAalRyQsMw8m0Eoc1RFddGt4nOakvP9R44m1529Yqfw8SK8wnDuQLOvkUD82+kF50Duw+dY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2450.namprd12.prod.outlook.com (2603:10b6:207:4d::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27; Thu, 27 May
 2021 11:45:57 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4173.024; Thu, 27 May 2021
 11:45:57 +0000
Subject: Re: [PATCH 1/2] drm/ttm: cleanup and add TTM_PL_FLAG_TEMPORARY
To: Lang Yu <Lang.Yu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210527013051.4302-1-Lang.Yu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c493b47a-3518-c7eb-c7eb-db21815918d6@amd.com>
Date: Thu, 27 May 2021 13:45:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210527013051.4302-1-Lang.Yu@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:e531:3aa1:4782:878a]
X-ClientProxiedBy: PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:e531:3aa1:4782:878a]
 (2a02:908:1252:fb60:e531:3aa1:4782:878a) by
 PR1P264CA0001.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22 via Frontend Transport; Thu, 27 May 2021 11:45:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff1a1855-6985-456b-4ac5-08d92104fd45
X-MS-TrafficTypeDiagnostic: BL0PR12MB2450:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2450304A3DD51F97FC61226E83239@BL0PR12MB2450.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5+MYEh/SbuuAOo/56VnoC7xg230HvkIIPJulL3WVm6qp4LADBivyzEC8vlHGvO5D1ViXVNLsDYGMLhYmbiVULvkiqjqbsr4AwA47KtVaStGIvde9G2TfEC8EB3p/l5kJRRv1GZc0KmCRXu0Xgl5sUIlmdrbjTbASyO+yQJqMCmCRElrrquvEKoSaceXR9l1sqbj/cG1V8UHs5Tri14Jyq/ST0dZq47q5xaJciz6mC+QbuZjKc0Pd9NXqCoklQ4eDWNnIcs2nmLeCbjpji0Q+E9q599GUad8RhirZorZ4uNvLSAraw1P78pdABw/O5vYiCpmzKCvG7OHoqx6Iv0PIzXtoVwy/351/t8wikPUMGfJPe1FQ473FTwtlUBV9OB/b2Lbve0jhQDl9YqZEgS2jgSrniIZ/nw/oys41mMDgUGmlNZXJgpBAfz7al85BT8ao4zFCiG+jD0iLYrSe/+dKaeFyF5RkP6xQeR7YNssqSUpS017yo9klsP0D3/CBk9rNYMw2oFKsf23NwqCf7qtn/ql/aDmS1Qd14i6fQWrp3Q47lwmzABlUSDRXGAnRUQu8cPhwXOWqtgnAZocna29Su99FHRSmCY5hDZSA4R86iAvLnXrdAUtzSjUJQ93TrorUpRn15PGvw4mAc7lBKVjdqK4ALUrBZkTI+RsqydZH4KISCffqLah1oZw5QDmoXzLY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(366004)(39860400002)(346002)(136003)(66946007)(2616005)(36756003)(186003)(66556008)(4744005)(16526019)(86362001)(52116002)(2906002)(38100700002)(6486002)(54906003)(66476007)(5660300002)(31686004)(83380400001)(6666004)(66574015)(31696002)(478600001)(450100002)(8676002)(8936002)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Nkd1TGpRN2hDKy9aaWxDV3d0aGRrM0M1UmRTTUdMZFRYeUt6aHRsQzl3eGJO?=
 =?utf-8?B?Q0czeWhjK1REZzU4NnpFQ25JWVg5V1EwYkNjREVRdGkzdUo1SkZPcW9SRVZh?=
 =?utf-8?B?d0xMUG0yY0xFU0d0ZjhHeTg5aXNvLytQZXRQRmw5VnNnc29oMDdTNEc5Slo4?=
 =?utf-8?B?dXB1aE9KUXV2ejZjQVpvejkzRTN0TEEzQmx3b09FRk1reWs5S2w3VlhzWGQw?=
 =?utf-8?B?SEJkVmJ2N2VDRWIyeVlyMllkeXRXYVljTHdaZER0UEtMMDNXcXF0ekpqRFAy?=
 =?utf-8?B?UlE3SlFwb2grd0NyMnlRZHlGdXFPMzV6eGFDR2M5L0toazh4Z3RXWGR4TlF6?=
 =?utf-8?B?djdkNmY2ZkVPYnBiS1AxNU1wRldla2I4MkZtTVpTNmpMTDFiUFZ2anpnSWc2?=
 =?utf-8?B?eWpZbzNMYndBcXRYc0U0d01BVjZoc08rTFg3MWhRZldhL1MyNWhrNnFxOFJC?=
 =?utf-8?B?a3pjZ2hhdFluKzlxeGpyanJtWmJPSS92UTJzWVRqNm5KQ3JWYzdiVlptZE1X?=
 =?utf-8?B?V2VRSk5GcXBQYjc2dWRxdFQ4Tk5xRDZ1WThoMmFLTW1ONVE3K0tjbVRtU2xl?=
 =?utf-8?B?K1FFdjl4RkcwYWlFTDdxV1VOZEx2aVRLOURxL2dYb3VMYU1KN0x4VlZwd1Fj?=
 =?utf-8?B?Mis4WG1ndTErUFh0S25VQjMwc2lnZWRZdFBNTWJGQ2Y4NGxiVjlvaklFYXNK?=
 =?utf-8?B?ckpLL3hGT3VxdzdlSHlYZE1CNTNBclZjbElmNFJOeURHS2ZrWmR2ZjRVTzEw?=
 =?utf-8?B?RGpuN3FKSnJ1WVFKUCtXVm00dGxjZjJrNStKeE9wYVlBQzNJQzFjRlJ1akM1?=
 =?utf-8?B?dzZZNllra2VMajlOTURBWC9uSGpWbDBrRzJTT3lpa05KZXZmUFVkTTdvQXN5?=
 =?utf-8?B?YmNPQVBONHVCeUdJemxyNzI5RFh4T1NjYk5yT0Nwa3NsVHFyR0xjbEp1MCtI?=
 =?utf-8?B?MWxqZ29rMHZoMTdWSi9sYnd6SDJoNkVZVFhBSDB2WDMxRGtJaWwxQzArK254?=
 =?utf-8?B?dVJIcGxwUDE4U0xZMGNIeEc0eHM2VmhRVVJlcFFrOVVVd01abVE2bWd6aUhO?=
 =?utf-8?B?UWU3U1FVaEg2S2pRUGtTMGM3QnVaN2dxUDN5Q2t5NmZPMStUMHBUVTlaaDNU?=
 =?utf-8?B?cUFLRnoyU0hBejFoV0ExTUdSbEhZTTdmSUMydnp5cHBjYTNSRGNQdktqVXJw?=
 =?utf-8?B?ZktFYzZ6YTlXT0ljdFgwcUFWNUtDRE51Ym0vZm8zb1hQSkZqZlBFRjRTZ2gx?=
 =?utf-8?B?VWxmZit1dFpDaWZVN2c3cVhRbldQZEt5QWJRNWFDajU0NHYrMEw3aWp1dlZX?=
 =?utf-8?B?L0VqQURNVHAzb1VGWjBNY0dJTFFwclNWK2l1ZTRGTDNNbmVlam9odUx1amxD?=
 =?utf-8?B?SWtVMzYwRlJTNVhleTVXOG9aZms0emVaTEhvY2FMaW8yTWRDd05VeVhvMS94?=
 =?utf-8?B?a1VSMjRycmtKUDdCOVBwVW55S1VlUVNzTC9nQmdUWEdDNlJqYk9LYjVtTzlw?=
 =?utf-8?B?R1liNU9uRlVNU1c0K2NqSEpnbk44OVZKUzdZem1iN09TT3MrQmhQS3N1ZHpY?=
 =?utf-8?B?bVM5TjU4dFRVZGRrRit4QXpDYzBBUllPbWZKN29FTitrdXV4MndxMXRROC96?=
 =?utf-8?B?MzBRU0pKVGRWZVltNnpub0c2YlRiZGpzTGRrVkc3a1J4MnNJdzVidGd6bXJn?=
 =?utf-8?B?TnJkVkpVTE80eVMyM2FZLzZxT2NtUHJFczlHNXB6bWJEZGRZNjJGR2VEb21G?=
 =?utf-8?B?ZitOUmpUUGpRcGF6Q2dRUE16bU90eE50NG1zNFN5MnFOeGxkbVZwdVF0cVhT?=
 =?utf-8?B?dnFTTGdZOG1qN2JLeVcxR2JxSkFQU3VHbzZlTThBUml3N243a3M1cEVuV1NZ?=
 =?utf-8?Q?3DRvbGxnimze6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1a1855-6985-456b-4ac5-08d92104fd45
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 11:45:56.9704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDCGxaMg3QdhTh6IVCUJIuWIeeqycV9b/EQ2guCsASmaedPt19hEvNHtRLNSwyBF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2450
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.05.21 um 03:30 schrieb Lang Yu:
> Make TTM_PL_FLAG_* start from zero and add
> TTM_PL_FLAG_TEMPORARY flag for temporary
> GTT allocation use.
>
> Signed-off-by: Lang Yu <Lang.Yu@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com> for this patch here.

> ---
>   include/drm/ttm/ttm_placement.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_placement.h b/include/drm/ttm/ttm_placement.h
> index aa6ba4d0cf78..9f5cfc7c2d5a 100644
> --- a/include/drm/ttm/ttm_placement.h
> +++ b/include/drm/ttm/ttm_placement.h
> @@ -47,8 +47,9 @@
>    * top of the memory area, instead of the bottom.
>    */
>   
> -#define TTM_PL_FLAG_CONTIGUOUS  (1 << 19)
> -#define TTM_PL_FLAG_TOPDOWN     (1 << 22)
> +#define TTM_PL_FLAG_CONTIGUOUS  (1 << 0)
> +#define TTM_PL_FLAG_TOPDOWN     (1 << 1)
> +#define TTM_PL_FLAG_TEMPORARY   (1 << 2)
>   
>   /**
>    * struct ttm_place

