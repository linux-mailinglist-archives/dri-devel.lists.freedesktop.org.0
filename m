Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E8DA26121
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 18:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16CEC10E521;
	Mon,  3 Feb 2025 17:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ua+Gxua5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010055.outbound.protection.outlook.com [52.101.228.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825CB10E525
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 17:17:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jeyHbTW9lrAeBYTS4X7oJUE730xOTfOGGEBVYwkwEtjf3+acuUozMgIugdTDp0UrIGA22DSMZzfyxEn8tLhVWlYYyEZ9veFQDIpk3NTkQT0FIemgDMybQZXZkZWFP1xoood2fOkji2B/pqH5dOYmlHjHX2i2FjhaBbwjOvBzlR6lvzjyF1nAqiC/Psm8LY4QMhE/IhLYR2LIgL3rzJGsKkQ2PwNpKWiP8/rLnNW7/MVA4gnIbOALWf/nE1kmVxSbz/GHl9OdS74zZ/sXpoRQSN98YpxvI0xENQE+si5AMJ//RbOoI3FAdeAVk9K9TaIORlszN8XZAtgtAWbh2aTx8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekt+1iNAqvXkZM08sxSuTrky60siAahqo5jksnFXWX0=;
 b=OUTuKMykH+JXxK1030dUsdsThIPpHCc7REc2BueAdvo/jNkki7Cx/78TEgKTfqs+RWcIGhUGZ8ROAJGo0Z7xj34mU5wu0eACiiuWG2qL/ATxlGjwWc6zsh1TfZiEKW7knqY/cJMVBaOIv7FknCEaZVrcMdDkvpAiqI2U2gwaQwxwn644QEtCu1nKrIShQeOgo3sSmEFwL09uMNoALXGlM/RjRMGVNLX8ZxUblcTL43n4rIUF5mg6OGfgOuQ+wqHR1JYkPQZcDwhNG2WILYFaO8CV09QK5T+ZHfrkgWyllr8qth8Q2vefVCcvXFScIREVNniGVOd/VUL+AdeGitK8pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekt+1iNAqvXkZM08sxSuTrky60siAahqo5jksnFXWX0=;
 b=ua+Gxua5+A8vqg+fhNBrbNApBbQsCiC1cg/TCj/BxzzhgZ6w7GrInQDx81WVAoG9rYa4MdDVb9gfd2pCDoaM64PMXvsP/9R1OJhuRiEiifkX7zsKM/mDyC3O6lquCe0DPSIjX/325zMabgeM/Hu0xGgFwASQltWkgdsAMU5iTU8=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB9844.jpnprd01.prod.outlook.com (2603:1096:400:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 17:17:13 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%2]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 17:17:09 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>
CC: Saravana Kannan <saravanak@google.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
 <biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, Network Development
 <netdev@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK"
 <linux-clk@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-media <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2] of: base: Add of_get_available_child_by_name()
Thread-Topic: [PATCH v2] of: base: Add of_get_available_child_by_name()
Thread-Index: AQHbdIwcOx1+V0CX+UGSZ6o9QaMC3bM1zvSAgAAD2HA=
Date: Mon, 3 Feb 2025 17:17:08 +0000
Message-ID: <TY3PR01MB11346E1FA592E731E0D32E96686F52@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250201093126.7322-1-biju.das.jz@bp.renesas.com>
 <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
In-Reply-To: <CAL_Jsq+dn5wyEKbvAT8M2V=nM-vV_eHiRtwO_0h6EiJ=8OkHSw@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB9844:EE_
x-ms-office365-filtering-correlation-id: 2a0f90ca-a5ee-48ac-3fa6-08dd4476972e
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?QWNFZHFoVWZSSzdUZ2VqdWRzN3Ywd0FWZlRKVGpCYkwzQldLK2VKc3F0L0tH?=
 =?utf-8?B?RG1iQ3M0b0w2cUVNUDlrMTNuVDlhVlIvUm1LcU5YcGt5OWh0by9iNmxQS013?=
 =?utf-8?B?di9qMGVIYkNLcFBzSEJvK3g3TFh3azVoRk5yNzdLNm92YjNhSHdhNExuYlhn?=
 =?utf-8?B?dTJHTldnaHlKajRFQWJoYWp3WS95UEpmUk02TmxTU1p5NSs2RHBadHFEL1FL?=
 =?utf-8?B?WjBOd0lxSW55UWZaV1hCMDd6VlNISWhkUXRNVFdyQ1ltNVlhd3FGY2VqZExW?=
 =?utf-8?B?UkVSMEE2dmZGSzZkMmRhblcyd0JSazRjRDZtc0RiWU5UYlRYZ05wVENxVU1z?=
 =?utf-8?B?WjBwbDJUNDZ4a3hjY01hVlUxdllsanpaUDhESWdIaVNzTmRBK3A5MTVmd1NZ?=
 =?utf-8?B?d1Z1a3RIWS9YajdHTll4MGkrNVo3eTRieEo2VE9vTDdXeVo0TWZjUVlmdkVD?=
 =?utf-8?B?SmJibk4vTUMrak5xaHY2dDdRTFdrQXdqa1ptakZPa2k5L1pUR2c0NDNVSytr?=
 =?utf-8?B?N0NUVTJlYlNqbFc5UjN0WWtZMlhxQVVDREV1Vi9Uc2lBbngvZnhWYnFsdFQ0?=
 =?utf-8?B?QkJrTERxZVNKSm5FOFYrdFJqMTVOUWFUVUJlVTRsOEY3RENqRFZCbS82VmFL?=
 =?utf-8?B?dFNZMHVvT2ZlUjQyRUpZQ0xHamtmc0lEb2JoaGVrWXFUcHZGaGc3NGpLeDY1?=
 =?utf-8?B?aXFKSDhTYmQ1cmpwR2JaU1doeGdFZHliYWh2cU9YODd1R3dyRW5RVUt4a0pm?=
 =?utf-8?B?ekgyMWF0K0thVTVqSjdjUTl0OXVNZzRzR0FvOGwwNjVpREE5bTVwUThwbmx0?=
 =?utf-8?B?N0h4dFEyUGhjZ0J2NUFOOGN4QzVsYTdPd0ZYZmVQM2d0Z1JyRlpFczFFYkl2?=
 =?utf-8?B?dTFFazdVZGRJTGdlYmNFa0xRY2ljTDc2M2FuQUFPd2hLSmZlbUNtOXdHd0N3?=
 =?utf-8?B?T2p4eE83UVlybU1uR2c0RjVRZEZkajkvdjlDemdXamNubk5kcGMrRDF3VXNC?=
 =?utf-8?B?b21MQy9wMHF2YktGSmZmLzVLdmZ1SHFNMjQ3T3cxMmxESXhUWDRqQUlHQnEw?=
 =?utf-8?B?ejZpaWxUYW9CdnFGaWxZVWhRNVU1L0VzMWVsaHR4MGFjb0tTakFQVkh1NDBJ?=
 =?utf-8?B?emRKN3Nod1pFUGlVQ3NRZUk5OWo2NkpkRU5aVEVaZW8vZm1HeEthQ0NIZHha?=
 =?utf-8?B?UjBoTnhQb0hZODRiUVVhQ0VjdzJhQTZPVk51L2YyQWd2WmZBL0NPaTdCNER0?=
 =?utf-8?B?NmlkR0NWeFozYXh1N1dpK2ZHMTFvUldhTWQyejM4bVcxckVaQVdwamNVSE9y?=
 =?utf-8?B?cFZCdWY3dm5pUmduRmkvcmJncEdLaWJvdG9UWnlxOTBiN2JxUDRDVldZS0Za?=
 =?utf-8?B?R0Zyb2oreEhSV2p3UlBnU3lIMU9yWWx3SGRLR3lDMzFqM2dzcGFmdHpFOHRN?=
 =?utf-8?B?NFBZK0xNOW1QbVYxNGdPMWJGeG5HU1lsYnQ5OC9wY0l6Tm9UVnkrY2ZEeHRW?=
 =?utf-8?B?OUN2M2hYM0kyTldCb2VXM1VLU1l1b2dDcUNnMDRMejk0ZEdUeGloVHBYeWVZ?=
 =?utf-8?B?cnl0VnVHSlRCaXRNWktkb2JveE1BNEhkUzRmZitPeENhQTMyTHBVL2t2Mm1Z?=
 =?utf-8?B?eHo5b0l1ZmkwdXpBd2pRUGdFcGtQejVzN3k0RVM3clRiTE5UQU5pYVdHSGQ1?=
 =?utf-8?B?T2NLRkZFMmlBUkwxby9RVkwzYW8xV2lVczdWMjVBeFRFT0RFRHM2WjQ2R3JH?=
 =?utf-8?B?bEJFb3JaSUwrWWJSdDNhSTRKYXJ6WjhEbmNBbFlOa2hFbEhEZzZGell3QlZX?=
 =?utf-8?B?enZFLzdGdy9pa3JneG04OXBDRlJRODZHTkVESG1wemdRS3FZa043QjFxWUdk?=
 =?utf-8?B?d2xDcStZTWQ2akJwNisyTWZ3aEtoYmJqQVNUT2RtVGF4N2ZTMmx3bGtzYzN1?=
 =?utf-8?Q?1+3J06lBW65zTNFj1MB19Z9onhjaMsk+?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY3PR01MB11346.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejNtVTVDL1ZqNlQvWFREN2s0L0wzVU0rQTlaQUZ5NzN4K1dudS9zaFIzZU5S?=
 =?utf-8?B?U2lGallYNDZyaTBDYkF5ZEJ4MGFlZTY5YjN6RTllNW5idHgrSDdhc25Sc2xM?=
 =?utf-8?B?b1hlenppclJacUU3VzcxalJPMjZCdDdGOHpMWmIwSmxVTE9VMVU5REovL2hq?=
 =?utf-8?B?NkhzRlZ6RGtmNU4xN01HNjVpNkhFZGh2SDlOWmg4LzBXYVVvVzBVeEJvQ3R2?=
 =?utf-8?B?eERmSmtIQjhDNXZVOFcrTnJIZkZmSUY2b3BTd0ZOanZoelZQWGc5aldrRHBK?=
 =?utf-8?B?czFzeFIxY2tFKzVSQWpWQlkzdWNnR3R0U2VxMjhzbXQrcEVBdEJxT3FFcnhR?=
 =?utf-8?B?TE4xSHh5Nm5MeEo3L3lVSnZvWUtJbWpMUHJ6MUtxcERBY01zSW41Zk1WQ1lT?=
 =?utf-8?B?V0ppOHcvaU1qTkdwbWxSZ0NWbndaN2JtSHVJd0hrN3dxTHFJaXBicjFhMjQz?=
 =?utf-8?B?VTZ0QUVRMjl0LzZwdU43TkJDaUo2MkkyZG9yZjBjSFFRTjMraEs2UlByWUJm?=
 =?utf-8?B?QWlYbXdrUWFXWGVJZjdRb2N5bGJ2K1U4TTBlNWRPSEZYejZWajQzaTdBT1pP?=
 =?utf-8?B?Z2N4TllHb3kzM0gweXYzODltSERKKytHbUpCTzlTeGRGNFdVeGxENFJVc1lF?=
 =?utf-8?B?RHBJcHg4L1kweUt6Vndzc1pXTmJaRmhsQ0JSdXUvaTJ3aFBEZnU1MzhKUHdU?=
 =?utf-8?B?ZjNHdVc5bitCSXJqTnE3WEZWQUtnWmgzTU91MkFGRUYvT0hwRVZKUFcvUk1x?=
 =?utf-8?B?STJSd0oyWFVPbi8yTTQ4VDVrOVRLQ3lwazlucXZ1YVFEenZYVnkrRWxtOWda?=
 =?utf-8?B?S1krN0FHV1E4eFY0RG1XalZCUzdSTW5aK2c4N3E3bE1SamgzeTRCZ01IVXd0?=
 =?utf-8?B?cW5MMzcrT0Nna2ZVRUNtcjNwOWxVcm9CcGN6S1g2b1p2Wjh1YUhzT0RtcHpa?=
 =?utf-8?B?L0lVYUNieTcwelBXeHB1S1gxYW9XWk1zSkRscFY4Nk5nTnNSWnQxeUtrSGJ6?=
 =?utf-8?B?eGtLUDFOVm5NUTMxODdXeVhDSmxvcXJVTzY3cjBjM3hjeHpuWmRFbXc2VUxW?=
 =?utf-8?B?Z0ttb2NHdkUrbzRQeThsRVAwTkJCL1lGa25oMlVnR0ZuSlExdHlhLzBDdTE5?=
 =?utf-8?B?RHFjb2tSblY3dTZnNjhtTk4vUHpTWWFUczJmSCtzOWN2STRQS041MWY0Kzcr?=
 =?utf-8?B?NC9LMktVbWZxRXBNWTRGS01nUG8vS1NBdDgrd29mVzU4L1BjZ01ZUzVMRHpz?=
 =?utf-8?B?N0hmMFZrYUQ4TVNaV0QxVWJYemh5eUVjaTA0SzdJaFhwUTRhZ1ZYdFNHYW9j?=
 =?utf-8?B?SnVxdmRtWDlZQWpVd2NscC9jY3N3UVhYeDlOZjJBSGk1bWN1ODF1aTk2OEcz?=
 =?utf-8?B?eHJvaERPME1yQmJMMXBXRngvNVROa1hKNHI1dTNTN3loTWhRdVB5ODd2MDVv?=
 =?utf-8?B?d3c0STJjVG02WVlCVXdpRWV4Z1RUNkxHZi8wUGZ4aVFVd2dQc0FjMmlzdW9a?=
 =?utf-8?B?MlZTaTM3VkY3YU5zSEdlQlkwVG9MbktONXlHQU4xSFhEbkFMd08zUmdMSUtY?=
 =?utf-8?B?NE5TWnRYajJGNlRkR1RmQld4cjljTG04bThvMmQxVHFsSFp2cS8wN3VKanRT?=
 =?utf-8?B?VXBQR0kvZUJIZTVFSDZaZ0g0RENRWVdZQ01tTTNhT0I2WktJSHl3UURKNGc5?=
 =?utf-8?B?cVhzOGdkbFFleUNlVHBZaHFMRkgxNDJTWldveEk0Mjd3dm04M0tzRjBCWWlJ?=
 =?utf-8?B?NHpCSW9XZkRIOUgvK3crdS8ya0QvQjRoeUxwOTc0S3lleFUzMk1RdlhnNzZJ?=
 =?utf-8?B?TWZCOEJuNGdlVm1CbjZYOWNRZS85ZXBacnY3ZDd4MFliSzRxelF3Z3ZOUWwr?=
 =?utf-8?B?QkhFNFFMNkxiRU5aTUt1VnpXR2JGSjlwS2RmeTQweTJZdFBMWkJpRlAxUkE1?=
 =?utf-8?B?eXQ4R1IvMFZJSHNiT3QrL1RqWDNBQWZmblVYK3oydGZoOWtQQmNWN0dTUjZU?=
 =?utf-8?B?ZVFwYXVXckpEQXZHRXo5M1JMdDBVbFVzZkFaQmYvYXVGam5qYS9QUi9EU3Iw?=
 =?utf-8?B?dk9nSllCajdrbVgwK0lVMUQxeDkvU0czNjJjTUVyVHRVNFhid2NFVmV5UVB2?=
 =?utf-8?B?YjFXb1hyUE90djNORmI3WFVBbGpPcTVNYmhVTzFPRlBvRDgvN2dhcUJKN2Mv?=
 =?utf-8?B?S1E9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a0f90ca-a5ee-48ac-3fa6-08dd4476972e
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Feb 2025 17:17:08.9426 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ymiL3w7+sDL08ZrI4qVj2idYXLCB3g+v9OpdabX5rHGrApAwQz/qeJYiKXSC+50Sq7Ya8aqMWPpl7VWrAKU54vadRNoU0J/OeayckGM4eqY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9844
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

SGkgUm9iLA0KDQorQ2MgcmVsZXZhbnQgc3Vic3lzdGVtcy4NCg0KPiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KPiBTZW50
OiAwMyBGZWJydWFyeSAyMDI1IDE2OjUzDQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjJdIG9mOiBi
YXNlOiBBZGQgb2ZfZ2V0X2F2YWlsYWJsZV9jaGlsZF9ieV9uYW1lKCkNCj4gDQo+IE9uIFNhdCwg
RmViIDEsIDIwMjUgYXQgMzozMeKAr0FNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2Fz
LmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBUaGVyZSBhcmUgbG90IG9mIGRyaXZlcnMgdXNpbmcgb2Zf
Z2V0X2NoaWxkX2J5X25hbWUoKSBmb2xsb3dlZCBieQ0KPiA+IG9mX2RldmljZV9pc19hdmFpbGFi
bGUoKSB0byBmaW5kIHRoZSBhdmFpbGFibGUgY2hpbGQgbm9kZSBieSBuYW1lIGZvcg0KPiA+IGEg
Z2l2ZW4gcGFyZW50LiBQcm92aWRlIGEgaGVscGVyIGZvciB0aGVzZSB1c2VycyB0byBzaW1wbGlm
eSB0aGUgY29kZS4NCj4gPg0KPiA+IFN1Z2dlc3RlZC1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcg
PHJvYmhAa2VybmVsLm9yZz4NCj4gDQo+ID4gLS0tDQo+ID4gdjEtPnYyOg0KPiA+ICAqIFVwZGF0
ZWQgY29tbWl0IGRlc2NyaXB0aW9uLg0KPiA+ICAqIFVwZGF0ZWQga2VybmVsZG9jIGNvbW1lbnQg
YmxvY2sNCj4gPiAgKiBBdm9pZGVkIGNvZGUgZHVwbGljYXRpb24gYnkgdXNpbmcgb2ZfZ2V0X2No
aWxkX2J5X25hbWUoKS4NCj4gPg0KPiA+IE5vdGU6DQo+ID4gZ3JlcCBzaG93ZWQgdGhlIGJlbG93
IGZpbGVzIHdpbGwgYmUgdGhlIHVzZXJzIGZvciB0aGlzIG5ldyBBUEkuDQo+ID4gSSB3aWxsIGJl
IHVwZGF0aW5nIHRoZXNlIGRyaXZlcnMgb25jZSB0aGlzIHBhdGNoIGlzIGluIG1haW5saW5lLg0K
PiANCj4gTm8gbmVlZCB0byB3YWl0LiBQbGVhc2UgY29udmVydCBhbGwgdGhlIG5ldCBvbmVzIGFu
ZCBzZW5kIHRoaXMgcGF0Y2ggd2l0aCB0aGVtLg0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4N
Cg0KU3Vic2VxdWVudGx5LCBJIGhhdmUgc2VuZCB0aGUgcGF0Y2hlcy4gSG93ZXZlciwgQW5kcmV3
WzFdL0tyeXN0b2ZmWzJdDQptZW50aW9uZWQgbWUgdG8gd2FpdCB0aWxsIHRoaXMgcGF0Y2ggYXBw
ZWFyIGluIC1yYyAsIA0KDQpDYW4gaXQgYmUgZmFzdCB0cmFja2VkIHRvIDYuMTQtcmNYPz8gT3Ro
ZXJ3aXNlLCBpdCBuZWVkcyB0byB3YWl0IHRpbGwgNi4xNS1yYzENCmFuZCBvdGhlciBwYXRjaGVz
IHdpbGwgdGhlbiBhcHBlYXIgb24gNi4xNi1yYzEuDQoNCg0KWzFdIGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC85NmZiY2NkMy1mZDc5LTRiMmYtOGY0MS1iZDBlM2ZkYjJjNjlAbHVubi5jaC8N
Cg0KWzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC83ZmU5ZGFkOS04NWUyLTRjZjAtOThi
Yy1jY2EyMGZmNjJkZjVAa2VybmVsLm9yZy8NCg0KDQpDaGVlcnMsDQpCaWp1DQo=
