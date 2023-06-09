Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 800DC728D37
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 03:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 736F310E629;
	Fri,  9 Jun 2023 01:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::600])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FB6F10E629
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 01:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArSULNcN2Dc3GyHzbUEfczXVQOtp/MqD9RcULoqyj/Zfoefb5njKhQqeNMWqOVVn7Wzj+PjvoQ9XFjK8JHbypfCpxk8Fkg9MjHf3/QbQFl/Q01Xx6vBrMziyuxZPASDYjel+7BeoO15rSM7Z+4kSTUTVm3mnIEZTbceLdQNL1e94tUCnALWElvL2zhJVbLjCEFvDAKPn6OKHleGvRhgY2GOMF5oV/kYHLDJapAnY7ghaNAwoNh7LMuBNG5Jks5AwsU93QyK/pNtLqsKPm0IIjhlIsST1IG7Eb79wmw2Kh2NbYO+zvBhHMC88x6nXsfPXSBx4cJMKHH6RZTOXZauXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10uY/6deE3Ji6VJVJXeKf0l85qg1gW7R+FtycbcGRTo=;
 b=WjcvruAHcj3CQGa9dNLTFgsaUvHlBZi0RvFcDrLsXF4vALOn0MeTesZDsTolAFySuleyJCs+QyNKe3fpTjyQCADLNLzhxofc3dFSokANnYAzN5CNGftWfnIRjmiztEWWBzflLMWH0AEHLw+MsRsCQz/49JhULfjExL09Ay4jV2FUUe03gOYB2udXJf21BAu5RaY3Zor0BbvLoy9mjnqdYwzvNw+tFz8GYvPN67KxGEgJEhR5WcqWKMyAxkGcYyqGNncbLUn56xJUtoIoythCMEoL4MwYW7iuDoiD/l1GJRa31heCni6fuz01OHUPbBDA5E6oAyQ9sPVd+J+zRz4YKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10uY/6deE3Ji6VJVJXeKf0l85qg1gW7R+FtycbcGRTo=;
 b=EQo88kH6GZ3f7I0IKF6PqMoATdmVpq/OiksKQEnvZMGzUCifJkMGO7wRj097nU7ZX9ikwnXKROW7hptqXlXhLbxp5WUjMVZBNqmCsJ7O7WdFD6SZpti+qk7nFpnu4rfxTS+qtkNf1Vs6QlxixmoHWzTAkPIosBc98qha640zzfKgqZrk8tTdx+2Ja2zZA/qGmvGUnMZHr6Zr3kIIvNVAOb9KPi+9Ij/5+7P49+T0g+N3MdvqQAJAG9YqURgsDdCkCTouxQ4Cf4Qwbh4/V7euFX1IEJufdLazDQwybn8JvhMjcNrDC21gUDS0sQ33zUP4FMvlqdrUheBk/gCCH1PPBw==
Received: from MN2PR12CA0030.namprd12.prod.outlook.com (2603:10b6:208:a8::43)
 by SJ1PR12MB6050.namprd12.prod.outlook.com (2603:10b6:a03:48b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.36; Fri, 9 Jun
 2023 01:42:34 +0000
Received: from BL02EPF000145B9.namprd05.prod.outlook.com
 (2603:10b6:208:a8:cafe::ea) by MN2PR12CA0030.outlook.office365.com
 (2603:10b6:208:a8::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.19 via Frontend
 Transport; Fri, 9 Jun 2023 01:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL02EPF000145B9.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6477.13 via Frontend Transport; Fri, 9 Jun 2023 01:42:33 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Thu, 8 Jun 2023
 18:42:26 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Thu, 8 Jun 2023 18:42:26 -0700
Received: from rcampbell-dev.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Thu, 8 Jun 2023 18:42:26 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/edid: Add quirk for OSVR HDK 2.0
Date: Thu, 8 Jun 2023 18:42:07 -0700
Message-ID: <20230609014207.2759720-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000145B9:EE_|SJ1PR12MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: ab16d5bb-27a5-4ebb-c31b-08db688acbe9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D6fWepjgxSohPSsr8PgW9DguEcQTCM/tJcg/jYlj2vWwmis8eDSyZ0L8Eh8/niv1GWbiqbivROX0q7EhhFolhdoEA5MVjCgl4r5sDAxx98l2LHDE3Pzwuxay92c1Tlw8JS7PEmtkHrLUsXeZRl/SAjbnlnEfIRMccgpWRDHP9HQVAaNrg4Pq7swJIq9WYddb5Adl+gG/rtjAJP07p1Pxvq9U3Fi4IlSH7UNQAKWkv/IYJogd1FtOVx1ry1am1u39VaKE4hMnIFhr7Srz/+NjspNB6oEU8p8xlq52GtWn7lcZ4H6q/5eR0nZww9FakePgANiGXwNYqgPaVF4tP9dXNoiiTaEDYgV4ZUJLIfA5AG+OVk/F7cli7ZuqNCITbcy1RA/X9G+Z6UW7u7z18nOtHDBh7kZw/5iBdcd8vByAiL7rdtn4vq11RELwmDv/dlIVANCLBLA+PZG+odZV9ld8nJhPcRs0hyMOm2QeiOWW+c9l8hQRpBa9HgLFhPtOb6GvXOWwB/543XTyYtsrkA5bBMH6UiKOvcv9lHr9O3Ykgm8aRIja7RUxPVR9bxau1XW8mbgY0FJW9ERD6dqs7jBFp+8nEhiA+4YZYNRN03K8ZlkSVCa6bV4bRh9Pl/qdT4ydKRHnoDT/cqMnk+YmPzav1ctwiXrYz52YmfrHH13xUQb0WXYUYO6K9BQ0PWf/vplN3kDvNLAp1RpMGJpGXzZoxUxXKaYHTMVeSWcchltv5r9PvyloUuvHmFFBrN0wgjhr
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199021)(36840700001)(40470700004)(46966006)(107886003)(186003)(1076003)(26005)(2616005)(82740400003)(426003)(336012)(47076005)(6666004)(36756003)(7696005)(54906003)(2906002)(36860700001)(82310400005)(8936002)(8676002)(110136005)(40480700001)(478600001)(41300700001)(316002)(5660300002)(40460700003)(4326008)(86362001)(7636003)(356005)(70206006)(70586007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2023 01:42:33.6896 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab16d5bb-27a5-4ebb-c31b-08db688acbe9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000145B9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6050
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The OSVR virtual reality headset HDK 2.0 uses a different EDID
vendor and device identifier than the HDK 1.1 - 1.4 headsets.
Add the HDK 2.0 vendor and device identifier to the quirks table so
that window managers do not try to display the desktop screen on the
headset display.

Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
Tested-by: Ralph Campbell <rcampbell@nvidia.com>
---
 drivers/gpu/drm/drm_edid.c | 1 +
 1 file changed, 1 insertion(+)

I don't know how many of these VR headsets are still around but I have a
working one and I saw and entry for HDK 1.x so I thought it would be good
to add HDK 2.0.

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0454da505687..3b8cc1fe05e8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -230,6 +230,7 @@ static const struct edid_quirk {
 
 	/* OSVR HDK and HDK2 VR Headsets */
 	EDID_QUIRK('S', 'V', 'R', 0x1019, EDID_QUIRK_NON_DESKTOP),
+	EDID_QUIRK('A', 'O', 'U', 0x1111, EDID_QUIRK_NON_DESKTOP),
 };
 
 /*
-- 
2.40.1

