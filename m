Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD36C3B234
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1F110E8AC;
	Thu,  6 Nov 2025 13:16:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XnZu9v/l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011066.outbound.protection.outlook.com [52.101.62.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B5410E2E3;
 Thu,  6 Nov 2025 13:16:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4UdXSOEDEL7WOyRU6VxJA+GMU9HnPgrwUl0Al5Hpdq9Q7aj3xA+42F1BYRohtXt/TR+vhEjrrW3LzD6t0k4HrIddLa58ssmpc0ecxZ4I42CNZT3YhxhEdGDCXqUTK0xByyA4GIebNRMLByZbhKv2+qEcPy71AHCPZtuGrnxXPvuLXxh2xb5FVz+SQ6aBFGotAvmSyIO9atYieFUq7q1BB6NxAvK5dD8eiOkZ2TeHKS3HZjUUI+dtkg6wNYI8cUH7KJgxwO2VHwn83nACMI3aaVQ8Qjc9I/ZkI+KWUKDM5tkuAhj++Pkui2De+UBsCjmdpnktQgv5p8k1GrhEU91eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=loHuxVeUC7Ftz3QeGHT1WbK7zbh/+YcRGk3P+MhtTQE=;
 b=vRse2N4j/X/QnwZQI5lXWNCWt77sCFrJngYgHZG8m/jAjl+E/OCedj4mumBzNwSD8vv2aPy1nXeRaZXwDvNpQ83oCVJsmVI04xr8Z3gUkVsNGxQSCPaBaZUu1VG5ittek7IisbEqMw/9JxJndvHwR55hSguAUch7d5UWk+9zC65O3RciRGuwsYhTarbOOCHpPzXLmI9r4h9zpQZ1dgdnpxc1LcKIIrj5XVI29UzXwN7Koht5vJ9jnKyiJyojACaP3DC4ouiiB/V8/ajme/993GSdui8X7Ekon44yLOr6ipE26sT6wnRVyGFuadauLoERH8fjZspcA2yzzm+NmHXesA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=loHuxVeUC7Ftz3QeGHT1WbK7zbh/+YcRGk3P+MhtTQE=;
 b=XnZu9v/lHt3eMi/U4bDsl3jHx9nw1IOjyaIPTmL/s6825+wJrBVq7pX88g+wjot3XjGiM6zdMEepKIalfS12rhq3/wo34Sz+OPKJIjKcUUMshmTzkzI7FxU9JA1xJaBvWUK8NMlYSQB35at2jFevFHZxaMpsKZZjpPT8fdqXJ9k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Thu, 6 Nov
 2025 13:16:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 13:16:06 +0000
Message-ID: <f9bdca43-d21b-4f8b-942a-ac54a35ccccc@amd.com>
Date: Thu, 6 Nov 2025 14:16:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] dma-buf: rework stub fence initialisation v2
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 alexdeucher@gmail.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 felix.kuehling@amd.com, matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-3-christian.koenig@amd.com>
 <c9b23fae-cb89-48cb-b9e2-35804bdc7701@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c9b23fae-cb89-48cb-b9e2-35804bdc7701@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR14CA0017.namprd14.prod.outlook.com
 (2603:10b6:408:e3::22) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: e8c3f4af-db9e-4846-661b-08de1d36a4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TzU5NFB4Mi9JN3NvWmFwMFNtVHVKWkd6QWJBWTlFak9vYnpyaHphYXJkZGJR?=
 =?utf-8?B?b2NkZTVGUjRmSHlYRWFPWFREODJzekxJVW1vcmZlMEpSSFppUkFReEREbEoz?=
 =?utf-8?B?eTlUNjNZZ1UyT21ZTExGM1lOSWZ3N1oxUDRhVGFEdkp2am9yVXU5NVA5TkRx?=
 =?utf-8?B?T3d2TUpUUUszblM0L0RVamN3Vjl2eDlDK2dpN01RWVY4WEtZYlFRbzBjLzRM?=
 =?utf-8?B?ck53bTQ2Ni95aDVKdGs0b0x0R1BnWHJrcjdIZGRESFhtUDZhc0RBZnhxY2wr?=
 =?utf-8?B?bUZ3dU5VVVQ1c1FrUXlCL0ltekhPRU4vMjBTNk1tc3d0ZS8wUWdLbmVRV00r?=
 =?utf-8?B?TExjTU52akpIbS9FakFyMGtTbkhwMEJTN3lPclQzbS9uWC94MEVVSW10VFBo?=
 =?utf-8?B?UXU5NXhnZkE5cUN1RmlITG1GL09IM2VEMmVLd1hOYk12Q28xcFlRYXVXKzAv?=
 =?utf-8?B?dXVHZUFlcWc2eWdkc2JFQ2orSzllYjFPa1ltaDVIUXpaOEpKa2xqdEdzNTVC?=
 =?utf-8?B?N3dFcVhISXp4QVhCdHpRK3FNMHJQdmg2ekhyRXBYM0lDeDhSajhsRzhuTzdM?=
 =?utf-8?B?RlZrZ3JtTXYvYUQ4RWF3bU02aHVQU0dPTjdZSnRhR3hWQkcwV3pWQnQwNWln?=
 =?utf-8?B?ZGZaV3llV21TS0x6T0tNRjRuQXZ0UVBTTGNQK3YwK2tXMk9CRWUzRlhEcWRV?=
 =?utf-8?B?czU4V3VSKzR0US9oVjF0Um5kZWsyamp1U3g5YzdSOVRNeWtOazJSaXdpRUxG?=
 =?utf-8?B?VUdvODlpdFEzaE9Yc0cyUjdCWEFyV2g4STE0ZEYwUWpUbjZzei9DWE5NRlMv?=
 =?utf-8?B?ekplRUdGRjZadlVUYUwydWVQZk1qUXZmTi9LZkM4cjdiQVBCcittUWpwVFVE?=
 =?utf-8?B?WkNibFhQT1JCeUE1a0I1K3JVVDN0bWp5NTMvdVhDNFR3YjhBOXpIRmR2N1hx?=
 =?utf-8?B?YmZwcXRUU1R0OE4yV25OM0dUTDNNS0t3cmhvejJWd0U0SE1uWnBoN0NFb3JX?=
 =?utf-8?B?dWo1UzZBWXdObDlKRlJDNFpPSjJWM0pmbCtjU3ZBaktVWVFUd1FwRGRDZkFh?=
 =?utf-8?B?SVoxM1h2aUsrT2RCWkRaTUswaWRkSGFibTRBTzdvOWQ1TXRCUDM5L2dWeDZu?=
 =?utf-8?B?VlRpVVlQRGtEN3hoZGFIN2VKQ2FVc3NZVS9BM3lQZkRWSnpsOXVpUzNnQUZx?=
 =?utf-8?B?enV2ZXBRV00zUmJ0QTZuY0EvWlhmUnpKV1FCVjZlRE82OFhBSkZrQ3A3TEhi?=
 =?utf-8?B?bExYK0hZV1B1T1ZGdlBDUnpDWnlxbkVmUXR5U1RSN0hIQzlibU53KzROQ2xz?=
 =?utf-8?B?OTFkeXFtU0NyQnd3M3lJY296Snh5M0xueitaL2QwZFVkYkxRYUlpVjZSeVNy?=
 =?utf-8?B?b0kvMzVzOGVrb204di9CR00xemw1dlV4d3BBVkg3Z2t0cElrQTNDb3VsSU1M?=
 =?utf-8?B?bFBmNElEWDBJeG5yRDkrRi9hWVJaTEVka1o3TXg4OWJZc1VZM1RJdW10d01Y?=
 =?utf-8?B?Y0FPZGJiQno0R25lREgzcnpodUNYVGFWQ3VHb2I4QUZoR3NybTl2ZUtab3pS?=
 =?utf-8?B?WGNFRUduYmN3L2sxd2NpYUMxT0o2V2NXYmFraVZSNHNkQzk4a215bkM3dU5G?=
 =?utf-8?B?NExlVGVTNGNPeXRmUHpHUVJKMnVVbTdVYUhYVU5VODA1WEJ1WUl2TjlVT2lP?=
 =?utf-8?B?cG5BeU96anhrcmNqcDJKUFB6aUxtOElxSEpaNjFhN1dtTi9GekRKcnM0RWJN?=
 =?utf-8?B?VkxDQ3o5UU9zMUNzb1VZTGNOS3RMVFNScUFETnR1cG0rZmc1d1VQSHFlNTVu?=
 =?utf-8?B?aVV0aGV3Z1BLL1JQM0E4Y245R1N1ZVlDRWkrais2anZNNkJNM1lFTWQ2VTlU?=
 =?utf-8?B?ZC9RQ0J1eFVSK2JaUEYrY1k2dXlzWnN6VGRxeDFKbTYvc2VXMEhiWTh2WCts?=
 =?utf-8?Q?B/rR44xJo7hs/yAzxDR80A5Ha6hLGIU8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRvTER4cWg0cVhUN3ZWV0xUL3BYNW56SnlNRlB6WGtPaTM4aXlCL29IK3Jx?=
 =?utf-8?B?RyszTlppTEtnekMwVGZaY25YNlB5djhjaEZOVFlrbjczZkJKVGFaUFhoYXJJ?=
 =?utf-8?B?dTc4TVk5OGsyOFlnRTN6WnZ5aHdWVzNFcE54bmJNWmhkZXRFZHI0U2Y2TXBM?=
 =?utf-8?B?NTdPNGtWSWduV2g4MVlVcU12Z1oyelg0YVp4clhpbEVjSkxCVVYyZHlpMjR6?=
 =?utf-8?B?RXc4VDE4TEljeXpwWGFNSTVVZTRVUVE3aHhITFExaE93K3NXOGRMcHhYNDc5?=
 =?utf-8?B?bFZnRkhrMkJTLzJ6UGxjWlZpSDJDSzVHSDFqQThJMmswUUFLV1FBemNnV3VY?=
 =?utf-8?B?QUtOaGdvYndDUFpKSjNPeVdISTFnTHlocFYzZjBPQlpibTJXSmpLOFJ2bWx2?=
 =?utf-8?B?K2Q2TDFMUHJqVVBoOG5zcVBDVzZWTEsxM3lpdVB1NjJVZ2o1NmNoSjh2aVRG?=
 =?utf-8?B?dFNWN3ZHeDZ3eEdHblFIbGlLckxnOEdJRkpkajQ2aWJZTnp1d1VGTnREM0dD?=
 =?utf-8?B?TnBmZC9jNU5EelFEL1ZNc2tzSFI0bEEySWF0aGR2Sk81dzFJcXZQakxkS0pW?=
 =?utf-8?B?SWtJVTIwWDZ0aDZrSklCZmtYclk1bWNIdkVxbzdxOGp1YlNXVmZZSVVUeUpR?=
 =?utf-8?B?a2s3dVcreFcrVG1mSXFHaFB5dmR6enhEcVFYNmpIbFkySTQ2eVNtcFNSczBu?=
 =?utf-8?B?cjFsUEZuOXBTSWFkS1lUblJoNkl5RVkvaDZvNUxPN29POVBKUmhVcU1qWEZo?=
 =?utf-8?B?cDhsUEhmbitHTSt4Q3NGdDVKemthc29tTG9qQXZZQytSSkpYS1o1ZnNVMW9T?=
 =?utf-8?B?YnUraTBPeG1ySFZBOUY2NFNIYkZWN0pyRjkvUlNwQjJ3UTF1aVZFaDZVSnBT?=
 =?utf-8?B?VC9LTFM0MVFpWXljWXNMTjdmSVYwLzJrcnA5cmRGWE5KaGRIQzU3dFBmbTRI?=
 =?utf-8?B?WUczOGtNWkh4cVRKcE5ueTdaNGVCWG9hMWtaRXZhQ0c2c3JkcFQ5TGRuWkQv?=
 =?utf-8?B?T3MyQ0Mwb25udUd1WmxMQTNhNkNNTVBCSytBTzEzaWJ2REVRTjJmb2EvY2dO?=
 =?utf-8?B?RnM1R2YwbEdQaUg4M0FLYXR4bWlVdTF2bHFiWTZqMGFzaEpiWHg0WERFWXVo?=
 =?utf-8?B?Qi9nL1FtRXZZQmhaRHhXbGdiY2Y1WVgrY0g3bkVRNXQ2N1hQQW9nU01kN2hj?=
 =?utf-8?B?anFET2ZoRXIzUTg5TG9oRDhURFdBMGFSRmh2WEFrM2JoUTN3WnRzYW1CU3BB?=
 =?utf-8?B?eFg2Zm4ra3hLWXhETk1xRjlET3ZFNDczUVBxbmNQdHNpMC9YdHIyU0xxNkQ5?=
 =?utf-8?B?WXQxZU9wVFk4ZURlWmlPdU1wOXdicHI1ZlFqWndsRHg1TDRxcnJWdnRaL09r?=
 =?utf-8?B?Z3RsWFJwY3pIUy9oMlF4SGNwSzJiOHlSWW9WeU9ZQ0ljQU5ya2w2Lzc5NHdx?=
 =?utf-8?B?bGtaVlJOd2VPYkxyd0t1S3BoYXZwU1o2cllDS2NadWtnQkc3TVgxNmpHYXFV?=
 =?utf-8?B?SDVXNVpXNGc4eU9FS2JQTDFhbUZuVm5tSEpLWU10K1NUc1VHN1JNT1EvTCtK?=
 =?utf-8?B?aTlKdit1UzZoQks1OG9kc01iaTVpcTh5citYVkRqOWxnODQrdnBrLy9xazNV?=
 =?utf-8?B?NVhFTVJINDRnT2VoNUJVK2tCU3AxVFkwSUsvaWRXanpIK05BdXBsSEJYS2Zk?=
 =?utf-8?B?cHBHb3VFa0Q4VlRlcWUyNmsxbVNGV1c2NFNRRGhHZzYxb2h6YUxuMFYrbXVz?=
 =?utf-8?B?REJQeXZmSXdGZ3dPL3dDbkIxeWZWVmIzaGo5VDVXVUVDNGhmMEFQRlJRZ0R5?=
 =?utf-8?B?M21ZY0cvTmtPdVQ2dkk3dWRJWU1SVTdBVDY5RUNUbFo2T3RWVXVFc3B6MFdQ?=
 =?utf-8?B?OCt3Wlorc0FBcDFXcXVJbkkveXpuektHOXRHTzlvZXhTV2VVT0IvY0Y0TDk1?=
 =?utf-8?B?RldFQVZYd3VjallBYjJ5TnJxeTNvbUtIcWdlelVIb0VyZGg5TlVDQUhTaHFm?=
 =?utf-8?B?b2VBdTgwaWNKR0ZyRUdBc3UzRkVPSHVvdWdaNEp2djVpM0hxdndOVXVoZVRi?=
 =?utf-8?B?aHo5OFNJQzJwRmtMV0l2RGthT1VzcmRyK1hFRVkxeThWV1FYM2tIUU04U1BW?=
 =?utf-8?Q?07MYmZvvvR2gJcAsUsj+8TGw5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8c3f4af-db9e-4846-661b-08de1d36a4f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:16:06.8793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKmmqmvXnENGnnofNvEIbphECqO67oWApWoFFqjgKfctrlL0yZeawVhkTfeXFkam
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
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

On 11/4/25 16:01, Tvrtko Ursulin wrote:
> On 31/10/2025 13:16, Christian König wrote:
>>   /**
>>    * dma_fence_get_stub - return a signaled fence
>>    *
>> - * Return a stub fence which is already signaled. The fence's
>> - * timestamp corresponds to the first time after boot this
>> - * function is called.
>> + * Return a stub fence which is already signaled. The fence's timestamp
>> + * corresponds to the initialisation time of the linux kernel.
>>    */
>>   struct dma_fence *dma_fence_get_stub(void)
>>   {
>> -    spin_lock(&dma_fence_stub_lock);
>> -    if (!dma_fence_stub.ops) {
>> -        dma_fence_init(&dma_fence_stub,
>> -                   &dma_fence_stub_ops,
>> -                   &dma_fence_stub_lock,
>> -                   0, 0);
>> -
>> -        set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>> -            &dma_fence_stub.flags);
>> -
>> -        dma_fence_signal_locked(&dma_fence_stub);
>> -    }
>> -    spin_unlock(&dma_fence_stub_lock);
>> -
>>       return dma_fence_get(&dma_fence_stub);
> 
> Actually could you check if this could be demoted to static inline? It strikes me pointless to export a symbol for such a trivial wrapper.

I thought about that previously as well, but the answer is "No it can't".

We would need to expose the dma_fence_stub symbol then and the reason we have the function in the first place is to avoid that.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>   }
>>   EXPORT_SYMBOL(dma_fence_get_stub);
> 

