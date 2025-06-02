Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF6ACB0B1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C9910E537;
	Mon,  2 Jun 2025 14:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="XJFNtomd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="XJFNtomd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2062.outbound.protection.outlook.com [40.107.21.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C41D10E530
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:16 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XEV2kM1S1C2eTfD+YOZx/8+3iOkXinNQOwEmB3ruI+S4OndEotTU66GWgB+HCNuoOLFyvMU9B3IgVAY6thSzCT9w0ib2g5xuVkgCwsm2szPhgscrBt4FcyEvJyDpbyXpDqzgxsDO7DIaeRX7Hdzc//eVbazdXpCVTYViUwqh8V8rPL6mBWti+UCJ/CHGhSA/vbZJKhCh4yEHR/BhO0hQcDz4oKnxOWtdocUYICQjIbFoj5l4NqKZaLoa613MPJmkGgi0PLQUHM9pLbjQ2GqlIBSVgJHaAEsX9CLprPkFrppAcQZG99o5wrG4KCT+8IytcW5d91y7elGl288Ok84OvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=uV6EizGQKmyieFfxHy7Zes9fU6TqpqCumW8L9SjqknVsHTCpV1hc7fNRk1mtzVS7ja4fcGrOrgsnhtlEV3OjureFgGkF0MU6RPeEpCPPj+dyx2w8UnI3IX+BznHCA9vtmDR0xVprr0URfKOa5MCZd/FHvq6Fs4ta5AsJLql3Jd+pAIJxg9swCe5I5jTDYphtar6lRznDwW36kC1cel30AQ5VgLjpJnElTKw1SWKxBPz7lkYwl5fvMJ7c6xtp64w9aB7/ChMJdygx4UYW1BY7kWtmDBYS1gdycP8drm87DRl4gQ/nfAxPMUZuDNOto1iQJrSXCE/kTpizj4GHAgHveQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=XJFNtomd22b/sTOdONFbEZZqLU5yNaSIiiPCUPoR8CkIaZuTCzpS0ukg1UDp+U4xCVIptvcvgBldLzcbULDMljMFImFQCMsfM8kJXqCeaNnZTLjoIhpBbd0tJ57fjL7Tbkb9I/bDJRva5lIRznEQFYXkEFry8PSbIco8ZmlRJlk=
Received: from DU7P250CA0006.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::21)
 by PAVPR08MB9281.eurprd08.prod.outlook.com (2603:10a6:102:306::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Mon, 2 Jun
 2025 14:09:08 +0000
Received: from DU2PEPF00028D00.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::89) by DU7P250CA0006.outlook.office365.com
 (2603:10a6:10:54f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.31 via Frontend Transport; Mon,
 2 Jun 2025 14:09:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D00.mail.protection.outlook.com (10.167.242.184) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWyQTQkU7Zb89+6+xdgol7oce6HfPefl20XzXpv4z3gK7LHqBcGIwJdYU5jCcNv3ezGz9t2hk0adNjRqnk0q8I7O7Lefb4Wa218IPalKAxhzUjipdV8pMJwEk58/T3mnp2vJdtm5rDHzzgVm2TIus0ZgFZOtbOYnh3VEEnR/hTHMpuZcDEL1Vv6u2dsjxjs0vWtxhF0PG+9/wjzBAvOaAfWv551BGMfJDSds8Y334vZG3rb8PWhS8TSvDyCAA8mxOEDFctijoQ0k9O58b7bmU8jAs+psRjhqfd2O/DZiarFbcQDV/o0Y43dutS3f8MAy7lFyOqn87VQ9Bj79AWTP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=uR5XIf4bBeTEfAhZiuvEOIxur4EsJdmT0Ee3AGCXvZO+gDmJq/Y+d/r4vfiB47XE6mCmqPF5OkPuuyg+uthoIe92XUF5Adzlz3jwKtzZubt19XF52Y1Dvxymm5RzxcCR5f5Bb6gNxfjwdlnUGhMxCduXZwq1+Ji3qDXnNdG6cLjgkhYQj3q2uRBc2i4DWTV5gw5avuNEIeKpMsTiJd7umi2mn7/5k6vzPQsPuEzrxh5HiQh74z3DwC0dwLcPmLMbo+SMFTd1IfFcLToH+d0WMU1J/WSIsdzJEyvvVe3Aj5iRL3EfENLPMVRjz+i/giqVJRT8FkteL9xX+0epL/YLsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=XJFNtomd22b/sTOdONFbEZZqLU5yNaSIiiPCUPoR8CkIaZuTCzpS0ukg1UDp+U4xCVIptvcvgBldLzcbULDMljMFImFQCMsfM8kJXqCeaNnZTLjoIhpBbd0tJ57fjL7Tbkb9I/bDJRva5lIRznEQFYXkEFry8PSbIco8ZmlRJlk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:25 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:25 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/7] drm/panthor: Move GPU info initialization into
 panthor_hw.c
Date: Mon,  2 Jun 2025 15:08:06 +0100
Message-ID: <20250602140814.2559538-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0138.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::9) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|DU2PEPF00028D00:EE_|PAVPR08MB9281:EE_
X-MS-Office365-Filtering-Correlation-Id: 09abaa6a-9f92-4b4a-79d0-08dda1df0a25
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?mXVtyAEd5pRz/xGKvWo+PIyenBAiLrTa1xYvTr6mmdNuVsvX+FJ+R65j+STv?=
 =?us-ascii?Q?YI5JVBTZwSoStK0kwF2CEU3UjAUdgM7bo/SA4FVPyQz2erxkAnmE4tx/9nnf?=
 =?us-ascii?Q?OYU+TVepm01eceOCKtWTk0qUlZVj8l6LmVDYOaGvJBn42csNhZ6r+wYxuJks?=
 =?us-ascii?Q?bVaui/rTo3JFW2CDrb30QPVI3TjApLGtHZq2BsUF2iu4p+yNFprwyzL/cUzo?=
 =?us-ascii?Q?QzoYjnm7l6GgPH305NNmmTBjAk8L/74QTowDfgQVbC0Bn/mfb3xVlJFVW5Aa?=
 =?us-ascii?Q?Y3BijsHC4sY0imtrdbAvhdT652PUQ6MyRb6dYTEI1Sm7ASQi9rlqgQb//giB?=
 =?us-ascii?Q?rgrtq5G5OqAYsfKvnbR90+w96bMCE2xYbB1DsKU0LD09rFZ6f6lUjnzJtrKE?=
 =?us-ascii?Q?K8RYANhXmNgIAX8Aj2sj0Nabnd+79tbQQc+napVSFdpdlFAyYojdVCpwae9P?=
 =?us-ascii?Q?2Faj14mXlTjRL88GBMlwxVjlxoT3JllzdELZF1SM055cT8hx+3NfH0S2Atac?=
 =?us-ascii?Q?uil9KIpCJI/QQyPcj11x/hsm9O0yxJDpOnaCUXIbaqKR+0IfHix6FEt5VQad?=
 =?us-ascii?Q?C7BpRBkrig+QtcSIc5HwNPpIKX7NVda/sLItnZ9++DFkajTlavFovtSlEz7l?=
 =?us-ascii?Q?j8Gp3ALxkv/4m13HlYY178vBWCwNk/jAQ9WqLC+PdyFdvjjcO0Iurf2rueye?=
 =?us-ascii?Q?aloOJyVUJ1eCs72oUk4lTDW4UpJ4vEsAB37pD0WpqqHtvM/0vNccQSt9VK/l?=
 =?us-ascii?Q?iOdN9K/s1z3yAaej6M8ec5vFx7n9F0tf2mfQSfFJRHXiWyKkyD5mlRPmHc0o?=
 =?us-ascii?Q?ZkoODu9St83aVqRLw1qqZpvyilk2hzimcHC4fR++bQxsZ/5QDXlxb2fVHezX?=
 =?us-ascii?Q?27MgKsiA4wTPygpXBioDmNhsiTSLth+p+HM0rs2r6BR8k15NlYHjFInguyja?=
 =?us-ascii?Q?jiI1o4eo2RlZ8QDCCzKHovH5s1KPDHqI2ytkZxs86mmreeALjeKBdpTHK1Do?=
 =?us-ascii?Q?0xzkeLpSTWgCaSavkWyzMdriBxk5uluXQq3PRmStw57QssD0ZWUEBk1s7AL7?=
 =?us-ascii?Q?4BBMBcWQVzxNA+czWVCrd5JTYjX4IzfSz52cUGozBvg6lQFc0oLhTbE6X5q3?=
 =?us-ascii?Q?wWehUO0Q6Ubvmy88mYrxrFYeN1OLv5zzXL+x8wntxYedXSBXPKhpFCb+g9KV?=
 =?us-ascii?Q?ozgpwy7Gw3dUTTt4eJMjeWcZhF8PjnErU6HrLOCyw/2typa4ALAh4ZrEZ5Qd?=
 =?us-ascii?Q?/Khrk9PaRy3VYCB7m5B0Ne/2Ul4n9Wa0MkCnnt/1zQ=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1697fa66-29a4-4d90-e0a0-08dda1def096
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|35042699022|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dcf56KxMS/9bwkk+g+kGQoRK/4/3SJ+7cvwza7OyZUTryIV+lCSxXMosKm5I?=
 =?us-ascii?Q?rl6jqf1OJDiR0EzpclHTiIoXWaOj8IpDww1ffpmzNfjl1UjvWkue2nticlUV?=
 =?us-ascii?Q?/BLVPBu9muKWIa83xF9z2kj9oeyJrXyDVTOkjZwiMR/W/orpcKiy2owlPABO?=
 =?us-ascii?Q?bKzEF3afTmvmss1WEK5m8urRIpGJxRclCYj2yK7l0uYVV0BBOK+z3XSVlL8Y?=
 =?us-ascii?Q?HKtYLdDs4JhljrQM+EmkoeFkMx0nYwVqaGLKN87VqTergkouN7guVkorwZLC?=
 =?us-ascii?Q?3xfzBBCiWRbR05EHgyHcqAulkLQoJIQzwkGyXtEvq0dKAiC8yRgfNKa8KbCS?=
 =?us-ascii?Q?gibd0wKoIaxt/3+lYHTcMNCTpfalQSfCPcVbyfBiPJCBTaThaLv/vHk8De4/?=
 =?us-ascii?Q?wxWUbuQH7uXGySYiyB658zNuG/2V/7/pPVyWQhutyKcDPGWOoIqctWUuNGHs?=
 =?us-ascii?Q?OlQHEMa4Brt84v7Qde9AYDELjAqtmmr4ErVk2E6ki+2zfaIrDA4+42a/BwWx?=
 =?us-ascii?Q?bapgnYQI9g0JI8JR/0j3V9kjStYivTb5cDsZwA+8DTAWPCSUE1lorN2b6NvO?=
 =?us-ascii?Q?U2p9e6ltaWqadeQTUWG0KUhk/tHz0+KkZHUoHEpE0F4BrC2gSD4VtdTZnGus?=
 =?us-ascii?Q?DkMsq4/qgDSVU2t2DlyNypwZJka6a5Op7cZWJGOxNueTtIGnC7VpjYFI64oH?=
 =?us-ascii?Q?pKR8DNewP5g2hjQTBOXx/r4yE6JQ3bQnplLhh1GcWzzAjhEzS8yjoP5g1kfz?=
 =?us-ascii?Q?cySUko2Xe7IcThX9c5GbjrQFk5vahrsBs60RYckO/zBd9EfSVCWGlg4BGg6R?=
 =?us-ascii?Q?2j/KXC8QE6nnSnAImKq3bM9sfaag41M0Jt/7fGDEan7n6BBznr/X45/7DxNE?=
 =?us-ascii?Q?FEZo/5dAQrxyRZCcQ8lLTO5BFk2xlrwyf1klIz8NJHsKNmDwwsnqiKHhr8Hn?=
 =?us-ascii?Q?0aV7tc+5G6Ezk+TCAbNjZI4VAo9fbTo8lZeHitIHKn6A1Xvha3JOzVs3IQpv?=
 =?us-ascii?Q?IwdA1ehqR8Njvp36/lC5K5FlJpuGpZ//Y9RFmOAGkjwGeFYvyRmzJjHH9DQV?=
 =?us-ascii?Q?Hp2RrMP9MiwtTb3mTHK7JMbPZCfSiu/BJ/oS1YdQljiw55w45MwBxf/atkqH?=
 =?us-ascii?Q?VCtDtVoWqky2vp9QMTYUcuJd7N2LeB8g9A4Gu/CwrsJTL2qlsoEdcGKvmntl?=
 =?us-ascii?Q?QhDwOhsfh+SM4rpNowRj34U8hPf6GDFdUdtGXPLQAu9YcBFXgIdaVOl6OeCp?=
 =?us-ascii?Q?tP0GYrSC+YOEjDNSfacrsFF/chdDc5qX7OGQy0mE9jB+l4r2dpSdU5KZjn8D?=
 =?us-ascii?Q?ubbNAjbfE0epPhlJvzGUeJmGaNB6x6jNK/sP1VANX3kXQSCLsaeDSRqGU1p0?=
 =?us-ascii?Q?KcjC3zDz6JIsnTO39A7odjuBZMK3Bwjn0EDsv2MPw9kEDrkB7jw54bGFfonX?=
 =?us-ascii?Q?+Pb540Bt+BBloWv4ypQsCrQGUYqdEWKvC87TCgBXeaP5jfYLhKvxbdMM+RD8?=
 =?us-ascii?Q?pTZVv0zHDir3gE73Q0Mp4V1J72Yzjli3Wodo?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(35042699022)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:07.5304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 09abaa6a-9f92-4b4a-79d0-08dda1df0a25
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D00.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9281
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

This patch moves GPU info initialization into panthor_hw.c in
preparation of handling future GPU register changes. The GPU register
reading operations to populate gpu_info are moved into a separate
function to facilitate this.

Future GPU support can be added by extending this function with the
necessary register reads behind GPU architecture version guards if the
change is minor. For more complex changes, the function can be forked
and we can leverage the panthor_hw_ops structure to provide architecture
specific initialization routines.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c |  95 ------------------------
 drivers/gpu/drm/panthor/panthor_hw.c  | 101 ++++++++++++++++++++++++++
 2 files changed, 101 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 534735518824..ca720e70211c 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
-/**
- * struct panthor_model - GPU model description
- */
-struct panthor_model {
-	/** @name: Model name. */
-	const char *name;
-
-	/** @arch_major: Major version number of architecture. */
-	u8 arch_major;
-
-	/** @product_major: Major version number of product. */
-	u8 product_major;
-};
-
-/**
- * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
- * by a combination of the major architecture version and the major product
- * version.
- * @_name: Name for the GPU model.
- * @_arch_major: Architecture major.
- * @_product_major: Product major.
- */
-#define GPU_MODEL(_name, _arch_major, _product_major) \
-{\
-	.name = __stringify(_name),				\
-	.arch_major = _arch_major,				\
-	.product_major = _product_major,			\
-}
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4dbe23df0c4c..576cda231c1c 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,6 +5,105 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
 static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_major = 10,
@@ -55,6 +154,8 @@ int panthor_hw_init(struct panthor_device *ptdev)
 
 	ptdev->hw = hdev;
 
+	panthor_hw_info_init(ptdev);
+
 	return 0;
 }
 
-- 
2.49.0

