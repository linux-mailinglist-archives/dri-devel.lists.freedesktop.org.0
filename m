Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E2BD37C017
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA726EC17;
	Wed, 12 May 2021 14:27:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2076.outbound.protection.outlook.com [40.107.223.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86F66EC1C;
 Wed, 12 May 2021 14:27:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8uJ/P4kEJylA6M5wShhbSBD4LzFcEWvzb7aXLDIRp6DgWanorX4Oz8/GytJlSd3v7dt+b5Ts+/BHbIMeQFMiHTCEiEdXPy8bybEniOC+BcxzI++VZQt5r3/rarGeXhZ+xd3+grssFdDINwL5bvkWXXKagXBR9p4hhX6zgmU3WfOgT7ih7eWu+GadtCk21yOoygbI1sI9JqKqYsWERs4IbaTOw/1ahy4lgrDT1ZqutIWccM5K52Jht0S+MIzbnt/SHPUVPSwW/tvx7x3u/bF7j9vFHDoUQhDDkM0vygqnYMz1Qx7E6P/bbIh6FGHzYzEu/QwLsANSwnHQdwT1KBZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/uPjWV0fg0dVVvp8px//s3OoPIuYbV9UKVinTXXgyM=;
 b=b6lerkiA7/BnD7wc3ITilvmwfkWtEt+ZCXZQEJN9SC4bVFSM9pbCNFxBfNoFkUaKG4jnVUR4CgOr0ufueGfvznUJisWxf1WhY7UBED9ruVuzSC1kG6q6BKzKY3SZXF26vQ24q2MfiOg8+icYt6e2irENyp7AwFd6PmnEtZdEAzJuvvRcM/5w/TNGFLJtv+5eKyCB/keTgLJakMpzhs3p5KaKyqVkpb1+MzQptxdzigngzgN+wt0BvJYG9KWkX2/Ki/C9Og6/K9y0eTo36tkTsPUCMZWYPsbeTbKShGVmn+/tjhnSOq/LIquEV9m5vtpIRmh9RZDeJNZbacnpktgamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/uPjWV0fg0dVVvp8px//s3OoPIuYbV9UKVinTXXgyM=;
 b=Q1lhmhAFDXI/aTiHDu8ODto3TIDliCYTi6PtbzhMteZTLwuA2Ym4jywAMiFwGEiKgDF+NBz1wdJXe7wk2g4IpAzqrV8LbRJF3GDJctWOCmKJucy+HS1LPSuYj2ck4dgyQPHqZ+oLSZi2NmImO4GvXfhaNi5mZc2LX35etICN4cA=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2655.namprd12.prod.outlook.com (2603:10b6:805:72::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.27; Wed, 12 May
 2021 14:27:38 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:38 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 13/16] drm/scheduler: Fix hang when sched_entity released
Date: Wed, 12 May 2021 10:26:45 -0400
Message-Id: <20210512142648.666476-14-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ce3949c-dc28-4dc4-7178-08d9155217fc
X-MS-TrafficTypeDiagnostic: SN6PR12MB2655:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB26556B8F987E0B65B7FEADA0EA529@SN6PR12MB2655.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZjodDNVbmuIH5JjKRtrRHLX1HTVK05REV2vn70KgDg58hJD+13RcCei+iEwJULjW35ktZGrUPe1LyY/S/4Rqk2zdRsY2XHDxgCcJNtxvB8Xm+xSj3As9vghir7t2hA95PaqZB3gtQ+CiEVaW2cqQb4NasjnvHp7AwVN/H9Ovp1dKQjlG9DkxOg1SZ64fsrRS24a4Yszpkc5NFepZlVWKPnyS3jGwXzuuFokYYb7Sa7atLUSkILwaOjimMvcKCUVvzav1NPgXXWqtkRo0AQVunCMzJplkGIE+ifP72zMOnhlWHWFzCR24kW/ihSb0SU+iqwTB+WtmuAgL2mNRI2A/C6b9mBp96RVyzCI0rv46vfTADmkqrTchfNeyligoONtdK4YGyebXPBvZzn47Yw1Yx6UKFg33CyV8QvD5ZeUIGPc0Z55kvHckgTJSTW9NFCSjZZY75sQsoEKKlpWLrc0biU0ohw0kInfZIvDshbN6W8XIUfXEC+ir7s7ISEDQlWp1T9yHwJGivpzEHRG30DLDZTdXaYw+9AcqT8wcsVl9lAIPPnSHNbz6W3khaDYAWgUvN9TCnbWcB/uMq3bqO9iRi0KgdjmudHjYNtH2+CZhPLg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(346002)(396003)(54906003)(66556008)(38100700002)(6512007)(66946007)(66574015)(8936002)(4326008)(83380400001)(2616005)(44832011)(6506007)(1076003)(316002)(86362001)(186003)(16526019)(66476007)(8676002)(6666004)(2906002)(5660300002)(478600001)(6636002)(36756003)(6486002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VHZHS0lLdGk4VzdGMHdKUnZrc2RmR3AySHk5VWprVGpLU013NkZSdkNGNXUz?=
 =?utf-8?B?dTJNaGVkSm11RlBHeFVDdnBHUHFUNVFVUmNKTVl4S0JySGV4QjBmQmVBWnIz?=
 =?utf-8?B?cHVta0dMd0hGMnp5Y3lDaWd2azBLKzBnQk9sOHZQVWZvYUdPclltTUtvMkw4?=
 =?utf-8?B?NVNCQmNTSE1SRHR1Wjg2Y2g1bnpsN09sc3N3U2E3alppOVZITlFMTHczdTVH?=
 =?utf-8?B?SE9tQkNGNGd4c2RVQnFjbEZRc2lmRUl3NENzZE9xWTJna1h0UmJqUDB6a0tq?=
 =?utf-8?B?QnREM0Q0MU1tODdMREdyaWtNWE5McVRzTGprZ0dodEdKS21iSGgzYUtMM3dP?=
 =?utf-8?B?d0NlV05RV0srNlo2ajBacnVvR2toM3pONDcrYkxob2pGeHJGZVZQZ1VycU8r?=
 =?utf-8?B?MXJzejlBVDFrbk14S25VMDBOK0tycXFwbE1QdEhVdjJEdmNBSmM4aDNPMEhJ?=
 =?utf-8?B?ZkN2a2I1Y0Jka2t2MkMyS1F4NzVGN3kvTXh2eFJrR2dSMmNpNHRYUytJTUxM?=
 =?utf-8?B?M0c5UHkrd3R5Ykl1OVNtdGhNNk1MS3RIV0pZMUVkQzBCQjNRVWVHWWVOMDBN?=
 =?utf-8?B?Y2tpVGtsb29IbmwyNDJYMU1uYlhpOFNGZHRQaXY5TEhVWEY5a0dpc000WXNq?=
 =?utf-8?B?ZlI1Q0pUQUhpYldwV2NYU2NnNnBzWmhLRWgwUjBKNUU5VUxsSnNpWmVTeEVr?=
 =?utf-8?B?eXJzQkdxSTdOUFlUb3cwZEx6WmVQalRTRC83cW9ESFFaNFFDQngyNFZGYWN5?=
 =?utf-8?B?YTZ2R0MxbVJnSW5HNGhiOTMza1ozWkFDOHVHci9aUThCL0dSQno3SzBObEFG?=
 =?utf-8?B?YzVLZUhKQUNDL2hVeTNtNzdsdUpidkYwbGwyQXZQeEk0TlUzdHJ1ejFhU29n?=
 =?utf-8?B?NTNnbmxQdjV3NEhiVU41ZTVDaVhBN01OSGhiUzJ5WVhSMVZ5aUozbzJSREFE?=
 =?utf-8?B?MDQyNWI3NnQ1TlFrUTZVL3RPYXo1cS9qYytQcmdkMDlydkcvdjF0end4eFp0?=
 =?utf-8?B?SE1KRUVURmhrN0ZKSDE5QXpCQ3FLMXFTWUFNdllYZncydzJmdjJCZ3dsc1dG?=
 =?utf-8?B?R25PYURXdjlITmFhZU5TVjlsWC9ZQTVSZUJFWEcwVUV4Z0VmcWJydUVOTDUy?=
 =?utf-8?B?MTU4NEpaeHRwZDhpZ0crT1REc2ZKSHZXVi8vSFJpNGpsR3RqQ3NaTzZ4QWhx?=
 =?utf-8?B?SzBqc3BhSGpFeklyUzMzUDRNbml3TDZwaU9wK2NUazk4L1RIWVIzc05HSjJW?=
 =?utf-8?B?SE1meFlEVjVSNFBPVGFrSzhkQi9zS0FBSGhhRTFQZ3cvNGI0MFhDdzRseFNT?=
 =?utf-8?B?eXpwOTJOd3M4L0lBRWIrRklOd0hXSVJ4a2N4M2JzMi9xcVIwTXRMeTBTOXBN?=
 =?utf-8?B?TjZ3NzNyOFFwWWNKbDJyS0NxYnEwVlpVaWhSMGVlUTBSalRBM2psZkpiTlV0?=
 =?utf-8?B?aCs4ZjVzc09BcGhUV2ZuelRCMkJTYlRCWnhLdE12ci8weG5XcTN0NGdRckQ0?=
 =?utf-8?B?TlQyTGg2Y2RYMTVTeXpxQi9XVHk0SDRqQVEzVkZHVldta25FVnJKcTFVbUEr?=
 =?utf-8?B?R1kwR05iZmQ4YWFuZjZMOFppcDFYbGdoM1Z1Y2M5V0srcVY3anUwNXhSclZX?=
 =?utf-8?B?L1ZHREo4NndTR0wzcGplYXFCUGFucXJiMXFHeXo2b1N4UUZ6SzRvbjF0S2pE?=
 =?utf-8?B?aTRNZXpxWkJ5SWcxdjNNcFYveEU1emRoY3UwV0NKenV0SXJPSWhzVnZPKy9E?=
 =?utf-8?B?QVlxa2FIM2g1NkRaR0xoZCtNTHd1ZWFMKzJTUFh4eFh4YW1kTmNsYWU0QjJZ?=
 =?utf-8?B?cjQ2bXk4dUE1RDl0MUJwbFhlb2NTd2VFM1FRb2NsQ2sxU3NuNHlIZFZQamFz?=
 =?utf-8?Q?tjSiYznSg0gLr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ce3949c-dc28-4dc4-7178-08d9155217fc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:38.4856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6xHyO1wMWcGgBOWbhgkHoR0RY5/ooGfgTSLHNOV6MI91Z0+eBA8clj6mQRkTTkJjtwtF5QKp3YkfbCSnrnQ1Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2655
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem: If scheduler is already stopped by the time sched_entity
is released and entity's job_queue not empty I encountred
a hang in drm_sched_entity_flush. This is because drm_sched_entity_is_idle
never becomes false.

Fix: In drm_sched_fini detach all sched_entities from the
scheduler's run queues. This will satisfy drm_sched_entity_is_idle.
Also wakeup all those processes stuck in sched_entity flushing
as the scheduler main thread which wakes them up is stopped by now.

v2:
Reverse order of drm_sched_rq_remove_entity and marking
s_entity as stopped to prevent reinserion back to rq due
to race.

v3:
Drop drm_sched_rq_remove_entity, only modify entity->stopped
and check for it in drm_sched_entity_is_idle

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c |  3 ++-
 drivers/gpu/drm/scheduler/sched_main.c   | 24 ++++++++++++++++++++++++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 0249c7450188..2e93e881b65f 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -116,7 +116,8 @@ static bool drm_sched_entity_is_idle(struct drm_sched_entity *entity)
 	rmb(); /* for list_empty to work without lock */
 
 	if (list_empty(&entity->list) ||
-	    spsc_queue_count(&entity->job_queue) == 0)
+	    spsc_queue_count(&entity->job_queue) == 0 ||
+	    entity->stopped)
 		return true;
 
 	return false;
diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 8d1211e87101..a2a953693b45 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -898,9 +898,33 @@ EXPORT_SYMBOL(drm_sched_init);
  */
 void drm_sched_fini(struct drm_gpu_scheduler *sched)
 {
+	struct drm_sched_entity *s_entity;
+	int i;
+
 	if (sched->thread)
 		kthread_stop(sched->thread);
 
+	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
+		struct drm_sched_rq *rq = &sched->sched_rq[i];
+
+		if (!rq)
+			continue;
+
+		spin_lock(&rq->lock);
+		list_for_each_entry(s_entity, &rq->entities, list)
+			/*
+			 * Prevents reinsertion and marks job_queue as idle,
+			 * it will removed from rq in drm_sched_entity_fini
+			 * eventually
+			 */
+			s_entity->stopped = true;
+		spin_unlock(&rq->lock);
+
+	}
+
+	/* Wakeup everyone stuck in drm_sched_entity_flush for this scheduler */
+	wake_up_all(&sched->job_scheduled);
+
 	/* Confirm no work left behind accessing device structures */
 	cancel_delayed_work_sync(&sched->work_tdr);
 
-- 
2.25.1

