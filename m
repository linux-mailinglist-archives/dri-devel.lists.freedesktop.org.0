Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A880036E242
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 01:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7FC6ECB0;
	Wed, 28 Apr 2021 23:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C486ECA6;
 Wed, 28 Apr 2021 23:44:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=krTp3KB17KdspN+l55lTpJyCyiGB+B0XsVItABrVXs8eUKj6F7yhMGSzegPelaHcalOM7PRqASQbytKEZoDsA7l2dtXQd8NWngyBLLpwylI/QN3JHfJgGyMuu+0Uv1ipT5bm9hbmBCt2blbH4wMIIW1FhuZr3sM+nX+dh91C3/neaspdER3JYtGl+MCZaEuxBVepgCj+BF7VPluhb1FcWQIYwTLt1bOE04ksG2kLqjWg6DdlJNxs3WWv4zjCM7xNet4gTYKu9UB2yrdIyhQaSF+rgoPMA/IIiZ8dj9S1tf3/6wbK//0gGGakfGfAnn/tAijFn5fGOpx/4R/ZEFJalg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2+c/cP7bcshwyqqC6QbecqSBUwnPyYlJSid3zEYyEg=;
 b=nxQwZBTtTTZ1hFYpxdaIGi3jffOZ6SuWhFyhxXS5PQ8/EL4fCSt1vrsGjjI3vO0MWeH3muDkDgsjp3WpIRsyaa0Vlriqnk92XaEOFBAwvUiwJ5esC0v5+WyY/YKk0PfMBtchdaSGlFSlQrGjpIN6i5Si++15Wxmhgw0hB6cY9BgdEx5C34CJVd7W39WFihKY5KHDER5UfVhvKAe9Eu9OkzqonEKG57XEL7CUZZduAKhPWg6iUdlGrB+Q05BK2G+mdOce7UagcUPM7q7XKG2cc8gqXUcmHTNbyTlQyEHd7cSKIkk8NQKMOx9JROu6TKThbvoVmgRTn+9nvh8IDUAXOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y2+c/cP7bcshwyqqC6QbecqSBUwnPyYlJSid3zEYyEg=;
 b=HHYPFrgSQ/K58lxu/muq020DYHx398i1lT8s0qAaITLUfYkRFJlbK8Ftovt4RrXabL3MAkXZLzD7MIPsJevH2Nt1YYvd6F/nAvmeDGPnV5oSbr75ByMqHoh+JjWzyAvgS5S2eZfpFyAHnnHnUlre/5Q31QnVTU24Pfh3npU/WWo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM6PR12MB4220.namprd12.prod.outlook.com (2603:10b6:5:21d::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20; Wed, 28 Apr 2021 23:44:05 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::595e:20a2:f658:a7a5%5]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 23:44:05 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v8 1/1] drm/drm_mst: Use Extended Base Receiver Capability
 DPCD space
Date: Wed, 28 Apr 2021 19:43:46 -0400
Message-Id: <20210428234346.1085977-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428234346.1085977-1-nikola.cornij@amd.com>
References: <20210428234346.1085977-1-nikola.cornij@amd.com>
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14)
 To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0001.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.24 via Frontend Transport; Wed, 28 Apr 2021 23:44:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9a53d8a5-a00b-4c92-6bff-08d90a9f8273
X-MS-TrafficTypeDiagnostic: DM6PR12MB4220:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4220F2D6568FF354E209719FEE409@DM6PR12MB4220.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:186;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2oal4f26jgpNrpDQ1T15TcOYhfYYxUHSZiQoq47pgGU4d+hERyw2yg+7QDHlo9UfIrAiiscEX2LSGLGtgK1PLPXOeEoYdhP3Jzfea5roVrknQcyR6MyD3g6B+SqIA0YbDhUJNRbTzWGWhnba3mgus3hhb2FkhPpjaGTsKpujFY4B1LN8iatVyjHJ3nln/eZCjI3/hbVS7gd0lW4Ajr0ySYFGjhm82SFU7Oddub9bMAxyCQsb/y2FPwv4Wlxkbxlsz80olDvp4AP6JlPdCxq1tQ0Ixl8c5dwGKKe8jrJKDo5zbLFggKtjQo0Z9Q9VnXWL2GU49k0zjl0bbq7jc0TbEE8p+h5BYfMuEZjv32VOP+rnJvHwrBiAlJ4KI/QErMq/kgW0mRiXILerJANMbgQG67l2+Uv7RnvSFPEqnf22IMMad2hfLwHsDSuDD2MQRryMDFF3IY/1VqEKpKz5wTVMgPEEmT3Jo4AiyqKTDUhJYb5YXRbsMHrhuod8RuB8O/VRp0kPQNs4Ml/U+Tc7Rj+leYMDfQVKfilvBAunBrhEMf975D6/TbVxyeDxhQlWEkDkvGj54rhtp2tf4IHUnqieEdYNzc5fY8QGK6iFdogVOUtT2GriHS4QuVIfTsADyKvew0Mmjq+F+xq+q8XV/Iom8MoAGEz566olNt4YXU6j7IM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(38100700002)(6486002)(38350700002)(86362001)(8936002)(6666004)(66946007)(66556008)(66476007)(316002)(2906002)(16526019)(6916009)(6512007)(83380400001)(478600001)(8676002)(186003)(5660300002)(956004)(2616005)(1076003)(26005)(36756003)(30864003)(4326008)(6506007)(52116002)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?+FrLTDsWvrNnYdmJfsDSZOkZEA0WLEDkR6mV8OvUhvoUZI+iVlpz1lM0J5l1?=
 =?us-ascii?Q?sjv1i9LWREUGriLAtP2++MY6c91eqGKNJCMHaFYuSyq4nP29gHIHvc18K9km?=
 =?us-ascii?Q?S8PWoMoSkaJA54qych8fTDvSy7swYNnOTETKCOqbGyXX8okOoSGeQn1H7XMa?=
 =?us-ascii?Q?nWz81t0413Ixei78XVeTgUOW0cbZsJow1po3yujEFii+IaYXz0adakMPMVN1?=
 =?us-ascii?Q?eqkMHMyE8LOl5/km59pc+sBPacgPDowCqgtUDs1GLiFgxDTb4TWJlqsy9bgc?=
 =?us-ascii?Q?5oyj3Yh0cj5QDXOk7mWCEGvatpnC2KYUHGigOoVFZiHjUr3cmM9POtyc6zrz?=
 =?us-ascii?Q?48sJ38VUgCyaCIDbpk7DtNTz0MI7tsLd65CiN0g6i2rJecJnW5XwbO/NKZdx?=
 =?us-ascii?Q?M7Js+Qm0iY6yDZcMp1P7V8XoreCsCwjBmNyIbUaPHYJZXAhrfn2lRgfEB1JE?=
 =?us-ascii?Q?fMRLwBfZMhW1PusMt7xyMsLMQGyGBWQWWYcpipOx3ler/art01XP8Wa/sdTQ?=
 =?us-ascii?Q?OTnOVbzMprcVFB7JaGpfItjooOQS9BywRwKhMVEGnEKQ1L5LYpY71Jm7iS+D?=
 =?us-ascii?Q?TUBaQaj9XEq1ySsZ7+/cSpXLuzBeE1QZGAIAdnR64Ke9Mo/6yy6YUyyMTltt?=
 =?us-ascii?Q?+fUgoAVBMiaJtcW6KivX6dk1/GM8orHg7PIa3lFITeLvOjVoGgYVaUyo8IdN?=
 =?us-ascii?Q?3/Ii+Ek4jgMTcnf5dLLvz/YV++30Ao9eF5qlppHfzy2Sy/cLH1i6J3A+moE0?=
 =?us-ascii?Q?BVqQaryMLFcydFFipqhfxgdamiwyqbRwH6YEh5k2AdxizSMiNywLWweymoEz?=
 =?us-ascii?Q?z2S9HTVTL1pjwN0bls3OOglqZaRLgvlS156XQREKpsm/aAusEPAmwRtxgQHf?=
 =?us-ascii?Q?bZLl9ONYkAgZ3Hva1AtKUNq3htd88fFY8xir+ycfSyMG2P/SVbfKTL2Xaxen?=
 =?us-ascii?Q?wjJCUbThnKE3XCcvBuRuCeVepBNtLA0suW49IID2BLL5+jx/fChA0OJNoPUg?=
 =?us-ascii?Q?DVz5cZzBLrOIU5RuwK/ldEyf+nuMYwSiIgikNnpF23P92YKeUnVckcKeSs/+?=
 =?us-ascii?Q?z0aNdHNXhLU1n62tazIZ3LoiaFIlAV98rVJdPu0jjE+4IwXnaM9VKtH0mOKR?=
 =?us-ascii?Q?MVRiOsNDQkw4cNRGI45BFsprPh1+D8MGck1MkS/PyRTJkcAez7EQpLPpIVNg?=
 =?us-ascii?Q?duRC/JPRPAMHKHZ0jaxwE3CzzenP2FIVmLu0dBvdfyC1++HM6lalsy5/z2qO?=
 =?us-ascii?Q?XuiSU8Iz+2QE0CZgV1r1hcrFPYPAa+8GIaC4IZP92Q2Ej5yrsPzuJLA7pNit?=
 =?us-ascii?Q?smFcCGhU1NIdwPprPZ60XsAP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a53d8a5-a00b-4c92-6bff-08d90a9f8273
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 23:44:05.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Y6zd+KxGEfn5uUn6W9k3OGlCuEXF1Klqd4r6P+gj5vCofaPJrh8KW0QG5qZwosRQgigeWGH4udAUm2W+uI6ZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4220
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
