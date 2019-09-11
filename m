Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E2B0108
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 18:13:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C1B6EB4C;
	Wed, 11 Sep 2019 16:13:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam04on061f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe4d::61f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4620B6EB4D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 16:13:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT4gonJUU4l4IqyJbAvbRl1XIqX5MTVZUqfpbo9xOxBmvUiAgJYdchBMqC9l0V2BA4cLi8Wz2NIr8ww0CKLRqt4z5kGr+S1W88JVVZlC+W7ciLhiRXRPriwHY05GEuqKiWoG9m4/qF6oP34fQr6yhAICtAkGh0aI02Yj0PJNC2uytCsaPbrWVZ+XGwKU2H8TTlAYgi26yj3UAm5ovU3mmozyHXfLKw+viS4LFqje7N2h/VDuJHJdIrXGfBbkPcGAxEtKZWMeP7LD25tFxoZCpAg6iXEOx0IMsKRnhOzsKu1PSQVbmROxF0prcNDuyI8glmW8b0997NNgJS0VxiAdRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLH+xFp06FiD9aV6VcxRhmnRMawJetM7bIhdAtvUuW0=;
 b=oafm/MQTtq5vZ8COcXm8ozxwl4HyAJT7sMRbFr75smP9NtpxXKlfAgpG/spVlCbwgNlYtV/woGj9ldsNV/o6x7HTMFjhtw12cnBmE8S5JWTO9ow4yOmsIgojwv8t51RK9onxHlmQNDZIh2fYoOpQBNh6HxNStMld8wdtsUSxBvxJg4tmsUyYsOXsU53vLvKJ6ytt8TdNyZa67CR2hpddCCDXdFcBr6g28TR+OSE20UtH58xhHMYie0HaJ1ywPBxAVxbFqOEH985tA7w1xoxTuonemUUCDmSPAtPHlv8pPYbSUAOQj+sbeob9O+i4zyluU4a6qUCbAEBCQ/gh4Eazxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BN6PR12MB1809.namprd12.prod.outlook.com (10.175.101.17) by
 BN6PR12MB1218.namprd12.prod.outlook.com (10.168.226.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2241.13; Wed, 11 Sep 2019 16:13:32 +0000
Received: from BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f]) by BN6PR12MB1809.namprd12.prod.outlook.com
 ([fe80::f0e0:63fb:5af:5e1f%8]) with mapi id 15.20.2241.018; Wed, 11 Sep 2019
 16:13:32 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "noralf@tronnes.org" <noralf@tronnes.org>,
 "airlied@linux.ie" <airlied@linux.ie>, "rong.a.chen@intel.com"
 <rong.a.chen@intel.com>, "feng.tang@intel.com" <feng.tang@intel.com>,
 "ying.huang@intel.com" <ying.huang@intel.com>, "sean@poorly.run"
 <sean@poorly.run>, "maxime.ripard@bootlin.com" <maxime.ripard@bootlin.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "dave@stgolabs.net" <dave@stgolabs.net>
Subject: Re: [PATCH v2 3/3] drm/mgag200: Map fbdev framebuffer while it's
 being displayed
Thread-Topic: [PATCH v2 3/3] drm/mgag200: Map fbdev framebuffer while it's
 being displayed
Thread-Index: AQHVYxfaaYvyV6VBRU2gXfgJHy+3+acmsWMw
Date: Wed, 11 Sep 2019 16:13:31 +0000
Message-ID: <BN6PR12MB18091DC5B7F11840145F6910F7B10@BN6PR12MB1809.namprd12.prod.outlook.com>
References: <20190904115644.7620-1-tzimmermann@suse.de>,
 <20190904115644.7620-4-tzimmermann@suse.de>
In-Reply-To: <20190904115644.7620-4-tzimmermann@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eb6d09b-43ee-4d73-ccd5-08d736d2fd9f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BN6PR12MB1218; 
x-ms-traffictypediagnostic: BN6PR12MB1218:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR12MB1218B78A4507CBB3C2815E45F7B10@BN6PR12MB1218.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0157DEB61B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(199004)(189003)(7416002)(14454004)(25786009)(4326008)(6246003)(19627405001)(53936002)(9686003)(54896002)(6116002)(3846002)(2201001)(86362001)(66066001)(2501003)(2906002)(71200400001)(71190400001)(6436002)(256004)(99286004)(8936002)(66446008)(8676002)(81156014)(81166006)(5660300002)(55016002)(66946007)(66556008)(64756008)(66476007)(52536014)(91956017)(76116006)(33656002)(446003)(11346002)(476003)(486006)(102836004)(53546011)(316002)(186003)(76176011)(6506007)(26005)(229853002)(478600001)(74316002)(110136005)(54906003)(7696005)(105004)(7736002)(921003)(1121003)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BN6PR12MB1218;
 H:BN6PR12MB1809.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Ip975SFurGb9ZdceNaB1lT61INxF+3soYz2CjiR22ktQwxDb/rsl6t9bCCRJ4jcnaLBrg5D2fP8p3RDVYnhDNA+mbiyBdbrPCxc/S9EVIqjg1paFlyIH7xuugLADDHR/NWr1X1ukxSohBn1FjyQ1QIpxoNuYBj2dqGLT4x3GWNLLzyrm0YN4Dq3Xpnmb8swJJ3wpWuN6CcztY44hfqecDKHj5LTDpzG39xfdFjgLPNARUClutI12AlDTU0S3izjUiSxlLhDBBOPh+R/siYn6m/lE8OahDiH0uBQrvaSWiu4OkDNpist/Y62G1pXbzzow95esK3np4EVYcIPXZo+gvGLQ2ZEgCQwV3IChm3dENRJgEyoGh2AojpFtNHHGrH6+Li9lJDMWUjSqNjUoa8kz8SCigttbRwDGVsVSHEgv89E=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb6d09b-43ee-4d73-ccd5-08d736d2fd9f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2019 16:13:31.9266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZQX7THh64883QELhP7hDGLDhwmp9+1+ItvmuZVVU9n/p5dRr/eIWADbM+r7p35CizZCCPPnKEYIyJKJRho+yAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1218
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sLH+xFp06FiD9aV6VcxRhmnRMawJetM7bIhdAtvUuW0=;
 b=EvLgIen/Jw+TTfw8qbsARucS8qxLogFLEkTpxpUXTRNnxl95cnQNvAIaFu4UPtYyxpo1Qd6znV6XzslnR0iFdRRtBI63xtz6hKIMAl3MonXLUHfpnWSpUIonMsvsy1Abfky80OcUuLJv+Oh/ktU033G+EAeN1WCpVgsgOKrT34s=
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
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 =?windows-1257?Q?Micha=F9_Miros=F9aw?= <mirq-linux@rere.qmqm.pl>,
 Armijn Hemel <armijn@tjaldur.nl>, "Huang, Ray" <Ray.Huang@amd.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sam Ravnborg <sam@ravnborg.org>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1178819226=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1178819226==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_BN6PR12MB18091DC5B7F11840145F6910F7B10BN6PR12MB1809namp_"

--_000_BN6PR12MB18091DC5B7F11840145F6910F7B10BN6PR12MB1809namp_
Content-Type: text/plain; charset="windows-1257"
Content-Transfer-Encoding: quoted-printable

Please use C style comments rather than C++.

Alex
________________________________
From: Thomas Zimmermann <tzimmermann@suse.de>
Sent: Wednesday, September 4, 2019 7:56 AM
To: daniel@ffwll.ch <daniel@ffwll.ch>; noralf@tronnes.org <noralf@tronnes.o=
rg>; airlied@linux.ie <airlied@linux.ie>; rong.a.chen@intel.com <rong.a.che=
n@intel.com>; feng.tang@intel.com <feng.tang@intel.com>; ying.huang@intel.c=
om <ying.huang@intel.com>; sean@poorly.run <sean@poorly.run>; maxime.ripard=
@bootlin.com <maxime.ripard@bootlin.com>; maarten.lankhorst@linux.intel.com=
 <maarten.lankhorst@linux.intel.com>; dave@stgolabs.net <dave@stgolabs.net>
Cc: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Thom=
as Zimmermann <tzimmermann@suse.de>; Dave Airlie <airlied@redhat.com>; Greg=
 Kroah-Hartman <gregkh@linuxfoundation.org>; Thomas Gleixner <tglx@linutron=
ix.de>; Gerd Hoffmann <kraxel@redhat.com>; Deucher, Alexander <Alexander.De=
ucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; Sam Ravnborg =
<sam@ravnborg.org>; Daniel Vetter <daniel.vetter@ffwll.ch>; Huang, Ray <Ray=
.Huang@amd.com>; Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>; Mich=
a=F9 Miros=F9aw <mirq-linux@rere.qmqm.pl>; Armijn Hemel <armijn@tjaldur.nl>
Subject: [PATCH v2 3/3] drm/mgag200: Map fbdev framebuffer while it's being=
 displayed

The generic fbdev emulation will map and unmap the framebuffer's memory
if required. As consoles are most often updated while being on screen,
we map the fbdev buffer while it's being displayed. This avoids frequent
map/unmap operations in the fbdev code. The original fbdev code in mgag200
used the same trick to improve performance.

v2:
        * fix typo in comment

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 90f479ae51af ("drm/mgag200: Replace struct mga_fbdev with generic fr=
amebuffer emulation")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Noralf Tr=B8nnes <noralf@tronnes.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: "Christian K=F6nig" <christian.koenig@amd.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: "Micha=F9 Miros=F9aw" <mirq-linux@rere.qmqm.pl>
Cc: Armijn Hemel <armijn@tjaldur.nl>
Cc: Rong Chen <rong.a.chen@intel.com>
Cc: Feng Tang <feng.tang@intel.com>
Cc: Huang Ying <ying.huang@intel.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag2=
00/mgag200_mode.c
index 5e778b5f1a10..7b95c59341f5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -860,13 +860,20 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc=
,
                                 struct drm_framebuffer *fb,
                                 int x, int y, int atomic)
 {
+       struct drm_fb_helper *fb_helper =3D crtc->dev->fb_helper;
         struct drm_gem_vram_object *gbo;
         int ret;
         s64 gpu_addr;
+       void *base;

         if (!atomic && fb) {
                 gbo =3D drm_gem_vram_of_gem(fb->obj[0]);
                 drm_gem_vram_unpin(gbo);
+
+               // Unmap fbdev FB if it's not being displayed
+               // any longer.
+               if (fb =3D=3D fb_helper->buffer->fb)
+                       drm_gem_vram_kunmap(gbo);
         }

         gbo =3D drm_gem_vram_of_gem(crtc->primary->fb->obj[0]);
@@ -882,6 +889,14 @@ static int mga_crtc_do_set_base(struct drm_crtc *crtc,

         mga_set_start_address(crtc, (u32)gpu_addr);

+       // Map fbdev FB while it's being displayed. This avoids frequent
+       // mapping and unmapping within the fbdev code.
+       if (crtc->primary->fb =3D=3D fb_helper->buffer->fb) {
+               base =3D drm_gem_vram_kmap(gbo, true, NULL);
+               if (IS_ERR(base))
+                       DRM_ERROR("failed to kmap fbcon\n");
+       }
+
         return 0;

 err_drm_gem_vram_unpin:
@@ -1403,9 +1418,14 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
         DRM_DEBUG_KMS("\n");
         mga_crtc_dpms(crtc, DRM_MODE_DPMS_OFF);
         if (crtc->primary->fb) {
+               struct drm_fb_helper *fb_helper =3D crtc->dev->fb_helper;
                 struct drm_framebuffer *fb =3D crtc->primary->fb;
                 struct drm_gem_vram_object *gbo =3D
                         drm_gem_vram_of_gem(fb->obj[0]);
+
+               // Unmap if it's the fbdev FB.
+               if (fb =3D=3D fb_helper->buffer->fb)
+                       drm_gem_vram_kunmap(gbo);
                 drm_gem_vram_unpin(gbo);
         }
         crtc->primary->fb =3D NULL;
--
2.23.0


--_000_BN6PR12MB18091DC5B7F11840145F6910F7B10BN6PR12MB1809namp_
Content-Type: text/html; charset="windows-1257"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dwindows-1=
257">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Please use C style comments rather than C&#43;&#43;.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Alex</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Thomas Zimmermann &lt=
;tzimmermann@suse.de&gt;<br>
<b>Sent:</b> Wednesday, September 4, 2019 7:56 AM<br>
<b>To:</b> daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; noralf@tronnes.org &lt;=
noralf@tronnes.org&gt;; airlied@linux.ie &lt;airlied@linux.ie&gt;; rong.a.c=
hen@intel.com &lt;rong.a.chen@intel.com&gt;; feng.tang@intel.com &lt;feng.t=
ang@intel.com&gt;; ying.huang@intel.com &lt;ying.huang@intel.com&gt;;
 sean@poorly.run &lt;sean@poorly.run&gt;; maxime.ripard@bootlin.com &lt;max=
ime.ripard@bootlin.com&gt;; maarten.lankhorst@linux.intel.com &lt;maarten.l=
ankhorst@linux.intel.com&gt;; dave@stgolabs.net &lt;dave@stgolabs.net&gt;<b=
r>
<b>Cc:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; Thomas Zimmermann &lt;tzimmermann@suse.de&gt;; Dave Airlie &lt;air=
lied@redhat.com&gt;; Greg Kroah-Hartman &lt;gregkh@linuxfoundation.org&gt;;=
 Thomas Gleixner &lt;tglx@linutronix.de&gt;; Gerd Hoffmann &lt;kraxel@redha=
t.com&gt;;
 Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &l=
t;Christian.Koenig@amd.com&gt;; Sam Ravnborg &lt;sam@ravnborg.org&gt;; Dani=
el Vetter &lt;daniel.vetter@ffwll.ch&gt;; Huang, Ray &lt;Ray.Huang@amd.com&=
gt;; Bartlomiej Zolnierkiewicz &lt;b.zolnierkie@samsung.com&gt;; Micha=F9
 Miros=F9aw &lt;mirq-linux@rere.qmqm.pl&gt;; Armijn Hemel &lt;armijn@tjaldu=
r.nl&gt;<br>
<b>Subject:</b> [PATCH v2 3/3] drm/mgag200: Map fbdev framebuffer while it'=
s being displayed</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">The generic fbdev emulation will map and unmap the=
 framebuffer's memory<br>
if required. As consoles are most often updated while being on screen,<br>
we map the fbdev buffer while it's being displayed. This avoids frequent<br=
>
map/unmap operations in the fbdev code. The original fbdev code in mgag200<=
br>
used the same trick to improve performance.<br>
<br>
v2:<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * fix typo in comment<br>
<br>
Signed-off-by: Thomas Zimmermann &lt;tzimmermann@suse.de&gt;<br>
Fixes: 90f479ae51af (&quot;drm/mgag200: Replace struct mga_fbdev with gener=
ic framebuffer emulation&quot;)<br>
Cc: Thomas Zimmermann &lt;tzimmermann@suse.de&gt;<br>
Cc: Noralf Tr=B8nnes &lt;noralf@tronnes.org&gt;<br>
Cc: Dave Airlie &lt;airlied@redhat.com&gt;<br>
Cc: Greg Kroah-Hartman &lt;gregkh@linuxfoundation.org&gt;<br>
Cc: Thomas Gleixner &lt;tglx@linutronix.de&gt;<br>
Cc: Gerd Hoffmann &lt;kraxel@redhat.com&gt;<br>
Cc: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
Cc: &quot;Christian K=F6nig&quot; &lt;christian.koenig@amd.com&gt;<br>
Cc: Sam Ravnborg &lt;sam@ravnborg.org&gt;<br>
Cc: Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;<br>
Cc: Huang Rui &lt;ray.huang@amd.com&gt;<br>
Cc: Bartlomiej Zolnierkiewicz &lt;b.zolnierkie@samsung.com&gt;<br>
Cc: &quot;Micha=F9 Miros=F9aw&quot; &lt;mirq-linux@rere.qmqm.pl&gt;<br>
Cc: Armijn Hemel &lt;armijn@tjaldur.nl&gt;<br>
Cc: Rong Chen &lt;rong.a.chen@intel.com&gt;<br>
Cc: Feng Tang &lt;feng.tang@intel.com&gt;<br>
Cc: Huang Ying &lt;ying.huang@intel.com&gt;<br>
Cc: Davidlohr Bueso &lt;dave@stgolabs.net&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/mgag200/mgag200_mode.c | 20 &#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
<br>
&nbsp;1 file changed, 20 insertions(&#43;)<br>
<br>
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag2=
00/mgag200_mode.c<br>
index 5e778b5f1a10..7b95c59341f5 100644<br>
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/mgag200/mgag200_mode.c<br>
@@ -860,13 &#43;860,20 @@ static int mga_crtc_do_set_base(struct drm_crtc *=
crtc,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int x, int y, int atomic)<br>
&nbsp;{<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_fb_helper *fb_helper =
=3D crtc-&gt;dev-&gt;fb_helper;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_vram_object=
 *gbo;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s64 gpu_addr;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; void *base;<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!atomic &amp;&amp; fb)=
 {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; gbo =3D drm_gem_vram_of_gem(fb-&gt;obj[0]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_gem_vram_unpin(gbo);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; // Unmap fbdev FB if it's not being displayed<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; // any longer.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (fb =3D=3D fb_helper-&gt;buffer-&gt;fb)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_vram=
_kunmap(gbo);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gbo =3D drm_gem_vram_of_ge=
m(crtc-&gt;primary-&gt;fb-&gt;obj[0]);<br>
@@ -882,6 &#43;889,14 @@ static int mga_crtc_do_set_base(struct drm_crtc *c=
rtc,<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mga_set_start_address(crtc=
, (u32)gpu_addr);<br>
&nbsp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // Map fbdev FB while it's being =
displayed. This avoids frequent<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; // mapping and unmapping within t=
he fbdev code.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc-&gt;primary-&gt;fb =3D=
=3D fb_helper-&gt;buffer-&gt;fb) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; base =3D drm_gem_vram_kmap(gbo, true, NULL);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (IS_ERR(base))<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ERROR(&q=
uot;failed to kmap fbcon\n&quot;);<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&#43;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&nbsp;<br>
&nbsp;err_drm_gem_vram_unpin:<br>
@@ -1403,9 &#43;1418,14 @@ static void mga_crtc_disable(struct drm_crtc *cr=
tc)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;\n&quo=
t;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mga_crtc_dpms(crtc, DRM_MO=
DE_DPMS_OFF);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc-&gt;primary-&gt;f=
b) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; struct drm_fb_helper *fb_helper =3D crtc-&gt;dev-&gt;fb_help=
er;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct drm_framebuffer *fb =3D crtc-&gt;primary-&gt;f=
b;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; struct drm_gem_vram_object *gbo =3D<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_g=
em_vram_of_gem(fb-&gt;obj[0]);<br>
&#43;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; // Unmap if it's the fbdev FB.<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; if (fb =3D=3D fb_helper-&gt;buffer-&gt;fb)<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_gem_vram=
_kunmap(gbo);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_gem_vram_unpin(gbo);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crtc-&gt;primary-&gt;fb =
=3D NULL;<br>
-- <br>
2.23.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_BN6PR12MB18091DC5B7F11840145F6910F7B10BN6PR12MB1809namp_--

--===============1178819226==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1178819226==--
