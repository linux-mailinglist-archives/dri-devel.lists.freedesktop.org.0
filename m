Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CAC5ECCA4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Sep 2022 21:12:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD0710E09C;
	Tue, 27 Sep 2022 19:11:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E5A10E09C;
 Tue, 27 Sep 2022 19:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mHIJ6O27N4KEIfsJRyTVDg9eiwfdGfbKFAhiFZ/ciQ0AzU2SyvUyZNeMdEgeW4t+ZM3ZpBE/nZOeMjkEXkjNken2QjGhJrSwUseXf+yvzKB1ZJbues1EBCzUqIRqBAKhJGWlhkj3EiK0/zpxKKdsmGLX0mFaAdpEAlx2mqhg06iPahAsx2SqcmllA1bFe7X9pxnhgwFETFEyxs5Y7GaT4F5mrHQgHlaSyiemQDOuuf2vTkochnFcrnzLg/bGx4pqWmu2VTfuEJ43vp2Lb6G5V/L9q0/VoHyOWxpKW7OD3LOttUITnS8y/1bO6I31xsIfHuxhRvV+fDBSRlFHnqPdMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CKZDZsjqiLsVF9M4k7cLm8jOdzq2TFRsnP4krAVXE9E=;
 b=RQMYbHJByq5CnkqwfMtqeRcSG//CFw/yc4r9uCmDb4zEnC1D8VCHUjneOGdWuOxpZ6orwCoEogqlQKDP62aqTA7/9/ancbjRMyJ/wtbvcwsDUBpcOYqJYQp2JTj+uf5NorTqg2TvfrXj44jluRM9KWKp7WGT1NaXoh08yafR29ITm+aBm9krd5czBfZ2XVZkuJ288CR4SeKtXhiJOhXnUvxer798vN6LL2VNkiZHFSt9ftn/vkWIvoKIztvO+12nRXyo8hUX3CjNDnTNFrpBDELg6S1Q7VM7zEsC8lTrdnMAoXqsnYTejQlO9gi0MGDsdLW10VCBVw70XjxNAH2p5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CKZDZsjqiLsVF9M4k7cLm8jOdzq2TFRsnP4krAVXE9E=;
 b=fuxxsVPjTtiB0t1Jo0sXqbvRKSq/w/dQTkOURaPvvoERzxYkO5rx1B/LEyyzvV4q/KG16/5TwQoo1PemDjTnKGfxTDX2hPI3RaoCSWNmh/Aq+wb9EV9FQdD8rRFB22ziJej8pn1sHStr0OtaeduqFwxmw07/PFc4uMcGSFCsB/M=
Received: from DM5PR07CA0108.namprd07.prod.outlook.com (2603:10b6:4:ae::37) by
 PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Tue, 27 Sep
 2022 19:11:52 +0000
Received: from DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::6f) by DM5PR07CA0108.outlook.office365.com
 (2603:10b6:4:ae::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24 via Frontend
 Transport; Tue, 27 Sep 2022 19:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT029.mail.protection.outlook.com (10.13.173.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5676.17 via Frontend Transport; Tue, 27 Sep 2022 19:11:52 +0000
Received: from hamza-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 27 Sep
 2022 14:11:49 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Date: Tue, 27 Sep 2022 15:12:00 -0400
Message-ID: <20220927191200.216488-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT029:EE_|PH7PR12MB6000:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c90038c-282a-4c4b-5e4f-08daa0bc22b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n4OdFi39LJdSQujQInlP1aHo0Q+mBibBYo2kIV38mA06GZPt1KTTzwS+kArd0r+3YqLbGIz5FSQuVqXwPJ6b1UZWHffpXCAloi5P6kYHMnl9W3YMHY+e4AIM4CSjgYoArU12BGwgj4tUH17sqpyQ4bA29Q4QX9L51cR5MRWOvyoA7dvqivZAgPs8BSDK5RBQum8f/63cs+rF97eFrhWcmUdNjG6eyDSA+vr4LqVEQoiE56di+6gU7OPzwSjnD2l15oQTGlEbSSZn2vhomOTasq551lK0ij3ujyPAUFhCyOOCJrHPSxkU2HQy07nhsB6Tbhw9V1N8KAp3c6ltOH5TQMgbMT2sFE3kWIi1q8ftjqy2PHao3cdWiYmevHzBFMCgxcivPmFnUzSdSo+5dhTCVca9ijpQ5cPoT79qanA6ix8PJ0YUwQDGoMq+wqw6oMW565YPTDivTxXD4iTxDZ8PgBk9BEl1Uq8JWgA9BicxLfwTL8Iq8R9SPIdjE74NTXlD1Z6Ms2WANLcLoY0+J70EnRjpTg/RArjXN3OyQFNF1VUlz6O7P3D1ltKVCmUkod6undnV7myBwoR6VWCrPHMgRwtk5WTsNkhBJCoSG1HlZVp8YF9FyrteJjiceNP5UJrcG+AvmIsW/mlwahEtIrVapPAkGmImQAV+51U5xNcAapNSttWrmwgHNBkASK4JoakDoLVmxRH4f1ybR291IcCJwvFmEenXkavs8Bb8W2n2/mkXzbxOhW/BAaiNgNPXnA3DEY8nQ+r2KX9Lkc2L/gKabkPrMhLEwWWIGtVh0y60XOORarfN5bvghChXuCKe3zuVI/mlivXkn4KA4xL1LC38xQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(396003)(376002)(136003)(451199015)(40470700004)(46966006)(36840700001)(70586007)(4326008)(54906003)(6916009)(356005)(82740400003)(70206006)(36756003)(44832011)(5660300002)(82310400005)(8936002)(40460700003)(86362001)(2906002)(36860700001)(8676002)(83380400001)(81166007)(41300700001)(336012)(186003)(16526019)(1076003)(426003)(2616005)(7696005)(6666004)(316002)(40480700001)(26005)(47076005)(478600001)(16060500005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2022 19:11:52.1860 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c90038c-282a-4c4b-5e4f-08daa0bc22b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT029.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000
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
Cc: Stylon Wang <stylon.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>, Paul
 Hsieh <paul.hsieh@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Hersen Wu <hersenwu@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Hung <alex.hung@amd.com>, Hamza Mahfooz <hamza.mahfooz@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Leo
 \(Hanghong\) Ma" <hanghong.ma@amd.com>, Pavle Kotarac <Pavle.Kotarac@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, "Lee, Alvin" <Alvin.Lee2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Address the following error:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
  527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
      |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
                 from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
                 from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
  241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
      |

Currently, we aren't checking to see if j remains within
writeback_info[]'s bounds. So, add a check to make sure that we aren't
overflowing the buffer.

Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/amd/display/dc/core/dc_stream.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
index 3ca1592ce7ac..ae13887756bf 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_stream.c
@@ -520,7 +520,7 @@ bool dc_stream_remove_writeback(struct dc *dc,
 	}
 
 	/* remove writeback info for disabled writeback pipes from stream */
-	for (i = 0, j = 0; i < stream->num_wb_info; i++) {
+	for (i = 0, j = 0; i < stream->num_wb_info && j < MAX_DWB_PIPES; i++) {
 		if (stream->writeback_info[i].wb_enabled) {
 			if (i != j)
 				/* trim the array */
-- 
2.37.2

