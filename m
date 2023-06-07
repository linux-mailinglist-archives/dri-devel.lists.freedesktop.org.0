Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4995726487
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 17:27:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5629010E518;
	Wed,  7 Jun 2023 15:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2074.outbound.protection.outlook.com [40.107.95.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1C910E512;
 Wed,  7 Jun 2023 15:26:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tyhn5ZZEVkC3MThiAGqlRO4pTHXlSHO4Xa+KBbIC9rFTQ8Vn3qVyQltI628xDRmWC0XH/mPE4k83MTyyGGxM5NA5PCSIwGZ2k//wVhQGJvb9lO3w+1A4eP+2QwHUAGrkpxg0+PPawa2VgJRz5JZWyVIGnQlbIuenIYJRNenFpoZ/dMYdyvd3eYy7hLECa4T4zWJZH3sfn3bcsZKzmCEUOkvzF9Z1R7aYhFuZ5tdIy34Nxe0OkEDHj3wMb7beugx2QBsn2ZVZ/gltu+gP4SfrM8lu44ECjZG+6Yk9bql9eUtlkQLY4bOg70Ijog0NWbXSsn138Z0HKeGwNOZKGwnLtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gfn6TZ18hfZRV0HpmLrkPdT2mUe8qhhaKif+hBeac+Y=;
 b=Sx1TtZGFObrJZqa1Jj68xwb7/qZgBQPifUe4L8RrGmq3CdDazBP67goRd0rZbnc7kJH7uCEAYZd7dSZpOGcnGvvbCLv0I7gePPuksGjDhQNgpPP6KETlC+KAab81ZAGZeXDZ5/g6cwhZNz3ZUT7JGOpJv0jSaqo2sYgO6YAtxNnEQUdqDIpjY3lhTY4yWSWwK22nWcxCNqVhDIw8FcmboXy1QdWL3h7yJCNPZ4rtci6I80AGgZ3Ik2/AiAUD/qHXf+1E8i1d5rNCH/5bpQb5auXrn1DL8mt7c2e5TzVVURfrkGSwA3Q4A6Qf+HEkLPjlDKLw60ue+o6KxGX72Os+xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gfn6TZ18hfZRV0HpmLrkPdT2mUe8qhhaKif+hBeac+Y=;
 b=MQVITS0JZ6Aieev4fmcIqKCVhMyPkJY09m/8VeXZ61LZVwHBpByUC0vCWO42n/bEs7EflepR+QBay9D/HfffkfWDfqRS45G/TXqw5vl0wtDtMm7+TZqRLOigEMI6LpQzA21uSKB8jzjk64vi+ECb/Jk9oTqzbFexOVKSaym8LUc=
Received: from MW4P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:303:115::15)
 by SJ2PR12MB8011.namprd12.prod.outlook.com (2603:10b6:a03:4c7::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 15:26:24 +0000
Received: from CO1NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:115:cafe::c9) by MW4P220CA0010.outlook.office365.com
 (2603:10b6:303:115::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33 via Frontend
 Transport; Wed, 7 Jun 2023 15:26:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT104.mail.protection.outlook.com (10.13.174.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.35 via Frontend Transport; Wed, 7 Jun 2023 15:26:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 10:26:23 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Jun 2023 10:26:22 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v6 03/13] drm/connector: Pull out common
 create_colorspace_property code
Date: Wed, 7 Jun 2023 11:26:07 -0400
Message-ID: <20230607152617.997573-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230607152617.997573-1-harry.wentland@amd.com>
References: <20230607152617.997573-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT104:EE_|SJ2PR12MB8011:EE_
X-MS-Office365-Filtering-Correlation-Id: fe7db6f0-ea30-4dc9-75b0-08db676b8dde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WRYMNRlmngJn/MIRD6kU+VeOEaAjFehpcb5YbpoiFXRkb6pi2cB9ENDrLgoUbblc0n6ytpfmoJxAldv6jqAlKAOmdW48fQ9e+uNbRrpxRErCBB+pn4ZN7UTXVKuxz8U01nzJfbk43HkhR7VUxGeL2SDjpkcKo4G3Ib6bUa/qETpweWNWF69TUgcJGL8IGMOR4Yyze5WMhFnI89ZGiQAyPkg+NCaTxC/ySrx2gfTOh1vvkEgFCxOqPnXN7wt99RAHU5PXtXfyrEJneIMbftsBUWQOxPpJSFgFV6A4TcwnqlpttYQfrbbqqaOXo74OIbA9FAkSX5dg0oN3brHZEWWAVrP9wufwJK/GMe+NhqtynxLCXNk03j8ywkOmqUuucViq8Yz3g1Rmg/Frpe54GR8UppdSnzLAPvL2pO+O2f7t3I7WyYTbapUwM2yxD4o6iTbv2M0cb5JCn8Z71ZJhbr4ZC+DtO6Ayq4wj6+hhaAJ5tdJh3/voWZw6G/JFigSpIg1y/uGUXnIG7rD1R5HEozx94XruwT/bbDiVCJfqmpxp+vFRiUk7KZOXRlrGPM6eiNNmjaiP/aO7j4j4Q6spqrEzsk7hN+7jfRC8ry7lTEukSBgjP82lhZphLhEBgctvMDyLgYuoKqHiZ3ItYFrsxszGuhnaBTXLC1BJKADgPBArvUSudnGM+dnbH7P1r27kTXUgJ7h87wdwTpvK/ToVjbnTgGCutxDVgnqhUU9Ka2gnS0b47mP520sL2fncwcHnB5Op8yMWtKvQK+bHtpnJ6ZkToA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(36756003)(110136005)(40460700003)(2906002)(54906003)(478600001)(82310400005)(86362001)(7416002)(41300700001)(8936002)(8676002)(5660300002)(82740400003)(316002)(81166007)(356005)(44832011)(40480700001)(4326008)(70586007)(70206006)(83380400001)(47076005)(66574015)(1076003)(2616005)(26005)(186003)(336012)(426003)(36860700001)(6666004)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 15:26:24.0822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe7db6f0-ea30-4dc9-75b0-08db676b8dde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8011
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, Melissa Wen <mwen@igalia.com>,
 Pekka Paalanen <ppaalanen@gmail.com>, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Sebastian Wick <sebastian.wick@redhat.com>
Reviewed-by: Joshua Ashton <joshua@froggi.es>

Cc: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Vitaly.Prosyak@amd.com
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: dri-devel@lists.freedesktop.org
Cc: amd-gfx@lists.freedesktop.org
---
 drivers/gpu/drm/drm_connector.c | 54 ++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 547356e00341..9c087d6f5691 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1975,33 +1975,44 @@ EXPORT_SYMBOL(drm_mode_create_aspect_ratio_property);
  * drm_mode_create_dp_colorspace_property() is used for DP connector.
  */
 
-/**
- * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
- * @connector: connector to create the Colorspace property on.
- *
- * Called by a driver the first time it's needed, must be attached to desired
- * HDMI connectors.
- *
- * Returns:
- * Zero on success, negative errno on failure.
- */
-int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+static int drm_mode_create_colorspace_property(struct drm_connector *connector,
+					const struct drm_prop_enum_list *colorspaces,
+					int size)
 {
 	struct drm_device *dev = connector->dev;
 
 	if (connector->colorspace_property)
 		return 0;
 
+	if (!colorspaces)
+		return 0;
+
 	connector->colorspace_property =
 		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
-					 hdmi_colorspaces,
-					 ARRAY_SIZE(hdmi_colorspaces));
+					colorspaces,
+					size);
 
 	if (!connector->colorspace_property)
 		return -ENOMEM;
 
 	return 0;
 }
+/**
+ * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
+ * @connector: connector to create the Colorspace property on.
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * HDMI connectors.
+ *
+ * Returns:
+ * Zero on success, negative errno on failure.
+ */
+int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector)
+{
+	return drm_mode_create_colorspace_property(connector,
+						   hdmi_colorspaces,
+						   ARRAY_SIZE(hdmi_colorspaces));
+}
 EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
 
 /**
@@ -2016,20 +2027,9 @@ EXPORT_SYMBOL(drm_mode_create_hdmi_colorspace_property);
  */
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector)
 {
-	struct drm_device *dev = connector->dev;
-
-	if (connector->colorspace_property)
-		return 0;
-
-	connector->colorspace_property =
-		drm_property_create_enum(dev, DRM_MODE_PROP_ENUM, "Colorspace",
-					 dp_colorspaces,
-					 ARRAY_SIZE(dp_colorspaces));
-
-	if (!connector->colorspace_property)
-		return -ENOMEM;
-
-	return 0;
+	return drm_mode_create_colorspace_property(connector,
+						   dp_colorspaces,
+						   ARRAY_SIZE(dp_colorspaces));
 }
 EXPORT_SYMBOL(drm_mode_create_dp_colorspace_property);
 
-- 
2.41.0

