Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995A533169
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 898FA10F2C7;
	Tue, 24 May 2022 19:07:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD70310F197;
 Tue, 24 May 2022 19:07:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXUXkYQgnQrzoHmMALp/x8wde62uFkIJ/4+WD6dgvXMvB8rrZLGunWIR9cKuGnS8V3lZTpA0g+/2ACAPI5N33MeIXSyj3S0XFqFp10Zfyk0wWW07SRbxsJWCXvo+xyv+iVMncA6T//i47uByeOj9fPUcSO/OWaiJ89AxY9WR1x+ZdUuRN+dIyri/pJsVi3ZRTxgysKp98aou1GRC6WBsb26k4R4iqOMwTNpSWK12ytiuajkpYAolgx5oZkP/Peudxn7IkF3mILLWwH84tRUmWxg6u5qDE+UNZ7lP3GtFJZwVpuSvnCZI2Xz39NGkCChukbMDNSXhehr/u/oLuXqQtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=KWdjNGfPL+1B2d9F7kU6A9ejzyPlXntDodT1C5OIl+hDX/hSj1GNqOZrzWx+Y5ZiXgjwDMbD6S5DczNSFwpVq+MUCgIKrFYlqjfXv6OZQkhWm0OJSgHVvST3z0L5JypKm0+tI4dP5sW5OtspFSbIYYrUCInNmiUOY62Deo9QM2xTbSvSBgJ2ZoPQYoVwUA0ReKrIODqymLbWyTA8hUN5LktXJYW4XZUwUcXIQDgGxoCGpLMpA6aCcIG9SHb+6B+cG2v0M23F8/DsG0wffNyJQW8emS6uKmDh4vVstyayAcR6hUKbYLpWTs1Ax8IdY7cypCAdknBIuIJl2PbC5BpDyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nvidia.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ds2C6hKBCPm3LMFGvWFrTQmYNyEijOJ3/DIUhvifx8M=;
 b=AGNc/Q2K1Hbe6s+fFNlfXRXN/Cqg90O/GZz1u4KAPoJ2EmYMtbdVjLpGT/QoQFndKusd9zA63ZwGL2J+ak7/aE8IgYfMGBrpu4RLHphjQQ+g/F5tFaSCvkBAimQqNVCxzJc2ymU8T6JfFYLTjogVe0OjT3jTpd6Us7YnJ8gnW0Y=
Received: from DM5PR19CA0035.namprd19.prod.outlook.com (2603:10b6:3:9a::21) by
 DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5273.14; Tue, 24 May 2022 19:07:28 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:9a:cafe::97) by DM5PR19CA0035.outlook.office365.com
 (2603:10b6:3:9a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23 via Frontend
 Transport; Tue, 24 May 2022 19:07:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5293.13 via Frontend Transport; Tue, 24 May 2022 19:07:28 +0000
Received: from alex-MS-7B09.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 24 May
 2022 14:07:25 -0500
From: Alex Sierra <alex.sierra@amd.com>
To: <jgg@nvidia.com>
Subject: [PATCH v3 11/13] tools: update test_hmm script to support SP config
Date: Tue, 24 May 2022 14:06:30 -0500
Message-ID: <20220524190632.3304-12-alex.sierra@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220524190632.3304-1-alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c761fa70-9132-4c7d-5f60-08da3db8a546
X-MS-TrafficTypeDiagnostic: DM6PR12MB4338:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB4338B2456C1F61A85D3EAFD3FDD79@DM6PR12MB4338.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JxgJ1r7W70lmTXsxM86VPYqOe504bot8uNBBl7W/Ya5Bm6C/+mUgLXZsrzB2xShKcMYKXiQlsL5LPnwC1+hdpp4+vnGWXj0emog0/T+j1hiJ2Kd7aQhetya7jZlpr+odbxp2eBBfADUJWKZZ5qpVeMQpVYbwtCkrN5nycZ4P9LwdZnUEFNxZINgsJtG0hNR7vc1B3JD47oCB7F0XHVhO3N3lp1gZNRk2SAVImHD3IW5jHBwhgLwVAm4DGvGGiZCEvPSrlwgGlKGa/FiArFjdJx4KMJUJvr0KGSfkNjPgRShpNfCJbpQ556IwpX8/++/7/3tAWIfDbWiDbumQDHhioTbQ4UAmSioR1hwWHb9mlx8sJ0HNizRjLL6hGRNelbAY01keqQtIFF4p7Ri+sO+Q+6/NCfaedf1LXKDxLBrZZK+rc9PcI7TOaPyTOFU9eprX7IvjAf3LRh711aAngmywt+R4LNHkifPU1Hjbpr/kzxY1XJkWQU7vsCx32TOHoJabGwonmp0rnXdcZWaUBcuHRKRKDTqbLNTdaNrcEKFiGHtrhQDnT13ziznv6xhHTB9w6A8XoNebTvZZQ4vwMFFpOb65/p4B+alNqsUxFyRhSmvNNSyNYg3eZy4adhWEJy/GUTQaJXLE5/zY9doa1LoeEE3b7Sab1yFxLI8mFSOVg4B6nrEGa+bp1RuJLCiDaxVI29sqWxW/AqZUbUqIT++PXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(81166007)(1076003)(36756003)(54906003)(316002)(6916009)(356005)(82310400005)(7696005)(2906002)(36860700001)(44832011)(6666004)(4326008)(47076005)(508600001)(26005)(70586007)(70206006)(83380400001)(8676002)(86362001)(16526019)(186003)(8936002)(2616005)(5660300002)(426003)(336012)(7416002)(40460700003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:07:28.1382 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c761fa70-9132-4c7d-5f60-08da3db8a546
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 Felix.Kuehling@amd.com, apopple@nvidia.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add two more parameters to set spm_addr_dev0 & spm_addr_dev1
addresses. These two parameters configure the start SP
addresses for each device in test_hmm driver.
Consequently, this configures zone device type as coherent.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 tools/testing/selftests/vm/test_hmm.sh | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vm/test_hmm.sh b/tools/testing/selftests/vm/test_hmm.sh
index 0647b525a625..539c9371e592 100755
--- a/tools/testing/selftests/vm/test_hmm.sh
+++ b/tools/testing/selftests/vm/test_hmm.sh
@@ -40,11 +40,26 @@ check_test_requirements()
 
 load_driver()
 {
-	modprobe $DRIVER > /dev/null 2>&1
+	if [ $# -eq 0 ]; then
+		modprobe $DRIVER > /dev/null 2>&1
+	else
+		if [ $# -eq 2 ]; then
+			modprobe $DRIVER spm_addr_dev0=$1 spm_addr_dev1=$2
+				> /dev/null 2>&1
+		else
+			echo "Missing module parameters. Make sure pass"\
+			"spm_addr_dev0 and spm_addr_dev1"
+			usage
+		fi
+	fi
 	if [ $? == 0 ]; then
 		major=$(awk "\$2==\"HMM_DMIRROR\" {print \$1}" /proc/devices)
 		mknod /dev/hmm_dmirror0 c $major 0
 		mknod /dev/hmm_dmirror1 c $major 1
+		if [ $# -eq 2 ]; then
+			mknod /dev/hmm_dmirror2 c $major 2
+			mknod /dev/hmm_dmirror3 c $major 3
+		fi
 	fi
 }
 
@@ -58,7 +73,7 @@ run_smoke()
 {
 	echo "Running smoke test. Note, this test provides basic coverage."
 
-	load_driver
+	load_driver $1 $2
 	$(dirname "${BASH_SOURCE[0]}")/hmm-tests
 	unload_driver
 }
@@ -75,6 +90,9 @@ usage()
 	echo "# Smoke testing"
 	echo "./${TEST_NAME}.sh smoke"
 	echo
+	echo "# Smoke testing with SPM enabled"
+	echo "./${TEST_NAME}.sh smoke <spm_addr_dev0> <spm_addr_dev1>"
+	echo
 	exit 0
 }
 
@@ -84,7 +102,7 @@ function run_test()
 		usage
 	else
 		if [ "$1" = "smoke" ]; then
-			run_smoke
+			run_smoke $2 $3
 		else
 			usage
 		fi
-- 
2.32.0

