Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D842F035
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 14:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89F96ECE5;
	Fri, 15 Oct 2021 12:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D696ECE5;
 Fri, 15 Oct 2021 12:07:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nv/T1LqH9R2kC2GmQ+a23eRnmv5mD1VOFOnqlaZQA+s9ZgtmuKf4VWhEnup1CX4P1avClOfE9yvwQ+ZpWqyAw0Tdz5UtZ3o5o0uws3Y78EHuj/OMuJHZSdSI+lZ3b0uqFdhIE2QTsyk81tLuvCTW7+BnCPFnjDhVRLen199teO6GUi4q9jwqMGAKkoVVGQUa5a1JvX5QJuWiFO2EHggL9WdTmNBB5ZZxU5JWUldjESIXN33LKv6iysVQbxZhmZ6srsOGafhM9wjG0cuw2f1F5IKhY0FdgYeW8wz7aJkIInv2xV4Lkk5ecx3Y0VTZZ60Vx8dIpEyW3cmtDs7Epn9YKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1n9nBGawFx3E2HckJ0A3k0qVxmqhKa4lmXGycsNZs2E=;
 b=O42JuocmH5G46J5rAPhVprE3XwtuAfzrm59zrMrbpyv/qgFiFFRc1aBjj1Y+UFDKV/m3RTwA+MnHXtw3jt1RlVxGe72bI0HvgSkc/bkvMV18jRZroskmhBMgRjhOVdp+CJQvJRDXVxEcinGthZb9KiYGDMJ0wAA3s3XaZKme0E+D0oMwoBKwlFbD/YpWXIDCxXrotUDX9AqsAi8jUNeE7aAPLE12jKSbj3zqfhNABcUm6mkFZJCi85FEI6BOohmVrx7Arw95YSiaR9nZwTjq2xm3XycUaLOy7hWBLh4LE9QaAAPSxFXPsIqE4Ta/JHh4d8txf55c300D3hdGDoONPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1n9nBGawFx3E2HckJ0A3k0qVxmqhKa4lmXGycsNZs2E=;
 b=E/NB7gsJEJuwtDuMcv0TLUlXemKLAvJIiW1Ci1hS/wTa8Ad9gtvp2CPlcwwsB4oIIc/E02xxOnhbAWqHRSfHZEvDDSda2nNpYvRHUHK4kjj8pegAu6sTrhnu6X6R2zP3qYT9oPML6TsM1AZGYxuu0SrT/Y6CZULbHHt/bPNejag=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1839.namprd12.prod.outlook.com
 (2603:10b6:300:10b::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Fri, 15 Oct
 2021 12:07:41 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4608.017; Fri, 15 Oct
 2021 12:07:41 +0000
Subject: Re: [PATCH 2/2] dma-buf: Fix dma_resv_test_signaled.
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Daniel Vetter <daniel.vetter@ffwll.ch>
References: <20211015115720.79958-1-maarten.lankhorst@linux.intel.com>
 <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ebf0714c-2f49-a0ad-1861-16394ade468d@amd.com>
Date: Fri, 15 Oct 2021 14:07:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211015115720.79958-3-maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6PR04CA0011.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::24) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:8109:333f:edd8:9fb4:b1b2:7db1:2374]
 (2a02:8109:333f:edd8:9fb4:b1b2:7db1:2374) by
 AM6PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:20b:92::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.17 via Frontend Transport; Fri, 15 Oct 2021 12:07:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a04e516a-a4c6-404d-65c8-08d98fd46302
X-MS-TrafficTypeDiagnostic: MWHPR12MB1839:
X-Microsoft-Antispam-PRVS: <MWHPR12MB18397A7E9474311DFBC3C92383B99@MWHPR12MB1839.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rlQVexEIWIeSIr5BXov8TYSgSF8gjQn0rZKewznDcfDjcMgu3fEoQVaunieJ7yQjCmw/X08OIDAjGDBxcUm41TB1fsF93zwdRNx2wd/ir8L2+9jFthXWKPI4vga61pFzypk3z3zIbXIicy10eMwGxEoZOKktAXkZygLzjx2QXSXTJhulXjgmH3QTMIhnLG9AB2cuwG7wIi53TDOZLJLm4/IBPmnR8kKmAHRPPy6g4myGABQtgiqWY0Do1hmzw6JOhCJf8hykgTskShXP6trm7AuTtDrmmTPz6vHBOyOpxPLLaVDOB1x5nUmQ1csADmGXZZzkH+4gZlspUQc/MAosXjVVWe2/R/Juc2rvFVCBy26YV1VCU/9Ssg3AAe/BhjPhr4w8oZvGpAtFWsZCRqD+jom1I3EfCTSRaP5293Aw22MBYqwo3cyLR9QXTHKcjYnZgJ4i7GSxhjH27XxFymh+5dgBbVnGkklBA0WbWSoNkRH7CsR7xm/etUs04k2aCRhwWuC35ptnRmS+X+OiZux/56yHxo+k/SpkSHLcYfSzom47qbEykVADoJykejAsmgG7MYoQNfK75kBAb+44SydTIQP22U1+jlFSQ8AkihowzTT9RmBxIlmknJtHISKAUogBJ2lPcKmwFau3G05zkUExuGNb/EItDyYIynsvgke/4Q+wO33KSdzq4cEVoNLO39A73PCiF9gfOsz3yY5ab/z6iX0eHuNEenLFbHtXZLy3vr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(36756003)(2906002)(8936002)(66476007)(66556008)(66574015)(6486002)(8676002)(5660300002)(66946007)(83380400001)(508600001)(6666004)(4326008)(31686004)(2616005)(38100700002)(316002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERPWkxiYk9PcWc4TVpKUklYaHprbzk3WmVta3g0dWVBcUFoRXpzZ2wzRXdG?=
 =?utf-8?B?U2hWbW5tV3dUM01aRHVaYkVmNExDT09Tb1VEMHc4K1J1S1YxUEtkelJHRFNL?=
 =?utf-8?B?ZHNLSFg5VkV4dkdMNnNndjRORGc0YmsxdzVpcUxHanJCMXFNU0R4blVFR1VO?=
 =?utf-8?B?Z3NybXVGa2cvcjlaL0VtaURVblkvUWVDS0t3YVlmUnhPYUE3eWc3U3hQb0dR?=
 =?utf-8?B?b2NEZ1ByVDlTZjV6WDFteVgxVHF5Rk91VUMyNXczUGlmaGhyYXk2T1NyT2JH?=
 =?utf-8?B?cWZkVXQ3anREMGd4QjBZbGVoVndkc3hLK3JXbHNRVVVqT1czbmVPQjFuNTZw?=
 =?utf-8?B?QWZRMnRJa2R4V1p6dmxiMXZtQ0JUWHVZakJ2WWo4d3NmeHg2VmFhY0VVd01T?=
 =?utf-8?B?R3UydnprUldkVTZoSlVUMHNHQTFmd0pYeEhVQnFVdUpZZ1BTdVFtaitKSVpB?=
 =?utf-8?B?c09rcUw4K3NuUTRqZkZWalozZGJpTzFPbll2QWxWT0VDS1IxdEd3Mk5RWFRX?=
 =?utf-8?B?WERoRXRMWTdWcWxTaDRxb0c4OHVSNGpsWSszYlFFU2kxWDJaTmk5Mnl6QW1j?=
 =?utf-8?B?ZUFvUU9vTEpvWXd4Y0FDTnVDeWtPSU5LS2RVenNxTXgwa2NTYms4amdlOWtW?=
 =?utf-8?B?UENsK0JVcnVuTXBuVEtOdnVZNDZHbE16OU91ODN1WmJKRkpZSWJoOE1EakJq?=
 =?utf-8?B?Q1NadTErMzZFMXVkUExyUWo4b0R4YzFOalhTWmtkMmdKM1owQVBqcndvV3Zn?=
 =?utf-8?B?anpQcHhuTDRBNTdLWVcrblVNTzRXa0dhbCs0c2VzV3k0T1pGY1A5Z04rblJM?=
 =?utf-8?B?REpSMFFwU3A5WVNLTXJUQWViVGJ3dDZFcTNZRkVXQzhBYzlORHpnSW1Va1VW?=
 =?utf-8?B?SHlqV2ZzbDJwaUdnYkRxaHh5dFdndXhpajFiYzJ3R1d6dnpmaXRLeFNxVncz?=
 =?utf-8?B?L3p6RXR5Z0FoaVp0NGJWRWZ5ZDRqbjU3YXpPT05IdCtpeTJ1VWlSMzIzZ1lU?=
 =?utf-8?B?cWJVZk40TDBrRjlkYUZxekxUakdUVHVzcE5uT0l3K2NzTkE0S3BkTlNyRm1w?=
 =?utf-8?B?eWh4YjlCV045a0ZLSitxVnoxVGRITjNaNmIzT0NwU0l4NmdqYStmc214RnFw?=
 =?utf-8?B?YmdoTERncEtoK3MzcUp1MWRQNk9yRDFGYXZOMEJFRkY1eldxN21FTUl0WVA4?=
 =?utf-8?B?cUlwazdDS0Y3M3J4SDNrMUh3OEpsVkdoQzhwUDNKS2lSSVFzSDd4RmxiTjRn?=
 =?utf-8?B?NnpKelB6VDhJQ1JDYkJsUTJyQlVOZlI0MVNFVmNVSEVNTFVNZnAzTk5UTXpk?=
 =?utf-8?B?YlMzaVBLSm1VVmhDWm53cUw1c3NJY2tVNWM4MXdDbkV2dGJtVS84dmFVSGhl?=
 =?utf-8?B?Ty9vcGdUcHlzV1ViNnVEOFI2V3VlQjRWYWIzWWdiWVFtYmtwNEFTcjcyVEtz?=
 =?utf-8?B?aUM5clNtbTlxRnRJM25oWW8xMDlaSU40Zk9hMkNuQ2NTUC92Y1ZvNWp3ak9J?=
 =?utf-8?B?QVZPK0I1MWVkakJBdnhsSEo2eGJjMWxPQlpiRDVWeFpmTkw2Y3BNV3Z5NnBG?=
 =?utf-8?B?aDZXYzFkSEc5NzJKbEhBVUlrQnA0MEJrbkErQVNuaDBMTnFLaXg5VDh3TmZa?=
 =?utf-8?B?Z0lVNGJvdVBLMW1kb3ZNMHVncVZzcjRFa1BCWG1JN3F3b1ZlYjIzMDRGMlY5?=
 =?utf-8?B?RG5wQkpHSGY3S01mbXI4aXFvSkNlZkRFOGRNR2srb0xQbzR0K01pZGJjdWRM?=
 =?utf-8?B?SG5FVERFdTFYemFHQ3k3cHJKWlQ0L1VIQnJ6Qi9FMThhdGtWNVVxWHVja3ZI?=
 =?utf-8?B?dVk2SjR4Y1lsRzBVd0lMNHV0UktOdDRXOEdVMXlnQS9uTjl6OGhtTG9tN3N4?=
 =?utf-8?Q?qz0WvAHS6xxj1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a04e516a-a4c6-404d-65c8-08d98fd46302
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 12:07:40.9824 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F9o6a63tZ3kxSugXd88cYBrWCC+FH+9SE0kBEsCwyI7WVnE/upGpfTQSniUfQoTR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1839
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

Am 15.10.21 um 13:57 schrieb Maarten Lankhorst:
> Commit 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
> accidentally forgot to test whether the dma-buf is actually signaled, breaking
> pretty much everything depending on it.

NAK, the dma_resv_for_each_fence_unlocked() returns only unsignaled 
fences. So the code is correct as it is.

Regards,
Christian.

>
> Fixes: 7fa828cb9265 ("dma-buf: use new iterator in dma_resv_test_signaled")
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/dma-buf/dma-resv.c | 8 +++++---
>   1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
> index 70a8082660c5..37ab2875e469 100644
> --- a/drivers/dma-buf/dma-resv.c
> +++ b/drivers/dma-buf/dma-resv.c
> @@ -655,14 +655,16 @@ bool dma_resv_test_signaled(struct dma_resv *obj, bool test_all)
>   {
>   	struct dma_resv_iter cursor;
>   	struct dma_fence *fence;
> +	bool ret = true;
>   
>   	dma_resv_iter_begin(&cursor, obj, test_all);
>   	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		dma_resv_iter_end(&cursor);
> -		return false;
> +		ret = dma_fence_is_signaled(fence);
> +		if (!ret)
> +			break;
>   	}
>   	dma_resv_iter_end(&cursor);
> -	return true;
> +	return ret;
>   }
>   EXPORT_SYMBOL_GPL(dma_resv_test_signaled);
>   

