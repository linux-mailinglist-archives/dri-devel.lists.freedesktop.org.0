Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC0C329680
	for <lists+dri-devel@lfdr.de>; Tue,  2 Mar 2021 07:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4E76E903;
	Tue,  2 Mar 2021 06:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140042.outbound.protection.outlook.com [40.107.14.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF1326E903
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Mar 2021 06:46:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzUhcdKpDFSbqE1+vBQfhcB/Z3bQnUayjD/Dd7xFZyLk1hTXnVk9G/zgCNRHPcRkATKK2wbzL1OSuF3H+sNUOhhKDTbXw9t4jwPc/G21HIqREAPan/jhCowKrLmqgKffJIuP7jVdmCkeFVdDxcpJlP/mR3ubXFyXoOdfM2Xts6q6CxVjNnF2H0sjxdd01EIAw+Lx1wslnWUbzGjU8ZZHHSvw6f7b27qUD+S4IlAu+pOMC/dE13aINtwAF6tNT5OhzxC03yl4YfykVuWP+heeIlTZlzQriiFaurB3wCpxusfH/4gUCtao6hdxK6qJiDrZBgN69h9l3szAPIqCmJvkKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7neGW+yOyO+EPCaNcGKJfEzM9aEkNz2EfRAZh+a2A/k=;
 b=Ocz+7/wysTpsjXilDwhb0DfliG4wymJIlP5+GKAFkT6eOU9k7i8MWbxwhigXyhVMA/SQPLnrrEAukR85OKYn9ZKJ5WuC0vLimgpSWD1WXR8fL/NAZRCdJr2ytcFMuQL5LB2JJ4jfi1YN/cXkyNUW0lVtE1oe/9/sgsD9tzuEAB8RBn0a3052/mB2fXZKhMyIn3B7Z7zh4M/uxfSYfRSkvT4ZjokeEUKED90NM8vP8pe+YuDilpqbNFwGmXaP8THOxH7bfrzD4V2fF8vwlAqIV0rb46Tk0f970tty+UEGwHpdkmSxbkXDhkEAm5yJD1a3jfg116qNvbRizC8EsFYS7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7neGW+yOyO+EPCaNcGKJfEzM9aEkNz2EfRAZh+a2A/k=;
 b=qnXdHAyD+GslDkpmYs8Msw3bQ0Cmd13yvjJhS6p0CcRYPvI/xQIfYrplHFGj1Z9wZv+8/kg19jAPW3pfJZfjWoQ0klJy052yeGNRT2e0sCllTJnj8iRzps0gHi23Mhz8LZP8B23NzS9N7PcJDhv8ZVd+SdOvd8sOS+63AdcQnNw=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB7086.eurprd04.prod.outlook.com (2603:10a6:800:121::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.23; Tue, 2 Mar
 2021 06:46:25 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3890.028; Tue, 2 Mar 2021
 06:46:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v8 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Tue,  2 Mar 2021 14:33:14 +0800
Message-Id: <1614666796-19374-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
References: <1614666796-19374-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK2PR02CA0191.apcprd02.prod.outlook.com
 (2603:1096:201:21::27) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK2PR02CA0191.apcprd02.prod.outlook.com (2603:1096:201:21::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3890.28 via Frontend Transport; Tue, 2 Mar 2021 06:46:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5af61058-1f66-4a2e-6404-08d8dd46e629
X-MS-TrafficTypeDiagnostic: VI1PR04MB7086:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB7086868B94C79FC57D175E2398999@VI1PR04MB7086.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6U8NvJqOPhVtIAsjnTPJYPmacoTtqyoKAPZlmHOVNCs//O/xpOthKk572X7ekn1NPuqBmA087idmi7lsE4LdLd50LluP9VMF3M8rIaG1eCKwLfhhrp9rLmyGYAvK992mucLFGTy406aD7iFWrBi2HMnmgbiJ+Rzls0M9nxN5BooFCd+K5t9uzk76LlUzZ4A6f85WloJS0ZlXetBIBepSUgEQBRmF9oS6ogIOt3pN31JTtNPSQdTVH0eegbTbmD4bnLhfNq3wQ3QKI6PGWX5MIyOKDiAnk3Oui4FbDoJ2c9n5uCyUGtRD2NQwCo8R30X5NaUImafHpxCBq/OUv6mi0sDTfINurp1AAHBN6J0hKJM+Crt4dhPyrSi6Xvq0FoCf6VLOxMl6j1jWwY12iHs5SxegBVlRYzx+n+KCK0bImAhXW99TBM2mb6CmkBSyQVuw1wUpgmgRscHZKqpUWL9zHM3szjJt+dXY0YqDgbw/dJq95oNHP5XqneLtUWUnwUJuPQMUId018WAnNeQaoYqsGbQFFKVVaYMKrDH6msNZuRLWY2tr6fUAwI2gSilWhb8hou98QLEY4pR2Ah+pPOfwkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(376002)(346002)(396003)(6512007)(52116002)(956004)(478600001)(316002)(6486002)(83380400001)(7416002)(6506007)(4326008)(6666004)(36756003)(2616005)(69590400012)(8676002)(8936002)(66946007)(66476007)(86362001)(66556008)(2906002)(26005)(186003)(16526019)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?AcGm78EXofBH4VJrQs3FufHr87s223CUF6gStHp9WnaPKBZxaa+QCKSZz32x?=
 =?us-ascii?Q?uJ1cWFpTk2bCG+RJ4nNaGzeHKEJQH56FizKp3kdbta3E2TC0vwcz0tjQmSd3?=
 =?us-ascii?Q?PD6TOoxiGzb9eFfVcW4xqCyarXFlsMciWqjMTNO9oYwkuu68uLByhl/5fTNy?=
 =?us-ascii?Q?CNKOsTgJtDX9o+C6bE8dDARU5Q4GRWvGp678TzkGowz5HEN8ga1hyQbQIloh?=
 =?us-ascii?Q?J6BE6+gZRKn12rq3wyxCp2WD+BFeyKL9es1quiTkk0GXNuxX6fGfy7JZAZfh?=
 =?us-ascii?Q?e5KjDwYptgBHgSMvrXa+aUBEtYK5TThEEEEbeGJ8LXumyKsX0MRSJ7sLbSbC?=
 =?us-ascii?Q?ZvkN9iE0ONpzzxiLPmhEQ244pcZxnjwygScxzEDXTa8i9bKC4kH8CtoIb8s/?=
 =?us-ascii?Q?+V4fQwJhh7DGtG17L0d8utGx9kSxhTzoNW6wPlrReTtyQAInq3ZcWBT8xzcK?=
 =?us-ascii?Q?7RQSgfKDjWvivcfZzvJICZYgpJf0jBYEVM/worE7m9wzkECUMyn4TUcGxJmh?=
 =?us-ascii?Q?TipPg2maYPnTqtXnOgu/2TrrAv2hwkyEVSeK208yDxsqxtJJnraf8AwtjBVa?=
 =?us-ascii?Q?f9EJMs6MV643/SJ6XgpcgNkj9y9kmdkK2Ql2jiYwBc/qS+2+ZGVdhf1zSxTU?=
 =?us-ascii?Q?mAZk1IC9ya4TeU6yeIRkPrlMKJlIGVyaIvAPGi2NYPsJa87v0/5qtWK3GNWo?=
 =?us-ascii?Q?kJIzR4E0WssJ32T8Qc6sk1NJNoEiJEQfkZtJBD5/Wgg7RAAzu2tiMKhQkn2X?=
 =?us-ascii?Q?pZCSYoHHjTuWFNsthCbmIlA9JniWQjYkxg3RCJAhdhslnRlXJSdn8RxonJlH?=
 =?us-ascii?Q?qjX71Nh2f7STpUeukihgUj5XxhEgkaE+ZJ11Op/DZO7eZXw+ouPachfiWJJz?=
 =?us-ascii?Q?tHAj+lW0uuL5oNh8CHHALCfG4GGhQnIyh4/ICutixRzh9pMb84mRpMWulQSq?=
 =?us-ascii?Q?Ij4mRcXcUijABpUAL06sPg+APRa83ynx9HlZ9p1lZhcYt/hAjPQnqWyNC7++?=
 =?us-ascii?Q?nlfoCjw3I1BHwL+tUPUxYJwrQYKtWowHruyyrZdnzFsOIC373kzEMEGkntmr?=
 =?us-ascii?Q?4/41JWW5NvHReV2NyRcv4lI921VcAgReE1+yM2rYbbtmYXfKrjT0Q9EYPHYQ?=
 =?us-ascii?Q?H/hJIQmH6hQeIFi4zZI+K/Dy8aSXowQf2UlUSFOy+HeVh5zyCctOhvv9nr1k?=
 =?us-ascii?Q?pLEOeeHgUEXQ4QLq3n56ia/r9lV6VBOsisWpOOSACm8pMF4ZoPszMt3vVEw7?=
 =?us-ascii?Q?PxnXUZMys8pDhNZQVjK9hhYwmegUJoc2hu641oaafzntdcdSMxMrXs3OffzZ?=
 =?us-ascii?Q?Pn97iDEISo2SmDw+1sTKf0qS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5af61058-1f66-4a2e-6404-08d8dd46e629
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2021 06:46:25.4365 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EoRB0doWE7zwbUcRnxClA5zi5xpkmrLXPcVWL1B+PRIA1DNwKo56H4u2gcJVGyg9ERfdPL67A3cqD3jNDYKfGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7086
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

Artificially use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
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
