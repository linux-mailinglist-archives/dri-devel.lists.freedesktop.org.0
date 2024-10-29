Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876B9B4377
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:48:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06C1A10E193;
	Tue, 29 Oct 2024 07:48:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="IYjaw3D7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE1910E193
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:48:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QJ0fpGRPLCu5rDEPbcwXpYRPtVnZU36zQMF7IwVrf5otHKl0G3ENA+jBG3vg2KFGB2csSXiTtvhjHHjkyUPUMZt8gzkG5Hf37INuRTkNp5za8rk/IR+pHU5XVRJ8LQ519h+rtFxMcVmP2H9LXsZFDjhl6kDxfHtAWs/MWlri7ajtT2pkFLYU+0+eGNAih3hO+Ztf6MQIs7X1xO8lIU9de/hr5R5zCR0AB2/+sSfCCFLJd6f9pDiEE9UGlyrr5XlXgGGng+GK7HedDwams+fxPkFEmrXRaDO70zkKxi/nPVF8cnVr4NUHmala8LGBcdUK9ENfo/Uc150XNzkGIi7OPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2H60Gi/DuVcQ6lohi+x/KzgjTByagPf4eIym7zJAhW8=;
 b=sCRToV2W2FhLwR9Q1flT9LAQEt3wSA1JSlKKrQPeQSpasu/KTvtwRyw7F55SUNgn4Y1tqtWWWsx6VDeF2B0tEsBISXVWS3XRTltmBw/ajGXaZSKJoK4KOgljFxDLX5+2sv3348br5Obb5WWQu1ktFcRR/01/QgDv3kUCLU5fEBGxV4gqZoz/+sSHdGsPgr59nrNcg6MNETDqaf6STYFZECSac30Ov4YpfXiM+UyLAaTyOe1M1SzAvA6mw0OilkVhXEl59kU65fPnMYfeMkALs3P2W1mFgou5EQ/EBWqeaUvavxoxZWaiN2wHrnmxxHsyFVNSToSjDtVpT5mbqqKP0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2H60Gi/DuVcQ6lohi+x/KzgjTByagPf4eIym7zJAhW8=;
 b=IYjaw3D7B2DWye72BkRBoKmGIIRaBjvn37t7zy0em3J8xzP+aFjkZUhrp2aDpdfxxJ/MBrGUQjTepqvaC8b7TkjliEcL+3FTwUaQ47RybWGJhYzSZDYLZKVBAeB671ziNQjxq0kKgSuhVVzbfmlVB81/XbgKwuPrP6uuoZKSjtQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB11094.jpnprd01.prod.outlook.com (2603:1096:400:3df::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 07:48:08 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%3]) with mapi id 15.20.8093.025; Tue, 29 Oct 2024
 07:48:08 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Liu Ying <victor.liu@nxp.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, laurent.pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de"
 <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org"
 <will@kernel.org>, "sakari.ailus@linux.intel.com"
 <sakari.ailus@linux.intel.com>, "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, "sam@ravnborg.org"
 <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
Subject: RE: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Topic: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Thread-Index: AQHbKOKZPN4b66+xp0G7h8Y65TjgzbKdQo2AgAAK22CAAATsgIAAAEOwgAAFyICAAAFroA==
Date: Tue, 29 Oct 2024 07:48:08 +0000
Message-ID: <TY3PR01MB113465D2F4C35A0728993D35E864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <01c1c4f3-1652-4b08-bd35-08b4e1c04c79@nxp.com>
 <TY3PR01MB11346805C5D524D264669D178864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <750920ae-36b9-47f5-84e9-779332739f86@nxp.com>
 <TY3PR01MB1134610B42A1D3424D97B04CA864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <a166da61-8cd4-44c9-987b-94d8a62faf82@nxp.com>
In-Reply-To: <a166da61-8cd4-44c9-987b-94d8a62faf82@nxp.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB11094:EE_
x-ms-office365-filtering-correlation-id: ac5a5c50-0b84-4ec5-ac1d-08dcf7ee07de
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?NGgrc252SUdZOW5CY1E1U2hnbGZvYmlYN3l3WGtQeXBOYWVocndMNEhwbk0y?=
 =?utf-8?B?cms4SDIzRm9sb2RlV0ptcGJ3MDdtUUlzWXRvRVZUdlJSUUttSXU3cGFuSGR2?=
 =?utf-8?B?cVNkUWdJSUVlaVEraFpQTENaNUlGd1pFTENVa3Z1akpHTkQyMFV2SzJ2UmM0?=
 =?utf-8?B?d3prM2VZZUZQWkR4OVdQbkdBVUtPN3BjWFl0QTBtQ2g1VTlMRjBkb1c0SjF0?=
 =?utf-8?B?dG5LSlFxNWhUTHZQakJpWW9NUmkyM3JDTUNDaGdyUmp1cWxZWThlOTYzdU5R?=
 =?utf-8?B?NHhkRUVidWNKWGFsaGhJditTQUxueEpTeXh0VDllY3cvSFpkalZIM25KdVVk?=
 =?utf-8?B?YWlnQ1ZyUFBlNWx6WGxuR2lDekR0dmRJL2J1Z2tkN1lUa0VvU1RPWHlLV285?=
 =?utf-8?B?aFFlMitGSktLL0d0WC9CSkRRSGdIV2xnditMR3R1VXNNSXc2dGdHcUlDdkl2?=
 =?utf-8?B?TXhSRG1kWFhYSklQRXZ3ZEx5YmpqYmd0VkcwNnRmRVA0NHdiVExSTlY1VDdK?=
 =?utf-8?B?a2d5aUd2ZTZ3TW10RURCeVJVMHQyTzQ2dzJ0S3Q0WmdYcHNZVUI4Zy9aUEV5?=
 =?utf-8?B?RUptSlhCcmJEb1RPTUFma2VmcjRZbVd2ak5ucEUzbk53MGNGaU1hNjk0QS92?=
 =?utf-8?B?dDk5OTlEaVRqTHU1RTRwOWkvczhnNTRNeU8vbVB6NnpBWXZTZmxEeDRUa2Uw?=
 =?utf-8?B?YUcxQzZCcHcyRmNJZHB3Vm9CQjAyM2h0VWpiUk5FVEpsZFVpR2JBR1E3K0Zo?=
 =?utf-8?B?cWxGVU9LL0ltVEVXL09lZFdzN09Xa3I3dllPYnJBNWV5YVZrcm1wUmREYTlh?=
 =?utf-8?B?dzU2dEtxa1B3aHpzM2xhWGFDVnRYSnhXY2ZvR0hhSTIyNnBkUzlRWi9kT2lG?=
 =?utf-8?B?bFJNQUlIMG5mK20zN2x4RHBGcWg5cUp0aVlsY3JCTzZ0YXFZeHhsVVBZbTN2?=
 =?utf-8?B?V05MaCtyS1lDa1JFVFJkSTNOalRQRm5XMzVNeXoySEN6SlZISGR3bEFUN2V5?=
 =?utf-8?B?bGdZQjlNeWFLSU5BNEVtZGJnYUE1UFZtYUd5eGxEZDlBNUZlZ0M1MjVoZVJP?=
 =?utf-8?B?QUtBUWg0RmtURCt4WVBjNHp1bEpwQkhCeDlBanZvTnJVaW8vSUpOUnFLdlhT?=
 =?utf-8?B?UWtaMyt4UWNWd1dpU1ZLSHV1RFc3Q0FXemtVczNjQUQ1N1hqdnpzVXEzSVZC?=
 =?utf-8?B?cWpHRWhhc2cyQ2xYa3k0SlBWMjJTVGRtTEpqZGhFMjZKVkNDSEhJQUNEWGJt?=
 =?utf-8?B?ZGIxOEtCZTFVZFVyREZLYWR0ZTFwQVZ5N0J5YTFGeWdrRy95eEZ5QVA3Q0lw?=
 =?utf-8?B?NlNHMjBrS3VKWEhHbDNuTW0vQ0NUVWtiTVZaQWpNNUVzcXpqMjJQdVp6M2w1?=
 =?utf-8?B?cnlnZ3p1WTZlUVhnVkFWWVFqRmYzVkNRTW5kbUhvQWYwSVYyRWIweVFBTHZE?=
 =?utf-8?B?dGllQ2VOVUhaNUU5UXUxNzF5ZUExYVVXVkVzZUFvZnM4Mzh1dXpXU2o4elhp?=
 =?utf-8?B?ckRGUjhxWEtRU3M5K2FqVFJYSGQ1STlIZnNNVUkzdDk4RVdQM2R2MEd2Um5I?=
 =?utf-8?B?ZzRqamhlR0x1aEM0a3hRYlVnaE82aDFZa0JKc0VnVDN5aUJLb1ZjdnNvbTZn?=
 =?utf-8?B?NFAyckJtSG9wSVU5TFFUVXdaRitkSVg2VGVPRXJkS2wvYjN1ZkNKZDdLSlRr?=
 =?utf-8?B?OWxJVlBiUTZyZmpDTGhnY3A4M05oMmdBczJ1SVJVWloxeS82bFY3S1pkejBW?=
 =?utf-8?Q?+8ajdUiSYg9j/eUaws+64P4S2089HjrGTl40Vrr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VzdmWDc2ZFp2blU1RlJ4V1VCT1A1TnlOVHluYmxIdzRFdWFnZU5pVUhKb0M2?=
 =?utf-8?B?VEdtaFNqUHdydUowTCtpNE1KMkpzbzFRRlZYM3V6QW1uZ3VlLzIyOFZ4RFFO?=
 =?utf-8?B?Z21NZ25YdytqcFk1RWFKZnBhOVIwMFRvT092U1h1SDFRaGRrRU1QZU9HbEpN?=
 =?utf-8?B?dWU1dVRGWXFIcmZZNW1weHU4K2hxODhxZGw3WTcvQTdnNnVteUIzTkJibFNU?=
 =?utf-8?B?czFxdXFIV0QwTUZGZE9pV1d5QUIxVHlqQkVnZjhkZzNENEFlWllTcjRVaGhI?=
 =?utf-8?B?bnF5aHBJeUMvWW1Od0xOcTNJSi9adVdmUVpiQ1RqYVdOSlFqa3ZyTldGQm0y?=
 =?utf-8?B?SkFxRlFiR0ovaFJsQXRRZHRyUkR1Mk5OY1I5UUtXU2M2T0dsZ2dFRWxVK3lS?=
 =?utf-8?B?dlZIQlN5MnpkaWNwdkVTK3JYalE1amF5K1EzWGRZVHA3d0dBNW1lZytnS0Iv?=
 =?utf-8?B?dVhYcDg5YmNIYUhaZmZOM0RjUkxDWkcvYXloVFpsRkdtRG9sVWNmOTk5bzY3?=
 =?utf-8?B?dCsra3pHQ3FJaGRWZ2NxeXFJbUFjOTYyOUJyOFBFK0pnd2dRcGRQbW50TXph?=
 =?utf-8?B?MTZrV1dhd1d6WEwxTytqWFE5ZWZGUnRRQ1Via1RPeEpVMTFzdmQ3dkdwNHRv?=
 =?utf-8?B?QVE3NXAvMU5oZ0NIY2taRmJBQTdjYUw3Mys2VDN4MVF2MUtxNWlQK2ljWDdU?=
 =?utf-8?B?NVhSOTR5VGY1d0hwNDJLT0JxdTRrcHY0N3ovM2ZPUitCemJ4T1Q1U2lZMTM5?=
 =?utf-8?B?Z0J0VUd5MnVVazdGY3VhRFBGZmtPQUpJZ1Z3dG84Mzlpdm9xU1E1T0QxU3gw?=
 =?utf-8?B?ODVCd0k0RENxY1c1SnU2NDdZbmVsZmZ6aDF2cVJiem5IdEVmUUNsR0ZJekE4?=
 =?utf-8?B?UlZweVVlZkppbHpVTVRLTnU5R2IwSFlNZWRjYjlmV1NOV0pVTDJVTU1uSVh0?=
 =?utf-8?B?UzFjNkJLcXVjRENrNitoVkE5ejQ3bDhDS1h0WEJzNjBnUS92ZTVpSjZ1ODBq?=
 =?utf-8?B?SEU1d3ZndktkTmo0R2RVYjNWeFJadUJsbUtFd2IwWXZqZzVFeXByYTRjUjVR?=
 =?utf-8?B?VHFwcVAzWUlPdVdFRVpmaHdHQjhWNjBHcjVLN25DeEpNdXg4SDhyOGxsUE81?=
 =?utf-8?B?RlJmaGpRcngwVDhkRHZYRVVTLzRtVkZMQmRFS0xPOXVwNzBTOWtwTWlINzhY?=
 =?utf-8?B?Sk16WHBuUGdITGgzZHBDc1BPR3o0Sk91SVV1VkEzbnAzSGY2cFFRbjhFZ2Rj?=
 =?utf-8?B?akg1T1dHblFQcXpwdWVqY1hZWTFyRmw4Y0NXaXpydGFIZ2xFdTR3UFBSS3dR?=
 =?utf-8?B?VzR2ZzdQS2k2N3c1L0VteU5QTE9DN04yZzFkM0w4dUVoSUNlK21oeS9Iam5Z?=
 =?utf-8?B?M1FvOFk5M2tVdm9ZUVlxNHRXWnQ0OE0wOVptL0RUOGVMRjdERC9ORU5XV0Qx?=
 =?utf-8?B?YmR2TDBzdDJqTjVEZkxETlJac1V6QTJVTmhQd2pTVWhDbFU3L2pYNTVkdmhY?=
 =?utf-8?B?bncxbUpjdXR1dTBoaHRQSnlXb2xZVEovN3VvQlc0MFZpalEzWElCSHhWWm1q?=
 =?utf-8?B?d3pPbThsT2VLVjU2azN6NW9URURIT2YyUCtPMnFJQW9qUDFDQjJITFd4TzlI?=
 =?utf-8?B?ZXZtdm9Tc1R2N3ltTllRY240eUErWmM2TFJ2bVBGTk5RTUdjaU5TVG1BemdH?=
 =?utf-8?B?RnZvM3lCRVVLdXBlVHZGaGZTUUhsdWF4ektqdUM0TDhxTGp1NUlkUFdRM29B?=
 =?utf-8?B?aDhQQ3lOVzl2Y212TDNQMFoyQnl5aks5aGtHSUR6L016WU4zaWsyZkQ5MzV4?=
 =?utf-8?B?WEJ3d0E5NFh0aDJRZ3I2Yk00UkVzd3hoOElHcWY1ZkQ3c3N6TGJjcDJ1SnBY?=
 =?utf-8?B?NWNraktQVVlOejBmSWVFMWR2c21xd2czZW1DN2JybWVVbDljbGx3VktKWTdZ?=
 =?utf-8?B?U01MK2xyUVI3SVVBQzltajRkdnNLbXB2VjdxbGtZTEFnSUMxM2VXd05KemdC?=
 =?utf-8?B?V2JCeUFZME9BY3I1S3ZTeFM0dk9MdGZoUVNBRmpmM1FEL3BKeGJZamtZNngw?=
 =?utf-8?B?VlZyNnlpZ29DTnF1b0phWWVKQ2pGaWY0VUJkelM3TEVEK2swRHJER1FEdGNH?=
 =?utf-8?Q?FW21c25/V9daDD6AeaIT7aMxh?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac5a5c50-0b84-4ec5-ac1d-08dcf7ee07de
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:48:08.5902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JH8wrHJWJ2GvEwCX7cOii3mAyhhsRlMOrI3a85qSgmtAKckOGiojV14MHpqc/qhCDloDuAvIHJgaVBUs1rrpwgZwsa65W9/kztxmIu7GoAE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11094
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

DQpIaSBMaXUgWWluZywNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBk
cmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVo
YWxmIE9mIExpdSBZaW5nDQo+IFNlbnQ6IDI5IE9jdG9iZXIgMjAyNCAwNzozNQ0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHY0IDA4LzEzXSBkdC1iaW5kaW5nczogZGlzcGxheTogRG9jdW1lbnQgZHVh
bC1saW5rIExWRFMgZGlzcGxheSBjb21tb24gcHJvcGVydGllcw0KPiANCj4gT24gMTAvMjkvMjAy
NCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gSGkgTGl1IFlpbmcsDQo+IA0KPiBIaSBCaWp1LA0KPiAN
Cj4gPg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBMaXUgWWlu
ZyA8dmljdG9yLmxpdUBueHAuY29tPg0KPiA+PiBTZW50OiAyOSBPY3RvYmVyIDIwMjQgMDc6MTMN
Cj4gPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAwOC8xM10gZHQtYmluZGluZ3M6IGRpc3BsYXk6
IERvY3VtZW50DQo+ID4+IGR1YWwtbGluayBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMN
Cj4gPj4NCj4gPj4gT24gMTAvMjkvMjAyNCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4+PiBIaSBMaXUg
WWluZywNCj4gPj4NCj4gPj4gSGkgQmlqdSwNCj4gPj4NCj4gPj4+DQo+ID4+Pj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4+PiBGcm9tOiBMaXUgWWluZyA8dmljdG9yLmxpdUBueHAu
Y29tPg0KPiA+Pj4+IFNlbnQ6IDI5IE9jdG9iZXIgMjAyNCAwNjoxNw0KPiA+Pj4+IFN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjQgMDgvMTNdIGR0LWJpbmRpbmdzOiBkaXNwbGF5OiBEb2N1bWVudA0KPiA+
Pj4+IGR1YWwtbGluayBMVkRTIGRpc3BsYXkgY29tbW9uIHByb3BlcnRpZXMNCj4gPj4+Pg0KPiA+
Pj4+IE9uIDEwLzI4LzIwMjQsIExpdSBZaW5nIHdyb3RlOg0KPiA+Pj4+PiBEdWFsLWxpbmsgTFZE
UyBkaXNwbGF5cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxzDQo+ID4+Pj4+IHNl
cGFyYXRlbHkgZnJvbSBkdWFsIExWRFMgbGlua3MuICBPbmUgbGluayByZWNlaXZlcyBvZGQgcGl4
ZWxzIGFuZA0KPiA+Pj4+PiB0aGUgb3RoZXIgcmVjZWl2ZXMgZXZlbiBwaXhlbHMuICBTb21lIG9m
IHRob3NlIGRpc3BsYXlzIG1heSBhbHNvDQo+ID4+Pj4+IHVzZSBvbmx5IG9uZSBMVkRTIGxpbmsg
dG8gcmVjZWl2ZSBhbGwgcGl4ZWxzLCBiZWluZyBvZGQgYW5kIGV2ZW4gYWdub3N0aWMuDQo+ID4+
Pj4+IERvY3VtZW50IGNvbW1vbiBwcm9wZXJ0aWVzIGZvciB0aG9zZSBkaXNwbGF5cyBieSBleHRl
bmRpbmcgTFZEUw0KPiA+Pj4+PiBkaXNwbGF5IGNvbW1vbiBwcm9wZXJ0aWVzIGRlZmluZWQgaW4g
bHZkcy55YW1sLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTdWdnZXN0ZWQtYnk6IERtaXRyeSBCYXJ5c2hr
b3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTog
TGl1IFlpbmcgPHZpY3Rvci5saXVAbnhwLmNvbT4NCj4gPj4+Pj4gLS0tDQo+ID4+Pj4+IHY0Og0K
PiA+Pj4+PiAqIFNxdWFzaCBjaGFuZ2UgZm9yIGFkdmFudGVjaCxpZGstMjEyMXdyLnlhbWwgYW5k
DQo+ID4+Pj4+ICAgcGFuZWwtc2ltcGxlLWx2ZHMtZHVhbC1wb3J0cy55YW1sIHdpdGggbHZkcy1k
dWFsLXBvcnRzLnlhbWwuDQo+ID4+Pj4+IChSb2IpDQo+ID4+Pj4+ICogSW1wcm92ZSBkZXNjcmlw
dGlvbiBpbiBsdmRzLWR1YWwtcG9ydHMueWFtbC4gIChLcnp5c3p0b2YpDQo+ID4+Pj4+DQo+ID4+
Pj4+IHYzOg0KPiA+Pj4+PiAqIE5ldyBwYXRjaC4gIChEbWl0cnkpDQo+ID4+Pj4+DQo+ID4+Pj4+
ICAuLi4vYmluZGluZ3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbCAgICAgfCA3NiArKysr
KysrKysrKysrKysrKysrDQo+ID4+Pj4+ICAuLi4vZGlzcGxheS9wYW5lbC9hZHZhbnRlY2gsaWRr
LTIxMjF3ci55YW1sICAgfCAxNCArLS0tDQo+ID4+Pj4+ICAuLi4vcGFuZWwvcGFuZWwtc2ltcGxl
LWx2ZHMtZHVhbC1wb3J0cy55YW1sICAgfCAyMCArLS0tLQ0KPiA+Pj4+PiAgMyBmaWxlcyBjaGFu
Z2VkLCA3OCBpbnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkgIGNyZWF0ZSBtb2RlDQo+ID4+
Pj4+IDEwMDY0NA0KPiA+Pj4+PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlz
cGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+Pj4+Pg0KPiA+Pj4+PiBkaWZmIC0tZ2l0DQo+
ID4+Pj4+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbHZkcy1k
dWFsLXBvcnRzLnlhbWwNCj4gPj4+Pj4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9sdmRzLWR1YWwtcG9ydHMueWFtbA0KPiA+Pj4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+Pj4+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjVmN2EzMDY0MDQwNA0KPiA+Pj4+PiAt
LS0gL2Rldi9udWxsDQo+ID4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9kaXNwbGF5L2x2ZHMtZHVhbC1wb3J0cy55YQ0KPiA+Pj4+PiArKysgbWwNCj4gPj4+Pj4g
QEAgLTAsMCArMSw3NiBAQA0KPiA+Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQ
TC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpICVZQU1MDQo+ID4+Pj4+ICsxLjINCj4gPj4+Pj4g
Ky0tLQ0KPiA+Pj4+PiArJGlkOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9kaXNwbGF5
L2x2ZHMtZHVhbC1wb3J0cy55YW1sIw0KPiA+Pj4+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRy
ZWUub3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjDQo+ID4+Pj4+ICsNCj4gPj4+Pj4gK3RpdGxl
OiBEdWFsLWxpbmsgTFZEUyBEaXNwbGF5IENvbW1vbiBQcm9wZXJ0aWVzDQo+ID4+Pj4+ICsNCj4g
Pj4+Pj4gK21haW50YWluZXJzOg0KPiA+Pj4+PiArICAtIExpdSBZaW5nIDx2aWN0b3IubGl1QG54
cC5jb20+DQo+ID4+Pj4+ICsNCj4gPj4+Pj4gK2Rlc2NyaXB0aW9uOiB8DQo+ID4+Pj4+ICsgIENv
bW1vbiBwcm9wZXJ0aWVzIGZvciBMVkRTIGRpc3BsYXlzIHdpdGggZHVhbCBMVkRTIGxpbmtzLg0K
PiA+Pj4+PiArRXh0ZW5kIExWRFMgZGlzcGxheQ0KPiA+Pj4+PiArICBjb21tb24gcHJvcGVydGll
cyBkZWZpbmVkIGluIGx2ZHMueWFtbC4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArICBEdWFsLWxpbmsg
TFZEUyBkaXNwbGF5cyByZWNlaXZlIG9kZCBwaXhlbHMgYW5kIGV2ZW4gcGl4ZWxzDQo+ID4+Pj4+
ICsgc2VwYXJhdGVseSBmcm9tICB0aGUgZHVhbCBMVkRTIGxpbmtzLiBPbmUgbGluayByZWNlaXZl
cyBvZGQNCj4gPj4+Pj4gKyBwaXhlbHMgYW5kIHRoZSBvdGhlciByZWNlaXZlcyAgZXZlbiBwaXhl
bHMuIFNvbWUgb2YgdGhvc2UNCj4gPj4+Pj4gKyBkaXNwbGF5cyBtYXkgYWxzbyB1c2Ugb25seSBv
bmUgTFZEUyBsaW5rIHRvICByZWNlaXZlIGFsbCBwaXhlbHMsIGJlaW5nIG9kZCBhbmQgZXZlbiBh
Z25vc3RpYy4NCj4gPj4+Pj4gKw0KPiA+Pj4+PiArYWxsT2Y6DQo+ID4+Pj4+ICsgIC0gJHJlZjog
bHZkcy55YW1sIw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICtwcm9wZXJ0aWVzOg0KPiA+Pj4+PiArICBw
b3J0czoNCj4gPj4+Pj4gKyAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVz
L3BvcnRzDQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICBwcm9wZXJ0aWVzOg0KPiA+Pj4+PiArICAg
ICAgcG9ydEAwOg0KPiA+Pj4+PiArICAgICAgICAkcmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy8k
ZGVmcy9wb3J0LWJhc2UNCj4gPj4+Pj4gKyAgICAgICAgdW5ldmFsdWF0ZWRQcm9wZXJ0aWVzOiBm
YWxzZQ0KPiA+Pj4+PiArICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExWRFMgaW5wdXQg
bGluaw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAgIHByb3BlcnRpZXM6DQo+ID4+Pj4+ICsg
ICAgICAgICAgZHVhbC1sdmRzLW9kZC1waXhlbHM6DQo+ID4+Pj4+ICsgICAgICAgICAgICB0eXBl
OiBib29sZWFuDQo+ID4+Pj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjogdGhlIGZpcnN0IExW
RFMgaW5wdXQgbGluayBmb3Igb2RkIHBpeGVscw0KPiA+Pj4+PiArDQo+ID4+Pj4+ICsgICAgICAg
ICAgZHVhbC1sdmRzLWV2ZW4tcGl4ZWxzOg0KPiA+Pj4+PiArICAgICAgICAgICAgdHlwZTogYm9v
bGVhbg0KPiA+Pj4+PiArICAgICAgICAgICAgZGVzY3JpcHRpb246IHRoZSBmaXJzdCBMVkRTIGlu
cHV0IGxpbmsgZm9yIGV2ZW4NCj4gPj4+Pj4gKyBwaXhlbHMNCj4gPj4+Pj4gKw0KPiA+Pj4+PiAr
ICAgICAgICBvbmVPZjoNCj4gPj4+Pj4gKyAgICAgICAgICAtIHJlcXVpcmVkOiBbZHVhbC1sdmRz
LW9kZC1waXhlbHNdDQo+ID4+Pj4+ICsgICAgICAgICAgLSByZXF1aXJlZDogW2R1YWwtbHZkcy1l
dmVuLXBpeGVsc10NCj4gPj4+Pj4gKyAgICAgICAgICAtIHByb3BlcnRpZXM6DQo+ID4+Pj4+ICsg
ICAgICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOiBmYWxzZQ0KPiA+Pj4+PiArICAgICAg
ICAgICAgICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6IGZhbHNlDQo+ID4+Pj4+ICsNCj4gPj4+Pj4g
KyAgICAgIHBvcnRAMToNCj4gPj4+Pj4gKyAgICAgICAgJHJlZjogL3NjaGVtYXMvZ3JhcGgueWFt
bCMvJGRlZnMvcG9ydC1iYXNlDQo+ID4+Pj4+ICsgICAgICAgIHVuZXZhbHVhdGVkUHJvcGVydGll
czogZmFsc2UNCj4gPj4+Pj4gKyAgICAgICAgZGVzY3JpcHRpb246IHRoZSBzZWNvbmQgTFZEUyBp
bnB1dCBsaW5rDQo+ID4+Pj4+ICsNCj4gPj4+Pj4gKyAgICAgICAgcHJvcGVydGllczoNCj4gPj4+
Pj4gKyAgICAgICAgICBkdWFsLWx2ZHMtb2RkLXBpeGVsczoNCj4gPj4+Pj4gKyAgICAgICAgICAg
IHR5cGU6IGJvb2xlYW4NCj4gPj4+Pj4gKyAgICAgICAgICAgIGRlc2NyaXB0aW9uOiB0aGUgc2Vj
b25kIExWRFMgaW5wdXQgbGluayBmb3Igb2RkDQo+ID4+Pj4+ICsgcGl4ZWxzDQo+ID4+Pj4+ICsN
Cj4gPj4+Pj4gKyAgICAgICAgICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6DQo+ID4+Pj4+ICsgICAg
ICAgICAgICB0eXBlOiBib29sZWFuDQo+ID4+Pj4+ICsgICAgICAgICAgICBkZXNjcmlwdGlvbjog
dGhlIHNlY29uZCBMVkRTIGlucHV0IGxpbmsgZm9yIGV2ZW4NCj4gPj4+Pj4gKyBwaXhlbHMNCj4g
Pj4+Pj4gKw0KPiA+Pj4+PiArICAgICAgICBvbmVPZjoNCj4gPj4+Pj4gKyAgICAgICAgICAtIHJl
cXVpcmVkOiBbZHVhbC1sdmRzLW9kZC1waXhlbHNdDQo+ID4+Pj4+ICsgICAgICAgICAgLSByZXF1
aXJlZDogW2R1YWwtbHZkcy1ldmVuLXBpeGVsc10NCj4gPj4+Pj4gKyAgICAgICAgICAtIHByb3Bl
cnRpZXM6DQo+ID4+Pj4+ICsgICAgICAgICAgICAgIGR1YWwtbHZkcy1vZGQtcGl4ZWxzOiBmYWxz
ZQ0KPiA+Pj4+PiArICAgICAgICAgICAgICBkdWFsLWx2ZHMtZXZlbi1waXhlbHM6IGZhbHNlDQo+
ID4+Pj4NCj4gPj4+PiBIbW0sIEkgc2hvdWxkIHJlcXVpcmUgcG9ydEAwIG9yIHBvcnRAMS4NCj4g
Pj4+DQo+ID4+PiBGb3IgZHVhbCBMVkRTLCB5b3UgbmVlZCAzIHBvcnRzIGFzIGNvbW1vbiB1c2Ug
Y2FzZQ0KPiA+Pg0KPiA+PiBGb3IgTFZEUyBwYW5lbHMsIG9ubHkgdHdvIHBvcnRzIGZvciBMVkRT
IHNpbmsgYXJlIG5lZWRlZC4NCj4gPj4gRm9yIGRpc3BsYXkgYnJpZGdlcyB3aXRoIExWRFMgc2lu
aywgb25lIGFkZGl0aW9uYWwgb3V0cHV0IHBvcnQgaXMNCj4gPj4gbmVlZGVkLiAgSG93ZXZlciwg
SSdtIG5vdCBzdXJlIGlmIHRoaXMgb3V0cHV0IHBvcnQgc2hvdWxkIGJlDQo+ID4+IGRvY3VtZW50
ZWQgaW4gdGhpcyBiaW5kaW5nIG9yIG5vdCwgYmVjYXVzZSBpdCBkb2Vzbid0IGxvb2sgY29tbW9u
IGVub3VnaCBjb25zaWRlcmluZyB0aGUgTFZEUw0KPiBwYW5lbHMuDQo+ID4+DQo+ID4+Pg0KPiA+
Pj4gMiBpbnB1dCBwb3J0cyBhbmQgMSBvdXRwb3J0IGFuZCBhbGwgYXJlIHJlcXVpcmVkIHByb3Bl
cnRpZXMuDQo+ID4+DQo+ID4+IFRoZSBvdXRwdXQgcG9ydCBjYW5ub3QgYmUgcmVxdWlyZWQgZm9y
IExWRFMgcGFuZWxzIGF0IGxlYXN0Lg0KPiA+DQo+ID4gQWNrLg0KPiA+DQo+ID4+DQo+ID4+IFdl
IG5lZWQgdG8gcmVxdWlyZSBvbmUgb3IgdHdvIGlucHV0IHBvcnRzLCBiZWNhdXNlIElUNjI2MyBt
YXkgdXNlIG9uZSBMVkRTIGxpbmsgb3IgdHdvLg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBpcyBmb3Ig
Z2VuZXJpYyBkdWFsIGxpbmsgY29tbW9uIGNhc2VzIGFuZCBpcyBub3QgYXBwbGljYWJsZSBmb3Ig
SVQ2MjYzIHNpbmdsZSBsaW5rIGNhc2UuDQo+IA0KPiBCYXNlZCBvbiBwcmV2aW91cyBkaXNjdXNz
aW9uKGVzcGVjaWFsbHkgRG1pdHJ5J3Mgc3VnZ2VzdGlvbiksIHRoaXMgYmluZGluZyBzaG91bGQg
Y292ZXIgZGlzcGxheQ0KPiBicmlkZ2VzIHRoYXQgY2FuIHVzZSBvbmUgTFZEUyBzaW5rIHBvcnQg
b3IgdHdvIExWRFMgc2luayBwb3J0cywgbGlrZSBJVDYyNjMuICBUbyBiZSBjbGVhciwgdGhvc2UN
Cj4gYnJpZGdlcyBtYXkgaGF2ZSB0d28gbW9kZXMoc3VwcG9ydGVkIGJ5IG9uZQ0KPiBjaGlwKSAt
IHNpbmdsZSBMVkRTIHNpbmsgbGluayBtb2RlIGFuZCBkdWFsIExWRFMgc2luayBsaW5rIG1vZGUu
ICBUaG9zZSBicmlkZ2VzIGFyZSBjb25zaWRlcmVkIGFzDQo+IGNvbW1vbiBkdWFsLWxpbmsgTFZE
UyBkaXNwbGF5cy4gIFRoYXQncyB3aHkgSSB3YXMgYXNrZWQgdG8gZXh0cmFjdCB0aGUgY29tbW9u
DQo+IHByb3BlcnRpZXMgdG8gdGhpcyBzY2hlbWEgd2hlbiBhZGRpbmcgSVQ2MjYzIERUIGJpbmRp
bmcuDQoNCkFzIHBlciBbMV0gYW5kIFsyXSBib3RoIHBhbmVscyBkb27igJl0IHN1cHBvcnQgc2lu
Z2xlIExWRFMgbGluay4NCklUNjI2MyBpcyBicmlkZ2UgZGV2aWNlIHRoYXQgaGFzIHNpbmdsZSBh
bmQgZHVhbCBsaW5rIHN1cHBvcnQuDQpOb3Qgc3VyZSB0aGUgc2luZ2xlIGxpbmsgY2FzZSBoYXMg
dG8gYmUgdGFrZW4gY2FyZSBpbiBJVEU2MjYzIGJpbmRpbmcgaXRzZWxmLA0KTGVhdmluZyBEdWFs
IGxpbmsgYXMgaXQgaXM/Pw0KDQpbMV0NCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4
L3Y2LjEyLXJjNS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3Bs
YXkvcGFuZWwvYWR2YW50ZWNoLGlkay0yMTIxd3IueWFtbA0KWzJdDQoNCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEyLXJjNS9zb3VyY2UvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxlLWx2ZHMtZHVhbC1wb3J0cy55
YW1sDQoNCg0KQ2hlZXJzLA0KQmlqdQ0K
