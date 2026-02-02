Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LD8A6KRgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:30 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC89CBFFC
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 12:59:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE55110E475;
	Mon,  2 Feb 2026 11:59:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="HruqvSv8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011035.outbound.protection.outlook.com [52.101.125.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C34410E475
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 11:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UK4m5abDL6Vsne1gZNhQ3FRyfbhaS2rVrp7a4E7zaP/OcfA/adApmEzeUlZW84KDtqx2nSawyeoEr9KIslHTKEI0AYE4mQR/oslUhZhfEMZKUEpgQCLyQ8GIU+KWK6oLRx7eVbv5Uy3UL0O8aSLGIK6hxe2VUE3uoYRNB4k4gfNhcYNFrC6FBZpY8Ca9PF+javaItjL1hMYaLao9XdKL+YmsBMQb/XaMKOHNLihDcy28+9sKMoUcuXp3rJrIlQUMmyXSG/oBo/LM3/0xUYbgNiN3VUjk+bpP04hjgZ3nlt4yQ1S1+cVuS41+kFxmCUyOGA5HbvvmsB3AWDyRk+bi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkwZ8c3ac8+Dzvzfi/4O4T5uchBJvXuNkZDb7T6ahGo=;
 b=VKr1k8UP/gviQBwGr/YmEVAFLmfri8zZZ2uPi4E64+cvRy2iil1p5sM2VffOu3jpNbyNVy4PFocLYdfgRFqxFR2k+30K9L8pvjsdAkX23+GqloTRDPLE2Uoq03zBnpiMUjZoarTM9t0x9dMmYyrvkWMlSgTsn739oTGVaYE6ZNhBa8D6AduFVbma9dgmq72iOcc/Kvo9Mkr9kRs5x1Fn8RuwulXijRv7KtOW9mR2X2zbIKtio3lwM0HfnFxMudlpKJiA85ZmxQ1rTyZoCdE1T+ZPualFObFoZFxXmJYSRcR6picskPaDfPpucOlH+mpKYsPXvTtlRdUHsu2j35juEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KkwZ8c3ac8+Dzvzfi/4O4T5uchBJvXuNkZDb7T6ahGo=;
 b=HruqvSv8EHoQFlghPALAZBmkBkpj40R4uKuVIqONk4IW+p1DKyShoNEmsmmr/YwLuwCfrYZX6B4oIm3eCQdXNLWHW8Pms2X/Q3efFFz9X4/zm7qhoy2M6mLmu4+ZgGtE92kznztwwwz+tYzCdh1WaZHk+9s5p/z32SFPG1TwHys=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB6552.jpnprd01.prod.outlook.com (2603:1096:604:fc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 11:59:24 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 11:59:24 +0000
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
Subject: [PATCH v4 06/20] clk: renesas: r9a09g047: Add support for SMUX2_DSI{0, 1}_CLK
Date: Mon,  2 Feb 2026 12:57:37 +0100
Message-ID: <8c9222d531b9c1a1f813191ca471b3f06be0d459.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb49aad9-5120-4773-a157-08de625281ca
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+BUti+7Os3Ahg2WkWVD2aNO5vBp0sMJJ9hsJcAfwFWPSkQQC8yaZ9b2EgzBd?=
 =?us-ascii?Q?o0w8k3foGYWUoORq5U4pjwUawjP9ly4xk3M79MtHwJ+4J5tT+cHTUkeyFwRA?=
 =?us-ascii?Q?Dcz3NmdZ6WklIb3YlUe+iZm64GQhJAgKaPaPp5LS2Kc31ChmCoI3EBmc6OjZ?=
 =?us-ascii?Q?A9eoJQfn2iRbJlRDBplIHdT6AEN+9I85Rleb5V7TIEK5AhuwDiMtYf4yMI62?=
 =?us-ascii?Q?QqFPFz0d+99dDqhjQhkhTSAokbdjlONiC9DOWRLTnDE+xZ97O1OLRobYJQG0?=
 =?us-ascii?Q?dfhEUxSuGHY5LFDqm1zgpSW77nb8hE8cdgTdtqRZVoxPM1R5ttBJ6BA9yXt6?=
 =?us-ascii?Q?h5Pou6SHpyhvvcNBtMpgVks0rHYUlL1HgOGvly5GaF7C6uNgMP/b7f4KMXD4?=
 =?us-ascii?Q?JTaWB6Xw36hl9q3ZhwnvKVnGc4LbfTiBtZuWHoI4t6ku8xJpcCV0jdsLuc6X?=
 =?us-ascii?Q?A2bwOqHni4fHvev/tWGn7oC8NqIyE3LE7Zi8lrtsxuvpCUacy0PojDSY+bdR?=
 =?us-ascii?Q?RnXnvud0eeKYqi6lz6X3tfuDr5PWM8CF66U7mKEwj1wY4kWwK3q+Fvf9RGPJ?=
 =?us-ascii?Q?T0L2WSFTqo7vEOshIg332iLWgd//+nGsU51bZ4gsvPRsJToRbakKhR7PYlwJ?=
 =?us-ascii?Q?NnVvAI0XAypSspNhfGnqdTBSv5nOcapz3GJhX/AVv9Mjx8pBuUTnyhu1nNy/?=
 =?us-ascii?Q?6L5dkJ5izt08TE0XTu9pX1tseM1eaN2qTQOQAi23Qcy36Xcc2lzBqlIghJvr?=
 =?us-ascii?Q?Sw528xh6iMDGOvRzHPBDWMf4eCCM1CMmQw7QrZi70gegT3t7JS1PL+y7Rsfh?=
 =?us-ascii?Q?b8jukzAiTsNTqBEPP5e0UWzpt/vedPDqVVd3Umza3i2IALDCAfQkyoaFe7Pa?=
 =?us-ascii?Q?xUoUZFU+uhDZ1BCUg1u7Sj5VObL72UCPLh2HYH6Axx12gCZUi5hHeN+uMYM/?=
 =?us-ascii?Q?/FoVmCXZQkKQ2VeHsfUYiMTPjkNdlkcn7CQZNOAoA1hAHGZWnostTHefFceZ?=
 =?us-ascii?Q?rXFT1rBaMk7KHVm8Vf/IUfgeRDTlobnRQNMSLuILwlgm/qvjsBvcJt9YjLGX?=
 =?us-ascii?Q?/IjiHuNLhprR5JEO/3iIe0u+U3qi1SBDRv/c1+26zj8RFynWgmQkYc1WBCgG?=
 =?us-ascii?Q?WlJHOQM/QP0Qm+Pym+GgXxPJvUdUU+6DAriEK80D1iTQqSQInkuZkZXFVGOI?=
 =?us-ascii?Q?EsgfPF73nO47xdacoYetHDx6FW5IuEjKV7Dbr9x6VZ/N4cOFHFrIYhXvdhcS?=
 =?us-ascii?Q?LqifpoZ36pEt1FDS3AifRdu7WfDi25rkrRMFpMTYX2Mv+9xoOftpiWEY+KDx?=
 =?us-ascii?Q?7smHpJC7UIJu9S3fZVJLb/PP/DuG+cGUWWOiZOdvio2NOsQtucyUAD3SP6Co?=
 =?us-ascii?Q?AEGmWFr8IxqbVAqBQ87GAWpwliVolXzJD2QAgj2zFHZJ1r1mWCAjs1YsJKFA?=
 =?us-ascii?Q?rU9Wgu93GsjfNMJWTDbULhDGgNyC/XDFeDedaM8SLw3iarYweyzQ5DuvEP2C?=
 =?us-ascii?Q?AgJeAkAkjnqEFnw3S2P/iSnzHA6CZLpAOQnsBjOaZa/nAHJO9HAXS5GJCqKv?=
 =?us-ascii?Q?TNR+n9kWJ5xDe7CNpl3HIIoPevhGwYOxW2Fx94iuwalSlPUsuSHwzFP80R+p?=
 =?us-ascii?Q?wB8HWpJhQtgcNjDYGLJnmeU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SmIenTOqXkvonn7GvWVW7LvjquQX3YxhmDuUn6eN5Qm+lQb+tSt8a+l2X0zt?=
 =?us-ascii?Q?c9RoDRw5ec5896+YHEwZjWKTj+gKP4P3GT9dhos5DnKz1IBlSoA9t/X8LUYS?=
 =?us-ascii?Q?ilaVPIprEg2gdwz1DWLIonnV293FAa0/uRnoXvhuFjcn/+8uL2G0slcSZmth?=
 =?us-ascii?Q?BZeVvkzS51nXwyktp8OyQ20gF9WAF4xrJLo40owztHbmKdRouYxFJCWohL/L?=
 =?us-ascii?Q?N/JIK0MZb5whL7LYL6/tbjtg3i1vcq8lMmU94x/RjLSbT1QZyxxCXnT08TVM?=
 =?us-ascii?Q?rXl6q9uqapwReUmsJOEDocbzNbslzTL3fs//HZTlF27Jsolq1udsztbzwkQO?=
 =?us-ascii?Q?bb2NFq4qsf9guxp8Zvc3ObsNuRDPEaSJNpiIST5IkKprRaZW+pCs5nDDoieO?=
 =?us-ascii?Q?rE8+twVgMDBXoaZv0zrRwf2lrzIs04Jxy9OK7wstwnROUPW2/3S4zZpuB2ae?=
 =?us-ascii?Q?SusHvA8HjHTr/mIDERg3/WDvJKIzeD45f+QHa9UslvihGt3IEcOW9YG7Wm+Q?=
 =?us-ascii?Q?/PQsGPjIdxgpmbi40CcyXYahLO9QlQ+9fxcBiVjRtKc9X0eDXWdXZPfcBzu1?=
 =?us-ascii?Q?iOpklrAxrPNBpXVao8NU4LzWVSo7KStEo/XRJXTVS3QgjWIcCCQrASxe7zAV?=
 =?us-ascii?Q?GRLsBepfaGtBa2r2I8KKH8GQ2Tez+Co8j0bGwQXPJuPTv/WUhhBALAZB7Rzt?=
 =?us-ascii?Q?lIo15CsXEPg9NaP6qqK21qNqN0ih8MpGOEHLwn5tj/6xJrisG0sxq355zGWm?=
 =?us-ascii?Q?5gw5QHaYdu7PBmOMr2lc6LF958921ppL/Wqez8aPYoY9ohHqA8tRHkpM9QrN?=
 =?us-ascii?Q?fM7yeeAVgNqCprxp6wnaHWkI3n1ZqHqUZJTertA0lhbaqOoXIjvpH11glJK0?=
 =?us-ascii?Q?OQ0gPYQgMMqo+0kA7tpUtCXpwXjsXpfn4fyP5hx2qjrYt/lrk8cNs/0onc5p?=
 =?us-ascii?Q?ewgfOJkoBZW0TORi44Nw9yy4f+qXexyamq3xI/rpeAcOf8oQuJEXFcgsH5gb?=
 =?us-ascii?Q?xrbPNesd8wpQsXuGdyjCNqip+v0riMIBKijqfQCiQCyaJo/apK9saxXL1Jd7?=
 =?us-ascii?Q?lE5cGIvjxQXXZ0A2+Z0Ed4LN92m+gARrSmCgvtefiGAviWHy4TJveFBpQYUX?=
 =?us-ascii?Q?0sFj89fSG7uZKRPRVkwYmZAse4u8zP/rW2oUPIOibDMD71XYaw5IpLoSWqe7?=
 =?us-ascii?Q?TfMQKzg/VU/gkH7jZMsXv0pG2aQAWpSsllSDBDn6XyR9I3uYVd5eSNxe8Twe?=
 =?us-ascii?Q?p6/w/crV05vLzz4IYZEXDmj/8dGaxHsfpVYxe29IS1peVeiFivUwGBWrLymb?=
 =?us-ascii?Q?OPH6dJ2/kVtzcqN4dGeQugiIhR5OHlad5+FUX4UjPNaTzbXoX28TyeHcdTiJ?=
 =?us-ascii?Q?n3JSQh82tFNJZY85N5iFAPokVhFur6KsQcq2MKvRYBUZeBI9cPFkGpKTDKDG?=
 =?us-ascii?Q?7e3YWvpJuXrHPK3qmSFQPhvttxmC5YeDDMJges73a/4EorPnHq71P+uEhw7R?=
 =?us-ascii?Q?4yAnLKsvTZjLawxuso9+fd0msb65Yh1JbIwP4ZsPs1cb1csiJi9lq8ovCBW0?=
 =?us-ascii?Q?SX8NazPPdkrxqfbZQtJGe+DmWy3FdXUYMajFEBv2OmzUWQRpcZhnEkBM0FBu?=
 =?us-ascii?Q?xbm6wdtvUz//S2U4DPWs0omuEF2mR3PrOdn3+OrbkkO+rlhNeslXC5fQzBAT?=
 =?us-ascii?Q?+QYISEH3f/qsL9RAjIeKi59NL+efaQyY0fXXhm4qwI5U8bif6wKY/qsg/L9G?=
 =?us-ascii?Q?cHXH8aunnIWmeNJILQBuNdSvCc5pFSXN0z2kluZRAOlUiaZG359t?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb49aad9-5120-4773-a157-08de625281ca
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 11:59:24.0921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwHF7DyzEzzLaJZ0YjY9/c6KnN307sNQ2OffD/H0xJpZEKA2+1wRVDh5HNo/8a/yUoSYkqKJp0EYU9XVZKDVfeUZvkvZKMhAf0x+y5riUwxuMagy9e94E3B+Yj6vnt5O
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid]
X-Rspamd-Queue-Id: 9CC89CBFFC
X-Rspamd-Action: no action

Add support for the SMUX2_DSI0_CLK and SMUX2_DSI1_CLK clock muxes
present on the r9a09g047 SoC.

These muxes select between CDIV7_DSI{0,1}_CLK and CSDIV_2to16_PLLDSI{0,1}
using the CPG_SSEL3 register (SELCTL0 and SELCTL1 bits).

According to the hardware manual, when LVDS0 or LVDS1 outputs are used,
SELCTL0 or SELCTL1 must be set accordingly.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Moved clk_ids to match enum order.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 drivers/clk/renesas/r9a09g047-cpg.c | 8 ++++++++
 drivers/clk/renesas/rzv2h-cpg.h     | 3 +++
 2 files changed, 11 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index aa6528b72cef..1e10e6ff52f8 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -60,6 +60,8 @@ enum clk_ids {
 	CLK_PLLETH_DIV_125_FIX,
 	CLK_CSDIV_PLLETH_GBE0,
 	CLK_CSDIV_PLLETH_GBE1,
+	CLK_SMUX2_DSI0_CLK,
+	CLK_SMUX2_DSI1_CLK,
 	CLK_SMUX2_GBE0_TXCLK,
 	CLK_SMUX2_GBE0_RXCLK,
 	CLK_SMUX2_GBE1_TXCLK,
@@ -143,6 +145,8 @@ RZG3E_CPG_PLL_DSI1_LIMITS(rzg3e_cpg_pll_dsi1_limits);
 #define PLLDSI1		PLL_PACK_LIMITS(0x160, 1, 1, &rzg3e_cpg_pll_dsi1_limits)
 
 /* Mux clock tables */
+static const char * const smux2_dsi0_clk[] = { ".plldsi0_div7", ".plldsi0_csdiv" };
+static const char * const smux2_dsi1_clk[] = { ".plldsi1_div7", ".plldsi1_csdiv" };
 static const char * const smux2_gbe0_rxclk[] = { ".plleth_gbe0", "et0_rxclk" };
 static const char * const smux2_gbe0_txclk[] = { ".plleth_gbe0", "et0_txclk" };
 static const char * const smux2_gbe1_rxclk[] = { ".plleth_gbe1", "et1_rxclk" };
@@ -218,6 +222,10 @@ static const struct cpg_core_clk r9a09g047_core_clks[] __initconst = {
 		       CSDIV1_DIVCTL3, dtable_2_16_plldsi),
 	DEF_FIXED(".plldsi0_div7", CLK_PLLDSI0_DIV7, CLK_PLLDSI0, 1, 7),
 	DEF_FIXED(".plldsi1_div7", CLK_PLLDSI1_DIV7, CLK_PLLDSI1, 1, 7),
+	DEF_PLLDSI_SMUX(".smux2_dsi0_clk", CLK_SMUX2_DSI0_CLK,
+			SSEL3_SELCTL0, smux2_dsi0_clk),
+	DEF_PLLDSI_SMUX(".smux2_dsi1_clk", CLK_SMUX2_DSI1_CLK,
+			SSEL3_SELCTL1, smux2_dsi1_clk),
 
 	/* Core Clocks */
 	DEF_FIXED("sys_0_pclk", R9A09G047_SYS_0_PCLK, CLK_QEXTAL, 1, 1),
diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
index 33bc3c27291c..dec0f7b621d6 100644
--- a/drivers/clk/renesas/rzv2h-cpg.h
+++ b/drivers/clk/renesas/rzv2h-cpg.h
@@ -121,6 +121,7 @@ struct fixed_mod_conf {
 
 #define CPG_SSEL0		(0x300)
 #define CPG_SSEL1		(0x304)
+#define CPG_SSEL3		(0x30C)
 #define CPG_CDDIV0		(0x400)
 #define CPG_CDDIV1		(0x404)
 #define CPG_CDDIV2		(0x408)
@@ -156,6 +157,8 @@ struct fixed_mod_conf {
 #define SSEL1_SELCTL1	SMUX_PACK(CPG_SSEL1, 4, 1)
 #define SSEL1_SELCTL2	SMUX_PACK(CPG_SSEL1, 8, 1)
 #define SSEL1_SELCTL3	SMUX_PACK(CPG_SSEL1, 12, 1)
+#define SSEL3_SELCTL0	SMUX_PACK(CPG_SSEL3, 0, 1)
+#define SSEL3_SELCTL1	SMUX_PACK(CPG_SSEL3, 4, 1)
 
 #define BUS_MSTOP_IDX_MASK	GENMASK(31, 16)
 #define BUS_MSTOP_BITS_MASK	GENMASK(15, 0)
-- 
2.43.0

