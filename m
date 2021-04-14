Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A82135F75E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:15:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C9F6E947;
	Wed, 14 Apr 2021 15:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760059.outbound.protection.outlook.com [40.107.76.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D83576E935;
 Wed, 14 Apr 2021 15:15:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNUxuNvhpPLzgwrjOlbDVtdJa2RdGg6LVRcipaR6s7zfArRoFroqMNs87rqXytekeq3Uh9XCr4grv/CxnZ+Bva1ZGorOchV5NF8tZxDvOu2Td10mOyE7on6S+dwVN2MDJsvUJ/Lrgp3ujN4erlSorP3bG53Rg4cGtAVkld8SnIp9sW2ILeRtQMIuavDja86DSr/Kq2j/yYcnXESO96mlmk+hLpZ6I8qcSNLdDBST/0go5TjSdB9yMVk9HQHeOI3TafTuuwEeApJJWwHwhpKNOtAZzC1trjb+k2fDVYY/4iLJ640ZpHtG3jBk/00KqQBvfF7dRsL/ZvMfjii7jWhhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXcXPPrdFVje7lmtwip17V6Guqwp6YheEAWfqFDXYE4=;
 b=bl+KKzqnEzwoT/C7q7INXGWPKdOM8CGdojKVndSF7K5xFlOnBBgLjfeebEYDzglkeE31qf2TepssesOi8UxZW2FibxS8YGBwTi7sJMhRJPKRfLTvpOD/u+VWFcGwy3sBbeeTKJ++VpnJuSJzJRJi+SrENc4SJ5Ej4FWEGDQZoLwzjXfSr0v4g3TmdNjkRBZk8tzQbdbT6TAPxYe/x2gAf4YIWgPJ2WaigJXq8MfL3Y+lVLmPAPn3B0rgxPLLlG/RtM4LKFqqmoNHj3iWwuPtIbhx7uY8J+kIHdgKP0fqTTUO4IV6jviRs60VuKBHbs1/jjz0NrYqREAOSLJFDfiZZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qXcXPPrdFVje7lmtwip17V6Guqwp6YheEAWfqFDXYE4=;
 b=y8mJZDqVHYOZKTwy73T0e/zq0/LXYLpnNj2B0HER2UtfSy8S9Z40ACbaSF0JtLSnemZrVIztoydyIvnHMFyqQJaiIg8UN21uL4E1YLD+hlGJCD+QYJaccVHpX55dw3T4+kCauOw7kEDivvImUWALXIvZkP8Gv+w9UoCQU9vk1Ls=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.21; Wed, 14 Apr 2021 15:15:48 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa%3]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 15:15:48 +0000
Subject: Re: [PATCH 1/4] drm/amdkfd: Remove legacy code not acquiring VMs
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <edbf5cd0-3a2d-959e-1c73-748f0ab86c12@amd.com>
Date: Wed, 14 Apr 2021 11:15:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407231259.1787-1-Felix.Kuehling@amd.com>
Content-Language: en-CA
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::25) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTXPR0101CA0048.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22 via Frontend
 Transport; Wed, 14 Apr 2021 15:15:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f025c664-db0d-4f62-4a27-08d8ff582eb8
X-MS-TrafficTypeDiagnostic: DM6PR12MB3834:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3834E80F6857FA0BD8E6B399E64E9@DM6PR12MB3834.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jAjU2lGRqo5vj4vO81pOFK6gLwGzIoHeCvFpKILrrdzf94HoGveeNk0H+oE05SLN88Fja8rKy4JraQrh6+vs9mAar37AXTWY41QrGNoktbA7PtylGM8DX+09WtcWU46aWPoj+nd0/B8GTJ7LPEzBvh4EOe0C9NMy5ujdgevA4I6hz4OdDByGdgxLwMckIZuzNFtWvSVcr4Ot/wHcxZax7UXpP0tWKoV8YTia6SV/m/+Xs+jEdlNS7RtqxKb0Z1c/AobiyJv3mn/APSXyCxURAo9KK2ZDLnAhSxhDH3USxfSpSaPnsKfHjSt8ISv80AC6aJ+oCUb79MpOaBz0Z9uQTspTSlskWemuLPGUS7qbCBTSrNDWvi5CPzVjAMCEbgpUdrG/qrp4/jPFmiab17mZz8Q8hn/DPyXe0mqpP2LRVq4QyGKqvFIVi0qAjf+5jg8DcPvE80ofPJcoQH5tNPJhU7U55aZK2HzDyCRYqvPLZjDcA2avO/WEXhI+akcNCLDD/hrJzOrUFd4kjpxEpjphbSNojSxM1cWZ5xLVE6jRGU/RzLKldI8i6r7Mcr8Xkrx9v1ppwRWHD46gls6tbrM+aCMVZHpEdBCmBIvlw6NXDzy4FOwGrhAY/WaNRH7t7rJ4ZNS74Bk3i/a4LsP87WYidxUCVi3cyE61E+ckySJX+o6SLwg4uml7Ms3P6bF88P2W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(66476007)(66556008)(66946007)(956004)(2616005)(6486002)(4326008)(31696002)(5660300002)(316002)(16576012)(38100700002)(16526019)(26005)(186003)(8936002)(2906002)(478600001)(31686004)(36756003)(83380400001)(53546011)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTRXTmxkTE9XVUN6TFMzNDBCMmpSS2R0NFN3WEdaSm5kVlQ4NG1zOWJqNTdp?=
 =?utf-8?B?TkNlYmV0RG14d0ZKbjlYU1VmRGpWRXBLOTRLcXVHdmU4elh0YUtKQmpIakEv?=
 =?utf-8?B?aGhoMzhLem8wRjNDYnQycjZnWE5zYStRWVVTSHZqdVFTRWZoSk0zT3diZE5k?=
 =?utf-8?B?TXUwZHBKYzB6S0FKVFB1ZVpYUFQwTyt1MVl2UnAwRllad1lQbXExanJVYmpy?=
 =?utf-8?B?TE1ib0k1c2VjMUVQaTh1dnVvcy9IcG9jZ09wYUo3MC9iQTd3bmkzenQwZ25M?=
 =?utf-8?B?ZDJpZXUyaGx0aGhHemxHZjMxODgxVnI5MFk5L1o4VTBFajdWZEhYaGx1MXg0?=
 =?utf-8?B?VktrMmRTN212OTRLNlhQZmxkNk5BUTFucUp4K2E3U0dkcjFUMjJFVTA5VjEw?=
 =?utf-8?B?T3VzNWRvTDgxa21YMWI3Q00zTUlzcExwcnRYYVFiKzk5OUVoL1FHOG1LWW1E?=
 =?utf-8?B?N1d4TlpudmlZdTNad0VEUW1FcTBlUUcxcEhseW1IQ0NMV240QzYwZTAveUVt?=
 =?utf-8?B?dFBoN0hmbE52NVFUWnBhcU5pRFNGRVVzYlBMSUkyblJqRFV3bVJRRVF4Wmk1?=
 =?utf-8?B?alhsRUxsN0RBZFdFb0NjbDVFdWl6Um5RcWh6TEV2ek5TYXpMQWFQM2cvRHJJ?=
 =?utf-8?B?OEFrTjNtL3cwSGdtNFZ3RUFSaElvbUZWUjd1YU1QblRNWFNKZ3JKQkdZZUlj?=
 =?utf-8?B?ZjdSZFErZ2VwNktBR3h4QVZONWQxSytObk1Lc1RDUmJHcGpnRjlFeTBCVG12?=
 =?utf-8?B?cVRtYytZWlZ3SFV5N0Z3Wk8raE0ybXpWdzFFenkrRHBrMGpLUHkwRDJLN3Ry?=
 =?utf-8?B?am8xOUdUTjc2R0p4RWhFaXdjMDM1UlVSR0t5bjdnTldDYnMrbXlDRzZKOGhQ?=
 =?utf-8?B?bkJlOW0rNjBqbzZUc0lZVFdVZVJBbHhwaERDeFU2L1dORG93dTI2SWdldHhq?=
 =?utf-8?B?VDRCMzkxVUJXK3hINHdjVmExaUptd3NXRFpFaHIzUGtqQzdLOHh1ZVRuNjQr?=
 =?utf-8?B?c3o2UWxSNHZyaDNobjd4SnU4ZytsZWVMM0RBcDdoS0t6aURoeE5Yd0NBWmt4?=
 =?utf-8?B?Y2FQbDkwbHpucXhZQWw1VXlXQTNuM0NyQVNjL0xVSkx6bnVyMGFKSzlBMzQ2?=
 =?utf-8?B?SE91cmluQ005dXRhZy82R2p4MmZTZDFibjIzRFFNdkIveG54dVN4MTViMjhM?=
 =?utf-8?B?Wk9SVSs1S3Q3UkdTeWR6Wkh4R2JGWGVZcHVKQ0Q4aWYxT1h2SW5DbmRGMG1V?=
 =?utf-8?B?L1hycmdHN0NKdi9GRGdPNmh0a1kzV1ZJc1JlZ0lvQS9qMTB4Ykg0cGJiYVAx?=
 =?utf-8?B?Uy9aOFAySkxEYzNKdHRzNjEzWDYwMGdqRTFhU3FCbktQS1Y1MFd4dldNbkcv?=
 =?utf-8?B?WWFKME55eEZiTVdZeW1rRzJCUlN5WUZjYytpTHVIUFVKZGpwSnArRThzTllX?=
 =?utf-8?B?R1dwUkVwMzJYTTAxQlNaSjNuVHEyaGxnL25aRUkzWkFnWG4wSDhSME5VQktt?=
 =?utf-8?B?Rk9xcjUyOCttUFd1Qi9qczk5cUR4RGVtdmFwK2tuMXB1V3BjNGVzMENKRmh5?=
 =?utf-8?B?ek1zT3oxaW1VMjNmZU1leGp3eXB4S0lBblNiOFRmWG10bEdZbVRhNGlNY3lU?=
 =?utf-8?B?bkY2K29aKzJqc0kyZ1RkVzVRRmF6azNldFdQYkphdkVaSyt0eDVTZ0E1R2N6?=
 =?utf-8?B?WEgxNzZYUkYrQ1p6TDhjaHcvOWwrWGpVcEJ6czB3b0hnQ1FBOGd3VnFCdnp2?=
 =?utf-8?Q?UwKw6B9hs5LOz4Ymg7layMwyBVPEuXKqwiQAopr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f025c664-db0d-4f62-4a27-08d8ff582eb8
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:15:48.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2JWM4n9MH8W3J44T3g6dJaCEWTARatFcaf5BqNd7KRoROp7pcBe40gg+sH7/CxNO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3834
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
Cc: christian.koenig@amd.com, tzimmermann@suse.de
Content-Type: multipart/mixed; boundary="===============1488795028=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1488795028==
Content-Type: text/html; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-04-07 7:12 p.m., Felix Kuehling
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210407231259.1787-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">ROCm user mode has acquired VMs from DRM file descriptors for as long
as it supported the upstream KFD. Legacy code to support older versions
of ROCm is not needed any more.
</pre>
    </blockquote>
    Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:Philip.Yang@amd.com">&lt;Philip.Yang@amd.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210407231259.1787-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  4 --
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 50 -------------------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 27 ++++------
 3 files changed, 10 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 14f68c028126..5ffb07b02810 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -234,14 +234,10 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 	})
 
 /* GPUVM API */
-int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, u32 pasid,
-					void **vm, void **process_info,
-					struct dma_fence **ef);
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					struct file *filp, u32 pasid,
 					void **vm, void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_destroy_process_vm(struct kgd_dev *kgd, void *vm);
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm);
 uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index e93850f2f3b1..36012229ccc1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1037,41 +1037,6 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 	return ret;
 }
 
-int amdgpu_amdkfd_gpuvm_create_process_vm(struct kgd_dev *kgd, u32 pasid,
-					  void **vm, void **process_info,
-					  struct dma_fence **ef)
-{
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *new_vm;
-	int ret;
-
-	new_vm = kzalloc(sizeof(*new_vm), GFP_KERNEL);
-	if (!new_vm)
-		return -ENOMEM;
-
-	/* Initialize AMDGPU part of the VM */
-	ret = amdgpu_vm_init(adev, new_vm, AMDGPU_VM_CONTEXT_COMPUTE, pasid);
-	if (ret) {
-		pr_err(&quot;Failed init vm ret %d\n&quot;, ret);
-		goto amdgpu_vm_init_fail;
-	}
-
-	/* Initialize KFD part of the VM and process info */
-	ret = init_kfd_vm(new_vm, process_info, ef);
-	if (ret)
-		goto init_kfd_vm_fail;
-
-	*vm = (void *) new_vm;
-
-	return 0;
-
-init_kfd_vm_fail:
-	amdgpu_vm_fini(adev, new_vm);
-amdgpu_vm_init_fail:
-	kfree(new_vm);
-	return ret;
-}
-
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct file *filp, u32 pasid,
 					   void **vm, void **process_info,
@@ -1138,21 +1103,6 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_destroy_process_vm(struct kgd_dev *kgd, void *vm)
-{
-	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
-
-	if (WARN_ON(!kgd || !vm))
-		return;
-
-	pr_debug(&quot;Destroying process vm %p\n&quot;, vm);
-
-	/* Release the VM context */
-	amdgpu_vm_fini(adev, avm);
-	kfree(vm);
-}
-
 void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d4241d29ea94..d97e330a5022 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -935,9 +935,6 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 					pdd-&gt;dev-&gt;kgd, pdd-&gt;vm);
 			fput(pdd-&gt;drm_file);
 		}
-		else if (pdd-&gt;vm)
-			amdgpu_amdkfd_gpuvm_destroy_process_vm(
-				pdd-&gt;dev-&gt;kgd, pdd-&gt;vm);
 
 		if (pdd-&gt;qpd.cwsr_kaddr &amp;&amp; !pdd-&gt;qpd.cwsr_base)
 			free_pages((unsigned long)pdd-&gt;qpd.cwsr_kaddr,
@@ -1375,19 +1372,18 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	struct kfd_dev *dev;
 	int ret;
 
+	if (!drm_file)
+		return -EINVAL;
+
 	if (pdd-&gt;vm)
-		return drm_file ? -EBUSY : 0;
+		return -EBUSY;
 
 	p = pdd-&gt;process;
 	dev = pdd-&gt;dev;
 
-	if (drm_file)
-		ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
-			dev-&gt;kgd, drm_file, p-&gt;pasid,
-			&amp;pdd-&gt;vm, &amp;p-&gt;kgd_process_info, &amp;p-&gt;ef);
-	else
-		ret = amdgpu_amdkfd_gpuvm_create_process_vm(dev-&gt;kgd, p-&gt;pasid,
-			&amp;pdd-&gt;vm, &amp;p-&gt;kgd_process_info, &amp;p-&gt;ef);
+	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
+		dev-&gt;kgd, drm_file, p-&gt;pasid,
+		&amp;pdd-&gt;vm, &amp;p-&gt;kgd_process_info, &amp;p-&gt;ef);
 	if (ret) {
 		pr_err(&quot;Failed to create process VM object\n&quot;);
 		return ret;
@@ -1409,8 +1405,6 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 err_init_cwsr:
 err_reserve_ib_mem:
 	kfd_process_device_free_bos(pdd);
-	if (!drm_file)
-		amdgpu_amdkfd_gpuvm_destroy_process_vm(dev-&gt;kgd, pdd-&gt;vm);
 	pdd-&gt;vm = NULL;
 
 	return ret;
@@ -1435,6 +1429,9 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
+	if (!pdd-&gt;vm)
+		return ERR_PTR(-ENODEV);
+
 	/*
 	 * signal runtime-pm system to auto resume and prevent
 	 * further runtime suspend once device pdd is created until
@@ -1452,10 +1449,6 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 	if (err)
 		goto out;
 
-	err = kfd_process_device_init_vm(pdd, NULL);
-	if (err)
-		goto out;
-
 	/*
 	 * make sure that runtime_usage counter is incremented just once
 	 * per pdd
</pre>
    </blockquote>
  </body>
</html>

--===============1488795028==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1488795028==--
