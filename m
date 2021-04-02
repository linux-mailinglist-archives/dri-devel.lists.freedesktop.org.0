Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2083528BE
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:30:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CE816EE40;
	Fri,  2 Apr 2021 09:30:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam07on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 251B46EE3D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:17:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZVQaZuLdSTWGbO/QHJ2reVRcnwh5rjRKadREhbOPiwCH6Xs/cIxiDTwGUvBR9zlhtDeULLcZVjsh/rG9g8nWkyMCapJsgUW3uuMOvDYt7qrWKG1hpSMyoY61LlaNWQfaCv6TiY2KgVHbLvH8ZG30S5pwV/huHtHTzlGsjQs2fS2l5cBb+inf39iadrZQ803gmm1pTwWDpVnlcHxD4jfiZosHSWxob4FA/e2YHx9XqqzKUcBnegOnk+XToOrQSfPIUX1jp2TPxF91hdfKLrHZR9hycAMZ76fS/3TCAlvyHmR/NrnnHn8KRRhPB7QAkknsOttpiRTY2JWFG6UmmT8GLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DqhrWB8DXR45XGoK/bpvFIN6Pl71eAH2VVwuNZ16vI=;
 b=TFkj2cujhN+hbdMZFd9gEKLVPJPowC2aeFfNJq1+fl5E02ldgZEuz7KNVsC+Ku7eMBv5D3cS7VrDiEl9lv0+4ibUraHcPZn3XVuWViPKzalybTcIQ5FjR/BGWRRSyjjHm+c3NrIK4tOPhdV7sNqXY95VScxZl3N54zZjsdMQyhVbEX5lHaFU45Bn6i78i6uNsaZLWXUjVeVH5zADugHIOU4A2q3C+gPIXzELUeLjqywgiGt4fSXmXUWcnWrB9tWteYbNVqpurHXnLOUm60EA7isMyph34Gr4OoGzz//pq3YmnO1WRoGIVn5Ywg7a9hT5E/WqIAfXQQXg9pTVqezSRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DqhrWB8DXR45XGoK/bpvFIN6Pl71eAH2VVwuNZ16vI=;
 b=OkDyP9w52bURKCkgIuFyHcMn+EWvXCfZL7RwIX+RgXn9TCEIeG9IjdwOOdXASrPCKk3I2GiXDfZGiDZgQEM7LL2P+mZ5ktMbzcevJiT3Uuz2AIEGz9sal7XxF+TFCYTfOzkMNa3N/0plbVpy6Vv9iod6RhNLlOOMDXNzKevwiFE=
Received: from SN4PR0201CA0031.namprd02.prod.outlook.com
 (2603:10b6:803:2e::17) by SN6PR02MB5311.namprd02.prod.outlook.com
 (2603:10b6:805:6a::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 09:17:30 +0000
Received: from SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2e:cafe::4b) by SN4PR0201CA0031.outlook.office365.com
 (2603:10b6:803:2e::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27 via Frontend
 Transport; Fri, 2 Apr 2021 09:17:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT052.mail.protection.outlook.com (10.152.72.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 09:17:30 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 02:17:28 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 2 Apr 2021 02:17:28 -0700
Envelope-to: git@xilinx.com, mdf@kernel.org, trix@redhat.com,
 robh+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [10.140.6.60] (port=55560 helo=xhdnavam40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <nava.manne@xilinx.com>)
 id 1lSFvi-0005T9-UX; Fri, 02 Apr 2021 02:17:27 -0700
From: Nava kishore Manne <nava.manne@xilinx.com>
To: <mdf@kernel.org>, <trix@redhat.com>, <robh+dt@kernel.org>,
 <michal.simek@xilinx.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <linux-fpga@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <git@xilinx.com>
Subject: [PATCH RFC 0/3] Adds support to allow the bitstream configuration
 from pre-allocated dma-buffer 
Date: Fri, 2 Apr 2021 14:39:30 +0530
Message-ID: <20210402090933.32276-1-nava.manne@xilinx.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9a67be1-367a-4da0-5ebc-08d8f5b8242b
X-MS-TrafficTypeDiagnostic: SN6PR02MB5311:
X-Microsoft-Antispam-PRVS: <SN6PR02MB5311E7BBC9275297688B36E0C27A9@SN6PR02MB5311.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EPSzuJ3Drx3VSzkheIoUzSzLo0W2gph0kEzOOUkzLyJcOIx4NNfEQRA59Rlnh6TSoSmSJz0LEAjvdhS8ic0EAiUv9Nh9pnuoQ6xONoQ6puGp55UotXTGT5wVo77Y+YnrdUIxXoTz+CeXnMtkNMnkP3QlUXmh2P8mkVTPPim5YM99js2hqlP/7inqzeq8EIpCb7t4DOt3aLcmmeAVVyjZ1wImlkulCIZa9jS+dqUIJbopslmXjQ6T88MrVIAcGuYoinX3lm9QQ6Y9sIulu1GdOJ3R4tqr2S5VIod3NrEDzXID9fcUT7SxSdTfJG8usGoDAP4jTaSvfDKiXgfFmgJSfT/uyQIhEjM1dAFElSg/fHyk8zbc3iUKnil3W3IJo04hEsUz5I/4xUgGvGHRJy8gfIR79kMT+i8LajGpeqmGNDTOwvIOgGRGC7Q9A8aCCppf065puS1fhSSK/AtRtaMYTPPFAfFvwpK58xyZ5USQW0otLNqu8YdA/nCEedhzY9xcbkpamUhTqug3mE5HGzJO4Q1iwG41SNZ7p7BwaO6sZF02hgR1QDnF6v6T6wTsaDqvLAOtChpqvusFputMo7IjcuVE+Pk7Ic5jsAi8OdKP63zAt1rzp6fKkY4MhnWFIUUHXSdj5xHau6wU8M8aO0vSiveihO/AgxFva2NZN19Ut/3ilv8glfZ23W4Uv2ddJRVjDHCbcTpQMdaSms5HXxVL28qV2hPZ0l6Aj381XzDk01cfe0myNSy5R1QutgqOzv60
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(36840700001)(46966006)(4744005)(26005)(7636003)(356005)(921005)(186003)(7416002)(8676002)(107886003)(4326008)(2906002)(83380400001)(82310400003)(4743002)(8936002)(7696005)(70586007)(5660300002)(36756003)(1076003)(82740400003)(6636002)(70206006)(36906005)(47076005)(36860700001)(6666004)(2616005)(336012)(9786002)(316002)(426003)(478600001)(110136005)(102446001)(83996005)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:17:30.1735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a67be1-367a-4da0-5ebc-08d8f5b8242b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT052.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB5311
X-Mailman-Approved-At: Fri, 02 Apr 2021 09:30:09 +0000
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
Cc: Nava kishore Manne <nava.manne@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nava kishore Manne (3):
  fpga: region: Add fpga-region property 'fpga-config-from-dmabuf'
  fpga: support loading from a pre-allocated buffer
  fpga: zynqmp: Use the scatterlist interface

 .../devicetree/bindings/fpga/fpga-region.txt  |   2 +
 drivers/fpga/fpga-mgr.c                       | 126 +++++++++++++++++-
 drivers/fpga/of-fpga-region.c                 |   3 +
 drivers/fpga/zynqmp-fpga.c                    |  35 +++++
 include/linux/fpga/fpga-mgr.h                 |   6 +-
 5 files changed, 169 insertions(+), 3 deletions(-)

-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
