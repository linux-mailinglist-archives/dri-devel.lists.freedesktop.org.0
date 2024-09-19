Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2421497CC00
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 18:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB5810E730;
	Thu, 19 Sep 2024 16:06:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ula5jlJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2065.outbound.protection.outlook.com [40.107.93.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6752A10E72D;
 Thu, 19 Sep 2024 16:06:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMXAkv3lmRTGfl1EQYsYB0Ndtzf7xgsG4k1LOUicxglGBgs3SA/hqmkrb+E3xCQcs0N5HdiFNO0Lge+ssEwFUws2ts8J0yl7sW2iFQzh91yigxknLpq8jTyCAynprq9XLhPOBioPUpX9BKCdZsR5BHRIFsXVbds9JUvFb7trmtD3+WbHRAY5Jnc1V1/kYTBaY9KyivkwAliYkOdkmbIkxJGfD9SoHxxPEJhqVUb6Q/j2qPjs2Db97ZTWwqpM47XfK44MVHwBq3cgJkYOYhqO60sCtxbHZMpqwE4TGHKrOWbD0o70j/3n2Tg0cOnfUsLak0VgWsFoeztIl8FV/i07BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MucRxvblM3M/c2lGH6A/XyH2YC+4AdcAf8XE4cYBzCM=;
 b=vRI0C8QuMbZcPr0ACBsqfOxqKpIxQ5BA99f9BFMoFUJR2bUupWR67O8qvUmDpaL1ozOe1JT/YdpzDzEF75bJkhBJIGRvVuDfpMB1d5ihhX8SyMS8aUIwPNc+c/9uexijZMsVDYjeJ9zznk/he0CMGs/ht8agHIj45r+4qoSa2QfG+FXCbHooFI6JKbqcqYu8jYdWvePrZhziYzWH10zMuPBo/+Y9axEnSZnOhHTUeIcthgVvi2ADW4WsjDgQZADcx7ZG8QXh9YMFNAbvMBmwP/TWl54HhGgzucYrJKuKHSUgehdmNh14f3vXioObmanC3IVgy77ZA6jzeonWqkT/XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MucRxvblM3M/c2lGH6A/XyH2YC+4AdcAf8XE4cYBzCM=;
 b=ula5jlJ3FxVfCs+/ul3g2Nv3MpgxAkl6itwEcZdTUgmnI09c7MrxYqc1n9ETug149CkBGOaKCVfLrQ/yHGxRL1LunMb61PXO/f09Nrkt2C5iUWz+X7+DrDyqnUj6IvgjnKvCnaqRXF6q4nXadAiRZkCyAM3i4xpvd7VywZDtWvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by PH7PR12MB7163.namprd12.prod.outlook.com (2603:10b6:510:202::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 16:06:00 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 16:06:00 +0000
Message-ID: <e879e296-9453-4a76-a879-52b33143261d@amd.com>
Date: Thu, 19 Sep 2024 11:05:57 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/10] drm/amd/display: Fetch the EDID from _DDC if
 available for eDP
To: Alex Hung <alex.hung@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Melissa Wen <mwen@igalia.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <20240918213845.158293-11-mario.limonciello@amd.com>
 <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <77b34bd2-3727-42bf-aa0a-4f24ad7232cd@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7PR04CA0096.namprd04.prod.outlook.com
 (2603:10b6:806:122::11) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|PH7PR12MB7163:EE_
X-MS-Office365-Filtering-Correlation-Id: 126635db-52d2-4140-a6b9-08dcd8c4f40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1NPYVdzTmI2MW9HUjYrTHYybDExNHlwckJ3cGZWR1BIMWJHY25uWS9OWXlQ?=
 =?utf-8?B?dHpjbTA2Y3k3SWRyVU1mY1M3YmJlQkJmWHZQZnJIZWRBa1NNbWRydzFLUFpW?=
 =?utf-8?B?RnkwcDRTb0ExL0VybGRBS0xIYjd0cUhMME1HMVQrWHRKelF1aVZKeUZvNFlN?=
 =?utf-8?B?eVdGZXRhOEtXU09TRE1valcwQXBHM0ZoN25IWmp0R29lbmVidmlxZjF2Y1V4?=
 =?utf-8?B?RFZiVHRwV3NCVDQzdERiNWpobDltVEJ3a0MydmxNQ0RXRnhPeGw1UXBrZjYy?=
 =?utf-8?B?ODBRczErekNoemZORzRjaGdTQ3EyckVSamt4SDMvbE9BL3BRcXFvTmdGZXhx?=
 =?utf-8?B?ZGdxdkpESTgzbVpicTNZL2hSVFdNUk95M21SK2lCVFV1LzlpMHpVS1ZOcWdS?=
 =?utf-8?B?VzdTRkFWT0JQa1U2cjB2S3RzcDRISEpsZXJKZ2hpa0N5dWVJUlV4SEtXOE0z?=
 =?utf-8?B?QVhwMktLT3pSVFhpaEdGLzI0VkhLRHNRZmllc2pFUWI4Y3hGRDVuajBzWU0z?=
 =?utf-8?B?UU1yK0Y2L0Y3SlE2MWpvZXlLVC9heXJiQlFrOFB3ajFCQk9pOUVEaUQ1RkpJ?=
 =?utf-8?B?NlNCaG5VbTNXZ1FvQmI3MUJ1OEJlK1VaYnRmaVNwZGtBT0NxZWxKOVNPaC9k?=
 =?utf-8?B?VGxEam9rQzFUODR3TTJIZTdxN2RxRkFXdnVJcnBXUUFkUjZXTDNrNXpEMGdP?=
 =?utf-8?B?dnY1bXNCNzhhcDVNQWZEUUU4ZFAwZ1BMTFRTTlo1dDNtN2tjL0dURStYQUR0?=
 =?utf-8?B?R1Y1Sk0yYm1tcGQvRkNJUHdXRW80TEhmdExDaWFWWTd0Q2ZVNXI4Skk4QVds?=
 =?utf-8?B?THVCaTlCeTl5VGhub3BOUUptRXNjdVlab1F3QkZaMXJSME1KOE4yMnpxcTJo?=
 =?utf-8?B?VERnc3RqcWgvS2toSkVsUUpJeWtzR1JvamVGc1ZSOFhXd1U0SkJjem5yRzB4?=
 =?utf-8?B?WWdnVVdIVmtWU0VqNzlrL2YwbStFWDByOGdXanYzVERFOEF1UkxCNHBMcEtC?=
 =?utf-8?B?UkZuaytHWVJ6SzlQZHR1bTV5d2kxdng5K2JIS082QnE1OE94RW5MaTZzaWhp?=
 =?utf-8?B?K1FKamtzK0VjQWZ5MXBuTWV4cFJMdTZqRitYUjNvRjRBU1dqVWFiNEJHQW9Z?=
 =?utf-8?B?RXFCUWt5NjZGTzJNMno2RUNVQkt3bzJFa25JdUhPNmgwSG14OTZZWjdkM0ZB?=
 =?utf-8?B?cFhOYmFKYS8rekgyQ3BocU9Sd3hUNGlQZlBNb2Z3NksrdGlDTHdaZzlsNS9j?=
 =?utf-8?B?bmhDZkY5Z09OTjRrL3dpSjVKSEMyZmhtQm9na1hraDMvdWhLWWVwSGozYlpz?=
 =?utf-8?B?NzFQaCtXd0NYeVF4R2lyUWkrRHZYQWR3cjFnQmZMUlVpQTlFN2FrdzZRVVZC?=
 =?utf-8?B?QWs3UnoycnlMUGZQSFJJSDZrUjF0VDRwVFdsWithbUhpNHZwd2tMcEJ4NHlT?=
 =?utf-8?B?azR2alZmbUc4cnN5MkVRb1pIZ3hocHR1TGJEU1ArRTNaUEJqZThNbVJlNlFJ?=
 =?utf-8?B?ZWZ5eDcrcXZoeEE4cW1lY2ZtT0xzb01CUmVrejN0R013TnB2QzdHVWZwYm9u?=
 =?utf-8?B?Yk00cFB3TzFaMnE3UU9LUHAzZVpIYXhCTGZoUEg1OFV5RzU2MzA5RzVxbG50?=
 =?utf-8?B?WDVZc01TMkNoOEZsNW41US9nZmZ2QTVmWVUrc2F4UmdRY2JzUVhKRHJEU3B4?=
 =?utf-8?B?MzgxcGllUnJxSkZmQ1FMUzMwb0tpY1lYOTJRTk5vOVcvMWtOcFlPNmswN1Jm?=
 =?utf-8?B?N2FFcEVzYW44enZ4aFA4YkpiS29ZSmdwTVNVTTVkcDhOS3dNc0hUOGwxdUUz?=
 =?utf-8?B?aTZmamZUYk5JeXNCeUZCdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEZ5bDVROFhwYkNQa0d3UlFId255S1dNb3NhYzlyc3VFWGtTKy9pLytWckJy?=
 =?utf-8?B?ZE8rNHdLMDMwdWJ2SkdlUE1rVUpQNGM1UEpIRDRRLzJRZEJSSHYwZWVpRHZJ?=
 =?utf-8?B?QkRTM2dNUHdrWWVMbWVmNlRYYXkzajBGTHBGNGpRejdFM0RZcmovd0hJa08z?=
 =?utf-8?B?bjFaZWgrOTMreCt3YjY0WndiZlk1ZFN0d20yM0xQcWVlOTZkWVhGTklpMEtM?=
 =?utf-8?B?a2VvL1pXMlByeUxNU095RWF4MmpZMEN4c2c1VVhRRjgzZkJiMkJER2piMEVz?=
 =?utf-8?B?YmExYmpuNnZxVTJtZlU5aExkRXVJY2tVVUR0UDJnWE5wREozRzhlS3A1QkFt?=
 =?utf-8?B?TmxNbW03cGhOSFpDK1hIQVZxWHhrME5xb29MS211YVZ5bWIxcGhNUU1KUmZT?=
 =?utf-8?B?M2RWTTRQZHNmRno2RGM0OTJjQjlvZDhrbDBCR2ZQNnpZdWFEQTYzNU96dlpq?=
 =?utf-8?B?RTBjWWtJallhN3RzRXNUUDl4dFJTZzhPaGZ6akNnWVBCNzYyU0phUHlqY3pK?=
 =?utf-8?B?c1hMVFJIS1c2V2JTOTVNek1iQXBEN2hYUy9TSnNDYllRS1BYWmc5MkhCSHNK?=
 =?utf-8?B?U2JMc2pBcFV6UzVCU05MR25jU2N5M2p5eDZaNnFNT0VpVE1ha1FxdVFwR1c1?=
 =?utf-8?B?RENzeEVZbWh2Mnh3UC84VldoUHVRVExTNndFSERzaFRSQk84cUIwbitqTmdo?=
 =?utf-8?B?ZExhL1EyMEJpOHpkWEZ1R0hzbWYzZG5WMDZQVFdRbGl5RXl3VFVLdXR0em1o?=
 =?utf-8?B?K0kvLzQ0WS9rSU1ZWG8rcGlhRE12aWRxbXBITWJPSy9peXZXanlvSGlTMllR?=
 =?utf-8?B?V0oxSzhXbFZQWUcySnBMQkpNQVJvSlBRSFlvNHBCQ0dXNWhickg5SlpoRjdO?=
 =?utf-8?B?NldUOUhWVzB6L0h0OXRTcVQvYmlOMVRSRnIyMlI4MzhNcHNUK2ZQSjgyWEFI?=
 =?utf-8?B?UXp1MDAvdXhwTEQxOHJzN2ZoNXdyWEovVUxEZmZObW1iOEdXcmNQY0o2eDQ3?=
 =?utf-8?B?cEdrcGZzRFZkTFJoL20xLzNPam1vb2JxdHorUWd6dG0weUNSVHQ3VDNIMmNa?=
 =?utf-8?B?Y21LMWpSR1dhYjZOVXhCOTlnay8zdW9kVThGTHZlNG9ha2RRZEpJNlRNSERT?=
 =?utf-8?B?NGRUWUpOb3JEZ3RCSEw0c3VGTFg3YUxxN1A5WldleDN0cmxMMitoS1FtMXM5?=
 =?utf-8?B?azJVcjZISWQrcmRiMTl4WFplNEgxaG5rK2t2MU5jNlpDZlRqY1ZWb1QxcS95?=
 =?utf-8?B?bUl0bGJKYkEzdXVBQnhrN3RmdVltRFpaMHFYUGNYRkN0TWpIM0x3OGUvTHpM?=
 =?utf-8?B?K2l1Z0FJdEZNdCsxWEkzRS9ScTJpT3dockFwTWh0MlZ6aDc3VjFSKzFjeTM4?=
 =?utf-8?B?WDdoUzEvMmxJaGlRYkFpYTFtSDlmcDY1eklvS21MN0dGczNoeDNhbXAxU0Jm?=
 =?utf-8?B?QzNkSW1OZEtEOHlabU1HakxEdm5JRnY1WHFpR20yWmh4bGxCQ3BxWEdvRUZO?=
 =?utf-8?B?QkZwbjljVVMvMkFPZy9wQms5dFhnTTVLSGFjT2hrUmdwaU1kYUxRRHFOaTRz?=
 =?utf-8?B?ejBxNTFLWmIzYlhpMFZONjBOWlI5dWNMeWhkdDRxS0NzdTcxV2FVb09KS3Fv?=
 =?utf-8?B?b2Z1WXloZlQ5clVjQXNkTFlkUG0rYzZWUmtxMFd0L0hMMDVvM1NnWWJpdmll?=
 =?utf-8?B?V3NjZHJqOXlOK09sajRlMXFGelg1Zm4vdFczQjFUUjRqOWpucFJPSVg4VnZa?=
 =?utf-8?B?SXZGTFlTMDk2K1V2dC80L25nbFZIQ3hqZGJyYWJPb1dhaWVWZFJOY1UwTTU3?=
 =?utf-8?B?VkhLR1hGZnhJT1UrcU9lbGE0WkJHSUdCUmhscHY4cmxWam5CaVJ3OUNHeHY2?=
 =?utf-8?B?UkZBUGJkY2FBWFV3OGtpdWsxcFNkV0V3cC9hWGlNNFgwbDlLY1NDYkJpMkd6?=
 =?utf-8?B?SzFqNXp3eVdoQ3Y5YkRqWWJSdDEwVzd3WlZhU0E3WG0vbGxRaEdwZzVPV1Qr?=
 =?utf-8?B?aStpaExnY3ZlRW96cHdvN25QTHlyaHhJTFFsR1JxSVNRSzE0UlkwWTBkUS9z?=
 =?utf-8?B?L0NyWUJ2Rnoxa1YvZUF6RVRMZXI3SkZwTUJRM212OXc1aW1SaWlrWHduRXho?=
 =?utf-8?Q?3SmDLNj+R/JzZu4i+8958xz4E?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 126635db-52d2-4140-a6b9-08dcd8c4f40f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 16:06:00.1127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHAfNeKB0DV6z+6NwuOc9Ts50KSoEA5B3n9ZdU8ngk9jQuzFy+hCcvbNIrNMActi6mFYdNpNT9e8uwkU53RL+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7163
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

On 9/19/2024 11:03, Alex Hung wrote:
> A minor comment (see inline below).
> 
> Otherwise
> 
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> 
> On 2024-09-18 15:38, Mario Limonciello wrote:
>> Some manufacturers have intentionally put an EDID that differs from
>> the EDID on the internal panel on laptops.
>>
>> Attempt to fetch this EDID if it exists and prefer it over the EDID
>> that is provided by the panel. If a user prefers to use the EDID from
>> the panel, offer a DC debugging parameter that would disable this.
>>
>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>> ---
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 62 ++++++++++++++++++-
>>   drivers/gpu/drm/amd/include/amd_shared.h      |  5 ++
>>   2 files changed, 66 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c 
>> b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> index 8f4be7a1ec45..05d3e00ecce0 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
>> @@ -23,6 +23,8 @@
>>    *
>>    */
>> +#include <acpi/video.h>
>> +
>>   #include <linux/string.h>
>>   #include <linux/acpi.h>
>>   #include <linux/i2c.h>
>> @@ -874,6 +876,60 @@ bool dm_helpers_is_dp_sink_present(struct dc_link 
>> *link)
>>       return dp_sink_present;
>>   }
>> +static int
>> +dm_helpers_probe_acpi_edid(void *data, u8 *buf, unsigned int block, 
>> size_t len)
>> +{
>> +    struct drm_connector *connector = data;
>> +    struct acpi_device *acpidev = ACPI_COMPANION(connector->dev->dev);
>> +    unsigned char start = block * EDID_LENGTH;
>> +    void *edid;
>> +    int r;
>> +
>> +    if (!acpidev)
>> +        return -ENODEV;
>> +
>> +    /* fetch the entire edid from BIOS */
>> +    r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
>> +    if (r < 0) {
>> +        DRM_DEBUG_KMS("Failed to get EDID from ACPI: %d\n", r);
>> +        return r;
>> +    }
>> +    if (len > r || start > r || start + len > r) {
>> +        r = -EINVAL;
>> +        goto cleanup;
>> +    }
>> +
>> +    memcpy(buf, edid + start, len);
>> +    r = 0;
>> +
>> +cleanup:
>> +    kfree(edid);
>> +
>> +    return r;
>> +}
>> +
>> +static const struct drm_edid *
>> +dm_helpers_read_acpi_edid(struct amdgpu_dm_connector *aconnector)
>> +{
>> +    struct drm_connector *connector = &aconnector->base;
>> +
>> +    if (amdgpu_dc_debug_mask & DC_DISABLE_ACPI_EDID)
>> +        return NULL;
>> +
>> +    switch (connector->connector_type) {
>> +    case DRM_MODE_CONNECTOR_LVDS:
>> +    case DRM_MODE_CONNECTOR_eDP:
>> +        break;
>> +    default:
>> +        return NULL;
>> +    }
>> +
>> +    if (connector->force == DRM_FORCE_OFF)
>> +        return NULL;
>> +
>> +    return drm_edid_read_custom(connector, 
>> dm_helpers_probe_acpi_edid, connector);
>> +}
>> +
>>   enum dc_edid_status dm_helpers_read_local_edid(
>>           struct dc_context *ctx,
>>           struct dc_link *link,
>> @@ -896,7 +952,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
>>        * do check sum and retry to make sure read correct edid.
>>        */
>>       do {
>> -        drm_edid = drm_edid_read_ddc(connector, ddc);
>> +        drm_edid = dm_helpers_read_acpi_edid(aconnector);
>> +        if (drm_edid)
>> +            DRM_DEBUG_KMS("Using ACPI provided EDID for %s\n", 
>> connector->name);
> 
> It is better to always output a message when ACPI's EDID is used without 
> enabling any debug options. How about DRM_INFO?

Thanks, DRM_INFO makes sense for discoverability and will adjust it.

> 
>> +        else
>> +            drm_edid = drm_edid_read_ddc(connector, ddc);
>>           drm_edid_connector_update(connector, drm_edid);
>>           aconnector->drm_edid = drm_edid;
>> diff --git a/drivers/gpu/drm/amd/include/amd_shared.h 
>> b/drivers/gpu/drm/amd/include/amd_shared.h
>> index 3f91926a50e9..1ec7c5e5249e 100644
>> --- a/drivers/gpu/drm/amd/include/amd_shared.h
>> +++ b/drivers/gpu/drm/amd/include/amd_shared.h
>> @@ -337,6 +337,11 @@ enum DC_DEBUG_MASK {
>>        * @DC_FORCE_IPS_ENABLE: If set, force enable all IPS, all the 
>> time.
>>        */
>>       DC_FORCE_IPS_ENABLE = 0x4000,
>> +    /**
>> +     * @DC_DISABLE_ACPI_EDID: If set, don't attempt to fetch EDID for
>> +     * eDP display from ACPI _DDC method.
>> +     */
>> +    DC_DISABLE_ACPI_EDID = 0x8000,
>>   };
>>   enum amd_dpm_forced_level;

