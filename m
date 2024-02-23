Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E267861C57
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 20:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E45B10EC9A;
	Fri, 23 Feb 2024 19:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U1qj6cBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2426810EC9A
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 19:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708715760; x=1740251760;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=kRAOsdaWKXD6Kk7vLR+vEToSipGsrRZC5pVmtzAZ+go=;
 b=U1qj6cBqMtASmqA9uAi3yYvxT8MISqtFw6VnAF/BSIHPzu53UeQ3jlGn
 egwMC9GMVA5g9vfF2ORY00xju4ePGSnZfPnG6EzpEJwyIoumx0Fr+ocJC
 irQX9RgqeAtEu/tAf0JFwwzjWCgDS43ezlO9X8JJh0rQm2zAgNQsVfxNV
 gRGoNdW4WgezZCqMREsiezaqAPwwMmEbtwcnAHOtfofMHaJZTcJ1OgCnD
 Zx7XV4nxM6qfzVnpxA+uoaQUEy018UVXhv5AtwMvJJhHCahOfjrDNp9D5
 FSXc6tCE70O0FG1xVFkGqvqA/5AMJ26BrkWxwZZgo+FtzJi8WVnOH55uk g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="6864903"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6864903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 11:15:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="6018012"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Feb 2024 11:15:58 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 11:15:57 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 11:15:57 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 11:15:56 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 23 Feb 2024 11:15:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXmpQckp+Hu3HObhLkxXZlUh4mHJTM3Uy0VqCFB3cxAolsKU15f/GQgB//W6u6+Yke0nQvB53IB0iF1Dz7Hp+zkB/pi/blOFCWSvl/ThY8kxBAJg5mVA8n7JT8Eszkjt5vxDNmzb0fpn/vuALMdQcAzL9fk5/ACGvRJvTDDY8G6QWWe/OfsrBkwvWXjNLbvLURxzsptwJ+HP6rSDux2DDX11x5qg1GCkEPwhV17jUI2WgHukk0bzEL695rojgQd6ciORu71xpCZWxDzpQYpQcDgai8hnsWkAImpekzHqNAgeWEcY+7Y//nkaACHZD7xE0fZWziHYkL3obOPT9cYxLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YGpFpDJpVft8yZngbbfBhz8FCtpCdRBN1u0Rj367jD8=;
 b=DC31zIhdD5YvsP4rs6DbkhoF5AfVlenAjKHKphkpyuZqR0wCKURuz7RTfObsRCicZ+cTOc7iAJOUX7+C7UHRr9nu+j1fEsaIawgKGgKbIZ7hUoxgEMlIDOTQxuvg9M5SUs6ukAmcr7xOxLZHYoD1/cpmdwZAM5kapaWlUhCz60MQAfAu/jy/BTaxGvveIzQrJDMs7E37HITgwcOgVn81sUfF1/2eEuv0CcF4U3ozAELmDVq0zrnAceV2TzF6XpGq8WhVfs3uvKM8QPInzuhXTFJ2p9aPmkaYj0tF/Ime6Vr0DO/W7ZGqHHhP1qliNc1jAAAsHk+DoypAeUscGLv+sQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA1PR11MB6123.namprd11.prod.outlook.com (2603:10b6:208:3ed::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.8; Fri, 23 Feb
 2024 19:15:54 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Fri, 23 Feb 2024
 19:15:54 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <dri-devel@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/i915: convert remaining intel_dp_vsc_sdp_pack
Date: Fri, 23 Feb 2024 14:15:48 -0500
Message-ID: <20240223191548.392185-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA1PR11MB6123:EE_
X-MS-Office365-Filtering-Correlation-Id: 833c9132-707e-4d50-d5d8-08dc34a3db63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1HxG1/DPVbunnPJJbs49afGi5D/4UlMIC+k8viWOBqiW+FhEbxyfSpZLTBcfwb1Ki697LOdmKuKDLfjNYCcjABCPvU+DU/Ne08DLWbo8FQQaspgZY7mrdvwNHn6JWYcsla8enJm5t/3iaJtMB8EiXSyLi7h4D2xIAPoUa+G002GMRRu2PVdKk1KplUTsP8EvsMRG1Czw/E81AIJMFEggWSsJauF9DO8Frcr/FpNI8uvydciB5wa/iTrVz8QZLH/MTY1rJh5XmttUWYfVeEWQOlUpuyOvfi/itwXyZYqTCZZmg9FJj5NI/c61MTcEPgiml7An5omT/6Ry0TQsFI0kBNGoPm8sE5nvRtpXauHQ0AbW9dsYs7zKuXOI2dXfUzxJryt9LT1CtHqBZflauGhQtlnVGGsPIr6NwUYx/Ue4nhZaSQPu+L+NRHmq9wpWwzAnwp6fAunAiNXMx4gjNKEdfFgCdlK5CHgRxG+uKTIbE1INR9hiODaZIUhXauQsBzCmPkeKQN4xsBDBOrjOPne3JuzcJBQNz1AVl3BvBiB0tVU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?it14LWk6nfkkxIJvM8tLCzI0gRmN7DqX4Wdq0pnaVekVDb1Sp9dhqjTKijyn?=
 =?us-ascii?Q?xxwOJwp/Z1ioHggyHulqwEu+VF1A6dwmlT3hoHNEmn6koK6GTwFwQ4Hg4JMo?=
 =?us-ascii?Q?r1Q2E4OyWEQMqSUGSNI/GR9xB27xL1QtiLodPoy+4P1T9XQzSuYroOfct3T5?=
 =?us-ascii?Q?Y1U5WTESpxXPDpdw4sON9Xpzwwo7RhPK3gjW0qrDGaNakowznZFwzY0nQ9D9?=
 =?us-ascii?Q?rm4996QJdEnvDIB8e964gVv+mdHo/8+GaFK8mkf/d2XmbpjNI80RtVgpHIUi?=
 =?us-ascii?Q?T3aSVHYDBnxbmdMWWTsatu8OaBZEGp8NalE6tqaQUF1qx3kaYeJSKp7K7s09?=
 =?us-ascii?Q?X6ONqJzs432hk86no/Se5O1+sBvF8mz5zB5aACR3xc+chUQ5KUgpXQaxn2Q9?=
 =?us-ascii?Q?nFWBT9T8WYBvVdSXz3p+TdX7dIno+Iw1sCLEqGoAXon2TWcJaLPxC/VV6L3g?=
 =?us-ascii?Q?/9WTSS0MSE1RhuR7i+0ONrVKPAV39kAXWm3QSMaIVBK0ZvFTndLOyeGuNFEL?=
 =?us-ascii?Q?Qd1bRxXOe4bTLNBW6VLJl276fSKcmxb+Mn8z2x2Zq3pB+6h5EkVHylfgICFG?=
 =?us-ascii?Q?HVfUG6svXIiv4xXq9hDpCczdQoy3HL10+50hNHGiIF4beYepzg7r3ujQnOWZ?=
 =?us-ascii?Q?ssQXv9lsi5ym1ZtHRBAYZ+pEOWTN/2mmphH9s0g83m9GtNlJALoendXDUEer?=
 =?us-ascii?Q?JJd24+16ffoydLOVrX+TouCtL/hCpUGjoEsaP/veBrLAy9GPIInnPPgnWDct?=
 =?us-ascii?Q?m44FY/7AcHVSpwM7CEIXvrSWNrmNh3fx+Z9Qh+qQcX/eIz4iWH6Q0BbrmA/e?=
 =?us-ascii?Q?28TZNlcUHgu7zaRWMOmZYmI8flJ6h/NbTPmvvFS9QwN0ULixZbvuqKI6Hyoj?=
 =?us-ascii?Q?+W6NQoOkZdgk8QUiqQzGLOZAByW8k0a03qHqYF9VoZnz/i0nWf3FCFlHlk96?=
 =?us-ascii?Q?52m2iVH/8/exB1fsLBg39ZXmkwf8XHQhQbaomvXqcvjGe09ruUEtOeQQ0A7k?=
 =?us-ascii?Q?mq9w7tedjJD5Y1nZ/Ksf7axn0gC25L6ngKy+E6CaJoG15y2IiE8Zh1EdhLeJ?=
 =?us-ascii?Q?P/e/KigvK/RqaeQcU6723ia37Vq/TYe5FaMkUvUEzMarNwI9zJCePvwjfYGw?=
 =?us-ascii?Q?lt4oUMUUi34XDV4sjkVuFitU3NWQ0E7Wa9UnUbotg9Uh/XpsaO0BiRI9Tlx1?=
 =?us-ascii?Q?ApbdGa1xstDg89sfEF66GhhkD4zAkqbghIvOeUwUbgNFAcxVRCLwpoGqBNDS?=
 =?us-ascii?Q?FOn8ygZ9aflF7BgoecdOrqD1wlObzyILlqfZd8lXe8+qdMurBK72Wm5an5Ro?=
 =?us-ascii?Q?r+WNbkpiBzUC1WR4zMZxMd+OOmS6OJmfa6wyA8nrluKxJvPJBtP9pUNZxEU8?=
 =?us-ascii?Q?PpjpiHmf4DubPDe9jTeW1ypjBW8lWSpQWfvycuaYpR7bANNvQzDAXpyIvnzQ?=
 =?us-ascii?Q?7wpF4mgC/8qzNcgK+oIM4OAoJneGpaceg79eTNzE2ELDSVGZn9uAY/lSpsAY?=
 =?us-ascii?Q?gN6YweoSHv180fcNo1JgRUiSW1XELMqkONaQ8FUostYa9yyYviESGaZXo8rc?=
 =?us-ascii?Q?PygbVCrVYQRe1XsgwvGj4b9PrdERZSWKWZvzB8cG?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 833c9132-707e-4d50-d5d8-08dc34a3db63
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2024 19:15:54.7177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWQkfBdkaGkH9pWo3V4W1ViAU3B1xkh4C+6tmH49VwvE0kYmO+ZjO6EwuwujI6BvFRSQoGJ2XAkZD2fGDVaimw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6123
X-OriginatorOrg: intel.com
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

Commit 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
and commit b55b88d86fec ("drm/dp: drop the size parameter from drm_dp_vsc_sdp_pack()")
were based on top of a tree containing the
commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation") but
landed in a tree where this commit didn't exist, leaving behind a spurious
case calling for a removed function: intel_dp_vsc_sdp_pack()

Let's convert the remaining case here so we can port this patch to
any tree that doesn't contain
commit 31a5b6ed88c7 ("drm/i915/display: Unify VSC SPD preparation")

In in kind of merge where this commit does exist, this line here will
be gone anyway and not needed any longer.

Fixes: 47f419e07111 ("drm/dp: move intel_dp_vsc_sdp_pack() to generic helper")
Cc: Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 756c15791a3c..c2e73ba5b2b1 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4229,7 +4229,7 @@ void intel_write_dp_vsc_sdp(struct intel_encoder *encoder,
 	struct dp_sdp sdp = {};
 	ssize_t len;
 
-	len = intel_dp_vsc_sdp_pack(vsc, &sdp, sizeof(sdp));
+	len = drm_dp_vsc_sdp_pack(vsc, &sdp);
 
 	if (drm_WARN_ON(&dev_priv->drm, len < 0))
 		return;
-- 
2.43.2

