Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E68HM1te2mMEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:25:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 249F1B0E5F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868B110E875;
	Thu, 29 Jan 2026 14:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ctNz5+i0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013062.outbound.protection.outlook.com
 [40.107.201.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE47A10E86D;
 Thu, 29 Jan 2026 14:25:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R+NVS28HCJRt/a9KWGLAS5zyDBD8iGZVJENd671bpowGD3atdpRfXUL8TUGT/eKbgLO7vos7LRzLN5QfGroIKTD9FATEzuL9EM+XH3fFeABF/3JrPxcL+LSuILKS54saE8yKjbOaA1cb6/N+3tKNZGvsC+akLtegPimHbQL9rPoa8b0726FEWWmYWsTPSeV58h+vdH8S3e+pVogAapttfHVOyA8lyPS28qakyGIffLQCrVzU4lwG4bkzNWnFxooQnhtcbsVIBu8zqTmBR2mvffTNYlaZBB6LQWT8d8AhBc+/HVUPOa9O92KTB2MgDcJbRhjZ/5NOkcsElnvHFKkITA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R9esc8zSYISgOTdUBQo3JlMe6LESjD4k5Zn8zaCEqDM=;
 b=FBDLw1yCzt+t/gX26J7Ya44DVOjOoDeEpC5BMm4+5MpuKcJllCkbsQnNN9jQJHpa0poD2kWb3ylqq+W51KxhK9Am4wdTqBKyfGeNC3gsIfEWx21Xdx464jxQtI++FcBe8ht1t5skmdTo12K9ypdNZ6hD/AinJniwAeLcaX/uZVvXR0zAACFzHlJGk9A0WDrinvoEHqTDAHpJaaiuN1473Gh+iEgUIiOVtKhzhrRNQ34PtHwac1uhKrT2wX8UylszJX+k3AwqWzEjyYlQ2MCdQ7gRZyQzp79dmeshM9Oi+TTnC1SE9K4AKTufPmp2l+MsQweP//X0PeOLBNq9d25hhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R9esc8zSYISgOTdUBQo3JlMe6LESjD4k5Zn8zaCEqDM=;
 b=ctNz5+i0eC0EvNr7yvJnwYwII3/WrVEkDamNXvS25ZWPrS2VklvfePp7vhwgPjzgB966P9MHFzsIcK+/WBITBDH8LzM8rt2nMDiUu+lcRaI1zVvp5jDpDwjTlXFUNREwVk/lhVi8beBOx5H8gdGXkxloLzjMMvzmBCWQrNHPv30=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS5PPFBB8C78349.namprd12.prod.outlook.com (2603:10b6:f:fc00::660)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 14:25:06 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 14:25:06 +0000
Message-ID: <1a75a4d2-64f3-4d19-802c-fc5c79b002c6@amd.com>
Date: Thu, 29 Jan 2026 15:24:56 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
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
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
 <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com> <aXto53g2mSNsNmFM@hal-station>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aXto53g2mSNsNmFM@hal-station>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0664.namprd03.prod.outlook.com
 (2603:10b6:408:10e::9) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS5PPFBB8C78349:EE_
X-MS-Office365-Filtering-Correlation-Id: 4994473c-ab7a-4d43-937a-08de5f423316
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHhiMy95Z1BidUJTcllnY0RPU1FBZXh6cWliOThEcWFiYW16bUlxZ2wvcERB?=
 =?utf-8?B?Wks3U0V1K3lsamdYdFhuVGJLY05SNXZMU2p6NDJ3cXVpcC9MenE5Tk5JT29Y?=
 =?utf-8?B?RGpISDMzcG9QTTE5UGNwckV4NW95bE1jY2ZZR3hxZWs5MDlBckZ1QlBXRUdq?=
 =?utf-8?B?cG13UXliNCtlaU8rV3BVb0wvLzBtNTNENGtCQS9sVnp1Qkc5djltTlhtWkE5?=
 =?utf-8?B?QktqSG04Y2JjdGxSc3djTnhuWVlpZEpHczlUTG1lL0hPemJzZ3FzK3BoZ1Nv?=
 =?utf-8?B?UllZcjFraDA2MjIrMzMwL0xLd1VJdzVsdVRrenpybllxYkxzS0plOGt5V1pX?=
 =?utf-8?B?c0h3bHo2NkJEcFdqYjBtVm5mMXVSVE01UWd6bkNjVXVIMEIwZjVIb203ZkVx?=
 =?utf-8?B?SE9XODFyYi9VOE05THFRMEV4NDBkdWE5RldXMXQ1cWJkamZiZDdDdTVSdTYv?=
 =?utf-8?B?SG5MWnNRenhhak5LQ0JLOUJhcm50MHFHREh6TUxFWkhHaGdFRHgvUkUvMWtN?=
 =?utf-8?B?Kys3WmRXZkJLc2s3d3hVdU1xUFNxMjFQTmdRRjRWVHNHNUpoTHM1aTlDRXhv?=
 =?utf-8?B?MVgvTTNOclMyMjBsQWRhSHgrRzN5MTlyV2gwOW1jaEZrczU4UER4RWt2MnAz?=
 =?utf-8?B?eTVvbWYzajZlQVhrS0pES0hDcnJBS0J5L3ZxZjM5c1E3Q0EwdXllb29pMUc1?=
 =?utf-8?B?Y3p3emZJa1RpaXorUlE5TkRPdkZhaW5DTmllczVhSnBMbFZKa1pyRHhONmRV?=
 =?utf-8?B?b1pWemdKNlVBOTcyblA3T250YllBUlZvSnlRTGNPcDB5RjU4MC9vTXRrQlhL?=
 =?utf-8?B?K1B6eHovUFVjMkJpL2ZIT01BSkp4TEt2bEtPYXgzSFliZ09GK0Q1Vi9DaG9C?=
 =?utf-8?B?eWhXSE1QUHl3dFpCTHphUWJ0czQycGRIYmVSaUQxWlJLeEEvV0R1L2xoR0wv?=
 =?utf-8?B?VmVCQTAwdFdKc0EvcWtCWlAvZGlsTmhBSDFzcFp2ckhPRHZTaXEvSE9ES1NF?=
 =?utf-8?B?WlZob1pCaHVNanl1UUhva1NqV2ZDa2VPV3B3eWxhRWhOVnhCdzl1V25ZaGE0?=
 =?utf-8?B?SXl5WXVrQnBPMS9ZYk1yQVRTWTRrTEVxMnZRQnFGUEJ2Q25lNlNDc0dKeGt2?=
 =?utf-8?B?YldyTElWZ2ZYdlRHZVF4cG5FRVJqemFhV0JtaXZkaGoxQURvSUVCdDZWUjRL?=
 =?utf-8?B?Z3VXNVg4TmlmSjg0aDBnaFVhNStpL1NoM3ZWcFJlY25lTy9JY1oyWGVYVVMy?=
 =?utf-8?B?b2RwZXNvMC9RUzFoeWU5N2gwYko1aWNlQW9ZYTA0dmllbFd2Slh0STJPVWlZ?=
 =?utf-8?B?allyTGpyYWxsZGppVTErbGkxalVQNWVNRWZBcEJPYUc2MC80ckNHK1dUeC84?=
 =?utf-8?B?bFpYc2hKSXc0OHJXaTQ2dW5LSkRsUWZBbkw1aU5KMDVORTJjZklvRm9ncWNJ?=
 =?utf-8?B?R2UwSlIvZW1XY1hJMWU0VCtTdlgwRnQ3dTNEZC8xVWdweGNQRDhQdmg3WVRY?=
 =?utf-8?B?bCtGOHJKZzZ2aG4rZVFJMlRGc3h3dU5ETjlHRGxndzBDMzV0OWtza3JMK1pG?=
 =?utf-8?B?cEtvSGxSU2lTc3F1VFpzQkdJRUhCc1NObWsrUWRBNUhqam5aTEVoM3RIQ0l3?=
 =?utf-8?B?MU1wQ3d2UDkxWk9xVTFLRzMzcDRISjY5Q0V0NzNhZGxGV255dTBGSjFUMzFr?=
 =?utf-8?B?bnJ6S28rM29kWEhvdnkyWWZvQ1VWczE1ak9Jb3lTTWtwejNxM1lsSUdLOFRk?=
 =?utf-8?B?dzFCU1Jwc0sxQVJUZEVFSWRpZXA2UXNhTlNVSWNzL2sxOFFyZHRTQ0dtSFFT?=
 =?utf-8?B?MHhBdlNnTWZDeTltSGxmbFk4UDl3enlPeVBDeXVsWkhOSWVRVU5aRDJycGNj?=
 =?utf-8?B?a1dxVzh1UTMvditaRHhveWpSRmZqRjFycGdUZ2N0cCtadGMrODZTYjZEZkdn?=
 =?utf-8?B?VUR5M3RPOHNUMi9kZFVxbTN6Nm9NNUZFRzhTeVdnbTBrMVBmSDNqS0VCZ2ha?=
 =?utf-8?B?Qit6NUhxQ0tLbmZwaDJZNURxWCtkMFBleUNpcmlrd2ptTk5VNDZrd2I0dURG?=
 =?utf-8?B?amUzQ3UrUEdhSjU5azBETnA2NTMvSG1nblhpK2J4VGRBcVVJOGtvcks1TnBu?=
 =?utf-8?Q?t3F4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2M4cEFZQ1RUMUpXaXF6VG81VnZEOFlnTDZFY2hjSTdvZC9EUE9rVDFqVmVM?=
 =?utf-8?B?OURkMWJMeFNZSFcvM0kxa0MzZW44ZUlhQjdSWGpiTWNlTWg4c3lKNUZPMUtX?=
 =?utf-8?B?SmI3cWt2Q1MwRkd5WTM3YWgxN1VVb1hqeXNhWnE2ODFwbUpBcGxXMS9mNW55?=
 =?utf-8?B?VDRWb1FvSi9WQ3RleUQ3U1UyQXhRRWlCVGN2bjlVV25IUkF3K2pDbS9MV0VM?=
 =?utf-8?B?UjJOV05TZGFIZ1BNU2pUaGc2WWNZek41M0NFY1A0Q3dBcHVDandCVTRhNWl1?=
 =?utf-8?B?T0hMZE10NHlYMWtibDNsdnNRbSsyYUdwTXNpNUtENmdUN2VsSWJiUWRQdEUw?=
 =?utf-8?B?S3VOWm8xUkNabXRqOUdvTVhIV1dHQXpqbG50MkN2bHBZblQwbm4zZEhDbVFz?=
 =?utf-8?B?bVpScU1LZGxXQnpsVlU4ZFRkS3ltRVkraVdiWWsvWmZ5TXk2dGQ2VWJqbFZj?=
 =?utf-8?B?Z3dkU3JLWlJQNE51WlVrMS9hNWp6eFM2QVU3cmFHZStNVHZVdEJycDQwcXBY?=
 =?utf-8?B?UFBJWVJKMHkwM3o3WnBsWE5GVVpSM1VIKzN2UGxUcE4zN3FOeDk5UFlOWGF2?=
 =?utf-8?B?WFNPVkNvM2dGUVVpMWI1T3hnZkptTHpBUFBDTWttREtaejFuMFlybjg0RkJB?=
 =?utf-8?B?dGdyVDhnOGpBSnJ2RnErV2xiNlZTRW9FVGZ2QXFlTURRM0FLMVlLWEoyY0Ru?=
 =?utf-8?B?NGVxYzJBOGd2Q05wT1lEcTNMWXNTVGlnV0t2TDY5K1FxYWpjZDAxV0hIWlR1?=
 =?utf-8?B?VkE1eXVPQUJVQ3M1WXN0WDI1eWZpR2cxcXArMjJ6Z1BlaDRuQ3ZnWERNZXR5?=
 =?utf-8?B?UmpRNEZHNm1mRThTTStnOWF6U01HdmJTRmMrdjMvUWtCYTFNVmtpODdIcUlr?=
 =?utf-8?B?R2UwWG5wMzRYYWpQcml2R0NsZElrMzNYMmdIM3BIT2JhZ2w3UHcwcThQdkhi?=
 =?utf-8?B?Qnpvcit1OFpyVVlIRC9lY2JwY01BRjNhNllzcm53V1VBZCtUZEZ2UElzdG1X?=
 =?utf-8?B?blZwaEZwYVZSdDgvUHpVV2ZWV3B5RUFHeVJDSmFzemw2Y0pZYW5XRUd5cnhF?=
 =?utf-8?B?bTVEc0lqV0JBOEVoV0hVSnpIYXFQaWcrYUoyRnYzTVRWa3pmbU9zYVR1MTFY?=
 =?utf-8?B?RGw0RzJKUktSSVdFWEJyRlZITUVUVmMxcXBrdG16QWNKTkFqOThyeWxsNzJP?=
 =?utf-8?B?bzBVT0dHTFBWUmRFcHNmeGFDU1Z5K21PRmRMa0prM04ybFV6aVpxMEMxQ0dz?=
 =?utf-8?B?RVhvZ2U4K0p2WmZDOGZpcHM3cmVpUEVIazR3MlFQbW91V0YyYWExcHdXV3Ir?=
 =?utf-8?B?RXlsT0Q5N0dVOWlBc0pNTXFodFZpOEpNOVQvVi9rbUcvdEZMVVlCWk5HL3lU?=
 =?utf-8?B?MlRqTTZ1dnpFWEJ2Wk9Dc0FHN2dLb2hpZ0ZjaENaUzFUVHBPdEo0dkdBRnVu?=
 =?utf-8?B?dU9oNWRLbmJGQ1VKajdwRFBPdEVLS2xYNTlBZ2xnZjZFUUhETjYwajFrQi9D?=
 =?utf-8?B?eXorYlNIV3c1VmRNTWtodWdHYm56bG55eHUxWEY3VEVmbW9nam1oWWxuMjBR?=
 =?utf-8?B?Ni93RzZJQVZuUytjVHhoRVNuOWduZDJ3VURvSG05SkYrdVk4WVJCQzdhZ1dq?=
 =?utf-8?B?ejFGR01hT3BwdVp2ZHM0Z0J1eWI2WkRJT2xyNUJCTWxBQ3BZWHZCQkJ3RHNB?=
 =?utf-8?B?QXBMWVhUTHFSYVVHeEpKNEJOa3pBUFhURzVxdUhSampsYTEwSlBBRW9vWkwv?=
 =?utf-8?B?M0U3dVh2MCtFaTVkbXk3ZFRVZEhKQ0M0NjFZRmpJR0I1Z2c0R3RiNklMOUdy?=
 =?utf-8?B?aTAyVHNQU05POStTWHhJRXRJTE1QY1NmaHBZZXJaRmNYdGx3VSthQ0Yza0JM?=
 =?utf-8?B?S0JNa203WStoUlFTL1dUbjhHYjNzY0V4bEpBSVRVV0pES0VRRm9EYXpzSnlz?=
 =?utf-8?B?czE2elpTb3hBL3pEN095NXBDcFVMZUdrSDdhaEV0MXpoNGI0ZzJqeHNWZUdi?=
 =?utf-8?B?amhCd1RxbkNuSEpCVUMvOFZsMVdVd3pjdDgwY0k1V01tK3FwdGpVQWNCUWow?=
 =?utf-8?B?Qm5oT0FEa2JFdjU3d1NHTFVSZ2NQbklqYmNSenlGM1FlZGY3RU84WVM1MFE5?=
 =?utf-8?B?MVFCVGxsRGc2K1diREp5UW1tOGhZbVRqWkpkalFOYzFURHBPamRuaVBUUkor?=
 =?utf-8?B?c2VoRVN3Mlh0ZW9ld2l4Mnp3SW5iVll2QVB6akxWTHVVdG03amkrb1RnYnhp?=
 =?utf-8?B?OENYZitsenowQWNJdGZ0N1ZDTFhiRFFPZktkRHB2c2ZkUmtwWTJzYVYzT29a?=
 =?utf-8?Q?OcxHiVYdz0cah39Kls?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4994473c-ab7a-4d43-937a-08de5f423316
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:25:06.5479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V7TW6a1OmLDEvJ5HpdjtLjBK8C5zxRW+uyDr3mjXtliwp5GE7gNF/WlDscJCuZvP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBB8C78349
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,amd.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 249F1B0E5F
X-Rspamd-Action: no action

On 1/29/26 15:04, Hamza Mahfooz wrote:
> On Thu, Jan 29, 2026 at 01:59:00PM +0100, Christian König wrote:
>>> How do you propose to do that?
>>
>> I need to dig a bit into the DAL/DC code and see how the signaling path actually goes.
>>
>> Going to give that a try tomorrow.
>>
> 
> For recent ASICs, something along the lines of the following should do
> the trick:

Thanks a lot for that. What happens if you apply this?

Can the higher level handling recover from that? E.g. continue after 10 second timeout.

Thanks,
Christian.

> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> index dc8d2f52c7d6..fac668c2fcfb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
> @@ -510,6 +510,7 @@ struct amdgpu_crtc {
>  	bool wb_pending;
>  	bool wb_enabled;
>  	struct drm_writeback_connector *wb_conn;
> +	int pflip_cnt;
>  };
>  
>  struct amdgpu_encoder_atom_dig {
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 740711ac1037..1c3b7fbab1c6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -427,6 +427,18 @@ static inline bool update_planes_and_stream_adapter(struct dc *dc,
>  					   stream_update);
>  }
>  
> +static inline bool update_pflip_cnt(struct amdgpu_crtc *acrtc)
> +{
> +	int cnt = acrtc->pflip_cnt++;
> +
> +	if (cnt == 300) {
> +		acrtc->pflip_cnt = 0;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  /**
>   * dm_pflip_high_irq() - Handle pageflip interrupt
>   * @interrupt_params: ignored
> @@ -454,6 +466,9 @@ static void dm_pflip_high_irq(void *interrupt_params)
>  		return;
>  	}
>  
> +	if (update_pflip_cnt(amdgpu_crtc))
> +		return;
> +
>  	spin_lock_irqsave(&adev_to_drm(adev)->event_lock, flags);
>  
>  	if (amdgpu_crtc->pflip_status != AMDGPU_FLIP_SUBMITTED) {
> @@ -589,6 +604,9 @@ static void dm_vupdate_high_irq(void *interrupt_params)
>  	acrtc = get_crtc_by_otg_inst(adev, irq_params->irq_src - IRQ_TYPE_VUPDATE);
>  
>  	if (acrtc) {
> +		if (update_pflip_cnt(acrtc))
> +			return;
> +
>  		vrr_active = amdgpu_dm_crtc_vrr_active_irq(acrtc);
>  		drm_dev = acrtc->base.dev;
>  		vblank = drm_crtc_vblank_crtc(&acrtc->base);
> @@ -659,6 +677,9 @@ static void dm_crtc_high_irq(void *interrupt_params)
>  	if (!acrtc)
>  		return;
>  
> +	if (update_pflip_cnt(acrtc))
> +		return;
> +
>  	if (acrtc->wb_conn) {
>  		spin_lock_irqsave(&acrtc->wb_conn->job_lock, flags);

