Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9BCB983C5
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 06:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA4810E699;
	Wed, 24 Sep 2025 04:47:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XlYn/6p1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010037.outbound.protection.outlook.com [52.101.61.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E2310E0DB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 04:47:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hXKe0wRtdSkzr+gslGZghpp6r7wbfk1jVhaiUukS0A+p8jTHZGMQiAGEIvJvLbrUcHxMYbY2/sAyrN4OlJNdjyyD7eqwDLuvHnKCS7MdiE/pVjk0qdGh437yW1iKZ+M/ZKWDYghOZuQrF42XVpO57YUhqTMNPr9M/kObDVrterBU+8NMqsv22/DnGrBXKlTybEAlmOWwtg185+z3TtBpSfDB0nH5l8SUr8FMgI25PqgiVdiXvZOsyAc1mbLRLWFabaNvOMs96WDmBttZLle7w7CR9ioq5N0KExMfYqNuaV8Yxf17JpUjI1QJd2Ihp8Dsl6Xh2iKQ93Zr4coOjpLGpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KtHeR46Nk3rLewehA/RV+8YXkP4kaM1mgLzKlIgekOE=;
 b=mcV0rnnyHfGIQxGxA9mCxf++B94ZUQ2GoereJCa8NPc342gNOD1szxf+vcN/ufJ3i3z5gkSFZc8XIYPrwFA1qtBDRjabrIFXQ2KGLyjY0U55BwVCQzqYgev9LOW904bUplOsGWQhwHhoFgRwnvExna6JUW3ogvJZML9rUHwUIMq3OP7L5Gj0YPsaeZ5dJAa29nwut4WHYhr5jN25No8hgWQZkVr8z/vuYomrvO2dKsiUUtIeXQ43bXK92LsHkmdhhTAODlg2yjqoPsh9LKTOAj5XOCUTugyK3IH1SiAX52uXixjBRd+2Pl2kDYVROETFhW3hLkNpWH1LwMoDjQFe2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KtHeR46Nk3rLewehA/RV+8YXkP4kaM1mgLzKlIgekOE=;
 b=XlYn/6p1OrAsnl/xD4wcYCRLo8JF8U3s2WYPuACPfrrBxnwDffHRrc1jog9R1HDM5rDHTfg9kZISwnpdd+skSR8BU0h/g09QcHbo9dT/93WiTxpZfQXfgo/2WtChyPpKIUXIaJqbXnYyN0Kdpg99i4OSUXpAmERf22macBuGmwFfW90qDEq41pzaq3gNM7BQogARceciuNBaOia5xeZYyYX9fYHE1jiyexWl0ez8e2ue04rst0pk2Col0+NCMRGCEPySN/1fekjSfee2rk0/Wj8QRcL4Ymr/pSTXB9ter+iJbwJeM3Kq57fb9oKx71n5Di2YSO/dq9efyhH8eOrQ1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MW4PR12MB7237.namprd12.prod.outlook.com (2603:10b6:303:22a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 04:47:13 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 04:47:13 +0000
Message-ID: <64d0b302-55c5-45bb-8aa5-d00d25d8d07e@nvidia.com>
Date: Wed, 24 Sep 2025 14:47:06 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Karim Manaouil <kmanaouil.dev@gmail.com>
Cc: Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 David Hildenbrand <david@redhat.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
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
References: <20250916122128.2098535-1-balbirs@nvidia.com>
 <20250916122128.2098535-6-balbirs@nvidia.com>
 <3FE3F2B9-86F9-4EED-863A-093FE3959B1A@nvidia.com>
 <62fb7aca-cd30-4058-bfd1-d08f78d5c38d@nvidia.com>
 <20250923155640.lbtvyi54ueyv2tjb@wrangler>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20250923155640.lbtvyi54ueyv2tjb@wrangler>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0035.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::48) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MW4PR12MB7237:EE_
X-MS-Office365-Filtering-Correlation-Id: bbbb9f92-a019-4aa4-a73d-08ddfb256e0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXR2WmRPNVY1OXFtZFlEdnlJQlZ2Uzlhc0oxODQvY25QQWs2ZnlzSmxkeEps?=
 =?utf-8?B?eERNNVVzVkV4bkxyNXAxMGFpNWJnR2RNdFZsZG5xTWFaREJMZFBtc01Rdms2?=
 =?utf-8?B?dFVFWGh3MzJvelp2eno2YmlXMWhXTnJ2Njd3NkZ6QkNxSDA3ZmpTblpjMEZ1?=
 =?utf-8?B?OWF6VEk1clh0dHkyZ2hCQlJHdHByRldGL2JZUmZzSTRlT3lLbEFYVGY2a1Iy?=
 =?utf-8?B?MlpxRUYzZ1VzVDBPTCtsL3cvdDVKcUVISUdSbXpBZkJWNFNUdnE2bHM1eGFK?=
 =?utf-8?B?dkkxNzd4OTNaYnlVWnRoWFZxVm9qcjZVWWFoMk1PMnlmQzRlU0VZeVRsN1Ni?=
 =?utf-8?B?R252c2RUS056SjMza0R3NERJRHZPOUV4MUViQUp0VTg5Z1BaKy9kelJwZmlK?=
 =?utf-8?B?SEVKOGJqeUxaeGlveGE4clMrK1poTGtwalNzYkQ1TjZPc2hRZzJ3QnVZUUV4?=
 =?utf-8?B?Zlh4Z1h1Y2lmN3NyZU9kelV4dC9RWkhlRWoxcTJpM2pJTCthWGNrdi9Pak9j?=
 =?utf-8?B?UUhYYVJtcStobWF1VVk2NzRzajdTMmhieEpjYk1wU3d4NWlzQlNsYWtiTktu?=
 =?utf-8?B?NXpYTGZwWXV3REVaMHNQWFZvZ1FnM3NxUkhITEpWRis0VnJheERZTTcwZnpu?=
 =?utf-8?B?NEdtM0k4Q1RsbmdkSjU3eGFXVmNKV3VFenhqUkVZYnF5OUQ1YjRTcUFic0I0?=
 =?utf-8?B?MGs5NlN3cFlpRnBpY20yZUVHSlV6N09INEs1cTVvMGhCWDI3RVp6WHdzcXpK?=
 =?utf-8?B?UjNOeHJ4TkJnaW1ENVRXNWNRbVBoZVJwTjFVdmU0Z2k0Q2NFalphM1M5K25y?=
 =?utf-8?B?V09ESG95d1NDOW53OHNMZmkzclY0WmFxQ3VPRi9KejBYbWZwbjFxcjZoMkNI?=
 =?utf-8?B?MVBXbFF5eGlZZGliNkd1a2t2aHI0bnNkUjV4N0Q3RVRnaER1Sk9JUkFTekVZ?=
 =?utf-8?B?T0NnanJlUWp5RmZyRkhOaVR4SlMrM3BEai9BeVZVS2VwZ2xZT3NoeU1vbWFs?=
 =?utf-8?B?QUI5d3RHV2V1UDVmcWdmR3hqSUQyWVp2YVJybHNJeThicCs2aVhlb1UveWt6?=
 =?utf-8?B?MnlMRjFSQytPRk1YRlhUdHRKaWMwa2UyUnp6OFlsc3ZMY3Z0RzZuWlV1Y2RL?=
 =?utf-8?B?WGZObVUybUliR0tRSzJNZDBkeXVYK054OGRSUHgvVXR5Y3cvUHh1WjhnUnVM?=
 =?utf-8?B?cCtETy9GcFpjOC9MUWFBVEVKS29HK0VMRXlRVkpPYm1GT2o3VUlHdSsySGNZ?=
 =?utf-8?B?SDdLdHJMRUhTZVJlL1hHRjNZT1IrNm5WTk1aQVZyYytoREZhdEZQOG5tWHBl?=
 =?utf-8?B?VTFHUkZwY1VTdmhoTXF2RjZoUVc5WUtZbFdPWE5ETktTc2YvZ2M3RkNUb2l0?=
 =?utf-8?B?WmxqL3k0SHBYdzQ3MFU2SVFJVkJlQ3BmUERvdUltV29lSmVZbVhNeFY5MytZ?=
 =?utf-8?B?RXh6L2phMG9waXkyZzlUeWdhdXZ5OVBMekRtM3NwRjUzOGlFR2ZrS01COW42?=
 =?utf-8?B?YXhnOGVDZnRtZnJsRi9vdlFiVGF5ekswR1lTOW1DRVJlRk05Y0d5RHZSUzJq?=
 =?utf-8?B?RnRZNHRqdWg4WHJQRTlCbmVoZzE1ODN6VzdrVjhqOVZZYW84Rno1U3pEcFlP?=
 =?utf-8?B?NmFYeENZYnQyT2ZsdDZGM3VGRWlRaGllODhMbU5ja2krM09BN2hydkVqcTNo?=
 =?utf-8?B?Z3F2ZmlaakhtVHZaUnhUanRkRjc5MTk4aGE0Z0RkTXh6cy9ZZnl4cEN2RTZs?=
 =?utf-8?B?dVI2dDFoOEJMRlEvNXhwWkF5OUJoMVhkK1BSR2UwVGxQdk9JR3RBRFFpd1p1?=
 =?utf-8?B?MnVFSExZUXFDbXUySGlUd2ZIM2J5b3dZMkdNR3dSNzhEUW5USWRrMGhBc3V1?=
 =?utf-8?B?Q1J2TDlFZU5UWjhrK2VaeGtIZG5Xa1JZM3lGRzNYdFZWNFZZODhuOExSaTYw?=
 =?utf-8?Q?cg5kKfzgg+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHRWbHhQVTNLQi8xeWlLTHkzRUYzTGk4MzdnMnRPZGlWdTRxaHVCQjFNRmsr?=
 =?utf-8?B?b1F1SVpzd283VTRBZFlyeC9ma01rWVVwNjNiVU1ERGV3WGM5cC9RanFiMjVv?=
 =?utf-8?B?ZFRHSytnaWFvY1hYMFFnbHFiclEvUFpzcEZPZzdiaThLdng5UU1sM3NScWxP?=
 =?utf-8?B?SkJjYTBrZ0hqZ1ZRd2NHNGpxbmdiVlY2Z05adllXN1lraTBqaFFiV0REY1Rj?=
 =?utf-8?B?UDdJVE9Yam4xNVNZaDY4bkE4NE5GcDU4eHJWakcwZHlUVnExSlF1TGphdzJy?=
 =?utf-8?B?RnlRbGdxcUlEZ3ZISHprNG5KUU91alBubjBqc1dWbmV6d1J4Y2NVT3duZzc2?=
 =?utf-8?B?ak41d0h1cm9MMGFTbVljeHRYb2ZRbXBNRFBrc3BteSt6YUdwYm0vbWdoVWlB?=
 =?utf-8?B?VkVDVFFuK3hFR3NEVENtUmNERzVTMklhQjdTakpZNDhadmVzeGpSbDlqb1hj?=
 =?utf-8?B?V21jMHFaaExURVMvSzJmbGZya1RBM0pEMldvQXpPaE1TTG9KR3B2dHdRd2VM?=
 =?utf-8?B?NVJnRjAra0E2VGlIWW16a0ZCQzI0b1lZOCtlMnA0SllSYU9Ba0hWOWNHKytt?=
 =?utf-8?B?eDh6MG1zbFUrczFGdGpsWnVKeEtQN3pvL3Z5em5INElHc1dYMWNTaDZIM0tB?=
 =?utf-8?B?c2lQai9uanNhYnN2NkRESnVya21CSVMvRmJoY0JJUGlHVmU3TXRQbnVWbnFw?=
 =?utf-8?B?aVVvL1cyNnNVc0ptSjA2ZEF4RU9UUHhiLzRBZTE0bFJvWm1SMDR2blUyS2Np?=
 =?utf-8?B?QU5SMVNuYktEN2JuVHR2WTBXSjJGbWFCUlR1NTd4TDU2QUgwTHhwL1IwZFFC?=
 =?utf-8?B?RTU2cWtWSUNpZldHZWthaW52bDVnNGR6L2ova21Jc1g2MGY4WWFUWFBRTlBa?=
 =?utf-8?B?ZDNWTDM3UExmUWkwQ0JuU2ZBcVhSZEY1Y0QvUUZjR0IrNGZhT0NKUk9rSDZO?=
 =?utf-8?B?Z1pxWldyUlZtT0tYeEIybVJUWWVONDFtbHlhKzh5bzFNZFVoQUVyN1lXTzBQ?=
 =?utf-8?B?SVU2bDhweXRnaENDalVDYVdkZm5xY2VQblBlWFZuaGpmZFhMYU9WVmNpaFVy?=
 =?utf-8?B?anFlQlhieHIxNzA0Y3RvTzFKY0VweWN5NUpJaU4wK0pRbXEvMDRBaksyV1hP?=
 =?utf-8?B?T0U3bEQ1dXNvS0hubEd1TEx1RDVKVkZueXJzcDVqWnNUZ3g4RytJN09WeWsw?=
 =?utf-8?B?ZUhML0h0WXdpbWJIay8wN0dON01ES3RvbUpTQWt3WUQ4bjJXaDVXRCtjNU1S?=
 =?utf-8?B?eGNYeFBzclJLSFkyNmlsL0hKdEVqQS9FN3B0L3ZYZS8wU3ZFeGoxS1hhUm5y?=
 =?utf-8?B?ZmRXRzg0bDhQcmZyRGFsbUNmc244TzJJbC84dWJYYTFMQUVlSG80UlRpOHVL?=
 =?utf-8?B?Z0hwQXhYdlcwYUt6SW1NUG1qMmhCSDdTWkR0MHQwWEpTS1h4d3k0eFhPV3hi?=
 =?utf-8?B?KzhRNzRwVnkrTU9QaUl2K0RBOXRZZ0s3OHY3K2M1ZDN3RkM4c2tVdFNUVldH?=
 =?utf-8?B?dnozalZXRTVkV0FteGdiNFN5SmxGQXBqR2d5d3p2bWZnLytjc0JhaW5oRElt?=
 =?utf-8?B?UHNSWHpROFZFRDVjWHpXZUJGNkh6TE8rTE9UYW5DbnVXNTN2a3F0QVFrNEdH?=
 =?utf-8?B?dnk4eGphYWdPQ0hIRjhDcXhCdStZWm1CT2JYd2pvdzVjS1lNVlU3TDc1YWNF?=
 =?utf-8?B?SllWSTRFdFZ0eTFtb1JURmhnd3M0d2lxamtaZk54YzNkTzZpem9UNjBxbHdt?=
 =?utf-8?B?YUNTc2I4T01KbzA4U3NyZXF2KzZPUXp1ZExyR3JQUVRxeFhUUjFCZGhMWlZh?=
 =?utf-8?B?T0hvZXhKR1Zqam9ZbnJuY041bnZQOEZqYUxzYTFuaVFUZkRIUWhYcHp5dEhm?=
 =?utf-8?B?WjQwWU5ERlpDVUFXamNqTlRuazFqWmcvdlFIVEpROStqUC83dVhkRE9ERGNS?=
 =?utf-8?B?YjBNUE1hT0hDZEhPdFA1QVR4YVRveWYwSFYvMFhINFZiU2FxeEx1VGdmNFhV?=
 =?utf-8?B?cmNkSXF4T3Z3M2lCZS9tdk1XblRnRnFSbHpFZkJCenFMSFdmZks2T0pkWWVW?=
 =?utf-8?B?RUhGdnVzejBvZk5ZaHFNVzBFelNnRkg1Tk1aTWNHa2F5SlhERzl5TTNKcG5Z?=
 =?utf-8?B?dVdWa0pOckcxdmFsbnFZZHlGalczWTVjVUlpQU1TNXo3WDZSVllMTTRLUjVG?=
 =?utf-8?Q?BzCwqulmLOAIWYqXiSNWixBxVZ1os1PSCz4vFn4vKnYR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbbb9f92-a019-4aa4-a73d-08ddfb256e0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 04:47:13.7712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r5SU7NQP0pfp75wvS44t6+mBJeLXMug7VIKZkFEbWir5rku6ClSUfRwL3iwiWkwOSF7OKp+wcJXcmXsNlH/q9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7237
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

On 9/24/25 01:56, Karim Manaouil wrote:
> On Tue, Sep 23, 2025 at 01:44:20PM +1000, Balbir Singh wrote:
>> On 9/23/25 12:23, Zi Yan wrote:
>>> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
>>>
>>>> Extend migrate_vma_collect_pmd() to handle partially mapped large folios
>>>> that require splitting before migration can proceed.
>>>>
>>>> During PTE walk in the collection phase, if a large folio is only
>>>> partially mapped in the migration range, it must be split to ensure the
>>>> folio is correctly migrated.
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
>>>>  mm/migrate_device.c | 82 +++++++++++++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 82 insertions(+)
>>>>
>>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>>> index abd9f6850db6..70c0601f70ea 100644
>>>> --- a/mm/migrate_device.c
>>>> +++ b/mm/migrate_device.c
>>>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>>  	return 0;
>>>>  }
>>>>
>>>> +/**
>>>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>>>> + * @folio: the folio to split
>>>> + * @fault_page: struct page associated with the fault if any
>>>> + *
>>>> + * Returns 0 on success
>>>> + */
>>>> +static int migrate_vma_split_folio(struct folio *folio,
>>>> +				   struct page *fault_page)
>>>> +{
>>>> +	int ret;
>>>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>>> +	struct folio *new_fault_folio = NULL;
>>>> +
>>>> +	if (folio != fault_folio) {
>>>> +		folio_get(folio);
>>>> +		folio_lock(folio);
>>>> +	}
>>>> +
>>>> +	ret = split_folio(folio);
>>>> +	if (ret) {
>>>> +		if (folio != fault_folio) {
>>>> +			folio_unlock(folio);
>>>> +			folio_put(folio);
>>>> +		}
>>>> +		return ret;
>>>> +	}
>>>> +
>>>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>>> +
>>>> +	/*
>>>> +	 * Ensure the lock is held on the correct
>>>> +	 * folio after the split
>>>> +	 */
>>>> +	if (!new_fault_folio) {
>>>> +		folio_unlock(folio);
>>>> +		folio_put(folio);
>>>> +	} else if (folio != new_fault_folio) {
>>>> +		folio_get(new_fault_folio);
>>>> +		folio_lock(new_fault_folio);
>>>> +		folio_unlock(folio);
>>>> +		folio_put(folio);
>>>> +	}
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>>  static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  				   unsigned long start,
>>>>  				   unsigned long end,
>>>> @@ -136,6 +183,8 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			 * page table entry. Other special swap entries are not
>>>>  			 * migratable, and we ignore regular swapped page.
>>>>  			 */
>>>> +			struct folio *folio;
>>>> +
>>>>  			entry = pte_to_swp_entry(pte);
>>>>  			if (!is_device_private_entry(entry))
>>>>  				goto next;
>>>> @@ -147,6 +196,23 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>>>>  			    pgmap->owner != migrate->pgmap_owner)
>>>>  				goto next;
>>>>
>>>> +			folio = page_folio(page);
>>>> +			if (folio_test_large(folio)) {
>>>> +				int ret;
>>>> +
>>>> +				pte_unmap_unlock(ptep, ptl);
>>>> +				ret = migrate_vma_split_folio(folio,
>>>> +							  migrate->fault_page);
>>>> +
>>>> +				if (ret) {
>>>> +					ptep = pte_offset_map_lock(mm, pmdp, addr, &ptl);
>>>> +					goto next;
>>>> +				}
>>>> +
>>>> +				addr = start;
>>>> +				goto again;
>>>> +			}
>>>
>>> This does not look right to me.
>>>
>>> The folio here is device private, but migrate_vma_split_folio()
>>> calls split_folio(), which cannot handle device private folios yet.
>>> Your change to split_folio() is in Patch 10 and should be moved
>>> before this patch.
>>>
>>
>> Patch 10 is to split the folio in the middle of migration (when we have
>> converted the entries to migration entries). This patch relies on the
>> changes in patch 4. I agree the names are confusing, I'll reword the
>> functions
> 
> Hi Balbir,
> 
> I am still reviewing the patches, but I think I agree with Zi here.
> 
> split_folio() will replace the PMD mappings of the huge folio with PTE
> mappings, but will also split the folio into smaller folios. The former
> is ok with this patch, but the latter is probably not correct if the folio
> is a zone device folio. The driver needs to know about the change, as
> usually the driver will have some sort of mapping between GPU physical
> memory chunks and their corresponding zone device pages.
> 

Yes, at this point there is no support for split folio callback. I can move this
bit to a later patch or move the entire patch to after patch 10. I suspect
this is a theoretical bisection concern for a future driver using large folios?

Thanks,
Balbir

