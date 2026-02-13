Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eA2EMnxRj2kMQQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 346B8138088
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 17:29:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D8610E82C;
	Fri, 13 Feb 2026 16:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="AW8PW3GQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2992910E82D
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 16:29:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uOIhZ2m4V0StY2joy3Crm7Js/Ze2OVjKjjndtnIKlPYYlgMA8GhRko4Az/nJ9s6RoiwCH1JrFdHh0ANoN5X/RSMydxLGSGD7jVdqCksAEOghvo2e8LEdBCr05lNCJpsWu2RkO5T2zsqx4X0hPZ5vasbTX+AoBCCT4Vkb423x/kbivSkUh+DjzCm5IBI2I+QPT5nHklp8Ox6dSfXTLMgn6MJr1RyMpWdTB+6nB7b5tQg0Wf3LPZv6TRf+hkD6J5P+ThiHB7JxN5h1gW+WM77XSbsh5p8kMmrGjAfu6T47FwbZ71ZWVmX1ByVtD5km4pKLo11XUmyE/fsCj/5qQDwpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QJYdJQq+1Ur2QJDwzO8Mi0LnIZPVF7wTGblsf0nWhf4=;
 b=n+fdCdOCC5TPnACb8R7PUDjVq3QV1PqtU8aedebjWVjf/c985QsaoLTR702ox7DjEQOE3p9R0Sc/zdFLrK1epLKHcgk/bLRXFdcNsZeMq/GmRKICpr8f8J1x+q4l8JRo2fCouIaOySj6jswiKhrHRQZGATOptlKUjBRC6vAba0Qxsct4JFB8LMqNZotAtbuj/kNixztUqi/1dAUviFx5Wc0V0rxxWHEOiFvEGKS7xJeUa3k0yQt8jZi2ST0QgMRV4tKaD1+qfe/UqiPCpQkUXNbc28Gpr8ZAtwMqs0xlA8zXTOIvbRHXzQb4MyIW2L5wlKi1bwd+P9t44S4eoUlJkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QJYdJQq+1Ur2QJDwzO8Mi0LnIZPVF7wTGblsf0nWhf4=;
 b=AW8PW3GQheP3XkyK3Brt1ww6bQTSWdndBpYEfw0abEK+NR34bHk49FpS3W2fLBpYbJNzfwU8g7uDuetg7SV+hnnrGNsh8I1q50ZUGjF9EnnPFtEd9m8lTMBnOs4SLZCM+jSIIsA8kpXR8qF0G5Uyqg62zMkJx2IHsivvreK6vlM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB16005.jpnprd01.prod.outlook.com (2603:1096:604:3ec::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 16:29:42 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9611.013; Fri, 13 Feb 2026
 16:29:42 +0000
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
Subject: [PATCH v5 10/20] dt-bindings: display: bridge: renesas,
 dsi: Add support for RZ/G3E SoC
Date: Fri, 13 Feb 2026 17:27:36 +0100
Message-ID: <bcfe88f55ca42f45aaa3a364f293bd149b721701.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: bf98e127-c009-44a1-a3d2-08de6b1d173c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f7jc0T1NkJVwzQA9T+qrdkbVTObuI2fjqkKwSC4yWror98SLRkR3gUdtQYDA?=
 =?us-ascii?Q?CnT65xi36fHgro6dM7LFKCkXfuYZAm/JZEjJeBOHJLstmVUOPv83AFt/mp8Z?=
 =?us-ascii?Q?83Nx6bj3LyI2Ql5kTsx9pDWPhQVgSyP7AQgm1Z7HxD30uogEFDzrOBoWST3B?=
 =?us-ascii?Q?opEyi3215srisGXdNQRC0IhM1Tx2MjQPE1krykO3pe8CxCa/KvdBhBUWBlzi?=
 =?us-ascii?Q?2k+UoqrsHpKreroj7ohDiQsdmIMqpLgdaXtK6pflQ3j2HBYRvuMA5p5IH2mK?=
 =?us-ascii?Q?gAysky9G9p3IxtFhNahbzCq0MdbXdoHNzTtS5vMK5DaFkhaleVVhh0Z4FYIj?=
 =?us-ascii?Q?mNQX3exJ30OE/vp7lqVwP8aG8XvkrUd1c+ARPP6yWD2UleQ+IELS7ehtK383?=
 =?us-ascii?Q?SL6IYTqAzP95CqGbUZhYsIOJZtXvORpfUk37kcIMjhK0AxmlSlt7nb/nd3/g?=
 =?us-ascii?Q?CrqzRCX5nlzuBdwvklmRWURc6VD+jg2d2r3Vtzo+B71qfX17FLyfWZDdtXho?=
 =?us-ascii?Q?NnVgV4Xpdx0nN0bFpL9U0vcHU96Gg/qrfnTm3j+JWUkyRk9aHN+44p0xGYW9?=
 =?us-ascii?Q?UsMS/rV0ZWQtFYWZ4wv9ZeDg9CVZvui/J3mxyvjOrxu50zBVSBrVGMiOKmpb?=
 =?us-ascii?Q?o+dT9ehXrebXRu5ql51fnd95QAbogAxuGo7VA6alrciajdg5qPu7IKOfYG/m?=
 =?us-ascii?Q?ywJBHF4OS1Yx7vsyaMFGnEOmHwCDMjs7YQvNMxh3pLjUJEuJTZClgv6VezAr?=
 =?us-ascii?Q?vrd3oiz+o7QK19VZGNStgEfeupbPcgHFv/zlKmX5Ed1sVBeGd+2jpdyIOWxp?=
 =?us-ascii?Q?W7xn3n7X4hPmRdf5VbxoiWzT4IIkRuzAdd3L8Tx0itEWjYsxMjEFcC88dGf2?=
 =?us-ascii?Q?JckCHUK48LrfLUYfuPs9MU+OJMjDCBxcVEAIvX6FzLVXGfQM/yo45svQfYMx?=
 =?us-ascii?Q?JxOVfzopNJW2Fwl5RqIcfZcSwVaVp9JsACvX5tlAFEKPPQS/vB/s6rw4LKVr?=
 =?us-ascii?Q?D7hvN59g+/EuGa4OXOHTA+xR4gmSJ/LtUJFBddt7+ViteOlEZkZUXVhFwxNc?=
 =?us-ascii?Q?KtK9jm/M1eb2cZDZc1zAvZl7FzR+I//BmZAEkXfCBorNFCs/kJ98Eq5TCJ92?=
 =?us-ascii?Q?GyiuhWvPIOlXfdAyApWlDNkrPNDZLdZlUmyonX2gmRf3IYCm71ecurnG157O?=
 =?us-ascii?Q?eUWMy6pzirTMxp2ufsSM1mW+2SnjVWIBoayIPdYU47OwYKpnCy8MSt9cfXy+?=
 =?us-ascii?Q?KIdmjP2hWpLYy0VohgzI5ChdPQxPQfufaGknIi1AePFje43ILJiMGCsF/g/Q?=
 =?us-ascii?Q?0d0/muy5NRx6A2ZMLg22mGdTTE4ctx4z9vjoOWtO5BIejlmpr8hE4+JZK09W?=
 =?us-ascii?Q?WASZL5hP672T9XmWef77/163HigPtG5styPxM28vEF4h9J1BLxD5tu2gZkwu?=
 =?us-ascii?Q?wEC3ZUoshUMQKdBQeo2Uj4imT8gWy8O9nOPYyoqqNLV7dKgeht43GtUIH21g?=
 =?us-ascii?Q?LTDoyx6PGIqwgsQ/sQ/eL9uOhAHyS+g2ChWjuqEopW1ELAcPMIF/U7usxiR8?=
 =?us-ascii?Q?qVa8svXo0RfXtQ9DX/OI1MSzqBSFcsvv09s72Hyf/nssLtOuN8Sgv8J5LL51?=
 =?us-ascii?Q?LOswvTDBAC6GczftkPuvpUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uYUU3McaFg6f1nZvegCTsvolZeddTulD5RbhWOi6na/utdXPquuwpEaX8gkG?=
 =?us-ascii?Q?NBQhCBKyj3KnvqV4h/JyC/VsxakWj2F2gSY314JMmMWshJHH5kjliyp3fa/0?=
 =?us-ascii?Q?DwAmAeXEP7MbNmUhkWTuErE7uVp9qExZvW/UrTTAn57K29A65jD+VJMUpOwc?=
 =?us-ascii?Q?EpTFz1gD5DZUthju+dhdJZ6d6WRLcMTaSJ9i4R+a2z+al3gC55TjP9HoxfDh?=
 =?us-ascii?Q?lQiwuEJ8at4o53f6YNLNytPeR+k6erEHWz2RJBbTrkVUYFn3wfO9jADW7XC1?=
 =?us-ascii?Q?Y8Z9oeXgktMaC5oOnKUGxaRQuhdDoTPLnGI3d8xrZYtMuUeFuD7Q0xwOw+Z+?=
 =?us-ascii?Q?kSt1Ri6Y/UCzL8SWqpOWO8CUvJ9qFUTTVUuDafU60oWRwmriCjsehGSs+jAy?=
 =?us-ascii?Q?I4ah0cEMEjv+vL+4AqrOeHard5K71rS6VftZh68gazPOqxkUxTSgLbnb8gFq?=
 =?us-ascii?Q?3a1FhfHumZRQ9d89pqn4zBf5dFXJ/sk8eHte/n5TfRxx8BfQzGHvvjLqCyDD?=
 =?us-ascii?Q?/UkUnfI7omtPdeRypGekFjM/iOa07ouhsn7kjbL5NpL1SlP3vmAJaeBNo/DM?=
 =?us-ascii?Q?YN1mUrf9D1Xv+Q/DBSMFHo+A+yyi3SbVd8T8QTWWoB4SGEN5mnWS+6TorO0m?=
 =?us-ascii?Q?swxAiiGA5n6TtkP7jKYtmJ//pMh1JoD/Gs4jj0BCUgDeaJI4uMmqOXT2XNiX?=
 =?us-ascii?Q?eSwlTpWzsY8Dr0lb5JqJEI1378YFZ3x51gVbhuuXVu+gzs7upbEmj85ngS1F?=
 =?us-ascii?Q?ZhhQOFUYpSRCyK/3PvM3QmcR7v3wP3Nijxx/S/LoHGdG7mUb+6rHkrDvC85N?=
 =?us-ascii?Q?kgLHsK6/LUZnD8qp86OFxmBURk2e+kEYPe2HJYHLsIpZhFuid1+eni7E7lpl?=
 =?us-ascii?Q?7kk/ToAKEEEGyBAiB7Er5g5nV/ODgnaZ55dvEYamRdpyvqmiAjdpR8Ck40r+?=
 =?us-ascii?Q?xtLIGzJc87AB/e8ALwlUe1PFxUnSUtZ6Y68yWMNQZPdbJYuGvxvV9hqgaMuL?=
 =?us-ascii?Q?RhYeTFF66LKIo/igRy5go0LexD6kCRtcl+UUls/VPq+46TPty/Ch+NhHa21T?=
 =?us-ascii?Q?FtqfQvlE122Wsb65Ah6EhpqYdpAfGORGs0A/FbLpItOY3ZesIaRXypMzKU4D?=
 =?us-ascii?Q?yEvI4ycHLOrqwYsnAIevVMaQum+DEbbO2Jy4m8f0SPCRShzo7nwVQouE9bM6?=
 =?us-ascii?Q?5z9QKnutKcUqoxpwnJTGjPrZWtj9Ab7c/jmQIHzsHwzWFQs1RJA/xeV8dXRr?=
 =?us-ascii?Q?lAAcGUL/4zBHDrM/yKTAXoX/2w2WTvwU0DWJXf2/FbhwrJBZ8Z2OpCeUtwTJ?=
 =?us-ascii?Q?HbVHC9b+1tSwXNs17UHiYd/HHlFc3oxb9GMoKRo7UFv+lcIwD+WC2KVexoY3?=
 =?us-ascii?Q?26gAbdUqqS0zY4ObO7KTpk7AM0lB/0bqxm02LLKbGjo0wpPqmqUFJkM2yzHg?=
 =?us-ascii?Q?/CojgNpsY743v+twVyVxpYgjNDou99IFIy8JyaAJLrwWHyTJmJ4cOssz9Wqd?=
 =?us-ascii?Q?jgNVmlM20SWkL1KJWRNC/WK/Sn8EkH424AM36GQnjKh+Mb8CS/o/PENkfQOB?=
 =?us-ascii?Q?X38yO6ChMO8uJ+gTTHWeUWGavDR0nQiR8ZRF0iGgi0aDHx4iViUMxAyoN1Kd?=
 =?us-ascii?Q?fvI52WWKnLipQnLPp7FG6/hJhYvG3mZAgxG0EMcO30eiwdpPLHkI9GCSqlgs?=
 =?us-ascii?Q?s4PDDerihM9b68g3aO/VoAeZ5g1izr3JORC81o1J5zuAJo7UmOClM9w8B8jt?=
 =?us-ascii?Q?cE2u78JjXct5Umjb2dNGjNLbDOnFaS3OnYJHKHAqX4ewDyTerQcH?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf98e127-c009-44a1-a3d2-08de6b1d173c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 16:29:42.1971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GRT4PywDEG0QK6Y7X2R9rcE0H0c6a6PZzplwtpUK2PpFz/RFfk5imgDJ/pvQvO5RRQ//1/mHlpe5bUcaLg+nNjngJlIs+xdEx35bhGO5tHfJOWCKsbLwxr7w2z0SgvQD
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
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.2:email,0.0.0.1:email];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,bp.renesas.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 346B8138088
X-Rspamd-Action: no action

The MIPI DSI interface on the RZ/G3E SoC is nearly identical to that of
the RZ/V2H(P) SoC, except that this have 2 input port and can use vclk1
or vclk2 as DSI Video clock, depending on the selected port.

To accommodate these differences, a SoC-specific
`renesas,r9a09g047-mipi-dsi` compatible string has been added for the
RZ/G3E SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v4->v5:
 - Collected tag.

v3->v4:
 - No changes.

v2->v3:
 - No changes.

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

