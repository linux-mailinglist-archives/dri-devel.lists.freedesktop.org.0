Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3633BF350D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 22:03:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CA610E4EE;
	Mon, 20 Oct 2025 20:03:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZQPI9J/K";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZQPI9J/K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013012.outbound.protection.outlook.com
 [52.101.83.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D509C10E4EE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 20:03:26 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=K79JdTk1OPqiLCDLhoEL5qtKRjQZeMbBm8sIE+4wjeop2B3GLrMOM9b6B0BGmvkuPqvsYH4+l22fLg0gmhV5lE4Gl9PeiLjn2/shkogoWkydKb7PopdYfmHZX9DbO/cci6QPE+JQVmT7Lbeh/1jGyEAbgSJZol/pF0E48lBJy4X9nupmh1fnXrwRBou+fkGbpNV2o2ASJirBAM9xfyBsCqcDbNWnhTICJgnXaZ3IHpuGSHmfClLfSru2aUnBWJd1d6erI16zONMjhfMQ9USbfka9yw7cprgTpljAtWGWM6RYbeG48GyiZVirprLF7vjE+Lfss7bY/sxGrfCXRqfj4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeRTBn6tahINQRyqksxnSxojD41hAdXL7du+a11NQpo=;
 b=BVkTqmcx4mKls1Jq0K2ctcUhIB+oOB1eXTAF62Duk4GZhvnQI/TQLoWjjwV5fy8H4YBmwsyvFPBICPSLOsGqrqKj0CkHmoIumE/0tr3MVECVQ4CiVZTPKNwv2rZ20VvvqVbawYWg0YrCn9P1lQZVLYW2q1BtnXAnmknFefCv806dHGma6ZQ+U6I7SMeRRacPq/dzsbUZBk3fyJcoUi4qDA/X+eipfaM+YeWbsAkIwBTXcRLUvUdw0fYxmoclNY2SVm4VknNhsgDF12/HpvpyDVvnsHd+0CIg+CLJVl7f0vA5QWpvuh2a7XbdMzvFzvkQnloO+KYwBWnjzc20eSVD3w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeRTBn6tahINQRyqksxnSxojD41hAdXL7du+a11NQpo=;
 b=ZQPI9J/KRK5p+Pc7U8xvyxpN8dUzWDgzdWMgsrdy3ovw+qPEO8k5DbLlJEY9s3Es65FVYwI/lRisVkgIghCx2BtZ5LGIz9f/3GUK5vdpN5dKKrQfGJ0C6lZMZvprveGFLnbD/IKvVSHfiJA44GlXQhsjamG7J2uMWVtHEYw9fvU=
Received: from DUZPR01CA0169.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::13) by DB8PR08MB5514.eurprd08.prod.outlook.com
 (2603:10a6:10:fa::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:03:21 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b3:cafe::6a) by DUZPR01CA0169.outlook.office365.com
 (2603:10a6:10:4b3::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.17 via Frontend Transport; Mon,
 20 Oct 2025 20:03:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7 via
 Frontend Transport; Mon, 20 Oct 2025 20:03:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jEmDS1qk4v7Xx9qFXWFUQPm2QaEAsGZMj8kdBC/AMHRxwvhJSyNdOVAUnDmZIfPeU2S2kKsZbye+nsVs6RIq6hjezOVg9evZUrjoSd3yg58+eeYCYeQPO8CtU3wvdXG7patxQCr3sd82DUIkCssI/9InAtFUusbXeROqzvXckBZZXn/HDBvkjMkAUdwuYsv4/G68bYXnwwntSS5VeqxT9TUU42rUB2SQ0BZTf5ywIn0iAA3q3WddrFup7vu2RLXyYtLz2TO0NhrKsbb0nGFqye8xqmN3eH7BzPEhEbxRFzGzg9s9zoxJ1LI3jQfSa5cAbn0knqw/TRRZ6RJLrwiNOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeRTBn6tahINQRyqksxnSxojD41hAdXL7du+a11NQpo=;
 b=UIUS3y1zRqOL6FM6gtARD7Ti5Qp0gm/rlVLX3g0D47Qgxtxz2OzElkch6l4mQxZMmQqaILawwu1vTCIlqYBV8l0FjTkYj1xYIXllMC6Msf8rdjs3xE9TO468Fww2h/dkE7ZybVS/8F4CFEPt98gFHfDxqFsl/hFtuuPlRDStlMKgbNF2ruD4LIi/M0Bf+snrFt65qjKY3frvlaM/KHR3UM61BhekpZ70NvACLfgMgqJqNi2Q3AYEPif0Rnc7KloMCz5uFykOS2G6as/MUHzkBxtKwksEPIH8TvOy9dnHqZ/PKq35LYxztTS+6KnTD2tLpOKHUwKXkgqByYm8FpVJ/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeRTBn6tahINQRyqksxnSxojD41hAdXL7du+a11NQpo=;
 b=ZQPI9J/KRK5p+Pc7U8xvyxpN8dUzWDgzdWMgsrdy3ovw+qPEO8k5DbLlJEY9s3Es65FVYwI/lRisVkgIghCx2BtZ5LGIz9f/3GUK5vdpN5dKKrQfGJ0C6lZMZvprveGFLnbD/IKvVSHfiJA44GlXQhsjamG7J2uMWVtHEYw9fvU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DB9PR08MB11312.eurprd08.prod.outlook.com (2603:10a6:10:608::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Mon, 20 Oct
 2025 20:02:47 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::5d5d:a4a7:198c:fbdd%4]) with mapi id 15.20.9228.016; Mon, 20 Oct 2025
 20:02:47 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2] drm/panthor: Fix potential memleak of vma structure
Date: Mon, 20 Oct 2025 21:02:43 +0100
Message-Id: <20251020200243.1324045-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0269.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::22) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DB9PR08MB11312:EE_|DU6PEPF0000952A:EE_|DB8PR08MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d5e5948-d761-4ac8-a4d6-08de1013b79d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?hH+ahozvftM6jO+cZhVOg1fGzo5zmtaenMGWQriRQQRWHGNqlytfwvPle56+?=
 =?us-ascii?Q?LX4CTwQlYS84sx57pZvmFAU1BfXGpy4Jnk+nkK8Ib61P19nT3iieIULO0jY+?=
 =?us-ascii?Q?uU/uEe5trLi3hOSttztIlZViijEO2OPjQiDbA1Z2BDTXhfVHEmI8EzlTg37j?=
 =?us-ascii?Q?a/oMYMctj9BIDLyN/MGzEqqRF9fYayNvoPaUOqDoDz0PbPsc+2TLKVJRCtSb?=
 =?us-ascii?Q?CIQIXSSzEAY72uA4URurxY6sX2i3Uogh9k7i+zZLkIUNwWrcyszmtcF96o6R?=
 =?us-ascii?Q?lf+6U8eBSaP/vnQAF0UlHtl2KJUpBntIXavH4J1A4Pb258XXKC6EqrrXMMRT?=
 =?us-ascii?Q?G/6wMJCdCCBRkqOpx37ZzQMLvGlBR3VL9QONpMEGWe5QfTRWrDeTh18GlbA1?=
 =?us-ascii?Q?zRFir4Z1PDHkbVnCmLIsG9Y+RF9JxyqRYAMuLiJZeg9PiIsCe3eFrwKg3L54?=
 =?us-ascii?Q?9VTdTWu6LroXqPK76h4QHEK32xw+43M9Jd1n8vk6N5jjpogqWxKWjY8zf37a?=
 =?us-ascii?Q?1gMsjLVd/6JIA0FtVjxeXWRmcqS690GMP9vF3A4Xvmrsutv6ljbFVqDS/6tE?=
 =?us-ascii?Q?h0X0uvBYd4dheko+NJTiTgXzyrh02qfxktpPhl7yKt+9Ln6K2hCopqtSgm+f?=
 =?us-ascii?Q?4ICHSxp5ROHeOBZTp8Y0RH2IqxpBPSYDm92HsGjHXwtXvp2RejCY1xTCB4Zy?=
 =?us-ascii?Q?L6SgDUjCow0kq4fvsc6NEqzaoXR4zr84yVFgJUE3+Gh8EluIJAvJu04wRU+E?=
 =?us-ascii?Q?pPqyoOC3gbAWkQkcwHpSBTaVfKh+YhilDZoU405ihuteUqige5+PCnBpIwQl?=
 =?us-ascii?Q?PBNyYXSVkGPTC1xsc4dpeNI8JMXhAYhj4l+r2jiFxW/0WgJBrZo1CqwRynmm?=
 =?us-ascii?Q?xxnhmJncDwakGA80LxBjptsuxM7ZHOnVY+V7avXE7hNX/C5y3DryATZdqBHx?=
 =?us-ascii?Q?YpFPNkSGPh4m1dxHXVzMUo/nP7tOZSB+s7Yu0M0nxahvwF9aqvI+P3xZgoRq?=
 =?us-ascii?Q?kF2GhAhJwKFp4b64Impp/Blrkws61bRzMimdkv5+Cid4hnwqbJ+O0QRUHzLP?=
 =?us-ascii?Q?qoIXIpJRPOuBZHx59bAWpFeM4vjwmGLlvwqn4h5uLH7hF0IsIUs2WFssv9Ww?=
 =?us-ascii?Q?F7feYozQqtZqiAxWXMIFktDSZOFCFcnBBy9mY2b8QTsViocA5g2vnPXqpmDo?=
 =?us-ascii?Q?81/mFYGcxL5vW5OyezskY0aCQWY9GXbLGlvtizto7GXEOTGkweStApNdHxOt?=
 =?us-ascii?Q?2Sv8m9QqtK0CwHxOsoHBQroZv9AKOSoxReRch1RARgRzpXMBke4EZtMIdHK5?=
 =?us-ascii?Q?kQ5t3F5yBb4cXdJduN2KwaALF3flibfk8eGlVqyPBmaLYcBEvX50U5IGBK34?=
 =?us-ascii?Q?Fso1hFX/q87m4BVbOj8CCi+Kp+lfPy/YxDIeRsCcuBDMkR+CigqKceyOn4Ql?=
 =?us-ascii?Q?VwXhjw4Dz8fBP9jL8xb1A4EK0V3IfZt9?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB11312
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6be0d997-7576-4fe9-0a86-08de1013a3e2
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QAol3toJIni5sbHsYtSiYbrH9PZQ86zEVVX4kICntXGdHBpYvHa/6qmrDMdn?=
 =?us-ascii?Q?6DWoX8urH2gUke0ja9sTphqoxgfFadpW+GZ0irUvGOa8wecLq4agKu4U9ofp?=
 =?us-ascii?Q?xeE21s0oLakZTbZi+UP743rpJjdQXNlgGn0r19ly5P4KIf6bNpiKLJyIaob4?=
 =?us-ascii?Q?KBlbXynL13dqlvwLBeCI4+RBuBmXKS5Y2M3F8mQhVGQkSDD5WVyAUqEMIDx3?=
 =?us-ascii?Q?73CdnaLZF1qNCwGLeq+U1UwlOLsddc18n7vyedW2X69jKQG+IJllPzHZbT1q?=
 =?us-ascii?Q?A3v7eZbNxbBQj38S9eZNqFM9SAK4y8NwjiG9u8PU0v0PqyRM7504v7vl8uzx?=
 =?us-ascii?Q?31Gm4V0JGt4h0CNDlNkJWD0SW67KU28TNacrktz4/8K9BpvYVihNZyclY1nM?=
 =?us-ascii?Q?EmG0U/Zhe93BhHTW8KZm+zLdlNZgdwYy0Od5F9IzGsplDtATx01te5SfLqB8?=
 =?us-ascii?Q?2GplGndQIbpKg2JXnXfen7nDtyOOx+CZFp9XUX78gWuBH75Q2HaZlDovPtXC?=
 =?us-ascii?Q?Pe13dQ3wQGGfYcl7zoBzVy+GXngSlkcIEevm3mc1Y1iQQCQEpVpXukruZxuB?=
 =?us-ascii?Q?D3YQHvCvNRcPOMz/hIEofFgna1cyQP83V88f91kBSuJFvXa2DNwuo9VzNdVh?=
 =?us-ascii?Q?uIKxCbpbuvS/hCUzBSXMzzkwYxeXG4TfLqPNKFWZLMsYJHGy8//5Q0z3yMVT?=
 =?us-ascii?Q?vC3CE1lJEWTbgddIaFRQru8sUBE6qqPJMuhhFfVbywtFxG4CU4IFYlbktdiU?=
 =?us-ascii?Q?f8VcLIAl2dM5r7hOCGx8w75sGtmrcb57FlZqKL1Ym+ht1lrOm7PtOU/tK/I8?=
 =?us-ascii?Q?xq3E4pgpBnhIDcXORDb+k7G2DhUbJZfvxh1Ge+HACv4neMzhQrHhIn20B78K?=
 =?us-ascii?Q?wVIDCXwu/eZsHnioeMrsSM/Db/Z8utRHP3K0q2r3WY7ZTZFiS0sz7g95bEue?=
 =?us-ascii?Q?AGAS/X7gyvZmZyPk47IGvq38BczqlUQ4G/xdg/Ab1swYpg+kWs5srMp27Eq1?=
 =?us-ascii?Q?Mv+d+o1W0LXb399nMw46FY9ecuitykZHVZ4ae25jReCs7600U/RUYYxLCImo?=
 =?us-ascii?Q?UHgSgM08i+8DFcNRzob4IdnAxjWCC0iLU/yVMTiV/7hBsXRbyXYO38kidfXf?=
 =?us-ascii?Q?64vujTlPxlLnShC18OhGJG8uxsVdvWqmmq0eQX+Ay3NtrwkDUE1EtEdZ/SLW?=
 =?us-ascii?Q?1mFYwZx5yCp/duN+w7SxeQb8fsDf9hI/wB0/7/SEt/eJaEAuYD6cnq8EWQyv?=
 =?us-ascii?Q?BErDcY5LulNBLiu17rDmd0AFFjq+hBtcBMx34r8v2l4V3K0emf6RxC7emTTj?=
 =?us-ascii?Q?U3rQBGQ3KM1IyhmMQJNdFP4ab0t0ZN0z4WSk9uenbKBYlurKceBq8A6m8jJ2?=
 =?us-ascii?Q?b4wFerYaBWcEbHHv3P975RXMO60Tz5yl8xhp8sU0CfweyOJKJzFZrq3WjYy4?=
 =?us-ascii?Q?Oea8w4qiM5xQmPdMMRQEcTzGb3IUlNZbnaRCWtmVwgs0EeVUCgrRAQNydCib?=
 =?us-ascii?Q?Mwy0aePNeDAsHamU8iPncnn2uhkQ5I2EYFVFDsTp4Eo+8JNdgKXEszAyALjA?=
 =?us-ascii?Q?kzQApMyWzJO+cTiI3xg=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2025 20:03:20.3059 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d5e5948-d761-4ac8-a4d6-08de1013b79d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5514
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

v2: Add panthor_vm_op_ctx_return_vma() helper (Boris)

Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Signed-off-by: Akash Goel <akash.goel@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 6dec4354e378..63af8ee89b08 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1146,6 +1146,18 @@ static void panthor_vm_cleanup_op_ctx(struct panthor_vm_op_ctx *op_ctx,
 	}
 }
 
+static void
+panthor_vm_op_ctx_return_vma(struct panthor_vm_op_ctx *op_ctx,
+			     struct panthor_vma *vma)
+{
+	for (u32 i = 0; i < ARRAY_SIZE(op_ctx->preallocated_vmas); i++) {
+		if (!op_ctx->preallocated_vmas[i]) {
+			op_ctx->preallocated_vmas[i] = vma;
+			return;
+		}
+	}
+}
+
 static struct panthor_vma *
 panthor_vm_op_ctx_get_vma(struct panthor_vm_op_ctx *op_ctx)
 {
@@ -2081,8 +2093,10 @@ static int panthor_gpuva_sm_step_map(struct drm_gpuva_op *op, void *priv)
 	ret = panthor_vm_map_pages(vm, op->map.va.addr, flags_to_prot(vma->flags),
 				   op_ctx->map.sgt, op->map.gem.offset,
 				   op->map.va.range);
-	if (ret)
+	if (ret) {
+		panthor_vm_op_ctx_return_vma(op_ctx, vma);
 		return ret;
+	}
 
 	/* Ref owned by the mapping now, clear the obj field so we don't release the
 	 * pinning/obj ref behind GPUVA's back.
-- 
2.25.1

