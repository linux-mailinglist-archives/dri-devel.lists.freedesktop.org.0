Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E6F366D18B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D834B10E4F1;
	Mon, 16 Jan 2023 22:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 423F310E106;
 Mon, 16 Jan 2023 22:11:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tt2uUSdKhOHKpp7Tk6yyFDO6lZXuG10C6nvZS9YOIqbpncksg1vfhFze6DgVWV6XSeeQZkJ8sWMZeyeNQBA6gX+mvrERI3nffvlgynDZW0kdK3sXzXMmJeyCC6PnVKrP6c+bNajD0wQn3O5jaVEyblbUe1tZj/z2UBEDu64Zpha8rxcvh3brEKDC6ryhFu/BXAm2YKl5w18LBfGpkweLyLx/7Nex3rQqt2klaGAw6nqLy2IU+9Muv+SCVL3LUpG4bkLgAoVAsAc+H3ZPF1nBseQicx0nVI2A1aXovERdyBeLWnnpaFQewBG1/qPCMLBLrSORr5POMr/Eiykfg22nEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8xawkFak/baMo3xT7+xfpSqup+uyjjel9CEEh42SxZg=;
 b=bGqq+pLbwGf7W6YiL9WuVs5CnMNvw3/TKWcE3e3sLcmYSSm1ahw/CzxtX6hgdC3qrkquvSkogqQyaxw+lZQCRyzkBtJR/X6nPFaLdfUGXLbe9w0y5dvUQnh74Gy7pmF/bX5rswhcXZBgWMBmKmG4riUe4ezK/CQwxiJ/cuAu3lOH1e9aSZ5C72/jNoq4jmnqmT1kALNSywiWcihXOwao7NNOwh3b3YxpjWxT9BZW9Cx8JcAYsIosF+vdU1X66S0OeSKzqwGaQItJt7VKe6YGRXWm2/v2hXz0IOqF2+wcNe5JKyMR+Vw03Xm809cvyTuko4sDkAO1r5ZIEbo0WyFEMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8xawkFak/baMo3xT7+xfpSqup+uyjjel9CEEh42SxZg=;
 b=0QrgmZD7I6pDQqoBQmYJc+eTnP0AHrrANwvVg4Yto6e9Pzh7ccEwfiLpWVjtDHFvrub9HGsao7/KziongSfS0xC6cySJMdk7mv+M3BeoBKb7+CSavcIQPZhVTj/FRHGwJRhw37OmPKFkfDAWDATByZFrKDA4F6pp7/muF4/LbZ0=
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by SA1PR12MB6970.namprd12.prod.outlook.com (2603:10b6:806:24d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 22:11:31 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54%7]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:11:31 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Thread-Topic: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Thread-Index: AQHZJiXPAS8A4KSer0u2nTaiRTo/Fa6hoTnA
Date: Mon, 16 Jan 2023 22:11:31 +0000
Message-ID: <SN1PR12MB257598437BD1C41AF6E23169E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-5-Felix.Kuehling@amd.com>
In-Reply-To: <20230112013157.750568-5-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-16T22:06:19Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=08e182a2-07c0-41c4-9c15-7ebb40e9ac6b;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-01-16T22:11:26Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: e128e50d-4123-4a59-ba3e-138fd8ccf304
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2575:EE_|SA1PR12MB6970:EE_
x-ms-office365-filtering-correlation-id: 2a64e934-8326-4eb4-d439-08daf80e9f96
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8jSfezjvb2i+uvt94iO1aMZSUt54ffoqEsvFYYMaxAV/3vfIyMGjO8zncwBUCw3fU+KC2uJXzdZCOgQebetqNl7ch7MC3Xz0rwCdDniqhd0ohDhFQ0IceTC8mTAUQMRvCAGkkNCLGWSwTlCMxfh/PdSHbk/yq8YuDYxVwNxTo+WstBfgD/1Chi2z8vZAyQNZ47afIq93vwnCr0PoxS4gH/zXtP4Pr0fnUGwLncLSyG5ovte9sY+GFOUjucx8D8byyGcOvVXdoZhOF+27mn9ZG+T3ZZYK8zgsmlqPIP60JzV8rBdYsf0A6rOl8PDx0O8HJr37Ky4pO9arQ84P45PSlrIJ4WBtR8dwetwbP6FpFNVTmfnqb8f971hgQmVlTHvuCv4QIl47ER3qwWgPopAPo/v0YAzrFjag0+/xzN3c7pOxni1QghkUxu2k3GxC/ewlrM9VhQwuEciiJ+aQvkVgGdspQp98ruOUbd7j2xdUn4k3jmI1z9NVXMMNIZ5xBR4sMtDsJDAQaL++n05Q+mU9SEZcGQE2sdiSdMqhmcHOeLbo0CK2LK/3W+ooiVYZlNyLpjasWtQtkQFdr2YXP2rIiifVXnzamWGmI4W7Zvq3ykNtgE4wflMpQIINfRjONivgQQfHCZJ4OrlY94JVpG1zMekTgyF7LF/RlNAG9ijhVGSnRVr2soEBTOBL7SQKlqkvDe0YL0zqABzIn2svEO+drw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(366004)(346002)(396003)(376002)(451199015)(38100700002)(83380400001)(122000001)(33656002)(86362001)(38070700005)(64756008)(8676002)(5660300002)(55016003)(2906002)(66446008)(4326008)(66556008)(66946007)(8936002)(52536014)(66476007)(76116006)(41300700001)(9686003)(450100002)(6506007)(186003)(26005)(53546011)(316002)(110136005)(478600001)(7696005)(54906003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Qmge0jlowMuAbdUZelLZpaMJ8+AzNQwXZU5jlWD/G7PuRY1ECur5/HYpRNHR?=
 =?us-ascii?Q?d2k74geTv6FTtVU9P1hhpJ1WenVaTubnJH+FB+BRJ4YeqdFwwrC9VMLYPfVP?=
 =?us-ascii?Q?hkTo3UWFxZTY95Fap2XDjK2Uh8de046jCyKBYUdZvpdWtYt+HnMkx5cFSLy6?=
 =?us-ascii?Q?TTZ8oUgwbYOxO0a4wExyR1hwqT9OCtL5p4CA72cbxU2tHulDXvriGuPU0w/4?=
 =?us-ascii?Q?qPYLD47S0MtadBNXoYaEUTxqwrL/pwRkZs+mWDe6rGqRB4ynHE8Bv0rsTlaL?=
 =?us-ascii?Q?a0h5eCgWn8KLhSGUycr+5otwf/LCr6lizP549w8HrUEy10UCASIvXiaz3HwM?=
 =?us-ascii?Q?x1bSoPH34PiZH0cCZsXJ/yG33vcR2fjjPbRfyTRzAC8nTZ6NhXFvav8x7xVr?=
 =?us-ascii?Q?B5eNNCVod3O2DVlm7S+Sw2TxY8qO3WXIK0G+Ep0+xNX2lTnlFViOjV0wC8/x?=
 =?us-ascii?Q?+DQKohrefkMmeNEtQXaha5lq6zxiS4a8qBkyqzVDCaZUv1ErnT5s7mVfHQSX?=
 =?us-ascii?Q?Q6JVc83EuKNkny2VU3Kr2HrOC0PZSZdzhLKg8d4zGO0/mr+VJ+C1muf2A9GQ?=
 =?us-ascii?Q?4b3MdgXQe92TlrHFO4WSmowhlKQYd18zmNJoY34W8UlTHSnXPB1l83hYQ8Xm?=
 =?us-ascii?Q?Xl2mw30LpAurlz++Ga2L2Ir7T4gG4QYafY2GbTWwuZYih+ltD7zhvO249XQ4?=
 =?us-ascii?Q?+F+cl30KUnFNAH7r4+qFUZ+5ZwZjOwAKG4N5lxg58V43wgIWM0ByUD6odX6h?=
 =?us-ascii?Q?yPdz9uJN1eLnyFWhkR9pKlt/dpzth+oNgKDq1psq8SjG3yUlhEWdAcOJpEAy?=
 =?us-ascii?Q?xNj3U+h/gU8cu/YiAQFlh33yKiEDGfMpfOYzU9FNvLFBgpwmD98/qKrJBejY?=
 =?us-ascii?Q?C7edxrnDXQK6snB56yVkFfGOQnKnVesB6bQm/TRiyMiE3kLDQLZCed9LPkQm?=
 =?us-ascii?Q?rHfQ9Q7T3c+/T/QprQba4Vv4S8S8LvijW0MfdZaVjEpqBMN6v2sQ2JwZ9osb?=
 =?us-ascii?Q?zjW7tNVM7K+dH2Rs8pDYsI74TBK75fpidSDJoCo5I9vIpoIoi6uN3mMdabLf?=
 =?us-ascii?Q?61BuW1tKLgOj9AEA8KKWPo+fXW96+jvtVODo1bK8Smx8dfNfYMjMubPtYH9t?=
 =?us-ascii?Q?j3qrqWtYL0D/K5NVGpoIpvxqWejAWeAebtAK0YnYjragjf51v9HtMxXLBiSk?=
 =?us-ascii?Q?GTgQ7kjSrcU4lwSJXs3j4KDcW/9QfbDnHXDKeLN6QfGAFpYccW3Q+3HMhzCL?=
 =?us-ascii?Q?l2o8JX3xofsm1V+d+Min2PiP3KnJ9tAXI35qKSzsxKZ6SULCfsLMtLUrqClo?=
 =?us-ascii?Q?iuC2xkxcqitrWKU1oO2cIetNChKofoVOmLRNMG5JB9t+4sfQX6K+OgZYkaAR?=
 =?us-ascii?Q?cCD6KMLgMkEHeV59sUv5EsRlDnqZ8+rYXs5NLWFOd4kBq9yLMXovlhxFVQiX?=
 =?us-ascii?Q?Gg7z/olYef8/T8NJ211K/rf/ylpfjtS7+ELYCNLET83/m4QC4iV3yR+6uTKo?=
 =?us-ascii?Q?khQNNTMAsqzpuTazICcJXEShsqqNeAAniWZ0FZwTIyotYTqmHvYwidm6CVyL?=
 =?us-ascii?Q?3SFIY6Z/0njGyYciIXc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a64e934-8326-4eb4-d439-08daf80e9f96
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 22:11:31.6726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZT4VHPjIhYXu9x5Pq5yVESMN2BYA0GkE+OPAZg5LIYYuostK3XsLbOrKXvqLFzuj5+90LC2MuynXCOR2J0rVnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6970
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
Cc: "Chen, Xiaogang" <Xiaogang.Chen@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - General]

Comment inline.

Regards,
Ramesh

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix Ku=
ehling
Sent: Thursday, January 12, 2023 7:02 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>; Koenig, Christian <Christian.Ko=
enig@amd.com>
Subject: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.


Instead of attaching the eviction fence when a KFD BO is first mapped, atta=
ch it when it is allocated or imported. This in preparation to allow KFD BO=
s to be mapped using the render node API.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 63 ++++++++++---------
 1 file changed, 32 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 5645103beed0..79213f476493 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -360,6 +360,24 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo =
*bo, uint32_t domain,
        return ret;
 }

+static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
+                                              uint32_t domain,
+                                              struct dma_fence *fence)=20
+{
+       int ret =3D amdgpu_bo_reserve(bo, false);
+
+       if (ret)
+               return ret;
+
+       ret =3D amdgpu_amdkfd_bo_validate(bo, domain, true);
+       if (!ret)
Ramesh: Should space for fences be reserved before adding one.

+               dma_resv_add_fence(bo->tbo.base.resv, fence,
+                                  DMA_RESV_USAGE_BOOKKEEP);
+       amdgpu_bo_unreserve(bo);
+
+       return ret;
+}
+
 static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *b=
o)  {
        return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false); @=
@ -1720,6 +1738,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
                }
                bo->allowed_domains =3D AMDGPU_GEM_DOMAIN_GTT;
                bo->preferred_domains =3D AMDGPU_GEM_DOMAIN_GTT;
+       } else {
+               ret =3D amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
+                               &avm->process_info->eviction_fence->base);
+               if (ret)
+                       goto err_validate_bo;
        }

        if (offset)
@@ -1729,6 +1752,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(

 allocate_init_user_pages_failed:
 err_pin_bo:
+err_validate_bo:
        remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
        drm_vma_node_revoke(&gobj->vma_node, drm_priv);
 err_node_allow:
@@ -1804,10 +1828,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
        if (unlikely(ret))
                return ret;

-       /* The eviction fence should be removed by the last unmap.
-        * TODO: Log an error condition if the bo still has the eviction fe=
nce
-        * attached
-        */
        amdgpu_amdkfd_remove_eviction_fence(mem->bo,
                                        process_info->eviction_fence);
Ramesh: Is it correct to call remove_eviction() unconditionally? This proce=
dure applies to GTT and VRAM BO's only. Furthermore, the fence on these BO'=
s has already been removed in the unmap_memory() call.

        pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va, @@ -1931,19 +1951=
,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
        if (unlikely(ret))
                goto out_unreserve;

-       if (mem->mapped_to_gpu_memory =3D=3D 0 &&
-           !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
-               /* Validate BO only once. The eviction fence gets added to =
BO
-                * the first time it is mapped. Validate will wait for all
-                * background evictions to complete.
-                */
-               ret =3D amdgpu_amdkfd_bo_validate(bo, domain, true);
-               if (ret) {
-                       pr_debug("Validate failed\n");
-                       goto out_unreserve;
-               }
-       }
-
        list_for_each_entry(entry, &mem->attachments, list) {
                if (entry->bo_va->base.vm !=3D avm || entry->is_mapped)
                        continue;
@@ -1970,10 +1977,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
                         mem->mapped_to_gpu_memory);
        }

-       if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
-               dma_resv_add_fence(bo->tbo.base.resv,
-                                  &avm->process_info->eviction_fence->base=
,
-                                  DMA_RESV_USAGE_BOOKKEEP);
        ret =3D unreserve_bo_and_vms(&ctx, false, false);

        goto out;
@@ -1990,7 +1993,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
                struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_=
priv)  {
        struct amdgpu_vm *avm =3D drm_priv_to_vm(drm_priv);
-       struct amdkfd_process_info *process_info =3D avm->process_info;
        unsigned long bo_size =3D mem->bo->tbo.base.size;
        struct kfd_mem_attachment *entry;
        struct bo_vm_reservation_context ctx; @@ -2031,15 +2033,6 @@ int am=
dgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
                         mem->mapped_to_gpu_memory);
        }

-       /* If BO is unmapped from all VMs, unfence it. It can be evicted if
-        * required.
-        */
-       if (mem->mapped_to_gpu_memory =3D=3D 0 &&
-           !amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) &&
-           !mem->bo->tbo.pin_count)
-               amdgpu_amdkfd_remove_eviction_fence(mem->bo,
-                                               process_info->eviction_fenc=
e);
-
 unreserve_out:
        unreserve_bo_and_vms(&ctx, false, false);
 out:
@@ -2266,8 +2259,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_=
device *adev,
        amdgpu_sync_create(&(*mem)->sync);
        (*mem)->is_imported =3D true;

+       ret =3D amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
+                               &avm->process_info->eviction_fence->base);
+       if (ret)
+               goto err_remove_mem;
+
        return 0;

+err_remove_mem:
+       remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
+       drm_vma_node_revoke(&obj->vma_node, drm_priv);
 err_free_mem:
        kfree(*mem);
 err_put_obj:
--
2.34.1
