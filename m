Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE837D03C0
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DF1E10E549;
	Thu, 19 Oct 2023 21:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FAB310E541;
 Thu, 19 Oct 2023 21:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6DzmsOsfdENv2py6IejkBpXB56iKaSXiDOZ8XGMEKFZydxPqZ5uH3USOPNSt4btqWZp/3ZM00hHrrX7S86p/qaMjTbnb8ie+0GJM81QVTFqEWmLeluG1IbxbTwZapQ/3SFxcX6rUQ1Uy2W6JHXQ7qgE6XJPFjES2s4yhinFg9569r6nOm+FKjTZ2WcwROJfAMkJBzn0Wa63rI5BlEAwMN4+iUOD+td6oFnoPa6BgV78OcpjZHZ5o8A4KhuQ0K4LsFfrsbJAOKGlQj/khvH99WDe8Ktsl31LTbUqiAVkaFEBiGZx65klsrE4L7OtVXcLF3ErR0WVjE6CXaJz8656Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yHyXy2hciyvSg0ekbxocZTuk6pic7viaylZqPDJMptk=;
 b=k8vV3ZfiN8o5MjAQuii+0rjUhHBdEtT7h09c/pgH0Gmr9og3dmAv8pjZVPfasEkXKQCw8ScNgbyuW7XghwcbPkgE8bqP/9/VnGxMfEqlrR2nOex392gfCmrwoy1a5NkPs8uCKTnvq2n7ASXnMqj57DtyBc+zMzczX6a1mXoJxmMrmSrHjN2WH50rO20zlUwZn0iK8cNdlFJTGIil3TeT71j+OMS7bk7grzlc5VVJ5NMOIJ86kdCsEn4gCBc6qgNoD+qIQ2NB5Zb8WybZbmrGRU8XTd6esq/Hdl68zw9G/UCPrOA37QYoKWPdHS6SY1YclHjZzUqCy1ADQ6/cnmHjMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yHyXy2hciyvSg0ekbxocZTuk6pic7viaylZqPDJMptk=;
 b=ZYlcr1dAVzADDioQfQ/fWgFwn8BkNrTaPlE4hIy55FItJyjcTOO70//5ChGjhb8ZyeQLs1RjWqwTqBWm8AqC4dlXNieblCP3nHhjrQiaGgnRqGXkGLkCD+MC0617ko/hTN6dWbYFstcUAE2JAdOYJWR+1IfUasrnonMlD/1uwc4=
Received: from BL1PR13CA0316.namprd13.prod.outlook.com (2603:10b6:208:2c1::21)
 by MW6PR12MB8833.namprd12.prod.outlook.com (2603:10b6:303:23f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 21:21:56 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::f4) by BL1PR13CA0316.outlook.office365.com
 (2603:10b6:208:2c1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.8 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Thu, 19 Oct 2023 21:21:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:37 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:36 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 01/17] drm/atomic: Allow get_value for immutable
 properties on atomic drivers
Date: Thu, 19 Oct 2023 17:21:17 -0400
Message-ID: <20231019212133.245155-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|MW6PR12MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 7da49bb6-3aa2-489e-e355-08dbd0e96b6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nXoJBDoP+N0pUtGru7qRSihG2Ya756MUavZyf6vfAQOgG61tEtdZM0TmPTnMyllVUVUZWfsAyauTqS/Vwp+/w/FTPWKbJZzEjBlyD/jlbwgss52ZyBSCNQLRphJ2l1Dd1FAB74cNlms++ATF67q6qEXSLcANeXt9EBgT9aJtjAm2uQ7zGfSB6WApJrKmOkV9m7/HbrNoriiMs7pTXd2CdyRi733vQaHLS8Z/cmIQbqZxVRk4EleoNsTjIvlrDftDMXxu2o9gSVJfg2cSTP6C7GbZ1Wrn6VxDQrp3Fz4lp3kHRfFfySdcmS95DmN7nLBmdOdmRLDypQqrfLTB3F7d7lPQxbEATRH13tHwkI5uIqm7vQbv47cW6sWCeLtElUfGhVE4juOBiOWOfh3a4U7eoQLo2RNaWVu/DZW/U249o7T+bSgKxJ6ZIEsVelKf3kYZCMHBYE43iIg/M1tUkGXCR4LR8xFNxXl3BBhPcEJp/PfSgBESpSpEMc9A30t5dvAlHrmnnjdNNkboT/vqCO8wsITleewYOHgpxeAN6c+rW1AWmTd9MouNi7dSw3ZoRuDYcD4af5v5zn04h3+yb0C03xaD7LXYbKA29rsfGMXQvsGit2V0p1mQHN8tmAcY+hpsdMrA8y2nTPUFB7t0MSyRi3ThQwou55WFEsx9wbhTq6HmxBpz2Lxw79FkbZUbWl1VoPErDZB3Nqft2k489QUUbe2hoEchGWpWMXzygZEB+iA11o8p8YV/6+bFbFGNtZdRcUoGiqKQ5BZLlQK9retiWQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(82310400011)(64100799003)(1800799009)(186009)(451199024)(36840700001)(40470700004)(46966006)(478600001)(6666004)(7696005)(86362001)(356005)(82740400003)(81166007)(36756003)(40460700003)(336012)(1076003)(66574015)(36860700001)(426003)(83380400001)(316002)(70586007)(54906003)(8676002)(8936002)(7416002)(6916009)(70206006)(2906002)(5660300002)(26005)(2616005)(4326008)(47076005)(40480700001)(44832011)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:55.1000 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7da49bb6-3aa2-489e-e355-08dbd0e96b6c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8833
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sebastian Wick <sebastian.wick@redhat.com>,
 Shashank Sharma <shashank.sharma@amd.com>, wayland-devel@lists.freedesktop.org,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Naseer Ahmed <quic_naseer@quicinc.com>, Melissa Wen <mwen@igalia.com>,
 Aleix Pol <aleixpol@kde.org>, Christopher
 Braga <quic_cbraga@quicinc.com>, Pekka Paalanen <pekka.paalanen@collabora.com>,
 Hector Martin <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_colorops use immutable properties, for type and next.
Even though drivers create these properties at initialization
they will need to look at the properties when parsing a
color pipeline for programming during an atomic check
or commit operation.

This aligns the get_value call with behavior of the set_value
call.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Harry Wentland <harry.wentland@amd.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Shashank Sharma <shashank.sharma@amd.com>
Cc: Alexander Goins <agoins@nvidia.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Sima <daniel@ffwll.ch>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Naseer Ahmed <quic_naseer@quicinc.com>
Cc: Christopher Braga <quic_cbraga@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Arthur Grillo <arthurgrillo@riseup.net>
Cc: Hector Martin <marcan@marcan.st>
Cc: Liviu Dudau <Liviu.Dudau@arm.com>
Cc: Sasha McIntosh <sashamcintosh@google.com>
---
 drivers/gpu/drm/drm_mode_object.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_mode_object.c b/drivers/gpu/drm/drm_mode_object.c
index ac0d2ce3f870..c9b1cd48547a 100644
--- a/drivers/gpu/drm/drm_mode_object.c
+++ b/drivers/gpu/drm/drm_mode_object.c
@@ -351,7 +351,8 @@ static int __drm_object_property_get_value(struct drm_mode_object *obj,
 int drm_object_property_get_value(struct drm_mode_object *obj,
 				  struct drm_property *property, uint64_t *val)
 {
-	WARN_ON(drm_drv_uses_atomic_modeset(property->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(property->dev) &&
+		!(property->flags & DRM_MODE_PROP_IMMUTABLE));
 
 	return __drm_object_property_get_value(obj, property, val);
 }
-- 
2.42.0

