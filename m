Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 292385B9A54
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 14:06:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E606D10E198;
	Thu, 15 Sep 2022 12:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2075.outbound.protection.outlook.com [40.107.244.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A417F10E198
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Sep 2022 12:06:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fHMhP8D3GD2GnfexFvM6RsWHcKLf96Vs81q34uBr0rVyod52xOybePlUf299/mvQiSHMsUaXgRa6EPtCTO75rdA1SjbavuorTnAaNG110gvnE8ncIoazGYuhi76aw687469BIMAps9TnMPAaGjbLJKTfoNWYYy1RJHidR7ANsWEUYDHjOlEHPj+pxIZE6zO3OSHfpvX+qIvQYiAdWPH3U+lNXFQQr6xEIlrWLnAmfQ3XIbkfdyklAUHWuMrGpZS4KY5arjE5/i+rS8lwyflfWtWfz2xmhr9EjIukf51YvYah8dxrEBkx5lG0pfJssAY2vyZgaUyOf0VaXVw2WE3jXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4vE8/XcSrydPbucf+xA9JBtKf378VKo7CItST9/3eQo=;
 b=IgjfktuNmeP/YTL40LyVZSQHv4ZCF5Ndqhj3jcZTduFn+oIex1VN3J/WeRtBu19jxkcbVdv/4c2GRsJJihwQ659jEPF2XlFiWu9QOWq+wPz7xWvV5VIO1NuRCf3EajBCx+wSug8nA9GKNYDiT1jFEjrrjDKzUwdI5EWZ6EC4awCnsKv/3zt+L2ywmfLb6kE8BOJV3XZisX5lQseu88R7OUzow2wODd4xlSPDlIMzuzwdki/wMP6U23PuacKVrZDjlRQHCRKmMrYxOPytCedaMAnH735SXRjnr0ZYK4xz0hB0thUGhOxhrrK8jA4TpEihOPTOYkMnT7UupoeOwLZmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4vE8/XcSrydPbucf+xA9JBtKf378VKo7CItST9/3eQo=;
 b=5Phj+Uy0B83aip4nF4Tkz7dxtGcDEd1OHerstvDEfxIXptF48rKte4jNldKZzO3CrQP5BZXS32rHGVq/gQhrTC2sdOMjT3wLTiopg39vweqbhoj/E9xqOBrJFbuiU79FESPtNO8mN0/aJapYrlvUXj2up3pAwK8n8nxCnfG0+LE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15; Thu, 15 Sep
 2022 12:06:26 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::653f:e59b:3f40:8fed%6]) with mapi id 15.20.5632.015; Thu, 15 Sep 2022
 12:06:26 +0000
Message-ID: <cbfbe832-db39-8681-239a-75d612111394@amd.com>
Date: Thu, 15 Sep 2022 14:06:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 4/6] dma-buf: dma_fence_wait must enable signaling
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220914164321.2156-1-Arvind.Yadav@amd.com>
 <20220914164321.2156-5-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220914164321.2156-5-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0123.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 44e5e829-5ff3-4627-f759-08da9712b6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UZWn2bQ4g153ano4ZsKRcwYrO5clqtX4FMmdb6dLKXGXbZHQU5OVovQh2L1avGC48suYn7W+FjG7fdz+1ReEQdNaYVjzlsD+tj6IdOf6oymanE8QsDesKOYbyx1ig1WSBkxXquiyWhuWzsPOLfnjqpTchh477sfeexQJIZ00uuQ2BG45B6YE7pc+wRGrsZYc4rWEfvk+1K5NcY6q0z98K8RLcJtrYJsT7G3B/TPws2faeOL8PX0jIzTEG0TwoVPf4iCIi6Tn245gjUdL++8/Dapwaegtr4wfynYczycEl/g7ddzN/DB0xueJy6U12X83KpQ9Z/qjlZiv8LUQgdPyJLfCEI94xpwzLfczy/lw2PtQBOhniIToK624U/0prS/bkPDhmetdqKV0Rj86cwgGozDmQZzeHg6RuwAkjt4Lt7H4bRK5skZhi9e+BJeT10eOH8hhEIqylpRyrvFJg2j5jCTL++XL+GL5HFOOIy/oo953hwXoA9DKvAgs7hBuHaAogTmWOO/rFQydyYxlBSyhao8NOUM++G37VBM8A75owPaOCJaB+Geb/pFbtbxj8SndlXe3m7x+YPKZapI3gdlu6/6vpWQxTjkQPU+XrnGlmouCcnPAFwoRpk6pwDGwSHsgQJGiI19GYQmcSrUMzKrW+RK2mbzJYsKob6nG1JwSqApSsOIQF5lRSmGRCyJIeiQqiLHPDlUpJnP/fdWrruD946S9Lbg52cxl9ZsLPN3lZ78ahe2aVyiME4LntEJ8OE10xwACNkwIGRGUS1pRPQVX8fQ+BmpgZLQVzl8ZXo55wH2CHs3xDxt5N64DkF/N/J8k
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(451199015)(186003)(86362001)(31696002)(6512007)(478600001)(41300700001)(26005)(36756003)(5660300002)(2616005)(6486002)(8936002)(83380400001)(316002)(6506007)(6666004)(921005)(66476007)(66556008)(8676002)(38100700002)(31686004)(66946007)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NU9IRGsrNGtZZ2NVMXhic0N6STVlTTU2N0xMM2k2OEp5em1iREtoVk1KcnBz?=
 =?utf-8?B?YnZNZFJsWHZNSVBvZmJSd2daZTRmZFp2dTBtZ1Q1QzFNMWtxbmczRnNWZ0RE?=
 =?utf-8?B?ajUwQnYxUzhEaDAwWVNHSmRDekdzRWxBYnVScHVLRFV3L0lSczU3S1RpdUUz?=
 =?utf-8?B?Z3hBY1VKc1JWbGtBR3hlYlJVNlFMWEh4MVQxNjlWZzRxN3BxR1U2YmhLQ3Fm?=
 =?utf-8?B?R0k5ODFDMEh1R2kydEZBOFdIM3dMREkzQUlPVFRtb3JiODFKd2RxKzl2YVFr?=
 =?utf-8?B?UEJGNm5JakNhSXhEMW81cGJpc0ZrbHcwZWg3eUl0MDd3UzM3dUJBcE1GMndj?=
 =?utf-8?B?bFZtTVdFbTlFRWV0ZnFEUnRLcGVubys0TVE0NTROTkt2dGZKbnZ4YlRWK3R3?=
 =?utf-8?B?OUlWQmNpQ0pVMG9mRjRpM3I3c1YySGs4MUNHZGp4RCs1emNaRERVUTMzNElo?=
 =?utf-8?B?M0d0Uit0bitrdjdjcWJEMy9CNnQwaG11RXROZ2FMMkg3cWJwc1NtSFlnWE9x?=
 =?utf-8?B?bnJwS1d4UUFIdVpuU3BSK29mVUlIdmo4UmlkRFM1eVJzT0IwclpjTmVLdG9i?=
 =?utf-8?B?N0QwY21kQ1NQdzhvSmlHVkpRMDJEcHZuZnM2RTRrU2I3SFY2cDFycmV6YVpM?=
 =?utf-8?B?TjdhVzQ4WHVra2dUMXFWSWx6NEhwQ2ZhbFhZODFySmM2Z2szb1c4OG9QVEd2?=
 =?utf-8?B?bFk3Z3dYMXdNclVranI0My80enNmQ2JYbzZyUXZUWXZsUkJNMGtYdldZRmxq?=
 =?utf-8?B?cmZEbmVOUDMyY0I5WlhyMk1VSTljNDVTL0NNVW5WU2t4QWEyeXBkWDRDWUJJ?=
 =?utf-8?B?Q3BXNjBiMEVDd1JzSm5TNjNtMEw5M3o2RjBydk5TbUpzQ3NkM2V3YmM4TlQ4?=
 =?utf-8?B?eXAzN0phTkZ3ZkcvZ3d1T0p5L3NTTEdCbHhOeWpZbmlvbnBzTW9BMFZyS2E0?=
 =?utf-8?B?Q1VTZFZDZkN4bjNITDRQOUl3ajVHN0tud2lGUE4wb0NZNnJVTDhBMzJTYWxF?=
 =?utf-8?B?WFZWYkE3VTZuNVByRmJNc0RxaTBnM25KMFBSVUZDMTdER0JMeUhEQlB0ZVRW?=
 =?utf-8?B?YzZKRmdSM25HWm5iOEpXd1QvcVBtWnMrRXpDSUhtSTczVGR1LzRrZWVkRmFP?=
 =?utf-8?B?OGRtNmlyNStWSTV1dG1ZTmtBRU1DMjF6dWJhMjIyRmZYL08rbFRoeU84Z0dz?=
 =?utf-8?B?ODlQbmJOVmRDYUxaRlFQNU52eWo2SEF3OXc4NUNMaEI0MklzZStjVXhVbTdW?=
 =?utf-8?B?RWY2SVhSbmc4MmVRTVE5dkt0TktoUUZmY2dxZUwwTzFya3RZWklHYzRMVHZJ?=
 =?utf-8?B?M1ZDdEFHcSt3M3ZOTE9zdUtyV2ZhSnFsWUwrMWFrU0VwS2lLaXZTb0Rad1gx?=
 =?utf-8?B?bktoUWVGZ2FZQzlTc1lvZDBFZU1GMmtTMTlBR2Y4czY1cDFMOXpsVHZYZ2s3?=
 =?utf-8?B?ZHQ3Tkk3cklZSkpTbEg2UDNtczdtT0VuWUdwZUJLZEVYa3NSNHorUWs4TzdD?=
 =?utf-8?B?eVZkUmdTMkhUSVhkYTgwOFkvOVltTlc2K2lmM3kzWW5Uc0t4NE5DdXgxNDFE?=
 =?utf-8?B?MWdRdUpGalFaOCtSNGNRQkg1OFZJS1A1Mktkem1mVVBmY2xETmt0MCtBbHU2?=
 =?utf-8?B?Ni9YUmhCM2VNZXVYS1VWZDdYREh0QzZMNmZick5lcTJJdldLeXh5b3d1bTZB?=
 =?utf-8?B?RnhZbFNOc204ZWx0NE1PRmdMdTRuME44TjZ1WjRIV2JYdGNxKzFseW1hOUxq?=
 =?utf-8?B?TzdVak5TajI3WFRqaTNjanJhU093b1hyYkwvb3RmaFZoYnZSSGRyS3RDdnpF?=
 =?utf-8?B?Q2JSSEJFRm8yTm92Z2NOVDd5OUVsSGc3eUFvZ3llQWlCNXZ2eTBGUnVwSzJX?=
 =?utf-8?B?ZEFGZUdMN29zUms2TThQTWJnZVkwTjQ1b21WelRCdmVFeHgzblBzcEVudnhM?=
 =?utf-8?B?Szg3cDVzZlhaZ1l2QWNXbDVMWjlzMXdiWis5RU1TSEgzdmVsbWdtMzJXM3BZ?=
 =?utf-8?B?b2sxRW92ZmtDN2ZiQ2RDYlJKT1Y5RGZlOEZvZ0ZoeXNoWldScEw1YWxLa2dt?=
 =?utf-8?B?N2FWMkV1UTRTM01Oa01wUTlRKy9abGlOS0ZzSVdLMUtCMXlodDk1cTJWRTJI?=
 =?utf-8?Q?GQrLVJQ8QLcl6K+PsNurYZWwb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44e5e829-5ff3-4627-f759-08da9712b6e7
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 12:06:26.3644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgaUx13/v/UAqcxfAbJV/Tg4wrPzP4nfYxyOj5K32K5brl9s0VsoImz+gSnIIPwi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

Am 14.09.22 um 18:43 schrieb Arvind Yadav:
> dma_fence_wait() should always enable signaling even
> when the fence is already signaled.
>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>
> Changes in v1..v3: This new patch was not part of previous series.
>
> ---
>
>   drivers/dma-buf/dma-fence.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 645c158b7e01..a5fbf1c1e0ea 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -508,6 +508,8 @@ dma_fence_wait_timeout(struct dma_fence *fence, bool intr, signed long timeout)
>   
>   	__dma_fence_might_wait();
>   
> +	dma_fence_enable_sw_signaling(fence);
> +
>   	trace_dma_fence_wait_start(fence);
>   	if (fence->ops->wait)
>   		ret = fence->ops->wait(fence, intr, timeout);
> @@ -771,9 +773,6 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>   		goto out;
>   	}
>   
> -	if (!__dma_fence_enable_signaling(fence))
> -		goto out;
> -
>   	if (!timeout) {
>   		ret = 0;
>   		goto out;

