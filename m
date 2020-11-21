Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131992BBD2B
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 06:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A874B6E970;
	Sat, 21 Nov 2020 05:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2081.outbound.protection.outlook.com [40.107.220.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3156E96C;
 Sat, 21 Nov 2020 05:21:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kytmUGLmC0ttygU99EWAY3bDOLkfH7yqAcgKn7dvUY7+5rEC8WKRsp4UyjRg4VupqqlCiHv6vzZyjIYWgOCdhunnAnyNaK80BpM693t6fbsBbpnQXO5cgjxKd+LTUkZvvoSzRFWRnz70mvoseDpfHGlOd7/mXHI2vAmmQyS1ZcPzwSH2j0whbcA67dDgmh/ApPu7CsYdfiIAOU04LaYQcgDYFBsOQAxBzNiin91LGY9BAyE4eepguVTFWe1BVGN9xDQFurYegDU5mrGxjyY1hJqWSPPgfgYWSBlwKM5USS7vkMjXTOWCAKcHw3DaXv2GIIv3cE9pYxnh/4ujK70nlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g4P2bOlGrOwKXmH0k0bxcxQULMQBq239UQg2DedGwo=;
 b=OsIyUfD+mBgC3v8X0BafC22kVnD/mb8gzLOmHnE+p/4dN7RHbiEFf3Cseo1qP1p63pAhlKs4M434PpFu2FSakxa45xdoDs05JBH08j4LnLhHWyHHvwxik83VKS49DzDlmbL+L8P4zlZ+IN7hsNMWpLXzJT305WaYzqnzhPhCURSHxLl7EIvZRdZz9EIw7wmYg4PNqY5/TE5LlRBodVuaS9/xBtS65j8ZKMrNpJ2OdJhyOnY7WpxFKf0v4Xi6OE3l5oPvi7scKQCxn3adhg5qQ/SgODQjlOaorUHSMV8jQvT2T/3zOqsliOd77jfIxMu2Pw8xzP1ZcCL7E0IorWEeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3g4P2bOlGrOwKXmH0k0bxcxQULMQBq239UQg2DedGwo=;
 b=WTxNutdHxu5c9F6FtJyRDyvubvzmeDOogn7laCQwrCS6wzXxoMmmpzpdyx/k+ycPMHJd4e8e1tg4fENQl4TQbAyvf+CMgkgiXHNM3sGCQrdOv0WCed+yWK230cvS/RJMDvWy/45+N1pahDEmZEY/NWaljIyN/FYPxGR7I2IkmjQ=
Received: from BN3PR05CA0036.namprd05.prod.outlook.com (2603:10b6:400::46) by
 MN2PR12MB3582.namprd12.prod.outlook.com (2603:10b6:208:cd::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3564.30; Sat, 21 Nov 2020 05:21:33 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:400:0:cafe::a7) by BN3PR05CA0036.outlook.office365.com
 (2603:10b6:400::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.15 via Frontend
 Transport; Sat, 21 Nov 2020 05:21:33 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none
 (message not signed) header.d=none;lists.freedesktop.org; dmarc=fail
 action=none header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 165.204.84.17 as permitted sender)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3589.22 via Frontend Transport; Sat, 21 Nov 2020 05:21:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:32 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3; Fri, 20 Nov
 2020 23:21:32 -0600
Received: from ubuntu-1604-test.amd.com (10.180.168.240) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server id 15.1.1979.3 via
 Frontend Transport; Fri, 20 Nov 2020 23:21:31 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ckoenig.leichtzumerken@gmail.com>, <daniel.vetter@ffwll.ch>,
 <robh@kernel.org>, <l.stach@pengutronix.de>, <yuq825@gmail.com>,
 <eric@anholt.net>
Subject: [PATCH v3 02/12] drm: Unamp the entire device address space on device
 unplug
Date: Sat, 21 Nov 2020 00:21:12 -0500
Message-ID: <1605936082-3099-3-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a2cc97-98b7-4dae-6493-08d88ddd4f16
X-MS-TrafficTypeDiagnostic: MN2PR12MB3582:
X-Microsoft-Antispam-PRVS: <MN2PR12MB35828DED15004106395BDB6FEAFE0@MN2PR12MB3582.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: terXCgw3NQ2R31REEXzV5EX2bRVljhEYDQISvJg9h2A+x94EcrCQZ+ECSDld3gVUM90DjrrRS17c/P8GD5rT8Hdp8IRjz56XYQZV6TzNPo/UQ32i/XWff6H85TBnXziA3Ghqi/2J4kKj40gTaxK+tMKahwwpzo/MtMC/4mpDXHcsJyK2TJW7fIKJUFf2fW28v7KDrEbrbcPe8PBo5hdX9ZgKD6n8S6liG3JDSVnttGpLN6tjzMA6i+QjlzoEE8uO7ayMMjnCxmuFA7ht8Zwt40TkbXPpZx5Dh86p6niNLfGPB7DF8VXZs7sZ+PON2zmNlx9188kLl+vYxsbwR3ukmu7sBcEzWnz3Ufo3am4LZ1VLC9we0vwpNzgMauyVFTBCnyRd/jS7mbJ8oINM07zJxA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(4744005)(426003)(8676002)(336012)(70586007)(356005)(54906003)(478600001)(2616005)(82740400003)(47076004)(81166007)(70206006)(5660300002)(186003)(316002)(110136005)(44832011)(86362001)(4326008)(7696005)(36756003)(6666004)(83380400001)(8936002)(7416002)(82310400003)(2906002)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2020 05:21:32.6621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a2cc97-98b7-4dae-6493-08d88ddd4f16
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3582
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Invalidate all BOs CPU mappings once device is removed.

v3: Move the code from TTM into drm_dev_unplug

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 13068fd..d550fd5 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -479,6 +479,9 @@ void drm_dev_unplug(struct drm_device *dev)
 	synchronize_srcu(&drm_unplug_srcu);
 
 	drm_dev_unregister(dev);
+
+	/* Clear all CPU mappings pointing to this device */
+	unmap_mapping_range(dev->anon_inode->i_mapping, 0, 0, 1);
 }
 EXPORT_SYMBOL(drm_dev_unplug);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
