Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DAD59D1A2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 09:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F378490D83;
	Tue, 23 Aug 2022 07:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2120.outbound.protection.outlook.com [40.107.255.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946128F79A;
 Tue, 23 Aug 2022 07:01:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VpyW9tdptzpuU/NCkC6QhFO5Mnd8J3iwp/1Pyh1h6+T4fXC35sOuCAnMmpPhT4ufnIKiKG1vA8TFwDev49OD1UqXzMzZttqD1LNHlZj9zR61lCetMJEL3q/3yX0DJHvMYrpP3s8v9qEwtzqWjMy9MVHGUqiMiixIeyBTP6Olo7LOMc4A6h1jk3tiZfliJG2bW2mk/IMWxt+kpnNZSn7I89+ytBmpH6dYYSH2j1TMR6I7g19yztcCyFxK5WK85/pHb5y/Vc9MH7f+/sIQ7cu2QuAXHvg3p1fDZsLD9/tfobwBtotV/nlQC0X/Yw/fqSkQ4JSEBVUSaZ1yQ0BbJLq/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qOpmCsG6mcSY4yimbJNGNFuQEXdYoFkdmw5s0VYet8=;
 b=fGGQ1qskenJHXQXwezlhf19UM8f9W1E3t787fPetZtWemAsWUgydkTD/+JoM0zcubeEi7v6LrFTq01470E8+4Ex9u/9PidqkQ/8kK8n/xWbNqoQBpQxo+qswzLwuorZGu3qMVhyKBhVQsPbv4Bm/A7e20G7DLFEldy/iQZCZXV6IETUvMU8CZ4KJr9piXUMc+8ZARVSIw5J7ihKExiE8AdDJvBIWFpqRkJH/14Z4JO5Fj9icjcy9Y82KAhaz28I2KwIWoOb/clkqZHTCNzHT7NjvyjplFbQMijXEWk5T/W/+F0DIEXHH7zPoNqJw14U1FIkytVA/daWIUReiT2oHWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qOpmCsG6mcSY4yimbJNGNFuQEXdYoFkdmw5s0VYet8=;
 b=isRiITEf60DZhlNxAAlcB0Ij6k/1uinsWRDFblEzJHF/AWPX3+JDqxtp5FR+eewQj4Gbn9Wc0nX7Bs9dh7nq7t2BR1fY3JT/jIc8V3+pUqjr6l1PM1JB4+xBSeuW6spGcAm0/AUTiAWO/WH4WsPwptEmzpffiPQ5DVzf1t3S43E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com (2603:1096:301:37::11)
 by SG2PR06MB4900.apcprd06.prod.outlook.com (2603:1096:4:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.18; Tue, 23 Aug
 2022 07:01:01 +0000
Received: from PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0]) by PSAPR06MB4021.apcprd06.prod.outlook.com
 ([fe80::5c66:2101:a7ac:8df0%9]) with mapi id 15.20.5546.023; Tue, 23 Aug 2022
 07:01:01 +0000
From: Bernard Zhao <bernard@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Jun Lei <Jun.Lei@amd.com>,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Martin Leung <martin.leung@amd.com>, Alvin Lee <alvin.lee2@amd.com>,
 Samson Tam <Samson.Tam@amd.com>, Alex Hung <alex.hung@amd.com>,
 Joshua Aberback <joshua.aberback@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: remove possible condition with no effect (if == else)
Date: Tue, 23 Aug 2022 00:00:44 -0700
Message-Id: <20220823070047.20930-1-bernard@vivo.com>
X-Mailer: git-send-email 2.33.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::27)
 To PSAPR06MB4021.apcprd06.prod.outlook.com
 (2603:1096:301:37::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 93fe2b21-6584-4a59-3ee4-08da84d53cfc
X-MS-TrafficTypeDiagnostic: SG2PR06MB4900:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MGOqeID+oSAP6MAc4QG0FfJhhXY7MveFpjII/2FxS3vp8Kh3So1yfUfCqkyeWLyIrV37EjAwcNPwG3HV8EXsnkibJ174TBefxqWaXVvMV2wqYS42OftGCZOykFl4dMWHr8sKUU0Z0VfzKlswkL+AQTZitiPCWfVSVsvhzLGY3rEOKn3PHuM1gK0vWMiu+QEd/MEcHIwbi3KxpykrXmpVy8xRSi9F4qENFpZW3fBiqbfvv+V4kV6NA07Y4VQOaTXN99O+/STZPMzk1EoPoa6w612D22MTv7MMkYp8WhhT65bcKIiN+149iqKbgGX1uJKXBYsZRLEmYjMOqMlUVYHmNIhcg4rh7wMVqzjMv9wGfdAy7Ygl934fhaW/NIfZ4eVD65FHZ39A8Wg9tc5Pyuw1iWXLfq5VeMxcJbIJd3LsHHcJRsR0Fd5ue5zdmBHFTlwJFMp4bUjYbh7I6ptjWUIMEIkS92FJfsbF/Sxj22MmB0v3knxaq2bIql+Bn0Cfj7DeRwChfirEAvwBrjC2BjB6mmqbHw/eOeX+Cj0TZtQU233kUP6WC3/0a7arqriT1serB5z+39FJZ6iS78tePt1/GEAwSPfxcZ4mM4c3NYXAdA9o9PB7YrI3UaS2A3dhwC2X351rOcndwaT/BX3jzm2RzlzAEXVQJ/0YuQMQ+yu+qk9rmOrx2DI0GM4R40wD7WrQxmDLS0DLB+tA54fR3eYgurne5ZYvZVAbAurWEr7fI2Hx7V17XlyXVmO8e3bsfGtOUNddeGFC6VIT4l0J3HG1YABT7G54l4wHx3R2mv/sPMA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4021.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(110136005)(2906002)(8936002)(4326008)(66556008)(8676002)(66476007)(6506007)(66946007)(7416002)(5660300002)(6512007)(26005)(41300700001)(52116002)(107886003)(36756003)(6666004)(83380400001)(2616005)(186003)(1076003)(6486002)(478600001)(921005)(86362001)(316002)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RN2HJiwzk7GRB8m2HN0MlE24/4suq5CMobG8tVepP8DcWW7nJuyZli1rWIYE?=
 =?us-ascii?Q?4/fYSNo5GFxmogGLYx2I94KEZT8nIUquOlehaQyfW4N7zRr/nkr9UtdMyGGE?=
 =?us-ascii?Q?AvU34v7cdLMtAWbufZU9fwOvcxnM9AMU6inSA8Ky1m607/9jawT/s4GKozk0?=
 =?us-ascii?Q?ez0hDoQg1cD6E9FKKN9nExKtoBKqMpae/cxD4B1HMFd1wWbtYcpm2RKACIHB?=
 =?us-ascii?Q?TDw1/i4jm4dCJIhnOp7M5aEuo6ZIwY7lIVsivX6JFH9reDNOFbcY//i5N1LZ?=
 =?us-ascii?Q?QQuVVGpr65A2KvKwjMcH9ys2An1q5NH6c0rVyobSq77ChB79uA+Bzq9rMS5F?=
 =?us-ascii?Q?5ycrgNo8V+BF3ZX/WjeHnJSjhIX6ZFDyEDz8w4I5obrGy6fNySO35pNKuDze?=
 =?us-ascii?Q?MK6ROIrR4ucn3NaTu+MAfZVABaTPsC8Z2bF4UUA6oNymkQLABmnaxDI1BV9P?=
 =?us-ascii?Q?DxkIFKAN/nRY3J4AfIxpI4XU8pOXYJqXzZbd6fqWbtpYFUqgILfb7HkDuX2q?=
 =?us-ascii?Q?faTCrk+xsCw/jl/n8Wc3XLvQK0YRs4yQ/e4696226zM0QYgZFdlBrf4X76w+?=
 =?us-ascii?Q?CDxxV+0w+xO1JLL9Url5PBUQVc7j3YKVcHPYN51rcQPfBhm85fHWXFI4KeC9?=
 =?us-ascii?Q?fLMxufTLvhHAK8hv+Xz2JerZj/sDGz2vxafD/Zx9uaRu9BcWR28Ol2bYkQT1?=
 =?us-ascii?Q?dQS+lYxPwx/NvJ+b0J8XuoarLfeTq6AdWLOtxBKL/gHOouB/W3mNUWUaqyqA?=
 =?us-ascii?Q?M4RmKroXiK5EtxRfavi/0GLngh3BkzsGSIw3Tb2aE+yhEBhE+oWD1yVfITZy?=
 =?us-ascii?Q?jjfhzw0vSU+sHTwKqiq2ZzUrr8F/UZ/KuW4Yd1D1VGL5MBg+pUuv2y1iJEqK?=
 =?us-ascii?Q?NMN0Z+e2h+IGyJ15CZDPlTpwctpFPT05F83f2yrrTfcVm8SG77o3yKVYg9jl?=
 =?us-ascii?Q?9I2BVZCEgoimAnw2Un1fDxwVsNhIDtIeEDHAFQmzNurgsSZ0HsFs+ymwTjfE?=
 =?us-ascii?Q?f8UUo+iRRHVL9kbzoTDvQTtzMQonpS4KPzk9aJnyD4R/Ipz7GRzQJJ0N7gGQ?=
 =?us-ascii?Q?GSP/BKDQyLZU9x6JsD5k58Yo9VF/2rk2pm8fEb2z42LYK2kC1uzk7CbI3unb?=
 =?us-ascii?Q?KFkSpQ+LUNhANtI4Q8/yIvfJeZtolXCsHRt92VIwBgv67vwigasCJ3+wABVm?=
 =?us-ascii?Q?l/JJ0RGwjMHcgxlBuVWfcMFQyd0fFEQP2l6vBStelF94eZtmAW7i7M4SdeyO?=
 =?us-ascii?Q?6+VeiYNMD+ndHKPvSX/4zKB5djZotP8AERKZqA8Jt5fom9xWyFOCRjC3Cdlt?=
 =?us-ascii?Q?HmTpV6CP/fcozQbYcZvwDDMwbJs1ERFbh/f9MKHCe264g2LPg8/M1D6igF1M?=
 =?us-ascii?Q?kfJiQaTIWA74HcclU+7VQsfdWKYrJK5IzirdacLtZCHmeIYJb8L1LWScJXQ8?=
 =?us-ascii?Q?WUVpxwsjDojrmRapWUM4gGIIv/cSS7RN6F3YmDb9+pGVLgKcqtp+vxWt318O?=
 =?us-ascii?Q?6sjt6FkZIFXqWJewFCHmUTHW2yWQSkFWFpDqxkQPZvDoxm1jhRiM/hCO7BHW?=
 =?us-ascii?Q?N/o8cAlPzf0K9u4J/vsFinVHT2bsn1vQYALTY3DD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93fe2b21-6584-4a59-3ee4-08da84d53cfc
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4021.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2022 07:01:01.5680 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDu+6c42WbTMI4euaNkUxX3idGFPgPfhklr885o4tIfIEJ5ywyknRnv/zA7kFruaD7At1xTxonMw8SRZ3qf3rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB4900
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
Cc: Bernard Zhao <bernard@vivo.com>, zhaojunkui2008@126.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch fix cocci warning:
drivers/gpu/drm/amd/display/dc/core/dc.c:3335:2-4: WARNING:
possible condition with no effect (if == else).

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
index aeecca68dea7..2d4c44083d79 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
@@ -3332,13 +3332,8 @@ static void commit_planes_for_stream(struct dc *dc,
 		/* Since phantom pipe programming is moved to post_unlock_program_front_end,
 		 * move the SubVP lock to after the phantom pipes have been setup
 		 */
-		if (should_lock_all_pipes && dc->hwss.interdependent_update_lock) {
-			if (dc->hwss.subvp_pipe_control_lock)
-				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
-		} else {
-			if (dc->hwss.subvp_pipe_control_lock)
-				dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
-		}
+		if (dc->hwss.subvp_pipe_control_lock)
+			dc->hwss.subvp_pipe_control_lock(dc, context, false, should_lock_all_pipes, NULL, subvp_prev_use);
 		return;
 	}
 
-- 
2.33.1

