Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF277A1CEC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E4F10E61B;
	Fri, 15 Sep 2023 10:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 902DE10E61F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 10:59:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a9RMpg6ChtUzmJbXB0PKQYKC2sByIQfJDns7XJCWBq9ANeUEMGxFLcE0omZDbqXyp5jfrjoNJddsPcKxZBD+c3Q8g/fizvroEAAecs+UN7i48PEEQ5Jf0E16dYnFWBqejSB/Do1Qa2DNogpqJpMRbr0uSXj408iYoFfpM5c9151ZVs/RflEt0L1gWX5HOZJMPfDdYdlg8KiPJYJ2NS5ERESBjYS/0Nzmsu0KkvL6I+5MtqnPh+fwcaEZLy/V/fwf40HGLrLxNbsZPwqiU01K4Uf2bTot4b311qDbhnsrH9CayCogFzZPyQxJgbq3GzGDm22qB0ffhJV6sDWpRhbGZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BxVZ81BTfkNqqP4bkkMcvtF7dFEc4NiiDSDx4uBtWQ=;
 b=Qcw97dTbHTYRjROJpyVS2nl4yWLI1QshfqlH5WqZ+PVG0XscMQURHsAy/8YY6tQklDKy8qtMAqRVOJ64Vmn5DPwx1NlvHiDMoMw8hjaKztmZYXII7yjW2WraQtSrPkDywWRL5PdaYicar0EqzdfF63CqoWb6uyGmVk21QWYZKN5bwIablp90qPCFn9pzjQMxFI+HBifR5zQXRM43Wo0WB75kTRBt2YXIMuJOjC3on5+Mnb9kkX+BJHT1Z0eyYbyKApQec6gaePBpr8WU48AFITma+KJQIyEZa41chTz3fb9+HUBUN/w9CfX9s05HEy6SDb1ZLXMvTEqzc1VHoGpung==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BxVZ81BTfkNqqP4bkkMcvtF7dFEc4NiiDSDx4uBtWQ=;
 b=xeot+LAW7RzZ+/UbU5iUG7arBEefbBRqmnoUE/KRAtZMmDtLOnpXQjdpErVtv1pJEJDxCAIelSJIzApFubwKZ9b0FddHns9xsYLhmMXrw2qXJiHvk7/5V8g6yZ8XjW25wKPGlBeERNaf2ZsR8fxgeQc0syYwWUDa7BJ0e5SdpMY=
Received: from CY5P221CA0149.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:6a::9) by
 CH2PR12MB4310.namprd12.prod.outlook.com (2603:10b6:610:a9::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20; Fri, 15 Sep 2023 10:59:43 +0000
Received: from CY4PEPF0000E9D9.namprd05.prod.outlook.com
 (2603:10b6:930:6a:cafe::59) by CY5P221CA0149.outlook.office365.com
 (2603:10b6:930:6a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 10:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D9.mail.protection.outlook.com (10.167.241.77) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.19 via Frontend Transport; Fri, 15 Sep 2023 10:59:43 +0000
Received: from hr-amd.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 05:59:39 -0500
From: Huang Rui <ray.huang@amd.com>
To: <dri-devel@lists.freedesktop.org>,
 <virtualization@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] drm/virtio: add definition for venus capset
Date: Fri, 15 Sep 2023 18:59:18 +0800
Message-ID: <20230915105918.3763061-1-ray.huang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D9:EE_|CH2PR12MB4310:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1d2c60-ffe0-43e9-eb90-08dbb5daddd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x4Ol1Pl7E3m06Tem3rjiUkJZh8ppW68/xdxt2PJ8Bzv6Z9pDEEt7Uf3V0O5PWmo72Qmazf7gDtUb2D131UbmuGL1rRoTsHPLxN/xdQuFqT7Rv3+B9v+skh79IifAOA4G2v1itFwcsf1N9gnR/hiNWlmiBS0GYFuDa0bKSnsaHzmUT+ZJ3CPjJhvDdNF2wXMimhwDlSX8Cj27bL6pOOnlGIWz8/Cu97azNUC3S1JUc74ilM3l4kFKunmQ2iS/F7I0zfk71vbBtW9UETvL0WPO+z7EszL+uCdn7EzSgnqUu4YOcnaa1I+hV5DEogPRjzY9lTSMtWU6vnjR1a1SuLd4ucC+pJBspgdynJgGgLDO2IlADclxU7oqBbG8FD3bvQUxSaQCFkpYSyGd4vDlGspM/GxmBXTrd+vozFMF3dOqaB0yAA13QBcR4k6TrWdskrz1QQhMozOLUr2nBcqjv2u3F6DqoZIigdNs4SMYBXCke/VSWD44y71y4EeZIBjceWc9Dj9IrhDSuCb+ztPV/1KOL/8ykrtF7tYDU1YE2p8pXSmh3dV8dhBGvOD1IGpR7M/mE35iZeCLraZSjWLXeRfCYwbE/IcAfCZQxiAHTAbfALTDSWp1UNk2yJn8c8DS4INof07U6C7ydPdzGsE8gN/VaHiGXdhjCLk2MZLZXm4FuTrIFr5nfYWn0g471G6p4nPooRsLst7/tAqbT+uYOtZvpVfIDSurMQyxNaLVjX5FbyWrhcqe1MaOXx8V7AaDEPUW
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199024)(186009)(1800799009)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(2906002)(5660300002)(36756003)(8936002)(86362001)(82740400003)(356005)(4326008)(40460700003)(4744005)(8676002)(81166007)(316002)(6666004)(54906003)(47076005)(41300700001)(36860700001)(1076003)(70586007)(110136005)(16526019)(7696005)(26005)(70206006)(966005)(478600001)(426003)(2616005)(336012)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 10:59:43.0983 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1d2c60-ffe0-43e9-eb90-08dbb5daddd1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4310
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Huang Rui <ray.huang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This definition is used fro qemu, and qemu imports this marco in the
headers to enable venus for virtio gpu. So it should add it even kernel
doesn't use this.

Signed-off-by: Huang Rui <ray.huang@amd.com>
---

Hi all,

We would like to add a new definition for venus capset, it will be used for
qemu. Please see details on below discussion:

https://lore.kernel.org/qemu-devel/b82982aa-5b9e-481e-9491-b9313877bcaa@daynix.com/

Thanks,
Ray

 include/uapi/linux/virtio_gpu.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/uapi/linux/virtio_gpu.h b/include/uapi/linux/virtio_gpu.h
index f556fde07b76..0e21f3998108 100644
--- a/include/uapi/linux/virtio_gpu.h
+++ b/include/uapi/linux/virtio_gpu.h
@@ -309,6 +309,8 @@ struct virtio_gpu_cmd_submit {
 
 #define VIRTIO_GPU_CAPSET_VIRGL 1
 #define VIRTIO_GPU_CAPSET_VIRGL2 2
+/* 3 is reserved for gfxstream */
+#define VIRTIO_GPU_CAPSET_VENUS 4
 
 /* VIRTIO_GPU_CMD_GET_CAPSET_INFO */
 struct virtio_gpu_get_capset_info {
-- 
2.25.1

