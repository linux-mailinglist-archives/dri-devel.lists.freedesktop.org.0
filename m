Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E6A3AE0D11
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 20:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE3510E0EA;
	Thu, 19 Jun 2025 18:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hjoE1gE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9D3A10E07C
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 18:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGwdWnPR4IfYhRIzchahJ4RIfGO/DCnuvDg/zPOUm5OwnvTDcry0wbV0VZ+uDXPt7/Qbh1/Hhv88y5eupGc80jjEjgx8ICT2SaFSzTKFzmRoih6JFhtLDU4LYiFaFBrYh1h7xpm7DLsQSbBvsvMBBlvZFULxCjHF4ua1DotgGrq2Lpzu+lOgyLPASy3Gs/oyVr96eQfwk14jwHtOo2MHq0yN1NB01JNY6hDTE03prdMSbEtq/C7ekCeKPQu2LDI9gzAmHP4E5+YqPMfZgldbBwAHG1ZKGFjYhht7N5rlsx0pMVnEUgESZptGWJT2s0rBLNciz/G/IAU9Y1xduAB7hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1dSYbO5g6G5e6g6ydv7TvfPbEW8GARZ7Vzki/v56PQ8=;
 b=XnJLIldYIACQLikolPSLwfXojnz9fnlxOeDhh5pkypTlrOkjdDkQjaE1RAXFp9jTRm9MeJ/dn9z3t6KXOJ38+hJkMU4SRryKCCrN9PBY8UgQZlH/APNpW/6drpOgabbK0QWHoCVlID5nhfX8JMrM5yc7s4+K9qOi7fUift99HK5WD+NKkwifhfhi8gHZNIVm+i36IuhfwM1ezRuML7ie75iIbBF6+yST1UofvHcrfoqvExHPqbm6G0m7UACAuRw91G0LLxhUT5cVimR8l/P8JY1LMx6S2pC69M83s87Oj5DCQZ/Vj+CrHTRVQKKutPdKeY25Py1tSZdaK6UG6fyPOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1dSYbO5g6G5e6g6ydv7TvfPbEW8GARZ7Vzki/v56PQ8=;
 b=hjoE1gE6PIL+FW9GDspP4qL8q5dqXiaO56XEXvOVqKR68BWjfz9mMBqAUZxIhwtJuG8gy7bq5g1dtAr/cfQ15Xlm7FoqzKt/rDmNRCP0zg/ZPYzI1NcvZq0dZ3g8ieBYpWF+FRZlOeVBveFEDxKhAI1UQLQheeBvx8qullXdYOE=
Received: from SA1PR12MB8144.namprd12.prod.outlook.com (2603:10b6:806:337::15)
 by DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Thu, 19 Jun 2025 18:37:34 +0000
Received: from SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523]) by SA1PR12MB8144.namprd12.prod.outlook.com
 ([fe80::fb96:ddab:e63d:a523%2]) with mapi id 15.20.8857.016; Thu, 19 Jun 2025
 18:37:29 +0000
From: "Francis, David" <David.Francis@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>, "Yat Sin, David"
 <David.YatSin@amd.com>, "Freehill, Chris" <Chris.Freehill@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "dcostantino@meta.com"
 <dcostantino@meta.com>, "sruffell@meta.com" <sruffell@meta.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
Thread-Topic: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info
Thread-Index: AQHb38B0efaFapWClUq9Uo4x50QQ8LQJadOAgAFpEpA=
Date: Thu, 19 Jun 2025 18:37:29 +0000
Message-ID: <SA1PR12MB8144AF805DEC7C6378D55467EF7DA@SA1PR12MB8144.namprd12.prod.outlook.com>
References: <20250617194536.538681-1-David.Francis@amd.com>
 <20250617194536.538681-3-David.Francis@amd.com>
 <787e56b9-baa5-41fd-ba37-e0c7af1f3dee@amd.com>
In-Reply-To: <787e56b9-baa5-41fd-ba37-e0c7af1f3dee@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-06-19T18:37:28.4650000Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=3;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB8144:EE_|DS0PR12MB6390:EE_
x-ms-office365-filtering-correlation-id: 62cb2b00-cf87-4d96-eefd-08ddaf605863
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?BOl8BBILLvKcn2dfq3JVr+CI+weCzPrtKgH467dO7WaKaEwCtzcIEG/qx/Yj?=
 =?us-ascii?Q?u85fS/XqliUQ6F73+B/nQFB31ZIKqdHnGU+jJndQ/oMcb0mGMad9DIAtkmkP?=
 =?us-ascii?Q?rpsf13OKO5qO8Qm5pldDTxz7o0QBfyxTT8B9gfx75mccgmKhOCir3c8xO3YB?=
 =?us-ascii?Q?Q986+lDKe9bKvQPKvqYSSsD5IV0cQuWoH7ymGrKnQENOr668O8RAQdx2oUUt?=
 =?us-ascii?Q?995RVhg8HZrHqhnhfrkEJG3IfRMXeS2Mm7qxSR7r8RBokWyxx/+s8sUDWBFt?=
 =?us-ascii?Q?x1Bq+J8DPgoUfonXk192EbSE6deV95j+vWFEzjCxyfmuY7N0QyDGVXYU6EU8?=
 =?us-ascii?Q?cgBnfp025oB707l8ien7MubXbsTvhchaJ2J+b0LSCpBq968twi2x+F8KlPK/?=
 =?us-ascii?Q?zHcROATCoVvRqsa0idnbxPtKnZLYgE6sIpQDB4/KfEiZErA1M4UgABW2KNvj?=
 =?us-ascii?Q?fgA8PxXVmHZ6pMsgSOInJNIrzYHmbpi7YKJGdbJ1rc4t6cnnx6MXB5Vq6Lzr?=
 =?us-ascii?Q?t6dNWeDy9l5q4z8ozPyuKaI6zpwMRdFj8rEWAM/B/YDH53y046idsOwG2LK7?=
 =?us-ascii?Q?05wSAlkjV350dX+1fExrrPaOpjAiHvEDgVzBE8tC19+l6LUUeN9eWKpZ8Qo5?=
 =?us-ascii?Q?vS6ljzgHCYMs+np2uD97Q3/pJF0Aoc4kl36S4cwLx7f+sSP1vfe9e8bWtgD4?=
 =?us-ascii?Q?ugaux62HAloEwljH91hxLbhz6IDMJ+f4H3v3VyPx7HFXElEbz8LVUaOz9mhC?=
 =?us-ascii?Q?4FaUEMa+tqaFnehViHxjPBWer1sgEGbGUw0VR3EQ1W9CAmHgINoCFTviF+O4?=
 =?us-ascii?Q?ViUr0EQE1TUCtVgoJPKli9L0qZu+otjrN4sSJkc1EOPW1Qpvj3qtrLhml76Y?=
 =?us-ascii?Q?JtTfuYbQ/XotomZmyHPh9ear0g4mNsmbmBsQ3tTvvOdxP5yZ3pORuigT22xu?=
 =?us-ascii?Q?zl8u7X1bLNlULTFd2NlxsYug/9xCILNCbAWtuZrx39Q6MfdGp1yGiiPwz1N4?=
 =?us-ascii?Q?xtH9mbjdn1JblCu1F8N6NnMrhAx8eq3WzQL6odZbJ0+Wwb9KnSbSpCa/oZjy?=
 =?us-ascii?Q?GDlsvIkD0uc3X9cIZ7AT60OGIrvAs2FRmZBelHEM5TYOol5gwz8Vlb21a0q6?=
 =?us-ascii?Q?Ccve6eLCFHYzVkH3ibswjxt565OuhJxXXAmcv15+fp8FNilbVZIaKCgwV4rV?=
 =?us-ascii?Q?WiK2hkOQvEpN6M4cBCJcvtU8yH+w6zd/7oIj8A/F54G9apo6OMcUN9DFoKo+?=
 =?us-ascii?Q?r25enHzOkQ7hUBpgmYTDUNAR7pqCOIJzsvUPe1rZO6pfx3bkxMUpvnoN+nMn?=
 =?us-ascii?Q?T7fB1xPVfO8i1hOP42/CYqvrZjz/yqbb4TAz68iuL2ndCXvFC7Durv7qNJY5?=
 =?us-ascii?Q?4M7yCm00NKllk5oKQJpLseF/5EkFFVgC+L56Bxxx6xRdHGmUBBHx7q7iCqG/?=
 =?us-ascii?Q?3vnniPPO701cEY2NQy1e8yskOAw43HAWy9F0I/YjtBe9D1zt5a4M5Q=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB8144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j5ZNa1J+yY9TaMM9OGFEQ47R+1kbejQgwG8xND9Pg6RawzbmJeRZjQEUdS2t?=
 =?us-ascii?Q?hvToIPcvQoWZnM1qSjfn0naiyu0qrDwqcE2PdIRQYaNNjcDWB3uQHdGoNEHj?=
 =?us-ascii?Q?ivNihMHtdU7HYyp1J8+eTgfJdkxao560cAx97VJ/tiXMWATFE9EoM0pAk9zW?=
 =?us-ascii?Q?oO3RJWiH27wLTopVcApEQAwgniL4vJ4IE1wksBmAW/fiwnsVv5wJPHcIJv5n?=
 =?us-ascii?Q?vkMhCEMrnH1yVWd+yHmpYXL5PbVL9zhSo1t0oJZbZIhRTXGu1hrhah48uIkP?=
 =?us-ascii?Q?S+0c8wR1IbVATG+b/YEKlBGMSpdNdtb395HGKuKR6YqzV3RK6qjo4GsJGtRr?=
 =?us-ascii?Q?0R6Ur04SpQb6uOoNtQcKyvVjnLyzQ1Fix2egbaX/kkfce1hAikF+eb0nBbgL?=
 =?us-ascii?Q?z5BlD4JeJXyRHcWt8FVzdaeD2UsVoe8CmaKeo1d5M60Xe8/RbjM+wHy23T8z?=
 =?us-ascii?Q?EJTAkITk3hQtavyTUwi36IL7MS4Vn+w1wfEN732czS/ZYmuZTnRP6NY9Tzga?=
 =?us-ascii?Q?dMhqZEXZ8zLY/WQ8HAhNd2zgdChVSlgSH4N5K2J6lAOtGd9oAH2PLyTasZMV?=
 =?us-ascii?Q?Q/xohTYjkE6YYmiW8+h6iW40A0tyknnI0B5BuGlsDAvtRo6ng63Ss/fe+9Wt?=
 =?us-ascii?Q?o6CuqzvkJcb+53eKRiG3MzdavkxpM9tq8FA4amOkwEu2trMIsJ7siCY1zLhX?=
 =?us-ascii?Q?Fjw94YVbsfeZZbhIzJ2JrKK0rVcp68xcNXrJ8KqlTKlJqh8G0BLy49dPp20P?=
 =?us-ascii?Q?OaJCfg4oShXh+SF786fdR/ajhlilNDEVAuz8Tv0KDl1JOe5EMSw/l+Jy2df7?=
 =?us-ascii?Q?y85ug1TFUSauSdE5o3sHnZ/Vj3u8rbCJjjStDr692K/aJJ8jiYIJFPGPau7X?=
 =?us-ascii?Q?2dNUJOFQJbdbOR8YdEm+JSDpbjeWl/2wXDiu3bM5Z3+0DM811VUNECNq/MDK?=
 =?us-ascii?Q?W4OrYdyBOglK0i/1bSNPNo+Z/XeYPA8WZfqK1P/U9YmbM2eBBU5AN5mdPw+u?=
 =?us-ascii?Q?h9t/35I6eVqAMpPeksfe9NOu5R9PXGrajyNEnj2X+TB1gHlcBtwo0xt9DTWF?=
 =?us-ascii?Q?c0/tlLrpnOwSfSRHyKMzHpMyyOz8/ugDYLR+y+QKuSX5IVpx9BBA5C/BeE+W?=
 =?us-ascii?Q?pl3lw6oGhgEMUe7H5F6NnhgOk/l8kLMvpj6DRmPNa3++yoIJHBXFY5SPPA7P?=
 =?us-ascii?Q?qpaYWzXxe2G5fo9Q09Gvv2CbP7uU8CECdgtpSSJ78j1SotU2E95a0ZfvoC1i?=
 =?us-ascii?Q?V+zQk+Sp7s2Is13ETSRQwSTITNLYHhsgvCgGHOcjQ9Cet6t5YGZOxT9jMzs9?=
 =?us-ascii?Q?eKw5RxLV/QbWBDsTV+6YsoorLJpQ9hyD1uWZVvxxMGh+2GQO5ccLzb9QR434?=
 =?us-ascii?Q?jUaFbR+v1WL3MegLbtpz6RwnxjWWaJC1zWuqxGNUvUUEOQDuowd93h5cAvn9?=
 =?us-ascii?Q?HlRVQLwNheHABWdCiwIunQ3D9sVDi4VFRJPEJUhXo8HPiGftv7Qh+YACtqew?=
 =?us-ascii?Q?09TqtuVxpg9OLiFSilo5fcpNEWKDLi5e2MoF9GzCJolyyNSVaQZGmJacJqB0?=
 =?us-ascii?Q?YIgR9gZYiELuytcCDlY=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR12MB8144AF805DEC7C6378D55467EF7DASA1PR12MB8144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB8144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cb2b00-cf87-4d96-eefd-08ddaf605863
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2025 18:37:29.0715 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMqU9tY+d9sr5xeQ5736sIN2uhEzjcs4x4Cmvs6Nkw2b3LaTfF0CaGKwdGjzEZb6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6390
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

--_000_SA1PR12MB8144AF805DEC7C6378D55467EF7DASA1PR12MB8144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

> > +     spin_lock(&filp->table_lock);
> > +     idr_for_each_entry(&filp->object_idr, gobj, id)
> > +             num_bos +=3D 1;
> > +     spin_unlock(&filp->table_lock);
> > +
> > +     if (args->num_bos < num_bos) {
> > +             args->num_bos =3D num_bos;
> > +             goto exit;
>
> Since this path doesn't require any cleanup, you could just return. But m=
aybe this should return an error code to let user mode know that it should =
retry with a bigger bucket allocation. -ENOSPC?
>

I wasn't sure if sending back information from an ioctl in the structs whil=
e also returning an error value was acceptable. If it is, I'll make that ch=
ange.

> > +     idr_for_each_entry(&filp->object_idr, gobj, id) {
> > +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> > +             struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> > +
> > +             bo_bucket =3D &bo_buckets[bo_index];
> > +
> > +             bo_bucket->size =3D amdgpu_bo_size(bo);
> > +             bo_bucket->alloc_flags =3D bo->flags & (~AMDGPU_GEM_CREAT=
E_VRAM_WIPE_ON_RELEASE);
>
> I'm not sure why you're removing this flag. I think we always set it impl=
icitly when creating a new BO (and presumably during restore), but there sh=
ould be no harm in leaving this flag set anyway.
>

The driver doesn't like this flag being set on requests to create bo. Since=
 this is meant to be sending to the user the flags userspace will need to r=
ecreate the bo, I thought to leave it off.

>
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> >
> > +#include "amdgpu_criu.h"
> > +
>
> Why is this header file needed here? None of the new ioctls will be imple=
mented in kfd_chardev.c.

amdgpu_drv.c needs the header with the ioctl declarations for its ioctl def=
initions. Not sure if there's another way I should be including them.
________________________________
From: Kuehling, Felix <Felix.Kuehling@amd.com>
Sent: Wednesday, June 18, 2025 5:05 PM
To: Francis, David <David.Francis@amd.com>; dri-devel@lists.freedesktop.org=
 <dri-devel@lists.freedesktop.org>
Cc: tvrtko.ursulin@igalia.com <tvrtko.ursulin@igalia.com>; Yat Sin, David <=
David.YatSin@amd.com>; Freehill, Chris <Chris.Freehill@amd.com>; Koenig, Ch=
ristian <Christian.Koenig@amd.com>; dcostantino@meta.com <dcostantino@meta.=
com>; sruffell@meta.com <sruffell@meta.com>; simona@ffwll.ch <simona@ffwll.=
ch>; mripard@kernel.org <mripard@kernel.org>; tzimmermann@suse.de <tzimmerm=
ann@suse.de>
Subject: Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info


On 2025-06-17 15:45, David Francis wrote:
> Add new ioctl DRM_IOCTL_AMDGPU_CRIU_BO_INFO.
>
> This ioctl returns a list of bos with their handles, sizes,
> and flags and domains.
>
> This ioctl is meant to be used during CRIU checkpoint and
> provide information needed to reconstruct the bos
> in CRIU restore.
>
> Signed-off-by: David Francis <David.Francis@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/Makefile      |   2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 144 +++++++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |  32 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |   2 +
>  include/uapi/drm/amdgpu_drm.h            |  28 +++++
>  6 files changed, 209 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
>  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd/am=
dgpu/Makefile
> index 87080c06e5fc..0863edcdd03f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o amd=
gpu_kms.o \
>        amdgpu_xgmi.o amdgpu_csa.o amdgpu_ras.o amdgpu_vm_cpu.o \
>        amdgpu_vm_sdma.o amdgpu_discovery.o amdgpu_ras_eeprom.o amdgpu_nbi=
o.o \
>        amdgpu_umc.o smu_v11_0_i2c.o amdgpu_fru_eeprom.o amdgpu_rap.o \
> -     amdgpu_fw_attestation.o amdgpu_securedisplay.o \
> +     amdgpu_fw_attestation.o amdgpu_securedisplay.o amdgpu_criu.o \
>        amdgpu_eeprom.o amdgpu_mca.o amdgpu_psp_ta.o amdgpu_lsdma.o \
>        amdgpu_ring_mux.o amdgpu_xcp.o amdgpu_seq64.o amdgpu_aca.o amdgpu_=
dev_coredump.o \
>        amdgpu_cper.o amdgpu_userq_fence.o amdgpu_eviction_fence.o
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.c
> new file mode 100644
> index 000000000000..34a0358946b6
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c
> @@ -0,0 +1,144 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining =
a
> +* copy of this software and associated documentation files (the "Softwar=
e"),
> +* to deal in the Software without restriction, including without limitat=
ion
> +* the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be include=
d in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#include <linux/dma-buf.h>
> +#include <linux/hashtable.h>
> +#include <linux/mutex.h>
> +#include <linux/random.h>
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_device.h>
> +#include <drm/drm_file.h>
> +
> +#include "amdgpu_criu.h"
> +
> +#include <drm/amdgpu_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_exec.h>
> +#include <drm/drm_gem_ttm_helper.h>
> +#include <drm/ttm/ttm_tt.h>
> +#include <linux/interval_tree_generic.h>
> +
> +#include "amdgpu.h"
> +#include "amdgpu_display.h"
> +#include "amdgpu_dma_buf.h"
> +#include "amdgpu_hmm.h"
> +#include "amdgpu_xgmi.h"

That's a lot of header files. Do you really need them all?


> +
> +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *adev,=
 uint64_t pte_flags)

This function is never called.


> +{
> +     uint32_t gem_flags =3D 0;
> +
> +     //This function will be replaced by the mapping flags rework
> +
> +     if (pte_flags & AMDGPU_PTE_EXECUTABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_EXECUTABLE;
> +     if (pte_flags & AMDGPU_PTE_READABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_READABLE;
> +     if (pte_flags & AMDGPU_PTE_WRITEABLE)
> +             gem_flags |=3D AMDGPU_VM_PAGE_WRITEABLE;
> +     if (pte_flags & AMDGPU_PTE_PRT_FLAG(adev))
> +             gem_flags |=3D AMDGPU_VM_PAGE_PRT;
> +     if (pte_flags & AMDGPU_PTE_NOALLOC)
> +             gem_flags |=3D AMDGPU_VM_PAGE_NOALLOC;
> +
> +     return gem_flags;
> +}
> +
> +
> +/**
> + * amdgpu_criu_bo_info_ioctl - get information about a process' buffer o=
bjects
> + *
> + * @dev: drm device pointer
> + * @data: drm_amdgpu_criu_bo_info_args
> + * @filp: drm file pointer
> + *
> + * num_bos is set as an input to the size of the bo_buckets array.
> + * num_bos is sent back as output as the number of bos in the process.
> + * If that number is larger than the size of the array, the ioctl must
> + * be retried.
> + *
> + * Returns:
> + * 0 for success, -errno for errors.
> + */
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp)
> +{
> +     struct drm_amdgpu_criu_bo_info_args *args =3D data;
> +     struct drm_amdgpu_criu_bo_bucket *bo_buckets;
> +     struct drm_gem_object *gobj;
> +     int id, ret =3D 0;
> +     int bo_index =3D 0;
> +     int num_bos =3D 0;
> +
> +     spin_lock(&filp->table_lock);
> +     idr_for_each_entry(&filp->object_idr, gobj, id)
> +             num_bos +=3D 1;
> +     spin_unlock(&filp->table_lock);
> +
> +     if (args->num_bos < num_bos) {
> +             args->num_bos =3D num_bos;
> +             goto exit;

Since this path doesn't require any cleanup, you could just return. But may=
be this should return an error code to let user mode know that it should re=
try with a bigger bucket allocation. -ENOSPC?


> +     }
> +     args->num_bos =3D num_bos;
> +     if (num_bos =3D=3D 0) {
> +             goto exit;

Just return. 0 (success) seems fine here.


> +     }
> +
> +     bo_buckets =3D kvzalloc(num_bos * sizeof(*bo_buckets), GFP_KERNEL);
> +     if (!bo_buckets) {
> +             ret =3D -ENOMEM;
> +             goto free_buckets;

Just return -ENOMEM.


> +     }
> +
> +     spin_lock(&filp->table_lock);
> +     idr_for_each_entry(&filp->object_idr, gobj, id) {
> +             struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);
> +             struct drm_amdgpu_criu_bo_bucket *bo_bucket;
> +
> +             bo_bucket =3D &bo_buckets[bo_index];
> +
> +             bo_bucket->size =3D amdgpu_bo_size(bo);
> +             bo_bucket->alloc_flags =3D bo->flags & (~AMDGPU_GEM_CREATE_=
VRAM_WIPE_ON_RELEASE);

I'm not sure why you're removing this flag. I think we always set it implic=
itly when creating a new BO (and presumably during restore), but there shou=
ld be no harm in leaving this flag set anyway.


> +             bo_bucket->preferred_domains =3D bo->preferred_domains;
> +             bo_bucket->gem_handle =3D id;
> +
> +             if (bo->tbo.base.import_attach)
> +                     bo_bucket->flags |=3D AMDGPU_CRIU_BO_FLAG_IS_IMPORT=
;
> +
> +             bo_index +=3D 1;
> +     }
> +     spin_unlock(&filp->table_lock);
> +
> +     ret =3D copy_to_user((void __user *)args->bo_buckets, bo_buckets, n=
um_bos * sizeof(*bo_buckets));
> +     if (ret) {
> +             pr_debug("Failed to copy BO information to user\n");
> +             ret =3D -EFAULT;
> +     }
> +
> +free_buckets:
> +     kvfree(bo_buckets);
> +exit:
> +
> +     return ret;
> +}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/drm/a=
md/amdgpu/amdgpu_criu.h
> new file mode 100644
> index 000000000000..1b18ffee6587
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h
> @@ -0,0 +1,32 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> +* Copyright 2025 Advanced Micro Devices, Inc.
> +*
> +* Permission is hereby granted, free of charge, to any person obtaining =
a
> +* copy of this software and associated documentation files (the "Softwar=
e"),
> +* to deal in the Software without restriction, including without limitat=
ion
> +* the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +* and/or sell copies of the Software, and to permit persons to whom the
> +* Software is furnished to do so, subject to the following conditions:
> +*
> +* The above copyright notice and this permission notice shall be include=
d in
> +* all copies or substantial portions of the Software.
> +*
> +* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES =
OR
> +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> +* OTHER DEALINGS IN THE SOFTWARE.
> +*/
> +
> +#ifndef __AMDGPU_CRIU_H__
> +#define __AMDGPU_CRIU_H__
> +
> +#include <drm/amdgpu_drm.h>

Why is this needed here? You're not using any uapi definitions below.


> +
> +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,
> +                         struct drm_file *filp);
> +
> +#endif
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_drv.c
> index 4db92e0a60da..bf33567bb166 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -53,6 +53,7 @@
>  #include "amdgpu_xgmi.h"
>  #include "amdgpu_userq.h"
>  #include "amdgpu_userq_fence.h"
> +#include "amdgpu_criu.h"
>  #include "../amdxcp/amdgpu_xcp_drv.h"
>
>  /*
> @@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =3D=
 {
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_R=
ENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_SIGNAL, amdgpu_userq_signal_ioctl, =
DRM_AUTH|DRM_RENDER_ALLOW),
>        DRM_IOCTL_DEF_DRV(AMDGPU_USERQ_WAIT, amdgpu_userq_wait_ioctl, DRM_=
AUTH|DRM_RENDER_ALLOW),
> +     DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgpu_criu_bo_info_ioctl, D=
RM_AUTH|DRM_RENDER_ALLOW),
>  };
>
>  static const struct drm_driver amdgpu_kms_driver =3D {
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index a2149afa5803..a8cf2d4580cc 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -45,6 +45,8 @@
>  #include "amdgpu_dma_buf.h"
>  #include "kfd_debug.h"
>
> +#include "amdgpu_criu.h"
> +

Why is this header file needed here? None of the new ioctls will be impleme=
nted in kfd_chardev.c.

Regards,
  Felix


>  static long kfd_ioctl(struct file *, unsigned int, unsigned long);
>  static int kfd_open(struct inode *, struct file *);
>  static int kfd_release(struct inode *, struct file *);
> diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_drm.=
h
> index 45c4fa13499c..1508c55ff92a 100644
> --- a/include/uapi/drm/amdgpu_drm.h
> +++ b/include/uapi/drm/amdgpu_drm.h
> @@ -57,6 +57,7 @@ extern "C" {
>  #define DRM_AMDGPU_USERQ             0x16
>  #define DRM_AMDGPU_USERQ_SIGNAL              0x17
>  #define DRM_AMDGPU_USERQ_WAIT                0x18
> +#define DRM_AMDGPU_CRIU_BO_INFO      0x19
>
>  #define DRM_IOCTL_AMDGPU_GEM_CREATE  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_CREATE, union drm_amdgpu_gem_create)
>  #define DRM_IOCTL_AMDGPU_GEM_MMAP    DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
> @@ -77,6 +78,7 @@ extern "C" {
>  #define DRM_IOCTL_AMDGPU_USERQ               DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
>  #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL        DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
>  #define DRM_IOCTL_AMDGPU_USERQ_WAIT  DRM_IOWR(DRM_COMMAND_BASE + DRM_AMD=
GPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
> +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO        DRM_IOWR(DRM_COMMAND_BASE +=
 DRM_AMDGPU_CRIU_BO_INFO, struct drm_amdgpu_criu_bo_info_args)
>
>  /**
>   * DOC: memory domains
> @@ -1626,6 +1628,32 @@ struct drm_color_ctm_3x4 {
>        __u64 matrix[12];
>  };
>
> +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT        (1 << 0)
> +
> +struct drm_amdgpu_criu_bo_info_args {
> +    /* IN: Size of bo_buckets buffer. OUT: Number of bos in process (if =
larger than size of buffer, must retry) */
> +    __u32   num_bos;
> +
> +    /* User pointer to array of drm_amdgpu_criu_bo_bucket */
> +    __u64   bo_buckets;
> +};
> +
> +struct drm_amdgpu_criu_bo_bucket {
> +    /* Size of bo */
> +    __u64 size;
> +
> +    /* GEM_CREATE flags for re-creation of buffer */
> +    __u64 alloc_flags;
> +
> +    /* Pending how to handle this; provides information needed to remake=
 the buffer on restore */
> +    __u32 preferred_domains;
> +
> +    /* Currently just one flag: IS_IMPORT */
> +    __u32 flags;
> +
> +    __u32 gem_handle;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

--_000_SA1PR12MB8144AF805DEC7C6378D55467EF7DASA1PR12MB8144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; spin_lock(&amp;filp-&gt;table_lock);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr, gobj=
, id)</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; num_bos +=3D 1;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; spin_unlock(&amp;filp-&gt;table_lock);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; if (args-&gt;num_bos &lt; num_bos) {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; args-&gt;num_bos =3D =
num_bos;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; goto exit;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; Since this path doesn't require any cleanup, you could just return. Bu=
t maybe this should return an error code to let user mode know that it shou=
ld retry with a bigger bucket allocation. -ENOSPC?</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
I wasn't sure if sending back information from an ioctl in the structs whil=
e also returning an error value was acceptable. If it is, I'll make that ch=
ange.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr, gobj=
, id) {</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct amdgpu_bo *bo =
=3D gem_to_amdgpu_bo(gobj);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; struct drm_amdgpu_cri=
u_bo_bucket *bo_bucket;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket =3D &amp;bo=
_buckets[bo_index];</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;size =
=3D amdgpu_bo_size(bo);</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; + &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; bo_bucket-&gt;alloc_f=
lags =3D bo-&gt;flags &amp; (~AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);</div=
>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; I'm not sure why you're removing this flag. I think we always set it i=
mplicitly when creating a new BO (and presumably during restore), but there=
 should be no harm in leaving this flag set anyway.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
The driver doesn't like this flag being set on requests to create bo. Since=
 this is meant to be sending to the user the flags userspace will need to r=
ecreate the bo, I thought to leave it off.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +#include &quot;amdgpu_criu.h&quot;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; &gt; +</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt;&nbsp;</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
&gt; Why is this header file needed here? None of the new ioctls will be im=
plemented in kfd_chardev.c.</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
amdgpu_drv.c needs the header with the ioctl declarations for its ioctl def=
initions. Not sure if there's another way I should be including them.</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Kuehling, Felix &lt;F=
elix.Kuehling@amd.com&gt;<br>
<b>Sent:</b> Wednesday, June 18, 2025 5:05 PM<br>
<b>To:</b> Francis, David &lt;David.Francis@amd.com&gt;; dri-devel@lists.fr=
eedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> tvrtko.ursulin@igalia.com &lt;tvrtko.ursulin@igalia.com&gt;; Yat=
 Sin, David &lt;David.YatSin@amd.com&gt;; Freehill, Chris &lt;Chris.Freehil=
l@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; dcostant=
ino@meta.com &lt;dcostantino@meta.com&gt;; sruffell@meta.com &lt;sruffell@m=
eta.com&gt;;
 simona@ffwll.ch &lt;simona@ffwll.ch&gt;; mripard@kernel.org &lt;mripard@ke=
rnel.org&gt;; tzimmermann@suse.de &lt;tzimmermann@suse.de&gt;<br>
<b>Subject:</b> Re: [PATCH 2/4] drm/amdgpu: Add CRIU ioctl to get bo info</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText"><br>
On 2025-06-17 15:45, David Francis wrote:<br>
&gt; Add new ioctl DRM_IOCTL_AMDGPU_CRIU_BO_INFO.<br>
&gt;<br>
&gt; This ioctl returns a list of bos with their handles, sizes,<br>
&gt; and flags and domains.<br>
&gt;<br>
&gt; This ioctl is meant to be used during CRIU checkpoint and<br>
&gt; provide information needed to reconstruct the bos<br>
&gt; in CRIU restore.<br>
&gt;<br>
&gt; Signed-off-by: David Francis &lt;David.Francis@amd.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; |&nbsp;&nbsp; 2 +-<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c | 144 +++++++++++++++++=
++++++<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h |&nbsp; 32 +++++<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp; |&nbsp;&nbsp; 2 +<=
br>
&gt;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |&nbsp;&nbsp; 2 +<br>
&gt;&nbsp; include/uapi/drm/amdgpu_drm.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 28 +++++<br>
&gt;&nbsp; 6 files changed, 209 insertions(+), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c<br>
&gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile b/drivers/gpu/drm/amd=
/amdgpu/Makefile<br>
&gt; index 87080c06e5fc..0863edcdd03f 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; @@ -63,7 +63,7 @@ amdgpu-y +=3D amdgpu_device.o amdgpu_doorbell_mgr.o =
amdgpu_kms.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_xgmi.o amdgpu_csa.o a=
mdgpu_ras.o amdgpu_vm_cpu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vm_sdma.o amdgpu_disc=
overy.o amdgpu_ras_eeprom.o amdgpu_nbio.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_umc.o smu_v11_0_i2c.o=
 amdgpu_fru_eeprom.o amdgpu_rap.o \<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o \<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_fw_attestation.o amdgpu_securedisplay=
.o amdgpu_criu.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_eeprom.o amdgpu_mca.o=
 amdgpu_psp_ta.o amdgpu_lsdma.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_ring_mux.o amdgpu_xcp=
.o amdgpu_seq64.o amdgpu_aca.o amdgpu_dev_coredump.o \<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_cper.o amdgpu_userq_f=
ence.o amdgpu_eviction_fence.o<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.c<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..34a0358946b6<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.c<br>
&gt; @@ -0,0 +1,144 @@<br>
&gt; +/* SPDX-License-Identifier: MIT */<br>
&gt; +/*<br>
&gt; +* Copyright 2025 Advanced Micro Devices, Inc.<br>
&gt; +*<br>
&gt; +* Permission is hereby granted, free of charge, to any person obtaini=
ng a<br>
&gt; +* copy of this software and associated documentation files (the &quot=
;Software&quot;),<br>
&gt; +* to deal in the Software without restriction, including without limi=
tation<br>
&gt; +* the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,<br>
&gt; +* and/or sell copies of the Software, and to permit persons to whom t=
he<br>
&gt; +* Software is furnished to do so, subject to the following conditions=
:<br>
&gt; +*<br>
&gt; +* The above copyright notice and this permission notice shall be incl=
uded in<br>
&gt; +* all copies or substantial portions of the Software.<br>
&gt; +*<br>
&gt; +* THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY=
 KIND, EXPRESS OR<br>
&gt; +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,<br>
&gt; +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO E=
VENT SHALL<br>
&gt; +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR<br>
&gt; +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,<br>
&gt; +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR<br>
&gt; +* OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +#include &lt;linux/dma-buf.h&gt;<br>
&gt; +#include &lt;linux/hashtable.h&gt;<br>
&gt; +#include &lt;linux/mutex.h&gt;<br>
&gt; +#include &lt;linux/random.h&gt;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_device.h&gt;<br>
&gt; +#include &lt;drm/drm_file.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
&gt; +#include &lt;drm/drm_drv.h&gt;<br>
&gt; +#include &lt;drm/drm_exec.h&gt;<br>
&gt; +#include &lt;drm/drm_gem_ttm_helper.h&gt;<br>
&gt; +#include &lt;drm/ttm/ttm_tt.h&gt;<br>
&gt; +#include &lt;linux/interval_tree_generic.h&gt;<br>
&gt; +<br>
&gt; +#include &quot;amdgpu.h&quot;<br>
&gt; +#include &quot;amdgpu_display.h&quot;<br>
&gt; +#include &quot;amdgpu_dma_buf.h&quot;<br>
&gt; +#include &quot;amdgpu_hmm.h&quot;<br>
&gt; +#include &quot;amdgpu_xgmi.h&quot;<br>
<br>
That's a lot of header files. Do you really need them all?<br>
<br>
<br>
&gt; +<br>
&gt; +static uint32_t hardware_flags_to_uapi_flags(struct amdgpu_device *ad=
ev, uint64_t pte_flags)<br>
<br>
This function is never called.<br>
<br>
<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; uint32_t gem_flags =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; //This function will be replaced by the mapp=
ing flags rework<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_EXECUTABLE)<b=
r>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_EXECUTABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_READABLE)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_READABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_WRITEABLE)<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_WRITEABLE;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_PRT_FLAG(adev=
))<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_PRT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (pte_flags &amp; AMDGPU_PTE_NOALLOC)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; gem_flags |=3D AMDGPU_VM_PAGE_NOALLOC;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return gem_flags;<br>
&gt; +}<br>
&gt; +<br>
&gt; +<br>
&gt; +/**<br>
&gt; + * amdgpu_criu_bo_info_ioctl - get information about a process' buffe=
r objects<br>
&gt; + *<br>
&gt; + * @dev: drm device pointer<br>
&gt; + * @data: drm_amdgpu_criu_bo_info_args<br>
&gt; + * @filp: drm file pointer<br>
&gt; + *<br>
&gt; + * num_bos is set as an input to the size of the bo_buckets array.<br=
>
&gt; + * num_bos is sent back as output as the number of bos in the process=
.<br>
&gt; + * If that number is larger than the size of the array, the ioctl mus=
t<br>
&gt; + * be retried.<br>
&gt; + *<br>
&gt; + * Returns:<br>
&gt; + * 0 for success, -errno for errors.<br>
&gt; + */<br>
&gt; +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp)<br>
&gt; +{<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_info_args *args =
=3D data;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_amdgpu_criu_bo_bucket *bo_buckets=
;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *gobj;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int id, ret =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int bo_index =3D 0;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; int num_bos =3D 0;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;filp-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr,=
 gobj, id)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; num_bos +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;filp-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (args-&gt;num_bos &lt; num_bos) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; args-&gt;num_bos =3D num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
<br>
Since this path doesn't require any cleanup, you could just return. But may=
be this should return an error code to let user mode know that it should re=
try with a bigger bucket allocation. -ENOSPC?<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; args-&gt;num_bos =3D num_bos;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (num_bos =3D=3D 0) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto exit;<br>
<br>
Just return. 0 (success) seems fine here.<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; bo_buckets =3D kvzalloc(num_bos * sizeof(*bo=
_buckets), GFP_KERNEL);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (!bo_buckets) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -ENOMEM;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; goto free_buckets;<br>
<br>
Just return -ENOMEM.<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_lock(&amp;filp-&gt;table_lock);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; idr_for_each_entry(&amp;filp-&gt;object_idr,=
 gobj, id) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct amdgpu_bo *bo =3D gem_to_amdgpu_bo(gobj);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; struct drm_amdgpu_criu_bo_bucket *bo_bucket;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket =3D &amp;bo_buckets[bo_index];<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;size =3D amdgpu_bo_size(bo);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;alloc_flags =3D bo-&gt;flags &amp; (~AMDGPU_GEM_CREATE_VR=
AM_WIPE_ON_RELEASE);<br>
<br>
I'm not sure why you're removing this flag. I think we always set it implic=
itly when creating a new BO (and presumably during restore), but there shou=
ld be no harm in leaving this flag set anyway.<br>
<br>
<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;preferred_domains =3D bo-&gt;preferred_domains;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_bucket-&gt;gem_handle =3D id;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (bo-&gt;tbo.base.import_attach)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo_bucket-&gt;flags |=
=3D AMDGPU_CRIU_BO_FLAG_IS_IMPORT;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; bo_index +=3D 1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;filp-&gt;table_lock);<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ret =3D copy_to_user((void __user *)args-&gt=
;bo_buckets, bo_buckets, num_bos * sizeof(*bo_buckets));<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; pr_debug(&quot;Failed to copy BO information to user\n&quot;);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; ret =3D -EFAULT;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +<br>
&gt; +free_buckets:<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; kvfree(bo_buckets);<br>
&gt; +exit:<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h b/drivers/gpu/dr=
m/amd/amdgpu/amdgpu_criu.h<br>
&gt; new file mode 100644<br>
&gt; index 000000000000..1b18ffee6587<br>
&gt; --- /dev/null<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_criu.h<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +/* SPDX-License-Identifier: MIT */<br>
&gt; +/*<br>
&gt; +* Copyright 2025 Advanced Micro Devices, Inc.<br>
&gt; +*<br>
&gt; +* Permission is hereby granted, free of charge, to any person obtaini=
ng a<br>
&gt; +* copy of this software and associated documentation files (the &quot=
;Software&quot;),<br>
&gt; +* to deal in the Software without restriction, including without limi=
tation<br>
&gt; +* the rights to use, copy, modify, merge, publish, distribute, sublic=
ense,<br>
&gt; +* and/or sell copies of the Software, and to permit persons to whom t=
he<br>
&gt; +* Software is furnished to do so, subject to the following conditions=
:<br>
&gt; +*<br>
&gt; +* The above copyright notice and this permission notice shall be incl=
uded in<br>
&gt; +* all copies or substantial portions of the Software.<br>
&gt; +*<br>
&gt; +* THE SOFTWARE IS PROVIDED &quot;AS IS&quot;, WITHOUT WARRANTY OF ANY=
 KIND, EXPRESS OR<br>
&gt; +* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABI=
LITY,<br>
&gt; +* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.&nbsp; IN NO E=
VENT SHALL<br>
&gt; +* THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAG=
ES OR<br>
&gt; +* OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWIS=
E,<br>
&gt; +* ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE =
OR<br>
&gt; +* OTHER DEALINGS IN THE SOFTWARE.<br>
&gt; +*/<br>
&gt; +<br>
&gt; +#ifndef __AMDGPU_CRIU_H__<br>
&gt; +#define __AMDGPU_CRIU_H__<br>
&gt; +<br>
&gt; +#include &lt;drm/amdgpu_drm.h&gt;<br>
<br>
Why is this needed here? You're not using any uapi definitions below.<br>
<br>
<br>
&gt; +<br>
&gt; +int amdgpu_criu_bo_info_ioctl(struct drm_device *dev, void *data,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 struct drm_file *filp);<br>
&gt; +<br>
&gt; +#endif<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_drv.c<br>
&gt; index 4db92e0a60da..bf33567bb166 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; @@ -53,6 +53,7 @@<br>
&gt;&nbsp; #include &quot;amdgpu_xgmi.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_userq.h&quot;<br>
&gt;&nbsp; #include &quot;amdgpu_userq_fence.h&quot;<br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt;&nbsp; #include &quot;../amdxcp/amdgpu_xcp_drv.h&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; /*<br>
&gt; @@ -3021,6 +3022,7 @@ const struct drm_ioctl_desc amdgpu_ioctls_kms[] =
=3D {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ, amdgpu_userq_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_SIGNAL, amdgpu_userq_signal_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_USE=
RQ_WAIT, amdgpu_userq_wait_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOCTL_DEF_DRV(AMDGPU_CRIU_BO_INFO, amdgp=
u_criu_bo_info_ioctl, DRM_AUTH|DRM_RENDER_ALLOW),<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt;&nbsp; static const struct drm_driver amdgpu_kms_driver =3D {<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index a2149afa5803..a8cf2d4580cc 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -45,6 +45,8 @@<br>
&gt;&nbsp; #include &quot;amdgpu_dma_buf.h&quot;<br>
&gt;&nbsp; #include &quot;kfd_debug.h&quot;<br>
&gt;&nbsp; <br>
&gt; +#include &quot;amdgpu_criu.h&quot;<br>
&gt; +<br>
<br>
Why is this header file needed here? None of the new ioctls will be impleme=
nted in kfd_chardev.c.<br>
<br>
Regards,<br>
&nbsp; Felix<br>
<br>
<br>
&gt;&nbsp; static long kfd_ioctl(struct file *, unsigned int, unsigned long=
);<br>
&gt;&nbsp; static int kfd_open(struct inode *, struct file *);<br>
&gt;&nbsp; static int kfd_release(struct inode *, struct file *);<br>
&gt; diff --git a/include/uapi/drm/amdgpu_drm.h b/include/uapi/drm/amdgpu_d=
rm.h<br>
&gt; index 45c4fa13499c..1508c55ff92a 100644<br>
&gt; --- a/include/uapi/drm/amdgpu_drm.h<br>
&gt; +++ b/include/uapi/drm/amdgpu_drm.h<br>
&gt; @@ -57,6 +57,7 @@ extern &quot;C&quot; {<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x16<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x17<br>
&gt;&nbsp; #define DRM_AMDGPU_USERQ_WAIT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x18<br>
&gt; +#define DRM_AMDGPU_CRIU_BO_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x19<br=
>
&gt;&nbsp; <br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_CREATE&nbsp; DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_GEM_MMAP&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM=
_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)<br>
&gt; @@ -77,6 +78,7 @@ extern &quot;C&quot; {<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BAS=
E + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct=
 drm_amdgpu_userq_signal)<br>
&gt;&nbsp; #define DRM_IOCTL_AMDGPU_USERQ_WAIT&nbsp; DRM_IOWR(DRM_COMMAND_B=
ASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)<br>
&gt; +#define DRM_IOCTL_AMDGPU_CRIU_BO_INFO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_CRIU_BO_INFO, struct drm_=
amdgpu_criu_bo_info_args)<br>
&gt;&nbsp; <br>
&gt;&nbsp; /**<br>
&gt;&nbsp;&nbsp; * DOC: memory domains<br>
&gt; @@ -1626,6 +1628,32 @@ struct drm_color_ctm_3x4 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __u64 matrix[12];<br>
&gt;&nbsp; };<br>
&gt;&nbsp; <br>
&gt; +#define AMDGPU_CRIU_BO_FLAG_IS_IMPORT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; (1 &lt;&lt; 0)<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_info_args {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* IN: Size of bo_buckets buffer. OUT: Number of b=
os in process (if larger than size of buffer, must retry) */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32&nbsp;&nbsp; num_bos;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* User pointer to array of drm_amdgpu_criu_bo_buc=
ket */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64&nbsp;&nbsp; bo_buckets;<br>
&gt; +};<br>
&gt; +<br>
&gt; +struct drm_amdgpu_criu_bo_bucket {<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Size of bo */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u64 size;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* GEM_CREATE flags for re-creation of buffer */<b=
r>
&gt; +&nbsp;&nbsp;&nbsp; __u64 alloc_flags;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Pending how to handle this; provides informatio=
n needed to remake the buffer on restore */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 preferred_domains;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; /* Currently just one flag: IS_IMPORT */<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 flags;<br>
&gt; +<br>
&gt; +&nbsp;&nbsp;&nbsp; __u32 gem_handle;<br>
&gt; +};<br>
&gt; +<br>
&gt;&nbsp; #if defined(__cplusplus)<br>
&gt;&nbsp; }<br>
&gt;&nbsp; #endif<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_SA1PR12MB8144AF805DEC7C6378D55467EF7DASA1PR12MB8144namp_--
