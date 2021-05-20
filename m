Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E016389BCE
	for <lists+dri-devel@lfdr.de>; Thu, 20 May 2021 05:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC966E323;
	Thu, 20 May 2021 03:21:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCB26E323;
 Thu, 20 May 2021 03:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YGs2ARB+FP8pdegzsalwbq5XDnEB+23yL425/0HxwHIIWQWt/Z8IS1FyhfO6+6E1X82bGoHOknYh1gh9Rv8+bXXtZZZeus7VTDUehE7XjDB2AylJGflVizPIGxIPennNTT/EnUcqDROfKwCQe0e57xWFPbkLt6MAhry4wDue4JF+c1eDDt3Nx7kLlR3ahhuNd3ZCZW0xKdQTUpz/GnV6f088StjU14ASVwQhEi77lVbiw1Vr6nEOovV9BrGALNbkdbcdu7i/ZWlHCDqQWItsATkjf5yxQvNrbLfNcgByWw7+A8rOL8l+reAb4x88SKHHUrsMiXNGPHHLa7Hrr0n84g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFuDU6XxOnvDBO9eG4wfkvbyFAjPnORcxBq1DCHGBuk=;
 b=dVjWPZqQxu1WAj/FBJ3FSSPPPiNGM7vGz39UdJYOLGpvu5ontfh1/xCpMI8Oon7TnzH9yCXmuLiowFoTpm1fnu3vYF/wlCtNURT5XJdv7us5QxHF7yuCroqZn9k6vfYLmEXLJA9tfkhdJsU4Sx1HMClH36iZzcBscRX1Nvk0PWee1dE9jxzci21mUn5G8uywCRj/j7c4m6zqEpkC7NnVG7fcYxzQNyOJfp3z7qvEZkm7t6US7kD2xIzL4tHEa/QxQroRl3ud7DxKK44tOZGoBmJ7Zz4INH2bQIo5Jar+e+sIIbESlJKf+vFvqgi9VakEOz81+18FmiTMPabxZPzorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFuDU6XxOnvDBO9eG4wfkvbyFAjPnORcxBq1DCHGBuk=;
 b=wf4X/6de3V45nRMmW2V6agAgFz5UGkMhKxQncreaJzYbtOLrvXuA+7Nl67+CnUYOCpUbRLrGVsS5Xn+1jRx6hnhh5hsBOvGQGB1hkckoBTzosz+ypZx+PrNVkH0fmn0EyWKlQBn3xB6pfKoLRhmPe3tzMzjkAdyyFVWqX/iTnoM=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4541.namprd12.prod.outlook.com (2603:10b6:806:9e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Thu, 20 May
 2021 03:21:13 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.033; Thu, 20 May 2021
 03:21:12 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com, Felix.Kuehling@amd.com
Subject: [PATCH] drm/amdgpu: Add early fini callback
Date: Wed, 19 May 2021 23:20:57 -0400
Message-Id: <20210520032057.497334-1-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
References: <d17c82ae-ce00-9496-b2ed-8761814f51fe@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Originating-IP: [2607:fea8:3edf:49b0:9c48:15d0:c2cd:c6e0]
X-ClientProxiedBy: YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::12) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:9c48:15d0:c2cd:c6e0) by
 YT1PR01CA0043.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Thu, 20 May 2021 03:21:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa13e93b-284b-45ab-30dc-08d91b3e51d8
X-MS-TrafficTypeDiagnostic: SA0PR12MB4541:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB454138D4AD33283E51FB8D2AEA2A9@SA0PR12MB4541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:551;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXCaiveV9+oEa46rjkOIDAf8qy3dmAXme9BGaCqRiADDGd1sYH/QesXdPHxcWU8pjLxNIyV85GcUcaidrwEcZ24cr1d1CGlQ0f4PKkEkHqvslBuK1TJwQ6Fixdxnd84f0SPiYkb62T8WOWEhetjocpSx3ZJkk0TdeHeg3Ldcbx+3FcPRhOI9WS7oXdI4/UBQ0zTlhGdIBMg94vy1qc7k5SGimF4ytlQ3uDvGj2gzEvXJwos9gcJRl8r1+Ag+166zi3CBNILA/rt2p1Tun7gLPmlAvJYgCDSko3eXC1eN8R0jmuTrkdnLbNAsQvUChnWHV18iOQi1FbxFWt2jNlfJ8Z5oMp2eidNvfCeHUR9G8i4nMgbm2ozBQVd929eTsFO2DMjgVAj8qzeonLsZ7w79Cc26+K2NiL7TvNzJqvhzIodkpGOPAZDHvb3n35I3Txnz7fQmlmzmQoz/sx6tVqiajbIvJOHuX7PAOJnNWQBN5w0VmPf0N3+8tcqblBsPimSo756gXq678SO64JGHP2Yh8+SFg0o8ZbPTMM9UXZX5O+8ZAUXZPdrXEiUeyEvksjnfeaMYQairvyoeDoQQy+hvVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(2906002)(316002)(16526019)(6666004)(186003)(2616005)(86362001)(8676002)(6636002)(36756003)(54906003)(66946007)(478600001)(1076003)(4326008)(66556008)(6512007)(66476007)(66574015)(6486002)(5660300002)(83380400001)(6506007)(44832011)(52116002)(8936002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?WmNnbGw3b0MydUU2ZlFsaVBBdFdxSXNqcnNGa3NRYlpzOEd6SUs0MFZqdWww?=
 =?utf-8?B?VmwvaFNBc1laN1pPOE9uTWVvam9KUWVCY3YvaTU1N0VuTXo3SzBhUDIzdkdo?=
 =?utf-8?B?TGcydzRCNDRTaXNVSW1MS1plRUlhQmFFazhpM0xKU3A5Smx4R0kranFpT3lF?=
 =?utf-8?B?ekhKVEJ3OHdodWpLekxHLzRuZUVtbGZ1ZzRtR2s2OVk5YlZrZVlmdnhCTFZj?=
 =?utf-8?B?d2VLVGFYYjRUUXgrSG1KTitucGNuWmpXTlRwbkNwSGdvbklPVWtiVUFtelFj?=
 =?utf-8?B?V2p1NjhaKzBZam0vRXdVczdQbGRoVUkxUGFUaXl6aE05amtQRXFzVkR2QnJO?=
 =?utf-8?B?V216aHVzNUQvcDhrTUs3ZU4wTlJFVmVNa3gyM1VBdjU2UmpZQm1QL2JIVElR?=
 =?utf-8?B?aURwdnF5NndFcmQ3TFRwVytkMEZYOE1keUtSd1d2NG5HVVdFZWFJckJjcWRX?=
 =?utf-8?B?UGxIQlJnclJQRFZTMXdZNDZkSnhIUmFyc3RDeXpubU1ON2VFQ21qeVhUbFY2?=
 =?utf-8?B?SSsyYTR2SkVYbjhESEJPSXV4S0Q2N3JNdmRnL015c1htOG94UGdMYit0cmNv?=
 =?utf-8?B?cHEzcDNybExiNkhkaE5wZE5DNno2ZjFsa0wxWnJOTm5admVMeWJRT0NYVXhn?=
 =?utf-8?B?TncrSTdCSHR1bGlrSHJtYUpxMW01dnlINkhENWZqWTBHdms4MllPUnViT3Zu?=
 =?utf-8?B?Z1dzZm9ka0FGbjhWYzVlTDR2UzF5RDJIQVJSZDJkd2N0WjF3QmhrNDNvQWp2?=
 =?utf-8?B?anJjOUFGWkptdlVGSG1PSG54SVB0aE9IdHB5UEt6QWpyNnN4c0ZSaUE4UTFi?=
 =?utf-8?B?NnlTQ3l3RVMyY2wwOFdUSGh1KzF0TEZoUEprQStXTmdOVklVcm1WOXZHMGx5?=
 =?utf-8?B?SVo5VSt6dzd6Z3FBU29ZNUNab24xWEUvYlA0a1NTUExGUkozanJaaDNNNnVR?=
 =?utf-8?B?Y2FIS0Nhd0tOejhTNHRXeTdSaEo1aE0rcW5CMGdzcVd3SzZtZ09SeC9Eam9K?=
 =?utf-8?B?WndBNmxUdWNMSmZwZFR6NEhLUUYrMWlaVlo4WTN4Tmlib0NSNHBPMFp4eVht?=
 =?utf-8?B?WnlJV0J5L0N6ZDR2WXdpY3Y2dTMyTkl0NW1MYXpqQ1BRSFBvT1FqWm42WUt5?=
 =?utf-8?B?UjdqVElBWkRVZTNWRmU1UTZZbm9tYVZkUnlxbWVzYy93emd4S1J3U2lrWjlz?=
 =?utf-8?B?cU5ObkMvVXJSWlJlSjl1WE42UkQ0NWppUnpidmRmeDd2ekpIcjdkb1VsNHg4?=
 =?utf-8?B?K0phekxNd2pRYmtmNkIwUzZjT1lmVkJUZHNhczQvVlE2OVEzTjZpN2o4QjhU?=
 =?utf-8?B?MlRmWkdEWjFNTEVkaldOcGtZS1M1dVVSc0RZTFdNSDZ5ZnRSUVI3WC9ORjZ2?=
 =?utf-8?B?elU1MmNWTkgva0JBT2taZ3IzakVSS2FGT2dhQXJCWUo0L1JOZ1ZOK2VXd1c2?=
 =?utf-8?B?SVA5dE5lVFluMjZHUmlsUU1xR25CWTJ2TmNoZFJ5aWd5NjlRamdDUnZHemFF?=
 =?utf-8?B?RXgzL3hrL0ZCQzlMOVpSVDZ4Wlpid1JZOUxyUGM4WkJMNHpaNVBLRFBEZUE1?=
 =?utf-8?B?TUp3aDBQcGV4ZzNSdElHRndEdDR5bnV4OUNZVlV6R001MDJRNXJYcDhkRUY3?=
 =?utf-8?B?QnYwRzNTTVJIL3I4TGJqeENJZk5kNkg4WnNMcmlTZEkzMk56TEUwV0FpTUl1?=
 =?utf-8?B?VW1lNk1rUDBoeGxpVDd5SHlWYk90d0lHbE51UEFjcE9ubXo3RnVVUHdCNzVC?=
 =?utf-8?B?cnVyZmFrZDNXblNoWk0rOXVyMEJuNzZqRDdudko3SlZKYjkrY3J4WEVpSjRR?=
 =?utf-8?B?Q2pyVGpJNU9aTGJVcW1BTUw0STFaamh3dlhxR29WZUdWUEJHVDFsTmN1Y25U?=
 =?utf-8?Q?6OpIMzrPwdE8C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa13e93b-284b-45ab-30dc-08d91b3e51d8
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2021 03:21:12.6879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GMQkp8d3l5FASHD0+OJs2VPC2gZP6g8GfCTFZL8EuXpQXRi0mhCDcxFXxpeM28Ueh4MbeeQLlAbXPwsEWiZ1rA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4541
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
Cc: gregkh@linuxfoundation.org, helgaas@kernel.org, Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use it to call disply code dependent on device->drv_data
before it's set to NULL on device unplug

v5:
Move HW finilization into this callback to prevent MMIO accesses
post cpi remove.

v7:
Split kfd suspend from device exit to expdite HW related
stuff to amdgpu_pci_remove

v8:
Squash previous KFD commit into this commit to avoid compile break.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Acked-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 59 +++++++++++++------
 drivers/gpu/drm/amd/amdkfd/kfd_device.c       |  3 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 12 +++-
 drivers/gpu/drm/amd/include/amd_shared.h      |  2 +
 6 files changed, 56 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
index 5f6696a3c778..2b06dee9a0ce 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
@@ -170,7 +170,7 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
 	}
 }
 
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev)
 {
 	if (adev->kfd.dev) {
 		kgd2kfd_device_exit(adev->kfd.dev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 5ffb07b02810..d8a537e8aea5 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -127,7 +127,7 @@ void amdgpu_amdkfd_interrupt(struct amdgpu_device *adev,
 			const void *ih_ring_entry);
 void amdgpu_amdkfd_device_probe(struct amdgpu_device *adev);
 void amdgpu_amdkfd_device_init(struct amdgpu_device *adev);
-void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev);
+void amdgpu_amdkfd_device_fini_sw(struct amdgpu_device *adev);
 int amdgpu_amdkfd_submit_ib(struct kgd_dev *kgd, enum kgd_engine_type engine,
 				uint32_t vmid, uint64_t gpu_addr,
 				uint32_t *ib_cmd, uint32_t ib_len);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 8bee95ad32d9..bc75e35dd8d8 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2558,34 +2558,26 @@ static int amdgpu_device_ip_late_init(struct amdgpu_device *adev)
 	return 0;
 }
 
-/**
- * amdgpu_device_ip_fini - run fini for hardware IPs
- *
- * @adev: amdgpu_device pointer
- *
- * Main teardown pass for hardware IPs.  The list of all the hardware
- * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
- * are run.  hw_fini tears down the hardware associated with each IP
- * and sw_fini tears down any software state associated with each IP.
- * Returns 0 on success, negative error code on failure.
- */
-static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+static int amdgpu_device_ip_fini_early(struct amdgpu_device *adev)
 {
 	int i, r;
 
-	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
-		amdgpu_virt_release_ras_err_handler_data(adev);
+	for (i = 0; i < adev->num_ip_blocks; i++) {
+		if (!adev->ip_blocks[i].version->funcs->early_fini)
+			continue;
 
-	amdgpu_ras_pre_fini(adev);
+		r = adev->ip_blocks[i].version->funcs->early_fini((void *)adev);
+		if (r) {
+			DRM_DEBUG("early_fini of IP block <%s> failed %d\n",
+				  adev->ip_blocks[i].version->funcs->name, r);
+		}
+	}
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
-		amdgpu_xgmi_remove_device(adev);
+	amdgpu_amdkfd_suspend(adev, false);
 
 	amdgpu_device_set_pg_state(adev, AMD_PG_STATE_UNGATE);
 	amdgpu_device_set_cg_state(adev, AMD_CG_STATE_UNGATE);
 
-	amdgpu_amdkfd_device_fini(adev);
-
 	/* need to disable SMC first */
 	for (i = 0; i < adev->num_ip_blocks; i++) {
 		if (!adev->ip_blocks[i].status.hw)
@@ -2616,6 +2608,33 @@ static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
 		adev->ip_blocks[i].status.hw = false;
 	}
 
+	return 0;
+}
+
+/**
+ * amdgpu_device_ip_fini - run fini for hardware IPs
+ *
+ * @adev: amdgpu_device pointer
+ *
+ * Main teardown pass for hardware IPs.  The list of all the hardware
+ * IPs that make up the asic is walked and the hw_fini and sw_fini callbacks
+ * are run.  hw_fini tears down the hardware associated with each IP
+ * and sw_fini tears down any software state associated with each IP.
+ * Returns 0 on success, negative error code on failure.
+ */
+static int amdgpu_device_ip_fini(struct amdgpu_device *adev)
+{
+	int i, r;
+
+	if (amdgpu_sriov_vf(adev) && adev->virt.ras_init_done)
+		amdgpu_virt_release_ras_err_handler_data(adev);
+
+	amdgpu_ras_pre_fini(adev);
+
+	if (adev->gmc.xgmi.num_physical_nodes > 1)
+		amdgpu_xgmi_remove_device(adev);
+
+	amdgpu_amdkfd_device_fini_sw(adev);
 
 	for (i = adev->num_ip_blocks - 1; i >= 0; i--) {
 		if (!adev->ip_blocks[i].status.sw)
@@ -3681,6 +3700,8 @@ void amdgpu_device_fini_hw(struct amdgpu_device *adev)
 	amdgpu_fbdev_fini(adev);
 
 	amdgpu_irq_fini_hw(adev);
+
+	amdgpu_device_ip_fini_early(adev);
 }
 
 void amdgpu_device_fini_sw(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device.c b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
index 357b9bf62a1c..ab6d2a43c9a3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device.c
@@ -858,10 +858,11 @@ bool kgd2kfd_device_init(struct kfd_dev *kfd,
 	return kfd->init_complete;
 }
 
+
+
 void kgd2kfd_device_exit(struct kfd_dev *kfd)
 {
 	if (kfd->init_complete) {
-		kgd2kfd_suspend(kfd, false);
 		device_queue_manager_uninit(kfd->dqm);
 		kfd_interrupt_exit(kfd);
 		kfd_topology_remove_device(kfd);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 9ca517b65854..f7112865269a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -1251,6 +1251,15 @@ static int amdgpu_dm_init(struct amdgpu_device *adev)
 	return -EINVAL;
 }
 
+static int amdgpu_dm_early_fini(void *handle)
+{
+	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
+
+	amdgpu_dm_audio_fini(adev);
+
+	return 0;
+}
+
 static void amdgpu_dm_fini(struct amdgpu_device *adev)
 {
 	int i;
@@ -1259,8 +1268,6 @@ static void amdgpu_dm_fini(struct amdgpu_device *adev)
 		drm_encoder_cleanup(&adev->dm.mst_encoders[i].base);
 	}
 
-	amdgpu_dm_audio_fini(adev);
-
 	amdgpu_dm_destroy_drm_device(&adev->dm);
 
 #if defined(CONFIG_DRM_AMD_SECURE_DISPLAY)
@@ -2298,6 +2305,7 @@ static const struct amd_ip_funcs amdgpu_dm_funcs = {
 	.late_init = dm_late_init,
 	.sw_init = dm_sw_init,
 	.sw_fini = dm_sw_fini,
+	.early_fini = amdgpu_dm_early_fini,
 	.hw_init = dm_hw_init,
 	.hw_fini = dm_hw_fini,
 	.suspend = dm_suspend,
diff --git a/drivers/gpu/drm/amd/include/amd_shared.h b/drivers/gpu/drm/amd/include/amd_shared.h
index 43ed6291b2b8..1ad56da486e4 100644
--- a/drivers/gpu/drm/amd/include/amd_shared.h
+++ b/drivers/gpu/drm/amd/include/amd_shared.h
@@ -240,6 +240,7 @@ enum amd_dpm_forced_level;
  * @late_init: sets up late driver/hw state (post hw_init) - Optional
  * @sw_init: sets up driver state, does not configure hw
  * @sw_fini: tears down driver state, does not configure hw
+ * @early_fini: tears down stuff before dev detached from driver
  * @hw_init: sets up the hw state
  * @hw_fini: tears down the hw state
  * @late_fini: final cleanup
@@ -268,6 +269,7 @@ struct amd_ip_funcs {
 	int (*late_init)(void *handle);
 	int (*sw_init)(void *handle);
 	int (*sw_fini)(void *handle);
+	int (*early_fini)(void *handle);
 	int (*hw_init)(void *handle);
 	int (*hw_fini)(void *handle);
 	void (*late_fini)(void *handle);
-- 
2.25.1

