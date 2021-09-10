Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B345406687
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 06:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83356E959;
	Fri, 10 Sep 2021 04:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68A26E958;
 Fri, 10 Sep 2021 04:36:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULgNNj0fObofTeCHSaIhX92uHnz0qxtf06rNvS+2kNRMkDaewz5tvJF+bvImxrDo2oxom7tO/8E9Bfhum73bTLwuc4d+5zialWXTlqBaVQYjbiaJTp0gf1nEJ5jHNJtGCV7yjOI4WDqxbyet+IZAKuevvQ8jbVUB52GiCRhguhc1zcbqsC7/ehV9QP6AG2aWlyGtSq1/kfW3sShix+2y7rnk1TmcKEKmmJAGmHwJQsHvbh3viUvrnOY35ipTUV9J6KVIN5yUtJr+HZJcFoDQcAWz8xpNLbQ1KqWcFFMoJ2ezkmAWTnVydWfay0K2JWw7zpkl5nDC425ZsYAZeO98yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=tOwmwbUeuoDlBhvPakr4gC8YS9V4Y7fKkPmZYNbFgIM=;
 b=lr6z4EE3LJWQ0WRWml8ozZAVUf2UGDmNIvHkGAsBFGZUFO7uVOsB7gb0q0mDbJ2fR+HeEbAMP3ju272EYE8SWHRtON4rNhd2yT3eSTwCIMEomYaHt4+T+dH29YOzb0VkMxi06G6LMLhamLPbDKO9VZWcjjb+nUj0wtFBt32UN+r5INr29ltObATJurFhFfcPrm2ot2NbVeilcTZETAiKArIqNz4AkK5r9+xS73hsR+6JVGINaUmq4ZpjlNp+lbuomQBFOj+dcxhlaYruRc/RCo6lQrhxHpYEsFZwGYk5b+7MtJ4ryZeVnq1rhB5MmAUKYZz3JvOxJo6LOymM73S1JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tOwmwbUeuoDlBhvPakr4gC8YS9V4Y7fKkPmZYNbFgIM=;
 b=v3sIXDcregqVODqryw9QxyxqTDaJMHwgcfjqWmrBpWDpQ1o47s+qB71kcYeglsUweeBcKArbZMzarQhz48n8nKol7IJ0QqMyQ9o97qX77MD0/GTBhsoe+qg2JZ2nS65Jy1zAOUG4me15rcVSGgud1i/aa3NFGgqAKYehDnQbXyk=
Received: from DM4PR12MB5165.namprd12.prod.outlook.com (2603:10b6:5:394::9) by
 DM8PR12MB5493.namprd12.prod.outlook.com (2603:10b6:8:3d::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 04:36:15 +0000
Received: from DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca]) by DM4PR12MB5165.namprd12.prod.outlook.com
 ([fe80::79d6:3902:9bcd:37ca%9]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 04:36:15 +0000
From: "Pan, Xinhui" <Xinhui.Pan@amd.com>
To: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Koenig, 
 Christian" <Christian.Koenig@amd.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
CC: "Chen, Guchun" <Guchun.Chen@amd.com>, "Shi, Leslie" <Yuliang.Shi@amd.com>
Subject: Re: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when
 array bounds
Thread-Topic: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when
 array bounds
Thread-Index: AQHXpfyYO0epGF8sYUuVJaKbhI4/GKucre2p
Date: Fri, 10 Sep 2021 04:36:15 +0000
Message-ID: <DM4PR12MB5165EC993C7CF4413D52925E87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
References: <20210910043014.529-1-guchun.chen@amd.com>
In-Reply-To: <20210910043014.529-1-guchun.chen@amd.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-09-10T04:33:06.2725034Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Privileged
authentication-results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0edeed99-b230-481b-5dcc-08d9741486ca
x-ms-traffictypediagnostic: DM8PR12MB5493:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM8PR12MB54933AD05502AD2ADD9EAE2F87D69@DM8PR12MB5493.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3631;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CfFu8hSzWdS15oOkdN0oKaZFnvgnaeuzVX9NWCyyx9RrZAB2Wgalp/RcQErAmDIBb8cU5cuCexmFyWvv0OQf6JgKfHdX2QNVJNtcu/xWvkv29tIR/JtbEu0oHzUWHfxfUvgFHzw8tmLzIetfKrMSms3aOaSgjK3sP0/jp7d+MG+QZpplpezcNM0lP92lJCriNyqmg7+kqaGl1KgfW3o6wOHFj4Lf1FWEs32mtRy1LhTO9G55rpTBGpmX8SxzzgQ5DeYFISvJBfHb1LKvsGOqgrjPFLFJ/oo03abEteqhNmfCOaZt64CbsnV1JDeUJXJFxriZA76HoEx7fUi9pCAzTwb8AkSlq1gyLeNycX4HVJ71Op1wP35w2I5q15lyeJEFHJMpQ5AsoicxWMQ/6Kdq0jezt8G4yl3jhC1t5+76Rfo3FWtqHfPrea/4D6L1+pfkUwaFBp6UN7vn63gAPaccDpAPfl9XlgFpPl2jEkilSwrABWZAl99eWHSsu0p054taC9zuaz47S6mvt6Bd5Mfe0l1OLX7SMBASynZXM0xJbwJIk3urYDV0PM08OcCs2NkGyXmXQc6wFL3TVpL3FcIOOm587J5A+cA+6AGGLkUpT+6uXZhO3bseWO8WRqHwlu7AOOTgs9L1E45T1o1Yvi75mSd1kY1Zdn4i+wlXAc9L5a79oyp66pHyXank56P8Az1o6Pd5TKtR/uARKvdeZxIgdw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5165.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(26005)(83380400001)(186003)(122000001)(52536014)(450100002)(110136005)(54906003)(66446008)(64756008)(38100700002)(66556008)(66476007)(76116006)(66946007)(91956017)(6636002)(71200400001)(33656002)(4326008)(8676002)(2906002)(7696005)(478600001)(9686003)(6506007)(55016002)(5660300002)(316002)(86362001)(53546011)(8936002)(38070700005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bg9wjQJhxZqvTJz/Nlrl9FUBablYSRFAbXqAdXmxjPTPdI/sm6Ol9niklOM/?=
 =?us-ascii?Q?dIpE6GWQo68kEpilHbfOyIIhGLjkpFFbECPPSFSHCy2xwprU1YHpSF4akIyA?=
 =?us-ascii?Q?EiwW7hYFekFuenr8f95gWf08baB9D9Tfj0gL31ktHRaB+ZZICpN1Mxn8VT+K?=
 =?us-ascii?Q?v9GS4Iiz7lLZuRMj3c5TEbK85D2NBJNWJtetmjPqyrW/4PIyOXFp5mH52nOQ?=
 =?us-ascii?Q?tsmGMZtZunN4vdu+IbtBq6tjelkqphTYd9238tZKiiJf5MBQg+gcuWkWbQzB?=
 =?us-ascii?Q?PCMOFYr7kFUuv9G4Y8KBn9fyqB/j2iLjAcIH/q2ZQi5PjiWdlPjIbSywgrQx?=
 =?us-ascii?Q?vNj+XEKGL7zAwE2my+bPS6IOo9iJXzLI9eKDsZJ0iuxAdzqHzRuIDcUe9zr1?=
 =?us-ascii?Q?P+Hoco539YPbCqY8D3ExCmtto++iWEodVo+wFCYHPlwCAla7rsj4hbLDwmZ6?=
 =?us-ascii?Q?ZCNXAZPmTOcCmV2AyD6Sc89ce5L1Gr9MBOYnCxr9Iwj9/vCTilvmZLau88Ac?=
 =?us-ascii?Q?xbqx0QGLGVfx9fuZCR2ZrRKk04IHnUfS5u+iiwhS/15M8tIL1bTupuN3x5BS?=
 =?us-ascii?Q?cP+QvzfrgCJN/p7xwa1jnY30puBy+sxXhGvJ4wHIduw6kxupYDQG3wKQObxL?=
 =?us-ascii?Q?aAdgMe0NcYLi6Vi+9U7uiUEQq0OrdtYWAaDQ0S+/i3qOrYeiTdyXxDkYwUkO?=
 =?us-ascii?Q?A9MSBNrz3dEulfMebHjSkElXXo8nBWdC0NnMSBbv0of2DeHxNjc4lnS6wJN4?=
 =?us-ascii?Q?F21qm3QIEFQI2Jg2HhlVGBLE+V5CLURVaNdKnbk18VmCELOza5hM4hvY6Yq9?=
 =?us-ascii?Q?VI5TRAHIo6dfnjZ+U2E0d1a5Oih8sOfGVoQIyWORsxoOMQNLLIIFPP3WfI7v?=
 =?us-ascii?Q?GAeR4sRglqfojnEffYm+1B6TCWo6rXFuEjPzyKiDylwLPTL0l9lHCD4scYr+?=
 =?us-ascii?Q?XVXbSGQYsu69akQGbOReRMfRO0/qbxS1bhL26dnNFGiisDCZFwJwCN2wC7R0?=
 =?us-ascii?Q?PnZqHhE/ZV5dF3d6yBd9dK88d18jRwP4WsO9Uh00TENl6CZWmtEmNn1ydvFh?=
 =?us-ascii?Q?PP2EzU2ZBJjJzmW7MbOGNWT9bO829MM4UA+dnLBNpBhtrqqPLzH3viD1YVvH?=
 =?us-ascii?Q?6g08/dJmSVRdDsqaFSTmARqcrJVelAD7xHMpALECtokB+DOfl6OzZ2BeP4ub?=
 =?us-ascii?Q?4KUSkupog/1NfqnGR9vDBdtQXO/j7p1G6fbe9GHAygriiIm4zlljCaTjIsg6?=
 =?us-ascii?Q?aJAc5ONIguUgOSxTFK3Kt6JKkKnX+ZdEfR1zpRCmGzl5aL0i864uo0u7zYw+?=
 =?us-ascii?Q?i2wsGusKaSACPRI/dWYauaubS1jN0L9eyNggPN9bKaj3rA=3D=3D?=
Content-Type: multipart/alternative;
 boundary="_000_DM4PR12MB5165EC993C7CF4413D52925E87D69DM4PR12MB5165namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5165.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0edeed99-b230-481b-5dcc-08d9741486ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 04:36:15.6803 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K3UK8h722zPbvGLcEexwRLgibShbVed1yHuM12nSXZDP/GDxQ/rm/9a7i7RzXLsV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5493
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

--_000_DM4PR12MB5165EC993C7CF4413D52925E87D69DM4PR12MB5165namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

looks good to me.
But maybe build_bug_on works too and more reasonable to detect such wrong u=
sage.
________________________________
From: Chen, Guchun <Guchun.Chen@amd.com>
Sent: Friday, September 10, 2021 12:30:14 PM
To: amd-gfx@lists.freedesktop.org <amd-gfx@lists.freedesktop.org>; dri-deve=
l@lists.freedesktop.org <dri-devel@lists.freedesktop.org>; Koenig, Christia=
n <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; Deucher, Al=
exander <Alexander.Deucher@amd.com>
Cc: Chen, Guchun <Guchun.Chen@amd.com>; Shi, Leslie <Yuliang.Shi@amd.com>
Subject: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when array=
 bounds

Vendor will define their own memory types on top of TTM_PL_PRIV,
but call ttm_set_driver_manager directly without checking mem_type
value when setting up memory manager. So add such check to aware
the case when array bounds.

Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com>
---
 include/drm/ttm/ttm_device.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 7a0f561c57ee..24ad76ca8022 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -308,6 +308,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)
 static inline void ttm_set_driver_manager(struct ttm_device *bdev, int typ=
e,
                                           struct ttm_resource_manager *man=
ager)
 {
+       BUG_ON(type >=3D TTM_NUM_MEM_TYPES);
         bdev->man_drv[type] =3D manager;
 }

--
2.17.1


--_000_DM4PR12MB5165EC993C7CF4413D52925E87D69DM4PR12MB5165namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
looks good to me.<br>
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0; padding: 0; font-fami=
ly: sans-serif; font-size: 11pt; color: black; ">
</div>
<div dir=3D"auto" style=3D"direction: ltr; margin: 0px; padding: 0px; font-=
family: sans-serif; font-size: 11pt; color: black; text-align: left;">
But maybe build_bug_on works too and more reasonable to detect such wrong u=
sage.</div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Chen, Guchun &lt;Guch=
un.Chen@amd.com&gt;<br>
<b>Sent:</b> Friday, September 10, 2021 12:30:14 PM<br>
<b>To:</b> amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&=
gt;; dri-devel@lists.freedesktop.org &lt;dri-devel@lists.freedesktop.org&gt=
;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Pan, Xinhui &lt;Xinh=
ui.Pan@amd.com&gt;; Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;<br=
>
<b>Cc:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;; Shi, Leslie &lt;Yulian=
g.Shi@amd.com&gt;<br>
<b>Subject:</b> [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager whe=
n array bounds</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Vendor will define their own memory types on top o=
f TTM_PL_PRIV,<br>
but call ttm_set_driver_manager directly without checking mem_type<br>
value when setting up memory manager. So add such check to aware<br>
the case when array bounds.<br>
<br>
Signed-off-by: Leslie Shi &lt;Yuliang.Shi@amd.com&gt;<br>
Signed-off-by: Guchun Chen &lt;guchun.chen@amd.com&gt;<br>
---<br>
&nbsp;include/drm/ttm/ttm_device.h | 1 +<br>
&nbsp;1 file changed, 1 insertion(+)<br>
<br>
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h<br=
>
index 7a0f561c57ee..24ad76ca8022 100644<br>
--- a/include/drm/ttm/ttm_device.h<br>
+++ b/include/drm/ttm/ttm_device.h<br>
@@ -308,6 +308,7 @@ ttm_manager_type(struct ttm_device *bdev, int mem_type)=
<br>
&nbsp;static inline void ttm_set_driver_manager(struct ttm_device *bdev, in=
t type,<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_resource_manager *manager)<br>
&nbsp;{<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BUG_ON(type &gt;=3D TTM_NUM_MEM_TYPES=
);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bdev-&gt;man_drv[type] =3D=
 manager;<br>
&nbsp;}<br>
&nbsp;<br>
-- <br>
2.17.1<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_DM4PR12MB5165EC993C7CF4413D52925E87D69DM4PR12MB5165namp_--
