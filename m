Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9B93FD18
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 20:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 350FA10E37C;
	Mon, 29 Jul 2024 18:04:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wyZDDfpe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140E910E37C;
 Mon, 29 Jul 2024 18:04:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e2befWEJ5ko/CffAsyWtiXadxi4/RzzBaI6c8u2OS2ZID+pzuMuJFne2TztqVCT4jj4w6Lth5jlp1KlFAhyEv9GBxxD2/GSNfzP4MDB/dGCjaBj6BF+wc6o3XmnIdFOdxE6Pi3/qBVw5QRsZBBbP5/Z9/DCXtW7rQz6UBqslmWZuSHqpAX8kcY7r24F9GyC16uAmls9C/Z4Rnm1G4qV1c5hNg/Pk0I/FUCIJ6DWVwjRieZENHjdAImDXhsl8TfizBdg42xma6tj3EZL++TJauYAXAwawThUUpPcx/HuECvOz4LtzPQirxCujQIGZXAp6Ff+YIZX4Dff0yAAhYMB1Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yZs0uz1CPe2pC38ogMqk5+T3ffdPffC7kOmk8uySleY=;
 b=LXIr6oYfRKZqJ/bt0E4lCS6nyw+AEpNsnSyyydRmUcsJzNSZNOYZsAtmnLV1zLeCIvsVTuLDHwBqu/50h5NwQcAkQHhEl38cZ+vvtfLo5Y6q4rYlY//QBDFjBZSYqdrqWPZN3e1YlUWcqsrTa0dPMj2IfL+lG90NI3jn6yEv43jJIzvA+3eWz4HK/RXArXX8G3LkM63TjPGGeNUfi54JSNY2FJ5NvDzJvPgx0oFbfG2Mxn2b1prmWnlTZc47nSHDjjh6T3chYKDlu0vQS4Rl108KvfFc3wwBAYbOdfi00PkxQNdWHQhWwmieoNuaXL9fI81LJMjrTTXc1uaPAEEdww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yZs0uz1CPe2pC38ogMqk5+T3ffdPffC7kOmk8uySleY=;
 b=wyZDDfpeUsw4vQflqgsLxcncykI6jjjTOl4UuOpfjUoNCRhvHfsAjb4/Qoldomf82kXoeFK7VbYi8NyDiY3F04RN/AhpyZ1w6ezrHBD3htB2HuAr1qR5eK+J25p9Eo0YbMj1hT8i62Em555X1KN/NB1xuzudkzGv+zh4pvmM+9o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 18:04:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 18:04:33 +0000
Message-ID: <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
Date: Mon, 29 Jul 2024 20:04:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Glisse <jglisse@redhat.com>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
 <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
 <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: caf53b9a-0eae-43b6-920b-08dcaff8e65c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THNIaVc2NWVYV25yYUZSNStOcm5vMXo1elFWdDYzTyttcWdhTGdrbGpudm1Q?=
 =?utf-8?B?QVBYeFZLbmd5RFh0OStDZVpDaHJMVDUvTjVJQ3BLc1JBMmo0T1FnN2pjcURU?=
 =?utf-8?B?STF4VGpwVFpxK1dYbzBkYnBkcTJkb3lFOWZiLzdrRmpJdWFocDloei9TbGd0?=
 =?utf-8?B?QTJZaUM5OUVPb25ockJrOVBtdmlERExhNnVITi9yM1F4K1pSaE5Wc3dRYzN3?=
 =?utf-8?B?bUFMVHNhN3NHdHEyS09ZWUR2eXkwLzc3M2RmeURHRzNIbTFRYmNuRHk4WnQx?=
 =?utf-8?B?ODlmeHdoUThVU1JjNjFNWkNrY0REekM3aEFXaG1LeGZrbW5KZnZyQkJiRlZ6?=
 =?utf-8?B?UmszQUVSU215TFc5cFIwNGNMSUVhYk4zSjJaQWZzLzVwQUpGNDkwczBtUk1n?=
 =?utf-8?B?YUdWQzk4OGNWbEwzQUtaK0tvUnhNYit5b3g1MC9nc1lGTXJVRDBQSXFpTVg3?=
 =?utf-8?B?TUhmc01LY0VkS05pMVZJT1l3RjZSK3N5a25qc2h6enFLdXlRMEd0ZHRHb2Uw?=
 =?utf-8?B?VXMxa2FNZGFaYXFETnpQR1hURStSTHZXbzRQbzQwWDJYSzl0REh0di9COGFq?=
 =?utf-8?B?UE0xc3NzVnplTldHbHU3cDZvMTloWDRwNEo0VlpuTk1KdGdGdXN0V0E2T2xi?=
 =?utf-8?B?d01MQVF3NUhScHVEbHJQVS9idU9ZTFV4VVQvbjN4YWlJeWdLQjk2djVRM096?=
 =?utf-8?B?a2RpMXIwSWZiWkJTcm1QWG9sak85a2p3WjZvZ0Q2a3JpRSt3ZUZ2TWVNTEli?=
 =?utf-8?B?dEpRa3JzekZhNEFuRm9CUHRtNEdwdUxETytOenAyaC80SnovcThjN2JGRnRL?=
 =?utf-8?B?aGdqSnY3WWkyS1ZmTWRiSlhnTUppbXRHYlNmalcrZXljRnhqU2VTVG9CWjh1?=
 =?utf-8?B?M0o4Wm1XSEZzRmVXbExHa2tqTU5oVDdJZHJkVU9FNzhUNW9rSUw1eUZqNVo0?=
 =?utf-8?B?VDQ5RzBtVXNkSjF6cVdjTzg4dHU2M3FCT2kvOW5nU2JYREQxVGROdytlUXdG?=
 =?utf-8?B?VGlQc1hyU1VQMzhVYWlJeHlhdjBlMHROeDVDQjJKRHNsWW1FSlJGTVJETndV?=
 =?utf-8?B?WlFCRGdUaHdRNEpwbzNaYnVyR2xUR3A3UUp2V3NqaFBsZmJ4cHFGcFM5dkdC?=
 =?utf-8?B?TzQxS2NDeVhwL3dpSFhQOGNYK1FIbDUzK1JZdW9OQmJRSERmZG5ISGRTOEUr?=
 =?utf-8?B?VklnYWVBOWRNMW91QThNY0UyVGZsRWpQdzd0R3FGN1BIVGxTUkd3b1J3R3NL?=
 =?utf-8?B?NDAyV1pkT0dkUU12OGFTcUlTSFREOVp1VU9pSFd6MFNvdGRhOVluWGNaUFNK?=
 =?utf-8?B?WnhVSVNCb1ZCZmJic0xtYjBJR1RHUWJHelhIYTROTGpQMTBBU1NvdGNCMnZL?=
 =?utf-8?B?NlROTUZSbUJBQmxhNHlIbWtqc3BzeTJyVVpIRkF3SEVrRVI2VHBxT3JMV0Jr?=
 =?utf-8?B?NUk0d3dVdUtpcmdJRTBFS2tXYmwxSUNnN0hvRUM1WENmVTd2OExmTDZJNGFO?=
 =?utf-8?B?MzlONGpVVXl1cXRaZXFjWTVtcVprR2tPeDNvWjJzT3Q4eFkvdmtZQml6dGYr?=
 =?utf-8?B?b2kzNFdFZjBLNG1tQkVjdG9JNTcwK1Z1aUtsSmsvMlQ2bmUrSEMxSTE3TmVl?=
 =?utf-8?B?TlY3KzhjRU1qOUx4T1RhWm53NWlVL1NkazNpVzVhTUR4WllVUHFnMmdsRTRO?=
 =?utf-8?B?ZWFhTTJrWXhLUFRHbCs1eUhwZEowQUdVSEptbWNpQ1I2NDl1ZkI4Y29DeHpY?=
 =?utf-8?B?dy9yM0xNdkFIYTJ2eTJmSmZrTlZsSTMrZ08xa1JPMXBxZzAvZmIvVjZXQTBN?=
 =?utf-8?B?ZC9sNWZUQVJHSnN6ZGVtUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHJzU3M5VzhUNnEvVS9jd3orRVFOS2dJeVUvdDRxZncrbnVhTVRDNkQ0RTZx?=
 =?utf-8?B?akJHTDFTaFh1QjZ3SWtiUEFEa3dpYjBRWlNhY2Z4Rys5T3EzNnJaQXArNTl0?=
 =?utf-8?B?UEtVWFBVckQ1WnJIKzJkZitHYnhuWXdCdU9CNEZVSVAvamxDS2dUa25lZmNO?=
 =?utf-8?B?SXZwZ2hZRU4vYkErMTFFR2thMXdnelIwYTZuNkVYZFhTOVIxSUNBVEV5V3Bx?=
 =?utf-8?B?Wnp2OENOV2oydlNoaUloa3Uzd2ZuQkh0RXdLbno4eVJ6TWNLMCs2Ukc3cE9k?=
 =?utf-8?B?K2cxbUJSRWdDdXhCb1ZxbUxNV29VMUtISDFkSTd4TVNOVHdlM3FCcEp5M3Iw?=
 =?utf-8?B?VVBDdHRoZVpJT0VucGRTLytMVEhiMFVRMG1VdnUzNDBRcjVJRmpWY09ZeHVX?=
 =?utf-8?B?RzRUcU12dDk3MVdzeHJJNTY3aFBkbUU3Smd0bUlVWDQrTVdQSmN0UmJ0Ym5K?=
 =?utf-8?B?VEdZUTJwbXJiRVNDM0VmSy9HRkUrMzNUT2JUSWx3TkE4QVRXY1V6eVBKMUxs?=
 =?utf-8?B?RW5PMUNQNmFvNUVBTm83NVdpaEhuRXhVVmRjZVBURmpjTXhNY2dDTHNzQlVP?=
 =?utf-8?B?NndseWVCNVowcmNQb2JvWHUwTjhzWlhLa1Y2SGZkb0J2NXpGZU8zRFFzNVdo?=
 =?utf-8?B?S0MyNTlYQnNqdFpsbkJPQ3JhR0p5VFRKdEUzVWtjQWFJT1lWY2FCN2hDdnh1?=
 =?utf-8?B?RzlrWUxrVmZ0WERiQ0JRc2VpYjRmR1p3VzIyTEgxbDFDd0JVOGhodlFjS1VF?=
 =?utf-8?B?Z2xHRStCeG93VWdpcmFBaEVuVWZsczZ1UzZjK0hDRko3WTE1RU9vNzhJK0c0?=
 =?utf-8?B?U0cyMC8rVkVPSnhkSHh2WWxSVDBCZUcwWUFhWFVLeWZLTy92UkY5Z0E1ajhL?=
 =?utf-8?B?QlF2bExyUm9kVkwwUkFKdWw3cTNYdlV2UEc4Vi9TdFBibnZ0MTZwNzVwN0Mv?=
 =?utf-8?B?akJ4bGhIRDBkTGxJS3Z4VE9LNVZRaE9tbEJydGl3T0xJckdxenVOcHlYcGVH?=
 =?utf-8?B?b3pob3pQV3F0SGh4a1dWWDBVYVlSZlVWdzdnMWhhS2ZTLzhBMGV4ZytMV1V5?=
 =?utf-8?B?ZExXVGo4cVVGTmNHcElFQ0RGQ2k4bVBZUEVJUEowRmswaUpTdEZCL0QvRUpI?=
 =?utf-8?B?d0JXRk1CVThWWUliVjRPMlZCL3B1cTJPb1l2OGE2SHlFWWNjUHJlL3pYUnFD?=
 =?utf-8?B?N05hUHdtOEFNV29wZ25LNVNSSjM5M2ZiN29BOEl4TGJGbUl4WC8zY1V3cklL?=
 =?utf-8?B?Z2pOMk5Uc3E0Rms4eDNxbC9JNC9hM3h0bWQ1SlZ3VEl0bmUrdldhSEJaN2Za?=
 =?utf-8?B?Y24zbVRxdlJKcWZrLzZ6RHJock5oUW4wcGtjdXRGTUhIQ3VWbnBCdmoyRm5y?=
 =?utf-8?B?YmxsQjV3Y0JFeEJjWExKR0U2aWlYSEQwQWNkUExHRGNXei9EU2d5b1NVaU56?=
 =?utf-8?B?TGZueUdCbjJ0WU5RZjhHeHFqUEdVZmZOSkpSR2x0VmlIQzZSNE5YTDc4VHkr?=
 =?utf-8?B?Q0Z4dWd3dC9JM25odEc0bU5vdlpuaWh3OTlnVWpEekJZSkJFc0dUYTJ2RnhJ?=
 =?utf-8?B?N1o2dzIwWUF5akFpYUJjOTlVZ3FqeHNya3g0SW9NQndIZEpCVWQ1WWVhUU0y?=
 =?utf-8?B?SGlkZWQxd0o3TGpOU0xrbUtEV2djenJnb1BtU1orWXNWWkVUd2lXOWRTbWtQ?=
 =?utf-8?B?WkxwaXRGNS9UYndSSVpKa25WNzNYdUhEditFSUxaTHFsLzcrYjdhNmVFbjlP?=
 =?utf-8?B?VnR2MnhKUWdueGpXTUwrVjhQTEZrZWVvdkJXaytsQWRjY0t3TGdhb2J2NDlR?=
 =?utf-8?B?VnVlTnA0Rmp0Nm5qK3ZRZnMyeDluRnFWUVVOUWJQb21SWVJIK3A4MjNDL01L?=
 =?utf-8?B?T0tWYnpscHB0cng0cEJ0RFUrcWN3YTBjRXZjOGNvdy9vaTBOUE1TdDVXc0tr?=
 =?utf-8?B?ZTVPbXJJalBJRWdUOGNDdmRvQ0J4d3NZRnoxczUyV2FOR2x1bnJyT1hDN0pM?=
 =?utf-8?B?MmtJdTYxUnh4RFZzWFhwNVdQSlVPM3ZDYld2QTA2RS9uR0dZWjdjeVNPa0w3?=
 =?utf-8?B?WFkxckNQcnlCbGFEMGNjMmpCOVRtVy9OVTdIQnFvc3pqTE1oNExTNW1nS1Jw?=
 =?utf-8?Q?UPsc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: caf53b9a-0eae-43b6-920b-08dcaff8e65c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 18:04:33.4464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmzKWCaZP61q9xcD6140vjLgXHkAUYdompi5fmH4VMytZZmGVaWHhLUyFGGalmmG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

Am 29.07.24 um 19:26 schrieb Nikita Zhandarovich:
> Hi,
>
> On 7/29/24 02:23, Christian König wrote:
>> Am 26.07.24 um 14:52 schrieb Alex Deucher:
>>> On Fri, Jul 26, 2024 at 3:05 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
>>>>> Several cs track offsets (such as 'track->db_s_read_offset')
>>>>> either are initialized with or plainly take big enough values that,
>>>>> once shifted 8 bits left, may be hit with integer overflow if the
>>>>> resulting values end up going over u32 limit.
>>>>>
>>>>> Some debug prints take this into account (see according dev_warn() in
>>>>> evergreen_cs_track_validate_stencil()), even if the actual
>>>>> calculated value assigned to local 'offset' variable is missing
>>>>> similar proper expansion.
>>>>>
>>>>> Mitigate the problem by casting the type of right operands to the
>>>>> wider type of corresponding left ones in all such cases.
>>>>>
>>>>> Found by Linux Verification Center (linuxtesting.org) with static
>>>>> analysis tool SVACE.
>>>>>
>>>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni
>>>>> tiling informations v11")
>>>>> Cc: stable@vger.kernel.org
>>>> Well first of all the long cast doesn't makes the value 64bit, it
>>>> depends on the architecture.
>>>>
>>>> Then IIRC the underlying hw can only handle a 32bit address space so
>>>> having the offset as long is incorrect to begin with.
>>> Evergreen chips support a 36 bit internal address space and NI and
>>> newer support a 40 bit one, so this is applicable.
>> In that case I strongly suggest that we replace the unsigned long with
>> u64 or otherwise we get different behavior on 32 and 64bit machines.
>>
>> Regards,
>> Christian.
>>
> To be clear, I'll prepare v2 patch that changes 'offset' to u64 as well
> as the cast of 'track->db_z_read_offset' (and the likes) to u64 too.
>
> On the other note, should I also include casting to wider type of the
> expression surf.layer_size * mslice (example down below) in
> evergreen_cs_track_validate_cb() and other similar functions? I can't
> properly gauge if the result will definitively fit into u32, maybe it
> makes sense to expand it as well?

The integer overflows caused by shifts are irrelevant and doesn't need 
any fixing in the first place.

The point is rather that we need to avoid multiplication overflows and 
the security problems which come with those.

>
> 441         }
> 442
> 443         offset += surf.layer_size * mslice;

In other words that here needs to be validated correctly.

Regards,
Christian.

> 444         if (offset > radeon_bo_size(track->cb_color_bo[id])) {
> 445                 /* old ddx are broken they allocate bo with w*h*bpp
>
> Regards,
> Nikita
>>> Alex
>>>
>>>> And finally that is absolutely not material for stable.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>>>> ---
>>>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>>>>> actually ends up taking values high enough to cause an overflow,
>>>>> nonetheless I thought it prudent to cast it to ulong as well.
>>>>>
>>>>>     drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>>>>     1 file changed, 9 insertions(+), 9 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>> b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>> index 1fe6e0d883c7..d734d221e2da 100644
>>>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>> radeon_cs_parser *p, unsigned i
>>>>>                 return r;
>>>>>         }
>>>>>
>>>>> -     offset = track->cb_color_bo_offset[id] << 8;
>>>>> +     offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>                 dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not
>>>>> aligned with %ld\n",
>>>>>                          __func__, __LINE__, id, offset,
>>>>> surf.base_align);
>>>>> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>> radeon_cs_parser *p, unsigned i
>>>>>                                 min = surf.nby - 8;
>>>>>                         }
>>>>>                         bsize = radeon_bo_size(track->cb_color_bo[id]);
>>>>> -                     tmp = track->cb_color_bo_offset[id] << 8;
>>>>> +                     tmp = (unsigned
>>>>> long)track->cb_color_bo_offset[id] << 8;
>>>>>                         for (nby = surf.nby; nby > min; nby--) {
>>>>>                                 size = nby * surf.nbx * surf.bpe *
>>>>> surf.nsamples;
>>>>>                                 if ((tmp + size * mslice) <= bsize) {
>>>>> @@ -476,10 +476,10 @@ static int
>>>>> evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>>>>>                         }
>>>>>                 }
>>>>>                 dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer
>>>>> size %d, "
>>>>> -                      "offset %d, max layer %d, bo size %ld, slice
>>>>> %d)\n",
>>>>> +                      "offset %ld, max layer %d, bo size %ld, slice
>>>>> %d)\n",
>>>>>                          __func__, __LINE__, id, surf.layer_size,
>>>>> -                     track->cb_color_bo_offset[id] << 8, mslice,
>>>>> -                     radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>> +                     (unsigned long)track->cb_color_bo_offset[id]
>>>>> << 8,
>>>>> +                     mslice,
>>>>> radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>                 dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d
>>>>> %d %d %d %d %d %d)\n",
>>>>>                          __func__, __LINE__, surf.nbx, surf.nby,
>>>>>                         surf.mode, surf.bpe, surf.nsamples,
>>>>> @@ -608,7 +608,7 @@ static int
>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>                 return r;
>>>>>         }
>>>>>
>>>>> -     offset = track->db_s_read_offset << 8;
>>>>> +     offset = (unsigned long)track->db_s_read_offset << 8;
>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>> aligned with %ld\n",
>>>>>                          __func__, __LINE__, offset, surf.base_align);
>>>>> @@ -627,7 +627,7 @@ static int
>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>                 return -EINVAL;
>>>>>         }
>>>>>
>>>>> -     offset = track->db_s_write_offset << 8;
>>>>> +     offset = (unsigned long)track->db_s_write_offset << 8;
>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld not
>>>>> aligned with %ld\n",
>>>>>                          __func__, __LINE__, offset, surf.base_align);
>>>>> @@ -706,7 +706,7 @@ static int
>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>                 return r;
>>>>>         }
>>>>>
>>>>> -     offset = track->db_z_read_offset << 8;
>>>>> +     offset = (unsigned long)track->db_z_read_offset << 8;
>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>> aligned with %ld\n",
>>>>>                          __func__, __LINE__, offset, surf.base_align);
>>>>> @@ -722,7 +722,7 @@ static int
>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>                 return -EINVAL;
>>>>>         }
>>>>>
>>>>> -     offset = track->db_z_write_offset << 8;
>>>>> +     offset = (unsigned long)track->db_z_write_offset << 8;
>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld not
>>>>> aligned with %ld\n",
>>>>>                          __func__, __LINE__, offset, surf.base_align);

