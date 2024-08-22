Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4F495AE21
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 08:55:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54A5210E77C;
	Thu, 22 Aug 2024 06:55:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="NlX9DIqT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2041.outbound.protection.outlook.com [40.107.117.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB7FC10E77C;
 Thu, 22 Aug 2024 06:55:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHdesLoFQUqH8G05/+Vf+wWnxCIEjaJFN2ZWrVzWS7FeqLpNTjoiko2b3LMN5+CEKrMDw+Nq6YkrhBTR2g5R3/yTPFyg1AmhiYypkMOL56XY4o8CxiGDb/pocLQPIWtRLu5bvPRXdgEQm0f9OdNgmgQMjmvJViye6oSV7NKGIhJAgXZPUkqdIsd0EZFcbHywyignFCUMej9s6gQ2D1x6ntJQ2GKCXOVgrCKMVtxRT2KyQ/TxrZZhAVOVtdLotnf/03W+4wdPP9FpYWsxCRy2u9pnTblMSAVcE0k4auUdWHmGAfAw8ymlb2ncsSoT8ejCRMTh5/PW+V93SW679mPRag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=jFADm1jAC4PfoWFfrpDtpSpClhamBOoCC90X6Ue2IXsaAgp8ts4oR0FDRd77DhAmdOXSpcUNdlQTOd0Cq5TFJ/PtjY6AYlhd3iadTQOFuJ/uktCEQilrdmeApHK08JHBk+nepAGRIzsvCP4Hhn3LZA7JOouNMSkYoqwPLYewVc2NW3OyoOoj4lQAtaLRB+tvy25o8g8d7HeYp3Bboh7YMKqwMH4qcKXorlSuyZcDaOpt4zKdfV9KykoceO0SlYN5B4OyfbACTErCv/GHbvwNaTHoJNnGR5k2KBqAsTXLz3R8eXEF/Hu4PJfuldL4uzEBUiUN+w8Atj5xvO1kVaLT9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aMue/GgpVw8nABjZci2DVgEuQomrkaZd0cUzq031dwg=;
 b=NlX9DIqTP8XfsC1bCd32zgmKyEP6r62KRKI+SvKHVEyhMcv/bS3hBS0Zpszh4YVIM20R5HsjAwcteGr2VyqOtl242JZOFUpuWoJsrmreFriaGmBbyb54+4f+YAGSqH+YnaRjAjbg3EosEN3JQzte/oM8tkppdaG9kqDEfOi93zsbbZ375k6zN5n55TCFu9vOjY1RHZuAAQ39kLW934rU1V2hVOMpUhFNlNaNFi5s/tKUI8f+HMnNSBXztahLfhWfAcO4RCbB3xuegjIL7ibatz5p4gWJJvRjs42hPdLAObCzZ+xefqnm/ufXFAA1vthZyw9zDO6qrohMxMM8sgc2vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com (2603:1096:400:82::8)
 by PUZPR06MB5982.apcprd06.prod.outlook.com (2603:1096:301:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Thu, 22 Aug
 2024 06:54:58 +0000
Received: from TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70]) by TYZPR06MB4461.apcprd06.prod.outlook.com
 ([fe80::9c62:d1f5:ede3:1b70%7]) with mapi id 15.20.7897.014; Thu, 22 Aug 2024
 06:54:58 +0000
From: Yu Jiaoliang <yujiaoliang@vivo.com>
To: Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hersen Wu <hersenxs.wu@amd.com>,
 Dillon Varone <dillon.varone@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com
Subject: [PATCH v1 0/6] drm/amd/display: Use max/min macro
Date: Thu, 22 Aug 2024 14:54:41 +0800
Message-Id: <20240822065447.1333390-1-yujiaoliang@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0094.apcprd02.prod.outlook.com
 (2603:1096:4:90::34) To TYZPR06MB4461.apcprd06.prod.outlook.com
 (2603:1096:400:82::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB4461:EE_|PUZPR06MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: 0540c949-50f2-4119-ec82-08dcc2775627
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|7416014|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NUUOi4j4+6iO2nZzwAUC9l/0o1pIx41SCTbpIuNcw1zqBu6+1ygDvu+S88Ht?=
 =?us-ascii?Q?bnHZ09ogXyj9kuRWfDq2NV3io97MW/lN3D2R6PGtqL1pTkZcv9y9zPRaJv50?=
 =?us-ascii?Q?PtPTXu0YaGeABoKY9D1KFRSDt3dHZwzvrRqMV5tQU6ZMIl6CZNi2LosPpDlT?=
 =?us-ascii?Q?iISDVpVd1udP76ogfS0XobOMwXNSUEWwliRY4TFenAAqXrm3JGRCKXZmdDO9?=
 =?us-ascii?Q?e3lXHlob+0rWpnZFNaM0hXAyGSLb4RsssZYpiQixzAOrRcCbQXPlQ+SCBKqv?=
 =?us-ascii?Q?6k4qNllI4i2eluLmktBCTgD6Lr6MbUmoBYaRKj6TvUGNjRiFA/T+rAk2OoLi?=
 =?us-ascii?Q?ekKzhqKLR1SJlLuR0YsHoe258Xc5i/swoVyOKNgLj1OfbxjWTD5L2YB9vinv?=
 =?us-ascii?Q?R3L4HH3sX8536WwrLAXpKvCpM+4OFBQt/28g6EOUBzdtvLKN5NbPnWwnb7iu?=
 =?us-ascii?Q?K5i3n/0atXUV2Thgcjcig7i+fhCa7RfgnkZD2cUK+o/YowaJQ4soY92Ow+HJ?=
 =?us-ascii?Q?zr1c0NF9+qtiTyrrYGgUaf7gGFmaBGr3gJZRCbk5bkL2R08PO/gdJNamLfGG?=
 =?us-ascii?Q?SA7QFAuYec+fzMnX8DrJ3QOuXdR0LqEmm/JokcWFmEOZxZQhciKupdizKUQT?=
 =?us-ascii?Q?Lhn959bkANHnTsSdgeHNreHVchHeS9Rzr9Sdk7hFSgurt/FUeXcq34zJb87l?=
 =?us-ascii?Q?aoP2lXMYJqlTGCuGhVnVGFtBUAHmKu7gdO1dlT47PvQZDq0wqbnWi8cql3Ii?=
 =?us-ascii?Q?noebkF2D8X3QRyHo8l22pkoTHmQhV0u17diSDMcLfmWU647GWLHe5UkwUpdJ?=
 =?us-ascii?Q?gCrP6A3FKYkuHCPcWOApUAODCaPmuQ4Ug7RByrpDxberwqKJw0wNfqSIA3Pf?=
 =?us-ascii?Q?ztSOmQpIzcYA5iGRQAUF66iIiWsqn617pRzTheK4/X9aSDLrRZqrVT4ugaYV?=
 =?us-ascii?Q?wNe0J9RFx1U7GWdLwP9s+CQOqlbmIFMklWL8PoeaABwqK88ydmiqXVpryjuR?=
 =?us-ascii?Q?ffMQx33jUdvLAtgYymwm4Hhw8yBhJIBsjrTl9K5+ckogZlgpH+eZh95N8/up?=
 =?us-ascii?Q?fQOidglLfOpzYKX6xj0428AQHO+boWhKz4SjvqUZYl6Wb/u5OgQQRLMyMhrC?=
 =?us-ascii?Q?FOLkWDq8x2GCjnuZukAXXBcNWtvnXa3UiW0hKAolDxZkCHGXOdhO4b2uXYp3?=
 =?us-ascii?Q?ofsoOJ9QbnVeL38iq3MWwc6bJFAL/n8/VmpGVfaXbfrlI+HrA1jjZjP40Tf5?=
 =?us-ascii?Q?KGzCoR40R5+Ra4GwR9DNiEIUkPLcMM33bsbNAJGCb6EehXZxoBT+IgpA+TNm?=
 =?us-ascii?Q?9aqg+EpEJxx4UjnbQNssiEWxL4dnXAA3r7MXf2f3xZozs6vZ0V1Cw2uZV0LU?=
 =?us-ascii?Q?AMXMGNXCn0pLDWi7v6pr74PyEGhup8q5tnfmIDWa5t+UrXhxyGXWyZzu9wEn?=
 =?us-ascii?Q?Q0/Bu+JyqxA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4461.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(7416014)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wb2aiNlRrRJZXMVLizazQfAqMo0cb88S0vpHF8Vj2MIhpIcfcOFZA2qd3+u6?=
 =?us-ascii?Q?WmVzv/H8MeG2j1ORIRhfHqdj0d2NES/apJdqNOZvkBVuFkMYLSbxmHyR2ucd?=
 =?us-ascii?Q?PgmK3ywPuYBghdzwcGfZiNGYv3aECBdH7ebJs7xbJA6A3Ol6bocbntWHef5X?=
 =?us-ascii?Q?2GSFdR6Enf49x1T7NjlT5Xl2na2Zt/hY+bB+dKT94kfd3reMJZvWjrjmaSSO?=
 =?us-ascii?Q?AQ8AHzBuUObrqOsqGRRE18eKJTdznEypZytE824pdprLk0ZHxCJMB/2QjwfD?=
 =?us-ascii?Q?D8Zcpk3NIgbOboY6CKeqWRw602tgzf9FvpRmHSO+3/wGpT8WbUe38kEIdfRB?=
 =?us-ascii?Q?bdzncd/EBCk1ZBO8JAUAUfc7Qnq3MZvQuMuKS2i9mM4RaiAeyjFlZjwq/3bb?=
 =?us-ascii?Q?cLGi0x2mgEg7k3VvNeJ6jn5VpiGpXXhyjg7nlLZlM9tPFclTzTwaaxOgLKgA?=
 =?us-ascii?Q?6/2YwOLBftM/KWVZ6ydVcc4xaT2kxkNgo3VbEP9BilOHqU740yWw5rX6UmU7?=
 =?us-ascii?Q?h1YGnNc5Nwo05VaryHIS4Dvl6vxveDPnxZetkt3Cl7sgSDw7nzxBxh08Zwvb?=
 =?us-ascii?Q?iLYaKjCBrlekwyBeKk+Slo4UV7PIojie+owVFlkUFxQdebkdTqGNwh9pdy41?=
 =?us-ascii?Q?D5vD7eE3LBtIWW/xZ78olF1K5778I96IX/xeMcjPuWoEnjA/8ofsuU5+YBds?=
 =?us-ascii?Q?wueTSR2KFDQ0obnfqyjXUMvm+7iaSgj5M6KfZuQvpabJKskV3LSb7vQud3EU?=
 =?us-ascii?Q?7d5kM/t1MlvD4OlZgA6mM4SNED+4ChpIjlnuVNa9GLYjrtY6+MB7W6V2AMhX?=
 =?us-ascii?Q?f1Ic5zm30ahyyO701AHu2xoXN4SkuE3dv2WLg72ndxJy1N/h+gugVyEhUFoV?=
 =?us-ascii?Q?59g/hAhDn6hjDhDPk5fU0amhe1sIqAncwdaysnmytShuE7p4QXtdj3HiTJw8?=
 =?us-ascii?Q?ntGGCNOesqkZpkVr1YcGcS7FaAgjdchwmf7cOy2+CeZw71WvFHezkb4PkCzk?=
 =?us-ascii?Q?LS+YR2SgV2IQi6n3cKJg1TsVvlhxpeqaFR3JRMPE0cGI9Q4A5vBX0wXH+rxF?=
 =?us-ascii?Q?eKWLrDqg6NzyCRclsILh3LEkqAOLXHX8Bk617MlM0+UKGzlrJRuTp4OTsopi?=
 =?us-ascii?Q?U2n7oHEfwN0l8GM256a7eq0WR2+dFw4rxmJCYDJHc+/29Wryg8WQu0nNS373?=
 =?us-ascii?Q?gLkOLC965Xd439O8ruiG3tzgcklJAggK9NmUBP3DYiJwwf0mSfPUbpHsTsAw?=
 =?us-ascii?Q?Fu+QxBHrMzwK0Oxt/FSvrv3X4d8XzVrnaKW3zHC2R2SobwkJ/X9cMhy5SFgr?=
 =?us-ascii?Q?9mV2Hmjn9rlNhxuc6XggcFva7mZQtcl/uajQQ8biS5YuyeaQhjvx089bxi8f?=
 =?us-ascii?Q?VafOfpv8l2aKfWLh0eWYyv1AXDTeK/UCgm575DE1jE3rhQnHuAbcgf2gU2dp?=
 =?us-ascii?Q?5meDNE3YX/LKilbrg4wt3UJxyE7fo5w8VHJuUYzDYwjwgh/C/EqYF/m8EQP2?=
 =?us-ascii?Q?H1DR6fYivMumcdPk7QAOP8VJey9bKBYJ4uj6CV+FlA1VYHnpFL1FnQZI7bmd?=
 =?us-ascii?Q?4IiO0dZJ0hJ7oE4TwtpGVUyZuSf7CoeAp5tSWF+y?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0540c949-50f2-4119-ec82-08dcc2775627
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4461.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2024 06:54:58.4252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ltCh9Y/ijB2s2/1jgYep5dD5xhvO6jLCEGk15JTmU+mkNih46lP8SncvNdFZAwwncE+6O9OTHj2VUUnH3I+Zw==
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

