Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 186809F8106
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C5C10EBEE;
	Thu, 19 Dec 2024 17:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="ZYPVsUtY";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZYPVsUtY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on2057.outbound.protection.outlook.com [40.107.103.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4664010E217
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:05:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=MgmBqq/nvInlUInr2emGPukLStBLVUut4EKj75zGB4uZeWRzOW6886VI+DMmWpazpnpxRewmLB58OPVjwnn87tsM+uDPBXhxaYpSmGFWvwP+IHLf4Tgw9QOiB8KElpG8HvHRzj72fnJv0EAfdKG1Nn+JMqZ80OAD72tIDjPpFOT3l98Lm59SP7A0cwjFCcRSBovfOJgfuuiHM7npm7HopWZkr4VjkqeCVbfOXk/z3lkhtAtCoDxROMftVh3A3sjG6L1p9NQmnS9d2eURVbLR0vJ1hDHSXANmpISVTddrq3j7+MAko4QkvGGxOwXtMgz9sECmKyoS0CXOz3eH+C5BlQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsWji+aixdgFl3gsa6PjB8lXnnYzW+bLVIu7NvT5Hcs=;
 b=JyWUsyQ27zmnxeXehWDc+ySuMfRKY6KHm7o3xIPbbmn0KFDpUHDUEsBRve/QyKdWh4QlhcXt+npwZmalM7YaH1gc+kjsDuUzyELnuRPZHj+oS5ntrRse09/iONHP3S3/LWvKw3Jvpsg5iJ3cam8VQALcxr03mColafzX44UGUwHLoLrV1bX9+abY0LLNVDHkJnGhRb6NhHDfEWGwEOEgu4gCZLGrqTrOaknIRL7l5vny0Kl5U0N+iLu7n7XHAWkinASByDo0knQps7+eX9mnslyL7YAoBMgzVP0PPEkMXI5whpjWzgHULjP07NccSVIqfgqsNgJbSFIi2uTAXABhag==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsWji+aixdgFl3gsa6PjB8lXnnYzW+bLVIu7NvT5Hcs=;
 b=ZYPVsUtY0aG7Wtg6NvEGY3a9ipKKzj97Z/Kol8+HOy5isY0gWOg8ZSGzGLMIZHkqfEkwCfSYEyAlnRFLYcJvOlcqrBwNRLnIXalzcA5G3qB5UO9MfM3lRKWpOw+A+b/dA/6h81eHV+85/s7bz1FaNY6M9hLWwCUFIo8C9gKRvjg=
Received: from AS4P192CA0001.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5da::15)
 by GVXPR08MB10913.eurprd08.prod.outlook.com (2603:10a6:150:1f9::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 17:05:50 +0000
Received: from AM4PEPF00027A6C.eurprd04.prod.outlook.com
 (2603:10a6:20b:5da:cafe::3d) by AS4P192CA0001.outlook.office365.com
 (2603:10a6:20b:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 17:05:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A6C.mail.protection.outlook.com (10.167.16.90) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 17:05:49 +0000
Received: ("Tessian outbound 8c86f99b1b13:v528");
 Thu, 19 Dec 2024 17:05:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6ff2c83e0fd1b254
X-TessianGatewayMetadata: 0L72estZJ4XR4pqKaOB1iufGLjTWo0Z56459nDRj6j5DqGEvLLWjkkyeElSTrJruB4MumCYXIyrSbws1ePUQD29JztQ6EI5FskiQoYE+A/Ws5noSPUsH1ylRHLhuzYqbEQ95xvZsfZRDXGLNMXx2srk1OH2KiaY/Y4XlODYudu4=
X-CR-MTA-TID: 64aa7808
Received: from Laeb471f382c8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0C7B7562-BC0A-43D0-8F6E-3A17A5CD4A28.1; 
 Thu, 19 Dec 2024 17:05:42 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Laeb471f382c8.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 17:05:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI+dZRdw9fpXVIl7XpTTiRJCbbebT/qbv/Y4ijX8+sqWdnf946VFSwSijqMaZWsoHJ51JCJVb7zPyd+PSRjRedePdihtH8e5Uy3DCJ1PyCZQx3AVnDjTyky7C6Egrlv2y7BReaLAZRzV8Gh0tIf3sCoP8NPevPoLsAAVeaTrYSB2fzhc5ec8so19XLzGzRttj/xHOsLukvP/c7To++qM8v0QBtb3py3UfE0idj0SLxD1uxtClbVOFGy/g/i5MrdYQK5G0CnWmX+rJeHy+woxxU+SA1nTtsYKMEfe/W0apSDjiEm5r1sekUCcyW/KiYMZZhRjDnGS2Q1lvabuKpK/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsWji+aixdgFl3gsa6PjB8lXnnYzW+bLVIu7NvT5Hcs=;
 b=nm5Y+5fFif5Yw1HfLczjzcdW2TCYOgUL7jUCwAm7jhHkcVKU/cImcZR+e6za+TEIkLTIBg2QlhHMPANhtKrMgyclOrqcMQXk30d8Fq0zWvenLNp48Yp/nVcHRpNBa6EeCAhs8qWxLF9Ilwjb1AafN9Ka29gb69Rge6OmZ5eVs/qAzDM/mkz6SnJqyTsZl5cWb09gCmm8AnLEqG3XIl4GKeCM6QuzIcHqXZvqF381kNRgAEH01r2eiAz2TP49300IaSEhlSrUrxz5pOPxwVzb0k5a3O3GpDChW97jJ3g2OrV9xW5hc1nNtVd/+AbWWLggSLByczfHGizO1IDLYZvhZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsWji+aixdgFl3gsa6PjB8lXnnYzW+bLVIu7NvT5Hcs=;
 b=ZYPVsUtY0aG7Wtg6NvEGY3a9ipKKzj97Z/Kol8+HOy5isY0gWOg8ZSGzGLMIZHkqfEkwCfSYEyAlnRFLYcJvOlcqrBwNRLnIXalzcA5G3qB5UO9MfM3lRKWpOw+A+b/dA/6h81eHV+85/s7bz1FaNY6M9hLWwCUFIo8C9gKRvjg=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB3PR08MB9109.eurprd08.prod.outlook.com
 (2603:10a6:10:430::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 17:05:31 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 17:05:30 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/4] drm/panthor: Add GPU specific initialization and
 feature detection
Date: Thu, 19 Dec 2024 17:05:17 +0000
Message-ID: <20241219170521.64879-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0296.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:38f::10) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB3PR08MB9109:EE_|AM4PEPF00027A6C:EE_|GVXPR08MB10913:EE_
X-MS-Office365-Filtering-Correlation-Id: 4090d234-9315-425b-8eaa-08dd204f636a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?KH4wrT8IAyCLQfXsOnRuIlDuSbZckhbflFFxjZRB5T2ULb5C2S53C0S/XsKP?=
 =?us-ascii?Q?o5PMMLoN8HrAya+5ruKoc7GK9Py9S+v9e+Xdguee59PUUegnbakk/PSUnMgS?=
 =?us-ascii?Q?MgvF6havw2g/M3gIncJs7MOVubYR8SQbU27DhyKMabQO5MK0H8K+ZvmxUa09?=
 =?us-ascii?Q?nI+aSnK8SYO/Y0fJqNo8n0Gdy60Dn46xj6MU9f5cWKBXY/z81oaJnvP7RC0g?=
 =?us-ascii?Q?lgHJ1Nu9GbJbuf5SpA8nUczEyI4Yi0L0aGAtIfA+8MPhXgl9h1M5wbMkQfTw?=
 =?us-ascii?Q?Dz4qD6F/hEtmeoB509I5dqM8mBsme8PPRm71Vc0fPd8etmcIWpfjnQAV3jky?=
 =?us-ascii?Q?E6sUzPmQ2CZg+TGrO5CcV4JdAJiljCc7mkMKvQzCEDM2UF+seDhtTUUooaom?=
 =?us-ascii?Q?Ie5Ksu1hmoPzpyK1SDfyasUOm4g6cne+wOJ0oXJ3aeU3FXwH3XgrHOPFQ7MU?=
 =?us-ascii?Q?rGErwZpi0OzHh+Jcg2vc7UZ7VU/BYWu9PWyvWe4fKFcZdigj8HSJLMZvRBYo?=
 =?us-ascii?Q?PX66VuLs/l0Cge9TzAASePdFQm0I7SgLhPBAUWA9IomCamt69XvwxOkHRpT6?=
 =?us-ascii?Q?YlV7WbI/8cR8hbXQE2KpjuqS4fgTZVgUoIzfEdDRz1ag+wNcaWC+rPGFRpkn?=
 =?us-ascii?Q?T4t3lNPI5HjAN1xZq5CXXwlqkYYYnikb8VIMhEikZiqPsV439JwTrq818BG5?=
 =?us-ascii?Q?F1EDzRb9gdgRoEXd7CkAY+KOnTCI6vqyI6qSdTybZji7avTZ/VQ9YzZyxeYe?=
 =?us-ascii?Q?YTIpbF2sfw7CWue4MlhnOC7ncGUgUxK95F3NYOvfTIKUmnmEtvVxEqLWN3c4?=
 =?us-ascii?Q?jxuBFSrKkaAl16UvqbSapg0qchjEekyKC2VgymYj/P/EjTLSCacuslCbD5YS?=
 =?us-ascii?Q?Qz+RzsWZUAP+N9KGlqOWvAKqpknSeRMuDyT44gr+V8fb03z1XvLbdBjYmAW+?=
 =?us-ascii?Q?620b1+MRnFl8vvY/ciEDiUbfDT/DwoqOwYPNEusSpidsHjWhgIfq5mZdi/gL?=
 =?us-ascii?Q?ziJySA2TbpwUIGlprkIoSg9W5gKeHUbWxn1o1c3zaK9iUKNEgk+VUo4fS7Hs?=
 =?us-ascii?Q?diBHxir96D1Z4fiTPHY9mt+B7sqyZsOAZFB9wlZ2x5V0cWpT6OOxnt4q+JvD?=
 =?us-ascii?Q?n6nTEpz/GJw8GBIIF6GQo6/z+9KleIhQpKPq1y0C8msPx5l5ZsZ8DR5QTHyP?=
 =?us-ascii?Q?lXCrTR61gTG6tmMVGwXt/1AZHcmuwEmQPWEZJ/4UX0eBKUY75EJn6zx89Xnk?=
 =?us-ascii?Q?PFDVnr40fhsW5X+sfK5yuRtqIeUr1NrIyPhc6be4fphLltaJMT2cPnUZuYr/?=
 =?us-ascii?Q?6yn//HxaMPh+UOQWLswxz6JVg7WGk0lS02ruU2bOmiUH4J/RGoRs2so/J8VL?=
 =?us-ascii?Q?lH6tn+g9ptK0AH77WpW2S1Jf3R7t?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9109
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: ab586f60-e61d-4aa5-485e-08dd204f57f8
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|35042699022|14060799003|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P/TXTsJoEoHgdn8crX1/vH7COHI4puuPrqN+4aYkBKFNjmjyOwFh2DlMQdsN?=
 =?us-ascii?Q?LF6VmUAFGMsvtpGq01r117MnG0ZlQigJSUBQR6SGJ/aIXTeSp6XUdq3JmWPg?=
 =?us-ascii?Q?2ctFRvEqwi7DPtO0dyNozHmbdJz02FFY1tuiUfd0F/YGiOUCJ88pFrf9Bfr4?=
 =?us-ascii?Q?jQN7WfGf3d3D1tYDIwIT20tW0BO8jDekhYMTeheWFuEGTbF8Bt73zRD1afDP?=
 =?us-ascii?Q?s/AUMlsxzyU+zvRMBPuZvgekkm8C4TzpKBCjHnFyrf6dvngNBnh8GenAMDT1?=
 =?us-ascii?Q?Ovnr5Or1lfEBM4CVYCfgy5byxa4fHUA+ggpgKxyGSqHiNHT/IhoUMYFvYO0W?=
 =?us-ascii?Q?oLcE35OCVrQInKkud0cBdnTPjQvl9bQwNC+/N74isCI3Yh3Wjr/YzI5Z0GRz?=
 =?us-ascii?Q?lcQmkpBziAjGtTkNoE9/Mto/TapIuROenKPgIHxMdYw/F6dQP5siesxxMdir?=
 =?us-ascii?Q?Hx9/WeXuvtYhdkbkWGAZkDxcqi1/VEShj+05VxCsAttv+5siIX0I1KBeDAAi?=
 =?us-ascii?Q?pb0UgKV2oy9K9hOMt+yLq/0M+0FcmWUa48WN46oWujaVq9VUOw6dCFoWJvgY?=
 =?us-ascii?Q?iXnZ7N8JGo0vxP4S/n5JjwyLB0avs6qCSHfJxo9HKvUPINCTBLIR7kMje/we?=
 =?us-ascii?Q?6D6xydQGpdXEAjPIzRI10lHjK0OTzL3Lh02m7Blm+Ngl6CHFXjT2p5hph93A?=
 =?us-ascii?Q?G9o7B56B5ObMlqfmc1JSuAQEedPlj1xW2bfWSJmFj5RZr5LygPQwv4bx+K+I?=
 =?us-ascii?Q?CN07F+lMHQ9S2Otq66GIRVo0DPClOFzukYbKVZfuwunBXGU9FcqDTqDyADgc?=
 =?us-ascii?Q?KchOjDJydpCsgERN7j7xeTC/p+QMz/ARD3vZ1KpG23GvIjNIWESufXH9BKE+?=
 =?us-ascii?Q?ZAM75wKgH6qyyj/z2xW7NnR3N1ajr80Ru6+0u/6e3aV/1+VVhumgkp6u5n18?=
 =?us-ascii?Q?WrxVXzadGlWEVYICAQAJc8Q9fnc3D58alb/NdvsqQIO/iDdldkyK2M/hL1B1?=
 =?us-ascii?Q?e8eS3MrOOrOaSXcr0xUg0uoRjbXs+ovYGtUCR9YXDdmuW2eIEvhevD1SKvSy?=
 =?us-ascii?Q?T6TLlnWkkqcCYYs2uicqfVGC7Lu/1bkTRqWWd+ANR9FhIAmi6zEOAm+bTeAZ?=
 =?us-ascii?Q?T5h51LX8XZDv3XRV8qgxp7bikG4XpqhVMPNRAX0T1OoAK08IltOKe2z4qXzF?=
 =?us-ascii?Q?CWYqNi5QxQf0sV/zEonbMCbnNUtSxRuCKV2WoqfR3cecj+wQDNkcguLRdUZE?=
 =?us-ascii?Q?CWHb7G+Zp68ecJON0iCMoowcSKhhdZD87q7BJ3+AoohcSna+SwCeQE0s20Sw?=
 =?us-ascii?Q?WnJmXWHQCUgiK+gJxGBZrJDna8Ft9YLwHnMKSoSBQgdhQXQlw2Nbc5JM0qJc?=
 =?us-ascii?Q?crHj/CZ84gb9ep/BACnE7ZA98tef6C/odLPTm3VTjSe5Y4AXaZGMMfQXffiU?=
 =?us-ascii?Q?LQ+hti0Hay1g/3Q48vrobISbLB7XEcMs9aTofTTXnnzqBTG5vi959HW13yvK?=
 =?us-ascii?Q?ROwaa9xHmGPPGgQ=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(35042699022)(14060799003)(376014)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:05:49.8130 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4090d234-9315-425b-8eaa-08dd204f636a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A6C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10913
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

This patchset attempts to define a HW abstraction framework with the
hopes of standardizing and simplifying the bring up of subsequent Mali
GPU support.

It provides abstractions to handle GPU register and register set changes,
IRQ name changes, and functional changes of subsequent GPUs based on the
architecture ID (comprised of arch_major, arch_minor and arch_rev), in
addition to arch-based feature detection.

Patch 1/4 adds 64-bit GPU register accessors with the intention of
simplifying a number of HW operations throughout the driver.

Patch 2/4 prepares the foundation for the HW abstraction layer by
providing parsing of the GPU_ID register to compose the architecture ID.
It also reduces the recurring use of MACROS throughout the driver to
parse stored register values, instead only parsing them once on
initialization while providing a common structure to access the parsed
properties.

Patch 3/4 implements the GPU specific initialization framework.

Patch 4/4 provides an example of feature detection by performing cache
flushes via the GPU_COMMAND register in place of the AS_COMMAND register
when a feature bit ise set.

Karunika Choo (4):
  drm/panthor: Add 64-bit register accessors
  drm/panthor: Add parsed gpu properties
  drm/panthor: Add gpu specific initialization framework
  drm/panthor: Use GPU_COMMAND.FLUSH_CACHES for cache maintenance

 drivers/gpu/drm/panthor/Makefile         |   2 +
 drivers/gpu/drm/panthor/panthor_device.c |  23 +-
 drivers/gpu/drm/panthor/panthor_device.h |  32 ++-
 drivers/gpu/drm/panthor/panthor_fw.c     |  31 ++-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 274 +++++------------------
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_heap.c   |   6 +-
 drivers/gpu/drm/panthor/panthor_hw.c     |  97 ++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  96 ++++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    | 118 ++++++----
 drivers/gpu/drm/panthor/panthor_props.c  | 151 +++++++++++++
 drivers/gpu/drm/panthor/panthor_props.h  |  70 ++++++
 drivers/gpu/drm/panthor/panthor_regs.h   | 114 +++++++---
 drivers/gpu/drm/panthor/panthor_sched.c  |   7 +-
 14 files changed, 702 insertions(+), 320 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h
 create mode 100644 drivers/gpu/drm/panthor/panthor_props.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_props.h

-- 
2.47.1

