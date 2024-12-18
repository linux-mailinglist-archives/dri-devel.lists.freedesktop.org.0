Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C39C9F68E0
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 15:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E9310EBA5;
	Wed, 18 Dec 2024 14:45:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=siemens.com header.i=@siemens.com header.b="AqEKUuHD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazlp170120003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c200::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5999610EBA5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 14:45:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdMcD/qPi0dy3wXjVYt1fq4syW9VWhq4vOHg6gIn+cwci3Sm1/881aejivQppM0iQUPG+Ky7guqZS1cM/fZFzf2DCe49OV1/BJHVQGJmGyO0hooZK27r9ooJVkJDMqOApdUc8KsQBdRdreantGIvKf5U9R12KvBPTMYrcZq877oh57BB6mssuZ5lpEL17IYw8YjOiNkI+iIejDHimkX5337eztrnOZ3SKevM2vv6KGHvtoIHtP2m2r4uPkxi+exk4//mW5qdF3ln92kHoIyZay0Y0hBSNOSm7ATY7YhJKe/PID59eINZdY8gmGSKvlXOytPCr/dEBlF4OYcbeB1iIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R0gL+If/EiecOdVthaPELrkhDPGPXFgzqms33GtE3RQ=;
 b=VbqQe4gEVRNtR273BGs/XVegICzwz0wCIuunvCELND15Y0FM08wE7d83/37QdAFgb5A4wDm37lI2T9A0v8xmMIfY3F/4OnvZZ8MMl+0an5gxF26UmU23VsvOPy33D08YbmD1fhgqO1b2oPri+L12oVt+rXv9WhPIQU5XqB/Cm00QmIQjkXU93yBC7Gf3SnDDxymqwBwxNdLmpzZtWlvIJdNM7Vk6bJxeloLuBSJGxb6WBDPVLkvgOVMKqqy9oL8z9ZzHmb/r7Vu/T0Mw2Z8FsRXatSQhdBP48P1mc7pJXcSnKpkV65ew8Sxphfgw6xj6sm/jMkYk9S0UuHiWuV5GCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R0gL+If/EiecOdVthaPELrkhDPGPXFgzqms33GtE3RQ=;
 b=AqEKUuHDezweFcnQCL0UtgFqsGq5uQlv6UVSf6PygGN1VyFcAdwfeNBgYFkwohdV6ZlEc9uwwIzNb+3wlCBn9b2ssZpwxwxi+KYIUC4m7P6QlJMFSD3WVe3Ig49glGAFH4AgWoXYWD7H5KldomWKQWq4+50WeIHflMU0AOI+q0yeR29EaKiiAeW7851P8QSquTwuw2TYPIp7ag+xG5Q4G81nBQI/jpjMde1oAe8xEtXMqcITqk1EIO7y4nT6IMpna7pZgr0RkaYyrKrPiQoPt1Y8U6rn9JdPmqlQNj2xq/7jZ/MW30A1DxZsdgFtcLLiQJsCjHz0jCt+kUVCx/cbZA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by DB9PR10MB8196.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4c1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.12; Wed, 18 Dec
 2024 14:45:50 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8272.005; Wed, 18 Dec 2024
 14:45:50 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, "afd@ti.com"
 <afd@ti.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
CC: "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "lee@kernel.org"
 <lee@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>,
 "danielt@kernel.org" <danielt@kernel.org>, "conor+dt@kernel.org"
 <conor+dt@kernel.org>
Subject: Re: [PATCH v4 2/2] leds: lp8864: New driver
Thread-Topic: [PATCH v4 2/2] leds: lp8864: New driver
Thread-Index: AQHbUIjMUwx+j9IEfUCIwCFyj7ubGbLql36AgAF+ewA=
Date: Wed, 18 Dec 2024 14:45:50 +0000
Message-ID: <00caa5cf65fb4cf40cb94e3e715640ca0a7975f8.camel@siemens.com>
References: <20241217133713.326853-1-alexander.sverdlin@siemens.com>
 <20241217133713.326853-3-alexander.sverdlin@siemens.com>
 <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
In-Reply-To: <b0e2e061-0a1f-4cba-9f25-b26769e8ff27@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|DB9PR10MB8196:EE_
x-ms-office365-filtering-correlation-id: 237d3ba6-ae36-4282-af29-08dd1f72aa88
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TDVJT2x2NExzU1RLb0tHa3cweU1MT2NSd2pkMUZYSlJXZWpsVVZ6RTdVbXRr?=
 =?utf-8?B?NWc1QzFhaEZEMHM0cVdwYWRHcFZ6aGpLcmRjQXpXY1V2d1cxSmFSUDRRL1V6?=
 =?utf-8?B?a0dveGhnbWlOeG9tejhGb3Bwb2tzeXo4U0NISHd6aThOR1hyV3JIdWwzTlVO?=
 =?utf-8?B?THdZM2JpZmJraGFONnlqOTNmV1JlYnpONkp4UXJOQzBNcWVQUzc0bjY3MDdW?=
 =?utf-8?B?ZFFYOHppd1JnVHZ2cDJvbEwyOTdIdGhLVUxHNks5V0o4U2pMWTlncU1YSEJZ?=
 =?utf-8?B?TnJUUzFDbXRyVndCM2huWWNsa1o5NTIwVk54L1ZtN3pZa25SMU5NUmRIdWpn?=
 =?utf-8?B?RXIwVWFQQUVXYlFzclA4RW5GZS90KzF1S3p0WmtUaU1OcXdqZU8rbFdvUjJx?=
 =?utf-8?B?djFrUW1LZWF2NEVaczU1ME41Rk1sWmN2RTF5dU9DTWZJVTFWMVBQSStmM0Fk?=
 =?utf-8?B?NnBuNGZPSzBxOHBrMjNzS1RvM2dIc1dJbWdRNnJ3QTQyeDRrRHBoVWo3UEVK?=
 =?utf-8?B?Q29yOXBqaUtkb1M3L1JNUzlDNC9BcXp6K1g2TjBqMmp1T3hXOFN0NWE2bFd1?=
 =?utf-8?B?NzlhbjlNSFZWYUNMMXhsU0YzNWYxeHQxRkxZVUF2UmM4YnZkZjJlQWk3OU9T?=
 =?utf-8?B?T1JJWU8vcjNkTVZ3dHdGTDNEWTZaeWNiTlhKNTB3RFRlOExZeWxZQ1NEcDBF?=
 =?utf-8?B?djRlbE14U2hmNmk0SjZTZElwa0IvdEtwWVhLeWhOSG9XTHlzMFlvUDJpNG1j?=
 =?utf-8?B?WEtBeUJBY1o0aHRHYkt4SmtpMjREVUpOUVVrZWxJMzhPMXBjcFdwNGc5YVdP?=
 =?utf-8?B?eHFzbUUxNDBrVkxqVjhWa1RhWHVzbXEzVTk2QUpjSG5ncDJyMlpaSjA3ZXc0?=
 =?utf-8?B?MEc0dkNOYVNiUGVYNHpreWlDK3NaVnZCelBLRFJlOFZZa2pTblBBM3A1a2Fm?=
 =?utf-8?B?S3A0VTI3ZmtWYkFxbWJXeG9talFTcmlnbCtNcXg4NXpubytTbnNOWHFUNmVT?=
 =?utf-8?B?SGlRU1V4WTJMZEpNbTRwZTFXMGRQZy9ENUY5dkkvWEZMNm9CU3VIcnN0RE9u?=
 =?utf-8?B?KzhLOVNxMHZmck9uUjhZU3ZrcUl4SzFlcW9icjZzSEFQMFhkSWtmTlZNRUtY?=
 =?utf-8?B?bzM4WE9ZTk4wdnMzT2tQRlJHUEcwd3JoSlF1Q3diY3FqcmpZRVhzYzNmRk51?=
 =?utf-8?B?NklkTkZMcUNkby9uNmQ5dHl2YVJOUU1CMXpHbm1ZQjF2elY2K1hRRkFEbUdh?=
 =?utf-8?B?d1RybWVTanpPT0JndEVtMU81UmhMV0tmdHljUjFlZGxHOEIwSGNrc0xNNTNp?=
 =?utf-8?B?QzRFazloc0x3akJQaC9TLzU0ajc1R1JZb05WbjA4Ky9UMFo3bGxHRTc0cmRq?=
 =?utf-8?B?UkVXRXd3a3FmVlhmZzhBTGxrQ3k4K1J2S1VmUDU0Mkw5bEhXNE5Tc0tMYzRD?=
 =?utf-8?B?MyswNVdBMmtldmNGQmtKQXl3WHJuMXpkb2czRytsRjRiR2VPZDIyR1Q2ejFP?=
 =?utf-8?B?Y2xZakU2d0JSMFg5a05GN1dXZi9oQ3ZnSnJLSS9YQXZqUHpPV2o5ZTNsZElo?=
 =?utf-8?B?R1VCYk9CQjlOSGZFc245b2Vva3hOU25yZUFXT3QrSEdhQ1lBcTU2RnZZeEpI?=
 =?utf-8?B?ZUlLZ3VSQTF1VnpUY2NFVk8yNmh6R1Rud0lJOVVtQ28zQ1BMc0hBT1RtdjdW?=
 =?utf-8?B?SjdLaHNkelZ2cnVvL3FDNi9Gb1BVOUlwMndML0xGeHBQSnhReVlFZUovTFNR?=
 =?utf-8?B?blBEN0sxUGdSMWl1cUtLZ1FYamVEQ3FGN3NlbnR4a0VmcWNmYklzSlduUk42?=
 =?utf-8?B?WmJxR0pTUmdVN21PK3FWbERkanNRekhlRXdmbnF4U3lEWTNkakVvdGZCdkFO?=
 =?utf-8?B?MWhDczd5anZoRjZCMkhDZGFGcWVocW5pVEJ4dFp2VG5rVEE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?N0k0Z1ZWZHZjQ0RPQXdPdUFXQWtMZmNrTUtLQVlIOElqV091dkhvUDJuUnRr?=
 =?utf-8?B?TU5ybTkyWVpMcGh5REEzVVh0bENIc2R5YVZrWjBRVHFsZmthMWozajdrTGRI?=
 =?utf-8?B?dWdCMTE0MVMrUlAyWW5hVTRDYVBZVHlZMmpsckMrT1Azb1EwQm9JM1d6RmUw?=
 =?utf-8?B?ZENHZEFmVkFGVHYwV2hldnFLS2E4Vkk0ZTVDUXFwVDhENnVRMGJSV0RxN1g2?=
 =?utf-8?B?K1h2VjU2K1hpbThUWit5LzU3U3ZKZDVBNVlBRHozWkthTUEyNmsxamliMXVJ?=
 =?utf-8?B?WXlBZVBlZC9Md1BvWTRFcGZlWkpSV0NWMk9mQXlja1JQVGZka3BGRVhHVFNk?=
 =?utf-8?B?YVFnenpMSkR6WTlyWUh3UnJjaS9tbTl6SzVtSFpUMVVZQ1Q3eGJ3VzV5TGh6?=
 =?utf-8?B?WjlzYUkrSGtra20xYkFWL1licGVJMTRJN2dkZWplOTJoZWoxU2RaTjByTnpO?=
 =?utf-8?B?cFZxRVk4bXNkbDBjb1dZTzZTQVFTQzBIeHdIZEpVcHdqbTRVN2lUbUMySk9i?=
 =?utf-8?B?ekFHcXlZMDllK0JhRnVPT1oxbDdMODZndko3WGVHY2pDaFE1Uk9tQUtNYnha?=
 =?utf-8?B?NndkOXdNMGV5ZUlNTlhDaVQ3a3o3MDBJQTRQbXY4VnJUQUZ3RFRMSFFXM3c4?=
 =?utf-8?B?VHB3N1IrRGtvRTF1TDN0SmV0cnpNbjgvTDlUZENNT1RtS3MzeGdzdUJuTEF3?=
 =?utf-8?B?cE5RMjR0V29EbzhDQzlJRjdyV1QxVFZ5VG1SSzVKQnl1QVNJSVpvSmw1bm14?=
 =?utf-8?B?eGFadE5DOFZSYlorWTYxUWxDN0VneTRKelR6YWw4d0xjM3BPanpsRTREdi9K?=
 =?utf-8?B?RXdSNTdXQSsrZlgxcHBzL3gzM0FDMWRsR3paa25WdEN6ZlJxVXljRnR3MnIr?=
 =?utf-8?B?SWZyeG5Vbnp2RTdjVEYyR0ttUTRxWVJ4bkF0K2k4dVhmRm1sTXhxZWZrRXdU?=
 =?utf-8?B?ZVJ3Yjd6ZWlaQWI5SE5MdTRrNlVlcU5Zb2lQaThkOHVjQWx4VWhrM0hsNU9G?=
 =?utf-8?B?M2RLNDBaMFBzaWgzSjh2VXpXclRkd3JDTXZOdGhGNXNOcXo3WUhyd2wrWUZQ?=
 =?utf-8?B?dG1BUThDN1BiT2NnMURsc051WUVJVnVEWFdUNUxEaUdlUHplYmllWUdzZzAx?=
 =?utf-8?B?d2VCa294WE9zYys0bXFLa3pOSGNxdnZtTHptSlpsU3RFQmZLQ2E0Sm5ZU2F4?=
 =?utf-8?B?MUxVM01pODFoU0dnUGZQS1lmTFlrcHM3S3JQZ0lFOFpNdE16YjEwa20wcjFZ?=
 =?utf-8?B?SytuRElmNDBIL1FDU2tkQ296QjU2R2pHWU9INi9nanV0cTg4cFpJSldrOUM0?=
 =?utf-8?B?VTZWUkRvQlJkdXZuTktYOXUybWV0b2V5SFlieU1yZzF0WnNQanR0bjA0NFo0?=
 =?utf-8?B?eWJQbjBjQncxc25Kc3kwbW5NNklYeERDU1F3akxzMFJjc1doajBBOEhJSm1Q?=
 =?utf-8?B?QlFIQUdkazVoTEFoSTlvOUJNc0VaWHV6emx6UTlHSTgrNndCL3Zzd0c5Nm5Z?=
 =?utf-8?B?M2lTdWc3ODQzTzhQMUgxUjl3UUVnVXgrTm5uWmNqczFOL2dYM1NTK3BoeWdO?=
 =?utf-8?B?N21EOUlmVkFVc2pDZXRNZFI3NUQ2UVlGaVRPck4xaGw2WXNrT0JqZVltbzRI?=
 =?utf-8?B?cHdOamRXMkhIbjVDQW9BK3ZXY1hjMnEySHBIR2o5M1VzbnBtamtpcU1ncGkx?=
 =?utf-8?B?VkNodGVJN25wRGwycTRWM0ZGUjFUWjllZ1lDN3FIQ0l3a1MyRGhtUnd5RTZE?=
 =?utf-8?B?REV6MnUrenMrWUZYNVVBbU1SVTAzZkNlUzd1dDRoWFhvU1RPd3ZuRDR0WXdq?=
 =?utf-8?B?NWoxRXFnT3V0b3YvT3JvcnhTNVc0NDBZRkh4cWFpaHFqYVJqVTdpUnE3ZjQz?=
 =?utf-8?B?eExDNml1RWtHdy9qbEVMbmh2NXI1L2Zlb2orNW8rQXQyUTJFMTlJd3J4NW9Z?=
 =?utf-8?B?K2lCdlhlQVlBVWlHNmRDR1hqMEZyaGxoVkVqWllzSWlyb1M5WXVhUDRTSWw0?=
 =?utf-8?B?SnlnU0tCQW5CWXJacWlkZG9FU3l6UnI2Uk45b3lhSXU1VzBGRXZOOTgvZERq?=
 =?utf-8?B?eHdIbE41QWdzZWRQNFhYQmlMZ0J0U201UHFPU3dxK3JaQVY0cUtXcm83aEtq?=
 =?utf-8?B?d1U0dHYramxUWWVwbVBuSGVrVXpqZUJiekRpdWd5ZEJ4VHROd0xYZFo5V0N5?=
 =?utf-8?Q?KwhbbYPYR/3DxkZtt9nUUts=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <70A732F70D63034A88E227FD8E7F5192@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 237d3ba6-ae36-4282-af29-08dd1f72aa88
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Dec 2024 14:45:50.3748 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lIbhI7btT4OkOO9cQ0oOGWhK02jVR2LATubnwng9POnkI6kmAgWMEdORREkZvLacJF1QA4AU00crAQg/vZAzRA3VqhZWiLLI2bZ/WDtnoQY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB8196
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

SGkgQW5kcmV3IQ0KDQpPbiBUdWUsIDIwMjQtMTItMTcgYXQgMDk6NTYgLTA2MDAsIEFuZHJldyBE
YXZpcyB3cm90ZToNCj4gPiArc3RhdGljIGludCBscDg4NjRfZmF1bHRfY2hlY2soc3RydWN0IGxw
ODg2NF9sZWQgKmxlZCkNCj4gPiArew0KPiA+ICsJaW50IHJldCwgaTsNCj4gPiArCXVuc2lnbmVk
IGludCB2YWw7DQo+ID4gKw0KPiA+ICsJcmV0ID0gcmVnbWFwX3JlYWQobGVkLT5yZWdtYXAsIExQ
ODg2NF9TVVBQTFlfU1RBVFVTLCAmdmFsKTsNCj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBl
cnI7DQo+IA0KPiBZb3UgY291bGQgcHJvYmFibHkga2VlcCB0aGlzIHNpbXBsZSBhbmQgcHJpbnQg
dGhlIGV4YWN0IGVycm9yIGhlcmUNCj4gYW5kIHJldHVybiwgdnMgdGhlIGNvbW1vbiBlcnJvciBt
ZXNzYWdlIGF0IHRoZSBlbmQNCg0KVGhpcyB3b3VsZCBtZWFuIDZ4IGRldl9lcnIoKSBpbnN0ZWFk
IG9mIG9uZT8gV2hpbGUgSSBoYXZlIG5vIGlkZWENCndoYXQgd2UgY291bGQgZG8gd2l0aCBpbmRp
dmlkdWFsIGVycm9yIG1lc3NhZ2VzIGhlcmUuDQoNCj4gPiArDQo+ID4gKwkvKiBPZGQgYml0cyBh
cmUgc3RhdHVzIGJpdHMsIGV2ZW4gYml0cyBhcmUgY2xlYXIgYml0cyAqLw0KPiA+ICsJZm9yIChp
ID0gMDsgaSA8IEFSUkFZX1NJWkUobHA4ODY0X3N1cHBseV9zdGF0dXNfbXNnKTsgaSsrKQ0KPiA+
ICsJCWlmICh2YWwgJiBCSVQoaSAqIDIgKyAxKSkNCj4gPiArCQkJZGV2X3dhcm4oJmxlZC0+Y2xp
ZW50LT5kZXYsICIlc1xuIiwgbHA4ODY0X3N1cHBseV9zdGF0dXNfbXNnW2ldKTsNCj4gPiArDQo+
ID4gKwkvKg0KPiA+ICsJICogQ2xlYXIgYml0cyBoYXZlIGFuIGluZGV4IHByZWNlZGluZyB0aGUg
Y29ycmVzcG9uZGluZyBTdGF0dXMgYml0czsNCj4gPiArCSAqIGJvdGggaGF2ZSB0byBiZSB3cml0
dGVuICIxIiBzaW11bHRhbmVvdXNseSB0byBjbGVhciB0aGUgY29ycmVzcG9uZGluZw0KPiA+ICsJ
ICogU3RhdHVzIGJpdC4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHZhbCkNCj4gPiArCQlyZXQgPSBy
ZWdtYXBfd3JpdGUobGVkLT5yZWdtYXAsIExQODg2NF9TVVBQTFlfU1RBVFVTLCB2YWwgPj4gMSB8
IHZhbCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8gZXJyOw0KPiA+ICsNCj4gPiArCXJl
dCA9IHJlZ21hcF9yZWFkKGxlZC0+cmVnbWFwLCBMUDg4NjRfQk9PU1RfU1RBVFVTLCAmdmFsKTsN
Cj4gPiArCWlmIChyZXQpDQo+ID4gKwkJZ290byBlcnI7DQo+ID4gKw0KPiA+ICsJLyogT2RkIGJp
dHMgYXJlIHN0YXR1cyBiaXRzLCBldmVuIGJpdHMgYXJlIGNsZWFyIGJpdHMgKi8NCj4gPiArCWZv
ciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGxwODg2NF9ib29zdF9zdGF0dXNfbXNnKTsgaSsrKQ0K
PiA+ICsJCWlmICh2YWwgJiBCSVQoaSAqIDIgKyAxKSkNCj4gPiArCQkJZGV2X3dhcm4oJmxlZC0+
Y2xpZW50LT5kZXYsICIlc1xuIiwgbHA4ODY0X2Jvb3N0X3N0YXR1c19tc2dbaV0pOw0KPiA+ICsN
Cj4gPiArCWlmICh2YWwpDQo+ID4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKGxlZC0+cmVnbWFwLCBM
UDg4NjRfQk9PU1RfU1RBVFVTLCB2YWwgPj4gMSB8IHZhbCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+
ICsJCWdvdG8gZXJyOw0KPiA+ICsNCj4gPiArCXJldCA9IHJlZ21hcF9yZWFkKGxlZC0+cmVnbWFw
LCBMUDg4NjRfTEVEX1NUQVRVUywgJnZhbCk7DQo+ID4gKwlpZiAocmV0KQ0KPiA+ICsJCWdvdG8g
ZXJyOw0KPiA+ICsNCj4gPiArCS8qDQo+ID4gKwkgKiBDbGVhciBhbHJlYWR5IHJlcG9ydGVkIGZh
dWx0cyB0aGF0IG1haW50YWluIHRoZWlyIHZhbHVlIHVudGlsIGRldmljZQ0KPiA+ICsJICogcG93
ZXItZG93bg0KPiA+ICsJICovDQo+ID4gKwl2YWwgJj0gfmxlZC0+bGVkX3N0YXR1c19tYXNrOw0K
PiA+ICsNCj4gPiArCWZvciAoaSA9IDA7IGkgPCBBUlJBWV9TSVpFKGxwODg2NF9sZWRfc3RhdHVz
X21zZyk7IGkrKykNCj4gPiArCQlpZiAobHA4ODY0X2xlZF9zdGF0dXNfbXNnW2ldICYmIHZhbCAm
IEJJVChpKSkNCj4gPiArCQkJZGV2X3dhcm4oJmxlZC0+Y2xpZW50LT5kZXYsICIlc1xuIiwgbHA4
ODY0X2xlZF9zdGF0dXNfbXNnW2ldKTsNCj4gPiArDQo+ID4gKwkvKg0KPiA+ICsJICogTWFyayB0
aG9zZSB3aGljaCBtYWludGFpbiB0aGVpciB2YWx1ZSB1bnRpbCBkZXZpY2UgcG93ZXItZG93biBh
cw0KPiA+ICsJICogImFscmVhZHkgcmVwb3J0ZWQiDQo+ID4gKwkgKi8NCj4gPiArCWxlZC0+bGVk
X3N0YXR1c19tYXNrIHw9IHZhbCAmIH5MUDg4NjRfTEVEX1NUQVRVU19XUl9NQVNLOw0KPiA+ICsN
Cj4gPiArCS8qDQo+ID4gKwkgKiBPbmx5IGJpdHMgMTQsIDEyLCAxMCBoYXZlIHRvIGJlIGNsZWFy
ZWQgaGVyZSwgYnV0IG90aGVycyBhcmUgUk8sDQo+ID4gKwkgKiB3ZSBkb24ndCBjYXJlIHdoYXQg
d2Ugd3JpdGUgdG8gdGhlbS4NCj4gPiArCSAqLw0KPiA+ICsJaWYgKHZhbCAmIExQODg2NF9MRURf
U1RBVFVTX1dSX01BU0spDQo+ID4gKwkJcmV0ID0gcmVnbWFwX3dyaXRlKGxlZC0+cmVnbWFwLCBM
UDg4NjRfTEVEX1NUQVRVUywgdmFsID4+IDEgfCB2YWwpOw0KPiA+ICsJaWYgKHJldCkNCj4gPiAr
CQlnb3RvIGVycjsNCj4gPiArDQo+ID4gKwlyZXR1cm4gMDsNCj4gPiArDQo+ID4gK2VycjoNCj4g
PiArCWRldl9lcnIoJmxlZC0+Y2xpZW50LT5kZXYsICJGYWlsZWQgdG8gcmVhZC9jbGVhciBmYXVs
dHMgKCVwZSlcbiIsIEVSUl9QVFIocmV0KSk7DQo+ID4gKw0KPiA+ICsJcmV0dXJuIHJldDsNCj4g
PiArfQ0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3LnNpZW1lbnMu
Y29tDQo=
