Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E320846B5E5
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 09:26:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16EFFAA55C;
	Tue,  7 Dec 2021 08:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300127.outbound.protection.outlook.com [40.107.130.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79BF72E34
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 02:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iIm0QzbEd7RmtG2+rRKHsBq3xPPHldojUA5l8cGDEw9W8MJ+l+sVJVQJsHrpb7uWkA9jC8GUWnwA91amKX2VKlN3hKmLFi7xKjNISxsqlp7d8xienQJ1AeF5oSZMNNas6qkH8GKfrgfZd7PwVzDd8c/E1yQv+fJTTJg/nbhDCZIAptWTWhm8DTv7NHxUPR4kKox00TrLhZ7mj6lOdjuokb/I6kH1LvspFu5L5ORispWwrXn/mK7fEukAjaE0PcmVOx6sQ2jNdcOuSaSz9yZqg0O7frn2nMui7MH9+z21QEuptShredL5nMQ4gF3d/XcGqZ0UxFtMS/lNuPsRQZvJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cirse+5pX9YLWKdE/R3V/IMOuRRToxyqfY81JzG3l/c=;
 b=HCML6taQNJYuGdAJL+WjdJfecAw5k1LszO02bYZnjb+oZp3vbkzmOpASZd19VZKt+j4w6uKodXCZGjQAjD8A1bfvg4RiQhGNO1q/vogF9YAUNaKIXqNFDXNIJgpHe8ks7QJJ+Cw9N4liEvOKEHQKYm5jT+OdecStxKs5WKvr5Jc2Q2jEAN7zsIL+rUGjWuZn8TCYkTlJmdqO4OB3AL1YeMn7xAgGLgebkVTkcHYsVM9uMBER0SmaGCPH2XAnrzb084pkD/PicuImlRK+WsKi9HRmg0EbY8St0AeSdn+G99qr0eBy8QdiPTtaPbM2cZhR1EPLK7Lq5Re5mMbVJyYHWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cirse+5pX9YLWKdE/R3V/IMOuRRToxyqfY81JzG3l/c=;
 b=n2EoLv+7u8JGGt5JrjlvApAfYcTjkOD+F+JNgSO0t0W8paL9C+WdWnD5qlpaahMCBH2ylhMjNXlaxhSV4oOWFL/LSjzTWXpbwz2pDAR4Km/t1j1JYs4XvYF1cKkKPzGUqNpOj8RzLhQd9mpppwUgBa5avlKi5P5kppJrMgPIrl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com (2603:1096:400:26::14)
 by TY2PR06MB2974.apcprd06.prod.outlook.com (2603:1096:404:95::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Tue, 7 Dec
 2021 02:44:00 +0000
Received: from TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::6093:831:2123:6092]) by TYZPR06MB4173.apcprd06.prod.outlook.com
 ([fe80::6093:831:2123:6092%8]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 02:44:00 +0000
From: Yihao Han <hanyihao@vivo.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/shmem-helper: Remove duplicated include
Date: Mon,  6 Dec 2021 18:43:45 -0800
Message-Id: <20211207024345.37262-1-hanyihao@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To TYZPR06MB4173.apcprd06.prod.outlook.com
 (2603:1096:400:26::14)
MIME-Version: 1.0
Received: from ubuntu.vivo.xyz (218.213.202.189) by
 SG2PR01CA0192.apcprd01.prod.exchangelabs.com (2603:1096:4:189::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Tue, 7 Dec 2021 02:43:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6efcd14d-26c0-4b6b-b8ee-08d9b92b6c33
X-MS-TrafficTypeDiagnostic: TY2PR06MB2974:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB2974681E5CF92BFAF44D4A7CA26E9@TY2PR06MB2974.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:854;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jOnjIiWQBB7S+ryb0XkM39fHsw8z+2dKZRXnysBkKADMq99TV+ozPdTz2zmsAZbekpeSKbRi3bWHBOeoRAkIpTYHg8ZOUKLjcCZGhICZSZhItEgts20WcpRmfaxLompPDcGLq+OQefMk93kmE3ikyuFYUOwLh0quwB++ZtchHLSxHrsKNZtOubG6rdcpZz4wc+VGM5q9OnJRfCJUgxL0DGZpkIdNY/XNLQ764CrGYWOgXZbA0CHA8ZQyKqt9FnvwWCumayT4jUnonv+mv+ff1/IWc1hucoNnkVkRyohq3POvS/dbxqIvRsz/8OY3SgkR7Cr6KlVzQx4bzR6p4gfoI4rPrsuJ5EvZ27h1uzcfWveETRF323nHk3FFlePqp3MlAlmfMij0UmcxV4Fbt3videLOXI0BS+B5kSHDF80thwH+JBVDSfxAVpkgv8fB1TskO0OOUz42COxAy4I3yEvX2cGm0XpIykByXquGnMlXbWB//dbhUfvIT846v2IUMMyxrn+29qtEt6Zo0OuVbWSZI4yrEGkL9/bxl9sBnQOuGdcMc9c9khoxC2h5LpBWQ6jkhz0vN5tf2So0M+ZtFKLS7oSH/xwAahEqEF8vbpkGtjkrTzdmr5ZAolxsDomyTCtYnBStulzF8GKT6/8RwZYcwC+Ca9m3xZggRwRcpvj11K6yjcKZ8YhGvrFsMcBuu9zKaRBvLVkBBCdCNkJkObXQ+PFT5xuuYhvUzA6d5FVHD4g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4173.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4744005)(186003)(83380400001)(8676002)(316002)(8936002)(6506007)(52116002)(36756003)(5660300002)(26005)(2906002)(110136005)(1076003)(38350700002)(86362001)(66946007)(4326008)(6486002)(6666004)(508600001)(66556008)(956004)(107886003)(38100700002)(66476007)(6512007)(2616005)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j0nYCboOYPp3a51zZFhVBW8XPYwupecr4QnalP8fnJOOxu/4JDTBS/cPahX5?=
 =?us-ascii?Q?qLaBcz4d+vH/FCyXuQktUykmW0SMFxfILq6XJV62bAUdhbuKziUIVNVnUH0g?=
 =?us-ascii?Q?9TfeB5swn+o7k7K/Nabw4g0SCcvUaIdCQy/Pgv6RQHHdzxwaXHD9exsrTqZd?=
 =?us-ascii?Q?SxrL8LVRLoFvtRa0Vgb0t5zyyOVM/fTorYpt/4JDpq3uz5m30vNfXvCkjtx+?=
 =?us-ascii?Q?SkHuimeY+ZN6czgGp4mKlxebr7MJpndYWlCYbytic5pT+CkTDdaRJJeOip5o?=
 =?us-ascii?Q?Bqr+r6STueH+07ppnku4x1J1uyq7VVn6DnGUbugiPss/5CVYl+QTfH2aDTSY?=
 =?us-ascii?Q?65/G4As94x8NCThnZQQRaf2leKBE+7zwV9/eJO0lvge6as0x4JGE1BhiBfNX?=
 =?us-ascii?Q?Ra5HNVHqP+/RKX0vubTGgd0RhHT+O3xadqRSk/rmIsawp3Yvp9jZdv7LJjRw?=
 =?us-ascii?Q?DlxuQgmKcU1+M/nm9wkA3xpxGxtsseBrZEW5FewzK12r2KqSfGYiwyNUkfw3?=
 =?us-ascii?Q?QoxOelExDh3gGzLZfpHq4N4dwo7xKjkKCdUJgqU3U1+Bb0uTxSLYZcCqViWC?=
 =?us-ascii?Q?Onr/EYzjYBpC7qNDW2aGe3ZGirgfabHe5I2YDsM+VfIDRXtS33rjxB6buKuS?=
 =?us-ascii?Q?/jzCvpKtX7afW9h9i+HbdQrGU10gUBVa7AUI/8V+louka9FDJMJS/v9fPnQz?=
 =?us-ascii?Q?HF8otgnjkpcYwMWpktjrJp6LK5T11dI5e59vt9FEJksB9hd96rK1IxHeuwWj?=
 =?us-ascii?Q?ga7/RTHHiUxOJuu+0/6oxxFdJKA8CW6080CSzBs09VUX140hq8aEeO/Ou1o0?=
 =?us-ascii?Q?iSh2OW4VWb6MXLOdhpzXjDO4oOFewiS7rps4ZDANwyS+TncE0LGoB9qr83IX?=
 =?us-ascii?Q?dn7Qe/8/IIwrJL8/8fJ7kFSPMk3n8pRiK/Evb60ELwQwaTrrbw+h+FAV90Hy?=
 =?us-ascii?Q?Ew8qSisw+YyR7+YOC6KvMPo5yZRmN4fgCdf5+DKASpQ3wru9SxBBU7KQcYUo?=
 =?us-ascii?Q?qImY6Ts//6lb3nykgLnf9wPV4QwcUA8uZoCp2W+rHn6S5qpFKif8PlzXfyhM?=
 =?us-ascii?Q?3WZyAc1YR8V+YNFu37n/qrFvI2oWH7a9x3GNQcn2L69znQlzPhXXMa7HGCSs?=
 =?us-ascii?Q?AY85Ur0mI1wPVoGxwbCWWF7rixb9ttTZJZJ+Ds3fTMM9p34+Xt/1kHRkGMnk?=
 =?us-ascii?Q?y60Hh70sqzQLj+xz9d5DdHcXZ451pOEblmOXjgEGauU+7avlLBVhiZVOnEdD?=
 =?us-ascii?Q?o6Z/5Dmc+1p87mE2FSXTEK2VNDSUmV7MqGtIaO353mzXdCx4unS2nDCq8XLy?=
 =?us-ascii?Q?/XXBCchdu74VOj4mlCS42Qc5XHOCh3yNnOPxwCHcEH1JBPI5ETUfuo5fui4L?=
 =?us-ascii?Q?gsLQGLzSnh1MGq7XCPYJeeaGpNq+NOSTC+gjqhIok+mK+xYGegLzsQy5RQeO?=
 =?us-ascii?Q?b9InII60B/2B+HShzpd0ohYNraJ+Q6NR4Rfw8JTwkFlNQsWY5A+t/I3Ih7dV?=
 =?us-ascii?Q?absYpdQaCzpn+NABZyooJFMzdFRy1Q2sVxkmZuVWSPZEvPNDlvUDltlBGDcU?=
 =?us-ascii?Q?VeDSXoC678T2SsiB4xzXe/qHeOQ2nT6kLUJ3z+8u/y2+R82vZ5FzjytiGyNj?=
 =?us-ascii?Q?V52+fJrhj+9GO+2MTq1v0ec=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6efcd14d-26c0-4b6b-b8ee-08d9b92b6c33
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4173.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 02:44:00.1329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkJKmnEyk0wunSHK5XSd9kAQHGAs6Rwv/osTkPQXsjZ1Y0Pn3HQVVShRXss2K9T1WMwHTiOV5pHUc20LRLx5hQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB2974
X-Mailman-Approved-At: Tue, 07 Dec 2021 08:26:14 +0000
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
Cc: kernel@vivo.com, Yihao Han <hanyihao@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove duplicated include in drm_gem_shmem_helper.c

Signed-off-by: Yihao Han <hanyihao@vivo.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 621924116eb4..7915047cb041 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -10,7 +10,6 @@
 #include <linux/shmem_fs.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
-#include <linux/module.h>
 
 #ifdef CONFIG_X86
 #include <asm/set_memory.h>
-- 
2.17.1

