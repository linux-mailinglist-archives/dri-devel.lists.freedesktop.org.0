Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58613444605
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 17:36:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72DC7739AC;
	Wed,  3 Nov 2021 16:36:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC98739A8;
 Wed,  3 Nov 2021 16:36:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftRpVFrK2Wnf4rmmfmtou87881D20aCu4/yHCvxL9+76W5b180AHTA3giY077o66vK5lhqd+rks/m7Y3PJP+W34ypSXT+nL3NePbHfLK6YB+nBo+p/m6E509L3x1ADPUIoXBVTVkDoVMW0RBin6EqhSE+LRnkE0b2ARmeKq03kvKnvFkQnWAQ/FbVndqLG8UKyK5nI2f/tFe21xbUiioF9G2jOM9yut3TU2DX/AIGcs22tXP5eGag7SSSjF6vTUZDFMbA0bjiyu3H9GAegis9SyyDXuaOFKuue53aZAcFUuJjKMg1GfCIXD8sI7GhFw4Tn+ijMBNml60LOq3hPWZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VT00V9UaHmTr2BX4r2hDLU8zqzuxiRXU6n2zyTptOEg=;
 b=LOW+VZes+W1fJLZbYtXNfkI3AbiyvH3my4gY0Bm4uxrF1zmsG31PwXwAtb39bNgs4bxE1GqI5iYWWz2tTuUbg3pMcJxZVyKNcqdV1eKLagrSgKJz+M6eczdFOJyuuWpQFd6j5jqbky4BMQ72csQlSK8BN+cCp6g0ZmjOJU2oqHh96KdpzaMDOSKZTjel54yZGrmL60TKz6wwLs1kHonA6G8SV7Xz2C+g7mLQA31AZIdp9OlqA5bc0SiXe5vGVoxP4kY5JYll4qJM0A96E/wfL/3mkA6Y2gMpuO7T+3MfglEeFvkh95e2z8ZG5Td8lhqh8+2071qzZY1Nwc6iSfho/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VT00V9UaHmTr2BX4r2hDLU8zqzuxiRXU6n2zyTptOEg=;
 b=Dd02n/mWnU6YF6vkrU3p+E6GDRni48bfL/icKAz9slymUa8ei7KENKyWlN89vNXYyV19wbFCJxqOLUXl4GfJObAdPxirU+TkCG++ZQYLJgoloiuHa+Vm2NS5HkOdYxozCaDOp8NhF+PD/wWnlWTLahaZSe+lqr48esAqf7yijxA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5295.namprd12.prod.outlook.com (2603:10b6:5:39f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 3 Nov
 2021 16:36:24 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::e95d:8a23:c590:e07a]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::e95d:8a23:c590:e07a%7]) with mapi id 15.20.4649.017; Wed, 3 Nov 2021
 16:36:24 +0000
Message-ID: <eb312f24-76bb-96dd-3bcf-848f83869a16@amd.com>
Date: Wed, 3 Nov 2021 17:36:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 6/6] drm/radeon: use dma_resv_wait_timeout() instead of
 manually waiting
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 etnaviv@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211028132630.2330-1-christian.koenig@amd.com>
 <20211028132630.2330-6-christian.koenig@amd.com>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
In-Reply-To: <20211028132630.2330-6-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR01CA0062.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::39) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
Received: from [192.168.178.88] (93.229.39.242) by
 AM6PR01CA0062.eurprd01.prod.exchangelabs.com (2603:10a6:20b:e0::39) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 16:36:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d295c2f6-0141-4132-ed30-08d99ee812dc
X-MS-TrafficTypeDiagnostic: DM4PR12MB5295:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5295B5E9A992EC8616D87BEE8B8C9@DM4PR12MB5295.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dOtfJA1Ad9ZJcvz4933FeRpdS5d0fvlfSTvhOxTAe0qIR9Mt6UrQ80UXEfTYTAfe9SM9CjlcQ1TCBsnvlgmbPSYu28zV+W/eW6szdBaiBpcrp+cxayIpTT1qQAYBTZHNVtCTb7B1SDoKkEN2Lc+srbEU3zzKGcojNVRStDysp1ZCH6Z7JccmYzKhiQyp4qdUe8h2311lnW5JkPFgdiO9LqAXpFqZZOSETKrX4ffBIspF2x0DpC9Lsuc+xwEQMvsyVVJQ1V0SuQ25pcCOA5Rzn1rJ5+htUjj4mYLyri/SRVw/TObj14eHZOwA6yipv8i9mobmiivDZvJnPVHH1TMv9yd/KReVeiuKHHURDAC/28n2n6vSf3qG1AbWcOxrxwIUgJdDPSeuHc9u4bWHUS1r2tgKtzjd430cqaVMI+5xro2rE9gg1IUHATWY1mD80YHOEUDmxpuMC7JwhcUvrmjpNCFIyzm3HhW/RXLlV8+nXX5UTiRURSmrDDh0E9C5xJwW0nsPCD10q4btHoTCjuGWWFF2XsS5NfYndkiNvY5oad3yXJqITwjbAD1HZ8+bfe3Eam0u2/yEPE7k+XUs6RBqZOslcTuSS48wORb2a2VE/w1DL0obwfsLvkImoOj3EuCvuEkLCKL2d7OO5Wj+kZ05J9nyfK6LG5FPgMrkEQBj4I8P3FlE2BRMThgGfVwnSt8D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(66476007)(2906002)(66946007)(6486002)(31696002)(36756003)(38100700002)(26005)(66556008)(16576012)(956004)(186003)(2616005)(83380400001)(5660300002)(53546011)(86362001)(8936002)(6666004)(508600001)(31686004)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjFERUM4bFVFMmRGbWRuMFFVWitXUU5jWnhKUkhRMmxBaGY4TTlNVFBBMGth?=
 =?utf-8?B?amh2VHJDOFZHejlvY3ZhWnlQU3NVL1lFRkFmbDdSbGl0OTV2VlI2a3lIT2hO?=
 =?utf-8?B?aS9VVFNqUDZ5VG5QUGxaVDdBQTFZQzlYN0g3NDIxU05DbE44T080WVluc2Fo?=
 =?utf-8?B?S1N2Nm5ESi8xV0R0ZDJFMDhma043NkY1VUUvMjBtSFd0ajFXWXV0WG1TL0Yz?=
 =?utf-8?B?MVlad3RxNHZ6KzBGTUxyNG45OVVmQi9tRFd1R1ZvZjJBVG9aZDRuWW1ra1c0?=
 =?utf-8?B?ZU00UXZ5STZxYWVpa3ViVzUzTzlwZkFaaWxHWFRCL1dOaW1TakZTc2NCWDcv?=
 =?utf-8?B?KzJ0L0YvTkI5eXQxMkZjMmZzeEtzVmRDYlFlV1JRUVI4UjVFaHEvWC9ibWhz?=
 =?utf-8?B?bnJvVG51ckZ2VHZ5amgvUUVKTXJaaFFtS3lTRGRFaGxUVmdqM0Q3UjB2K3Fm?=
 =?utf-8?B?K2Jyb3BvMnFnK0VhTVpjMitHUVNDaEpYSEVUdWpld0gyK3U5ME5XajRtRHpp?=
 =?utf-8?B?TmQ0RDk0NkZJZE52bmZ6RFZ2ZkFQNy9FS1FLRlJSczJuTmNkc3FJa2NxSWMw?=
 =?utf-8?B?aHBmTm10UlhqdXBRZThKOVBPMDU2QUZvcnNja1VFbGwzZXNjS0JYem9VcERB?=
 =?utf-8?B?bG5FVngzWklWWjN1SDlFTHpCcXZ6ZHI4OUtEb3haU0ovNVlvN1BvalFiL2dw?=
 =?utf-8?B?RFVhTE5hN3BEQTFZekZKMkJPNnhGNDBHVWN3eHRJQWpteGFQdVRRV05sMWxN?=
 =?utf-8?B?bXNoZG1FYXlsb3ZHTTRiRkNKRDdvZEZOVEI5b1kyYlFLTVlmaVROaDhIbW5y?=
 =?utf-8?B?RjMrWkNNbXZSQUpWczJ5eHZwK0wrTU1VVU02OGZJZG94b1R2eG1XQTZjalVS?=
 =?utf-8?B?MVduZm9VaHp5RVNqYjNJT1JjRDBtTE1jVXFMMXFmbWVQMWcrdGo0bWR2d09H?=
 =?utf-8?B?LzA5d3YwSjZPbTFNRytJS0hJSlA3UlBVci8wN1dDMDljNEVHaGEvSTlKVW0r?=
 =?utf-8?B?c08raUl1M0tKU296Y0J6MnArOUxSNlpITXVwQU5QUnBUdlRyVUFHWjZaL0oy?=
 =?utf-8?B?RUgxdXloU2pTNGVkL2RsbTBwaUhBMGRzT3RKckk5UmNlalhXblpjUjRVV1Vh?=
 =?utf-8?B?UnVLWXp4QkQrcTlYcDI4a1liOFJqQ29yU0hjUktyc2dEKys0MUtBV25OOUFj?=
 =?utf-8?B?eUgyVVBMcE44RFQzQTFhNVdqZVJtdWR1YXhmUFhHWXFTZitVYk1XQ0JmWDlD?=
 =?utf-8?B?R3IvMi9IRnlpNFlUWkFHa3g5MFVvdWthY0ZCWkhTZ3RVSFZSWlU5NWJmSGlJ?=
 =?utf-8?B?ckhiQnVtL2RXRGEzVDc1WWNpRXc3TURWMmowWlNJblFHcTlpaDN4dXRvWURX?=
 =?utf-8?B?U1lxN253c3NDOHJBaWo4VllmRUZXMmhldWx5eWlaNFlTazBLdEZvZ3BScEx5?=
 =?utf-8?B?bnl3aVJKR1MvRXBYaWg4ZHZTSWFTOU9tdktwY1JHbDlrWXJyZGJnc1R5R2pk?=
 =?utf-8?B?VzU5elpqeDhMRnExU1ZISS9ZeHdLYi96OHJZWW5IaW0xOWIvc21PM1hKR0M2?=
 =?utf-8?B?ZSswV0YxR1pNcHFCdEN5bHVwaCt1KzVwbDdrbVR0NUwzTGw4SkZ2c05EU0pa?=
 =?utf-8?B?TkZqSDArVk45M2p5bnhqdVF4REZVSEpmRktiZUw2SnA3RkZVRm5DR0JLZkhy?=
 =?utf-8?B?bDZUdWZUY2FaQk1Sa0FzTTdNOVdGeGhNN05MZVhuak5qL2k5c254NlJId1Rq?=
 =?utf-8?B?N2hQUjlBV0VkMmo1SVlaVlB5NXN4dWhZcVE1VHF0V1lZZEVjczBrY2FhTmJN?=
 =?utf-8?B?K2JZQUo2QUd1QnpZVjhJVGpzZ0xTL0ZwQkdVajRadlpqRElseXNPdkNEWjBR?=
 =?utf-8?B?NktCUFhqZ3lxWlBDTmFWYWd2Uk9HUFhIVUp4cC9xTDhQVTlmazd5Nm1rWHB1?=
 =?utf-8?B?bXl2ZjdiSngydGlpbDZNWXo2ZmZkdkR6VDVmREYzRXYvM0lRMzFUa2psREVR?=
 =?utf-8?B?U0grRDdlYVgwaFhHd0RYaTVhZ2lLajZCeEE1NzU3Vkxzc3ZERnQranY5bXY5?=
 =?utf-8?B?UU85d2J2UktPS0lPTHRFcmQ1L05HZHRTT1JFZmxGdHFvODZjaDd4QUg1MjRQ?=
 =?utf-8?B?N3REVFFjR3dHajY2QWNtOStPQUVqSUVjSlVQNVdWcCsrWkl0Snh4Y1hWcmJh?=
 =?utf-8?Q?WcTMWKkxp0t4oM6LBefSmjA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d295c2f6-0141-4132-ed30-08d99ee812dc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 16:36:24.1609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bsd7HFU1BexpCy591oEi+StSBr9VMj2HBQ88LL1xpiR/Kb1wkq5asAN7xW69BSPWCPYWybPgN3awU92hCIqcDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5295
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

Acked-by: Nirmoy Das <nirmoy.das@amd.com>

On 10/28/2021 3:26 PM, Christian König wrote:
> Don't touch the exclusive fence manually here, but rather use the
> general dma_resv function. We did that for better hw reset handling but
> this doesn't necessary work correctly.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/radeon/radeon_uvd.c | 13 +++++--------
>   1 file changed, 5 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
> index 2ea86919d953..377f9cdb5b53 100644
> --- a/drivers/gpu/drm/radeon/radeon_uvd.c
> +++ b/drivers/gpu/drm/radeon/radeon_uvd.c
> @@ -469,7 +469,6 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   {
>   	int32_t *msg, msg_type, handle;
>   	unsigned img_size = 0;
> -	struct dma_fence *f;
>   	void *ptr;
>   
>   	int i, r;
> @@ -479,13 +478,11 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
>   		return -EINVAL;
>   	}
>   
> -	f = dma_resv_excl_fence(bo->tbo.base.resv);
> -	if (f) {
> -		r = radeon_fence_wait((struct radeon_fence *)f, false);
> -		if (r) {
> -			DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
> -			return r;
> -		}
> +	r = dma_resv_wait_timeout(bo->tbo.base.resv, false, false,
> +				  MAX_SCHEDULE_TIMEOUT);
> +	if (r <= 0) {
> +		DRM_ERROR("Failed waiting for UVD message (%d)!\n", r);
> +		return r ? r : -ETIME;
>   	}
>   
>   	r = radeon_bo_kmap(bo, &ptr);
