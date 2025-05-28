Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DB2AC629D
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 09:08:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EDA10E1A9;
	Wed, 28 May 2025 07:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZauBH8Y0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8821B10E1A9;
 Wed, 28 May 2025 07:07:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmYf5ULgVWViaQEKEEfoUdszO0pQAb/It4/VTbpuuyF6vpwr6y6hSt9pL2Of6lyprygpJm91/3xHVeDC4Ahlw0nKKMOfA2wcxBzWeirW9Q0zd4y7qQvrtc7F5+q5CU907nG9uecdaNcVjcwDIsTdYJveOXKd9zLwam7Kio93l9utkC9AV3ziHYVGWBFXDaPwq9Nj4tO59DFlAUxFA1EWRlAK6/RfEcxgRD41twiX0fnnznXwzuh39n9O4p8i0WaisOTvevLzNnu/XPg8fOITydZCr3CsahmYQiZVCJBgNHm40KNQDa4JhA4V375TsRvM9I1bZ0Fcsy7W2cfkPLjpyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IywwyrGM88tdKR2H1Rd5/UiQuGjnn1sCiBzb5szp2AU=;
 b=Fvgo9qdUxFqXd5XV+ueQS0e8tyGxFwTvhJgPwM797/iSIiq8HOekiDzCm9HnZKMaUbFEGN1UUVoQwJTUdu2fnGw7jGld6dAgAr0iHQz9UCVjMdeSVoxP5GJq5EEgy8/9O+ROylFt/PV5duTtQMS1ZoGo8bVmtTLJfnmCG0Vx4BoVHrRM9AORHHiEBTYnPByZe2P5b54AXTtJy/8VUcboLo3pxv6QGrGOeVcMlMFMEwGsLWjA1CfIBl/8wF+1XP4j2PmKSfgdin4qyzRbR9LmEo3vm/KvSK1M1Yp25MC5c3q9TFs9ZYHL7jh6x0M0ONCfF+IND6fPFIzkweLwJblNuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IywwyrGM88tdKR2H1Rd5/UiQuGjnn1sCiBzb5szp2AU=;
 b=ZauBH8Y0Onw7DujEoZAidW7DUQS0DN6r1R1CXKBHBkIXw9GhusyoHtxBMXuHEOZTwQkNPzVhOlIz7l8/gnvS0FKuTgDCs6CXEgLyoX5h7wF9kGPlYcxXwYLQePhORbXRZrNUFpTwczSrT/mfFn0JsR3wb5/tcsY2HK9K80peK94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4268.namprd12.prod.outlook.com (2603:10b6:5:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Wed, 28 May
 2025 07:07:54 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 07:07:54 +0000
Message-ID: <89652580-5763-4f1e-abf5-d340119543f3@amd.com>
Date: Wed, 28 May 2025 09:07:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/amdgpu: Dirty cleared blocks on allocation
To: Natalie Vock <natalie.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 stable@vger.kernel.org
References: <20250527194353.8023-1-natalie.vock@gmx.de>
 <20250527194353.8023-3-natalie.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250527194353.8023-3-natalie.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0009.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d10440e-ec09-44d5-8f61-08dd9db65dea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjI4cEhzSGwzYnpRa1dla1RzSzBwK0cvQmxCbnZjdFdQYWczOWdZbk9lUVFm?=
 =?utf-8?B?ek96dXYrTEJZS2pscVF1KzQzMUVFbVdWYUdrc3V0Y2dXb2U0RElxNUFQMlZO?=
 =?utf-8?B?SWZKLzN4QXpOVEFBcUNjQm1NTGp2ZHZMREpUVHhFMjBZYWdkU0JJZmdtZ2ox?=
 =?utf-8?B?Mm9saDVaRzh2TnRmanJCNGV2ZzRtdTVWbDNGRmJCTnBKUnRDYjVrMFhCNTBY?=
 =?utf-8?B?Sys3MWhkMnVSWHUxc05LMnhpME5RQXM5UmQ2VVNzckZZcS9Md0VvZGl5OFIx?=
 =?utf-8?B?S2xxWHcxRjBNcDZ2SzBuWGtueWFuNW4vVVE5a3ZhNkZmMFFVVysyNndOcUNY?=
 =?utf-8?B?T0lnMDg5VzFLMnlVd0hJUFE4L0xsNXRQdUJabmtBbTZMRFVrZk9EVDlZT3RC?=
 =?utf-8?B?Mk5ZQy9GZ2RqMVpmbENOajZuZTQxSnBmSStuKytOZ2VtS3lUOTdFTWorOHBB?=
 =?utf-8?B?ZGxWS3ZwSCtiSEg4VHlVeWtrU1E2OU9SOGVJZlBBUDFMZ0d1bXZsbHlrdGlr?=
 =?utf-8?B?Z1UxR1ZDbk1kS3QxWE55TWNBancreW9CanJwWk10ZTNvUWpmQUcra2VZaldE?=
 =?utf-8?B?TTZzcWMzMDN6clpGcFpicUtmdk03TGNoK1BTaktBZXphcFpJZnpmUnVUQmFE?=
 =?utf-8?B?RmdoSEVBZGtPVEh0emxlb2x1YlNCc2RZWHBrenhYRENWYnlLMUxuR1orTkxG?=
 =?utf-8?B?SWh4bGhnNExFRStJSkt1ckhxK1A4ME9aMm9ML3B0Rk9RM0hjRzNJd1daS08y?=
 =?utf-8?B?aTJ1TlhDREFsM1d6WEF2dTU2R1RrNzU1SGtwbzNaaXRPNnNpejBsM2FLY1Ny?=
 =?utf-8?B?OWVJUTRpZFZseVJzaDZ3UEtrNXNFN29EMEUvc0x4WkY5ZE1zaElHUVRaSEdR?=
 =?utf-8?B?c2ZselpwZTRKRUtjeHdXcjdrR0NwVjBzb0Z3UWsxdkZLc1QwTmUxcWVxb05X?=
 =?utf-8?B?c3FiUTU4VS9FZEQzdmNQdktaTWdjU2JtQVI5aGZVbzh3aTdVYW40ckgzUzBL?=
 =?utf-8?B?S1dzbVRTTzNTRW1UMTIyMzVWVDkrcmtNTGoyVkwrdTNDV1RzQ3R1b2x4aXFV?=
 =?utf-8?B?QngvZjdXSHlCYThDUURIUjBLcFI2MEJHa2Q1T2Y2emhzT1ltZCtqVnBIdzRr?=
 =?utf-8?B?RHEzRCtjS2VKM3BZMW10cWVmR2xlS1R3MGJaOXZuN3JPTjU3SlZlbzFXcCsw?=
 =?utf-8?B?TkxpSlhRczdoTnF2M0xLSHd3aUVreVVWS2E5K2I0eUJtMThiNzdpZ2RSNHJP?=
 =?utf-8?B?NzkvcGY4T0Z2MXdpN0ZMLyt2bGxnZWZ5eUl2aHhIZmE3WkhoQlprcHFVc2ox?=
 =?utf-8?B?bG5FcVlKcmlENnNqaTJhRHYrbk9KRVh1VVZmWWthbDhNTHdHdHRXVUpESTlx?=
 =?utf-8?B?b3VyK2pqQnQvc3BDU3FENVRHVDFoVzI4ZnVxZnpzYmRRazIwYVVNVHdFdnJQ?=
 =?utf-8?B?eEVBUDRlcmE3b0gvdkMxdkVVYUpmRHp6MFE2bmxYZEVnZThOSDBDV3BPL3l6?=
 =?utf-8?B?OUlQN2tuVWFBdkNoVnVkbUlVVFl1VUs5TjRFZEJjUStKQWhoc2tzYlJCUmVQ?=
 =?utf-8?B?SlJFbW5ibzRnVlcvNXM1TzhqeGhtSjdVZkhNUU40cjd6QW9GK0twWnAwVWN2?=
 =?utf-8?B?cXFYNEpNSEg0K2liS2R4TS8rVzhpSDlCbGNEYnpnTVlWcHAvT3V1NndMZ0FB?=
 =?utf-8?B?MDQxaDdWM1hvZFFpZXBqUTVBM2llbyttVEd4d2psZ2QyNnovdFVrWG16QVNu?=
 =?utf-8?B?N3NEZGZzVzBxZllhU3NiT1RMdTNwUnc4QTgzb2RKOVpKeUF6RWx4L3IwN0ly?=
 =?utf-8?Q?rJo2jaXGhObCATns9mPQ8JPvwcOJV2Zvll1QQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlRCV0NOVkVuUDJzVm92Y2hsRU5zNC9Cb3JOeEZYN2daWXBXTU1ibDVmWTlC?=
 =?utf-8?B?cTVxV3JiTHhxV0Jla29ZNmZIcVRoSWVDMEtPNkhTcjR6Z0F6ZDhWajdjWTB0?=
 =?utf-8?B?dEZiRWJpU1MrKzNKYjB2NEpwb2lDclBnTGRRZ1kxbkh4elFmOGhEWjlNcm5S?=
 =?utf-8?B?T2xMZ2daK0UvNUxHbk40b1Q0WGVpeHpKeWFadHJLYjhWNEhXVGZ4ZTNOOVFD?=
 =?utf-8?B?SXNkUmJZM3VyNmx3U29RMWNZQnQrbU1QdUd1KzhxZlptNzg1aXNWRTRGSFJp?=
 =?utf-8?B?MlAzM3lWb1ltbkZCcXM3a0pFL2JwU3ZvUHZhV2tWenJQWEtoNk9tK2VwUDlF?=
 =?utf-8?B?MUdGc3FUbUp0djRiUHUwSVdUbk1DSEFPMWRWNjZGZUJ2RDRWUlkxTmE0OWxE?=
 =?utf-8?B?UUFVcm9mU0FLZzhCa1RMdlJNTkFXZ1BpNlBTd25XTmlzK05wMXNacVdhUVFO?=
 =?utf-8?B?dklTSGQ5ZVRFVEFVNVdrQWpDQVZrNkZVU2piNmpCblVxa0ErT0hJT3hzTm0z?=
 =?utf-8?B?WFBiOTBpeHRrVUxrN2s2MU52ZWRVaThVa1FBck4xK01tK0FCTlI0cy92OTho?=
 =?utf-8?B?TjhhRmlDdVg1Y2JHQ2hFUDdCUTBnOC9VL0pvcVphdnZaM3pwMFpFekRZbHhq?=
 =?utf-8?B?bnR5U3Y3YWFxS3NKcWEyRStiNVJ0VHA1cWg1a1pnVGJDMkhKNDBNTjNObGhz?=
 =?utf-8?B?OWhCQ0ZZYTVjbjlBNVp4a2k2c3BoTFUrdzhtbGxGUG1LbzFQek5qaFJrNmI2?=
 =?utf-8?B?TUFGellSRE5FNVpCTkEva2dGQTQwcXY4N0tXSElXL1packtZRTlaTnR3Mk5s?=
 =?utf-8?B?NEowRXFJbXNIOFdOK3I2MDhHNjd6U1JSbkVnRmZibTZqeDE4VE03RFVWeXoy?=
 =?utf-8?B?MnRnSHphclM2Smw3MzBEWkpWTnVqRTFJenFNSUF5a2NQNEx5aEI1VVUyUzdU?=
 =?utf-8?B?ODlTTi9sanhLTjlFTHkwU3AwYnEzMGd4SlZCV1ZaMFE5cjFWaHJOd1d1aysx?=
 =?utf-8?B?S0JxcjZ6d2tQSGd5Rys1YnpNc1ZXRE53Q0dBSWZoRHltZ05nbVQvaHdHd3JP?=
 =?utf-8?B?Wkc4T0NQRSthdkhZTE55Z2ZSaFNob2gvZGFMWi9mMzJ3ZGxiV21vbUZDYzVR?=
 =?utf-8?B?Y0RhM3JuOXVwcWpQTjMyNnErZ2JJK1RPNTVZZW10bWVjUHdGVjhhUG8vOWtj?=
 =?utf-8?B?N3VaN3JDTVBYWWJFVmZtemZiQVowQUViNS9uK1BqaHY2NkF0T2xKNm9NZi90?=
 =?utf-8?B?QU43bjVZeVRyNTk5WXVYWDJsSW93TnQxU0xNbktzV2gxd2NHTGMzRUhtTnoz?=
 =?utf-8?B?YnNFYm9NTVpWd25TbzEweDlaeVpFckNLTmU3S0dVL1lsRE03R1J3ZWFkT3pX?=
 =?utf-8?B?TzUvSW1zb2hEN3JpeG1MeWJrbjRVczJzNHhiTnNYTFh6ZzkrTFFIOXdzdjZQ?=
 =?utf-8?B?ZURUR0RjdUwwTzk3c3JXM1hGZmNqNjJwN0pYL1JBc2VHWWtjamJ1ZjRrUXV2?=
 =?utf-8?B?M0FTQk5RZkZpQTBsZCtDeWpPUDM3QjVubnRJNU52em1iaG0wa0RwQUQyN2d2?=
 =?utf-8?B?Z3NJTmNHd21mMCs4aWZra01FQnRWWXNLUFIvWEpnTVp0QnZZR0FZR2NHaUY3?=
 =?utf-8?B?RWdGRXpHSmJYSlpZcHFteWY0RHBWNHd4N2dITjB0eGNFbUMydHlNN1hoQlph?=
 =?utf-8?B?Nm42VFFiOFJtbjhuT3VrYVk4ZFYvdDVUejNEelpFbzhHNmlRYjBTK2dveUlK?=
 =?utf-8?B?N2ZMYUQ5eWk1a0FKcEgyRmNDUS9ud2JRaXhRMXJHWHVPbHFYWUFUcWc3VUZs?=
 =?utf-8?B?c1pkS25Hc1lRTkN3L3RlZFAxODh5bWtJWGlkZjE0NVcxZ1RWSXVRRURucE9h?=
 =?utf-8?B?Y3F5UkZhS2RjOElVb1VBM0RnQjNZMHAxdWtZd1FLbmFoZlZHYWxBN2FXNUs1?=
 =?utf-8?B?VU5VVW9PZE1JNWl0YWRQbDlEa2RoQ3h1QklKTmlTWEJYOVNNc3lJL28wYW9z?=
 =?utf-8?B?OHIzeStCNkpXUnJmTGprL09qekdDNTRpZzdmSkNSemRLaXArL01Oa3JKWGZX?=
 =?utf-8?B?dzdnWFFvQ2JDWTYvU1JZNmowMUpycUxQOEt2UUUrbzE2S1BIbUdpaEtCMnI0?=
 =?utf-8?Q?JEdU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d10440e-ec09-44d5-8f61-08dd9db65dea
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 07:07:54.3420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KCh0em467lH4p0ovCpbx7YPVbTD6BR9DNF07Ah4/oGfMmchXS4tdUdPuNcUqGLqc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4268
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

On 5/27/25 21:43, Natalie Vock wrote:
> If we hand out cleared blocks to users, they are expected to write
> at least some non-zero values somewhere. If we keep the CLEAR bit set on
> the block, amdgpu_fill_buffer will assume there is nothing to do and
> incorrectly skip clearing the block. Ultimately, the (still dirty) block
> will be reused as if it were cleared, without any wiping of the memory
> contents.
> 
> Most severely, this means that any buffer allocated with
> AMDGPU_GEM_CREATE_VRAM_CLEARED | AMDGPU_GEM_CREATE_WIPE_ON_RELEASE
> (which is the case for **all userspace buffers**) are neither
> guaranteed to contain cleared VRAM, nor are they being wiped on
> release, potentially leaking application memory to arbitrary other
> applications.
> 
> Fixes: a68c7eaa7a8ff ("drm/amdgpu: Enable clear page functionality")
> Cc: stable@vger.kernel.org
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/3812
> 
> Signed-off-by: Natalie Vock <natalie.vock@gmx.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 2d7f82e98df9..cecc67d0f0b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -591,6 +591,13 @@ static int amdgpu_vram_mgr_new(struct ttm_resource_manager *man,
>  	list_for_each_entry(block, &vres->blocks, link) {
>  		unsigned long start;
>  
> +		/*
> +		 * Allocated blocks may be dirtied as soon as we return.
> +		 * Mark all blocks as dirty here, otherwise we might
> +		 * incorrectly assume the memory is still zeroed.
> +		 */
> +		drm_buddy_block_set_dirty(block);

Exactly that makes no sense.

We need the information if it's dirty or not later while clearing the blocks. Otherwise we will clear all blocks and completely loose the advantage of the clear tracking.

So we should set them dirty as soon as we are done with the clearing.

But the problem rather seems to be that we sometimes don't clear the buffers on release for some reason, but still set it as cleared.

Regards,
Christian.


> +
>  		start = amdgpu_vram_mgr_block_start(block) +
>  			amdgpu_vram_mgr_block_size(block);
>  		start >>= PAGE_SHIFT;

