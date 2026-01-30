Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UD0oBA/qfGlTPQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BCCBD174
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jan 2026 18:27:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C3710E36B;
	Fri, 30 Jan 2026 17:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lP3/czbr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010052.outbound.protection.outlook.com [52.101.229.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 710C310E36B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jan 2026 17:27:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ksiTX7QkcsY1o82DBT2OHKDH62T832Ed+BMav2cUiTX6ogISYUo9gMFJ8EptMxx6NZrkWx1LS37ebF940fBWI6Dr1WrBkCZFyFHknImyljjezWN4sfSLCVKMKGPp5/gNucArK/Kpv4CF0McGSUe2WgX+kYAtDAjSSDfmgQoVr0quOvUtyVQAiF1HfxTHfZx7a2crv/53uLnF1EpN83lOL8jhueo+QIT5JIcXLZKqEJVp7g9CNvT2YCFpNDRKFFe7KHPDItYtEbmC9d5rmZJu6UQqmhhw/pOa7rtZ3GmZlhYqX9F0p4lA91ay6EQpn27z1VZhVVLLg3kiY6wywnEvug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyWv+FY7JffJS5+rY4quotqnCEf2viCUKVSS39yw7Vg=;
 b=ICxErfBNIdtibLIhnMH9XVHMAn9B29DnOmS/L3PCKr+fqb/d0g09yHVVQZWy5JCIiXOo1QcawqkdgDpMiLIA8lyGGlFdVNnKkjzxbXBWyp8gIWIa1cRBiHP/5r5SY6EyZ9xeiGpNmgjT+ZsrT1Fj8oZURtrL72XoyLWyg6Ftzyl+QGXJrRZlsI38hHDaNt7Q1/BhoD9sX5QsANyBf0GRyWtTDjmyJ6O8rCUHkO07kxz1Qw3N8t4eTzmBQGCBobcnXzuPF5UI1J2aJsR6g4gBpRn09Sf4d+/ZOx9TIPFCTh1uKREZDXXDRJICfVpuqId2WM4t7EChpUjvBO/xTmfkrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DyWv+FY7JffJS5+rY4quotqnCEf2viCUKVSS39yw7Vg=;
 b=lP3/czbr6nDhh57L1BhWuTHUCK0Gag15GQtcq3Pb1l8J7CwuEVIUp6TfK1Nt0JUFFfvU1gmkHOZ7ISLRCcpgV584h0LpNSncADlem423Qhe5jqzvn3pH0sIDpoQHnXQMbb7LpEARSWMSfh+giaPuaIv3jU4RozPTTA0PYSr6hog=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by TYCPR01MB10351.jpnprd01.prod.outlook.com (2603:1096:400:226::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 17:27:37 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 17:27:37 +0000
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
Subject: [PATCH v2 12/20] drm: renesas: rz-du: mipi_dsi: Add
 RZ_MIPI_DSI_FEATURE_GPO0R feature
Date: Fri, 30 Jan 2026 18:25:09 +0100
Message-ID: <5ef20dc0a10ddb8ac91667b62eefda772f7aa204.1769789834.git.tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 31b9a1ec-c144-48e8-2380-08de6024dcbf
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X8xLtXhM4arCPX4Y7oHiSSpw2HE74L7LGTiiFoqyTZ5V3mB0SH6DMOJ8a9Kj?=
 =?us-ascii?Q?LJp/4VwcXrZBx0Iw2KY18ntZ0m4dN4SCtgZiXSC1p8bbWzuUrLMTCcJDa3cZ?=
 =?us-ascii?Q?0T+FmWZt/hhqTmE5/OQELzm9F0Oq9p8z0G8OsveS0s2c729JEDjT5xt7ZKcV?=
 =?us-ascii?Q?iXEorfme4dDzE9AQBsaOUKnb1SORjYEUCo+AQRzTjlxYnlFZWIVfz5BatkZg?=
 =?us-ascii?Q?d7btr3FdOt3C74dulZYyLbIsE/kSKNrGmyIZlK3gWb1XUM5AC6F0BrkT1To4?=
 =?us-ascii?Q?qiq5Iu+4+Y4TsPKjr5Gqjssjtyrl++4jHmZ5HaQ9XEPbKoiCfECCBUpksnbH?=
 =?us-ascii?Q?PqaxMUkTzgraGgU+mmR9fp9VVPgoQrd2amJIxhWuUEH9xeT+1RgZkte2+Nj0?=
 =?us-ascii?Q?84V5VfYi1EqyRMXvi1s7oBvsvHux35vvdupbG+qP6pywbaaKa+kbYdU+4tJL?=
 =?us-ascii?Q?iKhFidl3t1l2yaMkR1RdATDewuX8HwVseeofiCQYWD5z9gPzpXXO7Kyqmutc?=
 =?us-ascii?Q?U9Tm8qSLyjI0JtGgSV3VzV2eYUH6W7ctzdgorP1L79DSv2grBCThLEHlgTQ6?=
 =?us-ascii?Q?KkFiJxi/pQaoMmd6iQtkzvr2QYK+FhAOfu2pIoY4llNWgFeMF9rU7bSRrOPV?=
 =?us-ascii?Q?fFPe1w0ERB+pGpfexehGeJofLOCfdKMnnBV3aoFveQSqZvP2g23K6gdqm4Wu?=
 =?us-ascii?Q?3jPEXNgS6gZjyOsQ5Nr4HN5qohciSXGW5b8gk6VuFQi2J1be4Yb+wzNfpSLN?=
 =?us-ascii?Q?gsuJs8wLxoMhg5oRGzw3aTfhk8HOMylNvIEMKQu/nugE6IOPllNDhUuR55zT?=
 =?us-ascii?Q?2+74qk1L8Du9I7A2eyesGMlxJfn0j9vGAthsqOMvItzlEHv42cKPuBCFoB9n?=
 =?us-ascii?Q?IXW3DrzJZ5CIw9KaU0u4xu45nG/I4tpVOwVm4nh1Ne5GTcao239cIhaWr+mo?=
 =?us-ascii?Q?gsC2wOxNwz5Oz9wIQZxNvoLyj7FzJbw8RgDJRkbWMltJGY5qzLQrjwaAY/OD?=
 =?us-ascii?Q?DYjybkC1zv/xlzIO77HgmA3M9xhXd3j2taOMUfAxos50L+8mx+cRpObTYUKn?=
 =?us-ascii?Q?OBBgiTrqPhePSpBtttJoj9G/ScAi2hXQCbKGjUx0wmtwlZloPpTTJtr0QHkj?=
 =?us-ascii?Q?ULet45Rs25zPwz4askfre2cefpkYKUONkbpJJrEna8JisBXyvVaPNqQ/hOue?=
 =?us-ascii?Q?0bDzaDapxCeA0RKe4MbKjbMb6fmlWnL3nR8H4es67CnzPDQ76F46GfBhcU3b?=
 =?us-ascii?Q?c9b22wl2ddVZR88iCW3AkQez0Bz+l/AYqazyakGpTazp/qzNA6lIyq4IvBqf?=
 =?us-ascii?Q?o0nUOKMsYg8BCBG1ajOeuUSGOSuGCcPGJTzd9sNAY8631xlL8mc+XGXqiLkp?=
 =?us-ascii?Q?K2wH98TDNFb7ufuYhA9ndJpQYDk32jP2CefKC0t6/ymgBEB+4muTWqI4KeTo?=
 =?us-ascii?Q?2hB01bGGPKhfZEfFBcBRRPp8qp0kgb4FzMNcnqyIHnoNxEZgyR1x8zlPgt8g?=
 =?us-ascii?Q?PBH+gqJgRmMDIrHrZ+bk7DtM7ZQVNrn5vcVIP/vg1E6jcBmlsIbtaf78DfYB?=
 =?us-ascii?Q?ZrPkEljKk63Hs4QnmOROANo3UpzVhZbZ/JmrrcMh9ES/lI1YgujnkNkIS9Vm?=
 =?us-ascii?Q?EC8mp6QGvitFN4vHqRXkPs0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11947.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(52116014)(366016)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Am4upnPg950Dk6f0e9qVBvxFU2rob0zvcsBFONBGpI8xodpqTJjJk4KpPKOu?=
 =?us-ascii?Q?fq+RdY6MR28QN9yMXqOGHgwsiAjWXPPIAYoWzhusk1UnBLIs/whl5q5OlS08?=
 =?us-ascii?Q?mYMghBFowc0hXdm6MotdDEfddi0wcChEZqRr3lSROtQx8FmwEfGf8TqMO9pP?=
 =?us-ascii?Q?acgSf9dWDAdGMmOBr9+pKYJ7Q/rcnzvwWIs0maDaU2lyXfwqcgMyluwSUGM9?=
 =?us-ascii?Q?j9VkxV+Nj7QjggHx1ojRITmtfKfebcB+ph4UpsJVhcaTbrvySi0aDOseh6w/?=
 =?us-ascii?Q?pKPg5XO4p2QqMxWL8w+yQK7pVJK3M/b7y2/NCVhidYzTdqu7xwEbNleCVpoo?=
 =?us-ascii?Q?TES2b2txozEyvL4lH605adHGllUt2dClpnfXlyzwj2zzsjRDq+etD2fvHaOH?=
 =?us-ascii?Q?xt2byWP5nCI70DK+3MS0z/v644cdvjhAwVt3hHVgiVisN2J4E64QytdGb/ct?=
 =?us-ascii?Q?/4fbo26nfvzgsgL6L6FQt0jVCUuGHkZrtO344klYq7pip1dBCi3Y57/GtNL6?=
 =?us-ascii?Q?VfeLDtfNonPkA9nobQvbDJrkvHOUGh7S4QJTKuSFYmOpn6/SRy/UR0BrsQUV?=
 =?us-ascii?Q?gLX45Y+smO5vDygHp1WRcvVnmTsF9OLWIaXq0h4mMniLDF/8dtWCMmCuY7D4?=
 =?us-ascii?Q?VdaoJnrszOX/vKJcmVO1VQY9WrKiHPQzxcU4emdkRAgo2tlag5R4JrtjTzpN?=
 =?us-ascii?Q?xUYY7Uc8axrwlufy3tHfYOEVX/sb/Zw7fAleAyRkFNjvilw1Bd2CBhLdwEUc?=
 =?us-ascii?Q?X2fRQ2LFUjQX+IKr+NTc8DwmlRhaCmJRvvvBYouKFomf0ZrSeWK7B7KXCk6W?=
 =?us-ascii?Q?Ctr8gn2MMQDS5xgnwulJwNWs/skjGPzGRmgB7Pb508svqcIee7NX+06BQl45?=
 =?us-ascii?Q?2awnSrox5j8HVA1cpO78bDpDodQPm5gH3j5WcRa5K431Seinal3TxXiff/re?=
 =?us-ascii?Q?R1G5dfcTKMkuO96y5mDkHhxK30yaTZEepzZJcIqAzSnqctaT3MtXuIMSyE9K?=
 =?us-ascii?Q?SDmTSVpe2Kl8hm/Hw9bQdvuVglXxvDL+TuyDirRhUTe1nXTf0jNDYmO0uFG5?=
 =?us-ascii?Q?lqHOLmt704+xbGbKPmd8dkMTsAYlNJoiNZyWEW82DuvtPVUQNtNJMcnnQu7j?=
 =?us-ascii?Q?rljgRiUiDuKPYPmLdYk/u23SMcpOXFVmqKBpLBIi1/1aeofisz3QiqYNXm5O?=
 =?us-ascii?Q?dy/g2xhN1GxYv+lJNfJoW7yVPWz0xdn1yCJG3Dm86awwEPy5y8U6Nm/95oiS?=
 =?us-ascii?Q?ukfqiIMVTq9N/C3KJNx31weB1mOf+woaOYRs5mbroqXklgVURisDXFqxQW/u?=
 =?us-ascii?Q?lgl7UW3naVXTQOSi9YMCgWCcHB+z7mbYVtPWnUAoB0M3dP5UbovqgUqCTrw7?=
 =?us-ascii?Q?D+bJd+u0TuqAqWnRVIpImTRyuuwzJAqcmCEvuJX1jxJ520HFyrSOvKh9n9I3?=
 =?us-ascii?Q?4isP1y+c127Y1BftCvmPROJ2frfWAXaM+hBhgk9jMEp3UpBGqq42D65cmT4/?=
 =?us-ascii?Q?COyGRiExWRh3d35Cyxbehx3fUS/Z5d4XVBDH3t5zFnNzP/pDZTUBpKoeP8Kx?=
 =?us-ascii?Q?qToYRmfozq+sOeVWeutcThgku4nqyRv6IO8lcKhAEIzbfHODhgXg7mSY/cnx?=
 =?us-ascii?Q?Dt8Q/1mIWcmwHc6W6jeElZ5PvQ+Ko4vFDC44gLa3/5e/rD+Nu5nUKwvsA5WX?=
 =?us-ascii?Q?EQAG8AXnQQzNIx4eo+67FkSYhU7qRburg1tIuz229btsuQRd/EehsZSBEMI5?=
 =?us-ascii?Q?HUn85mykKDK0RTrWH+NIVkE79nDewqjY8oEBRIAxRRtAksaFLeso?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b9a1ec-c144-48e8-2380-08de6024dcbf
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:27:37.2897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DEPSCt36spBNkmB2CKCvv0nCIwNaDuMM4/5AkQB4dOZuEw1j6cJrIA+3iAipgSwau3ByYDNZYwcThrjn6rnamlH46IpscQZyVdeMI7pmO3BNRmoSXVmiCLaA6QPJLIGA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[bp.renesas.com:mid,bp.renesas.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,renesas.com:email]
X-Rspamd-Queue-Id: B3BCCBD174
X-Rspamd-Action: no action

The MIPI DSI ip found in the RZ/G3E SoC select the video input clock
based on the DU instance actually connected using the GPO0R register.

Add this feature to the driver using `RZ_MIPI_DSI_FEATURE_GPO0R`, update
the code accordingly to manage the vclk selection with the introduction
of `rzg2l_mipi_dsi_get_input_port()`.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
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

