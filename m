Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 261EC98571B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 12:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B8810E311;
	Wed, 25 Sep 2024 10:22:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="seIHHQDC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060.outbound.protection.outlook.com [40.107.236.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D44ED10E311
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 10:22:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wr2+zLjkrgCvrEJxhaKKpuBs3ckhmHiuRy164aSMmIGQu47bkZEXJktw52xjxFjT22WFWlzJb010dPuhg3o5YuxjtG44LUdF9PtCBl8LMQqenBaVZ7YnQhv17RWFrYTjecBj86Ba1boQdXWEkB6ODWvQJwPhLVevMFbPvS2QzmiU/YP0GzD49AG76FxeoSmX5/2FqcX5FJBG7+sq7s0QPoC3DFIwfHrh3IkBxtBxbNqOT2g6Vjpb17Zu7+aJHa3sKjjkOdyXApX6MsSzFPwXkpRompdzpJIXMnpy05hfWgGReN0yEb6aPlC6oPQOJoxnbErax1iFGA3AfXM3G1reYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HclaBHloo4M7zF7t5/eEjgF3O9fJKdSsbWxCFC6kaWI=;
 b=TW7Jbt5Uvd9snbL3OXwH6B4clHlyywP9dmjbypRRwt+9mE5r0gS5xMDpnsxpGXSyU0beQpwiBv/4wRKKFCFn4rDzo1lB+DBVZS76ZOoZX8m8dGcacpAWs7CAb3/zkzUkn2xoxJAanCH6Hf7sqIcEAVKBZTBBWk8jFVgmL77HHdnnzOP6roPcI7a1Ye8pr+8B4HjYPfFTpkTiHkuaIaEEmjTJyxEVBEC6UbqzHW7kM5y9Ekx9xdfz6Yy9xwCizzS6Olv5EEsaGxpTNk2Q3KLvDEITvKKvgQOrpQ8LtpdI8o6n2TSnfVoMa7lY2FsYxoUl7nhRf4VDNF/ouvybHdoG4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HclaBHloo4M7zF7t5/eEjgF3O9fJKdSsbWxCFC6kaWI=;
 b=seIHHQDC0ruSvo+wOLqJxj/8G5jdJKonSy4dv3RbpztXIT8X1/2zRe4CnncPIK3DypX5K7fHUf3XB+o/+Vx7fE6fa76grOxrPiPYapMHgfftExjSQMfDlT+KTJTu8XeNJ5B8komVHf3mVnafwp7CrUzJhs2M1IWWHQyW53O6CgjAN63xXfsU5aUQvS/4lxSGEw2VhClVQ1nClhJYPKMLCRaDwJwm55Dh4d/q/5nj9cNhixtc50i03NNa8qzFBSsbTl8rugH9ZtHL35MNg+fzJkGDOTO29aeI1gXjK3ZTyBzx6CI39YNw8aWWHN90zLqL7ahSXlemG4Nr60Wh2Mj7Lw==
Received: from DM6PR11MB4185.namprd11.prod.outlook.com (2603:10b6:5:195::29)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Wed, 25 Sep
 2024 10:22:31 +0000
Received: from DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30]) by DM6PR11MB4185.namprd11.prod.outlook.com
 ([fe80::1692:c829:d50b:8c30%6]) with mapi id 15.20.7982.022; Wed, 25 Sep 2024
 10:22:30 +0000
From: <Hari.PrasathGE@microchip.com>
To: <sam@ravnborg.org>, <Manikandan.M@microchip.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Dharma.B@microchip.com>, <bbrezillon@kernel.org>,
 <Nicolas.Ferre@microchip.com>
Subject: Re: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Thread-Topic: [PATCH] MAINTAINERS: update Microchip's Atmel-HLCDC driver
 maintainers
Thread-Index: AQHawvhvIbhov8wm/0awRqv13ExOkLHQ4VeAgJgCXoA=
Date: Wed, 25 Sep 2024 10:22:29 +0000
Message-ID: <11392b3d-a663-42a1-b4cc-ec96e927ef55@microchip.com>
References: <20240620095856.777390-1-manikandan.m@microchip.com>
 <20240620170233.GA1091389@ravnborg.org>
In-Reply-To: <20240620170233.GA1091389@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4185:EE_|SJ0PR11MB6696:EE_
x-ms-office365-filtering-correlation-id: 2b053615-e1f1-4b71-88fa-08dcdd4bf5ec
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB4185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?RHVWS2IxMUx5MDdvZFJZR3lPTi9CWGZPOUdNQS9HazEzRXVNRUVhUG1zTGRY?=
 =?utf-8?B?UTM3Ni9aTi9xUDFka1F0em1Jd2JGbXVJeVhpQm1GTGlPbzVEL3IyRzhlb3Rz?=
 =?utf-8?B?WElockw0aml2SFg2OG1vd0VCVUhudEpmM1RvT3JtcnVTbkE1QzEvRzBuNTB4?=
 =?utf-8?B?UmVCVjUzYk5JTGxZQUtGOFZhYlRnSTFRQ1RlYWtlYUZ5d2F4MS9qbkZXV3Bo?=
 =?utf-8?B?N29lTFU2bU94blAzdk5JSjk2VFFZVkNQYkJWRCtkZnZzckU4MEFoZVFoZUNC?=
 =?utf-8?B?Vk9kb1BHamNXK1R4STBLbW84djBheW1QSkpaMjVXNFRSTkdmL1V4NkViNTg3?=
 =?utf-8?B?bUU5WnYrK0hGaWJ0M1E0TkJqSnNYZGovRUFVNUVrTmFleXVRc0RxRFJzR2ZR?=
 =?utf-8?B?eFlXT3hXVFBIdGxwRlVPT0lNdlNzZ3RFNWtGdFV1Q1llcHZkM1JCZ0hXOURT?=
 =?utf-8?B?MWlUcEVRWHlhTjRXUG9zUTZjZnVJWmxsSHMwVnYwMjZkVjgzY3cxejRuZnFp?=
 =?utf-8?B?NjBIZlNmWWNaTmhaQnlvYTVlZWtneUxmVGc1dHc4ZWVGcmlzUHBFaHRYM09r?=
 =?utf-8?B?Mjdha3BDQXpTUlhGRWJuQ05zbGh1Z2RqVGw2VXlBRWZzT0dBSDhtSUh4aDFa?=
 =?utf-8?B?eFdWTHEwM1Rnby9tY2xwNTR2bklkMWR2Rkw0M1d2dFBGZ0tsSHZEVkN2SGk5?=
 =?utf-8?B?d3luM2hlenFsSjJVUVM5MEJnK25FL2kyTzdSYWpEWDNwUzVKTThGWXAzYUR3?=
 =?utf-8?B?ZHFNdldkalBvTHZpUTVUdjdxOHA1TGdJdDRQTmlhVmNTMWN2UGh4ZDBYaHVK?=
 =?utf-8?B?aFdhbHF1UmNtOVBMZG5MSytITWhnTjdaeS9HWU1SYUlzeERiTjQ5ZXlTTFln?=
 =?utf-8?B?SnIyUzU5dDNhcVFTN3FEMEdBZmNOSjVDSDR3M2tnek5PNFB6RnpDRk94Sk5n?=
 =?utf-8?B?d3B0QmJ3cDZaN1c0cS8ySTZOWDJsNjR6RGhzbzQrcHUyQm1WM2xxSjN6eVRn?=
 =?utf-8?B?RUlHam53YTZ3TC91dVBPSnFXbGhtUW1neWRnd01qNHN5ckMzY0pzWjdOQlRC?=
 =?utf-8?B?dURHYlQ3VWVJa3VEaDdMNmE1Q3YrbjZLMmhXbHY5cmdOOFdiNUZGeHk1RWdu?=
 =?utf-8?B?Q056K1FIdi9tNElsNWx6WCs4N0ZUaTlsaW1oeC80QlAvMW1pbWdEZDZNNk1J?=
 =?utf-8?B?TFJOMUkxWnp5cmthRXdjN3BiWW0yc3huTUN3ay9BdG9MVVVVYmpJekp3b3hN?=
 =?utf-8?B?S1FvcG9yOS9HcDcyRU1Da1VmWEg1ZW9wZk9OVjMzUlBKUHlJdENjWTVZZHdB?=
 =?utf-8?B?MmluMG1kVlZzUS9RVmJJS2FLbkdCVjZhUll3TC9jL216cFdGU1lCd0p1MWxy?=
 =?utf-8?B?amhPTmR3ZEhTWEptMG10VEZzUGYxS0dyMUZoRlN2azBHSVl2ZGRSendEblRx?=
 =?utf-8?B?UEN6QUw2NFpGSWNqOUhVbjMxR1VSK2ZseXF5clQ4RWFjWUVPZnhZcTNGRS9m?=
 =?utf-8?B?MmtJQWRlQUdVMm5tWjFSVTNwOG1yMWVpZjArcE04bmpYdHVIUmtULzhxc1hO?=
 =?utf-8?B?L2cvejZtaUxCazdWNk1XWHNhRUs3YUhESWRodWpndlAzVVBaQk1uUnl0akYz?=
 =?utf-8?B?R2FjOWlQclNuSFZWUWxkS2NSNjN6MkZDZE5CcGJVNGpHMCs0WGVEbTFvOWg1?=
 =?utf-8?B?QVplTEhEakowM2FobERJaEJKekRydnVRVXJ1eXR6U1JaTFRKUnd5YUVWZnln?=
 =?utf-8?B?RmpBZnZPM2xxd3VsTnlLeERRcFV3SEZkWExjTkVQQ2JVaG1qd3JpQ0NKY0ZU?=
 =?utf-8?B?R0FwL1I2dC94SEpvd1pmUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?d2tydHd6SkJwc3ljcVRFdlFwcmVmWUdzQWpuV1NoSEdtb0Y0QnpyaTBQRDkr?=
 =?utf-8?B?NTlXSmJmL0xCbUxCM2pYeUw2V3g0R2FxOWI0Z1hEYU1QQ0s5Ykhqdk5saFpx?=
 =?utf-8?B?UmhBZTQwMlhCcTdWTDNGOUNDUlQxZ0ltcVF5ajdEY1E1RXdQSGFLUm5YbmtT?=
 =?utf-8?B?M1BndlI2cWdXVkYyN1lrRXdkZitFMnI0d1BHeWRhc2pDRTkvTnVkK3Z1MFhR?=
 =?utf-8?B?b0FRWFFKZi9mVmkzYklCeHUvQW5qQ0ljeFBlNEhBTmpSejhFTHlqd01VTEdS?=
 =?utf-8?B?YmF1WFQwUU1oNHNNTmM2ZGFyQ2xteU5DNmIzNHVHeGpSRS96UVhEejIzVzhk?=
 =?utf-8?B?RmhRUTZtZWZrTmw3MEZlMTJDbVN3SmIyUTNvTUVPS2Q5RCt5TVRuV0haSmdT?=
 =?utf-8?B?SHFjNUlQQ2JOK2lVallwbzIyclVWS05XY3lPNnovaks0VGJrTy9YSFhpcmhn?=
 =?utf-8?B?NjhsRzg5QzJoUC9LV29lbWhKYVpHUjVlam9WaFFjRzhIMC9JdlRXOFlabFBi?=
 =?utf-8?B?WTJjUXZMOU91SnBmZmcrcVdPdlV1ZUI1ZHpudXVjQTVXd3pIUWxrQklWcFJW?=
 =?utf-8?B?RkUzeUZGVngwZkMyREI0QUVmd2t3cUxkRERCcGsveUYvV1F2TyszaUc5NG5u?=
 =?utf-8?B?cnF4M2xGa2xXdEE3eWZ4OFMzMEJYY2dxdTh1TGVERzdwVituRWFkbVQrekVl?=
 =?utf-8?B?WW9FZ3hITlYwVkpCcWM4Zjg1bXNaK3VnOFJoK1Q4M2MxVzBBSWtOZGFrR3ZX?=
 =?utf-8?B?RkxDWEM5aHh5aDl5QTlZUTFBTTBiL0UyRTh2Yzd4eFFjUGFUeGVkdWcvZVl0?=
 =?utf-8?B?ZUM5WFFzVThtSXdRcWpCVWtERjhRUG12TEsvaEJjMzQ1TW1PZ1o0bzJOWGRl?=
 =?utf-8?B?T25IYi8zVzhEK1g5VVBkOXNVbTFmcUIzWGYvekg5N1FpMWY4b3JERzJ6YmZX?=
 =?utf-8?B?eUJZbFVib3NMMFZ5SmMwMWppSGN4dVVmSWZrUEx4U1ZNdTExQ3BlMElUelRC?=
 =?utf-8?B?NE53L2pWenQrWFkrRHlGZGpsQlg2OEczSVQ3K3o3NVI1MG00TVRlTWV3RFhr?=
 =?utf-8?B?Y1EzNXlEbXNxQ1M1YVhuNUV3MktiSWZoQ1phMnJpakQrMDlCQzJKK2wyQWdM?=
 =?utf-8?B?NzlDdlhLS3prY2g2d2xwWDEyK2dhcDRyV3pweHg3aUYxMWJNcFQ4SFlTUWxU?=
 =?utf-8?B?OWxLMWFyTkZUck8zdmY1d2wyK2pmTk1VWEtHYVBob3EvRkEySUx1SFY3MEVD?=
 =?utf-8?B?R0tJdVNVTlBjWlhSSm1iVzZHZ1grVVNzUHk4eXdoSU5TUzF6emVhS2k0cGpG?=
 =?utf-8?B?ZkdWQnJPYnhnSnlHOVI1dWpBNVN5S3ZWZC9Ua1BIOUR4UjNIYU5lazg3Z2FN?=
 =?utf-8?B?dWFDS2xRSE9QM1o5RWNNVnQwUk5JTUVZK0V4YjJjQ2hvNVNOQ0Z5Mm16TEZZ?=
 =?utf-8?B?YkhoRWExeDQ5dkdPTzJLNmtxNXRYeFZWM1J0UmorUEZoYnZaN2cveHFXUWN3?=
 =?utf-8?B?aTlsaUVQVHBQajZDbVRSUEw5SU8rbGl6dkxGNnIrRFY5TG5LVlYwRXJWV0Zy?=
 =?utf-8?B?aWJNQlVDTmFSU0xqNHlRTkVLcXR4WWd4c01XUXlidEo0ZzJ4Y2t2ZXZxdEt3?=
 =?utf-8?B?cUQvQUY4Mk5vK1lvam1TRFNpVGdTVFhoK1RVSXBwT3ZwN1lsSTBiVGpFTlJW?=
 =?utf-8?B?eFFRcWV0dVN0VjRuekRiNU1TSVRGYmtOazdmNm9INUNSWHlnRmI4ZFV4a0I0?=
 =?utf-8?B?TTZaSXhDNDR4WDJTVUZOUk5Mb1lNR3Ewa2owdjRmWEZ0aHQ3V00rOEFESXB2?=
 =?utf-8?B?bWdXSk5HcHF1YkF2eTZILy9zeUczcGNldWZDTHhtaWdNaW9SNnB5QkhYNXN1?=
 =?utf-8?B?QTNNRDU1dzZPZ1BZcTQ5aWN2YjFQSWNhb0Z2MHlKVzd1UzJaWHFPeCt4VGtV?=
 =?utf-8?B?Vkdqa2FXZHJRcHhGQVFvY3YxN2hjazdBOGpIR0o4Y3kxYkxJVWNKNTZiL3Fq?=
 =?utf-8?B?TjRYemJkNEltVVdBdnFWUVY5N0dFTkJ4eEJKUW1uVEc1NXVnVVhTWDU0OS9G?=
 =?utf-8?B?R3M0bVJMVk9YeFNZWjRBTGVMcXFCUlJMNXNPSGtsY1RPQnZpUHRJelE4M3RQ?=
 =?utf-8?B?VnMwUGpZOVcxcVp6MHczcWNVQ0J5SU56QjBOSFhKOHd2U3plYVZBcnBRSzRB?=
 =?utf-8?B?Wmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <8746E0AB3AF00C45B08389496BEA7274@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b053615-e1f1-4b71-88fa-08dcdd4bf5ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2024 10:22:29.7410 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lx17ElSzFIOYjR1dd8/FYmAeiH+bumjKHUZhiHsmOqnb+wgcMGwFs/0qdJuOAjDdooflzkF+FkZKwIv/q55wE3cQZKYYw4eNEV319VpDUns=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
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

DQoNCk9uIDYvMjAvMjQgMTA6MzIgUE0sIFNhbSBSYXZuYm9yZyB3cm90ZToNCj4gRVhURVJOQUwg
RU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Ug
a25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBIaSBNYW5pa2FuZGFuIGFuZCBEaGFybWEu
DQo+IA0KPiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAwMzoyODo1NlBNICswNTMwLCBNYW5pa2Fu
ZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+IERyb3AgU2FtIFJhdm5ib3JnIGFuZCBCb3JpcyBC
cmV6aWxsb24gYXMgdGhleSBhcmUgbm8gbG9uZ2VyIGludGVyZXN0ZWQgaW4NCj4+IG1haW50YWlu
aW5nIHRoZSBkcml2ZXJzLiBBZGQgbXlzZWxmIGFuZCBEaGFybWEgQmFsYXN1YmlyYW1hbmkgYXMg
dGhlDQo+PiBNYWludGFpbmVyIGFuZCBjby1tYWludGFpbmVyIGZvciBNaWNyb2NoaXAncyBBdG1l
bC1ITENEQyBkcml2ZXIuDQo+PiBUaGFua3MgZm9yIHRoZWlyIHdvcmsuDQo+IA0KPiBHbGFkIHlv
dSBhcmUgcGlja2luZyB1cCB0aGUgYmFsbCwgZ29vZCBsdWNrIGFuZCBoYXBweSBoYWNraW5nIQ0K
PiBBY2tlZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiANCj4gVW5sZXNz
IHlvdSBiZWF0IG1lIHRvIGl0IEkgd2lsbCBnZXQgdGhlIHBhdGNoIGFwcGxpZWQgaW4gYSBmZXcg
ZGF5cy4NCg0KR2VudGxlIHBpbmcuIFRoYW5rcyBTYW0uDQoNCi1IYXJpDQoNCj4gDQo+ICAgICAg
ICAgIFNhbQ0KPiANCj4gDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlk
aGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiAgIE1BSU5UQUlO
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
Pj4gLS0NCj4+IDIuMjUuMQ0K
