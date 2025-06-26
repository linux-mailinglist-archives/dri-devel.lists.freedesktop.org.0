Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779DAAE9F24
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 15:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 061F110E8CB;
	Thu, 26 Jun 2025 13:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DPFrFWIM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2042.outbound.protection.outlook.com [40.107.237.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9210E8B2;
 Thu, 26 Jun 2025 13:40:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyl/Z6qvkcKBofSZYCiVUFlNh6pMawXUb9GwAYnyDf/1D+PgDp4VJxfHlxnuBqOpZ+McxfedaIxAIweR+bx90CS/eilSV9w6L02u0WcTyO3FrT5XastqCNHUPVEHKWNP883VEqVpDnkNOeG9pSDGU52q3L9zOyMvhPdR/1N4qodBkeoV6FlMc1UXRMepcz4FRWxqmjqMCp4w6el/E7fNomHutFUDWv395lvt7TdHUYMLk6V3bG5CuUl3OauMZrg7FyDUSKDSfR0jasAjiki6Z1x9gTzpeUy4RlARiGdc9PCRz7yPOk64JWLSEeUN5bkKSjSB68c9NUNbxHA1l8VD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/nrGL8O4DZq9OEW2mO95L5egd5h019+gFGoEvIKxXU=;
 b=m1CYYedi4wjpq0FlPtiaMggaWMvtNv42U+Dam10inYWoL6bB8J4qzjMkqLf3JkRSMAuZ0Mh7SwEknFTpGFC2TLYqT/qoBG2ENuLyvLpyI0YFU1TvEfzBGqryhMPIK+7JaXMgzVzeoZ+/Ooqc0Z8lz/RbyMDoh3SrSUgv/pUMzQsaFhYfn8OhT4VtWaLWmet4zOZu6gBMh2pzLIREpx1KRZEofeFfJXExk2X7q7jwR4IvN52WDpcSmyXyFIwf2QLbzYED25aYHoopcwluAXm3a44lHQlh08tkLzAsJuavYPj0Oe00iBRCK166damYDfIgAh/j+pZdju/ysUujJ+78eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/nrGL8O4DZq9OEW2mO95L5egd5h019+gFGoEvIKxXU=;
 b=DPFrFWIMS5R17wNTb8l7EMPtmKFJ3ZXeOWuUcwIAk7lzbyvXjRa+8fxjxUiiGpdwfaY1/AkHDh6A0ixDlcx6zdzv/+HkuMftSH+tpNeHgamxt/m334k3FD+7WdVZjWdmh25lIet+/9fmg51PacMIOdI1D5fOKfR9hs7gIlB9lWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by SN7PR12MB6790.namprd12.prod.outlook.com (2603:10b6:806:269::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.25; Thu, 26 Jun
 2025 13:40:39 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%5]) with mapi id 15.20.8857.019; Thu, 26 Jun 2025
 13:40:39 +0000
Message-ID: <52df6fee-ef9b-4f47-8768-e99a37f991c5@amd.com>
Date: Thu, 26 Jun 2025 19:10:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] drm: add debugfs support on per client-id basis
To: Tvrtko Ursulin <tursulin@ursulin.net>, Sunil Khatri
 <sunil.khatri@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org, simona@ffwll.ch, tzimmermann@suse.de,
 phasta@kernel.org, dakr@kernel.org
References: <20250624113454.2322935-1-sunil.khatri@amd.com>
 <20250624113454.2322935-3-sunil.khatri@amd.com>
 <2a24fbf3-2ebe-498d-83f0-5edb45c9dab4@ursulin.net>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <2a24fbf3-2ebe-498d-83f0-5edb45c9dab4@ursulin.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0131.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::9) To LV2PR12MB5776.namprd12.prod.outlook.com
 (2603:10b6:408:178::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|SN7PR12MB6790:EE_
X-MS-Office365-Filtering-Correlation-Id: 28574d18-ced8-4832-1040-08ddb4b709ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3IrTysrNkJ4NTVxZ2NqeXgrMS9wZkd1UmhTZkVUNGtoSUdnd0RVbnNQdVpT?=
 =?utf-8?B?RWlLZXJkUTJaN1VRNG03Z1drcGc4S3EwTGk4eC9QdHFqaURBUXpmZUIyNDR3?=
 =?utf-8?B?ekl1cXBQelpKMFZkbmZESmM2czVUT2sxWFlaSWt6dktIZDB3cHlENk51QUVn?=
 =?utf-8?B?UGRMbmhQUnQ1aXRJM1JzWDZ6ZDJiVURqQ1VEMW42MThkRUxTRnFTTXBTVEU3?=
 =?utf-8?B?UFpEM0I3b25ib3d1c2U3L2pRMGRqVGJXKzlyemNvMDd2NHBpcGxoQWRBaFFo?=
 =?utf-8?B?MElacDZQSWIyWEx6YXpLclo4Y2hjTlRrblgrcmFTUFNmMHI3cGRxN1VlYzJY?=
 =?utf-8?B?KzRTd0RwYzEvdUZpN2ZkejVmOFpobTZxVVplZ3dzK25ZU2lKT05mLzlhNStE?=
 =?utf-8?B?UEh3bkVKQ0d6TXRzT1VCU0N6WWlMWndPdGNDK3Q0Q0xhaG9ucWtWWW1zbytK?=
 =?utf-8?B?TXFoTTdTeVVKTnRENERQaVRraW9DVVBVZERabHU2SnJTRmhNb1VtTjM3bEY1?=
 =?utf-8?B?dmp1MGNBOEJnZ1VTZkduLzgvY2d0WnExejhxaTU0djBLL2NNdXpWUmdqWVQz?=
 =?utf-8?B?NURna084OWExWU5kcGxrTnNnTC9VRDlHZ09yYjNlUUgwZ3pVeUthSE9MMUVr?=
 =?utf-8?B?Uk5XKzJIREptamJieGpGMWl1anMxd0pWaXZUSWtickNlUHpDSW5WR2xRcnVJ?=
 =?utf-8?B?MGNaT0FlU1pYTGUrMUlTWjNYVzZ6YThDZDZGRHh6UFdqL3Y5SUVOdzVNejdL?=
 =?utf-8?B?cDJNUTNqM0ZtcDdDQWlXTmNqSlNBZXJDOG1BRzFZbVFWMTkvUUg3cDZYMmpH?=
 =?utf-8?B?VGR4WU9IZ0ozREVYdk1ZMWY0d0ZRNVpMNjVGRWNBMi9jUjBzNUQ5MkZ2WVdy?=
 =?utf-8?B?c0pEZDZJMy9LNjhGNDJ6YUx5TW1GVitveEJXakFCVmk0ei9YdFgvcXJGS29x?=
 =?utf-8?B?cXFBME5vSGhIeW82NkFVUEdtVFhCajdUY0RzSU9wSU1XeXpTZkJIcjRWcmtJ?=
 =?utf-8?B?L3NiTkxTNzY2UWUrZTNWMy9iSjNOeGdVWVpmNldEY1N2ajRyQWFVT3lMVEoz?=
 =?utf-8?B?YUlNTkpZcSt6TGkvejdiRGxMa3ZhZmYwb1k1TzhvYnErUkN2QWFjVXZyL011?=
 =?utf-8?B?YzBNZThBaWdkSUV6azBDSzhDby8yYUdWN0RGOXVvcVJLRGhLd1NPaDRGZmJF?=
 =?utf-8?B?cmN6N3pHQjhpVFdnaW1lenVRRjR4V3d2RGw1dmU4QTgxaDAydmhTMVhkVnV2?=
 =?utf-8?B?TEJQbVBFOUg0dWZHeFZvSkVGTGl3a0hGeU4rVTk3NXJ4eWxLSm5KZFdkOFZD?=
 =?utf-8?B?M2JlQTJkRmM4czdZUkNzWEdiU1VrWXJ5SGE2V09zdnQ1ZHVVUTljMTNyN3B3?=
 =?utf-8?B?Z1FjUm5WQnJ4YWtmeFhQeVREUWYya2FJOXp5T29VMFBYbTNJZlAwMmc0MEs5?=
 =?utf-8?B?dlJiMTV0QVN5Ky9lcHgycUlCMEJ5MG5HVG9oVGdhS2dWWGM0L1U2ZFYxUUtL?=
 =?utf-8?B?ZHZWK0NMS0MvRkRnT3oxdktCWVJoMWZoRENCbkxwYkhUZlVQd3QyN1RJRXFz?=
 =?utf-8?B?eDJINkNNZE1JNEFpb0s3dnZjeitZeDdHUStjZXl4NG1lN1gxaFFsY3RyQklS?=
 =?utf-8?B?WHpPNlI2WUhkWnNLUHdOcGUramE5RU52N0lYY0xURUk0a3p5NE8wRFFmS2Y4?=
 =?utf-8?B?QU9CemVHVTBtbDAvMHdKOVVRY2Y4cU1Ib3ZnQ2pBUUFhczBSdHRITW1UWExk?=
 =?utf-8?B?cGp5S2U0ejVTMjZlRW81OFRDcXkwT0IvYVUwSjJaTy9rdkdiWWNJazRkN2FT?=
 =?utf-8?B?ODBTZjdLeWNHbHkzNEhCL3NJUzZmazNpR0RPRmR2OStmSFIySm9RSHF5VEdt?=
 =?utf-8?B?NGZlQUFHNEk3blY4Q3F6aGE1a09SbVhGbWhaRVQ3dnFnaVpSYmFKRVRzTlhI?=
 =?utf-8?Q?KnlWeWuGdXA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXF2MXhqNVJUTCtqVGZQWVlDR3ViajUxS1B2NkdmbFpETXNZM2U4YTZodzZX?=
 =?utf-8?B?VVowaHRDS0xTYUxBOWNYcE5QZmcvcEdoRTEwZm5RV1NTUGZNaTZuQVdWRnBL?=
 =?utf-8?B?U2tOcmwyUjlLelhGWldoa2Rza0VFV245Rkh0eVJGNEpDSndpcEYzNDNlVkxk?=
 =?utf-8?B?REI1Nmx0aVNCbXhFNk9pRmUwREtrM1VJRzJNZU1JdTFKVU41U1RoK1hQWjNp?=
 =?utf-8?B?emZaczk4MGtncXZkRkNsdWp6b2pjVEI2OTYxODhTVmh5NjhoL0tFbisrc3Y3?=
 =?utf-8?B?cEFmQllZMndLQjI3dFhFMzVvNUNKNVZINk9odnUwRFhSS2RrZVV0WEQrL3o2?=
 =?utf-8?B?MnNVZXZiRHJTdUpySHpyeVA2WUVyR2JnN3BQek14VDkwYmpOdXlnRS9TRWY0?=
 =?utf-8?B?Qjh1dlVUREQ3QkNHemJwbTBRL2JOU0t6MEx3TDNza053QUMrc0lIQzNrd3hF?=
 =?utf-8?B?Tk1oK2h3dFRHREVVRHRpNTVoVkRDUmJjYmJrOHN3Wm42dXZvM01pTlNxS1FI?=
 =?utf-8?B?TVVON25RSk5KdHVrdi9ESUJuOVNiZTdLUXRTRTV1RVA1WENKNXEwdTFSdUVR?=
 =?utf-8?B?aFdrVnBTaHFXbTBCanZ0RllzWG5KeGxabFY4VnRRdkoyN2lwWG52TXFtUUw2?=
 =?utf-8?B?dE5ZbUY5cnhIZ3pmcG9MaHlORHZTb2diN2E5dEs4N0wvWnNSbXczQzIwOWVE?=
 =?utf-8?B?S3BxSnB2UC9DdXMyV2JadHQ5M1hwOFpsSXF5MU0wS21Ia2Jvem1KYytpSURD?=
 =?utf-8?B?S2hobS9odmVEVUhBUmhZK2xKQlg1RUlOaERuem5nZXJSYTBIOTFqcFRYY01n?=
 =?utf-8?B?KzVMS3ZCcFdyQ1NPMGhxcUtCem8xcG5FU0hwRHozUzhGUjNZd2VqY1VBd2RK?=
 =?utf-8?B?cEpya1FQMEpKTmg5WjJYMm9sMVhzWnQvQXBUMld3aFFQUjM5WHNTOWVUYTA5?=
 =?utf-8?B?Z2xVWXJtM2ZmRGxBTDI0cE50TmNTaC93d3pmSmFBaXREZUljRkFZZ1VnU09m?=
 =?utf-8?B?NWV5djFWR1JlYkxUZ25ZSW5BdFdTb21YRmova1JKdld6U0xFc3ZtRlh1RWZw?=
 =?utf-8?B?dU0rbUJ4bTRHLzh6eHcyczVBeVNJN0NIS0Y2c1YxUmZBUGM4SWZpUWR4eG5w?=
 =?utf-8?B?OW1aVUdBRUY4ZnpoQkRsZHlXOTViRFVmclhoSHg2QjY1U2Q4Q0JYMkhLNDJO?=
 =?utf-8?B?cVJQSzJCbVEvSG1yVXh6U2F4SUdob2I5UzVpVWlYRTlMRXMzcHNXaXB3N3FN?=
 =?utf-8?B?dGNFUlUzSDgzMTZ6a25mWGFGYUVHSzdENjZ5S2QxSE1kL1hYeDZHSGR4SEE1?=
 =?utf-8?B?MWFwdXVtVFpKclk3Q3kxK3pmc0ppYmY5SUV1NGorSmZmYTg1UWlGTHhJTUIr?=
 =?utf-8?B?U1NtQUFodXNZZGFTbW5mZ1A3OWF0VyswVWtrMjR1Q09pcnVyS1ZvTHJSekRS?=
 =?utf-8?B?cm4rNWdiOVVmaUJkR1E4RFdWRkpIR3dpaCsvRjVMNFJzSERoN2dJb1E0Z3M5?=
 =?utf-8?B?RVVUK2l1OGxCN2FkL1QxeStkcGlpS3dPMFJreHdQUzVlaWZEVm9NM1psai9U?=
 =?utf-8?B?R2t6a0laTEtxcm1SUVJONU1hWFpIeHNZZy9IRkYwZmtuWnYvaEh1WHBTZ3Q4?=
 =?utf-8?B?Rm9pbTdZdkQ4NnFmeCtCdGovZUErYkV6V0U2S2dvWC9qcWJDck5yRjgydWFR?=
 =?utf-8?B?WTRtRnhSQUhwUU1mb1BiNnR1b3hOZk1iYmR6dE1rbkZpS3VINVQzZktJZHRR?=
 =?utf-8?B?WUFkbG1lY0ltZWpXTWQ3WEV2WEhNUUlsdkcwVElwbnl5ZzhQRUsyMGtJMDBQ?=
 =?utf-8?B?RjFWSDBRUFg3ay9Jckx2bHJLL0NZWXhjdldidDgwd3lWaGRRYzlFUkZXU2xv?=
 =?utf-8?B?TzBPcFRQUVBPaU1EK1p0cXNwSldGY1VNVDI2TE82c04zVE1QcHh2N3ZGUVhj?=
 =?utf-8?B?N3NFdzNkM1hkYktmaDNDWjRVTHRiUG1VcTRHK25EWGtCYkZ4STV6VmZLQzBS?=
 =?utf-8?B?ZXUxRDRTcFp0MndrQmhOTzJaK252UVRHbVVMalRGK1dROGdiek95cC9jR1Nh?=
 =?utf-8?B?QXhaL1U2NUV5cmVDczdCWE5GUU0rYnpkSGEwaWRQTDVXd2JOa3FQdlFzSmli?=
 =?utf-8?Q?V0h6wHOz6eKdxD1BfetEVDPvm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28574d18-ced8-4832-1040-08ddb4b709ad
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5776.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 13:40:39.2255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pHj0rRaUEXGNtbhAn1Wvb8H1PE51uI+ZINz652YlVolcZm395a1OWcJrJCMgbs64nYJ2EFFSUQOV06j2t+IHFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6790
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


On 6/26/2025 7:07 PM, Tvrtko Ursulin wrote:
>
> On 24/06/2025 12:34, Sunil Khatri wrote:
>> add support to add a directory for each client-id
>> with root at the dri level. Since the clients are
>> unique and not just related to one single drm device,
>> so it makes more sense to add all the client based
>> nodes with root as dri.
>>
>> Also create a symlink back to the parent drm device
>> from each client.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/drm_debugfs.c | 26 ++++++++++++++++++++++++++
>>   drivers/gpu/drm/drm_file.c    |  6 ++++++
>>   include/drm/drm_debugfs.h     | 11 +++++++++++
>>   include/drm/drm_file.h        |  7 +++++++
>>   4 files changed, 50 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_debugfs.c 
>> b/drivers/gpu/drm/drm_debugfs.c
>> index a227903c29c4..ebdf60665b86 100644
>> --- a/drivers/gpu/drm/drm_debugfs.c
>> +++ b/drivers/gpu/drm/drm_debugfs.c
>> @@ -309,6 +309,32 @@ void drm_debugfs_remove_accel_root(void)
>>       debugfs_remove(accel_debugfs_root);
>>   }
>>   +void drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +    char *client;
>> +
>> +    client = kasprintf(GFP_KERNEL, "client-%llu", file->client_id);
>> +    if (!client)
>> +        return;
>> +
>> +    /* Create a debugfs directory for the client in root on drm 
>> debugfs */
>> +    file->debugfs_client = debugfs_create_dir(client, 
>> drm_debugfs_root);
>> +    kfree(client);
>> +
>> +    client = kasprintf(GFP_KERNEL, "../%s", file->minor->dev->unique);
>> +    if (!client)
>> +        return;
>> +
>> +    /* Create a link from client_id to the drm device this client id 
>> belongs to */
>> +    debugfs_create_symlink("device", file->debugfs_client, client);
>> +    kfree(client);
>> +}
>> +
>> +void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +    debugfs_remove_recursive(file->debugfs_client);
>> +    file->debugfs_client = NULL;
>> +}
>>     /**
>>    * drm_debugfs_dev_init - create debugfs directory for the device
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index 06ba6dcbf5ae..17b803ab119e 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -45,6 +45,7 @@
>>   #include <drm/drm_file.h>
>>   #include <drm/drm_gem.h>
>>   #include <drm/drm_print.h>
>> +#include <drm/drm_debugfs.h>
>>     #include "drm_crtc_internal.h"
>>   #include "drm_internal.h"
>> @@ -167,6 +168,8 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>> *minor)
>>         drm_prime_init_file_private(&file->prime);
>>   +    drm_debugfs_clients_add(file);
>> +
>>       if (dev->driver->open) {
>>           ret = dev->driver->open(dev, file);
>>           if (ret < 0)
>> @@ -181,6 +184,8 @@ struct drm_file *drm_file_alloc(struct drm_minor 
>> *minor)
>>           drm_syncobj_release(file);
>>       if (drm_core_check_feature(dev, DRIVER_GEM))
>>           drm_gem_release(dev, file);
>> +
>> +    drm_debugfs_clients_remove(file);
>>       put_pid(rcu_access_pointer(file->pid));
>>       kfree(file);
>>   @@ -236,6 +241,7 @@ void drm_file_free(struct drm_file *file)
>>                atomic_read(&dev->open_count));
>>         drm_events_release(file);
>> +    drm_debugfs_clients_remove(file);
>>         if (drm_core_check_feature(dev, DRIVER_MODESET)) {
>>           drm_fb_release(file);
>> diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
>> index cf06cee4343f..2b3767ad8f5d 100644
>> --- a/include/drm/drm_debugfs.h
>> +++ b/include/drm/drm_debugfs.h
>> @@ -153,6 +153,9 @@ void drm_debugfs_add_files(struct drm_device *dev,
>>     int drm_debugfs_gpuva_info(struct seq_file *m,
>>                  struct drm_gpuvm *gpuvm);
>> +
>> +void drm_debugfs_clients_add(struct drm_file *file);
>> +void drm_debugfs_clients_remove(struct drm_file *file);
>>   #else
>>   static inline void drm_debugfs_create_files(const struct 
>> drm_info_list *files,
>>                           int count, struct dentry *root,
>> @@ -181,6 +184,14 @@ static inline int drm_debugfs_gpuva_info(struct 
>> seq_file *m,
>>   {
>>       return 0;
>>   }
>> +
>> +static void drm_debugfs_clients_add(struct drm_file *file)
>> +{
>> +}
>> +
>> +static void drm_debugfs_clients_remove(struct drm_file *file)
>> +{
>> +}
>
> You forgot static inline for these two.

Thanks for catching that up. Will update.

Regards
Sunil

>
> Regards,
>
> Tvrtko
>
>>   #endif
>>     #endif /* _DRM_DEBUGFS_H_ */
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 5c3b2aa3e69d..eab7546aad79 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -400,6 +400,13 @@ struct drm_file {
>>        * @client_name_lock: Protects @client_name.
>>        */
>>       struct mutex client_name_lock;
>> +
>> +    /**
>> +     * @debugfs_client:
>> +     *
>> +     * debugfs directory for each client under a drm node.
>> +     */
>> +    struct dentry *debugfs_client;
>>   };
>>     /**
>
