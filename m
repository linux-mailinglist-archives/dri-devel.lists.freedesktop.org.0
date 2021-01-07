Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B652ED5C9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jan 2021 18:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C052D897B4;
	Thu,  7 Jan 2021 17:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169DD89791;
 Thu,  7 Jan 2021 17:38:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxOmuPywvx1kZD8PlGAfkcKwxINcHqfFUbgQg4a3La0P1MJLJg614r3o5rf0RbJjlxPl4t5xBenRpLzE/KHo3g6LOdaD+c89OkaNJ65Vzcnfz0KH9cJy14spYqLovzNRXO5TjWFpNe3U6ujKCKeiDEA2KI19gAT2xfHUItn5xSGxyGDJDGTiUZZKdNZmyMU96zVb593YghMhZmdaMzPo3IULd3LrYvj2ud6CcOADBhkfLO8y6wN8gNl3BQ3vhTur0gyB/vXnS8LO9L+3ifO8gMuK3ChfW40kt/hBdP2YVg8JjsAvmxqvIz+JN3pxXVPdf/WQ74XCe/UYdwUSGiiTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSK1jFoC60Tzb4II0cAo8Po5lB5PBq/d2+J9Nbpvers=;
 b=oJKcBc59IW2pAHqZaB6699pYUKjrF5GcYUBVRu8fGmHUV/LR5pGx8/xq46qHxhdR13DHrOjx3Ve3mdMZAg8YikFg/qQ4euvjy5kwk7J7LjgXbCoEAYt8ufIiTuLhQWXUH9ZgGpuuCpx4/EjtCAOlsJsHH38p+5rJHixQhXNbyzyv/a8WZagmYi6SREEeIyKZiCL5wYRhU4Kckqk+yVQEy4md0yCBNq1ineilWQXpOQhsr6dl1RbBDF10FlBQ9MK0Y6syZDy8Sgr+gAV1d0nbR9OYxDB72Bv9KdxQ0XH66ywRuf3v7LZN2+B7Fz9V2LfaU/7SLLjgLW/QlrPA4dAuEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSK1jFoC60Tzb4II0cAo8Po5lB5PBq/d2+J9Nbpvers=;
 b=SxmVt+wRYoBnWZhFRjn3rKK77qWtObbiIhyzziThrfCjaG5+7PIpz8SCanUlbdc3YTZGeg2P26v8Q6YuLbkXk44QahnFn2altvkos/U0Z7GBdMJQsQowv8XXfToAPLUn2m7TEf614wf4wv/rz3s8m1S2kcE2h4cvaOYw6sitUPw=
Received: from DM6PR12MB2971.namprd12.prod.outlook.com (2603:10b6:5:118::28)
 by DM6PR12MB3788.namprd12.prod.outlook.com (2603:10b6:5:1c5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Thu, 7 Jan
 2021 17:38:49 +0000
Received: from DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0]) by DM6PR12MB2971.namprd12.prod.outlook.com
 ([fe80::64a5:97ca:ceaf:17e0%7]) with mapi id 15.20.3742.006; Thu, 7 Jan 2021
 17:38:49 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
Thread-Topic: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
Thread-Index: AQHW3icZoOQpXY202UyV0mYEAjiYeKoWEhiAgAZn1ICAAABXgA==
Date: Thu, 7 Jan 2021 17:38:49 +0000
Message-ID: <DM6PR12MB297149B4C0BC23E713B03A639EAF0@DM6PR12MB2971.namprd12.prod.outlook.com>
References: <20201229211044.109020-1-zhan.liu@amd.com>
 <81e9467f-3498-2d6a-3822-902f2afb74c9@gmail.com>
 <X/dFvzGu0lIK0mtT@phenom.ffwll.local>
In-Reply-To: <X/dFvzGu0lIK0mtT@phenom.ffwll.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 49cb59e8-21b0-438d-f76a-08d8b33317d9
x-ms-traffictypediagnostic: DM6PR12MB3788:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB378818A7C059D7234EB1E5539EAF0@DM6PR12MB3788.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0Li4jQlOrfEAT0cDBDeQ3YjfTJtU+Fb4iFx6389qhWKRur/dVaZjGy9mC4uWpCymL+79R7cunSy+I3TLu9Z12CQ1+vBlMLG3JdftadU92NEXgWwlUJvoUtGG2GBzRq8uoTAyg+NHC3vq0Y2qnMXBf0qJmaWnaANg4lMlTn424joZyw2ln0ZABzJ4Y5VvPBb6EV0Mpaex1vbimq9hKP9F6w2RV7LtX9+gvKBVQFl/Cdt/sxtdjXsOog56OHWHqSowyYQowJspdWWjX4/ymDzH8xWaDm9qvgZyhdkB33T9y1eQOHGDUbFpTc2+/2BAXEmH+0cBWTG/2+Cc8USRdvKP/tkos+aEnQ5KmJSt7IVYl4EOZlHgIjS/ljhrVEUSbkPqjtdRTKfhOrI1W8TjCOrj4GvMl5oTqbo6xgcVT7CNMV51Xa4VbL42f/TcGdKxC3jL3Kpv+xIKmgYolMiLn9yEw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2971.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(366004)(39860400002)(376002)(396003)(6506007)(186003)(316002)(9686003)(2906002)(66574015)(83380400001)(33656002)(71200400001)(8676002)(64756008)(52536014)(66446008)(76116006)(66556008)(6636002)(66476007)(4326008)(66946007)(7696005)(5660300002)(86362001)(55016002)(8936002)(110136005)(966005)(478600001)(54906003)(26005)(53546011)(45080400002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?xhin1l4jcXRysr0nv1HqIwx86m5KPKdENxZmQXjLww1i9reIjwa0Monjrg?=
 =?iso-8859-1?Q?/mJmadFccFyclEcqpAF9/voWn1zeOB1ZUL23sCXOvYeRCMgbet3u111Sjh?=
 =?iso-8859-1?Q?EKg1yNcQk1K6KuDdWiMxJK0vQ0U7GYby5nXUmLPwIRZsB8S7ypzhLQkLc6?=
 =?iso-8859-1?Q?1bDIElveaiFo050WU6udCC1gsrLQ/dcjBP7E7IAxnKJnLX4/Vl0j4oGcN/?=
 =?iso-8859-1?Q?p0mTq9jSbbOadpYxpyATPLFG7U1l43neJiLlUq0SlauV3GE7Ms3cW+sllp?=
 =?iso-8859-1?Q?qFg315ZnZjGrgbcpZB8q1AKEJEt/CJINnni1B1XlYnGbXAIplWGIteUc9D?=
 =?iso-8859-1?Q?va96I47I9aWlna1l9AAOX6csYBKtbTJETKIUqt3hsJnkh52SePetlwy/7c?=
 =?iso-8859-1?Q?rbZOg2CzLvYyEIfAiQTNUiGLv2MYn6Ie7ZlcVm8/ceeJM04OD1ploPtS98?=
 =?iso-8859-1?Q?pQ2JWiQtsItwNZrZI42rNeKn7XXhmqWsNWj3HQMv+FAxS7Kdp6on/nPOIV?=
 =?iso-8859-1?Q?P1hizBVC94f9D5wbe+ugiwioSfC4DhBttXv5gW9YkDAVt1oqheNLKBsNKV?=
 =?iso-8859-1?Q?eWhUK5sVWo8V5CWodGkqd0DVUeIrBqKD6Uo0sASGmodfFiLodcFFPbkxRP?=
 =?iso-8859-1?Q?eaTB5OyTo1o7OPzNFXTOGZ/0Iz27vRQ+UcpEiKYbYNw3DkZ31lfedDU9Cc?=
 =?iso-8859-1?Q?0wIugI55nS2B5skVvivmkve7E+pN1WFoKL29Kr+uTZAUTDt3AMMRY3eVDl?=
 =?iso-8859-1?Q?e8qE5okKM7ItIVJiDjnOFxwJbQJirv1ChZguxCeAz5/6kf0+8ebFLCRmTF?=
 =?iso-8859-1?Q?FQNFva99W5+ov8+BR7R0AG+b4yIrXbv+Cq+rrI/6a3+sXTMIAiNbuRmDes?=
 =?iso-8859-1?Q?ApSsgq8lW5lfA/PVXzDbX+X/ub3SaxwG9cTB//zWFKRVxsHPGOk2IjhZaN?=
 =?iso-8859-1?Q?i7sxHDCeuc7OxL8HqXfWvNM9VjZ1CTWsfEraprRIQE1TZKOE2oxZYBe8WP?=
 =?iso-8859-1?Q?L4kS1b5Wfx/YB/788=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2971.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cb59e8-21b0-438d-f76a-08d8b33317d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2021 17:38:49.6430 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: L7xz2TvjgzhKVwVM3sVMRFPtxdv8UyZ51UH0ALqDE0Kp/shk7T7Y+hZNIamVo2A2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3788
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
Cc: "Wang, Chao-kai \(Stylon\)" <Stylon.Wang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Cornij, 
 Nikola" <Nikola.Cornij@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Daniel Vetter <daniel@ffwll.ch>
> Sent: 2021/January/07, Thursday 12:33 PM
> To: Koenig, Christian <Christian.Koenig@amd.com>
> Cc: Liu, Zhan <Zhan.Liu@amd.com>; amd-gfx@lists.freedesktop.org; Cornij,
> Nikola <Nikola.Cornij@amd.com>; Wang, Chao-kai (Stylon)
> <Stylon.Wang@amd.com>; Wang, Chao-kai (Stylon)
> <Stylon.Wang@amd.com>; dri-devel@lists.freedesktop.org; Kazlauskas,
> Nicholas <Nicholas.Kazlauskas@amd.com>; bas@basnieuwenhuizen.nl
> Subject: Re: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer
> format during page flip
> =

> On Sun, Jan 03, 2021 at 04:43:37PM +0100, Christian K=F6nig wrote:
> > Am 29.12.20 um 22:10 schrieb Zhan Liu:
> > > [Why]
> > > Driver cannot change amdgpu framebuffer (afb) format while doing
> > > page flip. Force system doing so will cause ioctl error, and result
> > > in breaking several functionalities including FreeSync.
> > >
> > > If afb format is forced to change during page flip, following
> > > message will appear in dmesg.log:
> > >
> > > "[drm:drm_mode_page_flip_ioctl [drm]] Page flip is not allowed to
> > > change frame buffer format."
> > >
> > > [How]
> > > Do not change afb format while doing page flip. It is okay to check
> > > whether afb format is valid here, however, forcing afb format change
> > > shouldn't happen here.
> >
> > I don't think this we can do this.
> >
> > It is perfectly valid for a page flip to switch between linear and
> > tiled formats on an I+A or A+A laptop.
> =

> It is, but that's not the bug here. struct drm_framebuffer.format is supp=
osed
> to be invariant over the lifetime of a drm_fb object, you need to set it =
when
> the fb is created and never change it afterwards. So the patch here isn't=
 yet
> the real deal.
> =

> Also this means the implicit tiling information cannot be changed after a=
 fb is
> created for a given bo, but we've discussed this at length and that limit=
ation
> should be all ok.
> -Daniel

Thank you Christian and Daniel for the input!

Bas recently submitted an alternative patch ([PATCH] drm: Check actual form=
at for legacy pageflip.) =

which addresses the same issue, and his patch makes more sense to me, so I =
will abandon my patch in this case.

Thanks,
Zhan


> =

> >
> > Christian.
> >
> > >
> > > Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> > > ---
> > >   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
> > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > Thanks Nick and Bas. Here is my second patch for review.
> > >
> > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > index a638709e9c92..8a12e27ff4ec 100644
> > > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> > > @@ -832,7 +832,8 @@ static int convert_tiling_flags_to_modifier(struct
> amdgpu_framebuffer *afb)
> > >   			if (!format_info)
> > >   				return -EINVAL;
> > > -			afb->base.format =3D format_info;
> > > +			if (!afb->base.format)
> > > +				afb->base.format =3D format_info;
> > >   		}
> > >   	}
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-
> devel&amp;data=3D04%7C01%7C
> >
> zhan.liu%40amd.com%7Cda23e6e33a7e46dfc4e308d8b33242c8%7C3dd896
> 1fe4884e
> >
> 608e11a82d994e183d%7C0%7C0%7C637456375746425509%7CUnknown%
> 7CTWFpbGZsb3
> >
> d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0
> %3D%7
> >
> C1000&amp;sdata=3D5lCm4d6FHihfFHUf5mVym0O6lKmZHgR89%2F2Eqj2ojhg
> %3D&amp;r
> > eserved=3D0
> =

> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fblog.ff
> wll.ch%2F&amp;data=3D04%7C01%7Czhan.liu%40amd.com%7Cda23e6e33a7e
> 46dfc4e308d8b33242c8%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
> C0%7C637456375746425509%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&a
> mp;sdata=3D44x858klbIcVeRtP%2BuJST2K3xuCLisjbfhV9rEQrzpA%3D&amp;rese
> rved=3D0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
