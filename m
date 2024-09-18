Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7788F97B701
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2024 05:00:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70E4010E517;
	Wed, 18 Sep 2024 03:00:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="rqgqDSWO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2067.outbound.protection.outlook.com [40.107.243.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37210E517
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2024 03:00:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mpvyFAyMfs1hUMXqgpOi4HPW0/58FZGA6AJexttMrAdI/OPggDChF1iP6XYLyMX+ijuiG/PNoLyQBZGiMFhNZNjb71heE2Ou+B5xDGmEpeYfiKkq+M2WiSBVtbQYz2NE/NQwVtV66By8oh6XmIO0MyP2o2czcK62QDrXLEIQJb5DOfap/9mRRaZH0BzZut52bZcF/vE+Wy974yZk3FNYapYuc2n/y61AHbZ/8m1ucNGaHaeVLbApmgeelNybrbc7wQiP+FnSBv8epoWzRnc8cilc3hDivx/vk49f3IQXQHyqBe3qZhRpHXpwxHXZIf0UYwN+dSI3BFixcO9pGdXqTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aud2IMbBAgr8lP8bYkSvkMPwhMuyY8Glj2ZUvq7Lh6E=;
 b=C6fAyPbUkeV/4KU/liWo7mS13yghvdQsRzxiwqEDGnbZxa58yTeJ79b2gNldWvsgOI7mZh/JZ9ZTkMACQZPEP1ncROFH1Qkbaqq+8tUBTSmkxgv+jCR/oEXZO9iczFDkXq6ug5Zzqm8Us29aIiGnb0pJ5rTga8N2IE3LFjI48KH+67cIig3M7ANdObJr4LJ+1Q0icOM/OkRkd/H8z0BJu/IPvbSyFrzrMEuf6969j6uii/NKZiw6tTgUxofEDrNivC2APGp3JikhzOTp6cFw4pVy9TAeB3QGw9XmMfBHYbnu2N2uUAFwyip6v7QSLRDOttJz5WDyAvSwBnupJbOf6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aud2IMbBAgr8lP8bYkSvkMPwhMuyY8Glj2ZUvq7Lh6E=;
 b=rqgqDSWOWRahuFdnGL/3r4zHODmIIjqdaDvTwP2Lw3NhvgnyJgIQFs89tUb0RGuoIhREob2UzN2R97GU7mh3qWetig5Mt+u/brjNm5KB3YR9d6k+BQOaYQvvhyHhm4CLExUO/+MMP2hPHae8JzPFDzr13CpKP5eeijg+iEWsN4kvptrmaeKBu47fF0qcpr+wVXN7RIr/NiRrjhUVJRtfMDOPMZp5vA2KsbInvhFJ6I9JsaeYULjDFzISZF4Rz12CfoJ5j6hQwW5+K3DvJ1R19Za0z9pPYm5hC4d3AhqW2ulIFAXGqzMgCgU3AKd001ZSCzkwU5a/vAXi7sj7SOgQ6w==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by BL3PR11MB6313.namprd11.prod.outlook.com (2603:10b6:208:3b0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 03:00:46 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7962.022; Wed, 18 Sep 2024
 03:00:45 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <geert+renesas@glider.be>,
 <mpe@ellerman.id.au>, <rdunlap@infradead.org>, <Dharma.B@microchip.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: bridge: add sam9x75-mipi-dsi
 binding
Thread-Topic: [PATCH v3 1/4] dt-bindings: display: bridge: add
 sam9x75-mipi-dsi binding
Thread-Index: AQHa7jg/AxrwKF2pJU2+HZGoh+wjwbImx9aAgDS7zgCAAJ0LgIAA8MgA
Date: Wed, 18 Sep 2024 03:00:45 +0000
Message-ID: <d343d34e-f810-4375-882e-d74f104ce215@microchip.com>
References: <20240814105256.177319-1-manikandan.m@microchip.com>
 <20240814105256.177319-2-manikandan.m@microchip.com>
 <20240814-anaerobic-unpainted-532b8b117b79@spud>
 <5cb63b40-9710-4a6d-984d-1be1394dcb63@microchip.com>
 <20240917-verdict-nativity-3b84cc3457cc@squawk>
In-Reply-To: <20240917-verdict-nativity-3b84cc3457cc@squawk>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|BL3PR11MB6313:EE_
x-ms-office365-filtering-correlation-id: 0c9eef85-742e-40b1-9cda-08dcd78e1778
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?UWFqbk9ZbVU4MjlpV0lYT2V2bUxrb3VpSVI5ajdYY2M4MUtDbzRGd0lIZG0r?=
 =?utf-8?B?eG80YlVIQ1hqekIxdU13SGVBU3dKRXFXT1J3dGpCbVRRaVU0S2hhWTgybzVL?=
 =?utf-8?B?S3pTR3FpT2MzZzRVb0svL2t3ZUJDanVRaDdadCtHcWtoWnNjMlhYKzdrampN?=
 =?utf-8?B?L1p0ZFRuV0tHSDZVaFA1Um05NFpUTkx0em9YWGdEa2NBcVFNcjFqL2hnTUJB?=
 =?utf-8?B?aWM5RnZQS0liN2huZGs3RlZqRnE0VVRBMnpPWmpsMkVsbXk4SWhaRTNzdkJj?=
 =?utf-8?B?QkVhWm1EMkZjZjJ6VEVUR01WMjE5WU9IMEpibHR2K2liSGFJUWsvMTR4OVZo?=
 =?utf-8?B?NEU5VnllODBON3NmR1p3KzFVbHc2cE0wbVdQRmo5eG9lV3laa3hiMVJ4MnAy?=
 =?utf-8?B?c3RaeUl5RjA1QmNrVzNzNEFyUVFSNUhYL1h4K0tyU3FrK0tlalNLZS9tbmNJ?=
 =?utf-8?B?WkhKVVlORHdnN3psczFSVzZkSWM3VURXcVJnQWdaODA0Vy9WZ2J5QWlFVEJt?=
 =?utf-8?B?OG4zVkFLWTNPVksvYzNkbXZ6Uzl4eElJbm5vTG9QUnRZV0dNSXYxMkxGOGxM?=
 =?utf-8?B?aksyYnlnOXVBMktrNUMrUW5RdHMrVkxWVmc1VUxPMzJ2MVh4bHhsTXhaV2t6?=
 =?utf-8?B?KzhtMWM5ZEdPQXhzNW0zMzJEMGNrL1JnODJndVJxMkQyd2szdVFZTDhXWEsw?=
 =?utf-8?B?Tjc5Yk1iWkZkQVNaSHBwcjMrcWFXL1ZXQ3hXb05jVTYrMThNNjJjNGpodXVI?=
 =?utf-8?B?UDJPMGdsQ0FFTk5Rd3hOTjUzQUlIb3phT3I2dG1MenhhZW5keDFOYkdOSGoz?=
 =?utf-8?B?bmVUU3JuL3VhVGdnZXhEelp4TUJKL1RsZXJxeUZkTC9LTzEvdnVXcFIrTTJF?=
 =?utf-8?B?b3pzZHdzc0oyM2JsNXNoUnpFZy9ON3UxYWJ2Z2pvMFMrODRqVC9VVmxncjNl?=
 =?utf-8?B?Rmp1ZzlPemhWSnFwVzMwSUJ0SDFwL2J3V1FtSWsvWGZXRlpMTzZjY3grV1Av?=
 =?utf-8?B?VVVLS3VhTGdaR1gvT0lqWlpGZXRMZjc0NTlSRnNmMk5Ld0Uza2lYZ0o2ejdm?=
 =?utf-8?B?aVRFUWcxVTVsNm5rSEZZQTNzRm12cEwvb0dIYmRCSS96QVpyYTY1QmdYUno1?=
 =?utf-8?B?TUZCSVJyRUNnWkkzekh4VWduSG53UG8vZEVrMjVQSTFwUDNONVdjNnVQbC9P?=
 =?utf-8?B?ZnNLWmRNR0hEdDdPcE0yQm5zcjFUZHVqWGphRUVBQmFhSVZvUEJLSEt6R1g2?=
 =?utf-8?B?MFIvZWJKVXRhS0NyaTkySndiai90K09uNCtTNkRrREhvQmgwbzNzalAwbSsr?=
 =?utf-8?B?UWJVNEdMc1hMZmYram9WWmJleWVFc1lZUytwVlQrRWFyTm93MWNJdkZJL3BI?=
 =?utf-8?B?T3lIUDJySUpkNDZBZHB2dUhXejVXQ0dRU1JaQ3o2M3FJM3JqNDNZOGw4WU9E?=
 =?utf-8?B?ZEEyaFFQK2I5YlB2Y1p3ZTF5ZnNCOUlNeEwvNTRYbU5Ua0pLenhieWUxbzlt?=
 =?utf-8?B?VG1ZUzJjazc5ZnFxWGZzTFo1NHMvekhtNzQ4YkYyZmxZekRBWmF2TGl6eUFm?=
 =?utf-8?B?S0VONHFKV3hCMHRQeGFMMEQ5dXZjMzZhZ2RJMHYrYjZ5aHBWN0NHeTlyd1RO?=
 =?utf-8?B?a2dIbXl2MkozOXd6dHRKK1h3QWp1c2QyRkswNklqV00xWTE5bitpQkJTaHk1?=
 =?utf-8?B?Q0ErQUdZemhnd3lqbmFqY1dYMnhQQWtUYWpSekxvdHM4U2NMYmtVWElHRWpO?=
 =?utf-8?B?QXFveDdKaUNrWmVQc05IMHIxbUNZMW9HQ1h6RjYvYnBSeVUrWWo0dDR0Z0V1?=
 =?utf-8?Q?0MdYueNoOj+kvC2/is0csppseUYskQ8THHaps=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzhiQ1RraUhWb0Nlelc5VWk0N1V2bWowM1NUMnoxZ3FYN1lGT2RDVjNQQXpZ?=
 =?utf-8?B?SEtOajE0eUdpeFZHRkpmWVZYaHhGOTE1QXhDV00xWUpuNFVYTUVnMUlUeWIr?=
 =?utf-8?B?WUxHYlFYVHorZ0lKWXlUajR3L1U5c0hycjJzT0cxZGtzZEtwWTRSQ3Vnd25u?=
 =?utf-8?B?T3UwcFlDYmNodEt4QnRVKzZYRUFnekUwWUh4MDNSZ1BrMG1xbXYvaDBaV1Z3?=
 =?utf-8?B?ZzF2aFFtZFAvU1Y3dkhaVWgxN1RrNm9ocmFMUElyaHVWZlBuMTNIYjZDSXk2?=
 =?utf-8?B?UHBoT3Z5Y0xaaHlDVnBydWYzcUExWnZpTisvdDlXa0JlSHN0alFyL3FOU1Bm?=
 =?utf-8?B?K1RQaEk4N1dpd1Z3aXhKWjlQNHUvaFJuODlacG84UjJENUlvajMrNmt0WXhr?=
 =?utf-8?B?VTlOTGRKKzFsdzlXOGxGNmJHTXcremw3d2RrR0lKQkVJYkk2MkNHNVY2OEhv?=
 =?utf-8?B?dHJsSHBidTlRR1VpNndEbkZVeHFnUW9CR3NqUGRQa3BLQkJNa1pndTJYUXA1?=
 =?utf-8?B?bmhsWnI2ODAyRVBlNEVoMjJTUE04RU1pVkNEM2RWZWE0WlFjdnZEVStWZDIr?=
 =?utf-8?B?bzBoYkhIUXMyaXRxQ0dVbVBQbU9lQnI5NzRVYk05MmtDSEI0M3Q4RHVlV01s?=
 =?utf-8?B?NWFFSktvK3U2VDNyc2VoVnJEWTlWa2MvalM2RGNNTmNCSk1jUWE2WThaVUpQ?=
 =?utf-8?B?QnVVbmYvbDBWMm5FbHZtQmJDWmowR3k3bWE0MGdDU1o5ZElmMnlLZW5TbzUy?=
 =?utf-8?B?V0ZRc1FxQUxWNTBWeGNDQVROTkk0WWJUSUJ5TTZyemtuWUVEdmRySVByaUdz?=
 =?utf-8?B?NjdYNURvemtlTFBQNHZ3cFhvd2dhalhSR0J5VFBURGVmUmRvNUtYWU1zZnRL?=
 =?utf-8?B?NHdDTkdpN2lGenFRTVJ0SjBBN2g2S3lGdUsybmVXTDBMVmsyZHhwZGhubklJ?=
 =?utf-8?B?NWZtSUtvbVBKdzdGZ2Nkb251NVhaTnVFVTlsbE5jbjVaVjlPUUVCZHErT0Zs?=
 =?utf-8?B?MElUS1k1N0lGV282VWt0Vmx2ZTBHWHVXa2hZbXZyYytvWEZtZThyYU1sOFAw?=
 =?utf-8?B?Z2ZNRXVJUTFyVmljN3ZnRmYzUDl2MUlQUzlZWTgxKzNaZzA4bnFNaEJaek1N?=
 =?utf-8?B?cTZpakgzSXFFRXNFYUhPUE0zUDkyMGhBRFJNRjkrbjI1L054RkdZdDl5ME9N?=
 =?utf-8?B?YjlpbVA4VTBxcUl2MWVrNTBNR1ZPcTFZM0Y0VEhWajNMUTlYQmtXZ2NiYWtn?=
 =?utf-8?B?dFhnaXVaTmxRMG1JZmxiS0tsTG16OGl0TzRQT0dZblhPNkkxQldNNTJtTmNh?=
 =?utf-8?B?Nzk0U2FrYUpqL29FU2VzOHpqYndFd3VhWG92azA2WHZTVTVUSEN2eitTQUVY?=
 =?utf-8?B?T1lOaC9HdE9zcjNqOUppVnJ4MktYbHdlVW45V2ZZS083b0ZxdFRVL3pUM1Y1?=
 =?utf-8?B?OWxPRi93SVZKaUpBN08vL1pUR0w3ODdxWTJUbE5FRzhydWhwbkFlSWh2TWt1?=
 =?utf-8?B?M3pJSUYzZzV6clJSakhkL2p2L095UW9FNXptbENxSmtxdFhzSjd0ZUFMd2pm?=
 =?utf-8?B?UXgvVHlIUHhWaEVyV3RST1hORms1NzQzV1ljZjVKYVFFdmhYSDlLeXFIUFZr?=
 =?utf-8?B?RjlUYkNnWlI4eEpPUVJEOTlUcktFUVY2bXgrUjBLMENEalZ3eTF1RWVTN05N?=
 =?utf-8?B?NmFIWlV4WEM3U0cybDFUNCt6WCt1Ni8xdXdVNHlMQ1BIUTZkNFoyNERZaWVq?=
 =?utf-8?B?QXlITHMwR25QTFVLby9GQm1HVEU3SUVibmp6Q2VVWEpMYWphbGNldExlNEhK?=
 =?utf-8?B?c0VvMU9oM2NPcGZiVlY5b0xINE1pbk91WGdONW9JNFZFODA3QTlvVDFZeDQ4?=
 =?utf-8?B?NGV3YXE4ME5LNmZMN1d6cHNoMXFiYVJhWXVVRHFsUEw2SUV4STlUUUdGZlBa?=
 =?utf-8?B?S2N0V1VDcVp0M1F2UGZmSjEvdTVCbTZ6Yk03b2pNY0NaWXRRR2pEUjZuenVj?=
 =?utf-8?B?cEQ1VkpzYzJuSE5uU3VTRGZhQ1JyU09ONWZZbFBaUjg4Vm83d01LVy9aeHVZ?=
 =?utf-8?B?RkhIY0czeElSbHo5c3NtUWxiMVl6S1pzeUtobnBFczMveGxaZEJpT1pacXJr?=
 =?utf-8?Q?syS/H8NH9Cl3ZnXm0mWsKcENL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B08FD98DDE519A49A244318C1F173FF1@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c9eef85-742e-40b1-9cda-08dcd78e1778
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Sep 2024 03:00:45.8836 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: W93fD9BLiY78V+deAxvksbYbmwo2507bBbb7zX6kjC8a1oaUBglkxu+CP9LFQ7kRGLnWzTs0zG8bw6WF64ZjqXjgTcENpiXjH/8k/UkYrSw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6313
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

T24gMTcvMDkvMjQgNjowOCBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBPbiBUdWUsIFNlcCAx
NywgMjAyNCBhdCAwMzoxNjo1M0FNICswMDAwLE1hbmlrYW5kYW4uTUBtaWNyb2NoaXAuY29tICB3
cm90ZToNCj4+IEhpIENvbm9yLA0KPj4NCj4+IE9uIDE0LzA4LzI0IDc6MjkgcG0sIENvbm9yIERv
b2xleSB3cm90ZToNCj4+PiBPbiBXZWQsIEF1ZyAxNCwgMjAyNCBhdCAwNDoyMjo1M1BNICswNTMw
LCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+Pj4gQWRkIHRoZSAnc2FtOXg3NS1t
aXBpLWRzaScgY29tcGF0aWJsZSBiaW5kaW5nLCB3aGljaCBkZXNjcmliZXMgdGhlDQo+Pj4+IE1p
Y3JvY2hpcCdzIHNwZWNpZmljIHdyYXBwZXIgZm9yIHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1J
UEkgRFNJIEhPU1QNCj4+Pj4gQ29udHJvbGxlciBmb3IgdGhlIHNhbTl4NzUgc2VyaWVzIFN5c3Rl
bS1vbi1DaGlwIChTb0MpIGRldmljZXMuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlr
YW5kYW4gTXVyYWxpZGhhcmFuPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0N
Cj4+Pj4gY2hhbmdlcyBpbiB2MzoNCj4+Pj4gLSBEZXNjcmliZSB0aGUgY2xvY2tzIHVzZWQNCj4+
Pj4NCj4+Pj4gY2hhbmdlcyBpbiB2MjoNCj4+Pj4gLSBMaXN0IHRoZSBjbG9ja3Mgd2l0aCBkZXNj
cmlwdGlvbg0KPj4+PiAtIHJlbW92ZSBkZXNjcmliaW5nICdyZW1vdmUtZW5kcG9pbnQnIHByb3Bl
cnRpZXMNCj4+Pj4gLSByZW1vdmUgdW51c2VkIGxhYmVsLCBub2RlIGFuZCBmaXggZXhhbXBsZSBE
VCBpbmRlbnRhdGlvbg0KPj4+PiAtIGNvc21ldGljIGZpeGVzDQo+Pj4+IC0tLQ0KPj4+PiAgICAu
Li4vYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1pcGktZHNpLnlhbWwgICAgfCAxMTYgKysrKysr
KysrKysrKysrKysrDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxMTYgaW5zZXJ0aW9ucygrKQ0K
Pj4+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1pcGktZHNpLnlhbWwNCj4+Pj4N
Cj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNw
bGF5L2JyaWRnZS9taWNyb2NoaXAsc2FtOXg3NS1taXBpLWRzaS55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1p
cGktZHNpLnlhbWwNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXggMDAwMDAw
MDAwMDAwLi4zYzg2ZjBjZDQ5ZTkNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9Eb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvbWljcm9jaGlwLHNh
bTl4NzUtbWlwaS1kc2kueWFtbA0KPj4+PiBAQCAtMCwwICsxLDExNiBAQA0KPj4+PiArIyBTUERY
LUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAtb25seSBPUiBCU0QtMi1DbGF1c2UpDQo+Pj4+
ICslWUFNTCAxLjINCj4+Pj4gKy0tLQ0KPj4+PiArJGlkOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9z
Y2hlbWFzL2Rpc3BsYXkvYnJpZGdlL21pY3JvY2hpcCxzYW05eDc1LW1pcGktZHNpLnlhbWwjDQo+
Pj4+ICskc2NoZW1hOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1s
Iw0KPj4+PiArDQo+Pj4+ICt0aXRsZTogTWljcm9jaGlwIFNBTTlYNzUgTUlQSSBEU0kgQ29udHJv
bGxlcg0KPj4+PiArDQo+Pj4+ICttYWludGFpbmVyczoNCj4+Pj4gKyAgLSBNYW5pa2FuZGFuIE11
cmFsaWRoYXJhbjxtYW5pa2FuZGFuLm1AbWljcm9jaGlwLmNvbT4NCj4+Pj4gKw0KPj4+PiArZGVz
Y3JpcHRpb246DQo+Pj4+ICsgIE1pY3JvY2hpcCBzcGVjaWZpYyBleHRlbnNpb25zIG9yIHdyYXBw
ZXIgdG8gdGhlIFN5bm9wc3lzIERlc2lnbndhcmUgTUlQSSBEU0kuDQo+Pj4+ICsgIFRoZSBNSVBJ
IERpc3BsYXkgU2VyaWFsIEludGVyZmFjZSAoRFNJKSBIb3N0IENvbnRyb2xsZXIgaW1wbGVtZW50
cyBhbGwNCj4+Pj4gKyAgcHJvdG9jb2wgZnVuY3Rpb25zIGRlZmluZWQgaW4gdGhlIE1JUEkgRFNJ
IFNwZWNpZmljYXRpb24uVGhlIERTSSBIb3N0DQo+Pj4+ICsgIHByb3ZpZGVzIGFuIGludGVyZmFj
ZSBiZXR3ZWVuIHRoZSBMQ0QgQ29udHJvbGxlciAoTENEQykgYW5kIHRoZSBNSVBJIEQtUEhZLA0K
Pj4+PiArICBhbGxvd2luZyBjb21tdW5pY2F0aW9uIHdpdGggYSBEU0ktY29tcGxpYW50IGRpc3Bs
YXkuDQo+Pj4+ICsNCj4+Pj4gK2FsbE9mOg0KPj4+PiArICAtICRyZWY6IC9zY2hlbWFzL2Rpc3Bs
YXkvZHNpLWNvbnRyb2xsZXIueWFtbCMNCj4+Pj4gKw0KPj4+PiArcHJvcGVydGllczoNCj4+Pj4g
KyAgY29tcGF0aWJsZToNCj4+Pj4gKyAgICBjb25zdDogbWljcm9jaGlwLHNhbTl4NzUtbWlwaS1k
c2kNCj4+Pj4gKw0KPj4+PiArICByZWc6DQo+Pj4+ICsgICAgbWF4SXRlbXM6IDENCj4+Pj4gKw0K
Pj4+PiArICBjbG9ja3M6DQo+Pj4+ICsgICAgaXRlbXM6DQo+Pj4+ICsgICAgICAtIGRlc2NyaXB0
aW9uOg0KPj4+PiArICAgICAgICAgIFBlcmlwaGVyYWwgQnVzIENsb2NrIGJldHdlZW4gTENEQyBh
bmQgTUlQSSBEUEhZDQo+Pj4+ICsgICAgICAtIGRlc2NyaXB0aW9uOg0KPj4+PiArICAgICAgICAg
IE1JUEkgRFBIWSBJbnRlcmZhY2UgcmVmZXJlbmNlIGNsb2NrIGZvciBQTEwgYmxvY2sNCj4+Pj4g
Kw0KPj4+PiArICBjbG9jay1uYW1lczoNCj4+Pj4gKyAgICBpdGVtczoNCj4+Pj4gKyAgICAgIC0g
Y29uc3Q6IHBjbGsNCj4+Pj4gKyAgICAgIC0gY29uc3Q6IHJlZmNsaw0KPj4+PiArDQo+Pj4+ICsg
IG1pY3JvY2hpcCxzZnI6DQo+Pj4+ICsgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVm
aW5pdGlvbnMvcGhhbmRsZQ0KPj4+PiArICAgIGRlc2NyaXB0aW9uOg0KPj4+PiArICAgICAgcGhh
bmRsZSB0byBTcGVjaWFsIEZ1bmN0aW9uIFJlZ2lzdGVyIChTRlIpIG5vZGUuVG8gZW5hYmxlIHRo
ZSBEU0kvQ1NJDQo+Pj4+ICsgICAgICBzZWxlY3Rpb24gYml0IGluIFNGUidzIElTUyBDb25maWd1
cmF0aW9uIFJlZ2lzdGVyLg0KPj4+IEknbSBjdXJpb3VzIC0gd2h5IGlzIHRoaXMgcGhhbmRsZSBy
ZXF1aXJlZD8gSG93IG1hbnkgU0ZSIG5vZGVzIGFyZSB0aGVyZQ0KPj4+IG9uIHRoZSBwbGF0Zm9y
bT8NCj4+IFRoaXMgcGhhbmRsZSBpcyB0byBtYXAgdGhlIG1lbW9yeSByZWdpb24gb2YgU0ZSIG5v
ZGUgYW5kIGNvbmZpZ3VyZSB0aGUNCj4+IERTSSBiaXQgaW4gdGhlIFNGUidzIElTUyBjb25maWd1
cmF0aW9uIHJlZ2lzdGVyLg0KPj4gY3VycmVudGx5IHRoZXJlIGlzIG9ubHkgb25lIFNGUiBub2Rl
IGluIHRoaXMgcGxhdGZvcm0uDQo+IFdoYXQgZG9lcyAiY3VycmVudGx5IiBtZWFuPyBUaGUgcGxh
dGZvcm0gZWl0aGVyIGhhcyBvbmUgb3IgaXQgZG9lcyBub3QsDQo+IGN1cnJlbnRseSBtYWtlcyBp
dCBzb3VuZCBsaWtlIGl0IGhhcyBtb3JlIHRoYW4gb25lIGJ1dCB0aGUgZHRzIG9ubHkgaGFzDQo+
IG9uZS4NCkFwb2xvZ2llcywgSSB3b3VsZCBsaWtlIHRvIGNsYXJpZnkgdGhlIHN0YXRlbWVudCB0
aGF0IHRoaXMgcGxhdGZvcm0gb25seSANCmhhcyBvbmUgMzItYml0IHNwZWNpYWwgZnVuY3Rpb24g
cmVnaXN0ZXIgaW1wbGVtZW50ZWQuDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5k
YW4gTS4NCg0K
