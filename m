Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F16E266812
	for <lists+dri-devel@lfdr.de>; Fri, 11 Sep 2020 20:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B51256EAD3;
	Fri, 11 Sep 2020 18:09:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA6386EAD3;
 Fri, 11 Sep 2020 18:09:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVpehtXVdP9hUupjeAHB431UqcunMpHhBVjkT/aPp5ZzuJPFvDEQbki2YJUTWKtorFtYlfRMWs2woD7ctb69ZiV0mBLkN1WykPTnd2uxASK4FbZ2WbPwNkBipEVO72fwam3cNn5Jv+tXJr9OogTUHtZ3xLvZ1uyAxvoAcvRA+2Y22aLMQw21H8XvYvRsC+54B2iWlU1VtToxICnAqS5Na3nSnJZ7CHD2bm62VJvTzqOY+MsNmLpUEJVqskN0pFOHqGdKLceLyzHOWG91UPxmQvYLwBRSUuaYywg/Lled8Ysntn2PxsxcRrxmw6eARl5Qra1/vE4JrhwotLpPdV0ndA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQR0v0/hwRey7LwjCQK7z+cfamBPZLbzCBDKAaXgw5Q=;
 b=CGrvc8w9UIKhv56Wx2dgGO1adn/WeLUR0jEbTzg2H9bXxn2bqNosR8qj/KUyia4QFvvSyh+B3HxXY7EMvlhQRGe0vAaFI5mFTgR0nQZoscNMijH/rGDeukd4TAKFWqCJDOKzALbgFnbV3qfsd/K37xHZ9UdF0ulPY2TyGjlyzJT1SrQwQMSz24FL93biiXkG6hjqYXRQU4nZ2s3fG9UpyubqHFJKv/XXyolnEzrrfO07OEWPiHzmnuxDEcqsBmzfQpXL5dMG7rQm5kz/PTGjVXbhOQ7SqId+GU9zBV8jVP5ZN176fvX66gDF40ZzozhiEi2X8OzWIP+c10e5gPHrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQR0v0/hwRey7LwjCQK7z+cfamBPZLbzCBDKAaXgw5Q=;
 b=gPaabDBprYKLWfcq8qfQNopbrwxfwkkmbXLxn1X2zqzzD4Ncl5szjOf+zY4/3A4jsIc4rss5Ns0nWyktnxshQzo9XvEHKvQjuPAPTOsEE15LRi3ia1FZsImb5KsQ7CcL8znSSMl0ctDgz937eBFhojy86z97AskgVB2apj5JU4g=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.17; Fri, 11 Sep
 2020 18:09:45 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::25a1:ace4:4ca8:167e%8]) with mapi id 15.20.3370.017; Fri, 11 Sep 2020
 18:09:45 +0000
Date: Fri, 11 Sep 2020 14:09:32 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH v2 1/4] drm/amd/display: Rework registers tracepoint
Message-ID: <20200911180932.ab24uwwsrwl4vpov@outlook.office365.com>
References: <20200911145927.401322-1-Rodrigo.Siqueira@amd.com>
 <20200911145927.401322-2-Rodrigo.Siqueira@amd.com>
 <c1eacedd-056d-d6a8-0407-2dea63f47bd9@amd.com>
In-Reply-To: <c1eacedd-056d-d6a8-0407-2dea63f47bd9@amd.com>
X-ClientProxiedBy: YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18)
 To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::e9a1) by
 YT1PR01CA0005.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3370.16 via Frontend Transport; Fri, 11 Sep 2020 18:09:45 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::e9a1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d0a034d9-21db-45f7-1687-08d8567ddd42
X-MS-TrafficTypeDiagnostic: DM6PR12MB4092:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB4092799F137D0C35CF50C1C798240@DM6PR12MB4092.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFxRlem0EXGmBQtijNUeSBfBUEIlBpovfP7J73xamJrqPN3Oqfmhk5lhzOi4neRWabSHs9uHf3zsfr9TT8cIK/XbjuOtlarylMRBuf+6xiWJLgyg52iPiNKM164CsMDrMb/YyfUBtda3o9/M6lAFD+YmWf9m9j9ENqVwDXFGrhik/58d8F+rMULvX4PISayMmeLZUoIQkL/NQZwQefnMFXpuHBwzFIMW/SqQdjCct64/X46Ycld21esdDUDySkkz+WIBP0zLbq+Jb1y/9NYZfLxXLfehd0IEY9AjzohMLuYCKOYkG3m2CVKPLkKGYLmfY7PXQaYAYeEkUDWxi+6/ZQ5CITZ0wws4BjRwUjoTDG4LEoXI7h+9XJcGHSkgWgeJkQL0Br0X6GL+sf+r8+pIJMNG0TynVnS5D6af+uYV4zKep6V1/5kXR8hIvE4cuAE6afUn0SG8zTt125SbbkWm9wwiTNQTsxXxElffdcv83IDbQg7E15Y78/NNwVZW3lQ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(376002)(39860400002)(366004)(136003)(53546011)(1076003)(6506007)(450100002)(2906002)(8676002)(6636002)(6666004)(966005)(86362001)(66946007)(9686003)(55016002)(8936002)(4326008)(66556008)(66476007)(52116002)(7696005)(54906003)(6862004)(478600001)(44144004)(83380400001)(316002)(186003)(5660300002)(16526019)(21480400003)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gAnYTm5+mdExg5Bce9tuT+5H1xgpr5AN6kWRgNfiwmE+g6NvrZY606+MMm6TTE5P4/vUHStk3V5hBvr/AyGoz9V+S37N3FsytalADqVGqY96LnU/OEnUhG5EYTI7IDmLzoPZHay4QL2vSYLuYpyXj8/01GLBcLoIcYsZkSKv7lU8w8G/jbECYRSLOylYPwiOPlRxENFHSzsqRReRP1ocn+9zIZxTcMAUIS6WCmkBIdAv38NoUtvz7Pf9eoEZhFOT/91un04sG352wzKnuWUh3diYCRS6TQXINv2GtwXQPN5ZlrfGhOyJH1X48duLpKB+xSioORA+RGLX3XUKqIWrvn9V7Fm0x/LhAn+ahWyddJTNkIE7sAOFNc13QWCnx02aVOdxgOn0zh3tNt5zMCaFS8pjt3UCaKtWg8MjXc4YnNuLX7CDUQ62bB5tP+ZWfJhdUWkT3mRV6f6Ivi7NX8kvcebNQYnwl43QlKVVJAnpegKQv1lxu4b5jTDgQHCABhFRS/Ll3PGqnPVaJL7KYSiRbbALPB4F7saXxwVDAo5mQg6yJOCnsiSv2cz9+WE6jfAwNvwvglvwf4vgwKc0RS0uSDlrvIGkoPUIG0+iAL5bRqpg9IdmV4DhKQmU3FQx2iG2iUm5xfYEknERvNJg3k+AYQjaHxSHBpYVJ9NAp0zunN65H5bYgvimNwRaCSnxndMO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0a034d9-21db-45f7-1687-08d8567ddd42
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2020 18:09:45.7046 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJ2lZxyGl5PGQzQTk89FNPyfKjHeVtRhTQZUSohc7RNFi2DuLyxjj3Wocrm2Aan6RACH6fpaWv/0kGqyLY7KUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
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
Cc: Leo Li <sunpeng.li@amd.com>, dri-devel@lists.freedesktop.org,
 hersenxs.wu@amd.com, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0228709487=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0228709487==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qh77olhcnzku5sws"
Content-Disposition: inline

--qh77olhcnzku5sws
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/11, Kazlauskas, Nicholas wrote:
> On 2020-09-11 10:59 a.m., Rodrigo Siqueira wrote:
> > amdgpu_dc_rreg and amdgpu_dc_wreg are very similar, for this reason,
> > this commits abstract these two events by using DECLARE_EVENT_CLASS and
> > create an instance of it for each one of these events.
> >=20
> > Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
>=20
> This looks reasonable to me. Does this still show up as
> amdpgu_dc_rrreg/amdgpu_dc_wreg in the captured trace log?
>=20
> As long as we can still tell this apart you can consider this patch:
>=20
> Reviewed-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>

Yes, this change does not change anything from the user perspective.

Thanks
=20
> Regards,
> Nicholas Kazlauskas
>=20
> > ---
> >   .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   | 55 ++++++++-----------
> >   1 file changed, 24 insertions(+), 31 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h b/=
drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > index d898981684d5..dd34e11b1079 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_trace.h
> > @@ -31,40 +31,33 @@
> >   #include <linux/tracepoint.h>
> > -TRACE_EVENT(amdgpu_dc_rreg,
> > -	TP_PROTO(unsigned long *read_count, uint32_t reg, uint32_t value),
> > -	TP_ARGS(read_count, reg, value),
> > -	TP_STRUCT__entry(
> > -			__field(uint32_t, reg)
> > -			__field(uint32_t, value)
> > -		),
> > -	TP_fast_assign(
> > -			__entry->reg =3D reg;
> > -			__entry->value =3D value;
> > -			*read_count =3D *read_count + 1;
> > -		),
> > -	TP_printk("reg=3D0x%08lx, value=3D0x%08lx",
> > -			(unsigned long)__entry->reg,
> > -			(unsigned long)__entry->value)
> > -);
> > +DECLARE_EVENT_CLASS(amdgpu_dc_reg_template,
> > +		    TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> > +		    TP_ARGS(count, reg, value),
> > -TRACE_EVENT(amdgpu_dc_wreg,
> > -	TP_PROTO(unsigned long *write_count, uint32_t reg, uint32_t value),
> > -	TP_ARGS(write_count, reg, value),
> > -	TP_STRUCT__entry(
> > -			__field(uint32_t, reg)
> > -			__field(uint32_t, value)
> > -		),
> > -	TP_fast_assign(
> > -			__entry->reg =3D reg;
> > -			__entry->value =3D value;
> > -			*write_count =3D *write_count + 1;
> > -		),
> > -	TP_printk("reg=3D0x%08lx, value=3D0x%08lx",
> > -			(unsigned long)__entry->reg,
> > -			(unsigned long)__entry->value)
> > +		    TP_STRUCT__entry(
> > +				     __field(uint32_t, reg)
> > +				     __field(uint32_t, value)
> > +		    ),
> > +
> > +		    TP_fast_assign(
> > +				   __entry->reg =3D reg;
> > +				   __entry->value =3D value;
> > +				   *count =3D *count + 1;
> > +		    ),
> > +
> > +		    TP_printk("reg=3D0x%08lx, value=3D0x%08lx",
> > +			      (unsigned long)__entry->reg,
> > +			      (unsigned long)__entry->value)
> >   );
> > +DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_rreg,
> > +	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> > +	     TP_ARGS(count, reg, value));
> > +
> > +DEFINE_EVENT(amdgpu_dc_reg_template, amdgpu_dc_wreg,
> > +	     TP_PROTO(unsigned long *count, uint32_t reg, uint32_t value),
> > +	     TP_ARGS(count, reg, value));
> >   TRACE_EVENT(amdgpu_dc_performance,
> >   	TP_PROTO(unsigned long read_count, unsigned long write_count,
> >=20
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--qh77olhcnzku5sws
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl9bvVsACgkQWJzP/com
vP9nnw/+P6x8xak96XDi0w9DsNM8j3BM6FGyDsysaTKng90dbo7n3SPw6zE/HnjK
a23o8mQoahMpqhCphE2RBqCfkzeuz5NcgKl4yAln7WrhnpXYmcVpKHGBXQvcjnWD
mtNV2R6+QScqF1tg/4C28pGse/nC53W9lQiYbrDhc4jCMhaqDJEhAGOz+M61+Fj0
kxmoXGra5SGd4JCaEwB3RJlTn2nPKQVnfo8gdI8juzm1MDP3b/pOC/YQq3rt/7Ky
Smfz3li0OJQSHhkfY3aPwfPnTv4ekmINkw861dPSVgePE7AgtPWbrbBH9IMvT1/S
RGtVWAaRDi5VyKNBvMVwmXuk/dU0v9QTKQV0r1GC/Omi65UOFy2HfpKczrUdIQJe
AtrCzGboXQipSu1j5v70m5lIbU1m1uqkW/PbdrLlm8HQxk3eT0ACVrIfwGNkeJxt
VT33fq8f2cnYCf2mo8D/hZTDTNLT7DOWoWGc+8cc8b7XM0UhzMCreWEjTOhLNxYS
xheUGjfnSzdcK3FR70+Eb9esZ+UbBhD4kSKussYUyLV5QipGKgv0bkDSTXOzxj3N
qK84f2FeKlapMLqfICx8YfIjnLt7oWZ2MIs0NsGgOb/IEuEKxN2JxQMwQgxnliCd
4f+uWBrYfaIhU3O8V2ZljWww166c7lV/I3d581rOEeW+jYO9YYY=
=scJB
-----END PGP SIGNATURE-----

--qh77olhcnzku5sws--

--===============0228709487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0228709487==--
