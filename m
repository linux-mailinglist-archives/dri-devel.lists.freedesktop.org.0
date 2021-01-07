Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E74AC2EC88A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 04:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BBA76E400;
	Thu,  7 Jan 2021 03:02:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A066E6E3EC;
 Thu,  7 Jan 2021 03:02:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFUQ/w7U1HPuN3zFkWNjIxHkN/ESeoS88EeYwyA+qs6SCD8Wzx/Kx1BM9yK6X7XFRx4TTTZ//6wpBj06mlqsaBWxQN6eJdzG8a7/i+/CvrTojpREhW2D2H0iCxBCKmExmgVT80Hp4n3PJyDKDFKEBPakvxJ3P/Ol07hGtPIgI9psRAus8reo0xoeMPYqOb6FE9BYEqiY0Y+QRle7ANV9W3z3A5inTw2bEjxe/ayjL6qviPFU+r9XNCz6dAxhiXlqDhGwcpIbVOFTi7RoCqPajv4dbfR++OepX3O8+eLmkgV3R41sTPSuS5AiKHHS8NP5ahihgxV2YxbsKbibAWyABg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RDXtI5N1SWZc0gK/XThhinY3xUj2Pp+RIQN1qJ76tU=;
 b=gqj9ukDhBdcvsjZtY6o616yHvDfhYQbDBVrcUbymrEh5IAwOUsLLtnfbI7cPYGVqdi+TfoyNigyNmemK0LNou2x1JqI60D3SwXcaLTsgdUSP86HBa3POcJD26q7qpn1Vzi6XuaaaSilFSGN6ITFJjtZxTTHdk9WNpGLzM78ogiY2+28HrF8zaJCdLyYqJI+b5Lueo5ysJZ6mwAFN28/L1qI+6h+WosW2qTMfvlPAcshkRrDWLEWvdBpJaoSK8mhcIy5ugMPPl4tOP37LwQL1H9sw4yU4Ww/DL8XDUWdQCd6vj9tGt3EqhW6tiaRXyCfQrw6eKuPRrLq1vN+Rw7j7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4RDXtI5N1SWZc0gK/XThhinY3xUj2Pp+RIQN1qJ76tU=;
 b=ZpIvtaH2f5fIogvFFJotKPer3yI2MBJaAg449j2Gxh1uR+SDfC4NBW/jUr7lrX85HoddR2eiQ2DZLFB9fICbLJjk/roNovjY7NFo7uSmWzmWawIYhbGcjlF0MImd6ZChj7PddXkTIHlJESIKwX2SMMGOeY/fTpRlUlOm2SIZHLw=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3999.namprd12.prod.outlook.com (2603:10b6:208:158::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.24; Thu, 7 Jan
 2021 03:02:47 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::9425:559:83c0:991b%9]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 03:02:47 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 03/35] drm/amdkfd: helper to convert gpu id and idx
Date: Wed,  6 Jan 2021 22:00:55 -0500
Message-Id: <20210107030127.20393-4-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210107030127.20393-1-Felix.Kuehling@amd.com>
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::17) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Thu, 7 Jan 2021 03:02:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 7c8dea1b-5d3b-458f-0ed9-08d8b2b8b670
X-MS-TrafficTypeDiagnostic: MN2PR12MB3999:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB3999FE51B366E6B0DABB473A92AF0@MN2PR12MB3999.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wAQ7BbzWvg9mw7i9Mpd+xxSGXZ/jewa5tBsS3J8yTKeIj0zjMMvboUGcjWoazBugTn7VHZC/gE7bcYwXWMJjfM7TwqJqmFVTZZ2ebr9O0jXkGFPQCWuQ9iv/NYsvMzGBte3+IgxFHncsX4nOhTosrqAwqXBHB48kj8fVBiT60s9RLB7mO3GUlgqQOYB2lzBovWzNApQVY0XTv0gnuJ1PXJGyBIB7R92nflHH8msFwf58ezS3zm3HBIQrTkJDvAUULPYrHIEEOpjxL2caqgioQJL4UzPBTlXfhNtWbYwb+pHbtagBSAgA/x9QLsAr4NJLxzxlm/tkkgdjLpd3X/jBhsLDFneC95oR6eIDQGGWSXYJp5SXsBMqoZuELj3S9Qk2BYUpq63l19Wp8ku7c8hKgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(366004)(136003)(39860400002)(316002)(6666004)(7696005)(2616005)(956004)(8936002)(4326008)(66476007)(8676002)(478600001)(5660300002)(26005)(52116002)(1076003)(86362001)(16526019)(66946007)(450100002)(186003)(6486002)(36756003)(83380400001)(2906002)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bvpe9RtHdjGPgVnJB3RkjMJBt64LnquPBWYRLyPYQi/fQkebj3aoK7/sMkWp?=
 =?us-ascii?Q?hDtDQt8dlnEjGpwZ2OWpyYwcmPm4cpcSPmnY3gDbIhJJ+HjZIfMfVPfIEHuN?=
 =?us-ascii?Q?tl7jfdSOVI52+H1GmXIDR1OYIUfrHbkoCxBiGWSv1D3GmKg1j9aXyAtoEJky?=
 =?us-ascii?Q?keBeVOj3jm1RDLB1XJ/DKa4OEhtWiSNNm2nUVex85WrUyeh42DHNIXYEIQ65?=
 =?us-ascii?Q?sv/+Es1nrzdGZyYY3DTcH1ZAIxzl7kNzulf6MwHj+0mEn4ZF3QTyUVCpAr/w?=
 =?us-ascii?Q?/BgfMYaHUb8OxQti2oXJcHzhOZKiS6sRj79ggvOhM16gqP3FzGHTYcyhzzlX?=
 =?us-ascii?Q?tyzpxRMIUC0BYkkBoWBVHbZ8fGATfV4n6j+py9n4K7//gvKQ3RoCx0KNNgYP?=
 =?us-ascii?Q?UaXQS1UVxW7LYPnWuJeGUZDWSVo+fTN0xfo5DM9LUUizYeA8HDecoSIO+Zvr?=
 =?us-ascii?Q?yCISNIu3sMfwZ9+znvEF01SUwQIKUaebZtVFCI5FdazFCbfCd6a8MeBZMXAc?=
 =?us-ascii?Q?Fm/EteQv7Jn0zXJkhofe1yDaiAYHw3ocKRTa9qiuMBf/RBkUfeuUPjr+3OiR?=
 =?us-ascii?Q?3MHiHl9ljoDSMwe1Po+Itf54yyqFf+82/XzsRPzuOLpMTKs+iZkhdDxJNe8w?=
 =?us-ascii?Q?OX/g6V4DBdcAjvcdA+PjpuLcvkKTZczPCnE7LfTbVTaoQYjYNW1Gg3rAldUH?=
 =?us-ascii?Q?zL8CrWeU0R+ID5zJbkbHQWG0A1d4ypSy/t7u5dUnoAmTd9sMyLb+BEzXieIv?=
 =?us-ascii?Q?HlfvnsWOuhc2nLiQ5RUA+07SLTzKWjFH+SaBRqcc+nTyQLbkAiXpyx036l+7?=
 =?us-ascii?Q?ne+4TrVUZ+cpRXUDDND++8tVqUN4iOWBpzKsm1XGtlV+p25LMDxBA167ktLC?=
 =?us-ascii?Q?NWCcmDkuTt6vUySjgv8Vc3RZ7hfMGOeq9ybvblzyGRU2fb2tqgb40tRdXhBs?=
 =?us-ascii?Q?FQYgjAdeochd07ePyJsAESdEeKt6wcrZAyD84dP2DZ04xh1Nykj4NngHZzoj?=
 =?us-ascii?Q?o72V?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2021 03:02:47.6562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c8dea1b-5d3b-458f-0ed9-08d8b2b8b670
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY87tNC7H4Lsm0DlNCddduMMHuwA3umPEP6yPZ9w3OPMwYGVd6A/RZ+wI9yeVGym88bmeXLto33unVTRMyM9wA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3999
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
Cc: alex.sierra@amd.com, philip.yang@amd.com
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
index d9f8d3d48aac..4ef8804adcf5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -837,6 +837,11 @@ struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *);
 struct kfd_process *kfd_lookup_process_by_pasid(unsigned int pasid);
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
index 031e752e3154..7396f3a6d0ee 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1561,6 +1561,36 @@ int kfd_process_restore_queues(struct kfd_process *p)
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
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
