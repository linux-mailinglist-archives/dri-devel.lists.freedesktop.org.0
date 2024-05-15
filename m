Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05AEA8C68BA
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 16:31:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1A910E4D9;
	Wed, 15 May 2024 14:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ecud+nr/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2071.outbound.protection.outlook.com [40.107.100.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4310E4D9;
 Wed, 15 May 2024 14:31:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5H97+OJVB1g1HSuU2YeXebrpLf4svwveUcyMgUl+1QdCV7TdD0CdHnwGC0vjo2wrkRd5SdK/osXvC8HvDLS2Y6C1wE4clyz9QW8muT+Qq537tKoEFnwfzrUjMXWXEYmkFRGNw0ihypguQbyRNi8zUcpmUucNxdsu1hILEIOvRYh9mkEQKYnq/p3lraQ34sqAa770UpookJWdZwGT6yU6WxY15kQ/PSfgqlJ8XOp3A0/bDu8Pm4/mZRwn9L3UJ4qJpFI8Wzy9/sj+gG2X6fFekyMb0qo/HBAZ5vxvI9TfG6bgnoEv06yh6HQ4L7roLDkoDQeUBTRFAlJQWwMX4aQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gxi1rMr6pDZww1s+prtCgMQeFsE7w4DpVzRN/Ml1u7o=;
 b=lYTI7E1OhaicGqlzqL1hKT4YlqEuZgd2KE3RIgg6M8aaPwG4Fa9Uaw2PwpAP9ThY2tA8ToJXCUyLla8KlL/3p6s+xaONu9ajs2cJ38aklTgo48uPgkm1oIt4B5mw80bshdBDnvPFdNdtKyhAN/ED8Fatd8XwON16Qv298zmmHzjGfEnChCc60ZPorNaqL5U223Ct4zd9uFAXQI2sPCqrS93/C3QvIRWke4T1iq26x+RwLcXkpmNmGRJrimqDhVppncNl4LUKoT3bUvzqlf6mMebPBR6NLHkBDkIjY8/y69GkMzPRe6N0IjbYsLRsU+nvQOQKOZjWDoXr+vsvQkGIBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gxi1rMr6pDZww1s+prtCgMQeFsE7w4DpVzRN/Ml1u7o=;
 b=ecud+nr/aV8v9j3HZLWEJbk6mZeOtR4kjs8N3kMJZMtPhrThQlte/TkeIaL2y5xL3Fmf9qTXbmjip/fvIcwS/iTpVti/Z9KZqHH7iCPV0SEZo4NmrIiB5Xgs7wEKJbCGUBL3VF0UjR8o87Lp8wdYChqcLZcSz4vK81XWdwrPLk8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Wed, 15 May
 2024 14:31:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.025; Wed, 15 May 2024
 14:31:30 +0000
Message-ID: <7a9a2819-a3f0-4a51-8ae8-bde6ff7b0aaa@amd.com>
Date: Wed, 15 May 2024 16:31:25 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/5] drm/amdgpu: Actually respect buffer migration budget
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <20240508180946.96863-3-tursulin@igalia.com>
 <8a689a5a-b408-41da-b7bd-8c7a3b2f2ac7@amd.com>
 <1a20c64f-cb1c-4f68-917b-9a8a34741bff@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <1a20c64f-cb1c-4f68-917b-9a8a34741bff@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: c85b59a8-0526-450c-f210-08dc74ebb60f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ejZQdFVuL2xiUU42b3pnbXJmQlJpaE5wUVpNbEw3TER4d2Z6Mm9GL3JFZWxu?=
 =?utf-8?B?UjJUelhOYnIweTBCSks3TDN5dFA4ZTFuSHhHVzVrTGtLOE53NGdWVUJkVXh1?=
 =?utf-8?B?ZHBrenZ2bWpweS9yeHpXaU1ud3dwUGpKWGlhRnd6cE5rUno4cEIyNFlLK3Bn?=
 =?utf-8?B?ZUd6d2dtc094azcxZTVJcmVKWXE3ZVgrNXBzdWZWejliOERmWEZLcHJZWk0v?=
 =?utf-8?B?SFhUeDhuK2Nqb002Tk1YWDQ3NisxSmZFS1luYUtrNnUzVWEzTGZqY1UxUy9T?=
 =?utf-8?B?aGFZUkd3UXF3ZkNoTGVsc2lJZDk2clBpMjhzQlg4bjNCTTlTWEVxRjNud3hk?=
 =?utf-8?B?ekhjOXlXdjJvSTBoWnpDQTFuWFFHRjlyS25qRFM4R3I2T2ptaXlaU1hCcVpD?=
 =?utf-8?B?ODArOGMvT09TQ2FCcWpRVW03eXE5ajZQZ3A1RnZ0TlZRNmx1SVhMOG1zR1F4?=
 =?utf-8?B?UEZUUlVxZVZwYVVrQit2MEFyUUNsNEpsY1Z0YjhzSGt3d0RWbmNYMTFGQTNi?=
 =?utf-8?B?Y1dCdEpsbjl0NjBmMFlobjM5VnN3WENCVHZQUThYV2NhTkpldVp5dndwaDRz?=
 =?utf-8?B?YjZSTnRsRmIyVGkzRHRxQVhDbWkydGtCY0lJL1VuaStKTUVtVmJFa2dvalM3?=
 =?utf-8?B?aGtacXdRNDk4Tkl0VTVwS0NDT2hEdUhLN2wrdUJUbHhPVlZadmR5WDhoTXl6?=
 =?utf-8?B?TXBTTThCb3ZhSUdIY1JValQ0OE9rQmNvWWtpaW13emxRYml1SHBPdDd0c0hG?=
 =?utf-8?B?aEYrNytKRmFWeS9NTGErMmR2ZTR3SGxqd1c1V25PcjJCeEVuejVNaHUzaE5T?=
 =?utf-8?B?bVNReFVnVU9WT1R1SjFYMW5FTHVtcHk1ZVZuYlc3eW53MitWWlMzQnRLSzVx?=
 =?utf-8?B?Y3BVa3JKNm5hRGpJbHhqRDh2WlJOY01JMy9ONTVqZE80c0c0MjdnanRzcmt2?=
 =?utf-8?B?ME1xNndCektpT280Z054N1p5YUtsRUJrNWZpRmFPYUhpOUpPbUNEd2RYYlcr?=
 =?utf-8?B?ZzI3K0JGSnJxZitzaXRmaG10dndqQ1oydms1eW5KdHc2bUdFbEVQWCtPUkZN?=
 =?utf-8?B?SWJ0aHFySFVIL3VGREp5SEJFdE84d1R5OVo3ajVlNThLNjdhMCtLSWlCbEQ4?=
 =?utf-8?B?NmdYNHBKUHFpWWV3UGJCcXo2aW5kVjkyY1lJc21XTDgwWWMxRGU3K2ZGeFd2?=
 =?utf-8?B?US82K2E3R2oyMUM4U1kwUUo5SEdBeHM2WkIvekc5cmNnLzlSODNnb1dXVUtQ?=
 =?utf-8?B?VlZwNUx5NHV5S1B5OTUycGR3QmRySmJ4Z1BKVmdsSDZVWDg2V3AxbW9iUUZN?=
 =?utf-8?B?UURXZVFlNzNkcGI5NUxUWnk0dmJwOU9FNE1QUkJ0Yml5cnRRQjVGd2tHODRn?=
 =?utf-8?B?SkE1NElsUzlOREtPSDhJMTdkbVlLaVkvcTNxS2UrOVplMkZLQUttY2NpWUJR?=
 =?utf-8?B?NDZrdlBlRUFXZVFMUkR2d1J1NG1zbHljbVJKVGRkNHIrMm9zcy9JV1d0Vm5U?=
 =?utf-8?B?RzhhUDgzUytwV1ZoZkhadWJUSGxzMDdLYktLOU4yK3JYaFhHSnZST1dZZUlt?=
 =?utf-8?B?VWpXN0E2RGdCNWxIWWZwS042L3diQWtiZnZ3RkZOWlVKR3pKclMwUmN3b2J2?=
 =?utf-8?B?akJqM1pBT3dpOUR4eXA5NjIrOXJIakN5QThUbDliVWxTaG9vTjc4bmRGaGMx?=
 =?utf-8?B?NWVESmpTQmZWempRb2hEZ0JaLzk0Y0RXQXZ3NTVoeFhoNFFXMjN1UXhnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXI1L29GTzkyZFBQbFVidWtLK0Qyb1FxVGJoMUJINVVpeGxBcTVmTitLTGU2?=
 =?utf-8?B?KzBsM2lzR1BtNEJQOSsxY3pqK0VmdUllOEVTZ0xkN0RaN0lnNEFxWTg4bXU3?=
 =?utf-8?B?b0tnRDd3OUJpNnc0SWpUS0dHb3dJd3lXd0VpeXRyMDg1MXQzalhSWExqMGRq?=
 =?utf-8?B?RDExZ01qeGdhb0RsYWU2eFRZb2d4ZzhDMVZQeDRHVm5BME5qV0ZhS3dBV2RQ?=
 =?utf-8?B?TWJHdEN1bnZoTGRhSStKV2FPWkFRUHVpOHJVNUVnd3pkSFlZYWdXVWNZR3Ey?=
 =?utf-8?B?Nnk3SEd1RTVPMUNTODNncTZBSS9URW1aRWJkbWR3aWRYbnR3UzhtUGJIeWo3?=
 =?utf-8?B?OTlIT3RQUGtzSFgrWmNRSzViMnovbWRURzNYT0tURUJ3OTUvWFZMWWxJOEhJ?=
 =?utf-8?B?SkJWOVhPSHBwdVQ3UlhmQkE3WWpnM1JvczNDRllmOUJLVWNUNGY4bVRPeDdv?=
 =?utf-8?B?TzJ0Q1VvMDlkZUR0VVN3UkhaZUZOZ0tnMUdKa3l1OS91KzZHTTFUNlh3Y3Jy?=
 =?utf-8?B?NTVTanJheFpZOTQxVU4reEg5aTQzSUIxU0d4VElPR0pqZGkyVVp2ZHo0UmN5?=
 =?utf-8?B?K1NIZmpEVjQvZmtKNU9KNGdsTTRtTUpyT29XSlR4WmlRU05DUnc5OVI0V0NW?=
 =?utf-8?B?NkgrK1Y3SllDUWFoQ0xlWWNFS2RXbW5lL3JFNjV6amN3WS9RMUVoM3BNMVpm?=
 =?utf-8?B?RFZ5eVlPMXJuQlpud3RBZkNnRlU3TUhwcGMxSDJZNndLRVNWVFI0Vnhzc3dN?=
 =?utf-8?B?ZHNVVlhqYmg1Y2pNaGlCL1lQbStMYVN0dEpJT2dIWDdvWXBXYVVtNVg2Y1ps?=
 =?utf-8?B?U1krSXdPWlpWdmtWL2hPSXRNaVNHVVdVRlVCeTdUZHFXNG1HQlpTYU9sZDda?=
 =?utf-8?B?NHBsRzZhTmk3Z0FiVHVFWFRJQlVJUFg5cUJUbjJINVAybDF1THExc2pEYlVR?=
 =?utf-8?B?TDBLV1RrYk5jVlNveUZTTSsvVURKSVNUUnpCV3NKc0FmZXlvNUFHT2l2MDdp?=
 =?utf-8?B?TW5LTmg3RXZiWEFJWlBnOVluSjdiK3A5cHRtZWU1RFU0ODhNTitJN3F2N09Y?=
 =?utf-8?B?L043UzY0MTNXSS90TXZVMTZrWk1Ld3FLdjlkR0duWXBRRURFWVNYdXdhbUZH?=
 =?utf-8?B?YW1jNDFIcXlNMnFNdDU2dHJETlpGZmtHQVJqcUQ3SkhxN3p5clpzTE9QcFJ5?=
 =?utf-8?B?OVNlYmlwV0dHRG5wYWo0UHdlMDczU25mRDlhVTlKbmljd3Y5UUI1RzZlUGk3?=
 =?utf-8?B?dHFDUWtjSDNncUM2Y3dTT1RWbTg0NXArbHRlVkUwMjJQdGtQbkJGWFkyZDQ3?=
 =?utf-8?B?WW1MZWRQWFBoZFVKVXZvS3NZZ2tvS25HdGYrSnZ0dHhGUjJRem85T2ErTGU3?=
 =?utf-8?B?RnJhRElPMlRaN3hlVnNQeWpLbkpmTDh5N1ZPOUYyNUFzM2lidmdWc3o4NnVo?=
 =?utf-8?B?OXpjWEQ4R1VZTFB5S3NFYjkvS0hZTFpkc3VqY0IydFg1OXUrNHl6TWNJTG44?=
 =?utf-8?B?NFhtMUxaTjNLNkJ0eXFTWEdhSEV0NDV2emtsK1RqUXA1bE8xeFM0d3NaZ2Ji?=
 =?utf-8?B?SjFBWnc5RkdYNXl0UWwrQVVhajVRMzd2ZHJGSFFJSFh5QmE4UGtFcE84QXJX?=
 =?utf-8?B?UVJqdHkyUWRNdHovVGNGR1NYSTZrZkFWaHNaSTh6YlVyQzJGanNYaXFCSGJt?=
 =?utf-8?B?NGl3YUp5aFpYc2xKUHBadkdVOS9ZUjg0TmI0TWppSkxTSUlzdnpnTXd6TFZj?=
 =?utf-8?B?eFUzb2M0b1VQVTF3Y3QycW4xcWhWWDNJNk5VRG9pUkMwbHBQOU81emdKOXVQ?=
 =?utf-8?B?Tk5CMEtGZG5WM2ZBRmZnb3pucVdYdW5lMVpSbEI0UFpBanV6WG5Ib3Avd2FF?=
 =?utf-8?B?YjFERE9sa05ac1JJNk9vczl1bWgxeHFaeFE4WDNPa3lrSHZrU01CY1hJWGd1?=
 =?utf-8?B?Rld3ckU1cmI1MlJjWEZ2UmRkcEVLT25iY29mZG8xRkpTRlVOTFhxbWY5bUZW?=
 =?utf-8?B?aHdWSmtIWGpZRWhHYXFTbW1CRWlISDNPREp4UkNyQlZnVzdoQVliWjJCK2Z6?=
 =?utf-8?B?ZWNWRzhsYWFxM0xJQVgwWGtBZzBFeTdJbTRaVEViajNWb0RScHRyNHp5cjZj?=
 =?utf-8?Q?p29c6ht8VFiSl5xf6jSdTGIwa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c85b59a8-0526-450c-f210-08dc74ebb60f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 14:31:30.2096 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ba6hyfJcuAFUqQ/2/xkU6AFAEpBzEAozy5/6tzd0pDOy0fkI6KjehB1gx0E+XAUx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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

Am 15.05.24 um 12:59 schrieb Tvrtko Ursulin:
>
> On 15/05/2024 08:20, Christian König wrote:
>> Am 08.05.24 um 20:09 schrieb Tvrtko Ursulin:
>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>
>>> Current code appears to live in a misconception that playing with 
>>> buffer
>>> allowed and preferred placements can control the decision on whether
>>> backing store migration will be attempted or not.
>>>
>>> Both from code inspection and from empirical experiments I see that not
>>> being true, and that both allowed and preferred placement are typically
>>> set to the same bitmask.
>>
>> That's not correct for the use case handled here, but see below.
>
> Which part is not correct, that bo->preferred_domains and 
> bo->allower_domains are the same bitmask?

Sorry totally forgot to explain that.

This rate limit here was specially made for OpenGL applications which 
over commit VRAM. In those case preferred_domains will be VRAM only and 
allowed_domains will be VRAM|GTT.

RADV always uses VRAM|GTT for both (which is correct).

>
>>>
>>> As such, when the code decides to throttle the migration for a 
>>> client, it
>>> is in fact not achieving anything. Buffers can still be either 
>>> migrated or
>>> not migrated based on the external (to this function and facility) 
>>> logic.
>>>
>>> Fix it by not changing the buffer object placements if the migration
>>> budget has been spent.
>>>
>>> FIXME:
>>> Is it still required to call validate is the question..
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 12 +++++++++---
>>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> index 22708954ae68..d07a1dd7c880 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>> @@ -784,6 +784,7 @@ static int amdgpu_cs_bo_validate(void *param, 
>>> struct amdgpu_bo *bo)
>>>           .no_wait_gpu = false,
>>>           .resv = bo->tbo.base.resv
>>>       };
>>> +    bool migration_allowed = true;
>>>       struct ttm_resource *old_res;
>>>       uint32_t domain;
>>>       int r;
>>> @@ -805,19 +806,24 @@ static int amdgpu_cs_bo_validate(void *param, 
>>> struct amdgpu_bo *bo)
>>>                * visible VRAM if we've depleted our allowance to do
>>>                * that.
>>>                */
>>> -            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold)
>>> +            if (p->bytes_moved_vis < p->bytes_moved_vis_threshold) {
>>>                   domain = bo->preferred_domains;
>>> -            else
>>> +            } else {
>>>                   domain = bo->allowed_domains;
>>> +                migration_allowed = false;
>>> +            }
>>>           } else {
>>>               domain = bo->preferred_domains;
>>>           }
>>>       } else {
>>>           domain = bo->allowed_domains;
>>> +        migration_allowed = false;
>>>       }
>>>   retry:
>>> -    amdgpu_bo_placement_from_domain(bo, domain);
>>> +    if (migration_allowed)
>>> +        amdgpu_bo_placement_from_domain(bo, domain);
>>
>> That's completely invalid. Calling amdgpu_bo_placement_from_domain() 
>> is a mandatory prerequisite for calling ttm_bo_validate();
>>
>> E.g. the usually code fow is:
>>
>> /* This initializes bo->placement */
>> amdgpu_bo_placement_from_domain()
>>
>> /* Eventually modify bo->placement to fit special requirements */
>> ....
>>
>> /* Apply the placement to the BO */
>> ttm_bo_validate(&bo->tbo, &bo->placement, &ctx)
>>
>> To sum it up bo->placement should be a variable on the stack instead, 
>> but we never bothered to clean that up.
>
> I am not clear if you agree or not that the current method of trying 
> to avoid migration doesn't really do anything?

I totally agree, but the approach you taken to fix it is just quite 
broken. You can't leave bo->placement uninitialized and expect that 
ttm_bo_validate() won't move the BO.

>
> On stack placements sounds plausible to force migration avoidance by 
> putting a single current object placement in that list, if that is 
> what you have in mind? Or a specialized flag/version of 
> amdgpu_bo_placement_from_domain with an bool input like 
> "allow_placement_change"?

A very rough idea with no guarantee that it actually works:

Add a TTM_PL_FLAG_RATE_LIMITED with all the TTM code to actually figure 
out how many bytes have been moved and how many bytes the current 
operation can move etc...

Friedrich's patches actually looked like quite a step into the right 
direction for that already, so I would start from there.

Then always feed amdgpu_bo_placement_from_domain() with the 
allowed_domains in the CS path and VM validation.

Finally extend amdgpu_bo_placement_from_domain() to take a closer look 
at bo->preferred_domains, similar to how we do for the 
TTM_PL_FLAG_FALLBACK already and set the TTM_PL_FLAG_RATE_LIMITED flag 
as appropriate.

Regards,
Christian.

> Regards,
>
> Tvrtko
>
>>
>> Regards,
>> Christian.
>>
>>> +
>>>       r = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>>>       if (unlikely(r == -ENOMEM) && domain != bo->allowed_domains) {
>>

