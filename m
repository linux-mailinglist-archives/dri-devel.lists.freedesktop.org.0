Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCF89922EA
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 05:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC5110E1CB;
	Mon,  7 Oct 2024 03:13:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="TyXeK5Ge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5410E029
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 03:13:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uyF6/ATWGqTHjZo5DqgNKFXqbtneclAIqsUdDOvj3shpyswnx8hQ3F7Ah9/HF/xGx5GkPU+0/KS7EIyJGBwyarKIVtsvhz/Zm64uGuJ+Mb3v29OgUEUcdX75UlqQJn+xcULhnBKz21zqlFiYoUiXqmV8KJ10xl2y/rb/3b0LDXEJdI9gIsRhI0hvSSLkeqlzVBCqPtGdx3fMaYn2gqtw1V+q+W/wuRnJwPSXWRSavy0rcHRS9Sv/1BsqljdMOhTSfAo7EqNFVFnsGCtQk2BVXLNMAvf5hoGfVUTg6zHmBEch0gevUL6vl36v9GRUkWecwj2Y941JOuAtPBcMfYeD8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qlocqdsG1nzGMc90wUo8Bm8wftaBJTEFUJTdzOZp0c=;
 b=Mb/RBaNn9+VQMaicE7r10/pbxQC/y4sSw51StGoVQdiTpgWfo7gDIgva7J9erHBXFlIEnGMcDFDkFxozAnbnrNhGUXENU+lQzs3TNDhGo3n5/pSmUODthOdC5JpTw0++pbHtAJdcEDKPs6HpnuH/o3Fh3NuC0ZcfPGrqWms+6ZbPFPu8O9oJRg5wOGcCdtVenwqPh1kq1/0OHcFuiyGcXBsDWodaLUlb7+iqIGEmBckbnuDFB7HjbmmlfAKkjQkl+XDCdeps/1m4ZUWWHaPUd4NRfH7RBjZ/fWtRpuEgUqlo8fXKOi8m8YpfCKDd2bNOer25kvYppkjFzbdI/AN9QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3qlocqdsG1nzGMc90wUo8Bm8wftaBJTEFUJTdzOZp0c=;
 b=TyXeK5GeneYzC87Bd0c9h9azmL++7I8WBlSHV99cmnqr6b++6lmhRRl0ZBBTL7O5iIrv7/Fy1WHR8qrcQS6lUwGRBeUSmM3N8zPGjh1flzLgs6Co8DXaPJPEu2R5qITyD1f3lzBBCI8KqZMAR0feGKqtCv34nRrk+fWbLDSAlc7QkYjVdUSu90KF4+MAwBPL77KPS96mGZXNcXFRt2uRsm91bCcyv5rk3ramaeObmAzaK6zmVrTUbSSlvQIsMjudAPOXB6wpKznbESiiqlIpp9/DmYuf1VIf1bB+Y8Q2H4D40RQS94cYbLyaqKentA7rwHFLsV6zMNKvuwB8omo78w==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by SA2PR11MB4937.namprd11.prod.outlook.com (2603:10b6:806:118::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 03:13:51 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 03:13:51 +0000
From: <Manikandan.M@microchip.com>
To: <skhan@linuxfoundation.org>, <advaitdhamorikar@gmail.com>,
 <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <anupnewsmail@gmail.com>
Subject: Re: [PATCH] drm/atmel_hlcdc: Fix uninitialized variable
Thread-Topic: [PATCH] drm/atmel_hlcdc: Fix uninitialized variable
Thread-Index: AQHbFm9kY3CVipL9f0ysiCfsNP6tZ7J29ZcAgAOrZYA=
Date: Mon, 7 Oct 2024 03:13:50 +0000
Message-ID: <0c7d1063-963a-418e-a6e9-8482f0f7cfd0@microchip.com>
References: <20241004150849.70883-1-advaitdhamorikar@gmail.com>
 <532edd71-93c3-4d90-ac98-9763993807fa@linuxfoundation.org>
In-Reply-To: <532edd71-93c3-4d90-ac98-9763993807fa@linuxfoundation.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|SA2PR11MB4937:EE_
x-ms-office365-filtering-correlation-id: fcd47412-8449-4396-7017-08dce67e1141
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(921020)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|921020|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?WC9YaHRNZUtxeWpxN2Q2MFdEbEFpNHVlZzBRUWtBTVBlNnpsd3QvS2RpZXNn?=
 =?utf-8?B?UlRsbFB0SCsySVZCTkx2bEFqMXhzYldvR1RWVXc3NzRsRHpkRFFRaTFNcXBD?=
 =?utf-8?B?Ymh2cVc5ci9WYTVyS05LbE1GY1E1cW5sb0RHY2h3RGdqQkwxQzJ1L002d3Zu?=
 =?utf-8?B?NE95dHdTZFNQWDZjUzlTMi8xUXNFMjB4STROYzJIMlBZSXJtWlFoTk9GUW45?=
 =?utf-8?B?MnpITk5TNXBrb2JmSHRsYTVrM0tkd3hkYVJ4eGQ0Vld0M0RaemVVR3drSlBj?=
 =?utf-8?B?dnVtOUJNellPL2FnNnRCalF5bnl5Wkg5RzltcWF1NWRLcHFqYzZNODdHcGpK?=
 =?utf-8?B?OEFEeWZTR2ttSmlCYlVoRC9ObHh4Qm5EVGI2bDdWbzdpUXNwZHpqQk0zWTVp?=
 =?utf-8?B?WGRORWV0TkF0MVRLcFM3MkltMUZFNjYyOThQbTFQVHFpMWpnZnBxU3dpRitF?=
 =?utf-8?B?Vmk4Z2RsSVBQMjBTcXBzZCtsWURPanVOYTJxb2IrVWU2V0s3K0R2ditUVTY1?=
 =?utf-8?B?em9ubXI4ZVdYQXJOa1dkRnJpVmd1V1pvYXFueG5BcnVuTjY0MTZNVmRIVml4?=
 =?utf-8?B?TE1GZGRhTGNsRXpKUE9SUnkyTW9SRjg3QTZUdzhBMmJHdkxxN2wvbGpLakg3?=
 =?utf-8?B?VUsvK1BTNFBUeUhVdGFjNUZvL1UrL3B1dTFSRG9xNHEyVUxwV3BxK3FIQTZj?=
 =?utf-8?B?N3FNc0t0S3RGeFF2ekhsbXNMSlA4R0d0QmxkcHVxdTVybkpSTWFjL2ZoZWhU?=
 =?utf-8?B?eWpOVG93b0JHdC9GaVR4N05QSVFYMGt3cmxicjZEOWxPU3owWElzaWhHajEv?=
 =?utf-8?B?aGpKK3JoZjBEUTZKMU9RYkxRVzlXQzlXeElJT21uQ295Q1U5VUIvTnFkN0R4?=
 =?utf-8?B?Vit4YVhxTEVoOWpCVkRyL1BzdFFSaEluZTQyQUdyWFAxYWxncDFtNSs1R0V4?=
 =?utf-8?B?Z0tZczEzZ1lPWTlGK3l6c3UwZjdTWEtkdStSNURBc0Rwd29sQlIwSWJteW04?=
 =?utf-8?B?U0VmT21PdTRRWVJLdmFodWlFdGFNekhMTlZWd1FadDNreW1Pd1Q4VDBjdjR5?=
 =?utf-8?B?TzFGRi92WUZ4MWdIQm0zdlRTU3dvOThRT1lOVStYOUZlZk1JcS9Tb3EzMlgz?=
 =?utf-8?B?NDlQSjErREF4NUdKNEg0bVp5dnM3MFRtRTk1RW1qUnk3SHVOeEJ5d1hyRDRt?=
 =?utf-8?B?cFo2d2c2OE5ZdjVQQ3VZV2UxUTJreTd6MUpOTGFNcVJZK0Z1RktLTi9GNXRB?=
 =?utf-8?B?aEFraUpRanFJNGNIbmVWVXB5QS8yRXZWMXRlNFJyVFd6dzBOK3EyK0VSWS8y?=
 =?utf-8?B?anhBeU1KV0dNL1lzYWU2U1JTbUFmOTB5SU8vQjhzaTVFeXFHbmlPOWJacXJ1?=
 =?utf-8?B?VU5PVEdtUjFaTGFmd0M4UVRiWENBcTFLWGJiSmJSQXYrSDlPQVJWYWpLZlpX?=
 =?utf-8?B?VjAvMUVMeXdQRGh0WjZXaVpaaHlOak8yUVNOd3Z6aU9MTkV3UGJEMUUzQjVB?=
 =?utf-8?B?NkNqR1pyQ2FPYW14V1hBK2RxMFdZRVg4WFFyelAvclNzVHB0MlFjVDJneW95?=
 =?utf-8?B?K0lSS0pRT0dQaEkvNEVVMDJTNW1NWGlZMjNVL0xQbHJqUFVFdGZlVGRTS1Yz?=
 =?utf-8?B?ZDdxZnpIUG1pcDVmSG5IVEZMcTlESGV5RFVhVnpSOTRLT1hXRzZ4OGxydHdn?=
 =?utf-8?B?WjFsRm9oRHVZbUhyTnpuQ0YxbDZURW9ydU42R05SVG42S1pYOXM4S1p2RklH?=
 =?utf-8?B?RU9Yb2NLS214RVRhSUhsOElvazRRMTB3N3JEQnFMZTVYNFUxbkV3V3dWMGht?=
 =?utf-8?Q?BCMWwbHN1InTSlS6JY6ORLT6O/MDF2Bj6A0rw=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emZYNkhsSFJVMm9BVi9vM1RzaWRNbHZjaDlLekVvcVBMVlB0LzFoaXdSUjF3?=
 =?utf-8?B?VkI0U3dwOVNyRkVTRHVpMlM1amJpNGNCMkQyL3JoOFVpY2hnMktXVjFidVJK?=
 =?utf-8?B?WG1LdHJsQ2dQUDRIWUMzSkhhQksyK2s0L3dRZk5ncmpyTGxzTHV0dzBtdGZU?=
 =?utf-8?B?dDlZQlE5L0FwZEJobC9Kc1IrOHVhL1pyVmNiT1ZGTTdYZDJUdUhKZXhNU3cr?=
 =?utf-8?B?VHpuU0FJZk8rNlFkR2RpVnZLeXlkNzVzT0tUcE1sNFU4d2xwWEtvamI0Zy96?=
 =?utf-8?B?Y2VaZjZjeG1Qam5QeGU5Snc3bWtuMWJ6QVF4SkV3d1AyRHYzNEVWZ2VNaGlP?=
 =?utf-8?B?RzJKVExmRW8rVFhqYW16bzlFSGxtbURiME5kV1B2RElLRGt3dS9QSEhRUmdu?=
 =?utf-8?B?dTRjaXF2cGdJaGlhVUc5SXZiU3lOR2FNOXNGTkRnVWlOQlpGcHI5aDk4Y2hs?=
 =?utf-8?B?WGpzVXE3d3FVb2xLMlZjWlgxdm4waXBCOHZaMGJlY3A3aERCcmQ5eHo0dXA2?=
 =?utf-8?B?cFUrYlVYZ1gzNENuU2JUVUEzdVoyamZJdWd2aWU4Z2NkbUNNQmFPdkRteFh1?=
 =?utf-8?B?ZTZTN0wxbTFyTzJ5ak1CeDJFR3ZWRkE0ZDl3c1AxSWwrM1MwWm93dlB4d21i?=
 =?utf-8?B?Zkp6aGV5TGxTZndmNy9CbWpWTUdGVkxhWXUwOTR4cjBCS0RRa3c4R2JjZjU4?=
 =?utf-8?B?Zng4NjlXd214NGFUb3pDMittM0RVNm4zaUY3S3duekRjZzFCb0hENkVjMVZo?=
 =?utf-8?B?L05wNjBMSER2RGRKeUJlUzdPNDNrVkZBWXF5Q2VHcEFPVjdHVVBBb0JvQ1o2?=
 =?utf-8?B?dlVCaUZLa04vSzhtTHJtMENEYWk4Zy9BSUl1WVJTaFp5cElwVWxDRUNKa0R1?=
 =?utf-8?B?RWl2RXUxWjFzbHprYjlpLzFQZHYvREQyLzBITlBHMDROS0w2a2Rod2NIZ0s2?=
 =?utf-8?B?cFNFWUx5ZVYzb2UrbnNHaWdOV0NFcVNSSDR1M1RlUHlvNTZ2UVRoVVVNMDl5?=
 =?utf-8?B?OS92L29CNDN4UzBhRWFtNHFrS0gyUEtBWWRXbGhheXZ0YWcyeWRia09BQTZW?=
 =?utf-8?B?TWFYU08wMDZ3WmpPSU9zQzIzVGkwK2ZxNVN5dlJ1SVB4UXE1QkNaWThjanZu?=
 =?utf-8?B?N1NWK3BOcHNoN2RDQ29sQmpHK0NxVnhuY1B2dUFtNUR4eVFxVVM2ZGllMllm?=
 =?utf-8?B?RHhXOXBDN2dYY1RIUmpSUWdGTmcrTW9JWWZEQWlWUDVqWUFtUGpPNjNHYzA1?=
 =?utf-8?B?c05CYnkwNzE3YU1vWWVkd0xydDhKZkI4eEZzVVdZWmJMY0wzckxET3U0Ukpv?=
 =?utf-8?B?RDYvOWhDRFhrRW9kenU0bVh0WFFJaStmRmtTWTFHdS9rQ3dKQi9KazZYT3cv?=
 =?utf-8?B?aVpEVFBaT24xaTVCRVhzbnVvUGZzNWZUSEdDdXYrc0ZqTDZqalBYSXVsOVNj?=
 =?utf-8?B?blp3a1RPcEJWMTF6Y1pqRlVzUU5TQlFSYm1Wbkp3UjhWNndNcktLclc0STdG?=
 =?utf-8?B?OWxML1VQTjMzWGxyNkUybFl1WE1HWWtMUS9GdkVwNW5YbEtBN2hHaDljMnlK?=
 =?utf-8?B?RDNiSWl3QzNtZkFOdm5BeXc4SnBNYjBNN0FHQm9PUjFQRFp2RzhMSGRGMUNw?=
 =?utf-8?B?VWdFbGRGeDl2aTUzWmx6ZzgwUTYxV0tCcGtGcWIyTmRkeFFoWXlPSEZGMm4z?=
 =?utf-8?B?SmJOUTN2ZmpkVzF4K2h2SDBlZ1R0SFBiYjlFYXpRYkw3M295eE93ZFlGR29S?=
 =?utf-8?B?WDdhNzVvRjFGMTJXem1OWHAwNStWbENNcS9SWHhtZ0xZdjU3cFhDWCs0S0d0?=
 =?utf-8?B?QkFFN3R6di9VSVZMMjJtUndETy9lMzdxRmdqbXd4OEdiQUJOMzg1Njl2bW1j?=
 =?utf-8?B?TzV5VXd2czF3YVhzNmN1c3p4MlhlSW1jMWlUYnFub25JNEFBd1ozOGRsVWli?=
 =?utf-8?B?THV1ZWp6UGFCN1owbms0TFhhcGlCdWtXUkljNWFTQUVyMjhYNzdocGV5YnU2?=
 =?utf-8?B?NXRGK1B1WW9FV1RPa0xrMmV1OGVPRVpWSnQvNGhmNHBEaEtrMUFRY0dNNkxq?=
 =?utf-8?B?VzVFYU5rMzIzbU80UVdQSjVubTVyMWZyZHVFNmpNRmoyV0JDV3BSa1QxTklj?=
 =?utf-8?Q?ytyC8upIa+atB6zv/CFj59ZuZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2429D9C2A78B8242AE9B42333BE97D62@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd47412-8449-4396-7017-08dce67e1141
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 03:13:50.9470 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eelKncGqnfYCsPpvm0onEmd+pbFsAG/yadGN1W0eBHbjN7Vqhtedb7M4e/XkJFuw2oBMkMKPQmqYtZhJOlfCzK9a0Ogcb/ppr53BRzRRGmo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4937
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

SGkgU2h1YWggYW5kIEFkdmFpdCwNCg0KT24gMDUvMTAvMjQgMTI6NDEgYW0sIFNodWFoIEtoYW4g
d3JvdGU6DQo+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IGtub3cgDQo+IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9u
IDEwLzQvMjQgMDk6MDgsIEFkdmFpdCBEaGFtb3Jpa2FyIHdyb3RlOg0KPj4gYXRtZWxfaGxjZGNf
cGxhbmVfdXBkYXRlX2J1ZmZlcnM6IG1heSB1c2UgYW4gdW5pbml0aWFsaXplZA0KPj4gc3IgdmFy
aWFibGUgd2hlbiB0aGUgaWYgY29uZGl0aW9uIHJlbWFpbnMgdW5zYXRpc2ZpZWQNCj4+DQo+IA0K
PiBBcyBtZW50aW9uZWQgaW4gbXkgcmVzcG9uc2UgdG8gYW5vdGhlciBvbmUgb2YgeW91ciBwYXRj
aGVzLA0KPiBpbmNsdWRlIGhvdyB5b3UgZm91bmQgdGhlIHByb2JsZW0gaW4gdGhlIGNoYW5nZSBs
b2cuDQo+IA0KVGhpcyBpcyBzbWF0Y2ggd2FybmluZyByZXBvcnRlZCBieSBEYW4gYW5kIEtlcm5l
bCBUZXN0IFJvYm90Lg0KS2luZGx5IGFkZCB0aGUgdGFncyBtZW50aW9uZWQgaW4gdGhlIGJlbG93
IGxpbmsgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb2Ut
a2J1aWxkLzIwMjQwOTI0MDMyMC5NWlBnaTNVcC1sa3BAaW50ZWwuY29tLw0KPj4gU2lnbmVkLW9m
Zi1ieTogQWR2YWl0IERoYW1vcmlrYXIgPGFkdmFpdGRoYW1vcmlrYXJAZ21haWwuY29tPg0KPj4g
LS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNfcGxhbmUu
YyB8IDIgKy0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlv
bigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRt
ZWxfaGxjZGNfcGxhbmUuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX3BsYW5lLmMNCj4+IGluZGV4IDRhN2JhMDkxOGVjYS4uNDE1MGM0ZDBiNGYyIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5l
LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFu
ZS5jDQo+PiBAQCAtNTU5LDcgKzU1OSw3IEBAIHN0YXRpYyB2b2lkIA0KPj4gYXRtZWxfaGxjZGNf
cGxhbmVfdXBkYXRlX2J1ZmZlcnMoc3RydWN0IGF0bWVsX2hsY2RjX3BsYW5lICpwbGFuZSwNCj4+
IMKgwqDCoMKgwqAgY29uc3Qgc3RydWN0IGF0bWVsX2hsY2RjX2xheWVyX2Rlc2MgKmRlc2MgPSBw
bGFuZS0+bGF5ZXIuZGVzYzsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGF0bWVsX2hsY2RjX2RjICpk
YyA9IHBsYW5lLT5iYXNlLmRldi0+ZGV2X3ByaXZhdGU7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBk
cm1fZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmJhc2UuZmI7DQo+PiAtwqDCoMKgwqAgdTMyIHNy
Ow0KPj4gK8KgwqDCoMKgIHUzMiBzciA9IDA7DQo+IA0KPj4gwqDCoMKgwqDCoCBpbnQgaTsNCj4+
DQo+PiDCoMKgwqDCoMKgIGlmICghZGMtPmRlc2MtPmlzX3hsY2RjKQ0KPiANCj4gc3IgY291bGQg
YmUgdXNlZCB1bmluaXRpYWxpemVkIGluIHRoZSBmb3IgbG9vcCwgIWRjLT5kZXNjLT5pc194bGNk
Yw0KPiBjYXNlLiBIb3dldmVyLCBpcyAwIHRoZSByaWdodCBpbml0aWFsaXphdGlvbiBmb3IgdGhp
cyB2YWx1ZT8NCj4gDQppbml0aWFsaXppbmcgc3IgdG8gMCBpcyB0aGUgcmlnaHQgd2F5DQoNClRo
YW5rIHlvdSBmb3IgdGFraW5nIGNhcmUgb2YgdGhlIHNhbWUNCj4gdGhhbmtzLA0KPiAtLSBTaHVh
aA0KDQotLSANClRoYW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
