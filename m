Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDABB21ADF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 04:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208B810E57C;
	Tue, 12 Aug 2025 02:41:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WHrq9H5V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2043.outbound.protection.outlook.com [40.107.95.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE2A910E578
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 02:41:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gK2UsZCcBaif6ODZNgMID4AqwXvHT1izjr9zDDt+a5V5QwPng8msgUBP3qS4FxHv3sI4h+2t5Owo1u34E/o77LqyVzPX8HBmtt2aTBJv42OtS1LjY1zWrA6COnuQ63PA4/01zzWwcwjFRayaKGDfiBVEd+tIx92FONufvVMxhIWo0w1OiuU05pfQMlQvcIyoxLsvtkXZB9Fo68pDXmoTfZpU2lLO9Tx5HRkCO5YHy0Oppgsq85cstddKNdVoWxfcJ22nv6lRQ7/2KjODvTVwNuvu4QF3dPNOUhj6ki1YKn0uUB0HQbLYw5X+puICLbkZ6rRYo7Oil57XdpoYj2aYnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dcIeQ6mGEnh1gATpgNs0IJRozX0C5y8a8f0HsOJvhtk=;
 b=e0zUMklZr6M3vXj7ZtqnMpJYePP+aIgXHcejzMLNb6l0h/NHuK+PRQ0eEBcQMoOhwnPNhFo2HNdymeMzAE0VX3SIe2rk09KHhC9QHowr/5y+XryftLHwdXg9XyYN0tGG6pPqffE4IVaTsUL6IEJU0UCe67grKN/nAWFwfa4snhmXsRgD0LF8qPfRUC/8gjMtwve5qMKTMMRt8CIDT/tBMgDyZer1mE9HYGN5WuRvCc9As3wV9lqwAIVLpN9G7H+mq7/5CnU5pjBedZtGymlcV8pySZoP0LdhORmo3HMiGTK514ciGMiDCnyA3Gg6FGtcJr3oS/by3zzTRu0oYtyW8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dcIeQ6mGEnh1gATpgNs0IJRozX0C5y8a8f0HsOJvhtk=;
 b=WHrq9H5VUXcU9x26xuVK5OvqiNvSAyJAfJqfZ0ATCm2TRE+28I/mw8K3CTj/ecuc6Q5Y31ruwHPjy2MSsPrFqvCsW91ovvu5HzqPZO8yE6iePouS2cFrIZBd3ZyWQ1hUgSTjH9+9uC8EOZWl3g7BHQfQCDYsjRTnHq6s/V6Gs8tMscasoSbJBV7kgbi1nnfKvcObM08WgTqyOJhatBgWjvJ27/fTm28kFcFqKqbSXSS3UGXJPAWTEKz6/IOPwdWVNqEpLLpnALHdkPRgy0jI6sp8IlCkh3fWz95FQjtHUIW9PJQDMn2hA+e6kKGpFkmGuYDUnIbUmp86Zy8KUoAFuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by MN0PR12MB6317.namprd12.prod.outlook.com (2603:10b6:208:3c2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Tue, 12 Aug
 2025 02:41:17 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%5]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 02:41:17 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Balbir Singh <balbirs@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?q?Mika=20Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [v3 10/11] gpu/drm/nouveau: add THP migration support
Date: Tue, 12 Aug 2025 12:40:35 +1000
Message-ID: <20250812024036.690064-11-balbirs@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812024036.690064-1-balbirs@nvidia.com>
References: <20250812024036.690064-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0001.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::6) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|MN0PR12MB6317:EE_
X-MS-Office365-Filtering-Correlation-Id: 52293748-a871-44f0-b7c5-08ddd949b657
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cDNGZXVpMFpERkhuSDBDSG13TEE3aEJTTklsMnV2a2x4akNzdkVuYUtRU0xn?=
 =?utf-8?B?bUI2ZHF2YXYzWUx6OUlNZGZvNWxyL1hFZzJxcjZJNzdjUG1Dd1pvdExiYzV3?=
 =?utf-8?B?emF6R280NzBsaENEUGtiRzZuZUFyWm05dG1DRWpxOW83K1FMVFpDVm9LTDVo?=
 =?utf-8?B?NUpmTGFpZnhnSk1ieis4WHJ6WWtxUG0va0lZN0REdHorWXBJdzQ3SG1OakN3?=
 =?utf-8?B?aFZSWGNlLzdRdU1vRDhEMVVHL1Y3SG81cy9yNElDWnJxYzJxc3FvWFVWcFlS?=
 =?utf-8?B?YkdPRHlZZ0hEbEdmS3hnWWdxZVFIanJuV2FYQ0pLLytjVDNaa0ZWMU9hejBL?=
 =?utf-8?B?a2VYcDY4OTF6L2hjSUdLUi9UL2RCemNMVCtZOHNHOEp3ZFQ1M3JIZkpJN0Z4?=
 =?utf-8?B?SGc4WGdCN0xlcjliTjdWMzNldEhqZFp2d0pmYjFvdllIVUM4RGNOdDdGb2V3?=
 =?utf-8?B?Ykxwa2IwNnZOakVkbVZ5T2dDdThNRCtwdWhHd0o1UkpTb1hoVFFtUVdsTWlz?=
 =?utf-8?B?OHhRRHJjcDZDY2FaeE84QkU1T3FINUE4NEU0K2VNNmxSbFV0RzJmVUQwM3Nx?=
 =?utf-8?B?bDhTSE1VamlYcEJGdU1aSVBjRGxoWnVvZU5xby8rdjE2SERNV2ZjcEh0VHVI?=
 =?utf-8?B?MkxuWmIyMk0vWmJleTNEdGJwT1YreEk5OXhhOStXREV2WUl2MiszYTV1ODJ6?=
 =?utf-8?B?YVRKTTRPSnlqVWJjSlY5aXZyUm9BcE5ZM3dnWStYamtmRWtQWFRaQlp5M3N4?=
 =?utf-8?B?eGMzMWhGVnVkbzFDbEJaL3lIdTl2aGN5QXVZN0E1Y01KdWRQMndLdjJad3g4?=
 =?utf-8?B?ekdWWWFrTHNmcU1aK21WY0cwcTJZNzRnUUttaXJzTWlaV3A1c0RsYzliRGk5?=
 =?utf-8?B?T3ZTbjhIQ2tLYkx4K2diUXVWLzEzL0p0b0J2RktjaVJKUUFHaXREdE96aEdY?=
 =?utf-8?B?K2tCbDFOejMzL2l6b1YxYTM2ODVwenM3TTRDejAya0s0d0U0ejBab0dkTlU5?=
 =?utf-8?B?NnZEeTJTZWZETy92a0ZSOVVhWSsvWlEvT214VitMdHNpWG1zVVJPa2VhRFJO?=
 =?utf-8?B?OXZHbTVRMCtSN3Bhd01OYlVWeWlHa2hGdS8rbzFMS3R2VzV3L2YvN3ptc3da?=
 =?utf-8?B?dy9vMEZRNVlVVHl0aWJUNDNUalpRcW1kamJNU1lPdE8rT21adzZlUHRkSFZa?=
 =?utf-8?B?ZlVwRTVieEtmeUQ0Mm9MbGMxd3VZYStqZ1pGZTZhWVhhcUxCQXJTZDVyeXlk?=
 =?utf-8?B?U1RDRjlIK1Vmc1NoL2tIMlI0TjQzUC9SZFp1eXN6TUF0ZXZJN3lxWGY1TkZM?=
 =?utf-8?B?bW1PaFNUWHZ2Z0RJcmVPcUh5c2FFSnFKdWppczNIUHpFVFdlZmUvQ3gvd3N0?=
 =?utf-8?B?NWpnSHYzcktPSnZZWnZ0WmhSaW5zeTZ5WmkyblZFM1J3d2dYK1U2bm1EdG9Y?=
 =?utf-8?B?RGNBbWtQQ3ByemZhYms0Q2pmV3RoNjhydC84MEJ0RGhUblVudXV1N1p3clJB?=
 =?utf-8?B?cTgyT3lVcWZzNjVrV0FvTEdxblkwZVhGdVVqSm1ERGRGTEp4NmFGcklBeHcz?=
 =?utf-8?B?dXA1bGpOVmEzZnQzRlZxaVl0Rm5BUEU2am1aRUhXakVHZEwwaDBXRFh3Z0cw?=
 =?utf-8?B?N2JpNDh5VjBwOGdWQ0t6eUEva1dXbHRUaGErbFVQQmhTWDlqZ2NvcVpOTk9F?=
 =?utf-8?B?cWRsN2NJZjdQK2l2NElrYjJJZ1dDZ1orRGZMdVdSa2YwMDY4dHRZRmZZcWRm?=
 =?utf-8?B?VzBSSFFZRFQzVy9TZFVkdTFwRXQ4YS9wRmYza05jWUxDekNmYjl4b0xQTFRB?=
 =?utf-8?B?MERsZnR2UlExSHl5SkQ2QnJJdWdhUFowbFFuN096TVl4aGxKN3NKeFRVcWZW?=
 =?utf-8?B?YWQrdmtMWkVLOHRLYmxqOGY1K3BjQ09kMUl3M2ZvOFdRRlB1NTFrZnUzUTJ3?=
 =?utf-8?Q?58DOc5sGZB8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clNlRWcvWHVFY3hmVnk3ZkMyMlVpbEJPdjJJMHdCdlZCNnhDcUFSYmd4SlF5?=
 =?utf-8?B?K3FMbUk4dmtITmJqUTViaGNrdEFGNWpUT2tIOGRuSSszenlFVnhid0w2VlJt?=
 =?utf-8?B?d1pEVHRWNURrSXBhejlFMDMzUUJldmdGYlpCRTFPdUhUVDl3UkJRSDRQWU4v?=
 =?utf-8?B?ajM2NHByWUdTZGhYU2lsZExGcHp6ZkVxNVNrcEFBSWxkYkhLUjd0eXdsTGFP?=
 =?utf-8?B?RWgralM0VXJ0RmJLRzJkdWdEbXYyVldtVUIySzRRcjJoM1libWxOMWMybDc4?=
 =?utf-8?B?Q3k5b3BjRGR0WUlrVmJIT29pN0VIa3dPUHRFVThWdi9sUWdTVjFHQlZ3Y0lK?=
 =?utf-8?B?bDZ1MFlrY0hCTXUvaWtqYkRlUk52bkpiWk8wQ3cvakVxbUY4THpwUXUyQ3l1?=
 =?utf-8?B?ZmovNVUrZkljU2hsTmxBRzJyd0huMitTbVVjcEFQWmI5K2ppdjlwLzJraTNp?=
 =?utf-8?B?SU9ablNPTUFSejhNVDh5a0VzVGRqUjBrMEo4L0k0Wk1iaGR0NWY0ajhReWVE?=
 =?utf-8?B?YVlrMEh6Q09iQUEydGRpeDRJNG52RlFOL2VqUDNmS0JaQUJ3MnFwRlNJeHht?=
 =?utf-8?B?K3N3ejd0WlExVklNZG5WL1BOMmNXbmN1cXQ3VzdrMEtTTkpKZTJlOHVBbHM1?=
 =?utf-8?B?cmtYRnpCUHRoamkyVHkxU25oaTY3bXovKzE0dFY5NTQyZDdpUmhSOERkbUpy?=
 =?utf-8?B?WGFSSkF0cDlWQlUwaERBVjdFTHZGaDFyektmaGNyMkxvMkZmK1FtLzRuSTF4?=
 =?utf-8?B?Y1JsMklFUkpuMlZoTHFzdEZGTWRUdFFJb2hrc256U214SXczd3ZWVWRFaUNS?=
 =?utf-8?B?b0tuUWpGckRad0pYNXBoMjN6SnRhVUZFZE5qdzN5UndtOGJ0SUFjUU5JY0FK?=
 =?utf-8?B?RWd2U1JFL3l0eHBoRDhhc3Z2M0ViallhVFk5dURzSEVzMGJ1VGtaM2tUZnB4?=
 =?utf-8?B?OUJ4Q1ZSMEYyNGJEcDV0Y05Pb2tlZG5XYi92YzRQRTJkTjZMaDJ5ZTQxbHd2?=
 =?utf-8?B?K0NteW9Sam9yb0lNN3NDOVd4d0ZrNGlXK1d5a01rODdiMTNXWGNkL0dkQlpS?=
 =?utf-8?B?TW9YUERVTlo5Um9mTGhlbmZBTXpkN3VaUDl3T3RVdndoUzRqM3ZjRHYzTmhm?=
 =?utf-8?B?VEVrWTZFN2pScm5yR0J2UnovbmZ5bFNueldudFFYQ05RUTBZZWkrY3Mra2FU?=
 =?utf-8?B?Wi9YUGJ4ajQ0S3JHaDN2L0NOOU9VejNSaVZOSnl0OWV6cml0cXhGYm01Tmpz?=
 =?utf-8?B?TEVYZGpVVklHSjJTcWZzYjdSa2cva1JDSi9vbHRYWUpPMFJlZWhNZ1JJRGxR?=
 =?utf-8?B?RE1WS3ZNZmsrd2o1NFhQK1VYeHlTS2hIZ1JXQ2FwZmpvaFo4QU5lK3lQd3Uv?=
 =?utf-8?B?azNUa1VQeHFCS3NVZmVIMjg3SWNBckxPWC8xczRQT0lpek1hVDdqaXNmTkhV?=
 =?utf-8?B?cnlmQmp3bmlmaUZZeC9DZlF1dkl4SnFwa3E4bHlEWTFHblphNFhYM0hwcktl?=
 =?utf-8?B?czVOUmhNMHRNaTRoNCtCL2pYdEtrMUZsV1JpcWg1UlRPWGdNbDZSRzRuM01o?=
 =?utf-8?B?RHVqVWpHVVJ3SGhBMGZhYVFZZjcvMVlqWCtPT28yR1VFcjFCaGZOT2lCc3NK?=
 =?utf-8?B?QVdEa1ZEU2NkWVl3ZzdJVWxtc3R5WGlpN2dNSXpHUmVVYnRhRC83RUlCR0F5?=
 =?utf-8?B?dWVjU1hKMzlwMCtYZ3VjQno0QWpFYmczUHZFTjhVMm52SWI3NHgrZ0ozWk1G?=
 =?utf-8?B?UmNDVTN3UnQrazM5dUZ1WFUydkN2YkFvLy9yUCtnMnRMYUFmaXExNmFwOG5M?=
 =?utf-8?B?eGNVSUNHc0tFemJXZ0pSMGpBek9FYkRDdlZZa0JDbmVlNWtXTW5RNVV1a3JX?=
 =?utf-8?B?U2NnT2luaVFRbjcvaUJjd0trUUQ5bnpWZm5raXpqeXZDc3NJRG5sNHZ4TFEv?=
 =?utf-8?B?d2VucFF2dVFZeFZDdkdqMEFtbDltNEVQM3BMckl0aFFCdDRFSUVNMWVVeTJi?=
 =?utf-8?B?RXBVWlI2VVI4TC8za3VnbjltMjZ6TTZFTHVWcFRoWVdaeXBYem1hMGdVZmlz?=
 =?utf-8?B?MXRBWVE5MUpmalBWWVV3bmpRMWZyaGZ5K0xBYzd1TG55WitXV29pakhPcVdV?=
 =?utf-8?Q?XX44gzXINmfkxVSyjdeIurWlC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52293748-a871-44f0-b7c5-08ddd949b657
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 02:41:17.3117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xKahMXWmA94MSg0kGLo4QDDPnyEhZ3Zka9CjDBjMtNtiL87f/oHrUgp5/dFL1HQuTxsWin5qf7XKGfhXnRlk1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6317
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

Change the code to add support for MIGRATE_VMA_SELECT_COMPOUND
and appropriately handling page sizes in the migrate/evict
code paths.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Nico Pache <npache@redhat.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Dev Jain <dev.jain@arm.com>
Cc: Barry Song <baohua@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ralph Campbell <rcampbell@nvidia.com>
Cc: Mika Penttilä <mpenttil@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>

Signed-off-by: Balbir Singh <balbirs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 253 ++++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_svm.c  |   6 +-
 drivers/gpu/drm/nouveau/nouveau_svm.h  |   3 +-
 3 files changed, 186 insertions(+), 76 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index ca4932a150e3..408c1adf6f20 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -83,9 +83,15 @@ struct nouveau_dmem {
 	struct list_head chunks;
 	struct mutex mutex;
 	struct page *free_pages;
+	struct folio *free_folios;
 	spinlock_t lock;
 };
 
+struct nouveau_dmem_dma_info {
+	dma_addr_t dma_addr;
+	size_t size;
+};
+
 static struct nouveau_dmem_chunk *nouveau_page_to_chunk(struct page *page)
 {
 	return container_of(page_pgmap(page), struct nouveau_dmem_chunk,
@@ -112,10 +118,16 @@ static void nouveau_dmem_page_free(struct page *page)
 {
 	struct nouveau_dmem_chunk *chunk = nouveau_page_to_chunk(page);
 	struct nouveau_dmem *dmem = chunk->drm->dmem;
+	struct folio *folio = page_folio(page);
 
 	spin_lock(&dmem->lock);
-	page->zone_device_data = dmem->free_pages;
-	dmem->free_pages = page;
+	if (folio_order(folio)) {
+		folio_set_zone_device_data(folio, dmem->free_folios);
+		dmem->free_folios = folio;
+	} else {
+		page->zone_device_data = dmem->free_pages;
+		dmem->free_pages = page;
+	}
 
 	WARN_ON(!chunk->callocated);
 	chunk->callocated--;
@@ -139,20 +151,28 @@ static void nouveau_dmem_fence_done(struct nouveau_fence **fence)
 	}
 }
 
-static int nouveau_dmem_copy_one(struct nouveau_drm *drm, struct page *spage,
-				struct page *dpage, dma_addr_t *dma_addr)
+static int nouveau_dmem_copy_folio(struct nouveau_drm *drm,
+				   struct folio *sfolio, struct folio *dfolio,
+				   struct nouveau_dmem_dma_info *dma_info)
 {
 	struct device *dev = drm->dev->dev;
+	struct page *dpage = folio_page(dfolio, 0);
+	struct page *spage = folio_page(sfolio, 0);
 
-	lock_page(dpage);
+	folio_lock(dfolio);
 
-	*dma_addr = dma_map_page(dev, dpage, 0, PAGE_SIZE, DMA_BIDIRECTIONAL);
-	if (dma_mapping_error(dev, *dma_addr))
+	dma_info->dma_addr = dma_map_page(dev, dpage, 0, page_size(dpage),
+					DMA_BIDIRECTIONAL);
+	dma_info->size = page_size(dpage);
+	if (dma_mapping_error(dev, dma_info->dma_addr))
 		return -EIO;
 
-	if (drm->dmem->migrate.copy_func(drm, 1, NOUVEAU_APER_HOST, *dma_addr,
-					 NOUVEAU_APER_VRAM, nouveau_dmem_page_addr(spage))) {
-		dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(sfolio),
+					 NOUVEAU_APER_HOST, dma_info->dma_addr,
+					 NOUVEAU_APER_VRAM,
+					 nouveau_dmem_page_addr(spage))) {
+		dma_unmap_page(dev, dma_info->dma_addr, page_size(dpage),
+					DMA_BIDIRECTIONAL);
 		return -EIO;
 	}
 
@@ -165,21 +185,47 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	struct nouveau_dmem *dmem = drm->dmem;
 	struct nouveau_fence *fence;
 	struct nouveau_svmm *svmm;
-	struct page *spage, *dpage;
-	unsigned long src = 0, dst = 0;
-	dma_addr_t dma_addr = 0;
+	struct page *dpage;
 	vm_fault_t ret = 0;
 	struct migrate_vma args = {
 		.vma		= vmf->vma,
-		.start		= vmf->address,
-		.end		= vmf->address + PAGE_SIZE,
-		.src		= &src,
-		.dst		= &dst,
 		.pgmap_owner	= drm->dev,
 		.fault_page	= vmf->page,
-		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
+		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE |
+				  MIGRATE_VMA_SELECT_COMPOUND,
+		.src = NULL,
+		.dst = NULL,
 	};
+	unsigned int order, nr;
+	struct folio *sfolio, *dfolio;
+	struct nouveau_dmem_dma_info dma_info;
+
+	sfolio = page_folio(vmf->page);
+	order = folio_order(sfolio);
+	nr = 1 << order;
 
+	/*
+	 * Handle partial unmap faults, where the folio is large, but
+	 * the pmd is split.
+	 */
+	if (vmf->pte) {
+		order = 0;
+		nr = 1;
+	}
+
+	if (order)
+		args.flags |= MIGRATE_VMA_SELECT_COMPOUND;
+
+	args.start = ALIGN_DOWN(vmf->address, (1 << (PAGE_SHIFT + order)));
+	args.vma = vmf->vma;
+	args.end = args.start + (PAGE_SIZE << order);
+	args.src = kcalloc(nr, sizeof(*args.src), GFP_KERNEL);
+	args.dst = kcalloc(nr, sizeof(*args.dst), GFP_KERNEL);
+
+	if (!args.src || !args.dst) {
+		ret = VM_FAULT_OOM;
+		goto err;
+	}
 	/*
 	 * FIXME what we really want is to find some heuristic to migrate more
 	 * than just one page on CPU fault. When such fault happens it is very
@@ -190,20 +236,26 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	if (!args.cpages)
 		return 0;
 
-	spage = migrate_pfn_to_page(src);
-	if (!spage || !(src & MIGRATE_PFN_MIGRATE))
-		goto done;
-
-	dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma, vmf->address);
-	if (!dpage)
+	if (order)
+		dpage = folio_page(vma_alloc_folio(GFP_HIGHUSER | __GFP_ZERO,
+					order, vmf->vma, vmf->address), 0);
+	else
+		dpage = alloc_page_vma(GFP_HIGHUSER | __GFP_ZERO, vmf->vma,
+					vmf->address);
+	if (!dpage) {
+		ret = VM_FAULT_OOM;
 		goto done;
+	}
 
-	dst = migrate_pfn(page_to_pfn(dpage));
+	args.dst[0] = migrate_pfn(page_to_pfn(dpage));
+	if (order)
+		args.dst[0] |= MIGRATE_PFN_COMPOUND;
+	dfolio = page_folio(dpage);
 
-	svmm = spage->zone_device_data;
+	svmm = folio_zone_device_data(sfolio);
 	mutex_lock(&svmm->mutex);
 	nouveau_svmm_invalidate(svmm, args.start, args.end);
-	ret = nouveau_dmem_copy_one(drm, spage, dpage, &dma_addr);
+	ret = nouveau_dmem_copy_folio(drm, sfolio, dfolio, &dma_info);
 	mutex_unlock(&svmm->mutex);
 	if (ret) {
 		ret = VM_FAULT_SIGBUS;
@@ -213,19 +265,33 @@ static vm_fault_t nouveau_dmem_migrate_to_ram(struct vm_fault *vmf)
 	nouveau_fence_new(&fence, dmem->migrate.chan);
 	migrate_vma_pages(&args);
 	nouveau_dmem_fence_done(&fence);
-	dma_unmap_page(drm->dev->dev, dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(drm->dev->dev, dma_info.dma_addr, PAGE_SIZE,
+				DMA_BIDIRECTIONAL);
 done:
 	migrate_vma_finalize(&args);
+err:
+	kfree(args.src);
+	kfree(args.dst);
 	return ret;
 }
 
+static void nouveau_dmem_folio_split(struct folio *head, struct folio *tail)
+{
+	if (tail == NULL)
+		return;
+	tail->pgmap = head->pgmap;
+	folio_set_zone_device_data(tail, folio_zone_device_data(head));
+}
+
 static const struct dev_pagemap_ops nouveau_dmem_pagemap_ops = {
 	.page_free		= nouveau_dmem_page_free,
 	.migrate_to_ram		= nouveau_dmem_migrate_to_ram,
+	.folio_split		= nouveau_dmem_folio_split,
 };
 
 static int
-nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
+nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage,
+			 bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct resource *res;
@@ -274,16 +340,21 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 	pfn_first = chunk->pagemap.range.start >> PAGE_SHIFT;
 	page = pfn_to_page(pfn_first);
 	spin_lock(&drm->dmem->lock);
-	for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
-		page->zone_device_data = drm->dmem->free_pages;
-		drm->dmem->free_pages = page;
+
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) || !is_large) {
+		for (i = 0; i < DMEM_CHUNK_NPAGES - 1; ++i, ++page) {
+			page->zone_device_data = drm->dmem->free_pages;
+			drm->dmem->free_pages = page;
+		}
 	}
+
 	*ppage = page;
 	chunk->callocated++;
 	spin_unlock(&drm->dmem->lock);
 
-	NV_INFO(drm, "DMEM: registered %ldMB of device memory\n",
-		DMEM_CHUNK_SIZE >> 20);
+	NV_INFO(drm, "DMEM: registered %ldMB of %sdevice memory %lx %lx\n",
+		DMEM_CHUNK_SIZE >> 20, is_large ? "THP " : "", pfn_first,
+		nouveau_dmem_page_addr(page));
 
 	return 0;
 
@@ -298,27 +369,37 @@ nouveau_dmem_chunk_alloc(struct nouveau_drm *drm, struct page **ppage)
 }
 
 static struct page *
-nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
+nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm, bool is_large)
 {
 	struct nouveau_dmem_chunk *chunk;
 	struct page *page = NULL;
+	struct folio *folio = NULL;
 	int ret;
+	unsigned int order = 0;
 
 	spin_lock(&drm->dmem->lock);
-	if (drm->dmem->free_pages) {
+	if (is_large && drm->dmem->free_folios) {
+		folio = drm->dmem->free_folios;
+		drm->dmem->free_folios = folio_zone_device_data(folio);
+		chunk = nouveau_page_to_chunk(page);
+		chunk->callocated++;
+		spin_unlock(&drm->dmem->lock);
+		order = DMEM_CHUNK_NPAGES;
+	} else if (!is_large && drm->dmem->free_pages) {
 		page = drm->dmem->free_pages;
 		drm->dmem->free_pages = page->zone_device_data;
 		chunk = nouveau_page_to_chunk(page);
 		chunk->callocated++;
 		spin_unlock(&drm->dmem->lock);
+		folio = page_folio(page);
 	} else {
 		spin_unlock(&drm->dmem->lock);
-		ret = nouveau_dmem_chunk_alloc(drm, &page);
+		ret = nouveau_dmem_chunk_alloc(drm, &page, is_large);
 		if (ret)
 			return NULL;
 	}
 
-	zone_device_page_init(page);
+	zone_device_folio_init(folio, order);
 	return page;
 }
 
@@ -369,12 +450,12 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 {
 	unsigned long i, npages = range_len(&chunk->pagemap.range) >> PAGE_SHIFT;
 	unsigned long *src_pfns, *dst_pfns;
-	dma_addr_t *dma_addrs;
+	struct nouveau_dmem_dma_info *dma_info;
 	struct nouveau_fence *fence;
 
 	src_pfns = kvcalloc(npages, sizeof(*src_pfns), GFP_KERNEL | __GFP_NOFAIL);
 	dst_pfns = kvcalloc(npages, sizeof(*dst_pfns), GFP_KERNEL | __GFP_NOFAIL);
-	dma_addrs = kvcalloc(npages, sizeof(*dma_addrs), GFP_KERNEL | __GFP_NOFAIL);
+	dma_info = kvcalloc(npages, sizeof(*dma_info), GFP_KERNEL | __GFP_NOFAIL);
 
 	migrate_device_range(src_pfns, chunk->pagemap.range.start >> PAGE_SHIFT,
 			npages);
@@ -382,17 +463,28 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	for (i = 0; i < npages; i++) {
 		if (src_pfns[i] & MIGRATE_PFN_MIGRATE) {
 			struct page *dpage;
+			struct folio *folio = page_folio(
+				migrate_pfn_to_page(src_pfns[i]));
+			unsigned int order = folio_order(folio);
+
+			if (src_pfns[i] & MIGRATE_PFN_COMPOUND) {
+				dpage = folio_page(
+						folio_alloc(
+						GFP_HIGHUSER_MOVABLE, order), 0);
+			} else {
+				/*
+				 * _GFP_NOFAIL because the GPU is going away and there
+				 * is nothing sensible we can do if we can't copy the
+				 * data back.
+				 */
+				dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
+			}
 
-			/*
-			 * _GFP_NOFAIL because the GPU is going away and there
-			 * is nothing sensible we can do if we can't copy the
-			 * data back.
-			 */
-			dpage = alloc_page(GFP_HIGHUSER | __GFP_NOFAIL);
 			dst_pfns[i] = migrate_pfn(page_to_pfn(dpage));
-			nouveau_dmem_copy_one(chunk->drm,
-					migrate_pfn_to_page(src_pfns[i]), dpage,
-					&dma_addrs[i]);
+			nouveau_dmem_copy_folio(chunk->drm,
+				page_folio(migrate_pfn_to_page(src_pfns[i])),
+				page_folio(dpage),
+				&dma_info[i]);
 		}
 	}
 
@@ -403,8 +495,9 @@ nouveau_dmem_evict_chunk(struct nouveau_dmem_chunk *chunk)
 	kvfree(src_pfns);
 	kvfree(dst_pfns);
 	for (i = 0; i < npages; i++)
-		dma_unmap_page(chunk->drm->dev->dev, dma_addrs[i], PAGE_SIZE, DMA_BIDIRECTIONAL);
-	kvfree(dma_addrs);
+		dma_unmap_page(chunk->drm->dev->dev, dma_info[i].dma_addr,
+				dma_info[i].size, DMA_BIDIRECTIONAL);
+	kvfree(dma_info);
 }
 
 void
@@ -607,31 +700,35 @@ nouveau_dmem_init(struct nouveau_drm *drm)
 
 static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, unsigned long src,
-		dma_addr_t *dma_addr, u64 *pfn)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfn)
 {
 	struct device *dev = drm->dev->dev;
 	struct page *dpage, *spage;
 	unsigned long paddr;
+	bool is_large = false;
 
 	spage = migrate_pfn_to_page(src);
 	if (!(src & MIGRATE_PFN_MIGRATE))
 		goto out;
 
-	dpage = nouveau_dmem_page_alloc_locked(drm);
+	is_large = src & MIGRATE_PFN_COMPOUND;
+	dpage = nouveau_dmem_page_alloc_locked(drm, is_large);
 	if (!dpage)
 		goto out;
 
 	paddr = nouveau_dmem_page_addr(dpage);
 	if (spage) {
-		*dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
+		dma_info->dma_addr = dma_map_page(dev, spage, 0, page_size(spage),
 					 DMA_BIDIRECTIONAL);
-		if (dma_mapping_error(dev, *dma_addr))
+		dma_info->size = page_size(spage);
+		if (dma_mapping_error(dev, dma_info->dma_addr))
 			goto out_free_page;
-		if (drm->dmem->migrate.copy_func(drm, 1,
-			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
+		if (drm->dmem->migrate.copy_func(drm, folio_nr_pages(page_folio(spage)),
+			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST,
+			dma_info->dma_addr))
 			goto out_dma_unmap;
 	} else {
-		*dma_addr = DMA_MAPPING_ERROR;
+		dma_info->dma_addr = DMA_MAPPING_ERROR;
 		if (drm->dmem->migrate.clear_func(drm, page_size(dpage),
 			NOUVEAU_APER_VRAM, paddr))
 			goto out_free_page;
@@ -645,7 +742,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 	return migrate_pfn(page_to_pfn(dpage));
 
 out_dma_unmap:
-	dma_unmap_page(dev, *dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
+	dma_unmap_page(dev, dma_info->dma_addr, PAGE_SIZE, DMA_BIDIRECTIONAL);
 out_free_page:
 	nouveau_dmem_page_free_locked(drm, dpage);
 out:
@@ -655,27 +752,33 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
 
 static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 		struct nouveau_svmm *svmm, struct migrate_vma *args,
-		dma_addr_t *dma_addrs, u64 *pfns)
+		struct nouveau_dmem_dma_info *dma_info, u64 *pfns)
 {
 	struct nouveau_fence *fence;
 	unsigned long addr = args->start, nr_dma = 0, i;
+	unsigned long order = 0;
+
+	for (i = 0; addr < args->end; ) {
+		struct folio *folio;
 
-	for (i = 0; addr < args->end; i++) {
+		folio = page_folio(migrate_pfn_to_page(args->dst[i]));
+		order = folio_order(folio);
 		args->dst[i] = nouveau_dmem_migrate_copy_one(drm, svmm,
-				args->src[i], dma_addrs + nr_dma, pfns + i);
-		if (!dma_mapping_error(drm->dev->dev, dma_addrs[nr_dma]))
+				args->src[i], dma_info + nr_dma, pfns + i);
+		if (!dma_mapping_error(drm->dev->dev, dma_info[nr_dma].dma_addr))
 			nr_dma++;
-		addr += PAGE_SIZE;
+		i += 1 << order;
+		addr += (1 << order) * PAGE_SIZE;
 	}
 
 	nouveau_fence_new(&fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
-	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
+	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i, order);
 
 	while (nr_dma--) {
-		dma_unmap_page(drm->dev->dev, dma_addrs[nr_dma], PAGE_SIZE,
-				DMA_BIDIRECTIONAL);
+		dma_unmap_page(drm->dev->dev, dma_info[nr_dma].dma_addr,
+				dma_info[nr_dma].size, DMA_BIDIRECTIONAL);
 	}
 	migrate_vma_finalize(args);
 }
@@ -689,20 +792,24 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 {
 	unsigned long npages = (end - start) >> PAGE_SHIFT;
 	unsigned long max = min(SG_MAX_SINGLE_ALLOC, npages);
-	dma_addr_t *dma_addrs;
 	struct migrate_vma args = {
 		.vma		= vma,
 		.start		= start,
 		.pgmap_owner	= drm->dev,
-		.flags		= MIGRATE_VMA_SELECT_SYSTEM,
+		.flags		= MIGRATE_VMA_SELECT_SYSTEM
+				  | MIGRATE_VMA_SELECT_COMPOUND,
 	};
 	unsigned long i;
 	u64 *pfns;
 	int ret = -ENOMEM;
+	struct nouveau_dmem_dma_info *dma_info;
 
 	if (drm->dmem == NULL)
 		return -ENODEV;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		max = max(HPAGE_PMD_NR, max);
+
 	args.src = kcalloc(max, sizeof(*args.src), GFP_KERNEL);
 	if (!args.src)
 		goto out;
@@ -710,8 +817,8 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 	if (!args.dst)
 		goto out_free_src;
 
-	dma_addrs = kmalloc_array(max, sizeof(*dma_addrs), GFP_KERNEL);
-	if (!dma_addrs)
+	dma_info = kmalloc_array(max, sizeof(*dma_info), GFP_KERNEL);
+	if (!dma_info)
 		goto out_free_dst;
 
 	pfns = nouveau_pfns_alloc(max);
@@ -729,7 +836,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 			goto out_free_pfns;
 
 		if (args.cpages)
-			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_addrs,
+			nouveau_dmem_migrate_chunk(drm, svmm, &args, dma_info,
 						   pfns);
 		args.start = args.end;
 	}
@@ -738,7 +845,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
 out_free_pfns:
 	nouveau_pfns_free(pfns);
 out_free_dma:
-	kfree(dma_addrs);
+	kfree(dma_info);
 out_free_dst:
 	kfree(args.dst);
 out_free_src:
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 6fa387da0637..b8a3378154d5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -921,12 +921,14 @@ nouveau_pfns_free(u64 *pfns)
 
 void
 nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		 unsigned long addr, u64 *pfns, unsigned long npages)
+		 unsigned long addr, u64 *pfns, unsigned long npages,
+		 unsigned int page_shift)
 {
 	struct nouveau_pfnmap_args *args = nouveau_pfns_to_args(pfns);
 
 	args->p.addr = addr;
-	args->p.size = npages << PAGE_SHIFT;
+	args->p.size = npages << page_shift;
+	args->p.page = page_shift;
 
 	mutex_lock(&svmm->mutex);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.h b/drivers/gpu/drm/nouveau/nouveau_svm.h
index e7d63d7f0c2d..3fd78662f17e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.h
@@ -33,7 +33,8 @@ void nouveau_svmm_invalidate(struct nouveau_svmm *svmm, u64 start, u64 limit);
 u64 *nouveau_pfns_alloc(unsigned long npages);
 void nouveau_pfns_free(u64 *pfns);
 void nouveau_pfns_map(struct nouveau_svmm *svmm, struct mm_struct *mm,
-		      unsigned long addr, u64 *pfns, unsigned long npages);
+		      unsigned long addr, u64 *pfns, unsigned long npages,
+		      unsigned int page_shift);
 #else /* IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM) */
 static inline void nouveau_svm_init(struct nouveau_drm *drm) {}
 static inline void nouveau_svm_fini(struct nouveau_drm *drm) {}
-- 
2.50.1

