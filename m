Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE7036145B
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 23:50:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B6C86EAE3;
	Thu, 15 Apr 2021 21:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2079.outbound.protection.outlook.com [40.107.243.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E006EAC6;
 Thu, 15 Apr 2021 21:50:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNDG1f7prMJf4PmTPc7Ln0NFdhBsoU1MXL1Uw1sg+nUQrSbVvN1188A/hrOQtJBHk50luc8MT4pbbDM3xO9fRe/ElvHFbi5BXMIQEDlo1005OPAfKom9bBJiiavbv6L8AWOdRjenx59qyNGqj/TusVIs9zUbRivzwa64r3d7oBiCHRNffUQAGq3VRC3KrCSPRFWHLdDFCuA9hbkppGbhaNMZiJb3QbLeE1Nnewq3HG6rBtI0XOYmS5TNNfG2fd3PW+QJ2sJDv1tZdhsS7mEBqGHvrXR0z70W5BKZF83LotlXuZYveougs7i52IGW/j89l3uJ8Dlg9yZkG44HNVl0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrLPv8+oyjXITGF/q6r7PCS1mcEF2QKDuteKjDZpO+Y=;
 b=BkLncxctI7Z3zGP+fCvsNWc7HOeryBd6s4u8Uuow2m41HvT/dFegzIO5dNu3G0FrUJbHBbmqt8zGk5ej+62aqxm8SluR2kMiItjb9qqV3oNf4ndGVRrrGwEezSK7v4nkukh0PnjEsu9YcayapTlxd8ajQpZ6sdN3xrUZ56uGuXq5RZHW659wgpCmahLiIi2NmIVqAwywHkxXubygnsiRuii7Dcp1XdAsVOBfKo8YxXYQqZrijN8MPpktHx++S0+XNn0Uuedhe3LOXC6WhrU3xY5IoGu23+lViFEGECGVnzBKtqeTdu884CdaN+ctqdBQcyw+3eMVeKKeULqQ0i7n1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrLPv8+oyjXITGF/q6r7PCS1mcEF2QKDuteKjDZpO+Y=;
 b=vrdzPVv4N0hy23p2ws/2JH1yHpcwnrndeEvL3n0rXrO0TIfxJphG3t946+HS3JRNsqEbrM01rV7PI5XvgIQXIgn8AJ6Pm4zjwMhBZV5cjuhYpBpKf2wRsee8E5jMuQ7tF00xCA1GQr9x67iPvGuW7QFBxJaepPpYCQn97L/VDvQ=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16; Thu, 15 Apr 2021 21:50:47 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa%3]) with mapi id 15.20.4042.018; Thu, 15 Apr 2021
 21:50:47 +0000
Subject: Re: [PATCH v2 1/3] drm/amdkfd: Use drm_priv to pass VM from KFD to
 amdgpu
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210415024013.15522-1-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <9b17d7b6-2cc9-1510-7c59-de9b90c275da@amd.com>
Date: Thu, 15 Apr 2021 17:50:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210415024013.15522-1-Felix.Kuehling@amd.com>
Content-Language: en-CA
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::33) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTOPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22 via Frontend
 Transport; Thu, 15 Apr 2021 21:50:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc9051b4-cd93-4db5-10f5-08d9005886bc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4299484768AC61930ABBEF6EE64D9@DM6PR12MB4299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:357;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sm9XiaX6uFVnKm4GLEEqFo05gLQxLUPBOJvhWSPGWt0zor9z9a+bxPEbgNoZCu6zjE4iDMp2YskrajZUKVtdj06ejrydokj0Q3Rh9VH20R6UknZe/k+EeSQz8jBLby3kyySzFdoGEmrFhM7qDKqmMX8BfQGHtT3hVEColPCLrXESzuR9c0oI9NscxVM1XV9572mA27YGtWRas5unq92zNFZ5wqsQFM/jW2Zyvg/WHQKh5mqsB1ToT2Mattoc0wwndl9tCA9QZ7XS5B1l+qn9Tk1M2cVKZlaD1FjYI3zNFqVfl4F/zkHBN6cJKogEHbWH9h06+9yF3l8scr1CBKam2R5nVig7cYco0N8D6je1EQTxpbf6R+dBvnaka7bNj6qNtRqij34BH6R9hGyLw6okDV19YF9+7QgF4xoOmQ/y/wsc4lq/gpab9jr6hWeAOXyr+nTd0aEnUVlZeENWwEe/Whyegirm0E4J0A7z4N0CMSbR5X9WqlhKZkmtVkct2v6hGqsdu/A+FKwwibCpQgkTUc8ICV11EsMH9HZFzJRypjBkHjwb4fFiKIHloNrfPklyQ95MpvvP/ad2+nfmFcdcYvJI5826BtkWKyK9sRQL4rolmn2GeMMbqtCcshjrtnEnfqQb0gIPiDT4WuMmBmyjutjVwieE18wz/wuMF9rwfeQFfcN5glrNWwZvUNad8+sE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(30864003)(6486002)(5660300002)(16526019)(186003)(31696002)(31686004)(83380400001)(450100002)(2906002)(53546011)(26005)(38100700002)(2616005)(956004)(16576012)(66476007)(66946007)(8676002)(36756003)(8936002)(478600001)(316002)(66556008)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d011d0tyZDhsQ0J1R1lYV1VJZ0FwdUlLeEJxOGlNZnp5OTEvbmRaQUJyYy9F?=
 =?utf-8?B?bjlBOGxjMlBJdlh5ZEpta2xUN25sRHhGb0d1OVlFWjdMSktMODhnYW53MDYw?=
 =?utf-8?B?L29nZDM1N294Y2RRajNSZTh0VlgxRkhhNVVZZVJ0Zi9GSjh6VzlKVHNxZXVX?=
 =?utf-8?B?Y2VpS0RMV3lzN3pmVjJHNDRRS2FjUThYN0hnTTUxT01RVnJzeHBQK05xOWpO?=
 =?utf-8?B?SWF5ZVBId1MrdjlHbXRZVjh4TGE0RmpNeWJpQnBRMHM1cytaUFlDc1pPM3lH?=
 =?utf-8?B?KzN6V1pQMksxUWZtTGJha21tTS8zMlRDdW1KYXY0U2RnenhxYlhRTDd2WFhu?=
 =?utf-8?B?bjJLT05sRGpybVdVcXhCeis0eWdJaVBzTThRRzlsZTd5UVlJM1YzTlNENlA4?=
 =?utf-8?B?bFRGdXhzRUZFamd4dGJVcnlXUHl2bmlMVnVlY25GUmdack9EcS9oU3pRbENs?=
 =?utf-8?B?QmkrZ2xsMitPTm9LQmd3TzR0ZmdZWVplc0RHdlJOaEttdS8rTnErZ1NXUHZj?=
 =?utf-8?B?SHpuTEw1ejJIVnpyWVlGZzI2UzRKWEVPUEdpREVnLzgrVG0yYTFlbmRQYkcw?=
 =?utf-8?B?cEIvQlhZazlSWTZQeUJQT1pvRDN0NkFQTnFwbWtuUEN0YnIzb0hmMHhKQzdG?=
 =?utf-8?B?WkdZSzR0SGJabnhRVlpJWTBJZFNRTXZIWEVkNVRFbmgxZnpDVkp4MHBxa1Ax?=
 =?utf-8?B?S2Y2eDFiY1V3dUxVT2dUc3dheS9OOTZnUHFLeDIxQUNDQUxjTzE1Zkd6S0Ux?=
 =?utf-8?B?OFNGWTlFL3lBcThVL3NQRGdWZVdTeGRNVmNjWjR4a09JaTZZaElhQzQ1V3Fu?=
 =?utf-8?B?S0FoWTVtczlzSFBYajBTNktndEVoVE1Ea29FL2QwZVZWL01YUlhxOEI0Tmdp?=
 =?utf-8?B?TEZLWnp0aHdxcTNnVUF5Q3VMZ3hzQlRqZjNTTjNTcWlEMzZ3eTFaS29YdXZi?=
 =?utf-8?B?MElKOXRnSk44b051aSs2SEVkVk85L20rYWl5dE1qVm5uM2tHMWZubEMzdDcw?=
 =?utf-8?B?L1FjQ0kvenZXK3RYVXp3Uzd2OFZ1WURoRVJrUWxTZEwvSVRRQUpTMmZHaTBm?=
 =?utf-8?B?RFRSKzJCTFhEYmtVMGVPSGU3S2hoRWJ5M3J3aGcyeTNmVFE5WXVRT2RacGhS?=
 =?utf-8?B?ZXkxeGJnL21uc1I2cEwwNDF3OTVEUEwxSVRsQkh6Q1FiMVNBYWp0ZGtIM245?=
 =?utf-8?B?bGNqeHpSM1RDa1c1a25LUXV4S3VnVFJPV2lYU0orUEQ3ZHp2dFFabGZ2Q05E?=
 =?utf-8?B?ckU3bXNqcHVxWXBXMkFpZDdNaFZiNFVYWDlwTHA2Sy9BalBtcDlKQTUyMWFi?=
 =?utf-8?B?dDdaTStCWnR2Nm0zdjQ4czlxNFFCa3Z5eDF2VmRiOFRRMGRxK0ttSXBvNnVt?=
 =?utf-8?B?cVg4QTErdFdNazNKN3hlVGNsREdRRldQNS9reXp6R1U4R3VBZU54NyttdXFD?=
 =?utf-8?B?WmdTNHUrOEpTVUZBS3loN0Vja1p6aHBqMUxPQ3NjenhybW5WQXRlaDBIODI5?=
 =?utf-8?B?aW4xQktKb3l0bmlySXpGT0p2RHE4ZkFXT09MVWZVSmdWTW1rWDBGUUpVSU1u?=
 =?utf-8?B?OERWdkpZU1ZXZCtuUFVIbEhzbnlXUWg1eDJIQnIrQVhFMTlEMFdJL0RYdisx?=
 =?utf-8?B?aTVCdDQxNWNkaFVBc3F4Y1ZZUWFHeEhwaEJaek9md09zLzN5UERHVVNBS2c0?=
 =?utf-8?B?MnZndTZ0NHducFZoaDdXdTVxekRWUnZxN21mSmFNamVveUFFVmZ1UWpZNnpP?=
 =?utf-8?Q?mL9fOch4KWuj4F/YlzrWTwCBcdlrhBkvN9s5jXC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9051b4-cd93-4db5-10f5-08d9005886bc
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 21:50:47.1477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J6v70bNEBE0tS4K0NjzRTZ5ZCuw6KXK51ZMIlX2nSMI0XStSzWhm4UAEB+NR0tjj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
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
Content-Type: multipart/mixed; boundary="===============1103232729=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1103232729==
Content-Type: text/html; charset=utf-8
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2021-04-14 10:40 p.m., Felix
      Kuehling wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20210415024013.15522-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu needs the drm_priv to allow mmap
to access the BO through the corresponding file descriptor. The VM can
also be extracted from drm_priv, so drm_priv can replace the vm parameter
in the kfd2kgd interface.
</pre>
    </blockquote>
    This series is Reviewed-by: Philip Yang <a class="moz-txt-link-rfc2396E" href="mailto:philip.yang@amd.com">&lt;philip.yang@amd.com&gt;</a><br>
    <blockquote type="cite" cite="mid:20210415024013.15522-1-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    | 14 ++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 69 +++++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  8 +--
 .../drm/amd/amdkfd/kfd_device_queue_manager.c |  6 +-
 drivers/gpu/drm/amd/amdkfd/kfd_priv.h         |  2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 23 +++----
 6 files changed, 67 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 5ffb07b02810..0d59bebd92af 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -236,20 +236,20 @@ uint8_t amdgpu_amdkfd_get_xgmi_hops_count(struct kgd_dev *dst, struct kgd_dev *s
 /* GPUVM API */
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					struct file *filp, u32 pasid,
-					void **vm, void **process_info,
+					void **process_info,
 					struct dma_fence **ef);
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm);
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm);
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv);
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv);
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size);
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_sync_memory(
 		struct kgd_dev *kgd, struct kgd_mem *mem, bool intr);
 int amdgpu_amdkfd_gpuvm_map_gtt_bo_to_kernel(struct kgd_dev *kgd,
@@ -260,7 +260,7 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 					      struct kfd_vm_fault_info *info);
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dmabuf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset);
 int amdgpu_amdkfd_get_tile_config(struct kgd_dev *kgd,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d4118c8128a..dc86faa03b88 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -948,6 +948,13 @@ static int process_update_pds(struct amdkfd_process_info *process_info,
 	return 0;
 }
 
+static struct amdgpu_vm *drm_priv_to_vm(struct drm_file *drm_priv)
+{
+	struct amdgpu_fpriv *fpriv = drm_priv-&gt;driver_priv;
+
+	return &amp;fpriv-&gt;vm;
+}
+
 static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 		       struct dma_fence **ef)
 {
@@ -1036,15 +1043,19 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
 int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 					   struct file *filp, u32 pasid,
-					   void **vm, void **process_info,
+					   void **process_info,
 					   struct dma_fence **ef)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct drm_file *drm_priv = filp-&gt;private_data;
-	struct amdgpu_fpriv *drv_priv = drm_priv-&gt;driver_priv;
-	struct amdgpu_vm *avm = &amp;drv_priv-&gt;vm;
+	struct amdgpu_fpriv *drv_priv;
+	struct amdgpu_vm *avm;
 	int ret;
 
+	ret = amdgpu_file_to_fpriv(filp, &amp;drv_priv);
+	if (ret)
+		return ret;
+	avm = &amp;drv_priv-&gt;vm;
+
 	/* Already a compute VM? */
 	if (avm-&gt;process_info)
 		return -EINVAL;
@@ -1059,7 +1070,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 	if (ret)
 		return ret;
 
-	*vm = (void *)avm;
+	amdgpu_vm_set_task_info(avm);
 
 	return 0;
 }
@@ -1100,15 +1111,17 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
 	}
 }
 
-void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
+void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm;
 
-	if (WARN_ON(!kgd || !vm))
+	if (WARN_ON(!kgd || !drm_priv))
 		return;
 
-	pr_debug(&quot;Releasing process vm %p\n&quot;, vm);
+	avm = drm_priv_to_vm(drm_priv);
+
+	pr_debug(&quot;Releasing process vm %p\n&quot;, avm);
 
 	/* The original pasid of amdgpu vm has already been
 	 * released during making a amdgpu vm to a compute vm
@@ -1119,9 +1132,9 @@ void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 	amdgpu_vm_release_compute(adev, avm);
 }
 
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 {
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdgpu_bo *pd = avm-&gt;root.base.bo;
 	struct amdgpu_device *adev = amdgpu_ttm_adev(pd-&gt;tbo.bdev);
 
@@ -1132,11 +1145,11 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
 
 int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		struct kgd_dev *kgd, uint64_t va, uint64_t size,
-		void *vm, struct kgd_mem **mem,
+		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	enum ttm_bo_type bo_type = ttm_bo_type_device;
 	struct sg_table *sg = NULL;
 	uint64_t user_addr = 0;
@@ -1347,10 +1360,10 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	int ret;
 	struct amdgpu_bo *bo;
 	uint32_t domain;
@@ -1391,9 +1404,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	pr_debug(&quot;Map VA 0x%llx - 0x%llx to vm %p domain %s\n&quot;,
 			mem-&gt;va,
 			mem-&gt;va + bo_size * (1 + mem-&gt;aql_queue),
-			vm, domain_string(domain));
+			avm, domain_string(domain));
 
-	ret = reserve_bo_and_vm(mem, vm, &amp;ctx);
+	ret = reserve_bo_and_vm(mem, avm, &amp;ctx);
 	if (unlikely(ret))
 		goto out;
 
@@ -1437,7 +1450,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	}
 
 	list_for_each_entry(entry, &amp;mem-&gt;bo_va_list, bo_list) {
-		if (entry-&gt;bo_va-&gt;base.vm == vm &amp;&amp; !entry-&gt;is_mapped) {
+		if (entry-&gt;bo_va-&gt;base.vm == avm &amp;&amp; !entry-&gt;is_mapped) {
 			pr_debug(&quot;\t map VA 0x%llx - 0x%llx in entry %p\n&quot;,
 					entry-&gt;va, entry-&gt;va + bo_size,
 					entry);
@@ -1449,7 +1462,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				goto map_bo_to_gpuvm_failed;
 			}
 
-			ret = vm_update_pds(vm, ctx.sync);
+			ret = vm_update_pds(avm, ctx.sync);
 			if (ret) {
 				pr_err(&quot;Failed to update page directories\n&quot;);
 				goto map_bo_to_gpuvm_failed;
@@ -1485,11 +1498,11 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, void *vm)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv)
 {
 	struct amdgpu_device *adev = get_amdgpu_device(kgd);
-	struct amdkfd_process_info *process_info =
-		((struct amdgpu_vm *)vm)-&gt;process_info;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
+	struct amdkfd_process_info *process_info = avm-&gt;process_info;
 	unsigned long bo_size = mem-&gt;bo-&gt;tbo.base.size;
 	struct kfd_bo_va_list *entry;
 	struct bo_vm_reservation_context ctx;
@@ -1497,7 +1510,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 
 	mutex_lock(&amp;mem-&gt;lock);
 
-	ret = reserve_bo_and_cond_vms(mem, vm, BO_VM_MAPPED, &amp;ctx);
+	ret = reserve_bo_and_cond_vms(mem, avm, BO_VM_MAPPED, &amp;ctx);
 	if (unlikely(ret))
 		goto out;
 	/* If no VMs were reserved, it means the BO wasn't actually mapped */
@@ -1506,17 +1519,17 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 		goto unreserve_out;
 	}
 
-	ret = vm_validate_pt_pd_bos((struct amdgpu_vm *)vm);
+	ret = vm_validate_pt_pd_bos(avm);
 	if (unlikely(ret))
 		goto unreserve_out;
 
 	pr_debug(&quot;Unmap VA 0x%llx - 0x%llx from vm %p\n&quot;,
 		mem-&gt;va,
 		mem-&gt;va + bo_size * (1 + mem-&gt;aql_queue),
-		vm);
+		avm);
 
 	list_for_each_entry(entry, &amp;mem-&gt;bo_va_list, bo_list) {
-		if (entry-&gt;bo_va-&gt;base.vm == vm &amp;&amp; entry-&gt;is_mapped) {
+		if (entry-&gt;bo_va-&gt;base.vm == avm &amp;&amp; entry-&gt;is_mapped) {
 			pr_debug(&quot;\t unmap VA 0x%llx - 0x%llx from entry %p\n&quot;,
 					entry-&gt;va,
 					entry-&gt;va + bo_size,
@@ -1642,14 +1655,14 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
 int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 				      struct dma_buf *dma_buf,
-				      uint64_t va, void *vm,
+				      uint64_t va, void *drm_priv,
 				      struct kgd_mem **mem, uint64_t *size,
 				      uint64_t *mmap_offset)
 {
 	struct amdgpu_device *adev = (struct amdgpu_device *)kgd;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
 
 	if (dma_buf-&gt;ops != &amp;amdgpu_dmabuf_ops)
 		/* Can't handle non-graphics buffers */
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 43de260b2230..97da1632f504 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1297,7 +1297,7 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		dev-&gt;kgd, args-&gt;va_addr, args-&gt;size,
-		pdd-&gt;vm, (struct kgd_mem **) &amp;mem, &amp;offset,
+		pdd-&gt;drm_priv, (struct kgd_mem **) &amp;mem, &amp;offset,
 		flags);
 
 	if (err)
@@ -1448,7 +1448,7 @@ static int kfd_ioctl_map_memory_to_gpu(struct file *filep,
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
-			peer-&gt;kgd, (struct kgd_mem *)mem, peer_pdd-&gt;vm);
+			peer-&gt;kgd, (struct kgd_mem *)mem, peer_pdd-&gt;drm_priv);
 		if (err) {
 			pr_err(&quot;Failed to map to gpu %d/%d\n&quot;,
 			       i, args-&gt;n_devices);
@@ -1555,7 +1555,7 @@ static int kfd_ioctl_unmap_memory_from_gpu(struct file *filep,
 			goto get_mem_obj_from_handle_failed;
 		}
 		err = amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-			peer-&gt;kgd, (struct kgd_mem *)mem, peer_pdd-&gt;vm);
+			peer-&gt;kgd, (struct kgd_mem *)mem, peer_pdd-&gt;drm_priv);
 		if (err) {
 			pr_err(&quot;Failed to unmap from gpu %d/%d\n&quot;,
 			       i, args-&gt;n_devices);
@@ -1701,7 +1701,7 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	}
 
 	r = amdgpu_amdkfd_gpuvm_import_dmabuf(dev-&gt;kgd, dmabuf,
-					      args-&gt;va_addr, pdd-&gt;vm,
+					      args-&gt;va_addr, pdd-&gt;drm_priv,
 					      (struct kgd_mem **)&amp;mem, &amp;size,
 					      NULL);
 	if (r)
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
index d3eaa1549bd7..98c2046c7331 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
@@ -738,7 +738,7 @@ static int restore_process_queues_nocpsch(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;drm_priv);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd-&gt;evicted)) /* already restored, do nothing */
@@ -821,7 +821,7 @@ static int restore_process_queues_cpsch(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;drm_priv);
 
 	dqm_lock(dqm);
 	if (WARN_ON_ONCE(!qpd-&gt;evicted)) /* already restored, do nothing */
@@ -873,7 +873,7 @@ static int register_process(struct device_queue_manager *dqm,
 
 	pdd = qpd_to_pdd(qpd);
 	/* Retrieve PD base */
-	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;vm);
+	pd_base = amdgpu_amdkfd_gpuvm_get_process_page_dir(pdd-&gt;drm_priv);
 
 	dqm_lock(dqm);
 	list_add(&amp;n-&gt;list, &amp;dqm-&gt;queues);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
index 0b6595f7acda..c6357ceb247d 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
@@ -669,7 +669,7 @@ struct kfd_process_device {
 
 	/* VM context for GPUVM allocations */
 	struct file *drm_file;
-	void *vm;
+	void *drm_priv;
 
 	/* GPUVM allocations storage */
 	struct idr alloc_idr;
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d97e330a5022..209e9edd6ddd 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -647,7 +647,7 @@ static void kfd_process_free_gpuvm(struct kgd_mem *mem,
 {
 	struct kfd_dev *dev = pdd-&gt;dev;
 
-	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev-&gt;kgd, mem, pdd-&gt;vm);
+	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev-&gt;kgd, mem, pdd-&gt;drm_priv);
 	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, mem, NULL);
 }
 
@@ -667,11 +667,11 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	int err;
 
 	err = amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(kdev-&gt;kgd, gpu_va, size,
-						 pdd-&gt;vm, &amp;mem, NULL, flags);
+						 pdd-&gt;drm_priv, &amp;mem, NULL, flags);
 	if (err)
 		goto err_alloc_mem;
 
-	err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(kdev-&gt;kgd, mem, pdd-&gt;vm);
+	err = amdgpu_amdkfd_gpuvm_map_memory_to_gpu(kdev-&gt;kgd, mem, pdd-&gt;drm_priv);
 	if (err)
 		goto err_map_mem;
 
@@ -901,10 +901,10 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 		for (i = 0; i &lt; p-&gt;n_pdds; i++) {
 			struct kfd_process_device *peer_pdd = p-&gt;pdds[i];
 
-			if (!peer_pdd-&gt;vm)
+			if (!peer_pdd-&gt;drm_priv)
 				continue;
 			amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
-				peer_pdd-&gt;dev-&gt;kgd, mem, peer_pdd-&gt;vm);
+				peer_pdd-&gt;dev-&gt;kgd, mem, peer_pdd-&gt;drm_priv);
 		}
 
 		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd-&gt;dev-&gt;kgd, mem, NULL);
@@ -932,7 +932,7 @@ static void kfd_process_destroy_pdds(struct kfd_process *p)
 
 		if (pdd-&gt;drm_file) {
 			amdgpu_amdkfd_gpuvm_release_process_vm(
-					pdd-&gt;dev-&gt;kgd, pdd-&gt;vm);
+					pdd-&gt;dev-&gt;kgd, pdd-&gt;drm_priv);
 			fput(pdd-&gt;drm_file);
 		}
 
@@ -1375,7 +1375,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 	if (!drm_file)
 		return -EINVAL;
 
-	if (pdd-&gt;vm)
+	if (pdd-&gt;drm_priv)
 		return -EBUSY;
 
 	p = pdd-&gt;process;
@@ -1383,13 +1383,12 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 
 	ret = amdgpu_amdkfd_gpuvm_acquire_process_vm(
 		dev-&gt;kgd, drm_file, p-&gt;pasid,
-		&amp;pdd-&gt;vm, &amp;p-&gt;kgd_process_info, &amp;p-&gt;ef);
+		&amp;p-&gt;kgd_process_info, &amp;p-&gt;ef);
 	if (ret) {
 		pr_err(&quot;Failed to create process VM object\n&quot;);
 		return ret;
 	}
-
-	amdgpu_vm_set_task_info(pdd-&gt;vm);
+	pdd-&gt;drm_priv = drm_file-&gt;private_data;
 
 	ret = kfd_process_device_reserve_ib_mem(pdd);
 	if (ret)
@@ -1405,7 +1404,7 @@ int kfd_process_device_init_vm(struct kfd_process_device *pdd,
 err_init_cwsr:
 err_reserve_ib_mem:
 	kfd_process_device_free_bos(pdd);
-	pdd-&gt;vm = NULL;
+	pdd-&gt;drm_priv = NULL;
 
 	return ret;
 }
@@ -1429,7 +1428,7 @@ struct kfd_process_device *kfd_bind_process_to_device(struct kfd_dev *dev,
 		return ERR_PTR(-ENOMEM);
 	}
 
-	if (!pdd-&gt;vm)
+	if (!pdd-&gt;drm_priv)
 		return ERR_PTR(-ENODEV);
 
 	/*
</pre>
    </blockquote>
  </body>
</html>

--===============1103232729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1103232729==--
