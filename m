Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DFF35ED8F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 08:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8954C6E8E3;
	Wed, 14 Apr 2021 06:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2041.outbound.protection.outlook.com [40.107.92.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53B916E8DF;
 Wed, 14 Apr 2021 06:48:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kur9UMaaelJLOL7EzVR6RPynbpiO+MocKT7YqD28ID+JxNFQgQM3LTTDG7lNnkDB3ycnRkQeocQiLPyi9XAyPI3hFOLXa6CE88wqGh9VoOkorNt/5sqGEjf1LqZbhNrtKWEpRHyDMIMIO5T9pmUtRsauUW9hr6hzlEQBenDeC469Oz5IcmYoniHKqHBQak+wOqrGtEla3x1/cVQTmExYCcX5VV2UpoGANhbg0d7hIx9z8Kq4KsziEa1wRW4L5+F0MFuM2sYeuH2TDDjKhRxMJd65gU5PvvybkO5pW9SlAqQp7xojx22/Ro/9OO80pRwxR7jK5Avvf6t1ASEn2Gr22w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cYmo3dLmpw5Ddu0zE/rP1cYO7LSD0YBQ2wvpnQCJg=;
 b=AdAaxMZWvan3646yFPk0I9EbYetfkv7wOE+r1C5JuWAS3FQ5e+5DI7RxIv+dZufu/cIiNtPC2NTetOw74sKgGEr84Nwa7wvky1tG3sp9RCwiq0D9BSZq7jnnaWvty+pdxRQJjRVRI3SSS/hOHtGLFigHXVjK6E0DFgrYdPL0aHnZ4fPm6YlxdQ9HqgthGsEK/+nOkly0bevfzJzxIYLi8lhezHpLe3iLR8LC5k85p0LbcntVZLEu5lOnBe/e2VEQoej2eZLnhGSOKVEwqbvpj82BRmt4UJ24NPtvhDIVfm9jQz1XMXcpUE4FP1eMf8/5peIQaQ/RpKMjewaMEIHJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cYmo3dLmpw5Ddu0zE/rP1cYO7LSD0YBQ2wvpnQCJg=;
 b=K0Po7AWwV8wJ2KIfZPxu2yRC52B1iaHXtry8zkwNkfKDqgRGUhsbV5BQu94QrQzcr3WQifLCq++3MNLxjrJYL+Z/Qo73bOJ0HEIG9Nu7oc9zjaTE7Dl5ZOXKlgRMlMmEHeyijS+yk60WsoAxPDLdLBxAbTQPm25QDGpSVrzVids=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4125.namprd12.prod.outlook.com (2603:10b6:208:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21; Wed, 14 Apr
 2021 06:48:23 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Wed, 14 Apr 2021
 06:48:23 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 9/9] drm/amdgpu: Lock the attached dmabuf in unpopulate
Date: Wed, 14 Apr 2021 02:48:04 -0400
Message-Id: <20210414064804.29356-10-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414064804.29356-1-Felix.Kuehling@amd.com>
References: <20210414064804.29356-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 06:48:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9666222d-d848-4a6d-975e-08d8ff114b85
X-MS-TrafficTypeDiagnostic: MN2PR12MB4125:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4125106A056DCB477A0E4764924E9@MN2PR12MB4125.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8DBx3lVy86EW/6xeMzQ27ufKtB0VBpOmajuOpizLgkk0v1iiKiaipS0DnPaNBhPJi7Nlw10om0NNsXmMUmjAHHF3gF21hCOYNVojw5KEQqZBUJiDYOlxYHnDJebqg5T8KO0C9x+oWom6brNCrPq3TGRrcA0jRxX7M+k9LcdhvhNW1uzzxD6EB1gapho5e+KWOcON2kWOfZE5rXhIN8VH9EeGUkofR4BdhighwSTyaE8IDI1hcT2ZePfK904KGuoAm/cSiycdyFHv/tzJwirQJtndnho1nLFGgXaqiSe7Px1W0a7IIJ4QsRIVRF5mljUksoamllhBYkDRNWL3jZ/1JC9RwXzm/QQXgUubkoOJocfCHCsVJkFs+8lEqdizTlP0zhB3TPDvt6Ss+X4Sxkb5LGX+uN+uehZoYuptBrLCzDFwVsxphJjbrhqvuVyPyzLx8DVgUZlz5l8n+wcoHTZtI1ODQexZUxZsjtRCMzH5GsDIpq9HG6Rtx1HgbxK0MkQLl2o28fULHSsveHZ4BOQv5pRyYIzLadCAjuJyWNnqnkZ7uGAzUvF0UFhg/+ShIUvJNlJ7GjqbzYerYseG3PD5j0v+AQ0V55VO9Z578LZeY/G6nHWbA0DA05oa9+nUyoIj6IHLsqTmHzLiX8cvt691zQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(8936002)(86362001)(52116002)(38350700002)(66556008)(7696005)(6486002)(2906002)(1076003)(38100700002)(2616005)(36756003)(956004)(66476007)(26005)(316002)(478600001)(6666004)(450100002)(5660300002)(66946007)(4326008)(83380400001)(8676002)(186003)(16526019);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?pX8NAogUsKXEy5/lnD7ppwzTHnrHQakmr4mopnZRPUJq1MjogfgguYObENWO?=
 =?us-ascii?Q?SqAInQHmfx2wTNs47eqPDhqpQ0oKDeWQjFWUhdDyMH1WDO67cHq0lPHLXUlp?=
 =?us-ascii?Q?465aWstLw/QoJQ4x6iQAb53p7ExjsTQAWk9U/ezsgI0V3cB4nABRsgbrkHXW?=
 =?us-ascii?Q?R64XmIQWfUCgDjUa8wZcnJjuMlbNkFHhR47QnmlqJhn7RtX6lHB4+17b5tzl?=
 =?us-ascii?Q?qOvMcqjMdgq56yLZyI7PW0HgY4JCLmGBdbxSAiWgQ2G7cNZTTFjYFc5aGL8j?=
 =?us-ascii?Q?luDNJknOsa7IX0gQyEkJch0vnGR6m4xc3JhLVtK81rIrSOUuXzxq85rWr8dw?=
 =?us-ascii?Q?87DTMFj+1xPT/YiGBktlxD+GN/XNrO9CRbOPJ7HraULE9O8/PguibqqVIW34?=
 =?us-ascii?Q?cJwN7Bjo6ms8kOhPYNRf30qa3PI7WEtyYC9Uk1ETlf7i1zK6+1EdD/GFnhzH?=
 =?us-ascii?Q?QTn0bSByTI8W7lAUS2AxrDAJFDysMBH0CfCQhog+tab9BIYAk2NrMrTr2A7O?=
 =?us-ascii?Q?pMxnYGlfN/4B/6jGsEIG+bWJu6TwSDsb8bwU/+1j0z7CPZQUHyek0iUqaHjv?=
 =?us-ascii?Q?pTXdmNB2Yhiq7LhHnptuLUPZIRzt66Nu/MPeKYgwT/7ofRTAxdN9BBw7L2LJ?=
 =?us-ascii?Q?4wkpzP1yb+UTjka2zZvVXAorqAmypGJqWQWV1AEkjXczGT73Zt1o1cRha3mM?=
 =?us-ascii?Q?Fi7meRz2lCEwDt8xDzfb81dp3wHpd4jBYWCL4UTv2LTU3MaMPDB/jKlqe48Q?=
 =?us-ascii?Q?Js7mQarNKY9ucEvRaJ4R3FhOoy5nCRX7zpi+GFdwXnWe0vSWu5TTA3Bfs1sK?=
 =?us-ascii?Q?elTRt+6uqCMdSZhsx6Y785qH6It7QVYLj9r2X/hBwGgCcq+oV1veL5U/oZic?=
 =?us-ascii?Q?CWarCQV2EU1SyalV+lUji9zd2TTPxtBUqBjEi+2Ly246XhEtgK5i7JnPNUI8?=
 =?us-ascii?Q?EUL4yyT2qH4wupf8sxLhPEKzSahaiai3SVvLSfixGzvIk0gmaydA7q42C5M/?=
 =?us-ascii?Q?GHKILC3Zz8kmgMdhVEPDnH5dCLb+NP5Gq8wA1RnMwxv/ZFiVaLBUo+38FxSE?=
 =?us-ascii?Q?SSreGN9n35Jtoel1PR2SeoUS18N0un/7TorVwZSxjii00BCxcOTMt50G6EBQ?=
 =?us-ascii?Q?klhO50cU0R5O+2UzNWybjBf7KJdkk4+nEXvqTqd0O4poe2fyvHlepfcxXVJ2?=
 =?us-ascii?Q?3VQkicxEsH/lAD7iUmut3FX9xTUlLiWd7SvApvs3tKgqvQLZBMxLpbINGq6E?=
 =?us-ascii?Q?t7JeSROx/ITQKuWH5vCRJheb3xK/awmhibk8w0+ghFQIKViT0x2ViW5HHA0q?=
 =?us-ascii?Q?En8BwVDSTcv30FXvTIOQLK/d?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9666222d-d848-4a6d-975e-08d8ff114b85
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 06:48:22.0484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fB74wqi00tE3/HavHK9abDWbbcl20V14cwn5MWpiiLfi0bt4olojPF2q9zCoOIqF6Ie/WB2UlyqKFc5QKAhC9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4125
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
Cc: christian.koenig@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

amdgpu_ttm_tt_unpopulate can be called during bo_destroy. The dmabuf->resv
must not be held by the caller or dma_buf_detach will deadlock. This is
probably not the right fix. I get a recursive lock warning with the
reservation held in ttm_bo_release. Should unmap_attachment move to
backend_unbind instead?

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 936b3cfdde55..257750921eed 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -1216,9 +1216,22 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
 
 	if (ttm->sg && gtt->gobj->import_attach) {
 		struct dma_buf_attachment *attach;
+		bool locked;
 
 		attach = gtt->gobj->import_attach;
+		/* FIXME: unpopulate can be called during bo_destroy.
+		 * The dmabuf->resv must not be held by the caller or
+		 * dma_buf_detach will deadlock. This is probably not
+		 * the right fix. I get a recursive lock warning with the
+		 * reservation held in ttm_bo_releas.. Should
+		 * unmap_attachment move to backend_unbind instead?
+		 */
+		locked = dma_resv_is_locked(attach->dmabuf->resv);
+		if (!locked)
+			dma_resv_lock(attach->dmabuf->resv, NULL);
 		dma_buf_unmap_attachment(attach, ttm->sg, DMA_BIDIRECTIONAL);
+		if (!locked)
+			dma_resv_unlock(attach->dmabuf->resv);
 		ttm->sg = NULL;
 		return;
 	}
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
