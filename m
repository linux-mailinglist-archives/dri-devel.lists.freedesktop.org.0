Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F70DAD53A8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 13:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1B010E621;
	Wed, 11 Jun 2025 11:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YvXzubxf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC92A10E622
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 11:19:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lmn151E2Lwluh6100Fcvs83imdmZWIFoZtIbiJNGEvCsIzGUQLDKepZvWOGcbxY73WFrV/BEotDovaJFYqYwOcTXw824PfL59V+Dwb0joAxmlJPsH52iOn1p7I7j+mANp2mEETDocxFp+RyAbSCMMyT4VPBvbPdMdfwQ+qarTX+S/oVpeNazeqnccwdQ3pzFlguYCIBVP/bCd6C/5YC1HBT809XQqIezyUFOaSCyEKghX+elcv8JYaNKwZiHiSNyPXaVMuUoZtHjXW93t4rxSnggoynDVUGB9h/dnkvcCtv+L6Yai6mvSIRlM6ln3h2u1wQBp4x4Q9L8E8y07oIX4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZFUedRIyTt2O4SD8rVHjFJlSmhpBCwzRP9uYCBd3kw=;
 b=g08OMl3RuzRKQtjkMo3npv0i/0oEiHLxNFgEu9DL1mVXAgYjr0PKZ1rwDSesqTt+2WKWit3SNqNp6vDakpHWeLsyWHe0tRr+km257jP24XzyMeY//P8E5O/xmR5K2hdqI1blJHG5uQKOxiKhBm1/797HRGChPQotgiP/B2SUXtY272H9j57yZKEp8mfQwfPWnhyhFkRX59xltAe4HCLBiBoTOJGXgjOQbpiBIXO5Sz5vop1VkpZf0hkXFvI8u73E64VzcCRJ+AuvqLIeL+n65iRxD3aEkSempSmISSud/VoVxQ4Fn55A/coSuDXgt29DZ73nubm80wwe+MbQfHWMjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZFUedRIyTt2O4SD8rVHjFJlSmhpBCwzRP9uYCBd3kw=;
 b=YvXzubxfPBzBzqRKZVrUzXKFXdWAQatk2FFraaKyQL5i4UH2HmWv54VebpUBXHPmKRwu8C4jeZDJf4XOdTAAEtlazq77kjp1qL++XWzii7bY8kdCnbdp9aP6wRyYrKd/bGKBi4/InjySb6IOT8f74vuxqqZV9v/ec0jMwI7Fn/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9332.namprd12.prod.outlook.com (2603:10b6:408:20f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.35; Wed, 11 Jun
 2025 11:19:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 11:19:48 +0000
Message-ID: <72d0a2fc-7387-4447-b556-5fb77fb34e79@amd.com>
Date: Wed, 11 Jun 2025 13:19:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v3 2/3] udmabuf: use sgtable-based
 scatterlist wrappers
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org
References: <20250507160913.2084079-1-m.szyprowski@samsung.com>
 <CGME20250507160922eucas1p11bd044bb458626dc0004bd2fd83605c0@eucas1p1.samsung.com>
 <20250507160913.2084079-3-m.szyprowski@samsung.com>
 <7a6475cb-4ebe-46a3-92a2-f29fbc8e5e41@amd.com>
 <c90bf515-9050-4ed7-b733-28b14536b913@samsung.com>
 <3d65e71e-5847-4c0f-98ff-318086f14ee2@samsung.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <3d65e71e-5847-4c0f-98ff-318086f14ee2@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9332:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c67e6f2-55af-4fb8-3c6d-08dda8d9e097
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S05aOFVHOWp1bjVDWDJzUWpJMVpFMk9RdW5nNGh2QjZ2MHZCVlIxTzUyeGZD?=
 =?utf-8?B?djlYUEljenNIUUsvQTFIdXR2dktWV2JBSlluZEdlUHZXT2VoS04zY2xnbWJ1?=
 =?utf-8?B?NGFQQ1JzZHlvQUhkSEhPUHpQb2hWQjU2MzdEVEFhVTRZZXJ0VEpjSFdyMFJC?=
 =?utf-8?B?VjdqN0pnbHdNbThwNjIrL21YNVFKKzBlWE92NlRRQzl2dzR4V0pwVHBaa0pu?=
 =?utf-8?B?MXNML3pCblRIc1ZqT3FYRUxadGJyWjZrNFhOcHBUTTlIeHc4aVVOaDNKMmZ2?=
 =?utf-8?B?Q1pLRnNVa3pJRHR4clg5c0M5cUM3TGxtUnRYR3p0ckI2c1hrWFdkZEJDYlpR?=
 =?utf-8?B?a2Y5SGRVdVNGY0xTTi9YeWIzd2tpbDJYbnhLQlIrYzV2TUxaeTk2WmJrM3R6?=
 =?utf-8?B?anYwRFkvQzRNVyt2N1RYZnJ0WUxlbTNDY3c0RzluWHgrLzErd2hVejl5VUNE?=
 =?utf-8?B?WlJabDFxRE04eDhtTFpPRnRoTU9Lanl1ZWpzSmtyS2ZSRk5TK3oxd0VFR0Rk?=
 =?utf-8?B?MHJQVGVoQ3F5LzZTdnFQWThBZnRzSXhOT3RhbGpLZ2FxcldqZnR5RStGdGZ4?=
 =?utf-8?B?OU1kcXdjUnRkWVBJdSsrcEkwTHZUOGU5MFJtaEVKTGFDd2lhdW1uV0xUN09t?=
 =?utf-8?B?ZDdRbVBzeVdxdDBaYVZ6NzRNZXQ4RkM5RkRwcGNyaUtwa3E4U3dIaHpLZ1R2?=
 =?utf-8?B?UnlUeHZaeC9IMGJlSWplN3lTRkxmRUlVNWdMc2VJeFBTc2l2VGd4MTZxbHhS?=
 =?utf-8?B?azhjR0tCWnNjRzZITmpOYUxwZG0rWkFvL2sreW9SRVdpTnBpQnErTzFPeWF1?=
 =?utf-8?B?UitMQTJBSW1rY2t1Y2NRcXNHWXFZdFgyaG9RTmdoSzBCYlgvcWY4Z3FJNndp?=
 =?utf-8?B?Nk8xejVEWEE5R1MxcWR1eS81UWZ5OWJPVUk4cEhKdzMxRTdudmthOEpQWXJ5?=
 =?utf-8?B?SmR6U1NoeEdPekRXWXFjVG1ZYkRVMGQ2NXRMODlTbTUxdHMySG1OOGhPUlRU?=
 =?utf-8?B?emxYcXhCK0lCTVZWaTVVWm1wY2xvK1dVTXdNbjBJK2R6ejhNNkY0bEtxNWFL?=
 =?utf-8?B?YzdvZlZYdzNrWW5rTG00T3lPbDNONnlJenNPZkJHODAvQm4rNHF1RzJKRmJ4?=
 =?utf-8?B?WjFOVVdneWNqSW9FdUswc2RPSVNIbXMxem82SnpZcVgzNjUzbG15SXdsYnRx?=
 =?utf-8?B?aVc4MnVLR1NyUEtkMGxIOE1NRkU4akJXS0luajMxNUhvUXhlSDNzank3bHFn?=
 =?utf-8?B?YVJxVzYxdXFCTlNTSjBFaVV3Nk9PV1ZhZzBwVXcraS9PME40bXBoT1VXWEpE?=
 =?utf-8?B?RzBFVWdzY3lsYkhKdHNwdDA1NnE2S001OXZ6d1N3bmk4azAzYmFKc2llTUg5?=
 =?utf-8?B?aUtLOFdwdHZkeWFLbnJ3TjJ5dEt5SnNXSzlmMDhHYWMyR2RrTUZybUtyYkF3?=
 =?utf-8?B?TGJhUERRcGx4RjhHbHdsdWhFWTV4S3NlRzBBbnZZS2lJNlA3NnhEZEVUc2dn?=
 =?utf-8?B?Z0ZWV0JnRXBGNkY4NGUzZXA1OUtkNVErU216MXNZcmV0UE9Pc0lyMHpBbDdT?=
 =?utf-8?B?MG05WUtramxYYzBFTStOY1JKSGhadVNUYjZFNHVUZ0dBUzV2YkpWVVBUOGVS?=
 =?utf-8?B?VWZyR1ZBUWNYbndRcXR0R24wUFhQUVNaNGxvVXRQZWp5dkltM1hOaEY3SUVR?=
 =?utf-8?B?TEMvZXJzdGVGZUMrcm1MUG12dHh5cTdYSTNWWWNET2tHZGtQWEhSUjlVUmtY?=
 =?utf-8?B?OXIvV3pTTjJ1bkpFTUxNbnJSeWtkSGhiY2JMWHRwSFRHVnQwV3lwRGRaYUVT?=
 =?utf-8?B?UXdTM1Y5dXBEaG1tcUZrNEgzbys2aStOZ3pXNmNpdXJXb1lXVmo5V3JRUHZP?=
 =?utf-8?B?VWxOMmFscWNPNjQyTU1ETXlhQVlPUG5ONXNodHQyenFtcUJrZ1lzMUdleGZU?=
 =?utf-8?Q?z3KGuKSchHM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dW1qRlRrd2JsdnI1MjRKQ1dVajFGeWo3cjBnQ1RXV01SNXNYNy9NbXFscWZD?=
 =?utf-8?B?R0tJUVYrK3FVcDdBUWRFd2JwQUp6b1dMSHQ4SHV1RFdQNVJiL3g2OWQvOThX?=
 =?utf-8?B?NytQV1J0S2RUOXhUUFNGVkp3c0V2aXFsWnJ3UXFtWXA0S09JSWp2cTE3bW5H?=
 =?utf-8?B?TmRVRXNzNlBFWmJnUGVqckhKTkppaUROd01uOE5CMUN5NzlQWGRtVHNaVnE5?=
 =?utf-8?B?M2Ivc0lCbG9HK01TS1JyN05ibUgybXRkdEFMZjNUcTFMR2VaK2kzemhmM2hS?=
 =?utf-8?B?Vkh4OEZDZHAyU1RranBYRGxDUVlvSkdTcjZhQjVBbVM1UTZaamRYYXk2TjFB?=
 =?utf-8?B?dTZiZ0NlUEVTTmxZQ2U5UldkTHh6OVNLWHNqNVoyenF6TjdTVEIxMEIzbzhr?=
 =?utf-8?B?dytNR3hLcFo2OXRUNE9BeW1HbUFNY1MwR0xUS0RQMm1naGdlOWNCU3ozeFdH?=
 =?utf-8?B?QnFsanVPOFFpTVZLVUJLcHU3NFREMTgzeHhSbXg1c3htQVVrcFJtOE9KbkFy?=
 =?utf-8?B?Vmg0Q290NkNtdi9hS25CTlpoOEVkZnYwT05zNTAyUDV5RHdhb010ZHJoeWlN?=
 =?utf-8?B?aTdaN0FmNWk2dm5TaXRYSmF0Q3NVWG9RNUpoMm9yOXJINTBDQi9wMjNkTDN4?=
 =?utf-8?B?VUtUMHdmMnB4eHllR0JQaXEzK0QyQjI3NEh6SXFzaDJDOHF1Vy9XSTNPN3Jy?=
 =?utf-8?B?Y3JuNmJ4aEdQRWJkWWJzRjIxaFhuSEIyblpEL21NMkRaVEtjVXJHaWhQb1V4?=
 =?utf-8?B?OFMvVHlmdmEyZWQ0WHB3NzJMSkJRdlZMdk5WbWsza1VmRW5xYkZZMkRuUGhW?=
 =?utf-8?B?NWxPMVVzYXZ1cGNXR2xjd1ByWnhxcmowdnpTdmIrcTdIUWlCS2hsSUxrelcz?=
 =?utf-8?B?VG5WdzhObFp5emU3NEVSbjNSL3pEVVZTbGRMQTN4b25FU05VNWwwbFVzTGt2?=
 =?utf-8?B?ZTNFcUc0QXR0bE5LMFNYYjhubDV0RThobXVJNTZ0enlsdXdjbk5ZcVFhSDhQ?=
 =?utf-8?B?RlVVR3lOQ1VNWmVGQkhrZG1OaHR3V1daSXFJZjN0TmF4VXlmcnFraEZXbk5u?=
 =?utf-8?B?WFlySit5a2VReWE2VlZaWlRaN2laUW9vODlhN0NZUDRlbmh4ZW4wU0tIbHFW?=
 =?utf-8?B?dXlBWlVvek9KV2NmZDBGbFpKT2phWDZrVG1IVUxOWEhGK0YvTnRPUHJ3SFhP?=
 =?utf-8?B?eFRBM1JjWWFWY0NKZkhJRFZoUERyOGgxT2JRaSsrRkwwSWFvVlpidGk3cnhk?=
 =?utf-8?B?SU9oVGtNWHgvOEN3ekd0LzVTekE2amVXQmhDeDEyMVNJc2d2RDJuUkxBMFhj?=
 =?utf-8?B?enFUcG8xQmZmdUlRU2plUVQ0Zm1odXhEQk9naEdwNmhoeUhhWXJ5c1BWR1c5?=
 =?utf-8?B?SUUrVThER0VzQnN2YUZUWG4vWjhuemV0aU1CdkhuR3k1S1VjdG5nRlJhTUla?=
 =?utf-8?B?ZnorR2h1MEo1Z0NtaDhXc3k5VFVzYUp5R295ZC9YWjMyaXlUcmNKMmlJUDBs?=
 =?utf-8?B?VGVLOWlIZVVOcHhpdTNMY0ZEY01CK21NY0x3b2FObzI5T0tIZ1dKZkF5MnJU?=
 =?utf-8?B?WGUraGxQejgrWFhtdnp2RTdaQUxyM2lPZHdwRmlsU2xFNDQ1NmFEbW5HdzdC?=
 =?utf-8?B?V08zbEVnN0V1dGhVYWNVR2NiQ2ZtN1IwZ014MEMzdHladWNhRFB2SGpiL29h?=
 =?utf-8?B?UTZxZG9ncG1PSXNZNkVSWXU0d2ltZHF3ajBSU3N5dUQ3Nm9yaWtpaWZvNVEy?=
 =?utf-8?B?ZUI2TmdXQ2d2TmJ5TTlNa1NJS1VtWFpZa3p1MmJRUkFvUG10K1BXR3RURHZy?=
 =?utf-8?B?N0RHbkVBWmY4UGlFOWN3SEVtY3Z0dmlNUUUvc0pMSERFbHB6eXA1S2p4Yms2?=
 =?utf-8?B?QloyZEpHKytTWVo2RGFWS3N3cDE5bnY5L3EzWENiWmhyZmZRbCtlME1iNUhS?=
 =?utf-8?B?NUs1KzRvbjhZSi9OeVFSQ0FqZUNuS1Bjb3lCT3pYbWF6VkVwR0tIUWZibkpV?=
 =?utf-8?B?YkZZYVpmT1NvVVp6VW5VVjI1cVpPWVpRZytWMWowN0cxSTRyc21KM1htUXVZ?=
 =?utf-8?B?Sk5lNDdRdXQveVQ2SVRlZ2xlc3QyVW1yTER4RWpCUktiMHJJSlBEYnhRNmU3?=
 =?utf-8?Q?DZy+CXqo6kvIKE5arz9OaEwkB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c67e6f2-55af-4fb8-3c6d-08dda8d9e097
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:19:48.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A3H1puPoU91zftYCg/EKBdHuE0ihyfRoHyL4hoOIKjWJWhoDOWLDjhbCyiQbakrs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9332
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

On 6/10/25 18:34, Marek Szyprowski wrote:
> On 14.05.2025 15:44, Marek Szyprowski wrote:
>> On 08.05.2025 11:57, Christian König wrote:
>>> On 5/7/25 18:09, Marek Szyprowski wrote:
>>>> Use common wrappers operating directly on the struct sg_table 
>>>> objects to
>>>> fix incorrect use of scatterlists sync calls. dma_sync_sg_for_*()
>>>> functions have to be called with the number of elements originally 
>>>> passed
>>>> to dma_map_sg_*() function, not the one returned in sgtable's nents.
>>>>
>>>> Fixes: 1ffe09590121 ("udmabuf: fix dma-buf cpu access")
>>>> CC: stable@vger.kernel.org
>>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>>> Acked-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Should I push this one to drm-misc-fixes for upstreaming?
>>
>> Yes, please. The other 2 patches have been taken by the media maintainers.
> 
> Gentle ping

Done.

Thanks for the reminder, totally forgotten about that one.

Regards,
Christian.

> 
> Best regards

