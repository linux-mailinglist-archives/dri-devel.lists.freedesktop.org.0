Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBF4B10600
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1906310E90F;
	Thu, 24 Jul 2025 09:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AzY5ceL+";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AzY5ceL+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010013.outbound.protection.outlook.com [52.101.84.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2E310E8FE
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 09:27:22 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bm/7UBymKn5TmaVLdQEcG9c1D/v8BTMBmvkHzPFeN6Lkhp5BKah/s2jUluNO6q1iPvewJAxYYgLOlzwMDkKz/wUGbK1jzF0P79z+VUWEgUndIYGb3/gZwIOALlI98n0uhQl0UwAdw3nIp5pyek+SvLPKBek2ay+j/Nxf8mB8A0Xb4vXHn4obY95QVIEZpPoKjd/9zjXty39ox+E6pvxwSIDHI/tN7H5AgD4nJabE3Rsi95zL26JvyJm6hLm8U8kHhVFmjxM0QvFTgz9nYV5MFtDDycWBIJlCl9aOMdn0dHTO2jjjn4gaUtCRUdyHHwI6JwIjHsv3mdDi/aKI5A3J7w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6IcXoG+Eb1wXVLOrZQ2v3H5Vyxtj5WK1jPnoYuUzAg=;
 b=FAYUfp308bFBlYx5pwHbrwEkbEQIyvx15WTC3A/58ChkYf9bKopCU6npVFEWpgQVTPRzNfCN+RmOZ54r5bCNXtGILJ6cY5/aJEpaAczoTD2vjmUabCbstJLPzsuW3ceyrJUF/br6pPrmUTzwpo0o8PqgwZdH9sQ2O1u6nreM+Zc83yPf4PQtJrlyJOBSTeSmkIFXKRCLrqDeW3ineluen4grIiM7Ec9yGlV7XsrAgNMJPuce3WLKM1rYA7wExwTnHbKd6qDzWEC1RnEw2inPccrX4gYt4VETn9TF/UK04qnKjQvtOMNWwH6ix267ZTLYchUB1dgkXADx88msvP45HA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6IcXoG+Eb1wXVLOrZQ2v3H5Vyxtj5WK1jPnoYuUzAg=;
 b=AzY5ceL+qTL6GUIoG6UjNUGSWDg2H9KxkuKLmcvAeN8hFc1lfEoXWOESe46GE/DXNS03t8ehcWVn7j87dcIPD/27w4dtPqX/5cRMmgsMJV5xnGjpD5SVYwnD0AKGWI2aw4e8W/qy/1YucnXUnQ9I2tiS49+JMYuo6EAQIDGE/og=
Received: from DU2PR04CA0257.eurprd04.prod.outlook.com (2603:10a6:10:28e::22)
 by PAVPR08MB10337.eurprd08.prod.outlook.com (2603:10a6:102:30e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Thu, 24 Jul
 2025 09:27:16 +0000
Received: from DU2PEPF00028D0B.eurprd03.prod.outlook.com
 (2603:10a6:10:28e:cafe::53) by DU2PR04CA0257.outlook.office365.com
 (2603:10a6:10:28e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Thu,
 24 Jul 2025 09:27:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D0B.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20
 via Frontend Transport; Thu, 24 Jul 2025 09:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHZ1j3CmmFLuiRy0Xs3rQAk2781rANAoQE/SIHMhVCZpDIUwA5IqXHqp6F37KBaNFm+lpivYFsMFLkskGtY2fqiyl1UGIGMpaCowi4JUH35uCHwB8RW+sHVStFaehXODDH9/2itX084fiQ8vYghOVR1uojMQcvBQ7KgPl8Gmo33eHbGse6IVSrjtkdGtCdUMZ3a1frkFqOCW+6E91N2lddFOd4pfngkrsqOrmok/7xu25n8oxQcuJb4ocKGSMhtjTFTCpu9/rh3yjY+owcAeRQsr5n/1XJTh3i2wzB+DL54J2lb6npb3wlqs4efPbsF3yXyRoy3Grf2QSNoSWz3+nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g6IcXoG+Eb1wXVLOrZQ2v3H5Vyxtj5WK1jPnoYuUzAg=;
 b=dakqn0t206RIC6n7EkD5hKeOKHTcIoYTWaLRK2AlWg0GHtNVRb5iBgGw7Zfm0uqRlthMLcoIAfyKHxnSjwU3VKJ5YQlbgpBv1ioL/i9Kg/e7WJM9FQFU8dLLZdHQ5GpGOasC6mq7v4b2misueWXH+Bdw+wfKE0uKhg/bySUswaaWo/GnRmZk7yPID5Sf5N8l71tCePCoLQJr+6j/ftpAH3UmuSoo1ziu7uFplC+0YJhuyM9PPMt1tozsA6ENCtiF1zV5tKUFemV+GBzvhzWps1K/Iq2ks4caXCgj/mmSmxDQylL8p82TJBf7XkK8fOa4HxRexlsj64DtNMTa+li0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g6IcXoG+Eb1wXVLOrZQ2v3H5Vyxtj5WK1jPnoYuUzAg=;
 b=AzY5ceL+qTL6GUIoG6UjNUGSWDg2H9KxkuKLmcvAeN8hFc1lfEoXWOESe46GE/DXNS03t8ehcWVn7j87dcIPD/27w4dtPqX/5cRMmgsMJV5xnGjpD5SVYwnD0AKGWI2aw4e8W/qy/1YucnXUnQ9I2tiS49+JMYuo6EAQIDGE/og=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by AS4PR08MB7951.eurprd08.prod.outlook.com
 (2603:10a6:20b:577::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 09:26:42 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8943.029; Thu, 24 Jul 2025
 09:26:42 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v7 3/6] drm/panthor: Add support for Mali-G710,
 Mali-G510 and Mali-G310
Date: Thu, 24 Jul 2025 10:25:57 +0100
Message-ID: <20250724092600.3225493-4-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724092600.3225493-1-karunika.choo@arm.com>
References: <20250724092600.3225493-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO3P123CA0029.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|AS4PR08MB7951:EE_|DU2PEPF00028D0B:EE_|PAVPR08MB10337:EE_
X-MS-Office365-Filtering-Correlation-Id: cd739d8f-b9d1-4307-8e7a-08ddca94469d
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?WRgj/COjWN/D16d4BBtC77G97ekmHVHs4dGR4YWoDrmLGTWIAOfCzzkgKujC?=
 =?us-ascii?Q?WTplKIa3SDCQpnT3OA00u4KSF/hYcjVx4bFLQjEHZglbvbWclzGGud1IyqBb?=
 =?us-ascii?Q?qkGAzE1sz6nSW9LNIUgK32v2obw1tAORftH6mV4Z8abZUP2BHmZGV4K53iri?=
 =?us-ascii?Q?HVNtEhq6oSEBDYuDcenBad8vrSEcFlwgJD4ZjZB0sqE7sHx4hEVmne5bXfzu?=
 =?us-ascii?Q?w8WTH1o+h97X4xwxg5gN+3zNvZ6fCDk9e62lSTqH7yw4xS2aeJUy1WzyrNv3?=
 =?us-ascii?Q?Mn+EBET+EHG+AI2sD6ZbVT+Yau7KFploHkahNz9hRKzM0KdvsXOOGEKV9fbp?=
 =?us-ascii?Q?DeICsb7B9dhhQEVf5UpshpC4SjkYMOuPLWUjpnY+TSpeeW9xRZiugdhgzWkl?=
 =?us-ascii?Q?8jyKxB/Iq9aoK3Seco8wOCZoqum3+Nlqkq+S+Cn8RLf47jMxzQV2FU4p5oIh?=
 =?us-ascii?Q?DHvaG3ZOrhEFw7GkAe0ooxPlwnmhy7ukAbU3BLzeHG1aGMv2kb2t1PX/0tZS?=
 =?us-ascii?Q?zCX99+sSelzjiN5c3mxO976RcnIL8Se0hC62sYwMKqCT0iDDr8n1Qzjy7+xe?=
 =?us-ascii?Q?F5GFtsrucOet6Q9egGct8iDPBpP1sdB7aDocbjBXnxHZHrSYd90bJH2CgfP6?=
 =?us-ascii?Q?7h4uJuy3d0V7e52jHrh561OJJVjXCM38W0iwCiwtB50gJQzEmqQm4FCffpWH?=
 =?us-ascii?Q?VHN4zGPPxJ/sBznj6jF4JZBmku/i7xhZWMDW5DEItOhEufcMqRbNMQUw2aaD?=
 =?us-ascii?Q?w3agOhs7kkToHUjZ02in8lw/BO9z5xhSAFCzsLxNFOzbGjkHELICM0rJapyi?=
 =?us-ascii?Q?vJErH3IRrgqCi1pnehuadlIe/LWC0AUdQ5Xe07GyqdGtQ67hNvaeB32fW/3O?=
 =?us-ascii?Q?ESthxh7lNujt7YAUsHh/E8PEiyU1d7wAfUElmLFbUH2BvITJzhoqitO0H+6B?=
 =?us-ascii?Q?dkSyNEjDbyJ0c/BSEUDBjmnHn+sAjCgMqjM1BhRExwy2szQA9D+rczCEWwot?=
 =?us-ascii?Q?iI5OoLx6/yW2nVGndD2JZ13sgmz+Dr9ykwezVZzIS6CWr+JoXbVxhPx88hWH?=
 =?us-ascii?Q?fCAsz1AU8Rm5I3fanELylpouqFDuf0Nlq7CuKW68Z+OOdb67ixYsXWT+hsLc?=
 =?us-ascii?Q?aXoW+PD6krTSv4XVLErqUyDUaa/Cay19DpN+5CvjTddamlY7/bWPL2XDfH6a?=
 =?us-ascii?Q?04Vc25iv/xor0J0OKQZQ6gQVGoLQXAxe5TTOFWQAvDxgvftc5cDNNygKBtGb?=
 =?us-ascii?Q?GgUxsc31zJ78ie4WRXLvtpfxqgVHWQ5AylS1kbe3ZY3pnxUjbA9rWM1/tzfu?=
 =?us-ascii?Q?+zTy8bvROeu2qXq3WM3DX00tM1dKG5rEA6NzXXrWmeCAFVrktuFVtvDisu5E?=
 =?us-ascii?Q?7aLFGcNUhBUI/tMpDjXX19JV8684lmKlqDGXY2IkOdfWp5IFM7oP7LV6QViP?=
 =?us-ascii?Q?MMOQSkavMlw=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7951
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 5810ae9e-cde3-430e-d607-08ddca94330e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|14060799003|376014|1800799024|82310400026|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VxdMIKqfTPQfZ5EzU/PJXFLVcnRVQowCJmkxtK8jYDbd9Kl1U4rltnQzivOv?=
 =?us-ascii?Q?3RyNmYqmS16hUCr0paSkoCmilsoPxWaZoENQ9jehtDOcH+2oQky2BZK6sIvO?=
 =?us-ascii?Q?gMLn0rWBpfyHmSw4ih2vEmoCB6ijkhLZUk/ROqHfiAjPUL8bCy2hVit4uUfL?=
 =?us-ascii?Q?Ho0IcrTTprhit+ePeTnfhJRTrp7h2cbUSQOQLVCDVJcyABYgTwdvaUV/7vSA?=
 =?us-ascii?Q?G8wOEne1nPk0BQvrXVDAWuiWwwLYoJbYrO315elxSvj/Q5grnBN0/4bbXtgT?=
 =?us-ascii?Q?okjyc8S5A4rHPGb8uQ5u3JZiTZbT/FYDT+EKW+BWbRsCaq3zByyEmWBuTSZv?=
 =?us-ascii?Q?NINPMyXcenlyS+Z07mUfuCNHkWtWdPi7VCpgPhb61jNHd0Dv1cvFjMVM8stc?=
 =?us-ascii?Q?FvsHv4r+6036IpIILThN49PJ6/i0IC6n3ha2sO6J8ZnWs6SbvTjIPvNf+Yk9?=
 =?us-ascii?Q?F5uzcVdyTEJWCHxA9fKNVNjUeWVZglrysvEm2oJeoXE5SsE7VluNmeDebfZ+?=
 =?us-ascii?Q?M5BqeVTeRu7Q1mzXNJ71nNM+1o5hErYp6YX4t7NDhxFzrkLP25Dp5xd3I4A7?=
 =?us-ascii?Q?mnr2uGqtU9OpjTue7xGZ+QtdgvFEp9CjHUzozh7T+82JTcYhgK51z3GQGsd0?=
 =?us-ascii?Q?b0BIZbYwdWPdlL/s/TNgk0tX4SOWDfejKAC5lr8kcLd7ziRmXZt+E3BDzGXW?=
 =?us-ascii?Q?5YpyGuK9LKGuVXvhixEgXHasNvpwududT/C2QQNXLl/AWhoM+TkHZ2YuSYSR?=
 =?us-ascii?Q?cvME9VoAQnoVbhKvsgcuFxgsHC5OU6OWHxDOIyDeh9jut6EIElA4ew/74HRc?=
 =?us-ascii?Q?MDyeODqiz/+gYlLr0CbgVFwQTQpb11D3ILT4vI5YxYlgpxDALTnVZ3HmyaQ9?=
 =?us-ascii?Q?f9Y4yvi3W31sn7ANc0+UlXK93wesCLX9CuopCbRwfH1BzKnwOQYb7F8jD9Bw?=
 =?us-ascii?Q?nQ6zR65DFNpk26BeENIFMePLp4epzSQOYLZEs6E50+5R1snIU6zJlZtWWeE+?=
 =?us-ascii?Q?uLj4ngiK6Kg3An2A7bmV2hS4thbawpMA4oRcfRQKEejjxDrysXQXX/lIp47F?=
 =?us-ascii?Q?G+/85JEGGOQTGzYbNjzVlkZqfiV5J48/zTJovOPiC4w1T7D89H9xItQFffYR?=
 =?us-ascii?Q?7m5Zk/mtciCO8j71/7B1ea8keWduwwaG09imr6VKKd5e82PvH67l+AB/cLT3?=
 =?us-ascii?Q?QXw+8kHG0dj0lccxe7mNJOCVRUxTYd0ShmFYbY+7kYMMmUE+LEUbIZMEc0Gn?=
 =?us-ascii?Q?MibfIZr3R31Uc/BvSIPpYWeFPJ5cRO8E7PNyVwi7x61Avy7A49pnhQa0WXCT?=
 =?us-ascii?Q?797PTmzMJdhPDTuPcoMwQ1NjL9p16Ia9XGzQwuPvwA0zRLcZ3+YRkPcbC4aX?=
 =?us-ascii?Q?sBQ6SRiB8ui6B8xbMsJQsitYCGya0akBKk1UwFsSBZGNcL2p96P/KKj0DYdm?=
 =?us-ascii?Q?za7s5jXojsVguVsNw4Fx9isbQ8CuPFZhO/t1kpAGHgBjFkXlZNhrYl9i9aua?=
 =?us-ascii?Q?Ls8gsDYEtaQ5LGDaa33VTzi2KR/bWU90olEa?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(14060799003)(376014)(1800799024)(82310400026)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 09:27:14.4191 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cd739d8f-b9d1-4307-8e7a-08ddca94469d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF00028D0B.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB10337
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

This patch adds GPU model name and FW binary support for Mali-G710,
Mali-G510, and Mali-G310.

Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c | 2 ++
 drivers/gpu/drm/panthor/panthor_hw.c | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index 36f1034839c2..b7b454d16f12 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1402,3 +1402,5 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.10/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch10.12/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index f39010c0ca86..7f138974d43b 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -15,8 +15,14 @@ static char *get_gpu_model_name(struct panthor_device *ptdev)
 						GPU_PROD_MAJOR(gpu_id));
 
 	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 2):
+		return "Mali-G710";
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(10, 3):
+		return "Mali-G510";
+	case GPU_PROD_ID_MAKE(10, 4):
+		return "Mali-G310";
 	}
 
 	return "(Unknown Mali GPU)";
-- 
2.49.0

