Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 100171C939
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 15:12:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 644A6891E2;
	Tue, 14 May 2019 13:12:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720074.outbound.protection.outlook.com [40.107.72.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F04B8891E2;
 Tue, 14 May 2019 13:12:27 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3504.namprd12.prod.outlook.com (20.178.244.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Tue, 14 May 2019 13:12:25 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45%3]) with mapi id 15.20.1878.024; Tue, 14 May 2019
 13:12:25 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "Olsak, Marek" <Marek.Olsak@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Liang, Prike" <Prike.Liang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
Thread-Topic: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU
 during CS
Thread-Index: AQHVClD89v63TTsyx0e4Wdty4T0sRKZqmLZp
Date: Tue, 14 May 2019 13:12:25 +0000
Message-ID: <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>,
 <20190514123127.1650-11-christian.koenig@amd.com>
In-Reply-To: <20190514123127.1650-11-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c510aa91-d994-43f2-69cd-08d6d86dcf3b
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3504; 
x-ms-traffictypediagnostic: MN2PR12MB3504:
x-microsoft-antispam-prvs: <MN2PR12MB350408E5C5D2BCB39301390AB4080@MN2PR12MB3504.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2958;
x-forefront-prvs: 0037FD6480
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(39860400002)(136003)(366004)(346002)(376002)(396003)(13464003)(189003)(199004)(8676002)(81166006)(446003)(81156014)(68736007)(5660300002)(2501003)(478600001)(14454004)(8936002)(3846002)(6116002)(11346002)(72206003)(2906002)(476003)(71200400001)(71190400001)(486006)(53936002)(25786009)(7736002)(76176011)(102836004)(316002)(6506007)(66574012)(99286004)(6436002)(26005)(6486002)(66946007)(64756008)(54896002)(14444005)(86362001)(256004)(6512007)(186003)(9686003)(110136005)(73956011)(66446008)(66066001)(76116006)(66476007)(91956017)(66556008)(2201001)(87826002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3504;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1VbWT3JKlExPM7SzxVTWKR9/cps1ni6Gz4AMRK76xRayD1ioBsFr/GvMRLFUcufxIkNzBtCOG37038QRN808p5WPQq9ZbBIk0kQMwORTmVMYp3kmaYPj8n7GMyFbQUDWHHBQJL+cu33eVbtR6jqNWYC3V2oinm2HqolZDnbZvXCCLkDLQv+qm1+advVFQ/Fgs6bN49hXbe7mfC/HVyUx0UOCBkjSEkSCPmassHPKvmMeYjTwWeEU9C3nf6CwKm0GnJTUAuQ14IgdO/F7gxPlSluvsteFn1gDIabhh08Txr4GHmcl8svwWFazZWgrxoSdXzZHNWvJmuIh4qfCBoCz92eFiRLE7s49QoYnRV5F55sBN0SBFSTIhm+chteLwwF7rTOdbKl/7qMKoIe5a1/c/pncoqmx6cJxfq5JoG4rmmw=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c510aa91-d994-43f2-69cd-08d6d86dcf3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 May 2019 13:12:25.4592 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3504
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amd-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+NMZgl7c4vIPhk8yLhM47r4vV1XjAEIE4yqUrfKBc8=;
 b=pGXqx0miIF2ImCINv+ljx00ozkw3bJi4Kh6FWfOWWH/D4GCJP/KYArxF20Kh38K/cbl4cVj17LJEo3ORcjBS7R+HYs2UlJg4ukbPJhvWKSVBPpYNQJaYYc+2hJDTKFHqI8tDeNsAgmoPoRlBtFHNlNWP3eOc5ZDwcxL5HrpT/TQ=
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
Content-Type: multipart/mixed; boundary="===============1979960519=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1979960519==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_vf7xt3qgf5mzveq8ihokgxtz9ehg3tx8dyemoidihefwj066fntvvxx_"

--_000_vf7xt3qgf5mzveq8ihokgxtz9ehg3tx8dyemoidihefwj066fntvvxx_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

my only concern is how to fresh LRU when bo is from bo list.

-David

-------- Original Message --------
Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
From: Christian K=F6nig
To: "Olsak, Marek" ,"Zhou, David(ChunMing)" ,"Liang, Prike" ,dri-devel@list=
s.freedesktop.org,amd-gfx@lists.freedesktop.org
CC:

[CAUTION: External Email]

This avoids OOM situations when we have lots of threads
submitting at the same time.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
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


--_000_vf7xt3qgf5mzveq8ihokgxtz9ehg3tx8dyemoidihefwj066fntvvxx_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>my only concern is how to fresh LRU when bo is from bo list.<br>
<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS=
<br>
From: Christian K=F6nig <br>
To: &quot;Olsak, Marek&quot; ,&quot;Zhou, David(ChunMing)&quot; ,&quot;Lian=
g, Prike&quot; ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.o=
rg<br>
CC: <br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
This avoids OOM situations when we have lots of threads<br>
submitting at the same time.<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
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
</span></font>
</body>
</html>

--_000_vf7xt3qgf5mzveq8ihokgxtz9ehg3tx8dyemoidihefwj066fntvvxx_--

--===============1979960519==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1979960519==--
