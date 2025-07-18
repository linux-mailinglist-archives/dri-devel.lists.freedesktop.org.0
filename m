Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19329B0A5AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 15:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D05882AF;
	Fri, 18 Jul 2025 13:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a1FmremC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6AC810E9C5;
 Fri, 18 Jul 2025 13:58:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5y5KEvgQNMoFXB47qrF3LQD5G4gtgm4eJ7mYeV6CxzU1DSVcnUlaqtapGrfNNbk0JAZpbWVMj0zJw45LUP8YqLZ7Q8z+OdKqdiDlUbUSUTauCGSUqa7uQOybc24OuKt7bEym1ruREKl8pwizbnuBRsovzUO4bhcHnlfTDI2lDpUM9oYS/u76v+PRiU/61sgJl2UR2G7So2oZQ8K+Xgq4nO6Ih5bj2jdUOcS99cQyorW57gnIVjA/j34OF6F08fRhC37qbHBIaqdbzIw7GaZ0SOD4t6p8kO9EKaJ89MqzeCQIyTy0VTMu35sf6lnnSPdFXmpayUhTeUFXCz3GACgJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0t/bwNos+QoDdgZSofNirm1v3shwbpxO88BlHBKgCQQ=;
 b=aFM/QFz/FtvkshWPuA4yN/UD8CGkVNixRerPzPNT11oqgxROtAOFWOMIsHbt+u58YAxNL7sbWidtt74oOBsdqfv22V1TEBVfxHeztnuu9QqXqbb68YAxB7CJYyec3kTS8p9x7YN/SXIp7byCa+pYR6eNLuWpy8dxeuunFDyKwqwsXx1f/3K0Ln0ZMSazr9tsebos6DUYQvrgFt52Dt7/iilTU7Abvvykb+h82s95uHS1tpjwSFIP2JVWpJXzyyyIBm/qKCu8dQwgENljHQk/JmslW9kpsEdTFU34g9JraXZnZoPPlr9skkiIqa/6jPGgkahO8M6S3uNdOqP+73n7Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0t/bwNos+QoDdgZSofNirm1v3shwbpxO88BlHBKgCQQ=;
 b=a1FmremChJmlH0kgrtx9cKzy/paF6wtaaabBqaQLTLJzDLbqkPm4BMF3KGPuUhofAAnc4TaUwE87AWq3vIOpF5mnQerjDupOoQJGfIYCJ0XxDZzvuywcMl0T+RXn6PwiDJx7myBl7sxZelwTaco0rUTEQUQJadoK7ta3WvExleg=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH3PR12MB9284.namprd12.prod.outlook.com (2603:10b6:610:1c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 13:58:23 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 13:58:23 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Nathan Chancellor <nathan@kernel.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
CC: "Gao, Likun" <Likun.Gao@amd.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "llvm@lists.linux.dev"
 <llvm@lists.linux.dev>, "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] drm/amdgpu: Initialize data to NULL in
 imu_v12_0_program_rlc_ram()
Thread-Topic: [PATCH] drm/amdgpu: Initialize data to NULL in
 imu_v12_0_program_rlc_ram()
Thread-Index: AQHb9eNFBSnKxWpiPUq9qYKUyM4+lrQ25cFg
Date: Fri, 18 Jul 2025 13:58:23 +0000
Message-ID: <BL1PR12MB5144E40FC1D87BABD459A0D6F750A@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250715-drm-amdgpu-fix-const-uninit-warning-v1-1-9683661f3197@kernel.org>
In-Reply-To: <20250715-drm-amdgpu-fix-const-uninit-warning-v1-1-9683661f3197@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-17T22:18:57.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH3PR12MB9284:EE_
x-ms-office365-filtering-correlation-id: 27af9712-c35f-48e8-e375-08ddc603293a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TmYyNjBvMGtQZkhFRTI1cU1Yb2xkU3ZqcmNQMTdMT1ZmT0c4UGQyNWVRaDhN?=
 =?utf-8?B?NmxLTjNZOVI5QmdGakIxdU94YURZSHNjMHNDNFJDZkRobHFES0NLalVFNFpR?=
 =?utf-8?B?QzF2WVYzZEFmV2dZS1RjMUJvQjFuc20xQVhUbzZJM2NCNmVpK2dadlFsNGJv?=
 =?utf-8?B?NFg0L3JJRy9QV0hJV3p6S3ZwU3luZVkyRjhUMFE2Sm1TREsxNFZsY0t3QjRo?=
 =?utf-8?B?U3FDUGM4VkNVOVMvQXMxczNaeGp2aFZpOHNIK21oa08xa0NQV2dnRUU3TmxH?=
 =?utf-8?B?MlR2ampTTWtVYy93SWkwQ2JBNlJUaTZlYXlQZ0plVDFDMXFKUjVLampRYjVz?=
 =?utf-8?B?aHBBMVFUWWdxTndFVkZVT1RXNEIzSGJvZzZKQ3F0STdDdjZKTlpiaUtUK1pY?=
 =?utf-8?B?d1VYVTBPcGMwOHBabUpCeXl3aXhsaG9DUC9zWU9GYkdsSzlPRmdpZ0tDdXVU?=
 =?utf-8?B?ZmlYaG1wd1laTE5oSER5UTd5NmVJSWxCTnNUUFFLbGQ0TnlkSGNJVjBtcy9D?=
 =?utf-8?B?d2dlMWU2c09FblFMMnRUbmZ3ejFZcjhhZk1qVUovYW5lL1lzdXBVVzVZNXZR?=
 =?utf-8?B?NGZjVzFLTlo0a1BCWEFpOEdtWDllOWdibWdyWjViOTRHekgxWDc1Wlhwc2ps?=
 =?utf-8?B?QTczcEk5d2RHc2grQVBlWVpQU0h4eXROM2hmVjQxWTF2dHUwejNpU1owRmNS?=
 =?utf-8?B?WkY2a2NaT0JubHVVOWU3dWVWUk9IYVh5SXdqaFhSWFExSWtZREx1bWZySnJn?=
 =?utf-8?B?QUNPTTRwcEZmbW9Kb05UWG1qT1BnaGVDV29yV21Xc1VTTGJERU1sdU5XQi9C?=
 =?utf-8?B?cXhOMkFtY3FhQUJ3SXNpOSsxRkUwNEczZ3NGVlk4YlNiaUFoSjJYTVFPL0lY?=
 =?utf-8?B?aUNsOXJwZ2dhTkNLVVFQWDNydzE1b3Jsa2hVZGEvMlpRYUpqR3dLQU5UeHpD?=
 =?utf-8?B?TlNFU2o5U2Z0RUJCNThiZ1ZvdmlOcURQOHF1VExCVjBjUjJmZVhTeGRPU1RK?=
 =?utf-8?B?VFVLWDVwbVEwS3YvenVCdkczMjdMbmdVQXEzWjRvcXF3N2F5Ry9pK2JqLzdj?=
 =?utf-8?B?MlExK01rcVBMdERRUXRoVHExZWhQQ1Zkdi9WdEtKRTV1Z0ROWDZzbTVkcWVU?=
 =?utf-8?B?cVRVN25NcCt0enVOdGIxRVMxYmVBdkhoNjlDMHhscnRPRmdwU1VlR1RsS1V1?=
 =?utf-8?B?QnhIckpQdkhlcW1ic1JvM1FsT2pLOFNYcWFEWjk3WTljQlpqM05VaVo0MGdY?=
 =?utf-8?B?TmM1cDJ5UXdXeVNjVDFsNnBtNERtRlowWHJFUmttMVZBNlBIVi92dXAvbXVT?=
 =?utf-8?B?SDg5QzNZR0lvZEt1MDc0b2pZVGgwcUlXMy9naUV6L3ZHUi9hVituQXExL3Bm?=
 =?utf-8?B?ZWFEL3JLRnN6aFIxSW5yTVV6R3AxQlRqRVZjb1UvNmRZV1pGNVJGalJBTFVX?=
 =?utf-8?B?aGcvUEk0LzB0UkdHSlVVY1cwOUJPaURvMDR2VG9hMVhZaWFjbDNiL1FrRFd0?=
 =?utf-8?B?NVg5N2NTbnI4RzBrSDNhbGJBYUROUXlsVmNuUEdyUU5pb2FXbWh1OC9YZ201?=
 =?utf-8?B?RWRBSTEvYWI1N1p4MDZ1dnFVV0Z3UHFXYmtvN0JGSE1NN2FQTEJKRGZlOU9N?=
 =?utf-8?B?eW9yN2VBRjF6Ky9aSHIrQng5NXh1dFZjVDhhM3lwejZpcW5aU0Q2R2hCb3VO?=
 =?utf-8?B?QXNncG9TSmMraDNubHVwSGNrZm9pYkYvaHA1cjNreEo2cWNoTzV0WkZQNXdn?=
 =?utf-8?B?cXpuSkx3aHlxUjQ5U3VrdEJDdkFUUHdZN0R5YkpROVM5SmVFM3UwcDlXRjB3?=
 =?utf-8?B?MFlxbkMrVjIvQithVW9xV3BNeU1EU2V0TVFvOVMyQUNrcmFKQWdvODRETkFX?=
 =?utf-8?B?RE83ZVJmV1dEQnFkVXI1UHRUZExWY051RVdJa0lHUnFyQ2J3Q1NNbDNCcHFm?=
 =?utf-8?B?OTI3Q3I4UjJGLzFqU1YwczlVd0lZZDBkMWV1NFRpTFNVSkxHYUNkNE1uOG9V?=
 =?utf-8?Q?xiyqquYWMMTdNXq9Zn0/9N6MyW2Yn8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0tjM00rYzArS3VpTGVJOW5sK3E2YWU3RDBpWC9DVEIwallpU1RqTmxYOU5P?=
 =?utf-8?B?dldGbDFmMVkwaDlzQmd1RVExYXJ2T2JhSHI4cktmYXRXQUJjTC9pc1RwUkt1?=
 =?utf-8?B?V1Q5K0h0TnFZUlhSTEV1ZmNNVmloOTNNc01seG9tdTlFMWJVSE56bjRwdFJs?=
 =?utf-8?B?VGlJM05JeWJUSHMrNzlFdklrOXJpQ3BYU0F1b1pVZzZ6Y1NyTEdDeDVQWVZB?=
 =?utf-8?B?WnU2Y3NmMEVubzc2amhBQ1dMbTJyTUdYRnUvQ3V5TDRydUNTQ1ZiRUZTYnh3?=
 =?utf-8?B?bXRNVFBhRDZaU3BieTk1QWMvUThycmR1Zy9BWkpxZUZWdXRUNjhSaWZHbEdj?=
 =?utf-8?B?ejVwSitTYk5ILzN6SGVKR2hKQ3lvcUU4bVNYSjIwalFaZkZRemEvSDZnTE8y?=
 =?utf-8?B?YzJnQlV0cWFOZ2djaWtibDlHYzBEOWZHUjltUG5QbmZnZTducnhGaHRaUUNX?=
 =?utf-8?B?eXc4OVRhcVAzWENmaTcrTGZCaDZTT25EeHV2NjFmekVJTEJMeVI3YUdQaUYv?=
 =?utf-8?B?OGh0Y05lRVVRY2NMTDNXazdPR1NrazdwcWMzdXZXeExldlk3ZmZBdUs1WTdO?=
 =?utf-8?B?OEdUR3N6TjgzMEFQbkZHaUpJblUvdThUNis3bG9mQzljUWM2QmdHN0NzM2U3?=
 =?utf-8?B?dlFtQnFzL1UwTCtuYnNvNE5JMTdQYzBMcmFNSGNJMWZTcXNzaTljeGttZzNP?=
 =?utf-8?B?L2F1NUFwOUlQVmxobDZpWFZjdUI4Nzlma0s4SVJqT1JtbTNLVmEzRmdTMHFY?=
 =?utf-8?B?MGJyb21iejRpeTBvaTdZdkk4MVpSUjVDTDNtSHR5Skc4ZXZETXhXbDJEUVMz?=
 =?utf-8?B?T2JCU2NtN0o0U1BXcHZSdmdaSXhJNFlxQjNPQW9KTzVueDJTZk1LVUN5OXFr?=
 =?utf-8?B?c0pxT2tDQmhCMmpXVVNNRjNyYkt4VVlGRFcvR0hZdmp3ZXVSbjhJcCtKSit2?=
 =?utf-8?B?d0RHckZpSU1YUEJvMjhVZGIyL2Nsam92c2NrR2FLWmswc3lwUERTV2ozMDNl?=
 =?utf-8?B?Yk5sWEZKWG1VMnFhbGlsdCtSbUk4TXZjb05HaFFZRlF2MkZJYXpnRGNDQnd3?=
 =?utf-8?B?a2dJZnY2YnBVWUlYZ1VKNzA2ZmRyY3JIV0duYnkyc0lLaUNvS2xNeHczeWpp?=
 =?utf-8?B?L09STHBwS21jbG5IT0xsOVhNcUxoVC9ZL3haRWR2UldNQnhja2JPVXAwaENT?=
 =?utf-8?B?emFycjJyOE1FakFjcG1hbWhBR3FtQXUwZkRGSngzMzNUUkdqK2JSa3VSQU5W?=
 =?utf-8?B?RHBZTXI1RWJYWVQzcWFtLytmSWo2US9zMStsbWlHMVJDL3Q5THZkRFRoQUtQ?=
 =?utf-8?B?UnZBSjBpTW5SY0s0VXQ4MHN3YjhNUytobVo0ZDRRSHNKN21FOEc0OEp1ZjJk?=
 =?utf-8?B?UGRsQU1oMzhrUWIvdlpucFI3dW9UZFVWdXlaYnZOYnJITXRoQXZvTUVLWUMx?=
 =?utf-8?B?MWlDRUM5aGVLUnloUzA5eHAzd3Q1RnA4dG9lYkhUeE5jQlJqN0s4ZjEwb0d1?=
 =?utf-8?B?SHFwSjBQL1RyaUxEYkh5YmhsMkM2SWxRNHpFZkVzZEs2STZYa3ZjQi9LZ0Zh?=
 =?utf-8?B?Znk4dmowanR5TzJkekFabkNDcXJ5N3hMcDRsMWZwK3pqbGhNemVKbEp3Skhy?=
 =?utf-8?B?MTVHNnExZ1VRcnlkclgzeEhPcnhyRXpwa3dKUVJrVlNUR3JJYmpZZW81QnZX?=
 =?utf-8?B?VTJGdjNRZHh1cnR6Ry9NRGVSTE1yaTRLdzNBN2xKcGhabnZZajZsUk95R0lY?=
 =?utf-8?B?OTY1L1FUM1EzZ0lnbWRtZGd0ai9QYlBLRzg0MjNwMzFsVjh2VEhodGN4K0dI?=
 =?utf-8?B?ZVRZRzZycmlrMW1HRDVOdWdSZ004RER3a290QnA4QzNoMVUvdEgzcEFkK0tk?=
 =?utf-8?B?WksyTzlUWm5SZFdTUzh3UGY4NlFMZXZBSC81Nnc4Wk9nMTc5VGRUaXdGVXQ1?=
 =?utf-8?B?c0hXWkxvR2Y1RHZkelI3YXo3by96UVIvenkxbGpYRjdZN0NEWXU0Q2h2SjIr?=
 =?utf-8?B?NE52SEZKS2hydVN1enFqM1duVm5EdEw0amRpcnRnUFFGcFZQdmgzSUF2R2dE?=
 =?utf-8?B?clM5Tm1HTWxPSTdOZWhCaXVBSll2dWR0L1dvQVBHRWtGRXJKT3VaeVR4djZ0?=
 =?utf-8?Q?HNog=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27af9712-c35f-48e8-e375-08ddc603293a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2025 13:58:23.5110 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f5Ke1wQs/mWSS6CzUqXRXxtNsxcMP3kXHIlnFiu1X7qPIHRLA+CWZNngJaBD2njMaICpcXYzgKKwGpnI8Y/Img==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9284
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

W1B1YmxpY10NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBOYXRoYW4g
Q2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQo+IFNlbnQ6IFR1ZXNkYXksIEp1bHkgMTUs
IDIwMjUgNzo1MCBQTQ0KPiBUbzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgS29lbmlnLCBDaHJpc3RpYW4NCj4gPENocmlzdGlhbi5Lb2VuaWdAYW1kLmNv
bT4NCj4gQ2M6IEdhbywgTGlrdW4gPExpa3VuLkdhb0BhbWQuY29tPjsgWmhhbmcsIEhhd2tpbmcN
Cj4gPEhhd2tpbmcuWmhhbmdAYW1kLmNvbT47IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyBkcmktDQo+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgbGx2bUBsaXN0cy5saW51eC5k
ZXY7IHBhdGNoZXNAbGlzdHMubGludXguZGV2Ow0KPiBzdGFibGVAdmdlci5rZXJuZWwub3JnOyBO
YXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFtQQVRDSF0g
ZHJtL2FtZGdwdTogSW5pdGlhbGl6ZSBkYXRhIHRvIE5VTEwgaW4NCj4gaW11X3YxMl8wX3Byb2dy
YW1fcmxjX3JhbSgpDQo+DQo+IEFmdGVyIGEgcmVjZW50IGNoYW5nZSBpbiBjbGFuZyB0byBleHBv
c2UgdW5pbml0aWFsaXplZCB3YXJuaW5ncyBmcm9tIGNvbnN0IHZhcmlhYmxlcw0KPiBhbmQgcG9p
bnRlcnMgWzFdLCB0aGVyZSBpcyBhIHdhcm5pbmcgaW4NCj4gaW11X3YxMl8wX3Byb2dyYW1fcmxj
X3JhbSgpIGJlY2F1c2UgZGF0YSBpcyBwYXNzZWQgdW5pbml0aWFsaXplZCB0bw0KPiBwcm9ncmFt
X2ltdV9ybGNfcmFtKCk6DQo+DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaW11X3Yx
Ml8wLmM6Mzc0OjMwOiBlcnJvcjogdmFyaWFibGUgJ2RhdGEnIGlzDQo+IHVuaW5pdGlhbGl6ZWQg
d2hlbiB1c2VkIGhlcmUgWy1XZXJyb3IsLVd1bmluaXRpYWxpemVkXQ0KPiAgICAgMzc0IHwgICAg
ICAgICAgICAgICAgICAgICAgICAgcHJvZ3JhbV9pbXVfcmxjX3JhbShhZGV2LCBkYXRhLCAoY29u
c3QgdTMyKXNpemUpOw0KPiAgICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBefn5+DQo+DQo+IEFzIHRoaXMgd2FybmluZyBoYXBwZW5zIGVh
cmx5IGluIGNsYW5nJ3MgZnJvbnRlbmQsIGl0IGRvZXMgbm90IHJlYWxpemUgdGhhdCBkdWUgdG8g
dGhlDQo+IGFzc2lnbm1lbnQgb2YgciB0byAtRUlOVkFMLCBwcm9ncmFtX2ltdV9ybGNfcmFtKCkg
aXMgbmV2ZXIgYWN0dWFsbHkgY2FsbGVkLCBhbmQNCj4gZXZlbiBpZiBpdCB3ZXJlLCBkYXRhIHdv
dWxkIG5vdCBiZSBkZXJlZmVyZW5jZWQgYmVjYXVzZSBzaXplIGlzIDAuDQo+DQo+IEp1c3QgaW5p
dGlhbGl6ZSBkYXRhIHRvIE5VTEwgdG8gc2lsZW5jZSB0aGUgd2FybmluZywgYXMgdGhlIGNvbW1p
dCB0aGF0IGFkZGVkDQo+IHByb2dyYW1faW11X3JsY19yYW0oKSBtZW50aW9uZWQgaXQgd291bGQg
ZXZlbnR1YWxseSBiZSB1c2VkIG92ZXIgdGhlIG9sZCBtZXRob2QsDQo+IGF0IHdoaWNoIHBvaW50
IGRhdGEgY2FuIGJlIHByb3Blcmx5IGluaXRpYWxpemVkIGFuZCB1c2VkLg0KPg0KPiBDYzogc3Rh
YmxlQHZnZXIua2VybmVsLm9yZw0KPiBDbG9zZXM6IGh0dHBzOi8vZ2l0aHViLmNvbS9DbGFuZ0J1
aWx0TGludXgvbGludXgvaXNzdWVzLzIxMDcNCj4gRml4ZXM6IDU2MTU5ZmZmYWFiNSAoImRybS9h
bWRncHU6IHVzZSBuZXcgbWV0aG9kIHRvIHByb2dyYW0gcmxjIHJhbSIpDQo+IExpbms6IGh0dHBz
Oi8vZ2l0aHViLmNvbS9sbHZtL2xsdm0tDQo+IHByb2plY3QvY29tbWl0LzI0NjQzMTNlZWYwMWM1
YjFlZGYwZWNjZjU3YTMyY2RlZTAxNDcyYzcgWzFdDQo+IFNpZ25lZC1vZmYtYnk6IE5hdGhhbiBD
aGFuY2VsbG9yIDxuYXRoYW5Aa2VybmVsLm9yZz4NCg0KQXBwbGllZC4gIFRoYW5rcyENCg0KQWxl
eA0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaW11X3YxMl8wLmMgfCAy
ICstDQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2ltdV92MTJfMC5jDQo+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvaW11X3YxMl8wLmMNCj4gaW5kZXggZGY4OThk
YmI3NDZlLi44Y2I2YjE4NTRkMjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2ltdV92MTJfMC5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2lt
dV92MTJfMC5jDQo+IEBAIC0zNjIsNyArMzYyLDcgQEAgc3RhdGljIHZvaWQgcHJvZ3JhbV9pbXVf
cmxjX3JhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZQ0KPiAqYWRldiwgIHN0YXRpYyB2b2lkIGltdV92
MTJfMF9wcm9ncmFtX3JsY19yYW0oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpICB7DQo+ICAg
ICAgIHUzMiByZWdfZGF0YSwgc2l6ZSA9IDA7DQo+IC0gICAgIGNvbnN0IHUzMiAqZGF0YTsNCj4g
KyAgICAgY29uc3QgdTMyICpkYXRhID0gTlVMTDsNCj4gICAgICAgaW50IHIgPSAtRUlOVkFMOw0K
Pg0KPiAgICAgICBXUkVHMzJfU09DMTUoR0MsIDAsIHJlZ0dGWF9JTVVfUkxDX1JBTV9JTkRFWCwg
MHgyKTsNCj4NCj4gLS0tDQo+IGJhc2UtY29tbWl0OiBmZmY4ZTA1MDQ0OTlhOTI5ZjI2ZTJmYjdj
ZjdlMmM5ODU0ZTM3YjkxDQo+IGNoYW5nZS1pZDogMjAyNTA3MTUtZHJtLWFtZGdwdS1maXgtY29u
c3QtdW5pbml0LXdhcm5pbmctZGI2MWZlNWQxMzVhDQo+DQo+IEJlc3QgcmVnYXJkcywNCj4gLS0N
Cj4gTmF0aGFuIENoYW5jZWxsb3IgPG5hdGhhbkBrZXJuZWwub3JnPg0KDQo=
