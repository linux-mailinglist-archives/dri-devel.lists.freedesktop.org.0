Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E9E4DADEC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 10:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9417289DB5;
	Wed, 16 Mar 2022 09:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D4E589DB5;
 Wed, 16 Mar 2022 09:54:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EMBVHyBvOoeyzttNd+PSCywxHjOvfJtIweKJ0Fq+nB43Xo0mriNQcaElV4ohj6n0tFSpxlt4XkGJfnTOTH7qTq3knrnbBOC0ItizrU4lnvcMHyKPGPn/e748QJ5O2ftxxXPmKNNNJf3RoNSJmq5tilIy2ia1RTP4gEgMlmCWs8f7YC1YvTrxAKedvR+2EIfqK6bRgTFqoVYzRxj5C2sfM/x2WG3Y0IvNqiKAy9ePoSfYFzU0YEoOwWkIIEJ1alwSkGw0JazzWPOeRSfFRP4xw88njjQy0iaH9//0uWj2P2Nzpq0fxdxSDq+bhFep82Myc5aSkfj0y2k5o0cNQpFMVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EqJ5CrxpgDwc4DNEXbzsXVMOWfhD+eQk6wdf9P0npEc=;
 b=DtPq254kZQ2cjJQT0Yk+r8pRAbZKdWp7pTyAn1cWRIYq9Tp8FGVHGPgsVe1bGK+80fFI8g8I8rnXT9ywEK5lp0AISUjYOXRtnR1Fen3oybH7oRK8QTLWzWkGA1Zfi1P0K0VHctPR6h41bvImuVhBgMYCZ4C1yyvqeoI3IH80JHxt0zt4v3fIlBkFslvd3jjkRmtjxc25n2inzrw9qQZ3Im8et8CMh5jp6oL3EMx5PSvrNGVHAIW0BA1BUu5oSPztDVeFEX1+dFpwIcIyfMkS+Is72tkDTuAXokc+ENFZ7+VqgBHoputpC9a3Gy7xN5A66eIz+dtcEnWk7cq6364n5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EqJ5CrxpgDwc4DNEXbzsXVMOWfhD+eQk6wdf9P0npEc=;
 b=u+2agWzS/5DhLN4TbdSWazcRFBAgGzCy5eCofJYQ1XhxIhAaIWfeCRZ/bDN3iBBo100RGAlswOJM2uuA/z0P6WIQKQ/zWpmagszxvgxB3pxG0IdEm16V22DpddBA+vPf/1gIMXB7Xumro5jIQ/9IGega1ZoLTQwQrs5alpAT90E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CY4PR12MB1509.namprd12.prod.outlook.com (2603:10b6:910:8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.24; Wed, 16 Mar
 2022 09:54:56 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Wed, 16 Mar 2022
 09:54:56 +0000
Message-ID: <2918e4a2-3bb8-23e0-3b8c-90c620b82328@amd.com>
Date: Wed, 16 Mar 2022 10:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 5/7] drm/ttm: add range busy check for range manager
Content-Language: en-US
To: Robert Beckett <bob.beckett@collabora.com>,
 intel-gfx@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220315180444.3327283-1-bob.beckett@collabora.com>
 <20220315180444.3327283-6-bob.beckett@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220315180444.3327283-6-bob.beckett@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0025.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d4c10ee4-25d5-4506-321e-08da0733069b
X-MS-TrafficTypeDiagnostic: CY4PR12MB1509:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1509D036BC02800B2D25CB7583119@CY4PR12MB1509.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cwi0KLbH6iw5olas+jMeG7tgeX3LnkNHs0XyUSvpLL9y87fGKwPn+K2R/VdeC7EChOb0mW5yJ7J8lY/W0YCXFIeQVYkgJoxYWa6hvgPMNZVcMNb9GcYdHh4TO5/AlLSe24HMaTEYAK4uiGEb4lgAihi3RTgtivYuYtAq/WAmWTNZRRqOgiERzprSECKX8jaZjApP2zpcmlnaaAH3fuIqX67DCvWOBR05Kpipuw6GopBYe2FgeLzHv+CenbrNXk2NiC7pQi2/bqOPRgUS6HPa2FQIdzbTu5zRh8+QXZPzrsQ5oZbflNeJGhjcOC9p8BOPMP3sYwkOWms/QONiVyY+3C44VEITDg4yiBdUT95avbT/NjebH5bPZtP++YQH37ohOKRBuNs45V5v1r4y/BLAzWFGBKlSK1B3JsMnrh4HCtbIPyfhhnus2/6MvT0L3nVQ8sMSk+aYTyZuvT8+cyFYjiDTOVOqa0wae3Nsd0/77jN/qZwFs9BS5nEux4BQ0lBaYM3V6Ek1FJIxGm5Kp3ARccZ7QtmsuILc289XaGFpjbgQD3tSWo8oinbM6FAET7gJrrW7YEpHDoMobbHZOHSQuJbiQ/e/sLTCyrYCuYhI0UxmyyHZpzKtLlRZNwRbSIhhzBI8mo+JIb4xTIj62bbFBHS1967HMoAsBVc47V9wyFHvU96SNRtjljqym5XGFSM0lRNsoUM10LarIpgqKtW0cXb7IaWq/yDWrqMZzhHWBN2eBtjyXuLdawYF2upV5CPV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6666004)(38100700002)(2616005)(8676002)(316002)(186003)(4326008)(6512007)(110136005)(86362001)(6486002)(2906002)(5660300002)(6506007)(66946007)(31686004)(66476007)(66556008)(508600001)(8936002)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QnFxMlhOZ21TazNBT3ZYQlhRNlY2b3h3bTFLR1ZESGR5Um5MRzNnSGh4RW1D?=
 =?utf-8?B?N0ltWUVxcDVxUlZTSzF4RHFIcnZWVHBPenZXNGJMMVM3dmptdmNxZ09jSE9R?=
 =?utf-8?B?di80L0M4UTRWbzB4QWEvSm9mREhGbU9ORDNHVnhaK0pnR3hWZDJ3dVoxUFJU?=
 =?utf-8?B?c2ptR2RYeXBkMnliY3QyZytGSi9KZ0t6c0pjUklkRFo2YXJQNFo1Ylk0UzlC?=
 =?utf-8?B?Q21VSnVpWTNMZTE1Wk1yV1FDTE1NV05rc2Z5Q3RZZEMrcHFyRGdVcWd6R1Rh?=
 =?utf-8?B?aUhKQ2pMRzFCNTJpTU53V1BYOE1FdmJ1U0ZqdmI2cm5VUWNJcjhtRmkvN1gv?=
 =?utf-8?B?WHB5NVdvM2E1SU55YkJWNVR3NGpjcUI4ZEM5d0xzL0U1NjRHNEhJZlpGemhy?=
 =?utf-8?B?TzF3T3BpQlZaMGlWM3hjYTlZQ0J4K2lCb2FyQVRsc0ZnTFhkdldXWEtwZlNM?=
 =?utf-8?B?b0UzdzJMMHcrRlhvRTNzcWY5amZ4ZjVDSTc0Q0J1RmhTOUgwRlVTdGkvZWw2?=
 =?utf-8?B?aXlnT1VLd2RIRjEzNk9Ldit6RERpZGhlcEpFMytVaXZCQnl4NHJrd0RYWlEv?=
 =?utf-8?B?SmFPOXphV2hYcktVa0NXdndoQUtEblpIWHl2TUZ3V1pxem9RUjRtRjZkakx1?=
 =?utf-8?B?ZEhRQ0lLUDllZ3paVFZ2TmtqeVVpTGRnbjh0OGtEWnR4VUxhRU9VZm1TUEJs?=
 =?utf-8?B?U0RvVjh2c1Y0aDZmdndLZkNGK2JKekd5c1YyOFdXeTJmaUh3L0ttWm40bUdZ?=
 =?utf-8?B?dzhuZFFWQmQrUnd0QVpmQzkxTHEySlhURGdMeE5BNHgyYUFza2laOExFcUdE?=
 =?utf-8?B?a040bVVicHNEdWF6akMrMEJhdEJseGh2K05DRWNBYnkxS3EyanV0UTZpRXQ3?=
 =?utf-8?B?amM0QmR2b0xmMGxKQ3dNNHNRZEFFSGlnYWN2WkgwRGRHc2hsSDBYZm1rY1Zl?=
 =?utf-8?B?TVRRaEVmbkI5U0VIdnZ3dDZiWGMyWXVLdzdQU3U3L2dwcDFERjZPdjdraTdq?=
 =?utf-8?B?dFZkSGFhSHFYQVJMRjAzZFpNMnY3ODBYVng2Szl6VjJhbldaNFpnc2UzMlVR?=
 =?utf-8?B?dnVpTjZhS0ZhYy9SdTBzWVd1cFo1T2xGSFlhQXJCaStLSXh6ckxMTmdmbDR5?=
 =?utf-8?B?bDVIZnV1cS9TdXREeTFBczUrM0tqejQ1UVk1NzgyOGNWZjQ3VFhmQTVtdXhh?=
 =?utf-8?B?aTJPTG9Db0FGSWJkWk91aFRQdnUxK0pRdEsxWmlEVmVtYmRqcDAreUhqYmJP?=
 =?utf-8?B?cXE1cDQzdGU2RlhhU29mcHNYSFVVNjZtYnhXSHlOOEVwcWF4U0xYcW1SOWI4?=
 =?utf-8?B?S2FWajc1Mzh2dTdFT1NpL2hNYmRFa1FxTytRRjdPdWpQMjdjZjFLQldaOXN6?=
 =?utf-8?B?dGhBN3FucVRpUGxNQkUydzJaNjZQSHJBeHpaVUNKcDJLREU4TldSNERwSk9K?=
 =?utf-8?B?eUtvdk1KbEs4emJ0TFdlK29Oa0VsRVE3cDFCSFdFaktSdlE3Z3hIZ3FtUmxI?=
 =?utf-8?B?M2ZUMHhkTGlCNEkzemsxMVJ1aVhGYjhKQUNmSGVXT1RpZ3psR3hlM2pqbC9Q?=
 =?utf-8?B?Y2kzb1FGK3g3d0FJZ3VxL1RRWDdMTzFCb0Zob0J6UUg3UEVxZHpjN3l4NkdG?=
 =?utf-8?B?OGtJSnY2dFo2R2p3N0NoQjBvZStjRHc0dXVZVjF0QmxYbnNkbUdId2QrLzJj?=
 =?utf-8?B?OGdOcnI3NkFGMkpLdmZwMXVhQmxGOS9wTUcxUjhCalV5UkRFU1kzMGFmU2hY?=
 =?utf-8?B?YmtIdnhPQW9Da3N2eGpDVjQ4ckZiTGRPRlpERi8rc3k3T0U4NnZNNnhHQnRW?=
 =?utf-8?B?WW4yUUdRdXpRWThhb1p2RWg0MEk4SkNXRjBjelZDMlVWOUhIMXh2WDVpdTNH?=
 =?utf-8?B?L2Z4ZzJzWWpxMnUrQ0ZleHJ1NGc0UHNQbSs4OFhKWm5YZ2REcHRaRS81bzc5?=
 =?utf-8?B?M09zZDdCQkhVRldoYnhJSmhxVGxUTUhhU1N6SnNESGRYNnBNSllLcHFuOXlR?=
 =?utf-8?B?OFNPWDZreEZLcnZFK3ZySEZyZHBTZ1VXTS9mZk1IellwUmZPLzBwWnFaMUIy?=
 =?utf-8?Q?CnC0Ah?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c10ee4-25d5-4506-321e-08da0733069b
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2022 09:54:56.4250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CBo+6xtv5fN476uLB5tPQTXWYtF3N/JWmq81SOcSa94ceTuG7t7KYWI4+ONvjMxk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1509
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.03.22 um 19:04 schrieb Robert Beckett:
> RFC: do we want this to become a generic interface in
> ttm_resource_manager_func?
>
> RFC: would we prefer a different interface? e.g.
> for_each_resource_in_range or for_each_bo_in_range

Well completely NAK to that. Why do you need that?

The long term goal is to completely remove the range checks from TTM 
instead.

Regards,
Christian.

>
> Signed-off-by: Robert Beckett <bob.beckett@collabora.com>
> ---
>   drivers/gpu/drm/ttm/ttm_range_manager.c | 21 +++++++++++++++++++++
>   include/drm/ttm/ttm_range_manager.h     |  3 +++
>   2 files changed, 24 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 8cd4f3fb9f79..5662627bb933 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -206,3 +206,24 @@ int ttm_range_man_fini_nocheck(struct ttm_device *bdev,
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_range_man_fini_nocheck);
> +
> +/**
> + * ttm_range_man_range_busy - Check whether anything is allocated with a range
> + *
> + * @man: memory manager to check
> + * @fpfn: first page number to check
> + * @lpfn: last page number to check
> + *
> + * Return: true if anything allocated within the range, false otherwise.
> + */
> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
> +			      unsigned fpfn, unsigned lpfn)
> +{
> +	struct ttm_range_manager *rman = to_range_manager(man);
> +	struct drm_mm *mm = &rman->mm;
> +
> +	if (__drm_mm_interval_first(mm, PFN_PHYS(fpfn), PFN_PHYS(lpfn + 1) - 1))
> +		return true;
> +	return false;
> +}
> +EXPORT_SYMBOL(ttm_range_man_range_busy);
> diff --git a/include/drm/ttm/ttm_range_manager.h b/include/drm/ttm/ttm_range_manager.h
> index 7963b957e9ef..86794a3f9101 100644
> --- a/include/drm/ttm/ttm_range_manager.h
> +++ b/include/drm/ttm/ttm_range_manager.h
> @@ -53,4 +53,7 @@ static __always_inline int ttm_range_man_fini(struct ttm_device *bdev,
>   	BUILD_BUG_ON(__builtin_constant_p(type) && type >= TTM_NUM_MEM_TYPES);
>   	return ttm_range_man_fini_nocheck(bdev, type);
>   }
> +
> +bool ttm_range_man_range_busy(struct ttm_resource_manager *man,
> +			      unsigned fpfn, unsigned lpfn);
>   #endif

