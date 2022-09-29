Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2EE5EFCE4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:18:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49D2A10EBD7;
	Thu, 29 Sep 2022 18:18:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD51010EBD7
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 18:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXlHo5sBD1qFn7Kzd7p0X1VdiOVqohBtTTc5pbw7RcI1f6mxW4iBJUDV7l1wvE++3mIwPIaTwuAAkhZYHk6xRNYhipEd5TvMwf+7dv8VANY1A7MTcqZQDiO9Yma3YS+f3C/ce6IfqtJgLYnHxrXlsV959zuqihOshk7y4vC8SI7KfIPULf/6+i/kBpeQ2+2aWZLPSy44voSpkULrBNYj4qb4PjnuSxvgHXk9zR3UkthqnIQYQp+ZiDEyko/4AxsFJXNOc4kFNkBoeDXfDSEMII/ZzZukdw+vK9Q8s5GZbupzz9oAudUY6rAvcAcT1VzIfaX0XFOY7UUBLt9cZEE9yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vpUODqfyU41AYlHfcVwGGHEsGwNY5V2W0mZdYU9LtA=;
 b=QIscmRNjXwvsPGqnK6U7Dg12XUv8HMd1TK3BVPG1/q2dxy7VVVSSDttaG5Axm8fbKNCSZz23dbD2/XXG7rtfOzhyo0FYu2lPcSr10IwJHcX7cDNX1G8PR7e8M8CKI4G9UI0myi9NzPe80Jt4E1ooxtl4Mm0w8QpfZrGv4Af0wg+FXi9E/LgaWhrnvoxuzrggYRAkIVrKeydx/AoXtd0MUYXC6Hfqa9s4jyvxa8sUqy33M05op4Wg3Q+HwurScwLtX9QBF4yPRaMTJLOWPkkQDNYEx04D3qoKEYwWbTGBksyhjNv9v3UrU6jumgNAS5EU/eEFSn+SvFOj1BqCYD2qig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vpUODqfyU41AYlHfcVwGGHEsGwNY5V2W0mZdYU9LtA=;
 b=dP0W6JjGPFQ7qu3tcNsCPzTP33z1TqB+FNb7XJtKw8aS2EkM5E1+ZmmJ1NJ7HsFXridhXrvq41BtAjas33Fu6tY0KUA4zWjFvAlQHqJE2hL0boqjf4FcfANI9Jvi7ocu+vkArbiFpjBD2kfgr/zD8uHXI/Ql52ass5SsObv9tMw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB5433.namprd12.prod.outlook.com (2603:10b6:510:e1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20; Thu, 29 Sep
 2022 18:18:41 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::805b:58b6:1f27:d644%6]) with mapi id 15.20.5676.015; Thu, 29 Sep 2022
 18:18:41 +0000
Message-ID: <59d4d647-f451-061c-79b5-0ffc4e33fc58@amd.com>
Date: Thu, 29 Sep 2022 20:18:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/3] dma-buf: Check status of enable-signaling bit on debug
Content-Language: en-US
To: Arvind Yadav <Arvind.Yadav@amd.com>, andrey.grodzovsky@amd.com,
 shashank.sharma@amd.com, amaranath.somalapuram@amd.com,
 Arunpravin.PaneerSelvam@amd.com, sumit.semwal@linaro.org,
 gustavo@padovan.org, airlied@linux.ie, daniel@ffwll.ch,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20220927172409.484061-1-Arvind.Yadav@amd.com>
 <20220927172409.484061-4-Arvind.Yadav@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220927172409.484061-4-Arvind.Yadav@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::13) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB5433:EE_
X-MS-Office365-Filtering-Correlation-Id: 732636f9-3cfb-4825-9040-08daa2470907
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qxNF26cuTMx6m1tLp2pzqy2RELEGMIERyZBPoTvfZrrJc1cSEMxPvSM7/TqRPvRHQLOM5Sv6pIwuZY0OTZjMbG4i+8QP0rGo9vxqiR/DBeS4j/sDhib61mwHod1hQrpnJFEaq9B+OeOkeJFqduajvIMECANPPXpO/brZPe2MjE23H+zPpIv0AMY6EDVgie88FqScalZObk1IVU4pVJ/V3i4KcTRnEzVRKBXrSslNN12DtnUoKOrRnUmkFOucAw6cCSPwmOs9ZFSY4XdR9olIdHJZ+Q55nG64RS0wQfbBHdQRR8WUk+zJC4ZIE1e5QUy6XQc4nyvZgR3dhCgHOjkuYbzJpm5+VHC+8Fgc0zd06BSZCSgg6hxCnEgHQKSiIAQR06zdxKStGxLXgD8iXRpulzneUPVZcSksve4Eyny0BBITs0iPNcRBA0r1WHZIs44hpS8ylrvDRVrb1/G/8e6Cs1hD78Nl/yxyVSyZBiz2PEdW8cf6AEBFaY/OhrNSb/cywJWfnTgdHw5O5PvatmPQXUxv+BRkWUZbOG9GldpWW9KiqMvd4T2XjI9begmCSMa9dgxuN/cx04AUijM451CA15EwXPBbvksCU/pdbfZwNHRPuQkbz+PjtdnnjEQu9KRtWlgfta9mh2ePPsOKSCAgz0tCBLmxjSOJfNKDllmMAGECwuZZPsHvRgDuDDEWtu0L38UfheOxaNmlmshUgpVNQ/TLkzKg/M5uLk9y+HpudVcebVvoRbzywZiLKE2AQkOGQnsA2rTHMKBU1ZhbB5v8KsliFfzzfCVhn9wItKN4VD8DYtiIlrw+ZIwl/6fC4hy3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(451199015)(5660300002)(8936002)(41300700001)(316002)(38100700002)(6506007)(6486002)(83380400001)(2906002)(921005)(31686004)(6512007)(6666004)(66556008)(66946007)(31696002)(86362001)(36756003)(8676002)(66476007)(186003)(2616005)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1J2YzlOR3JVZFB4SEo1RlVBb0d3cVlFNjVuV1MvV0h3Rk1Zb0IwaFhKT3lR?=
 =?utf-8?B?STQrNXdmd0hCTnR3UG5jR2dVWWdhMVh2Z0ZWcjVxOGNmOU1uNVNGQkJmQ29j?=
 =?utf-8?B?dDBnZkxaRmhuQzhWRTBmT3cra3d6dG14a3l3TTRsUWNaRi9Kc1Z5S3R2ckRr?=
 =?utf-8?B?ZlM1THlsVzRjS0pNY1hHdjZOZi8vRUorRGY3UE1rSUJjcHNKSTlSSjZHZnRt?=
 =?utf-8?B?bTMvQWJPMWVwV1FGV0kvaXAyVGx5VC9mblpyNGJMbDdvRzZvbWZUZnQ3LzZZ?=
 =?utf-8?B?OGJHQWFhOENhZHV0K1RyckVoMCt5K1VCVEdaYnVmekJGc1J3QlpDWnhlWHRn?=
 =?utf-8?B?bUx6L000NjkwVm1NN004TjdaQUtUWmM4ZElqODkxaGVmTkxibEJPcW9SbC85?=
 =?utf-8?B?YjRyYkVQbzhiRUk0QnZxMlZTUW9sZGNhMG5jc2NPajYwRDlFZHJ0cHRYVHJM?=
 =?utf-8?B?a1ZaMnpoMktKQjRwWVdzTTlnNStmKzBXa0p5UnRDV3BHdnhJeWpxd0MrYXJ4?=
 =?utf-8?B?Z0ljbFpmUkdRY1JUSW8wa3ZrZ2l5cVg0bTJNalYzVWVZUGZDblZGZGw0clI3?=
 =?utf-8?B?Y29ncGd4bzZiVSs5WHRoMEt3WEs4Q01zOXNnNDdSM2lQazcxUE4vdlhSTGF3?=
 =?utf-8?B?Mkt2dHVNcGVFTEpreWdSM09QQjJyRUc3K05GdkY2Y0FDckxaVVpTV3RjUEVU?=
 =?utf-8?B?UjR1cWszM0Fua1dXZGRiZDViTVIxVSsvUFJyMGQxR0pFU3ZZWTBYMlJVeDdo?=
 =?utf-8?B?eXBuTW1TNFdlQWVUZnJtRE4zMzZ5RHlEUVdGVmFUbGRjS01BcE9mMFNEU3Vt?=
 =?utf-8?B?SUl5QTdyYTZjVWxidUVaWFhwa1RpY1lRSlFTbjVqTEhxOWFpMDBjOUhqaEZE?=
 =?utf-8?B?V2o2cXZ6dWMrcDUraUVjZ0RDdk54cC9GSE93dklWSWJ6OEU3cjFVUDduT1d0?=
 =?utf-8?B?dnNFNlgwRUVsaS96THkvV0NwWkxOcnNRNVRUQkZrQTNZLzd5MEp6QnlSL3RJ?=
 =?utf-8?B?Rjh3UTN0M2pwdDhCdkFaWkVvU25QNHFoc28rRVdCTWczZEc4bVI4dHc4NXM0?=
 =?utf-8?B?Zzc3L0ZnTUFFcmlDNkVpYmpVbXljMzNwZTJ1bGlIZTdDWmdvRWtnQ3gxaDdv?=
 =?utf-8?B?VDAyS2ZwOHJsMEdLQlRLSmRUL0lEdkhwc0FFWFMyaHNsUWpnRllSU01vL0VF?=
 =?utf-8?B?RHBXODZDcnBiRHBYZXd2ajcvdHd4ZzV6QzhLRFkzVVB4cEgrbFZjUHlmMzd4?=
 =?utf-8?B?Vzc1VmRFVmYyWUwxTy80dDJxSHhwT1JINnNnNFBMNEl3aU9MR2ZvMnNsYmVL?=
 =?utf-8?B?QlIwQTd1WjdLbUVydjBNNE9qRE1yaDdhRm53WVRrK05mOTRvNnZxcXc0OERk?=
 =?utf-8?B?MnliVTdqOGQ3emRWOWxUekFYbXErbkhrUWRpUG5QRmtFTlZiYU1SOVRNSGFX?=
 =?utf-8?B?a1VwZDFJMmFHcTQ0dXNJQUtTZnVtNzJ1US9teStTTjA0UmU2V29nRUcyUFdv?=
 =?utf-8?B?V09KZjBDbk92Ym9mVmhpdzFHZnBWaTRuMmZMb0tjNnY1OUd6YTNLbWEycWlj?=
 =?utf-8?B?djBacS83b1N1aDNpdU84L0xZSXZHWmtmdlBMYjdDQ1IzaU91UWF0M0ZwbkJt?=
 =?utf-8?B?SVhwRm1QeTBWZnZwcTBoWk0yN1E3YTZCazZIQ1hZczV1UDJ3VVhacWtwVUhr?=
 =?utf-8?B?VkJhbzJwaTcxV29CMzRKUUd4Q3JDTEFUQTFoQ2lVRTNKNTlldmZ0d0xPdmlS?=
 =?utf-8?B?ZVVlekFaWks3MEdCV3N2YThrR3ZNUE1sTTRkaVlJWlFHcG9zUHkrN00xTjZp?=
 =?utf-8?B?dmlzOHBhTVpOVlRRaDFkU0Nzdkh5RlJ4YVZhaEhNbmIwbGFReEVrOEYwcnBT?=
 =?utf-8?B?enM1RzZrWmkwQXVhdCtjV3I3MmN5VXRqdkZaak45dW9iRXA1OUtZZ1hJYTBx?=
 =?utf-8?B?TW9DRXpaeThGQ01Jc24yWi91WUZpWW1Sb1djTS8vRjZmTEU5MmwwS0V5S2gw?=
 =?utf-8?B?UGpSZDNyUUx4OHBHajJGTlI5VDA0VzNUWnFGUHozaHdRTWZHdkRkOXU5Z0hx?=
 =?utf-8?B?b0tUcXdteTFaUGxYY2drbmdrQ2ZuVnBVTW9YZ3RVMEM5YWxPY1AzenczR0hm?=
 =?utf-8?B?ckdQa0xuelVxVko2V1VIRGN6c2RwM0NTZGh4RVFUMFhoTTAwcEMvVVQwbEVN?=
 =?utf-8?Q?m/BbkvdDHheV1gAtmqgJDhE4wwEbfsPY5uioZ21AzzBL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732636f9-3cfb-4825-9040-08daa2470907
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:18:41.2026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BLPgZRYhPcnNm3/UMIZs9dPD17e0WYCHQdcS3pt12CYaokOkaTctfVPsMiH7BTUz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5433
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

Am 27.09.22 um 19:24 schrieb Arvind Yadav:
> Fence signaling must be enabled to make sure that
> the dma_fence_is_signaled_locked() function ever returns true.
> Since drivers and implementations sometimes mess this up,
> this ensures correct behaviour when DMABUF_DEBUG_ENABLE_SIGNALING
> is used during debugging.
> This should make any implementation bugs resulting in not
> signaled fences much more obvious.

Are all IGT tests now passing with this? That would be a bit unfortunate 
because it means we still have missed the bug in drm_syncobj.

Christian.

>
> Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
> ---
>   include/linux/dma-fence.h | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 775cdc0b4f24..5156dc6be0a6 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -398,6 +398,11 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>   static inline bool
>   dma_fence_is_signaled_locked(struct dma_fence *fence)
>   {
> +#ifdef CONFIG_DMABUF_DEBUG_ENABLE_SIGNALING
> +	if (!test_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags))
> +		return false;
> +#endif
> +
>   	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>   		return true;
>   

