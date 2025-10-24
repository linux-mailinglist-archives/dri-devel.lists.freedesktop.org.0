Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033A8C0808E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 22:22:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACDB10EB3B;
	Fri, 24 Oct 2025 20:22:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="aXK4Tqaq";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="aXK4Tqaq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11011002.outbound.protection.outlook.com [52.101.65.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F385410EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 20:22:10 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=YD73ozgJuJ1s1N9fNJFdVqKMUEw5vPD0/MrTlwiJc+jRnUhCEwLPoLn39iNrLTAQGzwQoIANLL8PyVBqKgKui3EB/DhHTt+aSEd+nkyGqZcxF30cK2AWT6jPQiTTLJOsfsQ5vpXMQdV/wHPTrNKbhNox7FeJAuAOaLcVa0uEybUNYFgcKj6uwwpaIzfKElBBQwGOZY6tJgLqjT6xBReUvAqdJLqlToZDWhBlH27AkBn4bE+zF7RcUlX5YC11eNav9s5U09au5Mc2FfNx/EmMLaPR++CkNz6OtX+1gTOUdFHWU/zo/TnqkKdUY2fN2V9pnzjuZGrVfw371WCP2qu6IQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=okK2QNLXTw6OT8rIdaIOta6g1V4DwVGE1eNniamAamd20WmjCxNppfmLxxuOi8TekTLE9UFIncRO9sNE9vabZ4oTKIH5OSt0AuKfRGWAW/y7Z7KcUHO+4BlfxZMK5Ph/wsjcRxWnHscHyOC8x2hV02aqzX+YHTUPg7AEbN6vvLDQ+R3g5aRpBmPmnwlzIjJHlY0UY3DpNuZQ9XwO+jpPb6cqi2dJzKUZhA/bfJllnbDr7+NifICapj0xvQAMqsO/0DeJ3Z30YQy5ZbjYy0F3UNzbq5Yo1UQPkpYddLQY3t6f4H0gzlc0MdptH3xCU1CA/J+F+QGacociXQwjVKxlUA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=aXK4TqaqxPf7ZTzqPrDcv11IDNoLkVuqYqLtFnlEEM9IPheRbOr8En9b4W1IrAoKt2UFo7KC+cK1MFqlW/tFWVsvQLGjsB8qXXIlKHM9NMIuhlIUdAkKdBi7EdWYvUpqzWh26RM5rF9cVJLlHCovUF8bU1iAu1DGaTj2PFwfff8=
Received: from DUZPR01CA0219.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::16) by AS4PR08MB8244.eurprd08.prod.outlook.com
 (2603:10a6:20b:51d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:22:04 +0000
Received: from DB1PEPF000509E2.eurprd03.prod.outlook.com
 (2603:10a6:10:4b4:cafe::66) by DUZPR01CA0219.outlook.office365.com
 (2603:10a6:10:4b4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.13 via Frontend Transport; Fri,
 24 Oct 2025 20:22:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509E2.mail.protection.outlook.com (10.167.242.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.7
 via Frontend Transport; Fri, 24 Oct 2025 20:22:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y106iv8z1xa/dM5wIuSomjnp8i/m/Mg3Wc5bqNiBzSjYpX7TjzyGXrT7ZJu8BRzPOVDUIStcgXF/5ROAw+hAy5/bvG/z6MK8ntudGymBcNtf7n6m8rKQhUN0wQGiGqilNXeltxp9mDcdcOGVL5TBNMfPO56mpV0eZ5+QCdSe0/NR6EBBUcaB8jdY4TkpltsJAxikVyNde0ihSKnIPEPRcZ+4XSArsQXm4rTnCYVFE4v6xF+az7P2Xi6mKKsHtlf67brm+pZHjzXzxflirJEZLZsklyn51AndeCbwWq54lJQd4ff8DB3+KeoncRPkOiP7XAZkAHKK6qc50xRt12z/Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=TZoLgMYw5jF8+nuEtKfqi+ft7mP8vYysPPTv0XSHJLsSazTgqZA4bzrYmWoOgCmd/hNLByAD9KUtyz8thcslapgfqekaVq+Qwm1ADtcWXfymhOWOOPtQvcs1p9gQfy5fAvmlLdinSPPTMv0gCbFQMc/nZfmUvFNHWVjvRYPMx2QGZunNjq5IgxBt6INBZg3zlynxIPOtmtPRxNzYPaDNc0gH8WOykpdSsqmU/+JXKa0uU2qVxkO4f4odBr95SIS3UCuL+JyJp+W5344KgYhWdzQVr5NCif9Dsj8VFNWKs2KJnhnB5ANzefdFOhgz8/41Qqwowlp1B3NMJ6C5pIVVYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8Jmrw0tdQkdM1p238HpCwZlvslKvE5rn8wqJ1rtx4Nk=;
 b=aXK4TqaqxPf7ZTzqPrDcv11IDNoLkVuqYqLtFnlEEM9IPheRbOr8En9b4W1IrAoKt2UFo7KC+cK1MFqlW/tFWVsvQLGjsB8qXXIlKHM9NMIuhlIUdAkKdBi7EdWYvUpqzWh26RM5rF9cVJLlHCovUF8bU1iAu1DGaTj2PFwfff8=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DU0PR08MB8929.eurprd08.prod.outlook.com
 (2603:10a6:10:464::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 20:21:30 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 20:21:30 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/8] drm/panthor: Implement L2 power on/off via PWR_CONTROL
Date: Fri, 24 Oct 2025 21:21:13 +0100
Message-ID: <20251024202117.3241292-5-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251024202117.3241292-1-karunika.choo@arm.com>
References: <20251024202117.3241292-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0395.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18f::22) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DU0PR08MB8929:EE_|DB1PEPF000509E2:EE_|AS4PR08MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e388553-0855-4f3e-936a-08de133afe72
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?HdQ0yStik518Pd12jOSqrZltZQivFgsdTwWudUfRt7zK+O4ZS2c3c1gGZacx?=
 =?us-ascii?Q?neVW2lo8rRbahs/XRxzW9yCVIPfFBLguLACIH/OiTNx7cwWdDxI6Va94EA9w?=
 =?us-ascii?Q?3EjT9fzVesJp2hVBmB2UGVdbfwC+/apwzfXTEOSXNb9pSIyLoIVl4NaSHK4b?=
 =?us-ascii?Q?riRzycvo0lNYU6rM4Cx147LSy3sBvDvVPnUsM1yY/dP9bmLV/wBArd763MMv?=
 =?us-ascii?Q?6nfCQK50F9gVEjT+Wjpy0ry1EYPwPaa5iCg+/rfNpj8p3Syb7aLKBb9KUOVA?=
 =?us-ascii?Q?7pDEzKp/D258rAnamvPOExCpWxoALc/ZeYs8AWWJ8i7uQeDIsmLt+Z5bLL50?=
 =?us-ascii?Q?TzhrES/vFJIolqd/xccxordDUC5hhkueOGGiwncsgejAe4WUjyhoGOHwi8G/?=
 =?us-ascii?Q?ERiogQq7ESiW22ZtiedYpV5X8pxga3DRet4bFDH2tJuKWW48Bj4pQLxpNDb+?=
 =?us-ascii?Q?uOuWY4DUhI/VSn1C32FGw426xpMp1fsFc1bWJ/kC8KXy/yLHaGdlLttVI41e?=
 =?us-ascii?Q?NTkxsiBQ7ey87ag9MpyjVD4ua7DYnwKowjzkVWZW+s11Dl/HUHLvL+hCLy1v?=
 =?us-ascii?Q?XBBqjjmZ8uC0qOGLhDCjicisLXscbiWGVJlBA3MLpNZGgfWUxAhh2mOHnl0V?=
 =?us-ascii?Q?nsbGoF+zCHRVbV8KLPUDmhKT8f148nTveTyYMsJGBewzXiDR+W7BS6YiYKKd?=
 =?us-ascii?Q?f+FSgtf2P9V8fl/wWieePW3Mom92yZOCDLkn6DhNNMUQah3kKPWxsLofS9Zr?=
 =?us-ascii?Q?NyKAoG3TsQroNjZwHsGnkU7AFQD9GecHKRPr7g7We/utav8TzY7r49mRFWCn?=
 =?us-ascii?Q?ylU6HRcX+tq+VhRsKFbBaGu+FbqbyTpy4l+T+YOoSu/zRklWqM+9FauSFrzj?=
 =?us-ascii?Q?5ZnXrppHFHn+eXDSjic7CZJYMim/GJXRrSL3GNI+i49V+feYdTyMFL//2/4H?=
 =?us-ascii?Q?7KBxbC5WPkrptvYqKmZAsjNED0/x3y/wCGkowl/c7tbUHOpwjMC9T5d0EsKU?=
 =?us-ascii?Q?gsFZ6QC7Oa1ZD2AFKh3gT+EQpURS8pSWwx1OitgrUrXWcRiTsq4rWip+oDTJ?=
 =?us-ascii?Q?KnYuhFjt7hBxOuLHOuoRdDRAL6O1hnIthlXuV81o0hYXsbjJVreR/yvrSYEn?=
 =?us-ascii?Q?7uNxi99I3XCKkcd6Imr+PR3+raCM6aKIj3Udes5Ks6MWWp0j7DYbbQooACyv?=
 =?us-ascii?Q?cUkCe4eYb7pPg5bJYgJHSP7TM6wJ/pjD8Ox/FNtKANn2+6njba8j7OVC2m7h?=
 =?us-ascii?Q?erkreqSHYlztfscDf7ZbAmC3syqwZx05fmAWBE6f03xj42+1IRMm8OZx0QB+?=
 =?us-ascii?Q?YuqEWy5J6H/mcgjgeV9o3Z/bOMO1yjpABxwz9wuuks1U7BRxqtC/eIP9QkMR?=
 =?us-ascii?Q?8qpZMohpWdYMI1PcZQKRHtnHLDIimXDWUBz58J+ufxt/7YJUiQiptqFS4f1Q?=
 =?us-ascii?Q?/FxDiJlyVUMRE5DrFVNQA/F6JsLN/QRG?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8929
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 590ad3b7-4606-4b36-294f-08de133aeadb
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|36860700013|82310400026|376014|35042699022|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?leqagVtirxnqAzqAzDFN2nOI/YgN2Z0ZTS9/IRdEo4wx2r3b2RGkmtKlCuOb?=
 =?us-ascii?Q?r7F3qcMLsSzataWrQMO1O6psE/Gyb6uIhKSqFiY/XRvthI85gK86Vu0q/pZH?=
 =?us-ascii?Q?i7UbU9CH99grO6qxbGmfcq2LfTMglSaSh/6wsPAcgwyvCfywPpCEhe0+z5NQ?=
 =?us-ascii?Q?GM0yCUpASI3ypccvxWmVH0ifoIXgkE7ejUT3W/pUpweTxje8hld6rpz9E80I?=
 =?us-ascii?Q?XENg+h9M73l82yMPb6eIoSIcW6cMHaWQvvLHO3TFbSh/8RWkA+BsYeITtqqH?=
 =?us-ascii?Q?BIancIZERR1Zk7lPhujb6ujXw/QAluUS77+Dk75fx+NNDDfW+0FVOZyDLXTp?=
 =?us-ascii?Q?gdBAlBlxuUKvAest+W56ygxEtSjqZi2u7YnKoQUZ9CnlTZJIjZLK1IRdW8Gv?=
 =?us-ascii?Q?7wro6ZlXDQi88n8kVRU4SetLvMHkD0piReVHX43KBiEDbfz9B2KVfPhKKLHL?=
 =?us-ascii?Q?aY1uq1/ecpevKO/U1tyrun88f8FbF3ulcW0Ml5EvdMc/SvsupX/H6kKT4IyE?=
 =?us-ascii?Q?f47tK2BKAHwm6BCPwN7Y0ddoSuxs9PORQHevCN0WBrcpP1fYpCPFHcNFcZPg?=
 =?us-ascii?Q?DGNOUbu6lI7+I61YfGTD69QF0hS0AKNurtkukxyobC3CPrE416McOw6Nxl2Y?=
 =?us-ascii?Q?u0mWZDSe809edCN5mNynhUskBcuJGIjHfFuV46jwI4STkMnzGl39v2z14f9b?=
 =?us-ascii?Q?oFaYoX81Aa7G1SrM1hQS6HcbzN1wtao9HWgYii/Cwmo8gxsZy0yxzmqI6UPT?=
 =?us-ascii?Q?yN5WaaaZceTZR7ZM65IfmCjC+Jq+HHzNqU7CgtTJuGCgeiHOxxFiEXZ+JrOf?=
 =?us-ascii?Q?65JHdDGJOwSwfMtf7peSGD/Z3AVQXxTmY92UB0DA54explNWeqagfeIKN67V?=
 =?us-ascii?Q?lTkHR9/CDvkjlWl7M9Mj1XK6fbyi2/xeVBBeF7vcIDV2chFRx4uEow3pLEqd?=
 =?us-ascii?Q?jQSjAt6FJm7LGbUeQARt8KBLCE4svvmGCelZrZCYg0iWng0vTVOpZaEmsbNH?=
 =?us-ascii?Q?43YMU75joF3kYZiYJFTT2NUM08eli3nlUd15/n9HiAmVgyir6TkWSS9yHZI7?=
 =?us-ascii?Q?kYV156Ntd4j2//+rsNFTbs+4qZ6vwM1Wj/L/AnH06uWe7q1N7Nyb0Zkg3KdF?=
 =?us-ascii?Q?J/7NAMsE2U3IQEWQIExrKI3V0beBQTpIydX8uHuBqz2eMkbBH6xuI2ybMfyX?=
 =?us-ascii?Q?LVmRTBiPyPbpyWGjzXU61a69Kjc1b9JcU7xQEOkmtluWt2sOf6idBDwy96FB?=
 =?us-ascii?Q?ZgLQZ42xeDBj1k9/pFAI9XEtvxQhS3RnKXwvNgW2l20682MWtN4B/7cDq8BA?=
 =?us-ascii?Q?u49H4voGgdcVn34NEDsgobS+guBYVrhC2IID3Fuq9aGYqnisZ+/LT2pNRyw7?=
 =?us-ascii?Q?IoCp+3Aa6uKycyz4xCTsHGlpMcwG37xU/wc7PlQcwOCWQRlbe/+1hP2qzw1C?=
 =?us-ascii?Q?QAfz6aQG0RFM3ZlDE73wkKQtus22pf8h/j7Tzzgp7evJDYR0w4Pv/SoVjC9n?=
 =?us-ascii?Q?mFmzaBmHblGzjGkEG3PvZbQqd4Iy5oAbw1dn6CCqUZ69BvZQCvyccbFYmGF+?=
 =?us-ascii?Q?54hyIatxUiHNHjC6MZM=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(36860700013)(82310400026)(376014)(35042699022)(1800799024);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 20:22:03.0069 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e388553-0855-4f3e-936a-08de133afe72
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E2.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8244
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

This patch adds common helpers to issue power commands, poll
transitions, and validate domain state, then wires them into the L2
on/off paths.

The L2 power-on sequence now delegates control of the SHADER and TILER
domains to the MCU when allowed, while the L2 itself is never delegated.
On power-off, dependent domains beneath the L2 are checked, and if
necessary, retracted and powered down to maintain proper domain
ordering.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Updated GENMASK to GENMASK_U64 to address kernel test robot warnings
   for 32-bit systems.
 * Removed panthor_pwr_read_status() in favour of a simple gpu_read64()
   operation on the PWR_STATUS register.
 * Renamed panthor_pwr_info_show() to panthor_pwr_debug_info_show() for
   more clarity.
 * Added additional WARN_ON for an invalid domain when requesting power
   domain transition.
 * Made panthor_pwr_domain_transition()'s expected val logic more
   readable and clearer.
 * Wait on domain power transition instead of failing the operation.
 * Fixed inconsistent error return value vs kerneldoc.
 * Removed confusing drm_dbg in delegate_domain() in favor of a comment.
 * Add unwind to panthor_pwr_delegate_domains().
 * Moved child domain handling logic from panthor_pwr_l2_power_off()
   into panthor_pwr_domain_force_off().
 * Added additional clarification regarding delegation and retraction of
   power domains.
 * Minor formatting and readability changes and remove unnecessary
   checks.
---
 drivers/gpu/drm/panthor/panthor_pwr.c  | 378 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_pwr.h  |   4 +
 drivers/gpu/drm/panthor/panthor_regs.h |   1 +
 3 files changed, 383 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_pwr.c b/drivers/gpu/drm/panthor/panthor_pwr.c
index da64fe006a8b..cd529660a276 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.c
+++ b/drivers/gpu/drm/panthor/panthor_pwr.c
@@ -23,6 +23,14 @@
 	 PWR_IRQ_COMMAND_NOT_ALLOWED | \
 	 PWR_IRQ_COMMAND_INVALID)

+#define PWR_ALL_CORES_MASK		GENMASK_U64(63, 0)
+
+#define PWR_DOMAIN_MAX_BITS		16
+
+#define PWR_TRANSITION_TIMEOUT_US	(2ULL * USEC_PER_SEC)
+
+#define PWR_RETRACT_TIMEOUT_US		(2ULL * USEC_PER_MSEC)
+
 /**
  * struct panthor_pwr - PWR_CONTROL block management data.
  */
@@ -59,6 +67,323 @@ static void panthor_pwr_irq_handler(struct panthor_device *ptdev, u32 status)
 }
 PANTHOR_IRQ_HANDLER(pwr, PWR, panthor_pwr_irq_handler);

+static void panthor_pwr_write_command(struct panthor_device *ptdev, u32 command, u64 args)
+{
+	if (args)
+		gpu_write64(ptdev, PWR_CMDARG, args);
+
+	gpu_write(ptdev, PWR_COMMAND, command);
+}
+
+static const char *get_domain_name(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return "L2";
+	case PWR_COMMAND_DOMAIN_TILER:
+		return "Tiler";
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return "Shader";
+	case PWR_COMMAND_DOMAIN_BASE:
+		return "Base";
+	case PWR_COMMAND_DOMAIN_STACK:
+		return "Stack";
+	}
+	return "Unknown";
+}
+
+static u32 get_domain_base(u8 domain)
+{
+	switch (domain) {
+	case PWR_COMMAND_DOMAIN_L2:
+		return PWR_L2_PRESENT;
+	case PWR_COMMAND_DOMAIN_TILER:
+		return PWR_TILER_PRESENT;
+	case PWR_COMMAND_DOMAIN_SHADER:
+		return PWR_SHADER_PRESENT;
+	case PWR_COMMAND_DOMAIN_BASE:
+		return PWR_BASE_PRESENT;
+	case PWR_COMMAND_DOMAIN_STACK:
+		return PWR_STACK_PRESENT;
+	}
+	return 0;
+}
+
+static u32 get_domain_ready_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_READY - PWR_L2_PRESENT);
+}
+
+static u32 get_domain_pwrtrans_reg(u32 domain)
+{
+	return get_domain_base(domain) + (PWR_L2_PWRTRANS - PWR_L2_PRESENT);
+}
+
+static bool is_valid_domain(u32 domain)
+{
+	return get_domain_base(domain) != 0;
+}
+
+static bool has_rtu(struct panthor_device *ptdev)
+{
+	return ptdev->gpu_info.gpu_features & GPU_FEATURES_RAY_TRAVERSAL;
+}
+
+static u8 get_domain_subdomain(struct panthor_device *ptdev, u32 domain)
+{
+	if ((domain == PWR_COMMAND_DOMAIN_SHADER) && has_rtu(ptdev))
+		return PWR_COMMAND_SUBDOMAIN_RTU;
+
+	return 0;
+}
+
+static int panthor_pwr_domain_wait_transition(struct panthor_device *ptdev, u32 domain,
+					      u32 timeout_us)
+{
+	u32 pwrtrans_reg = get_domain_pwrtrans_reg(domain);
+	u64 val;
+	int ret = 0;
+
+	ret = gpu_read64_poll_timeout(ptdev, pwrtrans_reg, val, !(PWR_ALL_CORES_MASK & val), 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain power in transition, pwrtrans(0x%llx)",
+			get_domain_name(domain), val);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void panthor_pwr_debug_info_show(struct panthor_device *ptdev)
+{
+	drm_info(&ptdev->base, "GPU_FEATURES:    0x%016llx", gpu_read64(ptdev, GPU_FEATURES));
+	drm_info(&ptdev->base, "PWR_STATUS:      0x%016llx", gpu_read64(ptdev, PWR_STATUS));
+	drm_info(&ptdev->base, "L2_PRESENT:      0x%016llx", gpu_read64(ptdev, PWR_L2_PRESENT));
+	drm_info(&ptdev->base, "L2_PWRTRANS:     0x%016llx", gpu_read64(ptdev, PWR_L2_PWRTRANS));
+	drm_info(&ptdev->base, "L2_READY:        0x%016llx", gpu_read64(ptdev, PWR_L2_READY));
+	drm_info(&ptdev->base, "TILER_PRESENT:   0x%016llx", gpu_read64(ptdev, PWR_TILER_PRESENT));
+	drm_info(&ptdev->base, "TILER_PWRTRANS:  0x%016llx", gpu_read64(ptdev, PWR_TILER_PWRTRANS));
+	drm_info(&ptdev->base, "TILER_READY:     0x%016llx", gpu_read64(ptdev, PWR_TILER_READY));
+	drm_info(&ptdev->base, "SHADER_PRESENT:  0x%016llx", gpu_read64(ptdev, PWR_SHADER_PRESENT));
+	drm_info(&ptdev->base, "SHADER_PWRTRANS: 0x%016llx", gpu_read64(ptdev, PWR_SHADER_PWRTRANS));
+	drm_info(&ptdev->base, "SHADER_READY:    0x%016llx", gpu_read64(ptdev, PWR_SHADER_READY));
+}
+
+static int panthor_pwr_domain_transition(struct panthor_device *ptdev, u32 cmd, u32 domain,
+					 u64 mask, u32 timeout_us)
+{
+	u32 ready_reg = get_domain_ready_reg(domain);
+	u32 pwr_cmd = PWR_COMMAND_DEF(cmd, domain, get_domain_subdomain(ptdev, domain));
+	u64 expected_val = 0;
+	u64 val;
+	int ret = 0;
+
+	if (drm_WARN_ON(&ptdev->base, !is_valid_domain(domain)))
+		return -EINVAL;
+
+	switch (cmd) {
+	case PWR_COMMAND_POWER_DOWN:
+		expected_val = 0;
+		break;
+	case PWR_COMMAND_POWER_UP:
+		expected_val = mask;
+		break;
+	default:
+		drm_err(&ptdev->base, "Invalid power domain transition command (0x%x)", cmd);
+		return -EINVAL;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, timeout_us);
+	if (ret)
+		return ret;
+
+	/* domain already in target state, return early */
+	if ((gpu_read64(ptdev, ready_reg) & mask) == expected_val)
+		return 0;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, mask);
+
+	ret = gpu_read64_poll_timeout(ptdev, ready_reg, val, (mask & val) == expected_val, 100,
+				      timeout_us);
+	if (ret) {
+		drm_err(&ptdev->base,
+			"timeout waiting on %s power domain transition, cmd(0x%x), arg(0x%llx)",
+			get_domain_name(domain), pwr_cmd, mask);
+		panthor_pwr_debug_info_show(ptdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+#define panthor_pwr_domain_power_off(__ptdev, __domain, __mask, __timeout_us)            \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_DOWN, __domain, __mask, \
+				      __timeout_us)
+
+#define panthor_pwr_domain_power_on(__ptdev, __domain, __mask, __timeout_us) \
+	panthor_pwr_domain_transition(__ptdev, PWR_COMMAND_POWER_UP, __domain, __mask, __timeout_us)
+
+/**
+ * retract_domain() - Retract control of a domain from MCU
+ * @ptdev: Device.
+ * @domain: Domain to retract the control
+ *
+ * Retracting L2 domain is not expected since it won't be delegated.
+ *
+ * Return: 0 on success or retracted already.
+ *         -EPERM if domain is L2.
+ *         A negative error code otherwise.
+ */
+static int retract_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_RETRACT, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val, !(PWR_STATUS_RETRACT_PENDING & val),
+				      0, PWR_RETRACT_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "%s domain retract pending", get_domain_name(domain));
+		return ret;
+	}
+
+	if (!(pwr_status & delegated_mask)) {
+		drm_dbg(&ptdev->base, "%s domain already retracted", get_domain_name(domain));
+		return 0;
+	}
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful retraction
+	 * allow-flag will be set with delegated-flag being cleared.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == allow_mask, 10,
+				      PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Retracting %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+/**
+ * delegate_domain() - Delegate control of a domain to MCU
+ * @ptdev: Device.
+ * @domain: Domain to delegate the control
+ *
+ * Delegating L2 domain is prohibited.
+ *
+ * Return:
+ * *       0 on success or delegated already.
+ * *       -EPERM if domain is L2.
+ * *       A negative error code otherwise.
+ */
+static int delegate_domain(struct panthor_device *ptdev, u32 domain)
+{
+	const u32 pwr_cmd = PWR_COMMAND_DEF(PWR_COMMAND_DELEGATE, domain, 0);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u64 allow_mask = PWR_STATUS_DOMAIN_ALLOWED(domain);
+	const u64 delegated_mask = PWR_STATUS_DOMAIN_DELEGATED(domain);
+	u64 val;
+	int ret;
+
+	if (drm_WARN_ON(&ptdev->base, domain == PWR_COMMAND_DOMAIN_L2))
+		return -EPERM;
+
+	/* Already delegated, exit early */
+	if (pwr_status & delegated_mask)
+		return 0;
+
+	/* Check if the command is allowed before delegating. */
+	if (!(pwr_status & allow_mask)) {
+		drm_warn(&ptdev->base, "Delegating %s domain not allowed", get_domain_name(domain));
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_wait_transition(ptdev, domain, PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	panthor_pwr_write_command(ptdev, pwr_cmd, 0);
+
+	/*
+	 * On successful delegation
+	 * allow-flag will be cleared with delegated-flag being set.
+	 */
+	ret = gpu_read64_poll_timeout(ptdev, PWR_STATUS, val,
+				      ((delegated_mask | allow_mask) & val) == delegated_mask,
+				      10, PWR_TRANSITION_TIMEOUT_US);
+	if (ret) {
+		drm_err(&ptdev->base, "Delegating %s domain timeout, cmd(0x%x)",
+			get_domain_name(domain), pwr_cmd);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int panthor_pwr_delegate_domains(struct panthor_device *ptdev)
+{
+	int ret;
+
+	if (!ptdev->pwr)
+		return 0;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+	if (ret)
+		return ret;
+
+	ret = delegate_domain(ptdev, PWR_COMMAND_DOMAIN_TILER);
+	if (ret)
+		goto err_retract_shader;
+
+	return 0;
+
+err_retract_shader:
+	retract_domain(ptdev, PWR_COMMAND_DOMAIN_SHADER);
+
+	return ret;
+}
+
+/**
+ * panthor_pwr_domain_force_off - Forcefully power down a domain.
+ * @ptdev: Device.
+ * @domain: Domain to forcefully power down.
+ *
+ * This function will attempt to retract and power off the requested power
+ * domain. However, if retraction fails, the operation is aborted. If power off
+ * fails, the domain will remain retracted and under the host control.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int panthor_pwr_domain_force_off(struct panthor_device *ptdev, u32 domain)
+{
+	const u64 domain_ready = gpu_read64(ptdev, get_domain_ready_reg(domain));
+	int ret;
+
+	/* Domain already powered down, early exit. */
+	if (!domain_ready)
+		return 0;
+
+	/* Domain has to be in host control to issue power off command. */
+	ret = retract_domain(ptdev, domain);
+	if (ret)
+		return ret;
+
+	return panthor_pwr_domain_power_off(ptdev, domain, domain_ready, PWR_TRANSITION_TIMEOUT_US);
+}
+
 void panthor_pwr_unplug(struct panthor_device *ptdev)
 {
 	unsigned long flags;
@@ -103,6 +428,59 @@ int panthor_pwr_init(struct panthor_device *ptdev)
 	return 0;
 }

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev)
+{
+	const u64 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	const u64 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+
+	/* Abort if L2 power off constraints are not satisfied */
+	if (!(pwr_status & l2_allow_mask)) {
+		drm_warn(&ptdev->base, "Power off L2 domain not allowed");
+		return;
+	}
+
+	/* It is expected that when halting the MCU, it would power down its
+	 * delegated domains. However, an unresponsive or hung MCU may not do
+	 * so, which is why we need to check and retract the domains back into
+	 * host control to be powered down in the right order before powering
+	 * down the L2.
+	 */
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_TILER))
+		return;
+
+	if (panthor_pwr_domain_force_off(ptdev, PWR_COMMAND_DOMAIN_SHADER))
+		return;
+
+	panthor_pwr_domain_power_off(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+				     PWR_TRANSITION_TIMEOUT_US);
+}
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev)
+{
+	const u32 pwr_status = gpu_read64(ptdev, PWR_STATUS);
+	const u32 l2_allow_mask = PWR_STATUS_DOMAIN_ALLOWED(PWR_COMMAND_DOMAIN_L2);
+	int ret;
+
+	if ((pwr_status & l2_allow_mask) == 0) {
+		drm_warn(&ptdev->base, "Power on L2 domain not allowed");
+		return -EPERM;
+	}
+
+	ret = panthor_pwr_domain_power_on(ptdev, PWR_COMMAND_DOMAIN_L2, ptdev->gpu_info.l2_present,
+					  PWR_TRANSITION_TIMEOUT_US);
+	if (ret)
+		return ret;
+
+	/* Delegate control of the shader and tiler power domains to the MCU as
+	 * it can better manage which shader/tiler cores need to be powered up
+	 * or can be powered down based on currently running jobs.
+	 *
+	 * If the shader and tiler domains are already delegated to the MCU,
+	 * this call would just return early.
+	 */
+	return panthor_pwr_delegate_domains(ptdev);
+}
+
 void panthor_pwr_suspend(struct panthor_device *ptdev)
 {
 	if (!ptdev->pwr)
diff --git a/drivers/gpu/drm/panthor/panthor_pwr.h b/drivers/gpu/drm/panthor/panthor_pwr.h
index b325e5b7eba3..3c834059a860 100644
--- a/drivers/gpu/drm/panthor/panthor_pwr.h
+++ b/drivers/gpu/drm/panthor/panthor_pwr.h
@@ -10,6 +10,10 @@ void panthor_pwr_unplug(struct panthor_device *ptdev);

 int panthor_pwr_init(struct panthor_device *ptdev);

+void panthor_pwr_l2_power_off(struct panthor_device *ptdev);
+
+int panthor_pwr_l2_power_on(struct panthor_device *ptdev);
+
 void panthor_pwr_suspend(struct panthor_device *ptdev);

 void panthor_pwr_resume(struct panthor_device *ptdev);
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index 5469eec02178..18702d7001e2 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -72,6 +72,7 @@

 #define GPU_FEATURES					0x60
 #define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define   GPU_FEATURES_RAY_TRAVERSAL			BIT(5)

 #define GPU_TIMESTAMP_OFFSET				0x88
 #define GPU_CYCLE_COUNT					0x90
--
2.49.0

