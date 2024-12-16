Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1128C9F33B5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 15:54:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51A4610E6B8;
	Mon, 16 Dec 2024 14:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="17K1IZE5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2042.outbound.protection.outlook.com [40.107.100.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB6C210E6B6;
 Mon, 16 Dec 2024 14:53:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxpxV8LCFWARjcL8cEuHgnB+1DwNjkoajtZfKQTCyr3IPeFSJHJ4vTKXnDYuw1HN8bqI2kjJFPGohgOB1eM3O04KCd8M/LgWYhVGURPS0r5jTKCkb1APNSR/w6zPBpu78xHgee15/TfXJdHyp6KdwA2npV/xSRUEGrjQYzAs/AQCk6iuG03A4ghBxrvBS+xe4rVOEUbeHEgBFPDRx1FThhAZ3iDuyeQHBY+Ntu6wVWWR/p7wJxDdWN4YIhKAlWUARw5D2raonszVbmVU3gIcUGA2uXBZEI3miLg7bbPGimSYpp+rmxKWfd3qxvVviuBBL39auau2DY9ZsHbkzlIfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efOX2hj5+IadwavKdlJNWUuoGvQ6yeBLkVBUBcrowVo=;
 b=B2/OzE8IoJ6f4S4Bumyz0YQbrDZGwmciOP1qVhwCuNiQabH8mHI9ZBAqUsbp5NATww7AJvGvpFG2CdTMTzPtjQMkW0xCrmY5WyclgudGoSyWWn93zVsUZShd4g8nsgQVwGGjiRcwwCnXDwKSplHlWZHf2p1XGZ2oGe2y9a20vZuNlEtGvRyMBAksmzN/aNdqWLpQDWnqUs7VPZ69mVkqe3nATusO2UbmvJgS+kJFs5iyFmqPoBL+ngVLPXW10zh9Z3Ba26lvIvV/Ouyi2YEVJbo/DsMhTyUy6RXZIUe9ZMPB4NnXrQEg61WE4F473B4I3LZzVnDZU4g58DvvxXe2nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efOX2hj5+IadwavKdlJNWUuoGvQ6yeBLkVBUBcrowVo=;
 b=17K1IZE5rMKKTgg07p9SRcKZQvteroA+tmwRIhzDKH2JJH4Fw/16XDJ92HymPzo1j7bTePviGiOKMXyM69HdWCAMKfB2HFmCsNsJwmYaZ5MqRiCepQBT0UzJlkcp/4zKOwj9xghWaVD3R0vBdLreaGNoHVSu38msRKtTJiAexJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BL4PR12MB9481.namprd12.prod.outlook.com (2603:10b6:208:591::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.22; Mon, 16 Dec
 2024 14:53:54 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 14:53:54 +0000
Message-ID: <fc8e80dd-bcea-4515-b446-158649719569@amd.com>
Date: Mon, 16 Dec 2024 09:53:45 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect access
 to connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
 <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0064.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:1::41) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BL4PR12MB9481:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb534d8-e025-40a9-6d52-08dd1de1760e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzlyMUExeTRFa09vclUveVZ6WTVBQk1JaE8vSGVPR2c4N1Q1Nk5Qak5KMDl2?=
 =?utf-8?B?bENnNWtNRlRpMVJrZUFMSE13T0Q5RENpRUpFS1h2Y2Q2Y1F6RDBJWVZCYk01?=
 =?utf-8?B?cW9rcXpzNnpZM1NtMkJpYmtKQ0F2M0JqaElITVpJeUlQVmxuZzZ5WUNDT3hx?=
 =?utf-8?B?U3JNNE13RWdKTGJNTnBPblMvMEZrKzU0d09CYTBNV01LTDg5VFdMWjVHcWNm?=
 =?utf-8?B?S0trSys2TUsyMy9Jc3IzRER2bk03dE5GOENsamt2MHBlM0lja0lNMFphYkFF?=
 =?utf-8?B?SVJrSWFhV0VxZXZVOTdSSE5uK054ajIrcWVDTlpSM2R6cUZTYXQra3RBS1kz?=
 =?utf-8?B?OXlXR1FBczFPS1JKc3dJcEIzWGliYlNscDdVOW5wRzNoMnZpbkx4SFVPNHlQ?=
 =?utf-8?B?dWRRcVpKZDBxdk4zWGlNVzQ5QWYwM2RuYUdSMHVmUy8rVDFyZnpwT3FmQTU5?=
 =?utf-8?B?cDNJOS9oaGp4MkdqRklkRTAyWVFwR2ZDTjF5UTIyWGNSM1lrZHZSWngrQzM1?=
 =?utf-8?B?Slhtb0t6cGIxc3E0eVhxZlhjYlJnamlKYmpqdFp2a3o1NU1yMmRuYXdLT0lG?=
 =?utf-8?B?akErQXh3TVpxaW1lUEF4cTF5eDczTEFSZm1BYjVpamRZdjlRN2gxRGRBQm5N?=
 =?utf-8?B?WThSNkRpalFvNjEwSzdHTUdFUjJiMm1uVi9YaTJhTklzUGI2NTlmSVBkNVVP?=
 =?utf-8?B?RnhhTWsycTlpVEs3aGFkWWxCVjNYcnBPL2U1SW40ZGh6S3ZxZlRGQnZSVjgr?=
 =?utf-8?B?VFMrb0RpV0VmZzMzTTZDbUZrQWF6NTNPNlFIRUt5WWRhNkN1K3BqZGxSZ2Jk?=
 =?utf-8?B?YkQ0L21YeW9vS0swMTQvUng4RDNzR2txVWpmMU5NSHc5UVhGaHR6N3BNdkZn?=
 =?utf-8?B?bnBQZG5iNFVURnhlWmZuRFBqbGRrRmFKdmZjbUdDNDhKNHJiU2d6T01kZGkr?=
 =?utf-8?B?Qmd6MUU2NmdpWTNSR1krQlpqZ0NwTDZvTzZyRkQ1MGlURjA1eE9hMlQ1aUZY?=
 =?utf-8?B?NTlOOFJ3K0NOL3N3dWU4VWRUYjcxWnQ1Ky90VTZpb29jdmVxdXVIS09MQ3JS?=
 =?utf-8?B?R2FyTWNkYnIrYzJBeWRXa3hSblhORUE5dWN5Yk1Qbms1VVNucWs5Ly94OGw3?=
 =?utf-8?B?Qk9Sd1Y3WTJJaEIxRmM0NzJweGY2enNIWnJ5UnJrVVV1WHA0bHpaY0ZHSG9P?=
 =?utf-8?B?d3lwZXV0dDlrc2trVDNTeEhXc0ZSTFV1NnNleTRkNWdEckFlTXNCVFZseS9X?=
 =?utf-8?B?dTBjd2EyVmZzdHM2dGVJWWV3akZEcVZIc2hYYjRzK0kxQmFwdGx1YnZWa2lk?=
 =?utf-8?B?c01HZVVsc1djS1MzSlc3YjlwbzRrYVBPeWZRdkFqRG85WlJtd2R2cWViUkZ5?=
 =?utf-8?B?TTMvYVZ3VFVvY0NQaW41alpGZXgyZ2duRzFqbEdiaCsrNVlCZ3hQZjJLSnIv?=
 =?utf-8?B?Y3hBMytNcy91WERnNWwxT1BIM2VHdDR5RmxGdUp1aUp4SWIrcHJwYktrQ3h0?=
 =?utf-8?B?NjdaZG90R1lhT0YvSzB1VUNEOTdXNlpUaWRNb09pUkhHQTVQWWJHUmtYZHRn?=
 =?utf-8?B?cExUYUgvS21UL2JmSW43aHNobVluaWNKZjFsMnZzL1BUaXVTMkx5VS9ON0Zu?=
 =?utf-8?B?azBwdmNiRk9kNnRNZHNLNkdsZVF5cG9TWldFMHM4M0dPaUVJR3VWN2orNXEy?=
 =?utf-8?B?VTdFQmUrV0V1TXhMMU5mdExleUhvYS9EZWc5REk2cjF3c2ZhdFAvMXVwMXZC?=
 =?utf-8?B?VjU5aGdHMnZvcFZCczFWOTVsNU1VWXZGb0ZEUEd4YW1Ea0dpVDh5RFdTSVcx?=
 =?utf-8?B?K2dCVGpYeU5HUEwvVmdqbnNqMmwxL0U1MEMxeE5SMjRvSGxpU0tscW5iRXR1?=
 =?utf-8?B?ZzdpdlczNVZWN25CTmRhNlNBQkFBaTFUSXVqNElCK3RRWEJwTytzVGlkWVNY?=
 =?utf-8?Q?Zre4FTPbLZk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJkeFhUTDY2QjdveDRuM094dGVkYk1SRUhyTldiMzdTTWI2U3NGYzBiQTNN?=
 =?utf-8?B?emYyOG5PdzlFSlFNRTR6QVcyR2prY1V3NmxHTmc3clNOaGVUUG5iTEpTajBn?=
 =?utf-8?B?QzkzNWxkM2hxZ255N0tidGoxTDZicjNMRkNVM1ZkUkh6SGFlS2J1Y2o4ZFoy?=
 =?utf-8?B?RmJvdW9qYWNNaWppWkVzQzJVa0JqWlBULzVxN0ZEc0x1Z3ZYR1J0eityVFZL?=
 =?utf-8?B?K0tzK2hiajRycWVGa0RPNmNqVEszM1dVVzdITk1qQWJrelhmNnJQT3NTOStM?=
 =?utf-8?B?cFhNeWk2YlM0VVQ0VWxGcU96SE1kRVJPaE8wQXZOYXBjVG80RlRiNVFhK2lO?=
 =?utf-8?B?ZUJtWDVrYjZseDZ0cHp6dDNZLzhYWTVyRTBCdVRaaEszencrOVpKa2hGNGZL?=
 =?utf-8?B?dXBlOU5LdFpGWEErUkR3UktlRm1JMjJKNlNOTXBaajNab3dtRVFIZEVXb0pJ?=
 =?utf-8?B?ZXpnNkFaeEFwUHdXb2ozWFVwUGhRSTFHYmZVRHVDc29EWDNhOFdHWWVQUDR0?=
 =?utf-8?B?UkJ6ZXFtNnRBQWhqV1dTSjI3NGpwUlRPV1pqZ3BYQ1FlbUFVWTdBL3BsbFJI?=
 =?utf-8?B?cVJBcm5sTDVTRldPWjZjNU9BR05YSmNydlBqRk1qUEtLdEtyVGdGTHFpRHEw?=
 =?utf-8?B?bEsxb0ZQMk02TmtIY3dpN0xncUp2TnNGTzRFbytPOXYvMkYxUlVNaFJ1TXlV?=
 =?utf-8?B?amR1MDRhN2lPb2daT3Y0NW91TE5GNmNuNnY1UjIyaUhtYUZ0S1laTFdHdi85?=
 =?utf-8?B?Uy9QemtHbSt0VTR0VXBKWndxMFU1NzVuaDRWOGtyZ0VQaTdrZS9TQ0lpa1ZF?=
 =?utf-8?B?czc2WEZFOFR4Nkl2T2YzbWxJbU9PbXFGbHh2cEVEQUcvNkV3SExwT2J4OVIv?=
 =?utf-8?B?OVdpNTcxOUNkU3NPL0J5bFNJNE9rWmVyRkNjcVpleUhDNXFSb203bFRYRFN4?=
 =?utf-8?B?eldQR3ZiVjBuc1JMRXhGQ1M4MnpGa2YxOWVmejRIS0E0K0pQNEQ0bmdqenNo?=
 =?utf-8?B?UlhBc3FRbnNOanVOY2REd1ViSmFkbEloUUlsbHY0TDEza2F4QzIxK2ZWVEsz?=
 =?utf-8?B?eFlEWU1XemttSHVFR2RacFpkREZuVmZ3N05wWW9NbEg5S292eUszT09aTW05?=
 =?utf-8?B?aEdVeWRsdEQvVTRWaWx5TmZlRmY5U3hlcHBVMTdhcE5TcXBqSjI4ak5JaWpN?=
 =?utf-8?B?TmNXQkdpUDYyUXFCWlhmR3o3R3oxTzM4M3RzNTZBOGdvS0Nua0l0WGZjcGlQ?=
 =?utf-8?B?aGROa1JEeFBJZ1lJUmNHSDVFYzNLd1BhaktkS3VPdnJmdkp4K3loSGs1RnBs?=
 =?utf-8?B?TExpYWQvclpaSkdjNHRwVUdVS0RVOXF4VVBNOWVOWVFiUjhYMndMbnl1RTds?=
 =?utf-8?B?U0wwU1hFTjhST2NpdEQyaFdpSG96Y2x0c2ZkR2VpcXJrS3lkSGZEdWVWYVo2?=
 =?utf-8?B?UlVsc1hZU3E1WUxpZ0djUVZKTVk2ak5PNUZ3MUU1cGt6azBROWhSekg1TDJa?=
 =?utf-8?B?WkpOS2NyRzlLM0RnbzNIbnhFMWVRdEgvRFlhTVFJYjAwaXVRN2NlU1REMDhh?=
 =?utf-8?B?UUdwSzJabzVWTWdEek1QOFJUQmJvTmtUMGZscHVXSkgyMnhyakZaVVhuRzJZ?=
 =?utf-8?B?WFgvcnpuVWVUZVF0ZTNTZ1pFcms1eHJQaDBRdnNabTNOOG03NkkyTG5LeTRS?=
 =?utf-8?B?R3pjc0ZzemFZV0JRbUVIRHdxd1pOMmVNeFhOWTQ5OEttblo3VDVNYzFOaWZJ?=
 =?utf-8?B?Z3dZWnhWV1F1TkFVLzVndi9lNFJpNDBjd2ppK1ZpTk1SNmtBRDlvTkoyWWZI?=
 =?utf-8?B?NCtnbi8rWGx1VHprVjU4RGxKbDBRZkhOeXlSVk9yLzVjVFI3MzlOTEIwTmY4?=
 =?utf-8?B?UFF4QzRNeWZ6SmpoeWZTckhNRGdnRGxjRTdVT3M5Tm9RUVRwdkJWa1FvUkNi?=
 =?utf-8?B?QmhkRFRKaXhoL3JHem9iVU9QcThzS0Z6NWhZSHFGMjh5T1ZFQ05TMFdkRElM?=
 =?utf-8?B?ZVo4TWxlMW9iNWYybkUwbDdSalNwUm96VldEZjdId1ZpYWZiNVAxd1dRUFM5?=
 =?utf-8?B?UHA1d3U4aS85UWt2UFptcTJhaUUrSlF4UTh4YlZrdlA2VXJ5Wkk2UUZIaGJU?=
 =?utf-8?Q?p17bkx4S4zhNI9Q3zKLGKRN2s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb534d8-e025-40a9-6d52-08dd1de1760e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 14:53:54.4306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SMeQE2x+wts60pAxW9MVbs7R1pOcxynEoBalbMt5BArWHs2DPBLcgZuQkIm3hTbxjpdS9CgU/xrCuQxCNVInew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9481
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



On 2024-12-10 16:20, Dmitry Baryshkov wrote:
> On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
>> Reading access to connector->eld can happen at the same time the
>> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
>> order to protect connector->eld from concurrent access.
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>>  1 file changed, 2 insertions(+)
> 
> Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this one
> and to the radeon patches? I'd like to be able to pick the series for
> drm-misc and these two are not reviewed by you.
> 
>>
>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
>> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
>>  			continue;
>>  
>>  		*enabled = true;
>> +		mutex_lock(&connector->eld_mutex);
>>  		ret = drm_eld_size(connector->eld);
>>  		memcpy(buf, connector->eld, min(max_bytes, ret));
>> +		mutex_unlock(&connector->eld_mutex);

All of this is wrapped by the adev->dm.audio_lock mutex. It might
be safer to modify the audio_lock mutex so it only guards the
aconnector->audio_inst access.

But I don't see any way these mutexes would otherwise interact,
so this change should be good as-is.

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

>>  
>>  		break;
>>  	}
>>
>> -- 
>> 2.39.5
>>
> 

