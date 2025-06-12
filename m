Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F936AD6FA7
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 14:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAA910E7EF;
	Thu, 12 Jun 2025 12:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="quVBfAKr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2054.outbound.protection.outlook.com [40.107.220.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CD5410E7EF;
 Thu, 12 Jun 2025 12:02:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tIZAH2JlgagZDPbpHvjCorYPCwEEJOtGk9OApTlbr1EdePw5jNb8K5Hryoa0mvTr4L7gMPYA54r0TeJRqe+C8tIQKdTxLARGJBBO3nCkIm4c9buEnIbOHR+s3B62QLhyPlYYlmG5DpfopfxJLMm6Sz5apKz42t26lhQv0BmNVOYfAIKRUs5tqQnzyQS2HhJ0jURBfdKypAuWU4WL9rMvNkRIs3l6ta5KdX41/Pt7qGsVVHikHesqM2VD7zgwEGmjE0EycXad0WArYmu6aHu0kwik/KQit8qbghjpDQFw4mnQHKGLMULuQrCw1YOn1GTSPrYKwHVAEBhdUren9PykPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxSNAJXbLbk68jxDgzD9poMQCu7Cb7Ll84pfa+WXEjE=;
 b=i1xLjhLwhCGBr4Ek33brKPIxsHb8ruCmMTZMHxltVBUdsO5q+wAXtQzAcwhHPMvRioKeCm38JfsY3wavnwpluaqTAA+s7vmArGO1/5kQ1R/E16nHIXGuDuuFGr0BiIrL4VuUib0FfHdBpTBnRQOIKhL7RFq9G1ndIfD8CyB67XH24p8j7t4PHsuw96XVGBVR69PRKbk6/4HQp7xEwotz37rjwlmPBV8klpdMrVAJplJzh37vzAm5OeGJyhLBdLCQxTJeiSbmadwlaMev4dNQMvIpgPjMJxFZSnYfV09bGqlmDdHtF2CcnLNtbN/OXhbvomH98qEyChA23+eF7L4Q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxSNAJXbLbk68jxDgzD9poMQCu7Cb7Ll84pfa+WXEjE=;
 b=quVBfAKrVwYwc5rtoU5rO8Lt0ZTPPtKFHtxir4Y5FL+D0S7KWO4MrKcnm+zO3BaTzZMY3+dKxo2PLhzRNRvmMpJTvKeHg0bT73j7rexkCjTp5x3QNi6aCkNerNv00hQMIKyn7NXKCI768P8w6/UPAW32pUimxwD/MKT2txDaFVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 12 Jun
 2025 12:02:44 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Thu, 12 Jun 2025
 12:02:43 +0000
Message-ID: <6984bb7e-8026-49f8-a683-a8142f0d013c@amd.com>
Date: Thu, 12 Jun 2025 14:02:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
 <20250611140057.27259-7-tvrtko.ursulin@igalia.com>
 <b57b6549-7dbe-45fe-ab8e-4232041ec1a5@amd.com>
 <10e83252-e565-4cb4-9bc2-ae238528df92@igalia.com>
 <c17f25ef-390a-43e3-a467-45e64048ed6c@amd.com>
 <28ec6760-c2d4-472e-84fd-211bfea47d4b@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <28ec6760-c2d4-472e-84fd-211bfea47d4b@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0241.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f5::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 874e1f81-83e9-465d-d365-08dda9a909e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTNJbjJtdklkZkJnWEE1N0pHSzdjU3FibVF6RnEyK3VJM24wb2pVVWdaeUpH?=
 =?utf-8?B?Wit5NExPVTMzR3cyN0o3cWYrcW5kajlyK0ZvQXgwRTdFVCtRYjhQN1RNd2ha?=
 =?utf-8?B?TUxwU2hDRXVnbHYzZGRONjN6cllBek9TWURQSWNvR3ZWWGtFZXRLbXZaU1pB?=
 =?utf-8?B?aVd3bVp6UWt0Zit6YW0zRVpjWXdkTUUwajZ1VEdpMVpJRnFwOTI2MnR5UEk2?=
 =?utf-8?B?cEYzTlZ6RXFDT0lpazk5dDhjd0tjQ0dDazk3ZFNrbDNta2JUNDJ4TExuaDRx?=
 =?utf-8?B?N3J1c0FKRGE2YnZ1ajBuQW51WEllOVF1QWFpQWJXMWdhUW1HNEVSOFlYYWVN?=
 =?utf-8?B?cGdqYnJsRWZ3TmkzMFdHR2RYYVJpRnlrMkxqTThIb3FUYTZyRVFqR2Jzanhn?=
 =?utf-8?B?Y0hFb0xsUk5QSk50b3N2QU9XUERwdVlVRk1XMG4zTGZCWTZGVDErMGQwby9X?=
 =?utf-8?B?eDlzbFpoNlY1eWJhYzkvVG1QQzFzQ3FpL2M1d0dwZnRNcmE2ZW05MExsNU14?=
 =?utf-8?B?bExLcTlxQmRKaWo4OXh0SktQeGN6ZTlJL25nRFV3WlVtZTU2S2ZaQ0QvQXp3?=
 =?utf-8?B?a1BxcFYwNFJLZGFHdzJTNHgxQjVmTDVQZWR4aUp2V2M3ZmY0MWJxQUM0cUhm?=
 =?utf-8?B?dHIvdnNwdXAraXJYK1Z2OTFkZ3BYOGpWQXZjSGVhMnAxNSt0Ym5tMm92RGtO?=
 =?utf-8?B?dGJGZS9RMVI0OUhMSHpsUHREdEV0aDM0c0V4QWIxUVcwNHVsNEdpc3VoMXhO?=
 =?utf-8?B?ejh0YWNNUkMwKzFoaWN5VnpBa1l2Ym50WmxmTWpqNE9aTFgydnFzclRvY0g5?=
 =?utf-8?B?NGV2TjNrallXVXJqSkJDd3prYyt4VnAwcEVxNjZmczJHN3VnNU1pSVVIdFBH?=
 =?utf-8?B?alJUMm83UU1JMFl1ZE9UbmR1SlhRbTNoMWhmaEZRNnpuYlBSNS9JYjhock5n?=
 =?utf-8?B?bGN2YzVMZGNEUHAvV045d0ZHS3h6NFdmRTVzdUsvWWxHcHRxNzUwWWpPZ3p5?=
 =?utf-8?B?LzhtY1JDZFplTWduS2t5UjRHaGxxSVZDS1VsdEpZRzlITHRMMEw5aTB3VE5E?=
 =?utf-8?B?U2dkZjFzUjZBc3VCZXY5SUFla1UyZXZPSU1SSjlWNGFHYU0xNGwweXFLLzlF?=
 =?utf-8?B?dWxZUXMybi8vcFVCbHNlQUo1Uldsc3JZaWw5Q3I1clBsbzFyTFF5TnlqbkJM?=
 =?utf-8?B?NVNVUUxLVnJlMTZaMm9XMGNYbWZUb0xKRGZCWTB2c2tJSmFBWGhIRmJrdHNH?=
 =?utf-8?B?ZnQ4MjNlZEtOMzFENjdDa3pubHhqVmVyTXdYOTQyVzRHOG54U3ZpWUFBV2t0?=
 =?utf-8?B?VnJwcGI2eldmNTVhS1RPUUUvN1B3SU1tdlVZWlIwTkNOamxVS3dNUTdBbnNw?=
 =?utf-8?B?TVppckgyRVVPQ0F0MkV3M3Yvbys1L2toeCtWS2E1Ly9UaGVFUUlPSEZvM3JZ?=
 =?utf-8?B?ek5OTU0rRHdwdk1pOC9YVUc2czVobTErSWIyZ2k1Qm5rTWxYZXcxaVlJSDRD?=
 =?utf-8?B?Yi9maktEQkIrSkhjMWw2YmlSWUlKNEhGdUloNmJjRUdWV09zWEVwaVFCU29z?=
 =?utf-8?B?c2wxOWRGblJNOGZQQ1lLZ1hCcU0rMnNPeGttUHlueS9KVVdXZmlsOGk1OGdI?=
 =?utf-8?B?RStIcStJaGVZNmpaNmc1bGR4ZzRZeUp5U2RTK0p4di80U1pFZlUzOWpCSGRM?=
 =?utf-8?B?Y01QNThUL2h3alFKMlR4WWE0Q01WeGJFUUlzaXc4SFRMeDduSFFHU1BkaERj?=
 =?utf-8?B?eVFsR2w2dWVhWHhhYVFCdnRIQlpQVTlpdHFaeU1OSXBVdFM3b0NPNDJ3N25O?=
 =?utf-8?B?T3djcFdxb3VGOERqVFYydlF0VWdJUm1IU0dVbUNrREJuZ0R0bW1XQ0NhRWpM?=
 =?utf-8?B?M0U2UDVlcGZiaFFTRU85bGF3S0VpelIvTkdIUXY2YUdLWnJHSmNIL0Z0NVRS?=
 =?utf-8?Q?cb083sWZPd0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZsUmNWeHBRYTB3NTVUVTZRVXkyUlZSSEhycDVEQ2Uvd0xtdHBmR3BjRCtX?=
 =?utf-8?B?U1liOE1yakRqRExaelNZdElmRDFCS0xNWmlITWlwTEJQRnNFSVJCU2MyS0Zl?=
 =?utf-8?B?Wlp2K1dESnF4SGMwZWhDOTVtZnVQMGExYkpacHFzbVpTUTVFWXc5U0dmOW41?=
 =?utf-8?B?UU1kWml4eHdWN25zWFNpMGxNeFJTV0dmRUZoM3RGNVBpZ2dtZVdEQlFxRktF?=
 =?utf-8?B?QlVmQ09PVkR6VXIxY2dhczJnbTF3VXNualg4R25wOURTNjJrQUtTbThENTJ2?=
 =?utf-8?B?UzczV1RFbXRONGVqSFpnUTVRcmY4STBXUm5BS2RwdEYzOHpLUDNFN1F0VjJQ?=
 =?utf-8?B?b2ZRdjJEZFloVWRhZW1lUDEvNjA1bTRIVUZaSFI1OENYM2U2aWpLMU40c1hN?=
 =?utf-8?B?R1lDdHVWRE01R3FldDdhNGI2bHRnL2JFVnkvdVZnSkJXOUVuc1RDekV3ZytG?=
 =?utf-8?B?OHRaVDA1VVVKclErUzJnREVsYmtHdXFPaEtOSHliVkp1dFp0WGxTYitGK1Vu?=
 =?utf-8?B?eG8xSWtWalVRUnE4S3VlUU5pT0gyc3BQL1U1emxPZ2tvYndQeitrSU9xYjly?=
 =?utf-8?B?TjYwOTJsd25zMjdOUVdDdUJrOHBVTXd0aXdHSVRpYU02bkFjUm9sWGZPQUky?=
 =?utf-8?B?MXQ3WEptS0ZXVXp2QnZCRTBKR3Erc0trNDQyTExTd3RvbThzaVNHdlR0RlRD?=
 =?utf-8?B?Zk9PSnV2b3EvTnY4UEF2Z1hRc1JLQW11U0dJK1FUS2hGMVM1NVBoaFZOOXZQ?=
 =?utf-8?B?ckdYSzhkR2pCUlJBTzF3eitoQ0JZU20yei9NTVgyZEdKMkJ1djh5aFdaZkxy?=
 =?utf-8?B?T2lKcHVKZkZFQVZoMStEblNZTW5iKzNHekk4ZlRQeU1KajBKb2N6OUhNQWlx?=
 =?utf-8?B?ZzFHQXFXWDA3b3gySGZTRXVmMnhTWk9DYkc2a2ZFOFgrSGZ4WDhVV1JSK0Nw?=
 =?utf-8?B?dWE3cUp6TlJQRVJ3aDFnYUpQUmJ2R1F3S3NyYnV1TldOODVRdm5tZ2lLcnlI?=
 =?utf-8?B?RE1FK3FXeW5aVlUzZ25hRWtyZVQ5SklMYnBvVlYrd20rZUFESWFYS25qaVFi?=
 =?utf-8?B?cmo1TnJqQVVhNDVhQTBOR0lOaEJma043cUU2cnJlZzdWazZqTldJa3FlRkVB?=
 =?utf-8?B?OU45QmFqdVZaeUNwMFBhQ0EyVGZVbi9tOHdDT09FOVVZODB0Q1dRMXg2RUt3?=
 =?utf-8?B?QW9DQW5RdEd4SnhLSXYvUER4bU92dVFUcXV1Zm1jcGxROUxleEhlWHBFKzZX?=
 =?utf-8?B?SjlBdVJxTkVXZlFBZ0ZPUkh2bENhdHdCTWdpenVyRmxwWWQza0NNckhQY1NK?=
 =?utf-8?B?THBwSHYwSFgwdXBHV01YUGduR3NvemNET1BRL01HSlkwV0RkTGhEQ2RFdDRh?=
 =?utf-8?B?ZlhyUkE2cENid1dWS3BqU2dNelF4ZmNvOGpVWWRHRzczU09lQ3ZyZURTbzJT?=
 =?utf-8?B?NmpiS0wrN1FKMm5yQVJKajV5V0g0NnJvZXV5R3FmcmtwMmV5R29taGNvckpD?=
 =?utf-8?B?UzdRUURoRXJ1SmhmR2piclNXNGdEQXhLNGpTZDlMbTM0djRIRldqbGpIaStj?=
 =?utf-8?B?SHgxL09WVlNPS0RKb1hYYzJ1ZldoSXgxNmxISitQREphVzhiU09vMDZUNHJ5?=
 =?utf-8?B?TTFVVjRMbkRpdEE4cElYTDJDNjAwa2tDV3Vkc2NwL2srOGkyODkveW1PTFg0?=
 =?utf-8?B?ZXdnTUROUWNqSWw1dldmcm04VTZKeHBGODVmUmZBcmNreEFwdzlWTm9pNzFM?=
 =?utf-8?B?N3QvRHJiY1cxMlVyWGRYTVZCN0hITXhyQzZ5enZUWU9oR1dqdFNsNHFZU1Z2?=
 =?utf-8?B?cysrMCsxSkorUEhIR0F6MGhEMkduTWtESnl2clpvK2xqdjRGa0NNY1FiRlFm?=
 =?utf-8?B?NWxTQ05qR3krOTlabnJDbnAxK2dXSUpGUGxlOE51MUlIc3FPYStGWWxZR3E1?=
 =?utf-8?B?NnZMSnFETVBqaE5YOVhZQ2l0NlRWc3FvQ0dDblRMSGdOcGkvUS9SQjZob2k0?=
 =?utf-8?B?VXBqYjdYWHBUWG9nTWxqbElHOW03VTc3d1U2OWlTMS9CSTBJRVJWWnZxbUlZ?=
 =?utf-8?B?OWNkQnMxT3h3WmNUQ3hiNTNWTXpqNE92K2xtNUV3ZFdJNWQxVnlTK0VRUUph?=
 =?utf-8?Q?ZrOfu2CHPGoNhqIfjioEiwuZ7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 874e1f81-83e9-465d-d365-08dda9a909e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 12:02:43.8608 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IQIiDK0pEwUDKLmR3ysMS232fk0NL1J1Ohbr6OOBzUZQWku5OhgEkxVBgmLw85uK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172
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

On 6/12/25 12:58, Tvrtko Ursulin wrote:
> 
> On 12/06/2025 08:21, Christian König wrote:
>> On 6/11/25 17:29, Tvrtko Ursulin wrote:
>>>
>>> On 11/06/2025 15:21, Christian König wrote:
>>>> On 6/11/25 16:00, Tvrtko Ursulin wrote:
>>>>> Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
>>>>> is relatively hot, but the 97% of the calls are for a single object. (~3%
>>>>> for two points, and never more than three points. While a more trivial
>>>>> workload like vkmark under Plasma is even more skewed to single point
>>>>> lookups.)
>>>>>
>>>>> Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
>>>>> pre-allocated stack array for those cases.
>>>>
>>>> Have you considered using memdup_user()? That's using a separate bucket IIRC and might give similar performance.
>>>
>>> I haven't but I can try it. I would be surprised if it made a (positive) difference though.
>>
>> Yeah, it's mostly for extra security I think.
> 
> On this topic, this discussion prompted me to quickly cook up some trivial cleanups for amdgpu to use memdup_user & co where it was easy. Series is on the mailing list but I did not copy you explicitly giving chance for someone else to notice it and off load you a bit.

Yeah, I know I always wanted to give that task to a student or interim :)

Alex is the one usually picking up amdgpu patches from the mailing list, but I'm happy to add an rb if necessary.

>>> And I realised I need to repeat the benchmarks anyway, since in v4 I had to stop doing access_ok+__get_user, after kernel test robot let me know 64-bit get_user is a not a thing on all platforms. I thought the gains are from avoiding allocations but, as you say, now I need to see if copy_from_user doesn't nullify them..
>>>
>>>> If that is still not sufficient I'm really wondering if we shouldn't have a macro for doing this. It's a really common use case as far as I can see.
>>>
>>> Hmm macro for what exactly?
>>
>> Like a macro which uses an array on the stack for small (<4) number of values and k(v)malloc() for large ones.
>>
>> IIRC there is also a relatively new functionality which allows releasing the memory automatically when we leave the function.
> 
> Okay I will have a look at all those options. But it's going to the bottom of my priority pile so it might be a while.

I'm also perfectly fine with the solution you came up in those patches here for now if that improves the performance at hand.

Just wanted to point out that it is possible that somebody has an use case where X sync_obj handles are asked for timeline fences and that now becomes slower because of that here.

Regards,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>>>> ---
>>>>> v2:
>>>>>    * Added comments describing how the fast path arrays were sized.
>>>>>    * Make container freeing criteria clearer by using a boolean.
>>>>> ---
>>>>>    drivers/gpu/drm/drm_syncobj.c | 56 +++++++++++++++++++++++++++--------
>>>>>    1 file changed, 44 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>>>> index be5905dca87f..65c301852f0d 100644
>>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>>> @@ -1259,6 +1259,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>>>>>    static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>>                      u32 __user *handles,
>>>>>                      uint32_t count,
>>>>> +                  struct drm_syncobj **stack_syncobjs,
>>>>> +                  u32 stack_count,
>>>>>                      struct drm_syncobj ***syncobjs_out)
>>>>>    {
>>>>>        struct drm_syncobj **syncobjs;
>>>>> @@ -1268,9 +1270,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>>        if (!access_ok(handles, count * sizeof(*handles)))
>>>>>            return -EFAULT;
>>>>>    -    syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>>>> -    if (!syncobjs)
>>>>> -        return -ENOMEM;
>>>>> +    if (count > stack_count) {
>>>>> +        syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>>>> +        if (!syncobjs)
>>>>> +            return -ENOMEM;
>>>>> +    } else {
>>>>> +        syncobjs = stack_syncobjs;
>>>>> +    }
>>>>>          for (i = 0; i < count; i++) {
>>>>>            u32 handle;
>>>>> @@ -1292,25 +1298,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>>    err_put_syncobjs:
>>>>>        while (i-- > 0)
>>>>>            drm_syncobj_put(syncobjs[i]);
>>>>> -    kfree(syncobjs);
>>>>> +
>>>>> +    if (syncobjs != stack_syncobjs)
>>>>> +        kfree(syncobjs);
>>>>>          return ret;
>>>>>    }
>>>>>      static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>>>>> -                   uint32_t count)
>>>>> +                   uint32_t count,
>>>>> +                   bool free_container)
>>>>>    {
>>>>>        uint32_t i;
>>>>>          for (i = 0; i < count; i++)
>>>>>            drm_syncobj_put(syncobjs[i]);
>>>>> -    kfree(syncobjs);
>>>>> +
>>>>> +    if (free_container)
>>>>> +        kfree(syncobjs);
>>>>>    }
>>>>>      int
>>>>>    drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>>                   struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_wait *args = data;
>>>>>        ktime_t deadline, *pdeadline = NULL;
>>>>>        u32 count = args->count_handles;
>>>>> @@ -1336,6 +1348,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         count,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1354,7 +1368,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>>                             &first,
>>>>>                             pdeadline);
>>>>>    -    drm_syncobj_array_free(syncobjs, count);
>>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>>          if (timeout < 0)
>>>>>            return timeout;
>>>>> @@ -1368,6 +1382,7 @@ int
>>>>>    drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>>                    struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_timeline_wait *args = data;
>>>>>        ktime_t deadline, *pdeadline = NULL;
>>>>>        u32 count = args->count_handles;
>>>>> @@ -1394,6 +1409,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         count,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1412,7 +1429,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>>                             &first,
>>>>>                             pdeadline);
>>>>>    -    drm_syncobj_array_free(syncobjs, count);
>>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>>          if (timeout < 0)
>>>>>            return timeout;
>>>>> @@ -1529,6 +1546,7 @@ int
>>>>>    drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>>                struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_array *args = data;
>>>>>        struct drm_syncobj **syncobjs;
>>>>>        uint32_t i;
>>>>> @@ -1546,6 +1564,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         args->count_handles,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1553,7 +1573,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>>        for (i = 0; i < args->count_handles; i++)
>>>>>            drm_syncobj_replace_fence(syncobjs[i], NULL);
>>>>>    -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>>> +                   syncobjs != stack_syncobjs);
>>>>>          return 0;
>>>>>    }
>>>>> @@ -1562,6 +1583,7 @@ int
>>>>>    drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>>                 struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_array *args = data;
>>>>>        struct drm_syncobj **syncobjs;
>>>>>        uint32_t i;
>>>>> @@ -1579,6 +1601,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         args->count_handles,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1589,7 +1613,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>>                break;
>>>>>        }
>>>>>    -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>>> +                   syncobjs != stack_syncobjs);
>>>>>          return ret;
>>>>>    }
>>>>> @@ -1598,6 +1623,7 @@ int
>>>>>    drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>>                      struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>>>        uint32_t i, j, count = args->count_handles;
>>>>> @@ -1617,6 +1643,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         count,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1653,7 +1681,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>>    err_chains:
>>>>>        kfree(chains);
>>>>>    out:
>>>>> -    drm_syncobj_array_free(syncobjs, count);
>>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>>          return ret;
>>>>>    }
>>>>> @@ -1661,6 +1689,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>>    int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>>                    struct drm_file *file_private)
>>>>>    {
>>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>>        struct drm_syncobj **syncobjs;
>>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>>> @@ -1679,6 +1708,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>>        ret = drm_syncobj_array_find(file_private,
>>>>>                         u64_to_user_ptr(args->handles),
>>>>>                         args->count_handles,
>>>>> +                     stack_syncobjs,
>>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>>                         &syncobjs);
>>>>>        if (ret < 0)
>>>>>            return ret;
>>>>> @@ -1722,7 +1753,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>>            if (ret)
>>>>>                break;
>>>>>        }
>>>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>>> +                   syncobjs != stack_syncobjs);
>>>>>          return ret;
>>>>>    }
>>>>
>>>
>>
> 

