Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB95450A04B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 15:03:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 814A810E251;
	Thu, 21 Apr 2022 13:03:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC7CA10E157;
 Thu, 21 Apr 2022 13:03:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B5H3Q7fIQMz7GIMvlAc0gU/cod7sI/1oGoBBYNgAPUi+wJqAbQapPsVFEapJ8S0h8YfQbNv776zJDqXJeiV3qicbcUN10IvMTE1IOBnb/5EE0ok656dK4FWqJFDbHINQ6yLv0zrr2Idh0gl9rMIL5GrUEk2pZx/31ZMDpZ5c+mUDbCMWVZCZUzBV3zFYord6wEef2b6DB01jDKVjZk514AdlJsIystmWV7K+DM72CWMnCbx9hUbh2mgveE8w/W6gTBiN9qxqfa9uiqQg1NLLIp24wupIivoavD7aPPugI5beTSqUbdcfkP9HXxUc+mL6uJFMocgkgHC00eoYbEcrgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rx19ZyAX/RtOzSF4zvCaVgsP2owJ0SGt7APWBj0Bro=;
 b=n17vaw0pwR5vRR+ojct6IlDXaXlXTtBFc1C+qdJTVDhIggk5QNg8pQM3Helxb0gurGZKAGh58ljdYi3wJhR9cCiZeleMYWSc58kPTeuql/g7hUfTT9YFyerVT9jU1PG+IeEDaM/YSQAy3MNcEhUBBD49EzJ25PW0jgkl32YD8fUUvyOpTLWs89Gno4vyqUCDK7XtizIVh5knSt6v2WAVhe77Dphp/cfR5/RX5pSTa1S1c3uLL4tsMzdGcjfCTjDbtPtnqFGt3NrQpE6wHqk9w7Vzr2TNAbpQq0KYVUhLnBxLlm+kN8W3u5s/R1sTlIYsFp9VDZCSxqFwMoc0FjR6uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rx19ZyAX/RtOzSF4zvCaVgsP2owJ0SGt7APWBj0Bro=;
 b=WNSkuNw48SpVy1FzUDgSJ9Hohv3qqFZYhyQ6LSHrEZC/D3FvUI7TkhMRjYKHT9JISI/dEV5Ss0QIj1J/kqMGLezBT0disYiRoOKJwJ8WdJgFQzKosGK9pIyrTokNV0jGIpdcFan79okCZSnFwdU1b270d0CUjDxXBY7qpKVJs7A=
Received: from CO6PR12MB5473.namprd12.prod.outlook.com (2603:10b6:303:13e::8)
 by DM6PR12MB4338.namprd12.prod.outlook.com (2603:10b6:5:2a2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 13:03:39 +0000
Received: from CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef]) by CO6PR12MB5473.namprd12.prod.outlook.com
 ([fe80::28df:431f:d965:e6ef%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 13:03:39 +0000
From: "Wang, Yang(Kevin)" <KevinYang.Wang@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_array() in
 ttm_tt
Thread-Topic: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_array() in
 ttm_tt
Thread-Index: AQHYVXw24+Og54bItEuS2JH63Iioiqz6UT+AgAAD/Ig=
Date: Thu, 21 Apr 2022 13:03:38 +0000
Message-ID: <CO6PR12MB5473DC13AAF4C88D8A3F3C4B82F49@CO6PR12MB5473.namprd12.prod.outlook.com>
References: <20220421123442.1834102-1-KevinYang.Wang@amd.com>
 <60be4755-47ac-cb5e-1486-d9b42cf43b49@amd.com>
In-Reply-To: <60be4755-47ac-cb5e-1486-d9b42cf43b49@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2022-04-21T13:03:38.252Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4f2f45f5-9a1b-4222-d769-08da23975a5f
x-ms-traffictypediagnostic: DM6PR12MB4338:EE_
x-microsoft-antispam-prvs: <DM6PR12MB4338BF62F31EEAF87F1E649B82F49@DM6PR12MB4338.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SoD7hwx19hmdD6NnpPc4RzrgkLowYqNoE4NMmm1uS/FSYWXFz41P28d5rdAG6jFKDOfszcVeoRndvRT018vwUtIq52a/nTdz9415b8B6YzJ/oH01A7Ott5ySRDmigl7bGraWhkK1bx4aWxhLKMxlokHHkThXPJEcvddBPHpBkvx3iBjN5v5pNjkfYPiwcwV8mvbdjgDPrUqr3kpnYfmiRi9YYlMLFaCNSARbuHO67wvf11OMoRlE/z45QudjXmTgZ+TM4lqo9FrMJOCPx6p/hhMEpzObxSHeYmgnUimieFiOyehVn2uV5ttYUw26Pl43RdW7wxlfrwlxki4GCLFLnxgIAQWcHlGOBT15UbCU3nLGJWYHySxsOb5+LDW4VKQMkjARsUKs4XsCfEwH5JZLrcJoi9+auMoF6vxr12ROLnov8RWbPsPBAGVdnKfCKAWgmJbhtwA2NN6YNONTCh8gMVio5FoN0dkMmnQbDgqcJVnuU8CFvEShoZEp/sF4eh0YmQS+0SI6hE8vEEr36q0YjEhCNqjeZfI7byUMCiI9GG66JnDDaXtRRPphYKteQkzcOe1ogAfGzPronEvN8LPHZgzywV4JYq7TvvjX3gy/Rud/eHzibymspZuIm5/DpcJHOtywdmvCLSQag+i6z1YUhw44iABvEEvHvrYe3NWMxuICOuYeQQ6HQhWfrjliAAlPOMmaVkKj30Pde1y7oSThLA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52536014)(316002)(86362001)(508600001)(66446008)(26005)(19627405001)(110136005)(76116006)(8676002)(54906003)(186003)(66476007)(66556008)(71200400001)(66946007)(4326008)(91956017)(33656002)(83380400001)(450100002)(64756008)(5660300002)(55016003)(6506007)(53546011)(122000001)(7696005)(2906002)(38100700002)(8936002)(9686003)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?HD/G4OlpZdI7r0PUzdRCcfFIdFnsPZcspXcmVMO7039ucZJeO+TgBJDU1o?=
 =?iso-8859-1?Q?3Njao7m1GAXBxYrhGIaC9dUK968vAYSbwaJSdc83gISn7+aH3K5DmeEtet?=
 =?iso-8859-1?Q?EgKqhyhnEVtzD/kpSpsl+LecMgGtxfdlCLU4DHsvUFbIAsK8WXk+ebeplV?=
 =?iso-8859-1?Q?aAs3Rnb6Ttpu+R6GA+HjXPCJHIEkWkYQO1cS6RumIyFqA5+kFbtNdIi/CD?=
 =?iso-8859-1?Q?9EGwSgappI2e79QGuU2Pzu79nTy2hnI7aTqPUTJiFE+QBIlRhr7t4fBXmC?=
 =?iso-8859-1?Q?PKQjCebYMoclIDDQwl8dnGFHxiyYWBjndNnO9pSQcS1oOe5RHgsCdh0v5t?=
 =?iso-8859-1?Q?NdQgc0jDbl3pjY9OVzYT5AlxZOcPRykwD1Nqh1DeGuAsrKXS3FStiOABdL?=
 =?iso-8859-1?Q?ERVsB3mOsHkFrJO/4M56y7m2drLQzvzJvHEeW1Ufg8ShIITJV92i9S/b1Q?=
 =?iso-8859-1?Q?YOAs//dT0l4UOGP9gh9Z5wbJR49CwHL6jN9+lI0tNZWtOK31rTGFTaPL4f?=
 =?iso-8859-1?Q?NKgsvIDw4g+8vQo6mB5hmXE9BNg3mdX84Vs/shOxMKcI8ZvwKHQsArb/6w?=
 =?iso-8859-1?Q?WQIA0RqDsD8Y1R+XEXFHkNOM5j4pU/X6Rm+EZqs1C6URQ4pnPrnSoUtC0u?=
 =?iso-8859-1?Q?L9DN3nBhikbTNlye01DOSVWtQwkwzt8blpv4XFYSmp0RfLPGsfes/541Bf?=
 =?iso-8859-1?Q?W6w5bbSGhH5jwYn17s/BwHrz0P3YhheC3RwT7xGVqkBgnijcuEpGhG+mHK?=
 =?iso-8859-1?Q?ZhCRcHNrJERKz6pPepoPZ5sPhp0oC3TOYGQtWIDuTm8fxuMxV8sNfHrxPP?=
 =?iso-8859-1?Q?EYFs+p+vLoJ4QkBWh5YmETTsjhgzZDd947cf0Ry+oVDmKY2NHI7XuXJJA6?=
 =?iso-8859-1?Q?b290KD4NzGfyyEEMLv+xboY11TTrpHPI0aJa0hlMhh1aD+m342BUYtGKCV?=
 =?iso-8859-1?Q?j3lTWveDQsPD/2b9Y14gHT57UMNqAzMqxOaHBZQWxbr8/B3UowaOO/GNwq?=
 =?iso-8859-1?Q?mZ/Px/1X1Zk3v26ZXGnIJJssLYW0YAcRC+oeFLEm6k4eCNRt7yjKmgLQBx?=
 =?iso-8859-1?Q?lgedZOF/hcrf++ZBvZxbdH8OX3fPOvz94r48G49A1WWKNNU0/6kMBIFgPw?=
 =?iso-8859-1?Q?5LdsLRGte7SuTR1WwNnL1Ad8bJel/xCfszZ5VhwcIcyHv0gAb7rr9OR/tV?=
 =?iso-8859-1?Q?hhiArvT8d9DohPuwlpfjmixVPPac8M2EInESNt4Uw1K1QKzZiL9nW3iQU1?=
 =?iso-8859-1?Q?WkEYREMhzlF4u6i3cZzIhjlQmYB3VcqscJBcMKRsfUIL4OHO1dEAigRzK9?=
 =?iso-8859-1?Q?U+MaC+aBJJOxTFX9MJ2T4MUwGTUc0/liRFnP8kpe6jAiFs0+nPEbO52cKE?=
 =?iso-8859-1?Q?TOHlAH7J+RLSmYFMfxi+hGR4qbFc9asGPtaLqIwY3cQg3/e4aC5kVOkX+h?=
 =?iso-8859-1?Q?Wi/2hsvXE1DZM+bQqnTCgMC4YIeBxEkeNQ8WXqzerEM8M8OqWXNw6/sFGQ?=
 =?iso-8859-1?Q?ILU94+WXDsEe8eeiB/7k5pe3wpTBx1PqOBu6WNhVT3NENqmGQkEDg0gwq1?=
 =?iso-8859-1?Q?+Oe7WkU7rklqjXISB/Qmf0F8CZuqngHQcOpQv98DJMcZLgJdgERhkuUdG5?=
 =?iso-8859-1?Q?WWkstv8o0m1hZ1pME47b+Dxo9x8UiQl4ci8k99JtEQVHGR35qoRDoHjsy2?=
 =?iso-8859-1?Q?MuvJyHb+0GLAv/xr4PoVZXiWWqFRrnsxEncdQlA3G/X3D6JIHnTh/5iRCu?=
 =?iso-8859-1?Q?g/8whHNR+4F2jht6/fmgWyPVgTraCzeXyvi9f9my8kVF1K?=
Content-Type: multipart/alternative;
 boundary="_000_CO6PR12MB5473DC13AAF4C88D8A3F3C4B82F49CO6PR12MB5473namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2f45f5-9a1b-4222-d769-08da23975a5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Apr 2022 13:03:38.9297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BgkallBOdvk40OCoSJ/vD5LlCgCa88fMmmzT6D+NFPbgHqthRbn1A3BeoVJ/XlNo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4338
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
Cc: "Kuehling, Felix" <Felix.Kuehling@amd.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_CO6PR12MB5473DC13AAF4C88D8A3F3C4B82F49CO6PR12MB5473namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Thursday, April 21, 2022 8:48 PM
To: Wang, Yang(Kevin) <KevinYang.Wang@amd.com>; amd-gfx@lists.freedesktop.o=
rg <amd-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-de=
vel@lists.freedesktop.org>
Cc: Kuehling, Felix <Felix.Kuehling@amd.com>; Lazar, Lijo <Lijo.Lazar@amd.c=
om>
Subject: Re: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_array() in=
 ttm_tt

Am 21.04.22 um 14:34 schrieb Yang Wang:
> simplify programming with existing functions.
>
> Signed-off-by: Yang Wang <KevinYang.Wang@amd.com>

With a minimal style change reviewed and pushed to drm-misc-next.

Thanks,
Christian.

[kevin]:
it is ok, thanks.

Best Regards,
Kevin

> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 79c870a3bef8..cbb3d1fb4caf 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -96,19 +96,20 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool =
zero_alloc)
>    */
>   static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -     ttm->pages =3D kvmalloc_array(ttm->num_pages, sizeof(void*),
> -                     GFP_KERNEL | __GFP_ZERO);
> +     ttm->pages =3D kvcalloc(ttm->num_pages, sizeof(void*),
> +                           GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
> +
>        return 0;
>   }
>
>   static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -     ttm->pages =3D kvmalloc_array(ttm->num_pages,
> -                                 sizeof(*ttm->pages) +
> -                                 sizeof(*ttm->dma_address),
> -                                 GFP_KERNEL | __GFP_ZERO);
> +     ttm->pages =3D kvcalloc(ttm->num_pages,
> +                           sizeof(*ttm->pages) +
> +                           sizeof(*ttm->dma_address),
> +                           GFP_KERNEL);
>        if (!ttm->pages)
>                return -ENOMEM;
>
> @@ -118,11 +119,13 @@ static int ttm_dma_tt_alloc_page_directory(struct t=
tm_tt *ttm)
>
>   static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *ttm)
>   {
> -     ttm->dma_address =3D kvmalloc_array(ttm->num_pages,
> -                                       sizeof(*ttm->dma_address),
> -                                       GFP_KERNEL | __GFP_ZERO);
> +     ttm->dma_address =3D kvcalloc(ttm->num_pages,
> +                                 sizeof(*ttm->dma_address),
> +                                 GFP_KERNEL);
>        if (!ttm->dma_address)
>                return -ENOMEM;
> +
> +
>        return 0;
>   }
>


--_000_CO6PR12MB5473DC13AAF4C88D8A3F3C4B82F49CO6PR12MB5473namp_
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
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Thursday, April 21, 2022 8:48 PM<br>
<b>To:</b> Wang, Yang(Kevin) &lt;KevinYang.Wang@amd.com&gt;; amd-gfx@lists.=
freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.free=
desktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Kuehling, Felix &lt;Felix.Kuehling@amd.com&gt;; Lazar, Lijo &lt;=
Lijo.Lazar@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: use kvcalloc() instead of kvmalloc_arr=
ay() in ttm_tt</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText elementToProof">Am 21.04.22 um 14:34 schrieb Yang W=
ang:<br>
&gt; simplify programming with existing functions.<br>
&gt;<br>
&gt; Signed-off-by: Yang Wang &lt;KevinYang.Wang@amd.com&gt;<br>
<br>
With a minimal style change reviewed and pushed to drm-misc-next.<br>
<br>
Thanks,<br>
Christian.</div>
<div class=3D"PlainText elementToProof"><br>
</div>
<div class=3D"PlainText elementToProof">[kevin]:</div>
<div class=3D"PlainText elementToProof"><span style=3D"margin:0px;font-size=
:12pt;font-family:Calibri, Arial, Helvetica, sans-serif">it is ok, thanks.<=
/span>
<div style=3D"margin:0px;font-size:12pt;font-family:Calibri, Arial, Helveti=
ca, sans-serif">
<br>
</div>
<div style=3D"margin:0px;font-size:12pt;font-family:Calibri, Arial, Helveti=
ca, sans-serif">
Best Regards,</div>
<span style=3D"margin:0px;font-size:12pt;font-family:Calibri, Arial, Helvet=
ica, sans-serif">Kevin</span><br>
<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/ttm/ttm_tt.c | 21 ++++++++++++---------<br=
>
&gt;&nbsp;&nbsp; 1 file changed, 12 insertions(+), 9 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt=
.c<br>
&gt; index 79c870a3bef8..cbb3d1fb4caf 100644<br>
&gt; --- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; +++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
&gt; @@ -96,19 +96,20 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bo=
ol zero_alloc)<br>
&gt;&nbsp;&nbsp;&nbsp; */<br>
&gt;&nbsp;&nbsp; static int ttm_tt_alloc_page_directory(struct ttm_tt *ttm)=
<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_array(ttm-&gt;num=
_pages, sizeof(void*),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO=
);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvcalloc(ttm-&gt;num_pages=
, sizeof(void*),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static int ttm_dma_tt_alloc_page_directory(struct ttm_tt *=
ttm)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvmalloc_array(ttm-&gt;num=
_pages,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;pages) +<b=
r>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_addres=
s),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL | __GFP_ZERO);<=
br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;pages =3D kvcalloc(ttm-&gt;num_pages=
,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; sizeof(*ttm-&gt;pages) +<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;pages)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt;&nbsp;&nbsp; <br>
&gt; @@ -118,11 +119,13 @@ static int ttm_dma_tt_alloc_page_directory(struc=
t ttm_tt *ttm)<br>
&gt;&nbsp;&nbsp; <br>
&gt;&nbsp;&nbsp; static int ttm_sg_tt_alloc_page_directory(struct ttm_tt *t=
tm)<br>
&gt;&nbsp;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D kvmalloc_array(ttm-&=
gt;num_pages,<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; sizeof(*ttm-&gt;dma_address),<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; GFP_KERNEL | __GFP_ZERO);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; ttm-&gt;dma_address =3D kvcalloc(ttm-&gt;num=
_pages,<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(*ttm-&gt;dma_addres=
s),<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; GFP_KERNEL);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ttm-&gt;dma_address)<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; +<br>
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

--_000_CO6PR12MB5473DC13AAF4C88D8A3F3C4B82F49CO6PR12MB5473namp_--
