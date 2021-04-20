Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D233653AF
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 10:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D216E442;
	Tue, 20 Apr 2021 08:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130047.outbound.protection.outlook.com [40.107.13.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F366E442
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 08:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vci5s/DxAeh95SwIovTlKdA4oX0fVZcfOIZAyw0O0VZG3EDeG4aGpKqVFdrMe76o2Fa4EyTt+m881YvEXFViuaGz79o6dWX2xoFFT2Y4GoALJgr1gtvPqNSik7v6aQr0zj01e6+9bw2pAbe0Aqt2Zk7lxbbPZUIRLTGLfT0yfJzm2hJynVZEcX9ujuTHE1hJRLzNY9t458wnMrFtaL0kuvTQsfnNO7R8K9I0+NW3sVUZG6Yn8Yha9do4pJhLrmLmpE0E1XzapIqwOTfCO/9fVQ8d78lE6nrKUStQLEib/S1waV/vVfnKmb9bhQBzlllS3ccruwZR9aemOvj/NCgB3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSEwdiOiFVcb+F/ZF8BpR5gf/Lv3X8bsxW4O4PbF38E=;
 b=ejhU4HhoziRR8a433fF9kF4D6nXUuNEHWDWhh97VmLCUt/cYHyvOBIAG0uMZ/3rhDK8vMs1BnkaK5MHEJK1mMSs0PI5QiSSp3rIhIMtmCf+cX1wu+VuxaLNsdqCJiwmohQlbzTMCotHktlp+ArsU7t/Y8zsVROE8Z541C3XNEOdkSV1MTP/5O3AKqfm6ajyPPHKPUpYJRLAGs94ic3z1evdk8tTk26Jyux6da/ImOzCLPeE0hdVOvtnY/2dL87n+QlEWKN5TRA0irF8T8soKYfKlaSAOuGZsRp4Ba7fHtNlLSIkhCkxW9dr44j6UXKm6zvOGNtgJ0N3Ky5wFLbYudA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSEwdiOiFVcb+F/ZF8BpR5gf/Lv3X8bsxW4O4PbF38E=;
 b=UxPCLGA/oFGeE9cc62XA4PPbVIW0SlX0+dNApEfsRf9JdZgsaNKtsbvJagw9viJmDzXBBXoGMtN4hO+YDPQ9j5M3sHpc76ZwpXX6v8tcuUVBWqCQXbDLYM1NDQ6UkL7SoZ4RcbornEnrHWxmO0Ow8yp0vHnaqb9PaRuxRpq1Qgs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB5184.eurprd04.prod.outlook.com (2603:10a6:803:5d::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 08:02:37 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::a5f3:fde9:1d85:5f28%7]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 08:02:37 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panel: lvds: Drop unnecessary NULL pointer checks for
 lvds->enable_gpio
Date: Tue, 20 Apr 2021 15:47:20 +0800
Message-Id: <1618904840-29078-1-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 HK0PR03CA0119.apcprd03.prod.outlook.com (2603:1096:203:b0::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4042.17 via Frontend Transport; Tue, 20 Apr 2021 08:02:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 34ca23fe-a2ab-4a4f-a637-08d903d2a99c
X-MS-TrafficTypeDiagnostic: VI1PR04MB5184:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5184E0EBB860D676842088E898489@VI1PR04MB5184.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hB0TEspuEccRQ9VDKFkQ6U/L9DJRaSeuA4oJ8EkdHXtsFhLQkFlY3qdRSRbTEJk7IQ9/hHKSdt7VX9D1/mr80nu4GjoUcoUiZWrMbclWq39L3JuRWvTkd70z1KnCHOG5LP3oXlYD6O1X/xxZWdL+i8UaMJk5xB72eB0crFgVOU6/Lj7IZSq9Y1TQAkmTPd1M7lGwZdl705b8Xk8r6l7hQFk1XZ2niFlGah2gLu8tvFvOXmfDQWgxbp6UMOBggQQL8noNxpz334mUDLjHRSsvtbBrJHvlyJNG8g5uXVuQXEpebUNsBN/1u0ofoT5ibwx8LdhhQkx0sHA/dFQt2xHarN+hiNB/jiHCWKXtYKGFwI9PdFreainqSDEAdJ1Nt8TDNgDQ/BP+KCUke0GExubfXauUKh6Tv9Qgfc1ZOvuaHmyJqR7g9h9yAlBNy2fytXCSSu8jKRtusOB0kZUJ4aqy99N1uyGlvQWosmrkXtVQpEfn0ZPJh+7asnkY7fJ6u8Vimiqbd/XZuGQZY+vQUJKXE+QONdfgFXQ8TfN3Ydaa4QkzxWnkdrZoJHqIxxTSJ73pceIQPXcPbHZqSyuzu1/5c0NwiFrAozM0Wk6OAP2484UceNBXWU1XolDFKeZpKlzgwB1wDiZEyrYHU+CBdUd5onbKSI7cumWqL2bdAAaPDIt0DILndrwKMU8laUeZru+V
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(498600001)(8936002)(6916009)(26005)(66946007)(186003)(4326008)(66476007)(36756003)(6486002)(83380400001)(6512007)(2616005)(8676002)(52116002)(2906002)(38350700002)(86362001)(956004)(6666004)(6506007)(54906003)(16526019)(5660300002)(38100700002)(66556008)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vnmET0cmqDb66GgNMbB9jFXuHB2oA+y9FZocZNwSJz+8kiZviE7zIhpdXmiT?=
 =?us-ascii?Q?n+YHkKfqs/Rqom9RxhK/YT2TnaPsRRE4uuH2erP46bbN9u1WQUg7tqTi5r7r?=
 =?us-ascii?Q?HYEWYZPJ+hTRpocHdf11hDiTJJfDp4Wac9Dc2uDrUjQvmYOi+rRhy9aXPyNb?=
 =?us-ascii?Q?zqwpkiJtUYHrvRwLcPUs6eoKeVeDpZLR3oHRMaoLq+bNSIIxv2HpR6SEdIB6?=
 =?us-ascii?Q?JObBmAlZ+6VLWx8J6x0Bcf+yzqFM7sbpsP1wGFOFZgMwoC6yHl5YcT2pPTaB?=
 =?us-ascii?Q?BXz6sJqhymzmHjOHfke20GycQZj37NQELyn8BQDmP8q8xoA4ReATsGtnHmyO?=
 =?us-ascii?Q?7RDquKd03EV7m8An5opTc/PqQuEeAuj+glvxubu6rjfkhszlshv2VeyzKBV/?=
 =?us-ascii?Q?i/4+FjdUE5Z2VEXZzXogPA8bL2Wp27oHwk6hs6IeuJMrOJ8pbxXhUPs+HnHK?=
 =?us-ascii?Q?gNqtBk28zNGI7FKPcRSznwOUVREo76XZqkHMeS6kCds0f2wOS/CR71uXx9/k?=
 =?us-ascii?Q?1OLTQx7GyPXOTmg6udLLvJaDpb/mi21a51XBodVvEtQCfe/MJeKQ26KAgi8x?=
 =?us-ascii?Q?rAc1ghZacqt3MX3EGZBi3OmUTI6uSHi2EY675PrcahjUTAf5qKRCivi19zco?=
 =?us-ascii?Q?HHbGaRx8MzCT1pykfiFC/HY4uN8ijvoh/gifO8PwA1vDUkMaMQSgQD1qOxN5?=
 =?us-ascii?Q?50VeFd7W+jlRnXfTmHL19502w+1Vze6gfBelPCTn98PcV/pPl93uaaiBnEKh?=
 =?us-ascii?Q?vP5aHmH9SrRJHTMhxiUkFMCjAzA+A1TrJwl2xZCrotU+m9swNaN1H3D/eyqw?=
 =?us-ascii?Q?+SxSUcAGjaTwWYhU7ls/WvHdGX1yJyrLVFxMPqYl0FJWsxUrelehl0gVsaDd?=
 =?us-ascii?Q?MbqvzTBDzYDDyjH8uKSfOjqXKDMd/cENpQdqMJPkL7OwLacjFDjmXPDJORDN?=
 =?us-ascii?Q?t9+GV5kTWxIIFH1zW5erxbvr7ygHiUZrxtxwtAYPIeVorGDmayI8RYmbM+N0?=
 =?us-ascii?Q?AquuRk+qF/ucGGM3cotQLzVIK8Ehmki09zJgrnIjRZ0voutY+kJrXLW8FVa+?=
 =?us-ascii?Q?LCslY++yoQ5PjXNMaFCDYPg6TJzarBhey8sBMYk0kaPCJm2W/rQHqMh/5gPy?=
 =?us-ascii?Q?nZQ3TLHr8HfLgB8UOCoYI4BCMVF6ZnFrym5fUADT1414EIVWSdP4HWQvAOgE?=
 =?us-ascii?Q?fVQc/eIxvv9k9YdwHdOBuFl1onxZKjm5dvnssMcxsMPzhRjP29Va21CN+5Bn?=
 =?us-ascii?Q?KUvC8AgTpxlQuYCXR8RPATqw0isr9ONODs2WKVWNpJEljjx+ikwUTcjHXRtV?=
 =?us-ascii?Q?kra/31LH6axGToPy0Umqmng3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34ca23fe-a2ab-4a4f-a637-08d903d2a99c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 08:02:37.7654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YuI0InDgfOpoFM2oLcyu0CeADpePLRpeQhQu8cBiMrlqIzZ0Il7mTkscwzOqSzx1elrX4z3LdIEfOFV1t31NuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5184
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

gpiod_set_value_cansleep() does NULL pointer check for passed in
gpio descriptor's pointer, so it's unnecessary to do that check
before calling that function. This patch drops those checks from
this panel driver.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/panel/panel-lvds.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
index 59a8d99..19f11fa 100644
--- a/drivers/gpu/drm/panel/panel-lvds.c
+++ b/drivers/gpu/drm/panel/panel-lvds.c
@@ -50,8 +50,7 @@ static int panel_lvds_unprepare(struct drm_panel *panel)
 {
 	struct panel_lvds *lvds = to_panel_lvds(panel);
 
-	if (lvds->enable_gpio)
-		gpiod_set_value_cansleep(lvds->enable_gpio, 0);
+	gpiod_set_value_cansleep(lvds->enable_gpio, 0);
 
 	if (lvds->supply)
 		regulator_disable(lvds->supply);
@@ -74,8 +73,7 @@ static int panel_lvds_prepare(struct drm_panel *panel)
 		}
 	}
 
-	if (lvds->enable_gpio)
-		gpiod_set_value_cansleep(lvds->enable_gpio, 1);
+	gpiod_set_value_cansleep(lvds->enable_gpio, 1);
 
 	return 0;
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
