Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BCA35FF68
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:25:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C618E6E9AF;
	Thu, 15 Apr 2021 01:24:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC696E9A2;
 Thu, 15 Apr 2021 01:24:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YyjJ/zrOGYccC4I/xHJWyOa3W92ROJdzLZDrdnzBdwT/3rUwms255J1qokQO2Q5BNPt8GS6IL+278OsmDJsgCVY9bGO/fU8d11O8ByquYt66plx9o6BBWQA6CrwkEOKMST7mZOydOgzwTKiNLT6WTSTZrdX+aKM6oeLmRteZT0lWJC3A4pXYmusIQWRzut2F9WFlBlLmaAoc69z65pghP00blB3g+7tVlcZORF022Sbs8qOYqKa8ergvkRe6saxrup+r20E0Ryd75NWmdjvoqhrVJHPEsOZhI2bpXWccTNgCDz4T5FQrBzuIBcgfN/1/9rfR3WGssp2STTTg7NmmFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFWrXwylfGyGY2/f1e4ZWIK5tU53Lo+cUA+790MUf0s=;
 b=L/HDb85iE8ZNIahWe/3YOpStoBWV1W0ae5LXCMPQCkd3e9dVHkWhNgTWiKqh9Yj9XUf1fzz5aFAbRuAf3vBNgow8zh3bipCC0/Y7rjhjF4E/sqU5FpuiXiRLzu2dd9PP028VGcdQwJZaenlN/hVGKhFqhdK8vMQLZtfUgpP75HSelqNLBql+04p+lEObq7AyNGz697ziZ9FRa0hP4KEblsQE4sk/r9/lKWeIR/zwRIDgXTDTNM05p+GQwH+UOgvqdVS3gzNdp0gZ1ZAW9gwpw4qoDY8iTDWixQ6Gb80vf3b2ZdO8STpDAd+KNg71Ju/W8CRZ5h/f/MAmX2RDwWavOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rFWrXwylfGyGY2/f1e4ZWIK5tU53Lo+cUA+790MUf0s=;
 b=YB89UqWMicMy9S6OjgAJUWRuANft/bT0RZW/lhhC/OevOjfpoV50aXIEZlpNjXGZB4zbdV0i9GpoS/NmKHSfvcGzGWn2fCV8eVbsd7TbErN+DvLaldBiDvnrCOs0a0Rkgqj+F6mgkQEjumHnaQzuhHPBJZBEwYKq+KA2aI1/iBU=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 15 Apr
 2021 01:24:06 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:06 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 23/34] drm/amdkfd: page table restore through svm API
Date: Wed, 14 Apr 2021 21:23:26 -0400
Message-Id: <20210415012337.1755-24-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dbac967-fd70-453b-7799-08d8ffad2928
X-MS-TrafficTypeDiagnostic: MN2PR12MB4208:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4208FABFE6C2F5F0DACAEB2D924D9@MN2PR12MB4208.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +EnD0wla2aL6+MPUmNkQFZ1MwMtROIREG+bWLOGmnXv3HVJ1JL+LQbaVcwC/YWS3vLxUOSM/LrxU0MCnQLlHMZlcQ2+itgqGG2q2Tz4ViAMZo6OwVlHonLeBfCybe918y2dbc9u7mRGVSAP6w4F7K51AONVq929Lx42RA/nnFGbvXEVmi21Toa/Khz2E8j0fVaP8VFwi4NTiaOei/7KoUUlwQn8zJg7r52HhlKru06GJpJMXbp7n5Bzm8mtv2OTs3ymM1tPvyuIDhsooAp6HWsEonQira1vd5uTLghmB+I0Ljo92m6lynoSgcY8V4fpGeE/5gkTEDBe7hNSc4lB6U5aopWbdZZBerUVbFQS1o1l6O0z6OUnJhU3ha78kmMHQH+PabFvAjV53UJfTewtHZESSMgD1xD6VCUdFfx3kK7nkKvcr+ZQGg9+SNeBka1+4jLoIZe+inpM5m4ibJHc+WdhLL/kHQRCVwJvaHPSIQi1wcsuj2Nr3MKZYI9u/G4sS8kCVJUYiI0m3ZCSG4z5U9uGTe9rI4IJMqk95EP+VORQq8q6TzaQyg1vjRH0WmQr9iwE3DGoj6FDShgsmVgHZfhFBXOE7kOIDhQfE2vKsCbBduIlnFxWQnc8PmbHvYGRPfCIfQNo0OkUYf3Odfs79YuOppyTcDl6RFkIVluPxoQo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(39860400002)(376002)(136003)(396003)(346002)(2906002)(8936002)(83380400001)(66556008)(8676002)(66946007)(38100700002)(186003)(86362001)(6666004)(2616005)(956004)(38350700002)(5660300002)(66476007)(7696005)(6486002)(52116002)(16526019)(36756003)(54906003)(450100002)(478600001)(4326008)(1076003)(316002)(26005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?XopyGxlCVDOE+trnM2C4jAw/f1qin7OBPm77bfPUp2KR/3Gvb1buwBH7Swct?=
 =?us-ascii?Q?4QC6+S/7E/uyriFBMK7wgbm3+1QEGeEirboVhulKCr3PkFI1gcKFolHHDaNY?=
 =?us-ascii?Q?ckEJN/V1fBEWQSvIaGbRqakssAolOR9572XGuWiwUMMRpHOKFffS9deVZk1r?=
 =?us-ascii?Q?XEyBtZsB3gxii93kExaRhdPDo9yD4x71VHdTmx9NzJjRMXchL1kQRVjiIcMk?=
 =?us-ascii?Q?OsYUClgbDWU8/pt4FtjTQnniuB2sIeuLbPto5zeHXu84eLFXASOAcULDaPSP?=
 =?us-ascii?Q?oM4v/XbSsJUrPmy/vtoQtiS1A0ChNz428FdF2cKyVupER5mi/4T2if+oKM+J?=
 =?us-ascii?Q?3I8MZVdquRV6tpcCNsMrsUcla9jHhqdZhOaPuBMywxzeNht5diOkqQLiC8ko?=
 =?us-ascii?Q?Ziyrd41McTNJ6azNt5mv5hGjf5Q9WhRt7z//cn7bgZnoZnQdH+zNQ1ykLErq?=
 =?us-ascii?Q?U/8d+GS+f+u0MWSYJGeuPwLp+Xknxj43xtk7UQv2JSYGY9q8GvaE5+K3Vy5K?=
 =?us-ascii?Q?+S0G7qMlc9NjeBFJ2mLRgZCIjUZfTQ9IbprZx/oCQv4SmPFiTiJSe+091i/n?=
 =?us-ascii?Q?W+9JFJHkxONkdgRPHMA2461RePrhq0xwwDBEfWPtCOV/8/Pij9StLTdHcQTC?=
 =?us-ascii?Q?HXMG8F+GGCHh9pbNBmWD54fSHz7suOqEGZ1Os5yR5m5IBp10rx0ZTm0KpDgO?=
 =?us-ascii?Q?J12OW6VjcXhY0T7JdauqoQIG/L5+9yNBw/GqwthOwwsT1GP2cj7DqfmcwOcc?=
 =?us-ascii?Q?JHgoij4SDYohGhS9VA6PUc9v1P7SvNDtaJO1rN2OtIOyk1UTotdx3uEkS+xi?=
 =?us-ascii?Q?SzOn80s/6RXH/nGx23U4M76hwRwZnRvNMpYshdNnTvYzHvQ7VXV7EbXzvjjs?=
 =?us-ascii?Q?DoVbYk3CYoCirUiqTfX9JUF5bwShl+KaTJCgaPO333fqL+CaEHKNdkyQ6vpE?=
 =?us-ascii?Q?lxSkGqQhxjFin7XRH4owqKecRCnJrVnoioknP8lXPSF2AXV1s2AXTtE+Hovw?=
 =?us-ascii?Q?yRFq8d5k2gNzXUHkkPflvUA8fkpE/K8g0p2WfSbN2iTZq7AXxT7C7UmoTPSU?=
 =?us-ascii?Q?Fqf6CA5vIB6pkTFELNHd2wU0+yPKm6nd22o8KXtGcbiRuQJVF4M+AAPdB5wi?=
 =?us-ascii?Q?09lpmuCkX3znsAK6QDCBSox0ZxVJspwz+gBm1vkqMHZKriN6KrFOv5Bvm6JX?=
 =?us-ascii?Q?CFSkVdesl5gylt0aFBw77o5dZ/kFKWygIZMlLpawx3oPDoRs0NFW0fJ6/oF8?=
 =?us-ascii?Q?34hc83k3DTfLRZ2WmpE3GY42rSk7UTdu8fRrdEPTAXiuJgpuQsM7bh1Iydqc?=
 =?us-ascii?Q?vLJnm4kmBX/VrJd42ZpMCVyy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dbac967-fd70-453b-7799-08d8ffad2928
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:05.9152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kVwd6h+ifN6t9QWCtDd/oOGF8WA6/MxsmV5XKhkks60EJTomEK1DBCIVwOa+v3pQkzRs3v0Mpoy+1RzXRe0nvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Page table restore implementation in SVM API. This is called from
the fault handler at amdgpu_vm. To update page tables through
the page fault retry IH.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Signed-off-by: Philip Yang <Philip.Yang@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_svm.c | 59 ++++++++++++++++++++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_svm.h |  2 +
 2 files changed, 61 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
index 4e3156d891a2..d89c998f9aa4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
@@ -1997,6 +1997,65 @@ svm_range_from_addr(struct svm_range_list *svms, unsigned long addr,
 	return NULL;
 }
 
+int
+svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
+			uint64_t addr)
+{
+	int r = 0;
+	struct mm_struct *mm = NULL;
+	struct svm_range *prange;
+	struct svm_range_list *svms;
+	struct kfd_process *p;
+
+	p = kfd_lookup_process_by_pasid(pasid);
+	if (!p) {
+		pr_debug("kfd process not founded pasid 0x%x\n", pasid);
+		return -ESRCH;
+	}
+	if (!p->xnack_enabled) {
+		pr_debug("XNACK not enabled for pasid 0x%x\n", pasid);
+		return -EFAULT;
+	}
+	svms = &p->svms;
+
+	pr_debug("restoring svms 0x%p fault address 0x%llx\n", svms, addr);
+
+	mm = get_task_mm(p->lead_thread);
+	if (!mm) {
+		pr_debug("svms 0x%p failed to get mm\n", svms);
+		r = -ESRCH;
+		goto out;
+	}
+
+	mmap_read_lock(mm);
+	mutex_lock(&svms->lock);
+	prange = svm_range_from_addr(svms, addr, NULL);
+
+	if (!prange) {
+		pr_debug("failed to find prange svms 0x%p address [0x%llx]\n",
+			 svms, addr);
+		r = -EFAULT;
+		goto out_unlock_svms;
+	}
+
+	mutex_lock(&prange->migrate_mutex);
+
+	r = svm_range_validate_and_map(mm, prange, MAX_GPU_INSTANCE, false, false);
+	if (r)
+		pr_debug("failed %d to map svms 0x%p [0x%lx 0x%lx] to gpu\n", r,
+			 svms, prange->start, prange->last);
+
+	mutex_unlock(&prange->migrate_mutex);
+out_unlock_svms:
+	mutex_unlock(&svms->lock);
+	mmap_read_unlock(mm);
+	mmput(mm);
+out:
+	kfd_unref_process(p);
+
+	return r;
+}
+
 void svm_range_list_fini(struct kfd_process *p)
 {
 	struct svm_range *prange;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
index d88926d2855f..9a078d354cba 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.h
@@ -155,6 +155,8 @@ void svm_range_vram_node_free(struct svm_range *prange);
 int svm_range_split_by_granularity(struct kfd_process *p, struct mm_struct *mm,
 			       unsigned long addr, struct svm_range *parent,
 			       struct svm_range *prange);
+int svm_range_restore_pages(struct amdgpu_device *adev,
+			    unsigned int pasid, uint64_t addr);
 void svm_range_add_list_work(struct svm_range_list *svms,
 			     struct svm_range *prange, struct mm_struct *mm,
 			     enum svm_work_list_ops op);
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
