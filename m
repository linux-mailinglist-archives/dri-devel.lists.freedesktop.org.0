Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766A9749684
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 09:37:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97F9C10E454;
	Thu,  6 Jul 2023 07:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2126.outbound.protection.outlook.com [40.107.117.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94CD10E147;
 Wed,  5 Jul 2023 08:18:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hz7jKdjs9VBt6WZrroBczV0fYTrw5wWothqn4xRAJexKDdDQvWpw6RV/yBBwkytb+/xPpcClAKCmTfK+mV2Z5yhXAWQW96krwPKLtNVJ7055ceR+3jXa0Jmw9s6+MWk9cHh4ED1PXNLPrkLIExViOd36l1Dv9jgLP5ohKqFdFEe7+ziCXnK75h4l0er7owAF2x9rVAiTDTvqjFrCrHE5WxLxHNKWXCRtbu44jFeZpkyJy8IWfZuvg2A3qUugLNRoVy8R3MJSAauf0euHGCXGSd+Wi7p35pHXgohzRXuky2IlgBCNizy1cWLG0LKRNdt6z/UKyFKyDQmNal8lMzF3gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mzn5y+ymBBCFfWxqPgFllI9lO4S7RSaez3Esz+Jip6c=;
 b=jP6oUCwww2BDi1rdEjsKDdbsg3a3/5X2gQ/vB/nFEblIVyFL/2bxd1dP88J6RbhI9S6qHq7ywdFvUnTut5xLoPYVIegSS40Y81pLfMdpURFSEJcmi/O9JdJt0IFk7qoXFfideInL2JetNorrW7QdxykSyfJwqusWlU0CyjAQ04xg+4sPEC0cLa/MMU411E9RrgQoknWS9sxiWdc8zFs3wIk8Mrf/Ejq9K9uQo/Q6CQQrzTSfawupY/L19BeWqKfzPOyoizWGGOueJinmA1txvXMHa4P7dpTyPgd7U3P7w67LOALPk+CBDruuS4v0O+uZaR5uWdXhu+cZh2XRvH0+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzn5y+ymBBCFfWxqPgFllI9lO4S7RSaez3Esz+Jip6c=;
 b=dmo/lz/Il9cJ9kuZTTzoQRDOVJINuCahLZJeYLf1E59GJGy4kQkdFs0ORvNEFKxg5RVWaYoD8Hlwf2NlYUNCkOYIQPkf/Mxv2qDiI3WQlrKQPHFVeFPZgW6H6UtO150FVufaRJIx2k7cIf6OMj6KE9rp8B+/0q7VV7uVbJOI1hLD/9U4hk3is51/cyOHFyDX6OlPU0oHFSiX2aCx5fS+7oDsD/xeo+q/OANZpnO5X77GIgzKeWTEPvp/appuDPkwF9elswIYP5zrcu/PamYBEwPNON4hPobPK5udmPrk2vYzhVe2FAcLTj6lfm9glalmbWIOWvcZfGj8AWG02Sfs6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5306.apcprd06.prod.outlook.com (2603:1096:400:211::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 08:18:55 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.016; Wed, 5 Jul 2023
 08:18:55 +0000
From: Minjie Du <duminjie@vivo.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Minjie Du <duminjie@vivo.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v1] drivers: dcn315: remove duplicate assignments
Date: Wed,  5 Jul 2023 16:18:44 +0800
Message-Id: <20230705081845.12621-1-duminjie@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY2PR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:404:a::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5306:EE_
X-MS-Office365-Filtering-Correlation-Id: ced1a88d-d226-4506-29d9-08db7d307944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NhBT16bUBu8pC1xRDB+dAXcddn9kMfs5ZoK/4ghpTTZAGc3yUOh9LcKtk1rCqtiNJhXsqP6ztr17a1KLZhn+rKyvt6hyfyKV+B8uspvZPvYaiuynQYHqE5VWP3QitN6TN5E8UZ7CfXwkJi8XS3JhLhmKxz2HqVGacevpbLqxGAdWcPxED6vdedUepdK7CXNxLU0QM2wFnuGyLyEvs+CXb+3i1z8vtaiAvxmMycYlGBN3MjIC95ca5y5af3tNEEIOQptqDtgvTpck1q06jWy/36u1fjrTqwU2i9vKQXioVZQ88FXN3o3MdxSi7qdC5odien7AeVHMo/roN2qkJkMH1eFHzUzoBdbPWeCmXI3Xzz15o5dMcdob2TWfT5jEGpgNhxkiz087UeLnUYfM1TsphfuyDZBtcOBY7j+3kBllTp4pU7xwZmp5S1d4cAlsO7q0O79uOmsx4kiT3IUWK8NeHPNKIRmaWEdzU2ddLKwiOZVeXxrefTnMXvBg7WvpsLTx4Ax9cGF93nke+K6tOABEZiHYzrHoNm8jSUEb1N9zJVLP9hnksTA0EBPc7kX2mRS3SO7iYIPFUcgxG7BHSRMitI2ONUTfxJW2v9h9DnAkR/og6XmMXMxti7WIJkkYFxhRTvg5EGhj/tK7P+Ocn2DFtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(346002)(396003)(366004)(136003)(376002)(451199021)(41300700001)(38100700002)(6666004)(38350700002)(52116002)(83380400001)(2616005)(921005)(107886003)(6506007)(186003)(1076003)(6512007)(86362001)(6486002)(110136005)(316002)(478600001)(66946007)(36756003)(66556008)(66476007)(4326008)(8936002)(8676002)(26005)(7416002)(5660300002)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EjDvw9w5lUdRqh1O4eYXSPAdwsYaoh6QjgYbz2pgflOAlk4WDqGKtVGMuoYU?=
 =?us-ascii?Q?H3ymRlehjU8Wh++H7pkJ+GTyMDNLb8ZY31fMy/vkwQ9612PNW+dVufAnxB7D?=
 =?us-ascii?Q?YHOYExfgdEGhsB0yMRPJy7Q5C720idX4oyaK3ogH9zAIsoGccA94Evn5EGRz?=
 =?us-ascii?Q?vlo59/n1K4Fb60lFTQm5Xm0+SXFEKz75X+bg6xfy7ZNOSfspbSpzWwImqcSt?=
 =?us-ascii?Q?M7EC8K15u8R2ogvBA/tuQAkBBMrKTCdtnIFkepmWc0dcRIOskMNQ+QBnguWk?=
 =?us-ascii?Q?th3A7nAUqxzALuMzXQZZMTv9j15uaXs52VjF/JePtZvR8BpGt6aIqbASL7cr?=
 =?us-ascii?Q?b0ZDlLKi0wO4tG/8ECcfASIenIQb1oUleSb19UtUeQLZldmvDOGEac7BdYwP?=
 =?us-ascii?Q?wAYMd+A9Yd2tUz4cUdOO0ntm0bNIBqT0AcropAaXynO5k1V9RuRNXJl66uLJ?=
 =?us-ascii?Q?fxiOK+hJVxB2uVnc86u4mn/xFdtT4fEjFO4IwTmMyL1K7+CYMUNXcnsQVyde?=
 =?us-ascii?Q?DvtmZdaBcjD7W2hmlJRAi85cdAR1qkzn8vEEJJuSkEdOEQHd/3416Kydm9AT?=
 =?us-ascii?Q?7a0fr9a2UQ1Q138XrKbVHGhaQxchWrre5GGgBNYhAzuWMvpcRTsVFunBPCIG?=
 =?us-ascii?Q?KWFoC4ljfN5gmCmgootfjN2K1O8PN0MzxoMc3u1QyJGUJwQEUoprHU6j4Ga1?=
 =?us-ascii?Q?km/VrO5WaIwNtiLbrJmNL/Ut5DdEyM6FRIiKeBB+6qju3Us+7bk2j6zZSKVn?=
 =?us-ascii?Q?Z5Y91oEeXYwEeilIGMEJ+eFhtKq5p0HvkQu8TwjsAVRGucL8ykWRR7YRnqPj?=
 =?us-ascii?Q?9XhEfxTRZ63fE6sUFTi8UoAqK1xizEGrm8x7mJ1ctjcRsqw30Criqbr2jrW1?=
 =?us-ascii?Q?M8bnGzlwnqrs91Ri3lk8Grp+LI2Y5ZNBJJBYZBP6jGPRtnG18z4Nmz9KT3ZM?=
 =?us-ascii?Q?zTvpdT6RrXObcgT+YsbkAE8+qyRTFcmYIQV/5r5FE/VXyUZ7nH7x6ApRjASn?=
 =?us-ascii?Q?Rzc9E/LOy2JIb3XJOWfKxkTvutkXGElKAzXKRcOBMsCrjNuxlfm2oBh+jO1O?=
 =?us-ascii?Q?TV4Fg+SmcNiIWPYqZr9DDDMjznQ3vTfwunDV5VoQxS7X1Q5mN4K7jXMKVAck?=
 =?us-ascii?Q?JoEQJVXAnuPzvBYAeena0t01k2BDQpESQ3viNS2z/Iv5Fhe0bvtFkDy7lCyk?=
 =?us-ascii?Q?ml8G2UhN48QbWsrE6Mb4a1ZOalzxMg/hk30EwJQZcxlVgADDxHUpX/AN5jvP?=
 =?us-ascii?Q?oO92J+ARjbb7Zq3/3NPArdAD9vz81VfdGXI4exNFKo6pya0BOcaMPXQxgu1U?=
 =?us-ascii?Q?ap/zFlkHkxG92vHV9JbVbjV+XC0KHqAhW/RDWQz9YPCYQwxBWvD/EqmCcJpC?=
 =?us-ascii?Q?KkI7rYGAUfuHNhbOd7tw6eJji2NnyOf8Kf/HGgj7B/kyNrFiNJTuwZguElKN?=
 =?us-ascii?Q?EGbmKULRMhRPcF3qt1BwofekvM6FE3MAQ3UF3X5IVPvo5ktl4U0Ei1IBKD8O?=
 =?us-ascii?Q?XdJafxVHfd9EzSkNZ7AP14yq/ygsRMLUEv7cnevuQKQ9rmYkLZGv88cBeTce?=
 =?us-ascii?Q?iHBS+hha0S7AgKaSJArn8/5wuhJghr7dfeqBz/kQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced1a88d-d226-4506-29d9-08db7d307944
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 08:18:55.2032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I6mBl2J7XXFM2yNyGqWJ9hnHuvNbhXb4PwWtu3rcH2nnWKxpQgzfHyiry7Bl7MZTjClyxoXaEgUqofpUyhrNsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5306
X-Mailman-Approved-At: Thu, 06 Jul 2023 07:37:10 +0000
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
Cc: opensource.kernel@vivo.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

make clk_mgr_base->clks.zstate_support avoid double assignment.
It looks like the value of new_clocks is unchanged, so there 
may be no need for repeated assignments.


Signed-off-by: Minjie Du <duminjie@vivo.com>
---
 drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
index b2c4f97af..45b811610 100644
--- a/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
+++ b/drivers/gpu/drm/amd/display/dc/clk_mgr/dcn315/dcn315_clk_mgr.c
@@ -143,7 +143,6 @@ static void dcn315_update_clocks(struct clk_mgr *clk_mgr_base,
 	 * if it is safe to lower, but we are already in the lower state, we don't have to do anything
 	 * also if safe to lower is false, we just go in the higher state
 	 */
-	clk_mgr_base->clks.zstate_support = new_clocks->zstate_support;
 	if (safe_to_lower) {
 		/* check that we're not already in lower */
 		if (clk_mgr_base->clks.pwr_state != DCN_PWR_STATE_LOW_POWER) {
-- 
2.39.0

