Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7C16379417
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D98926E8AD;
	Mon, 10 May 2021 16:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF7B26E8B1;
 Mon, 10 May 2021 16:36:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vg7o3wp+DC4aUqq18I66eCiemL+Twx/1x2OmdKqFUpD7aG5bmmoJE2paQpm+6sXunsAyJWcaJvbHxQYE6x4Zk0OjVGXSuR/ZMx8LBQR581ogjw8F/U8pLiGHZHe8kKXjrEHmeAzMDJfFdLOuFXkV5raTZ6K4hrsqcWMNGBiswWLk7tLeXF2tVvotkilRoNDiK72fbgM/2vAmYBlhIxc6ZutIsIFGtBc+Fs+E5OYuuqU8ix1xhsvUN1oi6tHWNhrUxbaY3dD1lJr1m50tkkIpi4hlsoeyAL7uttIjHl25wAgDuZzZGMKAUofszW1AOaHIRNNprT/d+P8l3sW6mTW+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzzgbK6At32mjHbaASDvGlUhyVoxCDoZ8d3LjhCC41A=;
 b=KIaqcBUbmUfHy/ZJzpS9rvlbr+FRzQRUH3X4qoNTBDBv4G2nWD9K0Coi68Bu1OYArzM3XJ6C86A3pqCL09XqsSVnWC1BbWh2XfwNrRDkLoqRuHhxThX9FqK0qkdPix3epCqAPDltgpajIOQsedX+qhn5JvdFEqBVNeUw9FDDmxNH3gIomenv1ZTtf3yj5LMYfwAKbDMUG08YwQ9PhTEEFuNa6LzTKEbvdMV90pkZ5f2o5RV17SI7NaHJ3131UR3OWCZN7t5fTKZghayjYfLVTMkHTtKhtxWScLss6QyBQ7CBPvRF4E/wAvyA1OJb364x36a1vYStSP572KPXYACoIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mzzgbK6At32mjHbaASDvGlUhyVoxCDoZ8d3LjhCC41A=;
 b=WTJlSUqmAh9MQpkzu2IRtkfWcOKMk2X40d433nVEf/RoySLGPYq6+bmfy9yXf4Jo86E1rXwigQBEHeUIV1Nuoo/wen+igZK0pyCIr9F32h23EtuNf1afk2/IYkGbfOLAzevY4eWsXTXHwiX49ewEKbmugl8bwJsZLeC3n6Wsm+k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 16:36:52 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:36:52 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 06/16] drm/amdgpu: Handle IOMMU enabled case.
Date: Mon, 10 May 2021 12:36:15 -0400
Message-Id: <20210510163625.407105-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:36:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48ba7869-5ef1-4baa-f203-08d913d1d105
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB446233CC44DD00C91A63A845EA549@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: q56mg5686nQa4vwuDM19EDLE29beIMJcRI85NU2P8MTFsSlOKqKQ4NmPtY9lm8HcsDXwhOJ9ordmzMxj6Ji96ZIbQwLUgtYDarVMsAzOAiEuX8dSA7d1XUIYzP/Ww0Alg06AZ/R+gdrqo39m6vSWo52jX1OfBbGd0Ivf4vNSDS4d/u5mKDFmVbGgh/l9Cd+JhZNcY3fhuJcXO4QFczqyqfh004ESDqzim3j6H2bKXldzYurc3EgNXosA8xC23N75zqvqqqO9tUfBfnjlqfKOLLeNEj3eqpbKBOu7NWj3PvrtP+SdHPmijJnembmO+rttMzQiGiMn+jqPdtf9r0km1px/VyJWOCkxyKDpzbtsY08RVSbsM+m0zNxk1rsxMt/bh39O0TqdKQ0ebB7MzICzdsRiCUD0LjsLHnq2w9LH949rTGIStN2FlSCuU8X47wrR0tUPDXo0irZkqPQE8ew3Ko8H5ch5DrJ4Zuskb1sqyUVePnL2o7HGr9CeF90TaNUH4Gqh6J2TbDtrArQWlQXp4Zf4fnEUhZjp0CVaAeFpfD8q51qY759UcBG9WRalqWkam/mAxEP9gqwvrhBwccJD07HykFqLTIKLfEsIWP8O4Ik=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(86362001)(6506007)(38100700002)(52116002)(6666004)(44832011)(8676002)(36756003)(5660300002)(478600001)(8936002)(2906002)(6486002)(66946007)(2616005)(66476007)(66556008)(1076003)(316002)(6636002)(6512007)(16526019)(186003)(83380400001)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?RrG2OfyILByiEQD4omNy1BzCZ1NpGMkFDOAqZ7tNFXHCDdSX95xaJ6wI9JpW?=
 =?us-ascii?Q?aoJKkep7Y6RO0yL3KRqc/4YmMYy/0VBm/vh00V+YRp2KLOVPjfBunPg8I+kT?=
 =?us-ascii?Q?P3i1WZcqN3v/gEcv6RkcJHXNB5LQjJkkKeA1RXPxUXRRzZTVsdD0zIauF8pl?=
 =?us-ascii?Q?ku6wC07yBlWj1TyLOMyIdEF+fD5sOUSzJsVH09OuwKMGKonKqTPUZQNfaOUd?=
 =?us-ascii?Q?1e46SqoXB9gUz6Fr3wibJD4EcNQvu+GaalgCdryyGd0AgmJQuRVph3YbeSBj?=
 =?us-ascii?Q?Cf7M66EV0mgtlNpvjO5LgJhGt5f+ONPPjHlH9z/gvdvi+GAHvRgI8MLlSI/N?=
 =?us-ascii?Q?lRFd6A2n2SeYAXEgi81JPbFWGMd2TvyUsTB6YQqBGHkz4nq/fXfPYoVp8Fyl?=
 =?us-ascii?Q?ks42lvAUB5hNV0EkewVPBPVR6Yp6RBTA3luhn0wG+/At9RZZZMak4lZXScPY?=
 =?us-ascii?Q?MQjvhpLvRBPnTk/5qjHHAMniS1K6AdydEEjmtQAp8n+aGYnnaqFwBVWDkm1c?=
 =?us-ascii?Q?s0vAbbnHl+fx7hM8t0Zew/5hMjotuIOTtn6XEn2KiXI+PhzGP1xUJ16UKlta?=
 =?us-ascii?Q?IRfjMS4p55pmM4uKKp8XNX4KTHnWOKwSYSi2ojwncwPKOaXZFAzBY+0vWecl?=
 =?us-ascii?Q?b0+JSsTbSU2cyyimwRbF79cMPs7qZ4KhxJ/HuYSXtPry8V8KyqqE0c3T4kG2?=
 =?us-ascii?Q?+3CZrZVW0iCZhNd7+9hlv7GE2sP8kKsCOArhXpu/QipFmtExGhjkkRhXRyvx?=
 =?us-ascii?Q?oE5Tr6Cg01zy/ksIAtap8DwybR7BCNo5CK/ZLBxlZmagyS2IsaUm+o9OGsdq?=
 =?us-ascii?Q?kcY3FXWLiPSQAGQSBHVvzF/nSSL5ICLIcII8ECiD8h5isxVpCVgn0egMKDzh?=
 =?us-ascii?Q?PFqmb1dILSngjawZprGvazVU4xDFuSf05D35no16gVjowzBYCvV85gGMuhrV?=
 =?us-ascii?Q?gKRujGhAdA73+zuY6FyWELQKJBUFQGNNNd3JG8i0L0alqWMbpaECHyCwkAM9?=
 =?us-ascii?Q?B7PCvtygz1KGON3pTgYN/BZxCBGUUncrMohcm1hTZCEmd7XoF2t8lnK/GZtz?=
 =?us-ascii?Q?dNRmxX0Q3Xbd+fXYdDiuQBxpHdeOj1H3aHbvoWAx2uQbUlnwlZ92kcdjdLZV?=
 =?us-ascii?Q?NblFZA93g5BSSdt11FIOW4rEDYrcRv7XxxFJVS2rjEtloqL54u4Og0AMMPZR?=
 =?us-ascii?Q?jdI5mxpDf2G4L1P7uGIxbFr0bg8gDsYj6hzawnDNpmBLaczTYrlIFthqUmsd?=
 =?us-ascii?Q?ySJUBkB5Btr0v+Y133mIS88UCHlDRGWz6pjRa/YTK3kl5OKnEYi8SHmJc+u1?=
 =?us-ascii?Q?340R7ObajYlaZ/G1Dgdvd3F2Zo9D/bqAeLY12s2mX82DmDC4Z157TD4AYLIq?=
 =?us-ascii?Q?h6G6iipUbBD+zviwBog+dsMAqo9O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ba7869-5ef1-4baa-f203-08d913d1d105
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:36:52.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pe4s73ZAdV4GfxrtmK+QZmKVCSpVyWIUxbdjEykzLJ9SO4uM6PntCMoDV3Fh2idfkcTEF/0QUq3zhHmX8xtcxg==
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Handle all DMA IOMMU gropup related dependencies before the
group is removed.

v5: Drop IOMMU notifier and switch to lockless call to ttm_tt_unpopulate
v6: Drop the BO unamp list

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c   | 3 +--
 drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h   | 1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c    | 9 +++++++++
 drivers/gpu/drm/amd/amdgpu/cik_ih.c        | 1 -
 drivers/gpu/drm/amd/amdgpu/cz_ih.c         | 1 -
 drivers/gpu/drm/amd/amdgpu/iceland_ih.c    | 1 -
 drivers/gpu/drm/amd/amdgpu/navi10_ih.c     | 3 ---
 drivers/gpu/drm/amd/amdgpu/si_ih.c         | 1 -
 drivers/gpu/drm/amd/amdgpu/tonga_ih.c      | 1 -
 drivers/gpu/drm/amd/amdgpu/vega10_ih.c     | 3 ---
 11 files changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 18598eda18f6..a0bff4713672 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3256,7 +3256,6 @@ static const struct attribute *amdgpu_dev_attributes[] = {
 	NULL
 };
 
-
 /**
  * amdgpu_device_init - initialize the driver
  *
@@ -3698,12 +3697,13 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 		amdgpu_ucode_sysfs_fini(adev);
 	sysfs_remove_files(&adev->dev->kobj, amdgpu_dev_attributes);
 
-
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
 
 	amdgpu_device_ip_fini_early(adev);
+
+	amdgpu_gart_dummy_page_fini(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
index c5a9a4fb10d2..354e68081b53 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
@@ -92,7 +92,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_device *adev)
  *
  * Frees the dummy page used by the driver (all asics).
  */
-static void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev)
 {
 	if (!adev->dummy_page_addr)
 		return;
@@ -375,5 +375,4 @@ int amdgpu_gart_init(struct amdgpu_device *adev)
  */
 void amdgpu_gart_fini(struct amdgpu_device *adev)
 {
-	amdgpu_gart_dummy_page_fini(adev);
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
index a25fe97b0196..78dc7a23da56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.h
@@ -58,6 +58,7 @@ int amdgpu_gart_table_vram_pin(struct amdgpu_device *adev);
 void amdgpu_gart_table_vram_unpin(struct amdgpu_device *adev);
 int amdgpu_gart_init(struct amdgpu_device *adev);
 void amdgpu_gart_fini(struct amdgpu_device *adev);
+void amdgpu_gart_dummy_page_fini(struct amdgpu_device *adev);
 int amdgpu_gart_unbind(struct amdgpu_device *adev, uint64_t offset,
 		       int pages);
 int amdgpu_gart_map(struct amdgpu_device *adev, uint64_t offset,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
index 233b64dab94b..a14973a7a9c9 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_irq.c
@@ -361,6 +361,15 @@ void amdgpu_irq_fini_hw(struct amdgpu_device *adev)
 		if (!amdgpu_device_has_dc_support(adev))
 			flush_work(&adev->hotplug_work);
 	}
+
+	if (adev->irq.ih_soft.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
+	if (adev->irq.ih.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih);
+	if (adev->irq.ih1.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
+	if (adev->irq.ih2.ring)
+		amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
 }
 
 /**
diff --git a/drivers/gpu/drm/amd/amdgpu/cik_ih.c b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
index 183d44a6583c..df385ffc9768 100644
--- a/drivers/gpu/drm/amd/amdgpu/cik_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cik_ih.c
@@ -310,7 +310,6 @@ static int cik_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/cz_ih.c b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
index d32743949003..b8c47e0cf37a 100644
--- a/drivers/gpu/drm/amd/amdgpu/cz_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/cz_ih.c
@@ -302,7 +302,6 @@ static int cz_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
index da96c6013477..ddfe4eaeea05 100644
--- a/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/iceland_ih.c
@@ -301,7 +301,6 @@ static int iceland_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
index 5eea4550b856..e171a9e78544 100644
--- a/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/navi10_ih.c
@@ -571,9 +571,6 @@ static int navi10_ih_sw_fini(void *handle)
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/si_ih.c b/drivers/gpu/drm/amd/amdgpu/si_ih.c
index 751307f3252c..9a24f17a5750 100644
--- a/drivers/gpu/drm/amd/amdgpu/si_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/si_ih.c
@@ -176,7 +176,6 @@ static int si_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
index 973d80ec7f6c..b08905d1c00f 100644
--- a/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/tonga_ih.c
@@ -313,7 +313,6 @@ static int tonga_ih_sw_fini(void *handle)
 	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
 
 	amdgpu_irq_fini_sw(adev);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 	amdgpu_irq_remove_domain(adev);
 
 	return 0;
diff --git a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
index dead9c2fbd4c..d78b8abe993a 100644
--- a/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
+++ b/drivers/gpu/drm/amd/amdgpu/vega10_ih.c
@@ -515,9 +515,6 @@ static int vega10_ih_sw_fini(void *handle)
 
 	amdgpu_irq_fini_sw(adev);
 	amdgpu_ih_ring_fini(adev, &adev->irq.ih_soft);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih2);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih1);
-	amdgpu_ih_ring_fini(adev, &adev->irq.ih);
 
 	return 0;
 }
-- 
2.25.1

