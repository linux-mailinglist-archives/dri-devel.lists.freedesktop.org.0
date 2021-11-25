Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531A45DDAA
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 16:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1224D6E9CC;
	Thu, 25 Nov 2021 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18B736E9C1;
 Thu, 25 Nov 2021 15:39:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+Av/UcDEVPDsO360MRAWm0ua+mw46g7y2DN03CWXCOE2i+kdk96x1itElVB4PFEPginSFLR6h6/rVGlZfqEygBXv62fdSVk13CYGvnIMHGx+uKLyXSXsAchZ2mcRWGkcImZNkP6NudrUKhp2lP9/yTT5D6IgqoXVmjrKD9JBFYmVahkrlqbBBadh7jgiwkQzQzT80aBIIpYCsRLNL0lGiEmdN5RuoCbSemBLGIora1EEejfmuEOHigd0rafogeGEzk4CXYkvmi4wUT8t1nbuEk/Bbzj+77YOFlv6RxMdjUXovYJFJSbNjrRJ4kHp5k6tLgmFNQzFFy0RcMpDtBlgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hirdCUpasD1Ja3Y761A6BiDeNyQ2OYHYPTJT4Ggah3g=;
 b=gxDUpqImWmUQ/Wsm6SMY2+FsVg569V6KWS766hL95+6+OTH7qKJCt+/Bo2pZS2pPtpzyEyCxqTPNi+iuSb3AjLftO0nTVOfR3OFM4zXnJHGj28pUWs2bquT5pkSFK5GFysSVWDJUp42hPZzb/g+XnF5yF/ZGYQh3iobtaEfuSpyIZtwC2Bya2KHNje5G7nijIE6LoUcKvX5RGYnjz3SFvrV7vZDTLa1bZuj/KlLX3qzkFKX05DCw3JeRfoiuZ2ilDj7vofnjYBevVVD/sQaBfKipHOHrU6RFPrtOWp0d2NSLOBXZq5Fk5Xnp9e0EGgMe8b2hVn6PoM0boe5GnmThSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=emersion.fr smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hirdCUpasD1Ja3Y761A6BiDeNyQ2OYHYPTJT4Ggah3g=;
 b=Ynq3NcldpF8DYd6mCHYj/AAQ0jrXldxf2FlENhvh4sCPpCmby4qp3weeux2B7z2YyI1Tz+gQDUO0r/7coM6/zqKiKASjk99fJzSIhDNo0k/YNzmJH6bMUMNtAbeDxX7FKKBeulh21Xb+iODGEtcldcUH9EXFwXwmPgSNrUOR88s=
Received: from BN6PR12CA0042.namprd12.prod.outlook.com (2603:10b6:405:70::28)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 25 Nov
 2021 15:39:38 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::50) by BN6PR12CA0042.outlook.office365.com
 (2603:10b6:405:70::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 25 Nov 2021 15:39:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.22 via Frontend Transport; Thu, 25 Nov 2021 15:39:38 +0000
Received: from atma2.hitronhub.home (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Thu, 25 Nov
 2021 09:39:36 -0600
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>, =?UTF-8?q?Michel=20D=C3=A4nzer?=
 <michel@daenzer.net>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 =?UTF-8?q?Marek=20Ol=C5=A1=C3=A1k?= <marek.olsak@amd.com>, Roman Gilg
 <subdiff@gmail.com>, Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 "Harry Wentland" <Harry.Wentland@amd.com>, Mark Yacoub
 <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>, Pekka Paalanen
 <ppaalanen@gmail.com>
Subject: [PATCH 4/6] Documentation/gpu: How to collect DTN log
Date: Thu, 25 Nov 2021 10:38:28 -0500
Message-ID: <20211125153830.1352994-5-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad29d254-8130-40dc-ebb2-08d9b029ca7d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4456:
X-Microsoft-Antispam-PRVS: <MN2PR12MB44564307BC95EA4A8508DCE498629@MN2PR12MB4456.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4RB6himl+VgJvmO/SOtRtiruL2F8I0R5W9cFEckXAkEwcBntV/2CSOvqIxFaQYYfSezujDRS7lwzPvJ+jnNOJ3DElK9QAGRGnYXYvirl89p6MEdJcOvOUaKgniNpEsgRBKbsQSZS7OiLerGxLn9vhoP+Tzos7tqL+ubXQiKMVAZYodmANeVWLFHVn4VPWkXBG58iy3BtebkxegJwt3VW79mulxVZrYW+IS+0I2HHZhLBFg15Luz/ZKJmb1QOjjXe2rDOuDLvHi8MN4YLXxXm6ODWO2PhDmz6ZkpXYvwmNc+DdKQR72JUjrjFw6zsQvl92aIoMf+fu8oVwmxQoP/WngYqbzsM7M+6wh7RxdA3pPapVgpvRRpIoZEDrp8b8urOGrB8FGK8wGU/kZboYnpBEQ9xI39AsETRDKAV45KvrCWL6iuVhFhcMmWDTFhbQ2/IISFz7oQQ7rZ1Jbf1CQfpMCHWl1/vMxpqR/nDb981qdb28ec0q8l/1ob2WoT0tiwHFIgQwu11MZQ106cDEIDeujYrmamQjaCKwQ22/8v2oDEFSkAZ/lna/E8S1EtLQlBL9E9iPrikvvJiieCUqc5RlTOIe9iMtNZ5B9BnhvDqzBrINIj5YSq/b8drpdSkg3udXuUjYEoBcCYWUZKfRRQ1aZplkvvbW1qbWo1RMIEg1SATR4RDwWJSrpHXaHL2Ji7VyVHIodfb3onwRJZApIJpPFgUmm2Tlsc/entTh0u2Y3q7a8jfTNcHsG6nY7q/7p+i
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(82310400004)(47076005)(70206006)(316002)(2616005)(36860700001)(86362001)(4326008)(16526019)(6666004)(921005)(186003)(26005)(426003)(8936002)(5660300002)(1076003)(70586007)(2906002)(36756003)(81166007)(508600001)(54906003)(83380400001)(7416002)(356005)(8676002)(336012)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2021 15:39:38.6593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad29d254-8130-40dc-ebb2-08d9b029ca7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
Cc: linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
 amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com, nicholas.choi@amd.com,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 bhawanpreet.lakha@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Introduce how to collect DTN log from debugfs.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
index 6dbd21f7f59e..40c55a618918 100644
--- a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
+++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
@@ -58,3 +58,20 @@ In this case, if you have a pipe split, you will see one small red bar at the
 bottom of the display covering the entire display width and another bar
 covering the second pipe. In other words, you will see a bit high bar in the
 second pipe.
+
+DTN Debug
+=========
+
+DC (DCN) provides an extensive log that dumps multiple details from our
+hardware configuration. Via debugfs, you can capture those status values by
+using Display Test Next (DTN) log, which can be captured via debugfs by using::
+
+  cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+Since this log is updated accordingly with DCN status, you can also follow the
+change in real-time by using something like::
+
+  sudo watch -d cat /sys/kernel/debug/dri/0/amdgpu_dm_dtn_log
+
+When reporting a bug related to DC, consider attaching this log before and
+after you reproduce the bug.
-- 
2.25.1

