Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB53681105F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 12:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 579E010E76C;
	Wed, 13 Dec 2023 11:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E846A10E76C
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Dec 2023 11:42:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4Gu3oGtEdlWuvfvcfX5J5yI1fOmn+wzloI1ZhScS76ZBz7bSk/3KTjtst1rJFcv3s9I/4FcZkjsVla+Cbcz+ixAUfW65gOtq6x34gVxjh/vAyD4HgMrf/DzwDs9IWbgDJvIXJl6YwlLMpmqIG8L/59MT/5+UlXSfr4vydgs16r6cuohdZhBz66N4lFUrBtLtIxe2zeDP7KyfUnDy5awZke6lDDt+TOfm9+8Fuu7T1jlYBE/PGGSTI2UMVLFnDehyV+bRK5dKIzQoCXzfxHCnmc7seFABXoNnU+uuJV8k1kej+zIySmiAAhk4W+Afg2VcbuEFi9fJswn43BjGkAmEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kgw0+wLm3l9C8h8SvsNaxwwfCBAyc+yPBHX6o7b1Yo=;
 b=XbOVHVjnHbkrVAkR4IoDI48u4leJclyPymNPFyQWJvuycmmLMXbM9ymsCx+kvXGTwCX6MtCBmLSR2JhN3hHD/KNLMoWwBiHd8EbDzAfehtLvma2gr6geOjS2zfUdp70PXi7AYZu9QtGGgweTs9D7db/O0zoRQc8sXorZ1+PSsX6hdVA4x22p/x63mOtNMS+N+S7k5xNH1YFXeuoIVUpT/ivKc3akw3M9NFrcioTEP9nS8ICuV+kyW2AJSNyKxEloNUCzSjc7UMvR6JVNBovuBxo7EQ4Efwbo0mFQjejEB3ZOuECNX1rXHzAjRRqpSwGe9jXpv+QuKal67JE4XLS4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kgw0+wLm3l9C8h8SvsNaxwwfCBAyc+yPBHX6o7b1Yo=;
 b=alP55o3+IAiIYUUtAr+FXgvs0hyNSDHGG7k4555rIEOjj1G2cpqalni3viPl+zNy/8XEBzJX1JAdFjjgpTNCyTCY+XX1vStdm7y+SgSDkYv+BfMpZgMNsdEyNUhZ65F5EE1UtTy92RiHgS7zksR0TS7iao402Bf5f7z+pAVZuBIASk7VSS/ZBHiZ8k8Nm1zMDu2gllLzG86RdV6QdT6Eqjl1ngqNLcZ99NzJSygxsfiC29ZfMARs6LlUcCrkh78PPEEqQ7DgMC5kDZuwX0/3VDAdT8Avx3QXjPn4eGJ1nyauzi2jEbz33JAPyy7KiRyfyPXNgrdvp83NkEQ4xhRmZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM8PR12MB5413.namprd12.prod.outlook.com (2603:10b6:8:3b::8) by
 SJ0PR12MB5633.namprd12.prod.outlook.com (2603:10b6:a03:428::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.26; Wed, 13 Dec 2023 11:42:52 +0000
Received: from DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::929c:d330:53e2:c5d]) by DM8PR12MB5413.namprd12.prod.outlook.com
 ([fe80::929c:d330:53e2:c5d%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 11:42:52 +0000
Date: Wed, 13 Dec 2023 12:42:47 +0100
From: Thierry Reding <treding@nvidia.com>
To: Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH] fbdev/simplefb: change loglevel when the power domains
 cannot be parsed
Message-ID: <ZXmYt79FrdCxjR3x@orome.fritz.box>
References: <20231212195754.232303-1-bmasney@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="tWgDkqp4n5V+OY9i"
Content-Disposition: inline
In-Reply-To: <20231212195754.232303-1-bmasney@redhat.com>
X-NVConfidentiality: public
User-Agent: Mutt/2.2.12 (2023-09-09)
X-ClientProxiedBy: LO4P123CA0226.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::15) To DM8PR12MB5413.namprd12.prod.outlook.com
 (2603:10b6:8:3b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR12MB5413:EE_|SJ0PR12MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b5355f-b50c-401f-a3ed-08dbfbd0a404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Oecp30Naza4jce4aJXGnCPU3TYyVUSEHfrp/1PpbMezY1b1kUs/AbH194pWgHSgcx0Yo0Jwd87QC6fDCdyo22qwRGeNDXF4jVAsnS6uGIKbvIeIKn4fMjwLmq56MXXFEuaWNX9Muj6A3kzVjXbpiaZ2nGzYNfq6vD0Ey0fKVPYFAkWXOcK0ANwpsFzMXhXjCjf2f9pqPa4u8kY0Dc+EXHGTNYFphhbziKq7wmM7wTcXi8x0F0VpLNBFoT4KbquodE77KKZosFS9eUisYVgTAD2Koji6EomyMj8ob1gQk2ykEte/0PpRoSb4xCgAGlfqGUtvp5mggaFZou3JC/5Z2JGDwBsDeltnwyxq0qLs5YA5q63VfTHSlc7Gs+bckVtaWGbZGDmbe6/AWsT1lhRvJqQ0GzMpOAuESQq7nAyI4yQVItm8U8UcN74oQy5bVI5sX6+NjOuKUM7kgKYeoLBP48h87mvxYxfSqYDGH/UOil+ySHFIdANxm2KM7vbJOiqSxEiWkg7uIXqnPy7t5y5hXp453hy/yCPQ2erJCs5snya9tUXuL7n9Hh7eXE3wDca26OUNLh4fJiaLQOMB3eyAfMR0mAb3XhfUi3GACfZx58jtJEDKeczfpObyjJzHOH2I3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR12MB5413.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(136003)(366004)(346002)(376002)(396003)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(66946007)(66556008)(66476007)(6916009)(86362001)(38100700002)(83380400001)(21480400003)(9686003)(6512007)(44144004)(6506007)(4326008)(6486002)(2906002)(316002)(6666004)(478600001)(5660300002)(8936002)(41300700001)(8676002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Hv4lfTz56J+rC3/o6xNOMBCfn0LnDZsuOqtRmni82/MTezmiP7gZsndgDF5k?=
 =?us-ascii?Q?nH30nI4zXBRSP+Ih4F2ynm7bL7eyIYXRG10+D7IApiBLLaP781swNKNliN/0?=
 =?us-ascii?Q?a817uDiCVxP4SrAAMR9hoOgp3o1XCobIoPDtAwYIN4QYic++dg0X6yMbIKX4?=
 =?us-ascii?Q?05EU5tXD8jyeRWUan1FJRIrywDmLRrlp2dSzJN/gEVhqLAT8M/7TGKg85A6O?=
 =?us-ascii?Q?fn/ELZ+LdWprq7ZgxvlNQWlRbQBmpAziK17y4p2TVCDoVUIzhs50FbYYeVHK?=
 =?us-ascii?Q?XrZ15VKfYBxeHpgtM3vetE/ohJ79iJFbeOUzhtw0tnpcLUVtkOnrx1RzqtlD?=
 =?us-ascii?Q?v5AI86W3cVB8ugDF8gIjd8U3DTysveGigC/0NyH42GtlWQRQCFcHYGybelMU?=
 =?us-ascii?Q?zaTWmDUsgYphyqMKKs1kWpc+OZ9HdCTtXHc84KjW+mixlp0zBzqtsNnvxS2n?=
 =?us-ascii?Q?l5q6FJe6tGTopnJaT1y0nCAEwutxHk+Q+NgEDSfrdsGwVXZO2t/M2RA2P6BM?=
 =?us-ascii?Q?VgxyQ5sbhBg+0gJCC3DlgZHhuX8qTJ2Joi1TFZ9N1fzD7GFRa0TifZIaoaFn?=
 =?us-ascii?Q?F+wQUyzZvCQ0E5f5Z40KDekUHMjaGK4DJb7Fy8JqrmJSw6fO8xK2auPdAiwD?=
 =?us-ascii?Q?gct3e6zGcsC3Vuj1O4GnZ3GCU2aZlMXH144Pztl/YilWi2x+ULBnqMt2hPka?=
 =?us-ascii?Q?7TK3gwzzyPmK3rp5Dh4tmL/0aVvL8qsaXADMx0Riv8v/JnS7h1+ze+K+6Be5?=
 =?us-ascii?Q?4B2eR6gIUVt6Cvl+lyhlvhwmz7wXycf73ZaJJrXRh5cbKrXikDJEfrS1skdN?=
 =?us-ascii?Q?K182FRRjMsXM/tTJNnF5/oLxcWbfZr8py2lvh70g+Hj7mz6hjOtt3CGlEiPg?=
 =?us-ascii?Q?mUvv7p50+jC4/wlf3pKntDx/1LtUoZEilb7U8hLOODau1b5ZgN83HvAq/sPE?=
 =?us-ascii?Q?Y0keWMH7uomcGLdZL0H+TaFHo49noNBxHITtiIP5cjcS9ELMmzrmTkZSZa+a?=
 =?us-ascii?Q?y/+nubZ3aI6ql40rgc3PncG5Pf6ArD6fIn/q/WkzOOn/d3/Py//xjVsCYAPc?=
 =?us-ascii?Q?rJQGa1O38pmPGn0+niPwFgyVYWMv+/sYRbBKacqIteS0m/3nik0uivpFGsN5?=
 =?us-ascii?Q?ReqYOxS58Sk7vJeV6fbPbh3wMnU2/s/GuGg4kFu9C3J1cLALY/g0ydJ+VjUa?=
 =?us-ascii?Q?sMDYbuPF7JNQDKJHnf6MBGsKAs6rHOTgvCl+nZkmr/fNkdOVOYHnGR/lfM6v?=
 =?us-ascii?Q?EbR5XkXQV9KLvxvi5ZphrLM6wKJjToBdszJkzCSCUDsSpF/keT8fdX/ZL9PU?=
 =?us-ascii?Q?d1e2mcsvtWmrY7TD5mByZN6KNpGR56o4Vchju/euQyl/9aWBlocRvGZqORle?=
 =?us-ascii?Q?7GTEsbBoX78K+8CMY97eX+U7R6DlySQGbT6MoK0gagltSqq9ywMzv9JSL0BH?=
 =?us-ascii?Q?BBm2f3av+4wmWaFpZ9Dsypb18ttp0zBw5Iz97CkpS5aeyo59eFFHL8lRmOhI?=
 =?us-ascii?Q?nJxMOHJzGaEalBCrxiHobmZdbcdmKmEbB1QU4m2Jskiw0EvqMDzt5zsC000n?=
 =?us-ascii?Q?OVgyB0Z6+Hdr/hugH5jO1JuR/MhE94yi4euquqw/+Wj4cnS//Lns6h6j6/d1?=
 =?us-ascii?Q?gy6xog1knwiSXNuVS0CNvfCtzczzDmWm0vIawOlBjBbC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70b5355f-b50c-401f-a3ed-08dbfbd0a404
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2023 11:42:52.8146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V98YvWAni/pFX+D9HYW3ZTOITJFt99oW2nK5AmPENQir94Fdj39WNemMoH7ZIRul6NVJ21H/6CMxEmVF1smBNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5633
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
Cc: hdegoede@redhat.com, deller@gmx.de, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--tWgDkqp4n5V+OY9i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023 at 02:57:54PM -0500, Brian Masney wrote:
> When the power domains cannot be parsed, the message is incorrectly
> logged as an info message. Let's change this to an error since an error
> is returned.
>=20
> Fixes: 92a511a568e4 ("fbdev/simplefb: Add support for generic power-domai=
ns")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/video/fbdev/simplefb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--tWgDkqp4n5V+OY9i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmV5mLUACgkQ3SOs138+
s6Eaig//Yk9Ag8MQJ63Cl9m28NsJF2Kn/3MonudTYCnzvDdtHUlbGFG1oA+SdfzB
fquk6VW9WkFYlPMQcDSjdfqLrGZmMO9LyC6rhoWlcQRtbXPZSGmUoVPLvY5dENvS
aCjgdA5at5VDGprRAO3ZXd9baBKd3qpKanqs0QzourOEt9g3MgsLhDhzpkFeot5c
b8O/jx4l4/DMSaQ46FMd/etSTzsI7b+1OeGFdkbEZHk3/fE5let+2700Jh1ABCPx
jMMC+pQ/1O7xiYlKuSBzmjCn+Wqe3Bvv7wiQvLoKD/fmud7D4mawZLPt2EP+kgKX
uHSYw5zMuXmoAgtj92j4qY8KxkMv+F59NUxJ8kKUcgGQQKK/W+KYL9AxIcUWpPBD
sdj3FY+HQbranacxAq9bCYGKoiJeFtpfGsbMDGMp+CvLt5TT//TOXQRg+gTTji74
+JFC8K6fzXEg3ehg89NvGYKoZmw/rYy9VONgqwsi9U7qZQ1t4HIPL/zxnk0KHuy9
n5UB7l1uCuHA91rkTyDfi6c4qde6Hunho2dKJsG2xhFmn8TRiJ/YB89pifmtWhhA
C2TgZOS0zAV17ld2d6XpbGRNe7CldY11TP7S6+lWoYSKW8ZCN+PSzgWAecn0uEkf
lggmjTlrhB8WD43cJVPEkVkCwY06wM7QMBFeBR3EqUgnwgVh6mw=
=XUlP
-----END PGP SIGNATURE-----

--tWgDkqp4n5V+OY9i--
