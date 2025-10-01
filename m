Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A03BAF523
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 08:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADA6B10E677;
	Wed,  1 Oct 2025 06:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HV0DvC+B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012003.outbound.protection.outlook.com
 [40.107.200.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946DA10E66E
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 06:58:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aro2po3zULRXmP4PqMPeyhNQp5Lhqu3BDefBLCPi+nkYMk92Vx0nH9XGGkzSDtFhuKccvGGzcXV7JImYZB8GmPGr2fxGyShRdQ5FoytjmvD9z12ucCRcMUv+MPhmEdsrwHXNlty+iPjWIX3zMgv2JWjIM8UNoLifpULO+PbXeYFyqPqyRqvIjPqKjk3AsFpTyMyg1Btn7SXkyjL2WZO56LQz7Klngj0oFf5JsAxw/bLUKjkvhQdRACkg3wI87g71pMluNQ6gXaj8D8xRVRONLShItD4x+DE372VVdrhuxAMJE5bW9DSN8tpmPCcilv+MXwoRQujTecQFAWLb7tX2eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOl5M3kp4BIcs6OEkYJUTSmye+VyxZYe9zp20piKQ9I=;
 b=ixjngslNI51z5V6xa1rVfw90hmj86yT6feludMif85Pc7azf68tEXEwtBBM/zJ/ZutZYge4bdqgqlNMAptZxk4yoXulycJjYYd0fQ/ehp1GuicaIQMyLZ4xIFqVoPQHJIEggbvc3uzjfsNbQ3FpXXQzxMfRD9PKv3q8OCsr/Lln0++V7OzFLwrWtxheE1NN5z/XY71PWSJf8TKIWL68BCeHr9tgoDwaxhQGimfOe6XoEggCiGgdWwEQJIz95S5NQSpcFGKt6qj0+LH9oE8N2b4pw6SeTf+u/2hVDa/Rf9/uM9GDpD+1hkTRei8Y6R9p11GmFII8FaAwWhglK3h50LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vOl5M3kp4BIcs6OEkYJUTSmye+VyxZYe9zp20piKQ9I=;
 b=HV0DvC+Bz+aDq/brjbssjubFltaT8xNlb1XJr96t0BW4zG1DZz/QmB3HWGIvnAXZwvodvabSWLODmZgEfKUnWqGxmBVroOaJWYaIa635vSyxFR9dswgNOQoK830q30Vx1xxFXChTb7N8LC/qXVyosGT0uwqVR6mJHLWXES7W5ml46dPCHlT1hLsZC58R+jJkomMedCLQ1gFF96JCPy5As81lcOVZcHVF3izQ7alWrTbuzYqQKTPBsQ+1l4Ps7VShsOr1oLgdfjvvZAmLctjIHcxxXyk9vPAJWV7LDRgLVbcElTXdLm+jalrfu8YzZbcp0VObNPdoj8bqqFdRtkWLwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by CY5PR12MB6299.namprd12.prod.outlook.com (2603:10b6:930:20::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 06:58:32 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 06:58:32 +0000
From: Balbir Singh <balbirs@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
Cc: akpm@linux-foundation.org, Balbir Singh <balbirs@nvidia.com>,
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
Subject: [v7 08/16] mm/memory/fault: add THP fault handling for zone device
 private pages
Date: Wed,  1 Oct 2025 16:56:59 +1000
Message-ID: <20251001065707.920170-9-balbirs@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251001065707.920170-1-balbirs@nvidia.com>
References: <20251001065707.920170-1-balbirs@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SY6PR01CA0002.ausprd01.prod.outlook.com
 (2603:10c6:10:e8::7) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|CY5PR12MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 029b4cae-118b-48cd-6366-08de00b7eec3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFhhdGIzb0E4cTVia1JqQ28zSXErYzJKV0REVXZFNXNFOGxWVytVL2NuWHFZ?=
 =?utf-8?B?cDJ6Yk0zZ3lKRlBFRW93K1VTOHNNeTBtK3lCclZhV3BDUTlhVmM2aG9IV3VR?=
 =?utf-8?B?NXJJU3lwRmVZRkRyemd4SjYyQm5ZZ0VScDBZVHV3L3FLSittTDBSMmlEa3NX?=
 =?utf-8?B?Y0ZMSEJMT0c2WGpDT0ZESC9RNkVCUkluZ04vbzA4N2ZPWUFnNVR2T0tvNW5y?=
 =?utf-8?B?bEt4QVNFbWo1OUk0bkRtWjJ0YTM4bG9IaVNTM2xJbWgrNXFvUmhObUNERzhq?=
 =?utf-8?B?d2pwNVhWTTdsRDl1ek9paXJFdTk4SGZqU2xhL0pxWkw0aUEvczFNS3JxSjBK?=
 =?utf-8?B?dUxkcitOZWNOUzlnczRNUUpLV0oxenNwTWUvQVJxTUFwMVJzc2tvaktjaGIy?=
 =?utf-8?B?UGl0bGhHWHlHejdETXR5Nm9LT3VuNVpnSkpva0RvdTFaeHVYckVsTnZoNG96?=
 =?utf-8?B?dVJlNUFoNHRqOFQ1Z0pUMCtoTXF4TXlLQUNhcDRRVSs3cEJySkY1WDZZb2to?=
 =?utf-8?B?ZnhtcThuSk1EK2VPcWxmcHVXdzljZ2c5WEhKazJWWlNZNTJQcGhJZ01Vdndt?=
 =?utf-8?B?L0dldExKZFZkTUM0OWhjVUpJWm13bU9vdlMrYjZFTGRKRnNQVHJGNnVzYlYz?=
 =?utf-8?B?NEdLczg0QUJvV1AwZkJBWkxIL0xhMVFOSi9LQmlzWlkzVTBXWnBubDhBQ29y?=
 =?utf-8?B?Ly96eU1CUU0vbmhubkVTY2p4dUxvNFpDRzdMeGZBNXh2NXBxam1HQ2JzdkMz?=
 =?utf-8?B?ZU1VQmJkeUtZQjlkRE1PS3NuSUZZaUtPbUdJRWV1d1Q5RmRobDJnRGxjR2Rk?=
 =?utf-8?B?c0htenpFeDdxWWZoVWNYdmJ6d0hEMmNKOGpuNkxNZHdDU0p5RWxHTElxNDhS?=
 =?utf-8?B?NnhVL3BFZlhhUHVZeGdYYlgxSzdTOCtqTjdwcFp5aDJENWNkbEpQWllWWndj?=
 =?utf-8?B?WHhtNzdHK0VVK2ovQS9PdXBDUGFMdkk0ejBMMXVqSElwUlpjVVlrK2JhbHlW?=
 =?utf-8?B?aktkNkdaaVFET2luTWNRMHUwMGFzeWkvT2FRZVN1YmI2YytlWm5QNEcwbW90?=
 =?utf-8?B?a3M4UEhjTGpHL24yeG1IVllxRVdWVlhqZmkvZXJtek9DY0pINXN1TEs1NWdq?=
 =?utf-8?B?N0xHTUZDWnlhQzF1T1JsYTl3UTdhVzk2VXExZUt2MzRvQVNYd0MrcWdSM1VT?=
 =?utf-8?B?b1Mya2ZSc3lZdDlGcis0UE5nR053ZVVZb2MxRkE3Rm5PZzNMdWxnNjcrdHZH?=
 =?utf-8?B?bUFONEJtcHMrNWROYVRkMkh6a2RGSzNGMHNFNVRVcC9FTGFta3NyLzhMcW8y?=
 =?utf-8?B?YUM2ZlNTcHU1eFdYTjVidmdqaTJSOGc5ZTJBaEdsaStEakZOQlFGVUdQYkN5?=
 =?utf-8?B?Q1REM1VqK25KamlBUktESzBtOWxTMHFwMS9kNm4vUWM0WXRabkFSc3dHb290?=
 =?utf-8?B?YzFieXRMQ2xzY29kdVJxNGduNWJpNmxIQ3FuK1M2K0JTaUgvOVFXUzlXRkRC?=
 =?utf-8?B?SkJBRnRBLy9nNWYyWTQxQ2Y1YWxRRnhsMWtGZEZicEpZQXpnQ3BnRWFybkQw?=
 =?utf-8?B?NjdKb2VFTnBNc1hGTGtycVI0Tjh5eTladGE2VnlhcVcrcmRBSUlxN1hDdUNy?=
 =?utf-8?B?SlJydWpKcHVUOEpmbXdYWkh4b0l5UWtiUG9Qa1lDcGVMVkdOckttdFl0NGFj?=
 =?utf-8?B?TWFYTkV1WVJuZkJGZFRRZ0l0RGpqdHY4dFZUYndFc3pZcjhnTjNFU0tIRkp4?=
 =?utf-8?B?TnRjeWVGS1N4OVhrelVQTzYvWVRHeHpoL001d3lNKzdiSFRDaDZMbk1YVWZV?=
 =?utf-8?B?dmtETnR3bVJrSHVSeVJKZVJPRGpUYlIrYnZRNzZHRXFHcDlqZm9oVEpYWnQw?=
 =?utf-8?B?eUlCblg2RllWbGRXYXU0b21kU0Z5WThoRGJWZUNTbHVZN3JFQ1FVK0NxZ3BW?=
 =?utf-8?Q?Zw3FGLiBy5IVdIg2vxZvE5hzagBVs3UM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0owMTloOEJQM09jNTNyR1AvelNLMUNiRlA1QTZnQUhiNHVReENBMjhvTnZr?=
 =?utf-8?B?bmxsbDhveHJlTHJZOUJzR1NMWjZ0WXU4WWx4QkJlRGt1SFFxM3VRdlhjLzdk?=
 =?utf-8?B?Zmp0TDVCeU1CYkF1YWpmTWladTNiNFQ0a1dsMVBhVzVwVUFjcEQ5MDFjclVz?=
 =?utf-8?B?aHJPN1AvbGpVQ1BXT0IrQVk5bFFkR3JVc20yRGtpMWxmOVBZaUFIOUhNKzJJ?=
 =?utf-8?B?ZEtEOUZtWDFPc3RhdmtOMUd6ZXRxR1NPOVFoMlhkSyt5b25sQ1FXemIrSnNj?=
 =?utf-8?B?R1UvQjNWNEFHNkRlR1RIVGt3bzlNN2I3bi9TMHBxZWZiSWZJK1dleDhTY3Az?=
 =?utf-8?B?bTJVek5Cc0VuSEtzR01uRmJmL0RSMUZNdExPTGg2WGsxc1dLVDJRdmV3SjZZ?=
 =?utf-8?B?d2gyZWxON3UwekRJRlBKRlMyTGN3Y3g2L1lrOFlZRXNsMWpSN0FiOUE2T2dx?=
 =?utf-8?B?eXN5aktKb2JheXpqeCtwaDBTZEJHa3lHN3FDb3RId0FTT3AycUJySzFxRllq?=
 =?utf-8?B?NkhQQS82d3pKV0JzblU1ODk0RUxicHFKVW96S0dmNmJYdTZNNlFtNE9IaWs0?=
 =?utf-8?B?YmJrQ3Z4cnU0WGtVUklnQU02NmpMNjJCbVo1V1ZZbjFadGVXcHFvTE1XMFpI?=
 =?utf-8?B?UlhkTG9adVpEcklTckxrNDhYK0RUd053a1kxcHF6U3d1bTRtR3ZWcFZLR3N5?=
 =?utf-8?B?amZqeUk1eU9tcUs5QjFsRzlqVW9rRUpUNGJ4TEVtMldKRXYveDBsa1piamVO?=
 =?utf-8?B?cVhCZDdVN3k4VVY1VzZHZ3FNVXptV0xVTWNDVlFKak11MnRweFNjdFlQTlVL?=
 =?utf-8?B?N0xYYUR1MXcwOU5heE1lZjRrSzR0YzZuNEVSdHpQeVlhU1ZDS2JVeFdmaVlR?=
 =?utf-8?B?dGdXbGZaRzdxTmxnNHR3Y2R4YVkwMzVURVdVSSt3NVBLck9Fd2o2MUcxQjc0?=
 =?utf-8?B?T0tSOGpFbFVpKzdaekp6YURsTjdTVE15SG9HODAyT0d4V2szbmhoclJjMUR1?=
 =?utf-8?B?TnorRGxCRERmbE4vNkFrT3Y4YWtXQVFHaWVIekJvY0IvTXBKelZhelFsNUtN?=
 =?utf-8?B?RFNMelZlbEFnZDBSN25nZk8wMzl0T3pacEF3VVZmYTN4QkZPSk1Wa3pva2Yx?=
 =?utf-8?B?TDB0c3pDem83OHcxTk96R05TZ28vN29sUWFuSTNKK2tMWGtLVlZ0VERmNjNL?=
 =?utf-8?B?aFRxWHR6Z2ZoNlpSeTd1bTc0cjNEbkZrOXR3OW8wVzEzU0JGWEZ2blEyT2FM?=
 =?utf-8?B?Vm5VcE8xV2R6d3ZTckRPNXdaQ0ZvZ2tnOHJIR08vOWNHRmNYeW1vbUJYcmEz?=
 =?utf-8?B?MnVRQUtXOXZod1U4eWFXY0hDdi9MdThYeDNOMHFHZ3RrelBjeHlHM3A4T0RQ?=
 =?utf-8?B?OHBtNjQraWQvdndmenJGYWJiUGdSM01jOFpwU016WjRWYUdrZVlyeVNWQ0dn?=
 =?utf-8?B?dlNpdkw1OEFNRlZuV1VTbkErQmlld0ZRMEN1dEZzeWh4VU0veFNBdSt4Qi9u?=
 =?utf-8?B?c0R3M2YydGlxZy8vWWlja1dvMHo5cjg5NVZZSFEvNGo5QnYxSkNsK0VsajZQ?=
 =?utf-8?B?M24rbHduUEZSRFBiYjd2NjRwWlhGaDZOT3Ewc3FQTzFaS3dkeWNKWStWNElP?=
 =?utf-8?B?L1Q3RjJvcWRvbEx2VU43clcwS3kwOTdNYm9RMHlZUmwzbjcyOG9jbHptQkRN?=
 =?utf-8?B?TXM5ZUV6Vmh2eFlmcEN5YUhIb1N4UWdCcTkrK3FkcVZsQWZia282Q0FCa2dE?=
 =?utf-8?B?VCt1Q0VlRkFOTU0zdDVIbGlxOUJ5cUE4UndHL2t0YTd1QXdKV1hMdVlUaTNH?=
 =?utf-8?B?MUtHYVVVK2hkM2dpL3hiajk2VWtNSnFNVTVQejRvam0raUtBZExGdldrRUlm?=
 =?utf-8?B?RlVpOTFIU3YzRE1iRkJDTGNqVXA4cnI0QzluZXJENkVDSDk5STFvU1ZQV000?=
 =?utf-8?B?U2VkS3k1aW1RSUt5Qnl0MjkvbmsrQzRHc24vREJaSWRpWUplSW1TdHJXOUZT?=
 =?utf-8?B?UTVERmUwNmNwS2Z4bGpVT3BTRmRNNVlIRDA5ZnFQL25EbUdzaWlIck5oUU82?=
 =?utf-8?B?eWdtMlA3bTRQdFlZcWg1QUltL2QrVWxqcTY0dHJ1M3JraGk1YkwydjlsWS9o?=
 =?utf-8?B?cndBZHlJcWMxdEEzS3l0Y3o3aDhjRVlOY2ZJck9ISWs2bk9hRm5TQ3VmN3ZP?=
 =?utf-8?B?dVE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 029b4cae-118b-48cd-6366-08de00b7eec3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 06:58:32.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0AF0VG6VrnTn74wSpAAA7jXMo4c1pntQNX0MY+AysfMCgZPtdebihL0rzCcmDACtrL60qOSfynOO7Hiok5UdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6299
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

Implement CPU fault handling for zone device THP entries through
do_huge_pmd_device_private(), enabling transparent migration of
device-private large pages back to system memory on CPU access.

When the CPU accesses a zone device THP entry, the fault handler calls the
device driver's migrate_to_ram() callback to migrate the entire large page
back to system memory.

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
 include/linux/huge_mm.h |  7 +++++++
 mm/huge_memory.c        | 38 ++++++++++++++++++++++++++++++++++++++
 mm/memory.c             |  5 +++--
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index f327d62fc985..2d669be7f1c8 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -496,6 +496,8 @@ static inline bool folio_test_pmd_mappable(struct folio *folio)
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf);
+
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
 
@@ -671,6 +673,11 @@ static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 	return 0;
 }
 
+static inline vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	return 0;
+}
+
 static inline bool is_huge_zero_folio(const struct folio *folio)
 {
 	return false;
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 05c68f5b5fe3..8c95a658b3ec 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1287,6 +1287,44 @@ static vm_fault_t __do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 
 }
 
+vm_fault_t do_huge_pmd_device_private(struct vm_fault *vmf)
+{
+	struct vm_area_struct *vma = vmf->vma;
+	vm_fault_t ret = 0;
+	spinlock_t *ptl;
+	swp_entry_t swp_entry;
+	struct page *page;
+	struct folio *folio;
+
+	if (vmf->flags & FAULT_FLAG_VMA_LOCK) {
+		vma_end_read(vma);
+		return VM_FAULT_RETRY;
+	}
+
+	ptl = pmd_lock(vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd))) {
+		spin_unlock(ptl);
+		return 0;
+	}
+
+	swp_entry = pmd_to_swp_entry(vmf->orig_pmd);
+	page = pfn_swap_entry_to_page(swp_entry);
+	folio = page_folio(page);
+	vmf->page = page;
+	vmf->pte = NULL;
+	if (folio_trylock(folio)) {
+		folio_get(folio);
+		spin_unlock(ptl);
+		ret = page_pgmap(page)->ops->migrate_to_ram(vmf);
+		folio_unlock(folio);
+		folio_put(folio);
+	} else {
+		spin_unlock(ptl);
+	}
+
+	return ret;
+}
+
 /*
  * always: directly stall for all thp allocations
  * defer: wake kswapd and fail if not immediately available
diff --git a/mm/memory.c b/mm/memory.c
index 7e32eb79ba99..59985b88a9b1 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6337,8 +6337,9 @@ static vm_fault_t __handle_mm_fault(struct vm_area_struct *vma,
 		vmf.orig_pmd = pmdp_get_lockless(vmf.pmd);
 
 		if (unlikely(is_swap_pmd(vmf.orig_pmd))) {
-			VM_BUG_ON(thp_migration_supported() &&
-					  !is_pmd_migration_entry(vmf.orig_pmd));
+			if (is_pmd_device_private_entry(vmf.orig_pmd))
+				return do_huge_pmd_device_private(&vmf);
+
 			if (is_pmd_migration_entry(vmf.orig_pmd))
 				pmd_migration_entry_wait(mm, vmf.pmd);
 			return 0;
-- 
2.51.0

