Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D/4LU8vnGkKAgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:43:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 120DE1750D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 Feb 2026 11:43:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBC610E2E7;
	Mon, 23 Feb 2026 10:43:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="m330Eq5J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010036.outbound.protection.outlook.com
 [52.101.193.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9B10E2E7
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 10:43:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRssqR5fzA98hFjo/IbImrmUDxOYTeRnNf8rccUNJnvX5B/Y5rkz3EZ5bcWicVBaq3rIno2YTmQKD4hbgyTMUqCD0UORAi7h6tO5f2z1+p4773gSAmNtu1Sw08G3mLPck3J1jth5CYeyonIu6b0obOt0gMPYtXtLpP/iI0CHUwLWX+yVBk73Hxyxg3LcbfpL/8MMvcWwNFPaUvIIjj9rp+kXx3CMVnNUnY67F+WVbcsJn0O/O7BJtSI1jl9KC3ZVteUoQtVwFZpRU7qLA87ljdIbTgB4RjeoAYUHIrWNG+Q0IXStW7cY2kI546Pfqdea2Nst2EGNgxoi0TS1HfwMeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2rZ5oiLoMmxHQdwIw2AP0PYICAXTfvzy9m/W/yUJzcg=;
 b=L7KNusf5/t364oF4rP+wZ73Qs2aXTBoVXA7X8p7ctJOzQ9SQNKV/cVL9wsWoQX3fNHjNdobBvmnBcXgSKDGAwyAg44lNCRUnppbPX7qGM1gkaNHvIvLShSGENjk6LwcAWmNDorpP760Nud3Q0Wq/CK7M5NPX/OXR9K3L23N0zjm0miSVyMZIzx7B4ILRwF38IyX/gjJHymZ3FW3JoNSZUMFULA+yRzQMG/BntnRZU1cnztnIT3OksXbuFg8Oa72zA9nIkIIYTQzszGoVkkK6rDcHJullbw5n5wSi8ZI3ulEnegaUb5Mgm8e9N9txPajHExEgofmJZsJysZEEqSxQdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2rZ5oiLoMmxHQdwIw2AP0PYICAXTfvzy9m/W/yUJzcg=;
 b=m330Eq5JrkT+rAbyisLpS0rFn0JreHnOFd8q/RBJV+yXg73pHX47AvyrhQLz1/RJh8NWhVbwnfq71pm6C1EK41VaX2wi8PmLyEcoOfLAmZ2ukjhwLQZybc+Wp5PKBj+1wdLX+yxtJGxS7k5rqfIewjnkvfZMz3tqO9q2I7UOfR4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4290.namprd12.prod.outlook.com (2603:10b6:a03:20e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.19; Mon, 23 Feb
 2026 10:43:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 10:43:19 +0000
Message-ID: <6035523b-c14f-4e79-9d35-c045aa659456@amd.com>
Date: Mon, 23 Feb 2026 11:43:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 03/11] drm/ttm: zero page->private when freeing pages
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
Cc: David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-erofs@lists.ozlabs.org,
 linux-block@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20260223032641.1859381-1-ziy@nvidia.com>
 <20260223032641.1859381-4-ziy@nvidia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260223032641.1859381-4-ziy@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0927.namprd03.prod.outlook.com
 (2603:10b6:408:107::32) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 078fce53-9ae1-444e-1c92-08de72c85bdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eENzemJ3RHVrWDF5TjNSZ3NKMlptaGNIK05hYkFsQ0hCMWhyUzdaam1jT3dI?=
 =?utf-8?B?TytyT05zcjM0Qy9XUmtqd3JPOWs0R0ZYSzZoV1Z4bGIrbDVQak9XVVA5cE1N?=
 =?utf-8?B?L1VibFRLNUZFblBpTlNncTJzZVU1U2tCRzc2cEprd2V2dExGUSs1V1Fwa1B5?=
 =?utf-8?B?RFFSTlVDQ1RGYlNTMGNMOGljL2FCQ0R0R0FGSzNVTUxlYnJZLzlraEdkVVB4?=
 =?utf-8?B?MTBLdC9DYU94ZFVwR2d0c0wwQWxpNnRnc1VCQkN4MElFMS9Nd1hDRS9MVVd1?=
 =?utf-8?B?MXNWR3U1b1NRbkY5b1NtZE1WS2phODQ1YWxacUJZOVZWVGQxbTN6OEppaFls?=
 =?utf-8?B?ZmhZQjM2Q3R6U0wrS0tBazQwMFdEN3ZNd0g4SS9saC93QVRzLzJwd3p0Tkp2?=
 =?utf-8?B?c0NYamlQZUZkVS80aHRQUlVWR29GbE9uZy9HWWdmVXJndWFTS3h6UEpVTnIy?=
 =?utf-8?B?OStNazNZc1B6TWJKWUk4cFFDV2oxVDdINXJ4UDVESDVLRzFsTXkyYzI0aFNi?=
 =?utf-8?B?SWZIb2Vnbmc2WGd6b25ZVlRpYXBsSEhhWHlabDNKNDA5VE1ocWhIRVBTbTBC?=
 =?utf-8?B?Q044RlBjZVNQUkgrV3pwY0NuVHBiZ0ZFTlJZb3NxaFUvcEN3SUhvZXh6V1ZG?=
 =?utf-8?B?U1JBV0lKMzNVYndSaTFxODhkcGltV29QaXY4MTZEMFA4cG9uTjR6VG1EU3FR?=
 =?utf-8?B?Z0pwYnFYU3k0d1JDSGpzWDIva1lnMkw0eUNMTW1ra2o2NFRQOGNCcG44RjBE?=
 =?utf-8?B?cmxDSjUxdnBjbnh2YXhUUjlEMkltdzdvbGxYTU96U0NPbGpGYnVNU09qRjhE?=
 =?utf-8?B?S2F3SFo0Q1lnTWZMS3JzaUFLcE1TN1J2dHhERTNKdVpQeWoyYzBqYWo0aVk1?=
 =?utf-8?B?UlE5TVhja3ptV21GN0N3YlcxMGNYQVVWOUdWRUQzdTU0S2QzdXl2NlVVdElJ?=
 =?utf-8?B?d2xiTVlnaWN2K0NsdVpmb0p6MExGWGVrdUVRSm5QWVpLZEludmNUQ3lQdWFL?=
 =?utf-8?B?QmxrMENaTEpMSXFkVm9YQkFmTVBuaTVLdmg4Y3ExOVZoVHJLbWppMlJXSldT?=
 =?utf-8?B?cGtUMmRBUDg0M3BhQ28rNVpxWjhLbC9HZ2djUXI1ZCt0TktLeVg2UUxOc3Iw?=
 =?utf-8?B?d2p5UDdoZ01HeVE3QzVFT3BleXhGZkh4SFFYSVNLdm9PTlY0M0VHa0l5eFQv?=
 =?utf-8?B?UTNQMzVRTHV3aWc4cDFUbitrWDIweERXWVBUd1k1aWZRQzVzalN5STVVckpX?=
 =?utf-8?B?TlloamYwNG5JU3JiRUw5M0Y0cG1oL2RlTnltUWJuVWNCeUtweUVnMzY0QmNU?=
 =?utf-8?B?bnY5a2k0d0xCdUJCbmoyNkgvNW52TDZQSjE5UE9ZOGVOMkRaa3hHcEtyRUY0?=
 =?utf-8?B?cHNSRzJNU0xsYWxPSjEveWlLZzJNSHBLd3hhb3Jqb3ZXWDJhaVkrSWZEdGMr?=
 =?utf-8?B?S2tQcXFGbjN5enU4QVZGM0JGSVVBK1N3UWkxVkZKZHlHMWVwSVNTMmRuTDhl?=
 =?utf-8?B?STk5MEJJalorY2R1MExtMXRDUEx1bnl2ckFkTHUzbENuUEhXTkFQWmtxQnU3?=
 =?utf-8?B?YnBwZHVqS0YxRGY4YXJ1SVlxTHRmRVZyNXZLdjNxamgwdlovcGx1Tk9LbDBX?=
 =?utf-8?B?OVFEWGM3Ym5GZnpKUFdHaFBzaUhNSzhiQ2lmdWxBZzRBLzlpV0Vxck9lWm8v?=
 =?utf-8?B?TWZrTTVpamFmeWNEVlRKc25vMUNYRHBUMUJKNGlCM1huMmI1a1RJaDB4czJx?=
 =?utf-8?B?VFpQamFGelRzYWs5N3VvOTlmcFFhais1K0JvTEh3ZzhXZjlXU21JM0kwWnlT?=
 =?utf-8?B?WjRDUnl1QmFxR2lKZ2ZFeVNraGxPbUlScWQvU0NRZ0FmU1Q1QXdsczhVeGhu?=
 =?utf-8?B?TVA1ZlJhZERIbS9pTHJuRjNlUGMwdmQrQUJWemswUjI5TE1CM1IrdW1aUHh2?=
 =?utf-8?B?d0lKbWt4TVgxSnhneDA3cGpMUUZXb3lCYjVyZE43RGliZTB1T0pqcVhuMjJp?=
 =?utf-8?B?ZjF6NlVSb1pLRUxOV1BlNlRLWmFPYm53bmk2OUc4ZzU5TllnSGRKcWhqY2VF?=
 =?utf-8?B?K1QvNHZTWDB0U3ZXaldqUmszaGVnMDVaRnhBYVFpV2VEL0cwZVFpM1pBUEFj?=
 =?utf-8?Q?eexE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a21zVDNjYTZtMk5EejJNTzBNcDNPVFprS2lCU2VqOHFOUzdvZUhwSSs4bG8y?=
 =?utf-8?B?Y2V3RFF5TWtaajJYWC92QlVWMTVXSnRoNUJxQUxSQ3VpRWZ3WnVOYnRDRytk?=
 =?utf-8?B?TktiR1EwZ2htdmUwd2wrclE2cHNodzBzRE9GbzdxMWxyT2VtVzZlZmljRlJl?=
 =?utf-8?B?dFpKcCs2TlhyZlpUNGlyNW5sZ3NodEh0Wk1CdGNOK0h6YkRVRHRPdU4ybzcv?=
 =?utf-8?B?eXZ2UDZNVDdZand2MHY4Qkdkd0pjcXNRdUJ6emZWRHdTQXg1MGVKUGdRdWsv?=
 =?utf-8?B?WXY1NE1VdE1lVE1WZU1FcEl1UzYzdm5hcUpSbHJBUTZIbU1DY0swSGRvTWNQ?=
 =?utf-8?B?N3JlanpSN0EyQjZlMkN4ck5KTG5HUEJJWm9ET3kwY0p0ek5qTzJFLzZIRUxO?=
 =?utf-8?B?VjRyMS9yQWM4bzYyWEFJeVpVY2NsN25qb1ZXYXFENzBtQ25UeDdiUXRyNis0?=
 =?utf-8?B?MjRiWnJBemhnaHdiVkk3L2FiZzdqV05hSWdzWmxlZFlRUi91cjFlSVdGUXRU?=
 =?utf-8?B?ZDZHTk9JcEprNkJzK0lYek9jcHlDaGtac3E2SUtuWTQ3bFVjQzZLMVJZZ0hu?=
 =?utf-8?B?YlJiazl0cTg1ejE1K2xEbXZsZVBJVFNtSndLRVpoaHV5b0lvNFJ1T2NzcmR1?=
 =?utf-8?B?RHB1eGZGOUNUOW90eVZGZlcwMjV2cm5yTzZRRUxHSnhibUdlTHNDdHBhT1Jw?=
 =?utf-8?B?bjkvZWwvZW1ITnRBMzgwelB3OTRvaWRlQlArQjlpTG9UMGY1T3ZJRVdTbWMz?=
 =?utf-8?B?ZENPK21GS2ZoTG11NU9LVkRYMTJZcnhKWWg3QXY3QnJSQkVtYW9nVXV1SE9B?=
 =?utf-8?B?M08xY0FPcUxsQmNlRE5sUWxNaXBVaDJDSjVnNEgydkgvRkZxV3JncTZ4MUdS?=
 =?utf-8?B?Zm1BSlFxWXZLZnpsWWswcWplSml1ZWVBOVdENXBoWjkxd0QxREFiTzFFTS9z?=
 =?utf-8?B?UDRTQ3BuTjZqZTV5YlhVT2Exak5Fc01JZzNXSWwxNkw1czF3b2gxMTdKRGFh?=
 =?utf-8?B?QjZIMTJKQ092b3dMOWFYdzF6SGI4QVU1UEdwZktBWDhiWG9MaHBGSW1aUTk0?=
 =?utf-8?B?amlkd1JSOVJNbWV6a0ZxMnNZRnhpMnM4TWtVNkdtWFd6UzBnSHFHbFhUTlVP?=
 =?utf-8?B?MUZBaDY2Z2I0NzgyYWt5d2ErV2ZsMGpVeG5IUHl4QlhQYkR5RXJaTmNYZG1T?=
 =?utf-8?B?cWlyRzVQZlpmbGliWXdRMXptZllpNHB5V1k1YTFyYlpYeEgzaHVQNTJTcytQ?=
 =?utf-8?B?akRncno1Yk5ZYXhVeDNnc1dSTmNtQWhrL0NZcjhjVE5XL0xQWHNsMGhGZFRN?=
 =?utf-8?B?bHdZQVBVQ1pDRVluTnoxdm5VMS9uTlVxdHhmakNVZi81UzNWVjVCdHJkTzBq?=
 =?utf-8?B?MHA1QUQ3OUZ3bnoyYXI2KzdaTEsvNW4xa2pVZ0RtMVA0TVFlUlREU2dIOU5m?=
 =?utf-8?B?dE1MYnZWRkgydE8rN3pkTklQcFlEWldTYnRNSGJhSHJRSXJBbDZuc09IM2Rs?=
 =?utf-8?B?RU50SmgvY2hJd3U0dXJ4b1Q4ZzhnaWFwU0M5d1M1UnByQzJuUmdNNGI5VDI5?=
 =?utf-8?B?czBwREMxSWdZOVcvd1FXY09udXZMZFNKR01JaEZTbzhheXo5U2VkT3BId0ZZ?=
 =?utf-8?B?bXJDRjN3S3BZU2NzY1pXODJrd0JWWWZFZE5ZU29uOVZnZ1JudUJVSHBJVlpv?=
 =?utf-8?B?S3FLc0lpTTlpeklHeU9TMTVsLzdYbkIycEFSV0t4SUJWSmNSTzhFTC9rSWhq?=
 =?utf-8?B?V21OS1k3c3Q1QnI3Sjh2cWI2d0ZFcGJoU2l0ZWZlL2ZNeStkU0ZubmJJRmdy?=
 =?utf-8?B?NzFFVTgrblVuM014TDd6d3B3MVllc3VBTGZJdlQ3OXZqZHBjeHVhWHN0Vm9m?=
 =?utf-8?B?MVg5eGdwU2d4STdCSUJ2Ukh0MWFSRkhnZUtYOWI4TVhrQmVzRXdKNlN3Lzdu?=
 =?utf-8?B?ZnJLRnFWYnQvZ1dTTzl0Vmh1dDFvZ3J2SGV0V3dpWGdUR3BVTFMySnQ2WFpN?=
 =?utf-8?B?SUEzMmpLWUVoYm14MHZXbnc4M0NkazJIV3VVYnFQb0RqWHZzQXVLcEtxRjZk?=
 =?utf-8?B?Y0wycHBqdXc4MDJhQWVzUWZBUkNBYjR1OHlnYVdVL2JjSysrWUFSYzdudEY1?=
 =?utf-8?B?alB4bVkzeFdMWVlwUTBpM2ttSjJ1MW1XUUVUYmY3Y2txZnBXKzZSVmd6WlZC?=
 =?utf-8?B?azNjSVNPdFRFWk92Z0NmSGprS1ZVbUt0MkpIS1dOMW1IM21YVVB3ZC96ZmNV?=
 =?utf-8?B?bFJvMlBTNXBvRDQ2eFVTMDROUUJ0ZjQwK0dvbHQ3cVdkUGttZkw0TWV0Z2lo?=
 =?utf-8?Q?vbVlUndyGL59d2L/lJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 078fce53-9ae1-444e-1c92-08de72c85bdf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 10:43:19.5733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6QvF/Po8I0MMqGs3x+Uyblag890a7QrADX1NUDra4w43mubpG3P0IjKi9uq8UPe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4290
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:ziy@nvidia.com,m:linux-mm@kvack.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:linux-erofs@lists.ozlabs.org,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:ray.huang@amd.com,m:matthew.auld@intel.com,m:matthew.brost@intel.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,amd.com,intel.com,linux.intel.com,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,intel.com:email,nvidia.com:email,ffwll.ch:email]
X-Rspamd-Queue-Id: 120DE1750D6
X-Rspamd-Action: no action

On 2/23/26 04:26, Zi Yan wrote:
> This prepares upcoming checks in page freeing path.
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org

Acked-by: Christian König <christian.koenig@amd.com>

Question (which was potentially already discussed) why isn't __free_pages() doing that?

Regards,
Christian.

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index 217e45958099..a85cf1582dc8 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -210,6 +210,7 @@ static void ttm_pool_free_page(struct ttm_pool *pool, enum ttm_caching caching,
>  #endif
>  
>  	if (!pool || !ttm_pool_uses_dma_alloc(pool)) {
> +		set_page_private(p, 0);
>  		__free_pages(p, order);
>  		return;
>  	}

