Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 370F83704E2
	for <lists+dri-devel@lfdr.de>; Sat,  1 May 2021 03:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77EBB6F63A;
	Sat,  1 May 2021 01:58:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2078.outbound.protection.outlook.com [40.107.223.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908C6F638;
 Sat,  1 May 2021 01:58:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fEh9XImaD6hhJ8Jem9HjhUrvG2q0VzECOHxis4aJUf3VfKaUGwULb3mOVLtIDONE+Q4EwGoLzIhZHPkvV3Xzs0bfIxrzVB4Mlk+6WwfIZoDkewjB4qLEtnLpTEN8FAHxz492v2HksbbNwHLMTHCX8w8xw2nHGNqhAneoEERgmNXGhf8c9RQhmkTpUQsoZTHLYFJ7tp/dmg1vWyWSpAqRzMFaV5up7dWbx6J56sWpmDFPbJdzOM/U4PJZNuU2ns+VN+Ouyb4VXQGc5+NNhgiFEnwrVBJVLa8/cqfghV7e4HCbC71bZIFo4N7gjchHCmGWhT/5umecudxpJ/3Q853vwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNSGdEVZFgWn4ZbgRkJ7NmoVBO1Q0U9W0PseUgjbgYo=;
 b=GoIkRcxiXWIGcXdeJX0jUl9MpGAH5nTtiOmGXwUNVbWqp6PVEnN7doup+YmfjYTOZW98TWQb4B85iO+Clg8gj6CywokKczPE0mdIfLiks07xSgH763Ehb/NWsNheABbeKTfVz8Vu0IES2Cutp8gerufv72L8Ke8O6Q4MfAagL8wZG2SHbKijkCBi+lounW7Kjm7Thl0gRafXFHnqe/236m3W3/ocPkxei3nIizIn7NCnVcu2Aa5YUnvaZ85XP55HTYK63RRVXeduz6FU2UFe61Eq4gZN+mJAA+W7zKMRMvgYgFEmzNChEjSeNh7G5XPQn/69T6i3EnkAeNno44NE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VNSGdEVZFgWn4ZbgRkJ7NmoVBO1Q0U9W0PseUgjbgYo=;
 b=VSsiNuqwAYtiNKiLdUJco/fxsQM13ynGoHj5yqA7HaTzIWGTeftzbNPN8jFcNf3qtehtJReDWeuH6jOhANpLr3NPiMpGyBkl4I420YCOMDMZv0zewB8+qvHuPRt/1EInYfK3LdYufy+a6ONRyflPsJuuFaLrKM5TJU/yzcMUMLs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.26; Sat, 1 May
 2021 01:58:33 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.4065.027; Sat, 1 May 2021
 01:58:33 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH 15/17] drm/amdkfd: CRIU dump and restore events
Date: Fri, 30 Apr 2021 21:57:50 -0400
Message-Id: <20210501015752.888-16-Felix.Kuehling@amd.com>
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
 15.20.4065.25 via Frontend Transport; Sat, 1 May 2021 01:58:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2829d318-edbf-4112-f38b-08d90c449fdc
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB4932F92CCC08D47F4365EBDE925D9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:87;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: YUlaOsfWbJGb3zZpb6Q4HOnLrK9nAL9qOdoDjzHrjN57cTA0gvpjIpWuamptRRAfUReDJU7TrNQJFmsAyAgRfwNYN3Lsbga2/hQ9Y4OZxi+8p6IJzgZc0vhfJKlNvA4NFizfbPitX/0QJEfAQhVTW+DxoPZrkmXzszw56GjGgYxIreAhlMaf5DNNiv44o6KILdwxmCpbgJLIoixWv0CE71JuRQT7fAXI5r9iI1niFrxp3alZnU54rXLyRofUF3qIEmRJDpN2yu6j0LIr15bgEmwFba+c9hUFfU46igUmTuMQx1u1lIgJoe1GALowzmlNZyRvjTSTWEjcM+qmeb3d1nWItFUEFrXoK0NOR4HcWWFUFRmLqNn6QN8GCeoAKbtiuIS2M/ZjlZcw1a/POuzhy6pZSSZ6bELFfHlB71tZzI/os9ZNyQGi0XiScASru7Iyp5gcT0w00qEjpODcG8MWBJNu1w9o2I/ApCKjHGElC4D1XcAY7+1D67eLSkbUtyb+seJVeSgUDB3ADXEvTh08MdBQqz56pm7/DIBXxz4ySHcEvi8EkZhxd0ug5FsHp4j0yZjtz0m2Mmtwrblry39IcvZmw52fnpQB6RxVdZ9/S9f7AJ6LlZlY3V7p1RIlIZrXDNVrol9MVhJKWbnKMbL+zEfam9mbGEvPl7CCBzetINFrWa10u/WlBxhLR7lfYbwE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(6512007)(83380400001)(38350700002)(38100700002)(478600001)(26005)(16526019)(186003)(6486002)(86362001)(4326008)(316002)(2616005)(956004)(450100002)(5660300002)(6666004)(66476007)(66556008)(52116002)(2906002)(6506007)(66946007)(8676002)(36756003)(8936002)(30864003)(1076003)(69590400013);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hZQnEDdWAmm9NLgi4NzUE7I6mYJeqGM8QQ/4bLmewNlHC5MfXnjNGzLe+Iki?=
 =?us-ascii?Q?9fYoGU2DuDGFv+bYvjKX8evmakvMVIgZ2esTTnZTbXy8YDLSt/sYi2W0JfiU?=
 =?us-ascii?Q?BVgsafInNsd+xIXOG+QIjehpZvdBkLqpCFA/SdIlQEFJ/B2HrFckPVSJuBfC?=
 =?us-ascii?Q?cgu0yXT9MyDOOcF9i6f8Z+3zebhCpvLa9QBJ9UibFDtqlBJpLMhSsjCZBgFf?=
 =?us-ascii?Q?ll2wSwnzS9Qy8pkUj2k96CIXe+U3MsVX7tVv6merzGroUblwpIJaa1jLqiTo?=
 =?us-ascii?Q?O5iPJFjLbv9pJxJheo7+tPwoMJahZVJhurlXVj6HprDxH6oDiIwtjd1OU0YV?=
 =?us-ascii?Q?2HkzF0jCRVq2CMnZ5ryucDiD9/eZYJOw3PIU6WwOg4Na5XJKoSimvxvyfc5r?=
 =?us-ascii?Q?0wuunXKPyqFLwZGFThbEi8vNfUTHVI1w7uVDcdscgaRHhMbgaPPs1Wm8CU2T?=
 =?us-ascii?Q?m+73cWtQSyXeQFhDausyEti2t6qq+NNQnMdZQTm+DtFMu0Wdzgp7uGD4L4pR?=
 =?us-ascii?Q?1lYIXkLPtAZGAJpIKghHB3kivXUXCbn/9MgOubdWOR+C9nEUGIge0Gy6rhCk?=
 =?us-ascii?Q?xi1ZZY/91AdDUlx8UkPLgnZ/RW3iXliso2iXoU6VCux9wgXHn/F5my6NRn0I?=
 =?us-ascii?Q?idOq7CPZciXvJzVssvs9eRiN8PqLAeeRus4aA8bwD7mDwnXP4m3+pcuQMwKw?=
 =?us-ascii?Q?+X3J4DN3lqCvM4CsmNjwnd9LYMgV0GUWkPL9rM7olaX+0QKlyXkSG2xg5Ff1?=
 =?us-ascii?Q?vNV0npt0b3X8Lex68OVtID6WdRHNuCNgVj/lBF+R8sgrnskZCm7x42FZO1BP?=
 =?us-ascii?Q?ewAfsuajq/IYvGtcV0vpLEJacHSIIE3DHtfII7kXisCVieIzNZiS36M4B+4m?=
 =?us-ascii?Q?L+6NsFWVWrjnWG/WEKPmcgvLaN/K49xCXr77SQ0wJQFWxecCby5ooEZpr71R?=
 =?us-ascii?Q?Pgs4FR+f1saTzxbv6ZPOj8ve2Xxiui4cvSeN1ty1ZikQwpreni1qweGYIBlr?=
 =?us-ascii?Q?PPLAEbi42wTvs05pB0KeUgcA5LKzsW1DIn9hv+pO9EkVczJbkHqTPdqwHGnp?=
 =?us-ascii?Q?AtSJpls9VmN0ODkDyG7jkTZJXx59425EUI5gIMioQMF60IPiJzp3BN89Fsog?=
 =?us-ascii?Q?TWNQFNGb+AcccqWGZVsVA8B5mCZf9iEzCOHLWaLCOBKqzVbiYbnL7v2Ikkbj?=
 =?us-ascii?Q?YpRptIfJ93CUOZMb1Rknc4VoY5DIxPOO/Wk9HuFz9zmjsnusb/zRHLHn468C?=
 =?us-ascii?Q?YOXOw3sf9NTALeE3IEDnD8BwjfO+FA2rPvCoRe8pI95/1MPBZ8yEZbOz5A/t?=
 =?us-ascii?Q?4dNx4zYVhdErDvnAClxU9La9?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2829d318-edbf-4112-f38b-08d90c449fdc
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2021 01:58:33.0874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nf+DkLuW2+pib7/C0/ejaGNShY1laK/7Hcct65FxIPJ0nG1rCP3Ja5sTO2yUxxbleTFuXE5vRHz65xwtxbaR1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: David Yat Sin <david.yatsin@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Yat Sin <david.yatsin@amd.com>

Add support to existing CRIU ioctl's to save and restore events during
criu checkpoint and restore.

Signed-off-by: David Yat Sin <david.yatsin@amd.com>
Change-Id: I1635b1fa91a81abcbd19290cb88c8ca142c390e0
---
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 185 ++++++++++++++++-------
 drivers/gpu/drm/amd/amdkfd/kfd_events.c  | 163 ++++++++++++++++----
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  11 +-
 3 files changed, 279 insertions(+), 80 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 71f734eae071..ce511b246beb 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -997,6 +997,55 @@ static int kfd_ioctl_get_process_apertures_new(struct file *filp,
 	return 0;
 }
 
+static int kmap_event_page(struct kfd_process *p, uint64_t event_page_offset)
+{
+	struct kfd_dev *kfd;
+	struct kfd_process_device *pdd;
+	void *mem, *kern_addr;
+	uint64_t size;
+	int err = 0;
+
+	if (p->signal_page) {
+		pr_err("Event page is already set\n");
+		return -EINVAL;
+	}
+
+	kfd = kfd_device_by_id(GET_GPU_ID(event_page_offset));
+	if (!kfd) {
+		pr_err("Getting device by id failed in %s\n", __func__);
+		return -EINVAL;
+	}
+
+	pdd = kfd_bind_process_to_device(kfd, p);
+	if (IS_ERR(pdd)) {
+		mutex_unlock(&p->mutex);
+		return PTR_ERR(pdd);
+	}
+
+	mem = kfd_process_device_translate_handle(pdd,
+			GET_IDR_HANDLE(event_page_offset));
+	if (!mem) {
+		pr_err("Can't find BO, offset is 0x%llx\n", event_page_offset);
+
+		mutex_unlock(&p->mutex);
+		return -EINVAL;
+	}
+
+	err = amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(kfd->kgd,
+					mem, &kern_addr, &size);
+	if (err) {
+		pr_err("Failed to map event page to kernel\n");
+		return err;
+	}
+
+	err = kfd_event_page_set(p, kern_addr, size, event_page_offset);
+	if (err) {
+		pr_err("Failed to set event page\n");
+		return err;
+	}
+	return err;
+}
+
 static int kfd_ioctl_create_event(struct file *filp, struct kfd_process *p,
 					void *data)
 {
@@ -1008,51 +1057,11 @@ static int kfd_ioctl_create_event(struct file *filp, struct kfd_process *p,
 	 * through the event_page_offset field.
 	 */
 	if (args->event_page_offset) {
-		struct kfd_dev *kfd;
-		struct kfd_process_device *pdd;
-		void *mem, *kern_addr;
-		uint64_t size;
-
-		if (p->signal_page) {
-			pr_err("Event page is already set\n");
-			return -EINVAL;
-		}
-
-		kfd = kfd_device_by_id(GET_GPU_ID(args->event_page_offset));
-		if (!kfd) {
-			pr_err("Getting device by id failed in %s\n", __func__);
-			return -EINVAL;
-		}
-
 		mutex_lock(&p->mutex);
-		pdd = kfd_bind_process_to_device(kfd, p);
-		if (IS_ERR(pdd)) {
-			err = PTR_ERR(pdd);
-			goto out_unlock;
-		}
-
-		mem = kfd_process_device_translate_handle(pdd,
-				GET_IDR_HANDLE(args->event_page_offset));
-		if (!mem) {
-			pr_err("Can't find BO, offset is 0x%llx\n",
-			       args->event_page_offset);
-			err = -EINVAL;
-			goto out_unlock;
-		}
+		err = kmap_event_page(p, args->event_page_offset);
 		mutex_unlock(&p->mutex);
-
-		err = amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(kfd->kgd,
-						mem, &kern_addr, &size);
-		if (err) {
-			pr_err("Failed to map event page to kernel\n");
-			return err;
-		}
-
-		err = kfd_event_page_set(p, kern_addr, size);
-		if (err) {
-			pr_err("Failed to set event page\n");
+		if (err)
 			return err;
-		}
 	}
 
 	err = kfd_event_create(filp, p, args->event_type,
@@ -1061,10 +1070,7 @@ static int kfd_ioctl_create_event(struct file *filp, struct kfd_process *p,
 				&args->event_page_offset,
 				&args->event_slot_index);
 
-	return err;
-
-out_unlock:
-	mutex_unlock(&p->mutex);
+	pr_debug("Created event (id:0x%08x) (%s)\n", args->event_id, __func__);
 	return err;
 }
 
@@ -2062,6 +2068,7 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 				struct kfd_process *p, void *data)
 {
 	struct kfd_ioctl_criu_dumper_args *args = data;
+	struct kfd_criu_ev_bucket *ev_buckets = NULL;
 	struct kfd_criu_bo_buckets *bo_bucket;
 	struct amdgpu_bo *dumper_bo;
 	int ret, id, index, i = 0;
@@ -2088,14 +2095,22 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 		return -EINVAL;
 	}
 
-	pr_debug("num of bos = %llu\n", args->num_of_bos);
+	pr_debug("num of bos = %llu queues = %u events = %u\n", args->num_of_bos, args->num_of_queues, args->num_of_events);
 
 	bo_bucket = kvzalloc((sizeof(struct kfd_criu_bo_buckets) *
 			     args->num_of_bos), GFP_KERNEL);
 	if (!bo_bucket)
 		return -ENOMEM;
 
-	pr_debug("num of queues = %u\n", args->num_of_queues);
+	if (args->num_of_events) {
+		ev_buckets = kvzalloc((sizeof(struct kfd_criu_ev_bucket) *
+				args->num_of_events), GFP_KERNEL);
+
+		if (!ev_buckets) {
+			ret = -ENOMEM;
+			goto clean;
+		}
+	}
 
 	mutex_lock(&p->mutex);
 
@@ -2182,6 +2197,23 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 			goto err_unlock;
 	}
 
+	/* Dump events */
+	ret = kfd_event_dump(p, &args->event_page_offset, ev_buckets,
+				args->num_of_events);
+	if (ret) {
+		pr_err("failed to dump events, ret=%d\n", ret);
+		goto err_unlock;
+	}
+	ret = copy_to_user((void __user *)args->kfd_criu_ev_buckets_ptr,
+			ev_buckets,
+			(args->num_of_events *
+			sizeof(struct kfd_criu_ev_bucket)));
+	kvfree(ev_buckets);
+	if (ret) {
+		ret = -EFAULT;
+		goto err_unlock;
+	}
+
 	ret = copy_to_user((void __user *)args->kfd_criu_bo_buckets_ptr,
 			bo_bucket,
 			(args->num_of_bos *
@@ -2195,6 +2227,8 @@ static int kfd_ioctl_criu_dumper(struct file *filep,
 err_unlock:
 	kfd_process_restore_queues(p);
 	mutex_unlock(&p->mutex);
+clean:
+	kvfree(ev_buckets);
 	pr_err("Dumper ioctl failed err:%d\n", ret);
 	return ret;
 }
@@ -2388,6 +2422,47 @@ static int criu_restore_queues(struct kfd_process *p,
 	return ret;
 }
 
+/* criu_restore_queues_events runs with the process mutex locked */
+static int criu_restore_events(struct file *filp, struct kfd_process *p,
+			struct kfd_ioctl_criu_restorer_args *args)
+{
+	int i;
+	struct kfd_criu_ev_bucket *events;
+	int ret = 0;
+
+	if (args->event_page_offset) {
+		ret = kmap_event_page(p, args->event_page_offset);
+		if (ret)
+			return ret;
+	}
+
+	if (!args->num_of_events)
+		return 0;
+
+	events = kvmalloc_array(args->num_of_events,
+				sizeof(struct kfd_criu_ev_bucket),
+				GFP_KERNEL);
+	if (!events)
+		return -ENOMEM;
+
+	ret = copy_from_user(events, (void __user *) args->kfd_criu_ev_buckets_ptr,
+			args->num_of_events * sizeof(struct kfd_criu_ev_bucket));
+
+	if (ret) {
+		ret = -EFAULT;
+		goto exit;
+	}
+
+	for (i = 0; i < args->num_of_events; i++) {
+		ret = kfd_event_restore(filp, p, &events[i]);
+		if (ret)
+			pr_err("Failed to restore event with id (%d)\n", ret);
+	}
+exit:
+	kvfree(events);
+	return ret;
+}
+
 static int kfd_ioctl_criu_restorer(struct file *filep,
 				struct kfd_process *p, void *data)
 {
@@ -2618,13 +2693,18 @@ static int kfd_ioctl_criu_restorer(struct file *filep,
 		goto err_unlock;
 	}
 
+	ret = criu_restore_events(filep, p, args);
+	if (ret) {
+		pr_err("Failed to restore events (%d)", ret);
+		err = ret;
+		goto err_unlock;
+	}
+
 	ret = copy_to_user((void __user *)args->restored_bo_array_ptr,
 			   restored_bo_offsets_arr,
 			   (args->num_of_bos * sizeof(*restored_bo_offsets_arr)));
-	if (ret) {
+	if (ret)
 		err = -EFAULT;
-		goto err_unlock;
-	}
 
 err_unlock:
 	mutex_unlock(&p->mutex);
@@ -2739,8 +2819,9 @@ static int kfd_ioctl_criu_helper(struct file *filep,
 	args->num_of_bos = num_of_bos;
 	args->num_of_queues = q_index;
 	args->queues_data_size = queues_data_size;
-	dev_dbg(kfd_device, "Num of bos = %llu\n", num_of_bos);
+	args->num_of_events = kfd_get_num_events(p);
 
+	dev_dbg(kfd_device, "Num of bos = %llu queues:%u events:%u\n", args->num_of_bos, args->num_of_queues, args->num_of_events);
 err_unlock:
 	mutex_unlock(&p->mutex);
 	return ret;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_events.c b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
index ba2c2ce0c55a..c8d5458ba2c0 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_events.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_events.c
@@ -53,9 +53,9 @@ struct kfd_signal_page {
 	uint64_t *kernel_address;
 	uint64_t __user *user_address;
 	bool need_to_free_pages;
+	uint64_t user_handle; /* Needed for CRIU dumped and restore */
 };
 
-
 static uint64_t *page_slots(struct kfd_signal_page *page)
 {
 	return page->kernel_address;
@@ -92,7 +92,8 @@ static struct kfd_signal_page *allocate_signal_page(struct kfd_process *p)
 }
 
 static int allocate_event_notification_slot(struct kfd_process *p,
-					    struct kfd_event *ev)
+					    struct kfd_event *ev,
+					    const int *restore_id)
 {
 	int id;
 
@@ -104,14 +105,19 @@ static int allocate_event_notification_slot(struct kfd_process *p,
 		p->signal_mapped_size = 256*8;
 	}
 
-	/*
-	 * Compatibility with old user mode: Only use signal slots
-	 * user mode has mapped, may be less than
-	 * KFD_SIGNAL_EVENT_LIMIT. This also allows future increase
-	 * of the event limit without breaking user mode.
-	 */
-	id = idr_alloc(&p->event_idr, ev, 0, p->signal_mapped_size / 8,
-		       GFP_KERNEL);
+	if (restore_id) {
+		id = idr_alloc(&p->event_idr, ev, *restore_id, *restore_id + 1,
+				GFP_KERNEL);
+	} else {
+		/*
+		 * Compatibility with old user mode: Only use signal slots
+		 * user mode has mapped, may be less than
+		 * KFD_SIGNAL_EVENT_LIMIT. This also allows future increase
+		 * of the event limit without breaking user mode.
+		 */
+		id = idr_alloc(&p->event_idr, ev, 0, p->signal_mapped_size / 8,
+				GFP_KERNEL);
+	}
 	if (id < 0)
 		return id;
 
@@ -178,9 +184,8 @@ static struct kfd_event *lookup_signaled_event_by_partial_id(
 	return ev;
 }
 
-static int create_signal_event(struct file *devkfd,
-				struct kfd_process *p,
-				struct kfd_event *ev)
+static int create_signal_event(struct file *devkfd, struct kfd_process *p,
+				struct kfd_event *ev, const int *restore_id)
 {
 	int ret;
 
@@ -193,7 +198,7 @@ static int create_signal_event(struct file *devkfd,
 		return -ENOSPC;
 	}
 
-	ret = allocate_event_notification_slot(p, ev);
+	ret = allocate_event_notification_slot(p, ev, restore_id);
 	if (ret) {
 		pr_warn("Signal event wasn't created because out of kernel memory\n");
 		return ret;
@@ -209,16 +214,21 @@ static int create_signal_event(struct file *devkfd,
 	return 0;
 }
 
-static int create_other_event(struct kfd_process *p, struct kfd_event *ev)
+static int create_other_event(struct kfd_process *p, struct kfd_event *ev, const int *restore_id)
 {
-	/* Cast KFD_LAST_NONSIGNAL_EVENT to uint32_t. This allows an
-	 * intentional integer overflow to -1 without a compiler
-	 * warning. idr_alloc treats a negative value as "maximum
-	 * signed integer".
-	 */
-	int id = idr_alloc(&p->event_idr, ev, KFD_FIRST_NONSIGNAL_EVENT_ID,
-			   (uint32_t)KFD_LAST_NONSIGNAL_EVENT_ID + 1,
-			   GFP_KERNEL);
+	int id;
+	if (restore_id)
+		id = idr_alloc(&p->event_idr, ev, *restore_id, *restore_id + 1,
+			GFP_KERNEL);
+	else
+		/* Cast KFD_LAST_NONSIGNAL_EVENT to uint32_t. This allows an
+		 * intentional integer overflow to -1 without a compiler
+		 * warning. idr_alloc treats a negative value as "maximum
+		 * signed integer".
+		 */
+		id = idr_alloc(&p->event_idr, ev, KFD_FIRST_NONSIGNAL_EVENT_ID,
+				(uint32_t)KFD_LAST_NONSIGNAL_EVENT_ID + 1,
+				GFP_KERNEL);
 
 	if (id < 0)
 		return id;
@@ -296,7 +306,7 @@ static bool event_can_be_cpu_signaled(const struct kfd_event *ev)
 }
 
 int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
-		       uint64_t size)
+		       uint64_t size, uint64_t user_handle)
 {
 	struct kfd_signal_page *page;
 
@@ -315,7 +325,7 @@ int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
 
 	p->signal_page = page;
 	p->signal_mapped_size = size;
-
+	p->signal_page->user_handle = user_handle;
 	return 0;
 }
 
@@ -343,14 +353,14 @@ int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 	switch (event_type) {
 	case KFD_EVENT_TYPE_SIGNAL:
 	case KFD_EVENT_TYPE_DEBUG:
-		ret = create_signal_event(devkfd, p, ev);
+		ret = create_signal_event(devkfd, p, ev, NULL);
 		if (!ret) {
 			*event_page_offset = KFD_MMAP_TYPE_EVENTS;
 			*event_slot_index = ev->event_id;
 		}
 		break;
 	default:
-		ret = create_other_event(p, ev);
+		ret = create_other_event(p, ev, NULL);
 		break;
 	}
 
@@ -366,6 +376,105 @@ int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 	return ret;
 }
 
+int kfd_event_restore(struct file *devkfd, struct kfd_process *p,
+		     struct kfd_criu_ev_bucket *restore_ev)
+{
+	int ret = 0;
+	struct kfd_event *ev = kzalloc(sizeof(*ev), GFP_KERNEL);
+
+	if (!ev)
+		return -ENOMEM;
+
+	ev->type = restore_ev->type;
+	ev->auto_reset = restore_ev->auto_reset;
+	ev->signaled = restore_ev->signaled;
+
+	init_waitqueue_head(&ev->wq);
+
+	mutex_lock(&p->event_mutex);
+	switch (ev->type) {
+	case KFD_EVENT_TYPE_SIGNAL:
+	case KFD_EVENT_TYPE_DEBUG:
+		ret = create_signal_event(devkfd, p, ev, &restore_ev->event_id);
+		break;
+	case KFD_EVENT_TYPE_MEMORY:
+		memcpy(&ev->memory_exception_data,
+			&restore_ev->memory_exception_data,
+			sizeof(struct kfd_hsa_memory_exception_data));
+
+		ret = create_other_event(p, ev, &restore_ev->event_id);
+		break;
+	case KFD_EVENT_TYPE_HW_EXCEPTION:
+		memcpy(&ev->hw_exception_data,
+			&restore_ev->hw_exception_data,
+			sizeof(struct kfd_hsa_hw_exception_data));
+
+		ret = create_other_event(p, ev, &restore_ev->event_id);
+		break;
+	}
+
+	if (ret)
+		kfree(ev);
+
+	mutex_unlock(&p->event_mutex);
+
+	return ret;
+}
+
+int kfd_event_dump(struct kfd_process *p, uint64_t *user_handle,
+			struct kfd_criu_ev_bucket *ev_buckets,
+			uint32_t num_events)
+{
+	struct kfd_event *ev;
+	uint32_t ev_id;
+	int i = 0;
+
+	*user_handle = 0;
+
+	if (p->signal_page)
+		*user_handle = p->signal_page->user_handle;
+
+	idr_for_each_entry(&p->event_idr, ev, ev_id) {
+		if (i >= num_events) {
+			pr_err("Number of events exceeds number allocated\n");
+			return -ENOMEM;
+		}
+
+		ev_buckets[i].event_id = ev->event_id;
+		ev_buckets[i].auto_reset = ev->auto_reset;
+		ev_buckets[i].type = ev->type;
+		ev_buckets[i].signaled = ev->signaled;
+
+		if (ev_buckets[i].type == KFD_EVENT_TYPE_MEMORY) {
+			memcpy(&ev_buckets[i].memory_exception_data,
+				&ev->memory_exception_data,
+				sizeof(struct kfd_hsa_memory_exception_data));
+
+		} else if (ev_buckets[i].type == KFD_EVENT_TYPE_HW_EXCEPTION) {
+			memcpy(&ev_buckets[i].hw_exception_data,
+				&ev->hw_exception_data,
+				sizeof(struct kfd_hsa_hw_exception_data));
+		}
+		pr_debug("Dumped event[%d] id = 0x%08x auto_reset = %x type = %x signaled = %x\n",
+			i, ev_buckets[i].event_id, ev_buckets[i].auto_reset,
+			ev_buckets[i].type, ev_buckets[i].signaled);
+		i++;
+	}
+	return 0;
+}
+
+int kfd_get_num_events(struct kfd_process *p)
+{
+	struct kfd_event *ev;
+	uint32_t id;
+	u32 num_events = 0;
+
+	idr_for_each_entry(&p->event_idr, ev, id)
+		num_events++;
+
+	return num_events++;
+}
+
 /* Assumes that p is current. */
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id)
 {
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 3ebca0a4e046..d3265860e78b 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -1190,11 +1190,20 @@ void kfd_signal_hw_exception_event(u32 pasid);
 int kfd_set_event(struct kfd_process *p, uint32_t event_id);
 int kfd_reset_event(struct kfd_process *p, uint32_t event_id);
 int kfd_event_page_set(struct kfd_process *p, void *kernel_address,
-		       uint64_t size);
+		       uint64_t size, uint64_t user_handle);
+
 int kfd_event_create(struct file *devkfd, struct kfd_process *p,
 		     uint32_t event_type, bool auto_reset, uint32_t node_id,
 		     uint32_t *event_id, uint32_t *event_trigger_data,
 		     uint64_t *event_page_offset, uint32_t *event_slot_index);
+
+int kfd_event_restore(struct file *devkfd, struct kfd_process *p,
+		     struct kfd_criu_ev_bucket *restore_ev);
+
+int kfd_event_dump(struct kfd_process *p, uint64_t *user_handle,
+		    struct kfd_criu_ev_bucket *ev_buckets, uint32_t num_events);
+
+int kfd_get_num_events(struct kfd_process *p);
 int kfd_event_destroy(struct kfd_process *p, uint32_t event_id);
 
 void kfd_signal_vm_fault_event(struct kfd_dev *dev, u32 pasid,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
