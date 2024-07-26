Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E675993CE73
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2024 09:05:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF43B10E92F;
	Fri, 26 Jul 2024 07:05:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VydKO1qI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB86A10E2B9;
 Fri, 26 Jul 2024 07:05:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vhSJKgCpEaDQ4zaMztaIHfJHVxYuOO8QwyoDWf5iLq5jm0pyRmQV0rEAk3MgdgY9yaWtcgsiVqnoleCBiWFYKFtgsk/QwR0PL9pBFur0qQIaRQmPp1oBR86/ztUxcLMCqKyQnTWvmKUbIwKDvNBLkt0bpWJySdxmEgKyz18UoUs27XtS4GBj/PreUH9dZT6MwC/EU7isGna8wvj3LuVVZrdnz/BFFgjiYaM6Wtno3hDHBIlBLRLUTE/mSq4+p9CGmmQR7QFPr3tpXMvGCxWeKBZ1NIwg0ZP59U+zxCMA2hg17yqZfu8xbV8cATTW1HoyZgl92T8nSjMBwQdtd7c1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qbISvFNesB+YOBhIskwaroFX32I8IARzN8QE4D0ygkg=;
 b=wu1E3zn4hPW+0U+aE+E/Zh1KRcdGNIGQdwIml7uBYo2yW9dfq8NfTE56/VcM6uJfX7lYUY06BO9VGmet3Uffpe2EATi8zc/hvaTvCrL3ODuJmS29nzmwCPEvVXHSzns16FK8KHMlHI+o0FtTabU3wPKSat4lOM/pXk3BRnCNXe+SKWv7bESwmg/Lbhl8Mos9Mf10J+OijrS369VixMxQ/apN+JIqdGluNPrz7k7butL1LxSQ0p7wrdRV83I/+wo4kbJ4NPPLEwJa4ONO56pNbpyrLIyPtsyk/kDur37clXKWQkIo4C0Dlx/L11oU8tguoXPjIJ6BO/geBJpv70Qwaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qbISvFNesB+YOBhIskwaroFX32I8IARzN8QE4D0ygkg=;
 b=VydKO1qIYHiVltphyAOHSMlHXo84LUZhYEaSQ1nVESGJ/dBF7liRxliOVTuCoZiqrOAAvxZD5ueZKIefCjbUTw9k68fQKs+Csd5pbb6D+EAgK9wNEDZlkUk/JfuPt193lbvAZTsR6rjwBES5Z11GwBL0S8VZWK8PWQ2ymx1C0wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB5841.namprd12.prod.outlook.com (2603:10b6:8:64::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 07:05:46 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7784.017; Fri, 26 Jul 2024
 07:05:46 +0000
Message-ID: <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
Date: Fri, 26 Jul 2024 09:05:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0400.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::20) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 885389e4-d85b-4612-46ca-08dcad415f0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2RLTjdreng1OFBPZ2tMVFlaY0dNbXhpT3FLS3RBK084dlR5bWYvaWt2R09G?=
 =?utf-8?B?aGVMVXhoT3dnSURSNFNNYWxYK3lvNWorWS9zYTZXZXpCSjFNeUx3MEpma2pZ?=
 =?utf-8?B?MFI2enRMa0craXZmbXd2T3Z3UjR3REszRHZnN3o5VjdpV3ZVTEFkaTFJSS9r?=
 =?utf-8?B?TEhJRmE5c053eEJ0Q1VFeWV1M1JvNjZ2N2hhV1FBdThWZGlaZGVJc05ZeGNz?=
 =?utf-8?B?VnJKeDRQYnNKMGJ1RzdPZ00ydkxNQTlsZjBxUHo1ZXF1cmNBZlB3TTVsNjRI?=
 =?utf-8?B?WjRNUlVIaXAwQzJOUXI5cEVOeTU4aElwcHNYSFBjMndEUEFtazJCWG1FMURD?=
 =?utf-8?B?MnYvb041Y1o5Ry9NSUkrZlVHWEcrelAxZ3N4MXpLeDFqTWJMSERsWmVudzNh?=
 =?utf-8?B?THoveloyT0I1MThrV0NpOEpBUGRvRGFGeHRTSld1TVdtdkJIbHo0aGx6N3U2?=
 =?utf-8?B?RnFUYkc5aUhsbkprbFIwTnhidHJvTE1RdHdyNURLQ2JiMFFKd1VkSkFrRHFs?=
 =?utf-8?B?UTJXVmNwR0hPTGFzeG11Ni9BMHJqZWMxZ3J6VzI3RnI0STZQSkVuMHlJN2Z3?=
 =?utf-8?B?aVBWQ01hOFUxWHdTbkJlQktqZzVTZTZGNnR0NE9SMnZZTDIvTmx1U2d6TkNs?=
 =?utf-8?B?YUpWd0FwWXFxZlVyalN4OTI2V0hVTURMSW1oY0tEdFZnc1FMOW94blZnYmRB?=
 =?utf-8?B?MTg3NERSR0NTaENWamFNamFVZVFxVFBzdUU0Y3pmcUNncmpzUjVtLzhkL3ds?=
 =?utf-8?B?NVNWbUVoQTFPTzNxUzlPeTJiR3ZzaUJWd0FYTWYybzAxS0YxZm1tSmoyY2Va?=
 =?utf-8?B?T2RVdFR1MTNSTjVHbXZKQ1BKMUNrUmR6cnFMcFhTc1RobXFjbXlQQlYraHMr?=
 =?utf-8?B?ODB5YzJyK1d5ZjV5L1U5a3ZBa3ArNkl2UWhLTWI3eCtGK0FrQUhIL3k3d29n?=
 =?utf-8?B?NlZkYVIrQkFOWHBDZG1nUGZlU3dZSGV1OGFyT3M3VDhIMlVOdTBHMFg4WWVR?=
 =?utf-8?B?UnpKK25xRXJNbkxVY0ZKMkZaZmx3UnNrSlFCT2FibHYzYzhKbjZOWFgveWhS?=
 =?utf-8?B?U3RRRlpaTjVLUGZjZERwd3dVSUU4U280ZHV4Tlc5QjVHN3hNYllUNUZ6RG9Y?=
 =?utf-8?B?RnBycDZNdW1LU2pVYk9yMmtCTWU0NkFPb01ST1FVajN4WGI1NlF1REhVQWJi?=
 =?utf-8?B?M3pCQkR2Tk5VV3hwbkVCR25ydEprT1pObXpzYktWVm5VUUpWazMrU0JWRHpF?=
 =?utf-8?B?UmEwOXMyRzdVazJFYXNKYzhNbVdTL2t4Mmg5bWxMNFBvS3hTUXJMOERzWVgy?=
 =?utf-8?B?OVh2aU9yeUN0M215RVorUHZLb0l2Zmw3Y2I3Rk83SlpUSXRocXlMY2FCWEhk?=
 =?utf-8?B?N1RXRGxtYXdzRE5UbGVWdE95ZmRMUU5NcEdKM3p2REEvZVVnQnI2NUxTTHJt?=
 =?utf-8?B?S3paaTZDRmJScUZHSURLUEYybkJNMjZQMG9VN2d3VS9qTnBJbi9JdVFDNDdR?=
 =?utf-8?B?TUJWV1ZDZmpzRUgzTkpFZmx2ampWZ3d4YldWMXdIN3lkQ2xZK3UwYS9aNjQ0?=
 =?utf-8?B?RUxQejIzZDM5ZXlPWEhVeEJmbmoybHBRM2RicWhSSkhScS9LYWlPaWRnR0Jm?=
 =?utf-8?B?eWRzRHlpN3pHaERHclQrcUFaWGtPN25BZkRjNTdORVJqZm9idEcxd0trUHJW?=
 =?utf-8?B?c3RDNUN2dk1KbCtsVnJPU0IyRmJydVdibm5ydE1PckZMU1VDTHlObm1XKzFC?=
 =?utf-8?B?MHAyTTg4c3NSdkhGbG9teUZ4Wk51djVqWXNUSmNib2FucTVnaG1lRjRTTlZm?=
 =?utf-8?B?TEhIVW9CdUhqMEp5d3h1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGxmQ1BCRkF2Tmc5aFlvV1Y1NlZSeTZtM3FuR2wrT2VLS29HcVBWcXp4UG9R?=
 =?utf-8?B?eEJPT3VXYjRoSzM3Q2dUOTBES1F1R3dlRy9vM29ydmVaUThiREd4Q3JYaVJr?=
 =?utf-8?B?V0duSEhqc1piNnhWRVBoVnA3ejNGWE5FVTZjQ0JaVFRqNnp2aU5EZlk2Nzhj?=
 =?utf-8?B?U0FiOXpPUWVDUGhJakdYeDUvK3JxUUhOTHRyNU9ON0FrUjJxSWNETkhjMVhm?=
 =?utf-8?B?VjNmcXdwMWpTWUVTUHhpSEhHU0U1YXdtZUdUbGFTa1RZUEFSait5L2lkWjd6?=
 =?utf-8?B?UTlwcGZzaTJETUc4VDNuUDVhWUF6bDB6Y2p5UnRSQWY2K0JzQkxoQUs0TGpM?=
 =?utf-8?B?OFJWOUo3RFFUOEpSOEVXODJsZTlkOGRCWjRtZkZvZDZJeEE1OVcwcmxtUHhR?=
 =?utf-8?B?T3luYm0xMXp0Q0kzdHRtLzdvcDBCMDVVWThZMVgxbDlieWJpc2VDdHBSTUln?=
 =?utf-8?B?NDYwRXplM25ibi9VeFYwbDBkV21LV1BERlpVQnY4UGNzcVh5MU51blJvSEJv?=
 =?utf-8?B?QXV1ZjQ1Umc0NlQyOGhsVkx0STdVSERFK1BwVHZxMkg0ZUdEd053SXVQVEhm?=
 =?utf-8?B?Y2VjMmsvdXlYWEhNVTBIUDZmUS9KNmVFUk1KbFZvYlNpak95bGt5REdTNnh4?=
 =?utf-8?B?NTkreDVUUlJGdVJ2WjJiUGFGK0hwTzdpcjRLbkgybklldlFOQ3dnclhiNjB2?=
 =?utf-8?B?YjhEVExSMVRVMU9lM0N5NXplWEFFVlZ2VUJEa0ZSR3ZCVktpSzRHbGdSQVVm?=
 =?utf-8?B?VjNkRnlKUTcxTWFVei9WWUNTckxnSUxOMTVBZkt6MDJkSk5rSjIzRXpWcTNx?=
 =?utf-8?B?Q1lXMkRzV2FtUVVMSC9palIyT0wzOUFlNEY3RmJMS3IrVkNDVzViSzhQUysy?=
 =?utf-8?B?R2JGU1kwYjJMV2RtaUpuVjJWRVRIT2xKV0lJbTRJK0pvZEVVM3JXYWxQS1V6?=
 =?utf-8?B?LzZkbVByWmZHQ3BsanBSUkxaOFMrVzc2OWJDTFEreHZXNDVTSy9sdUowTUla?=
 =?utf-8?B?V1VDenJpV3c4WlZEZERZTTFsRmFoOTVjYzU4ZUVjb0o2aWVlTjlGUmkrVC9a?=
 =?utf-8?B?Q0RZQ1lEdStBc1o1NzhZTjVOdGh6RXBYazRsVXBQL2JxRVE2VytGNVhTQ29p?=
 =?utf-8?B?NDluWjRCUVUwendQZ1lMUzRYR3hnQmhtWVdVSGcwYnNPVDdRcGlhZ1psNXBz?=
 =?utf-8?B?WXZrbzlIYVZPazVqMnBFQTlsYzd6bk1jcEhRRittdFc1ajQvYlNZUk4yTWN5?=
 =?utf-8?B?ejl3ZXhrWjdROUZGTUM2REJvRHlFVGlJL2w3M2RBVWZBd1dLSUpFR0U1bkFl?=
 =?utf-8?B?MnZKU2p3bnBvRlh4a0QxYTlMU1NjOTd5L29xSEszQXJMZTRYMzJUOFByUXdS?=
 =?utf-8?B?UGNzZk54WWgwQnVWcmdTYUYzQ1dncFdmS29BL0w1VjZSVTdtOE1hTGd2Z3NY?=
 =?utf-8?B?WU5heFljTmtqZHA2WlVoSC91VzRwb1dyQXJHRy95clNOOTFiOVJQczlydGov?=
 =?utf-8?B?ZWFoZnF4WEREd24rL1hjYmdWRlBnTnB0emp5MVRUeGVZamdLZWcrQlFWKzU3?=
 =?utf-8?B?Sit5NFVnRitTZDBIV2VzUi8xV3lwc3VyMm5qZ1RjNU93UkhDSGRNbmlJVkNU?=
 =?utf-8?B?SjhNRDVlQ2c2UGFXbTFuakhsaFc5dFJjdms2eUY1Zitwalg4ckcrZUdNVVRC?=
 =?utf-8?B?aG1mdjkvVGNMN0xNTzRnOXgyc0x0Z3VzUDVuMksvZ0J5bHBTdFdDWExyTUhy?=
 =?utf-8?B?K1U4WUVCMXMreFR5UFpVUDhpTEdBVGVVREtvcWdROURCVlcxK3Jub3pvaDl5?=
 =?utf-8?B?MldIdWdrZS92b1BrdGliQWxtU0poVzJYSGFXd3ZObmcyWWVsNTNIMjlZSlJR?=
 =?utf-8?B?emR3SGJ0ZHR6eUF6QWZRMnlVWjlXMzhXV1lqR2NsdUJQRmxQSWFXZnZPcGd1?=
 =?utf-8?B?bVZRTDFlc05vSVJ2bWsyRVZxUm4rR0VRV29FVzdrZGpSWWdxS1hUYnYrd3Ro?=
 =?utf-8?B?TVptV2t5RnNRYnNxK2dkZXZoZmVGb2M3aWNoRmFMUkFoc3Qrd0MxZXJtbFFI?=
 =?utf-8?B?UUdnYUJWWGVyMmsvS2QzWUVjNVU4bW92SUQ0K1JTdUVWNmtnSk9MSlNwdjhM?=
 =?utf-8?Q?uctk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 885389e4-d85b-4612-46ca-08dcad415f0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 07:05:45.9983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZW/xhoSeKcAfk/LcrO26agerSDD9kEkwd7sJ2E/XwZo1b+02erlBWQ/wLEVZXvz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5841
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

Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
> Several cs track offsets (such as 'track->db_s_read_offset')
> either are initialized with or plainly take big enough values that,
> once shifted 8 bits left, may be hit with integer overflow if the
> resulting values end up going over u32 limit.
>
> Some debug prints take this into account (see according dev_warn() in
> evergreen_cs_track_validate_stencil()), even if the actual
> calculated value assigned to local 'offset' variable is missing
> similar proper expansion.
>
> Mitigate the problem by casting the type of right operands to the
> wider type of corresponding left ones in all such cases.
>
> Found by Linux Verification Center (linuxtesting.org) with static
> analysis tool SVACE.
>
> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling informations v11")
> Cc: stable@vger.kernel.org

Well first of all the long cast doesn't makes the value 64bit, it 
depends on the architecture.

Then IIRC the underlying hw can only handle a 32bit address space so 
having the offset as long is incorrect to begin with.

And finally that is absolutely not material for stable.

Regards,
Christian.

> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> ---
> P.S. While I am not certain that track->cb_color_bo_offset[id]
> actually ends up taking values high enough to cause an overflow,
> nonetheless I thought it prudent to cast it to ulong as well.
>
>   drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c b/drivers/gpu/drm/radeon/evergreen_cs.c
> index 1fe6e0d883c7..d734d221e2da 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>   		return r;
>   	}
>   
> -	offset = track->cb_color_bo_offset[id] << 8;
> +	offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>   	if (offset & (surf.base_align - 1)) {
>   		dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned with %ld\n",
>   			 __func__, __LINE__, id, offset, surf.base_align);
> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>   				min = surf.nby - 8;
>   			}
>   			bsize = radeon_bo_size(track->cb_color_bo[id]);
> -			tmp = track->cb_color_bo_offset[id] << 8;
> +			tmp = (unsigned long)track->cb_color_bo_offset[id] << 8;
>   			for (nby = surf.nby; nby > min; nby--) {
>   				size = nby * surf.nbx * surf.bpe * surf.nsamples;
>   				if ((tmp + size * mslice) <= bsize) {
> @@ -476,10 +476,10 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, unsigned i
>   			}
>   		}
>   		dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %d, "
> -			 "offset %d, max layer %d, bo size %ld, slice %d)\n",
> +			 "offset %ld, max layer %d, bo size %ld, slice %d)\n",
>   			 __func__, __LINE__, id, surf.layer_size,
> -			track->cb_color_bo_offset[id] << 8, mslice,
> -			radeon_bo_size(track->cb_color_bo[id]), slice);
> +			(unsigned long)track->cb_color_bo_offset[id] << 8,
> +			mslice,	radeon_bo_size(track->cb_color_bo[id]), slice);
>   		dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d %d %d %d %d %d)\n",
>   			 __func__, __LINE__, surf.nbx, surf.nby,
>   			surf.mode, surf.bpe, surf.nsamples,
> @@ -608,7 +608,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>   		return r;
>   	}
>   
> -	offset = track->db_s_read_offset << 8;
> +	offset = (unsigned long)track->db_s_read_offset << 8;
>   	if (offset & (surf.base_align - 1)) {
>   		dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>   			 __func__, __LINE__, offset, surf.base_align);
> @@ -627,7 +627,7 @@ static int evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>   		return -EINVAL;
>   	}
>   
> -	offset = track->db_s_write_offset << 8;
> +	offset = (unsigned long)track->db_s_write_offset << 8;
>   	if (offset & (surf.base_align - 1)) {
>   		dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>   			 __func__, __LINE__, offset, surf.base_align);
> @@ -706,7 +706,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>   		return r;
>   	}
>   
> -	offset = track->db_z_read_offset << 8;
> +	offset = (unsigned long)track->db_z_read_offset << 8;
>   	if (offset & (surf.base_align - 1)) {
>   		dev_warn(p->dev, "%s:%d stencil read bo base %ld not aligned with %ld\n",
>   			 __func__, __LINE__, offset, surf.base_align);
> @@ -722,7 +722,7 @@ static int evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>   		return -EINVAL;
>   	}
>   
> -	offset = track->db_z_write_offset << 8;
> +	offset = (unsigned long)track->db_z_write_offset << 8;
>   	if (offset & (surf.base_align - 1)) {
>   		dev_warn(p->dev, "%s:%d stencil write bo base %ld not aligned with %ld\n",
>   			 __func__, __LINE__, offset, surf.base_align);

