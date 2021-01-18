Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 203F82FAC26
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1796E5C3;
	Mon, 18 Jan 2021 21:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3376E5C6;
 Mon, 18 Jan 2021 21:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fztKaoj1xf6N+0OJx95luO7saIKkzT9MhLPYuuXszRhXpFsK48AG9xefm7ueGxCt66FR5yIFLzwlsptqb+d5pdz7zCl5pHQesGrTZLNz1w3LhxQ9u4voh++Hl6dDBO8KS+jcLaWQYBtUT7UofhyDAZvx/7LEM6Vnlhgp39+i1DxUtOVf6hVsOsyzMhBhkZd7jud9pNoQZLkR9IeF+JTg0cUZMdjVpzQsG2mchQd6v5FO6AuD8TOx8y2RlABebKhaJ1mp/xji6MTjDGFpPlHMirQI926WEOJX+y+zhrpeNd9ZnlhGb70q5UITVs2FIQ6g47LzDfe2bBQoGmXI6g30fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acABx/MxeJUqIxU2HQF5Pn9a6gec1/oPc60taOYLvqQ=;
 b=Ovj/vaXtux+yZolfTZ1AtydDgNbCFLGH1h5Z5zNrLG9RmbCK1CWMVfSYMhckmwYZQJ/v+WvsuXGSxmVZw8eZDS5N28J4FUb4FLQw5kv12qeqPRMV+h6xTmFiYPiZNFtY/qZztgH4b4UijoDEXvCZ+cnIe1eJj3fpuSXEHUaFEcv34sPpPWvQp5faFAlSKzVlDidYKMXTnC02g4cdfpo/KyorgsHDvBw7ubi9AG3/u9L4WDoWglZggDlRj/bbIdfh/iYE86UmQ+DlNlDFVG2RIKQ3inirkLdyio5oN87vUlT2AfQ0UxYSn5W8WECHIzcLcgk76rCelLhGbYjimhw+PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=acABx/MxeJUqIxU2HQF5Pn9a6gec1/oPc60taOYLvqQ=;
 b=omTDcYXT5u2SP8mA192TsiScmuf07VhyC5RbtlzZB3SJ8JbIzfsm3q0k9N+mEnYkUlCnmW1IXiYydAMcbrGodcMAa+K6Ek62LTBjZAJ4/j+XqDAUCWGRAgUZQ2WG62uJ9WEph2K+LEIOFT4Lxu+25BWluV4rik4SGc2JvrwWNGU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:46 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:46 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 13/14] drm/sched: Make timeout timer rearm conditional.
Date: Mon, 18 Jan 2021 16:01:22 -0500
Message-Id: <1611003683-3534-14-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1cca2f9e-ff3a-4bc7-c2a5-08d8bbf46794
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB476752385A93E86953E05DF1EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zVjKUfE6Z2AbstNbzK+zouTYBtt0biNvjbl3bRXmBuQA+dA/g44sNbIq2HO5wq9RIEtfMtv8crrAq2X9apB1LK3kH6+x6IuT1LUX/I1IO3xLms05yfhK6X6Gc2ZKJ8LiDLHV/cZRlTU5R0zXczelQ6i93inLYwokkYCtSLnWSqWVMR87q3cnvfEnBDVrwinR8e6PffEykFdmUH5akSX7Ekjdgg1VsZOXZB121YTQBm702rpLtObyZtRtNxofB+EFehaSJ10KMutTWjkgNmPGTLBJHJXNE8fUuJyHplGmn45kKa/+C/8Bk8+Lq8ygZNy9FhzV9SrD3SnK2+zXS2Ytd0ojAsuifsJP5FHhHQE6bBBGADP7taijQwgt6SFMj2QiOEJpeLLSmoZwTZZ6WHq+Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?wQeGaxTiUE66IvIS6HcpZKqqKXSgoJWjvkCXuQy85zVXLyN/qC+UTCLkX1vV?=
 =?us-ascii?Q?J20oQk1UeuAxxITp9xs5W7qpMt2PQVvVI6PIsCQOciR1LNniAAvYvsTbUYpV?=
 =?us-ascii?Q?f+eA/nX2SM3bbW35HX8YVyEBQ27PP4RdaCMJmE4xcmOtL4FpJfdJ2fRYBB65?=
 =?us-ascii?Q?Loncu+V4K8w4b7hVsiC4kWUih+rj29PFNpfL558h+kd0c+FbJN3PTeFklV1X?=
 =?us-ascii?Q?65U3jtWcdA3YdyswTHlc+KLKnKwEEK241JiHgD1kVc4IEHin+1EhKRUUBS7a?=
 =?us-ascii?Q?V4p6ED9VzJ8DW2Q12DwEfUheZbBZdV1pwhT9suyocdwSrf48c0gAR7Fov9uT?=
 =?us-ascii?Q?hM6zjyUm96nQHKel8VzqWOgutQ+tQaC+Fqmh7lckCAveRHgxOr/VMDTnHVEL?=
 =?us-ascii?Q?E0BQx+/eQ6mzCz52N0FiQ0XNGYs7VeDMPCbytH8bt2wbRa15t92VK913fyJ3?=
 =?us-ascii?Q?fPfY0w42ivvRsuPctmA8wjMWOtEVbDrh8uyEA10Psw47iZJdkUvVXvmASImt?=
 =?us-ascii?Q?nGeeGQtw6eO0TsczbfAAdYWezXar7DqH4b+SaYmxkhaHSsFGVbjJaa6xOWm5?=
 =?us-ascii?Q?ZOcKaG4xHSDOH7zewhFFEJv1bF7fG4UdvEYFHBe2RJP8QH4hJGusoLYhnyIy?=
 =?us-ascii?Q?CiLxKeWAvp6NXL7FTc6znSvxA5N4k9kiMh1cogl2zJWKA8s6owqovni9TABQ?=
 =?us-ascii?Q?2sZoQsvQgSIzFhp/50uF4FCTW//4gBUZxc1aQb28ccPbEoiOpj+ZY1jhOpTa?=
 =?us-ascii?Q?8zWSLZVuLrwR1RUPk81BvJFZTIwESSZK5PMQau6mylw1eGlEAB2kTF/sOIkd?=
 =?us-ascii?Q?Z5wBcuUpXJoBaxG7ToCYk05QYibm1M4dYPnMgSNF0EQlUSGwh0l3txaSxTnL?=
 =?us-ascii?Q?BB4uSnyH22lfz9xibELo+XMN6lE7g5bbqhzdqFTIR2k8Mt668pCCN8EuFxfF?=
 =?us-ascii?Q?Fo4h+l3RjS9nvib5nsmJAhQ1UA//ATWVYkNas9VROdHsDLSAZSLXObyteOUl?=
 =?us-ascii?Q?/WFn23FkbjW+CtyZkF+5lDcfote175dsKqJXmVmVewnsbHp7GcXiE+VCpHkv?=
 =?us-ascii?Q?oe2imWsX2XXXkp5VMUSnIph7aPq4RfEQow744xKP+xtKEMVpXOVJJkHvKQE4?=
 =?us-ascii?Q?osQCAdgVOupd?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cca2f9e-ff3a-4bc7-c2a5-08d8bbf46794
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:45.8820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mNhdL81Lv7AjvpbJ8euzeeTNZ6YifsRMJ3OYtF7BJQPxhAXViX2kPmvelfFgyNmt1Uqj5ZtjwVfFyV78nV3RKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want to rearm the timer if driver hook reports
that the device is gone.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 73fccc5..9552334 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	enum drm_task_status status = DRM_TASK_STATUS_ALIVE;
 
 	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
 
@@ -331,7 +332,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		list_del_init(&job->list);
 		spin_unlock(&sched->job_list_lock);
 
-		job->sched->ops->timedout_job(job);
+		status = job->sched->ops->timedout_job(job);
 
 		/*
 		 * Guilty job did complete and hence needs to be manually removed
@@ -345,9 +346,11 @@ static void drm_sched_job_timedout(struct work_struct *work)
 		spin_unlock(&sched->job_list_lock);
 	}
 
-	spin_lock(&sched->job_list_lock);
-	drm_sched_start_timeout(sched);
-	spin_unlock(&sched->job_list_lock);
+	if (status != DRM_TASK_STATUS_ENODEV) {
+		spin_lock(&sched->job_list_lock);
+		drm_sched_start_timeout(sched);
+		spin_unlock(&sched->job_list_lock);
+	}
 }
 
  /**
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
