Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4734F7B13
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:10:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306F210E755;
	Thu,  7 Apr 2022 09:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 602CD10E755
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 09:10:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUuoS1QMGiWjyqweKtObBQJvfl6kfrYKAFEXdM6z17c37U3mBdgur6lP8j1p3gdp9KxVcK9cBYokg6MjvEG5v1H+UcbUo6iKPDZpjj7DsreKdbR4e34M+KdsTK8ayNZoifCNP/fQqFU9yhH7ycMy7cKARFLshyH6z0Um0StavlyfqGG+oXOYWX6hYmiB1cyP7OsJRrhcewZH285AhIh/QQOwPVLm5fGIFcePj+BGgHgnbfUDdRmYr/IA5BhpjjFxrRarv3AU6b7sjPS1iZa2Teun6HO3OCAsh740v0hkSxf6mOGmRqlPnSsRbRCAb3qH19YlESCA1n/UgKZUOSi8ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=trAvGYKqF5mc2Gtm1sEWDRW8EouZa+DVV5JCesZ09xk=;
 b=WzDX7sa2/H1yYxd68IbZgar/qZ253xJkCZRLLcD9Y8Mpvc4OVGHYHom4BCD75eMkkvgpqKo9xbuqg2vhNdvSdKiMoYHXW0Uq/+S9PYq/h+Vj8MEr+cLAS0AkGCwPMXW1Zc77KIy7WzXuINJ0HENAXmnibA5yObKoo+VLAnkgMKT4tjt8SrkP4PY5/OG+w4wf5P5ZmdML0SesrYlkC8xXTwfk0xv87CqCnpWH0YXZvQV6nHaSrrVAOPkeh1kR/A1cID7me7u2r7UyVihAhFpWtqWdBTS9+INpo99NL40ro5oy09uwMlyhb+CvHXuJTfTU5Qq+PukGqaYvsYi/dhq3AQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=trAvGYKqF5mc2Gtm1sEWDRW8EouZa+DVV5JCesZ09xk=;
 b=Yag9UdqGLXKuMwRogG3/K0d5nGo5C9XPMnRFI3s9MI7HLX4nh4fliFxx8jA3sVRrYQM8/06uoFjlKYLpFayYUcX+VSxW+K4sOoHbgVTO4aiCC0cPBa2n8b76mo4arG3sDx9k2QzwBxW+CiS5jZMGK8ZzYJKdTNV5vYGym5QzO1w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PA4PR04MB9344.eurprd04.prod.outlook.com (2603:10a6:102:2a8::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Thu, 7 Apr
 2022 09:10:42 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::b09c:8ffe:8e02:7387%9]) with mapi id 15.20.5123.031; Thu, 7 Apr 2022
 09:10:42 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Thu,  7 Apr 2022 17:11:54 +0800
Message-Id: <20220407091156.1211923-5-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220407091156.1211923-1-victor.liu@nxp.com>
References: <20220407091156.1211923-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 963bcb5e-8334-4080-74a3-08da18767e04
X-MS-TrafficTypeDiagnostic: PA4PR04MB9344:EE_
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-Microsoft-Antispam-PRVS: <PA4PR04MB9344128DA1E3C98173F4FB0298E69@PA4PR04MB9344.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nhTVmcIeZlb6AgQOJBcto6yfsR2tTQiTvRNti4V7/aluECDHHfluSr3aNNoADv9/i9vpM4bXh727kPMywVv1JFXjMKU+xnWJZH0xGDTDXvIAJvLiqid4Ft1JAAvI6gvyDuoSTKqUmUdvt6/eUDdzDGTR46fm+H1ZDtloqMjv/l7ovh7wLUIERthoZa2d0DRO0qNo47AZPkMKjXhx/S2cHU4i/vqe9Y3tn81L67Mb9+3mvk/uDoZ1WPrmdsf5xl+w4PSsZQj5OFOI5FytXJhj29EruOfy1jhPoI7AJirSk7PWY+VQJJWCo9jWPcao/nQ4iV7X+eGvH4FWvd0nWa9ChpknV+AsBk1LRVtMrBiSetXJhtIgpfTv8687znTa7cZBSIQ5WX/xz9kczokHaA2p1a8mw4IqzbT9gPD8J4ukh2+7/OYSMS4xfqCLmj3vkKhYDot09ZXsHE5KEUJ9I4gl5l+xFSJhCtxSt7rM3KH2Z/oVKkX7zLCzL1t3gb1hCMjoS0F0Dx8VvJCHe4KJ2IDEJGBMfB6FZ67jHI5/O/4dmbVqpDYEvWS23L/rI/56jHAz70RDuzAy5JjxuM4IhQAr/yvtiml0Vfih2Yoc3wMjnkAiWpJmx8c9sZQEak4sSgQQg6ePLfB1kUi+MjDZOAuqY6TerARyIjBogjdmaSoutqYrd+ARJqxo3hgRp0lNlqUH+qFxKCS50k8uyIcfHYkIuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(66946007)(6666004)(86362001)(8936002)(38350700002)(52116002)(4326008)(38100700002)(66556008)(66476007)(8676002)(6512007)(7416002)(6506007)(2616005)(83380400001)(186003)(508600001)(6486002)(26005)(1076003)(316002)(2906002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16grXdPZ1QrCynn/yVO9a7XTUGDmSLOQpEImx6SU71x/PPvcN1FQ/9iizPiz?=
 =?us-ascii?Q?xbYwR/GHWjjXu10/svayGuIDDVJ/RsvMDG5MK48PNulcKVbQF+O1Ku+JuR1l?=
 =?us-ascii?Q?z4qjC2+wGUyd5QmgIqIslAjkXEwNK3o1aypwxL4zW20kZ5kjkRM3WRx7WiaQ?=
 =?us-ascii?Q?5NeV/00F23CQD/Ui9cFfbmVadb35ACYT2RUBSetW7i3+nhKntwwetVeXzmU/?=
 =?us-ascii?Q?yZBAyIG3cTDEGlpNw/TYZ9XSSeUYqr+CXU7Fa1pZy+cdLjZwfh56CYSVZe2U?=
 =?us-ascii?Q?EUI2R14O43zCjdrMo1y/sVSqxoWc2y84LsYKus5bGGBDMARNw7JWKYqDoINq?=
 =?us-ascii?Q?NPkX/939Kjae3PPSif6tSkIlKLeX+eu7ntDUaOvXO5PoLHnozClFfmefV8q5?=
 =?us-ascii?Q?bRirTNCPypZMXlnQpCaLt4jX75H6nrzVihev59kTlZu9t8wsbDG8pObwI7Tl?=
 =?us-ascii?Q?A8SchU6pndXi6UIU10vMvuv2OWHYiMH7UGB2kzd75aoKC0r7yzgs/CBXQlTg?=
 =?us-ascii?Q?YniC5pTt7AKsxN5mPIwm8aE19J5qRGrqHIrC49rNwR6kD+nr8dDej54I+gKo?=
 =?us-ascii?Q?9pVkT9YmBP3LZnaVO6qC+x+s+uIPC7VfKzl9YLvg2iYrsX1Sv28jtTpsaWsj?=
 =?us-ascii?Q?IYGlcfbCe32Dcv56HloPCs3u7zNJvFsBTu5GzaPIBeOhmwGoAqyxLGMCO4X2?=
 =?us-ascii?Q?X0Ti8ic8C82bZ7/jNGM/3700cUed8t64/hBS64NUUC/aroX/I0aRRJhgm00C?=
 =?us-ascii?Q?OqpoO24ogRu/60yy5sp/CvZCNPpqC5KEdiia4mSFGhaj4Xj0uO0KwSBb4UD8?=
 =?us-ascii?Q?1cdT5gGGhF+RfD+cJds4W2+uRUNsyg4CcEcUTLypuYkcWOv+f7uD8bZ6xe9z?=
 =?us-ascii?Q?SdZBNlKm37I/dFLYTVITXz62lqYeshluxpcmuri1w8TJ4ABfpqrb8xW7BZFf?=
 =?us-ascii?Q?zF9IDxB1cEvypEwupNazLAek0kDF0Ws4oyacCSQP6+oPdsK4DFAvqjmNtzo8?=
 =?us-ascii?Q?VmCy+aWg0J+J+jArAN83IvW8M9L3dVZ5ukA7fPvwp7V6omqZi0Xm+tsjS9Ib?=
 =?us-ascii?Q?VUPKdC6wYABgKxl2Lcvej60CvixQMsWgeVSQR987nOcYpH0IBE0s8NEPYM96?=
 =?us-ascii?Q?C5jfDUDIZ4aAnbNijBkunvlLGXgqa50Q2w2l/70Gh8i5px5qbL8PAv1CnRnd?=
 =?us-ascii?Q?nGp2ZByUzdpP0rHs9fJeEcX/BbUryKiTG5cMSTqddaIH/xRrBRxh6n/mzcgx?=
 =?us-ascii?Q?90OT2iROf+vH2oPOqXr/nfY4iozD1IO6nsxCnZJCwOQ2drYWSTpbYwO6M0VA?=
 =?us-ascii?Q?8mC8dNQgqVVren4x1yVRQr2N+PwUNfOjMNdNE2in6erkjRh9GOexgXJ5e5QV?=
 =?us-ascii?Q?FJhLyNR3ep0uu2lhbh9MpwpdWDA7lFaYarT0gQrsD7aPOYrBFKZyuHNt/eXi?=
 =?us-ascii?Q?PBk/p8oEbHQ6WaWp6EUU5EF+2+amL+RuZIK7BoQogMeswAjW+OzvK/Zmg34T?=
 =?us-ascii?Q?Oclog5eS0aopQMQ+quL2WXiqW+2kUG6EiQ8SepWYtAs+F1TQPgSJvubGwr7F?=
 =?us-ascii?Q?qEB+PgEemn3p4UK381eeE7H0Fmg0ycX4YWWiaiKJefafhQTjv/xLoHZJ7XR8?=
 =?us-ascii?Q?VebPWUG/kbL7+yZyDyRecuou6UXXIrmpqqjREqcCa3xIlYmt2E/B2e3ehnuu?=
 =?us-ascii?Q?ssApGpQdtKIjtBod11BM1x2hkbcLcziwGYWfgVr6G+gmmToJd6K/YXc44MwG?=
 =?us-ascii?Q?fvDZpde7XQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 963bcb5e-8334-4080-74a3-08da18767e04
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2022 09:10:42.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pgp+wv3Ir8vSs/1xZjKuIx4y9FQqnHAoZqzvvixsED0EjXavmG6sChvkHb4ZonYVBqZEzK9I/ed2AuAPHbxuNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9344
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
 robh+dt@kernel.org, linux-imx@nxp.com, laurentiu.palcu@oss.nxp.com,
 krzk+dt@kernel.org, guido.gunther@puri.sm, shawnguo@kernel.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index 1701c2128a5c..50377c80a039 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -928,7 +928,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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
2.25.1

