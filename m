Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD69A5F50A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 13:58:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D6F610E884;
	Thu, 13 Mar 2025 12:58:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="k9NIfC8L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2044.outbound.protection.outlook.com [40.107.237.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D6B10E87F;
 Thu, 13 Mar 2025 12:58:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nDa2jDZ99amrFtskZjOIAaZhse3y3y4/NNjGoS6lsVvUX02KQJ1Qq8CSzR+6kuKBYTPn+4Mi7fEQuNOXy5alvoBdDeEmW04GFssvP65PqO0sw3CiYXDPn8Yk5L1Nt6YPYVDrKhYUktImMurrNwfBsQUqqdNUEJoEZpVwcX3ppvAEqU1jiJscZ1UwrVmse9j5Eh0OtND9KMwinKhgwRFIacvuuUYu9FDtFH37bm7FJNwrCTmuo2tYKhYB/hIjcUt59sPjZM60qjFN4RqQgB1Z9Vsv9hssrBdX2g1HbLnCUyUBPlIPhIq/E1/C9SDYz+WwTlMBhdIRUpL2TjTMjwN22Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuzgTh9e76d/JQzkZJXRCeyGKNCHhJT1YuB1UW/Jx4k=;
 b=u+fOZ1Y8Qas54KrzX5lI67zvweEk1BwooxCWizQ01WJZaoUoMUn3NblWDJILfNvP1Imf8rf1XexPXwrPDK9oG4HdkEsSR3NgoaBV2o2nqQ03hXU9m3mcWxzrZCfkCzlkD1J/8yLyjm7GXIO9/ykYcOmnXkTAJryTfXVQMyBUYnGBczhYHeCQod0j3KjVhalGdAGocQM8kRsp+SN7KO2w4ug73n01S64NWyeJqY7ncB3K5aISZvKkwtBymlph0r4evW3t3f0LpIIUos3LoHMJAhWzhLdiJsDozJWSzoGehZJU5ZRjUbo8fWClARCOtDFFfXdq2+B/rR2Vyn4aNtmj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuzgTh9e76d/JQzkZJXRCeyGKNCHhJT1YuB1UW/Jx4k=;
 b=k9NIfC8LDtsTuhTaLjtGzh+c8BXWC1GU/0yxMG8lsytaucCh7mCvvc5S2cKAZIDlHA3DAuhZ8AjpEXGDDLmQFN+HlHhcjxCbyeODSi3Z0wjh/nE8XbLChbb1QK9fJcRTnrT10v/LU7L6YiIBmQ9IsueSuZLDL7A5i6ZodpBMfTw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPFC855560D7.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 13 Mar
 2025 12:58:00 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8511.026; Thu, 13 Mar 2025
 12:58:00 +0000
Message-ID: <50a6d33b-1b8f-4a3e-8698-1e4508eb3be0@amd.com>
Date: Thu, 13 Mar 2025 13:57:53 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/19] drm, drm/xe: Multi-device GPUSVM
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, apopple@nvidia.com, airlied@gmail.com,
 Simona Vetter <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>, dakr@kernel.org,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
References: <20250312210416.3120-1-thomas.hellstrom@linux.intel.com>
 <3c7950d8-75bd-48d0-9713-b76feea87a37@amd.com>
 <466cdc46b81b4e1a51fa1accee8f56487cce1268.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <466cdc46b81b4e1a51fa1accee8f56487cce1268.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0433.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:d1::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPFC855560D7:EE_
X-MS-Office365-Filtering-Correlation-Id: c60db6af-b2ee-4a08-59b8-08dd622eaee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFVvMzZJNW83VTdKT2ZxOE5CS1J3WGw4YklVV21Rdk1makxCY2VlK0g1N29E?=
 =?utf-8?B?c0pzTWY4K2kyZlZzbHFBOG9GMmgrcWwraXlvblk4L0tyVm9EcXg5WjBoL2F2?=
 =?utf-8?B?V3dqcm1YdFJSZnNUaHJaR0hJVFAyUGVxazMvZnFmQ3krcFdqSnpBaXFrQlNC?=
 =?utf-8?B?TmxuWndUTkt5UHpWOFNEQXBWT0kwSXM2OHpDbFdjOE5rSk8wMVVLMEZLNU5l?=
 =?utf-8?B?UGZNNmZ5U1hpcUlJUTYrNkxGM1V2SkJyZ0g2R3VHN3RFUE5vSjFYb3Vxemcz?=
 =?utf-8?B?QTRxNGdYUG1jL09iMEE1enBmVmFYQ3haclFwN3NJTGpPTEFsZnBhSGhEbm9M?=
 =?utf-8?B?L3hNNEQ2TmN5eFpXNVdLNXhxNzc0RjQxYldoYTFYNFBzOVhjNkJZS29NOUVD?=
 =?utf-8?B?elA4UGMvTGlqOENpRUtQK2xCcG5TMkduanY3TVFMT2FPdDRWanpMdW9wLzV0?=
 =?utf-8?B?QXdqZTRGZjI2NFBkSzRTK00vZ0UyV25jd1FUZUVjT1h3SG9rbmFLSnRLV2pp?=
 =?utf-8?B?T0F5NWJYMWVIeFM0ME1RUmdxc09GcWVwREJNVHNvT3grV05pNXBTS25sSWFQ?=
 =?utf-8?B?clFkaXpJb2lCQm9QVUh1RU0xN1h5Zk1sM2F0UWo0ankvNUZncm56NlVvbFRm?=
 =?utf-8?B?dlNMTGlKcEo0aGFjSFdScmZNU0J0bTl0ZDhtQWUrekEzTXRaY21PNGtBcjJK?=
 =?utf-8?B?WnI4S2JXWjZyMzd3OTNhT1ZCak5tK1hMeEhtNW5aR2ZBVkVhOXVpekJqYnUv?=
 =?utf-8?B?RW9NZDJxd1BoQklHMEZ0M2xETXR3OUMwVjhEbVV4b25wRHpsM2x1TWJaVlNO?=
 =?utf-8?B?dkg0Nzlsb2dvc0VJN2J6TE40VmJOQ1ErSFZiUGVmZSt2SXQyY2s0QVFPSEZF?=
 =?utf-8?B?b2RKZzRpbEtIMitjWjV1VkNFVzZNVVQ0NXF0Rkp6S2VDNm5PbWJZbWUwcDdM?=
 =?utf-8?B?KzBicnd0UjZpYVhhakh6UGZxamRrYVIrM09xQnQ3TWJGWTBIN3dsN3cvZ1J0?=
 =?utf-8?B?WmdMckJJc2MxK29wOTRRM1czQjYxZ25pV1dWMUVldkFPcm1COTRSTFVLUEs2?=
 =?utf-8?B?dDNUdzJ6WGpPbVlWS1M0YUtiVEFSNndMRm1MYlovbW41dXU4V0tSV1h2dTVJ?=
 =?utf-8?B?dmhPVVd5dlhYeHFIUVM1U3FJeTZJTVkrRVJHNVlxYUNOVFYvVnZwZTMwZFI4?=
 =?utf-8?B?Y2hJQW9DOS85b2tvOURzYjZSNVJIYXdIYnFjbTJ2QmZCZkorYXhYL1ozd2xE?=
 =?utf-8?B?QU1HTUhLLzJIRTh0UWd6NXFLdjh5eWt2WUhGbXROWERYZHhLZFljbEloUTBW?=
 =?utf-8?B?YU8xS3FVZmlXWkM5MWZSRDBkRWxlaEhxOFh6MytEQWhUdlBNTkFQTEZBbjBO?=
 =?utf-8?B?U1RiREtxcHpZUXhQWGpuN0ZxTVdwQTIzUUxFQ0dqOCt6MjFZa2JqeHhXeCsx?=
 =?utf-8?B?SjIxWTY2a0pacE00SWhlZEZvb09hNjg4amx2NnIrMHZxWEpXb3FGNzRhQTVa?=
 =?utf-8?B?WWdqYkFLYXcvdkhPRkl1ZEpWelg0dmZLOVVQZStEamR1UEJCd3BBSEFJSHB3?=
 =?utf-8?B?R2VKL1dyRzhSbTRxdTU1NWhQWUJDRVdUNVIxelNmb2pRdC9zZlh3ZWQvTGN4?=
 =?utf-8?B?Vy83UldLdnZuNzZYS0JoaUp1VStHVlRnRHljSVNWZUliejhSWnR5TGRhcnQx?=
 =?utf-8?B?eUpPTFh6SFQ5VldObjVObzcyaXN1RXVrTW5PZCs3RVhPWWQySWpmOXpkb3BW?=
 =?utf-8?B?TzVJaktDOWFZVURoRG03WGxubld3Y3F0VkpBTVA2dWhBUTUvdlozcUdtakxw?=
 =?utf-8?B?L1pwL0NSUHFpakptT3Y3MzVFUUJ2eHpnVXJ6UmwwYS9YM3lFT0JsQjltaTVs?=
 =?utf-8?Q?29kFq7qrBSUqj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDk4aGRNS1FscWV0OE81WnJxTVJpUFk1czhHcG03K3Nicm9jaG1QWnZZeDk4?=
 =?utf-8?B?TW93WHcrcVdhYjFUQUZJYVRpN1AyVWVBYXNrMXpSVE9MRjVZQ1Rkbm1TcjU5?=
 =?utf-8?B?VVRWRmhFcUx0UEJqM1NhQjk2TENFa0EwQXZqbkRyR1lRdEhQMjJmRDZFUExl?=
 =?utf-8?B?WTZqNzYreFFVQ1hvbERxRXo4YUZuWWMweUNna1UwMExsRFhrTEVZcHkyMXFz?=
 =?utf-8?B?MU5vMHNIU1JpRWFhSkoyQTdsVXBoVVJCdGdkc1M0YnNDUXpoQnBTUnp3QnFI?=
 =?utf-8?B?Zk13ZTNEV2lIUjhLMWVXRTB2MUdQbzRkMTNkZlB0UENsSlNNV0NkWFJua0Jo?=
 =?utf-8?B?YjVPM0g1eVdHcFVjdURBaGljZ3lEaCswWjNialkvSkI0OS9ZNTZwU0paWTZJ?=
 =?utf-8?B?N2pmb05mZWVlbXJ0M2FJZDBtVnRDWFhQcVFZd3BUUmNja2wxTUU0aU16OXVs?=
 =?utf-8?B?dUNpRmh6MDdUakYyUXNiYmJvU2VTUUpscnN2dmlybkNHWmo2ejV4Vzc2VFdm?=
 =?utf-8?B?TUlwdmNEZndWNTZ2YlJ4eHdpR3J4WmRYblV5a2kvaTd0NnEzVUUyMXF5WVhW?=
 =?utf-8?B?T1ZjaElRK1k0NEt1MmFNckpDV3JQNFYrWVRwMnNEelJsVmJHclFKR1dZUjZv?=
 =?utf-8?B?MktlNG4rL0NmQ3FucEtvQUhxK2gyMnY4UWk2ZkFmVXNNS2RwOG5VUWY1N2tl?=
 =?utf-8?B?K3E4MnRZOG5heVpvQUtTZGVKN3pxRkd5Skt0alp2WUtJNjNRZ0RhRzdOWVlO?=
 =?utf-8?B?QXZlMldta3V1VVc1K1VSdHpIajhNZ1J6UXhhSXZiOE45VGZ2ai9rcnR3eGo2?=
 =?utf-8?B?cXV4QUtCNVN6Vk5KakxGNFkyd2dGRmwvOE5RQzdUdXdiekZqVitOTFhyU29U?=
 =?utf-8?B?enhvVzd0SmRpVkVMeDVxclBpMnV1Y3ozYmRiWVhWQkpZUVpxTTZhK1k1dUxu?=
 =?utf-8?B?a3NHbXBZbUVwempFajBPcU1BOCtNQXNyb3Z0VHNHZ1FJTEFPWkU2bTgranMy?=
 =?utf-8?B?NElDOVl4TkJaRVUxZHljdDdwZ29ET3ppakZ2d0tUZ0U3NXF6VDFpNnVMTjM5?=
 =?utf-8?B?N1pVcUR6S0sycTgzZDV1MFBNa0J6Wmd1K3hBWE81cWhpVGEyalU1T0szbGtM?=
 =?utf-8?B?czFsVEFrRHZnL3lrUFlBMWVzZlBzRUwrRnJQWlJMTmE3RHJ0WHd6NUJ6Wk5M?=
 =?utf-8?B?eEtSUFlkaFB1S0xuWE5vT0xhN0J6M2tiUG1iUEs5MkZESmF1QUsrUG1FaVZE?=
 =?utf-8?B?TkJEVDA5NzE4VUtHMTE1MjNzVG9IazJGWU8yQ3R1VVBHR2I5TmdKcHFEdG1H?=
 =?utf-8?B?V1ZndFpvUDl5OEtPOVRrQ1NLUVdpMzJtWENWTk8vU0ZxSzN0UW02UUVENG1q?=
 =?utf-8?B?bnd2NGNRdm5zMmovRjZ0Q2IxQnhXZGZQK2l2dGpaWXlyWHE1clZDZG43b1ZC?=
 =?utf-8?B?b3VhOHBlZHdweEtBaDBsTXp0a0F2a1M1amk0NHRZTTZiSW15Vk56OXhRcm0y?=
 =?utf-8?B?UVBBSk5IN2RHeFFOdjZrT3VRSUQ4bDRXMTUvOUd6bDZKTnlRaGhDc01QcWNa?=
 =?utf-8?B?MUQvN3RwOFpJRm45Nkt3aU9VdTR3aEJkejJXbzA0SEk2d0RsaVEzOGhIWktp?=
 =?utf-8?B?VC9Hem14c0JJWHVONjB3TUhzZkgwOEROY29Dc1UvL1BPM3BxUHI1WkZTSVlP?=
 =?utf-8?B?bHR6QTBSQ2s1UnYwK25hVTNES1JNZnJlRmhyY25RNUxpVytQMmdZQWFaVE1T?=
 =?utf-8?B?QjlXVUVjeVdhRTFVWVl5NzJZd3dNQUdrUnpjbmo5cEYyUXFpNU94bjhZMzI3?=
 =?utf-8?B?dUhMZGY3aTlmVVpZaHdwUmpvd2REWmJQVUplNHJIREgvcU9lOHpLbnhZYkw0?=
 =?utf-8?B?UlRrdjNucmlRc2VUUWgzT3FicVhBSDFVVEYrajVpSy9WeDVrbW9HdFlhd0Qy?=
 =?utf-8?B?cTBSMGdhMmNDZDIxaE80Y1I2SlhwMHpIS0hyamRXalBLV1JWWHZuOWRjaUp5?=
 =?utf-8?B?ejhuUlppcFJuM2FjYTc1MWljMm14cWZSVlVuZUpRMWNXQ0pLSS84YXdISEU2?=
 =?utf-8?B?Qi84NDQ1bXduMWFRYzB5OUJ0ajg1Y20zZTM2OC9ma3ZQVmZldTdaeEdPOVFn?=
 =?utf-8?Q?eRsA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c60db6af-b2ee-4a08-59b8-08dd622eaee0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2025 12:58:00.0037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MTgVvNolSwSHM7l2uZQ4YKUJhM2kHa5WWbEAMxAzv2emnmLYkAucloFffn3Blgaw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFC855560D7
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

Am 13.03.25 um 13:50 schrieb Thomas Hellström:
> Hi, Christian
>
> On Thu, 2025-03-13 at 11:19 +0100, Christian König wrote:
>> Am 12.03.25 um 22:03 schrieb Thomas Hellström:
>>> This RFC implements and requests comments for a way to handle SVM
>>> with multi-device,
>>> typically with fast interconnects. It adds generic code and helpers
>>> in drm, and
>>> device-specific code for xe.
>>>
>>> For SVM, devices set up maps of device-private struct pages, using
>>> a struct dev_pagemap,
>>> The CPU virtual address space (mm), can then be set up using
>>> special page-table entries
>>> to point to such pages, but they can't be accessed directly by the
>>> CPU, but possibly
>>> by other devices using a fast interconnect. This series aims to
>>> provide helpers to
>>> identify pagemaps that take part in such a fast interconnect and to
>>> aid in migrating
>>> between them.
>>>
>>> This is initially done by augmenting the struct dev_pagemap with a
>>> struct drm_pagemap,
>>> and having the struct drm_pagemap implement a "populate_mm" method,
>>> where a region of
>>> the CPU virtual address space (mm) is populated with device_private
>>> pages from the
>>> dev_pagemap associated with the drm_pagemap, migrating data from
>>> system memory or other
>>> devices if necessary. The drm_pagemap_populate_mm() function is
>>> then typically called
>>> from a fault handler, using the struct drm_pagemap pointer of
>>> choice. It could be
>>> referencing a local drm_pagemap or a remote one. The migration is
>>> now completely done
>>> by drm_pagemap callbacks, (typically using a copy-engine local to
>>> the dev_pagemap local
>>> memory).
>> Up till here that makes sense. Maybe not necessary to be put into the
>> DRM layer, but that is an implementation detail.
>>
>>> In addition there are helpers to build a drm_pagemap UAPI using
>>> file-descripors
>>> representing struct drm_pagemaps, and a helper to register devices
>>> with a common
>>> fast interconnect. The UAPI is intended to be private to the
>>> device, but if drivers
>>> agree to identify struct drm_pagemaps by file descriptors one could
>>> in theory
>>> do cross-driver multi-device SVM if a use-case were found.
>> But this completely eludes me.
>>
>> Why would you want an UAPI for representing pagemaps as file
>> descriptors? Isn't it the kernel which enumerates the interconnects
>> of the devices?
>>
>> I mean we somehow need to expose those interconnects between devices
>> to userspace, e.g. like amdgpu does with it's XGMI connectors. But
>> that is static for the hardware (unless HW is hot removed/added) and
>> so I would assume exposed through sysfs.
> Thanks for the feedback.
>
> The idea here is not to expose the interconnects but rather have a way
> for user-space to identify a drm_pagemap and some level of access- and
> lifetime control.

Well that's what I get I just don't get why?

I mean when you want to have the pagemap as optional feature you can turn on and off I would say make that a sysfs file.

It's a global feature anyway and not bound in any way to the file descriptor, isn't it?

> For Xe, If an application wants to use a particular drm_pagemap it
> calls an ioctl:
>
> pagemap_fd = drm_xe_ioctl_pagemap_open(exporting_device_fd,
> memory_region);

Well should userspace deal with physical addresses here, or what exactly is memory_region here?

Regards,
Christian.

>
> And then when it's no longer used
> close(pagemap_fd)
>
> To use it for a memory range, the intended idea is call gpu madvise
> ioctl:
>  
> err = drm_xe_ioctl_gpu_madvise(local_device_fd, range, pagemap_fd);
>
> Now, if there is no fast interconnect between the two, the madvise call
> could just return an error. All this ofc assumes that user-space is
> somehow aware of the fast interconnect topology but how that is exposed
> is beyond the scope of this first series. (Suggestions welcome).
>
> The advantage of the above approach is
> 1) We get some level of access control. If the user doesn't have access
> to the exporting device, he/she can't obtain a pagemap file descriptor.
>
> 2) Lifetime control. The pagemaps are memory hungry, but also take
> considerable time to set up and tear down.
>
> 3) It's a driver-independent approach.
>
> One could ofc use a different approach by feeding the gpu_madvise()
> ioctl with a remote device file descriptor and whatever information is
> needed for the remote device to identify the drm_pagemap. That would
> not be driver independent, though. Not sure how important that is.
>
> /Thomas
>
>
>> Thanks,
>> Christian.
>>
>>> The implementation for the Xe driver uses dynamic pagemaps which
>>> are created on first
>>> use and removed 5s after the last reference is gone. Pagemaps are
>>> revoked on
>>> device unbind, and data is then migrated to system.
>>>
>>> Status:
>>> This is a POC series. It has been tested with an IGT test soon to
>>> be published, with a
>>> DG1 drm_pagemap and a BattleMage SVM client. There is separate work
>>> ongoing for the
>>> gpu_madvise functionality.
>>>
>>> The Xe implementation of the "populate_mm()" callback is
>>> still rudimentary and doesn't migrate from foreign devices. It
>>> should be tuned to do
>>> smarter choices.
>>>
>>> Any feedback appreciated.
>>>
>>> Patch overview:
>>> Patch 1:
>>> - Extends the way the Xe driver can compile out SVM support and
>>> pagemaps.
>>> Patch 2:
>>> - Fixes an existing potential UAF in the Xe SVM code.
>>> Patch 3:
>>> - Introduces the drm_pagemap.c file and moves drm_pagemap
>>> functionality to it.
>>> Patch 4:
>>> - Adds a populate_mm op to drm_pagemap.
>>> Patch 5:
>>> - Implement Xe's version of the populate_mm op.
>>> Patch 6:
>>> - Refcount struct drm_pagemap.
>>> Patch 7:
>>> - Cleanup patch.
>>> Patch 8:
>>> - Add a bo_remove callback for Xe, Used during device unbind.
>>> Patch 9:
>>> - Add a drm_pagemap utility to calculate a common owner structure
>>> Patch 10:
>>> - Adopt GPUSVM to a (sort of) dynamic owner.
>>> Patch 11:
>>> - Xe calculates the dev_private owner using the drm_pagemap
>>> utility.
>>> Patch 12:
>>> - Update the Xe page-table code to handle per range mixed system /
>>> device_private placement.
>>> Patch 13:
>>> - Modify GPUSVM to allow such placements.
>>> Patch 14:
>>> - Add a preferred pagemap to use by the Xe fault handler.
>>> Patch 15:
>>> - Add a utility that converts between drm_pagemaps and file-
>>> descriptors and back.
>>> Patch 16:
>>> - Fix Xe so that also devices without fault capability can publish
>>> drm_pagemaps.
>>> Patch 17:
>>> - Add the devmem_open UAPI, creating a drm_pagemap file descriptor
>>> from a
>>>   (device, region) pair.
>>> Patch 18:
>>> - (Only for POC) Add an GPU madvise prefer_devmem IOCTL.
>>> Patch 19:
>>> - (Only for POC) Implement pcie p2p DMA as a fast interconnect and
>>> test.
>>>
>>> Matthew Brost (1):
>>>   drm/gpusvm, drm/pagemap: Move migration functionality to
>>> drm_pagemap
>>>
>>> Thomas Hellström (18):
>>>   drm/xe: Introduce CONFIG_DRM_XE_GPUSVM
>>>   drm/xe/svm: Fix a potential bo UAF
>>>   drm/pagemap: Add a populate_mm op
>>>   drm/xe: Implement and use the drm_pagemap populate_mm op
>>>   drm/pagemap, drm/xe: Add refcounting to struct drm_pagemap and
>>> manage
>>>     lifetime
>>>   drm/pagemap: Get rid of the struct
>>>     drm_pagemap_zdd::device_private_page_owner field
>>>   drm/xe/bo: Add a bo remove callback
>>>   drm/pagemap_util: Add a utility to assign an owner to a set of
>>>     interconnected gpus
>>>   drm/gpusvm, drm/xe: Move the device private owner to the
>>>     drm_gpusvm_ctx
>>>   drm/xe: Use the drm_pagemap_util helper to get a svm pagemap
>>> owner
>>>   drm/xe: Make the PT code handle placement per PTE rather than per
>>> vma
>>>     / range
>>>   drm/gpusvm: Allow mixed mappings
>>>   drm/xe: Add a preferred dpagemap
>>>   drm/pagemap/util: Add file descriptors pointing to struct
>>> drm_pagemap
>>>   drm/xe/migrate: Allow xe_migrate_vram() also on non-pagefault
>>> capable
>>>     devices
>>>   drm/xe/uapi: Add the devmem_open ioctl
>>>   drm/xe/uapi: HAX: Add the xe_madvise_prefer_devmem IOCTL
>>>   drm/xe: HAX: Use pcie p2p dma to test fast interconnect
>>>
>>>  Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>>>  drivers/gpu/drm/Makefile             |   7 +-
>>>  drivers/gpu/drm/drm_gpusvm.c         | 782 +---------------------
>>>  drivers/gpu/drm/drm_pagemap.c        | 940
>>> +++++++++++++++++++++++++++
>>>  drivers/gpu/drm/drm_pagemap_util.c   | 203 ++++++
>>>  drivers/gpu/drm/xe/Kconfig           |  24 +-
>>>  drivers/gpu/drm/xe/Makefile          |   2 +-
>>>  drivers/gpu/drm/xe/xe_bo.c           |  65 +-
>>>  drivers/gpu/drm/xe/xe_bo.h           |   2 +
>>>  drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>>>  drivers/gpu/drm/xe/xe_device.c       |   8 +
>>>  drivers/gpu/drm/xe/xe_device_types.h |  30 +-
>>>  drivers/gpu/drm/xe/xe_migrate.c      |   8 +-
>>>  drivers/gpu/drm/xe/xe_pt.c           | 112 ++--
>>>  drivers/gpu/drm/xe/xe_query.c        |   2 +-
>>>  drivers/gpu/drm/xe/xe_svm.c          | 716 +++++++++++++++++---
>>>  drivers/gpu/drm/xe/xe_svm.h          | 158 ++++-
>>>  drivers/gpu/drm/xe/xe_tile.c         |  20 +-
>>>  drivers/gpu/drm/xe/xe_tile.h         |  33 +
>>>  drivers/gpu/drm/xe/xe_vm.c           |   6 +-
>>>  drivers/gpu/drm/xe/xe_vm_types.h     |   7 +
>>>  include/drm/drm_gpusvm.h             | 102 +--
>>>  include/drm/drm_pagemap.h            | 190 +++++-
>>>  include/drm/drm_pagemap_util.h       |  59 ++
>>>  include/uapi/drm/xe_drm.h            |  39 ++
>>>  25 files changed, 2458 insertions(+), 1071 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
>>>  create mode 100644 drivers/gpu/drm/drm_pagemap_util.c
>>>  create mode 100644 include/drm/drm_pagemap_util.h
>>>

