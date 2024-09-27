Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB04B988A50
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 20:48:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228AB10ED04;
	Fri, 27 Sep 2024 18:48:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VmcyFNM8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2051.outbound.protection.outlook.com [40.107.102.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B63C10ED0B;
 Fri, 27 Sep 2024 18:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T20NLzK6CE+eyjQQZeZ8037YN3EBqmXqZSIBW8vyvxQUHZq0zPWltBVnAwhVUqoRC8UH86gLnkDRlQ3j9aJHK9i3Wn8Kdba0AasmkHpwKLPr7+QFJvjHZ563+okfpGbnJ66MAO8aSP64nQtFmfcD6fEvnWxCk1oIXA07EFlgybxhgjiVRo/MipT3WMdZKkAsRsPEvQHn15Q3OflQjKp9anXXlbfIQc57z3UQHaR8RaBOoaJ/Lbcwtuzthab5TjI0WxmnktLLWdBos1DHWn5qb+MNOZl0h711ktDTa7XVZuiClWzNDKVLsYDKftJZYP5M8GFrtPRrG0+5+t8IaRmurw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwhbCIGKJFQQIgIa29Y/GEgdyzWAl2NiMNHOiAN1zD8=;
 b=mRQrycNKaZNrFMlN9/60KFGPOuS4atlilVOgNkN1VF0OERdMtcFWBgLKQqHEytylLFggtGf/VynTAxEXX8Xi2/GZn5x68jxlzCBazbI6CzJJXCpssEGI++9klXOHFCngJ3ggfjD55my2WtiuTS4pMf3Mn8c+X/rbqJ14TX+gvXdV41Uc+ux6xzgpd7TFktI+2oxebFd5eWSYTJFJSO8AgDYHCnbpMQCDYWLzUgYcOk7jkF47+KU4HaTNXRGpTnNO8XqQWC2x3266OGo9AUk5CCeb2NM7nB3PjKvDgl/fcrz2xbUMq4+6xCyUbeI7iLrdtDEdNFkM/pCnoDZqs9tn9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwhbCIGKJFQQIgIa29Y/GEgdyzWAl2NiMNHOiAN1zD8=;
 b=VmcyFNM8CMa9nTAYu+N26oPT9FHjQulZeoq1E5wyPGJ62g+AHwxRK1mUcDOrMb9drah1Er5PE6G8bB3BuFpUovbKmB3/dkRxNsDUycuBIxi1nIWMaAs0Nnjr7ZaZ3n/gYeI5KI5mSHgv4kB0viig0xjQo3VrsycGnSveKHnaK8A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB8495.namprd12.prod.outlook.com (2603:10b6:208:44d::9)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.24; Fri, 27 Sep
 2024 18:48:15 +0000
Received: from IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692]) by IA1PR12MB8495.namprd12.prod.outlook.com
 ([fe80::97d3:87e9:1c4c:c692%6]) with mapi id 15.20.8005.020; Fri, 27 Sep 2024
 18:48:15 +0000
Message-ID: <c15c189d-08c0-4f7f-b4a5-7e58d530ea3e@amd.com>
Date: Fri, 27 Sep 2024 12:48:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm/amd/display: Use drm_edid for more code
To: Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240918213845.158293-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0133.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::12) To IA1PR12MB8495.namprd12.prod.outlook.com
 (2603:10b6:208:44d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB8495:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 281e9e20-0490-4c48-0cf3-08dcdf24f229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QWEwUCs5aExuT1I4UmtySGxHdE5QRllZUkZKMGlrUEZXRFhPelpNc0lNWkcr?=
 =?utf-8?B?TFRBRExOUkQ2aFZwYkhua3h1VkdaVHgvV2ZOdzFsOGYzUVB6eVVLOWl5TWEy?=
 =?utf-8?B?OXl1VnZRazNZMmkrSXp5N2ZBVk5pZTQyd0o2WkRrR1ZRenFZbE1MSEt2S3pi?=
 =?utf-8?B?NDNObjlNdDFNcGl2Vkx5dlBxYzZjK3ExclRSVzQwWEcyb0l4OUU1M3BHaWJZ?=
 =?utf-8?B?T09xZDRzYUloVDZ3aEZlT2tNOEtnSEdzUTA3K2o3MUN4UWFGNDVHb2RNcDJa?=
 =?utf-8?B?OXpiNFpyV0JOelJiTi8xYnRVRFBycjZBcGpYS3BKcjdyRU41Zlp5aXVmcWt5?=
 =?utf-8?B?S1I0aDNKL05yTkM0ektFb1dTSCsrTHBoN0toV2Zla1lRYWpLRTBaRTE1R2F0?=
 =?utf-8?B?eU1wSHN1dUNDYXo0TDBjQ2JMOFdJSlh5UW40NzRkK2tib2FoYmpMdVpJWW5K?=
 =?utf-8?B?dTNlQ1VncjlHQ0R3YVJlRTVIY2wrVEFXdGduMXk1cU83ZlFMbitMazIyK2w0?=
 =?utf-8?B?M1ozVlNzMk15RExWbkV1UzhEZUJ2R2dkVnhBdkpuaDg3dFlmdjQ2STZ3QjF2?=
 =?utf-8?B?REwySE96TXhzRnB6eG5CUFRsbWNFVk12ZFJuUXgwdURocTFoVEVZOVI0SGRu?=
 =?utf-8?B?OGkzWHlEUUo4U2pJd2xYWTA1TWNYRHJ1dkIzeHptOWpyanVoa1c4TndxQnJy?=
 =?utf-8?B?MGNhRjlhTDAzdldpUjA3eENxMnRabUtwTE5YVHhJU2ZNeUhiSUVjOXFXbzB1?=
 =?utf-8?B?d1Fla1hDMEowaWdzeXNYZkFVKzdzN1hlZHhxQ2E5WU03R1ZJcEZzS0xMWVVC?=
 =?utf-8?B?Y1FMVWxuT3ErVWVUdEJNYWhGWmZ3Qk5mOWhtTUVwdWVKbTRMMlVVZy9ZeGl5?=
 =?utf-8?B?NE5oYVd3d0dLcTdNS3IvZmN0K1J5VzhPQ2NaU202YjNIZlgxWXd6RDgwa1I0?=
 =?utf-8?B?V1RhdXF4bkQyTHFYeVYvdEFvS3FVZm5uV0YxeTlyWTR6M2NDVjBxMnpYT3VZ?=
 =?utf-8?B?dm44bzZSMFFHQjBNRzRkVnN4cmVHcHl0bHVLWmZYYzdiVE1lWmloZVA0cXFH?=
 =?utf-8?B?bHNvbGNnVG5BSkxuYVpuUEpqb29rcVlOdEJ1TGtCRnU2TjVrSHdlQ1JzWmZu?=
 =?utf-8?B?d0RKQ1dvdjNsMFl5Rko2bnFyZzFySzV5ZUdTR3IycGZDbFNzd2FkK3UyRDJr?=
 =?utf-8?B?dTJ5TGlWaVI3VStpTVAxZWpGU2h1R0kvOEJUWHliOU1TMUU3WUIrQWlkWWpZ?=
 =?utf-8?B?enRYemhVVmpOWVVFNThEaFRBMGRkaHphZFFxVzhWaE8xS05zV3dRTGtVRnZS?=
 =?utf-8?B?VUM1b2lmMjZxT0VlZDJEUHZQaFhjSTh2NFRucnNrbkE3b0E2QmRoSzNtR3d6?=
 =?utf-8?B?T0ZXeHQwZjFxd3pVU29rbVF0NmtlSWswaGx4Y0EvcTVWNDVFbXN2Q2tianZ0?=
 =?utf-8?B?anFyVndSMnNpeng4OGFkN0M2SE9SalAzOENMbGRMYW5EL0svdmNDUVQ2QzJu?=
 =?utf-8?B?T0QwbHR2Y3NTbFhhQS9NZVBqRHNRc0lFSno2c3RqMklmd2JBU2JDMisxM1NY?=
 =?utf-8?B?NUFYN0Y4bEV4NitITHNURm5rKzZrcGF5K1dvc1B4KzNhaGdBNlBtaWtidzV2?=
 =?utf-8?B?WnVwRzdsTmZvendneXBwMk01OWxiYmNLV0NIR1R3UGVTNW1wYjZiWWtRalFL?=
 =?utf-8?B?Tm1RVC8xeHZQUUVTcG5BVlErL1pCeWVQRk0yNWNSZzIxVkZ4RXlDdXA1amRJ?=
 =?utf-8?Q?Gb+7hKWQhiAjJYAK+4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB8495.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q25pNEJmK3k3Q0ZaellpUTdQNjR1NWVUdVJiampCWmdiSXMyMXhwTkhzU1FT?=
 =?utf-8?B?cmtkdE5nSUJTcHVMdUYwU3h0OWpBUS9rV0NpeWdzcWVXdWNKNndsek01N1pO?=
 =?utf-8?B?UC9wZXRuUDVtVXN1NEw1dlJUeGErS0dENnYwb3F4am51ZFdpdVF4SGlNOUZr?=
 =?utf-8?B?WEhVNjE5bkI4V3I4dVNIY2xMcjdDRzRlMUdnODlKelNyYnJSc3hjcXlITWYv?=
 =?utf-8?B?K3RSMjBpYUNRbTdhS3pXdXdrWGZ4dUh1ZW45akZjbUdVK0NVS1BKNXpmbXNQ?=
 =?utf-8?B?akg0NWlHVGFyb25aUS8wNmthci91RnMzSUg5S1ExaHdiL3BGQyt4bkl5WG9h?=
 =?utf-8?B?bjBkbWcwMWdIeG5TakxKNzRVVUw1SXpZeTVlbmJxNld1VFNUeUIvM1Ruc1VF?=
 =?utf-8?B?TU1nM2dkVHFmYkUrbnlkdGlpZFc3bmNXSHEzcmNEVWRNRGE2dUh5UmlpQjl5?=
 =?utf-8?B?MnR5MU5aYUxRbHRTaVQxMFFmTWZHWEpmSWxJT1piRnVnaFBScjZIOXpjenZN?=
 =?utf-8?B?dHdOMmd4R3M0YlRHUk1GRGZmOGtwMndmb1JHajJWMDhhVktEcHRTcStjbHRM?=
 =?utf-8?B?eitQRCt5VXJLR2Z0MWdEQm5jck1LRHMzWkZDdENEKzhZVFpuRW1DQStraWVm?=
 =?utf-8?B?c1Z1Nkw0bEdVMkxlNzAyNFU0MEwzb2VVUk9QcUxnZWdCS2Vha3p4SmtzUkFv?=
 =?utf-8?B?WUEzYzBaUHBlckpRTE9rL2JlNmYyNHBIUFRRMTRWMjlvZnhPUGtQZUdTaUpN?=
 =?utf-8?B?WWZuTi9LYWZoamlvV3gyNmplbERnWHJ2by9iNHdVc0JLeDd0V0p0UTY2SWsx?=
 =?utf-8?B?Qk9wUllYRGFtcStTUXpoaDFGQ0swcUltM2FQVDc2UmpvTTgxbEZVd3JsNFR3?=
 =?utf-8?B?aGZNV0k0a2NJNDV6bEJnMTlOeEt3Smt1aGxZc2VZWVRmdEY5YjFyeUNJTnBa?=
 =?utf-8?B?WVdYN1dlaWhSVHEwZXhjZW43OUdqcGY0RU5pNWQ5b0g3dHhJNStaVzg5WDlk?=
 =?utf-8?B?YlBSYW14YS9oNzd5blZxNUM3UlVkNmsybjB6a3I2cHhwVHFua1FadVN5R1NM?=
 =?utf-8?B?VmJtYzV0OHlWSEhENTM1ZXpzK1lJUUdsUmdZTEpZdWl5a2dSZ2gvcEZDeEhN?=
 =?utf-8?B?WTZnOE5jY1dXMFRVU2l5NzlZeU5SeExwQ3BDaUhaMmFMV1FhazJ2bnRUcmM1?=
 =?utf-8?B?eVIzNU5MQUpiOEtOUVRlYnVLbVlCeHFpTmJUNVlPa3lNc1RsT3FWZWpkRU91?=
 =?utf-8?B?NHIwTnpFZjZwSTh1ZjdhdGpRTXhJbjloVTYyVUw5Vk0wZ3dXUlF2Z0RnRmV5?=
 =?utf-8?B?UGdRTkR5S0tveVVWTUR3T0dZUnc0KzlER2x5RFozMVFNUXBDYmgybkRRN0Mw?=
 =?utf-8?B?RGhadkJuREVYQllHdldFcEZPUHhOelNZWC9uVzF3TGsyd0pxS1QyTGxWZFM4?=
 =?utf-8?B?Y2tJZE8zUVdoRXc2bTVwWDdpMmIrY1pqOXVjRG0vUmdCa2xieXQxY0dhUnRl?=
 =?utf-8?B?Qy8zQ0UrbHBHNHRLam9UWWVoZ2NPVEI5RkFkWUdxcm5zUDcyZ0NiTzlLTE1S?=
 =?utf-8?B?ejdmU2EvUi9wZDBma0wxZ3o1OWJ0OXhBclhmMkhFR2FZcjQvYWhncWVKL3cw?=
 =?utf-8?B?dk1aVEZXdUVKbzlNOEU3cmEzRm9IM2tLWHhabU5rMkNrdHVCRWQzdzBUdkJ4?=
 =?utf-8?B?OXBaMGNlK2pkQldzbXhkeEtsNVEzUStaZitPZ053d2V2b1BjTU5CcjNYUWNO?=
 =?utf-8?B?ekxReC85UVQveU5hQjlZZDl1ZHdBWmF4VVpQOUZLM0VDc0gxWU9vRnM2ckk4?=
 =?utf-8?B?TWJzNEw4VDVXYTdQeG9CRUJha29JU3pMMkN0OHlvQlMySmtjR2pRVlpDd093?=
 =?utf-8?B?QXhybjB1S2pqcW5rOFR1bWZVUWxCOExBdFBrMkxBaUdsSFJRaXRiVnFqV0NY?=
 =?utf-8?B?MDZFcGlLRUhVa1JVbkh2SWhFZTNVbExrTHNSQ0gxOGpQWVYxYmFWWWIza2VT?=
 =?utf-8?B?dXIvZ2xsUllzV2c1VjNkVTVydE5wU2xGMkxiV1ViWkRteFE5MzJNSGlYem5p?=
 =?utf-8?B?c3N3ZVdFOXVPSWhWTEpiZ2dDdXNPSVFXQ3Avc3BKV2FvaHJqWThrS01lb1lB?=
 =?utf-8?Q?rmGNYnkkdAlR5EK1rzUS6hk+F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 281e9e20-0490-4c48-0cf3-08dcdf24f229
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB8495.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 18:48:15.5190 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rGXEJWpadWpXqWdZrgLAIwYqAfyYeUIEBdmAaLmyF6/UiROdL7Acqt1T5m4CHebE2H04iNOgDJugNh+iFJj1wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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

Hi Mario and Melissa,

There are three regressions identified during the test, and improvement 
is required before the patches can be merged. Please see details below.

1. null pointer when hot-plugging a dsc hub (+ three 4k60 monitors).

This may point to "drm/amd/display: use drm_edid_product_id for parsing 
EDID product info" since that's the only patch calling 
drm_edid_get_product_id.


[  227.797361] RIP: 0010:drm_edid_get_product_id+0x1d/0x50 [drm]
[  227.797388] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 00 
00 55 48 89 e5 48 85 ff 74 24 48 8b 47 08 48 85 c0 74 1b 48 83 3f 7f 76 
15 <48> 8b 50 08 5d 48 89 16 0f b7 40 10 66 89 46 08 e9 a9 47 ee ce 31
[  227.797391] RSP: 0018:ffffac58126f7930 EFLAGS: 00010216
[  227.797394] RAX: 000000000000372d RBX: ffff8eaeaf8ac808 RCX: 
ffff8eaeaf8ac107
[  227.797396] RDX: 0000000000000002 RSI: ffffac58126f7944 RDI: 
ffff8eaeeeaf9f80
[  227.797398] RBP: ffffac58126f7930 R08: ffff8eae8e500d00 R09: 
0000000000000001
[  227.797400] R10: ffffac58126f7978 R11: 000000000017f81b R12: 
ffff8eae84cb0000
[  227.797402] R13: ffff8eaeeeaf9f80 R14: 0000000000000000 R15: 
0000000000000100
[  227.797405] FS:  00007f031a616ac0(0000) GS:ffff8eb57cd80000(0000) 
knlGS:0000000000000000
[  227.797407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  227.797409] CR2: 0000000000003735 CR3: 000000014decc000 CR4: 
0000000000750ef0
[  227.797411] PKRU: 55555554
[  227.797413] Call Trace:
[  227.797415]  <TASK>
[  227.797417]  ? show_regs+0x64/0x70
[  227.797423]  ? __die+0x24/0x70
[  227.797427]  ? page_fault_oops+0x160/0x520
[  227.797435]  ? do_user_addr_fault+0x2e9/0x6a0
[  227.797438]  ? dc_link_add_remote_sink+0x20/0x30 [amdgpu]
[  227.797654]  ? dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
[  227.797882]  ? drm_helper_probe_single_connector_modes+0x1b5/0x670 
[drm_kms_helper]
[  227.797894]  ? exc_page_fault+0x7f/0x190
[  227.797899]  ? asm_exc_page_fault+0x27/0x30
[  227.797906]  ? drm_edid_get_product_id+0x1d/0x50 [drm]
[  227.797932]  dm_helpers_parse_edid_caps+0x69/0x260 [amdgpu]
[  227.798139] amdgpu 0000:0b:00.0: [drm:drm_dp_dpcd_write 
[drm_display_helper]] AMDGPU DM aux hw bus 2: 0x02003 AUX <- (ret=  1) 10
[  227.798158]  link_add_remote_sink+0xa8/0x1a0 [amdgpu]
[  227.798402]  dc_link_add_remote_sink+0x20/0x30 [amdgpu]
[  227.798615]  dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
[  227.798843]  ? srso_alias_return_thunk+0x5/0xfbef5
[  227.798848]  drm_helper_probe_single_connector_modes+0x1b5/0x670 
[drm_kms_helper]


2. DP2 Display is not listed as an audio device

Steps to reproduce:
- Attach display to system.
- Boot to Desktop (Wayland)
- Attempt to select display as an audio device.

This points to patch "drm/amd/display: get SAD from drm_eld when parsing 
EDID caps"


3. IGT amd_mem_leak'sconnector-suspend-resume fails on Navi 31.

This points to the patch "drm/amd/display: remove dc_edid handler from 
dm_helpers_parse_edid_caps".


Using IGT_SRANDOM=1727192429 for randomisation
Opened device: /dev/dri/card0
Starting subtest: connector-suspend-resume
[cmd] rtcwake: assuming RTC uses UTC ...
rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Sep 24 15:40:50 2024
unreferenced object 0xffff95c683517b00 (size 256):
   comm "kworker/u64:30", pid 3636, jiffies 4295452761
   hex dump (first 32 bytes):
     00 ff ff ff ff ff ff 00 22 0e c2 36 00 00 00 00  ........"..6....
     33 1d 01 04 b5 3c 22 78 3b 28 91 a7 55 4e a3 26  3....<"x;(..UN.&
   backtrace (crc 5800a91d):
     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
     [<ffffffffbabbde07>] kmalloc_node_track_caller_noprof+0x337/0x410
     [<ffffffffbab631f8>] krealloc_noprof+0x58/0xb0
     [<ffffffffc04e8e38>] _drm_do_get_edid+0x138/0x410 [drm]
     [<ffffffffc04e9155>] drm_edid_read_custom+0x35/0xd0 [drm]
     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 [amdgpu]
     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
unreferenced object 0xffff95c6c58dd0c0 (size 16):
   comm "kworker/u64:30", pid 3636, jiffies 4295452764
   hex dump (first 16 bytes):
     00 01 00 00 00 00 00 00 00 7b 51 83 c6 95 ff ff  .........{Q.....
   backtrace (crc 70d89717):
     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
     [<ffffffffbabbbf3e>] kmalloc_trace_noprof+0x28e/0x300
     [<ffffffffc04e6845>] _drm_edid_alloc+0x35/0x60 [drm]
     [<ffffffffc04e9175>] drm_edid_read_custom+0x55/0xd0 [drm]
     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 [amdgpu]
     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
     [<ffffffffbb22ca76>] device_resume+0xb6/0x2c0
Stack trace:
   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
   #1 ../tests/amdgpu/amd_mem_leak.c:202 __igt_unique____real_main208()
   #2 ../tests/amdgpu/amd_mem_leak.c:208 main()
   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
   #5 [_start+0x25]
Subtest connector-suspend-resume: FAIL (9.535s)

On 9/18/24 15:38, Mario Limonciello wrote:
> This is the successor of Melissa's v5 series that was posted [1] as well
> as my series that was posted [2].
> 
> Melissa's patches are mostly unmodified from v5, but the series has been
> rebase on the new 6.10 based amd-staging-drm-next.
> 
> As were both touching similar code for fetching the EDID, I've merged the
> pertinent parts of my series into this one in allowing the connector to
> fetch the EDID from _DDC if available for eDP as well.
> 
> There are still some remaining uses of drm_edid_raw() but they touch pure
> DC code, so a wrapper or macro will probably be needed to convert them.
> This can be for follow ups later on.
> 
> Link: https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ [1]
> Link: https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ [2]
> 
> v7:
>   * Rebase on amd-staging-drm-next which is now 6.10 based
>   * Fix the two LKP robot reported issues
> 
> Mario Limonciello (1):
>    drm/amd/display: Fetch the EDID from _DDC if available for eDP
> 
> Melissa Wen (9):
>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
>    drm/amd/display: switch to setting physical address directly
>    drm/amd/display: always call connector_update when parsing
>      freesync_caps
>    drm/amd/display: remove redundant freesync parser for DP
>    drm/amd/display: use drm_edid_product_id for parsing EDID product info
>    drm/amd/display: parse display name from drm_eld
>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>    drm/amd/display: remove dc_edid handler from
>      dm_helpers_parse_edid_caps
> 
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 200 ++++++------------
>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 172 +++++++++------
>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
>   .../drm/amd/display/dc/link/link_detection.c  |   6 +-
>   drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
>   7 files changed, 200 insertions(+), 222 deletions(-)
> 
> 
> base-commit: 0569603f945225067d963c8ba4fda31d967ab584

