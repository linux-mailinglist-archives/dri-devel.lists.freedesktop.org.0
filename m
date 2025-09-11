Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E52B532B8
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 14:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D3510EB18;
	Thu, 11 Sep 2025 12:49:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NzShJT34";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2056.outbound.protection.outlook.com [40.107.223.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB7510EB18
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 12:49:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ifoiDIbw+IhUXhkMTDfcKf2VsbbOI/t20C5NR06egPaEG//EwN+tMdO0l4uBZbei9lrH26y1D0sQbVhB08fjMjUCxRNJ1PzlTg+Q+HOwrcljELNNcP5AkwEf/HJwVSaohgtBMgrJSH5o3PJKLhXDKHDY6Im6Lp42uCBVmDHPmnjY0+Eku5kMLB6U+QDdyEN1fBBjSDF4xmpXRHqLwhAFIXIlKVQQqwmLz2lZfV0CdD4NL4qxb1k8e7Qq8CjCxkSWfb+aOyCb0bS7tH44tuuni7yPZFQ/KNExlUznuvErLeFs5oD09sOsc7s99NLvZDDu5oEY8vuuPDLmubbQHE5/6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIfxXfVO35vmZzZjOosdGVDvKLNmO+sgG5bf12Uyqes=;
 b=qn1JlpwOfkLV7chq3iDQYEYmMaj3Rk1FNv+Fhv4EyVWw0jCZO27zgCzGKOw6hrW8n5fyGzT5BA/mdvzc/MmevUA2G2GzyhepudoGzdyKpWSOpc7D8WpCXlA1S+kCZnWrhGIuMNImE1ISjyLkJ7/X8XlD5sepN452uuuz+X/ig7HifwgnWvZ4+y7qpRPKVhqiqltbkciehywoQudYm1WoiKOrD0jT/SZuK+5j5cE6FyO6F7LVJw3it9GttiV9EOR7XA0ziSpLKRqu9DC2vljH1OkrPPEiZ3nYj1yb1HVxCD47SUiLa1gAZm8+CzU0snpLIGsWmVhTLkD2LC18SPmwiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIfxXfVO35vmZzZjOosdGVDvKLNmO+sgG5bf12Uyqes=;
 b=NzShJT34hmIzXEjSEkJlTdO1S6hDVLbskTvgRjY6EtkWRZJuBtYu5Py+DKOw4yuClI57yFIoekMwg/tdXjpMUa/Tw/lxt4JNWjdxDc24D16uc+HN9wpBO3RAE/L76Rwou2h2AQriTn0hynKluzafJk1w4kikLFhZ1iry9CNDe3kQ28cdUFvzagmBtaLaRWbjr4ErNuRiGtweCeP4hf66z2367QMa/KHYankJNtKB6cxbfWakA1zm0KgOl8SDq6ApFWx9kkRH0INSdPPtOXnt8agVfazuSRzdmPCtXB9Y/JPuUdBRXANmNRAVybgI6dYQe5t7mM/H3S69h3oNWIKLCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by BN5PR12MB9464.namprd12.prod.outlook.com (2603:10b6:408:2ab::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:49:51 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:49:51 +0000
Message-ID: <f98d3149-9cc1-4211-af8f-e49547134b8c@nvidia.com>
Date: Thu, 11 Sep 2025 22:49:44 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 01/15] mm/zone_device: support large zone device private
 folios
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: damon@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
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
References: <20250908000448.180088-1-balbirs@nvidia.com>
 <20250908000448.180088-2-balbirs@nvidia.com>
 <8c5267ec-cc85-4eff-b890-eb705472e2b2@redhat.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <8c5267ec-cc85-4eff-b890-eb705472e2b2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::8) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|BN5PR12MB9464:EE_
X-MS-Office365-Filtering-Correlation-Id: a5b66118-fd53-413b-a0e2-08ddf131b2f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1FydkgvT0k2SHkrNHN4RUwyaTh3cUU4RDVLMWZRSE9QWEIyRFdsejZDTm9R?=
 =?utf-8?B?ZkVkYlhnVHJsay95N1hycFpaTWU0RkZBalpDREtNK3h3K2pMUThBa3B5S09m?=
 =?utf-8?B?c3JkMGdMYkM0d1RrS2s2UlBFOE5PVVQ2REdBejIxdExrWGJNVG0yQXJma1cv?=
 =?utf-8?B?RzZiTHZTNDFZUG1pbUlWSjFYU2RMQ0pmcUJ4RC96VytVUnpyQ3JLOVZsOEdW?=
 =?utf-8?B?bWxkcFVIcUVxTmxqaDUvc3krclhHVWhFNjJvZWlxVGJCVDFJdFVmdkxjQkRs?=
 =?utf-8?B?MnJPWWh0L2dvOXMxaEVTYmlxOGtyTWJXZ1NLczBNNE1iY1ZlOGNHczIvNFpm?=
 =?utf-8?B?bFNLWm5hcEJSWnNScmJ6UTFUVDYxcHAzbEpCUUdydTd2Y2VLRHJPL25rRmdO?=
 =?utf-8?B?dTNZbUNLQzhDTG1BTldtZ2tWTTJjaFhQMDRkanNBdzZXeUxDSnByMGpZYzR6?=
 =?utf-8?B?WDdTOExqVVZiZjg1RFM4ZmdOTlpRby9jcENqT3c4WkRKb0N5SCtpZW04YmFX?=
 =?utf-8?B?WitWaFlVMnJHNm9QY0U0TjFjek5DNXU3QVFWRHIyZHZNTU41TStTMnpsRDAw?=
 =?utf-8?B?bGMwcUJRN3hlZ1V3VmpXQ2F2Nit1ZVdZMndLMUhZNGQ0cmpvT3J0c2lLVmwz?=
 =?utf-8?B?N3o1aUc0dWtMeHptSDlmQUgvRkc1RERaNmxKRllDaVhkL09qS2RRcnpndmlW?=
 =?utf-8?B?K1BOTVdQd2lINUhOcUhabEhaZG5pdWUvL2RoY0FwZ1FybGQzdFROYVlmTHh4?=
 =?utf-8?B?WGNxM1RxS0dHeFR5c2doUGJPcXFCOWRmYzJkWHFoRis2S2hnbmNtdEZGTEhX?=
 =?utf-8?B?cDA0ZjJLVE1CeGZvMjJQeVRYcGkvN205bFk2RWdhekpNakloOWVRMjVZK0t4?=
 =?utf-8?B?TGMxTlV3a2VZdmRBNlkyb0ErU3Rla3BvZGdGdUI4NmVmTXR4cEx1L2Fucm8x?=
 =?utf-8?B?Q0l3UHN1MWgvd2JaZ29CVlBSZEVoS0RiRkVzaHNHTXpGeFVMSVIwczI3WGV0?=
 =?utf-8?B?dGI2NlVESktKNFFXOTJHQTlRK1FZVVZIY0I0SGpVNWExRHFieEt2b3pqTkMr?=
 =?utf-8?B?OUIrY0NjK0xjSmVRMG5KV24vQUxwWnFLcDVtR3lQempDV0c4K1hSWUNQRjU3?=
 =?utf-8?B?YU93c2NRVFZSak8zQXNHaG1VQ0ozUSs4ajFkTlBsM1cvZ0RsRTFJTnNWQVVm?=
 =?utf-8?B?aUFhNmhiNmJYaEllS0JmVC8vWHZUcXdkbXZpcGxheVllc0s1SVU2bFMrS0to?=
 =?utf-8?B?OTJFbk1kVHVJUlhrSnVSOFE0R0tmbDZ3NlhETys2RTNxTnNWcXRzU3VwTUtp?=
 =?utf-8?B?RHBSUFFpL0FjWjQwMjJ0em92NjRLcWpSNHRBU2JmS1hvbVdpNnAvT0VRb2V3?=
 =?utf-8?B?WGEyN21leDd3bldYUlVUWDlaWlBLa0pqakxIRnJzTTZ6ZzVZaG9hcmZ5ZlN0?=
 =?utf-8?B?V1RQdEdVaFdKaXlhSllBaEFqRlhneEt0ejBWbUk2OWZlNWtEMkQ2RlhOemd3?=
 =?utf-8?B?MFk4cnpQS0dLWVpDTkhoQm9tdjU3R0FXRkpaZGhYNUVlRkdsYi9FSU52bnpB?=
 =?utf-8?B?ZStnVytuVXJ1NFZ2MVZBWXhUOVpGcFdPUTVHZloxRlo0cjJpSVMyV0wwU2Vy?=
 =?utf-8?B?Y1IwaHRBOW92bzdkRzZSRm9wQVdjK21TbUcyeVRRWlN3NHlGd0JiWk1CZGtu?=
 =?utf-8?B?d2lrc2dSVnU5VVZ5YWNmbklEVGF2WHNqSU5la25KVlNhVlBOSU5wcWIxZ0FR?=
 =?utf-8?B?VXVIY0pBRnpvYW94V1FrZlYwVG1CUlJJMktKRXNnYXJqL0x4SlBPZEVFajZ2?=
 =?utf-8?B?djFYSUFTOHgzMWtpSy9oNGR1bGE0TE1ZNlVVSUdEdm4vbkpGTGpqYmFXb3ph?=
 =?utf-8?B?Qm1ZMFVkelZWblZRcEY5RlVwMW1IMEZJTDhmZjF2elVBa3pLSWk4OE1nVzkr?=
 =?utf-8?Q?l3WFkTqokDU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Qm93V0x6M0NhVWhyRXZMTFVrNWpCZXhIWm5ZZGt4NzBlMFVtT3RwVEJGQnpN?=
 =?utf-8?B?ai9zeFErNHU0WTU5bEJzYmdOM2R6RHBuZ051TXFaeWdieEFyb3VBdXFjdlpu?=
 =?utf-8?B?bzM0QUpMNC93OXJOd1VIcHcyaGFJU0FXanN6UGFYVWo3aXZ3NzFLcklPbUtG?=
 =?utf-8?B?b3RmSUJCdUZ0anVJWEgrUU1rVlNKMWVmc1NsbXp0VUUyd0JYOGY4N3BEOEcy?=
 =?utf-8?B?cTVzUFJXZGR3QlZBQ0dvc0ZTdHFMb3JOK085Nk1CVEdoY1BqRm9LYUpFL0Q5?=
 =?utf-8?B?V1hpQzdDN2NvUTdRVnNLbTRnRlB6cEY4azhUMnB0TFZsZm5CYzFiOEZYYW9i?=
 =?utf-8?B?SjJpbW5Rc0pMclZUa3JvaEpxK3BteGlSZWg1ZlVieVh4ZXRYY1kxR2VIckN2?=
 =?utf-8?B?TS9TUzZZWkxRZGlUZHhJcllKVXZLQmtNajRJbm12N3RoT0ZNNjdNMEpOdXd4?=
 =?utf-8?B?TFJhMjVtOXJiK1prUlZnN2VVakYvMm5SemdkamRZaUZVMEY1VVlSMk9CMEY5?=
 =?utf-8?B?d2wzLy85UWhhdG9TblZXTGd4elZyR3ptMGZwbEh2Wk1rMEJKQ2JrYzhYM1Zy?=
 =?utf-8?B?MU85eHRkUU5NKzgyUTZzcmMyK0lNckVWU1NQc1RoUXFQZCswbWd2ZnFnUVV4?=
 =?utf-8?B?cmJGbjV4YXJDaXBpL1Y4V2szclFBMFF6OEhXdTFWdElLYmRHZzUzZ1BKOUxL?=
 =?utf-8?B?NWhVeGJRcnNVT1F2TlkwMnRrY2J6S3YveUxJUHBTcEhPL0tha0Zyb0dTUDJU?=
 =?utf-8?B?M2tKeU5iakVBcENmUk83MzEwMFIvYXl4eTdVeFJtRjdjU0R4WGRPOEdMa2d3?=
 =?utf-8?B?OWdIR3AxTUZENWZ0Z1p5K3lxbEFoSDg2N2ZLcHdKTTBQeWRoRHhTeWUrOEw0?=
 =?utf-8?B?a3o0SHd3L2oxU09qVU40NGdYWWE0TjkxYVZjajNXVGF2dUw1VkEyaHFvOXRo?=
 =?utf-8?B?K3E2QnFITlB3NW9VaGRZVHdVZzZoQXUvMzMyKytpR1ZnY0VaeG5aZ2M2VGJi?=
 =?utf-8?B?TWFIbVFjL281WHlTajZVcmdsQVJKcXdFdlNvcFpNWllpdEJoTlIreUxmVGhn?=
 =?utf-8?B?MTFrTk0rRERWUnNZUnpock55RUEwZkk0NkxjTDZvK2x2MytINDFoaXlQbFJM?=
 =?utf-8?B?SGlyclBxb2M1eEFtRnZveTZIQnNmREZWajNLTnA4dEFmdk5PT2Y4QkpLcElp?=
 =?utf-8?B?cDB0azJ0QXNhd1VwU0ltTlhFVW5RVHVqWThScjN1b21KUTN5QmtvVGVUQzJO?=
 =?utf-8?B?aGRuMjVZMVYyUXp3a0dmMVkzVER5VS8zOEdkbDdjeFlNbXV4bm9yemRTZU9n?=
 =?utf-8?B?ZU5EOGhDZFQ2WmlkaE1CSTlNa2E5RzdlZ0p4ZG14TDZ6YkovSTJFNGw0VVdU?=
 =?utf-8?B?bXpVeE1qSWE3cXkrZmdCRHVaWDNvMjdDT1RKeE1DdGhaNDYxeEY4MUxBOWNH?=
 =?utf-8?B?V1lLSVBiUnFwdk55NXA4UEE3eGlxaGl4OVMvY1pkcXRxMzZ0L3lhc1hBVFFx?=
 =?utf-8?B?K3NHSXlQY3VxMThSc3lRYTU2R0ZjY2pKenllVjZWNzJXYlR5SS9HTkVrSURB?=
 =?utf-8?B?N0ZtcndKQm5MOERoTnF5QnM1NE81eWFjWksrdFgrS2FFQ1dGMWVBS3BHbkx3?=
 =?utf-8?B?d2dxOVJnRy9DbTYvdVNHbGQ0SUlGSXR1dlBaaXNoZXZrZEhiOE5KdnB1TUpU?=
 =?utf-8?B?NFhwTEhtcnJISlc1UEZGQisvaUR2VEZtN1BJRUNSWmxlMEtBSnRnT0pDak9O?=
 =?utf-8?B?Ykd2UG1jZ3oxeDZRUytycHl4bGVyTzlnclVtL05ST3RmSWwvZnI2cDRZTkNU?=
 =?utf-8?B?U21PbGMzQ2ZBRkdNbmFPd2dacGlIVHMxRFJqZ3ROb1ZwbjNsZWtnd1IzUTBt?=
 =?utf-8?B?cHZsdGlrOVQ1SncxMnhXZDB5VmxCdUxaaklscUQxUnlUYzQ4UENJSDdyVjdH?=
 =?utf-8?B?TkYva05rOG1OdGpVaXUxMW9sNTlpdjVHVUxja0lyMnVsWC9vSmp6YWNCU1dZ?=
 =?utf-8?B?NkIzcTNEalZMWmJkUkJYZ0pzMlM3OHpZY3JQLzBEYWhQS1hFMzlaRit5ZmJw?=
 =?utf-8?B?YmZyTmVUeVZaOVF1S3VTU2Jvd1g3NytRekQxLzJ1b1UrMHc4L3ZQa25mWUtN?=
 =?utf-8?B?MDVkbW83WjFyREdRaTB6eDRpdE5Mamd4dGhwa2RNVlMzUTkzbUx0aUlwOHMv?=
 =?utf-8?Q?N3VKjtoxhiHy8AvTUewZm9uzJyY0Ky6PTD23bZ5frLQ6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5b66118-fd53-413b-a0e2-08ddf131b2f2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:49:51.5785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /GI+TrTg+k1alCCFXL8BOJnAh2zxTanfnipzSdDEQgbdFGkFK2XS/uaouR3lEd69LdSXMBjkqAI4HoTDeT9OIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9464
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

On 9/11/25 21:45, David Hildenbrand wrote:
> On 08.09.25 02:04, Balbir Singh wrote:
>> Add routines to support allocation of large order zone device folios
>> and helper functions for zone device folios, to check if a folio is
>> device private and helpers for setting zone device data.
>>
>> When large folios are used, the existing page_free() callback in
>> pgmap is called when the folio is freed, this is true for both
>> PAGE_SIZE and higher order pages.
>>
>> Zone device private large folios do not support deferred split and
>> scan like normal THP folios.
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
> 
> You missed my comments of this patch in v3.
> 

Hi, David

Looks I missed your comments, just checked those were largely about alignment and
integrating the code for DEVICE_COHERENT and DEVICE_PRIVATE cases into similar looking
bits for zone device folio free and code-alignment. I'll take a look and update as needed.

Balbir Singh
