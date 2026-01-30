Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +Dv0BDn5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B76D9BDC68
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:32:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1091B10EA3D;
	Fri, 30 Jan 2026 18:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="q63MLZOz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011040.outbound.protection.outlook.com [40.107.74.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5892710EA3D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:32:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NExIpNebWgl26ZujbtMPgzflZ7gDOQlKs8g08hu06hdyKGkcWI4aOibxPg/NrUbW+ODysyt4lrZU0jF089q5yp3FBju2HHc7aoTnah5Ga+jINxatwwu1Z9q34U5LEPO3vvAuD7U1t5zpUjmWpBnC+iaZbnb5pU92Jrzx/SKpNlt6YNn7lfMBqPvoFWT1DF6K2oOYcmCcHW9POGPl0s0VAUALv8SI7x6B2VVRpfWsTiKhhDSaeUvtU5G2SVE5ApSSTJGdekOXgGZZVKLDbO0AbvqPwmfhbyU8203V/KoaMII/JRCwcCExRPGjB/BXAsPB6EYbosmXshyOuFYhKHOXwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYm/+qnrMhbaF6DCwoi3C0KObIRVgpnzOgc+6vVs5jA=;
 b=aEQDtn+odXsT+dpepG5/tb0hOdY5ZDt4ACrxTi+YM30kHe6ykwXeS/EEo+XEQrZAmaBbsTtT1XebC505OD0q86a7lVOgCW2o58aUHJWiRm65qnbJXf4SDOelcKzl4YF8Nurl+nNP3CORbe+j7Ubg5kl3Etw7PNQKcLFugWuhk6ELwv0fhjuMxANTWzuzAYzdD8XkTS8Dq3unwXhV0mcKSWAdwa4MW9xNn5jByNukJNjcKhKTXpypMbYV9yT3r6KaLd9X2wjb75+wQVatpFLvTArQ5oPjAcdYOpXih9zxk9wKne9Xl5ZDwLIzmsjHUaqD6tlNtJwZNjrv/tznZ7WGfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYm/+qnrMhbaF6DCwoi3C0KObIRVgpnzOgc+6vVs5jA=;
 b=q63MLZOz9xRuVfQKaR+g0IHZA2LIsX78tj+WLqN5Cf+7KmcPMBXZEF+OjJW72eMpk1b5szynj2+X7S1mI0anZYESTijt755skVulT9uCGM/84cfswetR9i+604MBrPCHE5l8i+sSGi/dw4ZWAzqfKMbpWtCymEGchRPPS1na5BI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:32:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:32:19 +0000
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
Subject: [PATCH v3 13/20] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Fri, 30 Jan 2026 19:30:05 +0100
Message-ID: <2b550b491473c2c197ba68e8a117b6c88b1f8527.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB15715:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df23a52-8378-4700-3886-08de602de69c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5JBATtY2RV4K0l0G0vAi5Ta+anxig+5HYCyWBGKiWibKyS1ChrGHbKbWeoCJ?=
 =?us-ascii?Q?hr2k2D0L0b1Ng7VcrgHjmC19QKyazoOcXJmDT3u8t750+T7wDfYhWC1d/2gm?=
 =?us-ascii?Q?in1DUbH8ddV/i4fTls86absIcTtMeYMXDq0Utyv1UfuaplSmAYQ+yB3W3HMp?=
 =?us-ascii?Q?K1hRAQQzGItoWSFPeNX1mcGmoXtmtc8NHrswdEVxrrKGkBbdgKpD+gTF4tT6?=
 =?us-ascii?Q?bEa6jI9s6KANQj+3cL8M9Z0U++LtI3Clo79QE0Bjto/KAxOFPnewo0q4UF0b?=
 =?us-ascii?Q?ojUue0FVNO5W2bonWRpVmkwWCbtSSK8o0ijF4c6gHmKaW1W2Ts9gkMxjn4LJ?=
 =?us-ascii?Q?D7qMrkWEhvu1dVhjG7y40P2bCA+OIt5etb72xSjukdhG9ocO3LS9TYSK2RBT?=
 =?us-ascii?Q?gCUMxsX9kPphTQmXwtPcfoMPBaUYvt6dJPZuegNQOqpyvuE1Xb9dieDif93G?=
 =?us-ascii?Q?0MB6iIC47aD8yWXHSwFwNYPRlkCfgoitaSCT7gKgq+qzfZZdPDlrkVV5PMjH?=
 =?us-ascii?Q?lvfHM4di7WowZpUZwcoNjyuV0qq8crBuNqebV61HBLWzii1wqb1r1FvzFd5P?=
 =?us-ascii?Q?v/RhCtS8xOJ3XKFguNEai6HGWqGeN5Xgq6dfl2viIEQyinMS5tU0rlQNPAIe?=
 =?us-ascii?Q?6obSUI/TVlnuMU3hYRLKbWv4aXzSL6+Un/4fUYIOracgMJffA18Q8M+GDB4j?=
 =?us-ascii?Q?oAXQcEnqOkgw1yTDV2xcHsPuo5MUYJogEsXgJxE8tZCvfCxOk3KAgDem/Qul?=
 =?us-ascii?Q?gi1CF4u4bx2n9VYHzle92AUNyEQ87vBNci2G2RYkqUxeZhfTpyeGFpMzUJZc?=
 =?us-ascii?Q?7kqfC9Xiaq9IeONs2xv1+s4v/+CK6py0s1uvL4BxdqHU5M/tv6j7tEuqVbMp?=
 =?us-ascii?Q?HfmjgMV2p7igrb0tmwE7zwcid3fto9DZ9I2yCPYaZZZsD5P7WJ8QmM69liXG?=
 =?us-ascii?Q?4eZ26T2oAgl1ClAsCB8cvzU/jxnpqxsTh99tmNrVUICV+FqQOmtbKDVmgsP1?=
 =?us-ascii?Q?xqju1rxGmy5d+dV+77+pgIKO/Ou7YRYHHkiFiVu7oe1raL7z7HuZPe1SjZ1n?=
 =?us-ascii?Q?t2pIt+kD+pNE27ZAkMpd047PlrbaYrDU2hGByyYvTcpGDQI6AX7/JDnmJ5o7?=
 =?us-ascii?Q?YTlSVz9Qv9c1Cx3syajCazJbijtDEfY0fRD9l/NDIZHcf4/r0ZRnYKb/8zkj?=
 =?us-ascii?Q?DC0ngAB0GPTXClCkRvNMOr2y13KOJXStvsD40MRSSulQduaKfsufE+NqPASH?=
 =?us-ascii?Q?XCzkzj9XcH4GbtxqSAyzog9zls9tAgayjnNavbkZux1FxwejwwdrV6X17jyf?=
 =?us-ascii?Q?evzIUEr5jvTsC2X6s0G8pPUOjeoDLXZpdMmKdH7UV6xurF4e3L9PAg631Ojd?=
 =?us-ascii?Q?LRKMxUrUPTVwqvPcsPenfcCALuelimeFTSEawph0vqbrLWIqFORkoYA3hK/K?=
 =?us-ascii?Q?chlb9e4phX8iLkrDbWpimyD/aTmaHTpH3R5MuA99v2OL8QDCTYaES96XenfX?=
 =?us-ascii?Q?xilw7PQcl5QvQ6rSXRnL8dUq+GfN8O6CUAlZfQSapjJsVoQz8WgQMZ4Af5cQ?=
 =?us-ascii?Q?9WqODye5tznmQx9738zOp+c+JCxvtcm0OaKxnXAGGJ5POclqHgZ5zGsEDW0P?=
 =?us-ascii?Q?FVELKkgWb9lyN+bJKWQpPNM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f2qIlVimi8RP9C0xV6ETI/3Bn0Wp2jEOt7rcqD1nJC/5cbjFRx+StYu7u3cZ?=
 =?us-ascii?Q?7J4ro96sWl/CdVAn5FfbnmGnFnttEVC+X5Rl9WJ0JGkEJvCmijkfmtgKboqf?=
 =?us-ascii?Q?jqUoqGZoH564aMJqFsIvjgQ03hJn8mDGD0FbqD+OteCI3KGF6ZmON8mDgSdI?=
 =?us-ascii?Q?M0wvKpwkC+/W5KV3JSiScfuQcCKsantIq0DpE6dot/GrCAz874FKlHGFjBbz?=
 =?us-ascii?Q?+JWidYc4WvR9763F1sBwgLxuJKzgwx8zhVm++iTuWt5AwfcDmYpygy7eoudv?=
 =?us-ascii?Q?lfYGhn/JaTNr1ecvhzS7V3GiK2zCEvyW+vCc3ospAfUfMAbMsYLe0x7ZdpSP?=
 =?us-ascii?Q?otwcVFOw4K2QYi9lrVH9Pl/4SGWVLdLbRSyrj92r584VFmnBLE3P+VyMTO80?=
 =?us-ascii?Q?/FWBKmFuKLRKXWMItaWrW1LwoGjjhJhh0A8cPNByv30M4284o3rI1tO2BkLY?=
 =?us-ascii?Q?IjK0S+yS0EyW3FkApkCJ8U2kG/1gvu+I/KvGg8NVZh5n5xKdWNyCFgwoJYzX?=
 =?us-ascii?Q?FWhCQjweie8Cu0f95D/daAmvntv8HyqxhJ4ZUyIl/4m5+j1HFXJrU0wej7ie?=
 =?us-ascii?Q?dIwWzRLNVo5B3WfOUBKUD6GwJxwadN1PvTiRzPsJSiRzH75f9kTPX/2wVxcK?=
 =?us-ascii?Q?JUXQpydgLJ/JZSWnaJODAxUcj2JwJmcqj/jHFhY1CZVYT1soNS6xrKZaD1l5?=
 =?us-ascii?Q?1NdB574pnBoJ8D8zBdpyshR098qSsQofZlcvEZAHlQ/o9iHGpkBhnrhr7My9?=
 =?us-ascii?Q?wVxYjRJDQNlkYWiiJFGtmnXeOd6ioOKt5Am3Yp3VneYNq6H8sXWaudTeVlEn?=
 =?us-ascii?Q?oa74wPOCnR70PDOt6m2JVUvR3b8ZYToHIaAK16G6TJA4r+H08u2wGhxK1Kji?=
 =?us-ascii?Q?t+JhJvTbAIVEPDMj0vK7zxdvuH35N1vdm8eXpMsQP8X2z0nDcGBiN6shX0DN?=
 =?us-ascii?Q?sHb9q+v4rc5xKOxopChrJ3KQg3spKE2S2eZJjiDlEbqx9aTviOwt9p2piVid?=
 =?us-ascii?Q?3ORDGTema5U4SJ7RlwuI6A91HPtKPKIhHf/qZc2+bt4XNE5Qi6J+GNVabftw?=
 =?us-ascii?Q?yqLV0SBZIdY3y9FMfT1BnE8msFua1KomKu6B5gbLMk/JcHIdvQOQny58JFfl?=
 =?us-ascii?Q?cqogJCpqylbPnEN3q/LIwkK7OouAOWyqh3GXcpd8E4RCmGYWMfZhXsmKJf8i?=
 =?us-ascii?Q?kdxW6LxgFiSF1RGnt9xeCGu4rF/nMopquWvChGYRYThfaRXZbp+rQmxplyCL?=
 =?us-ascii?Q?MOHjf0Sl8uNvvQrVToUCaN96YX3y1y3D5/itD6LjTudM9TlJdxdNNUT8dd5M?=
 =?us-ascii?Q?2XmJkZ6H/CjPFFs5IHtRbdD5Q1s53UIdS20tcOsuA2iuyy4Oxbo3BV97Pk0Z?=
 =?us-ascii?Q?nn8cQnl+OBmjrdYjpy0iAqH5Do5pLHY5YhSEBbmzmjCBjm8qBb+n+ineMElU?=
 =?us-ascii?Q?maTWNBIPPlmQ/GMJn6w6DJgGyqU/sXaPcDA8Y0cmNXW95liuUYwbIX72V4yy?=
 =?us-ascii?Q?rzEmq63ySSTU6RiFbEcbl0QvcJJFVDoqmvRiCdfA2laBo1Pr4JEUKNbxclNd?=
 =?us-ascii?Q?ZrVgYm76J4bVZxp/1v/1t9MdCfxn46SxM8SQ7Vqn8NX31mxbC4rkoNbbAbri?=
 =?us-ascii?Q?UJYOzqeU6+4m2BF535+LJy5HeamgqRRGFXxQwiasr32ycUSAMbTRXbXY9CAh?=
 =?us-ascii?Q?ultBHuprLLQNsoz8M9w+O5YU4aJ8wNw14YZltpMIbN/xUAxQhjcaGVAotKzR?=
 =?us-ascii?Q?2Bl1ozGZNk3XVSRJM3ohgz/60nQxhVG/SRWQIC+mwUYEPil3PZgh?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df23a52-8378-4700-3886-08de602de69c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:32:19.2800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VC8r1YCDBMpS7chXPFLRoY6RWA7F2K01N2UHsEGbF2mGWvoNMmHhhXXZCef/IQsGYp8T6OzeESkqAB9fq2W3QKPR0SE7ERjHCRJMtCOKPHFsLP5A0zcbOl06+yYI86F7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB15715
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
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: B76D9BDC68
X-Rspamd-Action: no action

Add MIPI DSI support for the Renesas RZ/G3E SoC.

RZ/V2H(P) and RZ/G3E share identical PLLDSI divider constraints from the
DSI PHY perspective, so both can reuse the existing
rzv2h_plldsi_div_limits structure. However, at the CPG level the limits
differ:

 - PLLDSI0 limits apply when vclk1 is used.
 - PLLDSI1 limits apply when vclk2 is used.

To support this introduce rzg3e_plldsis_limits for RZ/G3E SoC.

During rzv2h_dphy_mode_clk_check(), the appropriate limits are selected
dynamically based on vclk_idx, which reflects the currently selected
vclk.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

v2->v3:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 33 ++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 35de1a964dc0..27901dafab9a 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -590,7 +590,7 @@ static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_dsi *dsi,
 	mode_freq_hz = mul_u32_u32(mode_freq, KILO);
 	mode_freq_millihz = mode_freq_hz * MILLI;
 	parameters_found =
-		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[0],
+		rzv2h_get_pll_divs_pars(dsi->info->cpg_plldsi.limits[dsi->vclk_idx],
 					&cpg_dsi_parameters,
 					dsi->info->cpg_plldsi.table,
 					dsi->info->cpg_plldsi.table_size,
@@ -1539,6 +1539,36 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
+RZG3E_CPG_PLL_DSI0_LIMITS(rzg3e_cpg_pll_dsi0_limits);
+RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
+
+static const struct rzv2h_pll_limits *rzg3e_plldsis_limits[] = {
+	&rzg3e_cpg_pll_dsi0_limits,
+	&rzg3e_cpg_pll_dsi1_limits,
+};
+
+static const u8 rzg3e_cpg_div_table[] = {
+	2, 4, 6, 8, 10, 12, 14, 16,
+};
+
+static struct rzg2l_mipi_dsi_hw_info rzg3e_mipi_dsi_info = {
+	.dphy_init = rzv2h_mipi_dsi_dphy_init,
+	.dphy_startup_late_init = rzv2h_mipi_dsi_dphy_startup_late_init,
+	.dphy_exit = rzv2h_mipi_dsi_dphy_exit,
+	.dphy_mode_clk_check = rzv2h_dphy_mode_clk_check,
+	.dphy_conf_clks = rzv2h_dphy_conf_clks,
+	.cpg_plldsi.limits = rzg3e_plldsis_limits,
+	.cpg_plldsi.table = rzg3e_cpg_div_table,
+	.cpg_plldsi.table_size = ARRAY_SIZE(rzg3e_cpg_div_table),
+	.phy_reg_offset = 0x10000,
+	.link_reg_offset = 0,
+	.min_dclk = 5440,
+	.max_dclk = 187500,
+	.out_port = 2,
+	.features = RZ_MIPI_DSI_FEATURE_16BPP |
+		    RZ_MIPI_DSI_FEATURE_GPO0R,
+};
+
 RZV2H_CPG_PLL_DSI_LIMITS(rzv2h_cpg_pll_dsi_limits);
 
 static const struct rzv2h_pll_limits *rzv2h_plldsi_limits[] = {
@@ -1577,6 +1607,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
+	{ .compatible = "renesas,r9a09g047-mipi-dsi", .data = &rzg3e_mipi_dsi_info, },
 	{ .compatible = "renesas,r9a09g057-mipi-dsi", .data = &rzv2h_mipi_dsi_info, },
 	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
 	{ /* sentinel */ }
-- 
2.43.0

