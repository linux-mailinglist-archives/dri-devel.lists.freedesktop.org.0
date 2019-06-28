Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7280C59E97
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312D06E94A;
	Fri, 28 Jun 2019 15:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on0602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A1056E94A;
 Fri, 28 Jun 2019 15:16:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=lHtSC83JlTmBS9P2i2lxNi18I2dfv6QNMNtjRQked9G9w/kF2un/fjv+G6yi5LAbmIcwhHivcwEdduNcohFqXRO8/Zo79zUmBvrcBnIX7rU9+K5Oa20p7eLv368JZgulfBwONBgokwCeridps5BC9tMTeCVv2Mt34upWXkoc7Kw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wam8qaM1I5qrqYJkzPmyTbNtI9HAezhsmgG0WSephNU=;
 b=RgZwPEIBz/le/O+YWhBVAMY4V7va1bHy8eZx6ZGkQQ30ouTT2VPZoKA5bVFtKQroUk8GMlTAiehAjyQWgEfKl7634dxsHHoTFVmk58P/s1vGu73BYcgqslOd3Dcmj+mrA3eZ4QROBtcgZ6WJnh2Iwv3i9jo4M5kmAWAxlP9RATM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB3531.namprd12.prod.outlook.com (20.179.106.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:15:56 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:15:56 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, "Wang, Kevin(Yang)"
 <Kevin1.Wang@amd.com>, Rex Zhu <rex.zhu@amd.com>, "Quan, Evan"
 <Evan.Quan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix incorrect assignments to mclk_mask
 and soc_mask
Thread-Topic: [PATCH] drm/amd/powerplay: fix incorrect assignments to
 mclk_mask and soc_mask
Thread-Index: AQHVLcGbEtM3PWCfCEizfPqnDlpL3qaxLTsO
Date: Fri, 28 Jun 2019 15:15:56 +0000
Message-ID: <DM6PR12MB3209F8BBDE81786CE2D416E7FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628144517.7747-1-colin.king@canonical.com>
In-Reply-To: <20190628144517.7747-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 586bb2b9-a94f-404d-15e3-08d6fbdb84c4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3531; 
x-ms-traffictypediagnostic: DM6PR12MB3531:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB3531FF75EC19AB73B0A32FB9FEFC0@DM6PR12MB3531.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(199004)(189003)(6606003)(446003)(11346002)(476003)(486006)(606006)(6306002)(6506007)(14454004)(6436002)(3846002)(6116002)(2501003)(81156014)(81166006)(966005)(66066001)(72206003)(8676002)(68736007)(8936002)(186003)(55016002)(54896002)(33656002)(53936002)(7736002)(76176011)(9686003)(110136005)(54906003)(102836004)(2906002)(26005)(6246003)(53546011)(52536014)(316002)(99286004)(7696005)(2201001)(86362001)(76116006)(71200400001)(19627405001)(91956017)(66946007)(66476007)(66556008)(66446008)(236005)(64756008)(478600001)(256004)(74316002)(4326008)(5660300002)(229853002)(71190400001)(73956011)(25786009)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3531;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:3; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 50f98O69ovd6BzbsCVop4paEe2tJFKyGkGItKthCMKC7E8O2L2AeMVIaSBUnYGHovhhzcYqTEAuuIFVcOHgfEMLUait4wN2bkmKWrdUGbcKh5hOmEEbpQkDYlwruEp7K/bPH41qCfHzLSYblChZgg52GPNcaTgFhWOZmxk1RyU7siNEw+H1RaCqH2mI8LKTGyFHL6238a2X1fPR56dGKuyLC6omVMgOejoK6KtyuGHXQdjOaWI3BTWmphYcCCQ3rSAwoqpG+WHGPLMBOhAkw0xvirxwYNsocwSgYHCZjhaUSt/sqOGwLyarB9QUYzGq2HPOVXdQYUlr14v6hWDYf7+51SEcG/LFWyIohWsJHJhLY0PN2usZz4akhpj3HWksWO5iNAmnGccoz4QoBhi0JsrUYUheInGSt3dXj9uTGXPw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 586bb2b9-a94f-404d-15e3-08d6fbdb84c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:15:56.2726 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3531
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wam8qaM1I5qrqYJkzPmyTbNtI9HAezhsmgG0WSephNU=;
 b=Tw+d495KBdpdDrD0N53woDogFNLOa7bCwSZOpnj3XP3J9IqfBjw/xq0OdMFhfmGxM6IhgI5u/2YJb6/ug8a00MDgPoZz86uztRXFaxDVl+4mMuocxS0WYDp9myz3DQJ0IOhWjnt+e8W8z/XdgQ19h9m6RKbFU1QUcsFRbYsdwnc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Slava.Abramov@amd.com; 
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
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0774938360=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0774938360==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3209F8BBDE81786CE2D416E7FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB3209F8BBDE81786CE2D416E7FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 10:45:17 AM
To: Wang, Kevin(Yang); Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Chr=
istian; Zhou, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.f=
reedesktop.org; dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: fix incorrect assignments to mclk_mask =
and soc_mask

From: Colin Ian King <colin.king@canonical.com>

There are null pointer checks on mlck_mask and soc_mask however the
sclk_mask is being used in assignments in what looks to be a cut-n-paste
coding error. Fix this by using the correct pointers in the assignments.

Addresses-Coverity: ("Dereference after null check")
Fixes: 2d9fb9b06643 ("drm/amd/powerplay: add function get_profiling_clk_mas=
k for navi10")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 27e5c80..ac151da 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -1134,14 +1134,14 @@ static int navi10_get_profiling_clk_mask(struct smu=
_context *smu,
                         ret =3D smu_get_dpm_level_count(smu, SMU_MCLK, &le=
vel_count);
                         if (ret)
                                 return ret;
-                       *sclk_mask =3D level_count - 1;
+                       *mclk_mask =3D level_count - 1;
                 }

                 if(soc_mask) {
                         ret =3D smu_get_dpm_level_count(smu, SMU_SOCCLK, &=
level_count);
                         if (ret)
                                 return ret;
-                       *sclk_mask =3D level_count - 1;
+                       *soc_mask =3D level_count - 1;
                 }
         }

--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB3209F8BBDE81786CE2D416E7FEFC0DM6PR12MB3209namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p style=3D"margin-top:0;margin-bottom:0"><span style=3D"font-family: Calib=
ri, Helvetica, sans-serif, serif, EmojiFont; font-size: 16px;">Acked-by: Sl=
ava Abramov &lt;slava.abramov@amd.com&gt;</span><br>
</p>
</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Colin King &lt;colin.king@can=
onical.com&gt;<br>
<b>Sent:</b> Friday, June 28, 2019 10:45:17 AM<br>
<b>To:</b> Wang, Kevin(Yang); Rex Zhu; Quan, Evan; Deucher, Alexander; Koen=
ig, Christian; Zhou, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@=
lists.freedesktop.org; dri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH] drm/amd/powerplay: fix incorrect assignments to mcl=
k_mask and soc_mask</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
There are null pointer checks on mlck_mask and soc_mask however the<br>
sclk_mask is being used in assignments in what looks to be a cut-n-paste<br=
>
coding error. Fix this by using the correct pointers in the assignments.<br=
>
<br>
Addresses-Coverity: (&quot;Dereference after null check&quot;)<br>
Fixes: 2d9fb9b06643 (&quot;drm/amd/powerplay: add function get_profiling_cl=
k_mask for navi10&quot;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 4 &#43;&#43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 27e5c80..ac151da 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -1134,14 &#43;1134,14 @@ static int navi10_get_profiling_clk_mask(struct=
 smu_context *smu,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
=3D smu_get_dpm_level_count(smu, SMU_MCLK, &amp;level_count);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r=
et)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =3D l=
evel_count - 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *mclk_mask =
=3D level_count - 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if(soc_mask) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =
=3D smu_get_dpm_level_count(smu, SMU_SOCCLK, &amp;level_count);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r=
et)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *sclk_mask =3D l=
evel_count - 1;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *soc_mask =
=3D level_count - 1;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
-- <br>
2.7.4<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB3209F8BBDE81786CE2D416E7FEFC0DM6PR12MB3209namp_--

--===============0774938360==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0774938360==--
