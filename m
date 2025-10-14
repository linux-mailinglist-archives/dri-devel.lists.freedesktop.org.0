Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49711BD884D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB3610E59A;
	Tue, 14 Oct 2025 09:45:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="bWx5DRd+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bWx5DRd+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013008.outbound.protection.outlook.com
 [52.101.83.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22EAF10E593
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:45:07 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=lSxImkXHoArJ0DFSpMnrORWZD06LSkYkbHecg3dDt6ZtBReDamM7fJNnC0OhZdo4BT+lMgmlGp4pqTjUPKhcfRKwYp2Wz6BghDK9NygXzOqesBkeu8A/I3qwDWAb3528n8PKyTsPu0NvwAWIilVq8tHZci8E5yg8cgulonZdSmXHwhhuTrf4Y7viNNOytgvFGmTpHos+dv2HvrOZQome0ErSVZjcU+8pHIOKJ5cBSmbRxfjZ5tFePUI1d1S0yLdwJoAHH1SUnxCqhlfJrP6/6CpWoU0kAgQDjzIorvkeD/b3HgbSIeuCA+03g3vzE+iPC5P+sSNnU73sxWP4RngVOA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0K6L6Rv26DxIafxNKUlxtD96VftpAxrkL3rQfbJ8cU=;
 b=Jm+vOjUU4/gYMAKtT56aGFHCNTSr4viPSRDCbTWR0OKrkz9ajOcHUf/T8WFUTuTK1HKdpQRb0SAONNt345sJT1hIsh4AfRZuElumAYiu+iAopi0cLsRJN6hVWQpBICUTBe2oloE9h1bYm/oOl7QvH5Vjj3rIM0SFVMUje5iCbQTypnyhp6GIuBn9KoGice47k8Tmg7BMmiafvWTEsKy6ItQmBQLq4J2GOxNJjI4axuU8GIfL5CPh/yMSaVQ8jcdcpAK85F0eR6QTbsZ17WjpIaAVH44M3cGd8H7LNqKSC9QMKVJ7lXEl2/S38/PqDDizD7L/O2bAaYG2GAWW/XN4RA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0K6L6Rv26DxIafxNKUlxtD96VftpAxrkL3rQfbJ8cU=;
 b=bWx5DRd+yiSDkMDY/6b5EzhQTwNC1C4112oXPM8xOygnxImCXxxJ01NW/NvubnREmnkO8R7rZNJ0DkUdFjbxGBrxk9HQKjZkY8JsMcVLgWV+USh9kwhr81S2I27qtkhYvnThSYdoLl/PqjFrzY5xZ2OBYqzRc9R7uVSZqzyf2LE=
Received: from DUZPR01CA0098.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::29) by AS8PR08MB6680.eurprd08.prod.outlook.com
 (2603:10a6:20b:397::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 09:44:53 +0000
Received: from DU6PEPF0000A7E0.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::6e) by DUZPR01CA0098.outlook.office365.com
 (2603:10a6:10:4bb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 09:45:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E0.mail.protection.outlook.com (10.167.8.39) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.7 via
 Frontend Transport; Tue, 14 Oct 2025 09:44:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h7/pWWp2d0YawxaTZ5GhdpYq5MV9LEF101NRJDR1P7xjAidDW/dw9Dg8Wi5+XREALWkqzrc+aNysFwI1YQge+5pS67zGTfLvjikauCQyshQxkMQKbHqnM3GGJv8kt9LvIrUr+38dNM2V1Zw5qAG48JzLLwK8GQZQU4uQbwTn29M5sCUYb9uIBvenZY/52QJULa+JwmvOAspMBclX3Qj8v2xlzZS5GCrEkBfG5hFcpKh9vkUCEbAVf1hcOc3pDaAYQ4plRySHr+xTFSK4iCkE+WpWbR5rSNHADUVPOPBN15KdC2gtnAGHbcPXhLcDiZdcnDsaGMHpWYm0RjcSf1WgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0K6L6Rv26DxIafxNKUlxtD96VftpAxrkL3rQfbJ8cU=;
 b=V0hbWoz6F4ozoNViXkCobKFK3dPV2J22nM1C3W3GF0Y75eErwT8PRImTrb+MLCa645KzqGPvfaiJaBlo0HlDJ3NXD2zDxXWTMfMBjBcnXKKERYzysT7zcdYKr2rOIXQ3OmsJFr4yz9FDD2XiqaXnL4xQpz1qv54EycRW8ijctxdbuf2ZYmykXVOoEZGFniEHPlEDVcVKEZ2gDLl2UClIV1fbCw/IsQMlVOe+pOfcEkJbD44RVUeEZmtl3mRMj1huRu26z82QrSOgDkLV1hNc6Ld4Q6AIVt9gs2P6srejkiTDd4YAjRvO3ZonvY8rEAo4iWsYGs+aLzuUaQB5zCDoRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0K6L6Rv26DxIafxNKUlxtD96VftpAxrkL3rQfbJ8cU=;
 b=bWx5DRd+yiSDkMDY/6b5EzhQTwNC1C4112oXPM8xOygnxImCXxxJ01NW/NvubnREmnkO8R7rZNJ0DkUdFjbxGBrxk9HQKjZkY8JsMcVLgWV+USh9kwhr81S2I27qtkhYvnThSYdoLl/PqjFrzY5xZ2OBYqzRc9R7uVSZqzyf2LE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS2PR08MB8286.eurprd08.prod.outlook.com
 (2603:10a6:20b:555::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 09:44:20 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9203.009; Tue, 14 Oct 2025
 09:44:20 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v1 09/10] drm/panthor: Support 64-bit endpoint_req register
 for Mali-G1
Date: Tue, 14 Oct 2025 10:43:36 +0100
Message-ID: <20251014094337.1009601-10-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251014094337.1009601-1-karunika.choo@arm.com>
References: <20251014094337.1009601-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0108.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:34c::8) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS2PR08MB8286:EE_|DU6PEPF0000A7E0:EE_|AS8PR08MB6680:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1de41f-e4ab-4232-4534-08de0b06538e
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?SRHfW4np2Y2Uk3Lqj4aT2zgEh+eBUsS7m1h5MOxkX0V0GjUdZxhEqXbwsJKj?=
 =?us-ascii?Q?9NDY943o7mTazhWQQkIwBihjo2eXMUX0YnAaKFtTKmJuO8Hf6aZFZWG3YVu+?=
 =?us-ascii?Q?LLyx5nTgZvqZqewbkxYK4X/1esi0UquyUdil7aj2aDxK2E74vzFm1lMk2WaJ?=
 =?us-ascii?Q?L6dHqevVFISW8lKenFnjWkYZ6zzYdEt1foz2EiYx+vTZc5a9FwZHJAIy6anV?=
 =?us-ascii?Q?jFUuHlJMXVIr7Cq2MZBrH7EC39wxVqQ1AAENAABsBegHx/hdlzEPZtsGAlwl?=
 =?us-ascii?Q?m+yG/c6+l8MY99njHcYPHDL/TeGe649V9G3balOdVVL8PPz3i4RfBWWyLTX0?=
 =?us-ascii?Q?4j8nz+DSMybDSI+YHpnARRwlpbpGSuxDv20t0f80C2yiL2cB5tmxDp8D4zuw?=
 =?us-ascii?Q?hpeHyfibhtnwyEF8Wt0vI9JRGfEnWeGaOVx0e9RqurtElqSHHaZi2oHYKeYI?=
 =?us-ascii?Q?lmUGw9SIfPoyEq1mhGPBnSoWd1Oo1z/KelBAnfMOY4uQku0v7/BGuokE7v9N?=
 =?us-ascii?Q?frYFz/5eakXMzaEfCtpMTpL4oSXHz5Vv1alrnA9ZoIRjVO59cpJVLUv3GRSz?=
 =?us-ascii?Q?72jxf1XBHHIYLqqjg66ZD2FKMKJWB0h2H2tvjIrHIuKxN0dJQO1lyVLN2Wi9?=
 =?us-ascii?Q?DccxJFxtHre2kctkDS+oEwh955hcMc57FtLW8oZ4KrQu1GP3xloNOdup8SbR?=
 =?us-ascii?Q?KiK2h/CeuDFyNWsWht5pxFz9sW5nZfpUk2iAeeAm+cDyehOYTSG9qi3Fs71S?=
 =?us-ascii?Q?627VP7nk2f0bqjMRc6pJoWp5FRp+LB+rOesm7PEydPEbRSAzrRduuKzJEgkB?=
 =?us-ascii?Q?Td4Q51FyrTfGjVCJl+hMpSL1zFwVLnouvMmtFsSBNf4LngAnLp9uvw6YaeBs?=
 =?us-ascii?Q?VTd8KsqQwV/aKEnRcfSSdM6IfbFViLIpXT85yiWkiyJ2R+6Q6WYn60OYbyt5?=
 =?us-ascii?Q?c30iMYO+RjasIXAsoeJekKo2Lo7YM6xU6eu0Btb/ye/oYr76ecqjqBfRYVtq?=
 =?us-ascii?Q?pS0rqx/D0TxcDyncgLvpioCugSVlL+1eOVc3hlXuP3kpYrTbw3/C77HueSYE?=
 =?us-ascii?Q?bfV7EcBt2niJDihq/oqgYfAWVdvft7VyejJPWEosPukrJN08G4jny+gqDAxu?=
 =?us-ascii?Q?+ckIK1ohutMXUuM+301nRIVZKDkzbUi6M8uIDAxHgiUQ6L1qq6MlSjYBA4z+?=
 =?us-ascii?Q?ZITFkphVhEOq/pmZbrEVBSo0CkuvPk+Ou9i4MaJ06NkPo+4eec+zskCEGMmg?=
 =?us-ascii?Q?1OF/pjRfGfELfQAAEa3Y2a7+h3q1iazDjEijZEi+SCf+rJ7i8vj5xwXPZjuN?=
 =?us-ascii?Q?0g3wuljPbFQeot/s3exT/4FNbNl8J8xZsoOOjjdkW/45dMG8Sh+E9996zzHg?=
 =?us-ascii?Q?i89H4JD9TedKupQbqw0Vjlag8Kclib6M4jLEPRzgrmFDh19sdZfz5Bpm0X3l?=
 =?us-ascii?Q?ZP0L6ONEPpfIQeTlQYBOtOdL1Pd5WIMC?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8286
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 213dc60f-1900-492a-6a8d-08de0b063ffe
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|376014|35042699022|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B3pAAmtS0SWZ9eIO+kaAdcTkcEB6iq4G+ZzkH/vgy5iYIDmXAXae+P1UnpY3?=
 =?us-ascii?Q?g+G0RBtfchZPQCMHXIgzIW/55kF9JHFxlYasrU7fEzynr7qWtPnCwU1HSP4G?=
 =?us-ascii?Q?uESpkQ4DNvAkRxGqlFmDN+ZstV6YDusdkO0EYdnJI3dMen4sqwa4/L/kTCog?=
 =?us-ascii?Q?olytWRxs5vZeUeOIlzCs2E8Era1nF3KVC0hd9F0KJm415Y/NsX+jvOGLhGeX?=
 =?us-ascii?Q?MDWYu16Z8o0xJP7aElSlREzjLw2w2us52eNBUotVzClG0Yo7FkA3s6ffn/X2?=
 =?us-ascii?Q?iX4wUSYJOnlvCzPREuqGLsY4VULIas4iL48iN4s2ld3FLq+abHVZZeYSDEYb?=
 =?us-ascii?Q?tswhaqKzXSkqLdoPrwBOc+aWmIpqAVkj7NdH6VW1T6mjAH1eVR2yNaPDOMxG?=
 =?us-ascii?Q?6IOkYhr2ikx+ez9CA1Zolkya19POGcKVcwNn00HQV9D2yw9yuqVU/rikFkk6?=
 =?us-ascii?Q?HH17CF+93odkmiBDGJaoH8Xag5HHFikxVhGvk4H987/Z3lSO6IlT4YUg8P/G?=
 =?us-ascii?Q?Ae7rJr4V5csr2bCNXcmsigglV8uN71P5KU0ao1dcJVPcHTPnhUBwOP7a9EhP?=
 =?us-ascii?Q?7mebTsJZPswN7q9mY8S3fy5AQErLS87GTOGd6EQ7h/4rtCT6aTjaCFqQP12I?=
 =?us-ascii?Q?vkCEntzLiaFWnu0ak8nkPEoALjHb3BPOrv6ixwkAWccO2cnNiEVgpF/ODl1J?=
 =?us-ascii?Q?QzLGAfga4y3POLbLMio/lFR25j9TVMh7bQrPtEDFEgjWXurnUuIi4sAp9o+Y?=
 =?us-ascii?Q?LQYK+9GPsI0al/ZKQKrWNvG4cLQkltnQp2jooCTmqlC9M7/ebB42X1Lb/I1j?=
 =?us-ascii?Q?d9FQbGFrPKFFE+PSguSs8nrr1oTMGeCBqO+2zSobQu+ko2AmZao8nerH2DEx?=
 =?us-ascii?Q?hmjHaCJPe0OFy1IE/gAFp2NswrCukhiFBuAPxwWadJc7oRwRkSAdvvhrAkvA?=
 =?us-ascii?Q?koi5FbVIQtDJYKt+EpqdogXO5SjvFp7r1c6hr66afs1M4iOswXa5Ra2ITXbm?=
 =?us-ascii?Q?bcuwIGEtcWc4l656+zdGD6BWhqG7UmV8i9ERfgpfxoN4FtucAP1PedgLs7u6?=
 =?us-ascii?Q?Ga9i3vbDjggn+KXfF6hzA69nTBRYkdoIBALbi12AP+Fqd0LiuTqsSYhWzCPs?=
 =?us-ascii?Q?aIRZ2yKbMk1BRc326Zz0nJO5B8RzjJPw0fOE1rWcTEhFr2aWb+AMPXKiC1Gs?=
 =?us-ascii?Q?EBI8mCNxqHk7cRLSaWEiqX4DK+xLSxjDD3JelidGFUnDmTFxblapb1aTjjyI?=
 =?us-ascii?Q?JegzB9E4NDigkYUoiavcG1c2KCChAml2EQGEL+q/+9ihUn0NIrD/54riGcJT?=
 =?us-ascii?Q?vS0+892Qs29ydYm025I287moK4ANVGeZWPrD78JiVc05xNc78UgohdRcFTUk?=
 =?us-ascii?Q?poH/y1cdeACHjerqyXrBFMTpNhVyiOrtF5dn/cZHXyM5jDAb69ufffXYkyJ+?=
 =?us-ascii?Q?acbTnSFeDQpTx/mEyPCwugRFiEVoB/rMVu8viQL5UuS0pVq/Dq0pEntr5n0a?=
 =?us-ascii?Q?ajKsg9DJk/qTZTJHygco0JiV2P6VM1omyZGJe2VEZrRFD4ZQLuTY1wrg4A?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(376014)(35042699022)(1800799024)(82310400026);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 09:44:53.1601 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1de41f-e4ab-4232-4534-08de0b06538e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E0.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6680
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

Add support for the 64-bit endpoint_req register introduced in CSF v4.0+
GPUs. Unlike a simple register widening, the 64-bit variant occupies the
next 64 bits after the original 32-bit field, requiring
version-dependent access.

This change introduces helper functions to read, write, and update the
endpoint_req register based on the CSF interface version, ensuring
correct handling on both pre-v4.0 and v4.0+ hardware.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 43 ++++++++++++++++++++++---
 drivers/gpu/drm/panthor/panthor_fw.h    | 20 +++++++++++-
 drivers/gpu/drm/panthor/panthor_sched.c | 22 +++++++------
 3 files changed, 70 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 48bbae8931cb..c1b2fba311d8 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -318,6 +318,41 @@ panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot)
 	return &ptdev->fw->iface.streams[csg_slot][cs_slot];
 }
 
+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev, u32 csg_id)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
+
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0))
+		return csg_iface->input->endpoint_req2;
+	else
+		return csg_iface->input->endpoint_req;
+}
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev, u32 csg_id, u64 value)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
+
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0))
+		csg_iface->input->endpoint_req2 = value;
+	else
+		csg_iface->input->endpoint_req = lower_32_bits(value);
+}
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev, u32 csg_id, u64 value,
+					u64 mask)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
+
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0))
+		panthor_fw_update_reqs64(csg_iface, endpoint_req2, value, mask);
+	else
+		panthor_fw_update_reqs(csg_iface, endpoint_req, lower_32_bits(value),
+				       lower_32_bits(mask));
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
@@ -997,7 +1032,7 @@ static void panthor_fw_init_global_iface(struct panthor_device *ptdev)
 					 GLB_IDLE_EN |
 					 GLB_IDLE;
 
-	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
 		glb_iface->input->ack_irq_mask |= GLB_STATE_MASK;
 
 	panthor_fw_update_reqs(glb_iface, req, GLB_IDLE_EN, GLB_IDLE_EN);
@@ -1080,7 +1115,7 @@ static bool panthor_fw_mcu_halted(struct panthor_device *ptdev)
 
 	halted = gpu_read(ptdev, MCU_STATUS) == MCU_STATUS_HALT;
 
-	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
 		halted &= (GLB_STATE_GET(glb_iface->output->ack) == GLB_STATE_HALT);
 
 	return halted;
@@ -1090,7 +1125,7 @@ static void panthor_fw_halt_mcu(struct panthor_device *ptdev)
 {
 	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
 
-	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
 		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_HALT), GLB_STATE_MASK);
 	else
 		panthor_fw_update_reqs(glb_iface, req, GLB_HALT, GLB_HALT);
@@ -1115,7 +1150,7 @@ static void panthor_fw_mcu_set_active(struct panthor_device *ptdev)
 {
 	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
 
-	if (panthor_fw_csf_version(ptdev) >= CSF_IFACE_VERSION(4, 1, 0))
+	if (glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0))
 		panthor_fw_update_reqs(glb_iface, req, GLB_STATE(GLB_STATE_ACTIVE), GLB_STATE_MASK);
 	else
 		panthor_fw_update_reqs(glb_iface, req, 0, GLB_HALT);
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index a19ed48b2d0b..25ebf0d31d0d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -168,9 +168,10 @@ struct panthor_fw_csg_input_iface {
 #define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
 #define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
 #define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
+#define CSG_EP_REQ_PRIORITY_GET(x)		(((x) & GENMASK(31, 28)) >> 28)
 #define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
 	u32 endpoint_req;
-	u32 reserved2[2];
+	u64 endpoint_req2;
 	u64 suspend_buf;
 	u64 protm_suspend_buf;
 	u32 config;
@@ -464,6 +465,16 @@ struct panthor_fw_global_iface {
 		spin_unlock(&(__iface)->lock); \
 	} while (0)
 
+#define panthor_fw_update_reqs64(__iface, __in_reg, __val, __mask) \
+	do { \
+		u64 __cur_val, __new_val; \
+		spin_lock(&(__iface)->lock); \
+		__cur_val = READ_ONCE((__iface)->input->__in_reg); \
+		__new_val = (__cur_val & ~(__mask)) | ((__val) & (__mask)); \
+		WRITE_ONCE((__iface)->input->__in_reg, __new_val); \
+		spin_unlock(&(__iface)->lock); \
+	} while (0)
+
 struct panthor_fw_global_iface *
 panthor_fw_get_glb_iface(struct panthor_device *ptdev);
 
@@ -473,6 +484,13 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);
 
+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev, u32 csg_id);
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev, u32 csg_id, u64 value);
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev, u32 csg_id, u64 value,
+					u64 mask);
+
 int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
 			     u32 *acked, u32 timeout_ms);
 
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee5..25663de62b8e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1138,12 +1138,11 @@ static void
 csg_slot_sync_priority_locked(struct panthor_device *ptdev, u32 csg_id)
 {
 	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
-	struct panthor_fw_csg_iface *csg_iface;
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
-	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-	csg_slot->priority = (csg_iface->input->endpoint_req & CSG_EP_REQ_PRIORITY_MASK) >> 28;
+	csg_slot->priority =
+		CSG_EP_REQ_PRIORITY_GET(panthor_fw_csg_endpoint_req_get(ptdev, csg_id));
 }
 
 /**
@@ -1303,6 +1302,7 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	struct panthor_csg_slot *csg_slot;
 	struct panthor_group *group;
 	u32 queue_mask = 0, i;
+	u32 endpoint_req = 0;
 
 	lockdep_assert_held(&ptdev->scheduler->lock);
 
@@ -1329,10 +1329,12 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	csg_iface->input->allow_compute = group->compute_core_mask;
 	csg_iface->input->allow_fragment = group->fragment_core_mask;
 	csg_iface->input->allow_other = group->tiler_core_mask;
-	csg_iface->input->endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
-					 CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
-					 CSG_EP_REQ_TILER(group->max_tiler_cores) |
-					 CSG_EP_REQ_PRIORITY(priority);
+	endpoint_req = CSG_EP_REQ_COMPUTE(group->max_compute_cores) |
+		       CSG_EP_REQ_FRAGMENT(group->max_fragment_cores) |
+		       CSG_EP_REQ_TILER(group->max_tiler_cores) |
+		       CSG_EP_REQ_PRIORITY(priority);
+	panthor_fw_csg_endpoint_req_set(ptdev, csg_id, endpoint_req);
+
 	csg_iface->input->config = panthor_vm_as(group->vm);
 
 	if (group->suspend_buf)
@@ -2230,9 +2232,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 				continue;
 			}
 
-			panthor_fw_update_reqs(csg_iface, endpoint_req,
-					       CSG_EP_REQ_PRIORITY(new_csg_prio),
-					       CSG_EP_REQ_PRIORITY_MASK);
+			panthor_fw_csg_endpoint_req_update(ptdev, csg_id,
+							   CSG_EP_REQ_PRIORITY(new_csg_prio),
+							   CSG_EP_REQ_PRIORITY_MASK);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
 						CSG_ENDPOINT_CONFIG);
-- 
2.49.0

