Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B77B92CD107
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 09:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0A96E9B9;
	Thu,  3 Dec 2020 08:15:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E89589DFB
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Dec 2020 03:14:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXzxF0QrxiaF2WXaRLR/thqPDmO9HSX76NaeF50MZUOuzCGzSkb5JHag5cqQrVsgKQd04qfhFFwcOXDLiNlbs2u+Nn1vEXnDoJRP2Ns7W/GXzJIJy+DDvqFvR7rfebiWmlKCvzKCvvSNLUT1Kt0hsZAmz6hEcN+bwb8aGaEDGGpBRZIP/+3zdhW067NeRUNgF6Sqkqhs+S+DZCv2GXEcA26Or1Z7nrIjTb8eXta6QPCMduhNSzGYsvOgVZ3TS+7VdG5OiIrAHw2MGvaZGoINuFcr0CoZx2m1/ate7Gxd5UmkkTbekfVA+1R3rG21rhFXWvxlazc4zqNXjumuHKn9UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3PKTqREgG55iO4KJ0iCZIh0ksgOic+fsHolhYkcRKk=;
 b=J3C9zXGmtzlhbrdbgWloreBcBCoXrEcrT14LCyRtKWKMIQq+kJBY9+IZlaZ2h4c5YzZICblrK3TNvcVZOB/tj8SGclKp/lRwbkdYchCYkv/c7eWjAJjSxWTf1IDEeJwBSFMlqpbymlckHtcmITr8anrn1bnIpildtjKgD2WKzNdoKx4klUFKR8Tu5Kwh43pyrHtP0D4giAG8lrOhxv832HTYsMXsv9RGOBT3xS9iGyHbSfBUGx0eRmeGaOsGO6gTe+HZV1XTv9HfRhxHEaQjAXn3Q1L53+8L5CbnigNDfeQVKczobikvP9QOfBMeuA3I2wNKZ34No3MubS1HeWXU+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3PKTqREgG55iO4KJ0iCZIh0ksgOic+fsHolhYkcRKk=;
 b=oNIXPkV+8dpxiDS7Mc4RkVe5xG1CtHKH+KLtIrVjgZaeXUQMBToayD9hBkYEim00uvJ5QtIOlW+acC+JUQoEUYlmSfhsH3jCysZS7KYuVu2QSkqJs37JW/Pz8yAMc/xE9jk6uMjm9fxoaKV8jZH6HXn5GFtaA3jahSI2dZY7Lbk=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR0402MB2879.eurprd04.prod.outlook.com (2603:10a6:800:b7::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.23; Thu, 3 Dec
 2020 03:14:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::dcb7:6117:3def:2685%7]) with mapi id 15.20.3611.025; Thu, 3 Dec 2020
 03:14:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Thu,  3 Dec 2020 11:06:29 +0800
Message-Id: <1606964791-24927-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606964791-24927-1-git-send-email-victor.liu@nxp.com>
References: <1606964791-24927-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:3:18::16) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR02CA0028.apcprd02.prod.outlook.com (2603:1096:3:18::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3632.17 via Frontend Transport; Thu, 3 Dec 2020 03:14:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cc45f134-ceda-4cac-ab46-08d8973990db
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2879:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB2879F17094FD8C6D14A052C898F20@VI1PR0402MB2879.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:229;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CKiL5wttPDphBg9GHwEu8DLSuZfrLX6z6/zWxZWzT7qSl5TseFLUJZRaxkHUS7yuUXpc011WCXByl/TljGvdRKFttOvsV5T4xpt1iLKlled4gOtEqMLGcHi8I5pJ+Bvu+S3QbFzjvpxirxpsnMzegYrdXZUUm9yYOJXqPliDfrWXoq7m996CjyUA8HU1hKV32j5rlYpfKR25VOujD1nk0tVlivy2WB0mwSMqUBgivZDWVCrQ3+bRW9qMUunTp+Z8MwuFpOPo80DMu7e+QvQ7PZxbkFM/mBdF147z/OoGnezz+yb5ti1f7XExko1ot3wC9kHB3UgO+zHl6IXH81dxhjy5iOT4FoXOmxkuV6XhnQHY4nPTlACKEUaXpl01N4ic
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(8936002)(4326008)(186003)(66476007)(6666004)(66556008)(5660300002)(26005)(478600001)(7416002)(6486002)(956004)(2906002)(6512007)(316002)(2616005)(66946007)(8676002)(69590400008)(86362001)(83380400001)(6506007)(52116002)(16526019)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?DiOrys9zLxDSntHgXyAWq41ftjSqvVj78ie68OIAgCzdLPi3LLWJKsKKcYEN?=
 =?us-ascii?Q?Q89lRvns8zwysBNZ4ORdxREAd1B0j/VyPCJyFaaWSljP94ycALXICukeR1+G?=
 =?us-ascii?Q?OSStxdv2BfmgZfcLILS0u+j4kqofvFMOKS64tyT1jkNv2WrtV+IV+T677v0k?=
 =?us-ascii?Q?xcxU6K05X4XH8zGbK1tRWAmJ0HZ0d37dSmTaun+Wk31LqFLzoFVzr8LNgHG5?=
 =?us-ascii?Q?bW3nERV/paLQbr6rTpbB71+c3NFbdBwagQRJaM3StW/lj6QCqqXaeblAVqKP?=
 =?us-ascii?Q?ENDksVnxLc1lz0Xej0XLH8CWgVnJNQWGWuDqgAQDmWGFcaByaI6wAh04cxMK?=
 =?us-ascii?Q?GSYxR/4wIc+a/MKz8nyXMujsJyxi70H4MmsLK4Tuvvnck7c/S4slbsOu4BAa?=
 =?us-ascii?Q?GdUkbweitw0Xzuw1DI3p0iBqMaas1f/7Lz1j5jciBI7oyh8Eyu07TQp9JM3+?=
 =?us-ascii?Q?/DXaKb+YD4ZTJgANoZeLQkBSniToTSG2NeUHZszhMAIh84ELVkYhs37KO4py?=
 =?us-ascii?Q?vJdsKyGy3z6BmT1SOoqgF9Q6A2qGZ5RwDwDWE9Yw6HLM6o28hoEh58hcJGd8?=
 =?us-ascii?Q?k4Jh7xwEQOggiF+nf873VTQN6toGegxfJjtyl8R//oUy+aiRuiwkcn6awdDe?=
 =?us-ascii?Q?Z49IBZu3wms762Iugv8t1LZBeMwg4F6CdpMRr5Li3rVKHUe45KRWnfHRxK7p?=
 =?us-ascii?Q?2UjgNLDbMxF8ahhTP6G+n11Vu3WuQHgK9KgE/2uM6KPTzQdCGKN256rRDEbT?=
 =?us-ascii?Q?Kgc7YpoPxq32o1MPaJgRjQ0VSMJn44GF3zusagmaZOCGj/B++GeV1dmBrZaV?=
 =?us-ascii?Q?lGkNPVwoLWVqZco1q7AD0D4D6kxkUhiD3tfh654F3xK+BHk5zbVHH3GDd53U?=
 =?us-ascii?Q?ND6vnvwdMD/5Uw9gosvKgzGbkBmt3t2o2g0rx2McHAyvAPRbz3y+r1gfYHdb?=
 =?us-ascii?Q?mhc8Eqb4qp2yYvFyyY7sVhaZO6/Hv9rCGIhzCd5TO6plWWjBINWsvBiM+N14?=
 =?us-ascii?Q?GJjY?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc45f134-ceda-4cac-ab46-08d8973990db
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2020 03:14:37.5718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NPqR314q1Xp1HlObP35X6yz4pcARc03vb8vsC0BBrcXMHhevjfyXZg/1axqZHXRktl37q7v7LiZbXStQJMPGHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2879
X-Mailman-Approved-At: Thu, 03 Dec 2020 08:14:41 +0000
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
 laurentiu.palcu@oss.nxp.com, shawnguo@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Artifically use 'plane' and 'old_plane_state' to avoid 'not used' warning.
The precedent has already been set by other macros in the same file.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v1->v2:
* No change.

 include/drm/drm_atomic.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 54e051a..9da1e35a3 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -888,7 +888,9 @@ void drm_state_dump(struct drm_device *dev, struct drm_printer *p);
 	     (__i)++)							\
 		for_each_if ((__state)->planes[__i].ptr &&		\
 			     ((plane) = (__state)->planes[__i].ptr,	\
-			      (old_plane_state) = (__state)->planes[__i].old_state, 1))
+			      (void)(plane) /* Only to avoid unused-but-set-variable warning */, \
+			      (old_plane_state) = (__state)->planes[__i].old_state, \
+			      (void)(old_plane_state) /* Only to avoid unused-but-set-variable warning */, 1))
 /**
  * for_each_new_plane_in_state - iterate over all planes in an atomic update
  * @__state: &struct drm_atomic_state pointer
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
