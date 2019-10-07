Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEE3CDF61
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 12:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 621FF6E525;
	Mon,  7 Oct 2019 10:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790079.outbound.protection.outlook.com [40.107.79.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FFA6E525;
 Mon,  7 Oct 2019 10:32:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3R0RvZ2iPMkkLic/RgoSBSsp008DhM/WlkmGirgNRAdMOn1Zx8UNrxS5C4HLaUWUhw64AJoig1ez/UC0th90wajTdqMxDx5dEfiHMRPJigcvL8O3CHdwwVSacs01+EUN4X2fOTM6JV7q0NrEzn7pza4XQzNfq6IP8NrU3Jssa+iDCQoks0VN5g4hahatmVoLDFXPm/BPplvbzePQikMaMHG6Nr4cxcv/YC3IYx/DD0Gj+jfehBIsSqtjSJGV+6eV0KbYekNq87iQGFq2fn6fKe7ystdUjiwB5BPQNjBdd+lk4SEz4AmZfEbA3jlCh7E6ojZNcJDwKSV35TEEDWn2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoKF3sjjWWMoJPaCLc267krU7gsHfGe4dqo3icnMPlE=;
 b=ZCMcqnY1dYLt5C7WAc98qcEmQ8UvIsWWzWRf8APu7qxoNxT9KAd6Gwh53YndgAYPzOZHvW8Zjce7R80/x3a8WYDGKQlHpziE8zCuG2CGBT3N52gc4jaNKgCtH4en6r8T5lRq2tHpDH2BONuhQbtboItwLUJe8NsYcVmOnBQSoi+KQLLTuYj//lG5PzdNsAvyOMkdKURHhHq9AJpzVUlnr/USBISS3AHOe3Q6I4hq/cARmegmMdFmkBB8YnDnP8waX9cuFu5MR3HNrI6VjmE83WPf/3GQHFxvKE1S2zfNmbrqvzr3kCIgceVGfIHVu2CBeij2/V+pBfK02BbCXV7KGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3277.namprd12.prod.outlook.com (20.179.82.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 10:32:01 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 10:32:01 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Rex Zhu <rex.zhu@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: Fix error handling in
 smu_init_fb_allocations()
Thread-Topic: [PATCH] drm/amd/powerplay: Fix error handling in
 smu_init_fb_allocations()
Thread-Index: AQHVfO3tzY4A/gITsEOIbzzhoeopLqdO+sVG
Date: Mon, 7 Oct 2019 10:32:01 +0000
Message-ID: <MN2PR12MB32963D6B4480B85DC9DC379FA29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20191007090206.GD3865@mwanda>
In-Reply-To: <20191007090206.GD3865@mwanda>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 93414bfa-0de4-45d9-6969-08d74b1196be
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3277:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3277557F99DC454703526E91A29B0@MN2PR12MB3277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(66446008)(66946007)(66476007)(54896002)(64756008)(66556008)(91956017)(4326008)(76116006)(55016002)(9686003)(71200400001)(71190400001)(229853002)(256004)(6436002)(2906002)(3846002)(6116002)(14454004)(66066001)(6246003)(86362001)(25786009)(8676002)(81156014)(81166006)(5660300002)(7736002)(8936002)(478600001)(52536014)(74316002)(476003)(6506007)(53546011)(102836004)(316002)(7696005)(54906003)(110136005)(26005)(76176011)(33656002)(99286004)(6636002)(446003)(11346002)(19627405001)(105004)(486006)(186003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3277;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ES9cleH70ZKfXm/39KoaY8rVlXVnWHwmvl0VFrcwulZ5VROgMj7h3zXW5XmVC5zabtAADnd+xRojeukX3W//SmmUgVVIqSI/veRVMtk8TYaut8Q3afDM8mPS4miAGkUFNXJ4Sc8bpfVy8JN7jlabm/2scxsgI/whNVqtoUiZMkWK2b/av8DaVHODA77/yH/l7duufrOxsW1AOMeD26hDBMUF1LEj2jL5wL3/WSor1xou5ecimbjIkckVeX0SOXiUnCagXb8gwXQhXrGdFZOVz4S5mxwjs+5Rbc+Xo9xlOv1X42LsmoeVznngSbNCEMUyfMhEnzPC8U9nR4eG+FZL9QV5lg7+TM2ne2IFPTFoBq5hGcjkB/TwsyoDCuiM7YurpM+2/4yH9+1f2Y+ENz2rQZ/a7/B1V6kazcQbcHLImrA=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 93414bfa-0de4-45d9-6969-08d74b1196be
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 10:32:01.0583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +rkbjhdp0HBUwc80Fvpzu60a/OnEzQ3mkk/yPrfC2uZS60Hut5dayrfFCzqBoAGX
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WoKF3sjjWWMoJPaCLc267krU7gsHfGe4dqo3icnMPlE=;
 b=Etgdy4SrH5hcR9CMq48k8VKNu81D5C8gdnQBXrtVgBhbMuBCJyg1v0tsczVwrZX5YrzaVSWQLu3QA0MgH2HQYZZyFv5eCxfxBzbFTt2Cpzl/Umo9CLjJERyui73ER6sh1RxPYpjBw6Kvo7ofRc/bKWh/OWtMXFFzDoE3q+Fo2h4=
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============2130971820=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2130971820==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB32963D6B4480B85DC9DC379FA29B0MN2PR12MB3296namp_"

--_000_MN2PR12MB32963D6B4480B85DC9DC379FA29B0MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

thanks correct it.

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: Monday, October 7, 2019 5:02 PM
To: Rex Zhu <rex.zhu@amd.com>; Wang, Kevin(Yang) <Kevin1.Wang@amd.com>
Cc: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander <Alexander.Deucher@a=
md.com>; Koenig, Christian <Christian.Koenig@amd.com>; Zhou, David(ChunMing=
) <David1.Zhou@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter <da=
niel@ffwll.ch>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.or=
g>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; kern=
el-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>
Subject: [PATCH] drm/amd/powerplay: Fix error handling in smu_init_fb_alloc=
ations()

The error handling is off by one.  We should not free the first
"tables[i].bo" without decrementing "i" because that might result in a
double free.  The second problem is that when an error occurs, then the
zeroth element "tables[0].bo" isn't freed.

I had make "i" signed int for the error handling to work, so I just
updated "ret" as well as a clean up.

Fixes: f96357a991b9 ("drm/amd/powerplay: implement smu_init(fini)_fb_alloca=
tions function")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index f1fbbc8b77ee..c9266ea70331 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -896,8 +896,7 @@ static int smu_init_fb_allocations(struct smu_context *=
smu)
         struct amdgpu_device *adev =3D smu->adev;
         struct smu_table_context *smu_table =3D &smu->smu_table;
         struct smu_table *tables =3D smu_table->tables;
-       uint32_t i =3D 0;
-       int32_t ret =3D 0;
+       int ret, i;

         for (i =3D 0; i < SMU_TABLE_COUNT; i++) {
                 if (tables[i].size =3D=3D 0)
@@ -915,7 +914,7 @@ static int smu_init_fb_allocations(struct smu_context *=
smu)

         return 0;
 failed:
-       for (; i > 0; i--) {
+       while (--i >=3D 0) {
                 if (tables[i].size =3D=3D 0)
                         continue;
                 amdgpu_bo_free_kernel(&tables[i].bo,
--
2.20.1


--_000_MN2PR12MB32963D6B4480B85DC9DC379FA29B0MN2PR12MB3296namp_
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
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
thanks correct it.</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Revie<span style=3D"margin: 0px">wed-by: Kevin Wang &lt;kevin1.wang@amd.com=
&gt;</span></div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Best Regards,<br>
Kevin</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Dan Carpenter &lt;dan=
.carpenter@oracle.com&gt;<br>
<b>Sent:</b> Monday, October 7, 2019 5:02 PM<br>
<b>To:</b> Rex Zhu &lt;rex.zhu@amd.com&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wa=
ng@amd.com&gt;<br>
<b>Cc:</b> Quan, Evan &lt;Evan.Quan@amd.com&gt;; Deucher, Alexander &lt;Ale=
xander.Deucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&=
gt;; Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; David Airlie &lt;ai=
rlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; amd-gfx@lists.fr=
eedesktop.org
 &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &lt=
;dri-devel@lists.freedesktop.org&gt;; kernel-janitors@vger.kernel.org &lt;k=
ernel-janitors@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: Fix error handling in smu_init_f=
b_allocations()</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">The error handling is off by one.&nbsp; We should =
not free the first<br>
&quot;tables[i].bo&quot; without decrementing &quot;i&quot; because that mi=
ght result in a<br>
double free.&nbsp; The second problem is that when an error occurs, then th=
e<br>
zeroth element &quot;tables[0].bo&quot; isn't freed.<br>
<br>
I had make &quot;i&quot; signed int for the error handling to work, so I ju=
st<br>
updated &quot;ret&quot; as well as a clean up.<br>
<br>
Fixes: f96357a991b9 (&quot;drm/amd/powerplay: implement smu_init(fini)_fb_a=
llocations function&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 5 &#43;&#43;---<br>
&nbsp;1 file changed, 2 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index f1fbbc8b77ee..c9266ea70331 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -896,8 &#43;896,7 @@ static int smu_init_fb_allocations(struct smu_conte=
xt *smu)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D smu-&gt;adev;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table_context *=
smu_table =3D &amp;smu-&gt;smu_table;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct smu_table *tables =
=3D smu_table-&gt;tables;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t i =3D 0;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int32_t ret =3D 0;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, i;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &lt; SMU_T=
ABLE_COUNT; i&#43;&#43;) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (tables[i].size =3D=3D 0)<br>
@@ -915,7 &#43;914,7 @@ static int smu_init_fb_allocations(struct smu_conte=
xt *smu)<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;failed:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (; i &gt; 0; i--) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (--i &gt;=3D 0) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; if (tables[i].size =3D=3D 0)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; conti=
nue;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_bo_free_kernel(&amp;tables[i].bo,<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB32963D6B4480B85DC9DC379FA29B0MN2PR12MB3296namp_--

--===============2130971820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2130971820==--
