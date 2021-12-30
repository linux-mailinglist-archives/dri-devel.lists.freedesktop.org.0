Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EF5481934
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 05:07:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A851B10E251;
	Thu, 30 Dec 2021 04:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80083.outbound.protection.outlook.com [40.107.8.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B23C10E251
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 04:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8Z5wSW0MxlWjCpuM91gKum1uvRUCWS3CExiY6ZwgvL/kx7BlBEzVGx/VfLqVKNBK+QCFgLu7J0LqWwp9ny+zjXUrH2lCBhd3cnlHlas/uJ/bmILDEBaF2d9arEoX0f6DQrXosGF/aQWaK6SagTA2tN6dF2OqdtdZKsacDS4lU5MPNx4cC/zBDr8HkHMNDWF0+8NxkFpeSoJvCF6UKUaKg/Jgjte7q+bnMfkdxWxJZFABhHteyCvGgFEE1tELChZC0DKFeWOieLBnYrDdIOgyoPwR6xHllFnlM1yURBb8cS6jVcyEwcyllmBVQHGzHgf+38QQh3ZoOJiutihn7L1KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9xUlUnsLHiAviBJmva+7SB/0RyHMGNJVaWpNxthYnAM=;
 b=ePPU6EXiuhbXfllv0TYNd2UzjQYeD35rmwf9PD7GEgc1xKWB4P1DOhOwi3Xk9+kAJHhXvrUBr7iDtIXDWrSIxwM+rssWRUixpZsyeOADxxUkGrhlF19p3Rklm6o/20q1MreukzoJU0HtlXPx2nSvMAHhZDPPN75Za4Dm0M/6z1iWOTwoj7tqDaAZYCSzrSUt+xUHbbnCROA8B8n87ES0UaSP5mFA+IBwoTuUelbVHjhEEJaUh1yIkyu+1fb0KjZrCWWY6+lVMWca5t0o/Qb8UzaNo5LVMFyWSoGrJziFAeCZJGG5TIsJtP+rA0DaCUH6WAzl1ij/0Ar+ke+cyjCFCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9xUlUnsLHiAviBJmva+7SB/0RyHMGNJVaWpNxthYnAM=;
 b=Wu/4GAxMQdrcOupje2K1m879JIxu/DKS7phbidq3yNzmUMSIQD9VRl9fTVXCONnh1jv09z2bNePWi5Nr8HxLQxi7XTz1+n2vMoY454z/fb63P3e8/JUjNYPbQaHqFpvEZUWXCno45kZgKjlYyleGWnGTW/g7gGX/AynviIPEzzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB5704.eurprd04.prod.outlook.com (2603:10a6:20b:a6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4844.14; Thu, 30 Dec
 2021 04:07:25 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::a5b3:9e5:366:a3fc%3]) with mapi id 15.20.4844.014; Thu, 30 Dec 2021
 04:07:25 +0000
From: Liu Ying <victor.liu@nxp.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/atomic: Check new_crtc_state->active to determine if CRTC
 needs disable in self refresh mode
Date: Thu, 30 Dec 2021 12:06:26 +0800
Message-Id: <20211230040626.646807-1-victor.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0009.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2016b71a-d5b1-4893-1c70-08d9cb49e339
X-MS-TrafficTypeDiagnostic: AM6PR04MB5704:EE_
X-Microsoft-Antispam-PRVS: <AM6PR04MB5704889576E629EE7DB68F8398459@AM6PR04MB5704.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:639;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XlrDoARqfYGaEnvzd2mFKfYQXasjdcaXHDz5dnayawWGmiQ+NfDjr96ZRnbiN9EpgIo9OSyYOav0WVkGZsTYPZ3QhlxTQkSMvNuXqrUJdeXZ2KhBaAS3EMdRtNftlWUeEGeNVSPcrbbD89Rz9RV8A0lspw25w5/vqE/9nf4lIENsttIw11t1jY6XAhfCI8Q4sb3OXBmoNjPvA161iNlR9QTUvazBg2MbsAPwZITsyB/dk6LtR7+2zCkUc/ncJXNUlhCpF0Q3uEfZa59ciN1vxfKzQ6CwZQTyuQNx7J0iEuF0L9BR46U0ORwVx/+9f4yWuKz/RjbpOBmVdtrVwHnVoIiDp1915mMRGAGVtDHKPD99U0nEMs5wnyt3jLBbSnlU8Y1T9ErG5W8Sw5P8XrfwXjzQCbnlz+s3Jq4nzPXt5nGkjmFJCu9zuZYO2tZt2PhZCQML7yGdoh+VEwk0U0vd1/QolI7nr5XOZRwdFU2A79CJxrydjdAF01+MJP+c0lV62r1nfBUMpiwwy2WwptCoXtG/IQa5tzORfldrOj0YGCGfETIe3OJwo39L8wjc8NFKE6iLTFdx5BUP3GotLd9Sm9SN7gtvvNt48/EiwozIlykJMH7m+nPVsav6jvPetbnVatl9OC7s5xOHCUeLA1tw9tLFmu1fqh+nmZ9lvuEHm++cP6/kD7yJqzu5OUix6pzVb4m/5cyigZ/Jx0wAGXyYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(6506007)(86362001)(66556008)(38350700002)(38100700002)(26005)(66476007)(4326008)(316002)(186003)(66946007)(83380400001)(508600001)(6512007)(2616005)(6486002)(2906002)(54906003)(1076003)(5660300002)(8676002)(8936002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lVPE/di6TW4U+wrz5TPPXUlphBz/nSidrZiBEj+BlAY6LvE7lcdsJ0PfZUuB?=
 =?us-ascii?Q?Y79j1vJ1RXOwR5mDVf4BipFEelxPa+qWdbOsak+jGi+Ay8fBjKIaDnJ39Rod?=
 =?us-ascii?Q?QKKTnsn+UKK++mjmFnTqmVuaZEojql0yMzUk4XiK7ZREaG+aJ5dEVge9urhA?=
 =?us-ascii?Q?IYERh8M+Om6RCn17RUItfNm6wjJPUxLcrcZ0afXnKpnoeIl96PkNySCV3OJw?=
 =?us-ascii?Q?CVz0UTP9+fcbCYQM1rcTZAb6CXUkiKAByRvzFHbOuoju/pg74gXVs4M5UxLx?=
 =?us-ascii?Q?yEgzQIhqj2Z2IjwH/wJmoTWFBwh/aXYXwdPtOB8KGkIcBYyqfNi6Zbac6+Ur?=
 =?us-ascii?Q?DKMbdK6rC0i4fpMK9IaOqoyZGqfQviVMz7bT6mPI99tJiVhfKyMnhw363P50?=
 =?us-ascii?Q?SaU2OCvno7tBHkjww/OrKwEdFuRrJSfQvrdJIkbO08pStt2JVeX8GbSFqi6X?=
 =?us-ascii?Q?r9KIxBHNrwkzY02UMWPx6aKL0zhJxevRYfaQ9bzeoL5X/MSumpQWbueiuTxt?=
 =?us-ascii?Q?OGnq6PMKbO1K6ZCKm6DKFvSpNHV5IZ29Ji7N+/LRzdtoWnVkD23o0InveQj/?=
 =?us-ascii?Q?qSxdzBvzkfCmTWicHKFLYaVXMg0MyLB5YYXGF5vmr0fJpvjnihpLB+Of9pxa?=
 =?us-ascii?Q?5tUPGrJP4kAuuQyOnorEfTCHuvXFuirpdhaSgGi7qsHbxb15jLHV+e34ekW2?=
 =?us-ascii?Q?qSsxZGQ5DXwDSD5EKSwMuJyF9rx9E2eTcPlOIno+7giUfqISv+Eyl/GRJx87?=
 =?us-ascii?Q?ojBbPKcu62+EYE0iuGW8e+ug16UB5CIbKpQjXhppnMWat7zhUYCf+5RP39Am?=
 =?us-ascii?Q?HxY+of3X4aoosCGj4m9gMMnyeUeGJ0Jw/PBuB22RI8fE7WAygE1WO7xsSOrY?=
 =?us-ascii?Q?K0K+sRV7FcGMO9blaSClXGwHD4px4n7HYgOFYb7iOgEAAyRXpWg7AJ/lZku+?=
 =?us-ascii?Q?yZuq1UQVEaS2rIavq1XN0j91gaeB9k9nmzRPI6uHd/9G72MIGy9+1lMwI2Wk?=
 =?us-ascii?Q?V1x1Z3/93/uTj2YzFX2izvFlzWeTbRWIq2Wd2DtZ0nSgFLKxiAQT6DAVg43+?=
 =?us-ascii?Q?uSirb6hN/7+zAp9WZDN/4Pm8LeH3tTz1FVqwzxaG/5wuA3dYidUdrJHR2hdF?=
 =?us-ascii?Q?N4BaN58c9u9p6yP+4KIy6EKQzFxsDaPl9oTHXOc/Bq2DzRZlrb6oAilq7+Lf?=
 =?us-ascii?Q?lupErta0u5BYeRHnl/fFD66u0l9XrQc1jxwYwUsQN0FMtWXAMS/vyiOeHKRr?=
 =?us-ascii?Q?qioDp8dAPwZALcZYyYTmXLJsniMrAEWoktvv9WyCDhy5s+QxUDoJhD07g6p8?=
 =?us-ascii?Q?Vv76PXYg3H96e8zA3+trNfrE5OhOGwUz5k2TQPWcEsLPhgHy7nc7fPMC+bXx?=
 =?us-ascii?Q?WC927vkDTv9irvfkyHWocn+w9M3I7eJkViIjrETEbJYjukpavL7ExwQCotAJ?=
 =?us-ascii?Q?9QAUcolZDlWZreAZtu/FVD9bohRXGKCFDXQa4FvGg2Jl4mW6S5rl/1lTNtpq?=
 =?us-ascii?Q?ierwUjam+ZaiOY4DacVtqSlj5iI3fUsk9EbI3uEEyxNrIhSMKFfeOIy99/5U?=
 =?us-ascii?Q?84kQIBVybOdB6IUjXEwoAUtpC5hsnCy1n+oykudjuqOyprs7S/LMB+FuG48K?=
 =?us-ascii?Q?Nd6rO3rY0MeGnkp8RrzBSuQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2016b71a-d5b1-4893-1c70-08d9cb49e339
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2021 04:07:25.8450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z4vpEdsfp+SH8NyH94arMpP8gRlr607ET3+e8frgoGoYjth2TrcTx3Cnd3g5/ZDz9fHH2tFQbDOOMUYJ/S0ptg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5704
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, linux-imx@nxp.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Actual hardware state of CRTC is controlled by the member 'active' in
struct drm_crtc_state instead of the member 'enable', according to the
kernel doc of the member 'enable'.  In fact, the drm client modeset
and atomic helpers are using the member 'active' to do the control.

Referencing the member 'enable' of new_crtc_state, the function
crtc_needs_disable() may fail to reflect if CRTC needs disable in
self refresh mode, e.g., when the framebuffer emulation will be blanked
through the client modeset helper with the next commit, the member
'enable' of new_crtc_state is still true while the member 'active' is
false, hence the relevant potential encoder and bridges won't be disabled.

So, let's check new_crtc_state->active to determine if CRTC needs disable
in self refresh mode instead of new_crtc_state->enable.

Fixes: 1452c25b0e60 ("drm: Add helpers to kick off self refresh mode in drivers")
Cc: Sean Paul <seanpaul@chromium.org>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index a7a05e1e26bb..9603193d2fa1 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1016,7 +1016,7 @@ crtc_needs_disable(struct drm_crtc_state *old_state,
 	 * it's in self refresh mode and needs to be fully disabled.
 	 */
 	return old_state->active ||
-	       (old_state->self_refresh_active && !new_state->enable) ||
+	       (old_state->self_refresh_active && !new_state->active) ||
 	       new_state->self_refresh_active;
 }
 
-- 
2.25.1

