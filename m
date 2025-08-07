Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A893BB1DBA4
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1834C10E16B;
	Thu,  7 Aug 2025 16:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aBjrmVA5";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aBjrmVA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013064.outbound.protection.outlook.com
 [52.101.83.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5A910E16B
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=TgjQ0vEI/jy0zx/JlDd0Fx8FvYGb9TEKrx1LFu5oVG1WrifiTaBxTQ3mn+B6unrZHTymg5G7vFenNJt9TfPYSfqG/reqJmte1cGCAf9Z4ZWgsTAHB4O2nMxfhXO1EjJq+S9RF0c+Vr/EKXxMQ6jYYm6N3EhXrOzgyk5lmCyJnnUcGr1zOipJRebgUC9dWEp/I7MhJeCPVLeqBsbbADOyTih0EwChpnLtbNEGufDSyOV2z73ZPMtSf+KpawvK0bqv8HQN4tFrXqZeVzoSHvHkGeNkOpXZ5+rdX7ILStfswR9MhvyR2u6d4e3qfpbucFjTquk//VfQ4x4+j30+QAapZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=ul8BLjvvvp3J1dcyOYswxOF0R8/EyGQp3X89okYci5fDDqC3fjPp8wz5eBGcGMquhg9hLt+9NJqbV5/wEp8P90xZM+QTWSnEOggxmAgSPBcDfO2stM39JZ/wA35ainyTr+Z3XU32deuWpO8JKub5nS9pvO6Cy6ir3/RbU3tmW8yw6gLybZMFfymBxVPlkYWnX1lEP+NHtms/nBxuAiVGqAft7k65Z1+Je8oO2sUJJUwhKl3nlwdWPSaCT0Gt1cCqb/2RyZF+Z2aXC7J405CPMl5lLYgWBCjiJU+dGw/pw4O5Lon5EkdIRAyxo33CSPlKexdP5R4JOldAg0L/FgDE2w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=aBjrmVA5AdIZVEa6q31XxA5yts33BHu+4uEiy0fe9CE9qd5mO3zKQ66ZyxCdX5Lb+QK2IEWaydJC95+r6PZzGaYsTzQzD1UGbF9TL1GkZnorC7ca3Pacj3ktnZ+2NWTSSYnVfh+SCH2RLGVuay8haMrOHxk5S6uHhee7hgd87hg=
Received: from CWLP265CA0380.GBRP265.PROD.OUTLOOK.COM (2603:10a6:401:5e::32)
 by AS2PR08MB8477.eurprd08.prod.outlook.com (2603:10a6:20b:55b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Thu, 7 Aug
 2025 16:27:36 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:401:5e:cafe::8a) by CWLP265CA0380.outlook.office365.com
 (2603:10a6:401:5e::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 16:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8
 via Frontend Transport; Thu, 7 Aug 2025 16:27:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=taM8veIbUNOD6FWXpcirHMSWCF85pbTJqBWbF3nGYqSZHF0mCSRE2O3MxhUeT0I0TL53Gomg8y/PW1OV133q19TJBkJN6zh6aTg4onplBr0CJpdhfURV9hmDH8WVn2KWhM1Rt0TVpKdTbcv5Vp1rHBzyzzIesNLlq1JB5jIqk4dYvFvQqG5flGXIYplVjTWylOs56gNuIgay7DIgL8pLS5MF4WtoU12b2R5WMdJUh5hsDgmTau/4bIlSyxBNuppF9YKCyH3Ro1CJiYz/dprPCYSgeCE5uXvKqmi62o+Wm+sx1mVoOzCSwGZ4rfZc8rSE6na6kipuDBnPClfj4cAKIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=lA7fEPidSX9SlzkbJlOIsqmUb2zt9lrhw1B6+kvu1HZdhLJ5aSx30tdOkUe+nPZ3VoSPBNxbT6vbdOvDr/DW9TlBuJJLtJfySTl/tYGwfSSydqGdfpYSzSxs1PR4Crx9snHjO0V2uF6zyPrkGOPeYtU4xY7XmkPyPc4xM15mVf40yzxt4UPjVakNfSxQgIKT246oy6DYQNtnz/Mq/7V9wQvejIj6UMbzRQ3foyG+uLpuhZ87xmKQ5VhgBGGyzykoj0XD3+vtAT7iWLU5wGBzuEOb67vKLzw8/bkGWhLdVSjK0VUwTRS5hnc43Yk2Mp6a+ecHfcFCL55ibKOYIN4txw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=aBjrmVA5AdIZVEa6q31XxA5yts33BHu+4uEiy0fe9CE9qd5mO3zKQ66ZyxCdX5Lb+QK2IEWaydJC95+r6PZzGaYsTzQzD1UGbF9TL1GkZnorC7ca3Pacj3ktnZ+2NWTSSYnVfh+SCH2RLGVuay8haMrOHxk5S6uHhee7hgd87hg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:04 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:04 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v9 2/7] drm/panthor: Simplify getting the GPU model name
Date: Thu,  7 Aug 2025 17:26:28 +0100
Message-ID: <20250807162633.3666310-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0450.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::30) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AM4PEPF00027A5E:EE_|AS2PR08MB8477:EE_
X-MS-Office365-Filtering-Correlation-Id: d6f0a6a9-d215-4e46-3e8e-08ddd5cf51ac
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?20CIN0IZdbHbt0lvqI6XOeuzAPWcVNYyiR7oDn5y+FhYDri6ELj5i3Zs/uYf?=
 =?us-ascii?Q?rLd2LZ+ujmkX0hsR7YEqo2cP91Dp9PIV2rj2eT3me59NcC+fioiXDHFUwzjb?=
 =?us-ascii?Q?h6/F1yNamlTb7OSH+xCR8V+/vt86nczvis47TFJTzi0cupcOncXwhDPXZQ7O?=
 =?us-ascii?Q?IP5Qn1TUhdtcTvjN3ffWKZtjbzNeGhFIWW+wsLt5/jQqfXr58ZaW+9TedDxV?=
 =?us-ascii?Q?1U4KzJJO6dT5mCYZHjZTOILAL/2XEBlrSkl8+ykbeavaJFFv7/LA0JmjwcAU?=
 =?us-ascii?Q?RT0EPbKVs0sIzM1QnISy92TvL88PdiOho6eBj2u2Awys/WZ9AyE+VXix/zv1?=
 =?us-ascii?Q?gn8d2fURE3kS7oROXW29Ep2m/xWd7VgleTLW0kMIdeUJxujXpLMuXQiUAU2W?=
 =?us-ascii?Q?S1bJVxSZOrZ/aFFMCkcFqtwp+x5sVpW7x2RAsql/AabGMRhkH9E0hG2Dq/mI?=
 =?us-ascii?Q?swLi1tngcNA+rO17p/FQI7du1FVxmfQ/dAr0UIZRjFvgEEElcdDlxuaOE4BK?=
 =?us-ascii?Q?q0Axf1yQH0/cOswI3nqPYRXEjE/7IiQQe2z4FOY9zNUYrdiWVr6q/9BLx9/b?=
 =?us-ascii?Q?soubnovc77ZKmqm5vfF4f0Y6XkLzsppi2v0suaZ/9PHZy4jPL9oh2DnckDQO?=
 =?us-ascii?Q?W2ax1UyRjRF8XSJI8INexiyexVcB3XdoMLrMTT1tOnBtEbNsTFYvy2JEmaJq?=
 =?us-ascii?Q?DGg6zY+4TtJde2GfQFrJWX10rQEPyf+Mjcv2A467aLcVuaKJZuhAUhj61q+i?=
 =?us-ascii?Q?oBsl2x3eTcmPc/VDXHuCVF2nVASo65M3KtZm2ntnSP4JUFJFaHhehgxG+oN8?=
 =?us-ascii?Q?ZzRmlXFEAC191UDwTkgKW4/7pIFhOnWwDcpO6JvM5SurFPgvvrH2hdMi+33E?=
 =?us-ascii?Q?5ZoUnbyjYt4GWzzp6Up7XnBp4cThg8XADd7pklenTtwwlLBfO3rQ/re2jcq7?=
 =?us-ascii?Q?zqQc1ztmdUXCs8wLCr6h1CBNvcxKrytmNuIaE/VGnP5KwjjMWJ4MZJQbblV7?=
 =?us-ascii?Q?R1jBDMZkQ388TbXwQN/4qQQwvSEkmdLHPUss6U/6Y35TDqSF5gUYuXNUt2S0?=
 =?us-ascii?Q?3qrvQKXpmvj6etmVnotB/1s4Qt4k5E7/j85rkAVTM4P74XrRvd7y3YS7KK24?=
 =?us-ascii?Q?+Xqy2QmK1lrR4Dnq86hDN04Vkt53SOTpF5EVfOiLTTz4CYfl+PAICeGWCaAR?=
 =?us-ascii?Q?UAbVAWwUMKwJr7lPMyvwlg/3dAl8i0tHmSDaiKQH1SFxKD/JST1lf/xY24Pm?=
 =?us-ascii?Q?UG2kKZ7+EmDTCFqd36zQ5aFJNyVxJMMqJvzMyiQGKADSUKA/Jk+fPoX8wqdg?=
 =?us-ascii?Q?VX2tLFPkOkP+CaF0Q8HVVCx+jT+R5y/vstYlFI2lKmy0IVTH4Kct6poy5fQ6?=
 =?us-ascii?Q?qd92CU49DFKNQipqC5g2mTolC1bwE/beXNuc4CMPOaVBS4OZvCJKmwJS4Q65?=
 =?us-ascii?Q?889yO/oabRg=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5aeba8ba-ed2c-45f4-fcfc-08ddd5cf3e7e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|14060799003|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UIftNhUzpgwJSijGN1Wcgv+rxUB78Uitgkv/k1po1KNLgdjo/R+bF30utgRR?=
 =?us-ascii?Q?tiWzyVeMHdTvaNg8nQDOomgBakSE3f02AqiaAncZqD3qDBwNPxQHd/8mLe4H?=
 =?us-ascii?Q?HNFOfQ6qXdd9LjUQuO1kic/yUB1zb6B6T/w9WffLg16PdaNnEppAMcOjHMLg?=
 =?us-ascii?Q?+d1X+MTSSnlrCJfgbgy3U5XtCkInaVY3uOhd1q8JtJeQShsuGMk1Svhxz+hA?=
 =?us-ascii?Q?3uoqGdmgg5EGsZDPrrU3SVWTuBCfqhXWtfxaweDKfserejnB7rAlCsBGC8R8?=
 =?us-ascii?Q?OWWyZA6qBbwv13xj8VBMhq4cWvjiZu7na3h44SMMc7wmjbo2ks+xz/0ly3j6?=
 =?us-ascii?Q?UVDXe2TX6s+Il/O82agJ6k3Y/FyJf0lMv0FD3e6kTbWI4GwAOthMWqGbIrH7?=
 =?us-ascii?Q?G8J2wZEQTLb2WR1F2MI3dDq/33SLErlDEmO2QvEi54kxPtIE8BfDNZZ4chPj?=
 =?us-ascii?Q?xQDUL9AqXgBxKXo2HVvPflSURKtQk4FzsZxaq0+B54AvsgMskqKdGTvMpxdT?=
 =?us-ascii?Q?m22FbFyqQ+S63Jm+PdY6olQXvrvlNL9qaA80hCULs50nrIRmaWdFV+3ngIZ/?=
 =?us-ascii?Q?BaKT07MjrhzCyCItCbEZuj8Yi8EKBmHVJKtbaFi6VHJsYqdK9rJWhIlfojg9?=
 =?us-ascii?Q?GEoohnWSEUIUfmybX1zTb2NnY741AsPNMCvDBAbq9ibUzSMl3sgQpB6vGAvj?=
 =?us-ascii?Q?lBy4wTQkC15leIbcKpgYZQXD8cS4I5FLNWKMOIaxX4KS77UdUjvUpOQ4Bhqq?=
 =?us-ascii?Q?WK3uln2vAwLDYtrB4J68MVTIAy2Dva7t9kU0ZNYqhoGMx0MivpBdfTOMC4MR?=
 =?us-ascii?Q?le0HxOzOb0yAGWVA+IIpt2JmLppJXiUYlJpAn6TjvLEkNf6Oi6eIbZq2y6Q2?=
 =?us-ascii?Q?nXHHAPbkEOsLYmaUnJ87bBcQET3iR2cYSCq6UQ1tscSjZ8T4ct5pjJ4ufdAS?=
 =?us-ascii?Q?1S87jVW7ilVm0fGsdmlzyuDR8vFwXGmPVm9eMqHZt2o0VeaoaFVOlCnaiplA?=
 =?us-ascii?Q?qyEVK+JvMcOVzGtuaRYMAHTFIXrjkuhC6tRpdwRkspUHhmmkgToKQyf4uiZa?=
 =?us-ascii?Q?VfArbadYEjS4r4N8HLziLA75Kyfwun2C3FYK/d9qlXx2jBGzoV1FkgZelOOh?=
 =?us-ascii?Q?jD1W+SfQ1clIpSrU7LyngW1nIb2ooL+Wn2fN97RRGB9i5lhXnUv4gBu53s4+?=
 =?us-ascii?Q?71ESYiT+t5DBXyV4TpxdwUpniznRZAa/B4B2e+Fvt63+oXk/g4yyXvA8Bl0T?=
 =?us-ascii?Q?g8u8TXYBwVdMaB5j5Y6ecdj+5nkQdSASTGLHy7Yg7DG9inTKGDT2wVkDOAgu?=
 =?us-ascii?Q?shj5amkxet6NO0D68GD44hrZdmSeTAAw+Y/oVdKxAJ/eWMnA2puR3wYRwu9b?=
 =?us-ascii?Q?ut2MguRPCXBgQ5v7JNCN1QHB0yQUokdCg+5TUZQwgLiEd3TsoM4lqxYhZ3Dq?=
 =?us-ascii?Q?2wpG5fllqZWbjYr+Y/gPBcTkcEh2ZBK0k6RPJ/WOgMCHXnXQjLGqJveg9qy2?=
 =?us-ascii?Q?Dsy62CZLc3YUwx7P/tKH23yuskYMHwzI1j68?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:36.0736 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6f0a6a9-d215-4e46-3e8e-08ddd5cf51ac
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8477
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 94f170a8e5c5..6bff69fd247e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,39 +5,22 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
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
+#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
+	(((arch_major) << 24) | (prod_major))
+
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
 
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
+	return "(Unknown Mali GPU)";
+}
 
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
@@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
-- 
2.49.0

