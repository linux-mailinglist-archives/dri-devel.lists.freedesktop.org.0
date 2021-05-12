Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0B37D45A
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 23:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E658F6E566;
	Wed, 12 May 2021 21:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2044.outbound.protection.outlook.com [40.107.220.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A71026E546;
 Wed, 12 May 2021 21:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAnxhyqReTeHTy/+ZqlWw2PyjSzhfRSgAFInPTQOF+ZwCcw8qZzteR4lIKIgsWWU7kCK2lhtIGYfrGdDs1dyDHKyn4fExBYUbvjSWxWiKl6tNAg1NsWxoKixIbA0jC5kXyJIJVFjXY7NKIB6JhFbRpR7EEEpr1wAJmXdvih1ZyTaLkjf17qTOM4DFSDKrM3CTT06bt03ZrkZqZGNCEfspG4NQ0xFgf+G6euhfGipa2lTzr4WArv12+bX16DnQnJ8Npvhb9X6tYoe3OQJxtsBRaKdlhgYnx5R3imIjlVa+/F/IcjZ91K2eso7VR7KgdfV4knFDRLQ+GtL9BXXsZKJpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnMEVH8nU7MJt9UodI7MnWs/p7ZqDcNX7F9qyiOmCKI=;
 b=BQUCQeoZ0yhaYF7WQY93GA5uIqmQuc6PYAlAYu6SIcWQLDSCbjBLLWN9X9xMtb3/fDoEeb5NhRSJGX7l4IM0RdtzA81rCfWrTe5bmlgjejbbdYhJDIZ5nsLUetxIrSMr2Xjo+BRQ41c2i51cRVZi1sCwv/7VCodVqmsxDex6Nm1KgFCJZhbVoThnR4M0kM4SODX2RqjtXDWS1j54Bn3cKwINvATOfA2+DEIk0QK/YksqXn29Wd+Mlov9/F4W1LO6Wh3z1hFJQFt1KxVleQihwoHGdwAuvysUKE+VWz+BDKfhgNw1xmJWlEiih2GBbXRuoa31DRnSrx8ah6x5NTpLKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnMEVH8nU7MJt9UodI7MnWs/p7ZqDcNX7F9qyiOmCKI=;
 b=DYGUPfhYRtzg5MGaD7qeNXVJ1Fig0kpKFTHQcznEaECAqKVMlh1xz5yUVOJ1zCKvwA8t3QULZwt9srqWFOi748NBoEl+UYrClqzETPd4wiLEwf5jNmGtuQX6H8c0hz7jPyENfuF4PKNM6CW5Z/MHJwFk0OQ02HTraXeby++LIys=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB4679.namprd12.prod.outlook.com (2603:10b6:4:a2::37) by
 DM5PR12MB1834.namprd12.prod.outlook.com (2603:10b6:3:10a::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.29; Wed, 12 May 2021 21:00:33 +0000
Received: from DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::b5bc:c121:c4e9:d4ea]) by DM5PR12MB4679.namprd12.prod.outlook.com
 ([fe80::b5bc:c121:c4e9:d4ea%6]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 21:00:33 +0000
From: Nikola Cornij <nikola.cornij@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/dp_mst: Use kHz as link rate units when settig
 source max link caps at init
Date: Wed, 12 May 2021 17:00:11 -0400
Message-Id: <20210512210011.8425-2-nikola.cornij@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512210011.8425-1-nikola.cornij@amd.com>
References: <20210512210011.8425-1-nikola.cornij@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.55.250]
X-ClientProxiedBy: YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::19) To DM5PR12MB4679.namprd12.prod.outlook.com
 (2603:10b6:4:a2::37)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu.localdomain (165.204.55.250) by
 YT1PR01CA0110.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Wed, 12 May 2021 21:00:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d04f29d5-b994-4c96-1d5f-08d91588fb7e
X-MS-TrafficTypeDiagnostic: DM5PR12MB1834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB18347887052E7C5000EEF323EE529@DM5PR12MB1834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1751;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AKUCMa/u/qYJsjnv6YRsGdsi41tarAKx1X8pL7XQDGYz2rxFFZK4FgvoB5zXqfbTIIyY8mgXXjbccBFNZtlcshUXyr+JDH2X1Ug5jZoEwUfKwRcEYgb1iwc5R+qRMZ4bdDx6pmKt1+Q0M+/xSUW73piFht4VnDbG9geucqrmfh95NewkSyC7HQqkLZPubdj+o/WNaVr3uuKPwOIoBPSUVxdKd6v5aKTJSVjOJyUif1Gg2oPdTxxxV/eFV6SzVFbJYHl+BnUPWK84TXzVh473/75T9TSoeJziYznhwYM4EOUC0fMZyY5zMFaAMtNxRGTkUhzT4FcLhcizTLezPhSb8Enk+MTijgwisLeUqGYyoGupURh8F9dL2OQGyYciWLCgMMRdjlzqo5CzdxfxZyk2lrSa77E3S7mvtPA2xz2b4FW7WBcM+ZaSiOFW89nPdmveoXRuc07U5v8wiKx5kOsWLuClXMyecA2Qn23Mep8fXf1oVfMbGzEvI0bpdgZ1gqARpr6yCOv/YzjjeTjCqm3K5fOjx1B5J9VPyUgrSKFl6S3++uwBH4Ht8A6Z9syS+UhsbczqgCEwMWJbSXryBbX3xz31Fz8LZEuyUUgurlAsnl/ixgmRsC3LdqNolCdd+7ayoIFeeycWvA+YkNcLhI0wkQEbzVGE5Budpw2uIwGxkyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB4679.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(39860400002)(346002)(366004)(136003)(66946007)(6512007)(66556008)(54906003)(2906002)(83380400001)(66476007)(7416002)(44832011)(316002)(1076003)(86362001)(478600001)(36756003)(16526019)(4326008)(52116002)(186003)(38350700002)(6506007)(6916009)(38100700002)(8936002)(6666004)(956004)(8676002)(5660300002)(26005)(2616005)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Pm75K95tNkBBwmWhs2R/RvNRRDqAN3FLINFWNPIncux0VkqRwsp88cz54smM?=
 =?us-ascii?Q?4XTYmr2A01x1+Fn5k+4FstPHP5j6hU0mhJ4dyGBsPJwXnR/1WhjUeK5DM2iR?=
 =?us-ascii?Q?s2wOAhPi0t8qqLpskoSRsx9CAGmdavJNrQN7Lh8Kq3gGm3fjGBHUWKC48l6h?=
 =?us-ascii?Q?0wZ1+67lwopZzGphEeZdYn8DbjNUTUh4bS+HrH8ugL9NX9aMLU+cQoRe9j60?=
 =?us-ascii?Q?2/MwaechfDT9QZywWhNzoV6FAXTxeKBO2BmHE7c1//+7UlKlPpDV+3E66IFn?=
 =?us-ascii?Q?bYSaNvw/MWMOF8zJ6ifY6N+Lj+zDCqJ2zivOmJTY0wnCnp+URTcbYtNHevXQ?=
 =?us-ascii?Q?5+D0tCxK6TuLslNImgFLJiIEorbKwtISeUJOKSXyBoGGmrvlIREvgRX4y4L6?=
 =?us-ascii?Q?IkguddF+m9l0W9tSpVbVk9G4TmX2oxVhXDf9BXiYfdJ+HUOgZl6J5lHkYd5h?=
 =?us-ascii?Q?/wDFZcLS9oX7072Dqpo4N4zYQPTxZTCuVb9R6NnTr1NX5lELEB7qmUU49eT8?=
 =?us-ascii?Q?C2mJKZjH7kftefaU881hNC4FOuVXfQ++zb/Z4LZ8I3vKvKx+lh6ms9FrWCj1?=
 =?us-ascii?Q?Y5pjPmLBrRm36F9uI+UHFFHaMmJD+1jaJ2CrKUvZ1swwM1yH22aU3m8pwOLu?=
 =?us-ascii?Q?Gkcmjha5vyJ+Ou+uApJxoaa35wsExyq9h/1sMTn0H51w1NrqiukxOM7Csoio?=
 =?us-ascii?Q?X+etnpT6UGuQRSuVTECXm0GUxAPB1CK6qjl4Fy+yysNYmqKnA5EBeIcFs86D?=
 =?us-ascii?Q?M8I0ByawnE9Nmsr0n+YvwvI11+wpj1/bPTo0K1pdxsDjLOtFO4VrqrOdmzk8?=
 =?us-ascii?Q?l3W+sWpxYW9vSRLpkGv22bBnuGPIx0yS8grS0qAArUvtGK1inXTOPqzqvx0U?=
 =?us-ascii?Q?Bys2avWWHF1GUCu7S73v4Np3G/z1Ny5XB83/ArA0oHUFcZNqBDb4tOrmbweT?=
 =?us-ascii?Q?YOndOsT76TbngCo7Zk2CkDW6Zn8v2uGApOdvoQAk0b4QSHuYJXsIQy8h8XpW?=
 =?us-ascii?Q?11vfTDLMbmat9lag0MPjnclGVuznk1seL6/qG5rTXWuKFm/XVZEdPV1VXw52?=
 =?us-ascii?Q?7Cd79tWYlniLZ520KEAML7wU/SkRSJM8FSr1kOA31PiWEN14P2Xt6oMescv+?=
 =?us-ascii?Q?llUb77hDedsNvh2JZ6mQoAsSlOV9mKSq48f1r/3yRZrHYpLLJgQVvBd6iqbB?=
 =?us-ascii?Q?EGgaA3QxgbYIvT2zST4Hhsj5yg72tu3hKQpgsXW38dIwm8ks9nhwK1UBPUuQ?=
 =?us-ascii?Q?43Wu+ABr7HM2CL9A4ZRg2OPkpiWQu1/citQeV3BS1eH5m2gkF+R35TPBqTLx?=
 =?us-ascii?Q?rnV7iYVmdFy8Y6SCo1bwjicQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04f29d5-b994-4c96-1d5f-08d91588fb7e
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB4679.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 21:00:33.0436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: loSnYW2BMMhxrkwXE84NoZpltAakoFPf0vWIlpENta9jubFfE7yvhdm7h92jZlOgoaOwfL2Pbutpx0KUgYVCGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1834
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
 James Jones <jajones@nvidia.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>,
 Leo Li <sunpeng.li@amd.com>, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Chris Park <Chris.Park@amd.com>,
 Eryk Brol <eryk.brol@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Lee Shawn C <shawn.c.lee@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c   | 4 ++--
 drivers/gpu/drm/drm_dp_mst_topology.c                     | 8 ++++----
 drivers/gpu/drm/i915/display/intel_dp_mst.c               | 4 ++--
 drivers/gpu/drm/nouveau/dispnv50/disp.c                   | 5 +++--
 drivers/gpu/drm/radeon/radeon_dp_mst.c                    | 2 +-
 include/drm/drm_dp_mst_helper.h                           | 8 ++++----
 6 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index 4a0c24ce5f7d..f78dd021f591 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -458,8 +458,8 @@ void amdgpu_dm_initialize_dp_connector(struct amdgpu_display_manager *dm,
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

