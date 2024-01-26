Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4583E1FA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:55:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6611510FD79;
	Fri, 26 Jan 2024 18:55:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7E10FD5E;
 Fri, 26 Jan 2024 18:55:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DgplbPlIm16PD8ZS4xjLqmRKZxNbMhSloSvcSzQaSQg5kDb3si302fiW+kDcNxcqhFm96Qq8Npiy5yyAYyFeElZEYqpSjcaibmmN8R3fS1a+RhFxWlN3JXGOqwsTSeZI3W67qRLUf7GImIVJq4pu3yQdZLvQqSk047cqTZDb+vu6jlL//pJ7T2XZyc6J+tvVNpbPDRb+HfmDPpWnzvTA4ZQvyOkh1/ucMEsm/FSucrO3Ohe+Ps1u00uB5vETYB12x/9iCSgBKELDC8HUvYiTgUD7DG/8pSpu2pTJkxnet564uhlCJ9aeQvcF4/FuEM04zlFLhIZjUqKJpS2kyyjPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WhH1A1dmil5mLytT+IWXLtNxq6KaDNim7SXPzmG4ou4=;
 b=Uj6SynM/5w7aQjAdtOvGJqWWb/nUiPeIZ29EneiYYcsi56Q+MGdp+/PSbuLvbskPKNM4dGs8rhDvUVA7JejK5+lrsnAseSV/pWZyK4EjhDD4E6tc+RHg+I891ex4Awm+ou7a5oC7fBuQ6dENQeHjGg/IQ6VZqdYNfwQic8Ozybk8Eaj4A78hccIk92r5o2Ajfgt/dSUWSoMX5LjA7hJSi6sdhn/UPZF2LhKX//FIaUTwuTPXwx4efyAlz7n5INND2ZU5ErGHZQ7JmR+7LrSSc2BAYbjwiHy9NXB+41DjADon08fjzK5Gjo4VNect8ECRt3Pz7ATix0nKsiSaVYnQjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhH1A1dmil5mLytT+IWXLtNxq6KaDNim7SXPzmG4ou4=;
 b=0zOymJ07BIf72EnHwNCJCgXbmD7VLQ4Q7mu5IcTNrrrPxkzKRh9Xc28CMAEzoZZBn5RAcp8Fq1DKJMH5h6hIVtHyk0OZ8z/HcS02JSDqAJEzbxxxkStijPiYlgrco+mUqoqhqAztpfOiRz9A4LJLz+CNy6e8S/LwFLj4Zi6R5ys=
Received: from BN9PR03CA0580.namprd03.prod.outlook.com (2603:10b6:408:10d::15)
 by PH7PR12MB7354.namprd12.prod.outlook.com (2603:10b6:510:20d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 18:55:11 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::6b) by BN9PR03CA0580.outlook.office365.com
 (2603:10b6:408:10d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27 via Frontend
 Transport; Fri, 26 Jan 2024 18:55:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 18:55:11 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 12:55:09 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/2] Fetch EDID from ACPI _DDC method if available
Date: Fri, 26 Jan 2024 12:46:37 -0600
Message-ID: <20240126184639.8187-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH7PR12MB7354:EE_
X-MS-Office365-Filtering-Correlation-Id: fe13484d-0315-40c5-5910-08dc1ea052d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hiwSv/cTDabmYdwOEdR5+SNNHVnJn3VaFqy+eXDI9EFgSBDZCX2iyUqBi9x2hKemoFeCzxS+XHfpJWrPAD9tF/uAbJBBpRDBWodJDpM0ujvSAhpzyUdtDHSUcgiDJ1hovYN1TxzpLU+N7X24VSHBreMxd4IMIdhrHw/PbZ5+4cSIeBiesW4Kr3jn4M1zSo0BNfunasUEx6dDs4lo3AdELXQqCq+lXPqgFuJTMQx0J5hpnX9wnJx2bYJZRaP/yEXdOHOVkj4HeadhwZC9xxgeaGdckQGKnyv5tZhfUP25YVG7wMBPQEA8w27tmFM0nBR0W4Pu5ypgfn5uzbgu26mDg3JuQW1IP7G87eNLYomcontG1r5zimeAa0Yo2DvFPttjkCF2H7yjw5EfzSMKY61JjL7p59F5RUcj3AwKdmXsvkmsHBPbts9AmKrD2P4MKrjdt7S6zhL7YxyxP3TPJ8j5MnHDEqLKrPRf2W1F2ehpcfE2DAIKthKdxpHB+4qlrvP7oR5sch26X0QM2WXUnkNOEnGXBnjDcLqO3sQnmx6wZxZ7HC/mgWxODhMDsKFz1jbxrPyb85b/txOfkfggwwEMPOTdd+i81QtzI++jJEZroQN2OWDfmP/YQLJRFcirnZ92xW2aiLFeYCc7YVId32zQ45XMTIGUGa/MYTZh83QX1i32kQIph7Xsq1JjchfjXYgvq7as+d6WCnA7Ns1ScwZeFDdkKcdaIMVuVsUdSUJ3+874Zy6KDTomEL6n9acHrPL6mw/bxY784mnMOwF0s7HjeQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(376002)(136003)(396003)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(46966006)(40470700004)(36840700001)(41300700001)(83380400001)(36860700001)(8676002)(1076003)(336012)(26005)(426003)(16526019)(2616005)(82740400003)(81166007)(356005)(4744005)(5660300002)(4326008)(8936002)(47076005)(44832011)(316002)(2906002)(110136005)(7696005)(54906003)(478600001)(6666004)(70586007)(70206006)(36756003)(86362001)(40460700003)(40480700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 18:55:11.2900 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe13484d-0315-40c5-5910-08dc1ea052d7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7354
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some laptops ship an EDID in the BIOS encoded in the _DDC method that
differs than the EDID directly on the laptop panel for $REASONS.

This is the EDID that is used by the AMD Windows driver, and so sometimes
different results are found in different operating systems.

This series changes it so that when an eDP panel is found the BIOS
is checked first for an EDID and that used as a preference if found.

Mario Limonciello (2):
  ACPI: video: Handle fetching EDID that is longer than 256 bytes
  drm/amd: Fetch the EDID from _DDC if available for eDP

 drivers/acpi/acpi_video.c                     | 23 +++++++++-----
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      | 30 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  5 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  7 +++--
 6 files changed, 65 insertions(+), 10 deletions(-)

-- 
2.34.1

