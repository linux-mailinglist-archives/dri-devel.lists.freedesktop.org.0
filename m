Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD6436DAF0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1072A6EB6D;
	Wed, 28 Apr 2021 15:13:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC3E6EB61;
 Wed, 28 Apr 2021 15:12:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YENy3VyRcwy/D73IUjPpPyzcis+9CtCSy+7I71QYp0SPndqud7sFmXbHj5yEwDOUr9+SYZWzBk0Rlg8trCPPBwepSKR+8e9Dop2P2yrdiQMmAp4r+MZ5a/mesc1Vh8Y3Ey5ZmrDUsYr6RvdpXYbFGslDYxMWL2lQrPrO/1SZYaDomUAgT4GH3hWhFXCEf8PV55Xdnh9j/KMf3RvJxW7tGbP4nUYLoFkD8D2gAfVWZhld8xq/t3sITVs1+k5J2ZTXnMS2Ue73OsHAJDunV8CWpVFhM9oT+3m60asafhhxdXEfXJsgsyASVgS5321HPuwfxv29XBUosZ9hZPDDLsRdpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ylkxX6mZ6oWnt6g0gOSaNMKTRfvHu/TDcdKALZjVVA=;
 b=i7NvYa+waJ/hAro3h4kgjiZ/a6N6lQ28bt7YsYNrYex1hgPQu1Xb+pPJnNzutb0LFx+exLAH9QwrpO9UgTZ3QEDQ2avwDaosgAYKW7cHC1+HpCpEZ0FMyDKVqJnxhJrWzALoa77uoQKqVl7V5jjljMKMPhjAD4EREa8PFvOXuEwpWF1a+NRUzbPis0JO0+OguEHTcNrXjxy03JKwAn98cJq1nrOgQJXBrgciRevjYShAjyNa6NxAYCp2fD7nKK2jyLT6eRL9V/8AZel1q0Md4sdHRujLMCav360AuUm0WvWa4F+c0Iw5CYI79qQG9UwPTLxsgXxisuJfXobxgxyjew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ylkxX6mZ6oWnt6g0gOSaNMKTRfvHu/TDcdKALZjVVA=;
 b=mPUiojerRpgI0zaDLLb+F6jEklxt3+7/qWJUa2lHDbYUjQS2lTGbSTLdobpUrZYUQQTTErmEeOoV6N0npOQ6gms0H7ho2+2z3xcYNGGXGjGwvkg/BYWPkGtLaV68hHbkNyECT/Bg2Bd+B7nvQ4fWdGzQIPgY8312/BiAjts3E74=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:52 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:52 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 11/27] drm/sched: Make timeout timer rearm conditional.
Date: Wed, 28 Apr 2021 11:11:51 -0400
Message-Id: <20210428151207.1212258-12-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 866bd927-0547-44ca-988c-08d90a5817e3
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462C46306A0B76EF7F85597EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 76bFNYBtnLjIx5GRtCRicTgOazg2aYyCr5wkNtHNop2IAAUu0uHOYK1bnY+nLgsi5eq+gD2Pfp5VxA/O697VTDwM2CojwTQGJTzabnnXzrKx0AWjtkJynyK2dF7Szron1HS+wkjmUXWMpl+LZbmP//vOQLtFVw7K0CfiDQ3fcryOr9f1jo/aFJ25pV9VTZYifHGwJoPelvDJcInnD+XT+FLq+kzS7J2rA7LE8KI8StGho7TRMu7bPH/HblkTBVQuz9d48ybnckr4rEaYSdV5o69/tTpczgK9Z0D0WVgY8pmEwkxeAuz5BEblIei32MsBPxkw+Zn1ViaGG5xb2rzBlbAwBxgFASD8RaLsw8Bk4zDVla2HNqn7YquN/7pTBQHKH/zeaCY2+57qgPDUJiAekm3zH+AV0R8qn4UtTPQGSmO9b9iyt69HlmAfDWJ7PpJeWpT8ykc1jWGB5TnyGzpN3WP9KlDmCrxsc98KOmlqJOEV/CbMSNkfcqowllqf+lwr8R/VExHe7A9QSVoyHpQ9ynZi3gSS/+MB4PlNKIi35yABiS5/kCEcv+tt7DSb6GdH27dSD9PMmVKYCpZ2CC1Z/frnkHLO7UZGeY7uNBcSTzs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?0OQ+DfrlsaUZoeEZ+G4hz1TYQGval0CAUPDVWcUU2TKxMyn75HsGnjI5GnZA?=
 =?us-ascii?Q?Sdzvg68UpygPJXSWz126ubZ2sryM6kcIvCl2BPWo9em2oseWC2DqXDeTBJDQ?=
 =?us-ascii?Q?NOq311mO2kfGlo54ZoyqEIiBAvJNQtI8zI2wXOs+aNOM/5phF/p1+4N0g4Zf?=
 =?us-ascii?Q?IFBEap6vcwhoJuGCpPNJ0mncfWaO9AfGHboaEIHt3yKNH7VYHXxWkJtM/eOn?=
 =?us-ascii?Q?G1N2BBXUMmyyadP2b6x8QCuzMw05vNX/qtTfVjbFXLdHXhGh+OJRnhS4mbFM?=
 =?us-ascii?Q?V5kY1L3gt8DzhSuPCCG7N2HqWbVYy9K99Qx2WTsdr0AkQujWOInERPGVTp2u?=
 =?us-ascii?Q?xIJbTWFKZl4h9DMfWpBd/7otC2902a+CBx2pbz/H+vWwDP36tcCfGVvEMFz7?=
 =?us-ascii?Q?1fFurgN4E+1XCuHaaQoipw1Aw/Bwh7s5xCv/rYcnMPyx+0OBx60hcWI4zIbF?=
 =?us-ascii?Q?eVUzRFLEeL8G0++m2d4K6fLCyqEU6YRERBLjM5h1qegoZ2DH0EaGB+OX3iC2?=
 =?us-ascii?Q?NnRtm0Pk7hXHI9MOzWJOy0SAP+17p9bdtNOfA6GBWxDjtAq4lloFYot21YDt?=
 =?us-ascii?Q?ZWIvCX+ll5LeR/MukqttX9eim9SrP8EYCYyobYbPQPQZ2gg5KWWckA/clctV?=
 =?us-ascii?Q?iiymbEEY9TSmLch39tDRzI8fxNnccEB9jkIeievcWZhiBMWCiuJuKeVwciKZ?=
 =?us-ascii?Q?H6LXxDCyNUWkQI0sjsGKZsQQhHtQVkAJ/bXU93pP34uH+ZSUtAWB7iBvAGxh?=
 =?us-ascii?Q?WqU5tDJE2MC/k/H4ECXidp4sif/f05/JP5w59b6qN6lgI6Bd9VdcL5kGp7WY?=
 =?us-ascii?Q?0eXciVbl1Y+qf9arXa1xTZZkulucBiU8WwlifJjgUoy7To/78I+Cmib9dh/o?=
 =?us-ascii?Q?ERfMmHjMEogxRbpULUbsrv5ez4T7lc/tiC/5d6XWzckReENjIZoiKt0qBCGF?=
 =?us-ascii?Q?maJN0727vxETInnTznWobnJUe9mj3FknmU9xS9iUBgyRn5nynKnhRpby9dvF?=
 =?us-ascii?Q?Cp/s6eZBRkV9PSvhubjCKmvjUFfQ891L9p3Di0AqgArmIrwAHjYML3dpOiPM?=
 =?us-ascii?Q?3X2q9dYAK19m+1+3LOTWUXbyGNBqFgksj+pu3hKIjmnWG3nvGP+N81pwjoaV?=
 =?us-ascii?Q?BAE8TbLJW/NrzyAWQmKHzzGqGk8UZBeEZK7eCn6qoPSsD2tUwwpENloDX8Ca?=
 =?us-ascii?Q?QR8unZL8ohEkhQjabbgKoKmMINhJiOBMR1BfWOJEhw/L1MszhHduoZJGNOz7?=
 =?us-ascii?Q?JCGIfEcfkM5nrV1o+CXHxTWbjfZgRgVON0Xuq8FLk1LqOjFK2ysxWg8Ye5WP?=
 =?us-ascii?Q?u/rIiTQxhtTyfEa2mfUI3Fpi/OurdEBnCTSgKJjF7c4WQ2HRjY4ZEP9iNzMO?=
 =?us-ascii?Q?PJnEKii5inV77cleA2qyQ5duVlCB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866bd927-0547-44ca-988c-08d90a5817e3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:52.4856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dasEwWrwzh0D6SlaNehT+QZwEZDUA1PWrN9jKG1UVwczlyAPMX/VvncpKZL95da/m/GqferNpdIkpXpuI+ZrgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
index d82a7ebf6099..908b0b56032d 100644
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
