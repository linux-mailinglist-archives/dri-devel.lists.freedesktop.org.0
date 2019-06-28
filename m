Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BE59E92
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:15:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCB36E948;
	Fri, 28 Jun 2019 15:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 131606E948;
 Fri, 28 Jun 2019 15:15:39 +0000 (UTC)
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB3402.namprd12.prod.outlook.com (20.178.198.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Fri, 28 Jun 2019 15:15:37 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:15:37 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, Rex Zhu <rex.zhu@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amd/powerplay: fix off-by-one array bounds check
Thread-Topic: [PATCH] drm/amd/powerplay: fix off-by-one array bounds check
Thread-Index: AQHVLcGbdpdput2jj06n3qqRlWArpaaxLSVu
Date: Fri, 28 Jun 2019 15:15:37 +0000
Message-ID: <DM6PR12MB32096A72A966E48A2139FC05FEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628142402.2771-1-colin.king@canonical.com>
In-Reply-To: <20190628142402.2771-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fb6f8bae-08b8-4ae7-1fa1-08d6fbdb795e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB3402; 
x-ms-traffictypediagnostic: DM6PR12MB3402:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB34023AFC2EA4A9B2B336D032FEFC0@DM6PR12MB3402.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(366004)(189003)(199004)(55016002)(8936002)(6306002)(7696005)(76176011)(9686003)(54896002)(236005)(71190400001)(71200400001)(6506007)(86362001)(6246003)(6436002)(53546011)(68736007)(6606003)(33656002)(19627405001)(81156014)(25786009)(229853002)(81166006)(186003)(102836004)(26005)(7736002)(8676002)(66066001)(4326008)(256004)(14444005)(99286004)(74316002)(5660300002)(53936002)(476003)(486006)(52536014)(2201001)(66556008)(66476007)(64756008)(11346002)(91956017)(76116006)(73956011)(66946007)(446003)(66446008)(6116002)(3846002)(2906002)(14454004)(966005)(72206003)(606006)(478600001)(110136005)(54906003)(2501003)(316002)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3402;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IrXw8l3DVM09RIuZbSfC9swh4YHsKkc3LswjuhM3+1XLc0BGTaiKDu1/Rwx7hSoiR9s5uJEzvfycuKStBHxoRrxV4mbr3o/QLUL+ld8ZIiMsC3Fr8pWvKFyC/HW3jC74IuONyg6FDprj6EnyHJhGDnJJLHoB1abyaPqdC02AQvlRF3mzBoVkkeLUIT+i4bCC+XSnn7/BRpXidWfbRKySpaXbSUjxRgNiDsGDVporT40KEgOBxunSmsswqddnmUEt645wK/4faduoRVFtm6DFEUBW3LynmJz2rhjMTQ4c6iV6YmScPZCl0x0sMPwYo2H23TeEvdjUEhldcBEkLnlqwGVg0ShZR59zqWO2/iida8ag0PW4P3fRggqDh/mXjeEFsw9PXoNUw6Q0OYCRkB2qJSJYKFa9a2E/hpiItOpKddk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6f8bae-08b8-4ae7-1fa1-08d6fbdb795e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:15:37.1735 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3402
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBqntFy3vGUMRY6NLiUaxydaIZghCwtNlv7ObAeCYHw=;
 b=K9GQWRpA3prAFL8oKHIBqD2uTxokjPxYgGQpPR9AximkyZnsVbdl/2WpDTLy70NySwjKP6KB5O9bwGefr9rzASpVHvvcJlX5DMJ6vRiNCFFgLsJ0uLHhsB1RbSAoWDnD9qxxlbDbR1kA8L9JOHDEeWTmaRLV1lWMdHyf8v89DPU=
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
Content-Type: multipart/mixed; boundary="===============0223147492=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0223147492==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB32096A72A966E48A2139FC05FEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB32096A72A966E48A2139FC05FEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 10:24:02 AM
To: Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Christian; Zhou, David=
(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; dri=
-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd/powerplay: fix off-by-one array bounds check

From: Colin Ian King <colin.king@canonical.com>

The array bounds check for index is currently off-by-one and should
be using >=3D rather than > on the upper bound. Fix this.

Addresses-Coverity: ("Out-of-bounds read")
Fixes: b3490673f905 ("drm/amd/powerplay: introduce the navi10 pptable imple=
mentation")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c
index 27e5c80..f678700 100644
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
+++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
@@ -210,7 +210,7 @@ static int navi10_workload_map[] =3D {
 static int navi10_get_smu_msg_index(struct smu_context *smc, uint32_t inde=
x)
 {
         int val;
-       if (index > SMU_MSG_MAX_COUNT)
+       if (index >=3D SMU_MSG_MAX_COUNT)
                 return -EINVAL;

         val =3D navi10_message_map[index];
--
2.7.4

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB32096A72A966E48A2139FC05FEFC0DM6PR12MB3209namp_
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
<b>Sent:</b> Friday, June 28, 2019 10:24:02 AM<br>
<b>To:</b> Rex Zhu; Quan, Evan; Deucher, Alexander; Koenig, Christian; Zhou=
, David(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.o=
rg; dri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH] drm/amd/powerplay: fix off-by-one array bounds chec=
k</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
The array bounds check for index is currently off-by-one and should<br>
be using &gt;=3D rather than &gt; on the upper bound. Fix this.<br>
<br>
Addresses-Coverity: (&quot;Out-of-bounds read&quot;)<br>
Fixes: b3490673f905 (&quot;drm/amd/powerplay: introduce the navi10 pptable =
implementation&quot;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/a=
md/powerplay/navi10_ppt.c<br>
index 27e5c80..f678700 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c<br>
@@ -210,7 &#43;210,7 @@ static int navi10_workload_map[] =3D {<br>
&nbsp;static int navi10_get_smu_msg_index(struct smu_context *smc, uint32_t=
 index)<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int val;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (index &gt; SMU_MSG_MAX_COUNT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (index &gt;=3D SMU_MSG_MAX_COU=
NT)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; val =3D navi10_message_map=
[index];<br>
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

--_000_DM6PR12MB32096A72A966E48A2139FC05FEFC0DM6PR12MB3209namp_--

--===============0223147492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0223147492==--
