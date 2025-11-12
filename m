Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5C5C53221
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 16:46:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E913910E75A;
	Wed, 12 Nov 2025 15:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y2oqLB3m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012068.outbound.protection.outlook.com [40.107.209.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F9E910E75A;
 Wed, 12 Nov 2025 15:46:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z0cNMnguQbgv2vOU91JBH6HXp0dbx2C9KOq7piEnINmbKy0ROu1XG+Wg8vvxJHueycJHd+qtdyfjMqfsUA3JrUDx5W/Uch6k52fcIQrkZ6cCISxhSDepFai0lgp2fccPpTwqK2G7i3i93RkBA9MZhZXFOOk52vcTSG5h9X7V2PDZSmDXXKtENjI0z9YwPGQgAJcxmWwom3Ijm/ynPOWRlfdHuPKg+yxGby7g5UtknD2sVXiBTYfHEgCb2e56IPJgCsIMhVIevNDJGwB3UVxjieQHnczCFwuhWbLcdHQWb7Qu7IuDx3Qh0HyLSAYjZ5CLGMctEmobXvKYTM4/rQAwxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3R6SIbn844oBGwFdm5GJpB8oyDBFa6hd7gJcbSaJMA=;
 b=DbZDF6wPtvfZzkJUhtURG11GN8Lbfnek5qNk+6NzHErrpt6iIhpBok8v+q8wAv3bakIVZpiwuF+eMkx64vNEERA4hjMyoaGglGwrH4kSQ86W6OdFjAGsUMw23v3TLATTaGsuvdg+I1NZdzVQ8b2R6Ri2SsriBQcITxYpbEjss1gQ2xahBVJLslRp8WsafBBeAzEQr6vrOcInz1JS8taAfERmjk8jc6EYH0dPABEUsfwkO5Pt1ROduP2gUt5SomTzJ/xZaXsa1+zBmyVAE5y3h/mJE6fDDSY3LQ5vYQh4N9s7J8Zeonr3v3dAJd+r/ntF+vgpO+rC9e5XiIolcQ0KFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3R6SIbn844oBGwFdm5GJpB8oyDBFa6hd7gJcbSaJMA=;
 b=y2oqLB3maVftHhhxXrTlDUsE2uoaEPChXKOTajeXT5qN/TkNHOfkPhs/i6sXZdl7wQUxJ68j9/M8rP+aaRJQZLSCtU8uIJjGy6UTtiED2hwSbR0TcrzoKfUDIQ0CITe0BfJ4q0WgBErxUSkEP/LcLQWK36qd9mV8iSgoUtw1py0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DM4PR12MB5987.namprd12.prod.outlook.com (2603:10b6:8:6a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 15:46:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9298.010; Wed, 12 Nov 2025
 15:45:59 +0000
Message-ID: <31275a6b-803b-4efc-a558-cbc7ff750932@amd.com>
Date: Wed, 12 Nov 2025 09:45:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 03/15] drm/amd/display: use drm_edid_product_id for
 parsing EDID product info
To: Melissa Wen <mwen@igalia.com>, Harry Wentland <harry.wentland@amd.com>,
 Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 airlied@gmail.com, alexander.deucher@amd.com, andrzej.hajda@intel.com,
 christian.koenig@amd.com, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, sunpeng.li@amd.com, tzimmermann@suse.de
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20251106165536.161662-1-mwen@igalia.com>
 <20251106165536.161662-4-mwen@igalia.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20251106165536.161662-4-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0010.namprd11.prod.outlook.com
 (2603:10b6:806:d3::15) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DM4PR12MB5987:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e94b410-9eeb-43e9-79f3-08de220293af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0FoVHhxUVM5dUJpZ0ZVcFJOT1YrN3NxZTMwSWJYTG01Z1htOVdkQzdTNlVw?=
 =?utf-8?B?MjlsRlhZTEFKZkQ0T0VjU3JBT2tlTVJ5L21Pa1dRVjBmRHlJVHA3TGplOUI4?=
 =?utf-8?B?YXJQYXJGQkkxWXB2eDJIUHMwb2RmdzV3a2pVV0k1VHVtOWlKa1ZoS3U0cFFI?=
 =?utf-8?B?V3RlcWhtR1dHK2ZOZmNKYW51MXoxSEJkclZGbFo1OVFKQU9CUkg0b3JCWm4v?=
 =?utf-8?B?WUZZYmdKWlhuQ0tyVnBjeVVDdkdjVit2S09WWngvL0ZIR25mc0RMN3VTenMv?=
 =?utf-8?B?RlBBNEtpSGl5SDFQUCtRN09XZ3hMWnFOcjduUkVlZ2ZleHExL01qemJKMUJQ?=
 =?utf-8?B?TnAwbGVoYUpJdldLczU5QW4wak1VOXUrU2NMaCtOZ1ZuZGRtVUtMRzNlNjBZ?=
 =?utf-8?B?TW9SYkh0aC9FcVV3TlFFWXc3R1ZWWVp3QTdKVWhwS2YveGtPbHkrWXNoc1hE?=
 =?utf-8?B?YkFDeWZ2azNMSnZFckxGazlONngvUWxWVHh6WU84L1BmTDU3NFZGdHdMa2Zp?=
 =?utf-8?B?bXhuQVAxTTE2VzNJL1pPOStIZTBzdE44VVE1YU80OW12M3BmelVWU09qTSsx?=
 =?utf-8?B?anFjN0pZcnlIdExSWGtMNElDNkxQT3grOUkvVTBwSFNndHBVMUk3ZXBDL3hD?=
 =?utf-8?B?RDBrZFhob0VGRXdtZjd0dS9YYUVwRFNVZTNsdjc1Q3BaeVdYYWx2N2c2STY3?=
 =?utf-8?B?L3E5MXdYOWlGaFFlU1JtZjBFdGZIOElOclZEUnlRL2psRDhyRVFEdVVLdFF6?=
 =?utf-8?B?UUZYZmJsRWk5bm56ckhSZlE4SS9nSjRBc0pCZzdwSGRrbVJUakZQWkMvM0ZX?=
 =?utf-8?B?cnVWTnpFdlNNaEJ1dk52a1hrYUpFVGlFV0Fkei9Tbll6WWZKdzRPamh2TUVB?=
 =?utf-8?B?YnlNc1A1eThjNHJJK2x4UTc3eWZWbVFlNWFFWFQySjhJQXJlaTFuc1JDYkdi?=
 =?utf-8?B?bFc5MmFMcTJUQUxTb2lzNXJkN0pHaVJNODh1VkVpQlBpc0lWc1dYM1VEenNS?=
 =?utf-8?B?bkQ0bklYRFAvL0NtRG0vR0pwQ1ZuOVNHbkxNWGZEdmZUV296S1MxVUMrSW9S?=
 =?utf-8?B?NytGVzlkYW5LZE51RkhZZW1sOXJLNDQ0aVpqMjhvSkpWcVl2R1J6eXVEaUpR?=
 =?utf-8?B?MHRzaWFLRXc3MHZpUktJczduUGZ0K3N0UWNNNlA2Zmk1MG94L0x3VjVLLzJB?=
 =?utf-8?B?QmN3UUJzV1lYVHp4cFBaZ1U1aXVtYXI5MGtUNS9ENW4xWHVUN0kwaC9DVDIw?=
 =?utf-8?B?OWs4VXlwVURBTE1zUXhmRFV3TEErR2NlbmgweXhyNkFPdGVhbTVDQkVDZ242?=
 =?utf-8?B?eTZDb3RtSUtTZ2szVTBydlN1V0V2MWMxRzhrODVpZUxkRWhFaGt5S01ZY292?=
 =?utf-8?B?MlZnVWF2ZElIcWR4V05KKzQreDRBb0V2WE4yYTJ2ZGIvaFhldjd1Z3JPWmd2?=
 =?utf-8?B?S3FzK2NaeUFEMjVpSS9IQnkyOVNnRDk5THA1dW02RnVhQWhxTjk3N0IxNTRh?=
 =?utf-8?B?SkxnZ0lFTUt2ZWFNVlpvWkM2SWxMTllRanFRS25LaG1KdHZkNGVwTDNMV2h3?=
 =?utf-8?B?NlZnQnlWMHpmNmxlQzh5d2JwMll6WXd5TGNJT3lLbmtVSzgzZ3U5R3hOVm9q?=
 =?utf-8?B?Zlg4UkU4aEZSRG1ld1FXa2RJUzJqeSs5ZnZkaHE2S3RDYyt2UWpZSEhtRmJ6?=
 =?utf-8?B?dStrSzlCMmc1RGZaNmI4WEdrMEZ2U3dGQXVqTmVTR3NsMmtjM01kdVV6Y1dm?=
 =?utf-8?B?ODRlS2tuVHFEdjU0bEZ3SkZYTU1jYkVjSzRFdktzR3A3UGF6N3NwektpWUI5?=
 =?utf-8?B?ejdkeDR1SlhPdzc3aFlZSUxSYnN3bWdDL0xtV0I3VHBJNVRaTzVHQUdYWWdq?=
 =?utf-8?B?R1dtWGRGOHlKODhFOC9OYmJKOTZGdFZJN0NnNmZTc1FLRncxblozZzdmV0pX?=
 =?utf-8?B?V1lnWkR3cXJYTlBzVzFxbXlEUFRFbDRVRlRkOW1mUnNWL2lpMHlDYmVCRDdD?=
 =?utf-8?Q?NLLa0uZXDGpfs7gC6JpJ5QyuPMZA/M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmVJdllxYjlqOUFtV0tYU0NGdml0T2lIS2YwaGtuenBrUnhucGZoQURPclNJ?=
 =?utf-8?B?b2l0TThiUGxsNlI4YUR1b1ladDFMc0E5Zmt6UFE0dE56a1Y5d1NOMHl0YnE1?=
 =?utf-8?B?TmFoN2prZHZob1M1RlRGQkRIRkxBTTFJUWdWbUgyV0lncWd3dmJBK0V4YWtz?=
 =?utf-8?B?SUw4TXJxSW9nMlBOeWYxR2pxc0tFVHJPK3B0azNLc2t6YnJVQTQvcTF5SFRW?=
 =?utf-8?B?T2pTMmg5cWxqMGFqZUpoZFpkeE5UY1dnc2FzT0t6c2tjNGtBQlJiaTZ2OExj?=
 =?utf-8?B?d2VURXpjZkI3L29SY25rZlU2SGYyVExqcjVGYXVkaTdWY0dOYTVHa253bGlT?=
 =?utf-8?B?eWxJZVBDMWRLUHYvOGZCTmR2ZFludU9DdGU2NGZHTTZKaVlYWjVNcE81ZGZi?=
 =?utf-8?B?bTloTW16ZHB5OWt5TXNiNGo5QUQreGZaNHl6dTJsdUMyc3g4czByWGo3QkRS?=
 =?utf-8?B?VkFCYUFrR1BGOW9TMUN2Y0hRNjk5RmRWK0M3SVlhck5rSHZmZzd0d2FEdWUr?=
 =?utf-8?B?Q25LMVFoOUVtSCtwUExlaWl5VjcyY1BZSnVzK0FKaWJDV3gwalBZZEQrYjVS?=
 =?utf-8?B?Z0VTanJTekN1Zkc4V3VKVTNuaWN0dlkwcW1pMEN6TWJZdjlyWXRieWV3M2FL?=
 =?utf-8?B?dUhaZmxKeVhaZU9xVkxNelBac0YyeHZRRUs1UGFTMFkxbkRETHRQUC9USENF?=
 =?utf-8?B?SS9Ea0E4M2lNTkVucFBHNTlkN0NCdXFZOWhxOHlEN1NCK056Qlh2U3QySUo3?=
 =?utf-8?B?N09lL1I4cWVEQ24wMGcvZ0F0SE5LRkNFaGp1Nzl1a3d4d1N3VDE5dTNmM3d2?=
 =?utf-8?B?YzJQVUVzNE9HWERyZWRvZ2xFRHo1Y3Nxb1pNQ3ZJb2ZhSzU1WCtCSkxqNUxt?=
 =?utf-8?B?VVpPWDFIZGxmS2FDeGhKaEpWSFdqVlczRzZ3SzJMSW54U0dKNnBOSDNXQTM2?=
 =?utf-8?B?MHdmeE5IcFhxeTc4a05wQWVMbEd2a3psWGFyRitGRlJEQmdwUnlMVlREM1Zj?=
 =?utf-8?B?Ni9mYW5BbGhpdDdjNXFBdm04U3cyL0RVWUsvVEJGd0JYNVQ0MWhLSVk1V1Yy?=
 =?utf-8?B?bTIvWjlIRW9oRVdmZU9LaXFsckJzVG1MU2w5cDUxd203eCtnQjdZUVB3RllM?=
 =?utf-8?B?M1hxVGpzdUp4UVF2VGFTUklpTXRTQ1g4R2Jsd1UwZU44QWg0S09BMnlSaE01?=
 =?utf-8?B?dmxDMU12aU5DYXNnK2E0RCtTNVlUbnhVUjMvcFQzOUxNR2lSNWtyRU9FMzFS?=
 =?utf-8?B?N0pyM29EZHNGUThZbVBWek00K2VVZHN0Y284U0ZZMFNTRE1jamk4QldNOW5K?=
 =?utf-8?B?ZlRZL2xXTHIzRnY5UGFwR3BDNmZ4SHQvWTZzS01JNU1LUzFmV0JZeDR0TW5B?=
 =?utf-8?B?V01ZTHhBZTQ2aVZicUV0U2NPTThpeDdsa3pYejdyaUFpcHVYazdMZ3IxNDNW?=
 =?utf-8?B?SnQ3N0l4R29DQW1JMElKNkpId1NrSGlsQVdxWFZWYkhnc3JTbUIrR0hYRWh1?=
 =?utf-8?B?MnlkQkJOSEswMmgxdHVxcDE0MXpPZFp4Tm1oVmVUVkN2b210N0h2YTB0TDhr?=
 =?utf-8?B?NmRSTzJydlNjbEgwc3kwZDY0QkhjMlZVVGFTbEpXYVlmSlp3M2ZLdWt3ejEr?=
 =?utf-8?B?S1h5d3B3eWdEcHUzN2tJVzBkS3V3WGJPbDN6VTNXQmpvcFVaZnEwalIrOFZW?=
 =?utf-8?B?a1FSQVcybHBVcnVQMFpRNXF4bDhiVHI4VksyWGcrSHE2WFN0NGlyZGhFQmJP?=
 =?utf-8?B?NGdIa1o2WUtWU2toUVVidnVOVUxmcFg0dlhPSmtTQUxPRHMvUE1HNXdHRVkz?=
 =?utf-8?B?MUNpdSs4eDBJTkpHdGdiNkV5eDRKdUpsaElTRStSdVNUb3hXQXVXVGFqVUlo?=
 =?utf-8?B?a3JJSEFmMEpMQUNjVVdLUjNaQzZXQ1hTY0xIU1d4N0FDVHptem5TZk1KaC9n?=
 =?utf-8?B?VktoYUZ1R2pZdmlFSUtnRVh5N2pmcVFxMVo2NGJBaWw3ZDNiVUh3MGlLbDF0?=
 =?utf-8?B?OXp1Y0QzTWFRY0JTMkdKR05md0p3azR1R2g1cFFkUG5GZ3k2aGQwQWlCbVBP?=
 =?utf-8?B?K3locjR0STB0RjdSNXp3TDlCY0w3TjV2bTdoM0pSWDlOV2N5eHZPdG9MKzBz?=
 =?utf-8?Q?WI/5AfRF3CnKgKGCQqoZIFRdr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e94b410-9eeb-43e9-79f3-08de220293af
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:45:59.8443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnOILOvj2wdn+iKcH5qIP9uK7GwMIT8nRvuCgi5+at+k0srC5KIgAa9B5QQTqVVeYk7VAWqou/PMxcs7Ua67Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5987
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

On 11/6/25 10:49 AM, Melissa Wen wrote:
> Use drm_edid_product_id [1] to get debug info from drm_edid instead of
> directly parsing raw EDID.
> 
> [1] 3ddbd345539e ("drm/edid: add drm_edid_get_product_id()").

Correct syntax is commit XXXXXXXXX ("description").  IE something like this:

commit 3ddbd345539e ("drm/edid: add drm_edid_get_product_id()") 
introduced drm_edid_product_id.  Use this to get debug info from 
drm_edid instead of directly parsing the raw EDID.

> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> --
> 
> v5:
> - replace series url to commit hash (Mario)
> ---
>   .../drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 70014bec7099..7d05cff08233 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -111,6 +111,7 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	struct drm_device *dev = connector->dev;
>   	struct edid *edid_buf = edid ? (struct edid *) edid->raw_edid : NULL;
>   	const struct drm_edid *drm_edid;
> +	struct drm_edid_product_id product_id;
>   	struct cea_sad *sads;
>   	int sad_count = -1;
>   	int sadb_count = -1;
> @@ -127,13 +128,13 @@ enum dc_edid_status dm_helpers_parse_edid_caps(
>   	if (!drm_edid_valid(drm_edid))
>   		result = EDID_BAD_CHECKSUM;
>   
> -	edid_caps->manufacturer_id = (uint16_t) edid_buf->mfg_id[0] |
> -					((uint16_t) edid_buf->mfg_id[1])<<8;
> -	edid_caps->product_id = (uint16_t) edid_buf->prod_code[0] |
> -					((uint16_t) edid_buf->prod_code[1])<<8;
> -	edid_caps->serial_number = edid_buf->serial;
> -	edid_caps->manufacture_week = edid_buf->mfg_week;
> -	edid_caps->manufacture_year = edid_buf->mfg_year;
> +	drm_edid_get_product_id(drm_edid, &product_id);
> +
> +	edid_caps->manufacturer_id = product_id.manufacturer_name;
> +	edid_caps->product_id = le16_to_cpu(product_id.product_code);
> +	edid_caps->serial_number = le32_to_cpu(product_id.serial_number);
> +	edid_caps->manufacture_week = product_id.week_of_manufacture;
> +	edid_caps->manufacture_year = product_id.year_of_manufacture;
>   	edid_caps->analog = !(edid_buf->input & DRM_EDID_INPUT_DIGITAL);
>   
>   	drm_edid_get_monitor_name(edid_buf,

