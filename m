Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cA9BJh7qfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D751BD1AB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D62510EA1B;
	Fri, 30 Jan 2026 17:27:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="PZXS7Hva";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010033.outbound.protection.outlook.com [52.101.229.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F04B10EA1B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ga6J0NarqbtLxiN31Lx2zZ0MdMypfnAUNVV8Ha6GAiVSA+KC6SwgNBLA5Bm8NnXv3RbrPYHLNePEXPHXUjLCJv4Hj8N4Wcy6rhca7QMlQ/WoBbciIqA3NV8EXw+qLjcxRvQ9QJMOGHTmR1yTCdkwkT+2serREzR90ugOBW8cPmGrVkn8AiEk3utihSVLCzIFm+U7Y2PdqMUgxB6x1X5H1fA89SHfv2VNBbAvUgvyC5Yj21EnlPhEU1VEzgQGT8+IkFvq88j3vU1E4ckigWeyM1i+jiQPYyIoi+bD7pdutUnHUy2cRmLIMotd8d0GLa0R8LWMzUp5P7uP3ofU8gC0jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xWw4rz3ipXqzEFPF+LlhpbQ3bnI1YsVlMaCFmmKE/eg=;
 b=TCszDujv7dMxkPk1m4T9p5GOXyADlRw7r5BLvMgU6FkMv4g7YC56T8fy36gcezIteg+gjEZ2xF99XnMUVpsXkxtO/byDWi4ca76t42ZzkfoGrbMPdy+BKm4oh9wqcsTA6UUbIv50O/Kujn7S9kPDFRjpPuDYP6egrASGtbq+LD9U8MeH/FIPdKCKU9lRiaZ5ioM33BtvbI1DQ4z4cn8IdQIa3Q8KbQEXS6J6ZGTo+wtxBxF7tuULb7zO4pJEEQS+HKaH0dU41A/gedae2aAFT2fWW2liKLmd6xaxI1Jon2jVA+kqKZrGJUHYamI7Q6JfbeSRVneu8Jk06OzeU257Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xWw4rz3ipXqzEFPF+LlhpbQ3bnI1YsVlMaCFmmKE/eg=;
 b=PZXS7HvaRdYYPhbkSegkBn9hZN3b7RtU3un7DDopKnPJ2gEjgAELS/JfdWcWqJRG6cbCVLgUugkljiha6lQmPsddfgay+iAkLveVMkv05XizYKsM2phYjvOar0HxdZhGtJn7cdk8Rof+EZiBLdfKNR+ngaIMEAmxUdaO0sdZjy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:53 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:53 +0000
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
Subject: [PATCH v2 14/20] drm: renesas: rz-du: Add RZ/G3E support
Date: Fri, 30 Jan 2026 18:25:11 +0100
Message-ID: <ca0ec76c911f87293bcf960aef3d15258a3b3cf5.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: cb158bb5-d3fa-4428-b3b1-08de6024e636
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?E62IJv4cHSviPldsEjyv07cRa9Kqx0zKQynrKrTgwwYoSv7ZtGjtImKH9m+b?=
 =?us-ascii?Q?sGUD7/CHdQmamKjYxMTSXI/BzKQjkXe8iEWBmb9/9hkWAKtzkX+35Ui7St9K?=
 =?us-ascii?Q?nZOZAVIAt9b6wn7MZs1wGkNvQV/6h9CmPe/kihkhTsDX7ChbVS9/uln6yc02?=
 =?us-ascii?Q?ievzGgJQsPhH/B2TUifOQ0yCHLcmCtcX7kzFR1mIuB9JcB7DAvbdM/E9xFPz?=
 =?us-ascii?Q?IdmSjAUIwDNr91wIJnYzzeTjt9wSpgwNmajn6OXxyjaM2taz8jI9OqcScE7/?=
 =?us-ascii?Q?ptG+X8H21aQcT+CT82DBA4stqw9Wy3CWNFLqP7c0KlOZICcpRyiXsrqRT+sg?=
 =?us-ascii?Q?LsKjDWnKuZTh+rb5/uFtbR2oMJ3+3rvWW3LLpjhkzLNq/J0tJKvh+MLN8H1k?=
 =?us-ascii?Q?EyWLowGpuLs+WA2QfxFusqnrMXvbgtDEbmAsORy2r0cc5N0oe+aBD++yYqqk?=
 =?us-ascii?Q?uITNjPi2xgMbaC3Drrx6eOGAzpZ+pdwzn08ClPvdigWfyowkIi2hLP12fTbt?=
 =?us-ascii?Q?8vt02l8CbVRAiL8RLLE4X/Ubzvo2ldGBbJwuW5HXWhyLx8F+R2PirBNjpPY2?=
 =?us-ascii?Q?u7TYMTS4K2Ha6qTSHqrr/e/+7MKm26CMkMNKRjoeq9BRTuP5uwASaM3I/jMl?=
 =?us-ascii?Q?Hb/9Z9hKXvAhKBKF/7Xs+2uWKkoUGdnmrrCyW51lLONdEErPed4zr6blDhdV?=
 =?us-ascii?Q?NfxvAaLFFfP1HEjpmeeaBaN6b8ULj9N9t+lA5EHrnU/mF219GPdQugL3QP4Z?=
 =?us-ascii?Q?66HQEVrhPa+r5HHGyy1haZc7U86+OkYD3vXDWPIVhc94eFh7pF0OOw9ooOr5?=
 =?us-ascii?Q?yGs2CnLrsqecfgY8qXf54/Ta45pYtkJ5qlz97qoKhU9xRZ/fUflY1mldoxJy?=
 =?us-ascii?Q?AqqSYUd29aq3NODdTzBnPLfq1mSeb0NM/FJ5j6S/ikZ2rlClhQIiutfBgEXv?=
 =?us-ascii?Q?6BNILvtOnQAUn3B+1DAWLEnkBMHpgeSM9NesSc1OODOxOzd1+k2WK8CVN08Z?=
 =?us-ascii?Q?1bHFSpGEW2Z+j0kSgDdhM5fF+fUIoQqxdNHJfmjxxS8ciZv9ZZp6EURQtIVg?=
 =?us-ascii?Q?lHcRz/2L4Nieo9itGJ3s/0uhNqOtD7h/41NFjjpQ6/1m+RdJ6Y6fwcVN0Dxf?=
 =?us-ascii?Q?7bKfZMPIJ3guI3z4n5x1/xosHrvr5WDjjnDgIGMqQIOYPT9jDXpqJNAtujpq?=
 =?us-ascii?Q?YkLyXt9OzR0uvkkqxaJ9+cQyk08T9V4i24HdCIRYX+Lmc4NkBWVGapuGc5r4?=
 =?us-ascii?Q?+LEF0vuRSRuw3TeLTj3fQpENHowrDDcAPgNUUox9RNvr0vK4q+UXA/LGmZse?=
 =?us-ascii?Q?MEovaQJGez78ACr13VLYmIeFwk8FjPeTc5Mw/2Cd/TWHRyupzdmg4QYt5+AD?=
 =?us-ascii?Q?uAbC+pPzDKNn7dXU+tNrnJzNI3DGFxCa/PtVVkceSO755WhFfQ7nSdUW2fkE?=
 =?us-ascii?Q?23xpw+4zhOA2BP9GRLJFSiYTjx1eGo0nv3pxY1iWWMfUsyPtNzrz6rdswHyw?=
 =?us-ascii?Q?0OZJ52USVvvBIxUhWH33IGOjMCN/zzxIotrlAfIb9c5qu83NCNK4RVrx2+MX?=
 =?us-ascii?Q?Pzcq0Jk9P3mj0PQGOMEi21QD+L/2gSgm8oJct64VGRaAkzBfefz1xgx1Lk1R?=
 =?us-ascii?Q?oz1k5jZjji5m1lHCJYq2JAA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VsnEtjLMpYm8WrESiHgB5M5z+409/R8sBDTXhJBTQHEglFy6gedphf9nTwg7?=
 =?us-ascii?Q?jlYB9os7DPUXmA5e0SSTRKHJCGdYAxHtVuqzPSRFvOsW+TSx0afmFwkbjpVK?=
 =?us-ascii?Q?NGvXdBt9T5e0ily6Z8oShu+vFiVcQ1PcGUsazUJTtSoPqlII28eOBBPVGQWZ?=
 =?us-ascii?Q?zJBOeKnSKnunC1+mHJZXfk7tIYnl9nvBruJD3qBpcCG3U6a7znpuog5JONnx?=
 =?us-ascii?Q?9NJN6kBsseWticcxtx3CsSCinCmU3uApfflumumrnsjPuP6NL9XCsqU3chya?=
 =?us-ascii?Q?KEN7uuNvXMtFRnW/1VvCESoXBb0FWCGutV9kEeQ0Ld+JOQdic5xqYwsRi66u?=
 =?us-ascii?Q?PcZI0JjJC1ZvgPoDoNeTScyUTXxm0hcgGlr5NlJ17dWOuLVR3mgW9rso8DD/?=
 =?us-ascii?Q?5VDkjU/vlu5/6/XsAl0VZrSd+JLJxFGsp1rIBor0O4DkNwRjwhQcTuJ8Pnac?=
 =?us-ascii?Q?FQ+olDiJzqyB7J0MQwTHO2d0ZqcZsqQ8p9e1vu17jxrt5pJSU8izf7eVcKbU?=
 =?us-ascii?Q?EyLeTdSB8Sr4jOZoBs0wq5H8/1bIT1ynuFSVnW14BdbnDSe8AwTN4VhkBofJ?=
 =?us-ascii?Q?3cKSSNsOW9/3Swc2OLSzZ5bYMwcsP3tMmu7KjRo4a59khhNuC5eHgg9nfugY?=
 =?us-ascii?Q?G0L/5+UlNr+8pszFFno/sh5qbjHbXVjIy/A3glqmHAr3CycV8wn8zQ/X969B?=
 =?us-ascii?Q?/K3a0hXga+k3/eKejk8ymNmNQhcfr+INmlgaIm7g9mZv8iYJBFgZi/kput5v?=
 =?us-ascii?Q?2r14/Hp9oM/yV864YwHxpbKTZ7JjpBq9KvOTPwlzAJHDWjvDVUOEh7yTODUW?=
 =?us-ascii?Q?0+dMl1AQ6E1N2YMQr4tbKfX/VVCDMATLtcx4ikB2kT75hrm9yLatNL0/sjhg?=
 =?us-ascii?Q?a7Ckc8hdM+8Sly6iXjnFhlc+aqjP/xHAoDfxZaIEDvvUQ/t37H2pvp9iRKIN?=
 =?us-ascii?Q?i2FBTdFrW7fLu03eC0F/WVT15jfurQz/pDwvCkH69qj5CH/tVTIaubzQry6u?=
 =?us-ascii?Q?fulBZiN1BjxO3ql0yjwsJ2HKHgvCJrpbPy8tQiz0Eyvaf+WiUkT9Vv4WhKep?=
 =?us-ascii?Q?0DJCyJlT3d6bJwqjk7DmQYI7IfanAGt8wZVTwMRCxMIEJt8Zjq61aYrD+m9z?=
 =?us-ascii?Q?ly45EoJ9TfYkIidQwOIVIunq5HLyCUd4ZcVFM8Yh3gpL36oqrXCL1Cqa0JmE?=
 =?us-ascii?Q?FKJjL3lyZNe/dX2keIq0JshH3HqTup/PodlbydnVRoSYEeSNjz08KHu1kjvG?=
 =?us-ascii?Q?+9KU0sbAz1WEQ17PTNy0jNPob+BEh59wpT+D+7zBSdHFxvDgZAvKkRGLhpCp?=
 =?us-ascii?Q?sTl+qd4uCheHQOQ+YxavvFKmraNn42yNiW/kfIuThA0FoRLObNXB17gHkZe5?=
 =?us-ascii?Q?1ZycXEGHa6YfGBX7FHXS6ubjM5M/aDPCf2VHuyoZ235Y0FLUViGffkMy9g/G?=
 =?us-ascii?Q?04M52xtvhpH8SlST0lTwiTXtcN5Obiz06OUZW+9xu5ngP4T46TiVrLt41+Q+?=
 =?us-ascii?Q?SxwaViS8q+ewJZrve5FhRdKOTRbjuLfbC+2r7xIPmPZkGJuMB9kJ7D18+jFE?=
 =?us-ascii?Q?Awg157d5VceVoeBEcCfDsMcnf3zk7sI2RNM4CgXNv8wC4+Dq++mfrurbiNYh?=
 =?us-ascii?Q?BjiJW97+8YMZWhMBQ0qKJ8odzOxlWIMlT6aQyZy39cVVBhIJy0cK3Mpu6xEI?=
 =?us-ascii?Q?2gvL9JVYZ8xPX64aNWaZ8Yx/O8NmNCZEqB0pQIXs/BaMR5+wgOiMWuCr9y4S?=
 =?us-ascii?Q?gu+nbCthLbFo4xPaBaXz9+kqRoFo5tfqXEsKdagKekMg0GoBz2Ub?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb158bb5-d3fa-4428-b3b1-08de6024e636
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:53.1379 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMI0nyFS53/O7GHMybhm9tlwD84eDUbh8ohHJYUZHyJ+2lP17N0Lx54QMpVbXg2+FV3wj1rhLMPgbhXVjZCuQ7zBr1GtglUlEoyD/v9GI9qxQeJtO5BIF1wf+qhlnfNn
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[renesas.com:email,bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2D751BD1AB
X-Rspamd-Action: no action

The RZ/G3E Soc has 2 LCD controller (LCDC), contain a Frame Compression
Processor (FCPVD), a Video Signal Processor (VSPD), Video Signal
Processor (VSPD), and Display Unit (DU).

LCDC0 supports DSI and LVDS (single or dual-channel) outputs.
LCDC1 supports DSI, LVDS (single-channel), and RGB outputs.

Depending on the selected output, the correct SMUX2 clock parent must be
chosen based on the requested duty cycle:

 - Index 0 for LVDS -> CDIV7_DSIx_CLK (DUTY H/L=4/3, 4/7 duty cycle)
 - Index 1 for DSI/DPAD -> CSDIV_2to16_PLLDSIx (symmetric 50% duty cycle)

To support this behavior, introduce the `RG2L_DU_FEATURE_SMUX2_DSI_CLK`
feature flag and extend the `rzg2l_du_device_info` structure to include a
features field. Also, add a new helper function `rzg2l_du_has()` to check
for feature flags.

Add support for the RZ/G3E SoC by introducing:
 - `rzg2l_du_r9a09g047_du_info` structure
 - The `renesas,r9a09g047-du` compatible string

Additionally, introduce the missing output definitions
`RZG2L_DU_OUTPUT_LVDS{0,1}`.

Introduce `rzg2l_du_crtc_atomic_check()` helper to store the routes from
the CRTC output to the DU outputs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Instead of using clk-provider API to select the right parent clock,
   based on the outputs. Just set the correct duty cycle based on the
   output, this reflects at CPG lvl to select the right parent.
 - Updated commit message accordingly.

 drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c | 48 +++++++++++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c  | 26 ++++++++++
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h  | 11 +++++
 3 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
index 6e7aac6219be..c51ba4b8c383 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_crtc.c
@@ -64,11 +64,32 @@
 static void rzg2l_du_crtc_set_display_timing(struct rzg2l_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
+	struct rzg2l_du_crtc_state *rstate =
+		to_rzg2l_crtc_state(rcrtc->crtc.state);
 	unsigned long mode_clock = mode->clock * 1000;
 	u32 ditr0, ditr1, ditr2, ditr3, ditr4, pbcr0;
 	struct rzg2l_du_device *rcdu = rcrtc->dev;
 
 	clk_prepare_enable(rcrtc->rzg2l_clocks.dclk);
+
+	if (rzg2l_du_has(rcdu, RG2L_DU_FEATURE_SMUX2_DSI_CLK)) {
+		struct clk *clk_parent;
+
+		clk_parent = clk_get_parent(rcrtc->rzg2l_clocks.dclk);
+
+		/*
+		 * Request appropriate duty cycle to let clock driver select
+		 * the correct parent:
+		 * - CDIV7_DSIx_CLK (LVDS path) has DUTY H/L=4/3, 4/7 duty cycle.
+		 * - CSDIV_2to16_PLLDSIx (DSI/RGB path) has symmetric 50% duty cycle.
+		 */
+		if (rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS0) ||
+		    rstate->outputs == BIT(RZG2L_DU_OUTPUT_LVDS1))
+			clk_set_duty_cycle(clk_parent, 4, 7);
+		else
+			clk_set_duty_cycle(clk_parent, 1, 2);
+	}
+
 	clk_set_rate(rcrtc->rzg2l_clocks.dclk, mode_clock);
 
 	ditr0 = (DU_DITR0_DEMD_HIGH
@@ -248,6 +269,32 @@ static void rzg2l_du_crtc_stop(struct rzg2l_du_crtc *rcrtc)
  * CRTC Functions
  */
 
+static int rzg2l_du_crtc_atomic_check(struct drm_crtc *crtc,
+				      struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state = drm_atomic_get_new_crtc_state(state,
+									  crtc);
+	struct rzg2l_du_crtc_state *rstate = to_rzg2l_crtc_state(crtc_state);
+	struct drm_encoder *encoder;
+
+	/* Store the routes from the CRTC output to the DU outputs. */
+	rstate->outputs = 0;
+
+	drm_for_each_encoder_mask(encoder, crtc->dev,
+				  crtc_state->encoder_mask) {
+		struct rzg2l_du_encoder *renc;
+
+		/* Skip the writeback encoder. */
+		if (encoder->encoder_type == DRM_MODE_ENCODER_VIRTUAL)
+			continue;
+
+		renc = to_rzg2l_encoder(encoder);
+		rstate->outputs |= BIT(renc->output);
+	}
+
+	return 0;
+}
+
 static void rzg2l_du_crtc_atomic_enable(struct drm_crtc *crtc,
 					struct drm_atomic_state *state)
 {
@@ -296,6 +343,7 @@ static void rzg2l_du_crtc_atomic_flush(struct drm_crtc *crtc,
 }
 
 static const struct drm_crtc_helper_funcs crtc_helper_funcs = {
+	.atomic_check = rzg2l_du_crtc_atomic_check,
 	.atomic_flush = rzg2l_du_crtc_atomic_flush,
 	.atomic_enable = rzg2l_du_crtc_atomic_enable,
 	.atomic_disable = rzg2l_du_crtc_atomic_disable,
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
index 0fef33a5a089..84e6bf186f5d 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.c
@@ -51,6 +51,29 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a07g044_info = {
 	}
 };
 
+static const struct rzg2l_du_device_info rzg2l_du_r9a09g047_du_info = {
+	.features = RG2L_DU_FEATURE_SMUX2_DSI_CLK,
+	.channels_mask = BIT(0),
+	.routes = {
+		[RZG2L_DU_OUTPUT_DSI0] = {
+			.possible_outputs = BIT(0),
+			.port = 0,
+		},
+		[RZG2L_DU_OUTPUT_LVDS0] = {
+			.possible_outputs = BIT(0),
+			.port = 1,
+		},
+		[RZG2L_DU_OUTPUT_LVDS1] = {
+			.possible_outputs = BIT(0),
+			.port = 2,
+		},
+		[RZG2L_DU_OUTPUT_DPAD0] = {
+			.possible_outputs = BIT(0),
+			.port = 3,
+		},
+	},
+};
+
 static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 	.channels_mask = BIT(0),
 	.routes = {
@@ -64,6 +87,7 @@ static const struct rzg2l_du_device_info rzg2l_du_r9a09g057_info = {
 static const struct of_device_id rzg2l_du_of_table[] = {
 	{ .compatible = "renesas,r9a07g043u-du", .data = &rzg2l_du_r9a07g043u_info },
 	{ .compatible = "renesas,r9a07g044-du", .data = &rzg2l_du_r9a07g044_info },
+	{ .compatible = "renesas,r9a09g047-du", .data = &rzg2l_du_r9a09g047_du_info },
 	{ .compatible = "renesas,r9a09g057-du", .data = &rzg2l_du_r9a09g057_info },
 	{ /* sentinel */ }
 };
@@ -74,6 +98,8 @@ const char *rzg2l_du_output_name(enum rzg2l_du_output output)
 {
 	static const char * const names[] = {
 		[RZG2L_DU_OUTPUT_DSI0] = "DSI0",
+		[RZG2L_DU_OUTPUT_LVDS0] = "LVDS0",
+		[RZG2L_DU_OUTPUT_LVDS1] = "LVDS1",
 		[RZG2L_DU_OUTPUT_DPAD0] = "DPAD0"
 	};
 
diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
index 58806c2a8f2b..c6f9dc46ab31 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_drv.h
@@ -20,8 +20,12 @@
 struct device;
 struct drm_property;
 
+#define RG2L_DU_FEATURE_SMUX2_DSI_CLK	BIT(0)	/* Per output mux */
+
 enum rzg2l_du_output {
 	RZG2L_DU_OUTPUT_DSI0,
+	RZG2L_DU_OUTPUT_LVDS0,
+	RZG2L_DU_OUTPUT_LVDS1,
 	RZG2L_DU_OUTPUT_DPAD0,
 	RZG2L_DU_OUTPUT_MAX,
 };
@@ -46,6 +50,7 @@ struct rzg2l_du_output_routing {
  * @routes: array of CRTC to output routes, indexed by output (RZG2L_DU_OUTPUT_*)
  */
 struct rzg2l_du_device_info {
+	unsigned int features;
 	unsigned int channels_mask;
 	struct rzg2l_du_output_routing routes[RZG2L_DU_OUTPUT_MAX];
 };
@@ -73,6 +78,12 @@ static inline struct rzg2l_du_device *to_rzg2l_du_device(struct drm_device *dev)
 	return container_of(dev, struct rzg2l_du_device, ddev);
 }
 
+static inline bool rzg2l_du_has(struct rzg2l_du_device *rcdu,
+				unsigned int feature)
+{
+	return rcdu->info->features & feature;
+}
+
 const char *rzg2l_du_output_name(enum rzg2l_du_output output);
 
 #endif /* __RZG2L_DU_DRV_H__ */
-- 
2.43.0

