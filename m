Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99014CDF58
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 12:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B8706E523;
	Mon,  7 Oct 2019 10:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr810042.outbound.protection.outlook.com [40.107.81.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768516E523;
 Mon,  7 Oct 2019 10:28:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAJ02Z/NRs9xjiiRa0dCVBDjtxJiiRtRO6/9iHsqHnSMkhGDxKIaGHrUCjOd04IAJ964Y6j2ThJ9Hceg2myGFsArSdJUFEGXM1EUO7lN1eOrVP8TZZxsJFI8g70k+iBESF/AjvPI+ikEL3EWdAo+wQOGJKlH7qYZQK7k0531Dj2MHBxhu6HoSN6PUzPlPptVGgkY2kKo7Dgs38X8A+QE3CDjhjvhAcFi0PA316JHo9JTosAbO1dKl8aUMl1NJRALjvujd7I6aOucG32vpcc/nQb2+MVrsnGHN+FB2C17h7k4OdQozgHS6gIb0LqSUExF9NZA3m/R916tHrgcUWYuug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+vemgo5hZY0bqZDfQ2th3kU0wwsGZ6dtfNvieeICEc=;
 b=WuT2kJ+HvMwQOByCyh/iQ2ANG1ZIPz2X6wR/o27nGurXan4c91N0G92LN+nvGlG1QSNDB4TgB8+ZhtcnZ12TZvxb/t5UCKTCnxqwUOv4WCKzbvlx/6BML4m3uazWuQXhaLJbPxpFPAmriKGAslgdrDEtxvTBIA41NQZHHgmSjNWsybNjfxfVQ/bhdVLWlN78AcUn1lqO97kljE58dFigTWNBi4cdx151ROn2KLZbXSk3ssqA8OyxK1d3RvqVPC3tAVCxc0WVmN5KnIG5nMOjPIcI/eEIxLOIqP4kFqFGntE12uOa0zCHrGhcbqw3aI+H1FmzrN3l4+Tq5f8cbOL/QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB3277.namprd12.prod.outlook.com (20.179.82.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Mon, 7 Oct 2019 10:28:55 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2327.023; Mon, 7 Oct 2019
 10:28:55 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: Dan Carpenter <dan.carpenter@oracle.com>, Rex Zhu <rex.zhu@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>
Subject: Re: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
Thread-Topic: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()
Thread-Index: AQHVfO5U6R5zsqSwXE27+AsiXYFzVadO+fuk
Date: Mon, 7 Oct 2019 10:28:55 +0000
Message-ID: <MN2PR12MB3296695EB3D9799B10971184A29B0@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20191007090454.GE3865@mwanda>
In-Reply-To: <20191007090454.GE3865@mwanda>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [58.246.141.171]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 404977bb-c0bb-4b2f-7a92-08d74b1127f4
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB3277:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB32772D444B345C850BEE6FCBA29B0@MN2PR12MB3277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 01834E39B7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(396003)(376002)(346002)(366004)(189003)(199004)(66446008)(66946007)(6306002)(66476007)(54896002)(64756008)(66556008)(236005)(91956017)(4326008)(76116006)(55016002)(9686003)(71200400001)(71190400001)(229853002)(256004)(14444005)(6436002)(2906002)(3846002)(6116002)(14454004)(966005)(66066001)(606006)(6246003)(86362001)(25786009)(8676002)(81156014)(81166006)(5660300002)(7736002)(8936002)(478600001)(52536014)(74316002)(476003)(6506007)(53546011)(102836004)(316002)(7696005)(54906003)(110136005)(26005)(76176011)(33656002)(99286004)(6636002)(446003)(11346002)(19627405001)(105004)(486006)(186003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3277;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: t+zZ/FntsglMVbFhO2VrITyJhtPa+P6EYF38+VbxRPipvaFOUv0N4v1qQjk9Rr9tmyifkExbSqWveR/FdDFUw/kPTCrXF3LWpn4PZAyxkl+dC18JuI3NWyvY/yhLbAu6KvUgIRz1Hhh3pbQL6BUleQSO/5FXnHAiF6j5z7XKToRm3I9NH7Ngv4ycTx1Q8NaUtM2R0RAW9WUB1EDZWPkX3dtZSP0hWEoAJxSMXOKYUM0pDEOvRYWNqBmQMsmI/vI7cWWC79MSKgjcb+OC04yk2jT17jS4nj76f0PPw0o0Ri9Abe8vpWU3noXUMX1BWAbj1khrZutFAfOA0prKRG/rwl8UAxRNdmSZnUr8KZWmuhJ+q1LCWjRYB95aNzCczizIyQ19UMhFAxCLxDk7zU0j9rix+aRGs5pvUg/C+EK8Fj56Ir0cGe6PQtSUdMq4mK+NYC764Eny/jrtD8uac1nIiA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 404977bb-c0bb-4b2f-7a92-08d74b1127f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2019 10:28:55.1066 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4srGLvFuekINWq0qoMJaOkIeLBjy1C5nLwH9IMVakmKwHHNxkKeUWq86EsXWjV98
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3277
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+vemgo5hZY0bqZDfQ2th3kU0wwsGZ6dtfNvieeICEc=;
 b=F99EYn+5NZ/1BC/7zTRIUtqYbIXSeB5Dm24oZaftqW4tvsNTVLSKrH27eOp2FciAohervATRgZb3cEuBZxFgTqMDron0UNrFlVj5ZnqVogGTbtndgX0RP55f5tgMs+cPDMjMC2BULI3gk6DM1udyWcEux3JbPDcx08mdayQL27Y=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============0764867736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0764867736==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296695EB3D9799B10971184A29B0MN2PR12MB3296namp_"

--_000_MN2PR12MB3296695EB3D9799B10971184A29B0MN2PR12MB3296namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Dan Carp=
enter <dan.carpenter@oracle.com>
Sent: Monday, October 7, 2019 5:04 PM
To: Rex Zhu <rex.zhu@amd.com>; Quan, Evan <Evan.Quan@amd.com>
Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; David Airlie <airlied@linu=
x.ie>; kernel-janitors@vger.kernel.org <kernel-janitors@vger.kernel.org>; a=
md-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-devel@lis=
ts.freedesktop.org <dri-devel@lists.freedesktop.org>; Daniel Vetter <daniel=
@ffwll.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christi=
an <Christian.Koenig@amd.com>
Subject: [PATCH] drm/amd/powerplay: unlock on error in smu_resume()

This function needs to drop the mutex before returning.

Fixes: f7e3a5776fa6 ("drm/amd/powerplay: check SMU engine readiness before =
proceeding on S3 resume")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c
index 6a64f765fcd4..f1fbbc8b77ee 100644
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
+++ b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c
@@ -1384,7 +1384,7 @@ static int smu_resume(void *handle)
         ret =3D smu_start_smc_engine(smu);
         if (ret) {
                 pr_err("SMU is not ready yet!\n");
-               return ret;
+               goto failed;
         }

         ret =3D smu_smc_table_hw_init(smu, false);
--
2.20.1

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_MN2PR12MB3296695EB3D9799B10971184A29B0MN2PR12MB3296namp_
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
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Best Regards,<br>
Kevin</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> amd-gfx &lt;amd-gfx-b=
ounces@lists.freedesktop.org&gt; on behalf of Dan Carpenter &lt;dan.carpent=
er@oracle.com&gt;<br>
<b>Sent:</b> Monday, October 7, 2019 5:04 PM<br>
<b>To:</b> Rex Zhu &lt;rex.zhu@amd.com&gt;; Quan, Evan &lt;Evan.Quan@amd.co=
m&gt;<br>
<b>Cc:</b> Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; David Airlie =
&lt;airlied@linux.ie&gt;; kernel-janitors@vger.kernel.org &lt;kernel-janito=
rs@vger.kernel.org&gt;; amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.fre=
edesktop.org&gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freed=
esktop.org&gt;;
 Daniel Vetter &lt;daniel@ffwll.ch&gt;; Deucher, Alexander &lt;Alexander.De=
ucher@amd.com&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/amd/powerplay: unlock on error in smu_resume()<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">This function needs to drop the mutex before retur=
ning.<br>
<br>
Fixes: f7e3a5776fa6 (&quot;drm/amd/powerplay: check SMU engine readiness be=
fore proceeding on S3 resume&quot;)<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@oracle.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/powerplay/amdgpu_smu.c | 2 &#43;-<br>
&nbsp;1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c b/drivers/gpu/drm/a=
md/powerplay/amdgpu_smu.c<br>
index 6a64f765fcd4..f1fbbc8b77ee 100644<br>
--- a/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/powerplay/amdgpu_smu.c<br>
@@ -1384,7 &#43;1384,7 @@ static int smu_resume(void *handle)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_start_smc_engi=
ne(smu);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; pr_err(&quot;SMU is not ready yet!\n&quot;);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return ret;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; goto failed;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D smu_smc_table_hw_i=
nit(smu, false);<br>
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

--_000_MN2PR12MB3296695EB3D9799B10971184A29B0MN2PR12MB3296namp_--

--===============0764867736==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0764867736==--
