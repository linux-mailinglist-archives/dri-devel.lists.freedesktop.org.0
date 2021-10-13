Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF0242C8CC
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 20:36:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4477B6E0FC;
	Wed, 13 Oct 2021 18:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D34236E0FC;
 Wed, 13 Oct 2021 18:36:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIFZkaCWyt04BP2MCQ2yaQcPLH0RreOB1WdBcGPFIzx3nxlLbL0aUjPAJ92jFAAfGqtGlujZ0btp1OycYtQWfXbUtUmyIf8UZp8grGnNq3wWTDaDXPfZFxVw8RsReQPe80XsxwnojJvwSttChlLUkpFc75+y5BqKKEJZ84uWDcdCoswTIJ6JQUZY/Sk04/Qi6T6gwwZGcVNuA4P7Tg7rmm9UUBOuegaSnJzz23Bklzgku67UIwfM+1GsxxcBVFhuKzVwoMy9I37/6hzQaf0W6eY5LmYRRoVEPp6mneQ2LytvO6mxgPJqTRDsC7uE6nEa/eBrPM78o/wAbp6qZhhF0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OavUhKdvYgtbIxUS2tB4oYhW303qh034ljtVWUmgigc=;
 b=XNfv3xJXbsFd4qM4c4Q00hqIYCF1eWh5B6L4ppfQ66tDfEJVQSH4jR5yjpx0US9ya6uuITJ4KIZrymJqE+6WRHJ5PVFepIvW0PUVRku2Gps6/EtgAg61xDiU/OL455h/qZib7LD3KcCgXHtmd2u07NtPA2vkVkUl2foX5TlEae2A5mfZF7Z3qM91ZUk5xTsq0v6zCNDI0NDpbTYvXhGIFl4F01cyp8qzaAv7uqSTbQXpVMx0+xFnHlJ18nL3FWECmkw4C0fRJgmRQvCA2u9d0opqVb7MwIf3raIRV4m1GyJVhxAyhe5P4/tARR0kPWB0A5JvncyItOV1Rnm5Wb3MXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OavUhKdvYgtbIxUS2tB4oYhW303qh034ljtVWUmgigc=;
 b=MCSXwW+M93MjhZ3veiR1IVQaJttmCRQCpFyAxYZcBPoRuF0EKVvo37pwg2wdtwfAKg6VcYQffAc6uQ0mdiECnrnpjLk7NNQDuIg3NgQLTALj4q5a0v6z8LwSNDkkkwIeM+CV4652vFbtwtDcmh2RmRJaqI3ad7sUe/lbc30hQkM=
Received: from DM6PR13CA0062.namprd13.prod.outlook.com (2603:10b6:5:134::39)
 by CO6PR12MB5443.namprd12.prod.outlook.com (2603:10b6:303:13a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Wed, 13 Oct
 2021 18:36:16 +0000
Received: from DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::2f) by DM6PR13CA0062.outlook.office365.com
 (2603:10b6:5:134::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Wed, 13 Oct 2021 18:36:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT057.mail.protection.outlook.com (10.13.172.252) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 18:36:15 +0000
Received: from brihaspati.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.8; Wed, 13 Oct
 2021 13:36:13 -0500
From: Nirmoy Das <nirmoy.das@amd.com>
To: <dri-devel@lists.freedesktop.org>
CC: <intel-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/4] drm/ttm: do not set NULL to debugfs dentry
Date: Wed, 13 Oct 2021 20:35:59 +0200
Message-ID: <20211013183601.16514-2-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211013183601.16514-1-nirmoy.das@amd.com>
References: <20211013183601.16514-1-nirmoy.das@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68e61358-a88d-4aa8-4724-08d98e785735
X-MS-TrafficTypeDiagnostic: CO6PR12MB5443:
X-Microsoft-Antispam-PRVS: <CO6PR12MB5443A1A4C2B62555E9AE1D138BB79@CO6PR12MB5443.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cupaER+0Y2huTKxO/DzHD0Tq5MvYhtpjYNPbzl1tiAoHUCrh3lkj7vzhfCbBRAN+uvSOhvY5dtmqKW9PEypTbhNasFo8u2UoUwBbRgG/zj+6drzKi06r2Lz3ZoEJu6rkwEEnxF65M4Qp0KyV3UnUo3MOJaGWkedbIM1S7spJX7T0QjqP2pf4Mxbi1IQqZKUZMwo5pIZjNkC+sBuhIDw+oV8kBJWL3KbWlm+y/iSoO/osLBbrhKmA1zlK7oT+vn/3rhxZQmnHdflVBhlfC5Zo8BgF6CrUpop3fIyVaf8whuWD3BQC1wTQvtlCH7NFOomijJlMDl4OfuIhI6JG4fullKh5l3VDAiAYAyx1kaf6a8xf3sZ1rbppb9l0yzjGTdtr/sy4LFapCb+a3Yb8dNM+FU+/3OHeX+ozTtdToB8IoJky0+qXaC2k3ILQy2vw56X3SM8iPI9qAlPatFPMCjA4WuozMX48qX+4jGG7K4pEpG5hUSmsBDKHu8L6gG/HyYOMEHVdJFNgi/TvM73uZRl5BRzz/awxW4c+UmhaEDqzErEqB9RshPdz0ctjWZKjXm+MgkjCoCbjoupxJCl4nVa/Yxbm1Qw0KrCIvSUc4zhFPGHQ72Go+hCUCdHZPO1QB/Bd9M95AZY7CqNNkdPQwNjQwN/lDWRsKKGnI3RkTswbFrmoBDQwKKUnCpRtP3B4OXG9lKaRCFRydaLHZAYAk9DgYQvPE4l3MB3NickpSuW+mgY=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(47076005)(26005)(83380400001)(1076003)(36756003)(356005)(82310400003)(44832011)(336012)(4326008)(186003)(81166007)(54906003)(426003)(2616005)(6916009)(86362001)(16526019)(70206006)(5660300002)(6666004)(8676002)(70586007)(8936002)(316002)(508600001)(7696005)(2906002)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 18:36:15.9016 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e61358-a88d-4aa8-4724-08d98e785735
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT057.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR12MB5443
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

For debugfs directory, it is recommended to save the result
and pass over to next debugfs API for creating debugfs
files/directories. Error conditions are handled by debugfs APIs.

CC: Christian Koenig <christian.koenig@amd.com>
CC: Huang Rui <ray.huang@amd.com>
CC: David Airlie <airlied@linux.ie>
CC: Daniel Vetter <daniel@ffwll.ch>

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index be24bb6cefd0..2c66f06198e9 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -44,6 +44,7 @@ static unsigned ttm_glob_use_count;
 struct ttm_global ttm_glob;
 EXPORT_SYMBOL(ttm_glob);
 
+/* Do not deference this pointer as it will contain ERR_PTR on error. */
 struct dentry *ttm_debugfs_root;
 
 static void ttm_global_release(void)
@@ -77,9 +78,6 @@ static int ttm_global_init(void)
 	si_meminfo(&si);
 
 	ttm_debugfs_root = debugfs_create_dir("ttm", NULL);
-	if (IS_ERR(ttm_debugfs_root)) {
-		ttm_debugfs_root = NULL;
-	}
 
 	/* Limit the number of pages in the pool to about 50% of the total
 	 * system memory.
@@ -108,8 +106,7 @@ static int ttm_global_init(void)
 	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
 				&glob->bo_count);
 out:
-	if (ret && ttm_debugfs_root)
-		debugfs_remove(ttm_debugfs_root);
+	debugfs_remove(ttm_debugfs_root);
 	if (ret)
 		--ttm_glob_use_count;
 	mutex_unlock(&ttm_global_mutex);
-- 
2.32.0

