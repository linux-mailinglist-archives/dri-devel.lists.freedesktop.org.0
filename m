Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EA4A43B099
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 12:56:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F32F3890F7;
	Tue, 26 Oct 2021 10:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAC01890F7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 10:55:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ja4ZZbvEvapjnMrvWLVlEGNBrEV3UkJBX9O5ODkMokkF8F0harBPZTeHTAygnoAJB2gZpx5MS97d9l5qRu2qIGnFTeN0ONCMedObjAIsczD1gKuuGAzFxs0Ts4cSW85n79fL2j+m16/4FR4Ra1lAnmqS3/6+VK1VMr9eJKq80zeDprnbTcxLAYFdZYnR/y1zrnN0QI3x5yPnm6HIEL0cDK2FtCye6rLDbogRw4LoUrv16XIll/Reb8zbg9sc5v2sR39GmEMFtUtgeovea976Zc11VnXiK70gahZFRxCfzU1I+Z8CG6zmt/pKxe8f0zhqhVjti+7uhuBKBvCHJasrDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HRkZ6p0OVu8VflWHz4Yo6TyKH+sSKcF+7wv5545bjgs=;
 b=g5hZSqa8eBl0f6x1FamVzln+68Rx61H5dJyfXLLQs9v5rk9YagHCLPa8j4BwGn9Hq/eEqLPlxr493itwCo/M61Mg6UlRpsu1JUWTD3zFc3NrLGZ+2dDbVpYmdOHZBQyPMu/SLfz+n9xzkFuRE4/aSc6TVefr2fkKapyqBvJ+37OQtz2mKqIIhtoE/1tKyw9qMYUh+KAtYFefQTCtB69wWXyT4GmS3TMXzRov4waysHFmaFgjoCh0kTi47QJnS5EvIM1Gl61PGEI9l7QraxRixWm5JZRj4fqjU1nXgbBV+uluWg2zuyFNzM4HCcBx1yWcHOseGuy/QuT2gqFp57W5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HRkZ6p0OVu8VflWHz4Yo6TyKH+sSKcF+7wv5545bjgs=;
 b=Y7RtBvZgWSNae33JsuX1cSY/j7NlnX62+JBR4CwBer0lzwhvm8WSquZKkQBxpuYbjbgqxhsBdxLtyDV0P1TSKIDDt7TQ1y3n7DkIIy4UD2akBPrVEUAW06vRaI7FQ92E9liw3swSllhaFtujPKPTuQcma695CaTaesfBjurMnw0=
Authentication-Results: lists.linux.dev; dkim=none (message not signed)
 header.d=none;lists.linux.dev; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MW3PR12MB4570.namprd12.prod.outlook.com
 (2603:10b6:303:5f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Tue, 26 Oct
 2021 10:55:55 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Tue, 26 Oct
 2021 10:55:55 +0000
Subject: Re: [PATCH] dma-buf: st: fix error handling in test_get_fences()
To: Arnd Bergmann <arnd@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
References: <20211026083448.3471055-1-arnd@kernel.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <52f6a48a-cd94-da21-2cda-300fd1f78a44@amd.com>
Date: Tue, 26 Oct 2021 12:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20211026083448.3471055-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: AM5PR04CA0018.eurprd04.prod.outlook.com
 (2603:10a6:206:1::31) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:4969:85a5:71fe:e4fa]
 (2a02:908:1252:fb60:4969:85a5:71fe:e4fa) by
 AM5PR04CA0018.eurprd04.prod.outlook.com (2603:10a6:206:1::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Tue, 26 Oct 2021 10:55:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 114a9b08-ef83-401a-e35f-08d9986f2eec
X-MS-TrafficTypeDiagnostic: MW3PR12MB4570:
X-Microsoft-Antispam-PRVS: <MW3PR12MB4570C61A05EA26799A49D52183849@MW3PR12MB4570.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUoHRuHN7YKa1Y9NMAA2iqxVtWZPSI5ZsZgCtpms7llnHfHJ3eoYfuuYtjfyyPAYHZ2RJtPqFUCgR0OOlQPx6PEferWoglat91iwsvmsKOahsC4DU8C3chCG5u1p954Nq8c5eUF3ZFBsK1h+hVjFCCJH9Ncgt2i13lW50DozFM703VIAPvTxFMeH7BSRspiWa4o+flbVPYRrLNKrKU5ROHE5p9fJCtRHMVCiPGb8deX5l4SNH0NiUsfagJ4yQ6cezvC2ET37cRt+YgWygcT6njZ5i+PePaVNjDMbqrEYUXm95zymjY9TY9Qtwj+dTPA8HIe4lMWmVeXY57s1O8fYV9NIUTsPM97rN6VMGt2ulNelVVkLgzToDtnIgq7RRZ6uAYM1wTPLXi+z6aWBNRMreJ2RE79ubIAGytC2vlI+AzZwgPj6XsHOVNOuzH5pVi+nLYB7zVT5UsiUZPSjAHkRGiX6RJ9DI2gvGi6Rk/Vj8s2GUPS4dXMQxt6AupojlEXE61MVft9+uHCY+5a5DCG1ZF97+etj0Dt8lSYtmyCIP/GA1UFccvhg+tA/usPHpVnLuYaX9zb50fXmLKJNZkIx8BxKgvGr2CSKp70L0J4c0sTkM/9m8F0fOhBTuYGrP2/HklYR3moUH0ovkEsuEw6+ujum9tobKz1z14aKRXxXRMustCms/ankMLehMxrCQT8mptex+3HcT3KJVX12gygZsBM/zunkNpv4j4nRB+eYZYyea50uKozM7kjopQmOzPh0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7416002)(66946007)(83380400001)(316002)(4326008)(8676002)(6486002)(508600001)(5660300002)(2906002)(66556008)(186003)(8936002)(86362001)(38100700002)(110136005)(36756003)(6666004)(31686004)(31696002)(2616005)(66476007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE5oK3l4RXV0U3BtQUFsaCtldnZ3c0pxMHQzMzNDSTlJQXQ1WTd1WERNM3BH?=
 =?utf-8?B?Mm5jZWJ3MWF4QUhGQldrR0gzdFZ4cDFxRWdjYjY2YVZHVkdLaWFuWXh4dXVY?=
 =?utf-8?B?OXV0SnNqbDcwMGRaTnFxeHRyelFkQzY2b0dDVUhvcUlsSHFXTVFJeTE5bkk1?=
 =?utf-8?B?SFhoRVo4b3Y3ZDlKV3VISlpmdzBHaU9ZMmxrem9NU1MxTWV0dU1FVmJFb2pr?=
 =?utf-8?B?WG9aZHR4dEM2M0MwUzNzWmIrUGFSL1k3MWpsaXB4MGNMZWRrR2IvTTN4Q3Zy?=
 =?utf-8?B?OEpIZVFheWFycFY1SXhoaTVVS0phRUpVUzFYaFMwUUtNU2w4MmdoTUZ5enh1?=
 =?utf-8?B?dWw0YW1XWDBqbDJhT3RUb1habXV0eUhJdDAzMUE5MDZWVDQxRFExVUdyY1Qw?=
 =?utf-8?B?Q2I0NytIVjN1ZU5oOFBhWGJrLzdUODg3cjQ3SVBZcWxSV1RaU0RiNktnYUYy?=
 =?utf-8?B?RUk5eFB5VGJiQkRoRXFvR3FQN1dOdHB1UXJXb0tERk14d2VDNG9lQmlQdzl4?=
 =?utf-8?B?c2Q3eURrTFk5YW9EUWdKYkEzSnljOGh5TDhQRG4rZVppTUlHNFBsYnYweVFU?=
 =?utf-8?B?b1oyWHcrbGE0UVBReUcyMHhldDNKT25NUjRkYjllVFp2WTdmL1pWSTJHclBn?=
 =?utf-8?B?OHdCVXRPTUp0ZmhkeEdWckp4V1JXWGRhYk4vOER2cHVGS05kTXRRc25zSGp0?=
 =?utf-8?B?N0hyeVNxVk9FRjdOY1d1UjlwMktzVUJDMCthOFM5Vk5Ibk5sOHBLQkQvYUhJ?=
 =?utf-8?B?UWovUzFEVzVWOGNSNldubVlkUmNxUDBmdkxERGk2dFNyRWFoMXNtdmQyRDhP?=
 =?utf-8?B?ZDRUdzU0b3RNVTl4UGVFQU5sS2JoZWVJRTFJamVmSi9aRkV6elk0M0NjWERr?=
 =?utf-8?B?OTJIbm94NHRnMEJFWnJPUDVzckkrNUQxN202VitnbEUwRVVlN3BvZVprVVl0?=
 =?utf-8?B?NzRPUGtET05nVkdxMEJkS1VCSm4weGFaMzRlVW9UamkvKzFPYkZJS1dUWUJp?=
 =?utf-8?B?OFpOeVdDY0VNWXBoemxTTFdLRThyZHQ0blQwQ01qRkNwQXhYME56VHFMY1hV?=
 =?utf-8?B?UFlXNk5penVwaEFMOG5wZ1B0WTdhcDV2Tk0yTHkzNnpGcXd0WXlPU0JrN1Zw?=
 =?utf-8?B?SFJQVWdHZ0UrN0tkYVRGV1EyMXVvZEtuT1BUQ2NFSWZWY2RZeVdjVVh0dm1v?=
 =?utf-8?B?S2pWYUQ0d1Ziczh2cUUrZFc3cDZEUHdsYnhlaTRzN0kwcWxIZmE0MHBEOVpX?=
 =?utf-8?B?Vk5uZytFMG9TT1dGSk54aTZJQmxyeFVLbGVkMloySDZBWVMwSVVrZ1lDb3h0?=
 =?utf-8?B?bVJpWDhVWlNSWnBNKy9CQWRqUGxXQVJRS0VyVHRLci9oU2RxM0NQN2pBUDMx?=
 =?utf-8?B?YjN0TGJuRDBJNnhlTnRXTEhadi9yZU02Q2p6elYyYkdEMXpna0oxbWVONXBV?=
 =?utf-8?B?cWs1bmxyTXh1Z3RhQ2JsdEk2S2ZMRW9sSVZtUWIvSzdlZVEvZ3gvcFJJYnU5?=
 =?utf-8?B?dTdtbDQ4V21EOVdYM3d5dWRjdzVpWEVrU205Uno4TTNRZnZTMjNEQVRzRFFJ?=
 =?utf-8?B?elkzK3pudml2eitLN3k1Z1RDTm1JWWthbW1lN0VCSFB0THV5R3RwSjhWUGp3?=
 =?utf-8?B?MTFaY25hK2lNNHVLTVh6L2RUdTZpdW8zTldIeTBzZGFqa1V2NnVNSzRvemNm?=
 =?utf-8?B?NGVOeGgvREp0ZHk2M0taZU52SHZOaFBpWW5NbHRKQ3QvYTM0dGg4MTcrdTVa?=
 =?utf-8?B?OE9wVHVkN0FXM24zakprMUl4ZGRZTVdua1pKd0NTTUlVRUlNUFFEbzJJRU9N?=
 =?utf-8?B?SXdNSnpRaTcwWXUwbSttVGQzTzdpNE1EYmVPU2ZQWDlFejBTbW15MFFpZWlS?=
 =?utf-8?B?ckJSWGlacENPVEQ5MHFmSXZ0dGJDQ2Q3SW0yT3dua0hFUW1TdTZSbk00blRE?=
 =?utf-8?B?YWRabGVRUHJaUWtkV0NNNnQ3UEtNTU44MUcyS0hGWW5YVTdGMXFPc2FqMlpo?=
 =?utf-8?B?SkNHZE9xY3ZMSWl6bGwyNkZoZlhGOWdQV284ZFowaDExRWxzOExTUXVFTm9h?=
 =?utf-8?B?Nm5CNno5OFJuSW00ak1Wa0dYMlZCdkxoSmk0Z1N2Q012NnpZUWpXallUNFV5?=
 =?utf-8?B?WmFHcnZ6by83Q1RBekVyZlZTOHh0OXIydEVmcGxDeEtZelFUY0UvTzAyNGpy?=
 =?utf-8?Q?PMXIk3V6YvvN6BpI441zyKY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 114a9b08-ef83-401a-e35f-08d9986f2eec
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2021 10:55:54.8732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTmjoxK5oy8VSX1xnElsDtC95Zvoi4PshM+1sZSiRKoI8pC/fu0qYsN/Cq8lK6eO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4570
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

Am 26.10.21 um 10:34 schrieb Arnd Bergmann:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The new driver incorrectly unwinds after errors, as clang points out:
>
> drivers/dma-buf/st-dma-resv.c:295:7: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>                  if (r) {
>                      ^
> drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
>          while (i--)
>                 ^
> drivers/dma-buf/st-dma-resv.c:295:3: note: remove the 'if' if its condition is always false
>                  if (r) {
>                  ^~~~~~~~
> drivers/dma-buf/st-dma-resv.c:288:6: error: variable 'i' is used uninitialized whenever 'if' condition is true [-Werror,-Wsometimes-uninitialized]
>          if (r) {
>              ^
> drivers/dma-buf/st-dma-resv.c:336:9: note: uninitialized use occurs here
>          while (i--)
>                 ^
> drivers/dma-buf/st-dma-resv.c:288:2: note: remove the 'if' if its condition is always false
>          if (r) {
>          ^~~~~~~~
> drivers/dma-buf/st-dma-resv.c:280:10: note: initialize the variable 'i' to silence this warning
>          int r, i;
>                  ^
>                   = 0
>
> Skip cleaning up the bits that have not been allocated at this point.
>
> Fixes: 1d51775cd3f5 ("dma-buf: add dma_resv selftest v4")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I already send out a patch to fix this up, but forgot to fix both gotos.

Going to add my rb and using that one here instead.

Thanks,
Christian.

> ---
> I'm not familiar with these interfaces, so I'm just guessing where
> we should jump after an error, please double-check and fix if necessary.
> ---
>   drivers/dma-buf/st-dma-resv.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma-buf/st-dma-resv.c b/drivers/dma-buf/st-dma-resv.c
> index 6f3ba756da3e..bc32b3eedcb6 100644
> --- a/drivers/dma-buf/st-dma-resv.c
> +++ b/drivers/dma-buf/st-dma-resv.c
> @@ -287,7 +287,7 @@ static int test_get_fences(void *arg, bool shared)
>   	r = dma_resv_lock(&resv, NULL);
>   	if (r) {
>   		pr_err("Resv locking failed\n");
> -		goto err_free;
> +		goto err_resv;
>   	}
>   
>   	if (shared) {
> @@ -295,7 +295,7 @@ static int test_get_fences(void *arg, bool shared)
>   		if (r) {
>   			pr_err("Resv shared slot allocation failed\n");
>   			dma_resv_unlock(&resv);
> -			goto err_free;
> +			goto err_resv;
>   		}
>   
>   		dma_resv_add_shared_fence(&resv, f);
> @@ -336,6 +336,7 @@ static int test_get_fences(void *arg, bool shared)
>   	while (i--)
>   		dma_fence_put(fences[i]);
>   	kfree(fences);
> +err_resv:
>   	dma_resv_fini(&resv);
>   	dma_fence_put(f);
>   	return r;

