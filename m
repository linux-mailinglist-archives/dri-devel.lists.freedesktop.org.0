Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4124637942B
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7350D6E8C8;
	Mon, 10 May 2021 16:37:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27DDE6E8BE;
 Mon, 10 May 2021 16:37:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYMfnsN52o4+zaE7HpWvmwHiYfycXD5b56nyw/U3HNkIzwOcXQxzpXJ4PbIcEML3fyx6I1YTGFIvA9g7KSUE48/I+s13h5FrfPK8lFH/r0f9cDxwezW2cg0o7THnmagioV+tqdShBMX6VfA7tBCHjSNE/zanqhymLS+jw78FA/b9IMQl4ANdg8YQcHt7ZeKAwX5SnBzLuGRk7oW6MhM2YodgzevlAuoLwPWjUwatFjp/oeOpjValBSOoH2ZtAD75S+uVkp01ga/x1wte7BzUGBQFG5qTvYwVF8ehG+EhvnfA5t79g10s4O4A1ZIPLVyL7PqtqSkHQlNKFlk464HX4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/uPjWV0fg0dVVvp8px//s3OoPIuYbV9UKVinTXXgyM=;
 b=S4U2Qo66i9XLZtjXmXqoLiC7yNacRv2/sEHls891C4BLkqUn5f79Tgdhj2wzk8GjZ1xz0zy9RYA0dzdrava5rUPLB5BwxZAvLkN3iZ38wV4Nt3Eg6wliuWDmJOdywVS6JbiEVThjHPBH4QaArQhvaqoO8szxmDnUeocKpUkVC4q36p68qOT9B//aPzpJELJSMdUZzsBmmRLhX5GNpMMAUFHmAGXoxJm+D5aYSOrg04PTQp/2g4YMzd3maxlpjxPrpQ0IzllvsPNoIjdJtjVFLJ4NJZ8YrVKYSktAntXkJfsCQJczkOO6sDaymUrAWg6rimjv0N9TVGXHnTm1DLFmaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/uPjWV0fg0dVVvp8px//s3OoPIuYbV9UKVinTXXgyM=;
 b=MxKUWsIKIIaK/ZXfaerPAxNtzoeGAN8orCb4LGwFZ8lJ7VwMlVi+7H4e13NA+FS+9stRUZdgydvioheOHwxrXIPQnaPjmL1yQ4b7Z8f3TseaGrAXrMZZcEzTI+lxMbHjeLGibiWDrxgA20CHTI7B4bn7sFTAFDpqBhhdhFTrb/Y=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:07 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:07 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 14/16] drm/scheduler: Fix hang when sched_entity released
Date: Mon, 10 May 2021 12:36:23 -0400
Message-Id: <20210510163625.407105-15-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27eed853-578c-4555-9117-08d913d1da04
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4717E1D0FE7D780040644456EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cj65LdDYZi6Q/yMXUb0SwW15TOKbBTNgSCXO6DmjPbUpdFPwjgQtNVmgFr3EoRuwWCfXV1/pK/4zQ/bUsbzLtXkBu3yje+RmGB29z1LyIjkrJPF1kZjGQHn/I642Z+RkdpHrDhlwB27Bn5IpnzvXVij1hUR4b3oFbaRF2INdCng+KRtGi1TGncHHScebBr9y/FVqEGwKyrCifqxsc1kR7MGR2X4LysTL4lF5XDrp2SOxiNUeNXhm1lLsFvu1GH7Qw4CRfhnx18kszOD+foyBhq6kpQB0QJqlyXPvAzzpOjnaN8uT9UGbZ78pYwxo+uUwjynMKtwGUT70OLzo1hl1nQOqC7VGi98ZzfeLvMdje5jaoZx1+rvA2HN0WTJX5COUbcJvUUwQaO/xELXrgjQt57tGLVhvFEcZ9XADZqbUMVOxJGatc6BUqiA4vvnIYI8AS15b7bSYNLi8jbUkmrnhHSDCnL6rq49+HCrWz7TTtTXPzkAUdKU85v8YHmLuJ0G3CUP04q4Ih1OMnnjXzvtYFl6e7LP167DngEHkeACpoh3uuDki0/YAV9SAOL9SGa4+l4h1S8xoe/uVLHpjHSH6ocHyLb0RPW+7mkyT2JZs/G8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(66574015)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(52116002)(2906002)(316002)(4326008)(54906003)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dW45SWE3NTlQTy8rUkJ6UEdVTnpQN09MOHV3amlzVHhNN0dwUE1HZktLOTBF?=
 =?utf-8?B?OUt2U01VbXNNVmFzQk5kWG5CeVBNZzdQWVNiWm1Dc0wwZFVwdkF6RVBGVXNG?=
 =?utf-8?B?ZUVPLzI3UUdVMkFOZXJMMFh5RTdEcE5iTzJYUjVmbklwaHVGY2JWUEJ3NVZp?=
 =?utf-8?B?V3hCOEt2RHlFdWJGaGdIc2hQRjVkd01xK1pvNXpxRUZvcGxRQVRVZXhWMXE0?=
 =?utf-8?B?Mm0xWmdqTzVSS3pVUnBsQ2t2MFIvc1gyVG91S1draDZRMnhmNzZYZVFHWVdR?=
 =?utf-8?B?ekNoVzQ4aTVBU1V4ZmNtNXNnbkI3RFI5akczNkFOaGRoV3Qyd3JDTlBvYlYr?=
 =?utf-8?B?cVg0QkRTS3dPOWZVa0F4SmhCdHU5d2JIM3pTRzRnOVhUckdteG5nRjZWaHp4?=
 =?utf-8?B?ZWVaYmpDczByS0R0M3NLOEMwSDRiRk5FcGVWOFBjNlBBZXVaWC9iWGQzUjFG?=
 =?utf-8?B?dEMxbFNVcDE4ODQzdXRWazRZOWZEdjJPZ3h3R1RXa1pDK2pRYVZYanczWmFi?=
 =?utf-8?B?blZCUHhoTlpRYmsxYXVZeGJtaDNjVUZpWTc0UXhpM2oxdld3ZmxCbXlZNGVl?=
 =?utf-8?B?U3UyWXc4aGpSVmE4cHVsTFZSTHh3SWhTN2NrTTdoODU0VkN1NTByNUxNYU1v?=
 =?utf-8?B?NFlrd01iYkErSHdpNWEvK0dCWFo2N0ZNeE5rNEpDTGRwQ0FGZEJmVkVySHZj?=
 =?utf-8?B?NUVyMUxhNDlOSENaTHk5WkdqL0FQVmVFakxwdE5pN0hYVVNSVmlRVTRJYy93?=
 =?utf-8?B?MlI0QmZiaVBrTHByK1lzeElVY0lSb084eERBc3lISVJvS0NhbGpUUXF5dWoy?=
 =?utf-8?B?dEp1WFpYTE5MenJFUXNJZXViMHlVL3pLTGJ1VXB3UGNHbExja1dnWnVEWk80?=
 =?utf-8?B?NHZjOUJmNm1vNHViRnJsK1k1Y1g4YWt1OVlRVXg1aHlFVmhhazhpTjhYM0U4?=
 =?utf-8?B?MWp2NnFmVStYeitlVS9ocGtiK2VwU3VjcWdBOCtHZDBtQk1zajNNTzV0bkRK?=
 =?utf-8?B?YUUwVnNEZjJsWWFzdVY0ZEgzWk1UcWc0ek8xdUh4Ym1jMFFpcVUzbUowSFp3?=
 =?utf-8?B?ZWV1ZlNWOXJhZytCbURJOVl3aWJhbUt3WkJveXc0cThaend5a1NGeUgxVjIw?=
 =?utf-8?B?bmFMWFBHOW4va2h1TnVSL0ZLNVBvZy9BcmNiOW93Q2pGUUlvLzRMcVEySFVU?=
 =?utf-8?B?RjQvSFBoOUdLNnJ1Q0ZQaHZpRjhnOG82S0ZXL0ZqaU16cUhzSVIvTFk3VTdF?=
 =?utf-8?B?K2pndmhRSTdRT3FZaXdQa1hoaVJJM3lyWG1MNlVnQVJCMDNmT2Nsb0ovemdC?=
 =?utf-8?B?NmR0YlAvbzA3REdMMkpPUWtZdzJOK0gxWTluM2FseG41aXNnSXJ4RG5LdUZX?=
 =?utf-8?B?cVhJTm1kcTlVTnFvOWlxOVBrRnRneVpxLzhac1lIb2R6QUZOaHo4b0J1REVI?=
 =?utf-8?B?RnhpMUNCSHVIRUxOUnNSWDR1YXgwTVJ3OU5tS0JQeUNVTE1iSWRDWU9rVjlr?=
 =?utf-8?B?QWwvTlZwd3VDemVMNDRTMHdNRWxBNUlSWG5FTVFXbDJqOGNuQjl0Z0ZpOGc3?=
 =?utf-8?B?RHFKTzhWQmFaVUNoa0RxUjFRUWxuUW1qL2hJKzdJVXFDdDVISmtER3VPTjM0?=
 =?utf-8?B?aG84OWdKczlGTWVxUEJPZ1hjbG9FV0g4Z0xZamNpUlBZN1V0TkJDRzV4N1lE?=
 =?utf-8?B?bnlZWlhvaFpmNHpmVTZ1OTlaN3FvZ0Z5b3d0a1U2UGtNdFM1bVRGU2k3Z3FB?=
 =?utf-8?B?TXRFZWZPWWcybm1RU2kzMi85elNQaHJYOERteE1kNU50QWl2LzUwcHVqRjMx?=
 =?utf-8?B?UlZUbGdDMmkvUEdHdWFrSHp1MEJHZ25KZWZlMlgyUnV5QTdLSksxckwzbjJK?=
 =?utf-8?Q?2CpOs3AbBkiCD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27eed853-578c-4555-9117-08d913d1da04
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:07.7780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C9+m+liBrIy8ToO8d38g3LfgnXZbJBwV1Jds+wbhPOzg8hV03pkZJ3jPCSLcYsK8r8kXoyp+i2JMygXRqUM+6w==
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

