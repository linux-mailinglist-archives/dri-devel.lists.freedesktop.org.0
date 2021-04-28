Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7136D1A8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 07:34:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED196EA9D;
	Wed, 28 Apr 2021 05:34:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B334D6EA9A;
 Wed, 28 Apr 2021 05:34:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUKm7AHqQwoahH0Eldq+q/3eaDykdNIpKqUIPsguy35FtS+D+R6LUpW1U6rTDfhhLZSI5pMJ1awgz4ki+XgNY8epRWmr0+gzwbcjU9+X9z86znsI939Mx1CFqvF/qPNi5ZDKhi2ZYkJSqMpGUkFHQVUVcgZSbL+P7U35isG5UEnyHZdbdFsGmieP8M6+SdxZWWCa8GMSMaxB8dFYFJk29m2ct1NQCZ4coEb5QZV4u4/t00tmAEw/AO6BwfpwT9/+KJsAS3fGS9tUsyhq/K6s1SgtpBTFUMTCm7d/TBU8kCyZOeM0k5IdzBxhP89Hvi5RS4EVikS0vB7Oz7ME+zzPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YlRwJW+DbagvLksgnwuqkLdKXgMFFCg/v8tHMomJV0=;
 b=Bv5cygFBXZ4u9QIwQICj/+xsCWYLNB+WcnNLq2UNhXUvTjZX+e9OfNwcXV62/A35akTCClsFMMGPFDKfXouylwZYOSm3BCGm0DVNIRlIMl1UwEjlyM4RcAxGqzkAX5H4yWDjEXJCtGB3jpqW3gXlN+a+boKrW3zNBmVRpWlrJU6iV28PIs5TjEOJtQz2R4KDBbCOpCfHCn6m2cy4lK/xrpNPTTGQRJtf8SZi747ErIbxgfr0ymNyCsyO9d8Dmkb6ZP8mO0icrUBDHn+nbAwvUKCXpP6CfF5VG0OOd7NzqsXiAO2amjtkLPHN+qSbOXU82Ux6kkg6f/j2W9AmgiMrNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YlRwJW+DbagvLksgnwuqkLdKXgMFFCg/v8tHMomJV0=;
 b=IdNEt9F8x50l0+glhllodvJvhSvn1sd8WMM6eEGW9rxzHdbautX1QFsrqZJlhudOl/5ZWDJ/ciWNkf8//eNDTBMYWYKL5jkQkuvmwQCJTq9jeFzxjhbaXJCsb5srOLWLT7O7WrGTLUBpGiNUSjbcmE7+eBWgp6xH3oinE8YdQVc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 05:34:02 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 28 Apr 2021
 05:34:02 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: Don't evict SG BOs
Date: Wed, 28 Apr 2021 01:33:37 -0400
Message-Id: <20210428053338.11560-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTXPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.24 via Frontend
 Transport; Wed, 28 Apr 2021 05:34:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5bce7e5a-fba9-40a8-bcb2-08d90a073af8
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-Microsoft-Antispam-PRVS: <BL0PR12MB49161B607FB5F58A3296D53392409@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /s1W2iJuMAnjZKOV2q++YeEPdT3xcIya1I+2v/5kQlh1RJmUVGy5r4XgGElb+xefWdEctDjEj57+n7KR1BfWsmAZm2fLckPi1RZa+lbMQJmfSAVpITPp6aESMQ54r7IevyL7Wg306zYUeTn0C0hQuwELOzyjcSbRP4lhb91PNNipoxShXCYs53tnlaOnykQcR9WCSch449xsE0XEDIlWQOhtZsZsn+A5Z5OgdA4WMDEnokaKtvKV/p9y3mJ0aqnfIWVLaRcqDzSh8BhM/1t0QP66KBira5WMQYg3yDxm5+SNifdX09I+q0HYXnVwNvG8UlhKuVblZA1KLRuRQBivzxeOCIzYZcmmynT/zmXmfWwy44oQ0l1CiISycKovT5HuNCJYv7EnkNqs0KR0wEYIqpvfUE5cIpMflAzAWDRGDWa5th7m9G/YRlMSPe5yr+upjRkIv1xpDd2052+npn6gwUsHAbKCVG3VaR3ZhrZinoMhxWHTOglJStCjptCMC/RDLZFY4piNuZ1cUEmGaVFVS2+ZvNoJJZDpgBCFQMxjvS5IBNOBJEDj2GrjFKugbZ6n0I1ONhZFLGPjJYuMQNFCzU8BUnHmvoruhv2FzTYCjAdt91F7VcvIBEW+//S/jvvu9a53O+5wDQeA90eKVhFWJf2aEciYHkR950pvGridVAc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(83380400001)(66946007)(66476007)(66556008)(16526019)(316002)(36756003)(6666004)(8676002)(478600001)(2616005)(4744005)(86362001)(1076003)(5660300002)(8936002)(38100700002)(956004)(26005)(6486002)(38350700002)(7696005)(2906002)(186003)(52116002)(450100002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hfG961AssU0IxUZyBxVyk4oTNgz1sB/9QbJ6nV+VjBYFfVeLlxz8jdSxfUZk?=
 =?us-ascii?Q?pk20ObTluKCyWS6NolYnPZxW/+NjTRe4/dcGtjuqAxd/gjgw+fQYUgbiwREu?=
 =?us-ascii?Q?YjF1ms/YRoBAdYX6epiPgsCv78Q3PC+1mIMQiZOYU3J5i7AlVeOOhY3e0Oi1?=
 =?us-ascii?Q?C117WIAbwA1ROHD/XkA2ttD4OfjIdU2gbVCzNz5F6v+pBU3qJifAu+jYes2v?=
 =?us-ascii?Q?YU/wzHLGVuS+IgCXBFxIHP7BczRBPiTBzkJIxG0LkXas6zmlJUSqlRe4102g?=
 =?us-ascii?Q?+zvf21K3XuB5EiCKT6QLYAzNjhXn4szvGJQoF7y05vCBWtpJ2s+LdvlAj2q/?=
 =?us-ascii?Q?LbZCUIBxjVdYogstIGiFzpZ7FUM8PEHz7QoVTYCEogju03rOGSlCtZ890tWK?=
 =?us-ascii?Q?dVPj0qmRiDOr56njst00WYHtsb7oFiHmJ4D/g8VRPs73ZHROYK7b4xPLrfA3?=
 =?us-ascii?Q?OCcdx/MVnFtyqY6Ipv0rsaC8m3eI1HLZHiEmH6ivBW+zmf+T2KwVKVorEWfP?=
 =?us-ascii?Q?Pg7AJ3lqLh/g9+PN6lzE3/9qipjRduliKHtdnj2+SZDyVuavjuupsRkaM3pn?=
 =?us-ascii?Q?+njkUPBpogFXhY8l7sWqVc4fqTmdoT8I2UYzTeg1LuZ7NvW6pmm736QDmr6+?=
 =?us-ascii?Q?xriDRsA38n0sSCmQ4yAfETFXBMQTqQaI31IGCnv9MMuaAN5eYZlodY1SoP8c?=
 =?us-ascii?Q?ee93nTuJpjj7nk7oZ+TznWNhVuhFv+r1RKcwVduY3G18wqIfOWexUfwa3Qqu?=
 =?us-ascii?Q?avkjAOXrIoAglxBfy/drPNBz8jmuAJPLptAvcD17JFlZOpy8Ut4PjbNhdu1u?=
 =?us-ascii?Q?FZ36K84GnCBlgjEtc03jtV2bkbYEFojWcfPzHM158dge6H5xJ1YJLMF6/NIY?=
 =?us-ascii?Q?2KDd10Ts87kAv7/D5bslvxHticokct+cMuCw2gIeRjZfCNqYp0anloWYLWPA?=
 =?us-ascii?Q?Iai0t3rWn2vy86Ux8foYSw3eCAKtjsXQ0X4ZAnDDW+RI+AGDzKSjQred02yd?=
 =?us-ascii?Q?Aimg4YXZ0CMh4zA/ijx3I03sc8UaHhcRE6UHyuAt4JXOJBwX1P7RNai36IWo?=
 =?us-ascii?Q?M9S6OCPX7AWhNxz/42L3iknq9MrLTjRyQbADaA5Rm8Yzn6GNBoq7oq1T5p/X?=
 =?us-ascii?Q?sJ08CX0IeyNTkaNhSEMw7FxA5qUsVvfeu0NW/CiUkqfwAVLY4lfdRal5WJSY?=
 =?us-ascii?Q?rV29qFlUj532OwEfbiE05x9697Pq5R2W0sDvk5VTv7rA1YX0mPNgjIrXYyAN?=
 =?us-ascii?Q?mtkRI7fypImUxxqh5OHNJGoygqeQ2dYKwI+dP1I4XeHg7jhybydj+x0veEHR?=
 =?us-ascii?Q?wQMECdShdNcobO9PZjKHQ3L/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bce7e5a-fba9-40a8-bcb2-08d90a073af8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 05:34:02.2195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +gKa5pvMLypKRxsYy+zpDuhSGHm7+uwdZZS2qm0qovwBNGPkFl30cRpeA0OALYerr7qskkgzMfgbnUDOKlDx8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SG BOs do not occupy space that is managed by TTM. So do not evict them.

This fixes unexpected evictions of KFD's userptr BOs. KFD only expects
userptr "evictions" in the form of MMU notifiers.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index de1ec838cf8b..0b953654fdbf 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -655,6 +655,10 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 		list_for_each_entry(bo, &man->lru[i], lru) {
 			bool busy;
 
+			/* Don't evict SG BOs */
+			if (bo->ttm && bo->ttm->sg)
+				continue;
+
 			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
 							    &busy)) {
 				if (busy && !busy_bo && ticket !=
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
