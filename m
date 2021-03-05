Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0934732EC85
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 14:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A206EB8A;
	Fri,  5 Mar 2021 13:52:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 961936EB89;
 Fri,  5 Mar 2021 13:52:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCgIZOX56zBHNdT/myhTZXLTc2kclj2fuFY0s6dd9OgMeYqVztuiMsr10asFspm1A2TPUyj3nL08njI7Oti4eFRtvANL0/UeGUQ1rQGKya2wnG35FKAzxplxJxRxW1krnvPVGavh4Xb+ZjQBW/zN9s/rdwAoG4UrKS1iAVLDw84eB2hdbP+h1miLh/3JgIZDrZ8Wqi0ZiABwunuMlA8RmbieAafmkDdJ71M5mLZK+Emit/PMsIidv4fYrrAq/cNNGUY8Ynb37tiTtaGSXqs86CCHZp8OmIBJthiob9G6j8ZvcFQwevEDtWcHe87sWpc8GPe+rl5FnKLWLn4LnfpEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ANxKqz+s7fYo+aHkLs6Yzra5f4S0nneRGPw6ILk1g=;
 b=CjVAz7915s3xt0KmKSwb+qCMesnkMHGX6czImRIF4h/v0T6b5FBz05T2jm7YYyKRZRpSNA267zFpso9EfdfQJFgc6nfLLowUw3rfcEN5YjBu3z8K5tdtcyemgcVxSC6EDEkkMguGFzcYvX9H+5ucB0jAohidxdlvSeUnRczr4dPjotfvyhcvONPkRYAy2JLeE3kbMnqz6o3i3t/NK/K2erPfsyrpVhhEGlDE27A5oPVjT4x6adVG2KFpfMMK/t3REgoZ5mfq3KdvniMoz1iVKQLQMG1iunlowYAO876BKSHrkTBDv6EkV4yz3DWO0AxJvAo2EvWQyufOaUqPGuAecQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j5ANxKqz+s7fYo+aHkLs6Yzra5f4S0nneRGPw6ILk1g=;
 b=LLU5gixxDFTbvxeAVcrPHbVTKVgOfvUPDvGdeL3qo/dQduCK6r/1jPOR/pIrZKuXZJ+MG9VP92iuoP2dUXtAvJESoD7IF7EEdr9ZzDlMRmHVy6xiM5TiTZe4youIM89RO/Yky5engEpMOKsA4l9Cf1+m1L4KeHQkSDZI+B6LYwU=
Received: from DM6PR12MB3433.namprd12.prod.outlook.com (2603:10b6:5:38::14) by
 DM6PR12MB4316.namprd12.prod.outlook.com (2603:10b6:5:21a::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Fri, 5 Mar 2021 13:52:14 +0000
Received: from DM6PR12MB3433.namprd12.prod.outlook.com
 ([fe80::807c:1f17:9a40:51a3]) by DM6PR12MB3433.namprd12.prod.outlook.com
 ([fe80::807c:1f17:9a40:51a3%7]) with mapi id 15.20.3912.022; Fri, 5 Mar 2021
 13:52:13 +0000
From: "Jiang, Sonny" <Sonny.Jiang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/amdgpu: load balance VCN3 decode as well v8
Thread-Topic: [PATCH 2/2] drm/amdgpu: load balance VCN3 decode as well v8
Thread-Index: AQHXEb5WI7SXO6cUC0WonY0l2Gmw0ap1afop
Date: Fri, 5 Mar 2021 13:52:13 +0000
Message-ID: <DM6PR12MB34338CBF4B6C59454B65C837FD969@DM6PR12MB3433.namprd12.prod.outlook.com>
References: <20210305125155.2312-1-christian.koenig@amd.com>,
 <20210305125155.2312-2-christian.koenig@amd.com>
In-Reply-To: <20210305125155.2312-2-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-05T13:52:11.487Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [67.71.240.213]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 08863213-a552-4b45-240c-08d8dfdde13d
x-ms-traffictypediagnostic: DM6PR12MB4316:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB43167D10097A0A30F803C4BFFD969@DM6PR12MB4316.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F4ApydE/x9CeKJWvwaDwxt3kcPJq7pAB53K8i6yuCe3FQw1B+Exsynvphbsd73aygDENVAXAtKsiq/6hxr3VblTXI+XqlKJK/o1oGpoPhnQlrIXywJ/D+jK4We7Tsz62G0ZnsW2znN9WQtcthV4mm2fdfQKXLmWL84sdmFFyw5xIT81m0cOa+z9khSv8B8AsBVPOFCE6hX39q99IhR8FhPsBr7vEGuwpm5KDx4QY24QgVuUe1RVHoV1iRGk5IEn6ed33HebzrYPynmrSiqiQwm3obiNeTle20rxsHmmqVJQwBVQqwEj/opQftAKRFlqjMy5FSPhCX4IWjlSZed/GRsZhn8MJW3GNURI50YE00pbgmmU8/fvyS19gBc0+ImQ4Lyul+hyaN1ovMXEmPvqAIM8XJev3PpqnNQ+RWDHTpQPs9GJ64QCxYGit3PBTZhIRZhEf7qQlzSCe3ebuRijefLSgRchOwJIP60ig2tPqYTKm08lPyFWTA1r/EsKA3n5bQRbb0kUyevo9L0X/+jeO1w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3433.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(346002)(136003)(39860400002)(396003)(53546011)(6506007)(2906002)(71200400001)(33656002)(83380400001)(110136005)(9686003)(52536014)(7696005)(76116006)(91956017)(8676002)(316002)(19627405001)(66476007)(66946007)(5660300002)(8936002)(64756008)(66556008)(4326008)(86362001)(66446008)(66574015)(55016002)(186003)(26005)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ancoT5/8WrTVhNwlq83gUJbJb1ptYITHiQ7IEklOp8cFn0MgnzArGtjMw5?=
 =?iso-8859-1?Q?llBo9bmABu48oSWpYCfv1GVvjIpyo8qloGyL+RcmnIu+87Clb7QVQ7UlMh?=
 =?iso-8859-1?Q?W0JqyNUiE16QHE+dUFX6vvmun5vJYmgSkxudXLRyHy4sdaFj9DSjseyy3t?=
 =?iso-8859-1?Q?VL30WBDjnc+KjGz+uHDzb529GGuOGdrtwflXM/F/ns92+BwsK8HSx0RcNN?=
 =?iso-8859-1?Q?JKwLUHdPspDZg+I20v4YPSOo3+7BkjW8Xvek+rDZhg/DvDYIWlssTKgXe/?=
 =?iso-8859-1?Q?18rQ+teuyj7z7tybqS8t2Gbp32ZhtLsbOJShdEBjnjo+RmhSsS4T72XHwP?=
 =?iso-8859-1?Q?iLbfot2ifhzwNVV7xwHCKY2CVAWePtC8H8CjDovuUKMAy/YLvMgJeGT+vf?=
 =?iso-8859-1?Q?rT11rIFDf/4Z0SFfWTijqzBCNDXCQTvuiBjmokFQvpSwmFlYX2s9ER1KKR?=
 =?iso-8859-1?Q?ythqIn8z8G0kfBRpZKke4sAaT8bThHonw4CodBpe7P2MVlP8i8sGEW5nfC?=
 =?iso-8859-1?Q?EJ9cQQSofF4KjSEA/Ca8ZK/jbpL6NZKzwICXrYEL9OPWgPXel2yqxJq43I?=
 =?iso-8859-1?Q?xZ+qXOJ1uYN41XIx+moXCkXM5HVVhg9ThCbhtYQzoDt8wwe0FrnJMe26kT?=
 =?iso-8859-1?Q?fTGXQeezQx1WB7nTj7q46wyZD28PO33uDDw4s/Cd3eRZAThcc+F+53k4qN?=
 =?iso-8859-1?Q?sN/Vs5edJVqJtbTUidXfND6mW5rrPUvQWH/mjPE30WSq6bFASfG31OfN+V?=
 =?iso-8859-1?Q?VvwTUwSR/sdJFTnOd90LnzPFPtGHYK9B5O9zdajegYRe/cZ0vlMziRqdZP?=
 =?iso-8859-1?Q?ymJQjQ8a6UKhnfAM216B9BdTD/NRhKT6pY5spPPPDot9ghrQ11flQHHjT7?=
 =?iso-8859-1?Q?Z8m94SB02S1ORnwN1+1TeF+mMDI/0dtVGBKP89yo2ZYYLtGB6+vrqphwpM?=
 =?iso-8859-1?Q?G2AXe7VeWuIDshktaWX0l/OZCsHN5gACBRlwkVOEPSIFfNsIh2LuXH2OB+?=
 =?iso-8859-1?Q?DfpoUtYQWR0yaBwU1ad9l9jGgZs+c/4sUCARb9dJ5gGOLzKxWuym6bzBrJ?=
 =?iso-8859-1?Q?QRsTqquwwa0B0bWYiXhujjhJHyoqRmKy6x4I41tLvavBdI/TD1KDIPQkfg?=
 =?iso-8859-1?Q?jPFW30pHZxGATrEVylVkbVIUjybFHiPsoeFjWSw/TrSacu2ZBZJpxw4yw5?=
 =?iso-8859-1?Q?I7ed549zHwPd5+iqvEpWMRSvuFdqH1/cdIdx1wh74W28tJsl2TsxuqH0p5?=
 =?iso-8859-1?Q?xfaEimnplabzf5bING1fhn9ibQWy54EpCtezt1+fuqXm13aAWaFB1PL8wY?=
 =?iso-8859-1?Q?9BqRJ/EZgQ+516Odu8QWuRxkwHv1s0nTNTui3xJ9CkwF/d0=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3433.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08863213-a552-4b45-240c-08d8dfdde13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2021 13:52:13.2242 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2+OcOM2wh/dhv8FLVwghkVDJsS8Y+kERva5whH9RpU5MvrNMON4VLO25hPqxvFYkWi7MzpVnBU/Mh6qqcU8Dqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4316
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
Cc: "Liu, Leo" <Leo.Liu@amd.com>
Content-Type: multipart/mixed; boundary="===============1503459114=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1503459114==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB34338CBF4B6C59454B65C837FD969DM6PR12MB3433namp_"

--_000_DM6PR12MB34338CBF4B6C59454B65C837FD969DM6PR12MB3433namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Sonny Jiang <sonny.jiang@amd.com>
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, March 5, 2021 7:51 AM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; amd-=
gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Cc: Liu, Leo <Leo.Liu@amd.com>; Jiang, Sonny <Sonny.Jiang@amd.com>
Subject: [PATCH 2/2] drm/amdgpu: load balance VCN3 decode as well v8

Add VCN3 IB parsing to figure out to which instance we can send the
stream for decode.

v2: remove VCN instance limit as well, fix amdgpu_cs_find_mapping,
    check supported formats instead of unsupported.
v3: fix typo and error handling
v4: make sure the message BO is CPU accessible
v5: fix addr calculation once more
v6: only check message buffers
v7: fix constant and use defines
v8: fix create msg calculation

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 132 +++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v3_0.c
index b33f513fd2ac..77932003b4c1 100644
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c
@@ -50,6 +50,9 @@
 #define VCN_INSTANCES_SIENNA_CICHLID                            2
 #define DEC_SW_RING_ENABLED                                     FALSE

+#define RDECODE_MSG_CREATE                                     0x00000000
+#define RDECODE_MESSAGE_CREATE                                 0x00000001
+
 static int amdgpu_ih_clientid_vcns[] =3D {
         SOC15_IH_CLIENTID_VCN,
         SOC15_IH_CLIENTID_VCN1
@@ -208,8 +211,6 @@ static int vcn_v3_0_sw_init(void *handle)
                 } else {
                         ring->doorbell_index =3D (adev->doorbell_index.vcn=
.vcn_ring0_1 << 1) + 8 * i;
                 }
-               if (adev->asic_type =3D=3D CHIP_SIENNA_CICHLID && i !=3D 0)
-                       ring->no_scheduler =3D true;
                 sprintf(ring->name, "vcn_dec_%d", i);
                 r =3D amdgpu_ring_init(adev, ring, 512, &adev->vcn.inst[i]=
.irq, 0,
                                      AMDGPU_RING_PRIO_DEFAULT,
@@ -1825,6 +1826,132 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_=
sw_ring_vm_funcs =3D {
         .emit_reg_write_reg_wait =3D amdgpu_ring_emit_reg_write_reg_wait_h=
elper,
 };

+static int vcn_v3_0_limit_sched(struct amdgpu_cs_parser *p)
+{
+       struct drm_gpu_scheduler **scheds;
+
+       /* The create msg must be in the first IB submitted */
+       if (atomic_read(&p->entity->fence_seq))
+               return -EINVAL;
+
+       scheds =3D p->adev->gpu_sched[AMDGPU_HW_IP_VCN_DEC]
+               [AMDGPU_RING_PRIO_DEFAULT].sched;
+       drm_sched_entity_modify_sched(p->entity, scheds, 1);
+       return 0;
+}
+
+static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)
+{
+       struct ttm_operation_ctx ctx =3D { false, false };
+       struct amdgpu_bo_va_mapping *map;
+       uint32_t *msg, num_buffers;
+       struct amdgpu_bo *bo;
+       uint64_t start, end;
+       unsigned int i;
+       void * ptr;
+       int r;
+
+       addr &=3D AMDGPU_GMC_HOLE_MASK;
+       r =3D amdgpu_cs_find_mapping(p, addr, &bo, &map);
+       if (r) {
+               DRM_ERROR("Can't find BO for addr 0x%08Lx\n", addr);
+               return r;
+       }
+
+       start =3D map->start * AMDGPU_GPU_PAGE_SIZE;
+       end =3D (map->last + 1) * AMDGPU_GPU_PAGE_SIZE;
+       if (addr & 0x7) {
+               DRM_ERROR("VCN messages must be 8 byte aligned!\n");
+               return -EINVAL;
+       }
+
+       bo->flags |=3D AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
+       amdgpu_bo_placement_from_domain(bo, bo->allowed_domains);
+       r =3D ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
+       if (r) {
+               DRM_ERROR("Failed validating the VCN message BO (%d)!\n", r=
);
+               return r;
+       }
+
+       r =3D amdgpu_bo_kmap(bo, &ptr);
+       if (r) {
+               DRM_ERROR("Failed mapping the VCN message (%d)!\n", r);
+               return r;
+       }
+
+       msg =3D ptr + addr - start;
+
+       /* Check length */
+       if (msg[1] > end - addr) {
+               r =3D -EINVAL;
+               goto out;
+       }
+
+       if (msg[3] !=3D RDECODE_MSG_CREATE)
+               goto out;
+
+       num_buffers =3D msg[2];
+       for (i =3D 0, msg =3D &msg[6]; i < num_buffers; ++i, msg +=3D 4) {
+               uint32_t offset, size, *create;
+
+               if (msg[0] !=3D RDECODE_MESSAGE_CREATE)
+                       continue;
+
+               offset =3D msg[1];
+               size =3D msg[2];
+
+               if (offset + size > end) {
+                       r =3D -EINVAL;
+                       goto out;
+               }
+
+               create =3D ptr + addr + offset - start;
+
+               /* H246, HEVC and VP9 can run on any instance */
+               if (create[0] =3D=3D 0x7 || create[0] =3D=3D 0x10 || create=
[0] =3D=3D 0x11)
+                       continue;
+
+               r =3D vcn_v3_0_limit_sched(p);
+               if (r)
+                       goto out;
+       }
+
+out:
+       amdgpu_bo_kunmap(bo);
+       return r;
+}
+
+static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,
+                                          uint32_t ib_idx)
+{
+       struct amdgpu_ring *ring =3D to_amdgpu_ring(p->entity->rq->sched);
+       struct amdgpu_ib *ib =3D &p->job->ibs[ib_idx];
+       uint32_t msg_lo =3D 0, msg_hi =3D 0;
+       unsigned i;
+       int r;
+
+       /* The first instance can decode anything */
+       if (!ring->me)
+               return 0;
+
+       for (i =3D 0; i < ib->length_dw; i +=3D 2) {
+               uint32_t reg =3D amdgpu_get_ib_value(p, ib_idx, i);
+               uint32_t val =3D amdgpu_get_ib_value(p, ib_idx, i + 1);
+
+               if (reg =3D=3D PACKET0(p->adev->vcn.internal.data0, 0)) {
+                       msg_lo =3D val;
+               } else if (reg =3D=3D PACKET0(p->adev->vcn.internal.data1, =
0)) {
+                       msg_hi =3D val;
+               } else if (reg =3D=3D PACKET0(p->adev->vcn.internal.cmd, 0)=
 &&
+                          val =3D=3D 0) {
+                       r =3D vcn_v3_0_dec_msg(p, ((u64)msg_hi) << 32 | msg=
_lo);
+                       if (r)
+                               return r;
+               }
+       }
+       return 0;
+}
+
 static const struct amdgpu_ring_funcs vcn_v3_0_dec_ring_vm_funcs =3D {
         .type =3D AMDGPU_RING_TYPE_VCN_DEC,
         .align_mask =3D 0xf,
@@ -1832,6 +1959,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_ri=
ng_vm_funcs =3D {
         .get_rptr =3D vcn_v3_0_dec_ring_get_rptr,
         .get_wptr =3D vcn_v3_0_dec_ring_get_wptr,
         .set_wptr =3D vcn_v3_0_dec_ring_set_wptr,
+       .patch_cs_in_place =3D vcn_v3_0_ring_patch_cs_in_place,
         .emit_frame_size =3D
                 SOC15_FLUSH_GPU_TLB_NUM_WREG * 6 +
                 SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 8 +
--
2.25.1


--_000_DM6PR12MB34338CBF4B6C59454B65C837FD969DM6PR12MB3433namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by:&nbsp;Sonny Jiang &lt;sonny.jiang@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, March 5, 2021 7:51 AM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt=
;<br>
<b>Cc:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; Jiang, Sonny &lt;Sonny.Jiang@a=
md.com&gt;<br>
<b>Subject:</b> [PATCH 2/2] drm/amdgpu: load balance VCN3 decode as well v8=
</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add VCN3 IB parsing to figure out to which instanc=
e we can send the<br>
stream for decode.<br>
<br>
v2: remove VCN instance limit as well, fix amdgpu_cs_find_mapping,<br>
&nbsp;&nbsp;&nbsp; check supported formats instead of unsupported.<br>
v3: fix typo and error handling<br>
v4: make sure the message BO is CPU accessible<br>
v5: fix addr calculation once more<br>
v6: only check message buffers<br>
v7: fix constant and use defines<br>
v8: fix create msg calculation<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c | 132 +++++++++++++++++++++++++=
-<br>
&nbsp;1 file changed, 130 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c b/drivers/gpu/drm/amd/am=
dgpu/vcn_v3_0.c<br>
index b33f513fd2ac..77932003b4c1 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/vcn_v3_0.c<br>
@@ -50,6 +50,9 @@<br>
&nbsp;#define VCN_INSTANCES_SIENNA_CICHLID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2<br>
&nbsp;#define DEC_SW_RING_ENABLED&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; FALSE<br>
&nbsp;<br>
+#define RDECODE_MSG_CREATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; 0x00000000<br>
+#define RDECODE_MESSAGE_CREATE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0=
x00000001<br>
+<br>
&nbsp;static int amdgpu_ih_clientid_vcns[] =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_IH_CLIENTID_VCN,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; SOC15_IH_CLIENTID_VCN1<br>
@@ -208,8 +211,6 @@ static int vcn_v3_0_sw_init(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; } else {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-=
&gt;doorbell_index =3D (adev-&gt;doorbell_index.vcn.vcn_ring0_1 &lt;&lt; 1)=
 + 8 * i;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (adev-&gt;asic_type =3D=3D CHIP_SIENNA_CICHLID &amp;&amp; i !=
=3D 0)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ring-&gt;no_sche=
duler =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; sprintf(ring-&gt;name, &quot;vcn_dec_%d&quot;, i);<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ring_init(adev, ring, 512, &amp;adev-&gt=
;vcn.inst[i].irq, 0,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; AM=
DGPU_RING_PRIO_DEFAULT,<br>
@@ -1825,6 +1826,132 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_=
sw_ring_vm_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emit_reg_write_reg_wait =
=3D amdgpu_ring_emit_reg_write_reg_wait_helper,<br>
&nbsp;};<br>
&nbsp;<br>
+static int vcn_v3_0_limit_sched(struct amdgpu_cs_parser *p)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gpu_scheduler **scheds;<br=
>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The create msg must be in the firs=
t IB submitted */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (atomic_read(&amp;p-&gt;entity-&gt=
;fence_seq))<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; scheds =3D p-&gt;adev-&gt;gpu_sched[A=
MDGPU_HW_IP_VCN_DEC]<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; [AMDGPU_RING_PRIO_DEFAULT].sched;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_sched_entity_modify_sched(p-&gt;e=
ntity, scheds, 1);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+}<br>
+<br>
+static int vcn_v3_0_dec_msg(struct amdgpu_cs_parser *p, uint64_t addr)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_operation_ctx ctx =3D { fa=
lse, false };<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo_va_mapping *map;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t *msg, num_buffers;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *bo;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t start, end;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void * ptr;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; addr &amp;=3D AMDGPU_GMC_HOLE_MASK;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_cs_find_mapping(p, addr,=
 &amp;bo, &amp;map);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;Can't find BO for addr 0x%08Lx\n&quot;, addr);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return r;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; start =3D map-&gt;start * AMDGPU_GPU_=
PAGE_SIZE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; end =3D (map-&gt;last + 1) * AMDGPU_G=
PU_PAGE_SIZE;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (addr &amp; 0x7) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;VCN messages must be 8 byte aligned!\n&quot;);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return -EINVAL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;flags |=3D AMDGPU_GEM_CREATE_C=
PU_ACCESS_REQUIRED;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_placement_from_domain(bo, b=
o-&gt;allowed_domains);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D ttm_bo_validate(&amp;bo-&gt;tbo=
, &amp;bo-&gt;placement, &amp;ctx);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;Failed validating the VCN message BO (%d)!\n&quo=
t;, r);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return r;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_kmap(bo, &amp;ptr);<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_ERROR(&quot;Failed mapping the VCN message (%d)!\n&quot;, r)=
;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return r;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg =3D ptr + addr - start;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Check length */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (msg[1] &gt; end - addr) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D -EINVAL;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (msg[3] !=3D RDECODE_MSG_CREATE)<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; goto out;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; num_buffers =3D msg[2];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0, msg =3D &amp;msg[6]; i =
&lt; num_buffers; ++i, msg +=3D 4) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t offset, size, *create;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (msg[0] !=3D RDECODE_MESSAGE_CREATE)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; offset =3D msg[1];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; size =3D msg[2];<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (offset + size &gt; end) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D -EINVAL;<b=
r>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; create =3D ptr + addr + offset - start;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /* H246, HEVC and VP9 can run on any instance */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (create[0] =3D=3D 0x7 || create[0] =3D=3D 0x10 || create[0] =
=3D=3D 0x11)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; r =3D vcn_v3_0_limit_sched(p);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto out;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
+out:<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_kunmap(bo);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
+}<br>
+<br>
+static int vcn_v3_0_ring_patch_cs_in_place(struct amdgpu_cs_parser *p,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; uint32_t ib_idx)<br>
+{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ring *ring =3D to_amdgp=
u_ring(p-&gt;entity-&gt;rq-&gt;sched);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ib *ib =3D &amp;p-&gt;j=
ob-&gt;ibs[ib_idx];<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t msg_lo =3D 0, msg_hi =3D 0;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned i;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* The first instance can decode anyt=
hing */<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ring-&gt;me)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return 0;<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; ib-&gt;length_dw=
; i +=3D 2) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t reg =3D amdgpu_get_ib_value(p, ib_idx, i);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; uint32_t val =3D amdgpu_get_ib_value(p, ib_idx, i + 1);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (reg =3D=3D PACKET0(p-&gt;adev-&gt;vcn.internal.data0, 0)) {<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg_lo =3D val;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (reg =3D=3D PACKET0(p-&gt;adev-&gt;vcn.internal.data1,=
 0)) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; msg_hi =3D val;<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (reg =3D=3D PACKET0(p-&gt;adev-&gt;vcn.internal.cmd, 0=
) &amp;&amp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; val =3D=3D 0) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D vcn_v3_0_d=
ec_msg(p, ((u64)msg_hi) &lt;&lt; 32 | msg_lo);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
+}<br>
+<br>
&nbsp;static const struct amdgpu_ring_funcs vcn_v3_0_dec_ring_vm_funcs =3D =
{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type =3D AMDGPU_RING_TYPE=
_VCN_DEC,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .align_mask =3D 0xf,<br>
@@ -1832,6 +1959,7 @@ static const struct amdgpu_ring_funcs vcn_v3_0_dec_ri=
ng_vm_funcs =3D {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_rptr =3D vcn_v3_0_dec=
_ring_get_rptr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_wptr =3D vcn_v3_0_dec=
_ring_get_wptr,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_wptr =3D vcn_v3_0_dec=
_ring_set_wptr,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .patch_cs_in_place =3D vcn_v3_0_ring_=
patch_cs_in_place,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .emit_frame_size =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; SOC15_FLUSH_GPU_TLB_NUM_WREG * 6 +<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; SOC15_FLUSH_GPU_TLB_NUM_REG_WAIT * 8 +<br>
-- <br>
2.25.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM6PR12MB34338CBF4B6C59454B65C837FD969DM6PR12MB3433namp_--

--===============1503459114==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1503459114==--
