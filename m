Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1A8CA5DA
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 03:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37E5210E4AC;
	Tue, 21 May 2024 01:35:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bIqCixtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6F9D10E349;
 Tue, 21 May 2024 01:35:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LnefnSw/K+tq853OR5BWjXQ1RRS0vWrRWN1yg5RVdQXz/dlz46M3CZlJbA8O326EhvPxcvbbatHFH/1GGsw88LMjYDKZx0aw/LVTr/s3/Yp65/82hp2VJ4Wq0ylivRvYRACLaj6VD5orPA2UiatwOhF/3O19C7YC6OL9/EJj90EjHTMOmrYBtEYVzOYuN0+gq3itaA4L8gxcs0wDKvQZzFMX7KIKN1aX3UIHZons+NQBMjaBzJ/vtT70KAdX8AnIu5fg8Q0PfFHnOsZAZJ09ZXET4YpPDORh19gwi4/cQ9mc8K9j7Mvgf4y6B/VxJtQeQ+eBTQOay/QiyJ8wk2fVDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TMIe1tkasjQPYAJ8pFqVS+FNpmlqlj2k+Hj1dhqykIU=;
 b=Ey6VewMwbhCE4PJgYCB7fgk89qI+aXF5gypTpozqDLofWOXVqPRWH/Jzly/kn45Da19M5MNa4ct+4/qZJORGahDr2s17kOElyebBlunXooazdiymB4FsRk8WSlWh155oL1E4NMnaDSh3+7+YObinUDQeR4OAaM0hJ0d5dak3UoDjbdpXOimHhjKCjQmarzG11Ea79o0a8OgOCm6mLSDPi81yKGZ3BDJg87AI4EsOr9XPWYrANTn61PFO7R3Jo6mhn6fhc1tBuA0upmdfRcMx2mhQ7AsB1btFGeNdqzdjGqf8x2PFHLyd6XS0gNwN44tKZLpt1rn9DY2fK1MXbOkTuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TMIe1tkasjQPYAJ8pFqVS+FNpmlqlj2k+Hj1dhqykIU=;
 b=bIqCixtdAdZFhmevGDf3OvyssLeflM50o38szhrJNE9b4StHOEk5+k1ZiPJuFxZ/jhPBnxVL8z2mLyOoKS7bPBXXTNx+Hble8rUmBLCtby5uf7qUXJkIa9nm2MmukWp1sM9kyGK7fu7EElMwwzXFARgYrJa9ObAfcyCdp+2bLp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by DS7PR12MB6069.namprd12.prod.outlook.com (2603:10b6:8:9f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 01:35:10 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 01:35:10 +0000
Message-ID: <fa885eca-d7e6-415a-8a08-9103b002c6bb@amd.com>
Date: Mon, 20 May 2024 20:35:06 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: Add pixel encoding info to debugfs
To: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>, alexander.deucher@amd.com
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Aurabindo Pillai
 <aurabindo.pillai@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Wayne Lin <wayne.lin@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Fangzhi Zuo <jerry.zuo@amd.com>, Tom Chung <chiahsuan.chung@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20240520210817.9943-1-rinoandrejohnsen@gmail.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20240520210817.9943-1-rinoandrejohnsen@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::24) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|DS7PR12MB6069:EE_
X-MS-Office365-Filtering-Correlation-Id: 414dadd2-9f49-4fb4-d133-08dc793640a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K3paQkNXOGJtdTgrZkJVaGZXazRmeWZGNTJOWkdDKzk2cWJXNnhmU3dEanNw?=
 =?utf-8?B?bnY5M2VDREE4Vk0yZUpUdk1nS1JZUzJ6ZCtVbm5EWkVvYVNxMEJXQUF2cXVY?=
 =?utf-8?B?MWlmcXV3aXBLenp4OCtNajQ5QTE3V3JlYzJEY240dGllYXp3aS8vOGw3S3Vk?=
 =?utf-8?B?Nk9SMVZxcVpQc0F6U2NuaGlHWkNQcTFQWlc1eVBJRlNhWSswTWxhOW1MY3Zo?=
 =?utf-8?B?K29XRUhwWVM4KzRaOHIxUGZUby9acXJlVHVZd2hsQWdtV2NxeCtSOUJ0cDlS?=
 =?utf-8?B?ZjFNSlduamVkVVI1SjFmSDkySVN6dGRDTXdvWndwT29oRHBuWWMvMDlMLzQv?=
 =?utf-8?B?bzNVZkowWncrZkVlaTNEUVY3OWlFWFU3VmZWYnRsQTVoWnZ5eVYxTlpiWm1m?=
 =?utf-8?B?TFBLU1BTbXJkdUE3RnpPbC9lK1laUlpKZVpJdmtSNjg3bXp4TWloMks4d2x0?=
 =?utf-8?B?QkhBdk1HNVE3dGpMSWM2cEkrdS81SWNBbkxOZ1REcU5uM0JVa3VwYjgzTVJK?=
 =?utf-8?B?R2xOazIrNlI5cXY5amgrMGlFZk1HMlpSc3M0andadnF4NS9nQW5WV05hekdu?=
 =?utf-8?B?b1JmS01MakNZY0hHeURwYXRhQ0c4d3piS2dabnNpNUszVTFMV1hQcFpSN1Vx?=
 =?utf-8?B?TFBZSTBpRUpSYk5JaGpOZUllUU5mQzVpTnNpc2lHTG5hZWdUdllSbGhsekU5?=
 =?utf-8?B?cEZsZHVJOTJvbmFLK2s5YTg4UTc3dlhTTC93WnZzdWxSU2s3czZoU1FZcVMv?=
 =?utf-8?B?V0RLd1lHaVFxZ2g3Q2ZqcEs2QVl2VlNHaVlBdEZZM2xGeUVtY3BQTGc4cUs5?=
 =?utf-8?B?OEg2MzJDWjRhTzdJS0ZZNE1aV3JCYjBIY3RENFZDSUxxT1czM0o4dnpuZjFZ?=
 =?utf-8?B?K3d5bkdTZE9TU2JDOE9jZ1NJQTY4MnZFV2t1L1YyRXdPd0xCWUlGYTRVZlJV?=
 =?utf-8?B?Y0xackxsVEg2Z1c1bm9EL2JjUUlFa1JUUEIzUStDbGthY0hQc1A5TGtoU296?=
 =?utf-8?B?TjRFZkJiYUt3S01hWGhMQ2xvSEUvMFBvR2NFbkpwZnBsZkQyTnRlb01mRGJt?=
 =?utf-8?B?dHRTRXNZeDBwN2l2ZHpkVlpEbEZ4SGJkQlF2WWwzZzZNZVZQMHROM0E5UnBo?=
 =?utf-8?B?M0pDMHB0TFhaeFphTmMxL0c3ZUFPWmcxVzVHb1VVcVZNak5sVnhRaFRpRWcw?=
 =?utf-8?B?L25ScC92cnE0OTNQalArUmVreE0zRHdkZWtaMkNNcW1NaHlwUWxWcnh6NTM3?=
 =?utf-8?B?QUNUdENXQjVEeGdhdElENU1yb1dta3crbldTR29HODlLbis2UTlPcWVHVDZN?=
 =?utf-8?B?aXU0ZXpFMXNkd0o0dGljakVOS1pSdk83VE5ObS9qR3Z4RnBpUUlHQXlNbk5y?=
 =?utf-8?B?YWpRWU5CWXBsZVJ4Y0ZFblIrTkpBb0pONnQvZUh6MVFXS3Q2dDUydElzNjBP?=
 =?utf-8?B?ZWdpbmRXcDlwSWRiNFErZ1VZTzF0TVdKZzJmTG5FTHNrRHpOKytZb2pBNm9C?=
 =?utf-8?B?MDJ3Q1oyNitSaStGWmxsNU1PVy9VS2ZybVZ3dVBkaXlJYW5DNCtIUkx6TmNn?=
 =?utf-8?B?OUxxbWk1MTJtSWxuUHF4TU0wc0Jidk1qNElweDg2S2xEU29SVE9KalR6WWMy?=
 =?utf-8?B?bFlpS09GNEkyRllDR25pRHByUDhCWEYyN0hISEI1SHhaYUdKbDYvbXRmeDkx?=
 =?utf-8?B?VVFVMCsrTWVjbW1wUVVWOXRRM1ozcEl4WUNybkZhOUcxSko2MFlvVmlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzZXcWJOSmNYd3FsTEdrRWRQTXJMcGtTdmpXYVU2N2JpdmNmT2JqQ3ZSQUVh?=
 =?utf-8?B?eWxlM29RU3R1YU1tQUwxdVYrK0VtQlZuaUdlNGpmL0VCbWtQZHdhRzJCT3FD?=
 =?utf-8?B?dWp3WlFFZUVqNXdXUlJISHB0ejI5TWN2bjVvWk00elZpN0xuVm44TEkwTXpQ?=
 =?utf-8?B?ZWZpRVkyZ2lzN2JFU3c5enlKT04wL3FLNjdFY3lhcThjVDRSTzhOV0dvc3lF?=
 =?utf-8?B?UXd2dHBEc25QQnI0NjBBelA1Uk9BSDFOUExUR0dJV2JqTjNTdTFBcnFiT1Jn?=
 =?utf-8?B?ZDhyUjJQWk8yNTBOWDB0OVVxcHRyeTE0L096L1ZKNXY3RzRhZU1hM0RYK2xB?=
 =?utf-8?B?V016WVlKN1loTkJyRjJ1NVBLTERobTFZV0dmWjUxSWFvRVBWZE5ZOXlNSXdG?=
 =?utf-8?B?WXptajcrbEtCU0I3Rlp4aXp6aC9SdC8vVEE4SWtvN0U4ckwyemVnQWliK3JQ?=
 =?utf-8?B?b04xRGZ0TklKd3ZsMDRDZ0lSWDllY1p1c0RMcUd0SlNjLzQxVVlQenVsczcr?=
 =?utf-8?B?QWt2VzVucEVOTW5uemNEN3BucWs3VjQ2UVdoSW83NUJwL1E2WDZ1L203SUI2?=
 =?utf-8?B?MnZkZ280eWY0YkNPazduQzR3Ly92dHo2S3hnTC82cXdiMFFaalNDeFh0WElq?=
 =?utf-8?B?QXFrT3dyRGc1MXlZSnl2Ymh5Sk9LQ1BaRWFOTUNJRE0zbDdRaXBqc3BXbC9Z?=
 =?utf-8?B?dTBoWTdpRENQRkJBOUhjb1NWcGM2RW9Eb1F3OTRmaHVrQWJ1SDRrSDN5SHAx?=
 =?utf-8?B?c2FkcENTUUF0OUswVG5pSnpiL3R0bWQ1QmN2Zlhua1hzWC9ONFlHOHJNUm5J?=
 =?utf-8?B?K1VFZXJsaXFleGVieERJSlVlRDNMR0NJSG8zeU5wZWZSRUoxWEJwSk5LbWVQ?=
 =?utf-8?B?dTdDU2tjVUx1YzNJWkp2dVk5Mm9wSHEvb1UyYk12YmZUOHZjcytMNElIS1Vv?=
 =?utf-8?B?a0MxSlRoMWY2Tm1yTFlma3lXeFBmcitia08zUkZwcEhJLzQ1eTRSalZOTkRR?=
 =?utf-8?B?ZzJxcTVpNHNJV0EyVWZzQVFJVXNFbVV0b3VMTUhaRnFiK2VRc2hLVE5UcW40?=
 =?utf-8?B?SHBsdXd4a1JtYTkzTkx0d2FWc1NqenRwRGxJRzlwWUZpalhXSVpaa0ovODRi?=
 =?utf-8?B?V0d2b20vY3pXV0RuRGJHSEVKbmx0NTBUNmNoRTVqekNjNDM3cVAwYmRDYVBB?=
 =?utf-8?B?SHBZTVYzVjZyTFN4NUt5TC9qNTNsYzNvVTNNUjR2WnowQmpEcjJ1bm1PWHpJ?=
 =?utf-8?B?c0w2d3JxcnEzYStuN1kzSE82Q3g4Ym1GLzVaQ2NIUXpNdmlEN1lKQ0lIMWN6?=
 =?utf-8?B?T3FCNllkTUdjc2crSUJxcGkwUU52ZHZ1MzBOVk1pZ3N1MGlTOWhUVkg2blMz?=
 =?utf-8?B?NkhFcVEzeWRNb0puYmhBRmlyUFAvL01abnlXK1Nzbnpmb1RJRU1WUzNQSGti?=
 =?utf-8?B?akhLN0ljMjNSVU95NFo1U3Z2MEZMWUJ2bEQzZzhJYTF4Z1N3QTJNUzVMc2Nz?=
 =?utf-8?B?Z0FlQmtoZzRZM1lDUldoL202eDVEWDhGL3IvclZRWFVmRTBuRUZJR0wxSXBF?=
 =?utf-8?B?T0J5VXUrZzBxWk9Md1pPRHlUUm9zaHdlUjNMLzQ4NnJWZEpkaWNQU3V4aWNx?=
 =?utf-8?B?cEhKMG9lVHE2cEc4SXFYNzREVWJVVzk2c09zRUNRSVNZN0FSNWFvZUdvMFIr?=
 =?utf-8?B?QkNPV0NPQVhqVmxzVndBcUQvNDVuRkhaOVF6ZXNYbzBoenF1KzlDalR4UHhD?=
 =?utf-8?B?ZmttMjFMRDh4UzVSK1U2U3dyc0dWcHJJQUtsUDgveU53WTFJeW1lUmp1dDdR?=
 =?utf-8?B?bkxyeG1nZHI0Z2dLR1NvcWtHY1dWVnVURVlLYWgvTjVveHQ3d083RUJEUk1S?=
 =?utf-8?B?R0F2Rk5CcnIwaE9INGIvQWFXaERRd3VQNVpGQXZ2YUtsRFJPMXkzSHhoYlFS?=
 =?utf-8?B?L1ZsUkNnT2pva1o0OEN2SE94NFdPQjZnSERHZm5PSlhEaDlxZ1k0c29ZSE96?=
 =?utf-8?B?L0MzWWNabDBzdE9OTWl2ZWJINHM5dmNwLzhkRlJyZXYrVmxvZnhGMTM0V25r?=
 =?utf-8?B?M1J1dHJoMEJXNXNwM2tzbngvOCt0c3BuUUxOMGRuaU5uYWlCOGhHeE92U2lB?=
 =?utf-8?Q?KxV+yDNU2SQE6KjoyK5toy9ZS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 414dadd2-9f49-4fb4-d133-08dc793640a5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 01:35:10.1101 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0kJy8j+7pAWbBpp9Ftk4QOjHy1U4qjkLShaYu5goIQGESGdYIDEV8wCoX9v3QY+9VATxll1VrM9mF6IQJTIwSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6069
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

On 5/20/2024 16:07, Rino Andre Johnsen wrote:
> [Why]
> For debugging and testing purposes.
> 
> [How]
> Create amdgpu_current_pixelencoding debugfs entry.
> Usage: cat /sys/kernel/debug/dri/1/crtc-0/amdgpu_current_pixelencoding
> 
> Signed-off-by: Rino Andre Johnsen <rinoandrejohnsen@gmail.com>
> ---
>   .../amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 47 +++++++++++++++++++
>   1 file changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> index 27d5c6077630..d275e5522335 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
> @@ -1160,6 +1160,51 @@ static int amdgpu_current_colorspace_show(struct seq_file *m, void *data)
>   }
>   DEFINE_SHOW_ATTRIBUTE(amdgpu_current_colorspace);
>   
> +/*
> + * Returns the current pixelencoding for the crtc.
> + * Example usage: cat /sys/kernel/debug/dri/0/crtc-0/amdgpu_current_pixelencoding
> + */
> +static int amdgpu_current_pixelencoding_show(struct seq_file *m, void *data)
> +{
> +	struct drm_crtc *crtc = m->private;
> +	struct drm_device *dev = crtc->dev;
> +	struct dm_crtc_state *dm_crtc_state = NULL;

There is no need to initialize dm_crtc_state to NULL.  You set it before 
its first use.

> +	int res = -ENODEV;
> +
> +	mutex_lock(&dev->mode_config.mutex);
> +	drm_modeset_lock(&crtc->mutex, NULL);
> +	if (crtc->state == NULL)
> +		goto unlock;
> +
> +	dm_crtc_state = to_dm_crtc_state(crtc->state);
> +	if (dm_crtc_state->stream == NULL)
> +		goto unlock;
> +
> +	switch (dm_crtc_state->stream->timing.pixel_encoding) {
> +	case PIXEL_ENCODING_RGB:
> +		seq_puts(m, "RGB");
> +		break;
> +	case PIXEL_ENCODING_YCBCR422:
> +		seq_puts(m, "YCBCR422");
> +		break;
> +	case PIXEL_ENCODING_YCBCR444:
> +		seq_puts(m, "YCBCR444");
> +		break;
> +	case PIXEL_ENCODING_YCBCR420:
> +		seq_puts(m, "YCBCR420");
> +		break;
> +	default:
> +		goto unlock;
> +	}
> +	res = 0;
> +
> +unlock:
> +	drm_modeset_unlock(&crtc->mutex);
> +	mutex_unlock(&dev->mode_config.mutex);
> +
> +	return res;
> +}
> +DEFINE_SHOW_ATTRIBUTE(amdgpu_current_pixelencoding);
>   
>   /*
>    * Example usage:
> @@ -3688,6 +3733,8 @@ void crtc_debugfs_init(struct drm_crtc *crtc)
>   			    crtc, &amdgpu_current_bpc_fops);
>   	debugfs_create_file("amdgpu_current_colorspace", 0644, crtc->debugfs_entry,
>   			    crtc, &amdgpu_current_colorspace_fops);
> +	debugfs_create_file("amdgpu_current_pixelencoding", 0644, crtc->debugfs_entry,
> +			    crtc, &amdgpu_current_pixelencoding_fops);
>   }
>   
>   /*

