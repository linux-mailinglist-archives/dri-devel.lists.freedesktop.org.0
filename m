Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341B7243C0
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 00:54:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99B0F89193;
	Mon, 20 May 2019 22:54:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710069.outbound.protection.outlook.com [40.107.71.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B2789193;
 Mon, 20 May 2019 22:54:49 +0000 (UTC)
Received: from SN6PR12MB2800.namprd12.prod.outlook.com (52.135.107.150) by
 SN6PR12MB2687.namprd12.prod.outlook.com (52.135.103.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.16; Mon, 20 May 2019 22:54:47 +0000
Received: from SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c]) by SN6PR12MB2800.namprd12.prod.outlook.com
 ([fe80::4df8:270e:c062:6f8c%7]) with mapi id 15.20.1900.020; Mon, 20 May 2019
 22:54:47 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()
Thread-Topic: [PATCH] gpu: drm: use struct_size() in kmalloc()
Thread-Index: AQHVDI2qe/CUJDlUrE6nllhDkI7lB6ZvhnyWgASya4CAAGwJhg==
Date: Mon, 20 May 2019 22:54:47 +0000
Message-ID: <SN6PR12MB2800A78EC520C616CCCF387787060@SN6PR12MB2800.namprd12.prod.outlook.com>
References: <1558082760-4915-1-git-send-email-xiaolinkui@kylinos.cn>
 <SN6PR12MB2800A7AEC22121C8704CBB09870B0@SN6PR12MB2800.namprd12.prod.outlook.com>,
 <20190520162807.GE21222@phenom.ffwll.local>
In-Reply-To: <20190520162807.GE21222@phenom.ffwll.local>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [40.67.189.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: eb739a5f-b3c6-46ab-2f52-08d6dd76287f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:SN6PR12MB2687; 
x-ms-traffictypediagnostic: SN6PR12MB2687:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN6PR12MB26879872D6F99F7750E7B86B87060@SN6PR12MB2687.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-forefront-prvs: 004395A01C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(136003)(366004)(376002)(39860400002)(346002)(396003)(199004)(189003)(8676002)(71200400001)(71190400001)(8936002)(81166006)(81156014)(52536014)(478600001)(72206003)(966005)(66946007)(14454004)(91956017)(66476007)(66556008)(64756008)(66446008)(73956011)(76116006)(76176011)(7736002)(26005)(6916009)(606006)(25786009)(102836004)(4326008)(316002)(68736007)(53546011)(6506007)(186003)(7696005)(229853002)(53386004)(74316002)(256004)(6246003)(6436002)(66066001)(86362001)(6116002)(33656002)(53936002)(99286004)(11346002)(5660300002)(54906003)(55016002)(9686003)(6306002)(54896002)(3846002)(236005)(486006)(446003)(476003)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:SN6PR12MB2687;
 H:SN6PR12MB2800.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TQH5TZ0/RgVv0IYLs0SbnJC3YlF15Ndyux/vSzfZGGL4f1kQ/VKx+YCgyumjT30ypk0E15Y6g6JLqF6OcsbEYIjlkdumw4lfA4EJcZojDN3X16J77Q2twA39vtUsteC5vwtN4D4vwXSr490L8T1L9/xUJdntu0cDMuwU3vczDuDE6TjHLt8iItIZa1bdb99jZTryU8s4Zelr+rLwQHaPDOlkw3yAjJky/jerTsW1KsMR+42VS69kP472nXuzJcwD5DDruXPODOGvF9WF7l8KAUAfsIiLj4Bz05oJlJTTaGErcqxbDmuwz1ptk0bLkHhZTzni/jaSqXIkJHxULhMrOiJDW1fdNgAOhuzSem4rbJDNqqQqGxkjUomABbzmJlweCHAHmoU0+MaSHV3bS30QBfD1/yNtI0FUPmjjpZrTAkg=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb739a5f-b3c6-46ab-2f52-08d6dd76287f
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 May 2019 22:54:47.3547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2687
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H2TWubYjkc69OBspMW7gK03HQ60JxakjH/GgfaQJU18=;
 b=KV0qMVHCKZsUpMY2li/GWuV5ad2tO4OhTI/LNSa5y3p9rjLdLjDmqz//aWmSSuGPPnkbaQ+7qSwNGuM8U9YYWQ8QuOqhtO2/1+uE2FsqF9ulpS8pMD0a1z4cIPJJ9jGBLSkU751Ld5zh5lAwKr9kcbaEhObNI7buPAioaIpS7Lo=
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
Cc: "airlied@linux.ie" <airlied@linux.ie>, xiaolinkui <xiaolinkui@kylinos.cn>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Quan, Evan" <Evan.Quan@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0009595949=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0009595949==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_SN6PR12MB2800A78EC520C616CCCF387787060SN6PR12MB2800namp_"

--_000_SN6PR12MB2800A78EC520C616CCCF387787060SN6PR12MB2800namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Daniel, your idea is obviously and totally wrong. There can NOT be more tha=
n one zero-size array in a struct.

Nack for them all.
________________________________
From: Daniel Vetter <daniel.vetter@ffwll.ch> on behalf of Daniel Vetter <da=
niel@ffwll.ch>
Sent: Tuesday, May 21, 2019 12:28:07 AM
To: Pan, Xinhui
Cc: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); airlied@l=
inux.ie; daniel@ffwll.ch; Quan, Evan; xiaolinkui; amd-gfx@lists.freedesktop=
.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpu: drm: use struct_size() in kmalloc()

[CAUTION: External Email]

On Fri, May 17, 2019 at 04:44:30PM +0000, Pan, Xinhui wrote:
> I am going to put more members which are also array after this struct,
> not only obj[].  Looks like this struct_size did not help on multiple
> array case. Thanks anyway.  ________________________________

You can then add them up, e.g. kmalloc(struct_size()+struct_size(),
GFP_KERNEL), so this patch here still looks like a good idea.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Cheers, Daniel

> From: xiaolinkui <xiaolinkui@kylinos.cn>
> Sent: Friday, May 17, 2019 4:46:00 PM
> To: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); airlied=
@linux.ie; daniel@ffwll.ch; Pan, Xinhui; Quan, Evan
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux=
-kernel@vger.kernel.org; xiaolinkui@kylinos.cn
> Subject: [PATCH] gpu: drm: use struct_size() in kmalloc()
>
> [CAUTION: External Email]
>
> Use struct_size() helper to keep code simple.
>
> Signed-off-by: xiaolinkui <xiaolinkui@kylinos.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_ras.c
> index 22bd21e..4717a64 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> @@ -1375,8 +1375,7 @@ int amdgpu_ras_init(struct amdgpu_device *adev)
>         if (con)
>                 return 0;
>
> -       con =3D kmalloc(sizeof(struct amdgpu_ras) +
> -                       sizeof(struct ras_manager) * AMDGPU_RAS_BLOCK_COU=
NT,
> +       con =3D kmalloc(struct_size(con, objs, AMDGPU_RAS_BLOCK_COUNT),
>                         GFP_KERNEL|__GFP_ZERO);
>         if (!con)
>                 return -ENOMEM;
> --
> 2.7.4
>
>
>

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

--_000_SN6PR12MB2800A78EC520C616CCCF387787060SN6PR12MB2800namp_
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
Daniel, your idea is obviously and totally wrong. There can NOT be more tha=
n one zero-size array in a struct.<br>
<br>
</div>
<div dir=3D"auto" style=3D"direction:ltr; margin:0; padding:0; font-family:=
sans-serif; font-size:11pt; color:black">
Nack for them all.</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Daniel Vetter &lt;d=
aniel.vetter@ffwll.ch&gt; on behalf of Daniel Vetter &lt;daniel@ffwll.ch&gt=
;<br>
<b>Sent:</b> Tuesday, May 21, 2019 12:28:07 AM<br>
<b>To:</b> Pan, Xinhui<br>
<b>Cc:</b> Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); ai=
rlied@linux.ie; daniel@ffwll.ch; Quan, Evan; xiaolinkui; amd-gfx@lists.free=
desktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org<=
br>
<b>Subject:</b> Re: [PATCH] gpu: drm: use struct_size() in kmalloc()</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:11pt;">
<div class=3D"PlainText">[CAUTION: External Email]<br>
<br>
On Fri, May 17, 2019 at 04:44:30PM &#43;0000, Pan, Xinhui wrote:<br>
&gt; I am going to put more members which are also array after this struct,=
<br>
&gt; not only obj[].&nbsp; Looks like this struct_size did not help on mult=
iple<br>
&gt; array case. Thanks anyway.&nbsp; ________________________________<br>
<br>
You can then add them up, e.g. kmalloc(struct_size()&#43;struct_size(),<br>
GFP_KERNEL), so this patch here still looks like a good idea.<br>
<br>
Reviewed-by: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;<br>
<br>
Cheers, Daniel<br>
<br>
&gt; From: xiaolinkui &lt;xiaolinkui@kylinos.cn&gt;<br>
&gt; Sent: Friday, May 17, 2019 4:46:00 PM<br>
&gt; To: Deucher, Alexander; Koenig, Christian; Zhou, David(ChunMing); airl=
ied@linux.ie; daniel@ffwll.ch; Pan, Xinhui; Quan, Evan<br>
&gt; Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; li=
nux-kernel@vger.kernel.org; xiaolinkui@kylinos.cn<br>
&gt; Subject: [PATCH] gpu: drm: use struct_size() in kmalloc()<br>
&gt;<br>
&gt; [CAUTION: External Email]<br>
&gt;<br>
&gt; Use struct_size() helper to keep code simple.<br>
&gt;<br>
&gt; Signed-off-by: xiaolinkui &lt;xiaolinkui@kylinos.cn&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 3 &#43;--<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_ras.c<br>
&gt; index 22bd21e..4717a64 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c<br>
&gt; @@ -1375,8 &#43;1375,7 @@ int amdgpu_ras_init(struct amdgpu_device *ad=
ev)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (con)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con =3D kmalloc(sizeof(struct am=
dgpu_ras) &#43;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sizeof(stru=
ct ras_manager) * AMDGPU_RAS_BLOCK_COUNT,<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; con =3D kmalloc(struct_size(=
con, objs, AMDGPU_RAS_BLOCK_COUNT),<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; G=
FP_KERNEL|__GFP_ZERO);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!con)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOMEM;<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt;<br>
&gt;<br>
<br>
--<br>
Daniel Vetter<br>
Software Engineer, Intel Corporation<br>
<a href=3D"http://blog.ffwll.ch">http://blog.ffwll.ch</a><br>
</div>
</span></font>
</body>
</html>

--_000_SN6PR12MB2800A78EC520C616CCCF387787060SN6PR12MB2800namp_--

--===============0009595949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0009595949==--
