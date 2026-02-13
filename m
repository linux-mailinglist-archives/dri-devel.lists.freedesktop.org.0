Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yDviI4tRj2kRQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0E1F1380CD
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E5E10E82F;
	Fri, 13 Feb 2026 16:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="RsjAI3Du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC6FD10E82F
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HkI7pYp6LBuOEzYNeZRLis/YzksBFh8WMCf44vxajy0GgeozJC88BW9FJADrbfjQ5hgdGriM/mg1oJItRCFW7C7RnoBbMJ0VXMl7Y7Fg22SUS24qEiHY1PaNQXocgCI+08Hlc72PpChZUsX8W1HU5oU0ufW2zbdLSN88f/06Tw7zvMppSQ5J2m3MtHa2x/tzcJeldoKx3QrdzCfRJeRxA4tMO38ZTBUN+qlXrj+jnjSFtNeg/C6wRRAFkciASgTc0qpZNGXRAvSQ3G6WkXKPhvZMNvAl+TrlxBW39Mz8eNIqTUfBMYYjA/HvS6lsv2MH/Gl9uFYsMbARqWxmOxUGvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DfQ+rIrSp6WuAZxZGypHtVxJDMg7XzdH9qHuJkbmjOY=;
 b=F9zyaOgLZ6cXDcdUZUWQ4XI2+8M1qUwvE0cE2cI0DuxjQMosYE9h8lvezfuWnggBg/1KMBff2sOAlbse9orLoLbFmj5J3GYXHPavC8KFK/Oh22wz4YeM7mgp/2T1cu/FxUcN1sCR7v+Uy0n8sTaXp03X4wXQZtmrtCIxwqpiKpxrXWJO05te6vLqd/0AqB2S23PmDEqe1KuK6Uo2uFBW1L9a0TCtCS3l7XYp/+PuzEiRpZu3Stug1tAG4YW9l9RF9WrQm2Z+weSpK79+S+wkDK4meY/9ZmjH4lgpZEvOg/g9H+do71OxYWWjVcNU35hlfZ1j2yj22qjSqb+bftFlAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DfQ+rIrSp6WuAZxZGypHtVxJDMg7XzdH9qHuJkbmjOY=;
 b=RsjAI3Dut/GoBmXNVBDv952EbOKPneAsfAmqCHPdFOxfTpj1kf2SPNRlLMnhWGZZtwXHZIhNvPG5uBY+y0q+5KsIDVzJjKg8Jn08rfnpAwXGUZCXuEQ8fTOnLUT0+f4xh3DnAvJU5lCILJVbLq867+HXjIuhut3dc/lfMI97sdk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:57 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:57 +0000
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
Subject: [PATCH v5 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Fri, 13 Feb 2026 17:27:38 +0100
Message-ID: <d1f47b9719edab4e85a8971020c7d7f51fff39e3.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: b6eebe2e-abcf-47ae-829b-08de6b1d2087
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+IUGi2YiTrKgQqGI7KJkN3W3g9t41aGkGXukDvJg8LJ+dK7cSPk7yphVhl+W?=
 =?us-ascii?Q?ciarFuvt1/Uia7vHzYKhBcF9SMiRnfUqDRk1kA14LYxfeuSCTQrS3CY6VLE5?=
 =?us-ascii?Q?PidcMWpB0QnS5HZv2KydhcMJO8MPCz2wMEweLpBQFf1qtii473B3OzVcD1av?=
 =?us-ascii?Q?zAJYO93YTn4dxs00WjJpKv7WemcwjhBNb1rRWKurMF1/RDt4194nmbqSdHHj?=
 =?us-ascii?Q?lCEVI5nxScDsgimXtr4gOy1kd5TCjObn7/Ly0LxqPOPJK31pF8d5SbWlyhfq?=
 =?us-ascii?Q?QSnRrv46O4HRVReXqWaWLz5JDB6YADZt+lUjecaKMQyg3OgKwMddnckHNZA6?=
 =?us-ascii?Q?dKIwglReJyS6tMQqS0u0iMsdNJs2+BhBrxXd/2ZJNPOBxgzIezz0QdEjn0f/?=
 =?us-ascii?Q?9yE8XJM0sr/VDd1eSl3gByy/BF9ZcZBu4wOCw+Q0v4k2M1xGIOV7QYz8RWWP?=
 =?us-ascii?Q?QCvx65bHlVoNuCyawwLS0mUGwK2k+b/aSxLPQuB0Uowc+f2nRk70kZ/X6GlJ?=
 =?us-ascii?Q?t20AhAp/ayOBum9/vBtuE1vANDvGltXLtu9WS77dIXaGPYHttIoJyN0XlqZ2?=
 =?us-ascii?Q?K06w4N9IJolLGmLxZtnVUEPTxF/ZMJ45B6kCrWojgDF+rnGR737CF1GFqL/i?=
 =?us-ascii?Q?nQY63R68nW5Ap2ovi5V/Spje5da4ul5qYYw5RK5S+euia6+EDVxVAeafehKo?=
 =?us-ascii?Q?cotKZMZOZeut81SO5xZv8smuOtStX+m407sc0uMDpTivlCPZ/aZ5yT/pHcYv?=
 =?us-ascii?Q?+E1pn0qVtdq2LxqogzDi42mF73kiSEJLtX2eBTCtvY2juL9MDiQ9JFS60+kc?=
 =?us-ascii?Q?crlove4VcxrDiqS7g+Xn1gOa/gMjXr5meCf6OwMgoNO9+cahRztTLlU+qyR4?=
 =?us-ascii?Q?R0nvNMeD5qGbTau6Oe/avQmJHs7/Y8G4B/EvWuhrtIl88YdUue7OQbSoEfoO?=
 =?us-ascii?Q?S1l5h7xdixSIImuiG+ocv2bOOG4TfZ5bGbU7dPebIS1MhJUC82fyq85DutVM?=
 =?us-ascii?Q?IsJgMX2DXPK33DGgUC2dd4MnRN17sP1Iixl271GUzgYh3IujttSBjDa0nzIl?=
 =?us-ascii?Q?VosU4rQ10dj0A7vhEUvC3pbTrYG/Z3O/sMIWn59nqamoqB8gNPgJGQ9k+cvs?=
 =?us-ascii?Q?EL40iGnawBGDG61gg14CQSe7dcHDMicNLYgYIy4+iG1o+zOMriEk5+wBMRp7?=
 =?us-ascii?Q?JfQtDGOmzIuFTHpJ67YTTDwYCFm88b1Tut7uSWfaMHJCvVV7osbhPNhti1nw?=
 =?us-ascii?Q?9Ob+bMD8IccMkEAjSgh1cJVoWHp/9tDnRa4LBu/x29b8lRlqYGgBMGq0cu3J?=
 =?us-ascii?Q?rWndooANh/xrKipk4fLpgZQB9353n5y/yOZ4SX7A4Fx+4WsGZnt3WYnY239e?=
 =?us-ascii?Q?yWTEQ0gxnodkH/Kc97s7PG16lZdJJAjcg1RfserdZHkJ0zsT930ynyFpcyix?=
 =?us-ascii?Q?snCuAw1h0CKbEIn9seyCdVQfz71dpkCpDtaCIUJoI6GRJePZbnLpcv+UO+Q+?=
 =?us-ascii?Q?9/SKsvdXSJ9xOZgusmmgLaWcpbC+vr7lPO/QPQAGuXeeQH40x1Ggm3LW7CDJ?=
 =?us-ascii?Q?YN0zpNN/aSSUjNwHOAYUTbx1SB/Aeyr2CrAvEweqwQdUXqjC9GoiuydqSDS/?=
 =?us-ascii?Q?A86bBIgVakYsZ8Uy4mDa4Os=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GUn7jVUzKtfTknQZ0eOo9O9qTi+rHomCeUP2M1Nl4xc/HJJUVdOKkNPYldsa?=
 =?us-ascii?Q?i02oBiyvPziahJNaEOlnr1CwSUQBJt95Z69p5SxJ5Y9v2zmQE6+yG2lzhp3H?=
 =?us-ascii?Q?nWWVcD6QBvbLUE3P1PGq/0eE1ngP8twZyqh4o1ci4Q3bAutT56Lw2Scqpd+p?=
 =?us-ascii?Q?PsYCsSdTy5kwjxbzASWij4dc27mAnT7WEn9VdELxLrKA8kFV5EL3n7IJBY4u?=
 =?us-ascii?Q?9/ky/TthUfAY8NGsKEFALxspjdrOm6hbC8Kh3VeeYxCdtgFy9PVlNpzEWxco?=
 =?us-ascii?Q?iqGGiuaoNBwrXSvuUVm1tBNpt4qnCgXrF8X4St+GikEDveqxvXcDSqE5P5y1?=
 =?us-ascii?Q?nn4lI+Nj5CoqLy3TQmUDdmJFRsdXcDbHdxYEAG9hAZrsy246suRTXMCzqbWC?=
 =?us-ascii?Q?soB0dWwM3PYoxFpM464weu8TCqrbhrYeh+c65FsXbH8yHI08Vf/z2WSUR6GF?=
 =?us-ascii?Q?4JauxB5yG7BlXtPJ8HSrqkYBewjAdMa2oJmy9buTuAQ+pDzgV3HkMfu+gyPj?=
 =?us-ascii?Q?ggxjztXUFh5CCPYn2JoU8Ous36rS9J48OhAIORzK+7LHiqtcz8g8RPt2HlLA?=
 =?us-ascii?Q?TLNB4P+NoP7MMtYPau4vV6R7Hj128DzElS9ESKjPBWhh9N9X4zF0KckizH4z?=
 =?us-ascii?Q?BP2XaBGxb2MbEpUiJovN0G1A7EZrMBpZi3EX3PHIElDCL2jc3nwcJ9vHOcRO?=
 =?us-ascii?Q?tg8j4PsjlzntLCk/mU2bcgcjk1WgmZBDh759qlTbS6UHoN6aG1+Mp0k2iHj4?=
 =?us-ascii?Q?fUaYfwZiS05sEulswRCewxnfqUKm2Uoko8oT5DPKJUA1SJZT7Y7i6SOn0rAR?=
 =?us-ascii?Q?JiGZULQOf8/oEcuGIuGesJnh9aUs6hgP+7Sj1DLRo1Dlf/0EIm8L7tU2H7Y3?=
 =?us-ascii?Q?eEbYi4qG2UzqONCAQbaxLfPGjZBg2fKhaP7mgTqlQsH49hHxiTe/TKjfWpPi?=
 =?us-ascii?Q?ct+gN+I+dqcOfNuRgQZXqUBr6oEvovrEMGYzrDVfMplABbxoCBB+YLci+piB?=
 =?us-ascii?Q?wo6rBYvKiYMR7x/9mOZUK9f00Y+8qfDkpgO/6EuiFfnMb1PPbgljWh0fb1dQ?=
 =?us-ascii?Q?FRdGKU2cpDdRW5kx4EW4PUuvVqeXZ3dWVFBNGAaAqVaxj5FFje7b1hmGKdVk?=
 =?us-ascii?Q?BmDoaqqtDlVxmCHReNbHLWY/g+7ynDhJ8871ONaUqrHz7SNTIt3pAS1qa44F?=
 =?us-ascii?Q?ryXxhigo8iptH5rt0dRiDXRa+7Yj/3r1GO3KE6KZsXshSiJBy+fx6QVYBH4t?=
 =?us-ascii?Q?FawtjR4zt7DGw6CvXdTR0jufaUjdIXaJ9NAFRd6VZuvXfZSE7zM8bs5K2hig?=
 =?us-ascii?Q?4ErmzWnnqKcR7Ju716eCGM9jsNeqCZlAnOe84DnWycAuTzinVny7bXfN7UrG?=
 =?us-ascii?Q?vDdnTrTU2MLzDCaw6RJQY5hDGyycTrlYwqYkuXv/bEOcoX6KSSVmpbpelNxO?=
 =?us-ascii?Q?NWtov6GgZfpLVr1Gx+nLcHEa+jlIQDHVBn+Yd+2Nvs1e5RxoFmrr7ZdC30AO?=
 =?us-ascii?Q?pdjq7xOV0bL5+ClB9fMUS9geP1WYT3/dmUFc6UBke+yTF0JR09ApZtnbM6Cp?=
 =?us-ascii?Q?iNv419WF+TZpqKDnxF+GpmYoUBIzJPZchz63ulRa2BCQXC0po2G/9HZVLmTa?=
 =?us-ascii?Q?B3zKWUBBd0HbaiHkpXPKF7TR1c9yfEAzF1Xr/srceZvdscrg3wawcAmmQv2R?=
 =?us-ascii?Q?NSi062thuH9RYKHPhtZknACovK9s5HDMRgsxlLBiEZBea/AJB9ntkEBcko0/?=
 =?us-ascii?Q?n8xGSOe9C5f5Ow/BsljTe1QtDg5/yEZPjFtpQKMK0OT3WPeyu4zE?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6eebe2e-abcf-47ae-829b-08de6b1d2087
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:57.7827 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ctUbwT4e3k+Au7cKoG52cj1kjb9TgtCkpREd6kRbc/6BKBE48fCzgFuqgpFZ4YSmjSkVY6ETbW/x4tHyFzrpRIVLNc3+KVLduq5HNtK+R1Na36IP3D5aStAO1lKQj2qU
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,bp.renesas.com:dkim,renesas.com:email]
X-Rspamd-Queue-Id: E0E1F1380CD
X-Rspamd-Action: no action

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - No changes.

 .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 63 +++++++++++++++++--
 .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  3 +
 2 files changed, 60 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 8ea8594afee8..35de1a964dc0 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -37,7 +37,9 @@ MODULE_IMPORT_NS("RZV2H_CPG");
 
 #define RZG2L_DCS_BUF_SIZE	128 /* Maximum DCS buffer size in external memory. */
 
+#define RZ_MIPI_DSI_MAX_INPUT	2
 #define RZ_MIPI_DSI_FEATURE_16BPP	BIT(0)
+#define RZ_MIPI_DSI_FEATURE_GPO0R	BIT(1)
 
 struct rzg2l_mipi_dsi;
 
@@ -81,13 +83,14 @@ struct rzg2l_mipi_dsi {
 	struct drm_bridge bridge;
 	struct drm_bridge *next_bridge;
 
-	struct clk *vclk;
+	struct clk *vclk[RZ_MIPI_DSI_MAX_INPUT];
 	struct clk *lpclk;
 
 	enum mipi_dsi_pixel_format format;
 	unsigned int num_data_lanes;
 	unsigned int lanes;
 	unsigned long mode_flags;
+	u8 vclk_idx;
 
 	struct rzv2h_dsi_mode_calc mode_calc;
 
@@ -552,8 +555,8 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned long mode_f
 	unsigned long vclk_rate;
 	unsigned int bpp;
 
-	clk_set_rate(dsi->vclk, mode_freq * KILO);
-	vclk_rate = clk_get_rate(dsi->vclk);
+	clk_set_rate(dsi->vclk[dsi->vclk_idx], mode_freq * KILO);
+	vclk_rate = clk_get_rate(dsi->vclk[dsi->vclk_idx]);
 	if (vclk_rate != mode_freq * KILO)
 		dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
 			mode_freq * KILO, vclk_rate);
@@ -764,6 +767,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 	if (ret < 0)
 		goto err_phy;
 
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R)
+		rzg2l_mipi_dsi_link_write(dsi, GPO0R, dsi->vclk_idx);
+
+	dev_dbg(dsi->dev, "selected du%d input channel\n", dsi->vclk_idx);
+
 	/* Enable Data lanes and Clock lanes */
 	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
 	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
@@ -1006,6 +1014,37 @@ static int rzg2l_mipi_dsi_stop_video(struct rzg2l_mipi_dsi *dsi)
 	return ret;
 }
 
+static int rzg2l_mipi_dsi_get_input_port(struct rzg2l_mipi_dsi *dsi)
+{
+	struct device_node *np = dsi->dev->of_node;
+	struct device_node *remote_ep, *ep_node;
+	struct of_endpoint ep;
+	bool ep_enabled;
+	int in_port;
+
+	/* DSI can have only one port enabled */
+	for_each_endpoint_of_node(np, ep_node) {
+		of_graph_parse_endpoint(ep_node, &ep);
+		if (ep.port >= RZ_MIPI_DSI_MAX_INPUT)
+			break;
+
+		remote_ep = of_graph_get_remote_endpoint(ep_node);
+		ep_enabled = of_device_is_available(remote_ep);
+		of_node_put(remote_ep);
+
+		if (ep_enabled) {
+			in_port = ep.port;
+			break;
+		}
+	}
+
+	if (!ep_enabled)
+		return -EINVAL;
+
+	dev_dbg(dsi->dev, "input port@%d\n", in_port);
+	return in_port;
+}
+
 /* -----------------------------------------------------------------------------
  * Bridge
  */
@@ -1408,9 +1447,21 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-	dsi->vclk = devm_clk_get(dsi->dev, "vclk");
-	if (IS_ERR(dsi->vclk))
-		return PTR_ERR(dsi->vclk);
+	dsi->vclk[0] = devm_clk_get(dsi->dev, "vclk");
+		if (IS_ERR(dsi->vclk[0]))
+			return PTR_ERR(dsi->vclk[0]);
+
+	if (dsi->info->features & RZ_MIPI_DSI_FEATURE_GPO0R) {
+		dsi->vclk[1] = devm_clk_get(dsi->dev, "vclk2");
+		if (IS_ERR(dsi->vclk[1]))
+			return PTR_ERR(dsi->vclk[1]);
+
+		ret = rzg2l_mipi_dsi_get_input_port(dsi);
+		if (ret < 0)
+			return dev_err_probe(dsi->dev, -EINVAL,
+					     "No available input port\n");
+		dsi->vclk_idx = ret;
+	}
 
 	dsi->lpclk = devm_clk_get(dsi->dev, "lpclk");
 	if (IS_ERR(dsi->lpclk))
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
index 2bef20566648..cee2e0bc5dc5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
@@ -83,6 +83,9 @@
 #define LINKSR_SQCHRUN1			BIT(4)
 #define LINKSR_SQCHRUN0			BIT(0)
 
+/* RZ/G3E General Purpose Output 0 Register */
+#define GPO0R				0xc0
+
 /* Tx Set Register */
 #define TXSETR				0x100
 #define TXSETR_NUMLANECAP		(0x3 << 16)
-- 
2.43.0

