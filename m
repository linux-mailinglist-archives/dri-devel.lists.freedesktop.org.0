Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFC55B37F98
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 12:15:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3EA310E00C;
	Wed, 27 Aug 2025 10:15:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4qz9bLB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD32910E00C
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 10:14:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRRcSSLXhO7mP9I07w+aqCibT1rdNxN1WCHPJNJmK77g1gWBTjTGb08g0soqa88FAobRbhjOMbaULl/2MJwMsspVqLPdJpjqqa7O3MROtqS/g2aDrCijiw9OPkCUTILcAiYOwANt/i3TzUgFldNSnlIoJwxZTKyPfgKwf9AgG0LnqXDF7mriz4S0A37nPt0GMPFdijq8voBJfK/D2CR6uLHhI2hvxC8oVNUGjyCeQMXVbPSuejuX0A8XErLn7OcDCnAE8uESIVdez5pM9MOhsxQ6HN2+yBiSZE3g9F8Au6R6QEmKeAT9ueCjHYkiOe0LktsRRhrU+zrBul7WR+ucDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhiUDQPjLOrexnXX/WSYKwJmjO9kHu3jwCG67zwfvyI=;
 b=ul7kH4lfU8I2Qf/Gh7yxqbOU5Kts7USxBMxLWThBDLPHs+gDzGVsdc6QihFZ9Qz2KfNvjk5P6sjR0PshfsCORhkgPA4MMboN6wIk6Z3sktjPidmYkw95DDenCyFoqUL4Jy0QhH+MqFisJV8ZBocucewGQY7oLqjQEhB5NKsKmPRB4boeRNH++KgmYqNP2PBpNO0EUD33gM/3nCJYecYsHzHOJbmZsBXIs3taXQwv5d93KeAQjiPp428Eb8GXZkUVbF+MU591lgCl/0l4RU0UZYkGnA7A8sVb2Sw6uvy5qoHXUQ+081m6diw1WYmGZYtMCPvNqJkKlS5EEIbpxARdng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhiUDQPjLOrexnXX/WSYKwJmjO9kHu3jwCG67zwfvyI=;
 b=j4qz9bLB65ezu0IPE5mVsDscEmXNWbfAL6LPojPvTaV3SBWUbSJtWF4ewPcZ16F7yqd85K9sEDufJ7jc9exTJt9M3PCJQJcviTXP7zIORq5jmEdc0eHG9FmeoL5DhXgC61PtbpX06kStKQsS2sNgtK9vzOIl3QchXXPu5VT2x/PiepFGEmPT6cSj9/NPraFSB1eBTs/v5BiO7+AdystSCgPkPKTFZX63Pi7ec9Uk3Awf6d9LsOfDniZyrquycUsChj3gA0jkj7AJgnnNqG9keb1FUYWUe21ScxgRtXXcibQkimvQN0PKpFZ4AUK0Bi3fL66FWBS/SgTxm+G8kZkhmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CH0PR12MB8552.namprd12.prod.outlook.com (2603:10b6:610:18e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Wed, 27 Aug
 2025 10:14:52 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 10:14:52 +0000
Message-ID: <85ef9a34-f511-4306-ac28-bf90f614709a@nvidia.com>
Date: Wed, 27 Aug 2025 20:14:44 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 02/11] mm/thp: zone_device awareness in THP handling code
To: David Hildenbrand <david@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250812024036.690064-1-balbirs@nvidia.com>
 <20250812024036.690064-3-balbirs@nvidia.com>
 <763e1fca-e4c4-467e-a1d0-ea911cad4714@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <763e1fca-e4c4-467e-a1d0-ea911cad4714@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0033.prod.exchangelabs.com (2603:10b6:a02:80::46)
 To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CH0PR12MB8552:EE_
X-MS-Office365-Filtering-Correlation-Id: fd4630ba-1bff-4e54-4e62-08dde5528fc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHc0UXFEWE9YeTJVUStFNHE0YjFnczhDNlpPTklzcnJJUk5kQ3dYSjg4bW9k?=
 =?utf-8?B?d2tUYXF4UnBDSTBtTGlCTlhHVDg2NWlzQUJ0K252OFFWNnhzTVE2U01SOWYr?=
 =?utf-8?B?eE5KU3ZtcDU0dHJ0NmErNEErVWlrUHd3c3RCejQ4ck1acjE1NzdsRVhEcmtO?=
 =?utf-8?B?eWdibWJJRXFDYXhaU044d3V5RXMwQUtqVXBFQ09SMjc2Y1NCMnBzMEJOQWRD?=
 =?utf-8?B?SERUY1M0T1J1ckZXSi9MNmpqd1JXOG9xd29tKzBxdExLU3dkbU90Z04rOGJT?=
 =?utf-8?B?R285UFhtM1NMYndJSGFBUjYwdlpNTW1NOEs4MnFlQ3dmVEFuTms5WlpheUVM?=
 =?utf-8?B?U2dCYXNCNHo2aDlkMm9EMXhoNWlySysvMFd0Z21GQVhMcGNObzVUOEJwMW1E?=
 =?utf-8?B?a3hnRmRSdTVZQXR6cEIwTjBnT2t2cGlGdFl3alFJbDRHM05OdEFOYVJ3c0V2?=
 =?utf-8?B?Wmt0NlpDcWNrUUVZV0hkTEYxQXNGcXVHQXZiUWlWdDVzWkhWSUtpYnA3dHR4?=
 =?utf-8?B?dnkyblFtbDRhc2VlSFFybUJUZVhoeSs0WXJ4d2ZibVhTRE1vVisrRDZLWi9z?=
 =?utf-8?B?U3BEdGNNMU40a3VxSVpEZk5id1pUdkNZbkhYMmtmbXNFT3R3N0Y0ZzJTNXBt?=
 =?utf-8?B?ZGtBNit4azRPanRQTjNvbXp4YVpvMkVJRThXVWVzekxlTlZkMTVjY3IzVEd6?=
 =?utf-8?B?aWxOSkxDVE5OMTV6SXk3b3RTbEY4UGpjcURlSWg2RnZGM2U4VHkzeG51dS8v?=
 =?utf-8?B?RmsrRy90ZlphaTNVTDBCcDcybW5xMWI5YzBHR0x6Mmh4NEYwclorTHBZWTlx?=
 =?utf-8?B?dmFyWjc5dnpYckswbUFaUndNK0xIMkcwTVJMOHNtVVk5MEcrclVpU0QzckV2?=
 =?utf-8?B?V1BsOHgyYUFhTUY2TUVYbm1nZVQ1WTd2LzFBM3BEU29tMlMyWXp1R2pINTc0?=
 =?utf-8?B?UDBzanY3WWxwMENTeXJhc3FIajhxOVBmcE9OcWpERHAwc29HQ2xBRlhCM0hP?=
 =?utf-8?B?ZzlsWmVldzNzNTVIUDV2UExXTmdETzE2MGtmQ3RVOEVId0J0UmJFRmZNbHh5?=
 =?utf-8?B?NDAzdWVzZG5vd1BwdVUrNVJ0Wm13cGtDODE2eUZnajMrMHVSbXJEclRqZU53?=
 =?utf-8?B?R0IzUVZ0Uko1Q1FZVVZOM0czTjU4UFFGRlVoUjQzS2NWc01rMkh3S1Y3N3Q3?=
 =?utf-8?B?ajBYb2xzVUluQkVYVEJKQ2RTLzMzL3poS0tVOHNlSG1nV04wWTlVMjFHT1Nt?=
 =?utf-8?B?Nm9PNlFSQWVEZis5NEYxbGJlQ1V6R1lmKzV0cVVmWWNmYXRHQ0xsQXdHQ2Qy?=
 =?utf-8?B?bGd0TFlJUmg3Qmx4T0RrZk1aRG0rbTBLMXBETUJ1bklGaFNXNlVHNFFzTSt5?=
 =?utf-8?B?WE9naG5zRHRpQUdBVGdleERnSmxaekIzbzBEbEx4b2lyZ29CSk9yODAwaUZM?=
 =?utf-8?B?NHBJQ00vaEdYRE1Lb3hreitLOUhoYXpNbjVMaDFTTzRYdVVjdHdZMjBZaVUz?=
 =?utf-8?B?YllRZzRLak5ESzBDS2ppOTBKTGl0OEJNdWo4SENCWVNmVWhQRVo1MmVnckcy?=
 =?utf-8?B?R0Q2OEJ4cjRSb1NubHQxY21vMHBjSGVwS1Z5YXp1RmZxNjBwZHFKYklDV2h3?=
 =?utf-8?B?WTJZOGdzT1dXejVxdkdrZGNNeExhRERyQ3V6TTRQdC8vOVc3T2poZ0xHNlRp?=
 =?utf-8?B?cTMzNGhKd2QvWUhrS3B2ZnVEdjZIUDdob2RuVzR4QkhUdkJSd2MyN1BZWDls?=
 =?utf-8?B?cVMzYy9YN0QweDJXcEtNaDhWMFhBaDk5cnB3dVpFV2JkV1lseXdJZzExbjVB?=
 =?utf-8?B?aEJJYnlBanEwMUZUeFdpVDBRRDkwYnoxc3M4ZGVVM0Y1OFAxdzRiYVM5ckdL?=
 =?utf-8?B?Mkt5N2NZUk8yamp4dFlYeE14Z0xLVDRwWnROdTNza2Q3TkVvZll2a1NnZUFB?=
 =?utf-8?Q?bXbMAdSTpqA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zm9IbnU2bUZSVlpnU3d3MjBPM2hPVU1YSUtrV2F1Q0M4Q2k0czVOUjRNVDVF?=
 =?utf-8?B?RDNyUk80dUxuNWlrMGlUenNrcnBBNzFrVFFXL2NvaHJFckR3Mm9ncFZHL05z?=
 =?utf-8?B?UXg0amcwMWN6UmNtYUVrQ1lMUVZJMmFUM2wyZnJGRlVZd3U3VjZ3dzY3MVVP?=
 =?utf-8?B?MDBUY3BFU2UxT3JwNnVpdEZVdEQ4eHQzSDU0TEtEK3hFOXZGZ2xVZW9ZajBw?=
 =?utf-8?B?VmxpeitVS1lVbzlMQTBadlRyOFBnTE5IQ0VpYzR4WkNzcHlQUFZZMTRwMWI1?=
 =?utf-8?B?d2VacDVGUXN4OEJKNUZpcXV4eUM0d0g5Uk1TYkJQWVVYRnJyUDBseElWdEdN?=
 =?utf-8?B?RkNLVzR2UFl0TmE3NXZrTDdqbkNMUGk1N3BwSm0xTzBaWlNHOGk3b1N3TXJP?=
 =?utf-8?B?RSs0MzdQc0dTVGFJR0NSdnp0WFk1djRuQW5kejgzd1V0OUtRRnVuSjRoT2Zz?=
 =?utf-8?B?cUJScno1cGZhRGkza05wVXl1MkdmRU5RRmFVYW1nQ3M3S1RJMElZKzhxbjNo?=
 =?utf-8?B?eitTVmpIMld2YXNqT0hweUhOZmVhVFlTYjh0S1IvZTFXTzlOKzFsNmVvVDNq?=
 =?utf-8?B?K0tFd2VrcVJ5TnVnOEREZE1yNk93NnRacDNmQ1lkYjdWY3JZU2pGZmlrc3h4?=
 =?utf-8?B?dTdTNjQxSUhhQ2IxZVliVXFabFIwV01CNmxNOXlORmJ1RVRvMmo3WjRVVzR3?=
 =?utf-8?B?cCtwbk85bjIvVzM4UmV6Q3hHZyt0bFphbTdpWkVHQW5GQXZ3NmpqNkVVYWVr?=
 =?utf-8?B?a3dQa0VsRmltRzlVWHBOMDdIM3M0Rlc2b1o1TnByUDZpREJnS0xPQmlMRzVq?=
 =?utf-8?B?UkZ4dHI4WW1vbVpRd2pBQnFJSzNuWDVQK1pJd1ZuYU5QV3Z5c21qelM5MDFr?=
 =?utf-8?B?TlVWdlJoYk5SeEpyTGFYL3ppUDBFYlhrdmpMRHlJbkdlQktRWEdCekc5WmJM?=
 =?utf-8?B?MDR6WnFpcTJ4Umt5bThNOElFVTVGeGJ0a000dUFrY1h1RzJoS2RuTE03M0dZ?=
 =?utf-8?B?RVg5d0NqME1TZlZxUTF4dlF2bkZvMDVSV3JpZTdBcnpXMzdhZzdpTzFEbnpy?=
 =?utf-8?B?VEZrUWtBWEpTaWtRdjJ0ZTVER21CWUxnNkVFeTFFNDVZb3I4SkZhTGJEdWRi?=
 =?utf-8?B?RmJpdTVPZ3ovMXVodzNIL2VSaUEvdzMvVDhlK3VQSmFzN3RFMDRIMG5PQmVo?=
 =?utf-8?B?TGx4TysraXIyUmE5TkFKYnROb1Q4dE1qdWhNa1orSnhnYlVrVFN1dWpxLy9E?=
 =?utf-8?B?Y3FCNlA3UDl1Uk8wTTFsRXFlUC9MN1Bpb1hwL0xUeUNWT0ZXcXNxaS9SbmVP?=
 =?utf-8?B?MnhhZW5oQVRKL0dZVnpQbG52WVpCV3RDRk1qTGJJU1dpc0tGbi9neU0rOUFh?=
 =?utf-8?B?SkFDY1pxcU9pbjdOdUYzUkd3UCt4RTB4M2xRdC9mcmFlSzlzd3JMRWZCUE1p?=
 =?utf-8?B?dmRQdnIxYnhDM3dtNlRCZDZCWnFsU3MybHA5MmRRdnF3cWFPbXhEMUxNcXd4?=
 =?utf-8?B?QnV0blpYZjRDeXRDVm43UnJlQVlJc2NDMG1wNDhmeHBXZWJjaUM1YXZpN1pV?=
 =?utf-8?B?QlBhY253blNUUUpNWVRMMGVOOFFuTEVKNTNpN3Y1UmhVMDk1NlJrcDNwVUZt?=
 =?utf-8?B?emc2eDc0ZzB0T0xycTVFZDUxUUgzNjRCdU1lVjRTTXcweWRUUDhHQllocGw3?=
 =?utf-8?B?K2FVa0F2NCtaNkNWY3Q4d0F2SXpnK0RpZkFYdW51VFlnMHhzc25BWHpmNnEz?=
 =?utf-8?B?TGpjSnpZZ1Z0OTM5Y3Rpc252NjFhd0VGR1VKNkRJUEZKTlVMRjh5TjYzYS9h?=
 =?utf-8?B?TUp6U21aaHBkdjY2aVBNdVpneXUyaDdrTzNFbGEyNFZOM2hwQ1ZYYWxjUGI3?=
 =?utf-8?B?YjAvWVhlRWxrMG85eDRaS08veElkd0QvTVpubHNiaTMvZ2NVL2F5NG1HZmov?=
 =?utf-8?B?L3JLdHhJRElsald4WUc4Q0s3blJyUDB4bkhBSGZCVnRvc0p2YVBzNTJ5Z0Fm?=
 =?utf-8?B?MjVQZWRUZ25iTlZscGhhZHNGTWI1RmdnclVReHZxanJRV1lwRFdCdFZKNUZs?=
 =?utf-8?B?WkZEcUNFSmh6WDFWMWdSbCtXb3cxMzBVZlVla0h4ZzFVSThFdGxYOTV4b2c0?=
 =?utf-8?Q?M/18L+JmXO9dAYgH7r6pDZNVG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd4630ba-1bff-4e54-4e62-08dde5528fc4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 10:14:52.0872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuN8v4zGfCIkL8entinJbv07jcX2nyebpDBxGelclN5egwn55uds8efv9Cpj3OGbtOdqRcd+vda1fgfI+vEq1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8552
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

On 8/27/25 01:19, David Hildenbrand wrote:
> On 12.08.25 04:40, Balbir Singh wrote:
>> Make THP handling code in the mm subsystem for THP pages aware of zone
>> device pages. Although the code is designed to be generic when it comes
>> to handling splitting of pages, the code is designed to work for THP
>> page sizes corresponding to HPAGE_PMD_NR.
>>
>> Modify page_vma_mapped_walk() to return true when a zone device huge
>> entry is present, enabling try_to_migrate() and other code migration
>> paths to appropriately process the entry. page_vma_mapped_walk() will
>> return true for zone device private large folios only when
>> PVMW_THP_DEVICE_PRIVATE is passed. This is to prevent locations that are
>> not zone device private pages from having to add awareness.
> 
> Please don't if avoidable.
> 
> We should already have the same problem with small zone-device private
> pages, and should have proper folio checks in place, no?
> 
> 
> [...]
> 
> This thing is huge and hard to review. Given there are subtle changes in here that
> are likely problematic, this is a problem. Is there any way to split this
> into logical chunks?
> 
> Like teaching zap, mprotect, rmap walks .... code separately.
> 
> I'm, sure you'll find a way to break this down so I don't walk out of a
> review with an headake ;)
> 

:) I had smaller chunks earlier, but then ran into don't add the change unless you
use the change problem

>>     struct page_vma_mapped_walk {
>>       unsigned long pfn;
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 64ea151a7ae3..2641c01bd5d2 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -563,6 +563,7 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>   {
>>       return is_swap_pmd(pmd) && is_migration_entry(pmd_to_swp_entry(pmd));
>>   }
>> +
> 
> ^ unrelated change

Ack

> 
>>   #else  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>   static inline int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>>           struct page *page)
>> @@ -594,6 +595,22 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>   }
>>   #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>   +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
>> +
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +    return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
>> +}
>> +
>> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +    return 0;
>> +}
>> +
>> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>>   static inline int non_swap_entry(swp_entry_t entry)
>>   {
>>       return swp_type(entry) >= MAX_SWAPFILES;
>> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
>> index 761725bc713c..297f1e034045 100644
>> --- a/lib/test_hmm.c
>> +++ b/lib/test_hmm.c
>> @@ -1408,7 +1408,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>>        * the mirror but here we use it to hold the page for the simulated
>>        * device memory and that page holds the pointer to the mirror.
>>        */
>> -    rpage = vmf->page->zone_device_data;
>> +    rpage = folio_page(page_folio(vmf->page), 0)->zone_device_data;
> 
> Can we have a wrapper please to give us the zone_device_data for a folio, so
> we have something like
> 
> rpage = folio_zone_device_data(page_folio(vmf->page));
> 

Yep, will change

>>       dmirror = rpage->zone_device_data;
>>         /* FIXME demonstrate how we can adjust migrate range */
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 9c38a95e9f09..2495e3fdbfae 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1711,8 +1711,11 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>       if (unlikely(is_swap_pmd(pmd))) {
>>           swp_entry_t entry = pmd_to_swp_entry(pmd);
>>   -        VM_BUG_ON(!is_pmd_migration_entry(pmd));
>> -        if (!is_readable_migration_entry(entry)) {
>> +        VM_WARN_ON(!is_pmd_migration_entry(pmd) &&
>> +                !is_pmd_device_private_entry(pmd));
>> +
>> +        if (is_migration_entry(entry) &&
>> +            is_writable_migration_entry(entry)) {
>>               entry = make_readable_migration_entry(
>>                               swp_offset(entry));
> 
> Careful: There is is_readable_exclusive_migration_entry(). So don't
> change the !is_readable_migration_entry(entry) to is_writable_migration_entry(entry)(),
> because it's wrong.
> 

Ack, I assume you are referring to potential prot_none entries?

>>               pmd = swp_entry_to_pmd(entry);
>> @@ -1722,6 +1725,32 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>                   pmd = pmd_swp_mkuffd_wp(pmd);
>>               set_pmd_at(src_mm, addr, src_pmd, pmd);
>>           }
>> +
>> +        if (is_device_private_entry(entry)) {
> 
> likely you want "else if" here.
> 

Ack

>> +            if (is_writable_device_private_entry(entry)) {
>> +                entry = make_readable_device_private_entry(
>> +                    swp_offset(entry));
>> +                pmd = swp_entry_to_pmd(entry);
>> +
>> +                if (pmd_swp_soft_dirty(*src_pmd))
>> +                    pmd = pmd_swp_mksoft_dirty(pmd);
>> +                if (pmd_swp_uffd_wp(*src_pmd))
>> +                    pmd = pmd_swp_mkuffd_wp(pmd);
>> +                set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +            }
>> +
>> +            src_folio = pfn_swap_entry_folio(entry);
>> +            VM_WARN_ON(!folio_test_large(src_folio));
>> +
>> +            folio_get(src_folio);
>> +            /*
>> +             * folio_try_dup_anon_rmap_pmd does not fail for
>> +             * device private entries.
>> +             */
>> +            VM_WARN_ON(folio_try_dup_anon_rmap_pmd(src_folio,
>> +                      &src_folio->page, dst_vma, src_vma));
>> +        }
> 
> I would appreciate if this code flow here would resemble more what we have in
> copy_nonpresent_pte(), at least regarding handling of these two cases.
> 
> (e.g., dropping the VM_WARN_ON)

Ack

> 
>> +
>>           add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>>           mm_inc_nr_ptes(dst_mm);
>>           pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
>> @@ -2219,15 +2248,22 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>               folio_remove_rmap_pmd(folio, page, vma);
>>               WARN_ON_ONCE(folio_mapcount(folio) < 0);
>>               VM_BUG_ON_PAGE(!PageHead(page), page);
>> -        } else if (thp_migration_supported()) {
>> +        } else if (is_pmd_migration_entry(orig_pmd) ||
>> +                is_pmd_device_private_entry(orig_pmd)) {
>>               swp_entry_t entry;
>>   -            VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>>               entry = pmd_to_swp_entry(orig_pmd);
>>               folio = pfn_swap_entry_folio(entry);
>>               flush_needed = 0;
>> -        } else
>> -            WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +
>> +            if (!thp_migration_supported())
>> +                WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +
>> +            if (is_pmd_device_private_entry(orig_pmd)) {
>> +                folio_remove_rmap_pmd(folio, &folio->page, vma);
>> +                WARN_ON_ONCE(folio_mapcount(folio) < 0);
> 
> Can we jsut move that into the folio_is_device_private() check below.

The check you mean?

> 
>> +            }
>> +        }
>>             if (folio_test_anon(folio)) {
>>               zap_deposited_table(tlb->mm, pmd);
>> @@ -2247,6 +2283,15 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>                   folio_mark_accessed(folio);
>>           }
>>   +        /*
>> +         * Do a folio put on zone device private pages after
>> +         * changes to mm_counter, because the folio_put() will
>> +         * clean folio->mapping and the folio_test_anon() check
>> +         * will not be usable.
>> +         */
> 
> The comment can be dropped: it's simple, don't use "folio" after
> dropping the reference when zapping.
> 

Ack

>> +        if (folio_is_device_private(folio))
>> +            folio_put(folio);
> 
>> +
>>           spin_unlock(ptl);
>>           if (flush_needed)
>>               tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
>> @@ -2375,7 +2420,8 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>           struct folio *folio = pfn_swap_entry_folio(entry);
>>           pmd_t newpmd;
>>   -        VM_BUG_ON(!is_pmd_migration_entry(*pmd));
>> +        VM_WARN_ON(!is_pmd_migration_entry(*pmd) &&
>> +               !folio_is_device_private(folio));
>>           if (is_writable_migration_entry(entry)) {
>>               /*
>>                * A protection check is difficult so
>> @@ -2388,6 +2434,10 @@ int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>               newpmd = swp_entry_to_pmd(entry);
>>               if (pmd_swp_soft_dirty(*pmd))
>>                   newpmd = pmd_swp_mksoft_dirty(newpmd);
>> +        } else if (is_writable_device_private_entry(entry)) {
>> +            entry = make_readable_device_private_entry(
>> +                            swp_offset(entry));
>> +            newpmd = swp_entry_to_pmd(entry);
>>           } else {
>>               newpmd = *pmd;
>>           }
>> @@ -2842,16 +2892,19 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>       struct page *page;
>>       pgtable_t pgtable;
>>       pmd_t old_pmd, _pmd;
>> -    bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
>> -    bool anon_exclusive = false, dirty = false;
>> +    bool young, write, soft_dirty, uffd_wp = false;
>> +    bool anon_exclusive = false, dirty = false, present = false;
>>       unsigned long addr;
>>       pte_t *pte;
>>       int i;
>> +    swp_entry_t swp_entry;
>>         VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
>>       VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
>>       VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
>> -    VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd));
>> +
>> +    VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
>> +            && !(is_pmd_device_private_entry(*pmd)));
> 
> VM_WARN_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
>        !(is_pmd_device_private_entry(*pmd)));
> 
>

Ack
 

>>         count_vm_event(THP_SPLIT_PMD);
>>   @@ -2899,18 +2952,45 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>           return __split_huge_zero_page_pmd(vma, haddr, pmd);
>>       }
>>   -    pmd_migration = is_pmd_migration_entry(*pmd);
>> -    if (unlikely(pmd_migration)) {
>> -        swp_entry_t entry;
>>   +    present = pmd_present(*pmd);
>> +    if (unlikely(!present)) {
>> +        swp_entry = pmd_to_swp_entry(*pmd);
>>           old_pmd = *pmd;
>> -        entry = pmd_to_swp_entry(old_pmd);
>> -        page = pfn_swap_entry_to_page(entry);
>> -        write = is_writable_migration_entry(entry);
>> -        if (PageAnon(page))
>> -            anon_exclusive = is_readable_exclusive_migration_entry(entry);
>> -        young = is_migration_entry_young(entry);
>> -        dirty = is_migration_entry_dirty(entry);
>> +
>> +        folio = pfn_swap_entry_folio(swp_entry);
>> +        VM_WARN_ON(!is_migration_entry(swp_entry) &&
>> +                !is_device_private_entry(swp_entry));
>> +        page = pfn_swap_entry_to_page(swp_entry);
>> +
>> +        if (is_pmd_migration_entry(old_pmd)) {
>> +            write = is_writable_migration_entry(swp_entry);
>> +            if (PageAnon(page))
>> +                anon_exclusive =
>> +                    is_readable_exclusive_migration_entry(
>> +                                swp_entry);
>> +            young = is_migration_entry_young(swp_entry);
>> +            dirty = is_migration_entry_dirty(swp_entry);
>> +        } else if (is_pmd_device_private_entry(old_pmd)) {
>> +            write = is_writable_device_private_entry(swp_entry);
>> +            anon_exclusive = PageAnonExclusive(page);
>> +            if (freeze && anon_exclusive &&
>> +                folio_try_share_anon_rmap_pmd(folio, page))
>> +                freeze = false;
>> +            if (!freeze) {
>> +                rmap_t rmap_flags = RMAP_NONE;
>> +
>> +                if (anon_exclusive)
>> +                    rmap_flags |= RMAP_EXCLUSIVE;
>> +
>> +                folio_ref_add(folio, HPAGE_PMD_NR - 1);
>> +                if (anon_exclusive)
>> +                    rmap_flags |= RMAP_EXCLUSIVE;
>> +                folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
>> +                         vma, haddr, rmap_flags);
>> +            }
>> +        }
> 
> This is massive and I'll have to review it with a fresh mind later.

It is similar to what we do for non device private folios, when we map/unmap the entire
folio during migration, the new fresh folios/pages should be marked as anon exclusive.
But please do check

> 
> [...]
>     put_page(page);
>> @@ -3058,8 +3157,10 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>>   void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
>>                  pmd_t *pmd, bool freeze)
>>   {
>> +
> 
> ^ unrelated
> 

Ack

>>       VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
>> -    if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd))
>> +    if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
>> +            (is_pmd_device_private_entry(*pmd)))
> 
> if (pmd_trans_huge(*pmd) || is_pmd_migration_entry(*pmd) ||
>     is_pmd_device_private_entry(*pmd))
> 
>>           __split_huge_pmd_locked(vma, pmd, address, freeze);
>>   }
>>   @@ -3238,6 +3339,9 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>>       VM_BUG_ON_FOLIO(folio_test_lru(new_folio), folio);
>>       lockdep_assert_held(&lruvec->lru_lock);
>>   +    if (folio_is_device_private(folio))
>> +        return;
>> +
>>       if (list) {
>>           /* page reclaim is reclaiming a huge page */
>>           VM_WARN_ON(folio_test_lru(folio));
>> @@ -3252,6 +3356,7 @@ static void lru_add_split_folio(struct folio *folio, struct folio *new_folio,
>>               list_add_tail(&new_folio->lru, &folio->lru);
>>           folio_set_lru(new_folio);
>>       }
>> +
> 
> ^ unrelated
> 

Ack

>>   }
>>     /* Racy check whether the huge page can be split */
>> @@ -3727,7 +3832,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>         /* Prevent deferred_split_scan() touching ->_refcount */
>>       spin_lock(&ds_queue->split_queue_lock);
>> -    if (folio_ref_freeze(folio, 1 + extra_pins)) {
>> +    if (folio_ref_freeze(folio, 1 + folio_expected_ref_count(folio))) {
> 
> I think I discussed that with Zi Yan and it's tricky. Such a change should go
> into a separate cleanup patch.
> 

Ack, I'll split it up as needed. The reason why this is here is because large folios that
have been partially split (pmd split) have a count of nr_pages + 1 on pmd_split and after
the split the map count falls, but never goes to 0 as the ref_freeze code expects.

> 
>>           struct address_space *swap_cache = NULL;
>>           struct lruvec *lruvec;
>>           int expected_refs;
>> @@ -3858,8 +3963,9 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>       if (nr_shmem_dropped)
>>           shmem_uncharge(mapping->host, nr_shmem_dropped);
>>   -    if (!ret && is_anon)
>> +    if (!ret && is_anon && !folio_is_device_private(folio))
>>           remap_flags = RMP_USE_SHARED_ZEROPAGE;
>> +
> 
> ^ unrelated

Ack

> 
>>       remap_page(folio, 1 << order, remap_flags);
>>         /*
>> @@ -4603,7 +4709,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>>           return 0;
>>         flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
>> -    pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>> +    if (unlikely(is_pmd_device_private_entry(*pvmw->pmd)))
> 
> Use pmd_present() instead, please. (just like in the pte code that handles this).
> 

Ack

> Why do we have to flush? pmd_clear() might be sufficient? In the PTE case we use pte_clear().

Without the flush, other entities will not see the cleared pmd and isn't the pte_clear() only
when should_defer_flush() is true?

> 
> [...]
> 
>>           pmde = pmd_mksoft_dirty(pmde);
>>       if (is_writable_migration_entry(entry))
>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>> index e05e14d6eacd..0ed337f94fcd 100644
>> --- a/mm/migrate_device.c
>> +++ b/mm/migrate_device.c
>> @@ -136,6 +136,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>                * page table entry. Other special swap entries are not
>>                * migratable, and we ignore regular swapped page.
>>                */
>> +            struct folio *folio;
>> +
>>               entry = pte_to_swp_entry(pte);
>>               if (!is_device_private_entry(entry))
>>                   goto next;
>> @@ -147,6 +149,51 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>                   pgmap->owner != migrate->pgmap_owner)
>>                   goto next;
>>   +            folio = page_folio(page);
>> +            if (folio_test_large(folio)) {
>> +                struct folio *new_folio;
>> +                struct folio *new_fault_folio = NULL;
>> +
>> +                /*
>> +                 * The reason for finding pmd present with a
>> +                 * device private pte and a large folio for the
>> +                 * pte is partial unmaps. Split the folio now
>> +                 * for the migration to be handled correctly
>> +                 */
> 
> There are also other cases, like any VMA splits. Not sure if that makes a difference,
> the folio is PTE mapped.
> 

Ack, I can clarify that the folio is just pte mapped or remove the comment

>> +                pte_unmap_unlock(ptep, ptl);
>> +
>> +                folio_get(folio);
>> +                if (folio != fault_folio)
>> +                    folio_lock(folio);
>> +                if (split_folio(folio)) {
>> +                    if (folio != fault_folio)
>> +                        folio_unlock(folio);
>> +                    ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>> +                    goto next;
>> +                }
>> +
>> +                new_folio = page_folio(page);
>> +                if (fault_folio)
>> +                    new_fault_folio = page_folio(migrate->fault_page);
>> +
>> +                /*
>> +                 * Ensure the lock is held on the correct
>> +                 * folio after the split
>> +                 */
>> +                if (!new_fault_folio) {
>> +                    folio_unlock(folio);
>> +                    folio_put(folio);
>> +                } else if (folio != new_fault_folio) {
>> +                    folio_get(new_fault_folio);
>> +                    folio_lock(new_fault_folio);
>> +                    folio_unlock(folio);
>> +                    folio_put(folio);
>> +                }
>> +
>> +                addr = start;
>> +                goto again;
> 
> Another thing to revisit with clean mind.
> 

Sure

>> +            }
>> +
>>               mpfn = migrate_pfn(page_to_pfn(page)) |
>>                       MIGRATE_PFN_MIGRATE;
>>               if (is_writable_device_private_entry(entry))
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index e981a1a292d2..246e6c211f34 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -250,12 +250,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>               pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>>               pmde = *pvmw->pmd;
>>               if (!pmd_present(pmde)) {
>> -                swp_entry_t entry;
>> +                swp_entry_t entry = pmd_to_swp_entry(pmde);
>>                     if (!thp_migration_supported() ||
>>                       !(pvmw->flags & PVMW_MIGRATION))
>>                       return not_found(pvmw);
>> -                entry = pmd_to_swp_entry(pmde);
>>                   if (!is_migration_entry(entry) ||
>>                       !check_pmd(swp_offset_pfn(entry), pvmw))
>>                       return not_found(pvmw);
>> @@ -277,6 +276,16 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>                * cannot return prematurely, while zap_huge_pmd() has
>>                * cleared *pmd but not decremented compound_mapcount().
>>                */
>> +            swp_entry_t entry;
>> +
>> +            entry = pmd_to_swp_entry(pmde);
>> +
>> +            if (is_device_private_entry(entry) &&
>> +                (pvmw->flags & PVMW_THP_DEVICE_PRIVATE)) {
>> +                pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>> +                return true;
>> +            }
>> +
>>               if ((pvmw->flags & PVMW_SYNC) &&
>>                   thp_vma_suitable_order(vma, pvmw->address,
>>                              PMD_ORDER) &&
>> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
>> index 567e2d084071..604e8206a2ec 100644
>> --- a/mm/pgtable-generic.c
>> +++ b/mm/pgtable-generic.c
>> @@ -292,6 +292,12 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp)
>>           *pmdvalp = pmdval;
>>       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
>>           goto nomap;
>> +    if (is_swap_pmd(pmdval)) {
>> +        swp_entry_t entry = pmd_to_swp_entry(pmdval);
>> +
>> +        if (is_device_private_entry(entry))
>> +            goto nomap;
>> +    }
>>       if (unlikely(pmd_trans_huge(pmdval)))
>>           goto nomap;
>>       if (unlikely(pmd_bad(pmdval))) {
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index b5837075b6e0..f40e45564295 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -2285,7 +2285,8 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>                unsigned long address, void *arg)
>>   {
>>       struct mm_struct *mm = vma->vm_mm;
>> -    DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
>> +    DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address,
>> +                PVMW_THP_DEVICE_PRIVATE);
>>       bool anon_exclusive, writable, ret = true;
>>       pte_t pteval;
>>       struct page *subpage;
>> @@ -2330,6 +2331,10 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>       while (page_vma_mapped_walk(&pvmw)) {
>>           /* PMD-mapped THP migration entry */
>>           if (!pvmw.pte) {
>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> +            unsigned long pfn;
>> +#endif
>> +
>>               if (flags & TTU_SPLIT_HUGE_PMD) {
>>                   split_huge_pmd_locked(vma, pvmw.address,
>>                                 pvmw.pmd, true);
>> @@ -2338,8 +2343,21 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>                   break;
>>               }
>>   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> -            subpage = folio_page(folio,
>> -                pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
>> +            /*
>> +             * Zone device private folios do not work well with
>> +             * pmd_pfn() on some architectures due to pte
>> +             * inversion.
>> +             */
> 
> Please use the handling for the PTE case as inspiration.
> 
>         /*
>          * Handle PFN swap PTEs, such as device-exclusive ones, that
>          * actually map pages.
>          */
>         pteval = ptep_get(pvmw.pte);
>         if (likely(pte_present(pteval))) {
>             pfn = pte_pfn(pteval);
>         } else {
>             pfn = swp_offset_pfn(pte_to_swp_entry(pteval));
>             VM_WARN_ON_FOLIO(folio_test_hugetlb(folio), folio);
>         }
> 
> 
> So I would expect here something like
> 
>         /*
>          * Handle PFN swap PTEs, such as device-exclusive ones, that
>          * actually map pages.
>          */
>         pmdval = pmdp_get(pvmw.pmd);
>         if (likely(pmd_present(pmdval)))
>             pfn = pmd_pfn(pmdval);
>         else
>             pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
> 
> 

I can switch over to pmd_present for the checks

>> +            if (is_pmd_device_private_entry(*pvmw.pmd)) {
>> +                swp_entry_t entry = pmd_to_swp_entry(*pvmw.pmd);
>> +
>> +                pfn = swp_offset_pfn(entry);
>> +            } else {
>> +                pfn = pmd_pfn(*pvmw.pmd);
>> +            }
>> +
>> +            subpage = folio_page(folio, pfn - folio_pfn(folio));
>> +
>>               VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>>                       !folio_test_pmd_mappable(folio), folio);
>>   
> 
> 


Thanks for the review
Balbir
