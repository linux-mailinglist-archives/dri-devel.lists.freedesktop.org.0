Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGaVEptRj2kJQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BF51380EC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DA110E832;
	Fri, 13 Feb 2026 16:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="M+F2SFP2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010024.outbound.protection.outlook.com [52.101.228.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D68710E834
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iHzdW83unbtdpMZFgB7hyLyLLOFBnErWKWQyp1JW44y5GwS1lJsdDGpxqbskGjaT4efTBR3kBzfVmADBy1wyrNOqdaYwOx8+MP2uwpDrEZcex9mBE8kwFvcP3YcwpQFwvjfzigH5cdwZh3+53PfBc2OqgUS7JZbt/1HLyyzV8kHzCH+kj+QIpaj7awn+qP1ZXt1Uw2Fw7UhKAK2ZhJpzFiJSc+jEOM64TUAb7RvTTOIudEJv2HqOLRqd009lbjokUcyC/yFrWFMHXc9xD/m++HS2xAjt7giANHGR1cHBKQDERYFxbXXaoa26FG645/gA/2o7N9zKiCYsvcBjrlGcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxj1l6j8BqnNIAzP6Db5LelXBRx5HYlvb4xb+bPvtiQ=;
 b=wn46xzVawf7eGF4OpnJyD5EIbeMsD/rWmaKSTGoSAiYHBD0BVN6Jz7a1nSmIFDM7KYasv03REXj2OeAJwPkK/w5LDZr7pyog/f+u4FHPwy+remvkTI0zN1Enx0Pmst2c+4SaLqtlAnArBU9Vaoe90XyT8LqzDanGEhLnqvoUjW992Nig5QGZY3ZxZedlezMfAPLeKcJ+/qopfYEBysN4YQXkzNBlwgxIVC6jJOmxSP6nVJ1qj30O2eS0FeJfK4fmQXDp7r/GBJEk0XUVDG4bsjMGZPRuxJW8pq/VOkGFMnsEEfxuDhGKdrtycfdeg8Zk2ovYWeIyol6GcTdwy0ihZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxj1l6j8BqnNIAzP6Db5LelXBRx5HYlvb4xb+bPvtiQ=;
 b=M+F2SFP2HpefAI7oykWSbmrwXme/miSUafq6KHJ0Zu70kaUAe5yxEpie1f9aCgqLSMer2qxVK2cvy0102fcaHytXIbJOQPv64gIQ2P+fZ/UK9VH2y47ZWee8AgxSXmuFB6sFx3bi1CxonhctKuvJroUmZIVNGa0O5wgfCV8MKRs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:30:13 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:13 +0000
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
Subject: [PATCH v5 14/20] drm: renesas: rz-du: Add RZ/G3E support
Date: Fri, 13 Feb 2026 17:27:40 +0100
Message-ID: <152f19a068fcdf27c063e845fe04a48a46c5b47e.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 970e47a4-0ddc-4f29-20a4-08de6b1d29a7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5aBdIelJWrxpHpsVKmsHAeD2KwmBSGdipXeN4rVO8si363tu4YoOVoy9CFp?=
 =?us-ascii?Q?H/ZZLhDFFrzpp+BkaWr590V7BGgUjxzRQk/Wk2xxIwTrf6ZhsC8vuI8GiSCb?=
 =?us-ascii?Q?A6QCOOpCkqVQi7q1x9Ux8j89HAZFAQzSCrZqbZP3w7v0qIfi+mp7KFsu7P9k?=
 =?us-ascii?Q?Fs8vH+CUI2822mfH1AoePeLXdYys3AA1uzwnZOROf4COCNUQgVsKNpzXsmmn?=
 =?us-ascii?Q?UfFL4jA95iCW7vnuXmqctAoI+YWbEMUqvvE71ArxxbLHz8go7AFjMNSOhXpo?=
 =?us-ascii?Q?z8AD1k5GD9oEDFRZrun3bUL/a33WfaOmGUbK7a1sNKHJIo0i/I7z8+y2FZAE?=
 =?us-ascii?Q?PpsYgGmQe4vkGAwVH1oL2qmK4VEFJF0QNChJiS2JwPlTGCy+Ve2MJk3QDW/O?=
 =?us-ascii?Q?KM3hA9CV+YZntSPNCkq784VIsu3WLlMHq6H6olamBdjoxFcMPqBfer4AecOg?=
 =?us-ascii?Q?FDpawoVutxFOwxA+YYb9wl9TEfb7qB7YF3spi1OngVp6NJLygYc3q31LYdz7?=
 =?us-ascii?Q?dEHlE87XIX9ZlWPGg/vmz5cXii3gl1G4gLcGaitA1KPs6RNc4mKHpDan613e?=
 =?us-ascii?Q?WY0icjP0Ib6oCaNuGOX//M028/yy9KfeiVV9HsC9f44LvDhxvTZ2C/kZl2Za?=
 =?us-ascii?Q?1Tk+StTy1tOfBrOAXsb7w2Eu1Empyzgvm5nFfYuG7vH8+l1BaBRP4Dtjxb8G?=
 =?us-ascii?Q?KoR0MnbTWqev0g/Nar9OLVXjx7+uN5MkLuhe85R3AqbRidKNP/mTPDf2BsQe?=
 =?us-ascii?Q?FvPxqKIKxcp69nmMnpw4GSbQwQxvzhbncTAQ9QaDrNXVATgDRTqeuZf2CDWP?=
 =?us-ascii?Q?pMYr7qVSKdQspCu2SMtVGPNbGu2OZyJptnWJB7FWL20o+w+IX5mQCNhOqbBa?=
 =?us-ascii?Q?8uksDgXfHWwkeKNNx6/LwhLPin26+fBIxijZOGxYqd1cu5/eJOA3NLgc2rs2?=
 =?us-ascii?Q?MskiApt9HHbQ13jPwotctuyXgbyyxtRQnlEBGUTD0+aFfKezr9PqkxaEoQYr?=
 =?us-ascii?Q?iERmWsPxxiBrGXnvx62sMCon8eQRYhOak3bg8+pW0v1HTfk+rWBvkKxb410G?=
 =?us-ascii?Q?jzf9TBtjBFpr3ffaoX6EudALjs7bf5qCEIjMXKt0IMnsq/hrDn3SdGrWALmS?=
 =?us-ascii?Q?Eh6YLDuyqN0vY2l0Og4zIa0ANLA/RuitvMYtPXJSl+PnLRl43RiID3fX73Ad?=
 =?us-ascii?Q?l+5hGEVfnmv9usmFBGo469HE2vLjestvyP3ePTn8XbHWMBj9hWCrWB18eFAy?=
 =?us-ascii?Q?8CiJhgTXS2nEVIDEKFyE2uAqyBpPetJkgghz6CS2ZOJIWbyb+1v8Jv/Lmxep?=
 =?us-ascii?Q?Wt7n4pgUoSlk4P/LWL/dBtaLGqVCg93282jjh7XH44uBwodpN4kGkRBL2cPy?=
 =?us-ascii?Q?2l5hUgvz2LmLSrQoY3VCRqpPkf9UjOi+j6KLM5QkLFmHU8ENv8EX7pITP1Kn?=
 =?us-ascii?Q?gD2UzN5hd1BfWURvqacm1cUICi5tGXHjapc8/d2s1Z0rb45X91MiSacrvM/Z?=
 =?us-ascii?Q?wxBhrInmmpvgNIU4SsB6Z2pH6sIZ6p+uPJ1taDP49z4EvUDQx93eB9sMLUYW?=
 =?us-ascii?Q?rMXaUuL1iAlehd5ymp9scxdmw9Ml1KPtE2+mBj9eyjH0rEOmhLvFHZm2eimT?=
 =?us-ascii?Q?0H5oqN7yGoTpjeqIJJb0f0o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wsnyESy7rPiKHPx5U4qQJv7D+dT9KUUkEpIjmVCquHQiRowt2GyUgoTzv/+q?=
 =?us-ascii?Q?vsGUpOikD7jF6PUu09wha4RTeCtDHGce4pdDleuqjXBFDEJ8ZpO+s1zTmqzn?=
 =?us-ascii?Q?WI+3PnkZOBOHlkAZF9tWeW0cxH5Jbwn85XkQqzGA04ntLVx2PfWpn69ec8QB?=
 =?us-ascii?Q?iN8K2pqzhGxzUF+82+rWov0JW9+aovns0LYmSsNGREBlT8SMgr95cd5eCxG5?=
 =?us-ascii?Q?PU4FtPgu9kEEk7JoolrgXXGxcZpe9mGKf9wKgt07gvJke5vcT9o14pUagF1y?=
 =?us-ascii?Q?q0AFGpcb7AhY6Fu1Qnkl214152qoftUVUva9oRoGAmuQCFwRzFRT4XsRvmiH?=
 =?us-ascii?Q?UZ5tI07alhtZT8pk2KPbl3sBh78kxKIRgG/t5VCNf1qolN5rrvyoI9Snwdzi?=
 =?us-ascii?Q?Wcqmgr04UkXYSHNCcls+tC8KF4uY383iphMnfLuY0TVssvzt8nZC2wGXio2w?=
 =?us-ascii?Q?TCTbf20zsbFUrlKlgxIJmlC2yGCrdNFJ7n/6HkLTyNiQ1vnNeI5zogmgZAiu?=
 =?us-ascii?Q?ya0IpEwz7F743nQak23wX/uacPWuJzLNNxh4eqfKJ/vFaXcJydSEHBgjdYMN?=
 =?us-ascii?Q?SNUGxQ5mWXTnm56kkMwrYyw7Dd/8sPsnA4VZutIDhforcnZD+WHINknPl+Kw?=
 =?us-ascii?Q?do3ipSuywZz7j5v+dIp+0mHsnDB3rTAl/5/qMUqFWBDJskY/0urgGCZt8twt?=
 =?us-ascii?Q?6TAczFdRoyonCnE+s8dKpbs7IqGmeSapGjd3ZP3/LfOvbCytMk8Y6RcSdjnA?=
 =?us-ascii?Q?W9XkTS4fPkwRpKGUuDfTfqll5AyK6RLfAUjqwe8kagTAk++0kETePaCbk68h?=
 =?us-ascii?Q?dI3Sx1GwoactbYa6LijQBU8/5jlRy1+XxZwM5f4z1Wmeaaf9UcUAPVN8Rd7H?=
 =?us-ascii?Q?3LGuyUukiO9r/y3BdN/ToqI0RjRzn4GR9G3zY64UUp1EFTlMYFqr4l9qLb3x?=
 =?us-ascii?Q?EGXh2ibTK7JsVjK2F4l6bDBprRIUZkf5ghi/9KRrl2bzPpqhbT1D0PfbisNI?=
 =?us-ascii?Q?XsUMD1yKhAL8KYvOckV1HjIbUbkpDzNLjhH9nbF/mF7i/zmxx4qCG/pqA6qx?=
 =?us-ascii?Q?+ryEVtEc391gWV9PSOyQ1fFeGozSljG+789c5plYWbQsDgq9Hya/3j+8ef+o?=
 =?us-ascii?Q?ryVbITFPeMLQGcdofC55B54oheAhuHlrJBKW43RXU6BirF82rVoU8B6iFYqj?=
 =?us-ascii?Q?Be/mJ+6cP/mL2sBTS62G0n5VuT0vgs00yEcYDJTIgY2+kbZtZrtHtzSbzfWj?=
 =?us-ascii?Q?aqf5JatANdE2yIi87ly8AXJDa8MCSJIWNTZLlTcNk0F+/+9nmIDwZ62aj+nz?=
 =?us-ascii?Q?M0VC34W9bVEu6Gtx+5e14uRae5aUwvuSObmqPqCR/Q4W7lHxOvNUABgjBl/G?=
 =?us-ascii?Q?ZtxrYUTkKVVx8d5ietlQtUWXirvNT9b3mNv3sVhtUCSV8DN7oxeVn0+CBA6e?=
 =?us-ascii?Q?r5R5cuBg/DTBLouuo2PXDZqePCek2Utw7GOwC1XROHXkJrwvCvqX1keCCLEV?=
 =?us-ascii?Q?1PG9nDwWCaIdDt3/DumqXHemmG0OJzZe7tagzTy5VWL+Le+mrsbFDHf0HnTz?=
 =?us-ascii?Q?40uV4oxjZ/ifPjiL2IBkrcxq7uRbb1gRSK9nmxQIfCUgMKjQuJJPOe1Ti6Um?=
 =?us-ascii?Q?VJ7yWL0UyxZ6da2toNSZIAAulU8DLbi1AdKaZLrZqNwkV8ifE5sK/Vuzrtv7?=
 =?us-ascii?Q?nSLwiZzjnZYyJQJSbEG02cDhOOvfZnOzCYkUyxUsIi8VCRpFGc9vga8clWjZ?=
 =?us-ascii?Q?seOJgH1bqVvoLTpidLix7ZXa4E/cXlp1KkOzAUDJhCpc0ejwAuY8?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 970e47a4-0ddc-4f29-20a4-08de6b1d29a7
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:13.3299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PQYy8IlO4vJ4V20GZ1Yav5ONuNt0I5pc/Sl1nRNwSOpF7rywxQrkqfDMaDiG1wfMXD7mukJHnNL3377KNPeibl2k2lUF47R7Ih30MoJYMokDCD8YXJwNLkR0KdQlwrzP
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B5BF51380EC
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen based on the requested duty cycle:

 - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
 - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)

To support this behavior, introduce the `RZG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du_info` structure
 - The `renesas,r9a09g047-du` compatible string

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Fixed RG2L_DU_FEATURE_SMUX2_DSI_CLK to RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
   update commit body accordingly.
 - Added features field documentation.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 12 +++++
 3 files changed, 86 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..cc35dd409e3e 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -64,11 +64,32 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RZG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+		/*
+		 * Request appropriate duty cycle to let clock driver select
+		 * the correct parent:
+		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
+		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			clk_set_duty_cycle(clk_parent, 4, 7);
+		else
+			clk_set_duty_cycle(clk_parent, 1, 2);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..3c20471fdbea 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
+	.features = RZG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 3,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
 	};
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..480a7bdfcd66 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,8 +20,12 @@
 struct device;
 struct drm_property;
 
+#define RZG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_MAX,
 };
@@ -42,10 +46,12 @@ struct rzg2l_du_output_routing {
 
 /*
  * struct rzg2l_du_device_info - DU model-specific information
+ * @features: device features (RZG2L_DU_FEATURE_*)
  * @channels_mask: bit mask of available DU channels
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +79,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0

