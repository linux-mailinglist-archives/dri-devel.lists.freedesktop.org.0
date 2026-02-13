Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEwIBWVRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90418137FF9
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A687710E827;
	Fri, 13 Feb 2026 16:29:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CeK/evVj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010020.outbound.protection.outlook.com [52.101.228.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF2E10E828
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BbWmQZnpVzODSUioRtqFqJwn75MhUQGrjzhdNw5LeizD8BcXyE5kxh2ZGmINiYGVFfIqL/gpQ6BmkXM+u6G4yX++HqgW1YW1cCg53SZxl6aBSjmViwhBKilwsMNIgUXYrVwKn2fkPBKicW1yYeJoH7vfZxJ4cgk/5z8Wz5Ci9kLQPZUQSaGTvWyYIsyQheju+mEp8xWP1HbLYAAMsBkAxN3nyWRP9/NOE19VltCgsY/x+kFqkAhwZzz8zhU+aHogp50BeCXwtd7Bxa4CA+77do6ZK9sMfh/N2+gRt4xgecf/DMrR+BXO8Kj3gB+2guheMQQv6qegHYIHZbYsyhK9rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NIm1KJTsChSNTceq3aVfSmbZVspJ4O/0m9SIvo0AJRg=;
 b=yS8bQ5eCd7iuYJDbcVMrKiO2ejpTonjVaWUOrl5a24NZkgn5QFinz/bPFpO4efo/EwabtwlApaas+VxCov5oULKO+tGJHi1xa901V+Vkr7eDSl5fIsKULk9OAp/tYsDX9Oyt5RZj/Ae1v95uxqLkZXnyQpy92RNdqx5CR9mFzy9+awWMNQng3voX62LzxxJQVrDMf1ed+x0p6gCvS4s5B/hGA8nFGpPaNySnnmBgNvNxRCVufKTHTCNMAPNocUrNNGbLE5WN80yevFIBET+5PCC+HfQx7ribRU/d3z097XBn80KWdLDH9oCHfnYW7hhOI/uDS4+GZklZkhLneutPcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NIm1KJTsChSNTceq3aVfSmbZVspJ4O/0m9SIvo0AJRg=;
 b=CeK/evVjwvqQV07tr7u0Z2lpCAaiZIuC1DYt2x4riaSxEmPiR71iIHxbWE/adG+hZK+XW78HvvgC9KAgnoU/KBCacotwkb6caWj/H/cUk0O7pqONKBnq9VnC4zWCFK5q7+nGhfzmLn/nG9hzQzft19yogXWTHGcKKUO6UPZYAgI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:19 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:18 +0000
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
Subject: [PATCH v5 07/20] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
Date: Fri, 13 Feb 2026 17:27:33 +0100
Message-ID: <43859da024c3e94a85096dc071ddbbca1686e937.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: c73e2ce1-bc18-46d0-5ddd-08de6b1d0937
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0dU8NyhmNJQ1SpHeZzdtruiQAxE1psV4Bsuq5V4Eb+M6KXDOA1oUUSPhsRhK?=
 =?us-ascii?Q?3AcDotsezdMiuCPw5k0owfbtODQlEboh/RFlWdrtOVa2Y0YJ6Xl3xSDLBWOk?=
 =?us-ascii?Q?lEsLH3QpzNeqXg2ttYN/kajGs60FoGlaq0GM+ioREnGtTvM6mIW6wvyhBtxY?=
 =?us-ascii?Q?Xf8tQBTboguOcmQuUPBM/BJBxfK5ZlNXhfehvMbDibsb3ABlyjBGCVpx3vN5?=
 =?us-ascii?Q?2qjS2l4MbeRlzB953JDsLa4B4k2c7o6vT6J6v9ETPf/bSRAKGizqGiAG4RCs?=
 =?us-ascii?Q?wc/otlWGNBljf1oUE1wCpfGS+xXlb/DdgGdSx594a2tVio/DBxFoTikWhrAt?=
 =?us-ascii?Q?uFfUQ4YIxtl/sGtRuDMsFOINWUGqVUphOhPt2hxbqHqrNxf211DS8WVyQtng?=
 =?us-ascii?Q?Gx2WjO6ghsL8by9Rjx6n0KlgPDssk1w9bUFQmElT0mYxILw3ZiKOS0tIshSf?=
 =?us-ascii?Q?bnC4kk7E5vYD+mnFCunEBXl+pe1pyqvLkM5ypeqBK/NsN6AHG+oOKUiEvzP5?=
 =?us-ascii?Q?V68Nl/+mBtC49JUp1ptdsvB4prHBBJjGFey8Py4eE7lcNdFl64K3oeN2FE7V?=
 =?us-ascii?Q?4Q4nHcngzitXbAAbyyLoG/HqgSp9VFbFk1ldFY5UHvEJDUOsxCPw5FfphUjG?=
 =?us-ascii?Q?vjwbaoYo+MYZ7NEgnDSkoJlCQPybENXlQY4P4OOGOc+rwpkxrawLSqro3vDP?=
 =?us-ascii?Q?Ra9ZYE3/9kaBSz528EF4d2nPmg9EDkyzMXBXgKqrBXjhb7RoOmrUX2OY+319?=
 =?us-ascii?Q?yNknbIS+CO2aK79Gc771/gJri0VJDamvRkV+TW7BwPc25BvH8mNPB+DolaNX?=
 =?us-ascii?Q?YbXntPs06AQ47mTm1qcyuO0p3msNLF/cHPxQxt819ADBQgzreRxYyDZsC3mI?=
 =?us-ascii?Q?DGEKPxoe5sopaG4jyto3rewrJbC0uT6Ct8WsVG2SL76CzYTQVlAIRiq3IEBr?=
 =?us-ascii?Q?CSxh2+MDDWH/NXlvAw/LwKiTEcdWRot47xkcYnOOLdntN+ARo2ZByHjhMmyw?=
 =?us-ascii?Q?a8fWrLzfK8BafNBTEFBxLzbtxZzgJ9Z6Q8VTMUakFLis6xO3IUV8Gw7rw1mr?=
 =?us-ascii?Q?cdDZBMF2y1Um0K5FYUFxwdP6J2IqUuAF9Ig2GC6kwFlK3e0gdZJcqVM1v0kN?=
 =?us-ascii?Q?3wi4pQz13fZfNLZytYyVlUsA6vzaB/7VFKL/6Cn1K3/Og4j09x2eadC8HE5C?=
 =?us-ascii?Q?C61uRVU3h9keVIIXFrMm7NMrI9viHTIQaSWbvHs9Q0mdhmkP2x91tvNLEoRx?=
 =?us-ascii?Q?Y8tUTK/XB/Gf88XZDAI7c/qzgMPDPoC3D9BmReK36A/yfE8BlU5nqz34trvz?=
 =?us-ascii?Q?nheIw9gTvaw707+sSpTu6rvl8rKog3f9Phru+c+k3uU2xVWCZC1ZQ5CSoaF8?=
 =?us-ascii?Q?QOceDwrxwKsNqpVGw/owX29jFt7j94LfFHtowvRDfFaD+Qy0t8t0d9LplaCl?=
 =?us-ascii?Q?NDQcHOFEdDk7IBZpGvl1ISQ0R/7hG+lP/haGW2FD9Fa2p0ubXmNF5y1VpX6l?=
 =?us-ascii?Q?sFoxelW63DwH04P2l1vStdE1mbDbWRmrTNzhE/NqHF6HhpsAgpEr7WX+84hP?=
 =?us-ascii?Q?HZ7WhYZJFNBVEhQtKjkP45dz9phQWiY8Q2gKPG0q7fwRjUYOnSz9fjpTX8w5?=
 =?us-ascii?Q?P3PZCAiUDutqtEieUnfKHBs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pVzeexg9+pzGejCINDLmrWpjWpO2xbyNF09Z3BzceCoJaW9TEYFCuSivglzH?=
 =?us-ascii?Q?INwIm4tedaQQPrZ+Zj2g0RrCdmaCFnZFwFFsGDZ+C9uPRW3acdw+Iux0RS30?=
 =?us-ascii?Q?3MOXSEgrscsVg/As/cVUPJ4x16xqQGanDcKFxMQVTDQxzRj3oAsbK3Rh7/+i?=
 =?us-ascii?Q?4UDCviUvnevMnkjpZ58E1femkBrECYK6SPmeX4bb60xf/T/Hf58iyJQXcWkx?=
 =?us-ascii?Q?lXZM1Uxgo60yJSAgEN+TCkrndJuioo70y3QoUzdPfF4LSPyHSgyRbn/ZrVKm?=
 =?us-ascii?Q?EfwY3HI6DlAVsnRq6AEH/pgMJEEiBSsz+RxtYPQUm3l5CSV1h3xutzeTnOtv?=
 =?us-ascii?Q?neC37faeuGLAyl3lTllGHk0/lc9Tp9xeCUoRo778sEOvN6QV/XBVg7/UjCTg?=
 =?us-ascii?Q?VdKKIplO8vhXiAfoU11WKFZj/rbwq+2cQv9QJdoOJlIdmvOo3VwBOA68vNLh?=
 =?us-ascii?Q?f2+D+J4mPbfPWADdcAf5EfpxFxEhyL5LRwIuUc2YwoWA/Nu3tzK8zlrDwSNK?=
 =?us-ascii?Q?pX2unOWHYE9Qen8QOlNGLVhfxef71UT0a2YTvPYTSTCD/8n6VpkZSoDd7vzH?=
 =?us-ascii?Q?hjZjv3AlLzP8cbmTBUPLcj2K8BF1tyM9UDSSVTvLNQQXxAYqvWfYrZpM1X0c?=
 =?us-ascii?Q?yjQ7d8m49wz2tGr5Un6iKn9nmEulfZBDDmnCgiv/wUOJ1iOS5XzQMQ03Q60p?=
 =?us-ascii?Q?ZmiQBOwAMNSydceXmYs2HqmxKfBkiu82ol6vs1L0B6869edrvsgS8CvqenDJ?=
 =?us-ascii?Q?VA1znC+fACjkqJ4Qu5V570n0DyMTOHyclhkDw7FynnULRwQOjxgpy+Xp05FZ?=
 =?us-ascii?Q?Fs+GpF6qbl2KJQmhGL07NU5k9DxpLaUvlHw2qgXaFQpr6eBR7sq/fsuuqWyI?=
 =?us-ascii?Q?hPME6Uy7bJqzWm8IU/L/aEfacTmNOHliAOUqhzxExCC9Z9dw0tlXAXQCaJ1K?=
 =?us-ascii?Q?TNGLFRrSaKD+NaNtv/yfvwEknL0ZV4APilTvKpU4YpzoDnibKcUX07K8xItp?=
 =?us-ascii?Q?MvqK6/HX7ZyWxAwjciGzE5Qff1s9GwGOhRxLqES3yF2H/lNatFsx4tEJzwOC?=
 =?us-ascii?Q?4DJhxfd98ck2PFLcY8jyD/LzL5OvNrEAiWnkGIfpSoa3dYfqF4kpo8MEqBx1?=
 =?us-ascii?Q?PsI1sDHA1y3BzVzWOGEcNi55605O/wIkGCx6rrRtpKHSdcjtOSGQr5rZT7UL?=
 =?us-ascii?Q?GcSM8Nw5vN9QFZ0ubyC2heMXLMtchldpa4AsV06WbZ7ZXm91KQYGf575fM9U?=
 =?us-ascii?Q?0zPOoHUKPFKkasw3IDSb9MS4uIYJrtfbmTo6TPc0is3rTSEaa8HHcwQf7T96?=
 =?us-ascii?Q?+qQ7SW4nBotJm9Qid5fynFuQLTax009wKFWp0lQe+AQVn8NGhSxkgdZKJZZz?=
 =?us-ascii?Q?6/vl1ESbreGFALHUDLTOA/Eoo/fkLWAa6cM2c37RCz0XCQyAYrzEEPPfVfBv?=
 =?us-ascii?Q?njv4bsrJOn4dY2Gdip/DHf6T8kOjD5hwqLR5aglpmba1smghWRR2uKzYnYEU?=
 =?us-ascii?Q?WO9i36VisaDZp+3yORWM59hLQahcfGP53iASOXz67PMhgxjUonj1LI3CXodE?=
 =?us-ascii?Q?5wwufwNV6x5bE6vIdkYxluLdrFsNB33Piwz6h6B2KLXCLXBD4B1OKoC+j53Z?=
 =?us-ascii?Q?cSP84Fhji5my8bCgv1QNDnt8Rw59gBfmLz4bavl6wF+yTvEbfmw9+7lok9sx?=
 =?us-ascii?Q?BQ9m+gawucm3vbUOQXYf4z5k2xYvUnfEyE6u3Ih53lBgJxr2rupJsvZwOitV?=
 =?us-ascii?Q?zi912PbTuL/3YWvTuT1bbwKNrXcfjyoXTJ5IClycFzAUlH23LLgq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c73e2ce1-bc18-46d0-5ddd-08de6b1d0937
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:18.9081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VqLPaLRCSHpZnbkqh7RrnBXCwCg8y17YW7V/N+iEDDe45uplT/utKRRDYpsarrBTcJs5zJqigj0MJrzGTmnoQq89BEHZf47JOxtIIpN0QOtgFPJ/D0xSMpiADW0PRBQR
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: 90418137FF9
X-Rspamd-Action: no action

Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
to enable proper initialization and control of the DSI hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.
 - Fixed "dsi_0_vclk2" position to match order.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 1e10e6ff52f8..596349fe6132 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -486,6 +486,16 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(4))),
 	DEF_MOD("cru_0_pclk",			CLK_PLLDTY_DIV16, 13, 4, 6, 20,
 						BUS_MSTOP(9, BIT(4))),
+	DEF_MOD("dsi_0_pclk",			CLK_PLLDTY_DIV16, 14, 8, 7, 8,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_aclk",			CLK_PLLDTY_ACPU_DIV2, 14, 9, 7, 9,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_vclk1",			CLK_SMUX2_DSI0_CLK, 14, 10, 7, 10,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_lpclk",			CLK_PLLETH_LPCLK, 14, 11, 7, 11,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -494,6 +504,8 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("tsu_1_pclk",			CLK_QEXTAL, 16, 10, 8, 10,
 						BUS_MSTOP(2, BIT(15))),
+	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
+						BUS_MSTOP(9, BIT(15) | BIT(14))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -562,6 +574,8 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 5, 5, 22),		/* CRU_0_PRESETN */
 	DEF_RST(12, 6, 5, 23),		/* CRU_0_ARESETN */
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
+	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
+	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
-- 
2.43.0

