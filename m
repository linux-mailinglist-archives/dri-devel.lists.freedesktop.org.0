Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F07695AE03
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BCE10E776;
	Thu, 22 Aug 2024 06:51:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="Lw+cUIM4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2055.outbound.protection.outlook.com [40.107.215.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75C510E776;
 Thu, 22 Aug 2024 06:51:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5w6c4oqMf7jQJisXTyYWchFaGdrJBVFB/7y4s53cq1EK2w8LH+fIZwUyFTYFJK8VeLfULQSmHh6p7rfV+BVnUZaDdXrTIdE794/1VPiKIlz0Oa8hpqegzwb9UpvhZX07sUEvN7HXW5TWlGEvmTyam90hn6noGj+IWP28PAghx1FXwC+86/LALBAwRt5IvRGeLFAwp2oG1vkXCa8jPWp8BaBzc8nEr2y/OianLrP6Hl3m3NMDKrymE8HKtyB5SmPZQpcy5c/H5OlNGKcYFaGCJ/vdRsOUrZw5KWZW8CuLakM4PH7tEdxLx6DtUcwGCNZVLRxnVW4sF9OKzU44nu6IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=E7jxLAlhz40xy8gAViQ4gcEpHyC26q/DG8LjvbeF29GYYg4+l3E5MKStovg4B2gzubcLTs3S5d037v3KtTd3j7sqtXXHWbG0ThJyXfgE0spSojI38HqTqgzBERihjxgmgicrDINh4bgIfT7yzaAypPP6QqTIENxhFrlCmDD7spkMcEnUbkKBo7JQbLX+aVeMtvnwhVeSdGc7lnqi7nN/LFhkLJU1wC0ZVVHm23Kx642lAPwEUp05L6kefUt0fVSIwlmWQlcBHz4ZI2VGS+lKrpXl4WFszM1svnpn+nB41MXJTXSh0g4XBMw+xzVyZ/iQpkSmqSK+Y9ToH8RSxJ+WeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=Lw+cUIM4gx8XXxKEulRI4AZWVmHayKhYYZSTGjpgDdd4zLI6e6HbW80v3g4rxS7YPr3ja0pOF31WDlqoKk3xJg9HwTt8m7iIm+NRODeYVFNGM8sK/YXazFlTpXsVUkuEzwg3PuZ2vOFw6lUqM/sZoZta+MGjJcLH834KOClmAl+JWuLK3btql5Ix8Q1JX0zo4Dxhsqi/oH8UmXdratItJjLC5ch3562actiHCNN35ASxdU8CvgjRktEQEEwD4cx1zMZ+jNsUJZLVcIdqQHJlzzErJQJYLr+r6gVKyqiIKAAZpyTI16v/MNUJ1cmA9YXi3I5tiBSoUSQB0JxWKxfaRw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Thu, 22 Aug
 2024 06:51:51 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:51:51 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 0/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:51:31 +0800
Message-Id: <20240822065137.1331172-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0168.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::24) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: fd6e0479-8892-4b09-b8c7-08dcc276e696
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2ghjpH8InPXorCaDzYfi4LbWAUoKp/m7qnhwtIIs95mAzd7W+Dl3/T/mzEsn?=
 =?us-ascii?Q?soWL7t5F8zoZSG/p7+xOTEETWu1mF5hJMwI57u6tyCzDLtkQyHxEFDMbMluy?=
 =?us-ascii?Q?7ExcLFkNfJCC4IXWLNWDACnlIDeOPH7rVXhaA1xQd5e9m5apO1kTmEsFo7ZL?=
 =?us-ascii?Q?QDmA+vAmtiM0ID9BN1GdkeIHarFzMdebN/mVGmnMHyCFdzzinDhs5E3Vd0KZ?=
 =?us-ascii?Q?uPUxpG1TfrCnaXlfGXkk+e5G5XvPkczZNMtLKsz3xdR1n/8pUx/fV0HcEYGE?=
 =?us-ascii?Q?EFzWubewYkmbo22fUzU2aSmCsHORFYDWftQyoqzp/PoHehgUEJ8HelCW4Mqm?=
 =?us-ascii?Q?2yWIDWXtLuVHbe2Mc7x9RXXlGTgQuPsRAyCh4VlGtIhl4oBlhHdYAFQ3uon3?=
 =?us-ascii?Q?roC9OhYz30Ld04+Y3aDHstIXm9QgLV7btPHqcUAWsypuhN18Xf6FkRtCK1sO?=
 =?us-ascii?Q?CjHfrKId0nHfk5b7pnqE8Iaet+Bh2tWTjoadEj8B5Mb/9VB/ZBZQZ35QAmmz?=
 =?us-ascii?Q?DJrvLhnPpi0WBnno6qL8+wfi+eZUUPzAP4wifE1Bl0QiFeTqnZXLnWaFukxl?=
 =?us-ascii?Q?EKAFIEEtg/dOfC/9ugo/a0sRs2Zua8K0gBvMBmkBqojf2kqtwwYZB+zg6H5r?=
 =?us-ascii?Q?408q5bKfqdHulO5V86kSNXDQRdbv0tVaPV2VcaEyMtyHvw/Io6euS+zah/tJ?=
 =?us-ascii?Q?WBGyy+UJYNpORzm2Eg58KZDjetx4tvPfuRj4BLo4mypc0KWPd7WRENgvE9df?=
 =?us-ascii?Q?YzsrdbnqbSo9GMAIGzT665dN5xMNXtrzk3KSrTDV8Ig46DOsN78ZT0OHyyUb?=
 =?us-ascii?Q?izFZuvefTyZGhh2QaLCn1M31rs+gWaCmZEz68xxatWUA9DYEZFY2sOW6oL9T?=
 =?us-ascii?Q?QjmQ96n2S2sOEY7vyauqSwWivkjS+f+StLAGh+rxSbAIwKYUYuq18P3G/xgA?=
 =?us-ascii?Q?8wzAMOozyT9tD1u+B2YdoQQcW6CuJ1JNAce/oGMfLJMFOq9mvb/yQ4I0iAaG?=
 =?us-ascii?Q?mpMgMPvruVJsT60La6bwoa4lLTE0LWTgo19M0jDYyPyWgcecIQWRdFdLN3io?=
 =?us-ascii?Q?WAQxfscs+UU9x+wn8UIGMh8Ve+yDXfpt0JFE2URU4+YNJGOP3tvMvMHO8xQf?=
 =?us-ascii?Q?nMJdIgY5fl/5PpJ3ESJK/EcLWKSqP8Ooq7SptzcovmWRMv20KfFDBi2sayVO?=
 =?us-ascii?Q?TOM5Rs68DYhjrwQuVpA8l10C4dySzk4S5+2ILD8krS8KHEcG9lGB1nNi/J1a?=
 =?us-ascii?Q?0vsLPzaXhkGJ4kra9GLXoHDHHsia7nK7+Pk2ICJWAFFyygiNJS/f1jblBVVo?=
 =?us-ascii?Q?X+0mKX2POhdZTZvqLnGvlQiA00R+8A1dTzwiAppXgGu53mtYIOyqS+cJwBCI?=
 =?us-ascii?Q?Wgr9qmvxYxwhCBsi+P/FIyYfC/3r4YspCRPAuoV/qPtfBDtkW21lzEIr512b?=
 =?us-ascii?Q?i3S7V+BaGOM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bn+QQt3v1hOjUVCrXIaRW9adJCZCPimF8ujpk/0IKTBWBP3CeAHyiaEOOfnR?=
 =?us-ascii?Q?DV1PTCtHGtyO1rm7T6m3IqbL2/iq/gPRYgPwsvEWOJN4DDfGzKMLqDh5U6kj?=
 =?us-ascii?Q?3BTlbcnbojtYhdJ/rWL66O8v1VPdHI0si4iRshKaTD9OWmvg1dU0YJapR4dK?=
 =?us-ascii?Q?I+TKcC7p6OojV5ssVDiMs21t+iqAE/z34m5R0LyvsYkEztW31bEWVVEAHPbE?=
 =?us-ascii?Q?zgTM3S0W5pY32Za1VvvWd+alc+O7YiPmwVTTVWQaPWwaB1M5R1vZ+MFbqz7B?=
 =?us-ascii?Q?xbgPWJtQTUt+ACjow8ioa+BxuRaKa77oY0A1T4ivHxfUqUvar0rJQ+aGWIb0?=
 =?us-ascii?Q?K5WVeJh1Ol453gUbQAH430dWK2+D9bxwCI4kM3d5mzlPOUaP28wx8CbhFyef?=
 =?us-ascii?Q?499A7gHESEvifcyJTPogoK0RmwLS7/JeoSedbi4CcKKSIeF9eHADIPU0Euw5?=
 =?us-ascii?Q?rZpg36UrLs4oCO26jmNMWNF8170dcUj/9V9KgZ8ouVkGzGksqrfT6f6sMHSW?=
 =?us-ascii?Q?5AGaUoRBYrAoEZozo3Y71NSKg0+TL7ruT5Kb2sFNiMdP5GH1MYK1+xGwc+E3?=
 =?us-ascii?Q?gFgeBSwkkuEJhUzBvZHr3Gc4iWaYgTLXnDJ0abDLb2dWTokEFzYXUrSsQaoX?=
 =?us-ascii?Q?XF7K03/SDwuu5/sD2UUGQd8DAB9a64mgbc+h24jo0Ev/vm2ZWAV7jYVD7Q+h?=
 =?us-ascii?Q?b/8VW1XOWinlfn4i+zHtLC/ZwvrL9tJfUnU5j9mmdpVxOnLSjMnrqW7dBKQV?=
 =?us-ascii?Q?GtsoRG9Ujh8+SbBzrfH7w/IecfzTmkjG4t7dvD8nwctHUd1u7cks2I7rATaV?=
 =?us-ascii?Q?ye1Z+Oca+ok6hft95y2vFJTQUuEg/nbVNHuLzck3wIxnaKPcb9nPzwEsoFFW?=
 =?us-ascii?Q?cPBNbJYtk2SmMtynAZ6qWixvxhSdW9erWsIhewZt/iQUuGt5INHmlTl32cc6?=
 =?us-ascii?Q?xN1rO0a/igYimnD8b02MWPvcaqQUzWyIBnqAo5ALeAdbWCqxtioOaetIPp2/?=
 =?us-ascii?Q?R+7qKzUBx/bOuwwgLa/6C8XXyAAzhosErTrIB17CAn005AwpCj10niVcjC0J?=
 =?us-ascii?Q?Okkc7d3LY4AaiXgX1JaUN/FFpIS4cTjTnKGPDn80Ieqm2B2QQIJUqGRq+EnV?=
 =?us-ascii?Q?OrABuY43DC2//G/klGnKQkUoFN93SFfZQQABEL6Pb931qvjQBkMY3/givMNh?=
 =?us-ascii?Q?rAkTyJlLT8+fllwJZOCPpB2bHQPxkIGxGLXbxv6fwQz0+nIHCqxbCMkivrmA?=
 =?us-ascii?Q?Q4w87PzA+xlM4PkwS0sHseKHxjsO2n/gu5ZqDwOQYzQ43dY1AiS2WioIMNyQ?=
 =?us-ascii?Q?WNG5ZiRgRSjqltGOiacxLFFBkkH8betJII+8eNCNcvXUMetG9nc0mi3x2KQ8?=
 =?us-ascii?Q?scaeqQlti8OTRcyTt7fWfm1pMUbnLqgVFAVNVaIAWbXmR5ZfcSbc3wJvIn4s?=
 =?us-ascii?Q?aN/G9vLn5uDOVq4IL+gUemhT4PX1E8nMqv8HYxtRVB2v3JyL0LDXkqL6GEih?=
 =?us-ascii?Q?leCYBVDSI5iRHKxSkXEqKnn1eLyBtzKztbI6A71/kMhq7D3hAksrmSjX+1rs?=
 =?us-ascii?Q?2nz4DQjz/8bS1W7pLLld7nxnCqnhJr8AwzB/ZyD9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6e0479-8892-4b09-b8c7-08dcc276e696
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:51:51.2079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q6j+jo8PDbtCRKRtoFImeAko5YItxNvaLUZMeVLqvt9MEYI71OkWEMW/072FGQ1qA9Bh/AfWyL3S+1awWKIcPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
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

