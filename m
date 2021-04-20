Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 315493656DA
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 12:50:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3803C6E7DA;
	Tue, 20 Apr 2021 10:50:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2084.outbound.protection.outlook.com [40.107.92.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A85F16E7DA
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 10:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AB18WkaJgLbHjnVtywO2HJhz/FEavajn/aJsInAfwI3nN/Nox0z0lQM8vEIx5ma43BrHjEU6VFXvknozDBJniG9c3U6+sJlmdIQpFcDStoKI37FogEe2d/PwBsyRYH6OqrtcuMspHj/vSQi7CF6hc8eU58iE4n5NlLQDFMEXOUeyKAmp0ddFZCjZlIxi2k7WpadPVrbh0ZjJ6nTJc5jgGhOlCksqYsVyyvU8Hal22fB6xDhsij2ugx1nt0g2Et9SHQb6IP63yBvSwy4NnX35ZqlKLqvOmxu0+IkTFcB+nSV4mIAI8YM5aFzvf8u4GE3k+FZOpgQe45jKe6YBIclZSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZrHpBK2U0vQ5vpNbHVftumghQDqjg24AUfF8qB/2Ws=;
 b=Mtu4YELS4xOAV3T5ovYR+mg5YoCXuM+o5dgaJ9RQdZPd1kYFGWfOR4ObPddyO8WosGpTyjsOKPc1tb9VOyfcP2+X8S9EGBPPYu5rNnTeUJF+lxzFPUcghrqkOkNGAnzmqrL4I562jhQHmn+vD5nZXYMRf4p3I/VVTF0i1d+b9uOWpIiwxBUelbF1xjQNV516g6KZZqIRPav7zROiIXJf881VPIwOc6QYXuqLbHvjX+x8o4dXW7gA5yIoMFdeKy4IzT9sUf4QLiPQr3nSZAvGor0SkkNVXkQk9blMrx/PVFKwIRFken3h1wvMdRK8hMPT+I2zW+rIWINfU+gj9Ntjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZrHpBK2U0vQ5vpNbHVftumghQDqjg24AUfF8qB/2Ws=;
 b=K9L7E5dLtUmb8CUkSoHpYZbjBKEz9ZYOT6pZ6O4W7mvEJxoA5tzgbNbU3NuASOLv9DEOA8AZrb/yPCWt/6khR9hACDou2RmJAap2yTzkvnNaTemTYqRoXsoqob43HOKlqeBBlxqawBRh3YTQuAsKJhY0+k5s12ociRKSGhzkl8g=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1463.namprd12.prod.outlook.com (2603:10b6:910:e::19)
 by CY4PR1201MB0056.namprd12.prod.outlook.com (2603:10b6:910:1c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.19; Tue, 20 Apr
 2021 10:50:31 +0000
Received: from CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630]) by CY4PR12MB1463.namprd12.prod.outlook.com
 ([fe80::a457:1047:3886:4630%9]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 10:50:31 +0000
From: Nirmoy Das <nirmoy.das@amd.com>
To: Christian.Koenig@amd.com
Subject: [PATCH 1/1] drm/amdgpu: make sure we unpin the UVD BO
Date: Tue, 20 Apr 2021 12:50:13 +0200
Message-Id: <20210420105013.6486-1-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.30.2
X-Originating-IP: [217.86.118.62]
X-ClientProxiedBy: PR3P193CA0021.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::26) To CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from brihaspati.fritz.box (217.86.118.62) by
 PR3P193CA0021.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.20 via Frontend Transport; Tue, 20 Apr 2021 10:50:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85ad4d91-6ab6-407b-682d-08d903ea1e0d
X-MS-TrafficTypeDiagnostic: CY4PR1201MB0056:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR1201MB00561943FD05BB562BCE49708B489@CY4PR1201MB0056.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:155;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jMle4kBX8dhTHhnUCn9oUDyRMvB8HQiLF+OYabqjY0vW2qU8SxxFcqETYAJyOxfe2q29a+HiM7q55n0KStS2s44PVxf5XpWlZiV94m8ElGaxq63OUozymaS7M/q0BOY6jB4TSvXcQ9OWpS0+Jb93y7OKmy5xw7auUJZXlCPYkakrlqjL22ClddEK+Q17Rc9KmLNB6ynWKycP5+WPT97YiWeYQghEu69d3RT6PgwzVE+ndVuEHqR46snLfTBTuc3A4DvGgDoh8cWQajonqrX1VEpsPI/12SBZoXAm6va37G9TFuta9gzvR8GiIX9OhXE0Eg49705pHckIlPeXBhPpjwz1vf8eJYTRpakdAPwtUiFVGasFyvpluGA4YAFX47FqLTP8lqKK7I2KAKYYUG5qBzrDlFt0WK681rQh+QmFA2L9BjfEmPUDkeGXH//ifK9uR4Xze9xX9aeA5nnmGYmoCVvopPib5Fo95CDrZ7RRR7RvT7+R0tBOqiXHbVez5LOX2Ml8Yyf36DENMV1JO7SmmF3vy23J1yz15s2bi5bjegbuwdJ2/3Y62fupPv91YqTxW/UcLq25xd+wILpJZCz/GERg2FpX4C+L+ls3718LMXSshXRkepoylHEj0UVjtscDXm8LmeBMg6OWSy2kwTuURg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1463.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(366004)(346002)(6666004)(4326008)(8936002)(36756003)(66556008)(5660300002)(186003)(16526019)(66476007)(6506007)(37006003)(4744005)(2906002)(34206002)(316002)(26005)(66946007)(6636002)(2616005)(1076003)(956004)(44832011)(86362001)(38350700002)(38100700002)(8676002)(52116002)(6486002)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?qVbm/l5ygumlP5nMVdpNf99TgjzDrI7qy1BtMs3DuhYwErsgv9UCfUEpEl5a?=
 =?us-ascii?Q?kCIUlSWLiwTJGtZOlnmk6OjosxSRlsrH2g6WjRmCucMNQF9U8I0G6sdKJhdK?=
 =?us-ascii?Q?w8Rc23ycB9uREn+GcUqq08KxKS9sugUxRabK9edd9dnmd7h+rkx327/nPq72?=
 =?us-ascii?Q?RjSvZpfkCn7bmTYWFqwKPyVFDrs/Kkqs3z4dviks/jUVTFwcm1u9CxroSzwV?=
 =?us-ascii?Q?V16MKBxtOBNDUNR4Ac77UisqhsiXBTuAvqME27vQileN7LfknBeVtmySGsru?=
 =?us-ascii?Q?ycTXjbvYjawVtdakG6FQrQLS0okOmPKuyD+n0K71XPsJ+XLgm+5DfuAknZ5G?=
 =?us-ascii?Q?npr+2ciMh1mvw778T9/kurvQauPVVXfzxj7b7McJGexxJLGlwH4DoQMrtQsT?=
 =?us-ascii?Q?KyTuunvj9Ec3lyjrLCXZ8JU+h0QvAh0l3lQPmZ0p40Hf8kPAp7PApw8qYF+a?=
 =?us-ascii?Q?r9cYgwgfxm5lPaRDltNYUnwNLP4NZt5Cj6nzHkfLUb4rRdmBoEDz2Pq0sbj7?=
 =?us-ascii?Q?V1/IXbpHLjGfScjIx6FT3ufqk/nrzYQ+v84bNkpqSXKNfHMZlUvZSocowOdS?=
 =?us-ascii?Q?0A4GD4b3HfhWYnRpYXAuz0SJF5Dv6rv8lstHjKdvFwFYeRdV9O2x7cYBXJig?=
 =?us-ascii?Q?EOAsnnp16R4374dmSNbzq/kYPqfCZGqnc6+anp2h2OgSBboJNyPKcXxapex2?=
 =?us-ascii?Q?zURTZl5oD/+EKy7RtDaUhBxeYT6TQRoaXIIyZtLgkuCEwnomyqpvAm32msHv?=
 =?us-ascii?Q?Xd4R/RtgR09BRU2Kx0xy8jz8lNcLAU75/9fuFt6F+PsgFBBGj5q5FCcfIqse?=
 =?us-ascii?Q?ti/632JSrnSQWQZe/l3Qb6bCi1b5Y0DcFFIJJf944JziQfrZfOFfjvOp67L+?=
 =?us-ascii?Q?lJ0rCwWvStQyb1AE8zUfb3nGAhNBprAL/yd1XJi0XtT0ZtL9YEr2ROf1ialn?=
 =?us-ascii?Q?sbydYvCJfQbD7tY235TBrhSOxHZ/qE6Otovr4GQbrWR+kDAIHh+R3tHuzCwh?=
 =?us-ascii?Q?gMnwH6SYGf77Un4Fo+UDA1D+brO62cwePPYHZjbRIMnS7xlfF9RGoJRqBhHl?=
 =?us-ascii?Q?TYNuOe9LX7kF4ZP1vxYJS/NWseBUzmwPSEASeIkgcOhn8BLN5q8Vm5/vVOtG?=
 =?us-ascii?Q?ZLnajD31hawtKgb6zWWZTXuOJGWaGuEBmP0IQzXLlQZCu98eE7jH28lWMRip?=
 =?us-ascii?Q?O9+WQqdj1nD3fPldTxogN12YXuIy8xMvHpB3FWKllPW0Vsg0dj1SWdPSg88h?=
 =?us-ascii?Q?uR+4ml8BBgdzFWSZ9dUlx1wza+zTNw0waNuUeC+rn1sAOOmpdQeJtkTiIIrO?=
 =?us-ascii?Q?bS3HM9W8I0w8VHZVYbnta3+r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85ad4d91-6ab6-407b-682d-08d903ea1e0d
X-MS-Exchange-CrossTenant-AuthSource: CY4PR12MB1463.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2021 10:50:31.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5JmSuwZPRS40RsVvuYyJ5NmVGXPQkYR+LJn/L7epya8DY2os/jMldVES90Fc/bxAch3j79HfmKmv4CrOJgwwPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR1201MB0056
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
Cc: Nirmoy Das <nirmoy.das@amd.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Releasing pinned BOs is illegal now.
UVD 6 was missing from:
commit 2f40801dc553 ("drm/amdgpu: make sure we unpin the UVD BO")

Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
index 760859880c1e..4eebf973a065 100644
--- a/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/uvd_v6_0.c
@@ -357,6 +357,7 @@ static int uvd_v6_0_enc_ring_test_ib(struct amdgpu_ring *ring, long timeout)
 
 error:
 	dma_fence_put(fence);
+	amdgpu_bo_unpin(bo);
 	amdgpu_bo_unreserve(bo);
 	amdgpu_bo_unref(&bo);
 	return r;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
