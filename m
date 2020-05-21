Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD031DCDB5
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 15:06:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2FB6E203;
	Thu, 21 May 2020 13:06:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2071.outbound.protection.outlook.com [40.107.244.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280BC6E207;
 Thu, 21 May 2020 13:06:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LIBP0XoHko7C2Lcrd2fiWw6Or/BoRrJfWhbunKf34aPAPgP1kzWWPqSwjrF6Lv3RZ9n0SnWlDF3Q8O6i8Z2/Nn4UgSJ2AVv9j6H7j4KNqcUS6y03tdU5Zu8xt0NlgqYqEXx7ufD8Kxfxz97WdFhVSi3EduluWogG4sBD5RgrWQKolBBVVHR5EsxnM+DVkeGDPLPJHURU09kHCH2FzXuRWt0+0vCcXEpO50qcfYbh5fdn0GppZdia7yqk+bJUA1q4aeByCxK9oVbEhTaWRgsToBlSX67to1LrE6Yb471gulIionJZAmaQhlOP+FxESj032qYfdNCMkoUjfp/dSHloYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nF5LJirplyvPETK67zAT1M9HGqWk0iBZwPquYOWwuI=;
 b=MacPuguAH85xMzGk4hz4ltl6MTDJFg4GGOhdoZJqKcy2Qa8AqON+hC3sehaPfL6Wl7A/CaJY3HNZA9EKnhGQYrv5MtipnPeHdtjSXsxkgMrKdkZa+ymdHVZ/ltqHKm5qjhTBjEa5tx6Urf1UwFGCzXmFKFwgyln0nUPYAJLpD36R0RzKz/f6IXddILuZHuMilDNa+ao/RHeibKa2cjuXK2oD3kiM6nMwz8Txbtn8T6nbLt5cyRq25SCZBifsxWNAWCN7B8NciyM0vjDGmB8FRJlL2aLSAb4k3V02JoIb1ycU+i9bTejnuOjysVFsoUHAszXXP5qdLwmq/iGyirvqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0nF5LJirplyvPETK67zAT1M9HGqWk0iBZwPquYOWwuI=;
 b=02JXf8SDp15fSDiLv0J8YTkZdqEuCu9t9Gp1Suc6PsYKxbZ/QxRbK4RnwhzM598ZXT3XDhGefvtn8CUI2WNdZ/zOWtYstOthRcCVAOJvfuK7/hnxI/pmwABBbQV4zeoXlLiO1KG7tv/vmAhDl2JvOTMshIMsivHBLhcQPTiakaY=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 by BY5PR12MB4180.namprd12.prod.outlook.com (2603:10b6:a03:213::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.27; Thu, 21 May
 2020 13:06:43 +0000
Received: from BY5PR12MB4082.namprd12.prod.outlook.com
 ([fe80::5856:1cff:8a2:7db6]) by BY5PR12MB4082.namprd12.prod.outlook.com
 ([fe80::5856:1cff:8a2:7db6%6]) with mapi id 15.20.3021.024; Thu, 21 May 2020
 13:06:42 +0000
Date: Thu, 21 May 2020 09:06:37 -0400
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: Felix Kuehling <felix.kuehling@amd.com>
Subject: Re: [PATCH] drm/amd/amdkfd: Fix large framesize for kfd_smi_ev_read()
Message-ID: <20200521130637.celg23pnqivdmaei@outlook.office365.com>
References: <20200520135306.11221-1-aurabindo.pillai@amd.com>
 <1c09eb78-f2a4-3f20-1bee-2590c35b982e@amd.com>
In-Reply-To: <1c09eb78-f2a4-3f20-1bee-2590c35b982e@amd.com>
X-ClientProxiedBy: BN6PR03CA0001.namprd03.prod.outlook.com
 (2603:10b6:404:23::11) To BY5PR12MB4082.namprd12.prod.outlook.com
 (2603:10b6:a03:212::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (165.204.84.11) by
 BN6PR03CA0001.namprd03.prod.outlook.com (2603:10b6:404:23::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3021.23 via Frontend Transport; Thu, 21 May 2020 13:06:40 +0000
X-Originating-IP: [165.204.84.11]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1a09ba1f-9178-4282-22fa-08d7fd87ce97
X-MS-TrafficTypeDiagnostic: BY5PR12MB4180:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR12MB41800451EF6FEE477D381AFE8BB70@BY5PR12MB4180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 041032FF37
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w3c6+GLy2O7im+fwXaGO4uaCDz7TCr7ZfM4nkuLLtYr/SgNi7ckPrgo4OYK7BrN8kmMcpGIzR11mw4xS5VmVPDopMJKCo/CPN8viV/QAZhXmuSuuZJWdJ0maWD5Lp+RJNC+wMrVh7pZRPhFRHOB27Hl19NfpEwlPdf7XWK6vQyw3cvXhEJLCyU1tGnG1IFKRJXwmncdhZwYopAY811tVsmM82Y7FvKMaBgbhQwhf3GSTknzN7/lMDFRmpr0Zp2fyy9pBT6GaUc/3IC+d36nLJaAoelLTs/d52i7gPVwSRZYrfIRAq5Ju+6RzSydxtLjT5TS5iRlulAMqmxuKItILfwdlkLhk6CHZBPqIYNr4fdgYzrETnTUURU2X7ElWLQN2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4082.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(376002)(136003)(366004)(39860400002)(346002)(396003)(4326008)(6862004)(956004)(44832011)(2906002)(55016002)(9686003)(66556008)(86362001)(66946007)(1076003)(66476007)(6666004)(8676002)(316002)(52116002)(16526019)(186003)(7696005)(5660300002)(44144004)(26005)(21480400003)(8936002)(6506007)(478600001)(6636002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: MWdbhXxWF1Gxz8O/lhN2/aVKgRjcQ4CBZBRilFz4wxrqy2QVXvrwh+C7sJ2Eb0YVs8kHuY7LSgS7L71S+sJ79MUcCGFnCSCrGrblJlUms9T6waTDOVkznMZQTsDz+a7k1VFaTUuGpP4hvfQmgs5sjgP4iVhOJpzer7Yva6gPnYm7otDi7N1r8oe45xgHUFca1HlBjBuALAsSNYDmspuDYopcG3k5zNcqVj6GnIylfUZsCiEo7pmkMp+UgV2xznRlR3tK13IegRVGoOGHawKZiJluOKaZsw+aIXPdSyB0MFSZdSqFXEiKyTJpHy5p80s6XENbMDMMN9j1UAZz+rjOMh1c7tuZbXxE2bu04KrPQp/yYPTj8gKOL8ceSeX+jvrZhiWYiSqgnr+0tI1c+OXWlEIJnXTR7kcOcBqwQ7yyNJ7O1jHcbiib6kprzWKSgQUwaNWRMJeDORTwubTBcMn815sQY6lzgN7rQG3aD8wgmXQ=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a09ba1f-9178-4282-22fa-08d7fd87ce97
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2020 13:06:42.6305 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cEm+KxIIHb+cQk3M12kTLpA33WxmqTz4G20HOC1R5iu+CDfDBSN6z8YRWhj7MUdcMp8/T79KuilRWXAqxh76WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4180
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Amber Lin <Amber.Lin@amd.com>,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============0259173903=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0259173903==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7dovo3om5iboyszh"
Content-Disposition: inline

--7dovo3om5iboyszh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/20, Felix Kuehling wrote:
> Am 2020-05-20 um 9:53 a.m. schrieb Aurabindo Pillai:
> > The buffer allocated is of 1024 bytes. Allocate this from
> > heap instead of stack.
> >
> > Also remove check for stack size since we're allocating from heap
> >
> > Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Tested-by: Amber Lin <Amber.Lin@amd.com>
>=20
> See one comment inline. With that fixed, the patch is
>=20
> Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>
>=20
>=20
> > ---
> >  drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c | 26 +++++++++++++++------
> >  1 file changed, 19 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c b/drivers/gpu/=
drm/amd/amdkfd/kfd_smi_events.c
> > index f5fd18eacf0d..5aebe169f8c6 100644
> > --- a/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > +++ b/drivers/gpu/drm/amd/amdkfd/kfd_smi_events.c
> > @@ -77,9 +77,11 @@ static ssize_t kfd_smi_ev_read(struct file *filep, c=
har __user *user,
> >  	int ret;
> >  	size_t to_copy;
> >  	struct kfd_smi_client *client =3D filep->private_data;
> > -	unsigned char buf[MAX_KFIFO_SIZE];
> > +	unsigned char *buf;
> > =20
> > -	BUILD_BUG_ON(MAX_KFIFO_SIZE > 1024);
> > +	buf =3D kzalloc(MAX_KFIFO_SIZE * sizeof(*buf), GFP_KERNEL);
>=20
> kzalloc is not necessary here, you could use kmalloc. The part of that
> allocation that matters will be overwritten by kfifo_out.
>=20
> Regards,
> =A0 Felix
>=20
>

Thank you Felix, Alex for the review. I shall make that change and submit i=
t.


Thanks & Regards,
Aurabindo

--7dovo3om5iboyszh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAEBCAAdFiEEQx2/asct60LX/aRkMN9QjD+bPfYFAl7GfN0ACgkQMN9QjD+b
PfYUvwv9Eho5uw4SuDh1lA1S0DoEOPts49vSWmzyDsvWito2U1/ikcGTzZDO3lng
sxN1/GMIGowvpFdY4zOspfQ4Jago7TsEJ6NFre13FWUdFvG6y7eD8ppMrh0uW0BB
F5zw6EbdZFOaPjK2iICQvPdtLO44Ps1ahmk5ozO4t36i3VTwfiSnMcY+26ow5mM6
TZpys4cjXKrUFUpstMsazA4D+prX2tIRU6m/AdSeIIR2yrhMjpYDgoWo3hkJEh0g
vik+Dnf2Kq4WzNaQIxyCEpSanvuHox5A1wINt2M3Z4jA/2wmmt7ySzEvZxhdHoZF
7Cq7g/iEgR3qwq9urco7CyPdV2ClzG1gefdYnBR0oEzLA77n7bBIPmfkdXfL8Hr1
Id98EX/oIHII5fyKulNIwnGLJiABx1vzPhbJPJxVEVlx7leG6l0VRNkzCy8hxv+j
fbqR1HWmbpyTPzPZIvZxqgtHMm/ZtGuRLN9CzRpUHxjcTBn4ZGlTnRK/A70RLIjg
ad7FJFYd
=2wO/
-----END PGP SIGNATURE-----

--7dovo3om5iboyszh--

--===============0259173903==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0259173903==--
