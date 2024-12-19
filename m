Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E1B9F8107
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 18:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD8410E217;
	Thu, 19 Dec 2024 17:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="GUppDtJE";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="GUppDtJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2088.outbound.protection.outlook.com [40.107.247.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D428689701
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 17:05:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=pjxRC07tLazSVy6zQcGB4Z1aqJEdIelCmfZ6p8dbfb8QlR+vBKPsg+nSenufHZCLY4+VkjZ/rU6Jlc+rDjV4DkxRGk1GqpQYmpHldlOW6qmwxfwBS6p0OSJXujCjMD2zQOGiYPGDeirCCbVY73sPxH4EeZR+u8KV5lnEhns19oq1EV7U1WwcGa/0k01d/vgW2qzI8BQ9OgcFHB1B3oVeuY3cz+43Y0Kh0guO3/a/Bvn8+lnzy9PAuuc43h9qPaE69bc80wKvGuD9MFAbtXBVnksNOJCV4cucwBnEz4UZFywjP1l8eLwFmh51FgwsSdnWaQKz7mKlUjYC+Oprv7b3jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KRb1kdRZkuAUgZIgOPaKqJu0T1jE1SayCCbcz6EoCA=;
 b=IBmpWzaCxMtZebJ5UmajZJzYBIDwKPKliZWRssTm1riE2hQ+DGUCZ72RpCWFWFZ3+TnwFme/cFiF0toxNPdK0+lLUB4hhz7ujRMA8qzwRagdKRdA5Wt6jpxSStBhQevdZnLd5U0R2P68n//Z9wEBZJj5YMhs2jvbEKy7j8NESUICaKXtt0qWVAU7A0emoSmytDo7dgF4MwHF3a1qErNct7gS94NDuwkv7KUguDMvEC44hlehsc10gF065l+jWb1FYjUE5SIH89ESlG3mxgjoH8mGIs237yHfZ/PDUM+BXp8HhpWmDsssDqriy4p27jsHHLYJiOYvb0+gSfkn2ASm8A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KRb1kdRZkuAUgZIgOPaKqJu0T1jE1SayCCbcz6EoCA=;
 b=GUppDtJECHLHtYUU6hfqFUBtLELBcvHYutLH54J9BsCGhb0x3zDxcFYlEOkYAIUOuLUQ/0ucs1eHeyrRyc64BpnVm/gO4aaftWWCgDAfCvUOM12elJAaLYnHMAyjA2q10v5rb94e2Zme1BEpjkieqx0LFQiGH3WzaV/V7s0JUTs=
Received: from AS9PR05CA0352.eurprd05.prod.outlook.com (2603:10a6:20b:490::29)
 by PR3PR08MB5577.eurprd08.prod.outlook.com (2603:10a6:102:81::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Thu, 19 Dec
 2024 17:05:53 +0000
Received: from AM3PEPF0000A794.eurprd04.prod.outlook.com
 (2603:10a6:20b:490:cafe::bd) by AS9PR05CA0352.outlook.office365.com
 (2603:10a6:20b:490::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.23 via Frontend Transport; Thu,
 19 Dec 2024 17:05:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A794.mail.protection.outlook.com (10.167.16.123) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.15
 via Frontend Transport; Thu, 19 Dec 2024 17:05:52 +0000
Received: ("Tessian outbound 7d3f896333d7:v528");
 Thu, 19 Dec 2024 17:05:52 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 514af59853b584b2
X-TessianGatewayMetadata: MbwjAM8DJobSbopDPnPIrAqnkKczhp16ddCAIKJgubwTkBCExn0h8zYmdFhTgCJeEoglJVxNeAW781VZjBRb/R+X7SQlRYiTAfxRKm+N7beOvl3Q6q1UI2CnKw4fbC20govZGKXPOrGfOycVi5Ir1oUu74G1+HLMwF9yXrhEGd8=
X-CR-MTA-TID: 64aa7808
Received: from L41680f1e6029.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6C7E72F8-6902-4E0D-882F-BEB8AB53B25F.1; 
 Thu, 19 Dec 2024 17:05:40 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 L41680f1e6029.2 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 19 Dec 2024 17:05:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ETlkuENbDfvp5lQuwENBM0AKe/GGY/iThCcmmFG9l5slXErLc397yuDapb0Cf8dA0jrXIoQUqtJrsmEuvdIckbnGoF3NIvROjwXpi+8OxvxOSClKUfPxBAW2zfOTlO2qnbQclJOJ4l7zuNmbkdJFDln4qJt6JNxQ/cTI4boXJGLUjRRrTl2+rv/L2ey9YiJZzhswRTa0dIH1LCSRvYsiW9VRS0Q9YqEPmx3qvu6qRAVPTCGSaPP4TP3sTtn0c7HwOcF0wQ1mLR8m0tSPFEU1F//xzAgkSQ+f68sZ0Vpn+KMUM7lUeGmPZTd++Il0cfs+F1fLytJdJSp0/9WIev0xWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1KRb1kdRZkuAUgZIgOPaKqJu0T1jE1SayCCbcz6EoCA=;
 b=m5/rwmOyW42haXBiMVzzF6UBKmsx0zrf1DPZoWjBgmbf6WuAe98+y+HWygmc+1kT8EAhQJPGeKUoX3lj4YjAQUA1ubwwCM9cMebQRhe09UTV2py6eHu14XmSweClgydsoms3nI9ul467Q49BK+cNpKHtFLyIZdD7cwcxBaHmNgMJvEC0aNnOkOcoFNe5p/Sxx4lwL3EihPh3Y7UFyj9jL2mR7ynsDsLz0+Lw4tvCU5jj+LmkK3tsAAuzHRIOQHvsCZgWWu8UPpn6XcvTuoY8eVmp4TNTMN5HET4EMeLYaWVTXASJiF5rKEPwpf5ESCynPs7kHj3EuFGou3+Cxc+Z4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1KRb1kdRZkuAUgZIgOPaKqJu0T1jE1SayCCbcz6EoCA=;
 b=GUppDtJECHLHtYUU6hfqFUBtLELBcvHYutLH54J9BsCGhb0x3zDxcFYlEOkYAIUOuLUQ/0ucs1eHeyrRyc64BpnVm/gO4aaftWWCgDAfCvUOM12elJAaLYnHMAyjA2q10v5rb94e2Zme1BEpjkieqx0LFQiGH3WzaV/V7s0JUTs=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by PA4PR08MB6238.eurprd08.prod.outlook.com
 (2603:10a6:102:e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Thu, 19 Dec
 2024 17:05:38 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8251.015; Thu, 19 Dec 2024
 17:05:37 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 4/4] drm/panthor: Use GPU_COMMAND.FLUSH_CACHES for cache
 maintenance
Date: Thu, 19 Dec 2024 17:05:21 +0000
Message-ID: <20241219170521.64879-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219170521.64879-1-karunika.choo@arm.com>
References: <20241219170521.64879-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0626.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::11) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|PA4PR08MB6238:EE_|AM3PEPF0000A794:EE_|PR3PR08MB5577:EE_
X-MS-Office365-Filtering-Correlation-Id: c02446a1-0861-437b-2be7-08dd204f6529
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?pXa8XREZhaUBFTBbvGHZmISTxCnlbBvbVAaAb+22b7M9wlpUxYYDi6X/f3DH?=
 =?us-ascii?Q?Qs84kgGgOvMG779VOLwyse+oYd8uusinJ5KSvHmE9k8Ll0Z62B9eBo5z5Bg7?=
 =?us-ascii?Q?p8AAfPjULJnZRS4SWZs8PO2TF+8ZYp42msKACB+W0sk51xAxE2gPNK0D/sLQ?=
 =?us-ascii?Q?Ktq4F95v1CiNm2H7DpaID0gM+0wY8QxNqvi2iYnHUeqOdmRG0QTT8AuUHJy0?=
 =?us-ascii?Q?Xe0nCGxBcqKzJ/q7TKQioVis6fM+lsSysdlA6Xyihaxeo7inO9LfWgNboG4w?=
 =?us-ascii?Q?vPBdnnMNiR4WgBrtY9a6m+9jPSpR9GG/iEtEKexm0SrlcVTj4rLE813B3M+K?=
 =?us-ascii?Q?YL0WuiCCSaKF2CrlWyBIszinRKij2FApZEB3eT85YeXVmh/ZPGWm6HB1CHuy?=
 =?us-ascii?Q?yL1UjYpoEpjrM+CyzI8/0cPKBSGztOdT3ia/xLGrvUySntbeseOAGY4HrVkd?=
 =?us-ascii?Q?YUN1pE0hfIBajtptYKPM4LLhN/bApHpSUA/0V4auSuWmq4iyab0sGgNlK/MZ?=
 =?us-ascii?Q?Dkr6QHqD5Waob0u1yBoQm6+PiaCfofKoZDb0r9imHvU3Egqm0PaZPqyv0aeh?=
 =?us-ascii?Q?/nfzE6dZuAMO5Lm3GJpagXSvVHGAxi/iGnDVlD1TQOfyY0mvAvdqahBODjXH?=
 =?us-ascii?Q?aXFGYVJWC66ZJHwiSKsWdEEZu56xoSJrstKk3IqjgoiIEHwaqggKCKXYVsV7?=
 =?us-ascii?Q?n1xye5Fgj1lcw5JSsi8WTOwtShvF6ayjS7vci61hnfA91MYOgrx9KORv+Mc9?=
 =?us-ascii?Q?4GOaUt3GK++rlTg1UGvVHBMHaBYRBeoE0PvaoqvowlnR9s65igmxvuJ6VkxD?=
 =?us-ascii?Q?UisY+kiyA+4QAwBmRQYdHN6MPXXUwYHCDzeJrMKunpSxIN2JRFN3lt4LZ2uX?=
 =?us-ascii?Q?/GrZ5lIU9FGID8GDV8demu7dTELdUSZBk00fDXdZPXaWbIz7R0Qh+DFqTtba?=
 =?us-ascii?Q?0EKlt/4g3epIhHd6KM8ssdYQeAq7bwu0MpuzwX7IWAP6yExjtP65xNyp1C1y?=
 =?us-ascii?Q?xRYj5qwvGFlXv9LYvDILo9Ig4vOgh1PtCGIKuUx9qDdEuty80jwQqlHjObwB?=
 =?us-ascii?Q?4eguEf6stX7QMse6ip5RPAN1Q/2DJ+mP4+qnw0c5bWtxIQHtO0NSUhfSClgQ?=
 =?us-ascii?Q?7dOTWYjszBQr2+aKOsklZf93cGG3NeiezNtuCiXQyiqP01pPj031BLLQam5m?=
 =?us-ascii?Q?rwfvsnQwQGru3mtFSMsHaUtqEnZIGiPuV1LHY5XJUNVrV1rTdbCbCckKJ77f?=
 =?us-ascii?Q?EBcQGcO5V30ik8uT9cgpqR4EVWlnciFn1S4zhUpGZ2RclqEkonRPpz4yySyR?=
 =?us-ascii?Q?i+gqWKeJv2h0Sg+ABX0HiMj4udS3cSzJoRzv+hBeBluxE+O9KuWeOSx8qQoY?=
 =?us-ascii?Q?ORQj6xLQxd14Z18FxM3RcOtMFi58?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6238
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 1871cf15-bb89-46c5-5f76-08dd204f5b1d
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ODFM9iTHBCv13rhJSvpic56MuTVvlxfepkuyrrlbJbbYKKoYidymOevOkySU?=
 =?us-ascii?Q?13hz+OW1z75jTSkWBFnvfCGM2TpYvoltpIrgCMbUt7bl5EUv+YA9DdJx+bV7?=
 =?us-ascii?Q?MeH4K46WynlkpoECQplbeEKMOr3a9/+UW6iXxFq7SnaOthFVbbJob3n6ESgd?=
 =?us-ascii?Q?NXOz/0maqohcWez/i5yx5sIHRX9UGsyqxKP6gv/NMp0Gx+tnYJPbIN36+hUs?=
 =?us-ascii?Q?X/BaqaXYhLvG9Vt1Bxwu//C5ZiVg2WYZxIdnewPZZGxGKHFgrWj4Zejm5j0q?=
 =?us-ascii?Q?r1J+nn9Kw81MVAACXmJuwWLgKLfAAnzmNIlMprOqkLWRBdd1lB3avmexH2ZN?=
 =?us-ascii?Q?o5O3qW3rfZTUqOpZJ0mDyyhUozRY9bAbQueE38OcWALDqnVSH02r73ug+KXG?=
 =?us-ascii?Q?dvvqKYcdHyVgqm1DbaR0F4aZcN8GMnmOQG0ed/bLDN46vLYbL0VBZXguhsLj?=
 =?us-ascii?Q?NMex9ko0rTbazYk4NqY9xvAOSkK7xRoKh8DMXtz85WPUF1xt8O/0CbHfP6yS?=
 =?us-ascii?Q?J9AVMDQFMBE86quAKj05QV6se1BwkTLWHHMj0M+DyWTrbKJ8K7kvZMffF7xQ?=
 =?us-ascii?Q?LKj2wB2231kBy7v6ohs6g/llNDaasIf+sydvy7RnnAIaAXwlM4vTKGiBuK/1?=
 =?us-ascii?Q?II/XWZqVUmY5D7s8nwLdDRjngNRxwh9gfTXmYswEnobl7njQzej4F2Y/PW6c?=
 =?us-ascii?Q?lPbopneDs7b0U1uHDVJW652ezv/hXGORj0BeF04cl7SHkvBhRf2jDC5C66VE?=
 =?us-ascii?Q?+QAHAljIHXzohqFG3jNz+GZO1XbwbWVkv4P7OxwDoNpIi+v0xPPhr+/4ahel?=
 =?us-ascii?Q?0jPcWAQz3u7TSS5GijcTP/6fr8w9rrG6cqXL8s2fyEfeOiGviMr3J9BA4LHX?=
 =?us-ascii?Q?XY/sgWB9d/BWmxUpce0NzKDIwXI3P8l9Iq1IllHyipHQYo+iOTP2dMt5FpWG?=
 =?us-ascii?Q?PznH5fe9yF74SKT3A2Yzj1ph9LXGYN4sU/0eaBnzNmuliewf47ypuW7ZyqfI?=
 =?us-ascii?Q?YzLNIBtks5yk7bAlyCVXBf8owfwIsP1iRr5iJ1gKDHu4zlc51+ghfzzphqBp?=
 =?us-ascii?Q?v8jPH31k3XEE1VOf5h5nXfs0k+6XCh0aXsipQCKUbih9yIV6uxsRmdPRGtdr?=
 =?us-ascii?Q?/bFVPLT1JzowNbSVp8fw/4/ldw9PQgCRcMGPWzwR6jKuFzAKsNl/inQ/VrAi?=
 =?us-ascii?Q?OdM6A07pjSo3KIR+TRVanyEJYgMQLQ928PnWsQIueNu/Sg2BxvcIv9+/Xd9P?=
 =?us-ascii?Q?rkASBdaYBWuDxfS/xtxH2whN+DKVw7doaH9UocpGuzfzfdzQKdunobDrPR6B?=
 =?us-ascii?Q?S+Z3XepUoRTNK8RTMabVZzwePjTLoa7/+iTQQNdC3KM3PewJvPXsMutL6H6b?=
 =?us-ascii?Q?rHebgd2SOXOjcuS42/HGjtqUltmuL+4TgwIcBZfm0C+KB9j0IWW4KWKVFvB6?=
 =?us-ascii?Q?pI4IXPt17zgSalSrOl81KRamZJndObUaWodcWB3kDTLmFDkcCDDbwHGWl9BC?=
 =?us-ascii?Q?fcqvrI9PJtq2MVk=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(35042699022)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 17:05:52.7399 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c02446a1-0861-437b-2be7-08dd204f6529
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM3PEPF0000A794.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5577
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

This patch adds support for performing cache maintenance operations via
the GPU_CONTROL.GPU_COMMAND register instead of using FLUSH_PT or
FLUSH_MEM commands from the AS_COMMAND register. This feature is enabled
when the HW feature bit (PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH) is
set.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gpu.c |  2 +-
 drivers/gpu/drm/panthor/panthor_hw.c  |  3 ++
 drivers/gpu/drm/panthor/panthor_hw.h  |  4 +++
 drivers/gpu/drm/panthor/panthor_mmu.c | 46 +++++++++++++++++++++++++--
 4 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 9dadcea67a39..30dcb50409dd 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -276,7 +276,7 @@ int panthor_gpu_flush_caches(struct panthor_device *ptdev,
 
 	if (!wait_event_timeout(ptdev->gpu->reqs_acked,
 				!(ptdev->gpu->pending_reqs & GPU_IRQ_CLEAN_CACHES_COMPLETED),
-				msecs_to_jiffies(100))) {
+				msecs_to_jiffies(1000))) {
 		spin_lock_irqsave(&ptdev->gpu->reqs_lock, flags);
 		if ((ptdev->gpu->pending_reqs &
 		     GPU_IRQ_CLEAN_CACHES_COMPLETED) != 0 &&
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 0fb3adc093bc..3738f7fd106e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -20,6 +20,9 @@ static struct panthor_hw panthor_hw_devices[] = {
 	[PANTHOR_ARCH_10_8] = {
 		.arch_id = GPU_ARCH_ID_MAKE(10, 8, 0),
 		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0, 0),
+		.features = {
+			BIT(PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH)
+		},
 		.map = {
 			.mmu_as_base = ARCH_10_8_MMU_AS_BASE,
 			.mmu_as_stride = ARCH_10_8_MMU_AS_STRIDE,
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 3409083d09d0..69fa8f51a8c9 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -13,6 +13,10 @@ struct panthor_device;
  * New feature flags will be added with support for newer GPU architectures.
  */
 enum panthor_hw_feature {
+	/** @PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH: Cache maintenance via GPU_CONTROL*/
+	PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH,
+
+	/** @PANTHOR_HW_FEATURES_END: Number of HW feature bits */
 	PANTHOR_HW_FEATURES_END
 };
 
diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 8a190dd2e06c..91c420538e02 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_hw.h"
 #include "panthor_mmu.h"
@@ -533,12 +534,19 @@ static int write_cmd(struct panthor_device *ptdev, u32 as_nr, u32 cmd)
 
 	/* write AS_COMMAND when MMU is ready to accept another command */
 	status = wait_ready(ptdev, as_nr);
-	if (!status)
-		gpu_write(ptdev, MMU_AS(ptdev, as_nr) + AS_COMMAND, cmd);
+	if (status)
+		return status;
+
+	gpu_write(ptdev, MMU_AS(ptdev, as_nr) + AS_COMMAND, cmd);
 
 	return status;
 }
 
+static int unlock_region(struct panthor_device *ptdev, u32 as_nr)
+{
+	return write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+}
+
 static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 			u64 region_start, u64 size)
 {
@@ -573,6 +581,36 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush, lsc_flush, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked
+	 * automatically at the end of the operation, unlike FLUSH_MEM
+	 * or FLUSH_PT.
+	 */
+	ret = unlock_region(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -590,6 +628,10 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (panthor_hw_supports(ptdev, PANTHOR_HW_FEATURE_GPU_CTRL_CACHE_FLUSH) &&
+	    (op == AS_COMMAND_FLUSH_PT || op == AS_COMMAND_FLUSH_MEM))
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.47.1

