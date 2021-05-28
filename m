Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4779D3943A4
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 15:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F6406EDCC;
	Fri, 28 May 2021 13:57:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC66A6EDCC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 May 2021 13:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etCwbuUyNo0imxOEyXKTG1c/94d3l7PLGb2kkOuw8gLWNvZoZ8tIl1PahoJvKKd8OBfSWt1pzuzWZM+hhlcz4yqkM2iL6x4lMCbyDHO+/JGfz6RYA7PIRfrTaZKRCqmLMS8JIeS0HBu6MnZQEakEhazVNr6PDL/qcclt0NfwZ14sXLbyYb6Lfr4VTcY0/dFFAn+mXnPqwnlj8K8YXIGddrNvzU2wjo/G9mkOuoz3UHelkRh2i2wMBht1IbzqNolCxeAK++qg8mbZ2QOUR7RtSmlwPSjg8UeEd3pMaTSwaPXh7FnMGJrrDs3r/N6SbFu9lI+IWSxFyHK6sWUK7ryX8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiTVeVgZEvVQyFEFhnpjhkz+PO9n2U5PozwhBbdWpdQ=;
 b=B436B00I7rONkjymj01rAAbM/wEo/S9QW1BaRvZu/AXHStyp4hSNtPoGL74oqfqK5N8IgbJGDGkn2crpNC77e1qZRNQw7/r7RZzt3s2MgLYqYmF9vnyaPxwaYAWhsNTtdG5FaI8idIWRP4AB3PgqUVjPafgVindn61Y4guDpTpVWEZBEhSjoazx+ogrq4P34CCfXmI8UO/sblHxg6PCdOHO31K715BDdu2ikV0SjidDVhCVhEoEleb6yZUEx+FjpnjtRxoJ9E9UtiLxIC3Ur5y+pNmnPI5llYvcUoNU9vi1kTVkhurF04VqagTatvn6V4gIMrVDLlTSdqkwxmQop6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oiTVeVgZEvVQyFEFhnpjhkz+PO9n2U5PozwhBbdWpdQ=;
 b=HEVRmULUT7pDZMr13vhMVjwcw7f9mLTFp9q4BR3AR9mcRuNmsneWw6HwANe8ke3b4Og1cMmmQ3RTKfEDqDAePlTakyR3t6uMfGEu34Y1NRr0g+y2QShsdWhh3QJ8ySmiKyjpUMP8tGxtTUEJ3sCKedVz1Ec2yrbbwRK9MXQg5Ac=
Received: from DM5PR06CA0030.namprd06.prod.outlook.com (2603:10b6:3:5d::16) by
 BYAPR12MB3271.namprd12.prod.outlook.com (2603:10b6:a03:138::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.22; Fri, 28 May
 2021 13:57:15 +0000
Received: from DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:5d:cafe::9a) by DM5PR06CA0030.outlook.office365.com
 (2603:10b6:3:5d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.20 via Frontend
 Transport; Fri, 28 May 2021 13:57:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT037.mail.protection.outlook.com (10.13.172.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4150.30 via Frontend Transport; Fri, 28 May 2021 13:57:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 May
 2021 08:57:14 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 28 May
 2021 08:57:13 -0500
Received: from wayne-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 28 May 2021 08:57:12 -0500
From: Wayne Lin <Wayne.Lin@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/2] Fix observed mst problems with StarTech hub
Date: Fri, 28 May 2021 21:55:55 +0800
Message-ID: <20210528135557.23248-1-Wayne.Lin@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa56ec38-49ca-4466-6072-08d921e07fd4
X-MS-TrafficTypeDiagnostic: BYAPR12MB3271:
X-Microsoft-Antispam-PRVS: <BYAPR12MB32712DCB647B536E0F5675E7FC229@BYAPR12MB3271.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qlQyH24vxk6agoFGphuX3XEX9V9hTVaEwotGLrxjJpMypan8sh8EIPs/6mXqaTsp3vNRGHYBM13B/pRApU2nsYxhHpZiWsRuYsaqOfnyRRVL/hHLPwjXt/wqQic2OzhA4tQ15qc6+Bvj3K8D3TLV1KunJSeSC4JZ7G4hR4YBHvoCD0ZVLhPNQN283kdUcnhS6eO8A3RxUTtZHVF7rnB+ymphHwDR9jParU0yopII2LfZqvXl0ZkaxzpRxkt8hq6KRp96rcGj0s16ZIPjrj58VQHpX1gD45JG3HsWVjVLl+w49/tEFdPnYPRWxC1HhpueN3y1EM6YSo2d4Gveoabnqn0bkxQd50OPASuL/4Hy7HT0VMIAzouJpel6t/6SUackfpH7erJPlNYp8bp4Em0p1x9HvlduSY6PP4LyIcXny4MBqEaZ+USgIZon2ombbIzytW+gqF9TGGU/d/EETTMtI5NrnlOx818g1hYJ8v5urFgoVRmJ2ekg0Wsku7VCLiRPZQ/9lq/ABbHxp7mmBB4Wj23q94+c4OC/gB47DnfpZzOT0/M4wscOuIUR+uRAxGaghkJLUoOXk+8prIJFmUr0GDTm8cIlnteLkneqZeSPhBjnbpWjoIQ2WOZY7ye3qTQRY2x5rrTAJLDcP2mD6b+slE/xrkvwshz6KLa73w0KFkdxe01C1B26lz3JJjmC36nf
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(82310400003)(81166007)(356005)(83380400001)(498600001)(86362001)(6916009)(54906003)(2906002)(36860700001)(8676002)(8936002)(1076003)(336012)(5660300002)(186003)(70206006)(70586007)(426003)(2616005)(4744005)(6666004)(4326008)(47076005)(36756003)(7696005)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2021 13:57:14.9672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa56ec38-49ca-4466-6072-08d921e07fd4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT037.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3271
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
Cc: jerry.zuo@amd.com, aurabindo.pillai@amd.com, Wayne Lin <Wayne.Lin@amd.com>,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use Startech 1to3 DP hub to do some mst hotplug tests and find some
light up issues.

1. ACT polling timeout:
   Which is due to we didn't update DPCD payload table but still try
   to send ACT and polling for "ACT Handled" bit
2. Not all monitors light up:
   Due to we wrongly set unavailable VCP ID for new streams

Wayne Lin (2):
  drm/dp_mst: Do not set proposed vcpi directly
  drm/dp_mst: Avoid to mess up payload table by ports in stale topology

 drivers/gpu/drm/drm_dp_mst_topology.c | 65 ++++++++++++++++-----------
 1 file changed, 39 insertions(+), 26 deletions(-)

-- 
2.17.1

