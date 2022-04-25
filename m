Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF22050E194
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 15:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C81310E735;
	Mon, 25 Apr 2022 13:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2117.outbound.protection.outlook.com [40.107.255.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A68510E71C
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 13:26:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJczAY/8HWSCYbp5o7N6N6tQVu0nl0f2GNVgNnwgd6ueJ3JoKwNwNYixlCWxSixiSmd9PaK1G96u79rdEFxPErud+dtesKDMbXpsIPvAcW57TAX3IgOQQeEhZtbxoowmWlb6r+plUqIREehdpkn5+Wxc8mzkUDEyqTeJy44D/wdTBvp0/aSxyRZ/6GelApBA0945p92A6kdWXYM0/+/VaJifeSAnTfPVngXtGc6zOf0YlkW58nNEUtjYFIg667MJIt6wbyUAMEZkKBeGQ3CgN3NUAP4eiGR3OE3HCWRy26aCPi24K7XjVRyJnp4ZPj/PzZQOd1OIKjlSWPd3ppuXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JVHHRRe37ISX3IpQe57dqs0Ynl4doGYc+Cws5bSDxE=;
 b=RSRVzoTbObZibxWXKAIBdSA1ejxE8ejeBj5AHO0XcqfszsevbVS04+y3045Wc203mS2XghdrithmYTYxvYFph4RK+Q/L3U3+NiLxP/neRslrkiv6VkVoYhysIjMyNc/ssIIzMF6glkH9K+LsEvlVDbWpqDZw1XPJp0KNDNs6rarK92JsTr8gtmX04oV05YKdDlLIk2FJ2uW+lYfMo5zWG3EO7IwH5HYD5jJ3xGAkQS90ANC5xt5tXbQkDvZ9kH6F2dU2JN4vHs+W1sjQ9TZQIYWhr+u8RrugNhJcZksYE6xOsP1fZuklTlsKR0ZHmS0/NPX0zyPIKn5jsch3DGMyqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JVHHRRe37ISX3IpQe57dqs0Ynl4doGYc+Cws5bSDxE=;
 b=n4RQrFp1odB7T3m6YbkCUtA9P5htrOGU4YgflibgOV1GlUnV9EzSRGHlzlEi/L+lbttE30Lu3FDfJSl7EokznC6cGXIFjK0wgA+n5Yngeh443LnynW7CNYuaAxAg0TM/xEhyp1CYzcJXy6slekIHyaieZz9lO2WIZPOayEaXwyE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com (2603:1096:202:2f::10)
 by KL1PR0601MB4307.apcprd06.prod.outlook.com (2603:1096:820:73::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Mon, 25 Apr
 2022 13:26:20 +0000
Received: from HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08]) by HK2PR06MB3492.apcprd06.prod.outlook.com
 ([fe80::88e1:dc04:6851:ad08%7]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 13:26:20 +0000
From: Guo Zhengkui <guozhengkui@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Fernando Ramos <greenfoo@u92.eu>, Guo Zhengkui <guozhengkui@vivo.com>,
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/i915: fix returnvar.cocci warning
Date: Mon, 25 Apr 2022 21:25:31 +0800
Message-Id: <20220425132551.7640-1-guozhengkui@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0176.apcprd02.prod.outlook.com
 (2603:1096:201:21::12) To HK2PR06MB3492.apcprd06.prod.outlook.com
 (2603:1096:202:2f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64911af5-1054-4f02-60ad-08da26bf2f79
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4307:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB43074D5E1E3BE3E60A0A54ADC7F89@KL1PR0601MB4307.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2QcbhwgMkU5tpJqzCQhTNSRuuQbOJQZS+2mHqARzaDHM/+zKeloZpOPxadk2Ab8DU/WA/4UtaeC4IZLEQBuFfSlHsHvD/wHkef45IwiGkNqXEBaENB6NQvSwmMs0X8TcUsGFYYDPOZ0tJSxbpX9lcWjk8Agwv2X/uCjDSitXvGD2eZuFqpvVOfgdkg1YDwR12mGteQYaTiGMMdCqyHLChpBpNd91z5lfSXMfaGJo0JEcC4g/SHu3OyMCWkBwJGi6sRIvnvoxLB9oSYzscDEumPLSI9IVmhIuaUSFUJYoUfbpkspwudn/BpZHvHo/MfDZkvzhC41714E6EVwkbqsCZ3YOZTlUOj8iYhf02DOLRFK1UQ9QyI6r80NJ/GmdtV4N7M7jiZLFEvkZipYiqmA3e28vHwblpOZdx2BeldL3ZoEBBjMItj1KxUnpk4cZ/bLr+lVpw5XtlFG0BcHYZrelvGonAiXGXzH91zfmQmxCC3amS3FGED8HOXL5CX360yZfIwBwQ+et4X1bu2B38X1MKTcG/iQ5KMnfcctFF7OC/5L3rZ+Sado8jzJszWLldI5AoDmH9k1v8oV3KkAbbf2Vfy92e5NvP42Wt2qTMUDiz+nKHpP/Rggwx4kPA510NlQ6xrLjx5tCTN1jJ6/7Dw1T8goDoD9jBm2UNbVEpF7FKzYcmeK/gsNO7iAqYQMJBccjoQz9lIr3t4u44IG1nudrN/+88Xr2euyZtdt9D82XF2A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK2PR06MB3492.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(86362001)(66556008)(66946007)(316002)(110136005)(38100700002)(6506007)(6512007)(52116002)(8936002)(2616005)(7416002)(2906002)(186003)(5660300002)(6486002)(36756003)(1076003)(38350700002)(66476007)(83380400001)(26005)(508600001)(921005)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pIODZiATrpawJ4QyXvoB+mttwuxFJCfxMg8ZTAtS80rm3/YLcJgDtXkZ2Ygs?=
 =?us-ascii?Q?bhr+yq5abdIiNMozeE6iKrItHUC5m8jcZOKz7S500otv5AmVMTETsI2xEekC?=
 =?us-ascii?Q?U8W9NDGy9b5zw+WldsgrdLdGHZvVhOHw5edcJwIrpXhYJCvCrK4y5M1As0n2?=
 =?us-ascii?Q?fVh4bo5Riedd8FjxIgbRu3gWq01KLtHqjPhS95qwfQWX+PE5S1EWH9Letlh9?=
 =?us-ascii?Q?b0VLtzkNT3QlnV5HSKLdbvxs/46Brf1WWv+8Abaxfd9tGebjyEJJgqnaKDlL?=
 =?us-ascii?Q?0R9od27UlvyhEmME5jptt3LdUfZ65K/P9pEy8190TkLAYrjtf4zD99LJiatE?=
 =?us-ascii?Q?J8UDUCV+B4qxT0RuCDTTwXagzfobc7gHgMu6ywerYhPYBUhVGk0+aesBEKxl?=
 =?us-ascii?Q?gNmyTnzmgC2cf+kgYh+eeXvFRmg3Ibv8CQLBaSDBw+7s+tQ3S1zLpn5rGIp+?=
 =?us-ascii?Q?Apbe9+UasHI+M1gi1GYbnF9ppqxNk6jmT2lL64QNS3TFiodlQUXOOYbyf8Oq?=
 =?us-ascii?Q?9oCZ/wM8v4sHN2eotv677ejdN6ZJ7IQae6WdCATxJkZTgePLmLFrtzY77udM?=
 =?us-ascii?Q?iq+azugZRVb000DuKc50jq+tx9o53Sw/VeBac1D3a/GHLwgt3CFidTKrA2h4?=
 =?us-ascii?Q?RypgAMOygoZvFG3XyoFyH5WTEi35mfcK5IoHHzpnbDzwmOfxu3H6guIlG7Dm?=
 =?us-ascii?Q?zPxw3BZWkWp2/UgbzIFxx+4Db763v7oWadyUCAgeVk4kDCLLOjFSKgeQgoYy?=
 =?us-ascii?Q?LRQs5krNY8OtBMYh2Kj8EC1foauU2lkIRqZVOfLTqU8cUQU78LcC8PhlUs3u?=
 =?us-ascii?Q?jl4rkN9D1smDmmggtcGU5s6ZFBvV9MJJ+/ebHnO05q023j6BguP54eFInZvw?=
 =?us-ascii?Q?NsLLA1jScM0QKWtkCbitcwV3ujJbz5To9zXgyluu3nsa+tm4qaPNDnPU+qSE?=
 =?us-ascii?Q?7f+0GC6ghXzmfQMa8SJEIB8/dWnVASQ52muQrfGNK3TEEa+SlvD2CTTi0vXo?=
 =?us-ascii?Q?y6uIslnOgOiYNGxOsrtIjCsTqBq88GwZxGUXTPwlK1KNJNbNSEyjRz4+1UZN?=
 =?us-ascii?Q?EOYk9XtfM5U2NIa7PpuER/HuxtDc04resZKW7K8E4HAPunc6WHOzYINurtGr?=
 =?us-ascii?Q?SaSqI4vslmi3nK1SvPKbqVzqBMyexRNtRc4mzRj3j4eZrEeVC6MFI1VhGU48?=
 =?us-ascii?Q?+Uo7BpyroRuZYEEb8T+FI9MlPKovHSywMZrH8WXGc1DbCvZqKdEUdwjcxBVx?=
 =?us-ascii?Q?slWcCoObg7HEFhhZp3fPiz5+3u+rJC37VbS4U9oQB44ASuRMUhwHm0TkZeKd?=
 =?us-ascii?Q?LLLdbiKlBtbnG4K9THSj/+XIDyPE3a9zUJFITLvEMm5fyhnRtzXPjr8z4XMN?=
 =?us-ascii?Q?m9bdJSAjxdtQ+Vg9v1UEOgyPRfLdT64w8lc3zC2Z9+d9SlE5P4YZ/10HKL7w?=
 =?us-ascii?Q?JfZmOYUwnTToyqZJUuEBM2bGc5vOo2O055Ts0j4yIzgAZGoUKMcInP/Lwlp9?=
 =?us-ascii?Q?wjkCF7fHue3I+ltLP2POjLRySXGSa5+N96FrOHKC7H7ZZcJFO84IRcTXNJ+9?=
 =?us-ascii?Q?tD9SK1fl4DbzqMt7WG3rsnZJFjEDVqJNCVXFXjVY5R6z97aLfDH9HqrxnzZF?=
 =?us-ascii?Q?F3qZpUHWq7UkgjHCNAICBiKBS3EOD8AlHKAyBORxRGi9WNOaEiwG9zf7kVab?=
 =?us-ascii?Q?YNbHX0m1KUq55w0zu8Rmwx0P0QOXaj7N6oPIWm7vUYAg8vVoeoex9eFHAfjJ?=
 =?us-ascii?Q?MTVfzBuQEw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64911af5-1054-4f02-60ad-08da26bf2f79
X-MS-Exchange-CrossTenant-AuthSource: HK2PR06MB3492.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2022 13:26:20.5157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T3vUrpfAW8ZzGg4UQZF2qUBZNSSrrBZJXzxb4yat/jnVlLIyPHOIzh4NfsZuNmcRvZA5Q/MEprWh7tnVUD4YNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4307
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
Cc: zhengkui_guo@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/i915/display/intel_pipe_crc.c:82:5-8:
Unneeded variable: "ret". Return "0" on line 125.

Signed-off-by: Guo Zhengkui <guozhengkui@vivo.com>
---
 drivers/gpu/drm/i915/display/intel_pipe_crc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_pipe_crc.c b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
index 8ac263f471be..a4c570e487ae 100644
--- a/drivers/gpu/drm/i915/display/intel_pipe_crc.c
+++ b/drivers/gpu/drm/i915/display/intel_pipe_crc.c
@@ -79,7 +79,6 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 	struct intel_encoder *encoder;
 	struct intel_crtc *crtc;
 	struct intel_digital_port *dig_port;
-	int ret = 0;
 
 	*source = INTEL_PIPE_CRC_SOURCE_PIPE;
 
@@ -122,7 +121,7 @@ static int i9xx_pipe_crc_auto_source(struct drm_i915_private *dev_priv,
 	}
 	drm_modeset_unlock_all(dev);
 
-	return ret;
+	return 0;
 }
 
 static int vlv_pipe_crc_ctl_reg(struct drm_i915_private *dev_priv,
-- 
2.20.1

