Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM6fFxeSgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:01:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6381CC093
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2307810E4A5;
	Mon,  2 Feb 2026 12:01:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vUbboAEQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A655610E4A5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:01:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nJZI8R50VaAJ2G9ZmGiWosX5mxi/juDeDLWUQFBtUOg+D1FReQO36FXk+ig1yuFDqIuJfhQRGo0BGFxLRhPJT+pqsbgRwv9CZonUjT8i/YE9ZiDPL/SZGykoDyY476wbIvWrPCq63KP2MLMoRpEmUmaRZtBlHxRDEge+7jgOaEUJ9jteVAflRFL7pJkMomZXxzOu0GjaxmmPkxBDBZLnOXZGkrLR+fUxmcscHoyuvn8S+UF4hcTcWKPk1/fc0gzczdS20z1rumqMvBOGkrXx3y7wOt6T1dAkUglCIs5IifKxnfKcuRle4QJxL+H43mwSnEfjQJ4HsqIz/gdsGXtybw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7wJfwhP/3urn2ic2Q5mzinbHyb9e3fAAQqUE65pIjA=;
 b=gBFsrKcGCukyDf96TpJfKQ0BEwNbWqKLMhjlZ0F/s/t1uYbc3Yn0HFfvYx0eWhw1C85AAOIQYB11BnMv5kVVquwEo9bsQnnuJ/o26ZYvN0PvzknYkEzPaXhpKTOpZxDLzXTfq9loJfeqXoMwMOP8tcNgdwA2/v2h9GWBaaWoVQjgbvm6eDCClA/ztOnuTi4CAuMSpoAJU4xdiqO7RM6h56Zk/ASXlhEreSOahJsr1zRQtPY+UHn4NVsKFYPeNiC+7GHOlCCkpb+Oe3OpUEAWVoNR472Yvu69DCrHYjrW8DdE1QlTqZXVkVha47H8kwWnoTqR+4dWm/wMZ7focrMEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7wJfwhP/3urn2ic2Q5mzinbHyb9e3fAAQqUE65pIjA=;
 b=vUbboAEQmt5GHlAm0EUEdb5C0yoVlxMqSyx264AZQpBFLmffzU2y/3Q8EOink+mEP8Vud6gP1yecy7yOkZIgUL8nOWXu4lPdN1JgWd2KkpnCDtJGzZ5DICfMVjsJPKPBusomt+/cghenarmsjnFKF4Up6Cby6mduKanIZz0Nh6k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:01:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:01:09 +0000
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
Subject: [PATCH v4 19/20] arm64: dts: renesas: r9a09g047: Add DU{0,
 1} and DSI nodes
Date: Mon,  2 Feb 2026 12:57:50 +0100
Message-ID: <ffb7b0a1ebb4e3d1f1e7a4ea234b2e59e22a24d2.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: e52d95ad-60be-47c7-7455-08de6252c0d8
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FJg0wFU7c5+xPHX2CZVI2bsUqjTIUZ5LWig2rtCRdyFToBPnjd18lK0hiWHn?=
 =?us-ascii?Q?4XkLaNHGwFSq3p6KeIJ+WLT5+1BpqIftajz76MTH0NkYZWmLsiLJLUXXCau+?=
 =?us-ascii?Q?uKb04kPf9lCHpC9ysMRKb6anCGwuMp5oWaBrC2bpCmYPVZB/LPfy9U7j+mK9?=
 =?us-ascii?Q?vANvFjMrRF4ct6udQtl2jnBku76gtRc96pJD5u6BWSrFiC7ucMGXNx+hXz9C?=
 =?us-ascii?Q?muCtWDS2cEQvSUIxFjZR3A24l1ZNP8Ap5ygExmerzNTCqcyqWBQ30FzheI//?=
 =?us-ascii?Q?dv2ZaZl/CnNIgLEXyRjh+YcpEnWsLqwomI0+BtgYRHuGKnLP9FVL5Bsqhmlg?=
 =?us-ascii?Q?HO7jHmj4m+uEbb/fSQNmzTTseRpqO48muz1elHmi4zTDjYXCrjFdJMH8Jnoz?=
 =?us-ascii?Q?e0u84C0ci8X7qg4P0y9JpY63Vk5NGNcm4rDIeH5tM0AdvCdZh1sLVU42tq0X?=
 =?us-ascii?Q?xieaXwWHce5V8e/oyg3qmesCjdvJHqGIQMhLVm6gy0YR6wkoFNoQ/kIFiYd9?=
 =?us-ascii?Q?MfVNOQ7Btld+0XwKG6WCqk8xEQ1Ax1dZdhyIiJeQesH+ZPCMVRmBBAbGhkri?=
 =?us-ascii?Q?xl7y03OMK2NHQZevqfbzm7I8/8iznMPsWmIt8JLBfeDkkyfxR+lIV4JfnQXH?=
 =?us-ascii?Q?NHATuXfLdkhkMCcMP72LgKxFm+zyRw/RKc/9Wt1IFCShJX+YOmXFP0VHF+Oj?=
 =?us-ascii?Q?YxYXJC56Vpv0t62h02ZbEp/7+BC+3dbyTENIYANowaMKd+psHI1Mwu05g/BV?=
 =?us-ascii?Q?z/KyDAQY0bCER/PB7PDJAy173MIQFaZuKyPxGdKvqGotWsEgQdn/ZKvv5etj?=
 =?us-ascii?Q?/ckBRAcFhNExpmHIknJSE6YajCaQog8Ag7dgJWr2WIO7Lcgvp2R9Z6Skb3b5?=
 =?us-ascii?Q?Lhs8VxNqlDFSkU09mS+PPmNgD/VIkizLpNmo5V/7y3bBqdpKQ5RdWoNQvyqv?=
 =?us-ascii?Q?CVbYVX/uieu1KXiXefNPeeDJpGgXHgkH5JGnVlyh4IEIIWVlRlURx1kSP4FK?=
 =?us-ascii?Q?iEK3P93xz9qerGjeET5B+YvfydLDfR0ky+V50BEpgDGyDyGyowEI7hWS3rNr?=
 =?us-ascii?Q?Z61OYZx+PFnJoWFrvll+PfcVJ4Aah0vZwYEsxiEpRA963U3JWOQQjjcvwziN?=
 =?us-ascii?Q?oGEwDzkZXrNV0suoMNJ6rtrBgBTg5HSzIu4I+st1mW/UV9lM4/tvmPkaTYYa?=
 =?us-ascii?Q?1ppS3zKIJhMK7p5aFR+zg2hywpcWf+IjOiLVS9DkALwwHZhuPtE/vAvQna5J?=
 =?us-ascii?Q?scILdN0vnGDhRh8U7vpV60yfy6Zed8FxYiArTti9Vf1WN/UZIPZ+L3ZJ/epy?=
 =?us-ascii?Q?tYYn7f7E97yZC1Qtm4SoKO5zKPdontP5+wg8+H+XEdNDcRQIIWqCKtOvyBUy?=
 =?us-ascii?Q?9SNf3hSgzrV+G2JbmiP4H17jN6+lmaIfcW4JHu09tfJoUn3p/Wo322sWa8M1?=
 =?us-ascii?Q?KUcSLfOYKVENj923UsZe/ooVgvSS/RhaEqYA52shz7UeaTEcTUSFclnTwtwc?=
 =?us-ascii?Q?T4ulmhj+3NGoj/mTWNZegnNd3viOwSNTn+Joo0fbLqcl4jUXJ63eqw2fv+Gk?=
 =?us-ascii?Q?3VQgOkpUNxGhm9nZym569VZ+e77gutt5KvOKwSTVISiKTRm669Ve2YIFp655?=
 =?us-ascii?Q?2a2ETxvlrMaf/JWblNpMff8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jTeH1zGsBRTL7v4bM7fCwkXBv4Ou14bBfNHicZkpPiZUn2kTovH6GyXPJZHz?=
 =?us-ascii?Q?oWrakDIBG+B3b/tjE1ZUY5xqn9y2HgYNLGr+m8NC3z8tMpilZ61V65N8NCg8?=
 =?us-ascii?Q?KHDeFESfhXCbQhCtO7en/05juVMqo8YMNduJn3hbWicap92A4Hj40d1RuX2c?=
 =?us-ascii?Q?bVoTYVxithT4nvRA2RTPVZNQnwmY+s2k1ZB9pbbpPnc7k7PZilUwSQOKr5TO?=
 =?us-ascii?Q?x/wCUWftWorp6AXoou7q0iLakFywzhOkK0SmC6nxStieUNQ4GE0LmBjFcN2w?=
 =?us-ascii?Q?WH2QitjjX8DJ5rD5Uio17mjY6Uhr3X/BrmuI0EBmjuWBHRhoHBCq6ENICDyK?=
 =?us-ascii?Q?3fKbr+32eQIEHZb0oEGSIo/Q+39FGiTmGf8Zlso42IAK9w6Ms+Z22jiiAv66?=
 =?us-ascii?Q?WkudOt0RD+qIKTiOc3ZO+4/xk7Q7g8611W80jDps/yzlVua9jDOMjh/BFTUd?=
 =?us-ascii?Q?Nt79eOdAbQz24SofeY88x944wmRMP3GzZZxPLHRrOrJDcHPPTxBQ1adFVuej?=
 =?us-ascii?Q?h92Soc/nwLUbFtizod1HOBzaKF7T5j9+VeJM7t/aru9H9AHs3j8capvT3w3/?=
 =?us-ascii?Q?K2vQ15ADPeQHkj8miKPX9lTNgS87HT6MvgJK2DMVqMrDjpJVF71U7EnaRKQm?=
 =?us-ascii?Q?pDuCZeBGuJV5El+1Ljj28KNg+2+n9SVy5ZSsz9usdxKtDEnF/Oku40zHdiS2?=
 =?us-ascii?Q?k3Ogkgt5mCZMynburwPEpnI8Yl9p3oXhQDmgfntshSK8UxnuP76Y9r+j0A1q?=
 =?us-ascii?Q?dCOMp3C36nUAAbLx4+X7xSveD2VKmzC3cBNUcEMyj4P5WuefMr99SldO/Bgt?=
 =?us-ascii?Q?wWK2wV9gebzFgiwzt+JNGGwJWjmvSbfO/QrPAo94nZf1qJNo3kgaVcriaAE/?=
 =?us-ascii?Q?50bIw3FEHLWHgsdFGB8+xqIxclnj8qgL0T7gTEnd8UD6bx/qq26Bt7XNpsQv?=
 =?us-ascii?Q?9WGsMDPEnhbnw/nmiHvL4qzWdU0SIqaW+i0WecZuZka/Pz0RLFLmp/pdCJ8p?=
 =?us-ascii?Q?I/iqflquaLZUgbxQjnNhgnbZ6OjBgYLoWQ+2qVfjDQiriio7YZfaOGyfsNAR?=
 =?us-ascii?Q?Miz2GGTPM8bIA3QzdHNndO3xJu5xgmQziiom3h4G+XTbRW4TMdx1LqBO0tQV?=
 =?us-ascii?Q?N/8FCKljUPlvWt9kvhNexKaTDkHBHqk3bf6Cb8ZjZ2M2gpy/SQTCTv0H73nh?=
 =?us-ascii?Q?yl+U19++wY/ygtizMgaiGIebalNflr8Kc4ahd5ISt9bLRn/bNV7H9LDm4AKZ?=
 =?us-ascii?Q?GjHo/gSUaJSUyuHtRMF9HhX/gU2os1+yljyuKlBX94sA5FYUrg1YjTuRZLIA?=
 =?us-ascii?Q?1rB2O9MeiOaklKruMxoZDxIYLZOZ4ioo6oYPn4nKZvgxJkzdmuZIZDleVkQk?=
 =?us-ascii?Q?Ke9x3uDMBWWPkcAqCqzhGmMIpIU0g0Wu8f1bi9wfwxcQTgKxaiBxX30cTjk7?=
 =?us-ascii?Q?K4+RDLcK+lhfO3F+sYQ9TnV63JpMDoH514CS6oMw7phD2SUyLUg/Y6iQGUAM?=
 =?us-ascii?Q?cZUhA+4JjEe7qes+xZn4MqfBr169/oE+qRrO7Fvp6HBoYW9GQAJpJQaDu/IW?=
 =?us-ascii?Q?SV9A2pFjzPDtAPJy/nHLdRVQ9DmGQxJi8EsC2Pitxymqm9T52yyaRE77gLuw?=
 =?us-ascii?Q?yt8LohvUAW+PqF66xz2puP1ZuW87tOAI18+rksCZrStl/9f8R5J5ut0Ov3/s?=
 =?us-ascii?Q?lQxoo5pkUPIQCwfSFrt8zjgzdB6yEMIa4pCALxJG4eS+vA/8E+JUEs3IvsrP?=
 =?us-ascii?Q?AHXKoOUUti84lJJiZ3K8k4DGpdDtCWLcYRxdV/zxS5WztI9ZVB1p?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e52d95ad-60be-47c7-7455-08de6252c0d8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:01:09.8993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MR6rgou/eNDpk62sVSPL8Emurw9Ry0LG8NnZHa5zyKEYyK3GBDcRVZ3O0GbSqppEFxD4QEZswhUTcGczAJ8yUxyUc6lbUXq8stSUVLsmRYw09YFJXO7V0o3+ZvkaQWUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RSPAMD_URIBL_FAIL(0.00)[0.250.179.176:query timed out,0.251.158.16:query timed out,0.251.40.224:query timed out];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	ASN_FAIL(0.00)[177.210.252.131.asn.rspamd.com:query timed out];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.251.158.16:email];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.251.40.224:email,0.251.79.240:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.3:email,0.0.0.0:email,bp.renesas.com:mid,0.250.179.176:email,0.0.0.1:email,renesas.com:email]
X-Rspamd-Queue-Id: E6381CC093
X-Rspamd-Action: no action

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Use vclk instead of vclk1 for DSI Node and set to the right position.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index d4db44b6ccf7..46240a6ff992 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1432,6 +1432,129 @@ csi2cru: endpoint@0 {
 			};
 		};
 
+		dsi: dsi@16430000 {
+			compatible = "renesas,r9a09g047-mipi-dsi";
+			reg = <0 0x16430000 0 0x20000>;
+			interrupts = <GIC_SPI 874 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 876 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 877 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 878 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 879 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 880 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD 0xec>, <&cpg CPG_MOD 0xe9>,
+				 <&cpg CPG_MOD 0xe8>, <&cpg CPG_MOD 0xea>,
+				 <&cpg CPG_MOD 0x190>, <&cpg CPG_MOD 0xeb>;
+			clock-names = "pllrefclk", "aclk", "pclk", "vclk",
+				      "lpclk", "vclk2";
+			resets = <&cpg 0xd8>, <&cpg 0xd7>;
+			reset-names = "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi_in0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi_in1: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					dsi_out: endpoint {
+					};
+				};
+			};
+		};
+
+		du0: display@16460000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16460000 0 0x10000>;
+			interrupts = <GIC_SPI 882 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0xdc>;
+			renesas,vsps = <&vspd0 0>;
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du0_out_lvds0: endpoint {
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+					du0_out_lvds1: endpoint {
+					};
+				};
+			};
+		};
+
+		du1: display@16490000 {
+			compatible = "renesas,r9a09g047-du";
+			reg = <0 0x16490000 0 0x10000>;
+			interrupts = <GIC_SPI 922 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			power-domains = <&cpg>;
+			resets = <&cpg 0x11e>;
+			renesas,vsps = <&vspd1 0>;
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi0: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					du1_out_lvds0: endpoint {
+					};
+				};
+
+				port@3 {
+					reg = <3>;
+					du1_out_rgb0: endpoint {
+					};
+				};
+
+			};
+		};
+
 		fcpvd0: fcp@16470000 {
 			compatible = "renesas,r9a09g047-fcpvd",
 				     "renesas,fcpv";
-- 
2.43.0

