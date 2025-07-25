Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA750B12078
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 17:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED8210E451;
	Fri, 25 Jul 2025 15:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bRiKAi3M";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bRiKAi3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013056.outbound.protection.outlook.com [52.101.72.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA3910E36A
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 15:00:05 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F98+/tlpvZTfHzvpMrq05iEqumfsP4IueMp/Mks887p5eIzFrWGrF1tvmXPWu37FLhWgteeEi0d87oEzMWbFRz4G/Bjyy9D2ZjddkjUTQbax9IIbKRYPqxVQ3rQiIkvL22/ZogDVAx7We9ARTWu5QPdy3xTe3JXIqrwFOO4DoW1VbBhEKvWAmlTZZJ5kGT67HnStWKEU43ct9WEhMMNtlhAgLOg3H06InnqwuTlfobUXwhHf4uUdVevVRWw4BJg1NWd2DRSM5mqFO3uqVPH3NDM3IJMsUPzTYaeg/h1F/l4mKQ7+OB2cwbcQi2EZF1pnQ0eVXaVljhoo18lu5zrsNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIj1bNiez68mt1nJn+X6UIkyswvJDPrNRZm46PSqeos=;
 b=W0mSIu1W9UMY8MaW1oUsweJptzuzCsB7BBUXeFfXBBaKeSJtjZn5UClup+rY5bX+Arj0hC/d9LuvaZT3zRoYOQWZXVj1iJv5BitTyA1k4gt1U2Fv2Y8icxRGB79cZ/xbduhm3iiqiYD/DHRJVVF9LdUAWbaxZ/AsKYViLiUmNFhrOo8UTF3H9ZuCsRTW5FWMa14wfvzszhIi73HP0KcuGe8ZWP2Jx+QpUe9A7Dw28gPPBhLcnV3Q9K1mcAQxkWiioQH0XRn/dyX+fuYkXF1x7tAXP9Q/FLOn7oAmKZ3GOWHkObP487Z1vc4Z7Z3iKsZZMuCCV5BJpYXDOcpMOuh1Tw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIj1bNiez68mt1nJn+X6UIkyswvJDPrNRZm46PSqeos=;
 b=bRiKAi3M87wkmTWGgMcTq9BEIgiKcyffVL666XF8P2yr6enuub088kLU8orOYCG5x2vMPH7KEeE3H6fM/3mDFxR3tRSDqIdjNwDpVv3BP8MYjdF/0BTftbU5GT0/ZnCbHCrLdon3wJh1bLT3679gBFlLCytxv3fcx4Tc3OlU2EE=
Received: from AM0PR04CA0065.eurprd04.prod.outlook.com (2603:10a6:208:1::42)
 by DB5PR08MB10235.eurprd08.prod.outlook.com (2603:10a6:10:4a9::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 15:00:01 +0000
Received: from AMS0EPF000001A0.eurprd05.prod.outlook.com
 (2603:10a6:208:1:cafe::95) by AM0PR04CA0065.outlook.office365.com
 (2603:10a6:208:1::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 15:00:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A0.mail.protection.outlook.com (10.167.16.230) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Fri, 25 Jul 2025 15:00:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NIn/XVEDMSoNNZL8DKMDlaO49dLv5hpNWTWbHHFz/XjhEOt/ASCz5luKYZucy/TyBgaUwztiy8cFJs1jxWrRXzAHbyunCDtCQSS8m3Ddm7w+UgJekWhzRY6e2Mk70JGv2VCdJltfD7l7ao5oH1ILys9rUUIRYdnC1riOEzbUrdSPohH9mgS0pxtz0wekd9nu/sp7iVxPoXsmYDIx8Pc2N3pfV+35FuQBjHbKGRw+b1RgZr7mQVjBP1aM9OUAlZZCkBa5WXF+QK9kFXj9yaVK7Dhe0pirAseaukvBZb1xSApAOfsWL4A+0rErDHgVdGhoFPmL4a0TDBcbYkqWGDSWcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIj1bNiez68mt1nJn+X6UIkyswvJDPrNRZm46PSqeos=;
 b=BxwRjOkSwEx98wdQuHLapDDXpRpX2eydL3Wkd+XIFFZZ3WknUS89GOoVx+2ok0+OM2+3AE49KRBmdpGS5RQ0aMhAIqraxR57RlnAHkOeiVpn1OWpO9RMszhPh7BP5I3RNO0B/YvMU102/QvPZMQBNac4tAtilEBfheXGctBZJvVn8bNodxCd+bI6GKViVNqtCsRRAMFiAvg+GH50ECVhVBYs2BtTSwYdAT2BoAfBvU3KAlLTdmRqaCYT00AQfRUxoRABEASXYkSdG8jF8Fl1pIRsVio0/dNaKhFlafjMie+VD8oS6Pq0Dc1UrrEQQUxjLn+FrLl+UQWhfZ4R8uXOWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIj1bNiez68mt1nJn+X6UIkyswvJDPrNRZm46PSqeos=;
 b=bRiKAi3M87wkmTWGgMcTq9BEIgiKcyffVL666XF8P2yr6enuub088kLU8orOYCG5x2vMPH7KEeE3H6fM/3mDFxR3tRSDqIdjNwDpVv3BP8MYjdF/0BTftbU5GT0/ZnCbHCrLdon3wJh1bLT3679gBFlLCytxv3fcx4Tc3OlU2EE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com (2603:10a6:20b:30f::8)
 by DU0PR08MB8471.eurprd08.prod.outlook.com (2603:10a6:10:405::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Fri, 25 Jul
 2025 14:59:29 +0000
Received: from AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0]) by AM9PR08MB6820.eurprd08.prod.outlook.com
 ([fe80::65e1:f4ac:8b74:fea0%4]) with mapi id 15.20.8943.024; Fri, 25 Jul 2025
 14:59:29 +0000
From: Lukas Zapolskas <lukas.zapolskas@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Lukas Zapolskas <lukas.zapolskas@arm.com>
Subject: [PATCH v5 4/7] drm/panthor: Introduce sampling sessions to handle
 userspace clients
Date: Fri, 25 Jul 2025 15:57:55 +0100
Message-Id: <1a56b67cf8849bc3a6140d2163a0206d03bb9a60.1753449448.git.lukas.zapolskas@arm.com>
X-Mailer: git-send-email 2.33.0.dirty
In-Reply-To: <cover.1753449448.git.lukas.zapolskas@arm.com>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LNXP265CA0036.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::24) To AM9PR08MB6820.eurprd08.prod.outlook.com
 (2603:10a6:20b:30f::8)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6820:EE_|DU0PR08MB8471:EE_|AMS0EPF000001A0:EE_|DB5PR08MB10235:EE_
X-MS-Office365-Filtering-Correlation-Id: db892bf2-60cc-40ad-7e6e-08ddcb8bee68
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?nVUcNOF0eAg4X0cM7xyeDNmUMnUNTvAulyUlfqN5fVgmcxXcMsF8h6QwIUVe?=
 =?us-ascii?Q?1g7YazIi0YXG0eFVIJ5u3rJjPqhRALAQPYuJ9UXMUAUZYVWviewPwMbf5PRV?=
 =?us-ascii?Q?8pdgCTGdRLdXk0XO8oZH8G2aX8fSGQvd9H1+YXitpDUp/78S5dfd8UAS3jbb?=
 =?us-ascii?Q?YethWCaf/S3maY2Lwih0w9VC5pCyGsLrpUK8sDeHKrj/Z/9qJs/OUSx3bxwk?=
 =?us-ascii?Q?JR8hNtjuWjc0t2XLLq7Vlezt1FZdE06hE2KFMGdveL1SlIUDuqEA6ABJzhfx?=
 =?us-ascii?Q?mGIa7CtLQSHap6EIFKU5E/Dis459P16Ax8K2z7YaoO5E9m+K46h8d0sdybIt?=
 =?us-ascii?Q?xBUHLLkwq81muZXdhL2q3hf8XRCk5ppno83h3axnZwNL2NXcLENl6QuOsrTy?=
 =?us-ascii?Q?5XbClbljTc2LQdJ4/iehuU7XqAk/6w9pFCVZ7/VnyaEF0SUM/9ed8kM5p6m5?=
 =?us-ascii?Q?SZP3pPUyx891lqHTdI+mspRbjhv3kKpJ8x/cYfqFq5vR+Fi9Otz9W0O9Niwg?=
 =?us-ascii?Q?9ixKf+rdkQJR0Xq3u0A4q7+7TAvRBglLfiDJnvGiXp6fQj9RiRoKpR24mJ+h?=
 =?us-ascii?Q?DeAK+PQIYkiNeNo78hE0+CsHK2qt9YJRxR8MK+6Uq+WwMHaIUTUA7Xa1Zp1K?=
 =?us-ascii?Q?paUCxoM3OrRgKAN/NEnptMVPvR9O1kg4ecBVj/Nm5SHbmSY/z+LQ1LiZsZpE?=
 =?us-ascii?Q?iAIL2srnunIzUS2GPyezIH7VVYrGqa+lCfv90dZ9UmxPBSagFnMv+D4EarJ8?=
 =?us-ascii?Q?WN/n6M5Jn3sG38yerc6jTjBxsbnMaA4x3pFefRuXtQ+hVSwJiaFmu4LGNuqY?=
 =?us-ascii?Q?SSD4CZYDo1tbHywfD4gE7kMEMKIqAleWhqBez1Mig/L0XIUnlzPp4QHbey9D?=
 =?us-ascii?Q?q9P577KzmKvLW/fPR3CZFsv6HcOaTwQjYbilOu/5cGFqLVbllGQg+JCVtBKG?=
 =?us-ascii?Q?5wSgV9auwxI7x1NLlmoHpB+4lk3WeHvAGA+ebWKnDzktkHB6hR8nsulN+GQx?=
 =?us-ascii?Q?Z/m2pdScqx8MS3f2v0CPiW0v/GMsC/nSji6y3DHxANL2WQ9au2JhvvxLQ/oN?=
 =?us-ascii?Q?3bRfrESsGYKLrMG8lud/VYcAfw3ago3y2n7L8R5wzu2X9yKXefsXBe0S7nls?=
 =?us-ascii?Q?glBH9CAbhg3Md99hvss3QyMn2il+m71dNvO5rDTH2k1C2Q9Gd/0pV8cQ/Pd3?=
 =?us-ascii?Q?3zK4QEmjHfAMmL1dqNjksST8R80prQKJn9TRxJ67iZMTylXNzbI0jRA5U6x1?=
 =?us-ascii?Q?/Ppls6EFk1AwO0Hfl6pXNvxoCNzMk7i+6fcdGHDEP6vt6vixckq3ZVV0iVru?=
 =?us-ascii?Q?McleuaKC9/6aQMHP45VKb1hXMvm/VPrjCVg1a68TBIjFwwlU4PeJriOk+SP7?=
 =?us-ascii?Q?VHGO+EF95fpaFkKg1t9099ASimzm8isyAdvY5+DOvqI4NnHsXeeJg9W0bQYE?=
 =?us-ascii?Q?8cPCfq6+RtI=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6820.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8471
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7e1307e0-ad78-46ac-def3-08ddcb8bdb48
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|376014|36860700013|82310400026|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lOBUY3/mljGPfHGANNKoEclSMp6271IeRvKQ2lndZ0aT9RKXaCl8jMZTAgyU?=
 =?us-ascii?Q?y/8cPdnZi5ptIRWixZNb+YtIgKAqI8Qf/oNWZ5aAAKRzdQp9//FxH3zxMicW?=
 =?us-ascii?Q?B2Q0KEUYIiZptvC3PiytqxTnSsnamDP2Yr6kAu8OYhwTFuSEgBdxqDoEKMeO?=
 =?us-ascii?Q?KtwVK+2URZ1sNgpQ1SbMzgpd9pN7jBqv26VHFu3yXlKUfybPyuoK4p+nxl0J?=
 =?us-ascii?Q?yBwezaJU589TWt0bgEeEEH0u4aDgHoUlhhLuann261E7aiCl0a9K7g/w5vCq?=
 =?us-ascii?Q?ZAh0bOpQQKCWLi6qITAPNZgBnBtinKv5O+EJIJAqAALgltt2QQWk4KPiLCQC?=
 =?us-ascii?Q?mKdVzXkp/QBKOCSlrS6cw+/59JPQX8+ZG1/lvcMRdEALHystrbwyAxceqHln?=
 =?us-ascii?Q?4H5hy5pFMo1nmYO749w9qQJMcnHT1dZjEh20An9GpFDfC88DkGBLGGZ6ikUV?=
 =?us-ascii?Q?9WEjdgGYTMLd5pMm7C01t1ML7T0+R10ftTiLny7TLZYd62DXctOMYAjewFNw?=
 =?us-ascii?Q?6QfT8ISMcoKG1Vd/zC8j2zcopqtirJTBRrbpcQGIeVzcDNvmNMNDf+Wd38ys?=
 =?us-ascii?Q?Rps9EOA0iwUcD0sJRbtOzplH0tyzTvBJ2CvrIcsFO6/Ls+LZsM5Eh7hCXr4E?=
 =?us-ascii?Q?1P1TUxcjVNrqkaljoQeDwt8BjvArzP3Q/tVJmz00tEUwvrace/FQAQusFQhW?=
 =?us-ascii?Q?I7MnyR9gORc6xLvEZNkI2MjYSG8gvzQ7YytkzOHEx/3JYvXZ/UUw8CF4oS07?=
 =?us-ascii?Q?Ho7avMY6KPSrK/LQtg531/XRBwSjggTS9XStAoVkgLXHipv92OdGUh9R3e4L?=
 =?us-ascii?Q?05bEF4GrJ1JOu5IcGcfZoOa8GEnkiKzAmasIA58OryL1U8NeiM1yLPgUKxLv?=
 =?us-ascii?Q?i2paGUzKxFkwgIlz0X1vzryMwlhrgy7L8o5h42XXDQ/iAE4kxq1rSKXUwyCx?=
 =?us-ascii?Q?0VZkRnBvz0SiggmHInjsIY1UAWJWs/CRoOwJQnZv+DGFJkDb81QhN6sXOA/y?=
 =?us-ascii?Q?tqO579ZzUIh8F/5yrdVTj/G+XledmzFjvhYJpZGEY7gz5FZEcOsniEXq2J6W?=
 =?us-ascii?Q?0JA+DSZJqxQPbRxNcc1xKWJ6kLO94tyImDS2av4WgIuKbdCC1VkTv9VWPgsm?=
 =?us-ascii?Q?HpcaZdFvim30DS5vBzRgb2GsF2wOgHWGx/upCyKFDCGyzndVY+dtcCeo2mc3?=
 =?us-ascii?Q?9JmrgDvFGoitB5Zn/UQwhHuWkN3vTmoLqxzTc831WXq+n+892JFMeXYTN4pw?=
 =?us-ascii?Q?tqX8Rx9Lm9UOYPrQwr3HUH49VW7Q+uFiHPoq4Bd9xeHOFe/ot6BL+FrR7YiN?=
 =?us-ascii?Q?dd8fwTSFI6XiuT3B2MW3VOVp7/FFHIq3WRZpOuM1uZMcqSxj/tpnK+4nVWhF?=
 =?us-ascii?Q?9g1dK22BYPEC10PQQg+PtDCfYP+91uwGjD1GsZlfaI/Pg6Hj3D/WgaGrBeBE?=
 =?us-ascii?Q?y/XDQ8H+kiC++Lt0uRQEws/2ipvqyGH20gp2mPTzE2CpdSLv5KQrJsFa+VGz?=
 =?us-ascii?Q?VIGXrj+BGNw/lHrgVhMdPr88tLA9GqsPQysI?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(376014)(36860700013)(82310400026)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 15:00:01.6201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db892bf2-60cc-40ad-7e6e-08ddcb8bee68
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF000001A0.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10235
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

To allow for combining the requests from multiple userspace clients,
an intermediary layer between the HW/FW interfaces and userspace is
created, containing the information for the counter requests and
tracking of insert and extract indices. Each session starts inactive
and must be explicitly activated via PERF_CONTROL.START, and
explicitly stopped via PERF_CONTROL.STOP. Userspace identifies a
single client with its session ID and the panthor file it is
associated with.

The SAMPLE and STOP commands both produce a single sample when called,
and these samples can be disambiguated via the opaque user data field
passed in the PERF_CONTROL uAPI. If this functionality is not desired,
these fields can be kept as zero, as the kernel copies this value into
the corresponding sample without attempting to interpret it.

Currently, only manual sampling sessions are supported, providing
samples when userspace calls PERF_CONTROL.SAMPLE, and only a single
session is allowed at a time. Multiple sessions and periodic sampling
will be enabled in following patches.

No protection is provided against the 32-bit hardware counter
overflows, so for the moment it is up to userspace to ensure that
the counters are sampled at a reasonable frequency.

The counter set enum is added to the uapi to clarify the restrictions
on calling the interface.

Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
---
 drivers/gpu/drm/panthor/panthor_perf.c | 706 ++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_perf.h |  16 +
 2 files changed, 716 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
index af1c58e70a78..d1f984b3302a 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.c
+++ b/drivers/gpu/drm/panthor/panthor_perf.c
@@ -2,14 +2,179 @@
 /* Copyright 2023 Collabora Ltd */
 /* Copyright 2025 Arm ltd. */
 
-#include <linux/bitops.h>
+#include <drm/drm_file.h>
+#include <drm/drm_gem.h>
 #include <drm/panthor_drm.h>
+#include <linux/bitops.h>
+#include <linux/circ_buf.h>
 
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_perf.h"
 #include "panthor_regs.h"
 
+/**
+ * PANTHOR_PERF_EM_BITS - Number of bits in a user-facing enable mask. This must correspond
+ *                        to the maximum number of counters available for selection on the newest
+ *                        Mali GPUs (128 as of the Mali-Gx15).
+ */
+#define PANTHOR_PERF_EM_BITS (BITS_PER_TYPE(u64) * 2)
+
+enum panthor_perf_session_state {
+	/** @PANTHOR_PERF_SESSION_ACTIVE: The session is active and can be used for sampling. */
+	PANTHOR_PERF_SESSION_ACTIVE = 0,
+
+	/**
+	 * @PANTHOR_PERF_SESSION_OVERFLOW: The session encountered an overflow in one of the
+	 *                                 counters during the last sampling period. This flag
+	 *                                 gets propagated as part of samples emitted for this
+	 *                                 session, to ensure the userspace client can gracefully
+	 *                                 handle this data corruption.
+	 */
+	PANTHOR_PERF_SESSION_OVERFLOW,
+
+	/* Must be last */
+	PANTHOR_PERF_SESSION_MAX,
+};
+
+struct panthor_perf_enable_masks {
+	/**
+	 * @mask: Array of bitmasks indicating the counters userspace requested, where
+	 *        one bit represents a single counter. Used to build the firmware configuration
+	 *        and ensure that userspace clients obtain only the counters they requested.
+	 */
+	unsigned long mask[DRM_PANTHOR_PERF_BLOCK_MAX][BITS_TO_LONGS(PANTHOR_PERF_EM_BITS)];
+};
+
+struct panthor_perf_counter_block {
+	struct drm_panthor_perf_block_header header;
+	u64 counters[];
+};
+
+/**
+ * enum session_sample_type - Enum of the types of samples a session can request.
+ */
+enum session_sample_type {
+	/** @SAMPLE_TYPE_NONE: A sample has not been requested by this session. */
+	SAMPLE_TYPE_NONE,
+
+	/** @SAMPLE_TYPE_INITIAL: An initial sample has been requested by this session. */
+	SAMPLE_TYPE_INITIAL,
+
+	/** @SAMPLE_TYPE_REGULAR: A regular sample has been requested by this session. */
+	SAMPLE_TYPE_REGULAR,
+};
+
+struct panthor_perf_session {
+	DECLARE_BITMAP(state, PANTHOR_PERF_SESSION_MAX);
+
+	/**
+	 * @pending_sample_request: The type of sample request that is currently pending:
+	 *                          - when a sample is not requested, the data should be accumulated
+	 *                            into the next slot of its ring buffer, but the extract index
+	 *                            should not be updated, and the user-space session must
+	 *                            not be signaled.
+	 *                          - when an initial sample is requested, the data must not be
+	 *                            emitted into the target ring buffer and the userspace client
+	 *                            must not be notified.
+	 *                          - when a regular sample is requested, the data must be emitted
+	 *                            into the target ring buffer, and the userspace client must
+	 *                            be signalled.
+	 */
+	enum session_sample_type pending_sample_request;
+
+	/**
+	 * @user_sample_size: The size of a single sample as exposed to userspace. For the sake of
+	 *                    simplicity, the current implementation exposes the same structure
+	 *                    as provided by firmware, after annotating the sample and the blocks,
+	 *                    and zero-extending the counters themselves (to account for in-kernel
+	 *                    accumulation).
+	 *
+	 *                    This may also allow further memory-optimizations of compressing the
+	 *                    sample to provide only requested blocks, if deemed to be worth the
+	 *                    additional complexity.
+	 */
+	size_t user_sample_size;
+
+	/**
+	 * @accum_idx: The last insert index indicates whether the current sample
+	 *                   needs zeroing before accumulation. This is used to disambiguate
+	 *                   between accumulating into an intermediate slot in the user ring buffer
+	 *                   and zero-ing the buffer before copying data over.
+	 */
+	u32 accum_idx;
+
+	/**
+	 * @sample_freq_ns: Period between subsequent sample requests. Zero indicates that
+	 *                  userspace will be responsible for requesting samples.
+	 */
+	u64 sample_freq_ns;
+
+	/** @sample_start_ns: Sample request time, obtained from a monotonic raw clock. */
+	u64 sample_start_ns;
+
+	/**
+	 * @user_data: Opaque handle passed in when starting a session, requesting a sample (for
+	 *             manual sampling sessions only) and when stopping a session. This handle
+	 *             allows the disambiguation of a sample in the ringbuffer.
+	 */
+	u64 user_data;
+
+	/**
+	 * @eventfd: Event file descriptor context used to signal userspace of a new sample
+	 *           being emitted.
+	 */
+	struct eventfd_ctx *eventfd;
+
+	/**
+	 * @enabled_counters: This session's requested counters. Note that these cannot change
+	 *                    for the lifetime of the session.
+	 */
+	struct panthor_perf_enable_masks *enabled_counters;
+
+	/** @ringbuf_slots: Slots in the user-facing ringbuffer. */
+	size_t ringbuf_slots;
+
+	/** @ring_buf: BO for the userspace ringbuffer. */
+	struct drm_gem_object *ring_buf;
+
+	/**
+	 * @control_buf: BO for the insert and extract indices.
+	 */
+	struct drm_gem_object *control_buf;
+
+	/** @control: The mapped insert and extract indices. */
+	struct drm_panthor_perf_ringbuf_control *control;
+
+	/** @samples: The mapping of the @ring_buf into the kernel's VA space. */
+	u8 *samples;
+
+	/**
+	 * @pending: The list node used by the sampler to track the sessions that have not yet
+	 *           received a sample.
+	 */
+	struct list_head pending;
+
+	/**
+	 * @sessions: The list node used by the sampler to track the sessions waiting for a sample.
+	 */
+	struct list_head sessions;
+
+	/**
+	 * @pfile: The panthor file which was used to create a session, used for the postclose
+	 *         handling and to prevent a misconfigured userspace from closing unrelated
+	 *         sessions.
+	 */
+	struct panthor_file *pfile;
+
+	/**
+	 * @ref: Session reference count. The sample delivery to userspace is asynchronous, meaning
+	 *       the lifetime of the session must extend at least until the sample is exposed to
+	 *       userspace.
+	 */
+	struct kref ref;
+};
+
 struct panthor_perf {
 	/** @next_session: The ID of the next session. */
 	u32 next_session;
@@ -23,11 +188,6 @@ struct panthor_perf {
 	struct xarray sessions;
 };
 
-struct panthor_perf_counter_block {
-	struct drm_panthor_perf_block_header header;
-	u64 counters[];
-};
-
 static size_t get_annotated_block_size(size_t counters_per_block)
 {
 	return struct_size_t(struct panthor_perf_counter_block, counters, counters_per_block);
@@ -73,6 +233,125 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
 	perf_info->sample_size = session_get_user_sample_size(perf_info);
 }
 
+static struct panthor_perf_enable_masks *panthor_perf_create_em(struct drm_panthor_perf_cmd_setup
+								*const setup_args)
+{
+	struct panthor_perf_enable_masks *const em = kmalloc(sizeof(*em), GFP_KERNEL);
+
+	if (IS_ERR_OR_NULL(em))
+		return em;
+
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_FW],
+			  setup_args->fw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_CSHW],
+			  setup_args->cshw_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_TILER],
+			  setup_args->tiler_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_MEMSYS],
+			  setup_args->memsys_enable_mask, PANTHOR_PERF_EM_BITS);
+	bitmap_from_arr64(em->mask[DRM_PANTHOR_PERF_BLOCK_SHADER],
+			  setup_args->shader_enable_mask, PANTHOR_PERF_EM_BITS);
+
+	return em;
+}
+
+static u64 session_read_extract_idx(struct panthor_perf_session *session)
+{
+	const u64 slots = session->ringbuf_slots;
+
+	/* Userspace will update their own extract index to indicate that a sample is consumed
+	 * from the ringbuffer, and we must ensure we read the latest value.
+	 */
+	return smp_load_acquire(&session->control->extract_idx) % slots;
+}
+
+static u64 session_read_insert_idx(struct panthor_perf_session *session)
+{
+	const u64 slots = session->ringbuf_slots;
+
+	/*
+	 * Userspace is able to write to the insert index, since it is mapped
+	 * on the same page as the extract index. This should not happen
+	 * in regular operation.
+	 */
+	return smp_load_acquire(&session->control->insert_idx) % slots;
+}
+
+static void session_get(struct panthor_perf_session *session)
+{
+	kref_get(&session->ref);
+}
+
+static void session_free(struct kref *ref)
+{
+	struct panthor_perf_session *session = container_of(ref, typeof(*session), ref);
+
+	if (session->samples && session->ring_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->samples);
+
+		drm_gem_vunmap(session->ring_buf, &map);
+		drm_gem_object_put(session->ring_buf);
+	}
+
+	if (session->control && session->control_buf) {
+		struct iosys_map map = IOSYS_MAP_INIT_VADDR(session->control);
+
+		drm_gem_vunmap(session->control_buf, &map);
+		drm_gem_object_put(session->control_buf);
+	}
+
+	kfree(session->enabled_counters);
+
+	eventfd_ctx_put(session->eventfd);
+
+	kfree(session);
+}
+
+static void session_put(struct panthor_perf_session *session)
+{
+	kref_put(&session->ref, session_free);
+}
+
+/**
+ * session_find - Find a session associated with the given session ID and
+ *                panthor_file.
+ * @pfile: Panthor file.
+ * @perf: Panthor perf.
+ * @sid: Session ID.
+ *
+ * The reference count of a valid session is increased to ensure it does not disappear
+ * in the window between the XA lock being dropped and the internal session functions
+ * being called.
+ *
+ * Return: valid session pointer or an ERR_PTR.
+ */
+static struct panthor_perf_session *session_find(struct panthor_file *pfile,
+						 struct panthor_perf *perf, u32 sid)
+{
+	struct panthor_perf_session *session;
+
+	if (!perf)
+		return ERR_PTR(-EINVAL);
+
+	xa_lock(&perf->sessions);
+	session = xa_load(&perf->sessions, sid);
+
+	if (!session || xa_is_err(session)) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EBADF);
+	}
+
+	if (session->pfile != pfile) {
+		xa_unlock(&perf->sessions);
+		return ERR_PTR(-EINVAL);
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	return session;
+}
+
 /**
  * panthor_perf_init - Initialize the performance counter subsystem.
  * @ptdev: Panthor device
@@ -110,6 +389,415 @@ int panthor_perf_init(struct panthor_device *ptdev)
 	return ret;
 }
 
+static int session_validate_set(u8 set)
+{
+	if (set > DRM_PANTHOR_PERF_SET_TERTIARY)
+		return -EINVAL;
+
+	if (set == DRM_PANTHOR_PERF_SET_PRIMARY)
+		return 0;
+
+	if (set > DRM_PANTHOR_PERF_SET_PRIMARY)
+		return capable(CAP_PERFMON) ? 0 : -EACCES;
+
+	return -EINVAL;
+}
+
+/**
+ * panthor_perf_session_setup - Create a user-visible session.
+ *
+ * @ptdev: Handle to the panthor device.
+ * @perf: Handle to the perf control structure.
+ * @setup_args: Setup arguments passed in via ioctl.
+ * @pfile: Panthor file associated with the request.
+ *
+ * Creates a new session associated with the session ID returned. When initialized, the
+ * session must explicitly request sampling to start with a successive call to PERF_CONTROL.START.
+ *
+ * Return: non-negative session identifier on success or negative error code on failure.
+ */
+int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
+			       struct drm_panthor_perf_cmd_setup *setup_args)
+{
+	struct panthor_file *pfile = file->driver_priv;
+	struct panthor_device *ptdev = pfile->ptdev;
+	struct panthor_perf_session *session;
+	struct drm_gem_object *ringbuffer;
+	struct drm_gem_object *control;
+	const size_t slots = setup_args->sample_slots;
+	struct panthor_perf_enable_masks *em;
+	struct iosys_map rb_map, ctrl_map;
+	size_t user_sample_size;
+	int session_id;
+	int ret;
+
+	ret = session_validate_set(setup_args->block_set);
+	if (ret) {
+		drm_err(&ptdev->base, "Did not meet requirements for set %d\n",
+			setup_args->block_set);
+		return ret;
+	}
+
+	session = kzalloc(sizeof(*session), GFP_KERNEL);
+	if (ZERO_OR_NULL_PTR(session))
+		return -ENOMEM;
+
+	ringbuffer = drm_gem_object_lookup(file, setup_args->ringbuf_handle);
+	if (!ringbuffer) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->ringbuf_handle);
+		ret = -EINVAL;
+		goto cleanup_session;
+	}
+
+	control = drm_gem_object_lookup(file, setup_args->control_handle);
+	if (!control) {
+		drm_err(&ptdev->base, "Could not find handle %d!\n", setup_args->control_handle);
+		ret = -EINVAL;
+		goto cleanup_ringbuf;
+	}
+
+	user_sample_size = session_get_user_sample_size(&ptdev->perf_info) * slots;
+
+	if (ringbuffer->size != PFN_ALIGN(user_sample_size)) {
+		drm_err(&ptdev->base,
+			"Incorrect ringbuffer size from userspace: user %zu vs kernel %lu\n",
+			ringbuffer->size, PFN_ALIGN(user_sample_size));
+
+		ret = -ENOMEM;
+		goto cleanup_control;
+	}
+
+	ret = drm_gem_vmap(ringbuffer, &rb_map);
+	if (ret)
+		goto cleanup_control;
+
+	ret = drm_gem_vmap(control, &ctrl_map);
+	if (ret)
+		goto cleanup_ring_map;
+
+	session->eventfd = eventfd_ctx_fdget(setup_args->fd);
+	if (IS_ERR(session->eventfd)) {
+		drm_err(&ptdev->base, "Invalid eventfd %d!\n", setup_args->fd);
+		ret = PTR_ERR_OR_ZERO(session->eventfd) ?: -EINVAL;
+		goto cleanup_control_map;
+	}
+
+	em = panthor_perf_create_em(setup_args);
+	if (IS_ERR_OR_NULL(em)) {
+		ret = -ENOMEM;
+		goto cleanup_eventfd;
+	}
+
+	INIT_LIST_HEAD(&session->sessions);
+	INIT_LIST_HEAD(&session->pending);
+
+	session->control = ctrl_map.vaddr;
+	*session->control = (struct drm_panthor_perf_ringbuf_control) { 0 };
+
+	session->samples = rb_map.vaddr;
+
+	/* TODO This will need validation when we support periodic sampling sessions */
+	if (setup_args->sample_freq_ns) {
+		ret = -EOPNOTSUPP;
+		goto cleanup_em;
+	}
+
+	ret = xa_alloc_cyclic(&perf->sessions, &session_id, session, perf->session_range,
+			      &perf->next_session, GFP_KERNEL);
+	if (ret < 0) {
+		drm_err(&ptdev->base, "System session limit exceeded.\n");
+		ret = -EBUSY;
+		goto cleanup_em;
+	}
+
+	kref_init(&session->ref);
+	session->enabled_counters = em;
+
+	session->sample_freq_ns = setup_args->sample_freq_ns;
+	session->user_sample_size = user_sample_size;
+	session->ring_buf = ringbuffer;
+	session->ringbuf_slots = slots;
+	session->control_buf = control;
+	session->pfile = pfile;
+	session->accum_idx = U32_MAX;
+
+	return session_id;
+
+cleanup_em:
+	kfree(em);
+
+cleanup_eventfd:
+	eventfd_ctx_put(session->eventfd);
+
+cleanup_control_map:
+	drm_gem_vunmap(control, &ctrl_map);
+
+cleanup_ring_map:
+	drm_gem_vunmap(ringbuffer, &rb_map);
+
+cleanup_control:
+	drm_gem_object_put(control);
+
+cleanup_ringbuf:
+	drm_gem_object_put(ringbuffer);
+
+cleanup_session:
+	kfree(session);
+
+	return ret;
+}
+
+static int session_stop(struct panthor_perf *perf, struct panthor_perf_session *session,
+			u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	const u64 extract_idx = session_read_extract_idx(session);
+	const u64 insert_idx = session_read_insert_idx(session);
+
+	/* Must have at least one slot remaining in the ringbuffer to sample. */
+	if (WARN_ON_ONCE(!CIRC_SPACE(insert_idx, extract_idx, session->ringbuf_slots)))
+		return -EBUSY;
+
+	session->user_data = user_data;
+
+	clear_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_start(struct panthor_perf *perf, struct panthor_perf_session *session,
+			 u64 user_data)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	set_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state);
+
+	/*
+	 * For manual sampling sessions, a start command does not correspond to a sample,
+	 * and so the user data gets discarded.
+	 */
+	if (session->sample_freq_ns)
+		session->user_data = user_data;
+
+	/* TODO Calls to the FW interface will go here in later patches. */
+	return 0;
+}
+
+static int session_sample(struct panthor_perf *perf, struct panthor_perf_session *session,
+			  u64 user_data)
+{
+	if (!test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return 0;
+
+	const u64 extract_idx = session_read_extract_idx(session);
+	const u64 insert_idx = session_read_insert_idx(session);
+
+	/* Manual sampling for periodic sessions is forbidden. */
+	if (session->sample_freq_ns)
+		return -EINVAL;
+
+	/*
+	 * Must have at least two slots remaining in the ringbuffer to sample: one for
+	 * the current sample, and one for a stop sample, since a stop command should
+	 * always be acknowledged by taking a final sample and stopping the session.
+	 */
+	if (CIRC_SPACE_TO_END(insert_idx, extract_idx, session->ringbuf_slots) < 2)
+		return -EBUSY;
+
+	session->sample_start_ns = ktime_get_raw_ns();
+	session->user_data = user_data;
+
+	return 0;
+}
+
+static int session_destroy(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	session_put(session);
+
+	return 0;
+}
+
+static int session_teardown(struct panthor_perf *perf, struct panthor_perf_session *session)
+{
+	if (test_bit(PANTHOR_PERF_SESSION_ACTIVE, session->state))
+		return -EINVAL;
+
+	if (READ_ONCE(session->pending_sample_request) == SAMPLE_TYPE_NONE)
+		return -EBUSY;
+
+	return session_destroy(perf, session);
+}
+
+/**
+ * panthor_perf_session_teardown - Teardown the session associated with the @sid.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the perf control structure.
+ * @sid: Session identifier.
+ *
+ * Destroys a stopped session where the last sample has been explicitly consumed
+ * or discarded. Active sessions will be ignored.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf, u32 sid)
+{
+	int err;
+	struct panthor_perf_session *session;
+
+	xa_lock(&perf->sessions);
+	session = __xa_store(&perf->sessions, sid, NULL, GFP_KERNEL);
+
+	if (xa_is_err(session)) {
+		err = xa_err(session);
+		goto restore;
+	}
+
+	if (session->pfile != pfile) {
+		err = -EINVAL;
+		goto restore;
+	}
+
+	session_get(session);
+	xa_unlock(&perf->sessions);
+
+	err = session_teardown(perf, session);
+
+	session_put(session);
+
+	return err;
+
+restore:
+	__xa_store(&perf->sessions, sid, session, GFP_KERNEL);
+	xa_unlock(&perf->sessions);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_start - Start sampling on a stopped session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as stopped when it is created or when it is explicitly stopped after being
+ * started. Starting an active session is treated as a no-op.
+ *
+ * The @user_data parameter will be associated with all subsequent samples for a periodic
+ * sampling session and will be ignored for manual sampling ones in favor of the user data
+ * passed in the PERF_CONTROL.SAMPLE ioctl call.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+			       u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_start(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_stop - Stop sampling on an active session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * A session counts as active when it has been explicitly started via the PERF_CONTROL.START
+ * ioctl. Stopping a stopped session is treated as a no-op.
+ *
+ * To ensure data is not lost when sampling is stopping, there must always be at least one slot
+ * available for the final automatic sample, and the stop command will be rejected if there is not.
+ *
+ * The @user_data will always be associated with the final sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+			      u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_stop(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_sample - Request a sample on a manual sampling session.
+ * @pfile: Open panthor file.
+ * @perf: Handle to the panthor perf control structure.
+ * @sid: Session identifier for the desired session.
+ * @user_data: An opaque value passed in from userspace.
+ *
+ * Only an active manual sampler is permitted to request samples directly. Failing to meet either
+ * of these conditions will cause the sampling request to be rejected. Requesting a manual sample
+ * with a full ringbuffer will see the request being rejected.
+ *
+ * The @user_data will always be unambiguously associated one-to-one with the resultant sample.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+				u32 sid, u64 user_data)
+{
+	struct panthor_perf_session *session = session_find(pfile, perf, sid);
+	int err;
+
+	if (IS_ERR_OR_NULL(session))
+		return IS_ERR(session) ? PTR_ERR(session) : -EINVAL;
+
+	err = session_sample(perf, session, user_data);
+
+	session_put(session);
+
+	return err;
+}
+
+/**
+ * panthor_perf_session_destroy - Destroy a sampling session associated with the @pfile.
+ * @perf: Handle to the panthor perf control structure.
+ * @pfile: The file being closed.
+ *
+ * Must be called when the corresponding userspace process is destroyed and cannot close its
+ * own sessions. As such, we offer no guarantees about data delivery.
+ */
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf)
+{
+	unsigned long sid;
+	struct panthor_perf_session *session;
+
+	if (!pfile || !perf)
+		return;
+
+	xa_for_each(&perf->sessions, sid, session)
+	{
+		if (session->pfile == pfile) {
+			session_destroy(perf, session);
+			xa_erase(&perf->sessions, sid);
+		}
+	}
+}
+
 /**
  * panthor_perf_unplug - Terminate the performance counter subsystem.
  * @ptdev: Panthor device.
@@ -125,8 +813,14 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
 		return;
 
 	if (!xa_empty(&perf->sessions)) {
+		unsigned long sid;
+		struct panthor_perf_session *session;
+
 		drm_err(&ptdev->base,
 			"Performance counter sessions active when unplugging the driver!");
+
+		xa_for_each(&perf->sessions, sid, session)
+			session_destroy(perf, session);
 	}
 
 	xa_destroy(&perf->sessions);
diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
index e4805727b9e7..c46f94ed8a96 100644
--- a/drivers/gpu/drm/panthor/panthor_perf.h
+++ b/drivers/gpu/drm/panthor/panthor_perf.h
@@ -7,10 +7,26 @@
 
 #include <linux/types.h>
 
+struct drm_file;
+struct drm_panthor_perf_cmd_setup;
 struct panthor_device;
+struct panthor_file;
+struct panthor_perf;
 
 int panthor_perf_init(struct panthor_device *ptdev);
 void panthor_perf_unplug(struct panthor_device *ptdev);
 
+int panthor_perf_session_setup(struct drm_file *file, struct panthor_perf *perf,
+			       struct drm_panthor_perf_cmd_setup *setup_args);
+int panthor_perf_session_teardown(struct panthor_file *pfile, struct panthor_perf *perf,
+				  u32 sid);
+int panthor_perf_session_start(struct panthor_file *pfile, struct panthor_perf *perf,
+			       u32 sid, u64 user_data);
+int panthor_perf_session_stop(struct panthor_file *pfile, struct panthor_perf *perf,
+			      u32 sid, u64 user_data);
+int panthor_perf_session_sample(struct panthor_file *pfile, struct panthor_perf *perf,
+				u32 sid, u64 user_data);
+void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_perf *perf);
+
 #endif /* __PANTHOR_PERF_H__ */
 
-- 
2.33.0.dirty

