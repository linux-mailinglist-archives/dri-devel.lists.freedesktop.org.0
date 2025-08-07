Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2EBB1DBA9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFFF10E882;
	Thu,  7 Aug 2025 16:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="a6dL9YJS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="a6dL9YJS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013058.outbound.protection.outlook.com [52.101.72.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1ED510E882
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:57 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xSxfEf24JeCQgEQYalI1gVKuY6VBSi9rZyQU2Z5+m6Te5riCVHu6Nsw2APwYbxdvTAx69gjolLt8lg7W2DUrCzeHUDYq9jfjyl+SfugpPyL3DLmUAExPsMa4h2h20vGbOr45G4YnL9L+6UurooElArKoUU8bSqZW7YNPbSdyB7OiuE3TvA12ETbPqefMAbuBhvA25xLs+mmBxo7svn5Sgr/3S9+3WN2+jfW29WngjeGscq2qLL9EvR7dwQjdC3YXTGIrx0xWlcqWTo8z62msY9iLvLCijxBuey4VgAYJRL2N+mKBQM5HdLOIhmTmUZlQOoa1lwBTtG1inTGDyOcgGw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=YgRJC9HXyRyLyolmh710Wer/C0nr5P9qSjbD7JD+calUjIemCPWdC5uKTub+jPMAisyt+oklkCss+K/U5sZyLIa7BjBnsPxZshj7LAg1GbCods1sYncMunTSR1kDfQkmavdbCtk6RNN7N2hnmC4WfZtDGjCgTaus1sz2I+ghJzWPI3ZaxHztm+hS6FvbRXgvXz2eQ+6ODriCDI9MNaNWsWcmq5d9xa5ExofwKc49LD9bSeLpfilv2RYgpNoi9BnjGpZU3ufNyXNh3F12tWSlFFjusCAN8h4lH5kmPx6z2P4Wnz8Afk5LfvQtHhmZo6oJB1PWxU+++O1eA3yTvXjX0A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=a6dL9YJS9LDGHZEpXFQK1n8y9f5MnXWgVya8U5XVTs2B2tCqqg2rj94LdIVz4k5NNYu6CELabjyd6sX8XEdofO+KOexFpirGSNfZkyYv37D4CoCHb7cs4lYbCCgkXYTYhPHpj98+/4OsAMWOVdQw0sMMuV7tmaiaZ0de5lmF+vY=
Received: from DUZPR01CA0007.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::11) by AS2PR08MB9103.eurprd08.prod.outlook.com
 (2603:10a6:20b:5ff::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.16; Thu, 7 Aug
 2025 16:27:53 +0000
Received: from DU2PEPF0001E9C1.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::8d) by DUZPR01CA0007.outlook.office365.com
 (2603:10a6:10:3c3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 16:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF0001E9C1.mail.protection.outlook.com (10.167.8.70) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.8 via
 Frontend Transport; Thu, 7 Aug 2025 16:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qUSA+/90bIEhQ0a7VMRU8SuFF1pX1yNmQnH9WU1iud7X/saT0Zacdv4gQn3zfkkIy+xhNMh1j671ohSQFQ5za70o3ffaW+kjACDz95W+KMoxXDbK1pXKJN9JojlfKJ22QOSPODAyTBpGrELdlknXpqAxfm5cwZa25Xv8S1+YSbONqDOi9tlQ5e5qIESpXtjYhEJR03R+wxjCLym8SQp/jq5hpVxwALG0GzakOIJDvSq7dHeSV+lgcWdnM/ugHSTXvHJA73jnKlhMqmRPdV76hM9JxcWxAEFHlWNvQzxv7k2TlZU1fVbuWmRR7uDDg0zZeXkOHIh6g7YDr7s3QRKqdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=EeOtLhvavhyrjm9TDis7pNBE0rIcWWOHeKndsntUJHiN5jFfmJzG1/hn7eoj1U5VIyqRtGO9It4E6T2+0T5aGlK1YxTw/3U9d2aCDgLioVi3+oVBgkg0pRa5PQdzK7Gnz6tRi1M+3VD6/YmxyljSYBJPiAtPJQAmdavkFy1Uo5vah5wNhbfsc+2fL3pDcg53YmngUmvHtZUd3ToPXaWvhDKNscbzpvgcCG4XqmgQ0cG2uYkhsB/9erWMawbkBbdGKkMXJRVjvWxr8dbbMLXnEIakBKQWrsPwji3tixmh8dfNuqvcJEICwDH5UWqGZjvzLa/1tvjp870l0OEEq8S5/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hiYRKa+MyPgW8ej7ffMLZsqHEvtEjQVumfPDwjCyGK8=;
 b=a6dL9YJS9LDGHZEpXFQK1n8y9f5MnXWgVya8U5XVTs2B2tCqqg2rj94LdIVz4k5NNYu6CELabjyd6sX8XEdofO+KOexFpirGSNfZkyYv37D4CoCHb7cs4lYbCCgkXYTYhPHpj98+/4OsAMWOVdQw0sMMuV7tmaiaZ0de5lmF+vY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:27:20 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:27:20 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v9 6/7] drm/panthor: Make MMU cache maintenance use
 FLUSH_CACHES command
Date: Thu,  7 Aug 2025 17:26:32 +0100
Message-ID: <20250807162633.3666310-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0137.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:193::16) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|DU2PEPF0001E9C1:EE_|AS2PR08MB9103:EE_
X-MS-Office365-Filtering-Correlation-Id: cfb2e50a-64e9-4f5e-7b85-08ddd5cf5b4a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?JXUVmYoYE6ec35ZFEc9WPPvjGeukLZ7jeXi4RFPFg6IQbpf4qrVjtJ3EWWHG?=
 =?us-ascii?Q?VdhZhueBDKa4hrJyV0Wjd/xG9DbCxjzHGMKGXxub8+7ucSxzZLfscg2ROSJK?=
 =?us-ascii?Q?9hclPpJYHaLErjF+pWGKIvbnmSJbDRyPOIxpybkJffMv/OGpLYG1GJQjPiVC?=
 =?us-ascii?Q?ru/BaqU4YGRkmjxJYtT1/Ae8nvMdDWDGcC48EfJsTZ34oRzgFcWnnrmYyNwR?=
 =?us-ascii?Q?IsqT412HJO/1WbqBMg7zg84RGmTGINnZsed+tplWvWj49ubv+LCY19pp0yZ3?=
 =?us-ascii?Q?2LF8XuVdjinIHCkcln9eBMRIBPqRrWpCnIe4x0TJ9ypMVcVHBhjZd+7V60/v?=
 =?us-ascii?Q?hCUdiTFYZ8dOXZfq7jBgST9FcDHP6kjPccOHjcw0qZ1bXK4GlMPsdzxQAGjw?=
 =?us-ascii?Q?aCn47xoAbTPZJmB27fu/2N8p7szm8hv3YreJDhj2MMq2uOB8KGvUTeTwV/Dy?=
 =?us-ascii?Q?GEoXno7bnqb/llBvzNppb+dD1vlCVnNyxLpVC969AuWWWErWGW5LJDknCdr/?=
 =?us-ascii?Q?QdQA/Urf2A9yz4unWumTdWp8I7l7acyPYiclJHtg+gHJtCV4ga8xdYt5ITp3?=
 =?us-ascii?Q?pYLvNHgMNVPPyHbyLqPHP3TzFtvVu0XCbbbKHdDlEuYnjpWRfyEJpFfydPQe?=
 =?us-ascii?Q?417e7NEDCZ1BDCd7VaIOAaieMB07MSkDJAuQi3eNZUk1EzR0/BjB7+SjyC4/?=
 =?us-ascii?Q?X2JJ8j0kAj0u+qNHOTnm9wfpkpT42CXyAxQxmswYu6JdiWWQPwrfI4o8vUDz?=
 =?us-ascii?Q?e6fqA8HfSXLVO1OF8msvARhZISo3xuXhAJ/nHwSPrzWSDSjnerp5zDBjEgnH?=
 =?us-ascii?Q?4MAZxhPrGZ0kSqhbEQ1jNA0NvIJ8T1tpE7d18zSSU1cZxOsNQzYoDnX7o04x?=
 =?us-ascii?Q?TWMlcYDrtlIuYUHYxldarK73tXUQrYYQS7eUD9cIdJKhY7lLRJ7rHje0DEjr?=
 =?us-ascii?Q?83V3NP5MUE+G1OvL/V3zjmrfG/t9XBixl8RagGxj6ziAcYhiIqelRO5TdmFA?=
 =?us-ascii?Q?0AYZkm5Igs4bxbeWqFdUC3xcBSjZIuJhFUicJ2rsy48pILld1KSqFeUXMOqA?=
 =?us-ascii?Q?fC+Y1V9QLAXxiEu3N3sxiELVH2LWDLplDPGymXd+pu3l5dGjlyh2juYUCpKt?=
 =?us-ascii?Q?+7S/MA00bCLDAHurw4jSPa6goZsLvk9513l3z9mF3Bpd602yvCZinuK0Ziw8?=
 =?us-ascii?Q?QLJxCEhFNbmOKMjONt//jmnHZLYlMRQtiDPCf2zazhYko72MDKPPhqMgMDrz?=
 =?us-ascii?Q?mQfgocW3Hv0HnLGLNnb/7ybjUml7AOB3ZLBK5wPjAnR3GJx8OAdI4x5NBKn5?=
 =?us-ascii?Q?1CVVUvsZ8OOGzaS8QRdUHoybAXabzB98ZsseN/0xw2bhAi+bz0cWBq+0U5r3?=
 =?us-ascii?Q?TuQUQ03G+OtxeNFTSzuPb0V+MpONZuR1OzGI8ijhX1fBuY/aAw=3D=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7a5ae2af-4a3f-4c21-f16a-08ddd5cf4815
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|14060799003|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ChaC16NJ9hGmPKtmrYp69M/UNvlv1PfcAnS8VCda77Z4O2PVrAOTyYkaF8U9?=
 =?us-ascii?Q?hfEMaM0v1Vldy2mWYNYvtcBK+ekRhhd8DsuTiCF4twcbwAq7VC6gLvE0SRPL?=
 =?us-ascii?Q?w+8yIU0SN/jTT1qySa0F79OxsoxUCoxEy6ER5Ul2UoWaAyChzPJea1fmcQw5?=
 =?us-ascii?Q?UqfFhaAa4Mve69o+lDy45WnlQC8qcN9dlrR2RNAFy84Ywxf6Tl3645ghQPUS?=
 =?us-ascii?Q?rNcJ5iIrscTAfXluaLMU5MhIfyuNjcWVGvX00An5WWnVsmtJgfzAYOjWmT1a?=
 =?us-ascii?Q?RyOyGtVgJev0My77isKHTMhFEtGRwIO23mr5/pjA7xx9KI/YNmf+qvyTmo16?=
 =?us-ascii?Q?AhPJeyZuLKR/qlDJlC3YEC8YVJiah+87N8eKwkPjSmNaxtOBRJfMvgBZJFHU?=
 =?us-ascii?Q?gJtnVX/iiLQvTbvPz/fj9LGP1DQRdFPtqO7TFgMF260vwNueJHIH6V14IjZC?=
 =?us-ascii?Q?U9+6gCtnrFsjp7mly7a+hVXf+Q1jagYao2cRBpHofVd+UIfKf+19BjyQRBid?=
 =?us-ascii?Q?T7nPNFPBr+S/eWU1Cc5fzsZYG3k2+AKshRKyKVRccsxhbAL6pM4oksi+XchA?=
 =?us-ascii?Q?mheLUjF1oqc0n+IsQwBjsIe4FxoHHdnE7pASZh754dPql34ueql5NbaKnSzo?=
 =?us-ascii?Q?6jeIKWZSI4LWemHGUyucCrALv43PRpD2y/t/haycTEe3gyGMP0zrRmlewFCV?=
 =?us-ascii?Q?nIJ9xvDQt49ihgRw3c0ilZC0RHXMp4dWkS/OcEKSwgUIYM5LTbEpc1WsbquB?=
 =?us-ascii?Q?ePYrI0CZwB5aygX3XLPmp2BiWs0UQgJc/Vgn+fsUUvobZyQzO+o3NqaWcSRG?=
 =?us-ascii?Q?kdhWvwfmMuN8++2cFqmUGeT+SCbgjO3US6yqwLKd+dJCPOs9ulbjw6CNvy4b?=
 =?us-ascii?Q?5rWbUbTEKpUIA7/BjwyhJbL1IejZ/f5cBo/dDhLWOf/K6m1uZU6zifT8GDml?=
 =?us-ascii?Q?1Oze7nC/bfrwpF2K0fBDyD4rr31cCDfDiqjHWHu3O7/BrbSuIiBFvYbvCtXG?=
 =?us-ascii?Q?vJzpyw+zFNeHxdh4nqSjjNHfJ3EUdSf7NZXF/Qr20tCciciyWT8aCeV1UMdM?=
 =?us-ascii?Q?AXIZmlKCnUQnQu0lgrEdj1d4Xwt9kL086foV0HzdZmbAxsTiZjLCLXL6flJ2?=
 =?us-ascii?Q?eD6GXiaywsV9lowG8992kpvbzoqx8Kk9vQ3chClNRcwR7fvYWPVUYi454wYU?=
 =?us-ascii?Q?lBc7yUDIe7u0hO6snZLRlPbvPEyghlrMKu4/53+SdSJgRpX4MjSUxQFqfBj2?=
 =?us-ascii?Q?yMikYJm+cWwAP26kcOIrslgaqwVmVppO+ky9R1W1A2K9KbgmCRifWisb0VWh?=
 =?us-ascii?Q?4qiKysA6B+YSkfymgROZGcJygvq9aFV4ASpmC9JtgVuHm5TFNgEr6LRs745P?=
 =?us-ascii?Q?vLsqCWrvDn57O3U4knLIK2eMUGYetcQLEYen21c/Veg3E0wTd6HsiSaDmDHm?=
 =?us-ascii?Q?k7ouyCtIzSqtWi0vbOP3KThBWM+z+4gfUqnTRs9uzhxVx38s6MIw5//cy1NA?=
 =?us-ascii?Q?hjXEaWQywL0X7P0neF5Ldkw+5UfLjm2Si+Ua?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(14060799003)(1800799024)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:52.2050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfb2e50a-64e9-4f5e-7b85-08ddd5cf5b4a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU2PEPF0001E9C1.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9103
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

As the FLUSH_MEM and FLUSH_PT MMU_AS commands are deprecated in GPUs
from Mali-Gx20 onwards, this patch adds support for performing cache
maintenance via the FLUSH_CACHES command in GPU_COMMAND in place of
FLUSH_MEM and FLUSH_PT commands.

Mali-Gx10 and Mali-Gx15 GPUs also has support for the FLUSH_CACHES
command and will also use this by default going forward.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 33 +++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 4140f697ba5a..367c89aca558 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -29,6 +29,7 @@
 
 #include "panthor_device.h"
 #include "panthor_gem.h"
+#include "panthor_gpu.h"
 #include "panthor_heap.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
@@ -568,6 +569,35 @@ static void lock_region(struct panthor_device *ptdev, u32 as_nr,
 	write_cmd(ptdev, as_nr, AS_COMMAND_LOCK);
 }
 
+static int mmu_hw_do_flush_on_gpu_ctrl(struct panthor_device *ptdev, int as_nr,
+				       u32 op)
+{
+	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
+	u32 lsc_flush_op = 0;
+	int ret;
+
+	if (op == AS_COMMAND_FLUSH_MEM)
+		lsc_flush_op = CACHE_CLEAN | CACHE_INV;
+
+	ret = wait_ready(ptdev, as_nr);
+	if (ret)
+		return ret;
+
+	ret = panthor_gpu_flush_caches(ptdev, l2_flush_op, lsc_flush_op, 0);
+	if (ret)
+		return ret;
+
+	/*
+	 * Explicitly unlock the region as the AS is not unlocked automatically
+	 * at the end of the GPU_CONTROL cache flush command, unlike
+	 * AS_COMMAND_FLUSH_MEM or AS_COMMAND_FLUSH_PT.
+	 */
+	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
+
+	/* Wait for the unlock command to complete */
+	return wait_ready(ptdev, as_nr);
+}
+
 static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 				      u64 iova, u64 size, u32 op)
 {
@@ -585,6 +615,9 @@ static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
 	if (op != AS_COMMAND_UNLOCK)
 		lock_region(ptdev, as_nr, iova, size);
 
+	if (op == AS_COMMAND_FLUSH_MEM || op == AS_COMMAND_FLUSH_PT)
+		return mmu_hw_do_flush_on_gpu_ctrl(ptdev, as_nr, op);
+
 	/* Run the MMU operation */
 	write_cmd(ptdev, as_nr, op);
 
-- 
2.49.0

