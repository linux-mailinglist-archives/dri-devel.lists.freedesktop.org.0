Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67CAECF5002
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:30:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 819E010E04E;
	Mon,  5 Jan 2026 17:30:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TUZ1pGB0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013070.outbound.protection.outlook.com
 [40.107.201.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 111BC10E04E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jkoI35KZPVhL2vsMnCmuf9hI8+K47RS+zKPbwlAFojkMI/a/4FoY1rsrkk0EcP1K4pjBustbyqZIntkbPy1N9ZnSnHb9cqu3we5eAybYzKXVkYxkeehsXBmzIsfJrZ9XDFGXm9CDK5QZRuY9e95vqd5WqcuG0iQXLAd/OPL14b6JQp4C11uK+0LjMmfRY/q0cNF9JyGTFakiPNt9Zu5iBnTa93lJzieTaGwdn7C5FCoEXLgVC0TSireU9fVcLrOM7UR0YQAY5zL99TlWVgjf7MEZXdJ40Fsjy0azbjTZmI1M4vGm3HHk6fqhnSGj59u0x/UbXjVK9DDsOG7TaDJ3SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TVhocTBP9GPwB7HNM2K/NkIBlCim1p8NyT5k7Snz1SM=;
 b=IykinAnhnLprZP0ARGGfgOSOV5SRoAYD4zykxIu73TGHQ5m6GXLtgh6PIOS9ZceAGufAy85xCsJRsIM1ICn3tSXEAUc6M8yDueEia4yBMNyqB88US6g7lrQMyZaBRxY5Y0WKl8mZaoqVJ6ekIlBY+ECZoFvik6kdRL7evLLjrxG1SpCoaxEXqke8WMyxKGpXsWNwiIJGxoTHB82b/DxUXkPGQryPFWqISsogVfotHoh79KBvdo7wPht46hrljFOx7mhjeMch0SngPKvFnFLAVsOFqXJkuCTHbqnJyfZSf2OQkzgRdjEPYBcn17WeQyxLI2A/prE9dFTKvSo77beJRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TVhocTBP9GPwB7HNM2K/NkIBlCim1p8NyT5k7Snz1SM=;
 b=TUZ1pGB0KfqNvs+rx3oq8ums9zXx2H/4sjvrAOITyCCiTEYmM+pqptB8wLyJheBv6vwk4b715Of7eGv4c6Jxdz+S7Pix+N0GKIVUmfs4xaYAan3aiLi87kGU0BCoRCGYVh+FRQek/nc+ZnyGcsB3bqcX5gQmhaF88sDyXMe8xgs=
Received: from PH7P220CA0156.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::12)
 by BY5PR12MB4242.namprd12.prod.outlook.com (2603:10b6:a03:203::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:30:09 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:510:33b:cafe::d1) by PH7P220CA0156.outlook.office365.com
 (2603:10b6:510:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 17:30:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 17:30:07 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 11:30:06 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 5 Jan 2026 09:30:06 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>,
 <hansg@kernel.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>
Subject: [PATCH V3 0/2] Get real time power input via AMD PMF
Date: Mon, 5 Jan 2026 09:29:54 -0800
Message-ID: <20260105172956.3732123-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|BY5PR12MB4242:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fb08dc9-e538-4806-a7ac-08de4c801257
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tLlJV3d7qNHJdEmFLHU6eXya8O++g3XBosQrkjIcmGFlf5XanFumPL6Q1azt?=
 =?us-ascii?Q?uKNCb6IISO7zKVf++z5HEAGCayT8Qf/fTto4xAEhDbMdLSeaa+4+utPU9Pms?=
 =?us-ascii?Q?g77c0huGuNMSODBiymeYjZ8+a/Gnl2/3QU54WFGcl9Sv0qQTBEPoeMf2Ibyu?=
 =?us-ascii?Q?+PuqXYz0DH4Dt85JzgOSfoWma3wAOiMn8mi8zPfuIngnMBz3RnHfPEFeCd3z?=
 =?us-ascii?Q?7ReL5AY8pU4z2N+Ts6lD3oF0a1ZfYFTjwhjjgwS2/ES1qbaJ4LbPcmRTyRAw?=
 =?us-ascii?Q?gfeoDAGuQab88U7a7jln9MenMdtcp/JkfWuqkP6IviPaeXH0TTUmUO7ECECx?=
 =?us-ascii?Q?C7vJRPt0rM8AmT33M1/4NlndyiBkzioVrgSsn3z+nKXSeWehBcxvjdXWK32I?=
 =?us-ascii?Q?bT56MBVhibpkSBEPZPPBMF8OUMgJ5MVycQjJVrjan7tyQJXWmtlUsUmf+jh1?=
 =?us-ascii?Q?GGfDtkWlqaxeUrkHVlBiyoJUc94vzvWMPLVvPksWZrNksrGoQeIQ/V8Uz1qu?=
 =?us-ascii?Q?4e5bbeoDnDnhAqusNIzzS7GmLfSSH+XsLtAoX3Q0JzCO3w4/Ldj7kwOVBHBx?=
 =?us-ascii?Q?WkSE6OIX0sD7RV9X9ycBvqLujQBp4DVcjvczh6cA13+rvRHvjgtFZwQKiSfu?=
 =?us-ascii?Q?HSyoXTl/w49rTbfouCwfP1LnPmwwRq9s6IfIy+PZR8hluSM5cCShLHFYkkE+?=
 =?us-ascii?Q?uZKBJE+9Fvo94ndo0U/+3VuBSrqnH+J6bWVBc3naKa/hPzJ6898xzIkAsQvS?=
 =?us-ascii?Q?y5tLbzNnjRKEnMC2oU3FiU73WmkZ127fqQyCYpIkf7w32VVVuMBhkeh7Fb0G?=
 =?us-ascii?Q?AoQ//m4a3lsAFphUL1PiP6n7dp7xF6g/YOuZJxnwgG967H2ABNmRablB1N52?=
 =?us-ascii?Q?qizwJCK0z0IGVmHLgRxWsU17UA3MzbpDJIdMwFPa2oIbGsqle7KedaEVFX50?=
 =?us-ascii?Q?BwWdTlqRh+/J0qx9GSM3I4OHcAXK8g82RPCKim3dmilg2I2zOgg53dPQKhUr?=
 =?us-ascii?Q?dwhxXEEIBm9fNVy4fzIFrDVfN+XVElUGZMIseQwWy/0/mYfAYmXY5oyZd20z?=
 =?us-ascii?Q?P/rLCEhF04wN0DOCnlU8DpuZibUX52V86yr4fGf8wKIV21KtdISJg/gYTZPI?=
 =?us-ascii?Q?0tLf84kwlsoeYZvVQfe/vnjKtaFv9JrRXrmY2ObDD/tECwVRoDSQdVrNbpbo?=
 =?us-ascii?Q?opgEwgYtkexL5ZRR4ZgE7UEUnawmEsy52TghSGJ8RsQkuTcR17r5dFhd7DQt?=
 =?us-ascii?Q?KIRSdYfrNjdl8gN//Zr8beRfBeRN+PymCci61Ft7dfNezdituTMHDk06PtDG?=
 =?us-ascii?Q?SsWKEK6aZqFaK1v7O1MKDZapWr9DnbniRj937IvIHemOwvogTbVVr0WEW71O?=
 =?us-ascii?Q?zW1c2fFDZCL2gPA2JgGZuaK2dP6bxthpr0AYoFMDK3h5Mi0XOfakda+XIfGL?=
 =?us-ascii?Q?+P9JoVIg36vgpm7R6e5clhBr9T0Uuw2kPVGo47xLtaAal3ZZMzEeCzR5PRCZ?=
 =?us-ascii?Q?RAZ7LWr1o3woVaw/bjn5A86vgsYUoaf3gu+86/CsiR0Pdv15JTTObBlD0UeM?=
 =?us-ascii?Q?ja7wdQO60ilq7g1RMzj+ZqDpK9kY6VlEY9QAzT5U?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:30:07.9110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fb08dc9-e538-4806-a7ac-08de4c801257
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4242
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

v3:
    Save return value of is_npu_metrics_supported() and return it

V2:
    Including header file for struct mutex will be added by
        https://patchwork.kernel.org/project/platform-driver-x86/patch/20251202042219.245173-1-Shyam-sundar.S-k@amd.com/
    Add include for U32_MAX
    Replace snprintf by scnprintf
    Fix coding style

Lizhi Hou (1):
  accel/amdxdna: Add IOCTL to retrieve realtime NPU power estimate

Shyam Sundar S K (1):
  platform/x86/amd/pmf: Introduce new interface to export NPU metrics

 drivers/accel/amdxdna/aie2_pci.c        | 29 ++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 20 +++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 drivers/platform/x86/amd/pmf/core.c     | 76 +++++++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h      |  2 +
 include/linux/amd-pmf-io.h              | 21 +++++++
 6 files changed, 150 insertions(+), 1 deletion(-)

-- 
2.34.1

