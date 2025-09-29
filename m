Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B47BA8E18
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 12:22:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E4F10E3ED;
	Mon, 29 Sep 2025 10:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="F/D6SSCs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011020.outbound.protection.outlook.com [52.101.52.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD1110E3ED;
 Mon, 29 Sep 2025 10:22:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t4ABYCu2AjA6ZlIpbIhWVlIcNEVz1tIecrVVzW/pZWhL8tq26F/NKKDfXYUsX+D5DejW8xDHw70NsQoEeYFp/8sjHz/RF49TWmZO+rjAPVqKEvqcw8Iq/f4Y2euG520AB3y4df0DAA9CFC/7LnK4jYnch09Jm/bniq9UXk6e22BZKyHxNWj/yqLZgACZ4Y/bA0fmrlGsLw8THPVhkFw+46ASRmZHFeOI4jLa8TuXwWVbGPmAv9XzRLAlgh8PTRmqHlN+pDv+kSyd63mFUsWKVdN0iTLXOp0FHE1Nah1OGHDVfYUW/8JVCD96u+31Fy0579mJJnAUy3HqHONt0KtbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=On5XoIlnjigbhQXKfXcwL9US76nOY7n3KMeRSMs/TVM=;
 b=pQQlXi5g+0rSIrQzeKH9lx1SCkQkYl7ZEOtBaFfknnYGxrakm3PT7G+J3KHUwqYxudGOy82btwaBJrLcyRhzsoFC0P8AzrU2m+mqbBtNgR9/NFAoAZIitQ/NQUoWR+vdPxPdXC4GmcxtrudblBulKEWFjlHnp/djvYm8vtWFWfHTMa72lo1PfIzKGW/WezexQcHEcjFfucqFq4DjJWflwT/uxPkilWzGtk0nN4+E7jTmenTON+jnsU+tlj7D/S1omyZxLo388klsgBbdrfgy9J+bq7vxFfdiqSN62oqR1Ah+tbhaPUIAkGwIKWdUaPGTJmD29tLfVVgyK7SG0djxug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=On5XoIlnjigbhQXKfXcwL9US76nOY7n3KMeRSMs/TVM=;
 b=F/D6SSCsR42xh5kPSPst5PA2u62Yq7787Bo0UovVroq78jZ4FhUXIEoomCGcyenvCwwTwy2DInh/zbExFcjYZkn8QJAmneEWUc/OiHaNykGjZ5S0B2J6HHWQ5IJa2wyPRqEGYwiF4kzPTEGYY2D4zlmumNJQZlJMzacYYShDnD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by IA0PR12MB8863.namprd12.prod.outlook.com (2603:10b6:208:488::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 10:22:33 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 10:22:33 +0000
Message-ID: <450dcc7b-e53d-4059-b340-aafc3317c1f7@amd.com>
Date: Mon, 29 Sep 2025 06:22:05 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 00/20] Introduce support for post-blend color
 pipeline
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Alex Hung <alex.hung@amd.com>, wayland-devel@lists.freedesktop.org,
 leo.liu@amd.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, uma.shankar@intel.com,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com, quic_abhinavk@quicinc.com,
 marcan@marcan.st, Liviu.Dudau@arm.com, sashamcintosh@google.com,
 chaitanya.kumar.borah@intel.com, louis.chauvet@bootlin.com,
 mcanal@igalia.com, kernel@collabora.com, daniels@collabora.com,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Simona Vetter <simona.vetter@ffwll.ch>
References: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-0-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR10CA0104.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:803:28::33) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|IA0PR12MB8863:EE_
X-MS-Office365-Filtering-Correlation-Id: dbdc5e9b-c9fd-4bef-e034-08ddff421a2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnhHNkhXR0M2VG4zc0ZUdWlZaFNXanFsMGZiUnVDTEg1WGxJa3ZtSFlWTlQ0?=
 =?utf-8?B?NU5tQzNpVzNNOXZOcjV1T1liNm45WTFsdkZtSWltNVJXaElaaDNJSHlSckcz?=
 =?utf-8?B?dUNSQUFYWWRZVElYMWpTSGZKdVFLT3FTSDRTRG1QNkJEaGo4L1hBcit3ZEVU?=
 =?utf-8?B?YWZvSXg1SmU1U2dmUjRNRDhGTE5Xbk4zS0Z0WExTTllldko5Uml5d05FY3Ju?=
 =?utf-8?B?YS9UeGRWRWZoamJKRnZsemtFSjZvSHZ1SXg3V3NjbnRkTnJDLytXMGJBaHJB?=
 =?utf-8?B?V3RzeDd1MStwck1hSktQS3lZQ2VYWXFmWUNSekFuYVpmWHZpWDRabjFwTlRa?=
 =?utf-8?B?OUl6Ui8yV1ZZalltb3M4TUxlSEdQR3d6UnY4c0paRU9rcGlXdWtoeGJXNFgr?=
 =?utf-8?B?blFBb01UZitzbDBjVHJZVFBMdllmdE94UXJkQ3FVVVIwVjFhZkZZb2pob3ZO?=
 =?utf-8?B?VDNsWTMxN0ZYMGFMRkFuNnphNUQzckM2US9uSEljL1RZUE9tQXRCOG54aFo1?=
 =?utf-8?B?V29MQTZLT09vemI5ei9jcmNRb2dzUWxRQlljdnFlbE5peWpLdXNjRDdqY3NM?=
 =?utf-8?B?OEFzKzE3QTZKNEFVd1MxTFFnL2g2bHpYT1lMUGxSaWx2akVoWE1VamhlNVA3?=
 =?utf-8?B?SEw2cTl1cURBMjFneTZKVVFMMitGT0Q2RXVlSnVRSUZJZ3ptRHArNlQ5M3Iz?=
 =?utf-8?B?YjcxcWVxYm1uTURZSFo3T010RExnWkxMaDlRblo4STdUUFR4MFRZaVJoT0ty?=
 =?utf-8?B?aXcybEJLdWxKTTVva2IvU2tkeDVCdG8wK1VKMU5hckI0SUVYaUpHbTgyaXBH?=
 =?utf-8?B?WEhYRXN6ajRDRXZvU1NrcWs0RXFpYlcvNXJwQWVTNU5QcjRqY0lPdVoxL2xR?=
 =?utf-8?B?QnUzNUZIK2RiQUxvR2ZqbHhlaWFMKzhSMUdxWnQ2cU01N0lrejFQdHlxc3Zu?=
 =?utf-8?B?ZGYva0YyaU1SS3IvcW5TVnlzNjF1TzByT0t1MG9ocU9uampPVEwrcUlMMi9E?=
 =?utf-8?B?R0Y1ODdQODhDT016NWoyVVNRZzd5Y05GUVVKb3Qxc1FXVmxFYVE1ajFYeEhN?=
 =?utf-8?B?Snk3dVdleXErK0NZbEVNTVpEZlF5TmR2N2tNR2FhZ09uTWFMQzEwcDdxSlBM?=
 =?utf-8?B?dXhaL2RqOXZwRDMvaFFYM1RxdHNzbEFDK3RCWWs0c2t4aWEzT0pzcjVUS3V3?=
 =?utf-8?B?OHQ2c2tLeVlXa212a2FJU3phRXRxSFZwOER3bTVrbWxpWnFiaFRLamxYV3FN?=
 =?utf-8?B?U2hNM0g3SUhqei9kbjRKY1RQd1IvcWJINEZncDh5bFZYcDJFSHF4OXdoM3lY?=
 =?utf-8?B?SkNrM21oMWRoN25WaFFRUllSTTRIcDlUZS9vQ2dQaG9PcHJUdEVpdW04V3VO?=
 =?utf-8?B?SHFRbGZNYUJ1S3ZjbGpPUlpxZTIvMW5KdWpVT2ZiVHE2bWNMQ1FzV2t4SUVM?=
 =?utf-8?B?NXhWbWs1cTNCZUl1K3VsN2UwK0RLdVFIOTIrV2ZrcVd4U2lKUDJ2TW43emli?=
 =?utf-8?B?SkJmU212ZkVXMTR4M0dLUE9GYk5EUXlCQUZIYm5GR215VmZVOXRRblJ2U0VH?=
 =?utf-8?B?TXhncXBPWEFrN3N1U2pVRXhFVTR0NUhKV1FGRHc1OHk1WXBJOTFtRjluak1a?=
 =?utf-8?B?QWxMREx3a3ExY2Z6RVJGMW1zbTVoUVlXOVI0VERYOFk3bDJybHcyRVpMQThE?=
 =?utf-8?B?cTBYNXlTTjhGMWduVGlManZBQ25rUHJScFpNMVUzMjlCelk4a09saGZsbVpU?=
 =?utf-8?B?VHJFNDBzMi9rRXNmeDFmUjBUL3pOdTVEMUx2M1VIcm1rZytmK2IrR0ZPc1Nh?=
 =?utf-8?B?bzltb3U5SWtYSUdJY2xxekhWS090VGkxOWJiaFZWSCtZUlRJLzU0SExLOUky?=
 =?utf-8?B?ODBZMXZnVEVpNkd4dHlOSmt6U3hLQSswbEx4ZnFxcFgySTNlNE1XY3JIY0ht?=
 =?utf-8?B?UFVhMDYzcmFxZjRXN2ZacUpraFlyUXhnRnZVeUs5eHB5dkI2aFV5cWpNR1F4?=
 =?utf-8?B?M095MEd2Um9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5BK0xidjRUSnorMHdJc3F5bTNRWEFicXN4NHg0YTBCUFVEUDY1L01xRWtv?=
 =?utf-8?B?K2RwQlF0K1VnQ25SM3l2NkNlWmpydUdEMFNnOXl0cTVaNWlEdndpbUgvSzMv?=
 =?utf-8?B?bkZjYTMydzNWRnNrWnJLSG9HZUV5NER6Wjl3cmpvYXEvMkJVSFFKT2VIbUpo?=
 =?utf-8?B?Z3BPWUtJZjl2M05MeExuOXVtQWZ2QSs5eXE4NytTNDNQWnVsWkIxWVZ0VWQ0?=
 =?utf-8?B?V0lHNWxWS2dLOG4vT2MzbTlraDBjdWsvMHpKaTdXZFROaEswSFMvQkJJcDZi?=
 =?utf-8?B?czljM29QQmpPVWdxYkdGY0Q0UWt1MWM0OWZjMWMwOW45cGV2NlAvd1N4ZFBG?=
 =?utf-8?B?MzRGSEJKVjBybmYxSU00bllKMHFkVHAyd1czOXFhUDJQUjV2eWw3Y3UyS1R2?=
 =?utf-8?B?WVQxR0FKSFNrYThMRm1KNWl4eXJsc1YzWUR4eTVKMHl3NElhY1hmcVNpZUl4?=
 =?utf-8?B?d1kzVmo0T0N6cGs1L09CODB5ZDRvUjRZSjN4VWtBT2Q1a3RQcUVFVUp5RGFO?=
 =?utf-8?B?YVJmUkp5S3U4dzRUaHlPQXJ4WUZuOEdLSHg1NElUK0R4dDlTRnBkRW5TVVBq?=
 =?utf-8?B?d0JwbzYyajFndWVLVFVFVm5xaGJsS2hlTitLS2xVQktkUHdqZ0dHeGxUaFRJ?=
 =?utf-8?B?TFVGUVpIS3RMSGx5ekpwK0QvOXFwTGJBTHRHaCtWNHl3MHNldHVMYlZ2L2Zt?=
 =?utf-8?B?VVBaS2tqbjJCRXNENnpPRVg0MEdZRzdPVElnQkh3VDNibDcyOGJTR0hoYzVj?=
 =?utf-8?B?Nk1udUpkWTdjUVBIdzYzTE1Gdk4xUDZnVVpodVlLc3VuWXVIeXpTQ2RvL2dQ?=
 =?utf-8?B?VDcvOWhZejg4QmZRb3p3VDVQdzhCdGZBU0lVQ1pVN3VoNmN2QnoybmtmVWFZ?=
 =?utf-8?B?anRuT1JIbjJkbUZrcFc1RDc0REcwMmVuWW55YWU2YTRBdWJnUnUwWEtuQm9H?=
 =?utf-8?B?NnFCYUEyTzh4R2RTU05LYWlnUkFOSUZjV3NucXFCcVRoZXVFQmVEUis4MU9D?=
 =?utf-8?B?M2pQUmVqeEJubWFoSCtTdFdHdzI3WWNjMit2ZzYxMGw0SDZkVHM0Z04vSHVX?=
 =?utf-8?B?dFd0TkwvNURoSm40Uk1tTlZ0cEcxUXRVdGJrSHZXTmtNek1IdWhIVnFOZmUz?=
 =?utf-8?B?TVpBWXRadWxnU0tXeGlhQ1pxVk0rQzNwZVdCNUoyZ3ZpYmZhelEwd2dxOVhU?=
 =?utf-8?B?YlQwSUErRUFveURtQXBvb2pUOU1iZitZZHJJS2Z0V2ViNm9jdFpCekVQdS9I?=
 =?utf-8?B?WWxBOVNRVkh1dXFaYU1lRjZzdTFYSklVcTlxMVJSS2lRTGNUZzFYcFJxMkJz?=
 =?utf-8?B?Q0x2alBhdG9USmF1bHpaNUc1am5pQjFkV0puOGYwN1ZDV0MvN1NSZkNHbGhW?=
 =?utf-8?B?T2s1NGtsa0RsYnk4QjZ1Tll3a0ozNnd5MjNpY0EvczFZbEdMNHg0QS9TaVFI?=
 =?utf-8?B?bUZyd1BZVldLbWJLazVrSXZRSTFCc0pvR2JnVUtCYm1hOFhtLzFxenlNMDRH?=
 =?utf-8?B?eHUyTXdCYWZFT2hweG9KYUQ5TTAzV0w3ai9ockxtLzZlNkN4NyswYXpqWnc1?=
 =?utf-8?B?MllVNmowVk1TcGx4YThnU3ViOVdKOEJOcTNMV25GR1RmU3pieXk2VlF4Mjc0?=
 =?utf-8?B?Sjk5YVV5WVJNOFNiSFRlOCtCNFRSOFY1dnhsYkdMa09yRTFlL1YvMWMyZHZQ?=
 =?utf-8?B?YUdFVEhyVjI3RGlUamhKaXY2cFFQemdNc3grZHk3SnVrM2tnTEQ0SFdTMU9o?=
 =?utf-8?B?alJZeW9yeHZuaTB4QTBxS25tK0xvYkpLWU5CZVBHcmtKMThXOXZTK2VLQ1Rq?=
 =?utf-8?B?YWdxd3E2OTN3WXZvSHlTY0FnSCtxaTBRVm82TWV4SHRhYlJ2bUVkWUUyeldB?=
 =?utf-8?B?RTkySXR2dEh2cVVFRU4zSWpkRXh2TWtTOW5yaFVUV3pISWo2QloxRTlvMzZH?=
 =?utf-8?B?a3RITURPMGxjMTZCc1BBZzZQenEwalRuUElDS0NwTEkxbEk5L0pPYjVKNWIw?=
 =?utf-8?B?d1puZTBaOHgzbUF6M25NN3lsZWJRZmdPcGQwaS90VDJiWUJBMmlvbURQVnpi?=
 =?utf-8?B?V0xoblVWRWJRZld4dk5QUmdnN21tTXdDY3IycHlnSGxVbm4vR01scEdGQjF6?=
 =?utf-8?B?WXkxWFNOL1V2NkxibHlmaE8rN3BnUitzYzhaVEh4SnVwMkUvdjl2TnZYUlFo?=
 =?utf-8?Q?3n1t2Bvzh2ak3GcIMd2KysY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbdc5e9b-c9fd-4bef-e034-08ddff421a2e
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 10:22:33.2042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvWSPiGXKDyZIcjIapCZbYdrzWisU4QwB2r0I9n9xMOzPcaxV+7//dZF7UB1dtyXBp/rKcYhmoxJU4qGsDqfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8863
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



On 2025-09-17 20:43, Nícolas F. R. A. Prado wrote:
> This series is based on "Color Pipeline API w/ VKMS" [1]. It reuses the
> same concept of a color pipeline API but for the post-blend stage
> instead of pre-blend, by attaching the COLOR_PIPELINE property to the
> CRTC rather than a plane.
> 
> The patches in the series first implement the necessary changes in the
> DRM core to allow for post-blend color pipelines and expose it through
> the uAPI, and then implement support in both the MediaTek KMS driver and
> in VKMS.
> 
> This series has been tested with IGT, with the "Support post-blend color
> pipeline API" series [2] applied, on top of VKMS, as well as with
> Weston, with a WIP branch [3], on a MT8195-Tomato Chromebook, where both
> gamma LUT and CTM color transformations have been simultaneously
> configured in hardware through the API and validated (test commits for
> weston at [4] and for kernel at [5]).

Thanks for this work. Great to see the concepts translate well
to drm_crtc.

I haven't looked at the Mediatek or VKMS patches but left some
comments on the core patches.

Patches 1-2, 8-12 are
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> 
> [1] https://lore.kernel.org/all/20250815035047.3319284-1-alex.hung@amd.com/
> [2] https://lore.kernel.org/igt-dev/20250912-post-blend-colorops-v1-0-83fc62420cba@collabora.com/T/#t
> [3] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-colorops?ref_type=heads
> [4] https://gitlab.collabora.com/nfraprado/weston/-/tree/post-blend-color-pipeline-lut-ctm-test?ref_type=tags
> [5] https://gitlab.collabora.com/nfraprado/linux/-/tree/debug-ctm-lut-data-post-blend-colorop?ref_type=tags
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Changes in v2:
> - Split core DRM changes for post-blend color pipelines from single
>    commit into smaller changes
> - Added post-blend color pipeline support in VKMS
> - Introduced driver cap, and made client cap depend on it (daniels)
> - Made deprecated color props (GAMMA_LUT, DEGAMMA_LUT, CTM) available as
>    read-only when post-blend color pipelines are enabled (daniels)
> - Created colorop_modeset_lock/unlock to commonize locking pattern for
>    colorops (louis.chauvet)
> - Added helper for post-blend 1D curve colorop creation
> - Link to v1: https://lore.kernel.org/r/20250822-mtk-post-blend-color-pipeline-v1-0-a9446d4aca82@collabora.com
> 
> ---
> Nícolas F. R. A. Prado (20):
>        drm/crtc: Add color pipeline to CRTC state
>        drm/colorop: Allow parenting colorop to CRTC
>        drm: Factor out common color_pipeline property initialization code
>        drm/crtc: Add COLOR_PIPELINE property
>        drm: Introduce DRM_CAP_POST_BLEND_COLOR_PIPELINE
>        drm: Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
>        drm/atomic: Pass post_blend_color_pipeline client cap to atomic check
>        drm/atomic: Print the color pipeline as part of the CRTC state print
>        drm/colorop: Factor out common paths from colorops helpers
>        drm/colorop: Introduce colorop helpers for crtc
>        drm/colorop: Export drm_colorop_cleanup() so drivers can extend it
>        drm/crtc: Track post-blend color pipeline client cap in drm_crtc_state
>        drm/mediatek: Support post-blend colorops for gamma and ctm
>        drm/mediatek: ccorr: Support post-blend color pipeline API
>        drm/mediatek: gamma: Support post-blend color pipeline API
>        drm/mediatek: Set post-blend color pipeline driver cap
>        drm/vkms: Rename existing color pipeline helpers to contain "pre_blend"
>        drm/vkms: Prepare pre_blend_color_transform() for post-blend pipelines
>        drm/vkms: Introduce support for post-blend color pipeline
>        drm/vkms: Set post-blend color pipeline driver cap
> 
>   drivers/gpu/drm/drm_atomic.c              |   9 +-
>   drivers/gpu/drm/drm_atomic_uapi.c         |  65 +++++++-
>   drivers/gpu/drm/drm_colorop.c             | 245 ++++++++++++++++++++++++------
>   drivers/gpu/drm/drm_connector.c           |   1 +
>   drivers/gpu/drm/drm_crtc.c                |  77 ++++++++++
>   drivers/gpu/drm/drm_crtc_internal.h       |   6 +
>   drivers/gpu/drm/drm_ioctl.c               |  12 ++
>   drivers/gpu/drm/drm_mode_object.c         |   9 ++
>   drivers/gpu/drm/drm_plane.c               |  36 +----
>   drivers/gpu/drm/mediatek/mtk_crtc.c       | 208 ++++++++++++++++++++++++-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.c   |   6 +-
>   drivers/gpu/drm/mediatek/mtk_ddp_comp.h   |   2 +
>   drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 100 ++++++++++--
>   drivers/gpu/drm/mediatek/mtk_disp_drv.h   |   6 +-
>   drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 107 ++++++++++---
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c    |   3 +-
>   drivers/gpu/drm/vkms/vkms_colorop.c       | 106 ++++++++++++-
>   drivers/gpu/drm/vkms/vkms_composer.c      |  13 +-
>   drivers/gpu/drm/vkms/vkms_crtc.c          |   1 +
>   drivers/gpu/drm/vkms/vkms_drv.c           |   3 +-
>   drivers/gpu/drm/vkms/vkms_drv.h           |   3 +-
>   drivers/gpu/drm/vkms/vkms_plane.c         |   2 +-
>   include/drm/drm_atomic.h                  |  20 +++
>   include/drm/drm_atomic_uapi.h             |   2 +
>   include/drm/drm_colorop.h                 |  22 ++-
>   include/drm/drm_crtc.h                    |  27 ++++
>   include/drm/drm_drv.h                     |   6 +
>   include/drm/drm_file.h                    |   7 +
>   include/uapi/drm/drm.h                    |  25 +++
>   29 files changed, 994 insertions(+), 135 deletions(-)
> ---
> base-commit: 342e5ee08797cde0e8af30e6110a5dc1cba61e9c
> change-id: 20250730-mtk-post-blend-color-pipeline-498e1a9cc53e
> 
> Best regards,

