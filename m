Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oCUxE2f5fGmYPgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4087BDCE8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 19:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01AFC10EA47;
	Fri, 30 Jan 2026 18:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dCHsOpEf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010021.outbound.protection.outlook.com [52.101.228.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C536D10EA47
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 18:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I/iSgLoIIXSHlk0rEcEE/kjfcxhHtn8kA/sDDSd0u+5CJUY2hee/CZWCKOvo7PrjlE+YTkDCA4W9Qla0eMGLuWue2l0H9tlsf38/qOloX5YHkr6q15p7zanI1xyH1AU4sY7+1T5OYBzfbuOvmduCKW5fPZQPSCtWVZ4zFZhJKwP/yKgbRxx0BKWckaCCtxQ5jFs6nkvT61CMih42HCozo5RP/hmtZjWFNkykJF7Bljn6Ns5f7qXYTgD2/30l0vN6AhXf10KN6TYZDu1IdcajfZETt2gR//Xbz67AIOB1ttcuo5HVbSxxssTKCN4uRfSI3nvwl1tav8PQk5UKSsg6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7UfJu9ofOAkKPR7ausynzSHTQEWrQo8iEYVbU2E9YM=;
 b=V0EpEIpLhagLzW+FRQBC9Pkg4XF4TaFLYXhMJKCxJjmPYIdK5JRZRCbxryEbMPm4uun4NCojj77F2alDOBJIlykM1H0a1A6ynjXMJuuo/DMg6J1FZA59ENXzmtE+vA3NpA6h0EPxm5Yv86jqEtN/KWL5asvBQ/qw8WgRvxTR2Oqov/47xjjFTJ51jdxAtjKTCcN6JtfH95oHJ2WzSS0DgPAE9kPMrNzCbe70ESnKeb4yxrGk8diFHbs8SoP5nF7FVGv9/NN4ccI1z4eIjizpIiYRm8F8MLO7YCZgrowqpANmy6CRhUsrl9O3nYLZTWq6Imdi+pOP0eWs/eZUn6mnBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a7UfJu9ofOAkKPR7ausynzSHTQEWrQo8iEYVbU2E9YM=;
 b=dCHsOpEfobUokmU8jRL8qaY4LbkavbTyR6fp/SSd0hLEIIwlH+KV3v2GIxzHhMPemYUt6EptTJPTB/SxemmbZrfc+d98akKXzAzBz0Mx/3KGtg49aQ9n5+1ogI143hnoxT91dSNXeyku8i/7N1/w8JqdKQWC3JHUKgGDCVDeT6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8547.jpnprd01.prod.outlook.com (2603:1096:604:18c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.13; Fri, 30 Jan
 2026 18:33:05 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 18:33:05 +0000
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
Subject: [PATCH v3 19/20] arm64: dts: renesas: r9a09g047: Add DU{0,
 1} and DSI nodes
Date: Fri, 30 Jan 2026 19:30:11 +0100
Message-ID: <76a2c78c36ff3457a89dec36df5bc22d556664e6.1769797221.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8547:EE_
X-MS-Office365-Filtering-Correlation-Id: 004bc4bc-6f70-40b4-5bee-08de602e0215
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|1800799024|376014|7416014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/MjG74JoSC0GnSQnbDa1gZQbmaJ80KNhJKh/OIcwNXpGVK43Dyo3K+LSgdOJ?=
 =?us-ascii?Q?m/mr1JngR5KrcF/nFGOI+ddTiRaAi2228+XLxeutfqfdACQ1F4Id7eMT29LP?=
 =?us-ascii?Q?1vmYVC6a596PWJ7FXw/Li1/tuI6Esy9C46dvPNzZBhr8fzbvZaMTMmC6ZiNG?=
 =?us-ascii?Q?BQBIFMIrD/zz5HtgeoGYB/v0RGCJ+c7cpwoRA00ALgEwzpZvdiFEQEn3BnCj?=
 =?us-ascii?Q?vuok4X4SPu42cAfQoIbtDo9g/G8PIbEWy0uGbHvgU1pvo4YZkogNt0KGZ8fZ?=
 =?us-ascii?Q?eckHhh6Io8++ekFByBvICA7UwqiMU7pG/mkhJJVpPBM8AUy3Ei3eQFVUMOkg?=
 =?us-ascii?Q?ofM+XHbND26BBv15Enyoa+b++i4dwugyrY7t9tPe+/kEbYEghLkR/JF90GLt?=
 =?us-ascii?Q?U6IY7NaMdfNaAHdXpmyHjoDLaHS/HACbL6NEQTaiJ1riQwjpflmmb0a0991N?=
 =?us-ascii?Q?qwqbnvCylYQ8ysYmq117L4v3nV4th8Ta1XEla0V5wCxMlW4lBkz9nVbD/Ay5?=
 =?us-ascii?Q?IfCYnFe8WFnVFKKPiCN0PJL6t1mkCKVcxxtJRUFytbdJ9ghxWn6eW39Da6VU?=
 =?us-ascii?Q?bt7NNiX+LpgHswiNMbC6dFnCUaYDqar2VJgRG9sT04VEFzk8OGoIoYh0uv9s?=
 =?us-ascii?Q?zzUAmvaeY2MRjHTBRiTEsNO+R6CGgwbYrUvFYexNo4IhppcpHXuM+WqJy0qp?=
 =?us-ascii?Q?CIPuAarTx2nhxpen5R2x6KgxKLbyJyEBgIe8WXOZ+dkdAxmGSBIxcf8a8kim?=
 =?us-ascii?Q?/5QDK23hLwpqioB42soh0sHS2ZxgxWKYlQarXr+rq+6NyfcxGshrLjqiHrUx?=
 =?us-ascii?Q?6Ic/2k4eItumpokiqSKTJR72lsNFExLw+hL8qTbiBO4EKIz6jNx8uqpmqBhV?=
 =?us-ascii?Q?1eZeAMy7MmHYwARYEP1/27hhc4yRJaYkxH1gdj2siLWE3wdkY7MLqvrxe7NA?=
 =?us-ascii?Q?PnJrDSfNsn8hQo1feg1a+0ldGqCpqLu2fX8GNkCzJW1h8SV1ueOdB8iU8TRy?=
 =?us-ascii?Q?ILnko2Q7hGR2CSXdt+GW8bKu1gnCvPNAWWrmSaElizeXowAKf7lMggw4Z5nV?=
 =?us-ascii?Q?FuhjuLwY2yaz39icEuB83EA5Jg4DUPLXEVKTEl0amUGZOgLM93gIG3FTqmrI?=
 =?us-ascii?Q?+/QnlaMd4naREtLbcYZznii/jeZIXgsL+ZUpL2H9vGJpRvLl5u95LahmtY81?=
 =?us-ascii?Q?DoV1R5UnTQtXU6yI6nl14dJkWjYsluxQ0lSeGsnDEYyefSm+aWGH5T7UHdtv?=
 =?us-ascii?Q?mbdb86/c7gq5PFcSYor449EwFU3xZdtuQnOx9kS8vt3I1eBnldmx10x/rI5H?=
 =?us-ascii?Q?Abd8UsHfJGfMfKfuqzJjTR7HfS3fs77lA+f36+hQ6UwMfRuwQ5na6stM3jrk?=
 =?us-ascii?Q?6bHikrs40zLjcbV3q3i1Ufz996BhNeI582ZHr2OCpGBnq0/N+cYAKrq1KnYq?=
 =?us-ascii?Q?LNXMP1F3rpGhNuWTmWxhaWsFpEdz3C5tZPfeczkmczyQU5q7Y4sKO8hNIz6N?=
 =?us-ascii?Q?ALfTwiOhhIqwBhTHl8Pu6WBPDhOIFle/q5etqhwD5BfUHZC64VxvEZ3XSmmH?=
 =?us-ascii?Q?VxnZvrmz5hxkncBXiNfea1XY+yOSukmN8DQJqRtSpYMpxu8Trqt9KC2+HDas?=
 =?us-ascii?Q?vzF0QVEJOnB/T+zYdFGjAl0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(1800799024)(376014)(7416014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Y4BTK3DD/yw+JoUBZfDMWBbcb/VQjpVriyzl0gJi38Mpd0pbcGHE1K6FvYLP?=
 =?us-ascii?Q?jj7wV6HctjmKR4lkiJAWbiO7XZURmhvvxS9ta4ou34OgmQ7ZUKAEEjeQh5su?=
 =?us-ascii?Q?pWrKiQIUTDzQfFExQLjJ4Y2GkYDvuE3CNCmyltX22CwgJ+d+QYNgn7NE5sz9?=
 =?us-ascii?Q?yOtSjOo9LBy1wgIgH8TEoACrpvfavldf6bcOPRZaGheXwytuC2MY0ga8dwm8?=
 =?us-ascii?Q?Wqx7kTLpuMdYYKTrjR+lC/iPGGmbTOzU8Fuys214dAkhERoM5fykbhckg7I6?=
 =?us-ascii?Q?UDRzha3p0L+XRjjLPxf4eb7Ed6tKH1XFyYRs9GaUWVznQ9ehw18gT5+OBBLp?=
 =?us-ascii?Q?mVu6ZwrMA8I/kSljJljccGCzwJ47n+YXLysTJ+WH+BfvP8ayYjXVf9UHcbKX?=
 =?us-ascii?Q?XczThNEJkJzzoMubGRhHfcdM1Y4smrLnoLQqtdM2Y52EOLu+mtfWSH/qxjFk?=
 =?us-ascii?Q?xPoKTieoD/GwcXnGoz0zrYte5kX41ypKIw8v7gPqLxeKMe5STRjIqqcuY9p3?=
 =?us-ascii?Q?LLB9omAQFzwKj90BK11GTwSn4JFL2W75wRmXnHrM6hHb7gtY01FD1o1Suft7?=
 =?us-ascii?Q?1IXEEvS0cOS3rVhRhg8dxZIR2FrMBDPV3msc1eAOS51m+B3sNd0cP6KDSUjH?=
 =?us-ascii?Q?54sw7HSn8loMtKNFssEWhjK4p9sry1eIYRaNt9NWuVpHp8Aup2h3c3csdVsp?=
 =?us-ascii?Q?Lo6HwHeZ2yfm0NTkadqsIDRfs5nclrGcOThR43RL+cxQlBdmI6o+alAjYQ4f?=
 =?us-ascii?Q?FvPjp+LL4CYf4rxSz8cGoBgfFryT66I+DbrCyoWGHVjV+xKh51oHq9yttCC4?=
 =?us-ascii?Q?+nVHZhOre0ab+yaJ/AI6jvhOc2RR6Qtbj65fgfjRJ+o8xCf6VEyExpq2Ycoq?=
 =?us-ascii?Q?ow8mwmAwebwKVOqea6SMEblotRTOkOgFGq5UbZddmm/h5ZJCoTSjaA7I0Mto?=
 =?us-ascii?Q?UAb8/dQaaRA5fh0gGFjJzyxgZ9iq54VTOksNq4CftWU0SOQecDQ1Sll/ts5/?=
 =?us-ascii?Q?i9ACeCRatQf/RWSC3LqlmsKVm4ep9MEfZH3zdka26cfbgjY35wy3L2CdbfI7?=
 =?us-ascii?Q?aN0qNomdBrnqAxDIlJu4HTcaNUxcUFrdA6ohHJGO0bhKwxCmDI12A7WokwEH?=
 =?us-ascii?Q?PLxOlrQaatoRGKlisB94x+kPeRXy8m5knQL7JYso+C/sE3h7LXrG3PrKNfyx?=
 =?us-ascii?Q?73XuL1AQFLTtvPtBAPv2mdJDZfhKD9HJO8fFs+qfZm/TQ2QjxWid1lBZhTrp?=
 =?us-ascii?Q?al7pVlzNUxrWjWWplKWo0Gfxk1mxGDlDO4CLdMu55l37R0f0DdUWmEhS0M5a?=
 =?us-ascii?Q?c0ozGGnBuQ56cHN6s630+59OUKAtHh0aZwSo9msVnOfpXaGW1aClKhE16T9i?=
 =?us-ascii?Q?fZ10+NwX8irY3pqExkdt4ggyF9CHkkYIcaWXKHLM5NvfauNFJq5eVb4lnE2Q?=
 =?us-ascii?Q?RJ8y2TVZRNicnv32kytd7JB528t0CHNH61JVqVMIKhjXnGBGP81t5Oy87BJn?=
 =?us-ascii?Q?plqu/AegSsuCRg+HjrhQIS+TFBvzZQ7CGs1vwhOGg3eCAfZQ1hFBDn1tETLE?=
 =?us-ascii?Q?0+V15rDdoruMF7pEO8g1l2rajPW5ocWHJfrtbwD9vdbxja+yZ2fjDqNorh/b?=
 =?us-ascii?Q?gAhShGG487cJztTkx2Hphdxm3Ahwvsof8gIprIuIs8sP7O8jnb/BH1vLm0LW?=
 =?us-ascii?Q?6VSwTqfDa5lOKX0skLHQctMhzGhFvipMSS8CZhRgngWbXW5XOpqMSoIn/Q67?=
 =?us-ascii?Q?WIZEbVNZ46HAfPqsJbpEs3yZbed4dDwfosRB9W/+I8mwn3PmsVRq?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 004bc4bc-6f70-40b4-5bee-08de602e0215
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 18:33:05.5888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +prDSLZ9RjXoUBIfeTaYTNmGg0znM66zJwGO5zzRGi4cSfENC3citxbrb0x4pL3VredAsWttOJT25qdSRamOMPs/R0IgtNYEif3qHozXfDVQ3d2tEwOP2Ic5BEr+g+XK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8547
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
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	GREYLIST(0.00)[pass,meta];
	FORGED_SENDER(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tommaso.merciai.xr@bp.renesas.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	DBL_PROHIBIT(0.00)[0.251.79.240:email,0.250.179.176:email,0.251.40.224:email];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,renesas.com:email,0.0.0.1:email,bp.renesas.com:mid,0.251.158.16:email,0.0.0.3:email,0.0.0.2:email]
X-Rspamd-Queue-Id: B4087BDCE8
X-Rspamd-Action: no action

Add DU0, DU1, DSI nodes to RZ/RZG3E SoC DTSI.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Use single compatible string instead of multiple compatible strings
   for the two DU instances, leveraging a 'renesas,id' property to
   differentiate between DU0 and DU1.
 - Use vclk instead of vclk1 for DSI Node and set to the right position.

v2->v3:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 123 +++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index d4db44b6ccf7..46240a6ff992 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1432,6 +1432,129 @@ csi2cru: endpoint@0 {
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
+			renesas,id = <0>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du0_out_dsi0: endpoint {
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
+			renesas,id = <1>;
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					du1_out_dsi0: endpoint {
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

