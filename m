Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C410534C39D
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 08:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09DBA89D64;
	Mon, 29 Mar 2021 06:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10077.outbound.protection.outlook.com [40.107.1.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5039489D64
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Mar 2021 06:12:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bZLBpZc8nbJJn9uCjJQkim0IMHMO2pVJPs3GBlTv3ChPdYMj+ua55+7zfCRgzxPBSGcQ3kp951BVAEr2nZSaaznJEOMH3X9CLstBXaLziwhl5IT8Q4XALOoNZkv3jjJJ6cfTVXgFvuVchF+eKBMowAuxmvvV3hibgi0jfsptjkuOoNzqDuesf5MSD6s6igtyOoxLhSba5x0Ds6BnYbV3bIw15Y+xD2YGajqxm1P2BFX+DH1AzkfZtnCKigy3u5moFlwdTsvP4Atxi8Hrgi8M2wce7DgxRlSi3cL5Gta0mftPc/1vBy3NAArOjiw2VUFWyXBB47evbU68Hj4n8Y90ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zsZx1of93nrbNmXb2S9C4Sx1ATMh7hYRPS71v10IRA=;
 b=evqfcIE5kcPPmeY7Oo1ws8020ZkuWaa1FrIDKsOCFYvq1RqMwdMJBP9B8WxjivezK4ngyyZ6K/JWv8nkKq3JLVqghKerYRoiYjt3DvJdlibTRL92RW8wzFJe/Hw644Ume+jGWi5rvgZ3z6gAizPV9RWb2t7OLBES5npNFzbTkvpHPkKYaGAHEJP3mfGdj2pWCleKB6OJR4HUXD8qo7F2ac/xsi+S5nDt+r4ovNEVgQNQY+CDKb2wGVsm0BrnotG+fTgxZPgRJXeX/FKNMD6L+to9N2Y8X6ixMfEDdmHZVGT8YsULBpCRpe97+65i+gA0g6w4tF2EVIGtq41G+N0PLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zsZx1of93nrbNmXb2S9C4Sx1ATMh7hYRPS71v10IRA=;
 b=CT+9Kbgh7M+1K6lS94Yg7uc1Nvfe+AgCIMeg5qzGxJMQZny5+K0zX8We49ptPnpeMt0nyNF076H5LOS46T4hs3ao4l3U9O3oKqDcNcvmG39/89k19AlZGtRPmE5mZ/9G3CRsaORug4GgEOv5WPJrA6GWODHdvgJLOm4S2ROXSGI=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB4895.eurprd04.prod.outlook.com (2603:10a6:803:56::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.30; Mon, 29 Mar
 2021 06:12:26 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::3ce1:4759:5c33:514c%5]) with mapi id 15.20.3977.033; Mon, 29 Mar 2021
 06:12:26 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v9 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Mon, 29 Mar 2021 13:57:24 +0800
Message-Id: <1616997446-8783-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
References: <1616997446-8783-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HKAPR03CA0027.apcprd03.prod.outlook.com
 (2603:1096:203:c9::14) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HKAPR03CA0027.apcprd03.prod.outlook.com (2603:1096:203:c9::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3999.14 via Frontend Transport; Mon, 29 Mar 2021 06:12:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c69f9759-bac0-4069-d096-08d8f279a01a
X-MS-TrafficTypeDiagnostic: VI1PR04MB4895:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB4895566D1C52A388F9D7DFD5987E9@VI1PR04MB4895.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: legrROUFaSSefg+MQu0zRQLfCRXFYSRkawhq/GMTcur3AWLLnPfJ6pnCvFmmf8YxHiRgLk9JtJwtAF0ljz6jotbkx/KwR3420n3xm8XMrG9Q+tS8QDpw45rQNMuJgSLao3xij2SwyuWzDWg/FcSsNs8/pjpx7JtBMqTGcBBsCgb1xZ0U4ziEuuX/glv8FVAO4dPHsV6r8II2PWiRGx9K1SfbJA+qc23vS1aBI5HR4eqHE0+IgQKKAwQp+sLToLxiJXEoK5ipSQpYV1Bdg1GymSX9zxg7AJKVnNAaLwy9MkbYfa6r8l54cPKMxoRS9l1CHrszXQg0e6D51JqlJf08nvug/MQp3QZf0vYIt/Xq3HTWcYBiWr6GzwFhWnMz2TfZj8n/YXOnw5n66WG2NE6o6XVgHBKxE0s+gnRzadyclj2GrA7EbfoAJgSojAAGUPeopoKGYSPG16J3UrNdf+HzvKlW7HaGUCmHe4pTKpqgrprR53L0wmRvOSHuNy0VOBck7QwWZxDbDjtHML2TxaTOYxyhYOIMH4GwgiyiaytLPWJyTcKWv8RbCqNenC82UZ0meXtIIoKLAarqSFdZ5X70yys7XlaKl7kZWAQBDfD1dDKzJG2m6GiKqrV7jT7G5t1vTeYR/S1sSwWgFwNpNffNkg5CMe30xS82JmLkzL0apDwdo4JfYx5y5aDGExmHcPfb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(366004)(39860400002)(396003)(26005)(36756003)(16526019)(186003)(8676002)(8936002)(6512007)(6486002)(83380400001)(52116002)(6506007)(66476007)(66556008)(86362001)(316002)(5660300002)(2906002)(66946007)(2616005)(478600001)(69590400012)(38100700001)(4326008)(7416002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ebUx3eUmAimcMmXFxCiVHq5Qw7/B6wiy2a2hiN4W5guFCOQvDiJZx+haiV5Y?=
 =?us-ascii?Q?APz+PWF6/Mzi8A5CMcGgAoLOaSfc5/jSEZUugGIYP6MzNWG1uStp55vJJuQv?=
 =?us-ascii?Q?zoBLy6p7/l1P0od7/78ZLYDm7rNx+MPOg+JO2UFCUUSfHOK0b0oG8GwuZdrU?=
 =?us-ascii?Q?VnqbSRouVpa+Yj+NOmLViWBDFk8ZssMDNg0rYglHnAdBxUeQArPrF5JpeEX9?=
 =?us-ascii?Q?HDTGE+dU8Bdk5MI0jcAbojCnZ3j1ls9GuZC1nkAKOL4U8SReCnAzcZGCTa4b?=
 =?us-ascii?Q?5dBOLL01tEDX0Naj+dzCqPhYDkRILJEJMZjB1/8aSwmUIXQOANl7S5lKOa1g?=
 =?us-ascii?Q?XU5jpZFRR7Y7YP++UoXPl2Bl6YjYLdrCMps7+ycnXkIgvtY5FUuukgMwsWCa?=
 =?us-ascii?Q?WkgBAA6IsKO/683CVd8SGE6aAcvXkMjVDSQuPJPetj6WXw4XlLJW5Odpga/l?=
 =?us-ascii?Q?+uCyt2LTiuo3VGJaQLdnTI8bSt/VCdybljTEGO6olrX1CKRQaAGehQ+RpJH2?=
 =?us-ascii?Q?NGGkg43Kxg4ePJOriTpSuJkNbaUQz9qETM7nMJYp+qY40n07dk0v2CtVKHgS?=
 =?us-ascii?Q?hac17B45ujM7RIVML7Mjs+U4syuqIN+JZo2y3GVm5ZDfQTciZVjtuNbxE7GL?=
 =?us-ascii?Q?RBmxYIlG4Rox9tLwBH6bbalva2K7WmLeT/JFgrZv6ZHoAo/Pqq4IdnokrLDU?=
 =?us-ascii?Q?XNRuW1xoUltQLDVB7EUmHGWvcGzzfemVU9T4yOClkxjd9etLcUA4zg51ncDF?=
 =?us-ascii?Q?6+o1MQnTLt2I2EnipMz9qQeZg0z3Bw6QAwwC9YCAoCUqG0+hi6aEVV0c5wZZ?=
 =?us-ascii?Q?ATQnTWhlcE55DhxQZ5rkXOMEP+IHxhTIteDOWsGHBUQjSnrWE0g2FZbQaC5H?=
 =?us-ascii?Q?fn+JfS1DtdHaN95SMgz07nxSY63DarAI7+S6Uno0orhpdPoB+Q8NbzD28JSM?=
 =?us-ascii?Q?7TgJHKJ//923vIMCs4/eJsAPmvrITT4k/8s883z1YA6j3LtaYYx3VzaPspum?=
 =?us-ascii?Q?JAISINQutDfvtDWdZItw60Kf6MxghoJq1zLv+XtQ9dcDZ8x16DY2ArtZFH+G?=
 =?us-ascii?Q?VM/LiRwjK4jDq8D7PgiMKfoNkGIpA2r3oQdfIlwzlUeIKfVzZmHq/hF3c2jb?=
 =?us-ascii?Q?oc6Bwh0eYM8/mYhgyBhbtZtoM9muE43Rz+tJVBa6Scm5fFYk78tyfDTdqIo0?=
 =?us-ascii?Q?ddWyGRoOKyaYhBzKon0Wdq9GEgMZr1xBSJV54e+ExRapnpWX7niY3qp498PK?=
 =?us-ascii?Q?bXSKWY5c+v9Sq7bLntFTSHDaZZk/KzM0yZbi3VhIyrbSL8u4acFIkTAX3jWG?=
 =?us-ascii?Q?tDaVZGGqthLMFmWTMWbJ5h/K?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c69f9759-bac0-4069-d096-08d8f279a01a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2021 06:12:26.5820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VBCSpGsRkSBERTdNiPKIlhQJfUQHY/0slXYRydT6bi3KwqvGhMn6yOEQDLtrBgingX2hgmQlIYCT2yvTy1DP1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4895
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
 marcel.ziswiler@toradex.com, robh+dt@kernel.org, linux-imx@nxp.com,
 kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com, guido.gunther@puri.sm,
 shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
index ac5a28e..76d8dee 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -912,7 +912,10 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
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
