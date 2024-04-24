Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673998B02D9
	for <lists+dri-devel@lfdr.de>; Wed, 24 Apr 2024 09:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B1C113892;
	Wed, 24 Apr 2024 07:06:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="fVtmUC+g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2049.outbound.protection.outlook.com [40.107.105.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81791113892
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 07:06:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j4VMilErLvwxILzsabDeiY7sVhbNJT+QPOusGPMiOKaC25aiWMAO2v1UVsJ/2Qji3r/wmr5KsphpAM3tMR3l4y1oti5XiLLYmtHdu3vtx/j405LLTIX2U3ZwO25ZUJ4tAO4AlsIw91zj54NE8Pjvb1XPSby5dnsYU84HxPEftmk8O0qlZIWMUeWtasKx3H0mJzkjHcCo7lLN7ww0wFUXb9cyZlWkrj/BCvKDNhvwFzMA4TK3SspneAb+5R2aAl1zwav6nm7KLvPzsiPMyd2eHcYOysGRXLjsm4Hr6guhU9MlV6Qava0w48XoocLmJK1jArJ8sixUDZAh3jouwRkEDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SRzY8NrmYLuELUWfjGDGvOuShJcl7zIzrdhj6ZM3/T8=;
 b=TFe05m6d4VHaUDBaAA27I587BzHuhz5L1thzX2ST2H2djEjxN6154wBmmARLeiGpILyX4UtF2AK8/vWe+BUcXYcea/Mqf/hJdYdpnQbV6blw239CuxvWIFsfRkqDsOn7AlBTvI4OdryGtHyY/QP2JWhsx8MlF6UIB4qb9zWD9eIlVkBs9HuCmuZF3yRuU2X9SPkEvRjkbkuqrOpUKDUkhE+JdFHUINFOViN5HM3jyrRPzJb0vx1rT1ki5pTqoGQ3sDH9XIi0mEbrEsaLwX1fyKlm2xCdKhInaXr59iQXQxicg/9pilVv16O2t7rdOorQ0iKrBOUqm4hfjuZUPB2hMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SRzY8NrmYLuELUWfjGDGvOuShJcl7zIzrdhj6ZM3/T8=;
 b=fVtmUC+gLKhZPssGoBqPZ5NmpS4S9D645yqP4Nr6TRCAH6cQmPsLrg6pLeBHL5oArjM68Y8JjxyHsdtWFMx7kfw3zaj94W2QfDXSFnFUcvThkK9RxT3wFWOFUF1c1nHeByb0VBD0yNUA/g/67+RjY98xT7I3OIu8WoLXDWXwFbo=
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com (2603:10a6:10:358::11)
 by PAXPR04MB8687.eurprd04.prod.outlook.com (2603:10a6:102:21e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Wed, 24 Apr
 2024 07:05:59 +0000
Received: from DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d]) by DU0PR04MB9417.eurprd04.prod.outlook.com
 ([fe80::d30b:44e7:e78e:662d%4]) with mapi id 15.20.7472.044; Wed, 24 Apr 2024
 07:05:59 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, Daniel
 Thompson <daniel.thompson@linaro.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>, =?utf-8?B?QnJ1bm8gUHLDqW1vbnQ=?=
 <bonbons@linux-vserver.org>, Jiri Kosina <jikos@kernel.org>, Benjamin
 Tissoires <bentiss@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Fabio Estevam
 <festevam@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-omap@vger.kernel.org"
 <linux-omap@vger.kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: RE: [PATCH v2 17/19] fbdev: imx: Constify lcd_ops
Thread-Topic: [PATCH v2 17/19] fbdev: imx: Constify lcd_ops
Thread-Index: AQHalhIkq1aOpO6GXUS3c3wJh83FM7F2/3IA
Date: Wed, 24 Apr 2024 07:05:59 +0000
Message-ID: <DU0PR04MB941723CDA3A07046823A8A5788102@DU0PR04MB9417.eurprd04.prod.outlook.com>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-17-1aaa82b07bc6@kernel.org>
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-17-1aaa82b07bc6@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9417:EE_|PAXPR04MB8687:EE_
x-ms-office365-filtering-correlation-id: dee9d3fe-90b9-4323-dec6-08dc642cfed0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|1800799015|376005|7416005|366007|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?QS8zeGF1RlUydVpnY2RSMEFxOWdIK3Z1eGJmTG1LK3BHclVCblJWbi9ZUEFk?=
 =?utf-8?B?TzJNQS8ybkhSbE92blpaVERpUlpYYnl3UUwxc2JhNW1IbGwzUUxEbnp0STNL?=
 =?utf-8?B?eTBsRXVrVHBrZjZHQ0FTSXQ4bkdsK1ZvL3VLWmVYdkxaN3hLL1FzZDFtNU5r?=
 =?utf-8?B?OU54UldjQm94TEhVbmNFbE5ZakgzTC9Vc2kxbnBGemxNVzJCaU9SRTd1OHAy?=
 =?utf-8?B?V3NWMXV1MG1DSmFGcXhQREdadHRVWXNncG16RENTbEVpYjN1MnFtNGlVR3Vk?=
 =?utf-8?B?ZHg2Q2MvakIxc3pXV2l6djMvUUJrTFZ6bjFra2V1SFhqZ0ptY0pqZlQzd3VK?=
 =?utf-8?B?a0tHQk12VjJETG5XQjR4MEE0VVFBeWlVRGpweFBydlE5N094NnFiT00wQ2dK?=
 =?utf-8?B?aXRaTU0vVEVvcnhtNnF1bjQ1L0lKaklqRlMyZHRYNmJUdWRxZWdaakFmU3VP?=
 =?utf-8?B?ZWJLaGQyZExQLzRvRlFTbGFwT2M0Z2I3RDRJbmdrRTdzS0NtNC9pNnUrTysr?=
 =?utf-8?B?ZkJGUXBJZ0RLenJQb0hEc0txTVpQL3hTczFjUGN4dkJvV3c0T1paQmZGTEVT?=
 =?utf-8?B?SlJtOWhVYkorNVBvTnVPZGp0RFhNVXNYVEdrdUt4T0hldjRYWW1HN3NvbG51?=
 =?utf-8?B?ZHEvNTdJamFEemIzTkFsUGJ3UktkZ1NKcXovNyswKzlKMDA5STNPa3dQK0Q1?=
 =?utf-8?B?aXd3K3lCZkQrL1luSU1YZG85RzBSWndSbUI1Myswc1BHUlRrWVh5KzBCbnlL?=
 =?utf-8?B?d3ZzV0VHeGVXbG1wM093UGpYVFNYRFhBajlZOEZxZUhiWnNDVUtaSHZHWURl?=
 =?utf-8?B?V1Y3dDRUUnM3NE1aWWlxTVptN0JkVERCcFhBeDAzSEU3OEdlRktGamdCSzNY?=
 =?utf-8?B?ck52dXhPZCtkZDQ1c2hJbitLNTc5NmpQTWRKUzhjT1A0WGZKZUw2emtFZVlz?=
 =?utf-8?B?U3VTd3h0QlJSZ0drSllBRzZLNHlYbHB0UlZ3R01RaHhYcnFPeWhVYXhtMk9M?=
 =?utf-8?B?UzJucHRlUENaL3lSZ3VFU250QURVcUp4bStDcTI0TGVnOXViOHp2aXdrMS9y?=
 =?utf-8?B?MXVBblU1Rml2dDRsdnc2ZXpFcDNvQ052YmhERmpDYk4zbGdocXFwM3JDaDNk?=
 =?utf-8?B?d0pQcUJaYUp3VlozRytFdWkvOHJ5MklrRlZsdmlLSll1dm5QcitDM3pUNXJp?=
 =?utf-8?B?Q0dUcFlRNFFVM2h1ZEZOUGlGSFdrVnhiNy9tODRRS3JpUWhBN2VkZFAzUTRG?=
 =?utf-8?B?TWR2NHVUUFpHQlRKTzM4dXpkY1JZKzdYcitZVXJSdldicWNaS1BaOHZob2tF?=
 =?utf-8?B?WG9wME1Zdkp2aGNDZkJORHY1L2lFSWsyelhGcWZLVWZYTjRRUWREZ0xuY1hx?=
 =?utf-8?B?RW9lcUdFNVJ6Z2NML2xQc1ExQU9TK2tTdkJXaWt4Y2JLM3kvL25obTRUdGVI?=
 =?utf-8?B?SWFKNXVDODY2TzByRjZET0dGelFIMi95eWF1Ull0YWpFNVJuemJ2R2Q2eWJE?=
 =?utf-8?B?OW9LOU1PS0creklhV2E4TXZpenZDRzZGQXlNTnlRd3NrcFp3eXVLV1VNZVpZ?=
 =?utf-8?B?dHRWNlpwbHJzazVnaTY2T3lQQ1VCWVVLQXN0V2wyTTlpc1R3TzJWbEtkWlor?=
 =?utf-8?B?UEI0UVJrWUlnSXZVclJSaFdoMURSTFd1VG82dVZyRjlCcGtoWnpPSkp1M3hy?=
 =?utf-8?B?SFpGUjF4MjdpSkF2VzBXVjk4T1pFUDBjUS9NQjA4bkdnSEJkT1VGSlVQTG9V?=
 =?utf-8?B?Zy9OOVZSUXZiQlJ5a0MwZnFTL2ZOT3NKQUVadm5hdHJ4NVlhQWpMZ2ZJQWVa?=
 =?utf-8?Q?tV6qPKa6XM6lMXIQNlCaICnXOdPipLWhiNvEs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR04MB9417.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(7416005)(366007)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eHhuQ1lGd01PYktydFg2S1pGNzB4OWlOLzdyTkdkWXdQQlBCOERHZmRDTWZl?=
 =?utf-8?B?RGFpMG9lMFJCSmhJaStLcC9ZbldvYU9xMXJnYTI4eUtuSGZYT1RSYUpIREYr?=
 =?utf-8?B?dkRGWmwvUU51bERIalJFT2d5RTZ2Z0xFdFhreWlLck81ZWI5aHFnRlV5dzRa?=
 =?utf-8?B?Vm8yUVRaWkZlYkQxenRRMnVNa1E1a0FGYUJJQ09KQjhZWjgyTzRxcy9HdTcy?=
 =?utf-8?B?QXdFM0l4WlAza2hvd0V3aUZHWVR3TTJCVG9mWk03ZUd6UjJYUlRSd25aUU1i?=
 =?utf-8?B?ZU92eGxkM3ROVWRqazRrU3JZODlYUVZJcGtaeFZNUEpNUUdnMHJDbDh0S3pv?=
 =?utf-8?B?NmI1SEJrY3dXcVNiZnBxVWk1anlZTHZhdlNyTUhVKzAzTWV5Z1c5RjBJTEY3?=
 =?utf-8?B?UDJyZGM4cHV3dmxJakxvNFZMZE13WElXN3NuWHNQSDhITHBDbWZsRllkendO?=
 =?utf-8?B?SENlUXphNy91NmluUitvdFdnVkgrYldYSzZTTFdqeFdKU1lBU25MNS9XdVNs?=
 =?utf-8?B?dUMzWlp4Nk9SR1FaNUVndFFLSDdHN2U4cDJQRjh6WGJrYUZhNStQd1RBSHha?=
 =?utf-8?B?eVZuV0NyLytlQXlxT2dLQi9NdllCNGlWMCtwYktJTjd5elRlMHppNVB5UWE4?=
 =?utf-8?B?ZW1GUStidUh2Y1pMbmEwb1hGZUQ5RDVGZkpqT281VlV2azE2bEEwbEM5REdP?=
 =?utf-8?B?M2N2WUJzZ0NMN21YYlFaWjUrSW9LeW0zS3BDYkRpNEJqN3M1VVRMK1VnS2dV?=
 =?utf-8?B?WFNGbGRPeVYzNktFWEN3eXNXM0N0cWdNWjU2bTVBcVZPaDdVZlU1VElVZWdL?=
 =?utf-8?B?bW9Sc2hmdXdUTDZxSmNKOThYN1I5a3M3OXN0cElQM1FnRWNGMjZyM3NZUSt5?=
 =?utf-8?B?S3RUM3hHRU1PZG12cFFoZDJUQVVHSzNsaFUwSzhYNDdXVFNXU0dKSkhzSndl?=
 =?utf-8?B?Q01sa2JRckNGK3VFNmhyUHpRMTJQaURVUXQ3aklubXRkejc1aFJZaUNTYVpt?=
 =?utf-8?B?Y0lSUkVMZ2ZoOERENlhhemRlQzE5SFhSZ1J2ajh3NG9LdFFlcjZVcE4ranNQ?=
 =?utf-8?B?UTh6N0tFMndRVnZ6cmxrSW9POGl1WmxqbkdFMmQyOGpIcGkwN1ZJTUxNMnpO?=
 =?utf-8?B?aGxZdkh3MXJ4NDhOVzR2V0UrdUpGbXpKYVpzL1RsWlBKUWxwS1VTNWV1WnhV?=
 =?utf-8?B?Zit5SEthNXcybXlZbFZaY3B4WndUNWE4ME5ocGx5bDZzdVBDdVU0RkVWNm12?=
 =?utf-8?B?bHVlNGxhMGNLNHhBR1p4R0ZaazZwRlpsVnZOWnRUeVQ5L2JadUN3Z2xObnF3?=
 =?utf-8?B?c1dXS2k1Q3I3RHZaSUFZbmdON1Zzam9XT2t5all2MTZHZUJlY2prUHk2SnZq?=
 =?utf-8?B?akFrQ2JFNjZzNlZ5QU9nbDNEc29Tc3h1Tm91cFN5eXArRmtLZHJvdCtCU0Ux?=
 =?utf-8?B?dUdPUnovOGdrOTd0QlFZbVZVa01rZnZrVzNrVHVQY1VrM1BaOWVoYmFmNGRW?=
 =?utf-8?B?UlorV1NDMysxVzlLVFRINzZIUXVGQ2d6QW8vWjFSL2xhWEYrZ0JDd3VSUUdt?=
 =?utf-8?B?aXZ0OVZ0YUd6LzJzMHRWNlVZQktuUlNmQmRZQWtmMzVxT1k5SXZJb3BQQnlp?=
 =?utf-8?B?TzZzVWhpb2JBU3h4UWNEZGo3Q2xkR1ZLTmpYazJ2bkJvRjl1eE80dWIvM0Y2?=
 =?utf-8?B?TEx4a0VXMmNNZGJsYklzT2JVOFpwYnJwUVNFU3lVREpwdHVnblAyMmIvKzhr?=
 =?utf-8?B?d0VQR0xqTjBHdnpuQ1JNelJwWC85L1JPcU5vL0xEOWc2MUd1dTh5QWlxMzI2?=
 =?utf-8?B?dVQ3dUJJTlY0Q2FnNnlmbG1sdS8rRFNZMkJOZWwrZGY3ZWUvK25aMUJuYlEx?=
 =?utf-8?B?OEhyYVRqdEVxUXZlZWtDaTZGN2xpcy9kT0xDTFRTZ1NxNTBxb2YzbnZEZlN1?=
 =?utf-8?B?aEpLS1Z1Um5zeW1IZlBYMWt1VG1QL1hWd0Y5SmhxWXl4c2oxWERYekJDdXhl?=
 =?utf-8?B?NXN5RVJzT2U3M3VVY24xSVBOM2xnL1ZoMGFOcmtIQXVpNjJ2Si9ueDNYUlpU?=
 =?utf-8?B?S29GSnVmRHY5bjZFMkhIOE1vSUkzM3l3OWo2UzRJdURTRUlubVUwaDlCUnlv?=
 =?utf-8?Q?H5nQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9417.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee9d3fe-90b9-4323-dec6-08dc642cfed0
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2024 07:05:59.5694 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vQ06x4JINsg7WuqkUnK4P+dEo0c4edduIByLJtIU9WSd/osz56kIeglrPsowV5H1XpWU0oMrBYFUBrr6zLoTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8687
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

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMTcvMTldIGZiZGV2OiBpbXg6IENvbnN0aWZ5IGxjZF9vcHMN
Cj4gDQo+ICdzdHJ1Y3QgbGNkX29wcycgaXMgbm90IG1vZGlmaWVkIGJ5IGNvcmUgYmFja2xpZ2h0
IGNvZGUsIHNvIGl0IGNhbiBiZSBtYWRlDQo+IGNvbnN0IGZvciBpbmNyZWFzZWQgY29kZSBzYWZl
dHkuDQo+IA0KPiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+IFNpZ25lZC1vZmYtYnk6IEtyenlzenRvZiBLb3psb3dza2kgPGtyemtAa2VybmVs
Lm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPg0KPiAtLS0N
Cj4gDQo+IERlcGVuZHMgb24gdGhlIGZpcnN0IHBhdGNoIGluIHRoZSBzZXJpZXMuDQo+IC0tLQ0K
PiAgZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jIHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy92aWRlby9mYmRldi9pbXhmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jIGluZGV4
DQo+IGE0ZGJjNzJmOTNjMy4uNGViZmU5YjlkZjYwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2lteGZiLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9pbXhmYi5jDQo+
IEBAIC04NTcsNyArODU3LDcgQEAgc3RhdGljIGludCBpbXhmYl9sY2Rfc2V0X3Bvd2VyKHN0cnVj
dCBsY2RfZGV2aWNlDQo+ICpsY2RkZXYsIGludCBwb3dlcikNCj4gIAlyZXR1cm4gMDsNCj4gIH0N
Cj4gDQo+IC1zdGF0aWMgc3RydWN0IGxjZF9vcHMgaW14ZmJfbGNkX29wcyA9IHsNCj4gK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgbGNkX29wcyBpbXhmYl9sY2Rfb3BzID0gew0KPiAgCS5jaGVja19mYgk9
IGlteGZiX2xjZF9jaGVja19mYiwNCj4gIAkuZ2V0X2NvbnRyYXN0CT0gaW14ZmJfbGNkX2dldF9j
b250cmFzdCwNCj4gIAkuc2V0X2NvbnRyYXN0CT0gaW14ZmJfbGNkX3NldF9jb250cmFzdCwNCj4g
DQo+IC0tDQo+IDIuNDMuMA0KPiANCg0K
