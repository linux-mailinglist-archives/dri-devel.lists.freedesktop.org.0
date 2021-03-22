Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34813343F07
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 12:08:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B34006E0F5;
	Mon, 22 Mar 2021 11:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A6389870;
 Mon, 22 Mar 2021 11:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjB0RLe9KSoH2zPw+wFc1XfOF7GyJhvcksKKedcFzcmo2jKgslBOXTnHVLKLgTD8bm6EFEKLOy8F4uyeyQXdxwX0Gd+MCQmDypz9Xl3SvDP0NkmuyjV7YmVGPsiSfcXh4QJWV1Nhk0Jzh6BLL2n6qv/bA7u8SJjYW+2imwSuu7FDheYW4G5Znd99tsuZ6fcmJ5LSsQ3QxPGbDgYzsAhjcwgrrk+Yn9UwYVwoPknZMYfJVEbC6vj9RvqVviw6JUwbvdaiT4cgdkjq1N5KzLae5FcUWTlVvcSyZDOVEvobb6iLQBi1rHPVpnx0qi+vr8pA0MGA667QVUhOgGMlsdE7gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWWi/VnipnSDWK3fAmbYzAeXH/H0Ojj6KZberR1F9zI=;
 b=VlEIUAzUbAzEjFJoq+xb3khfoKmvW2ciPnwikfEatlmXJ5ZlIPXnoSZkpCm6hNjLOZ+0pfre6nsPhr8QUddwOIq9I+F2JZbLXjrAijH8TxbQIT1Rv8hGbkQCLkBbK6brgqmHcQu5ds9ijX2gpK5fOPXo1pXjPY5IFYZixyevh7X5Ky9YB8hQ1+IrNiFy7dwNgwKMA0xENfWTu3pka4HvG6Eff+oHO5uaAkLfSAm+j/BZ/35etOfunmAkJiUAMg84rHFPPsKYQVWoWz2EsNUbjbaekK18dMH9xCYbTgGixZhP01UphkjiFWWF/m1vdTC2wVrRIWzPBx88KXSDGCKUkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWWi/VnipnSDWK3fAmbYzAeXH/H0Ojj6KZberR1F9zI=;
 b=GwEkNMcqYOz6h2nq/V0A8zLh9TNIty1ROCsg6a6UPcwMadCtjrgpbzO35c7/WXxgP/dTQ+3xOP6CgpLkC3JfX3fuse8mcCln4L7k3vVbmIvlBtb7WxdnNYlY/yPNlHPFghyigeiERUS1/DccD6TwostEk25RHMH7Dshv4565SWM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3935.namprd12.prod.outlook.com (2603:10b6:208:168::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Mon, 22 Mar
 2021 11:07:30 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%5]) with mapi id 15.20.3933.036; Mon, 22 Mar 2021
 11:07:30 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 02/44] drm/amdkfd: helper to convert gpu id and idx
Date: Mon, 22 Mar 2021 06:58:18 -0400
Message-Id: <20210322105900.14068-3-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210322105900.14068-1-Felix.Kuehling@amd.com>
References: <20210322105900.14068-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::21) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0008.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.24 via Frontend
 Transport; Mon, 22 Mar 2021 11:07:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8246a4ea-3fe2-4460-87c3-08d8ed22af85
X-MS-TrafficTypeDiagnostic: MN2PR12MB3935:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB393545C67B71472AC70B0FAE92659@MN2PR12MB3935.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IuM0WuU6oaEbRyiwrUI4t+MJFV1XeZ4U/vhNuAhmSehruF6fRqGUR7B9q0GRgGQyx2/p2I3PW+9+XYrIO0rOqJlHT/yC60jiOusgb9sGZ7UOHz0fAqURAp1kC4pNfaNx5CNUzFgTabO0VDU1pZl1+tMtEljWVjyr0MxgWRTjptprDBoGEyMILmRjS6Iraqu1r1QZAouX+JLvg5MEvrX5u4JpGIZ8aZgzkLIsmQwaawvnTjh1b5ZYkBQFTQrTPtNm+OzpNqgckY3LEQ5zBFBXwZhvtYiNLJKe6naRkQWfHImIIkbXkwGb6JKSaednjh2ky0fgbYfMwlkDOdtGyan2Id2l+GL2FLL3Nmykx0+W7YIAduIu6+uVF/nXAKm2Vuv9L/yn2NbrQ9VMEe0J5b1wAG4+YZYhBwMbMpnWSRyX4fEm0qQ34ARgdxBzD41ezUDDFKWj6IapV6GakExcIcp6SY2WuP3RUg8/C0ePaOJM/bFlMWQSrHNNKJ+b1sKU+EU+qCfZaM5VE17w6VUvLdIXmIvXEeDHKVObeZwhuvWLpjSMEEj6Fmgs9uehEPbzcUsaSf8yxl5bHObMvPuLWW4XE8MwMUWaq+SWA8q9AvMPfirsM+k2Azw4KO3HnzGz21SfxwVpmPHpteyVye6xpSorB4MYxQlYzPTDLnNRe5CN3Rg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(5660300002)(8936002)(450100002)(6486002)(478600001)(4326008)(83380400001)(1076003)(86362001)(8676002)(956004)(2906002)(36756003)(7696005)(26005)(16526019)(52116002)(186003)(316002)(66946007)(66556008)(6666004)(66476007)(2616005)(38100700001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hcFHI0A4WDU4KV+iPxSp3tvn3SfWPkSL5x9F2i5aBctjHJb3q4ltDs24Skf3?=
 =?us-ascii?Q?r5rUnKZeASAIRHK/t71TYWF0BVNvvQQ6NVUMH31X9K57RJSKRI/CW8swN3Me?=
 =?us-ascii?Q?HNnhKdFGBdVdbp71aO53iBmjo0p5duB+pLNgGYs9JuZPHb3LO9K9TO/IYYT/?=
 =?us-ascii?Q?ylHAGqqO+Mn04Zeij2O1ARDrjV3CFGHKSGviX5D1j5QV9kVejzdKGbajYOVQ?=
 =?us-ascii?Q?ctku5aT2SAYuCBUYz/LYHJOuVhQ6oOltx4xr6o0EMHch6234LJ2uc1DNIYA/?=
 =?us-ascii?Q?/xwE2zRiOjyKpetttpBiZQ/D9QsvnIhLKRn0Mx9eOg1foBXBGtslgjhH3abu?=
 =?us-ascii?Q?WFwA9A0fjXSdcxYyJULxLZdkalgejN1bszgn1x3gNkq2UlTPHccSFC/FdrEi?=
 =?us-ascii?Q?68Dz/+HH87QqneY56jgnXeWRxdhTSLc7PAPEkYa+jvaZGmgIviIkMMrV6e3u?=
 =?us-ascii?Q?d/DewrNG0IqjShwg3AiwwP95AHzBowdE/ymFUNa7+l0lbxICoHhrGtgKuVCe?=
 =?us-ascii?Q?Txr9EOBlKtbxnjUMayTcgm3xFAUcQDcsn7AO61HgQ/rn8fOPKMB6xboeQx/m?=
 =?us-ascii?Q?l0BMqy+Xqm1Af+BBAkINoo+thYkYNiXz07WCXbe2y1aAXyxqDDxVzqInW84Z?=
 =?us-ascii?Q?RzXT6Vrja7Z1of0BYuAzwW6zv523vCnJXd/gGBs4XN/1xu1yCikRL3hIxpwL?=
 =?us-ascii?Q?MWaZwiNrGHV0mz/8Q2VJeHMURVPJdd+wt6So5l+vFCmPQEvEGEuv26jONjnU?=
 =?us-ascii?Q?yi1YGHROTXy/iD7BiUQWyGR33vlwFC24poBHYHxKAz+4tSSjIeWNB7fgyck5?=
 =?us-ascii?Q?yHFtKYjLm0zeFjPZEvYt2TYK86ZCPnDAYwQtBy/JSVVbewunCDxM66dRsdl1?=
 =?us-ascii?Q?ojrjGMho/CFHf3FcuzcL/c75e4TbA9maFP3Y/Yl9RXE0U2kfWZgL6Acd743u?=
 =?us-ascii?Q?GY32vo5xyuqN9Okghcm6H2yZdNYs3IaJ23gFCGF+cDGD+DBPseRJHYMdzoY5?=
 =?us-ascii?Q?surf60wNmhrVyvjipo6hpDcPd5iiAM4fNv2LD3BC457vEbLiXCitpwp6mdVN?=
 =?us-ascii?Q?k2KBorZGZBvOxVnuDlkOey+Z6+Po2GYpTboCLNTHa0bcIg9aqOTDMpNiFUlN?=
 =?us-ascii?Q?BgHvCa//hQvZ/UJ4ZgAJC7mqNiWWft5gyeA5zDJx53Ol7ejhWzl7mFH25z3L?=
 =?us-ascii?Q?EGqnAvpqAp+ioUgECjtrM1m6xgTdlNG9uoDOpTZ3BZOWjI6NMCMgh+zDBncv?=
 =?us-ascii?Q?dGqH952Ag9MtoTINciMdkD1QlZU7u2CzW/Y2H1GP88ABvbe8Dgr3cH6Lk7zF?=
 =?us-ascii?Q?EZ5Cyb1gXr4pjQxSSlVLuO4G?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8246a4ea-3fe2-4460-87c3-08d8ed22af85
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2021 11:07:30.4510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +fY9aiNOVK/KCi0KxqrNECIJxP/Uav1AZEABoDJ2oK8fK//uqPlIVGxBvL7+vVS52XVEedMJeJsCbf8J/mxhtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3935
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
Cc: Alex Sierra <alex.sierra@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Sierra <alex.sierra@amd.com>

svm range uses gpu bitmap to store which GPU svm range maps to.
Application pass driver gpu id to specify GPU, the helper is needed to
convert gpu id to gpu bitmap idx.

Access through kfd_process_device pointers array from kfd_process.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    |  5 ++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 30 ++++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 33e56db14327..99b4624ef4c7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -842,6 +842,11 @@ struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
+int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
+					uint32_t gpu_idx, uint32_t *gpuid);
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+int kfd_process_device_from_gpuidx(struct kfd_process *p,
+					uint32_t gpu_idx, struct kfd_dev **gpu);
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..028ebb0deddd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1607,6 +1607,36 @@ int kfd_process_restore_queues(struct kfd_process *p)
 	return ret;
 }
 
+int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
+					uint32_t gpu_idx, uint32_t *gpuid)
+{
+	if (gpu_idx < p->n_pdds) {
+		*gpuid = p->pdds[gpu_idx]->dev->id;
+		return 0;
+	}
+	return -EINVAL;
+}
+
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id)
+{
+	int i;
+
+	for (i = 0; i < p->n_pdds; i++)
+		if (p->pdds[i] && gpu_id == p->pdds[i]->dev->id)
+			return i;
+	return -EINVAL;
+}
+
+int kfd_process_device_from_gpuidx(struct kfd_process *p,
+					uint32_t gpu_idx, struct kfd_dev **gpu)
+{
+	if (gpu_idx < p->n_pdds) {
+		*gpu = p->pdds[gpu_idx]->dev;
+		return 0;
+	}
+	return -EINVAL;
+}
+
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
