Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F592ED561
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:21:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 235B56E489;
	Thu,  7 Jan 2021 17:21:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A536E489;
 Thu,  7 Jan 2021 17:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VTb4dUtBC3btDIzPfh4Zth+gx+uuvGsCpe7h4G3FBFAzkzdlpDhnASDo9fdDyMhoAgnzqaW55wCjGgBqw4pp8p2TFb9RKCnwBhdJ0pPKzUDvateGkI0zXY0f7sqmu92nEzOhjxJ1g1Zt5C7UoVWmttrCu49dvj+a1nSZopEmzHJjdnFnP3KIZn7FLjtBMIfzyh27N48DTs2/Dlzm0O4cdpejY/IKTh2aMygPfdJxktvgAB/G7QLA19+S/lIhzq8buFz8vhN+9mxFuAWg9X0qO5zAwBwyYD8VU8xpf8S0N+fHmbLtxCLUfQr+uLcnGS0ZADHerz7SpKxxhR3J9KlbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3ZOj/Z5Zcm2AmYwu3D3Fh686yykaJi3Ad/Y9bH5HdQ=;
 b=fgSoS4O+8liewd+Pf1FG3shBHwCuZ9VWy7veUheHSiAY80TmguJhQ0W9TptJ5Z75VuFVHIh33yN+twxWWvaWWRIojVfWiSSV/hyDXm4xSzpfgE0+kSVI2XU5aSeKEduKhBIn11pIBu+miB/kv3DRKFZfCQ/E18EScAlfNScIzj2cVpZeUzqhRJ9if+yiqvQz7a2cTccA18aQp07VzUiaA/TQbjKjPHokmWBq5hezhJ6t3IrrTxYeOmUP6pLgk+KnGjP+rx0biio3u6VMSWSHVs+51NQfyPfz9YiMSS22B2rC3kQ4oKNZCr1JwPUIXHMv/JaADqH0VlCdSGUexhLksg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e3ZOj/Z5Zcm2AmYwu3D3Fh686yykaJi3Ad/Y9bH5HdQ=;
 b=IeuX1svtD1mPmedS8usOtWdJzMPRzUjUF6f/fIfpwaj7+EdiatQmArOmCPVMEENUy5lUxwnZWuNVtYX+sT8/yqH97cquMnm7kYvXKNlCrAaZixww2Ll7ezH2VoomICzjc4hU4JkzUNETzbK3XFQ1oJjO8bNIrwNRM1ge8mV1o4c=
Received: from DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28)
 by DM5PR12MB1324.namprd12.prod.outlook.com (2603:10b6:3:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20; Thu, 7 Jan
 2021 17:21:32 +0000
Received: from DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0]) by DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0%7]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 17:21:32 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: 'Bas Nieuwenhuizen' <bas@basnieuwenhuizen.nl>, 'Mario Kleiner'
 <mario.kleiner.de@gmail.com>
Subject: RE: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Topic: [PATCH] drm: Check actual format for legacy pageflip.
Thread-Index: AQHW4Q/ijhWSZnncqUOk53kroda28KoUdpYAgANS5wCAACfwy4ACxqrQgAG371A=
Date: Thu, 7 Jan 2021 17:21:32 +0000
Message-ID: <DM6PR12MB297104CA9471887DE00F64489EAF0@DM6PR12MB2971.namprd12.prod.outlook.com>
References: <20210102140235.514039-1-bas@basnieuwenhuizen.nl>
 <CAEsyxyheUd-jyd7X=7HJcOWqcrHgwsTAFyVhW9rJhutEdb=6MQ@mail.gmail.com>,
 <CAP+8YyHJpE39aea8OhGuQNjaGjLq4vcK-hNL+pC_wL5qsHwv2A@mail.gmail.com>
 <DM6PR12MB29719139A32F7BA9037AA45B9ED20@DM6PR12MB2971.namprd12.prod.outlook.com>
 <DM6PR12MB2971F5C08DA2DB1646E9FC379ED00@DM6PR12MB2971.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB2971F5C08DA2DB1646E9FC379ED00@DM6PR12MB2971.namprd12.prod.outlook.com>
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
x-ms-office365-filtering-correlation-id: 8f7e5712-8abf-49f3-25f5-08d8b330adba
x-ms-traffictypediagnostic: DM5PR12MB1324:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB132492B524C4B83D149290389EAF0@DM5PR12MB1324.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r5LTw1IJhUIJIojbPCYF+U83UZ13NShU0V3baodWZ58jJ7XJtmhIAOTWAoBptg4tNqwXH9V+Z5Nk+HcWuzkhJ47t58APuFNrZLo9YDf/nouyubGYnmCUomze6u3ei27BN5CqBK7NVuS6Ry/Yu3IaM5zdsC3fgeaw+sPdiDClywRX8oh69KlJwUFycCXYRPm6JJYbllKUeBCGt2dQmnG8XUhXdrrIa0j3IwQZiXa/hdUIYkrM2+dEpuLl9G3HpUUmQS4TVpY21KNHjD3EAwP3CiEuR+y3EDyFXb4P47fzJwGmOVJ4fJo9mM55AUJiCiyx2nCbXNJMwD0vJe1KctJSiSdoNgRjXp7HAtoy0d8osj/ESmEs+RURnFCllrvz2Z8PwdGf3yV49+MrAcFLeFUyuA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2971.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(396003)(39860400002)(366004)(346002)(66446008)(4326008)(55016002)(33656002)(66946007)(66574015)(5660300002)(110136005)(26005)(66476007)(9686003)(86362001)(478600001)(76116006)(2906002)(64756008)(66556008)(71200400001)(6506007)(53546011)(83380400001)(7696005)(8676002)(316002)(54906003)(52536014)(8936002)(186003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?gM1Tmc7ReM0nHdTMRm42gn2YegimG6rpOjGupvusJ6uby2uXVBbMuNUUl7?=
 =?iso-8859-1?Q?Je0fUr0I78a2e1tY4DNJZnPrMn3DrpKLPTUurSRCPuoTsydGDnDNxwScdb?=
 =?iso-8859-1?Q?hWHeWnEMqsdJFdDq70u2UCh8On+47esO5Vy2DeWYmD+KQZDwY8aAvHMLST?=
 =?iso-8859-1?Q?5gLPGXHmKExCu1yA1xrJJ3Ac2otX8GomPcnBZU2PN/VS25dYcQ+SgHS5Uz?=
 =?iso-8859-1?Q?MQAeetMy64Vg7t1nusKspuMtZUAJd9g4vfPic+TXnZ8j6ls9TaIYBMSOap?=
 =?iso-8859-1?Q?VqbhuOPm1jqoO8/iCi/meBB+VQXuz+CNDQXEWZ8A98mYEMye8IRODqXCqr?=
 =?iso-8859-1?Q?2NIGKQHKKosUoAwQv1l3VdV2L0LL8GVXtCmNPF03b+wxWCb7kcCfi/Qf/V?=
 =?iso-8859-1?Q?8pjJ66l0BWuQDhr4bApjwxeHaYZtxz0pjYDnDLngEWpAv0+ptt0MNQOw4w?=
 =?iso-8859-1?Q?ly3ImrXwPtq4VBggYHJUVHizUneEyS+11NmBZBC6QS8VO0GLoVsKre92wh?=
 =?iso-8859-1?Q?DsCzb4+vsnorPWRNuWb2MGLhnici7boX07/HjUp5cjWj2vusPpoGbf9w0g?=
 =?iso-8859-1?Q?qo+vvpQV0ZLv3qX4FVc7T2w+V2kZpcdoVlOnrBmjIHnrW2UFwdW88Ol5RT?=
 =?iso-8859-1?Q?PkDROTxHS4yBuxiQibauzebr0TD5E/PtgXk4df4br7jq7ek4w1nTeD05uH?=
 =?iso-8859-1?Q?PieLFNYlS9yzMzoKcO3c3bxGuzKDilLfhpj1QeTJJWqcu+PWPdB7R8hl2W?=
 =?iso-8859-1?Q?21c4YzvXTuwOFxB8kMlEKK8x0ixSGMu/Yq41Avg4bUaC0mLsW2xPzMrb5h?=
 =?iso-8859-1?Q?ZGdSbGfiQy2kW8ctZgK7E4DgsBAA+BDirpl3FUyRb7TAcK5+hFiR/gsRzz?=
 =?iso-8859-1?Q?SsZjw5QfU89DUuIsj8OMgRAsRJpmmFaXQzf7gQzxSa+9ZpST9U2/Pt0PGb?=
 =?iso-8859-1?Q?ZdjSaUFq5ZpYOAafjkF8yGHKhokISx1AYwI3IEthC8X3AKO50AxVDV7NA1?=
 =?iso-8859-1?Q?Ibiu0hReorVoDMYCo=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2971.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7e5712-8abf-49f3-25f5-08d8b330adba
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 17:21:32.6805 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X7ubQ3NVkNGHIBxc9Juek37TZBBVZr8Eye/WyAvCzMyR3It5b7OOfwmG/jvjK8hh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1324
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
Cc: 'Daniel Vetter' <daniel.vetter@ffwll.ch>,
 'amd-gfx list' <amd-gfx@lists.freedesktop.org>,
 'dri-devel' <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only - Internal Distribution Only]

> -----Original Message-----
> From: Liu, Zhan
> Sent: 2021/January/06, Wednesday 10:04 AM
> To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Mario Kleiner
> <mario.kleiner.de@gmail.com>
> Cc: dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> gfx@lists.freedesktop.org>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Ville Syrj=E4l=E4
> <ville.syrjala@linux.intel.com>
> Subject: RE: [PATCH] drm: Check actual format for legacy pageflip.
>
>
> > -----Original Message-----
> > From: Liu, Zhan <Zhan.Liu@amd.com>
> > Sent: 2021/January/04, Monday 3:46 PM
> > To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>; Mario Kleiner
> > <mario.kleiner.de@gmail.com>
> > Cc: dri-devel <dri-devel@lists.freedesktop.org>; amd-gfx list <amd-
> > gfx@lists.freedesktop.org>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Daniel Vetter <daniel.vetter@ffwll.ch>;
> > Kazlauskas, Nicholas <Nicholas.Kazlauskas@amd.com>; Ville Syrj=E4l=E4
> > <ville.syrjala@linux.intel.com>
> > Subject: Re: [PATCH] drm: Check actual format for legacy pageflip.
> >
> >
> >
> > + Ville
> >
> > On Sat, Jan 2, 2021 at 4:31 PM Mario Kleiner
> > <mario.kleiner.de@gmail.com>
> > wrote:
> > >
> > > On Sat, Jan 2, 2021 at 3:02 PM Bas Nieuwenhuizen
> > > <bas@basnieuwenhuizen.nl> wrote:
> > > >
> > > > With modifiers one can actually have different format_info structs
> > > > for the same format, which now matters for AMDGPU since we convert
> > > > implicit modifiers to explicit modifiers with multiple planes.
> > > >
> > > > I checked other drivers and it doesn't look like they end up
> > > > triggering this case so I think this is safe to relax.
> > > >
> > > > Signed-off-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> > > > Fixes: 816853f9dc40 ("drm/amd/display: Set new format info for
> > > >converted metadata.")
> > > > ---
> > > >  drivers/gpu/drm/drm_plane.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_plane.c
> > > > b/drivers/gpu/drm/drm_plane.c index e6231947f987..f5085990cfac
> > > > 100644
> > > > --- a/drivers/gpu/drm/drm_plane.c
> > > > +++ b/drivers/gpu/drm/drm_plane.c
> > > > @@ -1163,7 +1163,7 @@ int drm_mode_page_flip_ioctl(struct
> > drm_device
> > > >*dev,
> > > >         if (ret)
> > > >                 goto out;
> > > >
> > > > -       if (old_fb->format !=3D fb->format) {
> > > > +       if (old_fb->format->format !=3D fb->format->format) {
> > >
> >
> > I agree with this patch, though considering the original way was made
> > by Ville, I will wait for Ville's input first. Adding my "Acked-by" her=
e.
> >
> > This patch is:
> > Acked-by: Zhan Liu <zhan.liu@amd.com>

Since there is no objection from the community on this patch over the past =
few days, and this patch totally makes sense to me, this patch is:

Reviewed-by: Zhan Liu <zhan.liu@amd.com>

>
> Ping...
>
> >
> > > This was btw. the original way before Ville made it more strict
> > > about
> > > 4 years ago, to catch issues related to tiling, and more complex
> > > layouts, like the dcc tiling/retiling introduced by your modifier
> > > patches. That's why I hope my alternative patch is a good solution
> > > for atomic drivers while keeping the strictness for potential legacy
> > > drivers.
> > >
> > > -mario
> > >
> > > >                 DRM_DEBUG_KMS("Page flip is not allowed to change
> > > >frame buffer format.\n");
> > > >                 ret =3D -EINVAL;
> > > >                 goto out;
> > > > --
> > > > 2.29.2
> > > >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
