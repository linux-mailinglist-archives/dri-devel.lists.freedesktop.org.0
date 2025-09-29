Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B7BBA8BB8
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 11:48:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC8E10E3DE;
	Mon, 29 Sep 2025 09:48:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Nm32MOLv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013024.outbound.protection.outlook.com
 [40.93.196.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAE910E3DE;
 Mon, 29 Sep 2025 09:48:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XBnEs1ntMD/X/i++CJoogs3wPdSJgFJ7sJXRrgQ180cA5w5AdUb9UpUC/KAP73RsFKH/MyIR9NOZO003s6fpTHMIhnUhwsx+N7XcKsR+J95EjULFYAnzEYtc5LwsWSuuzeQiYDyh/efyqIohXrnsbymsQzpRl8ROD/77czrOGCpAij8MIH49RDiCpaHMNh5MNrYjYGhgkmCptKzwq6doV4Ou790uyHCv6QrCx6ORKDaBHB2XSsyMaY8d2XXbvdY61Zy6JvWlUDSABAjFdwlB6Pq+zgX+LPL7Rsc4scBlQXG+TkPXbGZuWUPvIJfjEy0spe3ZLcCWYb4gJnwjfhkEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZypHlUVPE7hZhHIx92qZULr754tSdO/bL9ibakXJuCo=;
 b=DmRNQN/aUAY4zq4vxgxdQnIp/WTYSxqwZ31HRL3hZaPGV07FNX3uTWwx5TNmrHXX+dodBGKCRdHZ5VX+Tl4g/srYo4qMpHPLsnjwIgBS9Fzab3wzUg0patv5hil7/kpdFzDmMMXRXzR2/HF0b4Gkgh08LBsK1FIzGneuMY1k0wrsmCb3rikIXvKi8oOcAcY1q1akFiXM2P8qTHl9NEcixNt7UUBM26QTcwk1Y2DkGfjSC0Bg8K/K+nrbWkoZi22Qy7rRJSYXvKJQ3k5l/RHrVxDr6uDO1XuPgVsCC5G/qdJHapuk6//b5IIsxZS+W+U1DywP1ANAfx3LJ7emh5bfTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZypHlUVPE7hZhHIx92qZULr754tSdO/bL9ibakXJuCo=;
 b=Nm32MOLv1o1o6kbJLN1uocVN+cVieCi5JrY/2t4YX99Z6iWDYEJDVy/jepFQpf1JxkPsOOY/Xe9No/ShcUQxKRqUoZP+bu+UuzLo4t5dX1HYwmIcd3TXOmiK2EeRhbVCXJg3ULJpOnvbgR5dQo4NWJC1X871jQdVHdjZaSTWDEw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 09:48:36 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::9e93:67dd:49ac:bc14%6]) with mapi id 15.20.9160.008; Mon, 29 Sep 2025
 09:48:36 +0000
Message-ID: <5e5017ae-b71a-4933-b248-e68d52fab7ff@amd.com>
Date: Mon, 29 Sep 2025 05:48:21 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 06/20] drm: Introduce
 DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE
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
 <20250917-mtk-post-blend-color-pipeline-v2-6-ac4471b44758@collabora.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250917-mtk-post-blend-color-pipeline-v2-6-ac4471b44758@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:800:1ba::20) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: e799f17f-bbb3-4f49-4bb5-08ddff3d5bc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzBWdFJMT0hmL0lIaXlsS0VjUTU1aE9rdFM2Z2JZZHJSRU0rb1NLczVIN2lj?=
 =?utf-8?B?SVp6S3BVQlMxdWh3QkxIVU82bExGajlPQ3Y3RGJpbU9hWlNMNXpaQ3ZpaUsw?=
 =?utf-8?B?eExVQS9KTWtBMk44Q0tYWldjVWwvL1NFd0NpRGNoTEdFMVFqeHVSaEFOMjRK?=
 =?utf-8?B?SitxUXB0MFg3RXpzNEJPMmh5bXBKdVRBUlkrbm1WV3lBSXpBSmI3NU16aTZ4?=
 =?utf-8?B?QVl4Ulp1MmVwK3V2UXdSMFR5WU5ZSlp0RUI2Zlp5M2Y0cm9lVXE5ZUQ2WVdv?=
 =?utf-8?B?QWFtdzY4Qm9KYVQvS1JlLzl0VXVvOXB0S2k1a082dG5yUDNSeEcvRmFWQkl3?=
 =?utf-8?B?azJqbmdwMisrV2N5Q1JqdkJZWFMrbysxcXo0YlBYcHpGK3BDWW5pRWh4M3RH?=
 =?utf-8?B?anhHN2ZlNFVNK2JRSjJtVUMycnVOTllXUXFrbitHZW8vZTcyK0NmYnNxTTR6?=
 =?utf-8?B?YjVVN3RDanBtN0FOZGxWMUN4eGUxODhieGVORkNBb1NFN1JwY2Y5RThrUGs0?=
 =?utf-8?B?OWxLMmdIZCsweU9PUmQ2ckZaOTFUcnRHcFM4WXdXNlF0ZWV5dm9kaVZVTGtW?=
 =?utf-8?B?VEdNL2Q1SU1FdjYyR0U4bW1EL1UyUzc3cHdyaitHbi9qSG1qV1dJejVTYUZ2?=
 =?utf-8?B?YzQwVGZnYnRNSVhxZ0FzY0Zhci9ieXRzNFdYZ0lBV3pSbFhLckZPSC9yMTRo?=
 =?utf-8?B?dHN5bGhMdVV5SmNQVmV4bVRJdlMzNURHRU4xeFFMTytvUUdUR1A3T09qTHht?=
 =?utf-8?B?ZmVrNnBIa0YzTFF5eGxybWtodG53TjVLN2x1dG1TTk5pSWtUSDEwdTcxNSs4?=
 =?utf-8?B?VWVFYUFuN3ErOE9qZlZGUDNrREFtTGo0WExlcEd1LzVvSjYzVmNESWNta0l5?=
 =?utf-8?B?RkFML3FqYXJOdENSQmxoRkVNeTJjWlZnR01Ed2c1ellJc1dQZ2d0TDRkY2pw?=
 =?utf-8?B?OXQ4WmphNVZld1BMaldpa1UyV0RBUGFUYWhlb0JJWjhWZkIyOCtFZ1FwZkZM?=
 =?utf-8?B?enJKZ0FPQm14MHBEWlJmMUFrSnpLcWE5R1RMSHpHdXU3TFI0eUZVcGt5NjJ5?=
 =?utf-8?B?QmVyS0lxUEpCSHFqdm9SZGNKSFNQa0xCUmpiMlhNQnJDSElNU3pjZzdjazNV?=
 =?utf-8?B?dFlQT1B0SXJhejE0QStMdWpzYVhidys2SDloTlVtNlQ1L1BZSlNMWkhMLy9E?=
 =?utf-8?B?Ymd4UnQ2VHNUNG5qUFNrMDMza3RJYnFoTEdnbUdoeFVDNVhJcy9oZmFxUlBK?=
 =?utf-8?B?VXQyZ2JYZDZ2Tk9CRklvVi9oaUtUN1Ntc0hEWDloZmtKeWJWdXNqdyswMnM0?=
 =?utf-8?B?TkpLdTBTN2dtMEFzUXhKcCt0MzhRanB2ek1BTHNhTjFPOWowNXRmL0JYS0Z4?=
 =?utf-8?B?d3hRSHVRY3J3WGI5cHlJdXQ4Y09XdnVEa2VOd0dLMFVLdG9JdWNCMGliVnZX?=
 =?utf-8?B?K2VBaE81bHBTTGpNaGhwNGNDWXZVbDJQYys0Qk5xdFlXQkNtS1BDK2RZamJZ?=
 =?utf-8?B?a2NuL21DY2RzcEk1Q3hCdU1Ca2hXZXZqbmtWc3pSTGJXTWhhblhITEpMNkk5?=
 =?utf-8?B?UWZBQzdxVy80VFI3c1kvNUt2Mm9mWWloNjlvNW1VQm03UVJtRE5PdzJ4MU82?=
 =?utf-8?B?RHRyTHoxeFhuRXBJUWZyeGpGdFJVd1ZVbHIyZ3hIN3ViUDVYbnpDOCtIU0VO?=
 =?utf-8?B?aUhuWHU2UnVBT2V6bldveVpVM2lBY01ETnByc1pNS2xwL3BjRTFDVk9DUjQ3?=
 =?utf-8?B?VzFiMERzZTRreXJZMGd6a3U2NnBwOCtud3pXY05pV2dpKzgxQ3p4K21BN1Ev?=
 =?utf-8?B?b0hXSWFjR3BxZ1FQMGtEMlZtc01nMDd0NDNOcTFvRnZIZ0ZuV3czaHNNQ1RE?=
 =?utf-8?B?WUhqKys2T3lack1HUDA1ZFBCSlV6UGpTRnAra25PY01lU01hY0xtNTk3ZitT?=
 =?utf-8?B?eWtHaDJWTGVwSnlwd282MGJzWlFzOEVIY2lrQlNMNzF3bi9iY2JxZXB6cjNz?=
 =?utf-8?Q?R12ffwV6J3e7QFInvfl710jD3GNjcM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUtZVll2OW04bkgxeHRoUGpuZEFBblhBaVRiQk5uYXVwRGV1cUdtSjlJeE8r?=
 =?utf-8?B?Y3hOUUlSL2s1Q2ROc3dQNzlTZEZZZkdsbDlrR000aHlMYXRYbGtveTYvV0lx?=
 =?utf-8?B?V3RBaFgyM1FIUFpwY0FwS1JheG52Q3pjSnVOTDVaQ2dkdkZGakZpV1ZwcmY4?=
 =?utf-8?B?TzN0dVZSZlJnYVZXZ0YwdXdjcWUrL1Jha0h0Sko1WldXY2daRXZJcXlNQ3E3?=
 =?utf-8?B?TlplQkxBQ1pLUmxLMWFzMEV1eG45L09BenE1UkdGaDQ1WXlMV05Bb3lXME1O?=
 =?utf-8?B?VzkxOVQvbWZjSjJuVCtvcFUxUnV3MDkwV2pnT2d6Y2oxQndmVk9uYUhpdEk5?=
 =?utf-8?B?ZGpEeExHWnh6QXNybXI2dGdTbkJQVkRBSWU1ZktsSlM3NVdwT3FzVXJqUWxx?=
 =?utf-8?B?b0tCb0lHaHRYNEZOekw1aGFvS1MxclRid3NWSlZ1YzFoZlJWT09IaHp4RnNN?=
 =?utf-8?B?UDBtUUFRVEhvOC9rclQ0L1RCQ0Z2SnpyN2VobnNZRTBQSW5wY2I3NHN1ZDBE?=
 =?utf-8?B?VXB6eXJObTNqL3M0U3U4M1l4bXZDWjcva3gwcENKNTJWd0VTS3J4bzF0eXdX?=
 =?utf-8?B?QjIwc1VwMmhZUStSUzVQVFZRQjBtcXNCR0ZXY0pwZmFlallvdjNSRG12cERM?=
 =?utf-8?B?RlpvbTdva2l4WW9qSkZrOTRUdStjRzVGZHZDdWNnOHduRjhJNjA1eWRuVDFY?=
 =?utf-8?B?anBCV1M5anQ1VHluT2hyT3pCRmF4SzMxajlxWEpsZHdmTksvWTR2U0pnRVdH?=
 =?utf-8?B?OTdIancrem91aTVZbkN0TlRZbTRhUTVobEc3L242a09FZGR5bk4vYTdIRFJI?=
 =?utf-8?B?eWlKaHUwM0tWQUtCdkZzbGN6SUJIWFRxTlRrelRPN2MzUXJGMTBvalF3M3h6?=
 =?utf-8?B?MW1PdEFjejcwUEpkYjBvdGtrVmlEV0NtMEtSdUwyWDNOaTMxVHFHdTFqV1BB?=
 =?utf-8?B?L1haMWdNRmZmVnB5bUJaZVgvbHJSaW9tMndvWkFUNFB5NEpveUpWVVBlMUdx?=
 =?utf-8?B?TzRML3p2dThBK0VSc3BEQ2EzOTVRR2ZtdDdIL0VuOUJ1SVVGMnJSU2VnOWRp?=
 =?utf-8?B?ZEZHZFRsY1JMSGNOb08zYWhHOFE1SDFaTUc3a3VqYmZUV3VhVmxiY2Q3d2xp?=
 =?utf-8?B?T1pPMGhZMUV4cEI5N1JodEdBZWxranJtTk1oWCtwcXZtZms4UzZXM3VUODlI?=
 =?utf-8?B?NzEwU3JKRVZjZjFZL2NEOVFWNitPRlFsZ0VhdnJETnprbUlZSkJydFRFQlpN?=
 =?utf-8?B?UXY1NnVTZHM2eUg4WXNHamdjNDQyTko2YkJCdlNjdU9wa09xYTZHT2lHT1Er?=
 =?utf-8?B?ZnhORUtCUFJXL3lKaThIOGN3c2RxM29UdGJjYkpCNlJTUXJpUmxjQ0VkME1D?=
 =?utf-8?B?WUhnTzdzWmRSWkY0K3Aza2VVV2NxbGI4cXhZclJaaXlmMmVRVWNKMFFDeGI5?=
 =?utf-8?B?WlltMmVBQk9rRXZCUGZ6VGtnUnJvWFoyaUFzZ085ZThPL0dMc3FQRDlXblpB?=
 =?utf-8?B?S2N5VE1BQy9hKzNMQThXOUk2NGhmeTQ4MExWbjFoSWtpYjFSQ0RhaDZEWmxy?=
 =?utf-8?B?ZHF2YWhXc2JVV28wbFlHRlgxSlFZZ1FUNVBudVZZcHNCVllOaUxHWVRjV3Rt?=
 =?utf-8?B?d25jR2YxNEFDVmhOUmQwbEwzK080MjkvZTVYbE5ndjRtS2dNeXArNUtiZXYw?=
 =?utf-8?B?eDVPMDhFTmFrMTBpdDluTE5qZzk3SVNmbkVpd3lUNVVSZWpKMnEzRkJ2aHlC?=
 =?utf-8?B?d0ZPRC80UUtOd0I3K0xXLzd0TUQyOFdBN0JOWHZuRkdnQ0RaUjVBOE43OVFo?=
 =?utf-8?B?TWc0c2daS1JSMWQ0S1pCRSs3bTRtd3h5WkMzY3hSbC9EVTIzb3ZiUXpsQTNQ?=
 =?utf-8?B?eFhETGYrZWJGa1RHdGszUEJhejNBKzErNUpQUzh2T1daNnVHNTl6ZVBpTlRS?=
 =?utf-8?B?VG45RG16R0FSTzJ6SkVCS0Zubk5sN2pTOVVXSks5SSthbmFER3BILzlpaWkx?=
 =?utf-8?B?L0tlVzZLcm1RY3p5M2pYTlZjY1Q0S0JOZHJaaTN6cW8rNUErNHQ1Um13TUVU?=
 =?utf-8?B?aTZVbm1oUFI3bFpESHpTQ2FpdmplUHpNR0xteDErRU9yekhtclNGNGZmWFZo?=
 =?utf-8?B?WGk5WG5iZEk4U0hJSTlPZDVKSW5ZVDg2dGNJbE4rT1AzR2NiYXR0T0JTaVdw?=
 =?utf-8?Q?fZaP7ZPIE5XXLVHHtQVgec4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e799f17f-bbb3-4f49-4bb5-08ddff3d5bc2
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 09:48:36.0975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +l3EwIzIxSbkVNv9HMQidNELVt/1CXzdBDhibi4uhFJQTkwLqOOoRgpsHcQIqZEZqtrVgWjZv4kHVBA2T1hU7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082
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
> Introduce DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE which a DRM client
> can set to enable the usage of post-blend color pipelines instead of the
> now deprecated CRTC color management properties: "GAMMA_LUT",
> "DEGAMMA_LUT" and "CTM".
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>   drivers/gpu/drm/drm_atomic_uapi.c   | 15 +++++++++++++++
>   drivers/gpu/drm/drm_connector.c     |  1 +
>   drivers/gpu/drm/drm_crtc_internal.h |  1 +
>   drivers/gpu/drm/drm_ioctl.c         |  9 +++++++++
>   drivers/gpu/drm/drm_mode_object.c   |  9 +++++++++
>   include/drm/drm_file.h              |  7 +++++++
>   include/uapi/drm/drm.h              | 19 +++++++++++++++++++
>   7 files changed, 61 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
> index 063c142fd9b656e228cfc660d005a3fbb4640d32..f5125fa3fa28ff2a6ff07fd7cf07d4bdf77ab738 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -452,6 +452,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   	} else if (property == config->prop_vrr_enabled) {
>   		state->vrr_enabled = val;
>   	} else if (property == config->degamma_lut_property) {
> +		if (file_priv->post_blend_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting DEGAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->degamma_lut,
>   					val,
> @@ -460,6 +465,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == config->ctm_property) {
> +		if (file_priv->post_blend_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting CTM CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->ctm,
>   					val,
> @@ -468,6 +478,11 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
>   		state->color_mgmt_changed |= replaced;
>   		return ret;
>   	} else if (property == config->gamma_lut_property) {
> +		if (file_priv->post_blend_color_pipeline) {
> +			drm_dbg_atomic(dev,
> +				"Setting GAMMA_LUT CRTC property not permitted with DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE client cap\n");
> +			return -EINVAL;
> +		}
>   		ret = drm_property_replace_blob_from_id(dev,
>   					&state->gamma_lut,
>   					val,
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index 4d6dc9ebfdb5bc730b1aff7a184448af7b93f078..f58cfd2131139ff3e613adc4dbb9ddbedf724dc7 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -3440,6 +3440,7 @@ int drm_mode_getconnector(struct drm_device *dev, void *data,
>   	 */
>   	ret = drm_mode_object_get_properties(&connector->base, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->post_blend_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(out_resp->props_ptr),
>   			(uint64_t __user *)(unsigned long)(out_resp->prop_values_ptr),
>   			&out_resp->count_props);
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index e3dbdcbfa385b940ec0b5476adde6146fe4afde1..c53f154e5392a10c326c844b7321666275f9ac02 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -169,6 +169,7 @@ void drm_mode_object_unregister(struct drm_device *dev,
>   				struct drm_mode_object *object);
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool post_blend_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props);
> diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
> index 01592d10e3465ddceddef94bc417f98d3ec12087..ea9600f5392f520a2b42ba7ef363d2f08ce19812 100644
> --- a/drivers/gpu/drm/drm_ioctl.c
> +++ b/drivers/gpu/drm/drm_ioctl.c
> @@ -383,6 +383,15 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
>   			return -EINVAL;
>   		file_priv->plane_color_pipeline = req->value;
>   		break;
> +	case DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE:
> +		if (!file_priv->atomic)
> +			return -EINVAL;
> +		if (req->value > 1)
> +			return -EINVAL;
> +		if (!drm_core_check_feature(dev, DRIVER_POST_BLEND_COLOR_PIPELINE))
> +			return -EINVAL;
> +		file_priv->post_blend_color_pipeline = req->value;
> +		break;
>   	default:
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
> index b45d501b10c868c6d9b7a5a8760eadbd7b372a6a..5e6c3de9456b997985142a68b9cef57771a58bdc 100644
> --- a/drivers/gpu/drm/drm_mode_object.c
> +++ b/drivers/gpu/drm/drm_mode_object.c
> @@ -388,6 +388,7 @@ EXPORT_SYMBOL(drm_object_property_get_default_value);
>   /* helper for getconnector and getproperties ioctls */
>   int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				   bool plane_color_pipeline,
> +				   bool post_blend_color_pipeline,
>   				   uint32_t __user *prop_ptr,
>   				   uint64_t __user *prop_values,
>   				   uint32_t *arg_count_props)
> @@ -416,6 +417,13 @@ int drm_mode_object_get_properties(struct drm_mode_object *obj, bool atomic,
>   				continue;
>   		}
>   
> +		if (!post_blend_color_pipeline && obj->type == DRM_MODE_OBJECT_CRTC) {
> +			struct drm_crtc *crtc = obj_to_crtc(obj);
> +
> +			if (prop == crtc->color_pipeline_property)
> +				continue;
> +		}
> +
>   		if (*arg_count_props > count) {
>   			ret = __drm_object_property_get_value(obj, prop, &val);
>   			if (ret)
> @@ -475,6 +483,7 @@ int drm_mode_obj_get_properties_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = drm_mode_object_get_properties(obj, file_priv->atomic,
>   			file_priv->plane_color_pipeline,
> +			file_priv->post_blend_color_pipeline,
>   			(uint32_t __user *)(unsigned long)(arg->props_ptr),
>   			(uint64_t __user *)(unsigned long)(arg->prop_values_ptr),
>   			&arg->count_props);
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 1a3018e4a537b3341acb50187d47371f6b781b9d..42b9a43baa18079af8ec2ea5b1484b23c497beb0 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -213,6 +213,13 @@ struct drm_file {
>   	 */
>   	bool plane_color_pipeline;
>   
> +	/**
> +	 * @post_blend_color_pipeline:
> +	 *
> +	 * True if client understands post-blend color pipelines
> +	 */
> +	bool post_blend_color_pipeline;
> +
>   	/**
>   	 * @was_master:
>   	 *
> diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
> index c6c53e57958e951204154ce41a69696a6876f0e8..f9ac10b3e4876f71005a87dedefa4aed320566f0 100644
> --- a/include/uapi/drm/drm.h
> +++ b/include/uapi/drm/drm.h
> @@ -927,6 +927,25 @@ struct drm_get_cap {
>    */
>   #define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
>   
> +/**
> + * DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE

DRM_CLIENT_CAP_CRTC_COLOR_PIPELINE might be better to align
terminology between pre- and post-blend pipelines. It would
also make it clear that this is about the color pipeline on
a drm_crtc (which pretty much by definition means post-
blending).

Harry

> + *
> + * If set to 1 the DRM core will allow setting the COLOR_PIPELINE
> + * property on a &drm_crtc, as well as drm_colorop properties.
> + *
> + * Setting of these crtc properties will be rejected when this client
> + * cap is set:
> + * - GAMMA_LUT
> + * - DEGAMMA_LUT
> + * - CTM
> + *
> + * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
> + *
> + * This client cap can only be set if the driver sets the corresponding driver
> + * cap &DRM_CAP_POST_BLEND_COLOR_PIPELINE.
> + */
> +#define DRM_CLIENT_CAP_POST_BLEND_COLOR_PIPELINE	8
> +
>   /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
>   struct drm_set_client_cap {
>   	__u64 capability;
> 

