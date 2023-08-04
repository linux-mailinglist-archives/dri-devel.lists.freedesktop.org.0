Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB2B76FF62
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 13:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624A710E6E0;
	Fri,  4 Aug 2023 11:23:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CAF10E6DD
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 11:23:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYtss5FUF1v+/cGdQHTINZ3MWhXoD46jgUQqmE1vCZ13aegRQXm1IyGyFL30ouQA1//mzum56Gj/tVPwoOLWruFS0LuutwuyjSP4I3UYYoGAnLMi6iSRIxYcH01OPUdS8R4Nln4e+Kha89YqDHkxRo0DfJE+cNl6YahIoJCKmWkewBlue9vecVH9nypfA7U1Yuly0BD6V9YizwFPQnhOk6h6vxwUcxIZ9nKbp1e9QlohNCIxEpS9VfvPYGvMbaN+KdniUmJT74hQLjI3ux42QuHhK5LcOe73C+6pcYhpojt+GWZRWULL3nHlJiX6d2xHOEacO5j2ucCr0Btbz24JYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9VBwqeIfG64Bdp5SOwixYwqJZmxKloYIiJ7xGDWDnY=;
 b=hydYNJyIJe/Em6InLBj6j2UyYGDzB+C/3YPyHtPf1Oc0R0tGRayHYg7U0xDK3Rsr+epx1R1/E+6L3IWPo5IMSJHhPBaTjsDbUPejQfut67c3rAzwp8uuhBoyP0loFF95bzNT+eroNtCfp0/+JFmb+3Ut2dXmEev+9w2/QFnPCR9gpSfGjiT3e0Gy60q/sy6NIFKkvnz1L8+kmRPeZMta3fdGX4Qen0l2GsP1ey8b1uBZ5mtCCKOIky84lxQe1Vp1LsCG8NcL7ElGUZbj432krR9CFkfUBriFjdsygow8UVnfUY4YJN134QlwvbnpA96pgxblBm20LWRG/0CKw3bBBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9VBwqeIfG64Bdp5SOwixYwqJZmxKloYIiJ7xGDWDnY=;
 b=EKZSj7MuKxLEy7hwT53J/gHcEKvnQqFTewZBHZzxssxf1FVdGkeC1VNVS3K5c6uTZ4eTUy22MPzZXEdOy/SfxLEhBM+mTM9/bLNxr7yeGGvAA7gNTh0YxoBdxE1p5abcK2vJ6mjJiCCnmOvTsY2K8Fva2vTAUKTceUn0k9fqi+k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB5PR08MB10214.eurprd08.prod.outlook.com (2603:10a6:10:4a9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.21; Fri, 4 Aug
 2023 11:23:20 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::9d1a:4539:a8f8:dd60%7]) with mapi id 15.20.6631.046; Fri, 4 Aug 2023
 11:23:20 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Fri, 04 Aug 2023 13:23:09 +0200
Subject: [PATCH v3 2/3] drm/panel: sitronix-st7789v: add panel orientation
 support
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230718-feature-st7789v-v3-2-157d68fb63e2@wolfvision.net>
References: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
In-Reply-To: <20230718-feature-st7789v-v3-0-157d68fb63e2@wolfvision.net>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Sebastian Reichel <sre@kernel.org>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691148197; l=2056;
 i=michael.riesch@wolfvision.net; s=20230425; h=from:subject:message-id;
 bh=vuZDK/ATsMHht5Q8uxKOQjXxmrTzLm7WsFyZBdFz4Po=;
 b=MmLlCwJPinoPV99u+Qk32aTdLZGbhhohfqn0Ub7warC/lM9pxEbUHuHvLUWKm5JT8Z2kSgDKa
 c2q7er0Q92JAaQcQ1qjpQ0vbcudaQZGwDsJNI1HIsz5CGnSqSeVYU9b
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=1QQdXA2QbwdxaQn/VQK0hz04C8IBYhDowbK0hlNU4Ng=
X-ClientProxiedBy: VI1PR07CA0281.eurprd07.prod.outlook.com
 (2603:10a6:803:b4::48) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB5PR08MB10214:EE_
X-MS-Office365-Filtering-Correlation-Id: e1fd9a35-6e8f-440c-a37e-08db94dd353f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yxDhC3Wt3cLTz2+yqk+VjX581y1Y3giK1sbnBWIxhZ36Yj9uuzB80okkdbYijJNjxrVlxBQjUDLaYXf19S+hL+yDeZvvrwRhywHq4DD3gva6STfV6RPZ7Kc8mV61Fheh5t0KEOoo5qVaB/cvOtk1dxwM1WViW8kc1L29AHdhMoP3ZS3Hf97lPNRY6WTJnBiTt0BsKQqfzMihX+b+rMfNGP2GCjtFo9L2IUpkk8BRhU0XLo0q6RrQ8jLpWcCGLZQep5ku9rklwumkQUsbqIYlDrDYcA9dijS3W2RxKJcNwJ9OpVgEkkRRo5nXIuLdhWf/IST738HE+qZ3MOmSstyBCXSPlkBECjNrjMBwOmd96LGaTSXKbGCbuajfm3j0cz3ekXKroZ/TdgtJK3vESd5ipv5pjhqcZ1IZdUThv6mk/e1/UbD0F/LAH5gkWgZ4naFkyFJoOUKNwJlSQR75XTMKG2T3o/Y2mHP2/hpRVFkpyjei0dh/KNb7RULpQvT+KtYAziXf0KopMdikvPGgXDuoXb0qD+irEEGYXitzluyDyd5kxSvToGCBPD9LuKWKwXK7UdgsHJWYbDmV8GaGitvoeKaciBQKxXNdbDAis5yCVL/2tA9DI1HRil29q7+804KiShHrSLs2lDA6DSiXwss6qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(376002)(39840400004)(366004)(346002)(396003)(451199021)(186006)(1800799003)(52116002)(6666004)(6486002)(6512007)(86362001)(6506007)(26005)(107886003)(36756003)(2616005)(38100700002)(38350700002)(921005)(5660300002)(41300700001)(8936002)(8676002)(6636002)(4326008)(2906002)(66556008)(66476007)(66946007)(316002)(7416002)(478600001)(44832011)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0lNL0V3bkdMRENmdHA3SUdENFkwcm9WcDJaVlRSdXJFWFplRmZRT2dkSFNR?=
 =?utf-8?B?R1Z1OHR3RmhKRHB0eU94UlB3VmRPWndOZHl3aEMwYUlGUGhtY2wvYnhneUdw?=
 =?utf-8?B?dGV0MXVsVXp3WEJ0dXBFQzhMaVpaYWtBSWpsUExtaXh4UU9FM2V5YVpMbm1H?=
 =?utf-8?B?a1hMTkQ3YVZFYkdBU01OV1lXQ0QvRElpZFR5Tk0xZ2FCQ09WRHFGMTJaRXda?=
 =?utf-8?B?RGdHYTBTN09HTlJIQXpQOThSVjVod01oa1BFazVnUVAxVXMxUmtFaFI3SHE0?=
 =?utf-8?B?Rlh0T0VSQUtwRzZVT0JqVkovOWlEWExqY1Z1a2s1NVBlWE4wYXQrOHhXTUxy?=
 =?utf-8?B?YzRlenBwWm9yaTBiYVRKV25DbkQzSVRaL0pPMzdQN1doSlI0MFBJang0RU1z?=
 =?utf-8?B?bWlpSUV1b2F0UU11MVlUN1B6RGZieVlpUmtHYUxBWVViNS84djg0bVdSQTQ3?=
 =?utf-8?B?UFV2a2RoZElGclJkMVkvUWc1cUVyMUJmVTgvNnVPalBYQWtZd01TSHEvbEQv?=
 =?utf-8?B?emp6TEsva2lzTmRHVDBrcXAzYzJzVEpwNjErSHFWWXBaSmg1dUZTWXFlSTRz?=
 =?utf-8?B?MkdkQTBTVVh4U0ZwQzVzZDhUb2pqSXBZNThnRjg2Z1BkRjRMWnR4WjlNQ0tF?=
 =?utf-8?B?SS9OSDRlLy9FWDZHVml3TDJOUjZGOUFzczdTdzJ3RUJ0L0V3NG5zUUd5WUtu?=
 =?utf-8?B?eFRJSmxIaTZWVWsrdmR2cS9zYnhFdG5CK3ZvQm4zN2VJR0hIUmxpNWpBUG9l?=
 =?utf-8?B?S3ZkS3ZSUDAyc3FYWmlodWZuQjZVOWxsYmc3WnJ3NFpuM0hUa0dYbHpqemZH?=
 =?utf-8?B?b1lSYXBGMFRpT2wzRE94UU1XcnBMa04xdVQrWTdOckQzQkRwUVNmYURtWnVL?=
 =?utf-8?B?ZnFLaEx6RzVlZzJpYnhQNW1zZGdxN0dyUWlEMDhjSzdWbTRxTmwwTEYzS2t1?=
 =?utf-8?B?UUxCVW13NmltNFRIWmhEbGs3VzBCVVV3dk9PeTNBb0RaM01LTTc1RUM4bTg0?=
 =?utf-8?B?QlZMb0hrQnc2Tm9KMHJSejY1TFNRRFlnQXdyZ3V4TUZ5YXNtMCtOa2dnYU1w?=
 =?utf-8?B?cHIyK0g4T3FEWUF5elQzWjdYRVJQR1NscVdsejlJL0lZdGhNUk5oT2tVTnBj?=
 =?utf-8?B?VE5mREZZTTB5OGQxSkxoWmdEdFZ1aDAyRVVaWFBXcUVlaUJMLy9wQUNVM0U1?=
 =?utf-8?B?WHdBSVdNZG5peVNJVkF4NTNtamFwVHNUV1NDenI1UGk4Wms4NzJkWFJrVE03?=
 =?utf-8?B?V0V5V3hUSzZUZjVCSk12b1RPWnpsdXpDakNrSjBtcGYwUXFhTTB0RjhhTi9C?=
 =?utf-8?B?SGR1YmtXV2ZVa1I1ZXpXVnVnQnR2SXlna3ptU3hWS3pjMlBJWEwyL3ZaNHg3?=
 =?utf-8?B?RU1wdUw3L3g0STFST29oUnlvNUljYW4wbmx4S2ZJMUhOam1VQlptenc5SUtU?=
 =?utf-8?B?WC9nS2xsZ3FHcGF0U2ZkMnR0N2pjQUFUNUM1RWYyUWF2THkxeUFCbnVralE0?=
 =?utf-8?B?S0lWTlJRcldTbG5KdlQzL1I4S3lTRzRRNHdzN1J0YnVpeFQwU2JkeDYvamQ5?=
 =?utf-8?B?b2o0enVmMmVGZkxaN1BmdkMwbjUyUHVERUNoMjFrNWdMWmhWUlhnbzFrVkx1?=
 =?utf-8?B?eG5HVit2bXFqbHVjeUFIMDM4eVZkTW1nYUgvTVhFRHFjWlNjdkNEMTQvNGM5?=
 =?utf-8?B?VTJtaG8zMjErWGVHTlZmY3ozT2hXRnd0V051S1RYRTNkcFpLRTFBbjgrbVBT?=
 =?utf-8?B?TkFCYWNqc2pVV1phejRSMTVzUkV1UVJrbU43S1loOFZuUEVpK2t2a3FDMUd4?=
 =?utf-8?B?MkRxcHVneko2Q0FPZWxwakF3ME5lSFQ0L0w0QkJrMmJNYld1ci9VOGVaM2JZ?=
 =?utf-8?B?dXhaMHQ3aXBDNVhzYzdhVURKdmloaHlGMkdCeExKdEcwOHdxMW1DUmZ5NFd1?=
 =?utf-8?B?REdPT2g3cDdsVTdXWnRPNmNsUlQvdkY2KzRpUDhtYzdKa1BwMW1IdVlnVnNZ?=
 =?utf-8?B?dDM4UmxLaXNKTE1NQXRMSnRSQlFKMjlENzEzNXdoZnZ6VTFuT0lGVHg2dEFV?=
 =?utf-8?B?V2YxYmRRdkV6Zyt3MUlGU2o3Qmphc1hiQUkybTc3cWZKc0EwUTZ0czJFMzMx?=
 =?utf-8?B?aTFDUWM1M1h0NXpuWVBLZldKR3NPR3Exd2RGSXU4K1FaQVNPTDl0WTgwZ0x6?=
 =?utf-8?B?anc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e1fd9a35-6e8f-440c-a37e-08db94dd353f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2023 11:23:20.6284 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BuLR83R44fcr0aQ4KZW0NlSJwy4T8H8/CWCHnQKFyhN7GmAKwij0y/RD8qCL0ulMEWOEWIWKfK291d7c97ygZh3zFs6/+SQ4pWj6NHhAlI8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR08MB10214
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
Reviewed-by: Sebastian Reichel <sre@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bc8df51224de..0ded72ed2fcd 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -126,6 +126,7 @@ struct st7789v {
 	struct spi_device *spi;
 	struct gpio_desc *reset;
 	struct regulator *power;
+	enum drm_panel_orientation orientation;
 };
 
 enum st7789v_prefix {
@@ -325,9 +326,22 @@ static int st7789v_get_modes(struct drm_panel *panel,
 	drm_display_info_set_bus_formats(&connector->display_info,
 					 &ctx->info->bus_format, 1);
 
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
@@ -522,6 +536,7 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 	.disable = st7789v_disable,
 	.enable	= st7789v_enable,
 	.get_modes = st7789v_get_modes,
+	.get_orientation = st7789v_get_orientation,
 	.prepare = st7789v_prepare,
 	.unprepare = st7789v_unprepare,
 };
@@ -563,6 +578,8 @@ static int st7789v_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
+	of_drm_get_panel_orientation(spi->dev.of_node, &ctx->orientation);
+
 	drm_panel_add(&ctx->panel);
 
 	return 0;

-- 
2.37.2

