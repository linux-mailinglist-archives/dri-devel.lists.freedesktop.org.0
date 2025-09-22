Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13658B915F9
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 15:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6017A10E4A6;
	Mon, 22 Sep 2025 13:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fxxQuRYu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011059.outbound.protection.outlook.com [52.101.52.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7254110E1BD;
 Mon, 22 Sep 2025 13:20:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVcFlilmdtUp4/GrhUzzggrjWAfKTVIQEC+DhV0kVf7tWvGJwuzW2Bu4cywjnGFJOCjTTuwU4k4TLcDivi1H8XJ+yikIF5t6VipRJDVjIewA3ZUGVP7oOOfGwPNhAf1CaSBlLWJglGZbBIkzUeYEh/cRNi7XSMLDGZ2BrgACtnnhDLY25fJGpBTNADLx0PFLrUdg8/HRQJOWuI6NEOlbQmloQnG6ler9LRY+iN5uIxm4VM27f26LLvDbz2abuyxOGPa1usn1Wi7CKJrH6lB/NxwKRxvLxdgCMRvuW/CtdyaFHUychWBQZP8Fk4crugFfrkFH10G8yX3sesmahTgkkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E89xGzilePFqMrpF4Tfmclb8RApMYqmbMvNKvaUuP9M=;
 b=MaC4KprQ8jcsu7IyhKGq3A/Sn1ZeaNLEgzasPEPXqgt3jyjw5jM0bYP9ULAUKf4Ex7kK0x+QWxYhpu6DWDkvUKD9CLJK6XpQyPHNPug5IfHLKBoXrmmEg3oiHn93mu/hDGlCkqgsVJ6Hz6a1dncw1j5FHXOk5arEulker9+vMb5aHXIUYcFIa+Cu67yRnU6QLDCCiL2e/YiBHXwf2u1ehuBps9bq+QdvuhQWiBSvVJGkje2ISxPac5r8PjbDs03kP8WLTZt3AUKwWO6eUqr5kDqngtagd4ugXD2wEXgoAwt+9Ma/sb2ij/8yaXvejudfjKmAF82qGqF9CsEg2HO2dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E89xGzilePFqMrpF4Tfmclb8RApMYqmbMvNKvaUuP9M=;
 b=fxxQuRYuwfB1y9GE4sXuMg3bXGJhClxLb3SIJGkRpVWyNvbUXskYHozuT0o2Qy0yFhnLIM17TtpBqvP+8JCF56FIoUBIvAHMJOtPOxquFreF/WxxxFjX3vYjVcn7wpPvp1wI3cRvFMks5Cx1D3/GD2WGOpeb+KeCwPDu2/BGw6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB7019.namprd12.prod.outlook.com (2603:10b6:510:1b9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 13:20:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:20:53 +0000
Message-ID: <fbb6bbe7-8141-4532-812e-2b93cc2fcb1b@amd.com>
Date: Mon, 22 Sep 2025 15:20:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] PCI/P2PDMA: Don't enforce ACS check for device
 functions of Intel GPUs
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe <logang@deltatee.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
References: <20250915072428.1712837-2-vivek.kasireddy@intel.com>
 <20250916175709.GA1324871@nvidia.com>
 <IA0PR11MB7185186F6AB160AA7F8F0FF3F816A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250918120431.GL1391379@nvidia.com>
 <IA0PR11MB7185C96268ADB5530B343ABBF811A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <20250919122931.GR1391379@nvidia.com>
 <IA0PR11MB718504F59BFA080EC0963E94F812A@IA0PR11MB7185.namprd11.prod.outlook.com>
 <045c6892-9b15-4f31-aa6a-1f45528500f1@amd.com>
 <20250922122018.GU1391379@nvidia.com>
 <4e3919c3-3d1b-4f34-a1e4-5e9e7a5e6e14@amd.com>
 <20250922122900.GV1391379@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250922122900.GV1391379@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0409.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d0::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB7019:EE_
X-MS-Office365-Filtering-Correlation-Id: 65402022-2a88-4a59-c945-08ddf9dadb6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHIyYVo1UE9HUkUyOXR2UjJpU2k5YUJNdVZmSHdxZWVBQnFGT3ppV2NrUkNX?=
 =?utf-8?B?WmZqODFCTWViUEFhbnZDNzNzOEtjVlVleDlYeWIzOUo4THdXTE5KN21TMnds?=
 =?utf-8?B?M3lSWTVrMXR0Nm9VODdscG55WEw4aVdOSXRPUW9GMWZNeVQ3QmIvVWdNb0VB?=
 =?utf-8?B?WDhLZTYxT1FlYXVZV3NLV1Q4aEFYNG0rOVdsMks1NjFTVElDRDdxdnRUeUcz?=
 =?utf-8?B?UU1YbkdVYjl1L2l0T0ZHSGNzandWZklLTTFKek5WVTJwUGYrRFhCUk9adFB2?=
 =?utf-8?B?TDRaVjA1ZGhBbWhsb3pnZmtSRmhYSE9ZN1BKdTVUNjIxMGRIa2F2TlhqL0FU?=
 =?utf-8?B?d2poVGdkQldCL080VVRFZk16YVJOcHVObkNuNVlBTkY4cUp6NDJWYmVxYndt?=
 =?utf-8?B?K0xBZW4yMWpnQnV6QlRTT3JyQXQ5UCtDN3M4Nk5aaG1XQTk0SzhBVTVnUmVG?=
 =?utf-8?B?WStROUlBZ29KZ3hEckFVVDV5b2Fmek8yV0lDTm5mU2drSmlaYkxwZFM2bkhF?=
 =?utf-8?B?MTJkZE1UWjlYNE9PTFY1MlV2SlN4QVRPSVo2bEhCQmpYYkFDWU5DczFOd2dl?=
 =?utf-8?B?YlRscHdJZFNleEdpT2JIdHVyZEdIdi9nVHBkbnVzTzBpVkdZb1RWRHFQc05k?=
 =?utf-8?B?cTJJbjc5QU9jdUQ1dm94bkZUQ25oa1dLbktSbEF1Smo5MmdHWlljRVF3TFJK?=
 =?utf-8?B?ZnRIZlpMZ2NFUTB3L0REUTNGcVhBMUlVWnN6S2ltSjJXOVJwcDBpanZhQ1ZX?=
 =?utf-8?B?SVE0dXNnNHBLVjVJWERqWEZxLzJXTWk5UDhtKzNtREdaKzB6emU2cUlPL21L?=
 =?utf-8?B?Z2dSSGlxdjFPTitWeWNZYlBoN0llbVpuWm5HQ0IwU0hWcFJyRDE5NzJTT2tI?=
 =?utf-8?B?WERMRWFxYTF3MlMrVi9rayszN1IvRlU5aEFDajRvWFhYczQxZElaTkpidVd4?=
 =?utf-8?B?VitGc3M0N0ZhcUxTQXlVUjU0Y05JSnNBYm0xV1lweUVLSTJvSHB2TUVzYWJI?=
 =?utf-8?B?NDcxMlk5SnRRQys1QmhGNThTN0JlRUdSZTduMU1YTDN3OWJ5M1BqLzM0Zkcr?=
 =?utf-8?B?UUdaV2VEMVVSTVM4N1pIdlJxOE5KSm5UaHVXbmtLNEVTTnNqSmRFUEFjMDVE?=
 =?utf-8?B?Qi9NY29MUUJvSnZQWVVKdU5EV1BNS0xhb1Q3RVZPbGRPMHdOQllLWm85L3FM?=
 =?utf-8?B?VDlRamQ4MGRadkhXNWtna1l4czZlQWo4eU1IQlJjWksxWCtmNlo1Rk9rSFRo?=
 =?utf-8?B?amhTVHluemlUUXlnRndRQXFzRHAydlpES09zdW9JVFdBbnZ5eFVCaWNSbGp0?=
 =?utf-8?B?eG9ER0F4QzJPdXhqYXJPcElwdUFPSnlvM3krNGVSdTMvN0F4My9uMU53b2V0?=
 =?utf-8?B?NHlXcjlMckJyVG1mK08vdldrSWZoRHZSMktGSHZKWEk1YU5Ic2RxV2ZsUjNz?=
 =?utf-8?B?T0VFNGwzNWZKUW0yRitCU25UYXcycklzWSt5SUlKUEpWV0tRNXRKaDNYMy9C?=
 =?utf-8?B?TW5Nclo4d3IwRlBacVg1VVNTVDRZd0JvNjJEa1FDb0k1dk93OWQ3MXZKQno4?=
 =?utf-8?B?SkovaVZ3YjhkMzVhaVlNZC9zdDJYOFFQTmJ4MjVMb1ZLYm13SjZicmNqeXM2?=
 =?utf-8?B?azcwSWFCWWs1NnlIR21xZUxDY2lDbmhTeXM2RlJHL3g4SzZOazBBTmhaSU1Y?=
 =?utf-8?B?NEJ1Umllc05PT3FoaTM1ckZOT1M1dXRBTlZndlBBR0xwZWFoTGZweG90T2hp?=
 =?utf-8?B?U21TKytraUJ2cndEV1p5WXhkaXdDd3JHdWpiRkJlV25oTEs1czFLa24zdWtM?=
 =?utf-8?B?OTcyaHp3ZU1VK1lEd2VwRkx3STNTaThVWVA0bTJOcEVqaHNZU1I4Vk9ndm4y?=
 =?utf-8?B?NVZNRWF5MndHMjV2aXhTaTNrdVhEVFBNcTA3MTR4d2VUN3RGUEUxUXhvQXBH?=
 =?utf-8?Q?0iM1qcLh65g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lORWhpNnhFWHhnOHlTTkhPNXFJMktvSUcveVpsVkNBU3FPVE5qem5VczRT?=
 =?utf-8?B?UVVEdUNYRFlJODY4bGI1eDIzbGFDdHdCbFlyU1lTbVh5QkFrb204c3RNY01h?=
 =?utf-8?B?ZzZYeGN3RjVOMktQSC9NQjVjcE1iOVk5dFVIeVdBcm1NTkxtKytTTmFFSys3?=
 =?utf-8?B?YUJoeDhEcmNJYXVOR3RvNFA0UmVmbmkyUllzTml6WjQxY3BQNVdsYTdFN010?=
 =?utf-8?B?a0FSTjV3RzdNdnlHS3pTeGJRMWhaY1RpS01rSURuakFCZkhNNkR3YXFhakhs?=
 =?utf-8?B?ZDR1REZoNC94a1dNUlpHRlVyVXJsWkROb3BTZ1dIcERHN2RvcjBvVDlkMm9R?=
 =?utf-8?B?VmhxUHJCdWZIaGpaVTJ1SUd6QUlmY1k2M1hqVHk5Y1dRZFV1Mk5oU2E3elVw?=
 =?utf-8?B?VmFVd3ZkaWVsbWVLamt5cUNyeXBMNHltK2pKUENiZUhEa29YakVYdms5dVBV?=
 =?utf-8?B?L0tWMUpXdVg5VmZjRGg4WWNTbmZ0dThDckxDZ3c5cHFwN3lDbFFhOS9DQm93?=
 =?utf-8?B?KzRydEdXV2tKdG1IYmJ2TmF0L2syM2N1ZURETDdvZ0dLc3ozaVdtNzQwQjhX?=
 =?utf-8?B?V2M3b3BKN0dUUjNHTTdDMHJmdHpRNkwyN3psbzhlL2xNMUlYMThkSmZMWE9o?=
 =?utf-8?B?bzR5UEhrUU14c1ZDZDYwQUJuK0d2MjJJeURmTG9XT1d5aFo0OU5QQ1kzanVo?=
 =?utf-8?B?eHI5NHhGYmp6RjFvK2IxNmVDOW9tZkNIeGFJeEZBU0hoUXl2Z2VCVUdKbEVO?=
 =?utf-8?B?c2dSMVZSVGRMTDRnU1lCN0lmZzVtQVJENkNwbkFmUWNxUGhCUEhXS1h1SUlK?=
 =?utf-8?B?ZHVKOVpLdVZKQUhpL1RHK3IwK3haZ1NzUnBzamtxQjBoTXlLNlpFMndVUTdU?=
 =?utf-8?B?VXJFb3NrQURyRUNIM2J6ZUJxYTN5L3ZuOU55WUZZeUpOQXBqdmt1c0hSQjNi?=
 =?utf-8?B?ODFYK3RRLzdUT2lvYmZucVc0N0xEcDk3L3ZEYjJRWUVNdm9ZbzBXQzRzY2F0?=
 =?utf-8?B?SGpDZ29jdWtlSldYNFZXODdPVmVYSEsrUGl5SmY2RGcvRWpUbHdMeUdSTlJl?=
 =?utf-8?B?RkhVZHQyTWUvNlh1ZUlOVm5udHNMOVl4ZklUZThMaEt0b2lMODg4K2w4NjU5?=
 =?utf-8?B?Yy80K3d2L2dzMWZlSlhocWxob1V3NGhSVHlzNGdzbWVWMHN6ZEhLaXR2U3JM?=
 =?utf-8?B?ZW1CNFAzMzhvOER0NVpTeWl5WnNnRTBSc2JYTlB4T2FYTGlVb0JxUkFaT3pZ?=
 =?utf-8?B?aHd1a1JYdzh4eHErWEFJM1owckxOeDFHWW9QbmdnaGs3bUxScldjaFAzV3Rp?=
 =?utf-8?B?ZE9sQTAzcDl4S0NBRFg5bXhlVFFaRDRiTHZML1h6U2N4ZjM5c1kyOU5MdjlN?=
 =?utf-8?B?dnI2Mi9samxEUEJieWRBWFU2WTRST3ZzbnE0S21oQzAyS2w1WWZGUit2S0RE?=
 =?utf-8?B?TzRWem0ydUVFL0ZUUXdFOG4rcFVONXVrNHB2OVNZNGQ0ZGNkeElvSWhkem1l?=
 =?utf-8?B?UmxpYUNGemJkZUlNZVd6UzlxTFZlOW1zY1JlQVpDd1JuYXk5NzJremxyZkNW?=
 =?utf-8?B?ZzBlSElqWmV3V1p4RHNjTEtpZm9kQ0gvcGhoUVBYcnBTcXVLMVEzc0d1V0Vh?=
 =?utf-8?B?aVlJMkFCZ09BcWZKc3VHS3FKSk16TFJkU1RvRWJjRGNHbncwcjAwVU9PaW5a?=
 =?utf-8?B?VXN4RXdBaXQ1R3BGLzVEblBtRXlrRkplcTVKL0Q5bnFyemhPOUp2N2oxTXJz?=
 =?utf-8?B?ZVdrWEdWL0Ixelk1bmhvSG5GOS9nVzVudmoybFdyT3d1MGl5UnBJK25oaW03?=
 =?utf-8?B?UWlMaFJIRUltWEVpSkl4NlBRTWxPMXZ1dGRQWjc3QzUvOWMxQU9BVi9JekdP?=
 =?utf-8?B?UG1GaERXTkp3NTdNd24rbkxHZElrZUQ4dTBJZ251L3FqS3RMcVNtUjBFbzFY?=
 =?utf-8?B?c3ZhMlRHOXk5djZuaWRmK2J1NUtMcm9yUXZoQUY3QTdDMXBYYVEzNHNwQXZH?=
 =?utf-8?B?bytsSXF2TFh5WFIrUEttMUxHZisyemdzdklZeWxZUEtQWGx5ZEIzaFF3Mit5?=
 =?utf-8?B?UGpQTWtrWDBueUVReElZNXJCR3l4VVptM3REMFlkL1J3TFFFdDN6Z0pZMDNl?=
 =?utf-8?Q?W5DEcRSry2aAf6uDIutZ1Wqhl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65402022-2a88-4a59-c945-08ddf9dadb6a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 13:20:53.8428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2gWVnZ3VE+FR6WL6YhrqMV3+9+vo89rK0YGnyR6rBngvccnYtmMMpplTBX2b5I9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7019
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

On 22.09.25 14:29, Jason Gunthorpe wrote:
> On Mon, Sep 22, 2025 at 02:25:15PM +0200, Christian König wrote:
>> On 22.09.25 14:20, Jason Gunthorpe wrote:
>>> On Mon, Sep 22, 2025 at 01:22:49PM +0200, Christian König wrote:
>>>
>>>> Well what exactly is happening here? You have a PF assigned to the
>>>> host and a VF passed through to a guest, correct?
>>>>
>>>> And now the PF (from the host side) wants to access a BAR of the VF?
>>>
>>> Not quite.
>>>
>>> It is a GPU so it has a pool of VRAM. The PF can access all VRAM and
>>> the VF can access some VRAM.
>>>
>>> They want to get a DMABUF handle for a bit of the VF's reachable VRAM
>>> that the PF can import and use through it's own funciton.
>>
>> Yeah, where's the problem? We do that all the time.
> 
> Well this is the problem:
> 
>>> The use of the VF's BAR in this series is an ugly hack. The PF never
>>> actually uses the VF BAR, it just hackily converts the dma_addr_t back
>>> to CPU physical and figures out where it is in the VRAM pool and then
>>> uses a PF centric address for it.
>>
>> Oh my, please absolutely don't do that!
> 
> Great.
> 
>> If you have a device internal connection then you need special
>> handling between your PF and VF driver.
> 
> Generic VFIO can't do something like that, so they would need to make
> a special variant VFIO driver.
>
>> But I still don't have the full picture of who is using what here,
>> e.g. who is providing the DMA-buf handle and who is using it?
> 
> Generic VFIO is the exporer, the xe driver is the importer.

Why in the world is the exporter the generic VFIO driver?

At least on AMD GPUs when you want to have a DMA-buf for a specific part of the VFs resources then you ask the hypervisor driver managing the PF for that and not the VFIO driver.

Background is that the VFIO only sees the BARs of the VF and that in turn is usually only a window giving access to a fraction of the resources assigned to the VF. In other words VF BAR is 256MiB in size while 4GiB of VRAM is assigned to the VF (for example).

With that design you don't run into issues with PCIe P2P in the first place. On the other hand when you want to do PCIe P2P to the VF BAR than asking the VFIO driver does make perfect sense, but that doesn't seem to be the use case here.

Regards,
Christian.

> 
> Jason

