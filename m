Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69019C0F339
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 17:14:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 770A210E4E5;
	Mon, 27 Oct 2025 16:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="AhJRr6hb";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="AhJRr6hb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazon11013018.outbound.protection.outlook.com
 [52.101.83.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4865D10E4E5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 16:14:27 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=R1sVhnL8/YJg7Du4ZCaxuYAbgyvrqTZdZdPeikKmE7I9xkzAaK2p/12ZAp4WTJztpEDB8yVAjDdkRwudfYcQY1G9Rgx/LLZ5442y3iY5aBXF3KvQgm9rE68hJL/49/SW2IaY7Sa65g/i77H6Ds3Y7Zw3uzVpmxGqQgEk76MTLPLOhBH7hSzOBXrXaUMv1g1EH1sDz6Or9ZLvbITm34e6ksJx+0+PKBBZdcjmRBHNETf1tJTIrExetiQUpiEW4/9Zpe+tPvBfGDZtQOKVkDQyGfnbOH9VGQNLhRxOoVzNgfVG8eiSFyiivOOGMWKnd7nTsrT3Eheg8VloRE+cRyPaHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCae1vctGw5hhAZYeoZBqZQrrYx209cDfUNQcU+TjSI=;
 b=feEuzsukxIwMx17zN/uC89ijvSujPmejCxrFLgCi04h8TBVsNusqaPJJI3cvPLT/K8VRV4YUSn/X11dfqlnR9rHKAKDXeFV6SZmh0yJMpT1fjAimQeP1hUcFX1LzGD84m9Mvz8g8ismtPvguxkqY6rC81g158y4s+YI7bW3+JFrkwGK4Zc+gJ0L3afncixdhAlIp57PpietbafKZEvr7iLBEVgd9msR4RPcGA1vgSBV/lsK/19xmATkRkyajs1sx/AXhI0rlLLcs3/NBTVXeZEHehCOyKompXdebEnnLmwHUNDO1RlRvZ5LFB+6ENq92JlwEh/MH5tHh39yM4UG1bQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCae1vctGw5hhAZYeoZBqZQrrYx209cDfUNQcU+TjSI=;
 b=AhJRr6hbXpSNT06ns9GYGQ99A3O+nmBYkAMP8d+PgDSESEFlEMEK6nxmNzEbQRJHXSGMpAeeCqpIPxzMhHD/AfuK21iBCrwz9cTJTsfXGZXvR+mxmgqw+xFJTjtsLlyldJbYwAxVCs0dV0POUMmVlRgKzVcgtRGQBP9M2Eztbv0=
Received: from PAZP264CA0198.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:237::22)
 by AS8PR08MB10078.eurprd08.prod.outlook.com (2603:10a6:20b:63c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 16:14:22 +0000
Received: from AM4PEPF00025F9C.EURPRD83.prod.outlook.com
 (2603:10a6:102:237:cafe::6f) by PAZP264CA0198.outlook.office365.com
 (2603:10a6:102:237::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Mon,
 27 Oct 2025 16:13:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM4PEPF00025F9C.mail.protection.outlook.com (10.167.16.11) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.0
 via Frontend Transport; Mon, 27 Oct 2025 16:14:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NWsQ1wJ8Ud0hEpxrPJKTBpMZqSD4QzQfc5f79RyXAthepfRHZVjfBlsIPnfLlCHe9brb2Ms2Ptv9Ax75qnOhpY9aUAK699AUVISrPM6i1jI+vBopxrB6e8Nq/HvXa4uH/gRnpV2jJMj0V3+c1t+f1paldt1radS3Gcqo/PRIRK7G4jeTkJHtnRG1jcTQFKqtUotOz8UR6W353vZ1alGIwt4i6kocEzFJFskxDcJB6AU5GWevXPMItTdP7E6QWEot167p2ucRbXgKkOy6vRPfXKo2A4DOZ9GVwhQj99/x5tvUObb1gjXUE7ZIZnvyFOwMdWTNlTeDNDfzswTYTem10g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iCae1vctGw5hhAZYeoZBqZQrrYx209cDfUNQcU+TjSI=;
 b=owsC2Nc8rK3NcBoqJsD4bP4TikrRtz2w4779K9Xqo/YvmqkzXRt3aXN/XWllqvXOGVMdsVIRriSV8yBjLbO0z1X/FYtc4ACJHoNpCLXP+03ym4zR7CSE/j433U0g3bST7NF4hpJvi0Xvcbv0NlmGDyajgStXsVxLiQI0SrISbh1LY78C9qk6ZVQ1BC2E6O3PnE2u9KTMXNH7oplG0E+4j42RnfJEXQPBgwoVuo25IKbqEJUxiluXzSpv2/dH6jHeA1qZe4ku0e7urXlYpSvPx4EoQKAx6BSRn2SgBvPjEXNkjTxoyJgKDPJLZu7M2tEJCnKeIP2SmhDKxchujp1zJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iCae1vctGw5hhAZYeoZBqZQrrYx209cDfUNQcU+TjSI=;
 b=AhJRr6hbXpSNT06ns9GYGQ99A3O+nmBYkAMP8d+PgDSESEFlEMEK6nxmNzEbQRJHXSGMpAeeCqpIPxzMhHD/AfuK21iBCrwz9cTJTsfXGZXvR+mxmgqw+xFJTjtsLlyldJbYwAxVCs0dV0POUMmVlRgKzVcgtRGQBP9M2Eztbv0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by GV1PR08MB8498.eurprd08.prod.outlook.com
 (2603:10a6:150:82::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.17; Mon, 27 Oct
 2025 16:13:48 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%7]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:13:48 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 7/8] drm/panthor: Support 64-bit endpoint_req register for
 Mali-G1
Date: Mon, 27 Oct 2025 16:13:33 +0000
Message-ID: <20251027161334.854650-8-karunika.choo@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251027161334.854650-1-karunika.choo@arm.com>
References: <20251027161334.854650-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0253.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::6) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|GV1PR08MB8498:EE_|AM4PEPF00025F9C:EE_|AS8PR08MB10078:EE_
X-MS-Office365-Filtering-Correlation-Id: bd27ecc6-bc66-4328-805e-08de1573e303
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?9iDYUBgHTdQi/kH6imguu626wv32dUzU5Z7BBSraleNgBKGr3z4/vSz9H67N?=
 =?us-ascii?Q?9Xc1k0hqbySg3OTepudIQcde/8AJwqO8Yu6M6477OIbsryTD4U+FZsrmwMf2?=
 =?us-ascii?Q?LjLo4nNXCUNy+GoclIXzEyy9Agshnsoun57hyI7vrVlCXVOujQjORTYoZTYZ?=
 =?us-ascii?Q?rhWlwTFqyYqI56LEUpuOccAMCXM9bKVMQbyNQSAT8d3uj0zxrLIp7pLnVT5A?=
 =?us-ascii?Q?0Isf1PL86mtn9NqvKIqlP0K+y0KZLHiSKWKeb5kX4mvmJqs7b9ORgwjN9czG?=
 =?us-ascii?Q?gOc6svrjnUbOX1fXWa9si/OaPhfEv41vdJOFQnaCw5ciaB2de7mPFLMJ9lZH?=
 =?us-ascii?Q?50H10SZ9/9jJHckqISWKIy2+JyI/HhbqksojMJtwMdqsTwyb1tJdUGGgFDGI?=
 =?us-ascii?Q?IgdTEoI/OmSeI/AGtt+Ib6oksLXhhba7AzzM6KHowYWvY64RIFDuFfp6xEej?=
 =?us-ascii?Q?+Zi+ewHHicOORFcmYxzfQ20nF1Qc6z9GxEmGmczpCsFyrmr7AjEgIK4hlq5D?=
 =?us-ascii?Q?KN7IdsE2qbPC86jCrwJkJabeCFm5jbzf/nR4hNhnus3Id1J+it9tTqTWOBUq?=
 =?us-ascii?Q?uKWsanlRHXqt5Gym8S13COcjtsAVnzqqwjgNC5s8pTZbW21y6KPOplkVr8hQ?=
 =?us-ascii?Q?/8QzjAdVUxVzwx6fsjqm98yqSI8umprCBQVwBASGFxuK3JYXsuDkS3hvzLss?=
 =?us-ascii?Q?Gdot0N42oBjig8Xjh6AMUaomJaXCsZP90as/h7xdrBdtAFGLoUDabrQzYz/a?=
 =?us-ascii?Q?1pdFFHWXBe2492ev/9kWDmcA0crlSlPzl3rvmTEa2OkGoL2g37G/zEe49h5f?=
 =?us-ascii?Q?P/09XtS9l9wlS062lpHQq1DZMmUzxmnSyXU2WvAo3i2UHrxLrN552r3a4f47?=
 =?us-ascii?Q?AO8nYYcQO6lOQccR08QSYr0UZBOVOcoftXT5+y4qwi5mESCIO+a9CT/mcfmk?=
 =?us-ascii?Q?n0RVzFQSSyPwdDbv3Bqdp3dMtTKlnaHSe2l9xmBqzfQUbo+ftXPzd/+QStAp?=
 =?us-ascii?Q?918nEv7mo35Y0tBMhTFBPZ6dVQMvvROf00bHJXHjeH3u5nSaZEMh57vIBoux?=
 =?us-ascii?Q?+u2/nNgYEc58tWRn0UXlUE5W+7+7ak2Xk1KSh2RsxFa24b0rIIGn0WRdT0ZS?=
 =?us-ascii?Q?OzR1vE6c3NWTm5leV/sDoPY52wmQHqbeUCBnXOgD8m3/gWdUizSX0atjfWfy?=
 =?us-ascii?Q?jJc5T8jnwwMA2g79KoNqtBv6Saq8+b080BwdOPV165kPDsjt1m4eOtI1rRRe?=
 =?us-ascii?Q?wgAAmy69HFiRjyeHzLOmQsyIpwkc6PhAS9DqS/Mn2idgNi1V0KmLM86BFM2E?=
 =?us-ascii?Q?jikXIDs3WUY689XoaeCkLuibTO/FpyhgVS529Ak9ft3U51M+6z1PADvzqr4o?=
 =?us-ascii?Q?ZLVG2Sjklah7h/8Ct7+sWiqaEYOcrkLwLy58Hzag7Ur5kLZ0uFdLLGAAXBOg?=
 =?us-ascii?Q?tWCyjg+hBeWKF6gaZAySycwepZyxMdJP?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB8498
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f568f4e8-b045-4208-8841-08de1573cf8f
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|35042699022|1800799024|36860700013|14060799003|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8xp5YqlfgedDN6vV8l8QnBzAU4EjdbSCTyVzvdbun3Owb31+RloFH+lpxrjT?=
 =?us-ascii?Q?QDV0c2yYcTWi0ArbkU1vZl0U/aLmd1gMR9tky15EHcUuolKBwsR4bj/6cUhl?=
 =?us-ascii?Q?+hcLhKC1YIoGS6RhwWis2wkMUXbpg0Vna0QWyAuK+xJ1ykW/eeWq3S8XweSQ?=
 =?us-ascii?Q?6OH9xUAhFF7H4bwwlCIizJEGgXYRUBlhhXo2YtqcNlQm7YHBFwv/ut9mZKAI?=
 =?us-ascii?Q?G3lzmC1Wz1Su//06AZQ2f0LNHafPoelKBRyJd23FmggEg3j9izxU6L/U7S9i?=
 =?us-ascii?Q?Rvly0XSzgQDvms5DibAzRVBLS/LRcKO89zZFpcgJe9kQJeWV051sjahaj44w?=
 =?us-ascii?Q?JwIxx7sIGvnGJWdsA/65SMwwEI3+lk9pjuoH7DaqPgeCFtVS2pJCQeQbHN8p?=
 =?us-ascii?Q?m6jdgV1LfeDaa3lb2G0FuC1QZNKJE+NQeFxRPv88F7WLt1eXCi4Vo8Mhg33b?=
 =?us-ascii?Q?myH5W5yGnSVZDTJUaIhYEmgFo8lE0vK/l4W6iU34r/IrsP1t61wjojTZ7aDO?=
 =?us-ascii?Q?1hJN2KDB988S3c3zc0zIsw3Ssq6HQNRVYiZmhBsmFec+Y0o+Hk+9bOmfA6LN?=
 =?us-ascii?Q?PvWjRbDLyL1n5P/4yMgM08kIpWgdYvbbJ//uuodnqUn8Rw3ea06ym29MXqmJ?=
 =?us-ascii?Q?NbG+0iLUJpkS14Il2ryk55N6FMv7WRxHGwtxnszKTyfDi1C0fMSuOps5pJwu?=
 =?us-ascii?Q?Ob5H2BkPQAsCFO4V3WuOHKciT/Lrv1oAo7CJe1GukgQbFCV4JgfYcl+Tmm5c?=
 =?us-ascii?Q?YJj3hBgofu4cPPJHUmDOdh1hdFUEQU+prfE32UXbz2U1YPf5bmwOV8V1Wjet?=
 =?us-ascii?Q?+o6S3bd0I15TCPx6SMfs2GF02APGaoW+Z6RIgRp7rosHLpS1mjW+Zq4Iw/ir?=
 =?us-ascii?Q?f1NO9kLn1yAeCS9CQJC131j3/vH2HEiTdg9Pwj4pf1Pcbq/oFc+A2QAV+jjU?=
 =?us-ascii?Q?gvLsPRq8BMHmlyoW8rwXcRY6SKZf4Pa4b6v9+slACv6hj5iMGOVFmxkN+1DF?=
 =?us-ascii?Q?g1bFOzWALxbacRyl7RXUpt6RqSIcUS08cOG9nBQFpA6IixsPD1XifJlMEUsl?=
 =?us-ascii?Q?4YUmlNco9sURiwJTB3866cL+OPaQDdUnMfriVcW8VhmhXnPYv+howJmICLhr?=
 =?us-ascii?Q?eNEQfYbGzbq5/TA8CxJ6weij1KpcF08+BE6STUYetpnBBzPQ0mpqjcfFlk4V?=
 =?us-ascii?Q?XgUZH0EqbaVCqYRn/8C5FCK0SZQXCqjrWHqdmtpX6e6d5HztILk+QnCEmkYd?=
 =?us-ascii?Q?rBXpXi/yUSMJz3tboR+01Zlzlxb37mV6iDlyWLJRBCjBo9kB3tw3I7Efacso?=
 =?us-ascii?Q?nRXuLcolB6r048ubcII4/5tiVhsD3nkm6MVrn6Wea4lSCnOtXC4aYKzA3e7e?=
 =?us-ascii?Q?AIg9VVqAPb7VkM21ZqjNhCpnHx+Uc33mKcQlwDoMRlqNhfZNFK0wPuBROJtj?=
 =?us-ascii?Q?SHu9pvzeYB02OxyhSTMIISG97pT5k2GpU5ao9UctywUFIEXeoxdlfdoniBN3?=
 =?us-ascii?Q?wj7iH0UDBJ/z0bJKMIq9IixLq7L36LkGwFIh3w2Oawq93N741QJgPgs7pb5Z?=
 =?us-ascii?Q?E7ctTClAVnB/7AaZlX0=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(35042699022)(1800799024)(36860700013)(14060799003)(376014);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:14:20.6372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd27ecc6-bc66-4328-805e-08de1573e303
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00025F9C.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10078
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
endpoint_req register, ensuring correct handling on both pre-v4.0 and
v4.0+ firmwares.

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
v2:
 * Wrap the CSG_IFACE_VERSION checks for v4.0.0 with
   panthor_fw_has_64bit_ep_req().
 * Removed wrongly included code from previous patch.
 * Reordered CSG_EP_REQ_PRIORITY_GET() and CSG_EP_REQ_PRIORITY() to
   reuse CSG_EP_REQ_PRIORITY_MASK definition.
 * Updated panthor_fw_csg_endpoint_req_*() functions to accept CSG iface
   structure instead of a CSG id.
 * Update endpoint_req variables to u64.
 * Minor readability and code quality fixes.
---
 drivers/gpu/drm/panthor/panthor_fw.c    | 36 +++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_fw.h    | 25 +++++++++++++++--
 drivers/gpu/drm/panthor/panthor_sched.c | 21 +++++++++------
 3 files changed, 72 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index fb1f69ef76fb..2ab974c9a09d 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -325,6 +325,42 @@ static bool panthor_fw_has_glb_state(struct panthor_device *ptdev)
 	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 1, 0);
 }

+static bool panthor_fw_has_64bit_ep_req(struct panthor_device *ptdev)
+{
+	struct panthor_fw_global_iface *glb_iface = panthor_fw_get_glb_iface(ptdev);
+
+	return glb_iface->control->version >= CSF_IFACE_VERSION(4, 0, 0);
+}
+
+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		return csg_iface->input->endpoint_req2;
+	else
+		return csg_iface->input->endpoint_req;
+}
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		csg_iface->input->endpoint_req2 = value;
+	else
+		csg_iface->input->endpoint_req = lower_32_bits(value);
+}
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask)
+{
+	if (panthor_fw_has_64bit_ep_req(ptdev))
+		panthor_fw_update_reqs64(csg_iface, endpoint_req2, value, mask);
+	else
+		panthor_fw_update_reqs(csg_iface, endpoint_req, lower_32_bits(value),
+				       lower_32_bits(mask));
+}
+
 /**
  * panthor_fw_conv_timeout() - Convert a timeout into a cycle-count
  * @ptdev: Device.
diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
index a19ed48b2d0b..fbdc21469ba3 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.h
+++ b/drivers/gpu/drm/panthor/panthor_fw.h
@@ -167,10 +167,11 @@ struct panthor_fw_csg_input_iface {
 #define CSG_EP_REQ_TILER(x)			(((x) << 16) & GENMASK(19, 16))
 #define CSG_EP_REQ_EXCL_COMPUTE			BIT(20)
 #define CSG_EP_REQ_EXCL_FRAGMENT		BIT(21)
-#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & GENMASK(31, 28))
 #define CSG_EP_REQ_PRIORITY_MASK		GENMASK(31, 28)
+#define CSG_EP_REQ_PRIORITY(x)			(((x) << 28) & CSG_EP_REQ_PRIORITY_MASK)
+#define CSG_EP_REQ_PRIORITY_GET(x)		(((x) & CSG_EP_REQ_PRIORITY_MASK) >> 28)
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

@@ -473,6 +484,16 @@ panthor_fw_get_csg_iface(struct panthor_device *ptdev, u32 csg_slot);
 struct panthor_fw_cs_iface *
 panthor_fw_get_cs_iface(struct panthor_device *ptdev, u32 csg_slot, u32 cs_slot);

+u64 panthor_fw_csg_endpoint_req_get(struct panthor_device *ptdev,
+				    struct panthor_fw_csg_iface *csg_iface);
+
+void panthor_fw_csg_endpoint_req_set(struct panthor_device *ptdev,
+				     struct panthor_fw_csg_iface *csg_iface, u64 value);
+
+void panthor_fw_csg_endpoint_req_update(struct panthor_device *ptdev,
+					struct panthor_fw_csg_iface *csg_iface, u64 value,
+					u64 mask);
+
 int panthor_fw_csg_wait_acks(struct panthor_device *ptdev, u32 csg_id, u32 req_mask,
 			     u32 *acked, u32 timeout_ms);

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 0cc9055f4ee5..d6f5efc10312 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -1139,11 +1139,13 @@ csg_slot_sync_priority_locked(struct panthor_device *ptdev, u32 csg_id)
 {
 	struct panthor_csg_slot *csg_slot = &ptdev->scheduler->csg_slots[csg_id];
 	struct panthor_fw_csg_iface *csg_iface;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

 	csg_iface = panthor_fw_get_csg_iface(ptdev, csg_id);
-	csg_slot->priority = (csg_iface->input->endpoint_req & CSG_EP_REQ_PRIORITY_MASK) >> 28;
+	endpoint_req = panthor_fw_csg_endpoint_req_get(ptdev, csg_iface);
+	csg_slot->priority = CSG_EP_REQ_PRIORITY_GET(endpoint_req);
 }

 /**
@@ -1303,6 +1305,7 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
 	struct panthor_csg_slot *csg_slot;
 	struct panthor_group *group;
 	u32 queue_mask = 0, i;
+	u64 endpoint_req;

 	lockdep_assert_held(&ptdev->scheduler->lock);

@@ -1329,10 +1332,12 @@ csg_slot_prog_locked(struct panthor_device *ptdev, u32 csg_id, u32 priority)
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
+	panthor_fw_csg_endpoint_req_set(ptdev, csg_iface, endpoint_req);
+
 	csg_iface->input->config = panthor_vm_as(group->vm);

 	if (group->suspend_buf)
@@ -2230,9 +2235,9 @@ tick_ctx_apply(struct panthor_scheduler *sched, struct panthor_sched_tick_ctx *c
 				continue;
 			}

-			panthor_fw_update_reqs(csg_iface, endpoint_req,
-					       CSG_EP_REQ_PRIORITY(new_csg_prio),
-					       CSG_EP_REQ_PRIORITY_MASK);
+			panthor_fw_csg_endpoint_req_update(ptdev, csg_iface,
+							   CSG_EP_REQ_PRIORITY(new_csg_prio),
+							   CSG_EP_REQ_PRIORITY_MASK);
 			csgs_upd_ctx_queue_reqs(ptdev, &upd_ctx, csg_id,
 						csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
 						CSG_ENDPOINT_CONFIG);
--
2.49.0

