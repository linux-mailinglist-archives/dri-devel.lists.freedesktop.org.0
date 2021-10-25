Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4EE4394E2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 13:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9CE89C0D;
	Mon, 25 Oct 2021 11:33:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-eopbgr1310135.outbound.protection.outlook.com [40.107.131.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBE8289C0D;
 Mon, 25 Oct 2021 11:33:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtzzL0YOdHODD9k6bSeRwy/7Wt6lo0gDXJzmIkj5I/9ufvG7Hpy7qkKQP9HfigY6dx2uhuNGpI+WfJhbhPMKBfq0au+d4AZ8ujzS5KX/P6EL5fIeYlJrr0fWN+zoa2TN/l6wwEl1mYCmZ9aHu8yv2Hj9gZN/NrLa1y2+INPjsM4eNbtXhq+v07VTSYBfBXO2zegp16d5T0Fl72rmJBbhnyA7jVyLte4IvL0YHEGroA92L6O4+dUah5vG6lt5i4n2jgCmTSf/gW5ebHXXi+xtNdaIQxLgw1/cevyh068Fg9HydJ8LdBdL2DyxJOLc9FsRzv/OocQ3ox3Sie1wKqu9cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iaH0iEvrRGp3wCTfbYgs19ulu1qJ8sFEiRPxIRE1OuA=;
 b=KEzw2rjpVY5qnpJCVy6iGhz1okQNr8X2kZsumbaBuA2R/klDPjaDi5fvKsqkE2WWoy0ZR6Xf/KIg12m6UgfvD0aZXWU8AC+xBT2OO5a+iezrxSizTIIePviEj4USOJrYx9+4U5oZGrlcz+pcIl9DSipRBALaf28Xf5c/NajpA64XozAVYX8/kv9D3CjiObQA/PK3vv7ci5MZ7bZeAbfhDQ4cvq1hjrsvTygS6WNNGVIA/Y4yDUzucolBZC/VNq76hvR3uBHdKYK4CiEOfbjYCcREMEpwN7QXg3Cd0Cf/tuJ4w2dcHIr7F6McMDbd1ywsZIqCg2+q8U5JOg8LxBLD0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iaH0iEvrRGp3wCTfbYgs19ulu1qJ8sFEiRPxIRE1OuA=;
 b=Dks+hO0az2j1V3dsV2IdmzBeMqeRlXNxdTTVPfVTbAhgC+O88Xu5xyOcAI9P8YazCjNAnZNys43Dap2fCr2nsQXAatChS1TdnOk0U8wBd84WJvnKGeNkWGb+XNpte7Uo4L7+obrebLpv/ySX8dy8qlmudp4kIPG8yuKQ91UCn84=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2123.apcprd06.prod.outlook.com (2603:1096:4:e::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.16; Mon, 25 Oct 2021 11:33:44 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 11:33:43 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: kael_w@yeah.net,
	Wan Jiabing <wanjiabing@vivo.com>
Subject: [PATCH] drm/i915: Use ERR_CAST instead of ERR_PTR(PTR_ERR())
Date: Mon, 25 Oct 2021 07:32:50 -0400
Message-Id: <20211025113316.24424-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0010.apcprd04.prod.outlook.com
 (2603:1096:202:2::20) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (218.213.202.190) by
 HK2PR0401CA0010.apcprd04.prod.outlook.com (2603:1096:202:2::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Mon, 25 Oct 2021 11:33:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c62bbded-1cb6-4418-6b9f-08d997ab4c94
X-MS-TrafficTypeDiagnostic: SG2PR06MB2123:
X-Microsoft-Antispam-PRVS: <SG2PR06MB2123E7013164D89448630121AB839@SG2PR06MB2123.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:397;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8P/19vgSXXriXgEqAejZT797hZge4ZwlZQhQUKuTaM//gjHRlqUL8GsxiAtXPU8mneUkc/iqppBm6APK5mWE1YPCWFvY4zMGpJbAT/Zq5cus1Y1jRU+niamt9HbrJOz3t/7zr/PmY0Znl6oaFSn77iSOQzq8WMXrVz/OKSCsrtxZNC7kByTkdl9l618RM2egX9eUr8TIQ2HSOmo++azJYzz4htQpsQ15OR2sNjNMY1K7y4dStrHsEMJVhlDJOxWUievGcRQQVNsAb7jvsYRVqdp5bqPqxrmFpDGioFbGY1xyr1QozkhDnhTjqfprE2D7XPA4XQgIO/t06J7taTycK8ji/R5z3Ka9jACTtM257S8yaenuUO7t7EGF0K/kfNermK2na54Xh8fKl6kFeK+Svgjevp60ms+ZUtc0Vnl/YiizkQQhHopfC/JeyXLBgJnLga21TvOhHKk2uCUfdHx7w60xZHUYxnQe3vcggoaWpkkMTk0zXv9rK/YSJBp6yfVH7j7oFdebL7QOMGh7LLE119knT2wtZ1R4hrnZMaPDrXS97cRucDixg2uarQYlFWrj7NijhNpsZrEchGidn2XR6Ky4FPQxmmfO/BZkhxWInCYE1TNBkCAgv8LXdxuFkDybywHaswNi++QQMNFwuoIDKn1gV09eH4j6cxceRZu5aoiaIfup4sq52Wq2imvFOxeZsymsSkMuBChR8v1sMPIYBwsGYIUonHEz26QZo4ErQkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(38350700002)(316002)(6506007)(38100700002)(956004)(2616005)(36756003)(52116002)(2906002)(186003)(83380400001)(6486002)(508600001)(1076003)(921005)(7416002)(6666004)(66946007)(66556008)(107886003)(6512007)(66476007)(86362001)(8676002)(5660300002)(4744005)(8936002)(4326008)(110136005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KaBcbTDv4Ge2h74vj7ow2Ilzvs6dFcDqj7KLsz8uxLWei1VPCZ5+wVSyTei6?=
 =?us-ascii?Q?yfmOt0HpiUiKxn6kdNjfV5ca4L68r3Hp+lrucVGuOA+aLvzD2ss/uyCUxlyg?=
 =?us-ascii?Q?8UE5gnl0dTWX3zK0GtB2ayTKAV1XVGC6wheY06RPq9zoFVD42T8HDWRCeilP?=
 =?us-ascii?Q?8PDR41mv1kB9EuaWjuYOoJZCmnGQGs7phW7Rf/96tybVDX5bTWhOiOwUQh95?=
 =?us-ascii?Q?rSqj2RHq+tiQYJdlQZ7YxSQlCP/T3buQDgcIlNFTMRcG6EJwgRDEzvNiV9v0?=
 =?us-ascii?Q?jZ8BlVvIkCgDTU05NngJ9fX/aHNGdPm0mrgDiEt6NYPLXHVo5+/yU5qZzGaW?=
 =?us-ascii?Q?DVk8x+8/0tDJV1UJALXAdozR+wiDMn504gYgbK0lPpadQx5VPMFGJSzgDUyv?=
 =?us-ascii?Q?TJfSRXmlTJWHbSGPlZkE+dxfWBHYO6xRrHIq2Jai434xMdj6Y1BIxBt8u9Bl?=
 =?us-ascii?Q?yuVTpOgwmc8mZb/h0YNcExL+P42A8+uYu6dMikfBJlK8ZRx3OWZC1cywh9N2?=
 =?us-ascii?Q?etfu31XmTEURRiHRAljiHRAdXYKGqiDbr+NnuEvb7DwL9BdUWXXjaLpDzxqD?=
 =?us-ascii?Q?91JmxYd22cKN1Ffnmfzl0kG8iqiEBK8A9pVNyU4+pv1JIAvfdDfulh/NVw2Y?=
 =?us-ascii?Q?kvHZI+g/go2Jk9U+wTDP1To1RgqKueBu8GzmgY9A9LAcezP81bS14rKGKPDR?=
 =?us-ascii?Q?RgDNzv+jhuigvdkzCFHDMe+BlD9KeKCvgKxCSroOKFHCFN+hYFqxbdg0U0jf?=
 =?us-ascii?Q?KGMaIcBssdiUTVyJEp8bRfIU+csdmPtbSnNkKl+/gC4tlTMt8etLSwnIUcP5?=
 =?us-ascii?Q?P/d3tk9uWzQ8suDgdDkG+RsksA8PYVoUd/bPvHXgpTE8AW1CXSNMCg0qZQkn?=
 =?us-ascii?Q?rzRuaV6ojffoUUOk5sbYnfrXpt6HIkAANzCINKO4O/CLO1aAXy2K2AGcKfl5?=
 =?us-ascii?Q?5OKoP3bedu/hszBttoHahhWrd7gSJivLrLU+lXgUqlDZQH56Z2yUADgK3pQq?=
 =?us-ascii?Q?18V425xUirmUkjdV/oLwxNCEmpVlIitMBYTyHI7UBqL5IRthQ1uEMOwBZNb/?=
 =?us-ascii?Q?9jobjh/gfV9v5zFy84bBdik1GRTQyGFNA46ZYdL4+Qo4xCFARTdlnoP9z+dy?=
 =?us-ascii?Q?PwSYnODWRCoWMIrTrrKWm4GA0z9YBQlAiy+QrWO55D+Btg+Q2fKM0G1myX1Y?=
 =?us-ascii?Q?hSqSfWEDnWsYNtD1OnHdVpPPC+74IJwvK+TKYjkQiuToEFEwr0E8hthMccTX?=
 =?us-ascii?Q?J+MO29GR4Ss7F267hLkWwRL/vU+F3cTfh2Xwy14qTT0Z52yA1kJf0VIlFIyD?=
 =?us-ascii?Q?KdXfaVP6lMWBXDu5LzzNoID4DaTbsHd8m8E/XcwAXc9GfsS1TWgu9V+TSG9o?=
 =?us-ascii?Q?xeTkLreQkg53dWudii8qvTg5ioSv7u+tFTay5iXAgWcssZinkeiWFjmwBSyF?=
 =?us-ascii?Q?zu0hLl1+JNnck/reRdsrnNMz0AA4/YY6IggmpfWvIYWL4EYMP14KdKE0OqI4?=
 =?us-ascii?Q?i7m9/3bctmshI3dW5EvUx/mu4wWs2MI74/aXzfK/qtQCcYS7xFNLx9qd0MiK?=
 =?us-ascii?Q?mp0OnEN4n/wjmqtQyvoz6/dvKrrJNo15LJtA1TQTDZoAphx+7SDnqlM3uiM0?=
 =?us-ascii?Q?NyHSyJrxS+gbHaRKPlPa+nA=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c62bbded-1cb6-4418-6b9f-08d997ab4c94
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 11:33:43.2911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5oFWN5cK59SHg1OuohJcwbqtxczpdIR6MPFdgnVGUuwcy7OAlt3KZhzg7P+JKuNKhEtJjHFjsbwwIX+XWtBUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2123
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

Fix following coccicheck warning:
./drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3117:15-22: WARNING:
ERR_CAST can be used with eb->requests[i].

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 4d7da07442f2..eb2dcaf78d08 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3114,7 +3114,7 @@ eb_requests_create(struct i915_execbuffer *eb, struct dma_fence *in_fence,
 		/* Allocate a request for this batch buffer nice and early. */
 		eb->requests[i] = i915_request_create(eb_find_context(eb, i));
 		if (IS_ERR(eb->requests[i])) {
-			out_fence = ERR_PTR(PTR_ERR(eb->requests[i]));
+			out_fence = ERR_CAST(eb->requests[i]);
 			eb->requests[i] = NULL;
 			return out_fence;
 		}
-- 
2.20.1

