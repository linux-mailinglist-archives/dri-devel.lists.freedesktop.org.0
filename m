Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F73435DAE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 11:10:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8016E402;
	Thu, 21 Oct 2021 09:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2084.outbound.protection.outlook.com [40.107.236.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3D86E402
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 09:10:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHFzpKgH97k2JARx4uBVSyVaUJfaFNmQ+lNrVNvhreK03CSig0isVk+iTjn6G4n40wFfpRMTuyDiWI9JvhZSWtvF2jGjktbK1dvCwJ/SF7w93gzqJ7yfOUdayTP0Di6hGrln20THF/Wxm/ZicBBkaMFPkPaopQNuFeJSaXUFO6AxTdkB8UEG2M2ctHss/iAcrMEnawgfsKsygi2J9JqEGBFnsb14RhbSoKu7p1YRpkGB/kTu1T5hOIoG7qPD1X050nPe9fmPZywPuf6u8J56C80eleMCWQnggsfgO7yp1glUvQDEEeTVNzmiT29Fy/JadcNtCVGI9v6qkHRDQlquog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlGSw9xnbfJnGbFY8o5j8k3CmMPVsZ3LMqmRieR/qXo=;
 b=oLeZEOU32TpHQYoeGU9IPR5kLNHlZNsyu4YHWyxARfBwDCjRR1bpPZTrkEqk8m6zwq3tXucMgVbMqpEUK56s9TidZODQR9wSTM8GzYBm1uhjot5up1n7MTIe1aCfFV63Loj7XzXIHvZ2i02ylrj1DVlEzrZWuEekC5krlpO4GIutFehQeZnOgtFlaRU67phOPkfrmeZaXwDLTeTFzXMV/K/8Vowl+UEyaYnPqiZ+hA+fCxZ4uHSlOpf5Gfxn47mIemypVDW7887HCTp1JLexZw6HJTNX1FqzGw9x9OS06kPc8J3ybFiLC89QSq6Z+pFckbPRwrBLuk6X0kuANE249g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlGSw9xnbfJnGbFY8o5j8k3CmMPVsZ3LMqmRieR/qXo=;
 b=PDC4EBlSp9umYNVhimsPcv9kySJKAsbwo+9Qh6NxYfQ4d4s+fDKu/ZA4lzlHSW4Uvz+/xg+n5WBvM0UeDYJuaf/8Vv33h05+NEdeWycGITFAh5lYoWGibbJwnWthWJ1776uUI6IplXqJeom43SwI94ZWURlSpwXNPEFdU6UzTLw=
Received: from CY4PR1201MB0246.namprd12.prod.outlook.com
 (2603:10b6:910:23::16) by CY4PR12MB1463.namprd12.prod.outlook.com
 (2603:10b6:910:e::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.16; Thu, 21 Oct
 2021 09:10:38 +0000
Received: from CY4PR1201MB0246.namprd12.prod.outlook.com
 ([fe80::91ce:4fae:eca6:9456]) by CY4PR1201MB0246.namprd12.prod.outlook.com
 ([fe80::91ce:4fae:eca6:9456%9]) with mapi id 15.20.4608.018; Thu, 21 Oct 2021
 09:10:38 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>
CC: Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Yu, Lang"
 <Lang.Yu@amd.com>
Subject: RE: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
Thread-Topic: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
Thread-Index: AQHXxdhv5+FAtm8rSEqeOvJWy1RrmavcKFmAgAABFgCAAQCUAIAAARPA
Date: Thu, 21 Oct 2021 09:10:38 +0000
Message-ID: <CY4PR1201MB02466DBB422025D235805BE0ECBF9@CY4PR1201MB0246.namprd12.prod.outlook.com>
References: <20211020173211.2247-1-christian.koenig@amd.com>
 <CADnq5_M7Yb3Yq-NeOTtwyN=XKQKHLoJ3FSFPi+qyigqxfrzsMA@mail.gmail.com>
 <4dec11b0-a503-62d2-0d4b-5acc511f7492@gmail.com>
 <9b508a98-8dc3-9da8-a0aa-3eb12eb2f7b2@gmail.com>
In-Reply-To: <9b508a98-8dc3-9da8-a0aa-3eb12eb2f7b2@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-10-21T09:10:35Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=f95e3c7c-b3b4-41f0-b354-f7d1b72b4375;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 43fe062e-0e0d-4b9d-3de4-08d99472a61a
x-ms-traffictypediagnostic: CY4PR12MB1463:
x-microsoft-antispam-prvs: <CY4PR12MB1463A0445D4BE3EF29D1BED2ECBF9@CY4PR12MB1463.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: InfHeSd6JdI+Tce1KvAmRNXC9Ev7uRoGQSNasVY3fNCamEw2MSYbARXxdZjU5x8sC8oVFlXV6bSfiB+qvdW500NdxnJ6MWfCVS3ZFSPLHeRGjGDrQKRA3g16rjAQDo/2tsgZQWZG4kqc4XLL6oxu/C3q2VUDdMF3yFphPk0J8Wf0m1NweCaE3I13z01/fIj+YYRQ49+NxSd5znC6Vqm3bnKdVfAq8mlkpEoEjs/CJWNJ3Mzjf3S8tu+svguPEAlk+EL9qDzy8IAK3nLT4+R8vC9Co6VJweY5hELadxiqIPUQ5S9vnp1nU5NWoeQWfGcghGG00IciSkyCLkKl3bOmkMVzXSSUbMsH2G0sQmeXlgExxOGlRdfLAkwqyrzfX2wjfHAB+2qvkFplJ4Hh1KnjlAe637W5LAC+SRpAyLTdAjww71fXvLbbZ+yOvPDFhov7QSTeH9lxijIorcpyfDT3ZDkSKiy+Y25GWDkCTpvzFYkD+25JYgEVnSSkBDrjX76kUe0nUoqoTJ5NCg07E5Xq0G789Ud4Ddx9xxHZ6SSd4cS2BW93lGumHCMhqUnewyyF6dUfjkBPfQBNJNVmP+DWDuPTVae2wciKYNIzLprE/47/ADMYGBt3TDFrD+EyA+5kIZhC3tSCnMN0qwVXIHTRBN4teaff0hUziiVELvND+SbTsneUyuc5mjxx1K2nMiTmj4MqSCzQq6tlrdszeYD+ebALdr6wTQu0zPWOWVzEFEK2BHKxDHW5nSBCYHssFfb05PgDxDIC4gcv+9axI7dGeO0zKn96h3EDnXDAIeP+SWQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR1201MB0246.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(122000001)(66946007)(6506007)(66446008)(64756008)(7696005)(8676002)(45080400002)(71200400001)(33656002)(110136005)(52536014)(186003)(38070700005)(5660300002)(86362001)(66556008)(66476007)(76116006)(38100700002)(316002)(26005)(8936002)(54906003)(508600001)(966005)(83380400001)(9686003)(53546011)(55016002)(4326008);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?pCfDk3F95+gc4V4XJHLcjJ+uLJHda2zFf/Ork1pssIgQefnshWkdRCI476?=
 =?iso-8859-1?Q?EyolpW9lL8nfM0U+/M2n+kLUqOlB7r2LZGF3AQivLSVu36JQVBM8qXDUJv?=
 =?iso-8859-1?Q?NSw4tXfXZ5y6sHDrcRImjHd4XETHT7cYoZq+iKMo9Tx3OOSof/rwBeRZ3x?=
 =?iso-8859-1?Q?ClKoKP02pwcbr4l2qVxlDSsfHReInOtS7YTA6tvBv+w0BCd9lpZCrX8mQF?=
 =?iso-8859-1?Q?io2zyKBL34rSDBTmPaoksLlmUd8bagCVQjmdH42CbogUwrXRhNgprQ2stL?=
 =?iso-8859-1?Q?pVJXkyGJqSbWpy3BJeHY6MZGTa9zftAoFGml8rZVq8rqtuyJrrgzOtKM+S?=
 =?iso-8859-1?Q?+QrQCPQU8O3dZTFRSxSH+M64bAXw8oWedCymAA0kkMOHFxTihVYraJqRDq?=
 =?iso-8859-1?Q?gqO/5DQG4WhWFcUnZaKY2y2odOCK+wVBXmbsDPcz2r0jNA7eh2K+GDjF5x?=
 =?iso-8859-1?Q?siQnvEuaDcX2tsdY66HLY6VPD0ayrZrP65ZNO15CT5o9JZRTHRY0AfXeUz?=
 =?iso-8859-1?Q?Yp+CYM0ZW9ghzwwiTcaQicOoHhnXkPfCrdI0kdA5GVTgOTmwC1CaIgn0oI?=
 =?iso-8859-1?Q?Ov8G0oC9eUtrDOctdMMRu0ds2Rlr2BHh/8aBUNotdswiGqsNnFgU9Kuflg?=
 =?iso-8859-1?Q?WzOu/r3UDs9YqSAHuyRk3z6W3vHcBX+b3GSey8vnY4XqaqSSAjM31QL+xD?=
 =?iso-8859-1?Q?foLD/du5RLywLt4Ok/vEeGbIZcCKpxRzXyqIv8v7jFJTh1jo41TCQaRrPh?=
 =?iso-8859-1?Q?aoEvpax3DDz5QQSEfmAZhu8ttQ+0dyvwWi1cDVvPbOXTRJBomUJ+2lJOW7?=
 =?iso-8859-1?Q?gSkU6fnqR99ZW7krDl4agP8hi6g6W75Cy1IDbLrP7NH1f4nGGliq1bmdwx?=
 =?iso-8859-1?Q?7k5nPOoY3JWzwBIG8QovbBXRg/X+SqKIg87wYMTaatfSkCQaDAzCPlVsbt?=
 =?iso-8859-1?Q?NzpKZ/JzQKabDKLfemPIIR6HLSelgHLKpcYAOlIssvTjHtySrlNUIFjuF3?=
 =?iso-8859-1?Q?aA9g9D5Snydg+P7tuhPOMWM/dby/KOdhvTKgNmRYyb/QEKx6Cj67YfgF1j?=
 =?iso-8859-1?Q?Rfp4iP5lxa857XpMUqpwcS8MbHSJ/LJaFeAUd6KOSw8J4pe/GgOrSUBitn?=
 =?iso-8859-1?Q?8llFx5u0i3AZQHyZdwfVfGq4ZoSB0smbN2dvnrWJ65TrWD0kEMNbPO5tPD?=
 =?iso-8859-1?Q?VuJzyc5RjFDb5Dyp8OgJOmkk222FHVxszyeuroHbrGWE6YDiWX2RWTUVjI?=
 =?iso-8859-1?Q?Jcw1uR9LVmiQKVYjPwLTkHEKXxo+Q/WHxffW7zYAloEXoQV6fsniOD6p7X?=
 =?iso-8859-1?Q?CGRnjB5+FVbC0doxuKkWdaJ1PkQO90hmabgomSv1H4orcnrTjztGma94eg?=
 =?iso-8859-1?Q?zACMHpFdC8flrAJuHEZ69+CX4IdKnYTSXNPZO5+kI3AqT3CQwYI5w9pDMC?=
 =?iso-8859-1?Q?4BH4Giba8bw+r5hM9jsydjpFj044FWSir+sLdejuHApfmW/12aaF9u1q5v?=
 =?iso-8859-1?Q?I=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY4PR1201MB0246.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43fe062e-0e0d-4b9d-3de4-08d99472a61a
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2021 09:10:38.1447 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1463
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

[AMD Official Use Only]

> -----Original Message-----
> From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
> Sent: Thursday, October 21, 2021 5:06 PM
> To: Alex Deucher <alexdeucher@gmail.com>; Huang, Ray
> <Ray.Huang@amd.com>
> Cc: Maling list - DRI developers <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH] drm/ttm: fix memleak in ttm_transfered_destroy
>=20
>=20
>=20
> Am 20.10.21 um 19:47 schrieb Christian K=F6nig:
> > Am 20.10.21 um 19:43 schrieb Alex Deucher:
> >> On Wed, Oct 20, 2021 at 1:32 PM Christian K=F6nig
> >> <ckoenig.leichtzumerken@gmail.com> wrote:
> >>> We need to cleanup the fences for ghost objects as well.
> >>>
> >>> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> >>> CC: <stable@vger.kernel.org>
> >> Does this fix this bug?
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fbug
> >>
> zilla.kernel.org%2Fshow_bug.cgi%3Fid%3D214029&amp;data=3D04%7C01%7C
> ray.
> >>
> huang%40amd.com%7C2649abcb898e44a70a2908d99471fded%7C3dd8961f
> e4884e60
> >>
> 8e11a82d994e183d%7C0%7C0%7C637704039590182871%7CUnknown%7CT
> WFpbGZsb3d
> >>
> 8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%
> 3D%7
> >>
> C1000&amp;sdata=3DM2sEOCDiZIr8mGuOHQNFGPNi93kp6HcrAS1hjxy79r8%3
> D&amp;re
> >> served=3D0
> >
> > Yeah, I was already adding that patch to the bug report as potential fi=
x.
>=20
> Ok that indeed fixes the issues we were seeing.
>=20
> Can I get an acked or reviewed-by so that I can push this to drm-misc-fix=
es
> ASAP?
>=20

Reviewed-by: Huang Rui <ray.huang@amd.com>

(+ Lang), he is debugging a similar issue as well.

> Thanks,
> Christian.
>=20
> >
> > Christian.
> >
> >>
> >> Alex
> >>
> >>> ---
> >>> =A0 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
> >>> =A0 1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> index 82af095f6b81..f37a8c53b35f 100644
> >>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >>> @@ -190,6 +190,7 @@ static void ttm_transfered_destroy(struct
> >>> ttm_buffer_object *bo)
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 struct ttm_transfer_obj *fbo;
> >>>
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 fbo =3D container_of(bo, struct ttm_transfer=
_obj, base);
> >>> +=A0=A0=A0=A0=A0=A0 dma_resv_fini(&fbo->base.base._resv);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 ttm_bo_put(fbo->bo);
> >>> =A0=A0=A0=A0=A0=A0=A0=A0 kfree(fbo);
> >>> =A0 }
> >>> --
> >>> 2.25.1
> >>>
> >
