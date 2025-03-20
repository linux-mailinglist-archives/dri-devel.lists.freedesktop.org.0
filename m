Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75556A6A4BF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7983010E5ED;
	Thu, 20 Mar 2025 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="hcj6Aj0p";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="hcj6Aj0p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013045.outbound.protection.outlook.com [40.107.159.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B8810E5F1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:20 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sroCBAPSIxvpGU114Zh+e+ku1j9zLaojhdNpbfxxtQmL0heJFeOE4SZH7sFuZrpf+wbyhn9zdi4YuxTQzbRO839GzNa+/j1IEuqWtBArLNFs3tIjW1hMebeeP6zLc6HyOFLooEf75VQAq3HhGKL18supJTQtN2yunBdNolJCWsQtVJoHr6k9Urk3G9tuCW7fDkmJu0DVAH5qxgriQyGchVW7WhA8S0H6TgajFaagMPHJBynfTfzClogwKmUtFm59hLvWaSzpQVzUOYn+eMSaE5NcodJ/BqG0oAzDX5UAoMdpANY+CNYgJpNLT+uC5yZNRzlW15ofNGXLnrtT8lw9YQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWGZUOKv4kRlzngdUj4wYUwTX2X0lnyADL0RYRzoixo=;
 b=OyU+TMxODG7/myahuKtf4Xux4dDMxlNfGB9fEKpajT1Ng7iJRcJghb3702aA0AT82YnCGTidjAQIfVkRQLdkTtzwXwdjFwHEbah0/X7snpCtlNALXPx7tTndOrNvfL/yDPZ++yMl54asl37povh8wqdhx3god51Gm+V20UiuEOs1f8DASwy1bqWdN3Rqau5jtrp8wFVi92l8PFJ4brRkcLBjl8ymHS8+rz9gDZQ/vG12CM5CWLzlIKE2PKV4wnHLQxR84QTBEw9h5WS5YGMmYHffSQXw0VI50zJkvVOwKK7jHJu/1Vy7R1xztxO7lfU134Ep60IWDu6P18hRR1Srmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWGZUOKv4kRlzngdUj4wYUwTX2X0lnyADL0RYRzoixo=;
 b=hcj6Aj0pd6XCk6i88JOCErZHOh8wzwPFBolADbGz7GnPETczgSC/Jwg1FEo7gvlIYLCw2qJeX9q5vXEoMjE7CTLwtP1OuhSqlGLOGGYLr0hWSaW5nGtE/aFgOJKYe3pEmXEtP9BgfYJ3c3VKapYx2cV/bS225HoQYmTn2ACszQk=
Received: from AM0PR10CA0014.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::24)
 by PA6PR08MB10766.eurprd08.prod.outlook.com (2603:10a6:102:3cd::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 11:18:15 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::bd) by AM0PR10CA0014.outlook.office365.com
 (2603:10a6:208:17c::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 11:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:15 +0000
Received: ("Tessian outbound bf3b9ac19d92:v597");
 Thu, 20 Mar 2025 11:18:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ab7a45a1d0c25b7
X-TessianGatewayMetadata: dX8luGvamWxAlT9lUwWFTQJkf9KCDg+91PHDrkiGzrPZQyv0TKy1UARjIjEp8OjUCpdxurXOEJQycXuZDV7McufGFzj+pKuLrhWtDmdA5rvjQXaINI78lsssjHS6lEfBCSp6N4f4kOoT7FuiEFTSdQ5k/f6Nb29RRHwXMfgIK0w=
X-CR-MTA-TID: 64aa7808
Received: from Lb4d8711e3bea.5
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B3C14635-39A3-4A96-B62F-8988F8DC1D9C.1; 
 Thu, 20 Mar 2025 11:18:02 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb4d8711e3bea.5 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N40hqXr+1x/dgjfNdMLFvZf4aNluSEQwthKluzGDXbB846hDVmiG6bn4jiQGhBll1rEHYvbXJ70OaabX/Bel7k9lsri17Axez3x5nvbophyI1YFGH7IKPOQt6oyMF+K/qQEBAYGmQ5Kguis56Ab751ZBZzjSlAgEerlF39gSrZkv0/SUOA4rPv4JPGOPVE4jQ5Up6v+MocYu3wTxQKQQc7v2I+SkmKATUEhwTgp78TaPeWGfarg6jm8L2XUYIJzqTZtGF6hp2IcOEUSYPla4z3z07k7+AZxL8M9DWDoMPDD7oWHjwGU+7tB2uth5r0RgIR8lq6d61md4XFYbTD1kvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWGZUOKv4kRlzngdUj4wYUwTX2X0lnyADL0RYRzoixo=;
 b=QCdPjaRTkkpJK4/zVdMRWI6xsfHlI7ZAIjn+1EXokO0MWKM9/Jgg3KJMf68ONRB5Le+rkUqzLBMsv8DphtBG9NbUlXc5W2KU9ASUwnkHCZUwBydeI+jIe1F5JiT7JIFSicV05isSSYjMaI2YGk0KRbMqpqpmk7CBFFCoysdN+u8fsj0FS2JvZ8F8U1FgVs+Oo5tUyh7xUFSJltVRfjw2vKysg5Nt63GoVFbIJ+gFyn6RMLhM0VBB85FbvWB5WIwvCclxXH29ayEfSdgD/npoya9hWjo1duaJZ7KnuB7opC+jfo0EGJwu/dhnJZnR/MimvJU2xM2/huQ11Eq1Porw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWGZUOKv4kRlzngdUj4wYUwTX2X0lnyADL0RYRzoixo=;
 b=hcj6Aj0pd6XCk6i88JOCErZHOh8wzwPFBolADbGz7GnPETczgSC/Jwg1FEo7gvlIYLCw2qJeX9q5vXEoMjE7CTLwtP1OuhSqlGLOGGYLr0hWSaW5nGtE/aFgOJKYe3pEmXEtP9BgfYJ3c3VKapYx2cV/bS225HoQYmTn2ACszQk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:17:59 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:17:59 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/9] drm/panthor: Make getting GPU model name simple and
 extensible
Date: Thu, 20 Mar 2025 11:17:37 +0000
Message-ID: <20250320111741.1937892-6-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0057.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::14) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|AMS0EPF00000195:EE_|PA6PR08MB10766:EE_
X-MS-Office365-Filtering-Correlation-Id: 16387b94-32be-47d6-3409-08dd67a0e8ae
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?A76k3l5/PhU01iLXKjfMwVClLCwAGUXcTQHd/dS9TKvEzpGwv9sh4Yme9bTK?=
 =?us-ascii?Q?UmYbPU9jwz49s2Xg7kNzRjAn0vms1v9FlSFSVvpvRhlpi8oFbwLRE6TTr34+?=
 =?us-ascii?Q?i5KtmKz3z6IQ4SQ+EYyiBqnw13QunnKT39tgEJgN/LIGVx9mUfDKdI8uzTus?=
 =?us-ascii?Q?3TtpDdSin+P84vCgmpBZD0CCh7HOsOarjNu9KB+Ogn07Bwq8MyFOUlBfHBKG?=
 =?us-ascii?Q?/M02K5pECXxAlReyatyhegbPGecL+dB/Lh0Aa8Vt4ZFShUgTteWcGB/DS4xU?=
 =?us-ascii?Q?8veBVV0fGOWLDDphY2fzq0kuki9U7q4YGcnrIz0WnU1X4SvwU4JIHV5a02p2?=
 =?us-ascii?Q?Emb8jqD7UNUNfQRoOnVem4tTCq0tTR6bi2YCysORcC7Wl+kaoWm8r+tS36An?=
 =?us-ascii?Q?HZec/lIk/UCpKOGoRINVWAPJqh+49y/ChrMwhSsRSF/9nOtDD7GEpdevx5lW?=
 =?us-ascii?Q?rnelZC09LScfzuhhP6gyl/oazsWkmF3bhlNswNfmu1nwn12ZTKv4fo47Cp2/?=
 =?us-ascii?Q?QS2LBOkazNkW3xQlFrGPyZNUZcaSqogFEhv99uKfCSQy3LZ/1joGQVryRjPK?=
 =?us-ascii?Q?g+Kpfj4uGMJd6CZDe9bikXBbilONfCtAlfJ18ne9StXEei7VSt/NgbmkFmDX?=
 =?us-ascii?Q?pVG/AmRbbrrPSPepSAFRBsAEBYIuxLkeclLzupIkaGXhhwwFgwjoKqTFsXYd?=
 =?us-ascii?Q?7EPXavq+PCqF3cO3KkEOUYvW8Yj7eXY5MqWjXuRJiv8bBKZeQww2X9wE9Oxc?=
 =?us-ascii?Q?fiGf3ouNp6Vnxj/giCSoNvodRAIGhJUGn3dCWaLm9wRkZs5v79qzfjB1LUTP?=
 =?us-ascii?Q?F0sMJfWkZs0EFVTbcY0tkx0E09QhvCdV5KNWQcGn1LDiLTa6VdOa754yqh6p?=
 =?us-ascii?Q?2ju/aqBw5zOq7BJ2YMmTCRSQuo3GZtMLOSDdjONgEv0kIs0bK504Ox5EMEVf?=
 =?us-ascii?Q?Gky2w+7u/1jEfOtUBxi4BRFbwN/h8CtroTrzEt7mNHNflEH6+IERYQVZqF/y?=
 =?us-ascii?Q?/o732sMj2iTVuLGJnyUhDP7AHJdHuKdKNUpj7YD/1/pNEBfKF8upXdQnx4nh?=
 =?us-ascii?Q?JYcZf5+Um3M7CDAYB+16+WhpvCLhyvE4zd6X+gpzz5YuUxUmH3Z8QjIqt9RH?=
 =?us-ascii?Q?FN8xrlmiKf2a4k5gU0jgHVWbk5qSEiRPTZptGo7twjg/WFYdTNPFIFjt8Gxy?=
 =?us-ascii?Q?xtrnDJeOcognSBmc3dzTTS3QxRruKomZbDSfPckAhS1uJpfeMhtfdUZIx6/7?=
 =?us-ascii?Q?RUkpUjarBwnz3iaclLZZzBkPNnBdbcQB7oz9ysGJZVNH4EN8D6ncL3Ec1hBt?=
 =?us-ascii?Q?JTWAg3Gup/zPTfujflBrhgOOrd/5cE9F/6nusp/YIumGd2ERnWXBEpZYmkOr?=
 =?us-ascii?Q?7K3hZ60cfKk0fpDJ7+gXqoTz9YEz?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 2251d176-b702-4140-0f2f-08dd67a0df27
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|35042699022|14060799003|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xKRCRXLQAcn4VAwKIh2CAxNpciL3svuuytVr+WEGeNLrgIzXiBWOlqUx55JC?=
 =?us-ascii?Q?y7YUt/tGXMQyMzflhK3n1YOi9ZnIza6dncX9SAJCeG0JAPr3/8av2YWgBIW7?=
 =?us-ascii?Q?xggbv2DFuudlc3vcsyozW/8kxvbwvFLcwtHXJ6ACGBfz4J7hCm55Qvrn+pOW?=
 =?us-ascii?Q?D4nYhdUl7zsyqxX4dRhj++ZZK6RUtVN3MH7TiCgUtbs33GKrqLMKHYlbO94k?=
 =?us-ascii?Q?+JxK7SuSfRqGB8JzV5cS1Ex8tx/DfcaawlZs1fwD5w1/g7tjKB8UALG6LiuH?=
 =?us-ascii?Q?h9UPENM/pum3A/QxxE/b6vYupMSp+oWgV/dooyXZONKgA9MA6rs35DCn4DPi?=
 =?us-ascii?Q?wVa7FjV9sjyD8raN4KguLUxGaCrvnxFVIVeWZhXNrvxLTSgYjYTeJU0eR9ia?=
 =?us-ascii?Q?tFYmALgc45ryHdIt2onwe9n+2m8aUfo9/RXvDlYU79qn1Z/SUv7ymNJw7eZB?=
 =?us-ascii?Q?+dODlLBBikXr3Qu/+3Xm4f/4SO1MFIhyyyQi58R1CXwUyZNnb4YI9PG3z+DT?=
 =?us-ascii?Q?A/Zn61Rd+ZiRLstThed0dOikOz/gyg7ENGscSQced5CQ13DyIVJlROeM6kx8?=
 =?us-ascii?Q?XMWGGmPxWNVtwuysrn6aHc9q5vvGH2C4vz+NZxD6iLYmN9Q/8OPv6zz6i+mI?=
 =?us-ascii?Q?Htsr0C6377lB0sOKVDiFyn20OyXDBvmXdneQK7dKbmSy0Y1v4+oVBpy61uoE?=
 =?us-ascii?Q?TZiAda1Ke0zUlEwXC9eaFZKwT7cX1wknbViWq6x1Ky1y5rXLuCTUvuFedqwh?=
 =?us-ascii?Q?ZeSiGiVGPWDhdnEwIv5hrrr06/5VwjYujMjFu1KLrLYMzq0Si7Or9zqgTDdc?=
 =?us-ascii?Q?2dc+38MSXccaCvqRWCuHGuAk5KX7Q0sVdWar1kSNjRw1PYv9qwCMXfBtfiAQ?=
 =?us-ascii?Q?IsFjec2sNvKAmFBfS4ejg+zu+04AUwZfd8FaoXKHbsbaKaUHBZ0NjCqJ6qbJ?=
 =?us-ascii?Q?vF7i4CBWa7qv8i4y+u/OI2ptYYS2KAG0eE/1V4RNYLh4+hQgkBsInScQZlCL?=
 =?us-ascii?Q?RHYMLz0m+TQ0ruMAkKJXpC/i+1XjNlMmHZnt3vnIEa6LOgmJ2qgZl6ctTl/A?=
 =?us-ascii?Q?NtQT1KnWVpebuwz8IfvqxySEoDUHDuiieXZPC9FRl8/mQ/nKUkPQEhU2APHD?=
 =?us-ascii?Q?+Rg8eXzyYodL3easaNTGBa3MJKpGKX8g+4Ts4E4zI5wWnNL+RIk/E2g86Vbc?=
 =?us-ascii?Q?8oFTXFIYdW9PwTXRPXDjLce8m4y5w5SwSBk875PMgMyyyBCBeF5OUNkCl1kA?=
 =?us-ascii?Q?22al/O9chNe6bWdtgYfbh2X1jLJ0xg7COTlMi9ZnxNAzC1+MEEdy6ZCEs9Sq?=
 =?us-ascii?Q?KrBNlkIzTdvPG0YUgCwYM2FR+Whe8hYgmwrR90ycLkJQN+2aSnBKoLoU3HMj?=
 =?us-ascii?Q?0ZtvoIC87f+T8CRrCLqFm2mFD89fpDZUUJlaAe7yhDAdqRtlZFNM3b55ME6P?=
 =?us-ascii?Q?R5EW9LvDATiJ1/2wKX90DN4yqpXANcAgEH9IimRNjI+Vavpmh5Zq4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(35042699022)(14060799003)(36860700013)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:15.1856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16387b94-32be-47d6-3409-08dd67a0e8ae
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR08MB10766
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

This patch replaces the previous panthor_model structure with a simple
switch case based on the product_id, which is in the format of:
        ((arch_major << 24) | product_major)

This not only simplifies the comparison, but also allows extending the
function to accommodate naming differences based on GPU features.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c   | 63 +++++++-------------------
 drivers/gpu/drm/panthor/panthor_regs.h |  1 +
 2 files changed, 18 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4cc4b0d5382c..12183c04cd21 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,40 +5,6 @@
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
-
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
-
 static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
@@ -66,29 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 }
 
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
+
+	return "(Unknown Mali GPU)";
+}
+
 static void panthor_gpu_init_info(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
+	const char *gpu_model_name = get_gpu_model_name(ptdev);
 	u32 major, minor, status;
 
 	ptdev->hw->ops.gpu_info_init(ptdev);
 
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
+		 gpu_model_name, ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index ba452c1dd644..d9e0769d6f1a 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -20,6 +20,7 @@
 #define   GPU_VER_STATUS(x)				((x) & GENMASK(3, 0))
 
 #define GPU_ARCH_ID_MAKE(major, minor, rev)		(((major) << 16) | ((minor) << 8) | (rev))
+#define GPU_PROD_ID_MAKE(arch_major, prod_major)	(((arch_major) << 24) | (prod_major))
 
 #define GPU_L2_FEATURES					0x4
 #define  GPU_L2_FEATURES_LINE_SIZE(x)			(1 << ((x) & GENMASK(7, 0)))
-- 
2.47.1

