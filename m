Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9DD9F4B6D
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 14:01:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1ED10E1E2;
	Tue, 17 Dec 2024 13:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i2u6g7Ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26FD310E1E2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 13:01:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tkAZshSkoC9wcXTfZp7Xehe7TA4b6j4PsYJrd8Xh/Tq6M45vnIZyVtC03TU9EyB/VCK4DdAMMK12W+TIKr8j9aHGdg9xvWKd++EAEKQN6kqLwrz+U+CKp6oKe73OqHXhQ0oXTNc85dfcLFPq1lRZQib5eJAk1No1Axhxb/NeU8LKQEATsf9thcnwLCULEYO73SqEBglAPJEy43cMsFvAxk+4nIWrh21ycNMflqQjJttsvImBP03+SIFS9inlplJJt6UVcqoITAO0PItDZBIMg/zKjZ8fV5gJDMtD+NOLzG/YmqQ56TBeVeHVmLIoz3WFXL9mBIgMIL/S7urwzBpRLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=io0eNmLgyWF/XQhFOwdapkzq7xrad/5o+SL2QlhwwF4=;
 b=oaA7JUaIzyLtmIr4747iiZyrlf+QfXDFluIWc4xpTNpX4l3L9uoEc/p/EkW+ay98MH165uB/v9FLAVzkppICvJc0TnHuVrSPTyGuMqa27RoWHS3avw1eVLhjzJuAYohnFaGKGPhwxTdJYPusT6bcKZBeS4BkeA6acGBVt4xQMfsXHAIdjiHPuZxPC23ND0W8vD8dZHlX514whY5SkTHCFofgZArsjqGPFgkjhQ/LQe5B/N4ErZoRBcUR+IenZSgOp+Pk1qxvha5lcPFnTL6cmjSOKCUhKqGaKvugTH0cYSPcvOZuhD2GX31BH2KUHKHWk4C40eMYAaZX5+V+lsuI3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=io0eNmLgyWF/XQhFOwdapkzq7xrad/5o+SL2QlhwwF4=;
 b=i2u6g7MaxC1x4DjHJkKtQBa/3LdvCAyaNS8shPRdppzvSJD9IGcHDHDixD5r2Ut1+M5/nrHPjSwVsHISuxjtiG6Yeaqy08szfZKR8AA/fTIXs1dWjheMCv+NXwPTy4+qCPZxCMwY8kzqksdG82as9mIpnPo37tG8pSI365C+IZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4035.namprd12.prod.outlook.com (2603:10b6:a03:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 13:01:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8272.005; Tue, 17 Dec 2024
 13:01:33 +0000
Message-ID: <d878121e-df17-4eee-a4c3-09b7b2973721@amd.com>
Date: Tue, 17 Dec 2024 14:01:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Melissa Wen <mwen@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
 <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
 <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
 <479af980-8895-47c8-87fd-cae9a32b454e@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <479af980-8895-47c8-87fd-cae9a32b454e@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ce6caa-3017-4d58-ebdc-08dd1e9aee6e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzlMT2NVY0d4UTBCQ01zMFdzYnM5WUY2Ylp0WmlFZUh4Q0F3c3hGL3NLQTdw?=
 =?utf-8?B?RGg2aTczYzRxcWJmSW9FNkF6cWdteGVvQlppMGlrWmZjUEM5RUMyU045Tjgy?=
 =?utf-8?B?c21penNPTGVRR01VcUJPTFZNdUhRQTdjN1pCTm1xbS83QmpKYVl2RHhCQ0NC?=
 =?utf-8?B?ZXpPdGZIT1FGTmdRV2lyQmY4dnY0eXZHNzhWbmVmVU9Yb25VVzdNang1VGNH?=
 =?utf-8?B?bmJaQXlETkthYkIzV1M3Z3BUcDloWnNkeVEzRTZDWG5MSDVQQXBNRFZrL0Nl?=
 =?utf-8?B?aElRNENuTTFKUzlZUXpKSWNCRWJGdGJzSHZRK2VOMkMvK056WUtrcGF1bm4z?=
 =?utf-8?B?bzlSUzI2MExLRS84RDhlcnNsS2VrME81WXBnZGJOUWY5dUI2bzNoVUs4ZWJI?=
 =?utf-8?B?eDFpdkFLRCsrRk9SbUdaaEVsTmRKZnNXZVFsZkpLd2VMUVpsRGpPT0RyVkMx?=
 =?utf-8?B?cUJZZ3dhdVoyMXhiOUszcFk5Z1J6QjVRYUI3TmFTRzgvRXFtcnlpRWZ6ME5P?=
 =?utf-8?B?VndWTGJjNjJ0b1QwcTFEeGZiTU85dFRLUC9EWm5TZGdVK3VWbjNGQXdjRmVP?=
 =?utf-8?B?VFZoOGE0Zk9Xbmw5K25IQm5MTVZqb0V0NlFaOS80VTIyS0l4RGZmMVo2MC9S?=
 =?utf-8?B?WlF0Uit0ZDZrekFldU1rbWJkU3JwQ2FjOGVlNmxXdUNYbVNSY0trSXM2OEdW?=
 =?utf-8?B?TGpHSVAzcGpseVR6cUxIWmxabjEvZGpYNjVqa0RyUDJQenpOZlVUbzB6cEFK?=
 =?utf-8?B?dXhDMnlBWnR2OXFiTHZ6ZVhOT1hpNVJrV3h0VWxzTkxmSE5PdFUwMFpCazkr?=
 =?utf-8?B?Znl5VGN0QzRiZWV3Ly8rMldaRkFBSUJjN2JrQ1ppSnpXVkdkZmxEenhqVjN4?=
 =?utf-8?B?N1VWbW02dkpTTEg4b0I2eTA3RjNscDM2MXZHb2RGaE92elUzQUIvYjdFNUVj?=
 =?utf-8?B?biswZDRQSTJJTkpZajNxZmp6RDVodzRTckxIZWlkUkFWNTdGRGp3amZLamtE?=
 =?utf-8?B?Q1VWVE9wWFpjclBCZWc4bWNCd1J6SU9WL0pPQ205bGVHZWc5anpJbkFQSXN0?=
 =?utf-8?B?b0NPc2Vsd0ppUnlGcUNobHlRZGNvK2xrN2JaT1VDZlVQSmF6cGpXQnl6MU1P?=
 =?utf-8?B?TEEyZFhyU1V6Z3VyaWhOMndZaUJUNzB6TlQ5Tlprd3BvcU1RL2VYWktxbmJB?=
 =?utf-8?B?bE9HQXFTTkxmV0RPWnM1QVlZcFd2L2crMGtWLzAwbjN5WWpKZWhjdWFtQlV5?=
 =?utf-8?B?VTdwWGNWN2s2Y3FIU2lndXgwQktmODBNYTVBK0VqeG9qWU9KNEZWM2Q4Sy9l?=
 =?utf-8?B?bkNSY2JvMi9uQXJ4MElyQlM5a3lwdmVKWnU0MGVYWVBUek9SbWdSa1c5WG95?=
 =?utf-8?B?L1NvOFU3eC9XMjVOekJXSnVFem5LU0I4RGx1bFlxbVhJNnpRdi82RTFFWkN6?=
 =?utf-8?B?OVBoNHpYQTBjQkhFcGVsTUljdDd3ZFF6R2E3SzdZQjBZWXlPMWpRZGRmTGlF?=
 =?utf-8?B?YWgwOHlnWlFZRTcxaklpdGRsa1ZtWmluM28wbzNMakVCdkdZME8zMWdMcHNy?=
 =?utf-8?B?STZ0T29PUHhpa2k5YTJFdnYxenNpd1lJZTJ4bWVsUkRWcU55L1pFZWtoWGxP?=
 =?utf-8?B?ajhwTVdrUWIyaGpmUXRlc1BGNXAxR0FoMFZwcFNTZmZLZUhXbFdtUG45cDJT?=
 =?utf-8?B?dFdCMnVONk0rdkpoNGNzTWxxQUVYQXNoYTgweEg0YkN1NnllWFFBVnJhT016?=
 =?utf-8?B?VGVha1VjZWw1ODBWbElQRzBOOEFHbXdYQmFUUmtzTlBVeDZSRlJtL3NZS2Ry?=
 =?utf-8?B?WW1rZWdlNzZsVzl1R1hkQ1RETHBaeWd3cks2dVlXejZNY05UNjk1eTlvb0tr?=
 =?utf-8?Q?0MbdifNz3EYxi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXB5ZUtKNUxGemo2Q3paNU5GT3Q1SmlvM0JqUzNmTUVuVUUydGRGbW9PU2s0?=
 =?utf-8?B?ME0wdHZsaW1vNTJiNGpSL1h0QVNFU1pNQzhVdUh0c1lRakJwZnJmejlIUWFo?=
 =?utf-8?B?TDJvSitIc0NCcUdHTHh0eTI0OFoxZVdDL092MDgrd1owQkhrUVlKbnEzditk?=
 =?utf-8?B?QXlPdDBVQ3ZmbXZZYVlSeS82dVJsdGV4WFc0T2d0eHlWQXUwZHc1TFZLMlVs?=
 =?utf-8?B?TmtPR3p3Rmk2bGFtU3ZXMExTcmdnTWxRQW1CdFpxYTdGM0pnbG9ZMFA3TkZR?=
 =?utf-8?B?SG56NVp0ejZaRVVqaDVMQzl0bDVBd1RoczBkMTEzQjhnOFpNZGZ0SHNmN3dR?=
 =?utf-8?B?MzRad01WZ20razN1WURuMm9IaVc1TGpyRE0wZ2NmY1RVMEVDYk1IR2dNTHUw?=
 =?utf-8?B?d2xLTjZiTjlIbkkzRE9hdHpuVnBvR29rdUZJU05DTGFyZzBlYXZtdnpTZ1VQ?=
 =?utf-8?B?cnJzUkxGWG9pNEp3TnkrckZ1Z0tETzV0ZXNPNndaS2d4dnI5N1RtTXJMWS9r?=
 =?utf-8?B?R3NQMjJTc3E1ZHpaSVNDOEhoTGp4UkJlcXR0OEU0WnZDR2lzWU1ER0RGVXFx?=
 =?utf-8?B?bVgyOVdQbDhXT09uZHhOR2xndmNlNHlsMEJCNHdFdWZMZVhZVHhWb2RubnQv?=
 =?utf-8?B?MStRUTVQMWRaSnVoaVBXbFlGcmNsVGxkZTBoMnRvYm9idktqUGdWUWFUd20r?=
 =?utf-8?B?N0hwS3dVWC9WMFBYOStUeVhjVE5EaFJqV3BUNFAxVlNXTjd0S1p6SlIrbklK?=
 =?utf-8?B?TkY4VlBnNXlVSnByN2V5QTdIMWJvTjE5OWZhTDR6T0FJRFNLODJOdUVSbkZp?=
 =?utf-8?B?YVJSYkFTWXoyUy9VbWtMYzlFYjg3cUVRSWhORDhId0VxWnBhcm1DRTlQajEr?=
 =?utf-8?B?S0prRkJzQ2kzN2xQajJMMjVFVnNybjFhWjVCeEJCcnFqYVlEN0VFZW96OFBq?=
 =?utf-8?B?S3lHK1hJZnpCb0dFWGkxemJyeHF0K1BaOW1wdGlHRVM0U1ZpYm05Z1VCcEZZ?=
 =?utf-8?B?bjdWaDB6bGd2OXZuTFd6K1pLMG44WCtXQUJ3VW9aMmZqRTdXem9LNTBmMjRh?=
 =?utf-8?B?eVdKbFljMS9tQjNraW9QbVcxZXhDL2s1T0NtSlB1b3NsamZUcklLbXN3T0xE?=
 =?utf-8?B?TUFEdVBBcVhvR0owK0F2Y0VhcG03dlVBN2tad2dET1NNMS9EWnVlQWttTmgx?=
 =?utf-8?B?RGpWcVQvMDNtTHJZdlJ6bDdKT3Q5MkwyRzNVSDNZNHRYWTFrQ2ozc0swUG9t?=
 =?utf-8?B?am1FMWY1TG9SejEwbWdHeGJ4akhTKzJTd2tzYU0wOTJaaTRxMHh5Q0VFa2pJ?=
 =?utf-8?B?QjJabmhyWmR2THkremIvWXFsbVJacXZqK2MyNHJkTEIweHZ1bUhpeThFRUdj?=
 =?utf-8?B?cjdVNjBRcyt6bVMzQlQ2L3BRelEzR1cwMzd5Y29XNmpsS1RTOXg2RTVMRWo3?=
 =?utf-8?B?L0cxSTJ2b1pvWTVnVG56MlhZVzlyZUtJQ3ljUUNxVFo2cXB0TE4zVi92MHdP?=
 =?utf-8?B?YkREQ1FIeDhWTHJsNktzZ0JhcTJZR3R1RCtudGw3QU5lZ01XS3Fnc2tnQm9h?=
 =?utf-8?B?V0xnVEJmQlVoT2ZrQTJkRUtuSVBqeUoxQ2tOL0lYNzByQ2lSbTZ4NWRBREV4?=
 =?utf-8?B?c1ZKNFVuNHgxQ2dmelNtOUFBR0FLWThOTmNWUzkxUGMzQVk3S0NSUSs0bGlF?=
 =?utf-8?B?dWo1eSs1dys5dEtpRnZwYUxrOFpsM1k5aW5adWswRWltekNpVWVpNkNIZ0V4?=
 =?utf-8?B?TFd1czlwVmhOSis1dmw3ZUJqalJqbFB6bjhiZG42enBydnNxTTFUUGY4T1R1?=
 =?utf-8?B?bzFhRHdxUFFSUklwVkNJTWI5TnFaa2VOcXJBUXdWZVVjV2g0YUlxTGwrZWlP?=
 =?utf-8?B?bE9ETEpacERxUXVmOGgwWVNSRnFFei9DWFlJbXExZUllbFN5MTBJTlBBS3lo?=
 =?utf-8?B?Y1U3aGZlQ25zOVFqQ0NxU29qYU5oWkY4STFLQzhrOVFnYnEzSUVHZFI1aStT?=
 =?utf-8?B?K3VJeGpJbHFwTnRCQnluVFVrRlYrNXYxeFhlbFFjNEk5T1VFNXZld2c1eGlh?=
 =?utf-8?B?TFZ4OStTUytGZng2RE45R0VSNmhTMjYwanR3NitvNStYRUIzODVJVkFVV3Ex?=
 =?utf-8?Q?9GwqsHHxa40vl5eIJUygft39z?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ce6caa-3017-4d58-ebdc-08dd1e9aee6e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 13:01:33.3014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w2qF0QlVqs+3jDAS5WrI9lYVUUr32AJnq0JmIAdhnwxjT/g3ouIkWrwr/6ubEpOU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4035
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

Am 17.12.24 um 12:09 schrieb Maíra Canal:
> Hi Christian,
>
> On 17/12/24 07:30, Christian König wrote:
>> Am 16.12.24 um 20:08 schrieb Melissa Wen:
>>> On 12/12, Maíra Canal wrote:
>>>> VC4 has internal copies of `drm_gem_lock_reservations()` and
>>>> `drm_gem_unlock_reservations()` inside the driver and ideally, we 
>>>> should
>>>> move those hard-coded functions to the generic functions provided 
>>>> by DRM.
>>>> But, instead of using the DRM GEM functions to (un)lock 
>>>> reservations, move
>>>> the new DRM Execution Contexts API.
>>>>
>>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>>   drivers/gpu/drm/vc4/Kconfig   |  1 +
>>>>   drivers/gpu/drm/vc4/vc4_gem.c | 99 
>>>> ++++++++---------------------------
>>>>   2 files changed, 22 insertions(+), 78 deletions(-)
>>>>
>
> [...]
>
>>>> -
>>>> -    ww_acquire_done(acquire_ctx);
>>>> +    int ret;
>>>>       /* Reserve space for our shared (read-only) fence references,
>>>>        * before we commit the CL to the hardware.
>>>>        */
>>>> -    for (i = 0; i < exec->bo_count; i++) {
>>>> -        bo = exec->bo[i];
>>>> +    drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec- 
>>>> >bo_count);
>>>> +    drm_exec_until_all_locked(exec_ctx) {
>>>> +        ret = drm_exec_prepare_array(exec_ctx, exec->bo,
>>>> +                         exec->bo_count, 1);
>>> Hi Maíra,
>>>
>>> So, I'm not familiar too drm_exec, but the original implementation of
>>> vc4_lock_bo_reservations() has a retry of locks from the contention and
>>> I don't see it inside the drm_exec_prepare_array(), why don't use the
>>> loop drm_exec_prepare_obj() plus drm_exec_retry_on_contention() 
>>> (similar
>>> to the typical usage documented for drm_exec)?
>>
>> The way how drm_exec and drm_exec_prepare_array is used seems to be 
>> correct here.
>>
>> drm_exec_prepare_array() basically just loops over all the GEM BOs in 
>> the array and calls drm_exec_prepare_obj() on them, so no need to 
>> open code that.
>>
>> drm_exec_retry_on_contention() is only needed if you have multiple 
>> calls to drm_exec_prepare_array() or drm_exec_prepare_obj(), so that 
>> the loop is restarted in between the calls.
>
> But doesn't `drm_exec_prepare_array()` have multiple calls to
> `drm_exec_prepare_obj()`? The fact that the multiple calls are wrapped
> in the function makes a difference?

Yeah. I know, it's not so easy to understand :)

What drm_exec_until_all_locked() and drm_exec_retry_on_contention() are 
basically doing is nicely wrapped error handling.

In other words drm_exec_retry_on_contention() does a "goto 
*__drm_exec_retry_ptr" if it detects that we have a contention. But you 
can't goto from a label in a function back into the caller.

So what drm_exec_prepare_array() does is to abort as soon as it sees the 
first error:

                 ret = drm_exec_prepare_obj(exec, objects[i], num_fences);
                 if (unlikely(ret))
                         return ret;


And in the caller we have:

drm_exec_until_all_locked(exec_ctx) {
     ret = drm_exec_prepare_array(exec_ctx, exec->bo, exec->bo_count, 1);
}

So the loop restarts after drm_exec_prepare_array() anyway and because 
of this using drm_exec_retry_on_contention() is not explicitly necessary.

Regards,
Christian.

>
> Best Regards,
> - Maíra
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Also, probably you already considered that: we can extend this 
>>> update to
>>> v3d, right?
>>>
>>> Melissa
>>>
>>>> +    }
>>>> -        ret = dma_resv_reserve_fences(bo->resv, 1);
>>>> -        if (ret) {
>>>> -            vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>>>> -            return ret;
>>>> -        }
>>>> +    if (ret) {
>>>> +        drm_exec_fini(exec_ctx);
>>>> +        return ret;
>>>>       }
>>>>       return 0;
>>>> @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>>>>    */
>>>>   static int
>>>>   vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>>>> -         struct ww_acquire_ctx *acquire_ctx,
>>>> +         struct drm_exec *exec_ctx,
>>>>            struct drm_syncobj *out_sync)
>>>>   {
>>>>       struct vc4_dev *vc4 = to_vc4_dev(dev);
>>>> @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct 
>>>> vc4_exec_info *exec,
>>>>       vc4_update_bo_seqnos(exec, seqno);
>>>> -    vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>>>> +    drm_exec_fini(exec_ctx);
>>>>       list_add_tail(&exec->head, &vc4->bin_job_list);
>>>> @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>       struct drm_vc4_submit_cl *args = data;
>>>>       struct drm_syncobj *out_sync = NULL;
>>>>       struct vc4_exec_info *exec;
>>>> -    struct ww_acquire_ctx acquire_ctx;
>>>> +    struct drm_exec exec_ctx;
>>>>       struct dma_fence *in_fence;
>>>>       int ret = 0;
>>>> @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>       if (ret)
>>>>           goto fail;
>>>> -    ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
>>>> +    ret = vc4_lock_bo_reservations(exec, &exec_ctx);
>>>>       if (ret)
>>>>           goto fail;
>>>> @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>           out_sync = drm_syncobj_find(file_priv, args->out_sync);
>>>>           if (!out_sync) {
>>>>               ret = -EINVAL;
>>>> -            goto fail;
>>>> +            goto fail_unreserve;
>>>>           }
>>>>           /* We replace the fence in out_sync in vc4_queue_submit 
>>>> since
>>>> @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>        */
>>>>       exec->args = NULL;
>>>> -    ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
>>>> +    ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
>>>>       /* The syncobj isn't part of the exec data and we need to 
>>>> free our
>>>>        * reference even if job submission failed.
>>>> @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>>> void *data,
>>>>           drm_syncobj_put(out_sync);
>>>>       if (ret)
>>>> -        goto fail;
>>>> +        goto fail_unreserve;
>>>>       /* Return the seqno for our job. */
>>>>       args->seqno = vc4->emit_seqno;
>>>>       return 0;
>>>> +fail_unreserve:
>>>> +    drm_exec_fini(&exec_ctx);
>>>>   fail:
>>>>       vc4_complete_exec(&vc4->base, exec);
>>>> -- 
>>>> 2.47.1
>>>>
>>
>

