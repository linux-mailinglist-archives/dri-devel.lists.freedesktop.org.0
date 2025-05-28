Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA1DAC69F7
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 15:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FBC10E2E9;
	Wed, 28 May 2025 13:02:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0wzGFRg5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8856B10E273
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 13:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uiXw7oPHrNCMmrAaAEk66ZhpMTgKXYvVHruezkMOjw1FuRrdchrgK3nJAkE2gCEDhPhT6Bo+TlX1KdfZTx26dZMoykOzjtjStdNixWiQTawjOeTiqkVJMoAzZJyk+zp5VRzFl6hQn/oJdTYssiW4cGVEJj+h4mvaDWyygDwL5jaVqZ7p0zesLWr4P8+Xy6ZmNJ8RjYDE7VKndhOurpsQIjPgtE+FvS7xHq8+26XO37H1KmFyFAjichAW7DR/FDSQIfdPmqhjgO7o0g7nnE65rp/zdZ6pNme4kes9cSOvfv6V1LfqiKrKENg/AaUKdWafkRF9qwkBrtSy9X2ie1RSxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YLXK3FgsvNVKBL5FYeb0Y834SSiYmYLqqfeROlFFsE=;
 b=O+wY2AEYxUsP5BYV5FxgZqqRUfkPE3G95cqIOgJEsIFEA5ncX1UFlZX2mmkuJeNWQ6XqLqhGAb/Xp6JoLd13mHlF06syeZJPCwDV2G9SspLnDCD1Bb9vwh+2M4t28upfHGfv2fuCptKx3Tz4wezfJtu+0KKQCKz9o91Xh/ADoldaD22YJyvfnJCLE3uk/Z+djEbYBQYE6C4i3XH3K7hCj/SACv9vK09kqDu5e7kkUBaAkxPpCanW4r1TxqTh4cVTPE23EsCMMg6+cbL9uBszsJJHjBdHJWlIXNIEEEafDn/kS3ullP7yuMus6PJ1ux+MiumYEt8IbQhazPo+sv+u3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YLXK3FgsvNVKBL5FYeb0Y834SSiYmYLqqfeROlFFsE=;
 b=0wzGFRg5e4vkVntxZ5562r4OI2ef2/LVbK6p2zUOzgLKejjhPPi0Sdq9BGk+RTEh6LJ2rBgZM9w4eOv6dT4r/tDkoRvPwPEu7dSO9fGwwR4oYrOhf4F+63xsxQztR4XFPU1/xQYl0U2mo+8Nf8yK9VkIMMtdVjOh4mp8Edv0KkA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CH2PR12MB9518.namprd12.prod.outlook.com (2603:10b6:610:27e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Wed, 28 May
 2025 13:02:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 28 May 2025
 13:02:45 +0000
Message-ID: <2fc4f3b9-6fca-474c-9df2-acc04331c144@amd.com>
Date: Wed, 28 May 2025 15:02:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/debugfs: add client-id to the debugfs entry
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dmitry.osipenko@collabora.com,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>
References: <20250528072248.1490819-1-sunil.khatri@amd.com>
 <96d0a239-415c-4f61-b4c6-1f9b9d948736@amd.com>
 <5f14a8c5-7964-4639-bb62-fba4475eda76@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <5f14a8c5-7964-4639-bb62-fba4475eda76@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0272.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CH2PR12MB9518:EE_
X-MS-Office365-Filtering-Correlation-Id: cb9d9707-2e4f-408e-84e9-08dd9de7f063
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGVKV1FpQlBUaDVsVm9GNi9Idm5lNnBta3MxK1JNVUdYTzFhMG9aSkV6MVBX?=
 =?utf-8?B?cFBxRHpjdmU4dEx3bllMMC9YYnRmcVFqQkszUmNkMjFBM3dKK1FtSk83cWFY?=
 =?utf-8?B?SVRxdmRQMCt3QTdpYzA5TzJGODgwOGFEMmpsU2lSRWVaTUpwWDViNXdacEtr?=
 =?utf-8?B?VXRIYWRadFhmcGt1OGU2UXU5aEkybWd4Q2NPaTg5YnVFcERNSVh6ZTh0QkRT?=
 =?utf-8?B?R2FUQ1JFVGIzdVE1K3ROMUhXNEhSOW5odW9xNTNyNk5DSngxWVJpRjE1K0ZH?=
 =?utf-8?B?dzJ0bk52SXJFbWIvanhoR3YxVFJBSzRXTk4wRG5SSWhnMXpTNjNLcmNrWEpo?=
 =?utf-8?B?WFNzTEgzeStRd2lxei9lOWsyVmROWW1velh5SzRyMEtSU1JVeW40UHZRemRT?=
 =?utf-8?B?V3ozeW11R01aVERiL2ZXeC9qaWpNbUdKTVN5VnVLV0M5K1F4a3U1UWdPWUY1?=
 =?utf-8?B?alpXaGdTdXhiUnFieXBtelJBY1FHMW5keC9YQTYrS093NDkzbW1KT0VrL1VV?=
 =?utf-8?B?bWo3eEJkSkVScHcrRDgrNnMwalZvUjhwNCt3VW9sbEprc3hnY2ZIQko1QWlE?=
 =?utf-8?B?Qk1zL1FMUmc3VC80cmQzZ3ZlaHpLalRNK1lDclFZRmhHbzkxcXdKYlBKcElB?=
 =?utf-8?B?RFNxUjU4Q1JhcjFHMlZmOGxPY1Z1U3lsR2RqMC81YytDWVZJYVVjV29QNUlW?=
 =?utf-8?B?VXVnSkdyS2hGOWQzazFPSlREdmFZTVBJejJJdVVLbTN0NlhiTEN0RFNsMHdO?=
 =?utf-8?B?eDhlbVNYcU1VcGZ0Tm1MRGM5dHBnWjlXK2ZrV1RSazJrOWpaMkdRZ3crdG1O?=
 =?utf-8?B?NW5qOWpqbSswbXlLZ0Q1eXY2NHdiYmFTcm43T2k3NHlzMFA2UmtXZGIvSUUv?=
 =?utf-8?B?RVRzY2U2UjJsUVNkaG5MZWcvRFprUWllNnJwM0dFL2hDNHM2WXROaTU5Y213?=
 =?utf-8?B?T2hpRE5Yam9Ha1dVeXNiaGdwZ053bndUbTdXblhZQm1ISzZOcThNaHBFOS9p?=
 =?utf-8?B?eHlqajUrUXNENHlTT2dXYXpDSUVHN2xGWENlZisrMjBMM1c2dmxxemorK2lZ?=
 =?utf-8?B?eFl2RWhjZ045K2dyK1NIdkdlUlExd2d3MGFOOTRQeGRmblpsOCt5U0lGSkow?=
 =?utf-8?B?c1AzQkxTSHZYb09rZEVlbUZwZVEwWktiR0hRWWtpY0p0OVdkd1IwTVJQWjlJ?=
 =?utf-8?B?ME14V1JjM1RGU25TanJQcDFrWWxoRWQyU0hTNGJIQ2RwbWF3RzF0UzBQbE9p?=
 =?utf-8?B?ZWxUSkFYckVOSzBSdmhqUDdMVkhKalMrRms2NSs1S0s4K0lnTUJ5SlBpMWYv?=
 =?utf-8?B?MkxoRCszdFBPQjd0cjBwZC8wR29KcXdLVDJoRUVUZW05MXVVK0tkRnp1eEpW?=
 =?utf-8?B?TjZUVzJ3cEYweTgwTXNxRGpybzNFclRNZzNvTFhQUWtzL2lGaTM2SXVaakRx?=
 =?utf-8?B?T2R5bmpqcmwvdnFOcXY2V3NHajlJNWlYY3hhSVhhZ0lpVC9TY0V1eGpNL0lH?=
 =?utf-8?B?MkZ3MS9OSGw3bWdUaEZZZmIrMXErbU5XcXRrSHNKTmtlVGdoOFA0SDY0cnhC?=
 =?utf-8?B?Uk9MY21ma05EeGtrc3kreTVMWmc3V3c0Z1FqR0IzYkF3RFN2WUFKT0M2WFRl?=
 =?utf-8?B?YzBhTktiK09mRitxUmxnMlVYQldadWg0Yyt1eUtHTk5IR0NHK0RNS1hSQTJz?=
 =?utf-8?B?YVBkUGx0cDFiQkFPR3RvVjhJNm1KQmdRNStxWmc5S1cvcnU2dTV1OXNHeno4?=
 =?utf-8?B?dkd2Y0xETitzR2lSQzRRQU1rV0hDSnRxQWhBUk9mZXhwblBJRE4zQW5xUjkx?=
 =?utf-8?B?bVpCa2xIc0NDWmFvdmFBWVpIMDRMNGlEcDZmZVRFeCtvYUdYN0k3QWpXdjIy?=
 =?utf-8?Q?1yQKq/spEtj+K?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkVwK0tLVEY1akFaNzhTbjZZSlozWGI1dkJOOENhN1FhZEhuZU1FcWV5YUNh?=
 =?utf-8?B?NGVjMU0rVU5oR2dsbTNpOEswSTRBSVRqbGs1cE5JbEtxOGVjN2hjZVgvYW9Y?=
 =?utf-8?B?ZCtXRktSendHUEhoek9ld2RibDBmeFJnV2tOdDZSZE5OYXVEclN3WXV2c3NN?=
 =?utf-8?B?aVVwM0VMNC9TeGVvUTMvbmpSK1FCT2hxMGlxSTg2ZlVvTTZpcWV4WWo0SnVp?=
 =?utf-8?B?eDBtZ1JWOCsxSDhLREt4bXdRU3REakhnTzRTUmpBZm1WUDQ0TGtMUGJYVDls?=
 =?utf-8?B?V1A5ZnUxSTcrZUd4dklVa3U3V3dpVDRSa0E3aEI0V1U4ZTBmNnd3TE5YODNV?=
 =?utf-8?B?RkVNR1V1T3FHbFNiTldYVHdld0h6bzZhbmZWbzZHYTJvRVJVdHRYOHJyYW5s?=
 =?utf-8?B?b1pPUEV5SG9KcXRmS1JBV3BuYm8wR0Z2ZkxLR0JTT2lvNVZSUTZxcGlTWC9W?=
 =?utf-8?B?K1hBbVEvTWtHaDFzY2dxQTd2WjlDWlJIN2dWOHBRdXF1enp2SjZMcXZ4MnFR?=
 =?utf-8?B?U3d6VytTQUg3VGlvMnd3blZ2cTBYSjhKMVBKYUdndW53RlNzUEYveUpuUWlj?=
 =?utf-8?B?NW0xbWM0ZGw2MmlFVG9uZVI2MnhUT1U2cGk3T1FTMld4U29kc0wzdndNMUQz?=
 =?utf-8?B?R2YyWGcreHZzYWJBRW1pNmF0TmVwVnJLS2hMVTY4VHFwOEkxT3FGbnVnclZR?=
 =?utf-8?B?TjFxVkdTTXRCRkNUQVkvSmpUalNlZEVuek1mNkY1MXptNUhlWHZJbFUxWTNn?=
 =?utf-8?B?Ym5QYXNEeGMzL21ybTUySzZBNVo1QXRIYno5REpDdndzL2FMNXh3Y0pncDFL?=
 =?utf-8?B?a0dXdVRUMW1lZi9LWnRGd2MvYmw0NjA4ZS9sWnBVdWU4Uk42Ri92ZDRESXk1?=
 =?utf-8?B?a2pnWlUrcjNQZFlWVmdoTnR5UHQ1S2s0dXJiMEJxOWlXSlNOOTVhQTgwQTNQ?=
 =?utf-8?B?dGd6SUEyMmtQYytKQUE4czZjbWNSWVNSSE1TWDNZQ0RCRVBodGdTeFIyclRh?=
 =?utf-8?B?WXhMRXdCZU5zZTZ6Q2F0Y3E4TjlTdko3NVpEd3I1NEpLYldTOVhxU1lKWDg0?=
 =?utf-8?B?ZUt4Rm8yUkM0UFI4SlE2MEQ2em93aUZLTEJWdkFxVXVabHMrNlRNOVVvT294?=
 =?utf-8?B?SDJZSXFnS0pxelpVeWtxdmlDa3BJQkt3ZVo5Uk5jWkx0L2VzSGJMR0dwTEp5?=
 =?utf-8?B?Y28zdVI3ZWdoZ0xuYVNhSG0rQUh6ZittWE9JYU5lZmpEcFZVMGZPNjA1VzBz?=
 =?utf-8?B?VWIzWXc4YkV2L0RnVDdvWHFwU3pwYk9WWXFoY01meldzWUdLZEZML1RHcVNs?=
 =?utf-8?B?dVByUDZqM1FsSFVwcFlCck5ZVkdRMU5CQVNIeUZsb2VXUUgvSVJUVnFKNHEr?=
 =?utf-8?B?RDBFRHdCamg0T0RXUUlTVGdjOW1UeXYyUHh6YkJJY2tNNUppb0RIOUh2czJY?=
 =?utf-8?B?S3JNVHdkQUU3RTQySnU4RkFGdlVEemVoNHNqSUxSN2pOWG55ZE0yVm91aVd0?=
 =?utf-8?B?K0NtQ09YVjFZM3ZrRklGUG1QNDNGOXdUK212LzFPOWdqWGVrcXlCY1Roc295?=
 =?utf-8?B?d0twSkJGYkdWekxtMmhyV00zZm9WclBwS2pydm1UTlRpWkQ5YkI5d25kNFFD?=
 =?utf-8?B?L3lrM2szdDdxaWM0VzFyVTQ2eXkxYUNFaXdmQWpKWmhLYzFUQ3c5K0h3NVcz?=
 =?utf-8?B?WWdDYm9UWjJPWjcrcys2KzJpc1Nhb3FuT21TNkE3dHdnaHFYTWxYOEtTendj?=
 =?utf-8?B?bk5YNXZaUFVsMjVCaUJUb05hYnhLSEpMcjJ5NU11YysyT3NvT3RmL2ZkWTVw?=
 =?utf-8?B?Umwxd3Z6WmQ5Z2JSMXhQT0NuZ1k0bmxWMWRlWE9KRUVJb0RqQTd2T1k5dW5J?=
 =?utf-8?B?WVhQMmRkMkRiSDYwOUdydGt6MHlPRWlBb3FnNVY0dkphVzdmanNtRDVzZ3Ro?=
 =?utf-8?B?T25reWFOMVN0MEVWSHl0c1hubE54OUxHbHdvNFd5cXZjTmNtaVMwSGpRZzBB?=
 =?utf-8?B?Y0pZa3B4WFFKZitpd044bXJUUFA5M1YzMjlpYVN3cTZQallNKzF4L1pxcDIr?=
 =?utf-8?B?WFNhM3lFU2thd1ViYWMrWmwrejN1OGszeWRFWHVGWkJqMkF4YUpCUE5IZzRR?=
 =?utf-8?Q?tMFGgm/RgwB7WIpL8GRwuqyjp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb9d9707-2e4f-408e-84e9-08dd9de7f063
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 13:02:45.4103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p9zQxQ/hu2KCmLOm5sqwEoQaG0+JB+b87AqZFv3AuiLU5I9WV8FCBGhnFTePO8UF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9518
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

On 5/28/25 14:33, Pierre-Eric Pelloux-Prayer wrote:
> Hi,
> 
> This patch looks similar to:
> https://lists.freedesktop.org/archives/dri-devel/2025-May/507653.html

Mhm, I thought that I have seen that before.

Why haven't we pushed that yet? Is there still some ongoing reviews on the scheduler side?

Regards,
Christian.

> 
> Thanks,
> Pierre-Eric
> 
> Le 28/05/2025 à 13:00, Christian König a écrit :
>> Adding some people who worked on the client name and client id fields.
>>
>> On 5/28/25 09:22, Sunil Khatri wrote:
>>> pid is not always the right choice for fd to track
>>> the caller and hence adding drm client-id to the
>>> print which is unique for a drm client and can be
>>> used by driver in debugging
>>>
>>> One of the use is to further enhance debugging for
>>> amdgpu driver based on client-id.
>>>
>>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>>> ---
>>>   drivers/gpu/drm/drm_debugfs.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
>>> index 6b2178864c7e..2d43bda82887 100644
>>> --- a/drivers/gpu/drm/drm_debugfs.c
>>> +++ b/drivers/gpu/drm/drm_debugfs.c
>>> @@ -77,14 +77,15 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>>       kuid_t uid;
>>>         seq_printf(m,
>>> -           "%20s %5s %3s master a %5s %10s %*s\n",
>>> +           "%20s %5s %3s master a %5s %10s %*s %5s\n",
>>>              "command",
>>>              "tgid",
>>>              "dev",
>>>              "uid",
>>>              "magic",
>>>              DRM_CLIENT_NAME_MAX_LEN,
>>> -           "name");
>>> +           "name",
>>> +           "client-id");
>>
>> It might make sense to print the client id first and then the name.
>>
>> Apart from that looks sane to me.
>>
>> Regards,
>> Christian.
>>
>>>         /* dev->filelist is sorted youngest first, but we want to present
>>>        * oldest first (i.e. kernel, servers, clients), so walk backwardss.
>>> @@ -100,7 +101,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>>           pid = rcu_dereference(priv->pid);
>>>           task = pid_task(pid, PIDTYPE_TGID);
>>>           uid = task ? __task_cred(task)->euid : GLOBAL_ROOT_UID;
>>> -        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s\n",
>>> +        seq_printf(m, "%20s %5d %3d   %c    %c %5d %10u %*s %5llu\n",
>>>                  task ? task->comm : "<unknown>",
>>>                  pid_vnr(pid),
>>>                  priv->minor->index,
>>> @@ -109,7 +110,7 @@ static int drm_clients_info(struct seq_file *m, void *data)
>>>                  from_kuid_munged(seq_user_ns(m), uid),
>>>                  priv->magic,
>>>                  DRM_CLIENT_NAME_MAX_LEN,
>>> -               priv->client_name ? priv->client_name : "<unset>");
>>> +               priv->client_name ? priv->client_name : "<unset>", priv->client_id);
>>>           rcu_read_unlock();
>>>           mutex_unlock(&priv->client_name_lock);
>>>       }

