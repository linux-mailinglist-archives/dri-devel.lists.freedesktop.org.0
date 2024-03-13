Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F169487B233
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 20:46:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C85310F855;
	Wed, 13 Mar 2024 19:46:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PEC6rI7a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7A810F3C2;
 Wed, 13 Mar 2024 19:46:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZV4zNpI5nbmnDBSHng9Xgf9emNa/a6QbXiXjuvsEfKL3GA1TvD9vszCWP4B29biq6ymPto21vMZ4X1aZF8Oh2+YnsR1nRDWQX6aMplGfXLKHm4Cz77xKknrHtk7031VVTAvc8snkUxBZ7leNIRsurPn3Pc4gJB2tyAQ5hMChjVSVZkDkkLWKM+bwfKLs4SLOwVLFcquxHK0hhSv0php5kmDQXvHsO+PgPWH0vjBnM6jd7pEtCNN1vvL/lY6gRBIxgChKsQqN2APdvYvycvHvYD7De5KcO1hTPShcyPzvte77zTI1mE5i/8jz6xaEaefWgUHBzkCllY8Hx+VvLXRPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBI8DKWYVDWYQCkRQMF8kS+id/KMHo7ggO1wC91aRrE=;
 b=MlJVQuskCg0McY2QndzougLRfCzkTb718EgUiwTfndJGxpWmU8KbiMsOTn4kdveddJr1cH6kvICsO9u4OuOVkfVaIRK6COllmY73rhNTkqDSQfhIgHV2yGHkfzTaBOY36XDkx3QrgguP7s7y3rq0Y9o0k0ohLDL70JpXLubdBP9X6pgUSvcfuGEGzYjHq3PKiNdaLxUM/WsC6q0hbRD4655kFPl1yqU3//ufTrLJNZk3QmzU98pWZDgZh7/tGORjTWlSbuTgLXPVphE2/PHegwJmak2UEZ80KjoDmzSWo/d70eru653v0EkByeYxmeHa+HIYmCX0LdfvgYmJvWt/Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBI8DKWYVDWYQCkRQMF8kS+id/KMHo7ggO1wC91aRrE=;
 b=PEC6rI7aVoOpGvn5BGrqovzYP/fpgfkWr5It+Oxhkyijl9C+l5bK1v5Nml7/7eID0FGVfR6jb3rD54PcCzcqubnigmiVb+pW5Adco46jpMPQbkoGDjqS6sfkAAX5aF1a1X59tUML+wMmOcqt5P/Ng+7ydgbJ/8X+XaD03QNAFqI=
Received: from PH7PR12MB5596.namprd12.prod.outlook.com (2603:10b6:510:136::13)
 by DS7PR12MB8418.namprd12.prod.outlook.com (2603:10b6:8:e9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.19; Wed, 13 Mar
 2024 19:46:29 +0000
Received: from PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033]) by PH7PR12MB5596.namprd12.prod.outlook.com
 ([fe80::6974:3875:ed0:7033%3]) with mapi id 15.20.7386.017; Wed, 13 Mar 2024
 19:46:29 +0000
From: "Khatri, Sunil" <Sunil.Khatri@amd.com>
To: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Sharma, Shashank" <Shashank.Sharma@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
Thread-Topic: [PATCH 1/2] drm/amdgpu: add the IP information of the soc
Thread-Index: AQHadHqsH/vlkBXhR0GBq9Gh47YnILE2FTYu
Date: Wed, 13 Mar 2024 19:46:29 +0000
Message-ID: <PH7PR12MB5596ABEFF7F574F4F082FD23932A2@PH7PR12MB5596.namprd12.prod.outlook.com>
References: <20240312124148.257067-1-sunil.khatri@amd.com>
In-Reply-To: <20240312124148.257067-1-sunil.khatri@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=True;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2024-03-13T19:46:04.7126466Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB5596:EE_|DS7PR12MB8418:EE_
x-ms-office365-filtering-correlation-id: f73a91d7-621b-48f6-6c83-08dc43964726
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HuGMr4UkmHP/c9wHYnkrVPrDFrOItJUowDGjo+kX5DXotgf+Oq78K1rkBzbXf/NdAiXJTaAahG2M1nrkV3as9KwyqNHg15IN6FYF+TiAfeEOdC/S8MsUdi/DfjoHIhihbXrhPuSFKkKKYd9mhkG9rXU3Dr3skCZxeyuUlfVfRsisExwStV4Ep4FWzZeZz26/LT4S/v7Yb4l8kFpq0pX3+NzKg8yWhhq9TkEDdOZRdpTRzxfFS3Zycd6l7OosOnQB3nbfWwixHWnlJq2BQNbxfv6zvS85OoYeaTHEvT865slpnt8ygBIfDWUJ8zX8ThlrRrI4uYYr1pa0FX/g0EfwXFFgcLQL1igocz1Cd5PsXUS22pKFbZXQWEzsHnmE5uXw8RTSD8EVdQqHR8t9Ga3lI6QiDnJfofchOArbPuhRtOShRVFhBTvv4hwhGjsTBxWAfIEy8Wvbd5BqEmbUhA/MGZcur34ZDtTnnsixj+Cd2qgoIAkN9brHHs1dRCIimRRCKkFyiz/WUgddZQmK+rte4CdgGtvN2MPBlu4NJEdgjGSkY4Qy0Rb40BUzd1xqtmpiL8P0ZJZopfrjrxxWgjF5crerHIbeET0MFRgXb9QW0+9o7zocNk+WKwj1DbMUVMejZHUXB34Ft5E9wndUT7WzN7dGp6ixj47Upq/Mv6jV5tQ=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5596.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7WMgPE5a432hanTVHHptmcVHzEEnAquEEEhsIdApzstQBGiIOQhBy4IhV6xr?=
 =?us-ascii?Q?8HQi1HYHamqf4AcDTyGRPjxU54T/h6bBT3+virWsqWhdLp8f6z3vHl863eB4?=
 =?us-ascii?Q?CIQEohJLtcPbIhnmkxG2KTT16w4LGDRCDILan9gvHogEXxqv1879Qv6DS5Ai?=
 =?us-ascii?Q?JdKbX+CkEmG1zyU664i+kKXJi+Ytd0nHAkrBLA0SR1ZbjdlV79siQS1QbPrz?=
 =?us-ascii?Q?AJZF81xKnqIX8h3ZFkox8odegGZs2PLlCi+cX957rbs0cCwE08jmEwVqSRPz?=
 =?us-ascii?Q?W6zRSzLOiiBBIakowNC3l3xg5pZHURzmk7NMGxbj47kHj9cVgw1l2aZZ37xW?=
 =?us-ascii?Q?NDduD+C1cary4lncPXfmNfRJiJieeaZ/e2IuzE8wvfQQPIVPFj+aCG5IwUKu?=
 =?us-ascii?Q?CT2/bBpj9rS5wyvPVIpiqid2Ca/SwvcbSFPrdSqogpIQiv77//76CvoHTLxv?=
 =?us-ascii?Q?j5oFyXc2ZmP21UbrFsm+prEXfRDPtXEoPdpfkZo+0d3+p2rslpAzEVhkbIcn?=
 =?us-ascii?Q?ZZD5DN2/0yIzLUzPrN0oygODBOxlT4hWj/4nIyYfrgZUIu1LbIDT/4vaq/Me?=
 =?us-ascii?Q?or7zx2wJ/cSg+YXx8wfJcOAzl5NRV9ndiBbfQtvhmUkDkB5M4xgbDXE0wJc5?=
 =?us-ascii?Q?TAI9xVXAjquQwz6fT+1EQUEg+KfglBLeEbydnv3nx9MQRdPdATDFpoYlVcKs?=
 =?us-ascii?Q?24R92/T3G5g1LF8/afVwr9SHvMbtxqCHTNOGUAGVqmElKoNCGvOaBt6MTfrn?=
 =?us-ascii?Q?6vWq9d/KqS0++yq0+JSPSZUkuMSkYfWrDCY1fUTTGUrZ8+aPDZfgtYSyqKe3?=
 =?us-ascii?Q?8p4lKy6L82JDS9LK0/w3b6hsoE/P72Ylw3zJxz86xP/JRLPIBDzVTbrf+qtE?=
 =?us-ascii?Q?EDgwcxKuHkN/U/7voOaXQInks6vVTIfgXhXY/H2Sf/V0ooQLisKxdCsUlWTA?=
 =?us-ascii?Q?VYQVe3m8IVzX8pFAezEWs+nAsYQvaiEd8KeuXHUGph8YADhzyhMNYzn0XfOo?=
 =?us-ascii?Q?KK01KvEBUi4IXYn8gtHxtPmC+xHyTUOjkZuDHTqWNUv0cNRb4s8LBra4ILYX?=
 =?us-ascii?Q?xyHMrmIpujv0VcMjRJnpeiPUSOhLieT7+fBbFIGmXdH5rchqMCwKQnAB+JHH?=
 =?us-ascii?Q?LVxIkbubcR+QNWug3kfqeAivlEGFTEKEZfwCCrcXTRewF3KnRvbrDuWobbCo?=
 =?us-ascii?Q?uPPd952Wu8yskxzVMOh5tjQeHfIAMWp62zXzlHLV2RRzYy2A5XTt902r9Epm?=
 =?us-ascii?Q?5/4Kbtw0TBEdGo9EwIxs92/nOUai6z6lGE4DtsEIwMqjZ2D4WPxwVkNFMFul?=
 =?us-ascii?Q?rcCASGk+QZeo/oQe04kwqtgc/EnEzXr2dxDGuHAzXjLpi9t32mE6G1mNwkwV?=
 =?us-ascii?Q?Gs579iJePAyyl3bdIeb7noYlCv19GlHJsxeipMqFyfO1Hn23RtsKc87v38p2?=
 =?us-ascii?Q?ZRbFd67y2a7K5t0SXMwya7pwTFnJYgKgwWW3Y9WQbgGpDADnwtlAif/wzC+f?=
 =?us-ascii?Q?AvlMAhehbTFU2Z+Z0C00Z2h9MiaZzJINCDiBIezXmqyfbniroCZhghJwUs8v?=
 =?us-ascii?Q?ydd6ran1MnNjYfNFDsWs15fesJghwAVvZrGEXGEMi/6mSaHP/s39Ae3B1160?=
 =?us-ascii?Q?fQ=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_PH7PR12MB5596ABEFF7F574F4F082FD23932A2PH7PR12MB5596namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5596.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f73a91d7-621b-48f6-6c83-08dc43964726
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2024 19:46:29.7157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T8D7iEtnWHZdAdBvU2Qv3rkv000E3714SmnTK0m2tHajf6jqfh2KBL/fuQ/67TatMjhNS3c/gx0fjYwiAMUOBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8418
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

--_000_PH7PR12MB5596ABEFF7F574F4F082FD23932A2PH7PR12MB5596namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - General]

Gentle reminder for review.

Regards
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


--_000_PH7PR12MB5596ABEFF7F574F4F082FD23932A2PH7PR12MB5596namp_
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
<div dir=3D"auto">Gentle reminder for review.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Regards</div>
<div dir=3D"auto">Sunil&nbsp;</div>
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

--_000_PH7PR12MB5596ABEFF7F574F4F082FD23932A2PH7PR12MB5596namp_--
