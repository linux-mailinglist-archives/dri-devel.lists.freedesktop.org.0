Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5064A49BEAF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 23:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEBA410E5E6;
	Tue, 25 Jan 2022 22:38:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E6110E5CA;
 Tue, 25 Jan 2022 22:38:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ACvAm64y16oL00Vv6KCKF23qPdnfUt8vGEaUjFvyepvbCDmwwoqCmvh+UONviL87zhFQcLkosikfW2Nib+RrbTVV9P7v9kIwrmmq7vlHeWCeAvVc4Si9ntwsenttdoP90MCxuOQ5z5xGkU18FUiaBOvurWRjZ/Oo6bzTNGn9lA9mFlgou3+PX9ccUAjUsCm0U0YIEm+vtXpHDrsFmD4hDaef8APvXhXj58SHPHxWbpSvbrgfJR6bytZ4+3TcjJFysfCqQd09+zYb8pAUQbd7CcoVkyBvZCD2nP+aZ8ehSwfKChn82gAl4SqoVa8A1iZ7CECLOyhiZ3JwZdQKiO3GPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B10OtCgYZBnhrca4d6Blqujycw2uSdGQDIW4zCZL8nU=;
 b=SvQYSRA1u872tptWypM7ls5BotOoeYr1wBpyypQKSNwv06gRWcPP2O6Y9BuCGLIbcc7L1XWKHPRPxgQHUVsvUXqUUFkpf9lY9KhqkE2/+4kZvDbyy5U06z5/FjZVpwFat8FHt3FJLNrX7tU8mkMLRZhNMZ/4I4gAbmH741t152puP03eDJG9/lcdqwbQu/a65C2lyoK6TMDIlv+7Dv1nCmHXHn55l92EohHhU+YaYhDzmte0IEtqaqFvBykWp0SHmMnNb7UsXGPd+LLP+xH+ewFV9KDJx3zy7gQIvFA6wVDNiPcOoD4ByHH1Ynrc/TPhFaiBJAC1gRqENKIt+TnIpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B10OtCgYZBnhrca4d6Blqujycw2uSdGQDIW4zCZL8nU=;
 b=XoHybXFcBTu3VSDznYL019aS8wqm9o5qy5dixQrKlHG41eNJu+o+3H+nY2ePneLTJDiCYz/5ejOQsav6D9PKZMGq0b5+mudsXMWUerndw7vEofPjcypCkvuyAE8E9bBi9seR6jsZ7GtxaayqqN6r4VmxbJmwhS1XxsxgmrbKV5g=
Received: from DS7PR03CA0280.namprd03.prod.outlook.com (2603:10b6:5:3ad::15)
 by MW2PR12MB2442.namprd12.prod.outlook.com (2603:10b6:907:4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.13; Tue, 25 Jan
 2022 22:38:35 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::5e) by DS7PR03CA0280.outlook.office365.com
 (2603:10b6:5:3ad::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Tue, 25 Jan 2022 22:38:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.7 via Frontend Transport; Tue, 25 Jan 2022 22:38:35 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.18; Tue, 25 Jan 2022 16:38:33 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC v3 12/12] Revert 'drm/amdgpu: annotate a false positive
 recursive locking'
Date: Tue, 25 Jan 2022 17:37:52 -0500
Message-ID: <20220125223752.200211-13-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
References: <20220125223752.200211-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a2c23b58-bff0-4fc6-18ca-08d9e0536c6e
X-MS-TrafficTypeDiagnostic: MW2PR12MB2442:EE_
X-Microsoft-Antispam-PRVS: <MW2PR12MB244288E60D571A1CACFBAB4FEA5F9@MW2PR12MB2442.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wNEzohstmA+3IuHfRpk794Cb/Ss9SAyapOPQAlCIGmda+68Xfr1zy0wQvcan5Mq3VtR/eITEDLPISQP+30nZjHn7vpQgeX5bGi+oK6JERz2/Go0PrDY/dtEJXDhTtQ9COO+15jdEl8+4moWGciO7JBMUxgtgV2kG7If8RC/nxxYnhMSLyOTo4mD/+ciIO2znOjfgKSCpy2Z7sGwDhOzOIt/hlA8QWUY4vo2lDbpHnCyR9XbR2Qi/ndXTMOJerj3dXwYoj0Dol0CqzRpLXdTjaglQTQkVUkxOo2iimr9T3HU8GyTj5tqBECAhaNyzgBQhDeRZVx+zZXJEQF5SuD63gGjm7Hc74s/4p8Ia+lUer6fXlIb+rBmLQOakaT9gBUd7tQjQbzAbsny8D3YtPnadD/cz3iUabToG6Xx9d/n8s6R3iMTLVCwjdxq98Jk7e6us5jIkjYrDT+IRG9qMR5i/meYw4jbWBK6Eqzf/1H7YWiOvL/Hw7zQzccvUC3P7ITRo6ZMph8Z6837uEzqZueVtrRzYTx5l7pbNFwR0vvWxX9FQDzZHBKrUk1Szfvs0lDUkYgZU+vuXO2yzHkqC4C/yFa1w8sLD8/Lu0VvoVzVRecaWhkQRnzhNH8Th2KnUOS3yd6u045T4H/jRM+LSl3is8niMCpUNmUHZgGyeNbwlJG0RCBPJy44E7u9GaVBtvd/9vmrqX7qYwNf/oEaKP/mGOetxlrSN670urQ/Ic7nDxcW6YHw9ysZ0OPbXN7XZi1iFzi/3cRiP8ymg6DrejLWJL4mp8/bM14VHLwMYMxKWpCk=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700004)(86362001)(316002)(7696005)(83380400001)(2906002)(40460700003)(16526019)(26005)(186003)(110136005)(5660300002)(54906003)(426003)(81166007)(8936002)(8676002)(47076005)(36860700001)(336012)(1076003)(508600001)(70586007)(2616005)(4326008)(36756003)(356005)(82310400004)(44832011)(6666004)(70206006)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 22:38:35.4604 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a2c23b58-bff0-4fc6-18ca-08d9e0536c6e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2442
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
Cc: horace.chen@amd.com, lijo.lazar@amd.com, jingwech@amd.com,
 christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we have a single instance of reset semaphore which we
lock only once even for XGMI hive we don't need the nested
locking hint anymore.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 31310922b6bf..b97992d62db5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -4771,16 +4771,10 @@ int amdgpu_do_asic_reset(struct list_head *device_list_handle,
 	return r;
 }
 
-static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain,
-					    struct amdgpu_hive_info *hive)
+static void amdgpu_device_lock_reset_domain(struct amdgpu_reset_domain *reset_domain)
 {
 	atomic_set(&reset_domain->in_gpu_reset, 1);
-
-	if (hive) {
-		down_write_nest_lock(&reset_domain->sem, &hive->hive_lock);
-	} else {
-		down_write(&reset_domain->sem);
-	}
+	down_write(&reset_domain->sem);
 }
 
 static void amdgpu_device_set_mp1_state(struct amdgpu_device *adev)
@@ -5017,7 +5011,7 @@ int amdgpu_device_gpu_recover_imp(struct amdgpu_device *adev,
 	/* We need to lock reset domain only once both for XGMI and single device */
 	tmp_adev = list_first_entry(device_list_handle, struct amdgpu_device,
 				    reset_list);
-	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain, hive);
+	amdgpu_device_lock_reset_domain(tmp_adev->reset_domain);
 
 	/* block all schedulers and reset given job's ring */
 	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
@@ -5441,7 +5435,7 @@ pci_ers_result_t amdgpu_pci_error_detected(struct pci_dev *pdev, pci_channel_sta
 		 * Locking adev->reset_domain->sem will prevent any external access
 		 * to GPU during PCI error recovery
 		 */
-		amdgpu_device_lock_reset_domain(adev->reset_domain, NULL);
+		amdgpu_device_lock_reset_domain(adev->reset_domain);
 		amdgpu_device_set_mp1_state(adev);
 
 		/*
-- 
2.25.1

