Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EB3B0C26B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jul 2025 13:14:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B8310E50D;
	Mon, 21 Jul 2025 11:14:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="NgGV5mKl";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NgGV5mKl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013014.outbound.protection.outlook.com [40.107.159.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CF910E4F5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jul 2025 11:14:37 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YknBaxRaQd8o1ilPwolH1gOT6sCamriNz//LTdEDS/i+GHGcHx69ViclqwRyC6/QNO2PmuttB9U86HxecIfqWC2ipChcP3h5F9bmDbX7dceBCoWqqHuQ2NU0c69Au72JhGxShPnz5nBFXEXQAq1ITLB/q66IWccjSyB/+LBrRlxr55IUoCSM5wsyGwBqoP9pimfNe+8WRGtLb2QwYqb5kmtZzYihn2E2xNmAJhkp6zfong6AlKhvqEVvXNVwRJydsfcOeZQwwDGF1btrb9j879gEU8SkNVozEtNi+Tmcd4NCxl5LehgjP8sithBnrMIF07LtApd8xi+Ghrlv6X9uTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=kaNzZrtFC4njQpuuF/qbH+ix/NOu81sXLSbRSBydAiytBcJ2tAjr/Esarv6bpOI3biMgntTMSGjLBeF8MvdT8E97H0h7T9lGExgykBjXPiBjq9S9RW83GAICYwQtOGwT3Hro7HXwQ2DvRQvZTovR/n8JO+vfzK/xlBcQttfXjAXb2mnGqpKyu3fndczi0xSMtq+qNAKnYLHuBSEx7OaVsES2ii5QWMpfaeQMfUAmiB20e40i62kknsfxqLCWQMJrS8P/+6XDBUl3BlP6jivmPYEmkdgOyhrdYD5+pCU1TVrt7N9/E8u2CRfzlMmzi6VgMAGpaxBNGxWeQv1MlaTwYQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=gmail.com smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=NgGV5mKloAA7MYwWHaup0eHwXK2w4czAQaSEYcV3x1gfRLMo4mOBaDFeEP0LjmcHkd7qDo++0PJ9Nt+K8odpnF3fD8VwNE+Y2ouEGg6O36u0SUTC09m9r3S3B1l6e08tj4UO85Otbq32C89t5biPwA4lmtLMrAXvn5Jwp7+9Qcc=
Received: from AM0PR02CA0111.eurprd02.prod.outlook.com (2603:10a6:20b:28c::8)
 by DU5PR08MB10776.eurprd08.prod.outlook.com (2603:10a6:10:526::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:14:31 +0000
Received: from AMS0EPF00000190.eurprd05.prod.outlook.com
 (2603:10a6:20b:28c:cafe::75) by AM0PR02CA0111.outlook.office365.com
 (2603:10a6:20b:28c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Mon,
 21 Jul 2025 11:14:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000190.mail.protection.outlook.com (10.167.16.213) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Mon, 21 Jul 2025 11:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4Nm9KAC5V7RnsTDy6yu9o8Tz+p1jvHpqoCHmMINM9qCOb+Z/NY9SwH5jpGabVqfdsWQr832zjyXjVId0/Wvjx8GG12OATZn58jkB0uUh7ALhvqYu7a0ymJfpIWcDYpQTMNNLzC+RJps7AC7Y1EOxMRvp6DPWnL/wdhFO2s4F6FqEKMop6gw83xhkgp5wsjx0NaWmDNgRERcjDyUXyM7KhN7usnUjKTwmWM0Z2s0y8AdQyr0L4mKQZyEjKyV9lU/57mVtAqenU0GfQB5v1o+Em97uaoULlKgnY4ZohTBVFXHiKxf35QcBqa+GR9rJFNBrIpvba7lI/ifaf5TIDPk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=E9CWipTWUDPicxQ8KWRrBGAQkVasdRqnbCUmZ6J5fgtaOh3lS0g/L3iP/GF0ngnM+bqCquzraeYVZXX9UYCg7WG+H7CFy5lJ8PnmkiGsCquxcuD0Pz/5Vt/cw/K5/cEf8LFPpXITsvqXcMLiJJg4rRolqNoMrq5hW5bYTXEYiwX3FqIVQphaU5F7SmTC/nds9ZXnIs0/f/Q9BcxXCqfKjN0wGnf9+LfolWXZf9nebvUqGZ6kyx6X00IrwRYmst7iMDszJJcTYPU9fL1DKtwXaCODocCmsmWyddoiGTJk5C+cogiiQW0CZACBt9wKb65PvAoSyuwoltsboPK+kd5mIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U3mLYbmjk2MH0v3Fu0d7rlY9sW0yLOx1AO+9axDDnLg=;
 b=NgGV5mKloAA7MYwWHaup0eHwXK2w4czAQaSEYcV3x1gfRLMo4mOBaDFeEP0LjmcHkd7qDo++0PJ9Nt+K8odpnF3fD8VwNE+Y2ouEGg6O36u0SUTC09m9r3S3B1l6e08tj4UO85Otbq32C89t5biPwA4lmtLMrAXvn5Jwp7+9Qcc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GVXPR08MB11012.eurprd08.prod.outlook.com
 (2603:10a6:150:1ff::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Mon, 21 Jul
 2025 11:13:55 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Mon, 21 Jul 2025
 11:13:55 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Mon, 21 Jul 2025 12:13:41 +0100
Message-ID: <20250721111344.1610250-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250721111344.1610250-1-karunika.choo@arm.com>
References: <20250721111344.1610250-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0044.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::32) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GVXPR08MB11012:EE_|AMS0EPF00000190:EE_|DU5PR08MB10776:EE_
X-MS-Office365-Filtering-Correlation-Id: 74a1cf62-db48-4d6d-374f-08ddc847c357
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?mumhzevueCXdndXHQmmCowwYcC38Ije2uhsNumLkCJPoRSKWobO1WwX0EPX3?=
 =?us-ascii?Q?xHJmv7JlNXem/ob1bV6ZRT3QQX78i2cIAAtwiFouvjXMnvk4Uk1orATTelJB?=
 =?us-ascii?Q?WSTc3Xg/Qhbqr91ra/PQ/dz1tx0OIKw6xTbvGc4HJIUJ1DLYJw4hWE/U3Ul5?=
 =?us-ascii?Q?fs2HF7XElUn57dIPXn+3EhgHBnWxWQCBZ88jIPuuEww/LR/HdoGf3wHORGPq?=
 =?us-ascii?Q?yuHhn66NpYUUl8mdTzrOVOtBECb9y6MJ38G5slAFbzKdNacz/wzn/lJQRQe7?=
 =?us-ascii?Q?OG4NWfFazGgZGG9H4OJZk/2dRg4oeUnG9ad+VJu/9OBWJKAUBVUTaeyfA+lF?=
 =?us-ascii?Q?Qj4rQjSYl4Xz8uTAUyvIU4Szhz0QQbhsq4ktMPabOZFXRaRsvr06fEcK/K2+?=
 =?us-ascii?Q?dJ3my4d+iQebFfQiU2eKFy0zEKVI3X8LSdoNT9P/yc+TDRF3uRgsK0MS+S2h?=
 =?us-ascii?Q?jK3R3A9LGYvGZABIQ2OZw9W7Z+0kq5YdN9+2xIOFcC+i7HgkclS7CG+zB+oC?=
 =?us-ascii?Q?qmRQnOQqezGTgqidd/oFUt39fSIQrJi9BGQm+r59HW7ueR1AIVRAE5q6Jxyc?=
 =?us-ascii?Q?u9cuhTOPcTXqP52N8Dt9Zi37iZAojwBzgZ/WKC3hf2ftnk7+MeJKLdyODHJJ?=
 =?us-ascii?Q?svLPNGuaosnPtDEF1qRf9warHMT6Au/qm5eeh/O1r+NnoynSrcKho+s13OQI?=
 =?us-ascii?Q?0jsigl19KNPK9h44KGvG58KSnyIBRqvCVRn4tB+ojq14i1r4mZzWpmnInIjV?=
 =?us-ascii?Q?GwG19+bD+GZDb4j7SEQSr06NlXSs0Hm2DCDuN4LK+mYxpQbQenFW5ErNW3VS?=
 =?us-ascii?Q?3tJqR/El3MqrtLsBLsQkvQ95iR1ZM1HogFxUAd5tLFe+RnjpqeWadMKor4fB?=
 =?us-ascii?Q?xe9pNXhGnVJfdMfCWZdZSxXe4Ou1Pf2026wGSfCRYCWh9JUzPn9usCYf79Oq?=
 =?us-ascii?Q?HDOj4YeMM2TreiKObLum9H2X8VkStLtEdZBRHc0t+cLRv7BcN5Qa9arKOmMT?=
 =?us-ascii?Q?dRmiUa4lCGlflSYSJ/qgmjFSuHVDDjzDA9DOdQ7eeGCmgBfUrzoNCaX2fsLU?=
 =?us-ascii?Q?dArvIMLwNB69IfUBrNlshV8YiWrU3te9fLWNnn05Cj8wlAJSRHRnyLZft/T3?=
 =?us-ascii?Q?v9Jkh/g0Ia/J2o8ce4H+B2yzgnpDox+/2Rcsfm6j/TnkLzuXCiVlPaZXaNKV?=
 =?us-ascii?Q?mEe2BFa3fK2CN1DCH2cY0/KAB4red//czaVohonii3seUoI8deueOLDySJcz?=
 =?us-ascii?Q?+bLImOJEF3nb8KAu2Se0PDyP9lC2GeTaf4fevBE90/Ijzhi4Jt5Jk1JLILh5?=
 =?us-ascii?Q?KHvluh2PefJycaKtrdnHloWbcPc/K8XCrAzcR165aYUXOVBtZ74uYOJEVuhP?=
 =?us-ascii?Q?hqcmqRQ6gEBdE3+/9BbNelEDtD+O6fSqiLC01eB/CIR1mLCRw4Tr8TZRJ93j?=
 =?us-ascii?Q?J/Hdr+IvHXI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11012
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: fb560b11-2e43-45f9-4ab6-08ddc847aeb2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|14060799003|35042699022|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MrxGPYyjQk/ANjURiRdlM3vr37hhg+hHFEFIffOkWFrP2leP0NleKRd2lFGS?=
 =?us-ascii?Q?+aKehRsyktbiZFWPzhKtk37MS+C7wXTc8SbsZz4Gt1/la8kFT/PdQX67QBp4?=
 =?us-ascii?Q?O9wiq38GOfRxc+Pkesf6tTpGPX+ypl3lGUBFJYGxEMHc5/fOEROTda6rRtww?=
 =?us-ascii?Q?ohe02LbfmQZBxAb941mYJ0Sgs+m15Ja9LGC6GBmsl4y8mfVMvJIVTwSsKHkQ?=
 =?us-ascii?Q?hf97VgxNuNm35KpEB2efXZYtgeXmG/NesaOCtG174xouejj+M0LmI1XthnAs?=
 =?us-ascii?Q?sWOxvBeDVvz9hFkDOvaRN1u8l0c8kdXWlT+x8zlz2xNNn3VrfCONcsCbj9F0?=
 =?us-ascii?Q?V94Xu42hcC33EjNO7NlMcevDBjqmJz4/5Xm4tD13dtaYkhdyChonITdR1Rm4?=
 =?us-ascii?Q?AJw1AooNo4QGyMbOcRGt79CxuiHkcZ9D8vGg1rt3y3+HD6LMg4Lx70YaefcZ?=
 =?us-ascii?Q?arGRSbD4tzW9tlq91p+Xt4oQNNVUaGHrUvpVLm3mqqlC6XMVXaed8BiOsLNt?=
 =?us-ascii?Q?El/zJQhir/bWAvu2oJwvMG2xuMIJDf6szbVLp+V5NdtokskZgASmWjJbsBrE?=
 =?us-ascii?Q?OejjvqfEyVsaSS57JVkdGJPBD5R4mjD7ViLXfzum8yFaR4XGI9CFquEe0RWF?=
 =?us-ascii?Q?sKwYZnDniF1v/HB1zNNfXpc5UMzpux8iBh3RNMO/COT0o2uNbfxAR2s/lCdx?=
 =?us-ascii?Q?jz4DNCPNPTPukrx/h/GjOTXAmfuwxwz9WJQafvbbaMbAcxqOMluZajNZl9X5?=
 =?us-ascii?Q?SRLthdfoSuuVXmng7SAXakEXpUdYJJZG9/MputIGayIP7M5Fw/3O5pfU+Vsa?=
 =?us-ascii?Q?4gAppOqeAerTDSAZT7T2jn7gAjA7Q8A4kMAhoM72bL8LLjBQgM0me6+LiJR/?=
 =?us-ascii?Q?2h7B+2kas1taxN5txyG2fnhqi6BEkzoCSKYqmVsd6Jh3KHSt05YjwkZO2Z4O?=
 =?us-ascii?Q?kFykpNPnSU46VN+YJZzmzlsEee6IKNpLOgt92is5SxZ7wxuUAsJV8qlgvRkw?=
 =?us-ascii?Q?xHQRVnePwVDON10ROfUgc3duult+RGzfMDEmZ1ac5NlcmlqEKDIKOLnhC8/r?=
 =?us-ascii?Q?xl2+Lm6Fcdrv/312FT0vujyjT9ViC0indNID9N3C2MO5xhzuomCalny7KGc+?=
 =?us-ascii?Q?OfHbnxaij4kN+JwJXKa+3P56epFG6XuFhQgXsfSMB5MUmSnE5b3DnOF9oX5n?=
 =?us-ascii?Q?O1tHJwMr+sy6Mb3OFYGi6030bp/px+MZBfHPw5EH+FWFQqX0sTr4+yTNaFID?=
 =?us-ascii?Q?DdC5V7gkl3sUp1nKIUo1jZH3cYuNC9NR+iXo4c/6tt6zNBUULYPJx3kEhtw3?=
 =?us-ascii?Q?T7/3BtFG7HonRwGHM+GymGity+wpikd616dE0fqUXYfATmZT3WxOfHhyn1PV?=
 =?us-ascii?Q?J0j1RTdMae2jyZSfehepp5da61qaWYp1kN/DuHgXbS8PeEWNs3/mIEBSrzRJ?=
 =?us-ascii?Q?n2lJVV5BTWxK9s8GMWPR37YgBWPyiLAU6cdIPx1moN/nQrmM1TGywIHs5tc9?=
 =?us-ascii?Q?XFqvkDypzMK9uZfcMyJF2kzNsJHwJSFEBnTZ?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(14060799003)(35042699022)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2025 11:14:30.1117 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a1cf62-db48-4d6d-374f-08ddc847c357
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000190.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10776
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f39010c0ca86..7f138974d43b 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

