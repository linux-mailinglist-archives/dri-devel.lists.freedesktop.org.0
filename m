Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1F03A7DBB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 13:58:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DB289BA5;
	Tue, 15 Jun 2021 11:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2045.outbound.protection.outlook.com [40.107.94.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0784789AB7;
 Tue, 15 Jun 2021 11:58:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJCeT74D2YIyw+quvrIWY8VUX4r4IdzYQQZS9ovNg+lcocg7aFpZtnWOIOA1oth/3OPdf2zSrQSFSvLXhr7VtEN3yUoI2fmfx6Yr/lq1jXXDp4yxsfcSkCb0gLNkZeupSvTsL/CwXdcZa8aj5pPFvHuOt/ojCBSKumaadFXKhdoKGC6SpsfDEhTOUbGjHyN0I2khD888eJOyJKtcDmd3f7/gCyOKCS3TbST5nnn/is2ekdNVsFni2CEOU7RJu8pNrGkY2o+jfvPShBNUqz/gRNGxR13T5U0C66AESA7o0MePWZRCC7gDzIdUZU38myd2mHL0ISdtz8lAKZsbkhKetg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2qJhYedUAM2DV7V1wyJoUvpWQkhNglI8sm/6UgKFfE=;
 b=Mrs2jFpEp+JhR+WoJvpOBEkINg4WhXmRrfkLAeBxpXVke67PIz/DxVnpb5n40jLlW1hxTLOMQeYq6MNVZ24pr0D2zFmUZtwekKXzNMHwjNoeXAqeaXrHI/STWbPM5FC9dut0Kkq+mMwmcOQXV8qsBJPxyOUj6ebzRI4wH+GDcLCSEGIR1u+gCiCDi8G7PRg75qT4O3WGoyoOOVQd/U9UQfC+T9JxAq0ZIixHIzyBwq5N5S4fN1q0JiRlgYXyMT7hlgtUOC0Xe3dEnCLwZ2FaJ65GbNxQss1AApaM/2ZJv7aqZWxkPPLk6nrl2S4OO4iwpbLTgCGGBk+WRmxLj/vOFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2qJhYedUAM2DV7V1wyJoUvpWQkhNglI8sm/6UgKFfE=;
 b=Bxf7Oj8TcQPMI/YccSAhHeJ+a0Xf+ddmx/9IkrZx6TOli9ov+8Hy8dh8q9yTdb+UHbs/V2l7EmKw7twExpeiA2VQvxVotaoC5N6OztNNGrp0Jg1NgtNwYsMMGd6lQkSVxkiVQFUi7G4lvLz0KaByf3xpO6ptX78XVpcqc4fBZxo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM4PR12MB5390.namprd12.prod.outlook.com (2603:10b6:5:39a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.23; Tue, 15 Jun 2021 11:58:33 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::2091:3f28:3f68:508%6]) with mapi id 15.20.4242.016; Tue, 15 Jun 2021
 11:58:33 +0000
From: xinhui pan <xinhui.pan@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [RFC PATCH] drm/ttm: Do page counting after populate callback succeed
Date: Tue, 15 Jun 2021 19:57:46 +0800
Message-Id: <20210615115746.27424-1-xinhui.pan@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.134.244]
X-ClientProxiedBy: HKAPR04CA0005.apcprd04.prod.outlook.com
 (2603:1096:203:d0::15) To DM4PR12MB5165.namprd12.prod.outlook.com
 (2603:10b6:5:394::9)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pp-server-two.amd.com (165.204.134.244) by
 HKAPR04CA0005.apcprd04.prod.outlook.com (2603:1096:203:d0::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4219.21 via Frontend Transport; Tue, 15 Jun 2021 11:58:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d752de4d-332b-4ab8-fad0-08d92ff4e680
X-MS-TrafficTypeDiagnostic: DM4PR12MB5390:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5390ECF785E4ABA3D6D39F5B87309@DM4PR12MB5390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bpUspiOmGuYJQ0zX0kAThU8KJAePkZcpFL9w8m8uLGizGW/VPhIB/plsi2AweMq5mjJRMqpck1u6ufkEWtb0g075uZr/uXF6ZAlXx2XV4G8YrrvpZmT+YuylniPLjSxSQOJz1C/CMt/p+oBQ5lpVTmH3GsEo2lqz5ERYY+eg8Nxg0iMXF5asWY200MGg52fbsPxZlWLpHynLzhDutPvP1XEnSvQBHQVMItXrbZItvAc0BD89DAMoNPbdPijnbxU34nGQoG5rfoedamdjznOHy6rTW80rVo37cbSCFySzQazfkbj2WaaUvJx2qG98n2PeVp40FB4crG9/I15zof5rMVr1BJrK2/oYwjofmjfpJQ8qIGqCOnAIU3h9P3HyUpalPLaPn3BDXrMH1e0VASyGXAbEEw2PElazHMUTXu9OTWkHSz5tgcpSC5SsNa9KJ3/gSl/gXmFI9gjjbGWzuMH3UOi1IbT6rgz2Wvv/qVLEITrd69+uyRMzQ9VQqQvwllaTC9czl3pGYM+ZAqI/8c5Du6AfAFiXzujQn2L+EKwmqBNvImD3xFxSakBpyuKIb9Q9aWYwRRpvVPW5qO8yQb53nYQuOvBxBLV7hxiRCVHKuQy1oqIU7o8aHfTVQhBkikdLhgbtqc75nzx7v1ITfPOf7GbqjM1ZrPiofF3U59dSxuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(136003)(346002)(376002)(39860400002)(83380400001)(5660300002)(66946007)(36756003)(6486002)(956004)(86362001)(2616005)(6666004)(2906002)(66556008)(4326008)(52116002)(8936002)(38350700002)(7696005)(478600001)(8676002)(316002)(38100700002)(16526019)(1076003)(66476007)(26005)(186003)(6916009);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NwsnDfc6AQ34ugDtoDySNn0PN9Hq0JKgM9WgB/L9AxhAR2xpC2yy9kU1Qake?=
 =?us-ascii?Q?Hh511QwYwphM83gK+GkUA8VCcwWfSy3K4l48WYysjPwkOLJNXcv7EP5YDb0c?=
 =?us-ascii?Q?ZyWdyaqtTLHa6qgOezUXX1VRFfFlD+7ALFmR/c7dsjtV/O+/Q75UJDKWpqUs?=
 =?us-ascii?Q?QDeqVMqNeGMJWQBMAd0vQkKn+sLNoDWYEtLCsCLlzqufiINmWfgSXkagYksF?=
 =?us-ascii?Q?hfXC74pQwSWHPtPY/KPCKatrICGIlzx99bYwnaDm7ox65FdGq2AkuO/Y/3Rs?=
 =?us-ascii?Q?C3o9cshxspaG3t0DLI8LUDu7yV4aWqrUjZzbvBFQBpuUySMK1BDzasgbHLRN?=
 =?us-ascii?Q?5Nheyqepk+vL5+HxEkvpdvWUzoNmpJYwsIpvLqBsIvwLz09IdkpmpHUJxQJp?=
 =?us-ascii?Q?U7605zRbtJyAeGreD+HimIi1N1m0LC8jjpFhbFwv+hLUISwcPPoJz/hkDdtW?=
 =?us-ascii?Q?YxUZnO0A7PL3fIDdfd7gcKIs35dQye8o9H37SWLIXzWajDOi98YmQcdr6WrH?=
 =?us-ascii?Q?2qlXJJyb4htmnWkcXoFHsonqo9g/9bGEd18V8a2WF2foAOPnknnimMyGRok5?=
 =?us-ascii?Q?zkmNlJUi4Juo9mvM0nFkiWe52UceQHY+I3ze4EK8ncHRp5aK3HxDXq85Rl14?=
 =?us-ascii?Q?qLd5chfFQCbHZGgAcFemlQqpteFatx2odr5VPPg2JoxEtUVPL/B0glgh2su8?=
 =?us-ascii?Q?9mGxul3xGMHIPtpfSXTkf3zJRuHrMr4JLr/qs48MIuWzQqZyRsyt/lsvs8Ut?=
 =?us-ascii?Q?E//aPO/9BF6RD1dElZFMDDMTSSeIqBySWD0Zd80XIJ3Qu5N8tfKJoEtZfUT9?=
 =?us-ascii?Q?D4HcAXiBRnfU4S+BUyXYUiK1jkbiUxkiNMM2IxtxsKxjc+j1dhddauG6xVGX?=
 =?us-ascii?Q?AD8W93XxW/HMaiXavwf9inUKOn9SMou0dXd8+zZr07skBl6TWdXpdc4Uq7DY?=
 =?us-ascii?Q?dcM6DWBHAidQ30a45q0pdm+Pw+uJsmIwfvbuBTYHN+X9jQ/Gving1N4Jh444?=
 =?us-ascii?Q?rklkzsdaZC6jTqwBEDwveTN9eYWUQ2ye0vxfvDplHCvbv4E442OqNSW/M54s?=
 =?us-ascii?Q?wqg94y00vvpyq00VO5u77aIvXzUlcf2m/HjsQXJ91LLxvt5CiqkvpUr0hK7e?=
 =?us-ascii?Q?BnSXy1K+uJQkMMlDDpJQWLgiG5aVZmSzpwNRY7qzS51InaCZS9Hz77ig9t2l?=
 =?us-ascii?Q?c0NhlgmMFJFNePGyqZJqqtOCHF512ZgkCSWRr01QY9hE4DRbYApbQhQGtyAo?=
 =?us-ascii?Q?YIGcgv4v6HZAAmjRjYC/dzNmSnsxGiZWyuKHQ2T2vFFQOveje8jtBNYIdysx?=
 =?us-ascii?Q?IISmkZh9epSHkFWRpstrPh3s?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d752de4d-332b-4ab8-fad0-08d92ff4e680
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 11:58:33.7016 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cjbfwsoh6sZZhmrftzlFftA01Vj0nM1BQzGkaPppw9MKm+v8dQmXdfyNiZeHJlL+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5390
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
Cc: dri-devel@lists.freedesktop.org, xinhui pan <xinhui.pan@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Amdgpu set SG flag in populate callback. So TTM still count pages in SG
BO.
One easy way to fix this is lets count pages after populate callback.

We hit one issue that amdgpu alloc many SG BOs, but TTM try to do swap
again and again even if swapout does not swap SG BOs at all.

Signed-off-by: xinhui pan <xinhui.pan@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 32 +++++++++++++-------------------
 1 file changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index a1a25410ec74..4fa0a8cd71c0 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -317,13 +317,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ttm_tt_is_populated(ttm))
 		return 0;
 
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
-		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_add(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
-
 	while (atomic_long_read(&ttm_pages_allocated) > ttm_pages_limit ||
 	       atomic_long_read(&ttm_dma32_pages_allocated) >
 	       ttm_dma32_pages_limit) {
@@ -342,6 +335,13 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	if (ret)
 		goto error;
 
+	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
+		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
+		if (bdev->pool.use_dma32)
+			atomic_long_add(ttm->num_pages,
+					&ttm_dma32_pages_allocated);
+	}
+
 	ttm_tt_add_mapping(bdev, ttm);
 	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
 	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
@@ -355,12 +355,6 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	return 0;
 
 error:
-	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
-		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
-		if (bdev->pool.use_dma32)
-			atomic_long_sub(ttm->num_pages,
-					&ttm_dma32_pages_allocated);
-	}
 	return ret;
 }
 EXPORT_SYMBOL(ttm_tt_populate);
@@ -384,12 +378,6 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 	if (!ttm_tt_is_populated(ttm))
 		return;
 
-	ttm_tt_clear_mapping(ttm);
-	if (bdev->funcs->ttm_tt_unpopulate)
-		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
-	else
-		ttm_pool_free(&bdev->pool, ttm);
-
 	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
 		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
 		if (bdev->pool.use_dma32)
@@ -397,6 +385,12 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
 					&ttm_dma32_pages_allocated);
 	}
 
+	ttm_tt_clear_mapping(ttm);
+	if (bdev->funcs->ttm_tt_unpopulate)
+		bdev->funcs->ttm_tt_unpopulate(bdev, ttm);
+	else
+		ttm_pool_free(&bdev->pool, ttm);
+
 	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
 }
 
-- 
2.25.1

