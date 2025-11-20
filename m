Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC3BC759D5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2E3E10E793;
	Thu, 20 Nov 2025 17:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=arm.com header.i=@arm.com header.b="Vn5qKVrM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Vn5qKVrM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010050.outbound.protection.outlook.com [52.101.69.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328E210E793
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:21:59 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=F7AlpCYqLq9RMTmo25ATApQOXLWrl7JQ6rY3uyTg49P8V+2dmHlrj0ydanXpRGrBk108uhI5zaTVzxtEK6OrkjcbaV6sz37EQFhR1r38FFmMoo5UTn3x1R4DbeZTrSh9z9JK9rYckkty/cl9ap2yAHhvVheFq2UPLAwAE2ya974fsCeQc3FxWZajoDDualmScLrpwUukn2aJ6LeTf/gY29bRX9AkUBW8N/isY2ni/Ot+wMsyxPHMvOVP6G1XvD1K0cOqTijSlEpzHO6uEWDOjW4/O+fBdVs8tyk/hs+uAj9HB89n8QfRQfDjOOiuTHxaSylQMZBHrVP04qoXS1aQAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYQkTeF6jrLIh6yViXvAG+pmjIHyvSkc+cP+FZQG+W8=;
 b=qTC7AwfZ6TxXcp/tBWQCxmFNUU74l6ZCqx0hGMlYMuKAL91W6bN3F5wL0gatZWJp91ZGnTpMDUsKckD5LtJN5EEqoVNC90rHmJmkCeZkzsk7aDjC68R97Og/Q485IXNJbwp0WY4jW0zzu9sAxfjZjgY5yDiZUt7J/RZ03IzrtMHj6ogKJAKKtYVj9efCUtBH8n/ZJEb30Lpmk3S+lhtpfeaJm9prFaYNsinW3BtC02zSho1yTUiNRcAQFxMjtoRieyCcbMMKYQnlR8P2fVxgZs67EbmGwjAQ+9ozKLJVtrGXDrhIXjxQvY9sbT85w2USnw60VHLlJvmGJAhFCUgtqQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=collabora.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYQkTeF6jrLIh6yViXvAG+pmjIHyvSkc+cP+FZQG+W8=;
 b=Vn5qKVrMVykhdcO8+dYCA9T7ZsARbejiVGI71i6uxkWmCfWVbSh4ao6yJZkRBFs03rPUWZgTP/YF07WNHi4J/yIfvXiKVUGD8SnRkJFNGKgfduDEUUa3LsdO12DTviiZn6IXlTlmYdsEFhQR5Ord5zG6MJAtlDfv8P0fHexFBbo=
Received: from AS4P195CA0037.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::26)
 by GV1PR08MB7827.eurprd08.prod.outlook.com (2603:10a6:150:5b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Thu, 20 Nov
 2025 17:21:54 +0000
Received: from AM2PEPF0001C70F.eurprd05.prod.outlook.com
 (2603:10a6:20b:65a:cafe::98) by AS4P195CA0037.outlook.office365.com
 (2603:10a6:20b:65a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.11 via Frontend Transport; Thu,
 20 Nov 2025 17:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AM2PEPF0001C70F.mail.protection.outlook.com (10.167.16.203) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.9
 via Frontend Transport; Thu, 20 Nov 2025 17:21:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G+7EI3/aQf+90435pgbBISmI7bgl5DH7S3tgd+s99DhxAfJP4mY2COkX0i0EIXQvHpem7Tap0lf32OeBbVdn2+QIhcGh04sJY+87S9056Pg621fMhr/GORurLqPrhyGLTVwP3vIeUtEVhzN4sshaPkjbIPMEojkMqGmHy+ZdtPsOdwZGA0d9H9XOgq7nSnlhbYhFB7nwXI+pzvFRhANGrf2myjD2rIX2YoXV8w9Ss7D2JQIrpmLZnMN9uDR3rVXrk/XzguE1uCkKVizFr0fhnrEcT0LwWHfj7INxDba4j2RAVbfKelNWidjZbV+i664DfokstyG6Y9R5vo0MWunjrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYQkTeF6jrLIh6yViXvAG+pmjIHyvSkc+cP+FZQG+W8=;
 b=bg7WPftSgf37TO0ZPodcyhiUOtDmWWx+K7jpoZ5jNVgP4cUIl76JqEOUyut1zJPQkBA8bVFUgkymGCA1zMZpYh889fC1dn5xJj7GM9SMuvDHDdjFbjJq9fJLiKFTHbDBV8kdjVcqhe9fJGbD2SVZ/6lFZLpZqWjHMzUsrDrrF+Zfggk/vk7xWq/MsRn4sgJMrgXW+lS5IQqf8LfIwb4AM20DlSupTQ+Saexp7AD4ewZ7H0SFqUxJgEMiZOpHredWgOCDSoNAmIzt/aMb4ZqX51zsZJlaCcaiwMOmb3Rz8gNdnZLW/2L1fUVAtBChI1w8vqWbN/uoFkHd9LuqQcNYNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYQkTeF6jrLIh6yViXvAG+pmjIHyvSkc+cP+FZQG+W8=;
 b=Vn5qKVrMVykhdcO8+dYCA9T7ZsARbejiVGI71i6uxkWmCfWVbSh4ao6yJZkRBFs03rPUWZgTP/YF07WNHi4J/yIfvXiKVUGD8SnRkJFNGKgfduDEUUa3LsdO12DTviiZn6IXlTlmYdsEFhQR5Ord5zG6MJAtlDfv8P0fHexFBbo=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com (2603:10a6:20b:415::16)
 by DU5PR08MB10578.eurprd08.prod.outlook.com (2603:10a6:10:51c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Thu, 20 Nov
 2025 17:21:22 +0000
Received: from AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499]) by AM9PR08MB6982.eurprd08.prod.outlook.com
 ([fe80::65b:44e2:e002:6499%4]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 17:21:22 +0000
From: Akash Goel <akash.goel@arm.com>
To: boris.brezillon@collabora.com, liviu.dudau@arm.com, steven.price@arm.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, nd@arm.com,
 Akash Goel <akash.goel@arm.com>
Subject: [PATCH v2] drm/panthor: Avoid adding of kernel BOs to extobj list
Date: Thu, 20 Nov 2025 17:21:18 +0000
Message-Id: <20251120172118.2741724-1-akash.goel@arm.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO2P265CA0393.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::21) To AM9PR08MB6982.eurprd08.prod.outlook.com
 (2603:10a6:20b:415::16)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: AM9PR08MB6982:EE_|DU5PR08MB10578:EE_|AM2PEPF0001C70F:EE_|GV1PR08MB7827:EE_
X-MS-Office365-Filtering-Correlation-Id: 9491365d-7ffe-4c44-5515-08de28594d18
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info-Original: =?us-ascii?Q?If8KcUNa8FCy7XAxYgvh1LmPkRydKZWeOXGfST9tjz21FOxn0n97iXRtST7R?=
 =?us-ascii?Q?HLES2/e0ZIntMwc1brxu+oKxRYfkfceYVrPOEdBfIc39jWlKTYomnYxTsZZM?=
 =?us-ascii?Q?pRfCtOnjmdOoQhYmyDaA3lFenGCCc78gxZyRS/JPsQ6QPGX9NaWD+EOjrFo+?=
 =?us-ascii?Q?5y38AZxy3KBheiRwAOWn1djf3qgUhe7h0XAMS5FYotGwNkNv0n/nQe9Xg9qX?=
 =?us-ascii?Q?7tz1BVZRmN2ij6PnTAv7e6HO3zB1+oQM9i18bQcmfKdOv24Y2N76XZORm9Pe?=
 =?us-ascii?Q?huKKGYVSEjXcYUYEcMVT1nXPvb3/USQdcx8K/hjaV+E0Mpk7hpDtLZKlz5Vu?=
 =?us-ascii?Q?HFIEzvvLrVlm69Q7ZywD2WEDT8UV88Fq+KMorF9ADyjIsOrKwRI0QvVo/1/6?=
 =?us-ascii?Q?iXSz+AilHwQT2DV5YXOAbTwJO9Hmb0JSMIdnNOGLLdtvB7njMDh9v8xyehdP?=
 =?us-ascii?Q?H/TxNKMHeH4FGQ5Ki8Qc7RB5m4lQt+TblgvTBqp0ABIhn50TdGMYmwpt5N2+?=
 =?us-ascii?Q?RD0NQc/93ql1LOk3pc6tgFqU7jBn+IajqHbeVq+Lj2KmqYaN0U9UhuSykPBK?=
 =?us-ascii?Q?uww6wwl1KSqHpDkNC/mQmjWuD0KxqOTTsYJh30liOR2F6K5JuDQttkYgSB3/?=
 =?us-ascii?Q?J3TStt01BH7mBMyoPhixNEFaZbM5xbVdePZ7/VHiFWXQE3Q4idNFulJc/kfG?=
 =?us-ascii?Q?TdAp1ujFV33RhHpIs3au8ybt6iV088IVI8axNU6eL+X+GFjv20RB0psOezi1?=
 =?us-ascii?Q?sYF0jz9lD5VR8bDHO0V7gfIMSe7VzobfnBE+vzC0RxVS9VVbxXZrTYLm8YBs?=
 =?us-ascii?Q?Krn2VjNxcqhyQgPcQO/3lQiARQzWZjHeDfOR5caA5dQx8AQAxMyfI4je+fCQ?=
 =?us-ascii?Q?bdLzoGxzOvMWiKu2gfKBaj3Y0lpZAtQ+hWAGHgDPxAI5XxU3Bh62E21jJjpS?=
 =?us-ascii?Q?dzPblMk7vYQKHzZFbmS1lJmm/j5+9IgD1tJGO2ml5oTYpck1nMZKD0ZOjhEd?=
 =?us-ascii?Q?NwdOsqdABscXLOqyCQ9eS5OJIixwAVSxvaz5yyPQnW7d8TggTm8Dv1FSkf6N?=
 =?us-ascii?Q?gYDeJCp89E5XoKKawMdgmWIVTu5lYxrIMdPFUhpOi9/Ut0B9mgHin5idBxAV?=
 =?us-ascii?Q?KEuOH22EMf0kRRDx5iYqD+5XHhZu9XSLdSWVfor5k5sVJ/JHI3soEMGNBdbe?=
 =?us-ascii?Q?Rl1XY4k7s46uBQFOLMS0Y6UT5ZcZWmLZ31U8Yx3izLervLZp9FUip5t5376V?=
 =?us-ascii?Q?KvTiqDXoO4GPmQ9TGtNH/E2IHn07+/budVjD9//mO0AaH3mE+Oie4X+JLSdV?=
 =?us-ascii?Q?jkN/sA//4ub7bAyt1knU8T3Vh9TKJ1eu1rb0nIsXjF7OrTgzkCYPip/ETQQV?=
 =?us-ascii?Q?WuWJcpMjziSGYljqkjmxnNQ6zeqS0lm+CWjl3r4Soc2fwyBT83/EQm2PlfZ1?=
 =?us-ascii?Q?bibEoQ2rNH04gOlZkdIYkc0dlot+92Gg?=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6982.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFS:(13230040)(376014)(366016)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10578
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 199aa315-ad0d-4259-a698-08de285939b4
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|35042699022|14060799003|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NW2sE9mU8auA3XEgs5Rp/eO/wIcbAlCSTXrxeiQZcjQrqYMgbtWFAMctfAw2?=
 =?us-ascii?Q?ZcptuCtPNkmXT+l7NfQeMY29kvFcafprY7tmMBEEAuG/KmA5WzwvEzxGyCwV?=
 =?us-ascii?Q?TIGNWmAPPK/OeGKC8e5/V0y312MxHC1MNELAPivGWYzgjzBUz/xiY5jJOGTg?=
 =?us-ascii?Q?bJxqck3OKvmD0Kh7NCE+EJ4U02+U5tvQcYkMsvG4tUwvlynlDfismLWjzdxQ?=
 =?us-ascii?Q?dnLSB7mKNfR60GH0tS0RUGF9bekat8G+/EGJrZj+penEItgttcpU/CW44MCq?=
 =?us-ascii?Q?eg0lL1kBtUMAeKL/hClV1inbgw+cMJIWxbwii3x+EYIyAXan13utjgo6cHRv?=
 =?us-ascii?Q?ekjFe1Kt4HA8uuEJeuipF9hw6cwl3X1N+l/QZxJL48W6Ii1BD+hvB+ZIB4M9?=
 =?us-ascii?Q?waeQR+ssU67ihB5IVAF00OpzF22Zk6+m+OR/MqXnehmNq2fg4MRJNAgiu+IE?=
 =?us-ascii?Q?tZUq+MwT4OnRpi3+NsMhRNTOA53r73k0/hFsWH7qm6lgp+u25lM4RQzW86tX?=
 =?us-ascii?Q?TVj5HO8pg137XCMGBIiYAjFJTvNT8PgZFC3dFANAjc/5UXIeC+X7/KbxJ4Eb?=
 =?us-ascii?Q?MnPjlnU8tcMZsZE099VuHeomaK6Xi6hfROr+1tnvE0pINKnYvcfpbRxihRwX?=
 =?us-ascii?Q?6EJtwQwvNetzroIz8OzQg1JlIWT7RVE9wreSAyjV8qt5w4MRfIYSqEmJ01WC?=
 =?us-ascii?Q?s04PP6xV9D5xY/zJxCRsqRZRdoNcyLGp5safFsT3Jb1ZSVbTgj0JhKmpiYk9?=
 =?us-ascii?Q?AmsNkk2MO/dD+TSgQmaicpoDuk2zktO2BrvREFCUnSNRSkHBt35DafiWM/IA?=
 =?us-ascii?Q?VOKI7XRFnN7mub+zaGFKI2VILknwKLJGhF+R5AEEs/pIo0FWGJH57QpAjKb0?=
 =?us-ascii?Q?0vFckPl1D3XHv0UKG7iJGhaHCtXY7s/tfAZTt3PH5G2FwYfNzhXcNzkVp5Mn?=
 =?us-ascii?Q?5WZWbt87TIcxvwyBZzIowiQg7RHqjPyQvBvrzV/0keQWshgAw5WdS6ls4DoS?=
 =?us-ascii?Q?kYQpp/LHFOWagiHHNdjm/wawbfINdCuldwGIjT6g0YXxpVP/4oKTlYa5M2VF?=
 =?us-ascii?Q?v98jGjh5k6f43FWN/icB5Lz2rJ6DicgPeYwoRiJ2+sxqUskSCQjldKH7dWPG?=
 =?us-ascii?Q?h+2hwhChDeM3V9zt0YUR/lb765668gg3JyXtJXbV7dHy52mR8x2gASHKIKp3?=
 =?us-ascii?Q?vudy4hZq9SvRBweXPl58f084M2vC+qFYzZjZw6E9YetSuLfS947wTjeCoZWM?=
 =?us-ascii?Q?LJwKfu6gcYR8aFgKz5EKlr+FaTDqKKjPQxB3viA0zfuxxHjV0NICzvZPtAF+?=
 =?us-ascii?Q?8ZeSVgEUm8UF3okD7nbD9wdTlXSTSke+6U9tLJ08SOfGJRXaPa/nR4onQ2pu?=
 =?us-ascii?Q?MdFRXB8iNPD21rWuGyr5Y4EOpqtBU7XQcyp5cnduJTGwGjPkJwxMG/S2sQOt?=
 =?us-ascii?Q?5wIw7u41MfbYz3R+8lsoe56HvnmSeUsbG52Q7dQeLBOtFo4wu1vakGK45U3V?=
 =?us-ascii?Q?Sm3pJe2HNBSpXRZdnT1kL75a0EhMDdCSFy/unH+fuIvPsZ8g4VjrUy+whije?=
 =?us-ascii?Q?yZU51iF5mGtdIRb1XOA=3D?=
X-Forefront-Antispam-Report: CIP:4.158.2.129; CTRY:GB; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:outbound-uk1.az.dlp.m.darktrace.com;
 PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(35042699022)(14060799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 17:21:54.2856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9491365d-7ffe-4c44-5515-08de28594d18
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[4.158.2.129];
 Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource: AM2PEPF0001C70F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7827
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

The kernel BOs unnecessarily got added to the external objects list
of drm_gpuvm, when mapping to GPU, which would have resulted in few
extra CPU cycles being spent at the time of job submission as
drm_exec_until_all_locked() loop iterates over all external objects.

Kernel BOs are private to a VM and so they share the dma_resv object of
the dummy GEM object created for a VM. Use of DRM_EXEC_IGNORE_DUPLICATES
flag ensured the recursive locking of the dummy GEM object was ignored.
Also no extra space got allocated to add fences to the dma_resv object
of dummy GEM object. So no other impact apart from few extra CPU cycles.

This commit sets the pointer to dma_resv object of GEM object of
kernel BOs before they are mapped to GPU, to prevent them from
being added to external objects list.

v2: Add R-bs and fixes tags

Fixes: 8a1cc07578bf ("drm/panthor: Add GEM logical block")
Signed-off-by: Akash Goel <akash.goel@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panthor/panthor_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index f369cc3e2a5f..10d255cccc09 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -145,6 +145,9 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 	bo = to_panthor_bo(&obj->base);
 	kbo->obj = &obj->base;
 	bo->flags = bo_flags;
+	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
+	drm_gem_object_get(bo->exclusive_vm_root_gem);
+	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 
 	if (vm == panthor_fw_vm(ptdev))
 		debug_flags |= PANTHOR_DEBUGFS_GEM_USAGE_FLAG_FW_MAPPED;
@@ -168,9 +171,6 @@ panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
 		goto err_free_va;
 
 	kbo->vm = panthor_vm_get(vm);
-	bo->exclusive_vm_root_gem = panthor_vm_root_gem(vm);
-	drm_gem_object_get(bo->exclusive_vm_root_gem);
-	bo->base.base.resv = bo->exclusive_vm_root_gem->resv;
 	return kbo;
 
 err_free_va:
-- 
2.25.1

