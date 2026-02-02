Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eO0HENuRgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0ADCC048
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 391DD10E495;
	Mon,  2 Feb 2026 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vde+vLtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E59A710E495
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:00:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYQs2Pw4IvqpJ9acI+6zJSPCIpXeCQiJL3YlyNX3UZV43P0SaBjIVPYFP/bwJzd8j93FPNlxkvgJm86erEgzfXw+anian1ka9ALXS7K2gFyUEhcPlKf6kGlSdR9kPm4A7gxrTgJFZfbQ8jtLcZCzCt8LxDg/5VlgYerx5yOu7LfN3BTjhwmYhnAiXYSiouusE2WuFtB5UYhy52ETy8Lonh1ia3Gy/ev9kHRcMQdYq7fB0NWDpfIlH7qzEIS0d+oMjE2kglyNUq6G95EsfUwQI/SrMqdxfBKrUAMOWwcH9cfxdxNjg5R8YsP49FrNlQt3gd0tn20t0gIVrhiPQoEnzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAFvdNtzy+sYGqHEzTsOj+9K1oe0pionPB/H1YG2MBo=;
 b=l/gjSa1K6QANKJSb+we0JfH4PZd/Rzj7pW68N3YMoAOFNKLdm8ioD/pT2H+lVYmYmQZqqurtX9tAg1/KjFCEkfcET+f3O3B528O1XvlIr/c2cpHivbGFIgIgbqooGwp+yLjN6MrIdfa7AV0IH3QBM7b5Mxft8xbcisOuDThbrQF07AHCQGvBDtVQgi9EIJBhTkiZsPsP7kyohVncljMg7Yah7epjiohxCTklSlCHn4UmvYqH+WarBCWNoi9VifHFhfFhCZdhD1cSRPoB20YBCw9A66zPuFcd08Lcz0AGl3ky5K1y0UZzC3XzKTPGqiv2WBfEC/jAZgKrYPQn3bAd+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nAFvdNtzy+sYGqHEzTsOj+9K1oe0pionPB/H1YG2MBo=;
 b=vde+vLtml0VRwLWk60ZSk52XbwNOYkDWOs04PeZHNOXEQQS+iR4JK0xMQtolSlq4zOeI9wxy3woYrogcCtXsOo8W2hltxVUy/H99sIJwZTn8oxLxRuBQxFTkUNhujDY5dN4HeVRd288CFWWRLTu4GMuNgK6FqAcuUxWXL+DCcCU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:21 +0000
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
Subject: [PATCH v4 13/20] drm: renesas: rz-du: mipi_dsi: Add support for RZ/G3E
Date: Mon,  2 Feb 2026 12:57:44 +0100
Message-ID: <47013bf112575a677448bce6d85f85c795f89c38.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::12) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB6552:EE_
X-MS-Office365-Filtering-Correlation-Id: 4569276f-42d6-43a0-5f42-08de6252a3dd
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?meTtbGyxYrdYs4YZelZc2B8bj+7ON8vi16FoktmtZKINexYZvFUY0Or7a1XK?=
 =?us-ascii?Q?dqKkBBfK/8maHZRCNta7xbo0cIe897B9sWoQk7r3nWVo4Pe+gSog5q1iha/m?=
 =?us-ascii?Q?BuuNt2OM20kQ+taCjp8Lki22oxuuYjCL+YxaVTOIEa3cJnAXvFVOTa4PZji6?=
 =?us-ascii?Q?WR8y5bh7fvJL3x4WPfb1QE1E/NnEGRSv11Vddvbtbl98WBsXMaU7QQdoxiaW?=
 =?us-ascii?Q?YjZyGCuedQh8q/K6TNq2+IrWnNAi0e6vU4OPWbzf/TXhFvWlcPl5yxJJdo4Z?=
 =?us-ascii?Q?U7wAb0+OpAL8NFeGOslui/MMait2sL8rYZopmCSZHZrLHEqHntPXv1eVZ885?=
 =?us-ascii?Q?cbSahSI/KtkacR2eXYMwlJw7aaEd1v1Z6x2xZz8x3vhhw9NDIQu0xc9CwAEL?=
 =?us-ascii?Q?YPs5ApJRv7AHCHtfutbzLUylYbkwCKdCgmlpmy+NLNz6EmfEXrqQC5D/pg+l?=
 =?us-ascii?Q?q4hMCOttu1qBAnW1nTuf6O5yAiQuAoeDEIuQyg7AGVqmqQK0PKZHFnjtLx3b?=
 =?us-ascii?Q?DT5MYp7X6bg0O3C8H6DStV9ctjXIP0aHf74tDyvcjMzfgOXiLj3mBvOvMvGX?=
 =?us-ascii?Q?EbqeguPDtg2IxcAzsMQTAX2TjtP7dEHL9vy+cuK7vWaHK13NbmqnwLM4woaq?=
 =?us-ascii?Q?kJ+BXdzOtSA+U6n6oiVFhbH5l29F5JE0sV9cGwFlJbwT0wmM3D98+EcdvBd5?=
 =?us-ascii?Q?E7qkcPyjYMXtpPv9n+diwszMkX81xjwCSm4dPrk8f3qRebXBUvHa038Q7skY?=
 =?us-ascii?Q?gIKj/rz3ohcgcWBQ6dkXe6sBOZURsLeNLIO/Ta5ZzRGx3Z0qfnwWikYrw5Xd?=
 =?us-ascii?Q?dESdJ7I8D0ob59XCAlJ9rEQQ2VlEyHasFKXiV5TrX64cx2TXd1+2++TQUBM9?=
 =?us-ascii?Q?tgbR+yU5knzM/CZmEy9PFlDGr0vNHhLBm773C543iIQr8Qge3SHVrywF9hxY?=
 =?us-ascii?Q?cBwTkrh+HhneUzCXnG3C9No7kH4S+GcLc4Q3mCnPs9ATgZ1N+Ls5C/fA66U4?=
 =?us-ascii?Q?eF7BtA8Lcf9JCHpWLZZ70IJ3giM3Y7ZSceTWynaGNmNa20vMOSMhv8wwG157?=
 =?us-ascii?Q?/YadPf1EGIod+wJvMmpJ/3rxnvPVtaIdtLPPgmVtzZpIuxVWQjZ+/+1TaGEO?=
 =?us-ascii?Q?lK4GqywE0AABwl2e6RbVzZaWrBKKBzyttgz7x24XaXXbtHGP5GEbdhcX4e/E?=
 =?us-ascii?Q?IIfAc30PYoENeTrfHlGwAhnZuz4rL1NMrK2sJGhZnRQav4o0UuDGlGP/+zwG?=
 =?us-ascii?Q?iJm1uwQJB0M3pGM/CdY6QBjE78QIblSkKhH4Vo+vKJAZF9rBjIOsPJ9j3MxQ?=
 =?us-ascii?Q?0Tt8dTGqYKaOuXj6XgJmn9TacZ8TXO896gcpSAotYQcin3CxFNxf5VJwFUBx?=
 =?us-ascii?Q?bRArhekN38OIEc+fAZcQlzQePPE8mAt+gDK/V8SCofqGXX6QYzSd9lHvy/kh?=
 =?us-ascii?Q?6hLgUUd4XYu4c7TZDrE7/MTfu6bc16x2EAChIi38Jg1uLV+9MmcJ7BaaZfZe?=
 =?us-ascii?Q?3jl/JzAq7+zWrPkzBopDWstKabSNgDRizmuu4TM52TkCJ0U4YjUexmcSDDwj?=
 =?us-ascii?Q?inNYgM68muR1px9kP1vzwTr6q35OiHzQlkaJrTlMJICqp0SIbCIPYkH8gLHE?=
 =?us-ascii?Q?+XSqhMV9155fqDLFPBU8fsg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?43FlGAjCBs/VU69mnVWXZxjw90fRkiGvNVQP7Wkv7J9YPkx4URESoXgNSbwu?=
 =?us-ascii?Q?q8zycUjIi4THTa1TTdbntotJ95O73sR/s+Wduu9dWxkK8I6YUzCVaKqGrH5E?=
 =?us-ascii?Q?eZ9n1K2lXPtcyNW2Jh8AQwIJWCAsGlBZLg+BBfQKUPsPHqsL+Tm+Nnx1+RjY?=
 =?us-ascii?Q?ng2Y+GRVuY10XAaknZH0QATund+VFphDDGHs/lagzIb2GoBWSHW0zwADd3C0?=
 =?us-ascii?Q?2hRIrJu9j4FEqm9Gj3Jcf2pamWphoAZPd1iMJpPX0Lm7rFH/4dD/jy3j+UaZ?=
 =?us-ascii?Q?03uAyoCpfmkl/IjNXBpA/87d6dhKvMifCfBvOpqoOYFxEVQZfPKwkZgkOoH3?=
 =?us-ascii?Q?mRku2/eB0k0f9YCeCHZsE6jouEITD9s7/rXyJ3TrsGZnCV2TjFVQMu/9hH5h?=
 =?us-ascii?Q?CyDA1jGJR2aQDE9ypQ0gNy9xgxrmb5TB7/b6O16A+6Riw1xzDjR68Y+cq/K8?=
 =?us-ascii?Q?rhpQXr6qkNYV9MS6Xqb0dRtJHYqAx6O35pnIEwLIaHyOA7Odg1e8zcNYXPai?=
 =?us-ascii?Q?aABc/F7lF6cqYni+Obm1Wjbkyi1IALsU/P95WNcvJbK3iGLAvWy5LCLaZcD9?=
 =?us-ascii?Q?D48T42isC6eqnFmZKq4zPjwjJZ4vnkAIohRypIAJtuKPOsgG7qFqtp5o1mI1?=
 =?us-ascii?Q?MsOPV/RSTtkItbg7TaVTnx5vJxQdaSH7lN385rzg4GHT28DiS6JgYVaYJw6h?=
 =?us-ascii?Q?YAWr+d54eseu2/b6yE0M2k/0hUygHdDGW0OP3DXPrMU4rmtpg/i/+l+Bnd3H?=
 =?us-ascii?Q?tv78sCVi33aS8UXJ94suvI8+H1NNLPM8Trsx0IeYFNdnnSFR0VU4BkfaPbbM?=
 =?us-ascii?Q?ouUWdirwRLdYT6Y+cqGQJsipLQstWSh0b0124ArAM0bP8PQBUnQ1cYQqwow+?=
 =?us-ascii?Q?8Vff2jPuUDrPMDfxDgkdJxxyPW/QiLbEEUOFGOuLGKN9CHf7WbISd3S8c5sG?=
 =?us-ascii?Q?5GfDPSZEcOOD35kMyGCcDEz8JLJ3vSyyAQn/V9n0rZd/JVY4t8lD4TUlFQxx?=
 =?us-ascii?Q?uAqKcILOf84ZgiwVhAJ6gai3nXtGaHBgGv+tLHuXDB8HYoCz11sTFSQEtcAe?=
 =?us-ascii?Q?FwPEiui2tf+Y1N/6py5FaeyWnvPNoWPwl+CWmdEDNCIYSSpMtZvQLCocF1vf?=
 =?us-ascii?Q?Kr8X8QPv0AfY52qWWGrREm27HzGzjuUCBr4bDJNPx8HypVdSuosluLiO8hKB?=
 =?us-ascii?Q?iGL3ch4itMUPtHUgTZuRZHEbpwxTI4f6zMz0AwO6Unu9IU0NmtSFFmtno2Vx?=
 =?us-ascii?Q?HR/wlBbSR9YR8HrN+eqvgL8GCoSj3SfII1os83L66egb7DdmBetpVLoXXzB8?=
 =?us-ascii?Q?29wjxgn95GcfKvq66pfXhxWsXAINLCUc3PnHU9rScdIhL3/tT+xUACWbQsES?=
 =?us-ascii?Q?6zWIFsA+4ncvMXMKm9IFFY5l7MhajrEf5IMfdhmZVZp8tt2DNhVzoLijxG6f?=
 =?us-ascii?Q?RVKEj3IRFdo10x+4UQXd+uSb8HPrCZDQcm0fqW4Zcc7M/hP+t6P+IUH8wiyW?=
 =?us-ascii?Q?baLZolsFlPgWQ6t4fclkAgXylbDYfM8vuV1MuIqZL9/pOEir2w7BZsWPCs8x?=
 =?us-ascii?Q?JjHKyq6dSVWwcIhc4G19vDCZz3dX7/iAfXxqYTeAIr8YIhDLNEWU2DdWkA5M?=
 =?us-ascii?Q?tQ8CVewvnJezWRu71teSF1zEB/pYZE43E7HZMS1IB+2OZJKiJUC+ES+dx2z5?=
 =?us-ascii?Q?LRksRToBmkZWxzVZjTjic7d/lCIVBKHsDEHiOxQ5I5DibmGljYtFA+G6fcBe?=
 =?us-ascii?Q?7ugTHm8h4ZRiGu2NKC+RDbZUpZ2tm64k0NrlMynVaV+RPjFMiZk7?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4569276f-42d6-43a0-5f42-08de6252a3dd
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:21.0385 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/06hQ42dNPcqv4ZNlY3awkw2RefeJ1I36k4P0UI/G6YOShJ0+xB9epsh0ldtUUrLUp3H8mv713Wn1ZCxsUqn421MuRulsAoIQI/lf3Pm9W3KbMsKiafh1el8Q7eXx9q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6552
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: DF0ADCC048
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

v3->v4:
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

