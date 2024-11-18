Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4789D145A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0FD10E256;
	Mon, 18 Nov 2024 15:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="KULXIRXh";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="KULXIRXh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2040.outbound.protection.outlook.com [40.107.21.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B3A510E256
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 15:22:35 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=XJ1ofGdWBvYH7E03ZOVRkJMbVP0fkvsdbNtaYrWSaOsrMrHOQVAoUjYexMj9v2KS3OQ8VAaxANLetvknOSyv/UoBq6VGcKfrG1In4rvNvaU+dhfaGKmDHEEM7RTaGsgKscf22BRqsqNeufZdYu1YklThUK9V1kFMSv/x1qomXRA8zpMC+wB2nCISNqZKGu9oB5SVVg0LP4gnjBO/SMPtfNXiodVQGkz9JlfrsH+BnBTVXZXFaeNR3y/YzSy2zKn8bfwDb+mnAHZQFnn1Za9Ew9RDjD2MI0M6nG88/tf0LfYOr3hiZ0+0ehHkP6vHFP6bLPvLB0tlUf0fTOWpIG3JdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBQB3tGPXPbSrSjl5rSCs75wItOFoSzWVcYhVKWY2Yg=;
 b=O5R0YjmP3EaXrI5sQhhnSS/6lcoG7G3WtqyKCM/9mdj+J7vA/DlffgNIsT6BDHzpfJ0fwaj7Cf4edLu06SnD8Z0IaVmQxlLR2y4PU8z3k9qSnCTedVbQ/gqAY07rw5B3lpr83gzYkkXj71MGw4bcGTO1JoXoqnTkLdmRDY8dTwVPHrp1dfFYxoz550s/i5jlrr01gwR/cWCmyMv+F/9UVuUvnM/150h9YPJ9Ov7GhxGaA5s9kdim6lVt0PB2efaMXJV3ocxPi93p2kvOH+JVQGux/yU2E9eZhwVvuIRdfAZRRnTqjmFovI67wulJuvwh5NSfsoc7tb/PtFc8OE/0fA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBQB3tGPXPbSrSjl5rSCs75wItOFoSzWVcYhVKWY2Yg=;
 b=KULXIRXhlkGBlw7LbRMoF1KjCHbkHNZYk5Dn9M0MvGpiubVMePgcozi3SU8AG2lOlMkwW505xpwmGIQThKiqaRKanKms9UvaXV0DDue11QhHCFxh4olups36E+UtgNmJlhJwwzLKSzDQH3COYYbX83EOq4kOYHBqV/B05UX2uSM=
Received: from AM9P192CA0028.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::33)
 by AS2PR08MB8831.eurprd08.prod.outlook.com (2603:10a6:20b:5f4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Mon, 18 Nov
 2024 15:22:27 +0000
Received: from AM4PEPF00027A64.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::3e) by AM9P192CA0028.outlook.office365.com
 (2603:10a6:20b:21d::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22 via Frontend
 Transport; Mon, 18 Nov 2024 15:22:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A64.mail.protection.outlook.com (10.167.16.75) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8158.14
 via Frontend Transport; Mon, 18 Nov 2024 15:22:26 +0000
Received: ("Tessian outbound 99d3b165dfe9:v490");
 Mon, 18 Nov 2024 15:22:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 61c78397ef9216f5
X-TessianGatewayMetadata: WiQ7RdN0t9x8Xot5PkRzjJcZbLmwcL0QxD6+lFINXKRdECeo/IqvCb0FB3E5mpbd2BVo0m9wYEqz+wfBX+TpZYCW8ItqTRvZaL2B2DpxPSYbl3ZJjgyosEoPgRovM+Tf0CH3no83T4U2ZSKOS+pNVS/q0gZl85PSNyKdYihVg4o=
X-CR-MTA-TID: 64aa7808
Received: from Lbfceeb3ba0a6.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 40365822-C5F6-4E32-8B98-174E90EF275E.1; 
 Mon, 18 Nov 2024 15:22:19 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lbfceeb3ba0a6.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 18 Nov 2024 15:22:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivaiMtuTvBIaS3ooLwh9GVsarxShY5KPCk/8BBBQqTo4OJ2t8U6L6sdOEjXhw2D6udBIrekfg2maLv3ec+lxD6uwzfQBIesuuwcdGBYwDIJcFOnEgKA7H82whRQDkvi9HOFCZsq9HYBkoS9DdHLUGmhwReij/Q1+18rx9R+r9DVqox/2OxTYAsG4UkgCLd8HvhUGIyIgEY9Ksi9x0iJ1SyDVTdoFsEkR/ydNWSvrLb7V7PoOGn7mTu91CVhPFJ3PDcAQjnvB0EbpEqWDgGeTuvZeFMTBCYp0ozcYGXrDNFZKEg7kK5ZK0RCwZA+OFHmdtGHpqCM+oh9ntEMX3q2Mmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBQB3tGPXPbSrSjl5rSCs75wItOFoSzWVcYhVKWY2Yg=;
 b=TV5qbJ9jkjlbHEnKKbSzCCWsKfhRg/5RtenCBT5QQahHROYlAl0W28uh9skA6J1F0yNfpMjwwHozA7XHABYm/8fNkZDeSCIreVdgYIvhcg1UpxaLB67W7nlgk60lyMTgRBvXPzlWHgbQUjvRu2Jpb2TWl6tnvKxM4NOx3AmT0i3h68nlFStEin9Ix25ojhjIp2p2FWCFe/KPe7isQE74RSMZDyPxW7AgXFY5SmYvoaCFSGlqoeRcSM1nptm9fJMTHTUJprxdAwBpR+1Oel+lNvafJtaOrbDybXIrTb1foQt93PZtVGUcRAshoAc6ftfDcN07Dq/0UnLh1SKfUW5Hhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBQB3tGPXPbSrSjl5rSCs75wItOFoSzWVcYhVKWY2Yg=;
 b=KULXIRXhlkGBlw7LbRMoF1KjCHbkHNZYk5Dn9M0MvGpiubVMePgcozi3SU8AG2lOlMkwW505xpwmGIQThKiqaRKanKms9UvaXV0DDue11QhHCFxh4olups36E+UtgNmJlhJwwzLKSzDQH3COYYbX83EOq4kOYHBqV/B05UX2uSM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB5PR08MB10062.eurprd08.prod.outlook.com
 (2603:10a6:10:48f::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Mon, 18 Nov
 2024 15:22:15 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8158.021; Mon, 18 Nov 2024
 15:22:15 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: boris.brezillon@collabora.com
Cc: nd@arm.com, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panthor: Simplify FW fast reset path
Date: Mon, 18 Nov 2024 15:21:52 +0000
Message-Id: <20241118152152.2921611-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0171.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:312::17) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB5PR08MB10062:EE_|AM4PEPF00027A64:EE_|AS2PR08MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: e8068531-d84d-4c84-0acd-08dd07e4cf47
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?sg9JdL5ZcNLz6oWmZAhdHGTVIIKwA6noBRu2k449pFjrmND2/fGgq6QjINws?=
 =?us-ascii?Q?0rEOJSx9aNglSlOQqoR0pMTk3vQQuJvm/AR27Gjtct5M5zxBiQpKkX3oK3fk?=
 =?us-ascii?Q?pcmtf7q4Vo7FECzkFbeR+tGTc+AOu/8UR6DOyrtVAMxi8brkL+BQkPnWPTow?=
 =?us-ascii?Q?Mye4c5f7vJO0K1Ho3CMZWTQfczz436Vpli2aukG2thHkmt+NtcSKsQr1zWRG?=
 =?us-ascii?Q?J04o0nUwprCPtru/j+4G0km4O7Bl21Qj1q/n3sr4vrHu2K8ghxcJ8zZrMvx+?=
 =?us-ascii?Q?6lAbAMN2izv+p3/TqHsbEPFkhn/+09RGNZYMBPuOWC5GwJ9hKGNjgbM0GwJZ?=
 =?us-ascii?Q?ZQagzIMsOtxwhTjf+7SvTUiKUt2FsNPY1RYuN5BtpD67aGAsOtboid2CjYGL?=
 =?us-ascii?Q?UdqKDTiTLzb3PzlYH4a/xhkYH8N08oklLS3KYkM1rJt9YGIDGOKtTLXRycir?=
 =?us-ascii?Q?DekVEFpEyqD870pvMiAxtcG3TQsz5f8p9D/2UtmoCRE+zIDXG+ovEpZQhJ/4?=
 =?us-ascii?Q?IIwK3fr35VgbKgAAgMd/GEMyLnnpfPIndjSiP5TWcp+RrraCSpihGGeSHEy9?=
 =?us-ascii?Q?cM3ZG2EKrDX7CIbGy1nMJ6Ib6W+zYRoPkY+YoLH3D1cRfMKBwesxEarOcKYD?=
 =?us-ascii?Q?SL0u9DZF7VJiHGUBYYb5KyN6nnMK5JB394AZ7GcTH0zV7NzHBEKa6QNEw6HT?=
 =?us-ascii?Q?SJYYlyau4fVtyqFcqDOO6gswizhe0mwTlQ+dsiHtivv/JkRtoW0jN24gYEC3?=
 =?us-ascii?Q?q55AMdWnREycPvSq3407T0qF83ggmD0eAC1UP45aeoKzwriwR9aPbDFeVnpn?=
 =?us-ascii?Q?AIRBJ9qYVAKqrJLBWBLlUbOrMykpza0G+XvLnCoTIu3pQLhztWUZyT2muQlx?=
 =?us-ascii?Q?2zfBPsMlGUztT1L3xKysVRWqqP6kCdE/Tbv4pD5spOEYOtb9vGM68lzhlp1j?=
 =?us-ascii?Q?SrJLQLsSw+izPRLVUXeZGjCdrWVuCemG7zlrRNKnG1r4CKc6wqvnM/e4+urf?=
 =?us-ascii?Q?Kju9crMqyfTwMMdRnvEOrN/NFRRokTNBvBDNC4Vh11jAJ9/lF/qRfyjaZs0t?=
 =?us-ascii?Q?0CgPqfqc5rBueLZCScAIb4bKxT9YM7+9dfHyCpbinPbKZa6dJs05k3cxVjA/?=
 =?us-ascii?Q?koNeB2lGbfnCHoocP/5uQNFAEDOsd9GyYrhdzc/iiPj+bD9xdsFDa7g7JMJF?=
 =?us-ascii?Q?Wf7DYtPx8ZkyzKY6CvknWSQAh2fT/Mwn+RWxLVvcBRqHuBO6helfaUoe3+E4?=
 =?us-ascii?Q?NSUCcUuiHs1IxHz2i/l+FQExW8CVw7XuNI+pjca8FHnzwvNBU3RtlFFUXuJ6?=
 =?us-ascii?Q?sA62mdrfc7YFoavdi6r3mulx?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10062
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 24b80560-b09c-4d56-ecf6-08dd07e4c87c
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MR1e9HEgVYx6s62r7FJQ1ix0LPn4ZNimdj9kyh34+ZLjr4LZyhQT701RNrTg?=
 =?us-ascii?Q?+AuTsL11W8jbCPdkid48jkWwKdY8/m4bKw6fsROt7AC163tla2Ws4PMZWzRH?=
 =?us-ascii?Q?2xXlMmcd4DcK/2l22kvKOHLb/lu80ZsiUqXlUmi0JraRXGmvJHjl02DJvZqi?=
 =?us-ascii?Q?u3J0/8cNpUIgBQW12qfXXfTvbnnmLYlJGJtx70ISNxFwa1jpKdsWxaQ6nimu?=
 =?us-ascii?Q?X9NZbykcuuLeuVLdPIUfWIvZTJn1JKDdMg4tDKLEQ6yliHW+p51foibwHi4Y?=
 =?us-ascii?Q?32P+5P2iSPFBH+ouyc5KiSEmR6/SZyVMwlMIfQD/gmZBqSxfuFsAKNtxkDnb?=
 =?us-ascii?Q?FuWaXAGy2T1A6mXdgtF6QtOd0yoEvXQemRz8UcSzRmILvsFEEBJnaKLjNzBr?=
 =?us-ascii?Q?Mb4quWOIRfcoU3y5Fu582tIfY3QOk9SPI9IKbZj8MFVtLri5plYv1fl0T0PZ?=
 =?us-ascii?Q?ABzqWE2jIRBQCFTqWgyLIMz1NeyS9SsA4ij6ScyUtiZh++B0w9jPiTk6JjXu?=
 =?us-ascii?Q?s+XFKoV4QyLM8cPa21jPybWLVj0QqW7tdRwLl9367QpZXKN3O8K4AV4U3jW0?=
 =?us-ascii?Q?tjsVkPBL4K/vdwyavIWYLDqHb2lKHP6ujZb+T6Jv8iLE5g9ZfhorIJ7dOfCt?=
 =?us-ascii?Q?xdUDx3wiGmt3Bvmc9L7Yn2WuOasTV3UsXfb/ddDtx71xtPFOt5aVNASFcXn/?=
 =?us-ascii?Q?78wJLFYfGngjcPnl0Dok7IgstTGrEdHQJXrRmYdG+Wc4d931UuifCuBEJbRt?=
 =?us-ascii?Q?CTF8fGk9IwGbMMxzQNqlwOKba556KcUCtO3W+co9U2K3pOxkIXyUdoPyuzsu?=
 =?us-ascii?Q?WrHbRCvo1oBEVIn1sWNbT/P1DpjpCW0Vu5yBvvCI1UxN4bUVdNlL6s+aauAt?=
 =?us-ascii?Q?Eio2A9KvgVC+JSuLRWl9pNXBaFF/9Q/4hZYej7J+fWJ4sJfj0Nf+22UbP14J?=
 =?us-ascii?Q?yQ3j9mfd/gV61x9Qq68PcriN8LcKOG4LhG3uqirhcVguERQDmo9XkrGjyTqg?=
 =?us-ascii?Q?kF0O6rgdCnsv0JpcUxIb5kOMSfIBOCqM2Qwx3axSED9c7qHbbzcyIB+ftBgl?=
 =?us-ascii?Q?6nxpBs2ktgBhAJO8GVemWiHYae6y25wLG+3zUVelT4asyEKfSEioe8wreQPQ?=
 =?us-ascii?Q?n3f5Z8H0NHp8RNup4pUCztfXcYkFeaesWI/TCatzptuoqp9l/UKZf64L3DpH?=
 =?us-ascii?Q?36jhNZdB/PEIigH4xTYvBuNVvkJbC8qxIV+VuWRskRNJINEBz/YFuxWPDznM?=
 =?us-ascii?Q?MohAKkUoGAtvSuQbqYRL3D7zXAa1MIttOdceA1QvvznKWkHlRM8nopvIaG2p?=
 =?us-ascii?Q?OJjRD4pZlUoi6sEiD0KHyQblSUKL0/t0fDpT9dUq4cwX6zLSr0LEqUyXZJKd?=
 =?us-ascii?Q?mgTWlHxV/Fwa0SnK5tsnVfcNYowHLVp0PuebPbo6WDiW8ofwuA=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 15:22:26.7487 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8068531-d84d-4c84-0acd-08dd07e4cf47
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A64.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8831
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

Stop checking the FW halt_status as MCU_STATUS should be sufficient.
This should make the check for successful FW halt and subsequently
setting fast_reset to true more robust.

We should also clear GLB_REQ.GLB_HALT bit only on post-reset prior
to starting the FW.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ecca5565ce41..6d41089b84ab 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1098,17 +1098,11 @@ void panthor_fw_pre_reset(struct panthor_device *ptdev, bool on_hang)
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
 		gpu_write(ptdev, CSF_DOORBELL(CSF_GLB_DOORBELL_ID), 1);
 		if (!readl_poll_timeout(ptdev->iomem + MCU_STATUS, status,
-					status == MCU_STATUS_HALT, 10, 100000) &&
-		    glb_iface->output->halt_status == PANTHOR_FW_HALT_OK) {
+					status == MCU_STATUS_HALT, 10, 100000)) {
 			ptdev->fw->fast_reset = true;
 		} else {
 			drm_warn(&ptdev->base, "Failed to cleanly suspend MCU");
 		}
-
-		/* The FW detects 0 -> 1 transitions. Make sure we reset
-		 * the HALT bit before the FW is rebooted.
-		 */
-		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
 	}
 
 	panthor_job_irq_suspend(&ptdev->fw->irq);
@@ -1134,6 +1128,11 @@ int panthor_fw_post_reset(struct panthor_device *ptdev)
 	 * the FW sections. If it fails, go for a full reset.
 	 */
 	if (ptdev->fw->fast_reset) {
+		/* The FW detects 0 -> 1 transitions. Make sure we reset
+		 * the HALT bit before the FW is rebooted.
+		 */
+		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
+
 		ret = panthor_fw_start(ptdev);
 		if (!ret)
 			goto out;
-- 
2.25.1

