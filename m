Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UASvOCbqfGmdPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D88DBD1C3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B927410EA20;
	Fri, 30 Jan 2026 17:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="rUa6yn63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010061.outbound.protection.outlook.com [52.101.228.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE33A10EA20
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TcCkcdeGa5gkZuSLexecyXLuVIFPCLKIczvzFXKs7cC6Yo3JtMGSLg5TT1E7Z+lQCFarKFdxYQ8I9uo6xjRBdlsEJrlgIRZD3ZQYeNXkw5jjoNnMN+/ZMiV6wB6lnolt0cpZrRYLNKAZQDm3RrxvK11ETKIE9bUEukn6SoouU2dYl2jYHTWxf8ZFqKp5rG7cWONXKd9n8YJRrJycqJ/FugcN4jBuu9/2S6lh1Vim0HEGUmoiuf5VkgmxDpWtvg0wtXTtYBsa8ybNjoXgQrIhmLvGb7g3WBmTf0GNVc+zsRry2y6ZCOBOSLvZOkzt5XJ1rcGabP4lgWNdNWljEznrbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m96UCbOug2Cx9gcZlXFp4vJO/z7+PXfayd0uGh9YHPM=;
 b=Mm1NII/tt7tBdJjQ+Z7wpfIsNm9Bfn0wjdf6vaudmM2AeN8lolHy2i6XbZ2AtXkzbZrb+GYpD/9VBAE12L3LbQbt1vJOMVXyuuGIBs/dqf45CBh06rQPW33hhRt4aIXtSbFfNzQNS5OUoQZyiFITtNrevfoGoj2s5pxO1/xq0sSRXxibDp6Oj8lLwXWs8o2D+8u2yzX+k29PqUo9AYG+DDNt0cJ/wReIymFHVgG3RTltc6a6EPe3UUu33Q2/mdjusrpuApMJEW44GmTtMj8eqosgofF+Zcq4vlMolbA3kLbZ0wsNCEsSTcmpmvwsQkEC+Xm2gAa1HGnX+9OaV0jQuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m96UCbOug2Cx9gcZlXFp4vJO/z7+PXfayd0uGh9YHPM=;
 b=rUa6yn63m0ljCYHT5lwMGPqqVeOIY2gLy3WdGdD6shRmUNArCDwdbmyg83fHccFNS1HlBFX4YHrgszCZntBFGdlotgWKkgXn6GJZIm2JEHVHiCQt+6TFL/HTCaiEnbfhMb9yxp3X9mF9HaVJDQlFNHstPX6O5f8pII5v04Jf+U8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:28:01 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:01 +0000
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 15/20] media: dt-bindings: media: renesas,
 vsp1: Document RZ/G3E
Date: Fri, 30 Jan 2026 18:25:12 +0100
Message-ID: <e496a09d0a252ba44d87db94936ff98a585ca1ca.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: fb99c1ce-1bdc-4fd5-b5c6-08de6024eb07
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oItwuBIxLe0kz37LPSBjiAtidY4RdsqqjvsT+8ICiHs4DWzJ88DBlMo3PiE3?=
 =?us-ascii?Q?FK9IKlSRJBG0L1ovKlOvNXEJMpiVoqNUKkiOPLXdTmh7A28tewX+4GK523NJ?=
 =?us-ascii?Q?RAhgwEvkqGYvM62epSXAlKe1Dv+PmS5gO3Tsl39HNk6676g3atbX+GnHioWw?=
 =?us-ascii?Q?o5J5B8escV3vh8PyFRW5Q6+hBQV/hZc90b+fE5yNmfVtksyYWuCZjKJKA8qR?=
 =?us-ascii?Q?lawz4TNABUv49JNsy9O+OdnAg/ScnG9WD+gqMyvyckdVFYpY6LCW5niY4w9/?=
 =?us-ascii?Q?IEWnuH+5wtOKwbfphVsqyof05i7S6ylSi3WoSiVBDoM3yxJFLV2fVlE4R1jj?=
 =?us-ascii?Q?+PL3RbT6Cd+DjhIqNQZUlC9bu9SYP6AtfE9zhnYGtIiMqaBICEtL/M7dlNak?=
 =?us-ascii?Q?AqwfA4UeU0Hp/0WxA0V/1TQ4FlE5ZUErbZDEUYpxbfIg+Aw0nzer+cxF0f8A?=
 =?us-ascii?Q?rrz/by0eu+QQ0iG8AJ/meKlgox37GpCTeCtRw2iswLph1Hrl4/wNuBLwLORK?=
 =?us-ascii?Q?mjy/j8Pff+8OZpIHB0cbbSf5Nid7X6GAYny3f5gX7zr4jGRnRxd3nIEnISyi?=
 =?us-ascii?Q?pIgCBmmZvyAp0Oc+g/xAa0p3I3LG9w3jaEtt8H5wirsnkNvshWGcd+yi4/Wj?=
 =?us-ascii?Q?Z5TH2WZ38ysyNRCkwObeGfSzHiWYH2n19VzO7PldDxEIJFK+BrHFvrPF9fWM?=
 =?us-ascii?Q?5HlOfsU0YuH5Uh/TZ0+vElopkfXmBcE4qQTsnSUSUtRkyYFxRJvq+bMd7pqB?=
 =?us-ascii?Q?AMn+ZqFKtp9INapn9C2mLOMFbBrUyQ7qnAEJ0GDaGghYKLFuuH/vpafh1SFM?=
 =?us-ascii?Q?6PXNwL09tvAOWBkqpvFagfuceyzJ0tsI3ElUDDhrzdH50flReZwydM6GvOH2?=
 =?us-ascii?Q?NnYLtfZ1zZTUVrbrVEaFP8pgL23HNPUTIgFv52f3asEAV6c6wqgjUbVXVR6x?=
 =?us-ascii?Q?X8KKDpuy4tv3g6ZUMyJ/ZHIM1E47z7tlji8MC56G56g9PfiHh3YyhdaLKsf2?=
 =?us-ascii?Q?jtCUfsphGZglrkzj6ZnC4DsF3WEr/jx6Fw/ebw98H2ATFvRyFoL47mIcOpxH?=
 =?us-ascii?Q?w4ACw5gpF05RrZ/5vBJ7QrtrnJ+1bHDO8bTXgtWD/3oueBpPJlb8Ogc8jmHw?=
 =?us-ascii?Q?1XfLtHKz6lISxTbc09hHuYVpluXA9Nd8khmvCiYzRuDWncTGDgomt6TsVP8C?=
 =?us-ascii?Q?4xr9tlmdpHQPy/3Jkf1q8CFNbf256Wn/JTjCOQs/vuiJqaRxx7BQd+8XlM1r?=
 =?us-ascii?Q?7ms3xBYEpV3b5ywyqnsovqu9JvCgcVB+YIhYwIQlVDVZVgQ1ghIJ6cf1AY1o?=
 =?us-ascii?Q?K9G1IIgYe0h08w19rckeXJ6pvfqzIhEOolA7Xv00qoj/ymTY1ol5st/gE20t?=
 =?us-ascii?Q?KRCQfT2kIxSuwuCRDgCtvgeGZjt7oTmxNF8aqrmwq5wrqsJ+cH4WqHfae1yq?=
 =?us-ascii?Q?y5Xd7fyoaOpKcGaUXPxFFLzI5cnr3DX8rV/vc5QZBqg/0YZLEWpfVfNLat9n?=
 =?us-ascii?Q?3YYdG4uNUNu01Ot8bfGG9xBl14HsP5XVHfc3tk+vsSw212nyDmEpPTCConf3?=
 =?us-ascii?Q?2QikeRaovKpXWkc3hDQsWb9TV9YeNckD5ZQLP/y/Scd60vOxoILkxwKv5/F5?=
 =?us-ascii?Q?xeLCFZ4M3EeEhqJDob0nssw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uyag2Dfc3X76i2pL7OzF2Sp2QXyxroCNj8jxyEEo6rhOqxGghhJTBeFl+B6X?=
 =?us-ascii?Q?A1eotpkFbjjyRMcLZmJKWSkm0tZzpu2APnodGA6uEkBHYl39n3ZCRLcX2jeU?=
 =?us-ascii?Q?jXYZ8M0cCgeCWv+xjactH8y6SMbCkG3GCWY6cg6VW/JrUHywSr0lD2zWbwXX?=
 =?us-ascii?Q?QT9zZdRyyEBoFvXVbVE1QdHmj7PBp9YAe/Eka5ZVW+IYMUpF/Ppb0I/OxcWx?=
 =?us-ascii?Q?sKy9P3UBv7PQKGFws7JqB5YvEXXj77/lhpgqYNy0CeaUMAw6t0l4G10ehT8l?=
 =?us-ascii?Q?Mn4qNuhUFIlLIYBNHBva+2iTeJpzoM0QuMt4/D16uNfGehzbOIrh2rmVAFt1?=
 =?us-ascii?Q?eo3QAA4vyWFmGj3nC2c7Czd8rzvKz1JK7Th8DoG6D7swPTqEOMz81/d1QrSe?=
 =?us-ascii?Q?Ix9UpCyvRwd60UTotl+tXEn7BjXVJg6Q4SVXVFKwKgBgY77x52JTtqdTA8zV?=
 =?us-ascii?Q?lobwQwWp0kfK7wBPTFqKuxqyvn9K06BJoxhhUO5r2u7muTBKMpMIp5WRaMo6?=
 =?us-ascii?Q?bnjg38I4xDxseSPkwqGrLERypMUFvKn8BaVq2jaA65vLJcGHs1OxmuKJ+8jw?=
 =?us-ascii?Q?ygvy4sTEys8xByxgl2lmQFEkDow80+zpiyvA2l/rDai0bY0iV1sTk9R6UTDM?=
 =?us-ascii?Q?FIHpO2LMPoqp7wBH23+Gm6N8BJF44ryPeM1aEC5FJ5Gu1j/cfg5gWOPm6w5c?=
 =?us-ascii?Q?8t/ksjh4RtSSy+zJzlrLyMYEtAwJFT5vkbfLURCgnHHf/F3v6kAPHFoOJrGK?=
 =?us-ascii?Q?+iFagsi6FrQUxrjmzzZ+spXxkNy4oYRSEZxZJCSVTNFLmAF+LQJa4EVazddm?=
 =?us-ascii?Q?yh8oddz59dKk//MeaisgaiF1sKGOeacQtkQO5/ilxp8A3mGFMwrSbmn9f/9R?=
 =?us-ascii?Q?hNALH/nHF6VlxDvOX6GVDAnTC1X04mQJuhjrNTDbQcgf841jUPqpSL7v0ulf?=
 =?us-ascii?Q?O+zxKBo8wYv6e00tQ3Geze5WqkDUy7W6g3/pssiml+YjhxYutQ32oNQD+AAv?=
 =?us-ascii?Q?xXTThCL2aUpqSk3WQPxxuk5FuE6pnEp4MJq16cA/M1RU+b0XJTu/lNmS833H?=
 =?us-ascii?Q?1n1+Q6YOCW2q++s1UpsL6j6Sv4idRnnpDO3RSWMfZUWydhYx9Z32ilovjHKf?=
 =?us-ascii?Q?Zs6Wr/mLFVGeEUsCj2dlfAyGofnHZPuRlDIuicWe02THV967KNjfEKALnhgd?=
 =?us-ascii?Q?TaishEG53X5g3AXLuGIu5UdEIMnTo7fN/WrHHlgZ6uiHA4cFEXW7Yzz2Jjy3?=
 =?us-ascii?Q?wI4hauKKMFO2iRKBOjBo78PaCFSv1Jkq8SDxykcqAvME7XmUdVs9phCXCUL2?=
 =?us-ascii?Q?9biMQsZQ1UcvMAxF976MpLGyNY2ocuUs4/OE63eekcvoEIsxf60bz2pYz0CW?=
 =?us-ascii?Q?+nvhIxDAjmLkPEc9HMsCJQ+AxesaQwypCZB6yImaM/nbxWs0w66X+DwHfOiL?=
 =?us-ascii?Q?AzAQbhi7itTWfd6R0ZPRVJA5NPUHSNbAcFeOBAlc6yTpgtGOKXujdVzhUUQ9?=
 =?us-ascii?Q?W+scIfL4gICBj8/dFcDqelBdrDkKOKVyzS7OpFloRoFj2V52Jkt/DhbUKNBa?=
 =?us-ascii?Q?9Dt/NI7HlaobMrTdPB90n/zVz912N7S0EDAVrN2iELvK2dlqGg9VxNY7dtqJ?=
 =?us-ascii?Q?dh5h+412CRctaK3nowc58dhbD6vNFu+z1oXGHLfr76MWB8vjGX4TsCsHIsp9?=
 =?us-ascii?Q?imsTGOrlbGAVd251z3nVX0narQkiZfq8OguUHMIJt/rtnJYeA9kldNO3+g8B?=
 =?us-ascii?Q?VnNePG/R+7Z3J3j5MqFr9ZlfFj56BZLVwBfTeOqPy1VerTvvoovU?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb99c1ce-1bdc-4fd5-b5c6-08de6024eb07
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:01.4722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ifkHytfT+/SplOB9oadja6FiPulZFX3xiGJtZ/K79XIuZvom8a2gK0aT2nvB6BeeFaFgwL8nbIZkVSbI+X2B8kY3CYiHi+Vs98lVJHqkG9O8zrc6yn8QHm0Rf5vxQ3q1
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
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,glider.be:email,qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 7D88DBD1C3
X-Rspamd-Action: no action

The VSPD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,r9a07g044-vsp2` will be used
as a fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

 Documentation/devicetree/bindings/media/renesas,vsp1.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
index 07a97dd87a5b..62bff3ce3eaa 100644
--- a/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vsp1.yaml
@@ -25,6 +25,7 @@ properties:
           - enum:
               - renesas,r9a07g043u-vsp2   # RZ/G2UL
               - renesas,r9a07g054-vsp2    # RZ/V2L
+              - renesas,r9a09g047-vsp2    # RZ/G3E
               - renesas,r9a09g056-vsp2    # RZ/V2N
               - renesas,r9a09g057-vsp2    # RZ/V2H(P)
           - const: renesas,r9a07g044-vsp2 # RZ/G2L fallback
-- 
2.43.0

