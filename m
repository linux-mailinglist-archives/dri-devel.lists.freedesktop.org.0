Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8889DA84A94
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4095D10EA60;
	Thu, 10 Apr 2025 16:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wnw4iA4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5EB10E375;
 Thu, 10 Apr 2025 16:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fz/omjotB3odNH6ngJrvIOxaatbEA9ZwMvvsBz5hZe0vIGHHf/kxppZgYmRXmT5wN4Ktqwf2wqC+bG4G9ArvQdLa0GmgXU0R3xodRrSQGI4IN78IUEHncL+LeBusxV7Twx/xBgZXl27bfaKV6oYavIBCcfCWNKqEjQX3xWfs4euXekbzBtTgSzLR1BhHfCxcDvuALaYBumX7R8M+K7s2A8BRDa+0o/pJbiD+fDquMwGDvTPFzT6V2Hv7ptlwvkzaQLhTQHu6rJXDdBYgM3/zCBxs2wA+uuM3lVoWi2N8hvBB9ar0nppvIG+iDuzz7q2tl+oWKI7YNGEk2gNdN3Hufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7uppCVmNCtTPZFP6Lt3QAsoh7S3GkcHBhRHK2aCfio=;
 b=hNhCi9eO9GwIcCESWVUPA9Okhdquv3ZGn0SbtDL/3Yl+swr4E3T0nguZLMRFll8KCQobcvxgpM+AOb3RA09lGvtLUKhS/nx0gxzGLBLOYSlDdx/PkMJZMPxcl4Ltw/xrTvYLNVTrM1lBQSpCDq3tthqj95hO1WVen+N3eBPkvbwm4FTmgm5kLbGN6wdJoBR2gNWgjqq6BZf7qR5/M+yRcsGrkGF73AIDBk75pNfRn4gdCkErZsHfu79ORA65mESql16nLUjR5RT72FWjdJQ98gL++cAAU2qxdxDsUfMgBsKo4pB/H60Zz4rI7BVeWkyhsMFF0bpemq43G5TjwRKAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7uppCVmNCtTPZFP6Lt3QAsoh7S3GkcHBhRHK2aCfio=;
 b=wnw4iA4fy57se2Htc7/GZ7bUvoMIM28uo0tb86KKcfucFPFVr3/Fr6D4xXnXLTr9GhQXjwJZhGfy+nqhJ0+FKnYkQPNDdrnAsVBnByBvO9e+Kj5XiTmDr4/BO5DQIhbLfANlfCxj6P7BUJ6YcJ3mAzv3ZEz7clI5CBjcPr9ggGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by DS0PR12MB6582.namprd12.prod.outlook.com (2603:10b6:8:d2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Thu, 10 Apr
 2025 16:59:40 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8632.024; Thu, 10 Apr 2025
 16:59:40 +0000
Subject: Re: [PATCH next] drm/amdgpu: Fix double free in
 amdgpu_userq_fence_driver_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
References: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <92b7d28e-6103-4c76-17dd-6ae94552a043@amd.com>
Date: Thu, 10 Apr 2025 22:29:31 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain>
Content-Type: multipart/alternative;
 boundary="------------B8C6BADA4BB29473CC812E86"
Content-Language: en-US
X-ClientProxiedBy: PN2PR01CA0191.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::18) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|DS0PR12MB6582:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef9331f-0a96-4393-dc8b-08dd78511538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SExzRGVlRkNPSlNNYktVOXpScUFpTE1jWjlyWFV4L1R2SW9xZVpXTWpJRHB2?=
 =?utf-8?B?Z2FNNEZ6ZmJYMTkxSDYxS0VrWWZQdjI3bHQwekZ0VmJpU0hWMFFPbVFqYnRV?=
 =?utf-8?B?VTNneS94LzBTMXd3enZnZHI0d09QRkNkVDJQY1pqaUFEOGJGT1RqcTNaRHlN?=
 =?utf-8?B?Y3o1dHY1a3pLOTBhRllaakpHUjFZbmRYanRCRk96eUtZRHVKS1MyVWNDK2gw?=
 =?utf-8?B?K04wZWRHSlhnM20xSGRhMjJ4Y3RRL1V0Q2RwL3BkcGFGVG5pTTVyc0FEdi9a?=
 =?utf-8?B?WXVBTGwraW9UM3ZPYkFXbEhuNVFTMFB1OWtLUm8zNjI1L29pb3NlVmVjZG1S?=
 =?utf-8?B?MFVwRVQzMUZkc3Bna1FaSUdUdFBGemtmSlpmN1pEdzlodktmdlArcnJnTDU2?=
 =?utf-8?B?K3U3MWNHWGRmVnFHdUd1dmxSWFBIaFNPMUpoeVFNMVNyYkt4cTRsY2QvSURY?=
 =?utf-8?B?UU9DVjBISGdtb0NDaTVSNGZ1dTBsVHVrQlEzTnZWUUxhbWUyaUpET2xkYjFk?=
 =?utf-8?B?T1lTN1M2YVB3LzFzMVh3dmNHeS9DNzVpSzdDUy9yTUppUCtXRmRKUGRtMk9Y?=
 =?utf-8?B?SjNhdjBuWFpqUGhBUyt6MGhiUkxMYUEzYUo4Qk1pNStmb0NJZFJydUhiTlo5?=
 =?utf-8?B?dEYzSEliWHhuVk1Na1dFUFAxVmdLdS92Y3B0MmJJa2F5dDBLZG0wR01rSzRH?=
 =?utf-8?B?T2M4YUkwK2t6MkVCVjZRTkxrMTgzRzJjb0c1UDJKYzYyeTFkS1RvVnhkT3hW?=
 =?utf-8?B?YUNTNlpMQ2ZPeWpPWEpyQklvL3VhL2g3Q3FLVVNwNXUvRGJacEs1emxHOFRE?=
 =?utf-8?B?a3BmSXROdW1FWm1XMXdCZ25ibGdCSTZra3QzbTZ6cVA5dHpNclBsaXQ5aW9x?=
 =?utf-8?B?RmxPVnRUNXJwQTdUTStxUXBqVHlFb2RDdFpLN0RGdi9VMU80QWtiRVI2VXJr?=
 =?utf-8?B?MWJ6Y0ExTFBtTjl0cHJqRVp3M1duYmhJMjFKUWxuODBvRlZzRXRoNGF4TGFn?=
 =?utf-8?B?S0pRcTBnaktDSEx0Wk43OWhscWd4VmZSNTBTYmFqcjA3bDFhQTV3dTVDZ2xY?=
 =?utf-8?B?SDU3T2NqLzlXL25nZWt0TnpqZGxIbC8rSXVzVXJlOVVLODQ4QjNxbnRHMFpx?=
 =?utf-8?B?T3ZsMFg5UWVNNFJEMmM0MWVzWk5qbm9sYVpjZ1lUajJsTzZJT0liWUQzNzVT?=
 =?utf-8?B?VDNJb21BTUM2alFLOGFEbElndkIvVVdUQnVXL01lR0VpcGw0a3RYcXNjeGhm?=
 =?utf-8?B?NnBhem92cGxuSFQvZkVPOFFQYTExTVJibXk0bEZGemkvRDM4UU5ReGNDWm1I?=
 =?utf-8?B?UzQxTkplc2QydUc1dTJIUUg1ZS9VekxnQ214V1dqaEorTUUwR1Y5eEFaRUYy?=
 =?utf-8?B?T2lHT3hYcHdJNGtyM1QzSG5XQU1uT2xxMUZxang0dFIvM0lwQk9QTEtkMGNU?=
 =?utf-8?B?TllYbWpBU21LaVkvN2lpN0s1OWt2VGpFTGQ3ajZuN2E1Zm5DZ1ZVL3dNQUp3?=
 =?utf-8?B?TnIzbjZOOUZXNU04YmJRbGpmbVlyL1RYTTFEeFdLRjIrMUJBTndzbHFRSVlK?=
 =?utf-8?B?OHBDVkVsLzV2YVlXcVF0STF0aFRkKzVTdkJwaGlkMFFuc1RqSC9NakZOcFUw?=
 =?utf-8?B?RHZsMURUU0pMM2RhQjVrYVFOOFRGUkxZNlE2NmxEdmFnSjVTN3hkSnhrK0FH?=
 =?utf-8?B?Uy80bDdIV3JQcHJjUDlabi9Vd0sxRTg5bStER1RONUVZbWRZaVFRSUpRbVpU?=
 =?utf-8?B?czduZFVIY0xtUHZVWEJaRXc4R0VGc2w4bnhEVFlPdzMwcWxyZlpIOEtJd0ZB?=
 =?utf-8?B?M3IvRWxVVUw2VFg3MTYzZHN4TjlNekxNbHl2dFUyU3orWVJNdUNraFJ1dEFY?=
 =?utf-8?B?YUlHMEtZeEpvTEpFZWdUbUtIbnBnaStLdE5USUV2VnREVTNaaEd4TlhiRWgx?=
 =?utf-8?Q?FHNp2Kfergg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmg4ejRnZ2NIZk9NR2lQU2ZtR3ZRRk9HRFhScXkxeWNJdUZNYkJETG15OWRK?=
 =?utf-8?B?VXc2M0FsTHlJVE5tWFFIanozdzlKeE1UNTA5WVA5WjZoZGNuTkkvVy9oSzBu?=
 =?utf-8?B?TXN4N1RFRUhhend4Y1UwallCdTBGblJ6cDRJZHFrSGhXbHF0ZVRwcHlvdE1t?=
 =?utf-8?B?WUhOb3d0OVUvTDFwVmZtWlNlS3FzNncyUUJZNzl6MHpjOCtiMCtweG9Bdld2?=
 =?utf-8?B?MGZCaTVCbUxIZmkvR2UwZXRNSTErNFRPNjRDdytsdGRwVSs5a1FCdjdDK05S?=
 =?utf-8?B?VzlhanRCUVNqZHlFTnAzeXBqT09YaUMwNzZQR0lFTVUxRmhWM3J1L3VmbWly?=
 =?utf-8?B?ekc4aDdTTlpyNmtnTmxWV1RINi9qTzFkUDRXUUhwRGMvbXZzQ0ZVZ3krUG1G?=
 =?utf-8?B?UUFBREdoamw2d1FQYTJ3V1FDb3JEbURpdytWbG5YSEFVMGtmVXRxRFhPNmp6?=
 =?utf-8?B?UXF6NGFZUFdBcVp6MUp0U2VPNUVsb1h1bnhXTjFiY1lxV3hkOFloSDF4aU9S?=
 =?utf-8?B?YXhxNmVkdWhDZlhCYXJPUUpuVG1DWldPb3NHdmVpak1WYi91b0x1eFBXZFZO?=
 =?utf-8?B?aUxBL3R6c2xtZUkzdit3NTgrZGpBVmVZM0dPanYzOUdJTis3R2w4aWM3aUpN?=
 =?utf-8?B?MWtOekx0R3NhejlhRGV4LzFORkVYQVlVZERkbHhwbGpQcmR5MEhUSnFNb2lO?=
 =?utf-8?B?cmk2NWlLcXdCeDRKUFdFQURSWVYyVXQxdktQTldZbVF5aGYrdVBSYTNLdzVv?=
 =?utf-8?B?T2gzK05WbTh4L0pHVk5Uc1owNSt1VjNCQTRZS216Yi9EYnIya04rZ1N5aTNP?=
 =?utf-8?B?WVZVSy8xYjlJV0ZTNU13Z1hyeWRQSWFtRC9xU2ZqNEFKbm1KSFE3dkZ4R1Bu?=
 =?utf-8?B?SCtXR1ZsTEw5ZTJWNUF3RlhwRzU0VklMeTBtVTJnQ0l4WFR5S0FpdjVwd2No?=
 =?utf-8?B?THZKeUNwZW4wVDllNm1kN2lmbU1wRXF2MGswOWhJbUdsMXRYSllpdVJWUmlU?=
 =?utf-8?B?R2NpcjkvQzArVXk3Zk95QkthTW91TnZuckk2K1BlekRYRFhldnBoTnFkdTNM?=
 =?utf-8?B?LzZ0Mkxqb1VnNHBsK3BPaWJkaG1DTXlSTDRsdHFMemZKcVNTb3hFK2ExeDhY?=
 =?utf-8?B?Zk1BWmM3aUZvTDVqdU14em5IbFNpRk9BNWZUMTRKSlRQVkZlZFJ2azVWVXdS?=
 =?utf-8?B?ZUk5dkxaMjFLYXJkWWNSejlDdnR5UHlCclU4eXdGNW91U0lzY2p4WUZ1Q0xp?=
 =?utf-8?B?ZWg1T0FsRDh2NXdkQ3ZRYU8wS3I2SmJaK0tzMXFIV0JsUEI4UnJEcFFRT1V3?=
 =?utf-8?B?cG9oaHNzL1FWc0dCa09VWG13WEJlQlZDNHlJSWkrNTN3RmxzU2x4YnpmcWlz?=
 =?utf-8?B?NzlVYVpqeHI4elhja2RaUHk4M3lUaFRHenQ2WUd0L3FlNlk2QzVxd1Y5Wk5l?=
 =?utf-8?B?b01nV1l0bEdEZ040aVlRMEVsWVpRUlFEN3E2WGkzMFdGNjE1VGVzZHhZQ1RQ?=
 =?utf-8?B?bnJ1dHdJVEFpa3RrRlFOM1ZGL1hQcjdRc1FsaVRKMjRvcUwxNGVkbjYrZFM2?=
 =?utf-8?B?K2pGK250TzdQNkliS2RKdmQ3NmFYMTk4eGJEVkNTVFMraTd0ZjNSWEJ1UFph?=
 =?utf-8?B?R3gxR0NEQjVjQThVVDRyayt3UE9rNU82czZlQTlrMnhwcDFabkQ1OG13TlRW?=
 =?utf-8?B?Tm1WSCs0S3BML1Z0c2t2bTNuL29ZRzhycnB5VTJjaDdOak1yU3RhcWdBU01a?=
 =?utf-8?B?anNzQ3gxS21rdVVZN3AyWmZOemdnQzlBZmJpN2FuQk9UWURZV3poUWRjdkwv?=
 =?utf-8?B?aU1peE5EWXZVaWIybnlzQTdLU0xVSlRyM1pSU0dJWTlhOHhFcUdVU3p5VWJv?=
 =?utf-8?B?TG0rYk1ZYTNHdnJxRWpKRS8rNEUyTmpVWEJRWEMzQk80d2xpM1FLa0IyNndo?=
 =?utf-8?B?bTMzYnk3UzZpNm1Rd3ZXeWNOcW8yRnVwSStuYjRxNWtRa1BSeXdRSjVsMERY?=
 =?utf-8?B?R3I0RU9lSi9xMll4d0xSZTBLSGRFaW1vZ0ZRa0c4UWkybWFBZHBadXRxNU5j?=
 =?utf-8?B?T0sycm8vMU1sZkVackxEam1tcS96U2dNb1NmYVByYWhqR3NPK2J0K09tRlpR?=
 =?utf-8?Q?V71BkLPaz6SYzSmBcWeYZu9Ks?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef9331f-0a96-4393-dc8b-08dd78511538
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 16:59:40.4310 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e9hBYYMpSDjuuLZDAK64apBBd5ZmB4KnMUOoNff6NnAAhUlFAGfn/VRdsC3ZQuEJocj4OWLdiA0tPDBRktSTeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6582
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

--------------B8C6BADA4BB29473CC812E86
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Please change this also instead of 'goto free_fence_drv' just return err.

         fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
         if (!fence_drv) {
                 DRM_ERROR("Failed to allocate memory for fence driver\n");
                 r = -ENOMEM;
                 goto free_fence_drv; // this should be replace by return.
         }

~arvind

On 4/10/2025 9:54 PM, Dan Carpenter wrote:
> The goto frees "fence_drv" so this is a double free bug.  There is no
> need to call amdgpu_seq64_free(adev, fence_drv->va) since the seq64
> allocation failed so change the goto to goto free_fence_drv.  Also
> propagate the error code from amdgpu_seq64_alloc() instead of hard coding
> it to -ENOMEM.
>
> Fixes: e7cf21fbb277 ("drm/amdgpu: Few optimization and fixes for userq fence driver")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index a4953d668972..b012fece91e8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
>   	/* Acquire seq64 memory */
>   	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
>   			       &fence_drv->cpu_addr);
> -	if (r) {
> -		kfree(fence_drv);
> -		r = -ENOMEM;
> -		goto free_seq64;
> -	}
> +	if (r)
> +		goto free_fence_drv;
>   
>   	memset(fence_drv->cpu_addr, 0, sizeof(u64));
>   

--------------B8C6BADA4BB29473CC812E86
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
        New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
        EN-US;mso-bidi-language:AR-SA">Please change this also instead
        of </span><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
        New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
        EN-US;mso-bidi-language:AR-SA"><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
          New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
          EN-US;mso-bidi-language:AR-SA">'goto free_fence_drv'</span>&nbsp;
        just return err.<br>
      </span></p>
    <p><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
        New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
        EN-US;mso-bidi-language:AR-SA">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fence_drv =
        kzalloc(sizeof(*fence_drv), GFP_KERNEL);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!fence_drv) {<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to allocate memory for fence
        driver\n&quot;);<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r = -ENOMEM;<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto free_fence_drv; // this should be replace
        by return.<br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
        <br>
      </span></p>
    <p><span style="font-size:12.0pt;font-family:&quot;Aptos&quot;,sans-serif;
mso-ascii-theme-font:minor-latin;mso-fareast-font-family:Aptos;mso-fareast-theme-font:
minor-latin;mso-hansi-theme-font:minor-latin;mso-bidi-font-family:&quot;Times
        New Roman&quot;;
mso-bidi-theme-font:minor-bidi;mso-ansi-language:EN-US;mso-fareast-language:
        EN-US;mso-bidi-language:AR-SA">~arvind<br>
      </span><span style="color: rgb(33, 33, 33); font-family: &quot;Roboto Mono&quot;, &quot;SF Mono&quot;, &quot;Lucida Console&quot;, Monaco, monospace; font-size: 13.006px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"></span><!--[if gte mso 9]><xml>
 <o:OfficeDocumentSettings>
  <o:AllowPNG/>
 </o:OfficeDocumentSettings>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:WordDocument>
  <w:View>Normal</w:View>
  <w:Zoom>0</w:Zoom>
  <w:TrackMoves/>
  <w:TrackFormatting/>
  <w:PunctuationKerning/>
  <w:ValidateAgainstSchemas/>
  <w:SaveIfXMLInvalid>false</w:SaveIfXMLInvalid>
  <w:IgnoreMixedContent>false</w:IgnoreMixedContent>
  <w:AlwaysShowPlaceholderText>false</w:AlwaysShowPlaceholderText>
  <w:DoNotPromoteQF/>
  <w:LidThemeOther>EN-US</w:LidThemeOther>
  <w:LidThemeAsian>X-NONE</w:LidThemeAsian>
  <w:LidThemeComplexScript>X-NONE</w:LidThemeComplexScript>
  <w:Compatibility>
   <w:BreakWrappedTables/>
   <w:SnapToGridInCell/>
   <w:WrapTextWithPunct/>
   <w:UseAsianBreakRules/>
   <w:DontGrowAutofit/>
   <w:SplitPgBreakAndParaMark/>
   <w:EnableOpenTypeKerning/>
   <w:DontFlipMirrorIndents/>
   <w:OverrideTableStyleHps/>
  </w:Compatibility>
  <w:DoNotOptimizeForBrowser/>
  <m:mathPr>
   <m:mathFont m:val="Cambria Math"/>
   <m:brkBin m:val="before"/>
   <m:brkBinSub m:val="&#45;-"/>
   <m:smallFrac m:val="off"/>
   <m:dispDef/>
   <m:lMargin m:val="0"/>
   <m:rMargin m:val="0"/>
   <m:defJc m:val="centerGroup"/>
   <m:wrapIndent m:val="1440"/>
   <m:intLim m:val="subSup"/>
   <m:naryLim m:val="undOvr"/>
  </m:mathPr></w:WordDocument>
</xml><![endif]--><!--[if gte mso 9]><xml>
 <w:LatentStyles DefLockedState="false" DefUnhideWhenUsed="false"
  DefSemiHidden="false" DefQFormat="false" DefPriority="99"
  LatentStyleCount="376">
  <w:LsdException Locked="false" Priority="0" QFormat="true" Name="Normal"/>
  <w:LsdException Locked="false" Priority="9" QFormat="true" Name="heading 1"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 2"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 3"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 4"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 5"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 6"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 7"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 8"/>
  <w:LsdException Locked="false" Priority="9" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="heading 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index 9"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 1"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 2"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 3"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 4"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 5"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 6"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 7"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 8"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" Name="toc 9"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="header"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footer"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="index heading"/>
  <w:LsdException Locked="false" Priority="35" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="caption"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of figures"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="envelope return"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="footnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="line number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="page number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote reference"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="endnote text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="table of authorities"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="macro"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="toa heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Bullet 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Number 5"/>
  <w:LsdException Locked="false" Priority="10" QFormat="true" Name="Title"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Closing"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Signature"/>
  <w:LsdException Locked="false" Priority="1" SemiHidden="true"
   UnhideWhenUsed="true" Name="Default Paragraph Font"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="List Continue 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Message Header"/>
  <w:LsdException Locked="false" Priority="11" QFormat="true" Name="Subtitle"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Salutation"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Date"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text First Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Note Heading"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Body Text Indent 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Block Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="FollowedHyperlink"/>
  <w:LsdException Locked="false" Priority="22" QFormat="true" Name="Strong"/>
  <w:LsdException Locked="false" Priority="20" QFormat="true" Name="Emphasis"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Document Map"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Plain Text"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="E-mail Signature"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Top of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Bottom of Form"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal (Web)"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Acronym"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Address"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Cite"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Code"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Definition"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Keyboard"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Preformatted"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Sample"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Typewriter"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="HTML Variable"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Normal Table"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="annotation subject"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="No List"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Outline List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Simple 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Classic 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Colorful 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Columns 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Grid 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 4"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 5"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 7"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table List 8"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table 3D effects 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Contemporary"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Elegant"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Professional"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Subtle 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 1"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 2"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Web 3"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Balloon Text"/>
  <w:LsdException Locked="false" Priority="39" Name="Table Grid"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Table Theme"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Placeholder Text"/>
  <w:LsdException Locked="false" Priority="1" QFormat="true" Name="No Spacing"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 1"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 1"/>
  <w:LsdException Locked="false" SemiHidden="true" Name="Revision"/>
  <w:LsdException Locked="false" Priority="34" QFormat="true"
   Name="List Paragraph"/>
  <w:LsdException Locked="false" Priority="29" QFormat="true" Name="Quote"/>
  <w:LsdException Locked="false" Priority="30" QFormat="true"
   Name="Intense Quote"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 1"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 1"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 1"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 1"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 1"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 2"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 2"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 2"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 2"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 2"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 2"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 3"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 3"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 3"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 3"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 3"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 3"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 4"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 4"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 4"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 4"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 4"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 4"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 5"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 5"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 5"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 5"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 5"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 5"/>
  <w:LsdException Locked="false" Priority="60" Name="Light Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="61" Name="Light List Accent 6"/>
  <w:LsdException Locked="false" Priority="62" Name="Light Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="63" Name="Medium Shading 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="64" Name="Medium Shading 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="65" Name="Medium List 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="66" Name="Medium List 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="67" Name="Medium Grid 1 Accent 6"/>
  <w:LsdException Locked="false" Priority="68" Name="Medium Grid 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="69" Name="Medium Grid 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="70" Name="Dark List Accent 6"/>
  <w:LsdException Locked="false" Priority="71" Name="Colorful Shading Accent 6"/>
  <w:LsdException Locked="false" Priority="72" Name="Colorful List Accent 6"/>
  <w:LsdException Locked="false" Priority="73" Name="Colorful Grid Accent 6"/>
  <w:LsdException Locked="false" Priority="19" QFormat="true"
   Name="Subtle Emphasis"/>
  <w:LsdException Locked="false" Priority="21" QFormat="true"
   Name="Intense Emphasis"/>
  <w:LsdException Locked="false" Priority="31" QFormat="true"
   Name="Subtle Reference"/>
  <w:LsdException Locked="false" Priority="32" QFormat="true"
   Name="Intense Reference"/>
  <w:LsdException Locked="false" Priority="33" QFormat="true" Name="Book Title"/>
  <w:LsdException Locked="false" Priority="37" SemiHidden="true"
   UnhideWhenUsed="true" Name="Bibliography"/>
  <w:LsdException Locked="false" Priority="39" SemiHidden="true"
   UnhideWhenUsed="true" QFormat="true" Name="TOC Heading"/>
  <w:LsdException Locked="false" Priority="41" Name="Plain Table 1"/>
  <w:LsdException Locked="false" Priority="42" Name="Plain Table 2"/>
  <w:LsdException Locked="false" Priority="43" Name="Plain Table 3"/>
  <w:LsdException Locked="false" Priority="44" Name="Plain Table 4"/>
  <w:LsdException Locked="false" Priority="45" Name="Plain Table 5"/>
  <w:LsdException Locked="false" Priority="40" Name="Grid Table Light"/>
  <w:LsdException Locked="false" Priority="46" Name="Grid Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="Grid Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="Grid Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="Grid Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="Grid Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="Grid Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="Grid Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="Grid Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="Grid Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="Grid Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="46" Name="List Table 1 Light"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark"/>
  <w:LsdException Locked="false" Priority="51" Name="List Table 6 Colorful"/>
  <w:LsdException Locked="false" Priority="52" Name="List Table 7 Colorful"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 1"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 1"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 1"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 1"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 1"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 1"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 2"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 2"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 2"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 2"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 2"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 2"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 3"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 3"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 3"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 3"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 3"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 3"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 4"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 4"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 4"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 4"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 4"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 4"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 5"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 5"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 5"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 5"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 5"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 5"/>
  <w:LsdException Locked="false" Priority="46"
   Name="List Table 1 Light Accent 6"/>
  <w:LsdException Locked="false" Priority="47" Name="List Table 2 Accent 6"/>
  <w:LsdException Locked="false" Priority="48" Name="List Table 3 Accent 6"/>
  <w:LsdException Locked="false" Priority="49" Name="List Table 4 Accent 6"/>
  <w:LsdException Locked="false" Priority="50" Name="List Table 5 Dark Accent 6"/>
  <w:LsdException Locked="false" Priority="51"
   Name="List Table 6 Colorful Accent 6"/>
  <w:LsdException Locked="false" Priority="52"
   Name="List Table 7 Colorful Accent 6"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Hyperlink"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Hashtag"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Unresolved Mention"/>
  <w:LsdException Locked="false" SemiHidden="true" UnhideWhenUsed="true"
   Name="Smart Link"/>
 </w:LatentStyles>
</xml><![endif]--><!--[if gte mso 10]>
<style>
 /* Style Definitions */
 table.MsoNormalTable
	{mso-style-name:"Table Normal";
	mso-tstyle-rowband-size:0;
	mso-tstyle-colband-size:0;
	mso-style-noshow:yes;
	mso-style-priority:99;
	mso-style-parent:"";
	mso-padding-alt:0in 5.4pt 0in 5.4pt;
	mso-para-margin:0in;
	mso-pagination:widow-orphan;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ascii-font-family:Aptos;
	mso-ascii-theme-font:minor-latin;
	mso-hansi-font-family:Aptos;
	mso-hansi-theme-font:minor-latin;
	mso-font-kerning:1.0pt;
	mso-ligatures:standardcontextual;}
</style>
<![endif]--></p>
    <div class="moz-cite-prefix">On 4/10/2025 9:54 PM, Dan Carpenter
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:5ff4d367-b5bd-40ae-9529-56d08ea6c1d0@stanley.mountain">
      <pre class="moz-quote-pre" wrap="">The goto frees &quot;fence_drv&quot; so this is a double free bug.  There is no
need to call amdgpu_seq64_free(adev, fence_drv-&gt;va) since the seq64
allocation failed so change the goto to goto free_fence_drv.  Also
propagate the error code from amdgpu_seq64_alloc() instead of hard coding
it to -ENOMEM.

Fixes: e7cf21fbb277 (&quot;drm/amdgpu: Few optimization and fixes for userq fence driver&quot;)
Signed-off-by: Dan Carpenter <a class="moz-txt-link-rfc2396E" href="mailto:dan.carpenter@linaro.org">&lt;dan.carpenter@linaro.org&gt;</a>
---
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
index a4953d668972..b012fece91e8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
@@ -84,11 +84,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
 	/* Acquire seq64 memory */
 	r = amdgpu_seq64_alloc(adev, &amp;fence_drv-&gt;va, &amp;fence_drv-&gt;gpu_addr,
 			       &amp;fence_drv-&gt;cpu_addr);
-	if (r) {
-		kfree(fence_drv);
-		r = -ENOMEM;
-		goto free_seq64;
-	}
+	if (r)
+		goto free_fence_drv;
 
 	memset(fence_drv-&gt;cpu_addr, 0, sizeof(u64));
 
</pre>
    </blockquote>
  </body>
</html>

--------------B8C6BADA4BB29473CC812E86--
