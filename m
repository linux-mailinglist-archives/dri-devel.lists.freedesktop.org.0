Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBraGXqRgGlA/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:58:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC4FCBF8F
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CFF10E2A0;
	Mon,  2 Feb 2026 11:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="t3xLMDR6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010009.outbound.protection.outlook.com [52.101.229.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC4B10E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzpemruttzsUXBSHRBS3Ou+EbqKxzXNhYNJJiFJ1X1KQC54JadkBGTvX1ZDVfP/JUd147fp6P6OqzkcDAbr4CwFTYHOSRwqxu67U4As1T7h6zqUtqDZphGIZqX//lPQuWMwRTarIE1005cdScWh5JbxLR6UCDXt+i9pLAalzEX0Rj2biyrQliqdkEZEpYDX63u+yIU6V0oVwzZahIOmLQd+IUU8asO1baGX+YhvKLL1oVLa8twzIkeTa/s0PDgXNV+JBJkMqB8TfNcGv0NgTdSib3jmEgZDwu37i9dBJBH5zaaK5wMXSY0d/0oRPdDjSaTkDUeemArQCEjESFqyJfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vIiv/0Y/f+5t93lNwzvFGuQNcnJfinXQyqwwYl5a6c=;
 b=Nz/xH+W96tlJm4HxjI4Jvkr8gBUVWDeh4DfXfV7BHFrTzhcrvA7vqHn6W3VrldvU12Y1HesOHH6iFBJJaDZ2d8C9fTGaNlb8PNixKp+nF8znIQZ9ErZeWdBM6K2Ow55PF0JcQlWjNlMRVp1rutt0qpD1V2/2iNdyg3NTUiN2AUsyB5Fm0x54zRDyO/0y7324LcPvaScYcuBPr79JL+DALVOQ4oeDzfBMrA731wPgv9+4Zy44SyJp8AoxWNuH2rOM8lU7GtuTtMrFjL8NK2bgFnuG0ms7ZE6SsGhjZrj096mKyCCjgScqZy0mHI1Penav19aNd2yRxGx7BSF7j/l57w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vIiv/0Y/f+5t93lNwzvFGuQNcnJfinXQyqwwYl5a6c=;
 b=t3xLMDR67dTAP2YDRmSoZ94rEty28OAvZt1FUk6CDcGDhMiejCL/FPH6TIpx32cGUPRZHPu5BljU3cNkiGuiWLSeTLiZXlux16IQJD1W2EYPZCh5lIizh+4RHL6hh/IsM6j7bceEx4rGtbCgCBSIJXE4JafTBAzLFhTZEOwKpgw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:58:43 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:58:43 +0000
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
Subject: [PATCH v4 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
Date: Mon,  2 Feb 2026 12:57:32 +0100
Message-ID: <ef7eab5b80d0e76f8a49f580b658a4dcdec8c411.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: c1618b44-e143-440a-06c3-08de625269c4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZUMlZ0/09Z5XjDXSajOOjfZ+RJbZKHOUA/35RUXOanTEJ3SdSuAf0cG8HT0b?=
 =?us-ascii?Q?gDuhXENoQdtROYjel2xdgVX2PbO05FwQd52BKj/JRPIJO3b6r00aoCljYCS+?=
 =?us-ascii?Q?bDoadr4b387peoX805k4BIISl5hCEf01yzK4C4w4jIArgL8XEcDMwKDOXGYg?=
 =?us-ascii?Q?91ibEGBX7WGE+BCg5SF2//5UuswzxgaG6ezU1qPwAKyxlkbIjijrHRtwqWUM?=
 =?us-ascii?Q?aE/NIlze7QJ/mR5dJ+dqvncf3d0TG0y5Q/1V5JMH5FJJ4beNC5ald1CuDtp7?=
 =?us-ascii?Q?zaKqdnzWFP1yo/gqAALpT72WasXD2TOwmzsWJ1360DV6meymVdOlUu/bOYBe?=
 =?us-ascii?Q?LohRPmK/IuD8lfwMaRZzV/TE/BBUKClED22plaEgHiLMcUDji41A7X1PxHoW?=
 =?us-ascii?Q?cvi+byW5Jhhh6llu1x7TefAmCvtkouywdFCdfYOmuCxZ7L7l/y2S24Y3T59A?=
 =?us-ascii?Q?zYPy+Lik6/JD4RYgY/g/gdGwXTOhk1G3cY3WNjnvSzDqmJl40uSPnFoXbbf5?=
 =?us-ascii?Q?ITghvLZn66HT4ALoVUUsLTSPUP012xdpzCJJNJJ7NkzclmAfKC5djbePklpC?=
 =?us-ascii?Q?DQe36Nd7ErHbvFS9sQz6h947lipn28UBo+AWN+fEOC4idnwVcDU+qShY4C28?=
 =?us-ascii?Q?/r1J5xJ2n9QLkT1lW0YK1m/cFsFpKUOFt5PC2yFn1esswbvevOoi/tdxi42i?=
 =?us-ascii?Q?g9Y6hGqOfix5hvNcRSpjcIx8fRW6nmrxnV2HGShyR1owGHrKMMewbB9qRj2g?=
 =?us-ascii?Q?iSVuxB5VKDgoQCNNchoP0MhkO9DFFVm7twNANj6AWE5exJC57/Xu2VZwNZBb?=
 =?us-ascii?Q?BszeHZjNWDZ+OlxrnIohmT5uhYP9thGG6S4QlTLvOMQPJ+3J6M4p7os0g4e+?=
 =?us-ascii?Q?H75YhQuqRaawHmMLC6BknAvN5KGKpNBnUZcu/oNZ0vvLwkOI0svZziGeGyWp?=
 =?us-ascii?Q?eN/0UH2nFmvgnRArzhgHbAmnpXyO6NXWFWC9oqhhePV7thCFDYx1Ex4TzSaZ?=
 =?us-ascii?Q?OAD86+Y05iLzOAw74EMHJOnm3xbVzapwQW/OHFANkxhZP6vslbqA3M1CjQ5g?=
 =?us-ascii?Q?/RinmPZ4uWo8JlmcX7DPp6GiBsETY9BtQ24vVANLt9s0hkDlDPh46tWWzT+W?=
 =?us-ascii?Q?kitF84FLbwez98/4nRvnEoHEPHtI6Xbrq2SG0x4V6Kp5HNrz73USDOVlUCmA?=
 =?us-ascii?Q?gO5l0trJTcxkYZjvrnk0NOit/p7O54XGbsouB5zFPygxiO/3E+3tdP/2bHaK?=
 =?us-ascii?Q?Wn2k2gVT0gLediN+5zn5ehn1b5+aQUxkD7K/cPYionrXet0D9Bgpo/m0N0q5?=
 =?us-ascii?Q?mcwlsV363hqNLkpkoZhfRmgIBdZWKbT2kLM+OzWaPRzmyKnu6GcEq4Cnlj/4?=
 =?us-ascii?Q?Y3GzMLuRRPDgEf/op5P+6JaHKjCByVF5gjC74GayCBl5gUw+vSJ4roq9RL/W?=
 =?us-ascii?Q?YAGfaVAOz3wrNI21JrWgnQQSZE7d4N1PiNZHb0tZ3UbiTZD6TYgW2wJlLS+h?=
 =?us-ascii?Q?tlDgDLpzgq7ipo9hlPRPjecUIxfZb1zM28BQjPqnU/lXHKeUCFcoeWt6Qoqc?=
 =?us-ascii?Q?U5P4Oan3VuRTt0L9Jnza6BNVIJF320FNcRVcdoNHx6kWP4iOdohyZpN9Zl8A?=
 =?us-ascii?Q?bfr7+asyzO7cS4eRQYf8hY0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJlGLOQpM/cQlA9YM42icEMc5V95g8SwPiuBO1olWLuQ4MTsTKgoCPlmuZzb?=
 =?us-ascii?Q?UQWm8sw6rIGk3N3xD9old2lVk+qLj/11+u/UZrd2dEtuzbG5UMHEPqSFxkSj?=
 =?us-ascii?Q?xO4ACIya0b4O/7fB3Kj+GuTKWtWKrAyIT/gYPyCTK/juxVM+yCJium/yojQA?=
 =?us-ascii?Q?KKqCL5ovUVb3HXm6sGk3t/8R8gyS7STNjl/FKqJ7k9v5izMGuqwo+dX4I/0V?=
 =?us-ascii?Q?UT+8vM66+sKb2lF+I7QKU/L3VkkrjCyxK4eqnK1DbmCxBu4MbhImr/hjr2MK?=
 =?us-ascii?Q?D96EMVDp4nAjDm5VNOixLGlPTzH3mbunF31/ypYn6TYXLgkfb13RRIqgp92d?=
 =?us-ascii?Q?IoYgn7hYmLU9VDW1j/LsO0HeQ/JV4Cc8x7ZD6LKxNLHRSJlNvEZil7swR9pY?=
 =?us-ascii?Q?I3S0Q/RXZOxwPvapmLNlQtCyh5CG9R19bfbndJe/qKW0fHJindxyAJZt0DOV?=
 =?us-ascii?Q?pPu/NDmSL13szvALeCyrggII0kRri5TWD9hi748IucmHQCGJSlVC8IG6w5Fd?=
 =?us-ascii?Q?NyW2OnPC67qLppT08nnRVAz/ADhCoejuEHU2tIGhJBRI7GF0rhZ113jcKKSd?=
 =?us-ascii?Q?f4fDlWYwEBRIYYIz5zqID/IX9/4I6Dx+cry0FpokWqb+/FhywTX9z2a44FSN?=
 =?us-ascii?Q?qLzqT1XRdfkEGKBJmomMwxGmEq8/4yCSbsM0c4Mnv7rA/DeehMMdBuSQFgGf?=
 =?us-ascii?Q?GLCzkOa8HSxe8QSa0YfeLjgMS8U83uxQy3Wk+ye/Tu13kwFA3w6/ps0Kz92a?=
 =?us-ascii?Q?v4MaGh2CL4JR9oDR3lhxmECvugvJOdtFe5fZF6AJchfha/66IZmcplYXYgYA?=
 =?us-ascii?Q?X8Q5WkMjZZIZDdJHP/A5N4zkWZj1VKihLiUDSleqi1newcUESrW2eI1R0I/b?=
 =?us-ascii?Q?Ce9tlKZ2vem48lG2k08i2u9bSe7WCccI84Go3edjz6law7MRQFfrRf112Uy3?=
 =?us-ascii?Q?qiSSY8ZueaI5F/cHHm/nltDG6CFN4xl/8I29vUuR4l1R5ujRAUQiaVMCDMKO?=
 =?us-ascii?Q?xe4gYnOr/TOrRN8I18HphGiojPOd2O2sQJ4x9WONdN5u4JX3cXW6yAuYtDDr?=
 =?us-ascii?Q?j+zMRkbkA7x+8mt+VfG30RwQepOtMRtrFzNiB6vyyKxY4B8DmSp6Lx0zyZ4O?=
 =?us-ascii?Q?ECpHw0bqXCOk52SxC8L/wLDDyCkayVcozOd7JuDVmIQR7Z3y/tFaWtiFVkZc?=
 =?us-ascii?Q?nypjxAJoZy6QiAAFhzWJYSK5Z5o/vJjp9GG5GffXLYxdRwRuCPZSNwF8mBQV?=
 =?us-ascii?Q?so60v5pcxjhWEKjQHBX6Ukvr+hNZP6G7KG+y0QcZnVaVFQva9W60ULggDfhs?=
 =?us-ascii?Q?7zF16vkunIOthtQ+M8Uj0Z6bEsGlj5WRcchEqdqNXJ42Xng7E8hQGxYYtfqm?=
 =?us-ascii?Q?Q+OPPHcEO0Dtz8CtcbZXb1YDJdZPs1rktqPrDrLx1MQ3P4He+l9TAdyhOKmS?=
 =?us-ascii?Q?OFXw7XST5d3HnUUzdYVz26vLVx/yYpRvxDJH+tAt+vWkmfaZH0PUu4JE3epr?=
 =?us-ascii?Q?b5oTYYE7JQfwBVbU47TbxHfxPTwbpoZCCNbJDjwqcGWqbSVgi/G6W4jQgeDn?=
 =?us-ascii?Q?+IJQrxg97Wro7RXo8hdM+A1dek6GacP91M3av2O2wQPs1HwXqtLA12GPURYD?=
 =?us-ascii?Q?T5voXpy5pmDDtNE0xCvDaLebgy0jZNCMnmk3Xbf+C0RYH8b6Ad6aD+n8Y4Hy?=
 =?us-ascii?Q?Hq7jmAQtRt0swIpN6x1iW3DJCCuiBv4f+OLrEV3++y4KGy6xd2ZpuPpGrsmI?=
 =?us-ascii?Q?Ndnm1UEdxwQLRlbR7krODHpkax3ZOTG016fxSj9Wv3RnuCCdL4Id?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1618b44-e143-440a-06c3-08de625269c4
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:58:43.7854 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q31PNjSCaqIBB+OkzOyo95YTLElVK/mysWc+fYEjRlveOM8C6ptVWCL1EJVxr0smMHkgweTUX7AOBkAxmgA7RYcDEtlrhIxRAvPBmmXqkYkALH/14DNtS5f72utGgLWd
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,init.name:url]
X-Rspamd-Queue-Id: CDC4FCBF8F
X-Rspamd-Action: no action

Add PLLDSI clk mux support to select PLLDSI clock from different clock
sources.

Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
them in the clock driver.

Extend the determine_rate callback to calculate and propagate PLL
parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().

The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
with different duty cycles:

- CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
- CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)

Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
allow the DRM driver to query and configure the appropriate clock path
based on the required output duty cycle.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Added rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
   allow the DRM driver to query and configure the appropriate clock path
   based on the required output duty cycle.
 - Updated commit message accordingly.

v2->v3:
 - Added missing defines for duty num/den

v3->v4:
 - Fixed build error using temporary variable mask
   into rzv2h_cpg_plldsi_smux_clk_register().

 drivers/clk/renesas/rzv2h-cpg.c | 184 ++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h |   8 ++
 2 files changed, 192 insertions(+)

diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-cpg.c
index f6c47fb89bca..4a245dfff27c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.c
+++ b/drivers/clk/renesas/rzv2h-cpg.c
@@ -76,6 +76,11 @@
 /* On RZ/G3E SoC we have two DSI PLLs */
 #define MAX_CPG_DSI_PLL		2
 
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_NUM		4
+#define CPG_PLLDSI_SMUX_LVDS_DUTY_DEN		7
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM	1
+#define CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN	2
+
 /**
  * struct rzv2h_pll_dsi_info - PLL DSI information, holds the limits and parameters
  *
@@ -418,6 +423,20 @@ bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
 }
 EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
 
+/**
+ * struct rzv2h_plldsi_mux_clk - PLL DSI MUX clock
+ *
+ * @priv: CPG private data
+ * @mux: mux clk
+ */
+struct rzv2h_plldsi_mux_clk {
+	struct rzv2h_cpg_priv *priv;
+	struct clk_mux mux;
+};
+
+#define to_plldsi_clk_mux(_mux) \
+	container_of(_mux, struct rzv2h_plldsi_mux_clk, mux)
+
 static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *hw,
 						      unsigned long parent_rate)
 {
@@ -649,6 +668,168 @@ static int rzv2h_cpg_plldsi_set_rate(struct clk_hw *hw, unsigned long rate,
 	return rzv2h_cpg_pll_set_rate(pll_clk, &dsi_info->pll_dsi_parameters.pll, true);
 }
 
+static u8 rzv2h_cpg_plldsi_smux_get_parent(struct clk_hw *hw)
+{
+	return clk_mux_ops.get_parent(hw);
+}
+
+static int rzv2h_cpg_plldsi_smux_set_parent(struct clk_hw *hw, u8 index)
+{
+	return clk_mux_ops.set_parent(hw, index);
+}
+
+static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
+						     struct pll_clk *pll_clk,
+						     struct clk_rate_request *req)
+{
+	struct rzv2h_pll_div_pars *dsi_params;
+	struct rzv2h_pll_dsi_info *dsi_info;
+	u8 lvds_table[] = { 7 };
+	u64 rate_millihz;
+
+	dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
+	dsi_params = &dsi_info->pll_dsi_parameters;
+
+	rate_millihz = mul_u32_u32(req->rate, MILLI);
+	if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
+				     lvds_table, ARRAY_SIZE(lvds_table), rate_millihz)) {
+		dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
+			req->rate);
+		return -EINVAL;
+	}
+
+	req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
+	req->best_parent_rate = req->rate;
+	dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_determine_rate(struct clk_hw *hw,
+						struct clk_rate_request *req)
+{
+	struct clk_mux *mux = to_clk_mux(hw);
+	struct rzv2h_plldsi_mux_clk *dsi_mux = to_plldsi_clk_mux(mux);
+	struct pll_clk *pll_clk = to_pll(clk_hw_get_parent(hw));
+	struct rzv2h_cpg_priv *priv = dsi_mux->priv;
+
+	/*
+	 * For LVDS output (parent index 0), calculate PLL parameters with
+	 * fixed divider value of 7. For DSI/RGB output (parent index 1) skip
+	 * PLL calculation here as it's handled by determine_rate of the
+	 * divider (up one level).
+	 */
+	if (!clk_mux_ops.get_parent(hw))
+		return rzv2h_cpg_plldsi_smux_lvds_determine_rate(priv, pll_clk, req);
+
+	req->best_parent_rate = req->rate;
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_get_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	u8 parent = clk_mux_ops.get_parent(hw);
+
+	/*
+	 * CDIV7_DSIx_CLK - LVDS path (div7) - duty 4/7.
+	 * CSDIV_DSIx - DSI/RGB path (csdiv) - duty 1/2.
+	 */
+	if (parent == 0) {
+		duty->num = CPG_PLLDSI_SMUX_LVDS_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_LVDS_DUTY_DEN;
+	} else {
+		duty->num = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM;
+		duty->den = CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN;
+	}
+
+	return 0;
+}
+
+static int rzv2h_cpg_plldsi_smux_set_duty_cycle(struct clk_hw *hw,
+						struct clk_duty *duty)
+{
+	struct clk_hw *parent_hw;
+	u8 parent_idx;
+
+	/*
+	 * Select parent based on requested duty cycle:
+	 * - If duty > 50% (num/den > 1/2), select LVDS path (parent 0)
+	 * - Otherwise, select DSI/RGB path (parent 1)
+	 */
+	if (duty->num * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_DEN >
+	    duty->den * CPG_PLLDSI_SMUX_DSI_RGB_DUTY_NUM)
+		parent_idx = 0;
+	else
+		parent_idx = 1;
+
+	if (parent_idx >= clk_hw_get_num_parents(hw))
+		return -EINVAL;
+
+	parent_hw = clk_hw_get_parent_by_index(hw, parent_idx);
+	if (!parent_hw)
+		return -EINVAL;
+
+	return clk_hw_set_parent(hw, parent_hw);
+}
+
+static const struct clk_ops rzv2h_cpg_plldsi_smux_ops = {
+	.determine_rate = rzv2h_cpg_plldsi_smux_determine_rate,
+	.get_parent = rzv2h_cpg_plldsi_smux_get_parent,
+	.set_parent = rzv2h_cpg_plldsi_smux_set_parent,
+	.get_duty_cycle = rzv2h_cpg_plldsi_smux_get_duty_cycle,
+	.set_duty_cycle = rzv2h_cpg_plldsi_smux_set_duty_cycle,
+};
+
+static struct clk * __init
+rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
+				   struct rzv2h_cpg_priv *priv)
+{
+	struct rzv2h_plldsi_mux_clk *clk_hw_data;
+	struct clk_init_data init;
+	struct clk_hw *clk_hw;
+	struct smuxed smux;
+	u8 width, mask;
+	int ret;
+
+	smux = core->cfg.smux;
+	mask = smux.width;
+	width = fls(mask) - ffs(mask) + 1;
+
+	if (width + smux.width > 16) {
+		dev_err(priv->dev, "mux value exceeds LOWORD field\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
+	if (!clk_hw_data)
+		return ERR_PTR(-ENOMEM);
+
+	clk_hw_data->priv = priv;
+
+	init.name = core->name;
+	init.ops = &rzv2h_cpg_plldsi_smux_ops;
+	init.flags = core->flag;
+	init.parent_names = core->parent_names;
+	init.num_parents = core->num_parents;
+
+	clk_hw_data->mux.reg = priv->base + smux.offset;
+
+	clk_hw_data->mux.shift = smux.shift;
+	clk_hw_data->mux.mask = smux.width;
+	clk_hw_data->mux.flags = core->mux_flags;
+	clk_hw_data->mux.lock = &priv->rmw_lock;
+
+	clk_hw = &clk_hw_data->mux.hw;
+	clk_hw->init = &init;
+
+	ret = devm_clk_hw_register(priv->dev, clk_hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return clk_hw->clk;
+}
+
 static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)
 {
 	struct pll_clk *pll_clk = to_pll(hw);
@@ -1085,6 +1266,9 @@ rzv2h_cpg_register_core_clk(const struct cpg_core_clk *core,
 	case CLK_TYPE_PLLDSI_DIV:
 		clk = rzv2h_cpg_plldsi_div_clk_register(core, priv);
 		break;
+	case CLK_TYPE_PLLDSI_SMUX:
+		clk = rzv2h_cpg_plldsi_smux_clk_register(core, priv);
+		break;
 	default:
 		goto fail;
 	}
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index dc957bdaf5e9..74a3824d605e 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -203,6 +203,7 @@ enum clk_types {
 	CLK_TYPE_SMUX,		/* Static Mux */
 	CLK_TYPE_PLLDSI,	/* PLLDSI */
 	CLK_TYPE_PLLDSI_DIV,	/* PLLDSI divider */
+	CLK_TYPE_PLLDSI_SMUX,	/* PLLDSI Static Mux */
 };
 
 #define DEF_TYPE(_name, _id, _type...) \
@@ -241,6 +242,13 @@ enum clk_types {
 		 .dtable = _dtable, \
 		 .parent = _parent, \
 		 .flag = CLK_SET_RATE_PARENT)
+#define DEF_PLLDSI_SMUX(_name, _id, _smux_packed, _parent_names) \
+	DEF_TYPE(_name, _id, CLK_TYPE_PLLDSI_SMUX, \
+		 .cfg.smux = _smux_packed, \
+		 .parent_names = _parent_names, \
+		 .num_parents = ARRAY_SIZE(_parent_names), \
+		 .flag = CLK_SET_RATE_PARENT, \
+		 .mux_flags = CLK_MUX_HIWORD_MASK)
 
 /**
  * struct rzv2h_mod_clk - Module Clocks definitions
-- 
2.43.0

