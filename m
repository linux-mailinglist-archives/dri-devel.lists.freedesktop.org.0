Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA1AFA7B9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 22:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965A10E2E0;
	Sun,  6 Jul 2025 20:41:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i7luP/wL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AD410E2DF;
 Sun,  6 Jul 2025 20:41:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cwiz41Dgr/AtleDzLBKP90fSvxImv2gs23SO8KmcLEq2Q7FCMytg5gvfsYlYIXLUIUTCEDusJ3Cu0qTgLDqI69/tjPNYY2DJz86xeR2CFvb5OdltGoiygIkZJbH8lycAfqqNq3LJl5qIA1fJ6V6MpF5PLJaN3QnsNbviieoQVVYncQ1vYN+nTTBUhjyRWJTTZXjKrrVPLkg7yZHMP8Xg+Yn7S5I/GShrgnz9QZs7wbSmgbOR6XV7XHaeKEDEfIx5Q/sRvc+t3q3kyCB20KX2TiHm6B8oZCUKQw4WldJ8d9HeUit6YitbMuXGrYHy+VAypBBClwXgSA3Tvk012egO8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTD05hjVUBqiBlArni84Elj2alOONm6RBZ4FPF66zJo=;
 b=D3uq2a6C+WLQIyYTBRj9sSq/ef7JULDMKKk19qGfw6TKrrMy1Xps/wFWQ2TcPGuqaZcUPES2KniYgZX8Kz7YCngsK7YKdsfi6OjoxPvBAQ+U52nVoOYoI3Gy1nMKB1cLofBwi2Bkrb1ueu7hko9ZTt185Tm4PXAwg4ubE8mYVwCJjBJIzB6/7sMc+Ti37XQQbERgUv0aLd4tyMFqNvFYbzWEkcVY9c+mPzHOM/5Mk54vqW2eTirUCeR6aZNhza8/WWWihZTif6plINcPwFHfkhxTCEBZG5g4L7MjCqZsrnjGHSAySqMt8qUz9aPDEpTFqHIM9e+qvqSYj+MIxSxLaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTD05hjVUBqiBlArni84Elj2alOONm6RBZ4FPF66zJo=;
 b=i7luP/wLEn4xufxpcw5fs8t87l1Lv5rO+X1u9MKZSDpKeHepXSOiRrAUMar4ALT1IjOAqkB/KhMGxPnDEYCzfNwlc2KRwp16BIQ7U5TBkI+0addkkW2BZTF8Wk5qhGGpSiUDff5fqasAvrCJpcu3GzFEwys+sNyBI2gRHo7LnA8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SJ0PR12MB6877.namprd12.prod.outlook.com (2603:10b6:a03:47f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Sun, 6 Jul
 2025 20:41:17 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8901.021; Sun, 6 Jul 2025
 20:41:17 +0000
Message-ID: <58f142e0-5244-466c-b625-ce1e01f017d1@amd.com>
Date: Sun, 6 Jul 2025 16:41:14 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] drm/amdgpu: move GTT to shmem after eviction for
 hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20250704101233.347506-1-guoqing.zhang@amd.com>
 <20250704101233.347506-3-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250704101233.347506-3-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0503.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10c::21) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SJ0PR12MB6877:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd09962-4992-4b46-996a-08ddbccd74bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MFdoZHlnTGF0WGtzcFRjZDhYOWIvV0wvQzI2WHNhcTBPQ0VQelI5RGplT0hR?=
 =?utf-8?B?eU1KNEtmcVhCbzdPRUNwNE10a2ZUbXhEdXlENG5vMEp5cmRrZlRIdVowcStZ?=
 =?utf-8?B?djY5VHVqeEM4WU93eFJ3QlNlMktGUE5rTGpJdUM4Mmh4d1FYY25KOU4xTXpG?=
 =?utf-8?B?T2l0a0NuSDNxbklNL05RRlp2UHNYbGRwdTdjY0oyZjF2T1drQ0x4Q08rejJN?=
 =?utf-8?B?Zmx3YlUrbkt6RzRydWtkY3JEb21xUjlrTGpucC9lS1lKNWtHMit5NC96czV4?=
 =?utf-8?B?TmZENU91bThWNXRPNVg0Z2p3OWNWL1Y3TnJEN1M2dWZwU1BYb21taS85ajNs?=
 =?utf-8?B?b2ZZMUh6NTFiN2puN3cwUVBPanRJcnFwMngzRmtnSkorZEJpOUlkaUQ3QjA0?=
 =?utf-8?B?QUtaRnNsT1pBQUo3WG1KQW5mN21YSVQ1KzJ0bjlaelY4aGZuTmJGcVhIV1lV?=
 =?utf-8?B?Z2NldFRSZjlENWVyUktINWc4OTJrK253d2FEOTJNR1lmVEpOVmpDRktVeDRK?=
 =?utf-8?B?cGlxS1NuYkR6SHVFeFJOaHZOSXAxK3NTR0ZuckNFWmJycHdGb2xHalBIM0pr?=
 =?utf-8?B?a0RMUHhQdGl5SFg2MktWbktKTEV1ak5ldjJab0ZnWmVSWEREM0NTZ09CNnp2?=
 =?utf-8?B?ZUR5Nmdxd3RYYkNVMWFVeEcvTGU4c2wzN3ByRlAxVWR5TGhLcVdIMndZRU1N?=
 =?utf-8?B?V3ZwQ1J6S3dhTy9UQWtVOG1ZZTR0bTUvSmV6Zmo3bHE2TVpNOWpDcTVmVVh5?=
 =?utf-8?B?ZHZkcVZ6cXpnUm01YnhObXpnSVF1NWdaU0NsQ3ozdFJreFdFcStrMHd6alFy?=
 =?utf-8?B?QzM4YUFvc041bnJ6OGxaV3NwRzVIRXhFM0JEMGZVK0ZxNC9EYTVWMW5abEhs?=
 =?utf-8?B?cFV1elh3UW9iZUZ5UmlNWmRlMFMveTI2eTZ3eVc1T3E2MGFJdkkvd3hzdUR0?=
 =?utf-8?B?UTNZL0RCMW1nK2x4MGxkdjQwaGJ0UEZIWGsrTzA0Y2dRamxVRzVLZWdVVWpC?=
 =?utf-8?B?MDB5YjdaaDRaL0w2dTNTSmJnN2RSRk8vN3d5S2NhQmo4ODhGc2YvMnlqQ2kz?=
 =?utf-8?B?dmdUSkg1WFA2anlUZE5YNU9OWkV3UGNTVVhLcmZrWVIzN29HWnF5bDZ3bkMz?=
 =?utf-8?B?a2dlMDMxd2pJeGtPdjVvbWJCVUJZaDc1OXppa3BxcG1TY1lkaHJuaEc3NU5L?=
 =?utf-8?B?YTJvVzdveDJrdWZ1MnJvYVhGcUFxM0JJTUlncHlNWmpxcFRrTnkyUythckM4?=
 =?utf-8?B?MlhrRU01UWdtOWJ2dzJkQUVzOTZWejMzUWVvMWFZRkJHdHlQWWFSeVhqMVNz?=
 =?utf-8?B?bFVNbFRXcE1xTWQwWkZqaEN3QzBWV3RmQjBxQ1YxUDQ2WVFhbnoweHp1bU1O?=
 =?utf-8?B?Zi9XK25QRGtMRGN2WGxhbXRJTzBEWFY0NEpnaFpnanJhekNmRi83K052RzNH?=
 =?utf-8?B?UTFESjVxN1VYQWE5YUwyWkxYcHdxWElsNHhiVXRsbFUyaXdSZjZvNmNGOVlB?=
 =?utf-8?B?L1ZNdkZYbHcwVlVrRDRkZ0hzVzZrd0ZrYjZyRVBEVnFkUWpqeWxXUFliUmxr?=
 =?utf-8?B?M2lDblNTeW82R3BURUlOYVFUNndUNW02MnBrSGJ1SnpyNW5xbi9mZ1VvZkZI?=
 =?utf-8?B?VWphQU9CaFQrYzlDaFZKT0NVeVErVEZGWGF3VTdqUFJMRUtFME9ZalNuRzVN?=
 =?utf-8?B?amZxUHZFVDZEOFdGU1FHSi9SNXVEZjRkYWM4dk9MdnNzRFFyZXFSL3JVZG1K?=
 =?utf-8?B?U0RzL1luOE5KQStDdnlHNkVzUVFyQ2xNK09MSVY4K09QNmZHQnFmSHVLU2cv?=
 =?utf-8?B?SE9RZUpScXI4dXpxS3k2MWNtSEExM1ZtQmNrQVRwcHFuQWdPNEx0LzIrWjJT?=
 =?utf-8?B?NXgyWDZBWlVNbVkvbnZTSGdwWG01Q2hWS2RwYlV0VnRTMnB6cVZMZSswNko5?=
 =?utf-8?B?V05VRWZnblRiTzBmc2lLQmQ2S1UvRXVJK3dnaHo4dWRGcnVBZkNOSzZ5b0Fr?=
 =?utf-8?B?QmtXa2pwQVFBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b09wTTZ5MEx1Q2VleWgyc01VMkV6Y0dxWkx0ZXROQmtiZ0J2YllwU1dEaGg0?=
 =?utf-8?B?YnFBVzBCN3BHRE8xbmtRK0EyZWI2YjJ5ZThhTldadWZCS1ZZSkFabXNqNk1T?=
 =?utf-8?B?TnRibGo5R0NicVBpN1hmb083LzZsblQzNHYzUldqeVVkd05vZkJkZ1hWZUx2?=
 =?utf-8?B?NGRsL0Y2SXhpSTZjaDNOZHJqNEhCYkR6bDhQVDR6MmgrOE1xK25qcVpidGxN?=
 =?utf-8?B?clUvOXZQRXlwSkxSRlFTRmhRNVk1QldyZ1NDVFo3Y29pa2JFZ0ZLMVJrMDBi?=
 =?utf-8?B?N1FJR0RqMmhDdXpzMVpZd3daWExMM3Y2dEw4Tk9XQjBZOVFEZlhoRDRtbGVp?=
 =?utf-8?B?TUVmK3lGVS9Pd1o4STBZc210cFBSSnJRRVBrN1hmWHN1OGJQemZxTklTWXg5?=
 =?utf-8?B?VlRkdXZNOFpmb0R0RXBxSFIxN3lFZllnNmFpaFV3SVFoWGEveVN5OWRwNVRo?=
 =?utf-8?B?c090bkN6NzZzL2lhbWUzbFU4K0ZFV09kYzBuMzlvUGw3alYvNjdOVVJhS3BB?=
 =?utf-8?B?eXZhL3RpWklleVlTdndjOXVGOE5ZMlFPZ0orQ1ZRR0RYNUJhdVVidGkydU42?=
 =?utf-8?B?WCtoMUVjWGM2ZElhcmh3UEUzeFhhMm9DMFpGU0pTZFF5ZHE3eEQ5cUk0bEk5?=
 =?utf-8?B?L3F3OTBSd0dWaEE1WFhZczJwYURkTElRWkpZQzNKalllRnU4Q3NELzk2MFZa?=
 =?utf-8?B?MFVNbEl3eWROcU8zVkNzOTNyTko5a0hlYmJvb0wwUjJBTlkzM1NGeUt6QlZT?=
 =?utf-8?B?TktEc1dkMTdncjdaZ3Z4bTVWN0ZYeVBqN0t5QndXanZMelJGS3V1Tk9JUjRo?=
 =?utf-8?B?MHFMaVdBcTZUWG1PWU4rbFBBWjJPWFhHbWd6RjFZWmF5R1ZZaG5kK2N0Nmt6?=
 =?utf-8?B?cCtzNnpabElTKzYvZURnZTR2TEZ3STA2Tnl6TXdrelkvYzYxUzdqWUwxdFo1?=
 =?utf-8?B?S3pBUkRWYUJTRVZnYVdKajdCQVhrZWZZSmZGNTN6anBoSllwNUtYMXJBT1d5?=
 =?utf-8?B?SGRibVFHY1pPVUpsY25kcFN4RG9QdnhGcWpaS1liVThXeXYvSzFhRkZQNERr?=
 =?utf-8?B?MXVNdGZYWjVnY3pzY2kxMTU2UTdnWnIxa0tEVlZPRU9ObEE3TEdBMXBZRXZE?=
 =?utf-8?B?ZlNxb3ViVXo0ZUxHbmVLSG1xSU1wRzFQblo3Um9qU2l0cWkyaFNocmRTLzhv?=
 =?utf-8?B?VEFyQTJiODdkOU9wa0J0RjRDR3ptT05UOURuZGgzbm1YSi9OSEVUNlpHTW1E?=
 =?utf-8?B?VUIwQmYxUXdDaXc1SzdmSEJUUDBrM1BmVWJubmNPbDlLbllPVkNCWHYzcE9W?=
 =?utf-8?B?d3lFTXZtLzdNZERtN0x5R3YwNENZc2QwTnFEaHE3V3ZVaHQ3Umsyc29ncnFL?=
 =?utf-8?B?aGd0Q1JxZTl6Y3VNb0tpMjR1NHZRNjl1aHV2U3lVaGhiTnd2TFloZEgySVh6?=
 =?utf-8?B?QkhiZGM4aytEWS8zTVp5TDNuN2k0Q0ZKUmlmR29qZVlkdEJhLzNtWjQ4Q1Fp?=
 =?utf-8?B?TTJaVnZiRjZ5UzhpbjFhcTRHU3J4WS9CejNjMnpFeC9idDliNWYwUitmRkl3?=
 =?utf-8?B?Qk5BYTA1bVZ6bkZvZXlhOFJmUVgwajBLMzVVYk4rbTMwM2V3RnVaOTNVZXFu?=
 =?utf-8?B?anNEMXJKR0NJWW5vdms4bDFUTGxzejhtSmhUYjBnY2plNVAzUjhpcnI3MXNZ?=
 =?utf-8?B?bGZGZU5jOXR4L0FTZmFMK042WWF1dTdYZ00zaDBOcmd4YzgxOE02cDFKbnFY?=
 =?utf-8?B?dnVvUW9aZE9iQTNXTUtTOVBwc3BIZGxDWHpGTWZtZ3FzbGhhOXZtZ0t3elJr?=
 =?utf-8?B?WWd6M2Z6d0xIRk1LbUNSZFRxN25QZ01TWmxiRllCbXd3NFAwa1NqcWltRjdS?=
 =?utf-8?B?dkNWVDlFalVFTy9FS0tWT0VWNzBBS2k4WVV6OVVzVnZQckNSMHdNUU04NnJY?=
 =?utf-8?B?eDlXTS9KUHJreFdMeVF0dm1PNE9vRG5pK3g2S0FhOXZFdno2T0ZuQkJPdnFZ?=
 =?utf-8?B?aTlGeHpaV3QwQlVRRHBlUGh0a3VISmZ0OWdyQ2tvVzdjTDNqQ0dUUmZPa2U2?=
 =?utf-8?B?cTNlbDlHVWJkcURRZ09VbGVMd2ZtUGllVzNyRlh1VnRKZkxob2xGVmRQdHV1?=
 =?utf-8?Q?GNgR3ysw3T+BooJ4qeDBX3hGU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd09962-4992-4b46-996a-08ddbccd74bd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2025 20:41:17.0745 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NoLRPj4XOD/hOTaixySPlsibLw8ro08wJzi6pbqn5zAJuhO4QNDHsBJ2QVajOc6oA7M2tR18/BsIGcX42PtSZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6877
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

On 7/4/2025 6:12 AM, Samuel Zhang wrote:
> When hibernate with data center dGPUs, huge number of VRAM BOs evicted
> to GTT and takes too much system memory. This will cause hibernation
> fail due to insufficient memory for creating the hibernation image.
> 
> Move GTT BOs to shmem in KMD, then shmem to swap disk in kernel
> hibernation code to make room for hibernation image.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 27ab4e754b2a..a0b0682236e3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -2414,6 +2414,7 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>   {
>   	struct ttm_resource_manager *man;
> +	int r;
>   
>   	switch (mem_type) {
>   	case TTM_PL_VRAM:
> @@ -2428,7 +2429,17 @@ int amdgpu_ttm_evict_resources(struct amdgpu_device *adev, int mem_type)
>   		return -EINVAL;
>   	}
>   
> -	return ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	r = ttm_resource_manager_evict_all(&adev->mman.bdev, man);
> +	if (r) {
> +		DRM_ERROR("Failed to evict memory type %d\n", mem_type);

For new code can you please use the drm_err() macro instead.  This will 
help show which GPU had the problem with eviction.

> +		return r;
> +	}
> +	if (adev->in_s4 && mem_type == TTM_PL_VRAM) {
> +		r = ttm_device_prepare_hibernation();
> +		if (r)
> +			DRM_ERROR("Failed to swap out, %d\n", r);

For new code can you please use the drm_err() macro instead.

> +	}
> +	return r;
>   }
>   
>   #if defined(CONFIG_DEBUG_FS)

