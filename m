Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJyLI1/5fGmYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0527BDCDA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CD610EA46;
	Fri, 30 Jan 2026 18:33:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IEExgmiA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010045.outbound.protection.outlook.com [52.101.229.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAA610EA47
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:33:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y6rQ42sZkx4BYBY/Mh3p+dP2bDfdHYbCt1GOkGiVF+AF7103c6TR1BDHKE44C2nm0Ra8QBVcIOA4gKLskiIHVSY8t35lRsHVAlwyf3pfv97eid2mi2PLjungPhmPZwDkNHL7bSf35eLVivLt/Iw62VLXZqRJqQ6yAds64OeAMF2cdtfvuyd+iImXzUsWj457+hADHKNaGrtfG8l72t5XDAT2Ode9o97kEj6pLw+qY+OqbHT17GjzQzVE8hNG2QV14tQetDK42S1vzXKDDE/PCuDImvy5G7JAhYAwBwAH51MFAot5s2/8+/6SlPjG1WMSs5Zrfg2+oFyD+gu1gZv3gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gRAlW7Pq7ph94ObNy8qEITo2bCiRFDT0ycKCW/TpK1k=;
 b=ucyTO9bh4UyLR8kIwNRlrXlwXBNAikeUurZ2GL9pbxNRtBfSJQHsdnejBJqWJSIWj1+nMtd3odFyaUSOum1QInbRiB2Q29xxqU0zEsor+CGkO9SzoIu8shbF0s1Kz1A+PnT4POe7JGBDkJlttLbl8Q0CpeCp3kcmUXd2UAgYeRGyoCJ+Fvo6ddLG6dhEjSKEt/1IcoWdYuaeO5tmWo66NoW356DP0Gs3+C9n9NmJ2zj8/qPj0wIhKyuqKrKvDmSRenlPWPzKzByd//LfKBm0KabRZmBT1Xcf0uKN/PD8HI5Slnn7QdaAu4vDob+Yw46R6OkRkhwddjLHzdhNiDK0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gRAlW7Pq7ph94ObNy8qEITo2bCiRFDT0ycKCW/TpK1k=;
 b=IEExgmiAnmU1HI9HhpIAuu8HwANBU0uOcPAcdityyRITH+ipamW8EdO3QPMdno0se5Xs/QLauxNtOP7oHmc5rkWGm/jTg7FUzdPHih6cVX/2Yik2qKlOQvhDTJ4O/GUIGk5YpMVVvMqtdkFvUsvt6MMq4m8wu6zb1NeqhRwmLiw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8547.jpnprd01.prod.outlook.com (2603:1096:604:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 18:32:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:57 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com, geert@linux-m68k.org,
 laurent.pinchart@ideasonboard.com
Cc: linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 18/20] arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes
Date: Fri, 30 Jan 2026 19:30:10 +0100
Message-ID: <f7ee4100dba9bc36a118875dc973eed4be7576e2.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR1P264CA0120.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:50::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f9ba42-5028-4f78-33f6-08de602dfd75
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5+fPRPuwF5yNGfQ1M8yBGCMkJ2n7AhbWEKluJo8Scegmh5QqiqswFD/qa85J?=
 =?us-ascii?Q?Za4tAkWnub5mlL0Tcv7vkmMazjJ3dFvGePi0TyVbDd06vOVTo5bdEaeTPnHu?=
 =?us-ascii?Q?p3vK3TyDTYKIHGFQRSTwvdizTgfvJgnZU9UgFojep8o/undP4tvEYY0RbQhI?=
 =?us-ascii?Q?pNBvEtv/KzsDQI7BH/czxSGKj3FhVk5p8cHxvskYy/6mzLHUEb5uUQuxWd0J?=
 =?us-ascii?Q?FdJo98p2r6UNpcDJTrTh8S3MypIlEvgwQsuldRxr0YEpUNkXpY2bqbYEZ4KI?=
 =?us-ascii?Q?fW1QTZ6du7SWydAHElc1rtH8miWtzyD1mZokIx5jDaF1/oCyqMAXSSi+ZRbk?=
 =?us-ascii?Q?5fBA/EGvBPJLB0kigMjlGBsmluHwBTBX39/jZT7gz+HZwVDyZNlyED2yU7sW?=
 =?us-ascii?Q?XAFd2JbaLo04VOxTuKlIK13f+XxuSQtkkSr5TP96yZwH0X2ZzoOakVm7eVjt?=
 =?us-ascii?Q?F4EFMqIKXFQG//mOPpI4TWb54Rj/nZI9uVlhVCJm163Zpl+BOa4WT78QbVmz?=
 =?us-ascii?Q?Mk7IHpI6Uym7K065c/vT+uPxndMzOsjMpxPMXIfcFc2rQgcJhUdlR0S5ano4?=
 =?us-ascii?Q?aWTD+boSzR5DaUZWf1eIxfdiaYQclFYitVYeoCUj9LFP6f3/a6Oif9IUykvh?=
 =?us-ascii?Q?JYAddQKiQ6d+up9iWB1IT2vZv1ZkfQDBqkOF7K3sJyGfCcC/GEUe/n9ncT1S?=
 =?us-ascii?Q?KyrLn+I8rkZnQ5h353ps8O/FO2bznyyihFtN012QNvjtqhZnm0eVeog3mKNi?=
 =?us-ascii?Q?RVQNxrVnH8wVeHqeKal3+T8hhgYTrjY6w4qRWzpbyIVUCEDFrS5k/aShgVOt?=
 =?us-ascii?Q?0Z2T7YQdQGYz5GrTxbw8blqDKQYzNm+PhUqKu4c8P/3KBnNqULedEqUMypU0?=
 =?us-ascii?Q?Bt8RJkIeviwr9fG5TrNrlM7oH0sZwIvqXAatQCpG+hDb6san3iX5qHI6Op/G?=
 =?us-ascii?Q?iEXi6/UKm7xIihqDLNPe0oXGu8z4s2qvYOErqLEWh+hDGTrDGDzWiVPkvMuV?=
 =?us-ascii?Q?4cABB11qbxvTmza7dkmtTPbEBDdmXbM0SqVOgn05pRjL7sYMXwdNG2KkmHLQ?=
 =?us-ascii?Q?UGp1VXbd7TOKbc0kyofOyhmQIcKeRXk6TIFRo6eMa2uXYalvMTiPZvrsGhw0?=
 =?us-ascii?Q?zfxm0Hy4eDMg6czbCQBsntWyoC4j24qx0UviCLpf2cgYUkD0iq+kBo0siuxS?=
 =?us-ascii?Q?rL70afamODHZj5RnTXDNqLqC2sG1BrnOp3F1SGaqFMimrjtwxWDpkuyqRshE?=
 =?us-ascii?Q?9HGx+PQwqd40CBTZdErMcRbWo7SkqU9Ml6ttJgWPPXdC/kTA2IAnzkUDUB9r?=
 =?us-ascii?Q?UyFihalBFjjBfMjKaRtyRgqWqKVf4+r0R41XYOoNL05OFp1rqldYleQdgmm6?=
 =?us-ascii?Q?KU4pmXj8LnKs4TuUFTaWMs72pa5C/ldZleUGanNBBCmuvrdXd6zh9oiRP4cO?=
 =?us-ascii?Q?x3usaUccb1S99wkoYu3eZoKN2sxaYG2dAiZ9/rORRhMwbXd1+IB+pDBnVkXn?=
 =?us-ascii?Q?258ttDGLwrLhlpntz2nIXGGnMy2vJfBCHdyeQ8KjvPbWKtLLE/BNAmPxyJnP?=
 =?us-ascii?Q?m8Hkd1G6A+L88mLfeH9CHEfzsBo5J7QwGE6Gb4I3tq/JX2gi6qvV7WQc3qEP?=
 =?us-ascii?Q?/8hzFOPK+DCrSQsgq4fNC4c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pxf/tC/ylzhzUKnVm4MCrTgZqxZxKNrrVicWUwKu7fxg/7Q49MkiHvknvP8/?=
 =?us-ascii?Q?Utau+QLb1qYUFaWO3RYuxs+rcXkLcin53gcq9tSB1Wj53art5DM5B4rQJ+Dc?=
 =?us-ascii?Q?nvut7n8uTvvN75m6yafLb8gL3MQP17741Q5O2atDObzsNJoqpiK12/CaKoBd?=
 =?us-ascii?Q?0M5WlYC035z/pq92UUWV69b2VLSTWq0xQDts06Vn+2PvT7ZwX1qsdAnm5fc5?=
 =?us-ascii?Q?P9tVkmqS+bKUJNmUymP4Y5DAzp5UFNZW8pJ9dTO8xeqIEvEEc0l4B9B4/5Fo?=
 =?us-ascii?Q?TXU/+KwLf70jLBTCP7Hd5cx28isXjrpTYhnhhs1jufBNiLpMONTmq8S75G34?=
 =?us-ascii?Q?P/DuBkMhu8lWftRs1slI2jxJnGRxkKyflVsbGavgjGnHVdCqP2n01fuskI0E?=
 =?us-ascii?Q?cBrx/8eTg2wFVZDZCGxzcuz4ho0bZKM8NC5DtaHwd5FPQkClDYggA0NvcZAs?=
 =?us-ascii?Q?k4b5FTfvJbQ+FylRsBWEyHih9AWZFkkA2AoPSi31mROQfvki6R0XFLFwSy0F?=
 =?us-ascii?Q?QoOeZXNcf7zUjLUr03EMqGT7un2Pv5oVG8Y4oC3lREgF0cdAUI9yrXjaOuqX?=
 =?us-ascii?Q?akAZNCK6+QDwPleeuEDR39yYgOgvA5/ziREBNwF1y4rq7RJimpiaxM2G79mz?=
 =?us-ascii?Q?CLLF4Fxi51w60kJ08o38XD0mju1NQjY263idY+qjSlPYgcaW3lE7ndDRxBue?=
 =?us-ascii?Q?+SMLaJKBS+Cyj9+xIlerszagnM0Zaa7izF4Xe1BTxdlwbtajaitVD0tl6OFe?=
 =?us-ascii?Q?UFu3eW/gXLtvWzo/L8P7TJa0Z4WzvyrgNFauOne43M7ZqBQ2PVjQHqd1lmgC?=
 =?us-ascii?Q?2vprMbxshuoCVRNIvpVKP2HD1Q7cmqUhrPHY6hG14YDCtr6Cvg+oDcJgOtju?=
 =?us-ascii?Q?fy4V2gTu4zNrsm1mvQmhQctXaNCOxErLIKDvhJiSy0+1NyJfVRJ23mY6G8eL?=
 =?us-ascii?Q?4ASQJsfkMkM/44BdFRETuGsGR6jd+LKDdUVnLqJxOpHJsmqllUHdcgJ5k/9G?=
 =?us-ascii?Q?pr9WWlHNHsCUCypFSs23oahhixynoDW7ef9kYdW0mJXQWf8RcUX7F0Ip2RwL?=
 =?us-ascii?Q?h2w3/jyEMxvUfgc7g0zMpAY/ilpi5vInZHNBb9AaFq4NYBcoYhooBZlDztCV?=
 =?us-ascii?Q?BOYTAB53haT0Z/fUtfiT8Q38s9wkWdQ2M7kynoGdUBy9L2CyHjubCZBZFe6+?=
 =?us-ascii?Q?DNqQkr/08rhoIsYM33+v2GKgANjb5eAm5A2jLzLdC2wHwLbnsLWZlLWLttdF?=
 =?us-ascii?Q?aM4b/c1JeJ9bS6DWfIZWv0BxUFkfVWTogr6aA9OeIF/DBuhPM2x5K0UorRqc?=
 =?us-ascii?Q?NFc5nH3znw2PY+/WB/vIAi3VRYg4otsXXhnHagb98gXiTDdoZPmqROxLIH5c?=
 =?us-ascii?Q?93ZGBfwBYiCsMX59XgujADlQtX+nDfW0kIZdRONve7SbOpzhZBgdEf3jI030?=
 =?us-ascii?Q?w9/M8E2kW2iD+53eJ49f4sT7MP/KcZCA2hFSjkTFptTdBTAZYQsyiLQfWb0p?=
 =?us-ascii?Q?a42TY1UIvXuU8ImTtuksWGdxjT3K2gVR3rLodkAMpRGDOOe7K0d9KNziau9W?=
 =?us-ascii?Q?DJZ9JGL/NqPF5PVQBh/RF9hZgXMjjaSc6k/ayc671QoqlLPktLS78/A0tnt/?=
 =?us-ascii?Q?FUS7t6keju1XMTm9vFufWNJv6bOcIKLDi/svDuRb18f6L+uagrb8ZMJDLF4m?=
 =?us-ascii?Q?EhASA0Me6OaeFsxdfhAHNyl35MPAh6pqGXC0wah50QFr0M50J0BnHiAlmstQ?=
 =?us-ascii?Q?JuVB4rxo8+mB/mQ+3rZTHnwOSdfQi9VBx7b/Afko4yZY2BmPYvXP?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f9ba42-5028-4f78-33f6-08de602dfd75
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:57.8481 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sGQkNOGa7+7rcC3dzio+Sb3KVaRMlflL00bS6l2EGurJoGhf+UwLaOW6hbWR4tgaOmiNb6LEZtwhZOYJxRy1m4R6AxwrBDFB6DsQICZVrWRb6HS23/AeX6uh1uil1DGw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8547
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.251.119.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[164a0000:email,renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,bp.renesas.com:mid,bp.renesas.com:dkim,164b0000:email]
X-Rspamd-Queue-Id: F0527BDCDA
X-Rspamd-Action: no action

Add vspd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed vspd0 and vspd1 patches into a single patch.
 - Collected tags.

v2->v3:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index c90a778250d6..d4db44b6ccf7 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1455,6 +1455,34 @@ fcpvd1: fcp@164a0000 {
 			resets = <&cpg 0x11e>;
 			power-domains = <&cpg>;
 		};
+
+		vspd0: vsp@16480000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x16480000 0 0x10000>;
+			interrupts = <GIC_SPI 881 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd0>;
+		};
+
+		vspd1: vsp@164b0000 {
+			compatible = "renesas,r9a09g047-vsp2",
+				     "renesas,r9a07g044-vsp2";
+			reg = <0 0x164b0000 0 0x10000>;
+			interrupts = <GIC_SPI 921 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+			renesas,fcp = <&fcpvd1>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

