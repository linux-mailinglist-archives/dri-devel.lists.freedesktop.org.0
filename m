Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D46E25CF0E
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 03:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 824616E219;
	Fri,  4 Sep 2020 01:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2089.outbound.protection.outlook.com [40.107.223.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8951B6E039;
 Fri,  4 Sep 2020 01:22:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b25xCZrKFJK2pJXDU6dEx/Uqhm+TRi3We1Xvh7jFp/0+TvjMBP+YvNjqf0MgW7z9Hts/5lGYODxUUipqMzs2wGfFc0v0yH55vCo9JzFf83RGUrMhIS6eh8nWhIsox4u7rgYVCO3wrJuBnMAzX395yIhiNFrGV8ADLywyT4AiImONYusXvNteXamgac/pnI5wVbIdNONSwJw05Ty4z9dzLtR3Wo9Aw7ZmDOmWftte7PdPd/PlTb/IJyPIyWYvD84x3bZTwv7Wk6BuU1zY0zTBq91DfDQhhxBwZ6AnNfbDkcbQ8M5bT2+20T7tVJgHHI7/bjqYK+QAzKwsumzLDLlALw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7VKyZCK7iti4Praqtgyfx6JaRcFnaqXk2X1dFX0e5k=;
 b=PHW5uHYZiL6/fc7h40Tjj9ZYVEX1qITL2G7RfkLGtY1WnrLKpr+FoMZVFo5/iQi1G9/fBKnGtiQHzWwfu727HTeskYTgOjZTGyfdm1bcGD4nhzOgJ4DMJr366JUmRt/W/a5FrsXscOUzM7WqSLsgSNVwO2qjNn6YCJfWrEHx/3yPV5L4NBQs7zpEt9yvyIsIIPTMP9JqapMxLIWDdg5RPeG0IbSMKKCjDKD9tSRY3TEVhym9bEDUcENMP3AdLInxU0cZy3ldKiyJFX5HocPYDkTmFF46HGfYNYnNGv42dq1Xrv7TTm2LQtFlEHjI9bRtT5efjeifiqfbNggC/Gru/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R7VKyZCK7iti4Praqtgyfx6JaRcFnaqXk2X1dFX0e5k=;
 b=MMa2Rlcrbm/lkvMGurkpe25j/x1/SuoryoVTRu/pL67zf+DAL/V5Dxp7UR7H/06LbZAgcFDm7MLh2xK3nhUDMDf1VPfTPlpV/5Wk6vn032SldSe+7HPVRoWKAY052ErFgHCMgVyA/Ka9XZiYIW6nyfHahAG7XqzAl+/InEF0P4o=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM5PR12MB1452.namprd12.prod.outlook.com (2603:10b6:4:a::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3326.23; Fri, 4 Sep 2020 01:22:31 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3348.016; Fri, 4 Sep 2020
 01:22:31 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/1] drm/amdgpu: Convert to using devm_drm_dev_alloc()
Date: Thu,  3 Sep 2020 21:22:18 -0400
Message-Id: <20200904012218.4971-2-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
In-Reply-To: <20200904012218.4971-1-luben.tuikov@amd.com>
References: <20200904012218.4971-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::42) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain.amd.com (165.204.55.250) by
 YTOPR0101CA0029.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3348.15 via Frontend
 Transport; Fri, 4 Sep 2020 01:22:30 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 661715be-1468-4697-3af7-08d85070fe60
X-MS-TrafficTypeDiagnostic: DM5PR12MB1452:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1452657CF39D88AB222F52FE992D0@DM5PR12MB1452.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:374;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jQF8DGP1FnIW8U4u29Giq7E/BmRA0AsGVc5k0n16BYPqZhqJWd75qlyxbHPuNe+2R7DRrTcVk6MLPNyaylucvs/emWXcPoZvGhUrqupztGvYUWW4ZFjPGV5TiPS+zp00rkeU0wCTI2ZwIKK+KfLWT7SsNJuHXftj6vFYJrP9EvIOvTPmb4TxaeKSoPczobvUBh2quzU0nLtRwQ1TjSuAQu5bx7FhqDppSSbqAyrkZuXHQwYv4e2kyy0TVFp4y67dRkjo89HRkPtrG5jF+eBnCYP0w+vs0NNd9b3ob+K3tEjwEgH5LM44BfbM2L2TcbsW12Np2QlfMtn7Fq6qdqfZA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39860400002)(136003)(376002)(396003)(366004)(8936002)(66476007)(6666004)(66946007)(1076003)(316002)(16526019)(478600001)(44832011)(6486002)(5660300002)(54906003)(66556008)(8676002)(26005)(36756003)(2906002)(52116002)(7696005)(83380400001)(4326008)(956004)(86362001)(2616005)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: kAnS9SBifG6GhKZAsAqwlV2LFnM0G+JzsxZWcjn05hTADlAqhPtOyBOSl+1fFjlZc84AwzG9dVuufQ4JQfx5ILJFkY19VHEOmd52Ri8r6AQdXgcMUmH7csGZth5kq8mq7RUcoECmsWsVu0KLsWWd40O+Pw8SIReGHMzyq4swFbGo07O7n1OiuaEWpUOGIkybuZP4xwPIQfkF7E+b+FPCHtokmWPD+RuQ8EaViSZD6+P68Y8bwKoIvKCvOBhJkFv1OwFLeQAXma12ItOW9qWEN+UlBuchIkJLsfOKixBBobMrHqzTbBldEjh6LjJMgPliiMzE9nRxAj5OC98EDPaK0E1eHZFjXJc/QGiLviX9JN/BU8R7IHC8KaJ2EMsQJnj77cYDVp7DTzYwK5mUnTVAlR4UPqXTecDu4Rmt9rbJsXtRH3yR+d/YjW0zbvsqxaaKIYWGiGGmjjb3LknbDP4B9B4l3EiudCriJPpJlwQc/XuA/oxEF+Plc3u09w04o9dE9G4mFULd2MTR2/v1jhhchsPK/ivPf2jaSKjQ3BvNFJ9367mS2s1+5JelJt4bfrzAm+zz2x5/qQkkD6kWMGow6wBVBZW1psvkPaHOfKuQKEtIh/iswXFqKoJDYFUS/K/avoMnz0dtdkKFcsDbMWpxyA==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 661715be-1468-4697-3af7-08d85070fe60
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2020 01:22:30.9132 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mljq7hF77v35EeLWWbS+HFAUIc9GgGfsPRDvWpW3IHQV9TBBaFcQRwXOGqFLaXLn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1452
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
Cc: Alexander Deucher <Alexander.Deucher@amd.com>,
 Luben Tuikov <luben.tuikov@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert to using devm_drm_dev_alloc(),
as drm_dev_init() is going away.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 146a85c8df1c..06d994187c24 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1142,18 +1142,13 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		return ret;
 
-	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
-	if (!adev)
-		return -ENOMEM;
+	adev = devm_drm_dev_alloc(&pdev->dev, &kms_driver, typeof(*adev), ddev);
+	if (IS_ERR(adev))
+		return PTR_ERR(adev);
 
 	adev->dev  = &pdev->dev;
 	adev->pdev = pdev;
 	ddev = adev_to_drm(adev);
-	ret = drm_dev_init(ddev, &kms_driver, &pdev->dev);
-	if (ret)
-		goto err_free;
-
-	drmm_add_final_kfree(ddev, adev);
 
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
