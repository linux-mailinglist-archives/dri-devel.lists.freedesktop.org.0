Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CA387D03BD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 23:22:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7017D10E54C;
	Thu, 19 Oct 2023 21:22:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::60d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0185E10E541;
 Thu, 19 Oct 2023 21:21:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwEQw0wXAXlde1cfd3bxx3+tNSwv4/C2o9aqsW25q7GG4hk5w6nuJdTjekpzt0IvEglNAdy/kZXNpeVlijUU88Y42gLMFmMSgnXCdehgqSY14/warByyyFa0b4zwcvYy9SulOHiBBIahF7lmzahQ0OipGgM7NAZjjk68tSs1B9Msvl+7TUq0no38k5Cm0/aaar4UObQwa417fZp36N4OLGAVj5K2VB8v2J3xZZ61O4DmVVTaVbRy+AlmEbBAdAQ3tJpX5GNIMvmGB4BAMvB2ZrLJqcF5HCkNDn+FBXUajJwVLqbQueFH9rCUmXKe0JTVReeQJf0hFdSvGTkD89kvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9DLYzvGEMv0IDMqahuWSqExac14WlEC6dktqRTDQ4IM=;
 b=RM/P44yYOjlvgYDEyZ/72Ja1wl7xnHeDi9e6EEMZCWr4xoRDlZfzlh6oGaM8Kb+WlnJ5HEOjq4IhpZ64IhYLgFiTkxfTTTJPVCJqwrskTafxOg9zDjwu2H8HyBpNqbYM9DmPmeynrXJKCXF7lgEu8xozOkzKQ4ruQg8oaZjrXrisIXoCF08iJRj+dOGPHPaggB3wzuWd/QAHGVJS7+lczjInIL8hsKBWp2RfFTUvmeef1s9mxCfIaMhwZgC3AeDw/LF/F8IhOcXLaDLlyB8mJHfctbRdbJ5XNgHbK42WX+XKY/iL16bg2LJs33JnNm9IzvrbPNdkJBEbgIS+ITsdNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9DLYzvGEMv0IDMqahuWSqExac14WlEC6dktqRTDQ4IM=;
 b=qHOImsBG+eIXxBqvQGtBaZ2VpjuzmJe+aVoUkKEXNbbKE0XhBEVqlFLgdXaf79iSf4taG7X8gvJjdBGja1V/yl/zNJ97U/mErFdD3LmdXMm+KLmOop63LDTxkDghE7kdCzT8qFDl32rR8TBhwkd1/HUe8xwVC0q4xj+Jtk2VChU=
Received: from MN2PR03CA0002.namprd03.prod.outlook.com (2603:10b6:208:23a::7)
 by PH0PR12MB8821.namprd12.prod.outlook.com (2603:10b6:510:28d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Thu, 19 Oct
 2023 21:21:56 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::6b) by MN2PR03CA0002.outlook.office365.com
 (2603:10b6:208:23a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Thu, 19 Oct 2023 21:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.21 via Frontend Transport; Thu, 19 Oct 2023 21:21:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 19 Oct
 2023 16:21:38 -0500
Received: from hwentlanrmb.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 19 Oct 2023 16:21:37 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v2 02/17] drm: Don't treat 0 as -1 in drm_fixp2int_ceil
Date: Thu, 19 Oct 2023 17:21:18 -0400
Message-ID: <20231019212133.245155-3-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231019212133.245155-1-harry.wentland@amd.com>
References: <20231019212133.245155-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|PH0PR12MB8821:EE_
X-MS-Office365-Filtering-Correlation-Id: 930db49a-9797-416e-7a27-08dbd0e96bfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CiRbx2NTtM6EpfVbX5NkVDt0lP30dIietC9OqC8nL3gbg95iqbMUQS31leeecN49bhDKBZlzCSuvQsE/uDjZTz9vcI2emW9X1e67SQw+fqjSR7wYcEwGv8qHZZfI0FaGRTt5+5cU+yx/K1ktpjVWThlapBgMkpkq/5BYVXub0k/bEGiekDuiUEb+DTFZw4A4q9zmBrVSOb/ygm4/2nPLgNpFeDpKAmPp5osxi4yWPbst13DxR9dzUPTY8eWpXkqZqcxNdzrGW2/dd5lcDLw62VHvMU4jpxC9ThBo+7u+prg1tztMi/iS+PM8F9n94aWhb5toNVKnos52SIWiwcrfEuBh4RkQ/3AklRyTduYw9D6STUJEcsfZPygfX3o1YSrkxFm5iP9cHElIXBVoLrH54minUJ+kyowW5DpKoLlEb/IXhkNdO7YtVcjjiBrl4ClBoZMLaDpNelJv3HdCSl+Kzp0slBtdUjKOqpt/L0KgU/MNOjokB1I4SUwQwm3UG7s3VvKfvrZLEr+P6uABRDknXdEnSgkdWsFN/NitPaQ5nlIxZWJ5NBjscpDx2H5+aVR0K6iBx9O37PbPpzZ3pu6R4GrB/QWclYHFsQjtXZ7Gi7AkTKivgMOFswsEQZxwuJ9jZcvGfvC0NjA+V+/GUOLitQy6U8yOFF02u6s+1xaCBXCq/4Tl7PYhUSPJTJIgo9ynoNilaLsA7nEDrmH0mgXvjoLyv1iCIzjV5f235Ma8VqjvbRiw/GIwerSBfCqUXA5919/l2pKiSaX4C9oZ03i54w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(136003)(396003)(39860400002)(230922051799003)(64100799003)(1800799009)(451199024)(82310400011)(186009)(36840700001)(40470700004)(46966006)(81166007)(7416002)(82740400003)(40460700003)(8936002)(4326008)(8676002)(41300700001)(5660300002)(44832011)(356005)(86362001)(2906002)(70206006)(40480700001)(2616005)(7696005)(478600001)(47076005)(66574015)(336012)(6666004)(426003)(36756003)(1076003)(83380400001)(26005)(54906003)(70586007)(36860700001)(6916009)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 21:21:56.0385 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 930db49a-9797-416e-7a27-08dbd0e96bfe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8821
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

Unit testing this in VKMS shows that passing 0 into
this function returns -1, which is highly counter-
intuitive. Fix it by checking whether the input is
>= 0 instead of > 0.

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
 include/drm/drm_fixed.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_fixed.h b/include/drm/drm_fixed.h
index 6ea339d5de08..0c9f917a4d4b 100644
--- a/include/drm/drm_fixed.h
+++ b/include/drm/drm_fixed.h
@@ -95,7 +95,7 @@ static inline int drm_fixp2int_round(s64 a)
 
 static inline int drm_fixp2int_ceil(s64 a)
 {
-	if (a > 0)
+	if (a >= 0)
 		return drm_fixp2int(a + DRM_FIXED_ALMOST_ONE);
 	else
 		return drm_fixp2int(a - DRM_FIXED_ALMOST_ONE);
-- 
2.42.0

