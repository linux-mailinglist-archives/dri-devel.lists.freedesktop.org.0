Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452225A284
	for <lists+dri-devel@lfdr.de>; Wed,  2 Sep 2020 03:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCEA6E03C;
	Wed,  2 Sep 2020 01:07:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2086.outbound.protection.outlook.com [40.107.223.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06ADB6E03C;
 Wed,  2 Sep 2020 01:07:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mpixOT+/ixf1zJZcs88n8WKeuiGv4+liJxdr5ft0LUJnZOXY03V0KZ86F9CUry+/eAO2AVU9AiYTzTuPcD0TiMq53niKfQZ3Ekh2PVtfQEv+d8BG3Avs65ut9FNZMsvSxMlSrn2nTAWvj01rnOjZM3LoDti6wmQoIv6VaaPB6/7M7tIVhme3w17lzygY998rqqXpxf74AhFnnfwhS0xqPCetFyIviIVOIG1Hu18i2Gg+oXMA943Iv3jY0oUGK6HLDil1JgnY1ODjSaXCHZAdOFbwTtK59AlMyOmQOA8Z9Sd+TK9rRg7V6IMFBR/TnTxHJo4xXHntPOeFLNMmjdOBNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr8Tq41MtpHbOQGTsUwfW1+cjCVdL3PnRV4UpgmKw3U=;
 b=TT5lDhDSthMIEb/AhoAR3DnNmvC9G1aUyYlReIJ1OYf4rRnon2I2ha10oj1wvBZKsM4XuZ+bAOC3TigijZgVt8sAFu1Z2OlBC/MfW7DExFJTskjG6S0gELsU8+YMyT9K08U7SA2dZvbiFP3CukLydPFk2geZPxUKqQbJD/TJgARsFElQue/dtRAIbzybc3JUUbygBG5It3/s53jxkm78VSnbCpYcQ8xgzkLJ4qDm9gJZUP+a2bfofWfNWSsk4ciB6+s2+ccqhSpqj0tNZkOUdpJQu37NcIN/E54Psgd4GRQk8138IyNB3E9tx1C1kQBxbHe7gQFOBsEfnTDEMN/R4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rr8Tq41MtpHbOQGTsUwfW1+cjCVdL3PnRV4UpgmKw3U=;
 b=dBfiZePAJz93WbcGNkbmhzw9WpR3MA+QFc5IeOQ5+lFCxN+Av34YspkCRAmLQT8wUu1Y1iDanaJ9fVgqmFpr1vwmnxr6ySFmQGA7Nn+lphJeUEs23lk+zmasmAwnslKFo518/N8eYclHBqPTNfzvT6m5N18S39c7GWm0VkJiN4A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3962.namprd12.prod.outlook.com (2603:10b6:5:1ce::21)
 by DM6PR12MB4516.namprd12.prod.outlook.com (2603:10b6:5:2ac::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3326.23; Wed, 2 Sep
 2020 01:07:17 +0000
Received: from DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e]) by DM6PR12MB3962.namprd12.prod.outlook.com
 ([fe80::3452:6d8f:e0ef:b45e%6]) with mapi id 15.20.3326.025; Wed, 2 Sep 2020
 01:07:17 +0000
From: Luben Tuikov <luben.tuikov@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/amdgpu: Remove drmm final free
Date: Tue,  1 Sep 2020 21:06:44 -0400
Message-Id: <20200902010645.26943-3-luben.tuikov@amd.com>
X-Mailer: git-send-email 2.28.0.394.ge197136389
In-Reply-To: <20200902010645.26943-1-luben.tuikov@amd.com>
References: <20200902010645.26943-1-luben.tuikov@amd.com>
X-ClientProxiedBy: YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::25) To DM6PR12MB3962.namprd12.prod.outlook.com
 (2603:10b6:5:1ce::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 255.255.255.255 (255.255.255.255) by
 YTXPR0101CA0012.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3348.15 via Frontend Transport; Wed, 2 Sep 2020 01:07:17 +0000
X-Mailer: git-send-email 2.28.0.394.ge197136389
X-Originating-IP: [165.204.55.250]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ae83c2ff-6f72-4730-d073-08d84edc8939
X-MS-TrafficTypeDiagnostic: DM6PR12MB4516:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB45169D7DEEDA34C362918005992F0@DM6PR12MB4516.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OdXigMJO8qGxFZUSKtfcST4LIc7XO71LxlBLYGxUiwvMfHNw7ZOcwn9q0oN/LeZ1UdT5NWJt+6jDFLreQsYZkIZV5Dcfv7sq+zlMsVc/nfLpYATlIoqPSs9dHrABwhO2X2JQtfdid2hl451vP2unruGMg/7zMHd21h1dJPH9gYGPsYMioULDPe3AhND8A8rCyG23n73B9zV+pVQuMvStrEroTc4sm8kbDVJ2ifoJgIYC3vN/dIk0VQvGsc1Evy8p+BJiRTWqhlEUj8Nm/MtsDVTx4TVlgr/lzjNoYDFoXdi6UzJmYdZMLxvCJ0M37136LKBKuGTRQp8oWlK6o8WOKA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3962.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(136003)(346002)(366004)(8676002)(956004)(5660300002)(8936002)(44832011)(26005)(66946007)(66556008)(66476007)(478600001)(4326008)(54906003)(6666004)(86362001)(186003)(1076003)(4744005)(6486002)(2616005)(316002)(83380400001)(16576012)(2906002)(52116002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 0+n7B+zyMNBFXwT8xB0xJd7T1ZDTxEuzv39hPM/uQxxjSOTjYgsKK6p4c+PHKd79Mkg04awS5W16iYBw828f+hWret/3I+9CAiVGvu7cl5gjUlMzwRo588R7iAcdB3VfnuVdVQ0PPNcfoho6AuUtEi1pJ0LDLAuprHIG4tsyuBJ6wvUv4FCmHz6Z88eWUD3uvRpm2ZvFz8jSYZWfZYRE0DNYpP3R9VK3JT7ZGwjUWygD7VBOWhYcqSjjxZZNwCGUeuPtcQ9XwL9Tr/fM9mIzbZ2toXziQg9a6QZ/57uz0P0F8GiePMU/qhdtV/UyTsJ10FpEyW7IbCQIrB8ZakG0LVYAmrud218MnsLimPyU/SZoCdHfMa7xBpqPKnXfG9bWsLMlCPslyefyId/CVIgl8NSbPiFglGLDuf+TcJR76S5mvdvuh4TGQrHLsUkp92Lm35fnomx5hUeqO+UYTJ3G3md5V+WBaXZ2psrHN4+TP5+x9RBkaAWRo6qQLYB/ofuroC83FBetuAXtlJvrNa/r1E6Qz5jLWWo5KjVOvjoc27dykDWtMNTdWuJa2Tx6bvx6OpvrbXTvjddVikzeB2yTreBLl4tgOUTBzeANMtoYiVunVQGYhXYO1f/32jJJ+VgyKi7OKKP+m0cylvdfaAqRMQ==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae83c2ff-6f72-4730-d073-08d84edc8939
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3962.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2020 01:07:17.7353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seoi1zaFrjGf7spLnBJm1WQbW7m9jleZN18Rnl6LmD1kbrzhXtPxRHkdyvv1E51h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4516
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
 Luben Tuikov <luben.tuikov@amd.com>, Xinhui.Pan@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The amdgpu driver implements its own DRM driver
release function which naturally frees
the container struct amdgpu_device of
the DRM device, on a "final" kref-put,
i.e. when the kref transitions from non-zero
to 0.

Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 459cf13e76fe..17d49f1d86e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -1153,8 +1153,6 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
 	if (ret)
 		goto err_free;
 
-	drmm_add_final_kfree(ddev, ddev);
-
 	if (!supports_atomic)
 		ddev->driver_features &= ~DRIVER_ATOMIC;
 
-- 
2.28.0.394.ge197136389

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
