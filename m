Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A57F4A80FA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:09:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C2D10E9FF;
	Thu,  3 Feb 2022 09:09:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2050.outbound.protection.outlook.com [40.107.223.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E048210E9F4;
 Thu,  3 Feb 2022 09:09:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+1VrLoMXrKR172yHA2aJEcHJA8kRvFcU/+VbEAmPfxijlp66/O3BBawD/CvLUwViPS5rN4I/5wDvm2vMFqwgIG2bG1k8vLfIkkRudCH3NKHaUSAMO4AGkce/2T+gauZlY1FFdtJ3yignheu9XXEE8SmQSfn2rHG9p0QW4EwNxrHqM1UIdRnAdYRjPx4xcZJBXbk35W0GwCSHsxXmxrYGLu34gTX3KJAGDwoZGbTV1AIn/4e22OQrA22uJC+8LfQO8L9UYPU9E+tu0ai8Ed8qIGZ327bkkpywtM/pA/9xJociGGlO/m8P9ucVRuIe757+aKK3bRYjtnIdpOzAlrMww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rpSJzQd7xyZ/Nv3E8TbdFAw8Zb46eN12DjS6OZHQgr8=;
 b=dAcffa6isMLB5Vk32SQ+V6osJp9nzNE/TrWgzohOSIqjqiKZr/USvzD9sXNoRVa17XVOmbv8XC8uCvB927MzxKvkrz1lsA+olw9oIRolMJrd5EJLsoerj8ftAy69Z8x5V5TYQ2qsykQ3HUpnB3hB60VlKZLp5VXsb3l1A2RjnGyy3w+l8AUfjXJk5hktWzkdLXxrE2Pj9Cv0q1rmUShxOH+d/pRCoNLytPF8mN49kYUtzJAkIJuKddNSe8f0QxDcM7tRvtAPQ9Q5wQrM6VpZdlGroTD8w5vmEY20bJ58ci8J03sx0mEK598i70iSsDc8wSehbQtzegQU7Dc930YJ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rpSJzQd7xyZ/Nv3E8TbdFAw8Zb46eN12DjS6OZHQgr8=;
 b=m4ai1qeKMYf1xw/blJWW+JoZ/Vtxj+XH9f9ZjyOgjOouz/ltPMeSHMvAUflvYO9pZm3Trc/hGc+LnNdf2E5SIhYZrIQ97bWgfMUsTpe5UZVzbAf9kRWToB7u/iFRi4xy3fxC0kPYkVWA+/3yYjrivlzZHy5TghDrIXhk53eow1s=
Received: from BN9PR03CA0374.namprd03.prod.outlook.com (2603:10b6:408:f7::19)
 by DM5PR12MB2343.namprd12.prod.outlook.com (2603:10b6:4:b3::38) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Thu, 3 Feb
 2022 09:09:34 +0000
Received: from BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::37) by BN9PR03CA0374.outlook.office365.com
 (2603:10b6:408:f7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17 via Frontend
 Transport; Thu, 3 Feb 2022 09:09:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT037.mail.protection.outlook.com (10.13.177.182) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Thu, 3 Feb 2022 09:09:34 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 03:09:32 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>
Subject: [Patch v5 01/24] x86/configs: CRIU update debug rock defconfig
Date: Thu, 3 Feb 2022 04:08:55 -0500
Message-ID: <20220203090918.11520-2-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
References: <20220203090918.11520-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 00c2a851-82d9-4c01-de19-08d9e6f4e57c
X-MS-TrafficTypeDiagnostic: DM5PR12MB2343:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB23434098C21AE8FB55E7BB57FE289@DM5PR12MB2343.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Rt8kM/Mniqs8v94/M5+qVLuCKTnlN+AwxYH35q9KxWOu0OhHPrP8IJy+LDFAilK7HeNuoBx+1YdIh1PlKx7bL7ofGdzlsWDQtqpglggjUuCz6zazxSbG/po5CnjXA3e8RG0jmQGdQm7xjHKZnDmdhjyrXN3Fh4/JFjgOHZnLzLHbjo4rOk2PTzeskMGFrks4UHhMSdULhO2ZSSoteT9KBX7gs9fkyvVnWq23Rn5X0nGEiaopl6ApN3RvhBhDRZ95HfqwgI0K4zJO9exZTYX0eONaZLQODGRmtjL9alxCxirK/l1axi7NpuH/LpKpBPxzslAl8hSGDyTrOSCzOBdkbi2RKLOwm2Cq1i8jTl9iFtS6AurkRRjInnb6DsFziY9lDHHO9ut7gMiQG2BS+DkZVWHJdsGuMQbJF4i1QD0pHRpwAjAh1amWwg82gf9On5qfblo5N7e8mIvGOcvOmZM7pdVh7hyVOeXxDuulAayAKEukDIrtmYCcV7JSNssCRk36lcv+khXOXyRaTE/dplsSovnRzJsjNk3Z3X5Nm33sfA855TTsZpFmjjqiOovEx4IElVdeWDmf7LXWD9r6OaxJx+kXC7u8NwqLf2k35461MkkV9om5PFTJSppZQ9jaWnW7Y4buUDGvnU64Aitw2aF1U6rEPDxJg48KA4yQ5HxaroBbgKE6rPggaYc649iiAcTHF6W8ZNgtVJEuTjRlYXU0Dg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(6666004)(508600001)(36860700001)(8676002)(8936002)(316002)(4326008)(7696005)(36756003)(54906003)(47076005)(40460700003)(66574015)(450100002)(70586007)(70206006)(6916009)(83380400001)(82310400004)(2906002)(15650500001)(44832011)(86362001)(2616005)(26005)(186003)(1076003)(16526019)(336012)(426003)(5660300002)(81166007)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2022 09:09:34.5585 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00c2a851-82d9-4c01-de19-08d9e6f4e57c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2343
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
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com, david.yatsin@amd.com,
 Rajneesh
 Bhardwaj <rajneesh.bhardwaj@amd.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 - Update debug config for Checkpoint-Restore (CR) support
 - Also include necessary options for CR with docker containers.

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
---
 arch/x86/configs/rock-dbg_defconfig | 53 ++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 19 deletions(-)

diff --git a/arch/x86/configs/rock-dbg_defconfig b/arch/x86/configs/rock-dbg_defconfig
index 4877da183599..bc2a34666c1d 100644
--- a/arch/x86/configs/rock-dbg_defconfig
+++ b/arch/x86/configs/rock-dbg_defconfig
@@ -249,6 +249,7 @@ CONFIG_KALLSYMS_ALL=y
 CONFIG_KALLSYMS_ABSOLUTE_PERCPU=y
 CONFIG_KALLSYMS_BASE_RELATIVE=y
 # CONFIG_USERFAULTFD is not set
+CONFIG_USERFAULTFD=y
 CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=y
 CONFIG_KCMP=y
 CONFIG_RSEQ=y
@@ -1015,6 +1016,11 @@ CONFIG_PACKET_DIAG=y
 CONFIG_UNIX=y
 CONFIG_UNIX_SCM=y
 CONFIG_UNIX_DIAG=y
+CONFIG_SMC_DIAG=y
+CONFIG_XDP_SOCKETS_DIAG=y
+CONFIG_INET_MPTCP_DIAG=y
+CONFIG_TIPC_DIAG=y
+CONFIG_VSOCKETS_DIAG=y
 # CONFIG_TLS is not set
 CONFIG_XFRM=y
 CONFIG_XFRM_ALGO=y
@@ -1052,15 +1058,17 @@ CONFIG_SYN_COOKIES=y
 # CONFIG_NET_IPVTI is not set
 # CONFIG_NET_FOU is not set
 # CONFIG_NET_FOU_IP_TUNNELS is not set
-# CONFIG_INET_AH is not set
-# CONFIG_INET_ESP is not set
-# CONFIG_INET_IPCOMP is not set
-CONFIG_INET_TUNNEL=y
-CONFIG_INET_DIAG=y
-CONFIG_INET_TCP_DIAG=y
-# CONFIG_INET_UDP_DIAG is not set
-# CONFIG_INET_RAW_DIAG is not set
-# CONFIG_INET_DIAG_DESTROY is not set
+CONFIG_INET_AH=m
+CONFIG_INET_ESP=m
+CONFIG_INET_IPCOMP=m
+CONFIG_INET_ESP_OFFLOAD=m
+CONFIG_INET_TUNNEL=m
+CONFIG_INET_XFRM_TUNNEL=m
+CONFIG_INET_DIAG=m
+CONFIG_INET_TCP_DIAG=m
+CONFIG_INET_UDP_DIAG=m
+CONFIG_INET_RAW_DIAG=m
+CONFIG_INET_DIAG_DESTROY=y
 CONFIG_TCP_CONG_ADVANCED=y
 # CONFIG_TCP_CONG_BIC is not set
 CONFIG_TCP_CONG_CUBIC=y
@@ -1085,12 +1093,14 @@ CONFIG_TCP_MD5SIG=y
 CONFIG_IPV6=y
 # CONFIG_IPV6_ROUTER_PREF is not set
 # CONFIG_IPV6_OPTIMISTIC_DAD is not set
-CONFIG_INET6_AH=y
-CONFIG_INET6_ESP=y
-# CONFIG_INET6_ESP_OFFLOAD is not set
-# CONFIG_INET6_ESPINTCP is not set
-# CONFIG_INET6_IPCOMP is not set
-# CONFIG_IPV6_MIP6 is not set
+CONFIG_INET6_AH=m
+CONFIG_INET6_ESP=m
+CONFIG_INET6_ESP_OFFLOAD=m
+CONFIG_INET6_IPCOMP=m
+CONFIG_IPV6_MIP6=m
+CONFIG_INET6_XFRM_TUNNEL=m
+CONFIG_INET_DCCP_DIAG=m
+CONFIG_INET_SCTP_DIAG=m
 # CONFIG_IPV6_ILA is not set
 # CONFIG_IPV6_VTI is not set
 CONFIG_IPV6_SIT=y
@@ -1146,8 +1156,13 @@ CONFIG_NF_CT_PROTO_UDPLITE=y
 # CONFIG_NF_CONNTRACK_SANE is not set
 # CONFIG_NF_CONNTRACK_SIP is not set
 # CONFIG_NF_CONNTRACK_TFTP is not set
-# CONFIG_NF_CT_NETLINK is not set
-# CONFIG_NF_CT_NETLINK_TIMEOUT is not set
+CONFIG_COMPAT_NETLINK_MESSAGES=y
+CONFIG_NF_CT_NETLINK=m
+CONFIG_NF_CT_NETLINK_TIMEOUT=m
+CONFIG_NF_CT_NETLINK_HELPER=m
+CONFIG_NETFILTER_NETLINK_GLUE_CT=y
+CONFIG_SCSI_NETLINK=y
+CONFIG_QUOTA_NETLINK_INTERFACE=y
 CONFIG_NF_NAT=m
 CONFIG_NF_NAT_REDIRECT=y
 CONFIG_NF_NAT_MASQUERADE=y
@@ -1992,7 +2007,7 @@ CONFIG_NETCONSOLE_DYNAMIC=y
 CONFIG_NETPOLL=y
 CONFIG_NET_POLL_CONTROLLER=y
 # CONFIG_RIONET is not set
-# CONFIG_TUN is not set
+CONFIG_TUN=y
 # CONFIG_TUN_VNET_CROSS_LE is not set
 CONFIG_VETH=y
 # CONFIG_NLMON is not set
@@ -3990,7 +4005,7 @@ CONFIG_MANDATORY_FILE_LOCKING=y
 CONFIG_FSNOTIFY=y
 CONFIG_DNOTIFY=y
 CONFIG_INOTIFY_USER=y
-# CONFIG_FANOTIFY is not set
+CONFIG_FANOTIFY=y
 CONFIG_QUOTA=y
 CONFIG_QUOTA_NETLINK_INTERFACE=y
 # CONFIG_PRINT_QUOTA_WARNING is not set
-- 
2.17.1

