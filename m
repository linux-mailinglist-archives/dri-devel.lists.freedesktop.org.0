Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D1C5F031
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F2210EAE9;
	Fri, 14 Nov 2025 19:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TB3d71Xx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010008.outbound.protection.outlook.com
 [52.101.193.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8FE910EAE8;
 Fri, 14 Nov 2025 19:17:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ez5pzydNL0nxQbTnBSuzlrFchqanvRbCtrHKEdSKkwjAlWJCE7kQRXmsofy4a2PhfbCiUYzJE8sHmkZKb08NHkjJdeqtRcbYPq+rYSFZiTg368lMFzH4WO6rPzkbUmIBhexJVrds0TbBQCihPsavMxLuLuKeQCwK6UFpp98ndpnH7ZmXeboOP8uukBSnf36350wRT20VmC0vf/QUuPFycnJQVxG0ejwewzs0VA7uTjyCk7REvsyfyWcEPIe8jdQ6Ds8PwRw+YhWYduYUiwnnYIHUmrt7GbleQYAsSAmCrMq+/InzZNHX5Rh8oX9AhUSAYKHp/gvSssbhbf9wPGTdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Ya/2Azf/IYes4+y32udC++VyQnZAmPDsIIc4li+/fs=;
 b=PuqsRNuvhQGpqSNVOtyKRMgiQBiKg7SBzdewIgmuSMNE9dsZr0EsrSqRUIMlAwKkhlgsZZkoPYWlE4ivZtwc9Ll8hqNYuDloousOF8H8VumRvZfgCWU55sFUvvl4M+BAKhFmLVoKs1co8h5rrvkJDA+jwIUZSMEojUwQvlkkEBK7z5phftMnJGymAz1lsAaVAHKbYNPstKCDr0lmfZrZw1YUxWYcHezk1wEc+fW5wg819DY2S7fnK4crmpYCWzQMN9Pxgm5KsHtsB49nnoPAxIG3kCr7DeR3pBVZT/LjtoSPBwpu6RRDHIuRsbT7Xdqj0xsEO9Eq/9J4nBGiZizG/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Ya/2Azf/IYes4+y32udC++VyQnZAmPDsIIc4li+/fs=;
 b=TB3d71XxE4RkZKiCSxiLP90EBtmh8HgKqxgrW0kx0IA/O48CnFira3wobDltNUx86Q8G0BTC4l5GxcXotflJeB3Z9tzz51YBURSyWytQyYihL6NVhy23ifiMSUqCboJEt5198sFCQHnulO4m78etFNHKSLtEgncsgB4K1ZMkT8k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS0PR12MB9726.namprd12.prod.outlook.com (2603:10b6:8:226::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 19:17:28 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:17:28 +0000
Message-ID: <e934ece8-d70d-44fd-abe6-fcecae8abc85@amd.com>
Date: Fri, 14 Nov 2025 13:17:25 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: Move adaptive backlight modulation property to
 drm core
To: Jani Nikula <jani.nikula@linux.intel.com>, Simona Vetter
 <simona@ffwll.ch>, xaver.hugl@kde.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Harry Wentland <Harry.Wentland@amd.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>
References: <20251112222646.495189-1-mario.limonciello@amd.com>
 <83aa8a816cf301085a3e3638238f8fba11053dc2@intel.com>
 <449ee5ba065e1ceee8f7a04038442cff24772df9@intel.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <449ee5ba065e1ceee8f7a04038442cff24772df9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR05CA0005.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::7) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS0PR12MB9726:EE_
X-MS-Office365-Filtering-Correlation-Id: 91a8c605-a007-48c3-4aa3-08de23b27368
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFU1Y2E5SUIwSjZ6a2hLU0tHc2dTTnU4NEhTODZIUnBCWkR0KzNVZ2d5TWlW?=
 =?utf-8?B?RzBQdkdSK1g2RTErTWY0SVdkOFVFenpiWGVVeUtVNWFWTGdwQUpVTFVSanZm?=
 =?utf-8?B?ajlMakRhMEtSWC9EbnA4MVlUMXo4RnE2R2E2ZUYyWmRabnhNam1JRWtuU2pm?=
 =?utf-8?B?Nmk2TzA1ZG5FdTJZbGF1enBYenNDNzl1S1pqVzVZcG5zbVRhcU9zb0VkaWZl?=
 =?utf-8?B?WjdtcVlQY2huTThVc3V2NGNUcVhWNjQyanNqL0Zqd2gzZ0w0RWk5K1ZLWEpO?=
 =?utf-8?B?L0JJQmJZVHh3SVhYNllKRzV0UFlqd0FJQyt0L2h1OExKRDM5N0FUbjFYN2lM?=
 =?utf-8?B?ckFOTStVNitoYk43QTQ3M0dQRElqZ0NOLzZabmtrQ1hFMTRMTlp0czVKN2M5?=
 =?utf-8?B?OTRoRHVqbzlOZ3hBOW45cjNVWVZYSWsvY2pnUHhZdGpCeCtBa21PSzBKZUxk?=
 =?utf-8?B?Ym5ZNlhsN3djSzVsL0VOUXg3dzVJYUh3aUF1NUNGMi9tbHJhemg2MjQxaVky?=
 =?utf-8?B?L3VZUjlTM0VHVUZwcUcwTVk0MGl0K1p0RGZCcUxXVU5mK2ZIYW1LUzV0eXU1?=
 =?utf-8?B?Z0FPaVVNMHFENTBtZFBibi9LZWZEM3hQSi82ZFdhZ3pXUjhwZnRaOXlyUmFW?=
 =?utf-8?B?YkUwVk91QVBOY0hCZlZRWnVJNkMzeERxVTZjdTVPUTJHdHdham1WaVo5TW1F?=
 =?utf-8?B?Q0lrdnFCT3dlVDVlcHJ6WUxQa2tvblRacm9ia0c3QTFrd0pzK1pXV01FWTdW?=
 =?utf-8?B?VUorUnAxSnFBeW1zUklZWEZkMEJUcERlaXY0WnV6c21ObE5PUmV1dWlLaGhl?=
 =?utf-8?B?dUFITTdvaDZDMS85V3ZKckN3MDV1SzNHQzhxa2dscS9MRERySEw3WHp1UVpp?=
 =?utf-8?B?WHNVRmRINUxDTkZycmVDcUR5cDZpMDQ4MG16RWU5RVhBSkVWTnlNYkd2emts?=
 =?utf-8?B?RXFLNkZZeHRwM1ZYQjN6MnZxcCtoaXFtZGxTcFJvbDBIc3RCb2JUWmlUZ3Jt?=
 =?utf-8?B?YmNldnR1UnJ6eGpDS3VVZU1mMjJjSTBNckI1N2U0Q212Y3FBRnpPYzA5N1Fy?=
 =?utf-8?B?MUJ6RFdCQkpoN2YxaDFMTzJ5c28rbkwyQ3J6aVUwMjFDajVQRHRla0NrV1NM?=
 =?utf-8?B?c01oS3NGeSthNzdRbU1ROEREOEMzWDAva3d5WVpQd0U4MkFLeSt4TU43T0t6?=
 =?utf-8?B?cUxZbFR5VUd2elpzM1ZQV296YnQ4bVZHYXNoeFljSG54UmVkWUVxOVc0WVBV?=
 =?utf-8?B?d1hSbFhaYitIak5UVy9hQ290RWMvMk5SZU13c2NGR240aTJ4VytCMm5RcEdK?=
 =?utf-8?B?bmh3R2MyQjMwcVlvY2c4V3Z3bDNkK2lhVEpvTTBPZGdOeFdUckMzNFB3Wk9j?=
 =?utf-8?B?UGlQbyswTkx6V2VrMm9pTmxHUFlHaE81c3d6bTN1N0Z1MHVUZGFFcUZjTm9E?=
 =?utf-8?B?Y0dCYTNoLy95bm9LVWloZ2dkdDRLR2tjVnRLWDRoRGZxNldYUnFjTG1aWG5P?=
 =?utf-8?B?NFZEelVFRUM2S0JFSkd0bjdXSkVzOVRmdzdGZ2IyTkJSbzNGRlRBRlQvbzkz?=
 =?utf-8?B?ejF1MTJMM2Z4MlFCWHM4T21vRVo5QnZaQUhnSERzcExlU3JxV0NRUnU4MU1s?=
 =?utf-8?B?RG9VbFdZb3pRdFErMmVOTC9UWHJjZDZsVlBucTlNc25xalZvRHlETWRWT09Z?=
 =?utf-8?B?WkpQSWxKSXU2U2xCL2hpbDBnUmtvWVNRTHo5SGF4SVg0dFhoTXFMcjYrYVg2?=
 =?utf-8?B?enpDRkptc2FreTQ5MFpqRnlreHJJTHM4cExmbExGNDlKNXBtYVJSa2g4Z1kv?=
 =?utf-8?B?aG5oUHFsM09qemJJMFJKOHQ5aUw5RmJIMXVBTVo2cTZRMDNQc1VGcnZjNkNr?=
 =?utf-8?B?dVFxQXBtNHMyZUlHWTU3MFkwcmFkanF4VHpQM2VnRFRidElyemY4L3NCc2hv?=
 =?utf-8?B?ejc3TG0xZkVpZ01ZTlB5RWhYTU5KUGtEWWozMFZWVE5GcjhKM1NONmcrOUZW?=
 =?utf-8?B?clhrem4zK1lRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmpmK1l4L2VvVnFWR0lGL0hOb0h5OTJRYVo4dHErRitnM0V6RjdlaThnaGkw?=
 =?utf-8?B?b25Ra1EwdlVSRW0xZXpaUENZTXJ0U2d6a0dMMlJKMWVpbEE1Tld4S0lKMlo1?=
 =?utf-8?B?UFBlT08xYmpBaTZjaDVUU1VlWmtwODdEbXZ0SXo3ZG1yYXYra0hFQ2ViZG1y?=
 =?utf-8?B?SUhVVXRVTXZTOFE1SWkzR3RhM0g2eXVnMWUxckxlYnBqbGRheTdxd1hpaDBC?=
 =?utf-8?B?Ulp1MkNEaWpBWmljcG1UUlMzWEhIaUlmRTJqcnQ0aDZIT1hPTGZ5Z2Fsc2U0?=
 =?utf-8?B?TVpIRk9TdlBlZmRyT1IvQlBMZnNlVCtmaEpoZno0RkJTdE5qdk10ZmRKdlRX?=
 =?utf-8?B?dmlTcktxZTcrNDJpNU0rUnE1akZNRWNjY3B3SjcxWTFCK1Avblp5c0dPSVp5?=
 =?utf-8?B?cmxqZndiZStYZDd2NDY3T05aemVheFkzc2ZZYzRQYXppQlJrTEwrVktxZVd6?=
 =?utf-8?B?UHZUNmk1eFhWMHNlTFZ0emtRbUtCVFlvTTRUZDVaaXpoaDdka1hId2tJZWlR?=
 =?utf-8?B?TmxYWVloVXZudHNuemRqSFU3L0RKSDkxZWc2MFBvUHV2ZGk2di8rQkQrb0Fv?=
 =?utf-8?B?MW1kN1c2U1RHeHFnN2pEbGdlQlZuakJ3bi9XOS8xOTdUOGpzMGV0OTJCUXl5?=
 =?utf-8?B?TU05a0FyWXN2aEFCallHT0JYWk11SDF3REw3cUlYYVNBc0NMRXY1amJQY2FM?=
 =?utf-8?B?NnJ0NHlYVVRFZDYwMUc3c2wybGhjbWlBdG9jandKdmI5Rkh5T1duZDN6c2hw?=
 =?utf-8?B?ZUUvTlplRmJGZTh2cDAreGpTTWlrRmZMVHFiVXYrVlQxczZPdzNqcithOUYx?=
 =?utf-8?B?bXNuTEJra2tOYzdhejdoOXhoUlkxeWIwaGp1dE9hWTFoSTZ5UEZ1WnhIcjBJ?=
 =?utf-8?B?RUNEcjFQZkprRS9CclJxYk5VQ0QrR0s4WFdRbCtzbEdLTzVuQmFubm01Nm00?=
 =?utf-8?B?dWdNcXdKRndQK0RrT1VOd0Z4YnFxUmJnUFBvUUJ4OWkwWkpQQU1nUDM2blNr?=
 =?utf-8?B?bVZwT1UzNXF5d2RsYmIzdXJwaFBSWTROWEVFVHMzeVJuQjNvd2Z6enhCVWR5?=
 =?utf-8?B?bzFEUHUvVlNtK0NrMnFZdloyMzBkMmh0eTdGajlWc0dJTTQ1cmxmdEdnNDFl?=
 =?utf-8?B?L0xmWlpHaFRxZ0RWZkdIejJHZG5Ta3hGdjlBZTFqaGxDVjBZUkptajhZZ0cy?=
 =?utf-8?B?UVlGUGE4VjNoQTZla3VCNjg3eHpDc1I2WVVrZmZ6QXpkZkZLdityc2dlYjB3?=
 =?utf-8?B?ZTZYUWp4YUoyY3JQYWJGeFlBNUpGcm9POGVEaUtQSnhvRGF6TThvUHpzMEc1?=
 =?utf-8?B?aEVxVmVWZDhUTEpCdTlBeFlxVWpEcURkUUp4QW85cGxPNGdQVGlkc29VTlNq?=
 =?utf-8?B?SEY3VXRXSmpBbGZ5czRZQVlaYmg4Y1h3RCtJNStnd2lvSEpsaFZMeE96aDhQ?=
 =?utf-8?B?b1dMb3kvTzRsbUlnRENrbVdDNjdTalAwYzg0QmcrY3A3V2ZEZGRFajVIUWpU?=
 =?utf-8?B?OHBKYmJFRnY1VVRzR1hlK2tjdm1pSno5b1ZWZnVSNDJ2a05Semc3Y0hpbVBV?=
 =?utf-8?B?dkF4TDZnU0tBY3RWOHA3V0RHRitBMmpiVWVxR2E5T0JPZUdqS292aHpwcGxw?=
 =?utf-8?B?RTZXR2RERHR1YmpGZjhrOGFTQnJSNGpYdHp6a2MyOTNrVzNHc2cxUnlxSUpw?=
 =?utf-8?B?blUxK1JKd3hsQXZyYTJsVGNWTEx0VW5QQi96ZDFON2JudzF6OTFiSWNiVlpp?=
 =?utf-8?B?SXZUWWQrVjkzRHdyRDhSZXhxRkpOc3FGNVdIc0cwRkZFb3NRTXFSVHpzM2d6?=
 =?utf-8?B?M011amdneW5LMGVMRnQvL21abXFtYlQ5bWt2eDlOMXV3M1ZNMCtrdFNReXhX?=
 =?utf-8?B?YlowUHh3TlRoVjRZVmtJTDY5RnVSRTk5bUQvdEJGaGdmMUFEYnVJSm44S2hD?=
 =?utf-8?B?ZWdXK2dPUnhyUlRwOTE4WnQvKzRCU2hWTkxNNDR3U1dUdkJNcThrSkM5aFJC?=
 =?utf-8?B?Qk1BSFFPbG5SY3h3SVpvTjJWdks2ZC9NRDI2Z05XUGN1VXNuMlU3NWRjNjFt?=
 =?utf-8?B?bE44UzJwbXY1TmlXaDVvdmVMbm9kRU1HRjc0SHEvczFRWnBZaFA2VGZWcWNm?=
 =?utf-8?Q?PvO0wz4pWJ5wwFD0epRhcb9X9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91a8c605-a007-48c3-4aa3-08de23b27368
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:17:28.2272 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wF3QrdpYMN+op2t9QP5yK80D9rq2vN9qIRkmz6P8st8K++g2NA2zjfhwGDh5DIwFvSbb/XsFCsGD5RphqKJCpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9726
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

+Xaver

On 11/14/2025 2:39 AM, Jani Nikula wrote:
<snip>

>>
>> So this is basically Content Adaptive Brightness Control, but with the
>> technology ("backlight" and "modulation") unnecessarily encoded in the
>> ABI.
>>
>> You could have the same knob for adjusting CABC implemented in an OLED
>> panel, controlled via DPCD.
>>
>>> + *
>>> + *	sysfs
>>> + *		The ABM property is exposed to userspace via sysfs interface
>>> + *		located at 'amdgpu/panel_power_savings' under the DRM device.
>>
>> Err what? Seriously suggesting that to the common ABI? We shouldn't have
>> sysfs involved at all, let alone vendor specific sysfs.
>>
>>> + *	off
>>> + *		Adaptive backlight modulation is disabled.
>>> + *	min
>>> + *		Adaptive backlight modulation is enabled at minimum intensity.
>>> + *	bias min
>>> + *		Adaptive backlight modulation is enabled at a more intense
>>> + *		level than 'min'.
>>> + *	bias max
>>> + *		Adaptive backlight modulation is enabled at a more intense
>>> + *		level than 'bias min'.
>>> + *	max
>>> + *		Adaptive backlight modulation is enabled at maximum intensity.
>>
>> So values 0-4 but with names. I don't know what "bias" means here, and I
>> probably shouldn't even have to know. It's an implementation detail
>> leaking to the ABI.
>>
>> In the past I've encountered CABC with different modes based on the use
>> case, e.g. "video" or "game", but I don't know how those would map to
>> the intensities.
>>
>> I'm concerned the ABI serves AMD hardware, no one else, and everyone
>> else coming after this is forced to shoehorn their implementation into
>> this.
> 
> Apparently Harry had the same concerns [1].
> 
So let me explain how we got here.  At the display next hackfest last 
year (2024) we talked about how to get compositors to indicate they want 
technologies like this to get out the way.  A patch series was made that 
would allow compositor to say "Require color accuracy" or "Require low 
latency" are required.

https://lore.kernel.org/amd-gfx/20240703051722.328-1-mario.limonciello@amd.com/

This got reverted because userspace didn't have an implementation ready 
to go at the time.  One was created and so I rebased/resent the series 
earlier this year.

https://lore.kernel.org/amd-gfx/20250621152657.1048807-1-superm1@kernel.org/

Xaver had some change of heart and wanted to talk about it at the next 
hackfest.

https://lore.kernel.org/amd-gfx/CAFZQkGxUwodf5bW0qQkXoPoz0CFFA1asJfUxFftMGgs5-VK2Hw@mail.gmail.com/

So we talked about it again at the hackfest this year and the decision 
was not everyone can an octagon into a peg hole, so we're better off 
re-introducing vendor properties for this.  So series was respun per 
that discussion.

https://lore.kernel.org/amd-gfx/20250718192045.2091650-1-superm1@kernel.org/

Userspace implementation was done and so we merged this for 6.19.

https://lore.kernel.org/amd-gfx/CAFZQkGwLWcyS0SqCHoiGsJd5J_u4aBJ0HMV5Bx3NknLdLkr8Uw@mail.gmail.com/

Then Simona suggested we need to make some changes where the propertye 
should be in generic documentation etc:

https://lore.kernel.org/amd-gfx/aQUz-mbM_WlXn_uZ@phenom.ffwll.local/

So that's where we are now with this patch.  I can clean it up per the 
feedback so far - but I think we need to be in agreement that this 
property is actually the way forward or we should revert the property in 
amdgpu instead of this moving approach and keep discussing.
