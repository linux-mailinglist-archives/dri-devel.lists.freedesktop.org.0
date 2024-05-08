Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C468BF9CC
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 11:49:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566F510E827;
	Wed,  8 May 2024 09:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="QGwgsCFl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2054.outbound.protection.outlook.com [40.107.7.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11953113521
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 09:49:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPMJxw18TcB9tt+kU4nEgVVkmkgh1bv2j3BbOWjug6X21e5Ewwp2UGczFUv6Uj45MGRvoUlBdVaop29he6dyCPo5PA/Y+AoV6/P/BLccnrmQcFmx3kLM+6CKT5THLcOC9w7iGjlbb1I2TBDhG/cfzPHaYVSg4lOvm1j9C+C4hJgAlW9NvRxBdnSw7YtzZZ6sCG1zyebEt4sudhdsQBEXokrn5G3Ov0v5bs+pPXa1fkGK6P/laFMpTBc8QuXvGiGY0O2bisfc11+jVlLfddOr4IRqxBwfJlubb+kzzN8/ktMsi/TatGinhhfrDM6F74uOK2GsenMSDfKOwITuD8d+8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/m3kbDM0SftEBYlDMuh6fVq6HAP7p3lG4KKL9izN73E=;
 b=n4m+BO/T06W8YrChx/YibglehLe5c8AWPjHwye9wYYVlx+yN73vb72ehfPnkxzhci68ehP9Pikx6G8PrCYWkygEqSk/Jz5IK3zEfW3bfm01BI8Kh32l3NsfijNZJZEsuschtEhSOGvpwV10jgq8xpsNzuRt4XzMgACHd2qf/cMC3e4EplmlvBfxE9mpCoVSlwRmpnBv8sO/QhGV2HGIwF3EHeqy0XFHOojNyzkalT3hRi+X64z1vSRPDB9+sjqgYXxUxxvv7AzUWYHm4aMotVyICSfhXpCIWv1pi0G6qsuOyNBbqer5bCpnL5dSYhNVNMHScS+78zRSskCpZV2fkeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/m3kbDM0SftEBYlDMuh6fVq6HAP7p3lG4KKL9izN73E=;
 b=QGwgsCFlOtzMFACmgw0R5BGl4rjAXhIjsDtW+/DfdHWmCOvqB+jUnO5Ap41RgFv1PknauvzsUU8b2p1qe342/WZENIaMihWu+Muw0lJ27W8FVyfDbFK1CpXyTw1eQjXPd0ZO8QxfkHlLRoW/1RWE/rUuAOYHY7x8utWcuMYoqaY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI2PR04MB10190.eurprd04.prod.outlook.com (2603:10a6:800:228::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.45; Wed, 8 May
 2024 09:49:38 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.7544.041; Wed, 8 May 2024
 09:49:38 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: neil.armstrong@linaro.org, quic_jesszhan@quicinc.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, emil.l.velikov@gmail.com,
 victor.liu@nxp.com
Subject: [PATCH] drm/panel: simple: Add missing display timing flags for KOE
 TX26D202VM0BWA
Date: Wed,  8 May 2024 17:57:19 +0800
Message-Id: <20240508095719.2689181-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:4:195::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI2PR04MB10190:EE_
X-MS-Office365-Filtering-Correlation-Id: 3abed25f-7798-4685-5895-08dc6f442cd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|52116005|376005|1800799015|7416005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZabvKdLMklUd6HZdEHbJkIEq4cmQUYg4wIx9VHSt/QBSO9Lo9VUOCi8FHBMh?=
 =?us-ascii?Q?qM4q+UBg2cBGAXS1NRwLcYObaRKON0GVtNOiQcu7GoiZfMQ130/eYc0XvxXk?=
 =?us-ascii?Q?fKPqoZRYb68k3+ZT2ULM5EEUNLi8cuXlbrUSssuhrWMa2pp5XzsUksopAmem?=
 =?us-ascii?Q?V+avomPoZdX33DvzCXP1VSz53cGABaXMfCvITZ6VHFPL6UH0TkS/tEtIYvpP?=
 =?us-ascii?Q?MlftJor2w5admXZFxPVuLCg3CizvfaZjKbMVkKdLGx2OCh2YPE8Vt9Fc0D5K?=
 =?us-ascii?Q?Me5YRI3rrDhNigirM14scm8uNK9vaNyNWUfK4wyUvNcsXKQoWHIl8VXmUDmG?=
 =?us-ascii?Q?QSgjxY7v7UpYa9To6TUM0RmghEMqWeatlA7uKxgUkQd3/2fj1dlDWSnA5NA+?=
 =?us-ascii?Q?W1zFYgFOzucQzwKgSVTdRq4dBAwN5UqAkHYM8hlIR8tBQYChmOFW7cliaK5f?=
 =?us-ascii?Q?1SojpIqbC3rn2wHZNGOwK4pDSSDonWoZlY6ELLnlA2Zl4y9VjU7iVz2LXLzJ?=
 =?us-ascii?Q?KlxxZ81ltV+MKBShPVsWEoK8qV/8qlEiFT9xHrebSySQTfhMmpbUcLeLwtlG?=
 =?us-ascii?Q?xy6IiKS4U3YiL6tB4Anz6fZClM7+A1d5HxuJrK+3rvm7+wFcCDgcbzTNvndf?=
 =?us-ascii?Q?5RrpuZ1Hs1/oDv+wjAtHPr2Ct4NNgNwLlMJ41lqWQI3McX1mFxk2kzb7w+4G?=
 =?us-ascii?Q?pM9CexPDwLCe6MrH9cNa/jqGO3DmgaqfGDHUqg6Pp7+ah0YnCTACdrY97huZ?=
 =?us-ascii?Q?89hM8/PoIBMtfmeLeX3iNHg8LGK7wRRUVdW21Fy6vMhD5CBSQmjh9eh4akEJ?=
 =?us-ascii?Q?jaIRwX89aAR0ZIserJz/fp0L9tO5EwTZtKaARILEDAPBNgHQVH+qre4s0rua?=
 =?us-ascii?Q?WtGMqNEbbGXmICAA+3cG+xVOb8o2DxlGLIfzFXI3EufaCfAi/tj5XuKIfmy0?=
 =?us-ascii?Q?UJ7kFo8QCrlv6ZRA2mxP1Zc6HZlbfMw51I479JSw6FEtP9a/uV+zeFBlJgdQ?=
 =?us-ascii?Q?1IJO+PlkouEMT7gqM2fHVpaFxkEPSOJ7E3IfNNSXJfrY+H/XvqAv0Cj0yslv?=
 =?us-ascii?Q?RQbmbHEy83Yh6ZZsomMe5pGM1wshvLGjAPHFdeX96CGjThGF+MUxQTYilxe1?=
 =?us-ascii?Q?8OWVwhsVA/2C3RsZ7Qx4YcK2Y2TmOcEnAL+M6bGNFiFEx9hK1KaAPfoH0lpW?=
 =?us-ascii?Q?9u2W5CB2lxvBJFzEMRBCoJ/M8WXE6yVSjFf6sgYWlWNrzmvOQKq8p9PGVvmk?=
 =?us-ascii?Q?1yQckkvB9cfWyK/Zq8qsg35cbp9WeVU4a4ObRkr9xSq5KtYJCrZDaHYBEd6O?=
 =?us-ascii?Q?AhEOvyLGLjVz51HQAe6BJXUE75lNkktx0X5B3kaFKXZ4mQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(52116005)(376005)(1800799015)(7416005)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b+9PXfsjErczHv4zd5KAIF0MiMOdT1w7Xl/HUPcvPPdwSzB4UbAM7FF7oXCk?=
 =?us-ascii?Q?5lqwaNkl0R8/+SoYQQ+iVuumcfiy3m7+N3xHygP3KNlgQTbq/UBvqTvDlH8/?=
 =?us-ascii?Q?nFTgC1hkyV+rPHqs9JvpgMLXHCfbTOJJIS0s/AK5MW9lex5upf3Q/SnuFaTo?=
 =?us-ascii?Q?ygOmo6RBJr5IbDvdp1el+W4qdmu8zEdN7SYFYwo6Vv2xrvyPr7WXxS77m6bu?=
 =?us-ascii?Q?7XfJnHBisy+6fRQ8E/EiJwxA6Q6AJRq6o2Ep8yRy12lQKsKj91mnzfkVKha8?=
 =?us-ascii?Q?cZa9fFzJamwr/NdX7FmU4o7FcJ+fL52Qqa/KrxWDBRYz5fzsMDnZ7ReB9ajW?=
 =?us-ascii?Q?DpXOc1oocDkA6Uab2yC7C+qeHXwSL9XxTdUTJHoDwIKfj1RLem2boI6eUf9o?=
 =?us-ascii?Q?OQ1QpEihAmjUzLS1MW4STcIxs/eE39FQzEw//+5k9ID8wr94jeJDNjBgu5VS?=
 =?us-ascii?Q?uPX5hOQPG/mNkMWq0u1xiIu1rQ04qpTav38c+pGX75+jYYqhDIMRbkkOBjNm?=
 =?us-ascii?Q?LhuNmdedGl22vQLS/wKeP9QBgQFAZ27RqiTn5cw6W1Uq7DJ9/XydrbrQ7dZO?=
 =?us-ascii?Q?W9IssWLUpUJQouxNZntKJgnlH8YuurjkIkDYUmWq7YvtAqFF82p5vLnKOM+a?=
 =?us-ascii?Q?9IdDVImG8qT5zc1KtIHnOyYKxZcTsHguyBfUcLyehff0NCWU0JDvu5LHaTTW?=
 =?us-ascii?Q?UnJOUAu4+oc586fzYoFT95UOV60fYdMFE80Ysd9CpVny7FqTbuktzXgI6eM6?=
 =?us-ascii?Q?rZYIvidfapgdV8ZDaBFQYjKOJwQgf7EEfwpm6XbTp0ZlDiytbMjaVeLneEJb?=
 =?us-ascii?Q?uATZpiyRIv36qa5U2BJYyAm06/XQTzKZ+wAM+WAaB2+QDl/KHuHDCrutQtdc?=
 =?us-ascii?Q?8Rm6813fdtfqwsyTvQ8+HOYZM/nJpCQiNRHLvqP0VWJcT+fgABxCDBHAU/lq?=
 =?us-ascii?Q?a8gLbrLPs9BM6DQEJXd5Qitaw5PTK8oij8Bixtqx0I3XiAHC6v1hgQW6ZDjl?=
 =?us-ascii?Q?A9FhZAMwInU4cXsJAAcLsFEOvPmzhGTwkQ3UBPoOGfxRQjt827FXv+ruFhO7?=
 =?us-ascii?Q?C+y2QhGIPDAyX/RjXOUj6KQgNRQzHN9H/0qKuAqDLLPFPKFdWxOzJG5gmxSL?=
 =?us-ascii?Q?/WoiE1+1M1JQ5upA9kts+G5PJlcwD8GrJ9UvunLFOgOlQ+pN0r8BBMIvcdmn?=
 =?us-ascii?Q?JT9pjwBOVldW9wnLc5E7UCjY3zkgNMHRNa3LNCLvegKIxhVCrISUnwNj6jXG?=
 =?us-ascii?Q?h5nnqzvxoW1FVu2A92y07qiWdRjtJYjwc6qRscNLuHh3/cQ24A2dYWatvYRe?=
 =?us-ascii?Q?jM4/CeXsSbdjNkdzNYhUS1UisI8kxadLgf/jQPc3nWT35RZqpAUpUM0IihZq?=
 =?us-ascii?Q?lQUHBYKgep8daqrFzJfSRq0PDENU26lcaVwIuF706X4OtUlFsNo20aZ4ocmw?=
 =?us-ascii?Q?clsv4iwRHv8I9zE2wkp378K8lw3MRxK7k8Y96c9jhqYyD0JUJuptq7t+V9VN?=
 =?us-ascii?Q?cmvOsLTltpvpVfTDa+SSpZjOh5L8NThb0hJ0686s7QV3SZp9ZoJdXeH5fSOQ?=
 =?us-ascii?Q?wLFL3vp2h6UozOYIjx+kzT5fiAthA6iyPXjPi+DC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3abed25f-7798-4685-5895-08dc6f442cd9
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 09:49:38.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PGYsGlIRoUauDJS5YbAtGruWn33kSJRwG3lPIHc2/XPqVGhTuNAQfHdRM1ZVtMv0HJamH/8+R814M4mLHYZLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10190
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

KOE TX26D202VM0BWA panel spec indicates the DE signal is active high in
timing chart, so add DISPLAY_FLAGS_DE_HIGH flag in display timing flags.
This aligns display_timing with panel_desc.

Fixes: 8a07052440c2 ("drm/panel: simple: Add support for KOE TX26D202VM0BWA panel")
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 20e3df1c59d4..7b70606e5760 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2704,6 +2704,7 @@ static const struct display_timing koe_tx26d202vm0bwa_timing = {
 	.vfront_porch = { 3, 5, 10 },
 	.vback_porch = { 2, 5, 10 },
 	.vsync_len = { 5, 5, 5 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
 };
 
 static const struct panel_desc koe_tx26d202vm0bwa = {
-- 
2.34.1

