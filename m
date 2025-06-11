Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C041AD4A23
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 07:00:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B113B10E13D;
	Wed, 11 Jun 2025 05:00:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A9T7cpeh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCABC10E13D;
 Wed, 11 Jun 2025 05:00:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xg2XCzzt/lS1VJLh5OSz8B2NZGBYyE5mi4Pv5dHiXSsi0eCbrYmebQlHbazDjmRU7jdx9KuB2wLadYlv9ZWTD+H84/7CbqconTX6gDd3nlXd3Xe0Ov0Avsrt6MIYDmuwXnLXB33VOSE35KJo1FOQTZql7YCzXwmqGzzQZ0oTSQJq7RymLa8eqGLN0oQcK0TYyn4BCTs/0elroL31aA1nGJwcnzMlkcSta9uUkZ9YhJlYguyXQQdHBSvfqWQhhDBS/B111IXxlqJI0hKhrynNc+jkMcbtkNIT/0AB8lfZBcg2aIJKF4jfa9//aD+8li71oyYnlMGcjUyGdLoMWwowqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bXHk0D5IUXdlzpDYQrvnLYa0nxTGY0fSKrkjAd6TNsU=;
 b=tGzKSOstePspsoWg4YU7vLCdR8fXpfCPVQwgSlunOTtKJO7KfSZn5qsy/Y1Bne1Oya0wo58LVjNa9gqVCZ7rmnrsijthsc1XRgqtnkwszBkBt8UXmSfr4qL8yySHNigWz+e3TCJ819DZP9QK8dLHs5ytlYVOiADxiqbeiIJktdPuwONmOQW/xoUf/D7D/dDScK21S7NuT5XncELOUrWHd2UdD6dWb/Ql1Td0dX1FOQPgcqZSo7Pukbp2Y6sFBNiQoiq0qNf0qOh7D2qvFcsOfR8QcqB45keZ9K9v7ObIu9uaH4iHiP+KKgDYyNFE3R2xp45hPTnSOwTc2Js4le3bcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bXHk0D5IUXdlzpDYQrvnLYa0nxTGY0fSKrkjAd6TNsU=;
 b=A9T7cpeh0R7f5bDqqJY2rA3902fPskRXQ0YmikackVWQW065Swbx6EEdlBOfRC0BRI9ylG1P1dFgDKVbY4I1DGtrueg+xbnqbIb/ZIchdpEqfOS8OHyysOkk/3Chqn9Lhkp4HYKZnuKAHh43bQWc+4KbOQu923GNPe5unyTGmII=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB7804.namprd12.prod.outlook.com (2603:10b6:8:142::5) by
 DM4PR12MB6206.namprd12.prod.outlook.com (2603:10b6:8:a7::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.35; Wed, 11 Jun 2025 05:00:26 +0000
Received: from DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290]) by DS0PR12MB7804.namprd12.prod.outlook.com
 ([fe80::8327:d71a:ce21:a290%4]) with mapi id 15.20.8792.033; Wed, 11 Jun 2025
 05:00:26 +0000
Message-ID: <afd99dae-52df-46dc-9939-5364396d25a2@amd.com>
Date: Wed, 11 Jun 2025 10:30:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/pm: Avoid more large frame warnings
To: Palmer Dabbelt <palmer@dabbelt.com>, alexander.deucher@amd.com
Cc: kenneth.feng@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch, asad.kamal@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250610212141.19445-1-palmer@dabbelt.com>
Content-Language: en-US
From: "Lazar, Lijo" <lijo.lazar@amd.com>
In-Reply-To: <20250610212141.19445-1-palmer@dabbelt.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN4PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26d::6) To DS0PR12MB7804.namprd12.prod.outlook.com
 (2603:10b6:8:142::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7804:EE_|DM4PR12MB6206:EE_
X-MS-Office365-Filtering-Correlation-Id: af3cd0d7-c130-4582-0c8f-08dda8a4e0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ly8zejNuWnNrVmxIbFRuemxEUnptdnhlWHJCTG1LdCtSR2s5VXlzUm9ySEF1?=
 =?utf-8?B?dkZlY0NYSDVSdWMwNHRCTjVLY3ZwdC9MaFpqUDJKZkwwUWFOVEcybSs5eU9X?=
 =?utf-8?B?VzVDbmZ4UzRKclcvOVFqcDNHdmV1VCtaazh6V2R0ZExhOW9ML0RxT2d1bjF4?=
 =?utf-8?B?ZGxCL0h5SzYxUWU5dnZxZytNMmRVQ2svamJqMWFwOHFhVnpOd05pdUVja0tn?=
 =?utf-8?B?eVdXQUEwcUNjT2pjNXhmTUIrekFHemtLMnZLZ0t0YkJreDBqVzNCcWFrV1c0?=
 =?utf-8?B?YjllM2Y4RDMvckdvenNaU2cvREJjZlBWYmlXRVRmWHBQcDVUNnNGZDNVaGo5?=
 =?utf-8?B?ajdOSTFNcjB1ekpGckdUcm9mN0ljYVEwRFkwOGNZcmVlU1NLeWliZEhwOHhj?=
 =?utf-8?B?OW42TVZUK1BoaWI5bEExYmxGTWlqb2YreDBkVS9iVVdCVXNaR2ppdzdHVzhI?=
 =?utf-8?B?NVdmejVXUkRzRmdOcjVxaVM0cDlSUVhjQVlpdmV5SDdkSmt4aEZiRzNxQzE2?=
 =?utf-8?B?RkExdXJjTFQ0bDM1Sm5mMWgzbmlrbTV2Zy9zaDNncE9KNmlIOWswUEVvWnhl?=
 =?utf-8?B?NGN5cTlKcUJFK2lJd0pNNjhHZXp6Snl6REREcGFEWWswMDVmYlg2c202T0N6?=
 =?utf-8?B?S1ljVGU0S0lNTzhqYkNpdTc3UFJYWjZvQnAwK2FEWGlVZXJ6cCszWUs2R0ZP?=
 =?utf-8?B?bVpkMTZnWFZwcHN6UjhFNUJTZkI1QzFaNENUVkZqQVpBMUE4NmQ4cTZWODBL?=
 =?utf-8?B?RWIycER3cjVCOHF4SUNLUkk4MnFCMlJkUldEZ0lLNDFwWXFSOSswdU9OZS93?=
 =?utf-8?B?RkkzR3NHK3dONkNvQzlzc09tUWdtcEdsaW9taUVjdVhnWU5mdmFwV3F3L3NB?=
 =?utf-8?B?OGd5b1FjR0VCM1dWNHFyMXRneG9kUGxtUkV2N2RNYmM4TWsyZ0ZDSWptRy9B?=
 =?utf-8?B?WGlmSFZWR1JEeEhtZlR4MjN3SlNDdVJ4WVB0RUJjTWd4OGdmL0ZHVzFiWEgw?=
 =?utf-8?B?Ky80dnViT1dLdW56RXFKdkxvc1dyTmc2dTVxVXpLejFmN1pPMHl2ZENHZVQ3?=
 =?utf-8?B?eWpab3UydThONTdSelVFQWU2NnI2Wm0wZ0V2b1d4ZmtkT2JjUlN3WWI3a2Qv?=
 =?utf-8?B?ckYwbmhaNjFtbTVYWTRScm80Vm5uLzlXRXdLcEt3T2xYL0kyTUFIYVh1SVV0?=
 =?utf-8?B?VWV2NmNqVkEwQm9xZ051amt2VEszR1cxWTM4dGF3cHgvRjJRaWNMajhXOWJt?=
 =?utf-8?B?QTFNWWpaaFl1MWpTWEIzRTRFOUZWUnk5dkxNT3hDYWxGMkFuSWpGVVFOSmkz?=
 =?utf-8?B?WkJoOGpUNlRXSkx5MmhHVE9GQmFYRGxYYnRrSzdJeFh1bWlJMkQySE1NUzJG?=
 =?utf-8?B?SlRQTFZNbk9pRkFoTTc1N3JmaUp5bERoa1V0N1lLaXlrOStsMkw5QUhDa24w?=
 =?utf-8?B?SmpSYWM3ZnYvdWRnMVJlTFhBOTVwSGVRdmttc21BbW5PWDRVRkltZE9ZQk9t?=
 =?utf-8?B?UUhYREQzbVhxRzRyQkROaEJ6Mm9SazBEOGNyUlp4VnlLRnB4R1NZYzVISUh4?=
 =?utf-8?B?WG5qVW95djI2L0NERnJrSWtaQ25xQXpJTzBtY3pLYk1IaFJoeDFMTlErZU1z?=
 =?utf-8?B?U1llQUUwbTEzZTNKODl4d3MrK1RuTUtWSGwvTkZmM3VRUFhSUGRFU1A2dmlW?=
 =?utf-8?B?a1Y5ZWh0eUE1MUxSUVhILzc3cDUxUFVRMnl2cmVoc2F2YVhseUw3Y3JSL3F0?=
 =?utf-8?B?MUFPYUZPV1BBMXBySlkvdFo2bG9rNmlXOW9GdTRFcmc4bnc1NGIzNzMrSlBK?=
 =?utf-8?B?ZUZHR3VaWDFXWlN3ZFpQYk5XK2xHL295SVRGeWxhcWdoNnA4TmNqTVhYcGEz?=
 =?utf-8?B?SExxT0NrK3VXMHJudDlsWG9pby9raUd0ajVpTk9sL3VIQTU1K3R6VlkyUUFX?=
 =?utf-8?Q?ft/UhFcFRrc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7804.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MnprNzdnbWhjdHM5YjIvcGZUQk82dXJvTXR6MGluUGcyallWVWJodDhIVmFr?=
 =?utf-8?B?bTROTUtJUjRRMGF6SVZmbGZaY2plSGx6TDROOWlOYURBbENBektCS1BoVnBP?=
 =?utf-8?B?aVg0Z2VaWHprSGNmcTRwbE5jWWkzSDZaSitMaGdmeDYxZ0lSb3NqZzZLK1Zr?=
 =?utf-8?B?bktpSER6emM0V0l6S1V3R0dXOVJsbjNKWVhOSFU3VU5XMUpqRXRLUHhkWnd4?=
 =?utf-8?B?dmJMTlVBUXRTa1pnQ3c4dXAzWk5nTU1IS3ZXb0tVdHFwMjdVTDQvVUNtcUhV?=
 =?utf-8?B?YjhpMG1xckF1YW1pazRkaU5DZDhKU0N1Ym9LWktVK3VmcGZqU2JrU0hjY3BP?=
 =?utf-8?B?aHo0YUdaQ3lZSTc3NnRhMzdBNjJzZ1JOaG0reHIzaFI3RC8wUmZ4UHdhUWVI?=
 =?utf-8?B?NkRYWmljQks0eFR6ZXkzR2ZCOS84TklJZzluWVdUR3hmK2xVVWhLZlhqMkZV?=
 =?utf-8?B?M21kWG82ZC83YXR6MTlUdVhlUzFTOG9zNVNqci83Z0VLaFpGdTUzRjhhZk9j?=
 =?utf-8?B?NHdsdDFwRG1NblY5VloyWW5FN3d5MjZZUTVNNURlVHptTDdWUi9vYXFZODFp?=
 =?utf-8?B?NmUzd3lrS2JTL1JqbHhOckFkaWRlbzdaUHVxTi9WOFkvVmJRQ2t4dDFmQXpN?=
 =?utf-8?B?Wm9zZklLb0VVN05VYS90TC9BY0FKSjRUTzRrUEhOaHhNdXNIZ0FMVnkyYWZT?=
 =?utf-8?B?TWgxMjZOZmhMKzhGZTZrSjdWdk9uYVd6aVVaaExNSEFRYnRtRTRwZ0JmcGFN?=
 =?utf-8?B?bU1QU2NySEpXL3QzcHhSTVZkQzZ1UWNmNnozZUxnVUNQdm9odkEzRkExTXp0?=
 =?utf-8?B?NEpRZjVXdWVsSnc0blNpbWE1VlBWUE5HcWIxRlRTODJTR3B2MCt3dHZGMk1Y?=
 =?utf-8?B?Qlg3VlgwVHhvek4rZ0tneXBUSnlPQzFVT3ZtYU5SVTgydGJwR05aV2JOYnlu?=
 =?utf-8?B?U3BPdXhhempDSU8zMktnWHNkQ2tiUFVsdVRxaWxNTjdWNG5pcnVCNHZ0WStI?=
 =?utf-8?B?SjY0c2MxbCtmdzMwSFV2WmVHWHN0YXVCVGJlRHJjQmlOdWpUWjU2Y1g0SEZ5?=
 =?utf-8?B?ZW1JWWtCNmZFSDFHMC9WKzJscTZWZjlEak9XM0xPNXFPMm9lSTBKNkM5UUVG?=
 =?utf-8?B?SW5ZdEp0RStKdkJSRGxzZE9rV3VkQnJWd1NRL3VpekZzbXA4TVEraXViQ1o0?=
 =?utf-8?B?UEtyd1hvdmlGNjJoNGZpaVd4RXpvRHNwYXl0Zlkra05EVnFtL0JFUENrTWhn?=
 =?utf-8?B?RVVmYUdraUUwZUd2eUNRQWk2WExweVRkRitNQWMxbk1lRXRtMXRjeUE4a3Nn?=
 =?utf-8?B?czI4cjh2VFhNL0FoQzFvcE9ZMjlyN2xsaHNSMlR2d1M3ZGF4UHZscGplKzA2?=
 =?utf-8?B?Mk0zNWtpbUx2MFV1UGxtYWttUUdkOFdhUFcxUnJ1cEY1SGtKdGZsNjQ3WHVY?=
 =?utf-8?B?eWJFQmVQaWdwVVR3ZGg5TmJiaEd6MGE0WGRrdlhMaVlVNjVOWXExYUhqNHN1?=
 =?utf-8?B?eDNWdzU2U0UvYTZiVlJ4WHhGVmhES0lmd0w3NlYrbDlxNTVKdHVVSnAzVTB4?=
 =?utf-8?B?Uk8yK2RBZmMwM2R2b1pmaWl0QXdINENjQkk4M1luRWFZRElnRkRzNXU5UEN1?=
 =?utf-8?B?VFZRT2JldlBKZlgvOHc2QThWL2VFOXc3bkZxSkNBNDg0eENNNS9iUERxcjNu?=
 =?utf-8?B?cm5lWlFvSEhTanJsOFRMU2hXSm4wWVNBSk8yZkJGR1pUdXcwZmZ6Q3RoVVVN?=
 =?utf-8?B?c2c3Q3VXeHd6bFVoT1BneFZMYjBXN24wcHlHZjU4RkJiR3lEMXo1VGlFdG5T?=
 =?utf-8?B?NE0vMmtmZlBVaGM1azJVbGU0UmE5dzB4L1d6dVl5SUNVQlM0dmtLNlQwR2VT?=
 =?utf-8?B?b1kyaE5DemhsOXQrR3ZWR3JrS1J3YTlsMDFpYkdadFcwTXk3Y0QxYzV5NlN1?=
 =?utf-8?B?QVd2MjdnL1RhclBaK2g0K0hiTmdYa1RFb3E5VUJ1bkRiOGE2ZXNOYVhLZE43?=
 =?utf-8?B?T0ZlMmExb2t6YjYrbU96bkFnVUU3MU14OVZRVm9iME9TaFlLWnJIam12ZVRj?=
 =?utf-8?B?UTVnempRMHY2OVZEL2greEhVOTBzb29pZkFSQWJNRlcwTnJ2VVAxSk1ZYmlh?=
 =?utf-8?Q?Mkh14744aakTFepvcRdFTPUh5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af3cd0d7-c130-4582-0c8f-08dda8a4e0d4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7804.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 05:00:25.8599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Dr65Xkc11PoMFZUmmhAUFdasywW482q8n8x6XuPZmqcf51+4CRHZ0xIfzKzs8Qt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6206
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



On 6/11/2025 2:51 AM, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@dabbelt.com>
> 
> 9KiB frames seem pretty big, but without this I'm getting some warnings
> as of 6.16-rc1
> 
>       CC [M]  drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.o
>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c: In function 'smu_v13_0_6_get_gpu_metrics':
>     drivers/gpu/drm/amd/amdgpu/../pm/swsmu/smu13/smu_v13_0_6_ppt.c:2885:1: error: the frame size of 8304 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>      2885 | }
>           | ^
>     cc1: all warnings being treated as errors
>

Could you also provide your build environment details?

With below in Makefile + gcc 11.4.0, stack frame size is 168 bytes.

ccflags-y += -fstack-usage

smu_v13_0_6_ppt.c:2667:16:smu_v13_0_6_get_gpu_metrics   168     static

Thanks,
Lijo

> Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
> index 51f1fa9789ab..9824b7f4827f 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/Makefile
> @@ -23,9 +23,19 @@
>  # Makefile for the 'smu manager' sub-component of powerplay.
>  # It provides the smu management services for the driver.
>  
> +ifneq ($(CONFIG_FRAME_WARN),0)
> +    frame_warn_limit := 9216
> +    ifeq ($(call test-lt, $(CONFIG_FRAME_WARN), $(frame_warn_limit)),y)
> +        frame_warn_flag := -Wframe-larger-than=$(frame_warn_limit)
> +    endif
> +endif
> +
>  SMU13_MGR = smu_v13_0.o aldebaran_ppt.o yellow_carp_ppt.o smu_v13_0_0_ppt.o smu_v13_0_4_ppt.o \
>  	    smu_v13_0_5_ppt.o smu_v13_0_7_ppt.o smu_v13_0_6_ppt.o smu_v13_0_12_ppt.o
>  
>  AMD_SWSMU_SMU13MGR = $(addprefix $(AMD_SWSMU_PATH)/smu13/,$(SMU13_MGR))
>  
>  AMD_POWERPLAY_FILES += $(AMD_SWSMU_SMU13MGR)
> +
> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_12_ppt.o := $(frame_warn_flag)
> +CFLAGS_$(AMD_SWSMU_PATH)/smu13/smu_v13_0_6_ppt.o := $(frame_warn_flag)

