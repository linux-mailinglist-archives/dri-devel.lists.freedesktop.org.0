Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A154BCB6D4E
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:58:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8A610E840;
	Thu, 11 Dec 2025 17:58:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="y3Tr9oq3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012004.outbound.protection.outlook.com [52.101.43.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6CC010E840
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YoEBbcj+AZWYQ05ikPLGmSCD+EexxJyZt7rbz22/ucyctqaG1s/fqA6me/TKNh5Yp8BVdiJgry2I4wEV2xLmg6sn67VObC8GEizHIP5RQJxRCIM/b/hkaiKm+Q+53C9h5PY20qiv7N4z3fZRXTMvxoIVlMOT++N92efjXgAcfdXsBSl1LrtQjImUOZVdOVz8znTpgi6F3D+5S/AAAKg+0zNhj8RC0OO6NOoyhdoF10eLQ6sJTmYq+9WtR31sw78ra2slQLCEI3NPtLXu/FO5KkH2UgDEZwhq/dcZ/+K5Y+InpzcyHP7TMapG0F9bqTuskSmEw4SWB8pF7u31ZcJG5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RCjPRMqZhjMn4/xqe50lGgU1e/VGKF8hmXwJWfifcyU=;
 b=LIQfpl2RPjgjqeJOY70e7X6msRDFw8k2U3jRHA35OSl0pa2KLUHR1750OGlpnlTcjG9S2k+/H0YKnTmH3npqwh+wtJXXk8UqFIVJFphqvCCiaywkO7WFXFTWISO0taRbaNC7Vj9pga8CUWEGZ5X8ErkxfRQYmAnY8nRmFePhYAjoB2mcAlc1OyHkikPJniJN9QWmpsCJ2IbDXc8vJWX8icPrtx4yqvTu2h0Brn9cvlZ6AWOy6vefwSaw29wI8eKTx9I/6/9kSRPQp2zQdHrnhB/Ox/cCf5WKuRe+APEQcfJQAn7iHJVhJyZ9c0crAC2TWJ5m+OZffsjgfXHQi0EGtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RCjPRMqZhjMn4/xqe50lGgU1e/VGKF8hmXwJWfifcyU=;
 b=y3Tr9oq3Uulf5pBMsU79k42GNHWu6hdJxIimrCmqxaSQSBTLybdjF9P4t/zI5J5Ysqd5VujEJTVmMws0Xt5ddW8sVuBlcdu6/EPiXTmY9nkwMRMgBhFEMOTPFNfFTDxLf0QLIzGUTbCbGHtALIUOMg30WuBrDhXqaNJDVii5YDQ=
Received: from BLAPR03CA0139.namprd03.prod.outlook.com (2603:10b6:208:32e::24)
 by DS4PR12MB9657.namprd12.prod.outlook.com (2603:10b6:8:27f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 17:58:36 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::1f) by BLAPR03CA0139.outlook.office365.com
 (2603:10b6:208:32e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 17:58:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 17:58:35 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Dec
 2025 11:58:34 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Dec
 2025 11:58:34 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 09:58:33 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>
Subject: [PATCH V1 0/2] Get real time power input via AMD PMF
Date: Thu, 11 Dec 2025 09:58:00 -0800
Message-ID: <20251211175802.1760860-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|DS4PR12MB9657:EE_
X-MS-Office365-Filtering-Correlation-Id: fd1a6e2d-69ee-4a2e-a9e2-08de38dee7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eG4M10O36YxXthJOubCk62AXVzsSNugtYaDEn0F1SFpOn//lX11kySazwSYC?=
 =?us-ascii?Q?2P0RWPHV29LdheTaeSVIdpfTVGQtkDg4fTklF7xDOVuiysy5qSes/eVPRIYa?=
 =?us-ascii?Q?aLtp9CS+kEXx6Zi0UTGdUR9asH436W9Qqp9DcnLIeuHHNZ7rFU3w3VVGsqCE?=
 =?us-ascii?Q?CyuWkpD/6r6/rjbj5aQSQ8q0S/lQyecRGM07X/s4YM1nbzcBoAg2ne9Apb29?=
 =?us-ascii?Q?aD3iSDntJ+L0BYWTmZLX9f+2bE92+ZRmflkvINhbH8AM478yXfof+2rurJCk?=
 =?us-ascii?Q?L+uWvGvWNnhEAg5/xLSHjfPzLRYGXng5IWUAYs1ZpMYm9rBlbfilwA/IOMkR?=
 =?us-ascii?Q?AvthT3egW0zC4Vepy2WNse8TuYaTGQngH7JriG9pa94vUXVbFPotOHdK8oef?=
 =?us-ascii?Q?HqEoWl3I1k6+WtSqzGVscLLxa6E+Jgl0CCKqYvAh85gk8fMUuOgWbYWXct2D?=
 =?us-ascii?Q?mLqPigrUxkNt1fFTwd4GDzLjmF4l840Hr5cocmgP+qXdq9MhOvwCc4bidUHx?=
 =?us-ascii?Q?KOWQsT0zsDw5026OXkuIR1mfN6bid8p+0sWzV0k+BQyeDPk+F/AKKi4dEPrT?=
 =?us-ascii?Q?vyas68LsdAm9XzFHSNNvb+XiAALnezoKd4Riiu8V8QYfrmROWQQVm/9/ghw/?=
 =?us-ascii?Q?5AfpgPRNT6mydFGcMKohYhn3IHVrZ/1QsdyyDZ1SErLLgkPKANEaK4tmr9Zb?=
 =?us-ascii?Q?GCE15/BPxbqm0Ucprc+7MgfK/LhU2R7TlTJ9VSScdNm13l8BWePWqO0pQgqt?=
 =?us-ascii?Q?WY3bCcMwwfb8J33vC0RPos9bvsz+82Zz2DRdCTsvoAlqMEZo+0jvrYjQWPxv?=
 =?us-ascii?Q?vFfjCOZk/IQtu43I62Lbxk3LBRktgGRutFr1Kjucl8ZhHdUd1AYBiLPPetUS?=
 =?us-ascii?Q?Y47b/gsoxKgzzZy3xCXck9WqaTQ1DRzAmnZalEz4SSSRha5M6Xj2F9ZQ+nak?=
 =?us-ascii?Q?Uf0l5L/Wwy50xM8AvrGucu2PjFJfh4kynIPG7kJl3QqI62debD6icn6yhFLN?=
 =?us-ascii?Q?npuSrhbMWDxAvRBRxKm6D6d9WLvOZI2AkwyIWNGTUiSPCxc28FNvAR13sMh/?=
 =?us-ascii?Q?li1ggeJdU0rwAgdY52IzMilPypntiX7XfRsBC7gRLhhw9k93Dtu7DGwvFFtJ?=
 =?us-ascii?Q?GAnb9w0tpSwsWN0vhCBeA2a3SUshI09c48Ouk9kjQJco0tRD1x77Cg20EF2D?=
 =?us-ascii?Q?7V20ypfFhdVlt+dQDP6aASAToJUHTQ1dxjiLf6IULtEsMC1ng2vHcvmJQhTK?=
 =?us-ascii?Q?538asNXZSrNs3kHZZxTbFVByAQYP6tvx1tv8KbIxWmXXhrJRs17VGRa+MTA8?=
 =?us-ascii?Q?7tQ4aZJYG6F98hisvbO181RGbKBx90RxkZjXv84I8fyjbk6kX9iYe93/hcF8?=
 =?us-ascii?Q?LQ6NocnCeczEljpGQbokSzn7yRjfItrmjGOspp63oUj2kaYcdxXPgUKTj/yZ?=
 =?us-ascii?Q?Z232p4fRchdwFyHqvmP5K5P3O2+CAEbhy0eGmiA+RbAHNpcvwageSpvsbw+1?=
 =?us-ascii?Q?liq0oAN9a3KnCRwyxhJNdtBU7zImLEsJ6Tm9bFxnWEOnAvlOwbq1NK97toVg?=
 =?us-ascii?Q?tyB8eBo8DXkHmBsS4Ew=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:58:35.6179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd1a6e2d-69ee-4a2e-a9e2-08de38dee7d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9657
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

Adding new NPU metrics API to AMD PMF driver is pending because of
lacking real case.
  https://lore.kernel.org/all/d344b850-f68d-f9a5-f0dc-55af4b48b714@linux.intel.com/

Create xdna driver patch to fetch real time power input via PMF API.
Here is an example output with xrt-smi(1) tool.

# xrt-smi examine -r all | grep Power
  Power Mode             : Default
Estimated Power          : 0.563 Watts

Lizhi Hou (1):
  accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate

Shyam Sundar S K (1):
  platform/x86/amd/pmf: Introduce new interface to export NPU metrics

 drivers/accel/amdxdna/aie2_pci.c        | 29 ++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 18 ++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 drivers/platform/x86/amd/pmf/core.c     | 75 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h      |  2 +
 include/linux/amd-pmf-io.h              | 21 +++++++
 6 files changed, 147 insertions(+), 1 deletion(-)

-- 
2.34.1

