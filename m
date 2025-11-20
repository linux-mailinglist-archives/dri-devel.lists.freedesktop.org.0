Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6AF2C731D9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 10:26:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A2210E71C;
	Thu, 20 Nov 2025 09:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n5GCpz+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013071.outbound.protection.outlook.com
 [40.107.201.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A549110E71C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 09:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjoGJj2Gb7e7x6d0mQtosy3plJHLfACrv5g6fcpw+x7+APSnz3IPd8v/wES2sep9F1k5PAg6TPpYrduWGYlow2dLO1ONleegL+IHHGq7d5/qsSQVOKK7qOsQIESed4cgg38q9R4VunlgpTbE/aA/TcA0u4dn9gkT2Fr0kDt1KTulP6yDKFEwagG6jYcui2YuRhmuNNmf+Qbam0KSyv/d2dhoIPzX3kId3stnCDRR5ebczA4R1kBtH0pgJOrW9p+oDh0p3k1cVd7XxBZ+Y9GiuMt+BMo4loFHLAVupUkF61DHdq0OBShwTUEbJayBmJwwdQgYqR21ZaANnLNfbCvKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ISZiqQWYwb/lf3noREhYaApAp6G+kWaR/Bb7sOPLwc=;
 b=S8vRxp8nVFiXw7EffpbSe8o+C0N8n19lFncFtDvZcmpkn4WXqaLyiPvewMqu4D02aH8S0hSFA+ryYtr3grKIOviT4HV/xYD3dnqzWPdpmherGz/J0Y7V0z6Ty9u1x2+oZFTe91SdS11THW93fg9Q4GomNoynwhfNuM3j+aO8jZVZwN+clvTHZB7ZzIuhz05iNzfTdhxX3IyiP9VHP4ezFr6suKBRPzuAhKPZmj0ZT5vywrQvNqmipXN5fGQC3kGTGNFwJMyXdusPfVTdMjdoW84dIyXGVvPkHx36HWLxx44HDqw3lsHQc6cV3PGIeFqh2I5fVkoS+r2bJPZ0vIQ5jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2ISZiqQWYwb/lf3noREhYaApAp6G+kWaR/Bb7sOPLwc=;
 b=n5GCpz+s/6brimoTI4XOYKe7ofBYtQ3LrJ/f2kl9AhhCs1d/ZqLQURZoFIFbpg9TBSvW2y1Bn7Oa5M3TB8Tl4rctFT3aV4m1E3LuvtICFcySIAnwIM9JDYDpSAhnOIDzquedfhFVShGMkKyiYGGZBlRFY5g2xOpVNl3xXeaR3pvqRIe5Y3AUnWpyBcA5bIFouIlRYT20nj8NGYYALVs5GL/Dx0oUeCIohHD0KINeqxXFCSseiDlRrFYn6esOfjQQgr7Ul1t/9hxsh0nknb0lHuaWk8ltFVhgTwpSTyVfYhTdb4hxJPdOxKTw/XoPbALG/yDPqENO33lBvoXTl0FmAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 20 Nov
 2025 09:25:55 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 09:25:55 +0000
Message-ID: <875a9449-fcdd-4aef-9d77-1703dd02edf0@nvidia.com>
Date: Thu, 20 Nov 2025 20:25:48 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup: mm/huge_memory.c: introduce folio_split_unmapped
To: "David Hildenbrand (Red Hat)" <david@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org
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
References: <20251120030709.2933665-1-balbirs@nvidia.com>
 <4b87bd52-5582-4599-8a97-38843e27d0a7@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <4b87bd52-5582-4599-8a97-38843e27d0a7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:40::36) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d09dfe2-8367-41f4-3fa7-08de2816ce81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlI1Z055a2hqekxCVU1EQ09MY01mbmRMSW5BZklWTjl2MStPQnpVU2gwSUhT?=
 =?utf-8?B?V1pjSmxkSjIrQklDZ0RsNms0cFN0QVZpTHV6dTVrQjR5QVBBcEhTTk93QUJ0?=
 =?utf-8?B?OGVtM0poR3kycE0yTUwyM0FwSWJ1Z2l4dm1JdVpmMkVtRUUxcTErVHZoc2d1?=
 =?utf-8?B?NTBIZ0ZkLytGUDFhWXFFTWdEbzBJTXRJL0hsbkVVVUVFblR5b3doaENrQnNJ?=
 =?utf-8?B?emxMYk1yWTZxQ0RCVk9JKzU4MzJJV2t4a1NxOXpvS2VxV3RjVFRRMjdVbnRx?=
 =?utf-8?B?ZHFPaEFQcTl4eFZpLzVzQjlVcS95OHdCSDhGRnBpek96dkpzcjU0RWlIcXJ5?=
 =?utf-8?B?SkIxWlR4WElhbFphQzZpekZGcStCVmFBZXJwd0pFT1hXRjFRVGlqZ3RCOUlP?=
 =?utf-8?B?WmJNTW96MnF3dnp5NXhDajNDc2t4SGFYc1NleUc3UDNlK012R1owb3BUaWxo?=
 =?utf-8?B?ZDBqQWgremp0NklVZE1ZdmFDakJLanJzemR0aWZWUmhyTStoTDNWWVJKbUhy?=
 =?utf-8?B?UWIwUnVuaThQb20wODg1NnBGVG5rWXlMUVluaFBGcGlBTm1WcWgwbE11OUVY?=
 =?utf-8?B?SGNMZ2IyZTFYU3hRUzF0MnloSW1lQzd0YWVTRm03MUh4aE52eVZxK0FCd1Bm?=
 =?utf-8?B?eWNWcS9PaHFHNC9rODJJaklwUTIwSjgvU3lKL2g4Z3REalVCMm9HWFpZS2tw?=
 =?utf-8?B?cFFaeGx5aXZKUWJNaW0xa2c4M0k2ck1oSGlpaVlBWXNzK3N3azRtbXYvMEJI?=
 =?utf-8?B?NXo4a2Z4SVJ1WnQ2TEs1UzN6ak1LcDgxL2JhaFBGQWNNNHRlNXNLdHVGd1lY?=
 =?utf-8?B?OU5QTGNVZDdYeVVnTlFZN0ZtWi8ySkJ4TVJLLzVjTFByZEpWemJqRWxXNUJr?=
 =?utf-8?B?YmEvVGJ3enN4MTJQcnoyWjl4M3B3YnlIdk5pYjc0QzVKNGQ5SFZFVHRMMUFD?=
 =?utf-8?B?MG8zNEJ6ZUdwUVZSRzV0azdmYTUreStjU2VjYzRqSVZkbFUvQ3N4d01KMjE2?=
 =?utf-8?B?VjZJNGtnTzYveHRVQS9lbW90a0RjMkxVbm1ISHJKeFRMd1BURjJUVXVFN2FQ?=
 =?utf-8?B?WkN4MmovOG1WaHJKelJuTUtRbW5JamZ5aldJV3FVaktHSkdua3kxa2xuamFi?=
 =?utf-8?B?U1RGazNUTTc0NWtuLys2REtKUnVDZGlMaXRiU3d0Nnl5Und1L2t5Y3RPUWtj?=
 =?utf-8?B?ZUZRdWV3am05bUZCa2F4cDUzdkZIcmRFQ01rTHhLRmh3aHovMmZMMklQYnh6?=
 =?utf-8?B?YVR5YUs5RE5BaFd3T2VlQVFVa0Z2NnZuVlJiR0VLeUF0MnlxTnNKaDNrRG8y?=
 =?utf-8?B?amwvR1NoRmt4VE44dGtxcHRPSXNONk1UbzhnWnlJaGJQTEJwMzFWM216ZElU?=
 =?utf-8?B?cmN2OGpMSVVkbHVqYWpnWGVzOUo2ZmptdW9JSm4xMmNmSEVwSk1EM0FKVXVX?=
 =?utf-8?B?MERGTmZRdGFnUjN5cW11TWNqRU1NM3VWTkNJYzFUSE9WSTZnOFBCaStLZ2Ew?=
 =?utf-8?B?ZGVMWWhxTUZLZndWaDRIcVhGQklvekIwT1puY2dnK1RtaHdvdk0vb3ZML1lD?=
 =?utf-8?B?YnlvNDhlaElPVjVaRjRISVFsZldzUVAvWTYyNUxYbjNvelFLbi8vZ2VneDRx?=
 =?utf-8?B?UXgwUTc0OGd6NUM4S2puRzVGT3NEL3ljald6ajZpY2I4eTU5UWlDQlByaFRK?=
 =?utf-8?B?UTBxenVwbGt4SlluYk5aRitRd3EyZ2M3QXVkTzhMaVVHYVdoZ3I4bWNwemJF?=
 =?utf-8?B?ck5FRWFrTkhvNFRwS04wRjVZMWdGVFRERm1WSjF0K1YxOXlQMnErN1o5Rms1?=
 =?utf-8?B?TnlLUDYwM0tjUmZ4dERCcnk4Qm9ReWJDcVltVGc2UVFjR2JSV29NWDRMNGFS?=
 =?utf-8?B?RlFUTHgzRFBwcFBwbUh6UUlFMXJjNHNBYndrd3ZTMndZVzhYMi9yVlFJajR1?=
 =?utf-8?Q?e9NKaR8C5vW6wJ+arljIEFbHSifWxBp8?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkMwUnhFMEJCTnZTUTVudmNXQ0VWTC9vSzExOTRYUkFOUi9uWnRoeXJsSkFn?=
 =?utf-8?B?TUJUN2tyNllsZzR6R2x2dWpRUjNpRVkybDluK0RMbjlINi9PMlcrTUJUbEN3?=
 =?utf-8?B?RlNGUXFhaTlodFZZUkQ4Yzd2bWpzQjM0QVlGRHBYVldPRVRJRVM4Yk5SZEZz?=
 =?utf-8?B?dDU4TFJXL0lYYW5rZDEwOWlhenl1c2Noa2pNd2NmZE1maWx0M3RtZG16KzZj?=
 =?utf-8?B?ZEFJMVVyOVZWajVLVmtDelV2SmZXdVZVNXJYR1A4VXJvSVRzL2lmWThFaVVy?=
 =?utf-8?B?dXl1dUloWTFIYzNzckNVVS9DSXRDY0lBK2dQRnI5NWx1cktCNUxFQmtEeGxM?=
 =?utf-8?B?RHVMSmFzMkhPVlBUMk0va0hnQnhiOUJ2Qis0NDY2aEZ0cTBIQ2JMbGpWbnRj?=
 =?utf-8?B?SWlaSEZ2ODBsUTZjVWY1Rk9vRHNIdGEwWk9uTlFmNXNEa0RGc3RjV0dRVlRj?=
 =?utf-8?B?eGhMTkJDRkZPNjdiU3VsVGRjNVBvMmowMFRsb2tpd1RTMEVBS0Z0TUg2YVhp?=
 =?utf-8?B?OU5UVlpnNmd4dWVDc2Y1bFdsVEFXVW5YUGh4RENkelFVOFloS3AzMityQVVs?=
 =?utf-8?B?SHozdWJVMHkrK203OG01cnhTVHBYelJ5cmZ6S1BLWnU2T0FrNXZNQkZtODd1?=
 =?utf-8?B?UW9VYkgrUHZQd09kSzdNcmp1R3cvTUlXVnVJRXdJaG01Vlk1b0M1eko3ZVJQ?=
 =?utf-8?B?OU5GY3lkM3Y4OVF3bCsrOTlUQ2RPVm1FNVFjb2RvdGVOU3BrdjlYZnVLbjJi?=
 =?utf-8?B?VWZXTm03ZjQ5VUZ5RjR2OEFSNjU4NVRxSEtndnV6Y0hkNzRUbDFoOUlRU241?=
 =?utf-8?B?cVdNSkpvYjdiRlV1T3BwRzRha25jYkFMZThJTTZ3RUNTT1pmUDBwOE5CMyts?=
 =?utf-8?B?MHpyNnVzSHhXZUVUTVBtYVFFalBRNksxcG92RldTZS9NN05najA1aytvMFlr?=
 =?utf-8?B?YkczWWJ5ZWg2RG1UMzhIczl4UlY5RE82K2U0UzA3SHlnUjlEWUJrNVJBNCs2?=
 =?utf-8?B?STlxSmUramc2SXRGYnd6M1dKbDBQcHZoL2xmdUFJSjVuQVJkWFVmellPSnVi?=
 =?utf-8?B?c3c5TTg0aUtqSkl4REVrMUY4bG5qVVZBZUFaTmhQaGlaMkpQT1V2MUROdW5U?=
 =?utf-8?B?UGkwckQ1WlMrRTg2YmRhL3dkeW1xYWpyeCs0WlZvdG8vRXM5OVBkeFNmRVNj?=
 =?utf-8?B?RjNpVE9pbENMbEZmYkdxMUZRd0RMeUxTb3RKWkx5K0kzWGlCdkdIYisrenIx?=
 =?utf-8?B?dlVFYitFcUVMb29xMDdmNDFYeWVwazJPaHpLRnhRZms0K3cvcTNlbHNYM3RY?=
 =?utf-8?B?ZUhOd1hUUGprbW91UWxieVpHcnFtODZDOGlmdUMrQnNHenQzVDd4NC9TTGZF?=
 =?utf-8?B?ejN3ZzFLVnJkUURER2lMZGNNMG95UUlrZ1E4aWN4ZW1uSHVtT0RLeGdyOTdl?=
 =?utf-8?B?RW5aMHZBdzIzOFYySitVNGhFU2o5QjJoaDJ3UkFjTnp5bUhIWHlUMnh3cytq?=
 =?utf-8?B?MEdUaC9peGhsT0hEdTJ4V2RtOEVLRkREdGFMSGRybC9xRTVWSXQrbkFYdjZ2?=
 =?utf-8?B?MGZvenYxTU9GRnlPcjN3WTd6R3ZmbzBuTUswRkNaZE8yR3NWY3JCOGRXSjJO?=
 =?utf-8?B?S0FpRmlVZW5OdHF2R2REVUdGS1J4YWEyeWhpMm9PQS9SOW9XcEo1Q25CaWpo?=
 =?utf-8?B?b1RsdlJKTG1QbzJMRlhWSHRHRnJZYiswclRldEhidVpWdVdqWE9jT0hqSWJO?=
 =?utf-8?B?ZXN5Zk5oQUkwYkxHV3kwamVDa3RWRHVacmo4L2I2MDVSSlRieThkVS8xS0Rh?=
 =?utf-8?B?SjZlSkFPZlZXdjZsQWROOXhubVk2dFZqQjdHMWJuSXAxTmpDZ0RKakZhenlL?=
 =?utf-8?B?a2tMclRyWUtGZFpqRVFTeE9IUmxhbFBYSXBaZHRQZS9SSytkY2x5ZE9YT0xT?=
 =?utf-8?B?RXU0a2xWeWRPbTRBNWh2c2lqeHd1aU5ad3cyQmtwd0VoeGxMZkU0eW1aMjJp?=
 =?utf-8?B?U2JRSzVUMk5ucUQzRmVtWkJoMnl0NkRtdXJyRHZwYXlsc3pvUjlTRjR6NlFF?=
 =?utf-8?B?YkszbUZPR09hR0hLSEE1NVdvM1FTMzEzd0lhU0dJTFV4WEFFL1AvTjRUaENq?=
 =?utf-8?B?T2J4SlFxaTZ0bk51OExkdyttSmFYWWFESFNZQk5aZVNIb203dUx5bHJxWnp1?=
 =?utf-8?Q?N6Uwb7/czlB/RDDJQpnKX6q6Tfbm4eT9Xd+J9DsBlPol?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d09dfe2-8367-41f4-3fa7-08de2816ce81
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 09:25:55.3407 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8gbFSDK5k7Q5+lXXkt0Uckxk4uhYTY7yWPJn2aVfR6XXOuWV7sB3bIa5H5TucXkpESKr3q4eGYv9+2usWuJfFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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

On 11/20/25 20:09, David Hildenbrand (Red Hat) wrote:
> On 11/20/25 04:07, Balbir Singh wrote:
>> Code refactoring of __folio_split() via helper
>> __folio_freeze_and_split_unmapped() caused a regression with clang-20
>> with CONFIG_SHMEM=n, the compiler was not able to optimize away the
>> call to shmem_uncharge() due to changes in nr_shmem_dropped.
>> Fix this by checking for shmem_mapping() prior to calling
>> shmem_uncharge(), shmem_mapping() returns false when CONFIG_SHMEM=n.
>>
>> smatch also complained about parameter end being used without
>> initialization, which is a false positive, but keep the tool happy
>> by sending in initialized parameters. end is initialized to 0.
>>
>> Add detailed documentation comments for folio_split_unmapped()
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: Zi Yan <ziy@nvidia.com>
>> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Cc: Rakie Kim <rakie.kim@sk.com>
>> Cc: Byungchul Park <byungchul@sk.com>
>> Cc: Gregory Price <gourry@gourry.net>
>> Cc: Ying Huang <ying.huang@linux.alibaba.com>
>> Cc: Alistair Popple <apopple@nvidia.com>
>> Cc: Oscar Salvador <osalvador@suse.de>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
>> Cc: Nico Pache <npache@redhat.com>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Dev Jain <dev.jain@arm.com>
>> Cc: Barry Song <baohua@kernel.org>
>> Cc: Lyude Paul <lyude@redhat.com>
>> Cc: Danilo Krummrich <dakr@kernel.org>
>> Cc: David Airlie <airlied@gmail.com>
>> Cc: Simona Vetter <simona@ffwll.ch>
>> Cc: Ralph Campbell <rcampbell@nvidia.com>
>> Cc: Mika Penttilä <mpenttil@redhat.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Francois Dugast <francois.dugast@intel.com>
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>   mm/huge_memory.c | 32 ++++++++++++++++++++++----------
>>   1 file changed, 22 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 78a31a476ad3..c4267a0f74df 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -3751,6 +3751,7 @@ static int __folio_freeze_and_split_unmapped(struct folio *folio, unsigned int n
>>       int ret = 0;
>>       struct deferred_split *ds_queue;
>>   +    VM_WARN_ON_ONCE(!mapping && end != 0);
> 
> You could drop the "!= 0"

Ack

VM_WARN_ONE(!mapping && end);

> 
>>       /* Prevent deferred_split_scan() touching ->_refcount */
>>       ds_queue = folio_split_queue_lock(folio);
>>       if (folio_ref_freeze(folio, 1 + extra_pins)) {
>> @@ -3919,7 +3920,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>       int nr_shmem_dropped = 0;
>>       int remap_flags = 0;
>>       int extra_pins, ret;
>> -    pgoff_t end;
>> +    pgoff_t end = 0;
>>       bool is_hzp;
>>         VM_WARN_ON_ONCE_FOLIO(!folio_test_locked(folio), folio);
>> @@ -4049,7 +4050,7 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>         local_irq_enable();
>>   -    if (nr_shmem_dropped)
>> +    if (mapping && shmem_mapping(mapping) && nr_shmem_dropped)
>>           shmem_uncharge(mapping->host, nr_shmem_dropped);
> 
> That looks questionable. We shouldn't add runtime check to handle buildtime things.
> 
> Likely what you want is instead
> 
> if (IS_ENABLED(CONFIG_SHMEM) && nr_shmem_dropped)
>     shmem_uncharge()
> 

shmem_mapping() returns false for CONFIG_SHMEM=n and shmem_mapping() checks that the mapping
is indeed for shmem ops before uncharging. Happy to change it if you like,
your version is more readable

>>         if (!ret && is_anon && !folio_is_device_private(folio))
>> @@ -4092,16 +4093,27 @@ static int __folio_split(struct folio *folio, unsigned int new_order,
>>       return ret;
>>   }
>>   -/*
>> - * This function is a helper for splitting folios that have already been unmapped.
>> - * The use case is that the device or the CPU can refuse to migrate THP pages in
>> - * the middle of migration, due to allocation issues on either side
>> +/**
>> + * folio_split_unmapped() - split a large anon folio that is already unmapped
>> + * @folio: folio to split
>> + * @new_order: the order of folios after split
>> + *
>> + * This function is a helper for splitting folios that have already been
>> + * unmapped. The use case is that the device or the CPU can refuse to migrate
>> + * THP pages in the middle of migration, due to allocation issues on either
>> + * side.
>> + *
>> + * anon_vma_lock is not required to be held, mmap_read_lock() or
>> + * mmap_write_lock() should be held. @folio is expected to be locked by the
>> + * caller. device-private and non device-private folios are supported along
>> + * with folios that are in the swapcache. @folio should also be unmapped and
>> + * isolated from LRU (if applicable)
>>    *
>> - * The high level code is copied from __folio_split, since the pages are anonymous
>> - * and are already isolated from the LRU, the code has been simplified to not
>> - * burden __folio_split with unmapped sprinkled into the code.
>> + * Upon return, the folio is not remapped, split folios are not added to LRU,
>> + * free_folio_and_swap_cache() is not called, and new folios remain locked.
>>    *
>> - * None of the split folios are unlocked
>> + * Return: 0 on success, -EAGAIN if the folio cannot be split (e.g., due to
>> + *         insufficient reference count or extra pins).
> 
> Sounds much better to me, thanks.
> 

Thanks
Balbir
