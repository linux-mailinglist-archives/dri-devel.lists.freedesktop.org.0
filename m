Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FCD3799A6
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 00:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51F5B6E934;
	Mon, 10 May 2021 22:06:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2075.outbound.protection.outlook.com [40.107.101.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7F36E934;
 Mon, 10 May 2021 22:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cY24/SzArhXx1Zm3gp/7OXJGe7dBNX3RGSEpUbNmxWVimNIeuGT9U6xYQPcuGn6DqeMV3HOxZbyWUMc2ZZvHq7ShJ17Vj+dufk7QcNutv60ZYdgig6sMnxbXxTvvnmYxrtOEBaPzoA/QSeIqT5go7Hq627+bd3Cpc9PftmEvQimM+YHjrB1p5uJUYiio0hjbidFfmH9GtZFAhPnfWlTcDFoL88FiIZwDojnNTARihazuPF6SeMB5Jetk/LU7/z8mMYFy2iQkpZf0hI+EY30Llk8GDA6sMxD5pbFtUmL8xfwnsQOQbjGWroHvZeo6aC1zM6zxLLQQZNC18CSHCJQo8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvwnBLcPcRKNv/W3+jeCB8PhGkX3r5AzZdnITqsZxZM=;
 b=hUXPNlY7L5AW7aTa+o75+1eMu4XUAx0IsWEje91XiG43JJu18NEQj/qBfa1STIglbb5+eQXJ6JG3FYSh/jOMoYdG0J6zCWcoqHVqZ4iMmVC1QY9beR6vpHdLk8xr57rZ5O4FrE4UOcRE0hxTzTVqrs8EluZbxtEE6lg/HL/HIZ+iWkVL2z/AOhi+qt+Kmz1uL3SGmeHIk3WuKfkwYQl2PHQZzALoxlpOyaHgYLNWN2zVzE5+Gryi2m7HStSQfMpra3HNcc8oJFaCm8K/IBKJQPOwwyCkyLEVkR4iIOuamwM/p8m/v029sj5uL/nT9t6kI3XEiC0EX899U+bATcUvfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qvwnBLcPcRKNv/W3+jeCB8PhGkX3r5AzZdnITqsZxZM=;
 b=1qWeFxhMUo/HE4brkvCQsxh0tfidlwoRfIgWiIJFiOtSaNlHHSxzxJks17qEjW3gpQdnAmAW5bathURQxsgvWk0HLjn4ZYtRV3BRLb3CbTdqRfPwWAGneRHwtzd/ftVuLVRtSlkdOqQByLnm4+pUZyM92FV/LmBoPW3Nd3KJajM=
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SA0PR12MB4367.namprd12.prod.outlook.com (2603:10b6:806:94::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 22:06:36 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:06:36 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 07/10] drm/amdgpu: Move kfd_mem_attach outside
 reservation
Thread-Topic: [PATCH v2 07/10] drm/amdgpu: Move kfd_mem_attach outside
 reservation
Thread-Index: AQHXPU8C8dC5/Ucdcki0o663fcK/7KrdVs6A
Date: Mon, 10 May 2021 22:06:36 +0000
Message-ID: <SN6PR12MB267209BF040B4D659727ED63E3549@SN6PR12MB2672.namprd12.prod.outlook.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
 <20210422013058.6305-8-Felix.Kuehling@amd.com>
In-Reply-To: <20210422013058.6305-8-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-10T22:06:26Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=fd413a4d-3512-40fd-ae46-94e821377422;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: Review of amdgpu code  
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [70.114.142.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9d6f0d88-2c28-4cf9-33d9-08d913ffe11c
x-ms-traffictypediagnostic: SA0PR12MB4367:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SA0PR12MB4367E3867760FE1E87A544B8E3549@SA0PR12MB4367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cSxAx2BFCFpDeojiAflEkJDFEHKq6twbywkInlY79gqCEjcNP2FOO4ZU0U05+rMRKEb2mWxgZKqfB/JFzW17ggv7i6KPxeyS744tMrDzIlreMe35k98BvnNXPTAFwcZnGdrBTcY/a/yxw+4PWWDhB02KFLI8AR76U1zM/NZRuZ6rHa9IQGqiJVXq4nNtUDBy4SI7oPM4grsARPh3TY4NKBS2a2HT4lVf7EX+yXOeiFooWWAnXEjWgFPAfjOI02CtSDhrrJ2Hn8CM55nehCACpX92zGanHVeKlfflhrKs3Lk06vRhEpSkSou456TNQgxj9CiGF6DTYpFgvnnbbWnmpZdYk0mJ/nP0IK8isyUeL0Qss91ENG0kihw77+D+XpQ3ibINwobcXAxIjw4DIiyN0P4TnCEm8rdOJ0zOtzW4NQOPGOOMEdLK0ejDCt504nr1w/l3+LpERRz280p+/RwC18YJDgXpqmAg+dA6LLPPllQDUhUykLkjPmmtMYEhIsBlKiJXeymFHIRx1RD5yiKFRGy+7phHz+UIbk7PrB3tHfqwSO0Oh4MmLcoTgdLeMF0rmD5j4sXtH9vWLtzXIgroY/2EvKTjpLFPYyOma2Xk93lmEi9Qn+kHsMY5UmtKq0iUllDxyfF6xe8tzgRn2iV0bw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(366004)(136003)(376002)(39850400004)(66946007)(110136005)(9686003)(45080400002)(76116006)(26005)(52536014)(8676002)(55016002)(316002)(33656002)(450100002)(478600001)(186003)(66556008)(66446008)(8936002)(83380400001)(966005)(6506007)(53546011)(66476007)(71200400001)(2906002)(122000001)(5660300002)(38100700002)(86362001)(7696005)(64756008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?1JWmb5Dr/o/Vh5e7M+dzDI/7iZTUium1JDzhRY6yTgGWFkCC1EHlADACglqq?=
 =?us-ascii?Q?PWPkUxpYI4zS5eRWHTKov87rlOiVdF0xazWLH3M46p5EGXOrcEhJMug29U5M?=
 =?us-ascii?Q?GiithrZmUjumGTENBOQ9Pl0RLmptxms61e1lybCip1Kqfz9cxpW+v/J6MbS+?=
 =?us-ascii?Q?Ahjw6oLG3SPPbcogK9qgXFfH50lrxmSMZHkbwmYq0P/F0pItX04Nu4VMUQXl?=
 =?us-ascii?Q?ka2eJ/Q/On5JApLPMUKhLa0kOLglyXbvWOO7XA6ETkmVS4jD+APgdd4ueaJ+?=
 =?us-ascii?Q?dqbQqa827MJYcrwx98brvErd7pWvqZd/FAc8+4FZoUIUgtB61xhObdrZFNM2?=
 =?us-ascii?Q?kLEM9Vf3jfDWpTyIqKOV3tGbJanY++7/pV7FVRCq5vJmqLTvVydscRd9/ekV?=
 =?us-ascii?Q?RZqv+N6kuOP+yxbolbsaYrqKG7PPuvZG+GLLpn4vKbfJS+PfK53AhnwitagA?=
 =?us-ascii?Q?xQMKwEXFxa621HuBTkmF3lPQCNHh5z1AaKQvK1lbOa2E746OnFqzClGFr7pb?=
 =?us-ascii?Q?asshPXKEYsSqVpgBtTnRRO+H9zBiuX7cwKwds28p29FTp4OHGUcz2+2JzRjp?=
 =?us-ascii?Q?bF15RdM2Z9eeMk9/xu2IfoP1me6oJcu2o/a8lRL7qlA/RgYEa1NxEY1F1rX9?=
 =?us-ascii?Q?JK6Syu9tQYAeN5/rkH2GvgQOMoM46Wj2jCkv3kYe4n4j9Cp6A1RuxpzD2h0E?=
 =?us-ascii?Q?olN0l513O+vJDGOek2JsIXMb3j1G6GZ7MOaCmSyWFRVlNBVyXicPiP5ak479?=
 =?us-ascii?Q?h5CCdfPFjaaIOO7c/biUo/k7K/TDfVVi+yDciItGtZZiPN5S0U44S8z6U9xm?=
 =?us-ascii?Q?hrX7WrbE/jFpx6ro6vav6vWpnrLSvIMexroLXth5HrRsE7A5Ygfavq/s9/OO?=
 =?us-ascii?Q?K1Roz+YcgYWEuIcya7sNDUcDrebf1FuAV9d0Tsdl2DIbFKdCUYRnz6jwz64Y?=
 =?us-ascii?Q?8yHdZGwVspkntxb1TGZ0kbmJpl4p9a6PWIul97uaUUU3TukVY1zRg+qcEuyQ?=
 =?us-ascii?Q?3+NVALdKckrjxOLiblx0TmdgCslPE6APZQc7rALo+oSwov1RqRw27IKN0XPs?=
 =?us-ascii?Q?i68t5WETpKBwejc1U2YdiN1yaTCiWqK6U4/7lSGbffUBh8xC7I857kFw58Ym?=
 =?us-ascii?Q?JOGY86aOD0nVPju/IQ5InSXT0GkMCFOqkLJrSEqV0eyIomNR3VMWOLUaqeAs?=
 =?us-ascii?Q?XzZHyR8zS4+4RuMSAP6Gpt4h/gVz9JCEKVWfLpKAL4EM0nBNqSF7Ebk5WYwY?=
 =?us-ascii?Q?J3Fp8O3eg4HpJDJQ52YBgvnb7bACDOQ9xC499d/B1EDs0crnf81eAvCG6iGP?=
 =?us-ascii?Q?RG0nQJV9NbJlhyiLzejXg4dR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6f0d88-2c28-4cf9-33d9-08d913ffe11c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:06:36.2796 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pZmpPEfP/s6OouwJQjeiBaFZiE8W/VLZE2h0KamZoaP4sCfylw8Dwk/ZPmZsOtJ9o064TU/NsguOnTh+sBcemw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4367
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

Acked-by: Ramesh Errabolu <ramesh.errabolu@amd.com>

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Kuehling=
, Felix
Sent: Wednesday, April 21, 2021 8:31 PM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/10] drm/amdgpu: Move kfd_mem_attach outside reservati=
on

This is needed to avoid deadlocks with DMA buf import in the next patch.
Also move PT/PD validation out of kfd_mem_attach, that way the caller can b=
o this unconditionally.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 75 +++++++++++--------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 7d25d886b98c..9eeedd0c7920 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -577,6 +577,34 @@ kfd_mem_dmaunmap_attachment(struct kgd_mem *mem,
 	}
 }
=20
+static int
+kfd_mem_attach_userptr(struct amdgpu_device *adev, struct kgd_mem *mem,
+		       struct amdgpu_bo **bo)
+{
+	unsigned long bo_size =3D mem->bo->tbo.base.size;
+	struct drm_gem_object *gobj;
+	int ret;
+
+	ret =3D amdgpu_bo_reserve(mem->bo, false);
+	if (ret)
+		return ret;
+
+	ret =3D amdgpu_gem_object_create(adev, bo_size, 1,
+				       AMDGPU_GEM_DOMAIN_CPU,
+				       0, ttm_bo_type_sg,
+				       mem->bo->tbo.base.resv,
+				       &gobj);
+	if (ret)
+		return ret;
+
+	amdgpu_bo_unreserve(mem->bo);
+
+	*bo =3D gem_to_amdgpu_bo(gobj);
+	(*bo)->parent =3D amdgpu_bo_ref(mem->bo);
+
+	return 0;
+}
+
 /* kfd_mem_attach - Add a BO to a VM
  *
  * Everything that needs to bo done only once when a BO is first added @@ =
-598,7 +626,6 @@ static int kfd_mem_attach(struct amdgpu_device *adev, stru=
ct kgd_mem *mem,
 	uint64_t va =3D mem->va;
 	struct kfd_mem_attachment *attachment[2] =3D {NULL, NULL};
 	struct amdgpu_bo *bo[2] =3D {NULL, NULL};
-	struct drm_gem_object *gobj;
 	int i, ret;
=20
 	if (!va) {
@@ -632,15 +659,9 @@ static int kfd_mem_attach(struct amdgpu_device *adev, =
struct kgd_mem *mem,
 		} else if (amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm)) {
 			/* Create an SG BO to DMA-map userptrs on other GPUs */
 			attachment[i]->type =3D KFD_MEM_ATT_USERPTR;
-			ret =3D amdgpu_gem_object_create(adev, bo_size, 1,
-						       AMDGPU_GEM_DOMAIN_CPU,
-						       0, ttm_bo_type_sg,
-						       mem->bo->tbo.base.resv,
-						       &gobj);
+			ret =3D kfd_mem_attach_userptr(adev, mem, &bo[i]);
 			if (ret)
 				goto unwind;
-			bo[i] =3D gem_to_amdgpu_bo(gobj);
-			bo[i]->parent =3D amdgpu_bo_ref(mem->bo);
 		} else {
 			/* FIXME: Need to DMA-map other BO types */
 			attachment[i]->type =3D KFD_MEM_ATT_SHARED; @@ -665,13 +686,6 @@ static=
 int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 		va +=3D bo_size;
 	}
=20
-	/* Allocate validate page tables if needed */
-	ret =3D vm_validate_pt_pd_bos(vm);
-	if (unlikely(ret)) {
-		pr_err("validate_pt_pd_bos() failed\n");
-		goto unwind;
-	}
-
 	return 0;
=20
 unwind:
@@ -1478,12 +1492,12 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
 	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
 		mem->va + bo_size * (1 + mem->aql_queue));
=20
+	ret =3D unreserve_bo_and_vms(&ctx, false, false);
+
 	/* Remove from VM internal data structures */
 	list_for_each_entry_safe(entry, tmp, &mem->attachments, list)
 		kfd_mem_detach(entry);
=20
-	ret =3D unreserve_bo_and_vms(&ctx, false, false);
-
 	/* Free the sync object */
 	amdgpu_sync_free(&mem->sync);
=20
@@ -1560,6 +1574,12 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 			mem->va + bo_size * (1 + mem->aql_queue),
 			avm, domain_string(domain));
=20
+	if (!kfd_mem_is_attached(avm, mem)) {
+		ret =3D kfd_mem_attach(adev, mem, avm, mem->aql_queue);
+		if (ret)
+			goto out;
+	}
+
 	ret =3D reserve_bo_and_vm(mem, avm, &ctx);
 	if (unlikely(ret))
 		goto out;
@@ -1573,15 +1593,9 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 	    bo->tbo.mem.mem_type =3D=3D TTM_PL_SYSTEM)
 		is_invalid_userptr =3D true;
=20
-	if (!kfd_mem_is_attached(avm, mem)) {
-		ret =3D kfd_mem_attach(adev, mem, avm, mem->aql_queue);
-		if (ret)
-			goto attach_failed;
-	} else {
-		ret =3D vm_validate_pt_pd_bos(avm);
-		if (unlikely(ret))
-			goto attach_failed;
-	}
+	ret =3D vm_validate_pt_pd_bos(avm);
+	if (unlikely(ret))
+		goto out_unreserve;
=20
 	if (mem->mapped_to_gpu_memory =3D=3D 0 &&
 	    !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) { @@ -1592,7 +1606,7 @@ int a=
mdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 		ret =3D amdgpu_amdkfd_bo_validate(bo, domain, true);
 		if (ret) {
 			pr_debug("Validate failed\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
 	}
=20
@@ -1607,13 +1621,13 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
 				      is_invalid_userptr);
 		if (ret) {
 			pr_err("Failed to map bo to gpuvm\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
=20
 		ret =3D vm_update_pds(avm, ctx.sync);
 		if (ret) {
 			pr_err("Failed to update page directories\n");
-			goto map_bo_to_gpuvm_failed;
+			goto out_unreserve;
 		}
=20
 		entry->is_mapped =3D true;
@@ -1630,8 +1644,7 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
=20
 	goto out;
=20
-map_bo_to_gpuvm_failed:
-attach_failed:
+out_unreserve:
 	unreserve_bo_and_vms(&ctx, false, false);
 out:
 	mutex_unlock(&mem->process_info->lock);
--
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cphilip.y=
ang%40amd.com%7C1f49b70a3bae4897034908d9052e5a31%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637546518914050257%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3D%2=
Bn6mwTHrNa7qGjkihshsT7z7cY1ffs5HsGI69PfZ36I%3D&amp;reserved=3D0
