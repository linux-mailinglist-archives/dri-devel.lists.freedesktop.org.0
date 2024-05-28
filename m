Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C7A8D14B5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 08:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB49112005;
	Tue, 28 May 2024 06:52:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qJsisAzN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F5D2112004;
 Tue, 28 May 2024 06:52:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l4jW6gt9MG5XsXJVsqGJnP1/iWUnGD3TCbkGGRr8eJ5VGgh75c248lS9viBX0qvBc/X5KoGKqvhq3E2R0eDc0ANd7u+9GPtU6e00GveUxYbmaI7dGODg71nBn7Rk18r2ZqeIHHojC8eqA3UejoAmFp+6B6sOsBpoMqjSqqdfekfSXtjWgJxrsobEb+ezKhKsjVfPoVuwvGnH8KjCZGu6Jc239IzaOZg4J8N57jYw254bEoJdO1aUo0t6UifIuNW+p/KlwP7YGjgJfFGiOxzynP6DYEfPiTfiPcKLiaLL73VUJupM5QKYy7HQEh1qdfzIhVCFlxxyZ2cca0PdPKqBDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZR4MazvXuA4Sj1+aGB2wTRNwnwJFOCVI8w4cNTxIdU=;
 b=DX4TeQ9JAvXyAL6Gu07E9r9UHTTpII8A1M9GxvxLyBgz8xaE+Z3JM3vwdJ7Vv697ygY+PHxfGkxhUC9TuSh5j0HnJxjcyL0Awty2VXUUeTOW23SSR3ysXAi5AulrDM4QPmsZvQFIpzr/6lR0wonal4GB0APccDkFknvsJcD31hEwkIE30xOGWzmjU5PR4yVL9EzIqyF5yaU2P/50jywfpGd39884xbq8Q82pSo+mx92eSIYKlD26z2QrHHvdQQqM/xNK5L1GduZ3AVDzeE4xXuOpgifmtmW6HXtrqVtNGEUF5JdwkCctEFn9Z4LLxJ7B36bPU4k3ymMYaLyEpcVnmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZR4MazvXuA4Sj1+aGB2wTRNwnwJFOCVI8w4cNTxIdU=;
 b=qJsisAzN4SEZevUIUYSvR6FkOjuY9MgDnFLdAKcyflTyGdUHzT9kdq698w0CX4Dl2LZ5m/hWU+wSwWcgR38Uwx6Qiyo8wLLiAc27Nu6OC3lDXYjbaXaqr+z7ynmRXYHoRYhNCUn0tAfLoOg1uMwnnANrsjaEUtNbNTKtdK2YJLA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 06:51:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7611.025; Tue, 28 May 2024
 06:51:54 +0000
Message-ID: <5d6f1197-3303-4197-a4d6-ff1fe4d7f1f9@amd.com>
Date: Tue, 28 May 2024 08:51:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 13/21] drm/exec: Rework contended locking
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240521071639.77614-1-thomas.hellstrom@linux.intel.com>
 <20240521071639.77614-14-thomas.hellstrom@linux.intel.com>
 <fb9efb6b-fd2f-424e-8c9c-8ca590ee714a@amd.com>
 <3f3d7fb84a11e8341a79331a0a682df0f3e8897d.camel@linux.intel.com>
 <e0fb45b9-69a8-4e36-a518-30380583fcd2@amd.com>
 <b5dfb6280aa6a9fd0d2449027b8bf14276f1baab.camel@linux.intel.com>
 <dc1262b26f16daabcf0a9b7018f7605da4202d41.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <dc1262b26f16daabcf0a9b7018f7605da4202d41.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0056.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ce21ed-5545-4f7b-f818-08dc7ee2a8d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZlRXU1g5TlFmUXRQb3hZNkpmRU1lNlZlNjJSUTJaSDg1SGRpZ0NwUFZHMUpE?=
 =?utf-8?B?NVpnZUpjL29JOUFRUnRYMTRSaEdjSXBkN05tZG80bU9KQ05mQkFMY01BUVpU?=
 =?utf-8?B?RmlqUUtzS0lGMFVDNmlVbjd1SDdZbGZTSUl4d1RyRGt5NitoUjgyNzM2a09Q?=
 =?utf-8?B?Qk56eEphdFFIdFFnOThDbjhKMlNldTUybXZRa2hpOVQyR2J1cDE5UlhvYjRD?=
 =?utf-8?B?THo1aG90cW0zS1p0YkE2d1VVY3MvUWt3WllBa3A3UXo0K2Y3ZWVKRGJUejl3?=
 =?utf-8?B?a0tvNXkyRnNoMHVsRm1RbkhheG0zMHZyOXJJQ29SMUJIaG1BZTl1MENJemdz?=
 =?utf-8?B?L0c5dXVPVGNHNjB6dFBlWWdlbEE2cUtDQThGVTU5MkEwSC9wOXBoOVgzY1Vr?=
 =?utf-8?B?ZkU0YWRjSTZENUw4SmZnSUFDM1ZrS1dwdjZJZHVLblY0YUxnT3BzMklkRXNN?=
 =?utf-8?B?aW1HeFYyUnpUZitzVVU0YTNDUnczT3ZlRVc0bmFiTnozbDdFQmFCN2tsbXda?=
 =?utf-8?B?aDZJVGNHOUY4RDlrQ1E1R1d0b2p0aW1la2djQ1VBTDFQQ0lNVXZtRXBMaytF?=
 =?utf-8?B?ZUtqRXlBWDBVRUNncE1nTkdLVUZYK0NJa1pMZ0F3azZXb21xTVc3RCtTYkJh?=
 =?utf-8?B?R2ZVUGdEQkE0ckdrYU1RTGZ2czcvdmo4RFFpTHhIR0Z3bStRQk5qYlJyeHgx?=
 =?utf-8?B?UkYwcWl3clJLWWkyM2tXZXRKdlVrb3J3UGFhb1VWMGxmR01GVnVTSExQRTZJ?=
 =?utf-8?B?MzVFVzBveklHRHlMbEJXckdUY0JGQ2pqS1ZrZUJyamFKUU8wM0Z0VnM4VXBJ?=
 =?utf-8?B?YWFrZVozNndMaG5kYXhwK2RYZTdjMkd2Z0tsaUYzamlEb2Fydno1SjV5NDA5?=
 =?utf-8?B?SVprNmxJOFlaVzZXWkwxeHJLNmQvY2JPdDc2aVhVV1c0Z2NMT0NzTjZDQXQv?=
 =?utf-8?B?Ti8wWVZnbFlZSWJlTE51Y0dId2hJY2NCSktxZy9tb3dhc3VVaXh6UGFUU1Vs?=
 =?utf-8?B?bVplRm8xZ2tLRGpacUgrWVNDQnBXTkU5Q1JqYmt6eGsxTldFU3I1QnNrSHNB?=
 =?utf-8?B?REhMWHpxbUpWVXlXWCsyeHRZSHpCZUNYN1NkU3FaVFp4dGdMbFYyOUZ3Szl2?=
 =?utf-8?B?YXZ1VCtVR1J1SUp3L1ZYZ0JISEl4Z0FEQW81ZkQzcER5bC9heGZ1V2ttTnUv?=
 =?utf-8?B?TytRaUx0dVZ2Ym9WWm5ybWhLUEJZQURsQW1sMDdVU1cyMTdpR084T2EwUW5z?=
 =?utf-8?B?MDZBYXBCVGNIQ1k0OUFuV3Z6bWJheTBaUTlxY3VHcVFjZjMrYThzWDBtcTVF?=
 =?utf-8?B?UWJzY005STNUcTcwVDdicEl5cnMyY2QvN2tsSUZiK1NUbUUvSzN3bVhyOXNV?=
 =?utf-8?B?c0lyK1JhOGNkaFZ4NmlDZkdZRW00dktvQmZUN2dpRE82Tlpaa09OOThVbVBq?=
 =?utf-8?B?ZGU2WlRPaTlGZTFPazY0MEZzZ0ZYM0diZlMrcm5qQWdzTkdhVnRmTmRTRzQ2?=
 =?utf-8?B?ZTJwTTZsTXhDUDYxSzI1WFNWWE5iRFdNc2l0a1BaMkhKMEdYcERrZ0RTazlG?=
 =?utf-8?B?Z2hGdkVuckc0RmFzdFNMNElUTHhqNWpjd3NVaktpL3JFb2NDYmhLeTRveldH?=
 =?utf-8?Q?PlUiiS/8lU7ZtPnkWnnuRbomjQmiJiLE5lKHqoCwBuws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STFvY1kxbiswTGYzbm55aklVSndXam9lRUtoL1lCWjhRQ1E5SHBTZjdNdXVx?=
 =?utf-8?B?YWQzOEVWNzh3SmZNUGZBTFd2VEt1OUNoMHZ5K3FFMWVsWTFiVGhQSVRENm9C?=
 =?utf-8?B?Uk41eHdNY2RtTXlIUkt0dGpNYkpTWWVxUko1WmlEMUFMbDdWYWZ4emNhbHI4?=
 =?utf-8?B?NmtCd0d5RkFPS1FJUjYyQVZjY2xTSEI3Njh4K3JBL0lZS2FITzhQNG1aSTdp?=
 =?utf-8?B?bzdRYkJCYkdVNmVFak5mK2JhNWpPaDJ2cVkvTHVDWG9QV2hFNElvamMvL2p4?=
 =?utf-8?B?REJkVVpmZTZrL3BtMkNGVUdET3V1M2Q1SHVtaUo2dCtLdng2SnNleHdDUE16?=
 =?utf-8?B?ZXQ1UnlGNVVhWS9WNjhGOFRtbXNzTVR3U3Z2ejZVWHVLaUJLVTRVMzB4ZWxX?=
 =?utf-8?B?MnR4bFM2Wmp4SHM1Z1BxbzBVTkYvcTYrY3lZN3Uzdll0QWdaVGpvZmg4MEhW?=
 =?utf-8?B?ZTVTci9SdCtyRmNCRkdpeWQ1QUxjb3ZhSVJzRDFBWlRxMGg1ckxLd2p2TStw?=
 =?utf-8?B?MTZlbEl1RnVqUi9iMDNkRnpIMFlJUnlmUU5INUFzeU1qZDFzVnk3Q01hSTND?=
 =?utf-8?B?VmhxK1NUb0Q3MmNQUGt6aVZXbkJhTDlyL0daRDh6VzZKSDZ2cmtzQWp4QUts?=
 =?utf-8?B?ZFIzemh4WTc0UjcvQ1FOdlJ3by9xWVJRTEx3OWdnMmYvNUVjT0VNRFA5RXJ4?=
 =?utf-8?B?citZTWd6bGZhaVVVOHpDbGQ2NlFyMzh6N292WTZDMU1MTUxGU25FUEdoV1Rx?=
 =?utf-8?B?U0xjMW8ybUVqUUNUVzZCTE5LTVFDKzBHclZCZU9NM0hRazRRQ3N4K21kYnRi?=
 =?utf-8?B?cnh3cmZUQjdrVjQycEdQdURMemVTKytPYzViQUJieTU2MDhBWjdSWjl3NWNW?=
 =?utf-8?B?WTNDRDFPYm02bXF4RFRLMFJ0UUVZQ3dwVWVhdGxOSjlqZDJpbkxuMmpvZ0Rz?=
 =?utf-8?B?OFBXL1NvenNTckVXWU9zQVBtRGQxSEpHcDc1MGRtQ210bHB2UXpUWStYQldW?=
 =?utf-8?B?cUJlaUhOanFubDYrT3R6ZnkyMUpTck5naGpNZzdJRHNVbXk3NjBKVGg4UmVP?=
 =?utf-8?B?L1VaTytWcUk3NFBxNlJQYVFmZnpVdXVKbytpQ2wwMmFCcFBicnFjYjl5RjBT?=
 =?utf-8?B?dURSblFBTytWRU9sajF6N01FZnJyejNLZ2xoR1k3cHFVN1lqZTNUUXcwaERE?=
 =?utf-8?B?OTFIYlBVdlZteVF0akY0djFoSGFPN2VEaEZYN2xKNHFROXMyaSs2VkpvWjBj?=
 =?utf-8?B?VlBySlJiZ1EySFF5M2txMXN6WGxzWFdOREdOaTl4c2RyQmpWTEpReU41czBi?=
 =?utf-8?B?Rkc3c2dybHV3ekN4VEJVbTFuRHkvQkNZQXZCNVBxNHlZQnZqODJwTzlTWCsv?=
 =?utf-8?B?NDRrZ0NIRlZweEs5V2c1TWJJaUhHTjJWQ1pYanR6Rm9McFE4TG0rYktBcGxa?=
 =?utf-8?B?RllIOUMySTc4SVRvQ3l2SytRZ251RXRqR3JtaUFISEdXZkZRYklEajVkdXVX?=
 =?utf-8?B?RktOc2hDRWFMRzJKcGN5VVlQa0s5Qlk3dWJjZldJT1JENFhXVjVUSGVYeEEv?=
 =?utf-8?B?RWNjSDlxUUJwRkVrOTY4UkxzS05JZXArMS9hRXVNMGREQ0xDSFg4QXUwQ3JV?=
 =?utf-8?B?ekpmQ09oSUhiVHZGQnorczVSeHdyWkRCTi9mK1dEMmlNRnJ0aER4T0I3UWg1?=
 =?utf-8?B?bjUzVkFXaWx2T052UG5neDRmMVlobFFQd01FMkdjbGkwZld2dUhxSmozMTdB?=
 =?utf-8?B?aEVaeG4wdFdRcENhQlJscnNIWTMvTWxIRnF0VEhEODVIZ0NZNEV0THlZeUpm?=
 =?utf-8?B?ZFQwNnFYbC9udUc4blpJc2tMUHEzdmNLZHcyOEhLdkdsQ1FRSjNzMzE5U3BQ?=
 =?utf-8?B?aDAwbVBCOUJudkFEdTJ2YW5XcnUxUzRMd3VYcms5d2F4eTBsWTNOOHp5UmpU?=
 =?utf-8?B?dXF0T0E3bFM2K1lhQ3QvRm1uYWN5YnB0WlY3OFB6L3Q5SEFHNlFkZFFXZ1By?=
 =?utf-8?B?MHhWZWpHZHFuSHJsdlAyZVI0YStQS2xtNXFWRzhzdmVqVFpuQWVSSFp3NUox?=
 =?utf-8?B?V0hkVlBzY1A0c3hha3BJc2VYdk83bVFXczVBWTQ5T3ZIOEdVUnN6ZG8rMk96?=
 =?utf-8?Q?v2Gd6vllwh9s/Yw932QtNTYn0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ce21ed-5545-4f7b-f818-08dc7ee2a8d7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 06:51:54.3614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RgECLqS1mGdQwlNa3km0clhjCsDwiNR1SUCl+6g2Qm7GSgePMFNRNd3852u09b8u
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940
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

Hi Thomas,

Am 28.05.24 um 08:36 schrieb Thomas Hellström:
> Hi, Christian.
>
> I'd appreciate if you could respond to the below, since it is a bit
> hard to try to design around a problem I don't believe exists, and come
> up with a good solution for that.
>
> In short.
> 1) To prefault userptr we have to exit the ww transaction anyway.

Yeah and I would rather like to have that handling in drm_exec at some time.

Basically a GEM object with outdated struct pages backing it can be 
handled in the same loop at the ww transaction.

> 2) Any contended lock held at loop start is completely encapsulated in
> the ww transaction and can and will be unlocked when exiting it, so
> this patch doesn't introduce any additional problems for userptr
> handling AFAICT.

The drm_exec object was intentionally design to not have anything locked 
at the beginning of the loop. See the discussion I had with Sima around 
that when pushing the drm_exec object upstream.

I would really like to stick with that design and honestly don't see the 
reason to change that. Contenting on a trylock seem to be much more 
questionable.

> 3) The need for a fully capable ww transaction helper moving forward.
> If we need a tool that also does userptr locking, then I think we need
> to separate that from the ww transaction tool and only pass the latter
> around to TTM.

drm_exec is *not* meant to be a ww_transaction helper.

The functionality here is to support drivers in their CS interface and 
that includes userptr handling as well as a couple of other things.

Regards,
Christian.

>
> Thanks,
> Thomas
>
> On Wed, 2024-05-22 at 19:42 +0200, Thomas Hellström wrote:
>> On Wed, 2024-05-22 at 18:52 +0200, Christian König wrote:
>>> Am 22.05.24 um 16:32 schrieb Thomas Hellström:
>>>> On Wed, 2024-05-22 at 07:52 +0200, Christian König wrote:
>>>>> Am 21.05.24 um 09:16 schrieb Thomas Hellström:
>>>>>> If contention and backoff occurs during a drm_exec ww
>>>>>> transaction,
>>>>>> the contended lock is not locked again until the next orinary
>>>>>> attempt to lock a dma_resv lock. However, with the
>>>>>> introduction
>>>>>> of
>>>>>> drm_exec_trylock(), that doesn't work, since the locking of
>>>>>> the
>>>>>> contended lock needs to be a sleeping lock. Neither can we
>>>>>> ignore
>>>>>> locking the contended lock during a trylock since that would
>>>>>> violate
>>>>>> at least the ww_mutex annotations.
>>>>>>
>>>>>> So resolve this by actually locking the contended lock during
>>>>>> drm_exec_retry_on_contention(). However, this introduces a
>>>>>> new
>>>>>> point
>>>>>> of failure since locking the contended lock may return -
>>>>>> EINTR.
>>>>>>
>>>>>> Hence drm_exec_retry_on_contention() must take an error
>>>>>> parameter
>>>>>> and
>>>>>> also return a value indicating success.
>>>>> After thinking more about that I have to pretty clearly NAK
>>>>> this.
>>>>>                                     
>>>> I thought we were beyond upfront NAKing in the first reply :/
>>> Well my memory could fail me, but I mentioned concerns on this
>>> approach
>>> before.
>>>
>>> I was a bit annoyed seeing that again. But could as well be that my
>>> response never got out or that I'm mixing things up.
>> I haven't seen it at least. Last discussion on this I saw was
>> here. I didn't see a follow-up on that.
>>
>> https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/
>>
>>
>>>>> It's an intentional design decision to guarantee that at the
>>>>> start of
>>>>> the loop no object is locked.
>>>>>
>>>>> This is because Sima and I wanted to integrate userptr handling
>>>>> into
>>>>> drm_exec as well in the long term.
>>>> First I agree the interface looks worse with this patch.
>>>> But I thought generic userptr handling were going to end up as a
>>>> gpuvm
>>>> helper (without using GEM objects) as we've discussed previously.
>>> We might be talking past each other. That sounds like SVM, e.g. on
>>> demand paging.
>>>
>>> What I mean is pre-faulting during command submission like radeon,
>>> amdgpu and i915 do for the userptr handling.
>> Yes, then we're talking about the same thing.
>>
>> We discussed in this thread here, started by Dave.
>>
>> https://lore.kernel.org/dri-devel/CAPM=9twPgn+fpbkig0Vhjt=cJdHQFbNH_Z=sRhSZwuvLKhavbA@mail.gmail.com/
>>
>> I still think the right place is in drm_gpuvm for this sort of stuff.
>> And I think that's the concluding argument by Sima as well.
>>
>> In any case, If the planned drm_exec development is to be a full
>> execbuf helper, I think we need a capable sub-helper for ONLY the ww
>> transaction locking as well, with support for the various locking
>> primitives. In particular if we're going to be able to port i915 ww
>> transaction locking over. There are more uses of the ww locking
>> transacions than execbuf.
>>
>>> For that you need to re-start the whole handling similar to how you
>>> need
>>> to re-start for the mutex locking when you detect that the page
>>> array
>>> is
>>> stale, the difference is that you are not allowed to hold any resv
>>> locks
>>> while pre-faulting.
>>>
>>> That's why it is a requirement that the drm_exec loop starts
>>> without
>>> any
>>> locks held.
>> But wouldn't you need an outer (userptr) loop and an inner
>> (ww_transaction) loop for this? Why would we want to re-validate
>> userptrs on -EDEADLKS?
>>
>>>> Anyway if still there would be helpers in drm_exec for some other
>>>> generic userptr solution, those need to be done before the
>>>> ww_acquire_ctx_init(). The contended locking here is done after,
>>>> so
>>>> I
>>>> can't really see how these would clash.
>>> Yes, that indeed was a problem. The ww_acquire_ctx_init() was
>>> intentionally moved into drm_exec_cleanup() to partially prevent
>>> that
>>> issue.
>>>
>>> I haven't fully figured out how to do handle everything exactly,
>>> but
>>> at
>>> least in principle it can be made work. With this change here it
>>> becomes
>>> impossible.
>>>
>>>> Still, If we need to come up with another solution, I think it's
>>>> fair
>>>> we clearly sort out why.
>>>>
>>>>> I think we should just document that drm_exec_trylock() can't
>>>>> be
>>>>> used
>>>>> to
>>>>> lock the first BO in the loop and explicitly WARN if that's the
>>>>> case.
>>>> Unfortunately that's not sufficient for the general use-case. If
>>>> we
>>>> want to keep the ttm_bo_vm approach of dropping the mmap lock
>>>> when
>>>> there is contention on the bo resv, we need to be able to trylock
>>>> on
>>>> first lock.
>>> Mhm, why exactly do we still have that dance in the first place?
>>>
>>> I mean we have sorted out the mmap() and dma_resv() locking order
>>> long
>>> ago. See dma_resv_lockdep() which is enforcing that.
>> I explained that in my reply here:
>>
>> https://lore.kernel.org/dri-devel/953c157bf69df12d831a781f0f638d93717bb044.camel@linux.intel.com/
>>
>> We shouldn't be holding the mmap lock when waiting for stuff. In
>> particular not while waiting for mutexes that may be blocked by gpu
>> activity.
>>
>>>>    Also bo creation is using trylock but might be able to use
>>>> a sleeping lock there. But if that sleeping lock triggers an -
>>>> EDEADLK
>>>> (DEBUG_WW_MUTEX_SLOWPATH) we have the weird situation of
>>>> referencing an
>>>> object that never was fully created as a contending object.
>>> I wanted to eliminate that as well by not validating the BO during
>>> initialization any more.
>>> So bo creation would then be:
>>>
>>> ttm_bo_init(bo)
>>>
>>> drm_exec_while_not_all_locked() {
>>>       drm_exec_prepare_object(bo, 1);
>>>
>>>       ttm_bo_validate(bo);
>>> }
>>>
>>> if (r)
>>>       ttm_bo_put(bo);
>>>
>>> return r;
>>>
>>> I have that on a branch here somewhere prepared, but never got the
>>> time
>>> to clean it up.
>> Still, bo creation and validation may be part of a ww transaction as
>> well, like page-table bos (Although those are pre-locked so perhaps
>> not
>> a good example). But in the general case, I'm not sure this is
>> sufficient for all use-cases.
>>
>> /Thomas
>>
>>
>>
>>> Regards,
>>> Christian.
>>>
>>>> So the only really working alternative solution I can see is that
>>>> drm_exec_trylock simply fails if there is a contended lock and
>>>> we'd
>>>> need to live with the weird bo creation situation described
>>>> above.
>>>>
>>>> /Thomas
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Cc: Christian König<christian.koenig@amd.com>
>>>>>> Cc: Somalapuram Amaranath<Amaranath.Somalapuram@amd.com>
>>>>>> Cc: Matthew Brost<matthew.brost@intel.com>
>>>>>> Cc:<dri-devel@lists.freedesktop.org>
>>>>>> Signed-off-by: Thomas
>>>>>> Hellström<thomas.hellstrom@linux.intel.com>
>>>>>> ---
>>>>>>     .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 ++++---
>>>>>> --
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        |  6 ++--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  4 +--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       |  8 ++---
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  8 ++---
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c     |  4 +--
>>>>>>     drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  8 ++---
>>>>>>     drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  2 +-
>>>>>>     drivers/gpu/drm/drm_exec.c                    | 35
>>>>>> ++++++++++++++-----
>>>>>>     drivers/gpu/drm/drm_gpuvm.c                   |  8 ++---
>>>>>>     drivers/gpu/drm/imagination/pvr_job.c         |  2 +-
>>>>>>     drivers/gpu/drm/msm/msm_gem_submit.c          |  2 +-
>>>>>>     drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  2 +-
>>>>>>     drivers/gpu/drm/tests/drm_exec_test.c         | 12 +++----
>>>>>>     drivers/gpu/drm/xe/xe_gt_pagefault.c          |  4 +--
>>>>>>     drivers/gpu/drm/xe/xe_vm.c                    | 10 +++---
>>>>>>     include/drm/drm_exec.h                        | 23
>>>>>> +++++++++---
>>>>>>     17 files changed, 92 insertions(+), 62 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> index e4d4e55c08ad..4a08a692aa1f 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
>>>>>> @@ -1152,12 +1152,12 @@ static int reserve_bo_and_vm(struct
>>>>>> kgd_mem
>>>>>> *mem,
>>>>>>     	drm_exec_init(&ctx->exec,
>>>>>> DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>> 0);
>>>>>>     	drm_exec_until_all_locked(&ctx->exec) {
>>>>>>     		ret = amdgpu_vm_lock_pd(vm, &ctx->exec, 2);
>>>>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>> exec,
>>>>>> ret);
>>>>>>     		if (unlikely(ret))
>>>>>>     			goto error;
>>>>>>     
>>>>>>     		ret = drm_exec_prepare_obj(&ctx->exec, &bo-
>>>>>>> tbo.base, 1);
>>>>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>> exec,
>>>>>> ret);
>>>>>>     		if (unlikely(ret))
>>>>>>     			goto error;
>>>>>>     	}
>>>>>> @@ -1199,14 +1199,14 @@ static int
>>>>>> reserve_bo_and_cond_vms(struct
>>>>>> kgd_mem *mem,
>>>>>>     
>>>>>>     			ret = amdgpu_vm_lock_pd(entry-
>>>>>>> bo_va-
>>>>>>> base.vm,
>>>>>>     						&ctx->exec,
>>>>>> 2);
>>>>>> -			drm_exec_retry_on_contention(&ctx-
>>>>>>> exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&ctx-
>>>>>>> exec, ret);
>>>>>>     			if (unlikely(ret))
>>>>>>     				goto error;
>>>>>>     			++ctx->n_vms;
>>>>>>     		}
>>>>>>     
>>>>>>     		ret = drm_exec_prepare_obj(&ctx->exec, &bo-
>>>>>>> tbo.base, 1);
>>>>>> -		drm_exec_retry_on_contention(&ctx->exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&ctx-
>>>>>>> exec,
>>>>>> ret);
>>>>>>     		if (unlikely(ret))
>>>>>>     			goto error;
>>>>>>     	}
>>>>>> @@ -2619,7 +2619,7 @@ static int
>>>>>> validate_invalid_user_pages(struct
>>>>>> amdkfd_process_info *process_info)
>>>>>>     		list_for_each_entry(peer_vm, &process_info-
>>>>>>> vm_list_head,
>>>>>>     				    vm_list_node) {
>>>>>>     			ret = amdgpu_vm_lock_pd(peer_vm,
>>>>>> &exec,
>>>>>> 2);
>>>>>> -			drm_exec_retry_on_contention(&exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     			if (unlikely(ret))
>>>>>>     				goto unreserve_out;
>>>>>>     		}
>>>>>> @@ -2631,7 +2631,7 @@ static int
>>>>>> validate_invalid_user_pages(struct
>>>>>> amdkfd_process_info *process_info)
>>>>>>     
>>>>>>     			gobj = &mem->bo->tbo.base;
>>>>>>     			ret = drm_exec_prepare_obj(&exec,
>>>>>> gobj,
>>>>>> 1);
>>>>>> -			drm_exec_retry_on_contention(&exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     			if (unlikely(ret))
>>>>>>     				goto unreserve_out;
>>>>>>     		}
>>>>>> @@ -2875,7 +2875,7 @@ int
>>>>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
>>>>>> dma_fence __rcu *
>>>>>>     		list_for_each_entry(peer_vm, &process_info-
>>>>>>> vm_list_head,
>>>>>>     				    vm_list_node) {
>>>>>>     			ret = amdgpu_vm_lock_pd(peer_vm,
>>>>>> &exec,
>>>>>> 2);
>>>>>> -			drm_exec_retry_on_contention(&exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     			if (unlikely(ret)) {
>>>>>>     				pr_err("Locking VM PD
>>>>>> failed,
>>>>>> ret:
>>>>>> %d\n", ret);
>>>>>>     				goto ttm_reserve_fail;
>>>>>> @@ -2891,7 +2891,7 @@ int
>>>>>> amdgpu_amdkfd_gpuvm_restore_process_bos(void *info, struct
>>>>>> dma_fence __rcu *
>>>>>>     
>>>>>>     			gobj = &mem->bo->tbo.base;
>>>>>>     			ret = drm_exec_prepare_obj(&exec,
>>>>>> gobj,
>>>>>> 1);
>>>>>> -			drm_exec_retry_on_contention(&exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     			if (unlikely(ret)) {
>>>>>>     				pr_err("drm_exec_prepare_obj
>>>>>> failed, ret: %d\n", ret);
>>>>>>     				goto ttm_reserve_fail;
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>> index ec888fc6ead8..299e46a6d934 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>>>>>> @@ -897,7 +897,7 @@ static int amdgpu_cs_parser_bos(struct
>>>>>> amdgpu_cs_parser *p,
>>>>>>     
>>>>>>     	drm_exec_until_all_locked(&p->exec) {
>>>>>>     		r = amdgpu_vm_lock_pd(&fpriv->vm, &p->exec,
>>>>>> 1
>>>>>> + p-
>>>>>>> gang_size);
>>>>>> -		drm_exec_retry_on_contention(&p->exec);
>>>>>> +		r = drm_exec_retry_on_contention(&p->exec,
>>>>>> r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_free_user_pages;
>>>>>>     
>>>>>> @@ -905,7 +905,7 @@ static int amdgpu_cs_parser_bos(struct
>>>>>> amdgpu_cs_parser *p,
>>>>>>     			/* One fence for TTM and one for
>>>>>> each
>>>>>> CS
>>>>>> job */
>>>>>>     			r = drm_exec_prepare_obj(&p->exec,
>>>>>> &e-
>>>>>>> bo-
>>>>>>> tbo.base,
>>>>>>     						 1 + p-
>>>>>>> gang_size);
>>>>>> -			drm_exec_retry_on_contention(&p-
>>>>>>> exec);
>>>>>> +			r = drm_exec_retry_on_contention(&p-
>>>>>>> exec,
>>>>>> r);
>>>>>>     			if (unlikely(r))
>>>>>>     				goto out_free_user_pages;
>>>>>>     
>>>>>> @@ -915,7 +915,7 @@ static int amdgpu_cs_parser_bos(struct
>>>>>> amdgpu_cs_parser *p,
>>>>>>     		if (p->uf_bo) {
>>>>>>     			r = drm_exec_prepare_obj(&p->exec,
>>>>>> &p-
>>>>>>> uf_bo->tbo.base,
>>>>>>     						 1 + p-
>>>>>>> gang_size);
>>>>>> -			drm_exec_retry_on_contention(&p-
>>>>>>> exec);
>>>>>> +			r = drm_exec_retry_on_contention(&p-
>>>>>>> exec,
>>>>>> r);
>>>>>>     			if (unlikely(r))
>>>>>>     				goto out_free_user_pages;
>>>>>>     		}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>> index cfdf558b48b6..8b2b86c7a6c5 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c
>>>>>> @@ -74,7 +74,7 @@ int amdgpu_map_static_csa(struct
>>>>>> amdgpu_device
>>>>>> *adev, struct amdgpu_vm *vm,
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>     		if (likely(!r))
>>>>>>     			r = drm_exec_lock_obj(&exec, &bo-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r)) {
>>>>>>     			DRM_ERROR("failed to reserve CSA,PD
>>>>>> BOs:
>>>>>> err=%d\n", r);
>>>>>>     			goto error;
>>>>>> @@ -114,7 +114,7 @@ int amdgpu_unmap_static_csa(struct
>>>>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>     		if (likely(!r))
>>>>>>     			r = drm_exec_lock_obj(&exec, &bo-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r)) {
>>>>>>     			DRM_ERROR("failed to reserve CSA,PD
>>>>>> BOs:
>>>>>> err=%d\n", r);
>>>>>>     			goto error;
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> index 67c234bcf89f..17e16c971e21 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>>>>>> @@ -239,12 +239,12 @@ static void
>>>>>> amdgpu_gem_object_close(struct
>>>>>> drm_gem_object *obj,
>>>>>>     	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		r = drm_exec_prepare_obj(&exec, &bo-
>>>>>>> tbo.base,
>>>>>> 1);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     	}
>>>>>> @@ -776,13 +776,13 @@ int amdgpu_gem_va_ioctl(struct
>>>>>> drm_device
>>>>>> *dev, void *data,
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		if (gobj) {
>>>>>>     			r = drm_exec_lock_obj(&exec, gobj);
>>>>>> -			drm_exec_retry_on_contention(&exec);
>>>>>> +			r =
>>>>>> drm_exec_retry_on_contention(&exec,
>>>>>> r);
>>>>>>     			if (unlikely(r))
>>>>>>     				goto error;
>>>>>>     		}
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(&fpriv->vm, &exec, 2);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>> index 5ca5c47ab54e..1b1a5147606e 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c
>>>>>> @@ -1221,12 +1221,12 @@ int
>>>>>> amdgpu_mes_ctx_map_meta_data(struct
>>>>>> amdgpu_device *adev,
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		r = drm_exec_lock_obj(&exec,
>>>>>>     				      &ctx_data-
>>>>>>> meta_data_obj-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error_fini_exec;
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error_fini_exec;
>>>>>>     	}
>>>>>> @@ -1292,12 +1292,12 @@ int
>>>>>> amdgpu_mes_ctx_unmap_meta_data(struct
>>>>>> amdgpu_device *adev,
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		r = drm_exec_lock_obj(&exec,
>>>>>>     				      &ctx_data-
>>>>>>> meta_data_obj-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>> index e22cb2b5cd92..72b8213e352c 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_seq64.c
>>>>>> @@ -77,7 +77,7 @@ int amdgpu_seq64_map(struct amdgpu_device
>>>>>> *adev,
>>>>>> struct amdgpu_vm *vm,
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>     		if (likely(!r))
>>>>>>     			r = drm_exec_lock_obj(&exec, &bo-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error;
>>>>>>     	}
>>>>>> @@ -138,7 +138,7 @@ void amdgpu_seq64_unmap(struct
>>>>>> amdgpu_device
>>>>>> *adev, struct amdgpu_fpriv *fpriv)
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>>     		if (likely(!r))
>>>>>>     			r = drm_exec_lock_obj(&exec, &bo-
>>>>>>> tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>> index e01c1c8e64c4..63392ce43945 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c
>>>>>> @@ -89,12 +89,12 @@ static int map_ring_data(struct
>>>>>> amdgpu_device
>>>>>> *adev, struct amdgpu_vm *vm,
>>>>>>     	drm_exec_init(&exec, 0, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error_fini_exec;
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto error_fini_exec;
>>>>>>     	}
>>>>>> @@ -152,12 +152,12 @@ static int unmap_ring_data(struct
>>>>>> amdgpu_device *adev, struct amdgpu_vm *vm,
>>>>>>     	drm_exec_init(&exec, 0, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		r = drm_exec_lock_obj(&exec, &bo->tbo.base);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     
>>>>>>     		r = amdgpu_vm_lock_pd(vm, &exec, 0);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		r = drm_exec_retry_on_contention(&exec, r);
>>>>>>     		if (unlikely(r))
>>>>>>     			goto out_unlock;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>> b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>> index 386875e6eb96..a3aa7fd22f6a 100644
>>>>>> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
>>>>>> @@ -1499,7 +1499,7 @@ static int svm_range_reserve_bos(struct
>>>>>> svm_validate_context *ctx, bool intr)
>>>>>>     			vm = drm_priv_to_vm(pdd->drm_priv);
>>>>>>     
>>>>>>     			r = amdgpu_vm_lock_pd(vm, &ctx-
>>>>>>> exec,
>>>>>> 2);
>>>>>> -			drm_exec_retry_on_contention(&ctx-
>>>>>>> exec);
>>>>>> +			r =
>>>>>> drm_exec_retry_on_contention(&ctx-
>>>>>>> exec, r);
>>>>>>     			if (unlikely(r)) {
>>>>>>     				pr_debug("failed %d to
>>>>>> reserve
>>>>>> bo\n", r);
>>>>>>     				goto unreserve_out;
>>>>>> diff --git a/drivers/gpu/drm/drm_exec.c
>>>>>> b/drivers/gpu/drm/drm_exec.c
>>>>>> index 2da094bdf8a4..3770a5d30213 100644
>>>>>> --- a/drivers/gpu/drm/drm_exec.c
>>>>>> +++ b/drivers/gpu/drm/drm_exec.c
>>>>>> @@ -28,12 +28,12 @@
>>>>>>      *	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
>>>>>>      *	drm_exec_until_all_locked(&exec) {
>>>>>>      *		ret = drm_exec_prepare_obj(&exec, boA, 1);
>>>>>> - *		drm_exec_retry_on_contention(&exec);
>>>>>> + *		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>      *		if (ret)
>>>>>>      *			goto error;
>>>>>>      *
>>>>>>      *		ret = drm_exec_prepare_obj(&exec, boB, 1);
>>>>>> - *		drm_exec_retry_on_contention(&exec);
>>>>>> + *		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>      *		if (ret)
>>>>>>      *			goto error;
>>>>>>      *	}
>>>>>> @@ -48,7 +48,8 @@
>>>>>>      */
>>>>>>     
>>>>>>     /* Dummy value used to initially enter the retry loop */
>>>>>> -#define DRM_EXEC_DUMMY ((void *)~0)
>>>>>> +#define DRM_EXEC_DUMMY ERR_PTR(-ESTALE)
>>>>>> +#define DRM_EXEC_CONTENDED ERR_PTR(-EDEADLK)
>>>>>>     
>>>>>>     /* Unlock all objects and drop references */
>>>>>>     static void drm_exec_unlock_all(struct drm_exec *exec)
>>>>>> @@ -131,8 +132,7 @@ bool drm_exec_cleanup(struct drm_exec
>>>>>> *exec)
>>>>>>     		return true;
>>>>>>     	}
>>>>>>     
>>>>>> -	drm_exec_unlock_all(exec);
>>>>>> -	exec->num_objects = 0;
>>>>>> +	exec->contended = NULL;
>>>>>>     	return true;
>>>>>>     }
>>>>>>     EXPORT_SYMBOL(drm_exec_cleanup);
>>>>>> @@ -194,6 +194,27 @@ static int
>>>>>> drm_exec_lock_contended(struct
>>>>>> drm_exec *exec)
>>>>>>     	return ret;
>>>>>>     }
>>>>>>     
>>>>>> +/**
>>>>>> + * drm_exec_handle_contended() - Perform cleanup before a ww
>>>>>> transaction restart
>>>>>> + * @exec: Pointer to the drm_exec object.
>>>>>> + *
>>>>>> + * Unlocks all held resvs and re-locks the contended object.
>>>>>> + *
>>>>>> + * Return: 0 on success, negative error code on failure.
>>>>>> + */
>>>>>> +int drm_exec_handle_contended(struct drm_exec *exec)
>>>>>> +{
>>>>>> +	int ret;
>>>>>> +
>>>>>> +	drm_exec_unlock_all(exec);
>>>>>> +	exec->num_objects = 0;
>>>>>> +	ret = drm_exec_lock_contended(exec);
>>>>>> +	exec->contended = DRM_EXEC_CONTENDED;
>>>>>> +
>>>>>> +	return ret;
>>>>>> +}
>>>>>> +EXPORT_SYMBOL(drm_exec_handle_contended);
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_exec_lock_obj - lock a GEM object for use
>>>>>>      * @exec: the drm_exec object with the state
>>>>>> @@ -209,10 +230,6 @@ int drm_exec_lock_obj(struct drm_exec
>>>>>> *exec,
>>>>>> struct drm_gem_object *obj)
>>>>>>     {
>>>>>>     	int ret;
>>>>>>     
>>>>>> -	ret = drm_exec_lock_contended(exec);
>>>>>> -	if (unlikely(ret))
>>>>>> -		return ret;
>>>>>> -
>>>>>>     	if (exec->prelocked == obj) {
>>>>>>     		drm_gem_object_put(exec->prelocked);
>>>>>>     		exec->prelocked = NULL;
>>>>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c
>>>>>> b/drivers/gpu/drm/drm_gpuvm.c
>>>>>> index f9eb56f24bef..0923d6ae18e2 100644
>>>>>> --- a/drivers/gpu/drm/drm_gpuvm.c
>>>>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
>>>>>> @@ -1254,18 +1254,18 @@ drm_gpuvm_exec_lock(struct
>>>>>> drm_gpuvm_exec
>>>>>> *vm_exec)
>>>>>>     
>>>>>>     	drm_exec_until_all_locked(exec) {
>>>>>>     		ret = drm_gpuvm_prepare_vm(gpuvm, exec,
>>>>>> num_fences);
>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>> ret);
>>>>>>     		if (ret)
>>>>>>     			goto err;
>>>>>>     
>>>>>>     		ret = drm_gpuvm_prepare_objects(gpuvm, exec,
>>>>>> num_fences);
>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>> ret);
>>>>>>     		if (ret)
>>>>>>     			goto err;
>>>>>>     
>>>>>>     		if (vm_exec->extra.fn) {
>>>>>>     			ret = vm_exec->extra.fn(vm_exec);
>>>>>> -			drm_exec_retry_on_contention(exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(exec,
>>>>>> ret);
>>>>>>     			if (ret)
>>>>>>     				goto err;
>>>>>>     		}
>>>>>> @@ -1346,7 +1346,7 @@ drm_gpuvm_exec_lock_range(struct
>>>>>> drm_gpuvm_exec *vm_exec,
>>>>>>     	drm_exec_until_all_locked(exec) {
>>>>>>     		ret = drm_gpuvm_prepare_range(gpuvm, exec,
>>>>>> addr,
>>>>>> range,
>>>>>>     					      vm_exec-
>>>>>>> num_fences);
>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>> ret);
>>>>>>     		if (ret)
>>>>>>     			goto err;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>>>>>> b/drivers/gpu/drm/imagination/pvr_job.c
>>>>>> index 78c2f3c6dce0..6e0ce6c4576c 100644
>>>>>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>>>>>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>>>>>> @@ -574,7 +574,7 @@ prepare_job_resvs_for_each(struct
>>>>>> drm_exec
>>>>>> *exec, struct pvr_job_data *job_data,
>>>>>>     	drm_exec_until_all_locked(exec) {
>>>>>>     		int err = jobs_lock_all_objs(exec, job_data,
>>>>>> job_count);
>>>>>>     
>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>> +		err = drm_exec_retry_on_contention(exec,
>>>>>> err);
>>>>>>     		if (err)
>>>>>>     			return err;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>> index fba78193127d..01992b43ea4b 100644
>>>>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>>>>> @@ -259,7 +259,7 @@ static int submit_lock_objects(struct
>>>>>> msm_gem_submit *submit)
>>>>>>     		for (unsigned i = 0; i < submit->nr_bos;
>>>>>> i++)
>>>>>> {
>>>>>>     			struct drm_gem_object *obj = submit-
>>>>>>> bos[i].obj;
>>>>>>     			ret = drm_exec_prepare_obj(&submit-
>>>>>>> exec,
>>>>>> obj, 1);
>>>>>> -
>>>>>> 			drm_exec_retry_on_contention(&submit-
>>>>>>> exec);
>>>>>> +			ret =
>>>>>> drm_exec_retry_on_contention(&submit->exec, ret);
>>>>>>     			if (ret)
>>>>>>     				goto error;
>>>>>>     		}
>>>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>> b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>> index ee02cd833c5e..0c871634fdfb 100644
>>>>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
>>>>>> @@ -1350,7 +1350,7 @@ nouveau_uvmm_bind_job_submit(struct
>>>>>> nouveau_job *job,
>>>>>>     	drm_exec_init(exec, vme->flags, 0);
>>>>>>     	drm_exec_until_all_locked(exec) {
>>>>>>     		ret = bind_lock_validate(job, exec, vme-
>>>>>>> num_fences);
>>>>>> -		drm_exec_retry_on_contention(exec);
>>>>>> +		ret = drm_exec_retry_on_contention(exec,
>>>>>> ret);
>>>>>>     		if (ret) {
>>>>>>     			op = list_last_op(&bind_job->ops);
>>>>>>     			goto unwind;
>>>>>> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>> b/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>> index 81f928a429ba..28558fdb08df 100644
>>>>>> --- a/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
>>>>>> @@ -63,7 +63,7 @@ static void test_lock(struct kunit *test)
>>>>>>     	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>> 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>> @@ -83,14 +83,14 @@ static void test_lock_unlock(struct kunit
>>>>>> *test)
>>>>>>     	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>> 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>>     
>>>>>>     		drm_exec_unlock_obj(&exec, &gobj);
>>>>>>     		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>> @@ -110,13 +110,13 @@ static void test_duplicates(struct
>>>>>> kunit
>>>>>> *test)
>>>>>>     	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>>     
>>>>>>     		ret = drm_exec_lock_obj(&exec, &gobj);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>> @@ -137,7 +137,7 @@ static void test_prepare(struct kunit
>>>>>> *test)
>>>>>>     	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT,
>>>>>> 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = drm_exec_prepare_obj(&exec, &gobj, 1);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		KUNIT_EXPECT_EQ(test, ret, 0);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>> index 040dd142c49c..20ec1ab1b52d 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
>>>>>> @@ -200,7 +200,7 @@ static int handle_pagefault(struct xe_gt
>>>>>> *gt,
>>>>>> struct pagefault *pf)
>>>>>>     	drm_exec_init(&exec, 0, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = xe_pf_begin(&exec, vma, atomic, tile-
>>>>>>> id);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		if (ret)
>>>>>>     			goto unlock_dma_resv;
>>>>>>     
>>>>>> @@ -543,7 +543,7 @@ static int handle_acc(struct xe_gt *gt,
>>>>>> struct
>>>>>> acc *acc)
>>>>>>     	drm_exec_init(&exec, 0, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		ret = xe_pf_begin(&exec, vma, true, tile-
>>>>>>> id);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		ret = drm_exec_retry_on_contention(&exec,
>>>>>> ret);
>>>>>>     		if (ret)
>>>>>>     			break;
>>>>>>     	}
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> index e2ec148c9c33..335524e803e7 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_vm.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>>>>>> @@ -501,7 +501,7 @@ static void
>>>>>> preempt_rebind_work_func(struct
>>>>>> work_struct *w)
>>>>>>     		bool done = false;
>>>>>>     
>>>>>>     		err = xe_preempt_work_begin(&exec, vm,
>>>>>> &done);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		err = drm_exec_retry_on_contention(&exec,
>>>>>> err);
>>>>>>     		if (err || done) {
>>>>>>     			drm_exec_fini(&exec);
>>>>>>     			if (err &&
>>>>>> xe_vm_validate_should_retry(&exec, err, &end))
>>>>>> @@ -1052,7 +1052,7 @@ static void
>>>>>> xe_vma_destroy_unlocked(struct
>>>>>> xe_vma *vma)
>>>>>>     	drm_exec_init(&exec, 0, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		err = xe_vm_lock_vma(&exec, vma);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		err = drm_exec_retry_on_contention(&exec,
>>>>>> err);
>>>>>>     		if (XE_WARN_ON(err))
>>>>>>     			break;
>>>>>>     	}
>>>>>> @@ -2148,11 +2148,11 @@ static struct xe_vma *new_vma(struct
>>>>>> xe_vm
>>>>>> *vm, struct drm_gpuva_op_map *op,
>>>>>>     			err = 0;
>>>>>>     			if (!bo->vm) {
>>>>>>     				err =
>>>>>> drm_exec_lock_obj(&exec,
>>>>>> xe_vm_obj(vm));
>>>>>> -
>>>>>> 				drm_exec_retry_on_contention
>>>>>> (&
>>>>>> exec);
>>>>>> +				err =
>>>>>> drm_exec_retry_on_contention(&exec, err);
>>>>>>     			}
>>>>>>     			if (!err) {
>>>>>>     				err =
>>>>>> drm_exec_lock_obj(&exec,
>>>>>> &bo->ttm.base);
>>>>>> -
>>>>>> 				drm_exec_retry_on_contention
>>>>>> (&
>>>>>> exec);
>>>>>> +				err =
>>>>>> drm_exec_retry_on_contention(&exec, err);
>>>>>>     			}
>>>>>>     			if (err) {
>>>>>>     				drm_exec_fini(&exec);
>>>>>> @@ -2884,7 +2884,7 @@ static int
>>>>>> vm_bind_ioctl_ops_execute(struct
>>>>>> xe_vm *vm,
>>>>>>     		      DRM_EXEC_IGNORE_DUPLICATES, 0);
>>>>>>     	drm_exec_until_all_locked(&exec) {
>>>>>>     		err = vm_bind_ioctl_ops_lock_and_prep(&exec,
>>>>>> vm,
>>>>>> vops);
>>>>>> -		drm_exec_retry_on_contention(&exec);
>>>>>> +		err = drm_exec_retry_on_contention(&exec,
>>>>>> err);
>>>>>>     		if (err)
>>>>>>     			goto unlock;
>>>>>>     
>>>>>> diff --git a/include/drm/drm_exec.h b/include/drm/drm_exec.h
>>>>>> index aa786b828a0a..fafb40d96e38 100644
>>>>>> --- a/include/drm/drm_exec.h
>>>>>> +++ b/include/drm/drm_exec.h
>>>>>> @@ -51,6 +51,8 @@ struct drm_exec {
>>>>>>     	struct drm_gem_object *prelocked;
>>>>>>     };
>>>>>>     
>>>>>> +int drm_exec_handle_contended(struct drm_exec *exec);
>>>>>> +
>>>>>>     /**
>>>>>>      * drm_exec_obj() - Return the object for a give drm_exec
>>>>>> index
>>>>>>      * @exec: Pointer to the drm_exec context
>>>>>> @@ -113,15 +115,26 @@ __PASTE(__drm_exec_,
>>>>>> __LINE__):						\
>>>>>>     /**
>>>>>>      * drm_exec_retry_on_contention - restart the loop to grap
>>>>>> all
>>>>>> locks
>>>>>>      * @exec: drm_exec object
>>>>>> + * @_ret: The current error status
>>>>>>      *
>>>>>>      * Control flow helper to continue when a contention was
>>>>>> detected
>>>>>> and we need to
>>>>>>      * clean up and re-start the loop to prepare all GEM
>>>>>> objects.
>>>>>> + *
>>>>>> + * Return: If no loop restart occurred: The error status.
>>>>>>      */
>>>>>> -#define
>>>>>> drm_exec_retry_on_contention(exec)			\
>>>>>> -	do
>>>>>> {							\
>>>>>> -		if
>>>>>> (unlikely(drm_exec_is_contended(exec)))	\
>>>>>> -			goto
>>>>>> *__drm_exec_retry_ptr;		\
>>>>>> -	} while (0)
>>>>>> +#define drm_exec_retry_on_contention(exec,
>>>>>> _ret)			\
>>>>>> +	({						
>>>>>> 	
>>>>>> 	\
>>>>>> +		struct drm_exec *__exec =
>>>>>> (exec);			\
>>>>>> +		int __ret =
>>>>>> (_ret);					\
>>>>>> +							
>>>>>> 	
>>>>>> 	\
>>>>>> +		if (unlikely(drm_exec_is_contended(__exec)))
>>>>>> {		\
>>>>>> +			WARN_ON(__ret != -
>>>>>> EDEADLK);			\
>>>>>> +			__ret =
>>>>>> drm_exec_handle_contended(__exec);	\
>>>>>> +			if
>>>>>> (!__ret)					\
>>>>>> +				goto
>>>>>> *__drm_exec_retry_ptr;		\
>>>>>> +		}					
>>>>>> 	
>>>>>> 	\
>>>>>> +		__ret;					
>>>>>> 	
>>>>>> 	\
>>>>>> +	})
>>>>>>     
>>>>>>     /**
>>>>>>      * drm_exec_is_contended - check for contention

