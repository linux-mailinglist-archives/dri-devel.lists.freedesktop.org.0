Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FF265C97B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jan 2023 23:20:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54F110E4E7;
	Tue,  3 Jan 2023 22:20:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2088.outbound.protection.outlook.com [40.107.212.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3462E10E4E8;
 Tue,  3 Jan 2023 22:19:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TdbWmP7eNHZh206JCK5pX556rzW62g610JKSTWshi+LuTSsFkOHgy5BbiEflYhjgTeaCxEN2SkGMkwsHi2uoLPPGpUyiE9R5lrxxjD57nhCMPxP7scBFU6BnTwaacNTjt7Htr9VKmMbrD9C8d2rSjNy1Py9700RIrav8IsnoYoTJgcDwTR33O5vNitJccz/Zil1XKx2usnu+fRLQ6A3S77WPgwOEmJiWOXWyy1B3EiChf6XeH8QEff5xPh5FDiatWFF4thIBw08U6Xv8p6W0n7SZ/0mpaBEhpvDdWC6nxhqZIRtmELwOwK/cJ/2eSC5NB/DT9QcNHJjHRGunfTQ2sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mOjAalb+TvZZkuEzWbDBYYoPsw1Oye/rfZgv+ScvIuU=;
 b=RFCeki5iHYoGZ7UAQSmmJiEDHyDgWzvViaCWoTKhEk7ofOm46eC6XIB0JLwmrwkwQwO14BzpR/HIEPrNKa1KcIlkY2VZVLhyGxyZr5t/stcRB5et0XHN8DAjEixmmKJabwaohCY2P8A0skZlP+HN/vhxhf1Y33qMzqd/iQ3bGC1valllIucmKMQ3vpmkc567jzvqIr0+cd46z7AH3yLv4hi9Eo2h9QG3ILjKSX0/VkzN9r1KCOBhuH/TIaXxsj+qZbBPYEZtSXBw06vYm76PpdGA2hGVRmE5r4qpv78RGopPNfWQeGAvxWdJXjbAE233z5ofyps2hyEA9s4XOm5Siw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mOjAalb+TvZZkuEzWbDBYYoPsw1Oye/rfZgv+ScvIuU=;
 b=IG5RIOwvL/eClZ6Y42ztc+bfm1VZtWyy/msZA7+g7LkbZmGEiOioxjFRwhNNyyPyh7icw4PTf/ZZtXpYDmY0Tm61bTV3xVbqdzRVnXvEjMFVHVfaNU9EOsfLCCZ2zOdMadqblr++mTc6jSRWptUPCm4kH1J1PmNl8Dm6lMhlFM8=
Received: from DS7PR03CA0140.namprd03.prod.outlook.com (2603:10b6:5:3b4::25)
 by MW4PR12MB6973.namprd12.prod.outlook.com (2603:10b6:303:20a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:19:54 +0000
Received: from DS1PEPF0000E655.namprd02.prod.outlook.com
 (2603:10b6:5:3b4:cafe::2f) by DS7PR03CA0140.outlook.office365.com
 (2603:10b6:5:3b4::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.19 via Frontend
 Transport; Tue, 3 Jan 2023 22:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E655.mail.protection.outlook.com (10.167.18.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 22:19:53 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 16:19:51 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 21/27] drm/amd: Avoid BUG() for case of SRIOV missing IP
 version
Date: Tue, 3 Jan 2023 16:18:40 -0600
Message-ID: <20230103221852.22813-22-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230103221852.22813-1-mario.limonciello@amd.com>
References: <20230103221852.22813-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E655:EE_|MW4PR12MB6973:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c65857d-4aa5-4916-4bb8-08daedd8a3a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OsZEAW0fkfDbbP/XQ04r90EwrVIi7lvHUj+kdgcJse6VdXiwhEhcwQPEqF2BN6fm/4bVhKuFdsortHh4Glj+waZj7OTRnmxRSafo0PheOz9/gIV+8mw+rUFVa51prPXk/FhHTQgvlz1rb7rF6WP0i8ZHNgYsPzdeslYNi97f8Qx+YMQ6UMRVmyVFOZpA7t5ItLee/jPYd1OkL4pD33om6Nu8ynePSf2RJIzpzZy6xnBWlOGvU5c4ciQaz1dTTd6xGL4YlMPsh5HFBs5g7BHHYG+n2DyWHonUgELhqTaS6rhzKj4u28/MJCoE1+RLgNbZm+oPpqlZAOTVB2IFPtf6HIbYfZgJMweoQIcAOimxgYbTC4fiJ+J1jNnjNFdbwq+r73i0k2R54QxYSjnIPF4ryXxOeFFxiW3gwTZg9/4blnciKJTLTdby9yyyUXUD+ibhks3yheW8dqXfDUSAQtp1m0jW9tNh4Tzixxfve1Lw/o1lrIm+xZbtR+KmMx9rZzlExRL1LAzYGe1UJPjFg5aeOyOXYfwH6BU+akN6Kqkx99h7yirgvvjFAyQ84Zwrs+FQrvL6mw/vRKb9VTunRtIKei64RiAOpvCa4mnBJnfkrV3OTIxLG6BB+MmBAIPr2VbYOPPdusdtTEXqNTuJvsB49RafdgO+zw4xurHo/ZGqS/DfBifVTH+1Dld9SOUX/3NVJPdZry0UILDDy/XTn1u8Ukq8kT5PSds/WGt6q4DK1FBSkoaUB5lV6zbbbFYwnVGe/vabnXgN7GSpsi3sLvF4bQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(376002)(346002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(8936002)(41300700001)(8676002)(4326008)(5660300002)(70586007)(54906003)(110136005)(2906002)(316002)(70206006)(7696005)(26005)(186003)(478600001)(16526019)(6666004)(44832011)(40480700001)(86362001)(1076003)(36860700001)(2616005)(83380400001)(47076005)(426003)(336012)(82740400003)(81166007)(36756003)(356005)(4744005)(40460700003)(82310400005)(22166009)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:19:53.9646 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c65857d-4aa5-4916-4bb8-08daedd8a3a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E655.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6973
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lazar Lijo <Lijo.Lazar@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Carlos Soriano Sanchez <csoriano@redhat.com>,
 christian.koenig@amd.com, Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No need to crash the kernel.  AMDGPU will now fail to probe.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
index ac4d675abcb5..d51fe3431e2b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
@@ -380,7 +380,7 @@ static int psp_init_sriov_microcode(struct psp_context *psp)
 		adev->virt.autoload_ucode_id = AMDGPU_UCODE_ID_CP_MES1_DATA;
 		break;
 	default:
-		BUG();
+		ret = -EINVAL;
 		break;
 	}
 	return ret;
-- 
2.34.1

