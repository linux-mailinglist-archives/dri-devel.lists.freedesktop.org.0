Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gObYATHqfGmdPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:17 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C109BD1CA
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:28:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1510EA1A;
	Fri, 30 Jan 2026 17:28:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KKTOU104";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010001.outbound.protection.outlook.com [52.101.228.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815DD10EA1A
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I1x72uKo50TMEdYK1wG1WgxOXY5YXUUpf11uV8ZB/BBszAZpRg1nJHyj/MYQCobuTmnd034+z/kqMD7IuZkq7zI09hasmmR0+4Tkk3buJoVKIIJBuQokobHeL5yxKao/zIRLh3ZuHElfdZF0jPGSW+k0PzeskConcvlnrljJyCFnoV40MRHNRG6L2wKFSfwxxnX1cVji/xtuBFust9MdeeNnak2569lseWpXc0QkOTEF2GMbFF0pdh3r4jx1A2sLIP/nADtPaxpubt52H8dDmW/eP4nJM8tL66Wm+eDpMgslkCP25iHIW1Qk0r3b1QS2TeD44iHz3KF+2gntz03Q/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J45Fr3xGwGH4YHe39TdIvzUxyZn2JTFmnQmzzG2rveM=;
 b=Fe0BKa4DziyrKbGehIuX+IHdJF5hWZ4EsF8Bfmk7Xh4Q/UsUfRdIMnUdh+O34kv6AsO7to34aIAFERQJHThPUIqJ3Bl7dEy2A7JaorKQI4faDg0bq81sB37X/lJaJir1SlhoUQUyqfpEk+NsWYNvL0trlUlUzes9rgRy5kv8v94Iw2f/DOfqrzdIEgzbvRrxXejJOznKGg9OUifwL05zA3hblHqjFndnElw1U8Ydz/KmFJ9709qiLLRvtf8sPKltnRa0V89CfKOg5yxPUdwUm2rjRAk4jAKcZ6gF/lPxKazWcdXM4TMOYh+lBJWFkAle/V/3azhRoz1doB50ne/Ztw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J45Fr3xGwGH4YHe39TdIvzUxyZn2JTFmnQmzzG2rveM=;
 b=KKTOU104rwqK8jgmdWxJm1hCySAiftYtObFnV+PSy43uwHb2swCHj7NEPYj8lqiC3QDzLPcX4OjPP2uA1ACU/oHz4reKyky0JVmCnewrmYttlegOmupR9tx8qznxIh0yCqMYdAeuxZl1PzK4WCJTkBOgHkP4N8B835m/cwB174I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYRPR01MB13818.jpnprd01.prod.outlook.com (2603:1096:405:215::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Fri, 30 Jan
 2026 17:28:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:28:09 +0000
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
Subject: [PATCH v2 16/20] media: dt-bindings: media: renesas,
 fcp: Document RZ/G3E SoC
Date: Fri, 30 Jan 2026 18:25:13 +0100
Message-ID: <84b608fd5cfb04c8fa05d244ac724c9479e8db51.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TYRPR01MB13818:EE_
X-MS-Office365-Filtering-Correlation-Id: 96a44662-6b6f-41fe-c2b0-08de6024f009
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xqhmtBIXb+onBL9hmLJMc/iAxw/dJVVpaazRynqWeFQ27yt4xzcX4QAOxrbC?=
 =?us-ascii?Q?SzQtAs9oN+MCpnV7yg71zID65++JRIjMlKmFo6moIPsfpFlnkJFc0J6K6745?=
 =?us-ascii?Q?UfdP8QaqROEiFh62CCxlgI9rsLucucZUb/pmOTmfEPgQyHPHp1fcOuIORHBX?=
 =?us-ascii?Q?IZ1v6yuOWRciOtqXz6wKGJQC3VdxXVyl+6LW+IuftjjuDRpqzmwx0WQ4PujV?=
 =?us-ascii?Q?8+FjnYojZuRQxJPLR8phK7+fEOWQnr2mhh8hBbQhpKeZZRIvUGUx6KINOAt+?=
 =?us-ascii?Q?RwM122Z5iDlCdJ87BpnD4M/zeIuRSzLuaUnrxW/HflRlKHxTZED6VggCf5H6?=
 =?us-ascii?Q?D0sg04+NrCZmIQn+A0rZOarsdKs1qTmpERyPvMjg3NUf0X0IpLjEmEEjILJx?=
 =?us-ascii?Q?cBOy9bCkmKcdsOalAGRebMpeCJsJFmH/+ItcZdj8wX4bP3pgAMjEpmDGT8p8?=
 =?us-ascii?Q?hvHkHnpn2l+utrqVk4np7xWIZt6GXcQoLcX1Mv6kRrff7MHDuLELf8RJNU/h?=
 =?us-ascii?Q?yEiM+nYNhKj9LO3baCQ6Yptzu9UTB2QaOXr2fmePkhHcS1LLSloP2qChybKp?=
 =?us-ascii?Q?OexIskgrC7y8LFftGTgy2yl7saBGg22Kl9irdYHw6F1SJ+kkU7gjU/ZQnp37?=
 =?us-ascii?Q?QZ0NT5gTSuuYZR3OO4MV7Icr6q32pU/nmHnILMiywOwgW8F8yNQo8RjbgfXo?=
 =?us-ascii?Q?wOH60OsK3rogYDt68GawGPdeluob962Mi9WzHrXw3sEe5+eAg1/Ly9Kvot+d?=
 =?us-ascii?Q?X50h8+GO2nc8fWKsLriVjWEDntlOk4eMO+D0b+MBhPHuJhsVXLHTdEy58ihE?=
 =?us-ascii?Q?6TAvcVfO+xuMZHNt7QQfLL6UgEAFLB857jL+voPCK8kzhO94DL/Hm2TH1vPg?=
 =?us-ascii?Q?zXHDw37vg1K+3FIg1qVdQ6uk9J20oPY2NSYCDeSBDu82qf3BGDF1NUQKLayb?=
 =?us-ascii?Q?jU4tbotDK1VRVHn6LZa8HFphYDJnOwgSnZxpvZyTlevsjVN3fiXT7feu2SgH?=
 =?us-ascii?Q?/diF2qFVKTgbUWlOr1j6qR102RwJ+hG/uRamktviTCcc89axYAZxrW9l/Z2l?=
 =?us-ascii?Q?l2qlEiXPmz1fWvOTxJkmx7PzEBtqYuJO/x/OANFzzSkGnwLpbTGKztrisDBO?=
 =?us-ascii?Q?v59oiOLKJYO/7bvGsJ8cVXUpx+Ys0SW8m4EyQTR/eEhLRLv7tvT2IEx3JUi1?=
 =?us-ascii?Q?vHWHUozDo9EMvJAq311Q3c2wEhSGnl9FTf7N4a7qcKvBb9x0liL4lqeDZy/Z?=
 =?us-ascii?Q?QDH6ZUbtgF8AuCAL6eXVEysd3FDbqgo1kns9oNndQU+9VTuVIEns1xuLcqb9?=
 =?us-ascii?Q?jsLBcQFEo2sM4sgu4u2kYFn8CZxhv6CSptLqWBr9yJcsQSpBFKq4+3WD1Exl?=
 =?us-ascii?Q?+gVFPctjQHKMKKN0pdZuR35DkBan/u4jcctZgZjTr6MAgxQiZ1GLD93Yzyfl?=
 =?us-ascii?Q?rm3ef1lO/DrdHDEMD2RFyqe/Cpt6hmJlS/0vibJDXcdNTicBn5hz+iMCtJGa?=
 =?us-ascii?Q?FcTWRrcCQe90lsTwohV7OFC/j4/FMnzl1qpVH9FU/WWwN0RqZMAr8PU/da4B?=
 =?us-ascii?Q?VKDradSHaqZcs4PKSEsrXePHkeU8MnqsDUn8Ur78kvZaNHC5be/Cti6dJ2Nz?=
 =?us-ascii?Q?uzSy4p5HEszRL3jvn5W9UsE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pWiAVoRRR4ymbfd8BM/qxS0Xtzihwg+gD9Jjz8iln7bFx24mo4M3IJziaw+E?=
 =?us-ascii?Q?IJHR9pFhh5nuYKZsOn2A1hrOGDbMJxKU4eNRSIWwUMP+U2esZpWbFm7Fg7oO?=
 =?us-ascii?Q?9FfhoaLyOgvXDpFYaXyntXjdhBNKS5ULFC2O6CJWf7Zx8FkjL+FU/NpevUj5?=
 =?us-ascii?Q?YKfXuSoT7gOLZA8RLuMkOq8vQ2vEoNKrOIRr8z5Gfo4HnRxB8x2LycgXtqP5?=
 =?us-ascii?Q?UaMNYrOYFD/d8/6YTZsn4pGzsjiraURrpu/3sXO3tEM0X/3ZDoJG/FcoIjDT?=
 =?us-ascii?Q?kPEwUODApQ9zMwo6KDcVeqLa3WMcxgSf3rTne1dv2dNzk6xBt1gVaXcUsXuJ?=
 =?us-ascii?Q?HG3PdEPsmTTtOudewkR2dp3X3WYf2VjD5fGj4I6G4lVukgUIgytTEl6geowx?=
 =?us-ascii?Q?sgWJxABJqIFsSfF4Qu4/tq7XNHZHW272OqkSN7DMOHV0H6p2bZwkkxT8U8KC?=
 =?us-ascii?Q?rESjgJeOP4VwQyY53wbB75fOFIEKsI2OkgbZCNejq0JPptUia7AcAgzFCOAC?=
 =?us-ascii?Q?TmL3OtUxOidNdMbME3rKVDucFezxV8tlpuNzzYX6k9PBwK6u58JbrjHygDtG?=
 =?us-ascii?Q?c5dfGUpOarCrb6rFd7C4LcTXWdHtfnO6GHM2EFk5HfQ8OUDr5FntyNv5Ao22?=
 =?us-ascii?Q?a84qBnumuCMXWpyF2B5DhTySiuRM+92k+ss6rbJvFdclSKZQSmVIFfve1yB/?=
 =?us-ascii?Q?4sEu47vkNkcC/X9iAqBPrCVSgqiZVNBaS5r5wOSg92Jy9UnDwK7J6wOv/HMw?=
 =?us-ascii?Q?eoezWuyiXBuuRLQxgY5vahRq3qy5GKohkV1GuLUE1pZh/LtZejYQY+XfVDUa?=
 =?us-ascii?Q?H/0AOQRcSZDUHi5z73GzvPSDGJsigWyqC2tLP99X3tlDjHFcAH37yYUzA57D?=
 =?us-ascii?Q?d5ZVT/MlNuhxw5xJwc0igpkOqtbaCDbsRj939mCd8XYbGyxor8Q6brmHV//K?=
 =?us-ascii?Q?TZcnrYzlrZjdm3ohs0mXipgh8azcQgjGs6rHcQ2UxDpLhvyd/ZDIGXUMkdBz?=
 =?us-ascii?Q?4z/VdOyEj6kafTuO33y2Z1Da3TaJ3DK+WGyLTI8IT+5PrHKvyjcQhWCCFnuo?=
 =?us-ascii?Q?NzYKPhmkLVaYe6Lv2ZVApwAQZKiY0K5bdjYgRvTYrueH1puRYvyMTG2M0Or2?=
 =?us-ascii?Q?LS5ZASPU6Y8/badXQOsmLQ9XkQn1L7DFRDo5qlJHbvoEgEUJP5dWPaS/FOem?=
 =?us-ascii?Q?FsOMJ7LaAxuwMKvfjROai+lU7J7FeLthJfeq5R0WDVVAnpTXeQhXydtO+44K?=
 =?us-ascii?Q?NWkHcUPjUU3KKMPqWnsSBax9CO9MkpGr5xO8OFSScBG7zzoE25sT2Kv1czLU?=
 =?us-ascii?Q?8v33QyO576bSV1uWSHdHDQ5eMC/SUYzlzOsL420O5SccGBHaeqSRPTuhMkmQ?=
 =?us-ascii?Q?C65FNmlwXJEEImKqLRezo448q2rIRXZEP1Uw8VLbFef2APVUBwzuhLUNP0PB?=
 =?us-ascii?Q?f8105YHrCIOnfbal4jjBzGt/kkPuD84d4FT1idx0OrUXajFyIm04lS7XwKmV?=
 =?us-ascii?Q?v4KmsLGg+j8VtejXhmuWsL8juo7/C+NJAjbufq9vVA0v8HGUmHZcjLhoVd6S?=
 =?us-ascii?Q?xZvorjdJsWGoWP/TEG8wlQXWXa2TjXz8GQcCbjiUNI1d3n5VYuI+zO+aJJOl?=
 =?us-ascii?Q?64XXaBb4mpO94834XYS4p7cwyZwXlXlEjq1hzIWoMT39dc6Tt4Lt+CePyhvK?=
 =?us-ascii?Q?hkmrjX+3XhMdkDy1JWrPLr3gwKngropsmnKmu5c9XjJwR+FnvMgNAgG5+f/+?=
 =?us-ascii?Q?zNqMP01uxiX1L7wP86NOXjcnpKuA+iOuJ8856m+iw8GNWV6bLGVw?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96a44662-6b6f-41fe-c2b0-08de6024f009
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:28:09.6348 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FQv5mZY47S7wPcMZzDQHXWZ5k35h1BF813uk3RcmrL4QuqnIbLrSyuTQNGnVX6nnVjfhKjHhQpfJqMD66yeD7XHTT63xDsc+kf4y0yTf/Hk/F9Vb1RhCBKJnCip/A+79
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB13818
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,qualcomm.com:email,glider.be:email,bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 7C109BD1CA
X-Rspamd-Action: no action

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected tags.

 Documentation/devicetree/bindings/media/renesas,fcp.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/renesas,fcp.yaml b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
index b5eff6fec8a9..f7e486e90e43 100644
--- a/Documentation/devicetree/bindings/media/renesas,fcp.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,fcp.yaml
@@ -30,6 +30,7 @@ properties:
               - renesas,r9a07g043u-fcpvd # RZ/G2UL
               - renesas,r9a07g044-fcpvd # RZ/G2{L,LC}
               - renesas,r9a07g054-fcpvd # RZ/V2L
+              - renesas,r9a09g047-fcpvd # RZ/G3E
               - renesas,r9a09g056-fcpvd # RZ/V2N
               - renesas,r9a09g057-fcpvd # RZ/V2H(P)
           - const: renesas,fcpv         # Generic FCP for VSP fallback
@@ -77,6 +78,7 @@ allOf:
               - renesas,r9a07g043u-fcpvd
               - renesas,r9a07g044-fcpvd
               - renesas,r9a07g054-fcpvd
+              - renesas,r9a09g047-fcpvd
               - renesas,r9a09g056-fcpvd
               - renesas,r9a09g057-fcpvd
     then:
-- 
2.43.0

