Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B35F244E97
	for <lists+dri-devel@lfdr.de>; Fri, 14 Aug 2020 20:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA22E6EBF6;
	Fri, 14 Aug 2020 18:53:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2067.outbound.protection.outlook.com [40.107.212.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76FB6E303;
 Fri, 14 Aug 2020 18:53:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed5yGCAaU0rbg0uBd3yC0Sat5aOnWq/GTr1xosW+N5HALXIDHAmw9qITVvFyx8WuvWOtwsg6ijSDvk7fR3AvifK+51vjPbXOwCGbnkQ5AGYUlGKiaqdRzs+iuddamz1LLRrM1lD661iVORCtVd4b3OBHZQKGqKu/p9Nb/aOLe99KhQkIQtBkcGFI8VpvJSk4iUecFJNV/9MGqVZ09OpnrAXLuFnaPAJY4TS7/eILyJ6UlhzCHGlVJEPdJS5KM6vGoXGevPI5bcJcKR2Vzjvw5ON5Qgylmfs91rODc871Qk6M5wFlWumO8oC6uCFrXNisq4GiBP0sbvd7vfLBO4ZsqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLNpvKKGOdDfyiJCn+hXzlvC0Bfj2uTBm1n3yhe4GtY=;
 b=N4AckO7/VKVi66MQaF6DU/9LJoLLMDLSAqBj6viNFtlNyDHouwceyyebeqs7Qh+5DDImHIfdzFaipSOBvSI2Xd2ome2XHMwej7eu5cff9h22k2vj8XrR1QZWp0qRwsh9k55Y0yg4lqu1fW2mMZi+2ERraaG7p8rIh2Avcpzk6gZLEBuNw7Hoa9B3flTwP4N4f1Jq82mGNX1nAqXkTvo+vUPo81XgRrvScrkwcZ6Gj6b87CwFFOR4NFJNc8cZfTPMEvhlvjRZaS24b+vNH4nXO1NWgskg0PBuMMX4ygsQaZGnY/g0ivdpY3LW+qQ6tjVdoGawnt8w+evzDwW5yDtmJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oLNpvKKGOdDfyiJCn+hXzlvC0Bfj2uTBm1n3yhe4GtY=;
 b=Key0Lcl0LKL+9z9SpoiTU+/GzcU+T/CIjjp6eQO0ENIk9Zjgd0EDL2rRmvY2BvL4SI+vdeXWRlxLDY+7Wzb4E80O4ktGS1Y8GjBJcjXPJIEJr5AzHul3PAoG+TFOi94Aa3y9H3ARM2QJn2/Zlb3oyYQpKiBPJGrod5WCdcBHlXo=
Received: from MW3PR12MB4554.namprd12.prod.outlook.com (2603:10b6:303:55::21)
 by MWHPR1201MB0064.namprd12.prod.outlook.com (2603:10b6:301:58::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Fri, 14 Aug
 2020 18:52:55 +0000
Received: from MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::8468:a7f8:d931:ccac]) by MW3PR12MB4554.namprd12.prod.outlook.com
 ([fe80::8468:a7f8:d931:ccac%5]) with mapi id 15.20.3283.022; Fri, 14 Aug 2020
 18:52:54 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Lipski, Mikita"
 <Mikita.Lipski@amd.com>, "Kazlauskas, Nicholas"
 <Nicholas.Kazlauskas@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
Subject: Re: [PATCH] drm/dp_mst: Don't return error code when crtc is null
Thread-Topic: [PATCH] drm/dp_mst: Don't return error code when crtc is null
Thread-Index: AQHWclybDoXzoVuz9kKvcJQdF8P9L6k33fUAgAAQvXc=
Date: Fri, 14 Aug 2020 18:52:54 +0000
Message-ID: <MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400@MW3PR12MB4554.namprd12.prod.outlook.com>
References: <20200814170140.24917-1-Bhawanpreet.Lakha@amd.com>,
 <97348c62b6024e0aa8f8d537e3ec50b4@intel.com>
In-Reply-To: <97348c62b6024e0aa8f8d537e3ec50b4@intel.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-08-14T18:52:54.050Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.84.11]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b36e69f7-31b5-4c41-9876-08d840834112
x-ms-traffictypediagnostic: MWHPR1201MB0064:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR1201MB00643583CB83B4F96278A3FDF9400@MWHPR1201MB0064.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NUVnjNKgl8byKIbOzZk72jkGbhQUeRFDKXHa4f/hUBW1LynDnTtsbjiOvI1HU+loVKVoMlfWK09bIyeq1kNJcVBzLimD+OEr/HCxCrw5yfbqS50RR2RdcDwkn825YWS0myGdOiUn9iqiSQirMHL8B4wybNnQpvrWBTzgvfPqSWyqxtVZEuzpBIItopMrNi+Morw6gvCFShm475GZJyvyyBQW1o5KibkkFNPS3u2ypauNgDUfOWCdsUycUuZcc0jctXKzuc2bjZ1/4FQYar3Ap+rP17eL2tZkDm7oXtWdYuY6qaXG0KUhHCKTN6XFDLrQdUQt1BUOnMCj7kkIALqXFzgrMZTYP5vXinI3sQ0usgc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR12MB4554.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(4326008)(26005)(478600001)(6506007)(86362001)(33656002)(186003)(83380400001)(7696005)(45080400002)(66946007)(66556008)(66476007)(76116006)(66446008)(110136005)(316002)(6636002)(54906003)(55016002)(64756008)(52536014)(5660300002)(9686003)(8936002)(71200400001)(19627405001)(8676002)(91956017)(2906002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 4RYY/5jF8atLpbIWvWCKQsy7bIey7/W4rzMHYsdzKtQHaXr4PB767cx6dDnOP4JYdxfzwLUdncJV9bQ0cBQ/xs6qbaxgyo/JChXde2NZ8mLtmiTf3/71LjrCV1CClI6nxcYwZukpsOuLeJAGcAZexpVVO7SItC6XmfEZzk1bexPesGbd76h82V65DU0W2bXpghwKyHmZlHapmnrTdw7KusybVBSeZ7Ah5BpEdIOOygSihaktLp2vSEkP9bxWzkyqd94phWg0lvpIKtKpzBqYAV5dJaVNMmLX+Scqxevc5OLK3Ig+CLr7Abc8ilG4FBVKHsrMXXH7kjOOcAxbAFuM2oN/j6R7poPY789IO3rO/lpcDS1UqC3TBBjmAPVU3EVqjrPs0b6a8W7yalmLyxG+qdFCMXeXZtkCmZGyDjKe855iBlgO/3sJAZFyGGPLev16USC0YQ94Mi2xfkWaDIvOv9cQc21ZPsXU/Nhbi0AKmCVRpKLYfnxbn70jmoQ26T7jqESA+OUWf/H8LO3Ky0tZH7teGteeCK9ZFoVi50hze1bMWYD8UZ0efzZ/Jh8a8wxFYRuPFJWwbYZHehPUPT9KH3GsZqE96eqK+3ZMUvlQI9UM3mQyW19M7jyIlFxywbwKiSBXS9mBf8j4GDDPgXR5nw==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4554.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b36e69f7-31b5-4c41-9876-08d840834112
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2020 18:52:54.7047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i47aayTIDg+Q9vUlr10TpWHivCSP7gyi4xpPKsiifDJOyuf9+14oBI8b0maSqvVu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0064
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0648426088=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0648426088==
Content-Language: en-CA
Content-Type: multipart/alternative;
	boundary="_000_MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400MW3PR12MB4554namp_"

--_000_MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400MW3PR12MB4554namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]


pos->port->connector?
This is checking the crtc not the connector. The crtc can be null if its di=
sabled.

Since it is happening after a unplug->hotplug, I guess we are missing somet=
hing in the disable sequence and the old connector is still in the list.

Bhawan

>>-----Original Message-----
>>From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of
>>Bhawanpreet Lakha
>>Sent: Friday, August 14, 2020 1:02 PM
>>To: mikita.lipski@amd.com; nicholas.kazlauskas@amd.com;
>>alexander.deucher@amd.com
>>Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>; dri-
>>devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
>>Subject: [PATCH] drm/dp_mst: Don't return error code when crtc is null
>>
>>[Why]
>>In certain cases the crtc can be NULL and returning -EINVAL causes
>>atomic check to fail when it shouln't. This leads to valid
>>configurations failing because atomic check fails.
>
>So is this a bug fix or an exception case, or an expected possibility?
>
>From my reading of the function comments, it is not clear that pos->port->=
connector
>might be NULL for some reason.

>A better explanation of why this would occur would make this a much more
>useful commit message.
>

>My reading is that you ran into this issue an are masking it with this fix=
.
>
>Rather than this is a real possibility and this is the correct fix.
>
>Mike
>
>>[How]
>>Don't early return if crtc is null
>>
>>Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
>>---
>> drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c
>>b/drivers/gpu/drm/drm_dp_mst_topology.c
>>index 70c4b7afed12..bc90a1485699 100644
>>--- a/drivers/gpu/drm/drm_dp_mst_topology.c
>>+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
>>@@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct
>>drm_atomic_state *state, struct drm
>>
>>                crtc =3D conn_state->crtc;
>>
>>-              if (WARN_ON(!crtc))
>>-                      return -EINVAL;
>>+              if (!crtc)
>>+                      continue;
>>
>>                if (!drm_dp_mst_dsc_aux_for_port(pos->port))
>>                        continue;
>>--
>>2.17.1
>>
>>_______________________________________________
>>dri-devel mailing list
>>dri-devel@lists.freedesktop.org
>>https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D02%7C01%7CBhaw=
anpreet.Lakha%40amd.com%7C0f5d55c551644fef3df908d840787b3e%7C3dd8961fe4884e=
608e11a82d994e183d%7C0%7C0%7C637330233520819407&amp;sdata=3D5N%2BBb0Qp3bd5z=
ANfxovb%2BrVLAGnbP1sjyw3EeCHXj2w%3D&amp;reserved=3D0

--_000_MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400MW3PR12MB4554namp_
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
<div></div>
<div><br>
</div>
<div>pos-&gt;port-&gt;connector?</div>
<div>This is checking the crtc not the connector. The crtc can be null if i=
ts disabled.<br>
</div>
<div><br>
</div>
<div>
<div></div>
<div>Since it is happening after a unplug-&gt;hotplug, I guess we are missi=
ng something in the disable sequence and the old connector is still in the =
list.<br>
</div>
</div>
<div><br>
</div>
<div>Bhawan</div>
<div><br>
</div>
<div>&gt;&gt;-----Original Message-----<br>
</div>
<div>&gt;&gt;From: dri-devel &lt;dri-devel-bounces@lists.freedesktop.org&gt=
; On Behalf Of</div>
<div>&gt;&gt;Bhawanpreet Lakha</div>
<div>&gt;&gt;Sent: Friday, August 14, 2020 1:02 PM</div>
<div>&gt;&gt;To: mikita.lipski@amd.com; nicholas.kazlauskas@amd.com;</div>
<div>&gt;&gt;alexander.deucher@amd.com</div>
<div>&gt;&gt;Cc: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com&gt;; dri-<=
/div>
<div>&gt;&gt;devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org</di=
v>
<div>&gt;&gt;Subject: [PATCH] drm/dp_mst: Don't return error code when crtc=
 is null</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;[Why]</div>
<div>&gt;&gt;In certain cases the crtc can be NULL and returning -EINVAL ca=
uses</div>
<div>&gt;&gt;atomic check to fail when it shouln't. This leads to valid</di=
v>
<div>&gt;&gt;configurations failing because atomic check fails.</div>
<div>&gt;</div>
<div>&gt;So is this a bug fix or an exception case, or an expected possibil=
ity?</div>
<div>&gt;</div>
<div>&gt;From my reading of the function comments, it is not clear that pos=
-&gt;port-&gt;connector</div>
<div>&gt;might be NULL for some reason.</div>
<br>
<div>&gt;A better explanation of why this would occur would make this a muc=
h more</div>
<div>&gt;useful commit message.</div>
<div>&gt;</div>
<div><br>
</div>
<div>&gt;My reading is that you ran into this issue an are masking it with =
this fix.</div>
<div>&gt;</div>
<div>&gt;Rather than this is a real possibility and this is the correct fix=
.</div>
<div>&gt;</div>
<div>&gt;Mike</div>
<div>&gt;</div>
<div>&gt;&gt;[How]</div>
<div>&gt;&gt;Don't early return if crtc is null</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;Signed-off-by: Bhawanpreet Lakha &lt;Bhawanpreet.Lakha@amd.com=
&gt;</div>
<div>&gt;&gt;---</div>
<div>&gt;&gt; drivers/gpu/drm/drm_dp_mst_topology.c | 4 ++--</div>
<div>&gt;&gt; 1 file changed, 2 insertions(+), 2 deletions(-)</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;b/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;index 70c4b7afed12..bc90a1485699 100644</div>
<div>&gt;&gt;--- a/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;+++ b/drivers/gpu/drm/drm_dp_mst_topology.c</div>
<div>&gt;&gt;@@ -5037,8 +5037,8 @@ int drm_dp_mst_add_affected_dsc_crtcs(st=
ruct</div>
<div>&gt;&gt;drm_atomic_state *state, struct drm</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;crtc =
=3D conn_state-&gt;crtc;</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (WARN_ON(=
!crtc))</div>
<div>&gt;&gt;- &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;return -EINVAL;</div>
<div>&gt;&gt;+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!crtc)</=
div>
<div>&gt;&gt;+ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;continue;</div>
<div>&gt;&gt;</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if (!d=
rm_dp_mst_dsc_aux_for_port(pos-&gt;port))</div>
<div>&gt;&gt; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp;continue;</div>
<div>&gt;&gt;--</div>
<div>&gt;&gt;2.17.1</div>
<div>&gt;&gt;</div>
<div>&gt;&gt;_______________________________________________</div>
<div>&gt;&gt;dri-devel mailing list</div>
<div>&gt;&gt;dri-devel@lists.freedesktop.org</div>
<div>&gt;&gt;https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A=
%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;amp;data=
=3D02%7C01%7CBhawanpreet.Lakha%40amd.com%7C0f5d55c551644fef3df908d840787b3e=
%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637330233520819407&amp;amp;sd=
ata=3D5N%2BBb0Qp3bd5zANfxovb%2BrVLAGnbP1sjyw3EeCHXj2w%3D&amp;amp;reserved=
=3D0&nbsp;
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp;&nbsp; <br>
</div>
</div>
</body>
</html>

--_000_MW3PR12MB4554A2B48BAB3A196CE9FFB6F9400MW3PR12MB4554namp_--

--===============0648426088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0648426088==--
