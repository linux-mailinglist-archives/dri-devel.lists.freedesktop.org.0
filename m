Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA151B886FC
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 10:36:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A333C10E285;
	Fri, 19 Sep 2025 08:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nLH3gLeF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013001.outbound.protection.outlook.com
 [40.107.201.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E673710E285
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 08:36:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJkl00sL+LEgIryLozqv/5nitZtiyg/9rD1SASE0OWlyzK8FiQfijLG4B44rdg6kVOQOaa8GYGbdCmrQJQDeFFZWNnZHaUSfoU2s6wGBuuNQK1iJ9NCtmVySZveBcMJijDT66RipOSPl0vRAPHIzE6LF8dkNTx0WftHrAtlYctxYiA5Bc//kGgoqFSC0EL9Qkdqne6mj88XIQtasqISxsRLk8P/MlUdnSaIf3P8JG4Ovb96vR5Cg0wXlT9D4cBs2m2koyisxl4e0G1ySssC/eD181nNGKFtPR+IQf+7SaEy557/hGqoKHTZQ7xmG/3Xo44aPmDBsliIl55wj3DptpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jXDYdHOJmboi90gsc/Dxg6RLKfdYuW6ueYEtK/dqCus=;
 b=QhK6yIWfDK0CAVbL4skpKpMlbw84sSxK47RsvMjkcBppBg5YDQmBWGZ5IJE7mbwQkaApG+80JdUIOh0fha5TVgl4Zw7xnR/Uqq+7C7o+SMNAx6BIHRpOHIZXVHr+4QPrp/i84RIg9mIE2XBxmUfQQa3XythxKmNxcGrzWAidvM6ISN46rcuGEhLdTYqod5FaM0iorcPPjmkXkwZbuvrMxtf3Oh1CViPwyd2qT1jhXSiHl5m4FrbyWlv2WhcwMiCEvJl+mXXCbBeYDGT29L4WCQ7ySnGBPhbai1H3PB7YmjE56vBPr2bOSTOHsuEM2lApfePcbJu6cIMNTv/voRDxCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jXDYdHOJmboi90gsc/Dxg6RLKfdYuW6ueYEtK/dqCus=;
 b=nLH3gLeF6nS+/gWvfhVQoNbGwhmETRFdRvb+mlXHFkkY4xEYhPcxiso4tDd1POhke1df3Z+X6uJEYgAO4KRNxvSE9EHi9otg3SOLidi7T79rmyxDiMLd0x70Hc4ySPlN675w+jwyjbDyvRuEHDkMjSd8XvQ1BGNd3J2YPcRtoQZXA+Qn9Dzo46gpEgKEi4ztA7EQ/0mQby75FbnDkW/8vsqcPUDM+RZ0HAYoEhtmrAx8QvznPEzxJoRQ6t5KWJEoZtAfaMryvcxJ4+GIx1LYVoYDWtR1c0WBaNBPTDHTW7Hrdro4KnCcoRWcSwaFk3KZ4s16pIpaSCroLRTbzi/2Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH2PR12MB9494.namprd12.prod.outlook.com (2603:10b6:610:27f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 19 Sep
 2025 08:36:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 08:36:16 +0000
Message-ID: <5e4af716-e4ed-4c03-9ba9-6242977258d8@nvidia.com>
Date: Fri, 19 Sep 2025 18:36:09 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Chris Mason <clm@meta.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250918164213.2866702-1-clm@meta.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250918164213.2866702-1-clm@meta.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR04CA0019.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::29) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH2PR12MB9494:EE_
X-MS-Office365-Filtering-Correlation-Id: d011201b-e528-41cf-caa4-08ddf757997e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmlPaGVvekpPOVQxd2JlSC8rVldDWVpCQ1VKZTErcnQzTmsxZkkwK0VzcnhC?=
 =?utf-8?B?ZStMbUJ2d0FVSEhOc25ITE5yclh0OGllRlZUM1ZlREEycG02K1dLVktUQkdy?=
 =?utf-8?B?a3M3VE9yUUZKdmxMLytweGY5MERRZmRFdjdFQUFpbW94Ny9NL2VoUWdZbm5E?=
 =?utf-8?B?RmFITnVMTHpoVGEzdTZqRE1DVDRlY015N29ReGdQd2c1UmVVV1p2QmhSU2NV?=
 =?utf-8?B?WC8xaUFrTG90M1NOY0dsZ3NJckhCeW1ZSy95R2pDaStMNmhKVmptL0NmbHo1?=
 =?utf-8?B?VU02cGQ5RXpJYUtIRWNjMGZzNklKcGJudnIzNS84RkI2OWptcFhrQ3k3QlZM?=
 =?utf-8?B?dEIrUS82blhqTitNWSt6TVYwUWtHMTBNWVZ3dGV0ZHFCR2JrbzRHSmY4TnQv?=
 =?utf-8?B?NC8weVZHbUI5OGQ4bkpaV0I5RWEzNnpyVU8rb3FjdmwzMW9zcFhVY1ZHMmxZ?=
 =?utf-8?B?d0ZMUzlIOVh0MWp6MmY4SW5RZnEvMzZ3TjR6Y3cya3BjSFM3b00vS1VSMUtN?=
 =?utf-8?B?WnArMU5mRUZNYXdlLzBlMGIwOG5aOW1oY1Jtb2ZwYkZqTEtyb0o1SUNnSU1I?=
 =?utf-8?B?UUUxaFRzZFlvcUxwMlgwT3Vybm0zcjMwaWpNM25nOFVYVi93ZzlCUGRJV1ZS?=
 =?utf-8?B?YWwvbVlTRW9SWkdtWG81b3F2NUxwRVRQbWRONW5tNmxiUkZlSlFkWjNVR0tx?=
 =?utf-8?B?TGVtNFdKMHc5dVpSaS8vb2x0dWY3eEVicGgzR1RsYlF2NlE4YmFxeDdXRU9j?=
 =?utf-8?B?NlNiSWh5VmRTTDA4dmR4Y1hBTFJpaHBFOWprQ2t2eVJobXI0UDJzNi9aTFpw?=
 =?utf-8?B?VU9jVVU4UnhhNS9WeXY4Nm5kTzIvblpmOHZXaHhDY2oxazc2eFFWdUQ5WHQ2?=
 =?utf-8?B?TEttTGtZNXFIeWhzQ3M2elljaG1sbnVzNXhPa1k2aFdIOFlVSVhiT3NUK0ZO?=
 =?utf-8?B?R08ySXd4L0hLdXBCNEJYOUdNWWU5SXBITFNWZDhKemZCeDBxVGpFS2lOZXNX?=
 =?utf-8?B?MHJSZlhoQm1uQXdsMG9XUEhPNXkvTnNkc3FsVStxRkphL25IeXhCVW9RM0la?=
 =?utf-8?B?bUpsNkVrNW1ZUURaQjlSNWFNQWdYYUNDUDFXdE9PditCdldyWGJ6YStUK0Rp?=
 =?utf-8?B?Z2Y0Mk14L3BINGpCaU4vR0lpMFlmOFdjY2dEUTEvajFYNFZwRGIxRUJMdEM0?=
 =?utf-8?B?NUw5MDdzcHBwS09mT0VYRDZYbkpOSmtCbGJkL3ROL1BVOHRtUmJ3ME91aTh0?=
 =?utf-8?B?L1RCbDJPMmJvZUgzeUczbWR1Zzk0V1FWZzNUKzErZUpJcXduc1FHdmNFV0pJ?=
 =?utf-8?B?VVd6dktRYU45dGtIKzlFSFM2UmZBOXozWU8wWkxVZVFzenkrMXQwWUxsaTFF?=
 =?utf-8?B?ZzJsTUdSMExxeldteTJLckFVT3JLeVB0WGNDNHlsSGZHR0FJVG1XZjVzZWkv?=
 =?utf-8?B?VC8yRk9wYVl3Z0Q1MDY5VVhRZUd1SVdyY1dRRExaanJqNVZCN1BjbFdDWnoz?=
 =?utf-8?B?Y04wTXNXV3V0YjB0M3FaTWwraUlCT2c3OXFjbTA3N3pvUVBNazY2TzJwK05l?=
 =?utf-8?B?bFhrT2xEMUVSMTdQek9GOHVUZ3JlNXRGTUJ4c0JSSENkdVd6azgvSjdUUjdH?=
 =?utf-8?B?OXp0ZlRxcmlFd0dTRHh2Ym52Vno1ZUpwSDZiMVpGYmFyRXA3c3FlcUdEck9M?=
 =?utf-8?B?WTNrdDJqR2cwbHdBeENEWTdVZUZUaUgrMS9wS3FOUFZzWi9GOWI2b3Zibkha?=
 =?utf-8?B?cGwya3ZwNmJFK3Y2RVpxWUhFR3lnT01JVWFhaGtGcStId0VGZVl3c09na3p1?=
 =?utf-8?B?QlNzSUpFTlpTZnpuYWlBckJuaWN1OUJvTWdSRjBqaENwOVV0TERmTUtVaThE?=
 =?utf-8?B?dEJvQWNLWU5IRWwyMkl6UnJVcWxwNlZ0dU9QOFFrZkNCekNqYjVrUDdWdzVC?=
 =?utf-8?Q?ijFlWsvaLVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VjFUaXNBemlwMXNjRnpzOW9SZjJFelhkc2w4S1hWbktVdEM5SzU0SnozTzZR?=
 =?utf-8?B?QlRJTmlUanFFMEx6TGNEbjc4cUMrOTE3bVd6UVFXakkxVTFTblkwQjM3dUtm?=
 =?utf-8?B?L2p5VWdOd2NyRS9oWXdGdERSbU5RYzVWRTNuWFhUQVJyMFJMZ0dzNUVxU0p5?=
 =?utf-8?B?Z1BpWGFDRURleFF3RE1FSWxrWlptSHAzcnZST1RlTndSVzh1ZERpcUwzRG5G?=
 =?utf-8?B?d3Rqbmd2UnErMWY5Z0VWbFZRaWtMeUc0VjR2eXQxVFA4UWt0cnFNeEQxMnFI?=
 =?utf-8?B?UGgyd1ExMTJMRlBsandSOFB6dlBZRjgxa1R1V2tmYjNrN0FFc1VlWjhzQWFt?=
 =?utf-8?B?UWNNS2ZGcXVPT0dlQk40VFRXYktqRHpQMDRqK1NkRDU4N29sVTcwbWRvazN5?=
 =?utf-8?B?TXlMTHdncnJMbkZNbmRRRzkwSjNPVnYyM2tFSDJxUTVWVkxrYzhudG9vczJp?=
 =?utf-8?B?M1pBTEJTcWhOZ1ljZUFlRkFzMXo0dkJIVzN3bjJUODNxOC9vTi9DRUFRQnZ1?=
 =?utf-8?B?T0ZScndwMG81QUR2K1g0L2pmV0gzTkp1dWRyNGRzNVozS2JxOWc4TmhwSkt1?=
 =?utf-8?B?R0lSUWRpY2NlbnBLOWwrZDZYMFl1a3B1VkNxT2ZOT2tNek1lOTlRdUVZSGF1?=
 =?utf-8?B?ci9RbSswR01ES1E3ZmNybDdDTytJeXp1L25pM0VqUUdFMWpRcFZSalNvZVky?=
 =?utf-8?B?SWdjTHlpUzFZdlhDRDJHelJQRDFIa0NsVGlXKzdOR3FsWmovSkNoaXlaNUIv?=
 =?utf-8?B?YmxGOFYxNjcxaCtUdit2TThYOWhEK2pERXNjc3lGV2VzWmtCRVlDa0c3MEhX?=
 =?utf-8?B?ekcwbkppS1JnQzVvNXpqSmphT1lkSnZBeW9PMVpTZW8ydWJhZmJ3bmpGSjdt?=
 =?utf-8?B?Mjg0T01COU9saXBpVit4Z3MzNlAwRTZIRG5XQlYyQ0FzbkZrMjdtZTFGRUFh?=
 =?utf-8?B?c2VoZ3NtRTBQS1VVbTJESW5xT0gyZDZFMFZmNm1iQlA5eDJmSEQ5cGJmU21S?=
 =?utf-8?B?eGIvNFRxalR4a250UktCeG02SFVDMWZnNFFTQlRtUGRmSnBWV3E2U05wTTdu?=
 =?utf-8?B?NG5FS25XSEdON3Vqdjl6MGw1KzFYVlhVemp4RURJSjB5SFZLUGpmbzF5cW4y?=
 =?utf-8?B?RlJBcDVZOFlpSHIva1RuMURCejVReFFkY0FRdFR6U1Y1OEMxQm5EQTNGZ0JD?=
 =?utf-8?B?Rk5jcXRBUGF6cy8xZ1d6UnFQOUMyYmp5YXppeUpmNHQyMDQwRGFJOG5meXRx?=
 =?utf-8?B?TDIyQ2F2TDVpSG9UUWhUOU5adzV2ZnpkUFRzZmFaZ0dwZXRETklNSlk2Zklm?=
 =?utf-8?B?QWhXQS9hcHlzWDNCRHFUQUZoT0ZEaU5mLzAyWFIyS2xPc3dBc3d1WFlteTNK?=
 =?utf-8?B?a3VlWFA3VEpkb1d5clQzVWN0QUpFUHZka0c4UHdjVnF5eHZRVG9kQ2ZXWWpN?=
 =?utf-8?B?M3AvV1FhNlpYRklrWkdKMWVneWhLbzY2NVV1NXVpQzhMbmdpc3Y3aUZqdEJp?=
 =?utf-8?B?YzFSb0R3R3loTE9aaktuSEFmelNSZzFPUUk4NmFTdEZPSklsc3ZOWkV6RzZF?=
 =?utf-8?B?QTFtUW1mYzlkeWZ2T2RWVHFwNmtqQmlETDl0UHpnVkI1dUx1UVl3TlpxTGNJ?=
 =?utf-8?B?NWYyWDBDZEFMMVBiUGhKSDF5SHlxanVoNk9oQTlKbE5GbFFncWl4MFRycjRE?=
 =?utf-8?B?SEgyL1VJdnQzd3JWeEFXTmZWbW50dWsvdThJclBENlk5UVd1YWNSOGJTRjF5?=
 =?utf-8?B?bUxpMFJVRFdNQ0kyTmh6SmovVXlNWXk1TnVUdE5LZlIwV2hoOEFiRUUySTlD?=
 =?utf-8?B?elE0dEJEdU05VmdNWi9EZjV1NW9IRDBQSytESGF4UnpTTVlEbk81azcvWnBl?=
 =?utf-8?B?TXhPT0ppazZ4Y0dsVmtWcWRVbTNTY1dQbEc1Ris1L1F1TVpOOUVZWGEweXZC?=
 =?utf-8?B?bmZaMHJCblUxT2dUMXBxOEViVXV2SWYrMVo5WGQ5cEQ2VzIxd014c0dkejRU?=
 =?utf-8?B?RGt0ZGhjdC80ZUJsNnBJWEtrczl3SWpjV01ZL1k3QmZhWkU2ZzFXWnNDTXM3?=
 =?utf-8?B?SW8vcXJNRGNVdzZiYksybGNqeVUySjUybzFTMmY4RWtvNVdOSFc2Q3c3WFkz?=
 =?utf-8?B?dS9GeHVKT2t3VDZpSFptY3lqWHU4RVVnSUdlaXc1OCs1U0Ftc2xHUEp2UDNR?=
 =?utf-8?Q?QlljJfPgsfb7zK8e2CacwAdpCsmENnyM7uKfj/4DFjxQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d011201b-e528-41cf-caa4-08ddf757997e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 08:36:16.7496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nlni/zXMXXAQnuEOEVZx56SJ5DZ2yn5/1CHpBg+yEAg4xmcYzPw1zv+SvszhcRAapGS0VKKcA9D6irpKZNuhTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9494
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

On 9/19/25 02:42, Chris Mason wrote:
> On Mon,  8 Sep 2025 10:04:38 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
> 
>> Extend migrate_vma_collect_pmd() to handle partially mapped large
>> folios that require splitting before migration can proceed.
>>
>> During PTE walk in the collection phase, if a large folio is only
>> partially mapped in the migration range, it must be split to ensure
>> the folio is correctly migrated.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>  mm/migrate_device.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 94 insertions(+)
>>
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index abd9f6850db6..f45ef182287d 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>  	return 0;
>>  }
>>  
>> +/**
>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>> + * @folio: the folio to split
>> + * @fault_page: struct page associated with the fault if any
>> + *
>> + * Returns 0 on success
>> + */
>> +static int migrate_vma_split_folio(struct folio *folio,
>> +				   struct page *fault_page)
>> +{
>> +	int ret;
>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +	struct folio *new_fault_folio = NULL;
>> +
>> +	if (folio != fault_folio) {
>> +		folio_get(folio);
>> +		folio_lock(folio);
>> +	}
> 
> Can fault_folio ever be non-null and different from folio? Apologies for
> not knowing the lock ordering rules but this jumps out.
> 

Yes, migration can occur in fault context or be driver driven

>> +
>> +	ret = split_folio(folio);
>> +	if (ret) {
>> +		if (folio != fault_folio) {
>> +			folio_unlock(folio);
>> +			folio_put(folio);
>> +		}
>> +		return ret;
>> +	}
>> +
>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>> +
>> +	/*
>> +	 * Ensure the lock is held on the correct
>> +	 * folio after the split
>> +	 */
>> +	if (!new_fault_folio) {
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	} else if (folio != new_fault_folio) {
>> +		folio_get(new_fault_folio);
>> +		folio_lock(new_fault_folio);
>> +		folio_unlock(folio);
>> +		folio_put(folio);
>> +	}
> 
> Same question here, do we need trylocks?
> 

Since we had the folio lock before, the assumption is that we can
still grab the lock after split and it's OK to wait, since this
is not a hot-path.

Balbir Singh

