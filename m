Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90BAB01DC6
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A5710EA5D;
	Fri, 11 Jul 2025 13:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="irolDatK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazon11010042.outbound.protection.outlook.com [52.101.229.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A35510EA5A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 13:37:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FocGNsakWvV1zg1FXBZCGrPlx6ADlDMAngO1HXyWNheRUezwlPjht8BZUWTlk1ISJxvmoTvr79fjCHvhpsl3wPr96mFRlfL3cMX6Kysxw3UMMPJDrf41INyx0WJBkxzL1v9fdV6CogLEjlfB8kaVHIo6yK5+UKhFU2gWxrxsc+weAwrUcPh6MOIlW5j9GsezEgBnSWIoJPrGoELbD4CAi+mdXpg5sttM3KSuhxqAo1BudKS6EXILKlH0oQCmjfHaS+01yqbHj131vbiS2/D3N6oNQwcldDZMe69h4XjXDA9zjeN82GFlIAQ/tWBPuAwrSfeyiwlLjOzeR9J29F9KlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ohKyLafKTxKcVDeRaVZBEUEW3vKNBa3R68pQpr91SSQ=;
 b=rEDGsBHM9ss9iYpCAIz3+HQe6gEYALQHtcuHVxm5wdZMWVI41tGP7JTU+hkhakhGABf0zM3hMGD8AMfRF1dC0tyNGe7waFkGJkcp7MXCpLy0MVW9eKzvZ/Cph/lSSYztZruztBVmmEv9Ahdi5iwL6JIkaEwyWWA3Jalsh1abbDhxBYia+DwIQBiSm4bQdWxYkDN9/M4TfSONmgdIWtMzuQvMV9oVSd0/PgBOMbLJz6+Xmts3aVPO2gAO3iLk2UaExI5rCudwQxHePdu0ObzgyvQHYPcgVRDoRY2yoU9Jlt1/buec3PZ4+aJrYWgnhYYT/ea0KVDcv8EG734KxU6sEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ohKyLafKTxKcVDeRaVZBEUEW3vKNBa3R68pQpr91SSQ=;
 b=irolDatKtnifd2rOqP5YpH7Rmmpm9USy1IZHRVa80uPWaW7WxKAOFYAYNBLla0i54C/fAU7FXqnDatU6DSQtAXqsgJjkN5gG2m+G0kZPeMu9Vxg+Y7S7TCphRBOyWYQHTa2HbfWK1Tu/NdNGSBLwOMUrYW8V3DOhPTUVkBPJ2ck=
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com (2603:1096:604:1a2::11)
 by TY4PR01MB12614.jpnprd01.prod.outlook.com (2603:1096:405:1e6::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Fri, 11 Jul
 2025 13:37:09 +0000
Received: from OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5]) by OS3PR01MB8319.jpnprd01.prod.outlook.com
 ([fe80::3bc8:765f:f19e:16d5%6]) with mapi id 15.20.8922.023; Fri, 11 Jul 2025
 13:37:08 +0000
From: Chris Brandt <Chris.Brandt@renesas.com>
To: Sergey Shtylyov <sergei.shtylyov@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Hien Huynh
 <hien.huynh.px@renesas.com>, Nghia Vo <nghia.vo.zn@renesas.com>, Hugo
 Villeneuve <hugo@hugovil.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
Thread-Topic: [PATCH 2/2] drm: renesas: rz-du: Set DSI divider based on target
 MIPI device
Thread-Index: AQHb8RPw+L75Kt4Da0m2Mk7TuNn6ALQrC60AgABFK6A=
Date: Fri, 11 Jul 2025 13:37:08 +0000
Message-ID: <OS3PR01MB8319290D13A2BC57E757716E8A4BA@OS3PR01MB8319.jpnprd01.prod.outlook.com>
References: <20250709205532.747596-1-chris.brandt@renesas.com>
 <20250709205532.747596-3-chris.brandt@renesas.com>
 <924e885c-dc19-49f7-9991-58b6e248b208@gmail.com>
In-Reply-To: <924e885c-dc19-49f7-9991-58b6e248b208@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB8319:EE_|TY4PR01MB12614:EE_
x-ms-office365-filtering-correlation-id: 8b5620fc-4199-4c8f-152c-08ddc080088f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TlorTUp2aTdqbTdEMFhSbFU4SXdEZEhBZ3Y5MndIcUMvYTBzS0lhK0tEbVhL?=
 =?utf-8?B?WWhOTWNFRzRxbWEyaWRYYWRBM1dXMjNvYWEwa3Rmb3Fsb1FUUVRiQ2tUczU3?=
 =?utf-8?B?WmdmV0tSZS9FMTJQZHdrc3A1R3FxR0VlTzkyQ3EyRzhRTjdLR25EU3EvSnNQ?=
 =?utf-8?B?MzV6NWg5RGpwOUlVV2VNQzdvbkJLNVlUbXRuWDFudDNLV1hkd3dUdzZ4SjFw?=
 =?utf-8?B?TzFLQ2xrT2QzZCtCK0pIQnU3WGxCVWNGdlZleEFDdTJLajlJV3R2SE9BcEkv?=
 =?utf-8?B?ZmxwQUY5RU9KVlk2TWFyY2ZPdTdtQkxDUENqbVFTcVhIV2FiVnNQNFhOQXFO?=
 =?utf-8?B?Z0QrN1JXSklTRjFhQjVrNW11ejF3NCsxMlpwNWtHdVFHWnF6Z3ByaXcvRjA3?=
 =?utf-8?B?UUNtbmx0NGw1NlA5RWpmMUd5NTFMQlRCVmc0L1pvRHR6RmdFL084enl4dGNV?=
 =?utf-8?B?NXllbzlteUIvY3g5d29oeWxhdURRSyt2YmhpSExYT0xiMWJvQTRicFl3ZEJU?=
 =?utf-8?B?UHdMKzdPczQvTndMemQwdlllS3JiZFQwWTV2ODBZSWdzcmdoRHVmZjJEbzgv?=
 =?utf-8?B?UE9DTkZlUGVuemFqR21XR2tLKzJoU1cxbjNTNk16ZmZaZVI2U254aWF6MWcv?=
 =?utf-8?B?Q29lcXIwMHlwWGxCQWZIMnkweEhFWHUvRGR0dVVrNnR2TFpCMy9hbHhlOStE?=
 =?utf-8?B?Q2sweE1Sd2hmSjdUeW8vRkVrT1JITXV6UzhkcmgxQUZ1R09lUlFlWG8yMm41?=
 =?utf-8?B?Y0VPTkQxRW9kdHc1TTBCOEhRWFE2NnRPejZ0djlvMVJLMzd0UzE4ZnlJNFdu?=
 =?utf-8?B?Tm03TVJicU43Y2loY1drY3c1YmRLTnZnOVRUNitmTTRrdVlGeVBqYk1RR0tB?=
 =?utf-8?B?Q1QvMUl0aDd4V1o2RXd3M0VFQUcvMnBLd1Z1aXpkRWFjZjVOUXZUWVo5TGVp?=
 =?utf-8?B?dVplTFA2SjNRRUljdGU3aFdvVXZ4QWoyZFNCR3pIZ2hoY2lQay9DVnBnc3NX?=
 =?utf-8?B?K2RNd2dqTTh3WVZDYUZPTEFwNFk5aFF0OHkyVi8vS0RLbUhSVXNkWXBqREpI?=
 =?utf-8?B?VGcxOTFYaVk1cDFEc2FaL3hBKzhpYkc5UGhhUmxwQzE5OXY3NG1Yc2JHd0U4?=
 =?utf-8?B?NWdUMXQwNFB2ZTZScUhzL3dHaHRwT3J1NjFVVnlFMkM5dTVTRytBaitOa0lZ?=
 =?utf-8?B?bFQwT0VnbE1pUEFLNkREdTNoTEl6b2ZDYWtaekhVNnc1RUlsQVVET0Zpdktl?=
 =?utf-8?B?SEpsNU5ZV3dFQkRwRFZUU2x2c1kvNWNPVTB6TDVIcHQ3OHI4QWFhREQ4S0VI?=
 =?utf-8?B?VGFLdUFYcWVnUEZHc0o4bVczbCtiQXZRdEhZcXNkaHNlRE81RGlkaDJuelU1?=
 =?utf-8?B?Nk1VbGtwS2daUjVkY0VNMDVTTGdhRVpBS0RyV3hRRTZWVCthM0hENmJDUk1Y?=
 =?utf-8?B?VTMyVXlZcXZEYU93RWo5SEhaMlFDS2pPVXA3ajYwRXBuWHNZSUZ4MlQ3dVN6?=
 =?utf-8?B?YzJjUHA5M2ZzU2N3VGV0enpnWDFDeGRtcDZPS1JuT1dGL0lWcFVRL0oyUjhV?=
 =?utf-8?B?SXlBM1V3UWZlVWtzdWs2QWNQMlF1ZjlNM3B3K2pMTmJqTitpY1NnOTZyVjJC?=
 =?utf-8?B?RC9pOGEvYjE5M21CcGZMZVM2K0NpU2p4TWRkOFBGOTZkd2VVRk5KcmI2eFMw?=
 =?utf-8?B?VWVFVTZOZmN1cmVHMFU2MjY3b28zWURGSkVQeEtPZk5CUVZGejVYZkoyWk1m?=
 =?utf-8?B?QUhTK3ZWWEcvbFpnMHYvUFNyb09uOVNBb05HRmRYQXppeWI0RTNUbmhyNkRL?=
 =?utf-8?B?d2ZpQmxuNjFpNnAzb3JBdTZDWHRodUFZaTBQY3h1eEtYRW5zOGZONXNjcVRV?=
 =?utf-8?B?Rmlpd1VHZFdIWDNseDBrNWZ3VHA5NXZCSlRUbXIvVCtzbE0ydk93V21teVpD?=
 =?utf-8?B?NEF3UjdsMVhSaFZkVU1JblR1bTF3UlRIdVdqUXdTOXRsL3N3RVZJS3NOd05H?=
 =?utf-8?Q?ADaEPOwOHCYJCBkVQwv6ff+V9Ovnew=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8319.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUk4NXg2WHJOWkRkUklwdTJIU3ZpSngyNnJIenh3VXc3STV2ZGdybnFZdlkw?=
 =?utf-8?B?bG0ybkNIVENOV3Q2UjdYT0lhc01jYVNPRksvL3hCSjVTL0FQYmtHM1ZYL1ZV?=
 =?utf-8?B?QVV0SDlSY2piN0pKcjlPMkRRcFpNYnZSRndYT0FLREhEd0VCdU1WeStnSVVS?=
 =?utf-8?B?VkM5UWpjWEdRaVhBVTgrZDVOaFpKaHZ3d05uamxGWklNZ0xGK2YyUm83TVJz?=
 =?utf-8?B?aDZlVDdOU2EvZ0g1LzZsZGlLVCtrclEvMlVSYW5OcWZIYnpDODR3SkdxeHlJ?=
 =?utf-8?B?TTBtVkZtdkxLYnJHMlgxT1lwNFVpU0VPUzc5ZmVaM01ZSUZlSDk5bXZycUFF?=
 =?utf-8?B?c3ArZzVBb0t2SHVyNDEwd3MxWDIzTWpqenJHOUloOUJtTE1IUlVaNmRXS3A5?=
 =?utf-8?B?M0FOVlBqVUJYRkVaSGF1ZjlrQkZTb1Qrc1dxNXZ4K0s1RHJ6NTV2S1pLNlpM?=
 =?utf-8?B?dzRlNXAzb1VYZitpQWZwZ2toQ2U5SVZZVGlOY0ZrWmt0K1M1UFc1OHFFcUZV?=
 =?utf-8?B?d0d5TCs1SFVPOHBFWllaT3VwVHpaYlgzamphQlcyUGloWmxLaUtmRHBiaUFJ?=
 =?utf-8?B?UG8wZ0xFbTFQS0pBUHFIeEpza1hXNnFhUVVQU0w1Y2N4TU94eG1SYTk5cCtY?=
 =?utf-8?B?YmZCSkFUaGZ4RUdSSC93VE55UHhpUUNTS1RTakNDOGEyVUpSUWtvcTFuaGo4?=
 =?utf-8?B?eSt4ajZnNE1GaWlFL2IwdkhBV3BXMTR5RldBMEVKQlQ2MDBWQndaR2dJSlZ6?=
 =?utf-8?B?Z1JkNWVhSmJUUTNmdWFWWmRKVEk2VFBrTCs1UCtQd0tJY0JJcVVRdWlPMFIw?=
 =?utf-8?B?RE4xWnVHdkRjNGdseiswam0rRUVDR2pUTmF0RnZhZVl2VnFrZ09yalRMTEFP?=
 =?utf-8?B?enFiNVFNWWp3RWwyTVFmTVFKcnhNeWpUWWpjckJVdkxqZnNvOGo5N01mRDdB?=
 =?utf-8?B?a0Yvd2RwY3JYdzMvM2pBNEZERFplSis4dzFVTnl5b0grSXJSZExka1daclEv?=
 =?utf-8?B?aU1rcElienFKdFZhODlrajlSSHpIeUxaVFFkWnlqbG9yZUpVbmlRb3ArMUFO?=
 =?utf-8?B?SExJTVFNL2YvTGxBWUpiYzMyUzY0NlgzZitQaGxQNy9OMFM2NGhNdEJWYjlG?=
 =?utf-8?B?NktuOTNvZXlicStwRTZJUnpFUGZsWi9Pam9Qdy8zb2VoSDlXYzJxWVpyWXJT?=
 =?utf-8?B?L3Q2a3JBMFg0NzhwWWovRFNna2pUV04rd0lteEphSVkvSUpHejZiWVB0UDgz?=
 =?utf-8?B?UlM1T2ZlU05FTFdNTnBLRWlLdDE3S1ZYWnVzRTJkY3FXZk5HMjZrOCsveWE1?=
 =?utf-8?B?U3F3Zk16SFB4OU1RMjd6VkhmajNMWndTbFNFaWRqZ21mb2tmblA0NmdKLzk2?=
 =?utf-8?B?WFNvMHhMK29ZOVNIMnhoTXU1elpTa1kyQm1vcnJsSEI2Y0I2bStKVGdxbHho?=
 =?utf-8?B?ZnhMWnJraGVVUVB2Mzh3OSs0eWk5VmN4WHh3YndMd0JmMlZ0Szd0alliQmlv?=
 =?utf-8?B?VEREY3hKdlppWU9Wc3RNYmp0OFliN2VqY0xicldDWUlhR2pmbmI4SDBMV250?=
 =?utf-8?B?VktMVzRzeUVDTk1QcTk2RytuNkEyMXlNWVIzTmdGYk9kclB3akYyUzR1NStz?=
 =?utf-8?B?OGNTbUk5Z2xKOXNIdlJXaGNEUTZUNEpNcldmQjRkck1hZXFyU0U5OVh6WlJ6?=
 =?utf-8?B?TjZ0RlRTa3hIY2tPMXJnV2lKQTI4clNOYlZSQWNaMDQwL1hxTi8wNkViNHRv?=
 =?utf-8?B?TjhrdTI4U2YwZ25JME92OGpmVUhNUFgvRFBsTlRDOVlKdENBN0dyRktLU3Bi?=
 =?utf-8?B?ZFhDUm5KUXd4K29aR2src2dXVHNyMjZrenUwOFptdVJuQ1N3aStGdFRCN3A3?=
 =?utf-8?B?U2h0azdpaGwwcDNOZEtqU1FYdERXVUZiRjY5OG1SZVp3bkdZN3oyRXptYllR?=
 =?utf-8?B?Q3BKQWpHQWNBYTNhWjUwS3JNdmhMelk4aXBYekdUQTBKd0sxUVdTNkppUzVF?=
 =?utf-8?B?M09WRC84dmtsVmxvMTFUbDNsTTUwbHhlV0dZV2lIeU5kdnpiRGJXajM1WDdw?=
 =?utf-8?B?dGNpQXBuOWRPekM0SzlRNjVWMjBSUXV1c0RNNlA0SFlIZHhFM0VxTGdCU09T?=
 =?utf-8?Q?r+RnG9k8dIH2LM+NlkHXhOdUL?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8319.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5620fc-4199-4c8f-152c-08ddc080088f
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2025 13:37:08.8000 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LSRgikDmrYnSxk4Kbe4+nUC3+lN5rfWBP3Uk2H3y9WTUhSH8USE5k8Ayu8nMTTRXonEIoDXM2kw+fFQf7BJpt8HcnoSU2aQN4RvT/Z0qU74=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB12614
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

SGVsbG8gU2VyZ2V5LA0KDQo+ID4gKwkvKiBSZXBvcnQgcmVxdWlyZWQgZGl2aXNpb24gcmF0aW8g
c2V0dGluZyBmb3IgdGhlIE1JUEkgY2xvY2sgDQo+ID4gK2RpdmlkZXJzDQo+DQo+ICAgLyogc2hv
dWxkIGJlIG9uIGEgbGluZSBvZiBpdHMgb3duICh1bmxlc3MgeW91IGRvIGEgbmV0d29ya2luZyBw
YXRjaCkuLi4NCg0KT0suDQoNCg0KPiA+ICsJICogcGxsY2xrLzIgPSB2Y2xrICogRFNJIGRpdmlk
ZXINCj4NCj4gICAgV2h5IG5vIHNwYWNlcyBhcm91bmQgLyB3aGlsZSB0aGVyZSBhcmUgc3BhY2Vz
IGFyb3VuZCAqPw0KDQpJIG1pc3NlZCB0aGF0IG9uZS4NClRoYW5rIHlvdS4NCg0KQ2hyaXMNCg0K
DQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBTZXJnZXkgU2h0eWx5b3YgPHNl
cmdlaS5zaHR5bHlvdkBnbWFpbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEp1bHkgMTAsIDIwMjUg
NDo0NSBBTQ0KVG86IENocmlzIEJyYW5kdCA8Q2hyaXMuQnJhbmR0QHJlbmVzYXMuY29tPjsgR2Vl
cnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1pY2hhZWwgVHVycXVl
dHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNvbT47IFN0ZXBoZW4gQm95ZCA8c2JveWRAa2VybmVs
Lm9yZz47IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT47IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBNYXhpbWUgUmlwYXJk
IDxtcmlwYXJkQGtlcm5lbC5vcmc+OyBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT47IERhdmlkIEFpcmxpZSA8YWlybGllZEBnbWFpbC5jb20+OyBTaW1vbmEgVmV0dGVyIDxz
aW1vbmFAZmZ3bGwuY2g+OyBIaWVuIEh1eW5oIDxoaWVuLmh1eW5oLnB4QHJlbmVzYXMuY29tPjsg
TmdoaWEgVm8gPG5naGlhLnZvLnpuQHJlbmVzYXMuY29tPjsgSHVnbyBWaWxsZW5ldXZlIDxodWdv
QGh1Z292aWwuY29tPg0KQ2M6IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsgbGlu
dXgtY2xrQHZnZXIua2VybmVsLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0K
U3ViamVjdDogUmU6IFtQQVRDSCAyLzJdIGRybTogcmVuZXNhczogcnotZHU6IFNldCBEU0kgZGl2
aWRlciBiYXNlZCBvbiB0YXJnZXQgTUlQSSBkZXZpY2UNCg0KT24gNy85LzI1IDExOjU1IFBNLCBD
aHJpcyBCcmFuZHQgd3JvdGU6DQoNCj4gQmVmb3JlIHRoZSBNSVBJIERTSSBjbG9jayBzb3VyY2Ug
Y2FuIGJlIGNvbmZpZ3VyZWQsIHRoZSB0YXJnZXQgZGl2aWRlIA0KPiByYXRpbyBuZWVkcyB0byBi
ZSBrbm93bi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzIEJyYW5kdCA8Y2hyaXMuYnJhbmR0
QHJlbmVzYXMuY29tPg0KPiAtLS0NCj4gIGRyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6
ZzJsX21pcGlfZHNpLmMgfCAxNyArKysrKysrKysrKysrKysrKw0KPiAgMSBmaWxlIGNoYW5nZWQs
IDE3IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmVu
ZXNhcy9yei1kdS9yemcybF9taXBpX2RzaS5jIA0KPiBiL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2Fz
L3J6LWR1L3J6ZzJsX21pcGlfZHNpLmMNCj4gaW5kZXggNGFkMGJlMDNhNWI0Li5hODc5NmRmNDNm
NzUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yZW5lc2FzL3J6LWR1L3J6ZzJsX21p
cGlfZHNpLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JlbmVzYXMvcnotZHUvcnpnMmxfbWlw
aV9kc2kuYw0KWy4uLl0NCj4gQEAgLTY2Niw2ICs2NjcsMjIgQEAgc3RhdGljIGludCByemcybF9t
aXBpX2RzaV9ob3N0X2F0dGFjaChzdHJ1Y3QgDQo+IG1pcGlfZHNpX2hvc3QgKmhvc3QsDQo+ICAN
Cj4gIAlkcm1fYnJpZGdlX2FkZCgmZHNpLT5icmlkZ2UpOw0KPiAgDQo+ICsJLyogUmVwb3J0IHJl
cXVpcmVkIGRpdmlzaW9uIHJhdGlvIHNldHRpbmcgZm9yIHRoZSBNSVBJIGNsb2NrIA0KPiArZGl2
aWRlcnMNCg0KICAgLyogc2hvdWxkIGJlIG9uIGEgbGluZSBvZiBpdHMgb3duICh1bmxlc3MgeW91
IGRvIGEgbmV0d29ya2luZyBwYXRjaCkuLi4NCg0KPiArCSAqIEFzc3VtZSB0aGUgZGVmYXVsdCBj
bG9jayBzb3VyY2UgaXMgRk9VVFBPU1RESVYgKFBMTC8yKSBiZWluZyBmZWQgdG8gdGhlIERTSS1Q
SFksIGJ1dCBhbHNvDQo+ICsJICogdGhlIERTSS1QSFkgbXVzdCBiZSAxNnggdGhlIE1JUEktRFNJ
IEhTIGNsb2NrLg0KPiArCSAqDQo+ICsJICogcGxsY2xrLzIgPSB2Y2xrICogRFNJIGRpdmlkZXIN
Cg0KICAgV2h5IG5vIHNwYWNlcyBhcm91bmQgLyB3aGlsZSB0aGVyZSBhcmUgc3BhY2VzIGFyb3Vu
ZCAqPw0KDQpbLi4uXQ0KDQpNQlIsIFNlcmdleQ0KDQo=
