Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F764B94256
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B535D10E54A;
	Tue, 23 Sep 2025 03:48:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HHyAeHRc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA5F10E54A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:48:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VCyNandXeMMEIhktquYXZB+EMpKrfuXyWv+lIbzRddbsu76qpeksqL0KNBHDnae7RtWcmZLchF06c3LfQAUfxTjq+Fi1Yu+emwkV9XYNF3DoSU2GZtte03xtMlNMwEQ8LRCLrHuMacv7i116fi3PJhPfePHJwHrb2hIarvxpfwkQ6Im8bZIDHM9Zn8BqQKCCp2n85j1p2wuiPwtohkDK6HlFoKW5L4gR8lC2gw528NnLKTiPsQet90hjUX2rVr8VOE1ko8RU3tW7YczbiE9uNBNn6oGVI/ha6EIWOJuPPSe+Mne4f2qrOrZIgKSJJjwH9SwRNjOcacid1t/470c6wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x/K41ljBPVxEHXZ0J1qudeIShkATOYdS3IYaXyg0OsU=;
 b=Gf2rD4Gm3vehJ7lZmZfhFGJJ7SxF0Y5XdaPxRHndlvpxhQRx2tk7A7p0doXctbW9KZV+eDRcbONV1F66l8X3U7csvK7fDcRcgt+8YTO4uxDkcx8pf4tRemhZzOeDmojEYoQqu/v2Q2GHK2Q1aBAQwSlTkGEWVqzvYmtJwLu6Mr8pDCw1LEfu5Xw24C/mP5tJqaa90opJXYXsMjBujklYO+tlAvJA2bv+WaCTh4DoUW6mocyOX8j/5miFIc8BvxrR7+NEA+YVgc+vifUFE/8sWNXtTteBaCFW6BYS4V8rPCWB888/umlHLu3++yWNRFw2ynpV+PfbNS1E+F5qvC7lBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x/K41ljBPVxEHXZ0J1qudeIShkATOYdS3IYaXyg0OsU=;
 b=HHyAeHRc0zBpcu+4CkSAAR2PehRsKPisK6+fXyklsSuBzRuQyO15y6cCcrTaEmXqgdl4IiPDZGGf9/z5VwIZ8FwUf+T2OHtT7biCxtM3vmPF4zeQNmwWQogzgZ/4txMA87dvwXMGSGaX9W0Yvol74YhP+4VUgNEuvJQ+RJYYJWaGnmz1GlS2kdQw1qIkwIvAgNFdVefphTypa4evidjajnhHsKGpRgWv2N5WhTPag0EHj8c2vVadc5bAZivXMP0s5MvWWnQTgPRySMgfjBwp1jE1sdRSSWhVQysr1CtDy5L3swSSJXKaWoEM8N/o4PN4VpO0sX88vBviw/n7IBtJqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 03:48:04 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:48:04 +0000
Message-ID: <891b7840-3cde-49d0-bdde-8945e9767627@nvidia.com>
Date: Tue, 23 Sep 2025 13:47:56 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 01/15] mm/zone_device: support large zone device private
 folios
To: Zi Yan <ziy@nvidia.com>, Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>, Oscar Salvador
 <osalvador@suse.de>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-2-balbirs@nvidia.com>
 <882D81FA-DA40-4FF9-8192-166DBE1709AF@nvidia.com>
 <f026c5a1-ec51-4fa5-bc58-c2d690f9248c@nvidia.com>
 <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <87F52459-85DC-49C3-9720-819FAA0D1602@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0192.namprd13.prod.outlook.com
 (2603:10b6:a03:2c3::17) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b7c949-d2cf-47d5-4277-08ddfa53fff3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnR1QnB2WUYwSXJtOFozdEhteFd3K1lsb05oQXZBNk5OSWVZUExSU0xJdXg3?=
 =?utf-8?B?TXNjekE3UktSN2MraEhzTVd3bTdxR2V5emRmSGJzVHl2T0IvcXFMQUNRT0VB?=
 =?utf-8?B?UlBaQXpvam1XbWpsT0NkK2ZpZUhoTHpEWWtTUk1SSGxZUnpsN2VmSlREclA3?=
 =?utf-8?B?cTVqOGJ4bnhUbUVKNmRDQ0JjZlphN1VHUU5WK1BVUXZ1eUlhcS84ZmxMMHdJ?=
 =?utf-8?B?cUtlZ1hFdmRrY2dJZmxKSFFxYTY1MW5mWjdCMUwybWlrQks4WHpWMUZ5Smt5?=
 =?utf-8?B?MmFBaEg5VWJ6R1l5K3dRdHM0QVFhSk1iVGMybG1yaXptMW9jODBXcHVpTkJl?=
 =?utf-8?B?T1UrbjBIUFZTblErNSs2NzdCeENTRVZjZjl2QUliazR3dzVHR1JTcktpS1dk?=
 =?utf-8?B?OXBsbFBSeUNONGJ0bGVQR05YVDJMVk1tYXFZSHJPRlhUYVJuNWpKVzZXbWxH?=
 =?utf-8?B?NjBoODd4SDRncEVUT0lHNlcvSEh5Qm1GTmQ3TS9GbUtrOGgyNTVPODdCUFk4?=
 =?utf-8?B?N01UTmdqc214MjlGK3JPNGEva2N1bnZYWmcxSHNGcGkzUGljb08xTFN6TUcy?=
 =?utf-8?B?bE5kQzI2R21UOUV2cmhwbzRLRnlaRzNiMEt6RE85enRzWkR2SmxoSWJhNTJi?=
 =?utf-8?B?Q3oydkI4RXZzUXBqWXlHS2JFaS8vS2RLYWpsL2cxQ2MxK2g0Z1kweCtUaGdl?=
 =?utf-8?B?d2JqNDZmMjRSZy9URjZ5QVR3MWxCWVc2aTBMQWwwd2swOFdRU0FuRkdiMFdM?=
 =?utf-8?B?dWRZTnFJeXN6Z1k3UHQ3NjU0MVNDQ0FmVE5vNnZKYXVqeUVFL3JjOXdLai9Z?=
 =?utf-8?B?cGI5U0FmSFVsbFM2em8yKzRqSm1wcWo3bnpiZDF6alo4dlN2eGxqTFUycDBo?=
 =?utf-8?B?WXhYM29ibHFZb29yenNjMktKL284RzhwbGhyTW1TaTVSemgzWkI4aXoyc3hH?=
 =?utf-8?B?NlR3cWJiRERhcTVTODJjcHBZUGRLam9HQlVhUWVqWGhpV3daRTV2cXVwa3Rl?=
 =?utf-8?B?dVRQMktkVUtKeU5SdC9RdXEwdjl6d1dpZXYrdWxieWRhSlBGTzJ6bzNnK3pV?=
 =?utf-8?B?ZUlFWmJOMXRaYkExQTJ5cDV2V1dqNlQvUnR6QVkxVVNnc0JyT2dGOFBINVNY?=
 =?utf-8?B?UHZtYUxnS3paRGJiN1RlRnlUR0toaVhhWVovQWhQU205U0g0aGFJakVIR052?=
 =?utf-8?B?dXJzcmpEMHdSSjd2MjY1OHFJMDNJWUdkMGdyNEVoUmlYZW5yLzlFRDdkenFy?=
 =?utf-8?B?bVJJUFBFSHFuZ1VHZFhsQ1orckFwUGYwbGF6NEJCSVlSVnArRXNEeVdnNWVx?=
 =?utf-8?B?YjZ0VHNTRXI5OXZlTHV3OVR6ZjFUUkdrU0lmamN0YXM5Ymh6cnZtMkhIM3da?=
 =?utf-8?B?YkwvZkNkRysyL1h5MFhjTER5RzFNU1MwU0RQczVCZ0xHSGxrQVA5MStHWFJY?=
 =?utf-8?B?R0QxV3BWY2hvbVhZWENMVVFjYkpWQW9uZnhSUnlWVWhiMEhDSFFJKzdTMkQ0?=
 =?utf-8?B?bE1UN1JubTBLaHRhMWl5YzZkb0t4ZWxIN29VYlJtSmd4c205ZWJIejFwUEVJ?=
 =?utf-8?B?Y3M5WGt2WElPMmVUS1FVSDZPdnZzRk9MMFdUSitMNmdWbEtrTHFFcG0xM0sv?=
 =?utf-8?B?b2JHQzZpYWlFVk1QNnNpQ21JWnZ5TEp1UDRieWQ2VWEzcGZIS2svdGhpU0cx?=
 =?utf-8?B?RG9lcU9EcTBBVFBFOXJRTEdxdTZxOTI4c0JncHBOWTEvTmZ2NU9tcCtzYzRz?=
 =?utf-8?B?UFZRSnNQSHMwZXJRVHdMeDhEdEcrS29FeVVvUW5TM0RXZmxtWTN2TDRERXZD?=
 =?utf-8?B?U3VHaFVhdEJuMHJ6dWc2WjVVS2FPdk52MVNNb3lobDdqdUR0MFVDb3I1eXNE?=
 =?utf-8?B?QW1ZUGc4SnRTbkdySW85bThpRW5SUHFsYUFIWllEeTV4ZGs1dUQ0QlF0ZXhP?=
 =?utf-8?Q?NzRF3hL+cTA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eURNM3dlajFjc3B3aTgwMDVrb0QwWGtNYjFMQVU0eFB6WHJWYUxzVm1EZUJt?=
 =?utf-8?B?c2F5d3kyWHZEdHIwcWpzclpmZ2k1T3hOQ2EwbXNxUU9tYWZJTzNZeXNCOWIv?=
 =?utf-8?B?T2Y0ejFKR0pGdkZxRzltdEYzSkpVZndtbjczQ0VtMkJLbFlZVHBrR1ExL2li?=
 =?utf-8?B?WURFWXVCNGJSaUlXYkNjdGpMRlB4ZkMxbHhPMVduU1h0SU9nUzFmdi9FSm4z?=
 =?utf-8?B?bG1ZZ3VQc1I2am1NcWJhMlcxTTIxa2hzd2NuSU9vQkRnWU4xYi9UQ2JISkxY?=
 =?utf-8?B?ZkkyRVAxbnZGd0FrUVhxQzhjdnRtZGhCMEY2aUtneG5ITEFSNzZGOUNjQXpC?=
 =?utf-8?B?bWw5VWVlWFdQOTF4clJYYWlFMGxkb2ppNXRIdkl4MFhWYjVmM3JDWk8raDlI?=
 =?utf-8?B?MVJKaUU3cjNlbXhEb2NJWXM1TjVWOWlUSGFVekxTVXloc2dVK3E2cE1wVFNU?=
 =?utf-8?B?MTV1TWZXQVlINTRRWTQ5UlpJTEpkaGpDcHVIbkxyTk5ZUlI3Mi9hend5WXds?=
 =?utf-8?B?c0s1ZTdoMW1aLzNxMk9jUTBqNWZnR3NzYUNkampjRUNwNW5qSnVqckJjeG5z?=
 =?utf-8?B?RFVtT3pCdmpyYnNBczZoeDJRZ3pEMVlNcVBTQUxCdHhIMEtqcmVReUxGQSt5?=
 =?utf-8?B?UTd5R21YMGgxLzJsUHRreG4vMmNmcFQ0NlI5MTBZbDlKV2Q1ekNXOVBJdHNM?=
 =?utf-8?B?cU51M1dkbHN0Y1ZBRFpzRzRRVWt6VlFXK0dPcitaTkEvMExnRTZpZDlwTTU3?=
 =?utf-8?B?YUNBTWp5N3hXTXhDMmhRN1QxZllVR3JzWGlsVVNNWTlNWnQvcGQwY2orUEdl?=
 =?utf-8?B?MHpvd1dIeHRZMW9HR1FFTnN0UlJTSjVVRnJZenpJQ0pCMGtVUngvdmtQQnFi?=
 =?utf-8?B?K210d3o3aE9DUWpVU0ZhODNWU243NUN1Yk1oS1RCOVd3QTkxNG5OdGZUbWYx?=
 =?utf-8?B?Z2VyeVZDMHU4bjE4c0hsTTBRTWJzZmNjeUtTQU1PZlZGY3d4OEFjamtmNlp4?=
 =?utf-8?B?d1N3cWxpVFYyK1k0R1RGNjVGQXFWbWtRR1ViTmFGdml0cmVGd0txTEh3Yzd2?=
 =?utf-8?B?cmFhRnU4UmxFYU5UUUxrWVRZNDJJQmlPNG90T1BVK3VNRHp4ZEhMR1NmbXAz?=
 =?utf-8?B?V2FvcUMyaW1jT0NSbWxqOU95NUQxUVJaOThKN1FFL2NOS2hWSDRIeHZNRzVH?=
 =?utf-8?B?bnhwaFVBcXI1TXhVSzNBemkzQ1VqbytjRXFTN1hGTi9nVVV2MXpSYk93YkFN?=
 =?utf-8?B?a1Nib3NOazRrdXhFUUxRbkFGeDZ4TTRqR0ZIS1ZqSkU1dllIMlBJZVFMc0xy?=
 =?utf-8?B?MG9Yd2RxRnJpMjFtaFgwcXZmRGNSSHY1WW91Wld2ZE45b0UxLzc0L3pydE1a?=
 =?utf-8?B?ejNzOVlxdEJ1WWxZcE8vRnhGRmwrNzFrZi8xdkswQTBWMmZDeW8ya2YydlUw?=
 =?utf-8?B?L3E1Ym9Ud1VFRHhYZjFTcFdNdngwQkhEc21ZVW91OFZWVkdaaE0rK0hqSnVK?=
 =?utf-8?B?cVloM2dQVW9wRW51MlNSYW5RclcrMVBsQzdZU3dkZm55RXlTbm1SbXB5WW8w?=
 =?utf-8?B?dkNNOWsyWXU2NmJQZ0FlNHNybkV1a2VXZVBNQlB5N28rL1UwT2RWSTV6ZkV5?=
 =?utf-8?B?UWxnSjVUV21FdGIwVERuNzhTcDNrVzRxSjRQVElKVnNyYUNoZjJkQ0hWb3BF?=
 =?utf-8?B?M1RoeWx6S1dqeEhQUldoSFJDMmhuWll4ZC92cndyVlRITWlNT1M5S09LTnNq?=
 =?utf-8?B?d2cvVWljK0dKcTE3M3NodGNmUGc0bGlSYmNyUEx3Z3VDanpyNmRhVTJCaVc5?=
 =?utf-8?B?RkFxbFZ2Y0hyNFM4cm5jb2RUeHEzeE1jTmZBNHR0T2JXa245eklXbmNYdTFN?=
 =?utf-8?B?ZUFRb1ltZWNPMm95OGxKNUNCVmRlc1hQcEtRNkJ1Um5rRlIrelVpeiswRVUv?=
 =?utf-8?B?TVc5OGhVMlYxUXpEZTQzd2dKeXVnWFFTY3p6eDFWN0t6QVZoanpPYi96MFIx?=
 =?utf-8?B?dTNpVUVsdmdDZk9BZ2ZJcjNsb1VXSTdsZm1MU1NhejJKTko5OFdnY28wN2Vl?=
 =?utf-8?B?akhkQ0VtdW5oQXZHZDFocmhvU0cyWU1lSEhJTENQSk5NU3pZYWxNbnZyeFRZ?=
 =?utf-8?B?ZDU2TFFPaDJmcUxGb1lvRloyZkdpSzAybC9zT0JZODVDVVp2T0llRTdpcHZv?=
 =?utf-8?Q?Xt8jNVU/DM8sRoUk9sIZugK8Z3cpVLqZuOsaj8Q6gqlL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b7c949-d2cf-47d5-4277-08ddfa53fff3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:48:04.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 68fa8eH8JASfp9vcDX888lpadbaCGrh4CGhIsFZul1MlFDCXlZWxDM7wBozg4S+aW1EgIqrllKL3mVbi6YaPxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
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

On 9/19/25 23:26, Zi Yan wrote:
> On 19 Sep 2025, at 1:01, Balbir Singh wrote:
> 
>> On 9/18/25 12:49, Zi Yan wrote:
>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>
>>>> Add routines to support allocation of large order zone device folios
>>>> and helper functions for zone device folios, to check if a folio is
>>>> device private and helpers for setting zone device data.
>>>>
>>>> When large folios are used, the existing page_free() callback in
>>>> pgmap is called when the folio is freed, this is true for both
>>>> PAGE_SIZE and higher order pages.
>>>>
>>>> Zone device private large folios do not support deferred split and
>>>> scan like normal THP folios.
>>>>
>>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>>> Cc: David Hildenbrand <david@redhat.com>
>>>> Cc: Zi Yan <ziy@nvidia.com>
>>>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>>>> Cc: Rakie Kim <rakie.kim@sk.com>
>>>> Cc: Byungchul Park <byungchul@sk.com>
>>>> Cc: Gregory Price <gourry@gourry.net>
>>>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>>>> Cc: Alistair Popple <apopple@nvidia.com>
>>>> Cc: Oscar Salvador <osalvador@suse.de>
>>>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>>>> Cc: Nico Pache <npache@redhat.com>
>>>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>>>> Cc: Dev Jain <dev.jain@arm.com>
>>>> Cc: Barry Song <baohua@kernel.org>
>>>> Cc: Lyude Paul <lyude@redhat.com>
>>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>>> Cc: David Airlie <airlied@gmail.com>
>>>> Cc: Simona Vetter <simona@ffwll.ch>
>>>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>>>> Cc: Mika Penttilä <mpenttil@redhat.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>>> ---
>>>>  include/linux/memremap.h | 10 +++++++++-
>>>>  mm/memremap.c            | 34 +++++++++++++++++++++-------------
>>>>  mm/rmap.c                |  6 +++++-
>>>>  3 files changed, 35 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>> index e5951ba12a28..9c20327c2be5 100644
>>>> --- a/include/linux/memremap.h
>>>> +++ b/include/linux/memremap.h
>>>> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *page)
>>>>  }
>>>>
>>>>  #ifdef CONFIG_ZONE_DEVICE
>>>> -void zone_device_page_init(struct page *page);
>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order);
>>>>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>>>>  void memunmap_pages(struct dev_pagemap *pgmap);
>>>>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
>>>> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn);
>>>>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>>>>
>>>>  unsigned long memremap_compat_align(void);
>>>> +
>>>> +static inline void zone_device_page_init(struct page *page)
>>>> +{
>>>> +	struct folio *folio = page_folio(page);
>>>> +
>>>> +	zone_device_folio_init(folio, 0);
>>>
>>> I assume it is for legacy code, where only non-compound page exists?
>>>
>>> It seems that you assume @page is always order-0, but there is no check
>>> for it. Adding VM_WARN_ON_ONCE_FOLIO(folio_order(folio) != 0, folio)
>>> above it would be useful to detect misuse.
>>>
>>>> +}
>>>> +
>>>>  #else
>>>>  static inline void *devm_memremap_pages(struct device *dev,
>>>>  		struct dev_pagemap *pgmap)
>>>> diff --git a/mm/memremap.c b/mm/memremap.c
>>>> index 46cb1b0b6f72..a8481ebf94cc 100644
>>>> --- a/mm/memremap.c
>>>> +++ b/mm/memremap.c
>>>> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>>>>  void free_zone_device_folio(struct folio *folio)
>>>>  {
>>>>  	struct dev_pagemap *pgmap = folio->pgmap;
>>>> +	unsigned long nr = folio_nr_pages(folio);
>>>> +	int i;
>>>>
>>>>  	if (WARN_ON_ONCE(!pgmap))
>>>>  		return;
>>>>
>>>>  	mem_cgroup_uncharge(folio);
>>>>
>>>> -	/*
>>>> -	 * Note: we don't expect anonymous compound pages yet. Once supported
>>>> -	 * and we could PTE-map them similar to THP, we'd have to clear
>>>> -	 * PG_anon_exclusive on all tail pages.
>>>> -	 */
>>>>  	if (folio_test_anon(folio)) {
>>>> -		VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
>>>> -		__ClearPageAnonExclusive(folio_page(folio, 0));
>>>> +		for (i = 0; i < nr; i++)
>>>> +			__ClearPageAnonExclusive(folio_page(folio, i));
>>>> +	} else {
>>>> +		VM_WARN_ON_ONCE(folio_test_large(folio));
>>>>  	}
>>>>
>>>>  	/*
>>>> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>>>>  	case MEMORY_DEVICE_COHERENT:
>>>>  		if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>>>>  			break;
>>>> -		pgmap->ops->page_free(folio_page(folio, 0));
>>>> -		put_dev_pagemap(pgmap);
>>>> +		pgmap->ops->page_free(&folio->page);
>>>> +		percpu_ref_put_many(&folio->pgmap->ref, nr);
>>>>  		break;
>>>>
>>>>  	case MEMORY_DEVICE_GENERIC:
>>>> @@ -480,14 +479,23 @@ void free_zone_device_folio(struct folio *folio)
>>>>  	}
>>>>  }
>>>>
>>>> -void zone_device_page_init(struct page *page)
>>>> +void zone_device_folio_init(struct folio *folio, unsigned int order)
>>>>  {
>>>> +	struct page *page = folio_page(folio, 0);
>>>
>>> It is strange to see a folio is converted back to page in
>>> a function called zone_device_folio_init().
>>>
>>>> +
>>>> +	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>> +
>>>>  	/*
>>>>  	 * Drivers shouldn't be allocating pages after calling
>>>>  	 * memunmap_pages().
>>>>  	 */
>>>> -	WARN_ON_ONCE(!percpu_ref_tryget_live(&page_pgmap(page)->ref));
>>>> -	set_page_count(page, 1);
>>>> +	WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>>>> +	folio_set_count(folio, 1);
>>>>  	lock_page(page);
>>>> +
>>>> +	if (order > 1) {
>>>> +		prep_compound_page(page, order);
>>>> +		folio_set_large_rmappable(folio);
>>>> +	}
>>>
>>> OK, so basically, @folio is not a compound page yet when zone_device_folio_init()
>>> is called.
>>>
>>> I feel that your zone_device_page_init() and zone_device_folio_init()
>>> implementations are inverse. They should follow the same pattern
>>> as __alloc_pages_noprof() and __folio_alloc_noprof(), where
>>> zone_device_page_init() does the actual initialization and
>>> zone_device_folio_init() just convert a page to folio.
>>>
>>> Something like:
>>>
>>> void zone_device_page_init(struct page *page, unsigned int order)
>>> {
>>> 	VM_WARN_ON_ONCE(order > MAX_ORDER_NR_PAGES);
>>>
>>> 	/*
>>> 	 * Drivers shouldn't be allocating pages after calling
>>> 	 * memunmap_pages().
>>> 	 */
>>>
>>>     WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order));
>>> 	
>>> 	/*
>>> 	 * anonymous folio does not support order-1, high order file-backed folio
>>> 	 * is not supported at all.
>>> 	 */
>>> 	VM_WARN_ON_ONCE(order == 1);
>>>
>>> 	if (order > 1)
>>> 		prep_compound_page(page, order);
>>>
>>> 	/* page has to be compound head here */
>>> 	set_page_count(page, 1);
>>> 	lock_page(page);
>>> }
>>>
>>> void zone_device_folio_init(struct folio *folio, unsigned int order)
>>> {
>>> 	struct page *page = folio_page(folio, 0);
>>>
>>> 	zone_device_page_init(page, order);
>>> 	page_rmappable_folio(page);
>>> }
>>>
>>> Or
>>>
>>> struct folio *zone_device_folio_init(struct page *page, unsigned int order)
>>> {
>>> 	zone_device_page_init(page, order);
>>> 	return page_rmappable_folio(page);
>>> }
>>>
>>>
>>> Then, it comes to free_zone_device_folio() above,
>>> I feel that pgmap->ops->page_free() should take an additional order
>>> parameter to free a compound page like free_frozen_pages().
>>>
>>>
>>> This is my impression after reading the patch and zone device page code.
>>>
>>> Alistair and David can correct me if this is wrong, since I am new to
>>> zone device page code.
>>> 	
>>
>> Thanks, I did not want to change zone_device_page_init() for several
>> drivers (outside my test scope) that already assume it has an order size of 0.
> 
> But my proposed zone_device_page_init() should still work for order-0
> pages. You just need to change call site to add 0 as a new parameter.
> 

I did not want to change existing callers (increases testing impact)
without a strong reason.

> 
> One strange thing I found in the original zone_device_page_init() is
> the use of page_pgmap() in
> WARN_ON_ONCE(!percpu_ref_tryget_many(&page_pgmap(page)->ref, 1 << order)).
> page_pgmap() calls page_folio() on the given page to access pgmap field.
> And pgmap field is only available in struct folio. The code initializes
> struct page, but in middle it suddenly finds the page is actually a folio,
> then treat it as a page afterwards. I wonder if it can be done better.
> 
> This might be a question to Alistair, since he made the change.
> 

I'll let him answer it :)

Thanks for the review
Balbir
