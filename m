Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FB8562C0B
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 08:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554EC112468;
	Fri,  1 Jul 2022 06:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140087.outbound.protection.outlook.com [40.107.14.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE80810E2DF
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Jul 2022 06:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzw/ZN4PBCaJhsBml+iD1fulq+XxkoFV1o59hkfEEYhZgotu9YZbbv4ccB63490Wo+U+3Tye/dY/g7Qt9vlojKxBRP1uaeJ6Ugl6kMbWLG2qS4vlpWutc4qDxmryEEVP4Ra2LonjXNXE94jyjI5kr7yEm6vXuudLlYi8T7ic4ge1Uc/i8zDgEwpmJqKrV1pCIBG07tpkOuiBVr1wa1D238vrYBJgH68qKQ/Rn3shD/oUPDpi3vdtLaOLK5mF/LfKDRsW4kd3eVmyJL57PAjlh0OKoRZ0muy1l5eRrZd5QPfkFJufwyNZJSiyAro3UIdLPsb7/aNNs4WnY0+wvlnu4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jDgraNn+FmLRQ89Ejl4lOjbe2AAp07kxL9TYXedwk6o=;
 b=Kq1A9Q8ku4WoyGW0kvYCLUDXJ5KoopiE0uLkps82TpfyzFnCxdYycqp3SBTq/LuYqnHgRB+BES+iJsVOpwkqbOjzcanHmUGsc/TW+HxUbjTR++5Cwg1ky0SjIAnskQn4Kty6aWwEg6JCfnQ1miOvCnoBEwAUFQ6jGFCggK17SXWmtG1ldpzDxqDMGAKvD1uncfvfPU2uaelH+uZGtV3oUVZBqOiu/3RTPeEW/y/92SLFTyootvwHSg6MCgsctddUlqbP1q8q26SwB8dDnpkOIxUjsuZy9TzWsdFv6uiUX8ethIaLvhOwU9xPnKibEq75xj7jgiuC2uZKD5UWtypMwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jDgraNn+FmLRQ89Ejl4lOjbe2AAp07kxL9TYXedwk6o=;
 b=bIP3rIyC+0lfm65yQ2Sp7zB7pNOvPqZTI/476E8lL1dpCytegy9oP+eHwgld+D6F2Rn0yz+jBpF2TfPzgWPFdvsZhyiuqihUBjUrOT2dsklA4S9z/qRDkJH+Vy48zhiShmQWTRM/DA+MbseIpvjCkE0lXE6jRtQUReJ83LMiP7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB6PR04MB3270.eurprd04.prod.outlook.com (2603:10a6:6:11::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 06:55:01 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::416e:6e99:bac6:d3a9%6]) with mapi id 15.20.5395.015; Fri, 1 Jul 2022
 06:55:01 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/bridge: fsl-ldb: Enable split mode for LVDS dual link
Date: Fri,  1 Jul 2022 14:56:33 +0800
Message-Id: <20220701065634.4027537-3-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701065634.4027537-1-victor.liu@nxp.com>
References: <20220701065634.4027537-1-victor.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0013.apcprd04.prod.outlook.com
 (2603:1096:4:197::6) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00ea01e8-3e17-412e-e445-08da5b2e9e5a
X-MS-TrafficTypeDiagnostic: DB6PR04MB3270:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eTBcjM5LRmg2YVZiphcq/7RKMukyVDL1VPLIau90rKCtZ65JfW18znpwbNoydzNFaPxhF23T4C95N1cYytzBdHmed7T4g1a6YB7mKffMi4EOsQgwp8p/poGaa8JdnD/0PTwP+DxxClcFSzZrs1txUmAfmk/waWoN+kvva2E6lGwSOLRLKVd+0/nDLbMDDRM1x7HzLxy6BBm/CRmmA6XOBvqx/pTzyzTi3G7DoQkOmVbZudRFCbUw+PSereywqU0Oax6zDutgYELxQ9R0CSmj6jtavm2oYKuXEvWnGu6NdeiN7ugG5PdsRW5pyuKFdG6V5Lb0rEugvL44c3g+wUiy7sw58dgL5gzcHXxc+y/TNU2hIrYS1vCwwmqH8xDYAQSGUM776lU9ZRWd8sSQGnpfVbnqO9jjC0jB2tCunJryvlnJjcvpfFrJTGCoqqH1fpZd12A4KWGYXLmXq5j8niVz1I5HnLwEFeBzqXhPN1JUlf+5+9RPUWNUsloIxS3i37qnp7djBZNY2D6GGeDjk5QoNXQrWDZHnCwsKX9qQZZ/4kDLX0U5pb+B131rzseUGrH/4Hs31dpxurlDKLBd4o3XZa88OuLG3ZKM/pS1XxJXetn8nIZLUkVO3QnbHf4LvSzqIkg6Q3ojkBFDTBsH3Qqaz5PkKvWdbjt+Bu8Cle/lvRJqVVkGj/W0co5gmN+/8ieSXWPQYfNd1hyNhYZFLkg6KGBeIfOyNpZ5xQ07cv0cxe7avjhYE6YgqqVvzzll+MyCS6pifZ/xhuRFimjX05UOWVVWy3bhptjZ2FgcHoS/ivhwG7O++NUygFgtcaqfHUXI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(39860400002)(346002)(136003)(376002)(366004)(83380400001)(2616005)(36756003)(2906002)(6512007)(66946007)(41300700001)(6506007)(6666004)(1076003)(52116002)(26005)(186003)(7416002)(478600001)(4326008)(8936002)(38350700002)(38100700002)(316002)(8676002)(5660300002)(86362001)(6486002)(66556008)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+T6yBlviI9eNlqdRy/oB9q808VmBGkiFpJNxk32OAERvN8IHPZ1/OcaUEOm6?=
 =?us-ascii?Q?1Hy+TgDUzO+lbw74BCRYIBcvQS7sNbXBiOGBmo3kHG/12is1D+NoaFwP+nrn?=
 =?us-ascii?Q?BTtnPAhowVMDvXip6LL102ndzdfZB2R9pMXcNnvuS3k1tdb+hc7noS1Pf7he?=
 =?us-ascii?Q?ak6Fgd0z4odygjTW1aXVnNy/unC0rVcKIZPcJIdG/AIbwqopTd0TMwHdcw1V?=
 =?us-ascii?Q?s+3NAkE8wozsU0JiSkl839kr5DPll6VXUyL9OxKrDd56kdGVRSY8IXrdZFkV?=
 =?us-ascii?Q?AX++jak/v5RJxx1mwjSyU1iPZWvcirtvJeQrMArTVhmGbIPXlM0CmCpxSENj?=
 =?us-ascii?Q?Sl7WHOlgQfsnO9vzMlparFf+7VMZcpR6/9JdTRDiCuf4BGlYgKEj5Nx1Ue35?=
 =?us-ascii?Q?1zeoI3hAUTs0Y95MWO3t18OStQQZFGSAzC+wgtX1EVzgFNi9a2/FFKzyXAm5?=
 =?us-ascii?Q?XY4RG4txU7LETaS2MldRM7nuTExdSa3J6FnFeHIn6R6L+eMPgPfSXwq/lqSk?=
 =?us-ascii?Q?V/ZvLFnoy/n1HRMnGIQEFIsyThXHCTI7gZw8XuP5f9/wA6cET+W0rXNnKIiI?=
 =?us-ascii?Q?mUeNLvXw2EzBFI35T8neqS5mgXn9Uekqeusw6Ola1RqDQ9KedJXewB4v2x7b?=
 =?us-ascii?Q?RjPgoa66LIiEpwgVgsf4Hheu4aZZts58wyNu4eimQKKkgguiAxcyVin+Fe1t?=
 =?us-ascii?Q?T6BmtIGUgjAQl9bgeDvMbVUk8acKomovcjgafjD+56xJOl4BCmEmDAu9pjVK?=
 =?us-ascii?Q?Gcy57lFDOoYl1LwP4OyDDPjpMIzH5uxv07l/PcGEGfBz2Fua9Crwl5Yn3kVb?=
 =?us-ascii?Q?X9HmhpI7gCxEQ7onRME6G/tADC8ePeRNwXRcdexw5rkLr8mgueJguIjDOVWK?=
 =?us-ascii?Q?JJeqsyNY53qwgdrpLyqpbLTrkHzuwnMVyJ+MLPc8az/n7+bYb8jWdIjyM7gi?=
 =?us-ascii?Q?qSDmqlaKlOpYOiocPFbAwHJDNbqCJshbm/Bg6pIQp5CEKGn3z+nnQHN0/5S3?=
 =?us-ascii?Q?GlvFXnnMSbvaYEH25iSV0nzGNpLsNrAKBq3JvRmSErrYmb/2++wxR0Q1+IfD?=
 =?us-ascii?Q?7ibpc+xd5ZnGlRdeQ7gac/0H4jEtbIHDsV1AdqN7Z2gbjEObUQ9lFL7PIB1P?=
 =?us-ascii?Q?r6N1j6Cz2LZu2Aa6IFzsvFzZj6lK4rzPQUpnN4CBlqHuBk0AYGcXgV/+5BJR?=
 =?us-ascii?Q?lahiwXK5gWbd5u5po12xuJ+PvBi0m6DEr1+NGmJtAcxx1T0k5z/Iam7zJ1f3?=
 =?us-ascii?Q?Z3NVNhvwigFwRX6wkzVLfIDqsTWveyoo8Na7VRDbegY8vyoo0kEih3YAtEFJ?=
 =?us-ascii?Q?goFDSGnROhWrgf5s8aqKz8/AhFSy3OaFrHGT+O7ZXibilFvQHLRoEpXNs/cM?=
 =?us-ascii?Q?lIhcQD0cM3WjyJCSgo4OS2IN4SQE6nYyQCIwGG7VJRBFQHHe4ckjEO9kuhM1?=
 =?us-ascii?Q?HO5OkYStf6SWz+0iFie7lxXI7WOUv0UPfgiwcoRoUDmmp+4HgmtPpXNzHC2V?=
 =?us-ascii?Q?DpBfkn5WhVn4ktiBU4AAMvRw0c/JZtJq4EXpPFhi5xxy+ROWWYAhIIDY3xBr?=
 =?us-ascii?Q?aTVbQ7R82+2yKVcA5Ibk1vdgHZMdYd1MZtdWpifH?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ea01e8-3e17-412e-e445-08da5b2e9e5a
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 06:55:01.2694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: THgcxB8YZPBREOL0GYGp7rrVMq4Tuox3LqzN2wB9BvCWg/3LC3mFrBfmqDG17s2t6zeBAPq8Wv9ksRrLlpAjwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR04MB3270
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
Cc: marex@denx.de, jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 narmstrong@baylibre.com, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com, sam@ravnborg.org,
 linux-imx@nxp.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When LVDS dual link is used, we have to enable the LDB_CTRL_SPLIT_MODE bit.

Fixes: 463db5c2ed4a ("drm: bridge: ldb: Implement simple Freescale i.MX8MP LDB bridge")
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Marek Vasut <marex@denx.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 3cb3b310e283..d4f005eef6f6 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -153,7 +153,7 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	reg = LDB_CTRL_CH0_ENABLE;
 
 	if (fsl_ldb->lvds_dual_link)
-		reg |= LDB_CTRL_CH1_ENABLE;
+		reg |= LDB_CTRL_CH1_ENABLE | LDB_CTRL_SPLIT_MODE;
 
 	if (lvds_format_24bpp) {
 		reg |= LDB_CTRL_CH0_DATA_WIDTH;
-- 
2.25.1

