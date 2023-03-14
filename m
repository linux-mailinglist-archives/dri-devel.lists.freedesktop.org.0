Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D96B925B
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:57:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083CB10E787;
	Tue, 14 Mar 2023 11:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2087.outbound.protection.outlook.com [40.107.247.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9462310E77E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:57:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkpCyyTV13dfaNr/hE3vOLRXzQvF3BHlGa+ec4+0d6wKMIZ4cuUQBQdV8NWevTdmBUvneTpKvrVh5vuU+t0+t8VNHt+8bRCLMja2eZFbuS+h8nD+wFAG2fJdrdFut2TVaxQtUy9JpZ7nSQFb5rv6O9dD7+PEk6VSjDuzBSpfRgJzL2unozi6GQIqci4ldA7cL8WcjlbxQoFwLKdp2uvo4wa1ehzbjKCkCyH5dsEGmnpRjagXzKXYN0MzdaK65KacnADRTSjngipne4tIvqYl7HZ4Ls/bOOYUGXg7pyj2xZAxGvNaET17TP8cppMG3DZtyKBNNqCRfdMZ/+PfROHITw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yr4BXicJSWiebUXqj5ZxifrIDR20c5HmPusCE+BmqrM=;
 b=L6i7FDPqh++YF0eN5U7eRanDEuVhk6RipR/Ke5ytoeMWREBymK+wlrGQ73ohDs/UyAACfRGIOHua4Z/Idxu92sXgS7ecNM72Nv1wgVvVgfDvSYdf8uspaxyOMM6nrRJ8hqGyFBwXh4tB6Bm3AYpJA/q/E3ZJZnRAxFXOjh8555MYuYS7iajPUceRNBYw41mS8LWwGUmXKUhQCirYE+gpn1fHuSLvjDvFpbJm/UFXD9roMVvA62A0fgfyDWV2UkGXyv0abDYKBlF4MlCh37/rcm28efuP9pBCHQGyxxikJOwhTBQ5OpY3fDH3v3VI8ItKgvTlQqk+AGvBaiQ34u5Gyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yr4BXicJSWiebUXqj5ZxifrIDR20c5HmPusCE+BmqrM=;
 b=SFRdQh3s17zw4PHlLJvDvqBwVlZ8CuRfLV7Vi/egkRtMm0jS83yNza4RdTJJSw5kyiS6qMUX1wADcKep82ybrUvNVYMIExSl26NX4g+PMKtPUHO5lmuenxL/wAmf9LFv92hWBDuwhiAScWLeqdcXcMUNY7PoAhxLjCwUyMS4P/A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com (2603:10a6:803:100::13)
 by DU0PR08MB8811.eurprd08.prod.outlook.com (2603:10a6:10:478::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 11:57:07 +0000
Received: from VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08]) by VI1PR08MB4544.eurprd08.prod.outlook.com
 ([fe80::b094:4fd2:abe3:9f08%4]) with mapi id 15.20.6178.024; Tue, 14 Mar 2023
 11:57:06 +0000
From: Gerald Loacker <gerald.loacker@wolfvision.net>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] drm/panel: sitronix-st7789v: propagate h/v-sync polarity
Date: Tue, 14 Mar 2023 12:56:40 +0100
Message-Id: <20230314115644.3775169-4-gerald.loacker@wolfvision.net>
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
X-MS-Office365-Filtering-Correlation-Id: 2bbdc6cc-a07a-46db-2f4d-08db24833bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdzHXeR24xe2gHMBWPKOBTcy5/WeGPliBkgo+1DZlFYnx2/oqBKLYJ1jTf3WrRgd/ztlhbzr+EVBVqIDStXPcDw3nBsFuhNZBB/ZoM+25T0kUVlQzmWaTVWZPekZI9PlRroFDpE1zbjKvMm63YsqjmqeDd8cnOyKdqmI0et/KEj5tMaYNthELrNipVbCQA0TqTTjyF9/cdpj4KCwsYmR4SUiU8Lehn/mxnlCRVN3ViRCHJmIWkUYB1x9sZaHixAiW4G+jW6+eEMiJMe4sGeDm2kHFGqx/8+x5jvS41oewMRtDqWXfrIVNP7hnZq9pRQehYE6z6hcdSeeawT+6OMBRH+V9rJDCDdyp9/H05mNiBip2DJf3422BuE7ULGCLYtPEeNc9q5SZV0UCDVwKaOJPfQeioN4B8w+4RJNDkzbwwSqUsd5VTzXxVgE1vR3uuvpDUd9GP5oYWtveOlvzBhQVee172hpE1ScwoKLZJXIFjb6BXsg/1zKL8yi1D/FVO6+KTnwxMUJR8AMgk2ZyFW5iIBPLj3ik90m3G3MAEKhFvzpCGFNhwlRjUHCF3v3KcdemvV6RPRRJFYzLLh+rlgbpkudG7gyQo3/1WpxpSzZURcJKL+3Tu/LtRwnInonY127n3weKv0KEhp2M0Zp9aBgvO+aJukALq5t9PqYQKM6Rm74oMSV0xrDvEli4g2TjBT6SuqRB6RusSmx2kT0rS+9bw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR08MB4544.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(39850400004)(396003)(366004)(451199018)(4326008)(5660300002)(8936002)(186003)(2616005)(6512007)(26005)(41300700001)(7416002)(1076003)(6506007)(36756003)(86362001)(4744005)(44832011)(2906002)(107886003)(66476007)(66556008)(8676002)(6486002)(38350700002)(66946007)(52116002)(316002)(54906003)(478600001)(38100700002)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a1q70DZWTi76/uG5KgxZahyw8hdEGhdeKCsHj2NBZsnwSf1MlFS6o1j2pzJZ?=
 =?us-ascii?Q?TnjBh69T50wXOXjELYHdOzYVkNb9u8D/jHWav1tJM5nWZ+53i6IslaWRA0cw?=
 =?us-ascii?Q?qJ1Q49uSIH+0AFLmW7Ocvduo6ccJPDy2e5JNZTk772PQ2V0Pl9JbOQppoeuy?=
 =?us-ascii?Q?n6HMHviWCpxZ2/M115bHn/PWFsDfiMQgNga+OT1fL7Ubb8850yqVGydi1sQN?=
 =?us-ascii?Q?4c9Xt1QCGUxExIPsxvQwXb87HAbMK8UFuKCZTbbtGhic/ait9n/GaWRJ6PYi?=
 =?us-ascii?Q?FJKduVeiBnbECSePssk2XhgHFHelw6zCmS9v4M0lY5m9r3msLvfrM7dmLQIB?=
 =?us-ascii?Q?b6+aITVyrW6wn18j82HF6WlhU4KfixmdwfWKxQRy5ad7IbMDLMXht6mW4nF0?=
 =?us-ascii?Q?3dd4fcUox1cEzmfkhOwqJ9zRPZsQsKypDEXc+HlEyL18mqnJP3yGEMTH+IZD?=
 =?us-ascii?Q?OD9a3DmUI5FeqYKbS7w8pubYg7fRQZ1B5m+XMSWO31G00rqHbr6FF911Wxjq?=
 =?us-ascii?Q?HhdWXDc986i42MkW58n8XzBrPCalyPibTkZ2r80licvVfu5YUBIscgNLMHQ4?=
 =?us-ascii?Q?pnHgAxvJ5PAI5IfNBWs2IgSZUV89OjGMAn6F7VRVOXun4vuRNmiixrGn8RPK?=
 =?us-ascii?Q?pFzuxyT3lzIv402mgoxgf6vcBPmOFC0YWn9p1z5JD/X9qgznfcmK5KjGrdaJ?=
 =?us-ascii?Q?CyVzW2LSGOACAkAScaDPb/urYrwpaIZfllqprHFDRqbLcrVQZfCpsPlYY6UZ?=
 =?us-ascii?Q?JNuoV4tLqD5R2pOZNPscWRAs1gyVApetvlw4PF1t/dr1oxFkiutIdVzCrCFq?=
 =?us-ascii?Q?s8JZgkW6M32elQqcwD2GZW3UxIlkocKt7mDilvUoW4u0leoxIYjdVqwYbxxE?=
 =?us-ascii?Q?y1XeSk683z/JKjGMNWqruyYiDRmI0YV5hU3dN1ujbrOhYxjUshhTR9RaOo0E?=
 =?us-ascii?Q?vhEPf/HLNfyKqi/UEiBIaIkvWpTa0Ah+pSK0euigO8KTT/ZH7LB2TsT/1vEB?=
 =?us-ascii?Q?iZ7V/yNy712O+cz9mDevoTfov6URGKxxDCHc3Qy6hAmEQ6qxdV86tiJmJPgY?=
 =?us-ascii?Q?bhFL4fg+rqvFzFS8l4gyjO2bvxbhfKzA7knb2cg6sWcFyl925eFD/B5TKQDE?=
 =?us-ascii?Q?q9+Kw2hWhKTt9FGfbbSuU2JfOUtPt2C34aMzOQly9CxFULPgp8mnz5XpGmAA?=
 =?us-ascii?Q?YYmWgsbKsFnYwkaldjhy2AlUzB3Fr7aexZVPM+gb0zAGsM8FMl1s1Ol5SDmk?=
 =?us-ascii?Q?tbQaQjthfEJtDhLWxr4F5OxeOJzq3HRwjNVgjShpVFtSj637VmFl7D188t47?=
 =?us-ascii?Q?HqrYtVegH3pmPxQulhnt4E3FWIvpHk1z6dgRziz3DsjTPlhxkKQTl5qkA59J?=
 =?us-ascii?Q?EcwreOhn4dZr90E1pUggBye+W/kRtTlOp2W1Jhjqrs4RF19ctk/TP2V2kIeF?=
 =?us-ascii?Q?O0aWtyf/v3+HXTLTXsQWx3djapyhCQWln8X+ze3+XwZfc5rFf729jWcJphYK?=
 =?us-ascii?Q?sMRdpFvFHlAufOXSmAL/sHm7I19m994N+fy/+dqEUfjPTMT+tDamfBGbUTem?=
 =?us-ascii?Q?+18W+FfrDoaIT7TZvQwFTF21g45hkMJs35o1Q9vw7rqotCyP4JRMvu/M3eTK?=
 =?us-ascii?Q?JLd7pgfRdtvNDyEjGUY4snM=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bbdc6cc-a07a-46db-2f4d-08db24833bcd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB4544.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 11:57:06.7081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2lzKRgrZXb/fJFQaT6NyfAvr5QThJJ5g+7xcfLYUW1SVTogl4zDgvrVayZ8FSCvSnZG95siLHCJcZ0T3U8HEC54z8qXqOhh1hfSV4+rEXI=
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

Adds h/v sync polarity, which is hardcoded in display prepare, to
drm_display_mode.

Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 5d4542c12f44..24636722c2ff 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -167,6 +167,7 @@ static const struct drm_display_mode default_mode = {
 	.vsync_start = 320 + 8,
 	.vsync_end = 320 + 8 + 4,
 	.vtotal = 320 + 8 + 4 + 4,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
 };
 
 static int st7789v_get_modes(struct drm_panel *panel,
-- 
2.37.2

