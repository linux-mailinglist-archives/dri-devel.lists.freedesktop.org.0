Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41B698222
	for <lists+dri-devel@lfdr.de>; Wed, 15 Feb 2023 18:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92B9A10E2BF;
	Wed, 15 Feb 2023 17:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9249110E2BF;
 Wed, 15 Feb 2023 17:33:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XY/4VsaDhlpIKi0JOE7fxtsPM7BkoCZgVugxl/icksSlGDxRmrxpTSbeqkKc3JMAxytY7EPfXIziD1XNOk5w6xKGajvQgj36yBD/PedZ8qHHw68eswvBNYJOhrEAARlrcQkqCPS2Slh1p1UaUL795OOopVmHR9oDVikIJtdnhIg9YxlCuT9dI+flBtR6VEnx1JjOv5jzxNC4Q64qqOZIYCo90uktR0EZ2n0j6RAyjvV2FR5Co/XvhCedmBvvy6UFFXdLL3zc845I3RhOwhxSdbutrlvbmgY8BOt7b+0C1UM2ypNn2M1MUaXxLYTcSwD4jdtA4SUaHGlYxh/8QV1eMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RF2zS1GL9iLs8C1ykHPFYtI2A/6liJp2F6BhPbrvoKY=;
 b=aN9lwPw7dIzJVIkg3J9NrCzfdFhr9K8eaToA28E9Br0eHmhFkQW/b4dNcwDHHjP73J/Ejr6BOyDYGpO8eRucU01SFVlDj+1iqB3zQXMGloTXVITryoS/vKUbZkrsijJLCpjJmFnEodzOaLgPXeuLd2v57mEZPRG69i/FPDKFJ/gfGk3EOgIIWgTcL9GMWgBJIzF0eQUzu3Ti/WN6bg4tbPiYknYp9ExBnTReaMKEMs4/OR+8Y5z6gjDoQm+2+MVBUrkBty193QZF1CPUVAW6MN6AjaQEpJwH1JYJ2kGg2BPaAdGTrQdm3zV6qKqx09wk20aw11SnkokMce9ELIPNlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RF2zS1GL9iLs8C1ykHPFYtI2A/6liJp2F6BhPbrvoKY=;
 b=klLG6yw4En8bQVP4ZmY+RXO/ilW2QVPooOJFTkHAdhDDYVj+zWe0Or0qIwVgMhg951rzjUMnS6hf+FuUJv8Q8irRFqjmhYmEaxyWHM7gdMZVZz8iMYfJDXiJ421I19IiY1ldOkyEgvD3W8qgu5ZYiYK4HgnnO6g5/TnTfdmGBGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Wed, 15 Feb
 2023 17:33:17 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.026; Wed, 15 Feb 2023
 17:33:16 +0000
Message-ID: <b7491378-defd-4f1c-31e2-29e4c77e2d67@amd.com>
Date: Wed, 15 Feb 2023 18:33:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [RFC PATCH 03/16] drm/ttm: Use the BIT macro for the TTM_TT_FLAGs
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20230215161405.187368-1-thomas.hellstrom@linux.intel.com>
 <20230215161405.187368-4-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230215161405.187368-4-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: fc28acc7-0710-47bc-abc2-08db0f7ab8ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFok0zh5LR5HbenBlWd/GhZli5CDrri02xWWoSDVx3S5NkMgSOPXBwfIZSMYDbYf30UpCZyjNWInFpD+eFEdkQ6gl+l030e7+tDPaKuDg4eVh98W6VmmA3cMRc5zlXV7dFYfCf4cjsU1UuUqzedsbE4C0ayNSKDuRWN1ZgdPY26k3J+AwSYbYTGD4V2YlmsCUxKmqGiV9dvK5JHgUoOQLGhnYpjI0J3H7cPZZd9qnozmVUu4kFsBRPR+6mqg84XcV6j+paN95iy02BsU+MlV0OOfZcMsTR6yvrpTGrIypgeRlJicLv2exG2FBWE0kISMpzlwWVm0ZzMMbqJA6lWQjYU2L+MdDEoAI8qofL82yc3UAfy+HsKZSzEVLzeoYBgYSTgOxpfJ8BQ4ak+EBO5c4768eCRh//WvR+lQKA26HwzUDTd093Mchocfa0INqY0bnf5s24EIahAf8rQWG6khA4fXz/0xSpLXkYonxM1VxcFMapfW48ugKRmS9gwFYBbwdTZVl4PmPbe4l5PAovUDwuOTelwQUaLMkQrJzR2eNjiya+QwZ8bfzzMtw60xcgYeLtp31HAHUl5vEM1GVQ3wIpfv3S8LHmOxsOkgzt0+PbNEUcfjSg9mtbHknIclMHQZNVUQnem4dvWhigjMBTOVyYBpEu6CGojMdgGozzf3r0EOF6EoasS9stS9PHhzHWVZ46Mv4u2U0jSWdLOrOpVT8k9+Vj4hkGzow3jSpUhdkJs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(451199018)(54906003)(6486002)(83380400001)(478600001)(2616005)(6506007)(36756003)(6666004)(186003)(6512007)(41300700001)(38100700002)(5660300002)(86362001)(8936002)(31696002)(31686004)(7416002)(316002)(2906002)(66556008)(66476007)(66946007)(4326008)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2htTFUxNllqSS9BUUNmTThzL2VCVWthZjR0TzlWWHhFSlFqZVMrZjk2NHJp?=
 =?utf-8?B?ZTYxeXdsYzkrNUlWYnBXaXU5cnI2UHlONmJuNUozSWw4SlNMVGNmQzI2Z2to?=
 =?utf-8?B?a0hVbTdTZmZpVTR6QXl5NXc0a3BlSHY1L3FRbFV3QzRSMlZWbVNXaFphc0hK?=
 =?utf-8?B?OVRvSG4yaTRodGxyaFRCTlhxT2JwTnNMZkVWWTg4WVU3ZjlzQ0tjNloraTRi?=
 =?utf-8?B?L21vQWlFeDZJN1lvcmJjTjIxcU9EMjNjY2VPNllJRzJNOUVkWUk0OVJaRGd3?=
 =?utf-8?B?YU1RTzI1SXdsVFBGbVl5T3FNSExTMTBueWUyY3BXSzN4WlVHUU80V1Y1WXhL?=
 =?utf-8?B?d2twbHFTMkM0NG5mRmJCSWwxdHZsaGVkdHlJUnlMdTA5em5qNmppNUQyODJG?=
 =?utf-8?B?cDJuMjJOOHA1TUtUUXRaYW5USlpGWUlqcTFCenJBZlZYbkRnK1BNQnBtMmN5?=
 =?utf-8?B?ZTVtMGtieFJDbkhId1U3M3hWQTJ2cGNPUENGalBSblVNdnlncllzTGJzc1Nm?=
 =?utf-8?B?Wnorb21QRzBKY0F0aUxFS3BNS3lDSlJ2aUhYUFQ1L1lMWFk4cmF1cW1FNjE1?=
 =?utf-8?B?NXlNcWtBUUtYS3ppd1BZelk4V1hUNXgwOStGb1FSVS9sYzJzYW45T1N1Njdr?=
 =?utf-8?B?K3VEWHBycnRCa0ZRU0xZVVZpMkxLR0RsVjdEWlJocFNGVEhoTk0yd1RZUzhp?=
 =?utf-8?B?TFB0NEpBWTRFV20ySkxNekYrTXpoT0k5K05kYjREZXVteTQzQ3R6WnJZNXJ3?=
 =?utf-8?B?V1BZM2x0RlVYMUx4NzhYV05tUGFoYTdjdCt5WXhubFhjTjZteWwrTmEzeTRw?=
 =?utf-8?B?MUdyR0JGYzdUb2FFZjJINnJJaUdKcEpITDZjRXQrbUJ5SW9QNnlCVVpmTGlG?=
 =?utf-8?B?V3B2YUZMRW9QN1dEWGlvRjNQc0QvWUhYejJBandqY2NmNjlENk5lSVd5Szd2?=
 =?utf-8?B?OWZLOGQ3NHVYT2crMWl0NTlQSmpQVllzeGE3OHB6bVFTUUZCQ1VKSjI5ZEpY?=
 =?utf-8?B?WXQvQTFwV0hldFNDekxmakx4c2RMbjl0R2lCSUJtcnJwanZVWi9ReXlSd0Ja?=
 =?utf-8?B?QXlWRmpQSE9IZ0t1M0IyRUZuUVFZRWcvQ3ErS1o3S0xoVFI4UkZweCtXR1Zj?=
 =?utf-8?B?Wk00NWVmTGg2cTM0elM5dFc3NmNNSUxsVHY5eGl2enB3bmtmRzgwVlI5UjI2?=
 =?utf-8?B?ekpLSk50eW8wVUNxZjVaV2xobHl0Z1cvNnlVOVZIMjBWaWNwNy9BVHJpUXNH?=
 =?utf-8?B?T2h0K1I4MlpuT1dBaFp3aHZCRlFVdUExS044NDBjZjZ6S2FReElFM3BPZ09u?=
 =?utf-8?B?N3RrQ3VWVVJnMUtaaDVtUE9HTFNtdy95b3Y2WmwrdHBxZEYwU2luZlpyQWh2?=
 =?utf-8?B?YWxwUkUxYUhhdnN6b29NQ3d3K1pHeUREWGVWRXlWakxyRWR4ZStmazIxWnln?=
 =?utf-8?B?dnc0cUo1UWNMbUlUbE9BQzF5Q3hiSS9OQ2hQRy9pQm4zZlFRaHZTdHViR0ps?=
 =?utf-8?B?V0hPVFdpUFEyeHhpTGEzVlI3YVBBYXhSOUhWNTlxSUFReXZITEwwcTNNcHpr?=
 =?utf-8?B?Q1NSNkFKWUFnVVhkUkZvRWJTSUNpdXFTMnVZb3BKcXRVTXZiZDE3dEhMa2kx?=
 =?utf-8?B?TkczVlVsOXg1bHVxbXNybDB2dzA0MFNCQllGTUVmTmtMeVZDczBwaXljcGY0?=
 =?utf-8?B?Qml1c2g2cjRlSzlkVi9mZTcycFhPSkZlVkptZW1SV3pFSXF0dGw3UEhybHdJ?=
 =?utf-8?B?eGF0UmNMM3RHSTh2UXV4OG9nRkk1NW5FZEk3alRQcld2cGdTMXVrTWNpNjlT?=
 =?utf-8?B?ZUFBODI4ZUttRkRvM2FmWUhKTG0zcHBEbWtBSkZZNmwxcjhPQ2gyOUN1K1pL?=
 =?utf-8?B?dTBGMmhhMFFva01LSmw5bkhVSVUrK0RlY05hZGEwSmFWRE5DbnRDWkNxaTdj?=
 =?utf-8?B?OW5WbVo2Tloyb3daTVdsampkbm5RVnd6ZGdDUjJoYUprVEloZ083U3BsRlBz?=
 =?utf-8?B?cW1QUDRweGJnVVhDR211WlpHZXcvVkZEK0JrMFU5RWQ0L0liSHBjeW8rSms1?=
 =?utf-8?B?OVZwcXNVUzdUMzhFT0c3SWZtc2tJZE1oTUw1bUdrUldibzNBd09oNDhEVGpI?=
 =?utf-8?B?RkZUUUthc2F3SGNpb1hqYU8wVTlDWitOMS9tM3QvT2drR09tSE8xa203WXpB?=
 =?utf-8?Q?NYGNPqAB4KKvwnpmmchFbFCXTzoP6iX4wbEKevcCX8/A?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc28acc7-0710-47bc-abc2-08db0f7ab8ed
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2023 17:33:16.8723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9+m0cQhlA/sPSrFXPmjVfzrphQquK5EQ3ROwb9REnJipR+FB/oEdSbSIK5m2B7Ct
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, David Hildenbrand <david@redhat.com>,
 NeilBrown <neilb@suse.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 linux-graphics-maintainer@vmware.com,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 Johannes Weiner <hannes@cmpxchg.org>, Dave Airlie <airlied@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.02.23 um 17:13 schrieb Thomas Hellström:
> New code is recommended to use the BIT macro instead of the explicit
> shifts. Change the older defines so that we can keep the style consistent
> with upcoming changes.
>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   include/drm/ttm/ttm_tt.h | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index b7d3f3843f1e..cc54be1912e1 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -83,12 +83,12 @@ struct ttm_tt {
>   	 * set by TTM after ttm_tt_populate() has successfully returned, and is
>   	 * then unset when TTM calls ttm_tt_unpopulate().
>   	 */
> -#define TTM_TT_FLAG_SWAPPED		(1 << 0)
> -#define TTM_TT_FLAG_ZERO_ALLOC		(1 << 1)
> -#define TTM_TT_FLAG_EXTERNAL		(1 << 2)
> -#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	(1 << 3)
> +#define TTM_TT_FLAG_SWAPPED		BIT(0)
> +#define TTM_TT_FLAG_ZERO_ALLOC		BIT(1)
> +#define TTM_TT_FLAG_EXTERNAL		BIT(2)
> +#define TTM_TT_FLAG_EXTERNAL_MAPPABLE	BIT(3)
>   
> -#define TTM_TT_FLAG_PRIV_POPULATED  (1U << 31)
> +#define TTM_TT_FLAG_PRIV_POPULATED	BIT(31)

While at it please just use BIT(4) for this, there is actually nothing 
special about it.

Christian.

>   	uint32_t page_flags;
>   	/** @num_pages: Number of pages in the page array. */
>   	uint32_t num_pages;

