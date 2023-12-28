Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4AE181F64F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Dec 2023 10:33:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F151210E09D;
	Thu, 28 Dec 2023 09:33:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01olkn2047.outbound.protection.outlook.com [40.92.53.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8675C10E08F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Dec 2023 08:08:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UEGom5VvxSY1g0VOAXhJ0fBvNAt8L/FLGfiCZK5nUHPkwAcJxPQcnL62pKfkOnPE2WVLlrZxCmWNGe7sGCBgd0tG7zEyj5w0yp0i+0wRVgJA0pCAFeWneUm0xmkEQCUXQIIqMJRbI3jw4Xy7XBVlR3/RuGnfjUkfClQHxJGwzCwXX3UTU/6ZRw6CXYg3JJLQuylL3gMzilMI/jL2XHksJe0KUFHbfyU3B6xL6ALwvJbA1neUituePns/uk9CwNMABTikP93StHXZQ8az1FWFkzWSq83yGmfY3T6pm97XX2VGuAKYo6gT54wBQXOgcdk4yTUdw5MTyB4LjToajwRnbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6KhU1Hof14KPOFkZ7YHBAB0CFRJlVyUDj+i3qSKwn8o=;
 b=R/Hr1z25sDAvZEGc/ObDsPt9CUb+au0SIJPSfLqE/dmNdXRQj8LAKeFLbAU6wDcMSnj63zMqS6/oJ9nRK5LZNf8TmEDMMCFIg7twH+INSk0s4IVB/x32iUGyYTWkms10rFxwG7o0mad2ySojZWaAUr6sWQYf45fY2EkgGGv788r6Le9+KLUwIWu4NBbMk7rvCFBGeBLKQYy2wPeQtXztg/F3ITMEUeWNvIa9PmMnr9GaT2+beMkUz2xfzrCDAUiVOxaRmUGYwEXY7KDON68Qdgcx+QQnaNN1horYYOPXt7nyPhfhRAcZGruEZoZpJ0f3ruiojW81RNyeNWWBELDr4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6KhU1Hof14KPOFkZ7YHBAB0CFRJlVyUDj+i3qSKwn8o=;
 b=N340caaNruoFQLdozJ5KRgC6BhHVTfypHF83xKxGQ5YC8SAnOgsltZ9whiGiTG59RRxDKAdyFYNiLquggBtGr66UtvDn/THS23+c/rh3GQXzAIAA48TtvGsPIAnjVs2vCukGb4vgCtzadeeoPSR/YQDgZYymHqVo3LdJBEdf4PtQ/nITimPTt9nGOjj4XZAiNztJ3cB4j37PgmtD1VzswnocbQza8vwqTBB1yfsD/MOS1EQH8GaX7GoPmSFgwrWb1i6PTcN75nKJnSYKxp6sfrdfv+GurlxAQb9agWRo30XOx6Xm7XiKVsfMseL9Gs2pKNIijYq3mFOxzUIGNLdhVQ==
Received: from PUZPR01MB4775.apcprd01.prod.exchangelabs.com
 (2603:1096:301:fd::6) by SEZPR01MB5944.apcprd01.prod.exchangelabs.com
 (2603:1096:101:1ef::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 08:07:56 +0000
Received: from PUZPR01MB4775.apcprd01.prod.exchangelabs.com
 ([fe80::5e38:f99d:bccd:14a5]) by PUZPR01MB4775.apcprd01.prod.exchangelabs.com
 ([fe80::5e38:f99d:bccd:14a5%6]) with mapi id 15.20.7135.017; Thu, 28 Dec 2023
 08:07:56 +0000
From: Yaxiong Tian <iambestgod@outlook.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/debugfs: fix memory leak in drm_debugfs_remove_files()
Date: Thu, 28 Dec 2023 16:07:40 +0800
Message-ID: <PUZPR01MB4775A8F67AE31D6A4927E6B7D59EA@PUZPR01MB4775.apcprd01.prod.exchangelabs.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [/hptjANvati6qck8aLecKrUbnA8HAplvagiuBBoyCzIVGxgoSCO5vlZFC94Xtty2]
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To PUZPR01MB4775.apcprd01.prod.exchangelabs.com
 (2603:1096:301:fd::6)
X-Microsoft-Original-Message-ID: <20231228080740.147585-1-iambestgod@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR01MB4775:EE_|SEZPR01MB5944:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebe75ac-0883-4883-0b5f-08dc077c18ff
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y3hypHBf6ELCAShY3skCiBmtAL5ljcpywkF8kGc76YYxmXSFOwNOvLicnEDv3tEhPywK5PUef3t4wLX/Gcs0zgADvpEX3O0jULJ49ezCf0BZEh+TFVWHjfwa51MclkPXQQMXtkQKZeg3b0NSwAJapb0ZRZ9yfl0xRZzMpXUt7tLXNKKBZZDfIpbFFN3c01arbLdXH2DAY5jNAvq7Uq6q6ti7bwFKvKK613r0NFtMMzIIeb0MeEM5xHYjq3rDna0KLTfIjpl2VkBrfP6+LgGhtkPS3WC58Pj/EaYo5Oo60xIMQ456c+urlzuDdF78FL6M/TQqpuX8SaVIvhx739ICWzfIPijCPTE/rXOjCaq81Fn7Y6YJTinDk2E4XFRK+JmgNmJ5s5VEhBr0huJ/OyoAZC7L2JWKzMrZiB1hN0CkscVl1JaQSm3oehkYOp9YLdyVzoHDWjk6ZgUGYLYiLEJDOFeBYcczuKFAOfA8wKa6roZyn0CzoTxUIOKzAvyF2ZIqmYrIMnoci4M8Uym5F0O1IePmSwH5ICmvEf7VGlULxaSmFVozCVnddvh7EPVRS0Iq
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aQaiVbiOsDZHh1DPhAAhAJ9AoL/qsV2W8jRHYaIF+7+RNbU20NUalOKRWknu?=
 =?us-ascii?Q?Up2TaU5eZfWdC9blDiwE21kGgnRoo2nqq9iLe2qpXMe29uzksjNI+BHT2vj2?=
 =?us-ascii?Q?IuvcALONtCoI3V6OvhVuZMt0Ah92ToC2uQF6B9OQU6zP77Q6g69KvwfqEwWV?=
 =?us-ascii?Q?ft/2RkRF+B8ZaMTz6FVZ01v3Qas5162IgS8lo+DtTgGaDg5KQRT3vS2CDYpd?=
 =?us-ascii?Q?cWn9LIMaXqg22RjNa5cqvrVB2W/hYEAxdGH5kD5BY35DTopmgFfnA27tONGt?=
 =?us-ascii?Q?h0wzaMj+rAda2AxbpOa3XTMMupsystCiCY3K7mC6Kanb4HusB0N9VM7jw7gd?=
 =?us-ascii?Q?MnATg6dxFFj75Tr3ZK7W6meOTONvM4ASibzXkKPZiibff2IrN0kt5cvfmu/N?=
 =?us-ascii?Q?gy8S0jvQ+WJ+hC7CpkJYNiUR6nz6J8dD7aU9Gq5tB0qRvjPgrV5N3217H95K?=
 =?us-ascii?Q?D3Qah5S0Ifl0O/TeqjmDSd5i+1ttZVe+BahUgvk/U3wAokjAF9mq642ZWyDl?=
 =?us-ascii?Q?fqSL7WfXUjH/ETsuO5wIdSXA3fvupOA4kTfP8Yff1ACClL+Ekrbmjw3ejkoi?=
 =?us-ascii?Q?VEFCjuAD36Zzljlg3ZSkKuhd84YXctdHeN+hz8vMkYhvRQEps3ggqOyt0ift?=
 =?us-ascii?Q?kuT4kdgM07WchUjgUkF9YWv9Cs12mCYvzRDKv8rSxywWiBvEJR4GRW87OdRB?=
 =?us-ascii?Q?3J5xXoMf2vSuIBR1ENKBW1RZ+9kICACiaq4huB62OuI9LbWpOKozPCf+iisw?=
 =?us-ascii?Q?Ox67fZ7CJWkjT5IBqtV2IaFIK+8lvcMXFLz9Mq5Vfif3Biu/NWP17bWdRzVc?=
 =?us-ascii?Q?Q2Lzbpa5RhQd9GffeUWo3L8VOB2RJ2MG0mjG3e0ir+wqHe/6EkwfXNW/dNg1?=
 =?us-ascii?Q?v5+WSQrxiP26ys2IwM1hqdNL9QPs1DIVIvo4e6ybBRDAIh5w3pYP8r5d60qN?=
 =?us-ascii?Q?lAIAW/xizm+jYOZpGCQOPapJnmRpZNAxrz3NsbnH8gMxkhZTdg6T7tzeirSE?=
 =?us-ascii?Q?x++oAgOFs7rOOVEnasRI0ihKF0Hi5swG7iWKMMbhiyP6J3etuY9RLe1U9kHy?=
 =?us-ascii?Q?DbfVxuXhS5LubLFdj78XFdk/lgPknNP0RwiT3AR7ouQXP6j2AFGt8hUVnKLD?=
 =?us-ascii?Q?4Uyjm2okw7n3rLTy1vkiwN5ep0go944AiL0G3nTSi2bjtyhHwTdp+LK4zRHE?=
 =?us-ascii?Q?nzJFdx+jT1yhKnPdVudQaK4EoV04UBRSM70ydlaWsj78siK9kUi75qNfc8tj?=
 =?us-ascii?Q?ogDfU+K1ICn4Ljnh9QJnCtr8uTU6cLXZ4xCqLAanhfwSjtPdFoqdVLrexKaD?=
 =?us-ascii?Q?vF4=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebe75ac-0883-4883-0b5f-08dc077c18ff
X-MS-Exchange-CrossTenant-AuthSource: PUZPR01MB4775.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 08:07:56.3404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR01MB5944
X-Mailman-Approved-At: Thu, 28 Dec 2023 09:33:09 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yaxiong Tian <tianyaxiong@kylinos.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yaxiong Tian <tianyaxiong@kylinos.cn>

The dentry returned by debugfs_lookup() needs to be released by calling
dput() which is missing in drm_debugfs_remove_files(). Fix this by adding
dput().

Signed-off-by: Yaxiong Tian <tianyaxiong@kylinos.cn>
---
 drivers/gpu/drm/drm_debugfs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index f4715a67e340..4d299152c302 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -277,6 +277,7 @@ int drm_debugfs_remove_files(const struct drm_info_list *files, int count,
 
 		drmm_kfree(minor->dev, d_inode(dent)->i_private);
 		debugfs_remove(dent);
+		dput(dent);
 	}
 	return 0;
 }
-- 
2.25.1

