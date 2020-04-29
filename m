Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD2F1BE66F
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 20:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0AA6EAD7;
	Wed, 29 Apr 2020 18:42:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2042.outbound.protection.outlook.com [40.107.92.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749366EAD7;
 Wed, 29 Apr 2020 18:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SytmeJVEIaIEGy0cinG8OAeoPAtyn3UmVUEp1NJ/E9ZC16Y7sUqSbwS0EApuBbK+qQ/Yx9PnlpS9sjOHehP00YKQ65x+C7QsncznEM7x0ChsMD2cEgsEweoVkBBqxEI0X28QTZ39bLXu/7TB/OTiOcECCOxtiw/a25bm0axPmjiEh2vnayiyZShkOf5aM9iOt3zIZTrJEs4bwONi4y53J21JmLwTZhB/vF9yv8SQtfhr95XmNtSuZWBszNZQjy1eopXUtypXxkuykLsEea/tcBU16tmW7oMFWRxQTi0ZcsLY1wZJRBWvBS5rHP/Hz2J6PTJW3WTMh44/qz2TuvRQTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkMilKffDzwBWt2oeS3f7TAArpUUFzbCKt3W68dmhEg=;
 b=DYHo/NeM1bC3BqOx7pn4Gu/vdBn3GP9nQdZcTKBCs3HZZ5BJqC8wXtDtSBes0OmrwwURrPgRYlnK3N+8nubq9OgPGmHK59zY0St5Uvo4+Uhys12bzm2X7c7YmZLAa1n2hHY+zhipwXJBqWfCLWC++Dn2suSisCHcfkl5TfREUQtaP8TFQYID5tVEc0S2nXfNZge4nqq4vK+hWqBd1po1Uu6UbvCq9uLOu8iY179NxaklxjWuG4L7x4tDDJlhNQ56CqEME0P4wL3S6VA2QenHtj2ZgaQefUwVzjrrSEKeDkM/SEGhj9yQlt4sNiEijVKU12W9oEXt5LAV9L8cbV32fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DkMilKffDzwBWt2oeS3f7TAArpUUFzbCKt3W68dmhEg=;
 b=MwFASJhHFxLNtWRi1bWlZlW+izaEpZevwgVbr+mDvO7RjSP8dGqdkZdXVf6lC7/SMlLzmVCcWZ6mPSdJ+7i4XaObjPvr4wRID4HEpA3Xji8qwFV6FbA3Wz4RFux2sY4KyyH2+uuFeMuo62xDyhvvbJVTyAexXJgd7ddyb5tw8PU=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MW2PR12MB2524.namprd12.prod.outlook.com (2603:10b6:907:9::27)
 by MW2PR12MB2508.namprd12.prod.outlook.com (2603:10b6:907:9::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2937.22; Wed, 29 Apr
 2020 18:41:59 +0000
Received: from MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::21c8:9f4e:c412:dfbe]) by MW2PR12MB2524.namprd12.prod.outlook.com
 ([fe80::21c8:9f4e:c412:dfbe%3]) with mapi id 15.20.2937.023; Wed, 29 Apr 2020
 18:41:59 +0000
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Subject: [PATCH] drm: Correct DP DSC macro typo
Date: Wed, 29 Apr 2020 14:41:42 -0400
Message-Id: <20200429184142.1867987-1-Rodrigo.Siqueira@amd.com>
X-Mailer: git-send-email 2.26.2
X-ClientProxiedBy: BN6PR18CA0006.namprd18.prod.outlook.com
 (2603:10b6:404:121::16) To MW2PR12MB2524.namprd12.prod.outlook.com
 (2603:10b6:907:9::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from atma2.hitronhub.home (2607:fea8:56a0:11a1::4) by
 BN6PR18CA0006.namprd18.prod.outlook.com (2603:10b6:404:121::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.19 via Frontend
 Transport; Wed, 29 Apr 2020 18:41:57 +0000
X-Mailer: git-send-email 2.26.2
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 60e6bd8b-0d16-4022-c9da-08d7ec6cffef
X-MS-TrafficTypeDiagnostic: MW2PR12MB2508:|MW2PR12MB2508:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW2PR12MB25080018E0224AE9DFB7831A98AD0@MW2PR12MB2508.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-Forefront-PRVS: 03883BD916
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB2524.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(366004)(136003)(396003)(39860400002)(376002)(316002)(8676002)(2616005)(6636002)(6666004)(1076003)(4326008)(8936002)(478600001)(16526019)(36756003)(6486002)(186003)(86362001)(110136005)(5660300002)(66476007)(6512007)(6506007)(66556008)(52116002)(66946007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MrUozZXWiL1aH9CKHtJDovnG+wFWAWAbJ27ZGqx6R0RyI8OjqYmFCTLciY3quIQ9mPj8CYlnzoyJ9uhQ3+2zciYK0ljzsac1DJwKgtbyPLZi6SXY40Xhic2dv62ZKDB1sRR5hvlyQKx7m1PZH7cJg71soWZ3+Z+gfX1GSR6IZahVnJPBqXd+US4pNJKPXzmqHpNMDS0BHwghWKQk2sdu/hRkEYVNnT+ItGKxMvIZtAZ5FV14C6CMjEDFLQSILPJTIpYzyhfqi8b+JuealG5aK/Cwnu2HhhIwLoinUeFjuXaSNRPlE8jPDD2KJubW3VfesMgPYN6mgMBS93ddKx4Vnmhu7InW0Q5Hwy8Z0dKkHYMP3pDN9pQPtxT+7U2PgzYTPGKQ6TEZjg4ZS7cWa06Jx3zrpJDLT8JSGeDQD3UZ0kbACcvbjNlbcGvuuj6DOpvS
X-MS-Exchange-AntiSpam-MessageData: HcY/NUX87S4VNaFKTw4cDWsca3uF0GAbRqjZk9EHcWM0ucypcqnYdyjnPVVURdg1WNtcAqEJtKWR4VCLJOLglV8uRJjbopnM+QZp1BToyQiLxnEP86S+ajYPOGyX0HNqKtwacVbpTD1qVnTzatmirSYQZ7aPtrCumMkKMNEnGUtACnJg9avbxg3GwFJHwBNYeUIPpTAt792rI5zp6JtXehBcKUNMlp8lExg9k91RjPID1vH6+utsDsRgKKVxlGjHKtze3HgjN9yHe1yHhWcK41ZCzwZk0CN212nQ14RQpqwQ6S/GorrRluDg9lP2xYYUPmSu+KlU5npgzMwMoXn27If7v4V9cXe5VIu4fQ+JHdaozoi7ko/Gf49A3crtmiZzNY0PcydABTlSWMITqcUGrhNHtjRVlLmKfXji2PQAAmStedVHFAD/8V4j++oQOecVJyTXPgysu2TkZuCj/eGsc7vqM9x5rGurjz8+9eWGq+6FobSJF/FdtLg1bOY2KXZryqWp2uRSXfQ4So0c3iHF6hVO+gkKfbywEit/ePu/w3CXHk/ipO8FzBq8is2lHBZ0A3y+xlrKacf0duuo61Mwl7kHFGu6m5yDJ2v1vWTqqoG+jT1F2cfFvPKNKImQ1lFAJ3ZJxI5U4q4UGHk3eIsxYVBcDrx5b6ctekKR0BNhaf90VIcfJqr8CNzo9JVQXOlq9KMiw/t+6NN/0FUOjeObWBehm2IURNsRbE9MHXUcmjL92/ujUohpag/z8I+/eTzjx5T7s3OdpavD7E//3iK/AYqUQ6bD3vD0nxJnmMgkk/ocsOMJnPKa1ZxSZ7KZYifQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 60e6bd8b-0d16-4022-c9da-08d7ec6cffef
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2020 18:41:59.2431 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8WsKqhkT6JbxAfCqKJ7XJLye+QX9xuepflqgFzxo/k6tT476e/o0mL1ms1IqWYXEE80TYr3B4jcBB+e+j8vs1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR12MB2508
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In the file drm_dp_helper.h we have a macro named
DP_DSC_THROUGHPUT_MODE_{0,1}_UPSUPPORTED, the correct name should be
DP_DSC_THROUGHPUT_MODE_{0,1}_UNSUPPORTED. This commits adjusts this typo
in the header file and in other places that attempt to access this
macro.

Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
---
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c | 2 +-
 include/drm/drm_dp_helper.h                 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 87d682d25278..0ea6662a1563 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -129,7 +129,7 @@ static bool dsc_line_buff_depth_from_dpcd(int dpcd_line_buff_bit_depth, int *lin
 static bool dsc_throughput_from_dpcd(int dpcd_throughput, int *throughput)
 {
 	switch (dpcd_throughput) {
-	case DP_DSC_THROUGHPUT_MODE_0_UPSUPPORTED:
+	case DP_DSC_THROUGHPUT_MODE_0_UNSUPPORTED:
 		*throughput = 0;
 		break;
 	case DP_DSC_THROUGHPUT_MODE_0_170:
diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index c6119e4c169a..fd7ac8f15004 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -292,7 +292,7 @@
 #define DP_DSC_PEAK_THROUGHPUT              0x06B
 # define DP_DSC_THROUGHPUT_MODE_0_MASK      (0xf << 0)
 # define DP_DSC_THROUGHPUT_MODE_0_SHIFT     0
-# define DP_DSC_THROUGHPUT_MODE_0_UPSUPPORTED 0
+# define DP_DSC_THROUGHPUT_MODE_0_UNSUPPORTED 0
 # define DP_DSC_THROUGHPUT_MODE_0_340       (1 << 0)
 # define DP_DSC_THROUGHPUT_MODE_0_400       (2 << 0)
 # define DP_DSC_THROUGHPUT_MODE_0_450       (3 << 0)
@@ -310,7 +310,7 @@
 # define DP_DSC_THROUGHPUT_MODE_0_170       (15 << 0) /* 1.4a */
 # define DP_DSC_THROUGHPUT_MODE_1_MASK      (0xf << 4)
 # define DP_DSC_THROUGHPUT_MODE_1_SHIFT     4
-# define DP_DSC_THROUGHPUT_MODE_1_UPSUPPORTED 0
+# define DP_DSC_THROUGHPUT_MODE_1_UNSUPPORTED 0
 # define DP_DSC_THROUGHPUT_MODE_1_340       (1 << 4)
 # define DP_DSC_THROUGHPUT_MODE_1_400       (2 << 4)
 # define DP_DSC_THROUGHPUT_MODE_1_450       (3 << 4)
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
