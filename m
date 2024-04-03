Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A24E2896B59
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 12:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5540112987;
	Wed,  3 Apr 2024 10:03:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wy/NV1aC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2045.outbound.protection.outlook.com [40.107.95.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7044112987
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 10:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V6vmiObQGxep7CyZvETViX/qMaDLWQ45Xm4cY+pJ1iltLTqV7BlEhDdxkpJ1Ot3iHMM+WB/R1dR/7JFtKuwfRlpZ+5EIw2KDe0phYoPtt4GuuFz3ZvWG8hptbmm6we0AirfKlGEr3/1ztexOzUEpD062k6YoL/zFZAlzzZlpmFs1wvmWBgy9BC6yYYcjcQgMGHGZeIawv4Ap6SZeFluRCSN4i3NDnnucHN1rSH9agdiIqEUK0qO5MW9euCbmnU4prwCNNOjJXWNitwvlRZy5UCxX0QMLnYPmhtp50gKAMZOK/KIEaEOsNgacUU1k4LT658vWCgJtjAulXu1mwQGHmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mhBThdEUzaYhLfI6TzrpLZ2gFmkhzZ0eCX/hbtui6NY=;
 b=WGBclbJ/sFqPf/fiJNE3Ymxag7Gr45s4JYjjdaxwNNEDmhXWICambqjQob1aHQpcSye4z393B4bMtjgr8SmfqFUJC0VUrzgQS9JdskPD/7ZPQFJi0GjDj1CKiVcnkEQxI1fOYj008zW4/mqSlJqdxQXluN25CBAn56Nwn/T8mY/9aZ6Sza8bBoQj0esGBaMgyXAIQTOiPBfBc/iQIU8gq5XNCQ/PJ+bTE9+l4c76brtMbTlXgjyYCo3zYL18i873zZghgstYbvofLRFqw2u1YCjAhTvg20TFz0DfK3/WcUrAbekwWRVfisAYhS0H2M1Y5ieZ83wYMLVhTDs/8qKf5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=gondor.apana.org.au
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mhBThdEUzaYhLfI6TzrpLZ2gFmkhzZ0eCX/hbtui6NY=;
 b=Wy/NV1aCNyfoGfSIP3IqpJwL1MMfEx1d+feMSrLsREIUBwH9UsqN9g1GDyJP1eq6/aLJf4T7h17Ugpw1ubqXL0z6ZcLK72ksR8I4+VMl2Jeewg6ALPOiPVd+5H5jIKtrBMnNFpbdb7WdkndhT8XcQdC768gGji1fniIlofjquRlXssxjSOjfvBY65ne6hLfvBbWPFwrfThLYvmzdiSUA4IO/6pm9pGntyy1f/1Ajj9Eu8Qf8zJbQts3MPMriGH+EHBQ4VKAxzrJJWBng+I+tAijLp38VKaI0dof8Zpn1Y3r2QPJq5suzN/eYSJLUBeoGNEbRC2OKJuq3fBBFvIvsIg==
Received: from MN2PR02CA0018.namprd02.prod.outlook.com (2603:10b6:208:fc::31)
 by PH7PR12MB8154.namprd12.prod.outlook.com (2603:10b6:510:2b9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Wed, 3 Apr
 2024 10:02:58 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:fc:cafe::2b) by MN2PR02CA0018.outlook.office365.com
 (2603:10b6:208:fc::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26 via Frontend
 Transport; Wed, 3 Apr 2024 10:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 3 Apr 2024 10:02:57 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Wed, 3 Apr 2024
 03:02:41 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.12; Wed, 3 Apr 2024 03:02:41 -0700
Received: from BUILDSERVER-IO-L4T.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.1258.12 via
 Frontend Transport; Wed, 3 Apr 2024 03:02:36 -0700
From: Akhil R <akhilrajeev@nvidia.com>
To: <herbert@gondor.apana.org.au>, <davem@davemloft.net>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <catalin.marinas@arm.com>, <will@kernel.org>, <mperttunen@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <dri-devel@lists.freedesktop.org>
CC: Akhil R <akhilrajeev@nvidia.com>
Subject: [PATCH v7 4/5] arm64: defconfig: Enable Tegra Security Engine
Date: Wed, 3 Apr 2024 15:30:38 +0530
Message-ID: <20240403100039.33146-5-akhilrajeev@nvidia.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240403100039.33146-1-akhilrajeev@nvidia.com>
References: <20240403100039.33146-1-akhilrajeev@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|PH7PR12MB8154:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ee09392-0978-4291-1c64-08dc53c53cd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4CT6/yP0X5/Pxld8uhQqOR4l5Me9iiKKAqn6TbGQhD4FaCPLFPee0k6cTCA5xXlGnXMFYRZOaiDIyXFzdb363O/kXLSTB8DNezckFkUkkUHf00CT05ebSRqo53OOCJ+GgrsJkZ9x4aMOxn98sUVBI4IVy8o9I2K7pSZqWet44sc7B+1yCXtUmHq546TCLuyTL0TA5uz+Ld0ao8rPW2stmIqrGSjWjuR1kCNFNUIJKM5NtfjA2YkKnR9ICzPSX8Eqz5G9hVrSKMbliQXUVDLBkQqTVeg0PqV9xl4npNLcBwjXIfEzKYyjqCA3Xn5wl9w3aFFN/K8p0weFpwWjfqPJ1aDAfYMCkoQ8+rqrKFL/eMoTzYfuOod3n8WP2mBRBgLZy6wrV5Mv6n+oMjotEIyVH2h2ifn/5BifO/x9DOsNIP1Dt5ZeoMjiyutYZH3y5VAJNjCq17jwJWlkzujqnFXBBdLcXb7GSWnF45gilghGbqDv7egMFY3D+80rQ6d7BBJ95Xcfuy2RjfKx5myykubh0Qm/i8vGX4RYRrYyNkbhIFYxK+Z9IH0pwbEjtXQNsCeHla6ehfndPnnGGFK9JzLiKfLLAV7ZG9x6Vbq89hN0bYeMNuMjh8OoQoOS9YQ/qdRD7c+uJaXOkS+7zIhfx1nl/1+VmNtGYehFApyYWxNdBZMPvpzvADOVFPGv+qmdr2rvVl9/PmJddmM+KZrCyp1L0jrlX7bOSjt+yCNpo5NjK1dJkbF/4rHa5ESwzxaHy9yQRrGSMa2MB9wPwzOTLR7Vg==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(7416005)(376005)(82310400014)(1800799015)(921011);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 10:02:57.1670 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee09392-0978-4291-1c64-08dc53c53cd0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8154
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable Tegra Security Engine which can accelerate various
AES and HASH algorithms on supported hardware.

Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..af6f247c497c 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1647,6 +1647,7 @@ CONFIG_CRYPTO_DEV_FSL_CAAM=m
 CONFIG_CRYPTO_DEV_FSL_DPAA2_CAAM=m
 CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_QCOM_RNG=m
+CONFIG_CRYPTO_DEV_TEGRA=m
 CONFIG_CRYPTO_DEV_CCREE=m
 CONFIG_CRYPTO_DEV_HISI_SEC2=m
 CONFIG_CRYPTO_DEV_HISI_ZIP=m
-- 
2.43.2

