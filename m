Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE221C7FE1
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 03:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02C56E08E;
	Thu,  7 May 2020 01:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B710C6E08E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 01:55:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OOtJOBOnT+rKkHZp73dNQU8ryLXlqF+qe886elPZGMaeOGRHRWRR0lFor6lTdO5Zf+7O82pZpj5IMaCS9AJdTcmzLbkz9HmK6Z3kz2hcoxU/aUodZ1ZUrnWFIyXGimDoPqg/dbYLd3eYqhxpixTx8pV6X2QA2RdzAJ0NrA2xUldzwqcd+mOliNx9f6+65VdmLOS3WzJ7C+sOGAhC8A9edpf+EePU/qAvIrub6HYUV40FQpUrE2czDeBObl3MhUd5don7ZcWNeIeNNnwpkcyS+7CG9DidgOnD4w8z4qwgGVtrj8Ln2GsVRphBmGRtjebx6YnNNaRXJ5KJJp+n/RIDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDCew1zlYX+rnbgMW+PRQgQU2Q3lC89LGGzvvAYe8+4=;
 b=BbmZHE4WyRdg1GvpSvFniAyj3Xf6MYBAp9GNHlhDLmigplI9PGMX2vVyu9HmMNzEfOITRJ5SZAmKQcxxY+eakiTwSiGY7HSmoiVCCLMyl3F1US86JceGWbaDHaWup3RfnkW7ga4stadrRAT8cjhHSou8xMhkuVy1uj88B8uYxT3fPo9d2wqUjpF1kO9Bi0TNL5GqjqV13BhnBDGaGeJnOySk8gnvAOvXMLnEAid+/31w0x5jdEOG5natZEEOeLl+pCbRwtU9ACkeOaNmj8umqOT45b/lGdvoTs2POgW3lG7AHeYJ9qlMxLAZw0taQR9rOuS1iwNIaOEzBue9bZvRdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zDCew1zlYX+rnbgMW+PRQgQU2Q3lC89LGGzvvAYe8+4=;
 b=0AiE+ztxbGxkNqSctccupqB/dFk35jnndwxk3VI3dwVeTX9CxLEobGst6bKBTveWQLYF9kcBAeeD3fPjobtuRKMJi33+t7hh3JYU/i2ojZnsd7hQw6xFt4GhnVgHbjzqiUQDEmUllC9G6mjeFJR4z1NHC+Lrzy4i1Ha9FYpdSIk=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1525.namprd12.prod.outlook.com (2603:10b6:910:11::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.27; Thu, 7 May
 2020 01:55:24 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 01:55:24 +0000
Date: Wed, 6 May 2020 21:55:19 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm/vkms: Hold gem object while still in-use
Message-ID: <20200507015519.hdjtasrbexqage2c@outlook.office365.com>
References: <20200427214405.13069-1-ezequiel@collabora.com>
 <20200507014714.peygczkuppmbtbt5@outlook.office365.com>
In-Reply-To: <20200507014714.peygczkuppmbtbt5@outlook.office365.com>
X-ClientProxiedBy: YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::36) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 YTBPR01CA0023.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2979.28 via Frontend Transport; Thu, 7 May 2020 01:55:23 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6b916e11-4fae-43b3-5aa3-08d7f229b4f5
X-MS-TrafficTypeDiagnostic: CY4PR12MB1525:
X-Microsoft-Antispam-PRVS: <CY4PR12MB15250687CCDF95159417CD3F98A50@CY4PR12MB1525.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c6/1h9CkSIM97911f9Dy3ZbQk4VYF1aNXxkY/FXAHxYEMTaScOCiDkk0UmCjxYHKUARuQvqWuR68cyNC5AP9e5s0xQOnKCzodJSqXX/RG3Nf61tZ5BisUgOrhrazyMQJ5sIXceAL07Hm7N8/GVhoelold4Cpa77Ap1sJFMfY7ILP1//omDAE9DQqmN/+7LQmBwoS5otoqGoSH0519lLiAMC9Q04STfKUj/OtHnrXA9qCxs1VqJmq5R5VAG1UdnC0Vkwkj0Rr81eO1fpE2fUIJNAd7o89AXJcXHieUzWv5qFD6zxYcLuTauvHABFwGlaolY9ynPxZ5/IgRCOFkYkAn63GIvst+j/WP5iFHBqS7Jmy1t9s7iETUw3rZHbzszUcnCWy/h6opfDUJjvVjxrwQcs4g0w8Gr8keZYHwjYsfoom+jhA4q/x+mUo4ikpprZRbr0Etr9+RSRHTtOa2wwAI/5cd54X19o0hbzZllthQzr4j6ucepyM7N1/9BQ+UVx8IJ3iG1EGwBI3PpqIWxoQlcXtrZL2vwKocwMUNIMIOPxRCR/TJ/vAO6rp5MMu7MlwqXaAiVyqMAw/1ZDqA47QXtEFUwU7i1tE3sn2MCwllRMAQZsdG1NAxW0u07EeclKv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(33430700001)(8676002)(52116002)(478600001)(6506007)(7696005)(1076003)(44144004)(54906003)(6916009)(6666004)(45080400002)(316002)(5660300002)(966005)(66476007)(9686003)(21480400003)(8936002)(55016002)(2906002)(66556008)(86362001)(4326008)(186003)(33440700001)(16526019)(66946007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: PeKUbFthnnKUU3LZdUVrd2Y7Xl2Lr79O8xX9dtT6D6W5WdoAj6CafL0fzH67qZAzBDAt7RDZHsbnMXCMY2OVdju+QwX1NiO+7yDzs1Qya0wqI5sn4eIYoCwxUkJ3PzzTR0TEpv0LXbSqcGRAHSxZANZBQENxCck77PErSDq8Qt9ZV/gObwYR0IUf+kB3eHByDgP1/yocjEFHQJE9XBzT3ETmpiyiuDOxW1p/mWtksNdbfnvbCs0CGRs3pftpih/W1Mb2d+JQiHcpPRZaUjN7WNIByIyvCYF0zo/VnEAxLLi7aT1rfLDHIHVpwyLVkB7P+OI+i/DP/xBeN9Wak5Yzf9Pfi4UM+sqpb869ol/UZ297uuSphttVYaYJg7FoIgXwwzJxiw4k5o6MWfuUN0sVDhbtzEr7KgZ/iQ1dkhOo2q2d6mWUfvCg0Df56ZDE3rR7WS2XR9mjDHwk0NgHj8dYzPXBpd3Yzb1wQPRkvTMULIiteLHMHpS27xYrYMy5wvgQD2c/MtkNYw0V581rWHrCGypiIK8FknyXlfke03BkSLrYXEdOFemi0rzdOJJq2iUymt83W9pL1nQxSeIrQAe5EWxWG2xZinKftn1HujmU9UwSf9nnJaFPLAL+z06r3R/wxfoN6oFcxWD0yM2ROyjfl5gR8e6MQmP/nEYQ0TKTnP9VWdrNSQjlC6CJYWjunMCHwPgMcJDVCf4XsXXqmVxrmxd/IUCZw8NRSlUa3YHLKn7Gwd6748tT6qGncSka9FmRL87fN5XcLjyxtAzDxBKkspa4pBBeCsNZ+DUxMgm8e1V4pCHJxbIlYhQeXH9oK6EN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b916e11-4fae-43b3-5aa3-08d7f229b4f5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 01:55:24.1922 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PV6HqSMhS/9WzT9W1wnVAqtx/i3oCfNi6CqJFiKRlJmhcQz1ffFvroGSVCNq4gXljqQ3TPEMaTIkdfE2SgVDKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1525
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
Cc: David Airlie <airlied@linux.ie>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Content-Type: multipart/mixed; boundary="===============1595172576=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1595172576==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2auy7ipboqmqnv6y"
Content-Disposition: inline

--2auy7ipboqmqnv6y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Applied to drm-misc-next.

On 05/06, Rodrigo Siqueira wrote:
> Thanks for your patch!
>=20
> Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> On 04/27, Ezequiel Garcia wrote:
> > We need to keep the reference to the drm_gem_object
> > until the last access by vkms_dumb_create.
> >=20
> > Therefore, the put the object after it is used.
> >=20
> > This fixes a use-after-free issue reported by syzbot.
> >=20
> > While here, change vkms_gem_create() symbol to static.
> >=20
> > Reported-and-tested-by: syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotma=
il.com
> > Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> > ---
> >  drivers/gpu/drm/vkms/vkms_drv.h |  5 -----
> >  drivers/gpu/drm/vkms/vkms_gem.c | 11 ++++++-----
> >  2 files changed, 6 insertions(+), 10 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkm=
s_drv.h
> > index eda04ffba7b1..f4036bb0b9a8 100644
> > --- a/drivers/gpu/drm/vkms/vkms_drv.h
> > +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> > @@ -117,11 +117,6 @@ struct drm_plane *vkms_plane_init(struct vkms_devi=
ce *vkmsdev,
> >  				  enum drm_plane_type type, int index);
> > =20
> >  /* Gem stuff */
> > -struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> > -				       struct drm_file *file,
> > -				       u32 *handle,
> > -				       u64 size);
> > -
> >  vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
> > =20
> >  int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
> > diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkm=
s_gem.c
> > index 2e01186fb943..c541fec57566 100644
> > --- a/drivers/gpu/drm/vkms/vkms_gem.c
> > +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> > @@ -97,10 +97,10 @@ vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
> >  	return ret;
> >  }
> > =20
> > -struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> > -				       struct drm_file *file,
> > -				       u32 *handle,
> > -				       u64 size)
> > +static struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> > +					      struct drm_file *file,
> > +					      u32 *handle,
> > +					      u64 size)
> >  {
> >  	struct vkms_gem_object *obj;
> >  	int ret;
> > @@ -113,7 +113,6 @@ struct drm_gem_object *vkms_gem_create(struct drm_d=
evice *dev,
> >  		return ERR_CAST(obj);
> > =20
> >  	ret =3D drm_gem_handle_create(file, &obj->gem, handle);
> > -	drm_gem_object_put_unlocked(&obj->gem);
> >  	if (ret)
> >  		return ERR_PTR(ret);
> > =20
> > @@ -142,6 +141,8 @@ int vkms_dumb_create(struct drm_file *file, struct =
drm_device *dev,
> >  	args->size =3D gem_obj->size;
> >  	args->pitch =3D pitch;
> > =20
> > +	drm_gem_object_put_unlocked(gem_obj);
> > +
> >  	DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
> > =20
> >  	return 0;
> > --=20
> > 2.26.0.rc2
> >=20
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
>=20
> --=20
> Rodrigo Siqueira
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsique=
ira.tech%2F&amp;data=3D02%7C01%7CRodrigo.Siqueira%40amd.com%7C087365fcd8794=
562fb4c08d7f22899e6%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6372441292=
67902564&amp;sdata=3D855ahjfgdqouFFFn98OKtmCHf0ESNINBsGHUoBz6fWg%3D&amp;res=
erved=3D0



> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7CRo=
drigo.Siqueira%40amd.com%7C087365fcd8794562fb4c08d7f22899e6%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637244129267912520&amp;sdata=3DMqNXl25%2B6DYR=
TGgIOSit74dmAd%2Fkx42bw2e3Iut2rMQ%3D&amp;reserved=3D0


--=20
Rodrigo Siqueira
https://siqueira.tech

--2auy7ipboqmqnv6y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6zaoYACgkQWJzP/com
vP+44RAAiD7hleHrGdxa2bX7gbhqjfdO22aN+IthUNgAS7MXXNpV0UddvELK8e71
lLXOfdg0i6nfnu80m782mpw5UPmpI4rW13fGU+Osp4Ahyk0u2vk1EHqPMY1m9lcV
RCw9rNWSDraiAy4nrjvr402Gg+ui2nkqE14qZLMSuIpeCWAY1QeosToyu6tHMT39
58thkOS9artDgESXdqkMEDdxGi9W/z/Jjl2OWh3ye8yl5XJKNM7ZuqF+RMC13Kau
y6vsY1ugMxrRR2w/za6ThkrKTQ9LTwm55q/Qabc5wvsPigjFBA5tPm/uMEH87+qt
fwi9b/hqVCf9v368yG3sfr4q9eHqcfHHS4d5skBSkvAZI6WIdVEEhSHXP1HquKon
ApqpJOT6TygTY0RFCGy1hF5e2uLDeJZn+FFC0lyF/c+rOSP+KjeoGy/uZd3tDeY1
OFp2GEl9ft+m98CLr2G6C5FJxvu3fHVlKmop0SAfJhJJhAwrf4FEaioWiwI/I3iZ
3KJlGWES3jN9TY3+/ClCHp+qExjNje9YLjjuHM3VmlZ/O2PP1Oni8/UjirsaW7dW
6KTaPQu3h/rdmvc4g3T2S8UMJjnhmavp1V4+P+0eybao3RtpgTrs+Fc/RxkN/E+b
X1/xV0nX844HcMb9EkbbpLCdmFLbmuJaM/p2mFgE8dTHF1oe06k=
=nLdi
-----END PGP SIGNATURE-----

--2auy7ipboqmqnv6y--

--===============1595172576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1595172576==--
