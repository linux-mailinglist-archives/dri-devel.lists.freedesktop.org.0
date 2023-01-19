Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2DA674266
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1749B10E240;
	Thu, 19 Jan 2023 19:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2065.outbound.protection.outlook.com [40.107.21.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6C0110E009;
 Thu, 19 Jan 2023 19:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=grKoOlF19mtEp/o02zhk8yU/KvR9K/u0XYmC367Tx09zVMcVL4YmL5AI8Wx2C7u6bfbIauC9yoDM0bjU3JzQCpdJub5VXit11uSpHxdtB4jMxJfUJBTbnCx9zxBqN1vD4jLaaoDs8MvA5Ex7y8LPBzxK61zsi1v5eu4wx5X49EdFfaqyF1K78WLwRXdnjqm+OPsrXq/OM7Z+xX+OyfDl3uNNnDIWln62ull9PKgGFXijWW9P6LVPf8Yv8Z3qUT7gy2TuVP7uqlxlJujBtwDU02/vZMqWnD0eU/AEP2G9BoeUZs2ZhzuwikX4zvTCmkn+Z3PT4FQfr2SZ3G7nd72x8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ctN7bLC4xagWRYS2vTOilm/APysMKl5QPDsaPZTszWM=;
 b=A/OZadjzS4g89v81BlEv8ZYuKtkOpx7NDSBNiYz+kUK8I3QbDU5W8oJWjXhaSYjCdwyzKGZJwFuoZc0EEFs/TTGE3RCtvPGe00KYkMmPvutT+ISFKNe9+uWJisOlYgpJtVSIfEDUwUTNB5xIj72nhDVOOOnUYfvkOtRwrr7cHvyQ2KNFKtQ4/lXLACdk2glehwo0htB92fRxcR7pxALoGAYR/4UydusjVU87QX5jEyFp3GoJE0mHqkvl1RyUoR5fd7sz2HSN5DTwjMjkQBDAotJuR/IdwBe36Xw1PtW1a+1HkaQ9HasxcVdaCR/pjcN1WMtTVRYtpFQpbrFMa0w2yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ctN7bLC4xagWRYS2vTOilm/APysMKl5QPDsaPZTszWM=;
 b=EEi9Wt2IlUqIRJpfz2XhAcrPTp22WbEXVBGH9d0Mvr2rU/LEAyL2CRTfDqAc7wCaIJbyrnkbK8pnRNlc//5+Ey4ebV7HzaKvzUqvos6b+OH/GcmOCTV0XibcY3OrW2bM8PpxFBHRyGWoMC1CdhWGD3iz7yqWcEW7scKeyGce4d8uXRnYewCUW5vAZkGfYCoE4OLx1NUCoJmJ03q48mcVWkcqHZIx2OB5H2bdwRiSuzbVPQ3QL2JKlxqxXb9bNKXG8eo64DxQfRefIbhI5z2rQJPvsYOxtQgLzdgyzWcjYiV9H5jgdtvH2b+OUMnvkVyTFy4LGJH8KOmd6uzEU+YJsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8259.eurprd03.prod.outlook.com (2603:10a6:10:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 19 Jan
 2023 19:11:55 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 19:11:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/3] drm: Convert users of drm_of_component_match_add to
 component_match_add_of
Date: Thu, 19 Jan 2023 14:10:39 -0500
Message-Id: <20230119191040.1637739-4-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230119191040.1637739-1-sean.anderson@seco.com>
References: <20230119191040.1637739-1-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DB9PR03MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 742080c8-7378-49df-6427-08dafa51075f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bHq/qaslLXCVpYGH+DMSkiInrCD2vZlz8oEqitzu5PMuq7EqMz5vDhXHqLjnp7nfoZruP7v5QWD4twrlNfkLwViyIyM52LQ6JigmU0m7ltWyZJsfDNZAJRJGZxUYXW2C9EAga2F2OlPhqjkYjJSLWk8XsRzSMzbF0wKCfQw5IHtKACHsv6A5kDidMmMHNJBfjxAhSfLDJ7xaYi2mjoruMEArCtjYIID5ZVvpgBJPhvBcBfetSg7pGHoE4APyvx+yL9ziUytGgt5+5KX2nED6XEWmTNYCbwULA+sIYaNKXo5trta+DKk6MlCD5OWvIcykV5El41DFBDsjcyR+VmSbdHaVeNoTTZtPtbEfu+bHzqfCIMwwTuegC4wxxi83nwGvV9J7+mCX0pcUiuOOW577YHoLBmdFt2qW1iOj60X+tzfhuDrWCvEqxG+1jNd7PNWJpymk1GjK5FxaaQPcZd6wvy6L8ReQ0ASAPTsTs8ubfPkD+MyPHbBA/MP1fEeJJddHLpV2KSI3chKacF89Sj+vm5W4crNYM7zSgVGFI7ItgvFv5N/zUSMLKBVa3PctzurA8c+1O96jwzxB6ArBoh5Mk7nHN5F6AQLByMasaD56GeK7HVesM9DXWiBTi3Y1RJSj+P2zKQraZHGlRB2VuNidiG0jBT3av2vmVGv4Dja3hx9E2juVbCupW1OFa4Ba2MO2tqVxdnkUvX5MGuDbO96Siw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199015)(66556008)(44832011)(5660300002)(8936002)(7416002)(7406005)(54906003)(41300700001)(2906002)(316002)(66946007)(4326008)(110136005)(8676002)(66476007)(478600001)(38350700002)(6486002)(52116002)(38100700002)(26005)(6512007)(6506007)(36756003)(6666004)(186003)(1076003)(30864003)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVN1dVdZZVdIQi83Nk9OVkI3em8yU3l2RjNJQ3NNYnFzS25ZTkY3UHZYMDdU?=
 =?utf-8?B?WkZFbmhwR0Q2aHRTeGhocjYrUjdvWUFlUncvOWIwdVVsWkpjZVNiR0lvaU0r?=
 =?utf-8?B?VGF3dzNQL2hkQWVnd1g5QTVLdWF4enU0TDRscnVQanYzZnp0MSszVGdpSGFQ?=
 =?utf-8?B?VUF5Unlyb1VLZ0o4RGowVEEzZlgvQWhyRXE3Unp0Y2I4Mnk2SU0vMzdlSWp6?=
 =?utf-8?B?UmdBYThmRDNzMjVRZXZtM2piZmpDNjkrL2IrQklpNXFoM2VXYU53OUdTM2dT?=
 =?utf-8?B?VDVrNmlMUDFRcUUyOWxuazJRaWdJOWt4NmRlM1NhbGdMVzBkckNITHhFcFJM?=
 =?utf-8?B?UU40WkRCZktnOHNCbUxvNDNkM2psRmVvNkFTbDRaN0tjcElEYWpNRVVYcWx2?=
 =?utf-8?B?N0lhYU5rTTJLc2VOdUFzQ2NEOHdZNmxlZ3hFdHBzRFpNSnpjamFST1R2eUVI?=
 =?utf-8?B?K3F4LzRwNkQyZG5QZi9qZ0ZUeDhqcUhjTTJxN09NbjVoRWoxQW9qWWgwNE5P?=
 =?utf-8?B?eFQ3V2xzeTdobjB5dHlrNVhEOXVmamx3TjNyTVJ4OW54OXJ5ZEVma2FxalV6?=
 =?utf-8?B?WFlzMDhqSWJnYTIwN0Yra0dIWUs3Z09zUU8vK2ZjTzBFVWFlL2MzR3o2T241?=
 =?utf-8?B?SEt4ZlVucVBhbjZ4eXhDRlVlSmRHZEZ6ZTJsTVA5bm9IUDJ3V2JOUVlVa3Zs?=
 =?utf-8?B?ZEo0RWJKZk9ZNVJuUTR0L2hSUW11Y2lYU3NYc3EvNHNvWEpTTEl5N0RyaXZv?=
 =?utf-8?B?ZTdsclFZY014SnczeTJmQkF0QUkrd1I0SENETmJNWDdwbHA3SW5iaVJnL2lt?=
 =?utf-8?B?V3F3VkpZL2RRQkxaaGZpZ0Nzd3laVVZOYUU4eGJQOFZKQ0lhbXJqNWZJNkNq?=
 =?utf-8?B?ckh1VkY1MDVoZmpGeXhsYVpybXRYYytRSTJYWXZVSW5GV05wRks3WUtRYmc5?=
 =?utf-8?B?MFBSb2pjR2lLakdUenN5UkNDWnZZSVlNa1ZkRk9sdG1RcnBnM1NpMUNkdzA1?=
 =?utf-8?B?eFF2RDJwS1A0Y0M5ZytDNzdrOS9iVlVOYWNsUGgvVVNXeUJOU1p6YWxqRWFI?=
 =?utf-8?B?RnJBeU1XMVlwQWVmMjFUdGVoeldDN3pEMlArZjF0cy9hZkNtcElweHhoQ1lK?=
 =?utf-8?B?T3BDOFRtRUtHbWlOWnRESkowU1VVeXBvR1o0T1dGU3hNTXo4eHhET0U2WDZv?=
 =?utf-8?B?R2pvSVJsUGcwOVpUVklSbG5FYWtxQlR1RVBMWHRVVy82aUF1ZnprcDZFdUM5?=
 =?utf-8?B?SE8yaVg3VzhyZDF0cjRxWDNMSi9RVkw2OFB4RzJraXBEOHlKY0ZkM1B2K3dZ?=
 =?utf-8?B?WnpkTVQ0bmViczJ1aEZ0bk5XVjU2dEFieUVXWUZVc1k1R3YyNm4rcWNLWkpO?=
 =?utf-8?B?WHFwaStKRml2WnAzREthTkViV2Q2NWxacUREQjVyT1l2WDljVURhRm9wN25D?=
 =?utf-8?B?RVlBZjFpTysweDJWbGlkRTVxOGFVRVpJeVlQQUtQc3dtN2tVTUUwSGlHSUd6?=
 =?utf-8?B?T0RLc3lKNzJqQ0JNS2s1ckdRL0ZFdnFhMVhZUFNiOFEzSDYwTUIrMjZBK0Q3?=
 =?utf-8?B?RUJLUDhlVmw2L0Z4RWN6N0hIdVphNkNIVldNMlNhMTEwSlZZenpZTHpvaXps?=
 =?utf-8?B?bzZ5b3FLMVhVcHhQWWlRU2VIcWdpUDBFWndSVHhpNnhNU0ZlQjhxNUtKbGpF?=
 =?utf-8?B?WGFuMkRtRG9SK05WYUVTM3ZaZDg3eXNaaTZUbXBzZEVmQlVpUE9DQ0pvNmhk?=
 =?utf-8?B?SXBHVm5qcEJ0Nlh0eWVnWGhoVzI4OGE3OGNDaFg4SGFwT2xDWk9OOU1BeDVr?=
 =?utf-8?B?SEZLVEdnaDBtelE1MXlsYUhJaHhuMnpFRVlwVVZMZURPeS96YW5ZUkdnYm5j?=
 =?utf-8?B?OTRJdnl6VGhSVnpLMGp6d3hGUkJXM3JiY1h6eWk5WW4rRUdqcEJjRnI3cmlq?=
 =?utf-8?B?VktVbUhhUm5UazlDVGh4S3piZ1NEK2xNQzN3VkNza1FuYW9LOHF0NEFTS1h6?=
 =?utf-8?B?Q0pNM3RIUHd5R2ZuT3ZCRDZPREFKSFdsWGtXQTg3OVIrc083QTJGMm9aN0o4?=
 =?utf-8?B?U3Z2Z25iVmtLMkZmdlVmZ3VqZUpiUlR2SUN1UmFVWVJSbTZXVi9hWUtaM0NR?=
 =?utf-8?B?VXl3MkhjU1YrV1FtRGJXa3ZQYVRjZ3V4VjJrWjNYVDBVZmM5SUwxbkx3V0w4?=
 =?utf-8?B?eXc9PQ==?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 742080c8-7378-49df-6427-08dafa51075f
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:11:55.1052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pnxFucNJVPo6L6GS2uJ5MNC/VS7k6GymeTBKIjuFnQYgoidiTJGWH0gktg6E/+gnFO1qS6QTwlzGKcRBiPWk9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8259
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>,
 linux-mips@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>,
 John Stultz <jstultz@google.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Samuel Holland <samuel@sholland.org>, Sean Anderson <sean.anderson@seco.com>,
 Russell King <linux@armlinux.org.uk>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Mali DP Maintainers <malidp@foss.arm.com>, linux-arm-msm@vger.kernel.org,
 Alain Volmat <alain.volmat@foss.st.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, linux-sunxi@lists.linux.dev,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, etnaviv@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Tomi Valkeinen <tomba@kernel.org>, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Tian Tao <tiantao6@hisilicon.com>, Jyri Sarha <jyri.sarha@iki.fi>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Every user of this function either uses component_compare_of or
something equivalent. Most of them immediately put the device node as
well. Convert these users to component_match_add_of and remove
drm_of_component_match_add.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Jyri Sarha <jyri.sarhaı@iki.fi>
Tested-by: Jyri Sarha <jyri.sarha@iki.fi>
---

(no changes since v1)

 .../gpu/drm/arm/display/komeda/komeda_drv.c   |  6 ++--
 drivers/gpu/drm/arm/hdlcd_drv.c               |  9 +-----
 drivers/gpu/drm/arm/malidp_drv.c              | 11 +------
 drivers/gpu/drm/armada/armada_drv.c           | 10 ++++---
 drivers/gpu/drm/drm_of.c                      | 29 +++----------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  4 +--
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  3 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  3 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  4 +--
 drivers/gpu/drm/msm/msm_drv.c                 | 14 ++++-----
 drivers/gpu/drm/sti/sti_drv.c                 |  3 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  3 +-
 drivers/gpu/drm/tilcdc/tilcdc_external.c      | 10 ++-----
 include/drm/drm_of.h                          | 12 --------
 14 files changed, 33 insertions(+), 88 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
index 3f4e719eebd8..e3bfc72c378f 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_drv.c
@@ -103,10 +103,8 @@ static void komeda_add_slave(struct device *master,
 	struct device_node *remote;
 
 	remote = of_graph_get_remote_node(np, port, endpoint);
-	if (remote) {
-		drm_of_component_match_add(master, match, component_compare_of, remote);
-		of_node_put(remote);
-	}
+	if (remote)
+		component_match_add_of(master, match, remote);
 }
 
 static int komeda_platform_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e3507dd6f82a..5f760bb66af4 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -347,11 +347,6 @@ static const struct component_master_ops hdlcd_master_ops = {
 	.unbind		= hdlcd_drm_unbind,
 };
 
-static int compare_dev(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 static int hdlcd_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -362,9 +357,7 @@ static int hdlcd_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, compare_dev, port);
-	of_node_put(port);
-
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &hdlcd_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 589c1c66a6dc..3a49c29ba5b8 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -909,13 +909,6 @@ static const struct component_master_ops malidp_master_ops = {
 	.unbind = malidp_unbind,
 };
 
-static int malidp_compare_dev(struct device *dev, void *data)
-{
-	struct device_node *np = data;
-
-	return dev->of_node == np;
-}
-
 static int malidp_platform_probe(struct platform_device *pdev)
 {
 	struct device_node *port;
@@ -929,9 +922,7 @@ static int malidp_platform_probe(struct platform_device *pdev)
 	if (!port)
 		return -ENODEV;
 
-	drm_of_component_match_add(&pdev->dev, &match, malidp_compare_dev,
-				   port);
-	of_node_put(port);
+	component_match_add_of(&pdev->dev, &match, port);
 	return component_master_add_with_match(&pdev->dev, &malidp_master_ops,
 					       match);
 }
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 0643887800b4..c0211ad7a45d 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -184,10 +184,12 @@ static void armada_add_endpoints(struct device *dev,
 
 	for_each_endpoint_of_node(dev_node, ep) {
 		remote = of_graph_get_remote_port_parent(ep);
-		if (remote && of_device_is_available(remote))
-			drm_of_component_match_add(dev, match, component_compare_of,
-						   remote);
-		of_node_put(remote);
+		if (remote) {
+			if (of_device_is_available(remote))
+				component_match_add_of(dev, match, remote);
+			else
+				of_node_put(remote);
+		}
 	}
 }
 
diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index 7bbcb999bb75..0a474729ddf6 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -78,24 +78,6 @@ uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_of_find_possible_crtcs);
 
-/**
- * drm_of_component_match_add - Add a component helper OF node match rule
- * @master: master device
- * @matchptr: component match pointer
- * @compare: compare function used for matching component
- * @node: of_node
- */
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node)
-{
-	of_node_get(node);
-	component_match_add_release(master, matchptr, component_release_of,
-				    compare, node);
-}
-EXPORT_SYMBOL_GPL(drm_of_component_match_add);
-
 /**
  * drm_of_component_probe - Generic probe function for a component based master
  * @dev: master device containing the OF node
@@ -130,10 +112,9 @@ int drm_of_component_probe(struct device *dev,
 			break;
 
 		if (of_device_is_available(port->parent))
-			drm_of_component_match_add(dev, &match, compare_of,
-						   port);
-
-		of_node_put(port);
+			component_match_add_of(dev, &match, port);
+		else
+			of_node_put(port);
 	}
 
 	if (i == 0) {
@@ -171,9 +152,7 @@ int drm_of_component_probe(struct device *dev,
 				continue;
 			}
 
-			drm_of_component_match_add(dev, &match, compare_of,
-						   remote);
-			of_node_put(remote);
+			component_match_add_of(dev, &match, remote);
 		}
 		of_node_put(port);
 	}
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 1d2b4fb4bcf8..4a0dba34a6e7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -590,8 +590,8 @@ static int etnaviv_pdev_probe(struct platform_device *pdev)
 			if (!first_node)
 				first_node = core_node;
 
-			drm_of_component_match_add(&pdev->dev, &match,
-						   component_compare_of, core_node);
+			of_node_get(core_node);
+			component_match_add_of(&pdev->dev, &match, core_node);
 		}
 	} else {
 		char **names = dev->platform_data;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 9c5d49bf40c9..3ee277615c39 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -273,8 +273,7 @@ static int kirin_drm_platform_probe(struct platform_device *pdev)
 	if (!remote)
 		return -ENODEV;
 
-	drm_of_component_match_add(dev, &match, component_compare_of, remote);
-	of_node_put(remote);
+	component_match_add_of(dev, &match, remote);
 
 	return component_master_add_with_match(dev, &kirin_drm_ops, match);
 }
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 3d5af44bf92d..d0c87175dec4 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1444,8 +1444,7 @@ static int ingenic_drm_probe(struct platform_device *pdev)
 	if (!np)
 		return ingenic_drm_bind(dev, false);
 
-	drm_of_component_match_add(dev, &match, component_compare_of, np);
-	of_node_put(np);
+	component_match_add_of(dev, &match, np);
 
 	return component_master_add_with_match(dev, &ingenic_master_ops, match);
 }
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index cd5b18ef7951..abead814bfdc 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -787,8 +787,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		    comp_type == MTK_DSI) {
 			dev_info(dev, "Adding component match for %pOF\n",
 				 node);
-			drm_of_component_match_add(dev, &match, component_compare_of,
-						   node);
+			of_node_get(node);
+			component_match_add_of(dev, &match, node);
 		}
 
 		ret = mtk_ddp_comp_init(node, &private->ddp_comp[comp_id], comp_id);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 8b0b0ac74a6f..8ccf57def955 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -5,6 +5,7 @@
  * Author: Rob Clark <robdclark@gmail.com>
  */
 
+#include <linux/component.h>
 #include <linux/dma-mapping.h>
 #include <linux/fault-inject.h>
 #include <linux/kthread.h>
@@ -1156,10 +1157,9 @@ static int add_components_mdp(struct device *master_dev,
 			continue;
 
 		if (of_device_is_available(intf))
-			drm_of_component_match_add(master_dev, matchptr,
-						   component_compare_of, intf);
-
-		of_node_put(intf);
+			component_match_add_of(master_dev, matchptr, intf);
+		else
+			of_node_put(intf);
 	}
 
 	return 0;
@@ -1188,9 +1188,9 @@ static int add_gpu_components(struct device *dev,
 		return 0;
 
 	if (of_device_is_available(np))
-		drm_of_component_match_add(dev, matchptr, component_compare_of, np);
-
-	of_node_put(np);
+		component_match_add_of(dev, matchptr, np);
+	else
+		of_node_put(np);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index ef6a4e63198f..e3aae4574c75 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -238,8 +238,7 @@ static int sti_platform_probe(struct platform_device *pdev)
 	child_np = of_get_next_available_child(node, NULL);
 
 	while (child_np) {
-		drm_of_component_match_add(dev, &match, component_compare_of,
-					   child_np);
+		component_match_add_of(dev, &match, child_np);
 		child_np = of_get_next_available_child(node, child_np);
 	}
 
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index cc94efbbf2d4..9b3ddd82f1be 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -323,7 +323,8 @@ static int sun4i_drv_add_endpoints(struct device *dev,
 	     of_device_is_available(node))) {
 		/* Add current component */
 		DRM_DEBUG_DRIVER("Adding component %pOF\n", node);
-		drm_of_component_match_add(dev, match, component_compare_of, node);
+		of_node_get(node);
+		component_match_add_of(dev, match, node);
 		count++;
 	}
 
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_external.c b/drivers/gpu/drm/tilcdc/tilcdc_external.c
index 3b86d002ef62..0138ce02a64f 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_external.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_external.c
@@ -155,11 +155,6 @@ int tilcdc_attach_external_device(struct drm_device *ddev)
 	return ret;
 }
 
-static int dev_match_of(struct device *dev, void *data)
-{
-	return dev->of_node == data;
-}
-
 int tilcdc_get_external_components(struct device *dev,
 				   struct component_match **match)
 {
@@ -173,7 +168,8 @@ int tilcdc_get_external_components(struct device *dev,
 	}
 
 	if (match)
-		drm_of_component_match_add(dev, match, dev_match_of, node);
-	of_node_put(node);
+		component_match_add_of(dev, match, node);
+	else
+		of_node_put(node);
 	return 1;
 }
diff --git a/include/drm/drm_of.h b/include/drm/drm_of.h
index 10ab58c40746..685c44dc1dae 100644
--- a/include/drm/drm_of.h
+++ b/include/drm/drm_of.h
@@ -33,10 +33,6 @@ uint32_t drm_of_crtc_port_mask(struct drm_device *dev,
 			    struct device_node *port);
 uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 				    struct device_node *port);
-void drm_of_component_match_add(struct device *master,
-				struct component_match **matchptr,
-				int (*compare)(struct device *, void *),
-				struct device_node *node);
 int drm_of_component_probe(struct device *dev,
 			   int (*compare_of)(struct device *, void *),
 			   const struct component_master_ops *m_ops);
@@ -69,14 +65,6 @@ static inline uint32_t drm_of_find_possible_crtcs(struct drm_device *dev,
 	return 0;
 }
 
-static inline void
-drm_of_component_match_add(struct device *master,
-			   struct component_match **matchptr,
-			   int (*compare)(struct device *, void *),
-			   struct device_node *node)
-{
-}
-
 static inline int
 drm_of_component_probe(struct device *dev,
 		       int (*compare_of)(struct device *, void *),
-- 
2.35.1.1320.gc452695387.dirty

