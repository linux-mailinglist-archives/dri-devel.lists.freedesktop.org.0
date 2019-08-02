Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671AF7E799
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 03:45:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441E16E85B;
	Fri,  2 Aug 2019 01:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790042.outbound.protection.outlook.com [40.107.79.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A62389269;
 Fri,  2 Aug 2019 01:45:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XgYfjJPwVUAOmtvJjWVisI5lWkJCvldY1we2Mypfkta242r3QRrIqJEgHJxPJfcPArViD95+skyC6M5z09nP2+ajDBmBD9GJSDVAL+rNzclmnpuWThjApcN5SpcbUksN4OK2I84jteVONGpMFouZWXTZNxmJJCkBW+tEAC8/+hBa/gVZ6GaOpQuDfkfpaAAC2VbjMp5x+Debch9JH5J8Qd3/vYxWHlZSHv1tFk/Qg7f/9AyYZfI+HcrB7/eD6pKUnE4u6bo+JVltnqAwe9PshMrHcirpE4sX5ft0WtUMd3aqbQvkYAneX1xGiDfKPRQl6rKR9FJKJzzxkAG6N2SZyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy6GhjxSMv+1jf6mo3smD9//vC8sp1v/x2t2HJwu5n4=;
 b=L5A7YyrL830HISNk3w0VCau9C2N87RBXwJ8Ni2kVEfTmNac71uKKOD3K04yWJunC8cl1Br/fRq2UzAjx4MPOQxJuTVXSpYT0AZOIL2n4lW1fZkb6AWSIeS/xZNuJJOLVmR9nsIIRoyYHxvgJHBJLNuT7GTh6W0kDSmgzuRJK9F/Y/vLgs8PaMBsE5OkoV1Uh4/syghK99Hqjd2L6o5wfTY8KoWVo9gs32l0JJ+Q1TejvLsHPNKM8u6GYSa0kYNgvTRKlLXIHiHaTHS3rs5GfzdaxOpntgJpQCE0iB6aUkU7r4k5oOf0yWP9kJ2vFdukCmd62Z8tcnyVQTUo4z7tnKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from BN8PR12MB3283.namprd12.prod.outlook.com (20.179.67.152) by
 BN8PR12MB2913.namprd12.prod.outlook.com (20.179.65.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.15; Fri, 2 Aug 2019 01:45:49 +0000
Received: from BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236]) by BN8PR12MB3283.namprd12.prod.outlook.com
 ([fe80::3892:6912:f663:6236%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 01:45:49 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, Colin King <colin.king@canonical.com>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upper bounds
 limit checks
Thread-Topic: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upper bounds
 limit checks
Thread-Index: AQHVSFp4EPwz9ULVj0K3SuHck3c+RqbmpBoAgABy8Y0=
Date: Fri, 2 Aug 2019 01:45:49 +0000
Message-ID: <BN8PR12MB3283A2B485985BF91F21760CA2D90@BN8PR12MB3283.namprd12.prod.outlook.com>
References: <20190801111541.13627-1-colin.king@canonical.com>,
 <CADnq5_OqLtvBWXJhT9c=kxK3HeXSEDdfYS1N7Dh68kbiiLk5+w@mail.gmail.com>
In-Reply-To: <CADnq5_OqLtvBWXJhT9c=kxK3HeXSEDdfYS1N7Dh68kbiiLk5+w@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a147bab-52c7-4340-163a-08d716eb2555
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN8PR12MB2913; 
x-ms-traffictypediagnostic: BN8PR12MB2913:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN8PR12MB29133F6F6A446BE17CBCD95EA2D90@BN8PR12MB2913.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:283;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(189003)(199004)(71190400001)(71200400001)(53936002)(236005)(6306002)(54896002)(9686003)(6436002)(55016002)(11346002)(6116002)(3846002)(476003)(446003)(6246003)(229853002)(86362001)(2906002)(486006)(74316002)(105004)(25786009)(8936002)(186003)(81156014)(52536014)(478600001)(102836004)(53546011)(81166006)(7736002)(7696005)(14454004)(76176011)(19627405001)(4326008)(26005)(606006)(33656002)(6506007)(76116006)(91956017)(966005)(66946007)(316002)(66446008)(99286004)(54906003)(14444005)(5660300002)(68736007)(110136005)(256004)(66066001)(8676002)(66476007)(64756008)(66556008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR12MB2913;
 H:BN8PR12MB3283.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: byrr50RUr0jKbgWws+ZEUvuUFwV5BUrTg2kp/PIaE6iuqMbhOPdbb+bn+qWAfP3NKBxvTpF1Tt+UjU03AddMwltzHy9i6+j8k/usVgO6DLVDpTzDaSPuFq1kWWrLWgsk3jPbmY21owb5LcptkHnfDvq61RWN/ArHZFh53CSNxBqSgfFwfkSqbNgPbS4BCJ51w1oIpEmFDhs26cGQIWIldcUMnMI7xeZz0Lffeha9SxAA+HWMKwXjYAdAcSbfXu7SduDsd/9X78CNtXR+4mk0TQsBMxMHfv3yLsbBBt5A036y8Y+WTHZYcLzwysSO5H2CgaRY61UBk+/YC6z0oeMvgbYOdMwXvLjFqLxPV3Q5khG3hzRBL1ian/c+RZnA4dtO7I2Ki4Je4gxnUxsyfC6+4J5vYTFvrGc5J4zx936K1js=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a147bab-52c7-4340-163a-08d716eb2555
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 01:45:49.4494 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kevwa@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2913
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oy6GhjxSMv+1jf6mo3smD9//vC8sp1v/x2t2HJwu5n4=;
 b=TmD1tEp7RWCQUfpSv8jX/UQM+EwING3HSpyfIvtgUhFqrh4Hen2aJ4rFn/Ia/oeOPLEcsm4IKjg6TTpxGJzYXZM30IWCS87ZMfaDJIdkUsHykvE90bY8JKpKBPWnQ8KfYagF4/8DyMDn2isjDvTnLywWc6TQMuSJSS5PaFbQ0VI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Kevin1.Wang@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 Rex Zhu <rex.zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0266235005=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0266235005==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN8PR12MB3283A2B485985BF91F21760CA2D90BN8PR12MB3283namp_"

--_000_BN8PR12MB3283A2B485985BF91F21760CA2D90BN8PR12MB3283namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Friday, August 2, 2019 2:53 AM
To: Colin King <colin.king@canonical.com>
Cc: Wang, Kevin(Yang) <Kevin1.Wang@amd.com>; Rex Zhu <rex.zhu@amd.com>; Qua=
n, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>=
; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing) <Davi=
d1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <daniel@ff=
wll.ch>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Maling list - DRI de=
velopers <dri-devel@lists.freedesktop.org>; kernel-janitors@vger.kernel.org=
 <kernel-janitors@vger.kernel.org>; LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upper boun=
ds limit checks

On Thu, Aug 1, 2019 at 7:15 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are two occurrances of off-by-one upper bound checking of indexes
> causing potential out-of-bounds array reads. Fix these.
>
> Addresses-Coverity: ("Out-of-bounds read")
> Fixes: cb33363d0e85 ("drm/amd/powerplay: add smu feature name support")
> Fixes: 6b294793e384 ("drm/amd/powerplay: add smu message name support")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm=
/amd/powerplay/amdgpu_smu.c
> index d029a99e600e..b64113740eb5 100644
> --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> +++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
> @@ -38,7 +38,7 @@ static const char* __smu_message_names[] =3D {
>
>  const char *smu_get_message_name(struct smu_context *smu, enum smu_messa=
ge_type type)
>  {
> -       if (type < 0 || type > SMU_MSG_MAX_COUNT)
> +       if (type < 0 || type >=3D SMU_MSG_MAX_COUNT)
>                 return "unknown smu message";
>         return __smu_message_names[type];
>  }
> @@ -51,7 +51,7 @@ static const char* __smu_feature_names[] =3D {
>
>  const char *smu_get_feature_name(struct smu_context *smu, enum smu_featu=
re_mask feature)
>  {
> -       if (feature < 0 || feature > SMU_FEATURE_COUNT)
> +       if (feature < 0 || feature >=3D SMU_FEATURE_COUNT)
>                 return "unknown smu feature";
>         return __smu_feature_names[feature];
>  }
[kevin]:
thanks correct it.
Reviewed-by: Kevin Wang <kevin1.wang@amd.com>
BR
Kevin
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--_000_BN8PR12MB3283A2B485985BF91F21760CA2D90BN8PR12MB3283namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Friday, August 2, 2019 2:53 AM<br>
<b>To:</b> Colin King &lt;colin.king@canonical.com&gt;<br>
<b>Cc:</b> Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Rex Zhu &lt;rex.z=
hu@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.com&gt;; Deucher, Alexander &l=
t;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd=
.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; David Airlie
 &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; amd-gfx l=
ist &lt;amd-gfx@lists.freedesktop.org&gt;; Maling list - DRI developers &lt=
;dri-devel@lists.freedesktop.org&gt;; kernel-janitors@vger.kernel.org &lt;k=
ernel-janitors@vger.kernel.org&gt;; LKML &lt;linux-kernel@vger.kernel.org&g=
t;<br>
<b>Subject:</b> Re: [PATCH][drm-next] drm/amd/powerplay: fix off-by-one upp=
er bounds limit checks</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">On Thu, Aug 1, 2019 at 7:15 AM Colin King &lt;coli=
n.king@canonical.com&gt; wrote:<br>
&gt;<br>
&gt; From: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
&gt;<br>
&gt; There are two occurrances of off-by-one upper bound checking of indexe=
s<br>
&gt; causing potential out-of-bounds array reads. Fix these.<br>
&gt;<br>
&gt; Addresses-Coverity: (&quot;Out-of-bounds read&quot;)<br>
&gt; Fixes: cb33363d0e85 (&quot;drm/amd/powerplay: add smu feature name sup=
port&quot;)<br>
&gt; Fixes: 6b294793e384 (&quot;drm/amd/powerplay: add smu message name sup=
port&quot;)<br>
&gt; Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
<br>
Applied.&nbsp; thanks!<br>
<br>
Alex<br>
<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 4 &#43;&#43;--<br>
&gt;&nbsp; 1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/=
drm/amd/powerplay/amdgpu_smu.c<br>
&gt; index d029a99e600e..b64113740eb5 100644<br>
&gt; --- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&gt; @@ -38,7 &#43;38,7 @@ static const char* __smu_message_names[] =3D {<b=
r>
&gt;<br>
&gt;&nbsp; const char *smu_get_message_name(struct smu_context *smu, enum s=
mu_message_type type)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (type &lt; 0 || type &gt; SMU=
_MSG_MAX_COUNT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (type &lt; 0 || type &gt;=
=3D SMU_MSG_MAX_COUNT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;unknown smu message&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_message_n=
ames[type];<br>
&gt;&nbsp; }<br>
&gt; @@ -51,7 &#43;51,7 @@ static const char* __smu_feature_names[] =3D {<b=
r>
&gt;<br>
&gt;&nbsp; const char *smu_get_feature_name(struct smu_context *smu, enum s=
mu_feature_mask feature)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature &lt; 0 || feature &g=
t; SMU_FEATURE_COUNT)<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (feature &lt; 0 || featur=
e &gt;=3D SMU_FEATURE_COUNT)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return &quot;unknown smu feature&quot;;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return __smu_feature_n=
ames[feature];<br>
&gt;&nbsp; }</div>
<div class=3D"PlainText">[kevin]:</div>
<div class=3D"PlainText">thanks correct it.<br>
</div>
<div class=3D"PlainText">Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt=
;</div>
<div class=3D"PlainText">BR<br>
</div>
<div class=3D"PlainText">Kevin</div>
<div class=3D"PlainText">&gt; --<br>
&gt; 2.20.1<br>
&gt;<br>
&gt; _______________________________________________<br>
&gt; dri-devel mailing list<br>
&gt; dri-devel@lists.freedesktop.org<br>
&gt; <a href=3D"https://lists.freedesktop.org/mailman/listinfo/dri-devel">h=
ttps://lists.freedesktop.org/mailman/listinfo/dri-devel</a><br>
</div>
</span></font></div>
</body>
</html>

--_000_BN8PR12MB3283A2B485985BF91F21760CA2D90BN8PR12MB3283namp_--

--===============0266235005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0266235005==--
