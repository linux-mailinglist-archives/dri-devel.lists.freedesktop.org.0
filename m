Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A17371E66
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 19:21:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AC16E9EA;
	Mon,  3 May 2021 17:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D29F6E9E4;
 Mon,  3 May 2021 17:21:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EUeFoY4rPpfd9X6rh1KAQAzU+ClOtpUBSLybGj0jd/yGzKQ9WKmWk1abDzAEjAV1olHMsQXix+Rudrn65lYUt6WJA1dyAbzDBf5+tQ//v0HFegfkOGvVpJ25Nk7p/2aLih7J3ZYMoN7KKaq+lNZlgTik1pB3mP9DUUcG53QnjOEZ/RXPXi8pJRwmTyW6rFQPPgnietkdkYq+o8QlCWNtAdRrNAWhBgHR6gC7/gMYGxbe4Qs3csg6+m9AWwMmwGMW4yMFpejTCutwLmDHhcCd+bZRd6UhgLX8y0rqWm4VMtpEwwY1HPTUqYeJFnefXyQhkIQA4guL+DboMqlht/wvEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNFjYkSKS4gZ+J5giPa61NpDQ8wqqbRifQ3pk+vPeKI=;
 b=Q6FtrdEs8e7+CeJvl3Ce4BnD1jQay3eavug7kc2C8hxEeKrL3B+uaeLO5giw6Ra510eDbotq9stwvj6P0r/lXAAgQKaMrROFx3M8w1N2h/iTsfkiTYb2Lnalld/tN3//pjyxgW1zAlbP3/TIRHyJIPRI6OJT9745x8OMkLUGToPljtrqFSlxxz35TBWKcNTm+np1YGxebHajgg8Zr10pKK3U0d73FyIYdkgcEb0E2VraB86imyfGtNk6KKtZBDdFWZsVlR0Rojn3u4DOJ8jLqTqa/aBTH3uF7ulNomXYaUybb/KXjNqNIjFjiheuKF7viHN28MA61MqkD9EwilOEjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNFjYkSKS4gZ+J5giPa61NpDQ8wqqbRifQ3pk+vPeKI=;
 b=RVLVhbYqWBkAxqmW5TwHZyqEyFW9UNTsDo9i4JTG5LW54yKSRBQ8VP1al2Z72/DLSCJYW7y0gsmg1ppCR/eqp+QgQ/m547Evx4OxGQEpxC7h/mx6ixIlRovr9w3KcJm5/86vHPoEYf0BhpTl16H2RpO97uwb1cqo74y+AF1KZpY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4676.namprd12.prod.outlook.com (2603:10b6:207:19::30)
 by BL0PR12MB5010.namprd12.prod.outlook.com (2603:10b6:208:17c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Mon, 3 May
 2021 17:21:38 +0000
Received: from BL0PR12MB4676.namprd12.prod.outlook.com
 ([fe80::50c7:783f:720a:239c]) by BL0PR12MB4676.namprd12.prod.outlook.com
 ([fe80::50c7:783f:720a:239c%5]) with mapi id 15.20.4087.040; Mon, 3 May 2021
 17:21:38 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v1 1/1] drm/dp_mst: Use kHz as link rate units when settig
 source max link caps at init
Date: Mon,  3 May 2021 13:21:09 -0400
Message-Id: <20210503172109.22877-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210503172109.22877-1-nikola.cornij@amd.com>
References: <20210503172109.22877-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::8) To BL0PR12MB4676.namprd12.prod.outlook.com
 (2603:10b6:207:19::30)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0069.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.38 via Frontend Transport; Mon, 3 May 2021 17:21:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d66e91ab-5052-42e8-3ede-08d90e57e895
X-MS-TrafficTypeDiagnostic: BL0PR12MB5010:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB5010C7BEE3BD3499FCD8B2C4EE5B9@BL0PR12MB5010.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uRJc7sm8F+iI4VGzVUkzpmovEU7QZc5CVaJ+3LX3ExwcRoQRygOymeVGApUEZ4Q+9W//ur4QDwN1Lub3Q51HPTW6Yaz7A7E55sKDApoTD87l3dVTUilaJcJ7iBc8fr8huFmYwlqCxrwcOmVrp2qBiB02CmRQTtsWECqbIGFEs29CyiyfsbKwlEA3EGd+tnC/eu+LZjStjSxL5CKeT5KqnWiFWNV0dKDuA2XJtgXY5dAtZDw0h3rF+sC4c5ih97YXC5H22Nl7H3PtKMvJ878s+4tO7wJssTvfs21SnbI2g0mUlnRWlDlirrB4ZC2e2MYDLSj9/eqcxXh/IBn0kYtjPEm0sIRLwOE2mt1mKQFLuqHgnuALdqyTmsGrwYdSwoV/bweWrjlw3O7hoSzTf7vd6o0puV6Wp6AbPYR8mXXy7/wpthlizGD5QgVL9kFjew84QDb4Nf+a0SWmOKBAE1Rq2Po1kq+/mJqax/TtYiqtUue8mrgxMmPXFJt3H5YbA2FJzA+jzIosa4Mv/0II9Ei3yVapvRAVptO8Xswcz2xz0PDU5qnfXlsM3HWIEWVmjsQy+2eG2PVSiQwUKOrsibGqDK+hWzjoyFX4bce0iHYQ/+jQVhKHDLMnRrDl3ZQirt0L2Mtb5S4VGGoi0xpzW/dQA6/e98xillcHX6wPUJTd+3E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4676.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(366004)(346002)(316002)(2906002)(6506007)(44832011)(8936002)(83380400001)(6486002)(36756003)(38350700002)(38100700002)(6512007)(86362001)(1076003)(478600001)(4326008)(6666004)(54906003)(8676002)(66556008)(5660300002)(2616005)(66476007)(186003)(16526019)(26005)(6916009)(66946007)(7416002)(52116002)(956004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zsP7fwcK/nUovNg42CsBhiqHWWkq3TP5E/voEiMkbmK+QbOKJo/TddSDlH2c?=
 =?us-ascii?Q?vsPGRyMXvqPIcuwEp+RRbe10d2JurVZgHaO2b5qsTTT3qQNFplVdJUKkStJs?=
 =?us-ascii?Q?ElW145N+9wuGBFiFomGWiUB+HhKC6EQU7Pf5ylSGA73xYFng3rl7xtfc1ptT?=
 =?us-ascii?Q?QLSeqk5H605z/d9nFGCYPgUJ6Vh9p4iDhYmotfbsiMnii2H+gheOsE3j69L5?=
 =?us-ascii?Q?PTmEZRbU3JreciMXIqolwEnqRP/oKxTAND3CkGoahTUE2Iweqkg69Jo30RxQ?=
 =?us-ascii?Q?S+RMAjI026qLElejcz3UbD/+67uySGoQ16rndWqDfDAgDXSSs/OX7J9sKkrg?=
 =?us-ascii?Q?JZSpwX96WTkyJ0ORsALSWkY80N1f8paengyJODHltsAt3tDBE4OLKVt25Iyg?=
 =?us-ascii?Q?7Qq9kkhf+XmWho5Q+bU0H91DbhdTMJCIT9nnRY/YUHMvHTxyyR4zrDRv8ZPx?=
 =?us-ascii?Q?MgDJGtNyd8gfR5+oJMbhA6+GeV+/TgSxDQADPHdO1JSsnjwzQjzeg/aYNamx?=
 =?us-ascii?Q?ZJNZcbj/9LXpd4yAr23eU+ZxKbCwGimvKlvB4PwSi3tFk6EK2lP5UQ/IX8AO?=
 =?us-ascii?Q?Rb9wFPP+2d+T2JaKYWckFV0MfnDUcLtqjP2h9N4LBKT2j9CX1eHdPkkLPpF1?=
 =?us-ascii?Q?hxWQPRJTUbOt8qW9mZoEJR/DkAcPYLI0ZtPdnq/V6d+yD41pm8y7dpnNySVB?=
 =?us-ascii?Q?ploVoHPyPvWH+mM0qHbadxeLis+gL/xdZusAWHbU6B/OsJ/H35rS47ekIqAI?=
 =?us-ascii?Q?3w/a9dbw2pKIWkPvQ7hlEpUuGVBbP2j40QRJxX/ZO9+5BDFoAkugswPVBiQd?=
 =?us-ascii?Q?HO2j36v6Q8cUfJp+GRLoNmD0pEm2TM2jU04bFLrk9PyBrNvvZalLXjTBY33R?=
 =?us-ascii?Q?QfjFZye5d9pJqPNBD2Tntsc7bA/ln9OvBrC757wxuJR1KcDfZNsEZmchD6HG?=
 =?us-ascii?Q?vjEUUcW3k4DJPDX0W8IpvXTNqDjlR2xAiAQB8Mk1B0TGfaBuh/OH7OAYvV76?=
 =?us-ascii?Q?YKBZmm2fkipYVFLwjJGEJ+ivqsjO5WWPyEtROf5M5PVsYaiSNqkjs5RoGStC?=
 =?us-ascii?Q?5pvQsMFTzyOw5gWfF7M+uRFylzvlZok/TKnLy3oplaH3d1HGC69TW0RRpLnx?=
 =?us-ascii?Q?/29MDq7nGCHXjBo1wTmWv/vJ7tsWxwk2eaudvFexfPJmwwMRYKHhV9zl9CoM?=
 =?us-ascii?Q?Mv6SE0nIZyWlbPiOp3K/n0cNnFICGe+noBL6yDwdLvd5IvAMMJgeiAk8hl+S?=
 =?us-ascii?Q?JPTV7hMgZMoGFekeInNRgEAouGhuRL8cNZ3BtH0lQOIuoXSJavBn3R0t3YKv?=
 =?us-ascii?Q?QVyTBYhg3eAU7rBWJDBZZvpT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d66e91ab-5052-42e8-3ede-08d90e57e895
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4676.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 17:21:37.8773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zZR82G+R0gYchYz+IzJ2rOznDQLvRsFb1IBYp3z1YfCTCtkb6d/Bt7Q+2CUGz/X+Z+JZ/lsKFLjlpG7sFzsemA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5010
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Meenakshikumar Somasundaram <meenakshikumar.somasundaram@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, James Jones <jajones@nvidia.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, koba.ko@canonical.com,
 Luben Tuikov <luben.tuikov@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Lee Shawn C <shawn.c.lee@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
Link rate in kHz is what is eventually required to calculate the link
bandwidth, which makes kHz a more generic unit. This should also make
forward-compatibility with new DP standards easier.

[how]
- Replace 'link rate DPCD code' with 'link rate in kHz' when used with
drm_dp_mst_topology_mgr_init()
- Add/remove related DPCD code conversion from/to kHz where applicable

Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 4 ++--
 drivers/gpu/drm/drm_dp_mst_topology.c                     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c               | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 5 +++--
 drivers/gpu/drm/radeon/radeon_dp_mst.c                    | 2 +-
 include/drm/drm_dp_mst_helper.h                           | 8 ++++----
 6 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index ef8d53e24c47..3f3ead83c21c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -453,8 +453,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 		&aconnector->dm_dp_aux.aux,
 		16,
 		4,
-		(u8)max_link_enc_cap.lane_count,
-		(u8)max_link_enc_cap.link_rate,
+		max_link_enc_cap.lane_count,
+		drm_dp_bw_code_to_link_rate(max_link_enc_cap.link_rate),
 		aconnector->connector_id);
 
 	drm_connector_attach_dp_subconnector_property(&aconnector->base);
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 54604633e65c..32b7f8983b94 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3722,9 +3722,9 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 		}
 
 		lane_count = min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
-		link_rate = min_t(int, mgr->dpcd[1], mgr->max_link_rate);
+		link_rate = min_t(int, drm_dp_bw_code_to_link_rate(mgr->dpcd[1]), mgr->max_link_rate);
 		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr,
-							drm_dp_bw_code_to_link_rate(link_rate),
+							link_rate,
 							lane_count);
 		if (mgr->pbn_div == 0) {
 			ret = -EINVAL;
@@ -5454,7 +5454,7 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
  * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
  * @max_payloads: maximum number of payloads this GPU can source
  * @max_lane_count: maximum number of lanes this GPU supports
- * @max_link_rate: maximum link rate this GPU supports, units as in DPCD
+ * @max_link_rate: maximum link rate per lane this GPU supports in kHz
  * @conn_base_id: the connector object ID the MST device is connected to.
  *
  * Return 0 for success, or negative error code on failure
@@ -5462,7 +5462,7 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes, int max_payloads,
-				 u8 max_lane_count, u8 max_link_rate,
+				 int max_lane_count, int max_link_rate,
 				 int conn_base_id)
 {
 	struct drm_dp_mst_topology_state *mst_state;
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index f608c0cb98f4..26f65445bc8a 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -960,8 +960,8 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	intel_dp_create_fake_mst_encoders(dig_port);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
 					   &intel_dp->aux, 16, 3,
-					   (u8)dig_port->max_lanes,
-					   drm_dp_link_rate_to_bw_code(max_source_rate),
+					   dig_port->max_lanes,
+					   max_source_rate,
 					   conn_base_id);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index c46d0374b6e6..f949767698fc 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1617,8 +1617,9 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	mstm->mgr.cbs = &nv50_mstm;
 
 	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
-					   (u8)max_payloads, outp->dcb->dpconf.link_nr,
-					   (u8)outp->dcb->dpconf.link_bw, conn_base_id);
+					   max_payloads, outp->dcb->dpconf.link_nr,
+					   drm_dp_bw_code_to_link_rate(outp->dcb->dpconf.link_bw),
+					   conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 13072c2a6502..ec867fa880a4 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -642,7 +642,7 @@ radeon_dp_mst_init(struct radeon_connector *radeon_connector)
 	radeon_connector->mst_mgr.cbs = &mst_cbs;
 	return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
 					    &radeon_connector->ddc_bus->aux, 16, 6,
-					    4, (u8)max_link_rate,
+					    4, drm_dp_bw_code_to_link_rate(max_link_rate),
 					    radeon_connector->base.base.id);
 }
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index c87a829b6498..ddb9231d0309 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -596,11 +596,11 @@ struct drm_dp_mst_topology_mgr {
 	/**
 	 * @max_lane_count: maximum number of lanes the GPU can drive.
 	 */
-	u8 max_lane_count;
+	int max_lane_count;
 	/**
-	 * @max_link_rate: maximum link rate per lane GPU can output.
+	 * @max_link_rate: maximum link rate per lane GPU can output, in kHz.
 	 */
-	u8 max_link_rate;
+	int max_link_rate;
 	/**
 	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
 	 * to build the MST connector path value.
@@ -774,7 +774,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes,
 				 int max_payloads,
-				 u8 max_lane_count, u8 max_link_rate,
+				 int max_lane_count, int max_link_rate,
 				 int conn_base_id);
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
