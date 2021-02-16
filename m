Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 216A231D17F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 21:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7146E0BF;
	Tue, 16 Feb 2021 20:23:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350BE89EB4;
 Tue, 16 Feb 2021 20:23:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OgiLFJGAg3x9UD+mM3fGpI2lGW+kX0nwheCCkb3sAdCKJl9GnFBob4EA82gEGUKhfrAWzD43Znka2hiJPk8gBPU7cyzgaTWicaietJrR8KKs64F6pjZGnszFkwf9y/COUkU7mIhVcEhcBzKk81gQddMM1b6V3Hvf4oMc8IuBqdKPHToV+lnOUGM/O/NBPMe8WLa/EqmsKQ+uw0kaFJzyMQOARdT3FqJzMsIsDHgtnSzucG214gDwvkXVBdTvaAbHHv7UtwNPQFCDUNiASsMNZclIqjymyiRaZoJ9A2xlC0/WbobEoG1ccnS7ta7NPlMkJ9jpv8Fnu4yTJKUs9Yql+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXMkVLVm6tAnLVzoHru/YFnQiph6LSOzTSyVP4m9yfU=;
 b=Ph/Upe2X/cpdkeVavhED1vwUXx/S8IQ0NSpYsz48j14RtxoaLJKI8G0HBrxev9rVD8rtmdjZVa518hIXznG7QmML+DTPsBLONHth6zMlTrm6Q+FPho23aJF7r8CfqtkUaxTpGimMMmJEkJvzFajZO1FGaIo84/h03hR+ECtairCfWzb8bHYZAEheH7MvvN8+Dbhr0XaDm4XLcFi3157qG3LlX/SrpzT87AnPQFKob3TYvVSu/BsYD4asqcm/fAzw0oxPvLRy78Zp36Jue5GTHqc2cLSaNUc7YBFVvVytSK2igpb90W4zxPS4pajoakSVP33Tlzep8Y1IfYK0p4DXkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXMkVLVm6tAnLVzoHru/YFnQiph6LSOzTSyVP4m9yfU=;
 b=im7yms1FyKhlGVMUmTDDjOox+HAnyjDOll4Id0CJwaa8gmZsPBaZNcUpP30nbLjEmudIhWoN0ujaPDDTzYohnHoVKKf/kimiZQrGKtAAlXxjOe5/WdCo55Fzyu+7uDUGooMju9FQuHisJF0PY9BIg9j2RO1hQT2AmNsrCXo6GcM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4391.namprd12.prod.outlook.com (2603:10b6:208:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 20:23:04 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%8]) with mapi id 15.20.3784.028; Tue, 16 Feb 2021
 20:23:04 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/amdkfd: Fix recursive lock warnings
Date: Tue, 16 Feb 2021 15:22:45 -0500
Message-Id: <20210216202245.32073-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.30.0
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::26) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0057.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3846.38 via Frontend Transport; Tue, 16 Feb 2021 20:23:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 5fee981e-008f-4e88-c2cd-08d8d2b8aa21
X-MS-TrafficTypeDiagnostic: MN2PR12MB4391:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43914D71FD98E8E47D404AA292879@MN2PR12MB4391.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4LI+H2+0nEvu42WlIjbkjUXIt7f8ObFpEx2dsLv8ZeWGnixJdAj/6JbiSIAkZ0IFgFQ57QYMnsGIk9JaXFWcL1X34pANDcUtECca/GurKh8Ud/DeYrgrG7fX/ps3paV49MLv6+8cFc+K2JpnUsrDGWar7bhHKPHmozddzIIOZh1dDBIqRsmluoYblD8marj8Ht2hRWA+vYeVmoTXiNRJLvLTUHOzV95xeUmBxeyQTUC0Rl3oaCoSJmGJFy2+ReaQYpmHGoudhtyDwTLB2get1cmVK6GXNbBFjOIc9uRCURiStWLtAQVNFuj5+N8o47AxP2FnzgEPDDA8AE3A9xMz8ZzewiQqXZKkxT+AV8/O66+vT62CDu/2NLyxQ1Sn/C60Fm5XRxrG56W/KjzpY4J6cQJVc3SACoOpQ2EyiAV71AN0328mkvpZtczcuv5I8qVvicePY6AOhJrGR4HASeN7be69GHjxZ2jGrm8Pp7dN7j4JHrERTfQRs8r4HmcinPebUSN+8XwvMfM/WMDcaSo3lw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(956004)(2616005)(5660300002)(36756003)(26005)(316002)(6486002)(66946007)(52116002)(7696005)(4326008)(2906002)(478600001)(16526019)(8936002)(1076003)(83380400001)(186003)(86362001)(6666004)(66556008)(8676002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/KJ0sNO+wJre8SwPb5fi7Y7Hp5ibvofnouDucBqBjB5Sqt3By+d/ydIpzIyw?=
 =?us-ascii?Q?FLkAFere+NhPv3bc1E/V+e2mZZX+7I4RZFxWjLpnPsmoLmhhZ6zxiGeZEcjE?=
 =?us-ascii?Q?dpNAMO4mn2kY2BbaS9D1LflWIukf8+wst6m33LxBEt2w5j1BurBrE6GZZVa4?=
 =?us-ascii?Q?cX2mXltD5sompW2DO3aHch8hWavAhSAlFPJUGygG1iOAKlOzdqJHCCkgBd45?=
 =?us-ascii?Q?qClts+f7+tGP4nLfe5/6W34lJ8v1J5hIlgnUuHBFnFDAJ93+GlX27jrsIoFV?=
 =?us-ascii?Q?lYOmpjqF7HDwBq6qdWKSvJ/3DjdL5ov5CX/+gO46AE3h5Q/sNl2B4JVZstR+?=
 =?us-ascii?Q?Ch9y4RZ4NQPcNRZmLlJcsZwmWl1F/phOnTMTeJ5pLPv7yBG5CLGbSIMg+SZ6?=
 =?us-ascii?Q?IO4JxLTstbuL3nKTQ/ns35Mi03uLrwKGzV2g/eYvGnLqcXeg5ihRftD5Q1zq?=
 =?us-ascii?Q?U2oqtqq9I6alLzFTsnOoqCQiPOLP7L9M0PV0ItX0pVSMQ1agj0nF4w+OEwRP?=
 =?us-ascii?Q?o8rjLp1wP97W4noDl4FJtQjVMoDF2qGEhJSnQr4VV6nundZnTOW2LDck8h5d?=
 =?us-ascii?Q?NkFb4FoTqIsH4KEPq8hndy18WADD5WGZEgzaZQx4zFEemuUdKM5e9YPL1F7B?=
 =?us-ascii?Q?2oQ+aKsGlgi23JAAZqbJjXo51dihfzauBIQZ+2FcRt0iiiDihIkDnj/xqY2X?=
 =?us-ascii?Q?0eeV/xYfNIRO3110XYBUYiPOopgNrTSE8jlcQeTbEmdFdAhEC71nyNnLXC2L?=
 =?us-ascii?Q?RP9TmrGT9hAvcTfmm855lN0Ha41kKQXO5Gx+ubyHVQaW0Q1p+6ac5QQEGqUI?=
 =?us-ascii?Q?4EppUXvf0FBSNpvPvqdAyWuhhKnK1WiXAvwu3EDUwlqCMj67Wzpa4D6cp1Ft?=
 =?us-ascii?Q?7CQmuRFpf0SgHM0V7WMZO1KCcxICRFLNc0LpCzS5q4xFoHH3IIqNw0YRWvqO?=
 =?us-ascii?Q?vQfDA6YBlIdCvbcaRQqhXpAX/Hhz/M24YKRlvZrm8+pxo9z3rPe6L+q+816o?=
 =?us-ascii?Q?2cq7xwkLIBnwOLJ3SpFCaZDz5SpMDWm0V+qeVGw5vfW49wajbLef9rpOpSP2?=
 =?us-ascii?Q?BLtS0Xyeivekm50wYwTSMfHXsRLrU9NkVqQjrPfPSkYX879Qa9klafIpby1m?=
 =?us-ascii?Q?7gnaU76mCOhbtsf7PAB70W+6Eic2MXyGhmdce3zm3hkCddpbOTsn8xz+z96z?=
 =?us-ascii?Q?k9yNGI+jzi2KB9jnUkrOktoiT+zI4OKb9DuTilNy6b4lGau488bp9qLU8Qq3?=
 =?us-ascii?Q?o1gS78jiPXJ3zxmBFT1u9ODzfghEYQMoKNK+xyV4fT9m8VU7C/KtqcjUg5Zp?=
 =?us-ascii?Q?K/vT1cbNQk2BnXupx5mL7Yi3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fee981e-008f-4e88-c2cd-08d8d2b8aa21
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 20:23:04.5618 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IgekU5EIiTU/ZD4on/BrdWSP2s6ckALVU2MJSvjN3Ol64a+E6GOV622I8079sy/vo1cTeWT5JsLcYDBVqZnlog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4391
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

memalloc_nofs_save/restore are no longer sufficient to prevent recursive
lock warnings when holding locks that can be taken in MMU notifiers. Use
memalloc_noreclaim_save/restore instead.

Fixes: f920e413ff9c ("mm: track mmu notifiers in fs_reclaim_acquire/release")
CC: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
index 16262e5d93f5..7351dd195274 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.h
@@ -243,11 +243,11 @@ get_sh_mem_bases_nybble_64(struct kfd_process_device *pdd)
 static inline void dqm_lock(struct device_queue_manager *dqm)
 {
 	mutex_lock(&dqm->lock_hidden);
-	dqm->saved_flags = memalloc_nofs_save();
+	dqm->saved_flags = memalloc_noreclaim_save();
 }
 static inline void dqm_unlock(struct device_queue_manager *dqm)
 {
-	memalloc_nofs_restore(dqm->saved_flags);
+	memalloc_noreclaim_restore(dqm->saved_flags);
 	mutex_unlock(&dqm->lock_hidden);
 }
 
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
