Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877C3ABA074
	for <lists+dri-devel@lfdr.de>; Fri, 16 May 2025 17:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD9A10EB0E;
	Fri, 16 May 2025 15:58:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="V6Qurvl/";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="V6Qurvl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2058.outbound.protection.outlook.com [40.107.21.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C98110EB0E
 for <dri-devel@lists.freedesktop.org>; Fri, 16 May 2025 15:58:56 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=rw59ZS51uIaF3uAp1NbcXkwyBBguE3f+sl5EDkvRQGXKmlETtK17Hd3c1T49mc5I91DYgqjJdn7nQwk5O47Ub0Twn2B89EMa0wsxu2QnT0nWvNN9wNcdIDP4mvpCTCxfv9rQw4Osyt2sdaseaRN3Iq6dQ7dlTf6ff18YkDN4WLutpK2TIoY4uo932LwZC3shf+w+3x2IW50kTIwa6tq1XgoQ/Jb0tDp+cxk795osGPA4dy8TQNgkHIl2fkaQxpvxU6B7JuqALzr2c1Gpp/SLfVm44YxSXDM4I6dqVqVk5srP9CMzlHh0PWwtM307bVjmr35Shh9pwbTHE7zzkF8pnQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oG6wPG7v++ilitJrBYz8FrnV2NR5ADVhHCxGxXgbQI=;
 b=XqsZ3PRaR/gbQdIT40+QOzPzpZFBUhi5GXKKi5g/OJa0Eybe0C5wtuFQBFSiof0w4S56Dsj74ozavB8r3ycdW5cD669nK7Za7oj/LwbtrgXh9GC/eQaOUnWGRpegNfnqMAYnMBzBTfbm4i0jKgiSk2c3fwsD5ztrkY9w+bSA1vUS5hBroIOZkwzwH75goFGQRn3b2GlD5y5bU4QA9N0//d89qba8M/gtmcPa4XvYU8sFnUvTIhLJTiKLdkTJ4EF2Xja6rg2yXW1U1TRtju1H6hk5kxDsVlTq2NtJDOz2uSj+WC98E8zSOsvmaKj7g3ojaKpoHnmR4Lc0QQxJKoIxcg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oG6wPG7v++ilitJrBYz8FrnV2NR5ADVhHCxGxXgbQI=;
 b=V6Qurvl/txeRo2EsQ0jqv8QR5BiJlNtEgjS3C3VGwLJKG6aWz5eicI80xQBOgTinUGM1qlMr/0N8kN5mhAvVjlN8oaiSy32wOeugqWXNvteDdArXuhy2hOFZKVZGppVWAkH9cXnPyQ3FE6ITkeeiZHaZepi2m2WnIaGTRu5OUR4=
Received: from DUZPR01CA0271.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::27) by DBBPR08MB10796.eurprd08.prod.outlook.com
 (2603:10a6:10:530::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 15:58:50 +0000
Received: from DU2PEPF0001E9C3.eurprd03.prod.outlook.com
 (2603:10a6:10:4b9:cafe::c8) by DUZPR01CA0271.outlook.office365.com
 (2603:10a6:10:4b9::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.21 via Frontend Transport; Fri,
 16 May 2025 15:58:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C3.mail.protection.outlook.com (10.167.8.72) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.27 via
 Frontend Transport; Fri, 16 May 2025 15:58:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qw7S5kylCzEhaSUFnF/1pGYdkGW3EiCuKQ72ZigllJ7Mj6yX0Dk9cVbfPzCFX9SpFBw+hFtG8Kc9CWovr7RyNBiYhM6Vg5xPWfLZYZTsQLqhAmVBNdO6X8SWBp3cYgcY/qugBJNOtj3CIPUY/6JJXAa7Jl6G/qs22Gs4PqDpbcpN7E8DQ96q0xeurCI+9nO+oxgM9yndWDsphnlOaZRX9J9iFIBJAI10m1NGzFiqX9skfbxJ/wq8MFKIBrJwIijGbb8ZvzDPy5SZRlg9/nw7+zgJg1brVqqkEIpYW+nJ3MXU9x8zEjT7GAIiQAb1cUW2F+2JwoqLQCwUYgYcY3WFCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oG6wPG7v++ilitJrBYz8FrnV2NR5ADVhHCxGxXgbQI=;
 b=X5YU8fZDgnJkpBxHBCIQFgOYnc6McibMwBah7a0KGq7+1zV9VzZZKaMMO+BP2vKGtX5j5eTJfSPoc3hTyWgl89byNdotkam2OrOiwHGP3SoR2//yjBBvEJcnV3Y8jb5pLQAcy4+6nVUgUTwqJuweOY3ArmJDO5TtpHbA2VrVqhGBU2tZl3LnyMqBvvK5ZkLrMcd3pWNitCLRNHqKrpLlASsrgDyNiSWY3Fm2kJm9ZvY6IQoJMIMHydeQKbz6p9Dkr0rzYjKxTDmx9jUfsJonfiata6eiSDna+tz/whIOuz+ojx5kTPgsvMdMBbyygLSdftD9V7zieH81fgPptDtyew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oG6wPG7v++ilitJrBYz8FrnV2NR5ADVhHCxGxXgbQI=;
 b=V6Qurvl/txeRo2EsQ0jqv8QR5BiJlNtEgjS3C3VGwLJKG6aWz5eicI80xQBOgTinUGM1qlMr/0N8kN5mhAvVjlN8oaiSy32wOeugqWXNvteDdArXuhy2hOFZKVZGppVWAkH9cXnPyQ3FE6ITkeeiZHaZepi2m2WnIaGTRu5OUR4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com (2603:10a6:208:5c::16)
 by VE1PR08MB5837.eurprd08.prod.outlook.com (2603:10a6:800:1a9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Fri, 16 May
 2025 15:58:15 +0000
Received: from AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc]) by AM0PR08MB3315.eurprd08.prod.outlook.com
 ([fe80::42a0:1b6e:cf98:d8fc%4]) with mapi id 15.20.8722.031; Fri, 16 May 2025
 15:58:15 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v4 6/7] drm/panthor: Add suspend, resume and reset handling
Date: Fri, 16 May 2025 16:49:40 +0100
Message-Id: <ae6144b6f6ccbd2c035956ce5085ae7fbb5ec96e.1747148172.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1747148172.git.lukas.zapolskas@arm.com>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P123CA0041.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600::29)
 To AM0PR08MB3315.eurprd08.prod.outlook.com
 (2603:10a6:208:5c::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM0PR08MB3315:EE_|VE1PR08MB5837:EE_|DU2PEPF0001E9C3:EE_|DBBPR08MB10796:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f04a52d-1644-47e3-287b-08dd94928bb8
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?8HaAzEbjGlSSrTaomO4FF36V7Vejg/MvYLB0yjqbn02q5o4jXzmC1moaHgHU?=
 =?us-ascii?Q?NEGf21dRNulFNds3ftUk+tvfv3jarCN75luFkT78X1/w/5plWQs4uGuUFYg3?=
 =?us-ascii?Q?pq4Jy1ZVeUOBzD+FNwqGDwr1K1L1GQsfAdC9o5xgkOC8v6BOJqomLYmB/50o?=
 =?us-ascii?Q?OZUaLA76vV0LHZuWK0XarybJ/5cz7qnp9ESf5jVfQIUkgMQ9kDuap8sZmo7o?=
 =?us-ascii?Q?tJzFJGo3+Wnyx7ydbzzzytN6WvT4LyaLNZv+1q9y1TTyNfxC6NnRN/wUoGMa?=
 =?us-ascii?Q?3fu+GInoydX3Cz9Qw+Nx5NYlB3nuk9ihS4BnUadpWHtcTva+7EumH4yyTpwg?=
 =?us-ascii?Q?c/G2W/+SXyXhJj2RcVvsz4FlGXf4L2eX1xXIG2Rim84ftOObVY/QH7B1a46T?=
 =?us-ascii?Q?wZhCYhybzsM5X6xFrFjGlZL4jfPhhTaWc5SzB/TICCRKzREOXWGpKXpWSt5L?=
 =?us-ascii?Q?9xN+I1j4tlmNEb6F/x06Trd+sOYr0HRqbhnnok8SMeFXnqqPtWCYlD1BF9wV?=
 =?us-ascii?Q?bX+oi01jsk+yCSt40MF7l4zcxckkc+u+n1DgMqnXBXhiAs2YTydtpdxMXgVI?=
 =?us-ascii?Q?QNCRmRj7FECgMXTgKO4b+CYV+yeDamgq4aCzFhy2W7jeXUg0kzQJlG7SroNS?=
 =?us-ascii?Q?ctpBvCBeMmJLbzhrDowFVo4WjLTrdn8dK9SdiTTd80X1tx5rPrdNCbnNdGoL?=
 =?us-ascii?Q?QOjBpoDNLVBwqn0EskDGJrd5CDRBUEYF/Wc3rFYy2no5X+V0l5LXpmk17KDM?=
 =?us-ascii?Q?b3r7Co0QFfQuKGke5UgbQy/sW+yvRaounK691dIZmwp0514ldEa5+k/L+T75?=
 =?us-ascii?Q?gITlND3z+ZZ0NZzmqJtBpPpPsjdeUzQ0LB+tR9ZR5v7Jg62hr8Km7h8eNIIm?=
 =?us-ascii?Q?RoM1hEsNlMi0YsPOtuXsexkTH077jUwkfN5RGnLU8oKSHhclITzKTA+eF/oR?=
 =?us-ascii?Q?3nlj0w/IN+CP+is1TpPWShrUkoffEbe4O6SxSh3kyEyB4HIFBV3QOgu498Bc?=
 =?us-ascii?Q?gjEIGDRwHDXoI9yRBRPgSqm5oqh4xCez7OqqlkxsbYGwDqtsMM8Zuz/2rOA/?=
 =?us-ascii?Q?7FfEIUt8VlpcNcShTvCkJ3BkH3bXppVWP9h6QnSssILz4OxH2W36H/O90RR+?=
 =?us-ascii?Q?IWS2IXdGeR1m0cF5kAdnO3A4wgR9mnnGwE4OwEmPaSyFnep52p45qNGLBUaL?=
 =?us-ascii?Q?hSvBsIfKl1xBlYXhkRqHxmiTdkVdqlkQHSgMxJNbWoWbL2tYynLIyf6Nf29B?=
 =?us-ascii?Q?AbMOfDZzsuFaVdsjmjbOC1s/kP3HceNmZWZcTwmECLJp9I6pW6c2NB927R7G?=
 =?us-ascii?Q?yKduEvQFvj3QEo/S+ho1+dDBZ6d5xshOFK4MxqpyNzybYplBGtdt/YY9RDzf?=
 =?us-ascii?Q?rXP2LcD1jcsFKCJcAAOht0LoJuW5uiCJgbC9Hr/ZWd4v5umcu7kYQObTnZw0?=
 =?us-ascii?Q?H2L0UQXcXRb3ugVm9y+jOdk2XbH1zMXj?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM0PR08MB3315.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016)(921020); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5837
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 9aab017c-2495-4846-68c1-08dd949277df
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|82310400026|14060799003|1800799024|36860700013|376014|921020;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VrQc2BP1uYDAEibBqHIegZvT2Nv0tqvU3EOm69zepOmlNf73Ou6wpTMTsPMN?=
 =?us-ascii?Q?/4MDdj2G8RW3ahcz87W3lEJDhCDFSf51m10fBRbtGwak66Gh1Rm+IrU7WWIs?=
 =?us-ascii?Q?uLr8v4e+juP6R3+itEtjrUiXlCO6X8MWLvGAg0JvM0U+1B4dipMoRKpvj2J0?=
 =?us-ascii?Q?QomN2p6sUB/WfR+ZbFFRhkH26eWQ1Wz7ollemTmyFfPJ+5pF+FSS/Y6ycjOT?=
 =?us-ascii?Q?/VldeKhkPEEbisFqCdo/E6LQ/w5xzytj8Zi7D5mp6Om8XFSbWSsmLoYYp2Ao?=
 =?us-ascii?Q?JP6bvKW6QiqZHCTOVabX1T7Hu3/31x7Npe1oVvmmbPca4rqL1diKshAam9Tj?=
 =?us-ascii?Q?xXKYCyZ0pm6tywaFiwYaoHg1gtqYfhQJc5OOxx4YFQmvUnvh3nrM7GWJIodF?=
 =?us-ascii?Q?AYki2rK5v7xYS9AXIbg4vxFi94JiPJHJqhYBNkUf2MtvOIMQE2BwJlIcK8OF?=
 =?us-ascii?Q?xFcFpkYJ26KGjszI4Vps9KN5VnWjLiIthHVYWxbZpQQw0QLljixE9PF962PJ?=
 =?us-ascii?Q?zPvjFPQbomXMtyn7qXF+VI4jhYRJFY0GjwMav8Xjfp0U6h9XDIw0SMGGPe2R?=
 =?us-ascii?Q?0PBgLkC/4r6AaW3qc4KvwXdam75rCSOxWGbbi4JAEJSXN1c5KItY8ehvO+hV?=
 =?us-ascii?Q?kUcQblb4ywqXRoND4UT/EplAYOizDq1gCXBJADfrYrwtYrh3A0hfeeFsNNhc?=
 =?us-ascii?Q?0rodAkIHDjOI5T9rKJvQHhs+3zzHY7ktACuuviNWYYeIEANQN5tKYgECySzF?=
 =?us-ascii?Q?zS71J1Pg9/RFAo3LWST0wDrpTazDvvZRjZP5q+nflPAAcdhkJXKtAGhZpu6U?=
 =?us-ascii?Q?0Qw4Y6qODi+YTajTyMJg+ufeZCS3V6rs87jaC87LV1r2D6PSKrBS41rE9W4T?=
 =?us-ascii?Q?fERoLJcPb6KMryvJh8VPZPdyXEouSnyQdARrNPR4VME6uG+YekVWoq81R0SF?=
 =?us-ascii?Q?nQ7YZv896GZ+I7O1eayL60fUk8SqkD5Y/lyJrDpa4D1hGXGGz4FYUDF9DynR?=
 =?us-ascii?Q?NC0Gdn4M+GoA29P8AYDofpZ6QBM/RD0aDRN1eqiKEX9uIm4ALtTiJQhkzOHw?=
 =?us-ascii?Q?wIARm07/IFoMVzXzM8lGICsiCuWMM0OYDgoPguS/pUfzl+5yjhcEJZ1alTRD?=
 =?us-ascii?Q?cWzf1WOmVBFfboOWK8fAzYTY4Jst7UW/jVXg0NQjBWXSiJ5EKFAMP3jl44OO?=
 =?us-ascii?Q?gbkrKjH/a2RtGfWdznMBmE+RLuhf4KBDqnzK7avvcURcPf1IrP9FeOXATdpc?=
 =?us-ascii?Q?2ju7jW5tpZJTFhfD+wAmcMUsHodmiO2/wFowg4XLbsDXwn7uYD6GNSI8Rf6C?=
 =?us-ascii?Q?Jszxc0LuY/bSRrNE2gjv1VntqnOLN95t155i/bMdHqfh3wwCOC+C9kfdbc2K?=
 =?us-ascii?Q?hE1FTjQKbx41Bu+3CcSVqfeA1oheAXO+FvgmpFAEdbyHqYEFAH5sIs4cMRic?=
 =?us-ascii?Q?vbGjmITwzQQTqOh7etlp4Yw5nZfkmF2oxLvAf9rpwYafi2+GSoR95vh27kKo?=
 =?us-ascii?Q?/0NVVUMSDdweF7R+hPOz3hSL5uDPJuFA1vN4P1bsBWfwD4rXYfLRe306lQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(82310400026)(14060799003)(1800799024)(36860700013)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 15:58:48.5628 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f04a52d-1644-47e3-287b-08dd94928bb8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C3.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB10796
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

The sampler must disable and re-enable counter sampling around suspends,
and must re-program the FW interface after a reset to avoid losing
data.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_device.c |   7 +-
 drivers/gpu/drm/panthor/panthor_perf.c   | 102 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_perf.h   |   6 ++
 3 files changed, 114 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 7ac985d44655..92624a8717c5 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -139,6 +139,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	if (!drm_dev_enter(&ptdev->base, &cookie))
 		return;
 
+	panthor_perf_pre_reset(ptdev);
 	panthor_sched_pre_reset(ptdev);
 	panthor_fw_pre_reset(ptdev, true);
 	panthor_mmu_pre_reset(ptdev);
@@ -148,6 +149,7 @@ static void panthor_device_reset_work(struct work_struct *work)
 	ret = panthor_fw_post_reset(ptdev);
 	atomic_set(&ptdev->reset.pending, 0);
 	panthor_sched_post_reset(ptdev, ret != 0);
+	panthor_perf_post_reset(ptdev);
 	drm_dev_exit(cookie);
 
 	if (ret) {
@@ -496,8 +498,10 @@ int panthor_device_resume(struct device *dev)
 			ret = panthor_device_resume_hw_components(ptdev);
 		}
 
-		if (!ret)
+		if (!ret) {
 			panthor_sched_resume(ptdev);
+			panthor_perf_resume(ptdev);
+		}
 
 		drm_dev_exit(cookie);
 
@@ -561,6 +565,7 @@ int panthor_device_suspend(struct device *dev)
 		/* We prepare everything as if we were resetting the GPU.
 		 * The end of the reset will happen in the resume path though.
 		 */
+		panthor_perf_suspend(ptdev);
 		panthor_sched_suspend(ptdev);
 		panthor_fw_suspend(ptdev);
 		panthor_mmu_suspend(ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index 97603b168d2d..438319cf71ab 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -1845,6 +1845,76 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 	}
 }
 
+static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
+{
+	int ret;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return 0;
+
+	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+/**
+ * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system is suspending.
+ *
+ * This function must not be used to handle MCU power state transitions: just before MCU goes
+ * from on to any inactive state, an automatic sample will be performed by the firmware, and
+ * the performance counter firmware state will be restored on warm boot.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_suspend(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_suspend(&perf->sampler);
+}
+
+/**
+ * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
+ * @ptdev: Panthor device.
+ *
+ * Indicate to the performance counters that the system has resumed. This must not be used
+ * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
+ * @panthor_perf_suspend.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_resume(struct panthor_device *ptdev)
+{
+	struct panthor_perf *perf = ptdev->perf;
+
+	if (!perf)
+		return 0;
+
+	return panthor_perf_sampler_resume(&perf->sampler);
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -1878,3 +1948,35 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 
 	ptdev->perf = NULL;
 }
+
+void panthor_perf_pre_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (!ptdev || !ptdev->perf)
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_stop_sampling(sampler->ptdev);
+}
+
+void panthor_perf_post_reset(struct panthor_device *ptdev)
+{
+	struct panthor_perf_sampler *sampler;
+
+	if (!ptdev || !ptdev->perf)
+		return;
+
+	sampler = &ptdev->perf->sampler;
+
+	if (!atomic_read(&sampler->enabled_clients))
+		return;
+
+	panthor_perf_fw_write_sampler_config(sampler);
+
+	panthor_perf_fw_start_sampling(sampler->ptdev);
+}
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index c482198b6fbd..fc08a5440a35 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -13,6 +13,8 @@ struct panthor_file;
 struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
+int panthor_perf_suspend(struct panthor_device *ptdev);
+int panthor_perf_resume(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
 int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
@@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
 
 void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
 
+void panthor_perf_pre_reset(struct panthor_device *ptdev);
+
+void panthor_perf_post_reset(struct panthor_device *ptdev);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

