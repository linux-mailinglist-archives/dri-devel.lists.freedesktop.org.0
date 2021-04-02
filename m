Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B804E3528C0
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28546EE45;
	Fri,  2 Apr 2021 09:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8006EE3D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:18:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TNP1FdX60U2bQu31mXU+2R8IQn3NpmCMO7FC8XIjhdx9yyiV+EsRlk2UXkUnkbhINJl1Ha6IWDH0yxzlRcluvv0h4a8zv18+aO2s2BhOufPHP+P8Co0Um9/bzRzl5cGDCPBpYXhm0AEnqDj0aVuP5x/tcy1q4Z9iYK6GTKesgj/i/KyZ3V9I481VUKdqmA6A05j0qP9/WNsObb2xyWX7IimqNmxY5D+M0F/C5ysCy0CdPD0RpaOBy5fLUOXb/g0xhp7U4bE3C8S/Bop0ZHMnkXsON0b8bBDcptTR4Q9gW2mst9CczjVrBXGuPXB1HtWo7m5vuGs+ZtFwSwY8/AfuKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ3v1l0wYs0BpTdbdERVQU3Hp1actc+I3HDz0FQ5mnw=;
 b=Tl3vKCG4sRYgw5CNcQzPLJDq+ut6GudWzJIHhL7q5qPguakxNwKx/Je33Q6wBGaSbIVaVjklkd10PycIKFD2hnB2I/sFICBxiTtMaMxQ2NMKhUU8EJKGgVGErmPbZpVH0qWla2xl0VETdYBYF9JnWjSg3i3YHOyImyWiXb2M+sELovfvrXAFTAMggaSu2oxua1g7pXv1iTc5I4lFmLw7pIgScCJcAAgx4v7fA0Jy/gyExR5pR3S7+T19rqwc5al2SJa7C7K4+YHX5MoNIw1DE4XGJcg6LX8Q6iM59PYZjW44mQRjijwjHgYt3+ArLKTiEQCSzxC2ITragQvMmIY2xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mQ3v1l0wYs0BpTdbdERVQU3Hp1actc+I3HDz0FQ5mnw=;
 b=mgXZth7Zj3aVqIZj92mgC/981P7/B9rT5aQlZIZhbJO/Q/RIBCp74tLoKvR8CfwwvH/7qg8k47nzUfT1ChbYM9n/jO97ndUc7pciUFPbTPDuCHt5qANfBQ5/1mTxxpSix9ALVKQIs1Qo70sndW+hNKBWWAN8//+FcX0MM073RCU=
Received: from CY4PR04CA0035.namprd04.prod.outlook.com (2603:10b6:903:c6::21)
 by BN8PR02MB5778.namprd02.prod.outlook.com (2603:10b6:408:b1::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Fri, 2 Apr
 2021 09:18:14 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:c6:cafe::9d) by CY4PR04CA0035.outlook.office365.com
 (2603:10b6:903:c6::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Fri, 2 Apr 2021 09:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 09:18:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 02:17:32 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 2 Apr 2021 02:17:32 -0700
Envelope-to: git@xilinx.com, mdf@kernel.org, trix@redhat.com,
 robh+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [10.140.6.60] (port=55560 helo=xhdnavam40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <nava.manne@xilinx.com>)
 id 1lSFvm-0005T9-Uy; Fri, 02 Apr 2021 02:17:31 -0700
From: Nava kishore Manne <nava.manne@xilinx.com>
To: <mdf@kernel.org>, <trix@redhat.com>, <robh+dt@kernel.org>,
 <michal.simek@xilinx.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <linux-fpga@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <git@xilinx.com>
Subject: [PATCH RFC 1/3] fpga: region: Add fpga-region property
 'fpga-config-from-dmabuf'
Date: Fri, 2 Apr 2021 14:39:31 +0530
Message-ID: <20210402090933.32276-2-nava.manne@xilinx.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210402090933.32276-1-nava.manne@xilinx.com>
References: <20210402090933.32276-1-nava.manne@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75f76c55-42ba-4c07-31c9-08d8f5b83e3a
X-MS-TrafficTypeDiagnostic: BN8PR02MB5778:
X-Microsoft-Antispam-PRVS: <BN8PR02MB577822EF27D55F89CDA6C455C27A9@BN8PR02MB5778.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PsTnWbnRwTmN8R7/V2wMUnLMEq0tGmUQ5MBgbq4MbQMu5SDfzm5jwVGiKOp9ubNEqpULHbyx65Otb93cZEAneVtarnkm9PwBa707evpaWQAaZzIB2XsITVKRAkAJPGS747D4X1iZd3UsjpNXuHM52uE//Hv4iHrURR0l+mWW2z/NxZmCB/LDuC6cj4a6yWzAEzdmZxSbpMGEPbM9tpvt1Q5SyTmyZq/dxEZqICEYUXso1hBYWsFrOmoOzKeUh9wI5f6mTXc6O9z7pf5tZx9PZx7VtJdCuIw4OCO76Kvir4ln3gV+NtEQNO0JXzsr3BS3pCdTzPxbOgs9mEyLPlFxdo6j7xI3e4IkR8NJYK2BpM0mJRt0Gpk5Q/5MyuVAsznjMqrPp3jkTaFXgPulqpvGG2FdEFGoVrQRS2yRfPixgdKaOwyg6Dup+JN7pO4SFG4yaBflBxc7DkTXhvql2XlgdL0A0xoEdFh+o483eGpziejmWd5qfmYFMC7M5cmAubYxUaGDkGIhBONFpZJQYdlOp3f79LYOT9drkmx0jN1iGXrZJjpwXf5pAgbd7Bein3Bn1RHaG3gPZzvq+LPRduYQAHXoTWadE+So3jHoONu2XgA7td3QuxFkBdG9uE/pEYUjONXwAzEHp2aubVjhyCRHJTUGH8Jph2EdxQrj32xwfQ6TXJImSKSCbcAlUfCMkE3T0HKcvpgiML+Tq920R7z4zVYEaZ0dDysJUy29hdT42UHVf1fRByBmCo2S8IHrWj9L
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(83380400001)(110136005)(5660300002)(7636003)(8676002)(7696005)(107886003)(6636002)(7416002)(9786002)(82740400003)(82310400003)(36860700001)(356005)(8936002)(47076005)(921005)(186003)(4326008)(478600001)(1076003)(2906002)(316002)(70206006)(336012)(36906005)(26005)(426003)(36756003)(70586007)(2616005)(102446001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:18:13.9034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75f76c55-42ba-4c07-31c9-08d8f5b83e3a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR02MB5778
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

Add "fpga-config-from-dmabuf" property to allow the bitstream
configuration from pre-allocated dma-buffer.

Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
---
 Documentation/devicetree/bindings/fpga/fpga-region.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/fpga/fpga-region.txt b/Documentation/devicetree/bindings/fpga/fpga-region.txt
index 969ca53bb65e..c573cf258d60 100644
--- a/Documentation/devicetree/bindings/fpga/fpga-region.txt
+++ b/Documentation/devicetree/bindings/fpga/fpga-region.txt
@@ -177,6 +177,8 @@ Optional properties:
 	it indicates that the FPGA has already been programmed with this image.
 	If this property is in an overlay targeting a FPGA region, it is a
 	request to program the FPGA with that image.
+- fpga-config-from-dmabuf : boolean, set if the FPGA configured done from the
+	pre-allocated dma-buffer.
 - fpga-bridges : should contain a list of phandles to FPGA Bridges that must be
 	controlled during FPGA programming along with the parent FPGA bridge.
 	This property is optional if the FPGA Manager handles the bridges.
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
