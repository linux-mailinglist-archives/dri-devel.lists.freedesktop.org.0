Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB6959BAF7
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 10:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2085D1122E9;
	Mon, 22 Aug 2022 08:07:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50081.outbound.protection.outlook.com [40.107.5.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 808BD9AC24
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 08:07:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vfjbj3s59cJ0SRxNLxevwTZt8lL4OV/zZiCS7mRWeYJ/oq+O+4DZsaRI7rsWPDtejPtlc1xyOM4eA24etTFUstg2XOx0D7U9cQaprmL0GgRQGtqzLafuSXC9oGDTG/7znOxSHehtOCHRwZYzKdmDfEpfk9E+gw50IvW8Vv+3w4sH1V34XadMJCGvDpy6YWICMwQs5Qm3tvoQIe2LJcezIlWqVm5h8i5FW5Gt30r7yqgsvIg3FxBaoAWzzBzQutBpD7hRt+Qw92DPOY9QD6k0e9JJVEbVv1NAoW9ozwOSSApM/pOr2ezKpgMTflUGZz5o42fgbKmhtCTQ5Jz+A+1aHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd5v1IIYQshVvdDDgs0ofaoU80w6ODJT03QN9ZcZYbs=;
 b=YFJnbbRWNkWKAnXj32oUxOBwL08b7Xuebb8PFxHMuQyy3hGi3W9PUYWipdC4daO8GDWcrjzO1GONwqXSWZPEVLevN7QqfyMVUF/c03Fwdru3lhPqo9Nhm0H5y8u5i/Gr5VAUOEQwOyyEE22M0jS4y+NjBi8YNcVzSIUTdzZ0yDFEne+8zjThPJr4b1yysWc/BkX5KRX0EDRJ6I8ZAh9ClqkyekNSuA8eDHxOLsrWDBbkTh+I3jpoRnA9Qlfez7RFfn1wdcFU3qUjs3OFONNKx6JqTQb8AlIba5idI97FIl5mx2ArYPYOvQi1V/hXD9AnLkpjq3Rgk0wArzZjYVovJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sd5v1IIYQshVvdDDgs0ofaoU80w6ODJT03QN9ZcZYbs=;
 b=hphOAhXWaToAcbgYzkzZstTVFCQxEzJMZCjd4eDP2XJ36zRX1MKpG3nT7d6XztwPnx/cBJsAh5zzs+QCzM9Lx779BmeT/RGM2m+yfBpT/0q0v/sIxrwFAQfb6jEJ1NPBCBjw73UhyF4OACWuswkO1Oni+lGgQmf5+gCFdJ2I2Yw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM0PR04MB4865.eurprd04.prod.outlook.com (2603:10a6:208:c4::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 08:07:09 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::2549:869e:d80b:3a1b%6]) with mapi id 15.20.5504.027; Mon, 22 Aug 2022
 08:07:09 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v11 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Mon, 22 Aug 2022 16:07:54 +0800
Message-Id: <20220822080756.37400-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220822080756.37400-1-victor.liu@nxp.com>
References: <20220822080756.37400-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0128.apcprd02.prod.outlook.com
 (2603:1096:4:188::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1ad35451-de42-4d07-4100-08da84154fa1
X-MS-TrafficTypeDiagnostic: AM0PR04MB4865:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tSSs278ROYJ/Jm/bSEbMYRXIcU33n3Qnv24n44N0dc3/bYCDswliLcmtXwDCOEPwPttGHsoF9UhGuJRcl33W+IJ6BCOp3ZMtaXgoL+djrW5DmEcFzysYTbHI6cOdqrQnii8XooAMAkxUKReCSL02gPZ/Gucm/Aywl8rALDWSTsWGpGRF6iCmaa8zgZedWRoGF1anGuA+Dhw9MJJP3JXsjuJ1p4vsNAvCbD4Qv2Sczz77SjzeOz/G/pKbXbIfjztGZ4cWO2ZasC/xbTEvq6m+4Gb9hsHBapNjtlpXYRPU6B/JaYcbvXyGKSZ9JNd2Ecp9rhdkmd39GTk+6v+28u/8V6D4bF60BHWQ1KxPyikXzzb9NT9rQRaxyAkmn2D77LOuo7l57o70XSIxBW8ls7l2/8AILqGXlBZRSddb5UsVwvbftgFaRctSmKNk8pk1P+sq6xQetEirH9fxONy/6daixcWPECXGB1rj/Pt8XsPhtgatFx2/Xt2RMKVubzWj/c38Q3GJPJnGzkQCKSw/lYDJgaP4e2v7GGguCUK6cM0twjQZx+i6ozQxNwk+CD7aJMBzTh0k3jGcYHLiHvzk5CrBGKnHJhUocmTY1mFuwVdEUoAoMX3PlS8H8qYYcgnic5VsU7jWXvE015pn+ZBtZZ117qqME8dMNJ57HzpJREs3TeFHftxfPjloFvE1F5x3T/3EJNng1lrnH1do+xONCS1a0O7m+cWKT/CDgfmVBuYPrfe7JyPWBhiIqCc5EN91hzAhBPg26AsGDvdKgFjxoMDyhA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(136003)(396003)(6512007)(6506007)(316002)(6666004)(26005)(52116002)(6486002)(86362001)(41300700001)(478600001)(38350700002)(38100700002)(2616005)(186003)(1076003)(7416002)(83380400001)(66946007)(66556008)(66476007)(8936002)(2906002)(36756003)(8676002)(4326008)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4ZWN/PQGW41vlRhsxs1dYvaBjoE+/1B5iNxCJM04JZi1Oh1skkvcRiYBm/gd?=
 =?us-ascii?Q?2fweJCkSHzgEG60GvBXzfduF7uZ2rHtXewT8Jt/EJlbpDVl+pQlSyOc81LiX?=
 =?us-ascii?Q?eas4fhEUvtqX+9NeU2S23cm9R4SdC2dYfh5MTEonRucs90QWrnWfjT6ra6R5?=
 =?us-ascii?Q?HEnUptAXLPOYcjfcc1GuHKXxSPdMoP8qpPbDUGDXlkKg729TLpEDVH8LQUmi?=
 =?us-ascii?Q?Ds2N/2BJWBgt+HdRFHSfvVIGXnz8q14FWT65S/BowvhIJ1fWkU7Prqd0AgRs?=
 =?us-ascii?Q?4QT0jTks1nf1X6nwCeDriNFNR5Er9nq8/NLRa64XPueEuzf95WOYWaNPojq/?=
 =?us-ascii?Q?CUQ/9ZISNwFNwRe44EUzof9BxzHTxctdi3dCPMOsDC03fezv3CiKOIIxTyx9?=
 =?us-ascii?Q?W0WQHrgcKs5cN3QsCnCgIBTPReArwQsCLZdSaHZ/ivpiQl481qH+1um5XYGh?=
 =?us-ascii?Q?0bFLOhuWa8Con+Glo4Hyh+PeqZQ2fP+0V6TqV6uGnqr8XOU7fXeaR4e1EktU?=
 =?us-ascii?Q?KK2IFK03bGoSwrM83jyEhIhi2Hn5tZcyQKZELMZM6k3wY6mpPrReyZcidkVQ?=
 =?us-ascii?Q?3iYOvnmxfOj3TMFm0guzKtl0604OlmOhztZkdfoFaW6sJ11M+N+Qxjxix+I3?=
 =?us-ascii?Q?YpjmF0kq+uScESjIR2A4amAZLi5Ree2WbxGgS85h42Kfb4irxEIzNIg/K7Ri?=
 =?us-ascii?Q?uR/CT7l40qLZavh5Dxzpmm5txkJKf/BalBitaK3SbR+4e2zAQ+VojkBMe3sC?=
 =?us-ascii?Q?8bImwaRKhZlxAtnXKouXCgBEVjJE8nZsiOzNzLi8GmUdvJy+RU4p0DV57YgF?=
 =?us-ascii?Q?d2YrDXUoR9r6ue+O6hgAIP+DYjIKl0kPw23n0SOhQtVmstJhlOnNMwottKkU?=
 =?us-ascii?Q?4e0sV/qryF6QCJA2bG4FcXB6G+AjgjnNDDu6Iho9YaMwiDC6og4d+8FrY3bs?=
 =?us-ascii?Q?QMW+xrh30hVSxN1pHUUGYO6UIJWNinNlNUaorBUC9uKgzZcXzEMqS0Ik2amB?=
 =?us-ascii?Q?BE/sJKJMLNRPnBZy56PeQEnhMruu9U7r+rDENIZGLbNNs7fYLolfIMYnq+Kz?=
 =?us-ascii?Q?se3vt8vv2W6z8GqZSlJvQhN9qk14ithGk1/NlUJCHI7S9WCka35cl/0DyyjT?=
 =?us-ascii?Q?30GXmAGvpLpvK/aqruSOHyXzlZDwhcC6D5FzaI+h8NkkB773880+PUJvf5vW?=
 =?us-ascii?Q?CX1XO8/nbufLlR995xVwU2HUlRqvt9GoQBw9LvMbvx30PKb4WkriDqgbZgeW?=
 =?us-ascii?Q?VpxPRBpZ3ir05Mwiyjs/9i60601qw8g9glsGYrdfkdTC4DD2HlTFYUc5nTGz?=
 =?us-ascii?Q?a4b/36kZ3h0NM+ckEouWpb3D6JSqyZhOetJfU3RGOkZpIW2XaNSzNEP+JQjm?=
 =?us-ascii?Q?TEjG6FiQ2BeJykump+twnNtoiDZ2jSoZtipvGtFFSV8j1pGI2RpfZGGQfC83?=
 =?us-ascii?Q?d4YyM3/gz9hzHyhiZNjqVUMguvu8QERbESoVnI4+JS8OxMq1E8TEvoYq4n6J?=
 =?us-ascii?Q?A/SDrvrhsqL3k+VZ1OmXTzz50ZZVAXkcN8X/yxjuhUDSQ4ymtbHwf03rJoWN?=
 =?us-ascii?Q?j/Wf9RYAq1b4t7RNIYENnYnqMDqACpXzW9ci8D4L?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ad35451-de42-4d07-4100-08da84154fa1
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 08:07:09.3910 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 76YRNIDAZ2CKfllWiwyFPO6hkcZKCBypfRn11DgoIND0irro4sSgoMgh1Ex7T5yhQYrKWm+c3S0qvztKkB1aZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4865
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
Cc: tzimmermann@suse.de, airlied@linux.ie, s.hauer@pengutronix.de,
 Daniel Vetter <daniel.vetter@ffwll.ch>, marcel.ziswiler@toradex.com,
 robh+dt@kernel.org, linux-imx@nxp.com, krzysztof.kozlowski+dt@linaro.org,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v10->v11:
* No change.

v9->v10:
* No change.

v8->v9:
* No change.

v7->v8:
* No change.

v6->v7:
* No change.

v5->v6:
* Fix commit message typo - s/Artifically/Artificially/

v4->v5:
* No change.

v3->v4:
* Add Daniel's A-b tag.

v2->v3:
* Add a missing blank line.

v1->v2:
* No change.

 include/drm/drm_atomic.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 10b1990bc1f6..bcd6ff9d18e1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -947,7 +947,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
+
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.37.1

