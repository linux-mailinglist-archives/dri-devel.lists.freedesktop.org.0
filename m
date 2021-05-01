Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9513704C6
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38656F628;
	Sat,  1 May 2021 01:58:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A716F626;
 Sat,  1 May 2021 01:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mah4WKruAGrZT2q8570QDlIltgEat2swEDoRlqXc/ZnTBWXlW37NtMD+fQ3Vj9whV8tEbyuAK56dl/T/IQAOekaINP/ZJe4F0R9w3RQB8zQsOAQP0q6omj37iNY821PCk6N51DHH6kmRXxoFQ0bwrVeFN8eX8d3wSvx8GWOWSlWkTamw6CeRzyuUs62RPLR1cOH3KApOM/xq39Xw21zZ7FnWt0iJWzKxzop8Ge87+avVM/GxPMUH9m+IeNx59KKxGEBy5lO8AHQEs5tGcMeah844DH/288ddCnHDYr7QzFIpciba+F/AU2HMd1BsL76UWk7RZiaPgN3Gq+02V1zf1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGhrWjEFxlwMUTkjxR1KzhIwJrjxhLYs9HCH12R689c=;
 b=nGPXN0CTd/m5r0H9gFVqZ8SKeX8dQJbS2iurmjK6ssqvc7DVWp1V8SJ0IKS//JHBgaUaPXQdydT6LJl4PeS1bKV+RGLPqJMMRaKF3XFYPDf/9hsALkslAkS6y3eEIyFvL8byXpMw9+VVzQRXvCfO95J9k6YJ0nxEgpi8fnso+ayqZlYcB6aACOue4R3cQSpqI/9HUbfRRlcASX/ljHJczdoRFpAetjQtQSMxq3r9tZkhj7H2HE4cTp4c4zX1blxyJkcuvjBcLOU6dZm2GqdWuiLKP9NiWNGBvLzpgTqV1Mu1YPkqh95lGIlr1jcsQy1y9VD5Ib8T5JtHHTjQxL+miQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGhrWjEFxlwMUTkjxR1KzhIwJrjxhLYs9HCH12R689c=;
 b=Fbvv/Pn/5kZppNajpJK3lFth1PxlTCa82Bywy89jvBd8C0EZKvoc+P68jRIVaSYF87SKQNgKwJkbc+HqeIpRFBu2XWdFYr3gSYu2V083zJOeIEfMglyH0apocmEG7y6VKkX5VzkEJTN8xgqxpqVjo+epwIkxBQtSV4ljkBVvVOI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (52.135.46.212) by
 MN2PR12MB4142.namprd12.prod.outlook.com (52.135.51.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25; Sat, 1 May 2021 01:58:21 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:21 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 04/17] drm/amdkfd: CRIU Implement KFD helper ioctl
Date: Fri, 30 Apr 2021 21:57:39 -0400
Message-Id: <20210501015752.888-5-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210501015752.888-1-Felix.Kuehling@amd.com>
References: <20210501015752.888-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.54.211]
X-ClientProxiedBy: YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::6) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YT1PR01CA0037.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 273b963b-dac6-433a-0ac8-08d90c4498f4
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB414288ED4499F87CC39A84B7925D9@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:132;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tlauydz1FfHjHGqe8UpSSSldvLJTEYBGLMa+gNck+BZMbhqNP2Ygv9BszpgxCff2OMhXjnYfOQ8c+uxVyRw60vdeGUXD/NAROiIu3irdK01p349Vo0z440zC2swzIlIGIVhBoA1moj9xBjVHG4NZupjONpsvmCtcmF8yjN7G1D5G/viCz7U4ecy4VsbaBCsAndgnLyZpmUcpcUwKWc3z+C+s8+C3HvtYsNje9u+7fhVQjBMXNEZ+bTgkoArW46lydwBZkoqDDfajTmqt2bfJ0tSjn5F78CBFYkfvgP4M2vB5DdGenIjELKdXhWp6jhgoEsUzLKFDWRbxBdxSGVkViNjbMVQGVef9+l6HD3vJWqsrGcgUevVoPZsjPSb9zhmYnuuZ9KyNnKyCWBp4VnORlI8FPz/fxML27rqw43P/IUJbieUcpHKd/hQvTEC+PtDfQKIFYYtI5tRgpW+gePoavWnvFV+Mh6c5aiPNAMgOdr2qifX4IIdaa+53OhjhoY9ejKpJYP4OlDERciqyIqtvAAFb3z0lRUyOo8fokNJjnbtk2LcmDRxR3mbyiWazG0iSA8ppVGruBPRHbyyCaTZpPadtgUG1BW2XmpN36GL6WeeEeNOuVWVn5uyU0QuTY8355KJA8x+hTShnpJyxDxiMTok54AXFoT0FRWZyyKhCxY+tg9eWvGr9hKgdLDM30gnX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(66556008)(6506007)(54906003)(2616005)(66946007)(66476007)(52116002)(956004)(38100700002)(6512007)(450100002)(4326008)(8676002)(8936002)(478600001)(2906002)(6486002)(86362001)(26005)(186003)(16526019)(83380400001)(5660300002)(1076003)(36756003)(6666004)(316002)(38350700002)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?2bVBZ3jrwJXOmfMZvT3qywnVIJxLElDtSwyjViLhznlSfbP01DNdVLM85Drh?=
 =?us-ascii?Q?gQBRoB0WZYVY2WTzNKLO+HXblpQ099WcRzO69HwE1eCRyHeShwS1l8lfEkm0?=
 =?us-ascii?Q?ikm0M3LLONULkV2GJSkCvjgoMUvxmV+q+iw3TSUDQTBfIbqyODiKkGhhy5xL?=
 =?us-ascii?Q?60u3xDIfTwvNq65Aef+hZeL74URR2Clr3mKGYD2R4B0uiWjzYUHhEi3yK2i6?=
 =?us-ascii?Q?QNHAq4MY8EaM3O3QFM6r/E9oawOGRolBTgBqknwaCQDmLhCB5rCySVbvW0z3?=
 =?us-ascii?Q?+O8PNgSmQaeyJyU/ZmtOGtGq+eqcQfZOA9LV0ZFCJyx97wNoWnalGQnHjB5T?=
 =?us-ascii?Q?ji4KoektA/YVZmSNrNsMv0JBzsbsy1MhTrLeg2u77FTrwoO+vESSKLFy0D85?=
 =?us-ascii?Q?Fp4Lvw4calH6x258z5MMy223vbO7tTDdxSgCMC7zbOHmLzMsF7YqwhvWU5IJ?=
 =?us-ascii?Q?QS+dBYCq4ktZCQcLVCG/bsmZf8uJVPq/hol6v2E23ojRyBF665pm2iv+noQW?=
 =?us-ascii?Q?7Vl2mB5Nqa4iVW/wQ3JenFkHtOhNQdjAztr6pdcfdqIEn6witlMR3nzfoxt8?=
 =?us-ascii?Q?PRLcxsh+bnwCVVw3/HQqzr2UatXzPMBmUTcqyBtgUPUqkgsnKrb5IOBbnsBK?=
 =?us-ascii?Q?AIaw1pvETAQgAO7/Tw2PRYsrfnhnueaNSFpAYZ4gMpkmiVwFiYiVjD+tshvk?=
 =?us-ascii?Q?VOYdIAFtRX8yoErwaAE1lQ7+BbyA3w6qHCua+/NNZLo9GElpgXRf3uz0mVPA?=
 =?us-ascii?Q?dvvEYB41C7nI6fFJBBMPRdqOkb68hr7Ibm4hG9k3A7ypBo93p5kNkw0IR2YO?=
 =?us-ascii?Q?A/8K0Y8J4GV9qzp3oWl/PxvjjMwvmLK0UFY/JWChbEoI4Y64YNUtKlp4u0Ie?=
 =?us-ascii?Q?TQuwjrP29ToDbbX85ncUZm41hXUP0oHg3wf4CPYYRHClPzXde0d2ZxIyvLHi?=
 =?us-ascii?Q?VSMjFGymUliFiWk0YRNXbwUkaPxjbo7omwZBnwdidDi8Pml8yNhZ1tD5WmiV?=
 =?us-ascii?Q?KQwmXHeCgJDGDN4kI20QUXMmHw6M8zFCqfAII3dUhZ2hwOcwbMs+H2v2rpAv?=
 =?us-ascii?Q?s7eFXFbskE2MytDT85SMebMIseocMcm61Ene/jXVM3mCzXbl6BWHYpCgnSEG?=
 =?us-ascii?Q?VdPbMYxzpI0A+YXL78I7ClvGt2jfMV1/tnCJ0iFFCkS/y4OKFLRDth8AHBOx?=
 =?us-ascii?Q?lyrO0kDAmKiM9aUsDdGvlXpC7VagEVt7K897FeeoXIFB4xdTcURzV1OO/N8N?=
 =?us-ascii?Q?PEA5DqF0q+EAX5e8GVIdycYYq5qUDazzNCCkC+I6mUid9H2KLyQ49nE1NgV4?=
 =?us-ascii?Q?UNGsE5Altb6HKODuFHvIdtOR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 273b963b-dac6-433a-0ac8-08d90c4498f4
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:21.5953 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8vI8bDgf4nRB6r/7Oxr4LLzX/hmBDfQIULh0GLH5dTz01ySPvVtfM3469CdCWpHT4xave7aptph5mrhU5k0unA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: David Yat Sin <david.yatsin@amd.com>,
 Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>

This IOCTL is expected to be called as a precursor to the actual
Checkpoint operation. This does the basic discovery into the target
process seized by CRIU and relays the information to the userspace that
utilizes it to start the Checkpoint operation via another dedicated
IOCTL.

The helper IOCTL determines the number of GPUs, buffer objects that are
associated with the target process, its process id in caller's namespace
since /proc/pid/mem interface maybe used to drain the contenets of the
discovered buffer objects in userspace and getpid returns the pid of
CRIU dumper process. Also the pid of a process inside a container might
be different than its global pid so return the ns pid.

Signed-off-by: Rajneesh Bhardwaj <rajneesh.bhardwaj@amd.com>
(cherry picked from commit b2fa92d0a8f1de51013cd6742b4996b38c285ffc)
(cherry picked from commit 8b44c466ce53162603cd8ae49624462902541a47)
Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I2c6b28fe4df7333c9faf7eb6ee86decabe475338
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 42 ++++++++++++++++++++++--
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  2 ++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 14 ++++++++
 3 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 1fa2ba34a429..6b347ce5992f 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1822,9 +1822,47 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 static int kfd_ioctl_criu_helper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
-	pr_info("Inside %s\n",__func__);
+	struct kfd_ioctl_criu_helper_args *args = data;
+	struct kgd_mem *kgd_mem;
+	u64 num_of_bos = 0;
+	int id, i = 0;
+	void *mem;
+	int ret = 0;
 
-	return 0;
+	pr_debug("Inside %s\n", __func__);
+	mutex_lock(&p->mutex);
+
+	if (!kfd_has_process_device_data(p)) {
+		pr_err("No pdd for given process\n");
+		ret = -ENODEV;
+		goto err_unlock;
+	}
+
+	/* Run over all PDDs of the process */
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		idr_for_each_entry(&pdd->alloc_idr, mem, id) {
+			if (!mem) {
+				ret = -ENOMEM;
+				goto err_unlock;
+			}
+
+			kgd_mem = (struct kgd_mem *)mem;
+			if ((uint64_t)kgd_mem->va > pdd->gpuvm_base)
+				num_of_bos++;
+		}
+	}
+
+	args->task_pid = task_pid_nr_ns(p->lead_thread,
+					task_active_pid_ns(p->lead_thread));
+	args->num_of_devices = p->n_pdds;
+	args->num_of_bos = num_of_bos;
+	dev_dbg(kfd_device, "Num of bos = %llu\n", num_of_bos);
+
+err_unlock:
+	mutex_unlock(&p->mutex);
+	return ret;
 }
 
 static int kfd_ioctl_criu_resume(struct file *filep,
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index a494d61543af..74d3eb383099 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -932,6 +932,8 @@ void *kfd_process_device_translate_handle(struct kfd_process_device *p,
 void kfd_process_device_remove_obj_handle(struct kfd_process_device *pdd,
 					int handle);
 
+bool kfd_has_process_device_data(struct kfd_process *p);
+
 /* PASIDs */
 int kfd_pasid_init(void);
 void kfd_pasid_exit(void);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 9d4f527bda7c..bc133c3789d8 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1359,6 +1359,20 @@ static int init_doorbell_bitmap(struct qcm_process_device *qpd,
 	return 0;
 }
 
+bool kfd_has_process_device_data(struct kfd_process *p)
+{
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++) {
+		struct kfd_process_device *pdd = p->pdds[i];
+
+		if (pdd)
+			return true;
+	}
+
+	return false;
+}
+
 struct kfd_process_device *kfd_get_process_device_data(struct kfd_dev *dev,
 							struct kfd_process *p)
 {
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
