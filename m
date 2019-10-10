Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2807D27FB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 13:32:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08A56E056;
	Thu, 10 Oct 2019 11:32:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720053.outbound.protection.outlook.com [40.107.72.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8526E6E056
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 11:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JxKeH5Pk0aBridym3RrNPnUD50xHtLkkgBlL2NBHjUeHVxJR2rLFka1Y8lgjGA/6+gM5WEwRMrOWg3D2jbChhTUzzfV+FgupELe0ukMx7/3KnVE1V5rHcl1lAm0rQACRMC9h4YnvbJ2g8RguO1l2hPajomOLDcw44DFc+QK0HLaaKvFqk1AnB+2pcSCE/WKLFMRwdI/r4RyvMC6hNJMlmQRiZ5jEboah3F6FhyJVQmMK7EvBtAdhNd03PWjpUyGK2xX5SA20Liaz6tYVK0kUlkcLMgHOcvGVbPG3WqECPHawEXaFnPkwdgzKjydozUeayp2MxLlek6zpUCGaV5jTyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0hkW4lmge/HmcuFmaIPdmX6e3d0FNpFahY98MKOv2M=;
 b=kCwfoaxQVDv02BLpDyB0SD6cLinnUYf8TJ+iy+C/g1dQLzjE0E/32Wam27sTemLsZ+0AqmaDyfHg1T77n/uSoL2yXoj7UTNLV0clrHr9V+16PXvlRGtqJwIW/ZrueltFSo4EXVGnBQPUrTGMoMuvPoXu6LPECU3BrfhBFAS7m41bb08DxbAN/o3ODN0OxAhN2VCJ0kahhiNEVarEydYrQpIBuOWkW902mP1edav99ZUtKMWEAWTaMpPR7lRKStWTae0Krz7OA3GQN8pTPRvyFZSDCn6iZGsfIC6GsHfGHryZ2Akm5+726M24zKyadpF1p93HUIfdI2RPxZ2CSNKjOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3296.namprd12.prod.outlook.com (20.179.80.139) by
 MN2PR12MB4015.namprd12.prod.outlook.com (10.255.239.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.17; Thu, 10 Oct 2019 11:32:23 +0000
Received: from MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9]) by MN2PR12MB3296.namprd12.prod.outlook.com
 ([fe80::9d04:5f9f:eab5:dcd9%6]) with mapi id 15.20.2347.016; Thu, 10 Oct 2019
 11:32:23 +0000
From: "Wang, Kevin(Yang)" <Kevin1.Wang@amd.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Subject: Re: [PATCH] drm/ttm: fix handling in ttm_bo_add_mem_to_lru
Thread-Topic: [PATCH] drm/ttm: fix handling in ttm_bo_add_mem_to_lru
Thread-Index: AQHVf12eioDpNUNZRU6IVh8CkcZkdadTvabB
Date: Thu, 10 Oct 2019 11:32:23 +0000
Message-ID: <MN2PR12MB3296BF17BDC16C0EA5CEB6C9A2940@MN2PR12MB3296.namprd12.prod.outlook.com>
References: <20191010112649.12015-1-christian.koenig@amd.com>
In-Reply-To: <20191010112649.12015-1-christian.koenig@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af653db6-409a-4aad-e3a2-08d74d7584f8
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: MN2PR12MB4015:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB401558A8899BC43BB7D2B55FA2940@MN2PR12MB4015.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-forefront-prvs: 018632C080
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(396003)(136003)(376002)(346002)(366004)(189003)(199004)(64756008)(6246003)(66446008)(25786009)(14454004)(7696005)(33656002)(66066001)(76176011)(6506007)(53546011)(99286004)(81156014)(71190400001)(8676002)(81166006)(256004)(91956017)(8936002)(76116006)(66476007)(66556008)(71200400001)(66946007)(478600001)(74316002)(2501003)(3846002)(26005)(186003)(6116002)(476003)(486006)(52536014)(11346002)(6636002)(54896002)(55016002)(105004)(9686003)(19627405001)(102836004)(446003)(86362001)(6436002)(2906002)(7736002)(110136005)(316002)(229853002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4015;
 H:MN2PR12MB3296.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OXs9X2c6YJzhvPTnmTTfIXQVGDnBHJqXF8o7QVAkhEmgo19PLjoonF+Dyf2Y0IP/25aKG8XwUimHvLuFMyi4YqPcZRIuTSJQQzH+xAQW+XdaEwe2RA1JI9LlGOsetEd17mXzGGCEO+RImm8hTpw7Llj48unYjKXmS4RbGmiRWwj9bxAxCRIff5axTACtf58P+JbO40G3I30/cakVDivRkfWvM6YaXtEm3bi/yxbwoFGtUPx8Mk+qiMQsiOGyiejLRwsig1Qulu/Fj4mUOKMiFabaYEFI9S9hN6pDEg4NzYti7sgkVLtFVJwfGPQ4EqsNJi2tB2ZL270ayh1NKIhWVcASZ6fwYmNqi9Klv6BxUUBiN9j4w/HMxpwQUEqqYT2BDfvLCkYICegzuJ9hm5iK5yC6rezgtpHUpNT7tB/x7Gk=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af653db6-409a-4aad-e3a2-08d74d7584f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Oct 2019 11:32:23.3150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eB/5aKPMVD6WfTvfOTaSRqMIr8BSh56XhyYrEbj6WY6Z8LwgQg2QMpi52a7ULqpI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4015
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E0hkW4lmge/HmcuFmaIPdmX6e3d0FNpFahY98MKOv2M=;
 b=V5DTXXO5OSLmOpKGH8JHVsZfLombOpOSVXgFDq9cBIUyDHY06dYWUC+sF9jd0CifHVwXrWPoTIGSSsnU3ZxoN0nfCCsC88ovnemHxHB19z4HL+zH2tQ2nB0pixtojrLGU1KBtp32ljjM5jmOwqSD/fTIFzRw9UV8/RDq0QV7cJs=
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
Content-Type: multipart/mixed; boundary="===============1441171991=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1441171991==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB3296BF17BDC16C0EA5CEB6C9A2940MN2PR12MB3296namp_"

--_000_MN2PR12MB3296BF17BDC16C0EA5CEB6C9A2940MN2PR12MB3296namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Kevin Wang <kevin1.wang@amd.com>

Best Regards,
Kevin
________________________________
From: Christian K=F6nig <ckoenig.leichtzumerken@gmail.com>
Sent: Thursday, October 10, 2019 7:26 PM
To: dri-devel@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Wang=
, Kevin(Yang) <Kevin1.Wang@amd.com>; Zhang, Hawking <Hawking.Zhang@amd.com>
Subject: [PATCH] drm/ttm: fix handling in ttm_bo_add_mem_to_lru

We should not add the BO to the swap LRU when the new mem is fixed and
the TTM object about to be destroyed.

Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 6394e0c5cc02..c51bb2c9ed4f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -185,8 +185,9 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer_obj=
ect *bo,
         list_add_tail(&bo->lru, &man->lru[bo->priority]);
         kref_get(&bo->list_kref);

-       if (bo->ttm && !(bo->ttm->page_flags &
-                        (TTM_PAGE_FLAG_SG | TTM_PAGE_FLAG_SWAPPED))) {
+       if (!(man->flags & TTM_MEMTYPE_FLAG_FIXED) && bo->ttm &&
+           !(bo->ttm->page_flags & (TTM_PAGE_FLAG_SG |
+                                    TTM_PAGE_FLAG_SWAPPED))) {
                 list_add_tail(&bo->swap, &bdev->glob->swap_lru[bo->priorit=
y]);
                 kref_get(&bo->list_kref);
         }
--
2.14.1


--_000_MN2PR12MB3296BF17BDC16C0EA5CEB6C9A2940MN2PR12MB3296namp_
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
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Reviewed-by: Kevin Wang &lt;kevin1.wang@amd.com&gt;</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
<br>
</div>
<div style=3D"margin: 0px; font-size: 12pt; font-family: Calibri, Arial, He=
lvetica, sans-serif">
Best Regards,<br>
Kevin</div>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" co=
lor=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Christian K=F6nig &lt=
;ckoenig.leichtzumerken@gmail.com&gt;<br>
<b>Sent:</b> Thursday, October 10, 2019 7:26 PM<br>
<b>To:</b> dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.=
org&gt;; Wang, Kevin(Yang) &lt;Kevin1.Wang@amd.com&gt;; Zhang, Hawking &lt;=
Hawking.Zhang@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/ttm: fix handling in ttm_bo_add_mem_to_lru</fon=
t>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">We should not add the BO to the swap LRU when the =
new mem is fixed and<br>
the TTM object about to be destroyed.<br>
<br>
Signed-off-by: Christian K=F6nig &lt;christian.koenig@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/ttm/ttm_bo.c | 5 &#43;&#43;&#43;--<br>
&nbsp;1 file changed, 3 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c<br=
>
index 6394e0c5cc02..c51bb2c9ed4f 100644<br>
--- a/drivers/gpu/drm/ttm/ttm_bo.c<br>
&#43;&#43;&#43; b/drivers/gpu/drm/ttm/ttm_bo.c<br>
@@ -185,8 &#43;185,9 @@ static void ttm_bo_add_mem_to_lru(struct ttm_buffer=
_object *bo,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add_tail(&amp;bo-&gt;=
lru, &amp;man-&gt;lru[bo-&gt;priority]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kref_get(&amp;bo-&gt;list_=
kref);<br>
&nbsp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bo-&gt;ttm &amp;&amp; !(bo-&gt;tt=
m-&gt;page_flags &amp;<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (TTM_PAGE_=
FLAG_SG | TTM_PAGE_FLAG_SWAPPED))) {<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!(man-&gt;flags &amp; TTM_MEM=
TYPE_FLAG_FIXED) &amp;&amp; bo-&gt;ttm &amp;&amp;<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !(bo-&gt;=
ttm-&gt;page_flags &amp; (TTM_PAGE_FLAG_SG |<br>
&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TTM_PAGE_=
FLAG_SWAPPED))) {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; list_add_tail(&amp;bo-&gt;swap, &amp;bdev-&gt;glob-&g=
t;swap_lru[bo-&gt;priority]);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; kref_get(&amp;bo-&gt;list_kref);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
-- <br>
2.14.1<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN2PR12MB3296BF17BDC16C0EA5CEB6C9A2940MN2PR12MB3296namp_--

--===============1441171991==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1441171991==--
