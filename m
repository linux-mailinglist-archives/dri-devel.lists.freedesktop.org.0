Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E1250847C
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 11:07:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C645894B7;
	Wed, 20 Apr 2022 09:07:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CFEA894B7;
 Wed, 20 Apr 2022 09:07:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5s1288uZR9nyL1MsxNbLDsWLkO+Iy13c2UiG2i8hNrJH4aVT8eEA6s1um1O7sMLX+FsSGofgK4/pYwe6mMH0tlAY37BJFQJXVx6ximgnOyKEr/6N0rJsOGq4h+tLThNhM5xYZgzlY8qmL6aas3GkCrifootAggOmp4zx6xwn7imUede75Xd71i6ilOygqIsTPxV+sEqc4RNvoH/ajEi3gL9iwaDGymixVpOd3YsUeOtvoSUoZVJvsTGndJIdWAmypRu24kjHRdrtBIq/lrAMMIDbf15CbXZWpaf+7VMZFu41Fn8QUaQ/1agTu7n6skFIP7N9HZeM3zpKw+fbSx5BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUBXU1ZL7azKjPwRiFCPd34T9JPKI4ephCKam2SFhLc=;
 b=RaRniCtx+7bCzAsJlp2fva4MS9ASy20MVLRTb2GyygwR17DfYtJDmtGlLXMR1VjeOUZqCT4X36HkSBu1it1mzHO9DrNn4mPjj5eeE1HGr1tGiL8L0PyA6TstMOsRp5RAAKOSiti2qM/7NKsxnSwuakLnOeMiI4B7eA0TOj3NUruXWR8vj9Ax382nnLwqxvdJEjiolgEBcJNpj2T4zZBsEc+ukSmTPkWJU68tR2qSErw2ZInpJlC9dLrbwNCMnVRGLfoz+f+BvLy5ci0uoUlx1W/nOIHmZc4MJ0oZ9QcGla5v+SmGDFY1qoi7YN/yj0JBLNW3+Ke/jWii60+bSqhcCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUBXU1ZL7azKjPwRiFCPd34T9JPKI4ephCKam2SFhLc=;
 b=Lq0k59S9Np/EGpDwJrRgDGC2bSK0n7wGU23pD8cYn40gDV1bMUTdP1YTrD8hGIxYigdHmpcg33HSlrBskEvqyqu9ILyToEEUyo3e2L3QndGxBPgySDjTEorNQx6EPOoAHRYDwOvFARKaECLiW51cux4qLK4Bznjz8o7C7fOjfe4=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by MW3PR12MB4345.namprd12.prod.outlook.com (2603:10b6:303:59::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Wed, 20 Apr
 2022 09:07:30 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.013; Wed, 20 Apr 2022
 09:07:30 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Topic: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds kmalloc
 limit
Thread-Index: AQHYVJSHP8/0hJsFF022HGuI3b/QKKz4gPOAgAAAasM=
Date: Wed, 20 Apr 2022 09:07:30 +0000
Message-ID: <CO6PR12MB54733101E19842B59668482B82F59@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220420085612.1664787-1-KevinYang.Wang@amd.com>
 <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
In-Reply-To: <00dfec71-cf38-d6d9-8775-0ae88f59224e@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-20T09:07:30.651Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 481afbd4-a48b-4771-9fdf-08da22ad32a4
x-ms-traffictypediagnostic: MW3PR12MB4345:EE_
x-microsoft-antispam-prvs: <MW3PR12MB4345C96C7A3CA8EAE8A4C32582F59@MW3PR12MB4345.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: w7jsMIxtP913L9www9XPEK4ZTVFyxqV091bzeIOzhQ0ctBsrfhjyhjYoYPRGIP5GoiR1hDR670lLeZzrX6r4DRdewpQnOehcAQqHu0/7aFL7c7VBdjS9+LHMQ6k49W/s7B8oq5UF3tuewR98zjrrCKXWkvjO+hpbD3FDQyCTqaAYPUoSOe2kUZMAfhl0UVx1foEN6XGQ+CAZ1HdTkmWoBoi0il4n++ASw/RiOCe7BuO1Y0PALb2KVvGSh8YMon3+bqzDxon3O0f8iPOcAH/4mRnkhjdezFXeWvdFSAyvcDZbMBXN4swOCLZvX/myPuJZ84FkJi4t8nEFVk4O9sMoC0zF+XkxeUQBS4jirCArmUk8plQQiUrgc+7UOfryB4hrzklPpjMMsuMTLkkFzP6QsCSLK/mdH0sBojKJMMl52Ziogixi/V9s0/fxvp+uwi4XwhjnHhlYqmyMheBE1mII1LxQbEKOHQqi2zrdpc609TDZmpp9Mr4mSljGWnCWfLXZarjFzLn1Ok5cCyKjpNX9vYbS/wxoq5anlka1jiiBdwa2bUsY6tTGXRefZib3YuVSinjAJ5YQpMHtYhJQG6AtdAPKVPH48sqaZhhIkm2tJX1/XVO+9IpDVkNQri7xcG2fvvcsQ/3YmSKS1bxC+CodzNaY9LIlK27PoJG+iFg0F0MnoH1+jFGPjkv7mBcW8TXcikhPFkgPLb8wHwV2u/2omA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(508600001)(71200400001)(55016003)(52536014)(66556008)(8936002)(450100002)(76116006)(33656002)(9686003)(66446008)(66476007)(64756008)(53546011)(2906002)(7696005)(6506007)(122000001)(91956017)(316002)(186003)(83380400001)(19627405001)(26005)(8676002)(66946007)(38100700002)(86362001)(38070700005)(5660300002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?LFC5212YH05r3PnIFgqFs6d2j03TCBenVcOIwavM1rFq/5fGSimy+jOVbD?=
 =?iso-8859-1?Q?I+LgmhXIgpu6AsGyvmKs2ZFRwZlKqan5q5WhNydyES2MMHqjOyxKyq8tdD?=
 =?iso-8859-1?Q?JcU5GD5YPLE68c7+yzRqvtXTkYPzoTnZaxr2pm+5aOfMDghunP/MpSTsp0?=
 =?iso-8859-1?Q?zc0rIq4gYGiN0TsogPjljcHYAssPnRkYy11vvbBEGLww3B1qXSiqujueIW?=
 =?iso-8859-1?Q?bVpNzhsq3D87UDwFI7hRaxm3vgHP1hj5DPV3nFJ8lBs7YTFptkcHPEs0M6?=
 =?iso-8859-1?Q?3VSpAmF4oqkdMmITX0tdLB81nbd2WcncwDGKSBMOu4Poy7cHI1J+8peoxy?=
 =?iso-8859-1?Q?S3q5/GOPwo13Cj3rnFIshlod6WAMmXA6jcwE/r6Cgm052OT23ei45N36zg?=
 =?iso-8859-1?Q?VXEOyjoNAQgKjXL7wIfihYAYO/zmin2t1pIq/kfVTVQQFSvQBb4qqfiPnw?=
 =?iso-8859-1?Q?xd64BQIiyEbYAAe/TrXRXe5S0JKXBOK/8ID33bUCBnHlvCwDseYa+rIlCp?=
 =?iso-8859-1?Q?otH+uLd2sYZbY65Q3aCEd1ZWkI5QnObaPG/aLNXwZIhVdYzf9Cc/9Ewsvw?=
 =?iso-8859-1?Q?1yqSN9tUH8lCabp0aRVLUee4On2y65OYyvQ8yLA0WdK63wbBqayvx6U/C/?=
 =?iso-8859-1?Q?GAHQ1dujAaso6Y/zccFvvH13y+KwmTz7jCG3HqoeFOrYq++5dPQ4aURk24?=
 =?iso-8859-1?Q?3y1fU/aJIONJn0Of5YqE8T6cDuDsU5S3S8hZYa+MVq24fu6XHjFZIgk8XX?=
 =?iso-8859-1?Q?/piCnceb1IFEcBGSMzHiXqKraVVjRIdzHEfgGdO3GRKF2+B/zPl6mfqbTF?=
 =?iso-8859-1?Q?tsl7JgFqRc6dcbDk7+T5vP5uYtWqxMHRNXmGXjeSAYRAdny9tdkQFzaCy1?=
 =?iso-8859-1?Q?3llPsVqVeP1ww5PQ6TrHKk3tlT1GD0q8ukuMNkePZLvMUArK4sipRtgFJO?=
 =?iso-8859-1?Q?KR1o0KtnkRczHaSKTaX5UDy1r2uabVJMiqF9ZCKONv/8YwIAvHLBT8r/Fv?=
 =?iso-8859-1?Q?3FxXzLRVSYY6trNiXiQWWNqlIt83ARROKIq/X9geZ4d4SMpgtfGKQCIlUa?=
 =?iso-8859-1?Q?ONvdMBOR6y6x/YvGYS6IZQ8/K6tJPQd4K1dwo3qYx/6wKfZCllfuexDsgx?=
 =?iso-8859-1?Q?SHeGKzfSi/bBK2xcZsI1fPJq7MO75q9RZbfhO3fzTo1xzY8fujgjgQTDb9?=
 =?iso-8859-1?Q?6N9/Z28yIa0KKUCTrVOnWNpgmlFQBiTInij9edenHAMtYoavaJMBF/l78U?=
 =?iso-8859-1?Q?amrwxhDtPMpqsXD8PpH01rk9J5QHFlaIkyvIyE6uM3UDE13eJVKXNLbk+H?=
 =?iso-8859-1?Q?nV6kTS/uUGndWdE4ayAYPQi+KVBXApy21IWLxPDkIWrRLNqg9EYjvdIfjS?=
 =?iso-8859-1?Q?EFLjLR1I9k6u+MHy3BaF5933y3iCAg31Q3S/6CCk+32FhdSj6Yk5sp/z0m?=
 =?iso-8859-1?Q?BNDia0hWlEF3gdr9dgfQlKSV+g/7YBNZsm7wRhwbWqqlz0EbMmdHPfSV/4?=
 =?iso-8859-1?Q?wWHE8QRyDpGmbYpsllNdxu+el2bTtwKGx9t+c47DJ0fHyfHZ7VzsAL9TyR?=
 =?iso-8859-1?Q?4iqNZLxGiOREx7Etyg+ci+296uBXVTewLMkIiapwoX3t6oirsGoDqRf0Ah?=
 =?iso-8859-1?Q?SU5xnnVb4qVQzqUTq34taQdlvrwYCP0Q1P9aIwrdFMkSeg0WCxMu7mVvtl?=
 =?iso-8859-1?Q?I84Sz5LVV4Z02T+T3PpUbi9PH7oTqUytwbefpL+DvQW5wurkBXkBy6XU2i?=
 =?iso-8859-1?Q?s2zVlsYsYucJMebuz4VE+ur+gc+b90pAI/ID25kGboBAXC?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB54733101E19842B59668482B82F59CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 481afbd4-a48b-4771-9fdf-08da22ad32a4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2022 09:07:30.0526 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i8XxVpc2CxUaRKpPRj/qsytFOqjCglI59L1gjsj6A7y+HCcPHa65Mp3JxuidnNIE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4345
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

--_000_CO6PR12MB54733101E19842B59668482B82F59CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]


________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Wednesday, April 20, 2022 5:00 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; dri-devel@lists.freedesktop=
.org <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org <amd-=
gfx@lists.freedesktop.org>
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
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>
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


--_000_CO6PR12MB54733101E19842B59668482B82F59CO6PR12MB5473namp_
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
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Wednesday, April 20, 2022 5:00 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; dri-devel@list=
s.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; amd-gfx@lists.fr=
eedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: fix ttm tt init fail when size exceeds=
 kmalloc limit</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">Am 20.04.22 um 10:56 schrieb Yang W=
ang:<br>
&gt; if the __GFP_ZERO is set, the kvmalloc() can't fallback to use vmalloc=
()<br>
<br>
Hui what? Why should kvmalloc() not be able to fallback to vmalloc() <br>
when __GFP_ZERO is set?<br>
<br>
And even that is really the case then that sounds like a bug in kvmalloc().=
</div>
<div class=3D"PlainText elementToProof"><br>
Regards,<br>
Christian.</div>
<div class=3D"PlainText elementToProof"><br>
<div class=3D"PlainText" style=3D"margin:0px;background-color:rgb(255, 255,=
 255)">[kevin]:</div>
</div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">it is really test case from=
 libdrm amdgpu test, which try to allocate a big BO which will cause ttm tt=
 init fail.</span><br>
</div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">it may be a kvmalloc() bug,=
 and this patch can as a workaround in<span style=3D"background-color:rgb(2=
55, 255, 255);display:inline !important">&nbsp;ttm</span>&nbsp;before
 this issue fix.</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)"><br>
</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">void *kvmalloc_node(size_t =
size, gfp_t flags, int node)&nbsp;<br>
</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">{</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">...</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">&nbsp; &nbsp; &nbsp; &nbsp;=
 if ((flags &amp; GFP_KERNEL) !=3D GFP_KERNEL)<br>
</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">&nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; return kmalloc_node(size, flags, node);<br>
</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">...</span></div>
<div class=3D"PlainText elementToProof"><span class=3D"PlainText" style=3D"=
margin:0px;background-color:rgb(255, 255, 255)">}</span></div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">Best Regards,</div>
<div class=3D"PlainText elementToProof">Kevin<br>
<br>
&gt; to allocate memory, when request size is exceeds kmalloc limit, it wil=
l<br>
&gt; cause allocate memory fail.<br>
&gt;<br>
&gt; e.g: when ttm want to create a BO with 1TB size, it maybe fail.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang &lt;KevinYang.Wang@amd.com&gt;<br>
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
</body>
</html>

--_000_CO6PR12MB54733101E19842B59668482B82F59CO6PR12MB5473namp_--
