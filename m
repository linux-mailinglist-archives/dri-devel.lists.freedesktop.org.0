Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44729A6A4C1
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 12:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73A110E5F1;
	Thu, 20 Mar 2025 11:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="VmU7/wtf";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="VmU7/wtf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012035.outbound.protection.outlook.com [52.101.66.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B3F10E5EF
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 11:18:21 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=Ta9XDRcA7DSc2d6jhbDfH4edeXzV3J00MeWzM8+fqA7+I+RnnGj0iwJZRDyFY7rMZhJEIICv9Ssa966bXEeIrBS0jY5gwkjS6Sx2QgjvFRtIGuREyQcm7VIrIv4GUhvpVRUHNOPe0+1lwKGYHJcT7zczh2REvVZhijgctm9lx8og79Io/D/nyXXcsS4J0FMsxTNCyUHcI3qyo5OSN+94vyhVeGZrPpB/iL10dZaJ0MuAVwwwtwgM3xdhW5+cGEL4yMtXn6QEWiD18wjzUlLY5ZUgUfzCqpkVguGjH7B7aUGKXoF7ZB7RZMw7bYW2idTsX5gLn/rHvdv1VD4/KjYZsw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2G4dnHPG+/Jbtvg6WwpbH7GZ9NIWomafe+0TBZXYf0=;
 b=gCOdy+wMo8s4XT/du88FXH1vtfSRKc5DUsCFo1o20m3FWnMVio5FC7GjKbdrFk7xOKZUORy580ELBfxWdel/4J+k0tLbZWFfhfk8DiqdZIGFQTOrO86ERCMfKxbO1Bt7OWSXAAFk8JNeItxPPB0CmGeFpj8aqbvIu4dErQwPpETPYulVO0zReuLdSqqosyWYTZWz2GTndiIqv3Bd+3DyMTdp1b/WsmnkgVV+JOQL3tHk+wBrx1PA4atE3pWAeH8lfC+O+67fs6cXApXHW6BHFYQsJ6+uRMtUpiz+s41bsUO79a8ibU7WobJMHv9AWkJo8j4wEWfpCFyN0l7q1SL5Bg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2G4dnHPG+/Jbtvg6WwpbH7GZ9NIWomafe+0TBZXYf0=;
 b=VmU7/wtfsxygXGR39vBasoS0S+ri4ZMNf7IA99m82YLd7cs6JiNegzKfs3UbqcWmJEoYD2qhrfF9xs/w3jFFAN4bLN4tQOtLV6RDEaHLcsNxvyQOOzcggm3dZ5UpKE/mXs0ycDrYXIuFAywmT8LUlNHWveyhUg9vNayMa9poZYc=
Received: from DU7P194CA0001.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::16)
 by AS4PR08MB7688.eurprd08.prod.outlook.com (2603:10a6:20b:507::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 11:18:17 +0000
Received: from DU6PEPF0000B61E.eurprd02.prod.outlook.com
 (2603:10a6:10:553:cafe::f5) by DU7P194CA0001.outlook.office365.com
 (2603:10a6:10:553::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Thu,
 20 Mar 2025 11:18:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000B61E.mail.protection.outlook.com (10.167.8.133) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20
 via Frontend Transport; Thu, 20 Mar 2025 11:18:16 +0000
Received: ("Tessian outbound ed5a7291b0f8:v597");
 Thu, 20 Mar 2025 11:18:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 457d5d99dff2f2eb
X-TessianGatewayMetadata: gwiPtrxeC3A+4lKXFsalqXJHQiC0hVyDYnYZtPQ/FlTxvafxRErMoYYJajleu6wXPyUILtDrTUCfKh953E66WSeRJVNzgYrTaVYMMz71C1cparlo9YQvh8xFVgUhwZC4m/yjClV8UI3Dfy4eY0Dxd3O2V3TlYR+8D6Y1Kx9oxAE=
X-CR-MTA-TID: 64aa7808
Received: from Lb4d8711e3bea.7
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0369B50D-4125-483D-9009-3E51DA6236E7.1; 
 Thu, 20 Mar 2025 11:18:04 +0000
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 Lb4d8711e3bea.7 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 20 Mar 2025 11:18:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FT89JDMVmYlC/LiIWsrfr9nh14V3YcKwzuBvmkbc29t8cEe39IHuLDK8CbmfUuJH/mj2EYnGC53txanZTRsug0S2Q7838spnI9dfiFFma+7kSWT7z1suhrl1q8ibNHjDgGnhY8jgz0BhcKwMS20wSL9x/gOxEYKE5obvBQEVLczgSU9sjY947TUkSseTl3SQbEgfk74vO562a3fGbEhuXepup1glj8kgVXlxu48TaKh8RcAJFqn0eYIahx+vLgu7QZV/fhtdvaqTF7IONRlNguI3PzhcNB3cVPxOfmL+Uvul6lvzjd5wp+CFMCjI5bkRmmVL1y2P3euFYLEwt+5yBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f2G4dnHPG+/Jbtvg6WwpbH7GZ9NIWomafe+0TBZXYf0=;
 b=VduVFcWiU8/IgPTuccESf8O8Mc/1JtS6iK4SFo7joJO8T6vzbQq+VngVRdWufrYFvg7eKpzFa61CVi7AsfSyZFcrI+4NjBEEvKY+XYoP1aEQMweabt8uR5Y1dFwJ80WCIVn53hWWV4tUasaO1pdyebI1dubi0I8SpQJuuUsThzp3g7lD8gFtsNXxwnhTjSc60mAtFAYiiQKmPV1tSKf+NZKFjZhF6Ccs0isP2g0Gb8QYTlpVdhr/y+Mnq1WSOfkth52hxU9s5hYnZdLQXBe58p6mXFSp+mvZPHJUUTdOtcyrTBW/U1v7y3x+cvJS0bSCeq/fqN6wsDITzOzFj0ra0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f2G4dnHPG+/Jbtvg6WwpbH7GZ9NIWomafe+0TBZXYf0=;
 b=VmU7/wtfsxygXGR39vBasoS0S+ri4ZMNf7IA99m82YLd7cs6JiNegzKfs3UbqcWmJEoYD2qhrfF9xs/w3jFFAN4bLN4tQOtLV6RDEaHLcsNxvyQOOzcggm3dZ5UpKE/mXs0ycDrYXIuFAywmT8LUlNHWveyhUg9vNayMa9poZYc=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18) by DB9PR08MB6715.eurprd08.prod.outlook.com
 (2603:10a6:10:26f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Thu, 20 Mar
 2025 11:18:01 +0000
Received: from VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74]) by VI0PR08MB11200.eurprd08.prod.outlook.com
 ([fe80::d594:64a:dfc:db74%5]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 11:18:00 +0000
From: Karunika Choo <karunika.choo@arm.com>
To: dri-devel@lists.freedesktop.org
Cc: nd@arm.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/9] drm/panthor: Add support for Mali-G715 family of GPUs
Date: Thu, 20 Mar 2025 11:17:38 +0000
Message-ID: <20250320111741.1937892-7-karunika.choo@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250320111741.1937892-1-karunika.choo@arm.com>
References: <20250320111741.1937892-1-karunika.choo@arm.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0212.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a5::19) To VI0PR08MB11200.eurprd08.prod.outlook.com
 (2603:10a6:800:257::18)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: VI0PR08MB11200:EE_|DB9PR08MB6715:EE_|DU6PEPF0000B61E:EE_|AS4PR08MB7688:EE_
X-MS-Office365-Filtering-Correlation-Id: 05af1d02-4e28-40d5-7400-08dd67a0e986
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?Uprzjcj9Q3ph6vbnwU3kXRbsok/B8JdvWgJ6Psv+tGbDIh+Iy+JLdBMm9k71?=
 =?us-ascii?Q?wECTxmHpfXds4sP81DA5aZvV9d3R2YP22/EtGk+va/3QAy853GBRF4vvzgbS?=
 =?us-ascii?Q?g5B4HhsmYI/OkzOGerpjmF33fbZaeSXa/jqKO4VPWLs2EYwOP2fC+66v3Jva?=
 =?us-ascii?Q?64dV+jLmnvMkU6rHcka8gCEbLI5I2BUaXdD8aUlkwgL/QFy5/af0WHzDQAYN?=
 =?us-ascii?Q?mqr8F4l2n3AAHJeduDDjm2SfRd1vduXnmQf8FX3ZKpTrjTzhCA+g/4+CW0sK?=
 =?us-ascii?Q?2vnhriS2xbZx4ttnNneJ4fwwLHAkxk+bi+FTlqnp0uYdBpEXBnN1XA2MEuYM?=
 =?us-ascii?Q?g29QfJlz6ppj9CazGUhLUF44MuS5Ph4yP8jCeII+0vvZQiePNwFlAwAv/XFX?=
 =?us-ascii?Q?Es7BfPYYjq2qxlg0xOG0J03k6mOyknNk+XTDWwJ1poJE9pihA6M2FUHkwK3Y?=
 =?us-ascii?Q?O/bqvpHksNrPGBLZPZcwbGOCp3n0vG489/LycQFSo8Ho4VM95cHcuUR6/jlk?=
 =?us-ascii?Q?6MfdqPMcrRlF8f0l8sDGrQJcvxzEcsP3cFEegwn0LpKG6t/eTtdNI+I9M+eh?=
 =?us-ascii?Q?0+hAdbmBeugXYwq5UfEBFAB3D22TQNzl1e8e7o6Ywp39UhJrhghCsOutYOm1?=
 =?us-ascii?Q?BJPNAP/MxrCYPtGatATAUcaqkEWkXjGjpJWv0dWUH8BaVSqFLSsagqlKksdP?=
 =?us-ascii?Q?4xnVba0CuQL+poB5cUEEWX5/iv26Kus03cI+WFQqPki5N9SIc07UXr7cRQC+?=
 =?us-ascii?Q?dGU6UD5sKggdsM7/58ZcDWLIuMesRIux4oJK/e8fLSsuThly9eAdUMpWAItv?=
 =?us-ascii?Q?Uw4mXzZp6/sdTmQAVYL3xJVEXxxPL2Pn2uIb0aSpHgeXPksG1QxzM2RFgxP6?=
 =?us-ascii?Q?3IZg4PSXzi7rEKzUtrt45MZtxijTaT73nle1F0WL78vDOBgk/K1e+DWoAFbS?=
 =?us-ascii?Q?oa9dEXz6K3v9Z9WPY3BwxaRyW36bxpSaxT952V9KsrnILEEtvLHqL7f8thWj?=
 =?us-ascii?Q?n7w/he19JZDkoc16m0iPDft6luh6r+L9HqnaLmjJdeA/75vSvswfNt1m9vDX?=
 =?us-ascii?Q?ca/F547dcOyDZF5JdeipjP6EiaBWS7BcCmkusEQyPKTSuqPYjYa9h1Z2csPH?=
 =?us-ascii?Q?n8kOy4oiM8nx3TmFyRSkglq++PvOZwNzrRdANTWDWPBtaWEQPWG9+NV/1InG?=
 =?us-ascii?Q?KanGWlrXcpZy/K4bXYSUAu7KuenHyT1XpWFt2xIlsOvaf8qcU8Q3hqbMWLjX?=
 =?us-ascii?Q?CDRjzY5HGKDYlfw81fmxodpd5p1vzZFH0WEhPwNRC9EHKedW0nisanVI0zCq?=
 =?us-ascii?Q?P6Oo5Q48YOkHrcQ6chSBGaTBlsc+o9D8nJ/zMx+bfHIOSJfQBWpBsMfQQPJM?=
 =?us-ascii?Q?YBOt3nfT1Urm7ODxPHMn80GDEGdc?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:VI0PR08MB11200.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6715
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-SkipListedInternetSender: ip=[2603:10a6:800:257::18];
 domain=VI0PR08MB11200.eurprd08.prod.outlook.com
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 47d6ac15-4e23-4349-22dc-08dd67a0dffc
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|14060799003|82310400026|35042699022|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VLeIVX3r8jnl/VM6vdHh5eEQwEccEqi3ePbf/1/KdxEqv9rPXcXZY9EOIE68?=
 =?us-ascii?Q?U4Wid4Xx3gWRf7RuxaKH9BuLNCF5JXRq9AziyU3Y9GQMB0TzXF2Wo/JF2lLE?=
 =?us-ascii?Q?5pexU3DZ9cr78by7O3TfnjEj70iAaCjIGO/UNTLdkVaKYNhiJgV7f6lO6dGE?=
 =?us-ascii?Q?4lhq4d3rEnaZ6d0Cnq+Xd6VWJQDO/dL1nY/Q95s7G4DBvc9rgvqwI/r/2IB2?=
 =?us-ascii?Q?9J2EQc0xAR+lrTGBMDThL+qlqxKFgPBqo6UHMvgEXRA5aBMZG3YzYqTrUhvC?=
 =?us-ascii?Q?uALYKnBM2x3a8M/yVccbZpXuNBdMDLAESgm1k1sYf3Ep1n3oYvHqL3ar7Th4?=
 =?us-ascii?Q?uoXKlfgQbmpjJ1gU12yDGfprnIcfKZKvbok9JnYN7Jp5HFlv9GNgmNn+wH40?=
 =?us-ascii?Q?cwoy5H3Z+Bg2lL83hGL68lfWAkjfJNzzFGYLTK6GLCKmjNrziQiyDLr8yEiI?=
 =?us-ascii?Q?WLgLPpAKzZWqqK17gUJkyV4Qlhd1WT1NLvkAIEqaamx12ZNGUInGzp7us/Ms?=
 =?us-ascii?Q?/nB0t5PX+lhsHpf/myTEhYBsTsAABX7EJ4/nL9cOcReBAt6dNsGZoSmeTMeQ?=
 =?us-ascii?Q?9QPYVe5LjoQ4wkEGRiZPe6TtXAu17HGc/yYBPEUTKTx0hAKUr5DpDO7acA0S?=
 =?us-ascii?Q?BRDRv2eJc9pwdMpeB0ys4tw1c4Fa/9ATMzvPwDAjc3Qi1HDCEXl/KImwoK9h?=
 =?us-ascii?Q?2jJGXpqBNIVHjLOegZGNGTGuDPgp1R4D2rG51XqdSQ5YUrbUXYw9iXUr42zx?=
 =?us-ascii?Q?cfO00g/KG39qk9to64P3bgq/0AevOcYFAN3mG8m3kwCBFIYC34dF/puu+sGd?=
 =?us-ascii?Q?avrMVzQNyXY3VPw3/3mhVUGEcyWXt3F/Vq4ihtafGeOjqljkWps6g3ZlPNsD?=
 =?us-ascii?Q?Jy+aW9mjCyzk8IP+DCLtMGwIRq0VDFLZfgErXeGaEv+8pw/2Ne2n+SHmkwlX?=
 =?us-ascii?Q?yJA/vdi1OvKTF1L91HOmHhvJ9bUjL4y2bTJcFMvTVX9sP9ozpjlK3XWnIUmS?=
 =?us-ascii?Q?2ydEY2HpnIvr9a7dPQxnM9nmTl/aZfa3Cots+PBc6GThonvH6XTTdFrWUpqG?=
 =?us-ascii?Q?Md9H8S2EzKnG7e7b4Wao6Q2UiXRIkxbR9pNlNkQq9UfZL+SDgMAyEY4y4nkP?=
 =?us-ascii?Q?1HbugwWccyHE1neaP853eXDLG2HCkUbkimN4s3wJ1bS6lP/vqaNf44rysd6/?=
 =?us-ascii?Q?jsGdfTmhWmsBLSZ/lsezFlD2sTOGwML+7hkg07/zE3b28Le39/J0/DwwmKGW?=
 =?us-ascii?Q?Y0vwFVP9hJMaq+JAe7hwa0MIpTO0uvavr5Q2Xa2yFZld2KwNCU5PCPN7FyDd?=
 =?us-ascii?Q?OJSMPzR1Z8h1UVGt652mTWtAQ0j1K4cgb8t6CKI8eNY5ryDbiWjhRqAsvdpl?=
 =?us-ascii?Q?b8HEXUOYJDD5FbhVQrkNf87NiIJtIJw9ZAoEbDG+3Nz+/JKNaSKZ/YS3fxYQ?=
 =?us-ascii?Q?LpVhKBt4uWUsyzdIEmzfTl9zy7X6Kdu+FHjIYSrTwjxqipuXm+IBgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:64aa7808-outbound-1.mta.getcheckrecipient.com; CAT:NONE;
 SFS:(13230040)(376014)(14060799003)(82310400026)(35042699022)(1800799024)(36860700013);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 11:18:16.6184 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05af1d02-4e28-40d5-7400-08dd67a0e986
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000B61E.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7688
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

Mali-G715 introduces a new GPU_FEATURES register that provides
information about GPU-wide supported features. The register value will
be passed on to userspace via gpu_info. It also adds the following
registers that are specific to the kernel driver only:
- ASN_HASH_0~2
- DOORBELL_FEATURES
- PRFCNT_FEATURES
- SYSC_ALLOC0~7
- SYSC_PBHA_OVERRIDE0~3

Additionally, Mali-G715 presents an 'Immortalis' naming variant
depending on the shader core count and presence of Ray Intersection
feature support.

This patch adds:
- support for correctly identifying the model names for the Mali-G715
  family of GPUs.
- arch 11.8 FW binary support
- reading and handling of GPU_FEATURES register

Signed-off-by: Karunika Choo <karunika.choo@arm.com>
---
 drivers/gpu/drm/panthor/panthor_fw.c   |  1 +
 drivers/gpu/drm/panthor/panthor_hw.c   | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/panthor/panthor_regs.h | 12 ++++++++++++
 include/uapi/drm/panthor_drm.h         |  3 +++
 4 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
index ecfbe0456f89..0b3fab95f26b 100644
--- a/drivers/gpu/drm/panthor/panthor_fw.c
+++ b/drivers/gpu/drm/panthor/panthor_fw.c
@@ -1398,3 +1398,4 @@ int panthor_fw_init(struct panthor_device *ptdev)
 }
 
 MODULE_FIRMWARE("arm/mali/arch10.8/mali_csffw.bin");
+MODULE_FIRMWARE("arm/mali/arch11.8/mali_csffw.bin");
diff --git a/drivers/gpu/drm/panthor/panthor_hw.c b/drivers/gpu/drm/panthor/panthor_hw.c
index 12183c04cd21..d04c8723ac98 100644
--- a/drivers/gpu/drm/panthor/panthor_hw.c
+++ b/drivers/gpu/drm/panthor/panthor_hw.c
@@ -32,15 +32,34 @@ static void arch_10_8_gpu_info_init(struct panthor_device *ptdev)
 	ptdev->gpu_info.l2_present = gpu_read64(ptdev, GPU_L2_PRESENT_LO);
 }
 
+static void arch_11_8_gpu_info_init(struct panthor_device *ptdev)
+{
+	arch_10_8_gpu_info_init(ptdev);
+
+	ptdev->gpu_info.gpu_features = gpu_read64(ptdev, GPU_FEATURES_LO);
+}
+
 static char *get_gpu_model_name(struct panthor_device *ptdev)
 {
 	const u32 gpu_id = ptdev->gpu_info.gpu_id;
 	const u32 product_id = GPU_PROD_ID_MAKE(GPU_ARCH_MAJOR(gpu_id),
 						GPU_PROD_MAJOR(gpu_id));
+	const bool ray_intersection = !!(ptdev->gpu_info.gpu_features &
+					 GPU_FEATURES_RAY_INTERSECTION);
+	const u8 shader_core_count = hweight64(ptdev->gpu_info.shader_present);
 
 	switch (product_id) {
 	case GPU_PROD_ID_MAKE(10, 7):
 		return "Mali-G610";
+	case GPU_PROD_ID_MAKE(11, 2):
+		if (shader_core_count > 10 && ray_intersection)
+			return "Mali-G715-Immortalis";
+		else if (shader_core_count >= 7)
+			return "Mali-G715";
+
+		fallthrough;
+	case GPU_PROD_ID_MAKE(11, 3):
+		return "Mali-G615";
 	}
 
 	return "(Unknown Mali GPU)";
@@ -84,6 +103,13 @@ static struct panthor_hw panthor_hw_devices[] = {
 			.gpu_info_init = arch_10_8_gpu_info_init,
 		},
 	},
+	{
+		.arch_id = GPU_ARCH_ID_MAKE(11, 8, 0),
+		.arch_mask = GPU_ARCH_ID_MAKE(0xFF, 0xFF, 0),
+		.ops = {
+			.gpu_info_init = arch_11_8_gpu_info_init,
+		}
+	},
 };
 
 static int init_gpu_id(struct panthor_device *ptdev)
diff --git a/drivers/gpu/drm/panthor/panthor_regs.h b/drivers/gpu/drm/panthor/panthor_regs.h
index d9e0769d6f1a..7bc2d838e704 100644
--- a/drivers/gpu/drm/panthor/panthor_regs.h
+++ b/drivers/gpu/drm/panthor/panthor_regs.h
@@ -74,6 +74,11 @@
 #define GPU_PWR_OVERRIDE0				0x54
 #define GPU_PWR_OVERRIDE1				0x58
 
+#define GPU_FEATURES_LO					0x60
+#define GPU_FEATURES_HI					0x64
+#define   GPU_FEATURES_RAY_INTERSECTION			BIT(2)
+#define GPU_PRFCNT_FEATURES				0x68
+
 #define GPU_TIMESTAMP_OFFSET_LO				0x88
 #define GPU_TIMESTAMP_OFFSET_HI				0x8C
 #define GPU_CYCLE_COUNT_LO				0x90
@@ -88,6 +93,8 @@
 
 #define GPU_TEXTURE_FEATURES(n)				(0xB0 + ((n) * 4))
 
+#define GPU_DOORBELL_FEATURES				0xC0
+
 #define GPU_SHADER_PRESENT_LO				0x100
 #define GPU_SHADER_PRESENT_HI				0x104
 #define GPU_TILER_PRESENT_LO				0x110
@@ -132,6 +139,8 @@
 
 #define GPU_REVID					0x280
 
+#define GPU_ASN_HASH(n)					(0x2C0 + ((n) * 4))
+
 #define GPU_COHERENCY_FEATURES				0x300
 #define GPU_COHERENCY_PROT_BIT(name)			BIT(GPU_COHERENCY_  ## name)
 
@@ -140,6 +149,9 @@
 #define   GPU_COHERENCY_ACE_LITE			1
 #define   GPU_COHERENCY_NONE				31
 
+#define GPU_SYSC_PBHA_OVERRIDE(n)			(0x320 + ((n) * 4))
+#define GPU_SYSC_ALLOC(n)				(0x340 + ((n) * 4))
+
 #define MCU_CONTROL					0x700
 #define MCU_CONTROL_ENABLE				1
 #define MCU_CONTROL_AUTO				2
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..4aba8146af3b 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -307,6 +307,9 @@ struct drm_panthor_gpu_info {
 
 	/** @pad: MBZ. */
 	__u32 pad;
+
+	/** @gpu_features: Bitmask describing supported GPU-wide features */
+	__u64 gpu_features;
 };
 
 /**
-- 
2.47.1

