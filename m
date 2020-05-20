Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B021DB5A5
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:53:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B2E890F0;
	Wed, 20 May 2020 13:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2074.outbound.protection.outlook.com [40.107.237.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E544890F0;
 Wed, 20 May 2020 13:53:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nQc/uUgfYV+4e/K6WKc62MhQwDZgZeCMci3bEJJ6f/0O7NwRTN1rTqcvQ820OraJb4raEW6YXW7LJKz8AzjrgJDOsTVHa2sPQlJ8Q0i/+/CxK45YBitcClZ82bDaGkjqJM5bfUbmhY8/Wb7Oje6CxLd+SEvvfvzrIzDpv2o+qBKD3CsrRLptQg8Te7NVMVP06j5u0JEvA3T+8Os0GPXL/KOodeTpNic8CgYRw+2j0kpbi+q31RGB6tAPnfumKGsu5gshDWANJd5EHU4GMxl7zUbfbJDt0zUOmR6zKXgNMBrQw6fM4WJwO0Ef3NIzzJuOAlWWef1RWclm1OQdowrEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9rwR0eUPKuVj4fJQdvsNxw6BeDwm1RNlON+6WNOFI=;
 b=ajQJWTCUBAPB3yEJOjKwrWyIVPEpD3aA6CRWpgo7xSDUwnDcJ2hHnNinLbuRewbCSMuNVwFNvsBslkAOsg4e9UgmTTCO6BEOByCk3G1WXJ86SmFCpFxM9gYGIQDv9AE+TxZYrPbtv6951CbohusqREfmzGgJ0A8CRBnJXTIiX3Cp8q7k1R0YorS7lhx9znZzgf0a4GPjsaCTnHPFvww0+CmpyXk4SmKlooeho8gWsn1WL0YokKsfwFwFTAPXsxbxRaMwjGXJchHQyDiPibwLyt/EcfeoqeqFyrYbopsNeIjSZHncGOgkuUOXmBUQlpqLk4OjG0z2AHvUrVyB6A6kGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xz9rwR0eUPKuVj4fJQdvsNxw6BeDwm1RNlON+6WNOFI=;
 b=aL557VXwW+i6iDFCJuPF9arTyaUKl4GuxtqhaCxA/dIMpURPU8S4qwgcYQlg0MikTLYWOGM2PSyeFIKLqHIre75Cbf6+Iqmj6gbUFGrSFF5HT47QxnHNEeTISw5DuqFMmvRNpmth1yUpZrH3QwZkjjX4P4K6NgnTHYR1jUGMVng=
Received: from DM5PR22CA0003.namprd22.prod.outlook.com (2603:10b6:3:101::13)
 by DM6PR12MB2907.namprd12.prod.outlook.com (2603:10b6:5:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.27; Wed, 20 May
 2020 13:53:08 +0000
Received: from DM6NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::45) by DM5PR22CA0003.outlook.office365.com
 (2603:10b6:3:101::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23 via Frontend
 Transport; Wed, 20 May 2020 13:53:08 +0000
X-MS-Exchange-Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 DM6NAM11FT003.mail.protection.outlook.com (10.13.173.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3021.23 via Frontend Transport; Wed, 20 May 2020 13:53:07 +0000
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 20 May
 2020 08:53:07 -0500
Received: from sudo.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Wed, 20 May 2020 08:53:06 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <Felix.Kuehling@amd.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>
Subject: [PATCH] drm/amd/amdkfd: Fix large framesize for kfd_smi_ev_read()
Date: Wed, 20 May 2020 09:53:06 -0400
Message-ID: <20200520135306.11221-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB02.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966005)(82310400002)(82740400003)(8936002)(478600001)(7696005)(36756003)(336012)(426003)(44832011)(356005)(186003)(4326008)(6636002)(81166007)(26005)(8676002)(5660300002)(316002)(70586007)(70206006)(1076003)(86362001)(54906003)(2616005)(110136005)(2906002)(47076004);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8cd0635e-a73a-433a-d741-08d7fcc52061
X-MS-TrafficTypeDiagnostic: DM6PR12MB2907:
X-Microsoft-Antispam-PRVS: <DM6PR12MB2907E5BEEEAEF8FEDFB6943F8BB60@DM6PR12MB2907.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 04097B7F7F
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKg2Le69gBYBUtgWXH+CiAOH/hLKk2jV2WVrHAPPl+DKUJLMjmO7NgwG7hCyvKbPdlMdMvsfNF7zBYxzmEjw5S29sosveLp/fFCQ8LYo5gJsAP2TSVuDUK6lleom19SkV25HKCi0nV1JLXu9t/tH2ACWiCk4nJZJinJ1Z/2aYZ5M1/K7/oghIMhk2AjdsKhtJphLl7kIPC6DqPnoSoFC59amnh0R098khoMnkKB2VLy6zS3Kz380iUCHMhJLS/yX8lcAcgRAI11yCfPBwKOrqBJVXAVTR2CGp128aGo1EpZMzdcS3PiziAlJcDGowhOTFpR3VKG7aEJpJWD7Ese64eNg2mSQLJVEICfQBHdpyvr8b1WCg93ANe0Rrf3aoz2SnJXi6YrGlSxBiNm+eiFDTKn1kdi03i7qt7qR1zOyTwwREMWCmimAASBFfEzcPcB4paFltWz4RECLRNVrsOUk1pk+egCw2kbe6FSkLc0j0MARTqQZzWiJq+Ou9bxD0mwMv9bIV3XzfoKJmYD9YiENXQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2020 13:53:07.7344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cd0635e-a73a-433a-d741-08d7fcc52061
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2907
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amber Lin <Amber.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The buffer allocated is of 1024 bytes. Allocate this from
heap instead of stack.

Also remove check for stack size since we're allocating from heap

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
Tested-by: Amber Lin <Amber.Lin@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 26 +++++++++++++++------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
index f5fd18eacf0d..5aebe169f8c6 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
@@ -77,9 +77,11 @@ static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
 	int ret;
 	size_t to_copy;
 	struct kfd_smi_client *client = filep->private_data;
-	unsigned char buf[MAX_KFIFO_SIZE];
+	unsigned char *buf;
 
-	BUILD_BUG_ON(MAX_KFIFO_SIZE > 1024);
+	buf = kzalloc(MAX_KFIFO_SIZE * sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
 
 	/* kfifo_to_user can sleep so we can't use spinlock protection around
 	 * it. Instead, we kfifo out as spinlocked then copy them to the user.
@@ -88,19 +90,29 @@ static ssize_t kfd_smi_ev_read(struct file *filep, char __user *user,
 	to_copy = kfifo_len(&client->fifo);
 	if (!to_copy) {
 		spin_unlock(&client->lock);
-		return -EAGAIN;
+		ret = -EAGAIN;
+		goto ret_err;
 	}
 	to_copy = min3(size, sizeof(buf), to_copy);
 	ret = kfifo_out(&client->fifo, buf, to_copy);
 	spin_unlock(&client->lock);
-	if (ret <= 0)
-		return -EAGAIN;
+	if (ret <= 0) {
+		ret = -EAGAIN;
+		goto ret_err;
+	}
 
 	ret = copy_to_user(user, buf, to_copy);
-	if (ret)
-		return -EFAULT;
+	if (ret) {
+		ret = -EFAULT;
+		goto ret_err;
+	}
 
+	kfree(buf);
 	return to_copy;
+
+ret_err:
+	kfree(buf);
+	return ret;
 }
 
 static ssize_t kfd_smi_ev_write(struct file *filep, const char __user *user,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
