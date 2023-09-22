Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B17AB836
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D10F310E6D4;
	Fri, 22 Sep 2023 17:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8D1810E6CC;
 Fri, 22 Sep 2023 17:51:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fBgNQgcMLJC3s5Iuwv6Qa2TVTZCnLko/hcBQ/jciVMm2D850wU9OYKmHNEBC7aefFNr1/F//nWaW+A6C+hf/j8u9AaFEeDKn3VixBljEvnA+vXMXdWDdj5P9eQtjUoLhlzZ4XKnfFG+3rN61X2wYoAJGUgOBZSg1N0DCZyT20R1XGUiTeQlnQW6k4GTwpzP/5CpHn0Vi98brInYuGrA1VUM4mY4uYZrlMBrpcQHh4H4aF8RVkfQiGMnjasSVSSCIJmhacq1gSE1BWCdaBjV+FlUNcuOKJCfa9bPiPoUel8I6u3fG8zZpmGWcA/0b4BTqXL4LcuK4eaTExpova1Et6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tEHtiywUMFKmVDL5iBP/VYpcJkCDV/3GfneI/Ttnm/E=;
 b=d9GCLfHmJNwcQ6pC8mFrtq8xKvtJh3oOOmFkiIVugsAYsao1J2S7/xPTdtEFPam27uYpAKkr8E4z7wBLr7lVBwlkGjjiZACigm7s6AOwc0IVAfmDwS/UxeJR2Y+ygKbPNddH3zz9y9JzFPlYD/zQMApAtLFaU0lQtfy+mGvhOKXOAX28/VuIyM4y00qqKexSRsa+FUVrXYZH04n1A6peSa07jlTrrAgVwLPqZsXoNjoesvAMyytFJyBJ5wBCOaUDeoyBG5YtMbHol4DtbrqIT9joTCftoNiznIjGfmL+7WBhpkcr0EwZ2fBASITECfWTj/cR6C1DbBbS12GSYUrizQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tEHtiywUMFKmVDL5iBP/VYpcJkCDV/3GfneI/Ttnm/E=;
 b=2NlkC6w+wpkmhU1Ks8JHbLHaxVOh5hdC3nl9fxnvr6mwIEhpO27Sf/A0NTi/10SQcnkWBLgnlKRu721dXjuiAkgVNois8DvyuMJE7nlzUPbdanpzoE0CvHoT2Nxsusuh96DadZ23FETcTfOcz9xdwP9aThLvClhr2ICSJU22+VI=
Received: from MN2PR11CA0001.namprd11.prod.outlook.com (2603:10b6:208:23b::6)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 17:51:44 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::a1) by MN2PR11CA0001.outlook.office365.com
 (2603:10b6:208:23b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.34 via Frontend
 Transport; Fri, 22 Sep 2023 17:51:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:51:43 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:51:39 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 00/15] Introduce PMF Smart PC Solution Builder Feature
Date: Fri, 22 Sep 2023 23:20:41 +0530
Message-ID: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: d95d5345-00aa-415b-df30-08dbbb94956c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJk0n8fCOjKNFNDXOKi9xeRz3auKJTNv5tpDqvUD7Mc+RDEh+fUc8FOeyt860OXXrU2Veo3T88YvzF447/XN2zVHeXecNqswKxzg4eWKErDgvOMNnZ84yGbyn9BCYAcI/Izk4fftLhqN0mqvo/ouK4o7Gxb2hNh0/wkUeE47DT5lnYOebOOyey7gkE++HMk4V2OXRZEzKk3tW6nSAKpjceSBOQs/SFoXN6wbmG/P5ChN4rjarKW1ZbMNPw1soLC24xN0z8ZqsXppAdHxgvW1rJLNx47dOWBbchOk1n6XsltSVOJ8W/ZDEilhRngwgAO9G86iux0olgXCit5y1tE3ej3jsnZxpr7QMm3qq9/b4L3m/o+ShaBWbr3qA1QJgCAD6LkNbqdHVHl4jsmLxKDu0R9bUoPrcyyxONI7YH48y5kM2CYV0d9yO7EunBXSfetBQxjLAK+1BErjmnAryFVyaG8GU9TmLR515hPrW4mIYgHTbfL5kmg1+AJe9QGJ5mXEk8oV1PJ3jm+NKiSwPStrqVH9yoGv3Ty28skeTmg2+FwUuFrRMX3hJapBErKBmO6RdETdfvKGDOGBwZq9a50+DPKkCcF7j2ZKp77IxCz8GX7n2ded2sAusk3FQpYrOjhi0U0KD80HqpWxuDCvMWLHf9t1SLbgGn1ezvvlYTCZGlCat8cRWzDs0glk1nxTTbOCTLV+mndI+0p7hUIglsLizO01JxhoKJD/GTD7PQjFNBsYvDxJr16JiXt3Rt6yPn9xv63dpPaB8vr8ESNoEeJJYOv1n+Izupx3z9/26xRPGiUr5V9S/6gcv+7gobAvMEHeUMnA/Vgvo8i/RsqbAWxzjg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(136003)(396003)(39860400002)(451199024)(1800799009)(186009)(230921699003)(82310400011)(40470700004)(46966006)(36840700001)(83380400001)(7696005)(356005)(82740400003)(40480700001)(5660300002)(4326008)(7416002)(316002)(2906002)(336012)(36756003)(54906003)(8676002)(41300700001)(16526019)(6666004)(478600001)(921005)(426003)(47076005)(110136005)(2616005)(81166007)(70206006)(86362001)(70586007)(40460700003)(8936002)(26005)(1076003)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:51:43.9082 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d95d5345-00aa-415b-df30-08dbbb94956c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Smart PC Solutions Builder allows for OEM to define a large number of
custom system states to dynamically switch to. The system states are
referred to as policies, and multiple policies can be loaded onto the
system at any given time, however only one policy can be active at a
given time.

Policy is a combination of PMF input and output capabilities. The inputs
are the incoming information from the other kernel subsystems like LID
state, Sensor info, GPU info etc and the actions are the updating the 
power limits of SMU etc.

The policy binary is signed and encrypted by a special key from AMD. This
policy binary shall have the inputs and outputs which the OEMs can build
for the platform customization that can enhance the user experience and
system behavior.

This series adds the initial support for Smart PC solution to PMF driver.

Note that, on platforms where CnQF and Smart PC is advertised, Smart PC
shall have higher precedence and same applies for Auto Mode.

Basavaraj Natikar (2):
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for HPD
  platform/x86/amd/pmf: Add PMF-AMDSFH interface for ALS

Shyam Sundar S K (13):
  platform/x86/amd/pmf: Add PMF TEE interface
  platform/x86/amd/pmf: Add support PMF-TA interaction
  platform/x86/amd/pmf: Change signature of amd_pmf_set_dram_addr
  platform/x86/amd/pmf: Add support for PMF Policy Binary
  platform/x86/amd/pmf: change debugfs init sequence
  platform/x86/amd/pmf: Add support to get inputs from other subsystems
  platform/x86/amd/pmf: Add support update p3t limit
  platform/x86/amd/pmf: Add support to update system state
  platform/x86/amd/pmf: Add facility to dump TA inputs
  platform/x86/amd/pmf: Add capability to sideload of policy binary
  platform/x86/amd/pmf: dump policy binary data
  platform/x86/amd/pmf: Add PMF-AMDGPU get interface
  platform/x86/amd/pmf: Add PMF-AMDGPU set interface

 Documentation/admin-guide/pmf.rst             |  24 +
 drivers/gpu/drm/amd/amdgpu/Makefile           |   2 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c       |  91 ++++
 drivers/hid/amd-sfh-hid/amd_sfh_common.h      |   6 +
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_desc.c |   2 +-
 drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c |  17 +
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    |  48 ++
 .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |   1 +
 drivers/platform/x86/amd/pmf/Kconfig          |   2 +
 drivers/platform/x86/amd/pmf/Makefile         |   3 +-
 drivers/platform/x86/amd/pmf/acpi.c           |  37 ++
 drivers/platform/x86/amd/pmf/core.c           |  40 +-
 drivers/platform/x86/amd/pmf/pmf.h            | 199 +++++++
 drivers/platform/x86/amd/pmf/spc.c            | 194 +++++++
 drivers/platform/x86/amd/pmf/sps.c            |   2 +-
 drivers/platform/x86/amd/pmf/tee-if.c         | 492 ++++++++++++++++++
 include/linux/amd-pmf-io.h                    |  51 ++
 18 files changed, 1199 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/admin-guide/pmf.rst
 create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
 create mode 100644 drivers/platform/x86/amd/pmf/spc.c
 create mode 100644 drivers/platform/x86/amd/pmf/tee-if.c
 create mode 100644 include/linux/amd-pmf-io.h

-- 
2.25.1

