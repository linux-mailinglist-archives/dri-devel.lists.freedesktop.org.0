Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E843BD0E4F
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 02:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD6110E075;
	Mon, 13 Oct 2025 00:02:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uZvRT96x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013027.outbound.protection.outlook.com
 [40.93.196.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B769710E075
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Oct 2025 00:02:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=haeqwdegwNJQ5i7lEdHk8jpz9WG4m/vWbLa2z8uIAyDnAgHhVCW/BfafFC/Lk/rUFL7efrtIbtvLWBgAJ+Z+crumi1LUR05nE3Ekh+AOqAa2Rj0IjsDYDvQPnoXKnlkBRL+vxqss0VQ0HdxM6UPxvPDxqIhqMVWRndGQUjHkqvZH9tIwYrCI5bgP5MtF9y5lu/+dSp+kLZ5UTlGaEjEDolQboNvPDG7LwIBs64L+jPYi02aNvuUba1PJ1ZKr+sIDkhvTzveMMU0zy8GHbdGzMa2ye8xAfDUNYpw1za5lO9YXu6v/7DfIYXZ2bve05w1wcSAOcaEWRl4n+2IflLu6jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NU2ZSCOpcfW1Yx/8VthsBQ5qKR66P7xlAwT5gHrgtAs=;
 b=semFAbXbCzuSgAdaLXMje/RVjWa0/JL9yDNkfrIdOvXm4MDtPr7ax74/vmoViXaaV4qI81JmK/ey3gRdBEWCCsHyqyeBkNXmisEOaUt/4riG7sXTbt1RjBcuEe8aFKtyVGuF/Gs3NoAV/Zm9+PXA6qMvaNldGbrdOdPkhEh12ZrLYwJn2rV1QFt42wiGvb4s5PA7BTJqk6JpI2qr5FLLCPNKHs7D/YiCU9LDN/NaoJOR9t9boS3370pvYDXEMCpL/Z6HC3JRjpM2iOZiuGFl8qW+vvv+hP6Cwu0Q8xSwOGQWjT9oWezj4X6ZPC+LeY86tO76NFaM6ZsbVeO78JfDWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NU2ZSCOpcfW1Yx/8VthsBQ5qKR66P7xlAwT5gHrgtAs=;
 b=uZvRT96xPKT6ij4x8l8eUx7/zr/cTb0Efz5n6aQo/wJWUhVvyHqU0bOTm91k+7gTCMLfDQI+WZSrFhyGAvZ1387niBIXPfQMEDPNqRjwHFG0WUaxO1ymzqR6NzH4qopk8/wb6uJsBwAfVMk/iP2WdJl3guGGl9ya6l4BdRIh4wu935/05mYeTh+I8D90EAd5ljo0xKRvhJYGO5Ew4IFvfhgLvzlQvQ0jlpXtlTT0N0JlqxAMrBrjVJsYf3Yu4hzi5+nmSjekUoCMZJTF11P0GwMnfZFWfxTAsCs1N3LfyjR2PNjlFJemhOo/Xcr1KxvIrWif713C3djM/u+sSVwIew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH8PR12MB7277.namprd12.prod.outlook.com (2603:10b6:510:223::13)
 by DM4PR12MB6134.namprd12.prod.outlook.com (2603:10b6:8:ad::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 00:02:11 +0000
Received: from PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251]) by PH8PR12MB7277.namprd12.prod.outlook.com
 ([fe80::3a4:70ea:ff05:1251%7]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 00:02:11 +0000
Message-ID: <1b311458-957a-4f0d-b7f9-51e75bbabd55@nvidia.com>
Date: Mon, 13 Oct 2025 11:01:49 +1100
User-Agent: Mozilla Thunderbird
Subject: Re: [v7 03/16] mm/huge_memory: add device-private THP support to PMD
 operations
To: Lance Yang <lance.yang@linux.dev>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
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
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-4-balbirs@nvidia.com>
 <CABzRoyYg1o8Oyjx1AQ8or-Vxm94zQXeAx7mWco2qs7=w4mBcMw@mail.gmail.com>
Content-Language: en-US
From: Balbir Singh <balbirs@nvidia.com>
In-Reply-To: <CABzRoyYg1o8Oyjx1AQ8or-Vxm94zQXeAx7mWco2qs7=w4mBcMw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::39) To PH8PR12MB7277.namprd12.prod.outlook.com
 (2603:10b6:510:223::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7277:EE_|DM4PR12MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 5117abe0-dbfe-44df-f80b-08de09ebc225
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TUQyVGREUnNHc2cyeGhGc0VhTlR1Rzh0ZlFVVjlYTkhSYmFnWUI5VnZiSWNn?=
 =?utf-8?B?ZG5DSVBiUnE1SWNNWGl6NDBsM21MUHBlMTdVazkwNlNQdkhzWGpJUFhDdUto?=
 =?utf-8?B?ZFlreTFuYWJrR2xHZTRKVFNIeXZXRDZkRGRlREpVUGJONEZ3amJTcVZ1M3pN?=
 =?utf-8?B?Mk5MZ1RRdzIydm1MbklSTnp6YUlaeWVJUFN3Uk4wdzNmeHUyTEwzdi9OSEpC?=
 =?utf-8?B?OFNDaFNaMXJkNnpiRUxKMFFlM2FoejJ3Ym1QQTM1LzVSNHhmSGY5dmxnckZt?=
 =?utf-8?B?SnNEZ2R4ZFl0dlBuTnp6WHAvOGZVT29aZnRZYk1wZzVFV0ZRSWVObDBuaHBk?=
 =?utf-8?B?aStyZ1AwUTAzQVVaTWk1VFJ3d1NwaFlEWnR4ZTFNVlNBV3NSUUxWb0trc1hj?=
 =?utf-8?B?eVgyQ20yeUhaYkdiN1Zmb2ZWQnFTa3RaOXlKT1R1UnpscmJ1SjZLWFRLekVj?=
 =?utf-8?B?VWNndWRYb0xJc0JkaHZWRy9tcDN0amJQLzl1aWcyNkx3VFhzOC81aW54UWlV?=
 =?utf-8?B?RnVDVVFucXdpbnVBeDFHZ2ppVzhtd2g3ZnpsY090cGNvT2s5aDgyNzVMYWxm?=
 =?utf-8?B?Z01vZ1hIbFhEWU5Rb3pOOEFuc1VBcVBFK0ZsWFpZWVE5dTBBMGJ5WkxYMlQr?=
 =?utf-8?B?RDQ3OVNqSi8vc3FnN1RxTC9naWU1b0xmRGJLekpHTmxOWVdnTHY2U01aSmZ6?=
 =?utf-8?B?NUNFeGlyZjVOMmlNdGp5bjdVdnF3U1hIOXJMcWxaSVZHVHhERysrVXFCWTNn?=
 =?utf-8?B?V2tGQU5pUmVDRktPUk5zd3prcUhSdVd0Sy9ISFBLMGx5ZkNrWGgzRUxZL21m?=
 =?utf-8?B?eGJOUDRFNEJiYTFXOUV0SWF2NjNuUkJTdGF6OXkvTy90K0FkbkVWYVU2M3d5?=
 =?utf-8?B?NzdpejM3UXVoZzRDMjBGOE1DTGpJVjcyRW91b0QvRVhDdFltNDc5WGNWeEJH?=
 =?utf-8?B?a3ZsdEx3WTMydWFUWkN6eHFUVXl6MEsxVVJncERGWFc3ZE4xWTRSRVM4bHI5?=
 =?utf-8?B?OExCaERRNlhudnFtZFFxeE5OYlF5d0IxL3ZoNWR1bWZqblppRFZZYjY0WVRU?=
 =?utf-8?B?T2YxNVpqUkVnbWtQNFFPRFNaVFlSaDNUdUx4aHAzZlNhb0wrK1NtTUZZNWsz?=
 =?utf-8?B?TGlISk44NGl2Q3VNbEFXOXBwUHd3ZG5nN0dYREZwamx1blBXUmRwZ3ZUMHdK?=
 =?utf-8?B?UVdjbDdSSEhYTHlZeVVXRnRHdDVyKy9ZK1VHQndXbGw5cndocU42MVlhaGRV?=
 =?utf-8?B?RUdjUnJONnl1dStVWUlvSDFsZ0p2c0YxUld3aHhWdEo4Y2J1eThXZzdON1JE?=
 =?utf-8?B?WkVjMXgvQTJ4djVuVGRuT1UvNHpSTzhPK3Rmc0JKaERVQSsvODF0WU5EYlJj?=
 =?utf-8?B?ZURXK0tXR2pFTXJiVVFGS2lMeHNWckJUK3NEcXlJN1JsRWpkYU9OQWVGdFdC?=
 =?utf-8?B?WlhUaG05MkRoNmk2OEVyNkNIMkttOHJvdjczRXNHR0JHY21kYjZOQWgzd3lT?=
 =?utf-8?B?Sy9kYmZrdk02QVVCWEhmY3pxVEsvWTFVQXV1QkZXSWxLTU5Nbm4vdVY5bEpO?=
 =?utf-8?B?SWx0T2ZmMXFINHRGZERxZHVBSXZzWmRTTkh6UXJ2OFByZUpTZUJyYSszcTJr?=
 =?utf-8?B?QU9pclRKMThGYnQ5Z0FEWVpabEVEdGZFYTN3bWRDeHowTDVlenEvMWluVHRC?=
 =?utf-8?B?T1NLYWtjQUNVNWRYNWlFd0ppNmRUMFdnREFWbFM4bEhGbkthaVZ4WWhRMzRn?=
 =?utf-8?B?WVlWQ1lETS82QStzS2ZqWmRUVmtEZHZuMVJLQmloUkxPcGpEbWRQQlB6eDU1?=
 =?utf-8?B?TEVkcWx5R3VQeUFrcUoyS3BDaGdRVkVMcTZ5a2NrQUFsQ3VOc2FiNkVlS2c2?=
 =?utf-8?B?RVowSHVHWHZXSWs4Qk14ZGZJT2F0UU9QaW5MOTAyd2RSWGdhVzd3MW9RVXp3?=
 =?utf-8?B?T2o1N2JOb3UzYWxzelNVOHpPampLQWlvbElkbzBTN2FIdUZZOGlwdndERTVE?=
 =?utf-8?B?V3BYZjZESmhBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7277.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a2l1ZjkyOTFDMDRZYXNqWHJSVnA3dnRFaU80SkhEK3FkM0FhNitUbXFUZXdV?=
 =?utf-8?B?OEduKzkwWCtJdEhXTDNKSy9OK2hnRlVrODdhT3hYc1VvbEl1U0dLZHY3RUR0?=
 =?utf-8?B?QUlzUjRFU24yWGJKbkcvUHRUWVcwd0R3UUhIVk9zRkF6aTlUelVTNGVtRVhl?=
 =?utf-8?B?SkNoMGFsc0ZDQjFGOTlLc1hFU2hueldjRkJWcnlQUXg4ODgwbitIM0N4bHdG?=
 =?utf-8?B?L0l2c1NidUJ1MzVPK2FXVDI2VkpvdXFnWTl4VFp1ZjA2aEhzTlN3eWtLTWdh?=
 =?utf-8?B?RHpsOXdGK0RMckpsckJuU3VyTEZNNlEvMnF6N0phYnV0dDBIYVFBelRRNjY3?=
 =?utf-8?B?WXAxN041SUxxeUJUMHlaVUprT1Rhdkl1eDU2QmhZWVMzQklwL2NyVFBNbnA4?=
 =?utf-8?B?UENSSjFEUjMxdE5RM0ZiZ3BVYUhnZlRSWDNKbllOSzNXK0dqa1NqcEgyRHRa?=
 =?utf-8?B?Q09sbVBaaG9JWjJZblJqbmZxVXpwSjRwT3VxM09pblZZMEFZQnRSYTQwMmtM?=
 =?utf-8?B?TEUxOUptdzdKdFprRWxrRU9ya05MeWExaEVIdHFKSVFqZFZJV29VeUN5Y1B4?=
 =?utf-8?B?dUY3aFYvZDlDenBMc1Y2bFdwRWFUN2E0R1B5Nlg3SE14RzErNUpYLzh4ZnFl?=
 =?utf-8?B?MmdyajRnVjY1NXpaUmlKTWo3djNoOEZBZENMUE50RGxYZWRna0hKK255aEhS?=
 =?utf-8?B?Tk1XemNvVjJNR3k3RmlwczY5eTlJOS8wazZXU3NlaVpxNGFia25ydHZidHBV?=
 =?utf-8?B?TXkyV2JnV1EwZm95YS9OUlk2VjBMVHg4R256eVEyOWZUR1lWeGNBY0lQaVJS?=
 =?utf-8?B?dTRMRG1RNFgyanNVTEVKMkJDQ2FKQS84UXRTdHJES0lySldqSWhkZThNVUc2?=
 =?utf-8?B?cnZUVkpBd3ZoOFllcHpySWR1UisxcjdCcTNvK0xTNGpVSE50SklnMjVZWlNP?=
 =?utf-8?B?bEVpamdUcDR4S3Qrb3g2NHVHc1oxRWlIRDNEK1kvK1EvTXVmU0JEMzNnZjUv?=
 =?utf-8?B?MThLS0pkWGV6NTRTbmJZQTV2b3NjclhVS1lmMzBUSEJXWnlnSzRVQlR4bzB0?=
 =?utf-8?B?YUtDWFpCR2RudnptenJURk01aXFvcDlRaVJzaFh3TGc5RGpaWGJIRjJkcXZl?=
 =?utf-8?B?bWJVZTMxV1Iycjd2S0ZsWnJoNmUxR1RBelZFQ3JPczlzWHo5cFVkRHNtT05C?=
 =?utf-8?B?SU5jYVBZS0h3dmRzVGpjWnd6WFM3SUVVV2dWenBORGFBUEM5aVpkVCs2ZHN3?=
 =?utf-8?B?NnZrcWhJRzBlNHgwTUhJOEtEanp4Wno5Z2tONEkvZmdVV0lROUZ1dUR0cjc5?=
 =?utf-8?B?QXVIeFJUeGlmZTgyZVRENTFkWkdjUEdLdS82Smx4QjF0eGJ4bHQ3MWE2OGhN?=
 =?utf-8?B?ODhxQWM2MUp5T3pTMm0wcWh5bjlPb29lOUl2MWJqcXBVMnZDYUZ2SWNBNElF?=
 =?utf-8?B?YUUzc3lQbnFmUW5DaGZPS3dHMUF0S0d0b1FOdDJpTzRXTm4xaEUvK2FPVHNy?=
 =?utf-8?B?UStxUkJVOURJMWtTa3ZnNkVnM0tiN2VZaHlzQWxzWnFtZ0RTb3JRd0drTEJn?=
 =?utf-8?B?UmxHUkVhWlNCREQzdUxMRDYxc2o2T2Q3NUtndVRrTm93UGVUMGQxSlZ3WnEy?=
 =?utf-8?B?TkU2d2g4WVg4enRVd0RwOUhDaDFrVTVFbFRoOWluOXZyeTdCNmMwQWRRSDlZ?=
 =?utf-8?B?clJISjZwSitFUjNwdkhlTjUyUDUrNEFpMmpzcjYxanJmV05SalNkcERKYk1H?=
 =?utf-8?B?czc0am93MGFmeEw4RCt1T2t2eFNjUjFMOG1rR0h0TFhCVWF1REFPeU5OaTJM?=
 =?utf-8?B?eDVwVjFhOG9yNlJJUTdHRHowNWFvQW9GWXRQVFdSMmNJdnVhZWsrSzhMWWtk?=
 =?utf-8?B?d2RFYkx4WG9ZWXpaVklOUGltMGFFWlQ4TWlUcnp4RUFhY0t2UjgzM1U5eGtj?=
 =?utf-8?B?alBKQzEySG55NmNSUW0yL0RvQ3RiUWRKN3VJUlV6eS8yU1JKVDBIcjBrbmtE?=
 =?utf-8?B?dDdoV1lweG91aUNUTHJHVXdiWlJCQStrVjQyUTVtay9KUVJZbUZtNEpXOG1o?=
 =?utf-8?B?WEdOYXB0blVvUHBvMFByZmJTd2tjcFlTK2JNN2pDTGhUd2xNVk9Ua2g5OG5V?=
 =?utf-8?B?SlNkeVBUSk1EWSsxT1dROVJlUExGa3pZN1h3VjdsUGg1c3ptZ1NPNnpsL1BC?=
 =?utf-8?Q?nmIvH8tsbjvjk5MLUKzeLohais07T9YdOKX8CRHBSz6a?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5117abe0-dbfe-44df-f80b-08de09ebc225
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7277.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 00:02:11.4128 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uKodk9fCaJTY9eWqDT5b7I/IerVlHavbXGCyKGpnvLWvgCXlkJlvYySRKhKPrbkzz4HQtUlfyb7k0LgoMYDa9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6134
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

On 10/13/25 02:46, Lance Yang wrote:
> On Wed, Oct 1, 2025 at 4:20 PM Balbir Singh <balbirs@nvidia.com> wrote:
>>
>> Extend core huge page management functions to handle device-private THP
>> entries.  This enables proper handling of large device-private folios in
>> fundamental MM operations.
>>
>> The following functions have been updated:
>>
>> - copy_huge_pmd(): Handle device-private entries during fork/clone
>> - zap_huge_pmd(): Properly free device-private THP during munmap
>> - change_huge_pmd(): Support protection changes on device-private THP
>> - __pte_offset_map(): Add device-private entry awareness
>>
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
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
>> ---
>>  include/linux/swapops.h | 32 +++++++++++++++++++++++
>>  mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
>>  mm/pgtable-generic.c    |  2 +-
>>  3 files changed, 80 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
>> index 64ea151a7ae3..2687928a8146 100644
>> --- a/include/linux/swapops.h
>> +++ b/include/linux/swapops.h
>> @@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>>  }
>>  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>>
>> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRATION)
>> +
>> +/**
>> + * is_pmd_device_private_entry() - Check if PMD contains a device private swap entry
>> + * @pmd: The PMD to check
>> + *
>> + * Returns true if the PMD contains a swap entry that represents a device private
>> + * page mapping. This is used for zone device private pages that have been
>> + * swapped out but still need special handling during various memory management
>> + * operations.
>> + *
>> + * Return: 1 if PMD contains device private entry, 0 otherwise
>> + */
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +       return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_entry(pmd));
>> +}
>> +
>> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>> +static inline int is_pmd_device_private_entry(pmd_t pmd)
>> +{
>> +       return 0;
>> +}
>> +
>> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
>> +
>>  static inline int non_swap_entry(swp_entry_t entry)
>>  {
>>         return swp_type(entry) >= MAX_SWAPFILES;
>>  }
>>
>> +static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
>> +{
>> +       return is_pmd_migration_entry(pmd) || is_pmd_device_private_entry(pmd);
>> +}
>> +
>>  #endif /* CONFIG_MMU */
>>  #endif /* _LINUX_SWAPOPS_H */
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 1b81680b4225..8e0a1747762d 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -1703,17 +1703,45 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>>         if (unlikely(is_swap_pmd(pmd))) {
>>                 swp_entry_t entry = pmd_to_swp_entry(pmd);
>>
>> -               VM_BUG_ON(!is_pmd_migration_entry(pmd));
>> -               if (!is_readable_migration_entry(entry)) {
>> -                       entry = make_readable_migration_entry(
>> -                                                       swp_offset(entry));
>> +               VM_WARN_ON(!is_pmd_non_present_folio_entry(pmd));
>> +
>> +               if (is_writable_migration_entry(entry) ||
>> +                   is_readable_exclusive_migration_entry(entry)) {
>> +                       entry = make_readable_migration_entry(swp_offset(entry));
>>                         pmd = swp_entry_to_pmd(entry);
>>                         if (pmd_swp_soft_dirty(*src_pmd))
>>                                 pmd = pmd_swp_mksoft_dirty(pmd);
>>                         if (pmd_swp_uffd_wp(*src_pmd))
>>                                 pmd = pmd_swp_mkuffd_wp(pmd);
>>                         set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +               } else if (is_device_private_entry(entry)) {
>> +                       /*
>> +                        * For device private entries, since there are no
>> +                        * read exclusive entries, writable = !readable
>> +                        */
>> +                       if (is_writable_device_private_entry(entry)) {
>> +                               entry = make_readable_device_private_entry(swp_offset(entry));
>> +                               pmd = swp_entry_to_pmd(entry);
>> +
>> +                               if (pmd_swp_soft_dirty(*src_pmd))
>> +                                       pmd = pmd_swp_mksoft_dirty(pmd);
>> +                               if (pmd_swp_uffd_wp(*src_pmd))
>> +                                       pmd = pmd_swp_mkuffd_wp(pmd);
>> +                               set_pmd_at(src_mm, addr, src_pmd, pmd);
>> +                       }
>> +
>> +                       src_folio = pfn_swap_entry_folio(entry);
>> +                       VM_WARN_ON(!folio_test_large(src_folio));
>> +
>> +                       folio_get(src_folio);
>> +                       /*
>> +                        * folio_try_dup_anon_rmap_pmd does not fail for
>> +                        * device private entries.
>> +                        */
>> +                       folio_try_dup_anon_rmap_pmd(src_folio, &src_folio->page,
>> +                                                       dst_vma, src_vma);
>>                 }
>> +
>>                 add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>>                 mm_inc_nr_ptes(dst_mm);
>>                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
>> @@ -2211,15 +2239,16 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>                         folio_remove_rmap_pmd(folio, page, vma);
>>                         WARN_ON_ONCE(folio_mapcount(folio) < 0);
>>                         VM_BUG_ON_PAGE(!PageHead(page), page);
>> -               } else if (thp_migration_supported()) {
>> +               } else if (is_pmd_non_present_folio_entry(orig_pmd)) {
>>                         swp_entry_t entry;
>>
>> -                       VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>>                         entry = pmd_to_swp_entry(orig_pmd);
>>                         folio = pfn_swap_entry_folio(entry);
>>                         flush_needed = 0;
>> -               } else
>> -                       WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +
>> +                       if (!thp_migration_supported())
>> +                               WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
>> +               }
>>
>>                 if (folio_test_anon(folio)) {
>>                         zap_deposited_table(tlb->mm, pmd);
>> @@ -2239,6 +2268,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>>                                 folio_mark_accessed(folio);
>>                 }
>>
>> +               if (folio_is_device_private(folio)) {
>> +                       folio_remove_rmap_pmd(folio, &folio->page, vma);
>> +                       WARN_ON_ONCE(folio_mapcount(folio) < 0);
>> +                       folio_put(folio);
>> +               }
> 
> IIUC, a device-private THP is always anonymous, right? would it make sense
> to move this folio_is_device_private() block inside the folio_test_anon()
> check above?
> 
Yes, they are, there is discussion on file-backed mapping at
https://lwn.net/Articles/1016124/. I don't see a benefit from moving it, do you?

Balbir

[...]
