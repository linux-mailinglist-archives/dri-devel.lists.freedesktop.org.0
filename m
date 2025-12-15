Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF591CBFC64
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:34:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC5D10E0B7;
	Mon, 15 Dec 2025 20:34:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="m//mv+dJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="m//mv+dJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E5110E0B7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 20:34:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dFkIj4z+G9cNFTOTG+rWil5noigJu9DAsve0RrdFazUQlDmHup5IQMvR1K75PjRDJ+dgxXO7lkK+YjICtxaFxwVznF2qSr7CbDV9cXeuPxTda88CdXWm4lHMd1anLJ+uC70mWE9coVLnusFFVpoB5/hq6WA2YMq9YU9oSdugI4AdKPCwHxImoySQdeOtYQVsZ1JpowN/VfWCC2efIyobsGngdbtgHs28Vwg4Od/XLWUuGjvTR5MhB9ST9rmflRyKj+QTk+IEblzx5Gz8/uCX2GohuoNCUP0EShNTlOg1V7W6jUz2FgaG7bs1jZILnqPwJRcq5Yi1Ecjs87T5EQeluQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY7xMjTjyFJmbfTFvsoaV53o4EeP+bRCeZIV5FKyPiU=;
 b=kgKPJVbe/NnONwNsKnqG33t0igMrphp58BOpBWuJPtUBu/EaLJFf1e+a1X3zy0ntux8UfjQpFxHGWurOpkt+A9FEk6x1v+a4gzHfoRWIRuNfhbkqXUWQEP/SZH73+4WgUB4tkwZ8j30qvkjohrsLK6aWEnRiTRriCUfFTQhgb+8OCGOR8V7jW3jXJSV1tdS4eHCWP0faAITHXOhexox0gDv/8dU0mUpNB3mIIt2tL2qKDkZuWoL6VmJ/Vhm3BgzmcofRa7bC8FXOLNNakKOgNEiUqmIwAkvNAnIpvoEQ4S4vYVTynE/HBa6DhGLTpmkqPDNAoD7Tg2+BRwI9FW7fMQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY7xMjTjyFJmbfTFvsoaV53o4EeP+bRCeZIV5FKyPiU=;
 b=m//mv+dJWatGwogyPJ/PEStmwWvdPsUzo9zFMXVD6+tbxV+xBuHORm06L3Wzr+uFWj6PcRdVpMZG32L1+UBzDteyZrBlytw+gwPTZVRM8Z42Cu2RrEuddf8zLIpRG6E+ErXEXmYS4tqwoQ/hIksJjLJisDOvK/a3KjfObwggaM4=
Received: from AS9PR05CA0128.eurprd05.prod.outlook.com (2603:10a6:20b:497::30)
 by GVXPR08MB7846.eurprd08.prod.outlook.com (2603:10a6:150::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.13; Mon, 15 Dec 2025 20:34:19 +0000
Received: from AM1PEPF000252E1.eurprd07.prod.outlook.com
 (2603:10a6:20b:497:cafe::a1) by AS9PR05CA0128.outlook.office365.com
 (2603:10a6:20b:497::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 20:34:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM1PEPF000252E1.mail.protection.outlook.com (10.167.16.59) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6
 via Frontend Transport; Mon, 15 Dec 2025 20:34:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDjBIwvNWfBftYaBMkFPpkCReUxXSgHSNPP9UiqQ5OYm73TIV4G7/CSGdKZDRoll07/zzQEOMjn8rwXeLh92LzTaiRBqCSwwf2e4PLFrUCoOxugjjb4Y1R3dqesOVgyzCxxiQPke1XviRI6vgihKYzlQfZHmQefOmqetuDDqzNTiuqXcsxz9SyM7gbGoBvBazivJOvvot3kP2Ho66iLIlQgnqMS2Q1kDa+yTTQm8EA6J+5s0Dy3w8zVSLgrryJe4TfpOa5X1zjapXl6spCzVz4nvL+R+ngYuAeu0MTw2Tt4DlkHDJ0hrTeLZDMJBIVDBT8oKU1YzYd50zbdmipnuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tY7xMjTjyFJmbfTFvsoaV53o4EeP+bRCeZIV5FKyPiU=;
 b=W5hZ0lEnijtj45RpuKAAFS0EEI4q7JOmVBJSJ/7nul1LkeQ5vAVPnc+sW0tlq+Z75aKW4jiJdPp8OKTpT/xLvM5F4nVJa94JY+7yhCUYeIde7mtasT5sQ0C0xapOZDS5Fwj8rRPEGdlniQsUXg5RCme4GD0tvI5W/8geNtNBh3irVpwj3F8tGu1aOjm/pEsUVqjU7/0hrEuPtWzRzapx+7vZOULuo08e7bkG8sRAXIUP436nIYKNOx0JoQWxn53U9Sw38UpdO4wc8ID7HbrtfF0CQPmeLN20gAbSxVZcIagAZdORH38aUeiYEj0uFKWncukZgXUeTSUPw9pKI7oZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tY7xMjTjyFJmbfTFvsoaV53o4EeP+bRCeZIV5FKyPiU=;
 b=m//mv+dJWatGwogyPJ/PEStmwWvdPsUzo9zFMXVD6+tbxV+xBuHORm06L3Wzr+uFWj6PcRdVpMZG32L1+UBzDteyZrBlytw+gwPTZVRM8Z42Cu2RrEuddf8zLIpRG6E+ErXEXmYS4tqwoQ/hIksJjLJisDOvK/a3KjfObwggaM4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AMDPR08MB11433.eurprd08.prod.outlook.com
 (2603:10a6:20b:718::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 20:33:16 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 20:33:16 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 aishwarya.tcv@arm.com
Subject: [PATCH] drm/panthor: Fix NULL pointer dereference on panthor_fw_unplug
Date: Mon, 15 Dec 2025 20:33:12 +0000
Message-ID: <20251215203312.1084182-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0242.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:371::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AMDPR08MB11433:EE_|AM1PEPF000252E1:EE_|GVXPR08MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bcba08c-db6e-4631-efc6-08de3c1952c9
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?8nS70uRUrAkGClg8ECcZFFLY9ZiWp5d9mGOvNv9d0crWBBNPV397eSuvTNaS?=
 =?us-ascii?Q?lTee49VdTHzVuaZR34cwqN+D2KX2KvK//ziZBFVKX1GJzYJUzTrgoNa816o5?=
 =?us-ascii?Q?8yv0RP1Pt5tYIsUzNTNVx2SO4yYAdCTxrI7m91Zsmi6ZkEZR7ecswF2ZQsOZ?=
 =?us-ascii?Q?4DIXsecirebTb8klMJhrAdaHazsXBTTCHM40qph95VyWQNF56j8mBlBAto0m?=
 =?us-ascii?Q?DVN5BFONX+qevqzcVeyy4Kz+lgoZQ1kftPJcsVn7HRLYeGCwTATFmVEeuGWq?=
 =?us-ascii?Q?sDLTVNoXrQKrEW5BNvqH3VX39h+83b43OdpZcb4lLtv42+2rWGsmhwn+K/0+?=
 =?us-ascii?Q?VWEzyMfkvPgrJbM/EHqV1sfksAOOnR0x9nqGX3BpXgGLi24vKaH/B8ukskNX?=
 =?us-ascii?Q?KVm4ZbevMSfbpmFPvbek7q8t5MJwDq0Vh/OQ/cLAGnsHzxnTQ8cX7yOrHqmx?=
 =?us-ascii?Q?IGFgxyz7yg/2aSWfFbS0aMMLjqDIADu7m6ZTJL28pMBawk3nYQ9MEpVdFEma?=
 =?us-ascii?Q?3EtgVQ4Q0DP2f+WWLGKNEH3SPvo7o/DNOH1i/2pLi1udKqfjzSgg6Jvqovfc?=
 =?us-ascii?Q?TGBuAEaeCKZh4FacpyTbiOfZrwl8E4IN5e20YPyZgccnKZ4GvCXpAPo1xmtQ?=
 =?us-ascii?Q?DSpcu2YBzNmo1ieCryfowYRt8tMY9cu/Z1U7O8Yo03yAXMtLifkwhoO58eR1?=
 =?us-ascii?Q?mXrtAoLXSfJZcbzixBjZRzmP1x1bxVCCb1NA5TKb+4hoXNFXrEfGAPW+anpC?=
 =?us-ascii?Q?j2JIrODMlHKUWe027zCoWozC1bt+dFkMvFFI7PXLa7dpL+myw7Wldi40tmtC?=
 =?us-ascii?Q?PWv0FY2MMqMeiDX29wIOojwWj0tWg33wmGDbVQq8CsYLCweJJj4hfxshh+M/?=
 =?us-ascii?Q?uL7v+5b1EdxXYDJnimD4LHrUMCxR2rHUlv2hkchR593S6UkKWQ16IcpiIjuX?=
 =?us-ascii?Q?WRQTNln6Dd2oBvkYjm657KWqCAr/E6cvRls/FrqN5f4kPmEDDa5pMwFWKIzD?=
 =?us-ascii?Q?ekLjXuX8SGB70MQIw+T7O8IXXGkF46eIU6uCKl0ATPPu1RnILywf0H1gp/xU?=
 =?us-ascii?Q?yLCj0EeDvtvpyIwBTL7nTUqyehdRIa0CfxdV6xU2oUOOJpgsiRSq8ZvwWRdQ?=
 =?us-ascii?Q?KELxCqYb63VhjPMEI5eM84Sk5Bc3UjSN10190g9GRX69yVy+/LjhSs5D3E9x?=
 =?us-ascii?Q?RbiHgewb6ce4uq+c5exWfk/mO67BdtuSCxuNkAmCC4BnzZsKGbqkdixTv3Ow?=
 =?us-ascii?Q?5/FesGf5OOZfX/Q0Wk8zcGd44X2nNnnWazyi0DmZuWAZoAhFUl0Omg1+VWhL?=
 =?us-ascii?Q?bG17teZ/zWFdtUztb3rH7dqlMwLNDpfrEA2r4TU+zlVo5bP2urg0Iov7T1rh?=
 =?us-ascii?Q?g84bVTbsh0zy+2thvWX1uX8tXIICUGJJerDM1wsbgiwm35rDp/6qxw+hh0zz?=
 =?us-ascii?Q?EFoJMAnbic9nOjG4rHic8VMyT4edqOtP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 21f1c5b8-2322-467f-2fbb-08de3c192d04
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|35042699022|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a9ojdNqK+ZjL9pRunP91SbES3TMS9hOnGujOU61vMFkpEC7vcLq4mq0f44X2?=
 =?us-ascii?Q?L1YI9XjDmxy4E0yYm2jlNh2DLSbS4JwJJjKrcv1wxfY7htmm2YY9XdM5M2H7?=
 =?us-ascii?Q?ZgDDhZSz6f4L+klffA8+Ecj6Ti5VNIdtNrOlg9s7WxlN0XZM3Nz2BetBiAMP?=
 =?us-ascii?Q?amnRcg1IAKVMMMrXXqa4iAHP5B00tbli/r4xmzIaZdEXRVaXLXGuTlc6e9Tx?=
 =?us-ascii?Q?B20Pk1iomBkLXxWd6LBE1oQ559NKVYi+09o5bXV4aZWOtzv3WyNlQe+JOgtd?=
 =?us-ascii?Q?9RcXmKs5QZXgfVBnKJxVSt1/oBOBHIksJlqMX7cRRlbpvo+aEQOMs4iH8b2d?=
 =?us-ascii?Q?/9Fm30vncLRmA4Tu9rXztxTIX2MZUSoGlF/NK8m+NsbtCMe148p2h5F03NwT?=
 =?us-ascii?Q?7ATLuU7YzGPzPViuelo/vXebwkiVskCTJzOzrhAcwru+eGQQNvNdSyBP7J7z?=
 =?us-ascii?Q?UJbN3UUzXojky+HZvlsrln3z03zQOGiQ7yYw3748sJgIqfTx1MGHfQYS0rCg?=
 =?us-ascii?Q?0o0zZCWfdZTeNgp3DaYMvI6dx4t6YFULeUnAiB8k+n7nYwVLdoiYvYtTggxR?=
 =?us-ascii?Q?fU38YXrAL6FoHL/8KkHeAH2uii5O3o+HIf2F1ch7Deu2ATrUG/XkAEqLnItD?=
 =?us-ascii?Q?J37BVFhu3uaXG4laV7C2QbtlrFY8tVsbr+1B5UyM/jTltI2Ixeenf199D+rT?=
 =?us-ascii?Q?Uj0QvtOJBDP1c/fTRkz06UDmlKExAWBH//tjL25fMv7cMOzaeJrz6aC8szFf?=
 =?us-ascii?Q?PvF4x+OdCyJnSI4K0goxBVUJWHUAxEymRtfo5CTlmixE+OcDyekLXrwMPfC+?=
 =?us-ascii?Q?MmJUTA35zmiyt1Of/9IHd0GufsEOByJ3f1BnXOf0LYVr4m2LiXzKBE1BQF0n?=
 =?us-ascii?Q?+Tq7UCOXbHoGWbUfZbx/Wx9xgciDdk5T/TvtLikvPmBk1cr3jaJfk+wVm/hT?=
 =?us-ascii?Q?1O2ETjVXrczNYpyuKeQ9eqmDINBGECY7THz02wPnQfbDSFarHrQqDve93GpC?=
 =?us-ascii?Q?Qh3mxVcKZyV1PL3srDuAcYVVK6TdSebt7Vfy/nH9xrEiT7btirGj0UvMywr8?=
 =?us-ascii?Q?jkQr+u9H0cK9MUKZvo1yL2ObIGroF20oV56kmN7NwdY73wfp/gu8nl/ZWIva?=
 =?us-ascii?Q?TGSSbdtQ6CxvgTDxToAy9Ug+/q61bg26eE6YuBPxkvitzxJcDSowXALjkRD0?=
 =?us-ascii?Q?/2MmiI+3oVFf60eZBwDHmgiXzCwA2rj1Nz9IAciRyY3wSo6BiR1taEW2/uzZ?=
 =?us-ascii?Q?BXsTMdCdUgGXlpCmxaZVJ03ELeE0dv97PWB6RDCrCbfzz1sDGla2vbg6MUOH?=
 =?us-ascii?Q?noYXyF/v3Az/4aFT9Z6B6JGi1CQg0iHEma3/YRmHTq3NbwhxTq8wFYfSVJCW?=
 =?us-ascii?Q?3wkWtig5Hllu4Ztc3gjKcGsA+m80HYdRDbHF6lUv8zizhZGQ0e73QJzwrFa4?=
 =?us-ascii?Q?FfVul9InbvX6vBTNY4NfLUYqt+f4V3EBRw6Grax1xIkdz2T8Wrl5aKFMD7c+?=
 =?us-ascii?Q?BOPmyOXnPwOafo8JPTN3IulaxI4Nx+KRY0/eD3LL0TU3dgBjHumIOaw7xFZl?=
 =?us-ascii?Q?SAouqf1/l6hUch6ytCw=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(35042699022)(376014)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 20:34:19.3177 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bcba08c-db6e-4631-efc6-08de3c1952c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM1PEPF000252E1.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB7846
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

This patch removes the MCU halt and wait for halt procedures during
panthor_fw_unplug() as the MCU can be in a variety of states or the FW
may not even be loaded/initialized at all, the latter of which can lead
to a NULL pointer dereference.

It should be safe on unplug to just disable the MCU without waiting for
it to halt as it may not be able to.

Fixes: 514072549865 ("drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs")
Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 4beaa589ba66..a64ec8756bed 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1261,10 +1261,6 @@ void panthor_fw_unplug(struct panthor_device *ptdev)
 		if (ptdev->fw->irq.irq)
 			panthor_job_irq_suspend(&ptdev->fw->irq);
 
-		panthor_fw_halt_mcu(ptdev);
-		if (!panthor_fw_wait_mcu_halted(ptdev))
-			drm_warn(&ptdev->base, "Failed to halt MCU on unplug");
-
 		panthor_fw_stop(ptdev);
 	}
 
-- 
2.49.0

