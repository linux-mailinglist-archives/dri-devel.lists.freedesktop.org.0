Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CE2C23993
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 08:46:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA26F10EAB9;
	Fri, 31 Oct 2025 07:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y20qwXm5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011012.outbound.protection.outlook.com [52.101.62.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F9B310E2BA;
 Fri, 31 Oct 2025 07:46:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lKI28spnnbqY3sfL+cQ0idYcTMlRCRFtPwa9vkCuDPrkyx3y76NUxcOc3CVDfPsfbf/8tsY+/5Tr0odzSotfld3FlV5tF5W2kZ/ySw7JrsrkcCXP3zEGB/4MqNH5IwdOEL3omYabtmZhIdwMnXcWecItwdyeaMHGiFhMaaMy288ZmRajiJ4PAGOk0HOPt0eqnoewf84RDakauOtdCWRLL80LBGK9YLDsTqMxIO3dNWIZByhC+kD6HFgDCCapKLZ77OmZbyuBwiOVpXPLBiUzK+KNEa+r0cTU59PUouqT20KH7A72fw2UCuSUBUEJdt/em57vHR6d7hfbVnzhB32ncw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XqCFTEl0a4p5uxwOX3cgbfTI/rz1vGLtBw3lGhai40Y=;
 b=oJqZMaEhhv5accf94Aed2fafEh/DYJpgpT5frncg40lQxOh4mqoFimBs5VoofTastihHBbKdZjw7azg9xSN4I2vGu6KnE4TimhC1v2V86AVpqAHdzz1teQdSHrLSmOd3XwgMLSiTe8qSiNEqVuJre9syZExsXjE77ax21Xlsj8ih1ytrgrOjNn1wNkjoeWGCYi0CbGG/2bAOwjjezYcxnFnp+IUHv/u/eR/wkYFDmIoyiS4k1A4XHUD6/S/RtnlMViBiW66XU1AECgvzm9xSxdhqVCj3b/DFUqAhVIsOV0Z3xpeD3hznMKgfMDZO6icitrI13tg+4gMwEI4sdoW2fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XqCFTEl0a4p5uxwOX3cgbfTI/rz1vGLtBw3lGhai40Y=;
 b=y20qwXm5oll1am/Q18hX4a3C2tDXPt1c2wxvR6yk4wRq3D75PgW5asNAlPDo7Ol/WXlbt/+lmS24qpxuthU1mRyG8+g8GeW4lhnEJOm/bPPO31pg15p1uRlqYmKaae8K+ExFyoyLbFx9Hz8UHUwlLaagguazUHKrcI0X7JzaBuc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB8503.namprd12.prod.outlook.com (2603:10b6:8:15a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Fri, 31 Oct
 2025 07:46:39 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9275.013; Fri, 31 Oct 2025
 07:46:39 +0000
Message-ID: <146d57e6-29dd-4412-9786-a630574e4872@amd.com>
Date: Fri, 31 Oct 2025 08:46:34 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
 interconnects
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leonro@nvidia.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Kim, Dongwon" <dongwon.kim@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>
References: <20251027044712.1676175-1-vivek.kasireddy@intel.com>
 <20251029002726.GA1092494@nvidia.com>
 <IA0PR11MB7185E85E1CFAA04485768E30F8FBA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20251030134310.GR1018328@nvidia.com>
 <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CH3PR11MB71772DF7DC3776F838AA8CC8F8F8A@CH3PR11MB7177.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0088.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed14975-397a-4fd4-a975-08de1851a014
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWJKblkvaVdQaDg5TkV3TlVvaEJXbEFSTjFjRTNkVlVFeE5VcXNpaXg3YzBQ?=
 =?utf-8?B?V2pPZDVzVnhVcG5kMytqait2bThsVm9rVldPSm9nbXZ1dzYya2tlM3gvUm56?=
 =?utf-8?B?RmF0R2lUUlNBdmFTcEt0b0R5TjNBeWYrVFl2d2w4Zyt2TmdSbE84TE12aWdP?=
 =?utf-8?B?RlJnRmcxVzBwQVVENTc2WnNrY1VRS1d6am8wVnVZTmhqL1dJOFJ5MGRNUlJ6?=
 =?utf-8?B?TjNPd0hRY0xveTVPL29UOEZNSFhLcWgveGZBb3ByMnhoM2J4bEpsaTJZS3lm?=
 =?utf-8?B?a2tYQlhRTndhVHYrc3hWdkpmSk8veHA2T2lDdytienk1RjdDQjhsT1k1OExB?=
 =?utf-8?B?T2p6cFVMdktraUhndkFpYU82bnNQcTBZYmJCZHlTVysxNEhBKzhzYVlVTmh1?=
 =?utf-8?B?bVNrVnZERTIvQm1QU3ViK1FvUWx1NldmMGUvRkF6OUxCeTZvTkJXdis2cDEw?=
 =?utf-8?B?RGxld05oeU1JNWU4Z0w0MzlJMWJtSW5LTHVDb0dhK3VzdUwrWXFIdG1VbVIy?=
 =?utf-8?B?eTJoYWxEeWc0ODdUY2g1U2VLZ3V5dEtxRVpsSk91NnF1N21NbWZneFhJOEJr?=
 =?utf-8?B?QXgyTzlPNWRKWG9YWUJCeGg4RklSR0JTaWs5ay9IWHZkY0Rub1huNHJ6QVZV?=
 =?utf-8?B?d1BsUFdmbUNhZEM5VGpDY3V1YStkNTJldW1LMkh5dmR1OEE4U2NvTW9WdjhG?=
 =?utf-8?B?OHY4eFpId1RhUXRZdmF5ZFY3RmczMmYrT3VvUjlnTEcwRkd5NHRRYWdPWHZt?=
 =?utf-8?B?WVc4R2ROZ1hKeDNYZVRnTW0zaUxnYzZLODNBN2EvdUxXa01RTkxPMWNmV1pi?=
 =?utf-8?B?and0dHhHTklxdFRsR0sxZXdOWk40QmdmK0pmU0pIWUtqbTAyM2xUQTdLYXZt?=
 =?utf-8?B?ajZkeWxZcFRaVy9aTlpDbnkvNTRpbWNyQzZBL2daK01PRGlYRzQraUVuVkpx?=
 =?utf-8?B?VVhRMVlUMFVKOU5zZXJFVUlDUVprRFVjcG1US3NKWFRaOXZiWmFPNkNFejFo?=
 =?utf-8?B?blFPL2o0WndUZVJHdXNFZ0lxRjBIcEQ3VHpWNjRlYVNldS9ySHBGeFpQdnNj?=
 =?utf-8?B?OFltb1NETmFRM20wNHZhN3k3RUpmcFNBbGpSdW1kdStMVEVRMXgzNFgrbElm?=
 =?utf-8?B?UmV6bm1BUXdCZ0RPRlFKSEZYejNmbXpUSTJhUCtqNXJiaGhEMEFJZnBSVXJx?=
 =?utf-8?B?QVVGVXhTaHIvcUszMjFSUG1DOXpWcHIrZm10cmZ2ZkEyd3dENGlHdWUxeENR?=
 =?utf-8?B?ZlVHV1ZXVXR0OElDbUhOQkxDMXBGdkhDV0c5SXRhQVV3eDRzRndvWGlVNFhF?=
 =?utf-8?B?bjVOSXRvdVBnSzJpOTExb1ZUUDFRcWxuVStZOEFqL2Z6UUI1akRid0lqWmQw?=
 =?utf-8?B?V05tNE9wcDFBQWpwVmpab0FmQURxZFVVa1lhQUprcWJSdjdFOHZaekJvc1da?=
 =?utf-8?B?OVkvU0JBVWRvTlNkZElwVDNKRkp1bE52RWQ3b0d6ODJ4R2xqaStOMmlOdG9z?=
 =?utf-8?B?VURoUis3S2V4c2h2dDFKTGhJd3lIVVJmV1FRdnZ5aUw0SFhST3M0bmlSNTVC?=
 =?utf-8?B?QjNJYklnOW9JZ2xLbS91REQ1bDNRWk5kaWlDYzlxR1ZNbTBkQUNtcXE1clI1?=
 =?utf-8?B?b0hyMVZ3cGs1bkg4NUtqK0FWNzBWKzljNVN5UHRhSDg0SWxKTmdYOXlMdGF3?=
 =?utf-8?B?SExwbVkxdHQvOEk2U1JZdmw2N3poTzVZVFFDWHozOXlZWENsZ1Jzbi9zY3Bl?=
 =?utf-8?B?UGtWc3IwbStBeDBoRUpLNVNtd3RlMUtlVUJXZ0FBVnRMdVNaYWxDZmFxVUZn?=
 =?utf-8?B?djhkYUpxVUMvczc2UXlaZXN0UWRXMkFDTVFjQUpGV21XMmxldG16M2s5MlZh?=
 =?utf-8?B?V1VONnJlaUR1WTFQbWhBWXFGZTU3SFdlNUZsMTNaRjkyc29sbVl2RTdmWGlY?=
 =?utf-8?Q?RT458zSpqZoGYf1CO274rBpvQCfcHhAo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2xrb0VVSjZVT1hqNjZqTnBDYXRYcjRsdU0wbWd6ZHNlN3AwZlZVejJnU0FM?=
 =?utf-8?B?MjViSVJNTlJLRlBGS0JnTnpBeklnUUthSnZzaXpJT0Y0SjZMVWVQelVpUW1U?=
 =?utf-8?B?YTAyUXNQZmdlS0cyM042Sk9idEVBb213NDFVU1ptMTVPUzdlT050dCtQcHlE?=
 =?utf-8?B?ci8zOFVQK2wvbHNIVGtTOGdmTTJ5cTQ4dEJDc3BidHY0RnRLc2hWT3ZZc2Zt?=
 =?utf-8?B?V25jbDVMTkc3OS9UMEw3L1pHQkVlaUl1ZVNoVXBlYW80MlFGSTdoNnUrN0JS?=
 =?utf-8?B?UGIzd0tPOEphMFpJeE5HV29rM0pCN3ZGVmV0clNydldya1dFcmlMOUVmUitl?=
 =?utf-8?B?b0dPM3VYTUZtRXMyQzVrdVN2MWZYaWNsWVhibGRBcElPb2JockNBNDJmakEz?=
 =?utf-8?B?djU5R1Bra3dNdkpIUlRQTjFwU2MzaFlNaVV1LzRXdkVOWThPeXlZNjRVaGdz?=
 =?utf-8?B?a3MwRmJFdHQvVlFXUy9KZGRKNUNWSmw3OVBTK1psd1VyUzFEUEw3UWtRNGJI?=
 =?utf-8?B?REk2TU9XZlpQaTd2NzdHOGhBU1FkeGE5Z0YwVlpzbURKbUZSOC9idmJiL2tV?=
 =?utf-8?B?SWdQZ1Z6Q0lCL05tem1ycXBuNGxyMzJpTTVEK1NUeVdyanE5eER6NjR1ZVJZ?=
 =?utf-8?B?enFpaURBSTVtM2dkL1FrSFdHVjBGZHYvdzN0VWw0YzN3eFR6S1lBeWRjL3FS?=
 =?utf-8?B?Y2NNa0VzYWlET1NQZUxHanI5WUFLeVFzTW9pSDNMR2NOWGwyYXFyYXlLYWli?=
 =?utf-8?B?NlRVRUNyM1RQN2p2TVpLczFjNVNZVnd4Mk5TbmFzVnQ1S1NiOTV1YTV3akto?=
 =?utf-8?B?Q2w1aDFoc3Exbnk3a2hGRU9hSDgrMnZGMjZVRStiQ3JxTWhMbWxhT2xrUTZh?=
 =?utf-8?B?MkRBUkxubFdndXM0MEExRWdZMWM4TmM4QU9seXpQeHBSMm82WVBWSis5TXNN?=
 =?utf-8?B?QTZ4aXdKV0pVYTBPdHpPV0xjV0xtdmR1WUUzRDR2NGw3MnVSRjZFZmZCdGR4?=
 =?utf-8?B?b3ZLU1dPYjJ4dkFtYWF2VXhsRm9yRW1nYTFHc3RpcWVPZWEzcSthZTBLRnNV?=
 =?utf-8?B?Wnp3WW1NZmdCUlBWV2RjSklnd0N1aGRScWs3OXRjRk1ZcjdRLzE2bytPUElH?=
 =?utf-8?B?d2xWa0haUjIwcXVFTWJHYWd5U0hIbHFYZlBybTIycmhETnJITkcrdHRURjAw?=
 =?utf-8?B?Vit5clljME9nVE1qTTR5cUY3aCtjTGpnMVhIb1o2MFQxT2ZCZm51YWQvVnFG?=
 =?utf-8?B?NUtYc3haOUd2NlY1bEQzYS9ud2piQjVYWVRsdGhRQnA5RmRFWXQ0cmJyYmFP?=
 =?utf-8?B?cDgzbGZ5bWgrQXdUSVM4OE5LL3ZtUUszMEpQMGtMRklpL1l2SzRjaXhCRE5t?=
 =?utf-8?B?Und2WWxGUHg4NGMxRURJTys1R0RlNmI3WGFUNjYydC8yNXpWSEZKVUFwRXY3?=
 =?utf-8?B?RWJ5aC9ZL0txbkt2SmEzZ1V0LytlUDVpbUh3azhRSkEwWGxLc1N5Mml2WXJN?=
 =?utf-8?B?Q05FSUNQOWxpWkgvSDR4WUdaWEVpeWhoNW0zM3ZEOTNVeXRoUXBVbW5NdHJO?=
 =?utf-8?B?blBRcmhpeEwwOStXck5LWjJmNS9zRTdHbTlWaUwycnp4UW5MS0lCWHVNbVJ0?=
 =?utf-8?B?RGEyd1d3VlN1b0E2TFhMWm5mN3VCVzhsTDR2cGt0QzRZaklnRlh3N0VHcUlN?=
 =?utf-8?B?amVFaGx4OG93OWZDSFJ6ZEFlaTlQRUhOUHRmc2ZsNlBBRWJxS2pJK3ZLQnFV?=
 =?utf-8?B?YkxpVVdoNDNVRXBZQ3JvakFtTGV2TXduTWIwTnRxR3p1Vk0rTVV3T3B4eUdw?=
 =?utf-8?B?R0F2eUcvWkU1N0VOb3VTREd1cGlRb2c3WUpMd2NyV2JyS29laEV0U0UwUTZR?=
 =?utf-8?B?Q2FPOEJGUSs4RG8vVEhmdnRkQUVZcHNwcytpTHJLUnVUdjUycndLK2Z4TDFW?=
 =?utf-8?B?WjZ2Rlh3RldnaUVvZWZwN2RpYzNTV01tU2IrNEFXYk9WNzE3U0V1bTBaTVRV?=
 =?utf-8?B?NjhDSk5rS1d2eGlaVURXNlhqUjBCcXJFY0ZBN0ZLK1AyNU4zc0IwYXRvME5t?=
 =?utf-8?B?alVEOUdpd2dnTXdRcFI4eXhqbjdrRGpZb29OVXExUFVHY2hXdTNRVk1yM09F?=
 =?utf-8?Q?MqQe1q/pXQPA7AHeCCtM2eB+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed14975-397a-4fd4-a975-08de1851a014
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2025 07:46:39.1451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9v3lA8I+UcCClXKAywOgJiADVBVOn+0xSvRq6lOVP0xqtOG2zK8Ck+ml785NGm49
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8503
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

On 10/31/25 06:15, Kasireddy, Vivek wrote:
> Hi Jason,
> 
>> Subject: Re: [RFC v2 0/8] dma-buf: Add support for mapping dmabufs via
>> interconnects
>>
>> On Thu, Oct 30, 2025 at 06:17:11AM +0000, Kasireddy, Vivek wrote:
>>> It mostly looks OK to me but there are a few things that I want to discuss,
>>> after briefly looking at the patches in your branch:
>>> - I am wondering what is the benefit of the SGT compatibility stuff especially
>>> when Christian suggested that he'd like to see SGT usage gone from
>>> dma-buf
>>
>> I think to get rid of SGT we do need to put it in a little well
>> defined box and then create alternatives and remove things using
>> SGT. This is a long journey, and I think this is the first step.
>>
>> If SGT is some special case it will be harder to excise.
>>
>> So the next steps would be to make all the exporters directly declare
>> a SGT and then remove the SGT related ops from dma_ops itself and
>> remove the compat sgt in the attach logic. This is not hard, it is all
>> simple mechanical work.
> IMO, this SGT compatibility stuff should ideally be a separate follow-on
> effort (and patch series) that would also probably include updates to
> various drivers to add the SGT mapping type.

Nope, just the other way around. In other words the SGT compatibility is a pre-requisite.

We should first demonstrate with existing drivers that the new interface works and does what it promised to do and then extend it with new functionality.

Regards,
Christian.

> 
>>
>> This way the only compat requirement is to automatically give an
>> import match list for a SGT only importer which is very little code in
>> the core.
>>
>> The point is we make the SGT stuff nonspecial and fully aligned with
>> the mapping type in small steps. This way neither importer nor
>> exporter should have any special code to deal with interworking.
>>
>> To remove SGT we'd want to teach the core code how to create some kind
>> of conversion mapping type, eg exporter uses SGT importer uses NEW so
>> the magic conversion mapping type does the adapatation.
>>
>> In this way we can convert importers and exporters to use NEW in any
>> order and they still interwork with each other.
>>
>>> eventually. Also, if matching fails, IMO, indicating that to the
>>> importer (allow_ic) and having both exporter/importer fallback to
>>> the current legacy mechanism would be simpler than the SGT
>>> compatibility stuff.
>>
>> I don't want to have three paths in importers.
>>
>> If the importer supports SGT it should declare it in a match and the
>> core code should always return a SGT match for the importer to use
>>
>> The importer should not have to code 'oh it is sgt but it somehow a
>> little different' via an allow_ic type idea.
>>
>>> - Also, I thought PCIe P2P (along with SGT) use-cases are already well
>> handled
>>> by the existing map_dma_buf() and other interfaces. So, it might be
>> confusing
>>> if the newer interfaces also provide a mechanism to handle P2P although a
>>> bit differently. I might be missing something here but shouldn't the existing
>>> allow_peer2peer and other related stuff be left alone?
>>
>> P2P is part of SGT, it gets pulled into the SGT stuff as steps toward
>> isolating SGT properly. Again as we move things to use native SGT
>> exporters we would remove the exporter related allow_peer2peer items
>> when they become unused.
>>
>>> - You are also adding custom attach/detach ops for each mapping_type. I
>> think
>>> it makes sense to reuse existing attach/detach ops if possible and initiate
>> the
>>> matching process from there, at-least initially.
>>
>> I started there, but as soon as I went to adding PAL I realized the
>> attach/detach logic was completely different for each of the mapping
>> types. So this is looking alot simpler.
>>
>> If the driver wants to share the same attach/detach ops for some of
>> its mapping types then it can just set the same function pointer to
>> all of them and pick up the mapping type from the attach->map_type.
>>
>>> - Looks like your design doesn't call for a dma_buf_map_interconnect() or
>> other
>>> similar helpers provided by dma-buf core that the importers can use. Is that
>>> because the return type would not be known to the core?
>>
>> I don't want to have a single shared 'map' operation, that is the
>> whole point of this design. Each mapping type has its own ops, own
>> types, own function signatures that the client calls directly.
>>
>> No more type confusion or trying to abuse phys_addr_t, dma_addr_t, or
>> scatterlist for in appropriate things. If your driver wants something
>> special, like IOV, then give it proper clear types so it is
>> understandable.
>>
>>> - And, just to confirm, with your design if I want to add a new interconnect/
>>> mapping_type (not just IOV but in general), all that is needed is to provide
>> custom
>>> attach/detach, match ops and one or more ops to map/unmap the address
>> list
>>> right? Does this mean that the role of dma-buf core would be limited to just
>>> match and the exporters are expected to do most of the heavy lifting and
>>> checking for stuff like dynamic importers, resv lock held, etc?
>>
>> I expect the core code would continue to provide wrappers and helpers
>> to call the ops that can do any required common stuff.
>>
>> However, keep in mind, when the importer moves to use mapping type it
>> also must be upgraded to use the dynamic importer flow as this API
>> doesn't support non-dynamic importers using mapping type.
>>
>> I will add some of these remarks to the commit messages..
> Sounds good. I'll start testing/working on IOV interconnect patches based on
> your design.
> 
> Thanks,
> Vivek
>>
>> Thanks!
>> Jason

