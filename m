Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QFPSIZKRgGlA/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07280CBFCF
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0E410E46D;
	Mon,  2 Feb 2026 11:59:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="a09qnkiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011048.outbound.protection.outlook.com [52.101.125.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CADC010E46D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtwGKpMG8zaZfkTNgzcXjSOqnmxTok8XLJxSmnRmsGZOv6NFk+TUPmrZdHW6dEG3x3chSJSnRyOE79GvyEk3Ia96SWohK1cFhdYSrcFjKDM5FfTGetkV9Y4tdl7U1CekwcrdjYhgstWtl8lUn+iBn1yJraTA3kEwXRF34V3x+0GJnBzJAUAAerXBCbmABhaBDtq0KIxINwxMJdFVK2RunyWQyf+GL2NkzUq9lqyBMscJSwRPbi2dBwgiF9Ac72MiGENsVvNYhlzpxNh9gLaT6AiHWAytD3BpLpr+p6Aj0rohOLMuTcR0aN9nkyF/JT2VnKWNUnlhZsX5RA1wfUjncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eTEVvwdSIpCBIG+W5j7YilJ0E3EJuc0Qj9AQrwQ7MfM=;
 b=QYrU3DFvMxLId667QBqaQaBGozkD+OnnsQ4fk0K5962C7+kI3aDBFr6gzoO8M79ZWg7tAw2pbgSqawlXQWIoxqg6jf6gbt2s0pIAhrqvY6MGKUONL+KwxuJ2jLUdDMRxZYoJR/HGn9AzhjWJ3ZX2PaWaGiAwE8wpeX3pe8Zr50UiRdp9nGNmcgggIzmMF59lC2caXzwba/RIZzFD/x5t0zlepQcHi5J6NqwhSv3OW4OAQt0+T7bqLfVjS52jh6XO/9CwAKZ7sADET5SWi8kfMvpUqaXaYt3b5/eRn5qgnm5x507SEt8HsCyiCCDpAtGRFjEWzfS1fqXGtHfu+ZWIgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eTEVvwdSIpCBIG+W5j7YilJ0E3EJuc0Qj9AQrwQ7MfM=;
 b=a09qnkiKYJPcAdD3sOFl+PqtF0zXh9NPhmVV88sg9mLG7LOX18CMbwm80NNvf6PLyqOKltsmcpiztXjY0GXfWIS40XVKHyVJuXdeDVyxWRxbGMzYmvKFSUdZCh1jwry3VlUAm1BX8N+i1cv54Jo2SXF6ojTiGKJds9L6QsmhsDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:07 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:07 +0000
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
Subject: [PATCH v4 04/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_DIV7 clocks
Date: Mon,  2 Feb 2026 12:57:35 +0100
Message-ID: <d452f6fa07d4eac6892a1d4a37e5d47e36c60a79.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7f0028f8-f8cf-4a48-88bb-08de6252782e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZPRTFyPn7VzXn37iq3/4UEJ+ZcYdTnu1Co3NXfK84xAZiGK8RxM/zKIBVP3H?=
 =?us-ascii?Q?c8r/lKAUJkO5tzZBnqGi+8PvivZrhV/omR7myAQRv5JSE5/spZOUTYTR4N8G?=
 =?us-ascii?Q?/FPv+JfBX8TxMSppOOPG6IR4sA9bi2T9fBQtqrLerkWxLxCHwyl64FWy+l+N?=
 =?us-ascii?Q?f69aLgk2KXMib1s5uCqwhfTXZzxfrIgwsxrPilqTHnxJ+10meMucpfD5f5WJ?=
 =?us-ascii?Q?1leTC2X0e/4J1WvbM7HCjgTxWyNsBAJ1sMTRwobAU/6L6KizXzg1T4I/jXGE?=
 =?us-ascii?Q?igPBzrT0qun2D/+n4YEznxtisu6vOn0gv++vXAbiLXtNdmqj8dMRttc3uaej?=
 =?us-ascii?Q?M180n7o/nkUwt88Tz7jjpcQZmxmLYfKCroOkunEKdmDHzCqEatYWDODrhF5G?=
 =?us-ascii?Q?6BpIJPRBmlTw8JTr19LvKkcG38OtAC+OQqWD1BDf9VPwJs1CkCXKLJv/zjEC?=
 =?us-ascii?Q?Qir7L3EkhoAGCi9W3Xim+mC5/J8HHU1PkVQ5Pm+Drep5OQWQbPHO+WnIwleR?=
 =?us-ascii?Q?ke1K2bE7+1pUiUvNvtAzaxP49NOQnqUdQ9AtwFe3FzBy+6hNuCu/bnAoK96E?=
 =?us-ascii?Q?mhz/9Z2UwM5W8roOG+429TbNtCXpG5AGYkVy8Mqdgk6OijX5jCasImyM0jTx?=
 =?us-ascii?Q?ioQOye0WjOBSjGSj+U6GAFSNZGttsI6u3QzitKkrogMKYFDAaGa6Beea5ER1?=
 =?us-ascii?Q?rtdIubHiT8YELnWkbKL1qAhQkOb7aF7Jf7+TaxqzYMd6cJ/wqaEreBJXnxzU?=
 =?us-ascii?Q?1HqSid1u6a6TkMVypgTQR7IdmkrDXC9lnLD7dWaZbCUYV8MvGe8WrvNNZ5Jc?=
 =?us-ascii?Q?a1wcsRPZRbUZWB8zOD0GbboMKGrI0wWRip1/GAb3QckmfMTkRZ/Xa9v8ENfb?=
 =?us-ascii?Q?NK60aaNs/3+ns6PtiUUxtXQLUn8U96mklWmVwmVbZ5iEAs4T/AcYnuO0II5c?=
 =?us-ascii?Q?6UAkXu+Ka6YtJFwPKP+sohhANo1F+dA9XydZ5XOVFhXXag0w/OXUB0rIlmfD?=
 =?us-ascii?Q?/wBIuiUSU6jSiuLXuG2UwUp7zRBTlEe8DEunqPTvdOmz+oBJMZdtNMRWpmvj?=
 =?us-ascii?Q?+U9VT6aFoNFRqdrVPxn3A6/8sQtQUjqNyAazHYB9pso3ZvwG8fdlzITOTwFr?=
 =?us-ascii?Q?AwaARjfA+Mk89CiqWTWkE3H7vEvDCfI6304vMJcTBh3SPaqiU4g0uIX2LbZF?=
 =?us-ascii?Q?yYLewXgnOg7HcTz/H7dugSw1/WfOiqiYdp0/QwmaOniEpi4g9OfCT44VoAA2?=
 =?us-ascii?Q?xRxs8YogIrZxYCZLVGPHqQPqGyrhYxqacnKySAyjpkbubttdrz7xwbnHxtZf?=
 =?us-ascii?Q?lJx7m3VxXwASCkJ1na62H8Cvmlg3qD8nfZlXFNmKpy9avHww+3BArJeBjzLB?=
 =?us-ascii?Q?vc01DwLsd14Opar3BtWQL6Rxf5Uz7Hx4mnG4cmTQIFZs5Ges+AoOiGws7lFA?=
 =?us-ascii?Q?zfpQMvpxD4ufWCQNjnN6PWMR0DBpEOnq/RbzZIohTPIpboh4nAYDA4uOgvBF?=
 =?us-ascii?Q?SmTbK8j8lVjB6xiqvQYOJ8a0UG7c51RFP2fBggKOcEVfrGQlICePxybE7U/G?=
 =?us-ascii?Q?Aic1ue+gY+LdizTmId7+olz/u+lA8dKV4MfYtlqx2W79d7GlAWmnMbV8tYDU?=
 =?us-ascii?Q?sJEWORdWexYe4JQVNFSB27g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Obv3vpsxxrhfez8mCEZGwuopYNtcpmsyv3SSaLtmCSWlPbfkPShHsdlKGlzM?=
 =?us-ascii?Q?txmOiNT0OPnWyZaZBwneM2l0pH16+4NCN8q2yf4zBgu7RLYrXIfxKxB8PdQ2?=
 =?us-ascii?Q?ptswJtSeuEau2lfqaZl2pDoiNmxoIxV9L8x4nHll74dxEJtctVCZP+fROfwr?=
 =?us-ascii?Q?ehhcjwTVL/7AAt0LTOqfXg18OSN0fHN4R8bYK+CVku4YbI3/HDkgrlmHkV8O?=
 =?us-ascii?Q?x5P1DRylMQ+kyV0O8/qNNjA879IcV7/U6rFwRbrJ9CQm8FKOl1mRsWEWYLsO?=
 =?us-ascii?Q?R//Mr5Poai8rQX+3uqduEjGVoxjmPp7zEDgPEN8h+TZrYb531ADnmok2wiTb?=
 =?us-ascii?Q?Zg1DFX6FPlQvVFzZZsP1QVj8H6a+A+q+yuWAhPjVPz954ON4yQz299NB+5wP?=
 =?us-ascii?Q?eTw5QmQS0JWK+vCjnmcRnlCwDpXDRTmPAXoVGtJ/jjzwVGuJjxEbzv/aBn/m?=
 =?us-ascii?Q?OiDJJHCs2fFQjKrzfTw7OEOjgrHY3gvgfk/Lgf8N1rpKryG3n/gI0d+Z34Gf?=
 =?us-ascii?Q?nmDdnkAWFYnT04V1Etsj6x7XWSs1K1maJACXCY5bk5QSoYQHXXrfzrQSYwnB?=
 =?us-ascii?Q?ZB7z+pnMt1XRrc0hZNXxgaiyl1xhhq5PBKImaMb1zRoggJqk3owV+oBmCqLn?=
 =?us-ascii?Q?uonh+wGk2zcV8NJWhMboV8cd0WmVuZeoFys4gQXXlpPfX8fMRrNmOCr8g/+2?=
 =?us-ascii?Q?7VLVmASsWgJ5mV7p5ysXT4wfLYhzD4oor7/OWeBBN/Hy8QMTMXX00+1o3iZF?=
 =?us-ascii?Q?+JrvDlHR1gSiAopLfUjUoNF+Lvrpv/gLtU80erEBysihueqM1QRBpFa2Gzh/?=
 =?us-ascii?Q?36Sv0PUKF1WTH07vJqaS6DkvDHjIojpUl2gXiLW6VJ+6WBvlTBrxRKb3wcfu?=
 =?us-ascii?Q?h1+kKM+ctQrbenaRxC7AedXXKf58sJG01aTlNC1f7Ic6IuRDSGD6zvnAWcWo?=
 =?us-ascii?Q?KiepWwXH9ZY2+wLpDcwojwskAjlitQpv1X8Ric0UcNCHMHDZ0fqTow/yHH0N?=
 =?us-ascii?Q?HHpqndWvc7C+1ZNAzzJFnYy4HXapqqs9wlvO/bpaKwlI7gmXsH116pDEVe8z?=
 =?us-ascii?Q?UjZjfaj3m+J0u6f3x/7+vS+ZcOlhbjRamq5CL0+IFOxoCloTpSEaU+epY936?=
 =?us-ascii?Q?iLMsdZpefxs8QwTWYWLazQ9Ai8O79DkbG55MK7kaTQVnKMFsYGM6oZk+Ff0i?=
 =?us-ascii?Q?4EqBrAq4gc2oj0OxPloDVERPYHYa8KXh3D4IPcciPNYwcGsrc7mUiagkF9qU?=
 =?us-ascii?Q?CQXNY/VHCOqUHOO/8By3jgkke8jwfX6CvDmTCuP1QLKlLOTJMZdaZYR9kCDu?=
 =?us-ascii?Q?TWxs5PnFlo/tgyT0FQjS5ML8C+7hwHKPCFmu6iki4RBlvZmhuGin/mkGz8qn?=
 =?us-ascii?Q?Y9vyNsdPYatXfzN3l+XwpJPvbFY5q7CpZ2KhplcbzhaneI6pyJHeUkdZBbpE?=
 =?us-ascii?Q?uYe3vG7zd/ejkS1cDyi2/x0/lWx2s2WltdbnI6hNViGSn45lrc2xCdSXwhW+?=
 =?us-ascii?Q?aPGOYJAYwMicSz8wRR8kLY9s+dm44rgJzWlS5Tp9Zmb2ykY4CU1fl6GIivGN?=
 =?us-ascii?Q?UPuyXQlRMUrPeZSPteMMYP7TC+CHH2nze66tMzOoAxnTbPezdrKQIuekvn+h?=
 =?us-ascii?Q?Lcr8C2CdJfEis0RWe7SmA9nrKRbzjb/PFs4sv0/LZX7BV31onnISHgDmIwzv?=
 =?us-ascii?Q?7TJHA1cIMjR9oohOB/xlqHz6s4uC2RN4LD5WVvK4W9lSg7E+QnCZzAq+xakY?=
 =?us-ascii?Q?Rpmo00XLR/aLLvGlTdHO+danLPYM1Iv50k0W64usl+nRdh113FRK?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f0028f8-f8cf-4a48-88bb-08de6252782e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:07.8093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQj7+Nbl5PQ0kIL9tjzaWB0E56TtAEop0KER/jJXtDWNCs9TWmZbX/sNyKV3fJra7ZNYKSvT51Vgm3K4vF05wMxmHvKzWDSOOeDoBgeykLJLvfneeRgR8dvh49b9RYT2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 07280CBFCF
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable LVDS0 and LVDS1 output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 8d4c70533a79..0e707391283f 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -69,6 +69,8 @@ enum clk_ids {
 	CLK_PLLVDO_GPU,
 	CLK_PLLETH_DIV4_LPCLK,
 	CLK_PLLETH_LPCLK,
+	CLK_PLLDSI0_DIV7,
+	CLK_PLLDSI1_DIV7,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -196,6 +198,9 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
+	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
 	DEF_DDIV("ca55_0_coreclk0", R9A09G047_CA55_0_CORECLK0, CLK_PLLCA55,
-- 
2.43.0

