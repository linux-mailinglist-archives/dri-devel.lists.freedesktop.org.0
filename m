Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0503E1C7FDB
	for <lists+dri-devel@lfdr.de>; Thu,  7 May 2020 03:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E36666E073;
	Thu,  7 May 2020 01:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC246E073
 for <dri-devel@lists.freedesktop.org>; Thu,  7 May 2020 01:47:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jhe41AUAjc98s1rnh6my8tRFXGtmXKaOD7CvrRAiyvul1DenVfLnoSxcnNEJoWvKvPeCg+2byepGFypQstrkTuKbpcPIeTn9BVpu6YOoWGzDXMROmQD0MgpKUeRRiPOLL/bnVwJJycRP5VSpzrhHTViht1SO8wuJUQOG6S6vsLWMrN9xu7ZeZN5Q5tQELIomtop9cL/WATp0T/GNu38bLO3gFUXPdJZsWrC5gA+U8Y/ExUHHNr5ADlThD21iDs3iXUpOp9y9uQvycYt6ZPFuMRjELmSO7eT/AmafaHPOp7cZvy333zOtp/IBXiCeyRKhXrslubvKyCjd2oqZcUKmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW3Ll7zKLR2U5YjbH1in3VcqRLbXBfBfsMrISOkDRxc=;
 b=hKwAvtdGiHF4pm3xQfZC9kikGMnlxskEz5W0HO2PUk5aW1NBXK6Uvgvy1CaYPc9oEoWFVBQrQPMrkOU1vvCs6cRfwwQ5ClzJLQ0bEAnJd8lB518hBVdd5N8fjww2mF+NsKQ7cv+L2hQRt87SRt0J8u3GqvaVIg1mJ7fVn3LjUdBBDURpJvD+YpPekqBuo72CpZUhsxuhRhYfPKPM4U26fc7WnIQQ8H85iMNUvSpgFFZlWgr93ClMN/YLtayUV5OTgmqS+nHAWG/gSQpTDvRHvt/zN82ejv0k6Ut8WoPAmh/ehLLHA2+Q4D8TdQMdNRHYcmRWI9ak4+ILvu8U0oatjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eW3Ll7zKLR2U5YjbH1in3VcqRLbXBfBfsMrISOkDRxc=;
 b=tWUdio4jM8U16G3sLGwv0u9mYPf1830wm4+zPqi7THJTf/jgsE3Zs/mVd83KZyN1YAN9BtM5PkraikCi5pGGybu0kAWu2zzFD76FfXoTTnjhlwKw78WcUSOJfAlhUtblpNQU+r4dvZ/W0RX3NMGCDYfvke2jgKFogGCvDT3lFpQ=
Authentication-Results: collabora.com; dkim=none (message not signed)
 header.d=none;collabora.com; dmarc=none action=none header.from=amd.com;
Received: from CY4PR12MB1159.namprd12.prod.outlook.com (2603:10b6:903:36::17)
 by CY4PR12MB1333.namprd12.prod.outlook.com (2603:10b6:903:41::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26; Thu, 7 May
 2020 01:47:19 +0000
Received: from CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7]) by CY4PR12MB1159.namprd12.prod.outlook.com
 ([fe80::e9c0:2506:396c:70b7%10]) with mapi id 15.20.2979.028; Thu, 7 May 2020
 01:47:19 +0000
Date: Wed, 6 May 2020 21:47:14 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH] drm/vkms: Hold gem object while still in-use
Message-ID: <20200507014714.peygczkuppmbtbt5@outlook.office365.com>
References: <20200427214405.13069-1-ezequiel@collabora.com>
In-Reply-To: <20200427214405.13069-1-ezequiel@collabora.com>
X-ClientProxiedBy: YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::17) To CY4PR12MB1159.namprd12.prod.outlook.com
 (2603:10b6:903:36::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56a0:11a1::4) by
 YTOPR0101CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2979.26 via Frontend
 Transport; Thu, 7 May 2020 01:47:18 +0000
X-Originating-IP: [2607:fea8:56a0:11a1::4]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6938ec47-228b-4d0f-c3c9-08d7f2289409
X-MS-TrafficTypeDiagnostic: CY4PR12MB1333:
X-Microsoft-Antispam-PRVS: <CY4PR12MB13335818EC4053F127E9FC1B98A50@CY4PR12MB1333.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:480;
X-Forefront-PRVS: 03965EFC76
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q0nDGl+S/pSN2BQ2tSjnRNY4izhEms50CT9oWl3A9Kxu5+CWXSzMP7IRKr8qKHADE7yYYcttI4oi3yhHXjsok33IjWwi/TuSRsLlzCufVqpTHyaRj123belK6yAf4XklVhJzgOhwvebSRRg1iMre2C6r9qyZNB4XjWO1mdYfC/5q6gO+xeQ3AEMMRWMmDZeG1K0MOpTSK69p0K+e98/c0aG2WRSH3lh85Th9jwS8Ofw2tINgnPdjxQUwwilWMgQjLvD+7j2W9L67bbMbkN7wylgT5rvjcEvSNrfbpfdlDimwUfw40AABDhK2ryeOhTuqWKqC6Qb0t8FpbSC/6HQfUt5XLd15XjttHmkEM2vKrKrgtn7vVMdt0OKn3+g3fKZbK3AptMvT6OYTdniJ2d/c6rVmlcGLPIytYsaYlYPkrUJWjXJpfT709vq1cnAXZv+sLG7sO85gg5DJzRaxy/XddeGrFq5QyYMGBCnJ6XA+BZPQ2qFPhA6prCqrSTfrKivgn2szKWPOhfaLqtpICBm3PfqsSHr9Xnqd9AKRa52MAQFI0OF9rPr4dpbTkIfd4CPCEt0gVSiFj32ClFvj9qqUlWN6us0z63bnmuCzWQJHEHUW20eGi1oWeQMC9AfJdrBh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY4PR12MB1159.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(376002)(346002)(136003)(39860400002)(396003)(33430700001)(9686003)(55016002)(6506007)(8936002)(478600001)(316002)(52116002)(54906003)(4326008)(33440700001)(7696005)(966005)(44144004)(16526019)(186003)(21480400003)(66946007)(86362001)(66556008)(66476007)(5660300002)(8676002)(2906002)(6916009)(1076003)(6666004)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cQM4p5wiwNmYuykJRFFG8SDQA2j0hIMF27V8lid3wzWyYPGquQPE7/VMK7D77FuEn/VFLqFNr8b+6kEotVKQc55eCCgdC5d0fTCX3OJyx4yDIwvfhiX0eXdWwhVxiO1YYkWJriP9WpQCk6y17s/reG8zULN2HBiDmJfgXcJFeH6PtX8uy53+EKGNajvnWcOzTUQC0XbmP6hAjuGbLfHVHxZ3dWSapeXbUJ37mnMOaOodUUIu6+qkmaLWfewJFQ0bi9l9tTMjmos88er99EqcLi0rdMuqranNqUMP9VIkD/99csoG504+KAiiZQtXEj6F/4W5xZ8sDO0El7QCTQ9LP8jCCLYLn0IIWQ85IyyFzaSHOqrA2SLqkGxQCtdliwnf1q3LbBSKqkEXmEcqsDZyJxa7LqGuGxsABTN/yCwz3DBEBwbc3R3gpVkya0fm/JcxemAKJ7t00Jp1YZoYWWhmuNcm3al0Mn2cLadj7+WsE/1But2cT1NnS/oCP/Z8QKhMVUQYdPszXKh4NtIoi5RYJJTW3rZjv5F7R5eDDGWgVZSa1yOoOcHTXBOxho5/2vOOE+XawpRLj4DslfG9gki8wDcc/zSK4OWPx+9O9Gu0bKnX1/iYM/LXLA8fjks68/LTaXx27GfurwK/0OfAXwBCrgkjK7HuV3fsf0tEdKQR4ajbuoPCEpcxuOEqn4yKuHOdzsINR2o0Y6g1VNn6BBGG7819I/lvQGmNCUyqesMP2x5uR0mKOpd9QaIPmgnxK1ZB07QJg5eyXL72rOI+w0ZqvXa4zAMP1XChQGCUmL8MLQ2pzeP+E4ntVFq5XXwL3xab
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6938ec47-228b-4d0f-c3c9-08d7f2289409
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2020 01:47:19.7433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gLC5EY1IckXlGY0O0PGMyDfYho1zCaAC+ALCwbhTAsACBn0Qth53jWyQvx1gusm5Lutrt5Q9BObP7CpC3owk9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1333
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
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0213643247=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0213643247==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="376mfctljvcggepl"
Content-Disposition: inline

--376mfctljvcggepl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Thanks for your patch!

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 04/27, Ezequiel Garcia wrote:
> We need to keep the reference to the drm_gem_object
> until the last access by vkms_dumb_create.
>=20
> Therefore, the put the object after it is used.
>=20
> This fixes a use-after-free issue reported by syzbot.
>=20
> While here, change vkms_gem_create() symbol to static.
>=20
> Reported-and-tested-by: syzbot+e3372a2afe1e7ef04bc7@syzkaller.appspotmail=
=2Ecom
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.h |  5 -----
>  drivers/gpu/drm/vkms/vkms_gem.c | 11 ++++++-----
>  2 files changed, 6 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_=
drv.h
> index eda04ffba7b1..f4036bb0b9a8 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -117,11 +117,6 @@ struct drm_plane *vkms_plane_init(struct vkms_device=
 *vkmsdev,
>  				  enum drm_plane_type type, int index);
> =20
>  /* Gem stuff */
> -struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> -				       struct drm_file *file,
> -				       u32 *handle,
> -				       u64 size);
> -
>  vm_fault_t vkms_gem_fault(struct vm_fault *vmf);
> =20
>  int vkms_dumb_create(struct drm_file *file, struct drm_device *dev,
> diff --git a/drivers/gpu/drm/vkms/vkms_gem.c b/drivers/gpu/drm/vkms/vkms_=
gem.c
> index 2e01186fb943..c541fec57566 100644
> --- a/drivers/gpu/drm/vkms/vkms_gem.c
> +++ b/drivers/gpu/drm/vkms/vkms_gem.c
> @@ -97,10 +97,10 @@ vm_fault_t vkms_gem_fault(struct vm_fault *vmf)
>  	return ret;
>  }
> =20
> -struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> -				       struct drm_file *file,
> -				       u32 *handle,
> -				       u64 size)
> +static struct drm_gem_object *vkms_gem_create(struct drm_device *dev,
> +					      struct drm_file *file,
> +					      u32 *handle,
> +					      u64 size)
>  {
>  	struct vkms_gem_object *obj;
>  	int ret;
> @@ -113,7 +113,6 @@ struct drm_gem_object *vkms_gem_create(struct drm_dev=
ice *dev,
>  		return ERR_CAST(obj);
> =20
>  	ret =3D drm_gem_handle_create(file, &obj->gem, handle);
> -	drm_gem_object_put_unlocked(&obj->gem);
>  	if (ret)
>  		return ERR_PTR(ret);
> =20
> @@ -142,6 +141,8 @@ int vkms_dumb_create(struct drm_file *file, struct dr=
m_device *dev,
>  	args->size =3D gem_obj->size;
>  	args->pitch =3D pitch;
> =20
> +	drm_gem_object_put_unlocked(gem_obj);
> +
>  	DRM_DEBUG_DRIVER("Created object of size %lld\n", size);
> =20
>  	return 0;
> --=20
> 2.26.0.rc2
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org

--=20
Rodrigo Siqueira
https://siqueira.tech

--376mfctljvcggepl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl6zaJwACgkQWJzP/com
vP9RhBAAlr+Fvggahx9FqSar0bfYpe1wSX3AKDH3aBXMT7d6FZMl/+ZRGYZ2S0n5
pH8cBictGtlCMU6igTX6RbioisEHvkFZIqNHTbbVrKGkb92VAB8U+BI++TPCriGw
fzC3GRPD+Z1sRDav08yTaR9vIKkVGV9p/xk7FDXg28JAYw/tUOCnv5sVFDOVWpAv
2Sd3ZaZUUofAec2/H4gMxw+hChNJPvx65E+Kb/ak377kgnrYSRBLfU4Tuj/vb3fy
mAVZB+MbxJaKd+yPz7E1HEXC18rmARt6eLdKEmet8aPabfvGvmEN69e7t0vcki6C
MpdQ5SYWl0rOGWPkCPj8hv3nPJzFR3DZoRLxOjj1gj4/4x3ZeIJWDVfZO9ouNc1N
8MGwMg2Il9HJxNxxXn6wa3lsEvVFkS785HhhNqOjLmJO891fujPrSF/HuGec8f0V
urL033eMb35/KN9rxqdyW4+hKpBmGSB2nAfxbTpHfuDfPs9awtlMwrJravxXh0Rg
HMLPORfEEHLofa0E6TeYgnyy16Jidgc3aaf20G0R1VtH1dSEvjGEtKVcEdtL6mW8
ucers5q9HyUjuSsVl6JufzSDRYeWq9JGhSZtV3p9PGuFIBmv92NOVoJST0Vc2d/R
AvEWRdhooMKQ18wpp7l8oXXVn6osC/65ptdo95HxJFFypP764TY=
=CZsA
-----END PGP SIGNATURE-----

--376mfctljvcggepl--

--===============0213643247==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0213643247==--
