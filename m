Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 153BF38902F
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 16:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A266EDC7;
	Wed, 19 May 2021 14:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2083.outbound.protection.outlook.com [40.107.236.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C1EF6EDC5;
 Wed, 19 May 2021 14:14:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SuDomIHy+stGE6+OCgbP6SKSOKBc2l+lRtecskJxi2XZEBrZDSTzrQZEl2Dn1lfzI6zZAVZWrKkoA+wufPYPXFET6rEMbc0ARTx9fRJXzI/6A+2xO/huug+XW9/W8eRGn5r1uCca8uQS+HMBFcpJL1acKjck8gdJ75yts/b4npPkyD+2ODVYkmgPGPFZ5yGRmWMw2rRH0mS4kRjWsKe9OUlhs34s7b9+aS46cZo4XJeqVSvCUdNse4w5Q26fMPtDvSSuSfU+RZDLtUrVt6t5WA99JRynkqvU9s0hS3HgqmHk7MJTaT9XyseAAFJ4WAqDdV9+TR2KcUkF9p8ALLPOHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkh8YAcd47I8/ykU3HWoHlkx3BeqtckaqVnP1KalAew=;
 b=cDC/rW7K96CR+TwXz18lBQd7WNBvnKL1SGz1hEQL9/H1Isgv8ZVK0GapOrwRNR4XBvidKvby1E8RvqMHFsAQzBPMi6cwqTdDkjdPtP4E2uBfaniNtP4d6hmp2UHwh39wx/w1/j3ojP3kb+yWPoXDvnXQbY6lcvOeAXWDcA8ZDB6RrZuqSZshJaB1zX/RZNPjyhP+K/jedDCk1yUUtl77yppHKU/5B4bsnz28szhpI8bfl0NUahxSsZm9XQLAznYmuuyq8RMC9tZij//hfdpA40f94/Fb7cAIjo6WunVhU9CPgW6MOxILCw8rGBQ/rkyY0955tAcX076eNjJ5gdFGeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vkh8YAcd47I8/ykU3HWoHlkx3BeqtckaqVnP1KalAew=;
 b=zt62TUdNh26+V5V/f/t+XS3Zv0//J1YhGMx58eKm5Z+eKIx5ouj0bUuDoK/cCE8hMU3HdO8CVpORKLqWzsReUvz2E7yrsolvvIwM1xy5YSWidaKR9aABNgSetrQoog7ZDv7d7eEJfVR6Au2kN1JjBrO11tmsfZMxE+PCng2rbM8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4351.namprd12.prod.outlook.com (2603:10b6:806:71::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 14:14:23 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 14:14:23 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH] drm/sched: Avoid data corruptions
Date: Wed, 19 May 2021 10:14:07 -0400
Message-Id: <20210519141407.88444-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fa81de6a-e272-66cf-61d8-5bb2d0ebcb03@gmail.com>
References: <fa81de6a-e272-66cf-61d8-5bb2d0ebcb03@gmail.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3]
X-ClientProxiedBy: YT2PR01CA0011.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::16) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:1069:60ba:d67c:3ab3) by
 YT2PR01CA0011.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Wed, 19 May 2021 14:14:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65c53822-b51a-4d0f-8e5b-08d91ad06703
X-MS-TrafficTypeDiagnostic: SA0PR12MB4351:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4351D0840792EA87FDF0C17FEA2B9@SA0PR12MB4351.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:37;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zqZlqC7EhqN/w+WwhcDCLmgShc+IYjXvYKKGkhzPZLIpe0Wdns6msVTZuAmiW9buMElMN3W7BC8NoR6VswyemZeTLL5b+8yTvWkaOYiPRGyhJaMUL2iPsDiwVGfo5mHguRf77O/BuuX9G/GvSSzGr+0V0sku0L7Z64Ed13S0l1t2azGVnY/TQ2rQdyFXBsb8Z/kobXHiLaWKuMVWfLJXt4WhwqhNAi2UDjr2CyFIxWIfPJj4sQfxpRoZ/nVKUvGcB9SFRhg3eAfDBohem35TTtfHFzxYpHDAOtE3qz50tj5/yXV4nd5VDOi5ii0LuwjF3qpxY7IivuEm/uOQ0g7OB5pcsYj2gloEp4brMRuEEFzzzlttLyIEaft88EFKDNX3uv1igEa1FPKW2nNbufcHgUpE7KjQik5Lhfv/kGEwJfdwOVen0oTtngA5spmnn+at3qs/gBb9wZ871dnYvLxCfHotlqWaaCG4EvPrpq/8xyZFqc8a+1M5KznauiyUAO1vtmuihpIQxQPtVOrBB6DjfJHx+5dO48e8CQuzprcaVaN8VEdteT8K57XfUrA2u7qVPpuHO38ebru373Yb4yltOx32EuFODdjiz5JI/YeyeDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(366004)(346002)(376002)(39860400002)(16526019)(4326008)(2906002)(1076003)(2616005)(66556008)(6512007)(6636002)(478600001)(8936002)(8676002)(5660300002)(66476007)(316002)(66946007)(6486002)(36756003)(38100700002)(86362001)(6666004)(186003)(52116002)(44832011)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Y/hw76OSjfMhbzWFmmg31g+6B/5NNPU/kHA2n5ctZ0usND+GcpEHhPqzBEft?=
 =?us-ascii?Q?shUQGhXFZrsOrLki1XG0AtXtNEBwcs1hACrjf1N3xZeLoU4xlQoTIVcw3EyE?=
 =?us-ascii?Q?NytqKFYz2AGwEImnX9kopq+LPivXCwXJyVy5k+4ik+Y+ISYHNAomtjIbTqwS?=
 =?us-ascii?Q?y19/EKxtWsamXHrM5nqx+q+Dapa9H4fztasnU18KrH7csj0N74ZkmvVAMulm?=
 =?us-ascii?Q?oyalHghLKrTW4SW+K7VbYXcdsf0RF1cyzwm4JmeW4EteubpFrxH2cAyzj+1J?=
 =?us-ascii?Q?0dpMj9hxRKuhhV0GEPUa8Dqh7wMLZr7CDHD2xXLP9LXqfssiVnxhdFa5az/i?=
 =?us-ascii?Q?V/wuNpXRoNfqfnvKmYW4zJ8Ak5GCu77a9CYgto7Ofr02okDw8ujRXosI983F?=
 =?us-ascii?Q?puB3qIiqMbZbLuozE6zlta1wh4nvkUiKf/CZyUIhX7lqGVEczx2B6SrsfMwn?=
 =?us-ascii?Q?qNfxJwM3wciG+nA5B6+ViqwWhPnbGni23hmluA5JpoeTEKDP97BntcYThmrs?=
 =?us-ascii?Q?G3wD7mHgRXFJwLkSdsFIprjBftH5jp2cX0Gix3VwWZaGT834K5AEWQIVd0AH?=
 =?us-ascii?Q?WGqxub0c/60NLKfCP9hinQWoieIjqv1QFErp8mS2aDoGFxY+Nlyu0/yUPqdc?=
 =?us-ascii?Q?3ca/gt0x46Sk3Xgor4Tasum6D9mQErNIYZWy0GgGsiQAra/nK43BuDzVl7il?=
 =?us-ascii?Q?q5Adobo1y31Nm8HD5UbnjDX5AgKZay4/3JOn4PmblY3JEHFZF8kgm7zWr8mc?=
 =?us-ascii?Q?R8Va26+J6hMIoXdlPzlJLGpGoDZpEGO7ZPPBYCMHNOMBZ1kJ05nFVfPIRKSx?=
 =?us-ascii?Q?20UFcW/yyVSHYFpEm2r7sGgNSHWhMbR2sVAogcPC4DrjqSHBSSqddN7Sfb2X?=
 =?us-ascii?Q?S/JTqjm7lKQ18sl/TzaZ7GJyYNGpIUAGivn5vZaQfNXp6X124WBbG13+Jq6O?=
 =?us-ascii?Q?I1CVlxY9fkMwPWypZK9lkC5GGSsS+RyoxsoD/t6Zj7/t4pjRcLdLSNwUJczW?=
 =?us-ascii?Q?UFncs8hAnAm1SXEv2rkhCV8jzNh1iZypgFNUXZQ2jUW+idaq69AFKWIAjbG8?=
 =?us-ascii?Q?lKDiwV116okmDZ8/GQhDxTiVIg2xa0eABbioR1HEhaG/TYYTPDPFt1ByfJcB?=
 =?us-ascii?Q?FbD/3V50RiDyXXb8CfYsSwuVLjAG3M+dWFVDy69RWYSTxyWzt7fufU71CI+H?=
 =?us-ascii?Q?6coklYl9xaEpLgJ3Kcdf21LIhp//9xzGOn5YjAOzdDfYeJnBkXfRc7+e0S5l?=
 =?us-ascii?Q?hhBXtk5o09rUTvconFp5eXcKF02Dx3HomvF8Vueekh438n9CK3JUS/XnUpSy?=
 =?us-ascii?Q?dOvUoYSUZ2ZUKjR6WCD3VDO6biAXPG01zpMXz2V0dSmTfcSKO/Y/r7400Z6v?=
 =?us-ascii?Q?Ff/In94LCnv9P3JcF+yzXGykSqyX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65c53822-b51a-4d0f-8e5b-08d91ad06703
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 14:14:23.5700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XpbLoE8MgE7zbDLLIhNc+9K+TK0OdXHxantp3WzgM591rUCjov2Dp8dLWoJOjduW/CYP4D0o0FE6IkWaqClULg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4351
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

Wait for all dependencies of a job  to complete before
killing it to avoid data corruptions.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 2e93e881b65f..d5cf61972558 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -222,11 +222,16 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
+	struct dma_fence *f;
 	int r;
 
 	while ((job = to_drm_sched_job(spsc_queue_pop(&entity->job_queue)))) {
 		struct drm_sched_fence *s_fence = job->s_fence;
 
+		/* Wait for all dependencies to avoid data corruptions */
+		while ((f = job->sched->ops->dependency(job, entity)))
+			dma_fence_wait(f);
+
 		drm_sched_fence_scheduled(s_fence);
 		dma_fence_set_error(&s_fence->finished, -ESRCH);
 
-- 
2.25.1

