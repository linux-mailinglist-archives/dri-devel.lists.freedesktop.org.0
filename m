Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03189C0807A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F9CC10E223;
	Fri, 24 Oct 2025 20:22:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OYKChEHS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OYKChEHS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013003.outbound.protection.outlook.com
 [52.101.83.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B080510E223
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:04 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=FgLtYC4tJMCaZUx7ru7zFji9xxt0l3uuNHdAQN2Mb4/eGdd0XXtoYZ0DUxcBgDfnIvWv1TcJUhp2sFGEx711R4vt3zIvEcgXc/nSnrC55lNYHSdKDaKd6NHxRhHRxDV1NGZ6Pxr1fTBmUzQ1QjahIGuj7sBy17K+nk2yZ0BUQi3RacMEip0gZBwrZsAXw38D5NomArA8RRzNw3qqy2k4vnCH+Cczx+jGllrUnEnoZoWTIjFWLCnjvt3PdD+zq5Ua4D4d3MNNF9UQkdb1TT9V1AN4nHGS18Hgc/8ZWvR94sscBIWToLThBcbf5BX5XF3YwJr15g8yFDvvQTft6u0xMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MTT3VDoML6T3znBPVug+cLsJ8+yCNtq9jB0RgebpV0=;
 b=y8wQFD/ndA2Hoiptrafao2nvvmODLSEKR9wDcflTbrTRWre56SBRD3C6XoZg4jN918l1rockHB7YcgGjLsz1C4NkXPg+aAUdQfb9Sk23kDdcoHBNSb8SBMFLxpQzqOYxOWoZbXvKKsmaKeLcPHL4Zi86NwPcQLQJ86NpTyMy9G8QbmpmrPNxLwwVZYHPkY0oHz+haRPLfg6iMUrAVcnS5T2rwhm+NdBQLdEnSMQmK5576Nsp3HALbTfNCpmwZT9Hg+lRA8NsDvFXN81QYBBgvz+HQiitg4ouCnGs4FVi5RhIe9Jw84JP2oXt+9V122uzX05TzWyItJcFgntedKyedQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MTT3VDoML6T3znBPVug+cLsJ8+yCNtq9jB0RgebpV0=;
 b=OYKChEHSjahzfc9vDPWHZ5EPwB2q5QcAp4tMULS4np+mhP9z26YYMDG0uOWQ9M5NZ5csxgemPlcayCXeAh2tERJvR0wSa82kWDvw/O3w9NL4RFX4yyfLAu9M3YWrSk4YCctHnnqvvCROwjL123NibA3n9sySnO4IEHGx7uulD74=
Received: from AM8P190CA0014.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::19)
 by GV2PR08MB8002.eurprd08.prod.outlook.com (2603:10a6:150:aa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:57 +0000
Received: from AMS0EPF00000195.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::c9) by AM8P190CA0014.outlook.office365.com
 (2603:10a6:20b:219::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF00000195.mail.protection.outlook.com (10.167.16.215) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:21:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LyOhTL7t2s1IltVpGIL5DY8i8RTgnZ6//7OxQOo+UvjF1XELypBeZwpj0uFZnCv7IfTiQzRljTLZUL0HEiSj27UgHrbi05u341O7u61gqkz4UslIvyBPAQ1MUQt424U5jfLqSWh/lqu4iHWh3HU5h1mjYdg+WQDXTF6pNH2LufvkLWHcr1RCBW9jWkHRVa8HYQ/WDehl7Q0Z+c1xsjuu8G951smk4U3tsHT0MkDJ3yF1ZjW0kmgoKOkPlKr6eo5c+bYrbHv4dr4jkphsMD7SbOWAIuiV1QxSH5Tr+vrsqU1IrNmd7nP1kat6sYGEPYIeMYb0bKiG2U58jw1+cANK1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0MTT3VDoML6T3znBPVug+cLsJ8+yCNtq9jB0RgebpV0=;
 b=B+YFYNFUcR1jf837WfIhB3AaeuMNMaEzk9VOJ3p0yH8SPuLsYVS0O7yPgebKaxIXa4SeywRzZUwEd2ggKooSzN4O3bxgv2Ekm8JAg/46pLh9cjAI/Ym0ThEGXZ5hTXwnUvtAUaEdXXQ6MVJwGfi+vUsBgjZ+b3eFzb8WwooVZKFwltDKd2e+HiLXJN7yjQlkHK739Oi9gTwlgfVFJMusCpWvrN8ctdWzxvhgbGT4eIoX2KZOxrrb4XtWdDWn8PT1KIM+Qa45DnzTafSK+v63LQV/KjQIGs9g2PUnlp3IbC3wBtKAnJNTj1aP86mw9s5jcjedwf9+EM8+XiwAS5yyiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0MTT3VDoML6T3znBPVug+cLsJ8+yCNtq9jB0RgebpV0=;
 b=OYKChEHSjahzfc9vDPWHZ5EPwB2q5QcAp4tMULS4np+mhP9z26YYMDG0uOWQ9M5NZ5csxgemPlcayCXeAh2tERJvR0wSa82kWDvw/O3w9NL4RFX4yyfLAu9M3YWrSk4YCctHnnqvvCROwjL123NibA3n9sySnO4IEHGx7uulD74=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8214.eurprd08.prod.outlook.com
 (2603:10a6:150:5d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:23 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:23 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] drm/panthor: Add support for Mali-G1 GPUs
Date: Fri, 24 Oct 2025 21:21:09 +0100
Message-ID: <20251024202117.3241292-1-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0687.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:37b::13) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8214:EE_|AMS0EPF00000195:EE_|GV2PR08MB8002:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d74c01-4f89-44d0-3243-08de133afa90
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?szOD1oB0n/P3UIVUliqm6aD9bRVD/jR+f/0Lmw/DHWmb1O9MacTedY+1u7ej?=
 =?us-ascii?Q?LiFf4Puj1NumbB5o1cUnMb33vAIqYKwRJMKVguWTK1Wcg3zH4vORCAwjGHSt?=
 =?us-ascii?Q?V3lxT/H7cWX72h5snwV5UgzyCexV1Q1JBifKMunGQHZq5LMTZPSwOBcq09Ft?=
 =?us-ascii?Q?VdnfG7MEbNpIOAQXeH9t7Qv/qDtIoQ3DFaFQbKQw5+DvW/0BvXI366zVHVTa?=
 =?us-ascii?Q?GuQ+ZbVO1MBgyVxgp8zq6nIuRE6+by1Lj3yUZBvtGSi6rh1GgRhGusvwAIyV?=
 =?us-ascii?Q?4vglv4JLroywRx0pXt5Wc4tkpRJAKWGDj8qRag8UQ7mn1gvpjd0ZRaCGCl9K?=
 =?us-ascii?Q?ViD8BvC8lDiLHhuLeb7HIJGA0heZFZUFvGan7z8iugeHLy6VzxlOPJkuymem?=
 =?us-ascii?Q?0iKrmXrjYXO1j8PMbedp7AYaZZTQNJPmcg9phElBR1Cnn09uTW+u4SeUzlgX?=
 =?us-ascii?Q?TRicMaFG/tozP2Af0X3oerRq+99qHMhBbE5boIP2+ijQHLC3t2aMiD0v/t5d?=
 =?us-ascii?Q?tYHcRaUl8wJihefHBTYBqUBwNIUpdvZn0TzR4d5OAn5gfFrOY/Chi/yT/uTI?=
 =?us-ascii?Q?1AD3hqJ8b7FNimD1aY2IkGmjFKXHmrnZfrBZH1G/5tTDZjBPKlK1zg5RAfQ2?=
 =?us-ascii?Q?ECg9le2DWmsNUySsy0Y5dsX2gZlNYx0QpDThiip27/6NJ84vcBK/j/fie82O?=
 =?us-ascii?Q?/SNci0NHto1NXpqRg65dJFHgKF7cdtmnHm4vhzVaJ+fokU1VJEoWTQmSA/0e?=
 =?us-ascii?Q?LmT1XpLtXo6TlUcFdxcVbaNnfBab9f/yqKt9BdKwwfTSRji3cYpCJCOqHKJ4?=
 =?us-ascii?Q?UrO20EIMtC6SCqoM0fzmtcxLOg6tjNbsg+06O3tevhTWSxTlyVgYuy6R1E9y?=
 =?us-ascii?Q?HVXqUrIrKpIhlBn6MYltWzVdWt69h5Pd/0DtPzippBaPNNOcnRtxmibRnBnZ?=
 =?us-ascii?Q?08B5KphylFTXQoYbKsRIbsxEdaVvdY8kk+54bcJ8bKkuyWdGpLcq0XZKsG9H?=
 =?us-ascii?Q?+4tHKSObXQKsNC2ELWDbBBMzLXC5BpiLYwkEjXx6E0daedzOmVd++q/Qle1G?=
 =?us-ascii?Q?eIyg+RBAYBA3TcaPAafAedHyn+k0B7r0Fjcz3E03hj6WydTygwFIdoOFWUu6?=
 =?us-ascii?Q?Rwq0kiV/1E7k7Fdn1GInwT3wUp4pMmfQv1waEtSvFiWl6f/QI8cfew8ICQoV?=
 =?us-ascii?Q?5/6mI5E+oWRQjUGq3xohbEL92NyhyFrKJ0uD5f458TX7IVkUXrbQhY1vZkre?=
 =?us-ascii?Q?JWops+/lhjvcw1Re3UfAJg2rRCCpDXq/zmQ8alZMp12cqOvGwMXlEo4MZBV9?=
 =?us-ascii?Q?cogzZIe7N2jOBJuEUuNDxTax+J3W7YSadpXlXyZhMCVb+poCqi9fwAOhCGWz?=
 =?us-ascii?Q?7W5ZMuzpqsKju2zgUgqVk0Ps1ZzdasBsPZdJfk4MPUUK1Scz3btNT5OO+jaZ?=
 =?us-ascii?Q?LTEwqhv167JJF0yx8o13RSg6vCzrA10jkLaVWvvd9upW4bunVo1nMg=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8214
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3f14a3b1-3da6-4d39-9f66-08de133ae66a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|36860700013|35042699022|376014|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hpT7JW0MwqGIOjYvbq0KSFtZQpXYqdz1Mu0U0XuywcqNW6a3Pt5jdHFR0jBf?=
 =?us-ascii?Q?dO+PUj3QhrlUl0drqPfroWp1hl713l0VhBjisNkvKrZRSiuu8ztbrzzbHqNp?=
 =?us-ascii?Q?Wn3LuY0zi31zAItclkuz8vOXxq8trA43qG2AjWC8fxkS9zdV0MxdgSvcJSZ6?=
 =?us-ascii?Q?1uUCQpiY/OLl61zl7no5fxb0Wh4+BzmWPoX5tMgujR0McrnJdo2AGorOJUjg?=
 =?us-ascii?Q?jt9nE9lOCofYd+WrQnuV0frXaDdhZqoL7EazHNG/Hq06V0XxK70aN6flk2pO?=
 =?us-ascii?Q?dEcUC9qKJclVNTNdpzlotItRfebB6X8vup+J9t3+RDmNN5Z3DPDxip0LM2eG?=
 =?us-ascii?Q?XhK06sduqwye4YQ3/6L7why/ExZJmpNkzIPDZ1O7jjCjvwksSAgoAeQWj+mo?=
 =?us-ascii?Q?uDVgiq96bolDuahUugbuwSNqly2cFxXF1pElymBA9D47hIXb+IlUbq8lC/b0?=
 =?us-ascii?Q?xQFQwHCs+vJQAueeD5d+NXUcoL5HbzF9sYROD1sbr86J90Qs/9O9R5iRNAOd?=
 =?us-ascii?Q?+nNQXp69V8rOM8TDtfecI5WojPh2leVBhFkv7uGMDvzSRxcZA21d0kyjbNLm?=
 =?us-ascii?Q?AwGAv0yrk4dl2hY6Wop4GImDpzZwW1UFMyxZ60Zxlbw6XsfOiQIyjz1Juoyd?=
 =?us-ascii?Q?YJXhzUhyMTe6rnt+EWOut9JboUAElERmWtb8HV+mQhhd2JRNMzKS/tEE0mH0?=
 =?us-ascii?Q?NFK24w6eX9tsvT/Ra3gTR8nheb9tR5w9C4PvQvEi30OOM8uzHREpbHP2WigA?=
 =?us-ascii?Q?DOalIdkiuJIPRr67usyPSrykKoJr6ZFvU2u4KT/uL8D7uC/yNzmf34tx/wqI?=
 =?us-ascii?Q?6cT0OMr70ouMbuMuxL8lYgcZ5aaFZqwk8uVUinedey19to7KsP1y5kQcG+Ps?=
 =?us-ascii?Q?lARnc84JKF8SmmfxeNag8v/zUnE9VyejNkNJcUw43a+QMiXeIU/ad6D42S9g?=
 =?us-ascii?Q?6RJkD/EwuXUwr63dM7zVKn8brgUguijXkEl7/9W7f1CL5ZEGWaKSlhd5gMno?=
 =?us-ascii?Q?zijuqnoCRqWno1Ry2Hqd1A4vwU1FDfZZKiOWFy0fc+p5Ak1BIoqHuExT88O2?=
 =?us-ascii?Q?vr6E1a37mn2nK6UiQr8kqFWyJzBlaUvJwrQbptKYTA4asq/z/+VczjvLm/uF?=
 =?us-ascii?Q?HlSgWBig84x93FpUmjpBrnezyGnsJ2qg0tdxmI2MArloOk4wXcUSMAgVo0nh?=
 =?us-ascii?Q?u7PiAw798MPZ+BY5uNxn6MFcVTt12tEHTTGNR9cKv1XWmkcKYP1eNBdrTh5G?=
 =?us-ascii?Q?8d65hPWDtU8CvbEzCIntksHxYiFUXCnyuWTY0SxJNhLne1JYOjTZ6R9mkAqF?=
 =?us-ascii?Q?6q4conT9G2E3rrbeCQhYCf+Kux/sufdl6lQjvGDaMCtSlR8FCx2aJpfpCYuX?=
 =?us-ascii?Q?bCRI/3rgZ87Ly/l5rGqq3+/95Oma2Q5r39fjd8Sks0NdNw2NilVFB9ioYlTG?=
 =?us-ascii?Q?91Awpmt6bFAu59WQIkwEeUx4MIUnsTXMVblMaEBm+5VTwapE6RSXBuGAGYmt?=
 =?us-ascii?Q?9CgHtSqEUfNbBH6AYZXrYqb27yA0Ms+QALsgJqNiqRw09ebLmwkdrPJ6W8AG?=
 =?us-ascii?Q?pk0vWqg5ZSL/IY6RqtM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(36860700013)(35042699022)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:21:56.5047 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d74c01-4f89-44d0-3243-08de133afa90
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AMS0EPF00000195.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB8002
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

This patch series extends the Panthor driver with basic support for
Mali-G1 GPUs.

The v14 architecture introduces several hardware and register-level
changes compared to prior GPUs. This series adds the necessary
architecture-specific support infrastructure, power control and reset
handling for Mali-G1 GPUs.

Patch Breakdown:
[Patch 1-2]:  Refactor panthor_hw to introduce architecture-specific
              hooks and abstractions to support the v14 architecture.
              These patches introduce architecture-specific HW binding
              for function pointers.
[Patch 3-5]:  Adds basic L2 power on/off and soft reset support for the
              PWR_CONTROL block introduced in v14.
[Patch 6]:    Update MCU halt and warm boot operations to reflect the
              GLB_REQ.STATE changes in v14. This ensures that the MCU is
              properly halted and the correct operations are performed
              on warm boot depending on the FW version.
[Patch 7]:    Align endpoint_req with changes introduced in v14, where
              the register is widened to 64-bit and shifed down by
              4-bytes. This patch adds the necessary infrastructure to
              discern the correct endpoint_req register to use.
[Patch 8]:    Enables Mali-G1 support on Panthor by adding HW bindings
              for v14 architecture, product names and path to FW binary.

v2:
 * Merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (formerly PATCH 01/10 and PATCH 02/10).
 * Dropped panthor_hw feature bitmap patch in favor of functions that
   performs the relevant architecture version checks.
 * Fixed kernel test bot warnings.
 * Replaced function pointer accessor MACROs with static inline
   functions.
 * Refined power control logic, removed unnecessary checks and redundant
   stubs.
 * Replaced explicit CSG_IFACE_VERSION checks with functions describing
   the feature being checked for.
 * General readability improvements, more consistent error handling,
   behaviour clarifications, and formatting fixes.
 * Link to v1: https://lore.kernel.org/all/20251014094337.1009601-1-karunika.choo@arm.com/

Karunika Choo (8):
  drm/panthor: Add arch-specific panthor_hw binding
  drm/panthor: Add architecture-specific function operations
  drm/panthor: Introduce panthor_pwr API and power control framework
  drm/panthor: Implement L2 power on/off via PWR_CONTROL
  drm/panthor: Implement soft reset via PWR_CONTROL
  drm/panthor: Support GLB_REQ.STATE field for Mali-G1 GPUs
  drm/panthor: Support 64-bit endpoint_req register for Mali-G1
  drm/panthor: Add support for Mali-G1 GPUs

 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |  19 +-
 drivers/gpu/drm/panthor/panthor_device.h |  24 +
 drivers/gpu/drm/panthor/panthor_fw.c     | 130 +++++-
 drivers/gpu/drm/panthor/panthor_fw.h     |  32 +-
 drivers/gpu/drm/panthor/panthor_gpu.c    |  11 +-
 drivers/gpu/drm/panthor/panthor_gpu.h    |   1 +
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 ++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  26 ++
 drivers/gpu/drm/panthor/panthor_pwr.c    | 548 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h    |  23 +
 drivers/gpu/drm/panthor/panthor_regs.h   |  79 ++++
 drivers/gpu/drm/panthor/panthor_sched.c  |  21 +-
 13 files changed, 987 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_pwr.h

--
2.49.0

