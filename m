Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E83EBD8B0C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 12:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3CC10E5A5;
	Tue, 14 Oct 2025 10:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="tgKWIvfg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012029.outbound.protection.outlook.com [52.101.53.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B7C310E5A5
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 10:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6GnNwxkxZz7sdfcHarnjSfD89zXw+0vZ21ZmpCP2GXbLp3NXOD7/ovQspQDcIGWkwd6/JojDulLbXn2sR61Q7adlrhBIbns/l7xcSurQ8W5jbffP9iskZHx+IBRaqsAuxxRP3Te2nOxkCkqMVY2GwWZ8HOkjtSvLUh4H4r4fy18Uu+jQ1cCZah74rSrKu4P9bmuvKkUzcCMSF6IXoWQ76S25+5cGjX2mhlCCW+rc7yKcqCZqLTrTCVWGYA1yWNdD2HBobZAX5hJXu3GNWHAkwVjgfBha1xaEfhLfTE5FfptDGC6O0l/Pi1iiRseIW1/WMkaaElG1+U8rpT/WXIGdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yz9NuT29oS7A/oYi0vkiVzXDwrcV2n1TZZkevmOa+SQ=;
 b=aLN7YRJhlNDBVfzCPpFE21uVm+wpOrY41VDcmGHG1cqp0xVRfqsHhPz9bOwzCCLZNcWDg8KRFRpxVjtT8KYEtQbTsl6u7F4IJpHYodZzutWThqTLfW3OX1xs9Oy6tlDdwJdxLFITk9UvKbLSvomeA5hBLh26dEZI9B03b1vH1aKwgqYZ5QY/muEU8ICD6f5B62QtYLEDnjpkXbE4/6e2IVCWt5lVN9nLERCy9otNMxXfDmd4CGTpzsN7GOc0ygD64u52H6qXTy+uHYQ7qLToTReH9WVUcxQjwpshsb2mLzIFwE7BYDxsEli/C+RkRM2Gmume0SjD8DeLKVYTZxbqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yz9NuT29oS7A/oYi0vkiVzXDwrcV2n1TZZkevmOa+SQ=;
 b=tgKWIvfg6etz1L2mob235KJrSVtTdh2e401XN7NuRSpU/bC3vYhjCVVsDkQ8stHzcyEWH8VzC/eltLs8XKaCn/ENZiTjYeiRIPUFjeTSb+4JM+z4QCkCsnMiTFbxpNu9AnMErJUXr24euyAp7IZ1+c+wTvDsbDfUDacqwuBqmLSoLtpm2umeqa5cs7ruJTJEEj8af5elJeICInNEXYVopHk/sOlbi4MCpR/SkoR1ApKxOq9sFkoItDhn1JhXMFwjORdORE01pgOyjfhCGDdPp98TrVGN10YFt/8dqHtfF4AKtzx3oI3/nXhiaxAADouNJZHjp3jwLTNUq7a3powSxQ==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by SA1PR11MB8351.namprd11.prod.outlook.com
 (2603:10b6:806:384::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 10:14:42 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::a62d:4f28:bd3a:800a%8]) with mapi id 15.20.9137.018; Tue, 14 Oct 2025
 10:14:42 +0000
From: <Manikandan.M@microchip.com>
To: <sam@ravnborg.org>, <bbrezillon@kernel.org>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <Hari.PrasathGE@microchip.com>,
 <Durai.ManickamKR@microchip.com>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <Cyrille.Pitchen@microchip.com>
Subject: Re: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Thread-Topic: [PATCH] drm: atmel-hlcdc: fix atmel_xlcdc_plane_setup_scaler()
Thread-Index: AQHbHh59279+5UqHm0OU3/RlZr0vyrTDqnkA
Date: Tue, 14 Oct 2025 10:14:42 +0000
Message-ID: <4ab432ea-6670-4315-93c4-3bc56f17f774@microchip.com>
References: <20241014094942.325211-1-manikandan.m@microchip.com>
In-Reply-To: <20241014094942.325211-1-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|SA1PR11MB8351:EE_
x-ms-office365-filtering-correlation-id: 3accdd48-6f8b-43e7-fb8e-08de0b0a7dfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?OFNGQVY2QmVKZjZUbkdPUXRQK1krcGpRVmNNcDIzTlN5TkhJQlBhWDZUY0Mv?=
 =?utf-8?B?WmdvUHFJSGNUa0YrbldCR3l1L0cvT0ViekFMcThGZ1FvQWs3cHE1eXFyelR4?=
 =?utf-8?B?RmFMcC9FcDNRRmhKVFY3WGhuVks1S3NuTjNxV0V0L1ZrM3lQdFhsTitIQUZR?=
 =?utf-8?B?cGVRWk9VY0RJd2wvQXlnN3k5UjZOL0dVcEVUaUlTMVVWT0N4V2VmU09LNW16?=
 =?utf-8?B?NkVTVHdDc0NtNTJoZ3FremY0SHFwdmZoWWRxaGRRK2tuZUs0K0JHK0t5aEp2?=
 =?utf-8?B?NHovQVhuWm5CUGpoazB2MFF0RndyYzJrZTJoT29zanByTUFNRk5oZklmdkFH?=
 =?utf-8?B?VEZyYnpjZW9MdmpyRkg3UmpJSDBKOWNMT2V6cU9lci81VS9laURlWWN0Yi9z?=
 =?utf-8?B?MnhOVE44MnVVTzBZUTUrSUU5M3lRUWQ0YjQ0MmRCK1UxR2VJZDhSNjJJc2VT?=
 =?utf-8?B?aVBHK3BBUGw4SkY1MlVRRHhmeGNNQWwwTDg5b0QydXhpako1TG1HQmpGUlVs?=
 =?utf-8?B?WTJWeXRNSVltbGdNRW0wVm9xUFQvZzRLNEdLU0dNRzRTMXN0Uy9CaHRnaG95?=
 =?utf-8?B?QmpRazZpR25LdDM1Vk84Mi8zMUpKZVhueFI2bVV6WkdNd2R2ZUFOd3NzVGlU?=
 =?utf-8?B?M0lSQ2pIeUJKdk1OQlBMRmVMUmlWYzQrWE9MQndWWk1GVlErMGxxL1pzdTV6?=
 =?utf-8?B?VHdPcDBZOVFDZmhhSkRRWTJjaHY2TmFaVkpDc0dYVmdkNEd1am9WSkhveEgy?=
 =?utf-8?B?VDJhMm9YeWNVUHU4b0tJeFY0OUZBK0UwV3RvTXQ2S0JreTJ1VkNIR3BGcUMr?=
 =?utf-8?B?SlRsZU1ZeS9aamxZcXluWmVlYU9xSEdScWFDLzR1VlczUzc1KzVxb1ZTSjNB?=
 =?utf-8?B?SzkrazQ0SkJMK0pGUDNMTndJL2lDNFRJTlZpZTR5VEZjeUpjYkZCSUZydkg2?=
 =?utf-8?B?MFRLQUV0cmdCV2xVRVE5eUNsOUhSL01mQUF1ME9KZllZdm56NUE3amFoK2Y2?=
 =?utf-8?B?OTVvM2YzZVYyL29pekpKRllZR0xhZTVjZHhhVFBHT2F6KzgvRTB5MkRQa2Za?=
 =?utf-8?B?Z2dJL2lXakFMYjdscVJQamtsbzlDSW9WSklqbVJzOG9kTzlsaFVsWHNYc3hV?=
 =?utf-8?B?bjJSY0FzY3BUaGJOYXhBbk85SEFCSlQwci9GSytVN3lFZGtqYWNOdUY2SHNR?=
 =?utf-8?B?cFk3S0tqdW4vTlBMZ2Rkc29mdTMrQnJMWVgyRGREUytvK1ZySHZ6NEY2bE54?=
 =?utf-8?B?blN3VE1sQkZqTUhPNVJ5ZTFHWG0veURCcWZQUFd1QS9QN0kwZFRjT1NvaG9T?=
 =?utf-8?B?YkdaTC9WRGVyd3c1RFgyZHZJS0VRYVdFc01hZE9DN3NrK1NtenhjbHEzdG1J?=
 =?utf-8?B?dDluYjRDWVZ6eENGbWpXMVlRUWUvWjVuQTNwZUhUL0hOQ0YybUovdjFsWkpo?=
 =?utf-8?B?bGplcmZoZE0raW1CVytzRnZWOFNvRGxkV2NraWxZWko4ZFdWKzZOVkZmWlpD?=
 =?utf-8?B?VXZkRzVQZlMwRFVwbEdyazMyODlQUllOYUNsQyt3K3cyRVB5dnNpVURxaGpP?=
 =?utf-8?B?cE9OYkRPT1o4bDFuRmFVcU5IY0tlNEVVTFd4RlJlN3U3dU84RkJpTEFGRnJW?=
 =?utf-8?B?ZHN4enRpNlY2S0JHYW1jY0VPVDFERS8vY2JvcVozZysvSjB4NzZrQlZhSVQ2?=
 =?utf-8?B?S0F1aHlBNjhjWkdhYmpJdzBwOFFpVEdzb3o5dGpvZ2gvRVRWUUpZWHBCbUhK?=
 =?utf-8?B?SXo1RmZCTTlFc1A3bGhPK1lSYjZVaHVjQjR6TTZMMjBKbjlnK2FDNTVNZ2Jw?=
 =?utf-8?B?RmRyZTREZFZEd2RPa2hFbm1FdzFZUEZ6azdBQzRhUTBxaEovc2lhWVVzZXlP?=
 =?utf-8?B?M0R4N2Mra2pHOHlVZGZENEVwc0ZweENIM012dVozUjNuZUdFK3phNFo2ZCta?=
 =?utf-8?B?dUhTdnMzZHdjSFMwWkxYSFBLTFlEbHJaRGpLcm9rVlB3TUNXNE1lVkFmTHNn?=
 =?utf-8?Q?TPbwju1qHUn/DLtvAC/a4ZNLX+QMoo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?K1hRbGl4SmU3ck50YS9lcFpSbDR5SmVHTlNoUGZDUUZzZ3VTUTRoSTI1N2Q3?=
 =?utf-8?B?UjcxY3pmOC91R2pJbldHL1NJNCs4NmZrVUwyV0ZIV20xcVRZdTczT0hYOUE1?=
 =?utf-8?B?SG50UE5GQ1R1cUpjRHhsaTl3VWY1M2k1T05KdXRBdURYUWZRTUwzNVRzQ1RZ?=
 =?utf-8?B?L0lENm9QL21Tek1jNnljZXg0M1pHZHJwM3F5QmNrY1ZhMWE1SmdVdTlOMk9I?=
 =?utf-8?B?eHBWL3ZjZUVDSlA5WWRIS0cvQ3hDMG5MeVJibEVxOTZQcXB5NE0vZmdaM2pa?=
 =?utf-8?B?a1h3Qit6Q0NVNjZTcTJ2ZjhjK2g3aFlvMnRCdHZpOTFVbzg0TXBoWk5sNitj?=
 =?utf-8?B?MkhuME5iOVNuQW9nR0tCZ2x4aDA3N1dEOXY5QTJIaUFjY3Q5VWFhTUxMQzB6?=
 =?utf-8?B?VjZjcWw2aGJHMXM5TUh2RURMZ0tuZTFJcTNGTE1MZ1JjUVdDeS85WGdISkkr?=
 =?utf-8?B?T2c3REFIYkpkWmJNK1Z0UWdlb21NcjNkaEpabHFUT1lFUTNSc1psaW5TRGla?=
 =?utf-8?B?bEVsZTZ3YkpMY3NPeThYajdxUHlYZ3dKWkl5bTRZZnIxYkpPOVJ1YUxKTEpm?=
 =?utf-8?B?UEhLK0dNNGVVQW5yL1lxVlB3TUdNZlczNVU4YmtWNGh4TGdYQUVLUTB4VzY4?=
 =?utf-8?B?RFQrRFA5TWhGdzJkdGgrOHl0S2cwbUtZOWlNbEVzVE9leFdLekZJdXlMZmU1?=
 =?utf-8?B?WkNyT0NkSlEyS3FIVS94Q1lrbnlDTUtNRCtHM1YvbFlFSS8vNE9YSGxYVyty?=
 =?utf-8?B?VEpDZHhncG8vNVhmcmozcGJiNmlWSzVaS0RESW0yQ2VYM1JjbEtBTXJHY1hE?=
 =?utf-8?B?d05yMDVJM04vcDNFaUJWWmtoM1hILytHd2pxNUh0TFdBM0s2TUNsemNFMXRt?=
 =?utf-8?B?Wjlrc1RpeXdqeVBpTWtoOHZLQWJhd2UycW5keFA2d2xVZHMvd3pEZlZDdWs4?=
 =?utf-8?B?MWo2b0xJejE2QWxNYVVIOHhtQTJ4ajRENFNka29xTUh0dVAxODdlWmxNOTU5?=
 =?utf-8?B?NmNTSm9NektuM1lreUdvc0Z1MkwrRFJ5ZG1pbkVrQmlTdDJ6TVgzWDhTN2M0?=
 =?utf-8?B?emJLUW10VHJ4dmtSaXh2QVFoTDNjekpGWGlqTWdEalU5bENGNlRhNk1HaGll?=
 =?utf-8?B?L25CS0I4V3hlMFpUbVc3Yjh3N0MwVnlDZDVqMWRRM3l6LzF0WTNkd2o3Qmdp?=
 =?utf-8?B?VEhKaUcyeWF6Znc1MkdpaW1UR2NyMlVPbmJJWGcyVzNIWVN6V1JIc1ZPeWhC?=
 =?utf-8?B?OVB3c3N2TFlHUFdnQWorYkR5bHZFbTg3VTB5bHZLakUvTXJCeUY1cjQ1emNS?=
 =?utf-8?B?UjRHMUNFUHdqTVlJK0ZGTWkwNUlpSDJ0MG9uT1JWOFE2bm9LS1pRMU56ckNH?=
 =?utf-8?B?dWhQTi9kUVl1RkhzK1ZINyt1QlFTd1R0VXFsNnBRL2ZRaFRKdmZKamRnWU9h?=
 =?utf-8?B?RmxaeXg0Q1NpSDJRdnJ4SGIzOEJ4QVhtaFJtcmFWK2JYZDl3V0tUWkx0Y04v?=
 =?utf-8?B?bmJaKzZVRUNFeWdnRENlTnpsY3VzQWJjQjBvSFdpRys3ejVGNGpUb09waTFh?=
 =?utf-8?B?czMrRGNYOEpjYWlncm5veEV6QjZSeXJSeGdFc2U4Umxhc29DN0oxcS96NVhj?=
 =?utf-8?B?UU01Y0VQK3dhWXBqY2YwWUxVakJWcml4bzdBNlZkOXljOTU2RkkwUTNidGxU?=
 =?utf-8?B?Y3ZFZTYvQWw5ck9XNVF2SEE1MFVKeGh3YnpIb2RXa3RTclRPZVB3cUl4cjJi?=
 =?utf-8?B?bUFiSG1TdVBiSHQxT01vYWhhd0ZsOXNsTG4ybEg4WlMxbzJYVkszaEwwcm04?=
 =?utf-8?B?eElmenFrL1l3L0tPUlZqMVBjRnFmK0NGamdHVkZIWXovcU9NWjlqSTZvTFJ5?=
 =?utf-8?B?OE15Z1lNZWlwSjdIc2lzQUJ3QnY2Ykt0LzhtMVRDdnU2K2VXcnZtdHFDVVVo?=
 =?utf-8?B?eTQwR2ZYVHdMaWd0K3RkN0JEVDh2bDZVT0RleWJ1WHc3a2EwSE9RTjlxcU9Z?=
 =?utf-8?B?QkMzRGhYRTV5d2VsUHF4ZzM3dWJRSXJEUUszK05HK2RMZXVWYjgwQk1NVEQv?=
 =?utf-8?B?QUx6NDVUNmEwM2l1WWlmanZRVDAvbHJZS0FNdDNuZldQQi90VEQwcWtseTkw?=
 =?utf-8?Q?aTIAO5YWXUVBJWPYeFz01Xiga?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D4E909E46C3C6B439168A5DCEF6459F8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3accdd48-6f8b-43e7-fb8e-08de0b0a7dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2025 10:14:42.4529 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Md5yoo+uYQ15gPpa4JYR7aki1Wza6ZKnk4+rI9XBBmpNErq9gJA8SBGHF5Ln/ZyDGmFdEK9KAs01/Og/tQE9RHvFiDrvoriIcnhnH/RWCw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8351
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

T24gMTQvMTAvMjQgMzoxOSBwbSwgTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gd3JvdGU6DQo+IEZy
b206IEN5cmlsbGUgUGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQG1pY3JvY2hpcC5jb20+DQo+IA0K
PiBPbiBTb0NzLCBsaWtlIHRoZSBTQU05WDc1LCB3aGljaCBlbWJlZCB0aGUgWExDREMgaXAsIHRo
ZSByZWdpc3RlcnMgdGhhdA0KPiBjb25maWd1cmUgdGhlIHVuaWZpZWQgc2NhbGluZyBlbmdpbmUg
d2VyZSBub3QgZmlsbGVkIHdpdGggcHJvcGVyIHZhbHVlcy4NCj4gDQo+IEluZGVlZCwgZm9yIFlD
YkNyIGZvcm1hdHMsIHRoZSBWWFNDRkFDVCBiaXRmaWVsZCBvZiB0aGUgSEVPQ0ZHMjUNCj4gcmVn
aXN0ZXIgYW5kIHRoZSBIWFNDRkFDVCBiaXRmaWVsZCBvZiB0aGUgSEVPQ0ZHMjcgcmVnaXN0ZXIg
d2VyZQ0KPiBpbmNvcnJlY3QuDQo+IA0KPiBGb3IgNDoyOjAgZm9ybWF0cywgYm90aCB2ZXJ0aWNh
bCBhbmQgaG9yaXpvbnRhbCBmYWN0b3JzIGZvcg0KPiBjaHJvbWEgY2hhbmVscyBzaG91bGQgYmUg
ZGl2aWRlZCBieSAyIGZyb20gdGhlIGZhY3RvcnMgZm9yIHRoZSBsdW1hDQo+IGNoYW5uZWwuIEhl
bmNlOg0KPiANCj4gSEVPQ0ZHMjQuVlhTWUZBQ1QgPSBWRkFDVE9SDQo+IEhFT0NGRzI1LlZTWENG
QUNUID0gVkZBQ1RPUiAvIDINCj4gSEVPQ0ZHMjYuSFhTWUZBQ1QgPSBIRkFDVE9SDQo+IEhFT0NG
RzI3LkhYU0NGQUNUID0gSEZBQ1RPUiAvIDINCj4gDQo+IEhvd2V2ZXIsIGZvciA0OjI6MiBmb3Jt
YXRzLCBvbmx5IHRoZSBob3Jpem9udGFsIGZhY3RvciBmb3IgY2hyb21hDQo+IGNoYW5lbHMgc2hv
dWxkIGJlIGRpdmlkZWQgYnkgMiBmcm9tIHRoZSBmYWN0b3IgZm9yIHRoZSBsdW1hIGNoYW5uZWw7
DQo+IHRoZSB2ZXJ0aWNhbCBmYWN0b3IgaXMgdGhlIHNhbWUgZm9yIGFsbCB0aGUgbHVtYSBhbmQg
Y2hyb21hIGNoYW5uZWxzLg0KPiBIZW5jZToNCj4gDQo+IEhFT0NGRzI0LlZYU1lGQUNUID0gVkZB
Q1RPUg0KPiBIRU9DRkcyNS5WWFNDRkFDVCA9IFZGQUNUT1INCj4gSEVPQ0ZHMjYuSFhTWUZBQ1Qg
PSBIRkFDVE9SDQo+IEhFT0NGRzI3LkhYU0NGQUNUID0gSEZBQ1RPUiAvIDINCj4gDQo+IEZpeGVz
OiBkNDk4NzcxYjBiODMgKCJkcm06IGF0bWVsX2hsY2RjOiBBZGQgc3VwcG9ydCBmb3IgWExDREMg
dXNpbmcgSVAgc3BlY2lmaWMgZHJpdmVyIG9wcyIpDQo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsbGUg
UGl0Y2hlbiA8Y3lyaWxsZS5waXRjaGVuQG1pY3JvY2hpcC5jb20+DQoNCkFwcGxpZWQgdG8gZHJt
LW1pc2MtbmV4dC4NCg0KZHJtOiBhdG1lbC1obGNkYzogZml4IGF0bWVsX3hsY2RjX3BsYW5lX3Nl
dHVwX3NjYWxlcigpDQpodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2Vy
bmVsLy0vY29tbWl0L2EzMTJhY2RjDQoNCj4gLS0tDQo+ICAgLi4uL2dwdS9kcm0vYXRtZWwtaGxj
ZGMvYXRtZWxfaGxjZGNfcGxhbmUuYyAgIHwgMjcgKysrKysrKysrKysrKysrKy0tLQ0KPiAgIDEg
ZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5j
IGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX3BsYW5lLmMNCj4gaW5k
ZXggNGJjYWYyY2Q3NjcyLi40MWM3MzUxYWU4MTEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jDQo+IEBAIC0zNjUsMTMgKzM2NSwz
NCBAQCB2b2lkIGF0bWVsX3hsY2RjX3BsYW5lX3NldHVwX3NjYWxlcihzdHJ1Y3QgYXRtZWxfaGxj
ZGNfcGxhbmUgKnBsYW5lLA0KPiAgIAkJCQkgICAgeGZhY3Rvcik7DQo+ICAgDQo+ICAgCS8qDQo+
IC0JICogV2l0aCBZQ2JDciA0OjI6MiBhbmQgWUNiWWNyIDQ6MjowIHdpbmRvdyByZXNhbXBsaW5n
LCBjb25maWd1cmF0aW9uDQo+IC0JICogcmVnaXN0ZXIgTENEQ19IRU9DRkcyNS5WWFNDRkFDVCBh
bmQgTENEQ19IRU9DRkcyNy5IWFNDRkFDVCBpcyBoYWxmDQo+ICsJICogV2l0aCBZQ2JDciA0OjI6
MCB3aW5kb3cgcmVzYW1wbGluZywgY29uZmlndXJhdGlvbiByZWdpc3Rlcg0KPiArCSAqIExDRENf
SEVPQ0ZHMjUuVlhTQ0ZBQ1QgYW5kIExDRENfSEVPQ0ZHMjcuSFhTQ0ZBQ1QgdmFsdWVzIGFyZSBo
YWxmDQo+ICAgCSAqIHRoZSB2YWx1ZSBvZiB5ZmFjdG9yIGFuZCB4ZmFjdG9yLg0KPiArCSAqDQo+
ICsJICogT24gdGhlIG90aGVyIGhhbmQsIHdpdGggWUNiQ3IgNDoyOjIgd2luZG93IHJlc2FtcGxp
bmcsIG9ubHkgdGhlDQo+ICsJICogY29uZmlndXJhdGlvbiByZWdpc3RlciBMQ0RDX0hFT0NGRzI3
LkhYU0NGQUNUIHZhbHVlIGlzIGhhbGYgdGhlIHZhbHVlDQo+ICsJICogb2YgdGhlIHhmYWN0b3I7
IHRoZSB2YWx1ZSBvZiBMQ0RDX0hFT0NGRzI1LlZYU0NGQUNUIGlzIHlmYWN0b3IgKG5vDQo+ICsJ
ICogZGl2aXNpb24gYnkgMikuDQo+ICAgCSAqLw0KPiAtCWlmIChzdGF0ZS0+YmFzZS5mYi0+Zm9y
bWF0LT5mb3JtYXQgPT0gRFJNX0ZPUk1BVF9ZVVY0MjApIHsNCj4gKwlzd2l0Y2ggKHN0YXRlLT5i
YXNlLmZiLT5mb3JtYXQtPmZvcm1hdCkgew0KPiArCS8qIFlDYkNyIDQ6MjoyICovDQo+ICsJY2Fz
ZSBEUk1fRk9STUFUX1lVWVY6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1VZVlk6DQo+ICsJY2FzZSBE
Uk1fRk9STUFUX1lWWVU6DQo+ICsJY2FzZSBEUk1fRk9STUFUX1ZZVVk6DQo+ICsJY2FzZSBEUk1f
Rk9STUFUX1lVVjQyMjoNCj4gKwljYXNlIERSTV9GT1JNQVRfTlY2MToNCj4gKwkJeGZhY3RvciAv
PSAyOw0KPiArCQlicmVhazsNCj4gKw0KPiArCS8qIFlDYkNyIDQ6MjowICovDQo+ICsJY2FzZSBE
Uk1fRk9STUFUX1lVVjQyMDoNCj4gKwljYXNlIERSTV9GT1JNQVRfTlYyMToNCj4gICAJCXlmYWN0
b3IgLz0gMjsNCj4gICAJCXhmYWN0b3IgLz0gMjsNCj4gKwkJYnJlYWs7DQo+ICsJZGVmYXVsdDoN
Cj4gKwkJYnJlYWs7DQo+ICAgCX0NCj4gICANCj4gICAJYXRtZWxfaGxjZGNfbGF5ZXJfd3JpdGVf
Y2ZnKCZwbGFuZS0+bGF5ZXIsIGRlc2MtPmxheW91dC5zY2FsZXJfY29uZmlnICsgMiwNCg0KLS0g
DQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
