Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCEAE42668B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Oct 2021 11:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421A86F418;
	Fri,  8 Oct 2021 09:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 581EA6E873;
 Fri,  8 Oct 2021 09:17:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cHS0ceIwuK30z/NkHPDXxDIy4U1Jazjh1Cjv/fJRg1OroG7ttydZ4NNsaqrimCG9iAWTVrAnOcQWLpNqro+bcmlsPe9leVKotnB/AiEgSOS1PrfFS/e3KjSIWKSohgDtK16ebm21APStSlvlkwzsir3heZOaCeY7SwjT6LifVPNBCkI0PisAWXg7P24K1j7CZ7GiZew86UmCymnr3q9ZelCD/eWFROim+8FYtSUvn3ZpytCOCYCsGXGIC12ASAUpaZZ+1+K2b/uQ8LhQPyvusY129qInc4c0QXwtjd/prGouZalizl/AS3XVabl8lS19a8FivfOtQnJKrTpe8Y9XpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EfG/NPxi6Wh05rcXeWGXm+cz6aZCVpJa59jM7gRhPx8=;
 b=jNsJjMNxs2WZ9R67fU2cjkR50mJdedaOHUwBleczx8x5PdJ8rFtjt2adPnFyrwhMBn8S9yi0qITyKILy3pKt55cygKY7UZNUh2x36SUPDyvaRPex3MY+PJuwGTEckEJV+tz0fHwY5V4j+bqr2rkfK2wg0Wy4lwzGZG9x9VoX5bHZsLByy6OnnTm1HuERm0f3y/E3vltzO3yywIHYsbIAfLZhP24TMd3cf8CsjRh3AAeIL/h/a61pTB1WlHHpN2rc4/fLFfwoQjuKgzNcJx1noGu0+0qUeRrtVKAPB6/XYMPJ/VtcpzctAeJh3HFoEuSsK6euIHj6SseO4Fl10CS0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EfG/NPxi6Wh05rcXeWGXm+cz6aZCVpJa59jM7gRhPx8=;
 b=zoEVrkSfRRfY5yQNRqE0RqRKlxFkE44dYy++YsJvgroiTYNjEI7b7ZYy47uLwLmB6bC9Wf09Ki0MwtIWiLBQJaAH88zd+h7sP7GUXtbvU8KGVOGQb+egBwu91fIHIS4L1344kMaKR9C1ldkv+I0N5cumr6z7EWy46DFl0RiuQrY=
Received: from DM5PR17CA0061.namprd17.prod.outlook.com (2603:10b6:3:13f::23)
 by DM8PR12MB5461.namprd12.prod.outlook.com (2603:10b6:8:3a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 09:17:26 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:13f:cafe::62) by DM5PR17CA0061.outlook.office365.com
 (2603:10b6:3:13f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.20 via Frontend
 Transport; Fri, 8 Oct 2021 09:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4587.18 via Frontend Transport; Fri, 8 Oct 2021 09:17:25 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Fri, 8 Oct 2021
 04:17:22 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Russell King <linux@armlinux.org.uk>, David Airlie <airlied@linux.ie>, Daniel
 Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/5] drm/armada: check dri/crtc root before debugfs init
Date: Fri, 8 Oct 2021 11:17:03 +0200
Message-ID: <20211008091704.27094-4-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008091704.27094-1-nirmoy.das@amd.com>
References: <20211008091704.27094-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04d4aad9-fca0-44e3-5588-08d98a3c71ab
X-MS-TrafficTypeDiagnostic: DM8PR12MB5461:
X-Microsoft-Antispam-PRVS: <DM8PR12MB5461400A2F381975C4829D7B8BB29@DM8PR12MB5461.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yowf4qtJSr7PWIoHopRllXwVyLWFO2QWqhYlW6lURPCTBVcPkHWALLnR73eVPxJ8CCZL0Q4yXh5jSMHQZzk+57usCIvawL+GxkSActSodX7OyPkq33yEE6sz8eXYhDDosao9MPOw7y2uidT0aWwGpuUDxCFMtRSlxnACD6tBfBjCtnC2uFBLTxlO4q9EmdByUrDMqa3YMxsjPw4PeVy14zRBsE3x1y4XgPA8RwfnDcJse43y//jGa6hG9JnrFcic71l/wQk6Drxezj4aE+rdJDA7BABd842NjfWesKnFLHQ+///7FH68u9POyyTKbXxGUmpjZcEC6nbi0n2EDRu/wE/L+ViIVBHoKp99sH3IQ6Vdyyt3rxGyjNU+i9RUXYs8UTGTN7lnmlN6FG608I5f9LCh4ZO7SIR69s+3NJ4yYLD+uptON+hKFyo/fBP96YEjiOGS4/vJ2V8Hojnokb8/ejGOVjLeGYU3Z0OdujDWrHH7KNE/HNdbRbwsQsaKevUSePAO010DRcUzusnXU0zdeRXib8vnu59Gq07qBMTNg4ql3aNpEnvzlaISMQEBrUQhptQi1KKTMXAEi62Ec8U7XvDq0LXaakqdIlV0ONUYCgg4mxUVywP8AGA0YlwsUhb2ZI1M1NxqaN4L5cvmpjdnP0/o30VDUTdFktswpyxUL/JwUjwa6Rts60r5QvkS0vHLoBKgyIPW9LoX2YUJXrs538W/Seauw9uXWvysvxO+c2s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(26005)(8676002)(186003)(2906002)(36756003)(36860700001)(54906003)(70586007)(82310400003)(6666004)(508600001)(7696005)(1076003)(16526019)(8936002)(81166007)(356005)(2616005)(44832011)(6916009)(426003)(4326008)(5660300002)(47076005)(86362001)(336012)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:17:25.8411 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04d4aad9-fca0-44e3-5588-08d98a3c71ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5461
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

Return early if dri minor root dentry is NULL.

CC: Russell King <linux@armlinux.org.uk>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/armada/armada_debugfs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 29f4b52e3c8d..b40003fe4a89 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -93,6 +93,9 @@ static const struct file_operations armada_debugfs_crtc_reg_fops = {

 void armada_drm_crtc_debugfs_init(struct armada_crtc *dcrtc)
 {
+	if (!dcrtc->crtc.debugfs_entry)
+		return;
+
 	debugfs_create_file("armada-regs", 0600, dcrtc->crtc.debugfs_entry,
 			    dcrtc, &armada_debugfs_crtc_reg_fops);
 }
@@ -104,6 +107,9 @@ static struct drm_info_list armada_debugfs_list[] = {

 int armada_drm_debugfs_init(struct drm_minor *minor)
 {
+	if (!minor->debugfs_root)
+		return;
+
 	drm_debugfs_create_files(armada_debugfs_list, ARMADA_DEBUGFS_ENTRIES,
 				 minor->debugfs_root, minor);

--
2.32.0

