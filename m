Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D64A38E33
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 22:39:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C192810E293;
	Mon, 17 Feb 2025 21:39:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=inmusicbrands.com header.i=@inmusicbrands.com header.b="Y8gWhHAi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2127.outbound.protection.outlook.com [40.107.92.127])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B708510E439
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 12:04:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ttcvey9Z20jYfoUGFQ678A0sED3Mg+kk4aG2hoGiINrFbDE8x9O6umIc+h1f+JaJ0afDeaFx32Eatlke3xg/uep3AoQLsgMa/KxESmQJxfmlg9bXTnNq36pd+59zopDeDNBur6GLCmGG49DncsYPtEpGy3q18oT8QbhPaWPA+tRNx6MrAqUhmHLD7mhjvy9vdJQ0gpm5kvG2YO9S9wKSwRap2xvA6wU6rm1iPy8hYZOMHOk6Zb8MWbibocy6NPeaUh/xaw64+GMh4NumLbShlOw5x/8PCPAogqGgu9XVyR3GgTDfemlRzBtIVrcUq9rn6+cjcYGTc2E9CjVS57v7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F7nk7V0szb9xOTaw+A3hIWr1N107vhwbWKKCohKH4fY=;
 b=TTL80Z/gCfugQk/+z3Tj91YVYLFtIVrx2gPbB39rMznFPR8/p6ta01jvb3RfUwsrqazwzgBOX8V5ydn5MpoGyfr7KkLuCJMH6flmN6TOH0HSKlXUuu4t0jayAND6yhUcDhyYQi2V0jnxtJoB3Nulv1aMFbmR+RyFcuyQErXqAux0H930cF6nes/IMoxXnC4WO+P10QNv2dSrdgkiRH6Jd4jEcNX5iwuYaSid6pLgN+9/oJTlZSkCh/Xq3XYJpT8JUD1qiSXh5f5egd57WPmC52Xexji0NyIBbdp3nFdUvBb3GdLYryUHAH5YIIX900Q29KN0dPyr2MUPaIExbGTREQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=inmusicbrands.com; dmarc=pass action=none
 header.from=inmusicbrands.com; dkim=pass header.d=inmusicbrands.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inmusicbrands.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F7nk7V0szb9xOTaw+A3hIWr1N107vhwbWKKCohKH4fY=;
 b=Y8gWhHAiuaZzQJmk0kbEKKfQXTyv6M1qYAezgj0sIIQPJEuJoYwS/Ye7FjHogIfRBAXfKzvozgwxVolpHPNnzmDtFgh88GzFXv2CDwtdEUY1xxYWUhvpQev4oJ/6HHVuEoIqfeUwzd3SIlfm+7weiKlnqInewDiJvTNjIlzR60A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=inmusicbrands.com;
Received: from MW4PR08MB8282.namprd08.prod.outlook.com (2603:10b6:303:1bd::18)
 by PH0PR08MB7178.namprd08.prod.outlook.com (2603:10b6:510:78::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 12:04:41 +0000
Received: from MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401]) by MW4PR08MB8282.namprd08.prod.outlook.com
 ([fe80::55b3:31f1:11c0:4401%6]) with mapi id 15.20.8445.013; Mon, 17 Feb 2025
 12:04:40 +0000
From: John Keeping <jkeeping@inmusicbrands.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: John Keeping <jkeeping@inmusicbrands.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Linus Walleij <linus.walleij@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/panel: ilitek-ili9882t: fix GPIO name in error message
Date: Mon, 17 Feb 2025 12:04:28 +0000
Message-ID: <20250217120428.3779197-1-jkeeping@inmusicbrands.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0179.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::22) To MW4PR08MB8282.namprd08.prod.outlook.com
 (2603:10b6:303:1bd::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR08MB8282:EE_|PH0PR08MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c89abf9-18a0-411e-c7d0-08dd4f4b41fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|7416014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0SK/h07KkT2sDzJlaVVfdH1eNA8zrXTo5FJ8t2y+9t8RI6Moz6Hc79tzJ+7H?=
 =?us-ascii?Q?KtSpehTy7EiTLjwBomT2BBmpqtZbom8VNRWhEl0xfCHcDabQW893eiZRBMCt?=
 =?us-ascii?Q?yAtVdvlx2z9vfqWwb0t9pqIz1nfW9iFS8WPHPAS22cZRFDmiLzy4RWfMG8tE?=
 =?us-ascii?Q?jSvz3TAW/63NxqRYfMEPJ3BVedaivkYsJxvHv5g+8Ce36g+Kc1JMCqB25Qf1?=
 =?us-ascii?Q?7Jxf1WfLPphDGvgfbeNHLcn+k0S/RcaxY1wlJIh14sYide6F+quDDojJFTgr?=
 =?us-ascii?Q?NmY7N/r63432o1AWTBDC5prn457iP3QfWznjZCIdLsREP0hk+1KyU0viGzm+?=
 =?us-ascii?Q?F5f58RkjWsevHIHHwupk8BVEieGgy1uYEXokGoJ9yW+7uoH85nF4EJx23/UP?=
 =?us-ascii?Q?7clLdANoCCQB2LR5q2ry6wi4cGQxZhLuyDQ79yFzkV5+V1d8WCIIHPsMkRSp?=
 =?us-ascii?Q?7n2LjHycJVJ0PlwCI1nllR7xl+9Ap/BVXyBxUZGzwBoW53k0ONvOWFi4hkmn?=
 =?us-ascii?Q?vXzp5hoAQiq+vZRrWh/gCMSRV1ak6s1JZLTz+U9ZXXsBaeojkCX8Fq6soW4O?=
 =?us-ascii?Q?IpnkqFKn7c6dbs/3tW3qosOz8wN3wLOkCJGKYrlsxm91fGnLQvSKRuRaysha?=
 =?us-ascii?Q?Q1P8TNwjzEAuyhiFEcMapXdyM4J8JFHxxCavh13RKPFz/zFxw6vXc/VfVJ+s?=
 =?us-ascii?Q?h4Uf5kBZr/zD/4/vQDZsfoKg3/t9kRD4HEoQAGDiszfyXyAhYjGpUx0n/OoN?=
 =?us-ascii?Q?0LiyPXAVOcwJ1NPh0Cr2glIl6l+PnGl534ObnTR9pi7V3kk+qhj7CcZJX5qq?=
 =?us-ascii?Q?C1gUn9PjoQPCJqYCVO+3x8/q8gINf4PA2zmpYJxLPK6IKxtKkmNDsrIKb/Aj?=
 =?us-ascii?Q?ZB1PHI3K6xkNBhBGXWex3yrgompOclCtP/xdS8J/z/o6EPQ8fPgIz1mA9LDh?=
 =?us-ascii?Q?7yKvhi0w673y9MMficvR9CTFLb9oxErHUx5utWMmjOJ3tnCOldH3RYRYmAHN?=
 =?us-ascii?Q?rAl30EeIBQlUe7G1RsxHhvO+2IFWGqiqVv0/jGcVsITOG4ncm9U7DvPoebsl?=
 =?us-ascii?Q?XVpOa6rASDkZXem/0uBXjsf1/GWpfEqkgv8VRPzsayj3Sa3kGe/9GppM45xp?=
 =?us-ascii?Q?f6mBO4endO/i5OTpeGutg7a2kRpkb9r0vx1dcDcKD2QMhL6f0GVhXsPza2Xl?=
 =?us-ascii?Q?VFyi1JqctVQlWlwVASpL/gHQbFXNRChk9nlzdh8jgQPt019JH4Jt5mvqDp1n?=
 =?us-ascii?Q?rrutN8FfO0h+GnWMvkG8DdCT/R9oqW6n4O9ThjG+RQBmE79FUD8VF2gUbgBl?=
 =?us-ascii?Q?KMR6payy+n1k31WYKEeE4NG2i4krBFsq/PXCSSs6+eWnOCXxSM188J5noIiC?=
 =?us-ascii?Q?t8D+tsmlu2uffPquK9Pd+ltuJtxsNAB8gcWimMA780vXrDGXR8kWyURQ0Wtg?=
 =?us-ascii?Q?vovkVL3BSaCmUNoCq21limsIcTzoak2R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR08MB8282.namprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(7416014)(376014)(366016)(38350700014);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2+E6c4cf1P09gQtyarbZ9gaXgwKtocuYUOvjG3esGUNTkvUh+KXgvxjRAoxp?=
 =?us-ascii?Q?X3aAUTPcGEh1a/7vFVxqhUcwjXmHjzly14sL3N31c4xpxnSv+hh3rFwPzeCr?=
 =?us-ascii?Q?eCZTMi+r9ALTL0rCXcFzRshM586NIlspRzQkS/GqMd2mjgKPNpOZWECoaK2B?=
 =?us-ascii?Q?GKik5WEJmAqwCNdV1RPTolVdP4h1tVhi69Vdy0n5E16/2hyJEtDyxdTfASLp?=
 =?us-ascii?Q?BadqgLA+UlO8huM760Zci9VMiJNR90Z8w88VZ63xPya94slOwE6H5M3Dx9Tq?=
 =?us-ascii?Q?CSrdKnh6eg5Q0xQ2K6YwmOFIiO2ZRa32243NrDpFmFON/7SaA94OYDB5XUG0?=
 =?us-ascii?Q?U3vAx+4lobTJV8Fez69HIQoGR+mEyQHQtQPUmPRQbc7uKg8pV5Iy/61n2dDh?=
 =?us-ascii?Q?+gwlqc0X4BNwQvptntTbg8rJxfuPcWqjOgv1gGpazXx0iUF/U7GTzeUhpfuo?=
 =?us-ascii?Q?PYmMO5xJPmMN2Bij+32g3HP3eluagV3l/wmWIbDh+uXpAFkvt2GVzJkjx1vm?=
 =?us-ascii?Q?lnbXac+R2oFJiLy4TjrA/GdOU441inw6GLpXzJJDcVs8/vqTVfaMffn6pdyy?=
 =?us-ascii?Q?A2uazgfZ4NwKZ9w0d8Tx8YTnOS/jPOlCFOYrreP4BsHwYSDOfOBC7Tiob2Nh?=
 =?us-ascii?Q?XsrFez4uN4DqG7x3l23PzV6FrmPbRofwAGNWpvtcXMcqNVZUGStEKYxT5Xa7?=
 =?us-ascii?Q?8nAGRMtVshRQOhYC/qsB4eHUaERMdo7f3ZH//144bS5tq0IPYLZLMd+rgk1I?=
 =?us-ascii?Q?7uyx2KMv23Qp996JaJdlDnIFlTD9dGBavVyYWbs4cXoxVuhuR/kEcZ/hLens?=
 =?us-ascii?Q?2pbUDJdJDbYoXliw8mY272610IndcfgJQLdt9ya2IXp+PVe82H9u2C+2Go91?=
 =?us-ascii?Q?fw98LaddJFEbgYbhy5QBXtOx30dH/tiywAEiTt99vMwLXaW8Ni6E/c/Vk6so?=
 =?us-ascii?Q?yh4fm74/OE0jQfxuSHY1CiMRZBkCtbVUhui8/YEtQBuTO/dtzRXInEtxuPI5?=
 =?us-ascii?Q?4i17DacJWJo7Mgn3R6l50Jmwrg6KruyCTqCEDOhTnEZ+VfotY/FZo8qafLTW?=
 =?us-ascii?Q?YIr0gZTngqCkiSqHriLtp5tzjWRDAuTK56kFkcxEQz0IIMnYoqL8TQzOybx8?=
 =?us-ascii?Q?b2qENrluJjmCX5jI0QWgItsK2qbE7vZc1+TRBQ9aDXU44Gz1MzTj+WIzvyu6?=
 =?us-ascii?Q?hUKmltbqCX7XtxC1rEWeaSVB0f91vnfHMgKR5xfE9wxLysmWANyLQ2g/xI6Q?=
 =?us-ascii?Q?hrum8kQSjyCSoauymn1gGzR8i/KGj8nb1u0Jcin6U0sdnpMMehDfdIZOwQbA?=
 =?us-ascii?Q?wpJjWVGWJ7skK6S4Jx6odWVexEpYLA4V6RkuCA9ruM4bHb9D1ZUmhxQ5v/GW?=
 =?us-ascii?Q?/cfIIEi2LwU3Ig042hQGBE1xf8rscMgu6oVod98QJ6oxK4+NwHVbT9mCz9k3?=
 =?us-ascii?Q?lgNOj7EmaIlOApe9+wCj+cagx0E1RJDI0PUO2MWElowy4XAFYQx4vMy3fTNX?=
 =?us-ascii?Q?ICNLdnPlUWZmbOxeIg0Vtaa3WyT3/pxeqVSdVA/RnImSLpbBZTl8DEBufoKE?=
 =?us-ascii?Q?01bpxa84E9639Y6oo/q3MxWeTAtI58THFnXVGoYPIdMQJfcu3r+l4SeLubbx?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: inmusicbrands.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c89abf9-18a0-411e-c7d0-08dd4f4b41fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR08MB8282.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 12:04:40.7826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 24507e43-fb7c-4b60-ab03-f78fafaf0a65
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qC+H/AFAzyhUFonppfWxGWSNdkQdsGzfUHxUOc5h1Bef3c9mfoxbO2+fl8Tl1pJIIk46HoKR6Ox6lUupw1K6vrILLxkFXTsDUzKJxr8CT44=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR08MB7178
X-Mailman-Approved-At: Mon, 17 Feb 2025 21:39:50 +0000
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This driver uses the enable-gpios property and it is confusing that the
error message refers to reset-gpios.  Use the correct name when the
enable GPIO is not found.

Fixes: e2450d32e5fb5 ("drm/panel: ili9882t: Break out as separate driver")
Signed-off-by: John Keeping <jkeeping@inmusicbrands.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9882t.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
index 266a087fe14c1..3c24a63b6be8c 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9882t.c
@@ -607,7 +607,7 @@ static int ili9882t_add(struct ili9882t *ili)
 
 	ili->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(ili->enable_gpio)) {
-		dev_err(dev, "cannot get reset-gpios %ld\n",
+		dev_err(dev, "cannot get enable-gpios %ld\n",
 			PTR_ERR(ili->enable_gpio));
 		return PTR_ERR(ili->enable_gpio);
 	}
-- 
2.48.1

