Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F679A02603
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 13:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FE510E66B;
	Mon,  6 Jan 2025 12:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uJ5/iCvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061.outbound.protection.outlook.com [40.107.223.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B8910E667;
 Mon,  6 Jan 2025 12:52:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EK1lNOGf/mnEORH83hhMWiJ1BqDbjPdaeiz2GaVOu+fMmtUkdDxAmZ1U4/gzUqNv66KhBLutzpWORJS9Q9H3TtAQ7FUkXCPOh8ZDJOmpqn7dFXKZSUyspZNKr0CBaGm8HmVWx8znGZY3corXsBF0YrfNB1TKJEkHH0wPlrXktVenHi1vsgj350X43VG/0R1uAK+LiTcj62zSHfBq1DzhhMZgyMaA3qnobhAPYTR1YZjwbLQF6FpFT3tCCsw/zwAKjO/DzE/CZroDniD/yTz3xoD8HO3XsLNYVnNSfhy0oFFfsLuHciFXcU4rZXt8ViWdgLa1nGt7UbEpEBDwVfAvmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ALJ4fdRj/W+CIt0MB+kQTjY/0mBYX6tze0JpQUYYwo=;
 b=oCIQmYlyO9FtGr9NGEGRLpzpImAxAC7im5RFUOqoC06U0PDCI+R2IAXpB+ynUTAAV6QNrRWJiXRHVvhd47raqx241AL4dXZQQ3tfS7+yyuu16CYXnMHJ47tR/uzNv2lbHuSxyNA3lIjzYr6XaGWquDYEb0GRh2fNY5LNHnqLKHobl5WXuhJOWWvkbs38Zq/C7k/h9Tvt6hUbP8ntiHJFFo+mNhy42UgasJhNmEKHYfEsuv+a15Rr0tT99vZXq6NGFQtnxRbYcv9N/3BXLwYYiu/FnqmyAHv36QtnwI7SOM6Eq1tJgdb4ZMHKChzIAGp3rzIFm0KrBpRF7XvK9IiMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ALJ4fdRj/W+CIt0MB+kQTjY/0mBYX6tze0JpQUYYwo=;
 b=uJ5/iCvcJ7uM109cOyhpgoHQYL84wYhqG+YXph8VCOqYS27CHsskI63B+skXOcxirorbnP8FnOgJpyZmDuj7H7R3x40QcO1Kptp2+EdmYKyU/ss+RqEb7X7qvdaY4iHz05yHLpVkzbhE5J8nhFPDP52cSQlaRWuU+Rmj9xoSZZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Mon, 6 Jan
 2025 12:37:18 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%7]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 12:37:17 +0000
Message-ID: <1d22b16a-8d8c-433d-a916-d6bec849f9f8@amd.com>
Date: Mon, 6 Jan 2025 18:07:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/buddy: Add a testcase to verify the multiroot
 fini
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 "Lin . Cao" <lincao12@amd.com>
References: <20241226070116.309290-1-Arunpravin.PaneerSelvam@amd.com>
 <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <20241226070116.309290-2-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0141.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::21) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|SA1PR12MB6870:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bbb0f9c-32e8-4ba4-b6b4-08dd2e4edb15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZjRUN3dScjhpelBoeVdzbHZ6M2dPVXdQclE1c080Snk0VS9xd1ZJZlRoOE0z?=
 =?utf-8?B?bStrWERUczZZTldBUWI5MTBsbkRoREpCMEhCSk1rTURvWXdldFU4YldOZnk2?=
 =?utf-8?B?N1VOYVRQcXZCSjJtN3plNEd0RTQ3c21ZdHVrTjJxQ3dCL0QvNzNOU296MzB1?=
 =?utf-8?B?dmNyWm9ENDdvOFg1Zk9tS2xzYnBSV085a3FRcGdkVnpjVU1GWWJESVZXV2oy?=
 =?utf-8?B?TlZBRlNpY1RtcXQrYmtCaE1SMDJlUWhtTnp5K2krdTVUcmZaTnJpdEZXNHMv?=
 =?utf-8?B?NW0wR1dleXdiTzJMZURLWVlEQUltNUhKRzVsVHczNVU1eXNFa0ZwbjZXdXJG?=
 =?utf-8?B?TGhCYjNKNDNTU2h4R2djZjdCcnhjK00xclltVDdtVlNWQ0xZMlNwZlFlL0Fr?=
 =?utf-8?B?Yy9GRUhiNW80MkUzdEN4TmZxYUFjbjRTU3FUa1hOUXdCVjIvS1RoV08xeFk1?=
 =?utf-8?B?YW5xT0JUdUVkODJtYTBzczdlVzNtTUNGdmhFNytDMVRTM1pidzBIZkNvN2x6?=
 =?utf-8?B?MWdNQ1hsS0lkeVF4cC8wNHdieGxwQ09jRjJVSDBiK3JUS29jZHBIV0VaeFAy?=
 =?utf-8?B?TUpFaHUrNTZaMW12QXJNZUVJWmdueVdGbDh4czdsUnVFRUM3Z2lwOTZnV0lt?=
 =?utf-8?B?MWJIeVVnVll3WmtFYXRXdFIzbVJtREh6TWJ0Y0xiVThDb1pWWkpxa1pvcFI2?=
 =?utf-8?B?a3I1WTlMdHBENXNXYlhLNGRZckRZM1lIUG5LV2NLRVpxQlJCVXpwemtPL1hD?=
 =?utf-8?B?WlFQY0dMclNpSGVFeThaQ1pTWG1NRExlUjVBaUpUL1RmNkM4ZjlaSVJQQmpC?=
 =?utf-8?B?Tk9GNm1YcnVKVVVoZW8rZGxJaVJreUJieTR5YkdXM21pYzlKblhJbTNFSjRP?=
 =?utf-8?B?clprUnRydlA0Umt5WHl6YlpiZG9nRHU4TmhmcUJnWGZMMzBpNForNUl4aSs0?=
 =?utf-8?B?KzRIWTE5NTM3WElTYnlzUjBtckMyR2RqbjdTNEQ3MlZEQ3lrOXpscitpdnlS?=
 =?utf-8?B?TGE2eDdVUmJpc3NKbmpOa0trSGZ3blZKVDdKZFB4WEh0N1BsbE1LU29RVCtM?=
 =?utf-8?B?dUFXWE52a1l3Z0VNQkRNamxESWpIVUduK0tnMUlOWlNtN2NPMDhPc1RobWIw?=
 =?utf-8?B?akgzOEFnWGgrbDlJaHlqZmNtbDZycllqWU11T0FWMXBoeStmM2Z6a3AvcFMv?=
 =?utf-8?B?Tkt1a29FaFpPWG9IaEVQV09kcUtMY2l0VGI1MFgzMmtvNDJYZFVFMFBOQ1Vk?=
 =?utf-8?B?VXVwQUc1T0Y5TUNRc1UvN1NkWkVsc0YyZC9vaE1iR0NMMXU4OUhTMzNvcUto?=
 =?utf-8?B?R0w1ODd3SHFlaU9wNzR5UWxJdlVGcUt4U0NWQVdrTjBITFRwbWw3Ny9PdjEz?=
 =?utf-8?B?eGdaU0QwOG0rVkhidktoT3p5SXBUdURoN25BdkMrL2ZldjA0R0Zsb2pkcHJG?=
 =?utf-8?B?ZUpzNkJCNkErUDB2d1YyZDhOcEMxUEgxYVJzQTFJamF5VWQwc1BpWHNBdWVj?=
 =?utf-8?B?VGJHMVo4US9QTlpHa2MvY2FSeEZwZ0RwaGdubE9Dd0dmZWtrUnNidXZ0K3k5?=
 =?utf-8?B?ZCsvRmU0clErU1VzVDdUdUNKTFcxVlBVdUVWZHdLSjhNVEQ5aGk1eVp4Vldr?=
 =?utf-8?B?Q25jZVp2WUpBSkk2WGFwOUl5dVRuMGtZSzhZNitMMXdVRWhUUlExR2ZTMzdi?=
 =?utf-8?B?clhHdldEaXFHZ2xWYUEvaHlFWkgrODd5dnRMWEtCZEtmZ3lTd25ibUp0TnEr?=
 =?utf-8?B?R2loK24wcGQzcm04NldlZC9kZmwzRXNtZENkbjZJSXFYOWxlaUhLUS9vMFlt?=
 =?utf-8?B?WXBhY0h3WnRPb3hWTTV6aGZ0SEpnZmFqdUZOWTdqc21YdUFQanh5a1VhOTh0?=
 =?utf-8?Q?DRYSVFK7Fslvd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cCtzUElDVW52M0xObE9HUzdseHRaV2Ewd2NvWWRBemxvREs0RmpRdTFBbXlL?=
 =?utf-8?B?NnpLeFhOakZHeXZNM29rcXV6djNRVTN4cjlXbzVxYitWSkRLZnU4Y3dEa1J3?=
 =?utf-8?B?bzNrcnhrMVZ4S1g0Q3FuNit4U1JVZDJid1dWVGpRQ2d6ZVo4UHdvZllaaHV2?=
 =?utf-8?B?ZVp4b0RKZ2libXEvYTlYLzNFYUpzR3k3WGpUemo2ODNCT09FMWtQNWlGSXR0?=
 =?utf-8?B?ajF5YU5nSWVGajRNeUJweTBycDBkWGc3aGFWNG1LRXJwWUlsekVjTGdpMmZS?=
 =?utf-8?B?VkVkMmNvdXBjdkEzM0laSTAvVnFFb2ZKWWVzWkxHdGZnTHRzMmNLcjZqWHFX?=
 =?utf-8?B?SGRFYVgvTnh6MG1wZXA3ZTRYWlhhRzlSVHVZRXBSQW42cUhEMElQUVFLbGkx?=
 =?utf-8?B?aVlVMnc1dnF0d1l6NjljbVlyVnNyejYvSGpxL0k2ZitzRE5zT2tWNHRVcW1l?=
 =?utf-8?B?NERLR2xFcGJXcVoyOVFmVm9nNjEzOFR6SzRaUU1hYTRYSEl0VUVuOHRVVWV2?=
 =?utf-8?B?ME54cW1pZ0hYc2lKQmkxNFIvbk1aQk8vYjFsZjdWaWI2VFk2aWZFNDVVends?=
 =?utf-8?B?eG9VaVJYb2ZUZWdHclQ1N1VpbG00RzRHTm92OWJ0OXA5YjFRYkVTdEhHckRu?=
 =?utf-8?B?WWxrS29PcHRaaVJKc28xOHRFLzE3Mk1RSFdxT21SdjFDbit2Rk82WVR2Rjdk?=
 =?utf-8?B?M2VjSWtXZ2p6YjQ2ZzBDMkxyYjlKQmVVamQ0eVZMRXoyY1VnT3BSWGRnSkdG?=
 =?utf-8?B?OUNDdmEzME9WeXJCTCttY1M2WExPK2NKM09ZSUhuRVZrK1RnRFV2RjlJZnZW?=
 =?utf-8?B?a0Z3L1hDY2tjdGx4bUJ4TEp1dUwvUHBLbnhiTjhBU2hUd2JiWFltRVRrWEcw?=
 =?utf-8?B?NWtQaThOME9hNDJMZS9PN00zTzdSL1ptVU9NbFNsYUxJTXVVQTJhVlB1RFF3?=
 =?utf-8?B?K0ZlK3hub3o3bU5FWHZ4aGxOTEVCZjZ1V0VzL0VVcHJpbGRiWWE2T0VDMmds?=
 =?utf-8?B?bWJ5ZDg4RnRCaXl1SzRSaXk4TUkxUzhyVnZJamtHV2pMT3ZXNFVmdVhQODI0?=
 =?utf-8?B?Zk8vcDVIL1FCT1RJbFVNYkpjNmliUm5IL2pxMHV3eEFEQ2UwNUZWWDJ5d0Vm?=
 =?utf-8?B?V0xXMWJ6UnpCZWxFd2ZVaytPaXc3UUFNQWpsV0ZyVDgwRFBXMjZENU5VVTFW?=
 =?utf-8?B?cVdFRFFGOVNtNmVvdkU0L1JQTjE1dWtKZ1p0NjFDUDdOd0pDTXBKU0RkM3l6?=
 =?utf-8?B?VnBKUUdUR3pOcWkvR01uRG9oOCtsdE9oNnpCUmltbDA1aGJ6K00yYTJ5Ykhw?=
 =?utf-8?B?RlhwUmluYitNVkxjdngvQkI3Tzh0RDdxaVhqY2hRZmdlRkQrMXhqS0Y2dDN2?=
 =?utf-8?B?bndoWWJ4MCt4blUwQ2t0VCtjSGVFNDJNSGxtNTVWOVdXcFBTd1FMVFpHTExJ?=
 =?utf-8?B?YWpEVFZRQmlJeU9sbkN2ZThreUpyOTlielZHTXQwdGQ3TEhTelpPajVnZWE5?=
 =?utf-8?B?QnJaT1F5K2RaZGxHY0N1eFRuc3BHbTBTNnU3MTFoWk5KN2MxMjk2RjlEUHVV?=
 =?utf-8?B?czlmb0hPdFZRNDBxWU80UkFqeSt6QWZMQ0doeFpLazd3Ty9WS3MybTRycUls?=
 =?utf-8?B?RDR4TjV4eHI1Vyt6Tk9WNFlMOW5QOVQyNlIvNG9leC91WjAxNjg3dWFTSFdk?=
 =?utf-8?B?NXdnT1c0dUo0RkVHMmFZN1Y2OVoyS3V5NjNQWElxalBoak1QQzQ5MVViUkRE?=
 =?utf-8?B?NmdlWGJXcEtJQStjVWo3ZFJVVlNYN1dVVjFZRDJxejhzcTlaMmtGT0NYSVhS?=
 =?utf-8?B?VEFKMXp2QXRuMnVZTkljWnZKRUhGVm9ONFJ5UGR6WjVhMWZWNjAySG4vcnFQ?=
 =?utf-8?B?ejA1REVUa2hiZm1jbnZpZW80SUhaY2k4T1RDY01xZEFoNWZnRWptMmNlTlNx?=
 =?utf-8?B?RjdXN1pmVWRSRGdOU3JGQVdQeGtOQW9SY05jc1R4bUp3alB5N1FkMEtJbFZ4?=
 =?utf-8?B?cXNjZHhtcjFsUjdZT2FmamFjZHNvckhqTHJ5UnJVcEVyTHB6SCttMDNhUm1J?=
 =?utf-8?B?WjRRNmkwZGhjR1JGNnNDYXpFZThzeE5CU0NQby9QVDRnZERYWWpsRUk1T21h?=
 =?utf-8?Q?R1OM6XywD10eNk3hukrrdMbox?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbb0f9c-32e8-4ba4-b6b4-08dd2e4edb15
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 12:37:17.7961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u6igtAih7sHwyyMcQlxs3UtoGpc1VQBGhPeSo+XAh0DHkkVg8QHabFFZIY3ZZ+4EgV2nDP9YuD9OpAvNNxocOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6870
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

Hi Matthew,

Ping?

Regards,
Arun.

On 12/26/2024 12:31 PM, Arunpravin Paneer Selvam wrote:
> - Added a testcase to verify the multiroot force merge fini.
> - Added a new field in_use to track the mm freed status.
>
> v2:(Matthew)
>    - Add kunit_fail_current_test() when WARN_ON is true.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Signed-off-by: Lin.Cao <lincao12@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c            |  6 +++++-
>   drivers/gpu/drm/tests/drm_buddy_test.c | 29 ++++++++++++++++++--------
>   2 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index ca42e6081d27..241c855f891f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -3,6 +3,8 @@
>    * Copyright © 2021 Intel Corporation
>    */
>   
> +#include <kunit/test-bug.h>
> +
>   #include <linux/kmemleak.h>
>   #include <linux/module.h>
>   #include <linux/sizes.h>
> @@ -335,7 +337,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>   		start = drm_buddy_block_offset(mm->roots[i]);
>   		__force_merge(mm, start, start + size, order);
>   
> -		WARN_ON(!drm_buddy_block_is_free(mm->roots[i]));
> +		if (WARN_ON(!drm_buddy_block_is_free(mm->roots[i])))
> +			kunit_fail_current_test("buddy_fini() root");
> +
>   		drm_block_free(mm, mm->roots[i]);
>   
>   		root_size = mm->chunk_size << order;
> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
> index 9662c949d0e3..4b5818f9f2a9 100644
> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
> @@ -385,17 +385,28 @@ static void drm_test_buddy_alloc_clear(struct kunit *test)
>   	drm_buddy_fini(&mm);
>   
>   	/*
> -	 * Create a new mm with a non power-of-two size. Allocate a random size, free as
> -	 * cleared and then call fini. This will ensure the multi-root force merge during
> -	 * fini.
> +	 * Create a new mm with a non power-of-two size. Allocate a random size from each
> +	 * root, free as cleared and then call fini. This will ensure the multi-root
> +	 * force merge during fini.
>   	 */
> -	mm_size = 12 * SZ_4K;
> -	size = max(round_up(prandom_u32_state(&prng) % mm_size, ps), ps);
> +	mm_size = (SZ_4K << max_order) + (SZ_4K << (max_order - 2));
> +
>   	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
> -	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, mm_size,
> -							    size, ps, &allocated,
> -							    DRM_BUDDY_TOPDOWN_ALLOCATION),
> -				"buddy_alloc hit an error size=%u\n", size);
> +	KUNIT_EXPECT_EQ(test, mm.max_order, max_order);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
> +							    4 * ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 4 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, SZ_4K << max_order,
> +							    2 * ps, ps, &allocated,
> +							    DRM_BUDDY_CLEAR_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", 2 * ps);
> +	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
> +	KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, SZ_4K << max_order, mm_size,
> +							    ps, ps, &allocated,
> +							    DRM_BUDDY_RANGE_ALLOCATION),
> +				"buddy_alloc hit an error size=%lu\n", ps);
>   	drm_buddy_free_list(&mm, &allocated, DRM_BUDDY_CLEARED);
>   	drm_buddy_fini(&mm);
>   }

