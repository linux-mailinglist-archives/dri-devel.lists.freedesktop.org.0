Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC15873640A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 09:09:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367F10E276;
	Tue, 20 Jun 2023 07:08:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2138.outbound.protection.outlook.com [40.107.215.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A58FF10E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 11:32:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GHADuM6YbiVTSnZVNuJ13EdxzuV2uenx4BU0Vov2z7d0M7vt0miehFlFutL3Gbq4yl9oBo41Tdmuhlt8R42cSHWdf3YahA7l0U5PmY4hTiLGHD2bAztJR2msjs9xuhEvZ1YjnqE+bEm/w/zbWLrttYLhf7iT7VMTZc78lcCUVEhSbFcDK97gqWdsVpgDzQo7YW5tRsgqxsc/VbNGRUXHhw9gmftg1wT8XT45flFKmQnDmxjK81cVugYw0AjNhOS+mG1Ozt7gSxb7x2yxr6zzgwshnwLh9XU6LojNBcNNEzdRxCqJfA0xzlodEfTmgBZXFckdELF+4XFwZxHtfq0oYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2sygWTEQYKT2sAAbYq3ZZShq4XcPpiLNxWRj17rEoPE=;
 b=DWI65f+c7/oSYuL+Tj0e0Geqnkvms1jJQEFTZoHoFWrtIzWMj1OqJn+UddAoFOlargbVSbuMWZ3DDIYbAoNMrCpCSBmQEamgrBOm5wktP7VoPV+RLpNoRcVwcvcsQMUn6cZyoOSgLzN6XEk1eoR9/aqonQHJvYkQLxjGqf/gOOO2Ru+L/I0jbe8N8wmLZJX/Hdny5xxjRMk1yAmk1uncvyBh8Vzjt/yBxf6UV2ci8nyJLOZsA++ZJILWZy7UOVDE2Ngg6LwfZ8Ht+FX/kvDCVVi4Sw5Cq8fxXgGlhBKEwl4BG4ZwYCiY7HA6A8jw2LxhFmPTb82G4LYtPFg48kVNDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2sygWTEQYKT2sAAbYq3ZZShq4XcPpiLNxWRj17rEoPE=;
 b=RN+jMTbrAM4bU2PybA2xU+KSaKhitMZUauQuKKjTLXM50h36PdhJdEzFgRz+Nt56EXzq5Ma55pUFAOb/hckN9upofDAPWDMZ5FNVZ20JFtj4eifMZCVT6OqgXXCvy2ViKXRfo7WjeIdSqdRG+FSqfKRtsk1FTVjSpkNDNDjemAonEuL3Idjm/qYvhVRvY8XOB36qRmJupuBNM19D0l9G4KNGb65uwu9KTiCC0fgCsuyYFnJkrkm4a4Q0mz4MS1iaK+wfiEEmi1BcAZTvCxeX5ZjAyfwxojKo+wckxqw/VRe4sfqZSslFo6W7/pIaJQPjtmNa1yRDDCseqlWKvl9wkw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com (2603:1096:101:48::5)
 by SI2PR06MB5410.apcprd06.prod.outlook.com (2603:1096:4:1ed::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 11:32:28 +0000
Received: from SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c]) by SEZPR06MB5022.apcprd06.prod.outlook.com
 ([fe80::37cd:b3a2:1fee:705c%6]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 11:32:27 +0000
From: Li Dong <lidong@vivo.com>
To: Artur Weber <aweber.kernel@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] gpu: drm: Optimize the unused variable ret
Date: Mon, 19 Jun 2023 19:31:33 +0800
Message-Id: <20230619113154.1980-1-lidong@vivo.com>
X-Mailer: git-send-email 2.31.1.windows.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR0101CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::19) To SEZPR06MB5022.apcprd06.prod.outlook.com
 (2603:1096:101:48::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5022:EE_|SI2PR06MB5410:EE_
X-MS-Office365-Filtering-Correlation-Id: 066032a8-dc03-457f-e923-08db70b8dc54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4tDbiI8F+i+XsJgDH0xWYPghsJ/KV+HxsVYGcURa1bBwvFkBWlW8JR81fNBiHuW4/pwK/2U3nm98HYbZfWZ23SfSWAVyBZjgSso1qeae6GNH8OUx3lqrGyHjvg4aNYIhSD8W6QfM+FYZDBABRa+YqjAFBi9XIR1cgyFTRZ0BA4Ngo9sWmJXiYWGs0TSadC4133NHFxRUstxOjLkNqjFMv/ViSBNMD6lkAnRWHKhc7g768MD4C2nH/RD8zm9Z0BAXfF4jbNuZDJeNvvutbMrfakEsn9qiyy01HUMDNLjXTxhXfkkQGu7LjOtby1WEO/01HTE1bjKIsNQunL5MXrcDe5XkcZtkr6rxNGhuJNb1EWNLcznofGLvaHiNlAvZ3qE7bbHIdZ6gEIHnGGstSQYeiVXQ2IGfu+Ve3ZVRw9fUMKdCCaL+AqGIYcbbFLfIC+nHGo8Rsidg/Y0ss66rQY0V0JUqsHcdTjWtofs2lP8ygP3u0g+a0URmDWxJxu70yGD/G3/LmtVxH4t72p759AQ46q9E5mGnYFugbgBvUGFAcwL5/dBWP3BfNcK1ThdRX+msl8lkrOVU2PAYM5KAAFQ3dNSznlc/GAxQSFIJsnYw1x+UDFK9D7xUD8rIhsx24TX4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5022.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(366004)(396003)(39860400002)(376002)(451199021)(107886003)(2616005)(86362001)(4744005)(2906002)(83380400001)(5660300002)(66476007)(110136005)(8936002)(186003)(66946007)(8676002)(66556008)(36756003)(26005)(478600001)(38100700002)(41300700001)(4326008)(6512007)(1076003)(6506007)(52116002)(6486002)(6666004)(38350700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rDwdcJL/J79HtU3AvsrtpeDzl0ebvvEbuN1ZmQ/dTjz8fdG+B0Dd4hf9xtD+?=
 =?us-ascii?Q?D///pNMym21OBANiQmpzDHHe7wvDGpDgTg/XJdsZdcA9yO4N9uDsP1S7L+To?=
 =?us-ascii?Q?zty2ndZbY16rjnMS1vMV44CU0Xa1D62vjtq/7yAnS2OFyVbwaL/K7GeKRB6T?=
 =?us-ascii?Q?WmbBq1KZXfpYyxBnVRFSycYnOnfSv1JtmCDZoAsF98f5k4phfi7T4pnnkPjn?=
 =?us-ascii?Q?JKsxVGxdHCPE3SZJNAsxrVbGyUtGqViPBzJ1O9iIAFSuMcNEAsTxWrD8mI1r?=
 =?us-ascii?Q?bum0HRX1kLCGigMiymnBVGKD5R4vjkViFBslFxRdTM9YUKGE1WJIZRY75t29?=
 =?us-ascii?Q?iSQ9q04TPIcDJJ9MfQB0pKxzWRJb4pODzbXcyqXHc1LPWDZLy7mN2juOBwfS?=
 =?us-ascii?Q?P5uymKd+56IOnY68YsryOMnJVJkOQ8OE6L2gaU6mFknRJhXPWzXL6Z/Yq+1b?=
 =?us-ascii?Q?0AeeJAWATYjJLz4sgr6vdT1AewVyHEJHz6m3yFZm+XGhtGJsHyycc1qTYl+6?=
 =?us-ascii?Q?kM+1XJghov6clQjh1Nd4QhoVeqZrpLLIbQOZAlgqkY8aYJF/esmIrLP9Yz0z?=
 =?us-ascii?Q?/SOP6ABSvb/X045kHBneohYJiRkI5cMGp6gToiSAZ9yni7hWHJxDSwuYuL/E?=
 =?us-ascii?Q?iCN6tAj9yxVOZmf6lEX20+uRsf8kd0+UHMdc0DvBK3E5d7Y27tlS5votjpZN?=
 =?us-ascii?Q?ldyigheTkvZz7DpcXbZoDBHao4UtoVLVEGZ/kdzdrqlBJDLkGOT7HEUFh5dJ?=
 =?us-ascii?Q?OjJTZ2CFKYD+NWdUzKqft8OtaywwQpmfJoTf1zSksiNqAt+Z/MIHl5rrsW9C?=
 =?us-ascii?Q?z7PGPjHG4+o4VuvJFFmPf4R7RkbiiNkZx8R9c2BufWWhaohKJr/GC3j9gLRt?=
 =?us-ascii?Q?KXO6j5sHF3S3hdaZZyRMCJy/qtkXMOV1NyBwlG+RZkuBh3eRJcEeXE3KO7Fw?=
 =?us-ascii?Q?xKpEXw4FqMSabsGwi0dQUt7R3kM/Uhmx/JCTX/TM3ff8WhhnZJOwgjwIzkju?=
 =?us-ascii?Q?Q4Q3M4kJdvrQVHA3QavENEJK4ozVA9/91pGJKNvlxINs/QYjX3F5z6qjAlTc?=
 =?us-ascii?Q?P/8W9SW5UV6sZY3ubZTkGl0KkBwfMW4jk/xun5ZqoBBXrQYnco6kO1GFUaLr?=
 =?us-ascii?Q?yL/WeZVJPHjabtY9wN9MP2q6+GzqPWXgDYpa6upl371OboFwqT/AneWFBlvH?=
 =?us-ascii?Q?Iici8kmFtcnICMYmnVFw9SYMi+GXNF9+8MTxkayqQoNAUgCFu7ugcFkOJtxb?=
 =?us-ascii?Q?W0HV8CV2zdojX8vQcZaZ2maRhKRtahBoP096u0F55oTY8jN2wgsfPwR0icu6?=
 =?us-ascii?Q?OzI7Zwmvx8ew4rKfY5SlvcSLgiaeCHrUUVSETb7zSPGQnOhyM5Isio1zl6zs?=
 =?us-ascii?Q?/+JELY9kzxEy4BuLHnlDfv9U9YeiIilbr+pmh4PBhxrNvYuSPbs1ZbPDVOXk?=
 =?us-ascii?Q?suYD75adSzBc6WTJYm/CxR6oeCaD+u6L5ds3akzBYuyVlJFhAouWkqkpC9rA?=
 =?us-ascii?Q?1vRaUgBHMZrKA1XFUwdz4B3MLDLMGsibNgfMnVEWBm7KT9MrcvhsTHBJoe7n?=
 =?us-ascii?Q?u/Qmc8i/QFP3gaqyTad7kW/WDBhOmb12OltXhnXj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 066032a8-dc03-457f-e923-08db70b8dc54
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5022.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 11:32:27.8623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xwiCxhIvwmc7+wAaF++PAHhqqfzNDUzSTB5AJrh+3VlVZhi+4C3Gp8BynwVt/qzV0Kts0B8VmN3aQJemVwlYgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5410
X-Mailman-Approved-At: Tue, 20 Jun 2023 07:08:55 +0000
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
Cc: opensource.kernel@vivo.com, lidong@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use zero as the return value instead of the unused variable ret

Signed-off-by: Li Dong <lidong@vivo.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index 102e1fc7ee38..fec0d014fd0e 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -66,7 +66,6 @@ static void s6d7aa0_reset(struct s6d7aa0 *ctx)
 static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
-	int ret = 0;
 
 	if (lock) {
 		mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD1, 0xa5, 0xa5);
@@ -80,7 +79,7 @@ static int s6d7aa0_lock(struct s6d7aa0 *ctx, bool lock)
 			mipi_dsi_dcs_write_seq(dsi, MCS_PASSWD3, 0xa5, 0xa5);
 	}
 
-	return ret;
+	return 0;
 }
 
 static int s6d7aa0_on(struct s6d7aa0 *ctx)
-- 
2.31.1.windows.1

