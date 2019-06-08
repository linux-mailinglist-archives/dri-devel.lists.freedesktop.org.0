Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94F6D39FAB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2019 14:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE845892A1;
	Sat,  8 Jun 2019 12:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790084.outbound.protection.outlook.com [40.107.79.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64863892A1;
 Sat,  8 Jun 2019 12:27:49 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2719.namprd12.prod.outlook.com (52.135.103.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.14; Sat, 8 Jun 2019 12:27:47 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1965.011; Sat, 8 Jun 2019
 12:27:47 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, Dan Carpenter
 <dan.carpenter@oracle.com>
Subject: Re: [PATCH] drm/amdgpu: Fix bounds checking in
 amdgpu_ras_is_supported()
Thread-Topic: [PATCH] drm/amdgpu: Fix bounds checking in
 amdgpu_ras_is_supported()
Thread-Index: AQHVHdvwIU1iOu4Bn0uxPLo47uuVcqaRr3Dw
Date: Sat, 8 Jun 2019 12:27:47 +0000
Message-ID: <SN6PR12MB2800185519D425526956EDA687110@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <20190608092357.GB28890@mwanda>
In-Reply-To: <20190608092357.GB28890@mwanda>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [40.67.186.46]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f7136a2-0cf4-4f88-5add-08d6ec0cb727
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2719; 
x-ms-traffictypediagnostic: SN6PR12MB2719:
x-microsoft-antispam-prvs: <SN6PR12MB2719F0E272352A323EAD0BA987110@SN6PR12MB2719.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5236;
x-forefront-prvs: 0062BDD52C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(186003)(2906002)(3846002)(476003)(81156014)(26005)(72206003)(11346002)(446003)(71190400001)(71200400001)(6116002)(486006)(74316002)(8676002)(8936002)(5660300002)(55016002)(66476007)(64756008)(81166006)(7736002)(76116006)(86362001)(91956017)(53936002)(73956011)(66946007)(6246003)(9686003)(54896002)(66556008)(66446008)(110136005)(102836004)(68736007)(76176011)(54906003)(229853002)(478600001)(14444005)(316002)(25786009)(6436002)(256004)(7696005)(6506007)(53546011)(4326008)(33656002)(66066001)(14454004)(52536014)(99286004);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2719;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IIfVquj8Gc8SPCxIGDUNzhrzXiH0s5xyrZy01oqbk3qhYcgalRgVODDufZbCWg0Io4Rff8+3WPmtfGVEXCmOUHc0cYjrZSpusVLF+qhd6c4838FLaRxbihK2ggoTVpDmcNtfeLWnh3LX00Z0Gked5fsOBTVzAJvtbQi0lfSAti1MiN0Woe+wc2DpL3Xxrd7E7k9bW0/N9A/bwn9McI9VeJX1U8m8ZNiAa4ZLjEtWuQUHWVozMb6gHX6DQ7JhmL59147MwGbFizI0+/eF1FWXyB2ZFlE3SRpYOYzGpxMpnwpVtJD8cLTZEU5sZ4Bg/Z7kHqqJSov71oIVyw4mnfkYz6PdNLGRAsXh+SBGx1Er4AsMTEefmC2fO+SwDWDqRE0vMKj0pDXxlrfeopyUuG7r9lDVou+jlVyE6hgZEu5/fkE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f7136a2-0cf4-4f88-5add-08d6ec0cb727
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jun 2019 12:27:47.5106 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xpan@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2719
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7gUKRidPAmIpyWxSCKgjOZB+LACRWvZi8odeDRoEMU=;
 b=cxHj/NUChdsijTfMzsQSIAgzz/BFJeGVaCqsaCXPkZHdPIpTQ0dv7mBC2XlKsB2B/bg4DM/N4lRDPgeYEZpLTzi26RKiIzlzwkcQqDrvhDYgQkiJfmkj+O3CYQWV1f4SEtdeqc7IeP0HVkve/5b92mDo6Vlp9W8a9ZEu//ZajFc=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Xinhui.Pan@amd.com; 
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
Cc: "Quan, Evan" <Evan.Quan@amd.com>, David Airlie <airlied@linux.ie>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhu,
 James" <James.Zhu@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0416582555=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0416582555==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB2800185519D425526956EDA687110SN6PR12MB2800namp_"

--_000_SN6PR12MB2800185519D425526956EDA687110SN6PR12MB2800namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

do you mean that something like 1<<65 might be a none zero value?
________________________________
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: Saturday, June 8, 2019 5:23:57 PM
To: Deucher, Alexander; Pan, Xinhui
Cc: Koenig, Christian; Zhou, David(ChunMing); David Airlie; Daniel Vetter; =
Quan, Evan; Zhu, James; amd-gfx@lists.freedesktop.org; dri-devel@lists.free=
desktop.org; kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: Fix bounds checking in amdgpu_ras_is_supported=
()

The "block" variable can be set by the user through debugfs, so it can
be quite large which leads to shift wrapping here.  This means we report
a "block" as supported when it's not, and that leads to array overflows
later on.

This bug is not really a security issue in real life, because debugfs is
generally root only.

Fixes: 36ea1bd2d084 ("drm/amdgpu: add debugfs ctrl node")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.h
index c6b34fbd695f..94c652f5265a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
@@ -173,6 +173,8 @@ static inline int amdgpu_ras_is_supported(struct amdgpu=
_device *adev,
 {
         struct amdgpu_ras *ras =3D amdgpu_ras_get_context(adev);

+       if (block >=3D AMDGPU_RAS_BLOCK_COUNT)
+               return 0;
         return ras && (ras->supported & (1 << block));
 }

--
2.20.1


--_000_SN6PR12MB2800185519D425526956EDA687110SN6PR12MB2800namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
do you mean that something like 1&lt;&lt;65 might be a none zero value?</di=
v>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Dan Carpenter &lt;d=
an.carpenter@oracle.com&gt;<br>
<b>Sent:</b> Saturday, June 8, 2019 5:23:57 PM<br>
<b>To:</b> Deucher, Alexander; Pan, Xinhui<br>
<b>Cc:</b> Koenig, Christian; Zhou, David(ChunMing); David Airlie; Daniel V=
etter; Quan, Evan; Zhu, James; amd-gfx@lists.freedesktop.org; dri-devel@lis=
ts.freedesktop.org; kernel-janitors@vger.kernel.org<br>
<b>Subject:</b> [PATCH] drm/amdgpu: Fix bounds checking in amdgpu_ras_is_su=
pported()</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">The &quot;block&quot; variable can be set by the u=
ser through debugfs, so it can<br>
be quite large which leads to shift wrapping here.&nbsp; This means we repo=
rt<br>
a &quot;block&quot; as supported when it's not, and that leads to array ove=
rflows<br>
later on.<br>
<br>
This bug is not really a security issue in real life, because debugfs is<br=
>
generally root only.<br>
<br>
Fixes: 36ea1bd2d084 (&quot;drm/amdgpu: add debugfs ctrl node&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h | 2 &#43;&#43;<br>
&nbsp;1 file changed, 2 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_ras.h<br>
index c6b34fbd695f..94c652f5265a 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h<br>
@@ -173,6 &#43;173,8 @@ static inline int amdgpu_ras_is_supported(struct am=
dgpu_device *adev,<br>
&nbsp;{<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ras *ras =3D=
 amdgpu_ras_get_context(adev);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (block &gt;=3D AMDGPU_RAS_BLOC=
K_COUNT)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; return 0;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ras &amp;&amp; (ras=
-&gt;supported &amp; (1 &lt;&lt; block));<br>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.20.1<br>
<br>
</div>
</span></font>
</body>
</html>

--_000_SN6PR12MB2800185519D425526956EDA687110SN6PR12MB2800namp_--

--===============0416582555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0416582555==--
