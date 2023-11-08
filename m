Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D957E5B64
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C8FF10E7D8;
	Wed,  8 Nov 2023 16:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0128710E7C9;
 Wed,  8 Nov 2023 16:38:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LvZTSvRgCAM8/rQPTzOj/ogK78u8n4QD4B+ood6tGgcGQewhYdQgXwQMX9FFRH74Pjo3/LXyHWiJkffMhP/GoZ3Hx5y3O0w1sWJjH1021qPMStSVy7dMFiI8m7BS/zGM98zIstAJWTzPAyBtSFpiKf/DS8v7x/6bz+wHJJRPBZd+fTH5ioTcEKLdwmZ+qJIrHOk5MCcDKfNsOh/TB4h2OJhYUII8PnqS+DEzc2cvADWiEKd8f6puOw2HBRW6Cq80zj3ko1oCr5ob327qOEnWYlTuC0Jh+87JNY+XWphjSBNQz3oc4eNZaV7kqxO9IOoyfI1rjHLlULVjv2fLB3HZyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lBVV//zMyX6FpLr+7idWGYthQyvtVDAn3KnwQ08/gW4=;
 b=ZJmOMELIZibTy0q21Fg8IHI/Pmf/ntkNidrCLl4nASvjB6/iFVdfg9Jywgeg8GkfU5W5fHcROlU0Q5/0LER1svoSiv2a++LjWn0jOZQRtDW5w0bxMd14wTiTvlIDSIelkcpYwZryodJwUL7quT9VXuh6GLtXzjnAJCHinIJP/xSjvkp6hx1zz0R58RFb9peK/OkRxji0QzNH0od28FhH62S42leYmndC+lUDENGQHO5L67wDf31uzPlc96L1Ef+tj1CfNBQHMNW/rw6n++QPmIhq1GgMDaq97ZWLNc+MjJjPO97bnoGepW3j9LJow4TvNNf8bJm8f3XpsaIqv0YvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lBVV//zMyX6FpLr+7idWGYthQyvtVDAn3KnwQ08/gW4=;
 b=CBQCUbDxQa87mji/ve8b6O6tgYc8xbPD90W/w9pMTAyyJEcXKxvVJPOM9BxDrpWPc06nsZMo11WCEET4yFMDtBFDsu1wO9T9YMMcQeYwhGK2DnWyRpQ2BxESt0zBVqnj5T9JpUGuAvJJoxM+JyynLQ7CxzIbB7Q2+sOpOT9QAQA=
Received: from CY5PR22CA0049.namprd22.prod.outlook.com (2603:10b6:930:1d::14)
 by PH8PR12MB6796.namprd12.prod.outlook.com (2603:10b6:510:1c7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:38:00 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:930:1d:cafe::77) by CY5PR22CA0049.outlook.office365.com
 (2603:10b6:930:1d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.18 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:59 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:54 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:54 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 14/23] drm/colorop: Add NEXT to colorop state print
Date: Wed, 8 Nov 2023 11:36:33 -0500
Message-ID: <20231108163647.106853-15-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH8PR12MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: c00a7875-0c22-4ee4-0e30-08dbe07911c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qFFrHJfEV00gr+CdYNtzWoJdqwCDEyk7QUhRaHeivclGLcHNCKCdOHEnYs4Q+kqeIS/d3HrFhkdSZonPsDt0PwyNMZwTGidGEx357lMzLvi/SNbFzvzMnwPqJd2n9qfA3RSh1PlNQawU2GSSQ8p1R5MoTX5tHzyhotJ/A6hnLKwD/HdSuj3f7YDPHMnsRn9OOjNtRcc+AUikKEgK3BVDBw9C/GPLkfVi98WVA8lQSVPL9zwLaZGLPEZqhRHx0Zn1pTZ65vO84d8duqpgAPtG+UBNXPkn4L0nmsSRFefmG8aGRwUegSfP1YfziFMJdHq52iefkBcJgGFyDOdKDIhrASD2x7+20Gq8ufuuhvthEABkV8zA4VWjv04Ct55dVb1neRUwB+vBYEVwg7HHeM3RByLgzrCipI8mZ32N/urzA6ySmqPS3J4Uzxn5OuxCh7JyPq5agizqVoEuUG7XbIsaVLZWz8nw6Sg8HLQ792KTbmzM9EUqu9FrJvkaKSbARcMsuY7SPGOsQZe8LlryEiYGOcCvF0iI1rnsHHuW9kVSER/bXnIx5zw+712LA9sCO8gH1KxtxNMvdZML57i8M8zQyK1g4iafUrC+U3vTbvNJjhfFrpSCnDWKwHx3AsBkJlFRasAbSTAKPvfy+M9O9a1RxLMQ9auh2mbkTKt0GcX2O7Mk4hd5ScgiIGrVwsdUIRwZWVE6boxZHawA29lRjl3viXXo7vYxm0JBzURTeSnc8w52kNXdP+FyGrLrsm+U3Ewr6rEd9e7m8CGTyRvSCrcUhQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(47076005)(36860700001)(478600001)(82740400003)(6666004)(336012)(70206006)(26005)(70586007)(54906003)(2616005)(6916009)(1076003)(426003)(316002)(356005)(81166007)(5660300002)(4326008)(36756003)(86362001)(450100002)(8936002)(44832011)(8676002)(2906002)(41300700001)(40480700001)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:59.6017 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c00a7875-0c22-4ee4-0e30-08dbe07911c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6796
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v3:
 - Read NEXT ID from drm_colorop's next pointer

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_atomic.c | 1 +
 include/drm/drm_colorop.h    | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index cf3cb6d1239f..02bb071f735c 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -794,6 +794,7 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 	drm_printf(p, "\ttype=%s\n", drm_get_colorop_type_name(colorop->type));
 	drm_printf(p, "\tbypass=%u\n", state->bypass);
 	drm_printf(p, "\tcurve_1d_type=%s\n", drm_get_colorop_curve_1d_type_name(state->curve_1d_type));
+	drm_printf(p, "\tnext=%d\n", colorop->next ? colorop->next->base.id : 0);
 }
 
 static void drm_atomic_plane_print_state(struct drm_printer *p,
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index fbf7c0489fc8..13acc9a6ac38 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -232,6 +232,8 @@ const char *drm_get_colorop_type_name(enum drm_colorop_type type);
 const char *drm_get_colorop_curve_1d_type_name(enum drm_colorop_curve_1d_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
+uint32_t drm_colorop_get_next_property(struct drm_colorop *colorop);
+struct drm_colorop *drm_colorop_get_next(struct drm_colorop *colorop);
 
 
 #endif /* __DRM_COLOROP_H__ */
-- 
2.42.1

