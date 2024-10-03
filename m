Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7662698EBF1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 10:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED9E410E1EA;
	Thu,  3 Oct 2024 08:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="v6XEZYHs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7188A10E1EA;
 Thu,  3 Oct 2024 08:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8MFxHJRJScOxBzibdiJxDaRUmCzTIxmr1V9vqSepWQ/si4PsBaoEkaT6FkT6nYq9tlS1vkWEHXyi91aK4X9tNHlOJ+pfx5JruE40og7JK8lLIS4y8z69Wfts/ZhkOF+F9DxRRVM+DRrGCplDEII/2JCRH2o+kr7v46FqHpz9Ryif6MYO10oLOmNFfqicxDaPKD+1gxdJxd1zB00ht+ypDfkytEAyyKZPq+66mh+PVUAmWJeDhkrnqjkFOmbTZSZQGeG5vrV4kewvFYt1Zq5abILmRdy3efSSaD8RrqCnt1+eXQScTno/7rUH1ayug4P/f6H/6sVf8ZiivsYPqC9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+h3YFTogeCF5nJHp0V3MyquArefnB+WbZvqeUHzM/nI=;
 b=FV4ojU/6Y+A5yQE9M8I1/4+KMcwXofv+DkB8I9IzUTdtp894QPwpUXoF8PItsoAXC9/iKNuojJibwe5m2n8hpRv4ltdIYUYinpPUg7AKesTMrgNA3BGGhoQ26hqvDqMRZyN8dS3qqo3+YwUBTPM31q4urihvY3tF1RY1Bkd3J2HT0NPF+LEsgR9xLvjjNQsggk92bGR9CXEGAPyI6IszprZ29Sd43B7I7waRjUoCOrJr+8PGMhk6vIQTCkj27qumeWScC94k+D5HzPVlA4nEiwRCsoFcAy4AwQDOrtYKQtLVRDTv2VoHRmpWuYW0WY0Bmq3vtz1azr5UJo8CqSIBWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+h3YFTogeCF5nJHp0V3MyquArefnB+WbZvqeUHzM/nI=;
 b=v6XEZYHs3SAF8DIGIWWsxDhj+PULtDyPyRXy8ddEiPuH0aEcAyH2s+K4A8PXNPazTHbAazuG5+w9UvmlndsPTvoFDxBQrk91CrvYJzgVLgp5r9wSGryEMdx7+XiVAN8Z7V/dslx6Eafby53ucauBwriWAXcVMWGDwxtFJH95aTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6293.namprd12.prod.outlook.com (2603:10b6:208:3c2::22)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 08:58:17 +0000
Received: from MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743]) by MN0PR12MB6293.namprd12.prod.outlook.com
 ([fe80::49ac:e84e:ea32:d743%4]) with mapi id 15.20.8026.016; Thu, 3 Oct 2024
 08:58:17 +0000
Content-Type: multipart/alternative;
 boundary="------------7Blx0iqWIyX5xJlT0Zg0n23j"
Message-ID: <56457fa4-d03f-4e97-9949-27f4e91472c0@amd.com>
Date: Thu, 3 Oct 2024 14:28:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-next] Fix unintentional integer overflow
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, simona@ffwll.ch, leo.liu@amd.com,
 sathishkumar.sundararaju@amd.com, saleemkhan.jamadar@amd.com,
 Veerabadhran.Gopalakrishnan@amd.com, sonny.jiang@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com
References: <20241003071431.328259-1-advaitdhamorikar@gmail.com>
Content-Language: en-US
From: "Sundararaju, Sathishkumar" <sasundar@amd.com>
In-Reply-To: <20241003071431.328259-1-advaitdhamorikar@gmail.com>
X-ClientProxiedBy: PN2PR01CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::31) To MN0PR12MB6293.namprd12.prod.outlook.com
 (2603:10b6:208:3c2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6293:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d1cb300-c11a-40b9-23d1-08dce3898554
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXh3cHBhbEZTZ0gwVFp1dDd1SVFvd0FqM3plOE0xUlBHblJiNUQ2cXJzalVZ?=
 =?utf-8?B?NkVVc25mb0RhbjhQSzlPcHVpZkQ4K3NISm5RNVlhTXBqUVA4dTZFSitKaCsx?=
 =?utf-8?B?QnUvMGYwYkE5REZGZWZCRW1MckdUWk1zd1JHN2d6cjdnUDU4ZDZVMmY2bzRq?=
 =?utf-8?B?NW14VE1qWnFqbHJyZ0ttc3A0YVFQSGtzSkpiZUEvaXhFNWlOWEt0SVpBUmtJ?=
 =?utf-8?B?L1N2SUhrSFVCQTZJV0NnN1haQXhTT2lJVHMyRlVmWW5ZaHJEeStvV2VHRDMy?=
 =?utf-8?B?eGE2aVdHYjA3UDVjRFg4cW5oaFBLY0pvckdUeE9HY3ZVcy9sY3hnSlJ4U1ZZ?=
 =?utf-8?B?Vjk0bEduTUJGRnZTUUpVbnQwY0taQmdMOGN6L3Fkdk9LNHdlZzZMaE5mK25V?=
 =?utf-8?B?U1pHa1p0U01RTWl5Q2VvcVp0V1BhcmE1Wm1FdWR4UGdYMlFxbDVLQVppYWpn?=
 =?utf-8?B?Wk45dTd3WVJlT0E4VXNsSktHVC8yeEl3dTR5UERSSDRMZFk5KzNhaGVNUEIv?=
 =?utf-8?B?L29GOFcrK2dwWUVGc3BZUjdBa3FDZjE0dStWSnF4a1JobTRjazhSWTV3WjF3?=
 =?utf-8?B?VmxjdFBTWEdtazYxbkpxdVFjOUdDRVR2RmIzQzdTaEhaYTlvMU9YZjk5RUh1?=
 =?utf-8?B?RFpvQ2IxVkszVmhPRkQ0QmVRMzZGL2lKZ3pLcW41NUxrb1czamhteDZUYjhn?=
 =?utf-8?B?UmVoeVMzT0tDOG5MdVR6MEFhWGxEUXhuT3NNUXRqRTBSSk4vUHVqNlZyeCti?=
 =?utf-8?B?NTYwR3ZDdllJOG9xRkNhS2ozZjlsc1dFd1VXVjhEYUtDYUZhUGdqYjFxS1Bj?=
 =?utf-8?B?dWRtZlM4YVJwWXhKV1dXSURrRmd4aldKdjNTV1lJR3FVYk5kYW56L0ZHNm1U?=
 =?utf-8?B?cTFFb082ek15c2VIRHRNNlc2OGV0NGR2MHIrMSt0L3daajFWbGYxMklVekFB?=
 =?utf-8?B?V2wyU2VVUm0wM3FNOVlxcmxUMFJ3N3B2UFZrOEsyZ3ljaXVwRGJKMm9xWmJq?=
 =?utf-8?B?clJ5bzd5b1kyaEFMSUtFbUtuY0lRSTB0L3FOeTBaUDlvSjR2NERGMndQWkIx?=
 =?utf-8?B?VWNhV3ZITGJlMmk3SXFPeU1kVTgveWhhRTBaUUR5YzVpc0hDUVBkMHA4Y0Va?=
 =?utf-8?B?am5pVnozQ1NJQ0FaNWdXeTdCeDZjbGxXejQvV0VWbk5TV1hlYW1sL2FiQTJm?=
 =?utf-8?B?YTIvS2FoU1ppK1ZHbVA4czVHN3d2dFA3bzhwWEJtQ3o3dEZ5NVArdXRsdUtn?=
 =?utf-8?B?SUgyUGFYWXN6Q0xNcGI2cFI0aHFrN21lMkppVTVCbkxYdnJibFZtZjVCN1B3?=
 =?utf-8?B?Z2FMWTVkSndFN1hPME5FSFRtUkNUUHgzS0wvUjRod1FkV2tKZnI0MVd4NnBB?=
 =?utf-8?B?d3ZmNHV2OW9INmh2Rno3cG0xR05PNG9IQUNOL0NyTHpLNEQzYkl3b0ZiSTVx?=
 =?utf-8?B?VVdhckNUV0JLRTdBUVRTejNGVk5jb3FTWGhDN1NvNldZUkJUK2hIVzZKZVlN?=
 =?utf-8?B?UUtPaEdpU0RzOVpITklUUVBrVktqZEVLanVtSGJTcmluWnhqNTd5emcvTFVV?=
 =?utf-8?B?YnJacWQxblorb1JXaktHVngzWjlnTlZxbkZkUnlzdEtXTE9UbFBSaEE0TC9u?=
 =?utf-8?B?aUJ1Z3JVUStZREZNbjU3eHFZeWNjZWJHNDVLZlJPWDJVUnBHejRGNmMzd3lH?=
 =?utf-8?B?OTROdUdZakxyQTkwcFhpSTNvZEhXc2RxWHMzbVpNTjN3UHRKZndKSTNuc3lJ?=
 =?utf-8?Q?ZHsStZW50MW8Ok8rbHcZaQSK3IyBG1EWx07QGQV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6293.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(921020); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dE5qTVhvWVZTeGxYNzQvbWZ6NDZqTDRMZjhJb2dMdjB5TnArdEVWZmpndm1u?=
 =?utf-8?B?ZTV0eEEza1ZjWEQ1NVV0ZDN0a1NmTURGVTQ2LzU5TUFBVS9JOVVDSUdzb0N6?=
 =?utf-8?B?Wk9zLy90d3hpUHNydUJaZmhIQmZXK2RRTDg5Ynkvd28vR0hELzRXQ2xZYXBO?=
 =?utf-8?B?TFZRc1Q2RWtzVnMvL0hPZVkrVWpTNmU2UXJIWUFRNXNTeWNYSnlHc2s4dWxJ?=
 =?utf-8?B?MmlmMENMVzNldTE0OUFMSE5mYmkwM1BlV0trOWVBeHhjNDdwT0lYLzJ4UTlN?=
 =?utf-8?B?ZG9rYVdBbmhKRVE4Qk0rUkpYN09SOFNDeWhYdUpBbmdRVzBUU0N1a2lTeXJh?=
 =?utf-8?B?UENTbFlobnk0UDJyVHppNG1JWkNTaUJCMW9uWWZBTTNYanRuZlNNYW1CUFVt?=
 =?utf-8?B?RUllSTJLUnUxaktxZnZ2OENsS2NHcWF3THErc2JvZVI0WGZQbDhmOFJyaDRB?=
 =?utf-8?B?R0JBWDhiWWlxQUJFOC9wakZCYjVoL1cySHVtSFJjQStqd0E0ZElMQnRxNWJp?=
 =?utf-8?B?WmlvVmtwTDluTHRueUdMaGw1SndtZTY2dWxpb1NmK3p1a3g5WjJoY0FOOCtr?=
 =?utf-8?B?MUU0eTNDb2lDUVpubm5LeW14MEtIUnJjTWN5a1oydVRVUGptSFFVMVluSG9F?=
 =?utf-8?B?d1RMS0cvZC9IZ3VmOEo3bmVMd25ndCt2NWNWZTVTNmtCYzdwTHl0NmdCTmZC?=
 =?utf-8?B?MGlMYzkzakduRWxoVlFSN3g0YTF2Y0I1aTlOdDhWbW9PS1l2am8yWnoxRXRU?=
 =?utf-8?B?QzNzUnFGYTROMm9iOEtUOWVacmhkZWhjNWxVK3FQSlZaUThzeXlERUYxMmwx?=
 =?utf-8?B?U0RidlNhaHE0NFNhOEZFWVZtRHkva1BLMEFDTFVaTk9uWmlWdnNOU09WcUZ5?=
 =?utf-8?B?cE4zRVFTRDBNQzdQRTJIUE85MHd5bkNhSkdHVFBsTzRIK3JzSWQ2ei9xeVhR?=
 =?utf-8?B?Q3d0SHZLNUd3SmpsNU9ZRDJBYlowVTNRMlRGTUt0YzV2MGsvdmc3SERQYVVH?=
 =?utf-8?B?N2pPT3h6Ums4Und3bkpHcHFJeXVMZlFtWmhlTWRTTGVKa1JHcXQxaCtUSUkr?=
 =?utf-8?B?MEoyR1ZvTDJ2S0t2cmJ3UU11TEZoSFJxMWFxNmQycUpLVml5ZXBWUHI5NVVh?=
 =?utf-8?B?dVpiVDdJZytPOVJ0ZWZUYTgyTmpWTTI4emdCSHB4NmM4L21CVzlGWEZYeXA2?=
 =?utf-8?B?NUlGMFRTUkFZR3NBbHBZUGJrcU9ZWWJBOCtVVnNHQWpZa0pLNFYxMDVZU1Js?=
 =?utf-8?B?dXByc2Y0Rkt4TUVkUFZhVHVNUHhkelpBNUZ1amRDWVBVL0FzRWxqMEl2NjVJ?=
 =?utf-8?B?TW5rK3B6ZDMxNHY5Y1BWczBKY0RTVFQ4NWhtVmJVNW5sVXZUSDJMWWFlbXhV?=
 =?utf-8?B?WDB5K0FwZTY5bjVWZlRHM05FZmtRdU1nSjg3SS9nT0pnNCtEcXBrMHM1aG43?=
 =?utf-8?B?Q1hSL25uSzd3dHRweHRDbWt6Q0xhaEd5RlQxamZtcEd1Vmo2THA1dkFLMW5w?=
 =?utf-8?B?dzZyTzRoNW1rWHo5aHVqd2Z1a1o1ZXg3TDhyNHhSSmZQTDZ3cWRnRlV6R3hy?=
 =?utf-8?B?YWhrTzdxdEdYWWpjMzVrK2s1dnVwYWRxblBKcTNtMGpkMUdKaWFKTk5nbTRj?=
 =?utf-8?B?ZjE5cVFweHhpVkZpZ05DTVpvWXVvWXpzTGcreDkvWFQ1WUN6SVVyZjM2dktR?=
 =?utf-8?B?RFVTNnlpdCtVV1plMXoyb0tmaTJ3QjFORVFKYm1wK2ZScWxGSDFZU0VXVUl4?=
 =?utf-8?B?bHZIRFN2ckczaU9LSUVjQTBmQ2ExZjlmTUhIa0NqNkNITFZicTVtMmtWd2RR?=
 =?utf-8?B?RDlRNXFBUkFEd2FzeGR2MW1rN3ArYlJ0aDE1S3ZOT2RXcURPamxmYisxYjhL?=
 =?utf-8?B?YmUycmdncWtTcGQ3ME0yYTdVMGE1aDZ2U2M3aXhKdEpuUXhseUtxT21haGti?=
 =?utf-8?B?SFltTmQwU1F6YURvMmJlNW9xSURwSGl0elNmOXJDT2NsWEE5SFAwZWg2c25B?=
 =?utf-8?B?dmxiVk9lREwwN282aU1RMjBMQktlZDVRNTdGTjBsVVlqV29CTWg1dFI2bTZB?=
 =?utf-8?B?dzRmQmFENURrSEV2UzNsbWdPczJRcXB5VzloUTErN1lZZlptempGT2FHc2lE?=
 =?utf-8?Q?ooD0LY4ihT4+rbOhmf2iirY0u?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d1cb300-c11a-40b9-23d1-08dce3898554
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6293.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 08:58:16.9882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8xxumRQYvdc9e3vVq2Trzs0vU75rY1wUAzf4gAVdG6wRoinxcUPwS6xLObC+gYULBSwB7VIgCsO0ZiAgEJaXWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469
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

--------------7Blx0iqWIyX5xJlT0Zg0n23j
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 10/3/2024 12:44 PM, Advait Dhamorikar wrote:
> Fix overflow issue by casting uint8_t to uint64_t in JPEG
> instance multiplication.
Thank you for the fix, u8 isn't the default it is usually treated as 
int, is it okay to mention "fix shift-count-overflow in.."

or something else of your choice , but not u8. And if possible, please 
align the end of commit description on all lines closer to each 
other(only where possible, else it is okay).

drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c:361:12: error: left shift count 
 >= width of type [-Werror=shift-count-overflow]
   361 |  mask = (1 << 32)  - 1;

Regards,

Sathish

> The expression's value may not be what the programmer intended,
> because the expression is evaluated using
> a narrow (i.e. few bits) integer type.
>
> Fixes: f0b19b84d391 ("drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs")
> Signed-off-by: Advait Dhamorikar<advaitdhamorikar@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> index 95e2796919fc..b6f0435f56ba 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
> @@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
>   	if (!adev)
>   		return -ENODEV;
>   
> -	mask = (1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
> +	mask = ((uint64_t)1 << (adev->jpeg.num_jpeg_inst * adev->jpeg.num_jpeg_rings)) - 1;
>   	if ((val & mask) == 0)
>   		return -EINVAL;
>   
--------------7Blx0iqWIyX5xJlT0Zg0n23j
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <br>
    <div class="moz-cite-prefix">On 10/3/2024 12:44 PM, Advait
      Dhamorikar wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20241003071431.328259-1-advaitdhamorikar@gmail.com">
      <pre class="moz-quote-pre" wrap="">Fix overflow issue by casting uint8_t to uint64_t in JPEG
instance multiplication.</pre>
    </blockquote>
    Thank you for the fix, u8 isn't the default it is usually treated as
    int, is it okay to mention &quot;fix shift-count-overflow in..&quot;
    <p>or something else of your choice , but not u8. And if possible,
      please align the end of commit description on all lines closer to
      each other<span style="white-space: pre-wrap"> (only where possible, else it is okay).
</span></p>
    <p>drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c:361:12: error: left
      shift count &gt;= width of type [-Werror=shift-count-overflow]<br>
      &nbsp; 361 |&nbsp; mask = (1 &lt;&lt; 32)&nbsp; - 1;<br>
      <br>
    </p>
    <p>Regards,</p>
    <p>Sathish</p>
    <blockquote type="cite" cite="mid:20241003071431.328259-1-advaitdhamorikar@gmail.com">
      <pre class="moz-quote-pre" wrap="">
The expression's value may not be what the programmer intended,
because the expression is evaluated using
a narrow (i.e. few bits) integer type.

Fixes: f0b19b84d391 (&quot;drm/amdgpu: add amdgpu_jpeg_sched_mask debugfs&quot;)
Signed-off-by: Advait Dhamorikar <a class="moz-txt-link-rfc2396E" href="mailto:advaitdhamorikar@gmail.com">&lt;advaitdhamorikar@gmail.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
index 95e2796919fc..b6f0435f56ba 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_jpeg.c
@@ -357,7 +357,7 @@ static int amdgpu_debugfs_jpeg_sched_mask_set(void *data, u64 val)
 	if (!adev)
 		return -ENODEV;
 
-	mask = (1 &lt;&lt; (adev-&gt;jpeg.num_jpeg_inst * adev-&gt;jpeg.num_jpeg_rings)) - 1;
+	mask = ((uint64_t)1 &lt;&lt; (adev-&gt;jpeg.num_jpeg_inst * adev-&gt;jpeg.num_jpeg_rings)) - 1;
 	if ((val &amp; mask) == 0)
 		return -EINVAL;
 
</pre>
    </blockquote>
  </body>
</html>

--------------7Blx0iqWIyX5xJlT0Zg0n23j--
