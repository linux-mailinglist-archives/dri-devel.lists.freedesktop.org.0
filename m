Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8465A88D7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 00:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8621010E4F3;
	Wed, 31 Aug 2022 22:13:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72F0F10E442;
 Wed, 31 Aug 2022 22:13:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MZEQt14tCU2uf/emXBuyO3EHQyzJRbeZMjbA1NPpeg/SETBuo0izUqCUjLkMKaSLsjfGnXToQsRi/3vrZ267E70p4Vs6pG2EVW7OBgCQ6f7y4VzLLFHMSRO/VksLG8w45Y4JxiYOia7msAsPHi05DT1wx1cO4jKCbKmXV12s341vJDTGnrWhEMcHmWjyfprB41hwaFm8Wv0QtGJsYF4+WBTdDORsWwOz+zWkzR1ThPzS9eeQdJQzlxDw82nBe1tuGgNo3otTjjsqA81Xyur6YXPtxY8iiGVVigfTDySrjY3Aid8cyQHDVFXovFWSPqVg1GlEiyAASOxAGbd+EMkBBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BKKWaBub33J75dHKFnyMRakUlufQOC1jqW0h1q1WIMw=;
 b=A0t/b3kg8/+dlp898wSvLKRP4BSoiprQwnOc4abiKyf47wDp08zvZMLJf7JmyrYiWnVfdKo8Em4k+vVSRDZooTuC88Da/BCF4cdpJaKPmvkC0AD2JRhZhWqIe/aQukGKl1ZwBH1HYv6Zqpi0y0df3qN02KsWLd8JmBcqombfjt8whIiH8bx2KjiygHkY34ZGSARoI4czS5Z7U8cG5RtV1OMe5F+NXuIe0MLMnrf4bShoqZevk70SE3MWj1hfTFxTeak/0s+ej1Ro1IlUYQc28bYLJJVqWSN518zYU6MRdLYLc6/cYHsdoOB9nJOMbZgVOZxZK2ZLIp8VlAuLMQsriQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BKKWaBub33J75dHKFnyMRakUlufQOC1jqW0h1q1WIMw=;
 b=Tng0k9t5cl1kNRHqHmoZWLGcH9qDNHsylhj/9CsQ3sxZpaNC4OfpP/VjDHoMGBP1ZP2B0tvewej+rSj2GplnNR2bH9Z0z+qYIFwKg31wRxs7MGzmYWB8dIMR8fl6ZMxGz4Q0y9bAYPopQ50esMhfHVmy8KsH0VIw+D6ggqhjrmo=
Received: from DM6PR02CA0132.namprd02.prod.outlook.com (2603:10b6:5:1b4::34)
 by DM6PR12MB4435.namprd12.prod.outlook.com (2603:10b6:5:2a6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 22:13:26 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b4:cafe::6f) by DM6PR02CA0132.outlook.office365.com
 (2603:10b6:5:1b4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10 via Frontend
 Transport; Wed, 31 Aug 2022 22:13:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5588.10 via Frontend Transport; Wed, 31 Aug 2022 22:13:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 31 Aug
 2022 17:13:25 -0500
Received: from jzuo-linux.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Wed, 31 Aug 2022 17:13:25 -0500
From: Fangzhi Zuo <Jerry.Zuo@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Ville Syrjala
 <ville.syrjala@linux.intel.com>, David Airlie <airlied@linux.ie>, Lyude Paul
 <lyude@redhat.com>, Alex Deucher <alexander.deucher@amd.com>, Harry Wentland
 <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/dp: Avoid Reading DPCD_REV Before Native Aux Read
Date: Wed, 31 Aug 2022 18:13:21 -0400
Message-ID: <20220831221321.748264-1-Jerry.Zuo@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f1e7292a-321e-471d-8fb5-08da8b9e070b
X-MS-TrafficTypeDiagnostic: DM6PR12MB4435:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Chv8vuVurB7zFIcxMSjNKs62m0IBGSe4vAA/hLqXdRRxV8//Sdj7lqe1U3EFnjl5pBHCgRjCrwr7lNxVb5wo9rU+fTlOA5SPHx9aMskVDO2SdkLyZ0fRpMlQD6AwBOzp6g6mT2UzUcXwB06h41uABBi7VpdqfDmG08ohP+MCwupUqRgkaFZtPtOh2+Jou9ZSEaOVBGevsw/xMEMPjMeP9vKmS2Nv5O84sCRtBPlnXNALyZF3QqjJ63XxJ4pautQ3R+q0s4uf/GwBAr5viZzKn5CKytIDD+jehZu1CSbKV4Nr30QNFphsHE8RjLxxJyqt6fB6KoYAyDmbCjZz7fNB6gZhp7yLQHsADWOZww800QLTV4MCcnwsH72JnbJMLkrZURgq44t+oHWK5pKqc8EeFjY5QKG0PIhvd3JpRFgiliuP473BItETL9WSd4VA72IyuzF6NjO3nAHmiOKpv3Sp7hXQixNFckYd1ELS/YYJ1AloAsnrR7vCCYhyexJpyAWmtmnSBW60tNXHBXwFMRzRNNgGL9eeSsxQLzOSD88MK8Fsa7sKQm5HM0VTmtKuTcoYoEXcTkfhPYY3hlD/m8RU4vPgrA0GDyDtV8xC9zCiV24Z4XZw+w6frSOcrgUZOLEz+AevYeOXWXV+/G6zclfJli9CYvyhUFxgdCiI60fk6L/Ohd15ie4WJGYvLw8Hq1b0kVU/6SkXUJsGf5ZD9JHu4N37eTBDzz3s4m8WT3VJi1XB+pJddIn581SFZ9b01q+h4KuvyGErA4z+Wg/mzRaWarwcRda+nN1171xCzwtcn6f0I30h1sSB6vRTR6YTrvF5
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(376002)(136003)(39860400002)(346002)(396003)(40470700004)(36840700001)(46966006)(186003)(2616005)(1076003)(36860700001)(83380400001)(336012)(426003)(47076005)(81166007)(86362001)(356005)(70586007)(82740400003)(40460700003)(8936002)(40480700001)(5660300002)(2906002)(70206006)(4326008)(8676002)(7696005)(6666004)(478600001)(54906003)(110136005)(26005)(6636002)(36756003)(316002)(41300700001)(82310400005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 22:13:26.4700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e7292a-321e-471d-8fb5-08da8b9e070b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4435
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
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The attempt to read DPCD_REV before any native aux read breaks
majority of DP2 compliance.

The spec. requires DP_SINK_STATUS to be polled for the reset status
DP_INTRA_HOP_AUX_REPLY_INDICATION during the clear training stage.

Polling DP_SINK_STATUS each time gets DPCD_REV read first
that makes non link training regsiter DPCD_REV get read
during UHBR link training. It violates DP2 compliance.

Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e7c22c2ca90c..c7aa5bafa667 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -571,24 +571,6 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 {
 	int ret;
 
-	/*
-	 * HP ZR24w corrupts the first DPCD access after entering power save
-	 * mode. Eg. on a read, the entire buffer will be filled with the same
-	 * byte. Do a throw away read to avoid corrupting anything we care
-	 * about. Afterwards things will work correctly until the monitor
-	 * gets woken up and subsequently re-enters power save mode.
-	 *
-	 * The user pressing any button on the monitor is enough to wake it
-	 * up, so there is no particularly good place to do the workaround.
-	 * We just have to do it before any DPCD access and hope that the
-	 * monitor doesn't power down exactly after the throw away read.
-	 */
-	if (!aux->is_remote) {
-		ret = drm_dp_dpcd_probe(aux, DP_DPCD_REV);
-		if (ret < 0)
-			return ret;
-	}
-
 	if (aux->is_remote)
 		ret = drm_dp_mst_dpcd_read(aux, offset, buffer, size);
 	else
-- 
2.34.1

