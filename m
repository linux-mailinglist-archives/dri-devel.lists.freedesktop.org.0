Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5D0A6A4BE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBEC10E5DF;
	Thu, 20 Mar 2025 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jL+tGOyg";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jL+tGOyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013070.outbound.protection.outlook.com
 [40.107.162.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B780410E5F1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xzqNjyyxH2utbX/FhNlyD3LyO6HblIdqAqKO8vQlEPgOsjTVfvD+CfLMQrHdK45sDXwSADl/r1kl5meD0NGuVRct7mSSoxrjyOZEr0DB9Bf4Pysvemj47qoJ9rUvCwqoCwZTXFQ3aRHmvXEUYK5U17BHk3kXYpRfCMIlhLs2LJffITIy864QnBe3S3B0ijDcg/cHur152K6iKr8xRosmISvKl4XFFCvOgRz5F01YdftPKzIdBbyosfhavuHIbxNhatWNngtrINsk/FcqUPhWSbllqGydGOZF4Hooe3VCHM4MJyQHjrdZT7mtjvOUfPsnuz+a7Y/TQueofo/m87qaKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10bX34gem5db3oxym6zErrelI5uO1/At+8Me55n7X3U=;
 b=sHojHQpRg8M+NfkAIvkMhlT7WxRqrslkSLJaTHjUj2zR4BQT1e0E5I3p4mkZeWbirVaSFz7JIZlH8F5YzcNETwuYOxv8un4EK5+/wxDQ2AIqlM+RU81uq20alXyMvREUVEbbjBIEmTxNOVfzHGYUA8tlCmkpYQ6TqEpLfkAYh/gTh9L48n7qDrL0ZAh/a4yC+RII7euPhqyZiEAaca3zuGM+NgZTKa1AqbnMT5MnnRuj0+NlB7Pb1Zb9fgyxNNI3J+/zKMoWnq1JayZGNJhXQwj85Hx3PvEphjmwQvvC2ni8oJDAG2zZo3khRfjbJlep69UZDvOxoxTQDGzUMy4mjg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10bX34gem5db3oxym6zErrelI5uO1/At+8Me55n7X3U=;
 b=jL+tGOygtLnvW0tm3na8UGyqT4VYj6hTsGzL/XldcljVc91ihvk/p7xNHRGNjX5NA+1YF6fZSNsU68GEgCxOiZK0AW4G5kVL4R6N/Kt+GBnAqtb292koLSXIbs6JMFhJvgr8jzL39YVxjo/+9Pa87Er9qxTRklbXgA2hIfTqNCY=
Received: from DUZP191CA0044.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::25)
 by VI1PR08MB10273.eurprd08.prod.outlook.com (2603:10a6:800:1be::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:18:10 +0000
Received: from DU6PEPF0000B61F.eurprd02.prod.outlook.com
 (2603:10a6:10:4f8:cafe::e4) by DUZP191CA0044.outlook.office365.com
 (2603:10a6:10:4f8::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Thu,
 20 Mar 2025 11:18:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61F.mail.protection.outlook.com (10.167.8.134) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:09 +0000
Received: ("Tessian outbound bf3b9ac19d92:v597");
 Thu, 20 Mar 2025 11:18:09 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: ebaf5e1d595e2a89
X-TessianGatewayMetadata: DglCTIocmImtVX3Vu7BXAXKitJ1LNpPTnKsYUM9oA89C4ZHaTliKocskqbXM7LzXE1o21KOWUw/5Fry93ZFmC562zVN16rD3spPiLp9zWsr9QP/2qoC0gbPfbwp8dWsUSVsr3BvN0AOO2/QFspodD1PcjnSyUp3HBEfyoKMtGGo=
X-CR-MTA-TID: 64aa7808
Received: from L975582a22657.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 95F7D3FA-A07F-4F84-9450-1FF2A3A88C14.1; 
 Thu, 20 Mar 2025 11:17:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L975582a22657.1 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:17:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jogx1Ui15MRqdnIEWJfMc3JR9HNF2zn9OpIBvZpFYefLmwDbvLRqM+NXlcNcjvfB4fmCPM4wZcr3MMcgSEzNIVjwNRTkSuIaLTUyvb2HBqrpw/wELT2L9R4dbFtMCJ5t5iCDqrJmC0hRfcgmQ7KKFxxbutLkzSsw4eoT66Nz76vA6XNGaTtrMNRWkTMs21iB161lpkw3sqKnlQkO5gYJFgGk58skN27CDTqwZGwGW6dQT3xh6pBjOCJ/JEgzLRAbs9Mm4+UwglKDl45UMfbqyjhZZcxeZ5Eb9n0wcz8x8MlUbGkeA0jheoNJq6tGaalwYdEMBQSZFrBWaI5Tgmu3fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10bX34gem5db3oxym6zErrelI5uO1/At+8Me55n7X3U=;
 b=ScOblR6uRPZ8E76Bap58TuRNuuSUMKUh5QppAZfDZVj9tW/M1pdBfP0RVPzCP03im1ITUGwVfm8ydK/rfvuajlwq/xdVYM3uMzcmityAAQopNw0q5g3zVGjcyJqOyU48eZeE7xoRPmryggNCWjxGst2//Ft9reW4369v/SJhxplApGxKrfDftGBKsPF+7r4MTmlvsFFk9M0YHpuU7j1zhRR/4YIgx/Fa82xTuIA/apY2hsO0mt3o+0e0AEwN3ccTS7ZDN5j1vhctwXQWzPghjfXpI/V8+cz9LUslnrSnVQqOWyBgDiwB+OJsAu8uLctvBQ+IJ2ytcHGpSrojskE3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10bX34gem5db3oxym6zErrelI5uO1/At+8Me55n7X3U=;
 b=jL+tGOygtLnvW0tm3na8UGyqT4VYj6hTsGzL/XldcljVc91ihvk/p7xNHRGNjX5NA+1YF6fZSNsU68GEgCxOiZK0AW4G5kVL4R6N/Kt+GBnAqtb292koLSXIbs6JMFhJvgr8jzL39YVxjo/+9Pa87Er9qxTRklbXgA2hIfTqNCY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB9074.eurprd08.prod.outlook.com
 (2603:10a6:20b:5fc::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:17:52 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:17:52 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] drm/panthor: Add GPU specific initialization framework
 to support new Mali GPUs
Date: Thu, 20 Mar 2025 11:17:32 +0000
Message-ID: <20250320111741.1937892-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0556.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:33b::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB9074:EE_|DU6PEPF0000B61F:EE_|VI1PR08MB10273:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b9c6990-ca3b-4ea0-9515-08dd67a0e583
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?rHW0eXN77vq9q1NHI/PduCsxuXYzWNlkGqQn3/mqzB+28NEOqw5kqo5liBjC?=
 =?us-ascii?Q?FsLyew23S0jPvDlJDOIGPhMz6goJi98k8WC696F8tVHsN2IcJYoQatZka7m9?=
 =?us-ascii?Q?VoBqckAS0M2hkydLLNPilxFic1VMgPWAqQEA5UTrPcZhbZCNAOujyTjn9jHt?=
 =?us-ascii?Q?Jivua5BGet5M0UJKN61NJivSMuzFYUJH338TQ5grJy0lzC7jdFluMUU4pXA2?=
 =?us-ascii?Q?/KzNt/9nPbqUkAin7KiI3lQkxSF+BqqZ5RLxaJ3oRyMU4MwXWr3O0yeaXrv3?=
 =?us-ascii?Q?X39dvCb5ZxBO9iqolHUAfInNWb0vupKKStnATPIPEd4wpWLXPkh1aq/GmySO?=
 =?us-ascii?Q?dC/gq13YCMqezzksBRlXVY4WFPpnBeecEUSlNZd5T6eTROzN2C5BepQIgkG7?=
 =?us-ascii?Q?r6Jh2XsKaGqhnDQGGweaNJ5unR+c+/yRjWT/16VQsu5na0j4WoxyDF5biC//?=
 =?us-ascii?Q?sMUbe1sxq5ZIXWpUwxg8hbO4f92kdnG1GOxoCftitU+WuPo9DDZXIZODNReE?=
 =?us-ascii?Q?H6wqr+OLZu7vUBnnTqtU+4vQw0kX1lSwUsGxYpwpgUGZkHmt89Dr9Lpga3S4?=
 =?us-ascii?Q?vDDfj7C+EvgBAIWoij6OlOT5gbVCSKScMXZTvIolnToKiMfG9QYUhFjfRVyd?=
 =?us-ascii?Q?Zl+PcIQhbagJlbqUNKEjriJX/hKZGPhao8M4lgXVZYUDCHBaTCq9BfwZpR83?=
 =?us-ascii?Q?sTdln2pK4qOlLJEEp/kriNcnmoSbeeqTLiwKowJrkTHv4duaFx6sD6/Iknwb?=
 =?us-ascii?Q?KXi+tlo74Wm4kURuh4lHbd2fyJFsap6OxF+m9Jn8i5eKcdzOYOwMVn3nYSw3?=
 =?us-ascii?Q?Mq5N+A5IL2yXwyFKFBaZ3CAK5IRoz22jbmtFKQybIyfCs3OfxtkTChoQ+5uo?=
 =?us-ascii?Q?EiouK9qzehOII7fAt2Bgb3IHlvSVZD8+jMYU40B7pMIH/taRL024m1oZ9r7z?=
 =?us-ascii?Q?3yzhgPhWoxzLbluh4Nz1DtOyj/oKqhnlPSsBlr0hZ4mzZeDN6wupVL1wnmWI?=
 =?us-ascii?Q?MPuOcKmKJq6EABIqX/0xq09eDGUD6Pn4pWpkHFdPRbSyrAcen7FJjLctx+iB?=
 =?us-ascii?Q?6t0aZkgrEPxteeLowNvc0VKY89VzaN6EpEClNX+pcgQoh4806JAejJJzZyKF?=
 =?us-ascii?Q?P5N0Oayz90vG4TztpFpRu67U+qKuBkbLte+XC/LwR95N5a6bBJmaS2my5hby?=
 =?us-ascii?Q?iZ5Eo2J3Pis9kDby9STKYLZvKuumjvoIqwGpC4qDTMqBeWFdoIXWfkPuH0Mq?=
 =?us-ascii?Q?ZzfyZFJFL/1It0vDr44iGBRXAm/xdyLwIGwXao+G+CQQa+FA87C7yF4HNWHl?=
 =?us-ascii?Q?3C1RmtyKf5Nef/d6ileImudpi/4blOlOXDOs/gLrERtmIe2ySYNn5oBwxOhc?=
 =?us-ascii?Q?zaIGpYTiZrvpSp0aniWtpPB5eRuU?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9074
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 09db6160-5031-4781-9206-08dd67a0dafa
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|14060799003|376014|35042699022|82310400026|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?N/C826Ji7H9y/8r3EfXADLudkEsW/tmG53za3y2wPOM/AmIH4oQVwvHP35Kg?=
 =?us-ascii?Q?9lfu/7JWQxm8jYtVMEeBtc27FLc/6nxJauJT/tE8Z7IGkG4AFfsOalduSbvv?=
 =?us-ascii?Q?ZGEyuKxWVegx16nSeVYtums+G0cL2xZHMRnlvPeJi3mZMc+3Fo8Mhu2CPIPF?=
 =?us-ascii?Q?ewKkVOdJk4PhNWbfV+cN+yhO6SvXCJrXn941ETCf3EkPq+QyzFCPz4BpithG?=
 =?us-ascii?Q?CIr4KIWHHjf/vbFcJ/Y2aiMkZqMA0/CBlpdFARHGjENxzqNQS+MBUoFnmGFQ?=
 =?us-ascii?Q?wHO4sxGHHcj+N8b541xSgMBwWuWeUPXQaA/ehAtBTSQ4fUJqX1pFT0mGUBwD?=
 =?us-ascii?Q?VV2BdWFRgANQ5bWAUGuxU/VN5f+S/VZVOVF5OXoU7fYeIqiSaQSqOeR+Etga?=
 =?us-ascii?Q?T5k2hGCHZ9qRzrevs+j5peL/NST3Li3Ywexf4Dl7zeIEM0j4OiKr3FszMnZE?=
 =?us-ascii?Q?y3N8sgxfcz0tg9NM2HGf9O+RbkE4djVFAxdfr9DZya2i+RLN45BnFQvm8+N1?=
 =?us-ascii?Q?QQm1eP78KYf+xZH1x4And9fFOi8OzwYC/OUfzPgu2gMCKCW6heFNo3lwPUg1?=
 =?us-ascii?Q?QS5yCLnfFrdWFsqeIwuZ3GGjwerHi+IVGxD9fFAihhlr7NUf1LS1XzsB91WX?=
 =?us-ascii?Q?RpGyQi3+qzV80BVjTpBI6OYgTEW2zlXGuSmPBRRLYntdplfevWEfUZWyedxP?=
 =?us-ascii?Q?zSQo7F8Uqx18DAKs4IjlRuOk2+UtplzlCeNmzoeTK0YbPztIYXEt8DlRrex8?=
 =?us-ascii?Q?0/PlFM0EjZP4+gi8TJWrwWMX5LpMJXi4cRilf6xwr3T9QbFPtpkRF3P6Dqs8?=
 =?us-ascii?Q?4B338U+ivNjlxTAiR/xorbteZH7fbFKPfJa3HC+B3gUsTFpJ7Nb0HwGa6jSK?=
 =?us-ascii?Q?l1ha8CiO7a3F6JDqu0G/tHlJBjK3H/u3EwHc7MY4SUUHUbk+UChfPrPygkJ1?=
 =?us-ascii?Q?p1YwfcPeHFekd+vPE0bcBcLLOGvQodHzQHD8LaUjOzsNnyLq7XlQAQPOdD3S?=
 =?us-ascii?Q?rRrIMLBMOU2HIiR43RDCHcmzkn//k5E13JX8Sf4+0pGy8kVtQeLbCS2WSbsz?=
 =?us-ascii?Q?USGzf6GV5bEGk26CspUETgQzSXCB0FkBn5D5WtR2CTIDUMUKtJ3nt9ChQrVr?=
 =?us-ascii?Q?wNzZ6FcHeXMuniKQIHdL2a/HBJIh1XSNUS5IKal7q6Zxyzcs7KWzpTNsyGXd?=
 =?us-ascii?Q?DeKapwVDEhqHtm7xKv3U6M8MUEa/LWzxk0LO1GauQ0l2t2dSW+jt0YhWeysm?=
 =?us-ascii?Q?InxcJ++FDdd+n22Ph++huhudKAPo1EsAum9XjMaMwqtxTt9YQTK/qUUTFHrm?=
 =?us-ascii?Q?WWdRCCJP4m36WNgfDulr2UCHRxBTi5gZyHCtnkj9xvN3WDWV5PqGYSyklNE8?=
 =?us-ascii?Q?7H5NBeFkOTBnaORhJh6Ii0CpZt87jamLAz2n9B4L7MLqcltk5fl8l7aYbYnC?=
 =?us-ascii?Q?GFC+Z5d5Pc5XgsipMldCPV6+l7NYoVv/5H/jfpHQtUoBU3fWbgTXbS0Ek8Bk?=
 =?us-ascii?Q?hxZ6nUMtPPMkdyA=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(1800799024)(14060799003)(376014)(35042699022)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:09.9043 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b9c6990-ca3b-4ea0-9515-08dd67a0e583
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10273
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

This patch series introduces improvements and new features to the drm/panthor
driver, primarily focusing on extending support for additional Mali GPU
families.

Key changes:
- Implementation of 64-bit and polling register accessors
- Addition of GPU-specific initialization framework to standardize and
  streamline support new GPUs.
- Support for cache maintenance via the GPU_CONTROL.GPU_COMMAND register.
- Support for Mali-G710, Mali-G715, Mali-G720, and Mali-G725 series of GPUs.

Patch Breakdown:
[PATCH 1-2]: Introduces 64-bit and poll register accessors, and updates
             existing register accesses to use the new accessors.
[PATCH 3]:   Implements the GPU-specific initialization framework to handle
             differences between GPU architectures by enabling definition of
             architecture-specific initialization routines.
[PATCH 4-5]: Refactors gpu_info initialization to use the initialization
             framework to support differences in GPU registers for subsequent
             GPUs, and at the same time simplifies and makes extensible the
             process of determining the GPU model name.
[PATCH 6]:   Adds support for the Mali-G715 Family of GPUs
[PATCH 7-8]: Adds support for the Mali-G720 and Mali-G725 series. It also
             supports cache maintenance via the FLUSH_CACHES GPU command due
             to deprecation of the FLUSH_MEM and FLUSH_PT MMU_AS commands.
[PATCH 9]:   Adds support for Mali-G710, Mali-G510 and Mali-G310.

v2:
- Removed handling for register base addresses as they are not yet needed.
- Merged gpu_info handling into panthor_hw.c as they depend on the same arch_id
  matching mechanism.
- Made gpu_info initialization a GPU-specific function.
- Removed unnecessary changes for cache maintenance via GPU_CONTROL.
- Removed unnecessary pre-parsing of register fields from v1. Retaining current
  implementation as much as possible.
- Added support for G710, G715, G720, and G725 series of Mali GPUs.
- Link to v1: https://lore.kernel.org/all/20241219170521.64879-1-karunika.choo@arm.com/

Thanks,
Karunika Choo

Karunika Choo (9):
  drm/panthor: Add 64-bit and poll register accessors
  drm/panthor: Use 64-bit and poll register accessors
  drm/panthor: Add GPU specific initialization framework
  drm/panthor: Move GPU info initialization into panthor_hw.c
  drm/panthor: Make getting GPU model name simple and extensible
  drm/panthor: Add support for Mali-G715 family of GPUs
  drm/panthor: Support GPU_CONTROL cache flush based on feature bit
  drm/panthor: Add support for Mali-G720 and Mali-G725 GPUs
  drm/panthor: Add support for Mali-G710, Mali-G510, and Mali-G310

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_device.h |   3 +
 drivers/gpu/drm/panthor/panthor_fw.c     |  14 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    | 231 ++++-------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 216 +++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  70 +++++++
 drivers/gpu/drm/panthor/panthor_mmu.c    |  69 ++++---
 drivers/gpu/drm/panthor/panthor_regs.h   |  83 ++++++++
 include/uapi/drm/panthor_drm.h           |   3 +
 10 files changed, 471 insertions(+), 224 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

-- 
2.47.1

