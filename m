Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802053E4A7
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:15:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DD741125DE;
	Mon,  6 Jun 2022 13:15:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2069.outbound.protection.outlook.com [40.107.102.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3061125DE;
 Mon,  6 Jun 2022 13:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiZPKfIxm3XrB36wBDvoNMHflDGHBJrkYLBIiG9TgjsrURnO/VtjIfRCswdbTRoAsEn4D4ypZNy4JczcObYcWMliPQjQM1/4V+/SFSmIqxsQJ+rH0PEtPd0IrfNolN2cbwwzbxVd3hBQ2FRWkQZs39f5cTHFc10XsesZAPWDEOMp5/MGB98Ak3ra/O1A4Ll4Nlb1k8Z8zIJkQYcZnvyxBAq0P8rGEv25SXZBXI24gXrsrnFLyideBvPN9sdoyByw1rgyxcRPwI3mCPD1cIPZTlFQIEUWtwkgSliwZzl7gs4n0JYnVZlaYnd+5bwJFgMRfkDsAXohlEDdphhDwMw7kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0TvHLgjOH+hEw4SlCVkcb2n8fc62Cka6ThLev1jXxEA=;
 b=PG1eKINzejA9ltp74eaHyaDBMOjq9v796vf6A2X3VuAYuiMtLkdouVVlSLk6djwhjv7dM3z8fdjy0EGwQFQxEop3vf+xvcR/4xq3ifjLTrKd9uZlD5DSGR4D3iCGd4SBebg7vX9zJt80fnBTji4FLgoIZn64E/glmmt0M9UVD3s126dgVPaLks09Z19dhjjnoaVdkx73I2tMg0YHKdH5mmbanqe9P1ijnoiE43TpWV0Hv3s9usGSDWEo9riCVku237CtsC0IVwywM+MUSofbOme1cWxcSPJDpStuF/6WrhxfVr0eQx6NQuADVch1gaBIboGAIw8DnlEXQX2M22rzQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0TvHLgjOH+hEw4SlCVkcb2n8fc62Cka6ThLev1jXxEA=;
 b=Dd4/h72EWqMGKoeC1JX0mvPN1U+sq8j//LNFg0byUHCeR/2VcRuoQ5q7jVWJq1bYLDYm5qf3qCsJxkXYYZGtoAJEXW5JNX1u3RFrOpgd1JBMMUIsI5mlhFj7Zl2TMp1rBIvefDZlH8oV7iQE70yiGuAeXFTH/CBbdDmDMwpKsLg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR1201MB0104.namprd12.prod.outlook.com (2603:10b6:910:1d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.17; Mon, 6 Jun
 2022 13:15:44 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5314.019; Mon, 6 Jun 2022
 13:15:44 +0000
Message-ID: <91627755-c7da-960e-eaac-6d6644b71490@amd.com>
Date: Mon, 6 Jun 2022 09:15:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in ttm_device_swapout
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mike@fireburn.co.uk, dri-devel@lists.freedesktop.org,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
References: <20220603104604.456991-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220603104604.456991-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0075.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8d9fdc95-cd66-4095-2e7b-08da47bea9b1
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0104:EE_
X-Microsoft-Antispam-PRVS: <CY4PR1201MB010451D06A3E8A6A61080ED992A29@CY4PR1201MB0104.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3m5DxPa/MtnDdqLJICcwKU6xqROrOWDlHgGujtbx7s16TvtlcoOIhqAbKW1ZDuYiXYdyGYSi93jP4KL7Bc83khsaCWqFK09VNe2XmzzgfsXDAT8+z5dyJCWXVuztg05iALLZ+ANATY/csKUzPKDwhW5ZNRAEHCWFcC9HGFZzfFceK6M+hLUr+uCaD5wzor3tlwD+8nEsLOvsZeep4NvjgnDpdIYze5A6wa99wfa2BzGxEYyj28glMFWMUpiQeg7ZiSRbAaDucJowQ4JnUREPHrBdeWSZXn/KRH2uz7tRMUhUKmZDDIVtS/ckPsly+aIWa6+W0eWjH/crvVSQohDWhOEgxX1CWdOLO9Xe5vlLJQ4QT7UZ4vHHiJoja3Pqc8MZZ8YYUQa+ZDkEVy+YaOvdBAiEGN/sQDg3KCGahgZyTORQsCPVz0Nu43+xx2n5cyx0Cnqv9ypl1MurAeUzXuZWm40WDZ2gYGw+vNAl7rypIDXSHC0PLJwWMN3oH2diORxkPO2EL9eOqmQF1sVDUIiv+mNdCu2aHdX1exsGC9S4lYELprsPBuW/H3UjO1cQGtBfaYR4hUANdt5UqhhkX3ZEDcSMiFyMBB0WrcAp26zhucYGS5KoI49CsAno6we/8urYKPNCXaqrbiJZ9sVX8RhyMMG8OZRsfLRP7EGHU+7QemU1Nc1PA3R9mV+rn7zYWX03XsSQAH++KsXqfKicia7f/Qwv9h/EtT5BeNQDZqJdkJzZ+VQElZhzZVBP/pIL1ua9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(36756003)(31686004)(66574015)(186003)(2616005)(6486002)(6512007)(66946007)(26005)(6506007)(66556008)(66476007)(110136005)(8936002)(38100700002)(44832011)(86362001)(316002)(508600001)(8676002)(31696002)(4326008)(5660300002)(4744005)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUdydy9ENHJYUEFVWFF2MHptT2FnSXFqTkh6QWl3MitVTG9lemdrM0lEUGxy?=
 =?utf-8?B?N01CRzc1c3hEQTY3UTZNQ1VYdVZqbER6bkZVS285Nk5hZ3A1d1JXbGZOTldk?=
 =?utf-8?B?WmlhbnJzUEZaLzU0VHVuZCtLcFpYemxIRSs3VVV6YitneC9lUlBMY0w1Q2xL?=
 =?utf-8?B?VTg2TTBEQm0yOWFDWmJ2MlR1UUhOTFNFb2R6MnJPYjZXUUpwU09mOFR5QjVs?=
 =?utf-8?B?YmlrSUFnSEhUaDZTaU9PZnZHTHRyYWkzQ2VMOElDQWFmbnR1a2Q4K3F3ZHpR?=
 =?utf-8?B?Q2NTTnBvQkNMdEhpNU9RNzE3QUg1NFhsSUsyWWJXbEtJREZOa3Y1WWtQZy9T?=
 =?utf-8?B?dnE0dytCME5YU2hHV2FKZk1ZUjF2dDVoRGFMcGdzVE9aMEtTeTRwYzNmdTFF?=
 =?utf-8?B?UHpjOGNrQU52ZEtrSVVuQjNMQThqYnN1MSt6cm45ZjFZVHlFRUFiNCsxUStL?=
 =?utf-8?B?NVM1K3lKK2NwMS9IaUNSUHNNNkVxSU5taG1hR24wQ2M1MFN6ckRiZHMrQ2dq?=
 =?utf-8?B?UjN4R21WRjAxNW1sMGt0RVZGT29TZ3dTYk1HR29ESFhYMzduSkNYZ1Q0WGVx?=
 =?utf-8?B?YXpyelc0K3dOaFZySTRxc1lJSE9uTlovcVBxVHR2WFpIM0RYd0lURUFiZVJM?=
 =?utf-8?B?K3prVVUzOTN3NGVXQ0dxbUVHTyszSGtNb2dTdjdoSXVtMmZpejFCYnRxcmpu?=
 =?utf-8?B?bURXT0o4UWs4WE8wc2lBRVRXMXY2aHJGUkgva2krQzFBVmlDZDhUT1ZYMUR3?=
 =?utf-8?B?RnpCemZ4N3kvV2FRcFpWOUZIK1JXTm5ISlFGK2FadFNtNDVGN3VFaGVOM29j?=
 =?utf-8?B?N2dyNTlwWEJubWY1ZmJYMlBRSFpKTEdWOXl5dFJoTnBENVlsa3lCTkY5a1Jn?=
 =?utf-8?B?VjJLa0Z1cE9UdHRIc3JTdTRWMzcvSWdSWHdHTGxoQjFhQmJSdjlRZm4wZkE1?=
 =?utf-8?B?d3djd3ZSNm5QUldwQktwaEtqM0drMWdOV3RyVnBZajNReUpzTFlaODQ1T3NY?=
 =?utf-8?B?VDBhSUpQem5ldkJtem91cVQyblNrem4wU01DZjZDdjc4TUxaOW1lT3dWcnNp?=
 =?utf-8?B?VktBeXV6dEZMd2wrQTdTbjZEWlpsL3hGTG5XaXJ5eXFWSkxVam9FZ1RDMmRN?=
 =?utf-8?B?eTdLamlxYkxxajlxanpvNUJFcHFESnF1blRzNlBaZjB0NExXbEtsMlZQN1FN?=
 =?utf-8?B?cmVhQ2p2Ni82Q1hNaXluSWxidkM2Ym1DZFNEU2IzS1ZQaUlGQmNMdGQ1VlRi?=
 =?utf-8?B?L1dZZDRLd0JXeUIrbVFtS1BHRWs1OVZZVzFuM05peXZLTEM0UzUvYk92emlr?=
 =?utf-8?B?MzI5Q0tiZ3ZocGxBcDFvTDBOcnFFZHRWZFpsRUl0WUlGNklFdTBBV1hNVit4?=
 =?utf-8?B?US9kNXdmcFVEck00MmJVLzJTMEo1bmFKMHMyK21ZWGQzU1J2ZHNnNkdNMHFj?=
 =?utf-8?B?UGFyYUVNQXV1TmxGeHEvOGQ3emFnRko4WjNEeE5tY2ZFRUcvdmx4WC9RREk0?=
 =?utf-8?B?MWY1VkdRMFNjMXJaUVZHN1U4ZkxpTUFwZHNXalMvcEZkWTdIcWZTdUVmaEtw?=
 =?utf-8?B?UnBKN0VNa3BILzdEM2t3dFBWSkdXRlN1a1VUVzRFdnRCdUlPaHBnbVFVNTVa?=
 =?utf-8?B?S2pTVjFjYnNtbzdMZDlzMHhRYXhmRGhCNmNNdVZaQ3pIR3A2R01yQkhxcEc4?=
 =?utf-8?B?aHN0QlZHRjF2QzFqWjhxKzZDbEJYZy9JWEVxRGl4N3RqNk9taEF6UUxzVGF3?=
 =?utf-8?B?REdVY1pYQkx1a2ZMaEJPbXdTbytWTGNMU0ZjQ0NTWmc4TytGSTRJUFZ0RzJv?=
 =?utf-8?B?TDJyajh5YU1xUUhlbHZwYStKbGJzSXpQQkZvL3ZnaTJuMFN4RlJzL3JjWEF1?=
 =?utf-8?B?ekQwYmFSejdXaWZWdFRGYXdSVWcyUG9nbzF2b3V2ZHZsUzI1ZGx1UDBYbHBP?=
 =?utf-8?B?NjErYXp3U0FuTGs3V3lGekJ0bk9MT2tnWjdNNUtwUDZhTzlBZTNVUytNclJs?=
 =?utf-8?B?WGJ0cXJJT29rYkkvWUM1L3JmRWpNcEx4Vkg2Z1g4QTBwQjBkUVhscVFZQUFB?=
 =?utf-8?B?M0tTOXdPZXNscVpEUjBLV1c0S2RDYlVGVlNyQjRJY0V6by9neUhobWdCdTl6?=
 =?utf-8?B?S2tmcGMwNmhCVXhuRjdza1NSNUJOWEN0R2lqSWlUaXY3SmgrMGZ5cVUyYWp2?=
 =?utf-8?B?cXU1ZVZNNkQvTENSV29aLzluR0N5azIxM1RiQmtpcEx5ZEE0QjdTYnRiSWFH?=
 =?utf-8?B?eS8wek9JRU1aSUkxcEt3U2dqclFzRDMxMjFCL1VCbTZ1bFFBbkJVOVdzdXVh?=
 =?utf-8?B?VWhid2p0ZGwrK3VEamdFTXpCUGtRMUJWNzUyVWNiNHYxWjh4Rm9JUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d9fdc95-cd66-4095-2e7b-08da47bea9b1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2022 13:15:44.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EVelgUiErgtBHZD4Sm3IItfPlK0nNk/Y+A28AC3zovMTTOal/vF0Pq2Z0Bdn3IaE9w/zbeEKOWPn7CO6Ogkbyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0104
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-06-03 um 06:46 schrieb Christian König:
> Resources about to be destructed are not tied to BOs any more.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/ttm/ttm_device.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index a0562ab386f5..e7147e304637 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -156,8 +156,12 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   
>   		ttm_resource_manager_for_each_res(man, &cursor, res) {
>   			struct ttm_buffer_object *bo = res->bo;
> -			uint32_t num_pages = PFN_UP(bo->base.size);
> +			uint32_t num_pages;
>   
> +			if (!bo)
> +				continue;
> +
> +			num_pages = PFN_UP(bo->base.size);
>   			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   			/* ttm_bo_swapout has dropped the lru_lock */
>   			if (!ret)
