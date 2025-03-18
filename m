Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6245A67537
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 14:35:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40C610E132;
	Tue, 18 Mar 2025 13:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="RvWO+VSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013044.outbound.protection.outlook.com [40.107.159.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FF0C10E132
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 13:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2EyaCZdGeYMoz5qVwDIDsNFFhYwWstKNUgrz3XPfYOY04LJMoX+90+WJgCyo2OA55Q8eqxkf06rSMYyvISih5LCSkf69hoyFLPq/Z3rRy/ecEAo6xDvaz7q089qDwWTRmA3KZAngOAtkb1SQuh57sdgJ+mU1qNDgXanTpZFyYo1uqI0GHelWSGWskIBN9aFPNxXmkyKLWNLK4X8wJWwThNAg5wbXsJHzHxI0MdNa0lbtgvShhx5Bv4Y8QGJHlHWo0k3QVQeJNgKwphgg+zztG/j1VRcKb1Ax1oHC+ASxhjmV9T2nxIth4yHVzRjr2m2GUAkqmtPEEaKJ3dZa7V4Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/Ow/x8vdL0w4GLvMrbIzFcHI/dnosRRE5U8ghSC6g4=;
 b=eX4HyuoWyrTYzrOwAiY9MvSxRYksmGrQAmNgmHqnB2QG5MKSmmO++DNm9Frjf70sESpZJ6X/JWVZoNP3ok3Fak/gpxZnvqDRKcrQHUQsaHicuDn0DmTHoIoyRMRvUBNhmhvqJAagn36wanaUyzfOefKOhbzdFImUBtfGPRY+pB3Xh8vRxTQmiyIrARI74MjH/sT/v99ankHPyguTiz2ggftD0wyL5b+xvolCBlxPs68I2A4uZgR6jEIXe0zOV+DfjpcCZa5aWoos1DXoAJheETlpNChNyc7zmQyhcP8z24FCIsgvyjjTiEtLjhI8A8qnhBWZu4rEoTIPOo8jF6kaZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/Ow/x8vdL0w4GLvMrbIzFcHI/dnosRRE5U8ghSC6g4=;
 b=RvWO+VShdmBx37EpmSpG2psGTBMyRuVhn7nSzWI80uDFHMxcWvEJG2lhWEG/d+6DLOPAvL1TzcYI3T/wUkcgRjHsb+UP8wakc+ZIlFkJYR1t83xNYwbYRkFi26wwSvxovVgkKXn58sMOCHkDKgaw4WXGfjR2RRZEt6iDaFGEPbWnv0KCnEjhTRlTUn0XIXG2Gbg5bYOrg19lmqqMRk18KEqnLHafnuOVOLaBExUy2zsN6qa4yyNbyM7IJN3yeRAviCUS6rN0g6xLuXIrl3+Wd0J1LCZSl+8TXgOd1PJAyNpETBpHID1cLt+TyVzkUpZtNklvhzZWacrKxpKyNlUDFA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS8PR10MB7135.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:61d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Tue, 18 Mar
 2025 13:35:13 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.031; Tue, 18 Mar 2025
 13:35:13 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "jyri.sarha@iki.fi" <jyri.sarha@iki.fi>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "robh@kernel.org" <robh@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>, 
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "aradhya.bhatia@linux.dev"
 <aradhya.bhatia@linux.dev>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>, "mripard@kernel.org" <mripard@kernel.org>
CC: "j-choudhary@ti.com" <j-choudhary@ti.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>, "u-kumar1@ti.com" <u-kumar1@ti.com>,
 "max.oss.09@gmail.com" <max.oss.09@gmail.com>, "francesco@dolcini.it"
 <francesco@dolcini.it>, "devarsht@ti.com" <devarsht@ti.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nm@ti.com" <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "praneeth@ti.com"
 <praneeth@ti.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] drm/tidss: Add OLDI bridge support
Thread-Topic: [PATCH v4 3/3] drm/tidss: Add OLDI bridge support
Thread-Index: AQHbPn5fY8c8yD2lDkSs7izfptBE/LN5mCkA
Date: Tue, 18 Mar 2025 13:35:13 +0000
Message-ID: <4155a886b3b3027d4ca8bb7a13801852ef8754e7.camel@siemens.com>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <20241124143649.686995-4-aradhya.bhatia@linux.dev>
In-Reply-To: <20241124143649.686995-4-aradhya.bhatia@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS8PR10MB7135:EE_
x-ms-office365-filtering-correlation-id: 378a2ecc-b098-4e28-a95d-08dd6621b64d
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|366016|376014|38070700018|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?dGZHTU13cklTTXZ5L0ZreHh0SzAwaVBpdWJ2QkdreXoyMFdGUndqRXBFeWQ1?=
 =?utf-8?B?a0pCUTY0emV4SDNURWt5QXQyTFBNOUZ5MEZKWkRBMWpMeW90Wis3QS9BSlJ2?=
 =?utf-8?B?M2p3cEh2cFVDWmdmQUxJK0ZMQlRKYU15YUwvb0RTMGUwQjdEeTJEbWd0OW9F?=
 =?utf-8?B?M1hFams2S2JFYjJKREFmNmh3SFFLSXhhclRTbHBxclhXRm1TVFdlTlM3U2p4?=
 =?utf-8?B?bE9zWEZLdUNTbnVNbXd2YWtqNzM5T2F1b09MNjcxbjJxUmdqZmVJU2FaZW5I?=
 =?utf-8?B?cFZjZEowYkV5d3QzOWJMTlVHV0tQeEh5dFRzWGJrRnc4UWR3eWZPdEw2d0tV?=
 =?utf-8?B?MnV2Z0FsOVVIN0QrMGNyMkJhZlRRUTFxVWpCMWVyNDFMYkl0dDlFUm9kMzJr?=
 =?utf-8?B?VWNsSDJXNmMwcUxkZm5MRUc0Z0ZZMXRqbjZpM1dNODJvd3p6SkZ4ZldvYU5m?=
 =?utf-8?B?cHE1emVXbTQ5R2IwYTA0MnBYcWpxU1VYQmNXcURXbkJFd2paUXgvUWFBMk92?=
 =?utf-8?B?ZmJMVDJESEFHTVJqWWhVSGRWTzNGdVdWcnRxTTBuRkVyeTVyQXFLeGFiUUVZ?=
 =?utf-8?B?L09UMUo2c2kwSEdrU1EwZWFJL095UTk2UlhrdXFtdE8wVDdHcjJSNXVJTW9u?=
 =?utf-8?B?eWRGMUNSdDhtZ2wya1dzbDBFdWFQUFRraUpiVlpLSC9saGE1N2t1Q1p1bEJM?=
 =?utf-8?B?WmlDT0poN0JKWUFUaUJhZzVYNFZMbjB4eG9OMURaaGY3ODBBQ0VWQld2NEdu?=
 =?utf-8?B?dGpEa21CRzNFSWg3dTVSc3RnaHhMY25uTWIxVjh0eGdiQVJyblovSEFhZ3NB?=
 =?utf-8?B?VjIxVzdaaC96ZlJVcU90WjllSkVqeG1oaFQydDAwZU5SYk1CVmZsTXRCWmJX?=
 =?utf-8?B?Wll0U2RDK1M3RnVtRlZwaXhyMjJacjhCayt6OXVPUHFqYm5DWHhCRytPOTBh?=
 =?utf-8?B?L2dyZWh4c0NXYWluN3BHNmVtVVIybXhYSGVvZ1FFeXdGOWVnUFBSVlZva1Z3?=
 =?utf-8?B?dlpieXVwUEw4cFZLMHhrUEpzMkd5a0tzaitsbEdQbWM4eTRrcU12eVVvVlMw?=
 =?utf-8?B?bGxiREdZdExIL1l1Q0hRdTQ5K3MwYlRrMndZVkZWKzdKZHVvQmU4Yy9wNTBC?=
 =?utf-8?B?a3VYQkJNWnZLNERxaG8vWjFnZzBzdjhobzY4VEkwazJMWWEzQVhnNnZwWDNa?=
 =?utf-8?B?UU44NjBuR2Fvb0xOWk9PSnFacUZ3dWd3VE90TnFaa3ZjYW5IbXlaazQzY2ZW?=
 =?utf-8?B?STF1TDV5NjVvY0ZGRkU1R0hYWFI2R1ZQditKc1E1SmcweWU3Z0d0bG91WmNP?=
 =?utf-8?B?MkljNHVCdW5XeTZGTTNkNDNDaUNBVGdvaWkxYUw5VC9obVRnc2N1SmdBYVp5?=
 =?utf-8?B?NHMzNjVuK3AxZU9YTno0M25NdVhpRVlTMTBpK1k0VFdsZ1NlMDU4Y3JES24y?=
 =?utf-8?B?T1hHcXgzbHk0Y2pYK2hlQmVMeWp0MG1ualA4K2JMN2FxMDJodmNkWC9HVGx1?=
 =?utf-8?B?bVhTdWxDYTJxeCs3MzlKN0NIWTFFQWQ0Y0FZeHJPdVkySmZ6bThXYkZEZUdR?=
 =?utf-8?B?ZEFlclJ2bUYrZlBScXppdnBlbzFWYUQ0a0x6YXBMQXlNRmFTemFBL1RJdm5r?=
 =?utf-8?B?Tmo2RHZKTGJWRWk5Sk44b0M0cFdDblR4QnF1VkQrbHVsUVZyNy82NitjNTRz?=
 =?utf-8?B?YlcxR0tKdXNZNEZSNW82QjZJWkgyWGl6T3B6U0I4eGpnMm0yR1BVV1h1ZE0z?=
 =?utf-8?B?dm56aTRrekF0Qm8yZkpHLzA0bnduVXlET3VJU1BEYmg4Z2VCVHBxZU5ZZC85?=
 =?utf-8?B?TFl2M1hndldiUzYwcFBnWDBYcXo3LytYY21BYSswaklBY3h5eGV0MGlLL1RT?=
 =?utf-8?B?eEJjamYyaTl4YzN1RDNzQXRGN3JyejZnMjlTZjNCc1FZaFE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NHVEeW9nVk9IQnRKQUFJM0t1Zit1VnR0YWdIdWNpclBUVkhXZDB4c1BpWFhQ?=
 =?utf-8?B?ZXh3N01VZ080NE9PKzVyUzFncFdKQ0xGMzUvQXZtQnRodHVNTGdZMXhEdVo5?=
 =?utf-8?B?TzI1M1p2TTdiQzBQZ0RvZ0h3N3FyL0h1dG8yRThqeURaZk1MZFIrbG4wd1RY?=
 =?utf-8?B?a05paU1vMDdZWEwxNVFCK3JZcWFlSDczT2hQd2ZHQ3ZEbmZxRFVqRDg2Vms4?=
 =?utf-8?B?dWZOYTNkbVA4YklTdWNOdmpIVEoySGRMMGF2WjNxVkhsMFcxZWJzUk01UUZK?=
 =?utf-8?B?aWxCV2JFQ2Nrb2xDVmRyR0tkQTRYOU5YY3ZBQlZnZ3ZsYUdGN3pYUjkvTlIv?=
 =?utf-8?B?STRUMW8xcVR4Q0FHS1NaK3JHTEcrV2hIUXhmbTl2SXg1dDhjbUU1MHhEdUFX?=
 =?utf-8?B?WXArSkR2S1BTd0dMNm9CWm1zQ25XUFMwMnJpUmJVS0FUWTVjNkJuMmRMOWxV?=
 =?utf-8?B?WW15YVhkWm9jMlZZaExhWnovT3dFKzFsYnFOTlZnUG9RbFlTOUVhWW5LazFl?=
 =?utf-8?B?bnFnU1l2RzBDcWVSTlRaazVjUVZ4NlRlck1IbHlXZW16MlJKWmdHOHlwN3pX?=
 =?utf-8?B?SEdibWJUdCtBRnl6Y1JxRDVmaFdwY3BVVDV5YlBuR0hadTJmbWdDVWkzdkw4?=
 =?utf-8?B?T0YwdzIxK3hCS0lqWTY1WHA3VE5RZlROdnprYTZRNUhqZXlqVHlKb1lGS2g5?=
 =?utf-8?B?NldaS2xyUmpIeFBCRnhwaWRaZnIzdW9VTGVrS2J5czN4WG9ZRkw3aW1lUkZP?=
 =?utf-8?B?V29HdjN5cVQ2cGovMHc0WS9NdUNiaDdwdUl2cmNtQ0ZFcTA4UTZFSXU2azNE?=
 =?utf-8?B?Z0VZRXg4L2h4YTNnU000SXU2RmN4T0Rzai9ZTG51OHlNZ1FvLzNQOEFaRXA4?=
 =?utf-8?B?WkN0S3pyOTVScm9zWWlPL2NkY1V1T0cvL1RqNnhRYzlEc1pkTm5kZGxOa3RY?=
 =?utf-8?B?VE1LV0xMSXhLcUh0VEJXMEhBRVI2WUxMdnhhVmVRb1oySGI2VERVMW95K2VI?=
 =?utf-8?B?c3FrSk41VElLUmVnSDJMdjF5VHUrdFVaSERhS3RkYXUvNHdyOXhJRlFYR2Vw?=
 =?utf-8?B?QlQ1YVZCZHRrT3kxWGplMHhZTEo3MCtuOTdsQ1VRakRTWDNLY2NoRmsyeVkr?=
 =?utf-8?B?eFhnN1RsOUc5VW1HMlhLSmRGYmwzUjNTV0VyblVZUmR1WW1HK2pPcG5kb1ha?=
 =?utf-8?B?ZXJIODkyeFp4anhjNE5MWHRqK1Y1UmtyUWppRGtVZUtxaGlZc3BmTmt5aEY2?=
 =?utf-8?B?ZnZEWlJpNXRiN1pVRU8wRFBWcmxPNE55YkljL29sU2tjMi9hekZjb0UwOTJP?=
 =?utf-8?B?dFh5bkFVNmNncThuM1llbWxUUmo0TnVZZUN4ZlBZMU5kTEp0cDgvWnFheFNQ?=
 =?utf-8?B?VXg5a1BldHkyQ0prNDROQTJRS1I5T0pTQlVMNlJsZ1lGbk01UTJpWlBWd0hj?=
 =?utf-8?B?anBsU3Zwa2kxekpwVzBOZks5SmtZUjVrbFViSkY5SS9MSmM3VUZ4N1Qwdk9X?=
 =?utf-8?B?ZFZBaXpXRGRoMjlZaDI4SGNPWmE3RTArRHlIY2svN21KeUw2TnlibTlNRnc1?=
 =?utf-8?B?SVB6NWtJaThPOXZIZ2owL1VkNzVKN0d5MkJScTQzd05rbmtwTjMvMk5vcklB?=
 =?utf-8?B?bU5iT1hhcC9ZL3JGYXF2QnE4bTNBUVJZcGpoV2g3ODZUMW9mbWRjMDV3WXZX?=
 =?utf-8?B?aFFidnJaK0RlRTJubTJ0djdxRWtFTU94R2J5MU1OR1JoY0FhbElLeDVpZlRy?=
 =?utf-8?B?UVR5MXNCbTZRTHI1Y21NYmlXb1lzY3M1OW1YaUlkTnkwRDZOSGxuaTU2aURT?=
 =?utf-8?B?UERzejJQUElBL3BkTlFxa2tDZmJ4L282bDkwSi9EODRyZWE0aXc3Ti90Sms2?=
 =?utf-8?B?cEhtTHZjQ29QYnJ4cjJzZ2EreUVYWndXbTU4cS9sRzNpUkFxVXZhaVVZbkZi?=
 =?utf-8?B?c0IvYjRUOTlnTUhRelNLSEYvMWhGcDBsV3RSYWIvUEZWMGprWUFZbnB6T2Ux?=
 =?utf-8?B?QStkRFlhbVl2U0tmUlRCSWwwSm5MbUZ6UlVDQ3F5YURDTW1weFZVbFhQeFdT?=
 =?utf-8?B?aTV5S0t0UjdjWW5pVVpoQ2lUZnQ1SHk4NVI5ZkJWZTVhUWpKaE95TENhaTFy?=
 =?utf-8?B?cjJzbWZvWDMzdHhTRTFac1haUUo4aFh2U1cySkZ5RDd3Q28wWTZ0N1M4cXJn?=
 =?utf-8?Q?ZnvncrMnMcbi9I8q1anhA2A=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <169ADC5EFD22C642AFFE20FAAC89D7C8@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 378a2ecc-b098-4e28-a95d-08dd6621b64d
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2025 13:35:13.4776 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TfHwlgCu2A2fjmnR0mIq9hywZQBNmbyLYIC1EU042k04jZbpjiSYXrZmFkF8196QwraDo5BPL5+Qx8fch6EuXJZ+iP7pfzL9S13+vrqqGiY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7135
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

SGkgQXJhZGh5YSENCg0KT24gU3VuLCAyMDI0LTExLTI0IGF0IDIwOjA2ICswNTMwLCBBcmFkaHlh
IEJoYXRpYSB3cm90ZToNCj4gRnJvbTogQXJhZGh5YSBCaGF0aWEgPGEtYmhhdGlhMUB0aS5jb20+
DQo+IA0KPiBUaGUgQU02MnggYW5kIEFNNjJQeCBTb0NzIGZlYXR1cmUgMiBPTERJIFRYZXMgZWFj
aCwgd2hpY2ggbWFrZXMgaXQNCj4gcG9zc2libGUgdG8gY29ubmVjdCB0aGVtIGluIGR1YWwtbGlu
ayBvciBjbG9uZWQgc2luZ2xlLWxpbmsgT0xESSBkaXNwbGF5DQo+IG1vZGVzLiBUaGUgY3VycmVu
dCBPTERJIHN1cHBvcnQgaW4gdGlkc3NfZGlzcGMuYyBjYW4gb25seSBzdXBwb3J0IGZvcg0KPiBh
IHNpbmdsZSBPTERJIFRYLCBjb25uZWN0ZWQgdG8gYSBWUCBhbmQgZG9lc24ndCByZWFsbHkgc3Vw
cG9ydA0KPiBjb25maWd1cmF0aW9uIG9mIE9MRElzIGluIHRoZSBvdGhlciBtb2Rlcy4gVGhlIGN1
cnJlbnQgT0xESSBzdXBwb3J0IGluDQo+IHRpZHNzX2Rpc3BjLmMgYWxzbyB3b3JrcyBvbiB0aGUg
cHJpbmNpcGxlIHRoYXQgdGhlIE9MREkgb3V0cHV0IGNhbiBvbmx5DQo+IGJlIHNlcnZlZCBieSBv
bmUsIGFuZCBvbmx5IG9uZSwgRFNTIHZpZGVvLXBvcnQuIFRoaXMgaXNuJ3QgdGhlIGNhc2UgaW4N
Cj4gdGhlIEFNNjJQeCBTb0MsIHdoZXJlIHRoZXJlIGFyZSAyIERTUyBjb250cm9sbGVycyBwcmVz
ZW50IHRoYXQgc2hhcmUgdGhlDQo+IE9MREkgVFhlcy4NCj4gDQo+IEhhdmluZyB0aGVpciBvd24g
ZGV2aWNldHJlZSBhbmQgdGhlaXIgb3duIGJyaWRnZSBlbnRpdHkgd2lsbCBoZWxwDQo+IHN1cHBv
cnQgdGhlIHZhcmlvdXMgZGlzcGxheSBtb2RlcyBhbmQgc2hhcmluZyBwb3NzaWJsaWxpdGllcyBv
ZiB0aGUgT0xESQ0KPiBoYXJkd2FyZS4NCj4gDQo+IEZvciBhbGwgdGhlc2UgcmVhc29ucywgYWRk
IHN1cHBvcnQgZm9yIHRoZSBPTERJIFRYZXMgYXMgRFJNIGJyaWRnZXMuDQoNCi4uLg0KDQo+ICtp
bnQgdGlkc3Nfb2xkaV9pbml0KHN0cnVjdCB0aWRzc19kZXZpY2UgKnRpZHNzKQ0KPiArew0KPiAr
CXN0cnVjdCB0aWRzc19vbGRpICpvbGRpOw0KPiArCXN0cnVjdCBkZXZpY2Vfbm9kZSAqY2hpbGQ7
DQo+ICsJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsNCj4gKwl1MzIgcGFyZW50X3ZwLCBvbGRp
X2luc3RhbmNlLCBjb21wYW5pb25faW5zdGFuY2U7DQo+ICsJZW51bSB0aWRzc19vbGRpX2xpbmtf
dHlwZSBsaW5rX3R5cGUgPSBPTERJX01PREVfVU5TVVBQT1JURUQ7DQo+ICsJc3RydWN0IGRldmlj
ZV9ub2RlICpvbGRpX3BhcmVudDsNCj4gKwlpbnQgcmV0ID0gMDsNCj4gKw0KPiArCXRpZHNzLT5u
dW1fb2xkaXMgPSAwOw0KPiArDQo+ICsJb2xkaV9wYXJlbnQgPSBvZl9nZXRfY2hpbGRfYnlfbmFt
ZSh0aWRzcy0+ZGV2LT5vZl9ub2RlLCAib2xkaS10cmFuc21pdHRlcnMiKTsNCj4gKwlpZiAoIW9s
ZGlfcGFyZW50KQ0KPiArCQkvKiBSZXR1cm4gZ3JhY2VmdWxseSAqLw0KPiArCQlyZXR1cm4gMDsN
Cj4gKw0KPiArCWZvcl9lYWNoX2NoaWxkX29mX25vZGUob2xkaV9wYXJlbnQsIGNoaWxkKSB7DQoN
CldvdWxkIGZvcl9lYWNoX2F2YWlsYWJsZV9jaGlsZF9vZl9ub2RlKCkgbWFrZSBzZW5zZSBoZXJl
IHNvIHRoYXQNCmszLWFtNjItbWFpbi5kdHNpIHdvdWxkIGhhdmUgYm90aCBwb3J0cyB3aXRoIHN0
YXR1cyA9ICJkaXNhYmxlZCIgYW5kDQp0aGUgdXNlcnMgd2lsbCBlbmFibGUgb25lIG9yIGFub3Ro
ZXI/DQoNCj4gKwkJcmV0ID0gZ2V0X3BhcmVudF9kc3NfdnAoY2hpbGQsICZwYXJlbnRfdnApOw0K
PiArCQlpZiAocmV0KSB7DQo+ICsJCQlpZiAocmV0ID09IC1FTk9ERVYpIHsNCj4gKwkJCQkvKg0K
PiArCQkJCSAqIEVOT0RFViBtZWFucyB0aGF0IHRoaXMgcGFydGljdWxhciBPTERJIG5vZGUNCj4g
KwkJCQkgKiBpcyBub3QgY29ubmVjdGVkIHdpdGggdGhlIERTUywgd2hpY2ggaXMgbm90DQo+ICsJ
CQkJICogYSBoYXJtZnVsIGNhc2UuIFRoZXJlIGNvdWxkIGJlIGFub3RoZXIgT0xESQ0KPiArCQkJ
CSAqIHdoaWNoIG1heSBzdGlsbCBiZSBjb25uZWN0ZWQuDQo+ICsJCQkJICogQ29udGludWUgdG8g
c2VhcmNoIGZvciB0aGF0Lg0KPiArCQkJCSAqLw0KPiArCQkJCXJldCA9IDA7DQo+ICsJCQkJY29u
dGludWU7DQo+ICsJCQl9DQo+ICsJCQlnb3RvIGVycl9wdXRfbm9kZTsNCj4gKwkJfQ0KDQotLSAN
CkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMuY29tDQo=
