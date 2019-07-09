Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38D63991
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2019 18:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECEF86E065;
	Tue,  9 Jul 2019 16:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr740057.outbound.protection.outlook.com [40.107.74.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52DE76E054;
 Tue,  9 Jul 2019 16:40:26 +0000 (UTC)
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1315.namprd12.prod.outlook.com (10.168.228.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Tue, 9 Jul 2019 16:40:24 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::689d:2dcb:e0f7:bd8c%4]) with mapi id 15.20.2052.020; Tue, 9 Jul 2019
 16:40:24 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Abramov, Slava" <Slava.Abramov@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/amd/display: avoid 64-bit division
Thread-Topic: [PATCH] drm/amd/display: avoid 64-bit division
Thread-Index: AQHVNZRt/2o3yD5lUUCcXEG5QAwZZ6bCfHiAgAACD50=
Date: Tue, 9 Jul 2019 16:40:24 +0000
Message-ID: <BN6PR12MB1809956A9C61870CB7F675F5F7F10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190708135238.651483-1-arnd@arndb.de>,
 <DM6PR12MB320967C48957C4F2F0E92438FEF10@DM6PR12MB3209.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB320967C48957C4F2F0E92438FEF10@DM6PR12MB3209.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [71.219.79.35]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bb3046d-19f0-456f-fc25-08d7048c242d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1315; 
x-ms-traffictypediagnostic: BN6PR12MB1315:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BN6PR12MB13155C2861F5BAB0ED18F362F7F10@BN6PR12MB1315.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0093C80C01
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(396003)(136003)(366004)(346002)(39860400002)(199004)(189003)(110136005)(66556008)(54906003)(73956011)(55016002)(3846002)(71200400001)(71190400001)(6306002)(606006)(86362001)(256004)(14454004)(9686003)(99286004)(14444005)(54896002)(66446008)(64756008)(6246003)(7696005)(76116006)(66946007)(33656002)(236005)(19627405001)(102836004)(8936002)(53546011)(52536014)(6506007)(66066001)(53936002)(966005)(25786009)(72206003)(316002)(478600001)(229853002)(26005)(2906002)(8676002)(81156014)(81166006)(446003)(105004)(4326008)(76176011)(66476007)(74316002)(11346002)(476003)(486006)(186003)(6436002)(7736002)(5660300002)(6116002)(68736007)(921003)(1121003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1315;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: /o4PdTLGOUQ1N2N67eQVr5St3UfVkGAqrkTzS8tHpSvcA+K43yKiSiqeQ0gG4kxdRRba3MdN7qnPQL31XtLmIoXhLEAhcSBW7duHGml6ICkHf8FEOW3xGPJAW8k2kp3qK1vb5jfTJCw/25tBaopHqCVA0RqVEuZCZ175aa95nwUW5SbyvmcWK6gcCblOnOSexm/X1vpFlyQWip0hPzjc/4dXyp6s9rhiR0PlDv6dSLrGqw4XoNrt5f0GIgexf5xRZ86RwokvHDwebpEcwXJTN7OkUCwmCpXdPT/t7UFqn8RgCaLrCeCSxHu8bBsCn8xSnkmgqwDSMHtwSJBi/aucvRvR/ShicOzweAcndQ9Ruu2KdYfb1KEtYC46vblY7buhtBu5kFX8IbQ4ipUFtSQc2Vad56ZKfLvwub5BFKEXxXY=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb3046d-19f0-456f-fc25-08d7048c242d
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2019 16:40:24.2531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: adeucher@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1315
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwGSanenV+AYGAcow8Ec5ML6UETIp0fQFj7szomgPlY=;
 b=QKw/EZdYpKAtCcGbB5rKmDDmTD/Z3R6fL9G0H+7z0QpxIb+9J7e+2PH4ChAxr7KNmMsuSt6MA5vVqewOJu68AvmJz46mlfl4ux1jt52gxJWMHdw6JMv0Ar2AXMOX4WKv3ZBh7fK2L0Oam3x4M+PXBppnH5PQkd37RhGOsOrZphY=
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
Cc: "Liu, Charlene" <Charlene.Liu@amd.com>, "Park, Chris" <Chris.Park@amd.com>,
 "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Francis,
 David" <David.Francis@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Cornij,
 Nikola" <Nikola.Cornij@amd.com>, "Laktyushkin,
 Dmytro" <Dmytro.Laktyushkin@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Lei, 
 Jun" <Jun.Lei@amd.com>, "Cheng, Tony" <Tony.Cheng@amd.com>, "Koo,
 Anthony" <Anthony.Koo@amd.com>
Content-Type: multipart/mixed; boundary="===============1931156245=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1931156245==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB1809956A9C61870CB7F675F5F7F10BN6PR12MB1809namp_"

--_000_BN6PR12MB1809956A9C61870CB7F675F5F7F10BN6PR12MB1809namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'll just apply Arnd's patch.  If the display team wants to adjust it later=
 to clarify the operation, they should go ahead as a follow up patch.

Thanks,

Alex
________________________________
From: Abramov, Slava
Sent: Tuesday, July 9, 2019 12:31 PM
To: Arnd Bergmann; Wentland, Harry; Li, Sun peng (Leo); Deucher, Alexander;=
 Koenig, Christian; Zhou, David(ChunMing); David Airlie; Daniel Vetter
Cc: Liu, Charlene; Park, Chris; Cheng, Tony; Francis, David; linux-kernel@v=
ger.kernel.org; amd-gfx@lists.freedesktop.org; Cornij, Nikola; Laktyushkin,=
 Dmytro; dri-devel@lists.freedesktop.org; Lei, Jun; Lakha, Bhawanpreet; Koo=
, Anthony
Subject: Re: [PATCH] drm/amd/display: avoid 64-bit division


Hi Arnd!


Thanks for bisecting this issue.


I wonder whether you are going to commit your patch or planning to update i=
t and it's still in your work queue.  We have one of our 32-bit builds fail=
ing because of this issue, so that I would like either to fix it or wait to=
 your fix if it has chances to go upstream today.


Sincerely,



Slava Abramov

________________________________
From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> on behalf of Arnd Ber=
gmann <arnd@arndb.de>
Sent: Monday, July 8, 2019 9:52:08 AM
To: Wentland, Harry; Li, Sun peng (Leo); Deucher, Alexander; Koenig, Christ=
ian; Zhou, David(ChunMing); David Airlie; Daniel Vetter
Cc: Liu, Charlene; Park, Chris; Arnd Bergmann; Cheng, Tony; Francis, David;=
 linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Cornij, Nikol=
a; Laktyushkin, Dmytro; dri-devel@lists.freedesktop.org; Lei, Jun; Lakha, B=
hawanpreet; Koo, Anthony
Subject: [PATCH] drm/amd/display: avoid 64-bit division

On 32-bit architectures, dividing a 64-bit integer in the kernel
leads to a link error:

ERROR: "__udivdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
ERROR: "__divdi3" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!

Change the two recently introduced instances to a multiply+shift
operation that is also much cheaper on 32-bit architectures.
We can do that here, since both of them are really 32-bit numbers
that change a few percent.

Fixes: bedbbe6af4be ("drm/amd/display: Move link functions from dc to dc_li=
nk")
Fixes: f18bc4e53ad6 ("drm/amd/display: update calculated bounding box logic=
 for NV")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/amd/display/dc/core/dc_link.c         | 4 ++--
 drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c
index c17db5c144aa..8dbf759eba45 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -3072,8 +3072,8 @@ uint32_t dc_link_bandwidth_kbps(
                  * but the difference is minimal and is in a safe directio=
n,
                  * which all works well around potential ambiguity of DP 1=
.4a spec.
                  */
-               long long fec_link_bw_kbps =3D link_bw_kbps * 970LL;
-               link_bw_kbps =3D (uint32_t)(fec_link_bw_kbps / 1000LL);
+               link_bw_kbps =3D mul_u64_u32_shr(BIT_ULL(32) * 970LL / 1000=
,
+                                              link_bw_kbps, 32);
         }
 #endif

diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
index b35327bafbc5..70ac8a95d2db 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
@@ -2657,7 +2657,7 @@ static void update_bounding_box(struct dc *dc, struct=
 _vcs_dpi_soc_bounding_box_
                 calculated_states[i].dram_speed_mts =3D uclk_states[i] * 1=
6 / 1000;

                 // FCLK:UCLK ratio is 1.08
-               min_fclk_required_by_uclk =3D ((unsigned long long)uclk_sta=
tes[i]) * 1080 / 1000000;
+               min_fclk_required_by_uclk =3D mul_u64_u32_shr(BIT_ULL(32) *=
 1080 / 1000000, uclk_states[i], 32);

                 calculated_states[i].fabricclk_mhz =3D (min_fclk_required_=
by_uclk < min_dcfclk) ?
                                 min_dcfclk : min_fclk_required_by_uclk;
--
2.20.0

_______________________________________________
amd-gfx mailing list
amd-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/amd-gfx

--_000_BN6PR12MB1809956A9C61870CB7F675F5F7F10BN6PR12MB1809namp_
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
I'll just apply Arnd's patch.&nbsp; If the display team wants to adjust it =
later to clarify the operation, they should go ahead as a follow up patch.<=
/div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Thanks,<br>
</div>
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
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Abramov, Slava<br>
<b>Sent:</b> Tuesday, July 9, 2019 12:31 PM<br>
<b>To:</b> Arnd Bergmann; Wentland, Harry; Li, Sun peng (Leo); Deucher, Ale=
xander; Koenig, Christian; Zhou, David(ChunMing); David Airlie; Daniel Vett=
er<br>
<b>Cc:</b> Liu, Charlene; Park, Chris; Cheng, Tony; Francis, David; linux-k=
ernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Cornij, Nikola; Lakty=
ushkin, Dmytro; dri-devel@lists.freedesktop.org; Lei, Jun; Lakha, Bhawanpre=
et; Koo, Anthony<br>
<b>Subject:</b> Re: [PATCH] drm/amd/display: avoid 64-bit division</font>
<div>&nbsp;</div>
</div>
<style type=3D"text/css" style=3D"display:none">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p style=3D"margin-top:0; margin-bottom:0">Hi Arnd!</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Thanks for bisecting this issue.=
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">I wonder whether you are going t=
o commit your patch or planning to update it and it's still in your work qu=
eue.&nbsp; We have one of our 32-bit builds failing because of this issue, =
so that I would like either to fix it or
 wait to your fix if it has chances to go upstream today.</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Sincerely,</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0"><br>
</p>
<p style=3D"margin-top:0; margin-bottom:0">Slava Abramov</p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> amd-gfx &lt;amd-gfx=
-bounces@lists.freedesktop.org&gt; on behalf of Arnd Bergmann &lt;arnd@arnd=
b.de&gt;<br>
<b>Sent:</b> Monday, July 8, 2019 9:52:08 AM<br>
<b>To:</b> Wentland, Harry; Li, Sun peng (Leo); Deucher, Alexander; Koenig,=
 Christian; Zhou, David(ChunMing); David Airlie; Daniel Vetter<br>
<b>Cc:</b> Liu, Charlene; Park, Chris; Arnd Bergmann; Cheng, Tony; Francis,=
 David; linux-kernel@vger.kernel.org; amd-gfx@lists.freedesktop.org; Cornij=
, Nikola; Laktyushkin, Dmytro; dri-devel@lists.freedesktop.org; Lei, Jun; L=
akha, Bhawanpreet; Koo, Anthony<br>
<b>Subject:</b> [PATCH] drm/amd/display: avoid 64-bit division</font>
<div>&nbsp;</div>
</div>
<div class=3D"x_BodyFragment"><font size=3D"2"><span style=3D"font-size:11p=
t">
<div class=3D"x_PlainText">On 32-bit architectures, dividing a 64-bit integ=
er in the kernel<br>
leads to a link error:<br>
<br>
ERROR: &quot;__udivdi3&quot; [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefin=
ed!<br>
ERROR: &quot;__divdi3&quot; [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefine=
d!<br>
<br>
Change the two recently introduced instances to a multiply&#43;shift<br>
operation that is also much cheaper on 32-bit architectures.<br>
We can do that here, since both of them are really 32-bit numbers<br>
that change a few percent.<br>
<br>
Fixes: bedbbe6af4be (&quot;drm/amd/display: Move link functions from dc to =
dc_link&quot;)<br>
Fixes: f18bc4e53ad6 (&quot;drm/amd/display: update calculated bounding box =
logic for NV&quot;)<br>
Signed-off-by: Arnd Bergmann &lt;arnd@arndb.de&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/dc/core/dc_link.c&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; | 4 &#43;&#43;--<br>
&nbsp;drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 2 &#43;-<br>
&nbsp;2 files changed, 3 insertions(&#43;), 3 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/dr=
m/amd/display/dc/core/dc_link.c<br>
index c17db5c144aa..8dbf759eba45 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/core/dc_link.c<br>
@@ -3072,8 &#43;3072,8 @@ uint32_t dc_link_bandwidth_kbps(<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * but the difference is minimal and is in a saf=
e direction,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; * which all works well around potential ambigui=
ty of DP 1.4a spec.<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; long long fec_link_bw_kbps =3D link_bw_kbps * 970LL;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; link_bw_kbps =3D (uint32_t)(fec_link_bw_kbps / 1000LL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; link_bw_kbps =3D mul_u64_u32_shr(BIT_ULL(32) * 970LL / 1000,=
<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; link_bw_kbps, 32);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;#endif<br>
&nbsp;<br>
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/driver=
s/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
index b35327bafbc5..70ac8a95d2db 100644<br>
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c<br>
@@ -2657,7 &#43;2657,7 @@ static void update_bounding_box(struct dc *dc, st=
ruct _vcs_dpi_soc_bounding_box_<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; calculated_states[i].dram_speed_mts =3D uclk_states[i=
] * 16 / 1000;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; // FCLK:UCLK ratio is 1.08<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; min_fclk_required_by_uclk =3D ((unsigned long long)uclk_states[i=
]) * 1080 / 1000000;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; min_fclk_required_by_uclk =3D mul_u64_u32_shr(BIT_ULL(32) * =
1080 / 1000000, uclk_states[i], 32);<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; calculated_states[i].fabricclk_mhz =3D (min_fclk_requ=
ired_by_uclk &lt; min_dcfclk) ?<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; min_dcfclk : min_fclk_required_b=
y_uclk;<br>
-- <br>
2.20.0<br>
<br>
_______________________________________________<br>
amd-gfx mailing list<br>
amd-gfx@lists.freedesktop.org<br>
<a href=3D"https://lists.freedesktop.org/mailman/listinfo/amd-gfx">https://=
lists.freedesktop.org/mailman/listinfo/amd-gfx</a></div>
</span></font></div>
</div>
</body>
</html>

--_000_BN6PR12MB1809956A9C61870CB7F675F5F7F10BN6PR12MB1809namp_--

--===============1931156245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1931156245==--
