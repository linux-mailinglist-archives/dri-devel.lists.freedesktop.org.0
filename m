Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A28A29B042E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 15:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 552D310EAE5;
	Fri, 25 Oct 2024 13:33:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ATJuv2LB";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ATJuv2LB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2059.outbound.protection.outlook.com [40.107.21.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6A10E0EA
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 14:55:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=GGIzOOIowpBywDorKDUU4oY9hI6gY1yEXDbB3r+sLk/rLyo5v8PV/OQ9aAUmFD4k9fwbIMK/RBFLqMkHoTquXZPnbmeuNgXEt/o4R6Vrp2PFiyQaYUxXMqhVDf3FH+CurnmvxyttfzA4+4nYQ+YkwDt1E3uxJ8NSoUF5Q4xmUNo43zR6cIFemN/rVrs9EAjd8lonq1HMuLBzIvvzQYOfxLhVrW/d8UrsZNrcG4tsvb4JKt93nUmFd+I8BkuNb526aLsGsKILYStArneWOtY0aXRKCVuhO4fsKKr1hF+yUbZ6CX+wVCpdj5gH98Snf6LHiyRijWgv56NnTyYbcUtxrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9scCfDORPSH8x2FzZou9SIUQuCUSGsR2CCaTY9VGBc=;
 b=xwZysK8L3VhXDdYIwp7kloKahgxYu7hw7K9kJEFdBxsS5nr8vjnJQyvrXYy1bTbBT8/BQOKFnAWggJlSYMGOKEYXJCKMspsnrqmZzvNuezZ0sqkz43nQ9Yb737/QdNhC575DwRicG0MikfOtXZFTsPuLw3K+BBMU5aJfzxZdxvat24XFtR8sscxMWYzpYb3WutRO3gBzd9vZEuDHWTvHhJOedhGx4iwaEc3/Ug0HvesBAqEndZwFesKFCAtOVJObptxl/qCPo+iYD8VV/nz5Qfyoj0Bmk7NeptsX4o70SlK3YEKUb01ndDSnEItW3Tb9CuXwivD+8wW7ggmubeLgzQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9scCfDORPSH8x2FzZou9SIUQuCUSGsR2CCaTY9VGBc=;
 b=ATJuv2LBv2BeDvIaiRciRB2oaFonfm/mNmj1Lg/+y250iFG2y11AGLS9yt9mpjGXPx2IYOXaENlniyLAq+yxu25X0p0c663NMz/ffhgUWZILqhvFv7/NUFxiFxUkTUd2sUP9K4p+SRj5O8nfJ5caSqGxYizx7NVICuSqwUHiV6c=
Received: from AS4P189CA0034.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::12)
 by AS2PR08MB9788.eurprd08.prod.outlook.com (2603:10a6:20b:603::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17; Thu, 24 Oct
 2024 14:55:12 +0000
Received: from AM4PEPF00027A67.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::f6) by AS4P189CA0034.outlook.office365.com
 (2603:10a6:20b:5dd::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Thu, 24 Oct 2024 14:55:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A67.mail.protection.outlook.com (10.167.16.84) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8093.14
 via Frontend Transport; Thu, 24 Oct 2024 14:55:11 +0000
Received: ("Tessian outbound 99870d44e01c:v490");
 Thu, 24 Oct 2024 14:55:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 38642131af2d5fce
X-TessianGatewayMetadata: E/gheL5YIo3CGH9/C8UQs7ToJ4LI4qjaHV+w0wUESYkjfzFOZ+UYfzK8Hw3/4SiSjER6/gbedA4yUGyGAFnrZ+oS4oA0kLhM8uHNghPHp2MTQ2xUpOWzTgblFjwsTG2NhPsrMHFDLAir58WkTd92QZp76IswQjWKVZW71I4wMv8=
X-CR-MTA-TID: 64aa7808
Received: from L2869cc968543.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 11190802-E05E-43C6-86F8-F172746A2D96.1; 
 Thu, 24 Oct 2024 14:54:58 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L2869cc968543.1 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 24 Oct 2024 14:54:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v558CKjbY3MRK2zSTonMQJdvQ8FNDGXrge4YQIBzekUzM82vgLcfHJOlRo+pYB6kf9QLmKDUKWYShIRTL9rVsROXwoH4c0KiURCwZhwfeeNmcWImNVvyoYNZMkSDjeawJUH6K5U1sEKGGaJowSp+w8FPPLP7ExwVVNy5/oi1DxsjzRcnsYCU1UV9L3bgZAV0JyKirQ+NqMTiRCdN4umjBB5bND/bylVYirjSixwOwOeQukI9t6V48X1c+KVKAMHY467iAofS82rbX2phs7bNLEC+HG399HsR9MPnJDYHuWQgl2saJdTsZxzLe8uSiurskKmadLY8QVje9qkEXHZgXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y9scCfDORPSH8x2FzZou9SIUQuCUSGsR2CCaTY9VGBc=;
 b=LHqYkISJalAI2m+2lkvu9X2WccegeaZbap/RIVfkVYJd7ZOjGfenxqiPTh0Os8NXCf5oRKDM4YkAnvkhKeF1JOjSBXzYlTCw6D39SU6WUtlu6LP53GMVoxi3cC5zidgDOrNcRiIZy0HVUgSj0+3wUL5NsYxl8Xhx6f4s4yF5eLErBCJUaTQHPdpejb7eqZMRTEpIzmDVzzymKj8rSUMUEOSp4XO0dh09fF8Ewz0tLUXkaaw0blTwP0Lvs0aHjMn7bFhagcBYCAVRehbd1gzECaYzqiUaRhei7/1I3yI5hJ78p5/VJIAFc4/RE9huy3/JHPvOF2/yCdtmVq6bVrs5Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y9scCfDORPSH8x2FzZou9SIUQuCUSGsR2CCaTY9VGBc=;
 b=ATJuv2LBv2BeDvIaiRciRB2oaFonfm/mNmj1Lg/+y250iFG2y11AGLS9yt9mpjGXPx2IYOXaENlniyLAq+yxu25X0p0c663NMz/ffhgUWZILqhvFv7/NUFxiFxUkTUd2sUP9K4p+SRj5O8nfJ5caSqGxYizx7NVICuSqwUHiV6c=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by PAVPR08MB9650.eurprd08.prod.outlook.com (2603:10a6:102:31a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 14:54:56 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%3]) with mapi id 15.20.8069.016; Thu, 24 Oct 2024
 14:54:56 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mihail.atanassov@arm.com, ketil.johnsen@arm.com, florent.tomasin@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH 1/3] drm/panthor: Update memattr programing to align with GPU
 spec
Date: Thu, 24 Oct 2024 15:54:30 +0100
Message-Id: <20241024145432.934086-2-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241024145432.934086-1-akash.goel@arm.com>
References: <20241024145432.934086-1-akash.goel@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0056.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::7) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|PAVPR08MB9650:EE_|AM4PEPF00027A67:EE_|AS2PR08MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2041d4-2c2a-45f7-af31-08dcf43bdc80
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?ZzG0/YsK2HHTcyOpBDxwtQ/EjY5hJfXqfYagsj7znURJDXJjFV6vIMBuycXg?=
 =?us-ascii?Q?JlVMmyOeWmPE1iczTNAi8amMMWKxOHUpgqB7baO+jTyk/we8xSbzeaaRDxst?=
 =?us-ascii?Q?kpwROZ/+8F2rvxd1oVErpLbonY0R6yuRCKxGWqUocqaEdSFCVOu4cUZUfpX7?=
 =?us-ascii?Q?OARfOAC/fibD/75MVC6Q0tqbA0QCMGoyKRTxGD9bQ+FPAyVaC1qh+ET+E66L?=
 =?us-ascii?Q?aePsd4q2hW1DugUU/GmckBOIAqHCAlJUAhoz5kIPhlDiGY0H/YksCTK5ZvYf?=
 =?us-ascii?Q?LXsuHD8IRtR+twjosz4hPgB7xkCVyaCRqLJXPqJmi91SYgb6+oHcxpXX8bKT?=
 =?us-ascii?Q?Y/AP7K4TrIxEK1RNgM6x4Q3MHXlK/QYQG32/mpRCf1K6HvNMQ05Y0MxZoWMv?=
 =?us-ascii?Q?GHzCsDUmF/M657Zsva6pmC0LsKtpvxKGBRNpF6s1LMp4UqUvmxL9Q+m0/Yme?=
 =?us-ascii?Q?mJOj8IyIZsWaeeLsGw5JE0LQ+Y3eWzqYurzl0miimZU4x2TpbbG/UuCdFaUl?=
 =?us-ascii?Q?aCKS7YmPcZ8vHN2CNwDjjHbdkDceHslFXav4wz8QRSIGSvGzdyrNZpZRltop?=
 =?us-ascii?Q?LEPERBLrt7vO4wor3fagVsZBFCpdrO1jIjkE8V5s4dYPQE49/i36uU55tghK?=
 =?us-ascii?Q?Kx15e0HDpQeir1tc2hivP5k2Q6u4TMu1zRBBBs/u6xbtHAfEevMMmIW9cUbj?=
 =?us-ascii?Q?Pkgn2FJP5pG0HbkO4aK60yLSHZuGb47pWpAA3F4FcEaK3CWE/fCzo8IswIXA?=
 =?us-ascii?Q?U10pZABPqCoTEYbzUKrJ8MqziOErOFKPCsYawCBHaKanSLB08nnhPtQKKp4I?=
 =?us-ascii?Q?ZRH60B7GbQONC4k3vhdPSECUvBXpNSj4qjDLGDAzGIo4pYnq9Z3cK3A11D86?=
 =?us-ascii?Q?hpgjo/D53JwaRHnx6L0amSmvPQErXXUAq3du7Jr6i9HESJ4dq6nOs0x0YEWT?=
 =?us-ascii?Q?b7g0aEXF1eaVSTsjhWmFX4AOYEdwYHa2r8Xkd8U/xJq2rkUwoKI2+Mc5BIBQ?=
 =?us-ascii?Q?Vifglq3yS1J3VrcDYwyirXk1tgRwPuNOwk3LvLawDnUa5FgOtC7HPrfrnGpc?=
 =?us-ascii?Q?Lks53a2/cifGUWjtWTuLPA2IcOtb1nt4lBw706udnk98EMpyw67FREeK5EBv?=
 =?us-ascii?Q?nCwNStT6oLy5ZRZ9tupsgtPIhjyfGesMH/tF23CEOsT8C879IWIE0jAopEw+?=
 =?us-ascii?Q?valtEBE3ahqEx6kJUxvap7C6VitFIcWuoZmfWTbFAznMXU7cI3GYuXR8Cd4V?=
 =?us-ascii?Q?WLR1pUD85YusPMQadWiI4UItgunh15g1hsoJ/SAJjj1Qgwh6vPEChCy6RCd+?=
 =?us-ascii?Q?nH2ghRUJKU53vMeTyWIyG8ZG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9650
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:20b:415::16];
 domain=AM9PR08MB6982.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 05d963d0-3dcd-4465-fa3e-08dcf43bd34f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+goLv0lZkBMTldC2CbqECDkZ8vLBFsu0lUKVgZ9JbnKTwclXdH/mgT4/s4mS?=
 =?us-ascii?Q?XzZNbpaPvmixM/drXdSeYvskXQHt3ZjoLEYonBeYxK/SqqTfDu+PfIp4NQcH?=
 =?us-ascii?Q?ZWk+99LeGGNa5xlFgUJssYDvzk6z8jPwrl00B9wviUx2insf/stSKQkakrfM?=
 =?us-ascii?Q?+/elrzD2L2NL6H2+OiTSfVrCRM3D5GuAaEIIO98VyILzIxx1g+zswoSHOouf?=
 =?us-ascii?Q?5Prd+hN/esOcW9MJmzR3iy8aJ4T0CLmksvG78KuNcz0ob8bhhvtMuDb3PySU?=
 =?us-ascii?Q?WRi5AsOz/6K7rvlqRAoIx0I2YGJMkObLKMSvZRQoXhqxhBDCAkP5gbhIhzdY?=
 =?us-ascii?Q?QRpxQaVXKxviYYgdUynxiSVFZ0drfmHp6Nu0X+IWifsfe/DaCQaSq0TfJuZj?=
 =?us-ascii?Q?ylIhmos346dQpDp+MzfGxLIVAUwozL0LkXAfEOoqanm8eRs0yZSYN8RrE4Zw?=
 =?us-ascii?Q?taUchhSbB99q4rAZF7QJquDgewbrWr28VSbd79iu6fvzglg3yZmK+9NehMrP?=
 =?us-ascii?Q?h6y50CCBonFDjW7G0XcTrArihX0xtT4Aq2aBF+/N/jEwZ7/Cj49VVbWfht4I?=
 =?us-ascii?Q?R6Y6YkQwwfoF0IJF4DWqyX7UFbTUSdROt0dNT4vcN4rLltYMspDele60LiCm?=
 =?us-ascii?Q?DLUuxgYkp4T5hU7MZ+9jW4cNsabc8AfvFHQijY3WNYxQ0ASEdpP6pW3MoHez?=
 =?us-ascii?Q?gQ/J0xfiFwKMZ/sQKPacRM4xRTyzjvzcrQXbe3F4f6HIoibm55CXdzgMa2Xa?=
 =?us-ascii?Q?flhUYLhstjMBr6D5kunr11LsMf2fTDl+FaK+Aybu9uNIjqjcK7zlxE0q/UUY?=
 =?us-ascii?Q?0IcOqEtzxogmZpEkF6+qw7avK/WxkL4Uqlubq3HxrExxCwHRuSomzEmK/LMF?=
 =?us-ascii?Q?WqIrB4daVyxrd/kTzdu0ok9daKgEq5eSBejoo148H+Lh4IBAZzi1K63DQy+m?=
 =?us-ascii?Q?G7ldhUevBHhftfcUIroUNOehwnWFcmsicix52yKwyB9qS6P/9vl5gYsfO48d?=
 =?us-ascii?Q?jD65JNG9slZuRumS7Tqq7t/46zrcBrIx+l7zd62+6PF/VE/rV9gz/IyC5df8?=
 =?us-ascii?Q?j16ynFgfRCgOA2N7Fr45p8839q2zxhzRCjKLdxnosFZcO7K1vhsSxGTJm4Vc?=
 =?us-ascii?Q?90jqubpsvSpoNpWc2/osgdtyj2Q+lUMqadtbbMkI0LPEW/gs/wHuOwXbiNmZ?=
 =?us-ascii?Q?NltE2sUAZFUZyWsNONBSQGp+sWDN44GBrlMcBfHs7dEvYtvZvKdX382himaE?=
 =?us-ascii?Q?gv75PrQTmWcWCiwUlmlQH1Mfwa2oKftONUfyBzPowjCGJYm66O2fsetFZLv8?=
 =?us-ascii?Q?tUNGKSeO40kQZovNg/LKjZelZXac1hnCSE8WafGEd1XJt6JeW505jWVr+Mf4?=
 =?us-ascii?Q?zPnpTZD6+v2pLtbyttQlPITGaSRUW9XfLk+4/ahGe1X6/FBnCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 14:55:11.8968 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2041d4-2c2a-45f7-af31-08dcf43bdc80
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A67.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9788
X-Mailman-Approved-At: Fri, 25 Oct 2024 13:32:50 +0000
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

Mali GPU Arch spec forbids the GPU PTEs to indicate Inner or Outer
shareability when no_coherency protocol is selected. Doing so results in
unexpected or undesired snooping of the CPU caches on some platforms,
such as Juno FPGA, causing functional issues. For example the boot of
MCU firmware fails as GPU ends up reading stale data for the FW memory
pages from the CPU's cache. The FW memory pages are initialized with
uncached mapping when the device is not reported to be dma-coherent.
The shareability bits are set to inner-shareable when IOMMU_CACHE flag
is passed to map_pages() callback and IOMMU_CACHE flag is passed by
Panthor driver when memory needs to be mapped as cached on the GPU side.

IOMMU_CACHE seems to imply cache coherent and is probably not fit for
purpose for the memory that is mapped as cached on GPU side but doesn't
need to remain coherent with the CPU.

This commit updates the programming of MEMATTR register to use
MIDGARD_INNER instead of CPU_INNER when coherency is disabled. That way
the inner-shareability specified in the GPU PTEs would map to Mali's
internal-shareable mode, which is always supported by the GPU regardless
of the coherency protocal and is required by the Userspace driver to
ensure coherency between the shader cores.

Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index f3ee5d2753f1..f522a116c1b1 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1927,7 +1927,7 @@ struct panthor_heap_pool *panthor_vm_get_heap_pool(struct panthor_vm *vm, bool c
 	return pool;
 }
 
-static u64 mair_to_memattr(u64 mair)
+static u64 mair_to_memattr(u64 mair, bool coherent)
 {
 	u64 memattr = 0;
 	u32 i;
@@ -1946,14 +1946,21 @@ static u64 mair_to_memattr(u64 mair)
 				   AS_MEMATTR_AARCH64_SH_MIDGARD_INNER |
 				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(false, false);
 		} else {
-			/* Use SH_CPU_INNER mode so SH_IS, which is used when
-			 * IOMMU_CACHE is set, actually maps to the standard
-			 * definition of inner-shareable and not Mali's
-			 * internal-shareable mode.
-			 */
 			out_attr = AS_MEMATTR_AARCH64_INNER_OUTER_WB |
-				   AS_MEMATTR_AARCH64_SH_CPU_INNER |
 				   AS_MEMATTR_AARCH64_INNER_ALLOC_EXPL(inner & 1, inner & 2);
+			/* Use SH_MIDGARD_INNER mode when device isn't coherent,
+			 * so SH_IS, which is used when IOMMU_CACHE is set, maps
+			 * to Mali's internal-shareable mode. As per the Mali
+			 * Spec, inner and outer-shareable modes aren't allowed
+			 * for WB memory when coherency is disabled.
+			 * Use SH_CPU_INNER mode when coherency is enabled, so
+			 * that SH_IS actually maps to the standard definition of
+			 * inner-shareable.
+			 */
+			if (!coherent)
+				out_attr |= AS_MEMATTR_AARCH64_SH_MIDGARD_INNER;
+			else
+				out_attr |= AS_MEMATTR_AARCH64_SH_CPU_INNER;
 		}
 
 		memattr |= (u64)out_attr << (8 * i);
@@ -2325,7 +2332,7 @@ panthor_vm_create(struct panthor_device *ptdev, bool for_mcu,
 		goto err_sched_fini;
 
 	mair = io_pgtable_ops_to_pgtable(vm->pgtbl_ops)->cfg.arm_lpae_s1_cfg.mair;
-	vm->memattr = mair_to_memattr(mair);
+	vm->memattr = mair_to_memattr(mair, ptdev->coherent);
 
 	mutex_lock(&ptdev->mmu->vm.lock);
 	list_add_tail(&vm->node, &ptdev->mmu->vm.list);
-- 
2.25.1

