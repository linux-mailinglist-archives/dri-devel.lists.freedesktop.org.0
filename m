Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D85303809
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jan 2021 09:37:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283C86E427;
	Tue, 26 Jan 2021 08:37:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2085.outbound.protection.outlook.com [40.107.21.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B94989BF4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 06:25:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IqOZKHp9As1+pX/yvb3sJEESGAxpJOVwuTgUKyxt96vsILKlEV49yHhdBwdBu7Z1I0AGKOVE+AkaTj8z3j6YrwxgzWcIOrDkawOhefw+TVEVrIE6DRY4RFwT0MaLvDfZtkq2/gZ+ETpnD1t8lTkSuKSfdqQ/R/gx3AegqoVlf+KeTTUB7SXJwd/eFoYxrOtKCyVpkn4aTZp0LfljqhIQ6nLBc+Bkp6aj61ajpu0XgEC86Nj2xWtZCdNww95bYX55aHB0ZmcM1YgDkvljcnRMSJUpgIT00c0scPa/ZHQLvB25Jz/mv1KZQgtyQXRopa3uWZVXQ7yR9f4xx6on2LKz7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2glhBm9dm76kaurB7OKVjmMsUYFUB7xZh1CngMuvNe8=;
 b=aPcIVCgxMl08JvkIcZeINhBzA/F2loH1Ligiiopkd1l3t8u6SgjNjvzGNal3QfvyEpBBchEep80b3PNJ9mpK0qmQcgyyJve/27JS6QdbC6NylrplzqP6UerQdidSHW6fgGfxDC91voxzPuwykEn1u5lfPsrgQw1r1M1vO5askIZ4lOGzz+k2XvIEBsRMvtdj52rhhPon33y569CF86UL2xDTkkXjFbHGshw6MvXpIkNvN53RKqTTgAgqp1v5tyiOGAz0qHEUsCU3k7uQ1S7tHFtHf4hHjtvdT4q72OhZDt4Ot+Q6/Pjsvwpgk0Xb+UfLqgltMeecDn365bPIhbXbAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2glhBm9dm76kaurB7OKVjmMsUYFUB7xZh1CngMuvNe8=;
 b=U4lVym94xpb84/2hvE/LT9WrhQBEIXKzRr7CtPjA5T9JGZt0U1M8wfhNRn+cjT8kmxb7SsPLXqcrXJlUNTzBM7CulLDY4utUzwZCKyIgF1mRcsZo1RvGxFW353NDlW03cszekBMdarp/dx0/a2lfzvb1aGjaSC0QQaVuv7bmLIw=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=nxp.com;
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com (2603:10a6:803:4c::16)
 by VI1PR04MB2973.eurprd04.prod.outlook.com (2603:10a6:802:10::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.13; Tue, 26 Jan
 2021 06:25:56 +0000
Received: from VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0]) by VI1PR04MB3983.eurprd04.prod.outlook.com
 ([fe80::2564:cacc:2da5:52d0%5]) with mapi id 15.20.3784.017; Tue, 26 Jan 2021
 06:25:56 +0000
From: Liu Ying <victor.liu@nxp.com>
To: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v7 4/6] drm/atomic: Avoid unused-but-set-variable warning on
 for_each_old_plane_in_state
Date: Tue, 26 Jan 2021 14:14:49 +0800
Message-Id: <1611641691-17554-5-git-send-email-victor.liu@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
References: <1611641691-17554-1-git-send-email-victor.liu@nxp.com>
X-Originating-IP: [119.31.174.66]
X-ClientProxiedBy: SG2PR03CA0108.apcprd03.prod.outlook.com
 (2603:1096:4:7c::36) To VI1PR04MB3983.eurprd04.prod.outlook.com
 (2603:10a6:803:4c::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (119.31.174.66) by
 SG2PR03CA0108.apcprd03.prod.outlook.com (2603:1096:4:7c::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3805.6 via Frontend Transport; Tue, 26 Jan 2021 06:25:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 62cca5ce-48bb-4597-ce83-08d8c1c33cf0
X-MS-TrafficTypeDiagnostic: VI1PR04MB2973:
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB29737EE68C7B63A59D426E8398BC0@VI1PR04MB2973.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:47;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ed7TjRUIFqkWs2GDHf00DHUiRMjL5+cUny9Oq6TAOJzkq6jQjTA01byUqGf9fUhNF9ydiMdd7xztlm/NkGmlvr77qRkYvDUznznEloAqAN5wgvBI6EYa67btPkbG3gshp/XI/VYTdKWQOIvM3C+Z7BqXvU8HqdLhMiYFE7n56NVNctgLEBoPZT/1/HSkCvS11IMtFKmJYFUmItIi8JK6iYNLeIZDnGfdHeqIeAFARD3FWzVCaO3YFrvD6C+y7Q8hybQGXaISiMwGVdjU3CJCM4yKm9OaGGgny87up/k+OljY3YfUDc4TKRK5Boq1fE/tqbchRDuC7nwmaDBGcFHbUqy2VJxDP9GcuUPvM8WHn62d1BXotl9BJD2UyvmPN4+QTjaJis/GxfKkcs1eo7bwz8TtSC6Ts3IXOnFMmRErcXrGWLUpMPE5fT+ANdquHihBa6C++GbxYFaca3fOHIbczA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB3983.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(396003)(39860400002)(136003)(376002)(36756003)(8676002)(69590400011)(5660300002)(316002)(7416002)(6486002)(66556008)(8936002)(66476007)(66946007)(478600001)(52116002)(4326008)(6512007)(83380400001)(6506007)(86362001)(2906002)(26005)(16526019)(186003)(956004)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?CMi0wvsL4LOHQ42kl40OmTKMx5svY+d0MciTISyn3QGRZZECY0n938IesPgS?=
 =?us-ascii?Q?KD/oWV0yQ3R+8dSVc0L1WknuHA8Uc6d8Eapc8qhEtOxnixjOXAvoqZW9XnJJ?=
 =?us-ascii?Q?7+SfxUaIexj25WNyzwY3X6K9wdet9cvFA66WpKLG4EnT6mYZgHPk9hjWmBbO?=
 =?us-ascii?Q?Ss4uZ8b5PAdyC07r0iUvwiiIKuqrrQFJUQAYRslycnTtrRKctFWypz+BoY27?=
 =?us-ascii?Q?yIqTJUOsK8na3Kmhel6z498hPhAvpB8DkbNw5Kt2bWuP54HSF+f3SgGP5hQf?=
 =?us-ascii?Q?nqu5tMH08LHCiFR3HfS/6ZreWGn7Nv/ZNZhb1zUhWd7O6PcMm5nyw3ngzTu8?=
 =?us-ascii?Q?1rqF3fKlMCNlvgv8E2klRoX1yiPM6Nx6kLP0saTMU/+pfTHlmYGD9u8XABI6?=
 =?us-ascii?Q?jBhivuiPG8hxgqC8WjfMIeoNC799xbcF6tPzoKyQvAvZvhuBMkW8eaLYXsH/?=
 =?us-ascii?Q?viTSHxnQumdLusFh0Ae9lYuSrFFEQ1yAzklbZhDBsNNqvd/kn4jVg7xP4Ugp?=
 =?us-ascii?Q?Ld3N54p+d4MBK5RHDmYW1DrxUkhCtLYm4SV1aILpGIBuRKy69ghM5OdaeO60?=
 =?us-ascii?Q?y54oAbvQOMmttctkvS6r/OGZtCXEK9+gQlq6zT0/bP7ActBmdCG8vlaT6GoL?=
 =?us-ascii?Q?fPnncZI+AbdwbytzuaFQ2J/k9OgYKHGXeH/G3tvd9uW4Zh/wdzuH+RwmHubX?=
 =?us-ascii?Q?EOYMCC4fpXRd7VOjjNytWZN1cmtplKArBLDOSVwFZoJ/yAXSGRfDEm05OHDs?=
 =?us-ascii?Q?rCAnx54Z00u2j1NPZSuTG1nWbETW78BDlanx5TtJgPPLBOGg1zxhZUFnPs1d?=
 =?us-ascii?Q?AHAW7lw2jVWbcRx4GpNbhSkydszxkS7Oi5dGDUUzqOqezGIln8bXLGC4UIYp?=
 =?us-ascii?Q?yDsU33vQQZsAzefsTTYHjLpo6zHlKvncVcqedcJjN/6nUl3BNUtW3L2+vUIc?=
 =?us-ascii?Q?+GphHXMoOLsKkelGythjXgoCxkG0J5YHxfOygdWI70YMp9+VQWqsYx8TANmK?=
 =?us-ascii?Q?xagKavQRPFPS+XVIHq3jzUkWcaWgtbEkYDQsS4AxLL4EiwkfBmt8+Z/KQRg6?=
 =?us-ascii?Q?1WMlVaO4?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cca5ce-48bb-4597-ce83-08d8c1c33cf0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB3983.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 06:25:56.1421 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZVYb/kfSu4BAc1o4oqe8gSuvKgY41AiD3QiK9fxdBtbR8qT0vk1kUFl392Kter9fuEIBkfysKQQyxS3l5M9KRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2973
X-Mailman-Approved-At: Tue, 26 Jan 2021 08:37:37 +0000
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
