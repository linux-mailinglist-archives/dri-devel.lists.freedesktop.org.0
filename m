Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 619D735F7BE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A846E94B;
	Wed, 14 Apr 2021 15:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2043.outbound.protection.outlook.com [40.107.92.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A159B6E94B;
 Wed, 14 Apr 2021 15:37:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBYaAlFVSn/QzELIsuW4Lk1dOkQwjw+P3w2JPV6Xd6ymDF3qaOGwQkP34OZ7XdybTNYzPPHh+B5E1f67Tj/fi20AS3JtkCHTVIORQsPsN0qA47tlyW2/j1ToRQUvVtMSfTkv3AbMlBdx9/QmvlpYWmrKhY2g8pnjlZ5fuUKtvIf6TsfwNHLVuLkrgNuyzAG0VLOiw1TDHMV1Yh7kpA1gazwqM5pHytdjaa23DBdOvvHWKL9RKPvyQBGl/24rktWDqJd/C8VhLbnWopWrT181KuQJTEYGu62emtsnUyMi+mBYzh+CFkFB7F/Jr2CKFePhkK+q+dEZdbv5tltFglalsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bHlhSvidVHLa/EWfD8s3piptdvS53Y2V41T5dNrsOY=;
 b=OTnmqS5/7nhTgxiQb/l7qvYZdFs3+mJlgzMwPsKLVO2k3y+hL0zo6YTB3TiMCgErbOKC8sv92wRZPuSy+aMOkODtpVtk4bV2fU2YPe3JeFw8AqNEyQoV1WyzLRyCl2w2XKxOO1lQ1uuH4QNxa82jZ1R7U+eUhLnNc6enhSqkW9Vp7vBfZw9xvBd97nOViJIGQyOmfFJhmhfUDPnTlR+parTcnp63ez7AQaKpcEG8aFHB5I1NLlIoPzezT5S/t3gRACb4U1o74g3gXi989gu6vv1+tSJCDZx7EcZ4GSycxWQeA3VgbM9rmHVqEp9WcIGMfc4/1B9KV/OzeVYZ9rr/Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6bHlhSvidVHLa/EWfD8s3piptdvS53Y2V41T5dNrsOY=;
 b=TjmIBMm8x7/TqvWJ9QwFD5jDEBJIBVFbGKxQEHfrBj5iNUtBFxERVV60/BprS275zzQrRQNCAct1uFzJkC40ysk7eXlOGs756dMh7Zh4V4AzABua09JgSbePa2ZcM1WTE9Fc7eU46TrYWbQ0T/Uy4W4i8Pxrdu8LmHuIbGp4y/s=
Authentication-Results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB2583.namprd12.prod.outlook.com (2603:10b6:4:b3::28) by
 DM5PR12MB1882.namprd12.prod.outlook.com (2603:10b6:3:112::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22; Wed, 14 Apr 2021 15:37:38 +0000
Received: from DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa]) by DM5PR12MB2583.namprd12.prod.outlook.com
 ([fe80::d568:cff1:dc2a:5baa%3]) with mapi id 15.20.4042.016; Wed, 14 Apr 2021
 15:37:38 +0000
Subject: Re: [PATCH 3/4] drm/amdkfd: Allow access for mmapping KFD BOs
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20210407231259.1787-1-Felix.Kuehling@amd.com>
 <20210407231259.1787-3-Felix.Kuehling@amd.com>
From: philip yang <yangp@amd.com>
Message-ID: <2557c4ab-0b7d-b7f7-044a-2c0a3c9ed78f@amd.com>
Date: Wed, 14 Apr 2021 11:37:36 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
In-Reply-To: <20210407231259.1787-3-Felix.Kuehling@amd.com>
Content-Language: en-CA
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::35) To DM5PR12MB2583.namprd12.prod.outlook.com
 (2603:10b6:4:b3::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.38] (165.204.55.251) by
 YTBPR01CA0022.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.22 via Frontend Transport; Wed, 14 Apr 2021 15:37:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4762e1f7-6f16-4907-4930-08d8ff5b3bd7
X-MS-TrafficTypeDiagnostic: DM5PR12MB1882:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB1882796272D46336F46890BBE64E9@DM5PR12MB1882.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fqfRI7/KE1B+E6dqs+7XOIsZVte1T2zaoMcdh/kpwazCOe55gfGXUQ0OYnjkVNtpmirLiMag3g/+ohS1Zn3Qk1IK9GNQ5BkC4ib49aexINIOC374OLi3dh0Qex/s4wv3z/xNpJketa4qP6Wc7Av8rZDCIwNfBv8hJaJGLAUetW4QYND6H1WXy7aJg6icCxfCM+c2exetCJW3iJ/n3+uMNSkC+76BJAQUnGGHRLeQRILvDHDDHr5l/CLc2zWfMDCsabLjfmUXVTSox12ANdMTY1Ake1XC2JW/jplqRaTOG8JEjoNed5DxQWfsmg760U+rmxPv6nZDaE4PDcKGpvOuzRwNgtwmaW/eXjFDZNpxy8MKWFddA54R+POQheQLlEphCR+sYaAFWVW0vshEdUQ6iztxJv9hqTe9YkesP0rUu13MZFJdOBVHO0zFDfUFha4u7/TlBOkc0V8xtvVeyQifh/c9M3YJJHTm/IcefjTZfa11b/zeyToL0oMpsXzhrdqHaQ7cpj5TCgsjNsD3SJAEWaOdKUwM1RrM6WvULhqh1LIUUhGEQ1HCEipJAWQy5nhDGYErHEvfssD6sg88KWBRzSDOxaApHJX5eGh/5IfoNtzWBGM1rQxXlV1CIoGa8rEtcrjdgBlGwq3DjDFQRViAbzx+ED1rUhl5dYbtMPIelLNsD/VzG/yxAb8l2EqwZJ+1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2583.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(66476007)(2906002)(53546011)(6486002)(478600001)(956004)(31686004)(2616005)(26005)(186003)(66556008)(8936002)(8676002)(5660300002)(31696002)(4326008)(316002)(36756003)(38100700002)(16526019)(66946007)(83380400001)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RytrSGdjblh4a1JITW1hNnVJSkFaaVRMUC80ZlA1a2R2SW1XbHNYcStpK3J0?=
 =?utf-8?B?Rk9uM0Q1TGlkOXNpQ3RzN0ZWRG9ROG5qK1drVUdsZGZBLy9zdG0ybEhLNjZU?=
 =?utf-8?B?NkFJOHFrQXJ6L2J5UXplcjA1UXJuTHFaV0pGanRMU0E1b2NENHNXMWRmeHlR?=
 =?utf-8?B?YkxzQ0xvVVlaMy9oSmtCVEZ0T0RZL1RlQk5IY1N3cXBKN1RpNkM4NVE2UERV?=
 =?utf-8?B?SjVmWWJxQkk5cGdkZUxiUCtUQjNNdTBUM2hwSTRpSStreU1nTStDa3U3c2RJ?=
 =?utf-8?B?TEd4TUY3M0NSdmFnOFF4VWptbVZFQUpJUDBJeXhmMWJQM0Z2R2pZZXhrcHll?=
 =?utf-8?B?UTFMUVBGYjUxVXVZL2pPeDZIeXFianN6RmttbmtMSkN1NVNMb3ByODN4R1Rn?=
 =?utf-8?B?bjJxNU1zMDFYcXZnajB6dUxoWkQyTnNtNkJKUU1RMldzTUllOE8vdm9PRzhF?=
 =?utf-8?B?UVJhcEFpVmx6My9nL1pvMXIvemd1MHgyNG1rZXYxOFlkRlJDc3hGTUVheFYx?=
 =?utf-8?B?MElxTlZTeVVldU16ak9OejIvUnBXNnVSMUhWWkgvcFFQcGd3U2d3MkNWQlhO?=
 =?utf-8?B?WnRac1BZRVV0Ykl5TmRCR0JxNDljeWQwbEdpdGM4Z2ZjMG50b2lOc29FOTky?=
 =?utf-8?B?SGFFb25Cc1M0ZGRaeUtmaHdEZEVjSnhoWlVWNFF6N2dPa2ZSVmZnOFRwZE9J?=
 =?utf-8?B?YzNuLzh4emZoQnA0ZjNPVnZuSjF3U2ZPTWpwY3A3ZXlvNm1JdTUydS9JNkgr?=
 =?utf-8?B?SkgxY1lzMkd1d0lzUG85cVFUU2V6UUQ4U1pSMjZjNXlyMUROdlA2MWlYcGJt?=
 =?utf-8?B?UWE0Q3lNN0xtYUNpcFBkMWM1V2hVQmdwckFNMFgxR2ZOQThnSFpkb2t5N0dR?=
 =?utf-8?B?dnArRXZML1ZDTHY4TU96cm04dTVhVURzdFdoY3Q0UStBRlJKb3RHZnU1bmlq?=
 =?utf-8?B?elV2K3RlS0RaaC9UeTFBM0ZVcWlJQnA3R2ZhQ2pNcFdxa0F6REd3L1hSZ3JX?=
 =?utf-8?B?emtRaGNoQU9lZ0RwaVJyZFdxbnB5enIyeHZoL0tBQjBQbmhzRUcxd3l0Ny8y?=
 =?utf-8?B?bGZLZUVETXJpRmh3eEJHRTJmeDdUWXl3OGdyWHZDbUorYUxSaC9KcXJCVGlv?=
 =?utf-8?B?SUZXN0RFUjZpb1EvWUhkcmxON0plYWFnZ1dZeDl0VklBYUcwQ3FDamFkSWE2?=
 =?utf-8?B?bUxWUGNVSHV5emRzRGdsL1N1QWlNemw3bGl1bDhPV1pwSDJCalBzdk8vMTBl?=
 =?utf-8?B?YmpJQ1lCKzdLdk5lZVdwaUwwdGRlNCtTT253aHRJQncxalRIL01nL1hxZjV6?=
 =?utf-8?B?ckxLMVFBc1gzb295c3ZablJONTl4SSsvNmJmM2JQOWN4YU1XVHZpbVpSSWVl?=
 =?utf-8?B?YlorRnNWUWdNWmhnUmF2dU9kK1Zsc2g1RUl6YzhWN3o3NVAybjBGaTRld2ZY?=
 =?utf-8?B?RUhydWJLMkhHVGdnZUNUR1VNM0psZkJYWGVKMWcxbCtObEFnN1k5QzVFOVFx?=
 =?utf-8?B?dVJmL0taSW5QYlM3aEdiVzFSb01GR3pJNERJeFdnYWR4UWI4ZktXQjgzeGNJ?=
 =?utf-8?B?Smp5NkwwajEwWXAyVEh0b2VUVmZNR0E4cW1iRGpPdC9UOElPWWUxNmtSNnov?=
 =?utf-8?B?VDlNWURrVmIrVHFveE1NY1pObThPNFU1QWg4STFYUlJWTmJranJkSW9NQTR2?=
 =?utf-8?B?VHcrZjZzTjdEVWovS2xGRHV3SDFzQkNud0syUmtlNWNpdFVMR0J1T21oSVU1?=
 =?utf-8?Q?hUEVX5v5bbfqDkJ6BrtWfCuodog423ckoMBRH8T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4762e1f7-6f16-4907-4930-08d8ff5b3bd7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2583.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 15:37:38.5955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZfCtMKs2wzaYBP/44diLvcOsdOPLim1dYZE9neMLVehjEsbVjWTzAUiqyIyyhUg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1882
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
Content-Type: multipart/mixed; boundary="===============1734728853=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1734728853==
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
    <blockquote type="cite" cite="mid:20210407231259.1787-3-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">DRM allows access automatically when it creates a GEM handle for a BO.
KFD BOs don't have GEM handles, so KFD needs to manage access manually.
</pre>
    </blockquote>
    <p>After reading drm vma manager, I understand it uses rbtree to
      store all GPU drm file handle when calling drm_vma_node_allow,
      drm_vma_node_is_allowed/drm_vma_node_verify_access is checked when
      creating mapping, I don't understand how application uses this,
      but seems we need call drm_vma_node_allow when
      amdgpu_amdkfd_gpuvm_map_memory_to_gpu, to add mapping GPUs drm
      file handle to vma manager.</p>
    <p>Regards,</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20210407231259.1787-3-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
Signed-off-by: Felix Kuehling <a class="moz-txt-link-rfc2396E" href="mailto:Felix.Kuehling@amd.com">&lt;Felix.Kuehling@amd.com&gt;</a>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  3 ++-
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 19 ++++++++++++++++++-
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      |  8 +++++---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c      |  7 ++++---
 4 files changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
index 0d59bebd92af..7c8c5e469707 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h
@@ -245,7 +245,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 		void *drm_priv, struct kgd_mem **mem,
 		uint64_t *offset, uint32_t flags);
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size);
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv,
+		uint64_t *size);
 int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv);
 int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 95442bcd60fb..e7d61ec966b6 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -1232,6 +1232,12 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 			 domain_string(alloc_domain), ret);
 		goto err_bo_create;
 	}
+	ret = drm_vma_node_allow(&amp;gobj-&gt;vma_node, drm_priv);
+	if (ret) {
+		pr_debug(&quot;Failed to allow vma node access. ret %d\n&quot;,
+			 ret);</pre>
    </blockquote>
    <p>pr_debug(&quot;Failed to allow vma node access. ret %d\n&quot;, ret); <br>
    </p>
    <p>It's within 80 columns.</p>
    <p>Philip<br>
    </p>
    <blockquote type="cite" cite="mid:20210407231259.1787-3-Felix.Kuehling@amd.com">
      <pre class="moz-quote-pre" wrap="">
+		goto err_node_allow;
+	}
 	bo = gem_to_amdgpu_bo(gobj);
 	if (bo_type == ttm_bo_type_sg) {
 		bo-&gt;tbo.sg = sg;
@@ -1261,6 +1267,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 
 allocate_init_user_pages_failed:
 	remove_kgd_mem_from_kfd_bo_list(*mem, avm-&gt;process_info);
+	drm_vma_node_revoke(&amp;gobj-&gt;vma_node, drm_priv);
+err_node_allow:
 	amdgpu_bo_unref(&amp;bo);
 	/* Don't unreserve system mem limit twice */
 	goto err_reserve_limit;
@@ -1278,7 +1286,8 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
 }
 
 int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
-		struct kgd_dev *kgd, struct kgd_mem *mem, uint64_t *size)
+		struct kgd_dev *kgd, struct kgd_mem *mem, void *drm_priv,
+		uint64_t *size)
 {
 	struct amdkfd_process_info *process_info = mem-&gt;process_info;
 	unsigned long bo_size = mem-&gt;bo-&gt;tbo.base.size;
@@ -1355,6 +1364,7 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	}
 
 	/* Free the BO*/
+	drm_vma_node_revoke(&amp;mem-&gt;bo-&gt;tbo.base.vma_node, drm_priv);
 	drm_gem_object_put(&amp;mem-&gt;bo-&gt;tbo.base);
 	mutex_destroy(&amp;mem-&gt;lock);
 	kfree(mem);
@@ -1666,6 +1676,7 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
 	struct drm_gem_object *obj;
 	struct amdgpu_bo *bo;
+	int ret;
 
 	if (dma_buf-&gt;ops != &amp;amdgpu_dmabuf_ops)
 		/* Can't handle non-graphics buffers */
@@ -1686,6 +1697,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct kgd_dev *kgd,
 	if (!*mem)
 		return -ENOMEM;
 
+	ret = drm_vma_node_allow(&amp;obj-&gt;vma_node, drm_priv);
+	if (ret) {
+		kfree(mem);
+		return ret;
+	}
+
 	if (size)
 		*size = amdgpu_bo_size(bo);
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index 43de260b2230..8fc18de7cff4 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -1328,7 +1328,8 @@ static int kfd_ioctl_alloc_memory_of_gpu(struct file *filep,
 	return 0;
 
 err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, (struct kgd_mem *)mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, (struct kgd_mem *)mem,
+					       pdd-&gt;vm, NULL);
 err_unlock:
 	mutex_unlock(&amp;p-&gt;mutex);
 	return err;
@@ -1365,7 +1366,7 @@ static int kfd_ioctl_free_memory_of_gpu(struct file *filep,
 	}
 
 	ret = amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd,
-						(struct kgd_mem *)mem, &amp;size);
+					(struct kgd_mem *)mem, pdd-&gt;vm, &amp;size);
 
 	/* If freeing the buffer failed, leave the handle in place for
 	 * clean-up during process tear-down.
@@ -1721,7 +1722,8 @@ static int kfd_ioctl_import_dmabuf(struct file *filep,
 	return 0;
 
 err_free:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, (struct kgd_mem *)mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, (struct kgd_mem *)mem,
+					       pdd-&gt;vm, NULL);
 err_unlock:
 	mutex_unlock(&amp;p-&gt;mutex);
 	dma_buf_put(dmabuf);
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index bad0ecd6ef87..da452407c4e5 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -648,7 +648,7 @@ static void kfd_process_free_gpuvm(struct kgd_mem *mem,
 	struct kfd_dev *dev = pdd-&gt;dev;
 
 	amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(dev-&gt;kgd, mem, pdd-&gt;vm);
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(dev-&gt;kgd, mem, pdd-&gt;vm, NULL);
 }
 
 /* kfd_process_alloc_gpuvm - Allocate GPU VM for the KFD process
@@ -712,7 +712,7 @@ static int kfd_process_alloc_gpuvm(struct kfd_process_device *pdd,
 	return err;
 
 err_map_mem:
-	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(kdev-&gt;kgd, mem, NULL);
+	amdgpu_amdkfd_gpuvm_free_memory_of_gpu(kdev-&gt;kgd, mem, pdd-&gt;vm, NULL);
 err_alloc_mem:
 	*kptr = NULL;
 	return err;
@@ -907,7 +907,8 @@ static void kfd_process_device_free_bos(struct kfd_process_device *pdd)
 				peer_pdd-&gt;dev-&gt;kgd, mem, peer_pdd-&gt;vm);
 		}
 
-		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd-&gt;dev-&gt;kgd, mem, NULL);
+		amdgpu_amdkfd_gpuvm_free_memory_of_gpu(pdd-&gt;dev-&gt;kgd, mem,
+						       pdd-&gt;vm, NULL);
 		kfd_process_device_remove_obj_handle(pdd, id);
 	}
 }
</pre>
    </blockquote>
  </body>
</html>

--===============1734728853==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1734728853==--
