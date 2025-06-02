Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF1ACB0B3
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 16:09:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D0B10E532;
	Mon,  2 Jun 2025 14:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="USR1wOKc";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="USR1wOKc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazon11012026.outbound.protection.outlook.com [52.101.71.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C803E10E52B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 14:09:13 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=nihK5s3W/9VZ8OmDD4ook4WPKhtZ8aXUeimgwshFsIOwB1ErIPw9KQXVI+WpO+OePylnkgLSKr1fwyEvVaIjZ8HTbQ8CyNBN3exNzPTWS9/Ln/WjxlKXOA1C2NtRdySxHT0EgMCQ3i7/yFQyMKnerRzvsYimJSgtJmzTJfPd2KXt+PEYwoCG+DPjMmTHxjTH0aicETRyyxuktyymMA5hwwVZPT07PUbU2pxPMKe3gqgRp59/UEq2XGMOyT5z38TZbLnX42gNKLXsYBQNSbbZ8/t5zWnEg3ENoc5AI9VxB5RogZeIue1reeqApC/Hf6dkIvC36S8ti+w2Ile0I7bXIQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/iXB7LeRbLGeQOr0+W1OPpabKfaogwRxl/du5K6Y7k=;
 b=wKxhioGn2jWBIVqVnUCsoVCGeO+i/WC7khz4Xfl/pBwqt9rYtE/UQQNYQHFUC6qirKJWm7/Aw2w+MCdC1uJ6u63Z/jkMC6L+DB4WLY5E42PmwZ2bj1ixHknSaiLkc6MPxtNHk0u08VF0h9XYVzM1BLdKYsBYVM5BN2CnJ85F8Dq3zwbyYvzdRxtUtxkHyyRIGSjAn82tMSnWRgMV+7/fROboTvg0BOhKiXbejnny01nW30kGA6UB/gZT2x88JCTQ3xzvGkM9smYzAD/0H/tb3rVDPfitE8mNbSaqoW/PtLgBAurlekMCWMVc9c0EL4eeEsLEMYgPQyf73/Uw7+FIDw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/iXB7LeRbLGeQOr0+W1OPpabKfaogwRxl/du5K6Y7k=;
 b=USR1wOKcn3n2+xtqYbfP9GZMAW9hFx5ZGUiZeNPCrB0/HCn3BNDLqxc05h3yI8wQ9SLxW0b55LhDKfna7VLwAeBPTn7PgiRhKPBpHhe0G9yfa2+NmMLNuDrsC7BidsfjSZgISt6fxWzAjV9y2K0vHR2ElrJ+WVK4AJLC40puMcM=
Received: from DB8PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:10:100::44)
 by GV1PR08MB8452.eurprd08.prod.outlook.com (2603:10a6:150:84::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Mon, 2 Jun
 2025 14:09:10 +0000
Received: from DB1PEPF000509E5.eurprd03.prod.outlook.com
 (2603:10a6:10:100:cafe::94) by DB8PR06CA0031.outlook.office365.com
 (2603:10a6:10:100::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.19 via Frontend Transport; Mon,
 2 Jun 2025 14:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E5.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.29
 via Frontend Transport; Mon, 2 Jun 2025 14:09:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NEqmfiwULhL3VvEsYThmNDpLrvaP8E00w06zKwvjsgTF63PRv5VfgDbTIT1/zaQtEM9grfZy6I1rNVGZJ0NaAmoObU+h+/wZl6dT676MO2vQ7CHce22cwKG4qaZWu3Z0yJiZ2UGYckmPkPAKINEV4XCG1pcuwFdtBRMVp8p99n/6X+sg86tvj5kYcOOzSzCH3fWx5Yrmv/8DFYbxQsHN9WE1EoG2j+eak2KeEj2JvEiFTFcxmfGB529WRBGcJ8rZkNg806K4kc7iwfyqkZAoI2LWs77MYdI+s7lsr224Bo6jABMQDI83H4Vo0GUGUSnakucuzcD6hYwfuSNYGlHbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G/iXB7LeRbLGeQOr0+W1OPpabKfaogwRxl/du5K6Y7k=;
 b=QOz50mspy8lf6rQwXJBqDDSuguzcMdt04vBI9gaTy42cYRLzSjNM1A1ZfHrHcRRPQP0RA07bIRgDt9DVQeGtBXO5Iaftdgff1n6qf6huDqgxvFYll09tEMrva+bTJXsNkiQUh7P3Zbot6DOIyQR0skVtnNvSVBcN3k2VKHCy7wx1JA+OE7HoWf4TxcZhFVanS8ksSgY6UxGW3UcIHAiA7O/7CK1JQ0HyBC3x1fRbpJPoaLfwI3DP6HR7M8gd+Z1sBLY+ewSNOocIsA6AzP0CtH5BFzHHi6o2rVTYLvJ3ZgJgd+tKcAE1albqDgoaX0w2JiVKau4iN5DKFtpvN1xm8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G/iXB7LeRbLGeQOr0+W1OPpabKfaogwRxl/du5K6Y7k=;
 b=USR1wOKcn3n2+xtqYbfP9GZMAW9hFx5ZGUiZeNPCrB0/HCn3BNDLqxc05h3yI8wQ9SLxW0b55LhDKfna7VLwAeBPTn7PgiRhKPBpHhe0G9yfa2+NmMLNuDrsC7BidsfjSZgISt6fxWzAjV9y2K0vHR2ElrJ+WVK4AJLC40puMcM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS8PR08MB9018.eurprd08.prod.outlook.com
 (2603:10a6:20b:5b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Mon, 2 Jun
 2025 14:08:22 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.8746.041; Mon, 2 Jun 2025
 14:08:22 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] Add GPU specific initialization framework to support
 new Mali GPUs
Date: Mon,  2 Jun 2025 15:08:04 +0100
Message-ID: <20250602140814.2559538-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0181.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS8PR08MB9018:EE_|DB1PEPF000509E5:EE_|GV1PR08MB8452:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c5eaa5e-b9b9-4f6a-7a36-08dda1df0aa4
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?728qSerYZN/+iidENsvcV0QvRiBbpFJb+dQWoeuGXOU7ToUUdb6qyLLU0YuQ?=
 =?us-ascii?Q?K5FEze3Cy0tgvdrMpmG+LyjULwrozl+xuQd1FHL3qgBZf54CPa+U3LM5FdcX?=
 =?us-ascii?Q?p30tol8RFiq56DbgiDVUEf0VOHUzw4gC/M64TCBeW0LYYyb0+mfOHETBKcWj?=
 =?us-ascii?Q?UfVrJBm4rpwZvD2/h+sro6vtTLjf39w59sSbLgHZrRc/ZYc0lmccb9ulKf+8?=
 =?us-ascii?Q?3swq0ZlwFPnFptSNsVC0ohkNH3ehtB00BdCHDua6+aUvwpda8VHTe2uxmZHM?=
 =?us-ascii?Q?qsdBLIygnQF6dnoB9nemduBGtrC9rz0jBYkmoRMWEI8hT8Jr88J3K0sdbOmC?=
 =?us-ascii?Q?54gYw2iq1w785HVSzcFK8zPoPmPK3aGn9GZoelIJY1+AwKewV8ny8YivEs2q?=
 =?us-ascii?Q?AifNvb14gTIVznOvhc8upt8nV76OHDLSlyM0H8puEP+L3LqczCCV7S3qV6AB?=
 =?us-ascii?Q?wJzQHEEN3n3xH039qaJxpSylJUVH4ZvcI2dh/ih4WoAy6bSQRaPkB7ImIEF7?=
 =?us-ascii?Q?tvxWkJzmdDHBvQMZ+DoGZVgeT6EXwNfZIi/nyIeHVEVtd20uXzMNElgVYs3U?=
 =?us-ascii?Q?4n9N6FyyecT3Nl9FZ0T3aZ90cSOVSnGWGAqxKOVBRzOjEpAV50ortgfIM8wm?=
 =?us-ascii?Q?7q/WVmT037El6FaieXk7sU0UkEZ+LrUf32Orme9GQiht8WtA8WiK9bKkmgBd?=
 =?us-ascii?Q?BvtqyanLe34yfJIUajk9U/yDx46X7ZCCzMrMHlkThYx5yIIvqYHlGW6OXZgA?=
 =?us-ascii?Q?Lgb2ocst1b3x01o1FL7ogqQ7qKr7mvo2YyLJlO/XRN944Bi03Xpq5lGMfdZk?=
 =?us-ascii?Q?QFIWSIMuyzvAbOwP2sL+mxhY2pGLBhtI5nrT/A6k34pp5y81/HHGEve0CSqj?=
 =?us-ascii?Q?rfjgADndxRx1mGvUtd3FgFeTovP1EMUd4iqk2vb2Y8pp8VDdVvTXuO1EQdSr?=
 =?us-ascii?Q?6XL8JFvofoiSzRh73XC680tV7v83sDlNNHeE9WS77jbB4656SwvHo0OQU+ef?=
 =?us-ascii?Q?Lm132M+d50wC3/E9cY/44qitAgVOgalfIm0jP2e02ktlavQgB0BMxLoevwRe?=
 =?us-ascii?Q?XfFPcg38vwBIBPDwza/Dm7KbH7UGIuW2/iRNCJb8qwtKMIdXhMPPfOjmVKKF?=
 =?us-ascii?Q?PsyaKWHSuQOQm0llJ6Y187Uz63pNARKCgKdIX0vwyWa5QvcCD//Qqugw95XM?=
 =?us-ascii?Q?ZaoS61RcfVkNRVOq7QEsH3DMmPbMh15Fp6nIWoOKikLzoBhhyO4vlsoKhm8g?=
 =?us-ascii?Q?tF0pQ/OLGPxIBOK+y0cKmUIKzsIFg73jB8N6GFZpl6q62L48wFmxdtIzMKah?=
 =?us-ascii?Q?SSR3XWfItWFkt3WSGXj5SkcS+G+lLVzWybDOivxsWZLMMZilg619NIM06+o6?=
 =?us-ascii?Q?+SH0k8myiRFpWOJPffzufChkCiF9?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9018
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: caa46881-84cc-4e86-e7f1-08dda1deeef9
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|35042699022|1800799024|376014|82310400026|36860700013|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dFHtd2hvvdYCWsrhdWCf+4kyaALYkG/Wx07w7fYxQCZqACSQ6U3jebfNt4AT?=
 =?us-ascii?Q?BWL2mT1PXh5hQT63LlG5CFGBwwpGFylkUl5JSRq04mUYLJUQBlM1EY8bnbxf?=
 =?us-ascii?Q?IT3ZJ6iq+TyqqmWt7AfhSuSujA8WbBdPL2WpeYD4HiVcB9QwFM22GEGEe7bX?=
 =?us-ascii?Q?G+I6dkYpjx4+OmIu7IopT88Smarua7HKdD0SfHmXcmr21D/GviD0ay6gHLSa?=
 =?us-ascii?Q?9NjhgX3P7ooohRpHa5rC8ZSTGjAP7Q/N4WU1cHqcLJ3UvW5YMTs2ye0fWr0C?=
 =?us-ascii?Q?Bw+V20cnltgwo1H4BujsnJGfAF5m9qgwb4EKQKK6D/yp/QVRpfnv7crTmADI?=
 =?us-ascii?Q?fY95Z7o6W2eOHlw3m3Okw+iuVgCQOlePwPI/S57A6kCBIWI9IqlHWIAEmu8d?=
 =?us-ascii?Q?dVeLmwgLi2XsrvDVsE9q+q2vk755pesz/3wGWFh2oF/uulEZyB2ci4WLOrpp?=
 =?us-ascii?Q?TwwuSgSSI43SWAwmoTaru/oQ7/kYvJ2P4DeCSxvnnufkfk9PWMrc2wJczUkh?=
 =?us-ascii?Q?JyOUVQuQ5DhSN1qT+vycL83pxQGOXYgMuTAs85UHbl8/d0qS73jsSRcB4Re5?=
 =?us-ascii?Q?KIty9rfQA6cAMnhds+peiONVSvHM4EnCXbQxHtQjWp3+pYJhy4q4H3lDvtZd?=
 =?us-ascii?Q?rSk3kXLLq3UBHBcf4N1fnd78V38vZAeuQ8zjH1WQrnr0jXmk0OG540EUbYiY?=
 =?us-ascii?Q?cd6OyP5v1z0Mec9+5Lq8EEiasXQaHiHes2JoFkxZj0gn9EMiW2lgpemOcj1O?=
 =?us-ascii?Q?XYXl630cgNEKJ3a6GhUJvALpv74tAswv7v32U2sYmF0RZ0LMByppLFNwUstW?=
 =?us-ascii?Q?KOhTtLyvkkgjOfC5Qg/pGw5TpIHP3NJbWDOtRAriCPwIJSPxCAqXs5ve0KU9?=
 =?us-ascii?Q?bWUMkTBDxGGjrciDWVW2G0TGPNDhl0Eu5gsXnbTkUXDL/XALPTE4/ZfRTZep?=
 =?us-ascii?Q?FrxQEDBNaW0miSlekRQXxBc97MJ42sBCG+nbFwxlCWWOlksP61tui8dSzXvh?=
 =?us-ascii?Q?HKk8bbiLfXbHFIpycOaoTKD1jsqOEER2uCrPst0nEv4uCYDpFzgoAAERVF5U?=
 =?us-ascii?Q?Z/0y1qN1I0Jbx2iPoOLulIAGoBvzBFGvhSX3+X1Y8rzgN5Es59J+l9DF088D?=
 =?us-ascii?Q?uyXV0y/qeKhYRgXMlZNoliPBzobU8dn1piFqwfYgwvEq8WFjN6n/+tqbWqEL?=
 =?us-ascii?Q?bs5KGdhEuBwAJI9SgvtXBnJEk4KBo40q/fxnWWbii+9t5HCo7KQ8RU733rUh?=
 =?us-ascii?Q?tc+NvwYA9QudzpbknyDRlmq1J7U868yM2JvWXFIUxPFASSTPOsJW+Gd5xL9k?=
 =?us-ascii?Q?12UMADi7KSeBdW8eALyzF7kcGcX8mIst0DSsldH+MqpRf3wqVLN7+C3pWvAP?=
 =?us-ascii?Q?T2fBMnz5eI5r1tEEITxvQkvh3azOb3gKHScY8agxK59lu2quW4/kyKdqx8T9?=
 =?us-ascii?Q?vaHmEBMFEK7dsmNyiTy+sZVfxDvZiF9s+3MA3s6LrN+63oOn7jT9lw=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(35042699022)(1800799024)(376014)(82310400026)(36860700013)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 14:09:08.3817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c5eaa5e-b9b9-4f6a-7a36-08dda1df0aa4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E5.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8452
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

This patch series introduces a GPU HW abstraction to Panthor, to enable
support for new Mali GPUs.

Key changes:
- Addition of GPU-specific initialization framework to standardize and
  streamline support new GPUs.
- Support for cache maintenance via the FLUSH_CACHES GPU command.
- Support for Mali-Gx10, Mali-Gx15, Mali-Gx20, and Mali-Gx25 GPUs.

Firmware for these GPUs can be found here:
https://gitlab.com/dliviu/linux-firmware

Patch Breakdown:
[PATCH 1]:   Implements the GPU-specific initialization framework to
             handle differences between GPU architectures by enabling
             definition of architecture-specific initialization routines
[PATCH 2-3]: Refactors gpu_info initialization in preparation for GPU
             register changes and at the same time simplifies and makes
             extensible the process of determining the GPU model name.
[PATCH 4]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.
[PATCH 5]:   Adds support for Mali-Gx15 GPUs.
[PATCH 6]:   Adds cache maintenance via the FLUSH_CACHES GPU command due
             to deprecation of FLUSH_MEM and FLUSH_PT MMU_AS commands
             from Mali-Gx20 onwards.
[PATCH 7]:   Adds support for Mali-Gx20 and Mali-Gx25 GPUs.

v3:
- Split 64-bit register accessor patches into another patch series.
  - link: https://lore.kernel.org/dri-devel/20250417123725.2733201-1-karunika.choo@arm.com/
- Switched to using arch_major for comparison instead of arch_id in
  panthor_hw.c.
- Removed the gpu_info_init function pointer in favour of a single
  function to handle minor register changes. The function names have
  also been adjusted accordingly.
- Moved the patch to support Mali-G710, Mali-G510 and Mali-G310 forwards
  to [PATCH 4/7].
- Extended support to perform cache maintenance via GPU_CONTROL to
  Mali-Gx10 and Mali-Gx15 GPUs.
- Link to v2: https://lore.kernel.org/all/20250320111741.1937892-1-karunika.choo@arm.com/
v2:
- Removed handling for register base addresses as they are not yet
  needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same
  arch_id matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining
  current implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Thanks,
Karunika Choo


Karunika Choo (7):
  drm/panthor: Add GPU specific initialization framework
  drm/panthor: Move GPU info initialization into panthor_hw.c
  drm/panthor: Make getting GPU model name simple and extensible
  drm/panthor: Add support for Mali-G710, Mali-G510 and Mali-G310
  drm/panthor: Add support for Mali-G715 family of GPUs
  drm/panthor: Support GPU_CONTROL cache flush based on feature bit
  drm/panthor: Add support for Mali-G720 and Mali-G725 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |   4 +
 drivers/gpu/drm/panthor/panthor_fw.c     |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -----------
 drivers/gpu/drm/panthor/panthor_hw.c     | 197 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  66 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  35 ++++
 drivers/gpu/drm/panthor/panthor_regs.h   |  25 +++
 include/uapi/drm/panthor_drm.h           |   3 +
 10 files changed, 341 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.49.0

