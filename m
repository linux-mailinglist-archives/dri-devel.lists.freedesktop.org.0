Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0617823F8
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B71110E1F2;
	Mon, 21 Aug 2023 06:49:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2059.outbound.protection.outlook.com [40.107.101.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55C4510E1F1;
 Mon, 21 Aug 2023 06:49:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJjB9H0hqsknMUVtvSU1z/dMVrQnaD5vtQ+CtmXRgJaUxRmX1fSgOxiTnEGaX9Lf6e6Re4T8NDcrtQtfFhO7kxNkkDL0O/e7WdK7J+XyY5PhRDO+SGGWzkZb1tYYa3S9abQT2lL5/+8VRRofwdoJ6eLiEqQ6Puss6z93DruZTEf89MGP2KLQHKr9NDRRgC6AUMtRwJZrSKn5KRWYMkrPi2iu9qfBIrEbw5EJhd0ayCZoZVxdlf6qTDqPcRVSHEhHj8JYQCAUraqyn9oCh2UXdKvT+s6cF5GzImqObqwOCL9WnR/nhnYbwRfjNdcJD/DG6GBR0gVWRl9RN50PEBAPNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjSzWvS1+SgzmofgWPLIdn37wPoWyn5gwkptwZiB6TM=;
 b=YKM3ESZa/UBKxTaIGq4qgee075PytNZ6vKjlOY7M56hS3ZKIXAX/4Ssw570u/y4NRuxrDhGBJXktq+H7/NrE/tKMQblDb1UN0QM0QKjSGqLI5pBZ/FWhAJemi6ty2XDtuN82zpel+VrIsCKHuFZlzVOKVajs9IQf+gEnu8fBgGFunG2Wir4A7FOy2gJFpVTOQzHh1DITusHGrstX2/O0ynYjFa/0Ml6tsA8EZJhhcA0n6GiTHNZxe1lBjUrJbsr29iTgFcLJ9aI1jnkuXtJ/rCsavD5SawmVYGLZh6fDc41MJ3Hcohret1WrFu88XdazBPyUrSSNgIsxa70J4dQwsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjSzWvS1+SgzmofgWPLIdn37wPoWyn5gwkptwZiB6TM=;
 b=lZpphw5+q4zYBYbG1VSf5eRZoqLv6FnzvefvCgweTpeByg/N/on3+mfReFKSGec0ACE94D2u5ZW05XcURt3cxzc8OK86dTP2u9DzJy5AZILN/T49ikP2vHsQDf/b21omq+VAn2jyB8TM+JZy9oMJ2kvcv/U36mCbxB3oLH5/8rQ=
Received: from SN7PR18CA0028.namprd18.prod.outlook.com (2603:10b6:806:f3::11)
 by SN7PR12MB6789.namprd12.prod.outlook.com (2603:10b6:806:26b::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20; Mon, 21 Aug
 2023 06:49:18 +0000
Received: from SA2PEPF00001509.namprd04.prod.outlook.com
 (2603:10b6:806:f3:cafe::f1) by SN7PR18CA0028.outlook.office365.com
 (2603:10b6:806:f3::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Mon, 21 Aug 2023 06:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF00001509.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Mon, 21 Aug 2023 06:49:18 +0000
Received: from rtg-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 21 Aug 2023 01:49:15 -0500
From: Arvind Yadav <Arvind.Yadav@amd.com>
To: <Christian.Koenig@amd.com>, <alexander.deucher@amd.com>,
 <shashank.sharma@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <Felix.Kuehling@amd.com>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH v2 6/7] drm/amdgpu: switch workload context to/from compute
Date: Mon, 21 Aug 2023 12:17:58 +0530
Message-ID: <20230821064759.94223-7-Arvind.Yadav@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230821064759.94223-1-Arvind.Yadav@amd.com>
References: <20230821064759.94223-1-Arvind.Yadav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001509:EE_|SN7PR12MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: de7f3297-5421-4fa7-28a2-08dba212be4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qpOj2Rrm0MCNYEybbt9e0AtQj5UAseV9zNxntBlXtoXBhqJKYu3lr8WrrGlmdmojl5SLUeZPvPofgvGe3ZwO+tNSszc7jJQksTfLaHN5C/SlQW/i7nG2oAiHmvyghBCDBw3F7SCNwv7kXCMoYhWbqtpUmobEv3Lu+q5mBIATqP5lkW110cMZ7JOv+ay4lagjws56aM7NczsfdTM7pbdphjBvR9b5cJ+14TMH2C5lowm70P/61IQpJ4JDEMuC0iatUKrnCy68a4iPTJWd66AeVVye0DrVYaurk9moflxQ4kNfNhh9Ai23QbdjFWsEK7Tvx5DPbAvuU6/JJRNIDH/OUjd+L5UAx63jEqhYLlZ95n1dL5vZ2dtXfaCVM/ROpo+j8dXI8ClOsYOa4pA+C0bGCJKaoS0Gv157PnsKkH6e8wRL2fQC/iptMd13a3Oukykb7sP5XAjnp4ZmisFhdTWOLO30Bs8/V4uqVrCdfRNvkQwoj4cAzDA+3d+9CXk+XE6cnvVkpcxiJ60jZiYe17IolCiqTBTnLNGFxEwjOlr0th/E+1JvA/cuKEydR5aQic8FAWU+yXNN7qUqYm1zTNBdph3oFvuAh9v/zAfdnnuduNz+Oqybr49CD9KCIErNqYaRdSZr5FRWg5/Ui0yNoCwH75MvmIrRdfkROLwm0PNBC+ab61Pnd1qGczCOz+jWQpyx99fIK29czbxyTX4AORIIVYZCrAayP5+HWXNvmHG22I8cFXEFIIzftXnB/HvZ26JjmMSo/+igqv3+TyvTfqAw+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(2906002)(83380400001)(7696005)(40480700001)(5660300002)(336012)(426003)(26005)(16526019)(86362001)(47076005)(36860700001)(8676002)(2616005)(8936002)(4326008)(70206006)(316002)(54906003)(70586007)(110136005)(478600001)(82740400003)(356005)(81166007)(6666004)(36756003)(40460700003)(41300700001)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 06:49:18.8245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de7f3297-5421-4fa7-28a2-08dba212be4f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00001509.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6789
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
Cc: Arvind Yadav <Arvind.Yadav@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch switches the GPU workload mode to/from
compute mode, while submitting compute workload.

Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Shashank Sharma <shashank.sharma@amd.com>
Signed-off-by: Arvind Yadav <Arvind.Yadav@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 0385f7f69278..1d6a41f8d24e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -713,9 +713,11 @@ void amdgpu_amdkfd_set_compute_idle(struct amdgpu_device *adev, bool idle)
 		pr_debug("GFXOFF is %s\n", idle ? "enabled" : "disabled");
 		amdgpu_gfx_off_ctrl(adev, idle);
 	}
-	amdgpu_dpm_switch_power_profile(adev,
-					PP_SMC_POWER_PROFILE_COMPUTE,
-					!idle);
+
+	if (idle)
+		amdgpu_workload_profile_put(adev, AMDGPU_RING_TYPE_COMPUTE);
+	else
+		amdgpu_workload_profile_set(adev, AMDGPU_RING_TYPE_COMPUTE);
 }
 
 bool amdgpu_amdkfd_is_kfd_vmid(struct amdgpu_device *adev, u32 vmid)
-- 
2.34.1

