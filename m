Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC9C323F15
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 15:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A8086EABA;
	Wed, 24 Feb 2021 14:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C8B6EABA;
 Wed, 24 Feb 2021 14:08:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mizA0GVACKGCyi6e3ptfxer+Hw91xVtcAQM5eX5Rx90j00eJPizBG+XHGTDv8kfUVmX2RS6PKWvKqndUdIqRVLA1SJ9/XQ03VFmyW7qH86nlRwLZ7bz3U6MnbVzQ6G9pAuiwU63g9AMfKIUcqdovhBRYv4BzLcp1d9VFN1WJteOHmxWSxIxyWVdZ5cVbVVWllG3ZbWjG5av08lVwgRN1MySw/jT244gdDxhko3LPfHVoHqOt0SE++e1aN9S9V3N1jqC92ivwBW5Evm9IneG4IJl0KqpGbLJxKSU0mTZ4inif/Tpxxziy3SkbQrgo/UJVvs6cgbydHxOxzuKSgKYm4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3HtsO2R4kYsiXHaQ8Nfb+ElHiXt59I6/0R4bqvXYf0=;
 b=ecWjcrLjXg9S3HXclaCxbJfTLzevtGgZqSovrZxGiiVRCY/+zmKDOfCwUzxYehJxKd0jslmYnSJaOA2ZNFAUJXLrZsu7El7zO5dILYNAjW1jhoocFWJWzBXorrBTST4318QVEINt8dbWfsIdce8zww3LJtun1jG2fkRkMunqFJr7Ic608085CvQTYxupoiUPy3oJz1KtGAp8XucnP2M23sx/57hb6XeHomhfo3FzDEs5IEO1z60elWoTIwa4oHgyzrKo0rC+ZVHpJqonfSYI+yKCRSxWCYTErQ5v9JEYjI08/Fv/oZh591zJTx8nTqBXXfsXnns5nhkf4ujTXNzdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3HtsO2R4kYsiXHaQ8Nfb+ElHiXt59I6/0R4bqvXYf0=;
 b=YBCf9GSvAJBqQYv4FR/6jHz28SV/HcPy7D+NUMt00evvYQuooMqKbMF0fX8FGTfbmIp1GeKiVNPvXONAFHlHHBhJQXlmr626xn7enSGhhUnagxsN+0ObEzYwYG/yNzdhnhrPpgGWCHMdhBQBlyXGyk/FdHknTsPQTheztpgk6/o=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4013.namprd12.prod.outlook.com (2603:10b6:208:163::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.33; Wed, 24 Feb
 2021 14:08:58 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%7]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 14:08:58 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Wei Yongjun <weiyongjun1@huawei.com>, Hulk Robot <hulkci@huawei.com>,
 "Wentland, Harry" <Harry.Wentland@amd.com>, "Li, Sun peng (Leo)"
 <Sunpeng.Li@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Siqueira, Rodrigo"
 <Rodrigo.Siqueira@amd.com>, "Pillai, Aurabindo" <Aurabindo.Pillai@amd.com>,
 "Wang, Chao-kai (Stylon)" <Stylon.Wang@amd.com>, "Lakha, Bhawanpreet"
 <Bhawanpreet.Lakha@amd.com>, Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Simon Ser <contact@emersion.fr>, "Zhuo, Qingqing" <Qingqing.Zhuo@amd.com>
Subject: Re: [PATCH -next] drm/amd/display: Fix unused variable warning
Thread-Topic: [PATCH -next] drm/amd/display: Fix unused variable warning
Thread-Index: AQHXCpEf+qXqfm5niUiEVyfzr/76qKpnV/ge
Date: Wed, 24 Feb 2021 14:08:58 +0000
Message-ID: <MN2PR12MB4488303E601FF78D31CC76A7F79F9@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210224094942.2691246-1-weiyongjun1@huawei.com>
In-Reply-To: <20210224094942.2691246-1-weiyongjun1@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2021-02-24T14:08:57.450Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: huawei.com; dkim=none (message not signed)
 header.d=none;huawei.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [192.161.79.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: cc02257a-0efe-452f-dbd9-08d8d8cdba8f
x-ms-traffictypediagnostic: MN2PR12MB4013:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB40130606E4E69778880F83B4F79F9@MN2PR12MB4013.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XmH5DSCGe0PhDcm5cbL5VDoDdDm46YM6CGSouIHq1LC/JS52LaOfVzsbL6yFnldRsYmr+Pe1IuaKn10qmLqPRr3IAQv7g/o9eKxynTDRZpmAwXby/x3SOnbYUfioOsaOCw/WLtKtJPHbF1oghzVii8xGHLuWB6BRUK9m3H9IVNnbwXVQdmUJMxEY7hEwugLrQz5W+wp8QAahFQ4dvr26iS0V0GIG7RyAgoCGlkHe7bAzjxjxeQf1N4dxBTkpGBbuohWoM4Nh5KHk7XT5wVGk4x5grDYQJRf3kAPV94nHW6Ns9inF8DrECxsjU+gxrY2Yf2MN6hsYq9ZGx+JREK81vNl1J5COqFSEaZUW8aaaHbLauz51ZNNCeFwqTYPGuyXFAgAadHvLzwAKlOpIn1qEyBc6pAAObmeLoFVC2JNB21yh6uTrjphIIoG3BcYti4bvMSxm0BKOBW2ujdYDz7Ltl1CXzkjosJoszQGIpaxxWc7Sm8Jdos3nOl5BOGPGYUGnItxTdvn1YuwS1Ff1GnZeTOZNk/HeouJrBgTMYidAWHwcRP379P/ZydRBM5XHdsyd
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(71200400001)(9686003)(7696005)(5660300002)(33656002)(83380400001)(4326008)(66556008)(6636002)(921005)(86362001)(110136005)(52536014)(8936002)(8676002)(55016002)(2906002)(64756008)(76116006)(478600001)(186003)(53546011)(66446008)(26005)(6506007)(54906003)(316002)(66946007)(66476007)(19627405001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?NcEQ0UsYnBL37B5yqHwYj03q8YkYHX4cUW7dNs8urvOQ5pCtxsnjXHFYHS/b?=
 =?us-ascii?Q?6cDeFyTeeW95w9wf7dRt9DaxHosy8Bk1cIY6hrtKPJp+rYBybm7xqo6zDF+D?=
 =?us-ascii?Q?8q6RtL855uRfDyLdAr3cC9SxTZHaxqMC+ef9Lu2srlCXCutvy3EuYZJB3ppX?=
 =?us-ascii?Q?nkJ+wakUA7TXqgFNQGvJ6r+mH8YhA6whATMMSkzvnX4mSv9UlWC5CsiZbNcp?=
 =?us-ascii?Q?Zt4SuAZx9++ybzSvYerPTI4WjsohOpDdBXKJnIgkww18MTMscLxJIV85M2BC?=
 =?us-ascii?Q?3nAD1nurURer9qWG7CCuPY2MYc3u+1Sg2GYzLWd63eL94D7YwGPQTrfNNVwZ?=
 =?us-ascii?Q?jjUx4GyXXb78zuCc8Ue5EcFT04ev2vHzCqSvSXRjhhWjhDxWNbOxErwo1aoE?=
 =?us-ascii?Q?jhEXm49E3emI9DPa94tv380C7gT4YsETJfHDC8hdFhIwXGZEQfO92owcTBHf?=
 =?us-ascii?Q?ghHoy6ehQCy2KRmiXvUoHuhWSXQUeEyipM070yH8xYcRAxXGjANv+WBsg/Qn?=
 =?us-ascii?Q?VmvylaKX4VIEVFTTZFBSSMyR6XXiBW48qKA+Yqa/1DKItVk/ZNkdRCfGq0i1?=
 =?us-ascii?Q?DcFuGWmJXd7GOsFvAoen5+6PA0iOrYpdd0gIslem69H+bflBBAihQ2JAr/Qo?=
 =?us-ascii?Q?5I9f9jrEuv0syw4JGV8Yih25KoS2cyaF4BOCCeCjzz83kj9sJHHy5O1iLP+U?=
 =?us-ascii?Q?axxunjttzZ8k7lkY7ANcZ+UJqlIm1tf5IE1Xm94s9SvggQ0ln3DeonDT/qau?=
 =?us-ascii?Q?jPFu40hE8dUKCgCncJFMI6Tu5+Lz2/+mYUhGKB4NiYDfxCdY5QIdUjuKBFpt?=
 =?us-ascii?Q?VZU/kfspQWUXvycsfp4AI77mVex9pFA677X8jf/pPRvn6Z+0w0aY3/4zsSRf?=
 =?us-ascii?Q?hyIVYsoWNmLvrY3+A51auGxDA4gZsWjhx+CfXGFPmeOQ1xgNJsjsvyhgq2Hs?=
 =?us-ascii?Q?gd9IPsE4zECAjFtdymQLPQYWKI4FE4QZ4awtWSlOqeDRHx3I+pF9pzREefhs?=
 =?us-ascii?Q?LWNzcr33rkbOFEn2AwNcRrKnjjDPmTvtfz4ePq+J0K7hhq0Ir+TrRYWVeI7s?=
 =?us-ascii?Q?rRi5rDSmJObDXSgeVXxYt29UIesP3uO7d0XpOuUkGVHrwDquoiQBS52j2LC9?=
 =?us-ascii?Q?eaWhjNxYFj5G4iTSy6+rfEgqPkHaAalQD585SrjjfSjV6eNSeHd8XbDtyN8v?=
 =?us-ascii?Q?6B0mkeQDf8+1oeqh8dPc63KHGoWeEPo9Ti9S3tn2peulqv3ND68FrXYByksm?=
 =?us-ascii?Q?/S3SHTrSvf8MaKM+ZKPlbnj/AbhxsGpmlzP/JFxZFzaomiWnmktXx1eBuWAj?=
 =?us-ascii?Q?Jd4lzJ5nMmp7Q967yV4nIv6N?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02257a-0efe-452f-dbd9-08d8d8cdba8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 14:08:58.1118 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ADHYcuQtsy+Md5vPs+/oFCx0oys7VUzej1GaJ9JayxNZfmu7INYOAI3IINAi9Ycst5aQPVTKO4AcI/zDTcZhlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4013
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: multipart/mixed; boundary="===============0961628355=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0961628355==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MN2PR12MB4488303E601FF78D31CC76A7F79F9MN2PR12MB4488namp_"

--_000_MN2PR12MB4488303E601FF78D31CC76A7F79F9MN2PR12MB4488namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>
________________________________
From: Wei Yongjun <weiyongjun1@huawei.com>
Sent: Wednesday, February 24, 2021 4:49 AM
To: Hulk Robot <hulkci@huawei.com>; Wentland, Harry <Harry.Wentland@amd.com=
>; Li, Sun peng (Leo) <Sunpeng.Li@amd.com>; Deucher, Alexander <Alexander.D=
eucher@amd.com>; Koenig, Christian <Christian.Koenig@amd.com>; David Airlie=
 <airlied@linux.ie>; Daniel Vetter <daniel@ffwll.ch>; Kazlauskas, Nicholas =
<Nicholas.Kazlauskas@amd.com>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>=
; Pillai, Aurabindo <Aurabindo.Pillai@amd.com>; Wang, Chao-kai (Stylon) <St=
ylon.Wang@amd.com>; Lakha, Bhawanpreet <Bhawanpreet.Lakha@amd.com>; Bas Nie=
uwenhuizen <bas@basnieuwenhuizen.nl>; Simon Ser <contact@emersion.fr>; Zhuo=
, Qingqing <Qingqing.Zhuo@amd.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>; amd-gfx@lists.freedesktop.org <am=
d-gfx@lists.freedesktop.org>; dri-devel@lists.freedesktop.org <dri-devel@li=
sts.freedesktop.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kerne=
l.org>
Subject: [PATCH -next] drm/amd/display: Fix unused variable warning

GCC reports the following warning with W=3D1:

drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5439:33:
 warning: unused variable 'dm' [-Wunused-variable]
 5439 |  struct amdgpu_display_manager *dm =3D &adev->dm;
      |                                 ^~

This variable only used when CONFIG_DRM_AMD_DC_DCN is set, this
commit fix the warning.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index e24a13fd2730..bda8d5f4e56a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -5436,8 +5436,8 @@ static inline int dm_set_vblank(struct drm_crtc *crtc=
, bool enable)
         struct amdgpu_crtc *acrtc =3D to_amdgpu_crtc(crtc);
         struct amdgpu_device *adev =3D drm_to_adev(crtc->dev);
         struct dm_crtc_state *acrtc_state =3D to_dm_crtc_state(crtc->state=
);
-       struct amdgpu_display_manager *dm =3D &adev->dm;
 #if defined(CONFIG_DRM_AMD_DC_DCN)
+       struct amdgpu_display_manager *dm =3D &adev->dm;
         unsigned long flags;
 #endif
         int rc =3D 0;


--_000_MN2PR12MB4488303E601FF78D31CC76A7F79F9MN2PR12MB4488namp_
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
<p style=3D"font-family:Arial;font-size:11pt;color:#0078D7;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
Reviewed-by: Alex Deucher &lt;alexander.deucher@amd.com&gt;<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Wei Yongjun &lt;weiyo=
ngjun1@huawei.com&gt;<br>
<b>Sent:</b> Wednesday, February 24, 2021 4:49 AM<br>
<b>To:</b> Hulk Robot &lt;hulkci@huawei.com&gt;; Wentland, Harry &lt;Harry.=
Wentland@amd.com&gt;; Li, Sun peng (Leo) &lt;Sunpeng.Li@amd.com&gt;; Deuche=
r, Alexander &lt;Alexander.Deucher@amd.com&gt;; Koenig, Christian &lt;Chris=
tian.Koenig@amd.com&gt;; David Airlie &lt;airlied@linux.ie&gt;; Daniel
 Vetter &lt;daniel@ffwll.ch&gt;; Kazlauskas, Nicholas &lt;Nicholas.Kazlausk=
as@amd.com&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; Pillai,=
 Aurabindo &lt;Aurabindo.Pillai@amd.com&gt;; Wang, Chao-kai (Stylon) &lt;St=
ylon.Wang@amd.com&gt;; Lakha, Bhawanpreet &lt;Bhawanpreet.Lakha@amd.com&gt;=
;
 Bas Nieuwenhuizen &lt;bas@basnieuwenhuizen.nl&gt;; Simon Ser &lt;contact@e=
mersion.fr&gt;; Zhuo, Qingqing &lt;Qingqing.Zhuo@amd.com&gt;<br>
<b>Cc:</b> Wei Yongjun &lt;weiyongjun1@huawei.com&gt;; amd-gfx@lists.freede=
sktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; dri-devel@lists.freedeskto=
p.org &lt;dri-devel@lists.freedesktop.org&gt;; linux-kernel@vger.kernel.org=
 &lt;linux-kernel@vger.kernel.org&gt;<br>
<b>Subject:</b> [PATCH -next] drm/amd/display: Fix unused variable warning<=
/font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">GCC reports the following warning with W=3D1:<br>
<br>
drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm.c:5439:33:<br>
&nbsp;warning: unused variable 'dm' [-Wunused-variable]<br>
&nbsp;5439 |&nbsp; struct amdgpu_display_manager *dm =3D &amp;adev-&gt;dm;<=
br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
^~<br>
<br>
This variable only used when CONFIG_DRM_AMD_DC_DCN is set, this<br>
commit fix the warning.<br>
<br>
Reported-by: Hulk Robot &lt;hulkci@huawei.com&gt;<br>
Signed-off-by: Wei Yongjun &lt;weiyongjun1@huawei.com&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gp=
u/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
index e24a13fd2730..bda8d5f4e56a 100644<br>
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c<br>
@@ -5436,8 +5436,8 @@ static inline int dm_set_vblank(struct drm_crtc *crtc=
, bool enable)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_crtc *acrtc =
=3D to_amdgpu_crtc(crtc);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev=
 =3D drm_to_adev(crtc-&gt;dev);<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct dm_crtc_state *acrt=
c_state =3D to_dm_crtc_state(crtc-&gt;state);<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_display_manager *dm =3D=
 &amp;adev-&gt;dm;<br>
&nbsp;#if defined(CONFIG_DRM_AMD_DC_DCN)<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_display_manager *dm =3D=
 &amp;adev-&gt;dm;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned long flags;<br>
&nbsp;#endif<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc =3D 0;<br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB4488303E601FF78D31CC76A7F79F9MN2PR12MB4488namp_--

--===============0961628355==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0961628355==--
