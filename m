Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SFsCI6AFemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:48:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4F8A1909
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1310E2B4;
	Wed, 28 Jan 2026 12:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xzU5hRAb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012053.outbound.protection.outlook.com
 [40.107.200.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE9510E2AD;
 Wed, 28 Jan 2026 12:48:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AAyqV+i7YyfJAo/hZHMGi0g4xoJBRsXOGeM8QvIu3cDldSO8sBD0WEJGOqRWRiNFC/03CBlPTHmZLiF9ZmcMVbS0I7mBuJBTnjar3Z4zV9HrQY0XIwQ1x0cXtOo/4ibCF+tPaSe3MVlKuibgNqCgR3ZJmWpzXXNyfYxMxkgmwzntuZlh5BfDpvkUQeK/dPQz/a8skZ7qDkz4BP9XNWRqbdwGaoFI6fQh4COtm5nDiNekVfGZ27HLwlJLLCN6kz1SWhAAWwWsgl4jRBzj9MkNq+8CtC9gaz8WmrXLmQQ7lmTXOmNqQ1QyGtPE9xnQ+o9RGls7Qj8p1b03K9H+ANSsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MtZITrDo5D+580HXXYq4/oHuPU2OuocnWFvDrszPOHg=;
 b=kdQFULo1JjdKn77eovc8fERA8IM0ZVTFC5IOvtRpuX8B/Mm33ow9s5l1IWZdvdwlTEJPhmfzMqQvklVIzMdR9PooRlKs+Ja9VUvg0pf4dJDUvUKHwlUFXeotBXRr9A+f2lU50OV9n5Tm+XGVkiZhLhr+4tczBT+zad9sDYvBGOrLbpKO2/vS2c9RYANEjiEx899jE5STmQtk9bT6XH9hs1BYs2NJ5XQ3TAh4Sw/By8TXsGTHsiXVj6hZzc8ywviQrgLwrkFXYLieXxjSTH1V29hDFF6CypZlKXCWgrQIAFIDonqw91iN3van48FwBu66Wtm5DMbg4Sv3L/crpmSOEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MtZITrDo5D+580HXXYq4/oHuPU2OuocnWFvDrszPOHg=;
 b=xzU5hRAbkKpOL+cjv/9st9f+svYJZ/A+tCa8zA2im9sUpi55XSbDKAsXTj9oAZMKqhEKb77SVLTrRx+WypbASNmue2kWA2IjwshS4upNEbORICgii/YVf4yu0JxkzG7v3wZlime+FaIMU9FL5on0W4/lD4fDTH2E/4d0/Hhk9Eo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6139.namprd12.prod.outlook.com (2603:10b6:208:3e9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Wed, 28 Jan
 2026 12:48:23 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9542.009; Wed, 28 Jan 2026
 12:48:22 +0000
Message-ID: <eef1982a-ddff-4aea-8ece-5aa1995cc2ec@amd.com>
Date: Wed, 28 Jan 2026 13:48:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 Hamza Mahfooz <someguy@effective-light.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <17cd6378-e3fa-419b-90d3-7e0549817110@amd.com>
 <f71df23e-f267-46b7-8fd8-4235e9a7a7fb@mailbox.org>
 <2203806.9o76ZdvQCi@timur-hyperion>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2203806.9o76ZdvQCi@timur-hyperion>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0395.namprd03.prod.outlook.com
 (2603:10b6:408:111::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6139:EE_
X-MS-Office365-Filtering-Correlation-Id: 14b4e0db-181d-401b-dbbd-08de5e6b8531
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RVJnVmtENVdvdzBiNjd2UW9ublBDS2FOYmlrcEpJNUN6YzhxY3cvUTFqUnQr?=
 =?utf-8?B?cUhFejcvcnc0YVg2V3M0amxoQzQraE1Gd0U3eURDa3p0aE9qMW5xM0tHMkxR?=
 =?utf-8?B?VE5KVHBHRy9TaUVZb0lDeGFNbEViZkh3SWdCbDZHMlBza25qekxvRlVXdlNT?=
 =?utf-8?B?UlljaXlnRUhBaHNNTjJ4SlAyeXBvSG5qVytiVHd4cys1VEtuaXFjSFBkR1lz?=
 =?utf-8?B?SDA3R1Yrc2RxcjJXY3NKL2t2Qi9jbzdaWkYwQ09nc05XeWJqOVlaQWNpU3FI?=
 =?utf-8?B?V3hjUTlKQzNTV2o5WDJxWEgzUGFxMlg2TjlTUHRRM2ZVRTEralIxSU9QUzB3?=
 =?utf-8?B?bm13Vm1QUzJUV01sZWhuRUc5My9POUZiR1Z2aWd4clNoSTNYY0IrZG5VRk81?=
 =?utf-8?B?c1g4VmdCYWZKOFhRK2EzL1lCTmMxV2J2YkFrQzNiSEg5dkZUeDY2VkRsQWFO?=
 =?utf-8?B?dkhyM3YvU3U5TjJBZURXdE5zS0tDV3FyMWozRWRDRzJqbGdianJ1c0FqSHhH?=
 =?utf-8?B?VWtkbit6U05rYnEwVnV4WmNZUW1ZYXVZYlN0dytPOW9SanJKTUNRaHJ0UmFG?=
 =?utf-8?B?WDc4cTBCZU5LejY0aGxyOWNqVS9kd1VOWHVoWWN3SldPbzZ2WWZDTHMzR1M3?=
 =?utf-8?B?aUJFb0RvSmNhb2I2bElsa0dPdEVtejkxdG9EOG9GVW53SUtTVG8rUjZIcnZj?=
 =?utf-8?B?NzRxa3lueVVmMW53VWZVRGFWNWNuZThOWDVsK0FEYmpRRllHWHV3dG0vMGRH?=
 =?utf-8?B?Q3NTY0pXMFFKbUVsdDkyYTFGL2d6ZWZ4cG53UWI4ak5mdVBpVDN3ZW9ac3dw?=
 =?utf-8?B?MElEbkZvZzZkUy9yYTNHRGU4NUNsRkhQdk52NFhxdWpjU1RrdWJBbDBDdnVy?=
 =?utf-8?B?TXZYVjQ5YkFYOGJwR0FaaGI0eEx6dzRGUlhqL3Y1Y09ueit1TUdPZ2FVNkpL?=
 =?utf-8?B?aEZRZ2Z5SDhBekV4MVBZYUhVb0Q4YzhyeGttL1BmcVBCNUZuUGx5WFVOdHJn?=
 =?utf-8?B?dlpVN0hUT0lJSk4zQkJoWkZGSGZmSERaQkd4Wkw2UnQ0Tkk4UndwTEp1OFNy?=
 =?utf-8?B?T2RtRmFNZk5VeUFFVWxEOE5JWmVCSElsUW4xRnpMK0xNNGpqT3kyWGdSRWlv?=
 =?utf-8?B?UmZSZHhPSXUzVVVTVXpPaWpHYUVjRTlqSEU2QlBnaGdMcTBDcXdpb0J0Znll?=
 =?utf-8?B?VTI5b010WmFiWjJtZjAraXF1QlpxMFJXUG1DNEFlRnkraUNYTU9ONGtYMFZj?=
 =?utf-8?B?Y2Q3Q045NjdjTmppQlhDOXRsRlo5cXhxVlJUZjlBNGVEZmdldlZlby92YnhZ?=
 =?utf-8?B?dUdmdWNsK0pYU1ZrUGVmcWxqL3BVL1NKd0oxaWM5UndrUVZHS3d6SlBzd0xh?=
 =?utf-8?B?ZVhXdit1UjlqeVptVnV0R0FWSHNrTkFhbHk2dmI2enJkWCtKR25tVFpqaGcy?=
 =?utf-8?B?SkJyUW1NMWRvWlVQeHhzTWFyMElmdXFVWTM5d2RzOFo3TjVNMGZHTXBPQzds?=
 =?utf-8?B?U3AwYUxFbFUvNStValpEUm5MWXpDd1hsSmNIQkh4MlNQNWpmclRmaTVmVEl5?=
 =?utf-8?B?VXJIcTdrT2syZ3dmRVN5TEx3SkRnUmVTQlErOGVWYjFyQ3A4bG1qeTF1aDRo?=
 =?utf-8?B?L0txUlYvUGZtanhSaGpmVFZqcStXbGVWcjBhaFlnKzlDc3R2eUwxWjhnRFF1?=
 =?utf-8?B?YXlTaklQaUczNWdSR3JQZ2hHTU9YVTFrMG5LNUoyOS8rVzQ0UTVJclBmZ2pr?=
 =?utf-8?B?WDRySGpzdEpGZnlvRzNrVWkvUHJSemErNU1zRVB3SU4rNmR3MzlLcjhqWjBP?=
 =?utf-8?B?R3RpQjBBV1p4cms2aWFnaWFmK3JvQUJsNlNFRUlweFB4RVpTZWNtb2cvUmN3?=
 =?utf-8?B?U0l1ZjVDYWVML3FsWE13S2dMaUZrbnZEb0oxUHJRZjlHbkNLdk0vWmZHZWNl?=
 =?utf-8?B?NGZSZFBRcVg1ZmFDTW9EZnZQT2pzaUY0TmNiaUdUVE5LZHNvWXhWSExNWmtM?=
 =?utf-8?B?SmJlN3lveXk4eTN6VldOL2lvMUhRWVF3NEY5Wk1ZeFJGYWRJcERiODQ5L2xI?=
 =?utf-8?B?YXFicnBQU3F3RVhQZUgxU1NqU0orVW1ZOVdiaUpqZ01xNGVxSFNqYlBBd2hC?=
 =?utf-8?Q?19rE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlcwSm12ZEJlREVQVTZIZXp3eXFZdkNlNmRkSHNVYUZBN01CUGM4ajJ4SzZi?=
 =?utf-8?B?cGJTV3Qra3Q3SThaMWxPd1FYcFdNaytBaFV2Q0ZWRnAvN2pvN3dNZVgyWm4r?=
 =?utf-8?B?V3FFTlJvZko0T0RWeUJlYUVlcW92RkxhQURJV3ZvaGpjbmlhSDFPUThtL0NN?=
 =?utf-8?B?ZjlONjRHT3lZYUczRlVQUXo5NnJ4RCtuNm9uTDZMK2dZQWE0SFpjTHdyYktm?=
 =?utf-8?B?MVFwOEpjVmVnZXp1dWZaaHZBWnBmNUJDbmpidVVxV2pzWTg1MnhwbXEyeXpI?=
 =?utf-8?B?clZNL2dON3cveVhETVIzZXpxNTB3YTF3TnU2QzVOdlJsdXdGc1EweU54OHNE?=
 =?utf-8?B?b0Y3MWNQUysvWE9xWkpaTE8vQ0kzdTVuQ1JEMW0rajF3L05CYkNuK0YrUkxI?=
 =?utf-8?B?UUR1dktwVWEvTE14WVNDT2lEa0MvKzVsSkNSOE94U2lFQnBUU3Z1d3c4RFFq?=
 =?utf-8?B?SXY1b0wrcVRyYlNQVGFiRkJYbm9EdkMzRVQ3WFpaWTVDYlFsYTZoMEZXd29T?=
 =?utf-8?B?c2FzRmF4N0xYNjUxZy95L3c3aE5vVEQveS9IRk40aFN5N3pQajV3TXNDTmR2?=
 =?utf-8?B?enNZWU9rK3ZkcDFWUDE5enFkb0ZxRzdZUDkrbEVHeUxxSkxYWldSZENkZ1NT?=
 =?utf-8?B?MGVITitqSFo1ZURtYk1tTm5ud3NMcHVQa2EvZENZL2t5bWVCaUlKN2xFNVpQ?=
 =?utf-8?B?UTdiYmlnbC8vaDFnVDc5YThQQnM3ZC9IZnBQbFA2WFlwdkV2R3h2dldLN1VK?=
 =?utf-8?B?blBscjlrUzY3cGEyeEQwa3RzU0sxdXhkdFpJUmZVeUhHRGlxa0xTSXFpUlI0?=
 =?utf-8?B?Mkk0SUw2aHl1WHk5VnlXcFNEd2NEbFZBM21aTnhRSERvMEk4Rk91TXhlaG9n?=
 =?utf-8?B?ZGtSSEU4Y1BRcy9mbjVkRExWNlBWSWdPOFpaOFo2ZnVmM0RWN1MvZm03bHZL?=
 =?utf-8?B?a1dOdTlDenAwakkrKzV1dVl6dk9rN3g5MkpxQ1RjWWZhRkdmZ1hDOVZoVWtz?=
 =?utf-8?B?TzdRVjcrSHdhYzBKV1laQkw4d1F0SFlZWElva2ExWWFHWWR3dllES2RmVTFn?=
 =?utf-8?B?OXVCdHlWYTRaaXBvUXRGK3J1SDgzUEppRDRxb1FBdHJUOUxMT25nYlNzYk01?=
 =?utf-8?B?T2J4SDBCVmRKVTlxMll3MlpjUGZYWndpdlJMa3V4d3RBeEZJSTR5L2JsSWk3?=
 =?utf-8?B?UWJ1bU9lQjd2aGlmTnNqN2ZJTkNMazRKRXJhVDAzUERGcG5ZRm1PUmNzWk1O?=
 =?utf-8?B?c2hhK0p0dHpnZDhqMittZThjNVVVVGZVYW5uem43cHZWYS9ySnE3NzZqWWQ1?=
 =?utf-8?B?UEd6cGlseXZla1VkanFSa0dmczVHcGdrcWx0cHNIM1RiNmtlWW1wWG4reGRV?=
 =?utf-8?B?UGJwS0pXQ2MzNnMyU3ZtSFhnVGJNUUhzSlZlSDV3S244d0tjdWZwS3MxdGo2?=
 =?utf-8?B?bVhQV3BwZ29GZWNGY3prK0RVMHpTd3oyTmIvT3dYdUluYmsyNWlTZlQ0MUk4?=
 =?utf-8?B?QmZsSGFGb3hFNVdKV3dRQWJuc01PZWRmUkZIWWx6WjJmaWVqQThKNTdXUGVB?=
 =?utf-8?B?TTltQmRCUDJVK2xhSkJWTUR2dEozRHZHbmhMbUZkamZJWjFMWHpUN1l6SVJ5?=
 =?utf-8?B?YWI1OCsyYmVtUzhTVFVtL2VoamNDRTBWb1RjWU1SWjhMTTZkNTBjc1NkNkFo?=
 =?utf-8?B?N0JpWS9XcFVDYXhaZFRTQ2owL1VKYSswcHk1a0lMRzBLS0dyWWZ6OWdkMXIy?=
 =?utf-8?B?blphV2RBZWFEV29VS1NyVHg4dzdEUDQyR25EWHBoMUZOV3RwM0tnUkg5ZmU5?=
 =?utf-8?B?UXMwQ2JNS09kZktqdkd4a0psanU0bVFGUzBBdXAwblp6Q1NERXpON2JrWUY5?=
 =?utf-8?B?VnRWSXU1SjdVRjR4WWRpM1N4S0NqWWVRYkhvNXN1UC9mS2Q4N0x3bGRvaTN0?=
 =?utf-8?B?TVBIL3A2bVhRMXFLNSt2Y2J3bEI5U2JlMjFpakdjbktjeDF4OUJSNXpLVWQv?=
 =?utf-8?B?Rk93N1YrUXJzODdTSWx2c1Y0Z2dQbTlqUmVRM2NKK3NPR2N5dUpVeEtnZ2c0?=
 =?utf-8?B?WlJ2VkJvRnRHL1FFNDdwN01YanJvNkpWbHZzMFU1Y08wL2c3QnllVDB1enRS?=
 =?utf-8?B?c2dQMzNuUWQra1ZvZGFtWXdYWDcrMnNDRUZ1UWlMVTBXZFEvb1JSekdXTk16?=
 =?utf-8?B?TExFK1EyakExV1M2Y2xPZTM3RCtmKzliTmJXK29nUTl3UXJ2QThIV0NyT1pX?=
 =?utf-8?B?QWNyLzY3R2VCVnR5ams1L0p4eWp3eDk5b1NWMC9qL2FDazZNRnU1MFZ6bHpl?=
 =?utf-8?Q?2CnYktreVbhiT/ooDj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14b4e0db-181d-401b-dbbd-08de5e6b8531
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 12:48:22.6278 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lmW2utaBeClapUImdlJHpd5UC60ON1L0aVorWD9Wt34OpBynTU0sdeRff6GvOX8Y
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6139
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,effective-light.com,mailbox.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,lists.freedesktop.org,gmail.com,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,redhat.com,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[effective-light.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 3C4F8A1909
X-Rspamd-Action: no action

On 1/28/26 13:14, Timur Kristóf wrote:
> On Wednesday, January 28, 2026 12:26:20 PM Central European Standard Time 
> Michel Dänzer wrote:
>> On 1/28/26 11:39, Christian König wrote:
>>> On 1/27/26 23:57, Alex Deucher wrote:
>>>> On Tue, Jan 27, 2026 at 5:53 PM Hamza Mahfooz
>>>>
>>>> <someguy@effective-light.com> wrote:
>>>>> On Mon, Jan 26, 2026 at 09:20:55AM -0500, Alex Deucher wrote:
>>>>>> I suspect just calling drm_crtc_send_vblank_event() here on the
>>>>>> relevant crtcs would be enough.
>>>>>
>>>>> Seems like an interesting idea, though I would imagine we would still
>>>>> want to attempt a reset (of some kind) assuming that the subsequent page
>>>>> flip also experiences a timeout.
>>>>
>>>> Is it actually a timeout or just missed interrupts?  I'm wondering if
>>>> some power feature races with the modeset and causes the interrupt to
>>>> get missed from time to time.
>>>
>>> That is my strong suspicion as well.
>>>
>>> Even if we missed a vblank interrupt that thing is reoccurring, so the
>>> worst thing that can happen is that we delayed reporting back success by
>>> one frame.
>>>
>>> So something must have turned the CRTC fully off.
>>
>> Not sure that's a generally valid conclusion (do the gitlab issues talk
>> about the display going black, or about it staying on but freezing?).
> 
> In all the bug reports I've seen about page flip timeouts, and in all the 
> timeouts I've seen on my machine, the screen remains on, but frozen.
> It doesn't go black and doesn't turn off.
> 
> Christian, why would the CRTC be turned off?

Exactly that's the question we need to answer.

But from what you describe the CRTC keeps on, just doesn't send any more vblank events.

>> AFAIR
>> at least in some cases amdgpu uses a dedicated "page flip" interrupt
>> instead of the vblank interrupt,

Oh really good point! I haven't though about the dedicated page flip interrupt.

But IIRC we already had problems with that one with radeon, so we stopped using it a long long time ago.

> That matches what I saw when I was digging in the code.
> 
>> in which case missing a single interrupt
>> could cause a timeout.
>>
>>
>> P.S. Completing the atomic commit and sending the completion event must work
>> even if user space turns off any CRTCs as part of the commit[0].

Wait a second. What happens if we never complete that? So when the completion event is never signaled?

Does the kernel then reject any new atomic commit as well?

If yes then I think that is not defensive at all. In other words when you are right and the page flip interrupt is used and missed then we are stuck forever.

>> So your
>> hypothesis would be a kernel bug, accidentally turning off the CRTC and/or
>> not handling a CRTC getting turned off correctly.

I'm not arguing that it isn't a kernel bug, but the question is what is triggering it?

In other words could it be that userspace does something illegal which the kernel fails to reject?

Regards,
Christian.

>> [0] If any CRTC for which the commit has state is off both before and after
>> the commit though, the commit fails with an error before it could result in
>> a timeout.


