Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EFB390924
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 20:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E0916EAA2;
	Tue, 25 May 2021 18:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52A906EAA2;
 Tue, 25 May 2021 18:44:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQuXIhFqx3S3PKDZq9NBu/Trux0PyBGGjARR5FS1biyyFY9OlZIrx6bpfYwnROesTyVbbjOb+IuXOsIkZAgX4q2lvLNjRoH5KhDeXmyVt+e5GyeXCZYaiwOz6M3nq1wdRRgbIUtiMRdIVD5oaFOWqWIjD2rVUVfZkUX4L6NLy+9Jk49hctMvMkFx3lFs8WWHwjAphp3e46/ITzLfRUSnG1dKFZ8Dlz4yG/o453as6pb4LuFQQnP6JBQqsM7ncuvAjr/dpbyqaYs62TBSQsaWOYDagJRmBfS0J0i0Gzwhf5xxwx+pOPPPoHVlNwDRIo+fPcQgql+3X0uBvdE5zDtOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsl0ye3O0HGEECh4CCPKT8Fb5cY6K5DFbRxZb262xeY=;
 b=Wm9LbIDr1oCdiJBqEgLt8gvkpQtQ57gpklb/JEAwHbYVIa1BtKlUWuTUtbTFV8SSm+Ef7Q2EPTFVoL1iBKHq/nJtx80DoCtp/ZVB9HfbrTC99TGr40uryaRdETpEEj3kW8S0uXgmmWICIXVgGdE2iLGX1IiIowNzDshLMG/oSbjJQyGZNc1wbSdoC9ArLVL2dPzKqJzr9Z8drmwtvwXITxUFvS4DPKYYOcn+n7EuOFjDP5LyfXQmXziTiKUAvrEKOhTFsLFce2j8j8WE0/v+u2XkeFYEw36dKeXWcUHoJNz7fucpDHvMRGA1joZY2sxGzmtgheAweQfXdt0aOtSHXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsl0ye3O0HGEECh4CCPKT8Fb5cY6K5DFbRxZb262xeY=;
 b=bNWhRkcQ+qxD+rKp3dWX6pjM2w48LmmC0SVWdjnYs2/4CLO5vWsIFckYoAVXvaT9Sdr4n2gU50mFa9Hbaoj4ZOz5/7heJ6b53pbVvQTyDDsmzrAvytpfXWbxB01Vt9EpBTU4KS03IaQU5gJN29PBzXJJb7FCLp0ahAqHSIxhbVg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.25; Tue, 25 May
 2021 18:44:42 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4150.027; Tue, 25 May 2021
 18:44:42 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/amdgpu: Fix clang warning: unused label 'exit'
Date: Tue, 25 May 2021 14:44:31 -0400
Message-Id: <20210525184431.1170373-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:35f:c33c:6487:a4b7]
X-ClientProxiedBy: YTXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::28) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.amd.com
 (2607:fea8:3edf:49b0:35f:c33c:6487:a4b7) by
 YTXPR0101CA0051.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.27 via Frontend
 Transport; Tue, 25 May 2021 18:44:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b4f8b58-9843-4c3b-64de-08d91fad28b7
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44621A1C6F74036DEFB4F2B8EA259@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: arOi3Vzc3+AxlgX1yvbgTZlRvDYgUAunNaGyHWsRjklwanKNZEInjhUHgTAKOy2PoUjXX8b6Y+xLyQnL3C7LcBMFTT7CK5cgz/gxeOdHYDQ9zza8BEgODhS8j6W9+obmH20MVCZsOSqfAvF9ql5p7lcmC7QRdG3YNsIWwi7tqp9iREJK7kQPtAv4a6Zr9f6UQ9KurXPSgJEiYp/7SG/1h0QEgD8tsJ/gHzgQh9oxShzryqXclHrQPkz4vfCYZLZGhrT4I291/hGSkd1Gbrdm4PBdXebVvQ4KZGpNYZo3DUgo70JsVsNSIUdCPjomE4WRhRoKs7ErWNxL5RIN9UG8f+kdTChm/jQOSUbQ2QgjPTSuwSuLtpFaVK/BQ9q/0JZZY1gIttZtBQjXBY5HXiU91G3+4zFhKoomHt0/VSI+Yp/Hew3ZQP3uW7sAy8OafiZGKe+Q+tK8I87Ohyk4t61YdPQesmY7RhUhiTzmWXuXfr+j5mov57clSpxvxUpEWBz7CYa7shU4A46IaSMV1sg+kl4MANX8MlznS5Y9q021l3zGBiCgwUsMY+OBDyS51pNUYd40elp+E3oB5UHW1TXihonOaZ4DLJvdtlN/qPXBAr0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(39850400004)(136003)(346002)(366004)(1076003)(36756003)(8936002)(66476007)(86362001)(38100700002)(66946007)(52116002)(478600001)(6666004)(8676002)(4326008)(66556008)(6486002)(4744005)(44832011)(7696005)(54906003)(316002)(2616005)(5660300002)(186003)(2906002)(16526019)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eEqBeWyAQjECJYzAUVSmrb3462XeV2ivTxMZ7qLvegqgQ/s5Lr7l5VZoEISv?=
 =?us-ascii?Q?FAYrZtnzIH96kcymPX3DteNM/TILRFMlJKkqYQLaKdbuACWGlQogIdGdpP2g?=
 =?us-ascii?Q?X8BYO3J2y4gm62LE/zyQqaZCDhoF2NXMfKZK0r+C40kW2TmqMU1wQtrUhj5Y?=
 =?us-ascii?Q?x82fhQxuPiydcxQUJzQuAwhnciZpViRReca0Dva832K32cFUpR+UdfK1HG1A?=
 =?us-ascii?Q?ChFnydkcSqc6I+yu1B4+y0W/w+a2KtOQdEVwKUwaGVj2i4+r/IMZFH1WfM1i?=
 =?us-ascii?Q?mQ7YEBUHoLOk6vD6s2lvRdQIWfafU1CNvNVsW36bAd+6GHou/gpEVL7qtQzT?=
 =?us-ascii?Q?KKM+Tkyy/gSg6CHl3Mc8UzbfGVQgXkrCnNyVyt+fhKeE9VALZYzg/isIXKdd?=
 =?us-ascii?Q?Qy+jaUy5roORmwdEqRGRNrXxFRYMwxz1UKbr58SMkC/ZEKNpDbWjIQ/gxhZt?=
 =?us-ascii?Q?le1p79gqFa14c6N2s6DeuByjEbwzuqCFGu1V+4HRcK8B8f9l7d/Z+dIcVhsx?=
 =?us-ascii?Q?p76t7RAYnlsg3SBBPtcaQlDOSzVW/fqaeZRtRGeT52VY/XkEI8prcI2AwThz?=
 =?us-ascii?Q?A9mGDFnrYTKcnL8ldWi1rFkMlRvaQG2GABHeiTAp9nS2PaLXbqcbTFcpIkfQ?=
 =?us-ascii?Q?fSAGps3mbbLomB5nPP4GV6NQXcryOA0JAisEu52bwhiJAG0A7BNQtJ4s4NiV?=
 =?us-ascii?Q?aRxnZ1ZKhtx2aV8EbcRYt5nBH/ezyrV9ZQ8c0Rg4W56PWlIgLLqV9mO/sXBJ?=
 =?us-ascii?Q?z38RKurUWRQl3FrK+prCmziIMW5pseEAC+XxjeKm0N0zD3jGAOaaBZCjTSg/?=
 =?us-ascii?Q?zl6Yvh4PzEtyRxvOE/PJPpAapIvwlVkInRN8wv9lWQwZf04a6U7zbfWMRXUq?=
 =?us-ascii?Q?B9N//gztqU3ngSEsiFKE2qI+uEO7z+qis7RAA1NaH+aw2Rok1lLpagy/H1cZ?=
 =?us-ascii?Q?OkPqmtjqFMla89AgFYiAqs/Vq2jpV0BqTc7b0Zwy8Er4Uehzw9kSdo6HnxV0?=
 =?us-ascii?Q?HVdfpcAh1bhLccm/b5QwkmEe7jbpGOX+zadMTP0SeJF56u4UR6Fj1pLz0v2G?=
 =?us-ascii?Q?c1Kgc/24+duCXoxlC0b5eXc44k5WfLtbGZbM77JIWwNvIXcPeRmoCD4qfIZJ?=
 =?us-ascii?Q?bj9gHs/IUwC912nDEGNiw7KeoEz5a/vwK3o14lowwfkKZVlI5lYXSef/2LKJ?=
 =?us-ascii?Q?q910DiW39kgcG9dVe1zKFr6SUbXpI7POG/MYl9vKT3taNNORIxVEzqE99t5k?=
 =?us-ascii?Q?n4NLTiq9p8UuxsfPbFw9i8a5ATq/WH9Ht15fRzs4ay6yxnjBBwgi4nofZNSS?=
 =?us-ascii?Q?xYPmiPbSf8ZZis46UwJlX/xF3ID5q3SWbMwmq2uYGUyD2SFegeLCZ0ubAzai?=
 =?us-ascii?Q?oT/H+qEJ16atFiEXLZ8Kh8Iq3nBY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b4f8b58-9843-4c3b-64de-08d91fad28b7
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2021 18:44:42.5534 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nfnOc/vq3pl8tbr3ksWrKSrlEupaf6s/Qy864o9qz38kzPZggbYH98ClHF8LW75KGOAPTq83k8qM0yYRIUV7uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: Alexander.Deucher@amd.com, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Problem:
drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:332:1: warning: unused label 'exit' [-Wunused-label]
exit:
^~~~~

Fix: Put #ifdef CONFIG_64BIT around exit

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index c547c78f3513..a10b4a7ccf5d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -330,7 +330,9 @@ void amdgpu_device_vram_access(struct amdgpu_device *adev, loff_t pos,
 	}
 	spin_unlock_irqrestore(&adev->mmio_idx_lock, flags);
 
+#ifdef CONFIG_64BIT
 exit:
+#endif
 	drm_dev_exit(idx);
 }
 
-- 
2.25.1

