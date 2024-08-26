Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 498E995EF47
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 13:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3581110E19C;
	Mon, 26 Aug 2024 11:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fKVahADu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazon11010007.outbound.protection.outlook.com [52.101.228.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60B410E19C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 11:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXyxoWjhqCvHvjys2Bt3q9lQ+5A16U1eDqtYs+XXcav9kZzReIrtNi/4SMqHytCoXdOQJE8ZJCbAB8hfBQVbIUpTN6lc/ehAvyIb8WBM0iqXFscDGVlQxCYPPs55WqI6QWWA2rg/M46KSCLV46YFs3HCq6Hib5UZjnypE9VjvVehzqoBQBZOK0htdGf1IkHnvtCNaOwzv/UGvtu8he8+1nSumuQ7wIchMAVXN14LpnpgN3+YomflBwdlssz4iWdXA/5256KvV2yF8hirdHXC0ZchsumI+rA3hQ1WV4jAWZghSCpbJq4Ql/y/OjC6d4TXC9BICIDUSY3prWJCHCuruw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QdS3OpTyf/q9BGbgJJ4mOzh7rPSYbWzFw6IcHd3chWA=;
 b=QNfmBedPyG43LfcispYKtV7rxRKOADg5XH8MqEV2IuTHG/gvmzJIOm/fWsTqs+zfslZ3n7J4Oglvk7FAHDJF1t3zhTDrKHfoJvYoyRbdz2VdCoAX/AB04a5Ofc++2lAq7iYPGArU+NGtb2tv0TXjf7sNbhig8Mkyi/3ukEGZIZTurIMuJ5FnyX2GPWVuAAUvc9iej6l7qUa+AYA2GCr59rviG/uQOw4gFpzQi8Ij3+6KsGZzHX8vwHC57DC/Gn9bcjKZdNGNFr0UDHBt+2v7hl4CBtROcUv+2dLaqT5tQ37CgHs2uwv/FxzeFPEzWJh2QsIukTlG3QqaKsD9MbZTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QdS3OpTyf/q9BGbgJJ4mOzh7rPSYbWzFw6IcHd3chWA=;
 b=fKVahADuxjQA98LF5GWgqlMveL7n97tR7LOJo83TWPxYqZl2NCn/qXhkA7ZjXVpvyd+4ndagK29JC2LNqVYS8fq5JKCMQXXvZtkmc4obe2DK83MFq22NrSg3KHCB1HI7XcscBeQrw767gqlA2jmGlKNNgWPYS0mf9ib/EFj6TgE=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OS3PR01MB6021.jpnprd01.prod.outlook.com (2603:1096:604:d5::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 11:01:46 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%7]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 11:01:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "Lad, Prabhakar"
 <prabhakar.csengg@gmail.com>
CC: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>, Prabhakar Mahadev Lad
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Topic: [PATCH] drm: renesas: Move RZ/G2L MIPI DSI driver to rz-du
Thread-Index: AQHaxvvrCVUVLwgOH0e6KnciNkV+R7HZi7YAgFuofoCAABhUAIAEYBMAgAATqSA=
Date: Mon, 26 Aug 2024 11:01:45 +0000
Message-ID: <TYCPR01MB11332EF59BC79A16C04D6BF69868B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240625123244.200533-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240626055108.GA10453@pendragon.ideasonboard.com>
 <CA+V-a8tcWVTzDgBMhn8aQaX934MKwOePp3PhMF4TcXqBK2nhAA@mail.gmail.com>
 <20240823150054.GP26098@pendragon.ideasonboard.com>
 <ad8ecccc-76dc-4072-9ecc-ecc48330267d@ideasonboard.com>
In-Reply-To: <ad8ecccc-76dc-4072-9ecc-ecc48330267d@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OS3PR01MB6021:EE_
x-ms-office365-filtering-correlation-id: 4992792e-85b0-4e42-bf3d-08dcc5be79f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TGNETzJaWUZhZmdXdUNoaDI5KzB5RzRFa3VpVy9SckFUbUtQWFdzVHlBaHJw?=
 =?utf-8?B?OVpmZEwyTTVsWEVRekxrUnp2S05MK0JhOTdBYytpV0QxMEdIRkdyY2JqdGZI?=
 =?utf-8?B?NjhrdHRwd0FZMlVJeVNnMjdwL1hIY09SZmZocG42cVF2REpUOHhMd3ovczEw?=
 =?utf-8?B?S2lCQ2RFYW5WVzVBNTNRV3NrMzMrRi8zMGZ0QmIxbGhrdDNvazJzME9Ec09Y?=
 =?utf-8?B?ZEVrQkViU2l4Qk5hMEkrcXdpSmtTWk1rdEJLeUtqRE9QeGpxbEtuWTZiV1BT?=
 =?utf-8?B?SFVjdmw5bmh5b0F4MSt0VUFrc3lxYlNWb1hBUnN6R0UxOGg1d3pjNnN5dGFi?=
 =?utf-8?B?Q3ovY0lDQW1Gc3F3UVdLaklBb0w5WGYrSUFsVUQraXdPdmFacVkrY3JFUHZL?=
 =?utf-8?B?Zi9rcWoxMEFQTWhOTE03ZklaNWpMT2pSdGVHZmNtWXZMaTFYVnlwa1htYWhz?=
 =?utf-8?B?UC9nQXNqZStRUU94eDFSd1luSU9UVXdOWFAwVjBGQlJPeWZhaEpZSUFNMzll?=
 =?utf-8?B?S1hEeHRzRi9NQWlHRk5iTE5qeVdjTk9RWUlMYndVOVFkR1RlM3hraGN1bUVk?=
 =?utf-8?B?bHU1Sk1oY1oxWTd5VFZPWHFYWXBoOW01YnUwUTM0aklKaE5EOUxiRW0xMkhJ?=
 =?utf-8?B?YklHT1VVUXdjWEllK1UvL1JnWGYwVzFMVUc0ek5sNlV2cWFISjZFb3M1NHRG?=
 =?utf-8?B?cWU3eUJpaVlXTWI3SVBCREtqaktUQVorTGt3TkNBMnpuSURIU01XVFBBRXow?=
 =?utf-8?B?a29EVlpjZEZISitiOTN2ZjdMSERjYUxDU1pnc2g5TldORTRsVldJYU4zYm1F?=
 =?utf-8?B?NkVUSStVQnZsTkdEUXBjMHJNb0FYb1RJU0ZQcDRmUGFMVU1HSW1vd1BJZm5z?=
 =?utf-8?B?aktmV3R5QlBJL25hNk1rVDUzcFNzVU9KRk12eEl5RlZwS0dGeVpwRWZiK01S?=
 =?utf-8?B?NDdBeURnaU5ZL1BNR0VOTXliVUVZdFN3M0ZmU25rUkxWNlNmK3Vxc3I5MURV?=
 =?utf-8?B?TUYyVFZ0YnN4SzFqNE1iempmYlVYSnZPUmlOdFRLU29PcEtuM3hGMmlPa1pI?=
 =?utf-8?B?elk3b1hMcnRQcEZQN2FMYzZCTCtKRDRoQnNHNXQvVXJtT2NEN0lncVMxVWh0?=
 =?utf-8?B?Q0YyNWs3eCtQbUFlekFnangveVkyVFFleFptSGZPU2NzVUlmbDVHVnBmOHV5?=
 =?utf-8?B?MjdaNUFrc1RPeVRwRnhRUHBrbWxGYTZWbkRaNEVTUG1xSFhGbGppbk9KUytN?=
 =?utf-8?B?YnhDMEE0S1hsOFhva3ZtY2ZWUzEyd0N5VmlBZGlIWm9YZG5zcmdaRW5qQjZ1?=
 =?utf-8?B?S21NbjQ4RU9CZEJBcWtLc2pUMUs3VSs3dlZ1UHp0dkhzeW5La0xpdjduU2Nt?=
 =?utf-8?B?Z3JsUmpHSWNjdng3MnRSYUMzR2EvR2pCaFIxTXBtZ25Lemk1QStVZ1pTK0p2?=
 =?utf-8?B?Mnk3NDN2bWpYZ3o4aksyem0xVlNRWUtPQzREUWkyTGZzdnFETWpNMlM2RHdp?=
 =?utf-8?B?Y0RvQnRrZUIvN3N2aGJYb0ZqU20vcUdDZGx0aTF1RjdjQlVIUUg5ZGdKV0E4?=
 =?utf-8?B?cGMrSWpBZjR0aE9VUk9pWXJadWVRL0Y0d0Z5TTY0K3pkbEF3YUozaW1KakVS?=
 =?utf-8?B?NjBVNGdScDNMa3dpc2pEM1ZBUTVrVUJJYnhmVGl3Y0VVZ2o3akpKQ3VqdDJW?=
 =?utf-8?B?VW9McFBjN1VPMFJqZmRCUDh4S1FTMW0zM1ducnNSNk8vK0NaRjhRUzBJMHBp?=
 =?utf-8?B?bFFKMGhBTVlGdDdOaGVPdHdSc1E0SkZFb0hGTGU5cVhsMHovWS9pL0QwdnRk?=
 =?utf-8?B?a0VHdUl1M01hMnFYdXd2ZitoVytjeUVOcC9rUFNqLzNPeWtoYlRNZWNYbDJz?=
 =?utf-8?B?RTNuc3hnd0tuY3lNSm9rS0tlUm16UmRNckgwSUc3Y3FHUFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB11332.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z2o5ZmNnME5iRFE4SE12UVBuVytVY2c3dFEzOS9FWS9yN2h2K0dQdzEvL0dM?=
 =?utf-8?B?VU5qbkNWMFhWS0dkM0F5am40b3k0RzJ1cUJ0ODVtVCt2Yk84dlpEYllIbWJl?=
 =?utf-8?B?dEkrSmJNSDVUYk9oMzBlV05VM3hZUnJWcG9JdTNXeTRPczR2VURHK1NhKzY1?=
 =?utf-8?B?bHV2MHpRU2NxTDRWL3p3RnRkeHB1VW5xOFZLaktUMUlTcEVkWjR4T3VpRXpF?=
 =?utf-8?B?R0cwMnlnUjZPQXJOdTRSS3pXUjI0TGltbW4yV3J2N0IwRTRaMDNocjJydzhp?=
 =?utf-8?B?WTRVS2loRkVudkxXNmVZa3VZcjFKWGFWQ2QwMFFjUG82ZzI3UytKTGdUTG5z?=
 =?utf-8?B?ZFBlTUxUT05DS01xaWNlUHpCOG5QS0JYVFUvMEhyU2hMdDJ4OE1JQVlndCt0?=
 =?utf-8?B?UU14UTIxZFhoTUxXSnhqRUxjdnVYRkJYcEp1NXFXM1dxTjZnWjlGdHc3c1I5?=
 =?utf-8?B?bVlQV2dMaDVLa0NMZnZNTytIVExKdnBCYzVQQ25FZXdwSTV5d2hOUVZCWjRm?=
 =?utf-8?B?dFl2RW8rcHg1QnpvckpuTVFqRnRFU3haSkxNOXBWTmsrazhWU3dpMmtoV25r?=
 =?utf-8?B?d1hZbzRIa24rQnJ6MUJ4bmhrOUR5enNRU0xWZzFiUVh4bWtZZ2Z3aHVVcGkz?=
 =?utf-8?B?NGxDcUhteFVWRHR0OVZ4NGdFWmhhcFZEZkpWLzVoWXJEZFZnWGRsc3FDWm9M?=
 =?utf-8?B?dHVjSTM5bjY1aUl2N25jZG92bVRXVVA0SUY3U1gzTE5kcWF6dzNsN1YwbVFG?=
 =?utf-8?B?ZWFmTFVsVkxSSmFaVUJob0J5dFhIa1YzUU16WlRXVTFwNUIrYnZCOHVGVi90?=
 =?utf-8?B?dzlKSS83RTNwN1M2YmZVei94Sm52RHNvS1pxbzFHcjQ2SzE3NWZiaXR2cWZp?=
 =?utf-8?B?RDN5Y1FSSit6bWhRTElUdWpYeWc3TW9uNGJVd0RlNmx5VVBRZUtUQ0Fqd2h3?=
 =?utf-8?B?dkNPOHR0ak9yYnJCTzFBeHlFYWdvcnY2ZnplOUhnQ3VuQ09WVHNCRk9SYTNl?=
 =?utf-8?B?YzNBRFlXY2tVZkRKVUlpbDZ2cE03ME9UOC95MEZoM0ZUOFBmS0FremlHekxO?=
 =?utf-8?B?Q3dLeEh5cTY1aEVyWmN2Uk10WGpuKzYxa3FiNlhSUmtVMmFLZDlqTHJmdFNy?=
 =?utf-8?B?a1h0RWdta0tnMmFNSUVacklGS1k5V04xQmlRbTBGQi83TEFWQmM1TlRwNUxC?=
 =?utf-8?B?dmtUMWtQVlZ0dUVYWFFiOTRLWlFiSHNEeWJoNzBxNU9IVmxnd2xmK1JDVnR5?=
 =?utf-8?B?WlhzckVjdXZIQnUxRlo5YWMwZWtIVzlxaUpsL20yNytMUTdxbG0vSnpyVU1u?=
 =?utf-8?B?ZXlGRmdiWGlEOEpDZWdPQjJQMVM0NndKby9jSC9lSjEyUEY5ZVU0cklXVlVB?=
 =?utf-8?B?YnZjd2NEbnZWMFhEUTRNS0pOM01rT01wajE0RGNKcTROZHJpU1hqS2F6T1Jl?=
 =?utf-8?B?ZkI0ZndBR0o1bHhQKzJ5Y01NMWtVSXhKMmFUNjNDdnNYekpYQUNwYkl2dXFh?=
 =?utf-8?B?bFJQNmZiaGNPMkk4ajlmeklBNHhXQU1YYVAvWUptbFFleUZlVmtSbkpLVUdF?=
 =?utf-8?B?V2NnQUFwZzNWbjFIYjh0ZGdKNnFRKzVYZ2pXdTFKa1V0cVpONUU2dWo0aUh0?=
 =?utf-8?B?ZGl4OEpjNmJ1Q3RYejhsbTB5Rkp6ZkNjSnB2cGJwcGhVYi9mQ2pVTHlvaEhH?=
 =?utf-8?B?cnZ3MFU4SHBpak1wSjl6WUdvMWFjTDRFQUZFV2NuVXVSR29zckoxT05IYXht?=
 =?utf-8?B?VUZ3bDFsN1BlYStUbFJYVUY4ZktPdG11MTFyS2NTVFhvV202aG1MQXdkVzVk?=
 =?utf-8?B?ZU14MklseDRUSzVNQkdoK0l2Sm1WVThEeGk4c2tIVnBubkJpRzM3K2dZQ3hy?=
 =?utf-8?B?UW1wMlBFSXpyT1ZKdmJQaW5Lb1VIaVNpZjRDc2hFR0p3T1dFb1ptUWdYVkJM?=
 =?utf-8?B?bHJ3blFweFlxZWFtd0lUVm9SbW1uRGlQZmRiQzc5OHIwQXI5dlVpeW9rcmNI?=
 =?utf-8?B?dmI0dTAxbXhHMkFQMUdyR2ZTWm9PRUpWT0pNcTRIVWdhSzRleEhwdW01emlR?=
 =?utf-8?B?TW5PcTJlV1FZSWFwaFBtZG90Z0NZK3hLSGxSajNVNTYyZDc4MzVZb3A2RDY4?=
 =?utf-8?B?Smo4cWo0M2VRQStqYS8xN2p3Vlcrd2N5L05OMWRSTkZLUmZVUUJsb3I0Lyt2?=
 =?utf-8?B?V3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4992792e-85b0-4e42-bf3d-08dcc5be79f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 11:01:45.9817 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LVZEu3SE+TQGAnid9FrABIMl1du/w/WQZWWGmk78yvteiMaZ1RMOWoZPmMs9Le4Ln6lZob3CgHxfd9m4J/Yp4LTUGWSUuUtIPhJMD+dBDUs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6021
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

SGkgVG9taSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gU2VudDogTW9uZGF5
LCBBdWd1c3QgMjYsIDIwMjQgMTA6NTAgQU0NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtOiBy
ZW5lc2FzOiBNb3ZlIFJaL0cyTCBNSVBJIERTSSBkcml2ZXIgdG8gcnotZHUNCj4gDQo+IEhpLA0K
PiANCj4gT24gMjMvMDgvMjAyNCAxODowMCwgTGF1cmVudCBQaW5jaGFydCB3cm90ZToNCj4gPiBP
biBGcmksIEF1ZyAyMywgMjAyNCBhdCAwMjozMzo0OVBNICswMTAwLCBMYWQsIFByYWJoYWthciB3
cm90ZToNCj4gPj4gT24gV2VkLCBKdW4gMjYsIDIwMjQgYXQgNjo1MeKAr0FNIExhdXJlbnQgUGlu
Y2hhcnQgd3JvdGU6DQo+ID4+PiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCAwMTozMjo0NFBNICsw
MTAwLCBQcmFiaGFrYXIgd3JvdGU6DQo+ID4+Pj4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhh
a2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPg0KPiA+Pj4+DQo+ID4+Pj4gQWxsIHRo
ZSBSWi9HMkwgRFUgc3BlY2lmaWMgY29tcG9uZW50cyBhcmUgbG9jYXRlZCB1bmRlciB0aGUgcnot
ZHUNCj4gPj4+PiBmb2xkZXIsIHNvIGl0IG1ha2VzIHNlbnNlIHRvIG1vdmUgdGhlIFJaL0cyTCBN
SVBJIERTSSBkcml2ZXIgdGhlcmUNCj4gPj4+PiBpbnN0ZWFkIG9mIGtlZXBpbmcgaXQgaW4gdGhl
IHJjYXItZHUgZm9sZGVyLiBUaGlzIGNoYW5nZSBpbXByb3Zlcw0KPiA+Pj4+IHRoZSBvcmdhbml6
YXRpb24gYW5kIG1vZHVsYXJpdHkgb2YgdGhlIGRyaXZlciBjb25maWd1cmF0aW9uIGJ5IGdyb3Vw
aW5nIHJlbGF0ZWQgc2V0dGluZ3MNCj4gdG9nZXRoZXIuDQo+ID4+Pg0KPiA+Pj4gSSB3YXMgdGhp
bmtpbmcgdGhlIHNhbWUgdGhlIG90aGVyIGRheS4gVGhhbmtzIGZvciBiZWF0aW5nIG1lIGF0DQo+
ID4+PiBzZW5kaW5nIGEgcGF0Y2ggOi0pDQo+ID4+Pg0KPiA+Pj4gUmV2aWV3ZWQtYnk6IExhdXJl
bnQgUGluY2hhcnQNCj4gPj4+IDxsYXVyZW50LnBpbmNoYXJ0K3JlbmVzYXNAaWRlYXNvbmJvYXJk
LmNvbT4NCj4gPj4+DQo+ID4+PiBEbyB5b3Ugb3IgQmlqdSBoYXMgY29tbWl0dGVyIHJpZ2h0cyB0
byBkcm0tbWlzYyB0byBwdXNoIHRoaXMgcGF0Y2ggPw0KPiA+Pg0KPiA+PiBXZSBkb250LCBjYW4g
eW91IHBsZWFzZSBxdWV1ZSB0aGlzIHBhdGNoIHZpYSB5b3VyIHRyZWU/DQo+ID4NCj4gPiBJIGRv
bid0IGhhdmUgb3RoZXIgcGVuZGluZyBwYXRjaGVzIGZvciBEUk0gYXQgdGhlIG1vbWVudC4gVG9t
aSwgY291bGQNCj4gPiB5b3UgcHVzaCB0aGlzIHRvIGRybS1taXNjID8NCj4gDQo+IEkgaGF2ZSBw
dXNoZWQgdGhpcy4NCg0KVGhhbmtzLg0KDQo+IA0KPiBTaG91bGQgdGhlIERTSSBkcml2ZXIgZGVw
ZW5kIG9uIHRoZSBEVSBkcml2ZXIgaW4gdGhlIGtjb25maWc/IEl0IGNvbXBpbGVzIGZpbmUgd2l0
aG91dCB0aGUgRFUsIGJ1dCBjYW4NCj4gaXQgZXZlciBiZSB1c2VkIGFsb25lPw0KDQpEU0kgZHJp
dmVyIG1haW5saW5lZCBmaXJzdCBiZWZvcmUgRFUuIE5vdyBEVSBkcml2ZXIgaXMgYXZhaWxhYmxl
LCBmcm9tIGEgZnVuY3Rpb25hbA0KUG9pbnQgd2Ugc2hvdWxkIGFkZCBkZXBlbmRlbmN5LiBXaWxs
IHNlbmQgYSBwYXRjaCBzb29uLg0KDQpDaGVlcnMsDQpCaWp1DQoNCg0KDQo=
