Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNCiMj5Rj2noQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D5C137F57
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:28:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D5210E824;
	Fri, 13 Feb 2026 16:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="cf7IXhPf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011034.outbound.protection.outlook.com [52.101.125.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6879E10E824
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:28:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ysmw2Xv3NpGjzLchGzhrKr/tJgOm7LeZUsVBwcawNmRZ0u8rv2mJFOCO9fUOQjnffxNdm3vs54omVZc7OuZrJEzaMSc/Xslm8RBTFOO3mpeuaXfw8Lhme+N89IgCSnQBKHHPB6c6U24deR0gG9RvvRg7Si+AyflVX2l/36tucbKWfAhHLXzEE+q5Mc+Nx90gU3J0CN5OjkB3POC5xg4AhnUhs/t/OBynaVV1g4CTtOLyFfRpj63x0Vjet8T0i0CtDj36q5LIKgoa6xw/OF3ttlFoAVc78o2R+7BLkXimqUgJB7wcstmTeIXrQgwBDaKvf7r+jib+KLK0cIQmbBq26g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZpFMmF0oq+CCZrqtc8DftnmEH1w/W2LRx3j3GB0VO2M=;
 b=sGqAUqrIqeb4NQ9ToxQ1YTYjPGz1MgNsx15I70JjC7yj+0egNS0W/gKhD1oRe7SdFx9iAG93GcBrrcd5wUV3WoFE7P0fWg1yaZff5icE6WcbT93y3dxykttVKwZfYoUveobf1c8gN3R47vxynKHtl2hikkpbTiRVQ4t4aGE3MrmLVY7UhbkTiMOZ+vKCvSCg4IqJrcUCo+Wbqi3t+IqfgAWNgurYX+b9uX4pOnOUeOFL+Bn+R4G0dqpG2ceJT1TZkosgsCm90pqwmttNEcIoY8vVwFhU3wl6EuEU8sbxP4UOcn0aOtHpe0ePPhjep3Hi1QuIyGWdtJ8cDa62GSvCeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZpFMmF0oq+CCZrqtc8DftnmEH1w/W2LRx3j3GB0VO2M=;
 b=cf7IXhPfTNpaPRongqAReCDxxj6VORPjnSAlUIv1o3TYhboi64+H3BL67BSd/RPN3iZ66O80SJPZQZHGj6PMzD5K4OnREoukhNcSLQ4dPhtM+SGK6+tvW/vVKcFcNoo2LNU0F4FrdOfPiCML8mY32eJvqSxmctiQYGaDqua6k/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:28:39 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:28:39 +0000
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
Subject: [PATCH v5 02/20] clk: renesas: r9a09g047: Add CLK_PLLETH_LPCLK support
Date: Fri, 13 Feb 2026 17:27:28 +0100
Message-ID: <f5d41629bac76f80a1ca173a5285a37551b91884.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::20) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 129b9926-8b4f-474b-0838-08de6b1cf1e7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q2tUTa6yvHU7/5tnOhiT+aOF+gXmHwrxnYBw03HXRULJizK1cR0JmP5mAjwE?=
 =?us-ascii?Q?0TvKwfkliPNMYIi4EW/5qvpJs9JwboboUC0ZvGAkehBYn8P+4/WUGNf8Ox2P?=
 =?us-ascii?Q?S8DOynl/wkryUXm3V4EnhELIfTsh6xh1Cr84gbRkg16mLpyYlMW7KNDlnKKR?=
 =?us-ascii?Q?l9UeU2rcfeACU4U9gwWDVRjzjdU/KE6bIgy+hhnh31RfGZyzprojEi1n3043?=
 =?us-ascii?Q?vGC6PhYDIqH5Mg+xSQvQ5q1gqfXEkFUg4F3lXvIEGGye2VMgTutzSlvKiNne?=
 =?us-ascii?Q?ASEJytmjBNvPPsy5WHHcA5DyCNNzDSa2faJ/BBFItbK11ncJVpQcJYeFX5+D?=
 =?us-ascii?Q?ODLzqciX+ilnpCuhCjh9c4F70g4NaZuVay6OMf827r/Vx70RLfJ63u+G7AaX?=
 =?us-ascii?Q?SQ62gokEtJWEyWyERs78J6HCBHWm+I9DwJBLonDR1XPLXVRFGDUjrqoKPqph?=
 =?us-ascii?Q?n/pQ3CMXBBsQqaKgNTkhMb1fmX2dGCEPR5z3i6VIvCZTCu+/hsGxSVkR8YKL?=
 =?us-ascii?Q?/Vi/TUB9Hf5UQ3ykDlBANOwz9v/gM2Qpzau4eIlWaDlLv2PjGODWCVOucqrK?=
 =?us-ascii?Q?AiLaTZ4DiwlXsygqnS0nlXgIdduYYvv2L8ny6mxYURJBObxTg66gF+fQg0pT?=
 =?us-ascii?Q?Ob397fdO9hH5KuUT0OaS5QhqT1ikMxkWfgyFR3wmj/r6ELUEr/XLzVmJC1xl?=
 =?us-ascii?Q?Ie+pJsBYLBtFdwjwCt8olPAhMpe272x9NQoEVKPpPUFv6zP9K3UKqHmOXC3B?=
 =?us-ascii?Q?uhRLpTsTWIin/Au11i0kgzaPtsYU8UJpbgDSf0pKz2cIfu4BcsOX+UTgsD6W?=
 =?us-ascii?Q?OKJa7QCrfkhiqk/U/zz6dN/yHhUATjzEjWUs9Hvtl+i6s2GyqFCke122HVdB?=
 =?us-ascii?Q?GoI5dc8aiDBOPaAExNbCpZgeVqgfZ0TuJO003iAMTBOA3TvvlQmDIBy+ZdSc?=
 =?us-ascii?Q?wF9wUAl/CaGFF/PCRGdTITtF0a4iqEe3svqhRpKmOTRtgrVFCb683VfIhY1r?=
 =?us-ascii?Q?UHL2p7F4uxjGX56nfGC/k9bdzSCVhQfvgFeJM1uzqGt5NbfFHtjZZvJrDFD8?=
 =?us-ascii?Q?xnGA8slY6gvucmP6TJcgZjvZg6WzYXXqGKwxHUysfwyYmF8n1Pyw/wpxiobq?=
 =?us-ascii?Q?q7wEBoITls4VM0FmljqyQyW9HUgZFszZsGtj4igS1LJaLVgEyaoQZYQLfVSI?=
 =?us-ascii?Q?x8u5lsHaM0XHPLKal7YM24PHJt+omFPNP/0QJJwMdFGwJxvK5TXi0UAcZLiC?=
 =?us-ascii?Q?yAPUskAycJrOc68TwkQ7kInnnCUJA7Bd/L9exCb+sQVaE40gq3UNh6HvpNL3?=
 =?us-ascii?Q?E/cHOFPFtl8iO8i+kWLeHg+ydNAb8IFBo2BgQBxsXbdspmYnymZEW/7kqhoc?=
 =?us-ascii?Q?VsvhZTzqIBOwWL8AfOLOkQG3t9GPooZeJW/4gdEmS66Mu3mIBJHLNrEO34IE?=
 =?us-ascii?Q?/TkI6SS1TWEzlMrtVpCNTP6681PScYMxT/Bcblm7SAQHQiXBSIBHlJ9xRBsQ?=
 =?us-ascii?Q?GSHnM+9C9cjs1rJWu6L8JXkSsmo63y9zt9sHCatZR+0zyTy7yzMcFZAPbxDr?=
 =?us-ascii?Q?vco8ILZoiOavSGvH6GgEVljomOzUfRmgZZgBCO+ZacU1uNfNOpR5up7Mhg11?=
 =?us-ascii?Q?Y72LW1EjRPtkluJIj65u+t0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y3y3FqwrUbveaBzmYwrd4nLdOGcWkDypps0CFr1nX3ndrRmlNC2c0Vki6Ggu?=
 =?us-ascii?Q?fVYOGj6d3g18E/OYVDf8E29o3XVIiT4+C0lDEwWNVWnpxT7AhkEBOQvUYW06?=
 =?us-ascii?Q?U5yh7e9gMkpHNy1En3DvyeUTymhHUWbyKHL71rp7CuF+o8GQlhFeCXv4vLUa?=
 =?us-ascii?Q?4ZLK0mbWWl62NBNWRHum2Jhf+FLg+fHrNTvO9RcX03ao59gxXTl5utZmdxpq?=
 =?us-ascii?Q?VbiTYPfi0sVquSRlBFJ6bDsOeVdMr03+cwejdW7/+SIIJ3uihEkdxk6kirXT?=
 =?us-ascii?Q?b7m0vcR7h5+YvhrwWMH+HDFKClE7KXPwUXzLhKFSSh158560bdqXl2ZJa5o3?=
 =?us-ascii?Q?ZgZM0k9Y1SJdMC3hF1YtyD6P70NK7Jyt3bqYFEouB92YQ8kCpX8x/ysrxYeO?=
 =?us-ascii?Q?86dOE5l4eo6y0vFWVYDqglsVG97WFQWTFZa2vHNNmTbaTZ8r3Tr4wpls70XX?=
 =?us-ascii?Q?W1DEgBQDlOh+1xxoGGQ5jUAR6jFeSA9jOAx6yZva1y2YRH17vuEapLH4ZsIA?=
 =?us-ascii?Q?01QT95w5e2A+i2EJFWGyJoeJpDqTuPt/PV4aFe9goKCln/qxkgaW3B3VSMB9?=
 =?us-ascii?Q?7OiM38IdiCFDf9Ny3MEbMenKa0wWJUA/+tnrDrb99Q7EUbxdkYLK3EgF8laC?=
 =?us-ascii?Q?C3irQv1EsxHCINAkVZwuctx/+wsFODskIqxH2LSdnc+F2VpqilPu1USAoUoS?=
 =?us-ascii?Q?5XdHoMPuxA6joEJMDsK108bvLS/b2xbqKnMAWQ1MNhqWkftiy5HXkgIgiD8w?=
 =?us-ascii?Q?k/EspIPfbPdGHnkxAXCz4Tklo4ZIjVT77L8i9dJApuncjcPuWMkr4wjiN9dh?=
 =?us-ascii?Q?AYqBhDO6ttVA+1yn8IHLxfgUxzOLyT5ov4WzOPPRfNJZUhUR//iQyWwjgSol?=
 =?us-ascii?Q?gjhwmADVa4qoiUpz2JEBIX2+3To1GEzA5+vg8R6sct8EqVgoNs61LGdVs3vq?=
 =?us-ascii?Q?MRkeNJw6lQzwUUw2651cVAHZH33NKe3NKucn3JWMOMAJCbG0PjO7UPptAsIN?=
 =?us-ascii?Q?JmHwmO4bEe7lZZTfGdNcZuySXYmoJnBICgYiJEUkcVPmAjp5d1C0LQkc6YHB?=
 =?us-ascii?Q?RI7I1PpdwV0SQfYpDf8/wdtEQ+oZCi2GeZAJXWl7b5IFMp7BrtUf0rA8dOFV?=
 =?us-ascii?Q?ETYfzXbU8o/6QDVgsIKfeZZmo6yHaKTwqo4D+KCYjbuTSITn1O1wKhyPGpEs?=
 =?us-ascii?Q?c/8VH9FRNcijCNr0pKQMY30sIX8lMYvqi2YrllX674a4Px98WCalpC34qWyR?=
 =?us-ascii?Q?ZeTcPyD87a5SXXBJM5b2KFrRz1DF3zy4zGqv8QP9q0kJ/a6+qWQJeI8IMB/D?=
 =?us-ascii?Q?Km29WYxJV0xRnHvvJKy7F+LrZwSck2k86pLmH4b4ZSZ77Y/iA5qMe7rK+cHM?=
 =?us-ascii?Q?Vb035Gcmg8t3VmommDU6GauJIq8XmBQguNL16nmms+Z+5svc3GVSebVMEcnZ?=
 =?us-ascii?Q?C0igZiaS3MH7GrBKM2ASAdXu23RTnjUBTn75Uz7xEmrtjZTCBxuZVJ6mTBmp?=
 =?us-ascii?Q?BH4vqJRQCwBvVt+hrkh4YgrbQqveS8KsUxJtywuoXl6zRbrCDcDlkoKX/FrZ?=
 =?us-ascii?Q?Rt96XZsbat6SJj9Fr0IfsFW+mjMGEtClOP+d2t49mX6MM1+wFWDTJhFxBBj7?=
 =?us-ascii?Q?Oijj9aKfINkCZBx80XWCiWUVL5T2ZdWHpqsIoyyqUHvuBEnpArVKW4b+AM5J?=
 =?us-ascii?Q?tV2gz0xHNCQGjItPbnyEImcrXE/l785DWD6xJyBxYkJanurCOd0ESmd0p9zQ?=
 =?us-ascii?Q?5Mz6OSqkANtPK6CqfFM09YlJIemnmu5PZ7tSvlvRgM+gKioCYJ3s?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 129b9926-8b4f-474b-0838-08de6b1cf1e7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:28:39.8123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tQHwdSTxm7tdPwWhnouJncv4jrlEHloeW8pEApJaGxPUr9EOFIvNpTCE5X6gryeeWiAzeF8q8R/TOPXN2GppmgMkN8O+VVL5QVhRA6x7POOW4+Piqhx20PZc2hkGt9q2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
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
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email]
X-Rspamd-Queue-Id: 35D5C137F57
X-Rspamd-Action: no action

Add CLK_PLLETH_LPCLK clock support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No chages.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

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

