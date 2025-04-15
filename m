Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66940A89976
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 12:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4DD10E6F3;
	Tue, 15 Apr 2025 10:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Btw3uUip";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1711C10E6F3;
 Tue, 15 Apr 2025 10:07:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPGXbEBU+OpmjgN5qSakZXulvHhhSm3TEApQmJo6hfbgahUuImF2QI0+RbCz/d2vw1O8IuSt8tKh84686EIrLhb6+D1vB+niHUEJbl9tCbND1/fhCOrS/HkaD86nXGbM2//yQlxWBAbJFAwyleNqcMa2hltkH/p+PayEJYc3YKrcCZAs0CssaBLU34SOUftcTZz74Sz8AOyua48MOjcdD8uEw+CGdczTfKi0wFGYLuTkvvRBozIDRUEhwccxTU9/w/lHnKwmm7XaY4XFr4+gg0On5B/KfY5ck0pwR1+isLfXh6Y5PqGBLU8GMOM7Ytf6Kq7yUDNgtzHwJMwLPAPu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F0f7BD1rXGdnsJf7b9dayGBLbrpSZm2mOt+BBd8US+A=;
 b=EW3mVux7Cm+wpGv4l8Lx33GNsVHNepYFNB8JfHPwy465XmRRqM28TvTgiNIv1Mt7ncBPg3bUpYxzB2E+dhnBnJUl4f3TE2TDamMFh9MJQREqO3OeTP/cyWlWqsRIY+j8tFbD7otG/5/3IDq66JccyMzgpwrtIUEChauTYxtywul4X9L7YZHySF6aWTK8Iw1R9IARpHc6DkY18Ly0PW5+9gqYGWjdN+hO6FCUq0k/UpHUVvXh3U3WIFLpeJqT0uVhQXhWPdjdp5lC9Fb4Qq+wWdzD3ePThzxkph9EVE9Y/EYaX3YUUIhmlDInIYi7WlXVoLhelNFnWuAHAS+1/Gyg6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F0f7BD1rXGdnsJf7b9dayGBLbrpSZm2mOt+BBd8US+A=;
 b=Btw3uUipPIWio1Ay8N0NLiUO4zHKrGzobaO0rDnYtz3byyJbouWNo7VTiEQ4G1Bk21Du7ThwLYVIzaASjoeM1gn9e/qMNK/YXmqNYQ4c6SIEjpIax2DP6sZmE7Mb3qcOlC/gk29XkH/Q7x8SED7tPbT/0cIz6xUNTK+HgRdoI5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from LV2PR12MB5776.namprd12.prod.outlook.com (2603:10b6:408:178::10)
 by BL1PR12MB5946.namprd12.prod.outlook.com (2603:10b6:208:399::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.35; Tue, 15 Apr
 2025 10:07:28 +0000
Received: from LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec]) by LV2PR12MB5776.namprd12.prod.outlook.com
 ([fe80::6628:31a5:4bbe:ffec%3]) with mapi id 15.20.8632.035; Tue, 15 Apr 2025
 10:07:28 +0000
Message-ID: <b2a38118-ae71-4f3c-9506-3294dca81523@amd.com>
Date: Tue, 15 Apr 2025 15:37:14 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] drm: function to get process name and pid
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org,
 "Pelloux-prayer, Pierre-eric" <Pierre-eric.Pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250411130428.4104957-1-sunil.khatri@amd.com>
 <c2ef0925-14ad-4eff-9972-53406ec01f0a@gmail.com>
 <7b3fe17a-3446-462d-8614-c31a1d47a67f@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <7b3fe17a-3446-462d-8614-c31a1d47a67f@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:97::23) To DM4PR12MB5771.namprd12.prod.outlook.com
 (2603:10b6:8:62::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5776:EE_|BL1PR12MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: d8d88178-d25f-4ff6-ceed-08dd7c055385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rkp3R2R5ay9ST2gvZ2JrS1JJd1RqQndXM1pDb0lKVWhTbkxMRlovemtYelAw?=
 =?utf-8?B?M0FNMW1qbEh1azF5Zy9lUTMxS3Y4M2NrdHREalJiTzMxU25lQThHNVFwQWtF?=
 =?utf-8?B?R29tc1FZdEVBT3hyc0xhL1Q2MnpPNEpSSCtqaE9JeG1LcUltODFjNHJscmls?=
 =?utf-8?B?N2Nya1N5SlltRkdEZ2ovODEwRUdWejRsZXBVOE1GaXhwZUFxRlJveURMc3R5?=
 =?utf-8?B?VGF5VmFocDdzTmhHcHdSeit0TCs5OUdMR3dXTGE3UDBReXAxSENtcnlHTDBO?=
 =?utf-8?B?cHVZb1kwVEdjY3pxQXhMZDR0dGVFQk9QRjNqSWxCVWdQTWZodC9LcktVdldZ?=
 =?utf-8?B?NVlPd2pQaDFSNHlrQjh3c2wzbmtrNlBycHBRS1Y2WXlJdWRiTlJoc0NXdDUx?=
 =?utf-8?B?U1ZzWTNrendBV2hPdHNDdlQvN2hLV2tPQm9aVFI3QTk4SFYrZGNsVFpQVnlq?=
 =?utf-8?B?VnlXWHJqeWpQeVkvVGV0bUozTHpqYm45L0YyUHlsZFdxK0dUUkpSemgwQ09r?=
 =?utf-8?B?WTVDemY1WlhJMjVVb0ROTW5wdmo5WjcxQW4rLzJtcU84VUx5dHZIQkZxbThn?=
 =?utf-8?B?MzZIWE01Qk84a2VBWHlxWTN4NWhmZWl0dkRrTXZaVVYyT2tBd0hISC9mU1dj?=
 =?utf-8?B?VkpsTVAxUTU3RmpnZFZvTVRjcGtIU3k4MG04M3dYUi9VNW00YTkxWFpQOFVa?=
 =?utf-8?B?L1JLK1g0Y2VuNnNiamVYYk1ySlNWd2hPSzZla2ZDNTF6YW9xblNLNnVRUUZD?=
 =?utf-8?B?VG1ReXBrcDBUUythOTBkMnN6emQxamNhejRaSWx0V3oyd2Qzd2k4Tk9WSGps?=
 =?utf-8?B?ZDRPRzdmUjhVYXFxRnN0c1VveEpybjBrd09HQWJBdVR3R04rc1VlTXo0Z1NW?=
 =?utf-8?B?OUl1MVF5bktSTmtya3pIc1l2cFB3OVRHUC9BQVh5aDdTalpUYmZta0V6R0FV?=
 =?utf-8?B?R2xKL0h4SExzRENrbGg0bWdaUHcrM2QzK2hrZVo2Zm4rWkhBekt1blpBRXBJ?=
 =?utf-8?B?d1NwTGt6RTdOVHhlaXlVaVNndWdKTEU1RERFTkUzM09VZmRwL2xMakJIMVRv?=
 =?utf-8?B?WnpweG96UzV6SlVBVFQzdHhzODZjNWZNbVFWdFdJSlcxZTBNWGlYUzZXUG94?=
 =?utf-8?B?NmFRcUFZaW5qbXlieDd2TFQ1YjlpNzYrNUJ3UWI0WmtoeGg2eWZSWXJtWVNl?=
 =?utf-8?B?RE1jelp4RzdFWHV5cmw0eDFudHFMRXd5Z2xNTTVIRnFrblU3UitqRG5aVE9H?=
 =?utf-8?B?VTNGNko1QVdUM21KeG80MWFkUFAySzVEb0Q3L1hsVHpNVkxyMHdXT3pPVUlU?=
 =?utf-8?B?UnJ3OEV4MC9vVSs5b3lmdE5uR1FUL3AydG4wcWpuc0N3anJXSXJrTDBSSVE0?=
 =?utf-8?B?VHM3RFZpTnNlbEgzQnNGcm5rVGJGeWJIaWF2N2wxc20wMjFxdEdwOGV6dUJV?=
 =?utf-8?B?SGN3SE5FNGRxQzhHZDd4akU0RVhOdCtQQmRKM3dtSnQwSlhiVHNmdUZTSTZM?=
 =?utf-8?B?dkJ4UVJuNHZqVjlWRDQ5WHptQU5rajhJalVPMnplSnh1bURmQTlYc2lTVkZn?=
 =?utf-8?B?OFMxNE51eWVuK0xKMkpSV2JRcDFmNCtGYWZLaE4zVk0rNlF0UktIK2NLQ0JT?=
 =?utf-8?B?RGtvb0pxZjQwemhkSnd3UEdKbzNuaHMra1BJc2grRUwzL3QwVXZSMlF4TVNL?=
 =?utf-8?B?a1M3Y1RNTEtkMzlSektuaUVmaTZKclEvNnJTbnNPYmhWdlhqdmNEelc2RURm?=
 =?utf-8?B?RWxRZlRmNTgvWlV0WmRWQTYyZmFRNnpoUXBoT0I0OXdlUEx0MEJQM3JWZUNh?=
 =?utf-8?B?Z2h5d3JFazVGYzlLbnRxVGdaWXhwYXk1cWNJUFp2bkZYbnBrVFdQc29FVGM0?=
 =?utf-8?B?Qm50bk0ycU5sVDZqSnN5OGdKVGY5cnZyK1Uva1NBQ0x0S3RrbXNyQURwRG9M?=
 =?utf-8?Q?Opdh+rVp9wI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5776.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlFHSFhHc1YrQldmdG1QUzhETUs2azdsci8zNFRrbWcvNnVIME9jcTQvMzB4?=
 =?utf-8?B?QXJ4QXcvZnNZQ29OdTI1NkUxTnIranVLb1dBM2VacW1XNTJ6cmhaOW9YNVhS?=
 =?utf-8?B?cVNjZ1l0VUV3ODUvd2x3WGtWUWFHTFFrc3l0T1hURlArNVlpWVVzVy9KbGFU?=
 =?utf-8?B?MkNCc1kwZ3ZLdEVBSlFaZmV1Qm56OU9oeEY1L1pVTHM4YWxmb251blFVL1VV?=
 =?utf-8?B?a2l1d0FsdmhIK3dTVlJ6ME9yVFV1V29ldTlTS0RJWkhZZmJ4VXZpZ1N5Kzlz?=
 =?utf-8?B?S2g5Q05nYll3KzNWbDFxd0FyTndlaXlQSDN4Q2dvajMzYU91TWVhNXJpWVYv?=
 =?utf-8?B?RXJ1dGZic1dLSTV3SVI3NlBtNC9xd0g3ZURDYlIrdU5GSnFNNHVWUXgweVNP?=
 =?utf-8?B?OGdGRkYvUGtVTkIzaGF1T044ck1IMEFvSklUbm1aZkNiUXBiUVY3L2EwTmRY?=
 =?utf-8?B?WjdHQW5KU2tZVTNGeWk1Q3laNEtFdkxMYkZHWXNQRlhPc3NsWTZpTXdOYUIx?=
 =?utf-8?B?emtCVXl2Yk4yT0hxYnBQYmdXSVVxOVFZODVDVklUczhFZTBLQUFRUWRmOVFm?=
 =?utf-8?B?TWpXNHFTMkVKUFdsaXU3SkE4R2RzVnRSVWJWcENidEI2aHh0OElTNUhnMEdt?=
 =?utf-8?B?ZmJPNjNHaExhN0FEcFdYSEt0a2I4SjNKN01rOFU2UXkvTlJzeHhOdU5VZXVz?=
 =?utf-8?B?TkZyVjBJc3dDdjg2OFJjRmZtNmlSTU9vaDV4U1ViaGMwalgvQU1pK2U2VEM4?=
 =?utf-8?B?QmY0aTNkOFBGT0tiNmdRTmpiM2ZjSG9CMkY1b21rV0VEOVpmWFc0UllYT1F4?=
 =?utf-8?B?eksvRzJjcU83eUdHdFZCa0h4NDJtWWxVQ2dyanlKcUk1N2UrVmhaV3pPUWZL?=
 =?utf-8?B?WDdTNUdLd3hyZEx2YXNBaWU2cUgvaEt4RnM4R1l4RGhHa1JPb3dUVjZPSXFJ?=
 =?utf-8?B?RE9uRUxoZStENUU0Zm5OTXJhZkxWZ0FjS2lMSTY0ek8zSk9jRms3TWNXeXNt?=
 =?utf-8?B?eFVmOGVSWE4wUnphOHdRcm1COVFqMGROTkJENHNtbDBhY0pQeks4YkdTaENV?=
 =?utf-8?B?THp5RUFjeFlwU1NiZ0liN1NHTlhUbDFOVzBIa1BDcHpEMVl4SmtBNzBJQXBL?=
 =?utf-8?B?aDZZTTMyQ1JWWUQwWldYSm9vT1ZqNThyeDBNVDY1ZEVOQVBiM3lXblozSTNR?=
 =?utf-8?B?dEoraHlabkFBbjJlUmFUSXRMQ2NvSEFBNUQrU3dFbGhKcjk5b0YwYUtLOWdu?=
 =?utf-8?B?WVluQmpxZnUzTFJsU2h4TmhnVVF6OXhxeXgwdjZRN25LZDRFMlNqRTZzRHEx?=
 =?utf-8?B?eW04eWU1RUdkRlIwVjJNNkgxUGRlMTZJOEgwUEFSQW9qMWlKOWNkNFFRUHY1?=
 =?utf-8?B?bHJoRjN3TzY2b2hhMkZ1MDhoOTNsOFlFZmNGVTNNL0d3K3NaMW4yU2Y0M0VM?=
 =?utf-8?B?SmZLTkY5cXk3ZExqUzcwSGd5dHgrUG0rdnhsVTgwWUZRRWEvajlPSFkxTzA4?=
 =?utf-8?B?QUFOdVhPTkRhMEE2bGYvcUt3NlhIMkI5Z3VLZ3phZjUxY1ZraXl2bmNVcEgv?=
 =?utf-8?B?azRLb1NENUNHSGRneld5bGh4RVY2TlM5bWtmTVdLQjlzMFI4WEprRTdQRkRI?=
 =?utf-8?B?UDlYZ3FBUk5GeExCLzNXbG9BRzRCa2VRQ25XMno5K09hSW0zOGkxVWl2U3Zo?=
 =?utf-8?B?UTl6SlZEenJOdHpQc1RsbjhLMFdUL09KL1ZLRi9nMHBWK1BkMXFnaFJHU0o0?=
 =?utf-8?B?VE5sWmZwSkNhN1BGdXMxemNEV3lKR01zM2xoMWxKY3l1MU0xMHI1eFYzamN5?=
 =?utf-8?B?WktMNTNsZ1BxaVhEbFc1anVTZkNiSUNVTUJNcUQrdU8vaitpY09hMDFlYXZa?=
 =?utf-8?B?VFVHT2lVSHR6d1ZhMzVsa0x2ajJkWEFqZnFZNkZWR0hIRkw0bGhvMWZjN0NK?=
 =?utf-8?B?akdGK0ZQQ1V5bnc5ZWZjaEJMSEYrZ252M1hsSGQyRjlBQzRwOFFnaEZJdkgx?=
 =?utf-8?B?RmlzZ0V0NTR1WWVDeTM1b3lSOXNtSm40ODBxbGY1Y0J1YXJEV3R1RHArd2J2?=
 =?utf-8?B?dnpmRU1xR3JVOFQxK1BRT1Q1MU82d243ZFZONDRVTi9IazVjQmZOblhUUjBM?=
 =?utf-8?Q?GQDN2DoZXEhOVRcs5zq1qDbwU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8d88178-d25f-4ff6-ceed-08dd7c055385
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5771.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 10:07:28.6969 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ar6ZKmNnZuRd2yHGaMWVjvaJa8/5v18ySinwOdT1lGdg2hbOz0ARoO8AxJ8eQ4GOkGBqmZizZ6UnOJ+4RHoJaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5946
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


On 4/15/2025 2:14 PM, Tvrtko Ursulin wrote:
>
> On 14/04/2025 18:58, Christian König wrote:
>> Adding Pierre-eric and Tvrtko as well.
>
> Thanks!
>
>> Am 11.04.25 um 15:04 schrieb Sunil Khatri:
>>> Add helper function which get the process information for
>>> the drm_file and updates the user provided character buffer
>>> with the information of process name and pid as a string.
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_file.c | 30 ++++++++++++++++++++++++++++++
>>>   include/drm/drm_file.h     |  1 +
>>>   2 files changed, 31 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index cb5f22f5bbb6..4434258d21b5 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -965,6 +965,36 @@ void drm_show_fdinfo(struct seq_file *m, struct 
>>> file *f)
>>>   }
>>>   EXPORT_SYMBOL(drm_show_fdinfo);
>>>   +/**
>>> + * drm_process_info - Fill info string with process name and pid
>>> + * @file_priv: context of interest for process name and pid
>>> + * @proc_info: user char ptr to write the string to
>>> + * @buff_size: size of the buffer passed for the string
>>> + *
>>> + * This update the user provided buffer with process
>>> + * name and pid information for @file_priv
>>> + */
>>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, 
>>> size_t buff_size)
>>> +{
>>> +    struct task_struct *task;
>>> +    struct pid *pid;
>>> +    struct drm_device *dev = file_priv->minor->dev;
>>> +
>>> +    if (!proc_info) {
>>> +        drm_err(dev, "Invalid user buffer\n");
>
> I'd replace this with drm_WARN_ON_ONCE.
> This sounds fine, will update with warn once in next version.
>
> Another thing I would consider is avoiding the need for stack space by 
> exporting a logging helper instead. Something like (from patch 3/3):
>
> drm_file_err(uq_mgr->file, "Timed out waiting for fence %p\n", f);
>
> Which would output the client name info as a prefix or something.
I guess here we are making a generic function and nothing specific to 
the driver or a feature like uq_manager. this is supposed to be a common 
helper function for all drm clients
and based on drm_file. With respect to the user i guess the 
driver/feature specific information can we placed in the caller itself 
and thats upto the user.
>
> Especially attractive if you add client name.
>
> Also while here, is %p for the fence is useful? FWIW in the tracing 
> series we are going for %llu:%llu (context:seqno).
> To be frank i dont see the fence ptr to be very useful as they are 
> being reused too and we do see same fence ptr again too. but this we 
> could improve later. I will push a new patch series for this with the 
> comments taken into.
Regards
Sunil Khatri
>
> Regards,
>
> Tvrtko
>
>>> +        return;
>>> +    }
>>> +
>>> +    rcu_read_lock();
>>> +    pid = rcu_dereference(file_priv->pid);
>>> +    task = pid_task(pid, PIDTYPE_TGID);
>>> +    if (task)
>>> +        snprintf(proc_info, buff_size, "comm:%s pid:%d", 
>>> task->comm, task->pid);
>>
>> Looks good in general, but I think people would like to see the 
>> optional client name here as well.
>>
>> It's rather useful to have for native context.
>>
>> Regards,
>> Christian.
>>
>>> +
>>> +    rcu_read_unlock();
>>> +}
>>> +EXPORT_SYMBOL(drm_process_info);
>>> +
>>>   /**
>>>    * mock_drm_getfile - Create a new struct file for the drm device
>>>    * @minor: drm minor to wrap (e.g. #drm_device.primary)
>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>> index f0ef32e9fa5e..c01b34936968 100644
>>> --- a/include/drm/drm_file.h
>>> +++ b/include/drm/drm_file.h
>>> @@ -501,6 +501,7 @@ void drm_print_memory_stats(struct drm_printer *p,
>>>     void drm_show_memory_stats(struct drm_printer *p, struct 
>>> drm_file *file);
>>>   void drm_show_fdinfo(struct seq_file *m, struct file *f);
>>> +void drm_process_info(struct drm_file *file_priv, char *proc_info, 
>>> size_t buff_size);
>>>     struct file *mock_drm_getfile(struct drm_minor *minor, unsigned 
>>> int flags);
>>
>
