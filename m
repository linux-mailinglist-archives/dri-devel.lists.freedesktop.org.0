Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aK1QCMRRj2nnPgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:31:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FAA138120
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F27110E835;
	Fri, 13 Feb 2026 16:30:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="s6X+/nPm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010061.outbound.protection.outlook.com [52.101.229.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC7910E835
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+SQWBSfaqccz4VqrI8WsYAlxBRbM5fBcldvtjt6HEuQf/YhgUWBxI79lxRuqEfHRVYIXzp4TDq6CfjW7eK7o6CtneZYiq+UCv+Sn27IyTLAzbjQS0svWOFU0f3OOH8rhzrry+Bp5Ia+EIvi+6c1FU+uBor+5Qj63r7eEHHQod8T8VEaBldsmbpvHxWZLsPRIQ79pcv1+YSRpGjP6k6w/UCX250iBbRFaOuzX1QMtgKJNpE0e21YSOvUuIdS2AZBCeWbZqUgEh01sZ7QKVZmuQJlx+5sA/pgnn8o/momSP3j2nPzjsvshp/5cj9SB9j54L6Rt/y8mxjIQvEmrnIwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2S4bgbWjErXI30qLdvSGbi2AQy1Xcc4eVDveasqXhiQ=;
 b=e7udzYSp2aKO3YskOLWfrMaOi9RpkRUsNk9cUkhqOLQT8dPr8ypWxgxY/kcPVI979oZUIu0zWuR52B5UWNYC+i7lAqy4MSG3zgCuzsvhCQibgi+gG8TNIyEiYWPsGnr45V6pFSfwt0i0ou41AZqlvTNJ06TLnyLgTc5mRjPA9IsrKD4xH28+73Q30bnvP8SGTXJv0rhhVMWSjV1R2S8SCdGlQff7h+kiNRvXYSgGwp/KUrO0gELKnTkBbVOAtqTX0E7kaem5DWKMIq2Zcvd+LKOh+V7WpPGl2cg3NtAsiXVjnHOszCQt83RMclD2Uvm1/UQmWmaeOsU4MFd2kxI12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2S4bgbWjErXI30qLdvSGbi2AQy1Xcc4eVDveasqXhiQ=;
 b=s6X+/nPm06k6R0siOOdPO0VmhrfZdXO3qe+OULE77NeafJXKLGHinKGRKhMxXBHfbMK/gBGk+pwz9CiP4xEPG1IzXZdjY3QTqPaZaH+nkiy1tEw6AiBLIAOOLrcIiiwH/VF84pLiUEAfD4ZO48VshCmsRp4+jMs8gkChbiXbxgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB12106.jpnprd01.prod.outlook.com (2603:1096:400:3d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 16:30:52 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:52 +0000
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
Subject: [PATCH v5 19/20] arm64: dts: renesas: r9a09g047: Add DU{0,
 1} and DSI nodes
Date: Fri, 13 Feb 2026 17:27:45 +0100
Message-ID: <9435e2cb91a84a3683bfd7302f0034db12d14fd3.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|TY3PR01MB12106:EE_
X-MS-Office365-Filtering-Correlation-Id: 594912d9-3588-4323-554a-08de6b1d4115
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UFoUNTl1VasHfTntNAyu7IOcX3/ME5Dm7SzPC9m1B2mznroz3zms0z0LN1r?=
 =?us-ascii?Q?HxpSbhIUUDHEqFZLf1fFtw0t/gSQRpEsoU7iSgx036MM2ywdnq4szDrtNMzs?=
 =?us-ascii?Q?/A8j6hUTJfF9daCZ2PB8cIicXxuoM9Kl8sha/cZDXdu/ANqJsRkaqK+L8Ap5?=
 =?us-ascii?Q?Nh9xGyJPvuDPvNtHU1jU9IIZkJlNTBZ+UtTvtlwdRzDdkqbtU2ApGZDRKNAD?=
 =?us-ascii?Q?E9t02nk/v5cCJbJqo7uwr0qMSMkHwE7uSwCLrkXi4j5ipmhg9YBknHcm6BDT?=
 =?us-ascii?Q?Vpndg0/GSGusMcfuwb+KTy5MC1SKbOSBzsYOh/eN00H07hKomqzMYQYhDjWu?=
 =?us-ascii?Q?KNxHefgepOUUvp7/Beytab1VXYm8vZuQWp4KTxP+y0iCiOdqWL247PKi61/V?=
 =?us-ascii?Q?TzrvD0L3m32OJZ13V9lTgGjsnLbNK1D82ZDa1ISr7QtasoUTdEqOohU2x7b2?=
 =?us-ascii?Q?Key3P9GZtHxIH8+dWMuPJ0aIgTHb7BPMuCAMxzLlFH/FeP8+GzYtS8FakVOr?=
 =?us-ascii?Q?cmC8OGuJyxaPs08Q9pRZlc31bwHX90SpGXRX90JH2hnMyBYZ3DFPUjjokFsT?=
 =?us-ascii?Q?IyCoO9sOC69N4WHNd/OmCUYoPdI7c4AWQWDM+y9UL1KHIHpjTYCOvqOjfkO9?=
 =?us-ascii?Q?J2ykkLc5Wv4Cc8fISYcbdaqew9z6x8G4j5OeGUJgVFhwYYkXSOmaA/jN3Z1D?=
 =?us-ascii?Q?BRjOJXS7G+y0XXf/2KFxoVUCqfVMkPp3rH8ZkML/3O446UDUmN2pxDlLizOj?=
 =?us-ascii?Q?KqhgGa0VBV1+eDMoAWezr4rEcdWJs3ud/OfDuhSA3cNs0oUTGrx+XnYNOu2k?=
 =?us-ascii?Q?kMo58wVos5vqQoY/Ug7XXQVYU0PQjQwYk8m2gT0+m0KfC1j68JYvzZyP8JWA?=
 =?us-ascii?Q?BphNb9znKHGD+QKZf9gSASLGEBxepnqC1qlALVP6tbqUP7muje6LnDUCbPXJ?=
 =?us-ascii?Q?4QIdMoRf5jiqIZIOFwcCHaW1KSBEJRB9J1OXxYZU56Unzq39utFwV29t30T0?=
 =?us-ascii?Q?Em5g2O6kOmnCm3Pyoj//B8X0ZFXYXjRAercRFArMkqL4//SxS13MIQ848rUD?=
 =?us-ascii?Q?XbngPp1zygudfzf1Eae/JKJvYMKi6DfgHjTIZEZU0E1aP8I6EX7bSmruYeFA?=
 =?us-ascii?Q?kVSgVirjQ+uVOITo9/cL/ELvTde3Sw/czxH8eDRNec15Ocbv4K+sRPh9gOFE?=
 =?us-ascii?Q?+Vf0wa+FFlfOYePKgj1vjqk49X4R0s2LfbbS2zL8MuhtONfOmdCc1ZnFnMhR?=
 =?us-ascii?Q?xJPkdgZ+HgLzMDBN9fNGKFJzG0EWQTgEUBhxfLc7LmdwWCKdYnWBRXSlkod1?=
 =?us-ascii?Q?jF7H/tuAHmh4bHliIov7mSbJp5B3+9O7EiF681xNfkD6ezenws00Roew19Gk?=
 =?us-ascii?Q?bxTB9kzHyQZEwuqOXx+H5u9rqHgz4iF43FYbANwlN5c8Z4E8nbKeIoDB3ozf?=
 =?us-ascii?Q?HVIkgAVfjuhqDZ/KgTUHWyFiB3z7H0LZ8iHyUASzWG+cWYxYNSZhjxQ7GMsr?=
 =?us-ascii?Q?CjgfokenqF9CW82siotppra8llK49kcS4VIQcheG2yuMpFmEsSmqOxf4XMuf?=
 =?us-ascii?Q?Xk2YFb6+dqfWO4UcummyzbPDDEbQMZ/wxtVquA4xRskRdcuQ9cM194+NRksF?=
 =?us-ascii?Q?NpVJ0kYa1jXaIg6lpofMNm8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R4tyOB4xZ11DO6HNKFiD39Sanzu0Gf62wtrvL4S8w4TDmnwGKLngeQBwSmI4?=
 =?us-ascii?Q?zP3C+pkNFw3teAiOQQubHWlx2gK5viycPSYmiPrx2Dc6szbjJsWFuAqWuC3K?=
 =?us-ascii?Q?JKa3+WKaekX0v3X9hO/1rQvwVDxysoD79vln0OK6CTp2VfxpX4t7iVSgtoHd?=
 =?us-ascii?Q?kIP4du+jObrh4eN06YBtZCYKWfsQ+UmV8AaJMh1PNqR4kylJscz8FYCZMIYL?=
 =?us-ascii?Q?MDyY1vynTCMKc6ZOC1QiQY3vsXi0yEVZosgTXPQpU0hnPwUwPEyV7JPWriYi?=
 =?us-ascii?Q?Ndu/3xvRX3FUbZs/S8rfHv3LDLEcsmadc7+3asoP4RoxUnw/jBGxEqdLRTRq?=
 =?us-ascii?Q?5PkCbDnNi1q27+Mv9Rdql/8xdBhAeaVI3k3T57OHHlKJAIg1qsa+0mNO+y/7?=
 =?us-ascii?Q?FFXBSiO/LlZ8zWUI/vyX2CU3ZdcZC7TtkZVYs0GJsMc+9NqTpB2OkKK2H0n+?=
 =?us-ascii?Q?Jg8MuGK9V1VE1Sh3EvSsi1cLUQ+iSwvWiknk1Pq3ATINL03YwAtaKb75eVYg?=
 =?us-ascii?Q?WAVyNC2QEPCG9ulT/YtWwDUa+/1BXeXTXCgUVop64ac47+xgaeiM21yf97BT?=
 =?us-ascii?Q?1WGa7JtgjBL7gUUMZeLjxwya67jnu4nA/U49x4dLmWq+Zk26w5uqTx8fQzsP?=
 =?us-ascii?Q?s3z6J+VcdnFH4KFQjdJI9IeiY7IxX9mIRcw8/+moIcHwVyfqMKyI20ZmzG22?=
 =?us-ascii?Q?DU3P3ryesY+Bj78/9rqP0wy0B7ej8tzJ5Qehb8LOT+dota2Xl7xxnH7D9C5V?=
 =?us-ascii?Q?5Gi2nC11T6yovs8JwC0n3K9oBmmxMv54n1aMCsaEnfqiGy420Vkb3CzafFRf?=
 =?us-ascii?Q?wQHmdecYN26TT1Ii/Q0Noaq6eEz3xjui2mW7liNq6s0Rv4CDJd310eMHBh4X?=
 =?us-ascii?Q?5popkiCwI/olsCup6D6z04XpphvqMzSfmq0zVHC6lpJfjoktZeIT+oGbQRo+?=
 =?us-ascii?Q?txhhtTLGRsbCU1XVDeKJPLd0qtd6tmuAz46A0LE10uKGzCAcKuVJcENycTH9?=
 =?us-ascii?Q?1rdX4bMIDi/Q+b0yv6HsFxpZu3wVMtOfiCE+q3eo3AS4JaupSrqAK0vs8aLD?=
 =?us-ascii?Q?NHYHyOOvOG4ZIccX28Bf87oTIuO+b0n2wpeIy5/2pGGlRNYCWvRK4pgDN5Zk?=
 =?us-ascii?Q?U9gox5dVf0e4FqpFcVfTYItKNCml2mXs8wv7Cw93FJMY4O4pDRLVKcfbn6BE?=
 =?us-ascii?Q?mb6bskaE3k+4DSNZ23lxSS2OGjp7tXsb6ezecbT7BaVd4ExXWd6DsQ18Qg3i?=
 =?us-ascii?Q?E2TAl7LXzST5VqgFEGdkly0y5MG0IuPh6N8HSKT/V6ZuU8RloQZfT/b6O7dT?=
 =?us-ascii?Q?GRmq6eXmZ4OvX0rC6zmpuyug8DI3aOhkL1Nvzsc7AIp/x8xPXslWzS2haS5q?=
 =?us-ascii?Q?rmEyAl700Br62FOUsI/Gfyfhso0BL/Kq28GKhz5F+GMoXcHePJdk0HIMXnUW?=
 =?us-ascii?Q?PxJZZCDbTClJloHWZk3lF7ATo79g6iJ3/EaNMCT8EJKlT2PDp97zqwxn3Ixb?=
 =?us-ascii?Q?e6t7fuV74jR8V756SqDjjIP8LfsAVAuuiyH2pSzirwVjW/EEo539/PCRN18a?=
 =?us-ascii?Q?tRpHNPZ0cG3lpH/iKsOfQ4szocfUyelddCmq7hu1HUuqoST9hXF6nbvmIS/d?=
 =?us-ascii?Q?v3zXrNWLMyh4r25+iU/nWT2rypqmzgTbNWxAAL1lWbbvcGkaDtCeKcXCqE1l?=
 =?us-ascii?Q?MC59ZYxSIhaLwnQ1rw/4q1YLahaVQN6n9rd9+F5eU/PfPs64BZPzo0iFwnEz?=
 =?us-ascii?Q?OdwgXWCdiFwW7nbO6HBe66LBUKg8Jusoz+SwNRbLijPfYOdK2kpS?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 594912d9-3588-4323-554a-08de6b1d4115
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:52.6537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bj9LRG8j5migyEohw71U2Xf+sPuhiGHG3LTww4lTnxqiMtiryrnPSGwLNSondrXPuphcaMhVzKLR7ox0ZjK7f03Nk7K/qP3baphctcD1cTK7/941mF6lN5yNzLL4c4HX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12106
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
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
	DBL_PROHIBIT(0.00)[0.251.79.240:email];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 75FAA138120
X-Rspamd-Action: no action

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Rename du0_out_dsi0 into du0_out_dsi.
 - Rename du1_out_dsi0 into du1_out_dsi.
 - Drop renesas,id entry from DU nodes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Use vclk instead of vclk1 for DSI Node and set to the right position.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index d4db44b6ccf7..ef788c5c6df0 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1432,6 +1432,127 @@ csi2cru: endpoint@0 {
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
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi: endpoint {
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
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi: endpoint {
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

