Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03417986605
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 19:55:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B6E810E844;
	Wed, 25 Sep 2024 17:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2xeDRUZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E95410E842;
 Wed, 25 Sep 2024 17:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YLZ+EFZjqDjMfeXmuFv8qAPnK/Ckf5erVJdQ70EoV4BBpEG5zlCsBCC4SfV7Pe0qZ3YEiEnX2RLPLXEHpFgdgXUBMWzbIvLTQXK79W/gi4k/DXV3Df3iFdI+IZIyb6fxnv/V/g4JHde5VNQd6tO5R//FT7vNBfd5kHaBpymD8Z+Cpu/pacmK2wsWKPOWRGLi/Pt+mNWHzbexF250c/9hBG9sPEXfh/zj+jZfQvJG5jESiaWMPSCgCw9d8Bar0QqdJCmTy4E5kV2YyZb3g71EehcIF7llyE/gAdu7/WHYzGvHgBvxXEuFmJhhyF2eY4jFuLgQJpPnFUApWP4qLWwBFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r1W5h5w0dQVSopYmI4jo8Fwvrt+UVg8wpAXGALOQuKs=;
 b=BXXal41c2izjNt99bYHpQTNX71VffzERgwnSp3J73mbf3jhOoq2NV8eirLLkHLZydvLQNT4oKTw/dFXN2dhTwsarRmS02iaOSOOaSLDEQmMHCdVxCfHxFCdbS6eJTAuPJqgDnLOqCAQN0t85egTlu5c1l6JPTio5YuyIQx+nvJpx56Mvk5F22cH801ccEbPpPYNGrQTEE9egpumRPAb1x072fpYfqNcgPfy3ZhWn9gc/dYtPvep3EdoKltrZlJEmHOfr+EUX78slzUyQEtVBIhmK2CvacmOuNVzfZN9AWI3fCSOykLG9rCSOf4cAEut4JvNMvfS6nWe1CJUoaOj1iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r1W5h5w0dQVSopYmI4jo8Fwvrt+UVg8wpAXGALOQuKs=;
 b=2xeDRUZy/WqUDdfwd5JhAHjGJboXS2povJJL7B5shwvZwELLrj7E0TjnI5L7s3ApSIIciGCSZQ3oq4PpWOJt6KNfLyD+b07iuN9nwlv+B34y9Fle50VFYNRJXVLgygmil1BoEulJ92qzd1apsVbKjkaIRpqhBtkG47sBY6wEVPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 17:55:36 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 17:55:36 +0000
Message-ID: <4bc60bb2-3c67-4418-ad79-316ea1ac0dc1@amd.com>
Date: Wed, 25 Sep 2024 12:55:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/10] drm/amd/display: remove dc_edid handler from
 dm_helpers_parse_edid_caps
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-10-mario.limonciello@amd.com>
 <5bbaeac3-7916-4e75-9c92-b93e2cd78ff5@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <5bbaeac3-7916-4e75-9c92-b93e2cd78ff5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0024.namprd02.prod.outlook.com
 (2603:10b6:207:3c::37) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: d67085d5-360c-4653-6bfa-08dcdd8b4285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1o5VVlpS3RwaVF3bVhkREtpRitrR0Y1WmZVU3RqejkzaDJUbW14VWhjNkps?=
 =?utf-8?B?YlhzQkhRczE5M0tHajBTRDhBMTkxY3ROd0NnTzBGeDNaZVVtdVFraWg2YVMx?=
 =?utf-8?B?ZXJwMUppZHAwV0pQV09OMUhqNXhDa1NXcUpmSXZkTnNCKzdCUkFFVlF2RDRM?=
 =?utf-8?B?UW5malRqcE14M01lckx2NFMrVGFSMFNVam1GcGt6NS8xbEZ0OE1uMm02blRw?=
 =?utf-8?B?QVdsS0VSVEZlWHBtVmRRS05YR0xjV1JFSUtBQ09PTXd5ZmZ2aFRlVHNBOWFh?=
 =?utf-8?B?NGg2RTJlMnBHMXVNVkxVcWxLbXlSWElUNFJmMFJrWjFwenZFUlhhakpDT2ww?=
 =?utf-8?B?RVpwSURjTjdQRTVuNFZuQ3lWSk4zVDFQTUtreWZXTEJNZnVrRFhUOWI4RGd1?=
 =?utf-8?B?ZDAzTmhBUlAwalRJVWlSRWpsRTA3TlRVbXdBQjdwM0Y5bjQzNzY5N0JweTRx?=
 =?utf-8?B?VStuS1dobkpWTWdhZXVLaGxkbUd2TnJnQS9oZFNpSjMvL1lvelBIWUNvcFNu?=
 =?utf-8?B?Nzh6ZDRoRDNaR2h2My9yUDhpV0ZrbFNBRWtCcGdJRE9jb2g0QmVDYXBHL0Vz?=
 =?utf-8?B?T0FJbVNibjBPSEdFVUdtRmQyWW43ZGl0WURNbGlhNlpENE5lKzNKL0NIVnRJ?=
 =?utf-8?B?QWkyM1RJMjNuNlErS1VPelo4VkduUlpsWFd5Z0tWQzY1TnNGMzVVRHNwSm85?=
 =?utf-8?B?YzNOWHVBcEo4ek9ybUpJNVhhQk9JMFIyc1NWdUZWcHFpWW9PWi9MMXRscXAr?=
 =?utf-8?B?MmpEa0JFcFhxVE1TcmdTRk92SUFnRFNBcTZaWkZLaGluVmF0ZmlpZkxJU2d4?=
 =?utf-8?B?MkdDU3NWTGFJYWN1NWE5YWpZY0xqM252TkJkNnN6b1M2YTlNdWNsZHFVZ3g2?=
 =?utf-8?B?NlhhV2RvZ04yZUw1RkxvWkhvV1NndU44WVNqbDhTTXQza3dIY2pkSkFGNk5j?=
 =?utf-8?B?Z3hNU0N3SVF0SzZPQ2NEUUVpWmpHMGcvbCtsSlpqcWVZVW5kZVFPZlRmNGgz?=
 =?utf-8?B?MDM5ZWRDUlNlQWhheldJVUF1VkZaU0RBTURjMGcwNHgrUnRYalFwRVp1ZEpY?=
 =?utf-8?B?SVVROWdqVFl1ZEtZb3BsOUhhTm5CYTJKTUUwSlN5K0syQkJsaUl1Q05iL0VH?=
 =?utf-8?B?QXFBdFc5c0JPTnFGRGlzcmhJeUJJL1NNOVYyOW8yNkVMRzBjUGJTWitma2o1?=
 =?utf-8?B?SEVvYzE1S2NzR1d3WEltdUJXdGc2ZFVSRis3Ym4waGtaMzdvUnJzaG5Sb2F4?=
 =?utf-8?B?cVVhUEpIdGJxdnp1cll6KytKKzU2WkwrVjBDYmRmVjZCTXhOVStGZmJta2wy?=
 =?utf-8?B?RUJKeEFVUElmNW0ybE9CTWlhczZUNE04YmY1REszbWlZdG9mTVpFN0p4M2Vh?=
 =?utf-8?B?KzRYTzRYYUxqZGNZaVhyejJPMXVhRUNQcDV6TmJ0Tk5QN1daQjR5dm1XV0tQ?=
 =?utf-8?B?QlErMmV4UVBHNzJkZzIxcWNIMmh4dVp0TVkwcm13R0g2WGNmQVJKUWxaeFhh?=
 =?utf-8?B?Z3hRa2wyVnZHY1picTRxa0tObDArdGNkcTdoMmY3ZExMSUVnam1YSzRuT1JU?=
 =?utf-8?B?WUpOQWZDM1lDRlQyc3YzVGIxZUtlTFgrbGhzY1FWMk90eGFiU052VU5CTENi?=
 =?utf-8?B?L09QbVk4NEJ3S0ZJK3BWSUpHVGMzVkEycE1kM05pT2JGRmRUMmR6VVVNaEZ5?=
 =?utf-8?B?eHJqc2dlL1dCYkNNbGtPbFVPM29PMDZuYm53M2Z1NEpzSTBTWHFpOXlhaTVG?=
 =?utf-8?B?cnoyUmsrMkM2S2dwbzIxRitDbG14ZVFSOExLUThpR0ZtWXhtVlUvTW8rZHQw?=
 =?utf-8?B?KzJiTWJmN1VIYlRHYjhwZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M1JXV2lyUzEydURwMEJoVHlyOWI1MDgrKzBjRXFjRXYwWmo0QkFMMERXWHQ5?=
 =?utf-8?B?Tms2TVFZbzFQaExNMlhrM3JHZE8rVzVyNWRGTXhWcmI2NlJpY0VrMklxTVhp?=
 =?utf-8?B?UWxGUmhDSkFTMmI3ZjlEeHpjVnlXMFA3aldGSW9paXl3VUo1N1NxNmlnNVI1?=
 =?utf-8?B?a0JhcThsZmRrTU9wRlRiYWViSXRlSGJNQlhySklvZk9IWEZBZjlpc2J3Zklo?=
 =?utf-8?B?bGN2amJxL3BhQ1BwVU5DY0ZDamZCYmxyM1NIU0kvVXpnSlNkWlN5bDZFaWZN?=
 =?utf-8?B?WUY5UTBHb24wdDk0Z0tvNDh5Rk1DVkNTTGo2anJXU0xoUWJOOEQ3dTNnRUtY?=
 =?utf-8?B?SGJ4bEJXckpGM0Q2MXdKemxZTk43WGdOMWZPdzhhOXlTdndqM1ZPZDR6bElB?=
 =?utf-8?B?V0t1SXFjdll6TmtQM3BYZDdFRzUzTVlKZG1kdmVHY29hYkd2cEpOYXY0UDY5?=
 =?utf-8?B?dGF3cHZpYWN3K2JmdERjR3dEbGUzenM4anBGYzJqbjQxWVFNbXJvRjVDdU9s?=
 =?utf-8?B?VWZodnR1ZzVDQVZXY2F2dWRRazVteU83Qk82dVFHVGUyREdKZ291am4xV1My?=
 =?utf-8?B?SXprVlVwTGRvWUJhc0l6d1Fjd3FKWXhOOUZ5Y2dtREJ4cW9pT0Vkb2pobi9w?=
 =?utf-8?B?Mm5IMHA1UlFGQjJZa3J6MThSWms5N3pnTy85a0J1T01xVmVwODkzekJkSTZX?=
 =?utf-8?B?UzZ4ZGwzV1JVek1FVUtaemwzemRsemtlV2h3cDVKK25ZMWoyaTJTZUlZSzBU?=
 =?utf-8?B?Rk5FSGxFZmkycnN0Q3pZYW5KTTN3MjV4M2pQS0FRejBWeU5UdnJucjVlZjhh?=
 =?utf-8?B?azY4Z0x3ZHAxUHNvdnVVdlVmVFdOZkJoZ2JBM3JTaXFxL3NrOEFuTHpVaGY3?=
 =?utf-8?B?by9pbDVPYytkUm1XSHpEaU1QS2lyUUQvcHhEcGk1eWFHVHZPSHgzSEowSDlN?=
 =?utf-8?B?TVAveE1JWkk1TVdPTU5xeHhQM3dLdDVrUTd1ZnZVT0t1UTh0Q1VBazlCelFT?=
 =?utf-8?B?M3RybnpMMmd3QW9EdGJOMFB1bWdCdXhoY3VwZlcrbU1TM09UcjNDRlBXRGQv?=
 =?utf-8?B?alZVM3hieWQvdmlTeU0zSVVaNmExdzB3cnVNcW9BTkdkcG1NYlhBa2ltUGV0?=
 =?utf-8?B?eC9zWDRUTURzcWVBV2hsSkFZNjF1UTlxRHVwVytFU1ppZ0owdDZPRy9Ud2lu?=
 =?utf-8?B?ZUtveDZwQmZobTQyMjh6d2ZYTTZETDNEL1JSVXdIc3d0dDJXZHRBTHdaYkxj?=
 =?utf-8?B?cFVtaUFDQ0JKUHVLalZ4dnA2Q2QvNlZxSFo5bmhFc0VteC9ZdGZraEQxYlQ5?=
 =?utf-8?B?WXFIVTBYYnM4WGJmeGRPWDBHRmoxSUxzbWhKU2lhelRiZzEzNG1BZG9CeWNF?=
 =?utf-8?B?RWw0aGZ1KzZNeW1hbGJEdy91WStxUjlPb1FURFB0N0lsamxxc25ZdzlQellU?=
 =?utf-8?B?bU1iWFNLWE1saVdhK0lTVkh4WDJWQlNNVG1WTXBFNHBlVlJEcm1YK3NVcW1s?=
 =?utf-8?B?engwUysrMFVBbmx5RlprNDdrOEU1eW9aK1prLzlsTXkwMzh3TVFEWDFPQ3JM?=
 =?utf-8?B?OGpneXBTUWxLNDh6L1kyK0ttUEEzbGYvNVdTYTAvODYwNVo5dkoyZVQxR2ox?=
 =?utf-8?B?bUhzYVg4RUxrWnNNaDAzWlFBUGlDRlp2YllLWXZvYVNqdWo5b1NaRFJVMjIr?=
 =?utf-8?B?M0ZjdHMzcFV5RCtwTkVBZnFVR2pFNVU5dWJUQzArd0tiMW1uZ2NIK0pyekRw?=
 =?utf-8?B?M1p2aXNLeE9idHNPendkb2ZadUF0NVk5a1lQUmZEVnZpVTJmRy9rVXVlYWY4?=
 =?utf-8?B?d1VDMnBZVWtLRmx4UUUwWWFwTHRTSEFvRUxUQW85dUNJeW1HbFpxSFRnMndP?=
 =?utf-8?B?YjFsbTliVjdBTERmOFUrL1M5eTlIRnorMVdVeGhvVm1NMkNyZGRUNDRBK2xJ?=
 =?utf-8?B?UnZ2S1pvWDBoU2RFMjhzakY0WlZMN0x6UEZDQkhuTERoM2wrUTl4SWpFRHAv?=
 =?utf-8?B?Rk1lK0d4Q001U2RKT0NGN2Rkd3RsUTZwVDhsZS83SWZlQ1F5UWZCczk1dGwy?=
 =?utf-8?B?MzlmUEh4ZG9tWFdvd0dKaU91RXlBTnNhQ3RnZXFIamMzdVcyRkdMcUxHWFRM?=
 =?utf-8?Q?rlBePFRpoIbbfwPtRKG9Yf3t7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d67085d5-360c-4653-6bfa-08dcdd8b4285
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 17:55:36.7089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9BvA6piklz0KmL7DI9LdWsi+jISbZYcteCLQiww099eEJpIiNHi2tmka1IDNVLJ0z8gkNOsmAHZJzh4Adt8FsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881
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

Alex,

Unfortunately I can't reproduce the regression on the APU I tried. 
However I do have a suspicion on a fix.

Can you see if this helps?  If it does, we can squash it in.

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c 
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index bf847ac55475..e75cd527d753 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7008,6 +7008,7 @@ static void amdgpu_dm_connector_destroy(struct 
drm_connector *connector)
                 kfree(aconnector->i2c);
         }
         kfree(aconnector->dm_dp_aux.aux.name);
+       drm_edid_free(aconnector->drm_edid);

         kfree(connector);
  }

If that doesn't help, I did test dropping this patch and it doesn't 
affect the last patch in the series, that one still works so I'm fine 
with dropping it and we can follow up later.

On 9/25/2024 12:06, Alex Hung wrote:
> Mario and Melissa,
> 
> This patch causes a regrerssion on 7900 XTX in an IGT test: 
> amd_mem_leak's connector-suspend-resume.
> 
> Is this patch necessary on this series or is it independent from other 
> patches, i.e. can it be dropped from this series until fixed??
> 
> Cheers,
> Alex Hung
> 
> On 9/18/24 15:38, Mario Limonciello wrote:
>> From: Melissa Wen <mwen@igalia.com>
>>
>> We can parse edid caps from drm_edid and drm_eld and any calls of
>> dm_helpers_parse_edid_caps is made in a state that we have drm_edid set
>> to amdgpu connector.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 30 ++++++++-----------
>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  1 -
>>   .../drm/amd/display/dc/link/link_detection.c  |  6 ++--
>>   4 files changed, 16 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/ 
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index bd8fb9968c7c..bf847ac55475 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -7123,10 +7123,7 @@ static void 
>> amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
>>           memset(&dc_em_sink->edid_caps, 0, sizeof(struct dc_edid_caps));
>>           memmove(dc_em_sink->dc_edid.raw_edid, edid,
>>               (edid->extensions + 1) * EDID_LENGTH);
>> -        dm_helpers_parse_edid_caps(
>> -            dc_link,
>> -            &dc_em_sink->dc_edid,
>> -            &dc_em_sink->edid_caps);
>> +        dm_helpers_parse_edid_caps(dc_link, &dc_em_sink->edid_caps);
>>       }
>>   }
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index d43ed3ea000b..8f4be7a1ec45 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -83,32 +83,24 @@ static void apply_edid_quirks(struct 
>> drm_edid_product_id *product_id,
>>    * dm_helpers_parse_edid_caps() - Parse edid caps
>>    *
>>    * @link: current detected link
>> - * @edid:    [in] pointer to edid
>>    * @edid_caps:    [in] pointer to edid caps
>>    *
>>    * Return: void
>>    */
>> -enum dc_edid_status dm_helpers_parse_edid_caps(
>> -        struct dc_link *link,
>> -        const struct dc_edid *edid,
>> -        struct dc_edid_caps *edid_caps)
>> +enum dc_edid_status dm_helpers_parse_edid_caps(struct dc_link *link,
>> +                           struct dc_edid_caps *edid_caps)
>>   {
>>       struct amdgpu_dm_connector *aconnector = link->priv;
>>       struct drm_connector *connector = &aconnector->base;
>>       const struct drm_edid *drm_edid = aconnector->drm_edid;
>>       struct drm_edid_product_id product_id;
>> -    struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : 
>> NULL;
>>       int sad_count;
>>       int i = 0;
>> -
>>       enum dc_edid_status result = EDID_OK;
>> -    if (!edid_caps || !edid)
>> +    if (!edid_caps || !drm_edid)
>>           return EDID_BAD_INPUT;
>> -    if (!drm_edid_is_valid(edid_buf))
>> -        result = EDID_BAD_CHECKSUM;
>> -
>>       drm_edid_get_product_id(drm_edid, &product_id);
>>       edid_caps->manufacturer_id = 
>> le16_to_cpu(product_id.manufacturer_name);
>> @@ -920,19 +912,23 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>           if (!drm_edid)
>>               return EDID_NO_RESPONSE;
>> -        edid = drm_edid_raw(drm_edid); // FIXME: Get rid of 
>> drm_edid_raw()
>> +        /* FIXME: Get rid of drm_edid_raw()
>> +         * Raw edid is still needed for dm_helpers_dp_write_dpcd()
>> +         */
>> +        edid = drm_edid_raw(drm_edid);
>>           sink->dc_edid.length = EDID_LENGTH * (edid->extensions + 1);
>>           memmove(sink->dc_edid.raw_edid, (uint8_t *)edid, sink- 
>> >dc_edid.length);
>>           edid_status = dm_helpers_parse_edid_caps(
>>                           link,
>> -                        &sink->dc_edid,
>>                           &sink->edid_caps);
>> -        /* We don't need the original edid anymore */
>> -        drm_edid_free(drm_edid);
>> -
>> -    } while (edid_status == EDID_BAD_CHECKSUM && --retry > 0);
>> +        if (edid_status != EDID_OK) {
>> +            /* We can discard the drm_edid and retry */
>> +            drm_edid_free(drm_edid);
>> +            drm_edid_connector_update(connector, drm_edid);
>> +        }
>> +    } while (edid_status != EDID_OK && --retry > 0);
>>       if (edid_status != EDID_OK)
>>           DRM_ERROR("EDID err: %d, on connector: %s",
>> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/ 
>> gpu/drm/amd/display/dc/dm_helpers.h
>> index 2e4a46f1b499..4e1776b5f0d4 100644
>> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
>> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
>> @@ -61,7 +61,6 @@ void dm_helpers_free_gpu_mem(
>>   enum dc_edid_status dm_helpers_parse_edid_caps(
>>       struct dc_link *link,
>> -    const struct dc_edid *edid,
>>       struct dc_edid_caps *edid_caps);
>> diff --git a/drivers/gpu/drm/amd/display/dc/link/link_detection.c b/ 
>> drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> index d21ee9d12d26..94c911742dd3 100644
>> --- a/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> +++ b/drivers/gpu/drm/amd/display/dc/link/link_detection.c
>> @@ -1413,10 +1413,8 @@ struct dc_sink *link_add_remote_sink(
>>               dc_sink))
>>           goto fail_add_sink;
>> -    edid_status = dm_helpers_parse_edid_caps(
>> -            link,
>> -            &dc_sink->dc_edid,
>> -            &dc_sink->edid_caps);
>> +    edid_status = dm_helpers_parse_edid_caps(link,
>> +                         &dc_sink->edid_caps);
>>       /*
>>        * Treat device as no EDID device if EDID
> 

