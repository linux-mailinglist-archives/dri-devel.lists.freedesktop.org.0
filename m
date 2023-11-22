Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09ACB7F3D53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 06:31:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B4F10E105;
	Wed, 22 Nov 2023 05:31:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eae::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330DA10E105
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 05:31:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgQ4wgucdU9lcF29Z5PLYcTrIkOj2snv+LzZsNtJprIvdKDP7NTOZiQXR2+43lsUXqSTCD22BIiYG7ahdX6JrIHdqU59lBKQseUdWTTykMn8PYVztqYoMue0gAcu+23iOrEa7ffwgXySjhqDHP6BA5Oa+3K/a7fWsaUqsd9ZbCpuPPKYqgxAXY1uwYeOkMDpC+OE6mGfgU/GOdmfTM+XS2MuY5HGLFw6AavCr9gMnF1kLhik5gUsiNlsdrXpL/eQC/IENzVDCwPh3jdkMm6mMng1adG3penc64fyjLDH86iGoSD7+ijEMYFaurHKn1ATXSJyvV0Ls+YKvp9ejN9Kqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QbPMeGxszExTFGX3wOXJekuTkAN28MGnaWFeO6lrGDo=;
 b=CyimvQj5IjOFMdbh7LghfDgumUxkLbZjdsENkIoiv8db6VoqyNkbU8FVnkx8RqGsqLmt9NWNicoq7VcAWpgok15+goPY+E9UbReqA7lEegL89UQsWVEV1fOXZ+viK1FaRts1nK0QvBJanHNnwzqDvf/lmVqHEtpAswJVMwqoTprTpcBpAVw9LS2YvQQ3SuKrRM7o/RgZWG9Ax+8dX+6wLhtr/DHrEJ6kQ3tS7tqKlcONWanE5Slu/4sDKEksUBX2GySHWZfEHsbSuU1kWlTC0SAUkLcJGKiVKCpoPYhNh7D1wi4P1IUGowWFL+r789bfzsmRJLALhfL4zQfOHh/lsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QbPMeGxszExTFGX3wOXJekuTkAN28MGnaWFeO6lrGDo=;
 b=zlfMrK+BnbFdggakS2V33hgHt/KyOb7DhPMEMQGYM0j8PgZ840IsHy5DU6jeXIjA0u10YEhrhokHP6ug6v/xYK3np06pWnj/PoxnBhEE4Qn6Ow4ko2JVr/gk7FM8U5Wmmh1yT29k4pkRWTRrS2fVYiVc4U8uBkVCLWQgExYlFTw=
Received: from MN2PR05CA0040.namprd05.prod.outlook.com (2603:10b6:208:236::9)
 by CY8PR12MB8068.namprd12.prod.outlook.com (2603:10b6:930:75::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Wed, 22 Nov
 2023 05:31:01 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:208:236:cafe::72) by MN2PR05CA0040.outlook.office365.com
 (2603:10b6:208:236::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.16 via Frontend
 Transport; Wed, 22 Nov 2023 05:31:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 05:31:01 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 23:31:00 -0600
From: Nava kishore Manne <nava.kishore.manne@amd.com>
To: <mdf@kernel.org>, <hao.wu@intel.com>, <yilun.xu@intel.com>,
 <trix@redhat.com>, <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <linux-fpga@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>
Subject: [RFC 0/2]fpga: Add fpga configuration support from a pre-allocated
 dma-able buffer
Date: Wed, 22 Nov 2023 11:00:33 +0530
Message-ID: <20231122053035.3758124-1-nava.kishore.manne@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|CY8PR12MB8068:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9a0210-bada-4d6c-d55d-08dbeb1c36f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3sb9HveYSaasxoYA0KV1YqVkMdh0JCvz3tus5IW0o7WgEqu8+40MM48PU/NGuKEe+8dQI0++g/CMieLIKlA/DTAVkcyoXV87XUy5DjHoWleSBVOQa8Ghg5MPwSNzOb84SipJFXyLQ8rKwmZlEKJg5Q+UpuYlovbaNW5KhbOeTRqOYnvBY64SuqBHl/kdJY5M68tSHnhm2dljWB7uMLk2tnNEhT4HLG3Yp1M8x9GWpxB7ADNmMJnWzTJ3jTQvdnFCn2m+LmmSCd3rEVGTLW3KdIzVw7sFYksY3bmWPYhwNAoja3D6cS1u9dApcHANcmygplg6gfAlUUs8b/g0hGB2redSGFp0XH+gm8jShikxPLwHtZfq5rw9fR9xYLzLtJayLHhZlfKbgGy4JOY5K+6upf1p1MJ+D4o8K9QPDTZCY2xALqfTYqjQXTo2Gm9ITsvpBvSzKiJOy5QfqQ5DtjgNhvEPGGeUIY0jRag0vc2hzWMgcR/ccUK8Tm9IJPnQjLt90Oe0FFBVPCJtKH0UfZ+bOIBmHEDSYqfFvBnSSNg2eBZBs9clZMjZhOYa7pShumfAWXRdGnLtDBZYDJ9g58I6Kfs7+Z9C9zgufENPMlLzZ/0DjpZVe+m4SXQ2EuysSogqMVVW0TJ2Tf1s0QcbvAE7Za3cOdhjBnZADvDVWXbk54l6FBqHKFVRudwCEtZHHWhB4XL7JGthHM6qdlRiQPYm7I2WYXrr1pIZqxsImSv1Wm3WJtAsf4oRJsIAVU8EPb2A1P2Pq9UkXdX2e3c5jZxrEFFStTfvf/kQYL/uXkTkOUI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(346002)(39860400002)(230922051799003)(186009)(1800799012)(82310400011)(451199024)(64100799003)(40470700004)(46966006)(36840700001)(16526019)(26005)(83380400001)(1076003)(478600001)(336012)(82740400003)(426003)(81166007)(356005)(6666004)(47076005)(70206006)(36860700001)(40480700001)(316002)(2616005)(70586007)(110136005)(8936002)(5660300002)(86362001)(2906002)(40460700003)(7416002)(8676002)(103116003)(41300700001)(921008)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 05:31:01.6215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9a0210-bada-4d6c-d55d-08dbeb1c36f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8068
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

Lots of embedded systems have memory constraints but they need to load
very large configuration files.The FPGA subsystem allows drivers to
request this configuration image be loaded from the filesystem,but this
requires that the entire configuration data be loaded into kernel memory
first before it's provided to the driver.This can lead to a situation where
we map the configuration data twice, once to load the configuration data
into kernel memory and once to copy the configuration data into the final
resting place which is nothing but a dma-able continuous buffer.

This creates needless memory pressure and delays due to multiple copies.
Let's add a dmabuf handling support to the fpga manager framework that
allows drivers to load the Configuration data directly from a pre-allocated
buffer. This skips the intermediate step of allocating a buffer in kernel
memory to hold the Configuration data.

This implementation allows the lower-level drivers to request the FPGA
Configuration image be loaded from pre-allocated dma-able continuous
buffer and also it avoid needless memory pressure and delays due to
multiple copies.

Please take a look at the changes and let us know if any improvements
are required.

Nava kishore Manne (2):
  fpga: support loading from a pre-allocated buffer
  fpga: versal: Use the scatterlist interface

 drivers/fpga/fpga-mgr.c       | 113 ++++++++++++++++++++++++++++++++++
 drivers/fpga/versal-fpga.c    |  13 ++++
 include/linux/fpga/fpga-mgr.h |  10 +++
 3 files changed, 136 insertions(+)

-- 
2.25.1

