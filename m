Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBn9IMDpfGmWPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07160BD0C7
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 469E210E36A;
	Fri, 30 Jan 2026 17:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wSE6hCsY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011005.outbound.protection.outlook.com [52.101.125.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7523710E364
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:26:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EqGHBQ0Q3aZ+w2JXlTPNBosxc/EXe16R1YfcKvNYimkIKyfUcOlLDagEtLIxUlXf7dB6wOt3H9o1P6EubvSEXPOsY0DFBM4dcgkHUqkPEdz4G4NwKNBZAgjH5lhEa+R+jYUFUQzlChFAEKqdDG0cdOQYtz3Jh72lKEHg7AlNdJYfANSQ+nioGuabg6SE703HDDzAUjwZrf5SaDw3oQfPoEow+pogYhiSHRMWpmr0Z+4M0hIi4xBg9UQJ4iAVdIcztIvwg9SiAmwPVSeptgG/Z16mcgDHSIsFF8YC6LfuEtuxySuMeL408WWko6QMJYfb4bRh0jVJWHAWe84YkVHavQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtbZSRG61KcgQg1A4OkD89JURk+TK9mJTylL2ZKwA3Q=;
 b=BictW9/PCE+GetYysm8SpK7B+m4Fbg4T57YuToGU6ePZSVwK3mrq+dT+EeJGvk+BI8dgFH/22lmHBvmvfpmRKLs25UqsVShBbjgfdx5Q27FkH+6ox0K3C3cR/A8Q7BP49sIpuce/L/8iFtd1fhHPpvmNAlrtddWljKs8kcCIR608giGACeMmCWXbDR8rhyzPKlwNUGu0GZZkOjSu5wG51rmHcXHW/dnE9wRjF3vuMwGZDJc0nddIhTI56Gwm3oRIl7tRF+qCUqZ6mh3shj4DNSOwqq5/ZewXUHiZtdPP4VwuCwEdhAA7I+jx1QqNV5qrrmnLQjyg8Fi8x8yGs/Xb4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtbZSRG61KcgQg1A4OkD89JURk+TK9mJTylL2ZKwA3Q=;
 b=wSE6hCsYhKJ8ImjdsmL2ahthN0SSchjHr0WeLI9kysm/hwg0ghbaQ/jaVgzhjRXNYd2qRC5CulcQm3TvLmwAlmVVSlI/SrdlW3nLIlJRkK+HsMUMyyf495dtfeEkHN+S/zRcUHkoNMo7t7GQXi7FiH18lWqI2PTo1Y0pYFnJhPo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:26:16 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:26:16 +0000
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
Subject: [PATCH v2 02/20] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Fri, 30 Jan 2026 18:24:59 +0100
Message-ID: <14de7d2ba940bbd09c56e6bbc7ebdb1161ed5667.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 50d17ce4-23d1-4998-3ec7-08de6024aca3
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Di4I7Do4Yv6Suk+9NlTQTKbgmAbPvpnr55l9UPUSPFZyJgjVxRrZNeipZH32?=
 =?us-ascii?Q?y21Vr8Li3gcncMj3ilfuD44oEkGlhYb50UxT4uh9yYI+hv5hlC67ZR4NZ5vy?=
 =?us-ascii?Q?L7qkocxobbTrU8rPhTp44Z5e8G3SMeSOXq9EUugX+0g/pTBq4hxlwAcwQN5r?=
 =?us-ascii?Q?+UiZv21mY8eDIqQxEDtoCRQclkA381h+gufuULgC+rcFnc/ggl4rY7yBKhuB?=
 =?us-ascii?Q?616SXkWVoEVt5OAuurRg4cB24+d6R/ocEOI1I5qVm1hK3TeDTupPjWIxt+oQ?=
 =?us-ascii?Q?OUv0LpkR19HbNy/qNnR/dRujM+wur9uAU6sF6OYnpqx6vtP70Gg7vFggUPpb?=
 =?us-ascii?Q?YOqUvzwACCiyjT6Xx/O8IcPf/H7sCiRpWv5/aOSFtMdhxH7/4DiShYQ+rR3C?=
 =?us-ascii?Q?+kHZ3JgIGBH+YFieZtaXVQ1oOO7g5xcdAW+ur9UV9VQ46pXIKt2SR/TARGgQ?=
 =?us-ascii?Q?6ungqYD8ZyWoZfoC2oSk3U//9xRV/pQPAz+dQzA0YwP34w2KPZtm9Iglv6bO?=
 =?us-ascii?Q?HdCivUxrCzX3od3ynLOWX1EzDj3snmBIvJ1dDwtX5g37T574PfCm+nmju894?=
 =?us-ascii?Q?949anmn6aIkZeB+HqPt0olV9wrHjE0EKZA5E3uWVcV4pIs2Z/JoRyLHu11+Z?=
 =?us-ascii?Q?k332pwomY3ddHTfvtlOy/lpG1JTiAhEsTisMhZ0WXwUqTT/c9YIqFgsEM+Lp?=
 =?us-ascii?Q?QXzzDsFqHbtskpsXFv66EoQTa9oYY/Y4uuDqytJEQU4Q5bv2zNVRXyk5HxRC?=
 =?us-ascii?Q?eXtVtdHQgvXEv08XUcAErnuMJ2AMkzBXKbVPHyt9c+wl5dqSIRyBS95OYf7u?=
 =?us-ascii?Q?1At2uMpapOKdXI+oBL1fpjxuMHHThIk0FtKZOp8F4S2VkHDpgMbIEgYC7kRq?=
 =?us-ascii?Q?2+u85clJ7xcftINsSKbRwGx0DZ+J3dC3N57bkGyE4etN54NeBlCsvwmPBbb2?=
 =?us-ascii?Q?lFVFDxWV1WVs5cBLkD7vwMLox3yLhe+YumQU5zItl0v+jNedqLkqGf+loLaC?=
 =?us-ascii?Q?VPWwEk/iCzJXrCqb5SiZVXPsn0pe9yIivQMnCSy0yEuaxdrU8l+xAcuVMe/m?=
 =?us-ascii?Q?fyL45AVtuTx+JvLntH8AAlZ+Ll1dUeKfLIeykzQLy7RibAPxalmthkh32Ai4?=
 =?us-ascii?Q?qdsAn0xSOuRf7SIjt+80ZlmDdFjcgFzCdpFekK7IaYpg/rh6OqGNXiVy6BpF?=
 =?us-ascii?Q?vpZFBMpVFVBx8qFslomD0XwfyGdxv7kig3AMpGm/JpyfsdrtYT/wArK5xFkR?=
 =?us-ascii?Q?E8cPI6CDxPuToXFF4QU4gRRUogF8IVuFgGefbgDiq3MaGWODHPT7PdbiZghf?=
 =?us-ascii?Q?TuDqvTdGUajdmqFuJoJqyQLomNU4CxSrJLpkqTsuhktrbJZw5uZghqgaOkdL?=
 =?us-ascii?Q?+j7w5RGTCpq423tr/rb0YQQrfzVLVKQSZl6g0nso/Yui63azCf85iQS9zsi8?=
 =?us-ascii?Q?RJWSWW4KH3Ajj8lyZQDr8u5fs4rJ1Cb+vpGLulhMXvtcYSVzLVaNhaRpf5hm?=
 =?us-ascii?Q?gXQf9QUSUgQ8575QK/fhdW/VVM5LjhqUU21Nj6nYFFwG06wSviTWOppGj0Q/?=
 =?us-ascii?Q?Fxa7GiL5SFMCmjhmAFB41OO4yEVXvn7jPHEaEm7W6CVLNjxAfgMFr7c24Kfw?=
 =?us-ascii?Q?CiICmH7HKiqqcDmu5Oi64bM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VwOeKlriqGIJaQwi7hjt92o5rdjcC6AMh4Td5+DJSwKvBst41T0LVqJ6OfaG?=
 =?us-ascii?Q?k01zEVvmle7WcLgpOesPNh806wTPzln+mmKHm3EOCQHOr/eVBL8dQtxugzDj?=
 =?us-ascii?Q?B42kJLb5VO1bZ3ZufjOU2WXGIuzjDO17mqJGNKoupY00y9q/KNLDYPRgZwsh?=
 =?us-ascii?Q?DBVzrH2zHf2eq2wEJMQfMFT+DM3qFLTE3BrB8ahXTljsJ+rmE3FLWCzkbkNC?=
 =?us-ascii?Q?yy6tzQkvfKVFJmEQ4GvfaynvxpY+E56RHWnwL1HGK2wyJxQdYWj3YPeqsKoL?=
 =?us-ascii?Q?2ohFY3bhLRAaU3W+Gfsr4jpLZSNux9AAOo8Wp1GrwkUhvbIMO5UBOdR9Bby6?=
 =?us-ascii?Q?5X7ZFQHuv4/XuO4iYXVLb+vWpks0Ax5sIGDu2fSA28xNiGwWnYPq+vdCV+9c?=
 =?us-ascii?Q?RS9EfqGTP1MA3t29XjbwV+kU0fjvb1rr27CQ52xrvBj0oG47BDyeHxll1Ncr?=
 =?us-ascii?Q?6d5n8VMghxw9RKCgAzUS5/+ofTT37qVd9vC6i71pd7bo+NACcIeFyyNhnr/T?=
 =?us-ascii?Q?56577RNFjf2zW8+qYJwt6AZ6LK5Krn9PufkHaAF5PCMnULjBtvq/tRv32hvL?=
 =?us-ascii?Q?Bbb2O8i/kEQybOPnn3DbCva3szdIlKe37w13L5NfIPeyd3KEyMj4Pv4yDAQA?=
 =?us-ascii?Q?l3YKuYlCCod+mEOLGt4dBINYxZKAijEuhbWaDrVeFNzNVLv5rXxGa7ObgHIf?=
 =?us-ascii?Q?qej3Sfgy85Swy6e7Bb2pnrnFsc3+HLk0MXYl8Ru0myONeCUgPffySRUr4xzo?=
 =?us-ascii?Q?q13rLDE9km1bukZVddFhieXtydB1hjgRmUP+gVkLmZkA/xqlUSjidOzYmCCU?=
 =?us-ascii?Q?Yc2EqB0oPNT78N6McNtCHQ8hj1dDiSRuLD/aEuAgsnZEvPpaBfxr5Z/C1U9v?=
 =?us-ascii?Q?29nEqo9DKtbaSf6x6gM2kJgFEM5m7D1XVwVXGJp3Y1zyJyLrpYJGgyzPoW/v?=
 =?us-ascii?Q?gCOs12ka4+2U9tAKoojVIFq4uBPehwXl2yDJYpdzzdCLfrnS9/yU2+IgXwgt?=
 =?us-ascii?Q?BpEAX/QPdGYxGXD0/Ht+qmAR8ieX6uoAH3ubFuJbNfmpCMO8+/pKJtcVE+ct?=
 =?us-ascii?Q?3RYUQ8HwYjTp+0buxduEo70VmJ2GCHXXZwPmYuAj4hXIMRbOYmECpcOb9eV4?=
 =?us-ascii?Q?3A7CefhaYoKfUPBnjR2jcJomkubjsoSZeWEPrgg6voBYta6wxUNKVIGwSSI8?=
 =?us-ascii?Q?cpwFr1ZRGWrYQsbrbjYVm3YCQ0rz7bA64HOCjCFO7sbE8zrw4bZbeN5CH/lL?=
 =?us-ascii?Q?obVpZAxW6SCuKpJxjrXmMAdUZx1vnyuX7CI+bbLuRxfjOxmb9q3jIDtvIV7S?=
 =?us-ascii?Q?4t6Ke9Gpcup8GfTHztL8sc4fp9z8Ev6MsVHPtWyYx/w37WLYH6RN50fRvyBK?=
 =?us-ascii?Q?61rsIz5LGcVANwk6oLe929GplgW7IqltpJtZG1dHz3wr/ITnN9hOSVJUhbpB?=
 =?us-ascii?Q?sQuVMQQb6ocRbo+91lCvfXB9Mj4kL+3LhZAuBFYciVIftR4edOHccx+Hb2e7?=
 =?us-ascii?Q?80PtJpr5IEM3RtzxxdLnuS7yPArI3k2LLO4lua+xxvNJwAQlAbGHX/6vx9Ss?=
 =?us-ascii?Q?xOzTyhi4lgCNS8z8weDzF7/KgUCTvKQZbVp5Z4WzAEVi1QBrjK/c2b5u6LAd?=
 =?us-ascii?Q?WcgWoHi/RdlbmLE+hTmJGjUsxXJUCZktzgY+s1bMiz7HApGF7xP3VGpcIHq6?=
 =?us-ascii?Q?8eGi41FE/AXWlGbEN5P7kDY1BbV0dtDef/YlfUHt3gOwDAZVhM8pLli14I8F?=
 =?us-ascii?Q?vDLbN1sEuhOVaePCItni47YNJs0bFuWfiy/KRPMQaO7TbIM6sH0X?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 50d17ce4-23d1-4998-3ec7-08de6024aca3
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:26:16.7911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2i9GkvcDpdRppihYMiXu6e/9JLi0UrNz5KnBHUITZZSUu8vMG6LLCJubc/rfh9o/GIVJCHrv0cNylQ5G8Icss1ssthOxhPqlK3G0IrrtaqGHOExL592wTemfa4hkPSOS
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
X-Rspamd-Queue-Id: 07160BD0C7
X-Rspamd-Action: no action

Add CLK_PLLETH_LPCLK clock support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e9896742a06..a73d12d4964a 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -64,6 +64,8 @@ enum clk_ids {
 	CLK_PLLDTY_DIV16,
 	CLK_PLLVDO_CRU0,
 	CLK_PLLVDO_GPU,
+	CLK_PLLETH_DIV4_LPCLK,
+	CLK_PLLETH_LPCLK,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -107,6 +109,14 @@ static const struct clk_div_table dtable_2_100[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_16_128[] = {
+	{0, 16},
+	{1, 32},
+	{2, 64},
+	{3, 128},
+	{0, 0},
+};
+
 /* Mux clock tables */
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
@@ -171,6 +181,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_DDIV(".pllvdo_cru0", CLK_PLLVDO_CRU0, CLK_PLLVDO, CDDIV3_DIVCTL3, dtable_2_4),
 	DEF_DDIV(".pllvdo_gpu", CLK_PLLVDO_GPU, CLK_PLLVDO, CDDIV3_DIVCTL1, dtable_2_64),
 
+	DEF_FIXED(".plleth_div4_lpclk", CLK_PLLETH_DIV4_LPCLK, CLK_PLLETH, 1, 4),
+	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
+		  CSDIV0_DIVCTL2, dtable_16_128),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0

