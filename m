Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DB5A876FE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 06:39:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA86D10E48B;
	Mon, 14 Apr 2025 04:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2AV8uyit";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E66610E489;
 Mon, 14 Apr 2025 04:39:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHY4nvbgnWsE42H82IGdIG0HoXyTK4Tpvdg/iXyfIA+CrDB5PiYTwgKR8+4J+S5O7bdEZ4QUo4vJCnO0lDJhVvXc79qHuiyy1hFF+kdiGpqMAtyYfzqJxZ7VDEhev/2WmifltSEoceXfhsh1a/rd6Z8/bFO/T301enUf5xFAFyUPxUeM+wlgdP7O6JGqPZEAASFEqln1wxSa1L8+xEPJmumqkVSvw9WzF98jXPdtGvCBAiD2+7FYSlpPaR5wPenHJi5dYAHUZbW5LIEJ3a1QLC4nErjXz00AfKMcZ8tIpB0O0/Q/ihy2MTKbEaie9Q1jfCEdUqDQyJLOlOq5S/qI8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ayD4/R5MaaTCC5SwzqufT+gc9jgbtyiHRea9As76ykY=;
 b=shXpHXH8VXnfi/PxM5XvdpuDxMj5scoMOWVPWU5oWsLjdNOL1VjV6jWh/uVhynNzwvG6ufk+FdBYsONm8Jhh743B412mAYGodViYmwX2XBl25AB5mZvlowyLQIepYyeSj3o2hEdVi2FQIWgtvGI6bPV52v4kuW1f2PZcgshjrtTxYUQ6IFQKCdhvrxW6lXcuHpNKRw46aQXvb/53Rc0Pk2SKozTB8QCSZC/aY5h7/2RIgOXabN+sfHcIzVEtxlpH+AY1a6mgvG2jiuMojnFSGI3VL4Dw9A4Jzr3mBUVxH4szeIOOZ7mAVUWVDX9pdT0Rr9+6POII/xLj99EoeIS61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ayD4/R5MaaTCC5SwzqufT+gc9jgbtyiHRea9As76ykY=;
 b=2AV8uyitiX4/oV9RH3x7M2GbcK8Xj2C/tVPZESR0xfI7U4HDm958GvPk0Ty5Odgj2UEXHJY3XfybQwVRY9FU9tOo/ryfLzapxlO/+rX4GQyHrl7JaYUG8BckAJaOzEdXaN/qIL6CsoFBzZzpRvf+n4qeLt0Twm+O2y/+bulsoys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5052.namprd12.prod.outlook.com (2603:10b6:408:135::19)
 by MW4PR12MB6684.namprd12.prod.outlook.com (2603:10b6:303:1ee::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Mon, 14 Apr
 2025 04:38:57 +0000
Received: from BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf]) by BN9PR12MB5052.namprd12.prod.outlook.com
 ([fe80::7714:4f80:f3e1:60cf%5]) with mapi id 15.20.8632.025; Mon, 14 Apr 2025
 04:38:57 +0000
Subject: Re: [PATCH v2 2/2] drm/amdgpu: Clean up error handling in
 amdgpu_userq_fence_driver_alloc()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Alex Deucher <alexander.deucher@amd.com>
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 Arvind Yadav <Arvind.Yadav@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <cover.1744468610.git.dan.carpenter@linaro.org>
 <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
From: "Yadav, Arvind" <arvyadav@amd.com>
Message-ID: <3d8df435-a248-4f38-7a2a-b0f2ec908ae0@amd.com>
Date: Mon, 14 Apr 2025 10:08:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
In-Reply-To: <b9adf038b3ccf058c49e7e74e1998bc2216e0678.1744468610.git.dan.carpenter@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ClientProxiedBy: PN4P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b1::11) To BN9PR12MB5052.namprd12.prod.outlook.com
 (2603:10b6:408:135::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5052:EE_|MW4PR12MB6684:EE_
X-MS-Office365-Filtering-Correlation-Id: f23f74e7-ecd2-492e-f202-08dd7b0e44b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWlOMDgrdWdEMGdDSWJvd0lxRlRzZEtCUG9tVGxiSklCSXZIUGIzMXBaU04y?=
 =?utf-8?B?NEVGZnAwUWZFS1hsMGZBQ0N4REtxSTJIUGJ3QUpzRXVzQTVmZHh1QWxDQStU?=
 =?utf-8?B?RDVNU0VPd3NXMEx2bklNcG9uM0ROWG5sWlBsdEUyVGhNNHlYQW03Nm9haXlp?=
 =?utf-8?B?bGt6cFExQmRNR0pmK2hxc09qa2FJcnBxdnZkeFlBN0xHZVIwVmFsOGZ5ZitX?=
 =?utf-8?B?azVlNXk3NzQzSEw2SVJhK1dGaE1ybE1VT1JSa2NYdUQwNjRDUnMzQ09Jb3JS?=
 =?utf-8?B?OE9QNEVCcUFrK25ya3RucGdvNk5SQ29uVXMwd080NFVmUXJ4VnBucExSaDNs?=
 =?utf-8?B?OWswWHl0eXphYzRtblZDV3plRytuUVdWcHVaYnRYdDRMVzZUODRvbVp4VWF0?=
 =?utf-8?B?b1V1cFpxZFNJTk1SMGE2NlhQRENnaWs4MkZiL1RHdTJwb2hQUjFDYlpPcmV6?=
 =?utf-8?B?Z24yaERMbXA1NzNJNk1wTzF1NThIWklUcFZMcERzckJobGFCNEN0WVpTQUVm?=
 =?utf-8?B?Z2RXdzRIN3o2OXArSCtTQlpYRDJZdVEyajZBTHMrWHpPdTlOc2F0TWkyUDhS?=
 =?utf-8?B?bjR2WVBTMlpDVXpUZFI2dXJaczZER3dCUXkzd01KVHZ2aHYzbWNFeVNXd29N?=
 =?utf-8?B?NSt2OHd4WHhyTkF4WnJLajlmeHg2Z3FxZDJsWTJZZlp6MGxpQWJ2WlJqY2Jz?=
 =?utf-8?B?QkV0aTg2emZxYUdseXRFY3pDVDF4VG9uVWpEaXpCYmpwNDh3R3ZaR1ZsUkFW?=
 =?utf-8?B?anBFRGZkbVc5cDNuU056cE1iMnNIeEpqNElsOUUxeGdHWXN4ZDhJbUcwUmhI?=
 =?utf-8?B?QlRQeS9lckc4VHA4dUNmU3Bvb1o3U0pXYjJZSngwaVVCYWR1YzAxMGM0Tnky?=
 =?utf-8?B?KzVEQlpCL3RDWmJLZGFOa21hN2lLekFDQ0N6SHoxWkFSdUY5Z0djbnNwVm1v?=
 =?utf-8?B?WjBFVTUrMTRKOXFyb0FIWkRkcVdlaHlDcjRET3NQRWY5ZGF1QkJkMStzS2FF?=
 =?utf-8?B?aE9mQ3FxUzRSbTBQUTh4aU5MYTdwencrcjJlTjlqVDNPZmlzSU1VUFpnM1Jl?=
 =?utf-8?B?blJtdDdhWXB6VVNHR2hJR3RYYTRTekpLaDRtQjI5RXZzM3J5bXNFR0hXOU93?=
 =?utf-8?B?MTBrTCsvK1owd1JIaGFtUFVLbktNbDJDbWo4R0xiazFBU1NNZGZnM1dZYWNl?=
 =?utf-8?B?ejRQNlhZYUdBOFZJZzZUTVM4RUNPUlQ2L2J0TXJDVjZBajBQSVE5bVJTVS80?=
 =?utf-8?B?SVl0WXk1UDF1emlTYXN5K3N2cm5rT1pScVhVMmJMNUxLTEVJaVNEeVZuaURu?=
 =?utf-8?B?N1hzTm53bnJuSGxwb0RnbWE4VmU0Q1QwWVJIdXVEdXkxQ3FwQ0RQTGVBUFUx?=
 =?utf-8?B?T2tuQjlobjBRd3B2ZW0zY0FwcTF5UnlSOVl3Vkd5MXFKbmJSRXNxc2YvYjdv?=
 =?utf-8?B?UjR1d21GYngzclE3aXZka3lBcTJiVUR3cDBrUi81dHFLeG5vVmJtTnRKaGxt?=
 =?utf-8?B?RmFvT2RnbGtRcU15Z3BiZk16TzNZQ1M2MmlZRDFmQnFyM0pmMEFFVVpFQ1l5?=
 =?utf-8?B?ekJYUU1KNGRVNkMxOU1MM1hLZ3I3UW53bHVaUjZQRExXaDljWnhQaUVSYjF0?=
 =?utf-8?B?cERrdUxFbDhOU3BGUVVtTlY5a1Fka3RoRldhMDRmNzhUbnZwWHV6UjNyWHRJ?=
 =?utf-8?B?b1hRZVpWYXNhYXFNVHFjWVJwbjUrMEtqMk9ubGN2ZlczYmt6azZXTGt0djJE?=
 =?utf-8?B?Z3dXMGYyLzVpOXFWQ1U0NHBFNk5rT2JpeUNtNXBJa05PTDdIb2ZJNlF0cGZN?=
 =?utf-8?B?NDZHRWhXMVF2dkx1RDVDZVM5WVNyRlZGWFBTRVFlWk0vNW5UY1hRQnRPekRJ?=
 =?utf-8?B?QjNIZ1I5a0xvVWNFSE1sdWVMdFc0cjd5TVZRY2JLWXo2bFZRditydTdaYXAx?=
 =?utf-8?Q?BzPl4FjIfbs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5052.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eW5GWGhMUXc3dXkzRm9iQW5NakdMZ2VxV0ZIMEQvYkFpYmpHMkxHQ2JNYmJj?=
 =?utf-8?B?T3htN3MxREFjSVA3Z1FaWEQvclVhNGxSWEtnZXFBYk9XQVdBZHdQZ0plck5F?=
 =?utf-8?B?V0NXbU1tcldPQWxBcFBidEU1SXdEWU9UOWorK3Q4RWNENTJXRGwwd3VvY0JW?=
 =?utf-8?B?dE5ZOUZ1ZHNONExvTFVDL3h4NkJnK0VnOXRXbms5MFQ4WVZMcEh3OTA4aW93?=
 =?utf-8?B?RTNKRGhYOVhnUWpCc2xCQy9YRUtTZ3pkQzM2NDBLN29MS3NUQnR4NUJMZVEx?=
 =?utf-8?B?UHI1VVBFY2NZMm0wU2k2UDI1YVhON0w2b28ra2FrVU9DWlBlS2lld3FjNGFI?=
 =?utf-8?B?bjNndFJjakZpd1pXbExQNUMxa04zMjZwSHhIQmRyNlEzSWVxZXFjN3lBa2Ju?=
 =?utf-8?B?M1B6ZU1CRnE4YnRMd2RHQUpINE95UmFJQm8rdVBRQ3VaM1kyUTc2aU1vamFh?=
 =?utf-8?B?UzdHNllPQUFQcitvb0U5Z1YzdEZ4ZnhxWlRaaE1tbDV6QllrUitjRHRqUXc1?=
 =?utf-8?B?QW5BQ2tTL3lMTmpnR3VKaUFjazZTNW1xeDMrNHpQMUFZRjBMbWxuQ09vRzdB?=
 =?utf-8?B?aERjSitjV3lNcTltWjUzT2NLTXYxeFpIVmVTSG1VU0R3c2pjTm5RTUdrUnRk?=
 =?utf-8?B?YU43ZzNVK09XbGhWWXNhSWpQdk9hOW50UUcxVzlMUDNsck9jbFlpdUJNRWVm?=
 =?utf-8?B?Tk5kR3JtaVQzOWZsMGEveHEyb1lDZWpFY2EvaEh3T3UydkVTZXlPMWc3M2du?=
 =?utf-8?B?ZjhTcjU2TVhQNnJqY3lGb2dJcWF4Z1dqTW1uSkk1VUY1M3ZNd2I0aUxNYzFw?=
 =?utf-8?B?VUc3aFF4b0RVSElNMk4wU1V5YjRVeGJHRGR0N0RFSHd4dGN4UkRORHZqcy90?=
 =?utf-8?B?a215dWFXM0U2dXBDRWhXbzkzY1lnTVJSemxNZm10NVlqQUFNMHUwY1M4OHBQ?=
 =?utf-8?B?NUZZaFUyUC91eFdKbTZxUkw2WFJqZ1RzVE1ReGZ1OFY3U0U0QzFtNm9IaWM2?=
 =?utf-8?B?bng0N1RTREFOVWFYWno1ZnVvbHpkem1TQTJvNE9pdFRXWVErSG0xY1hRVis0?=
 =?utf-8?B?RkRJVWlBeG1NNDVzajNqWXJQY2xWOExMZXoyRlRCcEZHQlFPMVFldHMxRDVF?=
 =?utf-8?B?WHZLSGhuQWZFOCtmUXhIbE5BWUhMMC8zS1VERFdKNUg0T0Y2WnZkRVV2UUNh?=
 =?utf-8?B?dGZpdHo0WFgxakplU3lQYXRtZ1lKRGI1Ym9UemxOa2NyVnZuSUlFM0xxeGRI?=
 =?utf-8?B?WVdYaFV3K25ONm13VFMwajQ1UzdrMG5GVnFaVjlNcmExZmo1QVJRTWlTV1J6?=
 =?utf-8?B?QjRZRDJHRnh1WDlRWVlUUnpBWEE0SHFEZDJ1Qk5uZDRXQnFDTnRMNGlKWVlp?=
 =?utf-8?B?NWZOY1RROGlWclFUT2xFaEE3Q2JRRC82UU80SHBUTGtWVkhiMEVPak41TXhk?=
 =?utf-8?B?eXp1ckRkdzZHaHg2YUp3OHZzUjRyUEh4cWNFRjFXNG82djhidWVMM3F0aEFK?=
 =?utf-8?B?MVhVL0QvU0JGUFRPQ3ZwSThML3NVTG9iOHlNZ3hWa1ducDZSQW8wbFpCMEs2?=
 =?utf-8?B?dkd1SnhYdG9GTVFHVENxYzRXUDhtQm5lT2NRK1l3eHE4WExtZlpoa2pzam93?=
 =?utf-8?B?S0VGT1I3eEMzb2Y5Vlg5TXM0NXFZOGdhVW1OWHR0bFZuR0w1ci84QVZvclJS?=
 =?utf-8?B?OHpZVDhhcVhyQUJKaTA5Y3FXcFhJR3RJWHhMQUdvSy96bmx0R3dyTEhRNHhs?=
 =?utf-8?B?Wi9XUTVDalUwNE5PTFczRWRvVS9TVkFUSll0RE9LL1dwdG5sditmQ0pyOTN0?=
 =?utf-8?B?QmRNUkwvVFNVdjU1cHpNKzR5NzlqK0VxRHNIY01SR3FNcTZwaklsMXNJQ3p0?=
 =?utf-8?B?WFlEWjBTcTBaeGI3S09rN1hrTE5aZkxWaFNsTU5Ja3NRMXVnbG0yOEpIcTho?=
 =?utf-8?B?MkJ4cUUvTFNJMEMrQjJHSkxhajFOaThtYWU3SWZxVldxczB2NmRKeU5ML0hs?=
 =?utf-8?B?Z3pDSzFJVmdqd2QwSE52S1FvbkMyNHA0K1R4dFBvRTA5VTJtZUoxWWx1SFQ3?=
 =?utf-8?B?QU9lZ0lmQW1jQWYzcjZDYkJ4VE9mem9wOUZjN3NFYUZseFkwMnNGZGRWZ3I4?=
 =?utf-8?Q?Tl0eTEGO5zR9vWewPMBUtZ5ry?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f23f74e7-ecd2-492e-f202-08dd7b0e44b3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5052.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 04:38:57.5958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xb2ZP7FfDL07RIZ1xBip+1gxEiDG4cl9SHpu6410eZnuB1XvzkZRME/wzp1YeKhS5p2NRXqaAToEMNXs4Pzd8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6684
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

Reviewed-by:Arvind Yadav <arvind.yadav@amd.com>

On 4/12/2025 8:09 PM, Dan Carpenter wrote:
> 1) Checkpatch complains if we print an error message for kzalloc()
>     failure.  The kzalloc() failure already has it's own error messages
>     built in.  Also this allocation is small enough that it is guaranteed
>     to succeed.
> 2) Return directly instead of doing a goto free_fence_drv.  The
>     "fence_drv" is already NULL so no cleanup is necessary.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: New patch
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c | 7 ++-----
>   1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> index b012fece91e8..86eab5461162 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq_fence.c
> @@ -75,11 +75,8 @@ int amdgpu_userq_fence_driver_alloc(struct amdgpu_device *adev,
>   	int r;
>   
>   	fence_drv = kzalloc(sizeof(*fence_drv), GFP_KERNEL);
> -	if (!fence_drv) {
> -		DRM_ERROR("Failed to allocate memory for fence driver\n");
> -		r = -ENOMEM;
> -		goto free_fence_drv;
> -	}
> +	if (!fence_drv)
> +		return -ENOMEM;
>   
>   	/* Acquire seq64 memory */
>   	r = amdgpu_seq64_alloc(adev, &fence_drv->va, &fence_drv->gpu_addr,
