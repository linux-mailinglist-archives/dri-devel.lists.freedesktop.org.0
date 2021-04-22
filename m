Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5134C367CA5
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 10:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA826E13A;
	Thu, 22 Apr 2021 08:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABD376E13A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 08:38:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3zcdyg7M68yLHIv05ixl19Zj/pii4iFAD+NhAmI1AB6DIQ3TDrU0xy9beckQ6EB6ss1hpxP47os9vCYL3mdQhq70rhKw89rmEa3ven9wegvTIzMQLMp89cdrNyMhWps04UpT+NJ9eH57ccIuRRr0v+NR0Yp1Wh2WMzf8/vqcNlXiRMNqa4AeZ2ktgylcetru5uI9xpHKcNHdxsAoUmkXxclp+EdmDCBK4zNdy6fS7vkqmtPcEseG17WSz56JJIduauHB/2uHV0nBBw15+FMt/eZLxgAekqS5DIhgKV8s7YjQswKtw9jPEjsSVeZj6QJLaNJnO+8HXTwiKu43x7q8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFZMWcxyhiKZaYnK8ecN6dOAAj0FPpZViXmBg+TnKks=;
 b=WCzcwZPeve7SsETJRxRxdBiY3uVjEof5dg1h9Nqq6icv69o5DUDFyEIAPmcfUzLoPKOnmBWy3TSp5cOgaBmJTLLy80b6FQwp5fvckM5IWABrya5twNML4qVZE1bGbwV1RvAiRHDETF39mLVxLZC1Pg+BIZnYkNZyCPH+25fcW72G0Hn/8WKf7NXFLIDLdSuJoYXxMQMcU0MK+LhCBOVpnriOU94i0+GXyVuCw2qy3F38RT3pay8IzTSYsGyWsXbR0d0SpTgPB75RriexjUmN1jUTYE3B7hzhOH6bJIEsDflKCTdg+2zrksE7ciMx/PClGbGPgomS6JdqlPd2VxHaEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFZMWcxyhiKZaYnK8ecN6dOAAj0FPpZViXmBg+TnKks=;
 b=dy7n+MJNYQeYgwI6s4zUijRcQWn2BuwJ2lVt0dsb0v1NKXotIy9GIK85ATNorvTm3gvnKoKoMWvvd3Glv+sCDcL2+rio8vLviP+f/7n4KKICT7ahyS6U3lyiJjAUWOyxe6hwvgcM6D7t+s36wf1kKkTsZJ9Ll3XAz2Kw+DNmWSo=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3196.namprd12.prod.outlook.com (2603:10b6:5:187::27)
 by DM5PR1201MB0011.namprd12.prod.outlook.com (2603:10b6:3:e4::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Thu, 22 Apr
 2021 08:38:13 +0000
Received: from DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392]) by DM6PR12MB3196.namprd12.prod.outlook.com
 ([fe80::2477:9f69:235:8392%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 08:38:12 +0000
From: Shiwu Zhang <shiwu.zhang@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out
Date: Thu, 22 Apr 2021 16:37:49 +0800
Message-Id: <20210422083749.11686-1-shiwu.zhang@amd.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [180.167.199.189]
X-ClientProxiedBy: HK2PR03CA0063.apcprd03.prod.outlook.com
 (2603:1096:202:17::33) To DM6PR12MB3196.namprd12.prod.outlook.com
 (2603:10b6:5:187::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from lnx-ci-node.amd.com (180.167.199.189) by
 HK2PR03CA0063.apcprd03.prod.outlook.com (2603:1096:202:17::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.15 via Frontend Transport; Thu, 22 Apr 2021 08:38:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9caf4b75-2899-4855-561c-08d90569f70d
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0011:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR1201MB00119415B61CBDC28A1ED407F9469@DM5PR1201MB0011.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QE2kan8dkOQaoT7QJOcirUrM9/+hkYCVx/Hfbo0097MHH3CVeERMS99KmB+l0VHY92M0EAo0YliBGhayL1j1861hBljmoHoYeK3OHGoZskKxOFCgc1u3GLOttcgUTGMqXWlTOHgD1yN7z/q8d1OOZ/o1/kMAvawPIkFU8C4ccx9k3eIjExVWuhfotfReKJ34bfvbcPAYOEhYpLdt1jhlGWYl3CIAfFrD94j1dSmsjR/EjwtPblNKjqBAykoXsekIg+bZ6FwXC2J5db2acrEfzTysG4Rf5taxIFxskPxlzPH82d7axGub4WppUDKtoAp0+hgkE18CHNriYxA22PCjquh/mmmHNWlSu/qOzM3GSH5SO0ICX/6p4hDm8DaHrdc9rubEq36KZVt+VGNHMlhFnwBEKsnFmD5IGuZYdHoxu5jMAl0H5Rq6OGjRl51c7mmr4xSaB8jGq1JZBU4g2REm3Hork6JkwP8k4Mx4bd093FOvFGeuiEzoDNrWIqWyPg43WaBwsHjJvEr7ege//MSaVlHYg/MWj/tkJ4iiAesdaz/kLX8asYKy+RaR3SN4qN7G8MuOMtT8IoNrFOWo2TGPbvGpRrGV/lJ2F7AmUE2O3hQ4X660g4taDZ0Enh5LBpUMdGnQvMSwTK/N+Z3qcjfXhtIF6ij8niHYh7zne4Dpq6E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3196.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(366004)(39860400002)(136003)(44832011)(66476007)(4326008)(52116002)(6916009)(16526019)(956004)(5660300002)(186003)(1076003)(2906002)(478600001)(8936002)(7696005)(83380400001)(66946007)(8676002)(316002)(86362001)(6486002)(38100700002)(66556008)(2616005)(38350700002)(36756003)(26005)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hERTpC+fnmm350GGE1hNtIkW5NSf4q9bLpBO/lU3zoNkSZFVq6C4DJUUGtC8?=
 =?us-ascii?Q?flHqdF01suchnYHmlL4QvT02ZfqJ1g+yqAcYBEXtZEzb+W2JCp/cNGb0+k7f?=
 =?us-ascii?Q?/HOj+cZN7rE3cvGlBxprv0Me/qA71Meb00zzRnFAS+LYIm+TUIaMU/PP3LFR?=
 =?us-ascii?Q?esQPk+MlX+eCE9/fRL5E6Nrcnul8LDkpAHLWRcNVks4TY0/KsHguO6/wZtHN?=
 =?us-ascii?Q?38ynyLxQGvPqec2TINHTdlzPEZu4sRnIL2Fuzfyn4rmyCFuyHJ5UvhKmlWqC?=
 =?us-ascii?Q?adZ3OgOWRh5y0BPt/zTlVaieMQN+WUDReUMeyD6sy8IeDgBCkrVM5KvEQ2Nx?=
 =?us-ascii?Q?ohqwhFElcTGNn7ZSG0OOL0hAGcIdxq1gyM0wWYe+9U/G+qRf+p+i5e+nsMvF?=
 =?us-ascii?Q?np9B3Cnt/P739WmohIhAXGSG5rICtdx82+HpHgz/lQBv8ofrBwU0UjhZB7ko?=
 =?us-ascii?Q?o06c0n836oAsiXHugm/3tFF2uBimy7SCctBrOyoiIEoHGaJU2RTyEElb7/QG?=
 =?us-ascii?Q?jf4MQJB1Q9g4GIDXRKpEQC1EbeQ68xUxnHvrCdIYV7kdPHqAemxuIXAB+snB?=
 =?us-ascii?Q?aB0mYNgjyOb0y+V0KVQN8LVOGTsJjZRozFLvrvOUa+oAavi/nFlQ+C+OVOpT?=
 =?us-ascii?Q?U/+NRCi02PmFAfQM07PMNshUkOPR8ILT7hs1u17Hn1cSnbwuQV3j2YXfJ8wC?=
 =?us-ascii?Q?lTHWU1SZUAiNnA9DXrlruWmNgoKpKy0FnBVEgdABokKsn0RFtgkJqvLexoHq?=
 =?us-ascii?Q?QxOC823FsW3oi6h7yVzdUF4C3B2SiG+IwDw1mHziOFx1ar/gS1z85GM3qFyT?=
 =?us-ascii?Q?U1BWY2ioedxnGgAlXpA6EUFUsFoZFYXzoKOZiaazhJQLx6D9yoB4leW1AK6t?=
 =?us-ascii?Q?ShicI8n5q5DIN2ZuxC6OMRCmq/jQTGfTiZXoB0l6F9ZYeKa5ZFIhYBg0jtq4?=
 =?us-ascii?Q?W2W0BxQ4PjD4cmwZPVIfrp7UpvyGrG0rgnA4zuvg3BRwhdcA5xkjOKmXKYM7?=
 =?us-ascii?Q?1e12PYt6HdePnIkE+DUOsWm6dWbzi7TwY7139QU5713QvtH/Uf3RwtPJhn5w?=
 =?us-ascii?Q?N8gXTzgbZHD+LcHnMzwehrkwXI38yseF31rlAAex3BzpU3b36d7h/85t5Trm?=
 =?us-ascii?Q?aQsn6rLOe+wnD9vDfxsZIs4SdlA4ktNpnBPX9VWQLcAw8unoIjdVgcFuqMtm?=
 =?us-ascii?Q?ZR9mwYJLy955p5wwiXI2urTWxdD0pgOasiiAsHs3PGJ84b/LadUpJlDAKf7A?=
 =?us-ascii?Q?V6/4pCjqwqWLGaTD3YLG+OajkapV9xyU5TJ4xhD32rXzKdSDM8eAUYBskCbA?=
 =?us-ascii?Q?nAr3LjECJNDfItNjknG/ERIK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caf4b75-2899-4855-561c-08d90569f70d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3196.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 08:38:12.7815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2ggD2+SCpBcp8m1wwqf+XyVA6E3QZOnV5weGyynRSYtSxX6zltS14b29sm922ypR/RxHWmTcc6gLITdTC3jglw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0011
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

Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index 1f2024164d72..5dc92b056f0a 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
 {
 	struct ttm_global *glob = &ttm_glob;
 	struct ttm_device *bdev;
-	int ret = -EBUSY;
+	int ret = 0;
 
 	mutex_lock(&ttm_global_mutex);
 	list_for_each_entry(bdev, &glob->device_list, device_list) {
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 48c407cff112..539e0232cb3b 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
 	       ttm_dma32_pages_limit) {
 
 		ret = ttm_global_swapout(ctx, GFP_KERNEL);
+		if (ret == 0)
+			break;
 		if (ret < 0)
 			goto error;
 	}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
