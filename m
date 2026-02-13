Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aG3pE8tRj2kJQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:31:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97224138138
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959D510E833;
	Fri, 13 Feb 2026 16:31:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="phBbDrYO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4EC010E838
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:31:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zOs56gech8lIYgx/k3hUJ6utEHPP0SyTxZJnMIgy5hGWZzIbrvQJhkZDFFfoF2u8j/AkN8oZ30D7fUJT9fEjqUVGONpUjvrWAg+OaMPcrlYtXXYPmcaKJaC0OoA41uTvkrIUlfkSLSkp3md7vgDgV2JPmYldBnQahh2KImw7O1uq5dlSKhM5FD8UJ+5iQKSGMvNFi9BQ7E2x0HAWxC2zqv2pcvIjiygCgpW81e8r7dfmiEIw790Dh33M55xDTAwCRHa21GGzUZ+yPYLf5K3Z/WGvMZKi/YEmrDABZeO110hJ8QLLtMKtswUQPNu0SumP5djJoV3lIvleH6As082nbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSsaIPtXGJvxl0xe82immKOu9iKBS0/3igDOALCTixI=;
 b=dJZ9yEMS7OiNuh6Gyq6M8b9xTzmmMZr2qtoiLYMA7aBKQo9sD/hM6MheaZbNVhNvrSP1rajQxfsHlLJfvp0w8JaHcQ28VCyXirpIy9MwEOYA/9XX7miMLUUOGdGXyL2YpBd2lzPLLEL/QKTX2XO9aG3436/7FV+Zyfj+IYdst22p2K+CNFG4iL43uaYWPZEFcyVumKaJYjgyS5LgEYuaJniO0BODTWq0HiFJjvcTg4+5B5uGnfjpE0YcAm8G+MEsZ+5i7DPvIPD7v9bLrzYzLlZGGC+8RqX8z2I/7BtKw9+XrmtqcFH2FKVOO5tpBQKqj4WX68zMKYVv9+A0Oapupw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSsaIPtXGJvxl0xe82immKOu9iKBS0/3igDOALCTixI=;
 b=phBbDrYOefMHzncKgm3glZ2oN0yTCe4BCxZB1HkshERqJBZcoxO/efdH2d2qPn12GpvNDpmp7IcazYPVUMId1RMm5DtpKC96XUI2toftNKTiQwZPZ5ymED9Oc27zHoo6wsV1+TFL66Ie3zDx+hQyMalEg8P86L0hhKP8eJBonMo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TY3PR01MB12106.jpnprd01.prod.outlook.com (2603:1096:400:3d8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 13 Feb
 2026 16:31:00 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:31:00 +0000
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
Subject: [PATCH v5 20/20] arm64: dts: renesas: r9a09g047e57-smarc: Enable DU0
 and DSI support
Date: Fri, 13 Feb 2026 17:27:46 +0100
Message-ID: <09d3d3020e9b8ba77af772ae19d1f2cac065d673.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: a59c5397-e266-4d22-c55f-08de6b1d45c5
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/VAhFn5wm8pAqLIDNKNaQYiXII5mIROW2anTjycHo8ocf6fLCB98KD1+/UYw?=
 =?us-ascii?Q?kFaYkQbNNDULFetBXOmQjzhxD5GvSmmmVjGBXrHlPwYfnEBWgA2gMY0E8Ojl?=
 =?us-ascii?Q?SFrNbw5zZ8rFIv4TQ99nfRZJZNGewC2QfiY/bk7CLGAh+k3iSnZGKreuhDzA?=
 =?us-ascii?Q?J4IO8TJl9aop0ehUri2fwe28jQQMQLraJoq1O7hSkSmft1RoMJq3CuXMILxB?=
 =?us-ascii?Q?+DD/tPjGvTOgLthEjuzKlV5SWeolDm1PWh4jemuIBUvRMHlvmhlcI/jxC0//?=
 =?us-ascii?Q?dFjBeONCraA7aZfuAFN+mpQIOYLkscu/FlNjcgBkw2lRTkTV3dc88JfBkRlX?=
 =?us-ascii?Q?zZEMyMHnwgfBwFQtkOryZHhXAzJMuzq3J44UofRtCLosJZCJBTwKNHbqzXZl?=
 =?us-ascii?Q?36K+ufLj2zQNrVtolBsZ/C2F2+0UDx3xQwJnNLDaMN3sUXmqsdqXX+fza3Qx?=
 =?us-ascii?Q?3zk9HJzu/U0gYAvAoCKEFnsWgnGT3n7icCkCp4TDIYn4sfAka+pEuWCyCrp4?=
 =?us-ascii?Q?WPKSQxPVtrryn0hX0e7FC3m6f28LSjPSKkooEQRPOysv4DlfPybxX9Ywg6B6?=
 =?us-ascii?Q?0yiW7RySuFRdUsmvxM4JU8aybGm+JuJinpcpfN3EpNwPVsofezsp0ah67R8s?=
 =?us-ascii?Q?sgUlnOkPwGg0tE6Nbb+2a85uUG4x5kMKOiF/IFKdhjEfzQ28vS39hXIZZJjJ?=
 =?us-ascii?Q?DlCQLAM14vZKNU3LfLdXrX4Lwo6Wve9KuprS/P7HL9RGWEcmhHusfVUgx6hp?=
 =?us-ascii?Q?TDgBh/2syAOvS0Difb5YeYi1zcvn9Lr4vyxmM8/65HQHkkMuUOc6W39Vm0rB?=
 =?us-ascii?Q?UqFR9h9VCZ8+0kaAKeHrmdP2CGqE5Cc9Aun/QP5ur5cg0dVQMSb8O8ReEPFG?=
 =?us-ascii?Q?wdw7r2dbAEcLKz/9bEjgiakz/VGdfDfyNnjncDXUaOYkV1e4UvfQEK47iK4b?=
 =?us-ascii?Q?5cFBEcApFhgXKGDwoCTXwjQDJBU0XVDYgcxe5HO066VbrR7nlzv+S4YPr9TW?=
 =?us-ascii?Q?OsMboqycQDavDVFHeI0L0tQtpVX2N1B38k4MEXoYxcjg/4bkrV+MUTPrx0yp?=
 =?us-ascii?Q?XJV9rRJ5o6U8oFn8j2zSSTspC8nSszN73pBO1ZXy7co6bbo/l5JD2ahTlD1M?=
 =?us-ascii?Q?CBafaziHpexEAw+LfB6KE5oZ1z5TZ2PpNjyLvonX0EhZiZtLU12HPNTyidw1?=
 =?us-ascii?Q?sER/TSYkiUE1DBlOsCjEGg5Y5rCEWegwfLPkhcDkzgL+sGeOxJVJ2BgCh8wT?=
 =?us-ascii?Q?+EbHhpCu6U2fBlmmTbmVi+ydInGcmu1NAqqddT7RFU+BCiNwDOt3lOdYrDHG?=
 =?us-ascii?Q?zsH2MDvpfFqLsLCijuu2p/D7iO1icf/O4JBDVh4lX+fTCg+mB94HonubBrMJ?=
 =?us-ascii?Q?prVvJEfTS4lhtfOuep5YgqPjhnfHXGjjWo2C1T2S/VJqfzwTfKt9/5Y2WhT3?=
 =?us-ascii?Q?26M7gl7RMbZblp6ln0PG5a4KhYLekW/gMVfqyqPRZ6+ItkdPF7HU0AV77Sld?=
 =?us-ascii?Q?Iiojj3wyzUpyMvvoD7GILg7G+j6WWw3QPBmhdStY3C21lZCvokfvqa5AhgJk?=
 =?us-ascii?Q?PjTFLJgZpOhbqmiq+0uKY3qN9E1do9Oi+RyjHOD2OGXrLc7jDUZ3f9nUiDAi?=
 =?us-ascii?Q?C+bB9Pg9pgkKIdLNysvQAVg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OU6t4yqHumRcJDjGC5gSEcSXCJtVGRpAjznK2NVJJ+f2G4o8xI+fkZu9Bwql?=
 =?us-ascii?Q?bY+yqOhd/CG7ARzJsRsDUr9vY6MnKjb+/n4Kz5jj92k5LKAuUd3C4coYUECP?=
 =?us-ascii?Q?taHaOyCAxidVepgrTKBlTNC6HStsnL9m8FfvAE4ye2v5+vJ4LasTRCqb/iB9?=
 =?us-ascii?Q?xINeyQ9MqvY6pA3BJNrAw6vDG/c6hbnJ8nZJ0XyB/IygECekPUTWYgClaUQU?=
 =?us-ascii?Q?aphBIjkc8UEiPeDwAKLA5JzIx2Suo/VGR05AIaD7U8nFxo+iJPms0v2bIxQf?=
 =?us-ascii?Q?C0DIpKe1zeKMhinJjkAPp2JURadvJNxpdKrQASNOAIZGibuVTVc7tQ0M14Oe?=
 =?us-ascii?Q?czoEPzNFQUuQNKrLJ9NdY3Rl5mPvn9TFXRsAP4gbzOm916qHaMnYQmQu1zEO?=
 =?us-ascii?Q?ioUxTijA2XXKWBLaV8tEkIUIAFXjA7PMVYahZNZkcx9f44YfDN4Zp6gXvS/c?=
 =?us-ascii?Q?+FN9Yc2nQo9NsbEmz4Lyq9vxyINthLwSsS8lrOGWtjDoQcngRghY2Gqek4oV?=
 =?us-ascii?Q?O0zqo4b3jtAk0qEnrFApFbzqXtN2+/m0snuF51vbKTFD2SsfOnnjvpepbxDW?=
 =?us-ascii?Q?O9bdP8CG6XqiIrklYaTtgCXSxIrQ/44hV24Q9xpJLeZNLhN8G67uh9sd3SX3?=
 =?us-ascii?Q?3m8Ht5DC3YSIwoJ3BuoD4oL70DvrQg5BIJncTGAR8pyhWQpyzTXj3GxX39m1?=
 =?us-ascii?Q?lBwgfR0lPAuz0Zc1uBHN2TEKwXcXvQoDVrZdGanbfc+YzKZHMgSnsaOz8A9H?=
 =?us-ascii?Q?og8pJwR3D+ecy/IjDdHuM05k+wqEsH/3f5iwTJjhhG71bVsuFHACmnL8Ldht?=
 =?us-ascii?Q?HQjxriAo2E1cMTUuM8dD9541wIQlY801QAlq0GoqkiUYylTzAzN7ucLGAA/n?=
 =?us-ascii?Q?ss6dH0ywif+Y7zyOO62vAH/Z9TkKYPmKJ2f8rU1DJn6k6DWA/lh074iymsCJ?=
 =?us-ascii?Q?MJ4LsRpiqeBP052w0t/3yDDvqoRbPBqYpl0sl2OhdHmfazN0ps4Wa1X/4Nwl?=
 =?us-ascii?Q?9ZhfWFDk0YAeqkf729JY90d7nd3TtRkOhyOmAWnc+O2ac+bfVRxoU9WZTf/6?=
 =?us-ascii?Q?Hril3rhzIkWLkakS9H9I4K0TCD5/FSFAYfN5u5+1pRUQOGLE7gVMMA/WOkRF?=
 =?us-ascii?Q?beEBVAhKoHjssn+Zfokuk6nJoAFPemXPEtMXjo9qtcow2+h0g1b+ekxT8bfl?=
 =?us-ascii?Q?GFO+806+5LL0T0qgeS1CinYBXvuw+Lw/ef7jSoys6cQ67L21itAEki8Oic3I?=
 =?us-ascii?Q?I/3nu3EAvzRJHAYPFpzSWxFQzC6T/Qm4pzwMjEtWzt4K3gFmcfp3ifxJfEBK?=
 =?us-ascii?Q?pmNZIEIRn0oRZwew8WmlHGkz8cxanf4PyNsmOCg6mkUzufBMN5vpcdrhk2AP?=
 =?us-ascii?Q?ePwq6GeJjy877OLO4tTp4Zc4Jt6ao4f9rk1pUD7bBiMYF31SICQrXzv0G4bJ?=
 =?us-ascii?Q?FJFkngI8au9/J60+rM8ZnSSb6Oi0n7PtWj6oA13NShqXiPO0UXTIyZpMVj3t?=
 =?us-ascii?Q?do3xxjmxqA9YhNm9fggxB0h8n6hrHDEi/aUlwhW509k64g57ScTv9XBksqG8?=
 =?us-ascii?Q?QrBrXNEGRRWhVBD6vYRsaUemxf34dFoVEWvAJgtR1gQBoKGfGtazr8xe1xPF?=
 =?us-ascii?Q?+VvLb34myouhIAm0Y3HM57uFRqWAPGx1UqOrwpAA/tJNZzs42WQz69+HzuxG?=
 =?us-ascii?Q?0kQ6Ag5iGgrD5crsX+YsojDaQWxY4h+K5sZKqzSIe6r7G5ZJHjLNfU31Ph36?=
 =?us-ascii?Q?Y7DhvJj5sysjdho1w8pFQDPiR5o8jfYrkc8ULZ6xeWB2arhR4lnR?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a59c5397-e266-4d22-c55f-08de6b1d45c5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:31:00.5388 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cBDQbTuizvkS1YS/zPaebN2jmQRUq6VOifEmnJD2RdjYU6s6ttHWhvCiekjVr3nxAMAmEhLm932ErjuOCQ/uE1rs4XLeMLhe0mOHoay7b3XEz4I2xq5ZFnMDck/XhVRM
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
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
	DBL_PROHIBIT(0.00)[0.0.0.1:email];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,0.0.0.2:email,3d:email,0.0.0.12:email]
X-Rspamd-Queue-Id: 97224138138
X-Rspamd-Action: no action

Enable DU0, DSI and ADV7535 on RZ/G3E SMARC EVK.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Use DU0 -> DSI instead of DU1 -> DSI and update commit body and commit
   message accordingly.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

v1->v2:
 - Fixed: dsi, du and adv7535 are part of the the R9A09G047E57
   SMARC SoM board then add entries in the rzg3e-smarc-som.dtsi instead
   of using the r9a09g047e57-smarc-du1-adv7535.dtsi.

 .../boot/dts/renesas/rzg3e-smarc-som.dtsi     | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 3b571c096752..a8f73235988a 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -33,6 +33,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		i2c2 = &i2c2;
+		i2c7 = &i2c7;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -71,12 +72,47 @@ reg_vdd0p8v_others: regulator-vdd0p8v-others {
 		regulator-always-on;
 	};
 
+	reg_1p8v_adv: regulator-1p8v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v_adv: regulator-3p3v-adv {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	osc1: cec-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <12000000>;
+	};
+
 	/* 32.768kHz crystal */
 	x3: x3-clock {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <32768>;
 	};
+
+	dsi-to-hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			dsi_to_hdmi_out: endpoint {
+				remote-endpoint = <&adv7535_out>;
+			};
+		};
+	};
 };
 
 &audio_extal_clk {
@@ -101,6 +137,37 @@ &eth1 {
 	status = "okay";
 };
 
+&dsi {
+	status = "okay";
+
+	ports {
+		port@0 {
+			dsi_in0: endpoint {
+				remote-endpoint = <&du0_out_dsi>;
+			};
+		};
+
+		port@2 {
+			dsi_out: endpoint {
+				remote-endpoint = <&adv7535_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du0 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			du0_out_dsi: endpoint {
+				remote-endpoint = <&dsi_in0>;
+			};
+		};
+	};
+};
+
 &gpu {
 	status = "okay";
 	mali-supply = <&reg_vdd0p8v_others>;
@@ -126,6 +193,48 @@ raa215300: pmic@12 {
 	};
 };
 
+&i2c7 {
+	pinctrl-0 = <&i2c7_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+	clock-frequency = <400000>;
+
+	adv7535: hdmi@3d {
+		compatible = "adi,adv7535";
+		reg = <0x3d>, <0x4d>, <0x2d>, <0x5d>;
+		reg-names = "main", "edid", "cec", "packet";
+		clocks = <&osc1>;
+		clock-names = "cec";
+		avdd-supply = <&reg_1p8v_adv>;
+		dvdd-supply = <&reg_1p8v_adv>;
+		pvdd-supply = <&reg_1p8v_adv>;
+		a2vdd-supply = <&reg_1p8v_adv>;
+		v3p3-supply = <&reg_3p3v_adv>;
+		v1p2-supply = <&reg_1p8v_adv>;
+		adi,dsi-lanes = <4>;
+		interrupts-extended = <&pinctrl RZG3E_GPIO(L, 4) IRQ_TYPE_EDGE_FALLING>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				adv7535_in: endpoint {
+					remote-endpoint = <&dsi_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				adv7535_out: endpoint {
+					remote-endpoint = <&dsi_to_hdmi_out>;
+				};
+			};
+		};
+	};
+};
+
 &i3c {
 	pinctrl-0 = <&i3c_pins>;
 	pinctrl-names = "default";
@@ -231,6 +340,11 @@ i2c2_pins: i2c {
 			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
 	};
 
+	i2c7_pins: i2c7 {
+		pinmux = <RZG3E_PORT_PINMUX(A, 4, 4)>, /* SCL7 */
+			 <RZG3E_PORT_PINMUX(A, 5, 4)>; /* SDA7 */
+	};
+
 	i3c_pins: i3c {
 		pinmux = <RZG3E_PORT_PINMUX(2, 0, 2)>, /* I3C0_SCL */
 			 <RZG3E_PORT_PINMUX(2, 1, 2)>; /* I3C0_SDA */
-- 
2.43.0

