Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3260FBF0110
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 11:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F67F10E38B;
	Mon, 20 Oct 2025 08:59:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Ey7T6ny8";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ey7T6ny8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011049.outbound.protection.outlook.com
 [40.107.130.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A18A10E341
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:59:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=OKumbHuEGK3n9PhZxf7vCUyF5PCukSiBg2lIC4QL6bXDJfg6K1sJC0t8QveTlSZ4HtBom1jVjUDv3/aiDx8wmTJdef2ZPtLNIF+q/CYbH5OrFC0XcUaqw+KOoiAoNvXbst+idf7taV9upbRC/xr9QCg+CJwYF83dkRvA6kYr1yRXM94N8MVLvYiBm/X/41UX+5vMXgQrFBBMSJz9cbVsHJGhpXaokBOzd9ITbYGStCjoqXsz0SwHqJDjr8b2fTh0uCqLywpMhapvb+xyFpUoTRihtkZLWUyWwMH4S+ux0mWHpz0DAYmZhN3T/w/wlmolDcMzlUWgoEK+VBQSbb7/7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BJZ5DjRNXMrFWHg7VHmQXBMegt9/b8HwQlWVEpk2sY=;
 b=VM5uAXqyiAmPhLdA3yE8aYjSCzNJ5NSwHTyIN/VbPOzdxcGrTBcdlnU2VVA4vaJIzRK+Mrzs2+xocX6dN6OR1zJzzlntRDtw6eecw7d+PX2jWY9M/kiQUUm0493kjNl9DBQfPqGJUIR8gMrknLljiqorCwWZeNQ2xQTW6uBgFbPzsrtaFFc5EDRsyKx/uR6m8JOhXjXOdkvfLV760ar302ckc6O4odqNrJjB8ViGHlIbnkpESi5dmDoiM5HmG+HnSX2NFomrbpwia5Izj35k7nEZY0GUznuaQ27HWJ4Xt4uD/FpF9MuXAGLu5NK1jUfFMS9A1aHSpTdaBSCUcc7VbA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BJZ5DjRNXMrFWHg7VHmQXBMegt9/b8HwQlWVEpk2sY=;
 b=Ey7T6ny8mVbfu5QraYxPvsxYC10uUXzvT7aY7G2JkPAlWSSgjfZ52P9lyLudV6eV1RyDPBN1qWT2p0UPoO+ul0wdTBa8TUKk9wZG23jacOTvxc5VkJd2mQl22/VBUGpX89rmSYRatX4EqJUw6w+kA7xYtrtaGb9XvYi2cdgjuv8=
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by AM9PR08MB6036.eurprd08.prod.outlook.com (2603:10a6:20b:2dc::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 08:59:53 +0000
Received: from DB3PEPF00008860.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::1a) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.16 via Frontend Transport; Mon,
 20 Oct 2025 08:59:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB3PEPF00008860.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Mon, 20 Oct 2025 08:59:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hsaZRADWuAvJYbuXHRdoySOcjHwESuqGuVPuPKhJzrA88Bhenc+dqvjnMwdDGEL1cY1Ed0ZkPWNlant3buWy8Gb5J+x5gQiidqkEAa63ahcIFjqwfhQcNWw9arx1v2rqoGdeLtoOddxfr4FiaCCl2+8KSPs7vqR2qwDppN04Gy+oZVlwNU7UhTk17II1SVh7ez8pymlWhEnA1CqNU+U/T278pxy9RAbE91k1s6Qhx9YUqPpMatpdg0fAxW5ub/bufByUxDkfjlXL4uG5nR2PR9rA/fe6Ec6p0xNEVfOWn0MCrV3XxpYjBYWXSkJkrVl/2sGlfJal4Pqsf3KVmij9WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5BJZ5DjRNXMrFWHg7VHmQXBMegt9/b8HwQlWVEpk2sY=;
 b=oZtdnls7y5+sUySMk1IDhbxZD4GHBqmpi4mcLGkVisE3NY0ZrCMKAxI2TrsXWtMZ002e9DDqCI1R2f4apKyM2QgkiX+Pa0Q86ixdW0V4wdcOYxIcb4HlEd5Sx+5WdyWpaC+uVkC9zI3UTRYHxDswAfWevCY9ME/dBlVJxQOWbjJTs6jTyf6E9rgl87lOjnuq4bfa7EhityNQdFh/EDWcMrtxFCUkLpczYVr34hQ1w0+h6+aG+1IP/fCpdG9K2nCQXZzLJbhf1JQ2k0MRgtT55YD8FnW1JAuO88eapsrBz9//cH87jZsqpiZkSbiHSq4GXgWwxfiGeCzNn/P7vNwT6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5BJZ5DjRNXMrFWHg7VHmQXBMegt9/b8HwQlWVEpk2sY=;
 b=Ey7T6ny8mVbfu5QraYxPvsxYC10uUXzvT7aY7G2JkPAlWSSgjfZ52P9lyLudV6eV1RyDPBN1qWT2p0UPoO+ul0wdTBa8TUKk9wZG23jacOTvxc5VkJd2mQl22/VBUGpX89rmSYRatX4EqJUw6w+kA7xYtrtaGb9XvYi2cdgjuv8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 08:59:20 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 08:59:20 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH] drm/panthor: Fix potential memleak of vma structure
Date: Mon, 20 Oct 2025 09:59:14 +0100
Message-Id: <20251020085914.1276090-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|AS2PR08MB8695:EE_|DB3PEPF00008860:EE_|AM9PR08MB6036:EE_
X-MS-Office365-Filtering-Correlation-Id: f66a7336-e83e-4237-ebc7-08de0fb70896
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?GZmIylzBIHBKk2TaBaucBqUD/GW08Rz8Ti3niwxsawYfhvYia+tLP0WYj2N1?=
 =?us-ascii?Q?/fw+HLMnybZqL8CumLgj5oz8+pzO5vE8SonI3WugxovwmoPrLtqJF3QX8QkT?=
 =?us-ascii?Q?s8U1x8pPdENyeW++yjMikPaT3oDp5ZZHb/sLdflpClFs2mEqh8yFl0MO2/yi?=
 =?us-ascii?Q?Hzi2u4JB6j67B/2p0slfBSd33948Z82kX4+czvpaFObULDzJlc2sU5QyA8y0?=
 =?us-ascii?Q?TDxl1KSdVV/iEJpN4YDmpKRevLY4DzgLG/auFiCo8lZIbBVy9vHFfbGIMnXy?=
 =?us-ascii?Q?7axBYD3Xn6JvTOMSTE0LTmM0tUZOP4smGJrtYl4FAKTQ4/Rs2dYGrEuaZ965?=
 =?us-ascii?Q?l35lvJ617pZ2ALizN0IhY3Ayp6xo/JTOIjTn03cu/phsAm1bWqFOOUmbhoyy?=
 =?us-ascii?Q?eQLG98RgW1jrg8SJoro7FKauo1+pcP36JDwNcg1vPAel09pBuFInJOys4+kM?=
 =?us-ascii?Q?z2suRGNZekg1H4QZpodtVhpy96zLv45ZF7jjxLX4FYPqFc726p0Fap8zW0io?=
 =?us-ascii?Q?MFujtGoj70rnUlDMc/Am8qzzALhtGLWUgQXDN62Sq6CJAx1vAaaKPmP1W2R6?=
 =?us-ascii?Q?0SMb15uQyJzznU+SGNT0bYd0DsJX4CNqjBVQUJ5oG204agwbj77wz7seCJqV?=
 =?us-ascii?Q?hPXUUU6fz3jk/K5RIkDDnZhKJ0xbaBcPdQ+F5Kq0VGaBEU18g3JN37JUT0bx?=
 =?us-ascii?Q?+j6cPfZp79lPGgkuh0GZHBzs+sKVadkPlQQT8hYvS/Cqt8BauwlvCT+q1+Da?=
 =?us-ascii?Q?Z90cPzt2U/ZyE7XdjGO/8mEkaD1mX9jksHzX704VR3lxNkQmZV/3gsCcs4au?=
 =?us-ascii?Q?umypyNEMYby7FhUrCb/PQLXXiI2NjeMCX8mC8TuB/+B57Fkmpo0+TnLXfN0r?=
 =?us-ascii?Q?X7AzLVtWMdY8BEOI5NVR7ZJna0TMuBPYPEmelu3Cv31E08FonsXF1AhwuHT/?=
 =?us-ascii?Q?NBRsLXvgjC3ftJ6+BfPsWwAgERPqCp8KVoq/kfFgLRrs1ct9UhPfb4QM5i9D?=
 =?us-ascii?Q?BVnLMFSmrngDUZ4ugKkpawOcM7nbTb522bEAq1/hOa0Lb1x6c4wwRlmpTt9q?=
 =?us-ascii?Q?jWyF2g0ezma9FeqmXkxwLjSbFBkufVozHnuxe9bVVxLwZk7kpi6N2xg/nwfm?=
 =?us-ascii?Q?7ukzykTOKtpnW4Wc7L3VmAEvw0vgQq5mfQfIrUejoaQ7JYw8XaGz5Fvcch7e?=
 =?us-ascii?Q?icu9CGz1XBG0E79s7PpyGi/Z+QVHSOjQ3+qLGNlECD7VNy9vx0f0/YkBrNsE?=
 =?us-ascii?Q?M3AU6f7kiqv7pMl2+0SXyZNKPFfOVqD+1J3ZF8/S533qizG2/+GpO4JqGXKc?=
 =?us-ascii?Q?UMlWxgVQSNEU/CS9WgRfJhx1Vn9eZBJ44TfjBrCnwiurQggweb/92l4sAnhI?=
 =?us-ascii?Q?zV1PXSGIyUg3bX8hKNGTEZnhHsD2E+l7M9d1GlXBIdoOmgNn5TfwekFd7A73?=
 =?us-ascii?Q?lpal+bPSZc8IwyzVtHK1ebX7/5kyYYiQ?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: e60ed285-5bf8-48be-5c1f-08de0fb6f4e7
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|14060799003|35042699022|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iHnzLzRJWquWDX5V9DgbZAGPtUi/7q9ZU/3yB1t633SPXUSIyuHud4Ovk8Gv?=
 =?us-ascii?Q?BhDGbl11GSuR3mHorxsyku1iUjV1vMECdcfLZ0XjzY5KtGcGCNd2QGzT6wdV?=
 =?us-ascii?Q?uvFKprXsnGSBQHSdP+9OvegGWTR+Mkw+6TDbGJjAT+Y15arb3IJzw++Sw0GY?=
 =?us-ascii?Q?KFNApGjgUEGAl2iQVrmel1L5r02P/HBVOWRpSHO9f8iMmzNL6feTSCxhdrQn?=
 =?us-ascii?Q?g27tovlgUdrDIA2/I8V5LkAqtEYdN0Yt0C+lkSj+ji1kbDzizf2aT3X3YfXi?=
 =?us-ascii?Q?kn6wa4bxafr5Bglv8/Dzpph+Kwaayusvim8RALz5bC0RaqHeHgijAK27vhf9?=
 =?us-ascii?Q?tHmp3+8+neYxU1QifVCZIV3WQ3N0sEXRgAxk1pfjpI+95YZcrRW5LeMJxt6d?=
 =?us-ascii?Q?FIVEROKT/pfFtdjA3FgZf7vapc/L6thQ+ybs5wKkUkFTqPWQL++7aY8/Tq5G?=
 =?us-ascii?Q?MM5AL1cwTgctMabCiTrHHSLA8e2E4UQJzyoiSFdGUZC3Zo/3yYbU6V4BleDq?=
 =?us-ascii?Q?+vNB75emihey6t4jeYjx2Ebyj3kiit/83OzpQmWEYaaIHk2kW5xgsYmjwQ+m?=
 =?us-ascii?Q?5Pn2hTdRuym6Gu/bJT+IBcYJ5Xt19SQ12YdsrC8C1MFeIvzjruaRzGWVewD+?=
 =?us-ascii?Q?VLz7bTkejirPxjhu3QjuYHJCIQ/riQyu9tYx7mdT9TjUe36BaCMJHLZJhdkZ?=
 =?us-ascii?Q?mWjVirny9Wu1gOCbLdIZOzHpDWD1pLKlVF8xk9FZy32rD+Ien5c9ZI+C81or?=
 =?us-ascii?Q?QFwCDHQ8B84UF5ltob8Qiwak4wLReBFdi0ThT5/fC8eDOGUAYfk4iwMDNyLc?=
 =?us-ascii?Q?gXOmDGr7Liuz09H/19G+AxFcdnOO25J+X4qQS2ASlI7JFlrDQ20e6fxfkm3H?=
 =?us-ascii?Q?JdI0+41sEQPI6h6iGQv8seUUWvi3VgnSLCrQm1qaY9K1o7+6ssk+2SjxybvG?=
 =?us-ascii?Q?hUJUnpfJFcWRNXI5S+GTWZ3ZG1T/uVHlXRNE77lrsuol09tIwLnq2rTf+lU+?=
 =?us-ascii?Q?u11X+bqw8xcb3qEPk2Zkbohhg/2xv/a2En0cIzIrC0A0J01F85wgDrwlJrcL?=
 =?us-ascii?Q?reNcUw3K5xPMzoVl+ZRHreE5Wox9mlOz9RM4tDrWnow587X36XwI/CG4O+WF?=
 =?us-ascii?Q?5gx7cgEmA/VkYf8LYGck5KqV74+9T8QOdmCDY3M79jTJX+XMt0kP/Eap9G/p?=
 =?us-ascii?Q?K0rFTGRsu65UhyzXjx5YdnzOiO804JuP+5Bt6ob4ngcZ6/+ekcJYjTuaIRw3?=
 =?us-ascii?Q?Q3QB98jYF+pls8QpfwPmgUG1GJfc5mVbxvLWAYH9mPgUYSQfABE6mJRHHkZN?=
 =?us-ascii?Q?QEx5csWcU6rK7iovppqST+F9BF2qUoMH33HYXoV/F0m/7d64URKBjks+Z42p?=
 =?us-ascii?Q?BWydCRRt0rLTovC7xcawue+24B2XWHBnkyoUtxZNDZIbSt1qngf+q7LW2zBC?=
 =?us-ascii?Q?/0i+lAUSjFM2pytYMBz7ikTNgY1Sc/8uRNYTCboR5Mshyu0SvSEZD8pgCVO4?=
 =?us-ascii?Q?K6bBzd0gXsyQEdREtxwJKatVJHJyeAzhx3MIWQV36IY/gCf1DT44+nk5YI/2?=
 =?us-ascii?Q?ucPU8Q9+QOSe6sQnUYg=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(14060799003)(35042699022)(1800799024)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 08:59:52.9750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f66a7336-e83e-4237-ebc7-08de0fb70896
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB3PEPF00008860.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6036
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

This commit addresses a memleak issue of panthor_vma (or drm_gpuva)
structure in Panthor driver, that can happen if the GPU page table
update operation to map the pages fail.
The issue is very unlikely to occur in practice.

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..34a86f7b58d9 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -2081,8 +2081,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
 				   op_ctx->map.sgt, op->map.gem.offset,
 				   op->map.va.range);
-	if (ret)
+	if (ret) {
+		kfree(vma);
 		return ret;
+	}
 
 	/* Ref owned by the mapping now, clear the obj field so we don't release the
 	 * pinning/obj ref behind GPUVA's back.
-- 
2.25.1

