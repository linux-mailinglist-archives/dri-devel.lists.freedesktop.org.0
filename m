Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B72FB299DE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Aug 2025 08:40:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37D6E10E3CA;
	Mon, 18 Aug 2025 06:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=vivo.com header.i=@vivo.com header.b="bn3NiEUx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYDPR03CU002.outbound.protection.outlook.com
 (mail-japaneastazon11013036.outbound.protection.outlook.com [52.101.127.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D948C10E3CA;
 Mon, 18 Aug 2025 06:40:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wxy7DqYYvYGW8mg3v3OH79IF5sezU4LGosdmLeGoR3xI5eVi8ZuTxSHplHhbiQjAwA6rWRvNat/HAJ7ppRsvBpSw28Ck9ELUhjUZ3bbdwSNy3FrJvcGt/BLECLE98CuNfCWtg9QYU22gQPrsAp8rpBNHfGbCEGIERHrsAb/Vkoof7yB/t08rR30Lse+otuYvhegiUYyRCkDnmK24gaAPhtXEh4QBKKfD6zjm9GKEiXZO2B9S61qrsy2bXktz5RfEgFTihAcQu3M6p6+94ePxHwsSmqtbIzDJBmL30gIx5ro8Ic9yElnrUfX0+4VshjlUNpXnsO7e/Q4ZISoakUBvcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1+PaZVxPdZiMryayCu9HybjlYhXsV6E4I/QsU2CogA=;
 b=akBJbsx3/Cph/F80Is+HyqFK0IXB8VXOqijWLP6MG6Eyj9ne/7QgcdsHGvCGDTfPrnQjrdq/Kha/l8qVlvM2GyLLjaAXHWNhrMrw6+wbhaQ8JJNrzyJQBLbzb042pFhhRVH2dSgfCMPVk6MG8mBfZ9KreBr4nRd+gv+FhW9cnUeTQwdEdRmwFRSkpLaX1kC8VwKe/nXMoEhVdsJ45tsj4MTp0hs444YqH9a3DAYX8HRpCM8CkXUNVXZXkJajcx0OgpwqWAw1RVgLesHYL+znkfyB2ksky2RLfdiuVnxmJsqNj/yrk0Wco17hl5wg7rT0Q1Q04IAm/Zt+qG8HjIByfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1+PaZVxPdZiMryayCu9HybjlYhXsV6E4I/QsU2CogA=;
 b=bn3NiEUxYF9r+RiD8qSaWBmXjc3R+PudlxI1HEiER+fi1Vo9k+A8rCfs43PfTU+GddZ59MFqM8yY0RZc1J6E7JlLR+9jgjLA0YfTs2q20GgFPBRizkXovRLUxDobeujtnWpIHoKIngXTUuMhZ7QzeqhytxFWRgo1wjdcFOZ8bB03Mx8dHuBuuwf9tpy93uH/CQRGCTG/lzpq0Wiz8+MmNv0MxRlRUK2DcBAOIwzDfIEgA4tGRw6MSzWA8kENx/8eP796Zr5146mkwCXkRjWg628hn7R4ykJKtqqcUclKz7XXEKSJK8q8TbV/0ri0MtnE8eWSct7xasqgUjJfzLujVg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEZPR06MB6719.apcprd06.prod.outlook.com (2603:1096:101:188::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 06:40:23 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9031.023; Mon, 18 Aug 2025
 06:40:23 +0000
From: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Austin Zheng <austin.zheng@amd.com>, Jun Lei <jun.lei@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: [PATCH] drm/amd/display: Simplify unnecessary if-else conditions
Date: Mon, 18 Aug 2025 14:40:09 +0800
Message-Id: <20250818064009.447555-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEZPR06MB6719:EE_
X-MS-Office365-Filtering-Correlation-Id: ee814a7f-74bc-4210-8d3c-08ddde221b69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aX1SO+kDEeAu2zv/R3GQvaIT8wMhF9PP1EhsXuf6TsZaC0HrALuw3V7tv9WB?=
 =?us-ascii?Q?WXCJOMp0LfdAzRLOqh+wmhSevBSZ9JD2mM0/tmNvyOerDQrZzyTZIPQgb+4f?=
 =?us-ascii?Q?Bd3qwPJDOgBoNlkE3iHIF00+HiilcMFPBCDQZ8xR1ewoXehi/P7xdQhzkRCF?=
 =?us-ascii?Q?tcAO4kHoOaHEjOJNJDM0z052zGfeOJwGMXtki1oQQQMTatafYNTEJVGTZ4pA?=
 =?us-ascii?Q?nz2G7ZL9rkcsq01LvoAjAJVmj8TDUk7kAuCj6YFBxu6IJ3p0ZszCSwNodDYk?=
 =?us-ascii?Q?8kSX4nR9MBfLvUdYHPEPr/8iPp9xHbF/D6ErlWnezBhOtejA7lmv5PDfhoDD?=
 =?us-ascii?Q?WgGq6vPN5tPfr9ItTHffb1gNnNrKtFNd/CiVSkYK0Lod89LuCgoRZuwKp3C8?=
 =?us-ascii?Q?BQQ2P84Yo8Ks5+ydLBUwPpKVi+MPp4nbI2wvLnscRUtwaezKrd7hVoEC8Z2o?=
 =?us-ascii?Q?VOehqs75ACdZo9lrEuHjEi2HEF4u5WKzhqmhpCIj4G0TmOJvPertCBKc/1fs?=
 =?us-ascii?Q?ESVaLbdGz8E+8J7uQftNhUNu4BZBTDdEuZ2Ucj7s75s+BgG1ovvO3bqhmRZ4?=
 =?us-ascii?Q?MtyQNPfzftj91ETB7LRrcvztNt5cXdGuEdWcHXAbwUHyiOLi9p8EyPlInhMq?=
 =?us-ascii?Q?mpa4Y588du/S90z4us0H8o7fqyOcSx4X/YRdKxNRBht4JWIl+mttX2gpw/3A?=
 =?us-ascii?Q?Fm10WKSLpXyEQaxgpcWZLFy4uizCfihZHkghYVjndGvKGdSVC4T1OzQKtkW7?=
 =?us-ascii?Q?4dbEsH8Y2jBbx0QH7bUaoHMIqFLodrg7Gzk0hkt+76FCLxGTw1MZL+xgtJMk?=
 =?us-ascii?Q?ZIomGFnlxnjfvtUuLRMSHXUSzqp2D476XuluWircnA16rYDT+ZHPrJnBocyR?=
 =?us-ascii?Q?qQK0gmgdz2dT86gfKO402qBh56Qr0bz2GqBLWrgXHMk+ZesRuWyTh7y+WFGR?=
 =?us-ascii?Q?ay8e9UJuwJcu1V5dX007ph+iACdsZGgNQVq/kZ1DNRljZDLKjd9HqAEUycnU?=
 =?us-ascii?Q?3jWODFNzDXr/eJHwylfvutBxxkVJvWQZ4kNHsW2MJ0tgpwYEWJZFFAL1UC59?=
 =?us-ascii?Q?z63b1NfTjE9tDyimGvrbev4N4GGoAmAStiR8I7EvFoGrd2RYsYKVo2AIJYJP?=
 =?us-ascii?Q?LAwzkPdg94dDEvRe67pX2MDP6VK2MaJSGoKcnJ0WPHWQwg1NqSZoVTXsUw4w?=
 =?us-ascii?Q?eCelbIp2gfFT/DRL2crVJKqiKykTcPY22gMi5jzgMyVzc9XIbkNxKnW78S7H?=
 =?us-ascii?Q?pOtZd6td4MHvcRcjl5+XM2wlG25yhNUPiGXVS5UlqiZFlFHpVm+EObynsoZQ?=
 =?us-ascii?Q?wBGDzmqgACfWdGJ4/U70Q1FP+oEYUm0SEMcR0eTpR8BUWJ/rtu8bjv34i5f/?=
 =?us-ascii?Q?U3N/lOS0XjNVqQdjdyrdpnQ5B5rlxHVYu5V0sbrvIREz6oTX6xTaQhp9B3/2?=
 =?us-ascii?Q?DHA+gRwDfjgwJHCe2znLvIlJQND3IzmVwPIIAZCo7XhCU+w9sTwN1VYCig9t?=
 =?us-ascii?Q?v/pXwBN66je8F8E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pfqnqIhC14xh5qLVNp1bEoNuXQ0irTohcjXDVtxkcwLYfRPpbFCPkY/VbmUH?=
 =?us-ascii?Q?sxwawJKwmWNfQUCX6fZFXLhp5clipdNM2aqRdDNOXw24A5q0W9K6SyRyTCYE?=
 =?us-ascii?Q?BCxtUuwUd7A7+5QDEQsMsdMu5+Jpu1d4cOrBPhE8CARkD0gISUoFdWwCmyqz?=
 =?us-ascii?Q?os1f6fbLOGWTf5cJTv54kus5+mkE4fUFOB9NlRZBc4cBo5bjKBjC0z6rlY8T?=
 =?us-ascii?Q?1OnHTeD71gogCQ1j4ll+6oaNzxG6T8s7n6fV9SY9LiSOI1z+Qib6Vtqgg/Lv?=
 =?us-ascii?Q?klb0pHwuDxQMUTWd0OoDyrmNqu5Q9AnZwTJxfLYNSDgGfmEj+/obrfsAf1PJ?=
 =?us-ascii?Q?c0W/zwQ588J1EklLeqb1u7kkAVWuxRzATKOLbUOl9Ob4e+tXNQCQLOYMu4MX?=
 =?us-ascii?Q?shtq50PECEtyheCqtDmJgqdah2K0IE3TwK2d/xRIOTflRIBygcn9BpnB9LRK?=
 =?us-ascii?Q?HDoE22kGDL02UUACBr2YncPtWJUzg9hynEUIDszYhJkQZjJYEug5ILZ3JOIY?=
 =?us-ascii?Q?Ly8f4qgt75rWboX7g0b1q2+7qxls2nlqnzaZr85H6OFpCbSwBkuiXfg/dmAr?=
 =?us-ascii?Q?USZQbnrh46UvWC5jolGtxcQu/R5OVhawhx/BG4dQAFtmbcdZ8XwwN6a50OBC?=
 =?us-ascii?Q?Dnzejb98GkUEvqLryqp2/rxiS6skzMyKRb4wR5gMUyHlxuS5QNc+6gjgWcKR?=
 =?us-ascii?Q?cAMYuJswVoF2y+gp2Yp+x29khMgC9yFGo0Cco4jf9OVsXogav1F+pz418Efr?=
 =?us-ascii?Q?qe+kopxVnVLXK3gGDzjxhsMuy5A1rfMr+bO5ExjApzOzBq0xa0Wq9eCucr2o?=
 =?us-ascii?Q?Am8d1f+IxxpZtibMYGHqS/u3SY1dNtvCnikhRaM2B0SjQSyyUQcomwy6sh1P?=
 =?us-ascii?Q?Vs9l9q0nCCTE2/5lgF9m4byHt4mPy5FyruI0Xi6TT60DkJJB8jr0GqxeC9O7?=
 =?us-ascii?Q?H0OCg2Ji5mxNpqr84JNT4YsaxK8CVx/bfmTRT1Q0LoxKiFnMDJEzC5syhrwf?=
 =?us-ascii?Q?W1ynoXE8oYZlJZIEsgGo4XibNGaO40v72Ff3LUSsrHOKLV8Ot+C0O5Pl1GAP?=
 =?us-ascii?Q?U2FUTvwrMirL4riBNYdusHJfag5AjcNGQ7ifl2gWNaAncIhkiSfciYIoeEvc?=
 =?us-ascii?Q?qrtfCg9nyvpD3L57NQ8zrPWWrx5U0TjHYpCNWxQrkjaX3rS/LTHLCdl3Rkfd?=
 =?us-ascii?Q?8SPrwvnidYEnvqNIQSjSmUmYnmzHVUaThnfwa4LMaMYTpfqGaESxaXRi/Yfi?=
 =?us-ascii?Q?pQ/9eNybD5S0PtQSbhXJpDYWAAJlk1edxtrmC52FmALbJVqP7GhJOWDin81g?=
 =?us-ascii?Q?ALXg1wDSWBAM2kREswdUxCelwZ7+VcAfOt57r4IKte6fwZkCsbsg0+K3Qbh+?=
 =?us-ascii?Q?o5sPReBfMtCGpZYhXCsCM5+nAQUMAE6gJ9pJ/1NcfY6kIQUlobSry61ZKA3j?=
 =?us-ascii?Q?3PjDNm2YhF9psl8JjckT9YhDuZGg0B8doTdQVj+Xa+0boIkWUOgiB9ZJf471?=
 =?us-ascii?Q?ZPBcqQklth11Pg8P1sQqYa4zM+Crdo8tYSNYz+o/uRS2ng77Rc8Nv9exIrny?=
 =?us-ascii?Q?xd+LgqlB4PLPipFmOFxG1I6kIpf2MXmcbOesls7c?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee814a7f-74bc-4210-8d3c-08ddde221b69
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 06:40:23.0163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sErTBkKmgBoV26M7aAKpaxPROIg5cJKX3hbuOBk/E1g2Pu7/t0vSqG/Jd2cE+DWcEPluks5YMAAcZES4tZT31w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6719
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

Some simple if-else logic can be simplified using the ! operator to improve
code readability.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 .../gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c    | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
index 5f1b49a50049..45867d1475fa 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
+++ b/drivers/gpu/drm/amd/display/dc/dml2/dml2_dc_resource_mgmt.c
@@ -500,12 +500,7 @@ static void sort_pipes_for_splitting(struct dc_plane_pipe_pool *pipes)
 
 			if (cur_index == pipes->num_pipes_assigned_to_plane_for_mpcc_combine - 1) {
 				cur_index = 0;
-
-				if (swapped)
-					sorted = false;
-				else
-					sorted = true;
-
+				sorted = !swapped;
 				swapped = false;
 			}
 
-- 
2.34.1

