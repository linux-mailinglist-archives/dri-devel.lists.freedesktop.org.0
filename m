Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A9B95AE3F
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F20310E786;
	Thu, 22 Aug 2024 06:57:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="L2vtRa2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5935910E786;
 Thu, 22 Aug 2024 06:57:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y9nzaM1een3RriW6cErukzWBkCGweXkkHfAMpPrIp64utuntSb5Qfsnk+4AzyUCdatZ+L9BmGQPMmoEv5zGYhG732u/6/fvDmePE1D3+pYaZkgMmtMG7CfG0eslxyqS6WYYYH9FRc7S7DvicnsB3GJQW1YqO2/G8NiVpYvsp5igpIeqm+MBNrCuASWP1xA+zji9aDueS/V0v4F7ubJC9K66xC33GcqFJm+sPYjvD8nKC5jSZTgqMRWORwOZUsLNFXB2ByAn0iX6NXNB9Jc7wvGMQIh+xFFTSDhuobhQEuyx3GD2Si9TaNqOxopcPRCxhMYkZUSe95T+O0vZ1YYLnBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=isOFzB0LaCwzLmSpK1hFAIE3UQixPWXBVmEH+aNVoSnoWsknNQzjASUeZ+4anklUxdH+g5hLS+ZS62tsznYkaUq5U8fzig5uj0vcHwxkeIljpzlQVlrXWTvCkQ5zFGPuBFrdR5W9VIJNZ7qjgApaqVG1DM7pfscqkRUAl5703EzFu7u0GAyyqMuyZom4qaT5vVaBN2Uxy2CkAeZJbLGOSz2Ug9rrq0zh5gfjau8oM+wRqbGVbkpWT/ZRYAlSXDqkKQonUW0BFcBvFOIeBycTgk9FM5anW+h1VKaMpQDC+LAH6ldLZHs4GncanasIxo3QIcmwU7cvOfJ3p3x5WHJd9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=L2vtRa2PrVl/Z80s2FrtlMIWeEFPubRXW1ZNnDziMt1dJL1DAVz/ZCg2PjYjNglC0YZ2PMBs9SF3i06Z1rDEfe6gJ+nqVHtDc/OYn4ht8vCmYBOBb3JWk2LHWfic3CLtXkKdxMQXftftD27okF07eHlviXp0N/sdeTNCdkfILCLYwJ55G2MQh18GeYmAiDph64UKorjHmkSdHwmTzzezN44i/tEJ5Bfyrg/+NFYv1h/ctfWCVt/tjDSvUiGeMF3vD+8whUz/sROLL5AmN1t0EaujWkteC154AOCx0ZwqnpFi88zKWpwftKk9YZoYgctGiK0oK5v4I3c10OHgUmIGjA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:57:37 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:57:37 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Dillon Varone <dillon.varone@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 0/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:57:17 +0800
Message-Id: <20240822065723.1336181-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 22ba9d19-23b1-4f8a-9594-08dcc277b4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PSwTcHIVOT2WPsU5neQwPzayIywFmvoYfMv6QKKVJ286VEU1AMJj8F6GtG+M?=
 =?us-ascii?Q?UUVGw2KaRj9lH640lCj4Fntjqv1rItRQ/RYhISoPtbBq0qLAfZyBFc1fvzjY?=
 =?us-ascii?Q?8FcDUMJFedviQLIUjYAwOqGVmKg88H2zQm8wIdN4NnuVdzBdwkM6T5SWotfw?=
 =?us-ascii?Q?2cVYnvgOQVj+bRtVkpnixK6Wwlg3x2u+aI5dfEGcs2l8ndaagUWN5nvxOdbf?=
 =?us-ascii?Q?RWylkMzyU44t2ITlXPvgr7vPBryX8WmvY7g1Qo2W6CEJ3qPQEu+F01Us18Nj?=
 =?us-ascii?Q?INJGwlKOZU+6oPvoxN9rqhTMEuClxFoaO92c9rtMkK+932BmEZuAfoe6udZ/?=
 =?us-ascii?Q?fSKZXCTkmtnJUFUGvYCWsR45ujYypHZ4ACs0bz7hSXDA/sRBrMaUohVkL5N+?=
 =?us-ascii?Q?LjUVO7dPOl0zBwvm3as1QuqfA2Dka7bGxvFUmfyRtF5glT2OJsIKTG20i5t3?=
 =?us-ascii?Q?/isOi66WzqTYtr5sY9f73IxxjahQtN8PwEldJUoVhYDbldaodsoOzQELSN3S?=
 =?us-ascii?Q?IWElJT/DAcwJoF40aFbu+AC1XynXMQ7KaX1tCng50yXjOaz5LrCCAsxb+ZJx?=
 =?us-ascii?Q?vitMSHagWwmfDUpZor3djMs5MbVfn/X/eDosybFAjqJKF4zSrcp9Q+9Jj0gy?=
 =?us-ascii?Q?bkFHglwXJT2LGo0JPiaL59XH7gU7Keztz+GzvoD4JqukoGY/OCdPE2bHMmG8?=
 =?us-ascii?Q?+H+ZuV96K1DmZah9FarfIypOaDC4/w6b+Vysqh8mtyazMgToM5h/0kubWs6g?=
 =?us-ascii?Q?nVmgx5C9tpo179Hf5z5RW8hAMOKt5QWR00aXfBti67AnDzeJ98D/7rbxLiVi?=
 =?us-ascii?Q?O5Z7XaetQhZZ/JwZoKt72reGpjdE1F0W+/PzAUTqiTBGElowfgP6wlwhKuAy?=
 =?us-ascii?Q?1xGcyJgY0/7TKtfWS5TLUbF3eCgQXqIiOb6K87WS0wgaGeEzCOxST7mt5UxH?=
 =?us-ascii?Q?eT/fyie5UDe4Bw60y51Jh5ZJXpOlnQ7s2TI58HT6oRW6Vxo6UWXSO3uqtj0s?=
 =?us-ascii?Q?jHjkwneWmCqZSlalTrHOJbAoZ+wmt2WO8ICvZIGmBn3YVlpnvnUreOhefzbx?=
 =?us-ascii?Q?/Su4fqqNasmBzx4Cdzjf+7s4v+b3oNC7nFI7PDerxZaiGecU0CuFZ3K2VR+/?=
 =?us-ascii?Q?cjma4mBinhwTfpP62xdQgo1jQieKCtyl8jRB6TQbr9xNMq/wnJI3IFeW1G0l?=
 =?us-ascii?Q?PTdejVjUv80MCPXAtwd/ERts+9fCgAFNOluQJCp96cWjc4pVNS+R4sRtILJB?=
 =?us-ascii?Q?ihZ72CgxrqKbixTDVvjwHf7Li3PUhT6ircKZvdvQa9QdAhNpglr4gasBsb56?=
 =?us-ascii?Q?rUXiPP8Yj2pIPpU0FZYczxd4zV84COBY762Uhk3w6EPomnBlHk6SKEmXCyOl?=
 =?us-ascii?Q?xa5XJrrdbjbA5jh+LGKYVBaqEHMRu4dNIJ+VKu8/dlbTNBh2tkqAvCorZ6+D?=
 =?us-ascii?Q?8OdaKLlGm6Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEHJOz1Q84DaQS2VJh5yWKQbu0dj+AzzffFn74hJyTdTeBNPDqx6Gxryvc+G?=
 =?us-ascii?Q?98OiHW/qwObLatPnjSMV7NxkQ9GcP24c9y2WAzs40BHxHOCw+ESxQU2G3iMY?=
 =?us-ascii?Q?EWdFqZy/D3U5MSD3Ff0015DuAbp7OKeJcKbkfHRvqEV95s66fAjIGVfnQP26?=
 =?us-ascii?Q?uZD9v7caaouSw6UKts4Uo3zj4Qp2xYSd6srZhKhO50+NVSSqQNzIgEFMuzYh?=
 =?us-ascii?Q?DvxXaRL7sQSSEu+mkuKYUarYWDaPrm5+C3wKPYlfWF4e6lh/vqNa9nUWcMt8?=
 =?us-ascii?Q?wGJN66bx7rP8L/+N5BR7QaFH5cRd5cYWdKUJ51EcqXMzEobu98dtRi2bjmI1?=
 =?us-ascii?Q?+M7Rh00xG1uMUyKK+bh+uWPV79BOPKmcwB0Dvzz+LbOFNDBlcQss82N22P6r?=
 =?us-ascii?Q?iIm4yUXQM2wLFvdy2HgtnCfjhYhzN8jZy6hGvAQy0/Je9UO1zxzJWluuGxnf?=
 =?us-ascii?Q?V6b69p4FMxWEDILW/+8DqQvmrYqvBy5kZfNzue58iVzSgsJwOviHV9jkApH9?=
 =?us-ascii?Q?acBygQSdbDa5KPGtvwkQtpHvVH5SpdmFZzUflZJig4b5dR42gnIXLCm8FPT4?=
 =?us-ascii?Q?p1gV1KY2lHhJWMg39m4UHcrCiCkziy5wXNwC429CZEYbQxSX6VYli0EdVsmh?=
 =?us-ascii?Q?mCixn35VZWvzvscAwrCekUmzElHsShvxwkIUiZF51Ba/Wujz61nLUyfA3tfh?=
 =?us-ascii?Q?Ic7/K0k2uEVEk56AtRY/K51SGDB0Y2PUv4jZ6V/swWDUHxHduhbeimBhchDM?=
 =?us-ascii?Q?qIj6ZoOII1JPR49riG/mjz9xNuG2wb6c1Zvh3kW/21zyBxxdsa8l61u3dzrV?=
 =?us-ascii?Q?iKeQ9M6VbCTZWBqFLlUnF+jWhkj6vNiG0BQgHeCyNhKxPokONmlaZ9g3qVLC?=
 =?us-ascii?Q?VEUuKkH5NE36Ph/Y73i+ZdAh8VB093Vx+vWWZwRWYEKXBpM7/wtkUyrM3/TJ?=
 =?us-ascii?Q?V1PGRencaeJdRZCtsawxZSNLX3n/nBqTKfavbw1mSIxKIZ1PRGMJA5J5MGa9?=
 =?us-ascii?Q?CJnTMaVcavef9hRr6cjDnq+wbkepKL0MRC9txfjNQvX6m4o2wQUXouTHOFfr?=
 =?us-ascii?Q?aiPvh0D0wYDAdfahkp9f50PIFtZWpRF6EqJmecWgnjxp2nIBoUIVL3dvphHg?=
 =?us-ascii?Q?c2kEByjqbzF5FnvXePiyVmff+P7KPjJbk4oZ6imaS84gxV+TGg3lFc/FX+VI?=
 =?us-ascii?Q?TgA+Td5F6UMTRQrTAAPvnR/MFrjD+hxlxa2PjRtVwtCP4jH0kfH5+CofHgkP?=
 =?us-ascii?Q?EjGURP3S9zJXoAbcYMoVyk94VEV/4pkJewtSdoFdurGJStvfFI69yR4ZQ2J7?=
 =?us-ascii?Q?S8qdUtjL5kqACfigdx59qcthTiw5Xiq0GHr4B/B+dRMcVRiEyH818Li1vp8I?=
 =?us-ascii?Q?1c9xVoDyjpvG7c1yAfkyNqsnim49qj3q1u37lY51AFz8CZ6ImjSeU0QEkUc7?=
 =?us-ascii?Q?ggdcY542d08Jf0ejLVx3HrA1qQBOhdTDVhAkNtLnCu939kamhQwvoPidrMJS?=
 =?us-ascii?Q?z41dCzN6cyq46r46iQySIuEv8pgGACiPDnystrPisGOw3Nglp9vN62X7pnS7?=
 =?us-ascii?Q?PL6fExeoe8y+bk1eDE2xqxQNdCgzT/HPcNPFAFiu?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22ba9d19-23b1-4f8a-9594-08dcc277b4c5
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:57:37.1309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJ6x05zSV/4yeLaUTiGvwM93b33sMzMp7Legcrn/WM3NXEKS1P3G1ejK1Eo/h5yYg3Uyq6jPAZsuS5W51zEcMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5982
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

*** BLURB HERE ***

Yu Jiaoliang (6):
  drm/amd/display: Use max/min macro
  drm/amd/display: Use max/min macro
  drm/amd/display: Use max/min macro
  drm/amd/display: Use max/min macro
  drm/amd/display: Use max/min macro
  drm/amd/display: Use max/min macro

 drivers/gpu/drm/amd/display/dc/bios/bios_parser.c            | 4 ++--
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn20/dcn20_clk_mgr.c | 4 +++-
 drivers/gpu/drm/amd/display/dc/core/dc_resource.c            | 4 ++--
 drivers/gpu/drm/amd/display/dc/dc_dmub_srv.c                 | 2 +-
 drivers/gpu/drm/amd/display/dc/spl/dc_spl.c                  | 4 ++--
 drivers/gpu/drm/amd/display/modules/freesync/freesync.c      | 4 ++--
 6 files changed, 12 insertions(+), 10 deletions(-)

-- 
2.34.1

