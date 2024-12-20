Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D49CF9F929F
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 13:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3936710E339;
	Fri, 20 Dec 2024 12:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R3usjp8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2415::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1BFC10E12A;
 Fri, 20 Dec 2024 12:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=osbwQn5Js013Z1Bw6Y/jsl/30r0I8IEeuG5mCxiBLegpC4QPZtmELB1vgXh/b6i7HPzV3c7qOBS0CWVdo65LlQOr3QtgKwXIV3r6xEpEz1UZg1nSSllhmyqz0bsgotM4po3XUZEX9Zr/Qg5PEbfwT2BW4CWKXzyszS/5tPPgmVA+/yohCOB0G5TKdjWEl9TeOJoPCp1ckDTfirtQpzW+3LkkQUkJDcgQ+uH1ddKs+dHdaOetRDrxxmTCLcNC86TvXnOy8pVAHjGJyZREcpxcNpkd5xoldaebSdrvPVvnyktILWSy2KRdzg6PMUQ0zpKd1ud3U0P9r+ohctvRQtR/AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyWuWCKGuU9hj7KG5JzXJzDQakBJm0pQmykTH66Zb2Q=;
 b=uMAyiN6n39m1+yd2d3B06sFfppTW29kzw69CnItpDFRGu53ljJ7LhAEizq5Hi5igrLagJbvnlFfmIaaoJP/ZHF5cEu66ibaPclGC6X1m8VApvSye2bflUOIDuITJkAYmWgzNhToYtCHWmT8hdUjJQHTh4ebGAUL2M/aNNPpfW5jDZaqF3yij8Ov+HzvS7xD6ANG2Ur7T33IYBBv5oXCb4ojQWW1gr66AYhyArF0NxWEOlUIdPCMLBXwTPmXmvEYz9ipKgLa/4vHPwfouC1xjRQf478HzQCgkpjJ5tn5XbajBGC3VRJH+L9w1/DFdH3LDhqYx3vuRXnWrjtiPxluFVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyWuWCKGuU9hj7KG5JzXJzDQakBJm0pQmykTH66Zb2Q=;
 b=R3usjp8Wj976uJ3LKG+Msfpc7EuAh7v5TcYoKN+PUaCsoYgSHL4+cYWRqpOKl/W/4wmCGGtuN3/DW1JAY1FwneAJKDJ4yNG34JNaKSyMcsN42JdLeZjxz6ufYdtdOIRNSZpOUTmseLZv6AhaRR+rwPyewxqZBc6N+qxE32/NhP8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB8118.namprd12.prod.outlook.com (2603:10b6:806:333::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 12:54:59 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 12:54:59 +0000
Message-ID: <8ffa9abc-94ae-4622-916e-947ac73402f9@amd.com>
Date: Fri, 20 Dec 2024 18:24:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/buddy: Add a testcase to verify the multiroot fini
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241216130735.314298-1-Arunpravin.PaneerSelvam@amd.com>
 <20241216130735.314298-2-Arunpravin.PaneerSelvam@amd.com>
 <e26daaa7-253a-4753-a5a8-f8f0c045c583@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <e26daaa7-253a-4753-a5a8-f8f0c045c583@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0019.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::10) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bdd467b-eee2-4dfd-86fd-08dd20f5828c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L280NDJBWmJSYkhvVDRqSUtkRXRNMEdZbnN3dVdwM3JMdWt3T0VvVC9nOGFq?=
 =?utf-8?B?bWVsa0o0OXFrczBsNm9oenhFMVJCblg5RHRXL005SlBpVVEzd1Flc3hhak9U?=
 =?utf-8?B?cW8wTDdsMFlSUlBHeC9WM0t3TkdPTWZPMWxCc2RPVXNhOGt3T0w0cGFIS1ZF?=
 =?utf-8?B?ckE1TnBBZldWMWxHbXRmYUszRWpDSWpnY3B4UjRPT2I3YVI5Zm5LVHdlbWd6?=
 =?utf-8?B?N0VVSmM4aVlMS2ZweVU4UHl2WmpDZzhKWnJ3a3g3M1VULzVRa1laSjFNc1Ja?=
 =?utf-8?B?L0FlbzZlN0JxYVI5dk1rOUdUajBQYkdmczJSb0NjRzhlOXhIcHh1Ti9OMFha?=
 =?utf-8?B?aGpzdE9ZZzFFZWNHWHZKKzJHSFh4VzRnaStETk1XTG1HMi9Vd1kzUjlkaGFo?=
 =?utf-8?B?ZVZmcmovWDF1Tzh2UUEyMTVSNTM2LzEreWZJSFQwRlMyc1lmZVRxV1V3TjVU?=
 =?utf-8?B?REQzUG5jWE0xVVBtWmRtL0JFa0VHSGx1T0VhcTB4bElJVnhmdEVSSDZPS1hl?=
 =?utf-8?B?UGlyekdIODRwNGNCTUVGRkNJRTM1aWo3bnpNOGlkN2o4Sy9UdkJONFVMNnZQ?=
 =?utf-8?B?NnJwVTlSYmFEenJuNi9nVW0rckRid0lZZDhnVlpGV1FCWUlvMFF0ajVrZXhD?=
 =?utf-8?B?aS9mNW55VjRNaFJ1ejRURzlpWEg1cDNQdmd4RXBrU2RRaUp6VmRRdTN4R1Rq?=
 =?utf-8?B?M0psalFCNm5Ga0tRUVVoZEk0RFQwbGV0VkNIaFlQMk82WWVQaGhOVGNaaHFM?=
 =?utf-8?B?cjNTQ2dFOWluTk5hQUFOZVpvSjlLWnliL1ptTTZaN1F1SzdWb29zR2k3eElE?=
 =?utf-8?B?OTJvMStvVy91bzlRWC9ONE9uL2VvdC9oLzNzZFVkdGFhbk03VEFSTGVidklu?=
 =?utf-8?B?T3lLMThOT2M3TFFWNms1bGtxSmlrWXVnMERCTzVDcXlKUzJpQ0dUbVhTRVN6?=
 =?utf-8?B?NEZBTTlvV09CRVRYWE5BR1IwcHFnaEd4cnF0WmE0RkxlSVEySzBidTRvYlZW?=
 =?utf-8?B?QzJCdXhMRkV6S2ExUFJELytWZDNEMWFxM2lKOGFnTVdzSStUWHBDaWgxQk83?=
 =?utf-8?B?SzVVQnBBdldsL20yREI5VFNyOTN5TTBVanJxQXFYd01VL28xRGxod2FLSVRT?=
 =?utf-8?B?TEI0WkJKaXYxNDVmLzV1cjVaOGFVNVVCMXJRR0NWcUl5eG84OTNubS84bVhX?=
 =?utf-8?B?M1BGV0FaalduaTkwb214UzE1eTB6WHNJaFB4SWFwTk11U3hveDhNWDZPYngw?=
 =?utf-8?B?TTByOTZnSGpTcElXTTcxTEptOEQ4VXI3VFovU256allsc3k3MXVpZlBleC9G?=
 =?utf-8?B?SHd5NFlqdEl4Nk9iMnVBa0tKd2d1Wk54dHF0ck81NkxUU3BwcUNVbHlYeVVz?=
 =?utf-8?B?d0VPRzZoNkRPL3NReTBpWW9oeXJ3QU1tRFQ3cHUxQVNDYlY4K1dsL3pnLzF6?=
 =?utf-8?B?RUx4SU10NE13SlN3eDVnU3hiYzN6WnpoRjZrNkZOTm5mS3ZMQWlTenFGK1VJ?=
 =?utf-8?B?RmxHYTgwQ3dSYXlMZ2xGZ1ZyR1p3aWdqbDhWQXNyeHEwUThQRjZCS0k5SjB2?=
 =?utf-8?B?OTUvT2hERGNRRTN4QUt4MVhVUk1KTktNaEVzcnE1VHVKTWNEL0RTTTJMTFpo?=
 =?utf-8?B?NHV2ZW9hQTRvR3NqWnJlYnltUEdtL0xVUG9lS1lJZnNGNUNhSEl4NEI1V010?=
 =?utf-8?B?VTdjVGxqOGc3SitPV2tobERZKytYQ2hSdk1FQmtIZWVGdGFCVHZINm9qRG9P?=
 =?utf-8?B?TWxYMEFRWDVnQWtkYk5xUnJzSmVMYlM2VUx1SG5lVGViclBlVnZ0bG5JV3lK?=
 =?utf-8?B?eDloMHB4ejMwUzNLczBNMENwK3dmcjBvYmllWWJWbWsvVzNHejVXVW9QQjkx?=
 =?utf-8?Q?7bsaEKYOZLZ+U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dldWR2pRWVVPa1JDWllvQWR2T1RmYXBVYUJyQmg5dnFweFVNSi9ndEU5OVhP?=
 =?utf-8?B?VW5pWnZPL1RhSkRUaGlMeC9VYm5XcGMrcEV3RnJvYzlwNG5FdWQ3NEx1RDBu?=
 =?utf-8?B?dDN3WmhkbWJ4YkdvMmpLWXNwTEM0ME1jVkNhL0YzUlVBZmkyUEp2UzRIdVVk?=
 =?utf-8?B?S0tFVHdLR1k1dlR1dTZSUHprbHhXQ1lzN0w5NDkyQ0tpNGdjanpVeTBVU0Vy?=
 =?utf-8?B?WnU1MEFGU283c0FEK2tvMjhObEc0bFRQTkt3a1YyWGFlZzkyQWJBdW5SbkpO?=
 =?utf-8?B?T0hRc3ZNRDgvQjVxeFUwOWs0WkxGUGFTeWJJaCtVVHU1NHR6N29KYzBqdWJE?=
 =?utf-8?B?Lzcwc0ZJQVF4V2JMbmNBK0lraVl6L3FGdFgrVFRwV3poZFhSQ0dpaVBDdE9p?=
 =?utf-8?B?UTB0UlZCSGU0eWlJUHVZbmN0MWltaDgyK3p1RHpVUFo1UmpGc0RkalZVMzNo?=
 =?utf-8?B?MFg2bWR1T2dJUlJiN25TN255cXlFUUhnTlZWUXF5YVFnNjBvSEcyTE91VENr?=
 =?utf-8?B?UXlCZUpHajBxVUNaMGwxZzVtekJwaVhBdUFkbG9VcVVyUTE3SDduLzFEZldE?=
 =?utf-8?B?VlJtaXRSdFhlUUNpU1dtejNjaE5rNjd2ckZyN0FNWFVNVWpLa1lya0YyT0RN?=
 =?utf-8?B?SlFyMFhuR0lXdytSQkpFVmEzdzJnZ2QyVWVNM0RjOFJPeWlpbnE2SHZhRFE1?=
 =?utf-8?B?UDA0MGdhUW00RnYwU2M5b2pkRWM1a1lvWkhDcVdJbW1oVTFkL081Mzd0UUNi?=
 =?utf-8?B?bkRUZVBTcTE2ZmF5L3d6Uk1nZ3FISWw0NFc4bEJqUGdBdXFodXBBL1BVcmVs?=
 =?utf-8?B?bS92SFYwUVdsenRoNUtWb1lPZ3ZlWGNLaFVXZ2dZeis5OCt3S2kxYi9kM0tx?=
 =?utf-8?B?K0RVK3c0OXpUcyt4aHF1WCtveVAwOWpVWGVKUWlDdjZqTlhlcjJtcEJFekpY?=
 =?utf-8?B?SWd0U0VteHpIMkx5SUdrNEdoQ1liM1lsaklLa01KRkVwYWYwS0dVNE03cmRS?=
 =?utf-8?B?T0FFYnoyRTNsbHJaeGNKK1NqUHM2ZWlwMTg5T1RWdE1ldWRHUC8yVk5Fc2xE?=
 =?utf-8?B?U1BGKzc0M2E1UHN0TUR2dmV2RVE2WElPcVlGRm56VTd3NWJzM25zN1JLV3M0?=
 =?utf-8?B?T0x1RHp1N2ltMFdwNjRaZkNCVUo0cjh1SFFoTkh5VXZ3N0UxemtNWkhJdGlw?=
 =?utf-8?B?MUFoRVhMZng4WERseVpBRUUwZ2s3b21QanNjMjFFNjJEc0hpNVEvZSt6NEZ5?=
 =?utf-8?B?YWZPNkV6YVVzSkwvSTVRalRtUU1mUFN1WCtXZUJ4RDNNQVlXd2lzTEU1emxs?=
 =?utf-8?B?N2hSekFWVzJYUENWY2F5MHVDV2hCZUFTak9Bck5INnJBNWhFWkt6eS9tc25N?=
 =?utf-8?B?WEtFYjVvekpxb3BMcWlYYmplenk1SkxhVGVOcmpsSE5TV3RvU0lrSlM0aFA0?=
 =?utf-8?B?MjdaTVF3S1JvSDJOa0dDdnVSaGF5WnhVUzhKcFY0TTJqQU42dys2S0hhRmZz?=
 =?utf-8?B?ZHpBby9PRXlhSy92L2tGUTZsajZod0czZ3FzYVFjb05jM3VVdExBY0dTUUdN?=
 =?utf-8?B?MjZHWGY3cFRLWHZjREZFQXlBMjM5ajdxTUltNko1eDRsdjFQU3p2Z1BwbUp3?=
 =?utf-8?B?cHh2TWdjditoUkNmaitzejZCY1ZIOGtROU5tUTRhMVdKcXlIYnZxN1EyQjJY?=
 =?utf-8?B?VkhzTkplTnEzN04yTDdWWjVVbURrd3pLd01aQlUvVWVjb24rdUtoVXJVVDhK?=
 =?utf-8?B?a3lQa1JwMGdCR2Z1YXlmazV2L1Q0SHhweE90UitIL0hNcThjaTRZRzZwN2NN?=
 =?utf-8?B?eEJzSDZGL25pUnl6VVJib1c4R01YUDJneEJKMGJpVXkya3kyMmZPVEJzZ1Ns?=
 =?utf-8?B?S2VGRG5FbUNHYjlkeWFmd1Voc3Q0a3l1M1JqYTliK0llV05zUERIR3VjM2d5?=
 =?utf-8?B?VjdYaGZEUHZScXRFTCtLWkViZXV2T2kwUElkZXJ0MGVQMUFDYkE2cjdEQWkv?=
 =?utf-8?B?U2o5RUc3bTduNU9EV3ZJeS9oUmMwVE5YdkYwNXBLZFNQUnZIMDE0ZzllaXRl?=
 =?utf-8?B?M3VDV1NMZ0RyRUduWmxHZUtFK0JhTmRNbm9qb2Q3dUl5ZXdGaXU2RG9SbDZI?=
 =?utf-8?Q?5JpgCwNSDJfCWPnVlqqndkVQm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bdd467b-eee2-4dfd-86fd-08dd20f5828c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 12:54:58.9223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaAEwUvvZd4DKzsCyz6IDCuIAfh4EvmMp0Mx7cPzktoU2CuSX4ag8rkl9W107xcj63TSPlqW+3FRPpaG34nwrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8118
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

Hi Matthew,


On 12/16/2024 11:52 PM, Matthew Auld wrote:
> On 16/12/2024 13:07, Arunpravin Paneer Selvam wrote:
>> - Added a testcase to verify the multiroot force merge fini.
>> - Added a new field in_use to track the mm freed status.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Signed-off-by: Lin.Cao <lincao12@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c            | 20 ++++++++++++++++-
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 30 ++++++++++++++++++--------
>>   include/drm/drm_buddy.h                |  2 ++
>>   3 files changed, 42 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index ca42e6081d27..39ce918b3a65 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -102,6 +102,18 @@ static inline bool contains(u64 s1, u64 e1, u64 
>> s2, u64 e2)
>>       return s1 <= s2 && e1 >= e2;
>>   }
>>   +static bool is_roots_freed(struct drm_buddy *mm)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < mm->n_roots; ++i) {
>> +        if (!drm_buddy_block_is_free(mm->roots[i]))
>> +            return false;
>> +    }
>> +
>> +    return true;
>> +}
>> +
>>   static struct drm_buddy_block *
>>   __get_buddy(struct drm_buddy_block *block)
>>   {
>> @@ -303,6 +315,8 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>           i++;
>>       } while (size);
>>   +    mm->in_use = true;
>> +
>>       return 0;
>>     out_free_roots:
>> @@ -335,13 +349,17 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>           start = drm_buddy_block_offset(mm->roots[i]);
>>           __force_merge(mm, start, start + size, order);
>>   -        WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
>
> So does this warn not pop? Or it does but kunit ignores it or something?
WARN does pop but there is no interface to detect this warning by the KUNIT.
>
>>           drm_block_free(mm, mm->roots[i]);
>>             root_size = mm->chunk_size << order;
>>           size -= root_size;
>>       }
>>   +    mm->in_use = false;
>> +
>> +    if (WARN_ON(!is_roots_freed(mm)))
>
> This looks like UAF under normal operation, since each root pointer 
> within mm->roots is already gone.
>
> How about something like this:
>
> + #include <kunit/test-bug.h>
> +
>  #include <linux/kmemleak.h>
>  #include <linux/module.h>
>  #include <linux/sizes.h>
> @@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>                 start = drm_buddy_block_offset(mm->roots[i]);
>                 __force_merge(mm, start, start + size, order);
>
> - WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +               if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
> +                       kunit_fail_current_test("buddy_fini() root");
> +
>                 drm_block_free(mm, mm->roots[i]);
>
>                 root_size = mm->chunk_size << order;
>
> And then also drop the in_use stuff. As a follow up could do that for 
> all warnings in this file that don't result in error being returned to 
> the caller...
>
>> +        mm->in_use = true;
>> +
>>       WARN_ON(mm->avail != mm->size);
>
> ...like this one.
Good idea, we need this from test case perspective, I will make changes 
and send the next version.

Regards,
Arun.
>
> >   >       kfree(mm->roots);
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index 9662c949d0e3..694b058ddd6d 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -385,19 +385,31 @@ static void drm_test_buddy_alloc_clear(struct 
>> kunit *test)
>>       drm_buddy_fini(&mm);
>>         /*
>> -     * Create a new mm with a non power-of-two size. Allocate a 
>> random size, free as
>> -     * cleared and then call fini. This will ensure the multi-root 
>> force merge during
>> -     * fini.
>> +     * Create a new mm with a non power-of-two size. Allocate a 
>> random size from each
>> +     * root, free as cleared and then call fini. This will ensure 
>> the multi-root
>> +     * force merge during fini.
>>        */
>> -    mm_size = 12 * SZ_4K;
>> -    size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
>> +    mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
>> +
>>       KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>> -    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size,
>> -                                size, ps, &allocated,
>> -                                DRM_BUDDY_TOPDOWN_ALLOCATION),
>> -                "buddy_alloc hit an error size=%u\n", size);
>> +    KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> SZ_4K << max_order,
>> +                                4 * ps, ps, &allocated,
>> +                                DRM_BUDDY_RANGE_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", 4 * ps);
>> +    drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> SZ_4K << max_order,
>> +                                2 * ps, ps, &allocated,
>> +                                DRM_BUDDY_CLEAR_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", 2 * ps);
>> +    drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K 
>> << max_order, mm_size,
>> +                                ps, ps, &allocated,
>> +                                DRM_BUDDY_RANGE_ALLOCATION),
>> +                "buddy_alloc hit an error size=%lu\n", ps);
>>       drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>>       drm_buddy_fini(&mm);
>> +    KUNIT_EXPECT_EQ(test, mm.in_use, false);
>>   }
>>     static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9689a7c5dd36..d692d831ffdd 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -86,6 +86,8 @@ struct drm_buddy {
>>       unsigned int n_roots;
>>       unsigned int max_order;
>>   +    bool in_use;
>> +
>>       /* Must be at least SZ_4K */
>>       u64 chunk_size;
>>       u64 size;
>

