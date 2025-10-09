Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B49BC74A7
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 05:26:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED45110E902;
	Thu,  9 Oct 2025 03:26:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E+s+IHXB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012043.outbound.protection.outlook.com [40.107.209.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BB610E902
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 03:26:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eL2WsHkzIZLYGG5VeuIIdAfuKBF9kReJM7kCGaMMMCvDDH1n2al16gSUl4+DbS0jnsYc/2m4OSCJMpMWiS0upqw0nSoW2J2Aq+w9uQ7D9rCDByTK/QcAsuA9yH7ktah1nowbpm0rtSZ/DXzf/u9rQKVTXT5cgv2suS0oh9CRgyGGiskUjcz5E2eA4nIO0GpvAOgaPL+r/pOD5g7fFjSHlcKiH/ytYTFzj2Id5OeiPCsfekfR6nRebS2U1aoOVhPijo5ROGplPRWRJSDPuUt76i0UMVm3cc1v7Rgazk5jXxPEb69Ck9FgxfD5/snNu6iry6eAPABYPMOEl+aFZzvH9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jfi+wtpiJi/Qh6o8VoMxj405qaMY5XvKirfwmX2J1VE=;
 b=IZdVr27OEFpPiu9Ot+DMxcP5gtdn+nNTTZJblI5h9VeFS9Y5KsV0ynJ7we6Hw+E+CZWqkHPvzxIdkAY3noZjQfX7PUi5rhsieDODC60VIQhFi0W7/iUCz4dVenrLfzCktsMNAhYXuhwPcRZfWm/0Cbed7XiM2YiYetAYmfAmgrJ12jWHRdxIC8jGYwMZQsSCX8RNSA3XbbksPGd1lADttqfz2xDi/IcW80dCry9E32GUUD6vJ6buJaw8V8ySzNtVSU4unx32BfXHuRxJkDcE1tCRZxflZgYvHmfjFsHJF1XhDgSHR6tcfMPcVP9mUUkX7asiANt6epu0V2hp1ctSJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jfi+wtpiJi/Qh6o8VoMxj405qaMY5XvKirfwmX2J1VE=;
 b=E+s+IHXB20kgq0n83mYssXpMYWZUxJySsGuR6U52azWIrXSFZErkfBkWt1dKWO29I4cRHHGevFzRYhT40rOSCx1BR8kIBMRsXEH988yBGLsiqafa5a/04dl+vh/1lJo7tAsXteMlDN78V6e1wSsVWJmbrUUChegqnOIbaqoy8hmhyu48oUQXs1i9nZ2mwHaqUUbMNsUPWMreLPGjUy2tH4vZDmyF8ALecfqAtRuI6aDkrxSNhNkyRk8CGIjr2+wnAFnh8KTN8xvDu3FUDEurU1j5EbpEITrlgm7hovrbMarQPdYmczMuGXCi7YtRYC8JzrE7w0MivxqbPbWtU093Kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ1PR12MB6172.namprd12.prod.outlook.com (2603:10b6:a03:459::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 03:26:39 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 03:26:38 +0000
Message-ID: <a5992f11-5841-4bbf-b190-b5df41b68b0c@nvidia.com>
Date: Thu, 9 Oct 2025 14:26:30 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 00/16] mm: support device-private THP
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, David Hildenbrand <david@redhat.com>,
 Zi Yan <ziy@nvidia.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
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
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <20251008201740.d9507f4807a73058d4da23a8@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0180.namprd03.prod.outlook.com
 (2603:10b6:a03:338::35) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ1PR12MB6172:EE_
X-MS-Office365-Filtering-Correlation-Id: 637e5874-cd9d-442e-01a0-08de06e3a86e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlFKWFkxWHl3cVAzd3lsQjNQd2syV2hHOGFmMnRTRkt1bjVYSk5EQkVxMkdE?=
 =?utf-8?B?dk9rUEpuZHBPMTQ5NFcyT3lwOHlzUXFvQjVWWm1LQ0M4WENpeDIwWTd0MFBV?=
 =?utf-8?B?b3JmRGRVVCtsdWxJU0pkSXc2TVNFVXZ5R1UwNFo0eFVTNFRvM0dDcU51cWY2?=
 =?utf-8?B?cThNQVB3cU9wOFlKSzc1d0h2UTRZM2F4cStEL3NGeEtobkdCR0NLNXdLZW9l?=
 =?utf-8?B?UDgvNjZ6VUdkV1poWFFYaEZDaEU4bGxZQ3g3K2x1WHVGcjQvZVFGN2lkTllT?=
 =?utf-8?B?VEdpcjYxMmovY3dTb1c5Wm5Ra0ZiU2JHdW0vR0FoZVJQaHB4YnBmWk94WFQw?=
 =?utf-8?B?a0JsMHVCM0xvVUU5dVR3VVpHd1JCTzZVYm83R0lRZGZYYWczeUVOS0ZuT0pW?=
 =?utf-8?B?VkNIOWo0bGY4c3VJM3duNHpCdFowak4yOE9ORGVSRmpkUER2TDBDYmxRTEFw?=
 =?utf-8?B?ZFNwVFpKRS84U2N6MkphYlFTRWx4L3hMZU9aSDBqY0dxV2pXR0k4ek44TW52?=
 =?utf-8?B?bGRJdm4weGdMc2wxbE5EOFdBYXVLRDRmczNSZWZ4WWV2dDhPbm5kS0NGNFNa?=
 =?utf-8?B?WFhKZ21KRDB1bmJaL0xiM0F5cFVXNEVQaUU1ZkJhZ3dFSEV0V1hnam8yUXJY?=
 =?utf-8?B?OUcvS2RsQWlCeENLMjl5aFFQeUZBYUNUekZ0WE9QVU1YY3VsbE5jK1kzTXVU?=
 =?utf-8?B?SjFEeHBpWG9RT01udEdwYUJHdUlYMXA2cmZSU0RrcjZCSHkrdlF3V2FsczZs?=
 =?utf-8?B?UStpbDhWVmVxSXpkV3oxR1lKZm05Yll3dDNJL2RVRTl4bDA3TGVSeG5zalBI?=
 =?utf-8?B?RE40c0ZPNFBKSE5tdy8wemMyYXpFVmpPNGhKWUdvMmt6TTNwZnNMbGppNmtD?=
 =?utf-8?B?aHRwTXU4Z0l5TVJLLzJYOEJwbzljRXY3ZU0wdWhRQW9zYmRrZ0k5NG9uZUph?=
 =?utf-8?B?dXVOMldQUmxvVkJRbjVJSmE1MlY5endoZEZrNzlmTk5oNGpLbjhUb281S0lO?=
 =?utf-8?B?L3J6YnlqeDhvNURCZCtsK2lMUVo3K0FhQjB2ZXBwSnlYajdpNWhUVzFQQ2xz?=
 =?utf-8?B?T3c5SEFObWwyS2I3RmIrVEU2aEJhS096dFpKSXlMUDBXYlZ5SVE5UHc0TFBy?=
 =?utf-8?B?YnBuQTUvV2xQQktOVHQyZWpzaTdYRDJVZzRoUG1RMjJ3M2RVeEVjOExqYnpJ?=
 =?utf-8?B?VjFtek9DTmZxbVZKeDJmdjN2M3V5TkxJVGJVNHRCYzlLVGZqR0orOXBydW1z?=
 =?utf-8?B?V2lmdUp1cGhCeElEWFdQbHpNK0VUOGVweHlDcmtqTjFuQzk2djBBNEpkT2FY?=
 =?utf-8?B?aXh3ZzFUR3BHZG03SVpBbDVoTmpib25wWmF2QUU2UmRFTkZTMDJFYWsxMkZJ?=
 =?utf-8?B?R1FwSE1ndG5ScTNjc1NqaGF4bm81SENXb3RTUkVUWHZmMnpxSlFqR3JTUFpu?=
 =?utf-8?B?MFZCdGNxNWdNNkN6TnVHOGdYNWthU3BhY1hCa2ttUkJEUU5TY3FNQ1duMU5D?=
 =?utf-8?B?RFFrL1poazQ0TUp0bUY3RVdXZ3l1d3lma0hVMFQ0VWtQcG1RaHpKTmNERVhJ?=
 =?utf-8?B?ZjNDZTZyMjlxVk1yekNQVzdzUERSUlBpcC8yQmNFUXFUN09XL2liOGNaYU4x?=
 =?utf-8?B?akc3YkdRTHlkMU1FcXI3cGlhM2ZnMjRPYTNIZEU0YUQxa0FxVEcwcXBncDcy?=
 =?utf-8?B?N1VrT1AvdzRsK0VHUGRicTg2bkd4WFV3MUZqSlhRUEdDQmRMME9kV2JoQ0pH?=
 =?utf-8?B?aExKWHdiVU5qaEs3dGpJZTVRQVZIK2ZKeGZNYWd0bmd2U3pFQlp1SElqbkZ6?=
 =?utf-8?B?NDdUYjNTak5NWWtubG90UGIyTHlVN1FRSDdrT2lMSEd1aVdoeWxFaGZ6S2du?=
 =?utf-8?B?SXRYWldnRW02akVvck8wQjd3UkJwcnF4MjNxOTFQZHlPbXgyZzVOUVVvMEZL?=
 =?utf-8?B?NlhWTHR6aTl4ZXNiWjR0dlpMdVFOSXZBbHJyUzJEY1BPZ0Jmd0RlU2dnbEVj?=
 =?utf-8?B?MDZaRWlyUUZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWNvT3JQR3MvYTNBT2hhNnBpSjcrTXVCeXpZS09hS2hxT0RMUkJTSk1SVGJj?=
 =?utf-8?B?ZmRURnZVVFk1bEl3Nkt4Q0ordE5CMUF0OEkwNC9qNWxQVTJIZmwyR29aMHJk?=
 =?utf-8?B?K1pIVWpTbmtHTFVSVFVFTHdMZGRyc0lDQksvNEVLNDFZeUhSRW5LNlBqK3VH?=
 =?utf-8?B?RUNFcnRrQmRRQi80WjlVOUNOb0RzZG1RS0N0TVh4OGJGUVU3OE5ta1NNNlJO?=
 =?utf-8?B?N2JMSDM3YlVNR25SQ3pOaFlTVnZiZUZOM0tyZ3dSb0R5blJ5K1lEOXlOT0h3?=
 =?utf-8?B?eHNFTDJYQm5SRVRkdUJ6dHZaT1VmdU1adWtDOEFESFo1QlliTmxwWEFtWlVJ?=
 =?utf-8?B?ZmdiVXVHSmk0U1gvVG8yb3JVeTlCWnQ5WGk3SFdsU2NPbWM1dkRuZ0hQS3o3?=
 =?utf-8?B?dThRbFg2TEhNSEFJbjJtd0l3d1JWVVo1ZXU5K1BiS1ZGQjIyM2dZcW1mMlNI?=
 =?utf-8?B?YVJENVptMkdWQ2pEbEpIM0dUSVAvS0tGRnZaUGdOR1plVTI4TWpWTWpYbUhj?=
 =?utf-8?B?bVZ1MDFVOXhFVlptdDlDNlp5elRaUm1zRmdncVl6dk94Wnp3MlBqdDJoTEtF?=
 =?utf-8?B?Y296MWRyTHpUaFVUOEt3SzlVQmh6amtQelZyVjBFNjVxOFNHZXU2Q2E2Rmd4?=
 =?utf-8?B?akxuQ1ZzMzI2ZGxwSzdCUFRuOWk2cGpHaHhnc3hYVWViZm0zazlFRzBDV0t2?=
 =?utf-8?B?bW9EUWZ2cW4wYTJsTDN4YzVlcFBqUDZob1VYL0RWT1lNaml3QUZUSlA5ZGZI?=
 =?utf-8?B?RE15Q3BHMzAxV0hpQUlEa0lRR2YwSUErdmorZElScWVFQlFqM3pycWdKR2V6?=
 =?utf-8?B?b25vQmxwOTJoZyt0QU9hK2tKUGFibWt0UVlOLytsK2l2bm53ZWorNm83RVN0?=
 =?utf-8?B?SkhmVnNwU25NWTdob08zcStpMTB5ZHJmbDcxazlPbXBqYitxeGRtaG16a3Mw?=
 =?utf-8?B?WVFpUjF6dTdEMjczSzBFdzVMQTRVMGlkdlVoTFJ1a0EyR3lLUEg5T2V5ZnNM?=
 =?utf-8?B?UmxJazlodlh6NnpzRkdIZTRhdE1ub09ybHJFV3kzODJvb2MrOW9Ic01WcUR0?=
 =?utf-8?B?N1ZYYzdZQXQ1VkRFekRQMGRmME82b2pZNU1jSFVYMnFLK3BwR05VbTJHMXFG?=
 =?utf-8?B?bnE0MDFIN3dTb2I2Y2VISFpDZGpCUjU4L3RjY09MQWtXUFRxNnR2Tk5Lek1D?=
 =?utf-8?B?dE5YZUxEbitBSTk5aTNTYjE3YUZKU1B1Y1JVZk9nMjJ6bi92ellJeWZQU0kr?=
 =?utf-8?B?bnhJRm9SbTFSK1NTeHJKdy9oWGtqR0EzOGZoMWhFSW42Z3UvZVh6ajF4WlRq?=
 =?utf-8?B?R3JaM2lhREZGRXdGK21ONVVPaDlQVStsK2ttODBlaitrYzk5blVEY1V0OUNG?=
 =?utf-8?B?Rnl2VlBoOVQ2LzdVNTgreHZtcnc1a01RWXd2SDNNQ09sSFlDWnhOMjhxeElz?=
 =?utf-8?B?R1JRWksrMTNFVnBWekFrYWc2VkdhaEVqRjVTaGJTbElPaFppVDE3TzQzWDNF?=
 =?utf-8?B?aVAxSjVabWxXZmdweklBMW91ZGcwcjhPdEN1cVBNK2lSZmFBQWl1NmMyK0Q2?=
 =?utf-8?B?M3J1eTBwbFBrQjY5Vit1ZFhvQmc4akZmMHBhMk9WQ2FvRStOcGtpeVBsa0VT?=
 =?utf-8?B?b2VqVzNsTnV0SHdUQTJLY2doSjk3R09PTWsvL0lnSWZVT3U1NURVdE1Ea3dH?=
 =?utf-8?B?SWI2d1N1NDVKT3ZvQlRDLzVRU3pmazRQd1djalFMOFRiRU9qZnEzeURicEtx?=
 =?utf-8?B?WGRpMFc0c05iVTBDRUsvZXVnT1hNeitPLzQ0T2FjSXljYVpic09Ccmd1TC9F?=
 =?utf-8?B?VU92dW94ZGowZDZteVN4NW9oNEtIOVZiM0krQnk1WGFBQTAxdTBJbG1QRjg2?=
 =?utf-8?B?M2crS0hCL2pqVHlqVlhRN291eTQ3b3d6THNBYXM3WkFDZkZGOTc4eDN3Smp5?=
 =?utf-8?B?UFB4REsrcnU0MFRjN3lEMDlaU0o2R2Mrc2VNbUJaUmlhRG5hc1dBdlBnU3Fq?=
 =?utf-8?B?bXhPZUNYV0pwSlNNY2xnZStSbUxxeUVLem9SOG56UW0yOXpDaGVtRHFuck9L?=
 =?utf-8?B?MU12WHRHbG5RSmp4WEtvUDlFMEczS2RUT3pPSUFVdTZVOW9jVnU0UzR0cWxl?=
 =?utf-8?B?d3dQZkVuOGpLckVuTVpzSzJSZWxucmpKVVZJbGUvSStORmo2TEF6aWVuOTFi?=
 =?utf-8?Q?KHPOwbG/5gPjAzbq5VKhegtN1u3U04NweB9RsaK8+UQR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 637e5874-cd9d-442e-01a0-08de06e3a86e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 03:26:38.8041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x/Hi0rkhYt4o4ygXlLPLTBShyhgmYKwmuyecUjwt2HMXwHfXObKlLMefQP+u7dQrUyGQQ67D2cDkVu5ajO4EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6172
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

On 10/9/25 14:17, Andrew Morton wrote:
> On Wed,  1 Oct 2025 16:56:51 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
> 
>> This patch series introduces support for Transparent Huge Page
>> (THP) migration in zone device-private memory. The implementation enables
>> efficient migration of large folios between system memory and
>> device-private memory
> 
> Lots of chatter for the v6 series, but none for v7.  I hope that's a
> good sign.
> 

I hope so too, I've tried to address the comments in v6.

>>
>> HMM support for large folios, patches are already posted and in
>> mm-unstable.
> 
> Not any more.  Which series was this?

Not a series, but a patch

https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=10b9feee2d0dc81c44f7a9e69e7a894e33f8c4a1

Thanks,
Balbir
