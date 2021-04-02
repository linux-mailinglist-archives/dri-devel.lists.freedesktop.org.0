Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4F83528BF
	for <lists+dri-devel@lfdr.de>; Fri,  2 Apr 2021 11:30:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A2746EE42;
	Fri,  2 Apr 2021 09:30:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DCA6EE40
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Apr 2021 09:18:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTAshxxfY3Ioed/xARTtZRyEAv3zI+ifmnAhqMSZtAjUWmqVt4aAX4jxugbds232XKz1HcPBlZFUQV4lU6iCRLNSVdYLILhMwYh9AoghR7cgMrI4FvTFcIYbGFgT2cxIY+3HlgvvzcyRXDXUKuPMKfnJibS+JpBoLhh/JdZgX8NaDBxBOoHvDYDOiGD+IReLXNYfsN8XnAAqWd2ZllwB4qM4euRbtEqPqhK621p/Nw2vWDDVUPBuO5uznXxiZyGm/51dwpF/eged9GrTFT2Opamac8PDGcBg3Pk2I5Wa8z7bVKTianBpBNr6hvimI4Y73RU/rqY/gsAwTDz3W3If9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSG16FGYCEn7frSXGp5wcQSDZauhGuvbz2pwvlyI9zY=;
 b=moawFm2ay00Q1zvyYWsZhYkvsNnvQcFa+UQclXkV2AxwFkCHswTA6rMs7r3vOKWVZxRFrdwmmRsoXRLmVostWyzYSrXmwmTORyfD1TC7PaE5H3+FSOPvj+lQIBLmTG0wbcWMVzsDTRLQYHYe6gx+OcRk7GtJClckOEePhYLjq9wyQhQcncwhkXVJtbLDWaTo27490WIf3saCNakOL+K72H7SHy521d3lVbWAq6uhji6J3gvzEwmHplh+9hxgco+D6NpF+3Nc0Jmi1e0DrVhjdfmbv3Vmhw82oSeiFjhbYaVOow90M04+R3VuBbWRc0Dr0s1ehQAugY/7vHlu/8kmCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HSG16FGYCEn7frSXGp5wcQSDZauhGuvbz2pwvlyI9zY=;
 b=Lp5+skYfC2XzhYCpmZRSley9IQofyHu4ajjckfYPqGkwFOY2VLijkp+Co42qVGpk+b+eVBr6bjqKhxW3oC/rIwmQwDLY121jRdVtkLlmUIduFcDqCqsuzwLQGM88bBK3n0q0iQh+KQMn8M3XlWsLu7EoFMDCZ2nlzdi+tP0DlQ8=
Received: from CY4PR04CA0040.namprd04.prod.outlook.com (2603:10b6:903:c6::26)
 by BN7PR02MB4065.namprd02.prod.outlook.com (2603:10b6:406:fe::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.28; Fri, 2 Apr
 2021 09:18:22 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:c6:cafe::23) by CY4PR04CA0040.outlook.office365.com
 (2603:10b6:903:c6::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26 via Frontend
 Transport; Fri, 2 Apr 2021 09:18:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3999.28 via Frontend Transport; Fri, 2 Apr 2021 09:18:21 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 2 Apr 2021 02:17:40 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2106.2 via Frontend Transport; Fri, 2 Apr 2021 02:17:40 -0700
Envelope-to: git@xilinx.com, mdf@kernel.org, trix@redhat.com,
 robh+dt@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, linux-fpga@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Received: from [10.140.6.60] (port=55560 helo=xhdnavam40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <nava.manne@xilinx.com>)
 id 1lSFvu-0005T9-Vz; Fri, 02 Apr 2021 02:17:39 -0700
From: Nava kishore Manne <nava.manne@xilinx.com>
To: <mdf@kernel.org>, <trix@redhat.com>, <robh+dt@kernel.org>,
 <michal.simek@xilinx.com>, <sumit.semwal@linaro.org>,
 <christian.koenig@amd.com>, <linux-fpga@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <git@xilinx.com>
Subject: [PATCH RFC 3/3] fpga: zynqmp: Use the scatterlist interface
Date: Fri, 2 Apr 2021 14:39:33 +0530
Message-ID: <20210402090933.32276-4-nava.manne@xilinx.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210402090933.32276-1-nava.manne@xilinx.com>
References: <20210402090933.32276-1-nava.manne@xilinx.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 699600dd-5eef-4dec-17fc-08d8f5b842f4
X-MS-TrafficTypeDiagnostic: BN7PR02MB4065:
X-Microsoft-Antispam-PRVS: <BN7PR02MB40658FE68691540BE8584334C27A9@BN7PR02MB4065.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:411;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q+3cuuQ5FwBsI38HD7PyC16LojWg0cPR9kKbaoUPy85TpM29LI6KQLf6t8DavxR7pRFpF9ECy7LYlYiA5lgY47g8DnNPRgHAuiXfLoAHHEP7MLSZvJYd6dAAht4+tdKl1XMCDOA4zYOZvWLvEx+NZ2vKrTaeWDAE9poUNjYDgMtZmV14BN5TT3uivIk3fWdbxy2Hpm+flk+YnHo2xwDDfUvgNrsrcHf1qWIDd5HP/KuU7g99yx2I/yGBDEB3RSmQH4BJxuTqayfAGpl9YEQcnZn319OenMU7geeDP202lGqWF0ZVrUp7cmbPDF1pfVT5fg+sEjxNUU+of0ryqSVQpOZAWOLK2K9vDHRzS8O6KhG0L8fEiktID0Fuh6xOhtjf2nKYiy8+txtfPzFxVk7r8TQnX4Cuqp4b5QiIEuAyvL5Eriml2OmGNJUTZ6yBKYKpsnkzlmigHOZA8Fh59efYEdL66z7ekFDz3aAp0fAbBM62KqqlUSz/u1BByBIRhsEG5y2auePYSDe6e3J3no42XihrT/2Qhr0IX0HzgjNGnCFAXyFTzlg8tP9Xty25QIGWsFW0iAB+ByDVS1eLsTGub47pVEc+ZvnHTjzDeQrktG1jGJGxXpVGlIao9t+BXwv/oFMhR5fXt6IZbt7eJOynrXSWlbj+lrWLpPoDWSGHFG3SkTyDFAQM7X7sbI+5DgbKfeDei21/5P4tOE/yTbmTHpiqeGryMPXEAipFme18J/m8sn3ntwQY9ZHE6jGMlEoi
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(136003)(396003)(36840700001)(46966006)(47076005)(336012)(36906005)(6666004)(7416002)(9786002)(316002)(426003)(2906002)(1076003)(110136005)(5660300002)(82310400003)(83380400001)(356005)(7636003)(36756003)(478600001)(26005)(186003)(107886003)(8936002)(4326008)(7696005)(6636002)(8676002)(70586007)(70206006)(921005)(82740400003)(36860700001)(2616005)(102446001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2021 09:18:21.8366 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 699600dd-5eef-4dec-17fc-08d8f5b842f4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4065
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

Allows drivers to request the Configuration image
be loaded from dma-able continuous buffer to avoid
needless memory pressure and delays due to multiple
copies.

Signed-off-by: Nava kishore Manne <nava.manne@xilinx.com>
---
 drivers/fpga/zynqmp-fpga.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/fpga/zynqmp-fpga.c b/drivers/fpga/zynqmp-fpga.c
index 125743c9797f..3bb6bd520d71 100644
--- a/drivers/fpga/zynqmp-fpga.c
+++ b/drivers/fpga/zynqmp-fpga.c
@@ -66,6 +66,40 @@ static int zynqmp_fpga_ops_write(struct fpga_manager *mgr,
 	return ret;
 }
 
+static unsigned long zynqmp_fpga_get_contiguous_size(struct sg_table *sgt)
+{
+	dma_addr_t expected = sg_dma_address(sgt->sgl);
+	unsigned long size = 0;
+	struct scatterlist *s;
+	unsigned int i;
+
+	for_each_sg(sgt->sgl, s, sgt->nents, i) {
+		if (sg_dma_address(s) != expected)
+			break;
+		expected = sg_dma_address(s) + sg_dma_len(s);
+		size += sg_dma_len(s);
+	}
+
+	return size;
+}
+
+static int zynqmp_fpga_ops_write_sg(struct fpga_manager *mgr,
+				    struct sg_table *sgt)
+{
+	struct zynqmp_fpga_priv *priv;
+	unsigned long contig_size;
+	dma_addr_t dma_addr;
+	u32 eemi_flags = 0;
+
+	priv = mgr->priv;
+	dma_addr = sg_dma_address(sgt->sgl);
+	contig_size = zynqmp_fpga_get_contiguous_size(sgt);
+	if (priv->flags & FPGA_MGR_PARTIAL_RECONFIG)
+		eemi_flags |= XILINX_ZYNQMP_PM_FPGA_PARTIAL;
+
+	return zynqmp_pm_fpga_load(dma_addr, contig_size, eemi_flags);
+}
+
 static int zynqmp_fpga_ops_write_complete(struct fpga_manager *mgr,
 					  struct fpga_image_info *info)
 {
@@ -87,6 +121,7 @@ static const struct fpga_manager_ops zynqmp_fpga_ops = {
 	.state = zynqmp_fpga_ops_state,
 	.write_init = zynqmp_fpga_ops_write_init,
 	.write = zynqmp_fpga_ops_write,
+	.write_sg = zynqmp_fpga_ops_write_sg,
 	.write_complete = zynqmp_fpga_ops_write_complete,
 };
 
-- 
2.18.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
