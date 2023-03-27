Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4116CAD95
	for <lists+dri-devel@lfdr.de>; Mon, 27 Mar 2023 20:45:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A315B10E6EA;
	Mon, 27 Mar 2023 18:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E204D10E6BA;
 Mon, 27 Mar 2023 18:43:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OrsFSfFhnGrSxz0XauKhk+H+hoxt9WLNokVaiX6+DG/dTGPWpcTfjZRWXJ1L60eps/Zefm9VW6do7KWaXPGYQ9i2GaaeHmUO2lnIPUV6f2QgzVcWcq29yMPflhvDdFh92+XUIX3slgThW7hZEVF2p03BWr7/21CJXCF4HsoOk6UcIYfXzX8IZxi9IMBXnYCdIlf1qdkyXaGvE9Z382yYLfqw6M8sHthgk3RtRIgFwygwnxbM/u7csB7bRGtAar/sWb83vDd657rQPjJFbo3y3BzISiQeaCtzmOnhyRz/JlJru4zMUtbild/EO5SPlSlX6gxq7s0L35rlxNUvkFyG0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWK3yjE0Ag3z1hwrtlXHxM6Y6gqWC6U/25rOLd8Bk3w=;
 b=Yo4VqIbdhgeDMCmDWfe6cU7fazB4XSGJv19uKNUcxYM6h6bADvQexuGMrKSF/0MP7TnHKgK+eQRdkreOPW0FLkgn5uMTC9TgZmxw203C2kz0P8wmef5P04AIp2g5yXEY056f/1xxKeCazZyutBp5P34i4N9PlDWQNh7PlEpJSQQ/7oGCsUGYTXMfxCCBnVn0lsSADL+yP22N+b2Dzbn7yB+oc3BzKiXddMK9S6nLidyofB2WqacVlhYUNk64F6przeCRw5ieFIlNcrmv7mS1kkzqYnhb1zUU4duq5fKc6eKmjlOPgxVEhkWTQiKGsty3zq1w/fz43dqUkFMUAKm49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWK3yjE0Ag3z1hwrtlXHxM6Y6gqWC6U/25rOLd8Bk3w=;
 b=j4wsaEd3knXgjWQkDFNRUyswmyc0iDBFskMa71IzMjqN/Ql9n6fUUAZCAE29jXJCOdR179lkFIeE6pfTLTzaXbPVqGu3Ri17dE0BxMAhNmhZMQLJQSl378BZx6UVaD5k2bJ+IYeKutNshq/SSmQKyCFhSGGBFFdKh7J2YrQhhfw=
Received: from CY8PR02CA0005.namprd02.prod.outlook.com (2603:10b6:930:4d::9)
 by PH7PR12MB7890.namprd12.prod.outlook.com (2603:10b6:510:268::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 18:43:53 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:4d:cafe::e6) by CY8PR02CA0005.outlook.office365.com
 (2603:10b6:930:4d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41 via Frontend
 Transport; Mon, 27 Mar 2023 18:43:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 27 Mar 2023 18:43:53 +0000
Received: from jonathan-KFD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Mar
 2023 13:43:50 -0500
From: Jonathan Kim <jonathan.kim@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/34] drm/amdkfd: fix kfd_suspend_all_processes for gfx941
 debugging
Date: Mon, 27 Mar 2023 14:43:13 -0400
Message-ID: <20230327184339.125016-8-jonathan.kim@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230327184339.125016-1-jonathan.kim@amd.com>
References: <20230327184339.125016-1-jonathan.kim@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|PH7PR12MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c0bea6f-c5dd-42c5-0eea-08db2ef336e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HY0ztvOBPY7qczWvlSN4VgUIfrZK31GC7bbSSL5+s6mXbgM3sk+fSeO38gEvqJXf9SlKVbjEN9qtAGH9hGtrb/ZIHwI8Goc4WkJQwPJNeZu4Xs97FEG05vWD7mDJ3Ta87hoN8wolYCrhj02GxXUwpWsTAx8x9ehOaEOBZYJQ300Z8ykIKBt23KWgQCbU3KaUlQ7wH+BkUJpngSXgQ6BmLc3OAuZ/1ix85wr4WlbAPd1lm1Y7QFKQcFO15LcS0iFr+lZAXd9pVLP/7TcxNT2Za/HikQBuGch95NhApECKBFjRDZori2g7SORvETIOTG7tyVc0Ig8aFSE7x1E6Hdzjx4+wjuDeWMKUnQsg9s8pFjCt6z9GDDn45ryoPl7Rtjwt8NOk2OCOqtvmCq5EeUcM0HRs21zd9znFvFJCNR9SWacmDBqDqZpyUs7WFvo7hyU6oe4LXe33vC5rkbVwdZNkGB4OLaxauoz3EW2+9NbZtQuQkYZCtQtc4UC4PTANHr37fHMbLWc/De7mV2mbnlCl/MQjHTUMFnBglz8uQWI+4U52eqLEw7XZX73OkYpZTKpIs/8isHqQCV4yoC8lvI3eksU3D0FWtIoUWqj3AV9IvWH6dGi8g1B/N/c5CScOLoUPqEAvPEoom2ykwwCl8icivtMuioPB8ishXeitzpWfqQ8d0/1eWABe3rUDz7f6XWMJDQgZTVm2CYxBocGW67c8DohXSxJufFldcxQsFuBsQaM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199021)(40470700004)(46966006)(36840700001)(26005)(40460700003)(8676002)(4326008)(110136005)(316002)(70586007)(70206006)(36860700001)(5660300002)(41300700001)(450100002)(8936002)(54906003)(186003)(16526019)(81166007)(82740400003)(47076005)(7696005)(2616005)(426003)(1076003)(336012)(83380400001)(6666004)(478600001)(40480700001)(44832011)(86362001)(356005)(2906002)(82310400005)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 18:43:53.4876 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c0bea6f-c5dd-42c5-0eea-08db2ef336e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7890
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
Cc: Felix.Kuehling@amd.com, Jonathan.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The debugger for GFX9.4.1 uses kfd_suspend_all_processes to pause the
compute pipe line so it can safely toggle the SQ's implicit wait on
barrier setting during debug attach/detach to work around the wave
exception s_barrier race condition.

For mGPU setups, repeated calls to cancel all outstanding restore work can
result in an assymetric permanent cancelling of the restored work from the
debug device after it has toggled the HW work around settings.
Instead of cancelling the outstanding restore work, just flush it as it
will be properly evicted anyways by the current suspend call.

Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 1e3795e7e18d..55a4ddd35e12 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -2008,7 +2008,7 @@ void kfd_suspend_all_processes(void)
 	WARN(debug_evictions, "Evicting all processes");
 	hash_for_each_rcu(kfd_processes_table, temp, p, kfd_processes) {
 		cancel_delayed_work_sync(&p->eviction_work);
-		cancel_delayed_work_sync(&p->restore_work);
+		flush_delayed_work(&p->restore_work);
 
 		if (kfd_process_evict_queues(p, KFD_QUEUE_EVICTION_TRIGGER_SUSPEND))
 			pr_err("Failed to suspend process 0x%x\n", p->pasid);
-- 
2.25.1

