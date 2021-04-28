Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D4836E217
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 01:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33BBE6ECA3;
	Wed, 28 Apr 2021 23:19:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2082.outbound.protection.outlook.com [40.107.100.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C626C6ECA1;
 Wed, 28 Apr 2021 23:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9wv5uaTqc3vA79cJIZFflSVx2DgDZZTgwReVn2OYHbrZVZ6mmMrRqRMS++6JapyRrYRekBMeZ2NAfY8fFPHiieijD5oC3C/XoLYAJWg1wTcjgERlptFhIiUlyehbTKE4yX9A26hvxZdMAVR6dZ8cJH4HHgF78vaJGagEl3njgyj1iIugLKq1XD0fPAdvV4vJCjPdoO9gnBlNJcbuT2f3XnqaFrFzsa1LGqd6hLexS+D4uJoG/x06L8QPgyoHh7MROnsOL6LD6xj20X5iDUiGRgxbcqkc77EO+DtqIZ9s8NxWv6jRQCAZxYVya2ITo8L//wfD/KNjM+5aMkl+OqnwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2+c/cP7bcshwyqqC6QbecqSBUwnPyYlJSid3zEYyEg=;
 b=nUPmyNS6pDf66miuRETF0pWB2Varuzal1Qgmskdwt2JXoDn4Fyxg6Wg6RElaWFMvK7wspC8ytUiz7HqIFY8pwKVZnhEBIWTD+WXtCnbP68f2CM2x3r6MymfA+FYDpSJAU4+QXs5IJoaK5CJ4F7UQP1HDNcMJo1adVDKG1kUBxUlACHNR5y09SM6Ppe7rCDtHw8KzJ6lNFy0+5tGGxNyyWrVdDstsZSSsAHEYDWencJbt6AeE8Pz0vq9DaTCN9BSHDbn87/cqeWcIAGhp6dgOPjDG03KjPYGCSg18FhoqphLxIoXM5DZ8JcCT6zyQ64gvXAI/QU1b5N1KdsPTDocIHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2+c/cP7bcshwyqqC6QbecqSBUwnPyYlJSid3zEYyEg=;
 b=kmsuSZ/Ehd5hcA8UPXd/eN3jOqSDb1iRxG3aMARQvV/+7Z1+D2OqQ0+Ac6pqaGqi3LQESyz66fIVGb1FCG1yNDfGliUWj0VGwMHCd6Hm8vT5NgLmkngrGeEEjnU/wuH9VFuWO8BnQgY5Wp93vwKKud7h44fsmImVIN3/tD4QEf8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR12MB1258.namprd12.prod.outlook.com (2603:10b6:3:79::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.22; Wed, 28 Apr 2021 23:18:49 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 23:18:49 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v7 1/1] drm/drm_mst: Use Extended Base Receiver Capability
 DPCD space
Date: Wed, 28 Apr 2021 19:18:26 -0400
Message-Id: <20210428231826.1071368-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428231826.1071368-1-nikola.cornij@amd.com>
References: <20210428231826.1071368-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::17) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTXPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24 via Frontend Transport; Wed, 28 Apr 2021 23:18:48 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c293d1b5-8d08-4979-9fce-08d90a9bfa7c
X-MS-TrafficTypeDiagnostic: DM5PR12MB1258:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1258427992BD38E0C9608629EE409@DM5PR12MB1258.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5EI07S8ZLVxL6Gu4j2pkxBKrLQyz5HGua3tcN7RFVwP43r0eVn+Q/dMnlIHzhSbS8vrDc6CtncLC+MT1A/uUOatIE/4YDK91NDBdW3e8uUshvmQ1Q2HlHyIivFmCmxNjCo0EnLtBVBm+f+qqeGryL4QXClPuu+d8MpTM3sWJTgkvmAQb4jHgZFpRFBna7SM4iIfX+HzNfHyNdf8wxDeeFnfLfDOWtAWXHQZHeJquOZLt48rUe4pvhVVEFQeBWuB5h0mvnglFOyTRFLn45OyYUCSMoTY8T+8i9eIVgjDZfJniVuvQLYRaTiCWLoa/4v2xEkRcvBLQp+TTjJAOtfhGtmSUpyipvLwbKkcpj4kbDPMQGufczclveyKajUQMGRSzlAEEr+Jw627cuVHCG9sQ+OccSfvbgGzPp1MASWsLpkVSoWlNrZX0wBA+I02bGydPTQs8MP2b7jAB+zqYFvftvqxlExI+HsPghACc/Pll6KYswwuDI+mckVPJ+kmqK42SEl+AJOe7iR+8A2uOIEw+Q3SHD2YPNG9XJGXdrUJm5upwzTOO3pYd0ip8xFuHVpphwJ8tQDkuaqzPqtCftAqw8Io3x1ntN/8X2z9CBMnyCRgNcMqLazJNNPDQpWRPxi9Ao612zpLETJrYVOrXgEMsOCSxY7j7/u57qc4DCI/AA8g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(366004)(396003)(376002)(136003)(66476007)(66556008)(16526019)(8676002)(86362001)(4326008)(6486002)(26005)(83380400001)(6506007)(2906002)(956004)(36756003)(186003)(8936002)(2616005)(316002)(52116002)(38100700002)(6916009)(5660300002)(6512007)(478600001)(1076003)(66946007)(38350700002)(6666004)(30864003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Q1zy+x3WP1z+3b5U4EocPpYVC0SXGIaBkGnsOcMEoVXw3MTHGsnoUjfzr7Jd?=
 =?us-ascii?Q?MlCMqDkmYWX/isXekvMy+HotTvY6YTOsvvvDd9c9i9+Bzl7PWnA2twR4pPz+?=
 =?us-ascii?Q?OxVDRnN3NFWE1awwk6Ddwt7jpZLhSzsR57oJEYhOh+Wq9I8N32AcZqGUcgB7?=
 =?us-ascii?Q?t995BtOWYwpyeyTGM/Y7AmBqt4aoWP7BxjMNHHYCxjDOg4bnjWIY5zFA08ng?=
 =?us-ascii?Q?xYF3HgFlRpy+5MwPiuQ+25UF4BBtSpQ3qXbAtbxKdRaONBua7KEdvy65rar7?=
 =?us-ascii?Q?Uv8O2w1dqhq64PwGpxdiBrgcjtgH6Ggt3+tUyh8igGIQ5xPetagUs2TqYZBk?=
 =?us-ascii?Q?X0eWgF7L8Nt1KxGYFL0ZTFx7X0sXSUZcGdcn4U2MHXIwj6nYkMkfQDeXCu8o?=
 =?us-ascii?Q?zZ6EmpsF632HquLJfk04Lf9ebGe1k5dWv7z2eBfiEOQJ4oiu4qqh2zfiofZn?=
 =?us-ascii?Q?/qlTC8uWbU1RZfmo9H3zsBsQmNd4uK82nGQSR7ngeJp54PT0iw5tfgBxfRj1?=
 =?us-ascii?Q?IjllWOX+HdDjbo6K7ccfYZRD+sAMfHBankWWEzd0IwYyHKqx+n9j48s4LoVX?=
 =?us-ascii?Q?8ZZY42SvN/9Sb+lTRwTsjChvZIDCjSBLUPKB5ePP2ix+4efMvqoJnrxsmknW?=
 =?us-ascii?Q?F+TsTL5r5hySTO2+7xfSqiVXal+YjBNpd6hcEQfl+o3ROWxEf1hfUoOyAQk/?=
 =?us-ascii?Q?aMOjbzGlc+/Zuju3hC/DUWgP7o/jVdve9jWAllKM1v47Q/bs94HTFc7499kY?=
 =?us-ascii?Q?JtjIRKLiLYfmMdnMLsJ9j1N2+YekrNoXP+DdRnPWccACTYRRNU6yYgQUeuUQ?=
 =?us-ascii?Q?a/CIs7EJkcS7n1WUic/tll6aO6Cxp9wEtv7TfeFPpZkm/y/+WG0nXz9FVgUE?=
 =?us-ascii?Q?m/0t0VJilQoqNuou6fZiBwp2/zUwjnnqdojJwxf5LRqE2exhvdACS/J6kCzw?=
 =?us-ascii?Q?2kNVsLpy2KjPqO1qikf6+eG1ek7tb+BZ1tFk5de02hYH62UI3xJ0nDEQgaq+?=
 =?us-ascii?Q?mfZL8bOuu4yCXCzKsSYQoSg7BD/LixEQo6Eph0sI7q6jOuXu+/zOuAO1/3PS?=
 =?us-ascii?Q?c5CoWMysVwkjRTWpNWoPtwq3QW88CXaDHbKPn5LctGXCfaicJ0cCAWoVa6WZ?=
 =?us-ascii?Q?mOa7zLgk/aSBKM/DLzyDYM0z14bMEilAGtoQyNJMBQER91jsceefARUFUFM3?=
 =?us-ascii?Q?L/gRAQXLKfg+kj7jaD4Y8Mf1u6LAch5o6h3mtv8GU+rIWJZ5zPga88nSUaRO?=
 =?us-ascii?Q?uwORVjh+jaPkQLyla5UtWftPqHCAHMYbHLmrzsQ1qbCe/36SKOnqA95/HDCT?=
 =?us-ascii?Q?UgVTbe0CEpO8qpmzLKQGpfU3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c293d1b5-8d08-4979-9fce-08d90a9bfa7c
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 23:18:48.9595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 60Z+Os6dG0n0uebDcpy2RFV4woInB3oGSufK7Lq0J2NiiXmUdYqQETQOGEfkQB3Z8Zgeun8wz+Yk0dDrd75HNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1258
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Nikola Cornij <nikola.cornij@amd.com>, koba.ko@canonical.com,
 aurabindo.pillai@amd.com, mikita.lipski@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
DP 1.4a spec madates that if DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT is
set, Extended Base Receiver Capability DPCD space must be used. Without
doing that, the three DPCD values that differ will be wrong, leading to
incorrect or limited functionality. MST link rate, for example, could
have a lower value. Also, Synaptics quirk wouldn't work out well when
Extended DPCD was not read, resulting in no DSC for such hubs.

[how]
Modify MST topology manager to use the values from Extended DPCD where
applicable.

To prevent regression on the sources that have a lower maximum link rate
capability than MAX_LINK_RATE from Extended DPCD, have the drivers
supply maximum lane count and rate at initialization time.

This also reverts 'commit 2dcab875e763 ("Revert drm/dp_mst: Retrieve
extended DPCD caps for topology manager")', brining the change back to
the original 'commit ad44c03208e4 ("drm/dp_mst: Retrieve extended DPCD
caps for topology manager")'.

Signed-off-by: Nikola Cornij <nikola.cornij@amd.com>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  5 +++
 .../gpu/drm/amd/display/dc/core/dc_link_dp.c  | 18 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_link.h      |  2 ++
 drivers/gpu/drm/drm_dp_mst_topology.c         | 33 ++++++++++++-------
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  6 +++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  7 ++++
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 8 files changed, 71 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 997567f6f0ba..b7e01b6fb328 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -429,6 +429,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 				       struct amdgpu_dm_connector *aconnector,
 				       int link_index)
 {
+	struct dc_link_settings max_link_enc_cap = {0};
+
 	aconnector->dm_dp_aux.aux.name =
 		kasprintf(GFP_KERNEL, "AMDGPU DM aux hw bus %d",
 			  link_index);
@@ -443,6 +445,7 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 	if (aconnector->base.connector_type == DRM_MODE_CONNECTOR_eDP)
 		return;
 
+	dc_link_dp_get_max_link_enc_cap(aconnector->dc_link, &max_link_enc_cap);
 	aconnector->mst_mgr.cbs = &dm_mst_cbs;
 	drm_dp_mst_topology_mgr_init(
 		&aconnector->mst_mgr,
@@ -450,6 +453,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
 		&aconnector->dm_dp_aux.aux,
 		16,
 		4,
+		max_link_enc_cap.lane_count,
+		max_link_enc_cap.link_rate,
 		aconnector->connector_id);
 
 	drm_connector_attach_dp_subconnector_property(&aconnector->base);
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
index 7d2e433c2275..6fe66b7ee53e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
@@ -1894,6 +1894,24 @@ bool dc_link_dp_sync_lt_end(struct dc_link *link, bool link_down)
 	return true;
 }
 
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap)
+{
+	if (!max_link_enc_cap) {
+		DC_LOG_ERROR("%s: Could not return max link encoder caps", __func__);
+		return false;
+	}
+
+	if (link->link_enc->funcs->get_max_link_cap) {
+		link->link_enc->funcs->get_max_link_cap(link->link_enc, max_link_enc_cap);
+		return true;
+	}
+
+	DC_LOG_ERROR("%s: Max link encoder caps unknown", __func__);
+	max_link_enc_cap->lane_count = 1;
+	max_link_enc_cap->link_rate = 6;
+	return false;
+}
+
 static struct dc_link_settings get_max_link_cap(struct dc_link *link)
 {
 	struct dc_link_settings max_link_cap = {0};
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index b0013e674864..cb6d0543d839 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -346,6 +346,8 @@ bool dc_link_dp_set_test_pattern(
 	const unsigned char *p_custom_pattern,
 	unsigned int cust_pattern_size);
 
+bool dc_link_dp_get_max_link_enc_cap(const struct dc_link *link, struct dc_link_settings *max_link_enc_cap);
+
 void dc_link_enable_hpd_filter(struct dc_link *link, bool enable);
 
 bool dc_link_is_dp_sink_present(struct dc_link *link);
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 5539a91b4031..31d9f3ff0d39 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3708,19 +3708,24 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 	/* set the device into MST mode */
 	if (mst_state) {
 		struct drm_dp_payload reset_pay;
+		int lane_count;
+		int link_rate;
 
 		WARN_ON(mgr->mst_primary);
 
 		/* get dpcd info */
-		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, mgr->dpcd, DP_RECEIVER_CAP_SIZE);
-		if (ret != DP_RECEIVER_CAP_SIZE) {
-			drm_dbg_kms(mgr->dev, "failed to read DPCD\n");
+		ret = drm_dp_read_dpcd_caps(mgr->aux, mgr->dpcd);
+		if (ret < 0) {
+			drm_dbg_kms(mgr->dev, "%s: failed to read DPCD, ret %d\n",
+				    mgr->aux->name, ret);
 			goto out_unlock;
 		}
 
+		lane_count = min_t(int, mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK, mgr->max_lane_count);
+		link_rate = min_t(int, mgr->dpcd[1], mgr->max_link_rate);
 		mgr->pbn_div = drm_dp_get_vc_payload_bw(mgr,
-							drm_dp_bw_code_to_link_rate(mgr->dpcd[1]),
-							mgr->dpcd[2] & DP_MAX_LANE_COUNT_MASK);
+							drm_dp_bw_code_to_link_rate(link_rate),
+							lane_count);
 		if (mgr->pbn_div == 0) {
 			ret = -EINVAL;
 			goto out_unlock;
@@ -5448,14 +5453,17 @@ EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
  * @aux: DP helper aux channel to talk to this device
  * @max_dpcd_transaction_bytes: hw specific DPCD transaction limit
  * @max_payloads: maximum number of payloads this GPU can source
+ * @max_lane_count: maximum number of lanes this GPU supports
+ * @max_link_rate: maximum link rate this GPU supports, units as in DPCD
  * @conn_base_id: the connector object ID the MST device is connected to.
  *
  * Return 0 for success, or negative error code on failure
  */
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
-				 int max_dpcd_transaction_bytes,
-				 int max_payloads, int conn_base_id)
+				 int max_dpcd_transaction_bytes, int max_payloads,
+				 int max_lane_count, int max_link_rate,
+				 int conn_base_id)
 {
 	struct drm_dp_mst_topology_state *mst_state;
 
@@ -5490,6 +5498,8 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->aux = aux;
 	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
 	mgr->max_payloads = max_payloads;
+	mgr->max_lane_count = max_lane_count;
+	mgr->max_link_rate = max_link_rate;
 	mgr->conn_base_id = conn_base_id;
 	if (max_payloads + 1 > sizeof(mgr->payload_mask) * 8 ||
 	    max_payloads + 1 > sizeof(mgr->vcpi_mask) * 8)
@@ -5896,14 +5906,13 @@ struct drm_dp_aux *drm_dp_mst_dsc_aux_for_port(struct drm_dp_mst_port *port)
 	if (drm_dp_has_quirk(&desc, DP_DPCD_QUIRK_DSC_WITHOUT_VIRTUAL_DPCD) &&
 	    port->mgr->dpcd[DP_DPCD_REV] >= DP_DPCD_REV_14 &&
 	    port->parent == port->mgr->mst_primary) {
-		u8 downstreamport;
+		u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
 
-		if (drm_dp_dpcd_read(&port->aux, DP_DOWNSTREAMPORT_PRESENT,
-				     &downstreamport, 1) < 0)
+		if (drm_dp_read_dpcd_caps(port->mgr->aux, dpcd_ext) < 0)
 			return NULL;
 
-		if ((downstreamport & DP_DWN_STRM_PORT_PRESENT) &&
-		   ((downstreamport & DP_DWN_STRM_PORT_TYPE_MASK)
+		if ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_PRESENT) &&
+		    ((dpcd_ext[DP_DOWNSTREAMPORT_PRESENT] & DP_DWN_STRM_PORT_TYPE_MASK)
 		     != DP_DWN_STRM_PORT_TYPE_ANALOG))
 			return port->mgr->aux;
 	}
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 860381d68d9d..a4245eb48ef4 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -942,6 +942,7 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 	struct intel_dp *intel_dp = &dig_port->dp;
 	enum port port = dig_port->base.port;
 	int ret;
+	int bios_max_link_rate;
 
 	if (!HAS_DP_MST(i915) || intel_dp_is_edp(intel_dp))
 		return 0;
@@ -956,8 +957,11 @@ intel_dp_mst_encoder_init(struct intel_digital_port *dig_port, int conn_base_id)
 
 	/* create encoders */
 	intel_dp_create_fake_mst_encoders(dig_port);
+	bios_max_link_rate = intel_bios_dp_max_link_rate(&dig_port->base);
 	ret = drm_dp_mst_topology_mgr_init(&intel_dp->mst_mgr, &i915->drm,
-					   &intel_dp->aux, 16, 3, conn_base_id);
+					   &intel_dp->aux, 16, 3,
+					   dig_port->max_lanes,
+					   bios_max_link_rate / 27000, conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1c9c0cdf85db..e02f9d2d74eb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1617,7 +1617,8 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	mstm->mgr.cbs = &nv50_mstm;
 
 	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
-					   max_payloads, conn_base_id);
+					   max_payloads, outp->dcb->dpconf.link_nr,
+					   outp->dcb->dpconf.link_bw, conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 59cf1d288465..8f0b2dccd199 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -629,13 +629,20 @@ int
 radeon_dp_mst_init(struct radeon_connector *radeon_connector)
 {
 	struct drm_device *dev = radeon_connector->base.dev;
+	int max_link_rate;
 
 	if (!radeon_connector->ddc_bus->has_aux)
 		return 0;
 
+	if (radeon_connector_is_dp12_capable(&radeon_connector->base))
+		max_link_rate = 0x14;
+	else
+		max_link_rate = 0x0a;
+
 	radeon_connector->mst_mgr.cbs = &mst_cbs;
 	return drm_dp_mst_topology_mgr_init(&radeon_connector->mst_mgr, dev,
 					    &radeon_connector->ddc_bus->aux, 16, 6,
+					    4, max_link_rate,
 					    radeon_connector->base.base.id);
 }
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 20dc705642bd..b5b0bf37813b 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -593,6 +593,14 @@ struct drm_dp_mst_topology_mgr {
 	 * @max_payloads: maximum number of payloads the GPU can generate.
 	 */
 	int max_payloads;
+	/**
+	 * @max_lane_count: maximum number of lanes the GPU can drive.
+	 */
+	int max_lane_count;
+	/**
+	 * @max_link_rate: maximum link rate per lane GPU can output.
+	 */
+	int max_link_rate;
 	/**
 	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
 	 * to build the MST connector path value.
@@ -765,7 +773,9 @@ struct drm_dp_mst_topology_mgr {
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes,
-				 int max_payloads, int conn_base_id);
+				 int max_payloads,
+				 int max_lane_count, int max_link_rate,
+				 int conn_base_id);
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
