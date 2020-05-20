Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 018D11DB531
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 15:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42CDE89D40;
	Wed, 20 May 2020 13:38:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2069.outbound.protection.outlook.com [40.107.92.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FE0389D40;
 Wed, 20 May 2020 13:38:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kotNtZPHD5Lz5kp1ZI0WqxNNY36QEYgcq5uRTV90KMkSLhVZmamgMl6D5qfE2zAzrbrWYC9mDo9TYcumapERIOMEWLvc7czGxRsWBYjAznwTUgCooAboHwMSza2HilpBHv6Efx2iNS1ExbmHXq4Wk7bkb4S3mMp07w9bKxQBQnJaRKPjYDIsv0/TSkxqm1/4V2Iwd8s1SQZ68QSYJ+hI4mUZX4E87jLm7m/2iZcW6hACM8oE7xFiCsh/D/gbysWe6x+fs+NARtDa1r2okme8llXW2AI6pPrDPOEGMoxpBD+9aoEOi/dMnN7Ixcydc1x31EeT5gPDSIIebfdg9j1zCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zar4ujONOvQea1u+PCZZM9eM7dmdHesXgrvQq70Y/kk=;
 b=YvwaMLKN8Zk4Vd30Cfs2h3KBqBAhdGtmosrgBMnG4GKwWOXjSOgQNowafwTjPlrF4ZjhfRxUVTVIGv3C98OjLpy8AwvkU0bsKRr4Uljpldh1aoUzTAY66DGFGVU3PSRrzrFHNBzEMKmsDxdl1v4TYdFvwYMbUZyLGMT6H9qrHBnVE0y/ySTIGT+Agd0bYaDD56Zbl/twRBob521e9lKSlqHIuomirPOYejqTfNdh83wfAO4JzHmFEeVOqMCqqXL0B4+Nn6qLDf+pTPNqVG9+oIWpxw4mH+NeXEIOBWuMyEqdR7UmQh+e/SuzkZV4xzTDTVfhYmCLn1rNz3GUwvXp3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zar4ujONOvQea1u+PCZZM9eM7dmdHesXgrvQq70Y/kk=;
 b=Cdv575fG7eJTMTVPFYiucjny76XbV4ytj8fWef41xhQYfZ1KFckKXqGtYXIqYnwfOtVN2YVPgJ/of4xow3BU0nBDPMMtSCKxb8WkGUgZNzwDtbWGtiOCeqhEeNsz7iypwd1QmMEglzBiSACuiApnD9TjCQrWrdmUPZFI0GhzBTA=
Received: from BY5PR12MB4068.namprd12.prod.outlook.com (2603:10b6:a03:203::12)
 by BY5PR12MB3844.namprd12.prod.outlook.com (2603:10b6:a03:1ad::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3021.23; Wed, 20 May
 2020 13:38:21 +0000
Received: from BY5PR12MB4068.namprd12.prod.outlook.com
 ([fe80::1897:7b63:ee7e:5d2c]) by BY5PR12MB4068.namprd12.prod.outlook.com
 ([fe80::1897:7b63:ee7e:5d2c%2]) with mapi id 15.20.3000.034; Wed, 20 May 2020
 13:38:20 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH v2] drm/amdgpu: off by on in
 amdgpu_device_attr_create_groups() error handling
Thread-Topic: [PATCH v2] drm/amdgpu: off by on in
 amdgpu_device_attr_create_groups() error handling
Thread-Index: AQHWLqgMNjUhvbNSo06RZcwgCtFZwaiw+kXb
Date: Wed, 20 May 2020 13:38:20 +0000
Message-ID: <BY5PR12MB4068A89E90AFD74E62C210C9A2B60@BY5PR12MB4068.namprd12.prod.outlook.com>
References: <20200520125209.GP3041@kadam>,<20200520130812.GA177222@mwanda>
In-Reply-To: <20200520130812.GA177222@mwanda>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-05-20T13:38:21.450Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: oracle.com; dkim=none (message not signed)
 header.d=none;oracle.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [58.246.142.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9d4c1b3f-3f63-4492-33b6-08d7fcc30fc7
x-ms-traffictypediagnostic: BY5PR12MB3844:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR12MB3844B430C9A7F5CDB38E5AFDA2B60@BY5PR12MB3844.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 04097B7F7F
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yBG5V3ysKz5aGuy6BHrB3G+/0GE1zMviBRcfTiDHAnoKPfnpK5FUsCjKjeb6R49dLBJXI09hTCyh3tHy7cHE6bKYL17scl5/E3w/up/p2hulIvaeQM9jdQEYdWYsn8PXhTGAKTE4i0a/MvESYnD0SvaeQwKuF7DyhLyI6cYAhXAOMvuuI/KSP1mPC02ZPWq2+fRD5aQWs9uPPOGzpyS129N2ra5E7xvamvUsbAQLcBONp0gSwjJoc00xcBXTFCsyVNgpjGCIPGy5C3nDkG2joEcT6xAHVOwxzVs2FH4RIha0frcl6xFB5ZRoHr4214hcdPqjOUyTahONJsEkZL1frw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4068.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(366004)(346002)(376002)(396003)(136003)(6636002)(8936002)(9686003)(71200400001)(478600001)(8676002)(55016002)(33656002)(19627405001)(52536014)(66476007)(66556008)(64756008)(66946007)(66446008)(54906003)(4326008)(76116006)(86362001)(5660300002)(91956017)(6506007)(2906002)(110136005)(7696005)(186003)(53546011)(316002)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 7knhSlIiQmC8NDYK+T2DYDoJZv+HIeC2vX2AtDg1Uit7K30NTb67eaodQ8we8g+oZweRao9XqaK+VPxO0t2Ky2k2q9rLUGL5yh3vjk+XYC5PC2F9VJVCw4/hOuL1GimAFR/3lXzLyPazN5+jY/K3iX2EBRXGCVZ73telmMAeqeJS7FYm0ZF5t6Wv+926XzNRPyxJp8PWT7/o5f5AiskakavINNzEXeDCNF4xdOrWqneRbbuR3cjqHxM3mIbcK6XBxg2S1SNJqScKm57IPrC6aUmwRQNPpQesVZZH/gcn9DW73KL/diRxiyyE3CkCwMZBdHSQGw1+biQ37vxWXs/kTLSnEq233VtvwvAMwZ6DFEOEACrg/jvPI6U46WZI4m/lAqLDdLXlI0dAjFSKdt/krPtnG5ww76EDZ3mD6qDX57mF+LJ0jje4L5bEm5jPXxvjSMI26i9j0wVzkXAo4Qy2oJfHBQzqI29GlObv6VZBV5o=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4c1b3f-3f63-4492-33b6-08d7fcc30fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2020 13:38:20.7420 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vtJ+HjNuak0d8XpIwAxMv+RFpLYn08KguW7p4p5XzqS02XHExOcG/mxhO7K22uxL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3844
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
Cc: David Airlie <airlied@linux.ie>, "Tao, Yintian" <Yintian.Tao@amd.com>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Huang,
 Ray" <Ray.Huang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Quan,
 Evan" <Evan.Quan@amd.com>, "Feng, Kenneth" <Kenneth.Feng@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang, 
 Hawking" <Hawking.Zhang@amd.com>
Content-Type: multipart/mixed; boundary="===============1768424510=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1768424510==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BY5PR12MB4068A89E90AFD74E62C210C9A2B60BY5PR12MB4068namp_"

--_000_BY5PR12MB4068A89E90AFD74E62C210C9A2B60BY5PR12MB4068namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

thanks.

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regads,
Kevin
________________________________
From: Dan Carpenter <dan.carpenter@oracle.com>
Sent: Wednesday, May 20, 2020 9:08 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Wang, Kevin(Yang) <Kevi=
n1.Wang@amd.com>
Cc: Koenig, Christian <Christian.Koenig@amd.com>; David Airlie <airlied@lin=
ux.ie>; Daniel Vetter <daniel@ffwll.ch>; Quan, Evan <Evan.Quan@amd.com>; Hu=
ang, Ray <Ray.Huang@amd.com>; Feng, Kenneth <Kenneth.Feng@amd.com>; Tao, Yi=
ntian <Yintian.Tao@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>; amd-gf=
x@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lists.fr=
eedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vger.kernel.o=
rg <linux-kernel@vger.kernel.org>; kernel-janitors@vger.kernel.org <kernel-=
janitors@vger.kernel.org>
Subject: [PATCH v2] drm/amdgpu: off by on in amdgpu_device_attr_create_grou=
ps() error handling

This loop in the error handling code should start a "i - 1" and end at
"i =3D=3D 0".  Currently it starts a "i" and ends at "i =3D=3D 1".  The res=
ult
is that it removes one attribute that wasn't created yet, and leaks the
zeroeth attribute.

Fixes: 4e01847c38f7 ("drm/amdgpu: optimize amdgpu device attribute code")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: style change

 drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c           | 3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c
index b75362bf0742..e809534fabd4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
@@ -1942,9 +1942,8 @@ static int amdgpu_device_attr_create_groups(struct am=
dgpu_device *adev,
         return 0;

 failed:
-       for (; i > 0; i--) {
+       while (i--)
                 amdgpu_device_attr_remove(adev, &attrs[i]);
-       }

         return ret;
 }

--_000_BY5PR12MB4068A89E90AFD74E62C210C9A2B60BY5PR12MB4068namp_
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
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
thanks.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regads,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Kevin</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Dan Carpenter &lt;dan=
.carpenter@oracle.com&gt;<br>
<b>Sent:</b> Wednesday, May 20, 2020 9:08 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Wang, Kevi=
n(Yang) &lt;Kevin1.Wang@amd.com&gt;<br>
<b>Cc:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; David Airlie=
 &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel@ffwll.ch&gt;; Quan, Eva=
n &lt;Evan.Quan@amd.com&gt;; Huang, Ray &lt;Ray.Huang@amd.com&gt;; Feng, Ke=
nneth &lt;Kenneth.Feng@amd.com&gt;; Tao, Yintian &lt;Yintian.Tao@amd.com&gt=
;;
 Zhang, Hawking &lt;Hawking.Zhang@amd.com&gt;; amd-gfx@lists.freedesktop.or=
g &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedesktop.org &l=
t;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org &lt;lin=
ux-kernel@vger.kernel.org&gt;; kernel-janitors@vger.kernel.org
 &lt;kernel-janitors@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH v2] drm/amdgpu: off by on in amdgpu_device_attr_crea=
te_groups() error handling</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">This loop in the error handling code should start =
a &quot;i - 1&quot; and end at<br>
&quot;i =3D=3D 0&quot;.&nbsp; Currently it starts a &quot;i&quot; and ends =
at &quot;i =3D=3D 1&quot;.&nbsp; The result<br>
is that it removes one attribute that wasn't created yet, and leaks the<br>
zeroeth attribute.<br>
<br>
Fixes: 4e01847c38f7 (&quot;drm/amdgpu: optimize amdgpu device attribute cod=
e&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&gt;<br>
---<br>
v2: style change<br>
<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 3 &#43;--<br>
&nbsp;1 files changed, 1 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c b/drivers/gpu/drm/amd/a=
mdgpu/amdgpu_pm.c<br>
index b75362bf0742..e809534fabd4 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c<br>
@@ -1942,9 &#43;1942,8 @@ static int amdgpu_device_attr_create_groups(struc=
t amdgpu_device *adev,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
&nbsp;failed:<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (; i &gt; 0; i--) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; while (i--)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; amdgpu_device_attr_remove(adev, &amp;attrs[i]);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&nbsp;}<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_BY5PR12MB4068A89E90AFD74E62C210C9A2B60BY5PR12MB4068namp_--

--===============1768424510==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1768424510==--
