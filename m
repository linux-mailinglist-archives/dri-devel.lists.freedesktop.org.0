Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D511D35F763
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C53A56E933;
	Wed, 14 Apr 2021 15:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A350D6E92D;
 Wed, 14 Apr 2021 15:21:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OWbBC45cs0ZzczxltOQ2d8MUChpXsjTXKhhFJuZmjZCERCqRXx+hd4wWRDGlvJq0VS36iaGUTYK76E2zlVwRYL+JkfIj6gQ6DMd2BzFR1/Ttv1Dur2YBLL4npws7CGywVvhXbCsy3Uzo2eJnfM3NP0R5xYXvUj2eldgHKx970W8QqOpqkBpxodMAk6YiWRRyjbNEjVrwBUG3yJesseM7zc9c+2agL04bOBJvamEOkGwNjGXt7Fhu4ssrViyFMTWVf6SRU5Gn7vdkWSJc6ceHMKZRDHNSAdC4cUwDehQZXRnIMIPdxlXN+UNBs1sewuWnRAkfZJCGVj7HE8a95xjFdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rjAfuBu8XxPQ+HaFoHMQGA5SWUhkYQjBdqYDeh06Zk=;
 b=Vfxh/EVPkfJm6q50o93APXsDMxlI0e4vkO4X3GUx1ZQtv62h5IBclVRoA/LudqVP4QfOpdDdPUJKP2Scm6Nh4kVkWDfN8jEPY2yotz9NQQa1ASlC7UakglH2I2z7qiHG4PARbsMd56/afH+sDCkr89nae8JWyRmDe10QQrCWtih8jUwiRi6d3Y/0WZtoclEhmGLhwy521ROx00R5Pd3N6QnX/0HbF+nI5y++VRiFGsYCSqyVEh3EaA/6p12IH/Ce6t0wXEpGqJZP4hdE1dO9asBskJWcOggCsrlTiiCGx2HaGCRz2/U7Y9G52H3ceWbUfKOT5hwnSzrvT7i09cVVeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rjAfuBu8XxPQ+HaFoHMQGA5SWUhkYQjBdqYDeh06Zk=;
 b=RvmRHPMNPi8BceZZz5zUXSeLBqBqFuLjLEWhkOxrP74fyQAJTxG2Ws/r2r9meD8bWpexhKTRZaCIu47WGtoF+6GSKn+6Lg9I6Y6xIdOjCjGWNqFEStUVJJZsPrfRejBDbHM38+h1CmRVGtY1SnoEvvRxEwLdDuaRXaE+MpLGqG0=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM6PR12MB2937.namprd12.prod.outlook.com (2603:10b6:5:181::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3999.27; Wed, 14 Apr 2021 15:21:39 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa%3]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 15:21:39 +0000
Subject: Re: [PATCH 2/4] drm/amdkfd: Use drm_priv to pass VM from KFD to amdgpu
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
 <20210407231259.1787-2-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <3813f130-a255-0d63-3b40-60919a1ba8f8@amd.com>
Date: Wed, 14 Apr 2021 11:21:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407231259.1787-2-Felix.Kuehling@amd.com>
Content-Language: en-CA
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28)
 To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YT1PR01CA0015.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 15:21:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eca61a59-1095-4973-b949-08d8ff58ffea
X-MS-TrafficTypeDiagnostic: DM6PR12MB2937:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB29378AC979C323950EE6F198E64E9@DM6PR12MB2937.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:392;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9txcaOqmZeskP9rGEbBuT2tpqw0YP/qPP1WoK4moD6D7heX5AAjG+m8D2qnf8PU04CYDw99Y/GaPz412dKujhaWc0a/6AyzJLdbYOsDoo8SXj/rfvEj09PhMfj+PxMhuHz3hVxcm6+dSHwDosD9TAoTPtX17zYvhO47R3dr7MnvJaSAccpUE+YCq1Y1HwG2gSGK1VLLmrnrHuxa7q4SIoPfAT3J84rvo12EOQvXZqZ79IStFUyvvqBWJ3Vfm/4wevrmf1PILcK3bVjeHTbG4OGwG8g5pDGJrIHGwc2qCirt2Q0XsPjRgX5P0H0blodEOhRHRy8XpBsinyFd6qNWHJ/WwThps/WtLA/6YbWzRyUDfOt/wA3jvg9TVki4dlbmh7uMaKSF58531hUSYV4OIF/crDSCnC6am053dxlNsQlv1OUeHgd1XpSWVZyFyT3mrDiUJ5Fu+eJn8zuIcNkXJP2NiRynmJkMduqBfpPddviP420qBJlM6a+HKasvxLBYqPGn4Y1xzzEM5WLEPJuyGgwoMY5jKGinsns687K9iYk0tjQ/77n2J1TVd2bA4y4ig8wkHUvMUiYSpHSPpLDyjIjxjfoU/ZAGLgtOZ5QIEy06F60pvGmwX67N9HebtFmXF+2e5KXSUqReu5rv7YpK67OMftSav3Y/VNBbYeZFUzGHfpopG1Z0L3RtYAblEO627
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(366004)(66556008)(478600001)(36756003)(8676002)(66946007)(956004)(66476007)(2616005)(16526019)(186003)(38100700002)(31696002)(4326008)(83380400001)(31686004)(2906002)(316002)(5660300002)(26005)(6486002)(8936002)(16576012)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SDllNUNpOHp4Z0NTUCtzQ0Y5ZXlmTWdudWh5bVprVGt0NEVmaytZZGVXYW55?=
 =?utf-8?B?U0hRWXoxOEhMMGdpUCtOY3dwK21WbkljVmhIaVZDTzJYaHhtcXZiZW9PZmFj?=
 =?utf-8?B?M3BrYTIxTFdJaFJaTGxsMTc0TU5hTStIOHVCS0dJdzduTnM3M0VFNDBVTG5W?=
 =?utf-8?B?dWVTeDZMR1FISURtdEZIMXZRYjErelJJUE5rQ1FrdGtmTmxjU2JrZkc3dmNR?=
 =?utf-8?B?UzhwbU1wMUhEbjRSRE05bHhFMjRTbllSTjFONDA0RzFKaE5zdlFDWFJ3NWd3?=
 =?utf-8?B?Q1hUQ0JrRE03dk1LbENGczhVTVEzMUtqYzhOMkVrblBZWnE1WnJDaHh5TU1N?=
 =?utf-8?B?TitNb0NYVkZ0WjJyUmtzSFBPQm4ySmxMdllydFlhSEF6QjF3T0ViN1dRMnAw?=
 =?utf-8?B?VmE2NGl5Wkk0ZVNwbnRhaUdEMVAwM2JwRGRaaHhIekt2L2NPak9TQlFjVjZz?=
 =?utf-8?B?TmZselpkWjdyQW12cGdrb3NFM1Vicmg1eWxORVk3Z1VPdEJyek0rWnhDc25i?=
 =?utf-8?B?elBrL3lXeGM3Qm9iK1AzYlNmb0dkQ0tVZVl2RjJvaFBBck9VTGJMaVhEbWpl?=
 =?utf-8?B?SmV2ZmNKUWJrRUJHWHNycHJySWIvRkpRK29ScURCNGFudXR0MTBIdFkrczdh?=
 =?utf-8?B?RkU2d3RlOUdHR1lwTms2NzFlcVpneXlnTTlaQzExdmpUbUlxV0tWczlDWmI2?=
 =?utf-8?B?WVJ1VThvZld6aWZ0aGFSMjBKdkJwdCs2clZpQjVodjFmbU5LeElYUXpIM2FH?=
 =?utf-8?B?Tkw5OFRMN0pRdytFUmdDaVVHMmZVNVh1cFRaYkR0S1E2OVVReWQvcmM5YWdr?=
 =?utf-8?B?Y1lickQrcEMxVHV4ek16cFU5aktlSklCc1dQN3ZTUmtyTEZrVWRwYkZJdU5u?=
 =?utf-8?B?Y0RkaWhDbkw3SEEzTVlZcSt5S1dXRDFDWFFFNStFVDJnWWdoa042bytoZURn?=
 =?utf-8?B?dHA2T2lKTWhzZFQ2RWN2Q0FhaFN4MnFMQ2U0aXJ3WkxKY1h5aEh6MWhhVjg1?=
 =?utf-8?B?QUE4bFdkTVJYQWk1aGIvcWNKdjRFU3BOdWhPeWZZYU9CQWJIQ2NBdS9hdm5Y?=
 =?utf-8?B?bmlnVnIwMkdYZ0ZsRWgxQldUbnhvRHM0M2lXRUlKNjBuVGFNZCtHT1l4TlRR?=
 =?utf-8?B?Mml2eDUwcXhnNkxLZlYyRXEzVEg2U3lmcU9vckdaMXUzNDlFR1FkVnIzOGFW?=
 =?utf-8?B?ZitzSXYxVWpFcGFUUzM0S3Nvb2h3enlaVVlwRzZOanVMc0hvR25LQXh3V2N0?=
 =?utf-8?B?MjM1WHNyaDJObUJZY0hjeTlrMXdVOXB3R2p1bDdqcjUwck5uQXBQK2x5Si9U?=
 =?utf-8?B?UkUwQ0NCR0lCNlNiTHpLbHRiYXMzd3dxbFIyYTFxUk5wK2R3YjdtU1JIdWxv?=
 =?utf-8?B?UWREN1EvNkhNZXluV1o1USswTzllcWpoYStjRmtxSkVVMjVQMk4zUVo3cnd6?=
 =?utf-8?B?dFlXUVhCbmY3cEhGcGx1MGxhakRWd3ZKNG4yL0dQM2VYY21vdXR5ejQ5L1Vw?=
 =?utf-8?B?VTN1ZlFieFk2MXhJMUZPU1g5NHF6OTZtUkFxcHBuV0NkUE40UmtzdVBDWWpH?=
 =?utf-8?B?cC90UG5ML2lxdUFDcHZycVdBOWFSUzEzUW1XTXhOK3ZMREFBMDdrK2JndGt1?=
 =?utf-8?B?eGdzazN5ZHZ2Q2E3MVhtYWlyZXl6dllEZ2trQWp1M0dna1NOZHEvM2FsaEhC?=
 =?utf-8?B?bXhybG92SzVxMVQ2c3YvRTJxeUg2V3VvY3NSY04zU1JqUUQ4MzBZWW5VNS9G?=
 =?utf-8?Q?9mbV/r7Vv+1H0TYbdevF/Sp2u23IKEscKI1pLDK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eca61a59-1095-4973-b949-08d8ff58ffea
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:21:39.1771 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rpTbM0TINbh0NBb+Fp7q3H95F5puzgcJM0XR40WciOrHSlqJBivDYqpXCedJN35R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2937
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
Content-Type: multipart/mixed; boundary="===============1726663019=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1726663019==
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
    <blockquote type="cite" cite="mid:20210407231259.1787-2-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu needs the drm_priv to allow mmap
to access the BO through the corresponding file descriptor.

Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    | 14 ++--
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 69 +++++++++++--------
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  5 +-
 3 files changed, 50 insertions(+), 38 deletions(-)

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
index 36012229ccc1..95442bcd60fb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -951,6 +951,13 @@ static int process_update_pds(struct amdkfd_process_info *process_info,
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
@@ -1039,15 +1046,19 @@ static int init_kfd_vm(struct amdgpu_vm *vm, void **process_info,
 
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
@@ -1062,7 +1073,7 @@ int amdgpu_amdkfd_gpuvm_acquire_process_vm(struct kgd_dev *kgd,
 	if (ret)
 		return ret;
 
-	*vm = (void *)avm;
+	amdgpu_vm_set_task_info(avm);
 
 	return 0;
 }
@@ -1103,15 +1114,17 @@ void amdgpu_amdkfd_gpuvm_destroy_cb(struct amdgpu_device *adev,
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
@@ -1122,9 +1135,9 @@ void amdgpu_amdkfd_gpuvm_release_process_vm(struct kgd_dev *kgd, void *vm)
 	amdgpu_vm_release_compute(adev, avm);
 }
 
-uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
+uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *drm_priv)
 {
-	struct amdgpu_vm *avm = (struct amdgpu_vm *)vm;
+	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct amdgpu_bo *pd = avm-&gt;root.base.bo;
 	struct amdgpu_device *adev = amdgpu_ttm_adev(pd-&gt;tbo.bdev);
 
@@ -1135,11 +1148,11 @@ uint64_t amdgpu_amdkfd_gpuvm_get_process_page_dir(void *vm)
 
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
@@ -1350,10 +1363,10 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
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
@@ -1394,9 +1407,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	pr_debug(&quot;Map VA 0x%llx - 0x%llx to vm %p domain %s\n&quot;,
 			mem-&gt;va,
 			mem-&gt;va + bo_size * (1 + mem-&gt;aql_queue),
-			vm, domain_string(domain));
+			avm, domain_string(domain));
 
-	ret = reserve_bo_and_vm(mem, vm, &amp;ctx);
+	ret = reserve_bo_and_vm(mem, avm, &amp;ctx);
 	if (unlikely(ret))
 		goto out;
 
@@ -1440,7 +1453,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	}
 
 	list_for_each_entry(entry, &amp;mem-&gt;bo_va_list, bo_list) {
-		if (entry-&gt;bo_va-&gt;base.vm == vm &amp;&amp; !entry-&gt;is_mapped) {
+		if (entry-&gt;bo_va-&gt;base.vm == avm &amp;&amp; !entry-&gt;is_mapped) {
 			pr_debug(&quot;\t map VA 0x%llx - 0x%llx in entry %p\n&quot;,
 					entry-&gt;va, entry-&gt;va + bo_size,
 					entry);
@@ -1452,7 +1465,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				goto map_bo_to_gpuvm_failed;
 			}
 
-			ret = vm_update_pds(vm, ctx.sync);
+			ret = vm_update_pds(avm, ctx.sync);
 			if (ret) {
 				pr_err(&quot;Failed to update page directories\n&quot;);
 				goto map_bo_to_gpuvm_failed;
@@ -1488,11 +1501,11 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
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
@@ -1500,7 +1513,7 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
 
 	mutex_lock(&amp;mem-&gt;lock);
 
-	ret = reserve_bo_and_cond_vms(mem, vm, BO_VM_MAPPED, &amp;ctx);
+	ret = reserve_bo_and_cond_vms(mem, avm, BO_VM_MAPPED, &amp;ctx);
 	if (unlikely(ret))
 		goto out;
 	/* If no VMs were reserved, it means the BO wasn't actually mapped */
@@ -1509,17 +1522,17 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
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
@@ -1645,14 +1658,14 @@ int amdgpu_amdkfd_gpuvm_get_vm_fault_info(struct kgd_dev *kgd,
 
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
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index d97e330a5022..bad0ecd6ef87 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
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
+	pdd-&gt;vm = drm_file-&gt;private_data;
 </pre>
    </blockquote>
    <p>Maybe it is better to read, rename pdd-&gt;vm to pdd-&gt;drm_priv
      as well?</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20210407231259.1787-2-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
 	ret = kfd_process_device_reserve_ib_mem(pdd);
 	if (ret)
</pre>
    </blockquote>
  </body>
</html>

--===============1726663019==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1726663019==--
