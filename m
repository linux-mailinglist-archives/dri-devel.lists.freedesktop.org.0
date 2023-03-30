Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA26D09DC
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA57F10EED8;
	Thu, 30 Mar 2023 15:39:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EEA810EED8;
 Thu, 30 Mar 2023 15:39:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wg+0epapO1+wJndrwlkRGoHuSeutS0qCKEfE5/K8kQ89yOxulJPCv6R14wPKyIAeEIRzCK9P+KQpcr1Dt7ZwgK3Cqla18y0gswii/hSgzvVrERYiRuMf01iy1YWian/e+vMX5n432uBzDioWuQdnSktORaa12hvvU7UN8+TvWx14OHTkeoLCF5XngiOuhGZ5sdnlm/eJoGPhlFSoszbFDQaKWoEmbFA0AR6zOycgJvk+BMnnc2DM1UDcQnUVaWQgTATir9sejOxu2fASoZhpNzICHzJnhY3evxROV7XRGfQVgOwTS3+IT15aMhGilQThtgvIwsiJy9dQTlkjWnvBcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I7SMaLV7rW/RC2eGvp1dUdTptmxkxBb7X17eBYirApQ=;
 b=KMqQmawoEO/Zb0x/dd9OI2HEZWHC/5BNWRKpPqmwjnaZ5Z9HVpPaPDTNQfHkWtYXphKo5FLHm4kxMCZhgSFdWICbhJpEYJpZyK4xwsifVQuYLzqtpZSzJk6axbEhmexEktmb0TlVTHIUYgMHvMxraF57eBwp7TI4bEGJISSRaZwD3Uu6I40QrDom8LlM7wesoKpbmOf7+1gOQT/Whn51h85ZTgTm2wzm51FcaPEmAWeNEB67M7bMNVsbeEWqcIJBoJFjs7auKY6mb8nvQpq2Vdt8LIyGnvb5/fDuJ+f/rpvYzbi5qb2mwbvto5stZoUchgwOW29pJsLoBGbCfjHsVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I7SMaLV7rW/RC2eGvp1dUdTptmxkxBb7X17eBYirApQ=;
 b=reFFq/n2MFRUyRSPY7jAUzK8dLt2LCZahUZAvL5LNa+FjGKp6L8Ru1D9oRj+4Dxcmid0FYL35ADnZ7wJOtLP/Dq+tSuyvkXr7pL0zJEXC2HeSZS+NCdql3StB2YlIr8gHxZ4MYTKqCojVkAH5ieTbgE7emewT0X8FVHTjVh7ecc=
Received: from DS7PR03CA0118.namprd03.prod.outlook.com (2603:10b6:5:3b7::33)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Thu, 30 Mar
 2023 15:39:12 +0000
Received: from DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b7:cafe::80) by DS7PR03CA0118.outlook.office365.com
 (2603:10b6:5:3b7::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20 via Frontend
 Transport; Thu, 30 Mar 2023 15:39:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT046.mail.protection.outlook.com (10.13.172.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.17 via Frontend Transport; Thu, 30 Mar 2023 15:39:12 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 30 Mar
 2023 10:39:11 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <airlied@gmail.com>, <daniel.vetter@ffwll.ch>
Subject: [pull] amdgpu drm-fixes-6.3
Date: Thu, 30 Mar 2023 11:38:59 -0400
Message-ID: <20230330153859.18332-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT046:EE_|DM6PR12MB4217:EE_
X-MS-Office365-Filtering-Correlation-Id: 9353d6ea-02b8-4fcd-3df6-08db3134e96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xRSDK27Fc9wocCCmfMA8dxltblMArqHDE57UKmbAIuFCz9K108K6QKHMZDg0A47o9FcTLxAaKxNeL4aQljigPV6WKx4gzuy5Kko8XprQBKHgjKmNP49WVE5iWiMteTRn6TwiddTnouzCcQXR+Wp1Mc7x3cK3m8M31GirGCFe66PjNBK5CRxl8h788awb/B4Mz7qea1SSHvuU6EE3saWs9eMBisb5VXAh83zYSiZUvTA1d3WpNzrQJt5A7dPzU/9sPrFkY16j577xq1Rjeh7mHYK7qgn3Knp6IpLwA1OrUQb8Gl13l/CcKM6QiZkJPuWPjAuHb05tdAuY9F4d7R75ViHPu+B780MPXoC79A81lXUP8kU6WHnnZyVJs/gO+obIwgoFa9w3VICxYzcd3r3xu6SbUdufL3fIP6pZdpnOv3OJ2dyDHcH8qgzIZeQd3j92A2SP2Lnonvam0a6rt7hvcGA1HR646xXFLt+zlK8gYLwCleJZiOCzDtOZBTopgLP0bx0lnDZT6iKgtbrjpGC2mzEOVokKd0WV+MRPbmbm6E1DlV1DoNGXnI2v91Fk7suyc7O43OYhZ4PlXx+n6T2kjAyBps85Wel1wFbI7tGG+vzvf8aoLI+AvJavNAYEPFmtPFKMNjesef3phCRu8FVzqpDjOYwaMoFAKHXsTCJUKh8mY2de1qaT6/ikK1Bx1EUv
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(36756003)(83380400001)(426003)(47076005)(2616005)(336012)(36860700001)(966005)(16526019)(478600001)(7696005)(110136005)(316002)(186003)(6666004)(1076003)(26005)(2906002)(5660300002)(82310400005)(81166007)(4326008)(40460700003)(8936002)(356005)(8676002)(70586007)(40480700001)(41300700001)(86362001)(4744005)(82740400003)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:39:12.6496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9353d6ea-02b8-4fcd-3df6-08db3134e96e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

A regression fix for 6.3.

The following changes since commit 68dc1846c3a44d5e633be145c169ce2fd5420695:

  drm/amd/display: Take FEC Overhead into Timeslot Calculation (2023-03-29 17:21:06 -0400)

are available in the Git repository at:

  https://gitlab.freedesktop.org/agd5f/linux.git tags/amd-drm-fixes-6.3-2023-03-30

for you to fetch changes up to 2fec9dc8e0acc3dfb56d1389151bcf405f087b10:

  drm/amdgpu: allow more APUs to do mode2 reset when go to S4 (2023-03-30 11:23:58 -0400)

----------------------------------------------------------------
amd-drm-fixes-6.3-2023-03-30:

amdgpu:
- Hibernation regression fix

----------------------------------------------------------------
Tim Huang (1):
      drm/amdgpu: allow more APUs to do mode2 reset when go to S4

 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)
