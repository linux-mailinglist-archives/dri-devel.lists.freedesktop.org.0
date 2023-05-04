Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A66F7802
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 23:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3A810E530;
	Thu,  4 May 2023 21:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522AC10E530
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 21:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NkeSHbahH6mvL7cqJgdokgRP213ey+H4uy5NxMXjZwgzDAR1ABTpXj2Z0PKQQEZgfUeN6RA/G+jy/0DYXK6ehq6eCwfiPBdoGbHZ9+89/YyEPfx8llVUidcqgNFx4+z/vYSQQ+8y8cM3OSoQLLkObaIYglj0tI6pzz/L07PLNTfVWzGe1+2uyVLHUcX2QbMDdjGGVoN4RsJwo3uv1ck+EkF66jqam6n72jDLDglO8KK1RhU9V4wazyki2Enhmxk14tfMjJPq8mCA3HI4/dlDkEzIXV41/1JjocWx3h1ZP+FgAq1q2weIBfLxAV2lCyQcHGssFZu9Hf4e2eVhq8KZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tc1RMpI3EADDckRLeERKxR2wUdUnN8WzaqJ6T0tS0Ts=;
 b=FXAdz2I6rN0og5vioWcL8XOPGx2lIuHVfQg3n60ZqzDjtmDQy2xvIQrMfwJIPBjBiOVBdBPrsT9/IxBberR9i6aMbBKOjdWAdnJThA+/Jvl8y1F1NylcO5uFN0mB61a10d4gCRjl98+NJIOGvKR2jEM+97UG/XsjtPoWdu2sNpS6tkeAYLiQhMINHYk4hzksuPA0oGhXTPfaqFcDvmXWq4aW1aJLrhtgR1TieWyKvoKHzFOfTCSUKXqThLBSbNziDqz8oiCvCjp/u/E7VRc01rvrfoEbGoLFdIKnVrf86ZA+Hw7SxfinysFziEXRHjmUl0NpO8Nn31wJHzn7yex9oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tc1RMpI3EADDckRLeERKxR2wUdUnN8WzaqJ6T0tS0Ts=;
 b=L/qK353FDNuHGRRxKi1BR7Q5kKLgbgd9aWQLmNxV5zFRcTVd6QxU5jF+NguPKYqjt2qLhusaBId3xjWt72QVg4RFhOjb1QSwamz7Wfr5y4sYCHt5wbzhnMf68Evd/fFY2ZNRfOeqTMjuXY1hylEIKiePQRGM1bKzyOQRDDawA7Q=
Received: from SJ0PR03CA0043.namprd03.prod.outlook.com (2603:10b6:a03:33e::18)
 by CY8PR12MB8362.namprd12.prod.outlook.com (2603:10b6:930:7e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.26; Thu, 4 May
 2023 21:26:03 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:a03:33e:cafe::ad) by SJ0PR03CA0043.outlook.office365.com
 (2603:10b6:a03:33e::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.27 via Frontend
 Transport; Thu, 4 May 2023 21:26:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.27 via Frontend Transport; Thu, 4 May 2023 21:26:02 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 4 May
 2023 16:26:02 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 4 May 2023 16:25:59 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] Documentation/gpu: Requirements for driver-specific KMS uAPIs
Date: Thu, 4 May 2023 17:25:57 -0400
Message-ID: <20230504212557.61049-1-harry.wentland@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT025:EE_|CY8PR12MB8362:EE_
X-MS-Office365-Filtering-Correlation-Id: 770bff9d-c52d-493d-ff91-08db4ce6299e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VNZPvQghTvSjLB19vkH9wYyZvRBwMpNJ7zl7PK7MyvIR2AhfONCqG0/JSH1h+/tG+t2Dq1VvFCvGYUjGYw5s9gdxDspvA/BC37P5HbE0pRQj8qVGAxwVOp9ZRYv+aIQ+TXD7jeh1+BL4cQm11hi7B+2aNTb8q+CKRVFHoxk4K20cxMG5P6qBZpL3aDB/RoMro9niikYJ0ydbiioanZ+k/fcnT3Wg1ncex3GRekZrxISKUHqCgVt+aZ/4mJyLuPvIiQLqsKaV6U68hE7rAmV0oSyZfNJZGnkNUYWqHLENjrY9Y/T0s4v/s3rMhcew+bCYOHH6KT8O3s1K3HAV9vrH8eXfwTnnXpE7MGdkaK9ZVqKK/GXl/9MJxFc5ajS/MUODsMrrZxlmOy1Hjh3dFkqVRJoBULxBxnwZoebXQb5LSkKj/9wSxlRBoxne3I5W06tSOT9wYhUEr5O77LqSK6wTp8N0o2nPpayjUlxZb5PtVQ8bkITTZPJXrDghsrzDyFzCHW0Ipbl7ItL79Ge54rb1+s434dJ0ilM5/0yJfny1vkWHVzXMA1plw0Ub29rDhPWpVm0GksNJM53QE6GLafVEJUTwNxikjZ98op4AHsipQ9Nm931Jd7uoc5CESE2ZMavOheQS8fIhdgz+ifrNGX2W/N5XQz+Y4mcaTiucUJtiB6v0cLRHC2Nx1zCoPCTlZT6V
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(36860700001)(40460700003)(36756003)(81166007)(5660300002)(2906002)(7416002)(44832011)(8936002)(40480700001)(316002)(86362001)(4326008)(70586007)(70206006)(41300700001)(8676002)(82310400005)(82740400003)(6916009)(426003)(966005)(83380400001)(47076005)(336012)(66574015)(186003)(1076003)(26005)(478600001)(2616005)(54906003)(7696005)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2023 21:26:02.6750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 770bff9d-c52d-493d-ff91-08db4ce6299e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8362
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Melissa
 Wen <mwen@igalia.com>, =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Uma
 Shankar <uma.shankar@intel.com>, Victoria Brekenfeld <victoria@system76.com>,
 Aleix Pol <aleixpol@kde.org>, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have steered away for a long time now from driver-specific KMS APIs
for good reasons but never codified our stance. With the proposal of
new, driver-specific color management uAPIs [1] it is important to
outline the requirements for the rare times when driver-specific KMS
uAPIs are desired in order to move complex topics along.

[1] https://patchwork.freedesktop.org/series/116862/

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: Joshua Ashton <joshua@froggi.es>
Cc: Michel Dänzer <mdaenzer@redhat.com>
Cc: Sebastian Wick <sebastian.wick@redhat.com>
Cc: Jonas Ådahl <jadahl@redhat.com>
Cc: Alex Goins <agoins@nvidia.com>
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Cc: Melissa Wen <mwen@igalia.com>
Cc: Aleix Pol <aleixpol@kde.org>
Cc: Xaver Hugl <xaver.hugl@gmail.com>
Cc: Victoria Brekenfeld <victoria@system76.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/drm-uapi.rst | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index ce47b4292481..eaefc3ed980c 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -118,6 +118,38 @@ is already rather painful for the DRM subsystem, with multiple different uAPIs
 for the same thing co-existing. If we add a few more complete mistakes into the
 mix every year it would be entirely unmanageable.
 
+.. _driver_specific:
+
+Driver-Specific DRM/KMS uAPI
+============================
+
+Driver-specific interfaces are strongly discouraged for DRM/KMS interfaces.
+Kernel-modesetting (KMS) functionality does in principle apply to all drivers.
+Driver-specific uAPIs tends to lead to unique implementations in userspace and
+are often hard to maintain, especially when different drivers implement similar
+but subtly different uAPIs.
+
+At times arriving at a consensus uAPI can be a difficult and lengthy process and
+might benefit from experimentation. This experimentation might warrant
+introducing driver specific APIs in order to move the eosystem forward. If a
+driver decides to go down this path we ask for the following:
+
+- An agreement within the community that introducing driver-specific uAPIs is
+  warranted in this case;
+
+- The new uAPI is behind a CONFIG option that is clearly marked EXPERIMENTAL and
+  is disabled by default;
+
+- The new uAPI is enabled when a module parameter for the driver is set, and
+  defaults to 'off' otherwise;
+
+- The new uAPI follows all open-source userspace requirements outlined above;
+
+- The focus is maintained on development of a vendor-neutral uAPI and progress
+  toward such an uAPI needs to be apparent on public forums. If no such progress
+  is visible within a reasonable timeframe (1-2 years) anybody is within their
+  right to send, review, and merge patches that remove the driver-specific uAPI.
+
 .. _drm_render_node:
 
 Render nodes
-- 
2.40.1

