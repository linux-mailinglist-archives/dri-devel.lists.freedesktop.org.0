Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIvUMcbpfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D38BD0CE
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7D310E364;
	Fri, 30 Jan 2026 17:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tfRr+6FQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D1210EA13
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=phAJv4It1uCxlGe3IvkZHmI4jn7BwAFA0cu830FLkH+g75YKv+xWuURgQztNOBIq636yS4p3EhM5RA5YtkIc8N8h/fzeUeWgSW20PacFrIjOBMiFe81dmGnZ9vyTwn80TEFtXdMxX2elbxoWoeffQvqtoGX+jMdQ/HvtSthBmQVmWKMd4t+F7lNVgKikjqaJTProjPoV5a9M9Qn+R2KXUhGzQ/BlZ0inSkBA1Lsxe6FkLo36QUqKjPKjPfKTiAoFi/6Y3s8EU+Y4Hp83ykq60KmsAFKuzldUiB1QI1D+s4c8IvBxHWA1R6C9g2G4zFCIprrv5ZCD4xz4uWqMNw45hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2qld/UIeeIMt3HkwqySdxC/j47GatxIWxbd9FMRLaMU=;
 b=j8hIdVYQmcfco3AsE82KBZJZDOVI1wl666krlulbqffqDwkKvBkaao4KAVDYQEZD4NMhAZQjZ1C+q4+bYMYb0Lp3m5GDBVvVIrVrnvv8tMIJXeQFsWvydIYhiavp9iGtA3LTk//jxqWSYtqYDdjs8omO54AUVKQqhdkXUxt9vCD2UvFiOhDNGgRZ6yK8wDltE0RH2qcDNNnrMWdHSk4jJtgMVM2gdPVrndefIaiVD3GjLKu6stPpfrNV65oe5T87nD0CyCV4YwwjMqiu3ZWYbn/Er22MLMGpRd0kymmbMCNy+6K/Vm+sstjSoHzLlH6P1j9AlUxBArbJopJ1TU/UxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2qld/UIeeIMt3HkwqySdxC/j47GatxIWxbd9FMRLaMU=;
 b=tfRr+6FQ0n4ZRnlQfbKygC2cXBpspJQYuKvJEuzrRe8sRlBDifx1FgUTTBaogkutTsBcXm+rcaB47R5lVvdF/lDIdWb+HVttFQZgawMt+17euAYyPNvN8H4hT/Wasu6SVgKcw/CAi0NUTpr1/dlq36TnQAdPRMbulvAZHzr3Rqc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:25 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:24 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 03/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,1} clocks
Date: Fri, 30 Jan 2026 18:25:00 +0100
Message-ID: <c16451f087e466079436b2806d84b82bbe5cbcab.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0155.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::18) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYCPR01MB10351:EE_
X-MS-Office365-Filtering-Correlation-Id: df083c64-3e3f-4647-2655-08de6024b176
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X9mduU7gsfMXvJopmcx4ENUZcdrU855Uu0gwc7zTy7uFvBVy9tqtT6d5Qm7W?=
 =?us-ascii?Q?3dyxlg9U7J9Fr1VZQUJ1734BXjrKEgzZAPmllGGNz9n0U/GdB7sMhn2Sa9jI?=
 =?us-ascii?Q?k4uzunsUN88HcbyumXacOOBRBUMfqFrOXu5yqK7MlGoBUi48g6ce2n8NU5NE?=
 =?us-ascii?Q?jWFzCWqELZz9P/VGxcs0hBmAvNoF6pT717zcaVA8+bthYMwJk0DkSb7bRGCJ?=
 =?us-ascii?Q?EPp5wqVev3QzILQqTwK4TY/hHQEeN5CHu4ObfiON5o5Mo2JL3DhZG2OZKZ/f?=
 =?us-ascii?Q?GG+lkmX/FNsj3VTlJ8VJVshGD6zqm4U82nM6BWW88mTes730LU0K2WD201M9?=
 =?us-ascii?Q?3UmQYodkTNthcTQcoU9SwAgx92OYLBzWe4QdZdo5bCu6QVwEG6N8kxNTb3cq?=
 =?us-ascii?Q?DvZ96UBQ3f7RX/HL8WFPv6JMs+lrQSQyKWDEtuJAX6X5M81sTQHsJMWGERoS?=
 =?us-ascii?Q?hgrKtK29IKrb9KLx3bOuu6lRO99ZZeiAGoboOnwKZUDiQ+/gp68706PTJG6K?=
 =?us-ascii?Q?pnrIehDEwCBL2q4gYHzrT2FfinGY9/THXuJdWJNG5ds20k9wVhytDE+cCP7G?=
 =?us-ascii?Q?CN7edLvR43WcZYGPZFgqtsiyq48vlY19nSCrR6kGf/Zkxf1sp7iig2KR7JHR?=
 =?us-ascii?Q?2Wy9ZeFovotFSD+r3adSBO95NZ/yqWacPnvVLD+Pq9ML60DU6ipUpyWxaiEC?=
 =?us-ascii?Q?ftoOC2hBKFbfFNR6UmJ7UCORT+2MzR6LOkGmV9rxGhiIJbIuBRPGcbsTJtEx?=
 =?us-ascii?Q?i5PjsnJGY+jx+UW8qucibRaP1QYis6zlBrhxTkpbymE/M5o9rWzuFTfoysaR?=
 =?us-ascii?Q?nlNEgYXbx05cQjdicFc6D+n8ws32E2fIGIVBnzXctpXWMktJ+Ftxt8Jv+2R5?=
 =?us-ascii?Q?dZw0CvXGdEN+ZNPK/Hhw73kXb2/9f80Yifi+HSrMb4mIQQkYmrmGvKBN3x3J?=
 =?us-ascii?Q?+b5DDcmbdA4vNboSRh9onKzRN/vJO3dOj7nRwUdIsIPEh0MSWM1hS+603X3H?=
 =?us-ascii?Q?P1QfPTdccgBTOouXDyXWa7I7Emd0TDfsUdYm5ZkVfO02uxkFhfrySLfhmCFF?=
 =?us-ascii?Q?h2HRU2TVFdgSyfeEjPBXQs5yzZxzaSNnSAncf2BFWGAwCPXjASIrpvXLp/89?=
 =?us-ascii?Q?7lpHDjg9VY5NStaFsZAlJGagGjkbkYeojEbPcLyqxmwpTv7p0AuLNzNWpqen?=
 =?us-ascii?Q?yp0FCIHU9qtHhIcVKLWYxfUCbtSpq10U/WhnC7nnOhE5vu0W2ud8ZcPWYo9M?=
 =?us-ascii?Q?L9hdG9Kz67SSJzWGN9v2xzzE9f9e6PP68kHlg90u/Cz7P9LuWIiDM2RV5X/D?=
 =?us-ascii?Q?/+uma9WYvbD27OfB3qGEEQeyN644vpgF36/DK4Xc9UmPnbF/CQe0OcgzJVcV?=
 =?us-ascii?Q?8rc5CWKtRYJmrfIqBB4uYhRPUMYvjtwtU4A2MMDsSAGoMOXvhb8+beKMpSDX?=
 =?us-ascii?Q?FVdWrmKAncLEfq17hjljZQcbFhUmwHwGqocov3tkDGycNa5uElLta42gesTE?=
 =?us-ascii?Q?mhVitP63U6MJZvVcPodte4gMx+laevNSg71mU0iw57NcbmjEubWLs7FAe2ov?=
 =?us-ascii?Q?PGZyqinJuMHnh2rqHSaWQnZ7tOqvfhg26TKhZD9FGDPjf18JwXVbzSh/Z2f/?=
 =?us-ascii?Q?76c7X2w6yNJmtvqRsXo63K0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vC/Pbqp3/0lj9LoF7thJhm4u6Pyps3k+RaWKoDYnBym1tG7ixHNs5BZTuvwD?=
 =?us-ascii?Q?PfTYizmTDgQEGzMB8hfuUqoJdDVQxu6ofUcC6BWaWLX2bQUY2zG9jypjzfZ0?=
 =?us-ascii?Q?DwQdKyxq+KgZFI7W2/bVghpzMZFVm+Kp1INujOv2X+KewrvDKvU6WBKTo5TW?=
 =?us-ascii?Q?Qj+LFUd9KYcp0Eizj26eoqMKkk+B4d2b1KK3uS37vYe4t49BNP8NF8cVEn3l?=
 =?us-ascii?Q?fTNcFR9kbKC+FUChW7STRab53JjspQZTNzwwHoB6vZPKJFrf8SqAaY8vBTEM?=
 =?us-ascii?Q?+MOIonayeEiXaahAJwLE5taWWY8TD3mNdQRzPNEOcvVHjm6C2VXCswkO8YCk?=
 =?us-ascii?Q?EEByJ2qukj4H2GPQa4jmNlwM5NVb31up8Kj+ilYLicDpODRl1CdwzfrXiICj?=
 =?us-ascii?Q?bCeLlHUZZHBuhMAQU9UdHhDmlJPtE0trVewfdx88RoGq3RHn6UTqPa1VD7jS?=
 =?us-ascii?Q?mM4nbE/KA2DznlmV8k4OzEPfd1JUl+kjCra4HRX7geb/OIJ+AAW47kpi/9nf?=
 =?us-ascii?Q?V/u70yMgq8rBStyk/Sa6MxMj13AyAqgEUCpYrKIi9r9CkuxWVzQjodUDn9kB?=
 =?us-ascii?Q?M1ewHZlT5QGYqGOx3/rcjDPA5ntec4j+p9+Qoihwy8CLfYABl1CEoQogbrRV?=
 =?us-ascii?Q?thY3yz8swvQHqCayqV121TchYYE9yTyhvqVSnAXSO1ELwKVuI2JonF4z3T9R?=
 =?us-ascii?Q?LqR9yiG9a8JwVM4CG4r5a8nWOlpooIsA5XWdgVFb3wIWqyEUqdZ5c3FQ0qjC?=
 =?us-ascii?Q?geVL7dDbrmZmsVbJG2tTm2PUUVmR/2FZtktA9JAZ0w6zFrCexT4N8Ui8soJN?=
 =?us-ascii?Q?auT+924QdoixunxTFuyPX+4o7jGWqnolN6KnlKifydS6bOsQgp6+RehJBoyS?=
 =?us-ascii?Q?XXkMTuMJcYaIpvPuAl/lti02anjDqnNTTmc2VMxmMA3f9QEpXd8MCyOZTeM3?=
 =?us-ascii?Q?4Rbr5wvPgnKqylOzM3FnakoCN8CpeM2Tyuou/QYI8qBVxMVeIcMWxs8elZxb?=
 =?us-ascii?Q?7phnNtXCOVXB62v6YjZ8BvtfGuDP/DwK9NLJtpADMvLvQqUL6t30AeV/+EQ8?=
 =?us-ascii?Q?n4bUs637PP31P0p64QtvIK1oUMRyGS4mOj1Ljs6bkRMNmn3Y5T3BPxd/ylaR?=
 =?us-ascii?Q?V+pzSRt+Hh5sShH8O0Jmbq0xjAmkYzBe5JtyshYmNf8Org4gfMzHwCXbLuo2?=
 =?us-ascii?Q?2BRaEgLasiWi454BC1rVPM3qMpKhi5N2/OMl1P3q7VTb1eZVJ9QgGzciSJlh?=
 =?us-ascii?Q?fOmYBr//wc4/nlMe5bT5KBN/DhrsxuYNeF+oD206R8V481wv3dEwLZ2YJMJo?=
 =?us-ascii?Q?FhuZSeVb2Co2dfL10FFhj4FkcnaFuWpF0goOUhF4w8J8lBIdbm0c5KfM6Tsd?=
 =?us-ascii?Q?z0vk38RkDVTVLu9e7r6sOH7g72IN1DUtNYiAk1sisbDHYduDqyOBNRCfXbxC?=
 =?us-ascii?Q?7eW1mnfLrp6sAs3f+yBjgxAKDD83WrrDAiQTzCfjFlUpztjywKFcnfuFpxY0?=
 =?us-ascii?Q?9xy1/f5Cj70Rg0Bfx9vQTDWa4F5/3UgJVZFNg2QdjmXvLbXGhcS1+8tcZ2Fb?=
 =?us-ascii?Q?Nz6yqkj2eu86eqlL7JbS5/YkLfrqMJPA2PCa+O4qPXTKV6TazudWe8/pEeLB?=
 =?us-ascii?Q?H0O1W1RehciQKFr1Lu6aUHQff5uAHS+8WHi6y2233EXDYY+3jcQPwdR+pTkd?=
 =?us-ascii?Q?SPdzU4UUcg3JzROcSj9SjCMCEL9FEKXGOwkD/bITHJ/zxnNyLhZph67qfDPk?=
 =?us-ascii?Q?iGNZDvKMYYHniSE80QezdGqGH30dYMhft/vUr/poOBz/OG/qklGT?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df083c64-3e3f-4647-2655-08de6024b176
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:24.8858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C2E/VeTeThFZxvLoXEbiO2E6E3KAHnqjfBe0HOa12v1Bs5lcx4bPuARV1oIFIOMAjz3TKmoYPBXkY8mZwgzjlJJk8gpZ4GG3jq6kYgS94To3grnQlWg7qtlVaiB88vs/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10351
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 77D38BD0CE
X-Rspamd-Action: no action

Add support for the PLLDSI{0,1} clocks in the r9a09g047 CPG driver.

Introduce CLK_PLLDSI{0,1} also, introduce the
rzg3e_cpg_pll_dsi{0,1}_limits structures to describe the frequency
constraints specific to the RZ/G3E SoC.

On Renesas RZ/G3E:

 - PLLDSI0 maximum output frequency: 1218 MHz
 - PLLDSI1 maximum output frequency: 609 MHz

These limits are enforced through the newly added
RZG3E_CPG_PLL_DSI{0,1}_LIMITS().

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 11 +++++++++++
 include/linux/clk/renesas.h         | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index a73d12d4964a..8d4c70533a79 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/clk-provider.h>
+#include <linux/clk/renesas.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -30,6 +31,8 @@ enum clk_ids {
 	CLK_PLLCA55,
 	CLK_PLLVDO,
 	CLK_PLLETH,
+	CLK_PLLDSI0,
+	CLK_PLLDSI1,
 
 	/* Internal Core Clocks */
 	CLK_PLLCM33_DIV3,
@@ -117,6 +120,12 @@ static const struct clk_div_table dtable_16_128[] = {
 	{0, 0},
 };
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+#define PLLDSI0		PLL_PACK_LIMITS(0xc0, 1, 0, &rzg3e_cpg_pll_dsi0_limits)
+#define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -138,6 +147,8 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_PLL(".pllca55", CLK_PLLCA55, CLK_QEXTAL, PLLCA55),
 	DEF_FIXED(".plleth", CLK_PLLETH, CLK_QEXTAL, 125, 3),
 	DEF_FIXED(".pllvdo", CLK_PLLVDO, CLK_QEXTAL, 105, 2),
+	DEF_PLLDSI(".plldsi0", CLK_PLLDSI0, CLK_QEXTAL, PLLDSI0),
+	DEF_PLLDSI(".plldsi1", CLK_PLLDSI1, CLK_QEXTAL, PLLDSI1),
 
 	/* Internal Core Clocks */
 	DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index c360df9fa735..0949400f44de 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -164,6 +164,26 @@ struct rzv2h_pll_div_pars {
 		.k = { .min = -32768, .max = 32767 },			\
 	}								\
 
+#define RZG3E_CPG_PLL_DSI0_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 1218 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
+#define RZG3E_CPG_PLL_DSI1_LIMITS(name)					\
+	static const struct rzv2h_pll_limits (name) = {			\
+		.fout = { .min = 25 * MEGA, .max = 609 * MEGA },	\
+		.fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },	\
+		.m = { .min = 64, .max = 533 },				\
+		.p = { .min = 1, .max = 4 },				\
+		.s = { .min = 0, .max = 6 },				\
+		.k = { .min = -32768, .max = 32767 },			\
+	}								\
+
 #ifdef CONFIG_CLK_RZV2H
 bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
 			struct rzv2h_pll_pars *pars, u64 freq_millihz);
-- 
2.43.0

