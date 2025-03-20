Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5AFA6A731
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:31:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A96210E3A2;
	Thu, 20 Mar 2025 13:31:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="MZwUfFzc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR02CU008.outbound.protection.outlook.com
 (mail-westeuropeazon11013051.outbound.protection.outlook.com [52.101.72.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5136210E3A2
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Mar 2025 13:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y0cjB9qB48GA+KfiSlXcyNh+9GJB7+DksMaFsC8/vd+r6PLtIpYAAslDkIGhNh+g3TnPsPOsCCD6FS20E4Hc4rXz81mJs6Bj72tPtQTmG8442LIt0wPFVdvnK5lI0+/olMsSgsW2zW5d7rTe6a3EI5QR8G80A3BoH/i+YT33H0tcyVaZvfjL/ngWWazwD9JOW8txBHsg3PSKfjhi4+Z/BiA2XMFF8UOlvEmgn35UzgjJP9XUtO2gT4Eq2r2Nunwjia+qz82TQidi25drACkSTt+j96kFZMJ/wZ1o1vfPmRbg7pxqVKp3trQiRiW0REc8MPT1iV2uJpBlabLs7gF81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m441S4ODcjbiwg/4tIkwr07DIAxH2cmtAxlnT/9FkZ4=;
 b=oA4QiF3eFUQ1ZdhVJ48l+8N8KODjKyKBLy69ufR9I0dza1RlrRKX0+1qqTF5vazxLR0Cn192y4wYd2RnFr3AeZkma1M78D4LYho1CRLl4LDHjUa4U+Q8HzZG74XqF6uwAZ65581TwQNGHQJhlQBSZfdNB8GwG44F+8xqCjmpt87kj/DMiTfEEGY8/1azs7AsScMotmtonMbpQYAHBPYlRqAufEToZYa9IICYM94cr9MASHu5FCHa46zAVEPua9LK5F4owVU/PcS3Ai1GaGs1oJIofLiL4PR2AqOXenATAuH4QKIkWh1HQCyHl84XXzzKtzCqxQmqQd4pIoobza4SZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m441S4ODcjbiwg/4tIkwr07DIAxH2cmtAxlnT/9FkZ4=;
 b=MZwUfFzc1cPuePZ5x9vAWNui7cznQgdp7KV96GDcxoNDxOucTdA9S3oefgCCqnZAtuWtOlJ+ocQhMQ+dNOCRsZYf4ahe3OxdBfn41AWjHdaUHMZoqx6ZDVBVR82IAs+81Zn7nonaFtZCP4WzU/8yIYUemXMCVsm9E4VLBwBs5qgq522kxDs1gy9sbFr1lmB6N0olHjoAKYrOWTIzxg300MGj2qJl3lgWNhQBreuTYE4kdYMcMAQCIcsLVEJ9iL0iTZgtJ5TsLXtwLnUTbN5fHU2jV9e8+zpDtX5mfKWt6ub+Tt8Q0p25wy2zNVxlYSctYfc0Pc5ZySaawIZk7UaBPQ==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA2PR10MB8941.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:421::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:31:00 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:31:00 +0000
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
Thread-Index: AQHbPn5WIr4uDRt/y0KwBpNmDAlljrN7dJOAgAFFJICAAAHtAA==
Date: Thu, 20 Mar 2025 13:30:59 +0000
Message-ID: <3a88fd3d0b34b049c4b6fbe10925b449f7f73043.camel@siemens.com>
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
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA2PR10MB8941:EE_
x-ms-office365-filtering-correlation-id: c9be0c04-9af2-4357-1f0b-08dd67b37404
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?S3phMEM2Q2tjRjFVcFNjcFNsMU1TVzBiYVMwREtHS0gzN1BxSWlLVWZ0Rzdp?=
 =?utf-8?B?ZjJVNnhvYzBnODN2TmJsWFlrNEd4OWF6THAyZnlpeE85SXpXUE9vTEFQYnVk?=
 =?utf-8?B?anRUUDdaOWQ4R1c3RjJVVE16ZDNtRjRIendqakV2VDZNRXltR1REU3dJalBk?=
 =?utf-8?B?Kys5VjNLWlQ2aWc2KzNiQzdDUEtPdFZFY09uVzBYeksvdnUvVk4xcjZFWjFs?=
 =?utf-8?B?ZzlEOGFxUkE4NkJYa3NCaXk3WUQ1eW1NVmtDL1RESkcyN2xBTjBDS2lTSDJX?=
 =?utf-8?B?UDZubjg5WlRqNmRud3Jqc21kaFpiQlI3Q2VZRWhNSWtQZTFnNUlHMGUxY2p6?=
 =?utf-8?B?SlRoMHFOUW9iNUxVdlJyV1R4TitZejdqcC9WNEtmbEdqdzVvYTVlbExWV2Rq?=
 =?utf-8?B?SzB5dm1vcUw2d3h6WElDRFVjNnFGYnk0NDFTWEpwdEZBT2pNa3FjQlgvVXVI?=
 =?utf-8?B?Qm5RWUNTa1BpNzNlU0pGWnZYcTl3S2Q2OTNLQ1hRTStuaFhrWFFzRDVGVmx0?=
 =?utf-8?B?VnhxTGJCNUQrcURXczRuU0tZQnAvaG5OWDFNMWcyTkdUN1M5ZEZTbVNoZFJB?=
 =?utf-8?B?dytyRXU1cFFjRzhEV1ZMeC91dGx2dStPMnJtcExEN2ZvUDZMMGhmTklaamtO?=
 =?utf-8?B?eWZBVnJaam10Nmk3SkVnYW9kRGZjM1BIeTdYUWV5VU93MER3aGQrclVyaXFh?=
 =?utf-8?B?a3hMdEVFeDBTd2hSM0NoSzB5bkJJZUR0OFZqbC83YW5OblI5N051Q1d0MytR?=
 =?utf-8?B?SS9JeHpaRHVjc01UZ3BUbjhud0Z3djhqZk1uTkhBOEJRb0VPalprWUFWU00z?=
 =?utf-8?B?YUVvai9wOXNPSmRiZWlFRzlMQk84ZkI0U3pURmJzdCtiM25BVGo2b1lJS05N?=
 =?utf-8?B?NTk3cUhNeGQ1b2UwazNDMU50UXpsZG9WMnd6aDdNOFVJOW4zZHg3Z0grOGEy?=
 =?utf-8?B?YUhiRFVIWFRJRjRSNkljdmxKSFAzMU1SS1lUNnFadW1DdDFPSWtRcFRibTd1?=
 =?utf-8?B?TFdQUXBLeXordTFLUURCMTFZTi81a0E2QnV5WlkwRGk0S1BlSzQ0VEIwYzNk?=
 =?utf-8?B?SnNsR1B3TGdEcnR1bFhGbktWYVNrdUg0SFE5bnBtQU5ZaCtFM3BTd1o2M3ZE?=
 =?utf-8?B?NHhXVlJDT1VXUmtLS0JCY2lnN0RKQzVDcE5NeXpsR3JiVWZVeEhUeDU3enhv?=
 =?utf-8?B?MFYzbXlQcHNDOEJOKzJ3UE5oeTNSRlprUmxNN0prTVVPS3U0VVRSdkNFOG9v?=
 =?utf-8?B?SjlZT2o5UVo0NGxVRmpRd092MGZENlA5VjFsV3g5M1ppSXVZVGUxOWZOUlBG?=
 =?utf-8?B?MGE3aUk5L2ltcVZzbkErdHJSeHR5YnF1eUh0V0RINmF2cE9SdUpGcWpVOEpU?=
 =?utf-8?B?ZnVLM3MrWGFRa3JJemE4RlpBOHY0SGRwcVYvaGlXeE1lbEhBeDNUSUV5OStr?=
 =?utf-8?B?akg5UHpHSWpHWjRBRXF3cEdXTTRlWXpWejBTamxvTlVFNGgxeVRmTzZBYm9m?=
 =?utf-8?B?Q3NsSmJKVktyRGVjOEtDcCsrRzVwa0xBRVRUWnYyVUE1dVFyWDh2V1JESlI5?=
 =?utf-8?B?MWwvZVUrczFwSHROY1RLTm90TEt1ZG1PVC9WdU9ZVWNaeGhGTDd0TUxMamUx?=
 =?utf-8?B?aDAzUlFrSUgyam5URmtjaHJVZ3lGSDhzVGpZZ1B3SEE5cWsxd0N6UmVzUkRw?=
 =?utf-8?B?SUhBVWpIRnNPMGs4TkdGMTFxQVRxWENFaTViWFN2d2V6S0FuTlRoWmJNNTJt?=
 =?utf-8?B?NzFKSVc1ZWJrZC83ZXFjZzBBNFNpY3pEYUZwdXl5Mlk0MkJ3d3IxZjJsNVlB?=
 =?utf-8?B?ZUx2MUNIL3AwT3gyZEYweGVPNGx6M1NuN2dGcFMvdWdiUFdNQ3p2cnQ4Q1Yy?=
 =?utf-8?B?THhOcDEwVFRnQnozOG5oNStra2VLKzNraHFFdFdlcTJRUHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?czV4VEtjY2Z1ZE8wbTdLNEM5Ri81alhPb1VKRW5jUGVTZmIzRTh5WHFNT1Vp?=
 =?utf-8?B?TWxZc2NTME1xUEl5U2tmUkF6ZnRBdXdPaGYxNXNUY2gwQU16Rk45MEZzbnAw?=
 =?utf-8?B?aHowcDNGSGQxTWFjc3hCeCsvcDdObGhqYmZJUTJ6QlJaY2dId2MwOTM1TW5Q?=
 =?utf-8?B?YWdEYUtkMWM3SWQvd0dnQlZjVHN2T0dnOFJRMVNGam1mdnQ2UTBhTWo5TTNm?=
 =?utf-8?B?R2F1S2J2MTZBM1J0dGFWVjBteEFyZ0FHbXhEazJzSUtrSEFqYkt5R0E1cjBH?=
 =?utf-8?B?U0Uwc3pBeGNkYTBZbWR4US9sWE5LV2lOS2c2c2M5MVdIaWpKOTZNVklZUW80?=
 =?utf-8?B?K2YzK3JyaEoxdzJIVnBKWEZXVkEzNmk1WWVNaXliQ0NKWC9TSUVBd1g4ckJC?=
 =?utf-8?B?MHd1RXhYQ1BTRzdROGtXUVIwajV0Y2xSS21ySnhyWjc2cFFlYnF3Y2dYM1Nt?=
 =?utf-8?B?Qjc1ZUpZS0Rva3d5SzExV2ZJVjJkL2pQZzEvVy9qekdVNk54b2xMMjRMaFd5?=
 =?utf-8?B?QlliYUJNd0FaV0p6VzlOQzA0N3dvVHIyQlZmTVN1UTVnOWJHWlpXcnlZWmoy?=
 =?utf-8?B?ZTU1azYxOFBQNGNrYlZZQ0MrZ3k4UUNHcXNsbWNmV2JaQlRZYmdvaDZBMHIy?=
 =?utf-8?B?c2VGazJ1bUMyWHhKcUo4ektvRnNqQi9yRWh4WVcvYmRsZ2dqVU9lNVdaNzdX?=
 =?utf-8?B?VGFuT20vL1JmbnZxa04xZVZvNzJiUEwzUjJqTE05bVJ4WnVRWDF5T0UwZW5N?=
 =?utf-8?B?c3J4R1QybnhYMFZKNXE1NWFYd2d1TWVGYkcrbjk2N1JLTlNZTWtkQ1ZlSFR2?=
 =?utf-8?B?S1ErZ2lZNm5FRm5MQ3BQVFpmckZqM01KOW91aVJQSEJyYVRZWjNBTi8xOU5p?=
 =?utf-8?B?THpEL1lGdlF5bXgyWVphTE9FVlVRTFJsOVdqNm1oRGtGQkg4OElCOGhmd2hm?=
 =?utf-8?B?bkdLcVZGcEVrSWloaHl3Y2RwQUtOZmt6OS9xUkE0Q3dlcGt6d3dDVWtTNnNY?=
 =?utf-8?B?Zno0alhSYlltYnNZc1R6UXJXUDIxNkU2RW93ZkVTT2VmMEFRNm0yVUdoK3NF?=
 =?utf-8?B?dmYwRGViZGdPNExxazlLYTRyNUo0SlY1SXVyQ2wrdDdnSEh0WENucGNlVXFY?=
 =?utf-8?B?L2tmMmltSnhTcHkreG9DVE9JdFpPREUvOFVoVnVua25xRFE3MXlhcE9uVVFR?=
 =?utf-8?B?UVd0RFZaRmJOTGVYT1RTTnRsYno0TG9nWWpTMVlua3JZSGFSQ09Sa25GNC9t?=
 =?utf-8?B?NkhzN3VjSjA3MnpYRTNGVGsvSkUvZkFwNjhFSkNlbjdGbFFrV0VGR29LQkVh?=
 =?utf-8?B?YktSOEdsZG5sVXRIQ3c5Q0xoT1YyU1dnN1dHSUY2SEJNTjNDNGFPUGl6NjBw?=
 =?utf-8?B?V0pWZjdkTDVPZU83aklLVUgwa1JjdkZxaTVyZGVtR1VKZlNFYi80ZHhNSnFB?=
 =?utf-8?B?YzJJUm9nK1Z6NXJPN1Nwb0FqbzBXOXBhUzVIR2Q2a1c1MmJ1MDFacXJMTXNP?=
 =?utf-8?B?cHlaRlkwd1hUTmxxdjUwSDc2NCs3dlIrcFc3amtmdk0vSUdBdjhkaVA3Q0ZJ?=
 =?utf-8?B?cThYVEllbDdBRDRpNUlVb3RNalIvV3E1VmZpMEV0aHg2NG9MWTJadHNWVVUw?=
 =?utf-8?B?MnR6eHZEK1hJazMwVG5yZWc4MitpazlsMzIyVVV6NVpwSDJhM3BzTmszRmlj?=
 =?utf-8?B?a3l0SkFzZzc2UGQ3SkVjYmNaYXdMTjRnbC9xOWFWall5ZElFRFpaQnNiKzhS?=
 =?utf-8?B?R2YyUnBaamtBV0tsVU4veG1tMzc2SldzbGxMRHVhbVM2bTg5citlSDVMaE5Z?=
 =?utf-8?B?VWxhdytMZ08zazNRNnNJaFN0a2lLUUNXSE1xTGJFZklpNW54djd0SUFRbGMr?=
 =?utf-8?B?Ykl5MG00WHYwcE5SK0tBajJqc1h1cFZQc1gzUklYR1VMb2hoOUhDRzNOZ2U2?=
 =?utf-8?B?WEFDMGVua2RqV2JOeUdGdnRuZ0lHQWRFOS9qalRUWHhMc2tKeVRzSG0vUFI0?=
 =?utf-8?B?ZDkva1ZYNFB4bGhxY2RoVmMwWEJacEc2WWpVelNaS1NNMitnV1o5U1BYcGJL?=
 =?utf-8?B?TUkySzkrTmRweUNBYXU1WkdKa21QdG1mS21mYi9sRGY1UCtjeDBQRjhLZ1Q2?=
 =?utf-8?B?bVZISTlzTmNjUkZmMnlEcEh3QnRiM2ZmSkpnYjlzQ1pTdEpnVTFsZnFNMWM3?=
 =?utf-8?Q?OvmQt988DQLEosCvyeB1Ax4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2053016DE64EF74985BD4CC3243C3010@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c9be0c04-9af2-4357-1f0b-08dd67b37404
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Mar 2025 13:30:59.9599 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YDpTc88NCnlrhGYRK5lNBhsurmzpEmUG7LSvdlAmkb8GkVCXT1Qbd9m3+WmacfMZn2OVDH7xiqqxHp7eQhq/KDArhT1IEbnN/upsBUDkOVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR10MB8941
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
IEJoYXRpYSB3cm90ZToNCj4gV2hpbGUgeW91IGhhdmUgbWVudGlvbmVkIHRoYXQgeW91IGRpZCBh
ZGQgdGhlIHByZXJlcXVpc2l0ZXMsIGNvdWxkIHlvdQ0KPiBjb25maXJtIHRoYXQgeW91IGFwcGxp
ZWQgdGhlIChub3cgb2xkZXIpIGRlcGVuZGVuY3kgcGF0Y2ggbWVudGlvbmVkIGluDQo+IHRoZSB2
NCBjb3Zlci1sZXR0ZXJbMV0/DQo+IElkZWFsbHksIHlvdSBzaG91bGQgbm90IG9ic2VydmUgdGhl
c2UgY29uY2VybnMgaWYgWzFdIHdlcmUgc3VjY2Vzc2Z1bGx5DQo+IGFwcGxpZWQuDQoNClNlZW1z
IHRoYXQgSSd2ZSBpbmRlZWQgbWlzc2VkIG1vc3Qgb2YgdGhlIGRlcGVuZGVuY2llcyBhbmQgb25s
eSBoYWQNCiJkcm0vYnJpZGdlOiBJbnRyb2R1Y2UgZWFybHlfZW5hYmxlIGFuZCBsYXRlIGRpc2Fi
bGUiIHNvIHRoYXQgaXQgYnVpbGRzIDstKQ0KDQo+IE1vcmUgaW1wb3J0YW50bHksIGlmIHlvdSBh
cmUgYWxyZWFkeSBvbiBsYXRlc3QgbGludXgtbmV4dCwgSSB3b3VsZA0KPiByZXF1ZXN0IHlvdSB0
byB1c2UgdjYgb2YgdGhpcyBPTERJIHNlcmllc1syXSwgYWxvbmcgd2l0aCB0aGUgbGF0ZXN0DQo+
IGRlcGVuZGVuY3kgcGF0Y2hlc1swXSwgYXMgdGhlIG9sZGVyIGRlcGVuZGVuY3kgcGF0Y2ggaXMg
c2ltcGx5IG5vdA0KPiBhcHBsaWNhYmxlIG9uIGxhdGVzdCBrZXJuZWwgYW55bW9yZSEgPSkNCj4g
DQo+IEknZCBhcHByZWNpYXRlIGl0IGlmIHlvdSBhcmUgYWJsZSB0byB0ZXN0IHRoZSBsYXRlc3Qg
cmV2aXNpb25zIG9uIHlvdXINCj4gc2luZ2xlLWxpbmsgc2V0dXAsIGFuZCByZXBvcnQgYmFjayBh
bnkgaXNzdWUgeW91IHNlZSEgVGhhbmsgeW91ISA9KQ0KDQpUaGFua3MgZm9yIHRoZSByZWZlcmVu
Y2VzIQ0KSSdsbCB1cGRhdGUsIHRlc3QgYW5kIGdldCBiYWNrIHRvIHlvdSENCg0KPiBbMF06IFBy
ZSBSZXF1aXNpdGUgcGF0Y2hlcyB0aGF0IHJlLW9yZGVyIGNydGMvZW5jb2Rlci9icmlkZ2Ugc2Vx
dWVuY2VzDQo+IChsYXRlc3QgcmV2aXNpb24pLg0KPiANCj4gYS4gKCJkcm0vYXRvbWljLWhlbHBl
cjogUmVmYWN0b3IgY3J0YyAmIGVuY29kZXItYnJpZGdlIG9wIGxvb3BzIGludG8NCj4gc2VwYXJh
dGUgZnVuY3Rpb25zIikNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI2MTU1
NzM3LjU2NTkzMS0zLWFyYWRoeWEuYmhhdGlhQGxpbnV4LmRldi8NCj4gDQo+IGIuICgiZHJtL2F0
b21pYy1oZWxwZXI6IFNlcGFyYXRlIG91dCBicmlkZ2UgcHJlX2VuYWJsZS9wb3N0X2Rpc2FibGUg
ZnJvbQ0KPiBlbmFibGUvZGlzYWJsZSIpDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI1MDIyNjE1NTczNy41NjU5MzEtNC1hcmFkaHlhLmJoYXRpYUBsaW51eC5kZXYvDQo+IA0KPiBj
LiAoImRybS9hdG9taWMtaGVscGVyOiBSZS1vcmRlciBicmlkZ2UgY2hhaW4gcHJlLWVuYWJsZSBh
bmQgcG9zdC1kaXNhYmxlIikNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMjI2
MTU1NzM3LjU2NTkzMS01LWFyYWRoeWEuYmhhdGlhQGxpbnV4LmRldi8NCj4gDQo+IA0KPiBbMV06
IERlcGVuZGVuY3kgcGF0Y2ggbWVudGlvbmVkIGluIHY0IE9MREkgc2VyaWVzLg0KPiAoImRybS9h
dG9taWMtaGVscGVyOiBSZS1vcmRlciBicmlkZ2UgY2hhaW4gcHJlLWVuYWJsZSBhbmQgcG9zdC1k
aXNhYmxlIikNCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjQwNjIyMTEwOTI5LjMx
MTU3MTQtMTEtYS1iaGF0aWExQHRpLmNvbS8NCj4gDQo+IA0KPiBbMl06IExhdGVzdCBPTERJIHNl
cmllcyAodjYpDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDIyNjE4MTMwMC43
NTY2MTAtMS1hcmFkaHlhLmJoYXRpYUBsaW51eC5kZXYvDQoNCi0tIA0KQWxleGFuZGVyIFN2ZXJk
bGluDQpTaWVtZW5zIEFHDQp3d3cuc2llbWVucy5jb20NCg==
