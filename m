Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD05B8948B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 13:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C519410E07A;
	Fri, 19 Sep 2025 11:33:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=meta.com header.i=@meta.com header.b="Ji/BJbBI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BD810E07A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 11:33:38 +0000 (UTC)
Received: from pps.filterd (m0109332.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 58J6FuUF2080084; Fri, 19 Sep 2025 04:33:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=s2048-2025-q2;
 bh=bd0LCvQ78gHNrp1Kat68g6fiUZy0wFvY8BWZVXR9DBc=; b=Ji/BJbBIs1nj
 4Jl8D11jlXtof1TSjyXIiXzlof8Y7jR+5pllHh4Ykjf+MjOHGYu+8imJxaDTSeoX
 ozCIkhoweaZQl0Ab7TWz7mN3DR8d8uusSNaYSjEb7uohCLYz6giOhwuUKjtIxZgj
 xnV5SeOupY/ctz+qtomu96VG8GsH7DDqeqqGq15lQ3IVfe0i4w/Hd3VnWeZtWxoR
 Z+fHuC33jFINmKLA3OyJRwGeY4hCTRNeKNTy4WAcxwyOFtOC6kb91x51l62rQBCf
 OBVbiIpHEoYpcIOr7nGwBD0gOSBgU9os+x6p6NJxtQP6eqFWbl3tG8aKPwpmg7j0
 FFm7Ox0sZw==
Received: from bn1pr04cu002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
 by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4991rnhh43-1
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 19 Sep 2025 04:33:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIUA6ee5bEBNfPSvzIgoKWmfQgHA3j9POIH+MsCSnlJQIAQ2TQ1KbXjShI3Wa0dm1GD437fe/0r5izVWZBzTgCfV/vifq4wUTJgWO2gYzun8knOA4tp0V30ZAVRSkrt177Cyt5fSQabk68pC8WCKD2yX6UyuFcNNtl4a066Dg/CNlaXzHekySOxDb4espBACt4gVvP4YIOUB9zbAPegZvHTjy73X1gWgaCI681zls3frHDa5m5jgtb1kFxz1zi63TiABeGVSwSTBdkrmv43T0vx7GF2HdJJCummRJogRneTY+lWqIjWy/APIuE7f1R4zwGyINfkzUD06+9wGDic5UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bd0LCvQ78gHNrp1Kat68g6fiUZy0wFvY8BWZVXR9DBc=;
 b=dBnQ+dU1D8isW3wB8i0tXpobN0TEoMS38tr3xKsyoharN79k6mtv9v3bfNKpO2ADU6Ahu9RnzhSX0w8dq9jx3sGr6HVvaDxqZK1k8gD2u7QIQUGBNEM9EqjtPJY8/uuhHfcuqMAbGLUWwbyP/bABawZmHqsT8/bQQDIiDboTEDMutHGI+lLCDXFF36/+DMl4mCsFX1W2JxufDMos5UVEwg35KtnGpOZdPdUKxTmIKTNBLW++MKHnfDlIxzkow24nMgZwVyM6XbOGqAjzpianE2qj/HVyBZ5n8uPnMxU9N39aR0LhT1acA7xBp1sDytXd7APJ/pSMMvd7vxAicAN+Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=meta.com; dmarc=pass action=none header.from=meta.com;
 dkim=pass header.d=meta.com; arc=none
Received: from LV3PR15MB6455.namprd15.prod.outlook.com (2603:10b6:408:1ad::10)
 by DS0PR15MB6144.namprd15.prod.outlook.com (2603:10b6:8:117::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.17; Fri, 19 Sep
 2025 11:33:17 +0000
Received: from LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e]) by LV3PR15MB6455.namprd15.prod.outlook.com
 ([fe80::8102:bfca:2805:316e%4]) with mapi id 15.20.9137.012; Fri, 19 Sep 2025
 11:33:16 +0000
Message-ID: <21e6367f-7082-4b9e-8562-3d498abb629f@meta.com>
Date: Fri, 19 Sep 2025 07:33:06 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 05/15] mm/migrate_device: handle partially mapped folios
 during collection
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 dri-devel@lists.freedesktop.org, Andrew Morton <akpm@linux-foundation.org>,
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
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
References: <20250918164213.2866702-1-clm@meta.com>
 <5e4af716-e4ed-4c03-9ba9-6242977258d8@nvidia.com>
From: Chris Mason <clm@meta.com>
Content-Language: en-US
In-Reply-To: <5e4af716-e4ed-4c03-9ba9-6242977258d8@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9PR03CA0271.namprd03.prod.outlook.com
 (2603:10b6:408:f5::6) To LV3PR15MB6455.namprd15.prod.outlook.com
 (2603:10b6:408:1ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR15MB6455:EE_|DS0PR15MB6144:EE_
X-MS-Office365-Filtering-Correlation-Id: 269f1ae8-2c5d-4ad6-58e3-08ddf770539c
X-FB-Source: Internal
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25iaVdKdHUxUHBvU04rSHd6Z2xHN0FkSTFSSnlCL1h3TkNJMmFUdWs3emRk?=
 =?utf-8?B?aFgxaVY4cnQ3d0xLdDJuMlNVTm9OcTY1Ykp4L3pjcmxaTTNsQWZkWW9WUWlT?=
 =?utf-8?B?dWM5b2wyR2VKV1RlaWsrQ3VDRHdZNFhuUkxmWmRvVG9GV3R4d0tGaHBNOGVU?=
 =?utf-8?B?OEdteGhDZ09neCsxZDYrVVZrNUZyaFNZZUcvWUoyYjNIUWNoTjNyM1NmUk54?=
 =?utf-8?B?Y1R2bXZISmJVWTRsd0dham50cGhmNkdORTBtQ2pZajBZcmY0OFZwSGVHTnhY?=
 =?utf-8?B?cWtNYnVob1RyK0I1Y0QramNsVHFFa3FuSmlQWW9ZZnRGTU1DL1RNTlpsMWl1?=
 =?utf-8?B?ZEkzOHZpS21hdjcweDhpcDMvNVovMHBoVFpnREh5bTRsQVJvckpvbEhjaVh3?=
 =?utf-8?B?WTZKeDQ1Q29zL3JndWw2VVpOcllYNkVBc0RoTEdQZHR2UStMY1Q0aXVwS1BN?=
 =?utf-8?B?T3FnNEpnVm5KbzB2UXl5cktJU001TFB6NEtwUjNKZnNkeUpzWkpMbkxtQWc3?=
 =?utf-8?B?NENsdDJVVlo0UDVsOC8yVWRMMU1ZcXgyTmYydzNiYWJQU2lKTW1CUHBXMkVF?=
 =?utf-8?B?R21tU3JOWWR5UlhpWEpsUEg2U0hhVW1sc1IrZU9SVkpzd1oydHY4bHVxNHRJ?=
 =?utf-8?B?YTUwaEJrNmhUYVFYN0svdWhidGZKeFovRlBYZVV2OTBvYUtRTWpEUWNsUVk3?=
 =?utf-8?B?L1RiV2ZxUk1BR2MvS1hMQnpsREFkRTgzOUFGOVhqK2NuYTFpYkErdHNJblBq?=
 =?utf-8?B?dkZtdDZ3NnE0UStoSEhrMitDVkNJREtMMW5uNXVaMHo4WlRyTFhGU2VhNFYv?=
 =?utf-8?B?ZVhxOFVacXdJRmJ4TXA1UFFHSDlKc0kzMHE0blRDdVljUDJMMWwzVzdRek5S?=
 =?utf-8?B?UHNJcUpUYnNaWGQ4dG01UVpFZ2pnWEtSUmFwYVlrNW9EdmlhUHAvZ0VTY3Zp?=
 =?utf-8?B?WUk4RUdiTUxSaFE0KzMyM0RrZS9VUVVnejdDU204ZHhvUDVTVmVxNUJ0RzEz?=
 =?utf-8?B?ZUV5bG5MMWVIbkd6UVN5bXlSSXVBNUhLemRTZDV6Lzlubjh3MzcvRDBjcTFC?=
 =?utf-8?B?M0dTbHlqVDZUSEtBc09hRGlrWno3MTRVQ1BhTEE2Y1ptbVZXQ0hUS3pTZldE?=
 =?utf-8?B?V2p1aVYwQlY0UXFydWhWTVliL0pHUzRaQjRQWDhiUW9ISmVrQVFjbElzSW82?=
 =?utf-8?B?UFoydGlIMmlQNzYxdFQvTVcxMDZERXlTTjVIVmdJN1dkRFo1L1lQa1lpRzhQ?=
 =?utf-8?B?SG90ZTBlVXZENTJsaXJWRmNwTXZ4MGUyd3dTd3YvZHFFV2xNRHJHVEVBaTZW?=
 =?utf-8?B?MG5zTHJWTnR6UXVVaDNkbVg2cnlqbGRvZzF2Umo5dVQ2Q2o2dzVweVhnR2Ft?=
 =?utf-8?B?WWp1eUhEaGxyY0ZFS0NHRUhQV25mbjBGcGlFRFBoNmU0WFhFdGdLSE1ZSFdV?=
 =?utf-8?B?d1gyT2ZCNWd3SVAvOWxQeW1JWTFTaCswZGJLeHdmSC9pSDFTNjRqa1RTNUl1?=
 =?utf-8?B?NDVYb29maFFDSHZRZGJNYWl4VDdIYkxVVGx3S1lBU2ZYanBaZy8vTmxDWktE?=
 =?utf-8?B?QnlVSkYrRkpnQ3UrUDk1R2VKSkVBanlVcFQrTk84Mk1URUtUSDNvSjdTcHZR?=
 =?utf-8?B?cEtPK3oycm8rSGtYbHdEVWxhS3VqYVg5MmltM3NEMENKbko1RTN6LzR4dDM5?=
 =?utf-8?B?bCtBcmc1dnE3VXhvS3A4RGZ4bGxLQXBuUytxdldIOWluTHNQZ3V0M2ZGakw5?=
 =?utf-8?B?UjVkV3ZVTURmRVRyQy9jUktGZDEwVFhHRllpc2NDNEU4anBSK09xdmNGS2RP?=
 =?utf-8?B?YlpYRzBlU1RsQ0lJYk9WcGlhRFl2K2JXVm5FQVB2dW1vekx1UDdSOFZTWlh1?=
 =?utf-8?B?aXJ5MmNTcnQ1SU5mTTdpK3IrK0JVUjlWZEtiUXpLM2JRVFVFSUpVenJQWlFJ?=
 =?utf-8?Q?OM1JZR2Z0Dw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR15MB6455.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGxGSnhlekJBMkg3NGdpV21RZFNoNTN3Y1dGSWVSbENvRFVhV2I0VGl4Ykhr?=
 =?utf-8?B?K0Q1Q1N3OTRieXZ1QzRkTVVvV1RDVlFJdUtuaVVCY0xzODBrT2VsSHJCQ2gv?=
 =?utf-8?B?QkxJQXJQS3lNaDRtTjRUeHpuNEZ3OWl4SDZvMytONDhnWEFHT242bHF2Zlpn?=
 =?utf-8?B?eE1UbzN4RWN1UDU3NHlxQnVveVdJT0RtZ29UY3FCVGg4SUkxK28wczArTDRp?=
 =?utf-8?B?S0l6RlB4R0d5TzIvckdmcjNvcFFmQjN5WVhOeHpucUxJSFpBQVN6TEZDWFN6?=
 =?utf-8?B?SW0zckJGUEc3UlJja0lkUGhZMnpQbzdPL3ZQT0RxZWpXakI3c2k0U2E1L25x?=
 =?utf-8?B?OE5kOEMrUUQ5ZldCOU5RSlh6NWRSZnRSc0hMMjcwZXpVMDFtS2MybUpnRnJO?=
 =?utf-8?B?K2JzNXR1L3REZ2hOWk0rdkZGRTJzbUxPc1FodVhaWCt5bnpjQ1pmVkhwQlBy?=
 =?utf-8?B?YnpHUjVoaW1BcmlESjFXTzFIRlZvV2RQRmpkT1ErVFpRZUQxMzlUNGk4VjVy?=
 =?utf-8?B?Ni9FY0lGRzF4Q0tNMWVsdXl4YUN0eExXMk9vR0FhNHZoQkRyTDlCTnZkUlRs?=
 =?utf-8?B?OHI4a1JLN0ZGaEQ3TjBtbzFJTHBIaHFVeWlsM0prM2NLTm83WE5UcWFrTnlo?=
 =?utf-8?B?MVh5d3B4L2VWOS9rS0NobTBiUitpbHJtckx5Vkx3T2hiY3R1T1huY1dub0Fr?=
 =?utf-8?B?bTNxRVlUUEY5T0dLaWM1aTcySkY2Q1ByamExN1BYSVRLcVQ5T0dOUnFaNkFN?=
 =?utf-8?B?MktFT2UrMnlwcmF5UFZ6RVoxVDcyZU9lbGtVRnNCVlV5cERNZGdTc1lWbG5a?=
 =?utf-8?B?ck85NzdmK1h4dnVkbGhjN01VaCttVVVIczlKeGhxWUFqZW1qUDRUcWdkcGV5?=
 =?utf-8?B?UHY3T3pScS9nakc4akZTWGFTT0ZWMHhMWGt4T0lsTjhpN0tmR3d4SkhGT1ZE?=
 =?utf-8?B?UzVKYUZFci8xcWVhM3g5THVNaElCSmNvV25vc3gwNVVVWDVoS1R1dUhWdUhF?=
 =?utf-8?B?eWlQMUl1bkxrdzNNYXl3eUNhRVB0anNLcnZJZUc4ZG5WaTF4czFxZmMzd3N6?=
 =?utf-8?B?T1VlOWQ2bm5uQllkNTBDemVjMzNwcHFma2FwZ01BTWNiaFFKWGtpVjB6eUcy?=
 =?utf-8?B?bUZkSFFoUVZocXRsTHZaOUpaNVpyS0Y0aFJpUThheXg2U1dOcm41RlFSdENL?=
 =?utf-8?B?VUZQRlJEaFdhMllBdWpuanllaUUzeVEzdDVNSkpJWXJqc1c2Z1Mrem8vbWhs?=
 =?utf-8?B?eE5vNmJiTFVOR3FkeGovSS9zdGhEOHRpMkZ2K3gwS2EyWWxSUGVsdjZXRUtr?=
 =?utf-8?B?Zk5DNzhaRUxCVHY0MXMvWUhqNEdyYi9mODNEblBXNHBRc25leU1KMjEybStD?=
 =?utf-8?B?WlQ5SkhmUGdsdUczL2c3RnAxdWZycDhNRFFzcXFwQUw0Q2I0b3JRSzlKUHAy?=
 =?utf-8?B?Y0NhRHhuQklRZCszZjluQlB0Zm1PYjF5eDBLOVk4bEdQVWJtdklxVndYVnNY?=
 =?utf-8?B?Z0wvalgvekpIejZZVEN0Qk5KMThycWgyd2V1MkQ0S0tBRlBJN09EclJuREQx?=
 =?utf-8?B?R21kRWQvWVY0QjFaRmN1NGw1ZjZzVGFrY1I3SkUzTUgvVWJhTlBnUGVhTHp0?=
 =?utf-8?B?Z3ljdFF6M3Jpd3h6bXNGQkJMaXRSQjN6K0srK1BWMjZDSkFyK3JQK0RQL083?=
 =?utf-8?B?a1RsZGpuQjJqbXZqZHpkMGdFdi9ZNSt1SVVMRDY5ZHpTcHFnT096M1BQcG52?=
 =?utf-8?B?MHFoQk5DZWJGc3pPYkIwbGVzSG9LcXZ0VjVxOE9wc1gvN2tpOGRYa3FWbUVi?=
 =?utf-8?B?TGt4WGdTVWZxWTN4bC9lVDVHVUgxbnU4L2xLR0cyalhCYUx1T0VxRDFjUC9T?=
 =?utf-8?B?NDFydzVkQ21wUnBkMDkvMUkvVG5yUmhxcDhxZVFaYUtUK3lPQjArVHV4N3Q0?=
 =?utf-8?B?Nk9qVVpzU29FdElLQks1bWd6aGEyN3hsQk5ZU3ZSTExMMXdvc28vZ01KaTNw?=
 =?utf-8?B?d2FjYWZRbUtnOW9OUHduTHk1Q2JTeHVqMkx2TUhGN3pmQXBqSlVMUmxXaGJP?=
 =?utf-8?B?dHB6cEplYWtnOVE1ZXhwdTlhckN4NU9Xd1M1SXVkRU5NSW9hS2NNaXpaSFY1?=
 =?utf-8?Q?ccuY=3D?=
X-OriginatorOrg: meta.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 269f1ae8-2c5d-4ad6-58e3-08ddf770539c
X-MS-Exchange-CrossTenant-AuthSource: LV3PR15MB6455.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 11:33:16.9175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pju9Ud1UY9f/Zao4Um97YaxGwJO3sQoJT3ItyngQ8DXv0dkWwXICIqI/5JSu0Ngy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR15MB6144
X-Authority-Analysis: v=2.4 cv=aqmyCTZV c=1 sm=1 tr=0 ts=68cd3f7e cx=c_pps
 a=UZZKR2DsB1PZv1vhPkDPDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=Ikd4Dj_1AAAA:8
 a=ZRQU4wQQffI-jn68eZMA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE5MDEwNyBTYWx0ZWRfXxcACTtAAsVKl
 V62UOBa/iWYHui2PCOHpsjfgo2+8ipCyMX/aulxaIqucjieUqWm53WOb9k0KX5agj+jae4ZePKX
 IXDJUaeFZLFdjjt5UdMzXZBi9EVceLR/5Z9LyvaZ+Sfdbdghw82T2M+B3kh8h55NUyYTRNzMuXK
 i1QwkGy9yDbs3QUmMMVjizYt2emU5lzX6YVl/5SaCMcpm3gjtdoaetcvG425oYdn6FTOvUm1EPt
 MInZu1sG6AKqg1S1vy/c+3EIbdtZsSsfg7quz/Nb22ygSGoyRlBWvoi+nwJTJbx42zLC7IZGK6E
 UblWRKsE4+m+y3blkQwKlwBPfHNcmPt7xU9UqhxRjhN1UGOOTI/JP5e/YC7lQI=
X-Proofpoint-GUID: uerNRN3zmzjLMCfh8HqpYs6LNJ0PGnLX
X-Proofpoint-ORIG-GUID: uerNRN3zmzjLMCfh8HqpYs6LNJ0PGnLX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-19_01,2025-09-19_01,2025-03-28_01
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

On 9/19/25 4:36 AM, Balbir Singh wrote:
> On 9/19/25 02:42, Chris Mason wrote:
>> On Mon,  8 Sep 2025 10:04:38 +1000 Balbir Singh <balbirs@nvidia.com> wrote:
>>
>>> Extend migrate_vma_collect_pmd() to handle partially mapped large
>>> folios that require splitting before migration can proceed.
>>>
>>> During PTE walk in the collection phase, if a large folio is only
>>> partially mapped in the migration range, it must be split to ensure
>>> the folio is correctly migrated.
>>>
>>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>>> ---
>>>  mm/migrate_device.c | 94 +++++++++++++++++++++++++++++++++++++++++++++
>>>  1 file changed, 94 insertions(+)
>>>
>>> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
>>> index abd9f6850db6..f45ef182287d 100644
>>> --- a/mm/migrate_device.c
>>> +++ b/mm/migrate_device.c
>>> @@ -54,6 +54,53 @@ static int migrate_vma_collect_hole(unsigned long start,
>>>  	return 0;
>>>  }
>>>  
>>> +/**
>>> + * migrate_vma_split_folio() - Helper function to split a THP folio
>>> + * @folio: the folio to split
>>> + * @fault_page: struct page associated with the fault if any
>>> + *
>>> + * Returns 0 on success
>>> + */
>>> +static int migrate_vma_split_folio(struct folio *folio,
>>> +				   struct page *fault_page)
>>> +{
>>> +	int ret;
>>> +	struct folio *fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>> +	struct folio *new_fault_folio = NULL;
>>> +
>>> +	if (folio != fault_folio) {
>>> +		folio_get(folio);
>>> +		folio_lock(folio);
>>> +	}
>>
>> Can fault_folio ever be non-null and different from folio? Apologies for
>> not knowing the lock ordering rules but this jumps out.
>>
> 
> Yes, migration can occur in fault context or be driver driven
> 
>>> +
>>> +	ret = split_folio(folio);
>>> +	if (ret) {
>>> +		if (folio != fault_folio) {
>>> +			folio_unlock(folio);
>>> +			folio_put(folio);
>>> +		}
>>> +		return ret;
>>> +	}
>>> +
>>> +	new_fault_folio = fault_page ? page_folio(fault_page) : NULL;
>>> +
>>> +	/*
>>> +	 * Ensure the lock is held on the correct
>>> +	 * folio after the split
>>> +	 */
>>> +	if (!new_fault_folio) {
>>> +		folio_unlock(folio);
>>> +		folio_put(folio);
>>> +	} else if (folio != new_fault_folio) {
>>> +		folio_get(new_fault_folio);
>>> +		folio_lock(new_fault_folio);
>>> +		folio_unlock(folio);
>>> +		folio_put(folio);
>>> +	}
>>
>> Same question here, do we need trylocks?
>>
> 
> Since we had the folio lock before, the assumption is that we can
> still grab the lock after split and it's OK to wait, since this
> is not a hot-path.

I think the lock ordering rules either let us take two folios without
trylock or they don't...holding the lock in the past shouldn't change
things?  The same holds true above, two locks + no ordering, one or both
of these locking sites should deadlock.

But obviously I'm a tourist here, and I need to refresh the review
queue, so I'll move on ;)  Thanks for taking a look at it.

-chris

