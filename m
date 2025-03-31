Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC79A7621E
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 10:29:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF95A10E0D3;
	Mon, 31 Mar 2025 08:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=analogixsemi.com header.i=@analogixsemi.com header.b="ItvvSVTT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2100.outbound.protection.outlook.com [40.107.220.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A691610E0D3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 08:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXe5+QsGVFglbCW6k9C54rJ6uGsrEv0p7XoILzy5QrpGTPKl37LFlXsj0YC+xDzPi9jCU4Mdiv7OHgaCWw3znFL8gIyN+r9w+pNW085OKnO7zXRbLtl5+OFEjioUx+xGx2GKyQv12wYsodwzlDayxxKSxr79AL9CIKy+hMhmnNXQmRtVzLBNPFLWNKBDsU+O+g2rmx00ifLrmF22mvVSVOaDnizUoDrly83laHpusSC7qzowMfp74Rt8FDv4BDwWxacciH1l0qHdWTtkXgnjxV/mgSOGQ9lOdZj0Pig5bwr/Wo9ZWHqZF29AIIHXalC9W8bJAc5W9f1Xe9HIudth6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9UsE4Yak58ZUE5ur0eFajCQfnVWiPm/YAGjeqOIG/TY=;
 b=re9yL/cIYN8dBbrKjTn2FsQwrt/skHIpTsrE5F5poDQ0Ele0AkrjbIiuW5oC+2x2cXKEBdkelkfDAcOtbR1Orb4xwRV98IDPl5bHhgI7e+k1cdqKC4Rha7Lb6TBLG0eaLecUk66ddq++DdyQW9lURWf7CfLDt46VdPeeiB+Hd9oIJNJ0QiZhj5PgT8sdHLRW2RBQ7jBQIIcTlJ69HahrinElhw80A9ouB9zxpoIDCXN96coltKcRuBS1bi/u5anWxLe+0KNUEg4WDkbYh4FcsE/1EXngxgLG/RPVdm8/GrzRmYDKCyG3hE/71zrhOvsNlZ2AeItZPBMx8sSoQ2lwGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analogixsemi.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9UsE4Yak58ZUE5ur0eFajCQfnVWiPm/YAGjeqOIG/TY=;
 b=ItvvSVTT6RTMg/QbuAFR2EJzpw1124nJER+qZ83wbJkK8b3tF0AdkHhLLHrcRKA7Oi5oKnYAMMiWw+cB7hSd3n0XDfWeFpHvr73BSfEEWVRkjBQ9uiUSJR1Gjv4SFvkDXbTLqI519jBcpkJyyOYxYEkjN5UhhBktR9e8uEO8KKA=
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by SA1PR04MB9042.namprd04.prod.outlook.com (2603:10b6:806:388::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 08:29:35 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5a7e:9e8c:138f:1815%5]) with mapi id 15.20.8534.048; Mon, 31 Mar 2025
 08:29:35 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bernie Liang <bliang@analogixsemi.com>,
 Qilin Wen <qwen@analogixsemi.com>, "treapking@chromium.org"
 <treapking@chromium.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Thread-Topic: [PATCH v2] drm/bridge:anx7625: Enable DSC feature
Thread-Index: AQHbnw9SQTT4hmIf/0SCVgI7dUd8+LOL9jcAgADH4BCAACCmAIAACDwAgAAFJvA=
Date: Mon, 31 Mar 2025 08:29:35 +0000
Message-ID: <BY5PR04MB67398ABD41B3BACED4423EEBC7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
References: <20250327115616.1271635-1-xji@analogixsemi.com>
 <gs2pn7o33hjzfpljzjprorof3xehhui5mvsrbnnpu4gwyncw5u@zvlez4dpgv3f>
 <BY5PR04MB6739BEDCE701FBC346106E21C7AD2@BY5PR04MB6739.namprd04.prod.outlook.com>
 <z5uepwsk6t6j5zlkrfrkcuodcmx477b7wr7smziwj4nf3avhv2@p7bqiun4yxb7>
 <wbk5c34lxywu7h6ffi3j372mmax24w7umxke6pun2nqceug6gq@yxlp4fxezkno>
In-Reply-To: <wbk5c34lxywu7h6ffi3j372mmax24w7umxke6pun2nqceug6gq@yxlp4fxezkno>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR04MB6739:EE_|SA1PR04MB9042:EE_
x-ms-office365-filtering-correlation-id: 2171048d-99da-4c6d-479d-08dd702e2b58
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?wzMmJ5Q74iRtPJ0CHE5foFfVOttGrfcvBPt4q5HAMHcmrLsmYFGbhCRsKibB?=
 =?us-ascii?Q?rh1zvF9hAxJkUB+o62L98HS++du3AS/rCHcnqUvTW4OUgvDSpHBvxzgubb8D?=
 =?us-ascii?Q?1EtS9zzDjFXnWKMTqSoI7KhQH7WxIEyhtrCBYwhfSyHzROthvzXsLooLoYZk?=
 =?us-ascii?Q?1gteN1XWffx8af7zZdylUrMv7RGh0hwhpsjLF/2+7Q5tj15xMYfEkhhiu/dp?=
 =?us-ascii?Q?7UmjCSFXGXRv1k5agZx9zJQC0fasllWMRnf0DYFG8sCrs8rvVGRvjokeX7N7?=
 =?us-ascii?Q?/phtCzaUoSbHXXYjGVKsNb78BFJ4E+a9sR5Z4Oux+anyUS9OUZ9tzGIAcdrK?=
 =?us-ascii?Q?qadBoxTQo0le9BB3st6VmUPOKqo49+Ze30pLe9RU2qNzF5xmtUNxEGdvBLA6?=
 =?us-ascii?Q?mcXCdOZEfYLymRQ2RCKfgN+kmuMmlwJDrMJP1G58cVPAYn9KxfuIvy9YyC4y?=
 =?us-ascii?Q?QoRpKEBEsFjieWs5g5yN0LyoIn1hkZcnvZKvvRYMp+AhCAFzt9gG3WDtH0mL?=
 =?us-ascii?Q?3Q5OveZGZvL0peZ4UUeL3miai3vIGEMLBBH3Pz7fD5xxCURVZmtiU4aaGTwx?=
 =?us-ascii?Q?Uaxmcb3Qq/LUjyqPZ2CNM7+6WD4one2jFjYR+iNONxUxxO1kXUtvUQHd7tKI?=
 =?us-ascii?Q?j+H0XJBfMtb0w5Bm/7ORiIoxfm5qMkbv8bjfLrKwJPMmCFKmODRb/d2uVwSR?=
 =?us-ascii?Q?47+ZACnefzFsGyOHWRK/vvS2hShQniMojn/qFQuo1JD9XFtYwhwledrWv+7H?=
 =?us-ascii?Q?5AjyS3V7WmIJaA7NdXnb3QABcNszQvSMNnnUtbfzwCUbd/5MdBlfjP80Sgq0?=
 =?us-ascii?Q?AMA1aHmDuiAEXcSg+dZsN8lVS7GxK2S3E5ukejdWbF85Fbo4RSWMt1rc0bqa?=
 =?us-ascii?Q?NHChaPxU99RyDHm1hUePZZkdRVvPiWLHyCZhYlIw0drYelKYx0xYhXtr2pOC?=
 =?us-ascii?Q?ZTqMBjtzpUqnO8cw9XScNyVKJK/DwD0JOr/SIBZ3AmVBupUy/LGI8GCkPYG+?=
 =?us-ascii?Q?/6ufxUFuVrN39AQABL1ZKKExII6IH2LM3mWBdkl0dFWJRE0ur2qz7oUMMAWS?=
 =?us-ascii?Q?QoOhHIMWtc4CFKptxwsgx0S3fdnW9bSBcgcc3Jn3buZQZdCVN0WTxpWft6aU?=
 =?us-ascii?Q?rySLdHgnfZ70Iv5VKw6jNxG0WwX2m/mip01tZz21tG/Wd5qVGe0lXGEgUnF6?=
 =?us-ascii?Q?9mhy0al8KFbM0swp4LButZ6bDjXvNZHL+QHpy3rJY64cVVHF4hb3sZ13XAOG?=
 =?us-ascii?Q?E840MJ1TXEw3zFSQtyvgf3Ra82ly5bviquQ1yFJtiHLQdpaeXyOT7YBD2LtW?=
 =?us-ascii?Q?RJJR2Rz+jjDPfpWvi3LH0lkmLboGxnkbwZ/0+U8GqJ1JsIAlj6L+ZztxZTeV?=
 =?us-ascii?Q?UNz9YUvSKjUE6jwanReONBGQQX8TXZyNBiRR3mrUJeCVE3NvQkCdEL9xlTJg?=
 =?us-ascii?Q?cJCc2/DD+UUbu8KqDThrRKqkdM4dGPOL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?n7MXP1vlGecggX8apRAPGNltWE8nOxJ0K/VhaBTsrPg3PpcYKhaDtWscImoC?=
 =?us-ascii?Q?ewVCDpjt++kYWDBbF7ndnWnSUsGb1FsSH0wwkyLBnitAkCL3TeK7p15s2qeK?=
 =?us-ascii?Q?y91gvblN1fLyckzfu3/Ul/58VVvTFhpFoVaFA45EEzobpqp2Ef4uri6jhNv2?=
 =?us-ascii?Q?2xwAKMyyE0Yr2/1kYe8q/8Pm8gZtO8v0gIAdX9h5MLOljmaY+iNY/2N0dJa5?=
 =?us-ascii?Q?fwyAKZNX6biWbnRuIWQVn3ZQwdcmPlpO6gy/kERGsgRPArJB8cV588+/gs1i?=
 =?us-ascii?Q?i6BXh7B9CeSF04rROARouzIPhFNGT3guEkL1Y63Ry21ifNx1VUMyWvOCIBNJ?=
 =?us-ascii?Q?aobxTN8UXcARRGXSVwcGC5IqEqYqi0bOzQr4taEZSY1twuhEnnK2eFlRSLBJ?=
 =?us-ascii?Q?/pRSwpPMb4NA24uuGW+W/5kZSQhzp4maiM8SvzkTHhf6bhFdrSZGyVfJCRwZ?=
 =?us-ascii?Q?v/mflgR1AbgoVrdOGz33UmXy30hRvT/aIW64wT2J2/BidqodybN0oOY7iQ/B?=
 =?us-ascii?Q?yTFknifiPpDbrTbw8A6oYr6ZZ8XxoyiVfZ+sBvlyDX//lc8lAEJsiLzu0Wbv?=
 =?us-ascii?Q?TZbqv+SzD8nrcS7kSY7CGM+kXKrzrz0yt2I0QiG6yNwXM0/nqtqnp9Lev9IX?=
 =?us-ascii?Q?rGEbWthMMViUR1Pb8Kx4Ev1MvNUz4etgNiWEuCw0lWTQBIxlbznSfARl5ylE?=
 =?us-ascii?Q?hbjf7VCAjoJ9xMe9iJJ8HE704S2ycq3lab0BW7Wq0Y99xHlsTQ+paEazTbR4?=
 =?us-ascii?Q?TxCEAhj5hR4UxIHOnrADqd/7jVXSBQwio7t4ibhMEbkzFIwWE6uALNZvkNWi?=
 =?us-ascii?Q?9irKcvvMt2PIFF3crizAnerqyPZ6PC1WRRHoBG6OMoooa74c8uIhWEqggrPw?=
 =?us-ascii?Q?tDj/XAWs6Iv1M8A/SqdFWWr7E6GYfYN7FJOrTHq4DEpm39pNoX6b8F8vJt9F?=
 =?us-ascii?Q?BPN5/T/QgM0MVTLbE/ncnfedtX+wm3W0n+xtBur7ZF4QbbTrMpFUWk+E33jm?=
 =?us-ascii?Q?x/Fsc4zX5hgglgH7sWq+UPEUoATI/rhyndqeUbQDPjtvERzkqgcufMEU1jve?=
 =?us-ascii?Q?XLUKosHSL++q2HZOo1woU9s3FUasDr+G4WQ9GNhrS23xpMx8Ztj9eE3Pg4Nr?=
 =?us-ascii?Q?ByEULSFldoCYvIBiocfx0K6MhyOrqJYf59vRDRALPdJM4Hxvcia8i3bKsNpN?=
 =?us-ascii?Q?pav1PNPzM5boovSOknin/Tmmh4PgpzePjJoMfa5CuJcleQHL8jxco4QOXTbh?=
 =?us-ascii?Q?wrSK0eSnr8DQ+V5IZTWqxPD4I9HAqZN6yM8ZZREgmahflyUaCpTWz2JidgiN?=
 =?us-ascii?Q?/2zLlOkTzH/pfe12nIn90kPbgfiOlLt/JJji1Iu8Zx9khg5WSXh219R9D+i6?=
 =?us-ascii?Q?9yXHSz0ZENyDtXQuz6dZ9HyH3n4L/ZyjRwpdLUaJVW26j5D5NNA3jm1U6MzI?=
 =?us-ascii?Q?vOQ7Mwa7/z4DquwdI04fKFrsoRV72P9YZkhIJVw6+VK7L5jAoyf/RKFiHEs2?=
 =?us-ascii?Q?04VZGVCbVztZVkvNFmCONg8vVkMii2jTEl0AzuHeHRNS19lULNteUD0tvqE8?=
 =?us-ascii?Q?IelVwpvqplAOJBzGjBRjD+xuLDqrojC0b2FT9Ig1?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2171048d-99da-4c6d-479d-08dd702e2b58
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Mar 2025 08:29:35.4075 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z/ggLNM7ua9QtxaKdXFs49sKzlRZiEm0rqc/UDWdaqSrioZTdr+oa+QgjQrE5SDp2bHK10LiWx8tI9RZ+1u/Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR04MB9042
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

> > > > > 4K30(3840x2160 30Hz) timing pixel clock around 297M, for 24bits
> > > > > RGB pixel data format, total transport bandwidth need 297M*24(at
> > > > > least
> > > > > 7.2Gbps) more than anx7625 mipi rx lane bandwidth(maximum 6Gbps,
> > > > > 4lanes, each lane 1.5Gbps). Without DSC function, anx7625 cannot
> > > > > receive 4K30 video timing.
> > > > >
> > > > > When display pixel clock exceed 250M, driver will enable DSC
> > > > > feature, and the compression ratio is 3:1, eg: 4K30's pixel
> > > > > clock around 297M, bandwidth 7.2G will be compressed to 7.2G/3 =
=3D
> > > > > 2.4G. Then anx7625 can receive 4K30 video timing and do
> > > > > decompress, then package video data and send to sink device throu=
gh DP
> link.
> > > > >
> > > > > Anx7625 is bridge IC, sink monitor only receive normal DP signal
> > > > > from anx7625, sink device didn't know DSC information between
> > > > > SOC and
> > > > > anx7625
> > > > >
> > > > > v2:
> > > > > 1. Add more commit message
> > > > > 2. Remove unused code
> > > > > 3. Add more comment
> > > >
> > > > This part is useless, it adds no information. It is as good as 'cha=
nged it'.
> > > OK, I'll remove it
> > > >
> > > > > 4. Remove dsc_en flag
> > > > >
> > > > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > > > ---
> > > > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 299
> > > > > ++++++++++++++++++----
> > > > > ++++++++++++++++++drivers/gpu/drm/bridge/analogix/anx7625.h |
> > > > > 31 +++
> > > > >  2 files changed, 274 insertions(+), 56 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > index 4be34d5c7a3b..bae76d9a665f 100644
> > > > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > > > @@ -9,6 +9,7 @@
> > > > >  #include <linux/interrupt.h>
> > > > >  #include <linux/iopoll.h>
> > > > >  #include <linux/kernel.h>
> > > > > +#include <linux/math64.h>
> > > > >  #include <linux/module.h>
> > > > >  #include <linux/mutex.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > > @@ -22,6 +23,7 @@
> > > > >
> > > > >  #include <drm/display/drm_dp_aux_bus.h>  #include
> > > > > <drm/display/drm_dp_helper.h>
> > > > > +#include <drm/display/drm_dsc_helper.h>
> > > > >  #include <drm/display/drm_hdcp_helper.h>  #include
> > > > > <drm/drm_atomic_helper.h>  #include <drm/drm_bridge.h> @@
> > > > > -476,11
> > > > > +478,159 @@ static int anx7625_set_k_value(struct anx7625_data
> > > > > +*ctx)
> > > > >                                MIPI_DIGITAL_ADJ_1, 0x3D);  }
> > > > >
> > > > > +static bool anx7625_dsc_check(struct anx7625_data *ctx) {
> > > > > +     if (ctx->dt.pixelclock.min > DSC_PIXEL_CLOCK)
> > > > > +             return true;
> > > >
> > > > So, now DSC is enabled unconditionally just because the clock is
> > > > too high. Let's see...
> > > Yes
> > > >
> > > > > +
> > > > > +     return false;
> > > > > +}
> > > > > +
> > > > > +static inline int anx7625_h_timing_reg_write(struct anx7625_data=
 *ctx,
> > > > > +                                          struct i2c_client *cli=
ent,
> > > > > +                                          u8 reg_addr, u16 val,
> > > > > +                                          bool dsc_check) {
> > > > > +     int ret;
> > > > > +
> > > > > +     if (dsc_check && anx7625_dsc_check(ctx))
> > > > > +             val =3D dsc_div(val);
> > > > > +
> > > > > +     ret =3D anx7625_reg_write(ctx, client, reg_addr, val);
> > > > > +     ret |=3D anx7625_reg_write(ctx, client, reg_addr + 1, val >=
>
> > > > > + 8);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static int anx7625_h_timing_write(struct anx7625_data *ctx,
> > > > > +                               struct i2c_client *client,
> > > > > +                               bool rx_h_timing) {
> > > > > +     u16 htotal;
> > > > > +     int ret;
> > > > > +
> > > > > +     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > > +                      ctx->dt.hback_porch.min + ctx->dt.hsync_le=
n.min;
> > > > > +     /* Htotal */
> > > > > +     ret =3D anx7625_h_timing_reg_write(ctx, client,
> > > > HORIZONTAL_TOTAL_PIXELS_L,
> > > > > +                                      htotal, rx_h_timing);
> > > > > +     /* Hactive */
> > > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > > HORIZONTAL_ACTIVE_PIXELS_L,
> > > > > +                                       ctx->dt.hactive.min, rx_h=
_timing);
> > > > > +     /* HFP */
> > > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > > HORIZONTAL_FRONT_PORCH_L,
> > > > > +                                       ctx->dt.hfront_porch.min,=
 rx_h_timing);
> > > > > +     /* HWS */
> > > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > > HORIZONTAL_SYNC_WIDTH_L,
> > > > > +                                       ctx->dt.hsync_len.min, rx=
_h_timing);
> > > > > +     /* HBP */
> > > > > +     ret |=3D anx7625_h_timing_reg_write(ctx, client,
> > > > HORIZONTAL_BACK_PORCH_L,
> > > > > +                                       ctx->dt.hback_porch.min,
> > > > > + rx_h_timing);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static int anx7625_v_timing_write(struct anx7625_data *ctx,
> > > > > +                               struct i2c_client *client) {
> > > > > +     int ret;
> > > > > +
> > > > > +     /* Vactive */
> > > > > +     ret =3D anx7625_reg_write(ctx, client, ACTIVE_LINES_L,
> > > > > +                             ctx->dt.vactive.min);
> > > > > +     ret |=3D anx7625_reg_write(ctx, client, ACTIVE_LINES_H,
> > > > > +                              ctx->dt.vactive.min >> 8);
> > > > > +     /* VFP */
> > > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_FRONT_PORC=
H,
> > > > > +                              ctx->dt.vfront_porch.min);
> > > > > +     /* VWS */
> > > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_SYNC_WIDTH=
,
> > > > > +                              ctx->dt.vsync_len.min);
> > > > > +     /* VBP */
> > > > > +     ret |=3D anx7625_reg_write(ctx, client, VERTICAL_BACK_PORCH=
,
> > > > > +                              ctx->dt.vback_porch.min);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > > +static int anx7625_set_dsc_params(struct anx7625_data *ctx) {
> > > > > +     int ret, i;
> > > > > +     u16 htotal, vtotal;
> > > > > +
> > > > > +     if (!anx7625_dsc_check(ctx))
> > > > > +             return 0;
> > > > > +
> > > > > +     /* Video Horizontal timing */
> > > > > +     ret =3D anx7625_h_timing_write(ctx, ctx->i2c.tx_p2_client,
> > > > > + false);
> > > > > +
> > > > > +     /* Video Vertical timing */
> > > > > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.tx_p2_client)=
;
> > > > > +
> > > > > +     /* Vtotal */
> > > > > +     vtotal =3D ctx->dt.vactive.min + ctx->dt.vfront_porch.min +
> > > > > +              ctx->dt.vback_porch.min + ctx->dt.vsync_len.min;
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTA=
L_LINES_L,
> > > > > +                              vtotal);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.tx_p2_client, TOTA=
L_LINES_H,
> > > > > +                              vtotal >> 8);
> > > > > +     /* Htotal */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> TOTAL_PIXEL_L_7E,
> > > > > +                              htotal);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> TOTAL_PIXEL_H_7E,
> > > > > +                              htotal >> 8);
> > > > > +     /* Hactive */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              ACTIVE_PIXEL_L_7E, ctx->dt.hactive=
.min);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              ACTIVE_PIXEL_H_7E, ctx->dt.hactive=
.min >> 8);
> > > > > +     /* HFP */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_FRONT_PORCH_L_7E,
> > > > > +                              ctx->dt.hfront_porch.min);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_FRONT_PORCH_H_7E,
> > > > > +                              ctx->dt.hfront_porch.min >> 8);
> > > > > +     /* HWS */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_SYNC_WIDTH_L_7E,
> > > > > +                              ctx->dt.hsync_len.min);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_SYNC_WIDTH_H_7E,
> > > > > +                              ctx->dt.hsync_len.min >> 8);
> > > > > +     /* HBP */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_BACK_PORCH_L_7E,
> > > > > +                              ctx->dt.hback_porch.min);
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> > > > > +                              HORIZON_BACK_PORCH_H_7E,
> > > > > +                              ctx->dt.hback_porch.min >> 8);
> > > > > +
> > > > > +     /* Config DSC decoder internal blank timing for decoder to =
start */
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > +                              H_BLANK_L,
> > > > > +                              dsc_div(htotal - ctx->dt.hactive.m=
in));
> > > > > +     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > > +                              H_BLANK_H,
> > > > > +                              dsc_div(htotal -
> > > > > + ctx->dt.hactive.min)
> > > > > + >> 8);
> > > > > +
> > > > > +     /* Compress ratio  RATIO bit[7:6] */
> > > > > +     ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client, R_I2=
C_1, 0x3F);
> > > > > +     ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_client, R_I2C=
_1,
> > > > > +                             (5 - DSC_COMPRESS_RATIO) << 6);
> > > > > +     /*PPS table*/
> > > > > +     for (i =3D 0; i < PPS_SIZE; i +=3D PPS_BLOCK_SIZE)
> > > > > +             ret |=3D anx7625_reg_block_write(ctx, ctx->i2c.rx_p=
2_client,
> > > > > +                                            R_PPS_REG_0 + i, PPS=
_BLOCK_SIZE,
> > > > > +
> > > > > + &ctx->pps_table[i]);
> > > > > +
> > > > > +     return ret;
> > > > > +}
> > > > > +
> > > > >  static int anx7625_dsi_video_timing_config(struct anx7625_data
> > > > > *ctx) {
> > > > >       struct device *dev =3D ctx->dev;
> > > > >       unsigned long m, n;
> > > > > -     u16 htotal;
> > > > >       int ret;
> > > > >       u8 post_divider =3D 0;
> > > > >
> > > > > @@ -506,48 +656,12 @@ static int
> > > > > anx7625_dsi_video_timing_config(struct
> > > > anx7625_data *ctx)
> > > > >       ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
> > > > >                               MIPI_LANE_CTRL_0,
> > > > > ctx->pdata.mipi_lanes
> > > > > - 1);
> > > > >
> > > > > -     /* Htotal */
> > > > > -     htotal =3D ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
> > > > > -             ctx->dt.hback_porch.min + ctx->dt.hsync_len.min;
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_TOTAL_PIXELS_L, htotal & 0xFF);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_TOTAL_PIXELS_H, htotal >> 8);
> > > > > -     /* Hactive */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_ACTIVE_PIXELS_L, ctx->dt.hactive=
.min & 0xFF);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_ACTIVE_PIXELS_H, ctx->dt.hactive=
.min >> 8);
> > > > > -     /* HFP */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_FRONT_PORCH_L, ctx->dt.hfront_po=
rch.min);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_FRONT_PORCH_H,
> > > > > -                     ctx->dt.hfront_porch.min >> 8);
> > > > > -     /* HWS */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_SYNC_WIDTH_L, ctx->dt.hsync_len.=
min);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_SYNC_WIDTH_H, ctx->dt.hsync_len.=
min >> 8);
> > > > > -     /* HBP */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_BACK_PORCH_L, ctx->dt.hback_porc=
h.min);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     HORIZONTAL_BACK_PORCH_H, ctx->dt.hback_porc=
h.min >>
> 8);
> > > > > -     /* Vactive */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTI=
VE_LINES_L,
> > > > > -                     ctx->dt.vactive.min);
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client, ACTI=
VE_LINES_H,
> > > > > -                     ctx->dt.vactive.min >> 8);
> > > > > -     /* VFP */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     VERTICAL_FRONT_PORCH, ctx->dt.vfront_porch.=
min);
> > > > > -     /* VWS */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     VERTICAL_SYNC_WIDTH, ctx->dt.vsync_len.min)=
;
> > > > > -     /* VBP */
> > > > > -     ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p2_client,
> > > > > -                     VERTICAL_BACK_PORCH, ctx->dt.vback_porch.mi=
n);
> > > > > +     /* Video Horizontal timing */
> > > > > +     ret |=3D anx7625_h_timing_write(ctx, ctx->i2c.rx_p2_client,
> > > > > + true);
> > > > > +
> > > > > +     /* Video Vertical timing */
> > > > > +     ret |=3D anx7625_v_timing_write(ctx, ctx->i2c.rx_p2_client)=
;
> > > > > +
> > > >
> > > > Please split this part into two commits: one refactoring timing
> > > > programming into two functions and another one introducing DSC supp=
ort.
> > > > It is hard to review timing programming otherwise.
> > >
> > > OK
> > >
> > > >
> > > > >       /* M value */
> > > > >       ret |=3D anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> > > > >                       MIPI_PLL_M_NUM_23_16, (m >> 16) & 0xff);
> > > > > @@
> > > > > -663,9 +777,15 @@ static int anx7625_dsi_config(struct
> > > > > anx7625_data
> > > > > *ctx)
> > > > >
> > > > >       DRM_DEV_DEBUG_DRIVER(dev, "config dsi.\n");
> > > > >
> > > > > -     /* DSC disable */
> > > > > -     ret =3D anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> > > > > -                             R_DSC_CTRL_0, ~DSC_EN);
> > > > > +     ret =3D anx7625_set_dsc_params(ctx);
> > > > > +     if (anx7625_dsc_check(ctx))
> > > > > +             /* DSC enable */
> > > > > +             ret |=3D anx7625_write_or(ctx, ctx->i2c.rx_p0_clien=
t,
> > > > > +                                     R_DSC_CTRL_0, DSC_EN);
> > > > > +     else
> > > > > +             /* DSC disable */
> > > > > +             ret |=3D anx7625_write_and(ctx, ctx->i2c.rx_p0_clie=
nt,
> > > > > +                                      R_DSC_CTRL_0, ~DSC_EN);
> > > > >
> > > > >       ret |=3D anx7625_api_dsi_config(ctx);
> > > > >
> > > > > @@ -2083,6 +2203,7 @@ static int anx7625_setup_dsi_device(struct
> > > > anx7625_data *ctx)
> > > > >               MIPI_DSI_MODE_VIDEO_HSE |
> > > > >               MIPI_DSI_HS_PKT_END_ALIGNED;
> > > > >
> > > > > +     dsi->dsc =3D &ctx->dsc;
> > > > >       ctx->dsi =3D dsi;
> > > > >
> > > > >       return 0;
> > > > > @@ -2187,19 +2308,69 @@ anx7625_bridge_mode_valid(struct
> > > > > drm_bridge
> > > > *bridge,
> > > > >       struct device *dev =3D ctx->dev;
> > > > >
> > > > >       DRM_DEV_DEBUG_DRIVER(dev, "drm mode checking\n");
> > > > > +     if (mode->clock > SUPPORT_PIXEL_CLOCK)
> > > > > +             return MODE_CLOCK_HIGH;
> > > > > +
> > > > > +     if (mode->clock < SUPPORT_MIN_PIXEL_CLOCK)
> > > > > +             return MODE_CLOCK_LOW;
> > > > >
> > > > > -     /* Max 1200p at 5.4 Ghz, one lane, pixel clock 300M */
> > > > > -     if (mode->clock > SUPPORT_PIXEL_CLOCK) {
> > > > > -             DRM_DEV_DEBUG_DRIVER(dev,
> > > > > -                                  "drm mode invalid, pixelclock =
too high.\n");
> > > >
> > > > Any reason for dropping debug message?
> > >
> > > I'll keep this message.
> > >
> > > >
> > > > > +     /*
> > > > > +      * If hdisplay cannot be divided by DSC compress ratio, the=
n display
> > > > > +      * will have overlap/shift issue
> > > > > +      */
> > > > > +     if (mode->clock > DSC_PIXEL_CLOCK &&
> > > > > +         (mode->hdisplay % DSC_COMPRESS_RATIO !=3D 0))
> > > >
> > > >
> > > > ... and there still no check that the DSI host supports generating
> > > > DSC data. Nor there is an atomic_check() that will check if the mod=
e can be
> enabled.
> > >
> > > I cannot know whether the DSI host supports DSC or not. Anx7625
> > > driver force enable DSC feature if pixel clock higher than DSC_PIXEL_=
CLOCK.
> >
> > This is called upstream. Please work on necessary API changes rather
> > than claiming that it is not possible. Enabling DSC support when DSC
> > is not handled by the DSI host is not acceptable.
> >
> > Few semi-random ideas:
> > - Add DSC checking callbacks to struct mipi_dsi_host_ops. Assume that
> >   DSC support is not available if callback is not present. The callback
> >   should accept struct drm_dsc_config and populate const and RC params.
> >
> > - Add DSC-related flags to struct mipi_dsi_host, describing DSC feature
> >   availability. Make anx7625 check those flags.
>=20
> ...
>=20
> - Extend input_/output_bus_format checks to also cover DSC.


OK, I'll discuss it with MTK DSI host engineer.

>=20
> --
> With best wishes
> Dmitry
