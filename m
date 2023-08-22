Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732BA78482F
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 19:04:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CB810E3B1;
	Tue, 22 Aug 2023 17:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2072.outbound.protection.outlook.com [40.107.94.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F53C10E081;
 Tue, 22 Aug 2023 17:04:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RwsYt2LFXvyQCUEm7R8vaufTEkMtjb6BJRWPz78VfFpSdr1uIcCexwDFRYO4NqH1YzMOKGCOfpnHbLtmmJeEhHnTymFJxFgAF+vgKieJ8fL13faiWW+Znr0X8srksPMa5nGV6P5OSVeNMi0dufG9AuzxH0Q8jZALOM++WsCKI1Q4wVwU7BgWqWkNddFOoM+k+984PesZAWKgBk4OxUnbbaA/LV2YwY7zeKNIzTH9+Y2FMJHbqaAnutWWttV95Myp0lEKkr0WYfDCCg3oJG5y2b/A8wQUC+Qp2rrZXAdfWN8ZxrxWCy9xJpigCFeyPtdOCqryIvFUrLU+O60wKyd7Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjRBJRxdRyeW8SkkpY42Wfz4bLZMQ/B7Qo6MGIIWBTM=;
 b=YXfP+3lNrAyl+nMARXoE24q3o+qz6+scgX+j+lS+BFs4YaZ8R02DhSQef72grGQ6la6MJghnqY7NigQ+A9WawOU/450R/URnOIDiVOk9QJqdKVM3rMj+O7fn0nLIT2BSn1cvetNUrpFsDZ+g0LwCfXegzOPDI/ZSuVi/OqDr4JS6hyGe2teu9c1OdHEhqz1eXlrGWUS/hbf9rTWKFtSo6ixOITZ44rfH89TR8TP9v4fAwJIxoEH3FdcOa0WRC05o3pPm011oCgD4xahDvy5qLA+rmR9QyGmv3VaxcU8CFPijqyvkNfMW03hRJ98N5h+Kb9k5B0thhFJo0nQv8cwnsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjRBJRxdRyeW8SkkpY42Wfz4bLZMQ/B7Qo6MGIIWBTM=;
 b=qtIxL2FDOXgtjQnJVUiHFKzLqwJC51UtOUsD4bFjbOfP5ooaCABwpFXb0Q83Qv2dsVJH/OFdC7QGmywDA6x9I5hGaLWFkW0nfdYp3zRekbpJut+lzOjux2u077w2tcm53vY2Bpc2P+PnBCQOUQ+IiAyCdyHW/SkGjFx4PiZmCGk=
Received: from BY5PR03CA0030.namprd03.prod.outlook.com (2603:10b6:a03:1e0::40)
 by CH2PR12MB4247.namprd12.prod.outlook.com (2603:10b6:610:7c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 17:04:02 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0:cafe::60) by BY5PR03CA0030.outlook.office365.com
 (2603:10b6:a03:1e0::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Tue, 22 Aug 2023 17:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Tue, 22 Aug 2023 17:04:01 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 22 Aug
 2023 12:04:00 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: register edp_backlight_control() for DCN301
Date: Tue, 22 Aug 2023 13:03:42 -0400
Message-ID: <20230822170343.137958-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|CH2PR12MB4247:EE_
X-MS-Office365-Filtering-Correlation-Id: 1eb5ec72-4a4b-419a-ab42-08dba331c8c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qLg/1gS1O4/u9YyZkiIUvUvt5CTAnZBa2rNH2n/y19aNmSCUZQw/aEdR02PZikvjYMhOc40o1eHXvFLopzfsp+hTxlcpqywVDY88ZIMjo5z4KILpQQ72bouf6/nMDFYrTd05MJAIdifEHCO9m24XQBhqdTTorr6hg/zH5/5sWTRgJN58sgUezPgJP9jFDiBMk9ckeWsFKZWZTvXuUDtTK8g9NXms/FtLl/xY+rLGfPmzZEZImYOwv3wADDFMOlozxoAJr7xZlM1wF/Lqu+eKg9mHzGFGmOgy5oWlV9CwmHcl8GWGrVHQWwQj0PTE5lhWHpuvXA2qud8+WYGxXCUtV0FbWXB4VIZLE/hhmuaLg8qQ2xK8kYvu6NbLC/2mfF91w8WrVe9zeuH/6UCwTaH6S8DL11vFhU/fDnALvV9XyghkXmnHbTwgwx3jI3jaL7kisqOfErptXF2dWG39pNexZwe94z07yVna/ZTRMAWzQUNtJ9+Uum2HxNYYEwD/SPiImJ8LDdoXNZ+jsl7cNrF/nBc3ppKmwD/gNCZ1+gXj7nnaF3HBAaG9Wk4IbzaYN/bC1lsGsc9Q0hC0zAtaVkBq3pvwmxDjHLDGYiFAaHYUIev6jSFeduznGC24UhDTZJ91mF3hu1j+Ksymglhptk9zZocvatKmKsSACYC81W3b0mTqkXxCW7xuBTeYg0sj/MKvkoKrZvRPsHJEfYrGd2nWyZsX5u7jyWsEO3UxGUqOq0ifLk//+mdz+bD0suzps3oBYMbiK5xDo5pf0Jj/OjIAmf0ebdQViPtfAN44FukpSos=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(186009)(1800799009)(82310400011)(451199024)(36840700001)(40470700004)(46966006)(54906003)(6916009)(70586007)(316002)(70206006)(966005)(8676002)(8936002)(2616005)(4326008)(36756003)(40460700003)(41300700001)(1076003)(356005)(81166007)(82740400003)(478600001)(6666004)(40480700001)(83380400001)(2906002)(47076005)(36860700001)(86362001)(44832011)(426003)(336012)(5660300002)(26005)(16526019)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 17:04:01.8758 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eb5ec72-4a4b-419a-ab42-08dba331c8c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4247
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
Cc: Swapnil Patel <swapnil.patel@amd.com>, Leo
 Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Wenjing Liu <wenjing.liu@amd.com>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Wayne Lin <wayne.lin@amd.com>, Alex
 Deucher <alexander.deucher@amd.com>, "Leo
 \(Hanghong\) Ma" <hanghong.ma@amd.com>, Jun Lei <jun.lei@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As made mention of in commit 099303e9a9bd ("drm/amd/display: eDP
intermittent black screen during PnP"), we need to turn off the
display's backlight before powering off an eDP display. Not doing so
will result in undefined behaviour according to the eDP spec. So, set
DCN301's edp_backlight_control() function pointer to
dce110_edp_backlight_control().

Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2765
Fixes: 9c75891feef0 ("drm/amd/display: rework recent update PHY state commit")
Suggested-by: Swapnil Patel <swapnil.patel@amd.com>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
index 257df8660b4c..61205cdbe2d5 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_init.c
@@ -75,6 +75,7 @@ static const struct hw_sequencer_funcs dcn301_funcs = {
 	.get_hw_state = dcn10_get_hw_state,
 	.clear_status_bits = dcn10_clear_status_bits,
 	.wait_for_mpcc_disconnect = dcn10_wait_for_mpcc_disconnect,
+	.edp_backlight_control = dce110_edp_backlight_control,
 	.edp_power_control = dce110_edp_power_control,
 	.edp_wait_for_hpd_ready = dce110_edp_wait_for_hpd_ready,
 	.set_cursor_position = dcn10_set_cursor_position,
-- 
2.41.0

