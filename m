Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E4C9C426D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 17:14:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FA7210E166;
	Mon, 11 Nov 2024 16:14:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xQLl+7QP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A830310E12B;
 Mon, 11 Nov 2024 16:14:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHgljKBgf5Hv8ieh25d2brKD+zJxE/tckLYWcpa3r7aagTd55dpqQSgoFP029s1Wrm+6NlK4jSbajLEwDDKtDeDDVuP/7jrhO+KY6x2gmy1BY1T2FjrHIiM2EONcooPk/1Pt2nOiSRur6xUqJrx0ejcf1P41NVPsdOTcNZ3tpAjc9Tv+nlDKiamil/uop9hxfNqbcdaNoDrZw90dH1Gcwcd8g0OeWP2JmnLM4aFeivaqXpDBWNdd+b+z7E2z9oHbsCHK9TLWvWSphTGJwbgxkOU2rdd9NrotV0GyaKYNffJemUTd6CpYaJKE2TKfW231u7isjSClMK90ebNnIt8oOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRuaQcy7I6uaObg8voBHjTB8t4OQaZdqMM3aAHVXndQ=;
 b=MOgfWYsPc8CTejDIE7dYx/23DjxXuKrdSp/5OY5eWa7sMWpmnnx0RqrjqKzGWHx7ACnFUDCImUUOkXfHJLK2uIb/SKBVbjOxQKxlvAfrlBDi+zgo01mE3EmoAVaJdrw1QfI24F8cLg+9h7cPHJuiHU1Y3K6L7fPnpY7Kfd6Hi6yZCn3Z2y2su1KDcK2EhXF45le8ANLfb0ekln2/PSxniCF2lLw1MXtyqPZXL91x130bATuP8Y8ytbyMXLqrLbdZOcttF0+J/3gBMhIGqa/WW/HgSfQo1FDp2uFIPhZIqnz1vJ3o4HHlVOuv8F3u3+x+l/kmw3UeGYd5yDpj836DDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRuaQcy7I6uaObg8voBHjTB8t4OQaZdqMM3aAHVXndQ=;
 b=xQLl+7QPvkfOxSac+9bcBzmdteoyuosFFb43ENtQByH+F6iDhXo71YqB3pRz4ihJ81wVbVijsIhtM/VTmEg7KwHDixB5Y3eRqnKrHqL6FXLzVo3X/kVpTOKkeGXz2z36hKdIRY3W2JQjQK031JfcoAgx9rD+8zK9jHGbFijbIic=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7132.namprd12.prod.outlook.com (2603:10b6:806:2a4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 16:14:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.022; Mon, 11 Nov 2024
 16:14:03 +0000
Message-ID: <d45dc2fc-ae74-45f1-8428-0208cd68bffb@amd.com>
Date: Mon, 11 Nov 2024 17:13:58 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/8] drm/ttm: Add a virtual base class for graphics
 memory backup
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org,
 Paulo Zanoni <paulo.r.zanoni@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
References: <20241016085559.11840-1-thomas.hellstrom@linux.intel.com>
 <20241016085559.11840-3-thomas.hellstrom@linux.intel.com>
 <5b424798-832b-4489-b4b4-8dc53ad487cf@amd.com>
 <c87ed16d1a90d94a7381498b4425eb622ea0ff20.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <c87ed16d1a90d94a7381498b4425eb622ea0ff20.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0135.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: 023d16dc-15cf-475e-9262-08dd026bdc35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SmpBYXFCMEJuczNybVNlVTlBRWdtek9vTDZpTFE2STAzMVdZNEhCSHd5M3hS?=
 =?utf-8?B?SmowNDdvRk9VSUF1cUY1endNSS9ib2syem1WYnFEQnlqRGhNUVp6QTBlanly?=
 =?utf-8?B?YWw0Ky9RcENqNXR2S0JCNFkvM05DSElFTmFmdWxIUVhvd2RGNnJ0czNVRmsr?=
 =?utf-8?B?aDd1WGxmUmF5OVlSSUhEWHNxSnRjMERQTkFLYld1Tm0wQWE5d2NNbVpzV2d3?=
 =?utf-8?B?WERHMXc0UnRaWWVDK1NBeGszakw5SEY3ZzRIaCtUQzlkS0o1N2lxYThWdFNS?=
 =?utf-8?B?aFR4OXBMVkRFbVJTTmJ5T2VBL28reTZWNFFxcnNjRmFlcW1ndUhaWUpOQ1l0?=
 =?utf-8?B?a1VWaVZVVVB0cjBLNmhWeDNIK1BkL1h5cFNKQlhmVjVKeG4vRnUyaVB1SEVj?=
 =?utf-8?B?NFFmbUJpOTlQNUlwYjNMV3pIWlVrQkgxblk2UkVGSkhZVzRRV0VTekxwYjNP?=
 =?utf-8?B?aGFZSUtaY2J3MHRlallBbzI2alc1Sk1nYXF0QVQ4ei9INzd6SUZlZmVvNHFT?=
 =?utf-8?B?dGNONXZkYlVUanVIbXRVM1BDSUd6NDRSeHJSOThYVzNTUjAyZWUvcDFjcENT?=
 =?utf-8?B?RzJDYXZqZlI0N3VXMGVFa3ljcGxEL2lpVytGbTRoZmFpMzRYZ2FkSC9Lckxk?=
 =?utf-8?B?enBQa0R2Zi9YYWJGclRveTNITkdZejBiczJteER4cG9IOW9kZG1XYmtDbnZS?=
 =?utf-8?B?ejI4eHZwQ1U2WmhzSmlDMzZGRmxsMVZYQjR2NEdKZlZnVVd4TXNZSVVkbEoz?=
 =?utf-8?B?cDJhOW5zaE5ibWxhdkVBTTNhM2FlNFNtMEhjSVZiWkw1NENRK2JKN2lKSUZv?=
 =?utf-8?B?OWhwRXAxakVjeUprM3dlWHp3ekN0VVBmaFJiSWVWK01oUDdlOGNNUTQ0UVFE?=
 =?utf-8?B?clMxME4weTVUT0VCSnFpY1kzZ29mQnh3dzJTWkc2WU9nR1lpUGdSbExsbVNq?=
 =?utf-8?B?MHR4TWxRbklNZGkyWnBoaFNJS1U3SmhSTm5yR21HSXkwNVRreU1rRFdWMjV4?=
 =?utf-8?B?OTJhazBRd3ZRMDF4TEp2OXZmbmpnSDlqanhhMFY0KzJSLzltMCtkMkFBYVUr?=
 =?utf-8?B?SVhQRU1iM2l2TGpaZjNaM1k4K2lJcmdkb3BybXlRamJoL1RUMmIxV09Iek5G?=
 =?utf-8?B?ZlpxMm13dHFkVVd5QWF3MGtJb0VIRURNQ1ZIUHdsN0d1a2QxeW01bU9leTFp?=
 =?utf-8?B?cDdORFpZN1ZFMWpEdWpKdU9OV21KOVphZG1vOEV2UGhydTdXQ3k0YnpwRko1?=
 =?utf-8?B?MEh6Vkh0dlFwaDZtcHU5Sm9ZNlVYcHpBZ1hSSUhXak1JYXpHditXVUtvT1ZR?=
 =?utf-8?B?SUVBWFcxYjNwb2dNazlwRDNUbDJ6bUtMS1NrcnhaVEIwUkFGcTJsYzF6aW9R?=
 =?utf-8?B?NGV5R2dmMis2bWxmSTYyclJKbmU4ZTBrdFVueXNCcGdqZ0lJVVdYbnNuQU5o?=
 =?utf-8?B?dEcxRnhIQ29Gamo0d1Q0eXJ5NmNVR21FczI1N0x1NkRVeHNDYmRDaGFlelE2?=
 =?utf-8?B?b08wZks0OTZmdi9sZ0N1ZXZUQTdnRjNGSURHbW0zVDlpZ2daL0YzVkNSS1Fi?=
 =?utf-8?B?RVJTSjd5bHhwanlvc0dUVVorQTQxNDFSejBzR3VHZHlBOUxKR0V2d2UyOTVm?=
 =?utf-8?B?eFJWZWJtaXd0allEK2pKZnc3cUZqOXAyNGQ1eWVsMHlzTXE0Q044SWt0YnVm?=
 =?utf-8?B?ZmdkTnplVTJnbWlBQng1aEVLU2tLdG5ZTEo5N3dMUGo4Y1I4a1hjZjNsQ2JB?=
 =?utf-8?Q?SAjeU9498TW6WuVNS7/DYK5cK4WUUGTYVl90DM0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mk1uWUFBaHAwVzN2dDZkbisvYWJadFJwRFlTcHRGbHRHY2ZsY3JhL25EOTdJ?=
 =?utf-8?B?TStkVlhuakpYRmRvUVd0VVNYOGpEWFlBUnRzNjRYZFI1QVV2NDJWMGRvV001?=
 =?utf-8?B?VklJZ2JxK3hPNUZNSFFUeHAySHFvKzI1dHBXS09UU1YvYnVia2h4eFJVbmp4?=
 =?utf-8?B?NDNGUmxSbEdFZlZmTU5RRUhLV1Qwai9QQ1E2S2o4dktkVmpUdzQ5eklsUXl4?=
 =?utf-8?B?ZWp5SFZ5ZlBxa0JJZE9PZEUxLzFLUUtZS21uVHBOb211V3Bka2Jjd294c3BP?=
 =?utf-8?B?NnFPa3daWUYvdVdpVmtLTDNEdThBT2F3Sk5vWkQ0bTVHcndkRjdwMWJadVU4?=
 =?utf-8?B?NjMzOUFQdlZIQzRQYXVzMUMxcnRVWUV0V0Z4RzU5R0xCL0NkdjRxUStGYVlX?=
 =?utf-8?B?Vk1tT0ZZamdmRFc3SWZXbElzeVEvUStVdmQrSDMrNHo3M3l2OEpQRnNZQ1R1?=
 =?utf-8?B?UHRxQ1VHWEpUVERRMjJQdytoenlPWER5SHlLSGZnK24wcjhuc1FSeVZzNFJa?=
 =?utf-8?B?Ym1iNWdYU1pkcG9HQ0dTWFhseXcrbUhXc0RRTHprcW1ISWkzUmpYNlgxN25n?=
 =?utf-8?B?dFFzb1lLcnM4VWFScGZucndsK3VSZVdsb28ydEFMM3lOb2ptSm1EYmhZYkdq?=
 =?utf-8?B?bDBiL1pCVXR4R0RTS1cyMlBhYkRNdGczZ1RpSTM0MWxSRURYb0tmRklYZmR1?=
 =?utf-8?B?dGUxSHB3bHZ6RGM3cTNmZlZuT3RNT0c5eVBlbUVaVnlEMUloRS90S1F5ZFkz?=
 =?utf-8?B?UVlvNGpCeFZ6KzRldG1heXFkN3lHRFh0eWRNNGppR1F0bEhJeDV3NWd5cVY3?=
 =?utf-8?B?Y3JtOWY0RE8wakRhZ3VndnBWTkZ5M2g0aEJyUFJNRExmMGdtVnhEZ3BnQ05Y?=
 =?utf-8?B?TWdGYkVqbU5vYlRrOTJ3cklTSVNnZ29lSmJPQi9ZVXNFajRxVkpYQ2NYRnVl?=
 =?utf-8?B?NFd2dzd3aXI1bFN6R2xFUEdWcHpmQlh3Qm16UHppc3ZUZWJkT0pUTFVxMHV5?=
 =?utf-8?B?aGVNdWhreEJVclJEUytDUG11aG15VWc4Wk9mNTNyaEpvZnp3VmFGemErRU95?=
 =?utf-8?B?NWN1RWs0aXowNkx6bVZzQzRQb2pPRExiWHpmNTZyVXYrVHhGUWhvRXJrY1pP?=
 =?utf-8?B?WHRhZEkrb01rZTlJb3Q5S3RzZnpDSnJKeElTQXdhTmh2UTU3WEx3dEIwWGlo?=
 =?utf-8?B?M1VXbTdkZEtzMkxWMTNWdnpWR2hIdGR4MHNoWWZLMjFTMUNLNmdkd2cwUS9J?=
 =?utf-8?B?UUJlZGNGSnNzOStpSVRyQ3JGb3pqRXdYVktBT1pyNm9rcEFsWldRV1hFTEZt?=
 =?utf-8?B?VmhudEdENk5OdVlUVllMSjRIdnFsVURSb2RwQm9NUklzaUxXdHY1ZkUzMGdY?=
 =?utf-8?B?ZXhqUWdzWGEvTXJ5RER5MncwdWR3YXgySkdXQUtsbVRMdllXenkreWJsNzY2?=
 =?utf-8?B?enRnaFV3MlNmZjR4UENwMGNyejQ5dUVZaDBXSVg3a24vam5hdzBwTENleEg2?=
 =?utf-8?B?ZE5DRDAyTDBDNktjTjFwdWdwYmZIRW9TZHljdzF5QllWQlZmLzRVcFU4OVBn?=
 =?utf-8?B?emFFV0h5NE5DRE00SlhnZFpNUkd5ZkJFTEQ2SzVOOE5rZk1MdWcwWGpmWC9y?=
 =?utf-8?B?TDdBMHN4YzlDUHRFb1ZXMVdjRk0wZ3U0L0JqS3RGVG9RcDdpUno2WjlJUW8y?=
 =?utf-8?B?Tk5GZmhBREZCaThIMno4aGtnVU5CK2l6L2RUQ1NMeDRsOUZkV1EwaXg2dzd6?=
 =?utf-8?B?UlV6TTlTRXhNV2pZY1luamhNcmxwaXhqZWNEdDVnUitvaHI1RGpqR0xQRnFJ?=
 =?utf-8?B?ak9MYXdlNW9rKzhVR0lSRWdNQlNVTmYzMXpzcWhvR1BMNnRIK0s2SWZBWUcx?=
 =?utf-8?B?UmRXRDc4Q3pxajZlMDZhL283dVRqdEZpMHBvdFVtU1ZEVDI2cWVOV2VyR1hO?=
 =?utf-8?B?dXFhTURDOTdEVkRXb25UMUVDZjVwQ1cxZmNLemFQc1hlVW1KNHN0cmlhODIr?=
 =?utf-8?B?RlBaeEtCWnZiV3BaZ083K3d3RVJkSnlOYm5FOC91Q3BHNlVKQXoyd2ozdk16?=
 =?utf-8?B?UXBUZXdhTHUzQTFkQXFaQjdjRmR5YTVqRmRiRFIreE1EbzE0MU9Rb004WFRv?=
 =?utf-8?Q?R5XlgnyDW0PsMQmCf9RNegw0E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 023d16dc-15cf-475e-9262-08dd026bdc35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 16:14:03.7007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M3e8qCt71f99gaxXsOQTniS+0L+WvGX2DXm3GdUQGrmeiSvfTMjChMSFkAkf6geU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7132
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

Am 11.11.24 um 15:38 schrieb Thomas Hellström:
> On Fri, 2024-11-08 at 15:32 +0100, Christian König wrote:
>> Am 16.10.24 um 10:55 schrieb Thomas Hellström:
>>> Initially intended for experimenting with different backup
>>> solutions (shmem vs direct swap cache insertion), abstract
>>> the backup destination using a virtual base class.
>>>
>>> Also provide a sample implementation for shmem.
>> It feels a bit like overkill to have that abstraction.
>>
>>> While when settling on a preferred backup solution, one could
>>> perhaps skip the abstraction, this functionality may actually
>>> come in handy for configurable dedicated graphics memory
>>> backup to fast nvme files or similar, whithout affecting
>>> swap-space. Could indeed be useful for VRAM backup on S4 and
>>> other cases.
>> Why would we want to have the flexibility to use different backends?
>>
>> I mean that just sounds like one more thing which can break.
> Let me remove it. I took a stab at it some time ago, but didn't think
> the small LOC save was worth it, but people will keep wondering why
> it's there.
>
> If we add additional backends, (like separate GPU swapout to a user-
> provided fd) we can re-add it. Similarly for the direct-insert-to-swap-
> cache backend I have if we find out we need it anyway.

We actually used to have that with feature in Nouveau.

It was just broken at some point and we found that nobody used it 
(except for somebody being curios and trying it), so Ben and I agreed to 
remove it.

Anyway we can take care of that when the real world use case comes along.

Regards,
Christian.

>
>> On the other hand it's really nice that we now use folios instead of
>> pages.
>>
>>> v5:
>>> - Fix a UAF. (kernel test robot, Dan Carptenter)
>>> v6:
>>> - Rename ttm_backup_shmem_copy_page() function argument
>>>     (Matthew Brost)
>>> - Add some missing documentation
>>> v8:
>>> - Use folio_file_page to get to the page we want to writeback
>>>     instead of using the first page of the folio.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com> #v7
>>> ---
>>>    drivers/gpu/drm/ttm/Makefile           |   2 +-
>>>    drivers/gpu/drm/ttm/ttm_backup_shmem.c | 139
>>> +++++++++++++++++++++++++
>>>    include/drm/ttm/ttm_backup.h           | 137
>>> ++++++++++++++++++++++++
>>>    3 files changed, 277 insertions(+), 1 deletion(-)
>>>    create mode 100644 drivers/gpu/drm/ttm/ttm_backup_shmem.c
>>>    create mode 100644 include/drm/ttm/ttm_backup.h
>>>
>>> diff --git a/drivers/gpu/drm/ttm/Makefile
>>> b/drivers/gpu/drm/ttm/Makefile
>>> index dad298127226..5e980dd90e41 100644
>>> --- a/drivers/gpu/drm/ttm/Makefile
>>> +++ b/drivers/gpu/drm/ttm/Makefile
>>> @@ -4,7 +4,7 @@
>>>    
>>>    ttm-y := ttm_tt.o ttm_bo.o ttm_bo_util.o ttm_bo_vm.o ttm_module.o
>>> \
>>>    	ttm_execbuf_util.o ttm_range_manager.o ttm_resource.o
>>> ttm_pool.o \
>>> -	ttm_device.o ttm_sys_manager.o
>>> +	ttm_device.o ttm_sys_manager.o ttm_backup_shmem.o
>>>    ttm-$(CONFIG_AGP) += ttm_agp_backend.o
>>>    
>>>    obj-$(CONFIG_DRM_TTM) += ttm.o
>>> diff --git a/drivers/gpu/drm/ttm/ttm_backup_shmem.c
>>> b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
>>> new file mode 100644
>>> index 000000000000..cfe4140cc59d
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/ttm/ttm_backup_shmem.c
>>> @@ -0,0 +1,139 @@
>>> +// SPDX-License-Identifier: MIT
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#include <drm/ttm/ttm_backup.h>
>>> +#include <linux/page-flags.h>
>>> +
>>> +/**
>>> + * struct ttm_backup_shmem - A shmem based ttm_backup subclass.
>>> + * @backup: The base struct ttm_backup
>>> + * @filp: The associated shmem object
>>> + */
>>> +struct ttm_backup_shmem {
>>> +	struct ttm_backup backup;
>>> +	struct file *filp;
>>> +};
>>> +
>>> +static struct ttm_backup_shmem *to_backup_shmem(struct ttm_backup
>>> *backup)
>>> +{
>>> +	return container_of(backup, struct ttm_backup_shmem,
>>> backup);
>>> +}
>>> +
>>> +static void ttm_backup_shmem_drop(struct ttm_backup *backup,
>>> unsigned long handle)
>>> +{
>>> +	handle -= 1;
>> Why that? I've seen that multiple times in this patch but can't find
>> a
>> good explanation for it.
> It's a mapping from backup interface handles to shmem offsets. Needed
> because interface handle == 0 means error (which is inherited from
> swp_entry_t).
>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> +	shmem_truncate_range(file_inode(to_backup_shmem(backup)-
>>>> filp), handle,
>>> +			     handle + 1);
>>
>>> +}
>>> +
>>> +static int ttm_backup_shmem_copy_page(struct ttm_backup *backup,
>>> struct page *dst,
>>> +				      unsigned long handle, bool
>>> intr)
>>> +{
>>> +	struct file *filp = to_backup_shmem(backup)->filp;
>>> +	struct address_space *mapping = filp->f_mapping;
>>> +	struct folio *from_folio;
>>> +
>>> +	handle -= 1;
>>> +	from_folio = shmem_read_folio(mapping, handle);
>>> +	if (IS_ERR(from_folio))
>>> +		return PTR_ERR(from_folio);
>>> +
>>> +	/* Note: Use drm_memcpy_from_wc? */
>>> +	copy_highpage(dst, folio_file_page(from_folio, handle));
>>> +	folio_put(from_folio);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static unsigned long
>>> +ttm_backup_shmem_backup_page(struct ttm_backup *backup, struct
>>> page *page,
>>> +			     bool writeback, pgoff_t i, gfp_t
>>> page_gfp,
>>> +			     gfp_t alloc_gfp)
>>> +{
>>> +	struct file *filp = to_backup_shmem(backup)->filp;
>>> +	struct address_space *mapping = filp->f_mapping;
>>> +	unsigned long handle = 0;
>>> +	struct folio *to_folio;
>>> +	int ret;
>>> +
>>> +	to_folio = shmem_read_folio_gfp(mapping, i, alloc_gfp);
>>> +	if (IS_ERR(to_folio))
>>> +		return handle;
>>> +
>>> +	folio_mark_accessed(to_folio);
>>> +	folio_lock(to_folio);
>>> +	folio_mark_dirty(to_folio);
>>> +	copy_highpage(folio_file_page(to_folio, i), page);
>>> +	handle = i + 1;
>>> +
>>> +	if (writeback && !folio_mapped(to_folio) &&
>>> folio_clear_dirty_for_io(to_folio)) {
>>> +		struct writeback_control wbc = {
>>> +			.sync_mode = WB_SYNC_NONE,
>>> +			.nr_to_write = SWAP_CLUSTER_MAX,
>>> +			.range_start = 0,
>>> +			.range_end = LLONG_MAX,
>>> +			.for_reclaim = 1,
>>> +		};
>>> +		folio_set_reclaim(to_folio);
>>> +		ret = mapping->a_ops-
>>>> writepage(folio_file_page(to_folio, i), &wbc);
>>> +		if (!folio_test_writeback(to_folio))
>>> +			folio_clear_reclaim(to_folio);
>>> +		/* If writepage succeeds, it unlocks the folio */
>>> +		if (ret)
>>> +			folio_unlock(to_folio);
>>> +	} else {
>>> +		folio_unlock(to_folio);
>>> +	}
>>> +
>>> +	folio_put(to_folio);
>>> +
>>> +	return handle;
>>> +}
>>> +
>>> +static void ttm_backup_shmem_fini(struct ttm_backup *backup)
>>> +{
>>> +	struct ttm_backup_shmem *sbackup =
>>> to_backup_shmem(backup);
>>> +
>>> +	fput(sbackup->filp);
>>> +	kfree(sbackup);
>>> +}
>>> +
>>> +static const struct ttm_backup_ops ttm_backup_shmem_ops = {
>>> +	.drop = ttm_backup_shmem_drop,
>>> +	.copy_backed_up_page = ttm_backup_shmem_copy_page,
>>> +	.backup_page = ttm_backup_shmem_backup_page,
>>> +	.fini = ttm_backup_shmem_fini,
>>> +};
>>> +
>>> +/**
>>> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
>>> + * @size: The maximum size (in bytes) to back up.
>>> + *
>>> + * Create a backup utilizing shmem objects.
>>> + *
>>> + * Return: A pointer to a struct ttm_backup on success,
>>> + * an error pointer on error.
>>> + */
>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size)
>>> +{
>>> +	struct ttm_backup_shmem *sbackup =
>>> +		kzalloc(sizeof(*sbackup), GFP_KERNEL |
>>> __GFP_ACCOUNT);
>>> +	struct file *filp;
>>> +
>>> +	if (!sbackup)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	filp = shmem_file_setup("ttm shmem backup", size, 0);
>>> +	if (IS_ERR(filp)) {
>>> +		kfree(sbackup);
>>> +		return ERR_CAST(filp);
>>> +	}
>>> +
>>> +	sbackup->filp = filp;
>>> +	sbackup->backup.ops = &ttm_backup_shmem_ops;
>>> +
>>> +	return &sbackup->backup;
>>> +}
>>> +EXPORT_SYMBOL_GPL(ttm_backup_shmem_create);
>>> diff --git a/include/drm/ttm/ttm_backup.h
>>> b/include/drm/ttm/ttm_backup.h
>>> new file mode 100644
>>> index 000000000000..5f8c7d3069ef
>>> --- /dev/null
>>> +++ b/include/drm/ttm/ttm_backup.h
>>> @@ -0,0 +1,137 @@
>>> +/* SPDX-License-Identifier: MIT */
>>> +/*
>>> + * Copyright © 2024 Intel Corporation
>>> + */
>>> +
>>> +#ifndef _TTM_BACKUP_H_
>>> +#define _TTM_BACKUP_H_
>>> +
>>> +#include <linux/mm_types.h>
>>> +#include <linux/shmem_fs.h>
>>> +
>>> +struct ttm_backup;
>>> +
>>> +/**
>>> + * ttm_backup_handle_to_page_ptr() - Convert handle to struct page
>>> pointer
>>> + * @handle: The handle to convert.
>>> + *
>>> + * Converts an opaque handle received from the
>>> + * struct ttm_backoup_ops::backup_page() function to an (invalid)
>>> + * struct page pointer suitable for a struct page array.
>>> + *
>>> + * Return: An (invalid) struct page pointer.
>>> + */
>>> +static inline struct page *
>>> +ttm_backup_handle_to_page_ptr(unsigned long handle)
>>> +{
>>> +	return (struct page *)(handle << 1 | 1);
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_page_ptr_is_handle() - Whether a struct page pointer
>>> is a handle
>>> + * @page: The struct page pointer to check.
>>> + *
>>> + * Return: true if the struct page pointer is a handld returned
>>> from
>>> + * ttm_backup_handle_to_page_ptr(). False otherwise.
>>> + */
>>> +static inline bool ttm_backup_page_ptr_is_handle(const struct page
>>> *page)
>>> +{
>>> +	return (unsigned long)page & 1;
>>> +}
>>> +
>>> +/**
>>> + * ttm_backup_page_ptr_to_handle() - Convert a struct page pointer
>>> to a handle
>>> + * @page: The struct page pointer to convert
>>> + *
>>> + * Return: The handle that was previously used in
>>> + * ttm_backup_handle_to_page_ptr() to obtain a struct page
>>> pointer, suitable
>>> + * for use as argument in the struct ttm_backup_ops drop() or
>>> + * copy_backed_up_page() functions.
>>> + */
>>> +static inline unsigned long
>>> +ttm_backup_page_ptr_to_handle(const struct page *page)
>>> +{
>>> +	WARN_ON(!ttm_backup_page_ptr_is_handle(page));
>>> +	return (unsigned long)page >> 1;
>>> +}
>>> +
>>> +/** struct ttm_backup_ops - A struct ttm_backup backend operations
>>> */
>>> +struct ttm_backup_ops {
>>> +	/**
>>> +	 * drop - release memory associated with a handle
>>> +	 * @backup: The struct backup pointer used to obtain the
>>> handle
>>> +	 * @handle: The handle obtained from the @backup_page
>>> function.
>>> +	 */
>>> +	void (*drop)(struct ttm_backup *backup, unsigned long
>>> handle);
>>> +
>>> +	/**
>>> +	 * copy_backed_up_page - Copy the contents of a previously
>>> backed
>>> +	 * up page
>>> +	 * @backup: The struct backup pointer used to back up the
>>> page.
>>> +	 * @dst: The struct page to copy into.
>>> +	 * @handle: The handle returned when the page was backed
>>> up.
>>> +	 * @intr: Try to perform waits interruptable or at least
>>> killable.
>>> +	 *
>>> +	 * Return: 0 on success, Negative error code on failure,
>>> notably
>>> +	 * -EINTR if @intr was set to true and a signal is
>>> pending.
>>> +	 */
>>> +	int (*copy_backed_up_page)(struct ttm_backup *backup,
>>> struct page *dst,
>>> +				   unsigned long handle, bool
>>> intr);
>>> +
>>> +	/**
>>> +	 * backup_page - Backup a page
>>> +	 * @backup: The struct backup pointer to use.
>>> +	 * @page: The page to back up.
>>> +	 * @writeback: Whether to perform immediate writeback of
>>> the page.
>>> +	 * This may have performance implications.
>>> +	 * @i: A unique integer for each page and each struct
>>> backup.
>>> +	 * This is a hint allowing the backup backend to avoid
>>> managing
>>> +	 * its address space separately.
>>> +	 * @page_gfp: The gfp value used when the page was
>>> allocated.
>>> +	 * This is used for accounting purposes.
>>> +	 * @alloc_gfp: The gpf to be used when the backend needs
>>> to allocaete
>>> +	 * memory.
>>> +	 *
>>> +	 * Return: A handle on success. 0 on failure.
>>> +	 * (This is following the swp_entry_t convention).
>>> +	 *
>>> +	 * Note: This function could be extended to back up a
>>> folio and
>>> +	 * backends would then split the folio internally if
>>> needed.
>>> +	 * Drawback is that the caller would then have to keep
>>> track of
>>> +	 * the folio size- and usage.
>>> +	 */
>>> +	unsigned long (*backup_page)(struct ttm_backup *backup,
>>> struct page *page,
>>> +				     bool writeback, pgoff_t i,
>>> gfp_t page_gfp,
>>> +				     gfp_t alloc_gfp);
>>> +	/**
>>> +	 * fini - Free the struct backup resources after last use.
>>> +	 * @backup: Pointer to the struct backup whose resources
>>> to free.
>>> +	 *
>>> +	 * After a call to @fini, it's illegal to use the @backup
>>> pointer.
>>> +	 */
>>> +	void (*fini)(struct ttm_backup *backup);
>>> +};
>>> +
>>> +/**
>>> + * struct ttm_backup - Abstract a backup backend.
>>> + * @ops: The operations as described above.
>>> + *
>>> + * The struct ttm_backup is intended to be subclassed by the
>>> + * backend implementation.
>>> + */
>>> +struct ttm_backup {
>>> +	const struct ttm_backup_ops *ops;
>>> +};
>>> +
>>> +/**
>>> + * ttm_backup_shmem_create() - Create a shmem-based struct backup.
>>> + * @size: The maximum size (in bytes) to back up.
>>> + *
>>> + * Create a backup utilizing shmem objects.
>>> + *
>>> + * Return: A pointer to a struct ttm_backup on success,
>>> + * an error pointer on error.
>>> + */
>>> +struct ttm_backup *ttm_backup_shmem_create(loff_t size);
>>> +
>>> +#endif

