Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC7B66D149
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 23:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A535D10E0C6;
	Mon, 16 Jan 2023 22:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC9F10E0C6;
 Mon, 16 Jan 2023 22:04:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ/wJYAIONAqYez6rYgrqvhQD40Jj5qTq4OKdHeFn/luyvUcALA7Hqfqc6BvN5NhOI9F7DMWKtJNYX9NLVi2/sqXWOdNn+2zxmsuv0u4d/mKqDuCZG8g1jGgJGFAFEuBTP24u3HG8cS1bo0HnJqG1G9REgUUhmtCuF0iEGUkCLXv4NnquaQ1qwNr3nCbcjA0SgSeB/Eztj78B45Wqbg3PEebFwZ9BEjNC0mxSj0fZfFW0VsjdAEONO2JdWAKWuaWjLMcHmYr53qG7iTMadYVRm67ctDsbt710vWtU+oR+dtUZsOj9b9Y3nFor4zhkhanegZ3ctN2EmIEAue0+mmeqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpCLOnwgklxjKpuFmKFDwaqgAu489itd0tLjKWas/bE=;
 b=Ty3SUpd5M6xrFMMBof9M3y0I+IQqltDVmw0Fx40HQ7FtfgJ4Zqb/Olu4VemSFOTs6YozYBiBUb+2MvIs27JK2YNv5UUi42C3n80OPVQDqptd5MhF1fHGIzFcG1we47GDKBk5UnhJQpruKvO95jXFeS12nDr40n2o2ISwTA4MexYZoOdZCw3x3jWyPtFiH2HFX4skQYsPdPz6lxKXCgdvY4rejVoRjuJNgZ/AEFsmJb8j4FJwP1Be1/Ggy+Bh6nQJ+yM6oy7aEfZudLNmqeAN5sbqCioGu6z24pVgtntbW+Hxd4enwQFENqqN30guP7pni9yMwMvakmYfPta4hg6iUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpCLOnwgklxjKpuFmKFDwaqgAu489itd0tLjKWas/bE=;
 b=tlc4MaNPYNNI9NRN1d11Hn7vbexNsZ7Rsm4ZZT33I+ud9dgDi6fVEsV48QG9KLOxxqH1hhHLZjMBi81PNrBghRpg1PLlR7Sg+rdegbMgZ9PxitybLHuflUUY+usEbrmkzRJuRl2/bSTDQWJS7hpI/Citbc9kGAkT44DSH5zzBZo=
Received: from SN1PR12MB2575.namprd12.prod.outlook.com (2603:10b6:802:25::14)
 by PH7PR12MB5974.namprd12.prod.outlook.com (2603:10b6:510:1d9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 16 Jan
 2023 22:04:40 +0000
Received: from SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54]) by SN1PR12MB2575.namprd12.prod.outlook.com
 ([fe80::87ca:ad81:f4c:5b54%7]) with mapi id 15.20.5986.023; Mon, 16 Jan 2023
 22:04:40 +0000
From: "Errabolu, Ramesh" <Ramesh.Errabolu@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Thread-Topic: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import
Thread-Index: AQHZJiXIKN7Jfn1RokSSyMaA6sB2Wq6hnrCQ
Date: Mon, 16 Jan 2023 22:04:40 +0000
Message-ID: <SN1PR12MB2575C7B1393EBAE6D4DFF395E3C19@SN1PR12MB2575.namprd12.prod.outlook.com>
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-2-Felix.Kuehling@amd.com>
In-Reply-To: <20230112013157.750568-2-Felix.Kuehling@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-01-16T21:57:14Z; 
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=a656bef6-8f98-4c0c-bbf2-55c781aec659;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_enabled: true
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_setdate: 2023-01-16T22:04:37Z
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_method: Standard
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_name: General
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_actionid: c26b4391-93ba-4bec-8e6e-681742ce4685
msip_label_4342314e-0df4-4b58-84bf-38bed6170a0f_contentbits: 0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN1PR12MB2575:EE_|PH7PR12MB5974:EE_
x-ms-office365-filtering-correlation-id: b44b5ff3-0e40-4fe4-784a-08daf80daa97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wB3MppUdYyY4LXa1AJdt/gDpRe2UNAgDoEACxF+T36Ysr2LKjPVLB4HJC45ZmCaziSuRjBZLFbt7qfRCENMFYA9qZBCuEo5fBTnpqz35yhOw2UGczXQ0MWr8JSMUlCUZLnM1SyxPr/h4NUe05hpmk5G262/oGPnF4DK+JSEezn7EyY+6erQQ9KiZBjHICDK2LNDewJx61uD9hG6hdxEqk9TIhi2MuhyiNV3PoY4znYX/uMNUus1FbGd6H9cfqP5VaWyA39WYmgJyQ6dI0/6oE0OmLwM49dFjS5pZXeTvu7YfFjuS38L53e4Xdlkb03tL+AqjTbs0FhIkDHojRQLoDQWeyNcQ6mGw6jDgr6OUCxqj+XWsL+biB+LUDJqAoJIy0wHJt4zUSdQkK/rkdNLU51U01Smmx2i+KqFmqxi9Y9wNPY7HrZZmTfKcWjtdKETMRgVgvvkMw36D6Ucc+gXstFOhLMD/wC0FeexOSyhq0faqCBF2cPtOF13nDpgqVBDfWhMqb7k27QqR4NaWtx1WAlDqjPtY3eJu8QGLn/tNJIN677rMMc6YumfG6RfR34h+XG031+vbiAYKXoIytbyOvmKFFJSHLW65E+2i5WVFl2858hNsW46lhgLjuvYFY0BJ5dEg9YcOuV6Ax0m42/aoMjKqmHfA9NLt0ixvcRD7+O/u3WvSOZMFPdx3zi8jQP1gmxTkTDdaGGD6l2xTfceXfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN1PR12MB2575.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199015)(41300700001)(52536014)(53546011)(38100700002)(8936002)(33656002)(55016003)(9686003)(83380400001)(38070700005)(66476007)(316002)(478600001)(110136005)(54906003)(4326008)(8676002)(76116006)(86362001)(66946007)(66556008)(6506007)(64756008)(66446008)(26005)(122000001)(186003)(450100002)(7696005)(71200400001)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cc3AMBuw/DzlLTXMiqXI3o95E5+B64Q1uXnjevs8BZ4KEEak0R0EBbG07aiG?=
 =?us-ascii?Q?gf2tWK2hbvFhR0JvWtXT2NyqwYiVpGQJ9uS8z26w0y7cc4H+aFyZE8fXdN1G?=
 =?us-ascii?Q?nVpLPIfeYFyPVva9c4UbctK0XyXHY978dChotqg0boJnqR48lMle/uGmq3Ao?=
 =?us-ascii?Q?m8so9+8v0j9GrjB3U+4hDg0rPSttotTXE94oCEWqEc5LdCKWfIoXuQT6yc3F?=
 =?us-ascii?Q?Md+56sc/5O7JP9TCKxhT2UFCHPfNDooyR/gvAikU5gVafL05i9w/k/I+YWeU?=
 =?us-ascii?Q?iDXQIn6knQOH1jYkYvKSoDTAJcq2IFMre+p3AQA/ZtMzF8tAL5Fief2Pds1r?=
 =?us-ascii?Q?ugiYmhniRaHy1HY9TBWlBxjVoyA+tHXrNPxJKlJzh2kUvWmPEWVVWlIgQg1r?=
 =?us-ascii?Q?TTBV6Y9MtK67d2R4j7QnVc6UCZTQApfS+8nr8ZwPfB63JkEDxZMRBdH29QVZ?=
 =?us-ascii?Q?XaLxnx3f4IS9hzPROKyihaygjRfd1fZDofHfzegfIB5j5wPVWd6X9uQ7gSXl?=
 =?us-ascii?Q?7bc3H3er7eHthHolm0lL4vGAYuMQGD7R0Aa5qtbhqRHpZeiPeibEdNhuJqmT?=
 =?us-ascii?Q?sqAPtGtH//vwNDdxeq/aLhhz4DlxwzoA2/HbRyfBzjyjptZrCJ5HauwEinlO?=
 =?us-ascii?Q?pXzbPtPWfCuToKAzEBspmQ7eQm4JSWQ+aLpp3ohEFOs2DaG7NQCHnTMFd7oN?=
 =?us-ascii?Q?G+V1yp21+uVxJlR19/Ye+YHdlM+/LhMrEj1N/XTI4kS/aVU9rS9rdoOKceiG?=
 =?us-ascii?Q?YlwcIaJg01Wj4BCB42LyGV8n68gbJdksWzW9gfNQ/QRtExBs0slnzLkjYSRk?=
 =?us-ascii?Q?1xpqO/CpRM4vY1hZn/R2jaEr6fD1XqVjtvYNHR0EB3/P4uh2yLelglZAkHdt?=
 =?us-ascii?Q?4BrcEE+Gf0UUf3cWyxnJ1m9JugiQTDtZhBanrLwpuk6mbrjibxqpWPCuGNSP?=
 =?us-ascii?Q?Ti1qzsXlMtyNDUXqKBqGQnnA0Rc9OGoPujN+FI+MsG1JanPGjjaKPaIhTLJZ?=
 =?us-ascii?Q?8ucXzymo+57wQjzRQp1Ts5t4k+NAPMikgakBCCUnMV9Rw1v+ySyW6CW142Mi?=
 =?us-ascii?Q?rauXBaihd5wmXHzAxOezEzVmBTyYCzcNPsdRUZgln4XwNX4mViH/tBqKM4rK?=
 =?us-ascii?Q?zySUd/6rgHLzIzS+iM4Sv5CSuZILEa6+NJjZFeMv8ww+RKkU+dcnNQpuVbkg?=
 =?us-ascii?Q?lSvmQI14Xtp5WbEzDUFN0iwbPIrB5QLZcZrO2+nsb7AXH0n2FkHDJHP9MYpR?=
 =?us-ascii?Q?J2e6tYOZd0w/i+Fdl98Txu54VL5QDOS15nG7rFziit6qrIx026Se0B64esgx?=
 =?us-ascii?Q?xsm9xCtfsuYy1IH7Qlz4X+VISsEjdsiuE1U+8+IeY9ib/Nwa9g6U1p6nD87g?=
 =?us-ascii?Q?4xPhI2cycfS42olC66jYwKTcXsVcXKf8yTNBi7hwurT+dGY6XRl1w3A2mrAr?=
 =?us-ascii?Q?v9UUYePDEbYVdmZ0b0DcSDGqGm4GHOMD31NlB5dEvm8YlXU2J/DI2oYLGIQS?=
 =?us-ascii?Q?6f1aVh5HgXEHCt5tj9D4QfRq05lGHlSq39fpjMDu60k9US0GgDgZv2ppKQRz?=
 =?us-ascii?Q?eMw6Fh1PXPkoIxj/CG4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2575.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b44b5ff3-0e40-4fe4-784a-08daf80daa97
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2023 22:04:40.6194 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aCySxFgKglnp2ewKaNjNJyfBK7fylmw0I5mHZnDS40+YcKv2U3wPholUw2kimGkFHAQSdaDTFlCKRi7Yb8lpCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5974
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

A minor comment, unrelated to the patch. The comments are inline.

Regards,
Ramesh

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Felix Ku=
ehling
Sent: Thursday, January 12, 2023 7:02 AM
To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
Cc: Chen, Xiaogang <Xiaogang.Chen@amd.com>; Koenig, Christian <Christian.Ko=
enig@amd.com>
Subject: [PATCH 1/6] drm/amdgpu: Generalize KFD dmabuf import

Caution: This message originated from an External Source. Use proper cautio=
n when opening attachments, clicking links, or responding.


Use proper amdgpu_gem_prime_import function to handle all kinds of imports.=
 Remember the dmabuf reference to enable proper multi-GPU attachment to mul=
tiple VMs without erroneously re-exporting the underlying BO multiple times=
.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
---
 .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 38 ++++++++++---------
 1 file changed, 21 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu=
/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
index 6f236ded5f12..e13c3493b786 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
@@ -2209,30 +2209,27 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu=
_device *adev,
        struct amdgpu_bo *bo;
        int ret;

-       if (dma_buf->ops !=3D &amdgpu_dmabuf_ops)
-               /* Can't handle non-graphics buffers */
-               return -EINVAL;
-
-       obj =3D dma_buf->priv;
-       if (drm_to_adev(obj->dev) !=3D adev)
-               /* Can't handle buffers from other devices */
-               return -EINVAL;
+       obj =3D amdgpu_gem_prime_import(adev_to_drm(adev), dma_buf);
+       if (IS_ERR(obj))
+               return PTR_ERR(obj);

        bo =3D gem_to_amdgpu_bo(obj);
        if (!(bo->preferred_domains & (AMDGPU_GEM_DOMAIN_VRAM |
-                                   AMDGPU_GEM_DOMAIN_GTT)))
+                                   AMDGPU_GEM_DOMAIN_GTT))) {
                /* Only VRAM and GTT BOs are supported */
-               return -EINVAL;
+               ret =3D -EINVAL;
+               goto err_put_obj;
+       }

        *mem =3D kzalloc(sizeof(struct kgd_mem), GFP_KERNEL);
-       if (!*mem)
-               return -ENOMEM;
+       if (!*mem) {
+               ret =3D -ENOMEM;
+               goto err_put_obj;
+       }

        ret =3D drm_vma_node_allow(&obj->vma_node, drm_priv);
-       if (ret) {
-               kfree(*mem);
-               return ret;
-       }
+       if (ret)
+               goto err_free_mem;

        if (size)
                *size =3D amdgpu_bo_size(bo); @@ -2249,7 +2246,8 @@ int amd=
gpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
                | KFD_IOC_ALLOC_MEM_FLAGS_WRITABLE
                | KFD_IOC_ALLOC_MEM_FLAGS_EXECUTABLE;
Ramesh: Is it correct to assign WRITE & EXECUTABLE permissions to alloc_fla=
gs variable.

-       drm_gem_object_get(&bo->tbo.base);
+       get_dma_buf(dma_buf);
+       (*mem)->dmabuf =3D dma_buf;
        (*mem)->bo =3D bo;
        (*mem)->va =3D va;
        (*mem)->domain =3D (bo->preferred_domains & AMDGPU_GEM_DOMAIN_VRAM)=
 ?
@@ -2261,6 +2259,12 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_=
device *adev,
        (*mem)->is_imported =3D true;

        return 0;
+
+err_free_mem:
+       kfree(*mem);
+err_put_obj:
+       drm_gem_object_put(obj);
+       return ret;
 }

 /* Evict a userptr BO by stopping the queues if necessary
--
2.34.1
