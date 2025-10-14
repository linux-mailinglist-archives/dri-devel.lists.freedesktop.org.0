Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E18BD882C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3141C10E58F;
	Tue, 14 Oct 2025 09:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Dl+8w5u6";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Dl+8w5u6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011034.outbound.protection.outlook.com [52.101.65.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465F110E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:44:44 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pOUCAOW8kHpPdXiaFZkJ825x2RW8A8p4ZKMPfvE9u8B9NLP4jejLXgL13T4xtnhRi482L6GOUF7fWIsKJ+q/B6mNIAp0qdYzdFtiTuemTmmsCT3cqoNQUOVlTFpaXPW0RwSnj0W+imppHYIE1UPhBqnQAf9zWcvRU3EQsJ+Or6ru9eQQOTWHhJzT/QqnsR+d9I3nhArcssuawDVkvw/W4qcZjOymqx/V3iW8UvNGTgxy3jSKUo2GFCuZKG29Qd1Oj/JBbCzjm6YCWBSsNEWqRQps3hKz3HdoSaJAwldbusAhLWAAZwnlTSTEjTeg6YESHc3Ly/i85R/XiAITiWJeTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsjZL8XHamlS2s9X+QsrJHGoMCmcD+Vy/Rbw38rpbZ0=;
 b=Zzk2qqdU0aV8VgY8oV2uRkHMtvEitWUsAIMjaM/nCOxYEIPlLKxeWmfbNEiRvIeN+1Utmil3d40d8rh88fKKDKKITLjzf3kYCjDVwtdRPTC2HmReyrlgN/JIjv5pU76p5uxH4GDsQ0PNkXO/eWlwq/oiLJzXfiZJcaGErl5KTKv8hlNCEAjNK+ivhUZWEtHEHvZWDduqRgAPnOOhkivCWCGzQIIRtdKj6uDPSlzcJAxty/hism0JLclrrhRa4tCRHuzi9WlYFxL5uyATvBYLyk4urjSFi1ADjzCx/2IyVEwEaFiuviwwonA+OBYD5t0oi1pPhfEMqHH+mE5rZbHwFg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsjZL8XHamlS2s9X+QsrJHGoMCmcD+Vy/Rbw38rpbZ0=;
 b=Dl+8w5u6wBvdw4Z1KEnTqPZ7gTXuTG9bgmYMhbqhEWd8OA22dMVDXF1e5DM6zoxjiidRPDQ0BFOMorJ+EkwHtK0xYpoxjk5UA0ZJxXVv8yOr94UxpNNSNwjUp9IFoQ0OhmAJ07Z3GgZkHQoVAf6vSPVsGSpQtGGO8vpqE3dA2lk=
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by PAVPR08MB9063.eurprd08.prod.outlook.com (2603:10a6:102:32c::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Tue, 14 Oct
 2025 09:44:36 +0000
Received: from AM4PEPF00027A5E.eurprd04.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::7e) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 09:44:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00027A5E.mail.protection.outlook.com (10.167.16.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7
 via Frontend Transport; Tue, 14 Oct 2025 09:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TkZ62YjbtFcfH/MivOmmlMJmDD/cqiMJHvfMj9pVNrovIYYZFJAkhdfslsdgNT6EqYjUKaoZzVdGULgGOEgCk7D5DQ+UdRhAUC5yutDsmGTK8hYrLqYBlNqBKKmdOe2PKbCJ3d2OCi6eKl7EfBfC1dObhUd2UE2lAd1Fqz+D5TsVv1AckivVAazVkKhtWVJsa+6KuBGN7w2zstIx4olvq/i1OyNzmkvRxwBRVFG/WCn0QKvhVJ79hH5+Vrn9cyo0fWUlqqQUFhj4gQf7nxcV6MKjxj+rUpGH4TEF8mFlL8zeuU0IuIo4liLGaUxWUZcX8xSWudrDTGnw2WY8t5uKvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rsjZL8XHamlS2s9X+QsrJHGoMCmcD+Vy/Rbw38rpbZ0=;
 b=emAW3ll7LMocVoA74KDdHwWmTJawqWvsy1Nw+2oE4BdpGiZxlnVitXK64aAGpG4WDC2GRJwCSw2LvkND2YC3cxV3bZ4cahU8SFzHIYDN5eD49cdfISrnbPq93Ljx1ug0eGCVW28qmnBrTGHHJK9m3YJW7YoU22HOa9duDgvj9GEUQn1Rx0YsGsOn7Fhk0fmwCeYUrU41U1wdN448n067FdgCBVqorKgIN7p148UFvv3X1dJUq/DJSnp5uVMbHb5EPMJIJ8ZCtCVGIBZ/6wT/Hm3VF3sWzcqN0sry4e0Pvl6WZDhufdsoWceUwaLqJIpHhDmEVNvt4kAuDrXBAyVV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rsjZL8XHamlS2s9X+QsrJHGoMCmcD+Vy/Rbw38rpbZ0=;
 b=Dl+8w5u6wBvdw4Z1KEnTqPZ7gTXuTG9bgmYMhbqhEWd8OA22dMVDXF1e5DM6zoxjiidRPDQ0BFOMorJ+EkwHtK0xYpoxjk5UA0ZJxXVv8yOr94UxpNNSNwjUp9IFoQ0OhmAJ07Z3GgZkHQoVAf6vSPVsGSpQtGGO8vpqE3dA2lk=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB8286.eurprd08.prod.outlook.com
 (2603:10a6:20b:555::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:43:59 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:43:59 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 01/10] drm/panthor: Factor out GPU_ID register read into
 separate function
Date: Tue, 14 Oct 2025 10:43:28 +0100
Message-ID: <20251014094337.1009601-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0041.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34b::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB8286:EE_|AM4PEPF00027A5E:EE_|PAVPR08MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: 86d19a81-5de6-42cb-f6b6-08de0b064882
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?nlpITphDu088+nX/GgoZulaiuQ5+yUyJ9qb7Zlsq1OQaOHG+SIG/CgMM/l9a?=
 =?us-ascii?Q?ZB8xVNgq1cdJYwBAHwcT9MDHjQxeCoPNUIkicp53cfyzlK6yQLVoXZZEjO9j?=
 =?us-ascii?Q?Hwf2cfkmH7yzsO1XspStdxMIHeBSEjVHes30bzT7V7kZEVejJt/0HCRt5EdR?=
 =?us-ascii?Q?dsXPV1tQHv2RgIIKBMbrJuihpaklylXTfoq+4QQT5IoQcX2fYQw+9sJWnWyO?=
 =?us-ascii?Q?CzB1G5v4CMu15fl/0nKkjLSGrBLNyiIlKyIDJmQgPGdXw/LfIZ126gA+s34p?=
 =?us-ascii?Q?z6jEPUO40AGnYDbUaSNcLTnYRfzaa+LIt2smo+XwHAYnytDK5mjMhZ7mAW4p?=
 =?us-ascii?Q?AglG1ayoXLkifNMODMo/Swvfd3iVpKOlRyqfNre2A7bqE3wHbRAcORJg/M79?=
 =?us-ascii?Q?NSgllLK+LlsBOOie06x6vVEVPxAvgdQQm6ikJg1JHd9YCIJJau7JoOp6fcnK?=
 =?us-ascii?Q?j4BCayNWNLI4Ew4LrIf6rm+eWATzaUTLMTVgePcKvD2pld+fuIsi4De6iZZ2?=
 =?us-ascii?Q?bAFEEdiBhfskNQJ8CD0TLq7jEFTPsMYlY9CT7xtS3YcipeuLCHsE5t1Xfch6?=
 =?us-ascii?Q?BT76EYIScoHj3ClM2kCvZET2LaQvnYGvWkMZ6QhEQ/ziOCSyzZSI4sONQNij?=
 =?us-ascii?Q?fariAlyZ0BMlWL3g4/OiXtFLegji7VBiTAaJ1MTAcmmabUPtGjUmL8l/d9Mt?=
 =?us-ascii?Q?iCnZV96hNSoGdOwbR9cFZzvAibhaPmZvhef1eHAH6oLfKBOp747LhV7qddFp?=
 =?us-ascii?Q?GCx/qLRewcM5/CBBuumRCiw7m6JVFs+nmOP3Qr9XMYOJexB9W9PjQ7CLyrN4?=
 =?us-ascii?Q?G37ze0oppVrvxSHvolEHl5GLyj58zi0YuHghZO29LatcnHzfu5tbJzMBEnnM?=
 =?us-ascii?Q?vEf8XTOAi5SMVEIYlFW3bmXVXHPUP9yuqsrX79v26RKnHa5DlEolYNXGjs0o?=
 =?us-ascii?Q?z54a2mGKppS8xQuXLyAd9zaAcSkVSV1FtYVwEFvIxIwRg8pOt/aCSAdDN+dT?=
 =?us-ascii?Q?GM8d/RZt1ewEYUQ3H//CtEz7zNdC44awfv48NQ1yZj0vZBPMybS9v8S0cMKe?=
 =?us-ascii?Q?p8sX21fKNyL6GFM00YajbI/6in8fXGJhuXpsUFdxjVyTmlOPktDFqikwuEkW?=
 =?us-ascii?Q?2YorZy+ehrRm8dP6sukThsjjpA4pprZBxpJe+DMX8mSpi9pfrMZu9P7F/ZZ5?=
 =?us-ascii?Q?/pZ0i2GVagmu/8/A2FvOqZcYoRQyGuu6yZtznRmDlakH9ADxXXG4iwK7i9u5?=
 =?us-ascii?Q?74uH2zx0RC94CwN4ZIHe0DVhL4FXH6Xh0cYB5Pt6Yr0tT5OkmjPivSuLdW+0?=
 =?us-ascii?Q?i+xMloRPFmb0MXC2PdWzboCGsD1GBcsLenZ1JqU4d2EPo2i1JH0/pAZgicCZ?=
 =?us-ascii?Q?WneSDz+GBrfA8uRY/ISRFDLNPUDJexrzK6+M8bK57YYCcIeOSuxFj0NDrFoF?=
 =?us-ascii?Q?OHR60m5s4bmGNIYQf4eNKmi9RjUQ2z4E?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 6935f146-46da-44d5-e572-08de0b063357
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|376014|36860700013|1800799024|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pc4QsKOmuIrrBzx8TNBD7esj/ExMF0etHJmyS6CvLKoRsHJd1TiHMUzCALDo?=
 =?us-ascii?Q?yfWxMbySJ4x0Oa8uCXK7VxF2hGNUw5UqecJyIcrBaMKxqtqnAzgFYeZz2M0p?=
 =?us-ascii?Q?B4ftS4KfQPWkrs1IHrkjm23TXufNdzW+tjSB4fiLe46EDLuek+amClp7P0eg?=
 =?us-ascii?Q?/9xIdBNj4XTbCfpR+13rk8x+LlTkWQeI35Wr0TrOVpin3tBNj8jcTcICWFi/?=
 =?us-ascii?Q?YdLAaAOmc81jTZTA1EBcc3FKOXBnGC6f/UaMkgU3GQvwqZjY4SKmpLD5eNmg?=
 =?us-ascii?Q?7aUKaxEE4js6KpFKFQWX7q1RKsGcauXWJ5IME84mdmPA+DhlgQ8vOWJmfHeq?=
 =?us-ascii?Q?LYItCO4Wrxt82REZsOIRJ79XnYsVfOwLMo7f9PjvnX2+eXV2EyuTt5aRIvyT?=
 =?us-ascii?Q?bj8E15T5uGs1eayAuPSKlXOrJ/NHe1xs2WeMjAdLNj8egAvr8E915KcnHQ/4?=
 =?us-ascii?Q?2aAA4vHRQoqnCe5WufSsMXUT7LHCl2ByTi/c3TfZpGsOtQe4T7k+QeJHdz1P?=
 =?us-ascii?Q?MUVF0RgE8yq7CJ68tIF6h9nShwem6b6MFY7dfi/NELrUOja9RpxZvtzyURpi?=
 =?us-ascii?Q?azF0A2p9VOIy4g6z8LSnnvQeje5UF8Zf2YhUbpebhFw46+b+tH03wtdcutSD?=
 =?us-ascii?Q?GSJZkh5mV/HeSfrfn/kR/aOKpGCTaThNTwRA6t7M+Up0jGYD5GAVftEw3LhN?=
 =?us-ascii?Q?NgmWF3Nbxsx7w8XcESnBlPP5GqjLF/iSYxHtdjbuKbUn1LqnzWoYHLOutxAm?=
 =?us-ascii?Q?f0IqhjUEDLaQg9EDSSuHzny1QDt1tPlQsFs3ZDnA2rC8JiLmBOHpFfOrT14V?=
 =?us-ascii?Q?C4ISnD59h32VC0qPRjI/Z4Lmhkx4AsSUngy9wA+8/PrYAjrcmTgaYcf7eW/S?=
 =?us-ascii?Q?F2fXRBJ8wZVXqLvkO4bPXi6tNuCyE+TL3b1J2Rd7LJMUvxKsYR3qSxiwk459?=
 =?us-ascii?Q?aTneDO4hzYIXPJUYB5HCi4Kykj2OTr7/OxOcayNLGyaqhZomINvFKKjReAMA?=
 =?us-ascii?Q?sSZuPlfB8JiIBhZc6KrbyHS9bKC1UDRd4NRp8LApuQlRmvEEZ1qX+yjCVnKO?=
 =?us-ascii?Q?KE2A77o4TV4QMDoiQD9PiHTe0Y/LmC2HW+MJ/oNIvf2xFYBa3NmFC+H7g2yc?=
 =?us-ascii?Q?8s4D1yEyDgrVCS/wt/a9sGrSiZFEKCfM17qrUT+nRVHYerFl/gPnIWh38SNU?=
 =?us-ascii?Q?0bfCgIsvcI1JdDLatiO3qVepwHFeqbDOMCAWpztpTjXFNKq1077OG8KtrRMv?=
 =?us-ascii?Q?CeAv7yPILNnnI39sV8yOurUlzkjs4+9Y86V6ZhNTUU7VTvuE8HfqBqUufeEj?=
 =?us-ascii?Q?9ox0UXN7StrsGiSEjvqzUgu9ffsgfWR4vZrn9oAkN1fa/uCmbFcEYE07R/HM?=
 =?us-ascii?Q?DHXuroONj4gETaU78+QAiayYSGkJskth6rVnW5MqnXEj46jiGIepAWrAbpxx?=
 =?us-ascii?Q?iZyCc26EXt6Q+T1/vGpfYwt4xWzABb7o/qWi7UxYG+5k22dQlV+kULHH5bBo?=
 =?us-ascii?Q?oVQrRdCr2wdWmZ6yKR8ecP5yaZ/DVhqms/aWPUiN6tUxrR48B7kEYUMtr/Nf?=
 =?us-ascii?Q?7LRn0tFN4BIKDHbIAnM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(376014)(36860700013)(1800799024)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:34.6542 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d19a81-5de6-42cb-f6b6-08de0b064882
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A5E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9063
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

Split the GPU_ID register read into its own helper function. The GPU_ID
value will be used to enable architecture-specific behaviours, which may
also affect how other registers (such as those used for gpu_info) are
read.

This change separates the read operation so that subsequent code can
depend on the intermediate result of processing the GPU_ID.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4f2858114e5e..326a9db0b5c2 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -62,7 +62,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;
 
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
 	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
 	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
@@ -117,8 +116,23 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }
 
+static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!ptdev->gpu_info.gpu_id)
+		return -ENXIO;
+
+	return 0;
+}
+
 int panthor_hw_init(struct panthor_device *ptdev)
 {
+	int ret = 0;
+
+	ret = panthor_hw_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);
 
 	return 0;
-- 
2.49.0

