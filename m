Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULptN/v4fGmGPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2ADBDB9A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEE510EA1F;
	Fri, 30 Jan 2026 18:31:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="wWutQPkR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010012.outbound.protection.outlook.com [52.101.229.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE37710EA42
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m+ojmGkwODjNYUaAlzzOiaouHqeSAZuMo5jxUIzc+5Z22XuMLAZOnXO38IfI+Fw6Yz58N1hyQLmJHk5bPCUK4ozhffAPMxnBJblZXJHt0RLlT+4tq7Lb8K9BO++0YX6v77eclrcrUFacvcNFJZlL6nLFaArw0dMXeZH/UD6s5bSY4wZ3qr+Q4c/qIlT8mjPH8MQRmJBGwrsvYN3reSvGoBvBab5ddySSgiT/WJtkhrkB5txMWhkqL2iQJLU4NT5rAvliJ99GDjvJJmJ9B2RUq36FCwZTlX5fYJo/Hq9dI4eBybdTuRim+IfrcU+lmekoV0ucfoIJaCbFcz8bU/bLLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QZ7bVlnkHHttUQhKOMvii8GtBlfublhkgecLrBfGktA=;
 b=FkuMa6KGzmwiCwMY5p6is0Lcoygb00nskGs4uEs3TWPBSkEdaFdXSxofhr8VzHMm7LuV0hpGooWXdxJ/5a0IdBlYmpCzbcmdM6YxQ2OrRTID50FwYWYcb/ySlnRn76QBf2PZQ3lm//w3cEz+oyFsGeXETZq46YpxYT5Bctj6DE204gZfphsIonCqH9gOd2v+zCrSrZXLeqpIjaIwxEZjBKLrt+4JQLTY7r0Ja/DJP0ScgGlZlI2DDVZAv9J+ympPEqmvy7FNVHffOsuia4FaQjys/wX5sZtvpo3dJXhVZwjvCeOvZhWyE9KJAZxiYcLPw610rftcPTVqVeEXJrKfqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QZ7bVlnkHHttUQhKOMvii8GtBlfublhkgecLrBfGktA=;
 b=wWutQPkRLiVWoRU+C/ljXifC1826EsA6jaSA62CFXUrYkF/xSTbP+akbv8ZPpb6tu8xZrHpefwqFDIC1GqrvyGPr1Hz/nSvftN9LFuIfV/3Pp/XmzZMOt9YMslIZpurrDOqH0W0p+IiLdQcanSje1QX/zQl7wCN5VMvxt/sR23o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:10 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:10 +0000
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
Subject: [PATCH v3 04/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_DIV7 clocks
Date: Fri, 30 Jan 2026 19:29:56 +0100
Message-ID: <7870f867007b458b05db4e4e3fd860d29dc37af5.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: da452e2a-5f29-429f-4355-08de602dbda2
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FTvZ9iS4NaOMftRvM3cQPOOHM8lFxGwMLrRLGotcadKPCfaBBFFJQqvmhGXp?=
 =?us-ascii?Q?20fcB/D5IYFKUXW7yhDqptfsmdqexIuWQ2ZTimHRZ/AMlHNLdQas/e1S505/?=
 =?us-ascii?Q?GzPRsJuqR8wZpsbOHDPT0AxbpjmVhuWtIHH1zO2dbvTNExpIbBIzn9zTuFgw?=
 =?us-ascii?Q?Z8wMuK0IlvQn6gdXo+tQM53VWSm+cZ3Q7qr49ae0UwiIffugkp//aILsJUYn?=
 =?us-ascii?Q?2j1ldF2dhCdhjVHCshpDiYfYL3uXqi5BU38ttNict1g/ucB1wflitf7+psw4?=
 =?us-ascii?Q?UUQMVe5GqqS2CxhyDuj2DWn0RKnX0O6JNWxOQ2vudsgWyKY9KjHzD5AINpdc?=
 =?us-ascii?Q?HQSKeu1UK/ll67C2TcQ61qwd267eTb4IhpfntPFxOdXKwcrcADh6jJK/oFTG?=
 =?us-ascii?Q?YZ3LWFO4A49sEm3Re/YWwQMHSspl4/olEMD47b/PKBysL0ysmPnJmtM0Lxqu?=
 =?us-ascii?Q?Dp/uU8JX5798Cv8A+OSKtg4zbzE8xPWeCGvPUkiLSANVJQnUg2tMTN3ZblrU?=
 =?us-ascii?Q?3O5qaLrHFLPUiIHhW4FrSc1z6NmplWQDl+M8YSTEvymmzxmqHbeLQprLkfZL?=
 =?us-ascii?Q?/Lo5FsV1xjeWTH0GjBaXPQu2rEPFOrLonv4h/hmySVab17pi19aWi2RMR6So?=
 =?us-ascii?Q?Cx6X62eUFEuSiE13yn8sfKxdDmCJ8dT9j1LjBCqe8rvL94kBg5TqPE1AGCoP?=
 =?us-ascii?Q?Fy7t/bwpikcRHPJZugnEtpOzSOGvQhp3ncUeI5dvtns2Jkgvu03wlxiY6czi?=
 =?us-ascii?Q?1BSFIm+7zAkASFFfQ11vAxt65ij4ziZiqaHVo/uRT33dwchuUesCiRkZHymj?=
 =?us-ascii?Q?BqdXqcwOZshgFLyzzUjsYq9O41ORZD2ymPGMSJFzN2YOYebaIF7TJo12vgFc?=
 =?us-ascii?Q?Mvr/nQu8TvSSWeOVL7BPnokA+kDJcGfgJKi4UzPHV9uQsOVaQplPWfNI8LPK?=
 =?us-ascii?Q?c6WzcIBi7lFfwJUwuLORkiVsZEnaRcPQ/J+zETKY402H2AxTI6GC04Rw3SZ6?=
 =?us-ascii?Q?pCCPtKCQlS0o/VuLvB7rBJ3FxO6fK8z10z6Jlbn+rgcvFzZ8Q/QsGq6XFJ6k?=
 =?us-ascii?Q?Gj7lQgmowjBlJ9FAE7hZ1I+BfxadbQIk1NO+LDKVY5gGo+QLxSD0j83Hxl7r?=
 =?us-ascii?Q?Eale1jsddWFJni5WX6RbYuhQSOMtLuhspS92phGtv1jVxe6/N69R2SogPSnR?=
 =?us-ascii?Q?zN+eeEhVbQzMIvxEK8TvmF5sZ+GLpBEdGOx2D37b9fYeO+qVjX1BKo9bwk39?=
 =?us-ascii?Q?yhRM3fEpSYPJygLM53oS30/d5RPgWwJGn6Mxjq2d/NQpdsmfwCXH4Srr2+zV?=
 =?us-ascii?Q?esnCWlfNcMYnUBikq/8fZsibAp6cOs+G1XLjTy7b6keSUFqViifyPeiXAfZl?=
 =?us-ascii?Q?9Z+EWrcih3OcZqT3B/QvX8IQb4cQe6dMpzu0RBNq6z77uwG5owWcLJremoWl?=
 =?us-ascii?Q?+2hVPK5TSK8LM22WAHIuHESc2Xz6iz9jkQXBlZc0LlwX5PXKkIyqWiWqYPQp?=
 =?us-ascii?Q?oYof4yxYvUosv+X1wLRBPc1gQKAbuBYVGINSkZer3UNQXbKP4K1VzLbLZjpm?=
 =?us-ascii?Q?c2UaEHoBZNMPrIc5HQW4oYYjyBxe+Cb7jxp/PA4GqfubEaC73clzqZDvynfD?=
 =?us-ascii?Q?lCn3N5qMYHuWwY1mimGXl/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?95NxXxHCZG3Jt558ltv5MlSKhKjNUvPfO7XLxUouCDU90pues3jJvahs32+g?=
 =?us-ascii?Q?5TLQ5JvbW9X4o3rB9XJELVri/u4FiYFAYEWjroyDWWLd2A50h15rtFDPMZwz?=
 =?us-ascii?Q?Eu3AL2cBbzaIq8rSRPKsRhPZAeXpMDWns0noUeJhVntL7umZ09Nv7yrmZ/e+?=
 =?us-ascii?Q?fdsAJ7AKeJELhnNPBdwT3HodxTAGto9YVKYKPdSZYqspZjYWGkgkfNc1Y6If?=
 =?us-ascii?Q?t4MYzF7aWK5JEcQ9CV6TpZ02QHujR6do5m5u54FF7QWCDPEjY9t1KF8q27Kl?=
 =?us-ascii?Q?G9rGDY+xjUyK3xrB3+fajJ2QHEnX0E+3H1DVWjaxAfzgCGSIBajkrnEQhgI6?=
 =?us-ascii?Q?5dFyhESiLShc5d7V//KmVIxZlfg3dfRT94S5nVkFDyvDIYoTNEgV7EDgxKDh?=
 =?us-ascii?Q?vm8N4tO5WnYQH7/Hg4fpy6SfOdcLspSMIWjTWD/GX/q/LF+4iTkt4Qf7EXwy?=
 =?us-ascii?Q?IxS/Ny/bi88jyUxNjTmmJK1sAn0fXa7uiTXGaeI06/R5go4iX/57oUl6ftkk?=
 =?us-ascii?Q?Ttjd+EemQGVXAIBv3NaNdMQdU7hwnS5WgJR/pKB6xCgWseV8yKnB3l5sR0Ub?=
 =?us-ascii?Q?VZgs4hSgY6zisAjGITwwfp1UzH9Vm1Df5UIADxXPDOuTdo7zU9N+QjeM+IkP?=
 =?us-ascii?Q?BHLa6dwWF5PWFNyHqjJIcvB7kG9zol458KdAcr2jcLmtm+rwyE71yWc4E6jl?=
 =?us-ascii?Q?fHA79fjZSPHePHQpE3PFYP27OAS46pQEeG7cXLE8x1QgKtG0ux+n/xFXpEXy?=
 =?us-ascii?Q?+XWX2+fOQjQAUX70x9pREhQvZy4aa3qUI7f311WWkQ37+ltPcwOqbOy+TWc0?=
 =?us-ascii?Q?n+iotfwY9j466NR3phjJxulHcFIZ8mvhyukAWHFG6znWTDOqCXAgBFBYu5rD?=
 =?us-ascii?Q?BenW8PuZkpt3OPT7UQWQQtiEbFv57kQ9T2N5ZozNQ2RmXKQikH3cAyyIo++S?=
 =?us-ascii?Q?ryrR7jS5pRIQPLJo0AqCc0zLSlVZ1+hM4umYoUph9W6l7+9HBpVb+Pt+wwaP?=
 =?us-ascii?Q?ZV0WiP4teVK8XfXu9ydzTHbOwyH88bmbds5aW3ZtRoNJ6xURKkxcHNvz6hw/?=
 =?us-ascii?Q?0Y0BppBdV2+zVCZ96lpPXiDO8jZzxI+nbkloUixfzbu29w/zYo/kRlIN4VRC?=
 =?us-ascii?Q?y2R1sqPXZUIUntfjZfXNdQDskV0F8JDRk4XiNiRmvaPr9a18aCu1qszAcp2D?=
 =?us-ascii?Q?UKDJWAGiWtNhDIwmiU16R26jAwY3NU0xTPITqkbGKKTqV/XyGSNL2xx1xx2o?=
 =?us-ascii?Q?MAWjY0i+yQVkkiZ6DW4KUcP9Kt+FtKO1VxlBkwFtghBsIu4wA4+z1GI8LDnr?=
 =?us-ascii?Q?U0jEi1so5vDNYO9w/03DIN68mAaec0IuM3OT29D4HTCybsZDirmgVKFShh7a?=
 =?us-ascii?Q?ESSXJRBjakdOcaKB5nsEqcn/GI1iSbreoYw0ivOWBaroPz2hhtnH/cc2o9Hy?=
 =?us-ascii?Q?fRYYOAOGvOqK5TBBL2oM8Vr87l7JzLVOaQq4OIJzwufBZhSU9tN94Y6zPyaR?=
 =?us-ascii?Q?2bj02Hx3INWz94qakPUmBcf3FF8Gb+JytW9OA9D2oR/I5mTn6NDJIMCP9wmv?=
 =?us-ascii?Q?VogvbEG5NeYs2Hqzc5bUKm5KmL760CnUPMfs9fyZo7qZX48xJ03zoFhJg1hh?=
 =?us-ascii?Q?OSYBct8I1iQR4TIc+tvvfmi+/mksg2gJZkfNZ30Ep/6wJ6ECHPaTiGRCcZZs?=
 =?us-ascii?Q?wTtGwogaTioKzVFrR/Ea+xSiJU0yivArbRb5+LEpFUHbNihUJcSchS79Doo2?=
 =?us-ascii?Q?m8QcYLO5q7RR6zLEpW78v3TwDXlfqz7Xm+5Rydv/9PsbSaWVTonJ?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da452e2a-5f29-429f-4355-08de602dbda2
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:10.5135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nptaMJWbAHATRtkAPrymSrnvEB08MegWpBgKhKKdyYAeVaDPV0mtKaZcdFwEuRU+9JZNFQqkvwmO4duygcGavX4S9vbwqoslOzyOPn0qjuAGFBK2L/C0GLJ3716hmLr/
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,glider.be:email]
X-Rspamd-Queue-Id: 3A2ADBDB9A
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

