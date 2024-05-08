Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E63698C053F
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 21:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0927E112450;
	Wed,  8 May 2024 19:43:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QQKKIMny";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E14810F126;
 Wed,  8 May 2024 19:43:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILWjnihRxZiDb+ODF7JTr9KIuDf6bRoy65fRlRQtKaP7sByNFHDrGy5iOB6jQnpBrwySQdjaXd2XlcaBLYYIjHjagAl6hZsXhFzpwyNCVVcoifp/xkcSET3AJcO9Wjf1iJ5h3Jqp9/bb+WBhO+grHgJ90btUXlbwp5xvnShMMuAHps16NCMwQR+iRziMTrazjDAo85SXEbn+/eLgicbP9psZOfogOBrQVVJcjgzeXYgI2GOIOYbNxo4uLOoG/lcbfrTLzP5n1UwE+dLUoTl9hb864nPtf98uqY3UWNB5t8f9jwad18zVJzmiOskEe4rQZaVlaDwcJFw950FVxsXDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VASkNtfF6UbaSAl9l4hCtkWSs6jbeToDMsakMALnVoQ=;
 b=PkIzfKb+33/dWLLrBF9jYZXjcSoRsiXjbtlg/vNVWerNqlcb/Q0nMTSbuufbWUxNvS3zWW7S/y95m58MzwqxYUy1nmbicNMKK46TJRhDurLiQznP0I2vk3Cav+I+cRynbEXo1Z5Vna1vQ82WYYtFqt75MKa0jC4mn+84ZJDNMSPRJtPWgrdByK0I7VnFCw7MAb92NSRNo+epxSgY0a+NsfcHeftvhrSIRWwDydqDYa5Gtvk949MeRX99nnx659Od0fPG3lv+JSz6pIFy/H7DH869P+icZAaS4EK1aCnIkmloCLUyggnM75ZGAtBiSoGYe3cbpJJlvUXn38rw7uozCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VASkNtfF6UbaSAl9l4hCtkWSs6jbeToDMsakMALnVoQ=;
 b=QQKKIMnyn8hBR9dwaNMoIIUN5IIwj9DUK4vjcr69UzkD2Z2kTu3z+bNM26/aDW9eFSSITzKqqCadxXQDuCdXrp04ufe6AIQdhrDmwNscqYSs99wJQG6iYFU9gXYEcp4EOog54hIuWkXDQuFEETgzHvmwIBh+zRCOBxzpyD7P7Kc=
Received: from BL0PR02CA0061.namprd02.prod.outlook.com (2603:10b6:207:3d::38)
 by BL3PR12MB6378.namprd12.prod.outlook.com (2603:10b6:208:3b1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Wed, 8 May
 2024 19:43:43 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:207:3d:cafe::ae) by BL0PR02CA0061.outlook.office365.com
 (2603:10b6:207:3d::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.46 via Frontend
 Transport; Wed, 8 May 2024 19:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Wed, 8 May 2024 19:43:43 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 8 May
 2024 14:43:39 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <dri-devel@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
CC: <linux-kernel@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 "Aurabindo Pillai" <aurabindo.pillai@amd.com>, Daniel Wheeler
 <daniel.wheeler@amd.com>, Fangzhi Zuo <jerry.zuo@amd.com>, Mario Limonciello
 <mario.limonciello@amd.com>, Tyler Schneider <tyler.schneider@amd.com>
Subject: [PATCH 2/2] Revert "drm/amd/display: Temporary Disable MST DP
 Colorspace Property"
Date: Wed, 8 May 2024 14:43:08 -0500
Message-ID: <20240508194308.48366-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508194308.48366-1-mario.limonciello@amd.com>
References: <20240508194308.48366-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|BL3PR12MB6378:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a684e4-876c-4294-b958-08dc6f972b50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|376005|1800799015|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?G4I91gAxCfNzee2tieJg/E7nUQmgZ0/48gkmd4yKaD6ap+gArJlwFQaFY9q+?=
 =?us-ascii?Q?fccFBHFqaj07n03QE3KXuNWfi89Jr0x/3TIdE3SnJsrFfTst7RUl87k+ympi?=
 =?us-ascii?Q?VDUt1lHW9a5olVnIADO6iGud/FCODMSBqCXLYui5DLgpCOKf8J+7/AzwaHav?=
 =?us-ascii?Q?XrDcR0ZqqO1NnsCm+CcgtzCtkXi8IFIDFfrG0lDGrztYUpTb3DJmvWcfowSd?=
 =?us-ascii?Q?+sxCTmnZf1/wZ8euWIWdEblwcAOXLArCZ9QsQl40AA+RJp4uQn/DPc0zjSdj?=
 =?us-ascii?Q?oFWmf+juZOay5GXAWueNtBY1OuUV09kL/Ziqo9RzPBuLJeHUy535huogsxe1?=
 =?us-ascii?Q?rbPPvFNT+qisJ9fIxJ9xU3je5w/Wwbqo7z8WJ5Ndwv20K3LvvWbXVTc9vm1Q?=
 =?us-ascii?Q?KZpnKj10G2SritgfbE3hv9WHqsXjWLONPcq7QIN8Y7zX5qNAVVRQWs0Votx9?=
 =?us-ascii?Q?WFBavh9SwfZAX7pVc26t96gw+dcFaOKEAVLX5UfTZtDTpoA3PApXWLPnwm80?=
 =?us-ascii?Q?7Oa+RomjcWpj1i2qPyOXgeVipoFRC0KjNhv58TVpdInxQdRbaoQtJonGQ+ce?=
 =?us-ascii?Q?3Nd9lVZPgdVeOv7fXL5maAfhPzfjX2V73dWWceOeUWavK/fma+WG8RxANrjA?=
 =?us-ascii?Q?tLixpVUYKmt+nvDULEsAqBC+VnnXlXbYyT7ppJ18kN2xixGbYOBJ2iBzAI4I?=
 =?us-ascii?Q?e2UwwKgvUvvWtbJe9zkqzQoJyQkjKO/CGFtgOA7bX3VbmDBiVajqgLdmK18p?=
 =?us-ascii?Q?OEab3d23C+PHCO7P7TYw38wtUctlBbNvmEopmYJoMaBrx6VgZaOWfYQuDZZd?=
 =?us-ascii?Q?9rGIOdliQ9HTXHMzgQQm3050VV7aGJ2LoATnZnV53yuvlRCY2htwtxLxMos3?=
 =?us-ascii?Q?7kXrA1rayJK2lhmqa63KDBqcE2bg9/q6aPbLCC2pycdU0dGu1xqk+RA1eXbM?=
 =?us-ascii?Q?YhXbhmJYfHzI/ENhR14Od8/1r+5ipROPXcOSrVQqETHghF8/11SxfB66B99F?=
 =?us-ascii?Q?MySYdFxvwUmjPz0K77vEri3Mbaa16Un9hVC3K5NQudFrbSEyi6f++Sq3383e?=
 =?us-ascii?Q?CzGzQ7c8UmojNbjZrnMhAskNL2/yYzZWyzyXXeaPVXCau+pYZPoBDaK1GOAB?=
 =?us-ascii?Q?1RiIB4nFCxk3JCXKXNq2rN7Upq+U4JIN41lPK+lZPbn7hXuePzjd6thB5u7l?=
 =?us-ascii?Q?5vfVobjv9UNBifhD6Hn59dNlhzUuArP/yhgOZNEjG3lvf3eBHziwenG8blkR?=
 =?us-ascii?Q?vuBsM+zqqCuj4OafWmBNHxJFaXdDwYwm9VcU8JI/Dli7p52mwCYqga3WBRO7?=
 =?us-ascii?Q?RSGJaxsSg6vC11gEFUVk3I3r?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2024 19:43:43.6754 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a684e4-876c-4294-b958-08dc6f972b50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6378
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

MST colorspace property support was disabled due to a series of warnings
that came up when the device was plugged in.  As those warnings are fixed,
revert commit 69a959610229 ("drm/amd/display: Temporary Disable MST DP
Colorspace Property").

Reported-and-tested-by: Tyler Schneider <tyler.schneider@amd.com>
Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3353
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 3054bf79fc99..93e2030f4c17 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7695,7 +7695,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		if (!drm_mode_create_hdmi_colorspace_property(&aconnector->base, supported_colorspaces))
 			drm_connector_attach_colorspace_property(&aconnector->base);
-	} else if ((connector_type == DRM_MODE_CONNECTOR_DisplayPort && !aconnector->mst_root) ||
+	} else if (connector_type == DRM_MODE_CONNECTOR_DisplayPort ||
 		   connector_type == DRM_MODE_CONNECTOR_eDP) {
 		if (!drm_mode_create_dp_colorspace_property(&aconnector->base, supported_colorspaces))
 			drm_connector_attach_colorspace_property(&aconnector->base);
-- 
2.43.0

