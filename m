Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cHx/Kgr5fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B005BDBCF
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D2A510EA49;
	Fri, 30 Jan 2026 18:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="puudawJi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010046.outbound.protection.outlook.com [52.101.229.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD39910EA41
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hIiH4GNaaIACV5UDWXVmq95YYb1eVmlr2hKJE7Hiz3irqWJ7E/3xIvfgmKU32r/BSVbTQFvRL2muO89hzDqytLUAN5VS0OBPKWi/FI0TrTr+NMFKblyOD3gNEO9sWCItFtSlnBbyUcuq0ynZDSj5QTAZ4bAS6SrXEkaRQQfIZfa5ozrbaX1MYIASCyeC45j60MK13CeY/5GfHrxUmaCpCnqRTP5YnRReEN4RIkG/LNEA4BGxdlg/G9mf1dvJmdu92ptSfa0hN9yjR8MczkFzr20kG1F/pDgnnco1A0lDULCl3IhwEOpEOBmTFEJTa5JqSS4UCdgAHGtXK1DbRA3HcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oENu6TaANwi3L+14PsteC+GEbQyfWLUI9piyyzaQ5CA=;
 b=QPTG0LoF5N7Y3Rlw4ZxZkQtHJ6S9yQFQeztek1Ya3J3BheDhZVGiRA2c1dMyEJ3DF+cJOi8OTJ4dyeO2CbWqGcr65NzQMgrG9lQOSyZHUBpiOO+jaJn7NgQdyauqUKeRe6nOpUdOegBsO4UNKsdlI68eISnxdGlSskMkZNvFFKRULkYPGybLHSfQe1zRVeVsto8L8fUm41eXi3SBgtwM0ad/TqHc/EYtA+kW5U/wL5o/dyCIb+bIUlHNsYTs1ykZQEDCwJYVPkPNq1n6HwKOuPCyv8TTjN3idwgnjMbf+1bItk9NUwcssijL8M16eJuxbyIYYO36fqkmPWhmMpPnNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oENu6TaANwi3L+14PsteC+GEbQyfWLUI9piyyzaQ5CA=;
 b=puudawJi8rFMCXfWp+yBkizvtGgdgsBxGxzQBdoATV10DPka5nIESLBXA4BcHbEzKhla12hE7pquLv/DmZbBpd7YXhx//fTKBxwsiSpNlj03kt7z9CB2153Xac+bGK1w+a0dVpVAQwa1Gk5U1n9nlvjik/jD0atVjvR39X7tKSI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:33 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:33 +0000
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
Subject: [PATCH v3 07/20] clk: renesas: r9a09g047: Add support for DSI clocks
 and resets
Date: Fri, 30 Jan 2026 19:29:59 +0100
Message-ID: <907ad08ddb1df883475d1a4dcd78e43b5e21dce8.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 14dbd868-a1de-4232-f47e-08de602dcb2c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TnO6bLfVF6DueG80bWFpzZS61W+LPeg2CTf+s7sVyuMCd/bkSlTkGUF1mqj3?=
 =?us-ascii?Q?Qmj0z7iIhEKBpH0N/gQaeh1eWKyGHdWqoYVzkSChQUA8iu3Qew/T0YJ+NkRZ?=
 =?us-ascii?Q?dGCJK8hi3y5/niXEZMpnjtQ2Vm3s64EQf6NCNuJhgz7j99GX7jArZOjlDpOs?=
 =?us-ascii?Q?6bzmdtcAgypC1z5eA/eleluvjQTi6U8wD7rrktBB8JTpdmucJotk3Mp5XFep?=
 =?us-ascii?Q?t2dmjC8Y3zAVX5Qpwew/BsXRbuDQ6mRwt8xnztJXMA4eZ+UrdXl9dhTNaoEt?=
 =?us-ascii?Q?z1dp8QEW4OPwU4DJd1chwwiov2sRZ5tLlIYmWbyJHjm5NPtHlKNnRfnR805c?=
 =?us-ascii?Q?0oKuZ/zN1qEfF+pfjOyuxlOJX+oKBEXlAV66NGnONsm5MUY2JlrpvfkupNK5?=
 =?us-ascii?Q?W2cKMTCyub9vHr9AJxNcyjjEMIY/vhdec7B5J1wxSmLdq1VENBjnAe0noexU?=
 =?us-ascii?Q?sxsGJjGuj4uFsoUisUmZ+8/37decshBkBvIzv7WPSb/w1WU8yYVzS2pzV76L?=
 =?us-ascii?Q?4CBv1+dn/bthpMwZtJIYwG0uD8+qKm71WTnAXhUJfQrcE4XCzqI4LOTMEQLJ?=
 =?us-ascii?Q?iB3zDMCQwEQQ1lKXtC1eHQ2tKkPZi+vyeiob8mFDPa22gkYJvIJ14D62XFye?=
 =?us-ascii?Q?kscSEGYmQWiwe7xzw1n5wIR/wPd46DB20lECvqffTCib6nX/q5+RFrNqlWhw?=
 =?us-ascii?Q?v6CRKtZFsJQ5s9uJ2bPH4Eh6Xrd6ljib99PLg8RRR1ZtaFXmTGmJw+lm5QBw?=
 =?us-ascii?Q?7be5oXZ2vJsMZC3OJ64yPvBg0eDukdIh20oha0SipJvR12J1NDXg6OpdsLJz?=
 =?us-ascii?Q?otgxnymIIsH2YgwanYEoy81JGSbWI6I9NtBpWuq+tF2eeDnSfz+eLg8il6Yc?=
 =?us-ascii?Q?1ZjM2AhoERwJ+jddHrhaVoPCkJkxuZpFMtGvNfeUF5PJr+SiVJAjtnbvt6YC?=
 =?us-ascii?Q?Wt1b69tpeLKm0n1n55Ck37AqHSpxk0kRCE+o0N0xsFmF36inDwG2KNlNGdqZ?=
 =?us-ascii?Q?JWc2MwwTi2GpvqOGcRdIhSY5W1/P3hMmm0HX5yle1GsvTNQ2dUKYgGq5dQK8?=
 =?us-ascii?Q?xXz+GdS/poCD2AO5ghM5rS48d/42Go+nM1BBtR1kCSAjyPQoCpGC/WqrwJTn?=
 =?us-ascii?Q?d5CQktmGMm6k8UWtVygjklQE3DvFkmQ0RC/u2i6EtOlyRXrmMoWZm3n9xCYO?=
 =?us-ascii?Q?EuGLDXZn01lqpOCh/ulXxJywi1sc09DN+38KjUNlnHH3rjcs6UkXuWGi5FdC?=
 =?us-ascii?Q?XGqxnp6qg+sn+pmhe5I/Norq1c6zaFQbZHgbvpbrBfOsQL3hqqtdJSmrEGBj?=
 =?us-ascii?Q?tPmvTbBfyYsqdKMZXQYdRCl36nRcgGcyzhxWotbiRg0SrXc+7eD9PyDTTwsh?=
 =?us-ascii?Q?0rxJPVRAzaS+lgAhly1nkLPIJ9LJiwrXFtcf/+2GkyiadOpZZHZv+dfadnWT?=
 =?us-ascii?Q?VSFAWXe8q0c0ZNPRNVNp/fNGL1gYNpY8+2jogQexK/8jthVhlnPuSQDzBrQ+?=
 =?us-ascii?Q?Z6S9Ecyks+R3G7kbJRiXY1o4s41gOd6g8XISF9lZ/yXyKYatxJ0+fA4LSLJW?=
 =?us-ascii?Q?OHTT0FYkTfcnquPFzzH+ftfS5BwKIv0CCz6S7cjKdv/Lm5Bexb7vNAZva4Pw?=
 =?us-ascii?Q?jhX5ZnIoxv0EOoLu9z6Xrr0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TdKpnYP3Tg5Ra8JxPw+Qxpq6Ex1sjOLuwqBI0J6q1S236EvEmnovRoqAoSkh?=
 =?us-ascii?Q?iwhOyaDKISPLiW9Oud/ttq2rx3/ctYNUaDM5K7ySPH3kYk0WY9rsv2cRmIDn?=
 =?us-ascii?Q?JYwyTgAwRJBag+HhKnMNW7vztPlCljgnU5i8MnBiV6npLBSY6DxiMN+Ew8sy?=
 =?us-ascii?Q?LjR0WOASYlSNvIBLOl/zfM+6kTJ9qUVRjSuNd0F4mRdysZOzXjXKXZA7u5Ax?=
 =?us-ascii?Q?zCwoQNsxLMrqTirwK5mD9yQN57UiBxBwkSAERZoxFVg4bW+7Bm/LMuL/Y7Rc?=
 =?us-ascii?Q?tCmXXPP6lwWPupRMFKNP6t79jzRnwiSDb3V2Z9+hEphlf32cKm36wGuB3AtJ?=
 =?us-ascii?Q?14v0v//YcWJw+fivo3WB93Z8j9CEWs+WXDZL9r+GM/1AYHANhgNucmhCu28u?=
 =?us-ascii?Q?Hd7SyrJWUhWFE59yYo76DZ4xxPfayMHzYhWQB25l2ngLMhYRazVc1B/wDd+1?=
 =?us-ascii?Q?tWpXYrjf1oiZNW8zy/aAO+rhAEuRNE/WJTLmtCmlB2YPeTMG9UEBdFq4f3O5?=
 =?us-ascii?Q?Mb6uvbKVIrkt+koF2c6N4WEzsVO94svP1d6Mk6bTEKbSfG+3wsBEa/Fsg6Ib?=
 =?us-ascii?Q?JHo3fNI1V0JJkpmd4goh525M32uTNAgbeRlTlBuEizcyCzzF9M9fqDwCNb4b?=
 =?us-ascii?Q?gi+OCn7RkxOVEnkypeiSqQdhv2GynZQ4s19BoO0KwtiP3kRixQxOI+rdYlJH?=
 =?us-ascii?Q?G7lWcTZ6YeBdaZbcdCyyQQ/uCXYVaSzF6ofOlkxr2uIJnoZ+Yq0AVtleeA7z?=
 =?us-ascii?Q?ymXtIrWNdlU3k6RNntZUT7Sl6hK10ok13+9sqJYYDzgERXED3/i6I53joVkX?=
 =?us-ascii?Q?LVU1QYsAJuUG1jFLutdgCM0rIZtiyEdhd9CIpbVtS7KaIHSs8WxE9kofeDNj?=
 =?us-ascii?Q?zgBMiNofZp+UBPwyAbNuzX96T3JPQRxakO12+BCHOzkb02Jmk3QhnolC3h7e?=
 =?us-ascii?Q?CmdYzf9VhJiKU6vYwtib9Ve2M8e7QEFuKlj+DICcQODI7fUFpBVF9eDt0xgp?=
 =?us-ascii?Q?HtJZmlqc20RSKTaf2nUVmM98oKE74isklGvcWrTFKCMldlM0ZDxKbcNc4thq?=
 =?us-ascii?Q?VrMtfG2N9ibY+z5O+zjD6Tnxu0FrJhlboG0zD8sCehwsi8GYtgzKjJaCBCPS?=
 =?us-ascii?Q?KxBqlJsPPDHvwnSZDgXuJOHnPtoxxoh5nmdf5nhX23mRYJcffBlbhflZzk2Y?=
 =?us-ascii?Q?Ypyi9ormydBO1JyE/6FJwtrmBdwrdBr7EJXtnA4J8dO5p9HrrxRlT1Phy9we?=
 =?us-ascii?Q?0EN0QJUU/u2i5AjVYAlT9ZJy/EOSjmRrIFcq9WGRh2n8VKhhhGLb8cwJfg1Q?=
 =?us-ascii?Q?0cBys9uqPfpB3QcLFWNWszPEmkkHGMjgmMg/4is1cyRAm+ql/pPpcoHT9fSx?=
 =?us-ascii?Q?19CHLduXvrdSEYKw/3bWJ3qeR44VDwSob9WxGsrIEKHX1hOu26BBMuDzYq5E?=
 =?us-ascii?Q?fgjq4c9hv+7q2Hfi0rdh3Iw5kBE8PTk8+TZ1eGfVQM+xszaQAjxMg5510uM+?=
 =?us-ascii?Q?c9cGJQScon661mSrUKRDhnhD0QfVrNTP1B0KJCEQ7XiUKklPM2rnfoEkS3S4?=
 =?us-ascii?Q?Ame0vWY+JUTFwZouwHneeGr+W50vpuIVC02h7yOOgiODN2g9bpOTNeBYSSG/?=
 =?us-ascii?Q?lB7AuLD4hL/mJukT70qN1KhGFHi406GxbpdNr/ZJkhviFcPAGUmxvahYXkPG?=
 =?us-ascii?Q?e5g0H4+EOMbPgUH6iC89WvE3VFXGYX4xbQy2bXc8wGB/Di0/6ZlewCvVnI+J?=
 =?us-ascii?Q?vOH9HE3m/NIYk37EhJmV/yAvd/DWqZmqjZaCbZxTxOa4ALBKMO1z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14dbd868-a1de-4232-f47e-08de602dcb2c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:33.8156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6Kd0acsTKJSWoDEEGSwWCiqS38kWbHj8mUeMJcOgRDyXpqy3na6ebCK6fCekUyijiYGk87MM9i4UtcDttEBeJ0dqtQgEcSKIDUBRimzI5FXCtB8e1qG7WUv9+PTyMed
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2B005BDBCF
X-Rspamd-Action: no action

Add definitions for DSI clocks and resets on the R9A09G047 cpg driver
to enable proper initialization and control of the DSI hardware.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.
 - Fixed "dsi_0_vclk2" position to match order.

v2->v3:
 - No changes.

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

