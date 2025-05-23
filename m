Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E0DAC1CD8
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 08:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467010E2AE;
	Fri, 23 May 2025 06:17:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OQEcG02K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010029.outbound.protection.outlook.com [52.101.228.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22A5310E2AE
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 06:17:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAa5Q8dWmQ+Pn2qn6T6YnkqO9ZkjQLhttpXHkJfvQPkqHss70ML8oRhwVK09Cx6JAfGx1B5pgK/8TSUG57nl7OuA1WSGfUoive7dX7PtNrpHH+hFOYSYPi/NrGoIBg5y0HI4aKZzvCyCigj8XlC1DmiaX/D6g2WxnD6eatLytOI/0ZxYQGtyBrMxN0N49tRiK2pRIXRsLEfNpSmX/E19CuwSE/MAiyI/y8WTAScvWiYmwkVuOFeJR021fCzVve4TOy9O0QDkbiTJYCFL+3PklvNczDiQPy9/cUVoICrCuA3zT6/AAmNicb5Oi+ZVensUqpLNWSvlV9rVVCNIrtn11g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1I2NIuoiAIkLpeF1M2bMJyGn1rtYLDiS5yUTSyzhvLU=;
 b=XRgRisNzu3r4L7Tu7yjZTIuLA/FfKPEPTiRLDHOu/Y493/w3xWxHqyh420G+qGiYlYgOZJBB9d2ri143amX5bX2cNwSMm+to9P+x13U0EkPzqA+HfiP2eUY4UfjmRBWH+YwX1vkQe3XU0VsKYBCS5Lny0UrGjvxTxy+YC8PUmcpTIFEISevWiQzPz+ymD9JlsKcjrPs8oa9t/vEGMT7z9O3BHsbPNsRirAK4pyh82xDTXObd6J57NKiL+EhryBLl5Q7y2TcNaqAehpBTK8tI3HNmPklU237vEV3RSu+AxEGZXFDW0/d5J+4L7zcEv7AMXhinQoe8YkdCAGbSoO954Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1I2NIuoiAIkLpeF1M2bMJyGn1rtYLDiS5yUTSyzhvLU=;
 b=OQEcG02KPrFNvnI5Wv1U3dISn70hiy+9KPG2iS/IcB678tOZo+fe88y9RwV2OV8tjAm3GOVbbY9YjRx1z3XLU2Qze43cIjfLEYZS5j2BOeK8lvqJf5Dyo+EUph5fxIdYGNEKpipb2DOMvDUVSLmNPSi84/t0qdDCrV6y8U5LFA8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYRPR01MB15523.jpnprd01.prod.outlook.com (2603:1096:405:288::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Fri, 23 May
 2025 06:17:18 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.8769.021; Fri, 23 May 2025
 06:17:18 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJhIENhbmFs?=
 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance
 <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 laurent.pinchart <laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dmitry
 Baryshkov <lumag@kernel.org>
Subject: RE: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Topic: (subset) [PATCH v6 00/10] drm/display: generic HDMI CEC helpers
Thread-Index: AQHbxs9ir1hJF42rS02+yM7B24cENLPcIpWAgAOfSiA=
Date: Fri, 23 May 2025 06:17:18 +0000
Message-ID: <TY3PR01MB1134687A2A762FE803EFA04F28698A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250517-drm-hdmi-connector-cec-v6-0-35651db6f19b@oss.qualcomm.com>
 <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
In-Reply-To: <174778079318.1447836.14176996867060604138.b4-ty@oss.qualcomm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYRPR01MB15523:EE_
x-ms-office365-filtering-correlation-id: dcdaa293-8f0e-47bd-0f8d-08dd99c1789d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?eENwS2RzcjVzRHNLVnp6MER3cDBvY1NtK2dUNHpTa2NNc1lNMVc2UDVITWhH?=
 =?utf-8?B?Y25sUFAvRGxBM2dFaEM3dHBBMmdhZEtUSGVwaVVuVmswY3pzK1FPOUJPK01p?=
 =?utf-8?B?azkvdXgyQzFoQ2dzVWN2UXZUR0hYelQvMGoyckM4dFRtMVZvUHpMTHF0VlQz?=
 =?utf-8?B?WFM3a3Urd2JCREM3cXBlbjlJUlJpZnVPT1grUTFPa3NtM1k2S1l0VEdqN28y?=
 =?utf-8?B?YU4yVXZqZ01BNTdWNTRjZHZDSWJ0Y3krbU1mY2NnZ0ZMNWdRWXlBR1Axdjc3?=
 =?utf-8?B?aWxwcmY3QStDVk44OWFUSG5tSnZOS0x2MjFQZUt5eGdTa0VRUVo0M2hkbzdJ?=
 =?utf-8?B?MHowSFBOQjk5bzFGUy9Vc0tHdU1CY3lTSlFRUkJxUW9XT0g4MlNRWEU4YVhn?=
 =?utf-8?B?NWdKWGJIRFRRYmUzbkVZYVUwOTRJMHhra2tPaUlBd3BXMFVLTXh1UUcrSURx?=
 =?utf-8?B?Vy9XNWN3RnlQL2ZSK01BWW9pV0loNjh5VlNFMXdYMGV1NDAvVmFFWTl1RXpZ?=
 =?utf-8?B?TEt4dHgza2RvaGFsZUxlNEgwNHRwZ0dHOFc5bWFsK2ltYXNIUkVZKy9xVXow?=
 =?utf-8?B?L3JkN05JZis3Y21YNTFweDMycWJEdmVpRnhVczN6NFQ4azJTbzVnREZPd0NO?=
 =?utf-8?B?dzdVS3JOdWU5cmtXdGpQSUxJMkRnS1pUNWMrWlNtd0p6WWNOSGhuc1IvVmkv?=
 =?utf-8?B?U05SQlZlQkh2dnBaZDhibnFZTUk0bHgxU0pKb3RQZzZ5ZC9JeVk4UW8xYSsz?=
 =?utf-8?B?YmdRL0s0aXVyaWl6MU95VEZaUExCTzZIUXpIRFZJcWFGaVZ0Q3ZuWEZPNnNy?=
 =?utf-8?B?SjY1NXFqOVpMZW1iU0VyYkU4Q2pETHRDTHNHclZBU0JSNy96bHpXM1NxdTUr?=
 =?utf-8?B?NmhIVHdna3JHZ3FHb3RBQjNXSHlwNDFrWjd3RzFHYUtGYmRIZkhML3ZBcTNX?=
 =?utf-8?B?TnhSTk1nT2ptdkFtb0xiQi92OWtqb014Ykp3M21MUUVWMk04SFZpcm1lUWJZ?=
 =?utf-8?B?UzRJTjQyZjN6QTd5Ny85TkJ4dDhvYnZJaXhBMzVselVHTUxOUnF1Umg1RWdx?=
 =?utf-8?B?R3JDcXRvZzRiSXROZFh1SVdIK1BSNURwWDVHb3VRbFl5czVCaFA1eGJwUzVV?=
 =?utf-8?B?em0zWGdVUHRBMHpNQUtibUZiZnpEVDNlWE1CMDVrdEk1eUI3dlpPM2ZCcmJa?=
 =?utf-8?B?cUxGK2lWTDFseDVSZTdRQlk4bmJMZUJGWkdnNmd6MnB1elpXMng5WjZETk8z?=
 =?utf-8?B?YzNMdi9oTTI0Nmk3aGo4V2VPb3BqMUxLWkR5S3dCOFVvcEd6eXZyVVprTWVs?=
 =?utf-8?B?c2FncVd5S0NrKzhnUm05cWVWaGw3bmYxdE9XakVXd0wvU2I0elFZbmR6ck0r?=
 =?utf-8?B?K3VwYm90WVoxUUl6SDg5endUQSs5Yy9WWURDWk9OUFg1a0dwR0YvQ1A4N1Er?=
 =?utf-8?B?NitINEsrQVFhakp2U3JYN0V2emFicFR0S2RwL2t6MHBIb0wvM2xOU1lLQlFM?=
 =?utf-8?B?ZkU4TUR2UlArNVQwTlJZSlJuYTlTa2M0TG5YZklGaXU3YW12bXJlK2hVcHRN?=
 =?utf-8?B?aldrdDkwYXFVRVN6b3k1cnJMamdYeDJQS1Z1K1VHVlc4QlRVRnJyN1lZYWRP?=
 =?utf-8?B?cGx4U0VCbCtkUmgyYWZzZ3RjeVpGb2lOTGtaUlkzV2tka3pDRTJVMDFGdzNq?=
 =?utf-8?B?RUYvTDJscGFYS010V1I3OHR2enllSVZHSU9kNzRyV2sveE9CYmRZdE4zZk4x?=
 =?utf-8?B?TnZEL3Z4MWJ3WlpWeEJWSHZqOU84c0VCeDhIcHJibWRHYitITVF0dHU2b1Jy?=
 =?utf-8?B?RXQ4dDRUZUFiQzlwZnYxcUdOMjcya3pWRWROMXhEbW9JamJxMGoveWZCK2Zq?=
 =?utf-8?B?Q1VlazFCSWQ1TlYxU05WZWVQcHJieldlUXhCN1lhQ0hGRSt5c1NVcWFrUTYv?=
 =?utf-8?B?N0ZiSk9FR2FMTVcwTk1ZSDMxdGtidWlTWktTaFBNbDZjd29jMUlTcW5uSS9S?=
 =?utf-8?Q?m86t62M9utNAEnyJguUWtOMWrOGCMY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UG04aDVCbU5vREJpUlBTMndJUXJKSGZyYVNORHdQSDNkV1BwV3Y3ank1dDIv?=
 =?utf-8?B?OUllOGN4TUFrZW93WU9ObnNwdWFtUGhZSDhyb2xyMFRuSTZNdS8zNW9JWmJk?=
 =?utf-8?B?OFQ1eUFPMnJKenVnK1VXaDA4MC9xdHgwcjhSY2c2K2ozSEZDWVRmUDk2K0pS?=
 =?utf-8?B?MU16dENyUFE1RjZXMGRybm9BWmpSMGpHbUdVOXVWbWlQaGdWTno0QXNyUzlN?=
 =?utf-8?B?SnhaT2lUdDczbGMvbWdYNXFJUVBDcGVYOWVyRFI2RlRiaHdWb0hYOHY5RDFV?=
 =?utf-8?B?WVZiZlZVTHVSa2hLcktIRWhzdGFPWk9YaDdTSWNZamxWMjRZeXo1L1dJUUxW?=
 =?utf-8?B?QkErNTR5aHBKbFRGVVhFTDEwWk5iVC9zREwyZlNwR1B2VUVhT0RzSmJLeSt4?=
 =?utf-8?B?ZkZNREJ5V1E2dlp5a1c0UVFFT3E5eXIwV3FieWVoL0JNS1pnL1ZoaldQbmth?=
 =?utf-8?B?aFBDWmo2Y01IOTl1VEVLK2lKdmpqNG4zU1hMSDBXY3AyNDNNczRKZEMxUUhs?=
 =?utf-8?B?Y3F6SjFhcDgzUTVTU04rWmtUTjk5UGlqemt5R2dMTDlIdlg2UFRCa29DUkZZ?=
 =?utf-8?B?WGRpR2VGMlRKc1ZSSmI5Y1dScElvTmdxNWUrUjdFVGF5U2Z2ZTBCZWp1d1M1?=
 =?utf-8?B?Mnc4UWtPWjhLRFMwQlF6elNwTlV2b0F1M21GZ016RTJUdzlxbGdORm1CVmEv?=
 =?utf-8?B?cWZrbDZQODlHT2o1NzVSQWtZclkyb3FIdjNyajJPdzhSd3NhaE1IYkNyb1BX?=
 =?utf-8?B?LzhXMVlydmtzaTRjS1B3MXFKNEdHM1dmb1gvSHdVYTlZN3lwdzF6enB4d2Vv?=
 =?utf-8?B?ekMydjZpdW9iTWVBTVAxdjlYZkczK001QWlsNnhiSEZCSHVFTzUvcDVFL2Jl?=
 =?utf-8?B?VWJsTHF1aVo2dXVLbDJ1TGZVNkxPVGMvT0ViMkVHZHA4d20vck82MmJjanFy?=
 =?utf-8?B?cTkwTUtrcXB1UThkd1RFcEE5V0p6U1lZdk9EdjIrK1hpYWsyNjdaaTJPYm5u?=
 =?utf-8?B?cW1XcHJGNEF0Z2l1WXFpUTVxSHFuSU9GaklmSXQvWWVvRm9ZOFhCcTJrbFAr?=
 =?utf-8?B?RXVMZU9ITkhJZFlJeU5XVlUyNTVEYTFaeVJvNGFLTFV0UFhHRGxlUEoybTM4?=
 =?utf-8?B?Skh3SExJbjZwaXhCeWdMTWFFekxJK2NDOFl1TWc3YVVKWlowUTd2d0dmVnBn?=
 =?utf-8?B?RnlOMXh3SmxsdGJmYytYb1Y2cjladWRkWjFtTFFTdldTNE1rOU5PVVlJWHFS?=
 =?utf-8?B?enl1ZUlaWEhXeC9TTUlhSTRwUlBnNm5Mbm9TdGpMdktZTXNUZjRnVlUwcFhN?=
 =?utf-8?B?M2hmZzY5bVNsS1M3RTBPSEJ5YjB4TkJpOTNNZXVHMUFjSEVSSmQ5SUhtMUlP?=
 =?utf-8?B?OFpySzE5TVlSWUl4bDJBUCt0TnNmSzc3K3o1Y3FUN2Qya3hod2k2Zm01ODdm?=
 =?utf-8?B?MjRNa0dSKzMwV2sxYzIrSlJ2ajVVUFViS2FOTGl6blJEODZBaUhXYmtKZUxX?=
 =?utf-8?B?cVphbktGMXpiUlIvbzhPZzEwcXlUenVzTVAvUGsrWDk4MjVTMk8vWmt4NENM?=
 =?utf-8?B?cngydmt0RytCL1dFL3Z0Y2ZQMFpTVVZwREtBQlQvc0JlTS8zWS9qS0ZvbTA2?=
 =?utf-8?B?TWVyMS9Xb1JuWjkvUi91aDlPRnp6cDNRZmpmVDg0N3NXMHNFU3NtMnByeTdq?=
 =?utf-8?B?eWRyczR3TkpFSHJkYSthSzUxbXM3N0JjanlYQlF3STJQL2ZKMm10THBDMHV6?=
 =?utf-8?B?S1d6QU1OcG9QUUhuV1hLWVF6QU5rZjFHNE5PN09GajJTd3RFcEoxUVo3TWE3?=
 =?utf-8?B?N296b0tDMU9tR2pzMUhpVHpoWFBKWWJUZGVmaDEzSEFIYXU1Nk5XblFXc0Fh?=
 =?utf-8?B?YWhoOU1vbkFXU0t4RXUzamhaa0hqK1FZZ3hNZ3pwSHlhM2RzT1dxU1pmWDhJ?=
 =?utf-8?B?Mk5sQ0o0N0ZPL1pNUzNOWkplZFd4WWxwUlY0NHEyek5VVEhrVkhsNjJJUUZu?=
 =?utf-8?B?czNxRHhHMDNNSy8xeUFwQTFELy9SMUlPTzNETTlwSFRQcDB3cGRSMWNyWTRu?=
 =?utf-8?B?TDA3UUMzb0I1SGhHZEhNMEhhY0ZRclphamtNemZrcTRxWXE2OU1JM1pKWVEy?=
 =?utf-8?B?REttRTd1T2pIQ0RjaG9qS0M2Z2hvbXpQeERkT3hqR0pFRUdGSnZYdUhWUi9w?=
 =?utf-8?B?SHc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dcdaa293-8f0e-47bd-0f8d-08dd99c1789d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2025 06:17:18.7755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MoyoWm/PL88krlLJ+B+7EMRTFZmVgm7GH9TLBjqeXkUFB+dZO59Xb5/Ku0WA6MVEBaDIMpfIT6v7gW9Xjp4UCAEGlU8bF+mdNVFnRS0p+Dc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15523
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

SGkgRG1pdHJ5IEJhcnlzaGtvdiwNCg0KVGhhbmtzIGZvciB0aGUgc2VyaWVzLg0KDQpMb29rcyBs
aWtlLCBBZnRlciB0aGlzIHBhdGNoLCB3aGVuIEkgY2hhbmdlIHJlc29sdXRpb24gdXNpbmcgbW9k
ZXRlc3QgaXQgaXMgbm90IHdvcmtpbmcuDQpNb25pdG9yIGlzIHNob3dpbmcgb3V0IG9mIHJhbmdl
L05vIHNpZ25hbCBvbiBSWi9WMkwgU01BUkMgRVZLIGNvbm5lY3RlZCB0byBBRFY3NTM1Lg0KDQpO
b3Qgc3VyZSwgSSBhbSB0aGUgb25seSBvbmUgZmFjaW5nIHRoaXMgaXNzdWU/DQoNCk1vZGV0ZXN0
IHdvcmtzIGZpbmUgd2l0aCA2LjE1LjAtcmM2LW5leHQtMjAyNTA1MTYsIHdoZXJlIHRoaXMgcGF0
Y2ggc2VyaWVzIGlzDQpub3QgcHJlc2VudC4NCg0KQ2hlZXJzLA0KQmlqdQ0KDQo+IC0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGRyaS1kZXZlbCA8ZHJpLWRldmVsLWJvdW5jZXNA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgRG1pdHJ5IEJhcnlzaGtvdg0KPiBT
ZW50OiAyMCBNYXkgMjAyNSAyMzo0MA0KPiBTdWJqZWN0OiBSZTogKHN1YnNldCkgW1BBVENIIHY2
IDAwLzEwXSBkcm0vZGlzcGxheTogZ2VuZXJpYyBIRE1JIENFQyBoZWxwZXJzDQo+IA0KPiANCj4g
T24gU2F0LCAxNyBNYXkgMjAyNSAwNDo1OTozNiArMDMwMCwgRG1pdHJ5IEJhcnlzaGtvdiB3cm90
ZToNCj4gPiBDdXJyZW50bHkgaXQgaXMgbmV4dCB0byBpbXBvc3NpYmxlIHRvIGltcGxlbWVudCBD
RUMgaGFuZGxpbmcgZm9yIHRoZQ0KPiA+IHNldHVwIHVzaW5nIGRybV9icmlkZ2VzIGFuZCBkcm1f
YnJpZGdlX2Nvbm5lY3RvcjogYnJpZGdlcyBkb24ndCBoYXZlIGENCj4gPiBob2xkIG9mIHRoZSBj
b25uZWN0b3IgYXQgdGhlIHByb3BlciB0aW1lIHRvIGJlIGFibGUgdG8gcm91dGUgQ0VDIGV2ZW50
cy4NCj4gPg0KPiA+IEF0IHRoZSBzYW1lIHRpbWUgaXQgbm90IHZlcnkgZWFzeSBhbmQgb2J2aW91
cyB0byBnZXQgdGhlIENFQyBwaHlzaWNhbA0KPiA+IGFkZHJlc3MgaGFuZGxpbmcgY29ycmVjdGx5
LiBEcml2ZXJzIGhhbmRsZSBpdCBhdCB2YXJpb3VzIHBsYWNlcywNCj4gPiBlbmRpbmcgdXAgd2l0
aCB0aGUgc2xpZ2h0IGRpZmZlcmVuY2VzIGluIGJlaGF2aW91ci4NCj4gPg0KPiA+IFsuLi5dDQo+
IA0KPiBBcHBsaWVkLCB0aGFua3MhDQo+IA0KPiBbMDEvMTBdIGRybS9icmlkZ2U6IG1vdmUgcHJp
dmF0ZSBkYXRhIHRvIHRoZSBlbmQgb2YgdGhlIHN0cnVjdA0KPiAgICAgICAgIGNvbW1pdDogZmEz
NzY5ZTA5YmU3NjE0MmQ1MWM2MTdkN2QwYzcyZDljNzI1YTQ5ZA0KPiBbMDIvMTBdIGRybS9icmlk
Z2U6IGFsbG93IGxpbWl0aW5nIEkyUyBmb3JtYXRzDQo+ICAgICAgICAgY29tbWl0OiBkOWY5YmFl
Njc1MmY1YTAyODBhODBkMWJjNTI0Y2FiZDBkNjBjODg2DQo+IFswMy8xMF0gZHJtL2Nvbm5lY3Rv
cjogYWRkIENFQy1yZWxhdGVkIGZpZWxkcw0KPiAgICAgICAgIGNvbW1pdDogZTcyY2Q1OTdjMzUw
MTIxNDZiZmU3N2I3MzZhMzBmZWUzZTc3ZTYxZQ0KPiBbMDQvMTBdIGRybS9kaXNwbGF5OiBtb3Zl
IENFQ19DT1JFIHNlbGVjdGlvbiB0byBEUk1fRElTUExBWV9IRUxQRVINCj4gICAgICAgICBjb21t
aXQ6IGJjYzg1NTNiNjIyOGQwMzg3ZmY2NDk3OGEwM2VmYTNjODk4M2RkMmYNCj4gWzA1LzEwXSBk
cm0vZGlzcGxheTogYWRkIENFQyBoZWxwZXJzIGNvZGUNCj4gICAgICAgICBjb21taXQ6IDhiMWE4
ZjhiMjAwMmQzMTEzNmQ4M2U0ZDczMGI0Y2I0MWU5ZWU4NjgNCj4gWzA2LzEwXSBkcm0vZGlzcGxh
eTogaGRtaS1zdGF0ZS1oZWxwZXI6IGhhbmRsZSBDRUMgcGh5c2ljYWwgYWRkcmVzcw0KPiAgICAg
ICAgIGNvbW1pdDogNjAzY2U4NTQyNzA0M2VjYjI5ZWY3MzdjMWIzNTA5MDFjZTNlYmYwOQ0KPiBb
MDgvMTBdIGRybS9kaXNwbGF5OiBicmlkZ2UtY29ubmVjdG9yOiBob29rIGluIENFQyBub3RpZmll
ciBzdXBwb3J0DQo+ICAgICAgICAgY29tbWl0OiA2NWEyNTc1YTY4ZTRmZjAzYmE4ODdiNWFlZjY3
OWZjOTU0MDVmY2QyDQo+IFswOS8xMF0gZHJtL2Rpc3BsYXk6IGJyaWRnZS1jb25uZWN0b3I6IGhh
bmRsZSBDRUMgYWRhcHRlcnMNCj4gICAgICAgICBjb21taXQ6IGE3NDI4OGM4ZGVkN2MzNDYyNGU1
MGI0YWE4Y2EzN2FlNmNjMDNkZjQNCj4gWzEwLzEwXSBkcm0vYnJpZGdlOiBhZHY3NTExOiBzd2l0
Y2ggdG8gdGhlIEhETUkgY29ubmVjdG9yIGhlbHBlcnMNCj4gICAgICAgICBjb21taXQ6IGFlMDFk
MzE4M2QyNzYzZWQyN2FiNzFmNGVmNTQwMmI2ODNkOWFkOGENCj4gDQo+IEJlc3QgcmVnYXJkcywN
Cj4gLS0NCj4gRG1pdHJ5IEJhcnlzaGtvdiA8ZG1pdHJ5LmJhcnlzaGtvdkBvc3MucXVhbGNvbW0u
Y29tPg0KDQo=
