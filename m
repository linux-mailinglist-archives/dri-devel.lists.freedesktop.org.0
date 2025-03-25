Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF1A709AF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 19:57:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE12F10E00A;
	Tue, 25 Mar 2025 18:57:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="pcXq6no5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012007.outbound.protection.outlook.com [52.101.66.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA7D10E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 18:57:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6CTAMwmVX2wX3ISprhO7FeKdxJg+jD18UM8ktH42OU3XfrsVJE9z/vrQSHhdWJrHuFWh5Q3YUBcM8/wCFnz9EHIAW2JNwKNfqVnwj4oXhE7psTAa2/65hPKcryc9eTSBXEHlMIrK7YyO2ul5UcYGBnmhMzNRx1bAJdU9+H7+0ngfCb+XFwn6Khio1Py3JCDOKgdvuYaPcZRAxxDK8w2gfMQjHcYhPL8/wqYu9SGnFZJo08WVwPmJu+NLQShWQz6yRCSo20XOtUD5X7etxDLX/Dcp8ua3kZD8YNPgheT1F4NKtUc643ggAumB8OJlB7S5JmXhtazM8ycFv13NbXaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hTf2g0aRrGlqvnWZbHF1n7uftYy5iL5pp8PIFL1WJfQ=;
 b=al+gdZHwlhhnDHF7hQ3Q5SX6eiOJW1WfTg2Hs6J4FlESHIVyLy56V8DFH+i6LuEErh0V+kh/0RF3BGtqEf1NdBLqVBVO26DdNXPeWJ2up95qjsxwNH//q3VvTLGda/zksq5XRPqz0hzoi55BXXmPZ4SwqB/nZqoy04jdLF3uhuklARr9MBWAXF7sbbz8gTW8YV/OJvZol2bdg0i+RgVrNLoo2yuJvKAMYBQXGRJmcaekFZpsnTAO1dcRKzBAroGUv9B9rKRYYy5o51+C0LJkeGapFyM12hLAOa/6l/s+YMdjBPGJ9IenzZYnI08dJunWgpX06VUYvSWqFDC6im5avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hTf2g0aRrGlqvnWZbHF1n7uftYy5iL5pp8PIFL1WJfQ=;
 b=pcXq6no53xA6vUhp2/PL992MtT95vx1Ig0KLUA4oEOVZLflrA2eJFZ0ztEfZOkcxJXOg8f93Zo9o8Fe/fM+36b6blfMtFR85sAbEm16fXB8yY66bEqw6AAPOZ2OSO1KyOoFXplZv/OD92u4TYQ7bD0H0uLYxij5CJ0wWnsoq8u9Wv36aKk6nxkUWgSrs/huWjZU9y4yQ3ig8eN8mVbfqEofSMv1X6XEKKI4+SkP9vv4j0G4fTMs81B7ond+1+lgrN6Fa3J9GI+1TTQq0W+keyiNCAUWFYpNhwOtZ/w/pg06qgZezXX4qvp0Ema3uT/EnUfazX0Cn3qg1A3JvgNT5Cg==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DU0PR10MB7945.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:31e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 18:57:14 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 18:57:14 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "aradhya.bhatia@linux.dev" <aradhya.bhatia@linux.dev>
CC: "j-choudhary@ti.com" <j-choudhary@ti.com>, "u-kumar1@ti.com"
 <u-kumar1@ti.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "devarsht@ti.com" <devarsht@ti.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nm@ti.com"
 <nm@ti.com>, "vigneshr@ti.com" <vigneshr@ti.com>, "praneeth@ti.com"
 <praneeth@ti.com>
Subject: Re: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
Thread-Topic: [PATCH v4 0/3] drm/tidss: Add OLDI bridge support
Thread-Index: AQHbPn5WIr4uDRt/y0KwBpNmDAlljrN7dJOAgAFFJICACDi8gA==
Date: Tue, 25 Mar 2025 18:57:14 +0000
Message-ID: <86d5d285a8467b3fcdadd3cf37ac0e4cbc874626.camel@siemens.com>
References: <20241124143649.686995-1-aradhya.bhatia@linux.dev>
 <8366a3d736f9937667aab024895a59e5947dd4a5.camel@siemens.com>
 <2c0b49a2-7cf3-4432-bab0-1eb110e8e8c2@linux.dev>
In-Reply-To: <2c0b49a2-7cf3-4432-bab0-1eb110e8e8c2@linux.dev>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.4 (3.52.4-2.fc40) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DU0PR10MB7945:EE_
x-ms-office365-filtering-correlation-id: 292c27c3-f873-4289-e7b1-08dd6bcedb78
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z08vemtlSXNjRDNDTjdtVUFxNDVKdXU2ek5DazRtc3JadjhnRjhTUmpjYU5y?=
 =?utf-8?B?c0xMZFEySEhqTXEwTU4xam1LRGlORkxiaEtEWmpjYzRweFc4cVhNVEpHWmdD?=
 =?utf-8?B?M2dqUWlEem1LR0ptU2t1bFkxNDBHVEw0VUtmd0JCa0RSVG9VMC90cnBLNEdr?=
 =?utf-8?B?ZDN0c1h1dGFBTmhCRFh4cXNRcitrbHFoUmowb1h3dzlyQVN1V3RWSWg2QUVL?=
 =?utf-8?B?NDJlNjFBR1p2bXd2dEF1S3NjMUxRQTU5NEF4NEZVZ1RmSmFuNWxibXdoamJ5?=
 =?utf-8?B?MDM3VndrZ2F5Nm5sa01rRFNqQm5WWkdDamtQRDhUZ0F6eDhhSFB3SlpCWTJU?=
 =?utf-8?B?SGF2Z2ZjeHVVMnVwbmcyUlhxRTNjN3B4YjRyMXR6RjVqbnA4NEVBSGpwK00y?=
 =?utf-8?B?ODdjNzVvMXZqOGlVekJIeGxOcTR5YVZ6WERsN3o0UWZIbUxHR0xuaWFuZjRs?=
 =?utf-8?B?YzVWNFArNmFUaEs5SWU0dnlOZUVORlVtTlh4WjlrSWxkZVdUR2YyT2VOY2Vi?=
 =?utf-8?B?N1NGZFNRWmtaNzVSOHZwalg2K3ZzdCtNeUNqRFJtbEUwZFhUc0ZiOXBxOWtR?=
 =?utf-8?B?ZGtKa20wb2tBTnJ0cWhIampTRzNSem5RWTlOQ1R1Y001Z2Z2eEdYdXV3UlBQ?=
 =?utf-8?B?c3V1Vmc1Y01VSldDTHk0RThkaXdiRnk5WDVtMW55RXdBUkZjYklXamRIWlpQ?=
 =?utf-8?B?eWFuVFc0QmpmYUZVSjRoRGF3VFQ4aElqc0Y0ejNNUjJXaEVtaGkrMnF2UW96?=
 =?utf-8?B?OWxXY2hWTnB5RHNPeHUzZFM2Y2M4Y3l4cEREN2NmbWd1dkIzUGRGMUswd3VS?=
 =?utf-8?B?WWNGN3V4MkxJUUt6MTlRNThPRWx2OXFUbnllaEtCM3hTQTZwN1RmZ1hnMW1r?=
 =?utf-8?B?Sml6R2pWcitiZzVZRWg5WkVNcHhPZFZ3TlFJUk5sZ3p1bWtGanI0a29NZGM0?=
 =?utf-8?B?djVMTldTYXhmS1ozUW9yUU1SaG5DSEVTamJFdEQ5ZUhuUEUvTklXZ0o2T05h?=
 =?utf-8?B?Q0xJaUJqVU5HT0p6dnY1UjdLSXppSDB0MlhUK3prS0xLbVE0aWprU20rekpP?=
 =?utf-8?B?RFloZThWRUttZGh3Lyt2N3VYL1FmNmc4YzFlMzZtZEQ3L0lWU3pmR041Y1Js?=
 =?utf-8?B?T3NsemZBM21HTW5NeDdRbzlXVmVZSXEyaUFZVVd6VUJrUTVyTTc0SzNRYW4y?=
 =?utf-8?B?TW9DZDVnT3VVU3NlbXdXenhydERsSDdORytBaUFhNWd2NnlkdXdrZHl1YldW?=
 =?utf-8?B?NWhveDdiU3lObnNPangwL25DZC9ydlJEQ2xWdW9UVHVXTnBlcytoQVAxQ1FL?=
 =?utf-8?B?V1lSbmFuUERTZnJuWGxMeXMxN2V2RmZHOExCYUUzYVo1dEdHbVMrVTJlWUR2?=
 =?utf-8?B?aWRyS21aUjFvZ2pqL1BrWkVjaUJiYUNNM3pqWURPNVhWcnJZRVZvTU93Kyti?=
 =?utf-8?B?ZlF0ak9ZMTJFWUx6V3ZSOHVCM0JkRUdzS1E2bGNXS1p6ZDFXN2lXY2JpcnR2?=
 =?utf-8?B?WDArM1F2TnN6b1JFRUtVZExuM3RWYXJ1MlZzYi9XUVdtNHdDVjB0Y1h2NkZa?=
 =?utf-8?B?RXFIWGJNVzV5akRkQmFzK2RRZ0xRcU5JbkI3STRmQTJGT1hNeFFlU2NjK3Zm?=
 =?utf-8?B?WVRxM0VrdzA4MmZTQVNDSjdzc3JrQ1FmZ1c0OU9CM3k3WTVkVnlCWThJb0pn?=
 =?utf-8?B?MkNoZ2dsNE8yOVJDL1RYaDJWaVNXYXZJZjA2dmlObk1YTlQ2ajFxQjlSTFR1?=
 =?utf-8?B?b1JtQWVRdjlicUVNOWxqWE9zbmVmWFhtNkpsMUR1V1MwQ2xEdFRMU1NqQTc4?=
 =?utf-8?B?eUZEYmU1THRLWnJvV2oxemd1RjdLYWxrOS9Nb1ZRN3h5VUg2eDlBNC9CcEdW?=
 =?utf-8?B?am5YZWE5VE4ybEZUVnFQY1lkRGhsbm5XVGJRWk53R0hab1NXUCt1Sm9PWjFQ?=
 =?utf-8?Q?RtTjCfAS9IU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bktjTGlHOGNUcHF1U2JGQjAwRlgxRWV2SlY3Sm4wdzZXR0dqdThKNTYyNlY0?=
 =?utf-8?B?NzFzTy83djJCZnc1bDJXV3d5WjBrWDZiRlI3NjUwTExqTjVIbVlQVUtvN3hI?=
 =?utf-8?B?VHAxYUtwVjBGcS9SUHpXQjNQR21BKyt4OUxmSkNKblZCa1hSQTJVa2JGM29Y?=
 =?utf-8?B?V0pHUUFva1NIK29BRjR6WHZQeTJiK3lSUjVGdDVRVHpCVmFwd1BLcENWU3Zp?=
 =?utf-8?B?TVUvMk9GbDI1UzRhcVd0a2JkbUpSQ1JOc2FEZ2JEN21GQ0FETzFsQUczZWtU?=
 =?utf-8?B?OVNwTmhUeEw5LzVacGMxRWRTVVVRU3MybnZjd2Nqa0JGVVFLM3Zwb1JHNlp0?=
 =?utf-8?B?anpLUEJ3ajNENjNZNmNBNkcvR256K2FUMTFWTG1idW12WDBzbko4c05UaHlu?=
 =?utf-8?B?TTUydCtXR3R5R3g5N3BmMGVLOVlSQktvRzJRNk1BVy9uYTV3ejdMUHhUZHNL?=
 =?utf-8?B?SXo4MGt3ZnZrNE5YRlJ2YU9wcWZmVGN3U2dzWFpOZzFPN2pzU0pOdTNvMS8z?=
 =?utf-8?B?TDZHTS81ZDY2L1hqWW9nTFYrMXhyeEluaFRibGZTZ1ovUUs2VENMSU5mMTNV?=
 =?utf-8?B?bGlXRHBEN2IwUFhEMDBOSGFyeU9mS2NTeC9zS3lnSjBNUC9JbU9rVHBoSnlW?=
 =?utf-8?B?QmR2T1VERC9BZXRNNEEyNjRFeTJ2eXBhSXpJM2psQThNM0hKVzBoWjNjYTh6?=
 =?utf-8?B?QkpJS0trQ2lyU0tCZHVXSEdPVXRmUDQ1SVp6bzU1c1QyRnVWQTNsU1EvNnIz?=
 =?utf-8?B?YjN3TE9zdFFTNDdJWVNLS3YwMTVZN1FCTnN2eVNqSGVFRkEwa083ZTlzZk5o?=
 =?utf-8?B?cHNyRmxmZ2FJb0VpcjFFTnA3VmVNYmlmb0ZjeXRJYnNNNlY4R0ozTTNvdmhG?=
 =?utf-8?B?UXBJV0UyWHlrRzRkNjhrVlh0M3h5YXJobXU0Z09RWjNNb1FlVjF0KytoQ0pL?=
 =?utf-8?B?ckFac25xSEVKd2JjUkF5akpYUTg5aTluMWlNYkpSS1VuK0xWNXE3cklyMFBj?=
 =?utf-8?B?V0dBa3NwWmw4cWJwWXpBbUZkQ2F5dG9PVU1vYmZ0WUdsVXduaEFsQ3dGek1U?=
 =?utf-8?B?a0Q0aGFBbWtlQ0lhczVHS1B3MUtTcm44dlphTnQzM1VhOGJLbTlGL082dU1j?=
 =?utf-8?B?cDAxSTh6cWs0N2pKVXhka04ranFTd1RGdUxUNnhkOXBla2FhZERDVlkrR0c1?=
 =?utf-8?B?c084N1BlSjdYbmZKM0ZCcGw2Tm42S1VpRWJucGNaUi9JUzB5MWQ4a3o3Tisz?=
 =?utf-8?B?ZVBPUHVqcThGNlEvSTJqYWFKUTBuYnUvWHlJc3hvZEVXWW82czdFRmpMbFhn?=
 =?utf-8?B?RFRzMmpnR1hFM3E3MTFYRFJST3Z5d3NBR2NWV2xTVDBTdThJUG1rdjlORGV3?=
 =?utf-8?B?L1dCVTRxT1Z4Umk3UUdhNXBLeC8wYWlXQkcyNHVRQlFyaDBXVlJLYlh4MDdo?=
 =?utf-8?B?c0RsZFlhbHNSdmFmY05XaXZ5c0JENDNIMGJQT3h4ZG5QeUt6bmx6NHcrL0xs?=
 =?utf-8?B?MlJ6R1VFY25mY2Y4WGVaNmYrSEhqRWlNeW5mVWNyNzZ5dVF2WW1kNGMwTXFS?=
 =?utf-8?B?ekdyZ05XVFZUZm1Bd0RxclZWSnIzZUFyMXZhR1FKaVhhMjNsSDgvWlZJQWtS?=
 =?utf-8?B?ck51UUhrV1kvbUhpVU1FWSsxSzVrWUJJYUE2WGRKbmc2RlNNNlJRd3NqOGY2?=
 =?utf-8?B?VnlHYm50NndMOFRFeDJzaTNYa1E3azYyMzZaOWFrT1h5bUZsUlN6ZVdmeW9u?=
 =?utf-8?B?TUJpZzdzMGcxTTBvQ2N1c1F6dEY5ZTk0eHdaQU9UalZyMzllZWdaNm8xNkQx?=
 =?utf-8?B?b2xYcWxLNFY0WHdTcEwxazNBcWV6MW8ydXZiKytBRERHV0dNa0tQamZwKzJZ?=
 =?utf-8?B?WFduSWZXc1JIcXBhY2ZibGczN3UreHV4S1NxK0V3QWUyV3hYQ3NxQW9HZkRx?=
 =?utf-8?B?bE1EQm85R1VTZU5BZk9ZZTlhWlprdlRmcm4wTnlJZFY3Y0l4YlRpdlJaaHpR?=
 =?utf-8?B?b2tIbitWN0lwMVBSb1hXOC9QbnFUTEJuRmY2UHhBWHVBaUdTTTl5ZXlpMGlS?=
 =?utf-8?B?TE9pUTJsclpDeWdldXZnenZuaUU5TFVreE1vaU52dS92bnJ1T1VST0dZeS9h?=
 =?utf-8?B?YWIwRTRaTlNzQnYzOVN1NElwL25zU01TVlcwRHJ5RTJNRUZ5QkE2QkFqOGxX?=
 =?utf-8?Q?eG5A6fwC6AUD5OVBRqUd+24=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C1C6E004F85F6D46A6038C7CDE063B1A@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 292c27c3-f873-4289-e7b1-08dd6bcedb78
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 18:57:14.5774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UXF7ui2Es0YcqHqaiPEbZGd1N/kk3MKaw82DMx859YCY4WMZBfyRxJEpvkPrb5G7EYLmWBgsrkX62Ln9R1TeTa5Y1mLLPaCs+BcgyBoLvD8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7945
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

SGkgQXJhZGh5YSENCg0KT24gVGh1LCAyMDI1LTAzLTIwIGF0IDE4OjU0ICswNTMwLCBBcmFkaHlh
IEJoYXRpYSB3cm90ZToNCj4gPiBJJ3ZlIHRyaWVkIHRvIHRlc3QgdGhlIHBhdGNoc2V0IHdpdGgg
bmVjZXNzYXJ5IHByZS1yZXF1aXNpdGVzIGFuZCBEVCBhZGRpdGlvbnMNCj4gPiB3aXRoIGEgc2lu
Z2xlIGNoYW5uZWwgTFZEUyBwYW5uZWwgYW5kIHdoaWxlIEknbSBub3Qgc3VjY2Vzc2Z1bCB5ZXQs
IEkndmUgYWxzbyBub3RpY2VkDQo+ID4gdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiA+IA0KPiA+
IHRpZHNzIDMwMjAwMDAwLmRzczogdnAwOiBDbG9jayByYXRlIDI0Mjg1NzE0IGRpZmZlcnMgb3Zl
ciA1JSBmcm9tIHJlcXVlc3RlZCAzNzAwMDAwMA0KDQouLi4NCg0KPiBXaGlsZSB5b3UgaGF2ZSBt
ZW50aW9uZWQgdGhhdCB5b3UgZGlkIGFkZCB0aGUgcHJlcmVxdWlzaXRlcywgY291bGQgeW91DQo+
IGNvbmZpcm0gdGhhdCB5b3UgYXBwbGllZCB0aGUgKG5vdyBvbGRlcikgZGVwZW5kZW5jeSBwYXRj
aCBtZW50aW9uZWQgaW4NCj4gdGhlIHY0IGNvdmVyLWxldHRlclsxXT8NCj4gSWRlYWxseSwgeW91
IHNob3VsZCBub3Qgb2JzZXJ2ZSB0aGVzZSBjb25jZXJucyBpZiBbMV0gd2VyZSBzdWNjZXNzZnVs
bHkNCj4gYXBwbGllZC4NCj4gDQo+IE1vcmUgaW1wb3J0YW50bHksIGlmIHlvdSBhcmUgYWxyZWFk
eSBvbiBsYXRlc3QgbGludXgtbmV4dCwgSSB3b3VsZA0KPiByZXF1ZXN0IHlvdSB0byB1c2UgdjYg
b2YgdGhpcyBPTERJIHNlcmllc1syXSwgYWxvbmcgd2l0aCB0aGUgbGF0ZXN0DQo+IGRlcGVuZGVu
Y3kgcGF0Y2hlc1swXSwgYXMgdGhlIG9sZGVyIGRlcGVuZGVuY3kgcGF0Y2ggaXMgc2ltcGx5IG5v
dA0KPiBhcHBsaWNhYmxlIG9uIGxhdGVzdCBrZXJuZWwgYW55bW9yZSEgPSkNCg0KVGhhbmtzIGZv
ciBhbGwgdGhlIGhpbnRzIGFuZCBsaW5rcyEgSSBjYW4gY29uZmlybSB0aGF0IHdpdGggbGludXgt
bmV4dCBhbmQgdGhpcw0KdGltZSBhbGwgdGhlIG5lY2Vzc2FyeSBkZXBlbmRlbmNpZXMgYXBwbGll
ZCwgSSBkb24ndCBzZWUgdGhlIGFib3ZlIHdhcm5pbmcuDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJk
bGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
