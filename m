Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED3A1A0788
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 08:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A345B6E51B;
	Tue,  7 Apr 2020 06:45:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707716E51B;
 Tue,  7 Apr 2020 06:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XczJ1Awn0u2gBY94YdsAqbfpZCuiJZkS64nMK1sL/iRaqlZ7dpIqpiVf5fos0Ah5yVZjqferG+x4HO97VTXNhzOR4rvHppPbOWT3uXxVXI+yG8YLGgYTw5igsBKG7Sg1LqZaXZrGEIma9I7yZ1o3nciA7YMRIpMR2MtYVBzy+0OruNi5uJel2VRIA9gvHNj4gpiA7mUxksgphnzk5zRGkofOB4Q2Noe2hbAbOEJbTsDZQQ8fNu+eDzMWKZypB98U0OIKNc+Py1HhAs8SDO+F5hX6vUmZnbk78qyhlhPqzav89QWUfvFNQUwaTrhxLoAYPxRMBx1VTsFhf5O0hD/28A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59lhrx0Kc/wL0YITmFyWdr1uX4Nm7azeVESnGeyfIrM=;
 b=KtvW0ghBdMJJq0ovMWzG8FobDHLT5nut18XIDJUtKSocTm60TWW6uCJT89MnAhUhz+wCtUhJijPn3pE6iD8/wWApsP4ApYh97mM+XPQoW220IAa13UACWmGYSg452hhAuFtRZVPLhW2GWXfgJGtBrKa27sUgbcGPy9Yqkyc5TnWjHhLMeWyxChSP8QWb1ob8+KqM6RI+tmXunymYjUu6aKZfwMXNSeayZ9V2fKolva42b0tSDEStd7m2ptXauFBec/hoOUlbNxYuLodqMt7W1IDoYBGK//UdM60civRMDZkcVwqmGJ+3X5mMeb1qg9JKJTe+VmKJ/YRGiEAUfzUyUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=59lhrx0Kc/wL0YITmFyWdr1uX4Nm7azeVESnGeyfIrM=;
 b=F88WithvY6sYnIV5/fh6Q9xHFS8Q7xepuWJaZQwOZ82G33yEtEGQ2JelIT+q1JaY8vYRN8R6cOEV2GUb0fqBxI8JQNaqCdfwQMDbhGuTHPskAkINC5ZgGs121NUdCsEuYSdF0Nzfjmex99muWgR3I+E1ltU+ry6AQ2nYt6+VeOo=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (2603:10b6:208:106::29)
 by MN2PR12MB4439.namprd12.prod.outlook.com (2603:10b6:208:262::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.20; Tue, 7 Apr
 2020 06:45:23 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::6417:7247:12ed:1d7b%5]) with mapi id 15.20.2878.018; Tue, 7 Apr 2020
 06:45:23 +0000
From: Huang Rui <ray.huang@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: clean up ttm_trace_dma_map/ttm_trace_dma_unmap
Date: Tue,  7 Apr 2020 14:44:44 +0800
Message-Id: <1586241885-25422-1-git-send-email-ray.huang@amd.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To MN2PR12MB3309.namprd12.prod.outlook.com
 (2603:10b6:208:106::29)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from hr-intel.amd.com (180.167.199.188) by
 HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.2900.15 via Frontend Transport; Tue, 7 Apr 2020 06:45:21 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [180.167.199.188]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 551eb4d8-30da-474d-d5c4-08d7dabf3ef5
X-MS-TrafficTypeDiagnostic: MN2PR12MB4439:|MN2PR12MB4439:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4439F7B32F929B7958D18B7CECC30@MN2PR12MB4439.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-Forefront-PRVS: 036614DD9C
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3309.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(956004)(2616005)(8676002)(81166006)(6486002)(54906003)(4326008)(86362001)(16526019)(186003)(316002)(478600001)(36756003)(2906002)(450100002)(66556008)(4744005)(6666004)(52116002)(7696005)(26005)(66946007)(66476007)(8936002)(81156014)(5660300002);
 DIR:OUT; SFP:1101; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oumXNPnpFzFf0Pju29FZIc3kCiFJQ+0WSfoOJE3fmjyLQsQW21y86hJ1yhN0HuT4bWDAh0K+kzhPY6trVIVInrPooY89D68KrjSudEHF/1q9pNlL2YxASpSPFMAwK2BGYwQXv9CUfDbxBwCySCeF2xg1eH+pOXqdSzMSnzPX9R4hJEJmYfRhLwzeXvARje5xIX8LahTGAvMdtl0ejCi+qtvkC3k+K3a43xoUYDEvoRv6SHcNJz89djxYkLJpL+qsSLPbE7hS9m3x147+av7rDC0M0xA7QYzv5ZM5IjpxWJNgKZxZ+hWCnyKMyVHzJXVP+jJsZ+CojbOrqmoVkCNoxPDAE9g0JABEJi1EzYx65OrmsT9SzhtocBr4HwXLd7E7Wgy42tYeLj/6wjgpF139w1ydTbgzUWPNMVbvmMOgTHnqCWYkp0Sspnc/RLk6VbcQ
X-MS-Exchange-AntiSpam-MessageData: hHxkZKyPN0ChdJLmSh9g7hXTMWJUFK+eSxDDuhru6ytwtecFzpIP8gRzeWwg33pPmnQXkXkLOICQ7h9umJNNhjY8aAxvDEWSOFj4iVAWCOE1Mab6/cPECxyf9RaoQ+J+1hTzpeT4mbtCUiQuUcib9Q==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 551eb4d8-30da-474d-d5c4-08d7dabf3ef5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2020 06:45:23.0359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ysmi1WoWUfAKzTy3s9lU1gUrNcXKoTAqN+NJmmw5aTwWkGlBUqn932aNxsEF1Em02JyYzVkw0YAuX57y1ACNkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4439
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
Cc: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_trace_dma_map/ttm_trace_dma_unmap is never used anymore. Move the pr_fmt
prefix into this header.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---
 include/drm/ttm/ttm_debug.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/drm/ttm/ttm_debug.h b/include/drm/ttm/ttm_debug.h
index b5e460f..bd7cf37 100644
--- a/include/drm/ttm/ttm_debug.h
+++ b/include/drm/ttm/ttm_debug.h
@@ -27,5 +27,5 @@
 /*
  * Authors: Tom St Denis <tom.stdenis@amd.com>
  */
-extern void ttm_trace_dma_map(struct device *dev, struct ttm_dma_tt *tt);
-extern void ttm_trace_dma_unmap(struct device *dev, struct ttm_dma_tt *tt);
+
+#define pr_fmt(fmt) "[TTM] " fmt
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
