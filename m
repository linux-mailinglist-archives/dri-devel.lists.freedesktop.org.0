Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 201009D950C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 11:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47DE410E80D;
	Tue, 26 Nov 2024 10:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=avnet.eu header.i=@avnet.eu header.b="bvxnsm6t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 901 seconds by postgrey-1.36 at gabe;
 Tue, 26 Nov 2024 09:57:51 UTC
Received: from smtpemea01.avnet.com (smtpemea01.avnet.com [193.34.102.203])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6BA510E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 09:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=avnet.eu;
 s=20201007; t=1732614168;
 bh=mJlu3gbRWRqarJkVTrxW8EcciX7CITvLHHyPB/20dN4=;
 h=From:To:CC:Subject:Date;
 b=bvxnsm6tnL/1GEgonMoH7mwtNh5/bwjJ/VoEEgUjszuScKAwUbuSucSVUZPLJEe7x
 JoTuD1RZAKZn0eyb07QqkPxF19S9Q+nc6cyVgD1AjSql4lkcFfl+HZ2eP9E9bXRrCX
 gvubucwLo5QWGXj/QjJbPJxlaa5pUlAbhdGFH0+GS/XgVWSUazUNiiEsRiyV4yTy4E
 CG+Vx8QrOjfhVvFfL4TiIyLOXSgBqiPNFrAJ+QyCiVra7JhJiV4E6JdPZtO0tgLuqN
 Dmo0JhRgFgh3vuhxPizEPXKVLTC7LRyTua785DIpFo2Ur+7h7H0WbZvrJ0JoRAy+C0
 mUufOY/F6Ickw==
Received: from DEPOIX0MX19EMP1.emea.avnet.com (Not Verified[172.23.112.140])
 by smtpemea01.avnet.com with Trustwave MailMarshal (v10, 2, 5,
 6043) (using TLS: TLSv1.2, ECDHE-RSA-AES256-GCM-SHA384)
 id <B674598180000>; Tue, 26 Nov 2024 10:42:48 +0100
Received: from DEPOIX0MX19EMS2.EMEA.AVNET.COM (172.23.112.143) by
 DEPOIX0MX19EMP1.emea.avnet.com (172.23.112.140) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.13; Tue, 26 Nov 2024 10:42:47 +0100
Received: from FR5P281CU006.outbound.protection.outlook.com (172.23.112.39) by
 DEPOIX0MX19EMS2.EMEA.AVNET.COM (172.23.112.143) with Microsoft SMTP
 Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.13 via Frontend Transport; Tue, 26 Nov 2024 10:42:47 +0100
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BIPnM9AxEwjj59/v5+bkmJGfwvFramDPlRv4aY5KahlY3C/rBXUZCaijnPS1d+4BW2vno9Vk07HnkxmVP1Fbs1wZz1Bhu/OdNYBW1Uihp/m/KwzzaipFzEu2RpOuXTHaro18VmUi0jM10d+EsM0QbfPc03jTZotncIoco5NXrJQM20XZORssIwHhaVBkc0LS5pRFK8EZqkW1h0JCRgYroTxu3k40UIgvVQsDjdcv+azK35W3BoTFASiJMDV9jHDpdDsAYVHOvcduIJOzV0d1gHJgzGqz9i1WbeH2zyI5JjTPczJTB2fjP5ewP1/WfH//GgFNOSM5Zd8cS2B9CKOU6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=45KPBk0ob/t7hexxkdoEU+cGkVUyo3bJHq/O1Llxk9c=;
 b=MeVY1JoNmp0CnG0uK/hm0qKDYI0XLt963Poqn9oBjn70YO5EG2dhQNdjhLXvpcyIEctGUfkuzruvNHLL1zv1jVSNnMC43Opqi79TB7OLy0gUXoOxY+IZgfG2AyBPmK3TsMewVArYZTj1sxMj6pfwUwKCAxO3odcLNUAOLcgxAnJ/gAYDJaVCRJP3xzy2Q3vkpZuTCdT84hxB+yDb2A+b/DZhg8Hprx3Z1A4F2BzPtX9c/KYF9XrpIojbwG7ma5ekyWFQPVQIJvw3E8WVn9xw4jRcJ71IkbO0s2Fp01Ib6HXnhriKlT3FQPMlznqC6HDTDvBgE14/M9EKZD9ImpCoWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=avnet.eu; dmarc=pass action=none header.from=avnet.eu;
 dkim=pass header.d=avnet.eu; arc=none
Received: from BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:11::12)
 by FR5P281MB4603.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Tue, 26 Nov
 2024 09:42:45 +0000
Received: from BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM
 ([fe80::98bf:b8ad:bcbf:e2d2]) by BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM
 ([fe80::98bf:b8ad:bcbf:e2d2%5]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 09:42:45 +0000
From: "Bauer, Markus" <Markus.Bauer2@avnet.eu>
To: "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, 
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: [PATCH] sn65dsi83.c: fix dual-channel LVDS output also divide porches
Thread-Topic: [PATCH] sn65dsi83.c: fix dual-channel LVDS output also divide
 porches
Thread-Index: AQHbP9YL0igL7kZcgEy1lSyLQJGzXg==
Date: Tue, 26 Nov 2024 09:42:45 +0000
Message-ID: <BE0P281MB0211EB59ADE02F4DB8F9D0CDC22F2@BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=avnet.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BE0P281MB0211:EE_|FR5P281MB4603:EE_
x-ms-office365-filtering-correlation-id: 999406ba-cfa5-4b24-7a25-08dd0dfeae74
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?Cm7C5qWAHG+Xlfpu8/jAE65WGpXLEcarFNzw+jwS2pB+xG7pZo511oQpe+?=
 =?iso-8859-1?Q?jF533B/AKKvSboR453I2QPJ9jcjsN98X2aq1MP3P5aa/POkesA88Mf7LmE?=
 =?iso-8859-1?Q?bI4QcLG1Ue2KemiCdOWzeM/3Cg4ToIt0KwrKxx5Ung2C/8st+mW2ZMCD5F?=
 =?iso-8859-1?Q?TlG4Z4R5mByypuCWYR5XILbZdt/DxxjNvldec8akK0vYSIewtghFoD6Nrw?=
 =?iso-8859-1?Q?tMjyFB8Xp6opF/WomG9aL4pm4vF+ceVu5ntxE3boeCUv50fcGYRrGK5u8H?=
 =?iso-8859-1?Q?AmW8eWAsg6nygNhj/4AQ7fSVLd606Xx3iMG9nsF0Dj70xFviN8GS8pjaAx?=
 =?iso-8859-1?Q?Vbi6uhSw+Is6XB0IzP6nKtdNkv5SHQf0PI28d5LcxE+AiWXrBScBGZD3oe?=
 =?iso-8859-1?Q?EzDxIOQsuuhIPHuiNRS8v1D24/9BXkzGBCag+qyNriYPagz2P++DFQ0q43?=
 =?iso-8859-1?Q?IWwIc7LQ3UlI10mCD0sP1MbV8HBuChKKlUncOiv8QUDY/LAlDDFTxl1wc8?=
 =?iso-8859-1?Q?PaXqNRc0Bs39u0jwtHQ5E9Rosow/qUkKAWQaPrr+EGnlOeafjPa+z4cxsR?=
 =?iso-8859-1?Q?fteE6iNSjTFWKZoDBXIvpbVnjQoRNJDdLAqgz4O5+yGMdSOSdAOJOWrIbc?=
 =?iso-8859-1?Q?vMg376GI5fyXjZY68SaAjGpd0YEi1pgdlgCvruWxqpBBhDrR8QqL9kC+Nn?=
 =?iso-8859-1?Q?tTwz0SIz/rqlve1kP8juTvxDY8bSW7rf0aNwj7r/0gX4lmE/596mq7M1fb?=
 =?iso-8859-1?Q?Or8sjfvxA0Tb5xQcn8ldby5Lx104SEg45KQAkfJbKI5F9nZLnVgv24gPnz?=
 =?iso-8859-1?Q?iBtIlttkwW7atSZW66qpYGV6wAVv1rs9dc6L0FMtIQKX5JJZA7dH/SD/o7?=
 =?iso-8859-1?Q?iFFwZs4iECOHSCzKUFtLvhcoEjL9p0vB6gydOP229bQdSCRYZHsVJ8n5m5?=
 =?iso-8859-1?Q?u3q4JstIOWY+U1LFysK9zKG1rgAZNHW9hOm1uzSI7D5C3N4pKz0Z4/v1cE?=
 =?iso-8859-1?Q?M12oh1OXOcGk0tg+AJSWK/33pt3SsYac5H4ZAJIKUnpWToA3DPFCg48p57?=
 =?iso-8859-1?Q?FUhoxJoF2q080QvGlhT94j2WJDrCS5RbComkr9aqtcRtagQGBKS9Usx0SG?=
 =?iso-8859-1?Q?Z12zWd+rKGDYVYMf2sOl4+WQNOj8Wybla789SUD09HVMc5mY/tb7qAuK+Y?=
 =?iso-8859-1?Q?Q9x/kRf7vVFd/CDJcec+THHvTmsTEchaetHPCr9c5ehErc1xwd2xFJ/PfZ?=
 =?iso-8859-1?Q?ANULCshkyUdy4yv5LxsUHz1KQElkyeK9Tn0lIFlXZ07AHRYz+AZMmwO+Da?=
 =?iso-8859-1?Q?1jWHxG9Gp8bCzF02pIZt35g+57yylhAYARe6kchKitSVJ+7J689y9Oyb86?=
 =?iso-8859-1?Q?pEVCcGz67MpUIodb0zGZAHaO81g46PKp0DLL5vLEDBG34j3c37HtQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?eb3+eap0EwaRjAXaaGaVI+kNEDcLsY2j8fduQab79WWvgxN6yiILYPq01p?=
 =?iso-8859-1?Q?p8CJqm4l0AbVloaDUFCXXKlaV7oOPbI941GOFBEXJytVC0qn1C//igqxK6?=
 =?iso-8859-1?Q?1UDxc4eiWom3osX0QurUX9HdkTtyjYbaQ3lEZQb9inm63v1KHfPjtM+rKJ?=
 =?iso-8859-1?Q?/7XFh4By2P95nReSNLNb4PV0GoU0lbIqQkBfwRRyFlqPizfZBViqXmR+q3?=
 =?iso-8859-1?Q?SfYa8sWGERAFE9pva5gg2HH7gWmi2tc1coK+mKudfnkY4jptR8efF+bSFx?=
 =?iso-8859-1?Q?kP0Gkz8+poedIiDhWi6AA/sEgNKrqUeKvMAXY16HpQr9L/gULVcFsnMI5Z?=
 =?iso-8859-1?Q?8JG0X7Y10ANnvmyJ2RR/D1uQjcLr+d8FQR7TozkCpPEgb9TJGq8/dqa9sD?=
 =?iso-8859-1?Q?QRxFFQSKFCsrnHaMBgI/V5wh4jMD3lSEKyD/zdo2X+M3mcBZwsx2twKbTJ?=
 =?iso-8859-1?Q?7ppIVQ2rFfLcBejV2wdKPrevzR9D1yjLCFOhfwalG+fjZF0SxDIbQ5lQD2?=
 =?iso-8859-1?Q?1LkM6n+PWXq2G7WrnxNy40UQYctAxZ4aP/xlTSIDToWf51CaZ579PqV87o?=
 =?iso-8859-1?Q?2Ozl0bwqVel6m/t8pDuTQ0jLZ1IfupoeFCbWoYk/DI+r+mVf33wKveNO6L?=
 =?iso-8859-1?Q?Ln/j2tGapknbdDH2fTIrItsn2sK/7pbVp57562o/fWGIkSwlynpjpqt7sM?=
 =?iso-8859-1?Q?K8uAN7TQCJTZBLIj49d38ybwVTFErirM3e9VoSk47S5o6axIRRq6ttQMNu?=
 =?iso-8859-1?Q?Oncv5Z30+t5X6fl406Mv7OTTJbp6GUcfYKJMaa434dC5wjfJIFNXc2SU8z?=
 =?iso-8859-1?Q?lHt+eBB3ABR40jK4T80mhI5nCKv3r5GZ1f7JVDPYd7m1WS6zXMtpPNjpYE?=
 =?iso-8859-1?Q?aG7RubaGEOlyDHMx+jdTU937aeAbsACaoaRBcoLRigXOSr+GWubuHv0UGB?=
 =?iso-8859-1?Q?G3xkcRu4GlcDk+cbL8bKMhAeZC12Bdn/JsviUeVjd40V3TOGcb2SKOEJyC?=
 =?iso-8859-1?Q?DujfexRHAqf9Znce/3EBldPGnnFJJXa0J1mxAaue881rHbA39EdP8U0mPz?=
 =?iso-8859-1?Q?LmZfxCK9X2fyxapVWTTCiro+MCaKXYYErIfhVy4wXBcwW29FU+rbxnPmWf?=
 =?iso-8859-1?Q?/VKHXZvTDgOwkmj502OTDINe1s9POz8X41YZsSDZ60rqv41qlKm8TBggA8?=
 =?iso-8859-1?Q?IylkkDJZiDbnAbd8vtn0+iMq18pBmpd52EXjijs1HEXZDpuL1E8jpRAgtO?=
 =?iso-8859-1?Q?XipmNk+bn9tP/QIX1TzTe6ZLfR6XhCOF/LG7ObDd8Nyp9a9nZjuyK02ipY?=
 =?iso-8859-1?Q?+eJiLmodA0tYHtN5QIxOYsUtDKNBJrEDZ5ItU3mprKR91jBqkMD0O4hlaP?=
 =?iso-8859-1?Q?7oaqRuDmo7WnfyVM2oU0sPkhM3FQSy5TrpI6Tvq6xu+Hyxhov6MSqgQUn1?=
 =?iso-8859-1?Q?UmfasQ2k9SHVVTeQoAnM6ddJuBgbC5q0TZPn9DaDMLah1Ool+DsyV0Ev90?=
 =?iso-8859-1?Q?nslTtCd1hMnYFDimiipwtHJ8KBwLuinp9QTXXfrR6AY4NKJW2PYdD0bVFu?=
 =?iso-8859-1?Q?UPwApoNV82/1AC5R5k4+ayIktAoC94tSy/c+O9eet5mL6R4MFU3V/tosJJ?=
 =?iso-8859-1?Q?fov7/Mq34wc3U=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kUknx5teqdwxFSWj5kl9dLUxJaYev4MDejQiC69SFM8/d8CFuoNM+oQd3bNIjdGbc0et4P1scgzUda94a9wssBg/72SM6Ee7UZBXCaDuxcaC358lY1dd25FbkmgYVXsTLnRb4DZu+E9hQY2jp1iuelsZsWhprHRKL3iT4SAjkJCqb4/tq1aTKZVtSuuT5UURyndFlEUbYadbMDbZAEUiPd8zmndHjpp1ZN/QWfuOlSSdCV63qFzjdZHEh55buaJsui32uFFy91v/vQmXf3SQvlFVIKQ5nQL+p8pbHA6OrZJJcMchWjfZ+erbI2I8M2N/a74gu4UbUQCmU5tywYtJr3+UjiTYNgbccVkZ0qP7PHO+e89GTJQLkX9KNq+byPsEg5rXaYcwz8FcyZyzfFX43w59mLIu56Qms0LhnULKdqC9t1TB2PGicqtfGw+/SEbDTo5wKq6hvPnIPkGd1uzPsTFti+1yHUoR50895YPEgqCznTa4jA8rtx/YVpJxtPJ+z+UvxhiGboK2QxXmGSWqhSyVV6kykBIMtjg+cVGyeyCE/SXN2zWFuDuYjyE1fFB6Kx0gM/FqrcBqCOXnILwP61ysK5jpVvgqcE2oZcyORTLxXy2RzcThy9z1ySFMIP/6
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BE0P281MB0211.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 999406ba-cfa5-4b24-7a25-08dd0dfeae74
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 09:42:45.6008 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8820279b-c0be-4bde-83ed-fe6b6f9724d5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g+n4HAftqC096eMJgzGIQLPLmJ46MdJ4Q0Ze6D+H1K+cYsoNFdjUCetRGnEHs2BUB8tMiXj+0h0vd0dPFpbOhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: FR5P281MB4603
X-OriginatorOrg: avnet.eu
X-SEG-SpamProfiler-Analysis: v=2.4 cv=KPoID0Fo c=1 sm=1 tr=0 ts=67459818
 a=SsRr5/1Z2tpKHRUDVTcyRg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VlfZXiiP6vEA:10 a=cfxL476SPWAA:10 a=VwQbUJbxAAAA:8 a=npiypiU9AAAA:8
 a=IDoUORj9AAAA:8 a=cpywmP4KawexDyEaKT0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=U5QfeDdlIO9jQLzCQbpp:22 a=3GNAIP-vjoKa_dZcoIoZ:22
X-SEG-SpamProfiler-Score: 0
X-Mailman-Approved-At: Tue, 26 Nov 2024 10:02:25 +0000
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

sn65dsi83.c: fix dual-channel LVDS output also divide porches=0A=0AWhen g=
enerating dual-channel LVDS to a single display, the=0Ahorizontal part ha=
s to be divided in halves for each channel.=0AThis was done correctly for=
=20hactive, but not for the porches.=0A=0AOf course this does only apply =
to sn65dsi84, which is also covered=0Aby this driver.=0A=0ACc: stable@vge=
r.kernel.org=0ASigned-off-by: Markus Bauer <markus.bauer2@avnet.com>=0A--=
-=0A drivers/gpu/drm/bridge/ti-sn65dsi83.c | 16 +++++++++++++---=0A 1 fil=
e changed, 13 insertions(+), 3 deletions(-)=0A=0Adiff --git a/drivers/gpu=
/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c=0Ainde=
x ad73f69d768d..d71f752e79ec 100644=0A--- a/drivers/gpu/drm/bridge/ti-sn6=
5dsi83.c=0A+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c=0A@@ -399,7 +399,7=
=20@@ static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,=0A=
=20	unsigned int pval;=0A 	__le16 le16val;=0A 	u16 val;=0A-	int ret;=0A+	=
int ret, hfront, hback;=0A =0A 	ret =3D regulator_enable(ctx->vcc);=0A 	i=
f (ret) {=0A@@ -521,12 +521,22 @@ static void sn65dsi83_atomic_pre_enable=
(struct drm_bridge *bridge,=0A 	le16val =3D cpu_to_le16(mode->vsync_end -=
=20mode->vsync_start);=0A 	regmap_bulk_write(ctx->regmap, REG_VID_CHA_VSY=
NC_PULSE_WIDTH_LOW,=0A 			  &le16val, 2);=0A+=0A+	hback =3D mode->htotal =
- mode->hsync_end;=0A+	if (ctx->lvds_dual_link)=0A+		hback /=3D 2;=0A+=0A=
=20	regmap_write(ctx->regmap, REG_VID_CHA_HORIZONTAL_BACK_PORCH,=0A-		   =
=20 mode->htotal - mode->hsync_end);=0A+		     hback);=0A 	regmap_write(c=
tx->regmap, REG_VID_CHA_VERTICAL_BACK_PORCH,=0A 		     mode->vtotal - mod=
e->vsync_end);=0A+=0A+	hfront =3D mode->hsync_start - mode->hdisplay;=0A+=
=09if (ctx->lvds_dual_link)=0A+		hfront /=3D 2;=0A+=0A 	regmap_write(ctx-=
>regmap, REG_VID_CHA_HORIZONTAL_FRONT_PORCH,=0A-		     mode->hsync_start =
- mode->hdisplay);=0A+		     hfront);=0A 	regmap_write(ctx->regmap, REG_V=
ID_CHA_VERTICAL_FRONT_PORCH,=0A 		     mode->vsync_start - mode->vdisplay=
);=0A 	regmap_write(ctx->regmap, REG_VID_CHA_TEST_PATTERN, 0x00);=0A-- =0A=
2.34.1=0A=0A=0A--=0AMarkus Bauer=0A=0AAvnet Embedded is becoming TRIA:=0A=
www.tria-technologies.com=0A=0A=0A
We continuously commit to comply with the applicable data protection laws=
=20and ensure fair and transparent processing of your personal data.=20
Please read our privacy statement including an information notice and dat=
a protection policy for detailed information on our website.
