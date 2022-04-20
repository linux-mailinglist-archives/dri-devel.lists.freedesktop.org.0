Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0C250884B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:40:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF0E10EDF5;
	Wed, 20 Apr 2022 12:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEBC10E864;
 Wed, 20 Apr 2022 12:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XSRvrd2QiqnJgD4+oAFZ6w7AQdscH/NDUnOEIA3xouwf2/7hawzM2jFrkKVHB01A8AXmZkSQSJBIsiFcPuIPzVJPH5S0FmZBYbUE7VYPnenCtkr6IvBBrCH3a4Aswy/sJKko41SnlNLU/uJpa/oHmflbEDk0aXgZZaxzjpdSVHVv2PEJz1/R7fl/hkHEmirUWDC0JZ8aAsbsq69DyB5yoLOGywnQYZG6r7eSpXh0T/Tuz+i/L8bS0vc/HYSQz52o2cnZJ2moKyg4pjEPcVcxDUSJj7DD4IyMuZsCk7QLavlo1+Wpq6nILqLbnrCOTM4xG8RUjB1u4fWH0v75T6/aSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74uSvR5y6PN5TRq6wTTd85i4oy+/Qk8u2aVBquhjpE4=;
 b=DQQmwdjZvppNtOvQbYnmaR6eNUelZvfTUQ6gZehayqi2bRSMnLtrzqEw1sjY75H6BGQZAk7eQuEuL5aNghX+F46mC+UOHqc9OOObvoImdNP9FkWxv3jdCB0qh6FGnWeRizbZZBt0Kk1AgKY7jH6ClvnKVjBdIKEOFHB1o1ODRQIoR+YIl6sDvjUXETyYnQZVTqRoIrlxw6AduEs+9SaLks0kw+RLbiGiXM6uCARvU7oHLO5GAMk33sgNBKpdutOl2AU2gaFbojjkSLmtl1toUu/12h17prpHfQe1h712BReDnnQKtAHRgBbl8baKSh1YeWTC4m2F0VyaLglgtTvhdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74uSvR5y6PN5TRq6wTTd85i4oy+/Qk8u2aVBquhjpE4=;
 b=pfix9RJvBtXViQhh5ome1ZQaLWAfOkiR85TCcHI4F04sfjKVpjbxYpIyM61dHwDfqPwqfVrGpehkPNnhrDGZiiKKbFcW67jmvBoaPMnZ9S0XCQQTKgq8okB97CKVDiv7rkM0bKGsrd53ieKrVk9vPBVYcKLYhBHTtxSPpO/oIi4=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by DM5PR12MB2421.namprd12.prod.outlook.com (2603:10b6:4:b4::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Wed, 20 Apr
 2022 12:39:54 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 12:39:53 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasOAAB8mgIAAB9e4gAAJlwCAAAiMCA==
Date: Wed, 20 Apr 2022 12:39:52 +0000
Message-ID: <CO6PR12MB54735D4B8E05AB1C17D356AE82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
 <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <65ef352b-59c8-e802-5285-afc59e56fa9b@amd.com>
 <CO6PR12MB547340CB065269B1731812B182F59@CO6PR12MB5473.namprd12.prod.outlook.com>
 <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
In-Reply-To: <572ed15c-b47e-e7b3-850a-cb0d5259af04@gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-20T12:39:53.317Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f65de00a-9823-4471-486a-08da22cade6f
x-ms-traffictypediagnostic: DM5PR12MB2421:EE_
x-microsoft-antispam-prvs: <DM5PR12MB24213287BDE287A06AC73BD082F59@DM5PR12MB2421.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oLBwdsY82pbsRicnUbcKjvNDexCOetarXjmrEUqQakpUojP9Cx72KmZQzYRhm+ncF0rrSkrowPWU2NI8aEypNUFwuD7Dr0LrercwZbzOGOCtTZ3r9VWlubGplkWvNo/DdPUH46RtgQ91uRTOVrDGsW8bg/I3xFsZV408jar5fx/BOR2bH3M8stsHP/zNE79AwJGxKcLDl72xNY7XWgj7nQ7QhqcBIaYkSqxeXe7Kr5UCs0NlxHj+OaTNG91UHqD8iRbfYJKLWoc87JHCmTXRwCQR/eUmK6Wgu8yeTHffQa4DQEofLfeYKqsVYHwur/DpvTJRcA1BlBWNcuqQWbXcg45tBCIJklUJP8glfaBzVC74JepPYqRmkzCPoZqcYAz1yJN30jZ6/XiP2zst9ML/lTsNLB5C83+DD74vtPZ5BNLqZ7xjwu0Bi4UwI8jKYywuJ8L7zU2NsvyQlsrA0Y/hX2FtKtfNyzh6chaITl8FxYR2ZNZUHwA7+nwlwTPH4dZWpW9gIGfyXYUZWpQTgpGZnritVT+BruwNruPZS0xoc7DJqb5uUeyEMVSJwLBP98DL3JiF9sGoEOlCm2oVyif+I0DvyyQ1G8YBhuTrHLDdfmAkhCdHFCWPWEzOlDd7H8zL8KfIYPyrD1iH3oYqLcbICqu7R3kxOh3GPqIA724uXxtwJRY0QvdEzMdh0Ile7Vxw28RT7rB6ltYNQ4J6x2JrF5Sh9G3HriEDhYi7ZTkpnoyen00qm0ajEW85aD6Lr/OV7oFB1avAFKF1Wnd6VhisNAmGT9H3M26uH7ymaNq6CPs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(83380400001)(26005)(122000001)(53546011)(110136005)(9686003)(66446008)(2906002)(19627405001)(38100700002)(316002)(6506007)(64756008)(33656002)(7696005)(186003)(55016003)(66476007)(166002)(38070700005)(76116006)(91956017)(66946007)(66556008)(86362001)(5660300002)(66574015)(71200400001)(508600001)(52536014)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?qwNUWCpx6bxR2Pjlz0hmrxaM3/Gzstdvc+9iNJfgOc0hLAWa+VH/xx0Yqw?=
 =?iso-8859-1?Q?wXJ6mOU6REm6s+cw8YPmksKiXYGcRqFQlFWGza6wPlxi5nrzdZjVG3nrfy?=
 =?iso-8859-1?Q?fuQZ7N+v4BhCJGLJMrFUK963FQNtLcYd6UETxVLpA6PGxwj4q5GrjnmS9C?=
 =?iso-8859-1?Q?dwg8GLyew9BdDSWaGwzPuA3z7LxOcdGBjaj0bd3lBL4fQVE5oHzkClBFU0?=
 =?iso-8859-1?Q?uXXywmdXFwdUq1vWWkW1ZzvshvX1c8OBdmApc3g0cfk315kREw5jbtTA3h?=
 =?iso-8859-1?Q?0W+q1vkyVC3FntBqPfCPA8klQjaMd2xdFUZQt7znozY7cMY/8ns2Uns8OL?=
 =?iso-8859-1?Q?TH2Ker2CRLj+XIdQWCLAstNN80dEIwTRzXQHqbwawcNsfd+9RrpWS2ANtO?=
 =?iso-8859-1?Q?SL8ecUkbrZUujqVoBOb7WqSCZe2xueEh5nOhFfmlpg/if6eGwA5RsYtkqT?=
 =?iso-8859-1?Q?AnTULJPPV5ra7hoYDbLfBJ2fzUGueQzvHC1umsiiW4BzJp/mUgK1fgyA6C?=
 =?iso-8859-1?Q?ddsg+58gfGSZiB+8FeuSGm0l1xqAiX6eAp3Q3f9wUYVkT3YoIi0hrSCc3y?=
 =?iso-8859-1?Q?VAuUJMzj33e+9XYtsNmkBBtSAXwf4gav6wSCdBieFUCC5hL55JDZHm7gWP?=
 =?iso-8859-1?Q?aPZe+hvLpceXuRDKZNhvKcOWZSRCzXYYDhLnfn8g4mRmjtiHDB4bVu1tfl?=
 =?iso-8859-1?Q?SLUwoUhGfkmJ3kJnO37amhEAkI3NvJ142pjBLHcH3KlvgBcIpbaDMG6khK?=
 =?iso-8859-1?Q?SMY37h2fCQPbuW1H4x3HXYIYotxb8W1SBH+mP9tUwlGroEXyQCmPDjn3Aq?=
 =?iso-8859-1?Q?bdCR1pAdMY4E9DhrE0bX1nkGqE9ULjkqw6traMOiNiOIQk0dhbFjH+1Rzi?=
 =?iso-8859-1?Q?lVLnFF3G1rLauMBq+67JY4/AsJYAC6v4mP3l9VniGFtRbZ57ytjqgHbpjf?=
 =?iso-8859-1?Q?rTb3lRM5sPsOBzEgG/4vJwg09oGpMSZ8LAUHp99+WqPOV/z/i0wCFseVZT?=
 =?iso-8859-1?Q?LEDgB6Xxo5IDZqQ6QoJaa9UBZ0QhftIsn9MyAh+nd+BM4xy2silePqW31A?=
 =?iso-8859-1?Q?Qp40uK0Mn1yvgwobhGtdHKW/HwDJfhw4XFr9a/mkAsSpFobulRv4OWUGMM?=
 =?iso-8859-1?Q?Fgb+zKZ9jvmHuOBaRNzdf7gIMC79PJ3FDoK4cpAEXOUFRODrDqQVm/db3r?=
 =?iso-8859-1?Q?1y82921g8d1hsTZh31DAk3AJCu8TRyrX6DPZ0kN61r1Cyofr5HKxvR5EAC?=
 =?iso-8859-1?Q?di1w6oZ1dzB/zAxiMQrefAvtGk+ieh/oCDTDzCqd6mq0QF99yubg252Ses?=
 =?iso-8859-1?Q?T5V/i4oE4E8KUZ6iaxD+qPHmAqPihKxgUigNmdChylXD2Hkbat0rDXWF75?=
 =?iso-8859-1?Q?J4XZSRkAoF2khaSv3T5hawi2ykisZsKimVVZHqaGqesu7zcRF70wz1mIZe?=
 =?iso-8859-1?Q?hBKoStDQoNCmIZxrOOStOrvIV4OjJqAWJnsMGejGBceNYBZshjJgu9O3RI?=
 =?iso-8859-1?Q?pKzI1ec2sQ0Wpu+7h0LKLRnCDsekMplUDILvwDEeCWYbvs6jDWeU4LrTU9?=
 =?iso-8859-1?Q?6tqQeUDbhZCmFUxd94I6CfIHNOWlYkuk5k+riuAoE3FpytZWhQEes1N2U2?=
 =?iso-8859-1?Q?19UscNcowYMYPgJ8M8kGnTA1P2EQexJJtk3/YrwrZ0aT6OYo+Z7MsNAIM3?=
 =?iso-8859-1?Q?9y9wpAK4B3PnkYcQEXA/ehLhta208seuo/rzbWpyJyqXzgAq1uluM/S8j3?=
 =?iso-8859-1?Q?Aq/6FsFKdD/WCLPypLmIj9GlgYGhl45Vtmjgo30jtCWnfq?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB54735D4B8E05AB1C17D356AE82F59CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f65de00a-9823-4471-486a-08da22cade6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 12:39:52.9721 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGwyvxmcqQftXtNPOffPjxOOl7t2a3dsnNyc3AmNZ39utdfoBMiyqlj0n0m0G4N9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB2421
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

--_000_CO6PR12MB54735D4B8E05AB1C17D356AE82F59CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Hi Chirs,

yes, right, the amdgpu drive rwill use amdgpu_bo_validate_size() function t=
o verify bo size,
but when driver try to allocate VRAM domain bo fail, the amdgpu driver will=
 fall back to allocate domain =3D (GTT | VRAM)  bo.
please check following code, it will cause the 2nd time to allocate bo fail=
 during allocate 256Mb buffer to store dma address (via kvmalloc()).

        initial_domain =3D (u32)(0xffffffff & args->in.domains);
retry:
        r =3D amdgpu_gem_object_create(adev, size, args->in.alignment,
                                     initial_domain,
                                     flags, ttm_bo_type_device, resv, &gobj=
);
        if (r && r !=3D -ERESTARTSYS) {
                if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
                        flags &=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
                        goto retry;
                }

                if (initial_domain =3D=3D AMDGPU_GEM_DOMAIN_VRAM) {
                        initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;
                        goto retry;
                }
                DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %=
d)\n",
                                size, initial_domain, args->in.alignment, r=
);
        }

Best Regards,
Kevin

________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Wednesday, April 20, 2022 7:55 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; Koenig, Christian <Christia=
n.Koenig@amd.com>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedes=
ktop.org>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Hi Kevin,

no, the test case should already fail in amdgpu_bo_validate_size().

If we have a system with 2TiB of memory where the test case could succeed t=
hen we should increase the requested size to something larger.

And if the underlying core Linux kernel functions don't allow allocations a=
s large as the requested one we should *NEVER* ever add workarounds like th=
is.

It is perfectly expected that this test case is not able to fulfill the des=
ired allocation. That it fails during kvmalloc is unfortunate, but not a sh=
ow stopper.

Regards,
Christian.


Am 20.04.22 um 13:32 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]

Hi Chris,

you misunderstood background about this case.

although we expect this test case to fail, it should fail at the location w=
here the Bo actual memory is actually allocated. now the code logic will ca=
use the failure to allocate memory to store DMA address.

e.g: the case is failed in 2TB system ram machine, it should be allocated s=
uccessful, but it is failed.

allocate 1TB BO, the ttm should allocate 1TB/4k * 8 buffer to store allocat=
e result (page address), this should not be failed usually.

There is a similar fix in upstream kernel 5.18, before this fix entered the=
 TTM code, this problem existed in TTM.

kernel/git/torvalds/linux.git - Linux kernel source tree<https://nam11.safe=
links.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2Fpub%2Fsc=
m%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv5.18-rc3=
%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&data=3D05%7C01%7CKevinYang=
.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&sda=
ta=3DCiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&reserved=3D0>
mm: allow !GFP_KERNEL allocations for kvmalloc

Best Regards,
Kevin

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 6:53 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):

[AMD Official Use Only]


________________________________
From: Koenig, Christian <Christian.Koenig@amd.com><mailto:Christian.Koenig@=
amd.com>
Sent: Wednesday, April 20, 2022 5:00 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@amd.co=
m>; dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>=
 <dri-devel@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>;=
 amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <amd-g=
fx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmallo=
c limit

Am 20.04.22 um 10:56 schrieb Yang Wang:
> if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc()

Hui what? Why should kvmalloc() not be able to fallback to vmalloc()
when __GFP_ZERO is set?

And even that is really the case then that sounds like a bug in kvmalloc().

Regards,
Christian.

[kevin]:
it is really test case from libdrm amdgpu test, which try to allocate a big=
 BO which will cause ttm tt init fail.


LOL! Guys, this test case is intended to fail!

The test consists of allocating a buffer so ridiculous large that it should=
 never succeed and be rejected by the kernel driver.

This patch here is a really clear NAK.

Regards,
Christian.

it may be a kvmalloc() bug, and this patch can as a workaround in ttm befor=
e this issue fix.

void *kvmalloc_node(size_t size, gfp_t flags, int node)
{
...
        if ((flags & GFP_KERNEL) !=3D GFP_KERNEL)
                return kmalloc_node(size, flags, node);
...
}

Best Regards,
Kevin

> to allocate memory, when request size is exceeds kmalloc limit, it will
> cause allocate memory fail.
>
> e.g: when ttm want to create a BO with 1TB size, it maybe fail.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com><mailto:KevinYang.Wang@a=
md.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---
>   1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..9f2f3e576b8d 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool z=
ero_alloc)
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
>        ttm->pages =3D kvmalloc_array(ttm->num_pages, sizeof(void*),
> -                     GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
> +
> +     memset(ttm->pages, 0, ttm->num_pages * sizeof(void *));
> +
>        return 0;
>   }
>
> @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struct t=
tm_tt *ttm)
>        ttm->pages =3D kvmalloc_array(ttm->num_pages,
>                                    sizeof(*ttm->pages) +
>                                    sizeof(*ttm->dma_address),
> -                                 GFP_KERNEL | __GFP_ZERO);
> +                                 GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
>
> +     memset(ttm->pages, 0, ttm->num_pages * (sizeof(*ttm->pages) + sizeo=
f(*ttm->dma_address)));
> +
>        ttm->dma_address =3D (void *)(ttm->pages + ttm->num_pages);
>        return 0;
>   }
> @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct ttm=
_tt *ttm)
>   {
>        ttm->dma_address =3D kvmalloc_array(ttm->num_pages,
>                                          sizeof(*ttm->dma_address),
> -                                       GFP_KERNEL | __GFP_ZERO);
> +                                       GFP_KERNEL);
>        if (!ttm->dma_address)
>                return -ENOMEM;
> +
> +     memset(ttm->dma_address, 0, ttm->num_pages * sizeof(*ttm->dma_addre=
ss));
> +
>        return 0;
>   }
>




--_000_CO6PR12MB54735D4B8E05AB1C17D356AE82F59CO6PR12MB5473namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Hi Chirs=
,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">yes, rig=
ht, the amdgpu drive rwill use&nbsp;</span><span style=3D"font-family: Cali=
bri, Arial, Helvetica, sans-serif; font-size: 12pt; background-color: rgba(=
0, 0, 0, 0); color: rgb(0, 0, 0); display: inline !important;">amdgpu_bo_va=
lidate_size()
 function to verify bo size,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; background-color: rgba(0, 0, 0, 0); display: inline !important; co=
lor: rgb(0, 0, 0);">but when driver try to allocate VRAM domain bo fail, th=
e amdgpu driver will fall back to
 allocate domain =3D (GTT | VRAM)&nbsp; bo.</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; color: rg=
b(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-size: 12pt; font-family: Calibri, Arial, Helvetica, san=
s-serif; background-color: rgba(0, 0, 0, 0); display: inline !important; co=
lor: rgb(0, 0, 0);">please check following code, it will cause the 2</span>=
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; backgrou=
nd-color: rgba(0, 0, 0, 0); color: rgb(0, 0, 0); display: inline !important=
;"><span style=3D"font-size: 13.3333px;">nd
 time</span><span style=3D"font-size: 12pt;">&nbsp;to allocate bo fail duri=
ng allocate 256Mb buffer to store dma address (via kvmalloc()).</span></spa=
n></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West E=
uropean)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Ro=
boto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14px;background-colo=
r:rgb(255, 255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; background-color: rgba(0, 0, 0, 0); display: inline !important; co=
lor: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; initial_domain =3D (u32)(0x=
ffffffff &amp; args-&gt;in.domains);</span><span style=3D"font-family:&quot=
;Segoe UI&quot;, &quot;Segoe UI Web (West European)&quot;, &quot;Segoe UI&q=
uot;, -apple-system, BlinkMacSystemFont, Roboto, &quot;Helvetica Neue&quot;=
, sans-serif;font-size:14px;background-color:rgb(255, 255, 255);display:inl=
ine !important">
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">ret=
ry:</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; r =3D amdgpu_gem_object_create(adev, size, args-&g=
t;in.alignment,</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;initial_domain,</span=
></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;flags, ttm_bo_type_de=
vice, resv, &amp;gobj);</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; if (r &amp;&amp; r !=3D -ERESTARTSYS) {</span></di=
v>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (flags &amp; AMDGPU=
_GEM_CREATE_CPU_ACCESS_REQUIRED) {</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; flags &amp;=3D ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto retry;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
<div><br>
</div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (initial_domain =3D=
=3D AMDGPU_GEM_DOMAIN_VRAM) {</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; initial_domain |=3D AMDGPU_GEM_DOMAIN_GTT;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; goto retry;</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DRM_DEBUG(&quot;Failed=
 to allocate GEM object (%llu, %d, %llu, %d)\n&quot;,</span></div>
<div><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; fon=
t-size: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">&nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; size, initial_domain, args-&gt;in.alignme=
nt, r);</span></div>
</span><span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; f=
ont-size: 12pt; background-color: rgba(0, 0, 0, 0); display: inline !import=
ant; color: rgb(0, 0, 0);">&nbsp; &nbsp; &nbsp; &nbsp; }</span><span style=
=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web (West European)&qu=
ot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemFont, Roboto, &quot=
;Helvetica Neue&quot;, sans-serif;font-size:14px;background-color:rgb(255, =
255, 255);display:inline !important"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Best Reg=
ards,</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0); background-color: rgba(0, 0, 0, 0);">Kevin</s=
pan></div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Wednesday, April 20, 2022 7:55 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; Koenig, Christ=
ian &lt;Christian.Koenig@amd.com&gt;; dri-devel@lists.freedesktop.org &lt;d=
ri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-g=
fx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"elementToProof">Hi Kevin,<br>
<br>
no, the test case should already fail in amdgpu_bo_validate_size().<br>
<br>
If we have a system with 2TiB of memory where the test case could succeed t=
hen we should increase the requested size to something larger.<br>
<br>
And if the underlying core Linux kernel functions don't allow allocations a=
s large as the requested one we should *NEVER* ever add workarounds like th=
is.<br>
<br>
It is perfectly expected that this test case is not able to fulfill the des=
ired allocation. That it fails during kvmalloc is unfortunate, but not a sh=
ow stopper.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<br>
<div class=3D"x_moz-cite-prefix">Am 20.04.22 um 13:32 schrieb Wang, Yang(Ke=
vin):<br>
</div>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;font-family:=
Arial; font-size:10pt; color:#0000FF; margin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Hi Chris,</span></div=
>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">you misunderstood bac=
kground about this case.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">a</span><span style=
=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-serif; font-=
size:12pt; background-color:rgba(0,0,0,0)">lthough
 we expect this test case to fail, it should fail at the location where the=
 Bo actual memory is actually allocated. now the code logic will cause the =
failure to allocate memory to store DMA address.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)"><span style=3D"backgr=
ound-color:rgb(255,255,255); display:inline!important">e.g:&nbsp;</span>the=
 case is failed in 2TB system ram machine,
 it should be allocated successful, but it is failed.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,sans-s=
erif; font-size:12pt; background-color:rgba(0,0,0,0)">allocate 1TB BO, the =
ttm should allocate 1TB/4k * 8 buffer to store allocate result (page addres=
s), this should not be failed usually.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif">There is a similar fi=
x in upstream kernel 5.18, b</span><span style=3D"color:rgb(0,0,0); font-si=
ze:12pt; background-color:rgba(0,0,0,0); font-family:Calibri,Arial,Helvetic=
a,sans-serif">efore
 this fix entered the TTM code, this problem existed in TTM.</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"color:rgb(0,0,0); font-size:12pt; background-color:rgba(0,0,=
0,0); font-family:Calibri,Arial,Helvetica,sans-serif"><a href=3D"https://na=
m11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.kernel.org%2F=
pub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fh%3Dv=
5.18-rc3%26id%3Da421ef303008b0ceee2cfc625c3246fa7654b0ca&amp;data=3D05%7C01=
%7CKevinYang.Wang%40amd.com%7C2e9fd86a27d64a39432508da22c4b1f1%7C3dd8961fe4=
884e608e11a82d994e183d%7C0%7C0%7C637860525454702938%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%=
7C%7C%7C&amp;sdata=3DCiP9x3grwQ2aXFZPjpsAtwLCpBVeJufbGngy%2BtXLFbM%3D&amp;r=
eserved=3D0" data-auth=3D"Verified" originalsrc=3D"https://git.kernel.org/p=
ub/scm/linux/kernel/git/torvalds/linux.git/commit/?h=3Dv5.18-rc3&amp;id=3Da=
421ef303008b0ceee2cfc625c3246fa7654b0ca" shash=3D"KMFRekIa5um9dneRj4pqsGBn2=
wIcYBwLUel6we5AalD06U/g9WcKPxBwS4F9Mgfpnqpq0GbN+8AA16pzy6v+Ay23e5shnO53IP8e=
7UcwQUE0fw1Wd4T+gBBF8PJiMugXDZiWlVYrV3tySgoFbmz+CuFzrYJbobUVj6E5khawPfo=3D"=
 id=3D"LPlnk660272">kernel/git/torvalds/linux.git
 - Linux kernel source tree</a><br>
</span></div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span class=3D"x_commit-subject" style=3D"font-size:12pt; margin:1.5em 0em =
0.5em; padding:0em; color:rgb(0,0,0); font-family:Calibri,Arial,Helvetica,s=
ans-serif; background-color:rgb(255,255,255)">mm: allow !GFP_KERNEL allocat=
ions for kvmalloc</span><br>
</div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<div><br>
</div>
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Best Regards,</span><=
/div>
<div class=3D"x_elementToProof" style=3D"font-family:Calibri,Arial,Helvetic=
a,sans-serif; font-size:12pt; color:rgb(0,0,0)">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12=
pt; color:rgb(0,0,0); background-color:rgba(0,0,0,0)">Kevin</span><br>
<div><br>
</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 6:53 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbreviated=
">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-abbr=
eviated">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div>Am 20.04.22 um 11:07 schrieb Wang, Yang(Kevin):<br>
<blockquote type=3D"cite">
<p align=3D"Left" style=3D"margin-top: 0px; margin-bottom: 0px;margin-top:0=
px; margin-bottom:0px; font-family:Arial; font-size:10pt; color:#0000FF; ma=
rgin:5pt">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif=
" color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com" data-auth=3D"NotApplicable" cla=
ss=3D"x_x_moz-txt-link-rfc2396E">
&lt;Christian.Koenig@amd.com&gt;</a><br>
<b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
<b>To:</b> Wang, Yang(Kevin) <a href=3D"mailto:KevinYang.Wang@amd.com" data=
-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a>; <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-abbreviat=
ed x_moz-txt-link-freetext">
dri-devel@lists.freedesktop.org</a> <a href=3D"mailto:dri-devel@lists.freed=
esktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E"=
>
&lt;dri-devel@lists.freedesktop.org&gt;</a>; <a href=3D"mailto:amd-gfx@list=
s.freedesktop.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-ab=
breviated x_moz-txt-link-freetext">
amd-gfx@lists.freedesktop.org</a> <a href=3D"mailto:amd-gfx@lists.freedeskt=
op.org" data-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;amd-gfx@lists.freedesktop.org&gt;</a><br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText x_x_elementToProof">Am 20.04.22 um 10:56 schrie=
b Yang Wang:<br>
&gt; if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc=
()<br>
<br>
Hui what? Why should kvmalloc() not be able to fallback to vmalloc() <br>
when __GFP_ZERO is set?<br>
<br>
And even that is really the case then that sounds like a bug in kvmalloc().=
</div>
<div class=3D"x_x_PlainText x_x_elementToProof"><br>
Regards,<br>
Christian.</div>
<div class=3D"x_x_PlainText x_x_elementToProof"><br>
<div class=3D"x_x_PlainText" style=3D"margin:0px; background-color:rgb(255,=
255,255)">
[kevin]:</div>
</div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">it is really tes=
t case from libdrm amdgpu test, which try to allocate a big BO which will c=
ause ttm tt init fail.</span><br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
<br>
LOL! Guys, this test case is intended to fail!<br>
<b><br>
</b>The test consists of allocating a buffer so ridiculous large that it sh=
ould never succeed and be rejected by the kernel driver.<br>
<br>
This patch here is a really clear NAK.<br>
<br>
Regards,<br>
Christian.<br>
<br>
<blockquote type=3D"cite">
<div>
<div class=3D"x_x_BodyFragment"><font size=3D"2"><span style=3D"font-size:1=
1pt">
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">it may be a kvma=
lloc() bug, and this patch can as a workaround in<span style=3D"background-=
color:rgb(255,255,255); display:inline!important">&nbsp;ttm</span>&nbsp;bef=
ore
 this issue fix.</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)"><br>
</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">void *kvmalloc_n=
ode(size_t size, gfp_t flags, int node)&nbsp;<br>
</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">{</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">...</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nbsp; &n=
bsp; &nbsp; if ((flags &amp; GFP_KERNEL) !=3D GFP_KERNEL)<br>
</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">&nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, flags, no=
de);<br>
</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">...</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><span class=3D"x_x_PlainTex=
t" style=3D"margin:0px; background-color:rgb(255,255,255)">}</span></div>
<div class=3D"x_x_PlainText x_x_elementToProof"><br>
</div>
<div class=3D"x_x_PlainText x_x_elementToProof">Best Regards,</div>
<div class=3D"x_x_PlainText x_x_elementToProof">Kevin<br>
<br>
&gt; to allocate memory, when request size is exceeds kmalloc limit, it wil=
l<br>
&gt; cause allocate memory fail.<br>
&gt;<br>
&gt; e.g: when ttm want to create a BO with 1TB size, it maybe fail.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang <a href=3D"mailto:KevinYang.Wang@amd.com" dat=
a-auth=3D"NotApplicable" class=3D"x_x_moz-txt-link-rfc2396E">
&lt;KevinYang.Wang@amd.com&gt;</a><br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 14 +++++++++++---<br>
&gt;&nbsp;&nbsp; 1 file changed, 11 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt=
.c<br>
&gt; index 79c870a3bef8..9f2f3e576b8d 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; @@ -97,9 +97,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, boo=
l zero_alloc)<br>
&gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)=
<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages, sizeof(void*),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 sizeof(void *));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -108,10 +111,12 @@ static int ttm_dma_tt_alloc_page_directory(struc=
t ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_a=
rray(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;pages) +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*tt=
m-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&nbsp;&nbsp; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;pages, 0, ttm-&gt;num_pages *=
 (sizeof(*ttm-&gt;pages) + sizeof(*ttm-&gt;dma_address)));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D (voi=
d *)(ttm-&gt;pages + ttm-&gt;num_pages);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt; @@ -120,9 +125,12 @@ static int ttm_sg_tt_alloc_page_directory(struct =
ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D kvma=
lloc_array(ttm-&gt;num_pages,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL | __GFP_ZERO);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; memset(ttm-&gt;dma_address, 0, ttm-&gt;num_p=
ages * sizeof(*ttm-&gt;dma_address));<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
<br>
</div>
</span></font></div>
</div>
</blockquote>
<br>
</div>
</div>
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_CO6PR12MB54735D4B8E05AB1C17D356AE82F59CO6PR12MB5473namp_--
