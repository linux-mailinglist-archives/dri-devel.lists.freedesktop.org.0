Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B0DAC9087
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 15:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA5C10E807;
	Fri, 30 May 2025 13:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MaOGNtor";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0A310E143;
 Fri, 30 May 2025 13:48:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIAHWcnYuQMj2h6bG3MZ9CFIgKajzcdgui2mX7/nT4Gm4TxwP3SMe3b+zcb7DkU3LDc1r46UXiuhux0iCJikSyjDY9ZSDWA8mJH5OVE0RgIXiAg7mYLgpFfQL2dkAuHaPjzH09y+basj8ql+XUxrMGN9sTR4qEen2WiUM/NaJdQeeMTqqAX5kR2+ndi6s5UPhoUs8kkydu8J7HxM9RAj2ZoFgvUooAT3PZ3eoJXIMzP0/A8aChtEUZ8uanGaOi8izFwWyyP08Xruz3x+5owGOoKLgjcl/O17utOTMP8e4UDZM/ElIzVEpz6t9Q61Vn6kmYq4Xhl5QEXeZGB/Pi1AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCG7i+2F4/ugdgSMLh2Uh+XWkMkhi+U8uIhN0SbETnI=;
 b=cRm8/RodJpdryHCXC935fzLCgOKQW2dg4TkcI27s+7LDbkD5rvavp//p3sj/uEKytlzT3YWiO5eA8649cd1uI+oRYsxxBLh6mJcCT+uuXwXkOS1O/OPaAfTH+YG3an3phRBJc6NUHSsQjvtd8/J9d7i3pa7Wu9FKLn0BIiYKQBQok5jI6npJmo6kb7zwWq1Q3Dx8Wc6tebjyppoMLZl0YPrEQo2ti7CUp2eKHDKItwe1DL7Dh7up6OQAnkMsrmQsZldqnvuIF60wR+3aJRogtP51d/FiGYcabjdAs+Fl6LgrqAF7wk8ik8ciKAtvN3nz/3Z/14Kd5zKDQqlb61edOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCG7i+2F4/ugdgSMLh2Uh+XWkMkhi+U8uIhN0SbETnI=;
 b=MaOGNtor1ddtyF01ItArUkpNCfXBH4PYvs3VnkqRymmzg16wE06DmfRcBVI2ovI8kR8kn+RXTVSsez4xLXtamNzHRRUpRmslPsuuIOtgn2PQ/oWtspcTWDVPHRWZGSzjOgvq8k2hP2W1yUxQk2FFMgB2UgIfg2VRKO/pMdW+2sU=
Received: from CH0PR12MB5284.namprd12.prod.outlook.com (2603:10b6:610:d7::13)
 by IA1PR12MB6020.namprd12.prod.outlook.com (2603:10b6:208:3d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.29; Fri, 30 May
 2025 13:48:50 +0000
Received: from CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51]) by CH0PR12MB5284.namprd12.prod.outlook.com
 ([fe80::8060:1b11:e9f3:3a51%3]) with mapi id 15.20.8769.025; Fri, 30 May 2025
 13:48:49 +0000
From: "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>
To: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
CC: "Chung, ChiaHsuan (Tom)" <ChiaHsuan.Chung@amd.com>, "Wu, Ray"
 <Ray.Wu@amd.com>, "Wheeler, Daniel" <Daniel.Wheeler@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, amd-gfx list
 <amd-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, 
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>, Linux regressions
 mailing list <regressions@lists.linux.dev>
Subject: Re: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Topic: 6.15-rc6/regression/bisected - after commit f1c6be3999d2 error
 appeared: *ERROR* dc_dmub_srv_log_diagnostic_data: DMCUB error
Thread-Index: AQHbyWsAkgfutsQ0E0KUJ0vtS3bUP7PbnpGWgAAVZ4CAAZdLAIAACLstgANiR4CABILlUYAFjc0AgAB4Y8E=
Date: Fri, 30 May 2025 13:48:49 +0000
Message-ID: <CH0PR12MB5284E08D45715F67C6B5BBD78B61A@CH0PR12MB5284.namprd12.prod.outlook.com>
References: <CABXGCsPLAs+rCktbM_ao3bP3VZuaLqXSMpXZt1m-B9nqf91EQw@mail.gmail.com>
 <CH0PR12MB52845B90BB3D7B94473B6FDA8B9FA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNmsQgvNZL0_pHxnHLKNZS=k_yzmMNoGgfGQqsimTWucQ@mail.gmail.com>
 <CABXGCsMgEnrtHjJvPPmrXDFkmMkU5TN57bU_396PuF_D02oQSQ@mail.gmail.com>
 <CH0PR12MB52841D545358B55A0546A06C8B9EA@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsNkBCjh_jSJ+tT=xPiSSby-XM6qsnGfCFq4pPPZ8jspGA@mail.gmail.com>
 <CH0PR12MB52846C4987E9D16B19ABEF138B65A@CH0PR12MB5284.namprd12.prod.outlook.com>
 <CABXGCsN5uR+t76b-fHkEw9+G-uHOkOunznZOHh5R-HFJP=9Zgw@mail.gmail.com>
In-Reply-To: <CABXGCsN5uR+t76b-fHkEw9+G-uHOkOunznZOHh5R-HFJP=9Zgw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-05-30T13:48:49.049Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR12MB5284:EE_|IA1PR12MB6020:EE_
x-ms-office365-filtering-correlation-id: 5bca95d6-25a2-41f1-ef9d-08dd9f80b4e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UjdiWHFrYlVrNVdSZ3dwdGNrOWhrOWozeElRTlhNYXo1KzJjZk9WMUtINlk0?=
 =?utf-8?B?dVkyYW9vVW5uaFM0UmdhYUQ5aFNmajNyeWpVVlR1YTl2VG12MWprZUQxQW1q?=
 =?utf-8?B?aE1TS0ZOd2IzSFozejVna00rdGhPZHZURzRXUEZ2TkRXT1pTeUk3bE1YWEd0?=
 =?utf-8?B?ZHEzSlk4bURPb3VhMzJrei9veDdUcERzSnBVN3lMOUo2VVZ4SFRaNmxGcWdP?=
 =?utf-8?B?N1RoT1MvajJvQWR0NEZaWVZYdjdvTmZrc2xSVy8zcWZlZnhHVjgwTW85WjJB?=
 =?utf-8?B?ZWNPYkdzaGpzclVBUHIrOVRkb3ZkT1lhWkNhWmY2c0FNNm5Bdy9FVUZLVCtF?=
 =?utf-8?B?NGlaUjVjMVlVS3ZhU0RLZjQxQXBPNmZwbGdxV0MxZUZXWkpnQ3E1aklrRitl?=
 =?utf-8?B?NjlMam1Yd1EzTHlPM2VicFdBQTRVMjkybUFsWE0weGZhOWFwelB3Ti8xb2d2?=
 =?utf-8?B?MnBqVXJsRzNvdzdKZUZ0eThlVnFSS2VNaEJJbzNFejZJbEV1dlpEZGZ2RUN6?=
 =?utf-8?B?MExKdms3dzhhNFZZeGZLczZsM2tick9QWXl4anE0eWdtTnExdzZObzd2V1RR?=
 =?utf-8?B?N0FXTGh2d1RTWm5uOXYyUnNuUkpTalRQOUEycXJzMStMMmFTdlVxWE9vRDRJ?=
 =?utf-8?B?U3FVcXBLdUhvbE5wcDFIQW5ZcG5Vc0ZQR2NuWExwalRYdy9xdHplRTluWEdn?=
 =?utf-8?B?SjlPYUdFeUdJOFFkeEtXRFdIcmdkUW9Gcjd3ZGlWQklBd1hzV3JlVG1xalha?=
 =?utf-8?B?MnRrdkR0bHo4ZFlEaHlReGQ3Z0duTlpId1YvcEVFRUhueitQWUpoM1hNZ0hY?=
 =?utf-8?B?K1R6dFN3TmpCRU5BeDh6Zkd5ZTBSa3R2Q2kySFk1N0ZEU0hIbm9ReHBHNUE2?=
 =?utf-8?B?ajN1S0VaeGdwWWZLVnduZUZrV2ttSWhyM3NPMzZXZHRxOW1CK2F1djdMcnZp?=
 =?utf-8?B?YVdCeGZrWnZpd3J6SU55djVsMzVZenlrODgwU01SQXNva0JHc2dhdlN5SmNo?=
 =?utf-8?B?WHZDWmF5bjBhUW9xTXlWSWRZUk02U1FPWlVrdlpwc2FsbmlHbmt6MjdvRjgx?=
 =?utf-8?B?RjhjdnB3NFVFOVcxNnl3SjkyQkVEWTUzQmpmRjZCcUlZUk9DQ3MyRi8wK0ZD?=
 =?utf-8?B?b2ZLSUR4YlpTbmhjNEZSZ2pjdzBmdDhjWW42Q0x2SGxWMmZCejExVy91WWlY?=
 =?utf-8?B?UWNGYjVhdGhSSTl0Rit1dEM5ZEVubVVkbWVRRjBkSDVKNnhlV2xSWVQ4ZXlM?=
 =?utf-8?B?SGdqVW1IZ0ZHYnNjN1NpV3JmVkV4SkY2dTdxT1JycnRMck8ya2RoTG1MOW5Z?=
 =?utf-8?B?ZE83NTRnWGdhVFZ2dWQyN1NLbEsveGtkNDNxa1EvM0diT2xKMjgzeFV2aUtj?=
 =?utf-8?B?VjNCSmxHWFVBSHpCaHpMTXZ6T1lsNmRGRGNBckZtVFFVWFBZeHdQZ3NQRzEw?=
 =?utf-8?B?V1laVmtseEhpcHM2THQxa3V3TXFwR2w5cUZzejdQVDU2VER3Q0lLUW1MR3hk?=
 =?utf-8?B?em1wQUdUQ0VHL1k3WDRnZE95eFUwaFRjYTZlRVB5SjRtaVBHSjA4aUQwTjhl?=
 =?utf-8?B?UUdzUnRDaFRNelpzOFpXR3A1WmJyYkpvZmkvS3dZSFB0QmRxVzQ1YmVaajJ4?=
 =?utf-8?B?ejlZOE01WTdCMkRsQmV2bHNBQzBGeWNERmFoZitsN212UzZQNDg2MS9tdGRS?=
 =?utf-8?B?OC9lT1FZTFJDV0Zobk9KNUJ0ZlBpQUxhQjA2QjQrQlQ3Z3hrZVhPM1pxUWxq?=
 =?utf-8?B?ZlFRa1labVdUcitJdEFUTUlEZkFUSUNqZU9tOUo0VHl4Sy9OZExNK0hFaDUr?=
 =?utf-8?B?eGtMcmhnVmZmeUNlOUhrYmJHelFIbHZHK0svVnFiTDdJOVJ3ajAvNEN6N3Rw?=
 =?utf-8?B?U3RHSDJZUGZBb1dmRzM1cnZYeFVXbzVXaTA1RTFPT3UzYndycHp1WUJQNHFF?=
 =?utf-8?B?d3BIQ1lWamRJK3o5em5zTW5ueGRWRzJRVGpBVW1NOFQvN3FKblI3bFFGMDFm?=
 =?utf-8?Q?seImRFNbuaK49julXon7SOEnZV4H2o=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR12MB5284.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Mm5paHVZTzJtbDkwYlorTzR4aHFLVURrTk1oQ3cyY3BXVm85ajQ3U21TS0N0?=
 =?utf-8?B?UFVSM21zSWVlSFpBWHpKcDJ3dTNOQytYZkgxbVJ6aVB0b3pxSzZ3bElxZThS?=
 =?utf-8?B?cXdNb1dPWHZXZ3ZjNTd5WXpSc1FpUzk4SkQxUDBaQzd2UjcxQzBQM1lLZU9q?=
 =?utf-8?B?czRIMER1Z1NRMzJvOElyVlNGbnFRT2VWUjFXa2JVRFdiZ25kTXE2Ykd0QlQy?=
 =?utf-8?B?SVdFTWFRblpTM2duK1JWQmRzVU96R21EMkEvSmxIQXg5QldncFFRSGgvQ0w2?=
 =?utf-8?B?TUI1R01FYlE3aytZWEZZbDBpYi95K25NUzNCMlltUnYrZWEyZXo4WHo3OUtn?=
 =?utf-8?B?QnZVQWRNZVd2ekpnSlYwQ0NMYllieFlhejdyUXRUenJiT29VaDRvU0dUWVJj?=
 =?utf-8?B?emdDaHBvMTg2WDVINnhYK0NCSGdwYmE4YXRtcnJvMzk5UmwvNG9tdVZoc0hY?=
 =?utf-8?B?QlYvVTREQmFQVmdHV09qb1lsVHRnSVQrYUxReGhqMWRiZjVVaGc1Ny85RUN1?=
 =?utf-8?B?MXkvdjZCSm5jUStZVWllVUdxMGJzN2N6N3FTYTNOQXZ5dXNYYndMMyt4NWpI?=
 =?utf-8?B?NHpLZWszV0RVTVNBYlB1UWo4Q1pwblZ1UGJHSVEzK2tCM0g0bVZLWXduWkZH?=
 =?utf-8?B?SEZEQnNxc3hDaXcxWi9DSU5DMGduNUFkYk5pNkpmbGNZSUxiSjhQc2F5L3FM?=
 =?utf-8?B?SE9lYW5LeWNJeEMwVFpNK012Y0VrREZsbHM0Y2RaZTF5L20yM0xjL1ZVanBh?=
 =?utf-8?B?bFdUWWxOVzNjb2I0U0U4Nll2b3dlc0Z6MHluUmNTWlFuQklPVWp5c0hqTEc0?=
 =?utf-8?B?QWMxTUt3TURtaXFmQktNK0JaSjJ4RmlOOG1LZTZjaDRWMXFFVjEwbWtzSEVs?=
 =?utf-8?B?dDROeENxMmpTbmtiTXJDK1pBZTRUT2drRzRkWGxiazE2Z2pZQ1ZweU84c0dl?=
 =?utf-8?B?UkNodHUvTWhlRHZhVEU4MzVoYTVXc0Ixbk42R1JRb3h4Q285cXZxNjVWV2xZ?=
 =?utf-8?B?YktKQjltdWpvdFFoMHl6Sm15QU8rMy9wcGFNaW9tRU9QZW5ucjIzbUNPUHBn?=
 =?utf-8?B?aWtvTm1ZUmxUNStJeW1MSzBnMUNiaVIzekkvY2d6UW9jSW5Sd3BZOWhwVERl?=
 =?utf-8?B?Q0F5ZCtrSHhvc0ZLWTZEY1lLNlAyL0RqVVdncC8wZ3hXU1ZEVjBlMm12LytB?=
 =?utf-8?B?VGVGWWRkSkpsL0dxZyt4ZVJHdTNaS2l6d25jTTBSZ3Z5V0h3Qkt5WnoxdU1p?=
 =?utf-8?B?R2ZZMDVtZ2h4SVdsNTNMNmtyalBpdnVtNDluR1lGYXM5eHpRK09TWVNCY0U1?=
 =?utf-8?B?eDQ2bmYrVHgwMFliZUR2dWtoQk92Y29LZXZURHBYdTJHMHlBUUpGcmdia0JH?=
 =?utf-8?B?aFVmVEdUNk5LczF4UDFYdTErUThyRi95bjJsMk8vL2FrbkJGQlBjT3p3cERh?=
 =?utf-8?B?bHVxTS9uK2Y4WThueTluUWFYZjVCUFoyZDJPYVV0aCtTVk5USE1VRlY1VFM0?=
 =?utf-8?B?TC9OK3QvM1ltT1BWcXdERWdUek54K3NHaDdYN3RFVUl0Tkx6SlpIZUk0a3hq?=
 =?utf-8?B?am9sYyswY0FSYUlyYlp5K0NSTDh1VENKNG5wem9yTHM5SDJQdkhrcU9PUGRw?=
 =?utf-8?B?cUJyOCtWSmxBOG5Deko4KzUxTWhVYUtpYkZiOFFMN0YvOHVnVmVIVVhSUjhP?=
 =?utf-8?B?b0ZQRUJuR0FTZGRUUjE3dU91MUlwODcrRDNjZTE4U0QwSW1meUpyVjJHSUhr?=
 =?utf-8?B?TlRXVUZOU3g3ZUMrLzFRaHNnSUFrTTkzdTNCbnlxMjZuNENWMThjNVRiYnFV?=
 =?utf-8?B?U0R4d1RCRkFkTnhyWmpsYThBLzV5clMwNDg5VE5kbDMyN0JzZUZHN2ZCY2pS?=
 =?utf-8?B?UHJyMUtvNWtkM3dYcERXSXdzRGVUc3QwUWNQdmJBdW1rVm4vbFZySjNmb1pN?=
 =?utf-8?B?OE1uUG1ta0dZWlFWVU1XcTdYNm1BNHpReW9HYU1HM2hQa2lKaVFSWjgyczYr?=
 =?utf-8?B?UXFtL292b0U0Q09WSlBHZTJyTjVxTHpBMGl3c3IxNFVxcXVBdnNXbDFDZEt3?=
 =?utf-8?B?QVM2aDE0RnNFMjkwMTZ6TWhHYkdaOGpmTHNvNWlBZDJabjA4WDJnb2FTWElk?=
 =?utf-8?Q?4KGk=3D?=
Content-Type: multipart/alternative;
 boundary="_000_CH0PR12MB5284E08D45715F67C6B5BBD78B61ACH0PR12MB5284namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR12MB5284.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bca95d6-25a2-41f1-ef9d-08dd9f80b4e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2025 13:48:49.5832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2tp2E4X6aQSZbEkFacqZUtZho4ACieUDyAMC6qOwq2oRBtFN7EjDqPn3II/gELujpSrKaIBHSXs9P+rWL9yPsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6020
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

--_000_CH0PR12MB5284E08D45715F67C6B5BBD78B61ACH0PR12MB5284namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

W0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24gT25seV0N
Cg0KSGkgTWlrZSwNCg0KV2Ugd2VyZSB0cnlpbmcgdG8gc2VlIGlmIHdlIGNhbiByZXBybyB0aGUg
aXNzdWUgb24gbmV3ZXIgY2FyZHMgYXMgd2VsbCwgYnV0IGl0IHNlZW1zIG9ubHkgNjAwMCBzZXJp
ZXMgY2FuIHJlcHJvIGF0IG91ciBlbmQuDQpJZiB5b3UgY2FuIHJlcHJvIG1vcmUgZWFzaWx5IG9u
IG90aGVyIGNhcmRzLCBwbGVhc2UgYWRkICJkcm0uZGVidWc9MHgxMTYgbG9nX2J1Zl9sZW49MjBN
IiB0byB5b3VyIGtlcm5lbCBjbWRsaW5lIGFuZCBncmFiIHRoZSBkbWVzZyBwbGVhc2UuDQoNCkkn
ZCBhbHNvIGxpa2UgdG8ga25vdyBpZiB5b3VyIGlzc3VlIGlzIGZ1bGx5IHJlc29sdmVkIGlmICJk
cm0vYW1kL2Rpc3BsYXk6IG1vcmUgbGliZXJhbCB2bWluL3ZtYXggdXBkYXRlIGZvciBmcmVlc3lu
YyIgaXMgcmV2ZXJ0ZWQuDQoNCi0tDQoNClJlZ2FyZHMsDQpKYXkNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQpGcm9tOiBNaWtoYWlsIEdhdnJpbG92IDxtaWtoYWlsLnYuZ2F2cmls
b3ZAZ21haWwuY29tPg0KU2VudDogRnJpZGF5LCBNYXkgMzAsIDIwMjUgMjozNCBBTQ0KVG86IFBp
bGxhaSwgQXVyYWJpbmRvIDxBdXJhYmluZG8uUGlsbGFpQGFtZC5jb20+DQpDYzogQ2h1bmcsIENo
aWFIc3VhbiAoVG9tKSA8Q2hpYUhzdWFuLkNodW5nQGFtZC5jb20+OyBXdSwgUmF5IDxSYXkuV3VA
YW1kLmNvbT47IFdoZWVsZXIsIERhbmllbCA8RGFuaWVsLldoZWVsZXJAYW1kLmNvbT47IERldWNo
ZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IGFtZC1nZnggbGlzdCA8
YW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+OyBMaW51eCBMaXN0IEtlcm5lbCBNYWlsaW5nIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPjsgTGludXggcmVncmVzc2lvbnMgbWFpbGluZyBsaXN0IDxyZWdy
ZXNzaW9uc0BsaXN0cy5saW51eC5kZXY+DQpTdWJqZWN0OiBSZTogNi4xNS1yYzYvcmVncmVzc2lv
bi9iaXNlY3RlZCAtIGFmdGVyIGNvbW1pdCBmMWM2YmUzOTk5ZDIgZXJyb3IgYXBwZWFyZWQ6ICpF
UlJPUiogZGNfZG11Yl9zcnZfbG9nX2RpYWdub3N0aWNfZGF0YTogRE1DVUIgZXJyb3INCg0KT24g
TW9uLCBNYXkgMjYsIDIwMjUgYXQgMTA6NTDigK9QTSBQaWxsYWksIEF1cmFiaW5kbw0KPEF1cmFi
aW5kby5QaWxsYWlAYW1kLmNvbT4gd3JvdGU6DQo+DQo+IFtBTUQgT2ZmaWNpYWwgVXNlIE9ubHkg
LSBBTUQgSW50ZXJuYWwgRGlzdHJpYnV0aW9uIE9ubHldDQo+DQo+DQo+IEhpIE1pa2UsDQo+DQo+
IEl0IGlzIGluZGVlZCBhIGJpdCBoYXJkZXIsIGJ1dCB3ZSB3ZXJlIGFibGUgdG8gcmVwcm8gdGhl
IGlzc3VlIG9uIHRoZSA2MDAwIHNlcmllcy4gSSdsbCBuZWVkIHRvIGdldCB0aGUgRE1DVUIgdHJh
Y2UgbG9nIHRvIGNvbmZpcm0sIGJ1dCBpdCBsb29rcyBsaWtlIGFuIFNNVSBoYW5nIGZyb20gd2l0
aGluIERNQ1VCLiBTbyB3ZSdkIG5lZWQgbW9yZSBkZWJ1Z2dpbmcgdG8gZmluZCBvdXQgd2hhdHMg
Z29pbmcgd3JvbmcgZnJvbSBTTVUgc2lkZS4gTWVhbndoaWxlLCBJJ3ZlIHJldmVydGVkIDIxOTg5
OGQyOWM0MzhkOGVjMzRhNTU2MGZhYzRlYThmNmI4ZDRmMjAgdGhhdCB0cmlnZ2VyZWQgdGhlIGlz
c3VlIGZvciBhIGxvdCBvZiB0aGVtLg0KDQpIaSBBdXJhYmluZG8sDQoNCjIxOTg5OGQyOWM0Mzhk
OGVjMzRhNTU2MGZhYzRlYThmNmI4ZDRmMjA/DQpKdXN0IHRvIGNsYXJpZnkgLSBJ4oCZbSBjdXJy
ZW50bHkgcnVubmluZyBvbiA2LjE2LXJjMCAoOTBiODNlZmE2NzAxKSwgYW5kDQpJIHN0aWxsIHNl
ZSB0aGUgZm9sbG93aW5nIGNvbnN0YW50bHkgc3BhbW1pbmcgdGhlIGxvZyBvbiA3OTAwWFRYOg0K
YW1kZ3B1IDAwMDA6MDM6MDAuMDogW2RybV0gKkVSUk9SKiBkY19kbXViX3Nydl9sb2dfZGlhZ25v
c3RpY19kYXRhOg0KRE1DVUIgZXJyb3IgLSBjb2xsZWN0aW5nIGRpYWdub3N0aWMgZGF0YQ0KDQpM
ZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtZSB0byBjYXB0dXJlIGFueSBhZGRpdGlvbmFsIHRyYWNl
cyBvciBsb2dzLg0KDQotLQ0KQmVzdCBSZWdhcmRzLA0KTWlrZSBHYXZyaWxvdi4NCg==

--_000_CH0PR12MB5284E08D45715F67C6B5BBD78B61ACH0PR12MB5284namp_
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWw+DQo8aGVhZD4NCjxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0i
dGV4dC9odG1sOyBjaGFyc2V0PXV0Zi04Ij4NCjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyIgc3R5bGU9
ImRpc3BsYXk6bm9uZTsiPiBQIHttYXJnaW4tdG9wOjA7bWFyZ2luLWJvdHRvbTowO30gPC9zdHls
ZT4NCjwvaGVhZD4NCjxib2R5IGRpcj0ibHRyIj4NCjxwIHN0eWxlPSJmb250LWZhbWlseTpDYWxp
YnJpO2ZvbnQtc2l6ZToxMHB0O2NvbG9yOiMwMDAwRkY7bWFyZ2luOjVwdDtmb250LXN0eWxlOm5v
cm1hbDtmb250LXdlaWdodDpub3JtYWw7dGV4dC1kZWNvcmF0aW9uOm5vbmU7IiBhbGlnbj0iTGVm
dCI+DQpbQU1EIE9mZmljaWFsIFVzZSBPbmx5IC0gQU1EIEludGVybmFsIERpc3RyaWJ1dGlvbiBP
bmx5XTxicj4NCjwvcD4NCjxicj4NCjxkaXY+DQo8ZGl2IGNsYXNzPSJlbGVtZW50VG9Qcm9vZiI+
SGkgTWlrZSw8L2Rpdj4NCjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj48YnI+DQo8L2Rpdj4N
CjxkaXYgY2xhc3M9ImVsZW1lbnRUb1Byb29mIj5XZSB3ZXJlIHRyeWluZyB0byBzZWUgaWYgd2Ug
Y2FuIHJlcHJvIHRoZSBpc3N1ZSBvbiBuZXdlciBjYXJkcyBhcyB3ZWxsLCBidXQgaXQgc2VlbXMg
b25seSA2MDAwIHNlcmllcyBjYW4gcmVwcm8gYXQgb3VyIGVuZC48L2Rpdj4NCjxkaXYgY2xhc3M9
ImVsZW1lbnRUb1Byb29mIj5JZiB5b3UgY2FuIHJlcHJvIG1vcmUgZWFzaWx5IG9uIG90aGVyIGNh
cmRzLCBwbGVhc2UgYWRkICZxdW90O2RybS5kZWJ1Zz0weDExNiBsb2dfYnVmX2xlbj0yME0mcXVv
dDsgdG8geW91ciBrZXJuZWwgY21kbGluZSBhbmQgZ3JhYiB0aGUgZG1lc2cgcGxlYXNlLjwvZGl2
Pg0KPGRpdiBjbGFzcz0iZWxlbWVudFRvUHJvb2YiPjxicj4NCjwvZGl2Pg0KPGRpdiBjbGFzcz0i
ZWxlbWVudFRvUHJvb2YiPkknZCBhbHNvIGxpa2UgdG8ga25vdyBpZiB5b3VyIGlzc3VlIGlzIGZ1
bGx5IHJlc29sdmVkIGlmICZxdW90OzxzcGFuIHN0eWxlPSJmb250LWZhbWlseTogQXB0b3MsIEFw
dG9zX0VtYmVkZGVkRm9udCwgQXB0b3NfTVNGb250U2VydmljZSwgQ2FsaWJyaSwgSGVsdmV0aWNh
LCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7Ij5kcm0v
YW1kL2Rpc3BsYXk6IG1vcmUgbGliZXJhbA0KIHZtaW4vdm1heCB1cGRhdGUgZm9yIGZyZWVzeW5j
JnF1b3Q7IGlzIHJldmVydGVkLjwvc3Bhbj48L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5
OiBBcHRvcywgQXB0b3NfRW1iZWRkZWRGb250LCBBcHRvc19NU0ZvbnRTZXJ2aWNlLCBDYWxpYnJp
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0KPGJyPg0KPC9kaXY+DQo8ZGl2IGlkPSJTaWduYXR1cmUiIHN0eWxlPSJjb2xvcjog
aW5oZXJpdDsiPg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFsLCBIZWx2
ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAwLCAwKTsi
Pg0KLS08L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJpLCBBcmlhbCwgSGVs
dmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiByZ2IoMCwgMCwgMCk7
Ij4NCjxicj4NCjwvZGl2Pg0KPGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IENhbGlicmksIEFyaWFs
LCBIZWx2ZXRpY2EsIHNhbnMtc2VyaWY7IGZvbnQtc2l6ZTogMTJwdDsgY29sb3I6IHJnYigwLCAw
LCAwKTsiPg0KUmVnYXJkcyw8L2Rpdj4NCjxkaXYgc3R5bGU9ImZvbnQtZmFtaWx5OiBDYWxpYnJp
LCBBcmlhbCwgSGVsdmV0aWNhLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDEycHQ7IGNvbG9yOiBy
Z2IoMCwgMCwgMCk7Ij4NCkpheTxicj4NCjwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGlkPSJhcHBlbmRv
bnNlbmQiPjwvZGl2Pg0KPGhyIHN0eWxlPSJkaXNwbGF5OmlubGluZS1ibG9jazt3aWR0aDo5OCUi
IHRhYmluZGV4PSItMSI+DQo8ZGl2IGlkPSJkaXZScGx5RndkTXNnIiBkaXI9Imx0ciI+PGZvbnQg
ZmFjZT0iQ2FsaWJyaSwgc2Fucy1zZXJpZiIgc3R5bGU9ImZvbnQtc2l6ZToxMXB0IiBjb2xvcj0i
IzAwMDAwMCI+PGI+RnJvbTo8L2I+IE1pa2hhaWwgR2F2cmlsb3YgJmx0O21pa2hhaWwudi5nYXZy
aWxvdkBnbWFpbC5jb20mZ3Q7PGJyPg0KPGI+U2VudDo8L2I+IEZyaWRheSwgTWF5IDMwLCAyMDI1
IDI6MzQgQU08YnI+DQo8Yj5Ubzo8L2I+IFBpbGxhaSwgQXVyYWJpbmRvICZsdDtBdXJhYmluZG8u
UGlsbGFpQGFtZC5jb20mZ3Q7PGJyPg0KPGI+Q2M6PC9iPiBDaHVuZywgQ2hpYUhzdWFuIChUb20p
ICZsdDtDaGlhSHN1YW4uQ2h1bmdAYW1kLmNvbSZndDs7IFd1LCBSYXkgJmx0O1JheS5XdUBhbWQu
Y29tJmd0OzsgV2hlZWxlciwgRGFuaWVsICZsdDtEYW5pZWwuV2hlZWxlckBhbWQuY29tJmd0Ozsg
RGV1Y2hlciwgQWxleGFuZGVyICZsdDtBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tJmd0OzsgYW1k
LWdmeCBsaXN0ICZsdDthbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs7IGRyaS1kZXZl
bCAmbHQ7ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZyZndDs7DQogTGludXggTGlzdCBL
ZXJuZWwgTWFpbGluZyAmbHQ7bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyZndDs7IExpbnV4
IHJlZ3Jlc3Npb25zIG1haWxpbmcgbGlzdCAmbHQ7cmVncmVzc2lvbnNAbGlzdHMubGludXguZGV2
Jmd0Ozxicj4NCjxiPlN1YmplY3Q6PC9iPiBSZTogNi4xNS1yYzYvcmVncmVzc2lvbi9iaXNlY3Rl
ZCAtIGFmdGVyIGNvbW1pdCBmMWM2YmUzOTk5ZDIgZXJyb3IgYXBwZWFyZWQ6ICpFUlJPUiogZGNf
ZG11Yl9zcnZfbG9nX2RpYWdub3N0aWNfZGF0YTogRE1DVUIgZXJyb3I8L2ZvbnQ+DQo8ZGl2PiZu
YnNwOzwvZGl2Pg0KPC9kaXY+DQo8ZGl2IGNsYXNzPSJCb2R5RnJhZ21lbnQiPjxmb250IHNpemU9
IjIiPjxzcGFuIHN0eWxlPSJmb250LXNpemU6MTFwdDsiPg0KPGRpdiBjbGFzcz0iUGxhaW5UZXh0
Ij5PbiBNb24sIE1heSAyNiwgMjAyNSBhdCAxMDo1MOKAr1BNIFBpbGxhaSwgQXVyYWJpbmRvPGJy
Pg0KJmx0O0F1cmFiaW5kby5QaWxsYWlAYW1kLmNvbSZndDsgd3JvdGU6PGJyPg0KJmd0Ozxicj4N
CiZndDsgW0FNRCBPZmZpY2lhbCBVc2UgT25seSAtIEFNRCBJbnRlcm5hbCBEaXN0cmlidXRpb24g
T25seV08YnI+DQomZ3Q7PGJyPg0KJmd0Ozxicj4NCiZndDsgSGkgTWlrZSw8YnI+DQomZ3Q7PGJy
Pg0KJmd0OyBJdCBpcyBpbmRlZWQgYSBiaXQgaGFyZGVyLCBidXQgd2Ugd2VyZSBhYmxlIHRvIHJl
cHJvIHRoZSBpc3N1ZSBvbiB0aGUgNjAwMCBzZXJpZXMuIEknbGwgbmVlZCB0byBnZXQgdGhlIERN
Q1VCIHRyYWNlIGxvZyB0byBjb25maXJtLCBidXQgaXQgbG9va3MgbGlrZSBhbiBTTVUgaGFuZyBm
cm9tIHdpdGhpbiBETUNVQi4gU28gd2UnZCBuZWVkIG1vcmUgZGVidWdnaW5nIHRvIGZpbmQgb3V0
IHdoYXRzIGdvaW5nIHdyb25nIGZyb20gU01VIHNpZGUuIE1lYW53aGlsZSwNCiBJJ3ZlIHJldmVy
dGVkIDIxOTg5OGQyOWM0MzhkOGVjMzRhNTU2MGZhYzRlYThmNmI4ZDRmMjAgdGhhdCB0cmlnZ2Vy
ZWQgdGhlIGlzc3VlIGZvciBhIGxvdCBvZiB0aGVtLjxicj4NCjxicj4NCkhpIEF1cmFiaW5kbyw8
YnI+DQo8YnI+DQoyMTk4OThkMjljNDM4ZDhlYzM0YTU1NjBmYWM0ZWE4ZjZiOGQ0ZjIwPzxicj4N
Ckp1c3QgdG8gY2xhcmlmeSAtIEnigJltIGN1cnJlbnRseSBydW5uaW5nIG9uIDYuMTYtcmMwICg5
MGI4M2VmYTY3MDEpLCBhbmQ8YnI+DQpJIHN0aWxsIHNlZSB0aGUgZm9sbG93aW5nIGNvbnN0YW50
bHkgc3BhbW1pbmcgdGhlIGxvZyBvbiA3OTAwWFRYOjxicj4NCmFtZGdwdSAwMDAwOjAzOjAwLjA6
IFtkcm1dICpFUlJPUiogZGNfZG11Yl9zcnZfbG9nX2RpYWdub3N0aWNfZGF0YTo8YnI+DQpETUNV
QiBlcnJvciAtIGNvbGxlY3RpbmcgZGlhZ25vc3RpYyBkYXRhPGJyPg0KPGJyPg0KTGV0IG1lIGtu
b3cgaWYgeW91IG5lZWQgbWUgdG8gY2FwdHVyZSBhbnkgYWRkaXRpb25hbCB0cmFjZXMgb3IgbG9n
cy48YnI+DQo8YnI+DQotLSA8YnI+DQpCZXN0IFJlZ2FyZHMsPGJyPg0KTWlrZSBHYXZyaWxvdi48
YnI+DQo8L2Rpdj4NCjwvc3Bhbj48L2ZvbnQ+PC9kaXY+DQo8L2Rpdj4NCjwvYm9keT4NCjwvaHRt
bD4NCg==

--_000_CH0PR12MB5284E08D45715F67C6B5BBD78B61ACH0PR12MB5284namp_--
