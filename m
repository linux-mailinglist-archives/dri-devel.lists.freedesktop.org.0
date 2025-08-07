Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE8B1DBA3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 18:27:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C10310E0B9;
	Thu,  7 Aug 2025 16:27:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="qUHUelaM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qUHUelaM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010055.outbound.protection.outlook.com [52.101.69.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAD010E0FA
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 16:27:36 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=xboalKXIhLR8xRGzj6MiWO3BIq5/lySk+KrD+MUk4GaxVLTN57gZ4+TeHAAdxrK7Bf0MEhIZr/DXAyO2/7KtxhEf8Nf12agQi3AiuBdB/ScNIetVkjlzEwhbJwhF1V/RWbSsTJ6Ffi8p+4IPNvkYcBfAv+iFkOTOTbkbJFl79c+Mc2SvPTv6ksqKZDcQZuO76of/VoUSQsd9Nohcyx8CqN2+/S4t0r4jOshRUp0bi4rvC/3DW7+n+4v7++6UQ3wUClIMNdqmGeG/VjtVlgSqPSgKziEFgn5aEUz4e4LyOe3otwkuNbMF1NSikNGk9BHHKw49WjSh7P8N3Q1FfOjx2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=NmbirHDARtFSDCJTth1aP5D7Ir+A0wHf7M4K8nMFv46yozYyjHTGKfp+SLDRJvw+/Y0qAC8ZShPExAuYWxPPZLzf1BdvGw17cX6Li5tvh5lTNPg5DR5OruEdTeyytCEKczy1VFpGAFZQRryLEIKwfInzo8kc5pJ/p0XLtQXz6jPoA8kKiZR7HJdqAlHxbDXgHfVuohdxd4kwzcgjHv9+P6LpR9oB3Pdewc39Prnhxdfe3kfO9jI/fiftts3OcS6hcZf+HDf/fmXt+pPOCbcgs9X2rJrYPxEzN0EylQ+kl9sE11dp/UMaWcdXi3CHOgcFHsyAR88u6odm/wR4Z4ogBQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=qUHUelaMvopOaWMht/k0Yy29ZCfFCyAA2tnDgLKMGcVbSYDoVzhCWuFRJmoV8TEC4C9hHtqH9DhGcFyCl6uE6+lzlphUmaGyaMxO/CLWMRxRRoZkEs7afUq0DiQM2L7S1iDoxs247FHVTEcDi2suphjKY0zv5JgyfAJkbc7mmdE=
Received: from AM8P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::21)
 by AS8PR08MB6056.eurprd08.prod.outlook.com (2603:10a6:20b:299::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 16:27:31 +0000
Received: from AM4PEPF00025F9A.EURPRD83.prod.outlook.com
 (2603:10a6:20b:21a:cafe::7a) by AM8P191CA0016.outlook.office365.com
 (2603:10a6:20b:21a::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.16 via Frontend Transport; Thu,
 7 Aug 2025 16:27:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9A.mail.protection.outlook.com (10.167.16.9) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.0 via
 Frontend Transport; Thu, 7 Aug 2025 16:27:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzWiUGOWInhV6KkchLrXTrLOXfvXqH0yrBN8aid8k+ZZl1l1IKQfU8UXTUyIh4l/MKbiYHGN73kHzvFolRQBx+9P45VmjufNQNrMueTOolIyIrZno21MXulUuBw0xTljc+mDMgnP6xO/0zL3sVAyigxQe6gHqUfjNf7Lr9EGH3i2PS8UDcN2WhSn1EA6oKWIqvcGFXSzTdbcCxavi+s1Yr5eCfF8vuarh7B5IM/5VXuoCtrRYEEaW6ELrcrJJUyttsz6B4nhjZPttWtuEesniZdWEloft2Tr3wUBcwtZIlOt6BYsKTFut/8degyQfClPk1G1YNzSQmEOTxt0Hd2hLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=aKUJOQCKAjcbO3+jDiE9v28nGrciEJiqmRtjnzSUU58J9UQN4tMeKGJ8UpDWsYZcEeguXBzycvQlYvdCU3c54MAvUV7C4aHNpwOzRzi71vz5FcF8uxYSxwfeg6n6e9gX+3WWuOpgUfAysZmARatHI7k23r/nlDmaTzZNIrIaEr2FJvrD7mT1Q6fve3JJWcovQkdVqBcfo/RPMLS7AChX+aqyIegxwHybDKVJ4tfgzoQCB7GP+pxPuwEKJMXxGSScH4vF6qzyBbWn6neHCkEc/IUlnreSt6iR+eLDmCAhDV6M66KIl69A44FhQixwmzDbxcA+hzaPJdoO4w3Bud4+ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h+G6jj668AdE7CkGyJ1kq5ZjJKQBUGx1RaErErL/EeE=;
 b=qUHUelaMvopOaWMht/k0Yy29ZCfFCyAA2tnDgLKMGcVbSYDoVzhCWuFRJmoV8TEC4C9hHtqH9DhGcFyCl6uE6+lzlphUmaGyaMxO/CLWMRxRRoZkEs7afUq0DiQM2L7S1iDoxs247FHVTEcDi2suphjKY0zv5JgyfAJkbc7mmdE=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB9443.eurprd08.prod.outlook.com
 (2603:10a6:10:45b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Thu, 7 Aug
 2025 16:26:59 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.9009.016; Thu, 7 Aug 2025
 16:26:59 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v9 1/7] drm/panthor: Add panthor_hw and move gpu_info
 initialization into it
Date: Thu,  7 Aug 2025 17:26:27 +0100
Message-ID: <20250807162633.3666310-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807162633.3666310-1-karunika.choo@arm.com>
References: <20250807162633.3666310-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0623.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB9443:EE_|AM4PEPF00025F9A:EE_|AS8PR08MB6056:EE_
X-MS-Office365-Filtering-Correlation-Id: e7018b97-c139-4add-beb0-08ddd5cf4e9a
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?4CZ9us7cNC65NZsYh+TLOvC97lUszLKlmmkNr8ny2ppHGV/68IXTK+fMu1KZ?=
 =?us-ascii?Q?OBMl4kR4KpuVnv+ne05nUmfB11KlJLlghLIyMwSqMSghID0hMXuq6M0l2AzG?=
 =?us-ascii?Q?RsBJWfgaeaCeyerMnyuUO3ha0Ox43gaZJM6i8q6Gfxav+50tP8FFNHrlXTE6?=
 =?us-ascii?Q?c0h9DMmPgze9P+NOrf8rVI/DDPH3XVX09WV9eFleZGw8qW8BchGlzVAyjbr2?=
 =?us-ascii?Q?P4clcBbK1uoRqvbks4RsjwPzvmyu4dRHTsXg1qIAv5OTZeSeFYF+V1x4lIWv?=
 =?us-ascii?Q?5+oiG4oAInIre6aC/XYA/NRHBnOD36r7vbBfRMcNBLAh5gDyyZkjR9rhvSfG?=
 =?us-ascii?Q?LTRIx5dyHu6gkahnyMOQM8oGgzVhQBJtGy6r6RdJhIuOGgwbcOPrJxWxc6s5?=
 =?us-ascii?Q?IZhT+TAks4kixZ0gUuLgfzsRcGDcAwAjPRieJHcSCVwU1w1DfT9FP+3aMJzo?=
 =?us-ascii?Q?NVv3CWWx90c5U8shUVhD4ddpHg6wKoBmaXWX4wQeRFo77xxKRfsTEdvI0CRo?=
 =?us-ascii?Q?r+vQ4WJnGPu1POXuZdyjJR04S/+huSmbiJqESl46rWd/+XIMH0kSNTT/i/Nx?=
 =?us-ascii?Q?S88QTJUDXW6HhJR0E6gw/ZRLXR9uT3W4nrn/D6esKfeD8vhT+vIGZgNTctwX?=
 =?us-ascii?Q?WLas74uD/ogwvlNl2XsQJJmvhuRTJjkn/ht0a2BQtP33lrRrQ6ibXDgLb+mu?=
 =?us-ascii?Q?WYVoqK2qcxA3TKy3iVHYpF6b+KlpspI/VZQWcFUKqkU1Q6vkIr8jOHJqaYVy?=
 =?us-ascii?Q?hjCq142SX7l8jQvrvQt6WUorckbcnFdtAsWpgSLOFi1jZo3zEOQPKQI7s5zX?=
 =?us-ascii?Q?2+a9suZavSnStGHibdCQm6A8vt9QmENx6TfvC/w8c8zEVofd3HVf0oxqz0KI?=
 =?us-ascii?Q?JIYS7JPTpkhmbN4V/PKrjv/VNiAoW3re7f7hmURhPJJo/PNCLmTgTCfwAM0e?=
 =?us-ascii?Q?KLdPcZ1RTL073IPJHyh2c8LhHi7N4lwNF3If/VDBF/i51pRPS2ElI4KQy+zc?=
 =?us-ascii?Q?56MrUSep0WsKJb3SB0L2r9wdaOtT3JNRVJRkhzTFv2K+A4p3VQK03wYpSMwc?=
 =?us-ascii?Q?QrzRqqrZUiRDMDSmDSlkpSSbt64jyGSaJ/KVxEWXqvB4MbAu9JPCVbbC8m94?=
 =?us-ascii?Q?bpg31KcyEmBV0Ai3q119Ssm9AQZRYaalHHcCgrKN100lJ5OIsPycC17QbNfD?=
 =?us-ascii?Q?UmoAQ/oHTt468uS6x3AqhIuivZsIIjauYkSnJE+8sBKj55H403GJaFStbRGr?=
 =?us-ascii?Q?f6nqy8r7NcyaBJqPStB7B50yl46meQaA5DJEgfj7RSd8JUukBXK6uGtfaC/C?=
 =?us-ascii?Q?1urJxgD8k4W/m1hTDK0CqIeeEik3BynuEDzZ/YwUnz0Yn456Z3X1e3fbcQeJ?=
 =?us-ascii?Q?FtSGKh0Ljyfd9EhK97T3UqzL4cAhpKZxuq6wjpgxb4KCBQTAwg4S0ejNC56c?=
 =?us-ascii?Q?DIlBm8bMNmc=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB9443
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: d182ba21-5766-4932-4aa8-08ddd5cf3b62
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|1800799024|35042699022|36860700013|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1/wWBMLAqn8Zkvk0c5KAABPDLtdLY630+BA4D+KmLKALqkblnTMzP3yBjlM+?=
 =?us-ascii?Q?J+38NGt0G3ebItiq3g2p1DuDHt6UdMr50+jRLAdYycmLsRn8TdDRB5IFMS3r?=
 =?us-ascii?Q?1zzpY2T+xtppcxLpuvJvcylCy1STu7N2V7Ck2o0mZOdu15JuZzoDCIpHZBkp?=
 =?us-ascii?Q?8GVwfa9KP0YPvZx+6zw633yt6onqK/e245F1iryLYbW4Ux2nFDhzKznkMnhz?=
 =?us-ascii?Q?rFuX6vvjdH7SO4nFV126U+FXFXzr6ew6GBLnGcQpbUbWkzeK0RzTeDG7nN0U?=
 =?us-ascii?Q?NotR5Hck4dGSyN+AUAUcwsinW0LicWvtZfsUBkR+YEL1Y3DnrCZcnbBHLKug?=
 =?us-ascii?Q?uSM+xp+2s/82rtC+tMN63wX7nvDoajsDVTty8UnPT0wpxYryp2i8+OiQ78Z6?=
 =?us-ascii?Q?rpsU93yLAy4eLMcdmJbVJSa7oZB41k1cerwAiYP4UVac4ZDF9Fq4os+5qodH?=
 =?us-ascii?Q?BvCPMBKMQmK779ki3wZUtTl4Gnx7QkKwq+B34AzddNF19p1ClX8kQqe40ZY+?=
 =?us-ascii?Q?YIpi4usQPcMTBlD7StZSlUtxMSw2fu3CldBiAI9yzUEEM72LBzJ6ahmdgEu8?=
 =?us-ascii?Q?SJgyV064IIYYFl3dVCAAIqQwPbOEDzXFpMYC034CZ6IgDQk0s7Hq4GTDp7bV?=
 =?us-ascii?Q?4MlPpRyR17KonL9bm81bgU0q0ugkeyQRGsB9PfDiMTkKKvmVGbtfHtieFo2v?=
 =?us-ascii?Q?Tm9htgFpQxSPTck25yQs9SXyfIF+CnFWWB359gOk1lm0cpI4O3AMCo/YBNsW?=
 =?us-ascii?Q?bhZl3HLuZgU9yPFf35iD89fgoqd5rzbQ8XGzinpWEwTfCZStVUHpnUHoPwYX?=
 =?us-ascii?Q?dxgBljuI5kMR8u77l0iEeGiUrx1JiC9ZaRZSAi4aIXb+qRmTrEoxwz5sKLuv?=
 =?us-ascii?Q?KoAPqDAIU5ZIXLw5ThrPOHpWcm4foLnk538aQnOtt2qzPHJyWGQURgdlGKXG?=
 =?us-ascii?Q?ki7l8uPLtikf4O/6t8zS/QdiV7pmg485Iu3QszgePJHv4jd8zV2rBs50KYde?=
 =?us-ascii?Q?iu0RwStFaA0XZ9ITuf7GYIfCnfBmpXd5RX/p8+tirkttw+B286oJY8VbC1rs?=
 =?us-ascii?Q?ccW0AIWkQCUP6hdDHYOP/SQ8pyNODIoRyj2t0XtIBrkLyveMgpQIyUT4+K7d?=
 =?us-ascii?Q?etRjRlwr7a/PQqVh6xFbQSKf61qpTfd5v8Ct2+qFZV7nMJZqH52N8zC5Spum?=
 =?us-ascii?Q?i/hA+iR7KCKx4bPAhbRkUWXB7gkAC4X9BsssWcWwtzZ3qPwpWJAznmeh/d9u?=
 =?us-ascii?Q?1YE29fEh9q0o1Hdx4wfg2PJelJ2Gfn5JgBG/7AsR7awlfhDYRNDQzpj+OhNS?=
 =?us-ascii?Q?tPRrXPNcT1fpyYsY/7IGokQsEhvvKF0cK9v0bL1BWiTQcTXAx1LbQs14k+FM?=
 =?us-ascii?Q?dOceXmmjxINP3SjhGijxt8koB0LHo+N3MRhMNhf86akshXDTH8eV5rNO1jBn?=
 =?us-ascii?Q?LMlFmb515aLp9KmnIn9XtErY0o7ykPl65cWCv9kHUp9LVMLzf00gotbYAgtt?=
 =?us-ascii?Q?qki6ZHv4V5gS2GA2iDKNxe6Xljpp+XvQsDtt?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(1800799024)(35042699022)(36860700013)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 16:27:30.9211 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7018b97-c139-4add-beb0-08ddd5cf4e9a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9A.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
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

This patch introduces panthor_hw and moves the initialization of the
gpu_info struct into panthor_hw.c in preparation of handling future GPU
register and naming changes.

Future GPU support can be added by extending panthor_gpu_info_init()
with the necessary register reads behind GPU architecture version guards
if the change is minor. For more complex changes, the function can be
forked and the appropriate function will need to be called based on the
GPU architecture version.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/Makefile         |   1 +
 drivers/gpu/drm/panthor/panthor_device.c |   5 +
 drivers/gpu/drm/panthor/panthor_gpu.c    |  95 -------------------
 drivers/gpu/drm/panthor/panthor_hw.c     | 113 +++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_hw.h     |  11 +++
 5 files changed, 130 insertions(+), 95 deletions(-)
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.c
 create mode 100644 drivers/gpu/drm/panthor/panthor_hw.h

diff --git a/drivers/gpu/drm/panthor/Makefile b/drivers/gpu/drm/panthor/Makefile
index 15294719b09c..02db21748c12 100644
--- a/drivers/gpu/drm/panthor/Makefile
+++ b/drivers/gpu/drm/panthor/Makefile
@@ -8,6 +8,7 @@ panthor-y := \
 	panthor_gem.o \
 	panthor_gpu.o \
 	panthor_heap.o \
+	panthor_hw.o \
 	panthor_mmu.o \
 	panthor_sched.o
 
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index f0b2da5b2b96..81df49880bd8 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -18,6 +18,7 @@
 #include "panthor_device.h"
 #include "panthor_fw.h"
 #include "panthor_gpu.h"
+#include "panthor_hw.h"
 #include "panthor_mmu.h"
 #include "panthor_regs.h"
 #include "panthor_sched.h"
@@ -244,6 +245,10 @@ int panthor_device_init(struct panthor_device *ptdev)
 			return ret;
 	}
 
+	ret = panthor_hw_init(ptdev);
+	if (ret)
+		goto err_rpm_put;
+
 	ret = panthor_gpu_init(ptdev);
 	if (ret)
 		goto err_rpm_put;
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index cb7a335e07d7..5e2c3173ae27 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -37,40 +37,6 @@ struct panthor_gpu {
 	wait_queue_head_t reqs_acked;
 };
 
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
 #define GPU_INTERRUPTS_MASK	\
 	(GPU_IRQ_FAULT | \
 	 GPU_IRQ_PROTM_FAULT | \
@@ -83,66 +49,6 @@ static void panthor_gpu_coherency_set(struct panthor_device *ptdev)
 		ptdev->coherent ? GPU_COHERENCY_PROT_BIT(ACE_LITE) : GPU_COHERENCY_NONE);
 }
 
-static void panthor_gpu_init_info(struct panthor_device *ptdev)
-{
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
-	u32 major, minor, status;
-	unsigned int i;
-
-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
-	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
-	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
-	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
-	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
-	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
-	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
-	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
-	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
-	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
-	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
-	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
-	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
-	for (i = 0; i < 4; i++)
-		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
-
-	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
-
-	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
-	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
-	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
-
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
-	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
-	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
-	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
-
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
-	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
-		 major, minor, status);
-
-	drm_info(&ptdev->base,
-		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
-		 ptdev->gpu_info.l2_features,
-		 ptdev->gpu_info.tiler_features,
-		 ptdev->gpu_info.mem_features,
-		 ptdev->gpu_info.mmu_features,
-		 ptdev->gpu_info.as_present);
-
-	drm_info(&ptdev->base,
-		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
-		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
-		 ptdev->gpu_info.tiler_present);
-}
-
 static void panthor_gpu_irq_handler(struct panthor_device *ptdev, u32 status)
 {
 	gpu_write(ptdev, GPU_INT_CLEAR, status);
@@ -205,7 +111,6 @@ int panthor_gpu_init(struct panthor_device *ptdev)
 	spin_lock_init(&gpu->reqs_lock);
 	init_waitqueue_head(&gpu->reqs_acked);
 	ptdev->gpu = gpu;
-	panthor_gpu_init_info(ptdev);
 
 	dma_set_max_seg_size(ptdev->base.dev, UINT_MAX);
 	pa_bits = GPU_MMU_FEATURES_PA_BITS(ptdev->gpu_info.mmu_features);
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
new file mode 100644
index 000000000000..94f170a8e5c5
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -0,0 +1,113 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#include "panthor_device.h"
+#include "panthor_hw.h"
+#include "panthor_regs.h"
+
+/**
+ * struct panthor_model - GPU model description
+ */
+struct panthor_model {
+	/** @name: Model name. */
+	const char *name;
+
+	/** @arch_major: Major version number of architecture. */
+	u8 arch_major;
+
+	/** @product_major: Major version number of product. */
+	u8 product_major;
+};
+
+/**
+ * GPU_MODEL() - Define a GPU model. A GPU product can be uniquely identified
+ * by a combination of the major architecture version and the major product
+ * version.
+ * @_name: Name for the GPU model.
+ * @_arch_major: Architecture major.
+ * @_product_major: Product major.
+ */
+#define GPU_MODEL(_name, _arch_major, _product_major) \
+{\
+	.name = __stringify(_name),				\
+	.arch_major = _arch_major,				\
+	.product_major = _product_major,			\
+}
+
+static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g610, 10, 7),
+	{},
+};
+
+static void panthor_gpu_info_init(struct panthor_device *ptdev)
+{
+	unsigned int i;
+
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
+	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
+	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
+	ptdev->gpu_info.l2_features = gpu_read(ptdev, GPU_L2_FEATURES);
+	ptdev->gpu_info.tiler_features = gpu_read(ptdev, GPU_TILER_FEATURES);
+	ptdev->gpu_info.mem_features = gpu_read(ptdev, GPU_MEM_FEATURES);
+	ptdev->gpu_info.mmu_features = gpu_read(ptdev, GPU_MMU_FEATURES);
+	ptdev->gpu_info.thread_features = gpu_read(ptdev, GPU_THREAD_FEATURES);
+	ptdev->gpu_info.max_threads = gpu_read(ptdev, GPU_THREAD_MAX_THREADS);
+	ptdev->gpu_info.thread_max_workgroup_size = gpu_read(ptdev, GPU_THREAD_MAX_WORKGROUP_SIZE);
+	ptdev->gpu_info.thread_max_barrier_size = gpu_read(ptdev, GPU_THREAD_MAX_BARRIER_SIZE);
+	ptdev->gpu_info.coherency_features = gpu_read(ptdev, GPU_COHERENCY_FEATURES);
+	for (i = 0; i < 4; i++)
+		ptdev->gpu_info.texture_features[i] = gpu_read(ptdev, GPU_TEXTURE_FEATURES(i));
+
+	ptdev->gpu_info.as_present = gpu_read(ptdev, GPU_AS_PRESENT);
+
+	ptdev->gpu_info.shader_present = gpu_read64(ptdev, GPU_SHADER_PRESENT);
+	ptdev->gpu_info.tiler_present = gpu_read64(ptdev, GPU_TILER_PRESENT);
+	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT);
+}
+
+static void panthor_hw_info_init(struct panthor_device *ptdev)
+{
+	const struct panthor_model *model;
+	u32 arch_major, product_major;
+	u32 major, minor, status;
+
+	panthor_gpu_info_init(ptdev);
+
+	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
+	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
+	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
+	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
+
+	for (model = gpu_models; model->name; model++) {
+		if (model->arch_major == arch_major &&
+		    model->product_major == product_major)
+			break;
+	}
+
+	drm_info(&ptdev->base,
+		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 major, minor, status);
+
+	drm_info(&ptdev->base,
+		 "Features: L2:%#x Tiler:%#x Mem:%#x MMU:%#x AS:%#x",
+		 ptdev->gpu_info.l2_features,
+		 ptdev->gpu_info.tiler_features,
+		 ptdev->gpu_info.mem_features,
+		 ptdev->gpu_info.mmu_features,
+		 ptdev->gpu_info.as_present);
+
+	drm_info(&ptdev->base,
+		 "shader_present=0x%0llx l2_present=0x%0llx tiler_present=0x%0llx",
+		 ptdev->gpu_info.shader_present, ptdev->gpu_info.l2_present,
+		 ptdev->gpu_info.tiler_present);
+}
+
+int panthor_hw_init(struct panthor_device *ptdev)
+{
+	panthor_hw_info_init(ptdev);
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
new file mode 100644
index 000000000000..0af6acc6aa6a
--- /dev/null
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright 2025 ARM Limited. All rights reserved. */
+
+#ifndef __PANTHOR_HW_H__
+#define __PANTHOR_HW_H__
+
+struct panthor_device;
+
+int panthor_hw_init(struct panthor_device *ptdev);
+
+#endif /* __PANTHOR_HW_H__ */
-- 
2.49.0

