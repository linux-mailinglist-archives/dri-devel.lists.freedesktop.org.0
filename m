Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6D36B9258
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D51410E753;
	Tue, 14 Mar 2023 11:57:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C27610E753
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H2dZ2FYim6z0S3kRVHl/VkB2jDg4STIDniHPr/XC+/+73xTNP2sbuLUicl2lP4OVw3+sKuiwRe2FM01iYSXvLmMCelvNszJBPvV1ifHlA6ZecvgweqjR9+fdI/kFSyLF47A/SPJdrZR35KIY7ulu8M8lu+5ryANaHA2vGDz2u1XYAPtUKGfkkRv8467L6vAgECNiCjLPkOen+H7ipFXkPES7XtI/f7ttNM7mAQ/RQuKylVA6qcHYPSHoEkVAewMSQ/l7REjg9bscj7HTem+OQ+tW8mBUSi0tAao6mNLkbRmeW5Dj1Xi5bVoeHTWUi4FVQ+XN7r34EtKRoyxF0+2/zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSOgie7mzSW/z5IubJU1uAwPU0cFhDNi+ptEortSkMw=;
 b=Ci8lt+pVLyhO+jXYM1zOZzYzbPU/pjm5DYwfKYQgQZgAmnIo6akJUChDt031Ft7PRcxHteMJIqTYOZgTv5Sq9NUgAbIcJutC/FB8yTLyptmoYSEDhLizCkENxnZrAq1Si2raXNLJA1G6PAe24htgj5qwnUx+gDrXW8DV5tMhVogteK7p4E4T+WlbsuqeMLAPtlgatKXnDHs/1+zLz7JmRQSVETes9Mu/Fm5eq59jXx2Re8kjSi/SbAapjxu/kPoNPkODHYOu9/zaZlRvWDzL3nDUVuoHSMJiuz0tQ6dFwaQw8/EqQbK7/AoBq+mugvWpPyDy6fu+MuLfSCBy3aMBcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nSOgie7mzSW/z5IubJU1uAwPU0cFhDNi+ptEortSkMw=;
 b=221ekHXNqHXXjtD9hDfK9m+AkjsFHhrDWdEwcMmywQZGuCeWrwcSZDT0j3LX9IRkujJAfLJtLrVlvjkoQBKVQFvcwpukKBUqMaE6y+E+JcIuFVXfA8kqPPyd2HPFjWTiFOeHXPvNm/rfgcUsEX4ATSMWLB5QeA2k+V+Be4OxvGE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:57:06 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:05 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] drm/panel: sitronix-st7789v: add panel orientation support
Date: Tue, 14 Mar 2023 12:56:39 +0100
Message-Id: <20230314115644.3775169-3-gerald.loacker@wolfvision.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
References: <20230314115644.3775169-1-gerald.loacker@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0802CA0032.eurprd08.prod.outlook.com
 (2603:10a6:800:a9::18) To VI1PR08MB4544.eurprd08.prod.outlook.com
 (2603:10a6:803:100::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR08MB4544:EE_|DU0PR08MB8811:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a78a561-16e0-4845-d4d7-08db24833b4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y4OWF8LX2ETo/szfLzibUaNi3Oom6jFHn+ET1frFKgnOSuW92M9xwjRa3Btx1f0AZcbfYrOMDMCg53AWEnFPZ3BTowsoyAyTJquGj1CYu8YdUB6Cg4cCIJAR227krQgR36iVF3WvAFwJGgza2Kh05HbtEn3B9uUvAcS18VFASz6LoiOGQ9uSe9zyW6ylMmd64/4Xkkav9LPR3WZSX6HyN5UYqCa+KLcMSHlYYvh2nE9FYOUmuWXV1uJ7SXjU7K7WYTo6y227DbH8tsXgWzaUm+RSf+qzaJhoYnzuWS4EtdpwMg3gMMZCJJxIJzFKPm7cgqXzh7vL/tvXCLHFzIgHzfN+tKuhtK1ZffOPGSvhrTXLOz200+55tuITS92kc/MQq7/w6uhCAMbRqncUbZkwThAieKKejcGH5JSWphRKPOEvNJRhsuQtd3CoXMKStaGPWJpi8UxMVlrh2OQCV9UcJ//dAIfXUHUaEuXAVtQD8sV3f0HwsFEpI8QGXNJZyafhsraNdrxEQK+KifSFTQxPADOa85v2vfhKUnq6Ah3hbu4XnxBP0qbDxp8bbT4ifkO7W1T8NL0LyrS1LMEt3qjXcssAtg6BheAkVtzyQkKQQQOGZ7+8z7/JlQkqwKvv60SwlTrgoZ8RxhUi7yA8ZHV9pqiIHxh7rJvyBrYHvXj3b3VzPKrxYgd/ux4xttDPhKOXEkwnWXncQ14B4dMIULMMhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199018)(4326008)(5660300002)(8936002)(186003)(2616005)(6512007)(26005)(41300700001)(7416002)(1076003)(6506007)(36756003)(86362001)(44832011)(2906002)(83380400001)(107886003)(66476007)(66556008)(8676002)(6486002)(38350700002)(66946007)(52116002)(316002)(54906003)(478600001)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QYa908kkTbzTbguBwc4FKaa6X4cegQhxRPCYoTBhnTuLcdEyu1fdC1gThmvI?=
 =?us-ascii?Q?wlouA8lpuYS8h+k3cPI8AGEeoUt8t+KXrgWz+QVrPCHEnju2tc9dRjiVRCDF?=
 =?us-ascii?Q?Z04AwpCybLbBr4yzVah9dHQ5oDzXogb93LOrckrJ5xoP9EHcxhl67mtt60Ef?=
 =?us-ascii?Q?Ca26f1OGQ6TztQanhls+PGcgCLXpM71pjb6JY+oHHIeqzq8DZBhKSzfaBw4q?=
 =?us-ascii?Q?xpEoyAT6qNKfmcxodY1KPO+QphDiTxEjCYYu/u6E+F1FJGFzFB/VyhPScJ1s?=
 =?us-ascii?Q?lfGEQfRq7h9k2oPoBlgQOUCWoLiIX9jbBmg+x731cgauJ1lFFwOgbk1onqCN?=
 =?us-ascii?Q?gExBvhXHOlvH1dnNuOcP61JaNR+9h6Di8K6dAYHmjlZocE2IMJTbrGyz1HfP?=
 =?us-ascii?Q?ro+fnK3Ekru65XSmXiv6u2xxDpMeb138bbh9UVuw0/Cot+JvdPYlYi0ns/ys?=
 =?us-ascii?Q?2sOFEHLFZ3fZaQ0K37OVriAhWV6WsNwjgLJffz2JZJiVTBPeVx8CO/9QyvGB?=
 =?us-ascii?Q?H9tXngsBorr+H81NQRIYzPQnafRIGlZiyV6MYp17MMWE1jEhWXDK0qMHqLZ3?=
 =?us-ascii?Q?hQs6WceFflrSRVEOgtwOpcqKTTtK0PicN4pzfP/NLJTPMHiue7mGL3DoQvqw?=
 =?us-ascii?Q?2WolAamfCCbXlLBSO9LCGG22tc9mVDzo3coHWlkiyMUsW6hmX/qR9KvslNVj?=
 =?us-ascii?Q?C/ja98Zyf7B4aSiqm5JSHElrhkX4m/fzCM1gTg2DwFj73pehm/RNcuhdD+IK?=
 =?us-ascii?Q?CU7IUMm2D0x2olphV8+qK8ZjrR3RnpCIlMj0EF540YAFgA2mpsDzc3vUnl7U?=
 =?us-ascii?Q?FAVDcjpAyL7AM3cKd0zlBYKZ1UDsggLuUzUJKtxJqLAKcdtFffaP8BOmd9br?=
 =?us-ascii?Q?Sv+cfed8cfE0RdvoIivSTBRSAN3dopUz5nbdNg5NGwGvrYO+zBsWV9pu0HOo?=
 =?us-ascii?Q?A8TIOUcAGnuH1gsWCJ6v+PH/DO93guWNDLsCOB/+vU6bo+gXdIoAv07cbAZ2?=
 =?us-ascii?Q?evbqvdSLEqnljAHVlz4iDa6IUMh67zKyHBqGnyy5XvV7S/zBAi3vx76fAZ8Q?=
 =?us-ascii?Q?+ruJELj7WBhHyhVAwDL0uYdPHQFaEP95NtdSDFMgTl+SCL9sFkkK1D4BSO8+?=
 =?us-ascii?Q?pz9G561Fn5n/6Qyn6qg2Vr5h5LmyEAeGrkuRJ25Y8s0aLvmb0Yb9nAuZJdDV?=
 =?us-ascii?Q?ScHjyJGr/XaAtk2vJxFKQZzGqTmOY2c2qgA46SRLMl0C9ecQCdwHjYcruY9K?=
 =?us-ascii?Q?mn4DvEGIEk8bbr55ZFIUqMtc5cqCRz58vNjXWTrAcKeGBieFaTqd02JNJ/Sm?=
 =?us-ascii?Q?HLJgycVZhGIaBVUQFGJ1i4fbKGvXepI7tulqsDCdyctRgYIWXyQGP18a2EIB?=
 =?us-ascii?Q?cXSKWBU97UmFFK+BeGfhUw7QLh5nCOfNdmJjeC013fqOdJB+skBmDwFS/dUU?=
 =?us-ascii?Q?gN1hNHVgO2NNt2BjDgolphde+HEHDZusvu8kIazXi5pt5ueQeT33HPgTZc68?=
 =?us-ascii?Q?eLaQlF4QYdeOOM6cnOkCxyuFRO4V4RoKx6Z5LP9W/uVpcQ/korOgyxZVIzng?=
 =?us-ascii?Q?JVJmbFk4q+RAU5gaGnAlx6PeTLbeAkkBLoguCWqkX4Xfzxl0Z2XhUptL/S91?=
 =?us-ascii?Q?flPQO+NfOcE5PibfIciPCN8=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a78a561-16e0-4845-d4d7-08db24833b4e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:05.8488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7ChySRemAmWA5388k3lGjCa2whxpBFXZGDbIZtDDNm2HmUxvjEjgzbmUwqxDeTWTwC97PHhr2Rd6GavdDsEl5BxazHVbcOGoTm/zGSZmqKU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8811
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
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Riesch <michael.riesch@wolfvision.net>

Determine the orientation of the display based on the device tree and
propagate it.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 28 +++++++++++++++----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 9535437271d3..5d4542c12f44 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -117,6 +117,7 @@ struct st7789v {
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
+	enum drm_panel_orientation orientation;
 };
 
 enum st7789v_prefix {
@@ -171,6 +172,7 @@ static const struct drm_display_mode default_mode = {
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
+	struct st7789v *ctx = panel_to_st7789v(panel);
 	struct drm_display_mode *mode;
 	u32 bus_format = MEDIA_BUS_FMT_RGB666_1X18;
 
@@ -193,9 +195,22 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info, &bus_format,
 					 1);
 
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
+
 	return 1;
 }
 
+static enum drm_panel_orientation st7789v_get_orientation(struct drm_panel *p)
+{
+	struct st7789v *ctx = panel_to_st7789v(p);
+
+	return ctx->orientation;
+}
+
 static int st7789v_prepare(struct drm_panel *panel)
 {
 	struct st7789v *ctx = panel_to_st7789v(panel);
@@ -351,11 +366,12 @@ static int st7789v_unprepare(struct drm_panel *panel)
 }
 
 static const struct drm_panel_funcs st7789v_drm_funcs = {
-	.disable	= st7789v_disable,
-	.enable		= st7789v_enable,
-	.get_modes	= st7789v_get_modes,
-	.prepare	= st7789v_prepare,
-	.unprepare	= st7789v_unprepare,
+	.disable = st7789v_disable,
+	.enable = st7789v_enable,
+	.get_modes = st7789v_get_modes,
+	.get_orientation = st7789v_get_orientation,
+	.prepare = st7789v_prepare,
+	.unprepare = st7789v_unprepare,
 };
 
 static int st7789v_probe(struct spi_device *spi)
@@ -387,6 +403,8 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;
-- 
2.37.2

