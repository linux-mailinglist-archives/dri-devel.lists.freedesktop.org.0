Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22525A2B4F5
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 23:22:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBDB10E0D4;
	Thu,  6 Feb 2025 22:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FYsIxmKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5998310E0D4;
 Thu,  6 Feb 2025 22:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sBTtaT7tQOZhNgRYUypQKWS/QjxWsQfnxIiFrL8oZDffUs+X2T7/VQxBqOSJvjhBv/41zWtArvSrus4mnR5cW2IjBlzcEOh1uvgIQjmR5moKNLwc8/hUGKbPkFalE5/r7IuPKF8RZXAzCWdwfx0jkJDddg7QzIyJdpNyiZKq5WLDwEXJ4pZy+dlDCAcNa4GHYevKS8z7EA8l8mvT6wGt0167NJydYcAH5ysaoLX0hOR5gZJxfiavRcGwiZa2eQgo8+D1LDtbI4WKQxm1LFHyhwu38WV3JbdNtkBpxwHa59s1qwRKjE0devG5SMP+n19nR1GdeHVAnBQYJyU6CFqrUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJD2s/n9pUj79Q4drTPLLCgvHbK45eCq3Jn1SA2O+/c=;
 b=lXuCOroGQ/+V93F+OwhEn+ol2r9gt89dtuRAo6E9fddqi01eR1YiEh6a9tyXGbUDRLiesQ+0j6xx6RYZH8iMEejZd8Ibox02/o9eW/gxb6+e0s8Y0qcJZhmdh/2BAcXbpLw0g5T4YRZb7aPCU/xU0wVCofxkZUWoOLSmIHRmqv47EGGxvkjuXjDW2yrBdgVjigf+udvaGyMwPz6lQDu5lpGz0+1YA70ynINWphZBLapvAW1R13idGchpI9BaIkKD3rZfsaUsLf1kR2e6x/Ei8/JzkW/dnrOdH/qrWQDfdKSarKN0GKSGBLI+8bHLWJXB9EYjA4PFd0Rl4wZqbDSBsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJD2s/n9pUj79Q4drTPLLCgvHbK45eCq3Jn1SA2O+/c=;
 b=FYsIxmKn5tCzunslMGjm7ir2fZUAN69I2pNmrykUR9hLMZuAScJBBQP6EU0eOCVG7NRCvmUjchRZS7dGFtMggwE8g0tgdaYHHOI+v32b1S37sIE9Oay8HgZqzYJkLOPl1/HKtOEvFwiveqrFQcRHgRPyLrnOEeFwNHGt3vaa5T4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CH3PR12MB9252.namprd12.prod.outlook.com (2603:10b6:610:1ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.14; Thu, 6 Feb
 2025 22:22:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8422.009; Thu, 6 Feb 2025
 22:22:33 +0000
Message-ID: <3e6f5e44-403b-41bb-b819-c4479948731c@amd.com>
Date: Thu, 6 Feb 2025 17:22:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 2/2] drm/amdgpu: Enable async flip on overlay planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org,
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>,
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <20250127-tonyk-async_flip-v12-0-0f7f8a8610d3@igalia.com>
 <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250127-tonyk-async_flip-v12-2-0f7f8a8610d3@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0256.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::23) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CH3PR12MB9252:EE_
X-MS-Office365-Filtering-Correlation-Id: ea893ce8-db52-4c49-2a52-08dd46fcc0bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y25NL2lyNHNNVll0d2V1ekJJU016MmloRHlxVlJCVjcvOHJKV0dXU3pwUXlh?=
 =?utf-8?B?U0phRFRTSlNyZTNKT2UvRlY5VHNXcHBTay9sUjlGbmFkVDM0MThWdmtOVDZq?=
 =?utf-8?B?TE5zekFwaVVONDNSeHg0T25pdFYvMnZHL0Y1T2l4bjNISnZnaUtsRURhOVZ2?=
 =?utf-8?B?eWJpeG1FZ2N1dVdxbjRPZWFTekZ2bHVuMUFVTGVwMDh3V3FWOXpsL2VIZFRK?=
 =?utf-8?B?VlZkbFBiVnpMNzZWc1czcWFoS1NBN1dtN0x0WFg2MmJXbW8zUVhJZTRyMFZL?=
 =?utf-8?B?bmxTaittZ094YkdGb3UzZENUUSttNU0rT05LZytpU1YwMmk4SFNpcS9GRGxl?=
 =?utf-8?B?SnMvZUdhaDNRUmNrYm9GMWZzLzFpT05iaFRlNUVMa1FSQ285ZGljWW9hT0J5?=
 =?utf-8?B?M2I4S1BtdmZwcWRSSlYwZ2IrSHpDNVBibXpTSVNLZUlrcXlIcXBIODhESGIv?=
 =?utf-8?B?RXBEMWo1cjh5SWo2aUMzbFZVc1NuUmU0cUZheTJVQmFtRGoxK0pIQktjbzho?=
 =?utf-8?B?NDZVVkF5cVUycFJqai9MaUoyRXAyL0pHQ0g0alJGS0lIaWlzUHdpVGJJSzZi?=
 =?utf-8?B?UG5JTU1RZFF5SnJGY2lDRXduMlZyRWNIRzh0UG1hb0xOeFVMKzk1dUI1Y08v?=
 =?utf-8?B?UDJEL1N1Y0JJd3lZd0NIdzMxYnphb1d5QXh6cmpLWmNoZVV3aXFXelRFaGxZ?=
 =?utf-8?B?Q0RHU283VjZ5Vi9SSVEyNnNmZDR1bzdPdWtmLytSdHlpT1phdGkzdHpxR0po?=
 =?utf-8?B?azJoQmg5ZEorYXFFSndRRkhXTDFZM0YxMmZkTU42MUhVQjl1S29OZVVqRHNw?=
 =?utf-8?B?bGhaYWNhSWpmUDNiWHFaRGFuSU9ydCtmbG1nWWRsSG1UY2RNSCs0S3lPT0Rm?=
 =?utf-8?B?WnBzSWp5OWxvVHdDbmxFbzBQYWQ2SjV4djg2b3VPLzdSOHIrSmYxcjY5YVEv?=
 =?utf-8?B?dGRwNlc3M0wyMDdZSndRZERhUEJ1aTlpc051UExiUVp1dGszRVREdXA5cGZ6?=
 =?utf-8?B?VDljQ2o3UWpOL01SdXJCSkQ2cFFBQXhNN2JkajFYdWJLSHZ4YVYxcmczTC9J?=
 =?utf-8?B?Z1Q0emF1SXIydUdVSjB0SkJZMTZXbHlvMEFiOVFyYTVUMFVyekQ4Z1FqL2Jv?=
 =?utf-8?B?SDQ5VldzRlJ2S2FtZnJ0UHhCSi9ESXcvK1RxUVIzU0lwejRoUXdYWDdiUGlR?=
 =?utf-8?B?Q2VvZ3JxZW82cmtlK0ZpY3hoS0JWN3FkSDBPMTdwZVBtbVBBcUgwek45OE8z?=
 =?utf-8?B?aFdYSktGaGpWODJSYXF1SWZQTlBGdlU3L2hEaEZ3WGFzMWhuZ1EvaHFxbklH?=
 =?utf-8?B?SVBnMlJEcUtlbXNOWXBGcjRFN2R2UDZPY292MVNhREo4akRIZk9Rd2g2Unlo?=
 =?utf-8?B?bTZKUkhIOUo1a1BWM09LUkhVNUtGWURMcDRxcWdxelozemZaL3ZDbUNRKy9w?=
 =?utf-8?B?S1BhZ0dwT2ZYQVRUcnl6aUJIbHJrZU5nT1RHY3RiSXUvNWw2L1lrRG9YanF5?=
 =?utf-8?B?ellXVCtxTGdYWDJmWFc1K0VacEcxR1o0ZUJBaVNsVEdTdk5SdHlxTHRFUFN6?=
 =?utf-8?B?Ujk4Mkl5K21VSWFweEZtN21OSU1EUWxJc1pXWVN5cVZaQUZKOThIc2o4aCtp?=
 =?utf-8?B?SmhXaTlCVElFUmxoejRSdXVlNmhlZlAvTGVDM3FCTjlRZ1dFTXRCeWovbFh0?=
 =?utf-8?B?eGhKcTFHbG9zRlVqdWFCK2hRY3VHanlpK0FkSi9kWk9wVzJqRFJURTVSeHZx?=
 =?utf-8?B?S3U3TXRSRUNwa0ptbkkrUlEzMWRHL0FoVGNRQk12Si9SSHRqWWZTYnBaVWpL?=
 =?utf-8?B?MEE4YTJCNGNnUjhyQWdSdXJ6ZlVJZjhSb3RyTXk0OFQ4ZGx2bjNGTjBTRGFW?=
 =?utf-8?B?eG56WWF0am1EL1p3cVk1Qi85Y08zS0FIZk44Q3ZNZ3BHV0tPN1dBelNEMEJF?=
 =?utf-8?Q?efkORyc1EGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjBFa2NwdXJqb0NIa05aTi84MngwN0xlZ3lwTFpQNVhqeUlFOGJoVDU3UlZm?=
 =?utf-8?B?QXBWQm9peDhDY2t1NUlRU3EzeE16WXhjV3hIV1YrOHQrMm5NbU1yaXJZQWNQ?=
 =?utf-8?B?ejNERk12QmtFVys2MnRTN0w0emNFTnVGU0ppdC84ak5oaG1PRkhBZkpPNFZF?=
 =?utf-8?B?MlFndUd4MkYwZFdNTmdkeTllWFpNbzFjRkhSUCtIbVQxRzlmdndibVlhQm1u?=
 =?utf-8?B?VjVoekZZbHJrS2JGaWdHS1Y4VG16MFA5Q2J5TEZ5dEZIbm45M2ptSUdhWndv?=
 =?utf-8?B?ZXY3WUZ2aThWa25aN2FrS2RMbllvS1Z6RE0zeU9JRDVzU1dDL2NHZVoxU2hr?=
 =?utf-8?B?R25YMTBiNkRFS2xpZHlmcFpTMW5jZkIweFhVT2pkY0VXVDdFUU0xc3k2ZGVE?=
 =?utf-8?B?UGVFaGt0aHZtVHFST2cxWkhPRWpPcUo3dVpYc0lwZmJJbGMyS2FFSmJvcmNL?=
 =?utf-8?B?ZGYvMWI2bUg2VWVHZ3l3UEZBa05PaFpKaEtCaGNaek9uYzc0QTdiN3ppbWFG?=
 =?utf-8?B?SDZzN2c4aWVEbkRpcTNncG5tN2xXV0VSQ25JNEo0dXZMR3RsZjZkM0M3V3RV?=
 =?utf-8?B?L0ZkaENLSkVmN1ZBa0Y2cUNLamN4SEo1S0JwZHcyNVF2MDdwZjJ3Ulk0QW8y?=
 =?utf-8?B?K09ZNnRlK1cvZ21VZWpBNjdSUnR2THVvOXdYWGVuKys0Rnpwb3hVaENtdEZa?=
 =?utf-8?B?WXFTbkVjalBGMmQvY3hCbTU4dEY2MWxVUENEZjREaitZNXFxY2hxbzBDNlM3?=
 =?utf-8?B?K0Y4Yld4Y051aU5hblVSZTY1Mjk1dVdoOWhNR1I1a0VLTzdTWHl6dm9DVTMz?=
 =?utf-8?B?Wko0RUVhMTdGa3Fvd2pRWFY5MVBsN0ZvWTVKenRJNjc3cWtwRFFFVDJJTWRT?=
 =?utf-8?B?ZTZmYksvNWNqNStmZVV1VDJpK1BMVXNQMGlHL1A4MUFZa3pGcTNPVGo5Tkov?=
 =?utf-8?B?RlJzaWV6ai91bzJrZTBPcmQ5TUdpMEtqeVlOZStWSTFBc1J1U2ZERXlpaHNy?=
 =?utf-8?B?UG1sQXArR0hGZkZJMlBmOVhZQ09ZZFBiSHRTTW82QVI5TG5FNld0bXJtM1hB?=
 =?utf-8?B?V0N2ZnFkeWZuZWI3eUhzdTVFTW5pS3ZPaUt5Zyt5QWFCVzZqSjJ4TFEvUC9z?=
 =?utf-8?B?UFB0emFnT1AvNzVIaGc3VitxcDFXd3VHWlZxOHlOaC9xbzNOWC9hR2RGYUdT?=
 =?utf-8?B?SnFHUi9HdFdqam5XYjhQOCtrMmxKaWxUbEFzczdFWGVJYWxmTGpneTZFZjQ4?=
 =?utf-8?B?dU4xbEVpL1BSS04yMXh0UnZjZnBHMVQ4UUZaZmIzWGFKclJJNWlXS05zNnNk?=
 =?utf-8?B?dFBBWlRhRTZDNWp3YkNNUXpBMURmNjUwd3RtSk4vNkcvNUkzNithaHRrWTRw?=
 =?utf-8?B?NDgrQm1IVmM5aXprcHFBT0pOOE8xbThjSHJvR3hTQVpCcjBFaEVUczJmbVdF?=
 =?utf-8?B?cCthMmtaWDlFVmo0Zk80bGhWNjZCT0NrR3ZZbG1GeXRNTDVkKzlkbEFPWko5?=
 =?utf-8?B?T29QdkdMQ2R6aXJCc1VieTIrRnJHeVYxeUZ6dWcyditGV3g5TnNUZHNQci9h?=
 =?utf-8?B?ZGk5VG1YVXFWN0NiSTRBQ1VMT21JRlhpOFhmalFJd3VRWkxkSHk1bHd2VzRi?=
 =?utf-8?B?bWg0dHo3d25HUStQcndHZ1pLMFZZRCtUYWRWRFBuRTV5Nmw2S1NyVWt3eUpN?=
 =?utf-8?B?bjNmQkNSUDZJYVVoL2VuN25BUmlqbFJ3OWdwbDFMbXVzc0xuTkRpVTVWelJY?=
 =?utf-8?B?bTA5ZnNqYTdONjhLaTIyNTNwR3RqUXRPdmJITE1ycFVBazUyYkdXdjVEVzVZ?=
 =?utf-8?B?NElMT1NRcVJTY0YzMlREL3BYRHZ0UXVvZVM5U0ttc2dwVGpCT3pGeWJJWFhj?=
 =?utf-8?B?eXp6K0pOTEtlQmpDcXBzOXRvRStCcUdiZnl6WEFveFFnbU8xOXZhQUczM1Nz?=
 =?utf-8?B?REpjNFllajM1L1EzS01ENUJDWkhRcnhGUVY4Z2pjNkRFeTRoclozRWNRek80?=
 =?utf-8?B?eUw4RXVOY3JEMmJCNDJsU3pLWkMwVkRqb3NzMk9XUmE2M3hCdTA4T3R1WlBt?=
 =?utf-8?B?a1h3KzhoQUdrM21IaUZOMHMxcFBjb3k3cDJXR2VaeVA2SjN3cGxFd0ptVVlu?=
 =?utf-8?Q?ffaZB6P4VRjylkdhzE9U+3nvG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea893ce8-db52-4c49-2a52-08dd46fcc0bc
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 22:22:33.8075 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l4vDM8n7ziNjddwKQFa01XiATIYohyhHNUXGvG6WEEKrBT1+B6blXCDwxNf43uaX6SEEX/4Y19k0fZ414fJKjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9252
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



On 2025-01-27 14:59, André Almeida wrote:
> amdgpu can handle async flips on overlay planes, so allow it for atomic
> async checks.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 774cc3f4f3fd9a964fe48c66eb596d2f6dfee602..6bfed3d1530e6610eea025b477f409ee505870da 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1258,21 +1258,23 @@ static int amdgpu_dm_plane_atomic_check(struct drm_plane *plane,
>  }
>  
>  static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
> -					      struct drm_atomic_state *state)
> +					      struct drm_atomic_state *state, bool flip)
>  {
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_plane_state *new_plane_state;
>  	struct dm_crtc_state *dm_new_crtc_state;
>  
> -	/* Only support async updates on cursor planes. */
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
> +	if (flip) {
> +		if (plane->type != DRM_PLANE_TYPE_OVERLAY)
> +			return -EINVAL;
> +	} else if (plane->type != DRM_PLANE_TYPE_CURSOR)
>  		return -EINVAL;
>  
>  	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
>  	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_plane_state->crtc);
>  	dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
>  	/* Reject overlay cursors for now*/
> -	if (dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
> +	if (!flip && dm_new_crtc_state->cursor_mode == DM_CURSOR_OVERLAY_MODE)
>  		return -EINVAL;
>  
>  	return 0;
> 

