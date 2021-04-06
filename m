Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 013EC354A84
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 03:48:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A9D6E2B6;
	Tue,  6 Apr 2021 01:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E476E2B6;
 Tue,  6 Apr 2021 01:47:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AgNEJ6E0kECI9eQyyHlSkci+wfCK/Fqwq+RydZ99Zmu6PE5hdAfXBSFaAT+XE/05tN2OvhPKXeOVPtaW/wktY78ReN6emKQwzWLZ4OYHPRBFGfFHQkxagH/HCPQeTIt8lMxeaxASZdMGgflu3sHKc/AKOM/MM3zWgQTGuyHfMPKUE84HoXWvuc0t6RT6gim2RHy4mP0QWpyxL6u6gDaQa6p2YBC5cYI16kQLOl6qbntPDjF+70KGtvOQAXCAYpY9Ast2GFB2Z/e0TLD6IwtT00imArTmY9etDEEfuVJpD6xF9RKDH/0693KvXW4kOSNG4ZLdUQg1+zD6zn30cEBY0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAt4IvOXeDeZqWSMoGC32Z23LGRF5DjgP2ippoSlSDU=;
 b=PuFfJHb+/feJS0FcmZJHoHeXU9DvVDG+N1JQpjUZ2Fe63Kxvoeek3dmYGV1WGRD4ZJLhTzvj7U34DUR9vXVbTVy4ubxG35YIxNJwV6uCyoLr2xylBS7cBIajKr5QAlwSW6/BoAM6zeiezdUqK725OLued4GBLBkUhNYUF3LWyFgSmuyA6oSZg7okeh1OgRS+c0oEysuZ1T/LTF9PKEhUbi1AsX/L3CWRV/4F4ROHAdwwTyI52rZNlOKHOYokAm7r069WtjiwVUV2gfBKxErSDUr+3gDe4mXeIupsrsxsoMK0AT1c8J5zZbGnVxXiXuzafOwrKdXC+pshTW0OzHn4iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gAt4IvOXeDeZqWSMoGC32Z23LGRF5DjgP2ippoSlSDU=;
 b=sHTI8QqCEu8I2wnFtplUujBHxlO8LQ/PVDpx7w9k7adxMwk7cIwP8wkNtIhYtHoFuZHaLyA1qT6bK1JWI8Oly7l58KwFtNyX2iTR5coBJfmuyv2sTk5LbIlUg52Wo8ploI7f41Hbp4WG/t/PQnFCkV4WRK2ecYi9coGt32zmYfc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4159.namprd12.prod.outlook.com (2603:10b6:208:1da::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.32; Tue, 6 Apr
 2021 01:47:09 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Tue, 6 Apr 2021
 01:47:09 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 28/34] drm/amdgpu: svm bo enable_signal call condition
Date: Mon,  5 Apr 2021 21:46:23 -0400
Message-Id: <20210406014629.25141-29-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406014629.25141-1-Felix.Kuehling@amd.com>
References: <20210406014629.25141-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::10) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0071.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.32 via Frontend Transport; Tue, 6 Apr 2021 01:47:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5cc3ab95-17a5-4220-73fc-08d8f89de40b
X-MS-TrafficTypeDiagnostic: MN2PR12MB4159:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4159F79D9A258373D58009AF92769@MN2PR12MB4159.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OAtqrN1C2iGPjaw5eh3cjjbV1+VWlQII/cnyDp+T8Voph3WUfLYypX4fDdG9ALmPXC6cZsNbrnTpATng+EjIUaJwGkgWoSO2a72Z0bLUY0BOvNGzn8Vi6TA5JPm4+AgBV+jQFaHsEpHwWiafwZA4n7mNrh0wu118FSAIaDWwr30IFhV31dyeepEos/pnQ2kwmq9bmhvxfF75WvBBh9R64EmYZzsoA36Gc/uA3UcTcx7CSK0qn2a8RMneLJUqnGVnjVJ16IoPwPVvbvuMcarWboWOSjkhN8keuedZ43xj6hIVS66Xfaf8W2vbxN6iWi8LX0GHECNePkPLAUWyLoYJa3uyqKvW3Vav8ecRG3W9K8pTBwwYaJZoJpi5gywlmWdQpEWWIjd/XgpM+Ixx6UukRx4XhUygLC9maYe2tXjyPZ7sqpt7RNHfDP0YjttxVbmgj9zdEKbVlFBw7SGWKhYkwWvQwT4xLW1AIps80qk+25ih0nI2989evlyGioypU4ECLXhTWkIDTbgEYuiwawSU2EFeRvqauszkGvRm2gQY0djDbb5QA4hmwLG6CT+ox4+xV//72U67L36IVYZtSnS/S0YIi9oQi1aV0wbqUBeC+NSO34ea2P+lH4cDdHqdabBPc1AtrZJQpqT9Py6DK15N26XIAJGD2yv5544sHaxLeYDzq4n+jlMjlCUROwHccdB/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(66556008)(2906002)(66946007)(66476007)(5660300002)(8676002)(26005)(6666004)(186003)(8936002)(316002)(4326008)(83380400001)(478600001)(450100002)(52116002)(7696005)(38100700001)(36756003)(2616005)(956004)(6486002)(16526019)(38350700001)(1076003)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?/iTi9eu2LxCyFEGFNpvPrjz+xjDDSOb968qI7UR5YArpbhOsttHDzRpyWCNr?=
 =?us-ascii?Q?1RrPGRv59+GXMvdpeZDiiwZQf9iwNCekYHQp9J9hRnEtPQdOycgZQw/GRLpA?=
 =?us-ascii?Q?KgTixbp9z9B9NCVfCCptczkmFiKoNaESBxXIvbGEPa+xRMTS+doM0EbE/YlL?=
 =?us-ascii?Q?2VOKQvKifIBTY2U11S9GQYzDl+6GSwEm+tXea6w2UJUF7/Nb/6reRkUJoxYC?=
 =?us-ascii?Q?S0S9AWnXCO3zCFFXtp6W4qcDSuZgNK+GiDkcO6N7WLl+H8tDqrj280lBLc0H?=
 =?us-ascii?Q?DsKBhh6y/GzFMFGNCc9ieao9+SArrt4nHSYuMsPwsWFSMu+6U0urh2iLFPi/?=
 =?us-ascii?Q?SJ0DU7fwz2BlT+UA3l3ZeRkSrM/mAN3/xr35yaCWjbA1Jp5bjtOXSw0j2THP?=
 =?us-ascii?Q?CiHxS7qGg8bNOfbEB7t6TiDjxMtfXt8S/Ri9EbDt5av0soUoUa/YqC9al8f7?=
 =?us-ascii?Q?lRlUi5pgqKj4EW8AxPK1URAKMiUiPuUCdtIXC59nDQb9hKjI82iGSE6FH+0Q?=
 =?us-ascii?Q?LQx+xVaqUcLt4KhVxOC7Y8Auuvldw6QdnVn+R3JOSZ/aLsiu281tYlU/0tWO?=
 =?us-ascii?Q?4B/H871Ja8eanYWshXs+DAlWbNnMB34qgrZjY0IPUHe4Z/GG5Oc5rdTvVqCf?=
 =?us-ascii?Q?umtTa3gW/VqK/ignpK/zf1Ja8mlRR8sqaVDV4l5W28u+QNhzaG7Q1Y1jiS8W?=
 =?us-ascii?Q?//muSB3xrqJ9/sS/kW2bCSMV9WsvoVVi9qbZ0/SSWK3xoyH8F/0+CJwxQqKP?=
 =?us-ascii?Q?slruaqis0guEHUshKEZAUiPSQZGjAWyFBMfR+BmUBUN46q4ciWPEXvqw5KSe?=
 =?us-ascii?Q?9Nz2stvkAlNaQLH+YkuXr794o7nqZoptga/6UqLQfFzY8aCA9B7aDWIoX0WA?=
 =?us-ascii?Q?9OeHLzMy5XNDri8rD/WcTBCcV2dip5T5dJi0cHnDG60BvjX3ndUw3YSwAyze?=
 =?us-ascii?Q?Ez3xHT56dbulB8CdCCncugSjvwQdC5c2dVKoVl3wZ5c1VUJYx/m8LuhN2Fqf?=
 =?us-ascii?Q?d++JEpXsekeVhgMO1wRmJDjp/xUxb/Vpf2CcEz6ePiGMNnxRbU0mrLfFvMvA?=
 =?us-ascii?Q?0iTf9YzGQmkX78GJpL73zSxU0MGVz4AEpAO3MEnBi+wFPySSTQQDfsgijFVv?=
 =?us-ascii?Q?kVrqlK3hz+oT+tZVwOWdBF0SYJfj0d2EevXUAQNEbL23ryI02qq9O3RMK8d/?=
 =?us-ascii?Q?qVmDT1LSemS9GNviKB2xap9bErKCva2S4rV1gogHRGsXGefKHCqWQVErulpa?=
 =?us-ascii?Q?8FqvMV9FP/rlY4R5F/ubiuM7QslcTV+nkc/+ajgfajR+kEmsLMrBxecbXVRe?=
 =?us-ascii?Q?cqLP0Mek77vZ4btUn2Rudd3a?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc3ab95-17a5-4220-73fc-08d8f89de40b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 01:47:09.4107 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: haf6M//yyYWE46lA22TdqhL2jCK1z73irCeDf3uq2A1WiCws65LC3WqDV+DAsWI2VKrCOU6TJokBYflywv28JA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4159
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

[why]
To support svm bo eviction mechanism.

[how]
If the BO crated has AMDGPU_AMDKFD_CREATE_SVM_BO flag set,
enable_signal callback will be called inside amdgpu_evict_flags.
This also causes gutting of the BO by removing all placements,
so that TTM won't actually do an eviction. Instead it will discard
the memory held by the BO. This is needed for HMM migration to user
mode system memory pages.

Signed-off-by: Alex Sierra <alex.sierra@amd.com>
Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 3370c1a06bc2..95efb2670d92 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -111,6 +111,20 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
 	}
 
 	abo = ttm_to_amdgpu_bo(bo);
+	if (abo->flags & AMDGPU_AMDKFD_CREATE_SVM_BO) {
+		struct dma_fence *fence;
+		struct dma_resv *resv = &bo->base._resv;
+
+		rcu_read_lock();
+		fence = rcu_dereference(resv->fence_excl);
+		if (fence && !fence->ops->signaled)
+			dma_fence_enable_sw_signaling(fence);
+
+		placement->num_placement = 0;
+		placement->num_busy_placement = 0;
+		rcu_read_unlock();
+		return;
+	}
 	switch (bo->mem.mem_type) {
 	case AMDGPU_PL_GDS:
 	case AMDGPU_PL_GWS:
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
