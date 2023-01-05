Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE06C65E410
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 04:45:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A9C10E690;
	Thu,  5 Jan 2023 03:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2045.outbound.protection.outlook.com [40.107.93.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781D310E67E;
 Thu,  5 Jan 2023 03:45:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JltaWtYlnw/Sw52vK+F2uAt0erk/zZY/qJLnXu4QzNM6vz6lDzxCwZiTLZvhSaCuGFXHchOvTGPl+iMwkqkWzCjtWhqpRONL2N890HfugolYDNNf94a2zQitmKdmEdZXZtpplifVyWm3FFKu+JDrrU2D65JXjWVi9y3V09JLieKTbnDlVTUwPEeCci3PAIJJrUQuTqO8upZzqMYjqjX3E5v/CAweURvQqR9EcvFMjiwNg+jyysfbEj9Z6/RxWblLwbdHAoZvRDFApO27EDWqgPK3mfwGK160k6JzTnFPT1ir2mWoSsTuqLf3YhzAfopmJcZGSQQCEvQnRnwnJEu5MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7JspKy8CCcybNbCF7yrN60DkQ+JjAkYIE2SurG52LM=;
 b=HWTDOJvocGQtiMQ6zEFyQU+Bejl8riGxsAQ8Ufpf3V8P4r9PEMGOu5PzJ/ZXo0/eB5K7VN+mL4TPUJnKjTd8jA22xRMb45wj+B/L90GppbY2WA/NXfdcy6ugOrFoXqDkjihlh4jTUh8+K0q6ASstAiGrkA3HaW1HjMsam1t3D01+W0bjYQguRvrwz/lxHM4VOubFmicNtz3mJ6jM/fsa/sMtjigICCn0Anz2NV65fgf8efzl4jRU8t665+N14C23oAlAhiJHfg/J96mPXAnXYRsCQOIh01aqr2hs3b3RRQkfuH/OzAuBOkSk9313UTGXoJhM+vhz3v03hMHAyZcvBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z7JspKy8CCcybNbCF7yrN60DkQ+JjAkYIE2SurG52LM=;
 b=4wuEUubSxG/oj/h4/EFA6DqxnYPu67J1AHPGh/Wy3OC/7dcgpGSQOmXeenfFOqRbONMFo1uNVMp0+BHvQ7+IxwxpA1/8tPf+SohO6ESDSZaR5WtahPdizPCUMADUILAmqca6IaJ9UPLwWuBQ1isL34hnDlUVT/3zzqeu2xkQgSc=
Received: from BN7PR02CA0035.namprd02.prod.outlook.com (2603:10b6:408:20::48)
 by DM4PR12MB5294.namprd12.prod.outlook.com (2603:10b6:5:39e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Thu, 5 Jan
 2023 03:45:13 +0000
Received: from BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::1b) by BN7PR02CA0035.outlook.office365.com
 (2603:10b6:408:20::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Thu, 5 Jan 2023 03:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT024.mail.protection.outlook.com (10.13.177.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.14 via Frontend Transport; Thu, 5 Jan 2023 03:45:13 +0000
Received: from AUS-LX-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 4 Jan
 2023 21:45:11 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Alex Deucher <alexander.deucher@amd.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v6 44/45] drm/amd: Use `amdgpu_ucode_release` helper for si
Date: Wed, 4 Jan 2023 21:43:18 -0600
Message-ID: <20230105034327.1439-45-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105034327.1439-1-mario.limonciello@amd.com>
References: <20230105034327.1439-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT024:EE_|DM4PR12MB5294:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd64e58-6517-47c3-3cb7-08daeecf4098
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3SzHiWBWcLwNda0WfxZcrWT5ZYYMWMq1o8+czXzHH8m2JW2giwabodly+aKS9SgDuR1FbyipQ2UhvpzUS+ZD7tTDlfs5yUj5q/+2Vnbxur1ZiOq3t09V2HwXwqvyiY+mc2+LMKpRg4gzgalVQRoGyhdEnEO3shxord5f4O9In/qrjYhya61MOTK4YdZdOb+oIzcmkLS0Srm5BX2asjv49e3i0B6Vu0lXFJGOLVFe1wZXtupXbueHK9AjEkTgWrKuydWiPvhhyIooOM+1teRG9E4tAwcN5gNGJRfEFNHpFOJeJvkfQaL32EJ7Ta6lbAzuM+S2ECEYunIIPUUpDY4E+Lp7yc/xXb4hjaQRhIveyrIZWJ9srxVyC7eHJ6cTt0b53pdHjOllR6Qt1jbsa7qcaifJQ/OfDPInQWJUgCEYy2zPljX0CV622xt4WB2j4qBY5AVWD9nZ7ov42pT6RHhgvMMhvovacHgtWeLaKfLS/P8jj2nDrlyYmQbksGsP8KhipZH7vPN57TWuKg41j8N5mhjMGkgTQG6Op2hR+RheznziBM3ED98ywdWqS6dDf1j+lOWhDvxmuT7BAJCs8Bauf1ezgDZ2pTE2M9KWfZhtCPpI6KnAJEYgPAIzTKFd9YR/gUTvcMBUqxyte1zeyKFoi3088nYzdIyYTQxU6jefSr3jssYFd5uPFF0qNVIxw/2eq5Aie6P8qAdS1iC1zkbXQKZdX8IppqqcQaBiKNn1eR6+1HcsBEo/M8ymdQI5HiPnhXthqrEJ85UESKbJo7QeaQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(5660300002)(2906002)(44832011)(8936002)(41300700001)(4326008)(8676002)(316002)(70206006)(70586007)(54906003)(110136005)(478600001)(7696005)(2616005)(1076003)(40480700001)(26005)(16526019)(186003)(336012)(82310400005)(426003)(83380400001)(47076005)(82740400003)(81166007)(356005)(40460700003)(36860700001)(86362001)(36756003)(81973001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2023 03:45:13.5237 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd64e58-6517-47c3-3cb7-08daeecf4098
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT024.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5294
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
 Evan Quan <evan.quan@amd.com>, christian.koenig@amd.com,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `amdgpu_ucode_release` helper is replacing all calls
to release_firmware.

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5->v6:
 * Adjust for amdgpu_ucode_release argument change
---
 drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
index 49c398ec0aaf..d6d9e3b1b2c0 100644
--- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
+++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
@@ -7714,20 +7714,13 @@ static int si_dpm_init_microcode(struct amdgpu_device *adev)
 	}
 
 	snprintf(fw_name, sizeof(fw_name), "amdgpu/%s_smc.bin", chip_name);
-	err = request_firmware(&adev->pm.fw, fw_name, adev->dev);
-	if (err)
-		goto out;
-	err = amdgpu_ucode_validate(adev->pm.fw);
-
-out:
+	err = amdgpu_ucode_request(adev, &adev->pm.fw, fw_name);
 	if (err) {
 		DRM_ERROR("si_smc: Failed to load firmware. err = %d\"%s\"\n",
 			  err, fw_name);
-		release_firmware(adev->pm.fw);
-		adev->pm.fw = NULL;
+		amdgpu_ucode_release(&adev->pm.fw);
 	}
 	return err;
-
 }
 
 static int si_dpm_sw_init(void *handle)
-- 
2.34.1

