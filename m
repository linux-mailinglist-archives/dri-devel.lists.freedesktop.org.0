Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DF6BB3DD
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 14:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C120D6E8A1;
	Mon, 23 Sep 2019 12:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690059.outbound.protection.outlook.com [40.107.69.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C156E89F;
 Mon, 23 Sep 2019 12:35:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AqGqQrxNaoOQovEXk/787FoYBi0sptbInL4scUUiA8quQMoARgFC7HbNnWdFLKsWu3gnDJaNc5GsyEoH8q8Iz1RAZIGbkw+QNtZJpAiYNMVrLKOn6cmf287DcPctSQTyBV1i1mDT2iIkCKePaPpfI221tk3AUq5CLJeFBlzPOiHV8SGpLQr/RfiVr7NUGGnc/h2tJfVOTHIbh6AjhY49tGjgRlywNheFz6A4hg7XK108peD8vAUoHDvXncqLfbXBp8UxOmXslNxpV46MD3KfLVHTdNrypZHgY+17OAagZAhq9oa7MHTSACcWpRskVBPQJ3jfsy/oJ9K1OLnxBaITqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOWkj+WVGbrQ1NOn1wAYaPBZI4kqmPHKUW7oYVCehYs=;
 b=RIjJynRdu42916kFvK6Ec85D7J+msDVEmyih+hnSylKZYR6LzrXmiX1UJziP6y88BTmql8oAkKnjnXY6RnwyKM9f3+WxiO8X55T9qem1Af9XQZBlc0ZTAujtkgGRz/W8ihSmEnQkBHl59Aub/tyvBTkApyzk7Mh6EGC6yRieQHgoUGlCLPTJseLPCZtm0R9yDP/IBapIsefSZg/8dO2NBFpkelsSVnQMIx+DqWIaut39sTBUmziIdMU8v8JWW0J9hlu03ljC+Z2s5UuqsRxufwihKQA8gu2o3u6Wn+DsZPzY6lmzM42NUys2Eppbv9TKhCq2HE2xHYm6hFZoNQcHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1716.namprd12.prod.outlook.com (10.175.100.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.18; Mon, 23 Sep 2019 12:35:40 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::a930:a648:d4d2:d25c%12]) with mapi id 15.20.2263.030; Mon, 23 Sep
 2019 12:35:40 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Navid Emamdoost
 <navid.emamdoost@gmail.com>
Subject: Re: [PATCH] drm/amdgpu: release allocated memory
Thread-Topic: [PATCH] drm/amdgpu: release allocated memory
Thread-Index: AQHVcAWtxyTHdTfxLkKkLSo9Up/qVqc2AHmAgAM2LFc=
Date: Mon, 23 Sep 2019 12:35:40 +0000
Message-ID: <BN6PR12MB1809C096DD42018B33EDFC4FF7850@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190920224915.2788-1-navid.emamdoost@gmail.com>,
 <06d1d086-0628-829b-766f-e1f614fab909@amd.com>
In-Reply-To: <06d1d086-0628-829b-766f-e1f614fab909@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.73.178]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2b7a0ea1-03f0-4ffc-87c8-08d740228b08
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1716; 
x-ms-traffictypediagnostic: BN6PR12MB1716:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB171649F1E29ACC73EB5DA157F7850@BN6PR12MB1716.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2582;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(199004)(189003)(229853002)(19627405001)(66476007)(7736002)(66946007)(316002)(52536014)(5660300002)(6246003)(486006)(25786009)(74316002)(66556008)(7416002)(76116006)(256004)(64756008)(86362001)(66446008)(66066001)(81156014)(81166006)(9686003)(54896002)(99286004)(7696005)(186003)(8676002)(6506007)(53546011)(102836004)(55016002)(71190400001)(71200400001)(6436002)(33656002)(6116002)(3846002)(105004)(8936002)(26005)(478600001)(54906003)(2906002)(110136005)(4326008)(446003)(11346002)(14454004)(76176011)(476003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1716;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QzCIxeYLnlhcLIUrxAFh/sCB+nfPd66rb4wTU5GA63XQ4fMEdXc6JPTwa3xlKBpEsyIlfIkDnRhn/Wws+0r5S8e6PFtvK8w/S64MwB7t8jtc7JRw0WuJUKNP4yvD3rnqkYFa8fuR9eAHl9pLY9Gr4sXF1BYraOztk5TvYa1sHPO6VnvLxSKG3Kkf5Zin3JfaanJDJyk5lW0J2OW78c/QgSP9UoYC6+Pss18u10RIMyQc0a0cv5ECyCTY6iG5fgE3k3dEXYXO5uu5U9inLJ5H88auvkX1Rh2Ry4w/hJUMjOUVzmjy1Mtvxa+C0ia59RDXEKCyerHT8vCPhDgJO+fUC2jmoMhqQa/WWPJIMAd9TlpBeK4iO+gYLwV9ISx6PP7ZX8hdLGLPXnJVvht1xUV+iyD++7QtOVzW1PkTMG0hIkE=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b7a0ea1-03f0-4ffc-87c8-08d740228b08
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 12:35:40.0862 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TOE1DLYpzN+5IJsGIqRdq8ARd1zfmn/VRe9OHPFPy9xkCfZ0wjli0Izw1UiHWXAaLJKiEUomP3mo8oz+6ejQfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1716
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOWkj+WVGbrQ1NOn1wAYaPBZI4kqmPHKUW7oYVCehYs=;
 b=DDTTXbFMZPMCapSSiSOZCe4ynVCLi6pR49jg+tvtl/7ZGd8JtXkac/ljax2lyqiFS0mzk7twALFGZ0kgna4gFtgmw++/9BJZ9MW+4bX/h/CdiM0IFhDpdKbrMH9s0Yk7Q6SKUSP14GV7XjV5dlmse8rqrsGEFqOzxx57dRC25/k=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Alexander.Deucher@amd.com; 
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
Cc: David Airlie <airlied@linux.ie>, Rex Zhu <Rex.Zhu@amd.com>,
 "kjlu@umn.edu" <kjlu@umn.edu>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "emamd001@umn.edu" <emamd001@umn.edu>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "smccaman@umn.edu" <smccaman@umn.edu>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============1223583101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1223583101==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809C096DD42018B33EDFC4FF7850BN6PR12MB1809namp_"

--_000_BN6PR12MB1809C096DD42018B33EDFC4FF7850BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Maybe add a comment here in the code to avoid confusion in the future.

Alex
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Saturday, September 21, 2019 7:32 AM
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Cc: emamd001@umn.edu <emamd001@umn.edu>; smccaman@umn.edu <smccaman@umn.edu=
>; kjlu@umn.edu <kjlu@umn.edu>; Deucher, Alexander <Alexander.Deucher@amd.c=
om>; Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@lin=
ux.ie>; Daniel Vetter <daniel@ffwll.ch>; Sam Ravnborg <sam@ravnborg.org>; R=
ex Zhu <Rex.Zhu@amd.com>; amd-gfx@lists.freedesktop.org <amd-gfx@lists.free=
desktop.org>; dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.=
org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu: release allocated memory

Am 21.09.19 um 00:49 schrieb Navid Emamdoost:
> In amdgpu_vmid_grab_idle, fences is being leaked in one execution path.
> The missing kfree was added.

NAK, the array is freed by the dma_fence_array.  This is a double free.

Regards,
Christian.

>
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ids.c
> index 57b3d8a9bef3..9063cd36fa94 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c
> @@ -244,6 +244,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu_vm *vm=
,
>                r =3D amdgpu_sync_fence(adev, sync, &array->base, false);
>                dma_fence_put(ring->vmid_wait);
>                ring->vmid_wait =3D &array->base;
> +             kfree(fences);
>                return r;
>        }
>        kfree(fences);


--_000_BN6PR12MB1809C096DD42018B33EDFC4FF7850BN6PR12MB1809namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Maybe add a comment here in the code to avoid confusion in the future.</div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Koenig, Christian &lt=
;Christian.Koenig@amd.com&gt;<br>
<b>Sent:</b> Saturday, September 21, 2019 7:32 AM<br>
<b>To:</b> Navid Emamdoost &lt;navid.emamdoost@gmail.com&gt;<br>
<b>Cc:</b> emamd001@umn.edu &lt;emamd001@umn.edu&gt;; smccaman@umn.edu &lt;=
smccaman@umn.edu&gt;; kjlu@umn.edu &lt;kjlu@umn.edu&gt;; Deucher, Alexander=
 &lt;Alexander.Deucher@amd.com&gt;; Zhou, David(ChunMing) &lt;David1.Zhou@a=
md.com&gt;; David Airlie &lt;airlied@linux.ie&gt;; Daniel Vetter &lt;daniel=
@ffwll.ch&gt;;
 Sam Ravnborg &lt;sam@ravnborg.org&gt;; Rex Zhu &lt;Rex.Zhu@amd.com&gt;; am=
d-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-deve=
l@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt;; linux-kern=
el@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/amdgpu: release allocated memory</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Am 21.09.19 um 00:49 schrieb Navid Emamdoost:<br>
&gt; In amdgpu_vmid_grab_idle, fences is being leaked in one execution path=
.<br>
&gt; The missing kfree was added.<br>
<br>
NAK, the array is freed by the dma_fence_array.&nbsp; This is a double free=
.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Navid Emamdoost &lt;navid.emamdoost@gmail.com&gt;<br>
&gt; ---<br>
&gt;&nbsp;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c | 1 &#43;<br>
&gt;&nbsp;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ids.c<br>
&gt; index 57b3d8a9bef3..9063cd36fa94 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ids.c<br>
&gt; @@ -244,6 &#43;244,7 @@ static int amdgpu_vmid_grab_idle(struct amdgpu=
_vm *vm,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; r =3D amdgpu_sync_fence(adev, sync, &amp;array-&gt;base=
, false);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; dma_fence_put(ring-&gt;vmid_wait);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; ring-&gt;vmid_wait =3D &amp;array-&gt;base;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; kfree(fences);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; return r;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(fences);<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB1809C096DD42018B33EDFC4FF7850BN6PR12MB1809namp_--

--===============1223583101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1223583101==--
