Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492CF3199FB
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 07:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B74806E51A;
	Fri, 12 Feb 2021 06:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A46E14C;
 Fri, 12 Feb 2021 06:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UB3NTxWul4OqNee4zQlApljyjwhtbw78Vl86iwcKkDAu8F7+i/GvVW53fq4Fy0zUiDMayU6mIEjg767sFEA0DrXp2Ry8UxehzqBxejAxEsuySrO70ailNj95ZSyxf7Dcma1HgthHvp2Hua08S7dvqTgkXCb9twmL3o2VZL8b7xKOz52lsv/evPu7181Bd6bilqPHA3A4OnvTVLCbb//wkCmDztJUb0QR0+2gk/XhofgDK8+FcbMvVLd7A5DSKcj+Lbbar2lkWg3OXeGnSaWpZP7K284rfswEILgONWPMXGAb0m3ZdZ4hnfWVLxZJZeLcUGODLFkc30mQ9uP9dmxnfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gZjfHTl7L5J01awQtY4ft8Z4BZkKfcgO4EC6GXmX3I=;
 b=aAsK4RwmouaIdgRhSeyvQFsUkVuTgGimt8kb//TDdDTLMrvxdYo5YCkmtMbLDlY/3ux98RzWza7Xn+z3tzak4ztA6Lce9D7hy8StATSPNRpzHW6Mztd2UXfwxrDM1XszVmP9jVu9ATldsnkJn0AuB/VRNUb/3h9/jruABTTaG8klsdcNnn7fddiwJLiZPqShOVbXg1gMO9fVp9twenGcsJjVhuTkwcig7SmEfisiq5itOKQrBKOXRC8HNXRg+7IG5DqUlneZIuLhQZ/uinGZv6VkgQRcEGadI3eO5OEQiZQalQ0COhqhXcO8aLF+13Ovlnz4A00yhhM0+TtqRg6qyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0gZjfHTl7L5J01awQtY4ft8Z4BZkKfcgO4EC6GXmX3I=;
 b=S0HZhVJzdI4W2XHuAyKFU9mhVyQM/hMC9v3gH/CJNYcTcmK/fy+SqnXPj6Yf/sRqmqo5qk47cXwHip4hB0R5UPe6SXtxUUK+94BkHTfg3UFpXsTGpOQZdo8vh+GxIm3KY8cjoUxjGKg2A87cYqMErgr40O0WLzIvKl41lPN3qCM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4961.namprd12.prod.outlook.com (2603:10b6:208:1c9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Fri, 12 Feb
 2021 06:40:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.028; Fri, 12 Feb 2021
 06:40:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/amdkfd: Use mmu_notifier_get
Date: Fri, 12 Feb 2021 01:40:33 -0500
Message-Id: <20210212064034.29912-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.55.211]
X-ClientProxiedBy: YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.55.211) by
 YT1PR01CA0082.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.19 via Frontend Transport; Fri, 12 Feb 2021 06:40:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb731986-1117-4b50-0583-08d8cf212462
X-MS-TrafficTypeDiagnostic: BL0PR12MB4961:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4961CB89D497A43CCD11CB63928B9@BL0PR12MB4961.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +ZO3jhLwnT1G66opjZCd6Tg5FwxLUp2Xnw6rQr4Lu4X0OVRG7QSVCPklSRpbhm9qcnbdwKZWpc05ygLUIPIk82hYfgL2EnGjDMDZWo1AM3fnK060bFAUH3PpIubPhkbfj73fq+6GAybWn1/SNvUK9aMbHQUMzp5Er30vmIPlCMdJZIye9F8fh2M5KxY+e8o1dCmHETy6VTdCcQ2VZSQCNQwsS8JItvix1fKuXtIlE8si7gD3ezwdzasI5pOPNieyvgOFHmbVrCRMT3xd2yW/vRTfhWn4lXzj1rfz3CbPvfabuw6p0kgoWl70JEN7JXiobXycrNi5Q/CIyFfuuQ4b23m/s7qnrrgjbw6xMmBWZ17zzuYVNFQYBRRhjQVOnMhLfL6XKragQT7x6/3Glp7nkni+vcyvnTayMHAbHKmn1tYz7QRZ/24vRRM5ii5Md764m/6jzT70Iip7HSVrlK9cf3S9RafF9DgVnAN7spAKnDVUQ+nA6g1tTXehcXRmZIokW9zWNgsp6XK8Ux/zCG0Iip3GzvpmmOkICMZCLBNWCvKvTH5/9RjFbtq4aNwpzykyszew3/wfy91iLHbE3hkfzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(39860400002)(396003)(346002)(6512007)(8676002)(1076003)(2906002)(26005)(186003)(316002)(16526019)(450100002)(8936002)(2616005)(6486002)(6666004)(956004)(5660300002)(6506007)(66946007)(52116002)(66476007)(66556008)(86362001)(69590400011)(36756003)(83380400001)(478600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?WIQ48MDbWj/iwKQ3piFj6fi/ipn3evgFpWJOTzIahewzd/HUB7PbgZtKLDIn?=
 =?us-ascii?Q?fzKLKhLQy8f+JMmOZEbg8eHBzhJ6T/pCLdpAxM8wUNkljSOExL9MBqLIUCSs?=
 =?us-ascii?Q?HSaly6+zI7JpSPP0UDN9Zjfch0bDh94qhlCA0nGE52XpS1lxYkuaumYFU3nb?=
 =?us-ascii?Q?FFdWXWcIu90hPNIi68GqvEaJY7ZNeE+S3pEu/MwXfqA7fQo5pN8ufM23bjbP?=
 =?us-ascii?Q?zKEHD8JqX6G3uQjcDzv+lGxR/xaq+GlLdISXZTriuXDhg1kzB5NTfrC5yUh6?=
 =?us-ascii?Q?hLlboSaW602L0U0lBWyesU20yvqj+KmBqIhvvzxEdiOUJat9/vakoAygPCzn?=
 =?us-ascii?Q?IZYnzYILz25bNiPza7dER00XZcr7Koc3L7g45rmSjRBXWQsoFzrG9/0ckfPM?=
 =?us-ascii?Q?E/sgN6PaZyA59CbqWg12Uuve63QPPYrYrNSC0TBrCfcwSq6CoLl4pDtxVE2i?=
 =?us-ascii?Q?/oF7hEiIU3l5nH7vkEtq3IBB+3QAChMQMp+3pnzQHjZ3dtoXb50ew+lynngy?=
 =?us-ascii?Q?60AHHlQ7+P8c3PdSr7BnL27Ry6Dw1YuWyL0dt+O26vpqZhM+/T1T8lP8p6y0?=
 =?us-ascii?Q?b4DhG/iDfa0UrIcKeAE5fJla4wH3fByVJAhbKmdYLrTLKGgwTGEM9D6OrQ39?=
 =?us-ascii?Q?vySnID+eVuwzbSgxnlf3uPjaLgkL/1QxCDYPlg871XccRZQhF8byYi81NDn6?=
 =?us-ascii?Q?Qhy0oh9LveMe4vJOLj0JM3VW0EKdLnPlpmJzTLI78ePHoq0NDGlwmb6wQM+9?=
 =?us-ascii?Q?AqAsL9Zdh5/kBqD7qXkXqHD5Q68CHWLuSch0N72cvOX6OfjskqC2nR+l+SUb?=
 =?us-ascii?Q?XZPe5v8jveet3u2vpolBn+H2vyXJD0v10/hoLCCwhnIUcmsh/lEuEXZeY4NM?=
 =?us-ascii?Q?bQolTe9OvjGUeBkZlO2wnvALo6DmNqr8APFazKABrznjB1wBD8E2oh5O+2Kr?=
 =?us-ascii?Q?tJHcO36eykrkdT9uI/Wx7bUnT0xt8+IUYrUPL7FgIyWDvmw7lNHjg9ziBCXv?=
 =?us-ascii?Q?FUb6jK9QkraXwDtKj/cMGQirx5Uv2CIOv2ZnR9r86HW7UZI9ZBulyzth6pWO?=
 =?us-ascii?Q?Zi22Aqr68VMMXqcT4cuIhnF8l2LsdFpWJ16yye6Jr5S9Jdp9cO+O9/GA5XBA?=
 =?us-ascii?Q?uTMiJvm8l1/261cNrEnykqGVacNWO07PUWN6zh46txIm78S93qAzn4ozSNTG?=
 =?us-ascii?Q?md0jUKketdZycvUPiXUPA0+2fY9V3/9KNBm2jn7lSyqufsr4BCzS8IT3mxlT?=
 =?us-ascii?Q?WX/DeqC6xAAEMmGzfpCpa0MEP4hLnEtE70jd0VjXtcDfYAOuePLJdPMC6OU2?=
 =?us-ascii?Q?51XlzMPyyKZk21raxXd15xWo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb731986-1117-4b50-0583-08d8cf212462
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2021 06:40:52.6529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XHYxHf6E2wNTpzsvgSJe/aqbRUaJbXWYOoJ4NfkUY2pxbyCAUjVQqWDCEvjfMNeqcnNtwzySMhUfAiq3JrbOwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4961
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We use mmu_notifier_put to free the MMU notifier. That needs to be
paired with mmu_notifier_get to work correctly. Othewrise the next patch
would cause a kernel oops.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 33 +++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 2807e1c4d59b..145cd0a17d50 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1011,6 +1011,16 @@ static void kfd_process_ref_release(struct kref *ref)
 	queue_work(kfd_process_wq, &p->release_work);
 }
 
+static struct mmu_notifier *kfd_process_alloc_notifier(struct mm_struct *mm)
+{
+	int idx = srcu_read_lock(&kfd_processes_srcu);
+	struct kfd_process *p = find_process_by_mm(mm);
+
+	srcu_read_unlock(&kfd_processes_srcu, idx);
+
+	return p ? &p->mmu_notifier : ERR_PTR(-ESRCH);
+}
+
 static void kfd_process_free_notifier(struct mmu_notifier *mn)
 {
 	kfd_unref_process(container_of(mn, struct kfd_process, mmu_notifier));
@@ -1075,6 +1085,7 @@ static void kfd_process_notifier_release(struct mmu_notifier *mn,
 
 static const struct mmu_notifier_ops kfd_process_mmu_notifier_ops = {
 	.release = kfd_process_notifier_release,
+	.alloc_notifier = kfd_process_alloc_notifier,
 	.free_notifier = kfd_process_free_notifier,
 };
 
@@ -1152,6 +1163,7 @@ static int kfd_process_device_init_cwsr_dgpu(struct kfd_process_device *pdd)
 static struct kfd_process *create_process(const struct task_struct *thread)
 {
 	struct kfd_process *process;
+	struct mmu_notifier *mn;
 	int err = -ENOMEM;
 
 	process = kzalloc(sizeof(*process), GFP_KERNEL);
@@ -1182,19 +1194,28 @@ static struct kfd_process *create_process(const struct task_struct *thread)
 	if (err != 0)
 		goto err_init_apertures;
 
-	/* Must be last, have to use release destruction after this */
-	process->mmu_notifier.ops = &kfd_process_mmu_notifier_ops;
-	err = mmu_notifier_register(&process->mmu_notifier, process->mm);
-	if (err)
+	/* alloc_notifier needs to find the process in the hash table */
+	hash_add_rcu(kfd_processes_table, &process->kfd_processes,
+			(uintptr_t)process->mm);
+
+	/* MMU notifier registration must be the last call that can fail
+	 * because after this point we cannot unwind the process creation.
+	 * After this point, mmu_notifier_put will trigger the cleanup by
+	 * dropping the last process reference in the free_notifier.
+	 */
+	mn = mmu_notifier_get(&kfd_process_mmu_notifier_ops, process->mm);
+	if (IS_ERR(mn)) {
+		err = PTR_ERR(mn);
 		goto err_register_notifier;
+	}
+	BUG_ON(mn != &process->mmu_notifier);
 
 	get_task_struct(process->lead_thread);
-	hash_add_rcu(kfd_processes_table, &process->kfd_processes,
-			(uintptr_t)process->mm);
 
 	return process;
 
 err_register_notifier:
+	hash_del_rcu(&process->kfd_processes);
 	kfd_process_free_outstanding_kfd_bos(process);
 	kfd_process_destroy_pdds(process);
 err_init_apertures:
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
