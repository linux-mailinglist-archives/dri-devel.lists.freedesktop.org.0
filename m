Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD431342319
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 18:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345166EA5B;
	Fri, 19 Mar 2021 17:20:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750058.outbound.protection.outlook.com [40.107.75.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BAAC6EA59;
 Fri, 19 Mar 2021 17:20:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6n3aGKFUhKyxtkEfrbb+4I4d2WyoXmkZmT1d+ISGvPeSaaEbQfSoOgtIfshzUrxAxzbs2fIKucSGiBb9C7/mYsQf1j386UNQoO3uEOQC/QB0vnEfCCTZM3Q1Yu7d9c17TPyJ7xxFNEW/0W+/XVqv0GpLn7ikb0sUimNB606f5Gd8GlXTM69iynaGlJ1ddDl23x/GSrk5/FrTrpMPOMr+WdZGmxHQ1cZbWB72jyJnG02mnn8YfhS2bcjq7IznFvXKmsCF58u7bxzTkNxlMV9qKL6DH7f4Wzbo8zy3DB6ebFR8yl7Kn5CTP5M7kB31X4AurgsX0jNkvcv89vzoMyExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNCqL8ZeURfEqLdsEEA9VlPo2D/xS8zDQqkMZfDALhg=;
 b=TjLjt7DzNHKEvDBiRC4wxdYFenyxmlbphotuBrYNnAF5fwpsM6iqpCOXMB1xGFkXZVBbD0qR5Dl3Thkkb+0+OFYpxhgah7ng/SDYDAAem6D7z0NknYkrDcWzOeJLxNWOKfeo2TNL23LPsipiyHAeqHghSZwHlHOB/j/aG8GJK0gaPq1C8iNg2A1vV/CLIFk7r1EbeTKZVejgbXYT7WiJODyW6EwTpprUheAV0BWPvNEme6Y24ZRrnWGiVEkdBB9DGs3zc3mlHo6tK65z6hOLmSRDvcSGFMbrqNDlbAdrmjaVGi/XAzZJStUUJJTMdh/5kltk8D37WyVaqohaTEwqMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eNCqL8ZeURfEqLdsEEA9VlPo2D/xS8zDQqkMZfDALhg=;
 b=vR4Mj0+mS9tP4l9ZE2SbrLkVwTfU7D+NrpTmkZ5P7Qe4x7DPUoOWMTq2Xalm2wFp7u660vpYi48YWFSrEPyB+VwmXlWdOf04L/+3Jg37CHxe0siMRqNE4VzzC+l8CUCXLyoQnr8h+o4ow6yRWQVqxfiEylyjg+yAeQIyjYGf6Sw=
Received: from MW3PR12MB4491.namprd12.prod.outlook.com (2603:10b6:303:5c::18)
 by MWHPR1201MB0191.namprd12.prod.outlook.com (2603:10b6:301:56::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Fri, 19 Mar
 2021 17:19:57 +0000
Received: from MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::a10d:f9c9:4529:6422]) by MW3PR12MB4491.namprd12.prod.outlook.com
 ([fe80::a10d:f9c9:4529:6422%8]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 17:19:57 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Liu, Leo" <Leo.Liu@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Liang, Liang (Leo)" <Liang.Liang@amd.com>
Subject: Re: [PATCH] drm/ttm: stop warning on TT shrinker failure
Thread-Topic: [PATCH] drm/ttm: stop warning on TT shrinker failure
Thread-Index: AQHXHMlwHa+v0OvT+02pV6vjPUJ+bKqLjoTb
Date: Fri, 19 Mar 2021 17:19:57 +0000
Message-ID: <MW3PR12MB449102A7703858C82914AF8CF7689@MW3PR12MB4491.namprd12.prod.outlook.com>
References: <20210319140857.2262-1-christian.koenig@amd.com>
In-Reply-To: <20210319140857.2262-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-03-19T17:19:57.117Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.247]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 6b1a9537-54eb-46e8-fa7d-08d8eafb387d
x-ms-traffictypediagnostic: MWHPR1201MB0191:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB019125DFDF6A04602F1277EEF7689@MWHPR1201MB0191.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:337;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pMVZRVcloZmUCMWCI4m2Ba3mxoZvfSioYYKFUOyoy/mSdb2X+iVmOPEU/HV4Q/Ihi6kan8CcLaCJyp7vqdPo9ibzr/ZVlnxV9rCV8qE/gDwSPMigYyx18dtvg2oDnLRSAtBGneBOT955PbsRiCqrbyURxA0yOfh08LdmSZf3gGsaNmLjbJ3IsbTxPwJ7BB3qj1yln1LNVvtKRqw91kGxsHCTtTAfXlmzuIbOsYXy6JglGQVp0QWxVHcxRzJHsChTQ3756qxvbRwyAySLbAD+bSqESoI/wb8r+6m8I51h4Qu7rJK/smomqD1ZhXZQt84+VMP78ab8K/UFFyUzYIlQoBkR/SCP4rkRC2NN1Y4v4T3RGwR+FaYFCXS570lzvf2sXI2sgJWN48unN4MjSRDbl6BF0jRHyvaAokr/NDoEoMP9xISyiEFawtUGhQh3oirapQHo/44SiZ0BpYkIn6pLYOjp8eEitPFYuiUYE1Sq8cVDNHCr3XLKjXEo2PrIHA6YWuZBaXgEmtHRNb/1BROGXSeAOxRM+jEWtYGvvoixJq6CIlU7rANLEYw4gyv8LwI9qhdX5ExAJkOSWuy9ozTjPH+t7v8nFgeaWYnm0zAKPbbsJHgnwcVuwudpI25i1s/KV3baeF+gDs6ehDw4APsYJpA7a91pNwyzQ50mJVeT2Wi4uA2pxKaAx8p7Tkgx2PafEeGF8bi/DEKWK9zHKSWagg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4491.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(5660300002)(66574015)(83380400001)(166002)(2906002)(9686003)(55016002)(66476007)(86362001)(53546011)(6506007)(7696005)(52536014)(66946007)(66556008)(64756008)(66446008)(76116006)(8936002)(6636002)(26005)(19627405001)(8676002)(186003)(45080400002)(110136005)(33656002)(966005)(38100700001)(498600001)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?EPX824NaKTGdIM2e4fdset8CUoxKWRUZQ9maSnBVhWVniyZdPBfCCTOGdi?=
 =?iso-8859-1?Q?XdBNw4GDJxPKFnO5vwYadrED3fRoYAUOA/RZoInj9HIlYLFO17QZUlHfPs?=
 =?iso-8859-1?Q?fdAo1/78Dqt5hrJi9PNYy0QIMbL275oswkKIJyJEbDu8UQX6GjZY6QKsTf?=
 =?iso-8859-1?Q?N7o+zXh/kC9lvjfiT0oTWm5gacYZiBBDrSewgg8W3W+bcH0q1mJx4fMYZB?=
 =?iso-8859-1?Q?GyUItfQYY7TDLdmdWZpDan4a+SLxtYuPIqUiRUW243Yw8c//yELRsvdNi8?=
 =?iso-8859-1?Q?eD5T25vAa0xocx0eH2dLbNB6dzMGivjZs/cX02dLUjcAjpqFWs7PX/Td/5?=
 =?iso-8859-1?Q?idKe9FKUrPX9aLkhmLzLSib4Bi3nzgYlKc12YTJ15lnw1JDvu8q9yEiOAt?=
 =?iso-8859-1?Q?Cdw1hBrVW+p8ehCM4J3O8K/zL+4H6XMw0tkoApxZgygGu7VB/eMJNhXzxe?=
 =?iso-8859-1?Q?vdcJGoQfVgxiqr6Rv1z0DdIn8GQ7r1TYUTausiNoMWuhDJ9TUrsXJfd0uf?=
 =?iso-8859-1?Q?jbyt4j0hQVY4gtixoJPxM5Om6vaghViyaOE1/aLAujRudJPznkQzeP0MxU?=
 =?iso-8859-1?Q?6FY695hGd+vm5kIW6MKymDTWb98GjJkYwTxTYFrxSzZsOxiSb0ym1UVnuj?=
 =?iso-8859-1?Q?le0GAQYUg15jwOaFryMUxQi78MNciqBTAdK4aN633xcTJy9OtOwj5D2Q+S?=
 =?iso-8859-1?Q?w7HnRBFsaDdkE7piqqrebaMRklITrL6UKyLZiCo1WFC/Gt84qN6L+M8B3A?=
 =?iso-8859-1?Q?ZuvgVBvyg2wIahtVNy9xXrmKd/UYPdKItqCxBbjHhEb0uuzaidKG2XCM/b?=
 =?iso-8859-1?Q?G/07kPWRriDd9otxwrZc0dLRYOS9BklNFUJ5cXlsnuZQseNN3n87GL0trA?=
 =?iso-8859-1?Q?EUYP8MWIUC7ZIamkeKK7hNTARUh+84vd2LjVlGo0MjQ5FH4O8L1rlfzPT2?=
 =?iso-8859-1?Q?1e8uII/95U0bKe8w9tGH5AELauiefjpM5PtdGQxaByzpAkrktisWd9MpEv?=
 =?iso-8859-1?Q?cMKosMOlehl7ISQP33LzXk242k6ynY/WqOxdW89LSCWX+DI63YcQVyjjt3?=
 =?iso-8859-1?Q?CceWBs0O8NWQX1E7GSTSzXYdqnO5wCrTTGhmFZMwAVFZVa8WD2wDmTruaj?=
 =?iso-8859-1?Q?vNEo/k8ZcRmwhtF8jrVvCdK2p/J+SR0YXsagCkzg2Qk0SBYMojOf8jEhEb?=
 =?iso-8859-1?Q?SHPYUdEScU3iGPDB+X6nYLCbSSMFmtacCvB/70VkODb9AZQOEZE23w8BHx?=
 =?iso-8859-1?Q?NdM9neENvgsUB7lsnfR42PMAg/TxGwWBL4Bdn3w2ZO5Fn+S8jXbz1A9fTo?=
 =?iso-8859-1?Q?ynaLqccZr3VAW5S/+EM8uPbm0IXvq/G3glmmpFvBypRaMkH8615Wns3YVf?=
 =?iso-8859-1?Q?iHBwyZG7gE?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4491.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1a9537-54eb-46e8-fa7d-08d8eafb387d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Mar 2021 17:19:57.6584 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KccvM9Hip4Ssj7Ctx81rq6buaAPQaQ2jt4HgnNzKNtSmQ4znhS70YGLExqIotXnG1Ze1vxZDcND3pqwkGHCO0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0191
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
Content-Type: multipart/mixed; boundary="===============2043428458=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2043428458==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB449102A7703858C82914AF8CF7689MW3PR12MB4491namp_"

--_000_MW3PR12MB449102A7703858C82914AF8CF7689MW3PR12MB4491namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

+ Leo
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Christia=
n K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Friday, March 19, 2021 10:08 AM
To: Liu, Leo <Leo.Liu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@list=
s.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freede=
sktop.org>
Subject: [PATCH] drm/ttm: stop warning on TT shrinker failure

Don't print a warning when we fail to allocate a page for swapping things o=
ut.

Also rely on memalloc_nofs_save/memalloc_nofs_restore instead of GFP_NOFS.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_tt.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
index 2f0833c98d2c..86fa3e82dacc 100644
--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -369,7 +369,7 @@ static unsigned long ttm_tt_shrinker_scan(struct shrink=
er *shrink,
         };
         int ret;

-       ret =3D ttm_bo_swapout(&ctx, GFP_NOFS);
+       ret =3D ttm_bo_swapout(&ctx, GFP_KERNEL | __GFP_NOWARN);
         return ret < 0 ? SHRINK_EMPTY : ret;
 }

@@ -389,10 +389,13 @@ static unsigned long ttm_tt_shrinker_count(struct shr=
inker *shrink,
 static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)
 {
         struct shrink_control sc =3D { .gfp_mask =3D GFP_KERNEL };
+       unsigned int flags;

         fs_reclaim_acquire(GFP_KERNEL);
+       flags =3D memalloc_nofs_save();
         seq_printf(m, "%lu/%lu\n", ttm_tt_shrinker_count(&mm_shrinker, &sc=
),
                    ttm_tt_shrinker_scan(&mm_shrinker, &sc));
+       memalloc_nofs_restore(flags);
         fs_reclaim_release(GFP_KERNEL);

         return 0;
--
2.25.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Calexande=
r.deucher%40amd.com%7C70aef4974dfe465a06a308d8eae08eb3%7C3dd8961fe4884e608e=
11a82d994e183d%7C0%7C0%7C637517597539809703%7CUnknown%7CTWFpbGZsb3d8eyJWIjo=
iMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdat=
a=3Dkvyinv9FPakf76dvXF0pzfeCpclxAo3L4Ufkf6%2B6%2FCc%3D&amp;reserved=3D0

--_000_MW3PR12MB449102A7703858C82914AF8CF7689MW3PR12MB4491namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
+ Leo<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Christian K=F6nig &lt;ckoenig=
.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Friday, March 19, 2021 10:08 AM<br>
<b>To:</b> Liu, Leo &lt;Leo.Liu@amd.com&gt;; amd-gfx@lists.freedesktop.org =
&lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;=
dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> [PATCH] drm/ttm: stop warning on TT shrinker failure</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Don't print a warning when we fail to allocate a p=
age for swapping things out.<br>
<br>
Also rely on memalloc_nofs_save/memalloc_nofs_restore instead of GFP_NOFS.<=
br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/ttm/ttm_tt.c | 5 ++++-<br>
&nbsp;1 file changed, 4 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c<br=
>
index 2f0833c98d2c..86fa3e82dacc 100644<br>
--- a/drivers/gpu/drm/ttm/ttm_tt.c<br>
+++ b/drivers/gpu/drm/ttm/ttm_tt.c<br>
@@ -369,7 +369,7 @@ static unsigned long ttm_tt_shrinker_scan(struct shrink=
er *shrink,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; };<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_bo_swapout(&amp;ctx, GFP_=
NOFS);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D ttm_bo_swapout(&amp;ctx, GFP_=
KERNEL | __GFP_NOWARN);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret &lt; 0 ? SHRINK=
_EMPTY : ret;<br>
&nbsp;}<br>
&nbsp;<br>
@@ -389,10 +389,13 @@ static unsigned long ttm_tt_shrinker_count(struct shr=
inker *shrink,<br>
&nbsp;static int ttm_tt_debugfs_shrink_show(struct seq_file *m, void *data)=
<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct shrink_control sc =
=3D { .gfp_mask =3D GFP_KERNEL };<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int flags;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fs_reclaim_acquire(GFP_KER=
NEL);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; flags =3D memalloc_nofs_save();<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; seq_printf(m, &quot;%lu/%l=
u\n&quot;, ttm_tt_shrinker_count(&amp;mm_shrinker, &amp;sc),<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_tt_shrinker_scan(&amp;mm_shrink=
er, &amp;sc));<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memalloc_nofs_restore(flags);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fs_reclaim_release(GFP_KER=
NEL);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
-- <br>
2.25.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2=
F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%=
7C01%7Calexander.deucher%40amd.com%7C70aef4974dfe465a06a308d8eae08eb3%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637517597539809703%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C1000&amp;amp;sdata=3Dkvyinv9FPakf76dvXF0pzfeCpclxAo3L4Ufkf6%2B6%2FCc%3D&a=
mp;amp;reserved=3D0">https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;=
data=3D04%7C01%7Calexander.deucher%40amd.com%7C70aef4974dfe465a06a308d8eae0=
8eb3%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637517597539809703%7CUnkn=
own%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXV=
CI6Mn0%3D%7C1000&amp;amp;sdata=3Dkvyinv9FPakf76dvXF0pzfeCpclxAo3L4Ufkf6%2B6=
%2FCc%3D&amp;amp;reserved=3D0</a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MW3PR12MB449102A7703858C82914AF8CF7689MW3PR12MB4491namp_--

--===============2043428458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2043428458==--
