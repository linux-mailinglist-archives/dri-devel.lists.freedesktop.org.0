Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC252AF5DB0
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 17:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9DD10E322;
	Wed,  2 Jul 2025 15:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cSmmd2p1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2069.outbound.protection.outlook.com [40.107.212.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC8D10E322
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jul 2025 15:56:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uubx7y5NIHdtiBFG6fjmwUkapmbtLMwpbdFIWEF2F524BwYBdNZ3VFlcZmkpgH5jWiS6Nbn6dXdVn3SQcS0Xw+YCFiGI0N6wCOYLoxoly++5oIhcwGVbosOdUEHocInfmXGdCw5EXXr2CDXm2YLOU5Hi60mHijB3WCO7cVlgaPCPeKx7VzUoH6B2kt58yBIBJ7TjO9LSQRaQqEPB6Xz1fx7sIYFjbb5LPt5HV6jD8GdUUOzf0Ou9LnMHF++Z5PVpluikC8GIQyRsXoioLOaRaMvYANlLurLmW9OdIQwoRAmsUA1UjgAnVHW+TkSw97NKo2fykdf8J80O0dxnZNqjgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MVtvYgdxxcjOy2F/papKP5VNo1fMJ4W4+0ky1E6Gwa4=;
 b=PPsxBCGPn/Pa2s0o2i/MQ9aiphDfHcPHvoKnKmC0/Nupk3qU6scwrx29RO/Frlbm0Q/7TwhLdiU+X2CrJfMHRdnweLyXLwcf0++bn//boPk3K3HExjUsvZ2FUXk02O/qUH7r8txy8CjqiCszaf4DTCrSYOuOZHAV3D5qT88q6sCNcoPEF+9ICVYPm87yGo3PkKfSv3kCY6xnlLE+arzeODD3KbfDLkTuNfzLFKJrcZn00CvCV4A8Iu8QcM+XX7qAUBZZgFWwIL9x3CZd8Ir/nuWSNKxrrEaFENoNUF4+2p6iEchXGfKlx7EVmIr4gAAmnTR8ONl+QrBMuuzWIqfxGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MVtvYgdxxcjOy2F/papKP5VNo1fMJ4W4+0ky1E6Gwa4=;
 b=cSmmd2p1nVnEeTE/1e17wOkpwtEIvhboyVIUGfVXQMdzlATMCZwhwIkWs4vwEuYkWOiVOjju24z1aFDcio9Znrc7JGPFHK2KdThDjlz+CITchpG3sSXNt8X8lJpQlU2kOoSOWctt+uIdZ+/NtHTFOytRhY+Fys04CO6aCs4LmoQ=
Received: from CH0PR13CA0015.namprd13.prod.outlook.com (2603:10b6:610:b1::20)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Wed, 2 Jul
 2025 15:56:40 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:b1:cafe::98) by CH0PR13CA0015.outlook.office365.com
 (2603:10b6:610:b1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.11 via Frontend Transport; Wed,
 2 Jul 2025 15:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.1 via Frontend Transport; Wed, 2 Jul 2025 15:56:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 10:56:39 -0500
Received: from xsjgregoryw50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 2 Jul 2025 10:56:38 -0500
From: Gregory Williams <gregory.williams@amd.com>
To: <ogabbay@kernel.org>, <michal.simek@amd.com>, <robh@kernel.org>
CC: Gregory Williams <gregory.williams@amd.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH V1 0/9] AMD AI Engine device driver for Versal
Date: Wed, 2 Jul 2025 08:56:21 -0700
Message-ID: <20250702155630.1737227-1-gregory.williams@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: gregory.williams@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|MN2PR12MB4453:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d044d00-f183-4dfc-9b13-08ddb9810877
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dTI31itJMw/9f7TTq+3tay0FTBxYCiX+KW6LXPB8e+F+BgwnOYqbGnEswoO4?=
 =?us-ascii?Q?cAcgVpsQodfPa5Ql4HrZPMyGFyT5spdnQZi29WV95Hgd/MOAFhCPv72dDotU?=
 =?us-ascii?Q?EFlIqWKgZODJB/zTxl1KR1dVk0pSPd/QcBfalRobaABBZn8jaeDZ+eZaHEv6?=
 =?us-ascii?Q?ELqcvyvTdfGE/B/MEL37LJjfj7LBA1BiV2Colo0H7ObnrW62NFp7U8s262Lt?=
 =?us-ascii?Q?czbTpxZmF0QlFsTG6VxuQ9iM8HZ7lEH7u1VUvLjT1d8OQkCsuBpSUGWwxbP5?=
 =?us-ascii?Q?0TaUAbjgcxivXM90XNbSu5o4L/x8Gpg9sdMaIHVF7XmyglMcxPwhPdqKsIqF?=
 =?us-ascii?Q?c3TPckDvVjvffoNwsus5v53ni7z3tKnAOSsYnJMzXRUJeSIlC/2OjCOA45PU?=
 =?us-ascii?Q?d+wodbNs6yMMvTtKTb4ycoO29FPSVrF9fyaC7bdTIqvb7MxrugI/usuqIPzX?=
 =?us-ascii?Q?c2rpquQ3pmeuNiHiFedEXGXIk135bRWu5RVKJj4hCmyPK8xuDAHPw1isMspA?=
 =?us-ascii?Q?Wjy0m/ftmZwgEmK0jN1Z9qxiBEIzCY7c5JpZ0sRcb9hMRIVa3IbA3pR9pCFK?=
 =?us-ascii?Q?g5JJMN17Ki/sT1T4kngsaO98sDFgivhyQc8UQo5L5VirZpLuTMoRK3I9ZFIW?=
 =?us-ascii?Q?iBH38bLbLaMGX3JICvSjybG3O+Vq7/2kPt+/rgL4fLWJvJE64aVo7Va1Dl+w?=
 =?us-ascii?Q?WulQ+9+qv8Um7mKq1Nc3mW3wmRjY/3wTFxQ89ydyrx3oNCq/LGmAEgdLHZ/S?=
 =?us-ascii?Q?XAor3+jkIzq8V0wApRnLPNOyb9FUb+OhTboFdO+YSDyagnmsmbKl+uue8kjs?=
 =?us-ascii?Q?EQ5r/CNf01yLA0byeFNpjZ9UDEvX1wflU1Gurowwc5MnPfSs3jdqk235ypL/?=
 =?us-ascii?Q?36Pu5+d//HqgjH8HmUQ79F4PXwg104KrIH+V0P1jMdGtUU6kQbe9r7B8YyLW?=
 =?us-ascii?Q?fegSvgz1hMTGIb109oY29P/AGDlsPqvVba43oHxDdVEc5j4FwlR24CAnRcQ/?=
 =?us-ascii?Q?YE9moCiBmRl+WKyzn0I8FISuKLo/Nc3IN+QDvXbyuKZDoQIDsJZe1CVMNDuF?=
 =?us-ascii?Q?Y33jJUC77iljjfQQuPTLzn3hINz1/vPBEqPspBMyx/inKpSagCUhuOqGk2gP?=
 =?us-ascii?Q?zrxjEkyJU4RZVKSoGOV7j9gzdjPa6VCCqdgtXaMipYqCQ1ClmFjuum+p/AsC?=
 =?us-ascii?Q?PpFRhBKDWBJcnsuqcniTsf9HH33w5GjiA0k96vXvihDys3tTizWZDrij5FHC?=
 =?us-ascii?Q?7uPpYnKohkmm6iSfgkyA9jGxhPe432fCxGDTmmXIdg0L+9Nb15Oo7NsxJLAm?=
 =?us-ascii?Q?M/q2P0etNdZBdIHnEGUIdYc4j0Esik0TbCfXjbNyB7+lor7JLjgwTd2DE7aV?=
 =?us-ascii?Q?ocmv5T6XMgZJ/JXtx2tmeDVtoqUIrt8nv7qPQNEGKXE3NDnTn3Xjcp4DiIU3?=
 =?us-ascii?Q?URB5CGKsolKlG1xrztWC3oxUo3DRqRgapa6fiPF0NDFBRIMM0Lny4GOqV11X?=
 =?us-ascii?Q?+yZy2Mje4iYA0RYwR4ihjnS89uJZdNpzESgZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 15:56:39.9918 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d044d00-f183-4dfc-9b13-08ddb9810877
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4453
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

AI engine is a tile array based acceleration engine provided by AMD.
These engines provide high compute density for vector-based algorithms
and flexible custom compute and data movement. It has core tiles for
compute, memory tiles for local storage, and shim tiles to interface the
FPGA fabric and DDR. More details about the architecture can be found
here: https://www.amd.com/en/products/adaptive-socs-and-fpgas/technologies/ai-engine.html

This patchset introduces a driver for the AMD AI Engine in AMD Versal
devices. The driver manages the AI Engine array and allows users to
request an AI Engine partition (group of AI Engine tiles) for their
application.

Note, two Versal firmware patches are included as they contain
functionality for the AI Engines.

Thanks,
Gregory Williams

Gregory Williams (7):
  dt-bindings: power: Add AMD Versal power domain bindings
  dt-bindings: soc: xilinx: Add AI engine DT binding
  accel: amd-ai-engine: Add AMD AI Engine device driver
  accel: amd-ai-engine: Add support to enable/disable clocks and change
    clock frequency
  accel: amd-ai-engine: Add support for AIEML devices
  accel: amd-ai-engine: Create tile memory information
  accel: amd-ai-engine: Adds AI Engine reset operations

Ronak Jain (2):
  firmware: xilinx: Add IOCTL support for the AIE run time operations
  firmware: xilinx: Add IOCTL support to query QoS

 .../bindings/soc/xilinx/xlnx,ai-engine.yaml   | 151 +++++++
 MAINTAINERS                                   |   9 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amd-ai-engine/Kconfig           |  15 +
 drivers/accel/amd-ai-engine/Makefile          |  15 +
 drivers/accel/amd-ai-engine/ai-engine-aie.c   | 423 ++++++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-aieml.c | 362 +++++++++++++++
 .../accel/amd-ai-engine/ai-engine-aperture.c  | 195 ++++++++
 drivers/accel/amd-ai-engine/ai-engine-clock.c | 326 ++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-dev.c   | 230 ++++++++++
 .../accel/amd-ai-engine/ai-engine-internal.h  | 360 +++++++++++++++
 drivers/accel/amd-ai-engine/ai-engine-part.c  | 167 +++++++
 drivers/accel/amd-ai-engine/ai-engine-res.c   | 184 ++++++++
 drivers/accel/amd-ai-engine/ai-engine-reset.c | 300 +++++++++++++
 drivers/firmware/xilinx/zynqmp.c              |  46 ++
 include/dt-bindings/power/xlnx-versal-power.h |  55 +++
 include/linux/amd-ai-engine.h                 |  73 +++
 include/linux/firmware/xlnx-zynqmp.h          |  36 ++
 19 files changed, 2949 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/xilinx/xlnx,ai-engine.yaml
 create mode 100644 drivers/accel/amd-ai-engine/Kconfig
 create mode 100644 drivers/accel/amd-ai-engine/Makefile
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aie.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aieml.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-aperture.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-clock.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-dev.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-internal.h
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-part.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-res.c
 create mode 100644 drivers/accel/amd-ai-engine/ai-engine-reset.c
 create mode 100644 include/dt-bindings/power/xlnx-versal-power.h
 create mode 100644 include/linux/amd-ai-engine.h

-- 
2.34.1

