Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983B02311AD
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 20:27:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88A86E233;
	Tue, 28 Jul 2020 18:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2041.outbound.protection.outlook.com [40.107.244.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6C986E154;
 Tue, 28 Jul 2020 18:27:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fif0YAqk4Mev2v01dTcschw+tmsNGMtkFBkOwmHXvGv498qp8bUxkAillEQ9OPBX2Okho7Ug2Y+YrFpSquzeGlZIs/BWs8L+m4cpcE8IiHSat7eQqg20mrggPW+U0K3sNZg1pE84UZUpMJhoJLPaG672cdy3xXlYR1v8J/Y/dhj4kkjw5ih85j6jZDkg7w5WsI5IsfnYMdTMqxUyZs9aGVfwfz2n2aqs1PSi75hCng8LoL5MlnTAd9FWb2373EMbWAuIT1bv9xiIN46L1irjfcBzAl3h7wuXP7DUIj51UOw06PdMThXSQXNCEKYxRjkBspRj4SxdGHGx8xbwj3U2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj76NlbQtHa5GnOgWFLbcC9Z4E/GrwaORMJ/bC2UTpU=;
 b=Rt/k8heobZvXJhojdRVKhYeiOHgwlKowNjcKuBkF9iCR/RM1uau7gVqSx52v1lIksaJwiIYdEwnKQxs9OaF1jEkkXjmDOychVKIr/IzJYOkzW0V4Kv2abi+BP45MYGfOv28UJzf+OLJrmiNS4rhOwnrDiVQNDP8NqXvSRJrX44wrk7/bkSZTl01dlf3aJxG2JQKASjkDwfiPbtjrBJpzpp2xeA3ZJjckbRgeGiWGs/R6DjIsJi+UHRTh+JFV05t7QAsteyjt5M3wCDB+623/Ic1wDWJ1xtu29m9YuOft+i2hNBb98KMCOhmeXt51SH8AnxUXTwuIexTv+rof49DupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj76NlbQtHa5GnOgWFLbcC9Z4E/GrwaORMJ/bC2UTpU=;
 b=XiKZSThCW28X7CZ8YW3fr22bqA0mjslErdcT6UpiMHCMF0++nb3Zl73UChiNJcZUQAeiri4W8hE8h+/mHjeCnoHu291dvtDwE8miAi539llX9yBhdaWIB1DjXZtqrr16teWI1py9jjFet4Qv5/7fOS6ee+AhCjtjHEPWloyIcAQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2414.namprd12.prod.outlook.com (2603:10b6:802:2e::31)
 by SA0PR12MB4446.namprd12.prod.outlook.com (2603:10b6:806:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22; Tue, 28 Jul
 2020 18:27:37 +0000
Received: from SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d]) by SN1PR12MB2414.namprd12.prod.outlook.com
 ([fe80::5d1d:887c:3ba6:1d0d%7]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 18:27:37 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/ttm: fix offset in VMAs with a pg_offs in
 ttm_bo_vm_access
Date: Tue, 28 Jul 2020 14:27:04 -0400
Message-Id: <20200728182704.1809-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::36) To SN1PR12MB2414.namprd12.prod.outlook.com
 (2603:10b6:802:2e::31)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (165.204.54.211) by
 YTOPR0101CA0059.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::36) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Tue, 28 Jul 2020 18:27:35 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [165.204.54.211]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: fc47273a-616e-4986-db09-08d83323e714
X-MS-TrafficTypeDiagnostic: SA0PR12MB4446:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4446E7FED391B3B62F7E15DE92730@SA0PR12MB4446.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LBUBws/d87h9RkT3xCs+kHyNRDsO33CuCmSn0b4KH4ibQ+/Y8UKAla/ZqiOTIT0Qv6IvnRLjN/09jl00g5OeJNpIb+9TiJgGJOs++0VIo7JkJTcLpdPOJbIk1EC5lHdkAurDD84TEAKlImveLU0ICdqZ6iVcvXDo9ZP15Z0y6wy5lwl+Bf2fMPDUAkwG8uBJJ77X5k/X3Lk/dLOwSPx5x0tXRxZIGLQBWH58h6Athp3OpJOAnhl/edgP7CsytMvtk88jqR9M6rfb+ktCxZbFA3QMr32x6yj1uFhFj4w905REVmoAKbsIXI82VSl2t/nICJuNNCZmzRT2SMYZ40hqvVKUVVy4KuQ6MTF7RjVt4khidUCDcYQdwnjqZ/9JFbHv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2414.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(316002)(478600001)(4326008)(6512007)(2906002)(8936002)(8676002)(450100002)(83380400001)(2616005)(66476007)(6486002)(66946007)(6666004)(5660300002)(26005)(16526019)(186003)(1076003)(6506007)(52116002)(956004)(36756003)(86362001)(66556008)(69590400007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: ANtRZOAMQFk5s7J+csAp3IRNWhAlFeAPfFbnbjCnqAl65GQ/pt0UL17lEVIAeNgwRRXwKw/D0WXp5IXIMyK5MG3XbrQMf8mbT79U+az6/PxaPu3gtJF0sDxwqCFENLmIZcAD2dvzHgfWHyUGxWQWnCTcbMrNEh+7sRl5Q9zUezE1SAVrwHKutocHRZYcAlXaY8ogCmFZtAGCh8l7Uo4KIeLnShRVI39v5Bam20Z3KPbMJeM1z9jQEtPxDK7ePGSsRHb8h5izmcuI/WmQ6HavicJ/gtkxgjWx8eXooWNgUT61iCwHf3h2psZVNx9QhzZDgNKk1Qtey+WGrdqUtqJfTJ3IrirPjkXA4s2VSLujOwodXGJIgH+c1QqMKY1XTLcJlcVz/GylXC6DC0s95pJnfFozua5srv1xP/ql/a85yOyaAZP0vXzxPTiLjekVZ+Br9KaDNULNO1lkrL4+HDeiPY89NdVzg30t2KAT4dOE8o24gH6QbqlN07yZy4Tcxvc+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc47273a-616e-4986-db09-08d83323e714
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2414.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2020 18:27:36.9539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YtZh1/WyKwdEM/pQ18jb8eeF+koXfl87E//z3edRKdc86kcM2dHhMU45xw+oO+iNRXQzMOxik5jyJN42/0U/jg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4446
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
Cc: laurent.morichetti@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMAs with a pg_offs that's offset from the start of the vma_node need
to adjust the offset within the BO accordingly. This matches the
offset calculation in ttm_bo_vm_fault_reserved.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Tested-by: Laurent Morichetti <laurent.morichetti@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 389128b8c4dd..60b41447bec8 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -405,8 +405,10 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write)
 {
-	unsigned long offset = (addr) - vma->vm_start;
 	struct ttm_buffer_object *bo = vma->vm_private_data;
+	unsigned long offset = (addr) - vma->vm_start +
+		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
+		 << PAGE_SHIFT);
 	int ret;
 
 	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->num_pages)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
