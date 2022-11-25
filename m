Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D40626390DB
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DB110E7A0;
	Fri, 25 Nov 2022 20:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2574D10E7A0;
 Fri, 25 Nov 2022 20:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sz11yNfESJsM0dqsfqOgaigxjrrWlYyyhYoDvUzm4meUHbjzitCEYxXsHqtmljUBGKsWIhotYdWEBu6bjFGQImmF0+akD+peghofl0SVG2uRYjVhtPCRwetCveN8nUt6GqMoiFsX8GPSi1LI84xrI/9kwy6OZxtVi4NoNcrkKjz95nAwvq3cle9p7eLxxg581aUWc2M9B2+16eHRueiE1K7yUo0cIMxr9j4q2GOtybVC/paMT61ObQ4wMsNfHtuxIQ6ZrR4vTpFo29A5tQ0bcXx0/TSTOuazafi2vTY34WWk/fm3IRsZk2CaEi9kJOg/IUAH0G3QhHjmWUO52egXMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0cFnfo5yY4w9ku9swtap4o8e+iJji+2dML7/E3t5iw=;
 b=bHIZKweHge5GFMlw7VvwXBUbDpQ9uB5uPKQh1rjSmn6YvoCyaMDsgL53xTciWGY6+x0u25XgRxiCy/jH306Q2mbj1AMj6wBqpq+9Ko/ZlQMASDbBEodv0O5R8yvXmhzBSm+F7Jcyj7IAQzKwDOdIuejTq4+iy5qGpxiejQAjzt3Gs7ytIl5UFGoy/drF8+eNKkRpYu/ulpeVolVqEAS3orOu+DVJ+s15QI7S04sYdhQmOB/CXeykk5YreyuHacnOmKqWbIxYTFWXJZirHHqD9IrBOaYhlCOygdJnqZ8u9bBEw70ThmB0CfIYRUca5hahSK0kNbrGXMfbajpJBZXX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0cFnfo5yY4w9ku9swtap4o8e+iJji+2dML7/E3t5iw=;
 b=js5YjPYc38frnUDV9rbK3IvykQ3aKIKDiE7W3T6GC8552eVjeMvmnHjpTDBtYfVA+U2ESNAOjLx6rog1cjWDGlQ2E6qU6cWJ3/LqbB7BuQIdvvpx3YUVZNnnOUwkThDARsAfFM8jpK6yX927lNugCwBFEt+zU2D6DqVw4PTer4Y=
Received: from DM6PR11CA0016.namprd11.prod.outlook.com (2603:10b6:5:190::29)
 by PH0PR12MB7905.namprd12.prod.outlook.com (2603:10b6:510:28b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Fri, 25 Nov
 2022 20:50:33 +0000
Received: from DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:190:cafe::c7) by DM6PR11CA0016.outlook.office365.com
 (2603:10b6:5:190::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.20 via Frontend
 Transport; Fri, 25 Nov 2022 20:50:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT020.mail.protection.outlook.com (10.13.172.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.18 via Frontend Transport; Fri, 25 Nov 2022 20:50:32 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 25 Nov
 2022 14:50:31 -0600
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix PSR-SU/DSC interoperability support
Date: Fri, 25 Nov 2022 15:50:43 -0500
Message-ID: <20221125205043.373331-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT020:EE_|PH0PR12MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b65d604-60f3-4425-174c-08dacf26b20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sv3NUxJUjDw7KK0hEqxdArv2lIA4xnmPjLlTOBsVfVMXsGHwZ58SpKEsFUcjzoJIQGM5PvS4DYEOMBlM3iO1UxEeGLDcWbhhQPhJVawE8Q7gLE2lTaU6YLD/7rENoLnkFofaGfiIEuW/vO9H4wn43JbFDkvj9DN3D7On+LHwhyvdSmOKkvDiA0Z9x6K08KsjWRN0RiH7yGgD/18F82xctft3jv3e1KAZl/k3XubpjP36CM7AcNId3ng00gTyUBMM02HhXLsuwAhkQYrML+uj0ltcJHgyGiEYMRWMMShtj4mjqo1UP3flfq7+Jz2NeVp4hMSW6byiybKsfWk/86gmLZ652lhelAJ//ejoqOALY8l6D01duoxRMYFhbo1EzaXsGE0/F6u6J9+4lV6sremQFFZiuE5NP33LnDo04lVsLZRvgJjPNzO2KuTbCh573pvxNYvbRooxIZUQS5INRqmzphrRuxYFoABe49dI13C8ph8cKaJMtdvTGG3H4G6mm9sUJOnWWChcFwen2hcZWslJJbJv7chZDOBwDXfKCyI0xfyyJ/Wlaj1BYBCXJkcm1/QINfvOfPYUX6qvRhQtTyEmYjyeZuTTE+bg7zbKZSMO/a2Hrl2SB5+w+rBbf73bJpXaP3YchovZ98O3dUT1Ui9NSIyS6RkMpbLrsXQZ+j8HpnzT8U8PWLgdy43TOWHzcAsIGvtda7sQPGzzYZBdGyeP4mT3dCHqhhRhhlU5uwQarQYoSxdkYacx5uRXvE7sB6mmoLGlakPuLrrksjiniTtZPQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(376002)(136003)(451199015)(40470700004)(36840700001)(46966006)(86362001)(70586007)(40460700003)(70206006)(41300700001)(356005)(36860700001)(82740400003)(54906003)(8676002)(4326008)(82310400005)(81166007)(8936002)(316002)(6916009)(5660300002)(426003)(47076005)(83380400001)(44832011)(2906002)(40480700001)(478600001)(6666004)(1076003)(186003)(16526019)(2616005)(336012)(26005)(36756003)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2022 20:50:32.8434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b65d604-60f3-4425-174c-08dacf26b20a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT020.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7905
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
Cc: Po Ting Chen <robin.chen@amd.com>, David Zhang <dingchen.zhang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, there are issues with enabling PSR-SU + DSC. This stems from
the fact that DSC imposes a slice height on transmitted video data and
we are not conforming to that slice height in PSR-SU regions. So, pass
slice_height into su_y_granularity to feed the DSC slice height into
PSR-SU code.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
index 26291db0a3cf..55acadf0b63f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_psr.c
@@ -53,6 +53,41 @@ static bool link_supports_psrsu(struct dc_link *link)
 	return true;
 }
 
+static bool psr_su_set_y_granularity(struct dc *dc, struct dc_link *link,
+				     struct dc_stream_state *stream,
+				     struct psr_config *config)
+{
+	u16 pic_height;
+	u8 slice_height;
+
+	if (!dc->caps.edp_dsc_support ||
+	    link->panel_config.dsc.disable_dsc_edp ||
+	    !link->dpcd_caps.dsc_caps.dsc_basic_caps.fields.dsc_support.DSC_SUPPORT ||
+	    !stream->timing.dsc_cfg.num_slices_v)
+		return true;
+
+	pic_height = stream->timing.v_addressable +
+		stream->timing.v_border_top + stream->timing.v_border_bottom;
+	slice_height = pic_height / stream->timing.dsc_cfg.num_slices_v;
+
+	if (slice_height) {
+		if (config->su_y_granularity &&
+		    (slice_height % config->su_y_granularity)) {
+			WARN(1,
+			     "%s: dsc: %d, slice_height: %d, num_slices_v: %d\n",
+			     __func__,
+			     stream->sink->dsc_caps.dsc_dec_caps.is_dsc_supported,
+			     slice_height,
+			     stream->timing.dsc_cfg.num_slices_v);
+			return false;
+		}
+
+		config->su_y_granularity = slice_height;
+	}
+
+	return true;
+}
+
 /*
  * amdgpu_dm_set_psr_caps() - set link psr capabilities
  * @link: link
@@ -122,6 +157,9 @@ bool amdgpu_dm_link_setup_psr(struct dc_stream_state *stream)
 		psr_config.allow_multi_disp_optimizations =
 			(amdgpu_dc_feature_mask & DC_PSR_ALLOW_MULTI_DISP_OPT);
 
+		if (!psr_su_set_y_granularity(dc, link, stream, &psr_config))
+			return false;
+
 		ret = dc_link_setup_psr(link, stream, &psr_config, &psr_context);
 
 	}
-- 
2.38.1

