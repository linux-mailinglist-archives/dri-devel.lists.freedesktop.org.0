Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E592B238F1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 21:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC05710E141;
	Tue, 12 Aug 2025 19:30:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xE6Y7ul1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2055.outbound.protection.outlook.com [40.107.93.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBF710E13E;
 Tue, 12 Aug 2025 19:30:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S56Qd6GlmpT7KysYvALJFry0FrnC4dfp/5htCGUFsWpx+f4JOCCy4WO2axOBkwtYp3MUMb4K0v79V06npCC1WT04yHjhcADPqPogBlmb/Dr1tT4uu/rbAh3MXVEguEytLLf2Mk+eE6Sa4woYZLG00ve8xm2bgVU7wodUGKjoT2tTyvT8OZzbQnQLo3FKPT2HF/2dM8vo8WH8+HC9G3F8gPI69ZJNwZRTxbxKFUyNIldwByGDNNTS1fLX/lRoiq3JGn6IkEq1copiASqd1u8aSSWGfkOIaRvbryL/SqqktxMFXBydZaGuE3+Pps6V14laUFvsMEl3XQNRk1C9lVcMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ck2u356SzWctZJ5uZih1NI9CGfnHFn87TvAwWNOUdxg=;
 b=oZ+rsLInDa/dV1p+FXOlIWkB70FC+zMWeoaUELURA4/z+NSCYjd01Bib9FjwhfLH6mX1W+KdxKSEPLHAHQTCxDd2KUHRSX1N+ghXQVbts3J0/LtJYD61CD/yolkdOkOCEvra6u3VwgBeWqeSrSDAkW4CsFsQxMko/lKHb635hrmoRBQ6FPOpdiW2ghlzRKA9hD2LoV0NDuZMFxIHR/unUZer/WLYVEO+N6O/ZuclbIcT2XOjopEneoqaBS/feWxCTuB+1FjW/1nZF0ihuAkueDM2jOcpjo3Hg6UX+oCck5PTDlhmlRp2sZoel1I8YI8HtBKyuKQfJD57rWxpsKuWrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ck2u356SzWctZJ5uZih1NI9CGfnHFn87TvAwWNOUdxg=;
 b=xE6Y7ul1T9lEsRGmAgUsUdz5/QW2vrSdsO7eRQb9Ujy4rppXFPNRy64+Uip91oFtVpysk29jLRiooRJKZEYmp9+hmi6oEVRs1PkKMosjdBrO0OBZUb7wajiszwKmvvgGjCR1WiyOizlR9PPXMqIKMFbPpeQipYHr9npXbj+r9sY=
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB8307.namprd12.prod.outlook.com (2603:10b6:610:12f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 19:30:42 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 19:30:42 +0000
From: "Limonciello, Mario" <Mario.Limonciello@amd.com>
To: "Wentland, Harry" <Harry.Wentland@amd.com>, "Hung, Alex"
 <Alex.Hung@amd.com>, Melissa Wen <mwen@igalia.com>, Rodrigo Siqueira
 <siqueira@igalia.com>, "airlied@gmail.com" <airlied@gmail.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "andrzej.hajda@intel.com"
 <andrzej.hajda@intel.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "rfoss@kernel.org" <rfoss@kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: Michel Daenzer <michel.daenzer@mailbox.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "kernel-dev@igalia.com"
 <kernel-dev@igalia.com>
Subject: Re: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
Thread-Topic: [PATCH v6 00/14] drm/amd/display: more drm_edid to AMD display
 driver
Thread-Index: AQHb/cWinIDyu7JV+ECUOZsr7TKJFbRIM0WAgBXAo4CAABiegIAABSs7gAFx8gA=
Date: Tue, 12 Aug 2025 19:30:42 +0000
Message-ID: <8b1dbdb8-841c-41f6-bc3a-940f15589804@amd.com>
References: <20250726003816.435227-1-mwen@igalia.com>
 <019ca526-5bdf-4c88-a994-a6babb9963c7@amd.com>
 <83d8ed56-2c2b-47dd-83a1-8e8f6a49fef3@igalia.com>
 <b0511344-f654-4f91-aa1a-06d7588a5db5@amd.com>
 <4e94993a-92b3-4584-bfed-468d7606830d@amd.com>
 <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
In-Reply-To: <c399cdf9-ec3b-4162-8175-05b34d9e5042@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN0PR12MB6101:EE_|CH3PR12MB8307:EE_
x-ms-office365-filtering-correlation-id: 3f2cf54c-ad02-4d03-4163-08ddd9d6ba40
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?elovbno2RzlZU0NScU51NlFSYnBRNFozSEFoUS9IWlYyL3R6M3JKOVVNaXVU?=
 =?utf-8?B?S1NROWhxd0psb3RpdTRoSnZQV3dFT1R5WjJEdTFqSnVQajAzT0RQZDZZKzV6?=
 =?utf-8?B?TktCSHdnUEc1RDBIYWw5bVNhVDJmUFlZVGlHMXE5anBvQ2FjaHJ3VVppWjJI?=
 =?utf-8?B?TTVmTFdCZFoxNTQrMExSeXFzVEFsZ0VaTzYvZDhKVUNmc0IwNUdsaWJsUDU1?=
 =?utf-8?B?aFRMOERWa1JUV3lFM0Npenh5d0hMd04vU1V5VDNuQU5lRkN5VW1Va1dpbG9t?=
 =?utf-8?B?d3BRSTBUbU45T0Q4K0NxTzNvZ1hJb0xnYVBVWngxWnZiLzVJZjBmSkUwKzJO?=
 =?utf-8?B?VkU5RDZqTmhjNUVuUjlCTFdtb01heUUwcHBDY28xbjlwNFQyNmFvcmIxT3N5?=
 =?utf-8?B?emYzcE9DRHlHSHB6RVN4Ty9Da0F6VTZIRmViUk1ORzlSTG1rU0UyYUE2L3Vu?=
 =?utf-8?B?VnJEaGh1d1hVaThPcGE0V0tIcjkyd0M0UWhFbFVydzdxRXNMVThRMEZEV0t6?=
 =?utf-8?B?NVZ6RWhSYUwrTTlScUt5ODgwRkZ3cGtrQUx3U05GaTA5WGlMMTZMUTNaQVVI?=
 =?utf-8?B?bjJreVZWdi9lb0VkUG90RUgraVVyc05UWS8xN2lLZVNnNHJMbkxKVzRzQTB2?=
 =?utf-8?B?VnhtdE9qQ0ZlUTJwV1orOUt4UStiNVhpRjNSZWlDVVNhaVc1QnFpS0lXcmNw?=
 =?utf-8?B?aXNLaFVkaDVOeVM0WGdTcTA2dHVVUkQyZjk2TnZPQUV2dElFUVc0cjBubEQ3?=
 =?utf-8?B?MnExTHh1YThoMEFvSXJyNDdhYVNucVpnaXQycUkzWnVTVVRjc1FFUHBRRzhj?=
 =?utf-8?B?Rm9oRlJiZzJWTG9XWGcvUkNLbXhEeGdMNEFCQllJTnREZFQ4dzloNmVZdXR2?=
 =?utf-8?B?TWh4a2o1QkN6eUVKMzFZRWEra0plM2VJcWVsNmZlRDFRTFZJUlIySENPb25s?=
 =?utf-8?B?WTlMRzFRZ3pIVlRZVFJhS2p5eDdaaDhnaUFIclE4aXpGRkZaOWN5eWNLT2Rq?=
 =?utf-8?B?U1d2SVdlUk8yM2NKaHc3Uitoa1NxVzd5TENJT0tHMTd3eTJGazg1cmd1YWJn?=
 =?utf-8?B?SGRmQlNDbW1rYVpIZ1ZsRE11dXBTU1J0dzdGWXh5eW1seldocGFTN0FnSnRR?=
 =?utf-8?B?WW1QR240S2JiZU5UckJpTlQ3Ynloem1GdWxPQ0VMeHVzQVJMUTNuYmpqVXlG?=
 =?utf-8?B?VzQyUXM1OWg4ZU9IVHZKeW0zcDBtdGRWQkM4NDVURkFLallkd2l0TjlmcTc5?=
 =?utf-8?B?MVFrZjI2VVAwTHRGNGwrdXJwMjNsWTdmVXViV2p5TjdiWDhKczRMSWpFR0tn?=
 =?utf-8?B?YmFQektSZmtvcEZad09JVHBKeG53WVIwdStXWlBQZW5OVEdhVVdkeVJ2VHVQ?=
 =?utf-8?B?dlVCTDd0LzJyeGhKeTM3V3dnd0ViZkJPb0hTb2xseG16a3BzSk14WmwzTHh0?=
 =?utf-8?B?NU1IL0YvOE1WZk1BSjVIY3NmdEFaSWltakwzUVNFd3p5UjErRGNPT1lWbHNU?=
 =?utf-8?B?d1hQRHJuaUVQNFdaSUxVNWdtbTcrdGYrMXA5YmhrZ3krd1ZkTDR2YUxvdlZk?=
 =?utf-8?B?VEZGVFBVdUlxSS9neUhtVUM1Vk5PZkJCZU42VjlSakFSc1ZmRmlHWi9GKzY4?=
 =?utf-8?B?SlIvY3d2Y2tjOHV6RjBkOGdkbDYwcjlTeWp5UkowajRGWFdJeWM5dzI1QmZC?=
 =?utf-8?B?b2RVdWpGQlJFKzk5NUsxaExWbjVYRTlTYjFTZVJiOTNlUlFPOXZxclZiM1Nv?=
 =?utf-8?B?MmlySnV5TDQ0bGRIQ3gvQ2tnUG92cWJ1S0ViSnlBcCt1dmdSaHJSWWZPS1A1?=
 =?utf-8?B?YS9pbHR0RGxtRVJkVFdvcWlFd1p6NERUb00rdW1Gbk5KZ2JueVN6WnlwdmU2?=
 =?utf-8?B?UzBJMjJBQVpJdEh1L0l6R0V4dDhkVG96dUwwK0pZNFUrajRhK2JxWW4vZE0v?=
 =?utf-8?B?T2sxbWFYV09nNG42UXlXQVY2c0QyMzlzVjN1c1VHS3VYZ3JtMEZPV3I0VnRs?=
 =?utf-8?B?U29vREJKSVM0SkNkK3BaSjVmQ2RjRi9hNUR4MGdJVHVIWGkvVHBnc3MzNTY2?=
 =?utf-8?Q?F1kapJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N3M3elBLY0h3MVdMbkhQZ1VWb2txVGtyR2tWL1lsY1dwNXZxY2FpcnBJOXNU?=
 =?utf-8?B?ZFdsdEs4WEZyek9iV3FyYy8yT0xDN0l1MVJmYzVac3l6RmhQTXZXSFkwa084?=
 =?utf-8?B?aHV3MW44RFhzS2xmaEFEVHM2Y25sL1VZRTZkdnZqbmdQZ3JMVXVoVDIxaXpv?=
 =?utf-8?B?OHpOUnBpdHpHTTFhK2hVMWROVlphNUYrMWdCUkM3QnhTR0pFelZHUEx1T1pv?=
 =?utf-8?B?VU9adHJldmZIMkFlNEgzbVd0MDQ1eFlsV0pqT0xQVVY4VCtMSXVWOWRhTGts?=
 =?utf-8?B?Yys3VFh4YUp1S3dKK1gvcjI4M0xvOXJTcEM0TGVLa1l0QVU2emk0N2I0Ylp2?=
 =?utf-8?B?bWJVTFpCSHhBWHVyNXdOR2RzMHFxZlpIeTE0dUYvTzl0VnFNbnM0QjZLRFgz?=
 =?utf-8?B?aCtkeW5HdXA3b09pMytWeUFpM3NBMnVDeXdaOVAvT1oxLzIrejhpTjlIWGRO?=
 =?utf-8?B?V0RvcEtYem1BZnBQWlRMWlE2OWZZbGd2dzAvbllLMGp5dVZSRTdyM3JkZzRB?=
 =?utf-8?B?TlNzWlJzM3o0M3ZmVjc2QWxPbis1ZmQyV2VIcUh5azRMSE05NjI2QzdNcS9q?=
 =?utf-8?B?U1kraHIwNzVWN1M5eHZmZ2lucEUvTm10QXNIOUFiazdqNzFDeVdab241NXEw?=
 =?utf-8?B?ai92ZEJRS1Qyanc0NmZISVJ3SVRDZkNncFQ4TnJVTVRqbkp4a0NQazJZWHRu?=
 =?utf-8?B?amV0ZU9UQmd3SEdyaFJ2ZUlIdVRXM0JERnhYMjI2M3Z6a1ppOUFiVHhTeXFx?=
 =?utf-8?B?bVN5R0dTN2VVVDNGbk4vaUFaZFZ5YzI2VEU2VUJSNDhFQytBQjIwR2IyOWZy?=
 =?utf-8?B?ZVliNWdTYk5zREUyaG1sNSt2d1Z3bVN5SktldkhsN2JoT2RxdUxXVERobDRz?=
 =?utf-8?B?S0tVWkZySUhCQWJtSEhtbmwybmxqR1dwR093bVhGUEhqYkl0OUVYbmpWQjJ6?=
 =?utf-8?B?S0JDbmczYjBTa3k1RWEyaTVTZ0J3cTE1S0cwZVFrd1BybGlncWJnbmI4cGZy?=
 =?utf-8?B?WnRMVmRmbXRIWStYZ2UrdFVMTWU5eWxLMDlpRk5UQThDeFlBc3Y4RVlKaXY4?=
 =?utf-8?B?WnF0alVGMmxqUU4yeWc3cW9jSVExc0N4bk1FS1lHcWZUMHE4bkFKSU1FcGlS?=
 =?utf-8?B?K0VBT0U2VlR0RGw1UFQvbVQ1SFlXQ29XSVNMOVN6RDhLZXdXQkprNzNXVjhi?=
 =?utf-8?B?a0JLZm1HR1NPYTU4dVZjY3hWcG1FT2NXQXNlelRPRjlLR1REQTBtRi9abTg3?=
 =?utf-8?B?N3p0Tm4za0t3bThZdGxXK1ZqeWlodExpR1NQT0xGTEtNYjRFK0p1MXJ1d1U3?=
 =?utf-8?B?cDIxdElTUUNmWmVidHRqbDZFclMzLzVZcWZaSUEyTWFQcnBqOTNSUnBKMm5w?=
 =?utf-8?B?NkJnNzlJOEtBbVpnTDN4RFQ3dTZwOFpmN0cyWHlaOHlVbW1RdkFPR1hEbnJX?=
 =?utf-8?B?c0NZckRESWgxMmhpQXJVeWJlemlJd1dSL0lvUDFxazN2KzU1TzluajFGVmFM?=
 =?utf-8?B?WFVKYnVHeXlhWVRsdDVwV3IzT2hYZ0RPd2FqS0dJNFA2RmNsK3hzSURyVnJP?=
 =?utf-8?B?Q1JLOWowSGE2RW5CUmhmRHlXbGdxR29CaUo0ekRadENrSGF3b2kwY0xMd3Zn?=
 =?utf-8?B?N1phQ1BxNU96N3RNV1owV3YvZ0gzdUdCRkpHNXdBTFR5K05KMURRd1ZBd2Ry?=
 =?utf-8?B?ZDBiRmZ3WUVPVzV0UzMvYzdRMVJRVmtzeHhPdzRmR3ZreW5VaGJka1JVTWVW?=
 =?utf-8?B?UEViS2syQWI1STd6OGxJNndQdjR6cmxmSlNjN0lnZXF2aGZROXl3cDJxWm1O?=
 =?utf-8?B?OFdUUVp5ZEg2b3ByOTF4N2djVm1INXJKeHplTFpqSkpyNmVMbjdQbXd4N0Zq?=
 =?utf-8?B?Q0sya2h3bGVpQ0ZmNTBvaGZ0MkhINXIrWW0yVENFMVRyeHNkR0I4TUlIVTgx?=
 =?utf-8?B?N2tGN1gyaVVXM1BkQ05ZZk1sMGNxVDNoQUEyaXp6T1dCVEFXSi9IOE02ci9v?=
 =?utf-8?B?My9kemx0ay9vRGZEWjIvNk5MTENqWVJGdjBDSUtWdUZVTkZzeSswOHFrbGRW?=
 =?utf-8?B?T3VXRzRPOHBsZnJPNEU3YlN3TW03Z09zUXZqWDVHSCtPUHJhOFhMTy95OEFv?=
 =?utf-8?Q?ZHE0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <188AA974EBD77844B860D04722FE2958@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2cf54c-ad02-4d03-4163-08ddd9d6ba40
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 19:30:42.6936 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lXdzwg0nO0/B7ZhJOwHsSJpzNAh+y4IhGPM2hcyGBxrFM8N01zJOWuN1XBg2Iu83cDc2BvftdONpi5/UuW29JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8307
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

T24gOC8xMS8yNSA0OjI2IFBNLCBXZW50bGFuZCwgSGFycnkgd3JvdGU6DQo+IA0KPiANCj4gT24g
MjAyNS0wOC0xMSAxNzowOSwgTGltb25jaWVsbG8sIE1hcmlvIHdyb3RlOg0KPj4gT24gOC8xMS8y
NSA0OjA4IFBNLCBIdW5nLCBBbGV4IHdyb3RlOg0KPj4+IE1lbGlzc2EsDQo+Pj4NCj4+PiBUaGUg
cGF0Y2hzZXQgcGFzc2VkIHByb21vdGlvbiBhbmQgQ0kuDQo+Pj4NCj4+PiBIb3dldmVyLCBzaW5j
ZSBvdXIgREMgY29kZSBpcyBzaGFyZWQgd2l0aCB0aGUgb3RoZXIgT1MsIGNhbGxpbmcgZHJtXyoN
Cj4+PiBmdW5jdGlvbnMgaW4gREMgd29uJ3Qgd29yayBmb3IgdXMuIEZvciBleGFtcGxlLCBjYWxs
aW5nDQo+Pj4gZGNfZWRpZF9jb3B5X2VkaWRfdG9fc2luayBmcm9tIGRjL2xpbmsvbGlua19kZXRl
Y3Rpb24uYyBpbiBwYXRjaCAxNC4NCj4+Pg0KPj4+IEkgZG9uJ3QgaGF2ZSBhIGdvb2Qgd2F5IHRv
IGhhbmRsZSBpdC4gRG9lcyBpdCBtYWtlIHNlbnNlIG5vdCB0byB0b3VjaCBEQw0KPj4+IGNvZGUg
Zm9yIG5vdz8NCj4+DQo+PiBXaGF0IGFib3V0IGlmIHdlIGhhdmUgYSBzZXQgb2YgY29tcGF0aWJp
bGl0eSBtYWNyb3MgaW4gREMgY29kZT8NCj4+DQo+PiBTb21ldGhpbmcgbGlrZSB0aGlzOg0KPj4N
Cj4+ICNpZm5kZWYgZHJtX2RiZw0KPj4gI2RlZmluZSBkcm1fZGJnIC4uLi4NCj4+ICNlbmRpZg0K
PiANCj4gREMgc2hvdWxkIHN0YXkgT1MtYWdub3N0aWMuIE5vIERSTSBjb25jZXB0cyBpbiBEQyBw
bGVhc2UuDQo+IA0KPiBXaHkgdGhlIG5lZWQgdG8gY2hhbmdlIGRjX2VkaWRfaXNfc2FtZV9lZGlk
Pw0KPiANCj4gSSdsbCBjb21tZW50IGRpcmVjdGx5IG9uIHRoZSBwYXRjaC4NCj4gDQo+IEhhcnJ5
DQoNCkkgaGFkbid0IGR1ZyBpbnRvIHRoZSBwYXRjaGVzIHRvIHJlYWxpemUgdGhhdCB0aGlzIHdh
cyBtb3JlIHRoYW4ganVzdCANCmRlYnVnIHByaW50cy4gIEkgZmlndXJlZCBmb3IgdGhvc2UgdXNp
bmcgYSBtYWNybyB3b3VsZCBiZSBmaW5lLCBidXQgbW9yZSANCmluIGRlcHRoIHN0dWZmIHRvdGFs
bHkgYWxpZ25lZCB3aXRoIHlvdS4NCg0KPiANCj4+Pg0KPj4+IE9uIDgvMTEvMjUgMTM6NDAsIE1l
bGlzc2EgV2VuIHdyb3RlOg0KPj4+Pg0KPj4+Pg0KPj4+PiBPbiAyOC8wNy8yMDI1IDIwOjI5LCBB
bGV4IEh1bmcgd3JvdGU6DQo+Pj4+PiBUaGFua3MuIEkgd2lsbCBzZW5kIHY2IHRvIHByb21vdGlv
biB0ZXN0Lg0KPj4+PiBIaSBBbGV4LA0KPj4+Pg0KPj4+PiBBbnkgbmV3cyBhYm91dCB0aGlzIHJv
dW5kIG9mIHRlc3RzPw0KPj4+Pg0KPj4+PiBCUiwNCj4+Pj4NCj4+Pj4gTWVsaXNzYQ0KPj4+Pg0K
Pj4+Pj4NCj4+Pj4+IE9uIDcvMjUvMjUgMTg6MzMsIE1lbGlzc2EgV2VuIHdyb3RlOg0KPj4+Pj4+
IEhpLA0KPj4+Pj4+DQo+Pj4+Pj4gU2lxdWVpcmEgYW5kIEkgaGF2ZSBiZWVuIHdvcmtpbmcgb24g
YSBzb2x1dGlvbiB0byByZWR1Y2UgdGhlIHVzYWdlIG9mDQo+Pj4+Pj4gZHJtX2VkaWRfcmF3IGlu
IHRoZSBBTUQgZGlzcGxheSBkcml2ZXIsIHNpbmNlIHRoZSBjdXJyZW50IGd1aWRlbGluZSBpbg0K
Pj4+Pj4+IHRoZSBEUk0gc3Vic3lzdGVtIGlzIHRvIHN0b3AgaGFuZGxpbmcgcmF3IGVkaWQgZGF0
YSBpbiBkcml2ZXItc3BlY2lmaWMNCj4+Pj4+PiBpbXBsZW1lbnRhdGlvbiBhbmQgdXNlIG9wYXF1
ZSBgZHJtX2VkaWRgIG9iamVjdCB3aXRoIGNvbW1vbi1jb2RlDQo+Pj4+Pj4gaGVscGVycy4NCj4+
Pj4+Pg0KPj4+Pj4+IFRvIGtlZXAgREMgYXMgYW4gT1MtYWdub3N0aWMgY29tcG9uZW50LCB3ZSBj
cmVhdGUgYSBtaWQgbGF5ZXIgdGhhdA0KPj4+Pj4+IGlzb2xhdGVzIGBkcm1fZWRpZGAgaGVscGVy
cyBjYWxsZWQgaW4gdGhlIERDIGNvZGUsIHdoaWxlIGFsbG93aW5nIG90aGVyDQo+Pj4+Pj4gT1Nl
cyB0byBpbXBsZW1lbnQgdGhlaXIgc3BlY2lmaWMgaW1wbGVtZW50YXRpb24uDQo+Pj4+Pj4NCj4+
Pj4+PiBUaGlzIHdvcmsgaXMgYW4gZXh0ZW5zaW9uIG9mIFsxXS4NCj4+Pj4+Pg0KPj4+Pj4+IC0g
UGF0Y2ggMSBhZGRyZXNzZXMgYSBwb3NzaWJsZSBsZWFrIGFkZGVkIGJ5IHByZXZpb3VzIG1pZ3Jh
dGlvbiB0bw0KPj4+Pj4+ICDCoMKgIGRybV9lZGlkLg0KPj4+Pj4+IC0gUGF0Y2ggMiBhbGxvY2F0
ZXMgYSB0ZW1wb3JhcnkgZHJtX2VkaWQgZnJvbSByYXcgZWRpZCBmb3IgcGFyc2luZy4NCj4+Pj4+
PiAtIFBhdGNoZXMgMy03IHVzZSBjb21tb24tY29kZSwgZHJtX2VkaWQgaGVscGVycyB0byBwYXJz
ZSBlZGlkDQo+Pj4+Pj4gIMKgwqAgY2FwYWJpbGl0aWVzIGluc3RlYWQgb2YgZHJpdmVyLXNwZWNp
ZmljIHNvbHV0aW9ucy4gRm9yIHRoaXMsIHBhdGNoIDQNCj4+Pj4+PiAgwqDCoCBpbnRyb2R1Y2Vz
IGEgbmV3IGhlbHBlciB0aGF0IGdldHMgbW9uaXRvciBuYW1lIGZyb20gZHJtX2VkaWQuDQo+Pj4+
Pj4gLSBQYXRjaGVzIDgtOSBhcmUgZ3JvdW5kd29yayB0byByZWR1Y2UgdGhlIG5vaXNlIG9mIExp
bnV4L0RSTSBzcGVjaWZpYw0KPj4+Pj4+ICDCoMKgIGNvZGUgaW4gdGhlIERDIHNoYXJlZCBjb2Rl
DQo+Pj4+Pj4gLSBQYXRjaCAxMCBjcmVhdGVzIGEgbWlkIGxheWVyIHRvIG1ha2UgREMgZW1icmFj
ZXMgZGlmZmVyZW50IHdheXMgb2YNCj4+Pj4+PiAgwqDCoCBoYW5kbGluZyBFRElEIGJ5IHBsYXRm
b3Jtcy4NCj4+Pj4+PiAtIFBhdGNoIDExIG1vdmUgb3Blbi1jb2RlZCBtYW5hZ2VtZW50IG9mIHJh
dyBFRElEIGRhdGEgdG8gdGhlIG1pZA0KPj4+Pj4+ICDCoMKgIGxheWVyIGNyZWF0ZWQgYmVmb3Jl
Lg0KPj4+Pj4+IC0gUGF0Y2ggMTIgaW50cm9kdWNlcyBhIGhlbHBlciB0aGF0IGNvbXBhcmVzIEVE
SURzIGZyb20gdHdvIGRybV9lZGlkcy4NCj4+Pj4+PiAtIFBhdGNoIDEzIGFkZHMgZHJtX2VkaWQg
dG8gZGNfc2luayBzdHJ1Y3QgYW5kIGEgbWlkLWxheWVyIGhlbHBlciB0bw0KPj4+Pj4+ICDCoMKg
IGZyZWUgYGRybV9lZGlkYC4NCj4+Pj4+PiAtIFBhdGNoIDE0IHN3aXRjaCBkY19lZGlkIHRvIGRy
bV9lZGlkIGFjcm9zcyB0aGUgZHJpdmVyIGluIGEgd2F5IHRoYXQNCj4+Pj4+PiAgwqDCoCB0aGUg
REMgc2hhcmVkIGNvZGUgaXMgbGl0dGxlIGFmZmVjdGVkIGJ5IExpbnV4IHNwZWNpZmljIHN0dWZm
Lg0KPj4+Pj4+DQo+Pj4+Pj4gW3YxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwv
MjAyNTA0MTEyMDEzMzMuMTUxMzM1LTEtDQo+Pj4+Pj4gbXdlbkBpZ2FsaWEuY29tLw0KPj4+Pj4+
IENoYW5nZXM6DQo+Pj4+Pj4gLSBmaXggYnJva2VuIGFwcHJvYWNoIHRvIGdldCBtb25pdG9yIG5h
bWUgZnJvbSBlbGQgKEphbmkpDQo+Pj4+Pj4gIMKgwqAgLSBJIGludHJvZHVjZWQgYSBuZXcgaGVs
cGVyIHRoYXQgZ2V0cyBtb25pdG9yIG5hbWUgZnJvbSBkcm1fZWRpZA0KPj4+Pj4+IC0gcmVuYW1l
IGRybV9lZGlkX2VxIHRvIGRybV9lZGlkX2VxX2J1ZiBhbmQgZG9jIGZpeGVzIChKYW5pKQ0KPj4+
Pj4+IC0gYWRkIE5VTEwgZWRpZCBjaGVja3MgKEphbmkpDQo+Pj4+Pj4gLSBmaXggbWlzaGFuZGxp
bmcgb2YgcHJvZHVjdF9pZC5tYW51ZmFjdHVyZXJfbmFtZSAoTWljaGVsKQ0KPj4+Pj4+ICDCoMKg
IC0gSSBkaXJlY3RseSBzZXQgaXQgdG8gbWFudWZhY3R1cmVyX2lkIHNpbmNlIHNwYXJzZSBkaWRu
J3QgY29tcGxhaW4uDQo+Pj4+Pj4gLSBhZGQgTWFyaW8ncyByLWIgaW4gdGhlIGZpcnN0IGZpeCBw
YXRjaCBhbmQgZml4IGNvbW1pdCBtc2cgdHlwby4NCj4+Pj4+Pg0KPj4+Pj4+IFt2Ml0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsLzIwMjUwNTA3MDAxNzEyLjEyMDIxNS0xLQ0KPj4+
Pj4+IG13ZW5AaWdhbGlhLmNvbS8NCj4+Pj4+PiBDaGFuZ2VzOg0KPj4+Pj4+IC0ga2VybmVsLWRv
YyBhbmQgY29tbWl0IG1zZyBmaXhlcyAoSmFuaSkNCj4+Pj4+PiAtIHVzZSBkcm1fZWRpZF9sZWdh
Y3lfaW5pdCBpbnN0ZWFkIG9mIG9wZW4gY29kZWQgKEphbmkpDQo+Pj4+Pj4gLSBwbGFjZSBkcm1f
ZWRpZCBuZXcgZnVuYyBpbnRvIHRoZSByaWdodCBzZWN0aW9uIChKYW5pKQ0KPj4+Pj4+IC0gcGFy
YW1lbnRlciBuYW1lcyBmaXggKEphbmkpDQo+Pj4+Pj4gLSBhZGQgSmFuaSdzIHItYiB0byB0aGUg
cGF0Y2ggMTINCj4+Pj4+PiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBpbmNsdWRlIChKYW5pKQ0KPj4+
Pj4+IC0gY2FsbCBkY19lZGlkX3NpbmtfZWRpZF9mcmVlIGluIGxpbmtfZGV0ZWN0aW9uLCBpbnN0
ZWFkIG9mDQo+Pj4+Pj4gZHJtX2VkaWRfZnJlZQ0KPj4+Pj4+IC0gcmViYXNlIG9uIHRvcCBvZiBh
c2RuDQo+Pj4+Pj4NCj4+Pj4+PiBbdjNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZl
bC8yMDI1MDUxNDIwMjEzMC4yOTEzMjQtMS0NCj4+Pj4+PiBtd2VuQGlnYWxpYS5jb20vDQo+Pj4+
Pj4gQ2hhbmdlczoNCj4+Pj4+PiAtIHJlYmFzZSB0byBhc2RuDQo+Pj4+Pj4gLSBzb21lIGtlcm5l
bC1kb2MgZml4ZXMNCj4+Pj4+PiAtIG1vdmUgc29tZSBjaGFuZ2VzIHRvIHRoZSByaWdodCBjb21t
aXQNCj4+Pj4+Pg0KPj4+Pj4+IFt2NF0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYW1kLWdmeC8y
MDI1MDYxMzE1MDAxNS4yNDU5MTctMS0NCj4+Pj4+PiBtd2VuQGlnYWxpYS5jb20vDQo+Pj4+Pj4g
Q2hhbmdlczoNCj4+Pj4+PiAtIGZpeCBjb21tZW50cyBhbmQgY29tbWl0IG1lc3NhZ2VzIChNYXJp
bykNCj4+Pj4+PiAtIHJlbW92ZSB1bm5lY2Vzc2FyeSBkcm1fZWRpZCBkdXAgYW5kIGZpeCBtZW0g
bGVhayAoTWFyaW8pDQo+Pj4+Pj4gLSBhZGQgTWFyaW8ncyByYiB0byBwYXRjaGVzIDUtNw0KPj4+
Pj4+DQo+Pj4+Pj4gW3Y1XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbWQtZ2Z4LzIwMjUwNjE4
MTUyMjE2Ljk0ODQwNi0xLQ0KPj4+Pj4+IG13ZW5AaWdhbGlhLmNvbS8NCj4+Pj4+PiBDaGFuZ2Vz
Og0KPj4+Pj4+IC0gZml4IE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSAoQWxleCBILikgd2l0aCB0
aGUgc2FtZSBhcHByb2FjaA0KPj4+Pj4+IHByb3Bvc2VkDQo+Pj4+Pj4gIMKgwqAgYnkgN2MzYmUz
Y2UzZGZhZQ0KPj4+Pj4+DQo+Pj4+Pj4gLS0tPg0KPj4+Pj4+IFRoZXJlIGFyZSB0aHJlZSBzcGVj
aWZpYyBwb2ludHMgd2hlcmUgd2Ugc3RpbGwgdXNlIGRybV9lZGlkX3JhdygpIGluDQo+Pj4+Pj4g
dGhlDQo+Pj4+Pj4gZHJpdmVyOg0KPj4+Pj4+IDEuIHJhdyBlZGlkIGRhdGEgZm9yIHdyaXRlIEVE
SUQgY2hlY2tzdW0gaW4gRFBfVEVTVF9FRElEX0NIRUNLU1VNIHZpYQ0KPj4+Pj4+ICDCoMKgwqAg
ZHJtX2RwX2RwY2Rfd3JpdGUoKSwgdGhhdCBBRkFJSyB0aGVyZSBpcyBubyBjb21tb24gY29kZSBz
b2x1dGlvbg0KPj4+Pj4+IHlldDsNCj4+Pj4+PiAyLiBvcGVuLWNvZGVkIGNvbm5lY3Rpdml0eSBs
b2cgZm9yIGRjIGxpbmsgZGV0ZWN0aW9uLCB0aGF0IG1heWJlIGNhbiBiZQ0KPj4+Pj4+ICDCoMKg
wqAgbW92ZWQgdG8gZHJtICg/KTsNCj4+Pj4+PiAzLiBvcGVuLWNvZGVkIHBhcnNlciB0aGF0IEkg
c3VzcGVjdCBpcyBhIGxvdCBvZiBkdXBsaWNhdGVkIGNvZGUsIGJ1dA0KPj4+Pj4+ICDCoMKgwqAg
bmVlZHMgY2FyZWZ1bCBleGFtaW5pbmcuDQo+Pj4+Pj4NCj4+Pj4+PiBJIHN1Z2dlc3QgdG8gYWRk
cmVzcyB0aG9zZSBwb2ludHMgaW4gYSBuZXh0IHBoYXNlIGZvciByZWdyZXNzaW9uDQo+Pj4+Pj4g
Y29udHJvbC4NCj4+Pj4+Pg0KPj4+Pj4+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbWQt
Z2Z4LzIwMjUwMzA4MTQyNjUwLjM1OTIwLTEtDQo+Pj4+Pj4gbXdlbkBpZ2FsaWEuY29tLw0KPj4+
Pj4+DQo+Pj4+Pj4gTGV0IG1lIGtub3cgeW91cnMgdGhvdWdodHMhDQo+Pj4+Pj4NCj4+Pj4+PiBN
ZWxpc3NhDQo+Pj4+Pj4NCj4+Pj4+PiBNZWxpc3NhIFdlbiAoMTIpOg0KPj4+Pj4+ICDCoMKgIGRy
bS9hbWQvZGlzcGxheTogbWFrZSBzdXJlIGRybV9lZGlkIHN0b3JlZCBpbiBhY29ubmVjdG9yIGRv
ZXNuJ3QNCj4+Pj4+PiBsZWFrDQo+Pj4+Pj4gIMKgwqAgZHJtL2FtZC9kaXNwbGF5OiBzdGFydCB1
c2luZyBkcm1fZWRpZCBoZWxwZXJzIHRvIHBhcnNlIEVESUQgY2Fwcw0KPj4+Pj4+ICDCoMKgIGRy
bS9hbWQvZGlzcGxheTogdXNlIGRybV9lZGlkX3Byb2R1Y3RfaWQgZm9yIHBhcnNpbmcgRURJRCBw
cm9kdWN0DQo+Pj4+Pj4gaW5mbw0KPj4+Pj4+ICDCoMKgIGRybS9lZGlkOiBpbnRyb2R1Y2UgYSBo
ZWxwZXIgdGhhdCBnZXRzIG1vbml0b3IgbmFtZSBmcm9tIGRybV9lZGlkDQo+Pj4+Pj4gIMKgwqAg
ZHJtL2FtZC9kaXNwbGF5OiBnZXQgcGFuZWwgaWQgd2l0aCBkcm1fZWRpZCBoZWxwZXINCj4+Pj4+
PiAgwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IGdldCBTQUQgZnJvbSBkcm1fZWxkIHdoZW4gcGFyc2lu
ZyBFRElEIGNhcHMNCj4+Pj4+PiAgwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IGdldCBTQURCIGZyb20g
ZHJtX2VsZCB3aGVuIHBhcnNpbmcgRURJRCBjYXBzDQo+Pj4+Pj4gIMKgwqAgZHJtL2FtZC9kaXNw
bGF5OiBzaW1wbGlmeSBkbV9oZWxwZXJzX3BhcnNlX2VkaWRfY2FwcyBzaWduYXR1cmUNCj4+Pj4+
PiAgwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IGNoYW5nZSBEQyBmdW5jdGlvbnMgdG8gYWNjZXB0IHBy
aXZhdGUgdHlwZXMgZm9yDQo+Pj4+Pj4gZWRpZA0KPj4+Pj4+ICDCoMKgIGRybS9lZGlkOiBpbnRy
b2R1Y2UgYSBoZWxwZXIgdGhhdCBjb21wYXJlcyBlZGlkIGRhdGEgZnJvbSB0d28NCj4+Pj4+PiBk
cm1fZWRpZA0KPj4+Pj4+ICDCoMKgIGRybS9hbWQvZGlzcGxheTogYWRkIGRybV9lZGlkIHRvIGRj
X3NpbmsNCj4+Pj4+PiAgwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IG1vdmUgZGNfc2luayBmcm9tIGRj
X2VkaWQgdG8gZHJtX2VkaWQNCj4+Pj4+Pg0KPj4+Pj4+IFJvZHJpZ28gU2lxdWVpcmEgKDIpOg0K
Pj4+Pj4+ICDCoMKgIGRybS9hbWQvZGlzcGxheTogYWRkIGEgbWlkLWxheWVyIGZpbGUgdG8gaGFu
ZGxlIEVESUQgaW4gREMNCj4+Pj4+PiAgwqDCoCBkcm0vYW1kL2Rpc3BsYXk6IGNyZWF0ZSBhIGZ1
bmN0aW9uIHRvIGZpbGwgZGNfc2luayB3aXRoIGVkaWQgZGF0YQ0KPj4+Pj4+DQo+Pj4+Pj4gIMKg
IC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9NYWtlZmlsZcKgwqDCoCB8wqDCoCAx
ICsNCj4+Pj4+PiAgwqAgLi4uL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jIHzCoCAzMyArKystLS0NCj4+Pj4+PiAgwqAgLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9h
bWRncHVfZG1faGVscGVycy5jIHwgMTA5ICsrKysrKw0KPj4+Pj4+ICstLS0tLS0tLS0tLQ0KPj4+
Pj4+ICDCoCAuLi4vZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX21zdF90eXBlcy5jwqDCoCB8
wqAgMjEgKystLQ0KPj4+Pj4+ICDCoCAuLi4vZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
ZGNfZWRpZC5jwqDCoCB8wqAgMzkgKysrKysrKw0KPj4+Pj4+ICDCoCAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vZGNfZWRpZC5owqDCoCB8wqAgMTUgKysrDQo+Pj4+Pj4gIMKgIC4u
Li9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2V4cG9ydHMuYyB8wqDCoCA5ICstDQo+
Pj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX3NpbmsuYyB8
wqDCoCAzICsNCj4+Pj4+PiAgwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKy0NCj4+Pj4+PiAgwqAgZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RtX2hlbHBlcnMuaMKgwqAgfMKgwqAgNyArLQ0KPj4+Pj4+ICDCoCBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvaW5jL2xpbmsuaMKgwqDCoMKgIHzCoMKgIDkg
Ky0NCj4+Pj4+PiAgwqAgLi4uL2RybS9hbWQvZGlzcGxheS9kYy9saW5rL2xpbmtfZGV0ZWN0aW9u
LmPCoCB8wqAgMzAgKystLS0NCj4+Pj4+PiAgwqAgLi4uL2RybS9hbWQvZGlzcGxheS9kYy9saW5r
L2xpbmtfZGV0ZWN0aW9uLmjCoCB8wqDCoCA5ICstDQo+Pj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2Ry
bS9icmlkZ2Uvc2lsLXNpaTg2MjAuY8KgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+Pj4+
Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9kaXNwbGF5L2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8wqDC
oCAyICstDQo+Pj4+Pj4gIMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDU0ICsrKysrKystLQ0KPj4+Pj4+ICDCoCBp
bmNsdWRlL2RybS9kcm1fZWRpZC5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMTAgKy0NCj4+Pj4+PiAgwqAgMTcgZmlsZXMgY2hhbmdlZCwgMTk5IGlu
c2VydGlvbnMoKyksIDE2NCBkZWxldGlvbnMoLSkNCj4+Pj4+PiAgwqAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vZGNfZWRpZC5jDQo+Pj4+
Pj4gIMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2RjX2VkaWQuaA0KPj4+Pj4+DQo+Pj4+Pg0KPj4+Pg0KPj4+DQo+Pg0KPiANCg0K
