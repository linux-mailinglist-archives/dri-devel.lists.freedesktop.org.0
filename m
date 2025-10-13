Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C681FBD6578
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 23:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC42810E04E;
	Mon, 13 Oct 2025 21:17:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tBOijEF9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012059.outbound.protection.outlook.com
 [40.93.195.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6749C10E04E
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 21:17:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/ixbph94jxIHlcpcyUGJT0ViKdw2azvLq4MClWKXUD94ZnqthUJwaLwWvhhRU7zjSqMGQm+zq4b3acDzocUbkwMrk5g/l+7XDQ8VpWam4tpCOuwzfPhz8WlF92XPMaSg64796MizRz0BCPadcv+ZLpTYaxPOTPXY4OFToQpbeQk34rFmWphGNj31SVkN2oud/R6YIJqHI52W+ZliUund7tLudnpMCfa1Fu7gcboQERoeYj1+tjVmhUxnzdG8OXt9ElHhflIpS63n0hBjS4u82LEbpwk1eFfVA9YdLQM7dnGZGdjO+yhtI8CVgpC8FlkhP2SuiDziZpnXrn8ybsR+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hl3m6ZGbQQxw6jXRBSGS7aNDz5iVCux0urvJHDuWxvA=;
 b=LhZ7qPQ1TiCW2E9LR51aEIJz6/6t51DgY/Wuw3T0itaZ21b/0jk+YnVnAZgxr0ksBTCfCUP1tBK+PtgSUABM1WEsiPKtmBLbvlWfi18hWT0u8nPBRx8D5wgqmHVJEqettms/LSnKK60Vy7eroTnp2/fwS4DXk4PSDozOru2NZ42OE4ClQxhks/VtRuHsXDyZWV9njaF1mmlkvBtp94Xi9b1aKTHBEei7IuTTvOpI0w8NR0lDwgJUJghMJVzK6/5Vljb092YcxrtlrF9LWfi1cSZ4ptOTuaDX+YgWmLTwuqTbUtf35d/1YPJyQg3//55QFzsktDuMoiSyRrA7gBHZ3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hl3m6ZGbQQxw6jXRBSGS7aNDz5iVCux0urvJHDuWxvA=;
 b=tBOijEF9Hep8kLnKZz3Zfno9j6da4pVdWGa7Z1mCE8OfAFsoUH8SLBYLTu5lJAS6bXkYwjL7JcvVeuhUvL1w+LEPDR1TsphLrS5UEDAf0SURcOhvmfm7nfXA8a3wqYzxJ6DC/J3X1ELkCowFAubtvYL0yIcuhtPVfddTLL7HV+fKXQky9vJRz1NpFhTRS5GbKSonXckA80nKHNsWfFoTN2m0MN1kLYy016NjcQLazPswvqUj2JhfhF3zRr1QPMrrrz1n9uipwnc+PrIFjxjW/jExfAOxH4OPBnOKCQoYI6evwmoakaBo8KyVs2DxF/fyAvRRP0WAXrPbcXCg7cCBSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH8PR12MB9837.namprd12.prod.outlook.com (2603:10b6:610:2b4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 21:17:48 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::5189:ecec:d84a:133a%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 21:17:47 +0000
From: Zi Yan <ziy@nvidia.com>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Nico Pache <npache@redhat.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Ralph Campbell <rcampbell@nvidia.com>,
 =?utf-8?q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: Re: [v7 11/16] mm/migrate_device: add THP splitting during migration
Date: Mon, 13 Oct 2025 17:17:44 -0400
X-Mailer: MailMate (2.0r6272)
Message-ID: <FB8D8651-639F-4882-9868-7FA0A8B62397@nvidia.com>
In-Reply-To: <20251001065707.920170-12-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-12-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BN9P223CA0015.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:408:10b::20) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH8PR12MB9837:EE_
X-MS-Office365-Filtering-Correlation-Id: 0aadff5e-7e00-4e3d-cae1-08de0a9df565
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wkc4U0VzdXhuak1MWG9WNmUxZ1RnUkllLzNhdW9uRTh5Vkh0NEc0eUlZUlpM?=
 =?utf-8?B?eXFkRXlNaXhxL0RXMWxvMEt2aU0xL3RJeDJJdFY0dVppaWdLMXdzb2gveUM4?=
 =?utf-8?B?ZFFaUGIrSHVDNlhRWDdzeVA1YjhOSllaQzJzQ2ZLamg4OVZXR1FPZEc1YzZK?=
 =?utf-8?B?Q1F3LzF4bzFpRjVzS1dFWEZaK2F3MmYrTVhrN0VBYXNtMUJhTUtWLzlBcFRu?=
 =?utf-8?B?QS85SXh1REtqQXdkYWY0ZzhtZkJrc2lsWmZYVm0rY0F0RTU3blZ0bG1nbXBp?=
 =?utf-8?B?cHJrV2k3U0UxMDJaUnRMRWtreG8vNzBzVnViR21TTStnVGZiN3RXSWNJRThK?=
 =?utf-8?B?K3BPbVNUTldwcUs4QytaVFZ5WUY2NVZGZEtvU3k1MjBqMkN4MjZDTUh4dldv?=
 =?utf-8?B?RXhyYnU3VEhRVzlFQjBNK1I5b25FZDY2aldHZUZZRk1BT1BtYW8xNG1kdG9M?=
 =?utf-8?B?YytnYVhHWTEwVWNaL2wyNWw1bmttSDVINk9QYWNoM0lVRzdrZ3ZUN09RUzBW?=
 =?utf-8?B?emR4S21EWnc3dXNZZWR5UzdIdjBjcjNWaVBIS0VpdFB2cFlGaDBOY1JTWDNp?=
 =?utf-8?B?akhNRFIzanBsaGxpYnpNWmhSV3VRaGVxVy9ieXZmYlI1b0pGMGR5cDB5TEo4?=
 =?utf-8?B?Z1lqLzFQUXNBK3ZLejlzSjhyOUROWTdPcE0rSTc1S2pLc2JENlppM0ZGcnFq?=
 =?utf-8?B?enVNSDAwU0RxSnV0cDJNcUVnMTJpTS91MW1ydTU0enJUZHVGcG1IQysyOS9r?=
 =?utf-8?B?T3FLODh3VFhrZ2t0cmpUVmJLWVA4M1FTT2N1aVRET1JFMjdPbXNXZlcwdERZ?=
 =?utf-8?B?T0dBTDgrWlFnV2pHV2tMQWN5NEZqY3d1N0NSOGNSWHg1RzNnUjE1Nno4K05V?=
 =?utf-8?B?T1F5aE1iU3FySXpRUEFhbUUzY0xNRERDdFdHTGkzdWhLV0p4bytxais4SVRi?=
 =?utf-8?B?WWNOdVMrK3RWNUxERUh6U01rZVFTWFZtcDBnMTVpSXRLdEhXMkgwVllScXI0?=
 =?utf-8?B?ZFFkRzcxbDh1aWp2ZFF0Nnlib2VLNXhlakJGc2JiU2ZUeHNFU2tmUUo4dG95?=
 =?utf-8?B?b1JpdUlRUnBNQmVPa21BWW9STHU4WTMvR2hUcTlWZmpJOHVDK2x0c0VYUDhD?=
 =?utf-8?B?aEw5T2xUOE1GTUQ1a0dEeUFwdlFTOEtwa0Z4ZmNKT3h1dTFCcGhrdGVWeU1i?=
 =?utf-8?B?cmQ2U0doMW0wN1pUQlZ4R0lpcjJlc25QMkdKZDZLK0VjdUlGZUh2eVhDTG9w?=
 =?utf-8?B?c0Q4UFE0UlRaVGQ1Y0JXNHNWd0ZsdC81ZkxpT1RNS3AyQnpyZVl2RjVKRXB1?=
 =?utf-8?B?M1k3OUY4K21JZmw1ZzIvbWU2Wk56YjZ3TXlrd1ludkd5azZ1MUZBSGFXdDgv?=
 =?utf-8?B?dG8xNUovUG5WZDZTNzJnMWV1UlFhczg4cjZQVURnMmE1bkIwOEJudzFNNzBv?=
 =?utf-8?B?aEl5ZWlxV2FKVU9WaTVHbFdFdFVCdWJmdVhHMldqMERjVnVKRkVvSDNmQi9T?=
 =?utf-8?B?NVNRNXlvRElVdndnL3N3NGJiS0FiZnBjYzBxNWNUVUVUWVY5VXFxYlJKTE91?=
 =?utf-8?B?ZUhVdlVlYUtIeGNaODRjUGVpYld6cCtBSjRmZTRqS1ZIek1nYWxkSG1SNjRj?=
 =?utf-8?B?K0tMbFk3aTYrTXp3K0R6T1F3eU9hS2NERVNHdDdYZkxLZU9oenNRYm5za0hr?=
 =?utf-8?B?RjBOZkhUQ2c1NEFiTEFOblRFS1JFSFpZTFQ0bVkreThMREk5T0NJLzJmWEpw?=
 =?utf-8?B?aHJocE9GL014ck0vL2ZKRlJsVWpxcU5TM1NZWEMrMGpmUDkyVXJOelp0MzNR?=
 =?utf-8?B?QVBDSFZwL1Zqc1l0WGU4MGZnbVZ4WlQrUjZ2cEJGNDl0bDFKeGZ3WHVEZG4y?=
 =?utf-8?B?OW9qdzcrTGE4WmhrSUFQNWFKZG5qMlNIWVVvQldOWWtObEdOYWFhQVFCZVVF?=
 =?utf-8?Q?kdZyy0y1Tx2BUsu8cwaHcqpLT2Z9jZYK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGtOQmdKSlVSMW9qU3FKWHZmK0djNmgzSUpGcmwxYVkzWlc4OHFGRjBWcUtC?=
 =?utf-8?B?VkNIQ0MvQzIvTFp6V0dERmNVYlBORTI1b3NCYlFSbS9RN3NzTE84VUROY0FM?=
 =?utf-8?B?djZBZUV5aU9LRWtTdDhqNVVrZzR6UjN6dzFqS1RSOTZGdXNINS9yTVJKVmpD?=
 =?utf-8?B?NDlGZ2tVN1ZoQXJBWmJFR1JlVG5vc05BNHNqZW9BT01MZU5taG1Nc09kRG1i?=
 =?utf-8?B?cS9sRzZNcGZyR3lzU2o0ZmtMNHREVGN5am0zeTc3TjBDU3oyNXZLSGdvVDhU?=
 =?utf-8?B?V09qejd1RWVFRFZFdHd2dzVKczEzaE9ybkxuYlBSYWhBa05SSk5SS2pXT0NG?=
 =?utf-8?B?YytRVkdNQ1gzUS9weWdlanc3d2c2V3NZU3o2K21DdWxYUkt3YW5UMjVjQ0RJ?=
 =?utf-8?B?eU1lZERjQ2NNckdzTU9odENDNmNLUjNMUVFrcDdaYzVzZEUwaVVYb1JhOWxW?=
 =?utf-8?B?R1RJaWtDWFVULzRDK2thMzZnOUFvc1lPUTRvTVA5cTVodlF5bkUwbnlOTFFU?=
 =?utf-8?B?WmRMQzRYVlU2VjJ2Zk9FZDF3U1hoRHFzQ01tTS9SNEtXN0NkbVE2akVZdXU3?=
 =?utf-8?B?Y2NnVmFtTkdkUFRNTEtFdUxXaTFDQmRUdGhZTlhRbzRIcjM0RmlNbzI2QlBk?=
 =?utf-8?B?U3VPdjhVSkVZWU43RWkwZ2dHOEg5NG5iVGJMTDUvRkowQ1d2empRalI1WU9F?=
 =?utf-8?B?TXZOaHArSURNbDgvRUo5ckRJazh3M1lGQ2RiNDRjbDZPL3p5YXpXS0JVaExP?=
 =?utf-8?B?MXA2bkNCcTV4R1JYRitoSmJ0Y3NUQ0hNNDkveXM2VFpJb1hpb2hmWHVwR1Yx?=
 =?utf-8?B?Z3BkN29JSVZhb0FtTEhyaU1lY0FxeG1OcHZmMCtjSHIwTjV1S2dtU3dPVWRI?=
 =?utf-8?B?Q3FmTkJ5TEkvNVpvMm1mUkoxRnZzUE16dUNPdEFLRXpVR21MRUhWMzc1S0pD?=
 =?utf-8?B?ZzJ0dVBEQ1YwTDJMUURRRTl1bWwrR3lWZlM1bDF1MUI5T29oczB6bUpYNnMy?=
 =?utf-8?B?NlBRSEV4R01HN0FBS1RZdk9QbzRzYmlGc0dQNFNBdDRUWlN2WHpWSFFzd3FW?=
 =?utf-8?B?YmFuZ1o1TlZ4MS9LRDU3SHZQL2tlOVpwbVJuNkkyblp6b0swNzNRRFE4VmN1?=
 =?utf-8?B?U3l6MU4zL05wYktMMnM1RXJzSGIrRGlIeVp5bWxxSW5ETFArQkN2MVFsMXl3?=
 =?utf-8?B?bVB2K09uRjV5UkFzWGMvbEc5MDVqdkNuWUsvVnZzWE5qVEdYN2ZGaVpjbUFR?=
 =?utf-8?B?RXhsaitQSFRZb3FGcG93MVhpY0xaR0ppQ3JYVlNNbnVMMWxacldLZ3Zxdy9M?=
 =?utf-8?B?alRuOGdHVkRSS04ydy9qQXM4WWl2cjVMZ2JLeWVNSkM2aU42eUZyUERNTnhX?=
 =?utf-8?B?b1UzOWxRdmR4K3Btc0MvdVRxY2FBSmg1UXpqbGFDSlQ0Y081dWlnUzE2Qysv?=
 =?utf-8?B?cE5Jd25JSmVFekdiOXZQS1k0cldnalBrS0NGMHhQQ3FhRUNaMDFqWXhYNEE1?=
 =?utf-8?B?L1JKQ0pZU3p0TWxoak93UUp6SENaSWhSTGx0VytESkRpR1F3K0tSSS9CMm9T?=
 =?utf-8?B?M1JCQmwyU05KdTAza3JQL3IrSzZMVzkrdmNZWkJ1d1dPRWZsU3NkRGl0K2kz?=
 =?utf-8?B?ZDgzbG9DUWRKdnNBbzRoZENlcWRpSEc4ZmNoZ2tOalY0WEtmWDJOR3Bya3Vy?=
 =?utf-8?B?N0NjZis3TWxlNHdyY01BZEtIUDBKL1kwZmtVYXVBWG5DN2VzYWpZYldTV1V6?=
 =?utf-8?B?R0dSdkV4Si84ODl5QUdISW0xNGZ0aU1aUnlwQjdSWVM2TWNGYlpaNmJyWmJN?=
 =?utf-8?B?bndZcEVHRkJtN21hM1B6dWlraXdYSFNiVEtHOENUTzhTdlZxa1lBN3ozeXYy?=
 =?utf-8?B?cHR2ZWJNaWNZd0RZb0lNNUY3T0ZsVGJia20rRnpaOU11MVRzcTJodWgvQk56?=
 =?utf-8?B?Y0EveXRBdGd2L25NM1czVzA5NUtwUXdQT0R4NE9taFMyNG9WZFVodlBHM3RE?=
 =?utf-8?B?cU5EcVlra1pWVTQybG1LQUlPZjRYUmhjNGw4OWhoVXBPTGswSlRlbGluaVky?=
 =?utf-8?B?aW9iQzlCOGpBczN2Ky8wc3R4YXY2ZzZYZmFRLzBmMFFRNStKNnFjYXozYi9i?=
 =?utf-8?Q?EgbmI8ND8X8ptwj92sxXp6pDP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0aadff5e-7e00-4e3d-cae1-08de0a9df565
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:17:47.8221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dj/ElLBmbyFAepNV1YJRs428TVV/aDXYCYzj+i90RKIyDmJM7YrRUq3uLhBu5noh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9837
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

On 1 Oct 2025, at 2:57, Balbir Singh wrote:

> Implement migrate_vma_split_pages() to handle THP splitting during the
> migration process when destination cannot allocate compound pages.
>
> This addresses the common scenario where migrate_vma_setup() succeeds wit=
h
> MIGRATE_PFN_COMPOUND pages, but the destination device cannot allocate
> large pages during the migration phase.
>
> Key changes:
> - migrate_vma_split_pages(): Split already-isolated pages during migratio=
n
> - Enhanced folio_split() and __split_unmapped_folio() with isolated
>   parameter to avoid redundant unmap/remap operations
>
> This provides a fallback mechansim to ensure migration succeeds even when
> large page allocation fails at the destination.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/huge_mm.h | 11 +++++-
>  lib/test_hmm.c          |  9 +++++
>  mm/huge_memory.c        | 46 ++++++++++++----------
>  mm/migrate_device.c     | 85 +++++++++++++++++++++++++++++++++++------
>  4 files changed, 117 insertions(+), 34 deletions(-)
>
> diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
> index 2d669be7f1c8..a166be872628 100644
> --- a/include/linux/huge_mm.h
> +++ b/include/linux/huge_mm.h
> @@ -365,8 +365,8 @@ unsigned long thp_get_unmapped_area_vmflags(struct fi=
le *filp, unsigned long add
>  		vm_flags_t vm_flags);
>
>  bool can_split_folio(struct folio *folio, int caller_pins, int *pextra_p=
ins);
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head=
 *list,
> -		unsigned int new_order);
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
> +		unsigned int new_order, bool unmapped);
>  int min_order_for_split(struct folio *folio);
>  int split_folio_to_list(struct folio *folio, struct list_head *list);
>  bool uniform_split_supported(struct folio *folio, unsigned int new_order=
,
> @@ -375,6 +375,13 @@ bool non_uniform_split_supported(struct folio *folio=
, unsigned int new_order,
>  		bool warns);
>  int folio_split(struct folio *folio, unsigned int new_order, struct page=
 *page,
>  		struct list_head *list);
> +
> +static inline int split_huge_page_to_list_to_order(struct page *page, st=
ruct list_head *list,
> +		unsigned int new_order)
> +{
> +	return __split_huge_page_to_list_to_order(page, list, new_order, false)=
;
> +}
> +
>  /*
>   * try_folio_split - try to split a @folio at @page using non uniform sp=
lit.
>   * @folio: folio to be split
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 46fa9e200db8..df429670633e 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -1612,6 +1612,15 @@ static vm_fault_t dmirror_devmem_fault(struct vm_f=
ault *vmf)
>  	order =3D folio_order(page_folio(vmf->page));
>  	nr =3D 1 << order;
>
> +	/*
> +	 * When folios are partially mapped, we can't rely on the folio
> +	 * order of vmf->page as the folio might not be fully split yet
> +	 */
> +	if (vmf->pte) {
> +		order =3D 0;
> +		nr =3D 1;
> +	}
> +
>  	/*
>  	 * Consider a per-cpu cache of src and dst pfns, but with
>  	 * large number of cpus that might not scale well.
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8c95a658b3ec..022b0729f826 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -3463,15 +3463,6 @@ static void __split_folio_to_order(struct folio *f=
olio, int old_order,
>  		new_folio->mapping =3D folio->mapping;
>  		new_folio->index =3D folio->index + i;
>
> -		/*
> -		 * page->private should not be set in tail pages. Fix up and warn once
> -		 * if private is unexpectedly set.
> -		 */
> -		if (unlikely(new_folio->private)) {
> -			VM_WARN_ON_ONCE_PAGE(true, new_head);
> -			new_folio->private =3D NULL;
> -		}
> -
>  		if (folio_test_swapcache(folio))
>  			new_folio->swap.val =3D folio->swap.val + i;
>
> @@ -3700,6 +3691,7 @@ bool uniform_split_supported(struct folio *folio, u=
nsigned int new_order,
>   * @lock_at: a page within @folio to be left locked to caller
>   * @list: after-split folios will be put on it if non NULL
>   * @uniform_split: perform uniform split or not (non-uniform split)
> + * @unmapped: The pages are already unmapped, they are migration entries=
.
>   *
>   * It calls __split_unmapped_folio() to perform uniform and non-uniform =
split.
>   * It is in charge of checking whether the split is supported or not and
> @@ -3715,7 +3707,7 @@ bool uniform_split_supported(struct folio *folio, u=
nsigned int new_order,
>   */
>  static int __folio_split(struct folio *folio, unsigned int new_order,
>  		struct page *split_at, struct page *lock_at,
> -		struct list_head *list, bool uniform_split)
> +		struct list_head *list, bool uniform_split, bool unmapped)
>  {
>  	struct deferred_split *ds_queue =3D get_deferred_split_queue(folio);
>  	XA_STATE(xas, &folio->mapping->i_pages, folio->index);
> @@ -3765,13 +3757,15 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>  		 * is taken to serialise against parallel split or collapse
>  		 * operations.
>  		 */
> -		anon_vma =3D folio_get_anon_vma(folio);
> -		if (!anon_vma) {
> -			ret =3D -EBUSY;
> -			goto out;
> +		if (!unmapped) {
> +			anon_vma =3D folio_get_anon_vma(folio);
> +			if (!anon_vma) {
> +				ret =3D -EBUSY;
> +				goto out;
> +			}
> +			anon_vma_lock_write(anon_vma);
>  		}
>  		mapping =3D NULL;
> -		anon_vma_lock_write(anon_vma);
>  	} else {
>  		unsigned int min_order;
>  		gfp_t gfp;
> @@ -3838,7 +3832,8 @@ static int __folio_split(struct folio *folio, unsig=
ned int new_order,
>  		goto out_unlock;
>  	}
>
> -	unmap_folio(folio);
> +	if (!unmapped)
> +		unmap_folio(folio);
>
>  	/* block interrupt reentry in xa_lock and spinlock */
>  	local_irq_disable();
> @@ -3925,10 +3920,13 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>
>  			next =3D folio_next(new_folio);
>
> +			zone_device_private_split_cb(folio, new_folio);
> +
>  			expected_refs =3D folio_expected_ref_count(new_folio) + 1;
>  			folio_ref_unfreeze(new_folio, expected_refs);
>
> -			lru_add_split_folio(folio, new_folio, lruvec, list);
> +			if (!unmapped)
> +				lru_add_split_folio(folio, new_folio, lruvec, list);
>
>  			/*
>  			 * Anonymous folio with swap cache.
> @@ -3959,6 +3957,8 @@ static int __folio_split(struct folio *folio, unsig=
ned int new_order,
>  			__filemap_remove_folio(new_folio, NULL);
>  			folio_put_refs(new_folio, nr_pages);
>  		}
> +
> +		zone_device_private_split_cb(folio, NULL);
>  		/*
>  		 * Unfreeze @folio only after all page cache entries, which
>  		 * used to point to it, have been updated with new folios.
> @@ -3982,6 +3982,9 @@ static int __folio_split(struct folio *folio, unsig=
ned int new_order,
>
>  	local_irq_enable();
>
> +	if (unmapped)
> +		return ret;
> +
>  	if (nr_shmem_dropped)
>  		shmem_uncharge(mapping->host, nr_shmem_dropped);
>
> @@ -4072,12 +4075,13 @@ static int __folio_split(struct folio *folio, uns=
igned int new_order,
>   * Returns -EINVAL when trying to split to an order that is incompatible
>   * with the folio. Splitting to order 0 is compatible with all folios.
>   */
> -int split_huge_page_to_list_to_order(struct page *page, struct list_head=
 *list,
> -				     unsigned int new_order)
> +int __split_huge_page_to_list_to_order(struct page *page, struct list_he=
ad *list,
> +				     unsigned int new_order, bool unmapped)
>  {
>  	struct folio *folio =3D page_folio(page);
>
> -	return __folio_split(folio, new_order, &folio->page, page, list, true);
> +	return __folio_split(folio, new_order, &folio->page, page, list, true,
> +				unmapped);
>  }
>
>  /*
> @@ -4106,7 +4110,7 @@ int folio_split(struct folio *folio, unsigned int n=
ew_order,
>  		struct page *split_at, struct list_head *list)
>  {
>  	return __folio_split(folio, new_order, split_at, &folio->page, list,
> -			false);
> +			false, false);
>  }
>
>  int min_order_for_split(struct folio *folio)
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 4156fd6190d2..fa42d2ebd024 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -306,6 +306,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>  			    pgmap->owner !=3D migrate->pgmap_owner)
>  				goto next;
>
> +			folio =3D page_folio(page);
> +			if (folio_test_large(folio)) {
> +				int ret;
> +
> +				pte_unmap_unlock(ptep, ptl);
> +				ret =3D migrate_vma_split_folio(folio,
> +							  migrate->fault_page);
> +
> +				if (ret) {
> +					ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +					goto next;
> +				}
> +
> +				addr =3D start;
> +				goto again;
> +			}
> +
>  			mpfn =3D migrate_pfn(page_to_pfn(page)) |
>  					MIGRATE_PFN_MIGRATE;
>  			if (is_writable_device_private_entry(entry))
> @@ -880,6 +897,29 @@ static int migrate_vma_insert_huge_pmd_page(struct m=
igrate_vma *migrate,
>  		src[i] &=3D ~MIGRATE_PFN_MIGRATE;
>  	return 0;
>  }
> +
> +static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
> +					    unsigned long idx, unsigned long addr,
> +					    struct folio *folio)
> +{
> +	unsigned long i;
> +	unsigned long pfn;
> +	unsigned long flags;
> +	int ret =3D 0;
> +
> +	folio_get(folio);
> +	split_huge_pmd_address(migrate->vma, addr, true);
> +	ret =3D __split_huge_page_to_list_to_order(folio_page(folio, 0), NULL,
> +							0, true);

Why not just call __split_unmapped_folio() here? Then, you do not need to a=
dd
a new unmapped parameter in __folio_split().


> +	if (ret)
> +		return ret;
> +	migrate->src[idx] &=3D ~MIGRATE_PFN_COMPOUND;
> +	flags =3D migrate->src[idx] & ((1UL << MIGRATE_PFN_SHIFT) - 1);
> +	pfn =3D migrate->src[idx] >> MIGRATE_PFN_SHIFT;
> +	for (i =3D 1; i < HPAGE_PMD_NR; i++)
> +		migrate->src[i+idx] =3D migrate_pfn(pfn + i) | flags;
> +	return ret;
> +}
>  #else /* !CONFIG_ARCH_ENABLE_THP_MIGRATION */
>  static int migrate_vma_insert_huge_pmd_page(struct migrate_vma *migrate,
>  					 unsigned long addr,
> @@ -889,6 +929,13 @@ static int migrate_vma_insert_huge_pmd_page(struct m=
igrate_vma *migrate,
>  {
>  	return 0;
>  }
> +
> +static int migrate_vma_split_unmapped_folio(struct migrate_vma *migrate,
> +					    unsigned long idx, unsigned long addr,
> +					    struct folio *folio)
> +{
> +	return 0;
> +}
>  #endif
>
>  static unsigned long migrate_vma_nr_pages(unsigned long *src)
> @@ -1050,8 +1097,9 @@ static void __migrate_device_pages(unsigned long *s=
rc_pfns,
>  				struct migrate_vma *migrate)
>  {
>  	struct mmu_notifier_range range;
> -	unsigned long i;
> +	unsigned long i, j;
>  	bool notified =3D false;
> +	unsigned long addr;
>
>  	for (i =3D 0; i < npages; ) {
>  		struct page *newpage =3D migrate_pfn_to_page(dst_pfns[i]);
> @@ -1093,12 +1141,16 @@ static void __migrate_device_pages(unsigned long =
*src_pfns,
>  				(!(dst_pfns[i] & MIGRATE_PFN_COMPOUND))) {
>  				nr =3D migrate_vma_nr_pages(&src_pfns[i]);
>  				src_pfns[i] &=3D ~MIGRATE_PFN_COMPOUND;
> -				src_pfns[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -				goto next;
> +			} else {
> +				nr =3D 1;
>  			}
>
> -			migrate_vma_insert_page(migrate, addr, &dst_pfns[i],
> -						&src_pfns[i]);
> +			for (j =3D 0; j < nr && i + j < npages; j++) {
> +				src_pfns[i+j] |=3D MIGRATE_PFN_MIGRATE;
> +				migrate_vma_insert_page(migrate,
> +					addr + j * PAGE_SIZE,
> +					&dst_pfns[i+j], &src_pfns[i+j]);
> +			}
>  			goto next;
>  		}
>
> @@ -1120,7 +1172,13 @@ static void __migrate_device_pages(unsigned long *=
src_pfns,
>  							 MIGRATE_PFN_COMPOUND);
>  					goto next;
>  				}
> -				src_pfns[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +				nr =3D 1 << folio_order(folio);
> +				addr =3D migrate->start + i * PAGE_SIZE;
> +				if (migrate_vma_split_unmapped_folio(migrate, i, addr, folio)) {
> +					src_pfns[i] &=3D ~(MIGRATE_PFN_MIGRATE |
> +							 MIGRATE_PFN_COMPOUND);
> +					goto next;
> +				}
>  			} else if ((src_pfns[i] & MIGRATE_PFN_MIGRATE) &&
>  				(dst_pfns[i] & MIGRATE_PFN_COMPOUND) &&
>  				!(src_pfns[i] & MIGRATE_PFN_COMPOUND)) {
> @@ -1156,11 +1214,16 @@ static void __migrate_device_pages(unsigned long =
*src_pfns,
>
>  		if (migrate && migrate->fault_page =3D=3D page)
>  			extra_cnt =3D 1;
> -		r =3D folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
> -		if (r)
> -			src_pfns[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -		else
> -			folio_migrate_flags(newfolio, folio);
> +		for (j =3D 0; j < nr && i + j < npages; j++) {
> +			folio =3D page_folio(migrate_pfn_to_page(src_pfns[i+j]));
> +			newfolio =3D page_folio(migrate_pfn_to_page(dst_pfns[i+j]));
> +
> +			r =3D folio_migrate_mapping(mapping, newfolio, folio, extra_cnt);
> +			if (r)
> +				src_pfns[i+j] &=3D ~MIGRATE_PFN_MIGRATE;
> +			else
> +				folio_migrate_flags(newfolio, folio);
> +		}
>  next:
>  		i +=3D nr;
>  	}
> --=20
> 2.51.0


--
Best Regards,
Yan, Zi
