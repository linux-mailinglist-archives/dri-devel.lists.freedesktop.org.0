Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AE8BB10A78
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 14:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B8B10E1FC;
	Thu, 24 Jul 2025 12:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="OQzrbVfM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="OQzrbVfM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010035.outbound.protection.outlook.com [52.101.69.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B04710E1FC
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 12:43:12 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=WlZa9fq1H41gfNkvgDzMCKTrHQafDHgkhBcIqIn/sM6YH0koKTGhj3TK2tU7XrbRYv1OjhTrFffpQT1xXV4wTzXmEpz/nr4pjoDNPaWq928MZtpf8+FUaYFhIQ4aOPplv0zNWdH06Kvw2QTjfMFATEiEmZBGZtiHsCP+ozV7FfzNUCYxCn4P+LXWAEJS72wOdf8a5IytDwkjdcPwQ2xw87KUuFvqyxP/mW1AmVpSrIGpAPHa+/rQGxYfQ5ZXNxyFh/LC4gxGIvM+sXNC68ya3dHLFM/IegQkCrzS+2KegyuCdnhJHJZU3nwSgHSd28gj1fDbQgo85d1/OiMjhVsMLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=IR2J454+fVYrOOJu8BElzmmdQTihJnum+PaG8UVKxNq+FLuilJ9x7vF7IM0iFEOeyVWx3aVxwDSt0rLMGCSJD10y9OPWwFQBAxCsGG7oHfHM8pmH6kAtb3xrk1YwV4qT6huoJMz0q8vp1SevwrFOgvo42jQvfw/4StdjkPhpTlHDKrAPv3IH7A4BwGnDfwXR1WTKKUHym7ErZLxuGF+6WcBxEqKCtbJDC2pyIcctYOAgd4/ZIrTUkMXGX7D6cZH4iVrnRI/2p/E95BiLLOBFR5VNLQBaU2kZNSgR4vG4zQHcpVNFw2OT4CprIPQ8oa0cmEarHGKF5vqYSTVYnNLPyg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=OQzrbVfMe8fZzdsgLiBicex99+p0L7mZkCi6csbrzYtw2eUh7nKiAr4B8sHwXfvpqqNjOyvqjmG/CfUI9ChZulLbjo1zuBx+6GXvyCZffL0ZsBiwo9uqiVWpRg2I4RsY+QTVNx5NljHTcgwxH5anZFHy2z0TaF9/AC7mzSF6LqM=
Received: from DU2PR04CA0346.eurprd04.prod.outlook.com (2603:10a6:10:2b4::33)
 by DU4PR08MB11029.eurprd08.prod.outlook.com (2603:10a6:10:577::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Thu, 24 Jul
 2025 12:43:08 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b4:cafe::c7) by DU2PR04CA0346.outlook.office365.com
 (2603:10a6:10:2b4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Thu,
 24 Jul 2025 12:43:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.20 via
 Frontend Transport; Thu, 24 Jul 2025 12:43:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edRAejb7jFMiDC3BT7YykDKHKe407b99EgzDd82xRjHeYA45iWJRBPqkFn63jJx1QYypYLRiKWJ+RIKqe42d7N9XdzzZxYQfye7B2wT/Fc26ETYpUY2wwJP7KgQ6oejJTpFul83qIJwoaSnSNIvyusG/U/KERl/eEvkQuEd7jOW+9zyCnAEJR7gJi34aWQFgbCBZ+2m4ZDMZHBdg2zgp6VHJ7zn1rLY9n/Dp4RxgvyVJvplFU/Lbx4I3t8E+NE7mHnFcly4kDf0bGmay0tc2deEb9fwCUZiVFTyvI2WWWJMH2eby3KHFSdahkOoXLq2KC7yTHXkp4uuAIz6WRtSG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=zLL7JDGdsi/P7i/LD3jMO7VaPyzEwQmzyUzBjU5BbeSek4Qk1hbdKKIBuAT71bIFVqDcXB8u7NSn5S/nmhn1Zqat+Gos6suuu+jnN53w3akX/J2+qo8/WrHi9PJmgEQKomdAlp0UFflW9C5Ag1esLOTBJDL3dPPOE/AkglZdsbbHyGnqMbAjwWM7Jza1VkZar+7mOKP2aloGDv5gifmaXvJIAWpwt7tlNTFcNh9wtwZ4uVk2M3JThrvDmH0LN2T+XvaloAy6JiL1//fCYE7XgQS0F77Gdjix0HdyJS0C7WZnyRwVPBM5vnO6PudW9DJ1iNPEegEyZ1BwWfyJSUjeyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=olrCtt/Jc/BYZMAJJcGgK7N2XyUhPzjhKdJH/GOKCuo=;
 b=OQzrbVfMe8fZzdsgLiBicex99+p0L7mZkCi6csbrzYtw2eUh7nKiAr4B8sHwXfvpqqNjOyvqjmG/CfUI9ChZulLbjo1zuBx+6GXvyCZffL0ZsBiwo9uqiVWpRg2I4RsY+QTVNx5NljHTcgwxH5anZFHy2z0TaF9/AC7mzSF6LqM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16) by DU0PR08MB8496.eurprd08.prod.outlook.com
 (2603:10a6:10:403::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.22; Thu, 24 Jul
 2025 12:42:33 +0000
Received: from GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90]) by GVXPR08MB11183.eurprd08.prod.outlook.com
 ([fe80::3bae:b721:e01e:9c90%5]) with mapi id 15.20.8964.019; Thu, 24 Jul 2025
 12:42:33 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Chia-I Wu <olvaffe@gmail.com>
Subject: [PATCH v8 2/6] drm/panthor: Simplify getting the GPU model name
Date: Thu, 24 Jul 2025 13:42:06 +0100
Message-ID: <20250724124210.3675094-3-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250724124210.3675094-1-karunika.choo@arm.com>
References: <20250724124210.3675094-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0043.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::31) To GVXPR08MB11183.eurprd08.prod.outlook.com
 (2603:10a6:150:1fc::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: GVXPR08MB11183:EE_|DU0PR08MB8496:EE_|DU6PEPF0000952A:EE_|DU4PR08MB11029:EE_
X-MS-Office365-Filtering-Correlation-Id: 5463c30b-9217-4d59-0f36-08ddcaafa2de
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9Q3EyM73qlPM5+7bc7ifMd7BSKHefzQ14TBpKWtY7CjVKlK7/x79OVAj0d5U?=
 =?us-ascii?Q?FSrmbr2l2kAzQ9K0F7kCoIYuSFOsNp1JST+ZNEcpXZDz8GHn05pIxtZH644V?=
 =?us-ascii?Q?nyzoyZqBlwg4UcD4PkX3vFeNJSnz8GvgCDLjhDj4d/QuNUMkls+8f0Zlz+Nz?=
 =?us-ascii?Q?n1xnt/2ToY09KCUiBTZoQbRQXYOg2PJPYYwCj/Lidnwb7tQ8vZt6IyGiEu/s?=
 =?us-ascii?Q?TEiwp1N9sv5MnOBrqwyWi/z21uFQACdCA2AEz78kgmV0uA7hNjwZe6vPtv6A?=
 =?us-ascii?Q?VCM5GFjfcvRFBI5iSHFLkig7VLgt5eUiT/nRnPu4zf2aWaDffcrR4INpheY5?=
 =?us-ascii?Q?0O51a9nPgPayfuQ0Km9ilkSSZj3ENNKzv+BPXG2WmKwEVV9QMwafHqXh4DP0?=
 =?us-ascii?Q?ok6U/Ae7wyyvVGAudwP91ET0I01seJRbWvADXwDc/+AUXfO4uzh8NVntzZni?=
 =?us-ascii?Q?yV0K8sWJwCKT2aBvYB7pm4kmoZYjq7wWzKtttViaQSbV9U9A1Rv7sgc4HJWK?=
 =?us-ascii?Q?Uz/iO/QzcR7fk0oglxqqgUgmfsv3ouXTl05MIYRK2yM/wApAoG4wfZbMF1it?=
 =?us-ascii?Q?rt7H6ByvToReItqC+9V9NcYsf9rslRmbUE1ImbHcI/OdTarikclXxKLFKRUc?=
 =?us-ascii?Q?ViOBdAqBV74drhJfT1FHh0rm6axkHWMcoCgnW/gsOD5vFCtp13G22XsWh7QN?=
 =?us-ascii?Q?Fouohvy+flT79sh5HFg9SKn7GtIBBDOXQNjbMRU1k5MAqFVrR1UH4AIkcK8F?=
 =?us-ascii?Q?hKy5WyuaErJAmnK0n8zfUUHNIUfpQwYYwCYCm0hzUZhCgMC+/W8ofFg6eKDc?=
 =?us-ascii?Q?QdrzQnvPVPVOOOi3/4B0w7/5BVBzrLoQ2bMWR7oEW/BU0dx8E61X6Qv1M0av?=
 =?us-ascii?Q?N+OmHm/eaphn9P3psKcKnBO4ewxFVVcoNkGI7+kZkyP/Q0ICgvs5qXe1Uqod?=
 =?us-ascii?Q?XjsgUT/U6Vrh7j6JYUB+fW8lmn/PbeZurnyjqpBXJzq5p1pE9r+PgMtOF9vp?=
 =?us-ascii?Q?rfkA3kLsI/ktx5fjrlNn6IwbAJjKv5b7e0k5iEOL/W+HTzeLT+5mrgrHGe/7?=
 =?us-ascii?Q?BFrsse94XlEaG6Ewyvp3t+jYXQc+FDMIVdnk2clFfLCH/IVrWSg5FDUPwYJO?=
 =?us-ascii?Q?tuMHRdEVuqr/VE1FAIhOJscpWhp0C4h2utu+45FqBpZwBU6/fy9cxqog5+ZM?=
 =?us-ascii?Q?uoQoJHbyhxpz5EaG+LhLf17hR+w8yYJoX7LwNh2q15KNzMVne3y39q82V64D?=
 =?us-ascii?Q?cObLgQhbN1JiGDKkC2gZqy6SQL/DhB0hyDDHwCb3e2DwmU4WrF3SlxDM3g9l?=
 =?us-ascii?Q?FgFVfHhFOYifJT0hGwYq2q6Ybp3H1DP+VqwGqtY7ene96NPtgpIeOTSVGH4M?=
 =?us-ascii?Q?ZpbH3VSf4RFymQFIVsQefCA/EEB7rDQ7q0g4L54wy3UIwQXvHvEBuV/tJdkZ?=
 =?us-ascii?Q?TiZozFw1Rn4=3D?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:GVXPR08MB11183.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8496
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: a685575e-82ca-4333-7fc9-08ddcaaf8f4e
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|35042699022|36860700013|376014|14060799003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lBkll/PCsu4g2uqosYcTBqRMRQLG1S+A7Rvk2ptXjTW0/zSMlB84edlxZd83?=
 =?us-ascii?Q?x9ESRjudV2XZXCJk0dyVjxkQNWeSKBH4ujoVm+a4oyWXxkuhEawyUZD4ydn4?=
 =?us-ascii?Q?JaTs819Oxaup/mh2YqZ8p2B5BfhcpnVO7kRpGHHPEh4y9a0nIptSlQPvfhc0?=
 =?us-ascii?Q?4quuC3QgjVHnWruXeqAPMoSvgzYztWKSorxyV1P8gNcH89pAZcFhZlTpDrQP?=
 =?us-ascii?Q?nK3ZooTFHr3Au1oJfpBgTR8t7i4O133DP4rOaJ17R0AfOoH2ClSbeyIjTu0+?=
 =?us-ascii?Q?z2cC4UhN/n7d8hMmVC22Bfwa0FXS0zODe77Pb4kyVUoL/0xkcQcPl3ukgPj6?=
 =?us-ascii?Q?Ixg4hrDuxc33ATa16YUoEr7JaaNQlTI++KpoyC9K8S+1elaHVsypokqoOCXP?=
 =?us-ascii?Q?3ByjDS2esDONiQuRvVc2A1dmlPL/jnmcm/SMAtiGrj1yzDD8oy+/jsVXjmOe?=
 =?us-ascii?Q?JqhmgkYnBlt8aIFt+gvY6V5bFeHHdcu8kKuba9LPJBqEKa1b094FMOFc7Ozq?=
 =?us-ascii?Q?o0psl9Yc3YzfbWWs6dIUEtm9sXpehaQOq3ObkkNbR2n8/oMUujXOJ32F2dgu?=
 =?us-ascii?Q?o/wHDbVl2XYPXXTwWkXt42no5HwdAfMNTqYNYMYcZHRpAyTdG4mYfQonmGIr?=
 =?us-ascii?Q?Hit5wovhFh4PSY3/jCnI3/OW9PTrD7T7/W6Fj3mL5rzDfVg+BhlC2a7oBDGF?=
 =?us-ascii?Q?sW7jINzVrFy8Plv4DYCOur6QZiswSLMFvZsUxEk3Y+am+f3BrKYLB8Ux1gMb?=
 =?us-ascii?Q?QhFTKLRO9bC8i6Ka+ETLC4O1l+Y8Xz60o3z8JFsuulXlAI4JWK51jWyW+Anj?=
 =?us-ascii?Q?ZTsX637EZ9d4qqs0pQSSJM43WcJzshM8hW7uWYcYZzeihm1gWZhmELP7wDMU?=
 =?us-ascii?Q?n8sUM6zZiq8fPOwpiuAioZjgD4Apzzvlz6aKrugtaVxBmjqmBdHNTN4+DOvm?=
 =?us-ascii?Q?fFbHaPB5rHjwbJ/1FOC9ixa+oURs/0sStxKnDENeD4GmJOj+MP5PSd41Y7px?=
 =?us-ascii?Q?6ufJTC94x++uvQr7Nhw6nF9pxUf5nQ+O9PLG5eHJiXjnR/XODKBzluEdhOYV?=
 =?us-ascii?Q?ncqRAfvYWUSTxBtQLbzf4FiK/FsmRpL8ZgONJB0ctA48zeH5LC87qvZkqs4N?=
 =?us-ascii?Q?PrZcBs19+XULrDVVTqHPMyoYMUTi92oj/hYEmApV/pyWXId/XAAUv8tlJ6wK?=
 =?us-ascii?Q?mbkyRajzoebBTdXravtwDnWWahQMUO0GQIUI+JIWA/F82z4YVlndjXSjUxEo?=
 =?us-ascii?Q?30lwIPPT5OoLsUS1E2wpx+8d/M/CUllws6B6upOgoUvlH/mbYsZrAPbcYlda?=
 =?us-ascii?Q?UL8bYsT00TwdiXckQbNn4Xcp1udaRbZ4T0kUPD0YBYsj6Q6g3W5O7WIcwtsn?=
 =?us-ascii?Q?GdmIXh2SViuDzrAhAzaatdcgfeuAzdN86Ng4HBaQk89nTv5sKG1+vjsqnfle?=
 =?us-ascii?Q?xq9V9V6raDr0V4IVjpDQ87Gmr/h9UCyCdH0NLeSVwjekQ3Uk6m2wnnE4+xQB?=
 =?us-ascii?Q?x5SwhHHFxdhuaqMvTIpd6cxm8STynbjnvxBp?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(35042699022)(36860700013)(376014)(14060799003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 12:43:05.6012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5463c30b-9217-4d59-0f36-08ddcaafa2de
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11029
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

This patch replaces the panthor_model structure with a simple switch
case based on the product_id which is in the format of:
        ((arch_major << 24) | product_major)

This simplifies comparison and allows extending of the function to
accommodate naming differences based on supported GPU features.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Chia-I Wu <olvaffe@gmail.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_hw.c | 61 ++++++++--------------------
 1 file changed, 17 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 94f170a8e5c5..6bff69fd247e 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -5,39 +5,22 @@
 #include "panthor_hw.h"
 #include "panthor_regs.h"
 
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
+#define GPU_PROD_ID_MAKE(arch_major, prod_major) \
+	(((arch_major) << 24) | (prod_major))
+
+static char *get_gpu_model_name(struct panthor_device *ptdev)
+{
+	const u32 gpu_id = ptdev->gpu_info.gpu_id;
+	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
+						GPU_PROD_MAJOR(gpu_id));
+
+	switch (product_id) {
+	case GPU_PROD_ID_MAKE(10, 7):
+		return "Mali-G610";
+	}
 
-static const struct panthor_model gpu_models[] = {
-	GPU_MODEL(g610, 10, 7),
-	{},
-};
+	return "(Unknown Mali GPU)";
+}
 
 static void panthor_gpu_info_init(struct panthor_device *ptdev)
 {
@@ -68,27 +51,17 @@ static void panthor_gpu_info_init(struct panthor_device *ptdev)
 
 static void panthor_hw_info_init(struct panthor_device *ptdev)
 {
-	const struct panthor_model *model;
-	u32 arch_major, product_major;
 	u32 major, minor, status;
 
 	panthor_gpu_info_init(ptdev);
 
-	arch_major = GPU_ARCH_MAJOR(ptdev->gpu_info.gpu_id);
-	product_major = GPU_PROD_MAJOR(ptdev->gpu_info.gpu_id);
 	major = GPU_VER_MAJOR(ptdev->gpu_info.gpu_id);
 	minor = GPU_VER_MINOR(ptdev->gpu_info.gpu_id);
 	status = GPU_VER_STATUS(ptdev->gpu_info.gpu_id);
 
-	for (model = gpu_models; model->name; model++) {
-		if (model->arch_major == arch_major &&
-		    model->product_major == product_major)
-			break;
-	}
-
 	drm_info(&ptdev->base,
-		 "mali-%s id 0x%x major 0x%x minor 0x%x status 0x%x",
-		 model->name ?: "unknown", ptdev->gpu_info.gpu_id >> 16,
+		 "%s id 0x%x major 0x%x minor 0x%x status 0x%x",
+		 get_gpu_model_name(ptdev), ptdev->gpu_info.gpu_id >> 16,
 		 major, minor, status);
 
 	drm_info(&ptdev->base,
-- 
2.49.0

