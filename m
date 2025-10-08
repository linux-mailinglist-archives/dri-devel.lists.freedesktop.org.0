Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32E95BC4D7A
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:36:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE4B10E7FB;
	Wed,  8 Oct 2025 12:36:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OTGvk7aY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81F4710E380;
 Wed,  8 Oct 2025 12:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xjx6g0Q55ra0Imm+y6e/54Xn459kW/W/6BgEPLPh/A0HWo5gx6kuarsOEKWBoncZg2nnzMNZpd7qphpzsUGpn/G2arVS44r1ab2e0qNJG/ym8oLm1V0YqdyqKMR+9ybUGm7oIvqxjNoHzK1sfK9UsYxv6pb2TTzib0Yoo2kfNsJYZXnH32jeG9CLUReNftSIIYQU9NWTQKAZZuRU/N5qA1STQIV60V/r3iVWUIYya9AahKh8em+aYPs8NplSc+ke5yvUhsGoLeKi1ZdnpaiiikSGkuP55kcDzv7cAtzlFhUWqqpR+yHMyCHFHj9lQqsvJ3OqY9q3p7cBx27rdiALxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmmvU5tqFjQenZXnEnmnMr8vhjtV++K3y3gg1+K0DTw=;
 b=zMLofgkgfa+Gm5WLSDM131Dydpgp1ZRNJvyqAbvf2MVVUFAzYt+I+Rij0VvjTjTuUtRHmQL0K5G0JYMmQCIS9zBqDrnQbp/ZmezGO/27hFRtj3yB+W8s9AYD/qqVSPIgsLBSB1Ll1M4zh3Unbf3xhyu+iIYEf4kJoGKZGDfFDl1aT7k1iT03AIV3Q3ukxD5eTsgqeRDU1NsQ5rjuZXWYyuSK5RLrWrrgIeiQFXDdnBXrZl1rme2RpAdS3xBhoKs57Sai6gWBer4/BVCQnaG9uXdsOz7ABJDRtIT/7XYtEjoTbEBDRl0U6U48YnyJ23SdfNTyNVroBWgbqs4kDjdbmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmmvU5tqFjQenZXnEnmnMr8vhjtV++K3y3gg1+K0DTw=;
 b=OTGvk7aYEv1EBNztxF98S1z+KZzdRC4/iTsGaN1cS7CvzUjOWLd+9MbtIBMktETMh9KQiakceVamftz/dglo4RKrve7FWY/yFmFMeK8SRhAQ7xJnE7R0LVUGrICkqcEqx7WQce3U3yw92Dev4j6KAMU55tN5DxxrcMuoPE7rzTo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4418.namprd12.prod.outlook.com (2603:10b6:5:28e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Wed, 8 Oct
 2025 12:36:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 12:36:04 +0000
Message-ID: <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
Date: Wed, 8 Oct 2025 14:35:58 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Improving the worst case TTM large allocation
 latency
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4418:EE_
X-MS-Office365-Filtering-Correlation-Id: fca2ddbc-96a5-4e60-67e6-08de06673eab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjIzWjVEUXNSNHk4RUJiUTkxcEtCOVNuL0twM1VJcFQ1UmZZNGRHcWdWdjA5?=
 =?utf-8?B?WVMvSGpnUWJPeWZTMzNLNXQ2SXF5OFh2YXoyaTdnT0M3ZzZXVXI4bzBOdWhr?=
 =?utf-8?B?dkdiZHJZeExzdlVieEtRdFV1ZThKemtlcExSNjNGSkE3a0U0SnQ4SHY5N0cz?=
 =?utf-8?B?QnZNZlJWeVBvVG1qdFUwQnpTb2VXOGtwa3hqS0t5bUNOZWI2cUl0OU03amlT?=
 =?utf-8?B?WkRzdTFURUFKOXA5WG93bG5Fd0lxL0ttU0pkQlpBZ1BmUXVDVmFNUmxXR2JN?=
 =?utf-8?B?bWY2cGo0Q2JZZXRQdzVsR01vZDFWZzlZMk9sUEZNZkVGOFc3Y0VrdW5PRmNL?=
 =?utf-8?B?ZGFyVHlmL2FlWVFTNGJlT2xJRGl5bXNKbS9XQ2JUTEo2MTlDbk4wbS9FYm1r?=
 =?utf-8?B?K2hNdVMrTkkzMFU5d2tmcjVWWUZoakJ5NnJYRmV6NEt0cG95dFo3RXdhQW9t?=
 =?utf-8?B?bXZxRVBWT2IyekNCNU4ycDJGa0JEVUk2VHl6TGxmMnZrUnorVjBwT281Tnht?=
 =?utf-8?B?TmwwSFJTMFhZckJsdityTytEOHJhc3pwb3lVQWV4WEtXWjlEa0tvOUN5YkVX?=
 =?utf-8?B?VUNkb0sxT3hTL2RMZXR0WW9EbnU0Q0IybjQ0UEtSaEV5QUtBYW4yUnZJT2Fp?=
 =?utf-8?B?akRIYmNERWFnUTRONTZWbW1UL1gxbjVEa2doc2g2ZXEzRFR0azgxdTRXN3pq?=
 =?utf-8?B?QzQwSGlXUFJwbTVHdFUyRGhEc2JMcVl5T01BT1JuNTRlaHZCL1pHTi9xVjJ0?=
 =?utf-8?B?eEQwOTRzSlN6U2hscWN0SDZsY2pjaHJDMzF3WGhIbFB3R0cyWG5KcjBlYlRV?=
 =?utf-8?B?SHRWN0kzYW83V01lMUJmeEFXbFdiODhaNVdpdzBhMnVENFBMT0lqQk01bmN6?=
 =?utf-8?B?YXEvN1NvWElJWm15Y0FKamh2NGtpenFZZ2lMai9MZ1ZEUUJsR2QxcUhhelkz?=
 =?utf-8?B?aFh0UStqREw3aEdLWHpvVzlRTG51Y05VQlVRZUw4anE2Z24ySGxSRCtFTk9m?=
 =?utf-8?B?akMrUFRUQnhjWXZvMnh4dlNSYWZmbEhGMDRITW54WDJ2dUJXdy9jYmFtYUlo?=
 =?utf-8?B?RHpFNmhWSU95cm1CRHJFRk11eXdoVmZGN082QklnM2k2ZXB1ZHBCMkZGNXY4?=
 =?utf-8?B?WGZsUmFzWlVwbUJJcm40d05TNTZlZ1BkaTVWRU85bjRvVE9OQXF2TENEa2hB?=
 =?utf-8?B?MGVjVW9yamJpdGZENDlyTFFVam9QeG16V2VNeWliYXVCekt1WUwyT0RSWWp0?=
 =?utf-8?B?RmppU3c4UXBMMGhodmE2L2ZnYldpK2IrdTI1WDdZSDlNK0I5M0JObWw3eG81?=
 =?utf-8?B?UjFOSElRNkVCZGVQMkdZN1FvMVRvU1VHRlQySks4eXV2MnArTi8rTk8vdm5u?=
 =?utf-8?B?U0M2OTd6NDA4TzFIY050YWNHSWVScXFPakZ6aTRjQTg1aGZmU1FpVzJxdWx4?=
 =?utf-8?B?aXg0QkZpTXZOVURsNis0NmdraHVYNmtKNXhJWk02eU5ZMGZoeHB3NGFKanBu?=
 =?utf-8?B?dDc5N1VhMkNraisvREg4aXJqMmtMbzZVc3hCdFo1cUtRd1lpSUlhUmVUdDJk?=
 =?utf-8?B?eU9yVmlkdjJDUGJMY052cjhVTjFBK0NBQU9FUll5MkRVdzVKVmpHQTNQN2R5?=
 =?utf-8?B?M3JSZnNiVkZMZDhYUHB0M2kyZG1BOHg1ZnIwaEtsaU5vdXdpUVE3WWp3bGlv?=
 =?utf-8?B?MUtHWVczaHVtM21UMk83L3NETkU5VHNTcGtiSmpIQ25QWjU3ZGxaTm5WYUdr?=
 =?utf-8?B?eitrWXBubDRSZldTNDFETEE4WE9XRHM4bnJRdmowa1FhaE52V25VeXQ5SGJ6?=
 =?utf-8?B?bXFyWXlEWU1tRDRHVGorak9vdGE5VTVvQTVkOC9xRFlxYTBwQ0tkdEYvTUFI?=
 =?utf-8?B?bGRucU9JR2xvVnRodWlsaTh4U08wOFZRdzY3a0JFdkppUUE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE1qbm9Sdzl4bmdlSkNFM1hGZTNYNmZrWjhkMWR3YnlOZWxmOStxcnVDN29U?=
 =?utf-8?B?WjFZRzVyaSszaFpuMXFPamtWYTFYRS84bjJaMEo4SWV6bnhPam1BMlNEaG11?=
 =?utf-8?B?Wmp1VmRYb0VaVW9YeDZ4N3J0U2h4b3JWMGUwZkFuSDBQM3FvSWw0TlNob1pR?=
 =?utf-8?B?cjdMZlNuZEQvUzNQdmI2U0tpczRsVDdTNjRSRkRzMkNwU0NydEtRS3R2amky?=
 =?utf-8?B?ZDlidE1OMWVlWG9VbUtZK0k0Y2UvQkpuVXViZndWbGQ5OGpXb0FLbS9VUjBx?=
 =?utf-8?B?ZGlzKzI3Ly8zcUFIQXRaMHFacSswTFIvbHRvSVdpYUxiZUdiWU1LVzI4M0Nl?=
 =?utf-8?B?NlF2MVBBbnJ3aUo1ZXBRQ0Z1dVVJYnR1VEwva1hteXZ3d0MrZEd2R3UzcWkv?=
 =?utf-8?B?VGZXOE0zYTRZMGJBVmFRanpPT0ZjSGtVU1M5SUNvVWlmQTdacTNQdkg5Q2wv?=
 =?utf-8?B?cWNqOXBSZDB3eUtDMlNXZ0NPdXhpNG5OVDdPS0k1dFNrSXNUKzVZNkY0bTVj?=
 =?utf-8?B?bkJPK1NWakRLTnlCc0tSTGxQcWJON0Fkc1Y1OWdNZkJ2d3ltYnl1NlE4K0FE?=
 =?utf-8?B?R3BsSlVtVE9kZDM1bmllVTBldmEwR1ViaTdSekptOXlBMGljcWlzSVNZSEFO?=
 =?utf-8?B?NlpGdHNoL2NPZStIbU85OGRyWE5VbFhtdHpXb2lPbzJkQVFsbnhsTGpIQlBR?=
 =?utf-8?B?dHdoS1dpRnRSTU4yNGIwMXNIN29RT1N5MWF2OGRmK2N3WUZxN0g5R2ZkT2Zl?=
 =?utf-8?B?VGRocXNIWVFuTFkyS0ZuNUV0MkZlaFZ5eE44R05pSGp4WTduZVNKU2VWT041?=
 =?utf-8?B?Y3pWM1ZnRE1rVVNmOGhMUndURmtkWU5sdisxOGhLTWp2NFQyaFl6Y3o3ajVZ?=
 =?utf-8?B?bUNIM1RQYWZmVHBmSnJjZklVK0F0M0F4YlByRzdUUWNBZVptOEVSdGx4Y1FL?=
 =?utf-8?B?eEt1dGd0d2xYQlVacGtHQlVCd2pMMmNtdnQ1TXVoK2M5aDA4L1dsUjl3d2F0?=
 =?utf-8?B?d2U0UUM0WW02dUEvRUc2aTNnbFRiMUhkaEo3VVlRMUtweS9SS2lMNkFmMnRH?=
 =?utf-8?B?YTVkNnVOQm9nZGE5V1FreWlKQURxMTJrWDJjTHNKckVsUUtTYVBRNFZzaUZv?=
 =?utf-8?B?clVSbjNaNktGOWUwYzM1aXVjbzBRRGtrOEt2V0RTeVlHMXkzcGNlWDllcmlu?=
 =?utf-8?B?Zkdnc3NtY3lDSVZQWmdhU2tDTHFJVzVXc0drNDBEUE4xRmpxRHJMaklwMnVp?=
 =?utf-8?B?WDZhbU9FV0ZDOGdibmIrSzZjZERrTXZJZTJrOTh5MXZnTU9TSkZNNTB3ZGx6?=
 =?utf-8?B?eno3bUpkTWJucEJTWGxaTVNqdW4yRGJTdW1PbEN1VDZDZTFrcmM3MXNKT0Q0?=
 =?utf-8?B?alVNZWhuNVFrVzNtRjVMTElwU1FVZzVEaTRQL2hOWkZxNTlUZXh0QkNwcEEv?=
 =?utf-8?B?Qks1Mm4yeEZKZmd5bHVNaHVzZ0ZXSEN3UVVUNU5wZUFOcmhCeHF1akJxQXVB?=
 =?utf-8?B?SFR4bUZJTGpEc2d2YmRvOXgzaU9BeDFtV0swbHVSUVp3OHZaamlXU1NvbkJa?=
 =?utf-8?B?cVlWeTJpcUZQdU5RVWZSRmZ6VytFWkEzb0FGTnBaaWZRTFVsN016ck1YNTVZ?=
 =?utf-8?B?czRubTlBM2NqRFp4T2t3U0p3RHlocW42ZXZ0K0R4a3lCV3p6RWx0VEpObjRq?=
 =?utf-8?B?MnZnVG1HMHNaQ0dVWjFGcG4vY3lyUWlIN2hLK3FORFQ5NW11ZkVjSXhNMG41?=
 =?utf-8?B?ellKeVVialBCWGNxUmd6V2hoNXhDdmlpSDIvZzg5UkJzVjhzdE50NU5xdWkz?=
 =?utf-8?B?YW16RjFzYjg2SHhFWll4TFJ3SDJjeFRCd0x1aFVWdHM0QzJOTHpJWGRPT0pH?=
 =?utf-8?B?TDFaQVpwamlBa1ljcHRCSnovQTR0eFVqSFNsYi9hWnVIeHhXcEVyMEVGV2ky?=
 =?utf-8?B?MTF5S3dycmJEMXpYcXhQUnpEQTRnellkTHg1SjBrUFBmb0Y3akpsMUxSMWpH?=
 =?utf-8?B?RkRpUHFFNWRxMVloUWtTWE9abGVNOHdJbmw4eUlVS0R2cHYzT0hhVFRqaDYx?=
 =?utf-8?B?OUNhL25lT0JreFF1UCtzM2VscFBibllWOE5ZQlVuVVBBV1N3TXVwL2NQZ1c5?=
 =?utf-8?Q?bYYjLyeHAC5Gueypr/SHdHiSd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca2ddbc-96a5-4e60-67e6-08de06673eab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 12:36:03.9605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAN3qz2GGMBfuiDdOQnP18tXNkGKJsnJ9Fw/t4Yv8OM+clneCjHuScSSsXNJP4xH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4418
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

On 08.10.25 13:53, Tvrtko Ursulin wrote:
> Disclaimer:
> Please note that as this series includes a patch which touches a good number of
> drivers I will only copy everyone in the cover letter and the respective patch.
> Assumption is people are subscribed to dri-devel so can look at the whole series
> there. I know someone is bound to complain for both the case when everyone is
> copied on everything for getting too much email, and also for this other case.
> So please be flexible.
> 
> Description:
> 
> All drivers which use the TTM pool allocator end up requesting large order
> allocations when allocating large buffers. Those can be slow due memory pressure
> and so add latency to buffer creation. But there is often also a size limit
> above which contiguous blocks do not bring any performance benefits. This series
> allows drivers to say when it is okay for the TTM to try a bit less hard.
> 
> We do this by allowing drivers to specify this cut off point when creating the
> TTM device and pools. Allocations above this size will skip direct reclaim so
> under memory pressure worst case latency will improve. Background reclaim is
> still kicked off and both before and after the memory pressure all the TTM pool
> buckets remain to be used as they are today.
> 
> This is especially interesting if someone has configured MAX_PAGE_ORDER to
> higher than the default. And even with the default, with amdgpu for example,
> the last patch in the series makes use of the new feature by telling TTM that
> above 2MiB we do not expect performance benefits. Which makes TTM not try direct
> reclaim for the top bucket (4MiB).
> 
> End result is TTM drivers become a tiny bit nicer mm citizens and users benefit
> from better worst case buffer creation latencies. As a side benefit we get rid
> of two instances of those often very unreadable mutliple nameless booleans
> function signatures.
> 
> If this sounds interesting and gets merge the invidual drivers can follow up
> with patches configuring their thresholds.
> 
> v2:
>  * Christian suggested to pass in the new data by changing the function signatures.
> 
> v3:
>  * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)

Patch #3 is Acked-by: Christian König <christian.koenig@amd.com>.

The rest is Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks,
Christian.

> 
> v1 thread:
> https://lore.kernel.org/dri-devel/20250919131127.90932-1-tvrtko.ursulin@igalia.com/
> 
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Zack Rusin <zack.rusin@broadcom.com>
> 
> Tvrtko Ursulin (5):
>   drm/ttm: Add getter for some pool properties
>   drm/ttm: Replace multiple booleans with flags in pool init
>   drm/ttm: Replace multiple booleans with flags in device init
>   drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
>   drm/amdgpu: Configure max beneficial TTM pool allocation order
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  7 +--
>  drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>  drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>  drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
>  drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>  drivers/gpu/drm/radeon/radeon_ttm.c           |  4 +-
>  drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
>  .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>  drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 31 +++++--------
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
>  drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
>  drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 23 +++++-----
>  drivers/gpu/drm/ttm/ttm_device.c              |  7 ++-
>  drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
>  drivers/gpu/drm/ttm/ttm_pool_internal.h       | 24 ++++++++++
>  drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>  drivers/gpu/drm/xe/xe_device.c                |  2 +-
>  include/drm/ttm/ttm_device.h                  |  2 +-
>  include/drm/ttm/ttm_pool.h                    | 13 +++---
>  21 files changed, 125 insertions(+), 106 deletions(-)
>  create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
> 

