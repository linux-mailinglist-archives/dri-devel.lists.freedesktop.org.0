Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMn9MtORgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5369DCC041
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A799F10E490;
	Mon,  2 Feb 2026 12:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ruGKpj4R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5136C10E490
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:00:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ncMzaAeLLsJHX23Si6agbbLoqkXUIhawaby0Gt2GVfOwuEd8rE9iMIlhZ1oqQ8v8XiUYPHbJY8weN/gSZILAUPc8aoaPiUXsMbDtox9u2eEIMizEoSYasAGbkssHTUdZAQ5DYSWw8NPS0VgqtELUM0tH6Ua13/yqQbE/mTiIynOM8x19od1DQnIoGJaZ1IkNTOGz/DY/1+5H2hduST7hTWqd//Qt4k+96tdBbExmd3skNdhtWLmPjjsOvMFJmtdwGRyFTVZJMyV3Fyzh7uTXZDpCDkzysfrJ6DyROTk8wvp4Lts2Jtm8LXLf0cai+/PQxV9xl1xmZsLen8nHzeDTSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Aym5kWBKWkFJumcTqH09Y4tvdAuZBemdBXf2UcnbwI=;
 b=F6QK4+ZtHgBPzmGmHTmWmY+MB45+SSAW/PC60qLfJqBGLG0oiQxpqxBtvbYvBPOuseWbs/U/W2eIf45CF/RpgnLXetYpshrUpS7NGPNKy25HIlXDanKG9mUSjeM2Bof9Twvmg/kCG1Iy3c3zvYbF7U/EebhiNPuW5Hd+i0FcC5xbzzHaLNRlrJyk4Pc1vUxLxkbhh0X9Oz50t+i44HS8l3nRh3HWaBJinWkUJS2nkwycLsXOqqTz8D+HcZ1Vjf0TLoxi6O/J3F5deI76wJZQrHQi+IwkylulIDdqP83yqRs7Rf+kjPGIkR/y2gmLmIWZALxuhbaqSN/daZj5x/rYgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Aym5kWBKWkFJumcTqH09Y4tvdAuZBemdBXf2UcnbwI=;
 b=ruGKpj4R8sUS8ePotffY8LhXzdsdFncRnJA/8awV3wAhVw23wDATWvUHa/umLKWje+gPTKVWfM8aKPJElIPunzLfqoG/WLdYfCKU/8I5mhSWaZhoePfLPNF8pKvitLBUT8UKcDRPhn2bAYoCf8KAfkVzKTdPozrqeWSRxK+PTpg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:13 +0000
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
Subject: [PATCH v4 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Mon,  2 Feb 2026 12:57:43 +0100
Message-ID: <ea20b9b8f7ee412d935cd33b219402e0607e3d12.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: e0b9557d-4292-431a-18f1-08de62529f16
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RBaAn3D0dQdHN/8uZS+mK9HxxyDfTJLmJCt/ivedqcWJTSquVtkWV5QNI28T?=
 =?us-ascii?Q?xc3R/EZ/+hR1Nz1BspTGYk6iJQXVkmeQMLPGguBeQJbEo+sVxJk5f+HehMFL?=
 =?us-ascii?Q?m0GGu+IjLnpC4uRfCJQm4YR6CK+cVaP1Av9IZHlhUoy/WZ7xoD/z5TR60bYJ?=
 =?us-ascii?Q?22ycPLf/Uu4jWTzr/H6CiA4kjci0pkNiABvJqehduZqxkmjFKaUbCo/XSrL1?=
 =?us-ascii?Q?ka1+dNunS17g9EjFx9fWMcDx7End80A4WXw+zhgPvjKSOCwNGfj3k/jcgqdy?=
 =?us-ascii?Q?agqSkWRz1H9FsrNnpdmtqNw9oBRSHGcEYM0J4JLUU8g2PhQmpaJEx0PRT0yB?=
 =?us-ascii?Q?G70auPI9E7i0THMujpKCDs6KUctjpWs5l3h8hmDO+HgjqLug7YECoij5wsGt?=
 =?us-ascii?Q?G/ixA+Wiv3eb7EjX12uOpRr8abVzjlE3lIitEEujR9gAJ2le31vk/vpxeE9t?=
 =?us-ascii?Q?zakM2s1MnGK+4c9208wytzb1e7gF93UoCn9+psM5mKBDl9//A8FcKkgWWevx?=
 =?us-ascii?Q?iUkwZHcGsyYAhYJfI/7vZxJjh0vx0eKaSf7KxgUJOvLC/uWiP40/yFW0HGdg?=
 =?us-ascii?Q?CHNrWlhb1JVYfC/Xg52OmEIxjwGPfAUVyK/LKqHkJen6Mxm6mg2kjrGT2gzF?=
 =?us-ascii?Q?8k4x1yYlim0M7RxUDTA8CvPnNeYU9gO7NfMAGDDsUj9kKywUZVrWIC53HaDB?=
 =?us-ascii?Q?P0GvkJ5wUggMrWirGBM5wYqU4K8fbBLwU/JSkkXob5e1OUqHdQ2O8tdIo4U/?=
 =?us-ascii?Q?TqumXJsf+B3z2OCGL1XBNW2ateu2sQLDugAY5DrUBo3COZZGTex4EndgDkkE?=
 =?us-ascii?Q?FQkbUM5CTkORiGJnW3eQL0KwxCSMh98zCmpTDoMu7EJgTrN2DVmsVi301FCM?=
 =?us-ascii?Q?v0WAzsfu4cYS3/3qSOVluZpfULzYfTe5c7gSg105815eKx0mDFl5panIihNl?=
 =?us-ascii?Q?0hWf7xq3k0aHko8DvL/EyYUwOXcY2u9e04IEFlPK6nPGGq5qpg4xwOGogrqj?=
 =?us-ascii?Q?dGesDDKgkExxPh1gL96WTQqo91/eIjuKt2Bbu2T3eBnQf01d8w6nvlsPi0FD?=
 =?us-ascii?Q?wiJs4Ha0UOuaA3w/VR5ZudeIIyUx9ruOBWPkaMHpnLNDbC7Czs16ntrbkfqY?=
 =?us-ascii?Q?oeJ0YBQ3/L8OZD6W5RDqzWRr0nZE/FZYRmNttsZqp/jjOJC8jHPLLEji68fo?=
 =?us-ascii?Q?UiqHaQu1+njtk2YELQsd/RIcbWYOuZtmPcyGjOy8yatH4IScLCpaUcqa8VZl?=
 =?us-ascii?Q?cgldbk2oReEo/UF+uwZ0mZYBB/QdN1aITUW/7hZoa0czgoP3oAq3HP3OHNTX?=
 =?us-ascii?Q?ePTfKCzhELSeYiia3MMaXPYUofDEe0ZGVgwztXziitaIlYXukd6uFlvjgtLG?=
 =?us-ascii?Q?FMQOYqvBDBmYM6uHW4fqoB2s0TM847lT8+JgDYidU2RJZHkFdmURZgERdI4J?=
 =?us-ascii?Q?bJo+6vGgZMNMhCBQ3SnsdwA34IAbJq1Cr1QksbX8Am/K81SYad2If6MT0LgF?=
 =?us-ascii?Q?omt/ZFsMFjM3ay6ho6m8+8UsgprZRONnE6fVj1IC1zU5IldC3wtasbBo1StU?=
 =?us-ascii?Q?8IacZ+hvH6gToNkiNhjbZhrPdMDGcdOgkcvVfuZ//kbGVkErtBvIcmE8eRZI?=
 =?us-ascii?Q?dg6eYBwCqSY1bNVOrMawsJI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YA2gnVQ5WsMhQVFCoJMpr/BsBiCifpjWIJaOy4lb2YqWDT+wiTOuCn0i9dZ5?=
 =?us-ascii?Q?4zAhkkKRcir0baLCbFvUoEnuAGGeRGv9JXDjrhBYuUQNYW7qltq/7u6ED8OH?=
 =?us-ascii?Q?lViFTGBG/Xbrgg03rZkgmvqINXjllDuP4oSG/HsLbHJjNRrkPi10rnK70iKo?=
 =?us-ascii?Q?s+9x57OS67+y8AC0WmXtIPQoTV6w0i6FpoFwywpHY/Df7CP/KeWFZjdSOgEF?=
 =?us-ascii?Q?B06kp05erSdzbKAzdfQdtQf2F62Knd7re2uYgyvZhyq9N5Iwc4dUA1nQV6hq?=
 =?us-ascii?Q?iFfEKWCUUW+d3aibuOzvZmTpWqjXEBsw+L6o/NOvmo+doFordyKPBX8uUcRO?=
 =?us-ascii?Q?JcK34GxmHRZ5Hxv1/uN/JeCeosMTjd05iuumP3CCc+vaQVFf9s8tHcftEr3L?=
 =?us-ascii?Q?7VcxFGtIWiaLVsqG/O65o73mNaH/nCXoSR6Es52GzdBXKCixc6dOaZd5sLJw?=
 =?us-ascii?Q?5YgpRKEkFdMz2J2Pn7k512yqVSgwLGvMRDeW1e7pZRMWhDSL2VQRFQYa59Yi?=
 =?us-ascii?Q?+X5xL6YQsuXFiBcQJn8EK7ucCzpj9tuX0jUfMArfB0fGkCgushhQC3SY5Pa1?=
 =?us-ascii?Q?B01BdI/QmsiUJEiv+PzQxdYkncvj3Ja3VOpHvDTbdhawXaZm6an/TOfnZkhO?=
 =?us-ascii?Q?7SpEIKUiwOvyvxw00PiXV6itU+88i5pIHitdaxRTIqTYyjfsv91A5aYSQN4i?=
 =?us-ascii?Q?pZwpFaI/MiqL+Jlh+W/8MZrf7mQIavlofOcb/xHiZmi82akX6lvtr8d1kw9j?=
 =?us-ascii?Q?iganJq2KSCloyVqfWKyDTqrBxE9+cCztrX9Bn+27EVHJOi7admJG5LcJzf4n?=
 =?us-ascii?Q?Gt1Qc5UuR50CuFWLVkAWVCXaDpNfOmGVhZScY6JP4CTAvzewGmjliLR1XcGV?=
 =?us-ascii?Q?0Re4rITEPB3751371rp9Hju9cA8zzpQ1i5L3nVc2Bv19PV4MGta0hOPV/KHO?=
 =?us-ascii?Q?uG2ZMfejae+n8XnjEC51qRxiSSVkt1LmMo/JKtVvWJpjUdyxKndYGLAnbTss?=
 =?us-ascii?Q?nzzdDD9fkHj4FrIfdwiCc1G3W0CKgGl6WlTC522IbWBfu7XoUUz7Up+/VAe0?=
 =?us-ascii?Q?G7JZ3q7v6e7vSYWUF/Q3lrBWBJZimOO+FVTBJm08laoIl23LtdTTunB9S/0T?=
 =?us-ascii?Q?VhSV9CXtIFElcRnzdpy/koWeL4i4mMVreVwX8muRb21en845cKUP2GAg7cv7?=
 =?us-ascii?Q?WbjWu748+2sdmfFipHgeUqxtwO+bMtHzrblFSNAcQK/W6vS0yCuiBHzGWYJb?=
 =?us-ascii?Q?4tvwSOgPNhm3jwHM51NDGvZB/Ff2xZGt08xIS2uSPMRq1PegTEMOCSpD84Xh?=
 =?us-ascii?Q?NwpFU6lzB4G++YDW5QrGsY1IuKnSGsFuaMdvWP20vn+9VSR8ZXjXQm5sA4Er?=
 =?us-ascii?Q?ReTOI9XlAOYx+aPNe+vRsgIlIe96P98/l6MJiVM/CgEu5k71F1pGQw81LQGD?=
 =?us-ascii?Q?lE07Ito2Xlf0cIJ3ySUs4wRZe7UEguswU+xJBD+6xRCdbNN3b1i9hTiBlamK?=
 =?us-ascii?Q?Bk0MAMlUqZQ/1/DAb/gh9yf6hfUh1ysasYoRYm8CNzDJv2mRKjYLIJvaVLmv?=
 =?us-ascii?Q?XN8WZn1pq7Gh7YHI9DZky+yAtA7w2re2vWppYCWVaUaKmH/YD4DaKflYqnya?=
 =?us-ascii?Q?vNy/lJb74Z8vmbmibpvClkqgr/J33rbL+v9sljy7fVcCN9tecttiM0T7kW00?=
 =?us-ascii?Q?+oF08fcPbjoVjlLPSZT89g1XwOySrM1kC4JsqGEBQmG4JwiNvFdhE4qJXKhM?=
 =?us-ascii?Q?mzSjbdWdCQVyVmClfTBSHejN8zmK2HyNzuH4eEvujkQvg4LCfWOZ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b9557d-4292-431a-18f1-08de62529f16
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:12.9888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CS5kmv02lVG/MnNZc2/OjDZvFQvel4il9xO5qr5n1jSnR6DJjBVc6bEHXxsKhqJANeZpVJvJVY2IECN53HAyeVZDCY0eyWdWE1bXiD4yywBZcd0U+VSDgy19f7Amze8/
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim]
X-Rspamd-Queue-Id: 5369DCC041
X-Rspamd-Action: no action

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - No changes.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 63 +++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 8ea8594afee8..35de1a964dc0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -552,8 +555,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -764,6 +767,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		goto err_phy;
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
+	dev_dbg(dsi->dev, "selected du%d input channel\n", dsi->vclk_idx);
+
 	/* Enable Data lanes and Clock lanes */
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
@@ -1006,6 +1014,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 	return ret;
 }
 
+static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
+{
+	struct device_node *np = dsi->dev->of_node;
+	struct device_node *remote_ep, *ep_node;
+	struct of_endpoint ep;
+	bool ep_enabled;
+	int in_port;
+
+	/* DSI can have only one port enabled */
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
+			break;
+
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		ep_enabled = of_device_is_available(remote_ep);
+		of_node_put(remote_ep);
+
+		if (ep_enabled) {
+			in_port = ep.port;
+			break;
+		}
+	}
+
+	if (!ep_enabled)
+		return -EINVAL;
+
+	dev_dbg(dsi->dev, "input port@%d\n", in_port);
+	return in_port;
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -1408,9 +1447,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+
+		ret = rzg2l_mipi_dsi_get_input_port(dsi);
+		if (ret < 0)
+			return dev_err_probe(dsi->dev, -EINVAL,
+					     "No available input port\n");
+		dsi->vclk_idx = ret;
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.43.0

