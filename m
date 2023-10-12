Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090167C7625
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 20:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D6910E525;
	Thu, 12 Oct 2023 18:49:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FAD10E51C;
 Thu, 12 Oct 2023 18:49:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iC1VWMeQL52d1o1nj2xiStOGEn7AKN6g7NBZxdq+TkRP490uehYBFBC7KPVXSJg+uS7xVywFZxT+jzuQ8aGBOGbudL+iRjz7VolbYj7v+u2136b3HpHcfAMG+3QOXt+85Pzm5251nNOLtdKB684bcJrwZfSvK3AP4pxK7FHtPw24zXAU2C0vfkJpBii3hDp9p8YXnQHFE/bTLEtFvsCDtsP+hxxs3TTgfwCX5vDKHDhmuKft24/r3oNwieS/oxLjlGdP+Rkw8lBTZJlXA7SpkY8JOImBalhAB/75+UaVCN/OM76woclP04ZeFwAYzQkUoLU5oHcQSmOgKTJrpk0ZQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQnmE0MYzyprnHsNdCIPDideFxJT64FWxrekr3tqxf4=;
 b=oLiaiera0mJoVOun1Oe910NbvSRleqshxjIY1lwFGTppV6wUW9JlDBjyz+dg4nxtkfQI6/1gC7zP6/9IkhOD76ei7mxsmgh1IsTmHg+Ki2sLivgU+Q0ZWb5YKLo+eWn+/v5UmetrioeSg9CkK8bWexnBlTVo8FqNeYzs1uU/mNhXW13tX+StHQNwnnfR8Mn7pmlIDefNo+2ZIpqjXUJjpV+2EwrUSjeryCN3Fm1hFFZ+8pWoSH4xbivoEHxlJjQWsnMTbz34XmJi6AGy+4QOWCN8HPYLWp4AWMjghOHNg1DTg0LUYavgRsb9ZjpOP+rRV12HIZ9qtd7MNA1Hiu7mpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQnmE0MYzyprnHsNdCIPDideFxJT64FWxrekr3tqxf4=;
 b=pILIcb9ZKOzLsSc1V/5PupXFPCV1YvWqRH0WSgpna/Ay6YnwP5F1tEqfYLYk+rvy6JSPljKH1YMQrukVZT5D4G4CIE+faFYKeKyuDhS7ja1tIc8b2ftm+Tku0wSoAseNnhRA7325f3ahsCc2qnv3UlDOiu8AQB2/qlsR0kihaWI=
Received: from CH2PR17CA0017.namprd17.prod.outlook.com (2603:10b6:610:53::27)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Thu, 12 Oct
 2023 18:49:41 +0000
Received: from DS3PEPF000099E2.namprd04.prod.outlook.com
 (2603:10b6:610:53:cafe::73) by CH2PR17CA0017.outlook.office365.com
 (2603:10b6:610:53::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.30 via Frontend
 Transport; Thu, 12 Oct 2023 18:49:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099E2.mail.protection.outlook.com (10.167.17.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Thu, 12 Oct 2023 18:49:40 +0000
Received: from hamza-pc.localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 12 Oct
 2023 13:49:39 -0500
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/edid: add 8 bpc quirk to the BenQ GW2765
Date: Thu, 12 Oct 2023 14:49:27 -0400
Message-ID: <20231012184927.133137-1-hamza.mahfooz@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E2:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: 37f7bb4c-ce6f-4834-1b4b-08dbcb53fe1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2HCZLPg++K7Xfm1gfhkoesnDYHpeyC0CcPSIxPcmb9L8QBMd/mzwpPL3D7QdIMkgp0YsNOMngJGWFim1tCrbfVHNsfcwKwcPTFl7KCpHiv2nYftumFA4Vv24IgnTncaeYw1+R4rnvm7w/jOxfDUDPzHbSdoJgl+m2xzgDIEVO9qhAPxL0JxDBLhAuOxv15o1mKImyooZTiaMrLeD5zJuL5cGhHPP2g3VnEIvESkr+V6otRM9N87vyjlKvJ/cBrW7/xuH6gzbYRvw8a6AuuF1UgbFwQgBsJJUr+ACX4tmETx3iP7TiBGoJqxMPwJGGX3bH4fi9hoi4IH8GApqjEbGO8AamquV/mzPcpXf+sBm/Q63UODlqD0oXbd7LsOB3k80qCnu9Dy2Kep02or4r/QI7hhDSjYEoiJlAygSORxD4t9yKRbyuZ8B8izkGJaVVImoU8O2OvqsIfNQxv2QUIt7Hqve0cEoTHXYj4E4qiVgs+luVZ8GUxAyvbyaO3V3WtSJarliohcKR1i4NHOZ9Gdt3+mCl1VuzXR8IwUmlAz/kRvqSe/s6leB0wE2RnoYjk9/eQ6cJPLbh1BsjdaWmbGy1OOK8vqB1fkWOT1tbYu4HTofXBBOwG5CBVj8BabnPxq3B8h9pLx7fqAj5/f0QwTQmcFnq0FgFh0K6pbJfhmNkOi4042ryROJ1jmV7AYhT+oXg4wxQ/Wd3GPiy8pyFNJcbRYSGv/sdOzCz8ldMUZ8S2wjmRosWkBwYhd1BQsk0zfjDj7tFolOWfDEmm9zoKYn1EgSiY1zXp/5/RMaAP7T8Lo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(82310400011)(64100799003)(451199024)(186009)(1800799009)(36840700001)(40470700004)(46966006)(40460700003)(1076003)(478600001)(6666004)(8936002)(336012)(44832011)(426003)(83380400001)(4744005)(47076005)(2906002)(6916009)(2616005)(70206006)(54906003)(5660300002)(70586007)(4326008)(316002)(8676002)(41300700001)(26005)(356005)(81166007)(16526019)(36860700001)(82740400003)(40480700001)(86362001)(36756003)(966005)(36900700001)(16060500005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 18:49:40.8229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37f7bb4c-ce6f-4834-1b4b-08dbcb53fe1e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099E2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
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
Cc: Maxime Ripard <mripard@kernel.org>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Hamza Mahfooz <hamza.mahfooz@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BenQ GW2765 reports that it supports higher (> 8) bpc modes, but
when trying to set them we end up with a black screen. So, limit it to 8
bpc modes.

Cc: stable@vger.kernel.org # 6.5+
Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2610
Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
---
 drivers/gpu/drm/drm_edid.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0454da505687..bca2af4fe1fc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -123,6 +123,9 @@ static const struct edid_quirk {
 	/* AEO model 0 reports 8 bpc, but is a 6 bpc panel */
 	EDID_QUIRK('A', 'E', 'O', 0, EDID_QUIRK_FORCE_6BPC),
 
+	/* BenQ GW2765 */
+	EDID_QUIRK('B', 'N', 'Q', 0x78d6, EDID_QUIRK_FORCE_8BPC),
+
 	/* BOE model on HP Pavilion 15-n233sl reports 8 bpc, but is a 6 bpc panel */
 	EDID_QUIRK('B', 'O', 'E', 0x78b, EDID_QUIRK_FORCE_6BPC),
 
-- 
2.42.0

