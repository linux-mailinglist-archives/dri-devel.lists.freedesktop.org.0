Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848CFB941F9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 05:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E091410E546;
	Tue, 23 Sep 2025 03:39:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h+7AO0GV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010068.outbound.protection.outlook.com [52.101.46.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF4C10E546
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 03:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UNOeIb1AJIAL6VcsEnOeu4fFrqQbcXJm2gLYJ8tD24hBOejYh12e1tZlVsGJvpRTcrUk/SYY05KTtzBdogg2gAvk/4PZUHRqlRseuo+9H1FyRcN3j5gd9x7+z1DLyyxgBVkYO/SgYx7LW/MSAln7fri3ppAQUDnfxX0kqMD5WFkI6t8MJqCCgwe/3ETTL7+Tc0i2q19/WKXwR+mKPVQhmxBlPaIa3UgS8d18DhXnTq5tkfjeSS9xXZtAOoRr1oC++O9XQ/TmFbH72YuXzYsFn+d4u5mYMwvmGp4uR1FVn9rrH7S3xAm3Rus29XIFlWeSZoX4jpfhmnj9alFHg/GcsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZtbV+dWBE+E8jCU0npcCo8eNvleDde+lkWDLJlPwNY=;
 b=ksxx02OnkiKShw4cZTsjOpdPp6RYO3lpXBWdK3/xgdU9ULEY/p/ttaERnbYj+eALGcDCFr2I7r2yTprppUeDJv58O/+KIYFEaksYy1D9UTqY9tcw2KMSjgf4k6Xq5NzTPHDvoeQblHbiYD/hyl209S4Rq/Fq1tY7PuDwMIPFMPbpzP6tdjql1wsOZLMa7noh4l/8SRC9tpO/tDaSWP00JeEGypc3QiwxBLnDkSiF++OK10xjKuxKVkIbFeaiEPw7RpYtwlOjJv+hyYXyhulysM8DiHmICnzwBcffQ6HFsmYXGMWiVY2Usmtq9m2TYIxmyQ72azmkRzZmHNlrayCnmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZtbV+dWBE+E8jCU0npcCo8eNvleDde+lkWDLJlPwNY=;
 b=h+7AO0GVJTBpYLnWC4HbPfFYnLqVOTGdyXk1uPbsQru66/dO7F4nvB5GFNAEgemUfVLOtA8pDwnRUUALvrdwBZVYqCw3riBrebGedhpR1L8Sj7oVhnR6HWDmNyBuNCBG2gZgAa6g7tX2T0U2uk7cTc7LbDoqTSRAStVC1hc5d4ULylJws0ZPPc1qSjVGNtE2t8w4yDwy4x5LZbN6fhYXXdc8vM/cvcl38Mm3fspu4IkrfvQWJfDS5JiSi/majJ0bDDjnaXOMs5zZVTIN7zlNIVTHwbxLcvVUiXXgEn2GXHa3aJgTIAFwKL8tY/H//uYZGJqtKVpsTEGIOGZTiZPobg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by SJ0PR12MB6781.namprd12.prod.outlook.com (2603:10b6:a03:44b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Tue, 23 Sep
 2025 03:39:16 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 03:39:16 +0000
Message-ID: <1b896491-d9c0-4c8d-bc60-47579c773dce@nvidia.com>
Date: Tue, 23 Sep 2025 13:39:07 +1000
User-Agent: Mozilla Thunderbird
Subject: Re: [v6 03/15] mm/rmap: extend rmap and migration support
 device-private entries
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, damon@lists.linux.dev,
 dri-devel@lists.freedesktop.org, SeongJae Park <sj@kernel.org>,
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
 <20250916122128.2098535-4-balbirs@nvidia.com>
 <D4440A30-118E-40DF-99BD-6F58B708E597@nvidia.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <D4440A30-118E-40DF-99BD-6F58B708E597@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR04CA0011.namprd04.prod.outlook.com
 (2603:10b6:a03:40::24) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|SJ0PR12MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: d6fd97ac-2570-44ff-ebb9-08ddfa52c522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3NybW02TVE4L1NQWkM2WGFxOCtaTW1tWDdkTXZrK0VmTUtJcU9KOC96dGd0?=
 =?utf-8?B?ZEVpWTZDNjhqRUZSclBMUkFaY0ZNd2tkTGxDVVg4OXAyV1BGMHlwZ0YxanlH?=
 =?utf-8?B?SWJ1eGt5dVhFQm5XNlFMaHZFM3E2dkVmOTdKYWRZV2ttdzNkNDc3bEh6dUZp?=
 =?utf-8?B?WTZBV3RjRFVERU91aDdULytMdzd5RVpPSVlaa3NHeFd5b2tad29GRlZkcEVP?=
 =?utf-8?B?UHdWdlF0bDl2by8vM2ZoQXpSNUFwQ0lRSEN4b3JjdHdpWFMrQTVFakFDV0VF?=
 =?utf-8?B?WkVkVTRYN0F1UHlwUDREQ0Ywd2ZvVW5zalNsdlVTQXN3YjMvSVVwK0lLQVJt?=
 =?utf-8?B?RXo2UFNnU3pMSW00VzBJMFMrZHZISXp2RjFacG1pR241MjhOSFBoV3gvemxW?=
 =?utf-8?B?WURGT0pBTDBNMngxNVFYbVdIZFNVR2tBb20rbzlkWlNsWUd5TWwzbHVaRWc4?=
 =?utf-8?B?VGxzTnBpa1MzYWVwWVFUbW9zeGRlS2VJczRsNXRjTGE2VlVhTGtLYTczaU4r?=
 =?utf-8?B?b3pQRHpsR0RuQ2E4dWE1N3B0K1ZKSG56eTBCZmtURU1UOXN3SFVkYVpRekQy?=
 =?utf-8?B?VS9MVEhObHAvY2JuZ2o2SE83M3dSc2hjM1RRYnZGV3orc0JLQVNpc2F5MWhS?=
 =?utf-8?B?MzhIajc1RzNkNHE1SjhlTVJ1WkV1K3hZclFhcHZRcGRlVEpKeTNGbTg4dWdk?=
 =?utf-8?B?R0R3dTcrTmVHOEtQdloyUjRySzdrSjJQUWh4RTNPcjFEeisrZEYwQ3ZlRFht?=
 =?utf-8?B?K3VRNVBLUFZxNlFoeW40ZERLR1J4cklJc1dZM092aHY0Ynk1aU9sU09sU2t2?=
 =?utf-8?B?S01NR2NPTnBaM2pKbHNLckFscFNLUXpjU3pJbllaT0dYR2tMSjJBSUIxTFVw?=
 =?utf-8?B?aWw0aGRYRWJTZmlyaEZiaWZIQlVyWTMxRjNZWUU2L0FqOFVUTGQrQWJLTnEr?=
 =?utf-8?B?MnJWQVh0NlhYQmlweEFxQ1A3cFhvN1M1OHc3NytzdzdlOHJwaG41T2xiSjlH?=
 =?utf-8?B?dE9FY2RQRGxZb3BWRElVRTBWU3U2RjU0Qlp0S0ZLMWlVTWc2cWhWWUlVMzJt?=
 =?utf-8?B?OG9WdW0zUDRINkExVitTMHhjQmhQTGVQaUcwK2FwQktXODlZQnBZRVVaZTAx?=
 =?utf-8?B?R0tUS1Q2eE1MV25waU91NWdpZmhoRUVYUDBYcmJsdVo2Ykl3WS9LdjJ4MVBx?=
 =?utf-8?B?QTdnU1krUU01NkUrNXFPaGs0TmdYN2pzTXE0UFIxUHlJMmU3QVN4WG9OTDkx?=
 =?utf-8?B?VS9oai9XeXhqZ3F5bjBYSnhGdDhrdmIzNVhYR2hDYjJTckkxbllkcDhRWFpV?=
 =?utf-8?B?MWZtOHdBQXlGRVhKZGJaVnFUTlZReHhpSHBvV2llY0FhNUZibndLMnJtVXQv?=
 =?utf-8?B?SWFRbHBwMk1kell5ZGNUd2pKV3BBR0s3dm4vY1dmRUl0TkNIVm1oMFp3YmRL?=
 =?utf-8?B?UkRqSkZDR3hMMFVwbWZJbEUwT0NXS0lDcXpqNi9ybTEwU1BwN3BZMjl6ci9F?=
 =?utf-8?B?bW1lbzZPaGxDeEUwaE14UFdUdXlhbkUxM2d1eHYrRHZOZStIQkpjWWdwQ2ZP?=
 =?utf-8?B?RGZKQXVBMExycDZUTDJLaEtJa0xWV2dKanByMkJrck9Jd0ZNYVZHaTJsZjZW?=
 =?utf-8?B?ZmFDU1p1bFBLVG9TcnhqWnpSNnBnQUxPdTB5Z08zeGRWdHFNR2xGTGZKTEJq?=
 =?utf-8?B?aWluVmo4VnFvckppK0phV1BEL1M3UWowaGgyVGJuYjJVY3l0OVl5a1UwZGlK?=
 =?utf-8?B?RkdxcUFsamd0TzFjLytzd0o3cVVjTmcwdWw3bkhVMWJhQXp1OHRndXRMNmVM?=
 =?utf-8?B?US83OWF4eWQyT09VTWIrK0t2Q2J3Skh3bUJoRkpCaEVLdGdlM1NJZkorUGxM?=
 =?utf-8?B?ZFJNYUNnSU9welMyOVI0cDBkL2poM214TGxMQkU5c2RTVzZLSUNrRW12bUNm?=
 =?utf-8?Q?71C/robT+IU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OWE1L3VzRHo0R1Y2OTNLMjNRM1V4TThTR3phaUg1Z0xFdG5xWUY4Yjl6Q3pG?=
 =?utf-8?B?VlMxZDhyS1g3ekwvMktYNGhQTGdvakpyUm9LL2lZcVVLVkdpSDhGQURtVGlO?=
 =?utf-8?B?K3dJNHA0UGpiVjdvanI4NHNhTURlaHZ2NDJBVnhZUmNCbnVmelRmcEdOTkQx?=
 =?utf-8?B?S2psSzJkMWMrK1pUOEZKREVjcUZPSXI3N0lKR0Y1Z00wRmRudkZoQ3ZiR1Ba?=
 =?utf-8?B?OGtiQmprdG5WSy9EQ3JvWjI1bUgrSVBvL0xSNjJVTmRvOEpjejRTNytXM3RW?=
 =?utf-8?B?S1BxWnVqMmUyeXVyRVpwZ3JzVWxxRUxaamlvZzhiczBWY0JwRmNCZnVxYWVx?=
 =?utf-8?B?ekZ1UVNSS3J0RDBwRzZjZWJacGxaY0xheWxsK2o5cUR0YUkxYlEwcHF3TTVw?=
 =?utf-8?B?NVUzNDFtTkhzRmdPais3UGZnMzAva3h2V1V6SzlnMEtacWozUlNWMlJZcHlS?=
 =?utf-8?B?VGpoTnBGdkFseFdkV0NLcEpvLzhFd1NXMDJqZlZhTVhpaHh1NzNiQUNxL3ph?=
 =?utf-8?B?bm4yYXFueGRZeUtQVDRIZkx5WmlaOHI0N28vbHRnR0hXY1EyNEdLSDE4cVZI?=
 =?utf-8?B?QjN2QVBSdmlBRDhIcDJ1VEk1UEEreHhBMXBvVDdNMkRVYndHYU1rZTc4K0hP?=
 =?utf-8?B?QWFXdFozSTlweC9zT2tqdnN0YVJYNFUyZ2dmY08zc1BWZFg4ZWQwdDFjbGN4?=
 =?utf-8?B?QjduMmVrUUFxY3RGZGFHRmdmYWVWT1BWTjlOeEJSZG5hUDM3d3VUeW9hS1hF?=
 =?utf-8?B?TFVJa0xNMDVZWkZ4ZHRkeWxUQ0trZ2tub0JyZ21hQTRKa2hTMVBZTHNXWnVl?=
 =?utf-8?B?OFFQZDFBL0FHS0p6aVFtZTdvRVEvbGFWMStUQ0szS0JSblhrbUd2M1dtNmQ1?=
 =?utf-8?B?SkpZTEFBRm5ab0V3ZHhQSVJBaE9Ja2dRaFUyRmc5MUZVVEFSMEp0U09BemRB?=
 =?utf-8?B?Uld4SGNNekJsZm93WllrdXV3d2hZZzhYL0J4aEowWmlyWmpPazlWRUZXeVRZ?=
 =?utf-8?B?ZzRQY0NqOVJ4SlJIc1orTUFWd2tJZkY5RjF3VGU0QVB6RVk1M29mVlYrNzJF?=
 =?utf-8?B?TnBJajZmbjB1Q2V1aVluMld1UEZrTi9GVHdKKzZtRXdvU2RQeHpEdUFnLzJj?=
 =?utf-8?B?Yk5xaTR4NWFNa0F1akFhVjBNYmFhUFJwajVubUZXMHdoNmE1SUNkaGpQUnFT?=
 =?utf-8?B?SjZtM1pFUFZvOERLV1A4ekxoMXBWM2JpWEI0dlNtQkRhWmNJOUxRYm96Wmx4?=
 =?utf-8?B?eTV3U2gxWkVFa2RIUDRTRnlET3gvUWp1UVIxeDdFWmovRlp3cnl5NUJmZUZo?=
 =?utf-8?B?Z01ZaVhYOEVxQ3BuNHdJNVhhQmRuc2EwdjFCa0lwNHM0Z09GMkt2U01YQk4v?=
 =?utf-8?B?S1JBYVowRGxHZjlxdG5LeEd1QWJSMFNTTWpxRW41UmtLQkRRM3RGR3NjenpD?=
 =?utf-8?B?RlYyRjBGU3h2M0pPb2VJOWM0b3dYcEtTS1l3OWs1TFZBYjFUS3AxYTJwL2Nr?=
 =?utf-8?B?UXRiaWlIaXB5YXd5QUwxL3N3a05pZlF1UXdKSFk4bW95OTYrSlYybEZzZkRn?=
 =?utf-8?B?aGRvZkRKYnJpbjZoMlFpRnQ3OXo5cmZNZFF6ZzErZS9Cd1NYaXF3dUhTMjRu?=
 =?utf-8?B?MkVrOXJkaStJWWpiUThUM29SR1NGaXR3djZNZzNBRzRiNzJEaExWVHJ3OEpz?=
 =?utf-8?B?eGNsMjQ3REJESjU0QmhXR3NXV240OWRCNFhjZ2xqMGxsRkZEc09sRkVZc1dH?=
 =?utf-8?B?N092aHJsK0J0ekFMNkx3VGlsLzdBUC8ydGRXMTZGT2JHRnAyc1hxSklwSDVQ?=
 =?utf-8?B?ZzdhTUxBZlVLNFhYUFdKTGlmRWNmYmczekJkR0Vxekx0SjlyL3BNK1FuQjZD?=
 =?utf-8?B?MTV0UlErUldlZ1UwMkhPL212Yk5LMWdSYXpJL0sxakUyU1h0Rk1PdWlDazln?=
 =?utf-8?B?MFlKZ1JsMUtMNzllbWpPcjBQamM4aSs5ZExjMm1PU3B6MnNTVy8xZGRLU3Bk?=
 =?utf-8?B?R1RMQkZCTVFsVXNRdGkrOE5TMVJPK1c0TCtBRWJ6TFZVOTlkaVdOMHFIeE9z?=
 =?utf-8?B?SmNFQ0ZyTFBCUmFPOXN0VWtscTNLaWh2RFVQc0lPdFhZZTRVaEkwdDhMcVBE?=
 =?utf-8?B?dWlOUGx6QUJkUnNQRExZMER2ekR2TEtZM1J0MFZXN3BzTzdhRUVHU3owenh1?=
 =?utf-8?Q?B0NG8AQaFXL82AKIyRkXfzdW8gtb9SCQ7L3j5yG2egso?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6fd97ac-2570-44ff-ebb9-08ddfa52c522
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 03:39:16.0900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2qE7mzD2f4c8nHWzKGzwXpVtA0nQpwdlW8SC0slH/IwAy1gcH//N2L2PWEr3DDUt+pbBqAmvUbVomm3OQ9QGSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6781
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

On 9/23/25 06:13, Zi Yan wrote:
> On 16 Sep 2025, at 8:21, Balbir Singh wrote:
> 
>> Add device-private THP support to reverse mapping infrastructure, enabling
>> proper handling during migration and walk operations.
>>
>> The key changes are:
>> - add_migration_pmd()/remove_migration_pmd(): Handle device-private
>>   entries during folio migration and splitting
>> - page_vma_mapped_walk(): Recognize device-private THP entries during
>>   VMA traversal operations
>>
>> This change supports folio splitting and migration operations on
>> device-private entries.
>>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> Reviewed-by: SeongJae Park <sj@kernel.org>
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
>> ---
>>  mm/damon/ops-common.c | 20 +++++++++++++++++---
>>  mm/huge_memory.c      | 16 +++++++++++++++-
>>  mm/page_idle.c        |  7 +++++--
>>  mm/page_vma_mapped.c  |  7 +++++++
>>  mm/rmap.c             | 21 +++++++++++++++++----
>>  5 files changed, 61 insertions(+), 10 deletions(-)
>>
>> diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
>> index 998c5180a603..eda4de553611 100644
>> --- a/mm/damon/ops-common.c
>> +++ b/mm/damon/ops-common.c
>> @@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_struct *vma, unsigned long addr
>>  void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned long addr)
>>  {
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -	struct folio *folio = damon_get_folio(pmd_pfn(pmdp_get(pmd)));
>> +	pmd_t pmdval = pmdp_get(pmd);
>> +	struct folio *folio;
>> +	bool young = false;
>> +	unsigned long pfn;
>> +
>> +	if (likely(pmd_present(pmdval)))
>> +		pfn = pmd_pfn(pmdval);
>> +	else
>> +		pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
>>
>> +	folio = damon_get_folio(pfn);
>>  	if (!folio)
>>  		return;
>>
>> -	if (pmdp_clear_young_notify(vma, addr, pmd))
>> +	if (likely(pmd_present(pmdval)))
>> +		young |= pmdp_clear_young_notify(vma, addr, pmd);
>> +	young |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
> 
> This should be HPAGE_PMD_SIZE (it is guarded in CONFIG_TRANSPARENT_HUGEPAGE,
> so HPAGE_PMD_SIZE will not trigger a build bug like the one below).
> 
>> +	if (young)
>>  		folio_set_young(folio);
>>
>>  	folio_set_idle(folio);
>> @@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio,
>>  				mmu_notifier_test_young(vma->vm_mm, addr);
>>  		} else {
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> -			*accessed = pmd_young(pmdp_get(pvmw.pmd)) ||
>> +			pmd_t pmd = pmdp_get(pvmw.pmd);
>> +
>> +			*accessed = (pmd_present(pmd) && pmd_young(pmd)) ||
>>  				!folio_test_idle(folio) ||
>>  				mmu_notifier_test_young(vma->vm_mm, addr);
>>  #else
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index a5e4c2aef191..78166db72f4d 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -4637,7 +4637,10 @@ int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
>>  		return 0;
>>
>>  	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
>> -	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>> +	if (unlikely(!pmd_present(*pvmw->pmd)))
>> +		pmdval = pmdp_huge_get_and_clear(vma->vm_mm, address, pvmw->pmd);
>> +	else
>> +		pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
>>
>>  	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>>  	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
>> @@ -4687,6 +4690,17 @@ void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
>>  	entry = pmd_to_swp_entry(*pvmw->pmd);
>>  	folio_get(folio);
>>  	pmde = folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
>> +
>> +	if (folio_is_device_private(folio)) {
>> +		if (pmd_write(pmde))
>> +			entry = make_writable_device_private_entry(
>> +							page_to_pfn(new));
>> +		else
>> +			entry = make_readable_device_private_entry(
>> +							page_to_pfn(new));
>> +		pmde = swp_entry_to_pmd(entry);
>> +	}
>> +
>>  	if (pmd_swp_soft_dirty(*pvmw->pmd))
>>  		pmde = pmd_mksoft_dirty(pmde);
>>  	if (is_writable_migration_entry(entry))
>> diff --git a/mm/page_idle.c b/mm/page_idle.c
>> index a82b340dc204..3bf0fbe05cc2 100644
>> --- a/mm/page_idle.c
>> +++ b/mm/page_idle.c
>> @@ -71,8 +71,11 @@ static bool page_idle_clear_pte_refs_one(struct folio *folio,
>>  				referenced |= ptep_test_and_clear_young(vma, addr, pvmw.pte);
>>  			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
>>  		} else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
>> -			if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
>> -				referenced = true;
>> +			pmd_t pmdval = pmdp_get(pvmw.pmd);
>> +
>> +			if (likely(pmd_present(pmdval)))
>> +				referenced |= pmdp_clear_young_notify(vma, addr, pvmw.pmd);
>> +			referenced |= mmu_notifier_clear_young(vma->vm_mm, addr, addr + PAGE_SIZE);
> 
> This should be HPAGE_PMD_SIZE (or PMD_SIZE, since the code is not compiled
> out when CONFIG_TRANSPARENT_HUGEPAGE is not selected and HPAGE_PMD_SIZE
> will cause a build bug when CONFIG_PGTABLE_HAS_HUGE_LEAVES is not selected).

I'll protect it accordingly, thanks!

> 
>>  		} else {
>>  			/* unexpected pmd-mapped page? */
>>  			WARN_ON_ONCE(1);
>> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
>> index e981a1a292d2..159953c590cc 100644
>> --- a/mm/page_vma_mapped.c
>> +++ b/mm/page_vma_mapped.c
>> @@ -277,6 +277,13 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>>  			 * cannot return prematurely, while zap_huge_pmd() has
>>  			 * cleared *pmd but not decremented compound_mapcount().
>>  			 */
>> +			swp_entry_t entry = pmd_to_swp_entry(pmde);
>> +
>> +			if (is_device_private_entry(entry)) {
>> +				pvmw->ptl = pmd_lock(mm, pvmw->pmd);
>> +				return true;
>> +			}
>> +
>>  			if ((pvmw->flags & PVMW_SYNC) &&
>>  			    thp_vma_suitable_order(vma, pvmw->address,
>>  						   PMD_ORDER) &&
>> diff --git a/mm/rmap.c b/mm/rmap.c
>> index 9a2aabfaea6f..080fc4048431 100644
>> --- a/mm/rmap.c
>> +++ b/mm/rmap.c
>> @@ -1063,9 +1063,11 @@ static int page_vma_mkclean_one(struct page_vma_mapped_walk *pvmw)
>>  		} else {
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  			pmd_t *pmd = pvmw->pmd;
>> -			pmd_t entry;
>> +			pmd_t entry = pmdp_get(pmd);
>>
>> -			if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
> 
> It is better to add a similar comment as the one above !pte_present().
> Something like:
> PFN swap PMDs, such as ...
> 
> 

Sure, can do and repeat the comment or just say look at the comments for !pte_present() :)

>> +			if (!pmd_present(entry))
>> +				continue;
>> +			if (!pmd_dirty(entry) && !pmd_write(entry))
>>  				continue;
>>
>>  			flush_cache_range(vma, address,
>> @@ -2330,6 +2332,11 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>  	while (page_vma_mapped_walk(&pvmw)) {
>>  		/* PMD-mapped THP migration entry */
>>  		if (!pvmw.pte) {
>> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> +			unsigned long pfn;
>> +			pmd_t pmdval;
>> +#endif
>> +
> 
> This looks ugly. IIRC, we now can put variable definition in the middle.
> Maybe for this case, these two can be moved to the below ifdef region.
> 

I can't find any examples of mixing declarations and could not find any clear
guidance in the coding style

>>  			if (flags & TTU_SPLIT_HUGE_PMD) {
>>  				split_huge_pmd_locked(vma, pvmw.address,
>>  						      pvmw.pmd, true);
>> @@ -2338,8 +2345,14 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>>  				break;
>>  			}
>>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
>> -			subpage = folio_page(folio,
>> -				pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
>> +			pmdval = pmdp_get(pvmw.pmd);
>> +			if (likely(pmd_present(pmdval)))
>> +				pfn = pmd_pfn(pmdval);
>> +			else
>> +				pfn = swp_offset_pfn(pmd_to_swp_entry(pmdval));
>> +
>> +			subpage = folio_page(folio, pfn - folio_pfn(folio));
>> +
>>  			VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>>  					!folio_test_pmd_mappable(folio), folio);
>>
>> -- 
>> 2.50.1
> 
> Otherwise, LGTM. Acked-by: Zi Yan <ziy@nvidia.com>

Thanks for the review,
Balbir
