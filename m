Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D3548629C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 11:03:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F26E410F039;
	Thu,  6 Jan 2022 10:03:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2137.outbound.protection.outlook.com [40.107.223.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E972D10F039
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 10:03:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P7oAhLBfzq24k0neSCKNu5rQ1duISKAaHppLcQUKYE4xfU9p6R/8p8SnOS6qmlk2T7uOg2n7XhODDDWweNJpynSFdQBg27tPE314n8fA9eUtALy3lKMhs+FabB2x7euWSwXj1rNWsYdxb6wCRqUS9KEhW5Wvg2acCRRoReeoc40WG0FbOAGqb5Nwk72A13X+8J8bqhZtXRzzNdFiW1Yp9bu1ojWOG9mN9TFbnuQVilywptOF98GXrF+G76JA58Nfuh7EByzEBtMRHwpMdFhvoM8kLNHDEm4aDCOuaZuHQxkVRcGqf0EaUmiR24pAd93RCrE7BbGOm0osOePkgnpk8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gAVLymIL1MOYd0sTSZsnWdojtld8XnFrUHbXsttEFEQ=;
 b=LYeEBAKYF43kCd2PBhuCR7qSRtnzOmhIIt65MvbD9FMqI2rAXf6VMeT1HS+PgsS0mSbUTfMqTD1xnScPDA5Q0SQaS4v1MCIy1hTwp0nOMZFxQM4pxO6yqrbjMomEYsyborc4gDJg9KZIZ+Wgk4UYuwlo7sEO8adg9vkCNipZ1k1KPT7s7BzWezqO0+UzmMiCRs8oYWuU3MJbgzoaVQg+HHFY5eOm2pB33Urcr0gmvUQ46C8U+hlpp2vK3WCMnOGaMMkOiz1rzwWTW6GWZHgWjvzJR0t4KZvOeokU+zU3O2FJhiBgIOC5DN10ktheDpmmMZDh6I7YF1yciXtr4Le71Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAVLymIL1MOYd0sTSZsnWdojtld8XnFrUHbXsttEFEQ=;
 b=LeDPkmwD7msHTrQjAfj3H/z7QqeogcNp8CnCumcoOdqo72LDIa996aytYZl8WFPldofJzQJlfGC0iWD+15cqwuUq3QEnQCwBWb3akvxlLzDTQvptqGxz/gjhtDKMT+5owR1jzOP/z26HDo35TCipLQwjPdOX7iLspl0Vfh0VvEY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from CH2PR04MB6741.namprd04.prod.outlook.com (2603:10b6:610:96::19)
 by CH2PR04MB6823.namprd04.prod.outlook.com (2603:10b6:610:90::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.7; Thu, 6 Jan
 2022 10:03:05 +0000
Received: from CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::c4d8:2407:431:aed1]) by CH2PR04MB6741.namprd04.prod.outlook.com
 ([fe80::c4d8:2407:431:aed1%6]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 10:03:05 +0000
From: Xin Ji <xji@analogixsemi.com>
To: andrzej.hajda@intel.com, Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 3/3] drm/bridge: anx7625: add audio codec .get_eld support
Date: Thu,  6 Jan 2022 18:01:26 +0800
Message-Id: <20220106100127.1862702-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220106100127.1862702-1-xji@analogixsemi.com>
References: <20220106100127.1862702-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0302CA0011.apcprd03.prod.outlook.com
 (2603:1096:202::21) To CH2PR04MB6741.namprd04.prod.outlook.com
 (2603:10b6:610:96::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5538948-a970-43bd-116d-08d9d0fbbbb1
X-MS-TrafficTypeDiagnostic: CH2PR04MB6823:EE_
X-Microsoft-Antispam-PRVS: <CH2PR04MB68239CBC04DC84246A06752CC74C9@CH2PR04MB6823.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tK+zOri4cxGVSRktuU/LUkkhlpjX8wCAh8bvU6O7d9eRIAYT78nRYJIxSns1tYQIw66nCLqFnA3nOxVY1d8bn32l9EoBv4pw9E5d8JzpGbXCUURPSK79OlJNn/qVpVtidVETLl2vItOzy+JAPwEnrTvKx4XNRNGJvplOLKnnZhRAr4XE6fQYRxtSOTmMLYfJe7kDv9uuxOdj+O5ZaWCq/phvvhhIaSBAxH9tIU4idfGqrmkR8yFsteCa0XMEXuQPWoXWwOGvlOvpxC6KxoYtHGuOhjRQtoi/EWbjOS5pttBHJKzxvC3kDftYJSIcEExlpS2fCuaV4gAxkO4bQtajC+7rRZJih6cDjxrRmlFw3oR10qiEHTGBg8E/+IWDj61A0lOy9hboxg7OuS62REBDjIO87fX9RF25X31kvMVJfE0sX7y7d1z0eWstcuTkJbMHkNe0wYIDZXpCSUKLMbd1fFS12p6DZKHbb5lbKfdMps4412t7CtfruZOr4mJIpsvAZoggl4eVMuCvK7uKtOSgMxAtHe/6FWyEVFqMrfb2qBck0CfByqCFodZg/ok4EwiUl3LqQhKFkVi6CSv8JazqZ0DX4ur2a3V0poh/O0BSVQxW8kSikUYUSwYL7OGm5lOi+LI78ZOrYUH+EKQQoxWLyItxuRnPALXHd1RSQlXv+wgmv72w37JWDnxeaOjxT5phk9JrtEjffwZGo2ADd6i3YuMMt2FSRHmC82wQj81Gzf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR04MB6741.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(4326008)(110136005)(316002)(52116002)(508600001)(2616005)(38100700002)(8676002)(6666004)(8936002)(1076003)(6512007)(66946007)(55236004)(36756003)(66476007)(26005)(7416002)(66556008)(38350700002)(186003)(86362001)(5660300002)(2906002)(6506007)(6486002)(142923001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0uoBhvMYT1sVdSIwancqVEsT6pKeWqyDuvoCkAMfhDYAjkt2FUJ2lKg6PAYE?=
 =?us-ascii?Q?hE1bUgAeBv3F6HppPTNl3EuE/MLBHgww+pBBDww/69vA2XZ6Ch13IcJgLbJc?=
 =?us-ascii?Q?wJFRANn49HaGZg4IH3vmxy5TNxibu4faD511wuJny5rLWOFuRBS/i3VbUPr4?=
 =?us-ascii?Q?MjnbZGP0KK8lQmy8QvDuTN8BdEsA5s9I4RsvZg+3Bzl/vWig+BO/VjgyOIw+?=
 =?us-ascii?Q?+5ZJ/d2p2a9B+3xAnFFqOayK22LIuIB45PyY5Un23FoNRZ+WV/F+mA7ZoHYx?=
 =?us-ascii?Q?9b+iG06tPgafwHIF9GSKx396g03lC6fZyz63hFblNQXMP5aA7oA57IIJljKR?=
 =?us-ascii?Q?5LHBjfp6RbDnvC+IvzozELhvO0RNcp8FfVaMPEz9vFKL4NqM+jmbhwIiEzA6?=
 =?us-ascii?Q?qPoyCaXwCyQoy+OLFS3UEXmfCMT5/3/v1vtbHILG1RcQJ1Qukv2vvDskhWm+?=
 =?us-ascii?Q?/41BwpDaVXeza2g8w7rdt3ICAEQgMx/Nfkp27nilrSZTkOHJ1wwOOddgCkvN?=
 =?us-ascii?Q?SKCIQL6R6zqYMZ+X5TFSo1wEOqiRSVP71ZmbFyH91kMM5S+eYZjqfeZC6m+9?=
 =?us-ascii?Q?xoJq0c9CTymlef8/yOVSbhweXAMwLEUTfllQ/TNfXX5TbCDwQXNsr2PIzDKr?=
 =?us-ascii?Q?xUEyY4MHvdxRthExiBrAbdf+eKV1eDRX41UtXhoj69PnflzFmAWu1OBWsuut?=
 =?us-ascii?Q?x35BBOWrgsZCbaOrhSB1NJuykPVvye7TBBIi7OhDvYayl38OORVoejzhnubK?=
 =?us-ascii?Q?nScUgGKZqPyG3IrPaDnPBqyAbPROORP/uTGjI0YpJ+6N6aD4H86ZF3/9Bi1b?=
 =?us-ascii?Q?9AFJDX0CcLQ6SFHG+5B+/60rj0uLSn9yX4abaPNMTrsOjQTzjvx/HE+9uUmC?=
 =?us-ascii?Q?28QF+0A7g0G7eSIjTZxcgSQPSrC0JLgYLHuxHe2Wf95Unp6bmUVGT3VkbG/4?=
 =?us-ascii?Q?U0B4zHHHxj+T8BqUBEGakLNA9K5/acQhtYHb3hr9LIbthekOcfnLHozYoFbN?=
 =?us-ascii?Q?KWCv3qWFULOcjxto3/ixDocRsFECJKxNjyolqM4kcbck9VcxvtRenT6LF/pr?=
 =?us-ascii?Q?AI90j7y8c85HW3l3NUHCRCTlkzWBqCL2UE328StJ3NdlI9Zt8t9edM/S4RrY?=
 =?us-ascii?Q?we0Hjjczxm8eDDhGwhKnEhnSz85fcpt41F81AOI8RL5Hzf+7ov4PZpAlwo97?=
 =?us-ascii?Q?WDLx2w2Fl43E46oXkX1yqcqT2jXzOJvYoOjqcS928ELJGZzAy0ZyCkt+MJ6H?=
 =?us-ascii?Q?UCxOOF9TpVRPCzcmKt4odTEH83JXsq3rx3Jcoh9ZzKfCvGVW9bBhVYUHJkUU?=
 =?us-ascii?Q?7eGFPNBsfIfcBpKalRd9zaQmNWQMSYFlPI4T8MfwD8zAi0uq6O29JCNcnZf7?=
 =?us-ascii?Q?nMfT9KQgy3SH1isY1T2+/oLSf76IFzXIQP/+jN6D2JskbgxNHeJZLrQHAqEv?=
 =?us-ascii?Q?VjWsBE6hWvUb3+VzbK34xc1qMC8opMe7GAeYrz+2tH+Sx8b6Q2jcrdMOkElb?=
 =?us-ascii?Q?FCVrYIqFdE6SNuhI7n88W1isJ8VUa2VqzBGmS9PCm7t+SKNUcOnipm47wFVI?=
 =?us-ascii?Q?DMu6Xp9Dx+QNi1bRZy1mC3P6yrj8BtdnTTIndSV8pNVxd/dMWDdKpR+XsnOm?=
 =?us-ascii?Q?Y/Z0ljX8om0CtDflCCeaJgE=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5538948-a970-43bd-116d-08d9d0fbbbb1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR04MB6741.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 10:03:05.6916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GivgqIWTQZO8PKbYhS6jCSEphB3Y7bv4cJOdMYLgy/WaHWntrehrWUud4ZJD4jte7u5S0YwdT0Lr911nFXs73Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR04MB6823
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provide .get_eld interface in hdmi_codec_ops for hdmi-codec driver.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 001460f62b0c..33383f83255d 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1840,9 +1840,27 @@ static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
 	return 0;
 }
 
+static int anx7625_audio_get_eld(struct device *dev, void *data,
+				 u8 *buf, size_t len)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+
+	if (!ctx->connector) {
+		dev_err(dev, "connector not initial\n");
+		return -EINVAL;
+	}
+
+	dev_dbg(dev, "audio copy eld\n");
+	memcpy(buf, ctx->connector->eld,
+	       min(sizeof(ctx->connector->eld), len));
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops anx7625_codec_ops = {
 	.hw_params	= anx7625_audio_hw_params,
 	.audio_shutdown = anx7625_audio_shutdown,
+	.get_eld	= anx7625_audio_get_eld,
 	.get_dai_id	= anx7625_hdmi_i2s_get_dai_id,
 	.hook_plugged_cb = anx7625_audio_hook_plugged_cb,
 };
-- 
2.25.1

