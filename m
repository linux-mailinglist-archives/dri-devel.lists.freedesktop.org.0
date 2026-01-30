Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gF5TFBf5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09479BDBE6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4490510EA40;
	Fri, 30 Jan 2026 18:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Xo485Erg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830C110EA3D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2Hf5WVmSmMc3N16rQUDXhZZArFH42XaPgB3CnO18vXFzvUL4/fw/g5uMhPwivRXYVild08m2fgvyynuEFq3y5/Kc4rSvTd7nOTMgRCSOD0qOa0EiSnIz/jlQNoMnrhLl5Xp6LzPhESP/TDwYbH8twhvQXgVN9MpYgeJ4YsW7SEFbB2kp2sH9U+pbEb010VZ54H/KdicrxrJyzmLhKzVuDb3k0w3YkgG+7qImNklOdE9zyYQWio66lUvrJnHsenVTzDibAB+u2xF2MnZ62K0P7E3QNRndXcNxt1+i7mHhtmrlDxzf1Du6MNdg4RSSglNYY7x2q5ni4csTROThub2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gwwXZymn+Ft6Z3jAbPTG7tMINqblzXjnFd+1T6KmkYQ=;
 b=EfgJRg4DfVkc969kqbL7d2Q8PUj+UXiwRfsNYLcZVSeXB2BO/C3ks7JJOJEohCR6HsNAWjqs7MM+vagABny9cssZ/AeVaOJKExoWtOCDwRCuuRuO6kgTBfvmzBEfxl+T70JOUM46mA9eAMcWjULGEhRcyxJBswc9uRRle+KmXu38uyDZ1TSJG19JbhPREmY4SFRK4BSplraQVmDSBDCdaGj/yMhSfZG2HyybgxiaMTwYVRyUlmKWQFyMRPnKRFvu9aayvizC4lHcaeinvvB4Albj4i/QerxVKIr3vzDvjBm/lvIu/BvjyBzRC1Xd/C+LQqvPs7eKQJqYReiAYk09CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gwwXZymn+Ft6Z3jAbPTG7tMINqblzXjnFd+1T6KmkYQ=;
 b=Xo485ErgTdfepGhpg7CtGbjsCjD1zPRGD3xvCpeXg3Q8p94PGayvQY1agKiXOH67Vf9NWxi9wb1XpSiw8GVK5pvnQdEF+GKmaesBnx8V6H/8huh+rcrlFVJenbp1utdg5dD4lYL4VbDE+WKvnIw6V5akrmgvudYcZOLSK6ywFWU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:41 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:41 +0000
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
Subject: [PATCH v3 08/20] clk: renesas: r9a09g047: Add support for LCDC{0,
 1} clocks and resets
Date: Fri, 30 Jan 2026 19:30:00 +0100
Message-ID: <c19a543b75d248c48390b272ad83f4c47c793633.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b5583324-f946-425c-a455-08de602dcff3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TiH8f3LvDmikENaBKSjrflOzDhCsN1vYVhofw/9Pmyohd3CcaQkbtgPRCIxV?=
 =?us-ascii?Q?koGYcWClZjO06AVxp02h/s6ECLMKJOqXGMpMi0jbP95xSd5imGo1schd3527?=
 =?us-ascii?Q?WV1lBBK1NcWOxHmuYwpAh7UIrp3ebEcdHoeOK5Gu1ikpMDhxnyO8GDw9GbAN?=
 =?us-ascii?Q?eIO45m59+E4qFw0Go7FZK/HV9N0fo8r1zMRBbYgGszXyAwo0tZ3iCPL3hO7F?=
 =?us-ascii?Q?d/rYsJ/BD6JuUZ0cxcXz9P2Mm/oWNpBErKlE8Qumz/VuYGTZJxZJcxr+7Yv9?=
 =?us-ascii?Q?na/3Q+GrNscZQoxnq9U77QdoyCubK6J6iULrNwYIdL7rWH+fv2OK5alOJqgZ?=
 =?us-ascii?Q?JMcWbsiJQPDPUvKKII/YrCR8C21nx42b2P/JzCBiyAZ9aahRiyWw6l559Awa?=
 =?us-ascii?Q?UmSSevpxdr/+LxPLt3VJvyL13ozYc1ytSPWUa54rqBD6wkI5EANveNsgDdBz?=
 =?us-ascii?Q?a95pEgimVL3Yrrvn22CTtOp2QUfCvJlLpmmvjD49F4wyaUcJKOOm43VVmRu9?=
 =?us-ascii?Q?HW/HQTAvYxro6TWQVyH6YwAu586pttTisuSDa1tpwS6+SVZAZpAuC3wPiDjf?=
 =?us-ascii?Q?YS/tTDeNgECFCHgE9eEtHzefW81eOiLXRoSs8Lf7JKnpTcI2FcyX8PEzNrkl?=
 =?us-ascii?Q?IWSD/c21GFJu9pMNORrhA6RawNMakGfYZNyJvibihQQdsmTE5Tgp/MyDpaOK?=
 =?us-ascii?Q?C3035xa1nG+C0R56m6cLkhjMsoavrJDr6Nn3TthmL6bOLCWCvLunDWW9TzfW?=
 =?us-ascii?Q?USzatxPAxVojxmUqrSZHvaldy6M0KClljONVwLk608hgwTXKjYT/GZbUQ+PS?=
 =?us-ascii?Q?T2KdNDOl2GtD7/cQzNLtJwKAnmlu1KZ5UmAMOMeIq+Q/QLjA0B74DQWmFmZr?=
 =?us-ascii?Q?Bj2wWTRoAf7c7WjMT54n1WN8cV9nPaycZhRbQ0nj+RVbGkiO87yN+qT7b047?=
 =?us-ascii?Q?GCqJKMBYZf7LyZxJldgeaMXlACVwJh0eFVOa7vQ1AqWNImwPFSLKJHrKF3+J?=
 =?us-ascii?Q?nk7OMXpR08u5MaZ2rwjUGsivTReurF0B19kK+BxBJVekdQujy8RqR+qEZquU?=
 =?us-ascii?Q?qKuwfaL8sPbV69fSWBleWCq3HeeSelDyCb8uTwvkrOxCHkmwFEnclxqudszf?=
 =?us-ascii?Q?djsUd7OFQX1OKTtUFyVfA4fTEAQ8kpEL9qn8s7kFQ06abRJGTVNFxFn+hxUI?=
 =?us-ascii?Q?r8Jrz990IyEBDP0AN0rGW1xzkhuloBuE6wUz2LvvJcb3goyd61w6BoOSeJmj?=
 =?us-ascii?Q?itHO0iTeAYG6GMsabMja3rPgH6DK6Bdkv2/SifCNhVob5Lxp3j5hRyjPq2jS?=
 =?us-ascii?Q?E6mAnwegZOysYDHWXyIsBLo4PLgpCRapOnNeoRdBjW/2/pxaYb9mdXNKEcc1?=
 =?us-ascii?Q?/c9MGnrOWEgwM8XpzP2fXrEAY3fUOAiSMrWYLuZquTDsqsDA3zyhWjzIatXq?=
 =?us-ascii?Q?LKRLIPLWp+ziCjnCATsTP6mxLl4M4jOwA05rKnL6aDOjkZJCAnQ8KBEjDtf9?=
 =?us-ascii?Q?oKrhuKm7OCqFJXVKu8FHfsvAGxwHZuvS73N0bvyY7bQeybFFsVPlrSJgRMcL?=
 =?us-ascii?Q?JEDK+yDghASykyc4RtwfLl41a9i5wcFhpuOaHOvL9OfA2JhjlrzCOjoVfP/u?=
 =?us-ascii?Q?Nu06v1sFZPeTsJbrVxXZeVE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfeY9pO0wBfNl5PbE5ReTnTBv6VTY0qt/5K5ta0yuhJxEfcryG9ImhRrSq9L?=
 =?us-ascii?Q?1HnmlHdlgKRbUWebwQoqfDD2wJQD1Whq43CpgbC+F1cmmahEHFcpM9gSoVJc?=
 =?us-ascii?Q?aKej7ayjZ4fwQwDZr+19jjtEWo7X4568Hb3pucmGfjAW4p5VDDFL6cB20eLX?=
 =?us-ascii?Q?7v5ZHwGP+e78/DpQQLI5cfrJIkmuKG3huQqJqlj/WBeCnngnasDNTXoNsdLB?=
 =?us-ascii?Q?HBmw3cDNeXfk7r85Tyxuq/CkmKQppJAMfTO6nyheqnhR56T2dWFT00rXWq4B?=
 =?us-ascii?Q?wIh/FboVq8Hf4pIEHfqQeOia3rDaZNk+IyghnuZR4xcKtvEQCKB1uH9joE/n?=
 =?us-ascii?Q?14jJ4X7c0tzV0+/AciJxNoVkoUuGJRqSC2ynpqEz9qkip8eMJGIUXRYYOdU6?=
 =?us-ascii?Q?xWHUzYYPXMIhfzj2mjcQu7qcv4tSIJBq5tw3vhePWWJeOOPmGqKe9XQcwG3e?=
 =?us-ascii?Q?/a+6n5wr0CUmD4UkFL3nFHDcx73m+6ixW/u14Ir88E08V/cnjklVX14ulFKO?=
 =?us-ascii?Q?Da3Y8mNHOCdarIevwIiHoaTbvRBS3DP8M21TzQLj7MJnqCnm+4ZCREngHNmk?=
 =?us-ascii?Q?YeItxZy0MhNzAk3PyB6Z1w2w10FJGVzhnx/lHriZ628eyfU9cv0H0OLb52vU?=
 =?us-ascii?Q?UyzdH3X55F71GTcGswSa4okQhAjGrgU0oOUq8giJ1YJ8TXRoQceD2cKEix18?=
 =?us-ascii?Q?QE1frSS4KUzUgiYyUqrp37fD8tdvLhYpVb8AiCWUHGwVAZZ7zLJknxwqP0iY?=
 =?us-ascii?Q?1dGWt/FLvF9z+61ZolHlkNUw+Rzel2Jj5gLzu5eHU4saFHdGTXDqFVPWQDls?=
 =?us-ascii?Q?dNMEbZoaqz2NYjbvMFDsGEIBqM/TFPyGqPDPJJV7Ikeb7O+oGZHqGEbGtmwt?=
 =?us-ascii?Q?0wOsCoNE0gz0pe4LoZxm0Bk0jefF7nZtgE1uQadm6Z2+gQCWyZ+5b8EvvFJI?=
 =?us-ascii?Q?f7GWjFL/5fVehXLKZxjea3yMosndyuPsQZlfjmjKf5oT0rZRMyYiHJhkV59H?=
 =?us-ascii?Q?JUjHOBfo/GvK9r7P66+ZgUkui235WgIqas1q6pSUZxcZCIDFLZkF0bxEbfcR?=
 =?us-ascii?Q?F4oiSwsL/VFvixDXDEAGb/EgYDL+ob+XFu6b+Y4KcpOxjZ6bM+kNprr783sL?=
 =?us-ascii?Q?81ZfFU8X6fS+Tlp8IRIqPlH8pWfpnnk10rmUDJ1boS64h+FHZCzs3Qt4zdcD?=
 =?us-ascii?Q?LzschKJ57owR/YImrfpUdcCnqncqr3XE91V9aZa3tPtn0bMxogSfdM5Xr9va?=
 =?us-ascii?Q?rlRV4sOeeP1af6a+yuiL9o/wPjeQcu1AmtoSDQSy5aiJIJ7qnHMree/QIVFw?=
 =?us-ascii?Q?lLW5U/EvoNRBQ1N4cz4qHx95OvkBiWqjTlQ3yYUxELZQKGcSasScba6yI5vv?=
 =?us-ascii?Q?0AqD+6Deao6okTPAKG68ukEhhjc4qawIaaKSdUY3p1iLOkiAVpq39bZFh7rm?=
 =?us-ascii?Q?AcUXIn1PjvDiOY3PzZGEvflv3Bzv5GOUoy2RfltHOyPomic/VPLVEYk6dN7+?=
 =?us-ascii?Q?g9XNaQkQUzAky8up18VeEAzp4oxEv73j57VMYpuFkB6WAR5IflSewozlba7S?=
 =?us-ascii?Q?P/KaPUvKW8+CpvJTj4XyZFJvC7gVNdD3JO7cJ+Eqyo8RjLWOlTbe7mD05Dix?=
 =?us-ascii?Q?ouMHT6rPm4ZHmfcje+aGWtM5N0ODuQK98fG5Z4rg/xeTvZsedVgi96thQXJ1?=
 =?us-ascii?Q?nvqjfN5lE6lc40FVqGJPB0D42AG+jRaKLr4RS1sN8D02DEVvg60pG+B+fX6B?=
 =?us-ascii?Q?N2HgEDunseUyBGYchWM9zE4p02+wV25kvqGtKYFLiErYEXyYKSXi?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5583324-f946-425c-a455-08de602dcff3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:41.4589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyhoY2pgpu8zcePqrc1gy1eQ+9ygRI0v27P8KW3KFt6M03gY3OvW6qtTB0pb2+iuzBpNo/JjVudkXy7ep1gL1voVRYkE4zGzn0hn7aGn56qIMQzQbX+q8Isz81YNvxPx
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: 09479BDBE6
X-Rspamd-Action: no action

Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 596349fe6132..06ed9baf710d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -496,6 +496,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_SMUX2_DSI0_CLK, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -506,6 +512,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(2, BIT(15))),
 	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_p",			CLK_PLLDTY_DIV16, 26, 9, 10, 31,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_d",			CLK_SMUX2_DSI1_CLK, 26, 10, 11, 0,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -576,10 +588,12 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.43.0

