Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7A47DC17
	for <lists+dri-devel@lfdr.de>; Thu, 23 Dec 2021 01:37:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21E6510E152;
	Thu, 23 Dec 2021 00:37:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4703710E140;
 Thu, 23 Dec 2021 00:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQKf0FsvB1BDiA4kiEgID7gq9XOc6OEybT2sFhfWyykQqspZ52yQew6BR9hcfDpQiZO4dAEyPx0Xx4ApVsJmeTNfWD3GUkzSImmBwe1qf48dCeQsJ5KGGlqqazRTMI5cBchFmPauqYsbZwm1Kzy/JjuAwcBWmWQc/ZJncRYA5uGeq9haUr9wEhv0ihqHBpQpSIWw7wfdJFX5JaWW42I74JVXrHnI/f+j+f0XBLRx2bH55FsIEkwPZAN+TAub1Jwae5v9QfP0ijOkwqFdHjl8yOXTXdiLohO9dzODtHNmRmxr0NTE27KuDaRDbcjc+oLWKKlMSkeZX1cnfefm4658fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRyWcjQV0GNN9J97hIVhv//FfuSlPL9el/9Y1g5WABU=;
 b=dnPS4Q7KloFVPZsavXtDeTrbzZcC+ITtL+WxvTwk/xU2FVMyBgoeH+VYLMauzzofFXr61Z0AUaUwK+xGAUE3OeSkP0TkQnx52c6lxKfGQQF0l6g1MSNjDlHEI0TkpCL4Bnc2lOglerYlJTjSMzZ/OPGX0VXLiKLYgUkOrZkmU120H5dZjGjRPRbU0eClP9y2ARSRPSwWd54AM4BLI1S9Me5tuKhPEc7ms7bJOjZAhoC0uSQOk/KCYWymJVrTGdKJBx4fFO7eRp6ARZnouwntswCdmt4i4GOhIRTYLLXOm1geSvqbTWJulsYa1mbukQKLfTGl4bUn8sweIk/SnNRWZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lRyWcjQV0GNN9J97hIVhv//FfuSlPL9el/9Y1g5WABU=;
 b=SOI0c/PyZezL0Oyt1fvZ4Vh8t/btUXQQq6NbGK+XYrGqxDavG3APLZ7x/TTMj5domNsfIgPvT49dObvoEC9JapGlUF29QBjyyn2FtpFDAnERrc9TSBSVh0EOqbu3fP4LQpMux+OdyZ8s+59iSAWJkMI+JhDrseQcNmCNhNsOuNc=
Received: from BN9PR03CA0338.namprd03.prod.outlook.com (2603:10b6:408:f6::13)
 by MN2PR12MB4453.namprd12.prod.outlook.com (2603:10b6:208:260::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Thu, 23 Dec
 2021 00:37:25 +0000
Received: from BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f6:cafe::ef) by BN9PR03CA0338.outlook.office365.com
 (2603:10b6:408:f6::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Thu, 23 Dec 2021 00:37:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT044.mail.protection.outlook.com (10.13.177.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4823.18 via Frontend Transport; Thu, 23 Dec 2021 00:37:25 +0000
Received: from rajneesh-desk.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Wed, 22 Dec
 2021 18:37:24 -0600
From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [Patch v4 01/24] x86/configs: CRIU update debug rock defconfig
Date: Wed, 22 Dec 2021 19:36:48 -0500
Message-ID: <20211223003711.13064-2-rajneesh.bhardwaj@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
References: <20211223003711.13064-1-rajneesh.bhardwaj@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a94de468-1efc-4ef2-51df-08d9c5ac6407
X-MS-TrafficTypeDiagnostic: MN2PR12MB4453:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB44539DF467326EC2FA72A203FE7E9@MN2PR12MB4453.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQc4mA6CZpjqxadcUqGDb/rFDrHsQ44wQuJ+QNmbZ2gxe6wBPK38P665+0+uY+CexORIiuhJWCjztCWqq9gY4svpGQC1q/erZZ5m1M0uctf+QiDSlYhCH+5MvIC9NYaL78Wpol8PE/HeGkGXt7dv6dVz7S/palgeo39PGoCfpKhvUjoChI4JHLvYDwmswIkD2008spq56p9h5YtajgwrgORFylgsKrAHBIsA5ehRC4dGSGjn1cExCLpRxYCDhl4xytVz7HU6OJHUcYeZbpVI8N7RnC4kfWB9CGiwlC9QxY2OWCx53LLNrSBpxbmtw1v2r8OV3J9eIIqV7kS19oxzeSR30F2xruGLG4tMQihZ6zaGG3ao2yKZc+/Ttq92Ueu06mk7G6IpCe8NSsGhw29CcsnkT4CBwEX+dgi/rynViGhySkrzGQ9tJEDzUBpzW7VomGAS/fTs63U68EbHBffFp7x+5Xt/4OJ0hOHFWa273iUZIAiSHR5/ycB5kxOy0k0XJvNEdeVDm62t2tM5jD679YKqHHRhRD1CIUSA4+Sv6w9YASFdELHk+eo1d3NL6Ntszri2g775XYG8hQMCsTVMips0t26ZobffCb6UK521QouL3GO4Rujhqt4nvgDGnK/wHEwMsep2Pc2327P+2YXVVppmugHrEN/U4KhIK42bh/0GmiPWaezXBeq6HdAkoI9oFscnBWT6Fx/gOAF8hTblCzC8aKd5rH+MhmuzrYp4+vFahnSHh6a/eaFaWYuI6PYS2KD/qYKwJdotYYmq18xYnU5ekyO0SNlFsx9WNHQa7Dw=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(40470700002)(46966006)(356005)(70206006)(8676002)(83380400001)(186003)(16526019)(26005)(1076003)(66574015)(6666004)(81166007)(70586007)(2616005)(54906003)(426003)(336012)(44832011)(40460700001)(36756003)(86362001)(15650500001)(316002)(2906002)(508600001)(47076005)(5660300002)(4326008)(110136005)(8936002)(36860700001)(82310400004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2021 00:37:25.2571 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a94de468-1efc-4ef2-51df-08d9c5ac6407
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT044.eop-nam11.prod.protection.outlook.com
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
Cc: daniel.vetter@ffwll.ch, felix.kuehling@amd.com,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>, alexander.deucher@amd.com,
 airlied@redhat.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

 - Update debug config for Checkpoint-Restore (CR) support
 - Also include necessary options for CR with docker containers.

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

