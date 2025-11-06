Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3A3C3B557
	for <lists+dri-devel@lfdr.de>; Thu, 06 Nov 2025 14:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65AE610E8D6;
	Thu,  6 Nov 2025 13:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cePPWwRR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F39D10E8D0;
 Thu,  6 Nov 2025 13:43:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIENbOKuFQwHiE/lcF0iQeNyeGsIrluVIGZh2pReRBzyMUtSwch5jO3f0/ewpxMA/LGKqutap/z7XUczgTCM0DcL5Sd21ZQ+FiVDeYV08GBOQPO/T3vmF++0KNh4SgsbQPZ6Dl/Yx8n1XhRuazx6ZDTWSq++jyv7JrdMm6t3PKGZarBje9UhwwFU99GGbWVIlv/kfzEHd/bEWAv9POdUmQkMsHM39hLeXpMCFCxkTNmOU9iuPaaxnKC9Pl/uz+ItqSd3FX1GXDwNVj07QUdbBTjZtKMnEKtu+GKA1J1tYGesA/5vNC9KQYkM08aFTiE0PSjwbShZrxx0k/wP7QSzxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2Q/XPCG0nWvoXqO6Hdg/4BqVA2K79+fq8rQxsRudtg=;
 b=AzXE4PNxWAblmEKoaUi03MT1ZjSwVOwqq+LS1xonZt2Aj0Nvx8MSRuP0lD2u071lLMd7RrBg1fcA0G5ClEgX+ocsdbgZW5KReSJqq9AkXNy3YSgxyuTf6VS38i1K5izqgAKXzsnFCW7/GkHVAhlJRh25xaHhTZYgmuaboSkZEoQr/mqkpwzzesfHpnzv09aJewKqmQeUJgvd1xUbBxf6ZmLwJ+UIozgv8bnlhHY4xf4AV202L0xILqN5/dF78YWfpqPMMS85XHNr68I+NwEtiH48ylJkjs25iORyYI4LBfhea695Sm19gC3GlDLBr3RWGk8e07lm6iyp1BhAj/TQ/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2Q/XPCG0nWvoXqO6Hdg/4BqVA2K79+fq8rQxsRudtg=;
 b=cePPWwRRG91SJTkbtKd4CaFqT8rzPuOiPzz+Cs4GQE8IiGGKT3wkONmFWsSi1HbZuHokmCJfnHJqqq3s0/DL4H5gC9if5cM46v0QgLn7n6ghwNTolztG6ixfLT9k2ofVfyBUjmIYxJP0CZSZwDHsR6X781KKsYGuS7G06TaJhVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB5805.namprd12.prod.outlook.com (2603:10b6:510:1d1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 13:43:10 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 13:43:10 +0000
Message-ID: <5a770cba-9fbb-4645-a987-afe25e446942@amd.com>
Date: Thu, 6 Nov 2025 14:43:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/20] drm/amdgpu: fix KFD eviction fence enable_signaling
 path
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-12-christian.koenig@amd.com>
 <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <febe733b667c1700333044bce8649c6520d69148.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0164.namprd04.prod.outlook.com
 (2603:10b6:408:eb::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB5805:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f9dfbd1-820a-4693-b330-08de1d3a6c90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ym1NWThETXA3TThJZWJUbFZPRVJvcm9ibytFaTVGSWJmWlVETXdHKzAraHZI?=
 =?utf-8?B?d2xMejh5cXpwU3oveVp5aHNydEpWWVo3UGVpM2JZWXJWZ29NNEYvTU1OaTNn?=
 =?utf-8?B?a3AyaWNBUE5ER3U3dEV2NVFheDUyS0NQMVhsUlo0eTFoNDJTaWVxVm1JUXZL?=
 =?utf-8?B?Q3VvL0dtQ0p0UU5acFdPVDJwU2tTNGo3T3dpK3Zvb1I3bHdzcUJLRVdzNHFO?=
 =?utf-8?B?V21kVG8zMU1zUExWR3BVanFzc2VsMUdGaWlTQVRkSkdtRm5FNjBLMXM2bzAv?=
 =?utf-8?B?aG90OVFQbitNa1Y5Snh2RFNqcU8yakE2a0pZUlg1WWZ4L0ZmQnJ2YTN6Uk1T?=
 =?utf-8?B?akVzaDJBL01FTGxKOUJFUG9GS3FLRzcwdUtBeWtDdlNTL0syYm40NVRkVmlG?=
 =?utf-8?B?UHd0eFNmM3hXc056ZWM3MWdFeE9FUFloN2Z6MFV0bFZsb09SKzZhdGk4T2V4?=
 =?utf-8?B?Mkxob3RKQUZhbGR2SFAxL09yVW5hOTl6bXYwYXFmMDVBcGZISjYweFRacHh5?=
 =?utf-8?B?UHU5WS9paDdoVGllNUo4Z2JkK0ptZ1dXSmFYUWNraXQyU0NhdmMwQ1VVNUF1?=
 =?utf-8?B?SG1BbHJEUlNkKzd1QWJWL0o1TERXVStsZFVuVzNlNUxmOWVzczIvZG9QMzBn?=
 =?utf-8?B?aEdqaFB6dEtadDEwTnlTaEtsTnFVRXZhdHhCanBmSjZWd2JCTU0xVjRneUNa?=
 =?utf-8?B?cnAyNEp2eXc3NGVFcGp0WVNqditDc3hPeldyRjNsaWRqTXI5UGFTcWJBOGlq?=
 =?utf-8?B?TFVHVUVHYmRPb3JvVHpFaWVRQmluQ0VuUkFVWDBvVEpXa3NGblIyVjFoK0R0?=
 =?utf-8?B?RnNUQVNiRmZzOW4rWHgvUmJaQTVRdm5CR0Y3d2d5RWNUUlNwUCs0blUzU3Q2?=
 =?utf-8?B?Wk50eVJzV0RjNEltR3cySGtEa083ZkEvK24ycU5tZVBpTEJRQ3NJR2xtQTJN?=
 =?utf-8?B?SnA5cXVXTkMwVDVCWHhsTXFNa2NTMk9LcnVWSDBERExobWx1ek1JSUFsWnkv?=
 =?utf-8?B?bDlhK0Z2WGJLREdrZjdETERUZnhyUFgvQUZGNnVxUWxNbEJyWWtSTVo3dVhI?=
 =?utf-8?B?ZVpZVW1qSytmTGt6ME5Ka3d2Ukg2MUNPUFAwVHpadzdQUXNqaXVJUzNkTWhx?=
 =?utf-8?B?c29IUlZNc0F1NDJKd3c3RzV0c09Mby9DWFNRVGwzNWFETzhBR05UWE9UMHZy?=
 =?utf-8?B?dDdqM1h3RTlpYVJQUitaNkxhRDF6TUl1c2x6Q1hRTHZqeEE5Z0NoeGRzbmNV?=
 =?utf-8?B?YllCL1REczY1NjBoa29US3RmNUgwTDlHdTkzMWRobkxUN2dtVXBzTDhlU0E3?=
 =?utf-8?B?TWFKTG95NjRkSENjdVJQc1JyNlB0aUdwelZVUUE0dDBwU1BTc0x5WUxOTHI1?=
 =?utf-8?B?RDhKbjNZa1VMQUhLeHdPeWZFa0NxenovYjF1M21yNlNyT3AwcmRxVEtpai9s?=
 =?utf-8?B?OXJ0Y0psdjRrcE03MmppUWpocFRKSjEzVWIva0dNQktab3hRMndIMTNnc3o3?=
 =?utf-8?B?UDBnbVBFNjVHbUxIeUZQZG5FV3YzNEQxTDFwUysrL0dGcnRIR1RSWUROSWUy?=
 =?utf-8?B?OWRpSUdROG9GdUJyRisrQVV3K0poN09iQU9XWFVJVzkwSWx3MjA1a3VOLzcw?=
 =?utf-8?B?dVVwYzA5bDRIZE9rSDgzc3BPM01nZGVpQVRhMHFsTWEwQzdsY3Q4c3VVRDFI?=
 =?utf-8?B?V3RWc1FEbDBYK2tWNzVCRDZTbEtxNm1Hd2pYazBRMGRvVUE1VHpabWRDNEpr?=
 =?utf-8?B?cXNQWmM4K2NQYnBSYnJ2MGsxaS9wQm10RTU5Z2lHU0ZmSWFZMGdvM243dXM5?=
 =?utf-8?B?UG1hT1F2VjBxWmd1NlcvSUM5dTEvRlU5RDJsTlNibFVocm4zNnQxVmw1ZWNV?=
 =?utf-8?B?MnVHTUdHeC83SG9CbUNiZE1NbXNPVXBQYmFBR0JJc2pwK2RKU2JieDFIRUJP?=
 =?utf-8?Q?vt2zy3RRm1WhVCWLyOJD0bjvlleSLudb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QXNZN29XRGRZUjVwbXBlbS8xbWZJS1RKNzRudFR6L2w4RzhrcGxDYk5xc3Vn?=
 =?utf-8?B?T3NDb3lxNmtnMXdVcG5NaFZpeVNJZXZYQzhwVTZPKzUyYmwvSUpSVlR3MkdQ?=
 =?utf-8?B?NmdsY0hpS0psWTZOK1VCNk5qaWV6TktXVkZ5QW05QjRMZE5TZTcvVk9TbDVp?=
 =?utf-8?B?c2duZmh5UmI0UnhEUmIyZEZkM0xKWGZQUCtoMzFRa04rYjF0WDNVaExQbWgx?=
 =?utf-8?B?b1RYSXoreFlialFnSUMxYUF4aHg4VnVEMmNPZ1hvQ3VKdjhkTFhoWHhNMjZp?=
 =?utf-8?B?QWwvY21DS1hEYjNxcGVtOWFwTkdZY2Y2Sm1tMGlvaExIVndpeTMreXZZNDJ6?=
 =?utf-8?B?ZnVYTG9aNURaTzlKUzl3ODE2NE9NZ3dUbVQ2bUZBWllaeHovVzJROHNnTjZY?=
 =?utf-8?B?SDBtcFByVUFhNEFVRURxVHF1SWlpTzdjZWdyRUlZOGhtRlBkNUQwYXZ1bHhz?=
 =?utf-8?B?Z01uWGUva1d0MFdFOFVkZHJuSElhZXFlZkJwVGJOMm5Ub3lzSFZUWnIvZDFy?=
 =?utf-8?B?QkZGKzdJQ3dBaGxmbTdGT0NNSWNtZmR3emNsVGQ1VkF1UEsvQ3pxTTZiNGxC?=
 =?utf-8?B?dEUwRWZoSGRPZklVdDVxZDdKRCsvMmhDRFJmUGJiMFNiMDZtOVBPRkRGN0Zv?=
 =?utf-8?B?MEc0ZzJzcmxWMVBXS2dMRmlkN0luaFBsNkhycGNOYUY1R2ozQW5uTUZjY29L?=
 =?utf-8?B?YW0xb2oxWkNpMjZIVFdldTFheUUvNEo3Y2lOYXIvRnhheUR5Z0svTmRVZXAr?=
 =?utf-8?B?MVlRY2FmNnFNQi9GL0lrV0JmMkplUHU4NXlIV3BEck80aEkwbS9ZeTJ0Rzdr?=
 =?utf-8?B?Uzd5Wjc4ZEtSR1IxT3BqV21NbjNIZzlXQmN4V2x0Rk1wMVVoQ3VSY2YxQ2M5?=
 =?utf-8?B?RWRpVTBySm1Qcy8xTTZVK3RMSVcwRmZOcDZoQmNTNFJUSnZwZ2l4MENVTXVY?=
 =?utf-8?B?aVZXVU1waitpcHZFYmlnNzhsSmlrMHVWN0VNdnJlcHU4dzRUd0xsYzdSZDdV?=
 =?utf-8?B?c3pxeEFhSE5nb05scjFlY3NkaUZ3bG1ES25Wck0rNVg1MHJaSDBSTUMrQTJP?=
 =?utf-8?B?WU15Q1VLMmFIeGZkck53OWVSbkc2K0F6T1RJaXFvZUthY0dZT1FGVkZyOE9l?=
 =?utf-8?B?V3c3VFE1anpBRk94R21sb21EWHVpUVVYSGU3Uy8zRDF6YXQ5dFFMa2xHQ3Bi?=
 =?utf-8?B?MEIzekpGT2NnYW0xMEdpdEowT0FTSlBEajd3QkdsQ2ZMZGY5a0h4VUUxbnNG?=
 =?utf-8?B?SHd4cjA1UVRwQjdxL0NaRCt4by9SZTlqR0xtNmIvT3hvQ1ZVODVKTm4yRVdt?=
 =?utf-8?B?WUZXWU9qQlQ1dWJkTHFuU05UUDVPb29jMmZIcVIvQWtCS3p1R01iNGQ1REpp?=
 =?utf-8?B?L0hvZSs4YUJaN1BwYWpZMHAyYVgwMklFV1V0SVVMemhOSERWMnJXRUFuT1JF?=
 =?utf-8?B?SnV5TW1jY3c1OEdNY0NmaEtITndCSFFFblVURjdiUXBBZCtQeDFhSHVFS0lE?=
 =?utf-8?B?VHloYUlER2grTUM0TG9WVVpvbkVLWjl1c1FVYjc5Y241aTFMR1B1WEQvclM0?=
 =?utf-8?B?N1ZGajZIMDhHWGcwNzgzWEVJYWRoYTM4VkIvekRSbFJhd1BjR1gvNXVPSTdt?=
 =?utf-8?B?a0RUd3JXY3F2NXdPLzdDemRENHdHTDlpajRCWFVRQldMcm9YMEE0aWQyT1FS?=
 =?utf-8?B?aWg3TFV3SE0xMUsyN3QwSWN6MjFKbHBjdTIyNGN1K1B5M1E0TFBOY0NMb0hx?=
 =?utf-8?B?UTNyUHBRUG1VbmpnejByMHFUekk2c0E1SWxtL1RMNE9YSktpbHNKd3lBaXpF?=
 =?utf-8?B?blZ0bmQ0bGNFNytsY0hmd1NsY09Fa3lQZXBoK0Z6WWY1VzVheURtL1k4Tnpx?=
 =?utf-8?B?NzFlMU4rQjRQaDNTSmZPczY1S3ZHb0FDUnVLV1VYYk5MaFBqbnJ2bU90RzFG?=
 =?utf-8?B?Q0M0SFEwY2RKd3JWdTJNK0haR2JsQVI2anBYYUdmV3J6TUtYNkhGbWxuRi9u?=
 =?utf-8?B?aFJBaGhjemtyYkhJL3Z2ZHFITDlqTTQrU1JuN2MzZHZsNEJsdFZCOVM1UGhq?=
 =?utf-8?B?eEJtc3J2Y3NDRklsWngxYTF6M1NwalM0MU1OZ0dXU1FHbC9sRFRpczBubk51?=
 =?utf-8?Q?zo1k=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f9dfbd1-820a-4693-b330-08de1d3a6c90
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 13:43:10.2697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aYYUaCgOmm6a6ZIyM2Pfg8Z5fVhJ1S4NZXQvvH6mMTy8+cq0SRioF8y0NduHtAcT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5805
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

On 11/4/25 17:28, Philipp Stanner wrote:
> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>> Calling dma_fence_is_signaled() here is illegal!
> 
> The series was sent as a v2. But is this still an RFC?

I think when Matthew came up with the XE patches we pretty much agreed that this is the way to go.

> 
> If not, more detailed commit messages are a desirable thing.

Good point, how about:

The enable_signaling callback is called with the same irqsave spinlock held than dma_fence_is_signaled() tries to grab. That will 100% reliable deadlock if that happens.

Thanks,
Christian.

> 
> 
> P.
> 
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c | 6 ------
>>  1 file changed, 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> index 1ef758ac5076..09c919f72b6c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_fence.c
>> @@ -120,12 +120,6 @@ static bool amdkfd_fence_enable_signaling(struct
>> dma_fence *f)
>>  {
>>  	struct amdgpu_amdkfd_fence *fence =
>> to_amdgpu_amdkfd_fence(f);
>>  
>> -	if (!fence)
>> -		return false;
>> -
>> -	if (dma_fence_is_signaled(f))
>> -		return true;
>> -
>>  	if (!fence->svm_bo) {
>>  		if
>> (!kgd2kfd_schedule_evict_and_restore_process(fence->mm, f))
>>  			return true;
> 

