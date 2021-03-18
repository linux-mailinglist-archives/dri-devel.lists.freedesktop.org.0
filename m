Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7849734016C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 10:00:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 042846E8A4;
	Thu, 18 Mar 2021 09:00:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2075.outbound.protection.outlook.com [40.107.223.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79926E89F;
 Thu, 18 Mar 2021 09:00:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BpFPsskvyOEDVxQwpoZ/OXXI3hYR8cYlQMLWHt8lZZEFeNcbTZ/wTqYHCdkFlLjpHKoC7KkSqcXU516VXFtGaAk7HPDEb5o8G3+IcdO4R8t0yyjSZg33s6rgwcYg9zrChrcl7OVEwbqnmV8kq+btc4EPuKy4dqV+AI6pQ9EkH0ZpxeVEuxD+auH+aC+iAJRaaOqGH+WcGZCAGXVikMu7FegSj4JuvkRCfhrlJk20adFZHF6d56FrH/6EndkoA0SSf2UR+XZxNET+KBLqnA1GptDo+wkFMHQYsCm2lg5ExHUTOQqg7ROsMO2Vhv717anfKtwuD559/JVAzG+/WIHZHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjyl6c4KwOlwnes8NyeIj8EKWYcqE06AZiqElGBZqKo=;
 b=dXj4sYsWJY/KJceY11N7TG1qweQ988OYXw9GI2BSHoFtI9Pfck6ey/9Xb3UKkLF9QWUoEPWIA/NaNA2PA9sPH+pe69Jda4qH84a52T+Cc2ERDY2r3XJpK0lAoXegmJJUyQZRxn01SkeD0WASCcj1J6Vt+qIhiQqyeC+6IiOxTZdzD00Ifv4b/R4B9v/dwwpSku1EtIi3WH2suDwYp2Og6PKvR8bKH/N7HfQKhgp7CP3a6AReIfJK0RGFglZHorICWPLOixBopwuJn5jX2vTCkMazwCh6JmJ2jJtdSAmMRiOTcuLdPs5pEcgM+90ntGuRC71LMoJyre2rrLPUdulTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjyl6c4KwOlwnes8NyeIj8EKWYcqE06AZiqElGBZqKo=;
 b=Y1R1a4T2v8Hffv1Vsa9Thu6Nt5hpZvkEwhRgyRhUCvy6B7azVTQ0xh9IbU+fMz6hWYkWwDo0ziRt6jV3aAsibsyRbzvmHK6p1kcjQSJ2t0+CEY+2Y8B5AmnTO/5QaTw3qzxgxVnIq+F7AFcqy0IDCcXSnpOJnl4RhyOBU+e9Szs=
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 18 Mar
 2021 09:00:30 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3933.033; Thu, 18 Mar 2021
 09:00:30 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Daniel Gomez <daniel@qtec.com>
Subject: AW: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
Thread-Topic: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages
Thread-Index: AQHXG9GR/b1R+/WHskKvsFfG2WrHvKqJcnfo
Date: Thu, 18 Mar 2021 09:00:30 +0000
Message-ID: <MN2PR12MB37755DAAB03FC0065E98EF1183699@MN2PR12MB3775.namprd12.prod.outlook.com>
References: <20210318083236.43578-1-daniel@qtec.com>
In-Reply-To: <20210318083236.43578-1-daniel@qtec.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: qtec.com; dkim=none (message not signed)
 header.d=none;qtec.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [2a01:598:91b0:db8a:8549:e251:5673:4f7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2a175338-887b-4fee-7273-08d8e9ec483a
x-ms-traffictypediagnostic: MN2PR12MB3998:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3998F5473077B0E1BCF084D483699@MN2PR12MB3998.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1468;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NUwUTM6SSwNtiSJU61F98Lbstp2+/gFXFmMBSYvRUoZ1JHT6cb8sNrbkL++5cQUs9D2kF9T8lMUJRUD6KDhJ6cA8KgkiMtRo32uBkjqFWtCbjGXjS9gc4dmJMJYnJ9S8aCLeuvZBkqD9BwJ7Hzg1eUJoCRiF4emQi3hl0oKvTUFxeETVUcVexQAMc4fALfWG5kyRO8CUCHH5xIfvHwRVuCUTjBr3HLOmCpeEbyznmjGyq7P0P3abwpCT5dbvw7hFgeeswFWrWjk+RpfW8g0GL3BqOV5KWagDWf/oW04k2b1ebfmz3z1eKvHAchd0n+QKpaVcvqKVxH23GJCtMxal97fLTWid6mXeUxYTS24HCkaQtHowwQxBmD6t31cM2cGRxU48EvwBL3Q+80CICFYpWoIuIJaKI+ioot478Bw+c8cHe02e3PFA03SJa/aBn5bQlOYBzhLM4SHdjVt5W1TWwLNRBF+N2CT0GkLlN89YmNbKgRY+4yXBxTgPNP42ynOvtoujiTUUjrkyGH/zzuIjaZIqCjDNEICfaNZAWD9COCiYjNpjoIsE106kKviOL/66iQiVWidnT1fPzRaryDlHc8ukFhaN+MgvXJqPQe1hdkuyDm+8kA6XZJcs9hD+Icl1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(7696005)(91956017)(33656002)(316002)(55016002)(2906002)(76116006)(6506007)(66946007)(52536014)(66446008)(8936002)(9686003)(4326008)(478600001)(83380400001)(6916009)(54906003)(186003)(8676002)(86362001)(64756008)(66476007)(5660300002)(71200400001)(66556008)(38100700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?mywTGXvEVmtJAaD+TuBY4H8Lj9en5HmnkFtk7LFkRfaH0M+GXceSd7NKRL?=
 =?iso-8859-1?Q?1l6v/ScF5HdcMxUCz8ml0NspL8etv2cGuTbZ9TeJJCHtdtEM05W8W+Aq5c?=
 =?iso-8859-1?Q?jZQmlWiwuDKjjzyKMSah/MwiuxRJU5zmBrLmHuo6PTguRVpmzFbQ1peJ2y?=
 =?iso-8859-1?Q?yiVVoI+dkE0hdafx/5WBKKYTu4bJFDufYZsoSPQnYuOShHWfUfg6DrRXyH?=
 =?iso-8859-1?Q?rD5b2qJWxxsMLj3+e+YfTi/4y0jIFnQIASmxTC02o0iZBzzkkE+KrycW6m?=
 =?iso-8859-1?Q?p0ecg/TxlHe1q5L48GuZheE9OLrVf/02HJCxMteNqxvNWy1iOBfMeKAu9m?=
 =?iso-8859-1?Q?BSsIrbsnuhBqSHWOnD4TN9jnpqaUsca7Sc98mWhoeSwRe1HtoSnL6xQR3W?=
 =?iso-8859-1?Q?wTOHGV3avPy8/zjBlqlhzd6erw0H5M4cvdaETnbMYreasL4nEs/h31XvrP?=
 =?iso-8859-1?Q?FzJv61PLP5lxraTGDAhelT+/08J/CeK+mno5gZGGwSslcdHISKA8nat/Ku?=
 =?iso-8859-1?Q?+NsRQc1SRuAssHPYXhPwR3hfj7NW5f86LRsDM8zSsMwbXWe23CAPkMMPfz?=
 =?iso-8859-1?Q?p9udGwGj57HL9xY3CXcpajtw6S6dTmVh8BYf36IXp8vDPx/wBZ+BGOOxD4?=
 =?iso-8859-1?Q?lKOwO+yDz/HK2W3OI1vwWqx2vrXt4JXPZ+aLJH/wGSw3j5zZIi2XOqoUa5?=
 =?iso-8859-1?Q?PgK0UISPhlB7jMLX7ddkULl/wWnb6P68SuU2ye9ESKfZzFaSGcMF0w0DRU?=
 =?iso-8859-1?Q?Yo7gys6r0BdTdtaO4hxgl58vM6fSEUp0zRCxIOrnFZYbrCGRlofv4HyIML?=
 =?iso-8859-1?Q?zo4JGw6243Xn3VQth4czpGOoZIMPXJrN4DKHASPJZpRom4zc7xkLKKyjmb?=
 =?iso-8859-1?Q?kheNzIK6kXhC7LXZwfS8owBVPrPHAhznS6qjLjnEfEschtMzLl4YnKEHo/?=
 =?iso-8859-1?Q?wAhcmqPt8ycVDBUzleDEoMzDYxAGTXm5VQ2X/ejq1nOaRdPaD5wCDSb9m2?=
 =?iso-8859-1?Q?wI6LNTbm0puIvmbJazNR2lf2dAFRhG6JehnEgwDE6eRmj50z2NdKxSyyAu?=
 =?iso-8859-1?Q?c1BJAFXPQcc9yTCUF8Ew8UCLXm2J0S4ElaBF0B807u2ofrFVtr2te0hdOH?=
 =?iso-8859-1?Q?DA/DzP2BdezO0xdAokUooy/BO4RdF1htw8q7K//2PSGWAXZ+rtUIm3RZgJ?=
 =?iso-8859-1?Q?DiFiN9eoaq5DI/HHuAGgWE7lCzg+o/T66Le0ld6JakAuC8DuFPd/9agtSe?=
 =?iso-8859-1?Q?aPqcPD0iLnMGIwcsWjgiov6AdzVf54uJp3MUEfYqxRtZNDJdg4/2DSV+pQ?=
 =?iso-8859-1?Q?j0Ex8PmHJn00nW02+GoubGll/IJnzcHYTVJ6LPz0Rmx9o23fs40FXp0Gqf?=
 =?iso-8859-1?Q?WVlaLvUfRP1JATZgs/LBKg8TEII8sRUkTSjXj2G/C3YA5tW3XQntA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a175338-887b-4fee-7273-08d8e9ec483a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2021 09:00:30.4489 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /3Bmv77eFwDHW5PveEjVaEwD6gY2Ne54NokrvjibUIqiVA3aEBFIi3wV02QYfeN8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "dagmcr@gmail.com" <dagmcr@gmail.com>
Content-Type: multipart/mixed; boundary="===============1068084480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1068084480==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB37755DAAB03FC0065E98EF1183699MN2PR12MB3775namp_"

--_000_MN2PR12MB37755DAAB03FC0065E98EF1183699MN2PR12MB3775namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>
________________________________
Von: Daniel Gomez <daniel@qtec.com>
Gesendet: Donnerstag, 18. M=E4rz 2021 09:32
Cc: dagmcr@gmail.com <dagmcr@gmail.com>; Daniel Gomez <daniel@qtec.com>; De=
ucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Christian.=
Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ffw=
ll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-=
devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel=
@vger.kernel.org <linux-kernel@vger.kernel.org>
Betreff: [PATCH] drm/radeon/ttm: Fix memory leak userptr pages

If userptr pages have been pinned but not bounded,
they remain uncleared.

Signed-off-by: Daniel Gomez <daniel@qtec.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/r=
adeon_ttm.c
index e8c66d10478f..bbcc6264d48f 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -485,13 +485,14 @@ static void radeon_ttm_backend_unbind(struct ttm_bo_d=
evice *bdev, struct ttm_tt
         struct radeon_ttm_tt *gtt =3D (void *)ttm;
         struct radeon_device *rdev =3D radeon_get_rdev(bdev);

+       if (gtt->userptr)
+               radeon_ttm_tt_unpin_userptr(bdev, ttm);
+
         if (!gtt->bound)
                 return;

         radeon_gart_unbind(rdev, gtt->offset, ttm->num_pages);

-       if (gtt->userptr)
-               radeon_ttm_tt_unpin_userptr(bdev, ttm);
         gtt->bound =3D false;
 }

--
2.30.2


--_000_MN2PR12MB37755DAAB03FC0065E98EF1183699MN2PR12MB3775namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<div style=3D"font-family: &quot;segoe ui westeuropean&quot;, &quot;segoe u=
i&quot;, helvetica, arial, sans-serif; font-size: 12pt; color: rgb(0, 0, 0)=
;">
Reviewed-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>Von:</b> Daniel Gomez &lt;danie=
l@qtec.com&gt;<br>
<b>Gesendet:</b> Donnerstag, 18. M=E4rz 2021 09:32<br>
<b>Cc:</b> dagmcr@gmail.com &lt;dagmcr@gmail.com&gt;; Daniel Gomez &lt;dani=
el@qtec.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koen=
ig, Christian &lt;Christian.Koenig@amd.com&gt;; David Airlie &lt;airlied@li=
nux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; amd-gfx@lists.freedeskto=
p.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt=
;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org &lt;linu=
x-kernel@vger.kernel.org&gt;<br>
<b>Betreff:</b> [PATCH] drm/radeon/ttm: Fix memory leak userptr pages</font=
>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">If userptr pages have been pinned but not bounded,=
<br>
they remain uncleared.<br>
<br>
Signed-off-by: Daniel Gomez &lt;daniel@qtec.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/radeon/radeon_ttm.c | 5 +++--<br>
&nbsp;1 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/r=
adeon_ttm.c<br>
index e8c66d10478f..bbcc6264d48f 100644<br>
--- a/drivers/gpu/drm/radeon/radeon_ttm.c<br>
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
@@ -485,13 +485,14 @@ static void radeon_ttm_backend_unbind(struct ttm_bo_d=
evice *bdev, struct ttm_tt<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_ttm_tt *gtt =
=3D (void *)ttm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_device *rdev=
 =3D radeon_get_rdev(bdev);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gtt-&gt;userptr)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; radeon_ttm_tt_unpin_userptr(bdev, ttm);<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!gtt-&gt;bound)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; radeon_gart_unbind(rdev, g=
tt-&gt;offset, ttm-&gt;num_pages);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gtt-&gt;userptr)<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; radeon_ttm_tt_unpin_userptr(bdev, ttm);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gtt-&gt;bound =3D false;<b=
r>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.30.2<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB37755DAAB03FC0065E98EF1183699MN2PR12MB3775namp_--

--===============1068084480==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1068084480==--
