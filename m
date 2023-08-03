Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A490B76F3EE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 22:14:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3157C10E21D;
	Thu,  3 Aug 2023 20:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2079.outbound.protection.outlook.com [40.107.8.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D715010E0E8
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 20:14:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NAVApeQy4zKnEZVY5wk3ZBqBJdLCbBTah5Q4znYvvR60h1yMZL8bt302r2IVNyPUKCaKWqn8euzhak8Q7JXvyzjUcp2Z8pN3Bddu0ZHuPlnPwZYOukwnQg/9WWeBNEyWJBE2EXpQZg75XHipCkXWt04VeICTvnqStgTUoIZq/fxwbiCHnioc6+oULzwaP3F7XjQxW1PC+MT4hSShGbdq+JvuLKNMpvX+9wtjSHevPZSoDnwuU1ojOXLA4VE9KLZIJFwMxhM7d+O8irzk8S7+yk+/sUhVN4A98JhwljEUcLEp4I1/z/A2KltU/NqviFiEOwu0McRAYhMxmZG5A6tEeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6/2iniA8O0andcTwDOuMihh4iRLN0psaXlKy0CoB64=;
 b=nmMysDniKINo2bfuUONaGgHkdBrb/zMM9s7kPzD9ESj4PislrMTQJlOXiroO7eqKjbxMSHoA9Z8mAvLtFgWqZwlTN4gmcVq/l5wOKPqBQubjgN5iD9nc6v9bl68fDHF5aQeMVMf65xDaz7FWCkSvs4ouVIpA0NDWpW/NoXZnLFDn5mMow1rDzNGd1Bp7BW3PvJzOxn4XPkq4V5FaGglblP/dxmxJvQkWxoKJ13mIC642+rGZYkXRESbTEu9mdQK0a30UcYl+NH/MfBNJMuAlwvj7J+miVoTpajJPcRuDJ3LA9nM3YdUgYXN8j6FkL9IKvsMv0rhBDfLXGEG2//+paQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6/2iniA8O0andcTwDOuMihh4iRLN0psaXlKy0CoB64=;
 b=0idcW0RnxIC6rGzXe8D3tao0d3cmHYK4RtoUH59fsUCFrYhSXJLsNpcCuC71wbFQo2NgqsuOv0rKVuF+fBUiimUwx+Iq/pStP6EVTKSh29PNIS8RuKUr42wWIVXDUGW1/GhBDmhwawEiJr86Sw3IW1gjPsIodnj6HLK7BsMZkXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8277.eurprd08.prod.outlook.com (2603:10a6:10:40f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:14:02 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:14:02 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Thu, 03 Aug 2023 22:13:49 +0200
Subject: [PATCH v2 2/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v2-2-207cb1baea0f@wolfvision.net>
References: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v2-0-207cb1baea0f@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691093639; l=2273;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=eiS9/88u4XxZT6MMZeo59P5+V2nbWgGsv8Uu0rvAgNk=;
 b=Qt8Jb3TGp4g6yriM2yjgA5uc12NKd5fgcKaOXAFjAknYqpxuHxxHD5naj5OlKOCT+fTRj36A1
 C6DInwu9HGlBQsPgr+zvCbhkkw73M8GF8CWZ6a1CMIQcat22VlfP3D7
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR06CA0212.eurprd06.prod.outlook.com
 (2603:10a6:802:2c::33) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8277:EE_
X-MS-Office365-Filtering-Correlation-Id: e648029e-8b94-4918-5baa-08db945e2dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qBDoy4rqgNBvvQk0DXTFZh3Y1FcelufOC91QXJ/jK9lfNhQHjMP1tWMdLSKiR5JQHcY1HAZboZe8lrXPK6TeuCB7BFubfOdjtEJYJrghyD3A3mFr7RsX69Y6kX73KlWqUCdNyiOX0GhhELl4EI+2f8WQASEkqlJqj1HxZNEGVxBmUrSLgjmIyvTavpoIZWZ2zNBLZ+G/1r8XTopa2wKvRb02GJ4R5AyuOfTq0DqshAnqBuAh1E+GWShLuQX56VIyjvXEdEp6s2KEFBCuPkSTlq8hd1IQ5ewhH1eOTPDQaC7JjjFqmBeueF0rTSnsUvEDXG6v0Fg87Lb9JOgftoRuoJh3JGFGcgFdbv5sbEEJ8AZ9nM+Q0lsO2WI/CUvq3QhtNmf6abjnHpcybHVR4M4VevjaF10nyIPv85ulPj3eqZmJ1gE38JnCZbB2YqLg+dpFhOZCQabo+rg3TW0wLmmKLOnVizrlCvWPgmlC/2qaf85kJul6jpuA5/tpLY3sklv32rwkBAzgWQERaZC+HeuDCr+KmzgWh3iLcEFP+TPkw16TjtIg9ei2Usl4xWaNjOqjbGocNN44BUFr5EvpLvJ+mKwCMv0avqb3Ox6PParu6aN0e2M3TqddAQeNm4g3QYQlhU+YbGeCq0fwc+v0YhMdtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(366004)(39840400004)(136003)(346002)(451199021)(2616005)(107886003)(6506007)(186003)(8676002)(26005)(66476007)(2906002)(316002)(66556008)(6636002)(4326008)(66946007)(5660300002)(7416002)(44832011)(8936002)(41300700001)(6666004)(6486002)(6512007)(52116002)(110136005)(478600001)(38350700002)(921005)(38100700002)(36756003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME0wbHJ4MkNCTE9oaEFTTHo3NlhmZTlMeGNTWFh2RWlsdW9NRXFHZ1ZVdnJP?=
 =?utf-8?B?MjFmZ0RBTzFZVVJ5NERLNjF5N3ptczZ5RlhnVnlWNFhLOXg4MHpkRmNRczEw?=
 =?utf-8?B?M3UzUDlOUllMN0RwYy9XaFVWUWJNSWJSYTNta3orZDJSS0h6RnYyR1J3MUZN?=
 =?utf-8?B?dnJXZnhhN29rd1Z3dHJmeUxzdGg4bnhYMlpkY2pCclRISnRiTHNia25EMjdx?=
 =?utf-8?B?bm9sMlZEMGFGTmdDNTlLYW1aQ1FXdSsrT21PVjJlNVNTWkZnWE1mcDIwWW9M?=
 =?utf-8?B?Zks3UWh2K1puUXhjUnBZRWFKM2lUa05haW15QjZQeVV5VWUzVzNJaUVXMUpl?=
 =?utf-8?B?Sk82WUdJTzJCSTFvVk85OWtYZG5LZzExdXpBaU5lY1RGaU54OEVjSjU2TUVu?=
 =?utf-8?B?TTd4SnV0UVA2ODJLZ1FiM2xUekh3VFY2d0Z1dTlNaE80YUdRbkJjbTl2c25k?=
 =?utf-8?B?Qm1PUHAxL0h6N0dyMFVZZmJuVlhLaXlsV2wwWlZrd0NpMkZaTFlnZHlFYjhu?=
 =?utf-8?B?NEhDRktmNndieFZmOXBpMjlsbzRtbThQcVk4VVVRRGxidkluN05IUFlKWWNB?=
 =?utf-8?B?RjY5TUtpb2pJQU91dGJZaElFdE53Unk5VEZmM25PYzl3ZlVRMWROZXF5TVBn?=
 =?utf-8?B?VUFQZHZjRGdQMlJaRnltSzRvdysyZ0ZYVGZ1RncyZ0V3QWsrWjRlNkk5OXBx?=
 =?utf-8?B?azFXaDM3WmZCL3VnTlFlcFJYZFZQVUZwNlJmUXFnV2FaT2RTKzcvSm5udGdG?=
 =?utf-8?B?dENPR21UOTV3c0NyTStxZDRIRWF5V2J3OVloNXlzVFZ1YWtuM3B5RFhLS1Y1?=
 =?utf-8?B?T2tKNURoQmFLRExPRzlqNStnaFFTSTJMQ3Yxcld2VnNrK1M1VVRzKzNrTGZa?=
 =?utf-8?B?cjFGQWo2OVEzOERZRStyQWhOajlsQ2hhaEZBOGRyTHllSUl2b2doN0ZrNURq?=
 =?utf-8?B?RjVPM2tQYTFCZDJxbEFGajI1M3AzQmlwZTQ3MVpQMWVPeGJBdVA4UDJPU0JE?=
 =?utf-8?B?aU5uNnlnSmFMQ2taa1g1RUhCZ2FaVGpmcDlTRnZKaEx4cHJtS2hjcFJLb1Z4?=
 =?utf-8?B?cmJ2SGZTTTJMQnY1Y3g4c1ZseFJHRGM5ZDd4WDdDTnVDMDIzTXpZRVdFeXVW?=
 =?utf-8?B?anBMUHk1UngxcXBiL1pCM0s3eWtWY0V2d2pkUW9UcnNDQ2ZKWCtJMXdZck12?=
 =?utf-8?B?WGVPcFRHcE41aUYwbmRJOTdZd29wQ3Bld3FlYnZYVDcwc2hIOTd3YjZpN21s?=
 =?utf-8?B?ZDEweFFhQ0o0TUZxYkkvUjhDcjFhbjlnUTR3ZjI3bTFEWnRzZHFkZEY0MWNN?=
 =?utf-8?B?bTRmN0V5Tkw2RUZ5UU1EWWFvOWdOMmpSZkk1RGtLODVaWjJqUXRUS1MwbWYy?=
 =?utf-8?B?OHkzc1NGSDhadmFuZEh2TzFrM2o1RExXQW05ZmpSWWN4cHpVbUticUV1RWpj?=
 =?utf-8?B?ckZWR1h3clNRbWhaV3UrdXplcXVYMDhQWUtOWWRHejN0bkJKUll0QTZucTA3?=
 =?utf-8?B?UkVGNXNjUTlVQ0RWbUN0dkd4aGdmV3VidDRNQ1gxOW4xeWgzR1JFL1FlK3VX?=
 =?utf-8?B?MlljWUxUS2JwclFmZVJMaStMaFJEYnBtbXJIWTVyUjdtQ0U0OC9xdVZwMDAw?=
 =?utf-8?B?a2JmdGZQUEwrU24zd25jaFJGUm16SVlvaWRCSFNMYTNLUHlPOUFyQjBWNnhP?=
 =?utf-8?B?aDg0T3M3Vk56TVVZSTg0THZEVmVVa0MwNEdXd2czTnhMZ3pleXozWGFMWmlY?=
 =?utf-8?B?MHRyRzAwSGVDelgvekpIcFZJWTBHWGROdjIxejBwYzYyOGloN3M3Nm5rOWpE?=
 =?utf-8?B?eHBueTBnbEttTVJDRGxyRWd0alUzNVBNM2U1VWZZWmdIYTNRZktTQlBWaTA2?=
 =?utf-8?B?bkE2QTN4N2pJeE1yRDNjNW1qWU1sU3V6RnY1aEwxS2xNeWI2NzhJT3dmM1N3?=
 =?utf-8?B?TEorWDBHYmhaa0VQQmpzak51K3lib2h2VXE0STZPNWRWUHlrRU11c3gzMmtZ?=
 =?utf-8?B?dmVPT0FCRndXT0VHOFlOY0lhK1hqNWZlMThVeWpLR2gvRjg1YXdMeERlUGdi?=
 =?utf-8?B?bTlKSnkxdTJKTk9iemxzMXoxVS9MSEtzUjJlM0xUY3hwdHc1VnRUUk55eW93?=
 =?utf-8?B?TUtUd1YwQjdRcUFpRnJBdlEwYVlLM210aE9NUE1nTUpVcC9pWCt6ZDIvZ1pS?=
 =?utf-8?B?V2c9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e648029e-8b94-4918-5baa-08db945e2dde
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:14:02.1358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +9QVD71lflZ6IhpCt68rvQwNiQAQoXbJjz3FjJ0af85TFdFuhhXU3GAUo1dxIDApLJoFX+XjLcb6iWSTcNs1a4jXHcsDzREMZ/JZQ/U8FjY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8277
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Determine the orientation of the display based on the device tree and
propagate it.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index c7cbfe6ca82c..6575f07d49e3 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -116,6 +116,7 @@ struct st7789v {
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
+	enum drm_panel_orientation orientation;
 };
 
 enum st7789v_prefix {
@@ -170,6 +171,7 @@ static const struct drm_display_mode default_mode = {
 static int st7789v_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
+	struct st7789v *ctx = panel_to_st7789v(panel);
 	struct drm_display_mode *mode;
 
 	mode = drm_mode_duplicate(connector->dev, &default_mode);
@@ -188,9 +190,22 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = 61;
 	connector->display_info.height_mm = 103;
 
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
@@ -349,6 +364,7 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 	.disable = st7789v_disable,
 	.enable	= st7789v_enable,
 	.get_modes = st7789v_get_modes,
+	.get_orientation = st7789v_get_orientation,
 	.prepare = st7789v_prepare,
 	.unprepare = st7789v_unprepare,
 };
@@ -382,6 +398,8 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return ret;
 
+	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;

-- 
2.37.2

