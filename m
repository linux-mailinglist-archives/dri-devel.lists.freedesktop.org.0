Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC706C0F32D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13FB710E4EA;
	Mon, 27 Oct 2025 16:14:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="jCRJQh2w";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jCRJQh2w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013026.outbound.protection.outlook.com [52.101.72.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0AE010E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:17 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=S1/cLpiQ6CmlEWFifqPYZNpwFd+Hx6Q7g70XJFyQ3XTcjGyGdPJAY3g+eLzkDqt3mF29fnI65V994XtTodnq4CRN9fVH0VTWY0MLsiXk5UkQJSnZFY7gmJHdR7JqXToyauOIAvF32/BQP6ykUdGlB4hqKNpFceWEl3QghdYWP0N6iuK0EbqjL8s0Uy9QN3hoG1VJG4dS0D+IYsfSbePMruUa8X840g88/6RSTPSnXAlxPedG2EOr5sClKeCV2lYw7ZFRlPfshBduTqLM0tTnxtLw6oYMGY/3YQf51fv5rIFmTWV1DL8KLc93105WhElqymNMWKroWNpe4RmS2dAFqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=gWF0UYgj4uFwOHik8b8f/LDd+OPaSDdqHCySFJNCrZD7DBLAae3XYFFJlzvn2OdY3BLY5TCptMKFbi/ahhVMWvZjpj8Aaki99GR7tGaNtFQmsK7rBCjrRUDbBNko7AHtAoILQ6lgb6d1LL6Z+zj4k8iVmhrIXLcVM2Ps2LCRk6UI6sH+stJt4EoPRCPkc5mrPeXutotcS8IPMFl1Nq51Rur+zRsDS7KB0+u1lxEWbWakv88hEicFezPfvCfHKEwpOYu5ONeLpElDJEuCJDaTmhzNhViAs7NZJdOIH4bjayUMU7L0M8K0Ysmw4OHHy/bgNnUOxPs3KQdeSDr9xXH/8Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=jCRJQh2wrHYdFfAbhKCC62DCeskTAv/3sY5LmJ4lDgZIQzTEE5uFEYWWUP7ejUnnOtDYkhnfdZWusMpas3Yzy3nujLkoQQ1+AIXiDJUZlJ+vIi9WAlb0M3Vww9+aa5RvxEtI/RPW62OKZdjLEnj9XUX0UclWoXZ3F2A4fvxKhyY=
Received: from DU2PR04CA0336.eurprd04.prod.outlook.com (2603:10a6:10:2b4::15)
 by FRZPR08MB11218.eurprd08.prod.outlook.com (2603:10a6:d10:135::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:14:13 +0000
Received: from DU6PEPF0000A7E3.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::29) by DU2PR04CA0336.outlook.office365.com
 (2603:10a6:10:2b4::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Mon,
 27 Oct 2025 16:14:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000A7E3.mail.protection.outlook.com (10.167.8.41) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.10 via
 Frontend Transport; Mon, 27 Oct 2025 16:14:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiZcQyDL6AjsZd6db56li7aRAzYyLORHu5q/yCFlFw0JOCMoUKAL+hlFtqbFcqCO22zDgScLcdq6VRAza3S1lTgYRP7dPs4YQgKkGpe0bpItI0iThzWjyDCEfCOO6Vp+hXz3iseqRRNkBX/D48T21Qzf91goGPHFho4gZm5W49K46sxX6ZKy1tsHMIpqpufFEHT/kV0a/dQ4IywF+OCHd+Y+9d8Ws5AGsL3SjuXM7z1XWhFXWLEbLohetb17TgECoS9sMrn7vYPYc6nGUwQZRjbFmwmiX35MMued4bA6qiy6UK3wcxpTzuscoRQm6vP+eudDqS4DzLGS2SQbzwivpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=FonXZ61TgD2gJzLd+T7w3kaAa5eUxKyLssbcwLlKmWf1EyCcCJXbo6rH9RmYbDrFjUEF2h1BPIYVZ7PhookFOx7Qb2TKdpX6tg41EE0Igmxj0N4G0iO2xCB3hUw4Rc4Np4uUHhY/EYftIOIw5tvkR0eEnzEae2Q1eVHGnJ5sp+517Y0oX+oiuRsDBwU47Ql8Za1O46VOJ27QmoYcm9W8SB7RwhfnWIZAOqHFStuZk7/fmE9S8labMpe8awVuGxs9uZk1e3JHGOCabM0z39uA6fuCRxfe8fFOZD2T0PjI4X9QVcSPP2RQKMt6voTc6VEiuWFOsdkhtIBr0dt4wIHLcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYfs/O49/TcoUU/EuXXUYCayxvFNFP1959nYcP1jho8=;
 b=jCRJQh2wrHYdFfAbhKCC62DCeskTAv/3sY5LmJ4lDgZIQzTEE5uFEYWWUP7ejUnnOtDYkhnfdZWusMpas3Yzy3nujLkoQQ1+AIXiDJUZlJ+vIi9WAlb0M3Vww9+aa5RvxEtI/RPW62OKZdjLEnj9XUX0UclWoXZ3F2A4fvxKhyY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB4PR08MB9335.eurprd08.prod.outlook.com
 (2603:10a6:10:3f4::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:40 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:40 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/8] drm/panthor: Add arch-specific panthor_hw binding
Date: Mon, 27 Oct 2025 16:13:27 +0000
Message-ID: <20251027161334.854650-2-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P302CA0031.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::18) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB4PR08MB9335:EE_|DU6PEPF0000A7E3:EE_|FRZPR08MB11218:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ea9ff32-7d56-4b94-8061-08de1573de99
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?u1oMUCzm2yBrCfKxqafvu0DZ7vnoixl333xbLKyiwlOoOFRdI9MHrOSmjYuE?=
 =?us-ascii?Q?GiVOaUZE/VepBYaAPdBkkWWbWFAYyl1C6lIze/3xyFnumsm7H2qRTFjqeF0M?=
 =?us-ascii?Q?RmXDimoKhRotN4ZJGyJmn2y4Qk+nbUWFZRdRpiIygc6NWr9+NrN5mwNfyRRh?=
 =?us-ascii?Q?uIPKsMJ+SC4BLbMM9B4CxdXFS5FQVAlnuleOLvMwFuZdN35oYCcCeq1I1Fcz?=
 =?us-ascii?Q?sUtSVlYDjb/WNeY4MlEtjvz1EjGqmOl0S7+2KXlF4K4eOuOZFaopwPIynoFM?=
 =?us-ascii?Q?AX+c3UqbRX8KBC/gtZG63CgugkhLMJlVqmTg4yCRYsDzUdRCDCUwWbpSA5TQ?=
 =?us-ascii?Q?WeoKwvr67w5n+hzvpyHaOD4Znx7KgcOFZADED8lsujsJnboxVXsOLF3l1wbB?=
 =?us-ascii?Q?C10C/k90/fhjY7gHiGRSHcGoVEFIi/jvDFUQunsUugVxPIeL861Gifj4q2Y/?=
 =?us-ascii?Q?IZgWV1JPEX2+ftEh36UNfr5i5A14DGhY27FvC3LWs7wszsyk99jMJTHO6xM/?=
 =?us-ascii?Q?Rvrq7op2jk2jEfm+ttI8QKPFl24G0k48zCqZUjFdaHn2RVsY0ItUGveMfJWw?=
 =?us-ascii?Q?pgW22aOUSJiOMvCJq2tzCWDyqYtEJ/zJXUNJhp0fdZhOrthyPOpRj5kFEZuK?=
 =?us-ascii?Q?SwfwTbPHNlmWHjlY1DcJ4aoz5vWlsgM2zER3tPkb9MduXxRsokIlUebJg7LS?=
 =?us-ascii?Q?TdhZU1Y15tZS7Abz35YqoT+vLZYnBYYdDXW2wG8I2H6bubXL3zd4kgYpAq9c?=
 =?us-ascii?Q?fPjFLakHjKVM6NWfCaDzw+79dej/soU40YV8k5+QoGoA8l6p5pQY8Y/HA5XA?=
 =?us-ascii?Q?fvqyg0hJbT48Rr1yGWk51hBgGFJdB6rdLOLprdgDJ7Tp4DZO8fbO3A4IWwok?=
 =?us-ascii?Q?MYIfcDX9SLGfSROmf8j09S557LYR5vlPOvRehTTfAbDDu76HKa/jR1KeylqF?=
 =?us-ascii?Q?ZVfo4VufeGQYz2M9GtN/65ZgzGJl37LXtL+LjdMVBtb7Z45QxtYasSKEVpsn?=
 =?us-ascii?Q?SYFcBPdMOmf5ue7Ttx65pbitRnwkI9fEI7i5DHJui3nQHd7Xa1eIiuuA1FHO?=
 =?us-ascii?Q?DjqXHG9NG9EtMYAnk+T+xdiWHbFd+KQan43dHkdhgR+1p4AbJqHBpEgsExPO?=
 =?us-ascii?Q?Qf1MeCGawqGbpQ9fQor1CBfXaZWv7tG3Lv9qlTRuWeIofCFdbkBSjSUcvZIL?=
 =?us-ascii?Q?9T3SPW4IRza1kQnIt0ltU6K8Blzy1jbYEZBSiDAfeNvIydFa2VF4lNFTWEMW?=
 =?us-ascii?Q?Bz/7YN7i0tOhRJnqv0FAeXctUqR7usv6ypJJ28zagQUhK7v0FyRf+dnsjfmi?=
 =?us-ascii?Q?EY0vKr5YVQjKxoSQiRBZ9VwVbLzTh2FyeEfN5wPQ7iA2YNSNpfTrZZnWKYJq?=
 =?us-ascii?Q?7l2yL39WF5i/nCkYrYSoAoSW8Ctx8w+biYwm9EXUzEXsKRO+zid7Y9JFNEOQ?=
 =?us-ascii?Q?/GACxYo2Grda38Qu+WVo66jyU5vf0soR?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9335
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 72ee3e08-2d45-4b06-6921-08de1573ca3a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|14060799003|82310400026|376014|1800799024|36860700013|35042699022;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w6ZpQ0cq1B67s4buO3Xgrq+B2pKkKHzRdyOmbUWFaqUPKeam4hRlpKR1Y//3?=
 =?us-ascii?Q?FU8DP86WMsPKAryPLMIOZV80WLd5LTf7c5rKKmODl5UpmOrqVXq1bklr213x?=
 =?us-ascii?Q?24tcf6uLe8o/0qH0ucNsC0gAHVHRaHWJvrtXAdYFrWhO5yRWVTTKjkTC6Ize?=
 =?us-ascii?Q?jnopTN4F8KRTUmVhQbmgtvRRCtp1EVq8soSKapOo104eCoGgv96u+4JmEflR?=
 =?us-ascii?Q?rPlsP+OrJ7GBcrKNg1w0ZGAlnLAimPsecedl5v5MO3qUHTVHVLN+7cJ78GiY?=
 =?us-ascii?Q?nN3EqzZRe+7HsiTB84A16btS/o3ogG3zib6jfJK92fBi1hB8IIq5lgxS0Ztw?=
 =?us-ascii?Q?WIENFFqbYTwdcEcj6+nV7ms5Jlt0G46LZuYFXw5SN1jJDX2oyhp344lgnB8o?=
 =?us-ascii?Q?OcGVa3nHW2S+AWS3CvvGDPoZEjX9xn5+AC7VFbHTXeYA4XAkyZhtA+c2K6pM?=
 =?us-ascii?Q?2cxdbYpV+OlrJXq3ijVxPzb3BH/oO82X6e7IVc7DyPWKky+fA+yND1XIi0ft?=
 =?us-ascii?Q?tDrQWd8m6j0es8zgIzH/Ct0+7MAkAv89kpstNZltaMWCzv5Az/STMrH2wfEi?=
 =?us-ascii?Q?BjwqGLWKWWbbVyYPrJ1opYdCc3PHGpJ6FaiSf0nbvKf9DgbvnzkcsryhjseF?=
 =?us-ascii?Q?6vnTrJzwWgTYKKPVJJ49eoUrocQHSkE9+32J9EyAoYlvF6CaFwXcX1yJp/Ia?=
 =?us-ascii?Q?nHHyMqDTQmTOSTOxOo1Bf3GwLvTzNSNLobPzreIrA7b++ZRAvNpqrKyVuZ8Y?=
 =?us-ascii?Q?8zoZ2bVjBk/haMscGSpaJXrdx8hocgh3Mwp1aFSPmtA3OMzsFGAH7UhabGOU?=
 =?us-ascii?Q?P69DL+vjFbQJ4vTdMwUugCzQmW1Hq8t+vJwiiSUqaM2DgyXM/i1ftudqot1o?=
 =?us-ascii?Q?+9ndK8Rfrpk32XNtxtqroLqKwSFBePYRhhna6T5AyrVWNJIC+Ybk/FLtUevl?=
 =?us-ascii?Q?iIahq3Wq1lCKhgTLgX4A/h6nZhZase0c3mCwFkL1MvBiJUftHqIUfRQB/Kx0?=
 =?us-ascii?Q?acOy1EdjHtVS9ShKLuGqcsaaMeFXviPLzajJW8EXJApDPPQ58EFZejhu8DqP?=
 =?us-ascii?Q?+liMxkbAVLS/gtJRuKVR7gQAT308r3f5Un7cfsmSZTL3Uno3tt7MWT8pMnR7?=
 =?us-ascii?Q?9bPZkKt6Q2Wkv2lRr/5FP2R2cNsZ+0RnvEHQz7knmwD4Z+0kL1NZPFne4s1/?=
 =?us-ascii?Q?co3luHjjbmz+0eyGM6AsU9i9/0hWT/gClFbfJ1vyEBBwPTo+79ovrRvXZO3s?=
 =?us-ascii?Q?dcHCirihK+ebKt8Mm5SppE0NW6BqCvTMKhw1YCWJyBAqSWQ2SLi8sPYqXfcL?=
 =?us-ascii?Q?aMW3cKQEP9mHo/owJ38eKJz0o5U3v/KGpizf3uS87OG8aWizXjYR/GtdrdNN?=
 =?us-ascii?Q?2qS24V5qA7uGFLwjC2S/YyQUQG6wFt93dmX3G6Au4Dhwd6VggI86KLZAJpJG?=
 =?us-ascii?Q?CQzjVhp3UgnFHp1PMUQGRSgrp3yGpPAwM3GxRiSY7CIyZTnhXu2oydn0iVq9?=
 =?us-ascii?Q?L4SVwQPby8RxovKGt/b1w1Hx5mXb5p9VAlbyuDLAdPBfegJHD2zVvNWCN6F3?=
 =?us-ascii?Q?8yTTZjN2/F7mUCAABds=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(14060799003)(82310400026)(376014)(1800799024)(36860700013)(35042699022);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:13.2225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ea9ff32-7d56-4b94-8061-08de1573de99
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7E3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FRZPR08MB11218
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

This patch adds the framework for binding to a specific panthor_hw
structure based on the architecture major value parsed from the GPU_ID
register. This is in preparation of enabling architecture-specific
behaviours based on GPU_ID. As such, it also splits the GPU_ID register
read operation into its own helper function.

This framework allows a single panthor_hw structure to be shared across
multiple architectures should there be minimal changes between them via
the arch_min and arch_max field of the panthor_hw_entry structure,
instead of duplicating the structure across multiple architectures.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * merged GPU_ID refactoring patch with the arch-specific panthor_hw
   binding patch (PATCH 01/10 and PATCH 02/10 in v1).
---
 drivers/gpu/drm/panthor/panthor_device.h |  4 ++
 drivers/gpu/drm/panthor/panthor_hw.c     | 65 +++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_hw.h     |  6 +++
 3 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
index a764111359d2..1457c1255f1f 100644
--- a/drivers/gpu/drm/panthor/panthor_device.h
+++ b/drivers/gpu/drm/panthor/panthor_device.h
@@ -26,6 +26,7 @@ struct panthor_device;
 struct panthor_gpu;
 struct panthor_group_pool;
 struct panthor_heap_pool;
+struct panthor_hw;
 struct panthor_job;
 struct panthor_mmu;
 struct panthor_fw;
@@ -122,6 +123,9 @@ struct panthor_device {
 	/** @csif_info: Command stream interface information. */
 	struct drm_panthor_csif_info csif_info;

+	/** @hw: GPU-specific data. */
+	struct panthor_hw *hw;
+
 	/** @gpu: GPU management data. */
 	struct panthor_gpu *gpu;

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 4f2858114e5e..b6e7401327c3 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -8,6 +8,28 @@
 #define GPU_PROD_ID_MAKE(arch_major, prod_major) \
 	(((arch_major) << 24) | (prod_major))

+/** struct panthor_hw_entry - HW arch major to panthor_hw binding entry */
+struct panthor_hw_entry {
+	/** @arch_min: Minimum supported architecture major value (inclusive) */
+	u8 arch_min;
+
+	/** @arch_max: Maximum supported architecture major value (inclusive) */
+	u8 arch_max;
+
+	/** @hwdev: Pointer to panthor_hw structure */
+	struct panthor_hw *hwdev;
+};
+
+static struct panthor_hw panthor_hw_arch_v10 = {};
+
+static struct panthor_hw_entry panthor_hw_match[] = {
+	{
+		.arch_min = 10,
+		.arch_max = 13,
+		.hwdev = &panthor_hw_arch_v10,
+	},
+};
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
@@ -62,7 +84,6 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
 	unsigned int i;

-	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
 	ptdev->gpu_info.csf_id = gpu_read(ptdev, GPU_CSF_ID);
 	ptdev->gpu_info.gpu_rev = gpu_read(ptdev, GPU_REVID);
 	ptdev->gpu_info.core_features = gpu_read(ptdev, GPU_CORE_FEATURES);
@@ -117,8 +138,50 @@ static void panthor_hw_info_init(struct panthor_device *ptdev)
 		 ptdev->gpu_info.tiler_present);
 }

+static int panthor_hw_bind_device(struct panthor_device *ptdev)
+{
+	struct panthor_hw *hdev = NULL;
+	const u32 arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
+	int i = 0;
+
+	for (i = 0; i < ARRAY_SIZE(panthor_hw_match); i++) {
+		struct panthor_hw_entry *entry = &panthor_hw_match[i];
+
+		if (arch_major >= entry->arch_min && arch_major <= entry->arch_max) {
+			hdev = entry->hwdev;
+			break;
+		}
+	}
+
+	if (!hdev)
+		return -EOPNOTSUPP;
+
+	ptdev->hw = hdev;
+
+	return 0;
+}
+
+static int panthor_hw_gpu_id_init(struct panthor_device *ptdev)
+{
+	ptdev->gpu_info.gpu_id = gpu_read(ptdev, GPU_ID);
+	if (!ptdev->gpu_info.gpu_id)
+		return -ENXIO;
+
+	return 0;
+}
+
 int panthor_hw_init(struct panthor_device *ptdev)
 {
+	int ret = 0;
+
+	ret = panthor_hw_gpu_id_init(ptdev);
+	if (ret)
+		return ret;
+
+	ret = panthor_hw_bind_device(ptdev);
+	if (ret)
+		return ret;
+
 	panthor_hw_info_init(ptdev);

 	return 0;
diff --git a/drivers/gpu/drm/panthor/panthor_hw.h b/drivers/gpu/drm/panthor/panthor_hw.h
index 0af6acc6aa6a..39752de3e7ad 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.h
+++ b/drivers/gpu/drm/panthor/panthor_hw.h
@@ -6,6 +6,12 @@

 struct panthor_device;

+/**
+ * struct panthor_hw - GPU specific register mapping and functions
+ */
+struct panthor_hw {
+};
+
 int panthor_hw_init(struct panthor_device *ptdev);

 #endif /* __PANTHOR_HW_H__ */
--
2.49.0

