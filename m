Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D6FC5C2CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 10:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAA310E7ED;
	Fri, 14 Nov 2025 09:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RArTWKbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012005.outbound.protection.outlook.com [52.101.43.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36C1610E7ED
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Nov 2025 09:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ir+PcuS8WHK0UUAwNIhXHW76dASojztrbnb5NE/wcqjoP2m/Qr+mWv76Ir8DM8MQQzaiffJf7jgAyJe4TG2YCyv14aMC0H7eb73Qgmpi33rgv1cCbEOfbkfAEixQRMzJHYlQTWyLIen3jK6fykYglgDgk5swXTjrX4P+hTyfjOF2caBj+2gxJlN1Tq5/oJNRV9amq8b2+rxresH7heyJrTEAL9B1I1QgJVh+YJlSXFRxk9Lyb7yjUM2MDfPg6YDGX2setQZSsyv04+LUx2251+zuGnBJ0sZuTn4Memu90/7IiLpD+SOhn4GvVlM9Xju6C3qpdZ6uk/D8FiyZL60xRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKTBawRwJo7Y/2dTB/yx+VqY+J3Xqh2WA0/mA9aL2OY=;
 b=vgio7JJIh8qlcMxTBF2qfpVFRa+Efx9yWcpZ1Fz/RzPHPmWfgSQdg1FLbGMTNVfFZp2LmC/6FI3I7OdxNMJ4ZrAqJ6QvOXTC6lrcFSuqN+BT5Zisd7dzdhS283sTScMFEdMGVMDfqOIRhLU6+GAun0EFSWvaWQu9kiPnuRw4Ix/7N21aOs56+7ceO1WTWsLJO9G/qQ6IVNBaxHhOHnkPuEaCQJDUH9a2cGpQxsXE5FM9v1bEhHKqJD80xTuZsWfyV7L+6RXl51Xo4dt1NWfqqk1NcD0DThd0W8qh/YQMlRspwKvCqwq5VHooBcoRzeM26EJ1BvrH3CJMwzOmYmdqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKTBawRwJo7Y/2dTB/yx+VqY+J3Xqh2WA0/mA9aL2OY=;
 b=RArTWKbrCXt0lQo/YfxjXZhBoZpvolQs2FvMO30MHWMaWY7KnSYvgx4DpMlJfybP6D4tyZuVIA99A0R8ewYNeynVbSoJucD6nwfgn/tHOiGBMLxfD52VgbuYCE5ZmIzBKMtmYMDNQG5xWZTrK3QfHaqrZ2ySxFc9RcWA49Yyu9PUsxuYV1zdEJr6gzJGtbSc/y+bJyer7/heJNQnZpsRR0Mt1v3AL2rIMAhdV/5WutDXCUliDOmyKKERx5m6GuZGwa3MAp+jnyTk5VFTsFmRKC1IXGLRnYbikfGyf9IeRqI7omgfZB23ObFkstLVXZaFEvXMIjjdL60rUfSN5JNtRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY8PR12MB7170.namprd12.prod.outlook.com (2603:10b6:930:5a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Fri, 14 Nov
 2025 09:10:55 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 09:10:55 +0000
Message-ID: <4daec24f-c97e-4c26-819b-e7762b301036@nvidia.com>
Date: Fri, 14 Nov 2025 20:10:48 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/huge_memory.c: introduce folio_split_unmapped
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
References: <20251114012228.2634882-1-balbirs@nvidia.com>
 <5b481d76-638d-46d4-ad98-5508fc8b715e@kernel.org>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <5b481d76-638d-46d4-ad98-5508fc8b715e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::40) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY8PR12MB7170:EE_
X-MS-Office365-Filtering-Correlation-Id: d40272af-ae74-4cdc-dbc2-08de235db7bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VVVLaENwb215bEZJWWcza2FFY1RSQmVRU3VRbzZMZ1pHU3o4cjdsWUs3Yisz?=
 =?utf-8?B?UkI2V0xVMldCWFd4RzUzWXBJTGkrMWUwSDBDbmZlRkh2UTlCZWF0bTkyYXRZ?=
 =?utf-8?B?TEpoNHFiVTVuUGQ4dE13SlNIVnhHeE1jV0M4LzZacTVKRlRxWGdkNUFZZUcr?=
 =?utf-8?B?cUFvZUxIM2p0TXVFUTNWN1hBK0VYRmpldUE5MStqSlN3YTFrdjVTTkgyUUht?=
 =?utf-8?B?QW5QUmNJR3U4ZW83NmVCR2xXN1VNblR4Z3Z5dm5VYXArc05IdCtjWjVBeVF2?=
 =?utf-8?B?YVczb1dEWU5IcVphSk9wMEY2QjgrQksvUzVORWtvKytoaHcyQXkxMlBqNzhn?=
 =?utf-8?B?WVBLVmxFNXVKRzJaZkhrRnRlODhHMzZ3b3dYYllLUkVxWW1nSzZWT3FHUjFE?=
 =?utf-8?B?cEJkRHZ2TTJ3MlJqWHpDWFMybnR1d3NjZUpCYUdKZDExK004Qml1aGtuOVFp?=
 =?utf-8?B?YUFKQzdQejlRWVFCU0x4aDRJRTJwTm9hZTI3ZzloMXIvZE1yTXN5WnFQREs1?=
 =?utf-8?B?b01TSndPWXRjVkprMVBCT2dSNksySTlsZW12WFJwb1d4UDZKWVdaeG9YZldm?=
 =?utf-8?B?d05DTXJzVHdiU1Uzcnd3cGdFbTB1SDc5RnNsOGgvRmFhMDRXckpmMm54T1ZJ?=
 =?utf-8?B?NU5rZVE1c1UvVm5PYlU0UzFheFdSRTZmVzZkNmhPemV6WUdvT0dyQ3dwVms4?=
 =?utf-8?B?SDJFQUN3THJFeVdaYStFN09QOFZnQjk5WHdOY0JTeEdMNnBaVDhNejAxdmhJ?=
 =?utf-8?B?eE5BV3FTZ0JwYjhZSXVtVlgreUVidVczWDRiV0dIckVIYjY4b3MzcHkyMGNt?=
 =?utf-8?B?SE94LytyQjNodFV3dnZacFkwQlM4VHVxNzM1NXlTSEdWRHZjQjg3dWpENzFV?=
 =?utf-8?B?ckswTk92UkxHSTFzcllqeFViQU0raXphZ3lsbEw0K1ZQTHlzMzlENFQzRWRj?=
 =?utf-8?B?ZXZNcmYvV0JEMmNNWlZ3ZmhJQnEzb0o2MCs4Qnk3VldyU1dNTW04WjB4OURm?=
 =?utf-8?B?NC8xZEZmNGdtR1o5YmNMUlRZNEp5RW53cUdIQzc5RUJTZnZIZVZDckJFL3Fl?=
 =?utf-8?B?YkZEaCsxamZjYU5KcCtYZk1uVmMzNnJIUENncks0b0NsQmtYYzhhc2h0MXRY?=
 =?utf-8?B?OWZRbjNMZHdzTlFqOVZNTHZmQ3J6MFFJaGZzRnVCalhYSlBpWUNrcGoyRmpE?=
 =?utf-8?B?bDJTL1ROUTdvcW5qK3NyazVYc0VtdVh0b1h2Z2JBMUsxMnFHeFdqb3FFVXF6?=
 =?utf-8?B?dGp4bXpyUEVVMjRFcW81ZHBKNzVIb3FTR0lEdG04T2FGZkxiL2lRckxTc0hz?=
 =?utf-8?B?VWlqb3pjOXd4WFVUbG43dlAvRDErN0RhaGE1L05oNlpURE1oaElWMU9DVDBy?=
 =?utf-8?B?TnNFVnBpQ3luNnBnTUhpTEUvWGVldkp5SE5ZMGVBS3NnUjNabmZpUVEvNGYv?=
 =?utf-8?B?azJ0M2R6V0huU3VIamtKNzMwYXhxVnAxVFU2WTF3U1BrOFpMVTN5N0JtSHow?=
 =?utf-8?B?eVNTL3VEY1lEamxHQWFWS05tMWEyWXJpbWVRdGYxbDVUUHQ5SHBQWXNYUk9Y?=
 =?utf-8?B?SjBBM0luNnA2dXUwaElwcVNESzRyWkd5OGVjb2pta3hwOHFOMFZJUzFLbTFO?=
 =?utf-8?B?WnUraVM1TUpIWjBwS1d6ZHFmaFhXN1BQNXRoMTk5bmNFU2ErQjlvZUNYVnVj?=
 =?utf-8?B?VlZEN0VyZlFRQ1hISnJQWkFZby9va2dlQVJFUWdxZnc3RGdYNWU0SElrUk9J?=
 =?utf-8?B?S1RMM2FXK1A5VnFQdms0N0tKNTB3K2tYTDRSSUt0dW5qMGNPckJ2YnpSV29a?=
 =?utf-8?B?VzY5RFRybWt0bHc0ODliTXZtNi9QbGhLd1VkMG1SVVIvemdUM0dReTErVjJ2?=
 =?utf-8?B?VWNMOTJoWnFCU2t6MENJNDZOZE5adUU0QVBGbmlJY1pNZkppWVZlV0lEVUUx?=
 =?utf-8?Q?yjT8vSARDCN0Kfatum7A3q++l868IW9I?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1pxV3lTeEUrKzdVQ3o4MFlwTTRkL0l0NnVLMklrcURKRUpncXYzYzhJd2xl?=
 =?utf-8?B?R2p0SkRWNHpTd2hlcEloRVBzRTl3Qkx6VDVaWUQ3YUpxaExIMStEOUsycmFE?=
 =?utf-8?B?S2RQNEpwbGNQejgzem53TUlDYTFHaFFLMHkzaUdselFUcDdvT0xra1RFbXpn?=
 =?utf-8?B?YnRLK3hYbmE1TWJpWGVyeFpBcXNlelNQM01XSkNvMzluWm9GTkdzM0hjTHIw?=
 =?utf-8?B?NlpwaTg4NExUOW9NS1BCSm5WRDk2cEVabndGemdReWRRMzdYRnY2Z3ZPVjVY?=
 =?utf-8?B?ditSL0NJeEpycjJWUHFuczNIV3h3MTUwc2RVSHN5cmhpbGEyQzdLUFpRaVNl?=
 =?utf-8?B?Uk5rRUhkTGtXRXRmclNvd3k0bDBXdkdXQjVlbTBtclVtQUoyNjYrb0tIRHUy?=
 =?utf-8?B?VGR3b2dHRE1HcENvRUxVTHR5MVlmMVhmTkx5Q2JkU2xPQWhsbXM0RGRIMDRL?=
 =?utf-8?B?NXlFbDJGeGZZRmY0VXBUaGhQcXlhQXdIM0tEaVVGVFZLM2JiZ3loSVdhaTlh?=
 =?utf-8?B?MWt4TGZ1YldWeU5UaVZqNUw2dlQ0bWptVldRd1VnYzk4OVJrNDZ4UVBKQ0VL?=
 =?utf-8?B?ZmwyOVAzOUF3bjJjNTFvSWFlaEExU0FIY29MOUtnTitpMmVGVFNzMGFEdmRT?=
 =?utf-8?B?TlVhNk1DczVVTkxRWUFPS0tUckF2YUhCY1c3amh1MEE5WkhMQzNSTXFJZTVZ?=
 =?utf-8?B?YjRXNnNVT2VyZzFDUXM2b01Ia09VWlcza1cyRUREZXY5eWsvZCtxU0o3NnVk?=
 =?utf-8?B?blRpNlY1ajVib3hNY0JhSnp1b2RKdW96TWxNK3NTelM1ZUwwMUZhYUcvRmFx?=
 =?utf-8?B?SWdIWEx6djJuVVVjL3N0aHdFNUFFMWUzWTZUNGtTTXlxTXVYVnRzRlJSWTMy?=
 =?utf-8?B?endCNlIxQVNLd1NZY2xPbHRETFBkVlhicGx4OFJrNWpLMEV3RHhYNjVIR2Rs?=
 =?utf-8?B?V2dQc1lLMFc3cEYxNHpBc2xWWnI2bVNPc0lCMkgzeWJENmxBak11Tkt5RUZI?=
 =?utf-8?B?enI0Q2xDa0FkaUREcDNjc3FGMjh1ZVBuOGRrRTRDZENocXlWMmVMMjNqZTZQ?=
 =?utf-8?B?bmZoOFdIMnhQODNNaXdGblhjTnRVRXI4am1zZnBob2RJWHZNRXhaa0EvdFB4?=
 =?utf-8?B?WDdBQmgwTDZsRFdsTVZ6cHRwWFJrMDZreUxDc29UWFMxVnJET0QzOEFZZHha?=
 =?utf-8?B?NlJQWWZHb05GejB1V2NrelVKelY3YmRSUWNEdzZ6blhUSGpFRVJZR1ZCdldk?=
 =?utf-8?B?Rk82Ukd0aG5rbHlWbkJEWXZETWttV0Y3ZFRVUzBsRTFDQXZPVmJLcmFIV3JR?=
 =?utf-8?B?NGVrc1h4L3dXQkwxOXlxMis2U1hLZGRFa1ZDbkxEbk1QNTkzMXhUTFQxY0Nx?=
 =?utf-8?B?RlFPa1hHSVgxeGhVTCtLNmZoRXBPYnFkWEpCWkprYitucFF2emxObU5UUVB5?=
 =?utf-8?B?MS9JWU9DVFovZjRRMFhmVHoxSm11SzhHV0pPb01XWW91NkVXcHR4MkdXMVY3?=
 =?utf-8?B?TjdIdXZyMk9BcE9PNFVVTjR4ZXBMazZoTTN5OEtPQkdxeWQ3bjBpaDc0aEVt?=
 =?utf-8?B?L1hRTTY0eTFPekRaYWFDNkc3aTJoU2FoSG5mVmtpVG4wMVJjZmVLNllHVVpN?=
 =?utf-8?B?ZVZxTUs4YTN6aWpBenlhbWFlN2xPQ0xnYWxOMWV3VTRGRnZSbGE4S0NQRGlm?=
 =?utf-8?B?S3ZEdzZhVjErM3BOWEtiYkwrZFQ0OE9pMTdUY0tvQkdXS25PTTlFMy9xczVN?=
 =?utf-8?B?cGc3YVU4NytLUVZLdWI1eGNrMlA1Tkt2b3NNSk9QajBWRUtEZlZQd2o2Und2?=
 =?utf-8?B?aWplMjF5eUdTZ1VxWk1uUFhQZ2dYYWl5VklGVXo0Tlh2ekYxZFI1Y2ZSeGNX?=
 =?utf-8?B?SEd6czFqMUJSVTB4T09GQTdIbEJGUHhLZjVkbHBxM2s2cWpQN2lBM3NCUFJT?=
 =?utf-8?B?OHpkOTV4YUZOU0kzRVR2akhPcUZONEJaT2R6alhHVEJSMFRGNGVyenp3dUN5?=
 =?utf-8?B?UmFMNHE4c1dldUJkWHFTaFQvV0lZNFVseUtWS0U0V1RhMHZ1bTY1SWNNUi9B?=
 =?utf-8?B?MDR2MjMyWDVwclVJbUcvMmh4NVgranBlTWRRZ1ZpRlhQWXFrK255WkFLZkJS?=
 =?utf-8?B?WEdEeUFxQy9Kb1VSMExUMFU4Q3BuZTBEOXM5YS80TlZocmVhY1M1VFNOaXln?=
 =?utf-8?Q?ijM7EC0X9SVKNVoYNYjnr/8ITdXPopL7lQ0R69SNI21h?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d40272af-ae74-4cdc-dbc2-08de235db7bc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 09:10:55.6169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rHQY/kXHDF6LtQ90nXSfVqIxfnkfjdvfwP93/K4W3hk40JPEmfvYB/AVvJfsLuP7tRDuSAdTD8C5U8eodowH6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7170
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

On 11/14/25 19:36, David Hildenbrand (Red Hat) wrote:
> On 14.11.25 02:22, Balbir Singh wrote:
>> Unmapped was added as a parameter to __folio_split() and related
>> call sites to support splitting of folios already in the midst
>> of a migration. This special case arose for device private folio
>> migration since during migration there could be a disconnect between
>> source and destination on the folio size.
> 
> Didn't I already comment that the subject should start with "mm/huge_memory: introduce ..." ?
> 

Yeah.. the .c in the prefix is not desirable, I missed that in the subject line

> Yes I did: https://lore.kernel.org/all/048134fd-6a3d-4a6c-a2eb-9a9911c3b35f@kernel.org/
> 
> You know, I'm a busy man, can you *please*
> 
> * take better care of addressing all previous comments?
> * wait more than 12 h after asking a question before you resend?
> 

I think addressed most of it, I missed the subject line, but in general addressed

1. Using folio_split_ as the prefix to split functions, the main function is called folio_split_unmapped and the helper name was suggested by Zi to be __folio_freeze_and_split_unmapped() and it sounded better than what I had __folio_split_unmapped() or even __folio_split_freeze_unmapped()
2. Got rid of _to_order() as the function suffix

Do you have any more outstanding comments that I missed?

Thanks for the review!
Balbir


