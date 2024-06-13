Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FFC90791E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FB710EB29;
	Thu, 13 Jun 2024 17:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dMflzdwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF35510EB07;
 Thu, 13 Jun 2024 17:00:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ENddFGwA8nWLGN62mz3QehEayN0EMi7GPpt67KAN4faNn0Xc7Jvmd9FCSvy4Ax0TMERFAdxGySpKaIp0fcJ5dcaV09920hh+T7uR8irN+6EdwM+/SABYjHmMGebi+I5NmHTnOVZhpev7pGgQhxpV96J+ngq9vvMcoacBSTvBxnoDUP6rSD3nFhk78VYrX+0M2hvPHggtjTK4Z8bzgkN4Hvdnk5yBkzGr5TtQfziyc09HzrH2QZr9iHx98D8qbC5nhE7yhX5/7Oh+OKOVC98B+mQpaf2gQbfrPegBOMH1C9+nl3DbDGHL20mkxbRqwI7E4Wg3R5uItbjNZGWXYfhZiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQ2k7RfrGgI6aaQ0Kd7fmVBlbuY+nJAZbDL1cJqsBB8=;
 b=Wks1ldpPQxBUWgCIar0l3CPwwoD7wKuQmaH36cEwS0mSYtSmtqiUh6NRr/1EpVbWy9yNyfkJMFwPhq7yQG84gvVq/ee25S2YZGLqHciUpvE0mZHON5r2udN66HfxDOIsyHqgUZzoJiLWRmjwoSfhwi0migXNdOAGdo2woafnlvajCTNljr8mHlbotEg/QCLsC01t+XgDy7bcP4H/sZ19HaHG5J8mwdkfr6kEwPzwPWxyyhzry6WoHRMZ3sug3azdZUJBb2GNjHh9FqGUfaHroRT9q/vfFqgJYzpdbdV+HaeBEIOSg9VgAJr1l68GSt9Rv86PokeE27cDGHM2iR/P0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQ2k7RfrGgI6aaQ0Kd7fmVBlbuY+nJAZbDL1cJqsBB8=;
 b=dMflzdwYUZAlRZa7u6sBRvq2tV4fE0Zlym41OnZeOnAbpjWKKxAN9EQ2ne4+ulet2fJAW5T5jSkfSnF/TgP6KHwBPgbjWDfICCF1L7JD/G4ilXlDhYaxJaB6UvvPQa6gF7o/CbqsBB5Nyu3x7VQH5H9UFdIeDo1Q8OQ3hSAkyrlZfffePDn4dTsL9yIhtIg4A9Ijc+Yf70NTurUJbqCkLoMcwsm+px/esfsBFyHNWEffQtZCOgMG5qaqTRBHLJuimkunagE75qox/MteHQxd/CGlcfYvyTCy9UFr30zAcYbscNmyR35mAhY3SRDXPu5QVgXl9cUH3HyKFvohJpWzfw==
Received: from SN4PR0501CA0043.namprd05.prod.outlook.com
 (2603:10b6:803:41::20) by CH3PR12MB8994.namprd12.prod.outlook.com
 (2603:10b6:610:171::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Thu, 13 Jun
 2024 16:59:51 +0000
Received: from SA2PEPF00003F61.namprd04.prod.outlook.com
 (2603:10b6:803:41:cafe::2c) by SN4PR0501CA0043.outlook.office365.com
 (2603:10b6:803:41::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.24 via Frontend
 Transport; Thu, 13 Jun 2024 16:59:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003F61.mail.protection.outlook.com (10.167.248.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 16:59:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:37 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 09:59:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 01/21] drm/nouveau: fix a couple of KBuild comments
Date: Fri, 14 Jun 2024 02:59:53 +1000
Message-ID: <20240613170046.88687-2-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170046.88687-1-bskeggs@nvidia.com>
References: <20240613170046.88687-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003F61:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b6f0f6-c033-4baf-6b53-08dc8bca3dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MQwM8dfxj5Dq3CRuzOh/8lCBWRASlhzXHI149g3OiUtrpsD4ur/VQG9jAhIf?=
 =?us-ascii?Q?HrcuWZOXJMCS7YBfnuWGS+WLfQntx6xg0ooxQN9DVqeq/esyXYO6BAbjEDxF?=
 =?us-ascii?Q?SlEI1+3LKzZ9psPe6sOFdUw36nH9flVkhNjvoBlcYbD41IytyWPi9Y7DNUAE?=
 =?us-ascii?Q?O2E6InEo+bP2ggGXeCh8/FCMsS/KSqb5I24ahmezXybNk2XKM6zar9HhUj8/?=
 =?us-ascii?Q?9QVgBG0sf6tfOgyR4yOsoWyVPXqTafi8SkUexLNUqxa5X2l4tfkHXAaOhOae?=
 =?us-ascii?Q?KGEOyjdUkOfi0mj8+EX/bC1ozbcbLrlmmpiqKF3CGbucVYxmFF06tAsc2s2I?=
 =?us-ascii?Q?Wexo51p0OxxbcZct/Jw+QiAJyT93RywL8333z5X+zz+VhyTf3CaqS1IVVrs+?=
 =?us-ascii?Q?VbKu3YyESlMQl8VzZeB+ofoq6FNIkLz3z0kZFP1aQU2/m11M7ZYnOwwYxjH1?=
 =?us-ascii?Q?0Ae9zIYaqj2hob0jBGMyNUibpey3SkRfzH7H+U44Y1eIpFwc/C/9DshSeJqe?=
 =?us-ascii?Q?vy9v9W+sKei2tt404+U+RchG6iTjKat6lBKsO+78Hii/6eHSjEGdW5RHSqOY?=
 =?us-ascii?Q?Rq5qqofXJT47DKpZ8e+j89quXD0ox2GXPBSM4C3w3Ogh0AngmBnV35JRHSfr?=
 =?us-ascii?Q?mYfnqKvvF92F/GW4C9hkXEJ8s8dBLb4U/q8VSSVDBFoeSfaeBxasWZK79ai+?=
 =?us-ascii?Q?t29n/jW0CXwuNUcCThAws+SLx8pRB/OeJlcdtSy6VGNUR8UnnC3AbyPBccQX?=
 =?us-ascii?Q?1rE5R1oXCIoMyVt16o2yY1gZRp/NdIsS+DczJuhjSF0cIcCvxrML8ctqAdFq?=
 =?us-ascii?Q?+BvXp0HQnLtv2pKQnsCiPQFGsZgMAzi5qfqBrH6NZEiYR8ag2OmfJMxVuTgz?=
 =?us-ascii?Q?G59Rwg/eUnSpleLdo6YNCRmnuS1+5Vs/Yqx/Md1zskYJXPkke1zvFyKsSfZF?=
 =?us-ascii?Q?CI6sJJRFGh1XFMtOClN19mEl419sqqNXSfl2aqyp+eiWsqXmoNedah//ET/s?=
 =?us-ascii?Q?Gfs3j9ablzMSmQRUaR4GVzJCv0AuE5415iO8GV+6mr58210uc+tw2J1Jklrx?=
 =?us-ascii?Q?Ooq/f9c81wOjoTYLzIwN1jrm17zMREAg0CaPZGJaqIYtbJflJRj/hmyNevwV?=
 =?us-ascii?Q?NrTUvtwKTAm8bA7638zVU12KYpcunTMGjeVJpfP+TLNYB8qyEkgpOaIKlBXQ?=
 =?us-ascii?Q?1Oc7I/EP3KfkrtJELd42ZiHp4dqpxVAfWEMsq+WozM+Tbunb2UfmwQfIciBk?=
 =?us-ascii?Q?Zc4Xhb5gqK9ICGBkPRzTYBFu7ujKwcS3K8I7PgonP9mRo1gE4W/NftUMRCBm?=
 =?us-ascii?Q?V1kL/zw7M1L3utzxGW6WQVl6DZAw1tJ61ASlYjjXLKoyHYlvHNXNCxtv2yEQ?=
 =?us-ascii?Q?J2sEF4IC+P9R6IHKRKbabQt8GBLFLOvcDwCbHqgFKGH0mdn3DA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 16:59:51.4888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b6f0f6-c033-4baf-6b53-08dc8bca3dcd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003F61.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The NVIF/NVKM comments were backwards.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index f99b7b227947..61eeef83847a 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -7,14 +7,12 @@ ccflags-y += -I $(NOUVEAU_PATH)/$(src)/nvkm
 ccflags-y += -I $(NOUVEAU_PATH)/$(src)
 
 # NVKM - HW resource manager
-#- code also used by various userspace tools/tests
-include $(src)/nvif/Kbuild
-nouveau-y := $(nvif-y)
+include $(src)/nvkm/Kbuild
+nouveau-y := $(nvkm-y)
 
 # NVIF - NVKM interface library (NVKM user interface also defined here)
-#- code also used by various userspace tools/tests
-include $(src)/nvkm/Kbuild
-nouveau-y += $(nvkm-y)
+include $(src)/nvif/Kbuild
+nouveau-y += $(nvif-y)
 
 # DRM - general
 ifdef CONFIG_X86
-- 
2.44.0

