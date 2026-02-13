Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mAqQE2xRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF4C138008
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA9A10E829;
	Fri, 13 Feb 2026 16:29:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="FVCqqilA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A756710E829
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G7KAykGLJVdtngXmykFxS9/f9h5HbbZFQKonfm3+6yUEd9oDoOvkBxwuSB+950ARPEyRqqUB/LjoxoHurmkPxoDE3tA8mjCR+g4gTuErthuRawLRUtqlXCObxrDS/5UZLzDKde+ahe8sS+JbjMujyE2d6B1cri878s6pztKSEjsiPpCry+xi5FvcQPOnz352mLweZJhQp+396yykNtQefevS4UnGGkXKgLZab9+dXFf53hq9QMmpefBTgA7PfYTW43jZY5C3hzxCbmJQk365M4RCerI+dB2nUE9iwaU5PML/vsoNnoEboMOHylLLv15vHuQvBz4EbF4KOYQMGHlH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=err9x51utHOIovtnC7JIy7Jxdb9i44UhMcDfHlqogrI=;
 b=W2PGdjaxIOd9UPOhow3Oz1zrpfMltr3aUnpR36hq74Nw7clDyneNBq66XF8YsS4lxcx+U29l61HBb+xkndL3yuUR+UIT5ER36wNsdXfHXeHhG3XbZslT4M9vNEBRuXJUPRNCeSPjuy//jYLyih/0mTpYyItOaEdYf3K46KNGnYNbaIfthwBEq/42PFlkVZTCtYo5GGLB5oXQdJKrzUg8ywJGRQz1Cn/mRQwRGmaAM3tRR/PDaICynrdPt2ObDIDs1JlTXr4etAI7mRQSmfSCICzR6KR596zydprZb3evFOpHJl9j5AJt+DMRLQG/71DzX9JHl7yDbvgh74M+BIZXgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=err9x51utHOIovtnC7JIy7Jxdb9i44UhMcDfHlqogrI=;
 b=FVCqqilApAEzl+ARdpkGbto8zEiPTNfP9at0rt8owpAyf6qDhn/ZhC3RvruhftMGjl7TeZV0TQLh6o+Oix6XecqQuwI0I4vxD6iDtZXe1irKoW745WJzgY4G9spJ3aB/igs4teso4dmCU7xo8ka3mv5vUHCaqsQwksLmcmkFC5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:26 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:26 +0000
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
Subject: [PATCH v5 08/20] clk: renesas: r9a09g047: Add support for LCDC{0,
 1} clocks and resets
Date: Fri, 13 Feb 2026 17:27:34 +0100
Message-ID: <1a22b64af7af5ff444b3f4158a700cadd30aa45b.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: fbb423d0-45ee-4cf7-9a95-08de6b1d0de6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MjyxykAygLlip/upVRZLyosYfG/R/j82cDaO952iPlgAWQ4es2Up2Lu2rLQ7?=
 =?us-ascii?Q?hJPuXUm/BNzfD/r6ovM1SNRnLs7kzGJw+sEE5fNdPnnaEj6N4vnpHPn2uCQv?=
 =?us-ascii?Q?1P04z/jFX8rSOT/+Kquu15/LYBiHNUvxU1eBQJr+uJSizwxzewuFmtQklYAp?=
 =?us-ascii?Q?ygUlD1oeUu4wUsYvkBrk4Wi1Vwq14eLWXpUmHsJC4lO0gIZXwQmeEew1QE5n?=
 =?us-ascii?Q?jAn5T/J6ENLK/i67RKUh1m74WCujvPXEagXm0NPgnkYrof5aAhxuFdkcFj3z?=
 =?us-ascii?Q?0sWlZpfzZ0sv4H3byISaECnc9XsKWX983MvUcYjqSe9Izj3dWKxBR6XNkIzv?=
 =?us-ascii?Q?FWDnl9MgvExsZgwM74n5SBkMWWFMoavGHVJ1mxcIRUhBxDECO7g8kI2r564+?=
 =?us-ascii?Q?e8rFVeOwlNk5bGxvQQKgl6JlmY/he09NN+9nfX13+0UKHquqsCWHxD9SHadj?=
 =?us-ascii?Q?9GWtV7jGGaLYViS6omPLOqYrh2HF9zoQBJ1f4fupybAa0MvecFOhleC8gjrD?=
 =?us-ascii?Q?GVJ7dfEeFkQAm2ysfo+iQVte0yJ9INjgrUij9raOr0+bdZv2bAN1t4SI4wYc?=
 =?us-ascii?Q?yu76aRcHHfyHoK8dfuElVR6KFz4lKkdgw1Hdl/evHPPwYzxlQ+TWWOhGP5zQ?=
 =?us-ascii?Q?35Y16K39Xv9jyhCoCb33MI9vtuROWTNuAXHSacDs9xN0oRcMoM5UN98C/OKC?=
 =?us-ascii?Q?ZOu4d0ZuYlnGIfF3RLEc3E2NLbNUXJCuIsQYIKOZksFXbGWE0H1YTF9Y1JRg?=
 =?us-ascii?Q?HzCCOgPNyVUynzKOnDpjQlay5q9TAqD+ms9VIY7k68lW0Uwn27gPckV4jx6x?=
 =?us-ascii?Q?XwdfSyuVDfgaHpk56TWjHsMYrUAOzmhy4aGZEvPFYzppOSpR5XSDOSj3U+z9?=
 =?us-ascii?Q?FtjMswjoDfbv7oVWEIh+Noz1VzYe3BonxDHHL+TA9ksDtyMH5HaQYJsQoEPr?=
 =?us-ascii?Q?b3u9ILp0OOzqGV3JmHZlndhc56VG11H5T/ZF25ZEvfY2Yv6u8UYXkHXPRVNm?=
 =?us-ascii?Q?nw5dHhrzEakQED8wro92xSKCsb9Uv8MebQsvgBYUagKHHsrD1U8/IPKIL38e?=
 =?us-ascii?Q?yD5VpFZ/lJOcDzSb5ZStf/1BCRlqN2w0t8LnWlAtXhzxXEzIuRDVgf3RNsjI?=
 =?us-ascii?Q?97VWTRasMkJP61n7KBgwiNB1PfEWlWKk2jkS2s6nsmK5+oPDjzCSnotOPzDH?=
 =?us-ascii?Q?g96HGtkbK9VYurdHER672+38hiOr29o8h7e1e7WVzLkLpNzuS3vz7bj1/ycF?=
 =?us-ascii?Q?chV9evknuFripsHwarCGrdv23yBFj2loYYapc+sW1uoPXH7e/bKptC6kh59s?=
 =?us-ascii?Q?OUqeVznenKAhNV3If7b8G0Dg9ccoilz/e/rN3Q0YNpunCwZXw1UuIpomVJjI?=
 =?us-ascii?Q?kgSIrbDOlP5litIZs21xuoF8eZXPqbQlw7JkUD+ppQzadqRPLXiPKGMdaOQU?=
 =?us-ascii?Q?fAX7DjqgOE3pHaW1UwiRTwQwNik3AUIns4VGAbJRHmtwC98DyO2QhGuYPXVr?=
 =?us-ascii?Q?AFmdZcPdshKWxKFXJ79zoEDemD+5CR6B896rtcmYuHaIkQY7fPXkl7PrZcwt?=
 =?us-ascii?Q?fSOFTtYlUKdptXxPGKWpH7G+ps80f4l6Jgo+Orhy4/YALh9xjhbVHAeu1yvo?=
 =?us-ascii?Q?LQLWOk5+ZhvS6yWtR5v5uh0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HOeTl5HGMwswLx8tGl/jEAFofauAPworh5OkSWY1qt27r3N+U178H6LDrWCI?=
 =?us-ascii?Q?Ez8B9mam5dgVddsjzqZrwz4bGL1SnBJDJUgMU6jAdffU6SicyrOIa41lgbFR?=
 =?us-ascii?Q?iKgSWMVFJrBGyGo7PZpLf2c1XGvNRM8E1AelP5Nu//2dql+iBDEK/c7+QIYd?=
 =?us-ascii?Q?sMAXLlGlo98Q/qZUeDplEWM7QSfub0eAaje3R5TwdLtFgXp0McLG+1/ZwQjI?=
 =?us-ascii?Q?nGkjeUV5mhAD1A/IYhZzfXI9JRVzL78GyyhyVrRelWCfiMmCa90yrrsK8NHv?=
 =?us-ascii?Q?RoiWTPZliesQv9pT0Ste7OZ2h/WAlaEdGICxy71fSYliyhJTTWhpAQrGYEnH?=
 =?us-ascii?Q?Bwe0dYi2P2a8alseftK8HQANOh2BsR1FaVlqSiMN+cyBS/9OSiM5XUvO8UJS?=
 =?us-ascii?Q?Zcjwx2Mpp/9asby3CCdlQf7aJZYd/gEQBnl5v/+ma5bTpsdD9ACj4im+OZFk?=
 =?us-ascii?Q?ZSEO6ujqLZzC4iUHgumY5H35XZDol1PYw0u3xqkw6TuhClVg43I6rgAMwDtv?=
 =?us-ascii?Q?2oW801EzWcA1+0338cm1QukSSvdwm43hDshTB4n76WMamA17Amd9+fnzepHu?=
 =?us-ascii?Q?KqEAjmIvoFe3EFOBASG8SxeVQ7Vk0mOxz1JHojm+ya9xUWGw4POzWwo0EpJB?=
 =?us-ascii?Q?dm0zXfCpjmlr00AhyVBjv8x2RclPvGVN5V3uDq0CmZmpJDe1E/4TOPzioTb8?=
 =?us-ascii?Q?RPMGI1ChfBEo82N/fFUFg0Hx0S+hsKvmBZ8W1dovajxWlUnvspWcMbynzf1+?=
 =?us-ascii?Q?Ard7RkIsiIMiLL8H/gMySMsIA3WG0lDmENDV4i2BzbCaAbxVE/LGOucWv8T+?=
 =?us-ascii?Q?qVeCMa/3JiYMZHNBF7bRzKxxNo9HojrlzWRRyceH8B8/6OUZuQimkwYbS7Lm?=
 =?us-ascii?Q?7+no6y8IWJjjxk3m7ZBkfHJT+Jmamo2rfW94IDKNUqBnYKH3z3yfn+5SCp9K?=
 =?us-ascii?Q?Jmpg/TqmLVZL24BpLQzQImZx5xEzGcPXN1brIxxZw3Y5Xm7z/OvKYofdXD9g?=
 =?us-ascii?Q?18KF2ZzjAq3tgtPkPABFJpbSJa5tpGyyHlxHqEiTioVNYeEueWhiM4WTL0VO?=
 =?us-ascii?Q?4At2WBq4MICj3qCaLUT/ddWZC3Jr/zthUCgx4rJJztFF4mOwbS7afm+K73Fg?=
 =?us-ascii?Q?ZiPhayiZsW3a2WzttXeSe4pfkT3SYg7jhGYht/6QI8yx4fwCL9WQnJmXiyUp?=
 =?us-ascii?Q?9eGBXlpp16uaDZjTWUCXjucyjCfb8dbfH+ZpOY6pey/uH7miEnJ2pqQRQnsM?=
 =?us-ascii?Q?hLXg9z4Qaq/7dVl+AClEvighXdSSWr7MsDph75eS2ti2IBAIqWHdjDS/a+Xf?=
 =?us-ascii?Q?y5qa4H+QwJa9dhALVktkXvbN6V8lpYw6HgEM9QIbpPdFP7YnaRofUSx0fAVz?=
 =?us-ascii?Q?Q41AppVSvJ8D2RpbdtYwLfXZwXAwHJMWzm8efu6Yv6v9pJLYGPqZ9m9fW3Ql?=
 =?us-ascii?Q?ixvUA3xY9tXp8M3GXdiHu37lQJm9T130ht1kdxmSmYC/Hf+LPM5FXQFR/4w5?=
 =?us-ascii?Q?daf/0O69+t3joRO/ZVShDC2Pkt6V4Njz9VoWKroRceU+hd9eCfTL+/riKHz+?=
 =?us-ascii?Q?s7OQgshW8XAg9T9eGWTjdvaaXCYnoe31wn+DfEuBZ7J9oB2HNkLAunf8egb4?=
 =?us-ascii?Q?y+8YQzgwLgNNRtEt5OZFzd4opmPq3+uiLMvsLiZwczuLoPjmyTIMJu4yYWMJ?=
 =?us-ascii?Q?yfM5Du0S6G1Yvo0uEmu9b6EEGjE/FW0IV0z//VcSODiMFDh2h9gkLnob9OT5?=
 =?us-ascii?Q?wMl6dgKf8OLixb8QSOWa6k0RUteYpU5iwu79r9fd/nI7lU7+LKVU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb423d0-45ee-4cf7-9a95-08de6b1d0de6
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:26.7619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N8Z4FdAuIXsZC8isdJyd6V6o09fGMxWNMhu8oWb+yCG97akUK8Vi36e6F5uBzTjwftyQwIJtgPo2iKx8BsncsR/f6LIb67vDipYtQZByBpn064ZLH0N1WUitK8Q7+dMM
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
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[bp.renesas.com:s=selector1];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,glider.be:email,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: ADF4C138008
X-Rspamd-Action: no action

Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.

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

