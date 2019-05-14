Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FBD91CA6C
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 16:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D43892E7;
	Tue, 14 May 2019 14:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810050.outbound.protection.outlook.com [40.107.81.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 809F8892E7;
 Tue, 14 May 2019 14:31:30 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB2879.namprd12.prod.outlook.com (20.179.80.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 14:31:29 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 14:31:29 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Olsak, Marek" <Marek.Olsak@amd.com>, "Liang, Prike"
 <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
Thread-Topic: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU
 during CS
Thread-Index: AQHVCluI61TTf9+Y10iGF8nMbjxyG6Zqrrjb
Date: Tue, 14 May 2019 14:31:28 +0000
Message-ID: <-wsx1tz-kxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1vleyxgj8i7k6-q6ze8ub3ff8c4o0fxmx7niu76yg4-ybakue-3v14jw-ed5ol8ybh6o9-1ze886-hbstfi448pvq3pwhkj.1557844282594@email.android.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
 <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>,
 <f9017911-b08a-1f98-3fc9-98121bbde78a@gmail.com>
In-Reply-To: <f9017911-b08a-1f98-3fc9-98121bbde78a@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5e0043ac-5f50-4d57-8ef6-08d6d878da55
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB2879; 
x-ms-traffictypediagnostic: MN2PR12MB2879:
x-microsoft-antispam-prvs: <MN2PR12MB28794532F969E88FFC12391EB4080@MN2PR12MB2879.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(376002)(366004)(346002)(136003)(396003)(13464003)(189003)(199004)(236005)(66066001)(54896002)(9686003)(6512007)(110136005)(76176011)(99286004)(25786009)(8936002)(26005)(81166006)(81156014)(8676002)(256004)(71190400001)(14444005)(186003)(450100002)(71200400001)(6436002)(2906002)(7736002)(6486002)(68736007)(73956011)(66556008)(76116006)(2501003)(3846002)(72206003)(53936002)(478600001)(6116002)(316002)(102836004)(66476007)(64756008)(66446008)(66946007)(86362001)(11346002)(446003)(486006)(476003)(6506007)(66574012)(5660300002)(14454004)(2201001)(91956017)(921003)(1121003)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB2879;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n3XjGjTNg/WrCgxEv9h7GGHafoCf5iYdeJOKHC6JAVwUx9cHwrnRA1eJMSiBk3ktlTibK2pILds/8Ri9F/+TFKWCsaBYPabaT8qZYrx6Qd/RuuUiSEPDT44l/570HhfVpFsMgSzu8lcbopeYEnOETikqVRkJ+LIq/bCA9k7kxTxu3taC6exdc3M7dGUTyZC0PbJfOyRneDPkYeVbmYV+YZv8g/lo62jFaeD2O31Mo/L4D9AJ6kEbN3T0opoKNlWVyPCVB2Fu9u1qspCXNxyfCB10pdy/VaPf3dmwL01j64OcahtbiaqWoNXMt5WQ+Lzc+1AhPDJd337s+LxlVFFFOoBdW2dpNj/dg0G3V592f+xUe+ki5FXTY8ldcRmXoK9EWAcdy3zic6FR/OS+zRFQYPlI8rqLvVTfh01952iHUG4=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0043ac-5f50-4d57-8ef6-08d6d878da55
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 14:31:28.8968 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2879
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k385quk+x7sl4JtQBn/uYyWIytoL446DNoRGNSpWXpg=;
 b=XZ3iKLNtzO3ci29JiRAXhChbwPDUoIBkZziYBo+y3wmASbVbruAf63czjg3vmSuYbFJsX6WE8C1QaWdyVfo1DShT1B+XSRZagAcHiHPpV1uLfoBRblcGkJdYQ3W1hM+08DMMS7HW1RtBDyMML1f4WzTbkp1ZzNCumxZu9e0GVBk=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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
Content-Type: multipart/mixed; boundary="===============1741092101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1741092101==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_wsx1tzkxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1v_"

--_000_wsx1tzkxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1v_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

how to refresh LRU to keep the order align with bo list passed from user sp=
ace?

you can verify it by some games, performance could be different much betwee=
n multiple runnings.

-David

-------- Original Message --------
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU durin=
g CS
From: Christian K=F6nig
To: "Zhou, David(ChunMing)" ,"Olsak, Marek" ,"Liang, Prike" ,dri-devel@list=
s.freedesktop.org,amd-gfx@lists.freedesktop.org
CC:

[CAUTION: External Email]
Hui? What do you mean with that?

Christian.

Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):
my only concern is how to fresh LRU when bo is from bo list.

-David

-------- Original Message --------
Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
From: Christian K=F6nig
To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang, Prike" ,dri-devel@list=
s.freedesktop.org,amd-gfx@lists.freedesktop.org<mailto:dri-devel@lists.free=
desktop.org,amd-gfx@lists.freedesktop.org>
CC:

[CAUTION: External Email]

This avoids OOM situations when we have lots of threads
submitting at the same time.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com><mailto:christia=
n.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c
index fff558cf385b..f9240a94217b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -648,7 +648,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser=
 *p,
        }

        r =3D ttm_eu_reserve_buffers(&p->ticket, &p->validated, true,
-                                  &duplicates, true);
+                                  &duplicates, false);
        if (unlikely(r !=3D 0)) {
                if (r !=3D -ERESTARTSYS)
                        DRM_ERROR("ttm_eu_reserve_buffers failed.\n");
--
2.17.1



--_000_wsx1tzkxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1v_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta content=3D"text/html; charset=3DWindows-1252">
</head>
<body bgcolor=3D"#FFFFFF">
how to refresh LRU to keep the order align with bo list passed from user sp=
ace?<br>
<br>
you can verify it by some games, performance could be different much betwee=
n multiple runnings.<br>
<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU durin=
g CS<br>
From: Christian K=F6nig <br>
To: &quot;Zhou, David(ChunMing)&quot; ,&quot;Olsak, Marek&quot; ,&quot;Lian=
g, Prike&quot; ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.o=
rg<br>
CC: <br>
<br>
<div>[CAUTION: External Email]
<div>
<div class=3D"moz-cite-prefix">Hui? What do you mean with that?<br>
<br>
Christian.<br>
<br>
Am 14.05.19 um 15:12 schrieb Zhou, David(ChunMing):<br>
</div>
<blockquote type=3D"cite">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<style>
<!--
.EmailQuote
	{margin-left:1pt;
	padding-left:4pt;
	border-left:#800000 2px solid}
-->
</style>
<div>my only concern is how to fresh LRU when bo is from bo list.<br>
<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS=
<br>
From: Christian K=F6nig <br>
To: &quot;Olsak, Marek&quot; ,&quot;Zhou, David(ChunMing)&quot; ,&quot;Lian=
g, Prike&quot; ,<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:dri-de=
vel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org">dri-devel@lists.fr=
eedesktop.org,amd-gfx@lists.freedesktop.org</a><br>
CC: <br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
This avoids OOM situations when we have lots of threads<br>
submitting at the same time.<br>
<br>
Signed-off-by: Christian K=F6nig <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:christian.koenig@amd.com">
&lt;christian.koenig@amd.com&gt;</a><br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_cs.c<br>
index fff558cf385b..f9240a94217b 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c<br>
@@ -648,7 &#43;648,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_pa=
rser *p,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D ttm_eu_reserve_buffers(&am=
p;p-&gt;ticket, &amp;p-&gt;validated, true,<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;duplicates, true);<b=
r>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;duplicates, fals=
e);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r !=3D 0)) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; if (r !=3D -ERESTARTSYS)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&=
quot;ttm_eu_reserve_buffers failed.\n&quot;);<br>
--<br>
2.17.1<br>
<br>
</div>
</span></font></blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_wsx1tzkxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1v_--

--===============1741092101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1741092101==--
