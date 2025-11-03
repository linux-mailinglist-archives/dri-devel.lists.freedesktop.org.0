Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A922FC2D358
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 17:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A401C10E443;
	Mon,  3 Nov 2025 16:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="L7rd0ZRE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="L7rd0ZRE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazon11012033.outbound.protection.outlook.com [52.101.66.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A497B10E442;
 Mon,  3 Nov 2025 16:43:54 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MYl8w1QJxYpo+wy77jzsqOF0Kf151ldBLmClxHHT4+P4FLUhpNaS0TZXXvEtKx+SrXfLA6rurXhzsVbXbj+2Pc7jLaWpSCoVuNob8y468SMxMA1hBpVfbKjmUutmRTs5c5ngEd+5ZJyA9j3AZhUtUbnTbWRb15jkY8sDqpHjeQExZ9a1FcrZLHrzn0WE/Xr6O6f8Hn3m1FN2LJVB8vEfgASMOoqQ/xOx2yT/6b1BlwOXQSm/ft3HTHzCSDEtJwJwWx0XRQBw2aZOzb4WFhj8K8HUps18MkZalATFG9sDRSqIrUVBut0POL07plCUD0mSHzyOmixvr6zPQrsBosK+ng==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9O00e15dq/XMv9m/FMscuuICGCfrssRJIPCkLhbYFA=;
 b=lUXej3BZdfO+5+epSlv8Nssq8DPqc7vqVu2csoU5NF0L7+0Hxk8tOYRuzz61umQn8T9tkQot7yq9nbScUlmfSNgnJzAnt3LY6fju0UiYqNW+GgRnQGrB5MT+lveJpMgpH6dfccs4paChuM5vVZQ5sk7MbviP8rIEQoE56XHe2g5Vm0N4ooYZq8X1so5QFqFBZo+kBY5I7X2E/Ag9VmwYw83ZPzX1saxO0o/MgNZxcK16qfd9+74BbpU4Wts6LJGd3E+meDqnD1THaEtbbCMzrIq9mFilx56KJZXtC4geUJxYNlpq+NmXY67p7AuMIhRJBiBf8RYS+5yjnfddvj1gIg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9O00e15dq/XMv9m/FMscuuICGCfrssRJIPCkLhbYFA=;
 b=L7rd0ZRE5CzSNi5nFAZ48EO+quUbZ4ryVeLW+Zj1QN+IbOaf1MVP9GghbBkSjqvLMkVZiS9oB7S5bJ0yO+v+qZZoQ9T9nXkjQK+kdODGZMlP3C3VPqUKlPbOwy3stYWshrycBcSL2jxMWcuyGOvxOWtlrjnUz960PZRAPi+evtw=
Received: from AM0PR05CA0084.eurprd05.prod.outlook.com (2603:10a6:208:136::24)
 by AS4PR08MB7925.eurprd08.prod.outlook.com (2603:10a6:20b:574::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 16:43:51 +0000
Received: from AM1PEPF000252DC.eurprd07.prod.outlook.com
 (2603:10a6:208:136:cafe::bf) by AM0PR05CA0084.outlook.office365.com
 (2603:10a6:208:136::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Mon,
 3 Nov 2025 16:43:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252DC.mail.protection.outlook.com (10.167.16.54) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.6
 via Frontend Transport; Mon, 3 Nov 2025 16:43:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVEP/FJ8+MunExVR/rAE/nv7lyoyJIvML42R0Bi7XYf4rfL9SeqAA1/D7Tr2TX0zWSzLcjclQQGaqsLW5zBie1EfSzNpMTaE6E2NgofxMSQXKrTPSltsF52nqwiVK1b75l+zdrelI74hyC8aWtb462GGT5lyVj+ATz4euukQ5LGiqexAFUscNnWxGo23eRjv8AD5BwKJ3+LX3QOla3jLuGIFop7HeEQ3T6fwmB/rx6aVvI84GwFKkb12go1/AgqMRPKso2+x+gN6GHW3P8ke5WvvkmR0+SSmuS0YGyb2r81m0PwTcNNT4cbnMfRp5cUJloAPLrFk+G3sDTGfx0RPZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T9O00e15dq/XMv9m/FMscuuICGCfrssRJIPCkLhbYFA=;
 b=priZr3qCcWYBeF3yiaUy70/qM0pAjxzLRnty1TDSe7HA8M+Q5CJYJkK1Qs1S4yq16Gd1r+pMaKF5QryxCokAFdiUVBZvN5BUFGvFZWFBQM8GoD9kMeReMZlNeJQccaNQKNsoj+xUwqYOJ92KKY9lrxbiAJwPP9qo38TDh99Q2fMkrylOMHU/Gg7GSzq743vhMgx3J67e+4QGR3ym6d6JD0zg7Xx879XbfKFNfH4UKDd6bmIdYoA5CzilRfGJsmv6YwWrjElK4SycXi0/64TJhhA2KE0F0SqtzNJZofT+5rMArNj1s+E1GToEpltA4tQww4oPqFEPuhLtl+duGokG7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T9O00e15dq/XMv9m/FMscuuICGCfrssRJIPCkLhbYFA=;
 b=L7rd0ZRE5CzSNi5nFAZ48EO+quUbZ4ryVeLW+Zj1QN+IbOaf1MVP9GghbBkSjqvLMkVZiS9oB7S5bJ0yO+v+qZZoQ9T9nXkjQK+kdODGZMlP3C3VPqUKlPbOwy3stYWshrycBcSL2jxMWcuyGOvxOWtlrjnUz960PZRAPi+evtw=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAWPR08MB9760.eurprd08.prod.outlook.com (2603:10a6:102:2ea::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 16:43:15 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 16:43:15 +0000
Message-ID: <d4695588-9371-4a75-9521-6d4cfc173608@arm.com>
Date: Mon, 3 Nov 2025 16:43:12 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/16] drm/panthor: Add flag to map GEM object
 Write-Back Cacheable
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, =?UTF-8?Q?Lo=C3=AFc_Molinari?=
 <loic.molinari@collabora.com>, kernel@collabora.com
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
 <20251030140525.366636-10-boris.brezillon@collabora.com>
Content-Language: en-US
From: Akash Goel <akash.goel@arm.com>
In-Reply-To: <20251030140525.366636-10-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAWPR08MB9760:EE_|AM1PEPF000252DC:EE_|AS4PR08MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 66294786-5d3f-4b33-6e84-08de1af82a26
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?aG8rQmtpelVqYzBVNmtyZk1NTk5uRmNqajMxYmZkTUxpNDFDTDY4ejV2R2V5?=
 =?utf-8?B?ckxDM1JVKzRyWVVYUXpMT1pqUUJpV0tRNW03RGY4UDhFc2JWYVNDaXNjV0hk?=
 =?utf-8?B?djVjRTR4RXJFRkdZczMvUUhUNWpwSzdlSTJJNnlrNm5DQmMzMHhqSk5KU2dI?=
 =?utf-8?B?WWJLOVVjZ3NRL21aRGxGOGhBeDR6MEJqaXpNbjJRRnlVODJRUnFoTVlLKy8z?=
 =?utf-8?B?UzFpTHZoOXBtS21xa0xzN09PZTg0enh1OXZQdlNCSVBlbnplRHM1VkkzL2VB?=
 =?utf-8?B?dG1aVVNUWGVUT3E1czArKzhyeGRyU3RPU0tNejBERW1Ca2NtK0lZVTJ6N3JX?=
 =?utf-8?B?L1NnVzQyUjJvaVBTeW05NDlDakd5Sng4ZUpmcUhSaGszL2FqRVdTWUI1dE10?=
 =?utf-8?B?OXozMFdwZWhXNFdtU0JKeVdMQTRpNDFWbFNXc05hQ2xMazMzRjNGcE9WOCtF?=
 =?utf-8?B?eEg2QTl6MkRYa0ZzclZpQzh0RzcrOXRnMEc1QjdLejkxNlI1LzZtRlhRZkZC?=
 =?utf-8?B?T1QyN3h6RUhTb2xVZU1EOHJNQkNxem54Q25kZEYyblBtZzY2L2tTWFdRM2Np?=
 =?utf-8?B?K29jR3N5aTVpWXpVM2ZXcG83eEpFUXFQTWtrZ3ZBa0dlN09NTjNkanpKc21Q?=
 =?utf-8?B?dnN3T3YrWGdlbm9hM1VibkYxbnFXb2tod0FMTWUrWFozU3pDbnJKL0NESjNZ?=
 =?utf-8?B?Q3lwQXZmRjlBV0N5Q05mcDV2amN1Zngzcm9oc2lTaFh2ODQ0RUZxaWlrMmIw?=
 =?utf-8?B?Tk1mUS9EdUdzRjNGT3NETDdtdWQ1d2FqZGlNUXRKNDBBTXNSZUw5VHhLK2tB?=
 =?utf-8?B?OTNQeFBZWExpVHp0cHBJanBHbWJsd2xnQjNVYXIxT0pxbU1PMEFHOEVIK3ZB?=
 =?utf-8?B?VlZ2b09iTC8yMjNrbWhaa3JSYW5BL01LaTJ6N0lYTTVRQk5kVFY4Y2ZUTWd2?=
 =?utf-8?B?blh3Q0xIY2ZUR0tIdWszZUxGeTB0QlZwZmRoTWdacHNYVm1Od0hXaXF1V0hX?=
 =?utf-8?B?UHJRUGN2QTE3WFVJbzFxRzBJUjNpMW5VS2cxN1FKNS82eUNsa2c0dk13Ynhw?=
 =?utf-8?B?WnNjeFpPdjBpS2FNdjdONzNQWldOMkhLSjVQWVBseU9WRWt3RW43dk9iOUtu?=
 =?utf-8?B?ZjJObm9pWmJucFRTRzkxbGFqSXNFNGlneFpQTWhzWHc3SUdDemdld3dWcSto?=
 =?utf-8?B?WU40bm5sMlQ1eENZR1F5cjBsN2FPNGhSaGZBODhIdjdhTTRQSTFjb25BSDE1?=
 =?utf-8?B?amVQd3lkSlVnb2QrcjRqeng4UHVKNWg2TVFJZDhWeCtiU3RTRE9VTGUrTGtC?=
 =?utf-8?B?dVdVMWhUZ2JZbFN1Q1BaYU1hV2l2dUNydEswVHpYQVZhVW40TTh4MXhqWDNO?=
 =?utf-8?B?TEwwUHZ6MEk3ZGk3VmlzMGl4V2VuZmx1dnZWRzlsZnpEZkdsSXJyUlZ5Q0lq?=
 =?utf-8?B?OHJKL2ZCWWw3TmIxMmlaNWVEMlNIRm1hcFBkNzh5NzhhNnl3UStDZE1YOERJ?=
 =?utf-8?B?ekV6TmowRlNzbHJNc294OVpvZUk5RXh1THMwcHQ5dXViMFpUWjNmQUpML3Zx?=
 =?utf-8?B?Z0FjSnN6eUR6TzJGbUJtRC9MNnpZYUpQajVZTkpkNGRXR2F0UXM0RWM1UFMv?=
 =?utf-8?B?RWgybG0vc2ljYmdRbW4vbzJsWkgySVVoL29HZnlNaUorTWswUjg2VTNvKzZD?=
 =?utf-8?B?V3ZSQ0tMOWI1cUpYaXNjQXNtUlBkS2JqQit2U3hvdk9QSW9GVE1Qb1U3Ujk5?=
 =?utf-8?B?aHlTYVc2enh6TytNQ3VPczE1VWRYd3N3Z1VxbmhEeVVoSGpjSnV4R2E0YTBT?=
 =?utf-8?B?aXZ6N1l5V2txUVNaeXk0NXk4NXlvYnh2QXJMOVk3ZDZSYXRvaGUycmIxbUlD?=
 =?utf-8?B?MWRoN2kxcHAybERXd04wK2tXRGxyeFpVMUduLzBoMUJzZUVScVoyckVlMkpn?=
 =?utf-8?Q?TrhaNzFkKJd641WaxXpvOgFXSQWrxOro?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9760
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: cd39a9b6-1930-48c2-32a4-08de1af8158d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|14060799003|36860700013|7416014|82310400026|35042699022|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wk1seXpsNzUyNFBhNnZZSmFHYlBhb21ON2NjUWtzSmhXaVhkUzhtN0tLYi9S?=
 =?utf-8?B?dng1b0hxR0lualdObHEyek0yam0rT1NlazlBeUozakFCVys0TjB6bFZpSmpo?=
 =?utf-8?B?Q1k1VExrekg3WTJVR21SbXR4aGI5UnlmSS9ZTllFVHN3RTQzVFZ5ZUMwU0ty?=
 =?utf-8?B?Z2NNaHN0Z3FQYnRHckJ1T0tBb1I4UjFFazBjNk5VckJYYnJGRjE4bWpOK2tZ?=
 =?utf-8?B?azRPZzh1eStUV3hFQm1hVThHNWE1N3A5UERsVXdGVGdzL3FwWDlYNVdpQmhl?=
 =?utf-8?B?OHlFVmVTTDVqQ2g3cXBva2NRZ3dKZXUzZ0VXZHc4SGl6clZ5UCtseWNNREV6?=
 =?utf-8?B?SThoZEs2OUcvWGhVQ3QxRHhZbHNqcFNLMnEwRG43R0pIZ1lVZ2QzR1IzSjBJ?=
 =?utf-8?B?STAyS0ZBT29sV01vWWlsYnpaME1XMkZrb3l2ODA2NmROZVhkcjVrMGhXVWlC?=
 =?utf-8?B?WXo3TGFtYW5penNhVW8rRVYyS1k5M3NwVkdqUTJHRCt3MTFYTW8vTVJHTVQ2?=
 =?utf-8?B?ZWdWa3hDMnJ4Rld6NjhBN0R2RkJTSkpROFBlZDJCNEFkV09ra2NXL0VDbDFs?=
 =?utf-8?B?QWl2eWQwT0N5bzA2RGNVUWZVRkdZb1Zwbm42eG9GS1g4NHRKcTh4THRPMytV?=
 =?utf-8?B?UnlGWjZUWjl3WmM5M0Jyd2NCWi9MSmNHU3IxbU95T200Qnl3RXg5NVNzLzZo?=
 =?utf-8?B?ME8wTHloZ3B4OGJIRlFkT0JlcURPWTg2YlpiY0pOWEhtdU1sdHdwVmQxcElt?=
 =?utf-8?B?WjRWSFc2cHp0ckhSTWloQkNHN0dSUUZHSHM3NGpvU3Vkdm14QmcvL2VxOCsy?=
 =?utf-8?B?a3d5WGtiMUNXd1lXWVFMRTZia1BEbEVFUVVaZjdZOE15T1V4NzN1UFFFVzdJ?=
 =?utf-8?B?cys4ZDRQeHdHbXJuUGJRNGV5MDhsSTNoQXJkZGlaSUp3VjJSYmhqeXpMK25k?=
 =?utf-8?B?R0ppakpNbDA1by9IWmpoL2RBZ0V0SFFNbTNtZjZjV09wTEEzbWFzUlBGV0tU?=
 =?utf-8?B?UGtUbEkzV3NnZjJYanFsd1NxOXVNeFVYYmJqcFJncGtqdkNVQ1E4MFR2Mk5h?=
 =?utf-8?B?WWxKODUxMWRCc1JqUmpiQ0V3MHBFWXcvWlExSG4wcHl5TWlscS9vYllTbEVm?=
 =?utf-8?B?VGNUZERjS0V3ZDZKZkdtNTl3S3FWaHVoWUF4S1k5MVBTS2ZwMWlXRlN2allk?=
 =?utf-8?B?ZnRoUjFtVEsweVoxUWZmS3Zib3hHYTRUd3VlUlpYRmpRT21Xd2E3VXVOZk9r?=
 =?utf-8?B?Ymxna01SWURyYkJVTG9ZOTFWbWtDUTB4OTIrZ0xwRW9LREkrdXJQRlRKYlFP?=
 =?utf-8?B?SjhkeHQ5eTh4WE96MXdnWDJVQSt4alNpbUVXMVBiR2crbUpYc1VNWDdDZVFX?=
 =?utf-8?B?ZnNscElyYnNqZWM2NUJacGlmM3I3OVVacEVUdmVCK0ZjYWlKdFdyN1h3LzBq?=
 =?utf-8?B?enVvZDQyQzZmRFQreC9OYUkrSmZ6a2F3blRSbEN1cncydzNGbmdlcFd0bjRV?=
 =?utf-8?B?MG9JSjBBZDdBTVhhUWdyL3FhM1NsRis3UGZCZVJqdFhsM1R3MHo2NjZsRDVS?=
 =?utf-8?B?RTJOdkxGMXUzNWtwZGNwZTRRWjg2Tjd0Umx1YWtjLzlidkltd0l3NGtOTmJo?=
 =?utf-8?B?aWdYanFoTXdkdHVZNFRyanZjbFVnMnNLeHQvV3Q2Y2JyM2ZuajBOMmYza2pE?=
 =?utf-8?B?djhVNWxZcmZvNGJuQmJhN2tmNzl5WHdCM3BsTWhuTU9icUo4bnRqaGhCUGxh?=
 =?utf-8?B?dmtZREZLSlAxMnkvMGh3ampubENqSzhkem5rMGdhSmdTR29NOExKcWVod2lW?=
 =?utf-8?B?TmxlMUR3Tkk0NWpsZWlIL1owSW9JY05nMVdqSWNybGZ3bkE2emJkZHdSYkhL?=
 =?utf-8?B?aG91VmFCODRRVmI3TVJxYVVVSXRQbHR4bktiTVQyZVZFanZxMzZwczVSVHF4?=
 =?utf-8?B?c0NtNVdQblp1WmNaR2tOYlBQb21qYzVTVkk1RlRFeEZIV2hZSk9tV1FFb3Er?=
 =?utf-8?B?OFNpK0c2REMrQkJaTStDZEZlOFQvRnhtVUM4ZHBUc1Z6WnRaTVpORlBMSVhm?=
 =?utf-8?B?eDhhbTJTNXNabDhKKzZ3dlc2TG1DcmpLNGpyaWkzY2RRaERIK2szU0d2UjFD?=
 =?utf-8?Q?qqfk=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(14060799003)(36860700013)(7416014)(82310400026)(35042699022)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 16:43:49.3519 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66294786-5d3f-4b33-6e84-08de1af82a26
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252DC.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7925
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



On 10/30/25 14:05, Boris Brezillon wrote:
> From: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
>
> Will be used by the UMD to optimize CPU accesses to buffers
> that are frequently read by the CPU, or on which the access
> pattern makes non-cacheable mappings inefficient.
>
> Mapping buffers CPU-cached implies taking care of the CPU
> cache maintenance in the UMD, unless the GPU is IO coherent.
>
> v2:
> - Add more to the commit message
> - Tweak the doc
> - Make sure we sync the section of the BO pointing to the CS
>    syncobj before we read its seqno
>
> v3:
> - Fix formatting/spelling issues
>
> v4:
> - Add Steve's R-b
>
> v5:
> - Drop Steve's R-b (changes in the ioctl semantics requiring
>    new review)
>
> Signed-off-by: Lo=C3=AFc Molinari <loic.molinari@collabora.com>
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>   drivers/gpu/drm/panthor/panthor_drv.c   |  7 ++++-
>   drivers/gpu/drm/panthor/panthor_gem.c   | 37 +++++++++++++++++++++++--
>   drivers/gpu/drm/panthor/panthor_sched.c | 18 ++++++++++--
>   include/uapi/drm/panthor_drm.h          | 12 ++++++++
>   4 files changed, 69 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pant=
hor/panthor_drv.c
> index c07fc5dcd4a1..4e915f5ef3fa 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -900,7 +900,8 @@ static int panthor_ioctl_vm_destroy(struct drm_device=
 *ddev, void *data,
>       return panthor_vm_pool_destroy_vm(pfile->vms, args->id);
>   }
>
> -#define PANTHOR_BO_FLAGS             DRM_PANTHOR_BO_NO_MMAP
> +#define PANTHOR_BO_FLAGS             (DRM_PANTHOR_BO_NO_MMAP | \
> +                                      DRM_PANTHOR_BO_WB_MMAP)
>
>   static int panthor_ioctl_bo_create(struct drm_device *ddev, void *data,
>                                  struct drm_file *file)
> @@ -919,6 +920,10 @@ static int panthor_ioctl_bo_create(struct drm_device=
 *ddev, void *data,
>               goto out_dev_exit;
>       }
>
> +     if ((args->flags & DRM_PANTHOR_BO_NO_MMAP) &&
> +         (args->flags & DRM_PANTHOR_BO_WB_MMAP))
> +             return -EINVAL;
> +
>       if (args->exclusive_vm_id) {
>               vm =3D panthor_vm_pool_get_vm(pfile->vms, args->exclusive_v=
m_id);
>               if (!vm) {
> diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/pant=
hor/panthor_gem.c
> index 1b1e98c61b8c..479a779ee59d 100644
> --- a/drivers/gpu/drm/panthor/panthor_gem.c
> +++ b/drivers/gpu/drm/panthor/panthor_gem.c
> @@ -58,6 +58,39 @@ static void panthor_gem_debugfs_set_usage_flags(struct=
 panthor_gem_object *bo, u
>   static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) =
{}
>   #endif
>
> +static bool
> +should_map_wc(struct panthor_gem_object *bo, struct panthor_vm *exclusiv=
e_vm)
> +{
> +     struct panthor_device *ptdev =3D container_of(bo->base.base.dev, st=
ruct panthor_device, base);
> +
> +     /* We can't do uncached mappings if the device is coherent,
> +      * because the zeroing done by the shmem layer at page allocation
> +      * time happens on a cached mapping which isn't CPU-flushed (at lea=
st
> +      * not on Arm64 where the flush is deferred to PTE setup time, and
> +      * only done conditionally based on the mapping permissions). We ca=
n't
> +      * rely on dma_map_sgtable()/dma_sync_sgtable_for_xxx() either to f=
lush
> +      * those, because they are NOPed if dma_dev_coherent() returns true=
.
> +      *
> +      * FIXME: Note that this problem is going to pop up again when we
> +      * decide to support mapping buffers with the NO_MMAP flag as
> +      * non-shareable (AKA buffers accessed only by the GPU), because we
> +      * need the same CPU flush to happen after page allocation, otherwi=
se
> +      * there's a risk of data leak or late corruption caused by a dirty
> +      * cacheline being evicted. At this point we'll need a way to force
> +      * CPU cache maintenance regardless of whether the device is cohere=
nt
> +      * or not.
> +      */
> +     if (ptdev->coherent)
> +             return false;
> +
> +     /* Cached mappings are explicitly requested, so no write-combine. *=
/
> +     if (bo->flags & DRM_PANTHOR_BO_WB_MMAP)
> +             return false;
> +
> +     /* The default is write-combine. */
> +     return true;
> +}
> +
>   static void panthor_gem_free_object(struct drm_gem_object *obj)
>   {
>       struct panthor_gem_object *bo =3D to_panthor_bo(obj);
> @@ -152,6 +185,7 @@ panthor_kernel_bo_create(struct panthor_device *ptdev=
, struct panthor_vm *vm,
>       bo =3D to_panthor_bo(&obj->base);
>       kbo->obj =3D &obj->base;
>       bo->flags =3D bo_flags;
> +     bo->base.map_wc =3D should_map_wc(bo, vm);
>
>       if (vm =3D=3D panthor_fw_vm(ptdev))
>               debug_flags |=3D PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
> @@ -255,7 +289,6 @@ static const struct drm_gem_object_funcs panthor_gem_=
funcs =3D {
>    */
>   struct drm_gem_object *panthor_gem_create_object(struct drm_device *dde=
v, size_t size)
>   {
> -     struct panthor_device *ptdev =3D container_of(ddev, struct panthor_=
device, base);
>       struct panthor_gem_object *obj;
>
>       obj =3D kzalloc(sizeof(*obj), GFP_KERNEL);
> @@ -263,7 +296,6 @@ struct drm_gem_object *panthor_gem_create_object(stru=
ct drm_device *ddev, size_t
>               return ERR_PTR(-ENOMEM);
>
>       obj->base.base.funcs =3D &panthor_gem_funcs;
> -     obj->base.map_wc =3D !ptdev->coherent;
>       mutex_init(&obj->label.lock);
>
>       panthor_gem_debugfs_bo_init(obj);
> @@ -298,6 +330,7 @@ panthor_gem_create_with_handle(struct drm_file *file,
>
>       bo =3D to_panthor_bo(&shmem->base);
>       bo->flags =3D flags;
> +     bo->base.map_wc =3D should_map_wc(bo, exclusive_vm);
>
>       if (exclusive_vm) {
>               bo->exclusive_vm_root_gem =3D panthor_vm_root_gem(exclusive=
_vm);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/pa=
nthor/panthor_sched.c
> index f5e01cb16cfc..7d5da5717de2 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -868,8 +868,11 @@ panthor_queue_get_syncwait_obj(struct panthor_group =
*group, struct panthor_queue
>       struct iosys_map map;
>       int ret;
>
> -     if (queue->syncwait.kmap)
> -             return queue->syncwait.kmap + queue->syncwait.offset;
> +     if (queue->syncwait.kmap) {
> +             bo =3D container_of(queue->syncwait.obj,
> +                               struct panthor_gem_object, base.base);
> +             goto out_sync;
> +     }
>
>       bo =3D panthor_vm_get_bo_for_va(group->vm,
>                                     queue->syncwait.gpu_va,
> @@ -886,6 +889,17 @@ panthor_queue_get_syncwait_obj(struct panthor_group =
*group, struct panthor_queue
>       if (drm_WARN_ON(&ptdev->base, !queue->syncwait.kmap))
>               goto err_put_syncwait_obj;
>
> +out_sync:
> +     /* Make sure the CPU caches are invalidated before the seqno is rea=
d.
> +      * drm_gem_shmem_sync() is a NOP if map_wc=3Dfalse, so no need to c=
heck

Sorry nitpick.

IIUC, drm_gem_shmem_sync() would be a NOP if 'map_wc' is true.



> +      * it here.
> +      */
> +     drm_gem_shmem_sync(&bo->base, queue->syncwait.offset,
> +                        queue->syncwait.sync64 ?
> +                                sizeof(struct panthor_syncobj_64b) :
> +                                sizeof(struct panthor_syncobj_32b),
> +                        DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDAT=
E);
> +
>       return queue->syncwait.kmap + queue->syncwait.offset;
>
>   err_put_syncwait_obj:
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_dr=
m.h
> index 7eec9f922183..57e2f5ffa03c 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -681,6 +681,18 @@ struct drm_panthor_vm_get_state {
>   enum drm_panthor_bo_flags {
>       /** @DRM_PANTHOR_BO_NO_MMAP: The buffer object will never be CPU-ma=
pped in userspace. */
>       DRM_PANTHOR_BO_NO_MMAP =3D (1 << 0),
> +
> +     /**
> +      * @DRM_PANTHOR_BO_WB_MMAP: Force "Write-Back Cacheable" CPU mappin=
g.
> +      *
> +      * CPU map the buffer object in userspace by forcing the "Write-Bac=
k
> +      * Cacheable" cacheability attribute. The mapping otherwise uses th=
e
> +      * "Non-Cacheable" attribute if the GPU is not IO coherent.
> +      *
> +      * Can't be set if exclusive_vm_id=3D0 (only private BOs can be map=
ped
> +      * cacheable).

Sorry Boris, I may have misinterpreted the code.

As per the comment, DRM_PANTHOR_BO_WB_MMAP flag should be rejected if
'exclusive_vm' is NULL. But I don't see any check for 'exclusive_vm'
pointer inside should_map_wc().

Please can you clarify.

Best regards
Akash


> +      */
> +     DRM_PANTHOR_BO_WB_MMAP =3D (1 << 1),
>   };
>
>   /**
IMPORTANT NOTICE: The contents of this email and any attachments are confid=
ential and may also be privileged. If you are not the intended recipient, p=
lease notify the sender immediately and do not disclose the contents to any=
 other person, use it for any purpose, or store or copy the information in =
any medium. Thank you.
