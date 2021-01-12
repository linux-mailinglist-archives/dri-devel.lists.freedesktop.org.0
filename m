Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48A92F334F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jan 2021 15:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7BF86E2A3;
	Tue, 12 Jan 2021 14:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2045.outbound.protection.outlook.com [40.107.244.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E326E296;
 Tue, 12 Jan 2021 14:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fG/0+61KD8MGaTdPlR0+JBkFfThPJc7eMQPdHJ7azlMjmOWTFjGOyQQ7ReCKdM52hcIaYFPcbzG1HbIuExStpcj67AO8qh02TQSUVqrcxRXu6UYpxHBLieL6ptb7xIg94GKuNNBC6hxALWAOlCRfUordVvwNvKFMB/qSSIYmnIbvOeOgnIyrZogweVcoLll3bafl8ypyEzoRIWPGcXoFC8QyrpY3YQB6tQvoxZOcssl+o0aYfZNl5Bn7Qiq9VicMyQqhw7bOe7DwO8L5hMmJBoAiDeJXt3sBw7lipVOUYJTnR5d3Bb7gAv+gCWw3JraAveLyodfmiKNFVrQbmExtQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCHd40TxyFOTHxmQBSo7ZzU6P1r/ou7UfFpEANxIHU8=;
 b=nZNUSsugpA211xmdlFaIc9dlTQuBWq3nixnbfpHnvaONq9Q7VWSpADpYN6eAmtuDmg89xirO8DWhK0XQJI8sXczDXS2IhT25DCZlWglWVt6/R2JzHwzLWuVVEvD1B/kr/arUgcR2NBlZumoWDyQ41YwhaiJZ+xBM2i5bSXLHd6lGKPZQZ2gGSFZvilXx3ueMnR2Yv5909WsO+hYdHPWCXnO4I16+IklwarQLwnomiMf+b8+ATud7E3R1M7CLEIDPeoJEN/yZMbGrlMyL5eYl4YFRYkhcQb91IBKrFsMQIArLk7P9lgdr49g2+OkgWhP0CWsEn1h08Y8aLvr4QQJ9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oCHd40TxyFOTHxmQBSo7ZzU6P1r/ou7UfFpEANxIHU8=;
 b=QcxKF5W6fWlw0W7DGYYgeNhZ7jbWDeYZviwYx5f2FI7+FcuCw9aLMm7hcjzZIdwB2ORS44sTVD3MlC0ackJqrymnB7ubByoQ9W3GYyKF7GqOhJjKl5UOSwSPjcatYyqZgpN7vb7HKD3NbbCWTa+yq09I+Iih6YRUfs1wgf5ugUE=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1753.namprd12.prod.outlook.com (2603:10b6:3:10d::16)
 by DM5PR1201MB2490.namprd12.prod.outlook.com (2603:10b6:3:e3::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 12 Jan
 2021 14:55:55 +0000
Received: from DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540]) by DM5PR12MB1753.namprd12.prod.outlook.com
 ([fe80::1cf5:9c9e:7374:4540%12]) with mapi id 15.20.3742.012; Tue, 12 Jan
 2021 14:55:55 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/4] Revert "drm/amd/display: Expose new CRC window
 property"
Date: Tue, 12 Jan 2021 09:55:07 -0500
Message-Id: <20210112145508.1564863-4-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
References: <20210112145508.1564863-1-Rodrigo.Siqueira@amd.com>
X-Originating-IP: [2607:fea8:56e0:6d60:24ef:ec9:b88:9a22]
X-ClientProxiedBy: BN8PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:408:4c::24) To DM5PR12MB1753.namprd12.prod.outlook.com
 (2603:10b6:3:10d::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56e0:6d60:24ef:ec9:b88:9a22) by
 BN8PR16CA0011.namprd16.prod.outlook.com (2603:10b6:408:4c::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3763.9 via Frontend Transport; Tue, 12 Jan 2021 14:55:53 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6794c571-afa4-420c-61fb-08d8b70a2a25
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2490:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2490F8352CE78B37BE66AB5698AA0@DM5PR1201MB2490.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:469;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: odtYpnw9yYxfUaBzVbV5oQlJEat9waJbtBKoCERDNFhp0WY4kJAjdI/LZH/0iBAbxHnX2+ouuZRvDtP24uuOfWkvV0ojDxlNpGRaKoJxIT4CPW4XYva80uIJL8YDrkxI/jMUtwoSNTgBdVEQigH0kWkKcbtTe1/fjITjyiBQcIa6H8wVDLF390tAEM09aceBk+9TP38GaJwPiYqRu6U6HGQrAtlcP0zd+YVFHAcwPtbeOOKOYgeWrLy6rrELmRzWZ8mDR0ZHUEUabbm+x0JM4Bm32Dq5rbMOhT4aFDdVJ4r5JBMEkO7ECKZeBDTVfpX45VF2uzdc8SX7OyhxBhQSSJv3Vj6gzA0+yABLOs9RcRHtRo3vtYe+7KW+Bkx/ySnIIzEmBAnh4dfZxP1RciLKGw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(346002)(39860400002)(136003)(376002)(54906003)(186003)(6666004)(6506007)(6512007)(8936002)(30864003)(86362001)(52116002)(66946007)(83380400001)(16526019)(8676002)(5660300002)(6486002)(2906002)(316002)(4326008)(1076003)(478600001)(66476007)(66556008)(36756003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?IaVUkV1gpMl9xhbJd+UWEFeOjKGCuGEQ3Z11M+1CnqSmz75bDsd1I2B+OXeR?=
 =?us-ascii?Q?ybO/HF2O/DfUssM+ETLIBeP+WzjCnuMqXcaI26ZtwEDu6nlp3NA7akBKCs3K?=
 =?us-ascii?Q?GQk3F3bNucs5ymZhSQUpScXX362DJDDY0+FsZihU9Zl9AkjHnm4KFG1m7Oec?=
 =?us-ascii?Q?MeaDI7KB0fPT8v7tIZxwzeMplPMDycd1/lzQw4X0x5MgBWwLggEdWmIwgNp1?=
 =?us-ascii?Q?O5jHhB6e26NDf+THs7pLPLvBvwGgxKAm3YUr6hE03CS6pxhn3SBrH8fPpoEa?=
 =?us-ascii?Q?OiWXX6hnJPAqQKIVmr/7uosw/H17SCM60wzotu1d+sV6zKOCeYmflXR1Zz2j?=
 =?us-ascii?Q?lffPL7F0AcarmYW5KczJE2GV1ejuMjn9sGpcRgSfrNv4VC/dcbUt2u3T+H/N?=
 =?us-ascii?Q?PCLKg2nqwO9Sa63ZicrO7/rrda3ndaY0MUdeK4CdLgWY4WxVefLn/1Ily+eo?=
 =?us-ascii?Q?r9LRBUwFbLdx9QXIOC4Rsa8PADJSFm2sUKIQWxZ88iFhVZspgCqOh42Xcyog?=
 =?us-ascii?Q?rpbwvuRzQtUuQfRIuG27TqbMVooSNL+ST3Sl4tyEff3sED1tMotkopQaxfYr?=
 =?us-ascii?Q?OHLVjibdJqQmF2/r3wKSFzPZ6Abj7ldfumwfk3si+xWdP8+r/Aw9IoHKJzjO?=
 =?us-ascii?Q?y0B1Uno+ZvoZicdcUSdv6WbmsQB+3StZNk/iEyGW39A5UOED3DZJmh0OVgSV?=
 =?us-ascii?Q?q2X48cm/j73xGCNmitnzwtiAvtnSnjLHzRA11HakUEmBuHjXLQR4W8mkUdMn?=
 =?us-ascii?Q?R1TcFO/G0jqJz0gm8WNSq8BQnppGYbahXSngkJtQSBurX+DmF08pKEIzSTX2?=
 =?us-ascii?Q?HRm3bZ31uRTPfRcxj2/bYkk919PfC975PWAfcQ56l10EfJLomkwwCDOKldIQ?=
 =?us-ascii?Q?hA557f2W+Bvp99+XvyhA1n6c/BydgABLuPOyKRMliFsA5qeVhs1Ha30qR1SI?=
 =?us-ascii?Q?yb1jmrIBfTzM7dP+t66DyLGNjvj9jAYkaZ+BXSHN1wK4QjV0wRcDOc6NIv5U?=
 =?us-ascii?Q?j1/1B/BOj7d8WbQy2Rt4c6+w73bCVJ4npNCD1YWQids8oK/btEiCnoiNh63Q?=
 =?us-ascii?Q?sOPEO/1m?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2021 14:55:54.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6794c571-afa4-420c-61fb-08d8b70a2a25
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0AlgnpYMReaoPDColrMEJIfPl8MESACJoFlJlh5HZdGiPvC2320JWdV2+R8x3bJwdonM0iVHFcGAx+Qksz+Dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2490
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
Cc: Roman Li <Roman.Li@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>, Bindu R <Bindu.R@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit 110d586ba77ed573eb7464ca69b6490ec0b70c5f.

Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Alexander Deucher <Alexander.Deucher@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Roman Li <Roman.Li@amd.com>
Cc: Bindu R <Bindu.R@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 142 +-----------------
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  19 ---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c |  56 +------
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h |   3 -
 4 files changed, 10 insertions(+), 210 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1ebd83337e29..3f1e960b1d84 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -938,41 +938,6 @@ static void mmhub_read_system_context(struct amdgpu_device *adev, struct dc_phy_
 }
 #endif
 
-#ifdef CONFIG_DEBUG_FS
-static int create_crtc_crc_properties(struct amdgpu_display_manager *dm)
-{
-	dm->crc_win_x_start_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_X_START", 0, U16_MAX);
-	if (!dm->crc_win_x_start_property)
-		return -ENOMEM;
-
-	dm->crc_win_y_start_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_Y_START", 0, U16_MAX);
-	if (!dm->crc_win_y_start_property)
-		return -ENOMEM;
-
-	dm->crc_win_x_end_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_X_END", 0, U16_MAX);
-	if (!dm->crc_win_x_end_property)
-		return -ENOMEM;
-
-	dm->crc_win_y_end_property =
-		drm_property_create_range(adev_to_drm(dm->adev),
-					  DRM_MODE_PROP_ATOMIC,
-					  "AMD_CRC_WIN_Y_END", 0, U16_MAX);
-	if (!dm->crc_win_y_end_property)
-		return -ENOMEM;
-
-	return 0;
-}
-#endif
-
 static int amdgpu_dm_init(struct amdgpu_device *adev)
 {
 	struct dc_init_data init_data;
@@ -1119,10 +1084,6 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 
 		dc_init_callbacks(adev->dm.dc, &init_params);
 	}
-#endif
-#ifdef CONFIG_DEBUG_FS
-	if (create_crtc_crc_properties(&adev->dm))
-		DRM_ERROR("amdgpu: failed to create crc property.\n");
 #endif
 	if (amdgpu_dm_initialize_drm_device(adev)) {
 		DRM_ERROR(
@@ -5456,64 +5417,12 @@ dm_crtc_duplicate_state(struct drm_crtc *crtc)
 	state->crc_src = cur->crc_src;
 	state->cm_has_degamma = cur->cm_has_degamma;
 	state->cm_is_degamma_srgb = cur->cm_is_degamma_srgb;
-#ifdef CONFIG_DEBUG_FS
-	state->crc_window = cur->crc_window;
-#endif
+
 	/* TODO Duplicate dc_stream after objects are stream object is flattened */
 
 	return &state->base;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int amdgpu_dm_crtc_atomic_set_property(struct drm_crtc *crtc,
-					    struct drm_crtc_state *crtc_state,
-					    struct drm_property *property,
-					    uint64_t val)
-{
-	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_crtc_state *dm_new_state =
-		to_dm_crtc_state(crtc_state);
-
-	if (property == adev->dm.crc_win_x_start_property)
-		dm_new_state->crc_window.x_start = val;
-	else if (property == adev->dm.crc_win_y_start_property)
-		dm_new_state->crc_window.y_start = val;
-	else if (property == adev->dm.crc_win_x_end_property)
-		dm_new_state->crc_window.x_end = val;
-	else if (property == adev->dm.crc_win_y_end_property)
-		dm_new_state->crc_window.y_end = val;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
-static int amdgpu_dm_crtc_atomic_get_property(struct drm_crtc *crtc,
-					    const struct drm_crtc_state *state,
-					    struct drm_property *property,
-					    uint64_t *val)
-{
-	struct drm_device *dev = crtc->dev;
-	struct amdgpu_device *adev = drm_to_adev(dev);
-	struct dm_crtc_state *dm_state =
-		to_dm_crtc_state(state);
-
-	if (property == adev->dm.crc_win_x_start_property)
-		*val = dm_state->crc_window.x_start;
-	else if (property == adev->dm.crc_win_y_start_property)
-		*val = dm_state->crc_window.y_start;
-	else if (property == adev->dm.crc_win_x_end_property)
-		*val = dm_state->crc_window.x_end;
-	else if (property == adev->dm.crc_win_y_end_property)
-		*val = dm_state->crc_window.y_end;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-#endif
-
 static inline int dm_set_vupdate_irq(struct drm_crtc *crtc, bool enable)
 {
 	enum dc_irq_source irq_source;
@@ -5601,10 +5510,6 @@ static const struct drm_crtc_funcs amdgpu_dm_crtc_funcs = {
 	.enable_vblank = dm_enable_vblank,
 	.disable_vblank = dm_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
-#ifdef CONFIG_DEBUG_FS
-	.atomic_set_property = amdgpu_dm_crtc_atomic_set_property,
-	.atomic_get_property = amdgpu_dm_crtc_atomic_get_property,
-#endif
 };
 
 static enum drm_connector_status
@@ -6831,25 +6736,6 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 	return 0;
 }
 
-#ifdef CONFIG_DEBUG_FS
-static void attach_crtc_crc_properties(struct amdgpu_display_manager *dm,
-				struct amdgpu_crtc *acrtc)
-{
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_x_start_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_y_start_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_x_end_property,
-				   0);
-	drm_object_attach_property(&acrtc->base.base,
-				   dm->crc_win_y_end_property,
-				   0);
-}
-#endif
-
 static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 			       struct drm_plane *plane,
 			       uint32_t crtc_index)
@@ -6897,9 +6783,7 @@ static int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	drm_crtc_enable_color_mgmt(&acrtc->base, MAX_COLOR_LUT_ENTRIES,
 				   true, MAX_COLOR_LUT_ENTRIES);
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
-#ifdef CONFIG_DEBUG_FS
-	attach_crtc_crc_properties(dm, acrtc);
-#endif
+
 	return 0;
 
 fail:
@@ -8540,7 +8424,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 	 */
 	for_each_oldnew_crtc_in_state(state, crtc, old_crtc_state, new_crtc_state, i) {
 		struct amdgpu_crtc *acrtc = to_amdgpu_crtc(crtc);
-		bool configure_crc = false;
 
 		dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
 
@@ -8550,30 +8433,21 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			dc_stream_retain(dm_new_crtc_state->stream);
 			acrtc->dm_irq_params.stream = dm_new_crtc_state->stream;
 			manage_dm_interrupts(adev, acrtc, true);
-		}
+
 #ifdef CONFIG_DEBUG_FS
-		if (new_crtc_state->active &&
-			amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 			/**
 			 * Frontend may have changed so reapply the CRC capture
 			 * settings for the stream.
 			 */
 			dm_new_crtc_state = to_dm_crtc_state(new_crtc_state);
-			dm_old_crtc_state = to_dm_crtc_state(old_crtc_state);
-
-			if (amdgpu_dm_crc_window_is_default(dm_new_crtc_state)) {
-				if (!old_crtc_state->active || drm_atomic_crtc_needs_modeset(new_crtc_state))
-					configure_crc = true;
-			} else {
-				if (amdgpu_dm_crc_window_changed(dm_new_crtc_state, dm_old_crtc_state))
-					configure_crc = true;
-			}
 
-			if (configure_crc)
+			if (amdgpu_dm_is_valid_crc_source(dm_new_crtc_state->crc_src)) {
 				amdgpu_dm_crtc_configure_crc_source(
-					crtc, dm_new_crtc_state, dm_new_crtc_state->crc_src);
-		}
+					crtc, dm_new_crtc_state,
+					dm_new_crtc_state->crc_src);
+			}
 #endif
+		}
 	}
 
 	for_each_new_crtc_in_state(state, crtc, new_crtc_state, j)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index 2a370d6a5a26..3e78baf59b33 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -343,13 +343,6 @@ struct amdgpu_display_manager {
 	 */
 	uint32_t active_vblank_irq_count;
 
-#ifdef CONFIG_DEBUG_FS
-	/* set the crc calculation window*/
-	struct drm_property *crc_win_x_start_property;
-	struct drm_property *crc_win_y_start_property;
-	struct drm_property *crc_win_x_end_property;
-	struct drm_property *crc_win_y_end_property;
-#endif
 	/**
 	 * @mst_encoders:
 	 *
@@ -436,15 +429,6 @@ struct dm_plane_state {
 	struct dc_plane_state *dc_state;
 };
 
-#ifdef CONFIG_DEBUG_FS
-struct crc_rec {
-	uint16_t x_start;
-	uint16_t y_start;
-	uint16_t x_end;
-	uint16_t y_end;
-	};
-#endif
-
 struct dm_crtc_state {
 	struct drm_crtc_state base;
 	struct dc_stream_state *stream;
@@ -467,9 +451,6 @@ struct dm_crtc_state {
 	struct dc_info_packet vrr_infopacket;
 
 	int abm_level;
-#ifdef CONFIG_DEBUG_FS
-	struct crc_rec crc_window;
-#endif
 };
 
 #define to_dm_crtc_state(x) container_of(x, struct dm_crtc_state, base)
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
index 7b886a779a8c..c29dc11619f7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.c
@@ -81,41 +81,6 @@ const char *const *amdgpu_dm_crtc_get_crc_sources(struct drm_crtc *crtc,
 	return pipe_crc_sources;
 }
 
-static void amdgpu_dm_set_crc_window_default(struct dm_crtc_state *dm_crtc_state)
-{
-	dm_crtc_state->crc_window.x_start = 0;
-	dm_crtc_state->crc_window.y_start = 0;
-	dm_crtc_state->crc_window.x_end = 0;
-	dm_crtc_state->crc_window.y_end = 0;
-}
-
-bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state)
-{
-	bool ret = true;
-
-	if ((dm_crtc_state->crc_window.x_start != 0) ||
-		(dm_crtc_state->crc_window.y_start != 0) ||
-		(dm_crtc_state->crc_window.x_end != 0) ||
-		(dm_crtc_state->crc_window.y_end != 0))
-		ret = false;
-
-	return ret;
-}
-
-bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
-					struct dm_crtc_state *dm_old_crtc_state)
-{
-	bool ret = false;
-
-	if ((dm_new_crtc_state->crc_window.x_start != dm_old_crtc_state->crc_window.x_start) ||
-		(dm_new_crtc_state->crc_window.y_start != dm_old_crtc_state->crc_window.y_start) ||
-		(dm_new_crtc_state->crc_window.x_end != dm_old_crtc_state->crc_window.x_end) ||
-		(dm_new_crtc_state->crc_window.y_end != dm_old_crtc_state->crc_window.y_end))
-		ret = true;
-
-	return ret;
-}
-
 int
 amdgpu_dm_crtc_verify_crc_source(struct drm_crtc *crtc, const char *src_name,
 				 size_t *values_cnt)
@@ -140,7 +105,6 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 	struct dc_stream_state *stream_state = dm_crtc_state->stream;
 	bool enable = amdgpu_dm_is_valid_crc_source(source);
 	int ret = 0;
-	struct crc_params *crc_window = NULL, tmp_window;
 
 	/* Configuration will be deferred to stream enable. */
 	if (!stream_state)
@@ -149,25 +113,9 @@ int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 	mutex_lock(&adev->dm.dc_lock);
 
 	/* Enable CRTC CRC generation if necessary. */
-	if (dm_is_crc_source_crtc(source) || source == AMDGPU_DM_PIPE_CRC_SOURCE_NONE) {
-		if (!enable)
-			amdgpu_dm_set_crc_window_default(dm_crtc_state);
-
-		if (!amdgpu_dm_crc_window_is_default(dm_crtc_state)) {
-			crc_window = &tmp_window;
-
-			tmp_window.windowa_x_start = dm_crtc_state->crc_window.x_start;
-			tmp_window.windowa_y_start = dm_crtc_state->crc_window.y_start;
-			tmp_window.windowa_x_end = dm_crtc_state->crc_window.x_end;
-			tmp_window.windowa_y_end = dm_crtc_state->crc_window.y_end;
-			tmp_window.windowb_x_start = dm_crtc_state->crc_window.x_start;
-			tmp_window.windowb_y_start = dm_crtc_state->crc_window.y_start;
-			tmp_window.windowb_x_end = dm_crtc_state->crc_window.x_end;
-			tmp_window.windowb_y_end = dm_crtc_state->crc_window.y_end;
-		}
-
+	if (dm_is_crc_source_crtc(source)) {
 		if (!dc_stream_configure_crc(stream_state->ctx->dc,
-					     stream_state, crc_window, enable, enable)) {
+					     stream_state, NULL, enable, enable)) {
 			ret = -EINVAL;
 			goto unlock;
 		}
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
index 0235bfb246e5..f7d731797d3f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crc.h
@@ -47,9 +47,6 @@ static inline bool amdgpu_dm_is_valid_crc_source(enum amdgpu_dm_pipe_crc_source
 
 /* amdgpu_dm_crc.c */
 #ifdef CONFIG_DEBUG_FS
-bool amdgpu_dm_crc_window_is_default(struct dm_crtc_state *dm_crtc_state);
-bool amdgpu_dm_crc_window_changed(struct dm_crtc_state *dm_new_crtc_state,
-					struct dm_crtc_state *dm_old_crtc_state);
 int amdgpu_dm_crtc_configure_crc_source(struct drm_crtc *crtc,
 					struct dm_crtc_state *dm_crtc_state,
 					enum amdgpu_dm_pipe_crc_source source);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
