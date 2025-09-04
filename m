Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B86B43588
	for <lists+dri-devel@lfdr.de>; Thu,  4 Sep 2025 10:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C408210E999;
	Thu,  4 Sep 2025 08:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="PkiSRlFU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS8PR02CU002.outbound.protection.outlook.com
 (mail-japanwestazon11012038.outbound.protection.outlook.com [40.107.75.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97F2010E999;
 Thu,  4 Sep 2025 08:21:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mqoVy/pbj3b3G1Z6UkquySIyCYV5bOd77GuXbtCbqbja+QbM2iH/c5RW6/W3nVlBg6Ih4u43k8d1+g4MCjT4+Z1Odybdf3Debel7cZIArVt5T2cz7xWId34qI8PPpwPpDodLFjYtidl64awhicS6WgLbawHJ0s6C3IYdxudRcuyl01fQ2Bo0DUfTuQ+nb7rPzZRIIrFRst/L8etblkX7clZqgy2drFn+Rttap+bSH1aTcNECd7TWjbULcihwbSnFXdlgTE0KgupNmXA7CZyOaaMKG4Pgg+zpAQ/qwvAVB84ouNCRpgdyvyTedwk6HefiQ9OQkrai1O6VUe5IeIrWhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mcAxtsJ3h3FEni4YO9ulxacMo/HH+bVy7990I1iO/QQ=;
 b=iuyLoFSXixpN6uWvPmx9Bpwh1ZCAzl79NUAszCLnNJlgwehzBOoEnH+2F478aixdyVvcQbyDykCwyKbSg/5fvJgd4ZL0yEHXes1nrRVIb8Jw98MOPH4mkGCOVYdDJfmndxPS1P+fIIvxsAnP/l8ef89o6ckiBRJqbYjkJgH++5Otq3IzezKKsyjcWtaIiodUCdJH/4yqoEdg+BLGD+vXAvXOO4vLlC9Ado2+B64ACv5WRCSQ7EvC5qr2OwDa84JQL8A5aFaw8Bq71764grgrq6Fi0cz3LspJsJqBNiJLl22vKbwhsRzNMztzH8WHJWoSBum6XFu7jEzQaefv1saCRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mcAxtsJ3h3FEni4YO9ulxacMo/HH+bVy7990I1iO/QQ=;
 b=PkiSRlFUbeuC3ITj/erRiaOzpSLgpwyWWN1FqQv7b7NpG5azKnOp0P4cwvENPDgg5c1onH6nvkHCtv33Tnf8fpIc4td5JEbrrJ++OriPYcvlTrGRCAEjU+qb1yQGjccfquyuICxnnJdlQxzwDRq1egoyv2N8DEAGUf2W2QCfE52pE4BKIvWHpE8h6gavCYULxqEF5f3zAzcUbywO/+Cz7xQ6ac6lKKH/zHbGBZmz7vmXgwuCX24JmpHsGuVKqOfpsPgC/I0kks6qGT/JrVlfe8z7cT9GY17BjOq/DrFrVVtXRmY2A5bgIFRdKbEyoQWQSGlVmoutXSqX/C3E3EH/Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5062.apcprd06.prod.outlook.com (2603:1096:101:53::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Thu, 4 Sep
 2025 08:21:39 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9094.016; Thu, 4 Sep 2025
 08:21:39 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, "chr[]" <chris@rudorff.com>,
 Charles Han <hanchunchao@inspur.com>,
 "Dr. David Alan Gilbert" <linux@treblig.org>,
 Ivan Stepchenko <sid@itb.spb.ru>,
 amd-gfx@lists.freedesktop.org (open list:AMD POWERPLAY AND SWSMU),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH 0/3] drm/amd/pm: remove redundant ternary operators
Date: Thu,  4 Sep 2025 16:21:10 +0800
Message-Id: <20250904082127.271638-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0100.apcprd02.prod.outlook.com
 (2603:1096:4:92::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5062:EE_
X-MS-Office365-Filtering-Correlation-Id: b3408365-2d88-450b-5d7f-08ddeb8c123e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|7416014|366016|1800799024|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/QyWkXuOD4ZQ2im/Bkh361Bf6tRMOCSt/PnYfSSUX//DxCA5WxNnfMImcgms?=
 =?us-ascii?Q?MYKRLOWHlIK/9/XyQk7F6jfGXuBiDtoLkKANTvcijM9zjhVGCqfQQZ54xnw8?=
 =?us-ascii?Q?gA7BqxcVXxLVlhSMNkmJXqNNTHVy9gPyhWih/c9o1FzcSZlE5/vQVB/gS5EQ?=
 =?us-ascii?Q?N2vlL72gojzYU0Dk9NwkW8N5wr3XJJnVU9mHceFrEsQ+I46D1Pz4+GNIbaq+?=
 =?us-ascii?Q?uat0gj63F3ju/OD/03SNXhyiN0QJ2MLVl9pdmC1eoA40ighUcGZVic+yUR+/?=
 =?us-ascii?Q?d5oq1EPFC1z+2xTcjVVSqodMaAq7HUiPmy4ak/8qRwkgF81aYWNRswOLcVsn?=
 =?us-ascii?Q?O9X4OPUcDQRY0UwDzzkY9tbtvetMEZu/t3KytPOmu/X433L1ItqwQZLoCKFF?=
 =?us-ascii?Q?DNAXExbfqY+6rxbI0MiYdQOSG8FdqoFlsNNZK+eNijgs5zWtFIz7NCb3rNyZ?=
 =?us-ascii?Q?PDhqYyLLKXpHjABrpXAzFxmzwGQNdAQqRe0VIZNoQalzKr7NQZ0alfISjmKC?=
 =?us-ascii?Q?0i4xA7l+yYkME2NCKIztSnm3daVksG8ZXWfL3ttinSRypeCFCNvZU/n1DBkO?=
 =?us-ascii?Q?k3ZnpfbSOxcqKG4SHWx0X6FfTfnEBzMMFyWS9pvcevRZvEuN0zzSWHemFcqO?=
 =?us-ascii?Q?F3J7QjMINt3wmeeZEBl/kVzrt6kgTnz86EpndteZ/QCcNGefHKuqhMHeDm29?=
 =?us-ascii?Q?YUJUXqSy4s+7rGGX+dND1Hbpim1H3gcIkfbpU0iqCfGxu6ZWhVACjL0UrN/m?=
 =?us-ascii?Q?VQtTGLVm7fOgkkqoRAX9iFiP05Zf/TwRFQKf5SYKnXtR2wf9SdsB9ecbOibY?=
 =?us-ascii?Q?UTMDoobbTlRyL190yr33E4c6hKQW8Ywyh4NYUAuHUru31qXpwGL587GGMNK4?=
 =?us-ascii?Q?7wxnWPti3oR2F0BYYySV2p7TWze3GjzkUUwYRlxUlHPUuPI1aPTfr7c+vrMy?=
 =?us-ascii?Q?QlSKgf90beptEJk035MNGVhzYifcpQMhAc8D/NIERQbi/HfqjkRNbgE2pNwg?=
 =?us-ascii?Q?X3SjF4clel85Ck/odwkyGz98WhSvhx40li0mzBVi7A+DSSpd2zxGlNvOTk7n?=
 =?us-ascii?Q?wzblACBgZtP4zk+Ojr1KSJ7Zi4BKTG59YiKhw/IzeoRrGt6PG/5cUosjgFcf?=
 =?us-ascii?Q?9y+R7zPQdKqraCrr1Y58QRShTetM+jGRoH++AJxR3RVI60kG7MPn3e4k9drq?=
 =?us-ascii?Q?Dws5tDqOJXw4x0w/xUPXok5TlMmy6IHQ0eYx2u7DjX++w9q9ZuokRrGh6Ms/?=
 =?us-ascii?Q?8YnTcofiahz3GpE3qEh5FlRsidCVONhKmWS6m6RS/QfgQC1Br59SAytexIDi?=
 =?us-ascii?Q?AaJSkAt8OcgRNvOpnGmZdUEcU4x49WCBgKPGEEfHocg0eKRt7A1ULkW84Jpy?=
 =?us-ascii?Q?0iovoxKiUB++vszbR7CQC1HbyjqFz0rP/qsqhzhR3EAil2eWkG11lOXZHQHQ?=
 =?us-ascii?Q?aZPCdKvvB+Eg6baAfbtCn3Pc6kPstQ//LDqsRgNZobSDRbW0d2+7fcrO+vK6?=
 =?us-ascii?Q?5PP91PXcmCU7Fr4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ergx36hC/xxdxhL7ulFDR0Sgugb8cdSkEnoIe1MP9PMNx80BQCJh9Rf1lV+n?=
 =?us-ascii?Q?eaRnTiHn03gSR6cnhMNMu2Uh2FhNUqoUhw22JeB1vBrx4NG5Lr9EID3mpEEw?=
 =?us-ascii?Q?LqNIq7tTkoaE2UZ/+34iyIP1jnCk9Fq+Nj2zbCslwrhvu92HBabIV/M+W35F?=
 =?us-ascii?Q?RIy4y10yaUggKJM0fPIdXOOWxg7uP8QBWoNbgFUYg1Jcyk/ysjWpicchMlGM?=
 =?us-ascii?Q?+m2g4ust6tgGxCUrxfPX/1dndJo0iMsYgh8X0EqGejKNJwt2+oFk3u90mcrs?=
 =?us-ascii?Q?lKRzmvGJupxd7L9in10So/drA5mInmy/zbu8vw0/Y9lbCpz+Rr8EnNF2Yypp?=
 =?us-ascii?Q?MCMI1bu7uhcFV9Bh7XzAlDOd6Rk4YOAqGaGX0cqI9T1A+Xu4Yb3vZO6C0kSb?=
 =?us-ascii?Q?Sg/TYq50ctBcGHfdJ5cWNXd/hPo6ZsSscm5bP3F4A1roJxwCwbem8YtAKpGJ?=
 =?us-ascii?Q?ncLS7DsYYbkAwGONi3fC20nXcnGb0kvkfTnFjeirfLxBanq6SE59hs5T/F6V?=
 =?us-ascii?Q?2IUaPWdNkhtOMEpVgS2w+QK5Zk+/wH8M9KVhmzbEGsewxFbgRSdJd/Uw5wHo?=
 =?us-ascii?Q?l2C2GugqjYY5eWR5HwMYNjhcglmcN4iAW66PwjcpEExgWlqWAk0RhApUN9uH?=
 =?us-ascii?Q?BZIclOyhKeyy3bDbDmcEp/b52RLcphpxj+3hIG2hfmdIsFs+YjBiY2IHHfqA?=
 =?us-ascii?Q?a2qg9IH/Y5BKUXZyFJ6lsD96b7hfVfxf/HrZsMN56kodIx7Z914bDAe6CCbe?=
 =?us-ascii?Q?EvoWjC9KrIXfkMoQMFn2hCY5vUi1Tso3NFOWMTMHAcJROaMxeIKBSY0XZVW/?=
 =?us-ascii?Q?gB2jLAjwaEZ9YPkEW2x9XMs+JykhXvuSdL0yGgb6knJT1A490LiPlyB+eUwe?=
 =?us-ascii?Q?cLzYk08J7dSnwJo10+XbIjA/aRdrd7YL7yixDPFdkes0iePBMNuwADA4oyhM?=
 =?us-ascii?Q?hf9uAGjnGMCHbnW9QJTLxhuNTS7S0arAA657nguvIlM01J5y/Tol9DbaTQRV?=
 =?us-ascii?Q?qBqwQmX3Vj2kCFLyw0kctTLXFfaT5ptJezEhLpbUUASIBTaEzXS2He52KC/R?=
 =?us-ascii?Q?ejOq47vlh79vhf9ZwEbWZB48l+7bfNUhBUvCPYBsSCK3awSYRal1/Haoyrmb?=
 =?us-ascii?Q?3PBck+H2ScCsEzVCK2xyb0bPxGF7QINMH0tfOejz/+c7L++7TvfckC/vgwDN?=
 =?us-ascii?Q?rj7xT6aDfpi0EsyVv7P8NGW9VmyP3pmUVRumAHw+vYWY/X6Wntn9mIOINfL6?=
 =?us-ascii?Q?t4LyorUkJTh+CSlhfmtEtNJQ4ZDiY0UA+IeYAVd/O6e/f58dQMQLV7sJQcUh?=
 =?us-ascii?Q?shRm11nsom0lA5HRIlChKyT+ulH8BpdJ/hpxPF2UvbWJjlK6spwsilYIA9q3?=
 =?us-ascii?Q?ioYINOQOjQ8LpvtNswjxTLK32tTg1ATfuIwcWqQ0llQrEF7+571zJWAi00ET?=
 =?us-ascii?Q?zOfpFUatRbEYxGQAiem6I03aXcVN4qqe+/AxTdl31iKVEmV1G673JAe6qp1q?=
 =?us-ascii?Q?jsJUPaBtSkFcSVZ63ja+IvzvHdFoU5o40u9PHV3r/Uxgv2rsG+f/Koqn9T5q?=
 =?us-ascii?Q?HITvnH1jsCxQ2tWHHY3pMB8AyZEsAkB22P9qR7+0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3408365-2d88-450b-5d7f-08ddeb8c123e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 08:21:39.2914 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zMMAqTHnTT2UrHfhxgRYLu08ygHu34cW0rGyCyLy47dGWMg4ogxjwX7HXoU/KHVM/Vbux24R0P3EtZmbuSZkpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5062
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

For ternary operators in the form of "a ? true : false" or
"a ? false : true", if 'a' itself returns a boolean result, the ternary
operator can be omitted. Remove redundant ternary operators to clean up the
code.

Liao Yuanhong (3):
  amdgpu/pm/legacy: remove redundant ternary operators
  drm/amd/pm/powerplay/hwmgr/ppatomctrl: Remove redundant ternary
    operators
  drm/amd/pm/powerplay/smumgr: remove redundant ternary operators

 drivers/gpu/drm/amd/pm/legacy-dpm/legacy_dpm.c             | 3 +--
 drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c        | 4 ++--
 drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c      | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c   | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c | 5 ++---
 drivers/gpu/drm/amd/pm/powerplay/smumgr/tonga_smumgr.c     | 5 ++---
 6 files changed, 11 insertions(+), 16 deletions(-)

-- 
2.34.1

