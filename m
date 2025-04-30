Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E46C0AA471D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 11:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1479010E0EA;
	Wed, 30 Apr 2025 09:29:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WIKrnbrd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311D110E0EA;
 Wed, 30 Apr 2025 09:29:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kVNpH5LaMvQ5sYx66Rro0IpThbPZnKbjQdR9SWnKx+RDwaNU9tJo1/zCnpwPIJYJee83XI6S9NI7TXndkgjUTdpdeOiIG1WgbVg67kDud5sWx3UDBLhNw+3/TpGvjFysXmOxCxjyTe/5Ge+LC/gQlzRE/eifb1vDZUm1w26bu/eDwG8sGk8Bl0UZBwRPL/VptJKaqncVyu4qVGCO4nKjY6SEMUbAbAz8rcObPc/DC/wG3Aqemuj8tc717xiIgqTdndadodT5V0yCkqI6tIV1JQbbhTsloTaaK97F2+QscFWK6pp1NJIyLnUwYoIqH5ptymcRZxwe+Lv5ngCLX8uTlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vm7tcFIfrT1y1Mh+QkpbGd020vwpdH3XxIGLRvJlO0s=;
 b=A8MB8+arG0WQsqCwpWqsqX6gUAe8t+pfNdgKIBVVQfGK2E+0UYen2/P2X0+Ycpwm0xkK5IWYpw25Hew9GnJvRF4k4R3o4hHe0Kmykb0oK5MgiIVhJ34TM0jr+s1OdSWBitJk45zNNyaXpqcDBpwGrjUi+39StotDuHf/IN1uSm0MrnxsmN2PqbFHQYVmUcVs1hUe+4WjqzBfDU3dwJahjXOyc/49uFHpVTgooWaBdrhDIzyhBxrtAjmYa60ZIa3n5xUBPscBsUiCOJCVbM6LRlGt45CquBohKJn3CIn3HrfgVLRTSq0VF7qf1P/XhQK4kDfJjk5HGr8n6UdysVQaIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vm7tcFIfrT1y1Mh+QkpbGd020vwpdH3XxIGLRvJlO0s=;
 b=WIKrnbrd7TVrcgWZC5ildWtfKB8MJNzLHRM4iUUMzd/c+tDM0DPn9EN6BZk7gnjq9PfgThnSnL8VFmLrV80Pw28brRm6p7UQWs28jKDhEvU8qQ8DyyRzWCADcp8cztMGtUwSXffsMwv5tN3LRwio914PUF+FIb2+olRsy6J9nGg=
Received: from MW4PR12MB5667.namprd12.prod.outlook.com (2603:10b6:303:18a::10)
 by IA0PR12MB7580.namprd12.prod.outlook.com (2603:10b6:208:43b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 09:28:59 +0000
Received: from MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb]) by MW4PR12MB5667.namprd12.prod.outlook.com
 ([fe80::6216:e70a:9c8b:7abb%4]) with mapi id 15.20.8678.028; Wed, 30 Apr 2025
 09:28:59 +0000
From: "Sharma, Shashank" <Shashank.Sharma@amd.com>
To: Dan Carpenter <dan.carpenter@linaro.org>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>
CC: "Koenig, Christian" <Christian.Koenig@amd.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, "Khatri, Sunil"
 <Sunil.Khatri@amd.com>, "Yadav, Arvind" <Arvind.Yadav@amd.com>, "Paneer
 Selvam, Arunpravin" <Arunpravin.PaneerSelvam@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Thread-Topic: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check
Thread-Index: AQHbuaafXj+ToMha9UKDB0nXuzBGwbO77W5J
Date: Wed, 30 Apr 2025 09:28:59 +0000
Message-ID: <MW4PR12MB566769E097E394ED607DBD9CF2832@MW4PR12MB5667.namprd12.prod.outlook.com>
References: <aBHZuejTTKkdnGaZ@stanley.mountain>
In-Reply-To: <aBHZuejTTKkdnGaZ@stanley.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Enabled=True;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_SetDate=2025-04-30T09:28:58.835Z;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Name=AMD
 Internal Distribution
 Only; MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_ContentBits=0;
 MSIP_Label_dce362fe-1558-4fb5-9f64-8a6240d76441_Method=Standard; 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5667:EE_|IA0PR12MB7580:EE_
x-ms-office365-filtering-correlation-id: 8121cdc9-0bac-4a09-e216-08dd87c96fee
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?2dNxSdFeRIcQjr6Qo+G/zPVm0h0LqtCD8CUMEJ55F6e49BRPswcWH0htDa?=
 =?iso-8859-1?Q?XYQ0d//Yi2q/fvJkEamlkkoCZVgLpIDe73miYUfJ+lcV/vV0gToGD39PZZ?=
 =?iso-8859-1?Q?GYT4kA/kMs6RI5mi3N5SHMk5L8S5D9LWLUdKJMMI2URLC/S2zN6xZNAKQz?=
 =?iso-8859-1?Q?pDaUjF9pVszzdu9n4mdFoJ8Ca9wmyJKXz3uNxhgshbp+Aw7m1WAAtENxSi?=
 =?iso-8859-1?Q?d6XhNyzgcu6yFZgI5Lzn5umceUBTnS+9ot+otXtQIkFJv/Z74hnAdkKI2c?=
 =?iso-8859-1?Q?wrUH0SpwybIlj3kbZcR9ONvM1iIEMBGmJptHc1+RQPX6gfkWFg+4bokvZw?=
 =?iso-8859-1?Q?LnzspclT4Jkq8V3iiJ3hvVuCoRDX46PxYv8TBEvkmKAo/TNsQ9IYRO1Xle?=
 =?iso-8859-1?Q?ogRbHfKKoJ7MqQ3Z/2y/6ZfiGnf+IQP+jx4ketq1VnX9UicvBIqW04w7z1?=
 =?iso-8859-1?Q?TtGPJXAQ2dalNFHMyIHYIJ7eUi1Q0upXXuuUcpr4m1nffby4USLMqEj0Te?=
 =?iso-8859-1?Q?pfcfhj4SbXV6H92FTBpzEwmDDYTnQbBE3PZ/p0y6b4zTu0Zh9VBKnMpkqA?=
 =?iso-8859-1?Q?/4CzGSXCBtZ8QJywv3EjlioXppHp+4ovh8bbOaqVkhCgchp1bztqnyavPK?=
 =?iso-8859-1?Q?iPOs4sPnHsmA9dMvxpxGwj/jZJxClzDkDfKnqiWFgWEllEnj5NDwiDLHuK?=
 =?iso-8859-1?Q?+2CZo4F81NBw5rqgmH89Ay8S/EsgckC7/7XkNlmbZYIzQZXReABs3tbZji?=
 =?iso-8859-1?Q?2q3HyTZnmuDCiSD1yNrtL1Cq4nlxztq0+z18Knf3vUwly36aHqNPT8lzHr?=
 =?iso-8859-1?Q?zuUh2MzbfGCfOjCg3zmidhMOqRSluJPFAKiNsr7SHzJC7TabJ0PfD+bfAl?=
 =?iso-8859-1?Q?S4VCUWgcD1ARC3vLnHfEq2Thj+ShzWO5MUMqAJAcBBkpgEvaEp+dgiRCU0?=
 =?iso-8859-1?Q?k3vI6z4oFNrh8l+kRP9adLuSnKuAV0+CLo8ww/HM4W/0TifhB0lH+Rffer?=
 =?iso-8859-1?Q?8QjmXIXAg1QMuJjWZ77AgE9CWzxBRocoTdCbV3Ek3uKZ/bywjJg7371JWy?=
 =?iso-8859-1?Q?zG+SjQc1qxwfVHOvjidzumYUAECu7PpO6RpakrG+zUsK1HsNHZHyWmD40g?=
 =?iso-8859-1?Q?ZbFcj5ZIXVlNCf99dPvh9uDj72/gQ0bE6gkUMtfzMWypiaVjIUAQm0m66N?=
 =?iso-8859-1?Q?6NPwj4atZ3BMjPXQC8X8HtP1960vJmdrhKwZEnPBVjIdDt9J9QlSsZvCZK?=
 =?iso-8859-1?Q?PcFZ28keobZKUAX223Ec89B5HuBmvtYP7t+LNDLHchbf6xzMz/u85h0wMQ?=
 =?iso-8859-1?Q?Ny5hlGnFYnhtPtLHLFWmM7g8vRWg90DGxIrhl/Bsq7IyrRrZL/lqiOkoIj?=
 =?iso-8859-1?Q?mxbSThAao4DnpkgnN/f/V8XGLVTRhDOso/jDAfL6IBvra33yIwtwqwj2At?=
 =?iso-8859-1?Q?d2tHDngY/tSa44m8hKtJUs12At5Z+GL9nGeyKs/dLHgXafSBvUzSO5+OGS?=
 =?iso-8859-1?Q?/npGaqIqg4IafM/58BuaQEHBUuSPcYPVf7snA3Kjh5T6wC8azQBy2TNEZk?=
 =?iso-8859-1?Q?LbDefTw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR12MB5667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?lC3tOCw8ZZyh0uvGWOX0qz7+6aqUaadC+fHKvXME/LsxsPmWQEzBbkjrbZ?=
 =?iso-8859-1?Q?/P+y+y3AIRSSJMXZGwSQ7Gjz1ZShKzvZ3dqKWmrSUAp7m8b1p/igWte64e?=
 =?iso-8859-1?Q?G2ehUL9BUrXrRyQQV06nkd40HrlTfOO8iLi9QYHcf76JYrI+/k+yZZiyHg?=
 =?iso-8859-1?Q?fMjJUQDwZ1jMn9ZJ7+En68cHNXfkSvKAfG+1MOAms1MeC4n/BXCRf+E12+?=
 =?iso-8859-1?Q?9OvbhpYlm8TfjiMsUy5K+MwQcv+Tx208nzCGx7QU+bXri8n5aw7jqMsAjH?=
 =?iso-8859-1?Q?E39H0rQlSIOUrRsyJHPIxB1rvsraYN/u4vGgs3gdYZH9EHX5Ku3YtT74kf?=
 =?iso-8859-1?Q?57Oux+U2q3iGbrKd9bClpgl+Jk7AKpHqC1qHViMIZrhvzFoW1E8lqrs05a?=
 =?iso-8859-1?Q?HEiDKXO6uE6a+sIYyMIaCXo0U2AOI/oy7W9N/BGJ5w5+b9oADk4ebB5tOR?=
 =?iso-8859-1?Q?AeUKffoJlscfz3Bpmpl6NvICFeZmX/3yLTpX//Qgn+p3n0k/cKiS4lU/S8?=
 =?iso-8859-1?Q?YhoB0Q2vtQFst0p23lQAuOOHninJ0Fz+Mbo3wul+usMHbnYkkB87puWOMW?=
 =?iso-8859-1?Q?NzPMvivF95bEvioQkNykbooKrJX/lKHXChj8eWSydbFK/1VCOxCvni2/zA?=
 =?iso-8859-1?Q?NRIlhwTvgz/unq483CzD3Wck0DjoV9dQIvhYQ1C6If+7ZX29yUyJshGFwW?=
 =?iso-8859-1?Q?a/7AynVt7WbPdleG/IioCnRH0ssyoIAIaMkps2+grT78e6cJibc2877Tt6?=
 =?iso-8859-1?Q?gV4U/bJlqzPVMmBKfUEWktcuhay0lgXcNfZ6+N1Vwposu1mSOTZQSCFwpR?=
 =?iso-8859-1?Q?yR6JT8NhsH1my9DJEEUmserVDan+skawodh2t+XdQz6JiMYQt4nmgFbag6?=
 =?iso-8859-1?Q?1wFj/UBt//hTL0OE0+xL4lBWRX2auKG68YJWR7fmOWgJ7UQwv+I+u7x3ks?=
 =?iso-8859-1?Q?K7qar4RMO31PnbZ8IxVv0M+Rxg6LAkCEOJWWQLLo0W95avGhXp50MAaL6n?=
 =?iso-8859-1?Q?aclv0aniXlJ/uwXjs1DYeWTfSPnI6U8xXUEeIQlF1gnnoiSK6hDEWlko6M?=
 =?iso-8859-1?Q?SaupO0RYn9se594WYpn7/8a+3zIXN9Cdx2MAhbKWD3SgyBD84dV8G4UvHJ?=
 =?iso-8859-1?Q?NjlMWikVGieBC3KAWEpvSbTKllYhcDaeRFX3SVMCTy0gxQzW4b9lvr5pXJ?=
 =?iso-8859-1?Q?/hGUe3FeNaVJYJStQeK21Fqv9VNxtN5nP0sJ2ciWrRTvMd//Q+V087wmfj?=
 =?iso-8859-1?Q?/7UqDY0QSb1S0y5vYiGF+EjSZVmWmzi/GNFP6Mlem46Ze1NUCBanmkpWYC?=
 =?iso-8859-1?Q?ouWm5Gz4ma69C86DPAfF78jj1zSTWxr59lo/oOkG2ChHg/GYU5w0Ajm+PL?=
 =?iso-8859-1?Q?swkHvfhIH0CvipcznJ5jvCCi314iUXsFY4t5rEP1au+0+ovaiEuJcAPO15?=
 =?iso-8859-1?Q?9nU8c18aJMToJ2NvHlvL6470RHKxjUYjGZxHYMTuT2IYyjjkegW35WHiV6?=
 =?iso-8859-1?Q?vLMypCZnX9yjAAiyN3y77pM28JGnyiZCvghUFRjDJfabnCYx6IcSwhicoN?=
 =?iso-8859-1?Q?T0IunKMT/epFEv157QoXnGqYm6dQhPPPwp5DvogFEZ6zbYSVKbzhiYLnHd?=
 =?iso-8859-1?Q?zJoYQHWad0jgE=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MW4PR12MB566769E097E394ED607DBD9CF2832MW4PR12MB5667namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8121cdc9-0bac-4a09-e216-08dd87c96fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2025 09:28:59.2247 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Fqucf19/aY5Yzw4DYJM5VjKvTpkTqj/gobhjksW7YOf+VdU/53k5RRnzOLNbGDlNmj3Id1dBRTxysVIt3YAnrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7580
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

--_000_MW4PR12MB566769E097E394ED607DBD9CF2832MW4PR12MB5667namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - AMD Internal Distribution Only]

Hello Dan,

________________________________
From: Dan Carpenter
Sent: Wednesday, April 30, 2025 10:05 AM
To: Deucher, Alexander
Cc: Koenig, Christian; David Airlie; Simona Vetter; Sharma, Shashank; Khatr=
i, Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lists.freedeskt=
op.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org; kern=
el-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu/userq: remove unnecessary NULL check

The "ticket" pointer points to in the middle of the &exec struct so it
can't be NULL.  Remove the check.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_userq.c
index b0e8098a3988..7505d920fb3d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c
@@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_m=
gr)
                         clear =3D false;
                         unlock =3D true;
                 /* The caller is already holding the reservation lock */
-               } else if (ticket && dma_resv_locking_ctx(resv) =3D=3D tick=
et) {
+               } else if (dma_resv_locking_ctx(resv) =3D=3D ticket) {

Its a Nack for me, There are a few situations (particularly during the firs=
t launch of the desktop, and also when eviction fence and new queue creatio=
n are working in parallel) where this ticket can be NULL, we observed it du=
ring the stress validation and hence added this check,

Regards,
Shashank


                         clear =3D false;
                         unlock =3D false;
                 /* Somebody else is using the BO right now */
--
2.47.2


--_000_MW4PR12MB566769E097E394ED607DBD9CF2832MW4PR12MB5667namp_
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
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[AMD Official Use Only - AMD Internal Distribution Only]<br>
</p>
<br>
<div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
Hello Dan,</div>
<div class=3D"elementToProof" style=3D"font-family: Calibri, Arial, Helveti=
ca, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Dan Carpenter<br>
<b>Sent:</b>&nbsp;Wednesday, April 30, 2025 10:05 AM<br>
<b>To:</b>&nbsp;Deucher, Alexander<br>
<b>Cc:</b>&nbsp;Koenig, Christian; David Airlie; Simona Vetter; Sharma, Sha=
shank; Khatri, Sunil; Yadav, Arvind; Paneer Selvam, Arunpravin; amd-gfx@lis=
ts.freedesktop.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kern=
el.org; kernel-janitors@vger.kernel.org<br>
<b>Subject:</b>&nbsp;[PATCH] drm/amdgpu/userq: remove unnecessary NULL chec=
k </div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">The &quot;ticket&q=
uot; pointer points to in the middle of the &amp;exec struct so it<br>
can't be NULL.&nbsp; Remove the check.<br>
<br>
Signed-off-by: Dan Carpenter &lt;dan.carpenter@linaro.org&gt;<br>
---<br>
&nbsp;drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_userq.c<br>
index b0e8098a3988..7505d920fb3d 100644<br>
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c<br>
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c<br>
@@ -631,7 +631,7 @@ amdgpu_userq_validate_bos(struct amdgpu_userq_mgr *uq_m=
gr)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear=
 =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unloc=
k =3D true;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* The caller is already holding the reservation lock=
 */<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (ticket &amp;&amp; dma_resv_locking_ctx(resv) =3D=3D t=
icket) {<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; } else if (dma_resv_locking_ctx(resv) =3D=3D ticket) {</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Its a Nack for me, There are a few situations (particularly during the firs=
t launch of the desktop, and also when eviction fence and new queue creatio=
n are working in parallel) where this ticket can be NULL, we observed it du=
ring&nbsp;the stress validation and hence
 added this check,&nbsp;</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, C=
alibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; =
margin-right: 0px; margin-left: 0px; font-family: Aptos, Aptos_EmbeddedFont=
, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 11pt; col=
or: rgb(0, 0, 0);">
Shashank</div>
<div style=3D"font-size: 11pt; color: rgb(0, 0, 0);"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"elementToProof" style=3D"font-size: 11pt;">&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; clear =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unloc=
k =3D false;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; /* Somebody else is using the BO right now */<br>
--<br>
2.47.2<br>
<br>
</div>
</div>
</body>
</html>

--_000_MW4PR12MB566769E097E394ED607DBD9CF2832MW4PR12MB5667namp_--
