Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89700ACB0AD
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BDC10E2ED;
	Mon,  2 Jun 2025 14:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="LV7z3RUd";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LV7z3RUd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A612510E52A
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=dK7E+s05Dbo02x5/JRJV2BBy+BCJgxC4Nk7Fi5guOgcYCcCfrzkfSz2T/JL+pNmWihfTU4WtdQ0g4LI+JWXW7id/OBsKpT0Do3gERfpSwO/fP3o+B7UEh6GnJxazwfrOFjh7LFx73nRTzQ38ldw/9UfYWtBxEFX8DiLkDaPlp/yi9EhnwT5b23XcnFPYC/Hgv/6FOQcbcapf9NRtwyB29L3ymFD+GZNS4fQUAAZg7JnKaDAmUQtN7R/3Ywdo0F4vBsfKAyw+O/VFZoPaLs4sioWS2ATDfS9pO+U4o2Hv3rbi+sk+kUV1/gI+JJRN5qH/vLtnIGlqKquavwQJ6qrHwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLzdThl+Jd3LYnTki0s5CPd3/KYyY5Eb2AcEqcA6SGQ=;
 b=h0k2+DlmtTrEuiiECbdoWImI6Z8utxP83jqVkomTkjpta/YhEojYYD27RdngP2q9rn5BAkGUC6ZY+yL9TveI0jTjmptcj8a4acDrNVZ8v63LMkTxVWXzZr42+mnrTve1aJFbLfcRV6LHcPlwVDWv2QRRSiKhO8SMpcSsT+gkJewMS8bi6/KRfxmFUKZPgtZjxBJ1c0vHBbQHvyUljx6a/LPy7yq9PtpCg5VeNcdt+WsZMzFvOX1RaGUL/sLFtT4+puSNtYcZ7abyAPTHXYZLa+pmiKK2XnnvwCZNDFVrqxkk+uR54GqLFYG0621vW3ZoKEH7949nRXr+v/E2Zyd+WA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLzdThl+Jd3LYnTki0s5CPd3/KYyY5Eb2AcEqcA6SGQ=;
 b=LV7z3RUdIq/OxS2f/O86j0iWweTfF8EbVGTkQHQzg7QcptmLRZhFdobmTDrWpQ0FAR3YAjvgeZNXtvU8niIm2dcV3k1NPfkncMejyW0/lOXMLRqVRfuqOKtnvUUfhhmDRplSW3RXTK5ukP2Lzj77uFutxAIb535N6b5KT6F8iio=
Received: from AS4PR10CA0005.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5dc::13)
 by AS2PR08MB10294.eurprd08.prod.outlook.com (2603:10a6:20b:643::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:09 +0000
Received: from AM2PEPF0001C717.eurprd05.prod.outlook.com
 (2603:10a6:20b:5dc:cafe::7b) by AS4PR10CA0005.outlook.office365.com
 (2603:10a6:20b:5dc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.23 via Frontend Transport; Mon,
 2 Jun 2025 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C717.mail.protection.outlook.com (10.167.16.187) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qlm0v+uDAaK/jn3yeugf/+BlAjB50C92cDzHQAXzNh+3GNefPwdegD5vmOWFRydOYmePXVHbtZs9Qfiml3XfPuHEXohETH7sK3aaUDNcxQxAc+eYEL3YjgwIOA6jV0Yd+JoQhR/y/TrLZHqH6KqyfcU+y6HRr1VOK1AAQFsI3wHhUHUmH0u+dpwX6v52dwkb2tYBR/9A6H1hMfHkdkKNzOZbUHmozKg14trFY5fam+kz6ilLyIq7ixSmDuAr7GgfcGsiDqAIsPsCBzUJM6+t4x7vXOJ8MQw2Nr6ZhxL25ckEy18SmIbE+ja8GKwQIX30KlaTuNxTOL0sHdtttONMyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iLzdThl+Jd3LYnTki0s5CPd3/KYyY5Eb2AcEqcA6SGQ=;
 b=LlfPdXgC9nBecQ2IfZEe8P7O+DSBc9UxjzBOdaRRwXdr2gNNENGp69f3PIui2v5tF5CAxLghdbBsfkdje0T0AIDl7DZFYn2wZphPoDwk9VP0E4bbVrsapwTCw8Rhci/azdSmtIHp5H0ozQOwg/qXn0w9fPf/u+cajVzI8D623pEp1XBBSYoDpA/Ayn/eK0pe164DB/CU9Z1cqPzxGjwmAoahDd/a0BzYmB6rKwP4DJTCmi0zSw0REoskemWSdqdkpJQXDrWwIoJzRQtHfmM5RSM/0o9yClYS50JjdQkpvARlMc9OKYXgrEstiq9sLdEu/BYSqPNlVbhv7fCwRKqw0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iLzdThl+Jd3LYnTki0s5CPd3/KYyY5Eb2AcEqcA6SGQ=;
 b=LV7z3RUdIq/OxS2f/O86j0iWweTfF8EbVGTkQHQzg7QcptmLRZhFdobmTDrWpQ0FAR3YAjvgeZNXtvU8niIm2dcV3k1NPfkncMejyW0/lOXMLRqVRfuqOKtnvUUfhhmDRplSW3RXTK5ukP2Lzj77uFutxAIb535N6b5KT6F8iio=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:31 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:31 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] drm/panthor: Add support for Mali-G715 family of GPUs
Date: Mon,  2 Jun 2025 15:08:10 +0100
Message-ID: <20250602140814.2559538-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602140814.2559538-1-karunika.choo@arm.com>
References: <20250602140814.2559538-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0305.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f6::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|AM2PEPF0001C717:EE_|AS2PR08MB10294:EE_
X-MS-Office365-Filtering-Correlation-Id: 416dfee5-6d5d-4679-606b-08dda1df0a32
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?s9ErvtahoWIObzJ+FLfU+h+vVJEt02+H5JbW/+Y03kI7Y0mKUivYhIv3RaFJ?=
 =?us-ascii?Q?+4uQFHn4pyxWogCcZFB/vKX/hbqqJkvXbPn+nbHUwHtBev2M8VmiNjC4/C03?=
 =?us-ascii?Q?YKNNb9ucQvvVS+YJK3pzG98TUouwRUGf26pe3wfkz8zns1ueiIHOUOVT/rzP?=
 =?us-ascii?Q?7vQ2GT3Gs7E8+giXu20RXhGLipEurQQ9FeN6kkKQQkIL1RbxpUqme+omd4h+?=
 =?us-ascii?Q?01HPGQSt+/MSzl2eMQiSCkcvtXUXYY2xmhHyFJ40oJYzZruyzNo/SP2SJZ1o?=
 =?us-ascii?Q?Q7+uRANrlTlaDtjymJrM2fCvhzxkWBFXPnbG+eP9MZAvLh30vV2+WC2N3k0r?=
 =?us-ascii?Q?5xoVqjgYu850ONlXS4UIP8zUY2fxijb4rgqUjjvknK1rGWa1isnyTcRo2znw?=
 =?us-ascii?Q?sPNpiJ8q+0A7cHU+Ph9iRlN3m+wIBvNhIEdLu/XbcjXYoMl0B8qv610yWd5J?=
 =?us-ascii?Q?Nmkd6PunUJer1uAHuIpzfNtcC+JH0VNMw9p4iGN2XbgPlCfcXNqVSuBGDbBw?=
 =?us-ascii?Q?8tTc9JvXN6mUxjG0R/jE0sGtnj0oEP85HT65VXYBZiXRt4PIt9xcRU0tmBfe?=
 =?us-ascii?Q?XU+2yHyToQp+ng3lGaqqOe5/TIf96eq8dF8waqpmSR37L4s4P5PbXWJHH/4Y?=
 =?us-ascii?Q?oOcKA3fHvOKGOwguSy8F+ePsW8esrwABoOZv6e/C5VwiPkumWsUWftamGQ6K?=
 =?us-ascii?Q?EM/7A5yt3m8elK2Xox+THJfTkae9pmUy7J5ZmaWbTvevnk5PkNo3ns7B0xYF?=
 =?us-ascii?Q?O7ZWgPQxYsXunk8LKeLFFVBz9vBD+PRhoQeGx0W2rGrx5QGlGysfuvKUbCKZ?=
 =?us-ascii?Q?bbf6HfdZgKcl5pDrXghJzwPIlgF/315HF30yRklk/Yhqfo3hi63x9Uz/lCMt?=
 =?us-ascii?Q?jK1O8XeojZVo/fYvFWDvZSQksrvFwOl+JWYg9IJ+GgnMrwSxzMEeMVK/FsYd?=
 =?us-ascii?Q?jGNX5NrHWMuSdzZzCwL29N+S4UuCR+xPIFfe6CUTpgAg/jR1TB3RkufBAfEt?=
 =?us-ascii?Q?ZbnKQMtfvIwFwM3UarhwyIzybAHGcOW6zf7nGOHLsCVzfMe4HD1c2F0rJ8ub?=
 =?us-ascii?Q?M+gfSWnBovLaD/ReCB/WKE/ljslyePvEKu+8dmCjqYmVgjGChfKflwNML5Er?=
 =?us-ascii?Q?F5YfFf/AAsPhVmfXHPGS+x6YEaL+Ib9cYi97ssE5cJxr5G65iE5tkEowF5fE?=
 =?us-ascii?Q?jP+twcoLvLlO09biL0iwM4Dc+oTS+ibHPn3ddpMmEd77MrGD4UFLfDuBriyY?=
 =?us-ascii?Q?hEiz+w5uIZtWf4kdJk1Xug/+7LXFwvcYRPYoU/zv3Q=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3640c55a-2a79-436c-ca06-08dda1def43c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jaQqzzYHlm6b4mjWYxrYt4B/lOqzRTQ59Mlb7HBQSbU9+DWNBoFXQPNmmiXl?=
 =?us-ascii?Q?IyFIP30/beBByWTF7TZy6x/7JB8g4+jt7aqF6WPMCCQAGlruQE6wkwP4VmsD?=
 =?us-ascii?Q?mTzTtCzMHjVbi9G1wiXTuPq2MpMqKW3Vu5JFLUFvGw+U0FYVsa4dsgg42j2Z?=
 =?us-ascii?Q?e1BEmB6Znypkjz0usL4zhHfX79waMK5Ad7dgWOWVDY1FqwItlIiaTr1rzWOk?=
 =?us-ascii?Q?TeofBjjuUXwgpxvSZxLIW5tXkxg2u8+VfRO4O78+NwS3VmJPFNorVebuaOr4?=
 =?us-ascii?Q?c7D5W7Qrjn8FH2UpQsCHjXO1i/M7QtxE5GX/5RaSry9SToLV5V7y+n/4M5sy?=
 =?us-ascii?Q?rAlbE0wQA3ojAWU4IUBN1p+VOa2UagjiTWhRrb/z4YYRT6/Uow1ECSWBoqKE?=
 =?us-ascii?Q?75DwLrFl75eULnM9chcOwlMIrO6zRt5CIKQmHgg9I1T22I6O/WuJYyagvNFO?=
 =?us-ascii?Q?EmS3pTNvi+R1WbgK2ZMu8+yWyZtyz/MvI8A3vByaOAVL1+UNyX33uZHbdLW9?=
 =?us-ascii?Q?1WiAShBxN1QzpSC3WxtvmfKI/MuAjHUseU1LNpzI8ffBq81lav0gesELeYR0?=
 =?us-ascii?Q?mYrmjll3lVTk7HWju1NSUkAw3rET6GEcsNzUkT7wV/VczNK/2sw9no8z9Ezs?=
 =?us-ascii?Q?FaTePFy6UdQd2nb4b1a6tN16ZKV7Aok1dUr1wFCwm4Z1rOFIxZDhpAGjpvQQ?=
 =?us-ascii?Q?ReEw7V6TkHiDxLRb2mCypJraLXvAhNVp8oGuDxZePGUw+L6SqOUvhtIJWmoV?=
 =?us-ascii?Q?WssGycW/3OQNKf2ywGlLlXynFQ977L+q7pQUG30xLGC4exHy47xZ35KhdrRn?=
 =?us-ascii?Q?ypbH4LhsHOqUyN2f7dwQB+8UqqlAXJxwoKAaqxIE1/tYKFWrQHnLzXd14FTp?=
 =?us-ascii?Q?z6mm6xwrUTKtRheC35wolSvKHNSX0x1y7aJQ7SI5SSMWszbH8j6dMdMuYHr+?=
 =?us-ascii?Q?o1Z9OIPdOpCZikw2tVICuiUev2qEBC/yrWxHQHn39df7Q+0WXJBqIpn6crGJ?=
 =?us-ascii?Q?4y3Z3Kk0huZpVQMVnOkoxDCcsvJXk2nrp7y4f8CRTstjesNqsRomvsZrukhF?=
 =?us-ascii?Q?cFenhBDiK7L24XIl+uy8ss8fyCiBkZGsoA9/4QHj7i2GU7PIGIb8yrUsQuON?=
 =?us-ascii?Q?wQgU3L3vIDNdO+GWIDW/LU+MMwzCaY0YRJjvmP6LF6u+H5l0IpMVniAA4GWX?=
 =?us-ascii?Q?/Otsyf8ybq7gYh+W2KwR/5otEDqUErpDxcWcMeajshzjZQ9gXkK7L10+6DRa?=
 =?us-ascii?Q?DujhZRhhTCwKl9VyVV/9P7Pj8RcxZVlleSv0wZR0/LQNaC5omWLyBrwwGrW+?=
 =?us-ascii?Q?Obt/8+L+d9co+CwSn0pH5FmhfTf3b7GWTUsJQ1Jp5sEAO2ROrtQVrPJEQXCP?=
 =?us-ascii?Q?h5omj1VrfSicnvk+Q6JacdafSDZ86DWdo2+7u7tP0+TofZR5ee4fn1h/LSrb?=
 =?us-ascii?Q?lZ8gqXHFiX/I1shfKJ89A8P7ZhJLjaxn6zkGCN8JVB3TBBYGQPBJ8L34cgpn?=
 =?us-ascii?Q?t9DC4cepVXIhsHCIYUByiKIU9843UiEC3nZY?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:07.6284 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 416dfee5-6d5d-4679-606b-08dda1df0a32
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C717.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB10294
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

Mali-G715 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info. It also adds the following
registers that are specific to the kernel driver only:
- ASN_HASH_0~2
- DOORBELL_FEATURES
- PRFCNT_FEATURES
- SYSC_ALLOC0~7
- SYSC_PBHA_OVERRIDE0~3

Additionally, Mali-G715 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for the Mali-G715
  and Mali-G615 GPUs.
- arch 11.8 FW binary support

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 11 +++++++++++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index b7b454d16f12..fa6e0b48a0b2 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1404,3 +1404,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
 MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 5e423122cd4e..f5127a4b02dc 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -29,6 +29,9 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
 	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+
+	/* Introduced in arch 11.x */
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES);
 }
 
 static char *get_gpu_model_name(struct panthor_device *ptdev)
@@ -36,6 +39,9 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 2):
@@ -46,6 +52,15 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 		return "Mali-G510";
 	case GPU_PROD_ID_MAKE(10, 4):
 		return "Mali-G310";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -85,6 +100,9 @@ static struct panthor_hw panthor_hw_devices[] = {
 	{
 		.arch_major = 10,
 	},
+	{
+		.arch_major = 11,
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index e7a81686afdb..4eaa2b612756 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,10 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES					0x60
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define GPU_PRFCNT_FEATURES				0x68
+
 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
 #define GPU_TIMESTAMP					0x98
@@ -83,6 +87,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT				0x100
 #define GPU_TILER_PRESENT				0x110
 #define GPU_L2_PRESENT					0x120
@@ -109,6 +115,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
@@ -117,6 +125,9 @@
 #define   GPU_COHERENCY_ACE				1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
+#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
+
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index ad9a70afea6c..888179effdee 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -310,6 +310,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.49.0

