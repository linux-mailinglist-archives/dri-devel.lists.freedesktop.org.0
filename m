Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E92379988
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 00:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BB046E92A;
	Mon, 10 May 2021 22:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2067.outbound.protection.outlook.com [40.107.100.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A77566E928;
 Mon, 10 May 2021 22:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uw+YjwYr3svJR41mnuRRmxF3t1JaruyyTFM2pI2vXyK9QRoTmtWwGgNFvAIQtrqFPeJtftH5f15jBlqE+rwv3AOo/kdtUdFwnOIrotPbQX8dejFNXjMVU5ljhTVHA++ZngX0XSAzb4r43gy1/2KF6pXND+r6B+l64LGSgraFi5cdikYnhycrLhIW2kSu9rSV8LGXRk+L7JOxE97El9e2ftLHjX9Ei1ZtI1BHU6+FeHVmVOffFDB0unFWq6XB3wk4vqODpouhvK0E8sUpZbt1R/mytHgqfXd8ZHep1g2lOW5jFkpVwxiQqNH3kuz07u/NX3PYsXB1FBGFuIaUZNdE2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bt13lieucIPyC0CuFq/vzf5exLXKOBZVPqVfov7B6xA=;
 b=MT/cAxxlxjL8zmz0hr7RGlTh8e9Ww3P12lBNkzbladhG70EFHszpDmvzQMlUEqH0WPTqmF2VM0Pce7HjPVUvgmFJ5QTz4nhSTMGd0BZBn4en6iXYuyY/Di9WY0HiaLYpenRtz+G9zTa++wqyz3rNZsNzoOhaZZ4cdx2MDh1EFeg/XQU+LGUfOkXdMwo3H+9zs0VXOawzLkdeY1a5NOnqcf1gT2/eUEhpQcM3SX9g06unZIIVie7bInHcNq+AoBLEN6ypGw38dgJyTVnX7wUPs+ewQkhGz1umYugolFIdTpwelqTqjHkyoGc+mrkBaC/fp2nlwUmhDUa+nEepCKsWLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bt13lieucIPyC0CuFq/vzf5exLXKOBZVPqVfov7B6xA=;
 b=xFnbt4+IigMpgFMvrLamxgekWzzIT3j7xVnMeiXsvO0ki+SglTBuWBtet5CSaCLmKwWxzgYbhbf2KAZfA2wstLRMYvTjo3BlNqK3kbKpYypgOSa/JFUsonHVTo8HFdpRI4l/BGLR4hxNfQREwsu+l4AtV5QYhTxm2KvVqUHOvyU=
Received: from SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25)
 by SN1PR12MB2591.namprd12.prod.outlook.com (2603:10b6:802:30::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 22:00:55 +0000
Received: from SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021]) by SN6PR12MB2672.namprd12.prod.outlook.com
 ([fe80::9c8a:73d6:9a07:d021%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 22:00:55 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 03/10] drm/amdgpu: Keep a bo-reference per-attachment
Thread-Topic: [PATCH v2 03/10] drm/amdgpu: Keep a bo-reference per-attachment
Thread-Index: AQHXPU8CBPO0xcsmYUOFvquSEx0+tKrdVSsA
Date: Mon, 10 May 2021 22:00:55 +0000
Message-ID: <SN6PR12MB26722789CD280AE779AB2EE5E3549@SN6PR12MB2672.namprd12.prod.outlook.com>
References: <20210422013058.6305-1-Felix.Kuehling@amd.com>
 <20210422013058.6305-4-Felix.Kuehling@amd.com>
In-Reply-To: <20210422013058.6305-4-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=true;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-05-10T22:00:47Z; 
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal Use Only -
 Unrestricted;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ActionId=6004247f-b3aa-4a45-8e2a-1d982176d886;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=1
msip_justification: Review of amdgpu code  
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [70.114.142.194]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6f0cfb22-69fd-4e6d-8b00-08d913ff161b
x-ms-traffictypediagnostic: SN1PR12MB2591:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN1PR12MB259181C8702ACB818D34A834E3549@SN1PR12MB2591.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Wei3wccnl6J/btpZgI5iUBOsDFBMestO7BacSvJTaibHzGAYJcrnDbdI5wmtmmcfiiqN2MlsZ4NvUsQ3BkP6aEmxAQgyomICStcyLeVvQRsMjmqxPWzQFo5bWrwlDUx1NFXSPYwjZSA8D/sC5IUIVnlpTbMvDicpLJ1wH1lei1Jq3/rbyzk7ZmRB1pxqAIfqT3h5BCr82KLAV4+EsSweip1wGp3JSX5LVDkjmIZBOXsfpKOwBHRcU3GhX+kAtbPRj6kTWz6+f7OrwRgIjTdDyjJY88eCSDWr5+CYOe/nhYuZ5AF/awTBJ3S/+V/mdTs+Jx3d4Dc8RRVStyKymb5zAR9lFw3LhSzGPgTKxLFfaHZCknTdokqVlm2bggYdy5cPfG3WxBnuq+gmd0R+u05IS2yrlFdPCKgvGYyfboACwmvwWq5XiuPg88S42vT/PvVgkSpyWPPu8lTiZMj6/mhKlJaUK8buigKAcmN4M88GSSXAjQaq/MDpL9yjBDOXmjsd+oFa5KQOf8TWocIyJoqI+2nxd/mLJFW70U0L/0UUpLo++ePe18q7vouRd+izgUXlkRnBJxdCNbdJNPlLLzpKXQ7119tFGkddcJhaCbHnv/sF8k59wHCNuVc78iqZbrw6T9l4rmnP+4J4aUjBP5+E1g==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2672.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(346002)(136003)(39860400002)(376002)(83380400001)(5660300002)(8936002)(316002)(110136005)(9686003)(186003)(55016002)(8676002)(450100002)(26005)(66476007)(76116006)(66556008)(64756008)(66946007)(6506007)(53546011)(478600001)(122000001)(45080400002)(86362001)(71200400001)(38100700002)(2906002)(52536014)(33656002)(7696005)(66446008)(966005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?DmU1//jO2YTQKaiv8xlkuP3A+DAW03kdrY+7KyONzTk1asBycXnAYEKtJunh?=
 =?us-ascii?Q?UGDImfRIl9AQHFuZgsWmktUXFCll3XDYeewZwqC2WgYmXoS8Y2xLbo99Pv/i?=
 =?us-ascii?Q?56XvPTKHx82CkV+Od9FP4BBjdpkWDG7HFWv4h5o+mwOoXjJoccKVpOUvyMmO?=
 =?us-ascii?Q?pMsSvyrnKwx+XgvWmrQIELF8By9S6mDCBApMmfqBGUuO5Wz4I7/rE7ZsL9ml?=
 =?us-ascii?Q?L4bKK4Qm4F43k3LQPAD0aZmCHiALyVx+QG3dUralxkg/05OFAOJYeHjX0EL4?=
 =?us-ascii?Q?9svGcjODEdqZds4EJ/NjrIDn39Am7j3KnvbCh+rN+wbugb0hujmIAAsR4orV?=
 =?us-ascii?Q?ok98+wXTMsGk8Av0LXM7sRs76W7xcqGJ1Dtw148w4mBvvyeSi8Ic7TYrnX7r?=
 =?us-ascii?Q?eOwpI5WwWM24zUHFTmL40PZ8YlMdI1advtRGX3F9jSO9qhZgXFB0VEiec+7y?=
 =?us-ascii?Q?UpcpK1Ib6HjUHCbBPKmE1FtFQ8nLFvc1M9jkq0rV07ueKfYf2PDK6mFTllPs?=
 =?us-ascii?Q?4VjPp6wOo6judxi2b0rEZpvbRdqPhRmmeSrykqYp5yDBH+iXBLjXbLdTZxUP?=
 =?us-ascii?Q?jdgxBl6+qUpU8MaVQwcUl0RUX8Jv3/n8GDrRXN66l0NGWm8Gr6PEtmQMBOR5?=
 =?us-ascii?Q?KD9m8GMwUPAYP/PnZlyRcDC/7aInyNMTqnreSE7ir5zMvWQ4GQph8+nxsAeR?=
 =?us-ascii?Q?/kpBiTJ7uYo0ENmcYkYSb2MJhAlWENFeTGRecqYlUXOSEbXMhuZVoPDo8C1l?=
 =?us-ascii?Q?CyKs1NuLVaP8wChB/AYiU1oQj/OOxAHO8rjAPUzUxVHrzBb5PKTA23/tfSy5?=
 =?us-ascii?Q?0aMrQ2jNMLvmlw1Ya7mnVA6qhjLwZfhc8jDiM1Ayl+LscqL+aLyFIN2IUQ7j?=
 =?us-ascii?Q?IlKXPWvUq2Rhpq9YfOEoXLSIsvGfL4RRdQgubewzKcs+78TLMEV1RoZcVJGa?=
 =?us-ascii?Q?b78qhb+sKUJF9XS3U2TjCPJgOhdGAtQYH19CUIrdvOAKNIBByzRRQaiFty6e?=
 =?us-ascii?Q?Ct8W6RliQ5H4h+jGux5xSM3KLgw4ZMbS+P4JdE1GkpBFDF6Rage+okeE4lrs?=
 =?us-ascii?Q?JdapuPgiA1X2TIXPmYfum2kjcn8aruBWvlMkqh8/SOdUNQaCmd/fUZdTQB0b?=
 =?us-ascii?Q?v0cIb8raNxGA+bcU3wkxJH7wINL/hI3kUp4wcdUsQ317wyrBzqOP2D3a0tcY?=
 =?us-ascii?Q?FKFrw3pG5mcDAwzpHH8kDUVpyt0Jq40ncpxT1n1kGb4t9+XTBSeGcPhs4gOF?=
 =?us-ascii?Q?lOpcUnegxWvtwoz5mubE44XdnlSd1c4qG7TWDknjX4TEgSiCwbvgxqWPB3Av?=
 =?us-ascii?Q?B0zXCXcj6bbv/CKqGHXVJyzb?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2672.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f0cfb22-69fd-4e6d-8b00-08d913ff161b
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 22:00:55.6558 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Htz6e0wZlIR/RMvPC6k5r2aa68vwdPa/e/lGavyc5WeZu2eqcbzhKkA0dk/AW6Dc4jnG/Jf7EpQ6J8GFHEk+1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2591
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
Subject: [PATCH v2 03/10] drm/amdgpu: Keep a bo-reference per-attachment

For now they all reference the same BO. For correct DMA mappings they will =
refer to different BOs per-GPU.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 22 ++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index fee4c64dd051..34c9a2d0028e 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -489,11 +489,11 @@ static int kfd_mem_attach(struct amdgpu_device *adev,=
 struct kgd_mem *mem,
 		struct amdgpu_vm *vm, bool is_aql,
 		struct kfd_mem_attachment **p_attachment)  {
-	int ret;
-	struct kfd_mem_attachment *attachment;
-	struct amdgpu_bo *bo =3D mem->bo;
+	unsigned long bo_size =3D mem->bo->tbo.base.size;
 	uint64_t va =3D mem->va;
-	unsigned long bo_size =3D bo->tbo.base.size;
+	struct kfd_mem_attachment *attachment;
+	struct amdgpu_bo *bo;
+	int ret;
=20
 	if (!va) {
 		pr_err("Invalid VA when adding BO to VM\n"); @@ -510,6 +510,14 @@ static=
 int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
 	pr_debug("\t add VA 0x%llx - 0x%llx to vm %p\n", va,
 			va + bo_size, vm);
=20
+	/* FIXME: For now all attachments use the same BO. This is incorrect
+	 * because one BO can only have one DMA mapping for one GPU. We need
+	 * one BO per GPU, e.g. a DMABuf import with dynamic attachment. This
+	 * will be addressed one BO-type at a time in subsequent patches.
+	 */
+	bo =3D mem->bo;
+	drm_gem_object_get(&bo->tbo.base);
+
 	/* Add BO to VM internal data structures*/
 	attachment->bo_va =3D amdgpu_vm_bo_add(adev, vm, bo);
 	if (!attachment->bo_va) {
@@ -529,7 +537,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, s=
truct kgd_mem *mem,
=20
 	/* Allocate validate page tables if needed */
 	ret =3D vm_validate_pt_pd_bos(vm);
-	if (ret) {
+	if (unlikely(ret)) {
 		pr_err("validate_pt_pd_bos() failed\n");
 		goto err_alloc_pts;
 	}
@@ -540,15 +548,19 @@ static int kfd_mem_attach(struct amdgpu_device *adev,=
 struct kgd_mem *mem,
 	amdgpu_vm_bo_rmv(adev, attachment->bo_va);
 	list_del(&attachment->list);
 err_vmadd:
+	drm_gem_object_put(&bo->tbo.base);
 	kfree(attachment);
 	return ret;
 }
=20
 static void kfd_mem_detach(struct kfd_mem_attachment *attachment)  {
+	struct amdgpu_bo *bo =3D attachment->bo_va->base.bo;
+
 	pr_debug("\t remove VA 0x%llx in entry %p\n",
 			attachment->va, attachment);
 	amdgpu_vm_bo_rmv(attachment->adev, attachment->bo_va);
+	drm_gem_object_put(&bo->tbo.base);
 	list_del(&attachment->list);
 	kfree(attachment);
 }
--
2.31.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cphilip.y=
ang%40amd.com%7C45e84767a4a54ffcf1e908d9052e6301%7C3dd8961fe4884e608e11a82d=
994e183d%7C0%7C0%7C637546519079854064%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wL=
jAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dh9=
%2BK4amKsU5EZUkaA5tI3j1x7xSWECROzVi%2FAY%2FgtLs%3D&amp;reserved=3D0
