Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D144068B0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B097D6E9A1;
	Fri, 10 Sep 2021 08:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E86E9A0;
 Fri, 10 Sep 2021 08:46:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UkrELMKyldIjoDoT9ejAH5UknsFgKgl/TTQKDuudk0NWClzLVm5RAxLji3qUfqgZSEiJLgChj+hKlXcw+j0pfmrc86aZO82IG6FsZkmMaXE+OaHj7TE9uueU6x1AmNPgbSI8zRq6L/+WycQHd+QzUWKJAJfnpr5l1xEiZN+CwAL3g1K+l2u61bPTGOjWfbb3Wl4bVvtZ3D8tN6uvwrY8IAsZktmGtEcg4Eq5wub7X6x0R2JPM2N4LtEulSnsvYj/X2wrHVIvaoWtFlvLjiywpmgj780OAECmk3Xgd/3+Zb00WBFu2A76Shh4CtrhvGNdyAGUppR7/KwtnHBIHnSmDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=dw8ONfL5pezyVx6uN7astwG809uLa8nBxLLkV1np4B8=;
 b=dJZzO6GsiVxIlOGJRAMwD4RPiFDnVVF0zTDyVafNmVPhAIITPNI7cXRglFvWBClmovCnKMVG+Q1zCHdJlrNy0MaE7IoNl7hZgGmvNfB/a86l3jRpBgEsTUfifbHybDUi+8a0xYGHD3eqp5KjIeLQ98q4UnuRJ2n2xgcuV1HuR0L3LB33BaFgC6UcBUnB3dL7zJtsjjpcIWnoQnRkhxFQbKjjhfOlv5LPkIHZM97Ht/DGmg2q6T5Qk5qOGygNKshy2bXUkQCxtOlgpMPiJKBz/2Qge67pBY1tlf6iDkUVVfPCpFfibvyPvpUgZu6+vCdq/p9S+u0DzGWd+rVoR/3rVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dw8ONfL5pezyVx6uN7astwG809uLa8nBxLLkV1np4B8=;
 b=XEsWO4tO8mmyn/96J5oiOPfHA4W+qRHGTFNi7TAuaqbOSb8grfb/8f5da0sTsymPpLKfGQqlZxfw2hinxRLIgbJk+5Xmn0rCIbMb3X0vZPo3LoY+WO2e6N5MQcU+rA2JT53T1/IKTKf+E0wXwWHwwbi2ofgYKlnCPzcwrawHvxM=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM5PR1201MB0025.namprd12.prod.outlook.com (2603:10b6:4:53::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14; Fri, 10 Sep 2021 08:46:30 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::54e5:e9f1:8883:e8a9]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::54e5:e9f1:8883:e8a9%3]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 08:46:30 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Shi, Leslie" <Yuliang.Shi@amd.com>
Subject: RE: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when
 array bounds
Thread-Topic: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when
 array bounds
Thread-Index: AQHXpfyYVp1YSLRUM0KmJMN0H4F58qucrs6AgAAhq4CAACHjYA==
Date: Fri, 10 Sep 2021 08:46:29 +0000
Message-ID: <DM5PR12MB2469280FCA75F272D54A199FF1D69@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20210910043014.529-1-guchun.chen@amd.com>
 <DM4PR12MB5165EC993C7CF4413D52925E87D69@DM4PR12MB5165.namprd12.prod.outlook.com>
 <b065dd8d-5914-883e-b51d-8a718dae534f@amd.com>
In-Reply-To: <b065dd8d-5914-883e-b51d-8a718dae534f@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2021-09-10T08:46:27Z; 
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=44e72433-caac-4842-9a36-50c8dfe0efad;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08a01ba7-2567-459b-888b-08d974377be9
x-ms-traffictypediagnostic: DM5PR1201MB0025:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB0025CA70CA0861566454861FF1D69@DM5PR1201MB0025.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +re+v9QdpJJVptGflq/jqcqOuhKmmQDHD2AaNCvtAzTYXusMEZ5iozaRO86IOWfgiIsRxGwR66pgLF63OHPWSq3OItluX6U+B8vwZfQhLLW/TyE8vhmfqYUJlDTn7BRUmJ6sgKjBoBIvZtYTN4RnVJlFwO0/beaggsLUvX7oYiiAMFpEgw+3Rm+panbcZF0iShMzmo2PcIwrMqIRWUEEm09/Vp7ASeiD9gnM1QYw8k4gQZL5AkK+8v+/7j1IFyWzU/Tq3ZV0CmUv7oCkAWWQgzAw+AEKlBkHWt4PpullRnm0Z4zhfSo+tH0sJ/atXattdlAVA3o3PChfB5Zs9oLFjrLzoKskO+Osl2mT1upzA4GY0rrtBezV19kbCSmdZCfIkvk8MyMJ+h3fWz6nF8FxPPYy9tQc2y/Kh61LE9FYfOPv08wBW6LTmNiEIkCM4zm6InhqATi3NPVl3j09KAo0pL1kkKB2wLCU+gyR7RAVjYweZK1KZ/Qs+XRYF4cf8IuMrWXsA+DMvxUmRJkN3xfDB0dJCDsT9HNzKurWNVxwpNRetj6ceqLXyRdjmTu7mwdY5C4T0ykJjPOGc21rnBlJi5+C4xUJCqECxPckvF+2CcVOByf1vystGsA+Vutj62Agyhs6wImcFvXtNw+JlXD2YObsxrOC+kFpe0Mjuk6CHTy0X1Nx44Uh+KMMcb+rTQmX+onR80vtvqvTWYSsqUJmPg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(122000001)(38100700002)(7696005)(2906002)(66446008)(55016002)(66556008)(66476007)(83380400001)(450100002)(478600001)(38070700005)(186003)(86362001)(8936002)(6636002)(4326008)(33656002)(53546011)(76116006)(8676002)(9686003)(110136005)(316002)(71200400001)(5660300002)(6506007)(66946007)(52536014)(64756008)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nbcsWhvp1XRKhaybfVbZ7UT511Vz21h4LIWcgIfoBQ6gV/eiHAy2T5Rf7LZ3?=
 =?us-ascii?Q?/p4sWKxgMm3Tax6bVNd6lm3DCVMehJNHAR1Jh/fvb+dhs8c+L/f3aJZnjD2k?=
 =?us-ascii?Q?//FWQqbAK7sLHkSBGQ9iYEjUuBaBRgS2W7hmC4X/D8pro9hU9d7bR4QyXOj5?=
 =?us-ascii?Q?hlbxDs3qvByIw3UKI69GDk2QurITeK1Ca5k+GFl9UaXtBKigi8EebyerIQR5?=
 =?us-ascii?Q?kvzSDt3AUqVjwRsaKjnRRTUVhU1hjQOWx8FkXTGrjyfklJeplOEXaoXohm5X?=
 =?us-ascii?Q?ue+ZIQkP1GkZJox+uGox3aJR1AtMwLwOI+CV/v7iaF+5q28+1Ik7HBUD9a5F?=
 =?us-ascii?Q?11/+gK8n3pMqtw37JU/8+VzZlB/YhcUKItI8N77NpDMBJFpYz+7Z1EJIvu0D?=
 =?us-ascii?Q?yiisChzRgnFEouu0gueGRgSNOKIuTSBLnq6wVDwEiebEWw4N7eefuyWKmcGn?=
 =?us-ascii?Q?uaUjQYIwrZt9dOiHkqXj7AxPpJziLUUsMFGeQM61LrE1BR/YVlRYHzAz9VSB?=
 =?us-ascii?Q?U4J7N7wmSasvF13zPYiRzdO09o/CsOCfX+gMKfL2zx2Yk4nmwXwN+mY63/mT?=
 =?us-ascii?Q?pSibLBZR65StlJn6emVA5awJ2zMVRssz6VfjBM6iP9kLJ43W847y2qkAupKz?=
 =?us-ascii?Q?Mv6uQZFaAp3eNk1EmJYsoWZmzxQZ/YEeUF82EsTLWoFvcGfbxTkMHwnkKbjy?=
 =?us-ascii?Q?mphYlNfDBB4rkfW4fj+3PkiTSSupP/Q/EIdJf46rZj+ybmG6H4FByksKC9yo?=
 =?us-ascii?Q?sQz3vkK5yM8XnpBqnfTg9sj0RvHcYmX4e9I0ocJQZxUmyEQ4zs2jvaePF34K?=
 =?us-ascii?Q?DqNNwrjoaHX6nnJVPYAf6YemYhpO0EkM20pcsY8S2gNrDxXD2ZOKskSJNkeH?=
 =?us-ascii?Q?eQdSSbeinXzOGzEsl3tOw3IZZLypMqrGQrvyfGoVNNLz9lHBlzlwODhU09D2?=
 =?us-ascii?Q?u/h9SIxGqSadJZJlh51Yfet1gybb0HpTYsG4OyNENlpFbZ2KxtTPqDVBhlZE?=
 =?us-ascii?Q?9CMCYf394eV7SkdYndAgjv7O73gEVHHbQeKywdkzGrl0JXQM6+ZF4E6JWmZ5?=
 =?us-ascii?Q?prekcOpRXsxKvyDra6e6F0rvWl3uSsBXgF2LdSjvYLuMbJl7nnPNtnIpuKXW?=
 =?us-ascii?Q?q7KnhVVwbULu9iRdo5vya3Mga32Xbt6Vpa3vF1YrKcBkTiEhF2MmIrv39Bf5?=
 =?us-ascii?Q?3IiEkqq8EI5aIKiU1c/fVsIueLImW5mQtIqgzpe24ySzoT6HnlBzaI9gVy+x?=
 =?us-ascii?Q?Z5B2QDXNFS/30vi/L0qI0oy1FV9vPPeb1McdfdK8r6W+dZMJN8vY3qo0vgIh?=
 =?us-ascii?Q?+LTH7EGjaZoZoUQoWcZSPaHx?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR12MB2469280FCA75F272D54A199FF1D69DM5PR12MB2469namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08a01ba7-2567-459b-888b-08d974377be9
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Sep 2021 08:46:29.9702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b+RdrBe5JTr+9eJPzRHU1iDGIhcm1sMv2UDwHvjpg1j1Pc9L7wf2kt1iAAMvXPFROQjLp5VMDXliV6XJ/ZAsiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0025
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

--_000_DM5PR12MB2469280FCA75F272D54A199FF1D69DM5PR12MB2469namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

Hi Christian and Xinhui,

Thanks for your suggestion. The cause is I saw data corruption in several p=
roprietary use cases. BUILD_BUG_ON will have build variation per gcc differ=
ence?

Anyway, WARN_ON is fine to me, and I will send a new patch set soon to addr=
ess this.

Regards,
Guchun

From: Koenig, Christian <Christian.Koenig@amd.com>
Sent: Friday, September 10, 2021 2:37 PM
To: Pan, Xinhui <Xinhui.Pan@amd.com>; amd-gfx@lists.freedesktop.org; dri-de=
vel@lists.freedesktop.org; Deucher, Alexander <Alexander.Deucher@amd.com>; =
Chen, Guchun <Guchun.Chen@amd.com>
Cc: Shi, Leslie <Yuliang.Shi@amd.com>
Subject: Re: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when a=
rray bounds

Yeah, that's a good point.

If build_bug_on() doesn't works for some reason then we at least need to lo=
wer this to a WARN_ON.

A BUG_ON() is only justified if we prevent strong data corruption with it o=
r note a NULL pointer earlier on or similar.

Regards,
Christian.
Am 10.09.21 um 06:36 schrieb Pan, Xinhui:

[AMD Official Use Only]

looks good to me.
But maybe build_bug_on works too and more reasonable to detect such wrong u=
sage.
________________________________
From: Chen, Guchun <Guchun.Chen@amd.com><mailto:Guchun.Chen@amd.com>
Sent: Friday, September 10, 2021 12:30:14 PM
To: amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org> <am=
d-gfx@lists.freedesktop.org><mailto:amd-gfx@lists.freedesktop.org>; dri-dev=
el@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org> <dri-devel=
@lists.freedesktop.org><mailto:dri-devel@lists.freedesktop.org>; Koenig, Ch=
ristian <Christian.Koenig@amd.com><mailto:Christian.Koenig@amd.com>; Pan, X=
inhui <Xinhui.Pan@amd.com><mailto:Xinhui.Pan@amd.com>; Deucher, Alexander <=
Alexander.Deucher@amd.com><mailto:Alexander.Deucher@amd.com>
Cc: Chen, Guchun <Guchun.Chen@amd.com><mailto:Guchun.Chen@amd.com>; Shi, Le=
slie <Yuliang.Shi@amd.com><mailto:Yuliang.Shi@amd.com>
Subject: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager when array=
 bounds

Vendor will define their own memory types on top of TTM_PL_PRIV,
but call ttm_set_driver_manager directly without checking mem_type
value when setting up memory manager. So add such check to aware
the case when array bounds.

Signed-off-by: Leslie Shi <Yuliang.Shi@amd.com><mailto:Yuliang.Shi@amd.com>
Signed-off-by: Guchun Chen <guchun.chen@amd.com><mailto:guchun.chen@amd.com=
>
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


--_000_DM5PR12MB2469280FCA75F272D54A199FF1D69DM5PR12MB2469namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:dt=3D"uuid:C2F41010-65B3-11d1-A29F-00AA00C14882" xmlns:m=3D"http://sc=
hemas.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-=
html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
p.msipheader23c54b6f, li.msipheader23c54b6f, div.msipheader23c54b6f
	{mso-style-name:msipheader23c54b6f;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"msipheader23c54b6f" style=3D"margin:0in"><span style=3D"font-si=
ze:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:green">[Public]</s=
pan><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Hi Christian and Xinhui,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your suggestion. The cause is I saw data =
corruption in several proprietary use cases. BUILD_BUG_ON will have build v=
ariation per gcc difference?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Anyway, WARN_ON is fine to me, and I will send a new=
 patch set soon to address this.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Guchun<o:p></o:p></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Koenig, Christian &lt;Christian.Koenig@=
amd.com&gt; <br>
<b>Sent:</b> Friday, September 10, 2021 2:37 PM<br>
<b>To:</b> Pan, Xinhui &lt;Xinhui.Pan@amd.com&gt;; amd-gfx@lists.freedeskto=
p.org; dri-devel@lists.freedesktop.org; Deucher, Alexander &lt;Alexander.De=
ucher@amd.com&gt;; Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
<b>Cc:</b> Shi, Leslie &lt;Yuliang.Shi@amd.com&gt;<br>
<b>Subject:</b> Re: [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager=
 when array bounds<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Yeah, that's a good p=
oint.<br>
<br>
If build_bug_on() doesn't works for some reason then we at least need to lo=
wer this to a WARN_ON.<br>
<br>
A BUG_ON() is only justified if we prevent strong data corruption with it o=
r note a NULL pointer earlier on or similar.<br>
<br>
Regards,<br>
Christian.<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">Am 10.09.21 um 06:36 schrieb Pan, Xinhui:<o:p></o:p>=
</p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt">
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Arial&quot;,sans-serif;color:blue">[AMD Official Use Only]<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">looks good to me.<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:black">But maybe build_bug_on works too and more reasonable to de=
tect such wrong usage.<o:p></o:p></span></p>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"1" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Chen, Guchun
<a href=3D"mailto:Guchun.Chen@amd.com">&lt;Guchun.Chen@amd.com&gt;</a><br>
<b>Sent:</b> Friday, September 10, 2021 12:30:14 PM<br>
<b>To:</b> <a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.f=
reedesktop.org</a>
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">&lt;amd-gfx@lists.freedesk=
top.org&gt;</a>;
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a>
<a href=3D"mailto:dri-devel@lists.freedesktop.org">&lt;dri-devel@lists.free=
desktop.org&gt;</a>; Koenig, Christian
<a href=3D"mailto:Christian.Koenig@amd.com">&lt;Christian.Koenig@amd.com&gt=
;</a>; Pan, Xinhui
<a href=3D"mailto:Xinhui.Pan@amd.com">&lt;Xinhui.Pan@amd.com&gt;</a>; Deuch=
er, Alexander <a href=3D"mailto:Alexander.Deucher@amd.com">
&lt;Alexander.Deucher@amd.com&gt;</a><br>
<b>Cc:</b> Chen, Guchun <a href=3D"mailto:Guchun.Chen@amd.com">&lt;Guchun.C=
hen@amd.com&gt;</a>; Shi, Leslie
<a href=3D"mailto:Yuliang.Shi@amd.com">&lt;Yuliang.Shi@amd.com&gt;</a><br>
<b>Subject:</b> [PATCH] drm/ttm: add a BUG_ON in ttm_set_driver_manager whe=
n array bounds</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Vendor will define th=
eir own memory types on top of TTM_PL_PRIV,<br>
but call ttm_set_driver_manager directly without checking mem_type<br>
value when setting up memory manager. So add such check to aware<br>
the case when array bounds.<br>
<br>
Signed-off-by: Leslie Shi <a href=3D"mailto:Yuliang.Shi@amd.com">&lt;Yulian=
g.Shi@amd.com&gt;</a><br>
Signed-off-by: Guchun Chen <a href=3D"mailto:guchun.chen@amd.com">&lt;guchu=
n.chen@amd.com&gt;</a><br>
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
2.17.1<o:p></o:p></p>
</div>
</div>
</div>
</blockquote>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_DM5PR12MB2469280FCA75F272D54A199FF1D69DM5PR12MB2469namp_--
