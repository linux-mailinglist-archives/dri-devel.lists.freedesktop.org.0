Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDAsCQCSgGkj/gIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:01:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2F6CC07C
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 13:00:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28FE410E49D;
	Mon,  2 Feb 2026 12:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="U1gUmWz9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazon11011004.outbound.protection.outlook.com [40.107.74.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC4A10E49D
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 12:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1AmLne9vNBHOu5KvMwzfdorVFd9HzKwN+h9mHMak1wlo9RyzviKefJt5GcQUmRoraeY6QqaMr8ZdcRV6q/qPEra6BxQLwbuTJ6b6gTwhYLK7u8V65C3Z84MAK6e9Efm5X0JaEDVr+wA0PVvprZ3tFTCnS3s/osY7D1FnHxiyPdYTKsLPMJw4KcW+p2dVxrqUC5tQ9daQB0cV//OGnwTgMKbcOq16hcg/JdPp50pb7ux4LWsPXqVtkBYwvjVyxcA8igWvMBmbXQgAHg+VYQA+EtBK3qA8225VP/pFCPlSKl+OtAflsoiACvbLBJ2y6XtKZWmDFqilvnG2wM+1nwPug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q/EbgttrBmyEv8D4cRL6NSYQ9FkZkzN4cQWPuYcjJHw=;
 b=E4ngtynZ5UgIaQTGJWCC8XNTAJCfe/CCEor1M47VMhSs20kp5fWZLrx18BWQCn0JQof1vWo2Wg91zsWVdB9UnEgxczI+QsA5fMS08/BF30/mMbcPEyUaDPlrKWLWqJai7aVpiSQBBs6HZYTJNXxCljyVVzGmzO4c1KZl9b3bDfguc97RU0vWcOgVbEEJu5ocKe3hn7VZZrSbeEVuWDQJuCcQHWEs3xMr0e+ccW+7PcZI7ufYF4YTc/N/e7Fho2+OUpQ7LK8QqZPP2zF51RViRo/Xk8Fs59YUIU29bGwWHWh47EUdiXcnw6M8WM5398/htsBhFNDrdkALhYE324/bnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q/EbgttrBmyEv8D4cRL6NSYQ9FkZkzN4cQWPuYcjJHw=;
 b=U1gUmWz9S0pOzYfcqmeW3a3/qxWmx/HKBZh0FnDWMauOF+CxhMWZMK7gzD56smJbrmiem5sc8Xuw9GWMTWnNqWBt32fRBuJrEAQHznE7x9Yyqwonz43ONfboACHoXAXn7BRsLqnApKu6XtbW+6RSoO4ouDfNCJD4Je7hrTob9QE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSZPR01MB8632.jpnprd01.prod.outlook.com (2603:1096:604:16c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 12:00:53 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 12:00:53 +0000
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
Subject: [PATCH v4 17/20] arm64: dts: renesas: r9a09g047: Add fcpvd{0, 1} nodes
Date: Mon,  2 Feb 2026 12:57:48 +0100
Message-ID: <b26281237cad7ce83680123999d744a4b619c924.1770030493.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSZPR01MB8632:EE_
X-MS-Office365-Filtering-Correlation-Id: f553d137-3cfc-4a3b-a871-08de6252b75e
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HhRfFtL74TsV8BO85UWjNOOV8+Z2YuP1kbj3/uOOfdpL9k1uwQIJHoguQ160?=
 =?us-ascii?Q?NBO5WeR19bLp9XeWpkSXsES8bFKEPxse9Oc3QxnIKKQv4YUPiFijHDFoA1bZ?=
 =?us-ascii?Q?UqhxDwxzMm8a+cAda2IwffjFJMq5VeTeQdgq1RfX9Ud43VD1yxeNRsoJYx84?=
 =?us-ascii?Q?M0ZjqPa6Ff4YTLd+OMLwMtcAkkfKY1K87t6ZKDLKM2QMcyi2uZ3+MY7HJAF4?=
 =?us-ascii?Q?mGGGAf8EspovawMsjFnVrs26JhlYKJ/0T9kmAvhsmsrbaBLT17CyRcNbF6Dv?=
 =?us-ascii?Q?tGUQaKCDKVACppxoiS/xPMr9xUWGpDautS3TqUjaVtxc0T6yyPKsY9tk7q8z?=
 =?us-ascii?Q?YGXQyhCpzeZDPtGyrIaZemOUq8hcZ4gm9X73SZA3oODxZE3DKh1tVt+d675D?=
 =?us-ascii?Q?E1mWi5PKiwe5av3Asw0ipyCsXMOHWQhaG6j1Z9OglFPwoY9dbaorWeD1P4Ur?=
 =?us-ascii?Q?K5EBM+Mb2fp76GS3gS43PmMCZm0+OrRo+7zAA0y32iaJkLCDfPSe/yQmIMKD?=
 =?us-ascii?Q?FtxCv1NXzSjhvEdngKTrmygilNx2HQA33w9Scmw00hg/JTju2Yk37xp29dk6?=
 =?us-ascii?Q?1Eb8Jzj9YitQOX0JBQ7xqU2JUgZxmniadNMGjrzQZCN+swuvDyhudGutSbxN?=
 =?us-ascii?Q?nxowUY19/Vc4eAslsYpkgossemPKPNhA12k20wsKS62D1QncWdUxjB5H5WUH?=
 =?us-ascii?Q?WmulC4x/+evfJSBt655UbO5XG2sjqi5j7PWpnHT1c6+dyRWij52FMnmQNN2g?=
 =?us-ascii?Q?bGlRTARlZxuyB1DPx2lVh40QCgjNjyZqYn7wSZg3x8w9XtY7Fxc1QY4xWaI0?=
 =?us-ascii?Q?XPI6eIeXxx6gs8Ndosm9p/QUytJxbm9olu73xEhi3Y7lRru64LO0ZsDymnFr?=
 =?us-ascii?Q?M/p9zKl6kiRLQ3oZXyhp7R8gFO/UcrYY1FOciXQcNFAPL683Zwqv6jwGdgZ5?=
 =?us-ascii?Q?/zLfyTw834Vb952FIl9WOCZoLMSvxjpalJ5qbIJ7QltttHpGT4eqMSxEb38d?=
 =?us-ascii?Q?D3/B7TIn6J2SFigai0rfuGP1MjgVHb8YB6IH+DZH2UZSF8rzvthbTPoURaPt?=
 =?us-ascii?Q?PCEyai37jpsWFfeS5xM08461xqDuPM92X0RxrNk+AWoYBbUUojKfHsaiRaOu?=
 =?us-ascii?Q?6yQIsR4qQnt0X8iZuRliRDTrMviitDPCyyXcohbAg88n5AjNJNkhGa/2Jp5z?=
 =?us-ascii?Q?7ckg10Z7f4FMT2B9bupI18oJaKfaKBPAOvcDE1z42Bu/lbqYcSeTG5k4ixhB?=
 =?us-ascii?Q?0vU6Xw5uN/BwDepa6cZ5fskO6W6wb/TbdwksXowaEE2CHgu0GM8TZnIuRtbc?=
 =?us-ascii?Q?OCFmYc0BvIdc4PI63BUe+XHSfJttHuCv6OXUj+dE1IhWJc1FcrtXWkxpEpWR?=
 =?us-ascii?Q?FgnJ2LkNKeJjM3YyBJjRMELs+kXy+FTlMq7JlfdttjqBUHw7dvArRgf4ys6A?=
 =?us-ascii?Q?AOE8inHNnIbI8+TH7OOErteH8+PKrFl2YzjxSwDC8dDQXWP7WZiJCxYcm3V4?=
 =?us-ascii?Q?ac6eYyHr43eagnSUdOwI9nxWSYBOFPz9uAFilLSRVOywT0xLLoKdHcgwvW4H?=
 =?us-ascii?Q?JphIbfGHBgqAG+e19BJgmFqoe7nMsSLJnS4bE2RafucdqQ4aGBJgvi1PtOQz?=
 =?us-ascii?Q?qJzceOW8xn3+tKkDPMY6XTw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0vBvQwEDgePX0z8iohwIMtGbrPsI0lVhejPhob3eFZzfH4SJR7wj7ff8n/pg?=
 =?us-ascii?Q?gKXGnuFT0Ra84PmSha/YRfQm9d/RzOd3bQox+5li+Rp8Sd1vDD1qTnCL2hLb?=
 =?us-ascii?Q?OyQIY+KTCwhFBT2WsYujrzceX1SYaG5xODmBXniVvYtKTSObPLfT5LQI3+wF?=
 =?us-ascii?Q?k0BFa3LeZO168PFbxQg6nOayrt1IWIvcSCbFIkQ/KXsUNmu2iFaPYWMok6Cl?=
 =?us-ascii?Q?dITCNYdn+nIXUXj4TT9mSp5m9tKNtJL19Wz8TMcXX1Gtt+v6IlFY/0Zfv+jB?=
 =?us-ascii?Q?ghgGm8m3THUlqlSuvsUdyicdZ0irrSr4YiUy2FUIXB1IfByheftSTW62dck3?=
 =?us-ascii?Q?ehpgPlWnOanWpr18ee66VQcEsonsAIcSkxfz4bWSLbWalWTTQeUx88nZwgwL?=
 =?us-ascii?Q?2AUUMgmmXhUugXV/jRRdmJJnT+4GscI24YHREohLp7xuG+69325qzD74aZr6?=
 =?us-ascii?Q?Krd7wt36+xSGCO48en9o1G1yPGcRHiiDj19OOyacukW3sNYtpFA+btcNuIqh?=
 =?us-ascii?Q?ye0zF1kwGvYD8ko1AKPKbHf0iAjxy5JnM07oS7cYcWt5wm4OHK5SbmBNE7ku?=
 =?us-ascii?Q?U4SIL1GFM3WrEIt4rTX9zVYf44eW7QJml7uzKP3GSwQVAICgthbXdzzynwwe?=
 =?us-ascii?Q?STt2JRBBcFVgwTcqQfVmt+HmYXC77p5L+EztTQQ8FwteYdyZkCFSBt0JsiA/?=
 =?us-ascii?Q?VZ6adQm1Rh/WzXyKye7dLRH77DvJ98AouG2Ypp4x14eiPlKaLyzCkoq/Ge7N?=
 =?us-ascii?Q?nOVno0wFu1aFtf1H8C1Ie9KDcEH9h7AVc7a7m9A5q8HNjCw3WJmVTAkVVQyW?=
 =?us-ascii?Q?OnnEIUW84jYkXpD+wChqhaAO8O0Zn8MXdOjkInGexSxh3wHYsKUa7gATE6eL?=
 =?us-ascii?Q?69o9DrnXtWD+lAGRB2aliUXROZcRbPm3ZKwJJyJfPmrObvdZPsUZ3tK0Hq3B?=
 =?us-ascii?Q?LkpPlzZzDfrunxQP+mh9WFPrLIe/CuXVhmiSQtp5eCGL1G3NHhOf3oXo/vK7?=
 =?us-ascii?Q?x4EPAsxsG361h8TTdFU/lST0j5SxOo7uXdzRlglq5iCJfL9o/35UZgWrf7jm?=
 =?us-ascii?Q?FQhlCX3FhWXRMSmtEfDZuK6pAdliDeP1qrJtHYVqYGPJBivD2m0p4IRB764z?=
 =?us-ascii?Q?TeHrqmT70hxoSzfaMsfXXaQfzOz82akjJoEScwyJQDJ3lxi4tmwfFLtOjW83?=
 =?us-ascii?Q?KmlOA8iRxDY2Z7zMb3SYxAiu+s8jVRDNHiCZ21fLWNcW7rmsTmgbxO8xtQ1H?=
 =?us-ascii?Q?oTzzEqk+255ybjvJm4VoSKYl2uavmw+ztIvc68iRhsPcyt+foNgi+moILTs5?=
 =?us-ascii?Q?a5Wn99ElM2Y3Mi+gq4/O8HAXKl4SXaUE660HJDOhhi1iR+wcmqKD3bps1bOb?=
 =?us-ascii?Q?gNTVroyZqMQvFDnKgDnVoiTbtPsjzexPKZK47wpJi6QzVo49u3cxazGmiLxt?=
 =?us-ascii?Q?WeiQ9er0O9pG13SYlpK8IQSq8CvNOoXWVaXczRFy8U16cz9Bpa1m8jxxkW2D?=
 =?us-ascii?Q?Pb2wpc/SnVcyq4Ysnb+LtS1U+PyDjjf9EFNz2rUGhg+eHbgfBZHk4aX/NGZN?=
 =?us-ascii?Q?kjbVkP2SgSpRytz4Fhn4cLDvhLWWn1KOoAXBegrKbW5o7K87wxZsQNR1M5Ts?=
 =?us-ascii?Q?GrPj2gdgkFa7f0jLJ+qCJ8NT/xPxEeZbd/XAG49mLAdaKH3hPu7B7hn33Njc?=
 =?us-ascii?Q?rr1PWopsJGCfNEf14umwvXSN6UgluKatVapRzoLlGWjaOcehb2ZVGftVTDtQ?=
 =?us-ascii?Q?fTLuUjbYFMqfKJxgnrBMjPBJ76DibwrU2BcCBBcxNxooag9+N0yz?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f553d137-3cfc-4a3b-a871-08de6252b75e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 12:00:53.7835 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1/Ov9ugwif0ijVV0Wk/od7izImA+FYhiwZID1xtEYE6Sstc1xyZrdzLyn081LcAu4zy1M5W25QuxaDVOyL5on331MkdOi5wh6BqiAM1G05gSkPXI6CBgcWnxtvo2N/s
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8632
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[renesas.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,linux-m68k.org,ideasonboard.com];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:tomm.merciai@gmail.com,m:geert@linux-m68k.org,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:tommaso.merciai.xr@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,bp.renesas.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,ideasonboard.com,lists.freedesktop.org];
	RSPAMD_URIBL_FAIL(0.00)[164a0000:query timed out];
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
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[fcp.0.251.79.240:query timed out,fcp.164a0000:query timed out];
	DKIM_TRACE(0.00)[bp.renesas.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[glider.be:email,bp.renesas.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email,0.0.0.0:email,0.251.79.240:email]
X-Rspamd-Queue-Id: CE2F6CC07C
X-Rspamd-Action: no action

Add fcpvd{0,1} nodes to RZ/G3E SoC DTSI.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
v1->v2:
 - Squashed fcpvd0 and fcpvd1 patches into a single patch.
 - Collected tags.

v2->v3:
 - No changes.

v3->v4:
 - No changes.

 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index cbb48ff5028f..c90a778250d6 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -1431,6 +1431,30 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		fcpvd0: fcp@16470000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x16470000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xed>,
+				 <&cpg CPG_MOD 0xee>,
+				 <&cpg CPG_MOD 0xef>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0xdc>;
+			power-domains = <&cpg>;
+		};
+
+		fcpvd1: fcp@164a0000 {
+			compatible = "renesas,r9a09g047-fcpvd",
+				     "renesas,fcpv";
+			reg = <0 0x164a0000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0x1a8>,
+				 <&cpg CPG_MOD 0x1a9>,
+				 <&cpg CPG_MOD 0x1aa>;
+			clock-names = "aclk", "pclk", "vclk";
+			resets = <&cpg 0x11e>;
+			power-domains = <&cpg>;
+		};
 	};
 
 	stmmac_axi_setup: stmmac-axi-config {
-- 
2.43.0

