Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D97ABEFE02
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:17:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B8E10E26B;
	Mon, 20 Oct 2025 08:17:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Y7X5Csmr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Y7X5Csmr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010046.outbound.protection.outlook.com [52.101.84.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4FE899E9
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:17:38 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Dn4885MYghd/JoIZUDHjQDZnUxl0REKJrYTkKmrmkgIlhdoPBRjqrhfB1s2C17iWBvzmy49PlF5BO//3cRd0nyW+NyCbmy6wni86uaNEe65KI6TjOgYhH2EZ6ooV7r8iX+zGTXVUU68KkxI37UlWbpf2QnC5/4lgq+bMeTlgXqIJOCeQ1Q29g2glwSDnhS7KrGGWSSUNqb1K6tEQwBVOKC81CZBYpnFEXoq89e3GM9vxEIfn2S8t0f2Xttfe4oWeCnT1C699Fg944RKVkPBxqyYPg5TlD8H0NRaZPe3St3dYoImsvwsy4pFwkqiiwRquSnjpmByPBfuNPP+YlQ0R9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcFzyJeV0zMEFi7wKYEI1brywqqOunhBDmcwwumjMdA=;
 b=F0sEC0LScvU+S7ATGGXuiyFS57+9ImvNYNQ1MGBsSuwbzrrsQWpzySRzxUr2nFIjcAm6sLeCcn+Oo9C7c3POzmWuS4fiXBL80MezmVnuhk2aFLEYFyXmSzs0b3AJOf7zp3LHtHaJcn6nc602m1S8pmn9kOzkDjMnylUUY63Mq0VkD6Q0kXP/NgBJTOQwMl4Mv+xn7bYMevaeYU2zzLisBs2MhyaJPlJs3PvcU66lyC4HvFeOlcXlea3Sg5ZaW4dhnznIBnWhm8S6bME6JleF0Tpv5pVXXCN6BzTT5P7THbjw+pRMipj9G7lfIP5QulVrFE8McGhU2BpldRbK7k70eA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcFzyJeV0zMEFi7wKYEI1brywqqOunhBDmcwwumjMdA=;
 b=Y7X5Csmr+1N0239TxUudsCxVZjP3/4GdRHjzvTCGgi1ZmIKKowxcBfqK3TG4kHrmDDrKBgKIVBLCEdD080tWm9IkrorIRKEFE+at77jBX+ps1HBU9oZc9cxj/wjEHlvof1S0zSpeEAGYyhoZvotuSLaK9HwXR0NXS/juoiTThFE=
Received: from DU7P195CA0013.EURP195.PROD.OUTLOOK.COM (2603:10a6:10:54d::8) by
 DU2PR08MB10016.eurprd08.prod.outlook.com (2603:10a6:10:49e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 08:17:33 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:54d:cafe::f9) by DU7P195CA0013.outlook.office365.com
 (2603:10a6:10:54d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 08:17:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 08:17:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPsTG48mLFsGReFjNajor0+KnWOWqii9/H7sHqVNWzr1X4vQc42fua0koHDsaCQ3J5J1lQPZtUYvb+rmTs4itIzuZeuepnB5xl8tHSgrxPqC2cu7/HYpZZHjKj1rRLtWlR3ZGRw7LqUNB3b5MY4Vx6PgzQOnQk+uuaA9CcMJI6mYWKG27fYpuTbtUVmu+OCjIW+hXsooIjn7t7K8Eqd2lLPscHsZ9jvA1ci1eU0HTUi7R+Ra8J56QK/l0fvczaIW2N4a8rCjIG6VINZCRaOClanKbb/kmHeHsvN3E+OxKyIE/QJhlBYOKaH9Jos1F6XtmYi/TcZIrp0JSZh4auGwYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RcFzyJeV0zMEFi7wKYEI1brywqqOunhBDmcwwumjMdA=;
 b=IxY43k8aakBCMwu0efAmURyMirf1IYP7Q+d86c1qrnkZ1tOYbUQuXm2Mc2H7ReMZI7dIVTxcHRCsnPfGzPMTQX5ynVvZISTpKSQGwFCfqutkCYqSn+2yEHhF0wR0oELIQxgKMuDJhRxs5REBypAsSMxRS3x+as7afHWLoDI1bbDm7nHfa7XLr27iN7GXbzHN66Oqx/CFYBks3rukteb6ZSs1DfU9hy9YU7Mxfi8EL6r4FO/IQaLXX1kiDOVOWvV0Ozp/br2jntvrDyiztymczi/K3tfXX4xedMPJhOrZzuVDvw7jvWHCiSo54PkgHDkQD7LDg0jeCE6Lu5w79kzJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RcFzyJeV0zMEFi7wKYEI1brywqqOunhBDmcwwumjMdA=;
 b=Y7X5Csmr+1N0239TxUudsCxVZjP3/4GdRHjzvTCGgi1ZmIKKowxcBfqK3TG4kHrmDDrKBgKIVBLCEdD080tWm9IkrorIRKEFE+at77jBX+ps1HBU9oZc9cxj/wjEHlvof1S0zSpeEAGYyhoZvotuSLaK9HwXR0NXS/juoiTThFE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AM9PR08MB5905.eurprd08.prod.outlook.com
 (2603:10a6:20b:282::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 08:16:59 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9228.015; Mon, 20 Oct 2025
 08:16:58 +0000
Message-ID: <6ee4b717-6c7e-4114-9130-0b2daccb3d3a@arm.com>
Date: Mon, 20 Oct 2025 09:16:55 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/5] drm/panthor: call into devfreq for current
 frequency
Content-Language: en-GB
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org, nd@arm.com
References: <20251017-mt8196-gpufreq-v8-0-98fc1cc566a1@collabora.com>
 <20251017-mt8196-gpufreq-v8-3-98fc1cc566a1@collabora.com>
From: Karunika Choo <karunika.choo@arm.com>
In-Reply-To: <20251017-mt8196-gpufreq-v8-3-98fc1cc566a1@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0282.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::17) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AM9PR08MB5905:EE_|DB5PEPF00014B90:EE_|DU2PR08MB10016:EE_
X-MS-Office365-Filtering-Correlation-Id: 386fc4a6-8940-42ff-85ce-08de0fb11e1f
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?d2hlMU5RblA5amZQblJVRW5hdkt1WjZXMEZCc0lmaXJicmQycSsrN2ZIdk1W?=
 =?utf-8?B?TmtxdSt5azF6NUNLTlFwcUlhVGdoU0RHL0kwOVVId1BMS1BRcjhvV3pEZ2Nz?=
 =?utf-8?B?d2YxRmJaRkwwSHhPOUkwYmV6UHRvY1p3S2ZUd1Rka1VhT0xHTVpKL3ZYNnRa?=
 =?utf-8?B?T1B6cnFZSFY2Z0hRam9LWHVQRlNKZllXK2VtK09TQUxtVjdNOHhDeitrMTJB?=
 =?utf-8?B?WVFXQm1kcDROOWVoMGdQYkVoWDhIM2piYkxlWHkrcDN2VUlwQ1ByTjAyN2k3?=
 =?utf-8?B?YjNQQlAyUVlOTit0cVl2WGlUNWY1amtvL1gvcDZHanhGY1N5K0kxdmFCTU5F?=
 =?utf-8?B?aG1LeVdrTnBpT3U2N2tXOG9NK0VSS0pzV29uSU1RUzZmaUxhTU9yKzU3YlJJ?=
 =?utf-8?B?UGhMcmQyNXlwamZxVG9ydy9sbjZvZlNObnBrRXVpWWZUd1A3Yk1iRUVkWjVn?=
 =?utf-8?B?SGpRektrT0c5WjgydXBxcHkzdjhueVluNjVhdU42b045NkhuT1VPcTVIS3Ft?=
 =?utf-8?B?bWk5cC80a0JlbFJlc3R6elBuL3I5dkx2c3p1S2pnMUR5QmdMc0RzYm5CRjlG?=
 =?utf-8?B?cXA5Y1ZBQVZ6eHJaZkttV2lyMmUzL0pEQXozZ2N3aTRDbHNkeFpyZUZsV1ZR?=
 =?utf-8?B?d3pjejZGTmdNZTVKR2RwclI4dkR6TE1KaVVFbFlrYkpzaS8zQlJpTGRlbTVH?=
 =?utf-8?B?L1NjNytSc0pDb0RneUphTGhaclVnckd3aFkvRndxalJGKzhFQ3NPSTRSd3Vo?=
 =?utf-8?B?bDBHTm03U3p2ZVhzWHo0YmZMZGpwSHlTaDBQVGxmTm5FVk9ZNzM0TUhpRnpG?=
 =?utf-8?B?R3pIcWYzcjhDNS9GelIvRmNQblV1aS94UU1iUUpPQTF4eU9zNkNQMG9aaHJj?=
 =?utf-8?B?QTJJcDJ1QmV3YWhMYXBZVm1wTE9vMmNWYXpycHdxMmozZVdrbEJPbk1GcnNR?=
 =?utf-8?B?UTA5c1hxbURMQmllTTk1bjc0bVJrbXJJTU9NSUo2NXVXUmNyWHd3ckhQcDBL?=
 =?utf-8?B?WHJpL1IwTkZQdWh6QXViWm9BNVZja211MSsvay9WMm9IQVhJTXhiTjhhZG9Y?=
 =?utf-8?B?UmdoakxiMWpZY3ZvQkY5VTFLU05MRXppMkJNbTM2MTNudm10NmJjYWZwTEVo?=
 =?utf-8?B?enJRY2hGWDVnV1hvajFzVWZaZnB1QlN3MHhsbUdNbU9HaXpoY3V6RUxPc0x3?=
 =?utf-8?B?Q0k2QXRLR05HMzNkSDZHelpqTXc5eFlTd1Yzd2c5VHN3UlcxSFFja1ZydFQz?=
 =?utf-8?B?di83MkRDWVY2ZDhMSXhCLyt2NXR3cmdHQXV6K01lT1ZFTmFjc1FraWIvMlpw?=
 =?utf-8?B?SUtuL0NKeVUyOGF6SFozVFBoUkp0dHJ5SDFDYTFvU1lIOFFxM3kxbG1nZ3ZL?=
 =?utf-8?B?ZHhReDJIcm5KT3FidUJPbmtUbDNHSFVFcmlYTmRKbzlMbllyR1lPOE9PYVlZ?=
 =?utf-8?B?NjRwV2JxRjVPb3JlNHRLNmYxMlRxUUoyTE1pRTM2VTZMQjdRUExralpuWUVS?=
 =?utf-8?B?aWhXWFhxY25tN21CYnc0NG8rTG5UVFNIdUNYeFRjNDVBSU43MUxJWCtyYklC?=
 =?utf-8?B?V3I5VlBqbEhTd1ltYXcveUFQc0ZrQ0dsQ3AxSHhRUXNEWUNtcVpkaGlBK1FK?=
 =?utf-8?B?b2gvS1FwVlM3R0R4ZHJrTy85VC9RRENPd0tVVFJLYnhIYlR6RWpsQW4zVjdJ?=
 =?utf-8?B?YWpSWjBhT09TTHFNNXk2WUgrMHR5MzUxSURabmF6V0dDajllQ05McGN6bFQ5?=
 =?utf-8?B?eDlOcXI1VnZlTnNOMkJjcUprYTF5b1VOQnAvK1FURmJWaG5mNXpXRjBod2JY?=
 =?utf-8?B?UzB6NVR4RjRUc2greUMxSGxMb28yVHkvS2Q0Q2lVc3ptNWZBQ1NRbXI3eFZH?=
 =?utf-8?B?aWhlQit3UFE0azAzaHdjV3lhOGhHM2RMbGNzOWFGeS9LQ3g2NGtrcFpJOUVO?=
 =?utf-8?B?TTBlZjRYdUhaOVB5VEpJeThOdVpkTDRYNHdOOHE4RlNiYXVaU1lsbU5CVlJk?=
 =?utf-8?Q?1GHOSZLm+VeFU2mvMN9sZIlxcjPdjg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB5905
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cf66e658-096b-473a-0eb4-08de0fb1098f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|35042699022|1800799024|7416014|82310400026|376014|14060799003|921020|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a2FPcW4vNEZtckpTaXB0RUl3ck55ZFVhbDlaUFpJTlB5aUJ6c1d5MDEwTm04?=
 =?utf-8?B?c3lDMU1PMDBmckpxaERDek1NRWV1ZGdYaHJ1ZW90Zk8vdm1DYU9nOTZhNjE4?=
 =?utf-8?B?M0htbDc3dG1hYTVJZkpDZ3NzZkY4bGd0L3VsWWowTC9Edk9zZGp6bkNmOFgr?=
 =?utf-8?B?RG5UcUlYank1WEhIdGVITlV5YzFUL0tMNUN0cE5pSzhyMTlvVWpRVU5aYlRT?=
 =?utf-8?B?K1VObTdla3N2UGcwdnJYb3hWZk9tWUVUWnVldlZYcTBNZ24zcjlPcTVzNVJT?=
 =?utf-8?B?ZmV4aCt1WG5MOFhnSW9SMkg4c0sxTy83L3R6R3VyWFhZWDhrMk5UMWdHUWcv?=
 =?utf-8?B?SlNuaVB3VlZjdURyWTVhOVJXU2tRQnFhUzBiWmQwaEVRM3djSXZ2V2NtZE42?=
 =?utf-8?B?dlZJNDZHTG1qcGhINmJVdGtDb2MxREJtYis0TzhweXgrTzZWQjh2V3R0V3Bi?=
 =?utf-8?B?dndld3phYmRRL2lIdjNTdTl0QVNkMGdhZUhvQVBUWHRaRHFKaFN6TDBKL05S?=
 =?utf-8?B?bGlSVnIrc0VkU0VJOVhHR0E1Yk9Pejl4Lzk2amVXcWlrendNV080d1c4aUk5?=
 =?utf-8?B?U3NScUQ2K3d4L2ZhN1F1MVlrSGxzb05venpJUmNDQnJ6dUVoL29qN2dJeEZm?=
 =?utf-8?B?N1N2MTJ2UjBWbWxBeWNQTXZpYzNMVnBpNkR1OGxjdlpvU2N4enFDR1JUWGVB?=
 =?utf-8?B?ajVqUXY1Wi9xTEJRZDBZRjEza0NxMDVEN2V5UHNzVTMvV1lLd1pxY25BK29V?=
 =?utf-8?B?cy91a1JtYzJnUEtzbHZZLytBNUxRM0JZWGlVTWFXaDJxS05BV2NwcGlRdlQy?=
 =?utf-8?B?RGZxZ2RlTlRSZkVOSkNsdnhOejhrSVhKUnpTKzd6WUtJcy83L0tNclZPc1dY?=
 =?utf-8?B?dHprdkJKaWc5OVYwcysraUVwYUZaU0ljTkVyRytMb1UzZlFzNFZnK0w5bUY1?=
 =?utf-8?B?bHBzaTdJekJ4K0gvbXhwd2ZlQjhNcjc2aVI1NVlBR0N4TFpRanBWRGhka0RE?=
 =?utf-8?B?VUtrSGZRTTd6Yi9JeXpoYjdONTFrS05ITldWVlhSb0R3cG1UTWkwcXZLc2Ev?=
 =?utf-8?B?Q1huR1BtVzV1S3poYTVzWW5Cem1jbVdXZ0RDNW1YNCtLOVdIQUNITmxSdlVw?=
 =?utf-8?B?UVlDQ3pFeDlWemhTdnArYWdGVTUwSzJGaTFEMjRGR3ZhOGNsUTVKMi94KzY2?=
 =?utf-8?B?ZWtKbWpKOXVoVnNRSmEvV2tMUHBrclUwdjBPNnlMeGlSc3dnVU4xS1kwYmFy?=
 =?utf-8?B?a1UzKzV1L0QrNEdkN3JwajR1VkhKNkNYdU9IV2ptcjhFMlk1YmhyWUI5RWhX?=
 =?utf-8?B?QnY2NjA4eElCa2c1aENwcWZ1elNxbHpXWDdXcU5XODdKK3hkd0U4Tkh5amh1?=
 =?utf-8?B?ZVVSd3JQOXZ4RDlDbmY1Q20vVENXdkdGMExOZGVOWjRMaENtazJVY084ZU9o?=
 =?utf-8?B?dnJ6a2JSNU55Z0d6Y2N6MlBKa0IyUlRHcE0xMnhkZ0hidTRZbmwwVkFZSEtr?=
 =?utf-8?B?ZGxISlZ3WXZTbVJHMnlCQUF5b1MrV3k1UDBmdndjeVB0elNwMGcrZ2EzdGlj?=
 =?utf-8?B?MCtOTGdKczJwc3NJWU5mNmdGS0YwR2lIT0Mrbk9KV1NWTFZYTEplYW5PSVVG?=
 =?utf-8?B?MjdhUlZ4dEZyUkhPZVFqK3FhL3dlUFM3T2REclN3ZFFBOThZTlBXeXBUUXBy?=
 =?utf-8?B?aFFhWEsyczJFRXY2andhT1cya0FQOFd2YmR1QmxkT01raEw2WUR1b2JOdzlP?=
 =?utf-8?B?QTR0bG5FZXNyai90cWFNcnlNOWwxOXNNYllWY3JnNGJGWkxyN1VSbFJmOGpL?=
 =?utf-8?B?Z2tReThJcllqR2RFamxRTGhobG1qUTMyS2pydnk1ODJoMXBMUlZFcnNsbXhJ?=
 =?utf-8?B?M2hoaWxoMjdpOUQzeFp4MHJ4MFF3YTdLRUI2d0VlVGk3ejdzMmNxa1FuU0Uw?=
 =?utf-8?B?Z0tKaENnMGx5MTFtRkN0eGwvdHhnbVEwZisvcXlnWXlXL25zRkhDZnozR1Vj?=
 =?utf-8?B?TThEM21GR21mWDRoaHNibGlLNEFTVFdqb1ZlZkd1c1NOaXNhOFpxN282UVNZ?=
 =?utf-8?B?d2ZPMVlCWTRydDd6SFFRQTB2UzlOWXZidUc0RGtKQXlHSC9iYklOSnRpSVQ1?=
 =?utf-8?Q?n7c0bHQTiF7yrp7pn0tHNDHUU?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(35042699022)(1800799024)(7416014)(82310400026)(376014)(14060799003)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:17:32.1111 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 386fc4a6-8940-42ff-85ce-08de0fb11e1f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB10016
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

On 17/10/2025 16:31, Nicolas Frattaroli wrote:
> As it stands, panthor keeps a cached current frequency value for when it
> wants to retrieve it. This doesn't work well for when things might
> switch frequency without panthor's knowledge.
> 
> Instead, implement the get_cur_freq operation, and expose it through a
> helper function to the rest of panthor.
> 
> Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
> Reviewed-by: Steven Price <steven.price@arm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_devfreq.c | 30 ++++++++++++++++++++++++++----
>  drivers/gpu/drm/panthor/panthor_devfreq.h |  2 ++
>  drivers/gpu/drm/panthor/panthor_device.h  |  3 ---
>  drivers/gpu/drm/panthor/panthor_drv.c     |  4 +++-
>  4 files changed, 31 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.c b/drivers/gpu/drm/panthor/panthor_devfreq.c
> index 2df1d76d84a0..a6dca599f0a5 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.c
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.c
> @@ -62,7 +62,6 @@ static void panthor_devfreq_update_utilization(struct panthor_devfreq *pdevfreq)
>  static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
>  				  u32 flags)
>  {
> -	struct panthor_device *ptdev = dev_get_drvdata(dev);
>  	struct dev_pm_opp *opp;
>  	int err;
>  
> @@ -72,8 +71,6 @@ static int panthor_devfreq_target(struct device *dev, unsigned long *freq,
>  	dev_pm_opp_put(opp);
>  
>  	err = dev_pm_opp_set_rate(dev, *freq);
> -	if (!err)
> -		ptdev->current_frequency = *freq;
>  
>  	return err;
>  }
> @@ -115,11 +112,21 @@ static int panthor_devfreq_get_dev_status(struct device *dev,
>  	return 0;
>  }
>  
> +static int panthor_devfreq_get_cur_freq(struct device *dev, unsigned long *freq)
> +{
> +	struct panthor_device *ptdev = dev_get_drvdata(dev);
> +
> +	*freq = clk_get_rate(ptdev->clks.core);
> +
> +	return 0;
> +}
> +
>  static struct devfreq_dev_profile panthor_devfreq_profile = {
>  	.timer = DEVFREQ_TIMER_DELAYED,
>  	.polling_ms = 50, /* ~3 frames */
>  	.target = panthor_devfreq_target,
>  	.get_dev_status = panthor_devfreq_get_dev_status,
> +	.get_cur_freq = panthor_devfreq_get_cur_freq,
>  };
>  
>  int panthor_devfreq_init(struct panthor_device *ptdev)
> @@ -197,7 +204,6 @@ int panthor_devfreq_init(struct panthor_device *ptdev)
>  		return PTR_ERR(opp);
>  
>  	panthor_devfreq_profile.initial_freq = cur_freq;
> -	ptdev->current_frequency = cur_freq;
>  
>  	/*
>  	 * Set the recommend OPP this will enable and configure the regulator
> @@ -295,3 +301,19 @@ void panthor_devfreq_record_idle(struct panthor_device *ptdev)
>  
>  	spin_unlock_irqrestore(&pdevfreq->lock, irqflags);
>  }
> +
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev)
> +{
> +	struct panthor_devfreq *pdevfreq = ptdev->devfreq;
> +	unsigned long freq = 0;
> +	int ret;
> +
> +	if (!pdevfreq->devfreq)
> +		return 0;
> +
> +	ret = pdevfreq->devfreq->profile->get_cur_freq(ptdev->base.dev, &freq);
> +	if (ret)
> +		return 0;
> +
> +	return freq;
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_devfreq.h b/drivers/gpu/drm/panthor/panthor_devfreq.h
> index b7631de695f7..f8e29e02f66c 100644
> --- a/drivers/gpu/drm/panthor/panthor_devfreq.h
> +++ b/drivers/gpu/drm/panthor/panthor_devfreq.h
> @@ -18,4 +18,6 @@ void panthor_devfreq_suspend(struct panthor_device *ptdev);
>  void panthor_devfreq_record_busy(struct panthor_device *ptdev);
>  void panthor_devfreq_record_idle(struct panthor_device *ptdev);
>  
> +unsigned long panthor_devfreq_get_freq(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_DEVFREQ_H__ */
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 9f0649ecfc4f..f32c1868bf6d 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -214,9 +214,6 @@ struct panthor_device {
>  	/** @profile_mask: User-set profiling flags for job accounting. */
>  	u32 profile_mask;
>  
> -	/** @current_frequency: Device clock frequency at present. Set by DVFS*/
> -	unsigned long current_frequency;
> -
>  	/** @fast_rate: Maximum device clock frequency. Set by DVFS */
>  	unsigned long fast_rate;
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index fb4b293f17f0..75898d83a207 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -25,6 +25,7 @@
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panthor_drm.h>
>  
> +#include "panthor_devfreq.h"
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
>  #include "panthor_gem.h"
> @@ -1519,7 +1520,8 @@ static void panthor_gpu_show_fdinfo(struct panthor_device *ptdev,
>  		drm_printf(p, "drm-cycles-panthor:\t%llu\n", pfile->stats.cycles);
>  
>  	drm_printf(p, "drm-maxfreq-panthor:\t%lu Hz\n", ptdev->fast_rate);
> -	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n", ptdev->current_frequency);
> +	drm_printf(p, "drm-curfreq-panthor:\t%lu Hz\n",
> +		   panthor_devfreq_get_freq(ptdev));
>  }
>  
>  static void panthor_show_internal_memory_stats(struct drm_printer *p, struct drm_file *file)
> 

Reviewed-by: Karunika Choo <karunika.choo@arm.com>

