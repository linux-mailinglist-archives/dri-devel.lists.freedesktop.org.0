Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39336F1FB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 23:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29DBA6F4C5;
	Thu, 29 Apr 2021 21:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760085.outbound.protection.outlook.com [40.107.76.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECABF6F4C3;
 Thu, 29 Apr 2021 21:25:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oshia1SUtn7+t2XVLL4Hb/R01MWknBNpm+MLelc3bMPadmqDd/WIADBaHUx2jiSR1u3FZ/exA16ty/QGueGN4ibzxkbbSPGXvbiivsjVb2bq+fqknnLxGn7YUipzilMtsfb5TeP62e0XzoBFgjQ7IKb4Oc0U7q2UdxG5DEEmjl/P4e/WoCAZV4byA7eSz8hcHz+rQ+YMlsWX7hc2hF38MJYpMr+AQr+/BA3Ywyyr3+bKkLfM4v7Iuhg5aKHQdkt4d3ikCyeIFa93SSt2rJBj4a9rW7WzXzT30TVmAbOWY2mQFcS8pALX+YpQEnl4hqJgmPQBreh/gdWuUelemifiwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wd0kFqfbDizj5gDs1VoUy4+OSSYXNAYARiMK8tAPNI=;
 b=cwXOJT+Jr7Z+0Zj8oywKzgUj1ntt8cLk7+Do2yuwAR7oXjQL1AK9HTiJP7gWWytUdtifLt5u+ETFzeuG/JlRLox7iUPmHv5KvLhHaLKAN41X3l2n7j3z6xQNwtr88Qi6Cm8QNsOMmlqdFFTlN92tmeRRbwRZaR7iZavwp+8+G926VrzhfAzxZjPJQTuiM0iiHfq8334wPgOkUjuMWEG1jIDpGdpHU3+rPILMZqI0xk01qN3zp13+pJOqj371uuZngdNhygOoytnmMPVxoE5FAsQzLcjpF7CsuLk7RTzu1Zcgn38K5Q9/4QVB8z652PjWqkZTmJSSyJx6i2JRFC0nHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4wd0kFqfbDizj5gDs1VoUy4+OSSYXNAYARiMK8tAPNI=;
 b=KcQFuF0Xk5irIWSWMRPnEjEtwk0SXpdlCW6bz3v0kzIEY5U/VFTaSsipvSaS7EkNxXH9lHZk/sXXzyX99JgQZ3M7cCugN7po7V5mKeeNQ3dQkwZCTZI5tYeYI89jmEqAYyK4fH5mjy8sheuv6LoCTReJMmGGOEa/al9HNp9sBB0=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR1201MB0219.namprd12.prod.outlook.com (2603:10b6:4:56::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24; Thu, 29 Apr 2021 21:25:24 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Thu, 29 Apr 2021
 21:25:24 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v9 1/1] drm/drm_mst: Use Extended Base Receiver Capability
 DPCD space
Date: Thu, 29 Apr 2021 17:25:03 -0400
Message-Id: <20210429212503.21355-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210429212503.21355-1-nikola.cornij@amd.com>
References: <20210429212503.21355-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::34) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YTOPR0101CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::34) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25 via Frontend
 Transport; Thu, 29 Apr 2021 21:25:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ed8b63c-ccbd-404c-0179-08d90b554cfb
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0219:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB0219729B2A965A420D2234B9EE5F9@DM5PR1201MB0219.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wttrTZ+QAelwF5qQB2w7duciE8DZwJV9F3+Mdett+Bt8c/1AW1OVbLzlE3KEoxwqPEZhicegT753obk6348GhlYE2VUkg8QxLAJ9ynudlGvIng9pqBRV6o080KO18G68vYHR2er7WUsDXUsPxBESZUk1+mAUO5jNpX24AztpVt4QKjCnPsTyNMPPZRPb+KRVcLtnn6m2dd5X7lV99zqQdEqJKGPmb2cH7HnEGXY7NZvVL/yY0sRMf+UDGganjXF/HG5o0ePRaN8JmdXZ+42b3fQ0P5mOWZb3ebfti0JmAW50Ui/aYP4iNK27VOSLdhff/D+bJhGiAMK+f5sQ3zkSLCjtBqAenTmsTanRQr0kriN0sF2jfPNddEq08Xh33dy/HJRv5E9Zq6ndqqn+GM0LflctxPX7rVSLHfBFTzHMk0l2dUJpofh33GWvVL2MwQdaYUruM5+FWWeX2o7gD1NNZ2SJc8m8PscgkRnGGHRs6VNQ0nMiQYmI5O5B/w7OgOfjN5f3iJ8nXJaQHhdQXVXaYageuOG9Ex19gi4c0R8HGhmn+lCUrGOSDr00outAA1KpYw/zZrq8trIzPPW0AeuxF9L0r9rMbo1s05guaLEPWVEiuR8OZJiy4RzJqPdVDMmiMDraVKSg+sMcdcywoR8IAFvmGdI6PmtitFegfMIgQrE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(136003)(366004)(396003)(346002)(36756003)(66556008)(5660300002)(26005)(6486002)(2906002)(956004)(8936002)(2616005)(478600001)(1076003)(4326008)(316002)(38350700002)(6506007)(86362001)(6512007)(6666004)(66476007)(6916009)(30864003)(186003)(38100700002)(66946007)(16526019)(8676002)(44832011)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?jTIOdRlvQNNhvRKb6SKWaQvWjElbiaJkNYbRmoxUffE5NcFoBvmHd9QF8j++?=
 =?us-ascii?Q?yYZ96b9zIfOw5eoErhbKy0ZQpxmd8lASiz4guGLoXIEQhYhgWaBl1suvtZv2?=
 =?us-ascii?Q?d+QBPntXT9BINfhnmmPdotetIGLaLgHYIp8zYpEaAS8MLoh7blJxoPMsaftd?=
 =?us-ascii?Q?hW8nFY945i4wSC2vTpV3KzWXyLDao9LkwUOi4eaJY+5TeelioooyJKXQuwYl?=
 =?us-ascii?Q?m8COCOOtSUqsa2LjM7ZZPjuV4abowuZRytF6WA613RWGROpY49x6Xk6q0ECd?=
 =?us-ascii?Q?pSxhhPEIZLP1/7VczNmVSIjk1Q1czBNKX1yRH3RxjYLH+6KAffMK91X0jbIX?=
 =?us-ascii?Q?ijEOUJa7T8MLvIW3xINbZDxxY+YD1DxZKrTymN/bj/lCW8w+mhJ9yyVE6466?=
 =?us-ascii?Q?8M16jJ6B2r5TXAEl9touXzIrzblvYBCi1vc07x4PX6C0zv+y+a/QaHD65r0e?=
 =?us-ascii?Q?/pvJUu4nyY81IdWNz+Q4WdhmAtwU+An9RCR++tEpBpG2YIsc18kxANFCx+yU?=
 =?us-ascii?Q?raMGVZNXWMzWQ2xEiaCEJlkj7gszQVLrxvPLU3KpaLxNGTFK7/sjHYNJv3yW?=
 =?us-ascii?Q?jRQQ4lrwiaL9l8f1O+Wjxq/3HkHlpUCLMSBjZHE0Ikj7rgrj1C/b5sseqfDF?=
 =?us-ascii?Q?muMo9Ai0LWNyda+5IdiyD1TkToaMFN62JLDpZmMYeLaDc4BZgVtK4fQ1sc5o?=
 =?us-ascii?Q?LATaSJ6xEg7eWXWPMzO6db2x0MYu7r9pqbRBL92xziEmeYRNortPcmor6Y8F?=
 =?us-ascii?Q?vpIqKn6CuHbFyqvdJZRFhBbks7j1RGfICxUP/t4rfqqCjPPbfSecoYfKsERP?=
 =?us-ascii?Q?aM3YMhDMrX60SQ8NvuCe9K9mvaPv6gmvKTEfLvHA0XDTnFiPxropULSPjiYj?=
 =?us-ascii?Q?iCnQTiUt6f9Z3UMTPVZXtU2kfrRHSQrT3ZAbBu+OCTHB9r4u5OTLJmFj906i?=
 =?us-ascii?Q?3MPgKupNdGaL/X6tik/04V/Dq6kohCnnu+m+lY+lfau8ZRh91RTbmJegYUzR?=
 =?us-ascii?Q?+ROX6YhRysrtBFbeAXGVdkLb+TjLtI/v2ZyraVxQg6PrylpQkP3pKT71EQx4?=
 =?us-ascii?Q?HzbybApo7Da1z8bIHNExbQSUy3RXtwxsODz4LtVJXXvct+tvtAUBm6p9vXGr?=
 =?us-ascii?Q?gsVMkgJW4zQa46inMwrG+5+aQO3qqT8FOzMT3CfZ52ZJICEDzF+C+5Bwc3sd?=
 =?us-ascii?Q?xqghdeSdox+MADQ7jZ2vmpz3SuP2Jg9TQE5iNoXabc9c4QBn8pm/ZlmjRX50?=
 =?us-ascii?Q?ASVcW1q3U4NMtEcwkJdEOWQvL0zwxZQg1dzLm7ViioJbSudbNUu9L1xbx1Zy?=
 =?us-ascii?Q?ZyhjCJKBCY0Nn/vS5IPBL1b6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ed8b63c-ccbd-404c-0179-08d90b554cfb
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2021 21:25:24.2549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFUQGwneVPk5Ct56EyGU9mbAQ8nECIdECu7pCQ3+cIfaCs0lWyYGM3atcdhipnx/gi8ycBRpILiavprWvsSnBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0219
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
 f.txt                                         |  6 ++++
 include/drm/drm_dp_mst_helper.h               | 12 ++++++-
 9 files changed, 77 insertions(+), 15 deletions(-)
 create mode 100644 f.txt

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
 
diff --git a/f.txt b/f.txt
new file mode 100644
index 000000000000..f2d228d502da
--- /dev/null
+++ b/f.txt
@@ -0,0 +1,6 @@
+drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+drivers/gpu/drm/drm_dp_mst_topology.c
+drivers/gpu/drm/i915/display/intel_dp_mst.c
+drivers/gpu/drm/nouveau/dispnv50/disp.c
+drivers/gpu/drm/radeon/radeon_dp_mst.c
+include/drm/drm_dp_mst_helper.h
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
