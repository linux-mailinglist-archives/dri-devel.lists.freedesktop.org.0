Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 617192DDFDB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 09:34:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A5489D66;
	Fri, 18 Dec 2020 08:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2088.outbound.protection.outlook.com [40.107.20.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32889548
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 03:33:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WRpaL340msllsJjZUkv5y+Ld94sRM9BlQ2ro1eWw2pqGmwMFVE90LDMcDSNiBxCnqVeSeP6HIQ7goWh67u9edUUPM9baEMNJdyNn0RSYVKiRyCBtqhAzdCUwWkyBJR+HhlRAushykOGtXo2PSnLSQoxP0u9I7lYGthKIXhOumhMmqrHEN/bLqGwje/xJ5Mhyp3ltZTlrsRLVGdtqm2dZNt3MTTneYd+T8SuPE8pbNCO408ti4VoAUs6Q3OWOFOrfLW0CXB4VKr3PDXngKKzDMt9WjsvPUldEvnrj7gyyVq9toUKAI5BkDSMhYKc9GwdRGdrRR5rIosIzGpYhruKOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBOZZeXEhJQ7n3OnMKb4cn/O/k259v60ar+//rZcq6k=;
 b=f3oC8ZvPkcGM5j1vU2jcJ0rrOlpnmM2MejlEO+CK0lDRcnysP42HjR774WZTcNNYs/O61iDlqol+qLjT9yfaP5tDYKE6AfO792Drm88Zg1MoIq20kp6C3nYb5dvbZved/Qf+XspFbPRzhiO6o3zO+0MaM7oKmHQR7SfnUK7S/YbQN9BLBRLeWqk4TlYuTeqTUAtFUfuaNZi2yB9pjHJduIIeH+GNAbZ+bBHdmj5zWVGNn9Luo9HTAWkQkctXVXu9qEOYAOEwo9LQs7bngHOLayfxfo4HxKnRfE/GjSwUyQEyXWFmYEhivbApdK8g/8JMLrLjK2DF1gPx4fSlIMA0qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rBOZZeXEhJQ7n3OnMKb4cn/O/k259v60ar+//rZcq6k=;
 b=b1Bu72RDItdEpNAGm8qqyNeniAx1KduCOh66Tvk2fQfaa5w7jyFFq7zumv2J6YvgIn6ChA+ivtmJChltPyJI8u16C7vzfDAImvJQ77D1ytLfmDXhginGtfaMgxQTSZV7uDfFGOYVUD7e4mP5sugDIzRJ7dBZtPphjiOzksvUPT8=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2816.eurprd04.prod.outlook.com (2603:10a6:800:b7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.17; Fri, 18 Dec
 2020 03:33:04 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3654.024; Fri, 18 Dec 2020
 03:33:04 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Fri, 18 Dec 2020 11:23:51 +0800
Message-Id: <1608261833-24772-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
References: <1608261833-24772-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0118.apcprd02.prod.outlook.com
 (2603:1096:4:92::34) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0118.apcprd02.prod.outlook.com (2603:1096:4:92::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3676.28 via Frontend Transport; Fri, 18 Dec 2020 03:32:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9b47008-c91c-482f-93e1-08d8a305a142
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2816:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB28168B81907D943783FEB8F898C30@VI1PR0402MB2816.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1PwoCYCZT9UVDhgzgX7zKSdEluAHeGqRMXVh4g245IyL4yyM9eTb+0H0gjucGJendxayYZVBOCRFtCBcvrxv24ICGMiCLW4Hggsgo9xtgVb0Qaj/FcDC22PBlyUilfwcyBTLC05xr2BkWAb6yLSn7fTcesB/u+RquRyw6i4MvqLkVXtSUXGPMyUz/yrXbckNX3PstbiHN/fLSyFcYpm9d3EBiCXnRJxpvqeIBcVwdEd24h0kdF6HBMok7iwRsUHUJ8KXR4MtjSjENgejVZ2XdyT/vztOMmosKNnHOoWECuLMeeE/gc/5Skkv7YQA4AsPiH1eXlVrAQHSvVlHc0T9ttyJI/jsrZzge4nzH5VwqoKvS+gOp5boLhQqAHuo4LK5
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(376002)(396003)(346002)(39860400002)(66476007)(52116002)(478600001)(5660300002)(6666004)(36756003)(316002)(2906002)(6506007)(4326008)(2616005)(66556008)(6486002)(6512007)(16526019)(83380400001)(69590400008)(66946007)(7416002)(8936002)(8676002)(86362001)(26005)(956004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?nhOMhL1KTzjOKzNfWT1h0FG2u6H9pCL882QZA0rYzAEzo30sy1WOCiXMVPp9?=
 =?us-ascii?Q?DUJhIXegLJdm2FEJxGLt052OLdT8l5VxFpKTfwdDfl25t50anukHOzeQs55U?=
 =?us-ascii?Q?PAw/mpLxPatM7XSnq8mPopeGedvJPNGiTciHWhGHhktpv28LN2F1A1tjHE65?=
 =?us-ascii?Q?/lDJtUTkV7SedZP1AXLQCz+iQQQzaPl9nZeB7JURiJGY0ksoOlPTdeNoDcr2?=
 =?us-ascii?Q?BOXeoW9J21uauSBA73LF4MZ82iJaAslZ83KUfh+dg3yYtWODL8rkoRJwI+Q6?=
 =?us-ascii?Q?qI1JvjQvPLBr5ujGAyEh6FLGyP+6oS39DIZHsznxzGRsHfi3ORV93zXYMN00?=
 =?us-ascii?Q?gHayQci4aogPMBskFYrFzN2/hGHellloBlvjLbFpe1SXQe5WyejHNDrivnF7?=
 =?us-ascii?Q?CYkBD9s0isDK24xQaOU/t5P/gJoMmpG6MJ+X85tZKA0b8IUNZ7RqGRyoBh9J?=
 =?us-ascii?Q?ikH1bcUb7yNVzmGIm51a/wXv5o6mw+hCPHaFno36N85IXhOr9uHoEj/nNVqw?=
 =?us-ascii?Q?lrLXHd+rlFWDfslmr0xgU/nnw00yMqbV7N0ptcA6cSELgF2jEIjq/7mh/Ykm?=
 =?us-ascii?Q?3tDt4CcgddhpY+jSYa+YeVg3c6kJqZsNzcG/eAo1EIBtd1ONqPxtHfvGS0ru?=
 =?us-ascii?Q?CA2k6u6jmcIDcthxKLTy1ce7rFSQm0KID0pDXhOVIfYV9KKE1+iqX1Y3qzV2?=
 =?us-ascii?Q?+lmDka4se2F3HSvYQQD814juP5L+iqj9HvlaoJmrSmeCy54fvHAo6xfr7Hhl?=
 =?us-ascii?Q?Vj/1Fhh+GOZLtmeAcZZ5Ka+gs8bQ9qK7YZde+Iy4uy3bZVJXqyW7BQHuQ6SJ?=
 =?us-ascii?Q?MC4KddCnRenzHnHWVh9lyMWmG0xBebWmrEHGKGlVH6MreL4gAGO9fqnjNYcz?=
 =?us-ascii?Q?3euYLqJB+tBE1NP6th9bTf7nkLBASJ2ViEKL07M+37U5nYYUd66exeOLzJj9?=
 =?us-ascii?Q?2cg9ZCAOhwBLWE/iKy2Kv6l5hwitFyBpkjol9LiJiVaJBohDpQClepO2inmz?=
 =?us-ascii?Q?8HaW?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2020 03:33:04.7254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b47008-c91c-482f-93e1-08d8a305a142
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyKC/deFQVpLFsaKkpustYR/lQntQDhu3x1C3sdcKJ/6Pz6EwJu+oHzvw+FxQ1Q01KFocbwNDEvbOTf2DtwXrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2816
X-Mailman-Approved-At: Fri, 18 Dec 2020 08:32:02 +0000
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
 robh+dt@kernel.org, linux-imx@nxp.com, kernel@pengutronix.de,
 laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index ce7023e..6ade7a1 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -908,7 +908,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
