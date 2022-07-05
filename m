Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E66B567104
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 16:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683882BCB8;
	Tue,  5 Jul 2022 14:28:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3CC2BDCC;
 Tue,  5 Jul 2022 14:28:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/VNrQ6PsuIFsH8NOTEdhD1KKQHrukiOEKIX6oMTQM0wEWgNL11ML7j9oiz1GpMC8Rbf8yNjsw0JtB49/AmbTiatLRKfa7v9l5jc3FwxMk9Jt0rw/nmMjCLlTLLIZ8VO0PtoBpuGPqpqROuxl05k80qmBYb2O3nDsplNjhTAAgO2kSGx638k/DY4do2nPzMEzVWXLAAePeagqdC8tsn9zYE6TY9B1DIugtVTE5YZtiIzNjnKgCK1YZn2N6LgNdey5CF5Ai6ZUsgFX9ma/gYBza3iN0zV5jXY9vwfINOYhkXQm9zOIYLj6nMixzuAV73xvMJtRKBZwPUyvxvEwcmvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SALgYGQ78WqjwlpbOaeLrFap/ZPrYe2tGwt48hCqFPY=;
 b=K/jzzxcOvFls+ICY63+LErpMN1tUV6QfghJMguj+8fLhlmwbRluC1sWxgOyYrEgyphSgo9h5GhBnPcloHpG8LODEIB1ddW+ypQZ7qH+NzNAdi4lLUgb4RDfQG5am4i/uFg5jWhyrh4xolPeY00ko0T1ST+T8xRalZhS4rSC7xtIHZYLAddvWJ9viKP+oVf5EBhbbV7XTkY7BWzYctgDKqqgeAripbmrJ8T4ZslwdJi9UY8XNNiYEij5SVIGgq52gXYuc2BQhWOKySNU0CcH0NZJx2HfzS16a/c4KRcZsRC+FXIGbTZRfc2hPvb6xGt+P297zsmaYfjbalffiunfipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SALgYGQ78WqjwlpbOaeLrFap/ZPrYe2tGwt48hCqFPY=;
 b=v92GCyFcByRzJjjqQPD6yPiM2ZPD2GZQKJoARctfGNOW9x56p+nq0rAO2YPT5IdYUHiaWyCsP40w5LyIksa0rt2s86vAXeNizCJZ+lugNBd9vVZW+s6h5jBlkU8d/Dz6RLPn/khyUbAGy/re/G2jovPE9GwPIJl28eLoElI+c9w=
Received: from BL0PR12MB2465.namprd12.prod.outlook.com (2603:10b6:207:45::18)
 by PH7PR12MB6635.namprd12.prod.outlook.com (2603:10b6:510:210::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.21; Tue, 5 Jul
 2022 14:28:41 +0000
Received: from BL0PR12MB2465.namprd12.prod.outlook.com
 ([fe80::d43e:54f8:f7ca:f94f]) by BL0PR12MB2465.namprd12.prod.outlook.com
 ([fe80::d43e:54f8:f7ca:f94f%4]) with mapi id 15.20.5395.021; Tue, 5 Jul 2022
 14:28:41 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, =?iso-8859-1?Q?Michel_D=E4nzer?=
 <michel@daenzer.net>
Subject: RE: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
Thread-Topic: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl
Thread-Index: AQHYfNKWemTfK8IAyEuEri9Rzy//+K1IzMoAgCcu5GA=
Date: Tue, 5 Jul 2022 14:28:41 +0000
Message-ID: <BL0PR12MB2465B18FAD45D1A9AAA1F9D6F1819@BL0PR12MB2465.namprd12.prod.outlook.com>
References: <20220610135426.670120-1-michel@daenzer.net>
 <CADnq5_P-OLS_nAA738V4tuqXFKGMm-=sZVE_FoWSEAVnkk7sFw@mail.gmail.com>
In-Reply-To: <CADnq5_P-OLS_nAA738V4tuqXFKGMm-=sZVE_FoWSEAVnkk7sFw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87508ce7-3c90-46c1-2509-08da5e92a891
x-ms-traffictypediagnostic: PH7PR12MB6635:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: S+MMI0jD+sAY0Bd0+R3CvDD0eE8eiQZrlbIomiGcKrrS0MyWc0GggijQDBvzws5dsMz6voOvKW9AHGNoAV35NM6NlC3zq+8YC8fKUfQWAPZTz3fLsLdarhuF5VOioBIlPOLfEpBT7olMBIJCYge7B81pg5h1EIr7BFY+uxBfwGX96rr2Y4OvFr67HSF0caIAAF/nGXCUsxyKw+yhzcGLIhnAGsfglacK/Df5zI0QSXRpM5y82pW8iKOIW/I+wfhNEkropsCUXEARZayCrB1yqMApfbojD3sya80lk2qZfdcCbJ3Rpn/uVNihyVrEAC39DdeGxCJQ9tqC1RrS6ZjSdCPn8x8DdngLGcU0zynCTziMGDhQ7cwWQ1TWnAGxjVbRk39E/T+LlTBGvKoGWRsF4YFVvEqx3mPdtpal2KRgtDhYvEQrmURDaa3SjQW2tKZZgoS5MFc97YBai0i/t9GqYluA4sUzNeEjLOzJJ0hwHDUsr22uh9wPMk3Xl0bkee+bMhPBP9wxFRMmgcGELypcdicdLr6uDPBg3KqLsKk00qwwMe8w9Ue9mI86NgRE9WYj3lPPA5nDovPkFb8xkq3iTh99hU6VdsSTAFkflgVvERCgIlcmqf8osBJMyjXUNTwKbZpz8MOJ6s2bDBhntu78oNsGcZoqOXfOVSjnRa4lqSpSYCt86uS8+niqjEtVKJn4XiSlZyadSt7hGHS4SUw7PbfHwNymtRJbEv2eT1Ox/3gIy87ir0qme86+irqiRuCChnG5vwaW/cEwQ3Qf6aIPyZWoyhKfkEtY6MxwZ4z8K0rr9tPq4rzQSruaxV0cir0ElEdikotX2tB5Bipfrynf4w==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2465.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(2906002)(41300700001)(55016003)(38100700002)(54906003)(45080400002)(316002)(53546011)(6506007)(110136005)(7696005)(76116006)(66946007)(66556008)(66476007)(66446008)(64756008)(8676002)(4326008)(9686003)(71200400001)(33656002)(52536014)(86362001)(478600001)(186003)(83380400001)(122000001)(26005)(38070700005)(966005)(8936002)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?ZJaakvpOqGAnaoqMP7rwjI2IGWR0jwb603JRNv3yf4NBZu8pdmGC1EVLG3?=
 =?iso-8859-1?Q?S5wI50d/EFwthVND5Xx/7iLH8NXUcsS+YMWet8LEd8lFZZAvZaxbSZLYyu?=
 =?iso-8859-1?Q?VzKu73a3Mk21z5PmWT2BFY5Bp9t7eEXepFbqUap2lzH6Z9Cco2bP8nDtUp?=
 =?iso-8859-1?Q?Xie/PoWG6OuAYkYACqV4qKWDnH/5ozuLWNVCSQgFuRXVyQcuGZuduXCqBn?=
 =?iso-8859-1?Q?fR0Cc71YQftYTs5B9s10DUPDdCN02KE7v03eomskPzWDfCZsY/p1norE3m?=
 =?iso-8859-1?Q?5FCzMYsxg1KoDgVnrznopUcayBfr3mdG8izYV2eVTwhNl11h43ZUOUOzdm?=
 =?iso-8859-1?Q?vaoFVnhw/k4PUbn/f2HuBOGR+KI1tjQvhZlMCKd6aoblTSWL4yOTF96W0f?=
 =?iso-8859-1?Q?Jp00bc/10uGHsIaimRbXhpFAQvcgTylrvs0h+3Mmiqb9xCmFL/c6OAZ5Dq?=
 =?iso-8859-1?Q?CUR3ShjjWxCgXY+vxNWBTK5L6sjeDsRzXMq7LoJEQaoe2PHP8TDRAad3dy?=
 =?iso-8859-1?Q?G49V7BmaWtswyXDowWLqiuwzwMBENkAG3zt7dBSf85oGQIkkqCIWsfxeaM?=
 =?iso-8859-1?Q?Pz3vTDtd/Hr8maSmmPbi3vbJMNy6mab5YCGifmZeNeYhOg4zN/NxwYp0NA?=
 =?iso-8859-1?Q?WGS/SYOgzVIViAlbLUwjge0/PU83riVgdU2lWUjiCK/T83+cblU6yISSFF?=
 =?iso-8859-1?Q?jjh9hcn8qt4wFqbptqBbr63Oal3h7Qvm/8DlqtRUjj1kE+HU2x+NY+bDGj?=
 =?iso-8859-1?Q?AG4bbeuSQFzNKP3apspyG73chkqDUsWThCSCi+r9xLVSvrZOx0Z0cgG5qx?=
 =?iso-8859-1?Q?SrG3L8y+W0I7A7+uVroi4U+NgwbBRb+G3ViWeeBArcFxZ5OYx1fQwI1GF2?=
 =?iso-8859-1?Q?fPTpfHbr5Xs00j/nbXWaSJj80wChd807FOH4akl4EGkAQvMUU7uQhAJPvd?=
 =?iso-8859-1?Q?kw8S7MPuG5GhZL9ZhmJzIj1EyBVRGUzrY63RvSdfDNVy9sHS/H/O4eKrLN?=
 =?iso-8859-1?Q?3iyCK2kxTY1kEBqyeSYrIzzT5gK99qyIiM7rPAk4zGdFhSvYWY5zhSaHiq?=
 =?iso-8859-1?Q?mTRefhYZ6U0h4vxrlQtgpYxyxsn0d3ScIaaH4CpgVQAKuKEX3sm+RLiAwU?=
 =?iso-8859-1?Q?c5k9UJrOpeqgwk63e6AMUucw6KPhZdQAj5rLU/+upbBzneIxTCAZ5FmbyA?=
 =?iso-8859-1?Q?UXv67d8G09VE3mV7Z0qqTT3sHRvuV7H58eIsIVnqNwTT1BFMR2+W+Tw7G/?=
 =?iso-8859-1?Q?ruvRnWthmVdjQVCi0iiZXx1b/gMyH1YLA4jIhfzSdgHEocQluAhNI6Q5Cq?=
 =?iso-8859-1?Q?AE0/aXmQ7vZJC0BxFq5bs9p9B/XE5YPiCRRrM++4HJuGb+hYSzjvyAnU9k?=
 =?iso-8859-1?Q?cg3lfECP+qp1ivVVus7UozH6st/jAz4Ilno+nDsIpzwGW5s0+1NXV8grtx?=
 =?iso-8859-1?Q?r+yyDNfn+sV7yT6qOc4wbX+JuL6IF9EQAYA2pXLg90MWxq7aXEY9grf4BY?=
 =?iso-8859-1?Q?hOQydgPeAQheVaGPzFamEBQYG8o/uGlYE70NsNoiWwP+Xxh7GVqusJOsfW?=
 =?iso-8859-1?Q?mmiFGieTzIBYATc4qHI2083FpbQNnrwHjpn1FSaUa/vxp/HB1oHtuh32od?=
 =?iso-8859-1?Q?CNc2jZnq5rCNg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2465.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87508ce7-3c90-46c1-2509-08da5e92a891
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2022 14:28:41.2510 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 63z/j3g3FG9DcamBLQGcpukomX/KycIYp8jWou0U/XaY3Q5GC2tT4RFUNePPXcIvK8bkNFJalM9LJJljnOLFlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6635
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alex,

I think we need to revert this patch on amd-staging-drm-next branch, as its=
 base commit like " drm/amdgpu: remove GTT accounting v2" does not present =
on 5.16. Instead, the series is part of upcoming 5.18 based amd-staging-drm=
-next branch. Otherwise, incorrect GTT size reporting switched from page to=
 bytes will crash several vulkan APPs.

Regards,
Guchun

-----Original Message-----
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex Deu=
cher
Sent: Saturday, June 11, 2022 12:01 AM
To: Michel D=E4nzer <michel@daenzer.net>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; Pan, Xinhui <Xinhui.Pan=
@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Koenig, Christian =
<Christian.Koenig@amd.com>; Maling list - DRI developers <dri-devel@lists.f=
reedesktop.org>
Subject: Re: [PATCH] drm/amdgpu: Fix GTT size reporting in amdgpu_ioctl

Applied.  Thanks!

Alex

On Fri, Jun 10, 2022 at 10:01 AM Michel D=E4nzer <michel@daenzer.net> wrote=
:
>
> From: Michel D=E4nzer <mdaenzer@redhat.com>
>
> The commit below changed the TTM manager size unit from pages to=20
> bytes, but failed to adjust the corresponding calculations in=20
> amdgpu_ioctl.
>
> Fixes: dfa714b88eb0 ("drm/amdgpu: remove GTT accounting v2")
> Bug:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl
> ab.freedesktop.org%2Fdrm%2Famd%2F-%2Fissues%2F1930&amp;data=3D05%7C01%7C
> guchun.chen%40amd.com%7C28ed180d765c4588474008da4afa68e1%7C3dd8961fe48
> 84e608e11a82d994e183d%7C0%7C0%7C637904736611555668%7CUnknown%7CTWFpbGZ
> sb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3
> D%7C3000%7C%7C%7C&amp;sdata=3D%2Bmr%2BJWj5q%2BfB04L4hmNSG%2BYpfhny6YayNV
> gt2xty6bo%3D&amp;reserved=3D0
> Bug:=20
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgitl
> ab.freedesktop.org%2Fmesa%2Fmesa%2F-%2Fissues%2F6642&amp;data=3D05%7C01%
> 7Cguchun.chen%40amd.com%7C28ed180d765c4588474008da4afa68e1%7C3dd8961fe
> 4884e608e11a82d994e183d%7C0%7C0%7C637904736611555668%7CUnknown%7CTWFpb
> GZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7C3000%7C%7C%7C&amp;sdata=3DyN1jFKsffHu2Ik2crsrRxGBxCRylXckSj9zILxTZ
> QzE%3D&amp;reserved=3D0
> Signed-off-by: Michel D=E4nzer <mdaenzer@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c=20
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> index 801f6fa692e9..6de63ea6687e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c
> @@ -642,7 +642,6 @@ int amdgpu_info_ioctl(struct drm_device *dev, void *d=
ata, struct drm_file *filp)
>                             atomic64_read(&adev->visible_pin_size),
>                             vram_gtt.vram_size);
>                 vram_gtt.gtt_size =3D ttm_manager_type(&adev->mman.bdev, =
TTM_PL_TT)->size;
> -               vram_gtt.gtt_size *=3D PAGE_SIZE;
>                 vram_gtt.gtt_size -=3D atomic64_read(&adev->gart_pin_size=
);
>                 return copy_to_user(out, &vram_gtt,
>                                     min((size_t)size,=20
> sizeof(vram_gtt))) ? -EFAULT : 0; @@ -675,7 +674,6 @@ int amdgpu_info_ioc=
tl(struct drm_device *dev, void *data, struct drm_file *filp)
>                         mem.cpu_accessible_vram.usable_heap_size * 3 /=20
> 4;
>
>                 mem.gtt.total_heap_size =3D gtt_man->size;
> -               mem.gtt.total_heap_size *=3D PAGE_SIZE;
>                 mem.gtt.usable_heap_size =3D mem.gtt.total_heap_size -
>                         atomic64_read(&adev->gart_pin_size);
>                 mem.gtt.heap_usage =3D=20
> ttm_resource_manager_usage(gtt_man);
> --
> 2.36.1
>
