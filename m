Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1BACDB8E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 12:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89EA410E776;
	Wed,  4 Jun 2025 10:01:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UOeXAM7p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5810E72E;
 Wed,  4 Jun 2025 10:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+3lgS3FXqJSXWG9uI79BVzLdBYs0Sr3ED6bde8A00NBDSJPOImYJk4cwP6YhUevMKxHLUfYKi8h8X6isr9PSojibULTy480yIS/bqvPcidNmXPd6B2zOIVyTIdr94hpIYT1jmCq2xpaO/9jzi4EZzPytLvelF6YEnJmuY8GVj1USzv0BI2P1Ow8i2e0vc1zLnlU2i7xG6iDgTABZBa9hAauNkBPxM3TuNNtWxSY2WhRiVVIK2TeZTJ6FxAn1E+rEVJR99ALEYFmIoSjeZ7+msATmzHzN5a7Tt3UB8Pd+Sht44WprAO31KvLlBGuWoluoZqYigq7aqTfZDYglrrh2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=joYbbL7WajtF6AqKHODd0EUSy4y6TEA8pqnwXtozefw=;
 b=kl7N4xr09i8UmMiOCwtEn5gty0CWO09EakOIfBJToz5rAhnXjDO8jiSFZMVOqg0WEvlGR5ancUIS2lxfOR4tJQyoj+Vi4Dk3k0UCZLVXA55u0HP6CE3WpDMxQsBsJFf/Js7Nced8aBBmgwd4Y3v+8ReXcoIWJ6OHmr4bJ4bYdX1e9N2mIMQh+KMDs/EiUxX15EomjsLq9gQT125erk16lQ2ASPsH63D0ZjmkcHA8ZDJX2FUnNqs1wwWiVkkiYvwCl/WgUubL10n75H0pvax+jaTumheJMAI1wH6r4GTbLx0EUHz0i8hrC3Y3GnBWRl9F+A0sFN/iy08JrwjidOQ7Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=joYbbL7WajtF6AqKHODd0EUSy4y6TEA8pqnwXtozefw=;
 b=UOeXAM7p3uYwQ0pTLizyGIHpsEu/D23CyT8FExI53EoZ+PIcYUQ8VnpF+lU9kkiUQ1peOd2r3LpwARa/QXmPUlRWZaLi5lcszmKV43YfT0wjpoqzWf8pl5iaF8SE2kJ/jC7nd3OiUqcEgTrdeQ1x1Iy9G9CEJlYldRaD/Gy7zgU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Wed, 4 Jun
 2025 10:01:17 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 4 Jun 2025
 10:01:16 +0000
Message-ID: <b19b3deb-5a14-459c-b076-08be55a62769@amd.com>
Date: Wed, 4 Jun 2025 12:01:10 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] drm/gpusvm, drm/pagemap, drm/xe: Restructure
 migration in preparation for multi-device
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 apopple@nvidia.com, airlied@gmail.com, Simona Vetter
 <simona.vetter@ffwll.ch>, felix.kuehling@amd.com,
 Matthew Brost <matthew.brost@intel.com>, dakr@kernel.org,
 "Mrozek, Michal" <michal.mrozek@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "Yang, Philip" <Philip.Yang@amd.com>
References: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250604093536.95982-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0033.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: acf21b3c-0544-470f-0c8a-08dda34ebf2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aVJmVHRVbUFWV2dsSVdKY3RzL01MK1VNUEJJbmxEcUl1YTM0MGZyN0Q4eWFB?=
 =?utf-8?B?WW93dXRyS0F1UGoxWDU0dEwrS0VOM01zUUx0TjgyZFFWRmtteG1LRmk0dWov?=
 =?utf-8?B?MTJ4Sndkd2J0ekpScklRMEVCR3NvOHloWThOSW51SWEzV2VHekhiNkwrQkNM?=
 =?utf-8?B?S1V5RHoxYlJXTlltQzRZUWFKdnhpOXFwOHdlSmI5ZlJpNzJzL2RRRkZ1blo1?=
 =?utf-8?B?ZWhkbHRWWlZwckVUOHBraERhN3Q1Y2QxYWhTR21xL3VZaVBJVTJEcTVOQkhH?=
 =?utf-8?B?Vmd4M2ZYbXhHWWNKTGJWbHNueFA4aGNZL1JpWlNWNS9uS0pUWVBlZmVQK0RF?=
 =?utf-8?B?TWtzMDFrTW9WYndpd0dMak5BcWc1TlZRaTdheE1OTW9Xb0RZOHBKLzdIVzZq?=
 =?utf-8?B?eFppSkZkWUVFTEt4N1R6YnRPRlhObllrT3RCK2tMZk5KRFhoNGtXd2tqNitU?=
 =?utf-8?B?R1RvNXU1Q2ZpdEV3OEtUdW5QalpsUlFnM1plUjFQSEZlNWtFUXlVQXgydTdO?=
 =?utf-8?B?UUM5cWJQckpseTdBc3Vtdm1haFRKZTlBSW9mdjFQek8wNmIyaitPemxQS3Vw?=
 =?utf-8?B?NEdwTFdja3pHTFVBR0dUNFVvcXVLOHZZaDVMeUtiOUZvOTR5Sk1YditMbHVV?=
 =?utf-8?B?T3VxMVpUWUZ0bXpGSWRhQUpkUzVPRXVvS3g1bWNvU0dPaVJ2OFlHNnRRZXNO?=
 =?utf-8?B?QzdTN1BJWCtzd1B2N0RDNXcwankyYkNwMWllaVU5bWRmY2pBVE53MDVRcXM3?=
 =?utf-8?B?VUVQOFltQ0pXWW55YmxxY2h5NHNlYWozNkZXekNzMXBhdTlXYXJWczYwcjdr?=
 =?utf-8?B?RHhjMzJ4OGp5R05DNjlFaGZUNytOZzNZNTFXalBzb29VcUsrME93djVyenBL?=
 =?utf-8?B?OEhPbC9rMVQzVlJmWGJpck13a3VwME9ENUxST2V6UjRIT0gyV21hZWtIVjNh?=
 =?utf-8?B?cW4xbmhnNURXbWFuRzlxNnFzQzhuaU00VE5mWEpYLzZoZUZaTFhHOVJUY0pK?=
 =?utf-8?B?QXBaMmlGOVZPd2RWMmtYK1BwQjhZcGo1RmdxTklYVkhGNXhnS3FiaHpadThi?=
 =?utf-8?B?ajZQb1g1RWp4d2R5T3RDUDM1WFM2VTdGaTZ1MDVwZGVFaitvd0p4cmk4U0tI?=
 =?utf-8?B?TTl4RFcvYi9QdVJ1QWU4M3lscUw3ZUJwNmcvZG9lR0JTYkkvM05TSWFiU2dn?=
 =?utf-8?B?UWRYa00yeDN4R1U5QTRBK3ovUnRNN042UWhNRWRiU0V0VDdoejgxNnR4R0VE?=
 =?utf-8?B?ZmNIanUyUEFvUzlHdktFME1RUlRlTUM2VTU1WmJNWU8wdDNLOHAyaUIzWGhi?=
 =?utf-8?B?K2Fjb1NPMS9JTUt6Y2MrcFA5ZjFHdnNSR1NTWTM2QnY1ZFdlUnFYdlB5dlh4?=
 =?utf-8?B?WVJ0NXk1WG9pWkRYZENDTExCK2U5a3BEOVB0azJmZkMwMUludktkeWw1TG41?=
 =?utf-8?B?OXVzYWtsSXlrRng5dndBanhmWFYvT2FwWXN3K2ozVG92bU9BZGVLSUJVK1Ux?=
 =?utf-8?B?N2IzS0ZnaEVoWGdpR0xYQ0ZxYUVWSEs4anc2YnVZTENxTGs1ckh4UnNFWHB0?=
 =?utf-8?B?cEdMbGFlQmgwSUdOSkR4VUNoY09LYWtRd1dxVkdZUEdJaW9qcFA3TGx5bkNG?=
 =?utf-8?B?QWhHNzRLU1JVUWRkU0paSHJNTmR3eUJzSTlwUHVhOWhFU2dHOGZNZTFiblR1?=
 =?utf-8?B?SXRKbEI1OEdMV3Z2OVVJWlUrNzJVUmg2ZGRSVUF5ZjVWZGtRckNSejVMRFZj?=
 =?utf-8?B?My92R0xvekhsOFBGTHpOcDJwc0U2UnB5bFNyMkFzcVBZWHpHclpZU3JtRmNU?=
 =?utf-8?B?aDVnSHdJaUM5K3dQb3lYaHd6a1Jpams3b3cwTkh5VGJlV0xsU3d4dnpGRHRl?=
 =?utf-8?B?bVg4N1BJazNRK2dZTjBmM1FBZXBpVlQxS0tsb1RxaHlaMS8rL1NOT2dsbm9I?=
 =?utf-8?Q?qkx6SamSW+o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmEyckpOaFVQaTBZVnIyVGRFOFYxaW1RcCtTZjhGUmlhRXBZdDlaZFEybmRX?=
 =?utf-8?B?ZE8rbEMraFFTSDNhWVg2TTFXOWk3Z1NDclNyclQvaitieEhiY0ZoV1BTbzRm?=
 =?utf-8?B?Tlk4elk1bTVTdS8zejBsMDhQb05GS2hKUDlTRnZVT21DbHZ3SVFTSDNEV3dB?=
 =?utf-8?B?b21HSG1hK3JMY1NwNEJRLzdtOFdqN2N4TFUzc05PZXVsd3FyckxDeCtUSVRt?=
 =?utf-8?B?SFVLOGw4MGZZUEtsdkxXRFZ2ZThtUEtvVm1iZi9TdUs4V1FKM2tDWDVBWE5P?=
 =?utf-8?B?MXBDN0c1NzNqTXNwYUcwY3RKc1JxYngwa3R5KzlpSlJ6MGc3ZUNydVJHcEhO?=
 =?utf-8?B?MnN0WHVRK3pySnh5UlZwRU4zeUVkb3V0ZERJQWZMeFlJdFREUDBzdG9pS0h3?=
 =?utf-8?B?dHkrNjIrUXB6dnNNeWdEYTZaV2NaNzZDVGE4NzlJenRzQ1BGVStqNjJrS1ZD?=
 =?utf-8?B?eTY1MGF3ZEhIc2hHYUpSZWpxY3lmai9RSEZsejJFcVZmVnRMK25RS1Jmb2Q4?=
 =?utf-8?B?TUc4b3AyRk16SGV1UWVROHdGSEpmWTNqUFNmZ3BEeFp4RmRuc1ZTWXpveDRM?=
 =?utf-8?B?UXNtSVd2S3ZZRDhkMlFtRzJyNWpBS0pPZnRvbXd6dGo5YnMvYmpvbTZRRWdR?=
 =?utf-8?B?SENPN3N4aC9OM2xiL0RHYnh0V0JHRTZsNEVoelZ4RldEK1VuQlhUUTZTOXZa?=
 =?utf-8?B?UkpldEVmUVhFTHgwcVd4TVFSVkIxd2VQRDlTNGFWSFFsb2lhUkdWVUoxVFkw?=
 =?utf-8?B?c2RRbU5Yc3A5dFgvWmE0OEc0aHJBOGJ5dE8vdjc2WUhGVkd0UDhnd0ZIM3RK?=
 =?utf-8?B?aERzRjRDT0VRWjdFVmJrRkh2NzRyZjUxckNZYzFPRjNXTXBtR09rQzE1OFZx?=
 =?utf-8?B?NTdzdzgrVUsxLy9NWnA5c0FqTmFhME9IS0FpRTlDb2FhZnV6YjhnN3ZUS1Bz?=
 =?utf-8?B?clE5am00d1JVZ05jdmp3c2VxczhPVUJ6bWNrTDd3WmZzZ1Jvc3JSSytpUkp0?=
 =?utf-8?B?YXpTYjlqYXNuTHFwOG4vbnhNcmJZUVVVREgybzBjc083V1FJU1NNVWxKQ29U?=
 =?utf-8?B?Rk5JOGNMSnRJZ3FFVkNHZkdCQ1VmMlhGZXRuM05KeHVveGMrWTBwWVVXcVlm?=
 =?utf-8?B?L3U3bzQwZ0tJQ2U4ZDBwSkpSV1dBcGxiUEQ1cDA2Ui9xQmZSaHdxZjI1L3JE?=
 =?utf-8?B?eGhjMFFweUVWcTBvdFVKZng2VDdPWDVTVnhRbE9BbmREbkhjNU4wOHp2VUs4?=
 =?utf-8?B?N2J0TVIrK1FKVks3YVphemhsUFlMZjU5SU9ES2YyRzB3NzZzUVAyTFBmRTRi?=
 =?utf-8?B?TFk5NUduNW05d0pNU01aNVQrNU45cUNjenh1cVVVMDBSWERlK3hRdU93OWVy?=
 =?utf-8?B?SUpWbVJNSEVJbkRZT0RKQzNpTzZCMGppNTZaVU9KVm5hd0Nra2diM1dnV3ZP?=
 =?utf-8?B?aUZkQ2pxZGp2ak5WOUZaL3ZZakp6WlNJTUVsbDFKbnhBWFFaQjZ3VUFHeXpN?=
 =?utf-8?B?ZmhjTGZ0dms0NXV4SE9pZVhORXMvRU5KUXltZFJqUzkzcTFhOEZlWkp3Z0RN?=
 =?utf-8?B?emtBRnNVK0YxSzZrT2JObU1lM0ZwMjBmL25ZeVFuSVJRRGxNOWdjamd1U2pa?=
 =?utf-8?B?cEl5VThtR2NVZCt3SEJaYmgvQ0dSS2lOZ1lBZ3hveHk0SVFvVitWUjVTMnRX?=
 =?utf-8?B?ZFduUDZiR0VhR1ZJdy9XbXZFcU1FZHJQd1NnaFU3emUxdllyRzdHZDdHVU8x?=
 =?utf-8?B?eU03R1RKNDYyejRCMmpZUzFzSnh1Wm9sWW92RlY0R21TTUZOZlFrMEZPWEg5?=
 =?utf-8?B?aFByQnZHSXZhanBHTE85NDJBMkdXc0FFTkxJN1V1eXpHVDEyUHVVU2hpeElE?=
 =?utf-8?B?RllhQ1lMcmE3Z3MwVDliSTh1RVpyMnNYV0g2bi9yMEpUdUxNNmtIdTNGYXlM?=
 =?utf-8?B?cHcwMGRxYnFsTW5ZbXZtMkpMb2ZFUWpab0V0dGt1YUpwa1kyakhEdHBJUmdm?=
 =?utf-8?B?VVVIOHFJMkMvVHpOV3V3S1l6cXFGNzhOZHE3SVpydmM0OFUza1kwenU1WDF1?=
 =?utf-8?B?cXR1NEJCSE4yT2Y1QVhZTEhtTVkySjMrdjFKeHN2RVpGaTRuZ2llQVl2eUVY?=
 =?utf-8?Q?G7aXpKPiuJ9fFl0kp3abTZjKY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acf21b3c-0544-470f-0c8a-08dda34ebf2d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 10:01:16.8009 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: twnkEnADYznR+tJ2pu0nad4vVs50hn/e7Ld6OoMahUU+e3d4HHc5E7SRp8KppuXY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
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

Hi Thomas,

please make sure to loop in Kuehling, Felix <Felix.Kuehling@amd.com> and Yang, Philip <Philip.Yang@amd.com> for that kind of stuff.

I'm absolutely not deep enough in the pagemap handling to judge any of that here.

Thanks,
Christian.

On 6/4/25 11:35, Thomas Hellström wrote:
> This patchset modifies the migration part of drm_gpusvm to drm_pagemap and
> adds a populate_mm() op to drm_pagemap.
> 
> The idea is that the device that receives a pagefault determines if it wants to
> migrate content and to where. It then calls the populate_mm() method of relevant
> drm_pagemap.
> 
> This functionality was mostly already in place, but hard-coded for xe only without
> going through a pagemap op. Since we might be dealing with separate devices moving
> forward, it also now becomes the responsibilit of the populate_mm() op to
> grab any necessary local device runtime pm references and keep them held while
> its pages are present in an mm (struct mm_struct).
> 
> On thing to decide here is whether the populate_mm() callback should sit on a
> struct drm_pagemap for now while we sort multi-device usability out or whether
> we should add it (or something equivalent) to struct dev_pagemap.
> 
> v2:
> - Rebase.
> 
> Matthew Brost (1):
>   drm/gpusvm, drm/pagemap: Move migration functionality to drm_pagemap
> 
> Thomas Hellström (2):
>   drm/pagemap: Add a populate_mm op
>   drm/xe: Implement and use the drm_pagemap populate_mm op
> 
>  Documentation/gpu/rfc/gpusvm.rst     |  12 +-
>  drivers/gpu/drm/Makefile             |   6 +-
>  drivers/gpu/drm/drm_gpusvm.c         | 760 +-----------------------
>  drivers/gpu/drm/drm_pagemap.c        | 846 +++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/Kconfig           |  10 +-
>  drivers/gpu/drm/xe/xe_bo_types.h     |   2 +-
>  drivers/gpu/drm/xe/xe_device_types.h |   2 +-
>  drivers/gpu/drm/xe/xe_svm.c          | 129 ++--
>  drivers/gpu/drm/xe/xe_svm.h          |  10 +-
>  drivers/gpu/drm/xe/xe_tile.h         |  11 +
>  drivers/gpu/drm/xe/xe_vm.c           |   2 +-
>  include/drm/drm_gpusvm.h             |  96 ---
>  include/drm/drm_pagemap.h            | 135 +++++
>  13 files changed, 1107 insertions(+), 914 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_pagemap.c
> 

