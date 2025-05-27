Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA618AC4689
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 04:44:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 068C010E409;
	Tue, 27 May 2025 02:44:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jEvbqhWM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D520710E3F2;
 Tue, 27 May 2025 02:44:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c/11ZePx8EOw49SgZEZQEmi1uvPiXwqaeLlI7nyYz0W4XXtxCxVrpyGC8MHoRPzBZyLWYSGn8dBtdwOLE1wOGcswliB4wNuaRPd0EjeE7rFSxXgC5gxvBPTnEGQ/sP/X+zJyd4yP/v9sgDhLvWFPIGM594UQhnhesFsAPTh3BvzPnKk6s6YBxKUaAFkXL7AbxU78suR3P0ctyliITjbTdbrAex31p5xE/lWmDpgIEcg2USJlWI6AO81mMOcA0MXZ1JFsUQYiEsr2EJPmqcti4vWAvKSR0Tmiv3Mnc5YcpMOe2wqNM9YW+WOTIMg5q8BR34umbYUW01eSxeWjlwXhiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CohgG8X3oY6VlsRxKPHeKg13MakJu134xguWgPhh38Q=;
 b=gezsQEhmXFZdNgAGsEKgSjWwiC5RknxsVKcMUJiD38bLOVZaMe2exYGE8KtAO45YYBg8yidui+eOvGj/v5ItQZvHM54nISSuBhYa+nktCob32kzcw2YTbqOUEfWuKPPKcC4bNXfI9fZL4y49VxmeB5R2PWSHnVXHIAT6fjxUoreOlPk1BcV8/gvXyuw3RmgM6M+J+Ajnxr+JC91VYtN8C6QETopQxDY+DYFKWoGcIRLb5Vy6nxPIDofhpGA7P3adqDi5DtrO5E04CDjuiDs9wJUCbmiMZ5iaiIfZpl9Yj3Z1AOYryIhCtCdtZ9TIiH5nHqYGYyGp6ycBNAObSr1HKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CohgG8X3oY6VlsRxKPHeKg13MakJu134xguWgPhh38Q=;
 b=jEvbqhWMY5A32V86XZBVxrtgzS/O2zSPqaSfMl18zHwGErC6LZtjURsPPnVOzbaTNt0R7MbC7WnF5G+4Ha3fZmRHU8Zd9BCdmHS2ZC9UR80jx7+mp/lXaWCn3N1oT1DfMteh6xXcD0NSVQ1d5jg+dAr6GiGJeDbkedhbSeAPFs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA3PR12MB7806.namprd12.prod.outlook.com (2603:10b6:806:31d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Tue, 27 May
 2025 02:44:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 02:44:00 +0000
Message-ID: <cf68299c-2409-4728-a4d2-c1e9c15ecbdf@amd.com>
Date: Mon, 26 May 2025 20:43:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Constify struct timing_generator_funcs
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <7dd73263342c1093f3e86ae5841a53c1e3739b5e.1748105447.git.christophe.jaillet@wanadoo.fr>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <7dd73263342c1093f3e86ae5841a53c1e3739b5e.1748105447.git.christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQZPR01CA0128.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:87::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA3PR12MB7806:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ed2a339-ec2e-497a-9301-08dd9cc855d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnkxS3R3VVNNZzZFNUNtWVNyT0ZWUjM5YVZYTDlFaFhNUm1BYmNsOGdwTEF3?=
 =?utf-8?B?RHJ0VWx5OFhkR2t6OUU1b0h2d0EzWWV1NUZQeEdRNFE3ZWl3cWUwNG1rQ0lo?=
 =?utf-8?B?ZFFXQkhEaG5vRm1YUE5rRC9INjhXd0RGeHFrSkpwNWI4TXh3SWxiVmdITXh0?=
 =?utf-8?B?ZVE3UllEeGRFck1MQUVSdlVWd1hYdnJOK3pFSmExM2NvNWt3UHRFamR4MTBp?=
 =?utf-8?B?SnlXankva2tWTjJRYTlmSDBYdEN5bVFqSjRKYStzQ1ByamRpWCt5eHU1N1Bl?=
 =?utf-8?B?VGRKRktCcmwweUk1RW41eUl0QTgrQTEzZkc4M09Hc29rSXdPTUExdUFjM3Fp?=
 =?utf-8?B?Ty9FQ3VuVUJkVlFDRGwrblhlVFJUNjJod25SNU9FUHhnNEtoLzI1QVpKaWdU?=
 =?utf-8?B?SjFVQnVBMVdQalNnK3NIQkVlTjNtNHhIeU8rMTZMc2tsa2ZFZU42QytHRTc3?=
 =?utf-8?B?RzMyQXMvWDc5SmlXalc3d1JoOGsxdEJzREFiNnJMNUgwQ1AvL09HbjBySHNz?=
 =?utf-8?B?SkNidU9udmwrRmdpM3BKclFBMzlsNWppd0VZUDZUdkxxaHduRU5CRGJQU1BT?=
 =?utf-8?B?OUV3bDF5TTlEdVBVajhGSldhNlp1aHUxdS90dngrb0FRNnVBa2VYUFplakR6?=
 =?utf-8?B?Kzl6NUIzZG1NVXgyZnZra1g4U2IwRUJFNW9vdDRDbGpGdytYa084eko3TEVJ?=
 =?utf-8?B?SkJRV20yQXBKZDFWNTV1S2d1bWhQZzNUT1pqTno2aWRjbjdHaXlsOU1vNjAx?=
 =?utf-8?B?NWp3NWJIMjRyY096L3lFdDJJS09ESzhaM1B3aHdTR3ZiZHg3ZVJEZG5DQjBq?=
 =?utf-8?B?SVZtNytwQnlXT3lkUysvelM2ZDNWRzRrZVdoYmNOQktZRTAxRnFKMy9BdXg0?=
 =?utf-8?B?SGlyeXdTMWhJWjMyRlFZTk1WejRkZThFNC9IK1o5eE10dHpBV0lPZm1xVjRr?=
 =?utf-8?B?eEl5VkxSYkFvUzJSRDJ6c293ZU9SMHBJRVBpVDNzWnJCams1RWNFSm9pR0tC?=
 =?utf-8?B?dUtkV21GWHR1T2pPbFVGbUV1U2VUSDAzbXZUNXFLdC9XUVArOFZwWWRYN1Vz?=
 =?utf-8?B?VFU1NWN3clhSTWQ5NDJzblRWNnR2SDhyM1FVM3YwcG5wb1FtU1NZeHdEWTM5?=
 =?utf-8?B?bWhHejA2U1g5ZFM3T21wVEVOOWZ5YVExR0NHNWdGUkZGZVlyQVlPVlMrekcw?=
 =?utf-8?B?bmVQQWlyT2FPdEpTWVgxZURNYkxmY0Q3UHRGS1NXekUwdWVVTXhVVUQvM3NO?=
 =?utf-8?B?UHcwam1XUUpNbWtGSFdRM2x5bFRxTlQzQVNuVmFEdlhHbFRWMU5KVm81MS9v?=
 =?utf-8?B?anVUSnROS2dIdFFGaW5rbCtoSy8rb2dIZ2NUb01lQnhidFdSbzdUU0xDUzU4?=
 =?utf-8?B?SEN6dTN4amZoWWNDdzNlSlYwSGlRbmV0eWtJWTZpNWNBem85d3dyaTgxejVZ?=
 =?utf-8?B?a2k3QXE3NWJEUlBQSWg1dGhXeVNzTUR1TDNOSDd6VElhQmp3bDI0dk1XbU1a?=
 =?utf-8?B?TlFIZzRkOWJHWDU4RkxGdU1QMmtzTTRCTDM3ZUN6SldMWFRDcGJDK3ZtSDVI?=
 =?utf-8?B?VHUyZVBRMVhKS1BMRndiVWFFeW8vLzhFMGtQTW1XU3ozK3hUU0NUUmthTk45?=
 =?utf-8?B?VFk1LzBKb0VjdnJyR3BCSEtYWXV3R2p4QVdtTnF4RDNGbzVSZnVxbXlmK05p?=
 =?utf-8?B?d3k3ZnNZUzY5b01UMnMrMUZDNXFKTDhsY3dyemUzdXJQdnNGQzQwZmJsL01D?=
 =?utf-8?B?aDFMc3FQTGdKeHZpaUZ0K3lhaEZXdUhDdXRpVDBtamRiSG9MNkpOc1c1dnJW?=
 =?utf-8?B?SGlSOG1JWWp0V21KSkpJTTdxTnREbUdsaDBYbTh5SVF1bkxxbDhWcExQdnMx?=
 =?utf-8?B?Vi9mYXVYM0t2aDY2K2RRNDRjdDlINTJpWFhBRmpDYkl2QXJLZm5iZ1hQYjMw?=
 =?utf-8?Q?DzuVz8HnMlA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QklHV1VSZU9yVUFVazE5T040UzJReENmVzdYcU80MFAzVE4wMTZFUzV0Q3JG?=
 =?utf-8?B?UkhRWmNXY3pPMWFFRlV4dGswMkE1a2kva0ZHZWZFT2wwWURLWVI3akx4Wkxh?=
 =?utf-8?B?SWRQYnMvSFJZUkRGZ2hKR1JHRFdBbjJSOEFKT1JKalB4MGxHVHV1a3ZCQ294?=
 =?utf-8?B?MVJKN09JbEt6RjFBVjVKM2Q4Ujdpc1J6YllZQ3Jvd0E2NEhGZy9UWWFVUEtU?=
 =?utf-8?B?Rnl0dTByM1JibDFRZGdlRElXaTNoL2pMRERoRXlxNVNoS2R5d1BWdFJHclp6?=
 =?utf-8?B?WnFGd0xYNEtqU2Fqa2szSXhuRlFaV3YxZW1jTlZSVHhZNHdtdmVnT045K3hR?=
 =?utf-8?B?S1ZXWGtFeFNROXd3Qi9SMXZ4d0g0QmlxR2c5NGZWY1cyZTJrZG1ubU5EQU1H?=
 =?utf-8?B?ci9sLzNBRUZzSWN5NlBwRGkzKy9GLzZueFBoQjVqRytrT3ZXR3hscXJQYnFV?=
 =?utf-8?B?eVE5VXdlRStIVS9zaU93V1g2aE9pa0ZVTXN0bmx1K01ERUFTWkxuOUhlN2wr?=
 =?utf-8?B?S0dJNlpzSDQvWTdadWRpYVFIREpaK29SLzV3Z1lxVFQzQ2N4WFZpSWdvQVg3?=
 =?utf-8?B?UjRZQXZVMkpycUFhSDlxeHZuVkU3YS9Ib0JHeGVxZW5yMklaZVlNc3FzVWxk?=
 =?utf-8?B?SjQrNGNCblZaYkdtU0t4ZDZacXpSYkpSR2tmellWWWRnSld4QkJGSWIyK0d1?=
 =?utf-8?B?ZFBmS2FUZmk2TzNZTENnVFNnSGljSE80eFEzdkNJYmRjSGd2QVhkeTBaT1VS?=
 =?utf-8?B?Yis3c0ZQT0cyT1NhbTNyNld5OVMvWXFhTE9pQWVQUk1HUG1Ia0tUSW4wMXFX?=
 =?utf-8?B?R3pHcW02SEZPMW93WUJZU1gyY3dLb3p6bHF4VEhMc1FpK0pQZmlUbTJFYVdC?=
 =?utf-8?B?YW1QZTNPSW1tRXNab2RoODJQWHlYdHY5bTFxMDRsWHlmWCs5MzF6Y1VYTGpn?=
 =?utf-8?B?RkJDak9wcHV2bXFwR2JJMmd4VnNzZ3FNblI5b1FnK2ZPcTRMN3RnYXJnMkFJ?=
 =?utf-8?B?UmdKdDBXc3pveENwYzkvRFVhRzJhN2hFREZ3UlgyV1BnelBHZ1psMllieDRS?=
 =?utf-8?B?c281ejlSdURtdVoyQi9Pb0orRCt1RnRVVjUrZFZkbzc3YTRuWFp3U3MvOGpa?=
 =?utf-8?B?WE5PUU1FUG1MODlxZ0UwVS9tcnVRcENTMmExTm9ZNHZXeHZVZmpReTcvWHRH?=
 =?utf-8?B?aWFacW14NjlZY2k1eHV1WExNRmIvSy9HTittckp6Q2xoTEV5TzdmYVA3RmU3?=
 =?utf-8?B?M1RVdFJRVVpIeXdqZkdGdGxUTHQxQUJqOFdjZlhqZ05aVWcrdEhRODVoSGpK?=
 =?utf-8?B?N01IanJrZDZURmdFSUJ1R3l4TjJHZEFMWVN6YWRlWDNaTWdTTEhrM0R4NHdZ?=
 =?utf-8?B?Qmt0amV0VGFIMHhpNzJrdU1xU1lRdzZtNG9lRmx6TzdnamJ2SzlFNmhKbHhm?=
 =?utf-8?B?Mm51bzF4RGxuaWJSd09HUmp3VkpwV3E1ZEVacHM0dFdaYm52dmFWbzRvUVA4?=
 =?utf-8?B?MThPc093TUJsR09VVC9vYkRKTnVlQklBbVl2T0xwOHRONkxLWHovMk9Kd3FF?=
 =?utf-8?B?V0hUa2RRL1RqclgwT2xGMWdVVzl6S0FndGN6K2lYaXNhRmtjQldYa3V1UTNp?=
 =?utf-8?B?dzNwc2llbzFRdTdQSnV2MXNDMzF6aUhBeFFyRzhyUjF2Ryt6d25xYXBBNUlG?=
 =?utf-8?B?ODRQa3B3aDVGZXhrU0RhNnZNZTAraVhsYVg2N3hBdnYvRUkxdE1iM1VZQm9Q?=
 =?utf-8?B?TFNMUjBLWXN6NUJ2SlV2cVlYYXFNMVlaK0ZRbERnSVpwYjR2cWFTSFNxMkRo?=
 =?utf-8?B?aGJnYVdlRjIwWlpHKzMyZ25nNm5KVFo2NVFwcTQzbmtNZE9TZFFHVnJmYWJD?=
 =?utf-8?B?M21iQno4VnVwYk9RaTJjRCtQenRCeGtkeEJIUy9xelV2TGI1K3VQOW1qdFE2?=
 =?utf-8?B?dVc4YU02cjdtVCtsOGlBSjdOZnpkN0xVeTAweFU3RG9Sd2dMTG1IbHhZd3Ay?=
 =?utf-8?B?VmFqS1dsK1prejB5dklBWk5IZUJmSlFzMnJuMmdCbmp3dllNa254TVk3MXFD?=
 =?utf-8?B?UWdKaUpPOGU1YitjMVNCbUhSVExIQWp3RzRyODlYNlhHajZwelhUMnR5eWps?=
 =?utf-8?Q?oMAnJlA7BTzsl8hIx8OwVmXQp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ed2a339-ec2e-497a-9301-08dd9cc855d9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 02:44:00.5918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBB0mx0u15ZwBevKuBULPXn022yeLG8QiQfGrrbqbAnglfDxV+Umh8JEQxOBq2lwphP1MteMo1x9nq+NGuUncA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7806
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 5/24/25 10:51, Christophe JAILLET wrote:
> 'struct timing_generator_funcs' are not modified in these drivers.
> 
> Constifying these structures moves some data to a read-only section, so
> increases overall security, especially when the structure holds some
> function pointers.
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> This is NOT compile tested, because apparently some .h files are missing on
> my system ("reg_helper.h")
> 
> However, I've checked how these struct timing_generator_funcs are used.
> They end in "struct optc->base.funcs" which is a
> "const struct timing_generator_funcs", so evething should be fine.
> ---
>   drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c   | 2 +-
>   drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c | 2 +-
>   9 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> index 81857ce6d68d..e7a90a437fff 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn20/dcn20_optc.c
> @@ -502,7 +502,7 @@ void optc2_get_last_used_drr_vtotal(struct timing_generator *optc, uint32_t *ref
>   	REG_GET(OTG_DRR_CONTROL, OTG_V_TOTAL_LAST_USED_BY_DRR, refresh_rate);
>   }
>   
> -static struct timing_generator_funcs dcn20_tg_funcs = {
> +static const struct timing_generator_funcs dcn20_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
> index f2415eebdc09..772a8bfb949c 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn201/dcn201_optc.c
> @@ -129,7 +129,7 @@ static void optc201_get_optc_source(struct timing_generator *optc,
>   	*num_of_src_opp = 1;
>   }
>   
> -static struct timing_generator_funcs dcn201_tg_funcs = {
> +static const struct timing_generator_funcs dcn201_tg_funcs = {
>   		.validate_timing = optc201_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
> index 78b58a449fa4..ee4665aa49e9 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn30/dcn30_optc.c
> @@ -357,7 +357,7 @@ void optc3_tg_init(struct timing_generator *optc)
>   	optc1_clear_optc_underflow(optc);
>   }
>   
> -static struct timing_generator_funcs dcn30_tg_funcs = {
> +static const struct timing_generator_funcs dcn30_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
> index 65e9089b7f31..38f85bc2681a 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn301/dcn301_optc.c
> @@ -109,7 +109,7 @@ void optc301_setup_manual_trigger(struct timing_generator *optc)
>   			OTG_TRIGA_CLEAR, 1);
>   }
>   
> -static struct timing_generator_funcs dcn30_tg_funcs = {
> +static const struct timing_generator_funcs dcn30_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
> index ef536f37b4ed..4f1830ba619f 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn31/dcn31_optc.c
> @@ -315,7 +315,7 @@ void optc31_read_otg_state(struct timing_generator *optc,
>   	s->otg_double_buffer_control = REG_READ(OTG_DOUBLE_BUFFER_CONTROL);
>   }
>   
> -static struct timing_generator_funcs dcn31_tg_funcs = {
> +static const struct timing_generator_funcs dcn31_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
> index 0e603bad0d12..4a2caca37255 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn314/dcn314_optc.c
> @@ -192,7 +192,7 @@ static void optc314_set_h_timing_div_manual_mode(struct timing_generator *optc,
>   }
>   
>   
> -static struct timing_generator_funcs dcn314_tg_funcs = {
> +static const struct timing_generator_funcs dcn314_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
> index 2cdd19ba634b..b2b226bcd871 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn32/dcn32_optc.c
> @@ -297,7 +297,7 @@ static void optc32_set_drr(
>   	optc32_setup_manual_trigger(optc);
>   }
>   
> -static struct timing_generator_funcs dcn32_tg_funcs = {
> +static const struct timing_generator_funcs dcn32_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> index 4cfc6c0fa147..72bff94cb57d 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn35/dcn35_optc.c
> @@ -428,7 +428,7 @@ static void optc35_set_long_vtotal(
>   	}
>   }
>   
> -static struct timing_generator_funcs dcn35_tg_funcs = {
> +static const struct timing_generator_funcs dcn35_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,
> diff --git a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
> index 382ac18e7854..ff79c38287df 100644
> --- a/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
> +++ b/drivers/gpu/drm/amd/display/dc/optc/dcn401/dcn401_optc.c
> @@ -459,7 +459,7 @@ bool optc401_wait_update_lock_status(struct timing_generator *tg, bool locked)
>   	return true;
>   }
>   
> -static struct timing_generator_funcs dcn401_tg_funcs = {
> +static const struct timing_generator_funcs dcn401_tg_funcs = {
>   		.validate_timing = optc1_validate_timing,
>   		.program_timing = optc1_program_timing,
>   		.setup_vertical_interrupt0 = optc1_setup_vertical_interrupt0,

