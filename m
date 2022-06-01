Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F0539F61
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 10:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C988910E5C7;
	Wed,  1 Jun 2022 08:24:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12olkn2076.outbound.protection.outlook.com [40.92.21.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA6210E815
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 08:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aWvv8Ksh4B4xVg6/rw14isyQHdroTdnnY/bMlHHi1SG+4UPgp1Y2Q489DCTtvEyyG6H7EZ2yua1TVMUhZ3fFXn0AR8/MPcvK+pUdIWVW1oxHXIRo3J+R6A/DleXHGcTnGTEQUEqDziRzoFwsJi8tg/l1J9p/VoEt2nHPaJvFkPssMq1Elzaao4d5EYtHQj2xUZU20Tcc1iEzueF8a8wCD7fhoYk+TVMJBLGKpYFoD3QkV76q+13s5vxHqRI4pm2j13qTdG39AMmHFfRVc7/AdaWyiZbvHqMr+P145qOhMwZqp3PGEdZbJW5fuSxPkZMsKugzFHS9cRUfKMy9ejVN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01teW4+XM3jsguNCT3YB4liWxhJyorjF+Fi212cpK3M=;
 b=G/gioaPbL5nOBpNFI/QeleE0wyUp5e+ATzZeTGBGv4mETt92lLSrzPlgCeH8s08EhVAJ1VTohpAimzXe+PXZnzAMuxHf/XItI02iI4BwSNFjqlKLSZmpfIx0AN/Gv1MuS5Y52EuJr4/QlMcBoAbHgo65YbwFFwx476lrJNdDW1vhfifAmCRu4IJR0mLZA92yxkYdP9VSZiEfJUSJ2KSsCBtB3o7rC0TwifVKd4yO7G+ZbWY+5Ey7eBtby5C5mcWUizNFrupxve0leNml1V5vGeqR4Y+ZTpzK+1erJnXmCZH3EVTY4X+dE+RZoYemUPPaqS1W+K0aecc6lDaNGTa7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from BY5PR02MB7009.namprd02.prod.outlook.com (2603:10b6:a03:236::13)
 by DM6PR02MB5708.namprd02.prod.outlook.com (2603:10b6:5:7c::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.15; Wed, 1 Jun
 2022 08:24:50 +0000
Received: from BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e]) by BY5PR02MB7009.namprd02.prod.outlook.com
 ([fe80::e179:40c4:4269:70e%5]) with mapi id 15.20.5314.013; Wed, 1 Jun 2022
 08:24:50 +0000
From: Joel Selvaraj <jo@jsfamily.in>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Stanislav Jakubek <stano.jakubek@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Corentin Labbe <clabbe@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>, Hao Fang <fanghao11@huawei.com>
Subject: [PATCH v4 3/4] drm/mipi-dsi: Introduce mipi_dsi_dcs_write_seq macro
Date: Wed,  1 Jun 2022 13:54:09 +0530
Message-ID: <BY5PR02MB700952493EEB6F0E77DC8416D9DF9@BY5PR02MB7009.namprd02.prod.outlook.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601082410.55266-1-jo@jsfamily.in>
References: <20220601082410.55266-1-jo@jsfamily.in>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TMN: [Q0tBwNkyvEmGCV4nie/XLHXZIc5M2wiul8t1Wm1w/sayebWJbnx6qCUBq7XH0uXR]
X-ClientProxiedBy: BM1P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:b00:40::13) To BY5PR02MB7009.namprd02.prod.outlook.com
 (2603:10b6:a03:236::13)
X-Microsoft-Original-Message-ID: <20220601082410.55266-4-jo@jsfamily.in>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07683d07-c797-4476-48a7-08da43a83229
X-MS-TrafficTypeDiagnostic: DM6PR02MB5708:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0sJ7oqr9GGFAG5xc2E+A5nsGGbrjjQ5EZ1WXReVgre5DbY5Vm/JB1QIacOv6kBqNsmFzjBQczhDeabDlO+iuh0BiUNthZmvz5q8fOqbesb7Vfjmk9zCf+r0jH3urH2YkDPTnHnhF8aX7f4D/Q2xgIGQHo34fIkXLQKYxQOtRSvks5yTYRQqBtWPRol7IOOnyqfC40vpGHvJWJnO1KI86ik5Xw9YI+k/NHKqZ9sXfbKYUNwY0aD9KBWDFFi2dpqSTiqE/nYH2OoSbjtWiTVbGLp5cz/6W+1opQwZRgvxgX5MgtUbbpELdVtNYZPRXG5I8wRXE295VXNsAlNniJ51r31FTgkYrckUF5U5G1WmZGn32LtD56qRrKqp0T5gPjyqjp2vCE/r24bmYuuZT1o5GbkzBP2RtwaBXwcojGhGVaaJkP7ID3N2b94y2QdSkEY6ChmDOYuFSTCIAtkDRwiMyoGB7bKR3d9nvq+bsAyniOJkAmmEIAocnHAyrHx4IMfuyZPtuyCRzitFQ5Kbu/y3ZcA8XclqEZaKpOK01HRmsaS7Pt1Jf79dCGOC+5YDTndAaU2J3kFNKFX3FQV0/eYGFRw==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vu0Sbaw0hk3Jvor8sQgyjGV8aLtFuDoFykF86ktIrzFeuxmD1x+bqXq35xY2?=
 =?us-ascii?Q?n3MbY8yZMvlaD4usyB5T4cy6Y+a/dUqdgAqpDLIvAYNBkFArkO2tSBvPfZZj?=
 =?us-ascii?Q?ZPFcwF8hVVPsP/OBKQtvBU9oiNGSfsccnUnqbgj8S+/ugwgKeWLhv03qY9w9?=
 =?us-ascii?Q?/SAd8mMyo4oTwIGUTgBn5b0/7mFKuf+VwHEQwIVyqIgcI3eTS58Llp6Y1uoP?=
 =?us-ascii?Q?XUDsLJLdnaBZZljTQtQZBq1hEZviFBWdvoXvxkEQje6ZDaKTiU8e25mdFn+p?=
 =?us-ascii?Q?s3LGcB4FqRRRIe6GaYSKK87X1w71JVyTXSrJ4OSLzeP81eGu+qQBDNmmbc3Z?=
 =?us-ascii?Q?hCl1lcyEDL/xHwWQJ78mrHHDg/sum09WaFaw9671utOTOBkkwDo/h5LrWKv4?=
 =?us-ascii?Q?z3mFUeLbrl5p4JrUMZAeAJsecCWEJpiXFGLeKUZzDCBXJQEHXaW0XCGjDJ/y?=
 =?us-ascii?Q?s1AQFW+tXDB/yJaY1VRvgyNH3SXemqNYqjlL7QF8M//UknzpblvcvMMbVuL4?=
 =?us-ascii?Q?Ud2xV9ogbrmSI4nYbHZUsjVLvLYhWhNpsFWTRdXhRPUoGnuBzQ8T39mxt+KY?=
 =?us-ascii?Q?bofedJJYtrgVlaik6Dp5wbv0/uQpQapVF0d5Um2RqNxz8WgoIqjekhzvGh8Z?=
 =?us-ascii?Q?eDj3iTCSiy/arPWXZIwmr3lWDGyoaHe4n6hTvJ7V1ktw96GLS4h8bibgpUIW?=
 =?us-ascii?Q?a6F97fUzvy24KQBhgZ3q0pbrzlTq/Ly8yH19ZZVs5zFOqz5mmeADJ7QzFYQM?=
 =?us-ascii?Q?i82DeoGRCwJQLBxbR08WDd5UY4Dp6jkJqkTEA9SkKbSxrXbAiFZ/Wzy18o3N?=
 =?us-ascii?Q?LThi8Z5Okqv+fqnNQpPOiGI3Zp3rE0qgtt0vbceFhhz7ArGpGTPrn4pkdaN5?=
 =?us-ascii?Q?4wQ4ySXKYfPPP6qL15gEOUSli7eBwUupjRVZ8AoUkGd7OsXjMBETRbuhg7On?=
 =?us-ascii?Q?wjOpYeJCZqPQ0Xfpy81s3YyyyqTqUNdAmnFIQHRURii+LIHLALDLlgdPEoJr?=
 =?us-ascii?Q?Pe0+SjplWpMIFC/fr8tDxwzhRdov7Up0mPN29Z3//8WEsZ2qEwtAD8WtvOga?=
 =?us-ascii?Q?IO8GQTC7YoVIvF2ka8UJx9VwmP945s7j/jvUTKp5vzo4nDuPCGJ8lKw6ozDC?=
 =?us-ascii?Q?qj2EVQHPDqZw6bWojiBT079k0pT/55mw/YOs+i9Ol1ShxK4SNshNOV7gAIgu?=
 =?us-ascii?Q?2ceNTNNB/eETvFgHqOIMLCMDzUMCQWekZDx7sQn0gdGquCl79mzYZNdAdlnQ?=
 =?us-ascii?Q?1JZg1DHOqre6ECTDP/ai6Vwfkaqe2xfwVFxqRNhYIIkgm80d28Oj9WLH/uMr?=
 =?us-ascii?Q?jY6DWnCnkVdtcuORlqV0k6o1sImYpSv8or8eTxRnc/lqD9j8gt4Raszblyf8?=
 =?us-ascii?Q?Z/15OZXKKRMBWrAhRokG1iQ3y7a+e48DygxlUhThg4tQSw9uKO4rbe7kldYk?=
 =?us-ascii?Q?2bWqeTtJftQVoNE0+VbrD5/nJ3OunKg/ajWC7GEiaXTdlJEgj3R15Q=3D=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-99c3d.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 07683d07-c797-4476-48a7-08da43a83229
X-MS-Exchange-CrossTenant-AuthSource: BY5PR02MB7009.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 08:24:50.3354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB5708
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
 dri-devel@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Joel Selvaraj <jo@jsfamily.in>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A helper macro that can be used to simplify sending DCS commands.
It is useful in scenarios like panel initialization which can sometimes
involve sending lot of DCS commands.

Signed-off-by: Joel Selvaraj <jo@jsfamily.in>
---
Changes in v4: (Linus Walleij's Suggestion)
 - Introduce mipi_dsi_dcs_write_seq macro in include/drm/drm_mipi_dsi.h

 include/drm/drm_mipi_dsi.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index 147e51b6d241..4a5996901689 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -293,6 +293,23 @@ int mipi_dsi_dcs_set_display_brightness(struct mipi_dsi_device *dsi,
 int mipi_dsi_dcs_get_display_brightness(struct mipi_dsi_device *dsi,
 					u16 *brightness);
 
+/**
+ * mipi_dsi_dcs_write_seq - transmit a DCS command with payload
+ * @dsi: DSI peripheral device
+ * @cmd: Command
+ * @seq: buffer containing data to be transmitted
+ */
+#define mipi_dsi_dcs_write_seq(dsi, cmd, seq...) do {				\
+		static const u8 d[] = { cmd, seq };				\
+		struct device *dev = &dsi->dev;	\
+		int ret;						\
+		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
+		if (ret < 0) {						\
+			dev_err_ratelimited(dev, "sending command %#02x failed: %d\n", cmd, ret); \
+			return ret;						\
+		}						\
+	} while (0)
+
 /**
  * struct mipi_dsi_driver - DSI driver
  * @driver: device driver model driver
-- 
2.36.1

