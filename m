Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E8ABBD7DB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD6610E3CB;
	Mon,  6 Oct 2025 09:47:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="FJ5nxxkM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FJ5nxxkM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011069.outbound.protection.outlook.com [52.101.65.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD27610E22E
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Oct 2025 09:47:36 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WSaW2S9S5ZTzELb6Q5jpBmc7jb5ohDW99mFJBq8OEiQstTI/Lh5mjRIdVLL/H+Yqg8ZBAQxN/ca3Y0vD0GGPeMJvBgcjCFu9yoQJqBm92oo0Ec8Sbq44ZAMdJI40nE/I47ByGGut/xTll+I1OFtMi82909mNrmMw9ZjYHj2DEGVvGjZX7KhduYFSLPNmvOyQZaFYk2aUTBT7ytDiX/sTPU3EfIwZaj3Cuu5EyoAd4LfCEHcukvhWt+Y6IKxivBJJ+Xc7GBdgV9NxwxTVoMrCqDHilUZ6HUQ6AHYx8347hoJnyHcB8hNCqI1E2SAhWGeHN1vpHh/ATn1x7cW/UDxjWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S807ihU5cW17ixJjdLgyX8f/OkrRzW0w1C8yFh54lY=;
 b=mp/EI63NQlaUTThoqZU4WML/pH34CMYZtSPQhE8eDKO+R9mS7meaDyQXOAlur0LncgS8O5zpNqyd5698jbB/3aFuYyMvzSFu3gm6whGH8YLl5yYNhKeC46e7MQP0uT4sfonR2Qscz0SmPrURI+ewtf4tGCuIN2hgGaE7W4xqZl6PWgFn1Dj6YYvtfZhIHaioxBuK71d6sTUF+FZZ9sWi5fpoqTX1yfyl5MhRf8aSPiXEJ3Thbnzv5Jqr7jjpILoQkJowkXlxQeojNItP20QBQD8T1arpZu7OaTdtWSSdm76Q2ZfZCkcID6wvqK2s6c9rvIvE4YQBdMSbY7+gu3qusA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S807ihU5cW17ixJjdLgyX8f/OkrRzW0w1C8yFh54lY=;
 b=FJ5nxxkMgCg6DOrp36/XCJWZfZomImciirUDAs/30ngLo51BzWjJZ9gxh/4hdfKkKREEePNMc1SWyc1Rrxi7g3x5XqW5bgIf3bRBr2x9Df4EAziqrzMR6ndTvN97acwgdXUUykHcYKalt0GqDyF3zYll8uX7qgpkkUD24bkNjxo=
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by AM8PR08MB5796.eurprd08.prod.outlook.com (2603:10a6:20b:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:47:28 +0000
Received: from DB3PEPF0000885B.eurprd02.prod.outlook.com
 (2603:10a6:10:1db:cafe::4b) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Mon,
 6 Oct 2025 09:47:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885B.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.9
 via Frontend Transport; Mon, 6 Oct 2025 09:47:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxZ58zHJBgi7Fwz6cpZT2wRrfbAc/MBg+wwuM/NPgB0JJOB623Fl6Uc9qEWEwwq4TaAd/nJ082a+MalSDDDMLmGPHp9/+1MlR59njxr5BjMQxjyG/al9NfxpIXzviUdw84qmXCDpRrzWkXb2BG43zfGOQkuJJo5iC6eF50RkWEW1I92aq+up2jj0lmqWLF47EqkErtopIBmnD9uRm5Gcrca7Lh0UOCwyLtaNmVzLn9TDbJlhKHXD/daJFpuNux2KIEz7K+gkYc+YvkFN+A3+pYXNN1USE+9ygz0X8u7Tulu1Yk34+B2xuU+S3xPaY1m1Hxn7nTlBXxQIt9l/JFi7YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8S807ihU5cW17ixJjdLgyX8f/OkrRzW0w1C8yFh54lY=;
 b=lr8N9ePcsApKWiqlSVSGS67gGA5w9710hd5n0sjEPx1LWKmDNONWqjop0fSsywexpgD0cpFpz+dub7+AFs+BipH6zZzi/ZovWNYXGesYH4/k5yd/agbKBEsIvBK66v3mqbCB/BDl6GRmlZRGSOW47vxhyIVEu+5i+BOUUcXniibobDkuNhLjOEHicMTyggz3d+Z7QjOtu9rBdI31rv1QC1K28f1CtUz1rRL73Cv5tOkhXTVerUdd0cdKgSt3xYYmKC8y5kddDDfkSbZDxDQoMPgNuSz7EQJdZ6Y97M3+qfW6OpP8+1EDSU5QnMGBPIhPY03pO00blHm8s05MrTwD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8S807ihU5cW17ixJjdLgyX8f/OkrRzW0w1C8yFh54lY=;
 b=FJ5nxxkMgCg6DOrp36/XCJWZfZomImciirUDAs/30ngLo51BzWjJZ9gxh/4hdfKkKREEePNMc1SWyc1Rrxi7g3x5XqW5bgIf3bRBr2x9Df4EAziqrzMR6ndTvN97acwgdXUUykHcYKalt0GqDyF3zYll8uX7qgpkkUD24bkNjxo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com (2603:10a6:10:416::17)
 by AS8PR08MB8970.eurprd08.prod.outlook.com (2603:10a6:20b:5b3::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 09:46:49 +0000
Received: from DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1]) by DU0PR08MB10359.eurprd08.prod.outlook.com
 ([fe80::d10b:a33:84b5:cbd1%6]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 09:46:48 +0000
Date: Mon, 6 Oct 2025 11:46:44 +0200
From: Marcin =?utf-8?Q?=C5=9Alusarz?= <marcin.slusarz@arm.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, nd@arm.com,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: Re: [PATCH] drm/panthor: add query for calibrated timstamp info
Message-ID: <aOOQBHX7sKrqx7Sv@e129842.arm.com>
References: <20250916200751.3999354-1-olvaffe@gmail.com>
 <aNUF6IDneKxjTP5t@e129842.arm.com>
 <CAPaKu7Qo1N4iw+JAd-Kcq0GdAw6u0F83iwPjH-u1u406yxAQTA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPaKu7Qo1N4iw+JAd-Kcq0GdAw6u0F83iwPjH-u1u406yxAQTA@mail.gmail.com>
X-ClientProxiedBy: LO2P265CA0166.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::34) To DU0PR08MB10359.eurprd08.prod.outlook.com
 (2603:10a6:10:416::17)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: DU0PR08MB10359:EE_|AS8PR08MB8970:EE_|DB3PEPF0000885B:EE_|AM8PR08MB5796:EE_
X-MS-Office365-Filtering-Correlation-Id: dc63d214-0b61-486d-6971-08de04bd5c83
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info-Original: =?utf-8?B?bjA4UGhxNzk3MDM3NkhDV3VZYmJSbVdEQXloR0RJLy9RWUJOK0lOaW9lNDlh?=
 =?utf-8?B?azNzT3VoVlorcnI5dEJDSWZ4emlLK0IzVys4WmNrcy9yQldjN3VBdVVuS3pj?=
 =?utf-8?B?NFFRMWJoVU52c3k1QkVhQnlCc1J3dDMwcFlNeWxzdFZ5cUNCak95UkJrNWdB?=
 =?utf-8?B?ZlA0YWQ0Z1hSQURQSTFhTEtDeUFYR2xiZG5oZi9ndmMvSXYwTk1yYWRPRENG?=
 =?utf-8?B?V0hjbXhKeU1xbTU4WjJucVY1U1Q4MlR1S3BtWCtFWFJPL04vRjRaTTNUZ3R2?=
 =?utf-8?B?d0c5YnhuaENSeWlEQU5abXJFcW81WjNnVUxicm5wall5RVFMZURkTlBMaTlp?=
 =?utf-8?B?emQ1L3pMLzlQZlZBYU1XNS9hcmhjdzcySEdFbnNFNXRMLy9PeXV6Y25WREdv?=
 =?utf-8?B?S2xXWGM0eWNzalNFZUhHUWJJV0Z0WFdJQW8ySnNIb25ra2JpZVJaYnpzdXA2?=
 =?utf-8?B?N0hRa3ZrYTZBRmhlWG9vNmJESytHQ1RkMk1ZalRVMklRYXhNQkRkeTJKeDJR?=
 =?utf-8?B?eE1pMXdDdW1IRS9GRUlmdGxSREFWcFlWL041dnBWbW50N1c0MjNlbmJPbWVa?=
 =?utf-8?B?MzE1bDE2WVBIL3RKTlV1YjBOZE56TnhTY2NHem9adENoR3N0RjV3NnVpR3pt?=
 =?utf-8?B?ZWdYVmt6K3RDSzRGUS9BMUE3REJWZTZveTdWbnh5YVE3aytrOUE3WWhIcVBT?=
 =?utf-8?B?QU1Tb1dEZGpHN0pzM3BibkhjYlMxb3FkOFdONTFEdmlVMlh6OFZKclptVldB?=
 =?utf-8?B?aHQwdEM0WkZhUEF0MmVyb1RSejJtcDE2Q1RJcjY1dTVVTTRLQlFlVlpEU2tB?=
 =?utf-8?B?UUh3RkRvMmVaTG9LQ1A0bEtSRHB6L1J6M29vYmNhSk5DN2NWREc0emxNSEtp?=
 =?utf-8?B?U0RGUkNJSkhzb3VBQUg5MS8xSVdhaHVZaE1lSDhCM3VmMkFhNGdxQklQUFVO?=
 =?utf-8?B?MVNuOGRJeERWK0FkL1VIR2xISVRrN3FtSDBWUUpmS2RTb2tEOWd5enEvUERP?=
 =?utf-8?B?ZWVDd0FjTmluSW5vWkZlNWlxaVJsOE1YdnM5M0N5dFRNQXZ4d0pZczNKYitS?=
 =?utf-8?B?ZHJ5YTdyM00vUmhMbHhrc0lWdnQ2dnZoM3YwOVJrd01YZldvdHZnYW5NT215?=
 =?utf-8?B?aXVscm9hMCtzRTlnOUY4N1JYOWR0NzB5bU9oV0Q2YW5yUUl2bGRxakF5bXVm?=
 =?utf-8?B?S3BNd0JIbjI5UHpkbE9ZWXR4azdCWXBuWFQ5SjBvTHhxeFJaZjVraHFUdjFL?=
 =?utf-8?B?NUJUWjNwLzVBM2RRYkFPQnNXeGpQdTlBTGU1T3VJN1FaQmxEeUF4V0k3UVhP?=
 =?utf-8?B?WjByRngrRDF2V3p1OTY3SERuM1F1VUpETmhnY3NHd0lmdlNKRnFzZllmQito?=
 =?utf-8?B?RzBFbTJ0ZzZ1eVVxdE1Fd3JiRTRERnBGZjRxQnEyYUtBTFc0bUpqMlVlYTBv?=
 =?utf-8?B?d0dGcG9Dc1FlZ3FDak5RNTVzTVhFMHgxWU10NktNUlNDSHFrMnNBajV2d2o3?=
 =?utf-8?B?a2tXdXZmN3d2VmE1ZTl6NFJmZldweDNQMWo0dUxhMzhQS0FwN2haRFdRK3RY?=
 =?utf-8?B?TjNHa3pLNm1jdHRQTlgzdXE1RHB0VFlXcWhjTWFxYjUrS2RVR055YUx1TmI3?=
 =?utf-8?B?bHZQdnM4M0pNOFI1TFRlanFsREk0d3hYR2JUUUlQOVdVcXg2T0VPOFhiV3ly?=
 =?utf-8?B?YUZsTytxZmJhRWM0MkdSVFU3ajNUUjBkYWR4UEdMU1NQRy9vK2lNdTlMYnhZ?=
 =?utf-8?B?NnZPQTkxWUIrS1VhckpjVENMREcybXdHMjlQUWk1SkFKcEdWSUxXSytlVm1L?=
 =?utf-8?B?UEdVcVMzVzRIL3pRbnBSVW85Ym1RcEczTVdBVktKR2xFMkJ2eFBwY0R6TFZD?=
 =?utf-8?B?YktTR3V1Z1pOdzVWTVFoSTM2SUpKL211UzlWTERuV1BqVUY5dVNPbnltTFBQ?=
 =?utf-8?Q?KHUajiWDAQvfGJZQg5/Lx7mHcDFxUvy7?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DU0PR08MB10359.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8970
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3bb85583-9ff7-46bd-045f-08de04bd44e1
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|376014|7416014|1800799024|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkZQZWFQSTg1L0FnQmRyWHMycTlGWFNLRnFwR3pJTTNEeUgyM3lzV0k4a21j?=
 =?utf-8?B?N3pzcEs3MzJBWUxDSHpIckhDNTV5M3FwWVI1dTdPYjlyTDlRb3hLT0g5OENt?=
 =?utf-8?B?UEJTOFZ2Tm1qcUJNTlM5Rk1vVEFUZ2xLYmJaNGNZY1JUejFKVERjNnhEOVdr?=
 =?utf-8?B?am5ZT3czSlU2bkxQZ2ViU0FzRFQ3RWJkb2dNZHhneitLZkFCTW10N2tROWd3?=
 =?utf-8?B?aU5ZeWxwNG1ZeTFITHVYRmhJZk9FcndFemVvbVo1NFFTaGFkRUNJVS9PZ0dm?=
 =?utf-8?B?SmxXRjgveG9aT2wyRWkvZHRFS3VNalBweFl0NWV6WlljbU4rdHl1VWJudzRH?=
 =?utf-8?B?NkNuUnVqc1hNK2ltY0xXSjNNd0piZENkeUV0N0pqSEgxNWNkSmhZTmVtNUtO?=
 =?utf-8?B?V2NjT2JVZ2t6c2lKR0tvTHVwaUpyZkltMzJSbTlnU1psNHlzalFVMGFUc1Jn?=
 =?utf-8?B?SjZ1L2V2bGdTTWQrUndncnhCZlFUUkJiVU9sczZsbjI1emQvTnhhdUVLMWll?=
 =?utf-8?B?YzdCN21HaXNhRTVJV3hkdmpCVWFIVG40Z3RvdCt4M2hVQW5Dait1ZWNMcmQ2?=
 =?utf-8?B?RVozVUV3cmFjWEFGeGVKK3RrZFd3dzBaYzNzL3JFNHpwTmtOMGtjZTNta0RY?=
 =?utf-8?B?UXZDZHN2Q3ZOZ01ldTZtUHo3T3VJczRPTGtCbHVHMk1oME9sRm56dndwQ2Q3?=
 =?utf-8?B?RkZJai81aTNwdGdVTlVmU3FJQmMxa1RBQmd3VWpJSFRGaFZWY1BkRmxuQ2RH?=
 =?utf-8?B?TW9DK2FhZnJQMDY4cHh5d3Y0emY3MHh0TTRuODJyUUc5cUVDMDA5U1dYbldq?=
 =?utf-8?B?dWlYRmw5OHBQM1lQTEdmQWt2eW96QXBLNEhsTnVPZ010bTlhYUl0S2dwUWs5?=
 =?utf-8?B?K1ZWYnMxeCszQjl0U1piaXhSdTZmeUVyalVuK3I1VzBkVU9Na2ZpWFRPMnVZ?=
 =?utf-8?B?dlFPTkNkdWdxeGJuMEphaWhsdlBNMHFId25tS3ZNUFVQTFMzZjdRK05vL01C?=
 =?utf-8?B?Z0NzQ0lzOUF0RFZWK3VjV1ArSWVudWk2V2hDZkpJbDdBNzdmLzFjY3VFS1Bu?=
 =?utf-8?B?a2ZnL2h4MnpvMDJjUERTU1Z1b0ZlT3huN29mVFhkMTdWVXVVbk5UZW00bXFL?=
 =?utf-8?B?c043bEpRNXFMQ29xa29PNVhRaFdnczc4UTh3RHJlOFNrcTVVOVRrUlFkb3pu?=
 =?utf-8?B?Q0hMRTlLZnMyTzFCamlLZjJsOG16MjNMeTBTeEFlc0tzTDh0WmkrYmM1NE4x?=
 =?utf-8?B?SFhpUklKc1M1RldNQTVJVSt1TVgxbVR2WkVWUW5XSU9uMGJuWlFHU3ZkelN2?=
 =?utf-8?B?ZE9MUHVESG0xeXFYSU1mbzlKR1dGczE0ZmxwU013YzJMeUtqZGt0NDZxVTBt?=
 =?utf-8?B?TnRkbWplOFB1V01tWU5sM2krK3E2QjU2VDRGRzhOQTM0dkVJZVcveWZTTnJq?=
 =?utf-8?B?NjEzRWFZUXBwN0RQZHlobE14ZDkvaldGU3lzaVNLcVVZcGpnS0pVdlJlL05Q?=
 =?utf-8?B?SGtlcUp0OVVQQmlqZ2pXbCs2ODBhN1dSR09tOFZTREswRVlJNnNYWXRxOVVO?=
 =?utf-8?B?SDNGQWR2ejFGdG9MWk1ERExiMk41S0RsUitXNEwrelU5RHhkdnJsc29CRnAv?=
 =?utf-8?B?WHhvL3BacU5SNXdOMldRRlVzZXpOWGY2NmFBdkYvdC9Yb1g1bXlza1NyREFB?=
 =?utf-8?B?VTlZZklaTnRSQU5RQkxpcWFOd1ZHUkwvWlNneTRYblZVNmQwWjhqRlRoVDlk?=
 =?utf-8?B?dEJhT1U4YTR1OTd5UGRJUlNRSUZZdXdMQnNWbTROdFl2OFNudGJYa1Q1ZVNM?=
 =?utf-8?B?b1JUZVFSR2Y1WWl4KzZLeHlYclNnOWpXMUlrM1UycW40WDhIeVlCVWIwc2Ru?=
 =?utf-8?B?MEtpWVhKV3Z2M004TURiTFltZVVwWml4NEtETmRHUmJlTkFjQzRCaE43T1Qr?=
 =?utf-8?B?YW5VM2FtRnY2ZWdRWHlIZld1MWpvb3FCUUZaT0VqUThNSVF5dzhodjJoeENz?=
 =?utf-8?B?WVl1cERxNTI2VU9qdVFZQVVlNTNWUUJTdy9SajRMcmdCam83ODRKTzROeG4w?=
 =?utf-8?B?QjA3Znp3K3N4UkpJMGFZK3MrTFExN1Y0UGR1dWk0dEt0K1YyWnRlSmIvS2V1?=
 =?utf-8?Q?4MdU=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(376014)(7416014)(1800799024)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 09:47:27.9514 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc63d214-0b61-486d-6971-08de04bd5c83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5796
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

On Thu, Oct 02, 2025 at 06:10:11PM -0700, Chia-I Wu wrote:
> On Thu, Sep 25, 2025 at 2:06 AM Marcin Ślusarz <marcin.slusarz@arm.com> wrote:
> ...
> > Backward compatibility was achieved by adding new fields at the end of
> > struct drm_panthor_timestamp_info, and relying on the fact that if user
> > space passes smaller object it will be silently truncated.
> I chose a new query because userspace does not zero-initialize
> drm_panthor_timestamp_info. We will get garbage if we add an input
> field to the struct.

Kernel knows the size of the struct that userspace passed, so to hit
this user space would have to use the new header with the old code,
which AFAIK isn't possible because mesa imports Panthor UAPI header.
So either we'll get old struct with small size, or new struct with new
size and all fields properly initialized.

> 
> But this is a non-issue if we agree to do it this way, and make sure
> userspace zero-initialize before it updates the uapi header.
> 
> >
> > Obtaining all kind of timing information with a single syscall might
> > be a bit too much, when user space might be interested only in some
> > data and not the complete view, so I'd propose this as a solution:
> >
> > 1) Extend existing query in backward compatible manner, by adding new
> > fields at the end.
> > 2) Add flags, cpu timestamp, cycle count, and duration.
> > 3) Flags would be:
> > DRM_PANTHOR_TIMESTAMP_GPU (1<<0)
> > DRM_PANTHOR_TIMESTAMP_CPU (1<<1)
> > DRM_PANTHOR_TIMESTAMP_OFFSET (1<<2)
> > DRM_PANTHOR_TIMESTAMP_FREQ (1<<3)
> > DRM_PANTHOR_TIMESTAMP_DURATION (1<<4)
> > DRM_PANTHOR_TIMESTAMP_SAME_TIME (1<<5)
> >
> > DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC (0<<8)
> > DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW (1<<8)
> > DRM_PANTHOR_TIMESTAMP_CPU_REALTIME (2<<8)
> > DRM_PANTHOR_TIMESTAMP_CPU_BOOTTIME (3<<8)
> > DRM_PANTHOR_TIMESTAMP_CPU_TAI (4<<8)
> >
> > and DRM_PANTHOR_TIMESTAMP_CPU_TYPE_MASK would be (7<<8).
> >
> > If flags is 0 it would become
> > (DRM_PANTHOR_TIMESTAMP_GPU |
> >  DRM_PANTHOR_TIMESTAMP_OFFSET |
> >  DRM_PANTHOR_TIMESTAMP_FREQ)
> It is more typical to have NO_GPU/NO_OFFSET/NO_FREQ, but I think
> handling 0 specially can work too.

I mean, when userspace will pass old struct without flags, kernel will
set these 3 bits. We won't need to special case flags == 0 from user
space, because it will either be set correctly, or not existent in
the structure. "flags is 0" was a not well explained shortcut, sorry
about that.

> >
> > For VK_KHR_calibrated_timestamps flags would be set as
> > (DRM_PANTHOR_TIMESTAMP_GPU |
> >  DRM_PANTHOR_TIMESTAMP_CPU |
> >  DRM_PANTHOR_TIMESTAMP_DURATION |
> >  DRM_PANTHOR_TIMESTAMP_SAME_TIME |
> >  (raw ? DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC_RAW : DRM_PANTHOR_TIMESTAMP_CPU_MONOTONIC))
> >
> > 4) The core of the functionality would query all required timing
> > information with preemption and irqs disabled iif SAME_TIME flag is set.
> > Probably we should exclude OFFSET and FREQ from that.
> >
> > Why also interrupts disabled?
> > Recently we discovered that unrelated devices can raise interrupts for
> > so long that the assumption of timestamps being taken at the same time
> > completely breaks down (they are hundreds of microseconds apart).
> >
> > What do you think?
> I am happy to use your version. Do you plan to work on the userpsace
> change as well? Otherwise, I can update my userspace change to use
> your version as well.

No, I won't work on the user space part. Do you want me to create
kernel patch that will implement the above approach, or do you want
to do this? I can start working on that probably next week.

Cheers,
Marcin
