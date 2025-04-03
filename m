Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9A0A7A2BC
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 14:23:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73AA810E9A6;
	Thu,  3 Apr 2025 12:22:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yw8eayrw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D6A310E231;
 Thu,  3 Apr 2025 12:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rFTHJssTHY5DWOAbaXqHaI+pmMDHeWsVYrJcoRDZVmE/4+QTv3V5Ku3+HgccSduCjMwBIz+OTTRWtPI3JZ59f0VoHR53rk9P8sAUwL5419r6M1RxRt5TUTUfR8INTakOvT4sifuIRvqPOpRuwNcN1iwqDpMUTEtjZfghvRiKq1ilG4dEjBruQ9wZ4MXEtGGIj9QAk7Glh6fxOwRqEJ6x6dXdNX8piGiBWfwbjxOcTEEG8a7gEos3lFqB4Opzylr2QpynfUX4yXItaXYQOXLenj3Qkaj3wH7MzUQym5SOkdDVc+4CfEPtb+/iBLCULquiGPhluTjEA6KrLk7OBqpNlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OltYQnaWPyrlEeNo+t0F7yYo4D31m3Eur4jIWsOD2V0=;
 b=osbUjBoZ68sgFI6CHgDXvTLIgOVuktced+6ngcl89UyztXcNZryLyeu3h+qlrmTddrfKqPnt3QM2o2YUv8SIFfJ3Co8W7DwfRUmLVXoIYLNc1OSuasnTMkqIS1XRjFIHvZE1rtf/isnzF1C0jMiOekAY8cPzWJqhMVzxBR+bSE2gClPh5ptA8sDsgxIqkLcP94b8WfdENWQDqc1aY9wUUEA5LAirhC3oriSfYA8wiMZunJ6pNBEejaGIVWNtxP6KTZmCRZ+taqnBY8KZGL5eRkvYZa7Q41yz0U92+KPaJIt/3hZBotuiIVH4e/wcO19sGfhXFNXD4tuwYPmhF+LKjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OltYQnaWPyrlEeNo+t0F7yYo4D31m3Eur4jIWsOD2V0=;
 b=yw8eayrwZpTKUXriN1PkX5KLpAL94mt23N+57DXoLxFvBNkvfd0Cp8xPuhxSvZ/ekaE5xe+eZOWbI+PW+aAUUs8Vh1gpiEGxTOhEnr9h1U2/5h+PyqvzJL8lwinDdBJQvIaYPlK3DWaPxMLLpMFp9AIx6rHIZht8Z/gwbsMPloI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS0PR12MB6464.namprd12.prod.outlook.com (2603:10b6:8:c4::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.54; Thu, 3 Apr 2025 12:22:47 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.8534.045; Thu, 3 Apr 2025
 12:22:47 +0000
Message-ID: <28343002-1a64-4409-b6c5-f9764705d939@amd.com>
Date: Thu, 3 Apr 2025 14:22:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/nouveau: Prevent signalled fences in pending list
To: Danilo Krummrich <dakr@kernel.org>, phasta@kernel.org
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org
References: <20250403101353.42880-2-phasta@kernel.org>
 <84b0db2de7a26aab00778bcaca15a0dffaa9c32a.camel@mailbox.org>
 <Z-5iK-mIYPIhanX-@pollux>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z-5iK-mIYPIhanX-@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0052.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::15) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS0PR12MB6464:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c99835-90c0-43aa-94ed-08dd72aa3e69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2dQanQ2bm1WSVZCdVJEMkE3c1BVdTNhdllOMzlJcTlJSy8wVm1uYnQxRk9P?=
 =?utf-8?B?cUhGKzlJT1pMYTFaTHN0c0F3UkovYVJwL0FUYmpnbm80WkRpNW4xWWNHWFZv?=
 =?utf-8?B?VUdhbUNhcURMRmNkVVJmNWNRbUVIdUFkTUZIU3A1Si93aUtoNlBoQndaQVlO?=
 =?utf-8?B?aTdlcVdvbE9ZSmYxQWZFOUo2cnJBL0ZGR2k2TUF3SDdIenhPL1p3QWhQQk1J?=
 =?utf-8?B?VXJHT2doWE84UFFmYk9JcVFnMkozbG91T1JZQkJZR081NkpvcS92WDNUL2RG?=
 =?utf-8?B?Q013ZW1DZmNXbmxkcWZKWmgvbEJmazRqMXU5MDVtZEQ1Vll5ZXdtNEJNczNu?=
 =?utf-8?B?ZjhoUjRWU3A4anVBaUN5NERlYlc1RE5WV2ZCWHBEYW5uV1JGSnk1Z0pMQ1Aw?=
 =?utf-8?B?RzdTMVl3dXZtT3c4Z3RIN2J2ZSsvZVJJT2FaMlE2TndYZlFDKy9qbmtUckFx?=
 =?utf-8?B?cUR0aS9IZzJvS0lnVVRDcjRBWSswS0JLMUJGTVRnL0IySk9YSjF5bmZiWmpl?=
 =?utf-8?B?bFc4SUhqcXR6ZnhZeldvNk5Jdm1CcGh5cDMxODRYUW0zMUFtQmJvYnBTVjFF?=
 =?utf-8?B?QjVFandHYnZJZStWek81d1JjbTJZN0xyREpYVnc2TG1ZR282WWw5bXQwYTZV?=
 =?utf-8?B?cFN6dHE3UFhaSlB1RVVVaFZFNks5a29XY3ZiNmJDb09kbmx2VEcxbVdNTzBo?=
 =?utf-8?B?d2ZPbUpZdjJBaHJjVW5oZTZZK1p5OUt2dnJKcjNraTB0KzdISzVjd05GeVFI?=
 =?utf-8?B?eCtWR0xqMjd3ajE2Tzk5VFEvODFxa1prYnIrOGM5QXBvQXVselREZURHUWVO?=
 =?utf-8?B?MVpxcCtQQ2x5bDliM21URFM4M1BwU29rRDBEck81ajZvNzJWSjlyNkM2bUlz?=
 =?utf-8?B?eUJ2UWEzNEo1UzhtZzNtS2QrZmdGa1c0UWVKeG9uOUlzNXpidDhaQTVYWStQ?=
 =?utf-8?B?QU1XOEQ2NHFhOUJKUTNhem8ybTRpcHF0KytxajdYTURYbS9CNEp1MXVZR3BU?=
 =?utf-8?B?NUEwOENXZkxPWk5mVHd0dmRKRmVZQnpQQmlYZlVBRUMzN3p1WHFiRHhNT1BE?=
 =?utf-8?B?R1VRczZMWjkzL0FXL2lTQkV0Y2swVXlBS1cvNHBaSXJya0lDeHZ2c29CQWRW?=
 =?utf-8?B?WXRQcVpLUVB6L0JPeHN3ZmRNaER1eEZZN0dET21iZU5GczdpK0E5Kzg0QmZk?=
 =?utf-8?B?K0FNM29ONldCbEgrQUN6WHdReHFva1MxcjVnc05ReDA5Wm9IT3pXZ053YkE4?=
 =?utf-8?B?a3lYZlN4RWJSMTYrdEdvYllGQXZEeUhPWXQrNzU1QWxsNEdSTUVwTDhMczgz?=
 =?utf-8?B?TFJtenBTTWErZ2FNbmc0MFNNczNONWhFQ3VIaE5VVjk2RDFKY3NyQXpPZlNi?=
 =?utf-8?B?UkVCK2FJQ2pJOHJ3NnVQUjQ3a1h6dUNKSHFkS2lZNjZkTjBPT0JEZHpxNUgz?=
 =?utf-8?B?WjRKZE1saWRkN3c2SlJQMzBPdlNvWEdZMDRzL25nK1ZXQXVSZ09QWERZK1VY?=
 =?utf-8?B?eC85blRCU2JkRnpTekhRZWNqcDJSd1pjbWIvWnlJS1Jmcm1mWFhGQmxSb2xZ?=
 =?utf-8?B?THBISjVGVmZlSk9keTZOU3dIU0ZDLzdUMzdwTjEwZHNETmN1eW9UKzhHTVpY?=
 =?utf-8?B?UjgyTCt3a1dMdVlTbGJvRmdYcjBYT3IwZzFrc3BqYVNOempWRlY4MTVCL3JM?=
 =?utf-8?B?VHJXM3NWc0FtOHU1NDhMeU00amx6dmx1V2x6VUlwM1V4eEtZMXl2VnhMUFhk?=
 =?utf-8?B?MlRSNWdZbklnRWFrb1AwckVSQThHUnNuRTlEb1U2ZkNqc0dBVVk0OENBN2h0?=
 =?utf-8?B?NXFQbnJQZXo1dWV6b3RDR1FBM1F5blZMVHA5bWJyWTAvYXVoNUNoUUpQNWQ1?=
 =?utf-8?Q?tJlLWK/s5f3Fu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkhiSkJISVlGRnVWK29NdFJ0aFFydUI5bC9ka0ZhV0p4TEc2U0kybmxXaUJZ?=
 =?utf-8?B?ejhvVmhCWVVtS0FWcElHR0NLbXpWbVZBZ25CUGlrL2RuNWhubVNHYTdiVGw3?=
 =?utf-8?B?dittVG9tQVBvN2dVNHdZelBpQ3ZNV1NFcFZ0WWlxN1Q4UnBDWk44a2dTR2lZ?=
 =?utf-8?B?MmpHTHJBUm1USEVBTS8yMm5xNE13c2VHUjNBUXRqS3NiVHMrSzBDWlNjdkpr?=
 =?utf-8?B?UmgrUkdUd2I0R0RPeVhIajA2MmdtRGdKQWREYU16ak9OWDlHT1NEK1RabGlW?=
 =?utf-8?B?TnRubjNDcGF0dkJBRnpjTXoxUW1pOWJYNTA4aytQY2UxVFR2QklWcmMyL0tY?=
 =?utf-8?B?RnlRdG9iTTNZR0RMbjJkWS9tazFaV2JyTkZoczlQZGZDWUh3eGtSOXBvMGxj?=
 =?utf-8?B?NFQwTlRYS211b1BybStnalN2M2ZTTS9uMDN2ZSswT2NUVFRqUEFBcTFWclp5?=
 =?utf-8?B?bk5td3NQQzB2YUlneitFZmZyMzZKS1F6SUFyQTJ6clBTaXZyL0lVaEY1RHZw?=
 =?utf-8?B?SFA4Y1licUdOWEZaQmpGTkd5ZFl6cXk1YldzZ2R5dmJ6T0lPRnU5aHBPQXhV?=
 =?utf-8?B?cFdGTUU1U1VJL3hyLzIvZlNKUDljNkdKNTB5UmhQdnNuMjRnSFNCTi9vUjEz?=
 =?utf-8?B?QWZEWXBPYmRCU0ltSFh0Qm5Pcnp5U1hpbkxDSW1YRks5eS9WMkdZMWFrTDdr?=
 =?utf-8?B?SEp6VkZuRDE3M3RPcjg1Qk8zV2xhekFZRjNGRm84N0gyMnhyS2FPL0l6Z3BX?=
 =?utf-8?B?OGZwRVVXcmZOb2lBTVUrVjA0b1ZUblU0N3ZsZkorOTBITWJlcmVHSHlHdkhs?=
 =?utf-8?B?N0xGWTBPZlNQOXVUQ3NxSjAvZUlNUW1acnp4U0IrS0xDUXYzb3lVWjZJQlRk?=
 =?utf-8?B?cG51NXUwZTcxdWdSWC8waHZUYVpDaktxNEVYNGxGUlM0eHdOS0I1THlycmpX?=
 =?utf-8?B?MCtiY2k2NE5Fa1BQOUNyY0xUUjJDd0lwOGZSdDhIZUxVSU8vZkRLYml3aVQy?=
 =?utf-8?B?d21ZYkFPaHV4SWk4QXA4bWpZYkpISDZKMzY1YXRnT3UxZGlOSW9BcExvQU14?=
 =?utf-8?B?bG4vK25HMlhKa0p2TWEyUmxsK1ByWEo2ZUJsM0x1UGw3bk11ZXZjVk5vWE1I?=
 =?utf-8?B?OVZ1MTVJUDVBLzNvdnZFNnVlcE81ZVlObFVSVHh4emd5YlhaN01HbDR4Ly8x?=
 =?utf-8?B?c1hseTI4UjkzM3hpOHlSdUNkZ0NmNVZSeTk0aVNKdGljUWFqRHZadm9Pbndq?=
 =?utf-8?B?eEh0ZUw5aXdzd2szRk1JRURsSUQ4UDBQSUlRZndsU0NpbWhvb2pyaVNvWU1P?=
 =?utf-8?B?SndYSTQ5NURETWNLMmZpcFAwSnp5K2JKcFJrNjVkWG5yT04rakFsaU5xT3NE?=
 =?utf-8?B?Qmt5eHoxWWtGQ1FxOHRuUS9lWDBZcmlIRTY5SUlXL29VUFVIVUMxc3dncy9Z?=
 =?utf-8?B?UHRhSFh4bzN5RTU4ZkVjdTVRd1RML2JPRFE5Z2hTeUJueWxnV3NBVVNjc3RR?=
 =?utf-8?B?cjhQSXZxN0E4a1NQMjhadmtSRENPeThrQ0RKaG1sb0R5akl4d2dtUURxemFn?=
 =?utf-8?B?YXh0a1AzOTA4TUNiblhHVm1RUFhFWU9LVWNJdjVjUUxsdHQ0cXh4QnNCdElL?=
 =?utf-8?B?akYvOUhrOGVjYVBnMms0empoRXEvYk5JUjZrMmV3OVhLMTlZbEZFOTl5VWhE?=
 =?utf-8?B?KzdralMxVGdqTDBiYWdDZ2lYRjl5OHdERFVvdWNrZUJDVDRWcEo1bHo4ZUZP?=
 =?utf-8?B?TUlWNHRibGtkWHJtK05UWHRlM2NaaVpFNlZEM3NFRnNFVkt6SjZOU2hRWE9k?=
 =?utf-8?B?RklraXVxSWpPU0V2UTVqT1crRUhRSmZwTUVzSU9venpWQVg4MGcrY2R2NHdM?=
 =?utf-8?B?T20ya2ZiaGh0eDduaDc1QXR0NHJSbEU3Wmg0RldHMGtFMDVkcHBJQlZtKzhR?=
 =?utf-8?B?ZStEd2VoZkZLbUw5K29ucWdZcVpVMDZTM0FLT1IzelRLcWlGVk9XUEVyamlR?=
 =?utf-8?B?YmpiUDVPSU54bVhBQ1M1a0haM1o0eDFBN1dDY1dGM2I0UFNoNU4vcDBjNHNK?=
 =?utf-8?B?N3VEQlkyQVNtTTZ6azk0MURuQmhJdlR6a3kzR25aOXZBdXVxTVM0TU5aMW5B?=
 =?utf-8?Q?kSky2d6z2l3mYzhXmvRnmQcJP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c99835-90c0-43aa-94ed-08dd72aa3e69
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 12:22:47.4809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HnifgguqHh/agpQVX9XH7GRLe0fbWL3VpgzK1fH5CWUPxxy7e4GoJFFjmDUpDNNJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6464
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

Am 03.04.25 um 12:25 schrieb Danilo Krummrich:
> On Thu, Apr 03, 2025 at 12:17:29PM +0200, Philipp Stanner wrote:
>> On Thu, 2025-04-03 at 12:13 +0200, Philipp Stanner wrote:
>>> -static int
>>> -nouveau_fence_signal(struct nouveau_fence *fence)
>>> +static void
>>> +nouveau_fence_cleanup_cb(struct dma_fence *dfence, struct
>>> dma_fence_cb *cb)
>>>  {
>>> -	int drop = 0;
>>> +	struct nouveau_fence_chan *fctx;
>>> +	struct nouveau_fence *fence;
>>> +
>>> +	fence = container_of(dfence, struct nouveau_fence, base);
>>> +	fctx = nouveau_fctx(fence);
>>>  
>>> -	dma_fence_signal_locked(&fence->base);
>>>  	list_del(&fence->head);
>>>  	rcu_assign_pointer(fence->channel, NULL);
>>>  
>>>  	if (test_bit(DMA_FENCE_FLAG_USER_BITS, &fence->base.flags))
>>> {
>>> -		struct nouveau_fence_chan *fctx =
>>> nouveau_fctx(fence);
>>> -
>>>  		if (!--fctx->notify_ref)
>>> -			drop = 1;
>>> +			nvif_event_block(&fctx->event);
>>>  	}
>>>  
>>>  	dma_fence_put(&fence->base);
>> What I realized while coding this v2 is that we might want to think
>> about whether we really want the dma_fence_put() in the fence callback?
>>
>> It should work fine, since it's exactly identical to the previous
>> code's behavior – but effectively it means that the driver's reference
>> will be dropped whenever it signals that fence.
> Not quite, it's the reference of the fence context's pending list.
>
> When the fence is emitted, dma_fence_init() is called, which initializes the
> reference count to 1. Subsequently, another reference is taken, when the fence
> is added to the pending list. Once the fence is signaled and hence removed from
> the pending list, we can (and have to) drop this reference.

The general idea is that the caller must hold the reference until the signaling is completed.

So for signaling from the interrupt handler it means that you need to call dma_fence_put() for the list reference *after* you called dma_fence_signal_locked().

For signaling from the .enable_signaling or .signaled callback you need to remove the fence from the linked list and call dma_fence_put() *before* you return (because the caller is holding the potential last reference).

That's why I'm pretty sure that the approach with installing the callback won't work. As far as I know no other DMA fence implementation is doing that.

Regards,
Christian.
