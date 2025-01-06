Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB1A0290F
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 16:19:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BEA10E6AF;
	Mon,  6 Jan 2025 15:19:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HF2kOk5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2051.outbound.protection.outlook.com [40.107.92.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C6010E6A7;
 Mon,  6 Jan 2025 15:19:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wviNI9RcZ2Z50azpsj51ZyPmae1VMpfCqDJcUeKs5EDyANmferZw6YKEDzrKHo8TFoAyIpRC28azPprNlshNKCYpso0ihv88zitbptq7u7JHCPmdpaq9E/D0ihWZRtUPcSgyooHjeABimhhv/XoGgnYtyd2a9XFWUjkwcr+RyBkCQSokMPmLHYIwNKYVX4Z+Z2vSaW7/+BJv2/cY4IlBH5eOEhsknS6R93o0mD2iXCWURK5AxiGLWmVoudGh04lwxCleyNvtm2l5tYxShu7JWDaePPOVJqKeiE0YY8ig7ynMd6cFnsE5JNLhUlNpYrC4NCUCH7b1x1dJNVViOwr3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIvmGPWbUjxHmmlp7ZDSBm5xT+a7uyuOZBONKLoLMG0=;
 b=n6jZw65ubZnzSx5Ff5imvjd+8Ckun6DrUcrNPtuV7IhlC153lRc6TQ/wDmOPT67ZDvWgU06WRrL3qMqpatI8Nrf68C74kLSU7G5WbD/P4pi25IkitcL0a1Tp7j3oV+wJlwKLz8dbF+SdiVYLa+13hTTiDcfL30EfKj8tYIpF6vUEMSgcT4dtH+m4yRXgKKP0M0mp5OScAHzz4Z0zar98/9+VrDQiXMgPEJVeZbaDQH37XomCHWAk+czeYxmAwTkP4iQBIgZin2peTAuRpSLXFNphydsuvKe/mP5wxtaJvnutOnEcX+eh17DAz16rSS/Q3W4PCVxQwH/4UYpQaZ+i/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIvmGPWbUjxHmmlp7ZDSBm5xT+a7uyuOZBONKLoLMG0=;
 b=HF2kOk5BDenf2QTAVoX/ua4un23E3B4vbpH6xf2vYK+YtwUPbBHQqqyFqfKRMspjJSgbQ313i1nrvq3DAklnFrsRmysTykpsK1UNFy/eMZI9sT5IfSKz/fZScvTgfDyzGdNCzxIqSNiRQKlnO3Anrz5l7CyTWhqf/VCGwh1aOF4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by DS0PR12MB7769.namprd12.prod.outlook.com (2603:10b6:8:138::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Mon, 6 Jan
 2025 15:19:11 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%4]) with mapi id 15.20.8314.015; Mon, 6 Jan 2025
 15:19:11 +0000
Message-ID: <ed1af8ef-e2a8-4457-9f27-d5e2315ade74@amd.com>
Date: Mon, 6 Jan 2025 10:18:55 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/connector: make mode_valid() callback accept
 const mode pointer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Alain Volmat <alain.volmat@foss.st.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>, Ian Ray <ian.ray@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>, Inki Dae
 <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Stefan Agner <stefan@agner.ch>,
 Alison Wang <alison.wang@nxp.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jani Nikula <jani.nikula@intel.com>
References: <20241214-drm-connector-mode-valid-const-v2-0-4f9498a4c822@linaro.org>
 <76ho36jqcraehnsgpjralpye52w7ryshhgizekn4qqfsikiojd@3yyorbvjkc7b>
 <20250106-passionate-lorikeet-of-apotheosis-c62ff1@houat>
 <CAA8EJprwNFVV-1pr64_es6XbmOSYtTUYUUK3eOf7LFKBotbrQA@mail.gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <CAA8EJprwNFVV-1pr64_es6XbmOSYtTUYUUK3eOf7LFKBotbrQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0207.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:67::30) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|DS0PR12MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e9ae2d8-93c7-4ac7-145e-08dd2e657895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ai9KU08rckRGeXJHWlJiRjVHVXZIOFZxSHRXVGd2dHhIM1hvV3pXaHoxM3BP?=
 =?utf-8?B?bTdTajcwQWVpOFlETkg1UXFLa1JEU2xXWm5aTjQ2UlNLcXg0OHRjUm0rQkhX?=
 =?utf-8?B?VE1wOVhLbXRhOFh6TVovb0dHMElxVHZ5c0Q2cFh2UG15a2FiR0xEREtYay80?=
 =?utf-8?B?R0F4eFpZWWNqSGtmUFhhZTE2MG52dUVVU3JCRXRZaEVaM3dxRjN5M3NKYklH?=
 =?utf-8?B?cVpJQllXOFIwanF4NW8vV1hhYkxXR0RoWFUycVBWWEh0Q2ZlZ0x5TDlIMTNV?=
 =?utf-8?B?M2cweWFnMkwzR3BVN0xiYyszNTRWd2R5NHY1K2YzY0JTbVJKcDRYNkdiNVNt?=
 =?utf-8?B?OFpWcmJUbm9sMTlEQ0N4N2ZVN3I5Rm5yN2RvRTFjdzZUR3N6VEdaWmUwV0tK?=
 =?utf-8?B?S0RKbEswVU1GM2gzRk5VWXhSQ3pacHlERC9Qb21JUzhBV1lRQTd5QkRia2JT?=
 =?utf-8?B?Z0lraHNpNnMvL1NXWVpzVEVpc0FySlJvN0RYSlRRa1hKU01LeXZOLzhRZlBZ?=
 =?utf-8?B?ZzM1MXNpTFRjaTFsY3pqdy9ZUEtFbjV2K2VjYWRhbVVsVnVCZVJqVGgvM2Fz?=
 =?utf-8?B?OGZ5emlndmdqTzE5azQraFlxK29aTzRMR2VFazkwRE1rWjJpaUdLUEpuSVNE?=
 =?utf-8?B?TlJjR1FSbVNyMkxsYU83YWwyaFdVT0QrVVp3UUpuQW1seW9WeUwyNStuZGtM?=
 =?utf-8?B?cVo2UFJMdUNweGYzdnE3blRlWlJJaXJxZ3JPOStJeE9kejVBQlpFUnBGdTRV?=
 =?utf-8?B?SUhwV3hHcEFCUVJGZVFicGtGYnFudzZ2WWZ6WmJ6ZHkyM0ZmUzZBKzV6eits?=
 =?utf-8?B?WXZaR0ZLZE82U0dJQVNGZE00Qm1DNUN0UVRJQnlyZ1FSS3oraGN2MHNGdVdH?=
 =?utf-8?B?cU95OFZqU2g4WWVORytkSWxaQVVMZDhOakIrKy8zU0VZTUM1NlhRdUpWdmQ4?=
 =?utf-8?B?MDdlL1hadEVhWkV4UHBCdDA2UFlCa0t0WXFNSkpGZCttTU9mVitPR3ZZcEZj?=
 =?utf-8?B?Z3ZScjJNNXdQTmpzM0Q2TnEzeFF6SkJEWXlTVFdDUWVDNDFOZTlDZWd4UmJ1?=
 =?utf-8?B?d09XelZwb3pTNUVXOVAyTWY1N0xucDJGNTNxNE5kRW5HNkxKYkdaSWpJOVoz?=
 =?utf-8?B?US9SRm93WVRtc3kxaVY1MkZ4RXRIbDhabEp0T05IQWY4OElxSldMWm56V0Yx?=
 =?utf-8?B?S0RMT2ZFTnBRTUMrcE85eW9tcW1WOUFQSHlIcFMvOUxDaVg1V0NSSzlzSnEz?=
 =?utf-8?B?Y1UycFFnYVV5L242UnMwVXdjOFEyeWlLRlFmL21qZTJRSUVmUHpxM3VjNHVZ?=
 =?utf-8?B?eTNteWJMNldEZG92aHJBRUswVmdDTXJISXVWWkRHYTFOb21tM2dVMHkxZ09q?=
 =?utf-8?B?U0Y5M1RmZmdsNXRSV0tTTHhUdjc2L05VOHhIL1N1ZTgxNHVGdURWT2NRZ2VU?=
 =?utf-8?B?Z0M1VmovcXZoZXUzaG1VZDNJeDgvbitxQXd2QVMrMTVaMXhqcktFUG5wSjdY?=
 =?utf-8?B?bGcyRmxlZzIxdldPUkN3VjJQSTVrbUpiajBsK3RuOUVRbXZkTnJUUWVKMVdj?=
 =?utf-8?B?Uk0xdWpCa0I4ai8xaWFIT2lXcEFXWXJrbnE2RDJiZU12aFkzcHZwNVlKeFFN?=
 =?utf-8?B?TEZWVE13SWZkK2RqTjNkMGdBaHd6VlNvK21DazhROEZWLzd5WEk5bWpBNmZ2?=
 =?utf-8?B?SllXZEdadE1rV0d0cXBvSHdqQXdzcjZXdzVGeENyRUhoc2dVT3FRZmVVcmN0?=
 =?utf-8?B?Z3A5ZHVtNFdhdkg0Nmk1VWFFRXFmSFIrTUxCeEZCN3BRWFdFY2YvRWtZcW9z?=
 =?utf-8?B?MHJCZW1BZnNlaVdJb1ZBMXdmOVRWTXdHZmhBS1RFUjYvQXVwZFBZdlc2YWxC?=
 =?utf-8?Q?6EHG0R6TIxyno?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHErNTBueEs4SnVVRUdPbENoQW5jbkpScEJhUWpPZ0hGczhmRjhzd1NqZUd1?=
 =?utf-8?B?dENyNkVKVytSdWV3QjFKMVdnNFIvTEtCellERGFNN2xDV0xXdk5Fa3pBeTU3?=
 =?utf-8?B?Ymh2WUhadWd3REUxZTlaRklFR3ZkNitjWmMycFRXRzV1ZGg2ZzFOMktRVTBP?=
 =?utf-8?B?bk1nOHdpMGpnQmtKajR3bjVvY2ZzeStPVWhjQ1hFS2NKanBoSy9OT3EzMFRw?=
 =?utf-8?B?OVVhNU9hbFEvclZNNEc2dWdBd0UzVUlSQysrcEFPL1lQekxUOTFpYlFBb09t?=
 =?utf-8?B?Z3ZBTG9KTlYxSEFwSll1VnZOZEJISitwRy9VQ09WS1JaaXNqck5MUjIwTjhz?=
 =?utf-8?B?VkhGSFg2ZStaNDJlYnpFTWtzL1lCQzF1TUJUb3Jkdi9DVDRHSCsyNSt3bkE1?=
 =?utf-8?B?V1RqM2FOZFpqK2ZPeHlLNGxtR3FFWmxUek1DM3orWHEvbHo3dHhMQlpJWWhI?=
 =?utf-8?B?Yld5SGJzNmxQVStzZStZV1paa3NRMmF1dzRueDJOR2UzTHhvVG5sZ1JpLzVx?=
 =?utf-8?B?S25sZ08zenY1R0ZKWGxpMmZRcXM2ZHBzWDNTcjV6ZGc4ZFY4dzNwMi8vSGRj?=
 =?utf-8?B?bk1uaTJseWc2N3FHeFNNbnRjdE5LNHMycG1YRER5OVh2V0V3N2ZyOHZUZ2xi?=
 =?utf-8?B?QUFMdmh5elFyMExwWlVvVjZPK2t0SlhITHJtUVNIUXorZkdKTWpkcFBRWEJo?=
 =?utf-8?B?RUNBNDM4VXlWUWlFRnFoRFp3V0E1YUpNaFM4clIzMXE5L2xUTTN6OTlQTlRs?=
 =?utf-8?B?WHlCZUw3U0dqSVF6Q0x6bitkRFh0U1hUdEZLampkcWtQR25SSFRjam94a0pW?=
 =?utf-8?B?UHJFQUdVc05KbXcrYVFwL0dDK08xV3lxQVBobVpPRDBtZDNwUW1oRnRrUmp6?=
 =?utf-8?B?WFpxYTNNRnlyMi9yQStSU0FsZXlhL2pVVmxyK0tJODFpejltQXhkdXBzUVNX?=
 =?utf-8?B?WHU2SjB3VFpHQkVnWCtTenVaVzNlYXhFeEc3YVpXekptYjByL2VRdzZwQWMw?=
 =?utf-8?B?YkVoa01QdkhFN0RVZFY1UEFqRVA4NTB5WnYwNndhZEZjaUhwZEFzUm5IYi9r?=
 =?utf-8?B?S1pMc0xUSld5eFRReXRVYWFIRk9xQmdGejFiVGJLSHNWT1hLcWJaRHhJd3RZ?=
 =?utf-8?B?QTQ1dEhQWDlVOENYMEN6WFJpZ2kzVVhiQitYUlpQRWFtbUNqZ0JHN1QySC9s?=
 =?utf-8?B?VkxldlNKZVBheTlNTVd0a2dRZkp2QU1oU3B0Z0NZUUIwNEFrY05TRGp4cHBx?=
 =?utf-8?B?T09WUDlmMExncWJjcitxNWZhY3VUd09XbFdQNmo0ZExUcTRnVHBxMGxGZDFi?=
 =?utf-8?B?Lzgyd3ducTFnN080aG4wRTI2cjVoQzhRNnhwVEdBSi9iVHZOQWl5dzZxbjJt?=
 =?utf-8?B?dTAxa0pILzdCVTRxZ0JqVWUwZWVxK200elVGMDVoU0FDMWFuZVMrN3RrQng2?=
 =?utf-8?B?TnZIZ2hnWGF2Y21KRHJPWDc4MDhhZUJ0U1lBZmRDYTNtaWYwNkZQU0RwQjFM?=
 =?utf-8?B?WDM5OTM1SE5zSGpzNFl5Q2hHZ1VxdWduVUhiMkZrL0kyRkhjcFd6V0d5bWM0?=
 =?utf-8?B?S2ZvQzlxMnJ1djN0Y0VnciswK0F3SFA0YkUyQVJKU2ZuekhpRGgwb1VNQVN6?=
 =?utf-8?B?U2lxdlVyYUVxS05qdE5xbHBPdi96Wk5zVklvNE41cS9LUmUyRGdZOWtKRmVG?=
 =?utf-8?B?QzZwL2Z6V1BQWEZDRlk0VVhleGhEK0Ywa3N4ZmVNZWR4UFpMQTlaRUVaZVda?=
 =?utf-8?B?M3N2alZFQzk3OG02dWNOZkF3RUhiWWJYRzhOczZIcWthWHU5cE5YWXZzbE04?=
 =?utf-8?B?YWdJeHhEZFY0cUIwQXJwRmVhUENsQlVaVmFzdDVQVmVYakVFcCtId00vaXNx?=
 =?utf-8?B?NHg0Vnh6TEQ0S1JHYnM1bi9PQTR1Q1p3a3ByZlI0U2g2aEtvSlhsU3pXSm9s?=
 =?utf-8?B?K1hCaDYrQk41Y1lNdEtJM1gwWGFPN2VvTElHRG55aHpHSjV2TVJpOU5xcHYx?=
 =?utf-8?B?dmVHYTIyN0txWElzL0xiWlpaK0ZFTTdrRzhGb1JIS3FIdmlNcHF4dWRUclBV?=
 =?utf-8?B?b3JpWXFsSG8yQlFBOFppL1FJYkpwVlJXOGRaUmZjYnJQbklSeEcvN2pJVG9C?=
 =?utf-8?Q?vebKROmL3FJQRQLW9rQINdw93?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e9ae2d8-93c7-4ac7-145e-08dd2e657895
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2025 15:19:10.8835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbrz3faUnMgiKmJOsq5A2KmGoQJXUUMIBC1AjQtVWsZcfvQPH50F3HtEEeHETYE8rkRD60F3TTsgeNqMv+fGpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7769
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



On 2025-01-06 04:45, Dmitry Baryshkov wrote:
> On Mon, 6 Jan 2025 at 10:55, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> On Mon, Jan 06, 2025 at 12:47:07AM +0200, Dmitry Baryshkov wrote:
>>> On Sat, Dec 14, 2024 at 03:37:04PM +0200, Dmitry Baryshkov wrote:
>>>> While working on the generic mode_valid() implementation for the HDMI
>>>> Connector framework I noticed that unlike other DRM objects
>>>> drm_connector accepts non-const pointer to struct drm_display_mode,
>>>> while obviously mode_valid() isn't expected to modify the argument.
>>>>
>>>> Mass-change the DRM framework code to pass const argument to that
>>>> callback.
>>>>
>>>> The series has been compile-tested with defconfig for x86-64, arm and
>>>> arm64.
>>>>
>>>> Note: yes, I understand that this change might be hard to review and
>>>> merge. The only viable option that I foresee is to add new callback,
>>>> having the const argument and migrate drivers into using it one by one.
>>>
>>> Colleagues, I'd like to graciously ping regarding this series. Should it
>>> be merged as is (possibly requiring more R-B's)? Or should I rework it
>>> adding something like .mode_valid_new() callback which takes const
>>> argument?
>>
>> I think your patch is fine, and you can add my
>>
>> Reviewed-by: Maxime Ripard <mripard@kernel.org>
>>
>> We seem to lack an Acked-by for amdgpu though?
> 
> Yes. I think the AMD is the only one missing
> 
> 

For the amdgpu patch:
Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

