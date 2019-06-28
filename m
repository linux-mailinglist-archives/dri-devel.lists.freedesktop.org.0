Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD52159E7D
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 17:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911056E943;
	Fri, 28 Jun 2019 15:12:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770087.outbound.protection.outlook.com [40.107.77.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A696E943;
 Fri, 28 Jun 2019 15:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=testarcselector01; d=microsoft.com; cv=none;
 b=ZyQnh3yZirMswEcODZ3boO+zhEiPfs8ScHgutS3rGl1lPSZHkksCEFaNPYUk8YDRkhyGhtqrlP/RSOfu+B2s3mAyWpFwUdUfasDbUI5c5+HgTzZuE7A5lZxFyiFxQkEcpfp+ivYLqswOf2gCO4gGDHDuLZzZya5yWZnV8rIhXa0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=testarcselector01;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOUM+YSknyVo+ymTsX65ORrRzDvsuGJe16r8JXDHdVE=;
 b=Ya3sNYUM1PgQvWFID4/fkOcAnHfOibbb/XmScsDehRtcLiJBHdgLrbIISerhB/Zy/uBEDf18Y8iKj5rZnUVqvNq7fvPo4+WwxMrUB1FHJYZsYKjBl0ZyPA/CJ472+ZzfPEAdx/2JipBcs3cA5DD8gEN4mnU+/Yx8CSuk7cLQ5SM=
ARC-Authentication-Results: i=1; test.office365.com
 1;spf=none;dmarc=none;dkim=none;arc=none
Received: from DM6PR12MB3209.namprd12.prod.outlook.com (20.179.105.33) by
 DM6PR12MB2745.namprd12.prod.outlook.com (20.176.118.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Fri, 28 Jun 2019 15:12:36 +0000
Received: from DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25]) by DM6PR12MB3209.namprd12.prod.outlook.com
 ([fe80::41da:969f:dbb5:cd25%2]) with mapi id 15.20.2008.018; Fri, 28 Jun 2019
 15:12:36 +0000
From: "Abramov, Slava" <Slava.Abramov@amd.com>
To: Colin King <colin.king@canonical.com>, "Zhang, Hawking"
 <Hawking.Zhang@amd.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WARN_ON
 message
Thread-Topic: [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WARN_ON
 message
Thread-Index: AQHVLcGcHKXi+HUMbk+7lcypJLwekaaxLDbV
Date: Fri, 28 Jun 2019 15:12:36 +0000
Message-ID: <DM6PR12MB3209AFE47EFDC2F82404D57AFEFC0@DM6PR12MB3209.namprd12.prod.outlook.com>
References: <20190628140801.31937-1-colin.king@canonical.com>
In-Reply-To: <20190628140801.31937-1-colin.king@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e01ccc9-0914-46ec-2094-08d6fbdb0d9e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM6PR12MB2745; 
x-ms-traffictypediagnostic: DM6PR12MB2745:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR12MB2745B2334F49361D91F09DE5FEFC0@DM6PR12MB2745.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 00826B6158
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(189003)(199004)(66556008)(66446008)(14444005)(68736007)(25786009)(478600001)(236005)(66066001)(71190400001)(19627405001)(74316002)(71200400001)(81156014)(186003)(6246003)(8936002)(86362001)(76176011)(7736002)(3846002)(7696005)(316002)(6116002)(52536014)(54906003)(53546011)(15650500001)(2906002)(4326008)(8676002)(2201001)(110136005)(229853002)(6306002)(486006)(2501003)(54896002)(73956011)(66946007)(64756008)(81166006)(26005)(9686003)(6606003)(14454004)(6436002)(72206003)(102836004)(446003)(55016002)(966005)(256004)(6506007)(66476007)(76116006)(91956017)(606006)(53936002)(5660300002)(11346002)(33656002)(99286004)(476003)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB2745;
 H:DM6PR12MB3209.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nWYdsHfB2STeezg4TUin8ZedPxcqNz3Z1qWdsJKubJLHTw0BKLebTmDU5e5hb6VQVfdq9ZxsD99cSrLHJIN+Z9+xwSN+v9r742ey5akQfxPGXHcL3woYue7QTiV0H1HH0lnvZy3MVbbXgkQWeUDuDfZOlM1x5wtWM5tbpvlO9u+4HLmRHq5jThtE0TzGKcbFAkoPoGreSsZMwGcOU4jqYfKAqSKi7smAPVTGB1pr0bjSMM88dCbGlgWkPNr6cBbthjmuE0AWNlxCaGEetOPfea/TBiyrnTRS8Eza0N+NowSRvp+tNy0AJPUKuHL96L6FFKEnsAsMwCy+NGsChNtcuEGbhkXoxFzbU7sdC2tfN1ibtYJjEdOY7/SPkhOYG4iRE3CdA6+txgeK5+xy1JqNorsfw1JhVTO/kAJZEXYXhPE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e01ccc9-0914-46ec-2094-08d6fbdb0d9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2019 15:12:36.3850 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sabramov@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2745
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WOUM+YSknyVo+ymTsX65ORrRzDvsuGJe16r8JXDHdVE=;
 b=qe6XIgO12O8XW7qmWFen1+7Uz6ypGcWg5epFwMOxLJNLsW7MaBXIHQckFktQFlULERSKtqNj3rmdvULT0Kb2F8VbPmMD42ACTIDeFGMA8NZp45zujF5cYiQwdnqpvecnKw3dDOtgYWf4VrSroi80thsTwSEAJ1RBWLCzKS81Zyw=
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
Content-Type: multipart/mixed; boundary="===============1193386276=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1193386276==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_DM6PR12MB3209AFE47EFDC2F82404D57AFEFC0DM6PR12MB3209namp_"

--_000_DM6PR12MB3209AFE47EFDC2F82404D57AFEFC0DM6PR12MB3209namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Acked-by: Slava Abramov <slava.abramov@amd.com>

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Colin Ki=
ng <colin.king@canonical.com>
Sent: Friday, June 28, 2019 10:08:01 AM
To: Zhang, Hawking; Deucher, Alexander; Koenig, Christian; Zhou, David(Chun=
Ming); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; dri-deve=
l@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WARN_ON m=
essage

From: Colin Ian King <colin.king@canonical.com>

The WARN_ON is currently throwing a warning when i is 65 or higher which
is off by one. It should be 64 or higher (64 queues from 0..63 inclusive),
so fix this off-by-one comparison.

Fixes: 849aca9f9c03 ("drm/amdgpu: Move common code to amdgpu_gfx.c")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gfx.c
index 74066e1466f7..c8d106c59e27 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c
@@ -501,7 +501,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *adev)
                 /* This situation may be hit in the future if a new HW
                  * generation exposes more than 64 queues. If so, the
                  * definition of queue_mask needs updating */
-               if (WARN_ON(i > (sizeof(queue_mask)*8))) {
+               if (WARN_ON(i >=3D (sizeof(queue_mask)*8))) {
                         DRM_ERROR("Invalid KCQ enabled: %d\n", i);
                         break;
                 }
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_DM6PR12MB3209AFE47EFDC2F82404D57AFEFC0DM6PR12MB3209namp_
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
<b>Sent:</b> Friday, June 28, 2019 10:08:01 AM<br>
<b>To:</b> Zhang, Hawking; Deucher, Alexander; Koenig, Christian; Zhou, Dav=
id(ChunMing); David Airlie; Daniel Vetter; amd-gfx@lists.freedesktop.org; d=
ri-devel@lists.freedesktop.org<br>
<b>Cc:</b> kernel-janitors@vger.kernel.org; linux-kernel@vger.kernel.org<br=
>
<b>Subject:</b> [PATCH][next] drm/amdgpu: fix off-by-one comparison on a WA=
RN_ON message</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Colin Ian King &lt;colin.king@canonical.com&=
gt;<br>
<br>
The WARN_ON is currently throwing a warning when i is 65 or higher which<br=
>
is off by one. It should be 64 or higher (64 queues from 0..63 inclusive),<=
br>
so fix this off-by-one comparison.<br>
<br>
Fixes: 849aca9f9c03 (&quot;drm/amdgpu: Move common code to amdgpu_gfx.c&quo=
t;)<br>
Signed-off-by: Colin Ian King &lt;colin.king@canonical.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c b/drivers/gpu/drm/amd/=
amdgpu/amdgpu_gfx.c<br>
index 74066e1466f7..c8d106c59e27 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_gfx.c<br>
@@ -501,7 &#43;501,7 @@ int amdgpu_gfx_enable_kcq(struct amdgpu_device *ade=
v)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* This situation may be hit in the future if a new H=
W<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * generation exposes more than 64 queues. If so=
, the<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * definition of queue_mask needs updating */<br=
>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; if (WARN_ON(i &gt; (sizeof(queue_mask)*8))) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (WARN_ON(i &gt;=3D (sizeof(queue_mask)*8))) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_E=
RROR(&quot;Invalid KCQ enabled: %d\n&quot;, i);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break=
;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.20.1<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</body>
</html>

--_000_DM6PR12MB3209AFE47EFDC2F82404D57AFEFC0DM6PR12MB3209namp_--

--===============1193386276==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1193386276==--
