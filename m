Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E06A64584
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:31:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ACB810E3C6;
	Mon, 17 Mar 2025 08:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="x+x9Z0MH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2068.outbound.protection.outlook.com [40.107.212.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B18E10E3C6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:30:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dv7pcSzwSc04gktc4ZKP0adSUsaaHJbpahy87CJcS0wtyCf6UviWVz0NgO7Pj2KtHOVvUryvN7wmFJY/R5ctA7P5gIp+H/UA8GGynE1ltTk/Jn0xUA2qN8DzLo/p8SETQ7bqu+5l9WRt60wrr0DSpGojEflY1pyVIYiFz00TAN60hapZiMJPUWj5dsFPVYhDeQs68emRbG4n40nU6n012GEp8ZHtQHg2EwYHn4PcVYU3L+r2F1EX2h0ojFLMONa/ArrhOhC/i7QUSxt9w7MJ8BIf2Rc54G6HAVHTkIWSCYMwj5kf/fJImGPucjo+vch7bJMODtbm/SHiTRtw6K43FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TL2Dm7v/Z5NutUcQGfA4gaKKEYekYJpIQ9PBkUouF7s=;
 b=ZhPfCMsUZNZVSlwusGLOf7QgwLDKeUvS0Qt+45mPmCsqZ7O7huGZjdlq8M7aLNAvncfA6h+4F4SysmVq2QmXAIA2ScXySy9EOV5casmTal7VgxSX3zOOQK8rOnDTHtuACzTqkdwIymHk7j8APdB8mA8lNvN0EmkkMEoPojHxwAv2gewsGKi8RXwOUuHbvXb9Oi5aJUeSiokKdj1GBQUPdUSEqpugAIoqJndN2GDXx13U5WbUXqosdAFgk50ey7P1oarmQKOrdp8d2z2eTt8CoXxpuXdEOou9/hgfq7ZXfNVxbHdo7SnK04ShJwvAUTuOZOVeR2MDtp9m/t5YMac/rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TL2Dm7v/Z5NutUcQGfA4gaKKEYekYJpIQ9PBkUouF7s=;
 b=x+x9Z0MHqhEEiphDt8VkSsTqPz37b9yZM+Y2SDm5Ys6yZ4DhH0Kig0L0Qb7wwbnemypEpCmM/Y0nEupUhxGFpMU91XN52iyslA0/fpJ6cDBP7mdYQmHdfu+1fTQh0SA0ZdSTJOG1lslsIbzYD6iC8y5SgU+hRP6ND7pqIhRWVLJy1x8+jtFbIURIkZxrZcIHBkkenkaHGaf/kQzPPxg3FLPZQ+atQrbJRy1fxka1PycXC3Uxj2T6FOUds9qCRh4qeQvCIH43AlVAq2ob4rw3EL/hyyhPLnFgXmkE8n5inuLkg4zuICDA6NeNus8Q9d6gCxc/bgJSSkcdLugVgxRTzg==
Received: from BY5PR11MB4181.namprd11.prod.outlook.com (2603:10b6:a03:18c::32)
 by PH8PR11MB6732.namprd11.prod.outlook.com (2603:10b6:510:1c8::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 08:30:52 +0000
Received: from BY5PR11MB4181.namprd11.prod.outlook.com
 ([fe80::2df9:9c74:abb:8da0]) by BY5PR11MB4181.namprd11.prod.outlook.com
 ([fe80::2df9:9c74:abb:8da0%2]) with mapi id 15.20.8511.017; Mon, 17 Mar 2025
 08:30:51 +0000
From: <Hari.PrasathGE@microchip.com>
To: <boris.brezillon@collabora.com>, <Manikandan.M@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Dharma.B@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Thread-Topic: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Thread-Index: AQHawvhvIbhov8wm/0awRqv13ExOkLHQsg2Agaf1yQA=
Date: Mon, 17 Mar 2025 08:30:51 +0000
Message-ID: <662be697-acdb-42c2-8078-6baeb985a4ba@microchip.com>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
 <20240620161317.063833a9@collabora.com>
In-Reply-To: <20240620161317.063833a9@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR11MB4181:EE_|PH8PR11MB6732:EE_
x-ms-office365-filtering-correlation-id: 8d5a1ec5-c3eb-4d52-0150-08dd652e06df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TlhxeldQVEYzUDZmbEtsd05JemdkMDB3UFZtVmxwNERBNjNlSUdFaXIzb1pE?=
 =?utf-8?B?N0tKNDZ2OENEek9CODJYd0krMmFLc0tDanQyME8rTXhBbmlGSTcxcndRTjRY?=
 =?utf-8?B?aVYrdnRzQUhFaDFZY3d5N1NlblNTYjkvbFpUbFRSRk9aRDREaC9HeUZ3WEdJ?=
 =?utf-8?B?UHJJVFI5MXY0TWtTQzZGOHNFczNzN0xURTJwQ01hUGo3K1BlS2NScjUvQ0cx?=
 =?utf-8?B?amtMOSt3WGYrcTlIWXVWK3V3d2xLbXpLVG5ZTWF2dUMyczB4dHkxSVJQWmxS?=
 =?utf-8?B?M1BuOWpTWHZIbGhzTUlSRVRBMzRIbXUyV0JDeVUvSjJ2aEVQczBpei9RUkZq?=
 =?utf-8?B?RWJtaEQwWENOZGZTWDg1WGN5SHpmMzN4RzRtZlJ1VG1ib3FBMVVsYUdJUzJ2?=
 =?utf-8?B?TjFJeW4xUFJLVThTTHhic3MyOEtYb2NTdG9yajJLUGYrZ01aN0d4Nk8wc05I?=
 =?utf-8?B?amVJL2FQQ3RaQlc4Q3UxRXFBaXFXanl6NVhjTGZwTlNrVUNsRlhidlBpOGh2?=
 =?utf-8?B?dHJGdXVMZmlmNHRwZlpMQSszeDFzcmUva3haK0lnZEZORnladndUSDRGWTAw?=
 =?utf-8?B?SG9QaVNOMU85Z1NzN1VFNTB5UmJ6WXZjL3VKQzJabjhOa21iQlMwOFJNQjIr?=
 =?utf-8?B?SDJHYmN6Q3Uvamk0UW9aS3pFdllnS3dhUW5iV0VMOUFpSFl3aFJpdXIzaGI4?=
 =?utf-8?B?N2hnQWNYMS8zTDBEUG9aU094RVNvdERJZzMrN3E0ZVA5QWxMVUx5aXZkSmhm?=
 =?utf-8?B?SG55alhKbEdzaG4zcU5YT3NlZFBHcjduNVlFYmNsWS9BcVp3ZUt3NDdyVW5w?=
 =?utf-8?B?K3VkV3BxMDhEZHBsYkQvNDlZRGpTdXFUZS8xVWZoVnNUM3RiM0xGYTdMaXFx?=
 =?utf-8?B?TEpoY1IxSG0wanhITU9la3BrUUZiRWxsc3RhQmNodzdkM09keVY5Q1paN2Z2?=
 =?utf-8?B?blp2ZUV2ZzFWT0NvQWVvcmp1NGNtdWpTOWlCdEdHRTh0MzlGR2prRkM0Z3Nh?=
 =?utf-8?B?bHdBZzRaUmh1MUp5b1JzZkdwUkE3K0dNQ1VzZEhvbGhsTFBSUWRUSVJnamVN?=
 =?utf-8?B?c1VtZCttY2RLZGEwK2FOVDhXVkRveTNOVnpPcmNYNW9xUGJrM2g0WjFUcmFW?=
 =?utf-8?B?Vjk5NkhMaXNFL0dnRnNENldDQTdlQnBmSExjaUFPK3BwWnprMTd0TWMyWStk?=
 =?utf-8?B?QzFKN1ZMZFZnc1k1Y0RGNllUNWdSWHZjOUl4OWR3dFh1SGZxWHB6UW5Cd1RF?=
 =?utf-8?B?d2hyc0JqaDdFSCsxSUJsNGVESW5wREk4YUhjU05EQ2J4UWRld01mYVM4NVEz?=
 =?utf-8?B?WEs4T3J6bU5wUTZnalNBWTZZT3BsVFN4SUh2T1NJci9BdnhGMUI4aCtvRUcz?=
 =?utf-8?B?cjBnMDY0aUJ3aWhFaGR4cDhGZEJhRlNHS21veXZ0SWpzU0F3VGVJM2oxbm5j?=
 =?utf-8?B?NEZ3WjhaaXVqKzBtT2N6b2RWMWIxWnM4TGl3cXB6T01GbE1TVHpnUmxHRG5v?=
 =?utf-8?B?dEN6eXhLdy8vcVhVR09pMzNEaHNrTVZzWURNb3M0UGljNHVkOHI4V1VuRlRP?=
 =?utf-8?B?cmVsTlQzdXEwK2I4VTVlN3AzQ1B5aVRTamtNSlVZOUlzSXg2dGtkZ1pFdnRV?=
 =?utf-8?B?V0RZcFVWNVJTdVpTZE1CQk1HK1AzdVRaWkFHNFNHYlZnNEtFOE5WOWdYei9x?=
 =?utf-8?B?cjI4TWdZalArZmFVOWtpS2hXc2NTd05vRTNiSFVnaHFkWjl0RXlBUDlYUkd2?=
 =?utf-8?B?ZjR4R2dRN0tPVjU3ODZlMWVwaEtaZmptZy9udWJWM1M3U3hEc2NsWUZ0eVo5?=
 =?utf-8?B?TFowNFVWU25RWjQ2TU40c1h0clNEdkg5QnVGclc5cVhlUEFjbm9NbFltcVUr?=
 =?utf-8?Q?XAM/2d5Ip6u8X?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?USs4YmZnN21hNFgwY3dLeThDelpabG03SzBYSG5SS3VkOWg5bi9BQlR2SVRz?=
 =?utf-8?B?S2s2Zzd4LzdPWmw5cEFTdFNFbG94NGFReGc1ZXdHT2NFWjhubWhzRmtQRUJM?=
 =?utf-8?B?NmFNSlB0MUpzUVBOeFZpZnU2eFFaOEgzOVJhRGhvbU1taTR4TkFZbzNGUGJD?=
 =?utf-8?B?TXlnUnowd0dpa2F4ampILzVkMktVdHNtMDc1UVVBVGY0aXNQK2NCL094NEZ1?=
 =?utf-8?B?amxvQXlMMFA4NW9OZmFQRVlMRlhpSGgzc0ZpUTZLV0h1WWV2emZIMVFFUU1T?=
 =?utf-8?B?dXVhVmdwUG1NVnpjZE4vcG8rbzk1bUZYTUpOaDNiT0ptUGx1cHRDaWM3Q0NV?=
 =?utf-8?B?Ukx4dnY4M2hvWTN2cGF0dXowWnFHZU5SallTQzNPQWpTaWdaR1k5UlRJcVIx?=
 =?utf-8?B?WnFEQWVlc2tyNWcrMHFJUWc2SXZqTUN5bVVpMUpvV1lONytzM3BQS2xJVkJB?=
 =?utf-8?B?RGdwOWFmZGE1NE5KL3BTWDV3WmVub3cxNy91Y1E5ak5GMnRkUWxKL2ZTT2dK?=
 =?utf-8?B?WTR4V0FJRDJqYzB5MXd4NkRYTVpqVzJzWk9pM2hqOTdkUFNGeUQ1WDBDWHZl?=
 =?utf-8?B?eDdwQ2JuWm1DUTJkTUZwYU9JRVFTdVdCdW4xSFdINHlseEZXV1BjUTlvU3RR?=
 =?utf-8?B?eVNlRmE5QVA2VVNxbWlEc1ViTGlnOERvOEkxdlY1NDM1YTg5N2k1ZEh0cTNl?=
 =?utf-8?B?dUpJKzhKc3pUL2lwa2ROb1kvL0p1VGhad3NtNnp1WTFNTUxoSGlUUlppdVJr?=
 =?utf-8?B?UEw0VGhINzMwSUo4ckgrM2cxdHA5QkkxQk9mWlpQdndmMDVjTTFDM29JaE84?=
 =?utf-8?B?MmtYWEc4VzFSeWNQa0RKRSt5bi82cXBiTGREdlFWS0RQcnoyeHdxaU9CTWxs?=
 =?utf-8?B?RWljSTZKOGtjd3JxWFVVZkNTKzYxVjk5SlNVaVJTNzhZRzE3WndodWRNa2pn?=
 =?utf-8?B?SFhPcEZrOG5GdTlTVDBnenNtUnR0WHdmb2F2bG00dW5zUnVxRmhWcDdLMnY1?=
 =?utf-8?B?dGw3a2IyU2VNVE9xVHFEMm5lODFFcXhid2c2VDBYaUw3UzY4MFpJaUczMkxv?=
 =?utf-8?B?ei9qaDAzMDdnZHRkdkRiRmtkVldmbzJ3T2NhbDN5QUM1eU5qeHFWU0ZBNzNE?=
 =?utf-8?B?TnZVUzBPNmp5SjlTcWNyblNzMzhMVWlmalQ0SFpJeCtxMU9rUFIzS0M2TjNi?=
 =?utf-8?B?TkUrZkZZVHpSODRlR3ZUa1RLeFJIZCsvcld5NkxTUUVIUHZtdjNyT2QyWk5N?=
 =?utf-8?B?bllJWStzYnFJZ1lndnZsanJ0b1FEQXZLUHpiRVJGNWlma0RPaW11Ni9kNE83?=
 =?utf-8?B?dzJBNE1RbWJLVWZpVFBTVXNONkRCcUxDR1JXakxYNXU1TFZ3S2FpL2F6dFp6?=
 =?utf-8?B?WDZhOU9RSjF1Q2piVG1od0RMRVovUDJtNTBiZGtoZXdlQStmcGlzWG43L1NS?=
 =?utf-8?B?QnVPSEhOUDRzbGQwUGU4Y0o0eUROQ3RIMGY3ZFF3V0pMS3lZY3NzUGUwbVZQ?=
 =?utf-8?B?V1hwQU0vbEJBVzB3WjloNWZMWTcwcjFBenh1TGFrUko0amEwZjJ3MlVNVURK?=
 =?utf-8?B?N0pkSlpscHFFU2g3dTFMd0JITCtZZU91YTlaQ0tEQ3NSbWJIY0ZpRHNJMUpi?=
 =?utf-8?B?MkVhYTFCVitGUTBSVTdwMVlESUJOY2tON3Z4WnhWMXRaMVhOK0JaLzV6UGtt?=
 =?utf-8?B?eU9CVXBUQktrTzRsZXd5d2Z5Ujl6aHc1NFBnUDl2UWF4bTlHRnlLUFUrOFBL?=
 =?utf-8?B?M2dyeVVtT2pQSUR3T2FxSS9qdG1DTDV5Unp0NnhNcERmWTBBbU9NN2NIVTBn?=
 =?utf-8?B?V3luU0dIRGdaVkdjVERwaUh5OXRGc0Y5NXM1QkczVkgyeGFZTnk0aGFWeEJV?=
 =?utf-8?B?YnI1dE9PWGNYYkxYbVAramkreFJXVi9jNFAxWlZvR0hmdVY1QXNlUzIzRDdp?=
 =?utf-8?B?Rzh3WWNRcldncUtwYitXbk1TV0NIbXdhemVvTGo4dW03Z0ZaQU5maU1uWFVD?=
 =?utf-8?B?REQ1eTYxNVZzd054WHZ4dCthT1c1MDZaM2J3Q0lhSjMrZElkdnR0WG1qSTcr?=
 =?utf-8?B?N2FQaGd0WjF0SU9MS01HZDlSRHFFN0JleHdhclNhK1RBRDFLd0l6NGR0czIz?=
 =?utf-8?B?TnI1SWprK0JraHAwQ2M0NVhSVnk4cXZKa3FRVlJGYVF3WUE1U29kaE9RWlhz?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0473FB937539AF41BE9C544FBEAE7EF9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d5a1ec5-c3eb-4d52-0150-08dd652e06df
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 08:30:51.4443 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: T7j3aeSOLgrIXuy3sIyGBHC0RpUNL7gsctPys2wKFdOQ4XSRHdhi6GZJFFq4N28UDsr7DebmZyE9nhJ7OkjxIqqOyBu5OOEBQ3rtI/+yQD4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6732
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

SGVsbG8sDQoNCk9uIDYvMjAvMjQgNzo0MyBQTSwgQm9yaXMgQnJlemlsbG9uIHdyb3RlOg0KPiBF
WFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgMjAgSnVuIDIw
MjQgMTU6Mjg6NTYgKzA1MzANCj4gTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4u
bUBtaWNyb2NoaXAuY29tPiB3cm90ZToNCj4gDQo+PiBEcm9wIFNhbSBSYXZuYm9yZyBhbmQgQm9y
aXMgQnJlemlsbG9uIGFzIHRoZXkgYXJlIG5vIGxvbmdlciBpbnRlcmVzdGVkIGluDQo+PiBtYWlu
dGFpbmluZyB0aGUgZHJpdmVycy4gQWRkIG15c2VsZiBhbmQgRGhhcm1hIEJhbGFzdWJpcmFtYW5p
IGFzIHRoZQ0KPj4gTWFpbnRhaW5lciBhbmQgY28tbWFpbnRhaW5lciBmb3IgTWljcm9jaGlwJ3Mg
QXRtZWwtSExDREMgZHJpdmVyLg0KPj4gVGhhbmtzIGZvciB0aGVpciB3b3JrLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIDxtYW5pa2FuZGFuLm1AbWljcm9j
aGlwLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxv
bkBjb2xsYWJvcmEuY29tPg0KPiANCg0KTG9va3MgbGlrZSB0aGlzIHBhdGNoIGlzIHN0aWxsIG5v
dCBhcHBsaWVkLiBNYXkgSSBrbm93IGlmIHRoZXJlIGlzIA0KYW55dGhpbmcgZG8gYmUgZG9uZSBm
cm9tIG91ciBzaWRlID8NCg0KUmVnYXJkcywNCkhhcmkNCg0KPj4gLS0tDQo+PiAgIE1BSU5UQUlO
RVJTIHwgNCArKy0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMN
Cj4+IGluZGV4IGQxNTY2YzY0N2E1MC4uOGYyYTQwMjg1NTQ0IDEwMDY0NA0KPj4gLS0tIGEvTUFJ
TlRBSU5FUlMNCj4+ICsrKyBiL01BSU5UQUlORVJTDQo+PiBAQCAtNzI5MCw4ICs3MjkwLDggQEAg
RjogICAgICBkcml2ZXJzL2dwdS9kcm0vY2kveGZhaWxzL21lc29uKg0KPj4gICBGOiAgIGRyaXZl
cnMvZ3B1L2RybS9tZXNvbi8NCj4+DQo+PiAgIERSTSBEUklWRVJTIEZPUiBBVE1FTCBITENEQw0K
Pj4gLU06ICAgU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPj4gLU06ICAgQm9yaXMg
QnJlemlsbG9uIDxiYnJlemlsbG9uQGtlcm5lbC5vcmc+DQo+PiArTTogICBNYW5pa2FuZGFuIE11
cmFsaWRoYXJhbiA8bWFuaWthbmRhbi5tQG1pY3JvY2hpcC5jb20+DQo+PiArTTogICBEaGFybWEg
QmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+PiAgIEw6ICAgZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4gICBTOiAgIFN1cHBvcnRlZA0KPj4gICBUOiAg
IGdpdCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLmdpdA0K
PiANCg==
