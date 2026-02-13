Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMCcGE1Rj2noQAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7B137F93
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DFAE10E825;
	Fri, 13 Feb 2026 16:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZDCiBhtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010030.outbound.protection.outlook.com [52.101.228.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2626B10E827
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j2nLQbytuAyYEOcPdkiAcouxBRTtr2pIB0ftN75gr0lY5uBw5UhlL4pm6LsJfi6KwYLbgPh+EtilUkV7RCSJpEvgvAoI9bHuNQB3HLtwKts0lGXTObw3omv1s1ddBozZpnAAq75XSryT0GPcNtz5lFosKbMJpkDomW2D7y58a9QgqqQn78x+RY7EbYyn3bsylC17wZsIFdjYQ3Ek6ggjvD+o80GqwfjRlq/vBZAIDm6cl8zag4WhcsXJH8bUg9s15VJ87D488k+RjRnQ/CzofXDN+vZL531zt6ve8aTd6Tw7Fiey9KwhMeGImTpVUeWwqYj5hjV1mpTYZg3JtuKRJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wcIfLmXeP8sNv2zhFzyG1nJYrvh4zPhjjTWCqqJP2t4=;
 b=xXC2FR35xtO/3EI3xE3mSUIZmMNY/zmIXtroseILecVKipAY0IdKkP7IuJI7DA/OGpIgQwRGenvuvRuz/yimc2MqVufQTmFdmkM9b2f5KGbUrfF7htIyU36nK4ZSngCHqrXlEuug5EGijctncuSCrYGr5TUmyOoz/dedZpr0uCZg9pmOw3pPpcXSwfFEEr8LoWy6HOKFDdFZJa4/Ts7gh0is7FXSIISisXBhN6RuPz+pG0bmEF+aQbWhhf42nPJVj4VQ3e9cz/sAQupKaRUWouaivDL7PhnndCkXcx4EhgiCzdgri4Jd8Jy7K/ez/KnR+IwG4q08jIO8pAT6hJrPgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wcIfLmXeP8sNv2zhFzyG1nJYrvh4zPhjjTWCqqJP2t4=;
 b=ZDCiBhtXJMvQLUSMuyqXkpk/QaCIqJcV63o1sw2BukjGafVAEOtM/RwgJpJywHUdqT6LfAqTeDty/gN7PNiGxvhubRTGI5jrdyE2SF3Ye/TOqJqiqqJ4PZ9OPymu/AsM3dOZGpjp/C6wOqkL8U+ISleV1Mnmg5mJe48oy8G8p5g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:28:55 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:28:55 +0000
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
Subject: [PATCH v5 04/20] clk: renesas: r9a09g047: Add CLK_PLLDSI{0,
 1}_DIV7 clocks
Date: Fri, 13 Feb 2026 17:27:30 +0100
Message-ID: <d3d401ca152a6f9d3b4d8176260326bf7101cb71.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB16005:EE_
X-MS-Office365-Filtering-Correlation-Id: 179ae64f-9622-47e4-35e2-08de6b1cfb25
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?k8EKBThSmSU5RPUgmUmqBoSAcI0DILI0/K19Uu/44i3/xEfoX2fLYcvhNGwq?=
 =?us-ascii?Q?uzzsd3jeOtIeSqpdnJVaRRppUx5n9PIVmg3jsHto6jJR3bU+8vNrFmAQ+6+W?=
 =?us-ascii?Q?pwTa7TX8q6+6WiQmoCEWIFymHtQhFhLznf5JedF+BNr5OZou3mNKySFxJnxn?=
 =?us-ascii?Q?rS5/3GWjowGyWiYxS/hpeRnFiJL0iFP8FpeBqaNPCs5XgYtTCzHUWa2dSC+s?=
 =?us-ascii?Q?kuYTKnHYAv+UlTCaT4TcJWRwDZxfS1dL5DiM+Dlp798j/lCMe3jzoRFOhPlE?=
 =?us-ascii?Q?3Fl8c73U3HW08oN5rErKYrXqwEGpjilnTdc9xZilS7BZGZx3CZCWa0WBXZHJ?=
 =?us-ascii?Q?IFNz65wY6V8Twn97V9SwRpZmvYXESOivn9HiG68L3xKcMhnow64cUx7L7SHb?=
 =?us-ascii?Q?ROO1jG7uJ9tOKiWlnW4faHuxoPl8O5XLIejYuTJKFZ3eatISYNHxnD79Nx1g?=
 =?us-ascii?Q?8G+F7LM+Oo5SM87BwjlWU9gvQ9IZ7fCHLkbDQovtr1qc2nAlS8PdJVolsT4L?=
 =?us-ascii?Q?hDVZQu8tvTToGl4dF8MQhghEQ7uvPGRdaeubTxiR05kn4QliNCtFea9TXQUn?=
 =?us-ascii?Q?IfvqK8lAAJb9NPO9Wce5Fz5BlyLbyBRVqkHWmqpmgRr0R/mXZ6c+cCW+1Ipg?=
 =?us-ascii?Q?jy48iunslcANloOe9Ak6F+EXF+b7maN8FzsDiyCbBVVPrbrn1jhsnnVNpvV7?=
 =?us-ascii?Q?LrKl+joNp2Viz3wbO/arv501GZ/CnhiuOhb9IWtZONae/J2WQ8rpvLmAiuZZ?=
 =?us-ascii?Q?TH1rkEXdynrCj/ttEGaH67zoJ1vbG/eySoNvUMa+JCwdBYUoRnhZkjgf67FC?=
 =?us-ascii?Q?VZA84LsHeTkz2wj4mt82dlvslrkBFyXM+EYQTig3RUZtn3mH0YIZB4sAdU2O?=
 =?us-ascii?Q?TUbYchorxGglfybjlMBSE9/pqf6RkIQ8YvztQ16o8dyyPap94ZZ+LW2vX9yf?=
 =?us-ascii?Q?FvsHsuE+DbbrPwlbyDw5TWIr4icWYhRInif+HlH3Nu1N0zLfZWT3/Gn/WYu3?=
 =?us-ascii?Q?/Y7KiJ5yNdOrM/dzLITpRmiKCAo9GaZdRDOQmBMsg1EVPzj6102c34APohP/?=
 =?us-ascii?Q?L43/h3/yPaLKoYkBz0YrExiPfJQH+7qCJlohOrAMKv7mvKlIzA5/WMKUck/s?=
 =?us-ascii?Q?pxCDzFNiVyDvL5hdbk26hiw4f4YTWWi/q9vWgLQhzKNISnW7tKdWtWTFvw30?=
 =?us-ascii?Q?6Xyu3Dr/8H0GYNwgqtKgBAN6jnP4lThVXz9VplsYftWwyxYfkZWdxVoiTtwm?=
 =?us-ascii?Q?fug5tZVSOGSDTKdADqrF+P1iqYikqCgo2njQ41LngSbhgT1gV32Yro8k3WHK?=
 =?us-ascii?Q?1XBL2X599vkW+VDM5EP8IF+0UtdP1/y+v3yXFi/2JBxHJ+A8Gm7RNAY6xVXQ?=
 =?us-ascii?Q?jUZvZFyuPVAhezXnqJrgNLJj2CiBXHdsawM0uTm47kHSnVW0bu1BC8Mx+aFp?=
 =?us-ascii?Q?IEugywAKk+QuzxFtnfzx28fUbV/ZcpASJyAT0r1Sc1aKv9POO9KDWxQ7MCPg?=
 =?us-ascii?Q?wM1JiRlTl3Ptw5/wQG2jr+Mcs+PbwwUnBZd8/EfOJsIfjAkEi1tnWFvMixqZ?=
 =?us-ascii?Q?K/nwxxRbko3heob5i0CeV9lVajF9+U1Y1PR4YPfD0LygLZptne3lPx2HujyI?=
 =?us-ascii?Q?Xt5bSDLeswIfKqdVY41PcGg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SCKOY8diHWP8rTtJyeYIWIC2NyqvOqW2PvDIgdwwkjApkLGFamKhQOt/XvUq?=
 =?us-ascii?Q?G+y2KBvHha7tTdDQmVthBiVlUDY4GsTQNVppol37CJsVWT9YrahdpQmnAVz2?=
 =?us-ascii?Q?Kgi6VE3tnN65gcd6a9qzr1rcWTnH85fFdWEUOCbuZ6hcM/N3xMexRODoDFhs?=
 =?us-ascii?Q?ncJODd6p2s4nvWpeN2rn7qN9DsjIOzoXupolTiNzivI+NLAsLqwcEli01PCD?=
 =?us-ascii?Q?Rr+0d+HStbpAdGOCrpbNS64a3mQSibzeuhT9i9ixt28g0iRa7SJsLPs/eKHI?=
 =?us-ascii?Q?kRiwZ71u8scxix+8bzbsVeipUgo/K/JR3oPDlpTOrUPsyHuwD5m1EACSAH1+?=
 =?us-ascii?Q?LOEG2CbzRc1lytag3jTzytkwqfcZD5+L/9C6VJS5S/+H1+ysWezg7YXX7zDl?=
 =?us-ascii?Q?E+m+Gtc9Zwjv+yDMA2CB5fq4o4uPsZRfGRDp6WlviyDX92tjybejwpwW0AWN?=
 =?us-ascii?Q?KPuqUWUzJl+uEwvwt7npUJyGTlHam5jmEs9YthDlEnPMEbzDERncV+xbFAVn?=
 =?us-ascii?Q?OPH/GiuLlR+wk1Y9fv//k73XgSjLq9oe2/jk8d1VVCd+5eQEqUQ1m4ohj+Wh?=
 =?us-ascii?Q?AeOp8InxRtwGtw3ye8RwepeVL0OYwJWykdTzkWtFk3hpk15U8E+z4a6W27gO?=
 =?us-ascii?Q?PExKMu7KDurVaLUzG3Sm8W9yKn2QDhEwxbOHahjxMGL2SUO4GiI4TNVabA1M?=
 =?us-ascii?Q?GfJeLa0bo19GvX3h0wRurpexBa/ngEsyTyHDkCxs8vtgerClIo7ike5ngimN?=
 =?us-ascii?Q?2LfBxmUE0Tw/WGzxZvpoG8EEwvGqr0cL3Rlg0kbYdOjYGNoofP/WvZVBJE0P?=
 =?us-ascii?Q?ewRkUE2+sBIl5DHAk0chS2x1B8yaxxNarUmvgBKPYrtd/UtUOZRNJTWkWYW4?=
 =?us-ascii?Q?ZlGg9ca3JLYddW+yU2KIQET2l10wgAiswJsmH3io0RmY6qlqF7aHcMnETjSm?=
 =?us-ascii?Q?QOWAS4ZsDQw2Mz/ZLVNHL7inSgM93vL5D4kRi7g3TaGVct9AOzvwy+VtBADr?=
 =?us-ascii?Q?Ww8DQl9zuiCxe6rjZIppLpsKCcSFIUe2a/aC1/LuZx83sCJF1P+1+w902zKw?=
 =?us-ascii?Q?8gkeOkHadZxnRxg6rElBLvj1Hp1OnLJWdZMJEhaT6NTrno4zXEhZLRDQUxLv?=
 =?us-ascii?Q?i8ZDLqJptXV81XotxLCj8FASluJjeMehnyI13XR0yj7BXpQ9v/2GlYXoxFOt?=
 =?us-ascii?Q?KKUeh7FDn6Jxe3mbSnqbPJYdvqqLUDfZT5dxmoWkkFOQGgEqdb0BnlWV5SlU?=
 =?us-ascii?Q?GwVUHKwGJaGYK+dNjAtON2saNqDbqY5Ui0ut9msmzEGwiXE+MwOL+iFmlNfh?=
 =?us-ascii?Q?ccRkE91kzGayQ/+O3gqGKfC3jniG4pPyZSijmfWlhFQOrQW1nxZbMu6HCX+0?=
 =?us-ascii?Q?cdPEnNCzUyZDQTURPh+XeRePQNa24l8LEHeAj2X62gjC93YtMS4xDAGB2uGI?=
 =?us-ascii?Q?MSyhVJbLTUO1zBKPc5Wz7/Qf+0tfu+hBOD6hLvWSeQwuizzl+daYUUdGHbA2?=
 =?us-ascii?Q?OIbYg8rqcAWxZXAD9EzeJtLCjg/gH0mepl4co0TZbX981HmPO/Y08enR3/UL?=
 =?us-ascii?Q?Tr6U2XRy//iw53ZBWIVpd8U30IxzP7e7q1SO+ehIcttI32M89DrXeEFVDUiX?=
 =?us-ascii?Q?xgZKnQfdgoiAOfkXTt7qf15Hp0whYu60XKJQT+ppvpmn2V50qX9Nz00YYB08?=
 =?us-ascii?Q?CpCc4WvCQoB0C796U4vf+EIvHKa0Jeiz0KmO+jwq07dy7HnLzrzGAc0r71he?=
 =?us-ascii?Q?QzzCMjgS2HoUkdI25rgW6VWwpF7XvRpOhHSRAMHrHOa5MUteMDuo?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 179ae64f-9622-47e4-35e2-08de6b1cfb25
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:28:55.1311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n/HmiPSPyScoVuPbf755Ft9TmGT+gUXYiuMFhynyIkFdL5K9P52gwWz3lHa8ufW/2QvLsarsu5JHvhoobiZyhdz04jh1Lr9dOkfHyBuUM3L1LUhkJaJ/WbGUG4LangcB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB16005
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AAC7B137F93
X-Rspamd-Action: no action

Add the CLK_PLLDSI0_DIV7 and CLK_PLLDSI1_DIV7 fixed-factor clocks to
the r9a09g047 SoC clock driver.

These clocks are required to enable LVDS0 and LVDS1 output support.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Collected GUytterhoeven tag.

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

