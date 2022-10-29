Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5295611FB8
	for <lists+dri-devel@lfdr.de>; Sat, 29 Oct 2022 05:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3F010E227;
	Sat, 29 Oct 2022 03:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2087.outbound.protection.outlook.com [40.107.237.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E46C810E227;
 Sat, 29 Oct 2022 03:22:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZZyql+/TBoHgnwetTkOh8P3GQXtXE5sNjcmntI9PIXY4lzRUteeSdgfS8cSKnHroE9Vp3Uj8tfubdkaHJP2R7/twBWiMdcYlmVn1ahlJWz1p/1R188FKxfXGn4c4D9ZVDqcSafS7Vsmsnxi7nbbnF9/53TvZ1zjCzF0W+gZBSNMaD4BpdjJbVKZRxck1F5a9/Vl8SNglRVM7WKkSayPSlsU+E2U8JfoZ0DhcpD2jbDWaTnyd8hSgi2bGQ6UDKRU7QMzMHNCGj0i+ONvJAaRjOk+/dxXeL2MqMnMzgfo8oYKsdTIeYia8vCnKwT3bKP1n8GVEb2ZE5aYr9V7orVEpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/INPRjAVlT09d74HWA/krhOnbVoXF/JAOiV828tOo0=;
 b=b5cnZajdee+aiBhcBMUiOACdsYXeC3hHK0gUPtq1buY8JxzAmmRySXjjdZwG0/1uKBurhBAud1n3DzR6LaM8f4FLaGTnHQXq55Hk/CRbLscbuL3BZotXZlwcGhToos43QpiyYKi4YBfuNECYQVJ28AN3CadOfNu1et9FMt5U9qNFiweiufQpnPi6v+QVWfWYZHKPNwIe7Ai8JthclHs12nAml0Qh6HPgGMzR4KNQlqYRfjlu/FFLW+TV2tvG/ncIAU1eSprjwGY13zQQtj29023MEh2u+F0rbusGHOiXOxGZDOxW+5sxxmEmS0QwLi4bRTogUyDmi6nA5ncs5kfAQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A/INPRjAVlT09d74HWA/krhOnbVoXF/JAOiV828tOo0=;
 b=YtwvEubnotzDwPznBHGg8AV9IDtsraprWgcUDa/YstZrGG2INaZe4PNGMJzSAO3RwCzwbkWhNrf0Us1if9titEPg/VlK2VDHItSdhjaSZEpYQvFzi28GCT7eWbg5cB+4bQEUUPbokgzKh4eTxvtfjIO8N2ru4eOAzzZfGx6/qU0=
Received: from MW4PR04CA0075.namprd04.prod.outlook.com (2603:10b6:303:6b::20)
 by MN2PR12MB4302.namprd12.prod.outlook.com (2603:10b6:208:1de::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Sat, 29 Oct
 2022 03:22:06 +0000
Received: from CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::50) by MW4PR04CA0075.outlook.office365.com
 (2603:10b6:303:6b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Sat, 29 Oct 2022 03:22:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT045.mail.protection.outlook.com (10.13.175.181) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Sat, 29 Oct 2022 03:22:05 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 28 Oct
 2022 22:21:49 -0500
From: Alex Hung <alex.hung@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <Rodrigo.Siqueira@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <tao.zhou1@amd.com>, <YiPeng.Chai@amd.com>,
 <HaoPing.Liu@amd.com>, <hacc1225@gmail.com>, <mwen@igalia.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: fix an incorrect comment
Date: Fri, 28 Oct 2022 21:21:10 -0600
Message-ID: <20221029032110.151981-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT045:EE_|MN2PR12MB4302:EE_
X-MS-Office365-Filtering-Correlation-Id: c3cff235-1b00-4a5c-3b14-08dab95cc160
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H0W2nYkyn9UMURRp3hxkFdHGT+RtFYAX4FPnutTcd/tPE4fBFWmv0DFX+SyeO9l11IGqodutlV5t9/D0k+P/Cb+UOEcW+f7qgqLT62Oq5Zzx8aelYuDivIYYWj2wsMzaWxauVLgDdEDUXv8qyhYHnztD2J5D2LCuyF5CKZUDbF7XJI3yRySsBQ5daQmwuIhLk1V9TFqFWHhp5dfdLMa9HhuHNF9t4XpKFhY1LRktHPmJOPtZGalka+QIySN/KlyozGOsW07a+TqOAdfpnHdrkIJzF+JmDT9IddxZQK2SXJzAT1WFxL7wZ51rWfEKuJsddQv7ABwRuBr+Oke1HdJyAKE2vwBdpkn3BI/4hsJjGKWF3Uwxc3HbM0/JwyFtRf3XOMF4PAaQeNbNOxuEh57ALzn+lT8HykSXG8aGi8baOB048T2Xa8P93dRdtj2Q1sc8R64H8wCCLLNT2BSULUL9bZva5XkgCz2VvjbHZ6itSZByPr2JI6edSEm/xiNWzgCTspWGASxCFPcLqRcsD/AURNpxRYciHOHxbY3FhwUZuUvPVrjq88j/0PF0ZFp0giK9MOCNFQtvh7qvnOJ0zb1GdtIKbNLmvjJ7P1ccrwyyUHsIH0FaEu5/tpVX4RCxIMztfBAu/MiEfrbsHRiDd5EiVgGSvPsdHDLcujWqM2ujuNHYwhm4zSlA3RMmN6C1Jk7ietwKBemF5QMbHlzDhFc4KtD6nX0mqH2b+17fMaSIg7HrY2dPVJveNpvHWEbIAcO3zIr0vS+mZfRnDeKIUhouoGX7+aOhz4MeueTwnkX3RSXvxJm7NQS1P5M4fBX2HAxAfZXn7qRtPyWWkvRqSxB+5u7dYhXK8y43I5QVmpMSOH0VIzKZ7llDkCZCYU7nlxcd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(46966006)(36840700001)(40470700004)(426003)(47076005)(8936002)(81166007)(16526019)(86362001)(356005)(36860700001)(82740400003)(921005)(83380400001)(4744005)(44832011)(5660300002)(2906002)(4326008)(8676002)(41300700001)(70586007)(82310400005)(6666004)(7696005)(70206006)(316002)(2616005)(186003)(336012)(40460700003)(26005)(110136005)(1076003)(478600001)(40480700001)(36756003)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2022 03:22:05.7223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3cff235-1b00-4a5c-3b14-08dab95cc160
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT045.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4302
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
Cc: Alex Hung <alex.hung@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a copy-and-paste error. Fix the comment to match the macro
definition.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
index 63219ecd8478..1bf6b12f5663 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dcn10/dcn10_fpu.h
@@ -29,4 +29,4 @@
 
 void dcn10_resource_construct_fp(struct dc *dc);
 
-#endif /* __DCN20_FPU_H__ */
+#endif /* __DCN10_FPU_H__ */
-- 
2.38.1

