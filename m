Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eKdJAPDpfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E243BD12A
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF76C10EA1E;
	Fri, 30 Jan 2026 17:27:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ZgNhHd2k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010070.outbound.protection.outlook.com [52.101.229.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 552B510EA1E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oNMa4TzJCdNbsC3Xs38kTJAJVcT6OhCzCnXZS6GB/yu6G6OPE9FhmdIRQRCiSsOxQsE2JVSdcjzmLozCrNCw6W8HaT+9SOLxidBVCAs/LSCyuLL10RGB0U7dYzM9nHYrUasBQ+jlmkTtgKHImrzgbNdSQj26VarqwKPQmkhEksvZ4GDH+wfthgNGCS1GcxoTgjGxi0MbcdEHSDkZCv+D4tQlAlKaR2CSE3O94hMEoAfOna1CwtMYDG0uzXPaAuXrMt45+YbXsN8KMbPfyFgdHPZU7uwqJ7elxHTM9SV3IdLabLIg1W9k/Gk4qX3ArJbqu/tWdCUanx91DozVR7DeFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YcIQOyaG8Qmzznwt55dDPSzroTgH/fgPEo+csyFrASU=;
 b=oMYKVgcelcgHHOCtE33lPdpmGPWL5j9QekjRMXLnXvtIFDA7OP/K7wed5puTzdkHzafnXtQNPaqoXPgee+Zs8rJer3EY/xXhaODfAsJYhvNEd2fwVW5AQ/GXM6E2RpHFUJ0E7rwewjl1vCYduLley3/cTglg4GNkS9v6lnspt+dGsy9ddYgxuum3qo+rcSji7krTVCLogMEy5j0JvxAKYAt+oePxbHdCxfUgjJIcNFGvqdvwjUXZGkRh4F3VEnSEb8pjhHMxPoGeg3AeEpurfHwQV1RlzQBBZ1+A9j8x8q795zwNfedg9WsYGZI1ok6nTMU3sqz5MrKJ8z0EAEzmHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YcIQOyaG8Qmzznwt55dDPSzroTgH/fgPEo+csyFrASU=;
 b=ZgNhHd2kRQedj0i96YjFTvqCLuIkxebKguPk4QRr/HKVQi61Qw/4sj9jLTbDhZtLo02z33Av5hYX+UKDYI1LPa5LTP5rsB/EyGMn8pllb+0tfBQAloPlGwS3mtTs1lDdmoBYwP7KLmaCAHDbdHokUQyANcQTgv0VIur7T7R1tQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:05 +0000
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
Subject: [PATCH v2 08/20] clk: renesas: r9a09g047: Add support for LCDC{0,
 1} clocks and resets
Date: Fri, 30 Jan 2026 18:25:05 +0100
Message-ID: <597a1ac09d6068942ccfb38681f3ea965a85a198.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 31eaad54-2cef-4374-e9fa-08de6024c96c
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W2Ky1Uv6a2kbxr/965IL7U1eb4mzfrDMVS27d11DdQvsO+AfN5GJME7Lnr1i?=
 =?us-ascii?Q?dl46PaMPkQcEmGh27mVG3s0lbYaIspHg7pPbGoARvp5GysZA3WB7rDQaLQjJ?=
 =?us-ascii?Q?cakbciz0PIgHqtVzniwPGzVcUuRPT7w18q7JYpGUtNBXD6X0lTZdV45W3t9r?=
 =?us-ascii?Q?ORUlhVt7mA6/3pqiC4s4xjBvvoFouzBfFcBImnQRt1C4n20QuNNY5pCe3OmL?=
 =?us-ascii?Q?P27uboQ2XAh7c5/M8UYurNgAHQHICO3wcBYBBNa5vUk8ARRKFOPHmXHqv6n3?=
 =?us-ascii?Q?c4Zv3zYyialUk/DAT6V4qWJwNj1OnRLIFhOuvF0o4Yo+pJnYgXVFwbznCZQw?=
 =?us-ascii?Q?C1eIL58nA9efKagLvxcaTRQh+ODTT0BaNX30AqmosBsx0iPdqroMvWUGp+sL?=
 =?us-ascii?Q?2pjql/+68ZyugNjYAIBNuzqLPID2QO51zNhCQbuBYTNk2CJ/0Uekd2NYoP9V?=
 =?us-ascii?Q?ijeaSI2+B4hYpZekMsHbDkY1LVLpt8AQmcFtp2SBRGAzm//4Epv44Wu2nL5+?=
 =?us-ascii?Q?IUQ7CCDTjbIapNEY0u70tp17w7TBYmzZwYFp28fYd5W1i0/VjPXl32CsjUDX?=
 =?us-ascii?Q?lvyO/xoeGE7epiYLaHg8novtANYzdbneLQ3J1PqwnfQs07Dkz9JYW2BqnIFe?=
 =?us-ascii?Q?gAdRY/L0RBwAEEPj6T69NriKa4cc2KjHjNz7VdwlEdBOW0z+5DlNfv8/+o3D?=
 =?us-ascii?Q?qZbB9j8tfGzPuBiEj27OdEfvpGHxGZ/ee6GQLuTjh56BxroDmK14Szy7PXwj?=
 =?us-ascii?Q?yXvoUyQUPZXKyomUjLp+0lzfiePigE9feXtfPyZZNf2DJxtckoQvFmHpgi/T?=
 =?us-ascii?Q?7VuwX1v4BV3QOE0X4sIFCs/rzmUEBqfazqtqiIxrBkoz7HLoQoC7eLFgMchR?=
 =?us-ascii?Q?toUBipCMF3NXBwhM4YsHfr8NBqx/jRSP1DtTDV6hbfrhSCPS2Bvc87pajHeQ?=
 =?us-ascii?Q?SHgQkpyNbq9pLqYQJticReC3KuZrNxOlXVGeLSqXSeNr9sBBFzG7Ph28GASR?=
 =?us-ascii?Q?pmqpZZPUjuxT0smX/HTkTxDgn0M2jWrn+j1UdN0SDbJUBx5lZ2vqzr3FIZWK?=
 =?us-ascii?Q?3JvatfkoaxvRaiLndqyzOlGDvE/IGHFXHqV4Z00NZLBxzbnLpTfg/tYh/dwD?=
 =?us-ascii?Q?VqUQscxvKcY84J//k7oLSItPJpw2VYDmRjZmyZjf3EoxKK5VtbP7njQZi1Yg?=
 =?us-ascii?Q?hd42jhBb2jXOveZCcRS5GrRepdjVMui/iVxotYMbIqEcUIpoBCekNxne9ys6?=
 =?us-ascii?Q?+EzYMRWzvwWPjd4h6IEBO7DDcL6eOvQBPqN75m0aOM+ZD1vLk86ctv7oqe49?=
 =?us-ascii?Q?CIxlrO9Xpgzq4THhp+yVpUqPKjEcnA4nWrqmZhjL4ALnkJ84t8fuvLP4Hkav?=
 =?us-ascii?Q?qxv+/br9xPoWy4vnyVIUWvDuafIr2x0G98zPjwaoe3DiOjpVw6nDUjrwYEpL?=
 =?us-ascii?Q?Kl1CooNmt6J6a3Wya8AfFiNCVW4dye4I1hv2rNtwGZ3GCgNVI0iP1sj8yMpV?=
 =?us-ascii?Q?7y9R4iAXmWIlHF+juuPoBouPO0q3ZdTQBYghWPBxOj3fYFxDu5lW3A5RhM1w?=
 =?us-ascii?Q?qgxf0wr7vppoZ6NBprhi5HyVgNzDFAZ8es+NwGcypsNF3vTCsPesnPYnQDHx?=
 =?us-ascii?Q?ymTVzSIATn0ca+HvymXnJRQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vuLov9ezJQQ5cbbVQzw8l3TJd4BTjnqO8H6xhEU6SrUpNs946uceVBf1Kjrf?=
 =?us-ascii?Q?sZlFJn1Ji2j8o3i6ldtg8GyecUaQ7g6E0t0v37HgQR1zddzPP0Gx/KgCpcFd?=
 =?us-ascii?Q?n+zRPfJhq4CbZf5VqhgdtJYKJ/vhX95px4TgCXx31/26aswMwIWgwwP+0j9p?=
 =?us-ascii?Q?tvkMztg2ofH7ZxdO+ixKD0Y1yoD4hlSgB8fcf1ZOBc1Ict+L2VQC4AlqkIyz?=
 =?us-ascii?Q?GYHfsmHTQI2vx0e7BFIqZirnyzgf9LN4pJiCzAi+bb/sLcNWN3uWsf/wHyPs?=
 =?us-ascii?Q?AagDpZgMW8U2jpYt6LsI6MgoreV/xVj1jixyNlzHqYExhWMiRka0j6kJZaI2?=
 =?us-ascii?Q?HN4p4w9YtCyiku+8WXaK3xG4QE7Y8FZbFhecXYVZcNVMmBL7aQTNtz/Mbepl?=
 =?us-ascii?Q?DBpVKNUTOCZLZa6JQ3ykxrsQRiCLcD5IQujCvmqnDdNrxUCS+kmB2LgSj/3D?=
 =?us-ascii?Q?fd/MerIsPzVE96Vl24qzHQdl1BN59aNWJq6xpfa16iM+XjOkaRaD1SWvBSlf?=
 =?us-ascii?Q?PnaQmEbsq1OVNsQVHXa81VNu13rHlx2cSWpfd3qajcEAMZAtnNjzGSS4IJ26?=
 =?us-ascii?Q?FjZtMSNwe0DyeJpuG855/YF5h09ZKhDzpbvyo/ZSSbkUFLTnk/EG+FHdcQkx?=
 =?us-ascii?Q?4Dt4BQpZJ++tSXxk6CNzCgWSNSxduAfv2DdcTqjgk3gtGV1zWfYvEygRsQR7?=
 =?us-ascii?Q?OsN0X9xXfq506sRJ5oL1m3FMXKvQYw/a6uqF38OK/W6QvdmPrGPBs/PJy3v8?=
 =?us-ascii?Q?O0WkO0TvKrQHkDE4oqHhAdWkQXbHokAJ7fl2nbir3ka5u36d19fxDYUKY81e?=
 =?us-ascii?Q?iEPMEqccPwKd7f8WgTrqnP6Y9uQrTSY7EkbbpHa5wxGbbAoOvJgC6ydJfLX0?=
 =?us-ascii?Q?+rIGPG2kX0sAxNnGTGL4KpcLyrnOJyyTKHSivZHIpXh8sMNHG5FcxFiTKuHI?=
 =?us-ascii?Q?oOIzhBzkx4R9P0AtE3HaVXI2Ekq2QOJWtBlei0roJvlg7lgfX4ThbpL+iwjZ?=
 =?us-ascii?Q?vneXC6Jy1AdDh80b9iCYsKA+mWIi/myIzMA8J05mtI+bJ6cN37AlWkBhlWtA?=
 =?us-ascii?Q?jeRM3aAh16k93b7QuXyF9f/zcdu+VyqVnEvKFqFM+vAUtHwNGSRSIcCQmupH?=
 =?us-ascii?Q?b8lk4OeHJ1aD8Z+ZTmIKs2wy9BcuGWzyTJlbIiTNco75+uF6mBDrmcC3VGrb?=
 =?us-ascii?Q?IkST99KVhykP1X6VQSAIrv2xC7do0Olf9fOiu6YvvlCI4hmSAiY6CB/v0ieL?=
 =?us-ascii?Q?TGElkHsZizjiDn7p+TJkKLzAkxl4BvZbcwue6g5hOZHQbxu0yKM8W/YgjxQW?=
 =?us-ascii?Q?88k82I3SB/TR6HjHETHI2GX2osiDITg9+cj5XYD3SajxjIYrl3AKdDJE3UpO?=
 =?us-ascii?Q?cK45Tynvh+vx+72wnetixS1YnhtDgbPuZ6efDyRCws2tEVs8fzYeUFTsWPow?=
 =?us-ascii?Q?WNGIdYGeB4Qiaf4IGvhbFcXKYCs4Zi8XuD//tx4jqnm+O+iWJgiOLJqhFtAz?=
 =?us-ascii?Q?WQ3cyU3E7v1xmxB4wpev/EWnWFAcZUCvOHEqYZD8rpx7RL/AK5QCB1mg/bTj?=
 =?us-ascii?Q?lmwn3fl1zqPRdx3bcbprUqPIRjfByMV4kHrPHjMZo1J/TTOLFTjhoQy2YoxS?=
 =?us-ascii?Q?fMB0VRrkIct7yGD7ER3nXdvN3ewD/kuwMNVftlsxjH+ogvdK2K1V9D3SvFGQ?=
 =?us-ascii?Q?/MfBa1C4bXOhz5tTopHushEv0lKSxU5zidsn9CDq2ebZFg90wYWfWQiHOhSZ?=
 =?us-ascii?Q?mWfYLFQxCFBziO32iY0VU3foX+TtuiV4VNcSgT8IpXvrjRXXYJfp?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31eaad54-2cef-4374-e9fa-08de6024c96c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:05.0944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2UNc7dPqO/ODMM/Oc5lbCY2FFYtoJMDPLIb6U2yHrGDEFfZsqOcFiFzOQdAUNYAfZ94LcW6npcFu1Mnozeo7v7o8kBHDyljD+x3CYgNHjREAalyp2SF4+ynuPueIye7
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
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	GREYLIST(0.00)[pass,meta];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,renesas.com:email,bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5E243BD12A
X-Rspamd-Action: no action

Add LCDC{0,1} clocks and resets entries to the r9a09g047 CPG driver.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Collected GUytterhoeven tag.

 drivers/clk/renesas/r9a09g047-cpg.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g047-cpg.c b/drivers/clk/renesas/r9a09g047-cpg.c
index 596349fe6132..06ed9baf710d 100644
--- a/drivers/clk/renesas/r9a09g047-cpg.c
+++ b/drivers/clk/renesas/r9a09g047-cpg.c
@@ -496,6 +496,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
 	DEF_MOD("dsi_0_pllref_clk",		CLK_QEXTAL, 14, 12, 7, 12,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_0_clk_a",			CLK_PLLDTY_ACPU_DIV2, 14, 13, 7, 13,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_p",			CLK_PLLDTY_DIV16, 14, 14, 7, 14,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
+	DEF_MOD("lcdc_0_clk_d",			CLK_SMUX2_DSI0_CLK, 14, 15, 7, 15,
+						BUS_MSTOP(10, BIT(3) | BIT(2) | BIT(1))),
 	DEF_MOD("ge3d_clk",			CLK_PLLVDO_GPU, 15, 0, 7, 16,
 						BUS_MSTOP(3, BIT(4))),
 	DEF_MOD("ge3d_axi_clk",			CLK_PLLDTY_ACPU_DIV2, 15, 1, 7, 17,
@@ -506,6 +512,12 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
 						BUS_MSTOP(2, BIT(15))),
 	DEF_MOD("dsi_0_vclk2",			CLK_SMUX2_DSI1_CLK, 25, 0, 10, 21,
 						BUS_MSTOP(9, BIT(15) | BIT(14))),
+	DEF_MOD("lcdc_1_clk_a",			CLK_PLLDTY_ACPU_DIV2, 26, 8, 10, 30,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_p",			CLK_PLLDTY_DIV16, 26, 9, 10, 31,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
+	DEF_MOD("lcdc_1_clk_d",			CLK_SMUX2_DSI1_CLK, 26, 10, 11, 0,
+						BUS_MSTOP(13, BIT(5) | BIT(4) | BIT(3))),
 };
 
 static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
@@ -576,10 +588,12 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
 	DEF_RST(12, 7, 5, 24),		/* CRU_0_S_RESETN */
 	DEF_RST(13, 7, 6, 8),		/* DSI_0_PRESETN */
 	DEF_RST(13, 8, 6, 9),		/* DSI_0_ARESETN */
+	DEF_RST(13, 12, 6, 13),		/* LCDC_0_RESET_N */
 	DEF_RST(13, 13, 6, 14),		/* GE3D_RESETN */
 	DEF_RST(13, 14, 6, 15),		/* GE3D_AXI_RESETN */
 	DEF_RST(13, 15, 6, 16),		/* GE3D_ACE_RESETN */
 	DEF_RST(15, 8, 7, 9),		/* TSU_1_PRESETN */
+	DEF_RST(17, 14, 8, 15),		/* LCDC_1_RESET_N */
 };
 
 const struct rzv2h_cpg_info r9a09g047_cpg_info __initconst = {
-- 
2.43.0

