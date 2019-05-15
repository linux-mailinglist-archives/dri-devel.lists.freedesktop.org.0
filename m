Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D6F1F670
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97EC989291;
	Wed, 15 May 2019 14:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810048.outbound.protection.outlook.com [40.107.81.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94BC889291;
 Wed, 15 May 2019 14:21:11 +0000 (UTC)
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB3213.namprd12.prod.outlook.com (20.179.81.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Wed, 15 May 2019 14:21:09 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9daa:c9ea:c94e:ae45%3]) with mapi id 15.20.1878.024; Wed, 15 May 2019
 14:21:09 +0000
From: "Zhou, David(ChunMing)" <David1.Zhou@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "Olsak, Marek" <Marek.Olsak@amd.com>, "Liang, Prike"
 <Prike.Liang@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU during CS
Thread-Topic: Re:[PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU
 during CS
Thread-Index: AQHVCyjlrMQDyDF/S0ihK50raO9Jw6ZsPJAp
Date: Wed, 15 May 2019 14:21:09 +0000
Message-ID: <-z5t5bc-r0qydowvgp2jfwhsru6hathty0w6tmefo8lvfrqj4298bq6-53859k-e09jr8-7uhi4m-ne8q5-er44kbg5jt6sh5lbep35sue0-8jf289-u3ez2g-1jbf4vwi8mtu-b26by3izukbi-qq632i.1557930062576@email.android.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-11-christian.koenig@amd.com>
 <-vf7xt3-qgf5mz-veq8ih-okgxtz-9ehg3tx8dyemoidihe-fwj066fntvvx-x3y4nh-bn07hl-82anfo4oofx-4di7gg-3nkfhtbcgh58-yj9ws0-pthytc-oq9qcxd40s4g-249dv8-x6wbfujry6xi-mu2nvl.1557839540398@email.android.com>
 <f9017911-b08a-1f98-3fc9-98121bbde78a@gmail.com>
 <-wsx1tz-kxfbz1yns7x33sra134gl11xhlux4lx3izissqr2httt4mb1vleyxgj8i7k6-q6ze8ub3ff8c4o0fxmx7niu76yg4-ybakue-3v14jw-ed5ol8ybh6o9-1ze886-hbstfi448pvq3pwhkj.1557844282594@email.android.com>,
 <451e8757-b509-c0f7-eced-6ccedc45117b@gmail.com>
In-Reply-To: <451e8757-b509-c0f7-eced-6ccedc45117b@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [101.86.234.22]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fc3dc44d-fc7e-4a81-fc80-08d6d9409387
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB3213; 
x-ms-traffictypediagnostic: MN2PR12MB3213:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MN2PR12MB3213F9EBD54D45799068AA70B4090@MN2PR12MB3213.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0038DE95A2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(376002)(366004)(396003)(39860400002)(136003)(13464003)(189003)(199004)(25786009)(316002)(14444005)(256004)(7736002)(8936002)(81166006)(81156014)(64756008)(66556008)(450100002)(8676002)(53936002)(66476007)(73956011)(66946007)(110136005)(86362001)(2906002)(5660300002)(91956017)(76116006)(66446008)(66574012)(102836004)(99286004)(6506007)(606006)(2201001)(76176011)(6116002)(3846002)(71190400001)(71200400001)(478600001)(26005)(72206003)(966005)(6486002)(6436002)(14454004)(6306002)(476003)(9686003)(236005)(6512007)(54896002)(186003)(68736007)(11346002)(486006)(446003)(2501003)(66066001)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3213;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 8Jv0XsIxd94N0zHeNt7PIpBdX9O3UzLNJkeA5sT/FaEfOI1iwc29zlp1BnpKmeexXGIaaOQw5ixbkXfpmsuSpdqYqyf8lRpTHiBeJMybbtIon2cfzE8vXC7piDDgUmMYW6OXu3pT/euWVWO1YPBf05ozZjmRJ91tqv2Sq22nCbi0frrepSx8b8fJw35200sn+ciMx3FdgiOnoRz76B2dEJCiTvehQGmzttJ1JPHMdjg7QDcCZyoExxH91kJETU6GcLQ6MBp/55YkapQr10wqrwJP050j7+7Y/EBxiS/h9qugToBcY1OFWTwaoRK4er5GRSvV3gITc8lRqpewv6tzQTkrzgVdpM2x68KB7NCqtW2af5E/Dx4pF3IIEm8YlAgEPtwJazjAyuYSdZ0tQghWfihOWi+ti1KHL1+5D90kchI=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc3dc44d-fc7e-4a81-fc80-08d6d9409387
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2019 14:21:09.3819 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3213
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5c98RrsSmzZQMS5HqEjATzD+Dh6vGthUJ766u/hFon8=;
 b=JSFgQMt9o71vvF5oxB6H1L21fPVqJY6NQU9illkuTrdN20a7FQE0D/5xrLxIO4ca8V6yiOSub9VhzUwZWpD4vbpGyReISy8ZU2TBNdZ8ESEvGXqpwQ2//qrn3SQx5NhFO/Z9Ix6GHl++otGrAukd3SE4yMXe/bpXgDOaccG73S4=
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
Content-Type: multipart/mixed; boundary="===============1478938689=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1478938689==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_z5t5bcr0qydowvgp2jfwhsru6hathty0w6tmefo8lvfrqj4298bq653_"

--_000_z5t5bcr0qydowvgp2jfwhsru6hathty0w6tmefo8lvfrqj4298bq653_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Isn't this patch trying to stop removing for all BOs  from bo list?

-David

-------- Original Message --------
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU durin=
g CS
From: Christian K=F6nig
To: "Zhou, David(ChunMing)" ,"Koenig, Christian" ,"Olsak, Marek" ,"Liang, P=
rike" ,dri-devel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org
CC:

[CAUTION: External Email]
That is a good point, but actually not a problem in practice.

See the change to ttm_eu_fence_buffer_objects:
-               ttm_bo_add_to_lru(bo);
+               if (list_empty(&bo->lru))
+                       ttm_bo_add_to_lru(bo);
+               else
+                       ttm_bo_move_to_lru_tail(bo, NULL);

We still move the BOs to the end of the LRU in the same order we have befor=
e, we just don't remove them when they are reserved.

Regards,
Christian.

Am 14.05.19 um 16:31 schrieb Zhou, David(ChunMing):
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
s.freedesktop.org,amd-gfx@lists.freedesktop.org<mailto:dri-devel@lists.free=
desktop.org,amd-gfx@lists.freedesktop.org>
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





_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>
https://lists.freedesktop.org/mailman/listinfo/amd-gfx


--_000_z5t5bcr0qydowvgp2jfwhsru6hathty0w6tmefo8lvfrqj4298bq653_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta content=3D"text/html; charset=3DWindows-1252">
</head>
<body bgcolor=3D"#FFFFFF">
Isn't this patch trying to stop removing for all BOs&nbsp; from bo list?<br=
>
<br>
-David<br>
<br>
-------- Original Message --------<br>
Subject: Re: [PATCH 11/11] drm/amdgpu: stop removing BOs from the LRU durin=
g CS<br>
From: Christian K=F6nig <br>
To: &quot;Zhou, David(ChunMing)&quot; ,&quot;Koenig, Christian&quot; ,&quot=
;Olsak, Marek&quot; ,&quot;Liang, Prike&quot; ,dri-devel@lists.freedesktop.=
org,amd-gfx@lists.freedesktop.org<br>
CC: <br>
<br>
<div>[CAUTION: External Email]
<div>
<div class=3D"moz-cite-prefix">That is a good point, but actually not a pro=
blem in practice.<br>
<br>
See the change to ttm_eu_fence_buffer_objects:<br>
<blockquote type=3D"cite">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_add_to_lru(bo);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (list_empty(&amp;bo-&gt;lru))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_add_t=
o_lru(bo);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; else<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_bo_move_=
to_lru_tail(bo, NULL);<br>
</blockquote>
<br>
We still move the BOs to the end of the LRU in the same order we have befor=
e, we just don't remove them when they are reserved.<br>
<br>
Regards,<br>
Christian.<br>
<br>
Am 14.05.19 um 16:31 schrieb Zhou, David(ChunMing):<br>
</div>
<blockquote type=3D"cite">
<meta content=3D"text/html; charset=3DWindows-1252">
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
g, Prike&quot; ,<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:dri-de=
vel@lists.freedesktop.org,amd-gfx@lists.freedesktop.org">dri-devel@lists.fr=
eedesktop.org,amd-gfx@lists.freedesktop.org</a><br>
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
<br>
<fieldset class=3D"mimeAttachmentHeader"></fieldset>
<pre class=3D"moz-quote-pre">______________________________________________=
_
amd-gfx mailing list
<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:amd-gfx@lists.freedesk=
top.org">amd-gfx@lists.freedesktop.org</a>
<a class=3D"moz-txt-link-freetext" href=3D"https://lists.freedesktop.org/ma=
ilman/listinfo/amd-gfx">https://lists.freedesktop.org/mailman/listinfo/amd-=
gfx</a></pre>
</blockquote>
<br>
</div>
</div>
</body>
</html>

--_000_z5t5bcr0qydowvgp2jfwhsru6hathty0w6tmefo8lvfrqj4298bq653_--

--===============1478938689==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1478938689==--
