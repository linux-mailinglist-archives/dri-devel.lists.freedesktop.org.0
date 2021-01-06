Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 901A52EC010
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 16:04:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7DEF6E209;
	Wed,  6 Jan 2021 15:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750075.outbound.protection.outlook.com [40.107.75.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB7C6E226;
 Wed,  6 Jan 2021 15:04:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fY1PTRccgJB725cgkz1kxaQAKPIwfASHP8/M2Upts7T/WUe5ZJN5ruKQGPGSU2IUlE3PQ0rVHsuHYOfoyUYdZJcXosp6U4ExFAyTg6YVLjshCuTfD2rI2kWVnYsfDhJhr0OXfg0GQpcYiYLHcDf/SKusgHLdRng40tFTbeSEeXwhAWvahtWrdSedZmo2Ye8LUkmc6+P5pfZoRrila5N91l77gNDwYoNVcMQahnFTha2RcUxdu6fMp8Dcz3Ei2+ACrd0A3dOXhk303C28+Aa3gQMhx8b3CbTThDDHfn3Ji1BaIPtomyEBjMBL6fkRfC9na9jeiCHXrIb2p972PhrjJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvxD12I0Bh0M5viuYhZ0d9rAiBlyJV9beJa5Kk9nR6Q=;
 b=lilOrV1jTi2Y2C5OBjtJGLxEFwOOon9tM0xcWQP5uyJsDsCaTcUlLENZBxxXdGuXfMX2BdMvBLACGGaWOskpub1WXRYJ7nWP/+YZcOBu83Y8PdHZu+dUtaujcNgWw/pHKmKN2SJ8M80umJqdjJC7GliP7V/hLBmv3IFKkwTRe0dj4HwRTcn10F6n3AQS1WuvjRzJO/xOd8/8lI7cCpBRAHo7m/eYajqD72iI//487XjeGSj1viPGRDrTc2WJF/sCnnAgiwe5Eso8dv8G56hXT/6Wuz8XoscVwmKZvO3eh8FX/9e0DZonk9sYhy0YtNJegPEMiTHIjbObU5FZtnW8tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CvxD12I0Bh0M5viuYhZ0d9rAiBlyJV9beJa5Kk9nR6Q=;
 b=fVjcN5GKS8ksWIPD7J+8Ti0+FYDOeiW888eP+036z12fHXDFRktKdTgcSIx7HgrwLTiU6LasAWQcSUealJECUFRtMmSjWv8O0OdWwpO4Hpx2V5tdhe4SBiTGW//SyJIhJJG3Gm/N6z8Y5wcJ7Oq5XG40gEpuUMEypvEdofGliWs=
Received: from DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28)
 by DM5PR12MB1593.namprd12.prod.outlook.com (2603:10b6:4:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Wed, 6 Jan
 2021 15:04:04 +0000
Received: from DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0]) by DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0%7]) with mapi id 15.20.3721.024; Wed, 6 Jan 2021
 15:04:04 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Mario Kleiner
 <mario.kleiner.de@gmail.com>
Subject: RE: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Topic: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Index: AQHW4Q/ijhWSZnncqUOk53kroda28KoUdpYAgANS5wCAACfwy4ACxqrQ
Date: Wed, 6 Jan 2021 15:04:04 +0000
Message-ID: <DM6PR12MB2971F5C08DA2DB1646E9FC379ED00@DM6PR12MB2971.namprd12.prod.outlook.com>
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>,
 <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
 <DM6PR12MB29719139A32F7BA9037AA45B9ED20@DM6PR12MB2971.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB29719139A32F7BA9037AA45B9ED20@DM6PR12MB2971.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-01-04T20:45:58.803Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: basnieuwenhuizen.nl; dkim=none (message not signed)
 header.d=none;basnieuwenhuizen.nl; dmarc=none action=none
 header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: d72afc85-b2f8-4af8-6b70-08d8b2544ef3
x-ms-traffictypediagnostic: DM5PR12MB1593:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1593CB0971250ADC293F0B5F9ED00@DM5PR12MB1593.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Jp7xG1Ya01qE5ou1uIyvIAB+B32JqruD+0JyKAZocphc78M1/GyiyoJ5Icbh0mpPjbemLkPuK6aXxwU38K6mcs4zSgVo0gD4tTd5EvIDVymz/KHriBQ8xintbrc0+3XqeAzs6rUtx4/juRGm8KAdbaxQeAi2LsKiqAMD1Esct1gXWoraibmVNNIQzBNBhKhAY1zsLTZmn5MF4Vy7Fv2Pqy0y/oEdfyNlXkMHMHDFDby6LCKRT9B2sby73ITw6pJQPVBuD4rHnO/N28BvfTCSEPuPvBf3cX6x2zgTMMoNi2nPHmF8YxI+0fTVv/FuDWGM/Ku+D16e+RnL1fA93mi3nqZ9ccXTu1SPJzTCo4jIV2zmZCnOVzuk7/ISSzKq9ytmpDDkaaKLhY5qfeJXckFSA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2971.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(83380400001)(52536014)(71200400001)(4326008)(2906002)(66574015)(478600001)(33656002)(8936002)(186003)(55016002)(66946007)(66556008)(76116006)(64756008)(66446008)(66476007)(5660300002)(54906003)(26005)(6506007)(53546011)(9686003)(8676002)(7696005)(110136005)(86362001)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?yJs03B28mGaODuhnDSDrwMMVP4ooblJ3YglCsiGkMTFBcxgZPu4F3cJ47T?=
 =?iso-8859-1?Q?wYas+PmLtwol4/WUo+/SVspNlZr17HzIIT+jW1ddACDdNFcOPaWwt8qGVl?=
 =?iso-8859-1?Q?QtxXp7gNLZPD6OmAM7oZrfrL5dyxKYkPhDa42o3DNFNg3p3oQ9p9DxAjFC?=
 =?iso-8859-1?Q?iu5QtDl+1LmNcIf+KU55LUJkWomkHarTAzfTetUygYfcarWjxqeLBTdSHw?=
 =?iso-8859-1?Q?KepIICbFfhw6MhK3NGNXd4yaZoQoHFujMiRbZPhjh09AystPFunqzRvyhu?=
 =?iso-8859-1?Q?eTaeOuCoi4ss2l8qEr9U1ie6kTSieGaZjeiBoOY7yo+VxzEhHKB+7pLTGR?=
 =?iso-8859-1?Q?00UTwIs0Tssp1SDaKYdOJw4+FQFVEZHEOylDxXY1phr7GTwM0Kjcu0zHGe?=
 =?iso-8859-1?Q?hm+C1lb6uWHkeCzA53b5+13QZjoLcDLfeb5sJ8lnvaMEbFGtJqnyTfvX+D?=
 =?iso-8859-1?Q?AVMtksVihw0RWl0N7SPwfYZpjez9pehe54nRG/9rlVjvtHfcbYyEOl4IbU?=
 =?iso-8859-1?Q?hFaBYzReJzZG7XvJScHdI6DZSoWkvpfQC04CZBMrs+lgQnJ3FHew3iY2D1?=
 =?iso-8859-1?Q?+ceiv6TvogFmL3pCjylv9vp7WZ4arcrJRuBz3QC3MS+ceAMNwWDGoRNAYD?=
 =?iso-8859-1?Q?8YSgSdw2fvkwt1KvIo4UmpxQXVYhzi2LZwaUsVGxz7L2tZpE7yMWpN24VQ?=
 =?iso-8859-1?Q?fQ+SxBsqRwr223CAV7psPdv02XdJuCO3rCqiCqAX0UDSDl9K34o6vXC4I5?=
 =?iso-8859-1?Q?W+dyLnks+/SHuN4PYLWiUunVWf+VGTuEtQWqJIXS404oadCs7EThKALvwG?=
 =?iso-8859-1?Q?dT1t8Ep9VEl+5FHeG2YAxHC3Q9qrRvTAFkDZH29GWiuWB1afQOP7Cod94I?=
 =?iso-8859-1?Q?NZHdnZGZQXBTYE+JQa4AKMDtC33AwTBRyxtylre+o7Ej7uVsA214jjxfxq?=
 =?iso-8859-1?Q?pBC9nlqAsJwBv+nfJwDmX+yC356O1eFaHC2tQwPU9jpLoGIP1WnGWjxzt+?=
 =?iso-8859-1?Q?ZbfaBUqeB7A5QxSKs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2971.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d72afc85-b2f8-4af8-6b70-08d8b2544ef3
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2021 15:04:04.3238 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uAGzJcxixLY09VYPPbXaeccDXcFwG+L8UCelb/tdAK+Sl5Hcn2sdyXQni0EmwceI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1593
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

> -----Original Message-----
> From: Liu, Zhan <Zhan.Liu@amd.com>
> Sent: 2021/January/04, Monday 3:46 PM
> To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Mario Kleiner
> <mario.kleiner.de@gmail.com>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> gfx@lists.freedesktop.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>
> Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
>
>
>
> + Ville
>
> On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner <mario.kleiner.de@gmail.com>
> wrote:
> >
> > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> > <bas@basnieuwenhuizen.nl> wrote:
> > >
> > > With modifiers one can actually have different format_info structs
> > > for the same format, which now matters for AMDGPU since we convert
> > > implicit modifiers to explicit modifiers with multiple planes.
> > >
> > > I checked other drivers and it doesn't look like they end up
> > > triggering this case so I think this is safe to relax.
> > >
> > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for
> > >converted metadata.")
> > > ---
> > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > b/drivers/gpu/drm/drm_plane.c index e6231947f987..f5085990cfac
> > > 100644
> > > --- a/drivers/gpu/drm/drm_plane.c
> > > +++ b/drivers/gpu/drm/drm_plane.c
> > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct
> drm_device
> > >*dev,
> > >         if (ret)
> > >                 goto out;
> > >
> > > -       if (old_fb->format !=3D fb->format) {
> > > +       if (old_fb->format->format !=3D fb->format->format) {
> >
>
> I agree with this patch, though considering the original way was made by
> Ville, I will wait for Ville's input first. Adding my "Acked-by" here.
>
> This patch is:
> Acked-by: Zhan Liu <zhan.liu@amd.com>

Ping...

>
> > This was btw. the original way before Ville made it more strict about
> > 4 years ago, to catch issues related to tiling, and more complex
> > layouts, like the dcc tiling/retiling introduced by your modifier
> > patches. That's why I hope my alternative patch is a good solution for
> > atomic drivers while keeping the strictness for potential legacy
> > drivers.
> >
> > -mario
> >
> > >                 DRM_DEBUG_KMS("Page flip is not allowed to change
> > >frame buffer format.\n");
> > >                 ret =3D -EINVAL;
> > >                 goto out;
> > > --
> > > 2.29.2
> > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
