Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47699C859A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 10:05:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AAE810E7BC;
	Thu, 14 Nov 2024 09:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RXrYRxFm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2055.outbound.protection.outlook.com [40.107.96.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1548F10E7BC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 09:05:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGOc2BeML72UqQ42AMiElM7d7CueqEr4yaT1J7oHYepv/MOwpwUgqu6N9YgvR19VfVWzKOgL01vZV1ogEcpfXTkbxtD7R6MWzEjP1ZjqneOEfxaegym0fIG08rwrmTBIQaEajZYjHS8IwBa+Wpx281wLznDmlHFwsUdsxL8GRlyMpq3XizxOoSd2AhZBnenfnANupGMrxfw+MqXOcGAHrWJMTaNyYZd0PQ58h0FTb0XwA0JUHFixDP8YpmRvKUHtKP2JDcP8FduWqej8NJY4uqKiDrdjtmsy915tWbu9CEOqg0+qqKe1MbjsMxlCTQWY09bXT3QXXd0ZMr+AmvnQfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vQ5TciD53XcDnaDrYAXfjRScqZBa4c3yPgCn91IZlBo=;
 b=vQAvfY4LFVDP2x0kaEZvFOYC1arRxJ8mirIMQUh7sflCJDxPgrPXlcnjQFuugkgRswioNOA3rGU0vnGrgXURcW2ZYeyQWQlTzv3k/OdgT0KZPHocVHb66Qda5dJKEifYonPwG3yejTkW5AGu6069vwXAu6Lcgsu6gy7ScEZR3o7mqfZBaChZomzPK94QjYPdvSVNMIqR4qT4zP3V0tmKc+rM4dZT1kudJ9xm5LnPnmT3e2MwYuxrVNv5PYdu3Goh8ciFiOkfYwC3cWhRzFK/mlKxBr6MlKQxl8aB5D1j/SijWLWYgrqNDIhuXWbg/m1Sg0PoPHZS1vrf2XDNN+bAEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vQ5TciD53XcDnaDrYAXfjRScqZBa4c3yPgCn91IZlBo=;
 b=RXrYRxFmmf6fLhEg/6naOS82LluRnjLD9PHxptmnUsdLuXWF6n2dw9IVHmBeGFjp9V2BF1JoBrj0X4utKk2JQcZVSpuZSyzRqRZdS7FRcg0JJWnfDOF1m5a5+wCBzxrbhUFK1kEbOWOK6gWKmElJGVOyOvKO1kqBCWy7DlQOHFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA0PR12MB7089.namprd12.prod.outlook.com (2603:10b6:806:2d5::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 09:05:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.8137.027; Thu, 14 Nov 2024
 09:05:41 +0000
Message-ID: <e6e5ae86-a4dd-40fa-8178-91c442cedbfd@amd.com>
Date: Thu, 14 Nov 2024 10:05:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/2] dma-fence: Use kernel's sort for merging fences
To: Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20241113171947.57446-1-tursulin@igalia.com>
 <20241113171947.57446-2-tursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20241113171947.57446-2-tursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA0PR12MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e2dd8e0-118b-4865-b390-08dd048b83b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bitxU20vcWtwREErVU5IcTROTnNHVVVQeXJvUDJXaTRlM1BGV3VGcTBzN1NS?=
 =?utf-8?B?MVBWeTB3SUZybnBBcm9WYkM5SGMwVlk0bHkwS1RpTXRtRXNIdGJmZC9lY2hM?=
 =?utf-8?B?UVNuSUFNbzY5MTEvZmNuOTM3UWNqZnpzWFhWK1lOY1h4YkpraGZlcXlDejlx?=
 =?utf-8?B?LzZiUTNRTG5xMldBOGwzQWNpYytSb0tPZzVkeGpIMHFSSDR0YjFCdXFrU1c4?=
 =?utf-8?B?amFuMGRKSHFYYlpjUVZLWEdQYnVzeHc4cG0zUGVDK2ZDanFHVFZPWlhqWHNB?=
 =?utf-8?B?ZGR5cG9iYlJ0dStTUDY3RG1ITFhWU3kvSXdjbjc1M0ZLMGxOVDdlcWRYT3NG?=
 =?utf-8?B?b3AwVHhvS3JxRHoybFNreUlCT3czUUdNTkFWaTdaekd6YnJHV2hmUkFJVGly?=
 =?utf-8?B?NkpGMm1BOW1Bc0dIYVJQQ2xkMzIxU2h4YWNiRWNwRUJ1V0xudmQ1bk03UTJC?=
 =?utf-8?B?d3FaWlc3Mi9Yb3g4a205S2R4MWcvSTNMbnNjZXNCbFRnNFl4VFRIOHNzZHhW?=
 =?utf-8?B?OHVSV29ZcjkxTzYyNmV1VnVmQ2tnNVRiM1dGUHB5di9rWnFtRXlNNGplZWdL?=
 =?utf-8?B?N1ZEcTZaU2xEazBIQWM4ckFOZGFXUjQ3aytjb3V2bTJNeEFMRndLOHU0dVZJ?=
 =?utf-8?B?S1NwVkhiRlQxdzRJQk55cjBBdzdiZzhMZUxYRUFnTFdsT2NEWWNTMkZSWTV4?=
 =?utf-8?B?b1ErNEJ0WFphYW4wV09vRkN1aFg3WU9TemJvTU9DNXdWUnRsbDMybUY2N09O?=
 =?utf-8?B?WVV4K0g3aU9EMG5PWWFlL2VSaWpKYXVTZXdhVDlGYkNpTFZrSjErem5OaTFs?=
 =?utf-8?B?RTJtM2xER2xTVCtpTkxCd3dPaVZvQ2ZJMFdSbHZybWNuOThlK1NiR0pqT3l0?=
 =?utf-8?B?V3NqNUZkVy8wbnNGS05zWlVKRSsxdS9GdjlwTXM0c1FpaG8xWXFkNHJFcHYr?=
 =?utf-8?B?aUNsNEc1Q0RWb1JEbmRjUG0wTnhKeEdEejlQYkxFZTJPeXVYcmo2VHZPc21k?=
 =?utf-8?B?OGpSbUJLa2k1T2hsNEowZUZKem1jdnJEMDAySGRISnJhMDR3aEZua3pldXMv?=
 =?utf-8?B?S3FUeStIQVZRTWtxNHNzVThEbG9rb1RPMEpkYlk1SW1oRjFuOHZUcHVLeDNa?=
 =?utf-8?B?VEJlQ3pQbmlVaWpGRTJ1TTY0T2p0Q0F1QjEyeUFxVm11QWVzNk8vb2JTMkla?=
 =?utf-8?B?dDhGQTF6eE55bjZxMXpRV3czMVlocmtLREYyTkh6Yjl3VDZJSG42eWQyZS9W?=
 =?utf-8?B?VnpnUzYzc0pJSm0zanZSODFESEFwdnFudGRTK0g0UENIdmxadFRVY1dpSHNX?=
 =?utf-8?B?WVpwRjU0SElFQjZYaUFCbS9UZkVVTUlXM1ZNZE05cFA1bjd3S1pZa0kvTGNv?=
 =?utf-8?B?RDVJSWFUUkxhektJU1I1OXNnTGF2Nk96SEVaMmg5RlpjaWRoSE9QRExjdFF2?=
 =?utf-8?B?emVEZW8ySzZzRHV4VWJmYUZhVzMwblFnRmo4V09xQTZpOVZwbThQTG5yZ2Rz?=
 =?utf-8?B?UEJaUDVDbDFRZnY0WFEvdjFmeXgybG1tYUNyUW5BQVhzaUYweFZUSlRmOG9v?=
 =?utf-8?B?QUlzMFkwSXZFenQ2UVhrbG5NcUIvUWxSL3JVNTVtV0JCN1crTEVzTjRWVUVZ?=
 =?utf-8?B?bVNFem9OVFpJR3EzZ3o5aDZjekNxL3dPUlFMUldFeUZpVGx5SkVETjJzUTgz?=
 =?utf-8?B?UHNyRm5abm1CNFhiUGF4bklLaXhTTjY4OGR1Y1A2VHB0OEtzUUVQb0Y5WnBQ?=
 =?utf-8?Q?x6jb25RPGgl9YMTIN3y0yGgwz6VvJQnU5sgOjEf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXNRNTNUUXpxcFM5SFVDOHZJSWl4NGJHN3FmNU03a1Z5SGF1MjRyWndYSmF3?=
 =?utf-8?B?NExNWUNodFpmckNrQmdsaVZ6T1drSzM4WnlFV0UxelM2Sko5dm1qaUwvbk5k?=
 =?utf-8?B?RytJZEc0RmVCbUVJOWZWOE1tbE92N1J2aHM1bjM1K1MyVXk4RkZRbDlCcG5a?=
 =?utf-8?B?OGZBVTdQNG82dkFNWEVWYk5vWWhRRFNjbURiYXdXeWlDdy9vQkhhQ2dMOTJM?=
 =?utf-8?B?cEIvcEE3dERSdyt0cDlpcUlZY01kcFY3Y2ZMZlpadnhaUGhwMFY3NWZSY2Vx?=
 =?utf-8?B?bUphem5MUUprMXdhb0N1Vm92SWFDeTlrK2pPNGFVQmYxY01xYm0waWNBbjhw?=
 =?utf-8?B?Q3V6QWZYaGlqYXdGNFdrMUQzaXBRcE5ZTTRlZ0pKeGcyckhiOFVYdnp1UU9a?=
 =?utf-8?B?NTJjQytvM2dycm1QbUVXMXpER3AwaDd0bzFUUWMzcEdLWmQ0RGh5WVFnc0J6?=
 =?utf-8?B?c3NleldFZjAwUXdZcTZtUmFscExPRWoyb3gxb0V4WUd1TFlUSnZ3clE0SDYv?=
 =?utf-8?B?bUc1bzQ4cXd6N3Z3UkEzT2FnWmpIRmk0bDlkbkNWUzFwK1FFMTlPZzd6ZVNV?=
 =?utf-8?B?SlZhTkk4SmtrWjJZajBVbkdGVEFhcmxnTU8vMDVYV3pCZ0hTZlhGbkxpZTBi?=
 =?utf-8?B?NDdSUllVWFlKRE5aZW1EZ29tMENzbGMxcms1dkhDdVF0WUplcFZXQzN4dHNR?=
 =?utf-8?B?YmpFNHJpTFNvUDBPV0FQYUlyQWpFMGhmd2l4ZmpmdHlJZXlBMm1JYVhxd3oz?=
 =?utf-8?B?OW5GWG5XWFY4OVZaNVVUSCtQZytyRmhaenJ5RkVTaFM0TGlKRjVIT3k4L21a?=
 =?utf-8?B?V051MzB2eGVPN0QvZ0VVQUVpTDhBWjJsenduR1FObHpJUEdJNXQyRjJpVStw?=
 =?utf-8?B?U2R1cHRWSWtHcm9DN21CbTNiK2NiVVBBRjlUM0FPU1VmQkI5N0ZjMVQrZHBu?=
 =?utf-8?B?SXNKSnVuMzJlOXU4dTNJcVl4N0x1cmNHNndUOU9ZZTFaN2E2OGcxa2tqSFc5?=
 =?utf-8?B?MFFEYy9sdzFzQ09TeGR0Sk9qWm5FZitrbzJCU0NiOWFVT0FUNUhZRm84dGNj?=
 =?utf-8?B?bWROOUt0blhDMkF5MXV3VmMxamY5TzBoU3ZLenppZ3hiS09ZWmloK3FDS2RI?=
 =?utf-8?B?MjNIb1AvZ1N1UXBYbXNOTkFkb1ZsRmtjQnNwM01mUTVQbi9HRVQxbGlxZUJ4?=
 =?utf-8?B?U0wxOGJyOUxXVFFkaWtlU1RSeWxLMXl6NEdybVlrbUZlUzVwNlN1M1JCbS9h?=
 =?utf-8?B?VmI1L1VNcjA0cFRlVWZIZFZsbW1mSHdiR01kZmpyUlFOTUQ5SGp0eFZWcnFs?=
 =?utf-8?B?c3VpekFFZmI4eFlidEFtdVJFRWo4UElOU0ovTm1QbXpidlBvUGZGMlBndWpw?=
 =?utf-8?B?dlZsbENZZkI4bnd2YkRQMHhwVDArWDh5MHFPUDExVVZpd0ZCajlTSC9mZUo4?=
 =?utf-8?B?Y01hN0lrRDNCYnFMMllMV1didW1xNXJvcHhHYXlFLzMrTXdDdWM4OGdvWWt4?=
 =?utf-8?B?YjJEZkJCcjhWaTdqZmJiT29LMlV4RlRBY3orV3VQYnpyZVAxZnhnZzV2MXZZ?=
 =?utf-8?B?TncyRFJuMmlwdUJNZG9PZEh6dDh2b2ZsbXBQTlNNdFlzRXBwWG94eDVxOTg0?=
 =?utf-8?B?RC9VWmNqVVh3eE44MzA4RTJRd212K0dnbThIUGtUUlBYbjRBR1JCZE9STko2?=
 =?utf-8?B?OUpEMDRDWDV0Vms2bjI3aGNZczBvV29iZ0d6QXZxQ1AzSGtsdWplaWFkWmJG?=
 =?utf-8?B?SFNBb1RpQ3FqRE90NE1STkVCRGpwSkIvaStHTWMwaUtaUzhuRWlNcDZaWmxF?=
 =?utf-8?B?R0tzZTFyLzhROVZ0OUpsaG4zeXRJeWluU3BPUVFWV0t1MFhBZ1FXdEVzVisv?=
 =?utf-8?B?Y2hydWdvT01RWWRYelM3UUZlNFN4ckFyaXVaOXFMY0IyQ3RQdWVGdXZ2cVB0?=
 =?utf-8?B?V3c3TzRDY3RTaVZ5czJMb3EzUmYzYTRkM0lRUTl1bU1LNlRRVm1Bb3BoMzQv?=
 =?utf-8?B?N0p4dFR4UldrYW9SMzFkZGVTTFhYaVA5R1c3d3pSWEI5ZExjSmF4REtZak8z?=
 =?utf-8?B?ZXByMUV0NVF3Wm5ENjR1SlVtVTZjQzVVUVAyRGh2NTQ3U3NzQTZ5UXhRUXJH?=
 =?utf-8?Q?+rn6mi30+n5kF63eJfObiZgcH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e2dd8e0-118b-4865-b390-08dd048b83b9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 09:05:41.5662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cJxqHD/slscOcLOPwEJp1Yi6WmMxl7fEsZkHKNzlIBPAlJlRB2X87twIqGQHvN0i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7089
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

Am 13.11.24 um 18:19 schrieb Tvrtko Ursulin:
> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>
> One alternative to the fix Christian proposed in
> https://lore.kernel.org/dri-devel/20241024124159.4519-3-christian.koenig@amd.com/
> is to replace the rather complex open coded sorting loops with the kernel
> standard sort followed by a context squashing pass.
>
> Proposed advantage of this would be readability but one concern Christian
> raised was that there could be many fences, that they are typically mostly
> sorted, and so the kernel's heap sort would be much worse by the proposed
> algorithm.
>
> I had a look running some games and vkcube to see what are the typical
> number of input fences. Tested scenarios:
>
> 1) Hogwarts Legacy under Gamescope
>
> 450 calls per second to __dma_fence_unwrap_merge.
>
> Percentages per number of fences buckets, before and after checking for
> signalled status, sorting and flattening:
>
>     N       Before      After
>     0       0.91%
>     1      69.40%
>    2-3     28.72%       9.4%  (90.6% resolved to one fence)
>    4-5      0.93%
>    6-9      0.03%
>    10+
>
> 2) Cyberpunk 2077 under Gamescope
>
> 1050 calls per second, amounting to 0.01% CPU time according to perf top.
>
>     N       Before      After
>     0       1.13%
>     1      52.30%
>    2-3     40.34%       55.57%
>    4-5      1.46%        0.50%
>    6-9      2.44%
>    10+      2.34%
>
> 3) vkcube under Plasma
>
> 90 calls per second.
>
>     N       Before      After
>     0
>     1
>    2-3      100%         0%   (Ie. all resolved to a single fence)
>    4-5
>    6-9
>    10+
>
> In the case of vkcube all invocations in the 2-3 bucket were actually
> just two input fences.
>
>  From these numbers it looks like the heap sort should not be a
> disadvantage, given how the dominant case is <= 2 input fences which heap
> sort solves with just one compare and swap. (And for the case of one input
> fence we have a fast path in the previous patch.)
>
> A complementary possibility is to implement a different sorting algorithm
> under the same API as the kernel's sort() and so keep the simplicity,
> potentially moving the new sort under lib/ if it would be found more
> widely useful.

Well the API would need to be different from sort() since a merge sort 
always works with multiple inputs and a single output.

But from the number you gathered I really don't think we are going to 
need that.

>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Friedrich Vock <friedrich.vock@gmx.de>
> ---
>   drivers/dma-buf/dma-fence-unwrap.c | 129 ++++++++++++++++-------------
>   1 file changed, 73 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
> index 75c3e37fd617..750dc20a9e9d 100644
> --- a/drivers/dma-buf/dma-fence-unwrap.c
> +++ b/drivers/dma-buf/dma-fence-unwrap.c
> @@ -12,6 +12,7 @@
>   #include <linux/dma-fence-chain.h>
>   #include <linux/dma-fence-unwrap.h>
>   #include <linux/slab.h>
> +#include <linux/sort.h>
>   
>   /* Internal helper to start new array iteration, don't use directly */
>   static struct dma_fence *
> @@ -59,6 +60,25 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
>   }
>   EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
>   
> +
> +static int fence_cmp(const void *_a, const void *_b)
> +{
> +	struct dma_fence *a = *(struct dma_fence **)_a;
> +	struct dma_fence *b = *(struct dma_fence **)_b;
> +
> +	if (a->context < b->context)
> +		return -1;
> +	else if (a->context > b->context)
> +		return 1;
> +
> +	if (dma_fence_is_later(b, a))
> +		return -1;
> +	else if (dma_fence_is_later(a, b))
> +		return 1;
> +
> +	return 0;
> +}
> +
>   /* Implementation for the dma_fence_merge() marco, don't use directly */
>   struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   					   struct dma_fence **fences,
> @@ -67,9 +87,12 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	struct dma_fence *tmp, *signaled, **array;
>   	struct dma_fence_array *result;
>   	ktime_t timestamp;
> -	unsigned int i;
> -	size_t count;
> +	int i, j, count;
>   
> +	/*
> +	 * Count number of unwrapped fences and fince the latest signaled
> +	 * timestamp.
> +	 */

What is done should be obvious from the code, only why something is done 
needs code comment and explanation.

>   	count = 0;
>   	timestamp = ns_to_ktime(0);
>   	for (i = 0; i < num_fences; ++i) {
> @@ -98,74 +121,68 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned int num_fences,
>   	else if (count == 1)
>   		return dma_fence_get(signaled);
>   
> +	/*
> +	 * Allocate and populate the array.
> +	 */
>   	array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>   	if (!array)
>   		return NULL;
>   
> -	/*
> -	 * This trashes the input fence array and uses it as position for the
> -	 * following merge loop. This works because the dma_fence_merge()
> -	 * wrapper macro is creating this temporary array on the stack together
> -	 * with the iterators.
> -	 */
> -	for (i = 0; i < num_fences; ++i)
> -		fences[i] = dma_fence_unwrap_first(fences[i], &iter[i]);
> -
>   	count = 0;
> -	do {
> -		unsigned int sel;
> -
> -restart:
> -		tmp = NULL;
> -		for (i = 0; i < num_fences; ++i) {
> -			struct dma_fence *next;
> -
> -			while (fences[i] && dma_fence_is_signaled(fences[i]))
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -
> -			next = fences[i];
> -			if (!next)
> -				continue;
> -
> -			/*
> -			 * We can't guarantee that inpute fences are ordered by
> -			 * context, but it is still quite likely when this
> -			 * function is used multiple times. So attempt to order
> -			 * the fences by context as we pass over them and merge
> -			 * fences with the same context.
> -			 */
> -			if (!tmp || tmp->context > next->context) {
> -				tmp = next;
> -				sel = i;
> -
> -			} else if (tmp->context < next->context) {
> -				continue;
> -
> -			} else if (dma_fence_is_later(tmp, next)) {
> -				fences[i] = dma_fence_unwrap_next(&iter[i]);
> -				goto restart;
> -			} else {
> -				fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> -				goto restart;
> -			}
> +	for (i = 0; i < num_fences; ++i) {
> +		dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
> +			if (!dma_fence_is_signaled(tmp))
> +				array[count++] = tmp;

Same problem as in patch #1, you need to grab a reference to tmp here.

Apart from that the patch looks good to me, but I would reduce the comments.

When we need to explain what code does then the code need to be improved 
and not documented.

Regards,
Christian

>   		}
> -
> -		if (tmp) {
> -			array[count++] = dma_fence_get(tmp);
> -			fences[sel] = dma_fence_unwrap_next(&iter[sel]);
> +	}
> +
> +	/*
> +	 * Equal fast-path as the above one, in case some fences got signalled
> +	 * in the meantime.
> +	 */
> +	if (count == 0) {
> +		tmp = dma_fence_allocate_private_stub(timestamp);
> +		goto return_tmp;
> +	} else if (count == 1) {
> +		tmp = dma_fence_get(array[0]);
> +		goto return_tmp;
> +	}
> +
> +	/*
> +	 * Sort in context and seqno order.
> +	 */
> +	sort(array, count, sizeof(*array), fence_cmp, NULL);
> +
> +	/*
> +	 * Only keep the most recent fence for each context.
> +	 */
> +	j = 0;
> +	tmp = array[0];
> +	for (i = 1; i < count; i++) {
> +		if (array[i]->context != tmp->context) {
> +			array[j++] = dma_fence_get(tmp);
>   		}
> -	} while (tmp);
> -
> +		tmp = array[i];
> +	}
> +	if (j == 0 || tmp->context != array[j - 1]->context) {
> +		array[j++] = dma_fence_get(tmp);
> +	}
> +	count = j;
> +
> +	/*
> +	 * And another fast-path as the earlier ones.
> +	 */
>   	if (count == 0) {
>   		tmp = dma_fence_allocate_private_stub(ktime_get());
>   		goto return_tmp;
> -	}
> -
> -	if (count == 1) {
> +	} else if (count == 1) {
>   		tmp = array[0];
>   		goto return_tmp;
>   	}
>   
> +	/*
> +	 * Finnaly create the output fence array.
> +	 */
>   	result = dma_fence_array_create(count, array,
>   					dma_fence_context_alloc(1),
>   					1, false);

