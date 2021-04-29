Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D86F36F27C
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 00:12:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5F486F4D4;
	Thu, 29 Apr 2021 22:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2082.outbound.protection.outlook.com [40.107.92.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404ED6F4D0;
 Thu, 29 Apr 2021 22:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpzAOzsbe23YYI/OsjBxpSxAPBqgXKc56ezT4LGeA72XpsrV0s+AeI5yl8ebN/HAxsKsJdUbrUKkGOk/wsMbbJpkA6FNb/7zB7z4KRnaDfTb1l3TmhgtCOxnXojj9sHAcUNvpasJgVMAPNfm/JjtRhrIdzFnydef3xdXgtaRIkHJPXBa+cvgLZqaeQJMiv48m96RKZCT7vjree1eB0ioMFTqLHoleD5ilkZkQfVc40vqdjnkJ2r1SDIBHNHTWtFDiE5bNv7YmWvG/4t2yzrr72cB/cWr7FVmeRbiRm98jIV/02Ehy2cXB0lVOYF/V2R15ZNDJMsBSkjRPa09yKejtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RI4BZMv7Yx4TlK6XgtvIBnbEG8EDFdoXoEJXPDCeA8=;
 b=Op6wTHpcGYWOgp7fqomYSICUXf9s7XEC79paJaQfi23Z+X7MIwPl6YH/V+qBrNtUb/JAZSi7n+2PwojWbnBRrQaphM9xUYn8EOzO3bV+MI9df7w+/DQnYPM1yUFhtgCBlx//xVjMa+lkz1SntGDfISHNg2ahtGPzLte6o0CLRzRcvIg3k41FGoWQuTjgFkWFNL6bGZNhChry4eRU3x8+1nqA/KJ5AtRvFOl3qhK9m2RuTTYr4RFaR0WBHGlI6Xdi0vdKxr8Na3Q/NTrViGfIciJc1/UEg0YcHLrrgG4Kl+ZuepuTPj+mK8rqIFTkPv3vBKruHrKZH8nS75fl7ioWng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RI4BZMv7Yx4TlK6XgtvIBnbEG8EDFdoXoEJXPDCeA8=;
 b=29h5AHIY+Navbor3Gs175u3nGx7SmiPEq/i02vUASdrQMeu7QARDjZw4CYB59TvcoBYP2XzbFYtdRifiw6rX4dz+WctWlU1wogY4pKtPsm17WxabfX/Jy7mRrbrUE+ccEziLSAzimYRMS18pq4zBlEr+JkkHh/B7IK3qeLjPqhA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB2987.namprd12.prod.outlook.com (2603:10b6:5:3b::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Thu, 29 Apr 2021 22:12:04 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 22:12:04 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v10 1/1] drm/drm_mst: Use Extended Base Receiver Capability
 DPCD space
Date: Thu, 29 Apr 2021 18:11:51 -0400
Message-Id: <20210429221151.22020-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429221151.22020-1-nikola.cornij@amd.com>
References: <20210429221151.22020-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::20) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0111.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Thu, 29 Apr 2021 22:12:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef46e22b-1474-461a-5fae-08d90b5bd238
X-MS-TrafficTypeDiagnostic: DM6PR12MB2987:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29871F5C45191253557563E5EE5F9@DM6PR12MB2987.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SYnmuXD48TvJXwyjc1bhg/uq34edYU4Qtnkk+5LW/+S+9X18XalGCF4oEQPUXkL6qJlvm+DQtvtFuI05kSzXZ9D9l1V2SbYyltoHN6XeL6y9F+6V5VMFOJSsjH33pof/uPh47463QD+pcRNSvIHpgHotRUeQBoEKQ3WE00fNIK1aDsdwQ0hPjTfofEx9DP2WpNzAIBfIYnyp8fD/BTvqg9sUToR3IGeWIwR4LvoJTCPi6LnL2ycT3TjblhyN3clWgu1+zlgX3gSqoRTg/aVBZqHS9xraOVqKhW9vdMZI6AFBoJmAb5mTiYLPqBhcXazhXqFTs28Z+H86C5QUwyiNV0tKsVrlkHe1JNeWZDJHBwWeGNzOLsM0RtHhEPO4+HY7iUDNIUDnWaXx6mu4WoYAa9NvYP8d4ocgkFTBQGzCWaWLYXHbFqurxgOQj4+3keitubnoyd6oueX/aWrozRdpMTTqJKr0WMO7KWi68UUUlTMDh0XLWSYYHPVcjn7MbhBk25nKvl89Z2rZdVxeiwXyyvfN/CQRNsGengqV2XpswdJNwDl+zqV1b65TUzeUcbwspEFc0Fdmwq25e9/JpTVV/gb9gQXPHj/OROLSkU3/dY3sFx3gEKvsVvXPuMPDMFH9InnzpUF91hi8F8fWn0gvcV8K7X2IyGPTFhw9xDqvORI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(396003)(136003)(38350700002)(6916009)(6666004)(36756003)(38100700002)(86362001)(16526019)(5660300002)(2616005)(6512007)(83380400001)(26005)(2906002)(52116002)(66946007)(478600001)(956004)(6486002)(30864003)(316002)(186003)(44832011)(6506007)(4326008)(66556008)(8936002)(8676002)(66476007)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?aVZiAii5qaTIGMuK4pzCgTNFu6rxAOpMy889I4wyoXFP7zzUgh3pvmLyDwrZ?=
 =?us-ascii?Q?uvfNaU86Z+92UuAcJe8v6BE0HJVFcI5c284flsuV3Ti4MzaYncsi8jTC5h2e?=
 =?us-ascii?Q?1XoqG0XlG0dgY5t7xlmRaTAbzkIUg3kv1ZKx2ESkHKMjDCG61imWgOVGerJh?=
 =?us-ascii?Q?gvgEEWU7EidH7tbPIlgKUg/razYX6s4mHznTr8G3r5xvIV/rdiYVG0pL0ssQ?=
 =?us-ascii?Q?CXb9mTUH34e6jFKa/qhtS+8TJVbbPjEeU+brmYMZttFoQzE+a3Rz4MmmeAnj?=
 =?us-ascii?Q?ayQ9Vc3/bxUTTjqzHosUyeyZjwgpDm8eRQODzDV+eRi251iUj5NoLjN2bp5l?=
 =?us-ascii?Q?J2pFT2O2yIouI93BPCf5LAX6MvUNeBNGs36l5X9y+dmcxbyK9W++zOKs7Tsb?=
 =?us-ascii?Q?yB1OWl7ivNvIJI/BBrViDsVqCPub/L+iSXEt54BCHW1KBL38CM9wyv3bPHR6?=
 =?us-ascii?Q?xCnDaUaaQyoYXhmF+n8oi1fD8kRTggjdyf0Hpp13a6by8l7mxeSef26xtDR1?=
 =?us-ascii?Q?Wt+FfUKL2PLhRT+I9B80LsqFVSNP5ab4I0UOs21tmbhUbaWZFvfv8wGJYyyx?=
 =?us-ascii?Q?gdQl0P51dUYVsgZNY8tYkwz20Ryous3Eqt11m10Ki+yMQMgirXMO/uVYPT3i?=
 =?us-ascii?Q?oZ7lgGmbKJIVFCv0VJNHR5F2nu2muUmzmblU04ENL6BmOcrgdKOm3uEQVyhX?=
 =?us-ascii?Q?BCG9zXzj0zN8LHpcULqWK5P2pwlvW0mnM7cGrWIvqkk54MkWwhVQYHN2qMLi?=
 =?us-ascii?Q?k1IIiSv6N6CMJCchUx3N2xwUqaKkg0RYxYDi8CzulrqnlDRlYnmuFvvt2JG1?=
 =?us-ascii?Q?3s1PJgB97Ow5FUcsVSP4m5A8zn9ZMhCX+gxCdoTHRL+xhJVr+YtujjPiRBAw?=
 =?us-ascii?Q?3ELHYlmQ02jT15cjlwiTe9ZECoIPbmGndQqd+8F/ll+nTdTZvu1OkZbO0LPE?=
 =?us-ascii?Q?Mbxl1GbJ/OzStuxh83N5TrHrYGHxVE7oRrbxrsO811MHZTz4iSuMQ1BpQrK7?=
 =?us-ascii?Q?6r4//zEYjzMD9z/SVMbFfkb/2ZScLMAsbCmypD+/cRPgCsav4q1jlOq6sG+T?=
 =?us-ascii?Q?rBFzrw0cngK1ix275nOqEEniOtBYbDEmKLtgimIMcxLRDRTX0gAkIAfOFp9s?=
 =?us-ascii?Q?gmaWVZSYE/d8XL4qiDyB3iKuuvOuklwaVe/of9Z+LVmi21s20s1rETyJ5EZb?=
 =?us-ascii?Q?5cZXeQwloElg4UdOv0P3qqJxguFiIMTdxWG3vRVVf4lQjLMLbKnh9Zg8La5G?=
 =?us-ascii?Q?RsZzZUIqmRyWOevby7w9ZYdMb3E5jxWUi+vbkI2GY2wYnJFNQNRMZNM/TR5E?=
 =?us-ascii?Q?Wl4s8AI7mYTKJzzDKsFEBoRL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef46e22b-1474-461a-5fae-08d90b5bd238
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 22:12:04.7734 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDuj4k1fND18KDnW225yrFWmQ1zHzWKGvv5EjVYIeIKFN2mcNRD1gcysX7WwUw+AZwc49gy715e5/Qx06+4Ulg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2987
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
index 997567f6f0ba..ef8d53e24c47 100644
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
+		(u8)max_link_enc_cap.lane_count,
+		(u8)max_link_enc_cap.link_rate,
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
index 5539a91b4031..54604633e65c 100644
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
+				 u8 max_lane_count, u8 max_link_rate,
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
index 860381d68d9d..bf7f8487945c 100644
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
+					   (u8)dig_port->max_lanes,
+					   (u8)(bios_max_link_rate / 27000), conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1c9c0cdf85db..c46d0374b6e6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1617,7 +1617,8 @@ nv50_mstm_new(struct nouveau_encoder *outp, struct drm_dp_aux *aux, int aux_max,
 	mstm->mgr.cbs = &nv50_mstm;
 
 	ret = drm_dp_mst_topology_mgr_init(&mstm->mgr, dev, aux, aux_max,
-					   max_payloads, conn_base_id);
+					   (u8)max_payloads, outp->dcb->dpconf.link_nr,
+					   (u8)outp->dcb->dpconf.link_bw, conn_base_id);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index 59cf1d288465..13072c2a6502 100644
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
+					    4, (u8)max_link_rate,
 					    radeon_connector->base.base.id);
 }
 
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index 20dc705642bd..c87a829b6498 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -593,6 +593,14 @@ struct drm_dp_mst_topology_mgr {
 	 * @max_payloads: maximum number of payloads the GPU can generate.
 	 */
 	int max_payloads;
+	/**
+	 * @max_lane_count: maximum number of lanes the GPU can drive.
+	 */
+	u8 max_lane_count;
+	/**
+	 * @max_link_rate: maximum link rate per lane GPU can output.
+	 */
+	u8 max_link_rate;
 	/**
 	 * @conn_base_id: DRM connector ID this mgr is connected to. Only used
 	 * to build the MST connector path value.
@@ -765,7 +773,9 @@ struct drm_dp_mst_topology_mgr {
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes,
-				 int max_payloads, int conn_base_id);
+				 int max_payloads,
+				 u8 max_lane_count, u8 max_link_rate,
+				 int conn_base_id);
 
 void drm_dp_mst_topology_mgr_destroy(struct drm_dp_mst_topology_mgr *mgr);
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
