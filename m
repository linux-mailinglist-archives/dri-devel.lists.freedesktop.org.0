Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA01ACB29B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31B8F10E539;
	Mon,  2 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="WaIbgseD";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WaIbgseD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012013.outbound.protection.outlook.com [52.101.71.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BB2D10E538
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:33:41 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=etk/DTqMsWrG+FlvOWaRqc8smI2XV/XVAkASGws9nr0kxBZDgx065u0aV9Yc2ylQCYkUWl6Wpea/jrcS/Bh11UndxuNrK75xZ4joSueX2jlyWlhiXAj+8FslpZ1yNAxN00IToVrIljRcsZkCKJn1t0cbXHzRpVVV/YSkKaOeo87GvnCp8FtfZFmzV+fkBiu9i1l/0bnL7scwc7fZ/AQsw/KSOS5f0ILL4THCow18OsuRomxM5lktG7AeyzOArpeRUOrJchlI6Odv4vX42ZeL8J5164K1YHI4NZoBNMuqbWHyP7fjY29dLMgIRzR/uBpme1R8lSCb9UmAliQH8172ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=YC7xcx8JaLhEy4N2NE0vX+rj1TZ5+2I9u8h5fxqOBXXYdNy1MX21NxqVDzXohLH0lCWkixKniYiJGoNrn2v6cfqnb6VoOqfp0uRXRvbaL6yQEjEPm3fiGmwgsHdz3dWEhen+qMqDhLsOEFQDqv6Hv4TgCBLDWg5U5PvfBVZcxw2HW2m4YFtTpRjLF4sA9TwD2VdC5prR9SgLLaRZwRNG6m2z+fR4QBKhfom89MyhuHq3wC6eI6eioFy1DaPBsVe8Xv0s9C/WnC9/T5BZiVokLxMfovxn1cuhixrE568UFdDhCM7GFqagjn9Fz9k+lvQgU9HIB2pQuml0wmvkpJmCfw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=WaIbgseDk9GkpLTSH7TSaus3W715244IfuX1MuK9ajjSDSH1aj+Xxkc/HB/hjVJ/Ppa7t19yDcxDeb71E+p+ie08YTLZTarqnjyTva2pGdDC+dNwCwrFTQQHK6eOU9/o8Dr9+93yUOuirmZ84hXClJQhNZVu1wF7RvZsq8OnGvk=
Received: from DB7PR05CA0043.eurprd05.prod.outlook.com (2603:10a6:10:2e::20)
 by VE1PR08MB5760.eurprd08.prod.outlook.com (2603:10a6:800:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:33:34 +0000
Received: from DB3PEPF0000885A.eurprd02.prod.outlook.com
 (2603:10a6:10:2e:cafe::3a) by DB7PR05CA0043.outlook.office365.com
 (2603:10a6:10:2e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.27 via Frontend Transport; Mon,
 2 Jun 2025 14:33:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF0000885A.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyftnNgIAmhJe0sCBi9QE6JB4Vm3iK6u+4XgSxERfknAawm31srm7PE9rGK80H3CptSEQK7VxBAIxe5Z0eCPJoSAVs7kCk7wnVmeBnKmbkH7cCvNXN4u81NVtsFzWbY82QUG+XbR62kEiHqRA6VjjxqqNr+AdjaGv/bLDV6/y6iUwsAPg5l4tcxw4zfs+Lpwh+p8poatm+y35jGgXEE0OF3v2udfz3V7+acSCDMAUm7KLj5YfBOnEv3A1bH9YpEvrAHj3jGlWFGM1Hbb7zzYlRGDP7SS+rYN2SC0TLueCSBCuusYZQJI8feEiEQREnGmUC8dAk4bHZVH8jbQzHGRIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=Bk3zmgNaRBnBxVlbH/oTANh+cS9oS6i3rl+Lu4fq1/3GU9Ja1NJPTktwp9tmFEMgCbdVyO1kkdDVVfFw6p33K3edRclmnu6O32rdvrSDqMNlF3AwIDw+s44aH+5XjlM7nZUNN5J+H42CrHRAWiVQk4pYTNNddomtM0kKK9b/bNE4OkLvr2lyEDH1fLT7Ha8YBHGbcKfhkJjmlBCVHFB94I8+rDTYiPv0Zg/CdP58kTWIlKulu8/xYdcKXYSKRcO4/gkXCMbMtZGtY3nc+e55RmzAzyH5AGsPxKuY9LbmBY2VaY58BCW0yA1UBPTeqoIV0ZlW2vx5BblCjherbCaw1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DuIQkNHHx6gH9kL3tvPElLH+YEBSrqOX4WRDMjkUZJE=;
 b=WaIbgseDk9GkpLTSH7TSaus3W715244IfuX1MuK9ajjSDSH1aj+Xxkc/HB/hjVJ/Ppa7t19yDcxDeb71E+p+ie08YTLZTarqnjyTva2pGdDC+dNwCwrFTQQHK6eOU9/o8Dr9+93yUOuirmZ84hXClJQhNZVu1wF7RvZsq8OnGvk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB10809.eurprd08.prod.outlook.com
 (2603:10a6:150:158::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:32:57 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:32:56 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] drm/panthor: Move GPU info initialization into
 panthor_hw.c
Date: Mon,  2 Jun 2025 15:32:10 +0100
Message-ID: <20250602143216.2621881-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602143216.2621881-1-karunika.choo@arm.com>
References: <20250602143216.2621881-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AS9PR06CA0632.eurprd06.prod.outlook.com
 (2603:10a6:20b:46f::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB10809:EE_|DB3PEPF0000885A:EE_|VE1PR08MB5760:EE_
X-MS-Office365-Filtering-Correlation-Id: ca2dccd7-0caf-422d-eb9e-08dda1e27470
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?fj627r+/LqZawO1Fjxtuu0Cda8Sm7/GowrQPiOgBjNysXeG2CYOP3b77k8cx?=
 =?us-ascii?Q?xXY1j5L1emYNdglCKkwjCNBfm5nPXxgaDD5fBsJIMsaP87/B5O+vrCf9pmYB?=
 =?us-ascii?Q?A89YQjn+qj+qpF/JL3E6g7/N6cCZL0wYnwXgHZL7tfH+rAzU14+JDkzi5szj?=
 =?us-ascii?Q?crEisz2hs/vxrIIY6dEKR+v9TMNDbkfe1pgrVWR4WH7eGFBhMVpmUPfdhvH4?=
 =?us-ascii?Q?Mk9uHswYZED8Bk2xz4M5GkIIpPp6uyVBFHKAjMooej+UoYvkzrP2qHI0ue9Y?=
 =?us-ascii?Q?q4OngKqAgBJIYilSQPubRz1XkS24u4cfpAw1JhuMKSLss/U6gKaas4WKgvwE?=
 =?us-ascii?Q?Jq31H51xqRG1k9Pn3zg+cNk1KiRIPNtP/wouCZdovAA72fiS1IxtN1K7aCc1?=
 =?us-ascii?Q?RdY7fg8Gkto0Ary16b48mdKpPpPjlDIaD0g6NSavzTCV2ULecTNGTqK0FDeT?=
 =?us-ascii?Q?UyIUSPAbPNnYqK9hkV4wF+sjW822YLwp8IhjIiWWXK99qbTPqlSGxXkx7+c3?=
 =?us-ascii?Q?m5sJQCVTBLNe1lKP3rPXU5T6fDf/WH7k9Inp0KLS09FLnQhXVBaJ2bQmRfTa?=
 =?us-ascii?Q?FKHbPwHmu0pPuNvJhr4HwlVhR5qrpuatahTXeVSE56srDOvQgygcd/JgcuHU?=
 =?us-ascii?Q?2s3Yg4g/LGo7RRY2s31s3BJXpsgSJNpbPQpXSyiUY33Gw+2uoAlEZgQTQ9S5?=
 =?us-ascii?Q?04W4Eh/09U0aDYML9pRmoLP5j8oLkMixo9l68rzGzgXTiG08JbelxjWMYnyt?=
 =?us-ascii?Q?/GyNFR/x6hM45aCadP6M7PO6dniq/r36Sd9bChr/HD4yKSsxofHwXXAiZWWD?=
 =?us-ascii?Q?uYcXUc1WqfXOwc1gtxzg1sArDj8WX9rAR87hBJHBDalHdZhDfYirTTdf3KN+?=
 =?us-ascii?Q?HVVn85iIVFXwzO8UFadE8DiPYfchLNi7C9D0SKQ8A9te2AXbytL6QpgugVWY?=
 =?us-ascii?Q?uKWV0CCEkijFnam84coU+vfTMYWy5i5JPOXl6bSK3rAKFv80wAC/nG90fi5z?=
 =?us-ascii?Q?CIq4BOHoH8eEQ8yf/LGR8x0YsSAo6MtyjM0HUVzlvLxAG5kySKJlwIWXLkQA?=
 =?us-ascii?Q?6XYAQhqlyH4l7fwmFNiRg0u1J+OAljcnNxFYb05lYP4IzPhNfrqVCx91m4NS?=
 =?us-ascii?Q?2KqyR0PleHwlIoLmW24oNJlma3ouWi7aFT0Yc/miht8PotCO94hn0Y8QvAmw?=
 =?us-ascii?Q?Mgep176METIxABN5Nb1u1yOmnX+l9BOiy/dFbeLUrY4Wem76Sr4fEV/7LDVy?=
 =?us-ascii?Q?7+DmWOTIy6ueMPpA3JEOBPSIKdgfnSb7CwuIftTrwfw5UTEifTC70uOHGn9O?=
 =?us-ascii?Q?lfBAa1cJGFXSdph4kpUU+tLjD9wR4NCaCltuZOAQ2Vnox1dBrk5lXOk2ZJgK?=
 =?us-ascii?Q?XXxuw9u5ETZESvN0zSfctYSTNYT8Srm+MszWsVl2IRRStHnVxg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10809
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1289f88a-9869-4d67-8477-08dda1e25de8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|35042699022|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pXE1qKBuGgSYcTvQWa/XHMdxXXhVd/ac3i6z3MGt+vNcBRfeoFH2SpRHWR3i?=
 =?us-ascii?Q?VSBuNv9irtQZFiqWDdrZmY4gC3SD8SGcAAQqOGhpwe57aY+8kWsrhAFv+ygA?=
 =?us-ascii?Q?tz9T8Z7DrR0o3DRpgZldcKjC1znqi13AW6Q6AVU0r9Y6WmrQzm9prrBBKAHl?=
 =?us-ascii?Q?LsNTXOJVKuAilTrnv3r8+dURce53aTeP9zjPY7mKb/QDJEB959GGYwxLn1WN?=
 =?us-ascii?Q?zfokrqB57GU67TFEn8jeaT3M5S4cXq8gk9fl2EPFiL7TrWX87XebOmamC26x?=
 =?us-ascii?Q?QwHKs+soNeHDUsma4CQhkqFvarcgSkBNLJBEv+w8jyEzs8MUTamrWSKM5psP?=
 =?us-ascii?Q?GwUdussMdBQZEoTg6JQcZ2Ieb/z1k12oMEwhxP5Xjjzv8w5GgukvH+cOnkkB?=
 =?us-ascii?Q?1ukgRtX2Yr3tlq/1ucjyfl2x15fysn75EQQo2mnARDt2iWpQQM4obk8/lTL0?=
 =?us-ascii?Q?uHE/t2ReyIDyQOOmIvP4Ea7lpbIxw6tz4u2zjeerb1Vns2CA6TmFZluyX/ZU?=
 =?us-ascii?Q?NSJCMuFtP4tB20ctP99m3cnfXo1taB4DV7po/PukB68MFYiaExz+ZjGQMRr8?=
 =?us-ascii?Q?3inTMSCU636X70tM8kv1G0wjBDAe9Tcrbr9bJ9kDLg7+kEvnJd8Ys4DXr7Rd?=
 =?us-ascii?Q?dDCkEuHmFvPhk7r/rIP7VuZSZaIme0Xmm48JlCnllKZoZKdauHZpU8AIhjUk?=
 =?us-ascii?Q?ZZFw6EmAg8Us0KG+3nZ9PUbioaMxT6FPpVBf1cHgbNkDQrJuNnIeeS6JclAF?=
 =?us-ascii?Q?/NtQWJhIqwwTgKsE6Y41GYDL8lAmUrbpOGfr3J0YxrNklFUO3Ezo4HWyh+wE?=
 =?us-ascii?Q?ExVwXT17j5sH7kw2Cx2Gu7pe8yjIyB7gxZoP3t9npIu1JXPo/DOyIF4UPO22?=
 =?us-ascii?Q?MqKQmCjY1wiK8w3GSUKu4wLiSebDOHMC3Z+WHDcQ2PW2sLtsdcstAHKe5bfr?=
 =?us-ascii?Q?h2n1rHemgZt65Xur0+vc7wyZPd7ZAVQe6QNAeH8UNSa8EfXLd0vCacysThJO?=
 =?us-ascii?Q?/XaK51IK9nGO2Dj9KYZwrBIC62Cvvx3k/H1oabwVeCEjb1h6jsU+orTdO/G7?=
 =?us-ascii?Q?D+BoSAU5DjLB0/8Na/ZALu1mwIhy4JPpmwJeVgXr73SEvALccBoS8K77xi5y?=
 =?us-ascii?Q?OHC+AgsnosDWFM5XIJMy/oGNGjRjX02WheHxd07+hBM9h8JNdV5SpTjhuVHu?=
 =?us-ascii?Q?3eMqykXOmcCSZSUB5e3TKa/NI38gjcnyemMb/nq8cwHudEVE72Yq2LEAtHmD?=
 =?us-ascii?Q?Ca0VhrYYRcQQNy1FgnI0NdNplNvBmIxkPrufxl9vraaQAXw25jSDaVmEZ/cw?=
 =?us-ascii?Q?jNTlwjjhWqrs3HYc0AI9EXZII0NSToQuvJUw4DP+WvO5EFk0ntjchWA2ARYR?=
 =?us-ascii?Q?vPszlniSeC2fyZ5WN8zCaeMqKteMxOhwEJoZyl3X7tAEoUmBHuovFzC7EXEC?=
 =?us-ascii?Q?VgegXVUbsuVzEuffdyD6Nqqd5VTv+yoKn8a1TYeoTOgjk3TP8SRs4eQR0G24?=
 =?us-ascii?Q?5aZmYQ4s99kgw1YTry3y0gj/XaESxFOUBlU0?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(35042699022)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:33:34.3643 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca2dccd7-0caf-422d-eb9e-08dda1e27470
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF0000885A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5760
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

