Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D78B9D5262
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 19:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5586810EA19;
	Thu, 21 Nov 2024 18:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gMv+IlXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2053.outbound.protection.outlook.com [40.107.94.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2030E10EA19
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2024 18:15:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DtHamftMeUmCpfh5WpGw/N2atiasBfaaIvMsUPNfu8mRQN3vntZprluok5jNie44HogsbKML9wAAqnAtaqwiIAoXPS9vtSE7pZQCuBIQ6rWdGX6EnLsNiTC9cnz6U7Lz+JPT5xhzhzvA57AVieLC+m0yHxVUxodKy0Kf3LrYSN7yKdDJHYVN6RuZ+m5ehFKSvQ1lfRtujYIB39YJNkLBIdIRdU7+8Iqbbrp/Hxm09LVolIOd8cAEZy4vkUaLzqGDoegKSWu8KBX72qC9bulkE1m/wyUZCD+SlwaPJfOezbw6motUr9pJSnNuCvUL5Ze394VYi4XM914ACyf5RWP3Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=skIMLLO+wdYX214c5oLWidupAJUMPiecSkro4RnrReM=;
 b=bn/H8CvKDtT7KLzcc6S9veKAiEjj9VbGa7VYz7mwYfn8HaHiHCLftI3pPRJTrrkdrWX/KzKLS4aJyPXECsfcfGhrV1j0ISgiYMFCi8VwpzwUxrTkAVaSQRHTxxcEINW2CzfydZ3qO2M3Lm00X187AL/2tzb6z0cxUImHAG9Ns/FTqITtGwVJRbTLHhRsRcT9cYDHhUzZntUiztPhdqzxyuTQmwiqL4p/X/QANdU2Xa4j/ZWeio2VCbuTw8SxQI2iaJmlmJcTU3jo4nB5BFZmDDoc3D2xrsEFDBG8e0feYOkSZVr+QsPACnNkZa+mz8bMNvqOqvudM16nz1g/WAJWTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=skIMLLO+wdYX214c5oLWidupAJUMPiecSkro4RnrReM=;
 b=gMv+IlXWUFUj6Mx2pzpH/sSM3iPjf5F7s43d4EQMZlxndr3tZlBMP1jloV5iuLvUloXMZpIrx4l+uFeizhZmncJjLN96GuxxdjACQDO+LD4AqIifu1SDRi9Ihi3BXS6NT5Ttn8mLID9M41OzzLx2XXIaB58GaeGy8tbevjM0b40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN6PR12MB8592.namprd12.prod.outlook.com (2603:10b6:208:478::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 18:15:45 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 18:15:44 +0000
Message-ID: <bee4cc61-ea6f-43fa-a752-6a69465e6517@amd.com>
Date: Thu, 21 Nov 2024 12:15:42 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 05/13] acpi/x86: s2idle: add modern standby transition
 function
To: Antheas Kapenekakis <lkml@antheas.dev>, linux-pm@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>, Kyle Gospodnetich <me@kylegospodneti.ch>
References: <20241121172239.119590-1-lkml@antheas.dev>
 <20241121172239.119590-6-lkml@antheas.dev>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20241121172239.119590-6-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7PR04CA0200.namprd04.prod.outlook.com
 (2603:10b6:806:126::25) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN6PR12MB8592:EE_
X-MS-Office365-Filtering-Correlation-Id: 763c7885-cdf5-48e3-059d-08dd0a5883a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UW1rNCs2Z1BJeWIzQzdtN2JYVWJ1NnN1cXBwbEJ4Rzh0Wmx3dkgrVzFvSWFU?=
 =?utf-8?B?dVhaclc0ZURTbWpwcGZkWnFNdGNSaXh6SEk3UGZhWjJRbU45NklLVW5iYlBS?=
 =?utf-8?B?eWgxd0h6NThualloNTVaM3I2eFBlYUZVei8zSERZeWNDV08ydEJ4YUcyN2la?=
 =?utf-8?B?c2haN0xPaUE0eHRuQi9mZkYrZm5uM2QvMUM0Y1NIQkwyY2RwMjVUeFVENmhN?=
 =?utf-8?B?S2RtTEFHUVlTSGdhR29PNWdvOUJYNVIzUkNad29tWWtqTEVqMm1TVmVibHpy?=
 =?utf-8?B?Z1lmaTVKMjlUYlBGUlk1ZG1ndmt1VkZvemUrVGlPMEZXeUZENEx3QVUxY2wz?=
 =?utf-8?B?NGZYdUJjcWFwNVNBaHg1ZVRSRHJ4WkFGMmJUTVVYVEFEd0t0TDZBaTVZYnZ6?=
 =?utf-8?B?K0kvU2JsSGNGUXZPU1RNNjllRUdYb3g1bmZMU1FoV0VBYkNwcHdKV2lmM2ZI?=
 =?utf-8?B?RHBCS0FtSkFOb09ydnc4VVNxM1A4dzdPemVDNW9kdXBwZ010ZHRNVVF3QjJu?=
 =?utf-8?B?T2xMLy9sbVlNeENuNko2SWNqREFRTWtZaXpESnU1d2c2MkNjUEVXZXNYSnR2?=
 =?utf-8?B?M055Z09sZm5SY0pQaytOVmU0c1FGRkpCU0J6aktTUDRSZTBRbFFobENHR01B?=
 =?utf-8?B?TWZxZTVqWWJpblVMd1JSdWNWUFl5YWRmcmk0VjRzMWlvT3ZzTlNZOXYxbVJD?=
 =?utf-8?B?NXZpekR3dVZDUkxiU0Z1VVYzREhHS3lIVG0zZ0NuUWltYTVmZjlCMS80Qkpm?=
 =?utf-8?B?bFdwSHJtTk5jRkhhUlBLNmFsL0JSTndETWNMVGxrd01sMFFqVTVsUjFqUGRG?=
 =?utf-8?B?Vkx5SVZPSDRSMHgvT0JFRGNnbTIrcDBlUGdqRnZvbHRBZ082TEsyaFZWOTlo?=
 =?utf-8?B?V2t5VXlqN2duajR1ODNXOWExWjJPL2ovbkFnYTJTVFhVcE5RUVlCQURIbHd6?=
 =?utf-8?B?a3dvaS9oK043TkxWZDl1czFyZFA4VGZxRjhYTVRMbG9RaitKbTc3Q3JNdW94?=
 =?utf-8?B?cFF5YmRtYjA4cXNLTlVaRHgyZUQ4YVNVSjZKQloyRHUzdVJNUnhsTlRra0lL?=
 =?utf-8?B?SW9UNVRaUm5vZE5OcktJRDhVOXpTeWlVdWE1VkxUNkhOUE10SkJVQ25PUVBC?=
 =?utf-8?B?cjRyc0c5YndwcW5CNWF3ZjFTeFZKOUhsR1RtR0pFM2RaOTN1ZHF0bGR5SU5p?=
 =?utf-8?B?eFpsaVFTL1M1ckNWTHBnbHJQbFN5cHU5ZENHNmVyaTVrZnFUT1YyVEJvZHlk?=
 =?utf-8?B?azduWUtHTCtOaGpXdmR0dXBvTkIwZ3NyUkt6TUo3RWxLZDUxZnZOQWhPdlYy?=
 =?utf-8?B?aUZCdGpnQ2hDN3ZWdzR1VVJZT1ZUajBXWmY1Vm4ycFF0d2xmRUlGUm0zdmZZ?=
 =?utf-8?B?dElKK0RJU1drSmgwZEp1eVMreFYvUmFFU0xpN3NKVnd6UlN0UC9vOUYxUkdV?=
 =?utf-8?B?RXg5d1JUR0NhRTlWaHg1dUxDUlNoVlhOSWVJbUsrQlJyQko0UDBqeklTcFQ0?=
 =?utf-8?B?RXlqeC93bW8rUUlpOGU3bXJZVjlLcW1sRXpWemQ5S3NicDRJSjJrZ1BTSmsw?=
 =?utf-8?B?UU14SGJ1Y2M0cmY3dG9mcEJpMFJrL0VjTk5MRGk5S1ZsVUZja2wzR3p0OEFS?=
 =?utf-8?B?RU5pbFBQZHN2OE9Nc2c5WnZpUlVlbC9lcUpQbHU0RitVOTN5UEphT2NDSUl6?=
 =?utf-8?B?VFFUdFdVRHZUekhPcWhYVVNPUE10Z0xYVDEyYUt4V1MxYldJVnhyNzQ3dm4y?=
 =?utf-8?Q?RPT6IV1eLhfy5keugpTz1xRnnw7nL5LLY4igh04?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEdJVnkxaTBVNnhrcyttMlV5a2RRV0FsU0MxYzlydlN3R1ROUEx1c0JsZnMy?=
 =?utf-8?B?UGYwQXhtemQ1Yy9DdzgvN2FBUlpHdlZaMC9oOU15a2VyTFlnVEdNMldjQi9D?=
 =?utf-8?B?WTR1aTVpTVdjRDNxWU0zQ3R4S0hDWlZ2bVJUd2Q3RC9zREs5VHhEekRneHpa?=
 =?utf-8?B?eWFzajcxcFZRaDg2eUt5L3JWbFBEMjJSQmtHMTdiT0NBZ1IvWkIxbE5wZXZ2?=
 =?utf-8?B?dGNUQ0xHRlhVYTFIUmV0VXhLUW5Yb1pGWFBlOURFQm83M2huOWV3c1BPVFdG?=
 =?utf-8?B?REdqQ0pjblQ3eGR6VkhGRzRJQTJUcThKSTdjNGdBY0ovQzB0UnJzZjZHSnRX?=
 =?utf-8?B?MDZmOTdXKzVkWHpCMEhmb25UY2NyU21iMCtrZ2lTRWZEYktUdEVrM1dXVGpn?=
 =?utf-8?B?UWxMdWVKY3VtUmN1bEhHTmdndWhaZkZQUmV3aHd1Z2ZsMnIrZm1Kb0J4LzNS?=
 =?utf-8?B?di9Ia0JxN05JWkU1em1pM3hmOEJtaTR5dkt0cVNoN0lPbVNRLytHWVBGK2xz?=
 =?utf-8?B?cXltS1FyOE12ZlZ2T09kSUJ3NlB5dUY3dURHOWpMalVNLzE3Y3Nhc01QRVU2?=
 =?utf-8?B?d2xqVlBhemtMSG9sbzUwZUhUaXFSbUpPSVRaazRaU21oenlTa3M5cGF6WG9i?=
 =?utf-8?B?K0dIYW81Z3BKMnMwQjA3OTN4M2xrdHF6aFBoTGMyeW5GTFNSc050VUJwSVpH?=
 =?utf-8?B?VlNMY0tMTUNGQktER2QyWEFGODVMRGhRSW9WTktSY0huN2xuMThDdFlnYS9V?=
 =?utf-8?B?anNYSWJUbnh3bEZKbCttQzR2VUlYUk9GY3BPMmE4WUh3U1pnaGFnNXRvblBt?=
 =?utf-8?B?VlRoTGxlcHZGTjNtNUo0ak5jZTJHOHFBZ2MwdklxQVVSUS9PMTNuMWdscTZp?=
 =?utf-8?B?NXo5VGVKTllqRk9tbUhSa2UzY21HVEQ0VzNDS3dma25xVDVtSElwNnk5YXFL?=
 =?utf-8?B?UkhyWEQyRlJGR0paQ0kyV1AxRUZCNFl6a1U4K0dmemMvQzd2TWVNZUxsK0F1?=
 =?utf-8?B?RGM5eHJ2ZlpKME5tV1dmWGRlVGpEOWdKeGFkTTV6TGhLNHJacWlrZTdCeVJ3?=
 =?utf-8?B?MnVLdlBIb21zNHFmZFF0emMyTnFZRGZDT2w4SEkzTVh5ODFHT2srSmlLWHAz?=
 =?utf-8?B?dTQ5ZHZicUYzY085aFZmdXYwTmlreUdOVkpMRGZYZmZCS2NBNXZZNDV1T2RQ?=
 =?utf-8?B?VFZKbnlmWkVKd2JGR2JCMnlxczJTdjFOYVNLb3lHQmxlcUpUWnRPT3U3Smpa?=
 =?utf-8?B?NXhmcVg4SDVxbEhNaVJFL3NnOHU0eDl1UWMyek5VWS8xZzVYbjlrYXNqdjlu?=
 =?utf-8?B?WVd4MDlUL2w5Q09WcUxOSDZnUEZqcklxSWZzNnBWaUxlMk9RcHNiUVJ3YS96?=
 =?utf-8?B?Q0R0VmRpVHRobXRYNlhmcHpjRVNKVFRDOXkybkx2Skdma3RsOHJEV2xLVW5R?=
 =?utf-8?B?TGJoRjV5bkM5M1ZUYzFMTDFtTlZxOGNkN21ZcGZQdXk2TXgzRlVqZW1tVEE0?=
 =?utf-8?B?VTFaWHh5Z1gvK3dLSlB6OHFMdlNQRm5wS0N1clA4MFhRT0o3eGxRV2M4a2sz?=
 =?utf-8?B?Q2tQYkxvS3VFZU5uaGtvTmI2WEs3alR3QlZTK3FEaFhhYlBkM3ArZ2czYUxw?=
 =?utf-8?B?SHdDM2dySnA3SkpYMEFwRnBVeTlETTc3ZWJiVlAySHBRcmJRNEhZM1RZRHg1?=
 =?utf-8?B?K2FuTzZmaW94ejJ5TkJIY3R6VmF0Yy92aXNpQXFZK2tBcWlKTCtaYlVySG0x?=
 =?utf-8?B?SFFHeVc2UVRweTVmZXI0ODhKVXRKWXh4Zy8vTzcyQm9ISFgyMUdjVmpYNUo5?=
 =?utf-8?B?QjJ1ZFVCczEyRzZtTy85eVBLZkFrcis5UzQrSkhUWjBhTHlqb3REWTc1cVZY?=
 =?utf-8?B?RitpYTIrdVB6RTJmemd1SjgweWYrN3FaMjVVd1BoRzlzSFJqUXVGa09mV1JP?=
 =?utf-8?B?WmxhL2FCL3FoS3luYllOcWU2Y1VoMys0T3lRZlhvcWlKUVNQZU4yZzZKWWlZ?=
 =?utf-8?B?NVdEWVpDWXJBN3lPenh1aUJsdmxnMkNnNHlTbWhWQnUrTExzajVnWVQvMHp5?=
 =?utf-8?B?a0xKeE9UUWJuRHNiaXk1b2hNQUpMdEluZ3Y2bFAwQ21zeFpyZjRZU2dZYWVj?=
 =?utf-8?Q?9zT2OdbsVVyQCQpnbd+BI86Pn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763c7885-cdf5-48e3-059d-08dd0a5883a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 18:15:44.0006 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UaZjHE6l4N7Fs/1rSN2GKSAT6fqGHVI/PSBUG6/U1sGoj7JCbEfVd3CqhC5UcR6OBq58ZqPzqI/rj1NkVjswCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8592
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

On 11/21/2024 11:22, Antheas Kapenekakis wrote:
> Add a new function to transition modern standby states and call it
> as part of the suspend sequence to make sure it begins under the
> Modern Standby "Sleep" state.
 > > Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>   include/linux/suspend.h |  11 ++++
>   kernel/power/power.h    |   1 +
>   kernel/power/suspend.c  | 127 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 139 insertions(+)
> 
> diff --git a/include/linux/suspend.h b/include/linux/suspend.h
> index 01ee64321cda..b8fe781d8026 100644
> --- a/include/linux/suspend.h
> +++ b/include/linux/suspend.h
> @@ -40,6 +40,15 @@ typedef int __bitwise suspend_state_t;
>   #define PM_SUSPEND_MIN		PM_SUSPEND_TO_IDLE
>   #define PM_SUSPEND_MAX		((__force suspend_state_t) 4)
>   
> +typedef int __bitwise standby_state_t;

As this is series is working on emulating semantics of "Modern Standby" 
on Windows, why not name it all "modern_standby"?

IE

modern_standby_state_t
PM_MODERN_STANDBY_ACTIVE
PM_MODERN_STANDBY_SCREEN_OFF

> +
> +#define PM_STANDBY_ACTIVE		((__force standby_state_t) 0)
> +#define PM_STANDBY_SCREEN_OFF	((__force standby_state_t) 1)
> +#define PM_STANDBY_SLEEP		((__force standby_state_t) 2)
> +#define PM_STANDBY_RESUME		((__force standby_state_t) 3)
> +#define PM_STANDBY_MIN			PM_STANDBY_ACTIVE
> +#define PM_STANDBY_MAX			((__force standby_state_t) 4)
> +
>   /**
>    * struct platform_suspend_ops - Callbacks for managing platform dependent
>    *	system sleep states.
> @@ -281,6 +290,8 @@ extern void arch_suspend_enable_irqs(void);
>   
>   extern int pm_suspend(suspend_state_t state);
>   extern bool sync_on_suspend_enabled;
> +extern int pm_standby_transition(standby_state_t state);
> +extern int pm_standby_state(void);
>   #else /* !CONFIG_SUSPEND */
>   #define suspend_valid_only_mem	NULL
>   
> diff --git a/kernel/power/power.h b/kernel/power/power.h
> index de0e6b1077f2..4ee067cd0d4d 100644
> --- a/kernel/power/power.h
> +++ b/kernel/power/power.h
> @@ -207,6 +207,7 @@ extern void swsusp_show_speed(ktime_t, ktime_t, unsigned int, char *);
>   extern const char * const pm_labels[];
>   extern const char *pm_states[];
>   extern const char *mem_sleep_states[];
> +extern const char *standby_states[];
>   
>   extern int suspend_devices_and_enter(suspend_state_t state);
>   #else /* !CONFIG_SUSPEND */
> diff --git a/kernel/power/suspend.c b/kernel/power/suspend.c
> index a42e8514ee7a..1865db71a0c2 100644
> --- a/kernel/power/suspend.c
> +++ b/kernel/power/suspend.c
> @@ -45,12 +45,21 @@ static const char * const mem_sleep_labels[] = {
>   	[PM_SUSPEND_MEM] = "deep",
>   };
>   const char *mem_sleep_states[PM_SUSPEND_MAX];
> +static const char * const standby_labels[] = {
> +	[PM_STANDBY_ACTIVE] = "active",
> +	[PM_STANDBY_SCREEN_OFF] = "screen_off",
> +	[PM_STANDBY_SLEEP] = "sleep",
> +	[PM_STANDBY_RESUME] = "resume",
> +};
> +const char *standby_states[PM_STANDBY_MAX];
>   
>   suspend_state_t mem_sleep_current = PM_SUSPEND_TO_IDLE;
>   suspend_state_t mem_sleep_default = PM_SUSPEND_MAX;
>   suspend_state_t pm_suspend_target_state;
>   EXPORT_SYMBOL_GPL(pm_suspend_target_state);
>   
> +standby_state_t standby_current = PM_STANDBY_ACTIVE;
> +
>   unsigned int pm_suspend_global_flags;
>   EXPORT_SYMBOL_GPL(pm_suspend_global_flags);
>   
> @@ -188,6 +197,16 @@ void __init pm_states_init(void)
>   	 * initialize mem_sleep_states[] accordingly here.
>   	 */
>   	mem_sleep_states[PM_SUSPEND_TO_IDLE] = mem_sleep_labels[PM_SUSPEND_TO_IDLE];
> +	/* All systems support the "active" state. */
> +	standby_states[PM_STANDBY_ACTIVE] = standby_labels[PM_STANDBY_ACTIVE];
> +	/*
> +	 * Not all systems support these states, where they will have increased
> +	 * power consumption. If deemed necessary, they should be gated to not
> +	 * mislead userspace.
> +	 */
> +	standby_states[PM_STANDBY_SCREEN_OFF] = standby_labels[PM_STANDBY_SCREEN_OFF];
> +	standby_states[PM_STANDBY_SLEEP] = standby_labels[PM_STANDBY_SLEEP];
> +	standby_states[PM_STANDBY_RESUME] = standby_labels[PM_STANDBY_RESUME];

Shouldn't these states only be enabled when LPS0 support was found?  IE 
shouldn't they be enabled by acpi_register_lps0_dev() and disabled by 
acpi_unregister_lps0_dev()

>   }
>   
>   static int __init mem_sleep_default_setup(char *str)
> @@ -354,6 +373,108 @@ static bool platform_suspend_again(suspend_state_t state)
>   		suspend_ops->suspend_again() : false;
>   }
>   
> +static int platform_standby_transition_internal(standby_state_t state)
> +{
> +	int error;
> +
> +	if (state == standby_current)
> +		return 0;
> +	if (state > PM_STANDBY_MAX)
> +		return -EINVAL;
> +
> +	pm_pr_dbg("Transitioning from standby state %s to %s\n",
> +		  standby_states[standby_current], standby_states[state]);
> +
> +	/* Resume can only be entered if we are on the sleep state. */
> +	if (state == PM_STANDBY_RESUME) {
> +		if (standby_current != PM_STANDBY_SLEEP)
> +			return -EINVAL;
> +		standby_current = PM_STANDBY_RESUME;
> +		return platform_standby_turn_on_display();
> +	}
> +
> +	/*
> +	 * The system should not be able to re-enter Sleep from resume as it
> +	 * is undefined behavior. As part of setting the state to "Resume",
> +	 * were promised a transition to "Screen Off" or "Active".
> +	 */
> +	if (standby_current == PM_STANDBY_RESUME && state == PM_STANDBY_SLEEP)
> +		return -EINVAL;
> +
> +	/* Resume is the Sleep state logic-wise. */
> +	if (standby_current == PM_STANDBY_RESUME)
> +		standby_current = PM_STANDBY_SLEEP;
> +
> +	if (standby_current < state) {
> +		for (; standby_current < state; standby_current++) {
> +			switch (standby_current + 1) {
> +			case PM_STANDBY_SCREEN_OFF:
> +				error = platform_standby_display_off();
> +				break;
> +			case PM_STANDBY_SLEEP:
> +				error = platform_standby_sleep_entry();
> +				break;
> +			}
> +
> +			if (error)
> +				return error;
> +		}
> +	} else if (standby_current > state) {
> +		for (; standby_current > state; standby_current--) {
> +			switch (standby_current) {
> +			case PM_STANDBY_SLEEP:
> +				error = platform_standby_sleep_exit();
> +				break;
> +			case PM_STANDBY_SCREEN_OFF:
> +				error = platform_standby_display_on();
> +				break;
> +			}
> +
> +			if (error)
> +				return error;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * pm_standby_transition - Transition between Modern Standby states
> + *
> + * Fires the appropriate firmware notifications to transition to the requested
> + * state. Returns an error if the transition fails. The function does not
> + * rollback. It is up to userspace to handle the error and re-transition when
> + * appropriate.
> + */
> +int pm_standby_transition(standby_state_t state)
> +{
> +	unsigned int sleep_flags;
> +	int error;
> +
> +	sleep_flags = lock_system_sleep();
> +	error = platform_standby_transition_internal(state);
> +	unlock_system_sleep(sleep_flags);
> +
> +	return error;
> +}
> +EXPORT_SYMBOL_GPL(pm_standby_transition);
> +
> +/**
> + * pm_standby_state - Returns the current standby state
> + */
> +int pm_standby_state(void)
> +{
> +	unsigned int sleep_flags;
> +	int state;
> +
> +	sleep_flags = lock_system_sleep();
> +	state = standby_current;
> +	unlock_system_sleep(sleep_flags);
> +
> +	return state;
> +}
> +EXPORT_SYMBOL_GPL(pm_standby_state);
> +
>   #ifdef CONFIG_PM_DEBUG
>   static unsigned int pm_test_delay = 5;
>   module_param(pm_test_delay, uint, 0644);
> @@ -586,6 +707,7 @@ static void suspend_finish(void)
>   static int enter_state(suspend_state_t state)
>   {
>   	int error;
> +	standby_state_t standby_prior;
>   
>   	trace_suspend_resume(TPS("suspend_enter"), state, true);
>   	if (state == PM_SUSPEND_TO_IDLE) {
> @@ -601,6 +723,9 @@ static int enter_state(suspend_state_t state)
>   	if (!mutex_trylock(&system_transition_mutex))
>   		return -EBUSY;
>   
> +	standby_prior = standby_current;
> +	platform_standby_transition_internal(PM_STANDBY_SLEEP);
> +
>   	if (state == PM_SUSPEND_TO_IDLE)
>   		s2idle_begin();
>   
> @@ -630,6 +755,8 @@ static int enter_state(suspend_state_t state)
>   	pm_pr_dbg("Finishing wakeup.\n");
>   	suspend_finish();
>    Unlock:
> +	platform_standby_transition_internal(standby_prior);
> +
>   	mutex_unlock(&system_transition_mutex);
>   	return error;
>   }

