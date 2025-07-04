Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EC8AF8ED8
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 11:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06AE610E2AE;
	Fri,  4 Jul 2025 09:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ws8NfgEG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF0E10E2AE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 09:39:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m2BeslEOx5klMpLL+gGyVWCjugTYbbB5XTwd2AOatx0M1ytuJ+FShw7dNtBOtjItIgpliZpM2DZUgOkyhZ5yztQ5/PQIk8+q/2hernMB4KBcR2IqbPE+fHSjX5dEe7bPyqLpJpQ2u60v7AIg82fuO6iRO6DGh2aPRrqsKiw95kbbTiXSGD/xwU+koKT2W5iCsocjGPYu/YqAJSAwEsXy268aIjJpQe6IKBWWrLCz3Ca/5bwX859TKh2LNXo2/RWc76gkMw1Fuvr3313ZX4QBil/Ctwlyk3vZXAY8IYUEUmfplW1damouy+VdAWY9HjZZxeQdLYhxw5Zp7J5v5sOnlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+nEEFK7daz84XxWlVpc4cA0ANfLZ/d0lIPrmkjlv6fg=;
 b=ebBoM0dLw38GEU0JXJ8N7pCqsnUSsBNIPQ4GhTpT/2UIjmCBeTOAnBFRj1j3LhZwTs8DM7HK/nSp+cAoH26g7WVVaJ7RveI8Njw+1SEcTDw1d11IXF8HR8xJWQojqPfkq8lHED/NACTSmR8GdRIULp+Qz6MGpWXS/HEIF2j2C0kNgzBkR9W6se5fwyXLFeFvfShxVEZli3pY7QEMAKyDVvU9rxmKOaUFjMTat/D5FMp7WTIkxAF//FJVsWOoE53z6DZZlYvjFNP9vTxINTd5hQrF05ceCH7LDhoY8qBZU9JOowo+UE4c5tgASDXnLKxNYLNCKraK3PkuswZQzXV5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+nEEFK7daz84XxWlVpc4cA0ANfLZ/d0lIPrmkjlv6fg=;
 b=ws8NfgEGR0R0n93HHVAKpRekR5bmP1LKAj0ELxq1k7Lt9tesCDK7wtE2bM/sZfG37xBv3qGBo6gmCgs3WKzc/FA3MGr3S6FLpY/yjKdbrHPxyRyaAR95ACHi296ywgLyo17gHAXFpf2GeCgv6qJv4gAyW1vjHsvfzCb16bmblo0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB5713.namprd12.prod.outlook.com (2603:10b6:208:370::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 09:39:16 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 09:39:16 +0000
Message-ID: <b744ccc3-1660-4274-8795-6be21c94beaa@amd.com>
Date: Fri, 4 Jul 2025 11:39:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/17] amdgpu: add support for memory cgroups
To: David Airlie <airlied@redhat.com>, Shakeel Butt <shakeel.butt@linux.dev>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Johannes Weiner <hannes@cmpxchg.org>,
 Dave Chinner <david@fromorbit.com>, Kairui Song <kasong@tencent.com>
References: <20250630045005.1337339-1-airlied@gmail.com>
 <20250630045005.1337339-18-airlied@gmail.com>
 <wejb2ykaltp5gtufrzz3mwp43hrxugzuubclt4amrpr4koznan@cb7dfmnvik6a>
 <CAMwc25rPTiTshBMvHeGr=8kwC+MJdSA=UdKucybTwSxbuWvk4A@mail.gmail.com>
 <3b5t4djauhnbvhqjwuktrcphlvahpdyi2b6j3ktoapakxcvpgz@zjpokeykiwy7>
 <0b887b01-6de3-4633-86f7-20f5b43eeb35@amd.com>
 <jsmwlcpgsmhkwohao6t5eu3mhypumuqp2pvtbxxkkchivbg4vp@i4pcdsq5xflq>
 <CAMwc25pTVMqF6j+Fb7CQr1HGn6kGvdMquSzzYYbP4vs4RvBMnQ@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25pTVMqF6j+Fb7CQr1HGn6kGvdMquSzzYYbP4vs4RvBMnQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB5713:EE_
X-MS-Office365-Filtering-Correlation-Id: 36168158-9de4-45e6-0c56-08ddbadea47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VS9LMG5yS0hNcHBJektESHlkSERBUXc0S0xWZEFObHBuRUllY1hiZGdzVlVl?=
 =?utf-8?B?dzYyQ3plK25NWFZOcSsyWElJdjFhYVVadFJFU3BTaEpLR01zNXUvV3cxYk9E?=
 =?utf-8?B?SkRmZE84MXBYbHJrNUFlTkxBZXQwZUdNZEZPV2cxdUgrSFViTE94UXAvZFht?=
 =?utf-8?B?WHdvNHdvN1VseDV2ak43NmVEL2ZkTXZaL2hvaHhkLzkydWlENjMxYnp2em5U?=
 =?utf-8?B?aDlkS3p1bmpTQkg3YWdtWmV1aW0wSHBvbEYyemVTajJxdWFKUW81c3p1R3hF?=
 =?utf-8?B?M3B0V1JLdHlkT2lYZ3U2bVlqNDI4b01TSlhVeW1YbGROUzltTHU5UHJ1dVI5?=
 =?utf-8?B?VG52L29raC8rdnhIU3RiUjZNMWpWT3R2WitYOVlNcC96dFdYc0hwck9PeGUx?=
 =?utf-8?B?akhIRjFrN1F0cWs4U1pPRG1CSC9taDEwd1FwSGlCUTNxRE40MWpWbXoxZEZv?=
 =?utf-8?B?ODlWL1N6dTBVMDVvQXlIT2NLL0FlTHBtd3RqMDh0U1pQWWFwZFJ3aVZCcnRF?=
 =?utf-8?B?ekQwWS9qcHBQdDNxZER2aDZkem9TSW1wT2FTYXA2c2VLeFRSZnNoWGVmWUhP?=
 =?utf-8?B?R0Jtb1pSZ3FudXhiT1kzdjFiaXVpeGxvMFZ6R0k4MG5NOUFZTzZ4azI4TkZZ?=
 =?utf-8?B?aTlwNzAxNytKY1d4ditWMlhrRWE2R1VRcDREUWRVdnlBZWw1NzdRMStvRjRh?=
 =?utf-8?B?TUtwbHMxUmpSQjlnajVuekNXVVlJUFpMYjMyRTRsNjlCQ0wvV3ZxcWRBOTJQ?=
 =?utf-8?B?bVBzUFV5VmwreUlOSStRbkVVdlVBbVhYajVrS3JCYk9FdWFiS2c1SVhjOHdB?=
 =?utf-8?B?eEcvRENwTnN6WERSeUh6NzRwODV4RSs4RFFUQ2hsNzUwVFk2QkxpRlhQT29W?=
 =?utf-8?B?RExkcENHMFB4dDdPKzArRkNwazVxNVZaOE1VTGZ0eTZGMzlySS94d0lmMEpT?=
 =?utf-8?B?NzB3MDY4WHBNY0NseWFmaytDZ2FGa0swaVZpZld5d2VCS3pVRExyT0Z6ZVRm?=
 =?utf-8?B?YTBNUUtrNlJCK1hIL0xKTWdVNmFUSHp6bmFUUDJSdkRvTGN1ZTVLZ2RicVZn?=
 =?utf-8?B?aUtwR0JGc2FWaDRNcndqNVpPN0k1WGlUSGljbERqT2xuMXY0RnVOQnNocnhG?=
 =?utf-8?B?T1ZoUkxjVGVpM3VwdGgwSWdGaHgwdGpDbElGR0VwM1lTS0V0VCtIM28vRW4x?=
 =?utf-8?B?aXBnWmg2M1RnVGVLdlp0OVE0YzJmYzJJTDlkRTdGZXRTbXpOWmNRV2hRTjFt?=
 =?utf-8?B?dTRHUmYxQnBpeWJybmxUU3lHTzVaQSs5UEtxa21oOEs3YmdtMzJLZlFoQVpS?=
 =?utf-8?B?TlpCYTU2OWV6cVV6Y281YmNabElUdFY5enJJcFZlUGpERm94MXVHaGo5ZERN?=
 =?utf-8?B?MWZ0ZVZXMDVCVzUrMTZlUW00V1AvVWIydGs2NXhrWFRlUVBxeHlEZG1Kc3NN?=
 =?utf-8?B?dDEwU25EWk02SWdFYWUvaUYvQUdqV3JBVnJaeXRJbEp3ZFU2MFpFVzNxblY5?=
 =?utf-8?B?K3NDQjVnK08vdGdWbENoRmxDN25JZnhKV042ekZGdEx5OGxsdnBqTm9jakV0?=
 =?utf-8?B?R2hLVVV2UFRVdGtHb2NkYkxsSlhDOGFvTU9sN2Zqd2tDVGNrSm1EV01mbStV?=
 =?utf-8?B?L0Q1QnpOTXI4WWd6KzgwM3dFNUpibzNvS3lya1BqME91WGpnLzhaL25qWWo2?=
 =?utf-8?B?UFlLUzVtU3Q2ZDVFa1A5VGE1RktnUmtzV2NwKzRuNUx1U2NhMjNlNWZuZGo0?=
 =?utf-8?B?MjNUUDNNQWFDbnpKNnVRQi9qS0lGVDlJYkZIcXIwYVdxVUZEd0trMlpHVWYx?=
 =?utf-8?B?RXFiai9kSkhCZXZROGUyL3pUMWpmbk5qUjVGaC9zcGYwZWpxSkM5UFlmNTN2?=
 =?utf-8?B?NjJlOVpRK1pxazBNY3E1aDlWTUQ3MmJuZXNWWVBHb0ZaMmJPckdoSEF1Tktr?=
 =?utf-8?Q?HeJtzr3Bgaw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHB5eVdERlpHNzZwZ0xrT29qTkk3SGpCOU9QYTBlcGYyUG13VlVEOWdobjBN?=
 =?utf-8?B?czg5NHhEZCtRRUNBcTB6WktVTkd0OThtNUMwaWdtQ1huV2hCVlRRbUE2c2hH?=
 =?utf-8?B?Yk1DOXdDZHoxcEJ6a2ZseitKZzBJQnVHMTlVMlJXUjkrQ0s2NEZTRnZJRFM1?=
 =?utf-8?B?cmNtWlVUYTVxcEh2Wm1zZzlidGN2MHhWekdRZ3I0dUNQN0xZSzExeWd1N1gy?=
 =?utf-8?B?Z2lPeW9ISVhGajFJVHB4aE13Rmk1MUpzTmtpSkxHSTJSd3VWODVlZ3BvamRl?=
 =?utf-8?B?T0UvaEMzdExjOVBFc1lHTWNmb1dreHozak5Kc096RmlpZE9FUVl3dnd2ZWdV?=
 =?utf-8?B?Vk04YkFGZEo5bG5OMWpkWVV6MWFKYVA5anphVllZMzdGd1RNRUtqajdsenR0?=
 =?utf-8?B?T2IxdVpXWkEreU1qbE5zS3RSSWRyRUs4OXNNSENmbldaU1N5R21GVkp2Vmgy?=
 =?utf-8?B?MVhWdTJjdGhPSDhwV1JrL3c2aDlmVG8xcmpUdUdXOTh1TmlZUCtaVkpyaUV1?=
 =?utf-8?B?TFpFd3N6dm00RGJwUDR3MEJPcG5HTWZrU21pYnpuVnZydzNkVjFSQjAycjBC?=
 =?utf-8?B?NHRXdjVDSTR5TE51NHNBVjZzK0Z3azg5cTJnZEVSOEpoLzZ5bTJTelg5MllR?=
 =?utf-8?B?WnY5d3ZVY1ZKUEQ2R0NZdzZXMGgyWWF4bkVEd1c2Y0Y0eHlZTVh2aktKZjRv?=
 =?utf-8?B?TnVNWVkxS1ZyMnllWjBvS2pjNmdsRUFWV1d6T2E5Z3hEdDF4MlRhdDBYRjBK?=
 =?utf-8?B?ZXBNeWcyamhtY1VvRmZmcks0NytCVGpGTjBJZzNxdWQwdzJRVVlJYmE0NkI2?=
 =?utf-8?B?dlJHSjZPWWZyZEFGaUg5WTJobXh4eHRycHQvZDRrU1JMbTN5b2FIZ1k2M1J5?=
 =?utf-8?B?RWpFZUQyVUV3S1Q5WTFKYnh0ZnVQWDZpNzJmeExJKzQ0dVZucXlSTEV0TVAy?=
 =?utf-8?B?T3NwaURoVzNwNmRmbTZOS0g1RnBVNzgzVnYrMlNjaUVpUEFuS0x6QW9LU1Nt?=
 =?utf-8?B?SmhrYWU2WGQrampVOTU0bE5teU5nUnZ4K08zMzN6NThiZ3FVR1ZnT1pvMDhp?=
 =?utf-8?B?MW5UYXM3RUlDUmYvT0Jaamx2b09qaGRmRzVIRS9FWkJQU0xyaWYzaUlZUWMr?=
 =?utf-8?B?U2RnNHo3dnU1WHlpek9KNjcvSzB6SjByWGNuRGlGdmdpK2xSU1crZi9EMUU4?=
 =?utf-8?B?empvcmYyMEFBTUtQelQ4UVdVM2dPTDZFVmEyOE5mRHg0bENETzU5ZEI5aEwz?=
 =?utf-8?B?Q0xGUHFiQVRkU0ZCU3Q0c1huN2VJVS91MVpDY0x4Zm94Y0orOHpEWjFBdmls?=
 =?utf-8?B?Rlp5cXNBOC8rNDlEZHJ2MU1pWHNLRHRuUkxXRWpoNGRYbzNSbzZpKzg4RXZt?=
 =?utf-8?B?TlErSHluYzQ3Q094aGRLWjNuQ0FVMHhnRWptaU9tZ2ZWTThxTkVrRklUUUwv?=
 =?utf-8?B?REJJUktqZUJLZnNoMVJiNlVBa01kQjhseXNNVCtLZ0VWRzd6Q3hFYXRKbXhr?=
 =?utf-8?B?bTRxUjF1NklxTVVMb3RJYkI5SVl4Ym9XYkZ0aGNFbGxIellQcTFhRXBIRmFM?=
 =?utf-8?B?SjJ2dy9obFNrNlE0STZzd0k2TmIwSVJrRFBaY1ZPR1dDaVFlU2E2SktmUXNk?=
 =?utf-8?B?SDQ3cURpTDlQT0RtNk96YmwzMHRGaWZZelAxK2hKM3YvNHIvU1FHTkNJSVNj?=
 =?utf-8?B?SEk4UGp1UTlWTlBRS1g0Uzk0djJtQUwwWEF0SEtIWjNsV2RlZVBzK0xxbjNN?=
 =?utf-8?B?ZExHekphZTZSZ0tZeVZGVmptTEdROHpVTFdFeUpoRXhreklUNWFTQmE5YjlY?=
 =?utf-8?B?UXhnUTZUUlBkVURiSlNBUER3bzhnMkZjOHBFcHNiUTFZeVY4L3dwaU5BR0x2?=
 =?utf-8?B?eDBkYlNuRU5GSjVSalhwUVBLellUMHB2cGowU3N6RExGZGdURVRPZlRKYlVs?=
 =?utf-8?B?OXdSWExUNUxDVWpJcUw0eFBIN0xGRnpoTW02eDZBTHZoR1FmZytRYmt1RVhj?=
 =?utf-8?B?TUxCcWpCVVA1S2kyYm5pOWFTYzhtd2dEeCtOSnlTS2ZLYW8ydXozbjNmV3JW?=
 =?utf-8?B?a3NNZUNvT1J4UlQ0NDZndkZld2FSeWRldzJZcTBCR2t4TVQyRGRzSVh2TlNY?=
 =?utf-8?Q?ACXfFGyysC9VtJvcV8IMzHK+2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36168158-9de4-45e6-0c56-08ddbadea47f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 09:39:16.3742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Od4QqvlKNIcayPUSPJHqEtGWk9PnJgyrM4o8t+8T5lD96fkMJje8w6o5OCgm5KAd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5713
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

On 03.07.25 23:22, David Airlie wrote:
>>
>> Do you mean a task in cgroup A does amdgpu_gem_object_create() and then
>> the actual allocation can happen in the task in cgroup B?
> 
> On android and in some graphics scenarios, this might happen, not sure
> if it does always though. We have scenarios where a display server
> allocate a buffer for an application to write into and then it
> displays it, the ownership of that buffer can be a big rough.

Yeah those use cases exists but are rather uncommon.

Also please keep in mind that Android has it's completely own way of memory management. It would be great if we could unify that with cgroups in the future as well, but that is not the task at hand.

> But in most scenarios I think it'll be the same cgroup, and I think we
> generally should account it to the original cgroup unless we
> explicitly move the object to another one, (which we haven't got any
> code for yet).

We just need to make sure that we don't create the possibility for a deny of service.

For example something we clearly can't do is client creates a buffer but doesn't touch it in any way, and then server receives the buffer and is forced into an OOM situation because it is the first one who's touching it.

>>>
>>> BTW: It might be a good idea to not only limit the amount of memory you actually have allocated, but also how much you wanted to allocate.
>>
>> Do you mean accounting and limiting the reservations? Something like
>> what hugetlb cgroup provides?

Yes, exactly that. Basically a limit on how much a process can over-commit those buffers.

Regards,
Christian.

>>
> 
> I'll let Christian answer that,
> Dave.
> 

