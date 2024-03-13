Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBFE87B231
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:46:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3A310F2BB;
	Wed, 13 Mar 2024 19:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K2ljd0fL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CB310F0DD;
 Wed, 13 Mar 2024 19:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNaicLSa2etl5zOUZ3Tr/wtzYglX08bLbaSOkFAmD+kzH6prlqt7YIbsw8iW3SDFC9hcnq4gdQewgd8ke3pLVuh8q/jJ8ZAyyb1j/56duHYvLlU5sCEUeqvbkNq1lxkjBGaVijHqqoM3Ya6/in1/xsYfSdfRnV/FUtOwDpxUCg5pYxreoEmkeEtBZDHYlpeOk/DRyPNJg2gTyvBxtwzSgU7ojcWMWytcLzJRKgGLpb21PIejdYKFglykzSsudZMWKoZ2LIKBz6tE0WcMiRAkBMoGLm2QVUO3o9adYlOcAR9P8YMdlgYT/ndABWcWGNb9EzOVv98EhzbCQGvHLQR4Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaSvpFfVRYH9XDKLqZ/TNZjQ+zTX3aIfbM0m3AGbsQQ=;
 b=XMyQo/K2RULMDo4MBjBWX69vQbmwdL1ajgyvBzRIiKFKO0aUFMqatw9QOATnzgIhb2Nb1qdEjeiEl3fFpDsCf2F+r1YrgTjrv07zg4Mrf8mkHvIOemQVYuDr5SUaBCl0arQomPj/Pv2bkXlzm3BTlkimXORsJu0RY0vn/2YaryRZ9Hs+DrNFvcD1LgvnF3xyH8D/arRZ8vf/ON/egVsTkMmnHyNOKcJP/jsGe0KkAI7MN44UKDwCEJmAE78GV7PkJ0P00HUYunkEVhYayDDXCL/sPcveq951tZvc/yrF4gqi3mELsLvhd8JjcSY3LiCujPx+xjnC+s3qi6iYPdARUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YaSvpFfVRYH9XDKLqZ/TNZjQ+zTX3aIfbM0m3AGbsQQ=;
 b=K2ljd0fLymA/WprE3AGJQTEGtDMwm6FJEcbkWC+DZU7b0AeTkkFkja4qQjP3MA0mfqs6WbF1g/Ps5XWdKvqzc189U6k0hDMu8lVopapBfxWqNhhMOtr7SU062heUB3wd4+k8b4qnfRFbaJRYhUFeRMaf8cnCCWWUzN8oUSy8z0M=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:46:00 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:45:59 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
Thread-Topic: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
Thread-Index: AQHadHqsH/vlkBXhR0GBq9Gh47YnILE2FQz9
Date: Wed, 13 Mar 2024 19:45:59 +0000
Message-ID: <PH7PR12MB559657926C6D78F4881F1CBB932A2@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240312124148.257067-1-sunil.khatri@amd.com>
In-Reply-To: <20240312124148.257067-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-13T19:45:29.4929228Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|LV2PR12MB5869:EE_
x-ms-office365-filtering-correlation-id: 9442ed13-c9b5-4cb6-4249-08dc43963555
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fNFk06nQvet8c79UQRgnCQ1u+vIKVq9ZA377yV2/QUpBkeaMLDcno4iTvcFNyP9intEL0LDAvTwT5/OPeBG7C0M6zsZ27HJ2inqYJ7735AmVs6ZyGlFATZmDAOxSAM0fmhBsinUs/VDPdmgtYADcz0NtAI9EVglh0oFziTWG/olPi5BVgWB0UQim9XNwetU4cx5ZqfJVSb9EwvboFRoqFpA5iFHdbtAkpjcigfPiQ51hXeiQE07NrUrEZl4MYZu6N0hsLaflHz7+3ZrSk0kteeHU+61N/8709tnSaIzTBRe1enDBJt4ObZgEKr8Cqjqtj4vmoZaRA/Uubmgd2s/hS+kPyQlgac3cEUUn1Yl1759v2E4d3kZn144ZScV4V8UYnMufgNHGw/Jk6wdvt5EXiuWGHkRnHVTT2nlQGapjBeECQ29ZXWzBgw1wYzsM5Dnzb+1Ak6cjUJmscFL3t7mJklaYRQ6Pf2tkVGhmW0VRY2C1eAlfYLauluYPFdAoxbkYd29Gnml71ZbijS1gwYQtxEfbG6qXRPRM7vyMgT7JYLVBuvpj4ttsUvHv2AvA4Ev1ZcPI5JTxqRoDrOy0wf4D7874yBa+BAdDXYrF+ochnE1NP++5fdKv8BuTEbGpIlvcK7vo8GvjzkYstoKv3z/+t7X4c8sfWJUGROLihcBot3A=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bjo76fQTfJ33rDVUt8WZssd6ogGkKyZw3JNchf7go5LI+4kd7akRpYW5VHY1?=
 =?us-ascii?Q?IDeCwf6dcTRdOMeWcWm4sye4WEG0BNRj8gt373XK2MU6QhzInhFHje0SXPs5?=
 =?us-ascii?Q?UyE9/IkzWO2Xy2SEWDo3V8BjkoHat+PRhJciceHDtusRFcg2xwQawUEeSGC5?=
 =?us-ascii?Q?gH5e37QtZFt0SA75IpZl2oFk//XBOgB7g5jjCc00+BhG9NvQscKMP/MUyCn+?=
 =?us-ascii?Q?tPYqr7ytBbilWZmr4dH77EkFeLhSHutVHwrvoGNbO7sJP+VLvGAJRramoJTT?=
 =?us-ascii?Q?gDXQZ5MJ+ReNuzcLR34XConqzKQRuGlIi4+GGNlvhdCc04MIQWbJ+giLS84b?=
 =?us-ascii?Q?38kMlN/KbVAHjsl/MN750tnHJSALtt6g3BuFreTG+moNBG93HcrT03+srAe/?=
 =?us-ascii?Q?ZFqzzD4fIyGWqhBsyTB+YowY89sfARwmIuNMYbBTAgOhBfmyr35Vx1ht/sqM?=
 =?us-ascii?Q?AMzju/H0UGLDPuKHZKeeBSwpTbzrLhz0eKj9YZ9v4U1gOhh7Gwc3GE0G2fLD?=
 =?us-ascii?Q?/1BDVGXlS6IiOlknuea0T+0X8T1gZbio2SWTwoEQZQfGXzhJZRpXQ/hznUe9?=
 =?us-ascii?Q?qU7oK4OPhdSHj8pBWKok5MYP7YBJPrXgFaP56px5LNMTcHBs7NuNQ/d07qOH?=
 =?us-ascii?Q?6nlqm9VYjXnJl9hC/JBZc7hbtEQHCHZEM+n1XYya9NKX3pVrlrL/zlBwL+qx?=
 =?us-ascii?Q?fzEVfsE5AQQQaOUqDiQ2vAWFOoLc7yNEGaaqVdvnDJAAcU7PGBrcSsbmSqux?=
 =?us-ascii?Q?cFpdw05eyMJKuE9ZoaCbhMT8uk46RbWjjG8d8b9V2+Fjgqk2rIPaop6AYX/q?=
 =?us-ascii?Q?Lb00d9gx+HzLxRfQ7Q9V4c31LYn38g6zepCuO2yJv3L/qJVqKYdn4oRnLUnE?=
 =?us-ascii?Q?Se+vVR7HDxDgSNY1wNZYj6XN7AuRRBfmUnDujX9H6rcVgu7uiojbrMWhyrcu?=
 =?us-ascii?Q?5F+IT/nwLkjmnmrQARoXyGMYj1JJhKsevs6zB1tVCfvE8qi0H8KgUhW2gFpC?=
 =?us-ascii?Q?28dJEvuUocf5i8f/YS4NZvu53SUCJKfVM6kLlobe/hD/5giVckqx/LzuCisd?=
 =?us-ascii?Q?iwHojlZT2Exz60ByGzSjDwrmcDuXQoNvLmgJqI9RdJ5j5CT0nJiZf+JJaIiQ?=
 =?us-ascii?Q?GtM5tcJeSaH4zQgZW+TFghUvs9CaqWQ+7bErKflHh0Tnb8Rn6s18qr/aIYYX?=
 =?us-ascii?Q?jZ1X0n4PWp/LF/JQER2soPnV6oNA33qVKHXGI2BUmQYC3bFttKGvgBrn/j+4?=
 =?us-ascii?Q?9bE8O/BAci5RLn6cIN4hr1Z2uKyk2nEZN5nJ4pQgaiOVnt7AbvxZCssOcneX?=
 =?us-ascii?Q?6uWD76b40fIiDsc9qbBBExRKww2ui0T/vAAtQ7q3xfzNLjCRMjSH+t0WO261?=
 =?us-ascii?Q?3MqpV/RnE7x3pj1mex139nBYy5r7paNUUcnZW5oKOXutR8HMZSpgrsZeINIG?=
 =?us-ascii?Q?gBg1TpYTc/8Ytek7SPhTkWZMQOaxCzjtq/1Hn38yOp6mNO6g1yldLt22Zu4z?=
 =?us-ascii?Q?JvNCPc/tCTxBSYMVEMrlY2Kj4MR1uSaJytiwQ7rwPR3LN6YkmerdPb+WeeOQ?=
 =?us-ascii?Q?lf8KeYZZOrpvd50MWrTBYfYNgYZCPbROcjiUuMX5?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB559657926C6D78F4881F1CBB932A2PH7PR12MB5596namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9442ed13-c9b5-4cb6-4249-08dc43963555
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 19:45:59.8388 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: h7vkgeWTLGh+BsgyekdQaQzoTrcfj9a9TJFkceqbNK3SLpl0R7UqSxDhizlbZU4LZxtTvoOC+C90gkVSuMT2Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5869
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_PH7PR12MB559657926C6D78F4881F1CBB932A2PH7PR12MB5596namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Gentle Reminder for review.

Regards,
Sunil

Get Outlook for Android<https://aka.ms/AAb9ysg>
________________________________
From: Sunil Khatri <sunil.khatri@amd.com>
Sent: Tuesday, March 12, 2024 6:11:47 PM
To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian <Chri=
stian.Koenig@amd.com>; Sharma, Shashank <Shashank.Sharma@amd.com>
Cc: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; linux-kernel@vge=
r.kernel.org <linux-kernel@vger.kernel.org>; Khatri, Sunil <Sunil.Khatri@am=
d.com>
Subject: [PATCH 1/2] drm/amdgpu: add the IP information of the soc

Add all the IP's information on a SOC to the
devcoredump.

Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c
index a0dbccad2f53..611fdb90a1fc 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
@@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,
                            coredump->reset_task_info.process_name,
                            coredump->reset_task_info.pid);

+       /* GPU IP's information of the SOC */
+       if (coredump->adev) {
+               drm_printf(&p, "\nIP Information\n");
+               drm_printf(&p, "SOC Family: %d\n", coredump->adev->family);
+               drm_printf(&p, "SOC Revision id: %d\n", coredump->adev->rev=
_id);
+
+               for (int i =3D 0; i < coredump->adev->num_ip_blocks; i++) {
+                       struct amdgpu_ip_block *ip =3D
+                               &coredump->adev->ip_blocks[i];
+                       drm_printf(&p, "IP type: %d IP name: %s\n",
+                                  ip->version->type,
+                                  ip->version->funcs->name);
+                       drm_printf(&p, "IP version: (%d,%d,%d)\n\n",
+                                  ip->version->major,
+                                  ip->version->minor,
+                                  ip->version->rev);
+               }
+       }
+
         if (coredump->ring) {
                 drm_printf(&p, "\nRing timed out details\n");
                 drm_printf(&p, "IP Type: %d Ring Name: %s\n",
--
2.34.1


--_000_PH7PR12MB559657926C6D78F4881F1CBB932A2PH7PR12MB5596namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - General]<br>
</p>
<br>
<div>
<div dir=3D"auto">Gentle Reminder for review.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards<span>,<br>
Sunil</span></div>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">Get <a href=3D"https:/=
/aka.ms/AAb9ysg">
Outlook for Android</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Sunil Khatri &lt;suni=
l.khatri@amd.com&gt;<br>
<b>Sent:</b> Tuesday, March 12, 2024 6:11:47 PM<br>
<b>To:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Ch=
ristian &lt;Christian.Koenig@amd.com&gt;; Sharma, Shashank &lt;Shashank.Sha=
rma@amd.com&gt;<br>
<b>Cc:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;; Khatr=
i, Sunil &lt;Sunil.Khatri@amd.com&gt;<br>
<b>Subject:</b> [PATCH 1/2] drm/amdgpu: add the IP information of the soc</=
font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Add all the IP's information on a SOC to the<br>
devcoredump.<br>
<br>
Signed-off-by: Sunil Khatri &lt;sunil.khatri@amd.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c | 19 +++++++++++++++++++<br=
>
&nbsp;1 file changed, 19 insertions(+)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_reset.c<br>
index a0dbccad2f53..611fdb90a1fc 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c<br>
@@ -196,6 +196,25 @@ amdgpu_devcoredump_read(char *buffer, loff_t offset, s=
ize_t count,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; coredump-&gt;reset_task_info.process_name,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; coredump-&gt;reset_task_info.pid);<br>
&nbsp;<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* GPU IP's information of the SOC */=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (coredump-&gt;adev) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(&amp;p, &quot;\nIP Information\n&quot;);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(&amp;p, &quot;SOC Family: %d\n&quot;, coredump-&gt;ad=
ev-&gt;family);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_printf(&amp;p, &quot;SOC Revision id: %d\n&quot;, coredump-&=
gt;adev-&gt;rev_id);<br>
+<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; for (int i =3D 0; i &lt; coredump-&gt;adev-&gt;num_ip_blocks; i+=
+) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_ip=
_block *ip =3D<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;coredump-&gt;adev-&gt;ip_blocks[i];<br=
>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;=
p, &quot;IP type: %d IP name: %s\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip-&gt;version-&gt;type,<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip-&gt;version-&gt;funcs-=
&gt;name);<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;=
p, &quot;IP version: (%d,%d,%d)\n\n&quot;,<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip-&gt;version-&gt;major,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip-&gt;version-&gt;minor,=
<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ip-&gt;version-&gt;rev);<=
br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; }<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
+<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (coredump-&gt;ring) {<b=
r>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;p, &quot;\nRing timed out details\n&q=
uot;);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; drm_printf(&amp;p, &quot;IP Type: %d Ring Name: %s\n&=
quot;,<br>
-- <br>
2.34.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_PH7PR12MB559657926C6D78F4881F1CBB932A2PH7PR12MB5596namp_--
