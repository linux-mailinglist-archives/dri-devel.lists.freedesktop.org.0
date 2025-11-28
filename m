Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE51C91FE7
	for <lists+dri-devel@lfdr.de>; Fri, 28 Nov 2025 13:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AFF10E14E;
	Fri, 28 Nov 2025 12:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Kt05Na8K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010029.outbound.protection.outlook.com
 [40.93.198.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E531A10E14E;
 Fri, 28 Nov 2025 12:31:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y+kUG/aZCNoYHHSo8Mdgkjv5HVCuEI4Ilq/U6yMS7TcfBP/rP7rI8mFSFyt0Z7ZUFSxsFJI5I1Tlo3BiVR59ADFKCbIyeO/66TSbMUfFR2krnDSMld656OGEIe8G32nRl+2OnLXlU/q6IredYK0UCSOKzX/VMDObBUQLPfb76mItzJogVkh+CaS3nDZaHwWjAc9aWKq9OMll7Lg9LlZh6GMkB21zWAT6puwzDGgV0KVpkQSuvrJnacj2jVQlgW6Lmz+0pJ4HoSPZ6DkiT0daHTmhogTm2Ch7M8Wm333pXEN76333aEC7zWJ660bAnmq+RCJHiX4kq4XlflphCVctiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7Su7l980YiqkMklDCxRb7I7fehxwbwVr4zwL+fx3zY=;
 b=yN3COJQQ4tagP3SkA6V2ZX0dKZZipvxIFLAEfAnMvlf3g6DHl4IZElM8ID0xGNziNn2nXKIRAATv6H8Ze0UVs5pP1I9+cdmIXbqBgFuCMjj8vQtljySGMmVVHHuJzgefyrWWyX3PA+q9QUoxQ41sM9Y8JRW8hnaFFQIyvGzBY9bO7heyRjb8FdVLR2m9zXp+zi8vAaB/atL7qci0UC5LGNm68NgWdSYsO6Nf/vllSXnHakoPwk6VihhkeHMsNpK3KbnuhlPwE1mffb67x5wesO4VoMkJFzV8VoZTpbCUoyu9p3n1cYAKcGsISZ+IpL/Qu/XC21/c+Q9pceq8Um42Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7Su7l980YiqkMklDCxRb7I7fehxwbwVr4zwL+fx3zY=;
 b=Kt05Na8KHEEvReCP0RJGwCHHcv2uFkGuUpbN1fRtuObRQw87jaKp0J1tCAVtyXAxY9rQrc9Xszwn9Q0elc1D9JQ7vhdhrszDvTopvrvJAn05cL9qY+kg8uw04p2hXOtoBMvTl78MW73eaaeneGjRa4dYOm9AWXaJC+8yMpUlOkQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4162.namprd12.prod.outlook.com (2603:10b6:a03:201::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Fri, 28 Nov
 2025 12:31:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 12:31:22 +0000
Message-ID: <c668f830-206c-4540-add9-ce857712775d@amd.com>
Date: Fri, 28 Nov 2025 13:31:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/18] dma-buf: use inline lock for the stub fence
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org
References: <20251113145332.16805-1-christian.koenig@amd.com>
 <20251113145332.16805-6-christian.koenig@amd.com>
 <f5d3be540586a471a008a730b56da26f0966f159.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <f5d3be540586a471a008a730b56da26f0966f159.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0224.namprd03.prod.outlook.com
 (2603:10b6:408:f8::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4162:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab40708-b19e-4e3c-9776-08de2e7a0a2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3V4UmV6YjdXaHMyZWdRSGhGL0Zwc3NuQm96M3lZWnZPdi9uSzZBai9hYXdM?=
 =?utf-8?B?cTY3MTlDZWVoRE9tMFFvL2xJTHVYc2UzOVAza25jT3dMTk9COU55SjB0Y25n?=
 =?utf-8?B?cWk4VVpuQWdyVUtlenhkdWFaZUhpNHFFMDVnOG11ejEyZ2trZ3ZtZ2F6VjBt?=
 =?utf-8?B?SlkvQ29qNnNkSzUvRWphTFdQTWNnd2FaRmVCWFJZbHN0OWZ1dEFSZzVOZk1L?=
 =?utf-8?B?YWFDdU5VMlV3Y0NoNEFYbHhYVFRFd3JhcjFkd1pzYTVSSTJuUVY3cE9jS3lu?=
 =?utf-8?B?M1ZCZUl2M3VVRWJlOExMazJEUVFuMFdWcUpqZFgvanEzWmg5NFIwK0Z2bFR5?=
 =?utf-8?B?enN0cFp5YU15SDFnamFYMlhvdktTVmg5U2ZuR3ZTYXA3emJyaWVqNU1JNWFF?=
 =?utf-8?B?Ti9UM3h0K0FiTzZ3cjNZS1pJWExQbWsySGxJb3ljaWZWWFU4RUhvazQ0TTdm?=
 =?utf-8?B?MGQ0REVZU0ttdFNMdktvYmd5KzJ3SFFQbGZKYWowbnd5dFg3OGc4b2ZLLzhm?=
 =?utf-8?B?UDZSOFJCY1lXR0VpZmFhQVlmV25mb2VlSGZFa3Bhb1p2d3JmOHE0ZU5NOEpF?=
 =?utf-8?B?M3o1SUlFTnBHSlE4Mi9tVDk1RjBLK3B0QlBJSHBNM0lZdTd3YnE3bWtLUU83?=
 =?utf-8?B?VzhEOTZ2QVQzSG1zQVF5N0JQbGNvWmREOFlaUUQxL3lJSlc0aGVvcmxMVDNh?=
 =?utf-8?B?V0pIRnJGSGc0UlE1QU5QVlNBVFRUNkQ4OGlOZTMvUUxzRkRuVjk1dVBWZDY3?=
 =?utf-8?B?cXVnRWxkaFVRZ1d1SXNjMXI0Sk5URldhTXV5NzlPSlFRSE5HWE14V0hkRlg5?=
 =?utf-8?B?d0xnWStWTzdHaDE1ck05OC9HcXluWWlRVjZZYXVIc2UzWmdlNW5rM3cvU1dp?=
 =?utf-8?B?L05IMUU1Y0l2UUhJNVlIdUxQa21LRnFZQ1h6MitEVjc2TGFFY0xHb2FYbFJK?=
 =?utf-8?B?RGs3bWhOZ0UzVlRZazB3M3JySkhmQjBWSW5NZ0Z1blVoMVVvRmJPUWJqdVBN?=
 =?utf-8?B?RmljRlRkOHhtOHFPWERza1VYQWk0WEVFZG9JMDlRem9YMndDem9TbTZ1Njdh?=
 =?utf-8?B?RzhySjNGRFlwRlFMQ0VXYkZQV2hTRUtWTFh5VHFlbzZ6d0t5VFR2dW1ud2Nr?=
 =?utf-8?B?M2VyakpKSVdBNXFwQkFVMnlya1YxOE9WQ1k4SkVsd245RC9ZaThmTmNuVzQr?=
 =?utf-8?B?ZHJWRHNWTXpQSU05RTBaa0tSUldMTkFVd2dRbVBxRTZOWTB0YWc2SjZxR2xQ?=
 =?utf-8?B?MDloNUNrMWR5R25YRVJRRzU2OGp3SlBzVjNsRkN1VlZJc21IdlowNjJ3aFZ1?=
 =?utf-8?B?bTA0RStkdnM0dklheURFclhoYmJRVWI1ZDAzYkVhQ0pvOEk3Qkg5QjU2RW1P?=
 =?utf-8?B?QnpoTFhWM1VocUE4N3pDZFJLU1JWSnpBd2NXK2lQdEJHMVFlSUp6Rzc3aktT?=
 =?utf-8?B?NDRkZmd0d2drY1M1amJYeWJVekRZWkFseHloYXlNQnUwcTVWS3MveTlUbFdn?=
 =?utf-8?B?T0JrTGhCei9WZWpsSGluUkZOZUU1VFFXOGxFNURhZiszbXh0aE84TWFHYjFo?=
 =?utf-8?B?NFZhb0w1Y25uS3VUWXR3TUs2TGVqMU9MTThmVjBlcFlkZXdTckx3aGJWMGhD?=
 =?utf-8?B?RGg1M3ZzU3JITEc2QXhlaUZZOG8vSUFON2VhYll1WGxKdmloNTd1QXJyZDdi?=
 =?utf-8?B?cmlKYXp1WkNFRFFBd0E4TEpBMzJIU0tqVExnRkQ2QUl6K1BYdFlDeHVNMllu?=
 =?utf-8?B?RURaeDFJcUdKNWFEZHlGQTFGdDNEQUt3WVZCajJzQTg0OWdWb1JsSk44eTVJ?=
 =?utf-8?B?NU9LTW9wVVZTSE8xdnYzVUxYbkVRZFBVUTJJR2VtU0dVS2cxVCsyOXRFcTBX?=
 =?utf-8?B?YUtBZVI0b3EwZG1FV21RNXN1cXNBTlpIb3V5VWpUNTlqK1o3YitLS0JlRFhs?=
 =?utf-8?Q?pV6ZopQTX/NlGSH/SRGkYC+7BAluivZ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVMwQVdYTHZmVVVRVmxLMTRORHlXM3FNTDNsZGFjdjUyVFJ6RDRwaXY2Tkla?=
 =?utf-8?B?RVB5VEJTaUZhWmJzZE9Wc1cvQS9tTjhhdEhPNXEyaHorbVFrUHZQZDRncERt?=
 =?utf-8?B?T3VwcThVNldGN0RFYmxscVpsN2Nibjl4Y1NvWms2cmJuTFcyRmFGb0JLa2h3?=
 =?utf-8?B?Q1E2ZU9KU1l5WEZwSkRkUnBuck9VSC9GVHU1bmREd2Q4QkxWaHhvSzlCN2wr?=
 =?utf-8?B?ZXllSVkyL25kaTV4Mzd3VEkxQ2k4bWFBQkNWRW93dFF3T0pVWUtLL3ppTC85?=
 =?utf-8?B?TytLdUxSZWRSKzRjNjI0TklnMDkxazd2eHBKT3RISm1kMHdaNG82TU5TenAx?=
 =?utf-8?B?U0hBU1BnOEJHak9MMlM4b1NHc01oNEN1Zm5XeFg1UGVCYmtUTExYUm84SkdQ?=
 =?utf-8?B?VEtLNkdpcjUwa2dlRTRTSWxueGJUTmhDY01JTVJlY3FlWWZNRU02Z3hPVzE3?=
 =?utf-8?B?YVN3bWxLWDMyWXRzYUlYYjdlSjVaeUQxc2czT0RXWTRNSU83LzVLQldjZDFC?=
 =?utf-8?B?UmF6dHFZc0MweDhYeG1Qb2Q3Smh5ZkdnM3V6Smw5bWZXSDFMeHR4ZFkyME1w?=
 =?utf-8?B?L1NOZ0tGZ09rTXJKZnNUbWdiTGJwM20velZ4YUExbnMrS0VwTXpJejBoUGZv?=
 =?utf-8?B?c2tvSzVKWSs2ZmRkVG9pUmN4VlVQWHRFK3FuVTE5aEJjS0dPMC9LUzA5d1Bh?=
 =?utf-8?B?c0JkdXRhb290c3AwUmNtbXNyK2l5SW1XM2VvaDBBYXBrTllhZWtkTGJMOFhS?=
 =?utf-8?B?Y3BxdjRXcEFUalkzODlWc0VIVmpTZzhlMWMxR21DYVhLcHdvdmlaVWx3d21P?=
 =?utf-8?B?UldIUktYWG1nZThYbWFoWCs4VE5UUFBEL00yM0lsYXNjM2lFSGkwSDZWK2l1?=
 =?utf-8?B?MkxEWGgzK0pLeDVNRVdJbFVtdzRVUEhQVUM1djI4dnNmRlV6TXVSVW5ETllo?=
 =?utf-8?B?ZHVYeUZsYXlXOU9NTjNHaU1zUE1rVWVNMVRaTzRBem90OFkrd3dkcEs4bElo?=
 =?utf-8?B?YVA2dDB3TmJZNysvelZ0UFdvanVwNjdJMy9wMTgxWERobmhkWEYvWlBvbVJF?=
 =?utf-8?B?RGVIVjc1T2RydWZjL0NGOHM3aTZtS21JQ3NLVVZlanVyUUNrZ21sWDlWRStU?=
 =?utf-8?B?ZnlYMVVLYzBVaGdzdVRlWGdNQkViandzdkZCQlVFekttNWloaDNkd2d6dEtZ?=
 =?utf-8?B?VWtxZnBzTjFJNlFEaEZUSGpTMjE4M0g0VnppNVJYUVE0ayt1dW1PTW4wdGVu?=
 =?utf-8?B?Y2hNQ09Lc3lPZXBFUlgvUHI3cFhkOHhONDF2R1FFZlA3NTE1Y0JxT1lyS1RK?=
 =?utf-8?B?d0dqMkp6bnM2dTNSVTJuVks3b0pCSWpVU0FhZzR6bDJLaE5qa3JnWFp6V2VO?=
 =?utf-8?B?YStGNmhCeHRqVkI3Z3pBOGFDL1M2NTUrSmU2NmY0L0ZTOE5MMjQ5c3plNEZk?=
 =?utf-8?B?K3FDQ1BWT3N4OVVHdkdKV3pXYklkN2JwNnpXYVcxQ2cxZUlwbTFhR0c4alZR?=
 =?utf-8?B?bXphcmI4c3BLK0lSc1pmNXcvdjNTTW01Vlc5KzVvMjRxZnNLRm1BUjJQdmph?=
 =?utf-8?B?V1BkMGREY2xOeDAvZmZqVWgxOTJqbTFNWDQ4TlVDTjJ6R0VQUWV0aG8wd3hi?=
 =?utf-8?B?RkJobTdEOEwvNkdSblNta1hHSlN6TkRrM2FseG9RVTdvNWNGOEZYTHhrUzhj?=
 =?utf-8?B?MENCZWtjMmdJM1p5a282d1RtMFVNZmxHTW4raE9RWUZBL2M0UlNtY0RrZlph?=
 =?utf-8?B?N1ZDWXN2Z2gvRnZnUXJ4NXVqWi90SnYyRWZnNFk0ZVdwdDVZK1BkcDRlR0tN?=
 =?utf-8?B?SWpMTys4SDA4WmZVUm1xeDhOSnlWWVQzU1p3dmRRMnlJckEwQkpSNXRuRjFD?=
 =?utf-8?B?N1BKa01IazloeEdONFk4Z0pPTnhLdW0yeUhQTUxrWFE5S1hTYWUyeU1ubEp5?=
 =?utf-8?B?cUxUaWl4NWR2Q1BmcVkvRTd3OFFHV0x0THBmQk1Zd29UamQ1QitRdC9iUXdW?=
 =?utf-8?B?cy9wcUk1dlA5Y3dIRGVPbHhGSjJZZjRJWWZwQjE3WkhqWit5aXJGaEJOKytB?=
 =?utf-8?B?eWlWSXU0QllWS2JDUGw3NzNqdjhMLzFuMDlHYWVwUXJZNmxETU95cjdYQ1pB?=
 =?utf-8?Q?u1hE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab40708-b19e-4e3c-9776-08de2e7a0a2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 12:31:22.8338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dNfwwGas7qTbB9m/rjMxq8vBpqIlW1apYwMhnXBK7yGjLCuzQ9v/xceq1Be+8jRo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4162
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

On 11/27/25 11:50, Philipp Stanner wrote:
> On Thu, 2025-11-13 at 15:51 +0100, Christian König wrote:
>> Using the inline lock is now the recommended way for dma_fence implementations.
>>
>> So use this approach for the framework internal fences as well.
> 
> nit:
> s/framework/framework's
> 
>>
>> Also saves about 4 bytes for the external spinlock.
> 
> On all platforms or just AMD64?

I think most if not all platforms. Or is anybody really using 64bits for a spinlock?

Christian.

> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>  drivers/dma-buf/dma-fence.c | 20 ++++----------------
>>  1 file changed, 4 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
>> index 9a5aa9e44e13..e6d26c2e0391 100644
>> --- a/drivers/dma-buf/dma-fence.c
>> +++ b/drivers/dma-buf/dma-fence.c
>> @@ -24,7 +24,6 @@ EXPORT_TRACEPOINT_SYMBOL(dma_fence_emit);
>>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_enable_signal);
>>  EXPORT_TRACEPOINT_SYMBOL(dma_fence_signaled);
>>  
>> -static DEFINE_SPINLOCK(dma_fence_stub_lock);
>>  static struct dma_fence dma_fence_stub;
>>  
>>  /*
>> @@ -123,12 +122,8 @@ static const struct dma_fence_ops dma_fence_stub_ops = {
>>  
>>  static int __init dma_fence_init_stub(void)
>>  {
>> -	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops,
>> -		       &dma_fence_stub_lock, 0, 0);
>> -
>> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> -		&dma_fence_stub.flags);
> 
> That change is unrelated, isn't it? Enlarges the diff and breaks git-
> blame.
> 
>> -
>> +	dma_fence_init(&dma_fence_stub, &dma_fence_stub_ops, NULL, 0, 0);
>> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &dma_fence_stub.flags);
>>  	dma_fence_signal(&dma_fence_stub);
>>  	return 0;
>>  }
>> @@ -160,16 +155,9 @@ struct dma_fence *dma_fence_allocate_private_stub(ktime_t timestamp)
>>  	if (fence == NULL)
>>  		return NULL;
>>  
>> -	dma_fence_init(fence,
>> -		       &dma_fence_stub_ops,
>> -		       &dma_fence_stub_lock,
>> -		       0, 0);
>> -
>> -	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> -		&fence->flags);
> 
> Same.
> 
>> -
>> +	dma_fence_init(fence, &dma_fence_stub_ops, NULL, 0, 0);
>> +	set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT, &fence->flags);
>>  	dma_fence_signal_timestamp(fence, timestamp);
>> -
> 
> I wouldn't remove that empty line (nit).
> 
>>  	return fence;
>>  }
>>  EXPORT_SYMBOL(dma_fence_allocate_private_stub);
> 

