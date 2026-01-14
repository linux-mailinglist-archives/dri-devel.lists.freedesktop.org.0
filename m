Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D63D20B65
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 19:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102AF10E658;
	Wed, 14 Jan 2026 18:01:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="waolrKMs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazhn15010019.outbound.protection.outlook.com
 [52.102.146.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 900BD10E658
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 18:01:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rgPYrwVBd+sAxcZzDUtXRJMr7xRe45tNMkDj0ycU9lzOgLdU6hqPXzUYuaJCsV4Zu2v26rJeSX/GAg0HSUbS9zbwn3UujP0ozrfgCln9JN/q4K5vdvr7Yb+6EASlbDwMcnI/OHXXRczIXZ1V6mkK/jcqj5TjLxkaLofcytQiR8pVRhYmHr1dsD8LxNIYvCtUezBZX0DIn94Ujz9g+t1brUpTy5KVK4/tfwJI/dT6sdOe6ncl5C2nhwfNq7WlEpKbJq4XvO8QISoCawywELvkciJ2DPNJPLqC79kkBG5EiS8Ug0yLRMnfwl0eo+y7WUxiAAzYugwh8NPHm7cC8/YVyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V/yuBBaDAznftGhhFsXmsET3hkGuuS/ENIedWO8VvpY=;
 b=J8cshxXT/PXFHtWk9CUZixSAi2NwJ2Un9tMhfjyDFnk/GJoPMrYzjv+tj645n8OlXY0f6yUERu6JX1u7ewFZMR6hwA9QgKw/3ZPoooqWsLeDZ8Gs0EnQLFcfYQph48tgwHkNR51Ls34C5kBCtpwgQauSycl9EQ5abBJVD+OkRwYyAZ+TIanXG9NADmkSWG//SYeHKjaL8zkGkNoG/IrYfdSjjKzStATta9ZT38DZYR6lR98x6fj+aL4WHwP1BtIAC+wzea7dV3HTxV3aHuUpuegObEw7EHvJMFulnIwzEZRDAwLn4NscnJFeU3+MiSLEVoTgUouDC3hqP+6plTqv8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.linaro.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V/yuBBaDAznftGhhFsXmsET3hkGuuS/ENIedWO8VvpY=;
 b=waolrKMsxJF5mP5CAwCNmDGFpDeZceMFhrfqfmXObXNlKxzfJhmJOHEuKA+aWjczXs3VT6Vo3MmNFdoArjvvB0yE34Nlzy2ViA3pUJFbrPPIQpYlk2+95wY8+t+Nw6b86xEXgwXEzw7NwF2rzZ5OgDHEEdqGAZ4vVZjvxLYHFQg=
Received: from BYAPR11CA0051.namprd11.prod.outlook.com (2603:10b6:a03:80::28)
 by IA3PR10MB8323.namprd10.prod.outlook.com (2603:10b6:208:583::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Wed, 14 Jan
 2026 18:01:43 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::e4) by BYAPR11CA0051.outlook.office365.com
 (2603:10b6:a03:80::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 18:01:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 18:01:42 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 12:01:42 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 12:01:34 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 14 Jan 2026 12:01:34 -0600
Received: from [10.249.42.149] ([10.249.42.149])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 60EI1XDc196359;
 Wed, 14 Jan 2026 12:01:34 -0600
Message-ID: <7628b04f-df46-47cc-a33d-c40650b256e7@ti.com>
Date: Wed, 14 Jan 2026 12:01:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] accel/thames: Add driver for the C7x DSPs in TI
 SoCs
To: Tomeu Vizoso <tomeu@tomeuvizoso.net>, Nishanth Menon <nm@ti.com>,
 "Randolph Sapp" <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, Andrei
 Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, Vignesh
 Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet
 <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, Robert Nelson
 <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20260114-thames-v2-0-e94a6636e050@tomeuvizoso.net>
 <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260114-thames-v2-2-e94a6636e050@tomeuvizoso.net>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|IA3PR10MB8323:EE_
X-MS-Office365-Filtering-Correlation-Id: 7093ad7f-5d98-4c27-6dd9-08de5396f971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|36860700013|34020700016|1800799024|376014|921020|12100799066;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm81cXhEYUFvV0V0T3BCSFgwMG5GalYvdFA5TVdRM2JzM2EycVBBclI5cHB6?=
 =?utf-8?B?MXpFWWQ0azRWcThUYXlwUXdvYnBEZDFFZTJ4UExBaWNRcTVHbHkyQlk4YjlM?=
 =?utf-8?B?YlFSYW0vbHh2NmRxREVXMmVhdmdESGlHOXNqNXYxdUFucGswSGFLOHl4QjVM?=
 =?utf-8?B?TVF2SnpPNktyTE9hT3piUFRYdDZRUG1BUGFyYlpDRkh5bC9sZi91cC9YaGpM?=
 =?utf-8?B?WGQzQmVPTmVJVkZCTU5SVG9wMFpHM1YwWDU5bDBWTzNaN0hBckRyRnRJeXlB?=
 =?utf-8?B?K1hud2FjWlFrUzgxRDQrUVUyakFOa1JXQkk4ZTg3aDI1eFFQT2dKZ3VIblpO?=
 =?utf-8?B?VHRSTkFORThuRGJBS21wYWRJdnBURktnZVkyUWJNL09WVWhieVB1MzgvOG44?=
 =?utf-8?B?MVhSaml3YUFaUVYwUTlBSm5lZU5GM1hTSUgrWmFxM0FrQ05KVDBHbEh0eG1t?=
 =?utf-8?B?Zk5WRDlnelRQZzZ4K01ieGFwN2crZHlwVjhYQmFvVEhmOGN1dUI5b0krUTF5?=
 =?utf-8?B?QUN3U3pXNUpLZGVGSUF6am9wRUNHdlpyTVdMcjdQbC9tMWdLL2RGd3VWbytl?=
 =?utf-8?B?R1FnZisxZFRMNFVZYUZJdkttczdDZXdUeERFQ1dPbkllZ0xoNDlDMWZJOFBC?=
 =?utf-8?B?MTdDNUNKajZzcjlUUmJ4RTNIeDV4NEFMMXA4Y1RiRnVjMlNhOVo5M1ZYZkpn?=
 =?utf-8?B?M1VmYTdpREtkVHgyMzhGaHcvcjJOSWtLcGMvSUtBUnBaV21RL3RkV3ptbk9I?=
 =?utf-8?B?KzBPMk1PTWg0YmhYUC80bk9GYTJ1SFQ0TnV6OEgvaE1YeWluTlhtNHIwQUZu?=
 =?utf-8?B?dklsY0luV3N1dFByalJMVnF1VXhsVGxEWWo0YjE3eHFrRnpoMzNwVUd0VVgv?=
 =?utf-8?B?NE9hTUpmem1qVDBpQ1pQZGo3QnhJSWFqZGZZRWk3WTk3SFNxM2FIZUM2SGVt?=
 =?utf-8?B?M3hTN29pQ3o3SDN0T2hkamExL25QbUsvYXJnOGwvNXlxSEdJeWxCUkFDWWx2?=
 =?utf-8?B?OFJmelZMQWtiQTdJQlZ5di9BWFNSNmV4VkpuVjlDNjRlQTZyM2xQYVg5dm1Q?=
 =?utf-8?B?YVV0ZFFqN1U2bDBLaktpcVJrL0kwQ21TMWt6UmxLSGtObm9mWTRoUDN6T1h1?=
 =?utf-8?B?b1hOaUx0aVkzM2FJaGJpVDM5SHRhV1lGczhTTzd6alR3WDBBcDRCTkwzRkFB?=
 =?utf-8?B?R3NSdGk0eHh5eFdpMmFpSmMvTk9DOURBRkxyVkt1c0VvR3RKZzZLSGttblBi?=
 =?utf-8?B?ZEtTYm80cm5uNFdMV3B4SXNrVjRvNlU3bVMrcFFkN2wrQWxKTDFkUnk5UnVq?=
 =?utf-8?B?cld5Wkh1WitSK25lb2FtL204SEVqMFNOTVJWeTB2T3Z3STZNRjN6dnoxRkpY?=
 =?utf-8?B?Rzc2bzkxbWFCRW1QS1dqZUxubllYSC9abzViekJBVGR5K2F6aTRjcTkrNkpX?=
 =?utf-8?B?NzNtNFBjZW0vWVdPeGxXYldFRUdTSWYwMTA4M3dxb1RxT3dnN1VBYUhKaGVw?=
 =?utf-8?B?d3h5WFJsc0luckxuU3F3cTRlc3ZzMnRFd0wxVlFkaEh5djBYa1dvczhodEsr?=
 =?utf-8?B?cVBhSUo2QVVmZ2hkbGtFN1VoaTVUUm4yVTAxbU1PVEUzWnpJSmZGQzNiaGlD?=
 =?utf-8?B?Y3BsSGdzOXU3c0pURUxhaGZ4dU9LOGZmaGlYRVo3Y0ptd1NTaFF5S3pia25R?=
 =?utf-8?B?aVAwUk5EN1pRVDl3YmUweDJBVTUweU04d0xsQ1E1YzcwL0FjUzdlSEtIek5E?=
 =?utf-8?B?d0dvTHIwak5ETlYxam5acXg0aXNidFV6K3FLOHZUYVdxMWk2TnVrSjB2MHpZ?=
 =?utf-8?B?L25RSHNwd2ZoV1FJcURtWHdHUW1sV251RHBzWFdwMjFLMGxQQkdtMy91eHZU?=
 =?utf-8?B?YS9hdDdqZUc4SEhZMStIWGFqM3FrSmRZaXBnS0pSbjk2Vit4YkJaT1czWVE3?=
 =?utf-8?B?cEw2SlBWbzViV2RXOXZocC8yeVZDaXllVFZFbjFJV2FodHMyVmhlYzdraWZQ?=
 =?utf-8?B?U0ZUbjRScFJjMUtnQXZic0hrL3ZiVlVIZFlQZkR0Z3E5K0FnUUVsc0Zqb2FO?=
 =?utf-8?B?NXVwZGZJdWczMWcwZEFsSUFsRG5MOS8xM1pYeHlscUJZd0lmVHhyNkNpYnc2?=
 =?utf-8?B?L0xTc3g1YlM5T0pXUi8xRGdyZnR3QmNVdWdaUW94VlBjRTFKTk9UTVVySnEr?=
 =?utf-8?Q?E5fVoL49n8Td/uiAHMicOck=3D?=
X-Forefront-Antispam-Report: CIP:198.47.23.195; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:lewvzet201.ext.ti.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(36860700013)(34020700016)(1800799024)(376014)(921020)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 18:01:42.7078 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7093ad7f-5d98-4c27-6dd9-08de5396f971
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.23.195];
 Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8323
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

On 1/14/26 2:46 AM, Tomeu Vizoso wrote:
> Some SoCs from Texas Instruments contain DSPs that can be used for
> general compute tasks.
> 
> This driver provides a drm/accel UABI to userspace for submitting jobs
> to the DSP cores and managing the input, output and intermediate memory.
> 
> Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
> ---
>   Documentation/accel/thames/index.rst |  28 +++++
>   MAINTAINERS                          |   9 ++
>   drivers/accel/Kconfig                |   1 +
>   drivers/accel/Makefile               |   3 +-
>   drivers/accel/thames/Kconfig         |  26 +++++
>   drivers/accel/thames/Makefile        |   9 ++
>   drivers/accel/thames/thames_core.c   | 155 ++++++++++++++++++++++++++
>   drivers/accel/thames/thames_core.h   |  53 +++++++++
>   drivers/accel/thames/thames_device.c |  93 ++++++++++++++++
>   drivers/accel/thames/thames_device.h |  46 ++++++++
>   drivers/accel/thames/thames_drv.c    | 155 ++++++++++++++++++++++++++
>   drivers/accel/thames/thames_drv.h    |  21 ++++
>   drivers/accel/thames/thames_ipc.h    | 204 +++++++++++++++++++++++++++++++++++
>   drivers/accel/thames/thames_rpmsg.c  | 155 ++++++++++++++++++++++++++
>   drivers/accel/thames/thames_rpmsg.h  |  27 +++++
>   15 files changed, 984 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/accel/thames/index.rst b/Documentation/accel/thames/index.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..ca8391031f226f7ef1dc210a356c86acbe126c6f
> --- /dev/null
> +++ b/Documentation/accel/thames/index.rst
> @@ -0,0 +1,28 @@
> +.. SPDX-License-Identifier: GPL-2.0-only
> +
> +============================================================
> + accel/thames Driver for the C7x DSPs from Texas Instruments
> +============================================================
> +
> +The accel/thames driver supports the C7x DSPs inside some Texas Instruments SoCs
> +such as the J722S. These can be used as accelerators for various workloads,
> +including machine learning inference.
> +
> +This driver controls the power state of the hardware via :doc:`remoteproc </staging/remoteproc>`
> +and communicates with the firmware running on the DSP via :doc:`rpmsg_virtio </staging/rpmsg_virtio>`.
> +The kernel driver itself allocates buffers, manages contexts, and submits jobs
> +to the DSP firmware. Buffers are mapped by the DSP itself using its MMU,
> +providing memory isolation among different clients.
> +
> +The source code for the firmware running on the DSP is available at:
> +https://gitlab.freedesktop.org/tomeu/thames_firmware/.
> +
> +Everything else is done in userspace, as a Gallium driver (also called thames)
> +that is part of the Mesa3D project: https://docs.mesa3d.org/teflon.html
> +
> +If there is more than one core that advertises the same rpmsg_virtio service
> +name, the driver will load balance jobs between them with drm-gpu-scheduler.
> +
> +Hardware currently supported:
> +
> +* J722S
> diff --git a/MAINTAINERS b/MAINTAINERS
> index dc731d37c8feeff25613c59fe9c929927dadaa7e..a3fc809c797269d0792dfe5202cc1b49f6ff57e9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7731,6 +7731,15 @@ F:	Documentation/devicetree/bindings/npu/rockchip,rk3588-rknn-core.yaml
>   F:	drivers/accel/rocket/
>   F:	include/uapi/drm/rocket_accel.h
>   
> +DRM ACCEL DRIVER FOR TI C7x DSPS
> +M:	Tomeu Vizoso <tomeu@tomeuvizoso.net>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Supported
> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
> +F:	Documentation/accel/thames/
> +F:	drivers/accel/thames/
> +F:	include/uapi/drm/thames_accel.h
> +
>   DRM COMPUTE ACCELERATORS DRIVERS AND FRAMEWORK
>   M:	Oded Gabbay <ogabbay@kernel.org>
>   L:	dri-devel@lists.freedesktop.org
> diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
> index bdf48ccafcf21b2fd685ec963e39e256196e6e17..cb49c71cd4e4a4220624f7041a75ba950a1a2ee1 100644
> --- a/drivers/accel/Kconfig
> +++ b/drivers/accel/Kconfig
> @@ -30,5 +30,6 @@ source "drivers/accel/habanalabs/Kconfig"
>   source "drivers/accel/ivpu/Kconfig"
>   source "drivers/accel/qaic/Kconfig"
>   source "drivers/accel/rocket/Kconfig"
> +source "drivers/accel/thames/Kconfig"
>   
>   endif
> diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
> index 1d3a7251b950f39e2ae600a2fc07a3ef7e41831e..8472989cbe22746f1e7292d2401fa0f7424a6c15 100644
> --- a/drivers/accel/Makefile
> +++ b/drivers/accel/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
>   obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
>   obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
>   obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
> -obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> \ No newline at end of file
> +obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
> +obj-$(CONFIG_DRM_ACCEL_THAMES)		+= thames/
> \ No newline at end of file
> diff --git a/drivers/accel/thames/Kconfig b/drivers/accel/thames/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..50e0b6ac2a16a942ba8463333991f5b0161b99ac
> --- /dev/null
> +++ b/drivers/accel/thames/Kconfig
> @@ -0,0 +1,26 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config DRM_ACCEL_THAMES
> +	tristate "Thames (support for TI C7x DSP accelerators)"
> +	depends on DRM_ACCEL
> +	depends on TI_K3_R5_REMOTEPROC || COMPILE_TEST

COMPILE_TEST part shouldn't be needed here, TI_K3_R5_REMOTEPROC can be built
under COMPILE_TEST so TI_K3_R5_REMOTEPROC would just be enabled to test.

> +	depends on RPMSG
> +	depends on MMU
> +	select DRM_SCHED
> +	select DRM_GEM_SHMEM_HELPER
> +	help
> +	  Choose this option if you have a Texas Instruments SoC that contains
> +	  C7x DSP cores that can be used as compute accelerators. This includes
> +	  SoCs such as the AM62A, J721E, J721S2, and J784S4.
> +
> +	  The C7x DSP cores can be used for general-purpose compute acceleration
> +	  and are exposed through the DRM accel subsystem.
> +
> +	  The interface exposed to userspace is described in
> +	  include/uapi/drm/thames_accel.h and is used by the Thames userspace
> +	  driver in Mesa3D.
> +
> +	  If unsure, say N.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called thames.
> diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..7ccd8204f0f5ea800f30e84b319f355be948109d
> --- /dev/null
> +++ b/drivers/accel/thames/Makefile
> @@ -0,0 +1,9 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_DRM_ACCEL_THAMES) := thames.o
> +
> +thames-y := \
> +	thames_core.o \
> +	thames_device.o \
> +	thames_drv.o \
> +	thames_rpmsg.o
> diff --git a/drivers/accel/thames/thames_core.c b/drivers/accel/thames/thames_core.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..92af1d68063116bcfa28a33960cbe829029fc1bf
> --- /dev/null
> +++ b/drivers/accel/thames/thames_core.c
> @@ -0,0 +1,155 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
> +
> +#include "linux/remoteproc.h"
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +#include <linux/completion.h>
> +#include <linux/jiffies.h>
> +#include <linux/rpmsg.h>
> +
> +#include "thames_core.h"
> +#include "thames_device.h"
> +#include "thames_rpmsg.h"
> +
> +/* Shift to convert bytes to megabytes (divide by 1048576) */
> +#define THAMES_BYTES_TO_MB_SHIFT 20

Seems unused/unneeded.

[...]

> +
> +static const struct rpmsg_device_id thames_rpmsg_id_table[] = { { .name = THAMES_SERVICE_NAME },
> +								{} };
> +

Some odd formatting here.

> +static struct rpmsg_driver thames_rpmsg_driver = {
> +	.drv = {
> +		.name = "thames",
> +		.owner = THIS_MODULE,

Above line shoulnd't be needed.

Andrew
