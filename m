Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C4A379425
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D7EE6E8C1;
	Mon, 10 May 2021 16:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCC246E8BF;
 Mon, 10 May 2021 16:37:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NOZBAXuF2IP5dVyOee0G03YJTmc6tyD/OuE/m9muKxdoE0PFbe0lDtZXWlti3lnYn5LAmO6rK64lgAn0Kbku+4TWpsZ7IrNpdmnoWgtQz0p2hLXLNyT7YJpUFcS4LFEQOLcguJ5QXO9RV4pohkjyAwQIF8DnYmk4upZbhCy7dti19VTrQStxCVvF6CNQrdOtBTmBZh+qJmM/+RPKs/5RubIw4A+LW8jaT2evS7GIIK1CbTenUVTOm3odnX16VqqTpZiKKXxDFFWP6IlpHAfdei5Hmlqvh3FqbGYuig+bgp3kO7esVw5Paa8WruAPidsDXkuwRyCOmi9t5t7VulB1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyxO3UGIf0UkObd+Uj0vO9NCfXhm2KLCGxrpgYsDd8c=;
 b=muH/Y22v57R62+YWZ5MuhXFQs/HrKc+msilVDZv7XrTRfNqr4cXQI3VdS1gcazYi3X8wu7qIhnH9vkIKKmy7xY0N796W8t/IpIV9IWjpajktJWP98y8gcnLFyKvFvzKDvY8QyXh6EQhy4+J8o1AhNX/xQKqoumat1vDhgdn3Fd325VgyNY3iTaQyvB/yTg0d4CoGv1sqyRImBpk0ue1B8YIkgOo9Hm6XeX4C+L4vqbFu95cOtG3lzwuHsGkk7W10IaO4htwZvJ2RTzLcekgY/tirUVzpaC4bql8DHS9rCwq0vpfT9avnMeWjhpoXVwFyzojQGc4KA/h2H7vG8hdQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GyxO3UGIf0UkObd+Uj0vO9NCfXhm2KLCGxrpgYsDd8c=;
 b=0677oPdLSVpt0iiIu3DsZniCcKQVMlq6O3IlbgpBr1Hz+BEJdSnzNpWn+/JSEtiEQ0FQvrkg3RJVV84X2fEusTtCAZ61ati1VDuF2+BAfjIo+CWDWaWNP7N1k5BVcsC8vx2NQDU2OtaePbaKqyy7poEkGEs5yzeywBhzF0FKhdA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:01 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:01 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 11/16] drm/sched: Make timeout timer rearm conditional.
Date: Mon, 10 May 2021 12:36:20 -0400
Message-Id: <20210510163625.407105-12-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 68631d47-e3b6-4ac2-20eb-08d913d1d605
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB471799F6C2CB79BDAB123E04EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9nXckeHMcc2IIh3fiwDUHYyakSAZ9BTelkU2Jcg5HkXygKAkQYn0KZwvlz3U9VkVfPWPqa6jHc6X+piWJPA+dbkhYRn7yBS4zt/G95ZzNSZKKbaqF8JtZTYYhGzwoGTYGAc7gk/h834wbvvyW9FBNmFLTiAtJDhNOyyJhe3Yscxu8XaiSkmK2CD6K65Pyt38zBgGdR72WgeTzy7qGZnoY5UHqSvV2EXbKRUMt1J6ayRRJDpTEwlClez5R4tsGLNyoStmCr25QtaSD9WnOtfEOnL15+gp/1c4Il/MxzJ1k8bw3Eb8wrnR+GRMKd3FjbtXI55o+1eZAj+kal6ex3qap5J2brH5oJ7Y49D2Cgs9l3nier7I2/6TIou8quqMVR/B+UAVT9d5dleszO4djsEHn6ich29BOo7srgicKiYStcRXFaFVH8ipG5dGb4sdNb1LHNSCUtLud1f65WwNe16RejpYz6LixKDULZnPoWI6oqZwV4eD3SR/jl+IErxajAIRIS0FTIt63fmwIHiZyCFpsEUS/GfWqM2aKzTGTkoAVmLT0e6IAZJQy0ml1W4s4sGFy9Di/3kiBIK3AvDZXe8+xgrBM+T8H5auvXXIhfq53Ns=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(52116002)(2906002)(316002)(4326008)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?8jZ9JMKP7H798Pvee5DDPxaQoBE8WB5hNg0d9ZPbbXbT64hJ2mkabII1Itmc?=
 =?us-ascii?Q?IM0Kx965w9az62zzjaCnno3kfqZk/7nmAqNKbMo8G2GpHK73R3Uk0nuXebZW?=
 =?us-ascii?Q?VmaVtSST+T2pqK9DPdhCCQPfNz/wWIj2V9R0HYwdpUjiVksFgf/+1Yr8dFvY?=
 =?us-ascii?Q?fLUt/haviUnYJqLhKGkIH5FS+25YfIuwwAmfUoKnXHHFrE48kKFr2sJKAgRi?=
 =?us-ascii?Q?xEP6NFiFPCpqUlPp2mFumm+efATJeJKoYcv/53wijdO5zv8iKFjBy4KGncqA?=
 =?us-ascii?Q?hQnpaHjqkRubIfxoE+eWmH4xPUVIVmSVywZHGAo6FmWpFKgyumVmt08mxGvG?=
 =?us-ascii?Q?7KnecGkdg90Vu63zFp6L9pLUPEkYoTkTaGunwWjSovxye9iIhYvKLpV2dAXu?=
 =?us-ascii?Q?pO8r4n160bGWYPAy076ZWZBVXPUJxLfQgRL+4lvWJbrfkK/pNM0pelvqje/w?=
 =?us-ascii?Q?8LNFJs9OYIHSjdZae6zNIHzP23vMCKHn1sNm7Yh7kqPe0QTkxCuf0vUM8N0B?=
 =?us-ascii?Q?nIW+56g8lN0fxDIQvBqAxsAnhS7i4UC6K0TCivtOROtOZ488bHAvu83QJ6l+?=
 =?us-ascii?Q?laJaHPYPvylCvWbtam2+MwHLzfawkfZ8ckOHw5ceC/3BHHkeJV4xF/VfpzZ8?=
 =?us-ascii?Q?+ShsdwyGpeQGFFT3pidt1Ylzr5YYxL+qDTCWFpgNtoWnF5uabROgaWf85zzL?=
 =?us-ascii?Q?BZlQHznl7HjBdAx8/MVsXTJ0ZTPL2Ue1HGor7DlNofcPxO6WuYqW5fEY7QrN?=
 =?us-ascii?Q?4FbMogjpkaEISPH8HcyXuUccjwo9gOL2Hdd4KimVZVt1Ciect1ZsEZAo1yir?=
 =?us-ascii?Q?PmoakvZPdH8DYmBUUI6JtCF9j2flsCWgA/1G0rT78iV9vVyZ4IajtDeuTb1Z?=
 =?us-ascii?Q?BqjOumwSIAHfcuRpc9K9WJ/q9P/mTVvlT9+4iki2FzNZ+xO7WhYojdUel/Zi?=
 =?us-ascii?Q?K59cLsof0fnbB2ndfaEOHNeoYcF2koJ8hkCTd/p0CCEzeRhMyIFJDgElYeh/?=
 =?us-ascii?Q?tAZoHcwY1EO5JnYWxxGdehFtBAGnnZgMPi78cISDAT4u8IOubJ9ZCVUSAlAJ?=
 =?us-ascii?Q?leBB/qgk86ZLjp9ElJUavW1+juOpLqLTtyiPE3MKvSMBMLaWbQoEyWxBMvPL?=
 =?us-ascii?Q?ES10h/nGwctnaBx+SLCZfoTxk0g0x2qAl2ev9VT//sLP0l2s3vFqGxNjw85q?=
 =?us-ascii?Q?rPwiw187WjjZTU1ClbZtjdKmVJ/PIg5Cqdy+1tzlMIqTWtW8uqJFMiGkaIat?=
 =?us-ascii?Q?THVihbX7KYqtYu67/pNViUQ4kVF3s3Y8y4vqLeGkDF30ef1Qs4CnV/ASoqHm?=
 =?us-ascii?Q?WlWam342EQRs3uthmF+7BQdX8SQcQYC4KnBi/PLLNpOZCbYWBDAU1pVkWRTH?=
 =?us-ascii?Q?QdF6Vi/yU4xIj5G5y0kbgQyFEMKL?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68631d47-e3b6-4ac2-20eb-08d913d1d605
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:01.0977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sAOdle7BN79BoNWoHzjm5uf8Aq82XFCSNyIRAFCi0SlyKmJALIANDUP6OAfw7tn2aifmRqDaLXmF4uKDP1sEoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We don't want to rearm the timer if driver hook reports
that the device is gone.

v5: Update drm_gpu_sched_stat values in code.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index f4f474944169..8d1211e87101 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -314,6 +314,7 @@ static void drm_sched_job_timedout(struct work_struct *work)
 {
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_job *job;
+	enum drm_gpu_sched_stat status = DRM_GPU_SCHED_STAT_NOMINAL;
 
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
+	if (status != DRM_GPU_SCHED_STAT_ENODEV) {
+		spin_lock(&sched->job_list_lock);
+		drm_sched_start_timeout(sched);
+		spin_unlock(&sched->job_list_lock);
+	}
 }
 
  /**
-- 
2.25.1

