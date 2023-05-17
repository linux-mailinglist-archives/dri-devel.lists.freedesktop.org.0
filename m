Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FF97070D0
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 20:34:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6CC10E2FB;
	Wed, 17 May 2023 18:34:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60FF410E22E;
 Wed, 17 May 2023 18:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JYPbCejWiP/4rDAhzW6qmDSb3X+z50LITwusbPfDe2GVemNq76oU/respW4ykkPatAvUJlSQ/7ZHAV6SpugztGRYKHBVUjK8FtIQSGVrMYgLja+yJ6r0J91t8EyreY6ZdrKdfz1W9aIRnD1bdHbO9QPs8bYkw7cjkIe5awi18ySZDs2TkPjydmD/S0dcQsOWxr58Bln+eqSBydlaSuFDyI58GOS8dmpaSc56hygh13RN3zi93j7eeD6xkpaOgjkIBiOd67Ag9vb5EtElOWndpAr0tpVhdihiQ4/xrbrnBDXKr/tCz6YTK47mSIYCwfkFYoPoMpwb705tXw/TXLRYew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jhbo/StYlLnJNWpVlS+CXRHr66jym3+B2/ZPhrPK+0o=;
 b=eyiyfci0DD7hpGhXDG4QmUrFsmdP9QQV4H2l79dKpC3+/8EjXOxHoQDiQnUvH0PXvzTG6AvjsZICeX2ydJPANx9V0Dy2nrj8hvioP71f01UDK1J+X2c8qGOtw8hYA1KHpGJn6WqHeoSiwyzSA5nTmlZGcmDBQkQZOX2STfrXavvT7F8YYzGmlluvbCw0UYRTxFr5Gv6/XwcYz/JnIRfRrPejX+G2vXdhJR7ZvZZ0vBR7bel2apDxdq5TYnIxhR1N3lkBSR/1sDLdkmLL2DH0aazCDopWxQzdxfAkdUW2vmh6sF50PoGTm45VeqK6PZSPij0stgQT9aTLqihUfD9BGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jhbo/StYlLnJNWpVlS+CXRHr66jym3+B2/ZPhrPK+0o=;
 b=Qugm8fAmGdKlQW00rU/XDSnmep9weyLSUKk+lxQtP0cFxbyRf6A5SwevZXYwuz0ACuHMDqZYik8Zm5bk/Umss2A2Ofn6my2E+xQhmR+8xvkSy6RMAWZs5VAVHRPx0sIhZcyT/7+q2QohrM5rq1t22kcxeyUlM3mbhmQ1gmaN1zA=
Received: from DM6PR02CA0063.namprd02.prod.outlook.com (2603:10b6:5:177::40)
 by BN9PR12MB5164.namprd12.prod.outlook.com (2603:10b6:408:11d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33; Wed, 17 May
 2023 18:34:31 +0000
Received: from DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::fc) by DM6PR02CA0063.outlook.office365.com
 (2603:10b6:5:177::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Wed, 17 May 2023 18:34:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT032.mail.protection.outlook.com (10.13.173.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.18 via Frontend Transport; Wed, 17 May 2023 18:34:30 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 17 May
 2023 13:34:28 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/amd/display: drop redundant memset() in
 get_available_dsc_slices()
Date: Wed, 17 May 2023 14:33:45 -0400
Message-ID: <20230517183350.314082-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT032:EE_|BN9PR12MB5164:EE_
X-MS-Office365-Filtering-Correlation-Id: 7834d83d-9ac2-4fca-9dcb-08db57055aa8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: esHtKSzpycsP+oYRNdKv4qphocZsEzn5lMwSJi0mTyxQNNqEuG4UUll/WgqN0cgx5IROjSxbDFUQMbP1xqZgynfzo6st7YfsoVMo+DNinfL6oeFA7vOMo+U2eGc7qReRY8Co0/ANXI2tSD52hR/fthGIz5aaftnfGNUKgk0p3ZZysrHIw0DwNf5f24HgdUGJEjYeuFXWcUEL1AHqwJ1/r1xPxpcrZjIHipidXINrGqF3ymVcLF3AiWZm609vMsDRIEVyuWIZWcL9xeo+v31ah+LnTfhx7PiER7O5xznf+E/z7iDNIIV8fx9684YRgQJ8HfzTDQYncgSuXIdt/jjWu9hlE+uaWaIqnMuTBuvn9pG6wROlkrnpTdwJqmt4NF18+9/GVv9Q2Qz2lElkWHEUMSewacziJin954YINZaxA9ZM4ua/n+xhkyON/D7ihjN75FoGpmfyaHx+zAT0d+cYSeU1NmQMeoR5yYuwDjK69eDYMHNLs5zJdp9GYuzG61J45vAjaEVq42kUKUmg+fg4T/gqVEEp3w1GipLhtqfnSFe66ZEKVyjP7+iS+VKNhYKJON3VLSnbIE737lRPUUBOJyjPs9puSDH4xPG7z57XzMnuNXIZ1CMdHFnNwEVIay0TwFIrTg1U72Vm24osgSHjOPFrjHURUOs6eoc9xb77Xh2rAkJxEslu4uo2XnPld5frKp93EXAQlPSgmJ9lqEddHWjv/QCYxolwk+2tCtf4ZYNgZf8Cr9GvEgpJyC1gPLJ6OB6UA3R69VW9b/Kg58o1VBqBumEjJk1coJru3FpLgOtmJW35hRo+LZe+a9nsKMH6
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199021)(46966006)(40470700004)(36840700001)(40460700003)(70586007)(70206006)(4326008)(6916009)(478600001)(316002)(54906003)(36756003)(86362001)(83380400001)(47076005)(2616005)(16526019)(186003)(1076003)(26005)(40480700001)(36860700001)(426003)(336012)(44832011)(5660300002)(8936002)(8676002)(2906002)(6666004)(82310400005)(82740400003)(81166007)(356005)(41300700001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 18:34:30.9885 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7834d83d-9ac2-4fca-9dcb-08db57055aa8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5164
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
Cc: Wenjing Liu <wenjing.liu@amd.com>, dri-devel@lists.freedesktop.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Nasir Osman <nasir.osman@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Leo Li <sunpeng.li@amd.com>, pengfuyuan <pengfuyuan@kylinos.cn>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Cruise Hung <Cruise.Hung@amd.com>, Mike Hsieh <Mike.Hsieh@amd.com>,
 Hans de Goede <hdegoede@redhat.com>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Leon Huang <Leon.Huang1@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Hersen Wu <hersenxs.wu@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

get_available_dsc_slices() returns the number of indices set, and all of
the users of get_available_dsc_slices() don't cross the returned bound
when iterating over available_slices[]. So, the memset() in
get_available_dsc_slices() is redundant and can be dropped.

Fixes: 97bda0322b8a ("drm/amd/display: Add DSC support for Navi (v2)")
Reported-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index b9a05bb025db..58dd62cce4bb 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -645,8 +645,6 @@ static int get_available_dsc_slices(union dsc_enc_slice_caps slice_caps, int *av
 {
 	int idx = 0;
 
-	memset(available_slices, -1, MIN_AVAILABLE_SLICES_SIZE);
-
 	if (slice_caps.bits.NUM_SLICES_1)
 		available_slices[idx++] = 1;
 
-- 
2.40.1

