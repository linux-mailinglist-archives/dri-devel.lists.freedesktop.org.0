Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDaAOvz4fGmTPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEF4BDBA1
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F008F10EA3C;
	Fri, 30 Jan 2026 18:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="taw/RkWG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DFF510EA41
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:31:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pu+j3hVm8eARGapEoL3FKBLfu+WFhAYkW6GIw5EiXkFfa/i2ofhu6cmqs3Oj7oVbugLzC+I3G4JcrUcebJDU8M1mQzPpgFCsXuEObaWFlsd1Dr1H9l5dS3v5AfI+sb1vgVzEu/J6aJ1+GQa3omuwjYv8waGcPIlrBpud0Bo96YYJM+rGYtc/MIMUa0dWhQvarsT+fBI7ZOL0/CJJptXcXH6iukCrtTxw/OM0Ag6kdL4ldQDSXIuKO+nGxKoYIBs5N/9Ss31olMIQvmWgOoeVPjHbPDfusRLsD15PDaZI+QlYT6IN7p12YD101SAexrYNFy6h6ttFEjp663ZJdfJDeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKCT8ClPFeXfgFY593TK+RXwUeiO9mMPR32SMZsBEz0=;
 b=FEfpTWYNkS4K1BdiLBuup2aVQwlSdc2h4jg/KEXStMyMdyduz6t8DrgG2gV6NQfHNjcp4iWz9RBELNCHCcjLdeNNrI0JVyT+fYGHvdifi7eTg4Cw5+GsuSmQd62C8a+MiS+OANMlbJ7LqLceVyRF2LFl5hTLqY0ut58DG52V52nlkOVxUl+NPN/YkPKA6R69QCE9cPsP/1KKEGJmiROWU37Ua6fwUb4pMzrneaTLemTGBEqar6EqKEX1Z8hv999ZIdP5QKwI1/nTp/77Z6WOGPywhaC6mGV0u4vfbEsH7PPPin4qeeC4q8vnFoMyjKKJ7OxNgvytsaXOd6JMF8Q2RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKCT8ClPFeXfgFY593TK+RXwUeiO9mMPR32SMZsBEz0=;
 b=taw/RkWGb3gBWDj4qo69KicqE1epFdtOEMujOEy73DEM8RwmkrMpqTcS/OXvgLRFkMv02K0+p9Gahg/xebAYiMHeb8691KIzILTV8hCqxs/k2XQg8xsQo+q7zbQC9MB2BwJ3lSLayASdWtXuK8KioHu00Zetpi6rmTamsP95phM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB15715.jpnprd01.prod.outlook.com (2603:1096:604:3cc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Fri, 30 Jan
 2026 18:31:18 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:31:18 +0000
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
Subject: [PATCH v3 05/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_CSDIV clocks
Date: Fri, 30 Jan 2026 19:29:57 +0100
Message-ID: <4ea6a53838f53da29a6727b7163319a41ac80945.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: f901ffe5-66ef-4aca-68f0-08de602dc217
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GiLmNZgKrEWUBleBSvhplWzSMLCmAZ8Rcr+sUP6hlRkIgMHhcZ0lwfamFx0V?=
 =?us-ascii?Q?vpa0pGzHMDKi3ExPcY8RYw2S+r6aJL1Hy9b72P+a621QwcHwPXvFX71QdolJ?=
 =?us-ascii?Q?fHemhZ0HnO5r7OmazFf7jVHzms2huFUazsjSajW4FbAygOE5rB97+Uq8Y20a?=
 =?us-ascii?Q?wvICLv1GRdFZ3aXFu0IwGDgo3gWDxt7ZtgMW16NMPcXxUmT+qbIMo4nq0cCM?=
 =?us-ascii?Q?hB5sJfS71nZ4KXNpfjFYhZnKFJ64kkozpzXNNeKbx3kJ3y7XZcgXZNE/VqZK?=
 =?us-ascii?Q?etfY3m/KCiPAshJQwAZiJqhsCHWWFP9egLfdUVjUjb+7nozAd+x4gAHLwdbH?=
 =?us-ascii?Q?tnw9JdEHMJh9Niej6/JM6wl0E0iwbdRyVhnao7k8Jo3KPaXcMlaQT++hbszH?=
 =?us-ascii?Q?u68NnwPZplc+//SNX+Tb3+Tu4ZrZdG0lZ3H4MhZT5HduxLHiitmmlH4ElGqB?=
 =?us-ascii?Q?NDdM1P1nPi0a7Apz4rrtJodSXmDMFdp6prBSmefhx5+ozI1kWLxeEo1e17L9?=
 =?us-ascii?Q?3cXPV2M9xblAo/DtQwz9X8vcegM0OwnxVyPXR6jJNldBcacY8hrS0lXQsYAW?=
 =?us-ascii?Q?0rwLqTJXeN2tQMVWNHcjKlS917T9e9iTJ1GKIwCjG3cFiHS/HBPXdCBZwtNs?=
 =?us-ascii?Q?ttxDcc5CKYeWRm2ClpcMOvwStuH7UR+Sbn4kVE74Wg76jGMDPKxdFSidAKlV?=
 =?us-ascii?Q?jyh8VnPUTN1TcEAk+1fSUSO7ZlxxdfJUMmBPGFT+YT3LWfF4xjVAI9Ksl3uz?=
 =?us-ascii?Q?mGR27D3N0TcLW4D9myslrZFO82i//rs47tIyuor/Q0TPTXhag2553cF+uk91?=
 =?us-ascii?Q?haoIaQX9AOsnNpPUvbMz8o/JbOCTAMKXXz0Ukb23jbLrbU6AyUXKkKJPqAkN?=
 =?us-ascii?Q?pWZaDOM3Rqkz2wYvygEmm6GbALeY5NXlZ/JeG5KBNrUYMYaGfBTel5adrVSO?=
 =?us-ascii?Q?gfRTyY7Oei01x27pSkS1GhkUuIRAffd0xVrfj7Lvhia886VRvEMUP208eCNB?=
 =?us-ascii?Q?43bJxMMU89dMfX8xDh/Dq6GdnkF8CPp7bqIHWKbxbFzd6F+1v9lNOS7mBkVX?=
 =?us-ascii?Q?+IiR/wgIcQV7beBeAJLG45xCXHd2gfFjtD7jDBkOhq4asXLEV/CHmwdFQFB8?=
 =?us-ascii?Q?Wck0wgoUVKarnHEIPejQ30IBIdrXsSgEWsZypxCq3/r5uNQap7wOzb+OB6HP?=
 =?us-ascii?Q?1UTmju7bO3MAgawuM1Iu374Jf3JOvupgqPEmX80oiO4DMxpSo14uM6VY3bHR?=
 =?us-ascii?Q?5j28sLr1+O6HZPggevqj3mEVDZnouduiF9h3eh54L5VBPD8RsM/544ZL1KQX?=
 =?us-ascii?Q?lNLpAmd+go0U7IYW0ynTAsynd4Zm9LmxThQjm8qP1rdwK+EMbN2Gdh99owSK?=
 =?us-ascii?Q?a/77l1byt7WMeaI9A7BfFZC4pdaT/7t0b37lOWcl0qR1XkGWixvccKPvVBYD?=
 =?us-ascii?Q?kkxnk9LtjaEroHNdYVsQSWuZ1GyYcPcyut81taTg2t1+a1kGU/Rx5SlA0+BO?=
 =?us-ascii?Q?7+8jgMh0jUlvswtgRvGVfTpThUKJrXFUssZHrnezKMlTExDRfgyjXwfFxdhh?=
 =?us-ascii?Q?HeaF5O1rJdQ2XfudSdRli+Ym3/2nTYYFGOmFap/GWpPBt9t0YXeyMQUIlZ/7?=
 =?us-ascii?Q?vPWBKDmYtcxsPK18rENB/vg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q4TemNBDbAx4KdZ1QRfmZrMfBKnfkq9gPruhsia53/KTdO4acZG6dsIqfrRl?=
 =?us-ascii?Q?YfA7nugVn2uyVViT3WB7nQCfpKYDpS2j80FAOF4kD/STEJBkMbeyzL2ZpVfj?=
 =?us-ascii?Q?9sgjMkRDVVaRGR2IJKWnvs2POlumQpk8E+OI/HQR1t19+jZ5w1Bsb+7N1ZhE?=
 =?us-ascii?Q?h4evKqbokcxaUmbQVGl08T4IfjFCLuR7VBSd+YvzdiI86ezA8M8fYCPgPukB?=
 =?us-ascii?Q?mPSt/r9MRIyGJwTN8WAkpOclxFAyLCOEVlooCRRiJpZR2hLY+LuVOpyEWJKX?=
 =?us-ascii?Q?KDkrXZSoo7n+f8G2B487UwtzbW8Dyx7VgOwGDZfbJtkikzHYzLw/8AF8FHIc?=
 =?us-ascii?Q?5F0qKK4dEmZMvlbuMXs8u/VdksFEUlFzqcbeHNzxBUGdGfs8ao8XwmRKy+BK?=
 =?us-ascii?Q?n/7KtMiSftzTUV+7V2K/wvqQ7yquYICRtTQKyjugHvzDgwN9Sx3WCaUPx6lf?=
 =?us-ascii?Q?O9/AtfNeRq3lLTBkDYtQRS9++xPYD6BPTRn1Vi+/sDmKICz7kmRNv73E/QjI?=
 =?us-ascii?Q?minVC0MqRH+wvNJ9d+5rD89UpvxkjXD69u6696MzAv0D/EXkPVFzLmR4VCmD?=
 =?us-ascii?Q?h5VtQ65bHz1AxKHWiwvEUBUJP3sHy77BsllM6xZ9q6sGznAJ1mUwRf8WeBIM?=
 =?us-ascii?Q?D+J7NtighkGtUlw0yYtOX9ngj3IMiC4qCpUyoeHjmFzSWiyQ8l503uX76hva?=
 =?us-ascii?Q?rWyQRn0C9d1uf5HELZXFgIXm6VSpF5c0oaUkVgaj3o6l+WQmNtFQaj81JTE9?=
 =?us-ascii?Q?MCYOwBS/CRCByHbKVyzSyxUx3SkqN7B64d5VVDEWu0VV5jeDxzEG48h3cOC+?=
 =?us-ascii?Q?U4mn2PbqQeLBq1/5DKf9GT4FgrcNsGK3daazkJZ7A2tK4Ul8XD/PPakL2Cug?=
 =?us-ascii?Q?076uzIyW2fH+k3jwkAzNBugEkKL0IPJi0XCoAWjP67Bw4lRnwfrsbxKRNzal?=
 =?us-ascii?Q?WrypfrfrpGBY8xd+KfS81mWEG/3gtxvoEfbFmzcFqZt0EsETqQe6x3wOM2OT?=
 =?us-ascii?Q?8dpxj1jjj4aIsvK0AAFrYCtqAnYygv7gTX/h2XjOGSZuDBpgbRkqRNUMgUop?=
 =?us-ascii?Q?VAk38RByQkA6zDg+Le+xEApnsXMwWZ2wq7h1AfdW2QSYHND+WDtV3q3LUZzm?=
 =?us-ascii?Q?Ixc8yfjCaE35avBlnrrsyBnj9SLtcjDI58kqYjHWezYPCSp0q4qfsc24z6Oy?=
 =?us-ascii?Q?EjaJvuWAOrO4AnXHjGLBmo3ylIYlPuXHZYGjqOHrzRwpLtOEoFpLRwXMV732?=
 =?us-ascii?Q?ACPcTAGlgZg9x2nb1nEBQ9yKpL4Cs5TDx/+sJANe98+8eJhqIHArTFjs68FQ?=
 =?us-ascii?Q?SmSwnyUFhiXOcZYyvvmALSrHuUQNpTCtRwwWja58HK9Xc+IGEJXD0MbO+SAa?=
 =?us-ascii?Q?olsC9naAIKPavupakMGG6vnmBMnkAKxmI4RfEO9/tz1w4QYpSkPjxAsWtRbv?=
 =?us-ascii?Q?bi+E4f8ECfEojca5Hq98hVu/05ae9dCP4ztqNINUPlipjQnjgkBdIBYrRJ3x?=
 =?us-ascii?Q?kdS3VnastqQvZJ3MXQPPzK5BHeklzlDIngcPBFLMV9WqKJa9cqaDsmLbnWqp?=
 =?us-ascii?Q?1a1HqZJTTcnJYalShWzqZ1YQIVbAvH8HuwhIl4oDKT7nlqfkhzSfbeSiz9df?=
 =?us-ascii?Q?aoHBOgZb6Pl94JUO6eDLS0/5aTDWAgmoQZJHdQ4k5eum/opijxreaopeVj2+?=
 =?us-ascii?Q?mTa485DSPywl3Bd9kPd6cQ48kshj83oVNui94sNsxVoZHKgf9wzyRDfwne7N?=
 =?us-ascii?Q?Ct/st1lhjn3NiTkjeS913VY3to6oq03eY84cCCLtVGJWO3m6RzUM?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f901ffe5-66ef-4aca-68f0-08de602dc217
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:31:18.2043 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OwaZfG6PPdOR0cboeEkLeIkRm7vNXODzHKH9+Ev9WMlHUkC9LgdmzwHM+zWqFsd/S7wMVSIR0+fytXBlIUT01MxJcshQitC74Lll/ZJlf4w0m0Ev+wQeUp+6t4kyi6s2
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 9DEF4BDBA1
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_CSDIV and CLK_PLLDSI1_CSDIV fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable DSI and RGB output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

v2->v3:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 18 ++++++++++++++++++
 drivers/clk/renesas/rzv2h-cpg.h     |  1 +
 2 files changed, 19 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 0e707391283f..aa6528b72cef 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -71,6 +71,8 @@ enum clk_ids {
 	CLK_PLLETH_LPCLK,
 	CLK_PLLDSI0_DIV7,
 	CLK_PLLDSI1_DIV7,
+	CLK_PLLDSI0_CSDIV,
+	CLK_PLLDSI1_CSDIV,
 
 	/* Module Clocks */
 	MOD_CLK_BASE,
@@ -98,6 +100,18 @@ static const struct clk_div_table dtable_2_16[] = {
 	{0, 0},
 };
 
+static const struct clk_div_table dtable_2_16_plldsi[] = {
+	{0, 2},
+	{1, 4},
+	{2, 6},
+	{3, 8},
+	{4, 10},
+	{5, 12},
+	{6, 14},
+	{7, 16},
+	{0, 0},
+};
+
 static const struct clk_div_table dtable_2_64[] = {
 	{0, 2},
 	{1, 4},
@@ -198,6 +212,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 	DEF_CSDIV(".plleth_lpclk", CLK_PLLETH_LPCLK, CLK_PLLETH_DIV4_LPCLK,
 		  CSDIV0_DIVCTL2, dtable_16_128),
 
+	DEF_PLLDSI_DIV(".plldsi0_csdiv", CLK_PLLDSI0_CSDIV, CLK_PLLDSI0,
+		       CSDIV1_DIVCTL2, dtable_2_16_plldsi),
+	DEF_PLLDSI_DIV(".plldsi1_csdiv", CLK_PLLDSI1_CSDIV, CLK_PLLDSI1,
+		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
 
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 74a3824d605e..33bc3c27291c 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -148,6 +148,7 @@ struct fixed_mod_conf {
 #define CSDIV0_DIVCTL2	DDIV_PACK(CPG_CSDIV0, 8, 2, CSDIV_NO_MON)
 #define CSDIV0_DIVCTL3	DDIV_PACK_NO_RMW(CPG_CSDIV0, 12, 2, CSDIV_NO_MON)
 #define CSDIV1_DIVCTL2	DDIV_PACK(CPG_CSDIV1, 8, 4, CSDIV_NO_MON)
+#define CSDIV1_DIVCTL3	DDIV_PACK(CPG_CSDIV1, 12, 4, CSDIV_NO_MON)
 
 #define SSEL0_SELCTL2	SMUX_PACK(CPG_SSEL0, 8, 1)
 #define SSEL0_SELCTL3	SMUX_PACK(CPG_SSEL0, 12, 1)
-- 
2.43.0

