Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA99AC717A2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 00:58:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D0210E6AD;
	Wed, 19 Nov 2025 23:58:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GzwFKYMw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46CDE10E6AD
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 23:58:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzfzbrKtM4rmpq8VVg3Ep4YN1e33bUXEHUFZYAr3pDBo7NjDp2lOH8v9MqttXaWKZqZrlks7XFG/cKx3bItwXDik9FnwzQGdmZE+SitjJzI91IuT6/VkEYOmmmyUbuIid3VcIKCbl+lnLSiZkvbq6cQfOYdXpnuqd9N5C02yAfxOt/f4G/NH3TuyxTpsJowP3z2geGYmnBj3lcEpXeWMWInvcalmVJVFa12UR0L3D2+gptlQxRQuEDihmuWlzjIt5+aH97cp544B1VdJCmjhu19KeP1B+wDSUf6Yy2u6f36eL3TQjEyQT7SGijH6JPVfKe31Lw+h56y7QuZ2b95QkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ny4Azv+s3Y84bJW5pPdj5kBYUmGZ5X32Ly2qHCDAUj8=;
 b=vIKZuYkP8HRm6WMkwkD/y9upq1QjO2ubm+5E4nDLdNm95fCpq6QUFpIHk71EgtNEP8Z5RvYWrmKryGKK13+v8uLdoMRMuWHmwVcEGLn0KZvHeG9fC7Ck9M86HYUIclthSrk33g3O5dSt+9/ta7mCh4U2eJy4dDbBqQFwlMkx0jKeFsTJdBWzdfvyBVyp0QQFA5DrE89FLENy1mhzxgAPOXIhGdRtLdNhoOORVlhlNMVTbLdbY/9bJExjSeimZjbLUVFL808499A6xtWTrtgVtE5QsH2x/+A67cAI2pALQhfQTyjF0IaM3R5s+1Tk9DfhQPYc81d+MD60jVQ6JeLPJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ny4Azv+s3Y84bJW5pPdj5kBYUmGZ5X32Ly2qHCDAUj8=;
 b=GzwFKYMwMYsCFXDhuMcoOFxN03SmnFWT35DWbwgmv9XCOsCoP67Ol/6NGfmV3xQZrJtOauKC4uTyUOr/2kTpTxYB7bl8G535sJH6GKh54mFcCXxn3au7MioKDKjKFKAxJntCRFONQ0DiU5B7yruS/BJ4gnd4yBvqztXSiIpvDqbcEDMQ3s544pBslETyRQb7XMUrPxtS6sexbXpzjhEGp2hDMevpU6NJsG9GvxOgyMyaKe34QC/1r0PuvF7wdHT6UjOrsX9dz91xJliKFJHuNtHmVjxUiHQehhRCJS3mePuqmc8arLrh28elksInKvvIFjw9TzD5lpTL9jl2Nxug5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH3PR12MB8282.namprd12.prod.outlook.com (2603:10b6:610:124::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 23:58:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 23:58:16 +0000
Message-ID: <661d1f3b-0f04-43fc-85ef-d29d492a2b06@nvidia.com>
Date: Thu, 20 Nov 2025 10:58:07 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
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
References: <202511151216.rhK2ItOb-lkp@intel.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <202511151216.rhK2ItOb-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH3PR12MB8282:EE_
X-MS-Office365-Filtering-Correlation-Id: 1977086c-f16e-40ad-b342-08de27c7819d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUZlcklqVEhEc0IwTGxueUtybHNnbE55VXkzSWNtNUV1emVMc2MzWC84TTNw?=
 =?utf-8?B?amljOXhSSXEwc0p5Qmlob010bXJ0N2pEKzM2S3QzWTcxSVlYMXhVa0VMUXR2?=
 =?utf-8?B?ZngyZ1FQMUczMnhkTlM4cHpyZzZMVG9yVE5IRGlkRWFhSTJvT3BrYkxYOWdJ?=
 =?utf-8?B?bzdqMm5WcUhtUURYQ3dhcGlhUU1aL1YrQzl0OXJ6YjllVVF3U0xYa0ttemxj?=
 =?utf-8?B?Mlk2dDVGUVVYamhyRDB2bFFEZG8vV2lCVUptdEg2QkszWmgyand4dzRveHZP?=
 =?utf-8?B?emRWWVlGcWo4K0JQZWZTemVmclAzNHpCYzl6MTB1S2NwYnhWZTE5SDRmTUtM?=
 =?utf-8?B?ckxxUnN1OGo0amVBNFF1S0RWcHFRbGZVK2xSTTFrWkpnQTFzTU5zMjAxQkJo?=
 =?utf-8?B?bHZSQmF1RGh1SHMydGtKaUVGNEs1Y0NUaEkyNzRiUFNrVllOekNHL3JQeVBK?=
 =?utf-8?B?MW1LMGF1L3Q4VXJvTncxaDUvTzdnemtRRXEzU2FSdWlBM2N4VHhnTTRaeFlz?=
 =?utf-8?B?dFppbUlCbDJQZmxHanZsYVlrdVY3dXlnSkZnblpFcEtVb3lzcXl2WURqVUs2?=
 =?utf-8?B?b1c1eGhTRDlodVdXZ3YycDJQU3ZxeG5rVmJKdzFMckdraTh1dHhGYVpPK2Zt?=
 =?utf-8?B?UGZXM05YK2Q3UWRSS3E5WDhZUE11OU0yTnZaR0VwZ1BEN1I0Mkp4ZitjVy9L?=
 =?utf-8?B?RElodklCT0NRL25HdmRway9NNCtVL3Y5cGtQcU9MMk9tYTY5NzQ2WkVuVy81?=
 =?utf-8?B?T3I3U3g0TzF3V2s3cm0rNkZFOVpFR1FrUTFmVzlaMkhCa1JaOE1ITVMvWVcx?=
 =?utf-8?B?U3JFTnh3RHM5dFFmck9IYzA2T2NqMkdldFhNMTdoYm5TYktxRnR0QXlPL3A3?=
 =?utf-8?B?VVVMZHJGcHNoZUxsdDQ2Qzk1ajRxOXQzc0thNGpkMEVrVXE1Z3FUeEhUaWFi?=
 =?utf-8?B?OUpTUk5Bai9EeHpkd0J1VEhFb3M0aE5yMWJDaFZjN0dxdmpvU1lvSXgvb1N2?=
 =?utf-8?B?TzhNM1IxMWcrSHJMS3dmTmx6dFdjL2VoTlpvSHQrZEVQMWtEaTJOOHgrclNP?=
 =?utf-8?B?bVlvZG4rQjJOZFZuenRDVW5LZFZ0WHpuM1JlYWJNVVZ6cXJYN1o2RDFjSnZn?=
 =?utf-8?B?VzJkTTlxMjdYa0lHNE9SeUxnMGhOdW1CcUZLZm1JTytKNU14Unllb3JqY0dj?=
 =?utf-8?B?OVhSWTZwYzluY0xSS3FJUUw0SjA0K3pRV1lTM0xMekI1RTNiMEpNNjBmRkZH?=
 =?utf-8?B?MXhVZDhSU28wd3JSS1RVL015SFBJTUdPandoUXBlcGNFMGNhZGlzeHFveURh?=
 =?utf-8?B?cWJsRUtyVDVtYk43QXZHaDBaNW0vUCs4dVJjRlpaSitaYzNqNVp3cnhVY1FM?=
 =?utf-8?B?WVpkditpcENnRkNuVHpmeHM5TDdBdi9lWjgxek5ZbkRxalQwRjVROHVob3NL?=
 =?utf-8?B?K3dqcjhpRS9JSUMvQ1loRk9SSFdyM0Q4cFV3NC92WmE4OGRpSmNsUHRJakt5?=
 =?utf-8?B?aXIvUU5jU2JUSVhSSldYVEErS2lHa1RMc2JYcENtRWtjRUZkU1NoeTdIVFZ2?=
 =?utf-8?B?NDB2OWZ1NnM2Y2pDeXlEMUV3MjYzekI4RzVydmpUNWhZUG5Hblh6ZDdpWkJt?=
 =?utf-8?B?VDhOM09lTGZMaXRZUi9KQTVMMUp0V1d5c21VaDZxNlZob0dGSU83b1VReXVG?=
 =?utf-8?B?OXpCQ3Y3WHJtV3ZZc2ZINjlUY1NRSmM3NStSVG1rYUZHNTdkdXZnVlA5dUho?=
 =?utf-8?B?elFuamNlWEhlampLZmYwbjlvUTBWL3d3MFJSQ0hHOFZ2YlJNc0ZsSkxSaWJa?=
 =?utf-8?B?VWFFOW90RkdkRXViYUpMOGQvcVJRdmMvWTVjR0gxbENkSE02T00vbkpVclpa?=
 =?utf-8?B?NHNWMmFXOU45L1IvaXdlM2NyWG9jMXI0ckxHdXgrQkRLQmVGalRmU1N0SGp0?=
 =?utf-8?B?bnRObkMwTzhOYzlKL2hWTlQ5bWdYUjMxbzkvTE1YV2lwaWxIWDA0VDRXbVRC?=
 =?utf-8?B?ZjRsT0VaVWpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TVpOajJYVmRkeXh4WHo0d0hCL1E4aXJ3dEwrT2d4NVk0RXl1L1VEMVhhWjJJ?=
 =?utf-8?B?d1A3dy80OGM4a3Q2TjIvbnBQZU5QMU90L3ptQ05mazVXbExxc3A0SWQvRHVK?=
 =?utf-8?B?RWllRGE4SFNyRC9VbDA1RUZkWXRrSFdWNmorQk93VGhsYk5ZUGpDcTFnakR6?=
 =?utf-8?B?bWZadWZxMUtYenJZY3JjMENZc29QS29BckZPZUxSeUo3bUtvOUZ5cmxEelk2?=
 =?utf-8?B?cTcxUGl2MWhUODdjcFUrajQvWS80VXVVVW1vbzlkaUZMVHNraGNiRDhwQjQz?=
 =?utf-8?B?cHlPTHRnL3B6MjJYTk9YYlM3QmxUV094VlBVVTJBdllKYk1ZbnkzRUVZbWht?=
 =?utf-8?B?VHFlS1Y4QlB6Q2plTEU0dXdBRmFmcUlsN2I3NFVyTE8rWmRTWGxpaE42NEZ0?=
 =?utf-8?B?dThSOVlqZkJ0RkVRQktzaVFBdGozNnl5S2VYVnhBMVhWN3FRd0pPVStBQzlh?=
 =?utf-8?B?S1EwaEhIUEo0R0xadXQ1YmRybHYvbXZURFAwU0tJWjNvWlMxelBRVHJXcTIx?=
 =?utf-8?B?aVNnTGJjZmk5dTNIZDlwcFVpaS8wcXRCbk8zSy80T052a2lCNUVxNFlESTJS?=
 =?utf-8?B?QVlKam1FWVhLQktqbUU3UFc3Myt2VEs1Y0dBVDNGMGovQVRvVFFYOFRrR1Ur?=
 =?utf-8?B?NVhhOFJMc21BMCt2eURGci94b3BwWlpzVk9kWW5FZEtSTCtjb1VOdmpQellB?=
 =?utf-8?B?NWlOQ2RCY0I0VEE1N0xRV3ZTTjNBb0ZwWmtsSi9LZjBRY2lPbTgrWTVUYXYy?=
 =?utf-8?B?TjA5d0tmbE5ldUlQT3VVWEtQYlhxNDdHNENLK2Y3Mi9zekpQK3ZUaGUxMVBN?=
 =?utf-8?B?TW1jMVBhU2R0M3JMWUEwMUc2am9odUhCZ1NoL3ZXNGd0ZER1ZEJZT2srcThk?=
 =?utf-8?B?c1J3cHAzWTNKb21VQjladVFXUjcrYmxET25vcWl1TjRrM3V4UFc5ZUJxU0xJ?=
 =?utf-8?B?VmN6SENVVk9VemwzWGxiaFBBUnIveDcrdlNMTDhQUEg3TllGRkxQdXY4Zzlm?=
 =?utf-8?B?bUt3R1Y1QjVMcXlmd3o4TjFUM3Z0N2JGNHhSLzRwbFVmN3o2RXUvTm14S2xL?=
 =?utf-8?B?VTg3TmdZbmdlb056RHAyTVdHUGNuWUVLbzV6NVoxVVI0UkVDVHJtZlZrTUpy?=
 =?utf-8?B?MytybWRCUW1vMkVaVE9nOTNDMG5Cdk9uOWo4Q2dNbjhscHJKeE1kbFJCZGNv?=
 =?utf-8?B?N3RTQXlZN3FzYmQvcGJKWkM1T2d2cXlJWENZUkI4Y3hyWFNUbWNpZnE0b3Zs?=
 =?utf-8?B?a29FZ2hwSmFaTjcvbTg2MEdSUW5GTXhHNnJYdDRiSzlDRDN1bmNFbm10OVIy?=
 =?utf-8?B?MTJPbWFtdTh5bWdTek40bHI0ZGRLbGNVRW83QUxQWS9ocXgwbG5RRys2QmN4?=
 =?utf-8?B?cUdUbnFYc3d3S0d1b05vWWdXTUplSFVwMWROZXB1NlJWbkpjdFlJT2M1eGpy?=
 =?utf-8?B?ZnZuU2lOd1ZGMkJ0RDFxaC9mcDQ1Qlg5bTdrbnhROC9LQkFxam81SjFja1Ro?=
 =?utf-8?B?cHh3Q0E1a3RuL0hKOHlkM2g5MVlZakltWGhpdElmdVhZVEJHN0xUdWhLSTYz?=
 =?utf-8?B?cDRrTjhHVGU4YWF3Z20rRVdaamtsRUtiS05seEp5dHdSY3pyRGE5SDNIbnBN?=
 =?utf-8?B?NlNObDBHaXc1ODducVk4Ym1vY2tnSVY5V2NnZlZSYUJobWplSk03M0FHNWpt?=
 =?utf-8?B?UUFNTVdoY2UwajFQRE5CVjM1RGlGN3NqQ3V4MlNwVkJrZmVhNWZvb0FTcklS?=
 =?utf-8?B?dDV4UzB0UUJUSFcwVnZRVDJOTThPbUFkL0tEK2ZjUWVVaVg1T0s4SEFpTFU4?=
 =?utf-8?B?dmJmOWkvSWxRNzM3NVYxSEJvZHJlRC82bU1LNFltNWdXNXBxMEJqWk1zTjBq?=
 =?utf-8?B?Zm1JOXVOMlo3ZG5MKzc3em5pMFZmWDdJRkcyaXFtWUJzQUZjcUt4eUNyUnBS?=
 =?utf-8?B?VGdKenZpZHd4Y3o0bVBRb1VmWjloc0xPRnpLVyswbE9yQzh6RnJUSE1XUkhE?=
 =?utf-8?B?WEoyYUw1blQzL2I5Rms0OXZ5SUR4L29FZGh2bGNkbmM2cFNrM1RkWjYwQS9i?=
 =?utf-8?B?SUdiWjNUem1xWG1MU1dDdktTSzg0RGhxalBvRG5SU3hRZS9JYjBHYlNwbnZC?=
 =?utf-8?B?Zk1pb1JxZkJHb01iU2VnelovY3B1OVNwTXg2aUZ0RmVTZ1c5WkJaYUtMRWpZ?=
 =?utf-8?Q?bHq836EMF0/oPE3kjT/px7OinmiYa0cE7wJZfnNAE8kw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1977086c-f16e-40ad-b342-08de27c7819d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 23:58:16.1314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPBdfCNlqo0R+7nV2R+IY4jUecTatguTyhopiKcw1AfuVoZ+xOhaz6liw7weWt2KqENVVPlw3BDufnBttGhZRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8282
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

On 11/19/25 23:32, Dan Carpenter wrote:
> Hi Balbir,
> 
> kernel test robot noticed the following build warnings:
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Balbir-Singh/mm-huge_memory-c-introduce-folio_split_unmapped/20251114-093541
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> patch link:    https://lore.kernel.org/r/20251114012228.2634882-1-balbirs%40nvidia.com
> patch subject: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
> config: i386-randconfig-141-20251115 (https://download.01.org/0day-ci/archive/20251115/202511151216.rhK2ItOb-lkp@intel.com/config)
> compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202511151216.rhK2ItOb-lkp@intel.com/
> 
> smatch warnings:
> mm/huge_memory.c:4044 __folio_split() error: uninitialized symbol 'end'.
> mm/huge_memory.c:4052 __folio_split() error: we previously assumed 'mapping' could be null (see line 4046)
> 

Thanks for the report!

If mapping is not NULL, end is initialized. More comments on UBSan below

> vim +/end +4044 mm/huge_memory.c
> 
> 6384dd1d18de7b Zi Yan                  2025-03-07  3908  static int __folio_split(struct folio *folio, unsigned int new_order,
> 58729c04cf1092 Zi Yan                  2025-03-07  3909  		struct page *split_at, struct page *lock_at,
> f6b1f167ffe29f Balbir Singh            2025-11-14  3910  		struct list_head *list, enum split_type split_type)
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3911  {
> 58729c04cf1092 Zi Yan                  2025-03-07  3912  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
> 6c7de9c83be68b Zi Yan                  2025-07-18  3913  	struct folio *end_folio = folio_next(folio);
> 5d65c8d758f259 Barry Song              2024-08-24  3914  	bool is_anon = folio_test_anon(folio);
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3915  	struct address_space *mapping = NULL;
> 5d65c8d758f259 Barry Song              2024-08-24  3916  	struct anon_vma *anon_vma = NULL;
> 8ec26327c18e1d Wei Yang                2025-10-10  3917  	int old_order = folio_order(folio);
> 6c7de9c83be68b Zi Yan                  2025-07-18  3918  	struct folio *new_folio, *next;
> 391dc7f40590d7 Zi Yan                  2025-07-18  3919  	int nr_shmem_dropped = 0;
> 391dc7f40590d7 Zi Yan                  2025-07-18  3920  	int remap_flags = 0;
> 504e070dc08f75 Yang Shi                2021-06-15  3921  	int extra_pins, ret;
> 006d3ff27e884f Hugh Dickins            2018-11-30  3922  	pgoff_t end;
> 478d134e9506c7 Xu Yu                   2022-04-28  3923  	bool is_hzp;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3924  
> 714b056c832106 Zi Yan                  2025-07-17  3925  	VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
> 714b056c832106 Zi Yan                  2025-07-17  3926  	VM_WARN_ON_ONCE_FOLIO(!folio_test_large(folio), folio);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3927  
> 58729c04cf1092 Zi Yan                  2025-03-07  3928  	if (folio != page_folio(split_at) || folio != page_folio(lock_at))
> 1412ecb3d256e5 Zi Yan                  2024-03-07  3929  		return -EINVAL;
> 1412ecb3d256e5 Zi Yan                  2024-03-07  3930  
> 8ec26327c18e1d Wei Yang                2025-10-10  3931  	if (new_order >= old_order)
> c010d47f107f60 Zi Yan                  2024-02-26  3932  		return -EINVAL;
> 58729c04cf1092 Zi Yan                  2025-03-07  3933  
> aa27253af32c74 Wei Yang                2025-11-06  3934  	if (!folio_split_supported(folio, new_order, split_type, /* warn = */ true))
> 6a50c9b512f773 Ran Xiaokai             2024-06-07  3935  		return -EINVAL;
> c010d47f107f60 Zi Yan                  2024-02-26  3936  
> 5beaee54a324ba Matthew Wilcox (Oracle  2024-03-26  3937) 	is_hzp = is_huge_zero_folio(folio);
> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3938  	if (is_hzp) {
> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3939  		pr_warn_ratelimited("Called split_huge_page for huge zero page\n");
> 478d134e9506c7 Xu Yu                   2022-04-28  3940  		return -EBUSY;
> 4737edbbdd4958 Naoya Horiguchi         2023-04-06  3941  	}
> 478d134e9506c7 Xu Yu                   2022-04-28  3942  
> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3943) 	if (folio_test_writeback(folio))
> 59807685a7e77e Ying Huang              2017-09-06  3944  		return -EBUSY;
> 59807685a7e77e Ying Huang              2017-09-06  3945  
> 5d65c8d758f259 Barry Song              2024-08-24  3946  	if (is_anon) {
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3947  		/*
> c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  3948  		 * The caller does not necessarily hold an mmap_lock that would
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3949  		 * prevent the anon_vma disappearing so we first we take a
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3950  		 * reference to it and then lock the anon_vma for write. This
> 2f031c6f042cb8 Matthew Wilcox (Oracle  2022-01-29  3951) 		 * is similar to folio_lock_anon_vma_read except the write lock
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3952  		 * is taken to serialise against parallel split or collapse
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3953  		 * operations.
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3954  		 */
> 29eea9b5a9c9ec Matthew Wilcox (Oracle  2022-09-02  3955) 		anon_vma = folio_get_anon_vma(folio);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3956  		if (!anon_vma) {
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3957  			ret = -EBUSY;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3958  			goto out;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3959  		}
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  3960  		anon_vma_lock_write(anon_vma);
> 3d4c0d98eb8572 Balbir Singh            2025-10-01  3961  		mapping = NULL;
> 
> end is not initialized for anonymous folios.
> 

Yes

> baa355fd331424 Kirill A. Shutemov      2016-07-26  3962  	} else {
> e220917fa50774 Luis Chamberlain        2024-08-22  3963  		unsigned int min_order;
> 6a3edd29395631 Yin Fengwei             2022-08-10  3964  		gfp_t gfp;
> 6a3edd29395631 Yin Fengwei             2022-08-10  3965  
> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  3966) 		mapping = folio->mapping;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3967  
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3968  		/* Truncated ? */
> 6384dd1d18de7b Zi Yan                  2025-03-07  3969  		/*
> 6384dd1d18de7b Zi Yan                  2025-03-07  3970  		 * TODO: add support for large shmem folio in swap cache.
> 6384dd1d18de7b Zi Yan                  2025-03-07  3971  		 * When shmem is in swap cache, mapping is NULL and
> 6384dd1d18de7b Zi Yan                  2025-03-07  3972  		 * folio_test_swapcache() is true.
> 6384dd1d18de7b Zi Yan                  2025-03-07  3973  		 */
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3974  		if (!mapping) {
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3975  			ret = -EBUSY;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3976  			goto out;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3977  		}
> baa355fd331424 Kirill A. Shutemov      2016-07-26  3978  
> e220917fa50774 Luis Chamberlain        2024-08-22  3979  		min_order = mapping_min_folio_order(folio->mapping);
> e220917fa50774 Luis Chamberlain        2024-08-22  3980  		if (new_order < min_order) {
> e220917fa50774 Luis Chamberlain        2024-08-22  3981  			ret = -EINVAL;
> e220917fa50774 Luis Chamberlain        2024-08-22  3982  			goto out;
> e220917fa50774 Luis Chamberlain        2024-08-22  3983  		}
> e220917fa50774 Luis Chamberlain        2024-08-22  3984  
> 6a3edd29395631 Yin Fengwei             2022-08-10  3985  		gfp = current_gfp_context(mapping_gfp_mask(mapping) &
> 6a3edd29395631 Yin Fengwei             2022-08-10  3986  							GFP_RECLAIM_MASK);
> 6a3edd29395631 Yin Fengwei             2022-08-10  3987  
> 0201ebf274a306 David Howells           2023-06-28  3988  		if (!filemap_release_folio(folio, gfp)) {
> 6a3edd29395631 Yin Fengwei             2022-08-10  3989  			ret = -EBUSY;
> 6a3edd29395631 Yin Fengwei             2022-08-10  3990  			goto out;
> 6a3edd29395631 Yin Fengwei             2022-08-10  3991  		}
> 6a3edd29395631 Yin Fengwei             2022-08-10  3992  
> 3c844d850e4486 Wei Yang                2025-11-06  3993  		if (split_type == SPLIT_TYPE_UNIFORM) {
> 58729c04cf1092 Zi Yan                  2025-03-07  3994  			xas_set_order(&xas, folio->index, new_order);
> 8ec26327c18e1d Wei Yang                2025-10-10  3995  			xas_split_alloc(&xas, folio, old_order, gfp);
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3996) 			if (xas_error(&xas)) {
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3997) 				ret = xas_error(&xas);
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3998) 				goto out;
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  3999) 			}
> 58729c04cf1092 Zi Yan                  2025-03-07  4000  		}
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4001) 
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4002  		anon_vma = NULL;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4003  		i_mmap_lock_read(mapping);
> 006d3ff27e884f Hugh Dickins            2018-11-30  4004  
> 006d3ff27e884f Hugh Dickins            2018-11-30  4005  		/*
> 58729c04cf1092 Zi Yan                  2025-03-07  4006  		 *__split_unmapped_folio() may need to trim off pages beyond
> 58729c04cf1092 Zi Yan                  2025-03-07  4007  		 * EOF: but on 32-bit, i_size_read() takes an irq-unsafe
> 58729c04cf1092 Zi Yan                  2025-03-07  4008  		 * seqlock, which cannot be nested inside the page tree lock.
> 58729c04cf1092 Zi Yan                  2025-03-07  4009  		 * So note end now: i_size itself may be changed at any moment,
> 58729c04cf1092 Zi Yan                  2025-03-07  4010  		 * but folio lock is good enough to serialize the trimming.
> 006d3ff27e884f Hugh Dickins            2018-11-30  4011  		 */
> 006d3ff27e884f Hugh Dickins            2018-11-30  4012  		end = DIV_ROUND_UP(i_size_read(mapping->host), PAGE_SIZE);
> d144bf6205342a Hugh Dickins            2021-09-02  4013  		if (shmem_mapping(mapping))
> d144bf6205342a Hugh Dickins            2021-09-02  4014  			end = shmem_fallocend(mapping->host, end);
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4015  	}
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4016  
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4017  	/*
> 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4018) 	 * Racy check if we can split the page, before unmap_folio() will
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4019  	 * split PMDs
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4020  	 */
> 8710f6ed34e7bc David Hildenbrand       2024-08-02  4021  	if (!can_split_folio(folio, 1, &extra_pins)) {
> fd4a7ac32918d3 Baolin Wang             2022-10-24  4022  		ret = -EAGAIN;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4023  		goto out_unlock;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4024  	}
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4025  
> 684555aacc90d7 Matthew Wilcox (Oracle  2022-09-02  4026) 	unmap_folio(folio);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4027  
> b6769834aac1d4 Alex Shi                2020-12-15  4028  	/* block interrupt reentry in xa_lock and spinlock */
> b6769834aac1d4 Alex Shi                2020-12-15  4029  	local_irq_disable();
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4030  	if (mapping) {
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4031  		/*
> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4032) 		 * Check if the folio is present in page cache.
> 3e9a13daa61253 Matthew Wilcox (Oracle  2022-09-02  4033) 		 * We assume all tail are present too, if folio is there.
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4034  		 */
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4035) 		xas_lock(&xas);
> 6b24ca4a1a8d4e Matthew Wilcox (Oracle  2020-06-27  4036) 		xas_reset(&xas);
> 391dc7f40590d7 Zi Yan                  2025-07-18  4037  		if (xas_load(&xas) != folio) {
> 391dc7f40590d7 Zi Yan                  2025-07-18  4038  			ret = -EAGAIN;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4039  			goto fail;
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4040  		}
> 391dc7f40590d7 Zi Yan                  2025-07-18  4041  	}
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4042  
> f6b1f167ffe29f Balbir Singh            2025-11-14  4043  	ret = __folio_freeze_and_split_unmapped(folio, new_order, split_at, &xas, mapping,
> f6b1f167ffe29f Balbir Singh            2025-11-14 @4044  						true, list, split_type, end, extra_pins);
>                                                                                                                                 ^^^
> Passing uninitialized variables isn't allowed unless the function is
> inlined.  It triggers a UBSan warning at runtime as well.

end is expected to be unused when uninitialized, are you suggesting we need to have a default value even if unused inside the function.
My daily build has UBSan enabled, I'll try again

CONFIG_UBSAN=y
CONFIG_CC_HAS_UBSAN_ARRAY_BOUNDS=y
# CONFIG_UBSAN_BOUNDS is not set
CONFIG_UBSAN_SHIFT=y
# CONFIG_UBSAN_UNREACHABLE is not set
# CONFIG_UBSAN_BOOL is not set
# CONFIG_UBSAN_ENUM is not set


> 
> 391dc7f40590d7 Zi Yan                  2025-07-18  4045  fail:
> 6c7de9c83be68b Zi Yan                  2025-07-18 @4046  	if (mapping)
> 6c7de9c83be68b Zi Yan                  2025-07-18  4047  		xas_unlock(&xas);
> 6c7de9c83be68b Zi Yan                  2025-07-18  4048  
> 6c7de9c83be68b Zi Yan                  2025-07-18  4049  	local_irq_enable();
> 6c7de9c83be68b Zi Yan                  2025-07-18  4050  
> 391dc7f40590d7 Zi Yan                  2025-07-18  4051  	if (nr_shmem_dropped)
> 391dc7f40590d7 Zi Yan                  2025-07-18 @4052  		shmem_uncharge(mapping->host, nr_shmem_dropped);
> 
> Smatch complains that mapping can be NULL, but this is false positive
> because nr_shmem_dropped is always zero.
> 

Agreed

> 6c7de9c83be68b Zi Yan                  2025-07-18  4053  
> 958fea4c1e2eb6 Balbir Singh            2025-10-01  4054  	if (!ret && is_anon && !folio_is_device_private(folio))
> 391dc7f40590d7 Zi Yan                  2025-07-18  4055  		remap_flags = RMP_USE_SHARED_ZEROPAGE;
> 958fea4c1e2eb6 Balbir Singh            2025-10-01  4056  
> 8ec26327c18e1d Wei Yang                2025-10-10  4057  	remap_page(folio, 1 << old_order, remap_flags);
> 6c7de9c83be68b Zi Yan                  2025-07-18  4058  
> 6c7de9c83be68b Zi Yan                  2025-07-18  4059  	/*
> 6c7de9c83be68b Zi Yan                  2025-07-18  4060  	 * Unlock all after-split folios except the one containing
> 6c7de9c83be68b Zi Yan                  2025-07-18  4061  	 * @lock_at page. If @folio is not split, it will be kept locked.
> 6c7de9c83be68b Zi Yan                  2025-07-18  4062  	 */
> 391dc7f40590d7 Zi Yan                  2025-07-18  4063  	for (new_folio = folio; new_folio != end_folio; new_folio = next) {
> 6c7de9c83be68b Zi Yan                  2025-07-18  4064  		next = folio_next(new_folio);
> 6c7de9c83be68b Zi Yan                  2025-07-18  4065  		if (new_folio == page_folio(lock_at))
> 6c7de9c83be68b Zi Yan                  2025-07-18  4066  			continue;
> 6c7de9c83be68b Zi Yan                  2025-07-18  4067  
> 6c7de9c83be68b Zi Yan                  2025-07-18  4068  		folio_unlock(new_folio);
> 6c7de9c83be68b Zi Yan                  2025-07-18  4069  		/*
> 6c7de9c83be68b Zi Yan                  2025-07-18  4070  		 * Subpages may be freed if there wasn't any mapping
> 6c7de9c83be68b Zi Yan                  2025-07-18  4071  		 * like if add_to_swap() is running on a lru page that
> 6c7de9c83be68b Zi Yan                  2025-07-18  4072  		 * had its mapping zapped. And freeing these pages
> 6c7de9c83be68b Zi Yan                  2025-07-18  4073  		 * requires taking the lru_lock so we do the put_page
> 6c7de9c83be68b Zi Yan                  2025-07-18  4074  		 * of the tail pages after the split is complete.
> 6c7de9c83be68b Zi Yan                  2025-07-18  4075  		 */
> 6c7de9c83be68b Zi Yan                  2025-07-18  4076  		free_folio_and_swap_cache(new_folio);
> 6c7de9c83be68b Zi Yan                  2025-07-18  4077  	}
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4078  
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4079  out_unlock:
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4080  	if (anon_vma) {
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4081  		anon_vma_unlock_write(anon_vma);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4082  		put_anon_vma(anon_vma);
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4083  	}
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4084  	if (mapping)
> baa355fd331424 Kirill A. Shutemov      2016-07-26  4085  		i_mmap_unlock_read(mapping);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4086  out:
> 69a37a8ba1b408 Matthew Wilcox (Oracle  2022-06-08  4087) 	xas_destroy(&xas);
> 8ec26327c18e1d Wei Yang                2025-10-10  4088  	if (old_order == HPAGE_PMD_ORDER)
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4089  		count_vm_event(!ret ? THP_SPLIT_PAGE : THP_SPLIT_PAGE_FAILED);
> 8ec26327c18e1d Wei Yang                2025-10-10  4090  	count_mthp_stat(old_order, !ret ? MTHP_STAT_SPLIT : MTHP_STAT_SPLIT_FAILED);
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4091  	return ret;
> e9b61f19858a5d Kirill A. Shutemov      2016-01-15  4092  }
> 

Balbir
