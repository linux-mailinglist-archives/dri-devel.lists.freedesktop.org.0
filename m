Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNTEOv/pfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8010ABD147
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E069110EA15;
	Fri, 30 Jan 2026 17:27:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Mq1zijIa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010049.outbound.protection.outlook.com [52.101.229.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C432F10EA15
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ELntVBQCJdMbmQ+Au5G2MVDqipGb3MSJ7fQIhQH6lq4KwSaouw84+7E0rkJ2QYqnLa1BVmQEQXHoyTra/uUKz0a09uUfLxMcIQlIDnFtfHaHTh1yy/wWxX+WHqyBE6R9cesDz2XpuJzb5E0caWy9LoNe2Pbq2/JWrtZz04eeWef+DD7qCgJLA3RHrucpUiRGLh2qhndKewJFxzTlS804j/7EmmkWxvH388IbvtPiyNSkpK3M0QiT9C8v7t72Cj2QZuhJD/8oo/VDA4sJ0k1UGWK1OwMELF+/NJ/RsapjM09G2RtodO7pPglz81JQrIS2ijao4By6HraABQUAxsysVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TulgJ+jjctj3+MLFwY6KN8VfRya74DQwytx65mJ8Pg=;
 b=LRv7MJj4ZPj5Y3Thgd2ob/pj5zhPrkeO69Eexbrm9PMVNn3/Lcj0stVDFiBAh2B+bvKpeTyYRMMSMRwWsJaeWYOos4Ep30kYe6nZcEie+dElJOYdmfPF2YU6uNKSyJLTm66XgOREFfrPtJycAYbd2kVr1kg4lG0RoDwnHw2XbQLJEUBQ+9d+v/YtMLbgN9dVpw2t+oCFBYNkQzh4aDA6oZEIbBc281ImT3jrN3veWnXJbDRXNeH6pnQpL4XGc6Hw/1ETtaBIqVHULaTdQtEPpyMra8i5WfuBxry3Y46qC/t1hGoPoqbSzObkM64mQRC9U8erkawynOTP++ONyJTyAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TulgJ+jjctj3+MLFwY6KN8VfRya74DQwytx65mJ8Pg=;
 b=Mq1zijIaLbdiMDAGm8ZoQdm8KpVBUL6RYY1Gd2MwdYApNHcGn4jY5n3aULZtvCSkPGZDFliL2QImapj97gxXmDVbJ5ZwIOKLlOGqhqjncMh8Efajo7OwPjNYDrQ9umtQD2HWIcQlAYBmiFGnl9GRGdtOidwEuuwTY84FCAg5Tzs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:21 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:21 +0000
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 10/20] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/G3E SoC
Date: Fri, 30 Jan 2026 18:25:07 +0100
Message-ID: <1051d43106823f0327642649e9c6a017177434e6.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 37e9a0da-c671-45a1-dcef-08de6024d303
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UfF2Ol9UYeSk2O4haLPTlTtR3Hsle/Nzr2GqOEhDWbZUNk4x4ETO1Oy8cZ2k?=
 =?us-ascii?Q?16NjbYMfBHf8zw2hfia4mGI8zEah1++AtluadIYT9vbMZiC/uEqdnXnyiRYG?=
 =?us-ascii?Q?4hAtksoLS+l5U6njX6v8XZmeBJDEh8AlkAoioIk6B5Z29yKxrO4VssmxieRt?=
 =?us-ascii?Q?noY8FOikdKqSxsKWzokV23hnPz0bnj+xkg9sr+pl3483LRa1ZgYyjzeIgj1x?=
 =?us-ascii?Q?aeqsuRAJgomr1H+PjraxFa2m7Mq6xNm+N6kxdbQudgwixHZNsItdndnqoM0Z?=
 =?us-ascii?Q?3EBafiQNXahVzm+2pdzaSSsL9Y0ZmLTsuNT81Ktev8fowMAtsjPeMRbzou3K?=
 =?us-ascii?Q?jWaaszaFsxflQqJN44Glb/J6XkFty0nJH7q572H3VxMIdf2MV8Iq4mIbRJF8?=
 =?us-ascii?Q?ZHQ3OclC2YBuo2tpJ4m7btDSIqYCa7tJzV0C/UScX8wH9JTvmHyaXUZsSasy?=
 =?us-ascii?Q?Gs0jt+qVd3wXxK+OqlaHBZSzjd08pCN4PdB4rNuq22zLEkhbP9sVMMBnOseW?=
 =?us-ascii?Q?HV4gloTWFHxTJUSH7f3hrE9VX9EyX0ywnQQwZtABJOCimFoqF9d71nuVGI1r?=
 =?us-ascii?Q?/Gb5XZrGGjyzj894J1smaMj89/+fYbwwnJ7BupChBg+2TcmoP1R2Bds/UCfZ?=
 =?us-ascii?Q?ekMDILz8Adr1lQ038VFfXfsr3OJbyNKSn7aiqltdnXvW4wrG++FRvKUo8s4l?=
 =?us-ascii?Q?u613e485u/e1VWflpJ6HiaAkaypOFdrnmt6TP4tDHqrSyXRLlYofVHrXXUXY?=
 =?us-ascii?Q?46LATDMOHKtxqk9ufxKHo768IWFYUP/ZQZr20bJH+EsRRoUhi0nTdsaGVVzW?=
 =?us-ascii?Q?jFVGOy9NroKmYEK3/or7YtNq8nxQC8/Jxkvw0jJ2ctm/aKCTz+JJqSkqkoB7?=
 =?us-ascii?Q?RFkq5KbnPsHPUbovPqr/HqN68sxyectu8FW4VPTwJri3CkkL444fQe6Oxa7u?=
 =?us-ascii?Q?fTZbFKr4bgqAXnqmFnDoh+4w+UOXKR4ARQtKt0RZn5YQCXA1mKr0mMNIOHs0?=
 =?us-ascii?Q?QJ7iUNJWrUX0W5nFDhg7KTl9EQUXCzLtYYFUJu0fkywUNYGA/w87G7U7WuJB?=
 =?us-ascii?Q?j4BDiBN/iPWKG7BichWxbYdzwOKSGKt3f9AakOMGHqxkj7/yzec3foh1mLZA?=
 =?us-ascii?Q?n1H+17ksmqt4mK9GCI9q/wBzEtsyupfc+3u9XYpEseuVXMjvsIONAcC1KmVy?=
 =?us-ascii?Q?1CJXOTA3XgtRJPFm7kp2pFyyOVKgV1IiPbROTJmk+L04Jgcq7lT8tteDh0VA?=
 =?us-ascii?Q?VldMfgoLgIzSonTOjtJTJmX6EZNQpt6SiKU2Kis3a6BHBNFM8gCfx2/BUKLV?=
 =?us-ascii?Q?eQpOfLrRUddwxIQArLCo2H1XZDRF5lkmbOwdRryCJViTBe1YXrghliqD2Acq?=
 =?us-ascii?Q?GYEz3THZ5badbhbpTsOc+MeVAB0VkkTAo1o0UljzfAGzNyHijUaY1H/UUo0F?=
 =?us-ascii?Q?rvMsEn/wQqk6H6zE0MhWGKUyRiOoSSSN20jr6cuBjsiODTUPttThLv1uZ1c4?=
 =?us-ascii?Q?nFYypbVpzawk7liRWtneKbOjPEieNqQa1937ddDaa80gLEJx9eGaKc1XQXkQ?=
 =?us-ascii?Q?rDaGkbteRCCEW2ZaA8WRa68mF0oPFs6Pm/AbIf7yuj4naAMzIpN3YmPqQpsk?=
 =?us-ascii?Q?lt1E0P+P35BQKI0AhDFN2ac=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Aa1HzBavUKUdDhYDM7tN39R4EwhoGwxyj8CQNvWanBdBnc9ZEO8LElouqgsR?=
 =?us-ascii?Q?SeiJLCNmG2m0GpkkW2Pg9f4eNIu8R6LbSHFzlLb7AFMLb52M6TOAvLlZrYHW?=
 =?us-ascii?Q?HzMVdVP5UM8OAyv2SSX0LoxT5VmO1epDPJOUm8xCI/LWAqIM4vsLOqAU2gwH?=
 =?us-ascii?Q?HLFEG93DhJcEI7DQBcz0xk01WYNCBXxWhr20Q1d/rh7XvtbsdpwqHBPIPAaM?=
 =?us-ascii?Q?1wuM1nfbo0dxypNaHBxTTHEzPS70IQ/W2EtXvJ1glYhQfjxpDEFAP1PoBx6U?=
 =?us-ascii?Q?1JrmVm6SKihKU62lj/0zymoATp6rI7vYJXJ6+0vh/wlczyZx82GaaLDiRhRM?=
 =?us-ascii?Q?swUeqKUqzfl9+HoYxNKnUX51a95cUcImY8IwASlrRmwldVgbm1tWpaY3Hzjc?=
 =?us-ascii?Q?WKiyCrzcOjgH4wk07SPQI2Eo6I1RusephNNYpzcEJlJvzaG//4qp0V9dS8+a?=
 =?us-ascii?Q?0L+jlgUEziPTDtLgTaHuJ7HCkz8BB+3Gm+csBsTPD5ZLyLVRCgZtR/g1+7eC?=
 =?us-ascii?Q?8d/XTusugi6MUd8L8Ba299ZLCLnjhVhvLNAp5koDrkhfu9ZbFUoMyS+BsnhS?=
 =?us-ascii?Q?YW0P1O6qrrWA+6CGzHS/JDE3/3e8u3sDzi/83MnoNxZaSlPalzHkON1ohF4A?=
 =?us-ascii?Q?MXkIlV8ZzDFgOYyEO56drmZp8pZVE3cenbjVXUVeRWSDq8XD2qOIJtstNrMs?=
 =?us-ascii?Q?PWNRVrQCyhsWiyMxnykawhmaEZUqzNxRtlR+FXgcdYh/tLu6BkmJLyQQ02tA?=
 =?us-ascii?Q?qiLMQjD0bn1xOl0V/TpT1KMBwl1eDvFAhUH9YSb6i2JfWp5Pyz4mgxNlEyN2?=
 =?us-ascii?Q?wfSQxb/VT3mxse1y5ZEK/a2WYL0gHkfPn3Gl5++lhDfKNy02OQK/LUIF8yvX?=
 =?us-ascii?Q?/uws9R1WSb2+I3riaDiehPnPkus+UcuzAiuLoJsnmxpNVC7eVaPx9NwTjKQ+?=
 =?us-ascii?Q?fniLTHslZUJsbq6onuRpGIwTdJy4ZhFp/cnaDhr5pAKAp6yVgpp+JEBqbqbs?=
 =?us-ascii?Q?2ePqO5VLEp4maj8DujRTKl3wd9GZEbdA7WAcCnJ4bk+5H6LC7PLX2eGAyhob?=
 =?us-ascii?Q?Evy2ZKrRuG43WJSzK4mhIhvItJBkhdSPL4mSinydqpbdGFPtCdpmcAJfgkwl?=
 =?us-ascii?Q?NCsNRdxY5SspzCIFJwin07lC+vD1dxohz44T+DUhm6D+4ywEV7Gx6URz3hm8?=
 =?us-ascii?Q?JVL9kTMDvtHhwMhJx/maiiSSUeF71gVulYi/HFsiX/aqZDnuf/Hs+NHNw1nL?=
 =?us-ascii?Q?OV5+ynrSxUjJ4DFcaQy1iRwjVb6l516cMgoptFaC7AduOQUfNIcAwQEPHZHQ?=
 =?us-ascii?Q?Y/DWwoBo2mqsKtyLK4l/T+cpSwnPahguBUwRbVd7ADme32uv6uODslhyhanC?=
 =?us-ascii?Q?pN5HAxbYFz9kHTCjIDQqmYM3dqCFuMRUNrhCp97ux/+9fqeAXlbeIIHdcjti?=
 =?us-ascii?Q?pNMSXLmOz2dQsoiNACr6J191FP6etPyqILycx0boTXqp42hGAXUCOoVOZI3n?=
 =?us-ascii?Q?GBve0UUYZL2/SkLk6e7gYoN2qwSCsmQBCjjGLEN3QF9x4/ZCigyah/nuZG5N?=
 =?us-ascii?Q?W43OeyZ/IiydiCf+2Qm7nrUGBBaJRpRqVggM4M3QNfZaPwD7f2pkuwF6cdWU?=
 =?us-ascii?Q?jqOH+5XRrNw3JKLdUJRQYV20Qf5dVPDcKdSXau9qiAcRxrzyc7bNX/cFiSGS?=
 =?us-ascii?Q?xVcFIDzDzDm8jBVMjZI1qgo0H4Ns90BMmYKKwgcWMmSR2vANbqe+DQ2dWPnO?=
 =?us-ascii?Q?tg3kcrMjvtAENLDkLqA/2AnOp5SfPEL278E+numzeZtpm9E4tt0z?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37e9a0da-c671-45a1-dcef-08de6024d303
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:21.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7y4N2S1Ji5ybamG8PHp5HMfrndO3cqbREiE3cp0zn4+iJusYX1oGVY0aOwTq68Wr0fq5El0MKqpLSPcvAywuD243QUzI1S3nC9rsHIwdFazUdHEpi5L3tcZAAO36yyEm
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_PROHIBIT(0.00)[0.0.0.2:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 8010ABD147
X-Rspamd-Action: no action

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Removed oneOf from clocks property, which is no sufficient to
   differentiate between RZ/G3E, RZ/V2H(P) and RZ/G2L.
   In particular both RZ/G3E and RZ/G2L have 6 clocks with different
   meanings.
 - Use the already exist vclk instead of vclk1 for RZ/G3E DSI bindings.
 - Updated the allOf section accordingly.

 .../bindings/display/bridge/renesas,dsi.yaml  | 144 +++++++++++++-----
 1 file changed, 109 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
index c20625b8425e..00ef279129fd 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi.yaml
@@ -28,6 +28,7 @@ properties:
           - const: renesas,r9a09g057-mipi-dsi
 
       - enum:
+          - renesas,r9a09g047-mipi-dsi # RZ/G3E
           - renesas,r9a09g057-mipi-dsi # RZ/V2H(P)
 
   reg:
@@ -54,20 +55,8 @@ properties:
       - const: debug
 
   clocks:
-    oneOf:
-      - items:
-          - description: DSI D-PHY PLL multiplied clock
-          - description: DSI D-PHY system clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
-      - items:
-          - description: DSI D-PHY PLL reference clock
-          - description: DSI AXI bus clock
-          - description: DSI Register access clock
-          - description: DSI Video clock
-          - description: DSI D-PHY Escape mode transmit clock
+    minItems: 5
+    maxItems: 6
 
   clock-names:
     oneOf:
@@ -78,12 +67,14 @@ properties:
           - const: pclk
           - const: vclk
           - const: lpclk
-      - items:
+      - minItems: 5
+        items:
           - const: pllrefclk
           - const: aclk
           - const: pclk
           - const: vclk
           - const: lpclk
+          - const: vclk2
 
   resets:
     oneOf:
@@ -136,13 +127,6 @@ properties:
                   - const: 3
                   - const: 4
 
-            required:
-              - data-lanes
-
-    required:
-      - port@0
-      - port@1
-
 required:
   - compatible
   - reg
@@ -164,33 +148,123 @@ allOf:
       properties:
         compatible:
           contains:
-            const: renesas,r9a09g057-mipi-dsi
+            const: renesas,r9a09g047-mipi-dsi
     then:
       properties:
-        clocks:
-          maxItems: 5
+        ports:
+          properties:
+            port@0:
+              description: DSI input port 0
+            port@1:
+              description: DSI input port 1
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: false
+            port@2:
+              description: DSI output port
+              properties:
+                endpoint:
+                  $ref: /schemas/media/video-interfaces.yaml#
+                  unevaluatedProperties: false
+
+                  properties:
+                    data-lanes:
+                      description: array of physical DSI data lane indexes.
+                      minItems: 1
+                      items:
+                        - const: 1
+                        - const: 2
+                        - const: 3
+                        - const: 4
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+    else:
+      properties:
+        ports:
+          properties:
+            port@0: true
+            port@1:
+              properties:
+                endpoint:
+                  properties:
+                    data-lanes: true
+                  required:
+                    - data-lanes
+
+          required:
+            - port@0
+            - port@1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rzg2l-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL multiplied clock
+            - description: DSI D-PHY system clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          maxItems: 5
+          minItems: 6
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-mipi-dsi
+    then:
+      properties:
+        clocks:
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
+            - description: DSI Video clock (2nd input clock)
+        clock-names:
+          minItems: 6
         resets:
           maxItems: 2
-
         reset-names:
           maxItems: 2
-    else:
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-mipi-dsi
+    then:
       properties:
         clocks:
-          minItems: 6
-
+          items:
+            - description: DSI D-PHY PLL reference clock
+            - description: DSI AXI bus clock
+            - description: DSI Register access clock
+            - description: DSI Video clock
+            - description: DSI D-PHY Escape mode transmit clock
         clock-names:
-          minItems: 6
-
+          maxItems: 5
         resets:
-          minItems: 3
-
+          maxItems: 2
         reset-names:
-          minItems: 3
+          maxItems: 2
 
 examples:
   - |
-- 
2.43.0

