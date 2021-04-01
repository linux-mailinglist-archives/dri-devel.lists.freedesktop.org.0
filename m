Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA4D1350D98
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC0D6EC1C;
	Thu,  1 Apr 2021 04:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2073.outbound.protection.outlook.com [40.107.220.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8136EC18;
 Thu,  1 Apr 2021 04:22:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7LbL5zQAV4m79YWfaMUL7qIVqnqOQ/N1+xXuhY+oYEIO90IRu2FY508vLiDsMFdHBuw3SZLsn3bjswq++1HS5n4HoQkvDakxyJ1IPPBRrug9KZCu6lytSgQaAU1oJOMhw/gIdyKErrZoiHhedPB4NrD9ELIcT7io+a5WphYErUgAIJJ+4gO1qFhVbkXzuBfTVCh/shcM9FvMBDSMkNyIJWwjZQsLtqmsD2iMmMYON2deFlvEJW9IfinAqrp9n7ZxALUoERQf+DN27ZVkDo56Y45eIntspqtIScFOv98Wng87OPSkD4ZuUG7mep8gwGY0nfn4FF5B8C8I9e7id2T6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcQ2cLghZ9QXwlqh9x8GqtvoTL1CamAVjFh8wdUJr0s=;
 b=DtLzcbGy/0NrzgUxJWY8k1N12AnHNKJz0rb6ELdKY+EtmxGYa8FeQtVa+CA00viVtwRFSvLrjx5YrZ34i5TtZr5Ue0eEM6jZzkThy2//OPNV/VQOaGZrW+rIxpGJI0suA+h7pFZCqxuJ9YT+HFshdtTxsiEdhIb//o23OfMBuYXUaY6iIaQjlh1jDLenNMmET7wyEWA1z8E8MJkXJ6dZqBPy7BSj2D1Z+EGrNKgyOj0AeaqO92mRS98WsSwbMyh+qcbCbJMsu0DS5wpsiwLpJAoyCONMVvTUL9pj4R4m9YUedGuJOndVVCWo2IE9vD+WIGEPRSCoFpJ+PW6Ni4HEOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AcQ2cLghZ9QXwlqh9x8GqtvoTL1CamAVjFh8wdUJr0s=;
 b=njpPVCRIsttuBCFTfXXBOdu+C6abJtKbjvVmlXVLJfyCgugzAXR5f/cxh3sE0awcHx7dDppe+8pv3sGK+NsHTaXHxDD9xUf5ixHkNhFgAXKRw2+8hHC+LjRVJMkZqb6+1r5R7klV+mOtYByq7xreEHp/W8Bm/GVzux/e3yNWwsk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:43 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:43 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 01/34] drm/amdkfd: helper to convert gpu id and idx
Date: Thu,  1 Apr 2021 00:21:55 -0400
Message-Id: <20210401042228.1423-2-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:42 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e24d880-7083-4439-e5d8-08d8f4c5cb03
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49163588B0CE701FDE788A41927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Zm7bW7yZsu8/AqyG/JGKDkEydmelDV7LUreTV/QtbVj21CkQbGwWxAuvXvEB8QLJvW+NO1gPGm1C46ShVaRVDjG92OBnRyR74ySbjVIKYEhURfzYPjXW+PZtehnIOTAYbSkvgMosLUqnKess1AZ7QabgQ8Omiac9BCvg1ePBrg28xov7zTsJUjwwDPEs9qc9BdpAgcjBwxwS4ud3M4uayzHZny4Xtv/4qwYWZzi5y61qbTsNx5UeB4wRbFc/HxOkSdMR1nFeG0C0w8u6+AgCkNsKjCy9/V5aT7dmhNqg194QOZ7SWoNpt0FqCnZh80VaKeuzefW5K4P7HtvnfxvMRjv7oOvurjNZtM1BDZmw0vL5a+lS/Zf/V5rBYBl7tFr37zy+WtMcIm0BhnIBFXwky3m4VwjkHh8kvxuQnGRV/QgaJINyK0DGSGyNvIBXfgEdAJ0EXRZxQVjvoyz1EVKYSvaR4VNcsPMNT2OlIl5d01+COiqFmPhyN2RVhym2aP+h7yBnQa6OZk3mPk4Kq0UuU3mwwDFcNZ4xGTxNw5xOgHUhLwsTimgPDezdmqR+2wLTSTQOoteeHAdjqF72O7Dx0Cu0jo16TDCF7+mX9Hv6M2XpQCsuoWGsTWXT+/fsoImlTrmyniLJntEtiCzNEgcpvVw43s/FEl5+4R45k9zmKzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Noy1XV2jGPIQWlYmcKdx9iKoNoV5qcy9Op1Mile7+dcb1fBTrhwRHBr4/B8U?=
 =?us-ascii?Q?UHkVmFoF1BDPKU3OFa4DJ3GfOo6nJEzrnpSW8g5+4gq8WgMo6L0b6mY/X9p5?=
 =?us-ascii?Q?XNTeHLIXoAV+FHXNW7BHOHIqbpqwzx8rf4rOej0qARq09jPHl+2wEun2Z9YM?=
 =?us-ascii?Q?hlM7fd5rrY+OK7rEJ5gbMgDrMfa8tghN3LPAFL/UJwAshBtTfrdBnSXcyd5h?=
 =?us-ascii?Q?Z0XUbnQChBoyOnr7YR3ydKrsGyc4UItuolborXJsryilmaoMP2NCY/w9P56j?=
 =?us-ascii?Q?EmEwQ3X8babb3FnSLW2LplxkiiLetdiiWUF1QYn2v1f6+XxF//PC54pfoSZJ?=
 =?us-ascii?Q?YehJIVJBD8T+kR69nAmiOZEqeT5l0Ef6XpHeBY77398DjWAhN/SrZwnEViK9?=
 =?us-ascii?Q?cZITz9EdJ+1Q3QmjVtIYjOco6sBLI0aUn3BjXxK1ODii+ZPx7r9B/4aYYw7S?=
 =?us-ascii?Q?I4WGEF6afJSxqymtD1ZpdHhTyC03Ovau5V0zpejpf1qaebMGw+REnaKXZ+wA?=
 =?us-ascii?Q?fPVTQXS6Nif8FcdC16BLS4W9hBxgobavINVnMjsUjmn4bTJRRrf6Gkn+rLf4?=
 =?us-ascii?Q?kRlvqRqWhIn336vTisQFiQ3rhgUy2dukHbxXUFKMS3abNGPOl2DBUJbdeNy3?=
 =?us-ascii?Q?eXZuRFAjmLF8/fk+QDYPNtNGox3FllGNPJoU1FkAdrz1E/z+tgFPXgjyUJ6p?=
 =?us-ascii?Q?ORhltQjoAJ3qF8g/n2MqlXjsZ42sz4banlXksUsF+1FfyHrOdCAfaFgczXEQ?=
 =?us-ascii?Q?cnvUUdwoezmc38Q8xjz6oJcuQ6/4tw1SpkWAT/NK8rrhUXMnuX86EwmfM0KM?=
 =?us-ascii?Q?OEnSgkMCQme5oakl9O1z37ACI1GDBPMgzwzZYKUej28UFhAa9kN+Wr7aY/PD?=
 =?us-ascii?Q?2rcwOeeRR1/VGndo6nxVBFaWXOgCEEzdXv/6PxuxK7/CCo8p7gRxHkaP0IT0?=
 =?us-ascii?Q?WD/UijerdyrHT3Fv9HMJV0pHLBt8wDTFBYdX0AVMsHJQ2zeI5EdXhVVlRQ/S?=
 =?us-ascii?Q?U/aypmDdhn9aSBwylEf+Jwmz/D8FrRl1BfiHHWG7Su/tBqKspHf90nOrSnn6?=
 =?us-ascii?Q?7WF8An54cxS0N8tk9LOhU+khXXpRktAx87mrGNbrKtCmmqUlyfu8LIrVzThZ?=
 =?us-ascii?Q?2FVX1nUH/5pGjSSLVKenF2QtI9ybz2k69o45YlYBuJdL9eeEFoFIAj1ERK0C?=
 =?us-ascii?Q?akFKdWm0KpIG/cQ+OdTWxkO2p+t3Z0bkflbqzwDWRn70kpFxPsW8bf/o/txr?=
 =?us-ascii?Q?gEpoRjEm/K/qDfx8oC3FzeON0hJLsok2SypzwJdECYAal5aqbj9sfbfvVXMa?=
 =?us-ascii?Q?6v1KNcJUY/HJ5zCgR7Wj9Oit?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e24d880-7083-4439-e5d8-08d8f4c5cb03
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:42.8373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDC0QVfhbFsym06tNS6kEuwrtTAXJlHdq76MuUlaDPfX3HkrtrHnBAibNQaEnX7pX5PCXkd+Qv5gt/i7qmxxqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h    | 11 +++++++++++
 drivers/gpu/drm/amd/amdkfd/kfd_process.c | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0b6595f7acda..17d91f05afe3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -842,6 +842,17 @@ struct kfd_process *kfd_create_process(struct file *filep);
 struct kfd_process *kfd_get_process(const struct task_struct *);
 struct kfd_process *kfd_lookup_process_by_pasid(u32 pasid);
 struct kfd_process *kfd_lookup_process_by_mm(const struct mm_struct *mm);
+
+int kfd_process_gpuidx_from_gpuid(struct kfd_process *p, uint32_t gpu_id);
+static inline int kfd_process_gpuid_from_gpuidx(struct kfd_process *p,
+				uint32_t gpuidx, uint32_t *gpuid) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx]->dev->id : -EINVAL;
+}
+static inline struct kfd_process_device *kfd_process_device_from_gpuidx(
+				struct kfd_process *p, uint32_t gpuidx) {
+	return gpuidx < p->n_pdds ? p->pdds[gpuidx] : NULL;
+}
+
 void kfd_unref_process(struct kfd_process *p);
 int kfd_process_evict_queues(struct kfd_process *p);
 int kfd_process_restore_queues(struct kfd_process *p);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..d2cd757670d2 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -1607,6 +1607,16 @@ int kfd_process_restore_queues(struct kfd_process *p)
 	return ret;
 }
 
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
 static void evict_process_worker(struct work_struct *work)
 {
 	int ret;
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
