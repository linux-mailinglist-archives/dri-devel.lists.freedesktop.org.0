Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLeAFatRj2kMQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F941380FC
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94B110E830;
	Fri, 13 Feb 2026 16:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Vore9W/W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010041.outbound.protection.outlook.com [52.101.229.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B87810E830
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:30:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODdy9fuVefzN1WHDJsC3Q1qxQ7at4X5RTqDefXP0+IFUzTMh22f5boRfQOAgKmCboFbbtXBWyKbpWYXEQlJ2ezK0d/yxYv5Iy+MHtyiI/ieR6YKF86xDy5vLUKiYfZdWVBoDQCrRcdLROJuzonjEcCRp//9YMdOKB+LgU13xaHOuGGeDphB7DPu7PBzcDMH7etp8YsKVia8tmf7zzwRbScvVCJf7Txl7oBac7sJ9X2Pr+7RpGbtuK8Z6zaifQZXeeBO6g+5iKWbZk+BBGBgkykdc35xX4KCI//K3g0eG11X5JeyzV5oeoFbbhY8i7y2ezFU1uwFYJ1iMif+/63VS+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ75ALFziKs9t1CxA/qgL260BnD/+T6Q/zLcAwEVnkM=;
 b=UMsTVM37F3OpjnIfRHQwU9VK5AP/p4bPA/f2eiE+hIcVwH/b0Dh9N2lW+yhcLeVCFaCstj4FIdpsKkmuR/DlUgvu/TN++z3ucAdjL7HzvFJkAD1a40gUdIQzHWVWeAI6jKAHKm8FHM4MC++wwLkrXjrOr2HtRmff08ij3DMLOxQ7u5HJLa7J631Rru7wfnSTZVeZ+9lJRxZzyBw/Hy3qG43oSOofPzbPYZvLMf6M4QB8ersTLYROUCDuwo/L82uWUa4+fL9sbKa+37GOgcbU3aJmEhjIOAXmMjzOWOfSMIKnskRLXBLp2FXD309BnCz1MCFd6B+5w5LXfxxcrApR7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ75ALFziKs9t1CxA/qgL260BnD/+T6Q/zLcAwEVnkM=;
 b=Vore9W/W/Kxy5I+jrCweuHxdvghBIvqlhmSUX59AX6apHPcP1gu4GQwX/D0njewzVmoGLg9wqa7Lr02Tzkb/xndcNOmU8IYvCKwWhhnFTLJ8bJJI9GpUYk2sjmcLUdMIXJi+CAlKKhRLZgWOxVECTqFBkI+5F41odS18HItIdEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:30:29 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:30:29 +0000
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
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 16/20] media: dt-bindings: media: renesas,
 fcp: Document RZ/G3E SoC
Date: Fri, 13 Feb 2026 17:27:42 +0100
Message-ID: <7e22a9f4fef307ba16f8683ee676f9e4d11d3f64.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6cf6427f-ee83-4414-a8a0-08de6b1d3359
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4Xu+OmxcpOTVVpYA3YdpxjLPBLD8GDZhj8eTZ93I2g72bd/F+OtThxML1/SF?=
 =?us-ascii?Q?WCDHOWB+rHwSfoOGRyyqUqd2FGRFP3jE74nM1uVLh1RGYP+Hl2BhhfNl++JB?=
 =?us-ascii?Q?65OUtzOEs/sVj5fmYDMYLWQkRi9jPRO3vBPMp1zQ/Fnx9ZlFvdY+jzOt+zbN?=
 =?us-ascii?Q?wc6HZgMSR6Tab0U24OmcZ+DDcCO9C/sMicbe8fYgqRo5Kw2zbP9GZzff3Hfp?=
 =?us-ascii?Q?6DJF78JSxgg4CX64O1ixreVqLZgJIxCXqJX1/394bZ+L+xWRnFwb4JUHBH4n?=
 =?us-ascii?Q?wgITyslCJVbxmgWdlhdvf/OpTHi/BGVGFQk9GyjwZDTPjZefdGhSqo+wef8c?=
 =?us-ascii?Q?t0vGON9bqsSePmmwlv8X3YT46KTVFbCa0uXU+m/2QS7Rh0dRyV6pp8IRiRDF?=
 =?us-ascii?Q?i/r5/4P7i5+qwmkuWGePnqHaeIGuudkyr2APZgL7scYxZUEkpYfXhE1BWu71?=
 =?us-ascii?Q?b5n2ThvaRvbS3GuOhuV4tzLReEfNGoElp/AGqW+kElWnMsrzQuI9QJPt+4e2?=
 =?us-ascii?Q?OIPlQJVrHhuNKbJGpHfMLHE8FvMhznF92vND1NUi7xRP4hqmFnw/1AOhiUOT?=
 =?us-ascii?Q?ZNw5V5p9XZhHp8lvdFbXW5bR0vHB2bqBYgaz5+znaukasw2rSfXHk0aT0Gtl?=
 =?us-ascii?Q?JvXs+JPo8vrbDxQZ03HN/lvLmT99g52KQYfphm67p/g85xaqVUK/xkM7AUud?=
 =?us-ascii?Q?/gcekdF5LOajSXuUhfTnX8B5wVSScrX0m8CIapDr7rrZGcNw7ZdA95EZg0ns?=
 =?us-ascii?Q?nVCUy9mdHP3B47mXnHYJ28z1aHqYdYX/0wMP1WnLqU4+a0hjZIvloYEItGfM?=
 =?us-ascii?Q?T+Uzk5N0TmZosK/MFVmPD4fCsCi2naG+z01sEA8BzqARBMPPCVu/Qrde6gGD?=
 =?us-ascii?Q?7spxQIBITNWf262df7M9epUikjmSHs5oI+DxULtqCw6ExPlr7YvJ0M2GOpaY?=
 =?us-ascii?Q?7yBdgI1N6MjKePKrOgJFxqwwG3nHRuBSo3ASHxH5YfJ4gdOZ1vN8zMPaCVO2?=
 =?us-ascii?Q?ahcww8AH8laMGcS413w99gagGkfwdCJu0Wxtd6lYPjegRLOkc/Nf+1iOGbAD?=
 =?us-ascii?Q?/J5tL9Y21LXscUFw0Ob2Tx7Gd9URZ/fusTY7ujBWVGDHbkkPaddpY4/oheNi?=
 =?us-ascii?Q?pBjiucHasa2BGsFaN1L+ig8s/tMH1/LLJ+bWaXoXmwz9TUPhHEznGcjMQ/7z?=
 =?us-ascii?Q?mIC4NTiEm+I0rlcMiRRS533MxrKNbEuOfFl829/MJK+XG1cmtpFbONewAsyB?=
 =?us-ascii?Q?f7Q1+sR9wtgkzkdQjYTq2ITVXC18hi6DUkahlCQTmDGD/71PXO0GYVpkzmDw?=
 =?us-ascii?Q?gVr1kPLb8w2k0rkpttveZnqYA1svoVsyRe+MavjBJD3e+E7zc5wJ39q1oIXP?=
 =?us-ascii?Q?ZlgnVtsUfgfXeY8v+/1PegfCXLYRg1g3gIpn355dpkZCbOgLtPjG3jpBdTfx?=
 =?us-ascii?Q?yqRGZ6Bz6uPOtGFIiGcRqMHYRpQjRgOSmTiUx6TrgzysREqXahVZpV1vdsIj?=
 =?us-ascii?Q?ukKmuQDliS1sZHBKSf+BEfKFwe9h2ds8Sp41trXWoyerk5ehm6h6uwGKNeFR?=
 =?us-ascii?Q?O9uY881HTVJuTA/MIYuEAcZTOg+9KbU9J0G84sYXu65UghJt0Uq6bg1CT6iD?=
 =?us-ascii?Q?AVGk0Ai/ea+IUcbAkSr98iU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Ttp3Dwl7wZXiynoIHfuw+QsH+svXFscjr62T/0DRVMFnlojYPh6FgNoBk77?=
 =?us-ascii?Q?zIuzgKDSXiPwJs7DdtH0eiMGqdHGtB1lgsIl6fqukpmPNbjHj2dqzH0EKWhh?=
 =?us-ascii?Q?tw3LwSME6qIHrA/NeBKQGgfmuvimvskgiAr0JbDcmUYb9MJ7kM/yCyWQh6w+?=
 =?us-ascii?Q?SeoNt6XQBlg7X0uy9waYe9hRVs704XfrGfGwe9roTAwUH89PEYYTmbDWJPf0?=
 =?us-ascii?Q?q4RhIRDaUW0UOdTuXku2WTcsT4Sux5DrI8nhIWX9QZz0Y/pCvzs4a+e/bL93?=
 =?us-ascii?Q?oi79qqrAHVxVEPy1mJ3gwXpdFdFOlW0ubpAuZq6bJ1jKxI+VZYqlZ7s9IIcL?=
 =?us-ascii?Q?GavnID0giG9rz0vatHabANVTJhJWvnmguXMLaAcmKry4u90Z6l53W67qyk+Z?=
 =?us-ascii?Q?W4kM9a3x77a7e3FCqct5+YWj1qp3JHuQO3ekudR6gv1s8SUuM45JPl4tKiGD?=
 =?us-ascii?Q?zAfCZwkOtsjj7Yaou9Xn0BEG+erCfULI+h006+QK3p/GiZ8gEBPX3t5pyQLN?=
 =?us-ascii?Q?DY0RwpXkhAF+zc2RP8KSA+D5vLhDTyFsba6GSb8sJCq+oFAZLFFqQA/9GM5O?=
 =?us-ascii?Q?6oL9ODruBt8aRcIglNdlqMS4qNphYKfBTc8LZWqjDa1TwDpItydNWk6Z0kbr?=
 =?us-ascii?Q?4XfFo4wCQ5bNht5wP2101gRAsGb1FC+ePIXqCFROQkoDPVoG8gFve6kEhtuu?=
 =?us-ascii?Q?YqhbiJnJM5cN7Dgje5MU+ck99uGhJXWvEkzNwhTQRJlch8s3rTZSFHTod1/u?=
 =?us-ascii?Q?xt4sFJcCxWa+INBLztvOAe7RF9W0ZB4RvePj/ibOfxoO5pqUqcWz+6TcadaX?=
 =?us-ascii?Q?hpDGm0huHDLLshLxMW27QVkqH2cU15WW2FaXB1RQbUbaSuTK90+OlksbfVj3?=
 =?us-ascii?Q?pWRwNEM0Uzr93/gi4CtBzUrCsGZ6CKr79azrLoE6R7wjwntrokPJ1RKtKa++?=
 =?us-ascii?Q?DXNHbimMEl6B19kIDns6dmd+qGU3k2GlvgxnWvsLRLZbxKVW1G+DzXm5sexI?=
 =?us-ascii?Q?ObOQr5cNiSmImpFa0kO00+4QDfZ7TFeZL6hlVHh11e6EZHtEG2ciytPXVGfO?=
 =?us-ascii?Q?TD6r6Rh7RN69AZQFoDA3m2P4H6VfFUYQsJB24lSOfXHw8+KpPhSinsxTh3K4?=
 =?us-ascii?Q?pU3tu0xOh+jIUK+kAQTzI8Sv9bNLkN8nqDcR7WzQby5mi7y3qdEFKPyxvMBT?=
 =?us-ascii?Q?GZltsHrQCjzIIDD1HyCKTh7LWefd2Ubpyou5qGRXkZy5lLp52DMGgIgEUB8u?=
 =?us-ascii?Q?xynkgVbP8mfz8bMJahnBkvM+p0o3lznsMXs775zNgZOz9TFhA6WJnQnAG7Ru?=
 =?us-ascii?Q?bSBGpQlGqyn01veXkl/U1HbcXKVKvk6RkZ7jnEGFt57ZtYJI5qTNjSZfeeZ4?=
 =?us-ascii?Q?6nMkYwMyLLj2+tOziJrjxubV5tCqFiWBcED26lLKxbt83i+iJq8hmy9I8NH3?=
 =?us-ascii?Q?c/Wv2Y+rQT8Vp9fz6plDICqxK7eFUwXVU/fF8Y2NRMVgku/qhSh2p9rDVEO3?=
 =?us-ascii?Q?WRX7d7SE/cr2F/w/TF+0uA/d2FkObl5velUJNo3BNMT57SGtvarPXuV2t9Iu?=
 =?us-ascii?Q?CTxFR3MPSVuDrTkZuO4p95MDugbt9llB0UcC0wUDuf2q2EMQTSB0O+5Z7hbC?=
 =?us-ascii?Q?rshBmwMx+JW3q+gJyrvWbNmaSfNlEYInnd5kuj7+o0iC4uLr8NYdiPKA0dza?=
 =?us-ascii?Q?ZdZKxgUBXzRhZl8CUwLMPJJUrmhOlVuo0YaleZ0oH6/BDu1ULlSN/YjVevy8?=
 =?us-ascii?Q?iEac13hXZQyo+R8cALCVJR5apWmb1g9HDNnbWJOoZu3fGgxGT9jm?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf6427f-ee83-4414-a8a0-08de6b1d3359
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:30:29.4025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FucOmkHxXCb0Axa3IKvdwU0tSi6wFLYWYELyLxyaL8zG1vcisPJyqF1kX4zqLvh0C1sE77HQcw44koqKapWieeL4aGpmWT9pVDHeVX6VgIbdIdYotORbI3/RoUxDUZVZ
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
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org,oss.qualcomm.com];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:krzysztof.kozlowski@oss.qualcomm.com,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,qualcomm.com:email,glider.be:email,renesas.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: B3F941380FC
X-Rspamd-Action: no action

The FCPVD block on the RZ/G3E SoC is identical to the one found on the
RZ/G2L SoC.

No driver changes are required, as `renesas,fcpv` will be used as a
fallback compatible string on the RZ/G3E SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - No changes.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

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

