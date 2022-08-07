Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2852D58BBDC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Aug 2022 18:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F9F218A4A8;
	Sun,  7 Aug 2022 16:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2067.outbound.protection.outlook.com [40.107.93.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780A4112590
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Aug 2022 16:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bt+zPNPnwm3w/ZwDNb5rS/oEAZ4vKxElxUsm+HmzIjMeufr8D9/1B/nd0xfdDrkpgYfya/6IBco+GWUz9pJFKjLunmJkMMfC8lxtr85W7CTWDZVcBPtMq/jLl9AfND8f9auv4s6X7y1AZqnE2r84qg70lILYjmRjx9GjhVCGGh6UJi6jPHnQIKX+jrZOkZ7Vn50TR88pdlmDuF8a1N8UcghGt7Ek0TgGtkSFFlj/JfijZFtjj1Y2beJFHPbeNK1MLs3ZDY+pz3jEiJkel7LXuUhuyKLLCJZ/7QkHpKkPG1zfoS6i5+CLVV9m/c2pYlXiLh2NeZeHM22QxExWGHkFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nolwxMtOLzL/MymOG+wdXgfvYz2mjcPUBkuymmTnrg4=;
 b=ew9kbNc4CA1OkfuYoKN4T6K//+UoMKKIRBTbGb29JT6VctzjQCf9d8nRPvirshVWde3NqqRNi7OsudYTwNVI2heK54Vx9s8rdhArS/rCCpc+vdRIoMx1Q7in3Fge7cYsIVTs0dGBDVLoEf3FHdxZAMS5lKPOXlT6tVc67SzIZgWYwOYK3YeSe50xJ5ZPrqDCXMZbXq+RoXm85fK1P8QrR2dIQ3uIP/Kq8tctFM70lRIYvHDDPYQcT1EBeT1snoDpEbtjody5rDv99B9toelVBfcMAYL5+QpTrFJ/qfAhmYWBNXsBkjokY07jC8RnDSBNiXJ98uOSYLLyP6y9IjdG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nolwxMtOLzL/MymOG+wdXgfvYz2mjcPUBkuymmTnrg4=;
 b=2PgcohwCRCRlvdUlHAvS3QoEyScFROTw73WAu7oxzkr8eTwpkQtvfZVlll4766NY801/CdPIWjC1kcEcr4jjv7hJHNK/p5VPbnUhqSsgosKSEAiPGmn1CKJ8EOsxs5dppClbPGKA0fiJGtzlh8Beu1D1jlLzBlD7iH/WSHNtgSg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DM5PR12MB2535.namprd12.prod.outlook.com (2603:10b6:4:b5::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.15; Sun, 7 Aug
 2022 16:35:27 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.019; Sun, 7 Aug 2022
 16:35:25 +0000
Message-ID: <4e8657c4-54aa-ad16-3350-f81c610997f4@amd.com>
Date: Sun, 7 Aug 2022 18:35:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] dma-buf: Use dma_fence_unwrap_for_each when importing
 fences
Content-Language: en-US
To: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
References: <20220802210158.4162525-1-jason.ekstrand@collabora.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220802210158.4162525-1-jason.ekstrand@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0144.eurprd06.prod.outlook.com
 (2603:10a6:20b:467::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b66b7f4f-b5bf-4c2c-df9e-08da7892d479
X-MS-TrafficTypeDiagnostic: DM5PR12MB2535:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +nIzsKYq5k8c1E3qoqcjif6DU5SeRfyb00CysD2tmCnCa82Pte0ds2zwDJ3jlWoUoJ94/VsrtJI2v2RRSCZX7/gvQEAcI5ak0EBIekYA4cIxtFP8RgQ2jv6Hio22CAJsQt900Hrn3GDEMM7NmryyLoCGp0WTRd0DR6XDYs36KeWF+t3Ck0zbZbvENs8xEQmrqw0aqFnGVLlTsw9IpZVrDhwWLyH3bkfodO03Fdt124CDbKQ+E0V7nmFtTBMgvnCh9kIlCD+rcIt1iOTZblqr9sUZ1xMrX0GuahJkg6aJFz6L5kgdZX86vF542urLcMUElgQ5fvD/U3WEIjnVblM1x1tJzC+8oSfCqq+r+sySoebuMqG0Ze6nTAUsb60Qe56l0SQ76n3rpi+wlLn4cZj+kctunerLU1dE4fUiciE6tf1nDw1YXf40j+SLCUUrHs1pHOXTEXGdrqRH1XK3gea2X8R51lFqK4Zixx57YeV4ieNznsmc+cpQVqMeETQtl4xrzryOLG8cPyNcxJsmneIofm9TIR7bv699Ap54Hp96z6kUJ20jM19lwrpnIR65UVNa4gBAN/N3hVmu1Elf1Cm5dmyk4YaF+MM/umXG1M4n21NjCqHcKwvyPtgUH3/jusxGHOLXDSNpJk7b/pW2hzTAW7emHbdjuHk+tqBJA4jQfas+D/MyyfT0ty0VSgfXaVfNOm9VIKSkGHnQdsHvaafAvzIAHEWLAuk5pjsQO0cxbRJclSCPP8ZV/4Hy7kfnxzqhQPm4+h3xkbBfly9cGl9oRyymFS/NZZBIxNRh0YfH+9b7RqCKNdYtB+7JFrHon4aK5AzUfuUKVWCThFNEEKrFrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(83380400001)(4326008)(8676002)(66476007)(66556008)(66946007)(38100700002)(2906002)(8936002)(6486002)(54906003)(316002)(2616005)(6512007)(186003)(66574015)(478600001)(5660300002)(6506007)(41300700001)(6666004)(31696002)(86362001)(36756003)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU1XOE50dk9EeDZUQU1GNHRreVhLNEhycGRsYjg4TkkyYnQ4bFppZTJyOS9I?=
 =?utf-8?B?dmFwVklQMzZvSEludWVLRHJ2VTllN3pLYnVPVWkzcVBuTHI4UjRlRzkyc1ZQ?=
 =?utf-8?B?UHIzSTJIU0kzV3VFTlYrNlBWY3RFRVlvN0lTTWhBdFBScCt6Yk1GaWFLZXVo?=
 =?utf-8?B?YTNRRjdqRHZxU2MwUmxGdWhTa2dYcGg4dFF2QmxtQVZGSHQranlRYTNGaUta?=
 =?utf-8?B?NEJuckFSZ2JrL1NnRFRkd2NyWTJCUHA5Y1dlU0VtZnFzeU1xYnhRckF2Vy82?=
 =?utf-8?B?anhlK1Q2eFc0eU9ONjlGYXRhMDY1R3FxTG9nZWdXNFJyWXlMUEFUcDR1ditJ?=
 =?utf-8?B?a1N2SHgxamRBWWpRS3BoMzMxTjBxYXpmbS9VaUxSWGhSZHRSc1hDbXM2Ulov?=
 =?utf-8?B?cmRLSHExcklNZ2JiNWx0UDNxMWh4UnIwd3VveG1Vc3R2ZktKYTZnYm1zVmxC?=
 =?utf-8?B?OG5tWGQ4OFJyUThNbHd6RXk3MVRMTmptYnVubFF2SlFxNjB1V1ByZlR2M2Jz?=
 =?utf-8?B?aGRINmhCazVURHMrQWJjZWlER1NYaEJHd1Z0ek9UQWNHTnZNc0lCbS82UkJE?=
 =?utf-8?B?Vi8zUEZNSzRkejdXWGVaQ09MWUV1VEd5aFYvWUNMSDNoR29tOHBTVk1VRTRi?=
 =?utf-8?B?VHFPSFhyQzZvMm5zR0RWNktQNFJMWVg5c1RIUEJGTUh6TFJtc2htZ1B1ZWFt?=
 =?utf-8?B?ZjJsYzFFTE8raGVFczFLNE5Ga2twSm0xdUF4YlBmNldkWWJtM1JVbHU5bnp4?=
 =?utf-8?B?dHhZZThjZ05BRkREQXJVSkxJdkNJZmRoek93Z1l6eWxNakJpU2JURUtOeHRN?=
 =?utf-8?B?NEliTCt0aXM4NkpPSEVYTnNUb1hrYzNjTTllV0NpTFBSV2EvRlZldGN2L2U1?=
 =?utf-8?B?UEcrK3RKUXloQ2lCZmZPK1MzMThnL2l5MVBNYmNGL3hiajA3alo3K1hWTHJE?=
 =?utf-8?B?blB3aEg4K1BJQU96KzAvTTNuZ0N3alBYYkd1Kzc4OUV4Sm1rcFVZeitXYVhP?=
 =?utf-8?B?Q1Q0K0NjR1J2WXE3VXpjNUh6c09RamtVNHRtTVExeW1MREFZaVM2d1JETHUz?=
 =?utf-8?B?TUprUFhaRHNhMkNEblQxRk0rNHJjTGZkK1R2Ym1KTGtGUWRobGRQVnlHL3ow?=
 =?utf-8?B?eGo4TVpOVStJMnV3c2VFMitoVy9tWHFIdzZIY05DVVNXbTl3YmdhWWordXV6?=
 =?utf-8?B?Skpka3JzeStVeUI5VEFMaFRUTHJ5Znp3bUYwREVrRFd4NU5uMHFmZUNBc2ls?=
 =?utf-8?B?ZFNnckM5VUwwWGpHblpYSFY5TjIwcUI0NDRrY1J2TXNVWlA0NEZyY0p0czYx?=
 =?utf-8?B?QkJGc2hZSlp2WUJISXAzTVFwVGthYTlSZG1teXoxN1BMdFpVN0xjRFpkVXAw?=
 =?utf-8?B?d1RrVzlBdEE3UUlEeExvNEF5NjMyZDRkVFhFUW5VZVc0OVlNNnR2Z2dGSjQ2?=
 =?utf-8?B?U21tZkRBckxKcHlTNXp4WXZXR1pqZXRXR1FSWjNnL3dkSHhOZG84WS9UOGxZ?=
 =?utf-8?B?bFRISjM4MFlsUmZnbWRUREJSNmtXYWxUMXgwVHdpUzhBbDJnVzFRQWhUMi9l?=
 =?utf-8?B?SHdzak13L1dQSEpTKzAvM1BYQmpuRkpOZ05HeHVMSm0yNEN0SjZwOVFjcldJ?=
 =?utf-8?B?QitLU0RyR2NFcHdWYm92c2l6TjZyd25tMlFlSktpY1p0cVFOOHZWTy9ORElJ?=
 =?utf-8?B?WDVpckJhYzRlSWRvTTN0ZCsrdTBCeldpVGc2ZUlKdURHWUI0NC91RXltTS9x?=
 =?utf-8?B?Vkx2WVM1c2kySi8xNE01cWQ1S2Q0NThKMWFXMDJjNG9GVE1wcm9QMExaMkpN?=
 =?utf-8?B?clhnSlNjUkJwbnlJSDM4Zm4wY202Ny93cGZoTUxwajJvanhGTVFuOFpORlF5?=
 =?utf-8?B?Q1JQczZSaDJLQnhJeXIyN2dSSUhoQzZERTVRU1pabE03bnE4T3lja1BEU2c0?=
 =?utf-8?B?dllqOTExd2ZBb3dLS1pqTm9PMWdiSy9Zai9MMzZTbUNLTWhYN3JwdXJnL1Ry?=
 =?utf-8?B?anBIWDlTZzhtckpmSTBwODBKMENqUE10QW1yV1JBeCtERkpHSVlvZnd2d3hX?=
 =?utf-8?B?UEdiS0x2RE1WQ04vNWtUZVFzUENtVVRWTm9pSUhNZGQ0YzdIY1pOUERScnMr?=
 =?utf-8?B?dVQ5ZEdhTjJ5NFBFRVZ0MXU3ayt3MmxxNXI2RC9takh5UFZOa2VCQ3Y4eTQ3?=
 =?utf-8?Q?58XBhbj1fenlhLh9cGUp6zr+lq5RB2STSKc66PBKutZQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b66b7f4f-b5bf-4c2c-df9e-08da7892d479
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2022 16:35:25.3067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLMz9CnBbKQoWdThg+J7WKS0FgVK84sh9ijFTt/WlhK0AjlfvITDhprZXcPb123c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2535
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 02.08.22 um 23:01 schrieb Jason Ekstrand:
> Ever since 68129f431faa ("dma-buf: warn about containers in dma_resv object"),
> dma_resv_add_shared_fence will warn if you attempt to add a container fence.
> While most drivers were fine, fences can also be added to a dma_resv via the
> recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE.  Use dma_fence_unwrap_for_each
> to add each fence one at a time.
>
> Fixes: 594740497e99 ("dma-buf: Add an API for importing sync files (v10)")
> Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
> Reported-by: Sarah Walker <Sarah.Walker@imgtec.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++------
>   1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 630133284e2b..8d5d45112f52 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -15,6 +15,7 @@
>   #include <linux/slab.h>
>   #include <linux/dma-buf.h>
>   #include <linux/dma-fence.h>
> +#include <linux/dma-fence-unwrap.h>
>   #include <linux/anon_inodes.h>
>   #include <linux/export.h>
>   #include <linux/debugfs.h>
> @@ -391,8 +392,10 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
>   				     const void __user *user_data)
>   {
>   	struct dma_buf_import_sync_file arg;
> -	struct dma_fence *fence;
> +	struct dma_fence *fence, *f;
>   	enum dma_resv_usage usage;
> +	struct dma_fence_unwrap iter;
> +	unsigned int num_fences;
>   	int ret = 0;
>   
>   	if (copy_from_user(&arg, user_data, sizeof(arg)))
> @@ -411,13 +414,21 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
>   	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
>   						   DMA_RESV_USAGE_READ;
>   
> -	dma_resv_lock(dmabuf->resv, NULL);
> +	num_fences = 0;
> +	dma_fence_unwrap_for_each(f, &iter, fence)
> +		++num_fences;
>   
> -	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
> -	if (!ret)
> -		dma_resv_add_fence(dmabuf->resv, fence, usage);
> +	if (num_fences > 0) {
> +		dma_resv_lock(dmabuf->resv, NULL);
>   
> -	dma_resv_unlock(dmabuf->resv);
> +		ret = dma_resv_reserve_fences(dmabuf->resv, num_fences);

That looks like it is misplaced.

You *must* only lock the reservation object once and then add all fences 
in one go.

Thinking now about it we probably had a bug around that before as well. 
Going to double check tomorrow.

Regards,
Christian.

> +		if (!ret) {
> +			dma_fence_unwrap_for_each(f, &iter, fence)
> +				dma_resv_add_fence(dmabuf->resv, f, usage);
> +		}
> +
> +		dma_resv_unlock(dmabuf->resv);
> +	}
>   
>   	dma_fence_put(fence);
>   

